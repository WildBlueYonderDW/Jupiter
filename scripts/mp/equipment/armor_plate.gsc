// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\hud_message.gsc;

#namespace armor_plate;

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0x118
function br_armor_plate_used() {
    /#
        assert(isdefined(self.br_maxarmorhealth) && self.br_maxarmorhealth > 0);
    #/
    var_25959711eb415f96 = namespace_1a507865f681850e::getequipmentslotammo("health");
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
    namespace_1a507865f681850e::decrementequipmentslotammo("health", 1);
    namespace_aad14af462a74d08::onuseitem("armor_plate");
    self notify("armor_plate_inserted");
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec
// Size: 0xaa
function br_armor_plate_broken_remove() {
    var_830009cefce35a66 = self.br_armorhealth + 5;
    var_1c07ef7bc0e3723a = clamp(var_830009cefce35a66, 0, self.br_maxarmorhealth);
    var_43167c86311c997e = max(1, getdvarint(@"hash_5cea4fc8adfef297", 50));
    var_1c07ef7bc0e3723a = int(var_1c07ef7bc0e3723a / var_43167c86311c997e) * var_43167c86311c997e;
    var_517c920ec0a48022 = clamp(var_1c07ef7bc0e3723a, 0, self.br_maxarmorhealth);
    if (var_517c920ec0a48022 >= self.br_armorhealth) {
        return;
    } else {
        self.br_armorhealth = var_517c920ec0a48022;
    }
    br_armor_plate_amount_equipped_set(self.br_armorhealth);
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d
// Size: 0x146
function br_armor_plate_amount_equipped_set(var_d16569f10048fce9) {
    self setclientomnvar("ui_armor_percent", int(var_d16569f10048fce9));
    namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("armorHealthRatio", int(var_d16569f10048fce9));
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || !isdefined(self.team)) {
        return;
    }
    var_607da387f3617ed1 = level.teamdata[self.team]["players"];
    if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
        var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
    }
    foreach (player in var_607da387f3617ed1) {
        player setclientomnvar("ui_armor_squad_index_" + squadmemberindex, int(var_d16569f10048fce9));
    }
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ea
// Size: 0xb1
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
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("", self);
    streakinfo.armorweapon = weaponobj;
    br_toggle_armor_allows(1);
    thread br_watch_armor_cancel_notifys();
    var_41bf9bf4918115ac = namespace_b3d24e921998a8b::switchtodeployweapon(weaponobj, streakinfo, &br_insert_armor, undefined, undefined, undefined, undefined, 0);
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2
// Size: 0x6f
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

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x718
// Size: 0xc7
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

// Namespace armor_plate/namespace_53700d7451202c81
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e6
// Size: 0xa7
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
        val::function_c9d0b43701bdba00("using_armor");
    }
    self.insertingarmorplate = var_e12d78c11d85d9c2;
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x894
// Size: 0x1ba
function br_insert_armor(streakinfo) {
    self endon("disconnect");
    self endon("br_armor_repair_end");
    if (!br_is_allowed_armor_insert() || istrue(self.stoparmorinsert)) {
        return;
    }
    currenttime = gettime();
    var_796ba59fc6c2ac9b = currenttime + 1860;
    var_3f536cbd3a3c3591 = 2000;
    var_fd3a2bb4c34a405c = 1860;
    var_48115c25c4a06354 = 0;
    while (currenttime < var_796ba59fc6c2ac9b) {
        if (!isdefined(streakinfo.armorweapon) || streakinfo.armorweapon != self getcurrentweapon()) {
            return;
        }
        waitframe();
        currenttime = gettime();
    }
    br_armor_plate_used();
    var_4d5f2c05f11db0ec = (var_3f536cbd3a3c3591 - var_fd3a2bb4c34a405c) / 1000;
    wait(var_4d5f2c05f11db0ec);
    while (br_should_continue_adding_armor()) {
        itemname = self.equipment["health"];
        itemcount = namespace_1a507865f681850e::getequipmentslotammo("health");
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
            wait(var_cf97caf9e7ec424);
        } else {
            break;
        }
    }
    self notify("br_armor_plate_done");
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa55
// Size: 0xec
function br_is_allowed_armor_insert() {
    if (isdefined(self.vehicle)) {
        seat = namespace_1fbd40990ee60ede::vehicle_occupancy_getoccupantseat(self.vehicle, self);
        if (seat == "driver") {
            return 0;
        }
    }
    var_3ce512f8af7753d7 = self isskydiving() || self isonladder() || self isswimming();
    var_e5740a4d65964259 = namespace_f8065cafc523dba5::function_b7869f6d9d4242e3(self) || istrue(self.isjuggernaut) || namespace_85d036cb78063c4a::issuperinuse() && self.super.staticdata.ref != "super_deadsilence";
    if (var_3ce512f8af7753d7 || var_e5740a4d65964259) {
        return 0;
    }
    if (self.br_armorhealth == self.br_maxarmorhealth) {
        namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyarmorfull);
        return 0;
    }
    return 1;
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb49
// Size: 0x48
function br_should_continue_adding_armor() {
    var_a5ea2300efaaa6a7 = is_player_gamepad_enabled() && self weaponswitchbuttonpressed();
    var_1d20666098baa9f9 = isdefined(self.armorqueued) && self.armorqueued > 0;
    return var_a5ea2300efaaa6a7 || var_1d20666098baa9f9;
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb99
// Size: 0x69
function br_add_player_commands() {
    self notifyonplayercommand("br_try_armor_cancel", "+weapnext");
    self notifyonplayercommand("br_try_armor_cancel", "+weapprev");
    self notifyonplayercommand("br_try_armor_cancel", "+attack");
    self notifyonplayercommand("br_try_armor_cancel", "+smoke");
    self notifyonplayercommand("br_try_armor_cancel", "+frag");
    self notifyonplayercommand("br_try_armor_cancel", "+melee_zoom");
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc09
// Size: 0x69
function br_remove_player_commands() {
    self notifyonplayercommandremove("br_try_armor_cancel", "+weapnext");
    self notifyonplayercommandremove("br_try_armor_cancel", "+weapprev");
    self notifyonplayercommandremove("br_try_armor_cancel", "+attack");
    self notifyonplayercommandremove("br_try_armor_cancel", "+smoke");
    self notifyonplayercommandremove("br_try_armor_cancel", "+frag");
    self notifyonplayercommandremove("br_try_armor_cancel", "+melee_zoom");
}

// Namespace armor_plate/namespace_53700d7451202c81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc79
// Size: 0x7f
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

