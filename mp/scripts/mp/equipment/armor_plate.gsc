#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\utility;
#using scripts\mp\equipment;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\hud_message;
#using scripts\mp\supers;
#using scripts\mp\utility\game;
#using scripts\mp\utility\player;

#namespace armor_plate;

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355
// Size: 0x115
function br_armor_plate_used() {
    assert(isdefined(self.br_maxarmorhealth) && self.br_maxarmorhealth > 0);
    var_25959711eb415f96 = scripts\mp\equipment::getequipmentslotammo("health");
    if (var_25959711eb415f96 <= 0) {
        return;
    }
    if (self isparachuting()) {
        self notify("br_try_armor_cancel");
        return;
    }
    if (isdefined(self.armorqueued)) {
        self.armorqueued--;
    }
    var_830009cefce35a66 = self.br_armorhealth + 5;
    var_1c07ef7bc0e3723a = clamp(var_830009cefce35a66, 0, self.br_maxarmorhealth);
    var_43167c86311c997e = max(1, getdvarint(@"hash_5cea4fc8adfef297", 50));
    var_1c07ef7bc0e3723a = int(var_1c07ef7bc0e3723a / var_43167c86311c997e) * var_43167c86311c997e + var_43167c86311c997e;
    self.br_armorhealth = clamp(var_1c07ef7bc0e3723a, 0, self.br_maxarmorhealth);
    br_armor_plate_amount_equipped_set(self.br_armorhealth);
    scripts\mp\equipment::decrementequipmentslotammo("health", 1);
    scripts\cp_mp\challenges::onuseitem("armor_plate");
    self notify("armor_plate_inserted");
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x472
// Size: 0xa7
function br_armor_plate_broken_remove() {
    var_830009cefce35a66 = self.br_armorhealth + 5;
    var_1c07ef7bc0e3723a = clamp(var_830009cefce35a66, 0, self.br_maxarmorhealth);
    var_43167c86311c997e = max(1, getdvarint(@"hash_5cea4fc8adfef297", 50));
    var_1c07ef7bc0e3723a = int(var_1c07ef7bc0e3723a / var_43167c86311c997e) * var_43167c86311c997e;
    armorafter = clamp(var_1c07ef7bc0e3723a, 0, self.br_maxarmorhealth);
    if (armorafter >= self.br_armorhealth) {
        return;
    } else {
        self.br_armorhealth = armorafter;
    }
    br_armor_plate_amount_equipped_set(self.br_armorhealth);
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x521
// Size: 0x142
function br_armor_plate_amount_equipped_set(armorvalue) {
    self setclientomnvar("ui_armor_percent", int(armorvalue));
    scripts\mp\gametypes\br_public::updatebrscoreboardstat("armorHealthRatio", int(armorvalue));
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || !isdefined(self.team)) {
        return;
    }
    squadmates = level.teamdata[self.team]["players"];
    if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.sessionsquadid])) {
        squadmates = level.squaddata[self.team][self.sessionsquadid].players;
    }
    foreach (player in squadmates) {
        player setclientomnvar("ui_armor_squad_index_" + squadmemberindex, int(armorvalue));
    }
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66b
// Size: 0xaf
function br_use_armor_plate(item, itemcount) {
    self endon("disconnect");
    if (itemcount == 0) {
        return;
    } else if (istrue(self.insertingarmorplate)) {
        return;
    } else if (self isswitchingweapon()) {
        return;
    }
    if (!br_is_allowed_armor_insert()) {
        return;
    }
    weaponobj = makeweapon("armor_plate_deploy_mp");
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo("", self);
    streakinfo.armorweapon = weaponobj;
    br_toggle_armor_allows(1);
    thread br_watch_armor_cancel_notifys();
    switchresult = scripts\cp_mp\killstreaks\killstreakdeploy::switchtodeployweapon(weaponobj, streakinfo, &br_insert_armor, undefined, undefined, undefined, undefined, 0);
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x722
// Size: 0x6e
function br_watch_armor_cancel_notifys() {
    self endon("br_armor_repair_end");
    self endon("disconnect");
    br_add_player_commands();
    thread br_watch_armor_weapon();
    self.stoparmorinsert = 0;
    waittill_any_7("death", "mantle_start", "last_stand_start", "scr_change_swim_state", "special_weapon_fired", "br_try_armor_cancel", "br_armor_plate_done");
    self notify("cancel_all_killstreak_deployments");
    self.stoparmorinsert = 1;
    thread br_armor_repair_end();
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x798
// Size: 0xc6
function br_watch_armor_weapon() {
    self endon("disconnect");
    self endon("br_armor_repair_end");
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename != "armor_plate_deploy_mp") {
        if (self isonladder()) {
            self notify("br_try_armor_cancel");
        }
        waitframe();
    }
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "armor_plate_deploy_mp") {
        if (self isonladder()) {
            self notify("br_try_armor_cancel");
        }
        waitframe();
    }
    self notify("br_try_armor_cancel");
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x866
// Size: 0xa6
function br_toggle_armor_allows(var_e12d78c11d85d9c2) {
    if (var_e12d78c11d85d9c2) {
        val::set("using_armor", "melee", 0);
        val::set("using_armor", "killstreaks", 0);
        val::set("using_armor", "crate_use", 0);
        val::set("using_armor", "equipment_primary", 0);
        val::set("using_armor", "equipment_secondary", 0);
        val::set("using_armor", "offhand_weapons", 0);
        val::set("using_armor", "offhand_throwback", 0);
    } else {
        val::reset_all("using_armor");
    }
    self.insertingarmorplate = var_e12d78c11d85d9c2;
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x914
// Size: 0x1b1
function br_insert_armor(streakinfo) {
    self endon("disconnect");
    self endon("br_armor_repair_end");
    if (!br_is_allowed_armor_insert() || istrue(self.stoparmorinsert)) {
        return;
    }
    currenttime = gettime();
    var_796ba59fc6c2ac9b = currenttime + 1860;
    var_3f536cbd3a3c3591 = 2000;
    armorendtime = 1860;
    var_48115c25c4a06354 = 0;
    while (currenttime < var_796ba59fc6c2ac9b) {
        if (!isdefined(streakinfo.armorweapon) || streakinfo.armorweapon != self getcurrentweapon()) {
            return;
        }
        waitframe();
        currenttime = gettime();
    }
    br_armor_plate_used();
    var_4d5f2c05f11db0ec = (var_3f536cbd3a3c3591 - armorendtime) / 1000;
    wait var_4d5f2c05f11db0ec;
    while (br_should_continue_adding_armor()) {
        itemname = self.equipment["health"];
        itemcount = scripts\mp\equipment::getequipmentslotammo("health");
        if (isdefined(itemname) && isdefined(itemcount) && itemcount > 0 && self.br_armorhealth < self.br_maxarmorhealth) {
            var_bef0447316d92bfd = gettime() + 1250;
            while (gettime() < var_bef0447316d92bfd) {
                if (!isdefined(streakinfo.armorweapon) || streakinfo.armorweapon != self getcurrentweapon()) {
                    return;
                }
                waitframe();
            }
            br_armor_plate_used();
            var_cf97caf9e7ec424 = (1500 - 1250) / 1000;
            wait var_cf97caf9e7ec424;
            continue;
        }
        break;
    }
    self notify("br_armor_plate_done");
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacd
// Size: 0xea
function br_is_allowed_armor_insert() {
    if (isdefined(self.vehicle)) {
        seat = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getoccupantseat(self.vehicle, self);
        if (seat == "driver") {
            return false;
        }
    }
    var_3ce512f8af7753d7 = self isskydiving() || self isonladder() || self isswimming();
    var_e5740a4d65964259 = scripts\cp_mp\utility\player_utility::function_b7869f6d9d4242e3(self) || istrue(self.isjuggernaut) || scripts\mp\supers::issuperinuse() && self.super.staticdata.ref != "super_deadsilence";
    if (var_3ce512f8af7753d7 || var_e5740a4d65964259) {
        return false;
    }
    if (self.br_armorhealth == self.br_maxarmorhealth) {
        scripts\mp\hud_message::showerrormessage(level.br_pickups.br_pickupdenyarmorfull);
        return false;
    }
    return true;
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc0
// Size: 0x47
function br_should_continue_adding_armor() {
    var_a5ea2300efaaa6a7 = is_player_gamepad_enabled() && self weaponswitchbuttonpressed();
    hasarmorqueue = isdefined(self.armorqueued) && self.armorqueued > 0;
    return var_a5ea2300efaaa6a7 || hasarmorqueue;
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc10
// Size: 0x68
function br_add_player_commands() {
    self notifyonplayercommand("br_try_armor_cancel", "+weapnext");
    self notifyonplayercommand("br_try_armor_cancel", "+weapprev");
    self notifyonplayercommand("br_try_armor_cancel", "+attack");
    self notifyonplayercommand("br_try_armor_cancel", "+smoke");
    self notifyonplayercommand("br_try_armor_cancel", "+frag");
    self notifyonplayercommand("br_try_armor_cancel", "+melee_zoom");
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc80
// Size: 0x68
function br_remove_player_commands() {
    self notifyonplayercommandremove("br_try_armor_cancel", "+weapnext");
    self notifyonplayercommandremove("br_try_armor_cancel", "+weapprev");
    self notifyonplayercommandremove("br_try_armor_cancel", "+attack");
    self notifyonplayercommandremove("br_try_armor_cancel", "+smoke");
    self notifyonplayercommandremove("br_try_armor_cancel", "+frag");
    self notifyonplayercommandremove("br_try_armor_cancel", "+melee_zoom");
}

// Namespace armor_plate / scripts\mp\equipment\armor_plate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf0
// Size: 0x7e
function br_armor_repair_end() {
    self endon("disconnect");
    self notify("br_armor_repair_end");
    br_remove_player_commands();
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "armor_plate_deploy_mp") {
        waitframe();
    }
    waitframe();
    if (istrue(self.armorqueued)) {
        self.armorqueued = 0;
    }
    br_toggle_armor_allows(0);
}

