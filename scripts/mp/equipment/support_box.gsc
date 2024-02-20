// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\weapons.gsc;
#using script_5762ac2f22202ba2;
#using script_3b64eb40368c1450;
#using scripts\common\interactive.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\hud_message.gsc;
#using script_1ed1214969b5eba7;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\hostmigration.gsc;

#namespace namespace_1ceda47cf370258e;

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9
// Size: 0x17c
function supportbox_init() {
    level.allsupportboxes = [];
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&supportbox_usedcallback, "super_ammo_drop");
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&supportbox_usedcallback, "equip_armorbox");
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&supportbox_usedcallback, "equip_utilitybox");
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&supportbox_usedcallback, "equip_blastshieldbox");
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&supportbox_usedcallback, "equip_leaderbox");
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&supportbox_usedcallback, "equip_self_revive_box");
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&supportbox_updateheadicononjointeam);
    var_cc0b794a12ecffd4 = level.superglobals.staticsuperdata["super_ammo_drop"].bundle;
    var_5249bf270d77e3d6 = function_53c4c53197386572(var_cc0b794a12ecffd4.var_eba192e71b949449, "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    level.var_97e8a4fa1b27c25e = getdvarint(@"hash_cd6c28f6b1678c3f", 1);
    level._effect[var_5249bf270d77e3d6] = loadfx(var_5249bf270d77e3d6);
    level._effect["vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx"] = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx");
    level._effect["vfx/iw9/prop/scriptables/vfx_offhand_2h_vm_self_revive_box_v0_timeout.vfx"] = loadfx("vfx/iw9/prop/scriptables/vfx_offhand_2h_vm_self_revive_box_v0_timeout.vfx");
    level._effect["vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx"] = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx");
    if (!isdefined(level.onarmorboxusedbyplayer) && issharedfuncdefined("armor_drop", "init")) {
        [[ getsharedfunc("armor_drop", "init") ]]();
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96c
// Size: 0x67
function supportbox_updateheadicononjointeam(player) {
    foreach (supportbox in level.allsupportboxes) {
        if (isdefined(supportbox)) {
            supportbox supportbox_updateheadicon(player);
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9da
// Size: 0x2fd
function box_used_common_setup(grenade, equipmentname, superid, headicon) {
    grenade endon("death");
    grenade.issuper = 1;
    staticsuperdata = level.superglobals.staticsuperdata[superid];
    grenade.superid = staticsuperdata.id;
    grenade.lifetime = staticsuperdata.bundle.lifetime;
    if (isdefined(grenade.lifetime) && grenade.lifetime > 0) {
        grenade thread supportbox_watchdisownedtimeout();
    }
    grenade thread supportbox_hideandshowaftertime();
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            namespace_85d036cb78063c4a::refundsuper();
            namespace_44abc05161e2e2cb::showerrormessage("EQUIPMENT/PLANT_FAILED");
            grenade delete();
            return;
        }
    }
    grenade supportbox_handlemovingplatforms(stuckto);
    if (1) {
        thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(grenade);
    }
    grenade.bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3(superid);
    namespace_3bbb5a98b932c46f::onequipmentplanted(grenade, equipmentname, &supportbox_destroy);
    level.allsupportboxes[grenade getentitynumber()] = grenade;
    grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&supportbox_empapplied);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&supportbox_empapplied);
    }
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_f7bd40787418df02);
    grenade function_49197cd063a740ea(&supportbox_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
        }
    }
    if (!istrue(grenade.madedamageable)) {
        grenade supportbox_makedamageable();
    }
    grenade.makedamageable = undefined;
    grenade setscriptablepartstate("visibility", "show", 0);
    if (!istrue(level.var_97e8a4fa1b27c25e)) {
        wait(0);
    }
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        grenade supportbox_addheadicon(headicon);
    }
    if (!istrue(level.var_97e8a4fa1b27c25e)) {
        wait(0.75);
        grenade setscriptablepartstate("effects", "plant", 0);
        grenade setscriptablepartstate("anims", "open", 0);
        wait(grenade supportbox_getdeployanimduration());
    }
    grenade setscriptablepartstate("beacon", "active", 0);
    grenade setscriptablepartstate("anims", "openIdle", 0);
    thread monitordisownedequipment(self, grenade);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcde
// Size: 0xa0
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == hitent) {
                return 1;
            } else if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd86
// Size: 0x29c
function supportbox_used(grenade) {
    grenade endon("death");
    var_cc0b794a12ecffd4 = level.superglobals.staticsuperdata["super_ammo_drop"].bundle;
    var_1d40e40dab99437e = function_53c4c53197386572(var_cc0b794a12ecffd4.var_eba192e71b949449, "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    equipname = "super_ammo_drop";
    var_5237a188ccda4d7b = "super_ammo_drop";
    headicon = "hud_icon_fieldupgrade_ammo_box";
    var_598ba2bc14718181 = "EQUIPMENT_HINTS/SUPPORT_BOX_USE";
    if (isdefined(grenade.equipmentref)) {
        switch (grenade.equipmentref) {
        case #"hash_91076f076ee682f4":
            var_1d40e40dab99437e = "vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx";
            equipname = "equip_armorbox";
            var_5237a188ccda4d7b = "super_armor_drop";
            headicon = "hud_icon_fieldupgrade_armor_box";
            var_598ba2bc14718181 = "EQUIPMENT_HINTS/ARMOR_BOX_USE";
            break;
        case #"hash_b3d0752364b0193d":
            var_1d40e40dab99437e = "vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx";
            equipname = "equip_utilitybox";
            var_5237a188ccda4d7b = "super_utility_drop";
            headicon = "hud_icon_fieldupgrade_armor_box";
            var_598ba2bc14718181 = "EQUIPMENT_HINTS/UTILITY_BOX_USE";
            break;
        case #"hash_187c7d31342c1d7c":
            var_1d40e40dab99437e = "vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx";
            equipname = "equip_blastshieldbox";
            var_5237a188ccda4d7b = "super_blastshield_drop";
            headicon = "hud_icon_equipment_blastshield_box";
            var_598ba2bc14718181 = "EQUIPMENT_HINTS/BLASTSHIELD_BOX_USE";
            break;
        case #"hash_cf0bf67369c3ff42":
            var_1d40e40dab99437e = "vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx";
            equipname = "equip_leaderbox";
            var_5237a188ccda4d7b = "super_leader_drop";
            headicon = "hud_icon_fieldupgrade_armor_box";
            var_598ba2bc14718181 = "EQUIPMENT_HINTS/SELF_REVIVE_BOX_USE";
            self setclientomnvar("ui_squad_leader_pack_dropped", 1);
            var_96674628376eaba6 = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team, 0);
            foreach (teammate in var_96674628376eaba6) {
                teammate setclientomnvar("ui_squad_leader_pack_dropped", 1);
            }
            break;
        case #"hash_bdd285c401cf9498":
            var_1d40e40dab99437e = "vfx/iw9/prop/scriptables/vfx_offhand_2h_vm_self_revive_box_v0_timeout.vfx";
            equipname = "equip_self_revive_box";
            var_5237a188ccda4d7b = "super_self_revive_box";
            headicon = "hud_icon_fieldupgrade_self_revive_box";
            var_598ba2bc14718181 = "EQUIPMENT_HINTS/SELF_REVIVE_BOX_USE";
            break;
        }
    }
    grenade.timeoutvfxname = var_1d40e40dab99437e;
    box_used_common_setup(grenade, equipname, var_5237a188ccda4d7b, headicon);
    grenade thread supportbox_makeusable(equipname, var_598ba2bc14718181);
    if (var_5237a188ccda4d7b == "super_armor_drop" || var_5237a188ccda4d7b == "super_ammo_drop") {
        namespace_aad14af462a74d08::function_d997435895422ecc(var_5237a188ccda4d7b, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0x6c
function supportbox_hideandshowaftertime(time) {
    self endon("death");
    self endon("missile_stuck");
    var_722684af55e05749 = getdvarfloat(@"hash_ed9a51db36904e30", 0);
    self setscriptablepartstate("visibility", "hide", 0);
    wait(var_722684af55e05749);
    self.madedamageable = 1;
    supportbox_makedamageable();
    self setscriptablepartstate("visibility", "show", 0);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109c
// Size: 0xa5
function supportbox_unset() {
    if (0) {
        foreach (var_6dc86f1ebed6034c in self.plantedsuperequip) {
            if (var_6dc86f1ebed6034c.equipmentref == "super_ammo_drop" || var_6dc86f1ebed6034c.equipmentref == "equip_armorbox" || var_6dc86f1ebed6034c.equipmentref == "equip_leaderbox") {
                var_6dc86f1ebed6034c thread supportbox_destroy(1);
                namespace_3bbb5a98b932c46f::removeequip(var_6dc86f1ebed6034c);
            }
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1148
// Size: 0x216
function supportbox_destroy(immediate, var_4fac8b8ce36e09f1, var_d3f5ceb48370a22a) {
    if (!isdefined(immediate)) {
        immediate = !istrue(self.planted);
    }
    var_cc0b794a12ecffd4 = level.superglobals.staticsuperdata["super_ammo_drop"].bundle;
    timeoutvfxname = function_53c4c53197386572(var_cc0b794a12ecffd4.var_eba192e71b949449, "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    if (isdefined(self.timeoutvfxname)) {
        timeoutvfxname = self.timeoutvfxname;
    }
    closetime = 0;
    if (istrue(var_d3f5ceb48370a22a)) {
        closetime = supportbox_getcloseanimduration();
    }
    var_cbf7be4f62a0ddb2 = 0;
    if (!istrue(immediate)) {
        var_cbf7be4f62a0ddb2 = 0.1;
    }
    thread supportbox_delete(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1);
    moving_platform = undefined;
    var_34a47d4b8f3a4596 = undefined;
    if (isdefined(self)) {
        fxorigin = self.origin;
        var_92246546867d1d04 = anglestoforward(self.angles);
        fxup = anglestoup(self.angles);
        var_dfdfaa4e665b31fc = self getlinkedparent();
        if (isdefined(var_dfdfaa4e665b31fc)) {
            moving_platform = var_dfdfaa4e665b31fc;
            var_34a47d4b8f3a4596 = moving_platform.origin - fxorigin;
        }
        self setscriptablepartstate("beacon", "neutral", 0);
        self setscriptablepartstate("hacked", "neutral", 0);
        if (istrue(var_d3f5ceb48370a22a)) {
            self setscriptablepartstate("anims", "close", 0);
            wait(closetime);
            self setscriptablepartstate("anims", "closedIdle", 0);
            wait(1);
        }
        if (isdefined(moving_platform) && isent(moving_platform)) {
            fxorigin = moving_platform.origin - var_34a47d4b8f3a4596;
        }
        if (self.equipmentref == "super_ammo_drop") {
            self setscriptablepartstate("effects", "destroy", 0);
        } else {
            playfx(namespace_3c37cb17ade254d::getfx(timeoutvfxname), fxorigin, var_92246546867d1d04, fxup);
            playsoundatpos(fxorigin, "mp_equip_box_destroyed");
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1365
// Size: 0x18e
function supportbox_delete(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    self.isdestroyed = 1;
    self setcandamage(0);
    if (isdefined(self.owner)) {
        self.owner removeequip(self);
    }
    supportbox_removeheadicon();
    supportbox_makeunusable();
    var_5237a188ccda4d7b = "super_ammo_drop";
    if (isdefined(self.equipmentref) && self.equipmentref == "equip_armorbox") {
        var_5237a188ccda4d7b = "super_armor_drop";
    } else if (isdefined(self.equipmentref) && self.equipmentref == "equip_utilitybox") {
        var_5237a188ccda4d7b = "super_utility_drop";
    } else if (isdefined(self.equipmentref) && self.equipmentref == "equip_blastshieldbox") {
        var_5237a188ccda4d7b = "super_blastshield_drop";
    } else if (isdefined(self.equipmentref) && self.equipmentref == "equip_leaderbox") {
        var_5237a188ccda4d7b = "super_leader_drop";
    }
    if (var_5237a188ccda4d7b == "super_armor_drop" || var_5237a188ccda4d7b == "super_ammo_drop") {
        self.owner namespace_aad14af462a74d08::function_d997435895422ecc(var_5237a188ccda4d7b, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
    }
    namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fa
// Size: 0x8e
function supportbox_makeusable(equipmentname, hintstring) {
    namespace_ad136f1d5091df4a::interactive_addusedcallbacktoentity(equipmentname);
    self.playersused = [];
    self.usedcount = 0;
    self makeusable();
    self setusepriority(-1);
    self enablemissilehint(1);
    self setcursorhint("HINT_NOICON");
    self sethintstring(hintstring);
    self setuserange(128);
    self setuseholdduration("duration_short");
    self sethintrequiresholding(0);
    self sethinttag("tag_use");
    thread supportbox_watchallplayeruse();
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158f
// Size: 0x23
function supportbox_makeunusable() {
    self notify("supportBox_makeUnusable");
    namespace_ad136f1d5091df4a::interactive_removeusedcallbackfromentity();
    self makeunusable();
    self.playersused = undefined;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b9
// Size: 0x4c
function supportbox_watchallplayeruse() {
    self endon("death");
    self endon("supportBox_makeUnusable");
    var_47facc6abff4fd71 = gettime();
    while (1) {
        supportbox_updateplayersused();
        if (gettime() >= var_47facc6abff4fd71) {
            supportbox_updateplayerusevisibility();
            var_47facc6abff4fd71 = gettime() + 150;
        }
        waitframe();
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160c
// Size: 0x87
function supportbox_updateplayerusevisibility() {
    var_ef269077a28646eb = utility::playersnear(self.origin, 300);
    foreach (player in var_ef269077a28646eb) {
        if (isdefined(player)) {
            if (!supportbox_playercanuse(player)) {
                self disableplayeruse(player);
            } else {
                self enableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169a
// Size: 0x94
function supportbox_updateplayersused() {
    foreach (player in self.playersused) {
        if (isdefined(player)) {
            entnum = player getentitynumber();
            if (!namespace_7e17181d03156026::isreallyalive(player) && isdefined(self.playersused[entnum])) {
                self.playersused[entnum] = undefined;
                supportbox_updateheadicon(player);
            }
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1735
// Size: 0x56
function supportbox_playercanuse(player) {
    if (!namespace_7e17181d03156026::isreallyalive(player)) {
        return 0;
    }
    if (!player val::get("crate_use")) {
        return 0;
    }
    if (isdefined(self.playersused[player getentitynumber()])) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::playersareenemies(player, self.owner)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1793
// Size: 0x317
function supportbox_onplayeruse(player) {
    if (!isdefined(self.equipmentref)) {
        /#
            /#
                assertmsg("hud_icon_fieldupgrade_armor_box");
            #/
        #/
        return;
    }
    if (self.equipmentref == "equip_blastshieldbox") {
        player namespace_82dcd1d5ae30ff7::giveperk("specialty_blastshield");
        player hudicontype("blastshield_box");
    } else {
        var_12a372e8caa042bb = player.primaryweapons;
        foreach (weaponobj in var_12a372e8caa042bb) {
            if (namespace_68e641469fde3fa7::ismeleeonly(weaponobj) || namespace_68e641469fde3fa7::issuperweapon(weaponobj) || namespace_e0ee43ef2dddadaa::iskillstreakweapon(weaponobj) || namespace_68e641469fde3fa7::isgamemodeweapon(weaponobj)) {
                continue;
            }
            var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(weaponobj);
            var_662b420c8b2fcb2d = undefined;
            if (namespace_68e641469fde3fa7::issinglehitweapon(weaponobj)) {
                var_662b420c8b2fcb2d = 1;
            } else if (var_cf4209c200f8bbf4 == "weapon_sniper") {
                var_662b420c8b2fcb2d = 1.5;
            } else {
                var_662b420c8b2fcb2d = 3;
            }
            if (istrue(weaponobj.hasalternate)) {
                var_6890a4ce965bba99 = weaponobj getaltweapon();
                var_91093ef03654702c = weaponclass(var_6890a4ce965bba99);
                if (var_91093ef03654702c == "grenade") {
                    addammo = namespace_3bbb5a98b932c46f::getammooverride(var_6890a4ce965bba99);
                    stockammo = player getweaponammostock(var_6890a4ce965bba99);
                    newammo = int(stockammo + addammo);
                    player setweaponammostock(var_6890a4ce965bba99, newammo);
                } else if (var_6890a4ce965bba99.type == "bullet") {
                    if (var_91093ef03654702c == "spread") {
                        addammo = namespace_3bbb5a98b932c46f::getammooverride(var_6890a4ce965bba99);
                        stockammo = player getweaponammostock(var_6890a4ce965bba99);
                        newammo = int(stockammo + addammo);
                        player setweaponammostock(var_6890a4ce965bba99, newammo);
                    }
                } else {
                    addammo = namespace_3bbb5a98b932c46f::getammooverride(var_6890a4ce965bba99);
                    stockammo = player getweaponammostock(var_6890a4ce965bba99);
                    newammo = int(stockammo + addammo);
                    player setweaponammostock(var_6890a4ce965bba99, newammo);
                }
            }
            var_2be3302e3767cc7d = weaponclipsize(weaponobj);
            addammo = namespace_3bbb5a98b932c46f::getammooverride(weaponobj) * var_662b420c8b2fcb2d;
            addammo = max(var_2be3302e3767cc7d, addammo);
            stockammo = player getweaponammostock(weaponobj);
            newammo = int(stockammo + addammo);
            if (weaponmaxammo(weaponobj) <= player getweaponammostock(weaponobj)) {
                continue;
            }
            player setweaponammostock(weaponobj, newammo);
        }
        primary = player namespace_1a507865f681850e::getcurrentequipment("primary");
        if (isdefined(primary)) {
            player namespace_1a507865f681850e::incrementequipmentammo(primary, function_bea6f988c3fbb7a1(primary));
        }
        secondary = player namespace_1a507865f681850e::getcurrentequipment("secondary");
        if (isdefined(secondary)) {
            player namespace_1a507865f681850e::incrementequipmentammo(secondary, function_bea6f988c3fbb7a1(secondary));
        }
        player hudicontype("ammobox");
    }
    supportbox_playusesound(player);
    thread supportbox_onplayeruseanim();
    self.var_ee55bd57abd7930b = 1;
    return 1;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab2
// Size: 0x45
function function_bea6f988c3fbb7a1(var_1189bd7fbe2861f8) {
    var_930290d7f474a0ae = 1;
    switch (var_1189bd7fbe2861f8) {
    case #"hash_61206775eae1c854":
        var_930290d7f474a0ae = 3;
        break;
    default:
        break;
    }
    return var_930290d7f474a0ae;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aff
// Size: 0x91
function supportbox_playusesound(player) {
    if (isdefined(player)) {
        if (isdefined(self.equipmentref) && self.equipmentref == "equip_armorbox" || self.equipmentref == "equip_blastshieldbox") {
            player playsoundtoplayer("iw9_armor_crate_use", player);
        } else if (isdefined(self.equipmentref) && self.equipmentref == "equip_leaderbox") {
            player playsoundtoplayer("iw9_armor_crate_use", player);
        } else {
            player playsoundtoplayer("ammo_crate_use", player);
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b97
// Size: 0x58
function supportbox_onplayeruseanim() {
    self endon("death");
    if (istrue(self.onuseanimplaying)) {
        return;
    }
    self setscriptablepartstate("anims", "openUse", 0);
    self.onuseanimplaying = 1;
    wait(supportbox_getuseanimduration());
    self setscriptablepartstate("anims", "openIdle", 0);
    self.onuseanimplaying = undefined;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf6
// Size: 0x76
function supportbox_makedamageable() {
    if (isdefined(self.equipmentref)) {
        if (self.equipmentref == "equip_leaderbox") {
            return;
        }
    }
    bundle = self.bundle;
    var_b28c788c46e9a6 = 100;
    if (isdefined(bundle)) {
        var_b28c788c46e9a6 = function_53c4c53197386572(bundle.var_e53ecfd9f4fef4fa, 100);
    }
    thread namespace_3e725f3cc58bddd3::monitordamage(var_b28c788c46e9a6, "hitequip", &supportbox_handlefataldamage, &supportbox_handledamage);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c73
// Size: 0x116
function supportbox_handledamage(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 0;
    }
    var_10d243b75ec6d6ae = !isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, data.attacker);
    hits = undefined;
    if (isexplosivedamagemod(data.meansofdeath)) {
        hits = supportbox_explosivedamagetohits(data, var_10d243b75ec6d6ae);
    } else if (isbulletdamage(data.meansofdeath)) {
        hits = supportbox_bulletdamagetohits(data, var_10d243b75ec6d6ae);
    }
    if (isdefined(hits)) {
        hitstokill = function_53c4c53197386572(self.bundle.var_3b2a936a383dc038, 5);
        if (var_10d243b75ec6d6ae) {
            hitstokill = function_53c4c53197386572(self.bundle.var_363b330e28b6e214, 5);
        }
        return int(ceil(min(1, hits / hitstokill) * self.maxhealth));
    }
    return data.damage;
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d91
// Size: 0x3d
function supportbox_handlefataldamage(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    supportbox_givepointsfordeath(data.attacker);
    thread supportbox_destroy(0, 1, 0);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd5
// Size: 0x96
function supportbox_bulletdamagetohits(data, var_10d243b75ec6d6ae) {
    var_2ddcaf824ac5d676 = ter_op(namespace_a12dc1d0c8a64946::isfmjdamage(data.objweapon, data.meansofdeath) && var_10d243b75ec6d6ae, 2, 0);
    if (data.damage > 150) {
        return (var_2ddcaf824ac5d676 + 10);
    }
    if (data.damage >= 80) {
        return (var_2ddcaf824ac5d676 + 5);
    } else if (data.damage >= 30) {
        return (var_2ddcaf824ac5d676 + 2);
    } else {
        return (var_2ddcaf824ac5d676 + 1);
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e72
// Size: 0x59
function supportbox_explosivedamagetohits(data, var_10d243b75ec6d6ae) {
    if (data.damage > 200) {
        return 20;
    }
    if (data.damage > 70) {
        return 10;
    } else if (data.damage > 30) {
        return 7;
    } else {
        return 2;
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed2
// Size: 0x21
function supportbox_removeowneroutline() {
    if (isdefined(self.outlineid)) {
        namespace_cbd3754a0c69cc63::outlinedisable(self.outlineid, self);
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1efa
// Size: 0x48
function supportbox_addheadicon(headicon) {
    self.headiconbox = namespace_7bdde15c3500a23f::setheadicon_singleimage([], headicon, 20, 1, 1000, 100, undefined, 1);
    self.headiconfaction = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 20, undefined, undefined, undefined, undefined, 1);
    supportbox_updateheadiconallplayers();
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f49
// Size: 0x51
function supportbox_removeheadicon() {
    if (isdefined(self.headiconbox)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconbox);
        self.headiconbox = undefined;
    }
    if (isdefined(self.headiconfaction)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconfaction);
        self.headiconfaction = undefined;
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa1
// Size: 0x8f
function supportbox_givepointsfordeath(attacker) {
    if (!isdefined(self.owner) || istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"destroyed_equipment");
        if (isdefined(self.weapon_name)) {
            if (self.weapon_name == "ammo_box_mp") {
                attacker thread namespace_25c5a6f43bb97b43::onFieldUpgradeDestroy(#"hash_457fd36b5024c8f8");
            } else {
                attacker thread namespace_25c5a6f43bb97b43::onFieldUpgradeDestroy(#"hash_de589684778b50e5");
            }
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2037
// Size: 0x93
function supportbox_givexpforuse(player, eventname, var_bf9f4947494d46bb, var_5237a188ccda4d7b) {
    if (isdefined(self.owner) && !namespace_f8065cafc523dba5::playersareenemies(self.owner, player)) {
        if (self.owner != player) {
            self.owner thread namespace_48a08c5037514e04::doScoreEvent(eventname);
        }
        self.owner namespace_3c5a4254f2b957ea::incpersstat(var_bf9f4947494d46bb, 1);
        self.owner namespace_85d036cb78063c4a::combatrecordsupermisc(var_5237a188ccda4d7b);
        self.usedcount++;
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d1
// Size: 0x15
function supportbox_onmovingplatformdeath(data) {
    supportbox_destroy(1);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ed
// Size: 0x7d
function function_ab33fbbbb68ea535(data) {
    owner = self.owner;
    if (!isdefined(owner)) {
        return;
    }
    var_19163e14365d9264 = owner namespace_85d036cb78063c4a::getcurrentsuper();
    if (isdefined(var_19163e14365d9264) && level.allowsupers) {
        if (!istrue(self.var_ee55bd57abd7930b)) {
            var_19163e14365d9264.wasrefunded = 1;
            owner namespace_85d036cb78063c4a::setsuperbasepoints(owner namespace_85d036cb78063c4a::getsuperpointsneeded());
        }
    }
    supportbox_destroy(1);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2171
// Size: 0xb7
function function_225b99924f316bc1(dropstruct, player, scriptablename, var_416102a18fc1fd69, weaponobj, var_6d6f8d51a1b7b6cd) {
    if (!isdefined(self.var_74a4e2fa253c5be8)) {
        self.var_74a4e2fa253c5be8 = 50;
    }
    offsetangles = (0, randomfloatrange(60, 90), 0);
    if (isdefined(var_6d6f8d51a1b7b6cd)) {
        offsetangles = var_6d6f8d51a1b7b6cd;
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles + offsetangles, player, undefined, self.var_74a4e2fa253c5be8);
    item = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, var_416102a18fc1fd69, 1, weaponobj, 0);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x222f
// Size: 0x9a
function supportbox_handlemovingplatforms(stuckto) {
    data = spawnstruct();
    data.linkparent = stuckto;
    data.deathoverridecallback = &supportbox_onmovingplatformdeath;
    data.invalidparentoverridecallback = &function_ab33fbbbb68ea535;
    data.endonstring = "death";
    data.validateaccuratetouching = 1;
    if (isdefined(stuckto) && namespace_9db09f982acd35b4::is_train_ent(stuckto)) {
        data.var_49cb2c45d3230ed8 = 1;
        self function_7e73001e97fe87b9(1);
    }
    thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d0
// Size: 0x2e
function supportbox_watchdisownedtimeout() {
    self endon("death");
    supportbox_watchdisownedtimeoutinternal();
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread supportbox_destroy(1);
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2305
// Size: 0x63
function supportbox_watchdisownedtimeoutinternal() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    if (isdefined(self.lifetime) && self.lifetime > 0) {
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(self.lifetime);
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x236f
// Size: 0x34
function supportbox_empapplied(data) {
    attacker = data.attacker;
    supportbox_givepointsfordeath(attacker);
    thread supportbox_destroy(1);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23aa
// Size: 0x34
function function_f7bd40787418df02(data) {
    attacker = data.attacker;
    supportbox_givepointsfordeath(attacker);
    thread supportbox_destroy(1);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e5
// Size: 0x5e
function supportbox_updateheadiconallplayers() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        supportbox_updateheadicon(player);
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244a
// Size: 0xf2
function supportbox_updateheadicon(player) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.owner)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    var_e8333833a81b6f0d = self.headiconbox;
    if (!isdefined(var_e8333833a81b6f0d)) {
        return;
    }
    var_d39dea1586e13c6c = self.headiconfaction;
    if (!isdefined(var_d39dea1586e13c6c)) {
        return;
    }
    isfriendly = namespace_f8065cafc523dba5::isfriendly(self.owner.team, player);
    isused = isdefined(self.playersused) && isdefined(self.playersused[player getentitynumber()]);
    if (isfriendly && !isused) {
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_e8333833a81b6f0d, player);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_d39dea1586e13c6c, player);
    } else if (isfriendly) {
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_e8333833a81b6f0d, player);
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_d39dea1586e13c6c, player);
    } else {
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_e8333833a81b6f0d, player);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_d39dea1586e13c6c, player);
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2543
// Size: 0x4a
function supportbox_getdeployanimduration() {
    switch (self.equipmentref) {
    case #"hash_91076f076ee682f4":
        return getanimlength(scriptables%wm_armor_box_ground_open);
    default:
        return getanimlength(scriptables%wm_support_box_ground_open);
        break;
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2594
// Size: 0x11
function supportbox_getuseanimduration() {
    return getanimlength(scriptables%wm_support_box_ground_idle_open_use);
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ad
// Size: 0x4a
function supportbox_getcloseanimduration() {
    switch (self.equipmentref) {
    case #"hash_91076f076ee682f4":
        return getanimlength(scriptables%wm_armor_box_ground_close);
    default:
        return getanimlength(scriptables%wm_support_box_ground_close);
        break;
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25fe
// Size: 0x36b
function supportbox_usedcallback(entity, player) {
    if (istrue(player.isjuggernaut) && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_USED");
        }
        return;
    }
    if (entity supportbox_playercanuse(player)) {
        var_53d437e6c2b6037e = 0;
        eventname = undefined;
        var_bf9f4947494d46bb = undefined;
        var_5237a188ccda4d7b = undefined;
        if (isdefined(entity.equipmentref)) {
            switch (entity.equipmentref) {
            case #"hash_29972969a98220a1":
                eventname = #"hash_decd39d6aeca5c6c";
                var_bf9f4947494d46bb = "munitionsBoxUsed";
                var_5237a188ccda4d7b = "super_ammo_drop";
                if (isdefined(level.onsupportboxusedbyplayer)) {
                    var_53d437e6c2b6037e = entity [[ level.onsupportboxusedbyplayer ]](player);
                } else {
                    var_53d437e6c2b6037e = entity supportbox_onplayeruse(player);
                }
                break;
            case #"hash_91076f076ee682f4":
                eventname = #"hash_511c5e7cabbce4d";
                var_bf9f4947494d46bb = "armorBoxUsed";
                var_5237a188ccda4d7b = "super_armor_drop";
                if (isdefined(level.onarmorboxusedbyplayer)) {
                    var_53d437e6c2b6037e = entity [[ level.onarmorboxusedbyplayer ]](player);
                }
                break;
            case #"hash_b3d0752364b0193d":
                eventname = #"hash_9f4eefc129360272";
                var_bf9f4947494d46bb = "utilityBoxUsed";
                var_5237a188ccda4d7b = "super_utility_drop";
                var_8467caaa6fe5fe32 = undefined;
                var_ae6d0dfe3a2dba21 = undefined;
                var_297b1c676daeacb3 = undefined;
                dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                if (isdefined(level.onarmorboxusedbyplayer)) {
                    var_8467caaa6fe5fe32 = entity [[ level.onarmorboxusedbyplayer ]](player, dropstruct);
                }
                if (isdefined(level.onsupportboxusedbyplayer)) {
                    var_ae6d0dfe3a2dba21 = entity [[ level.onsupportboxusedbyplayer ]](player, dropstruct);
                }
                if (isdefined(level.var_f41d94b42b42e948)) {
                    var_297b1c676daeacb3 = entity [[ level.var_f41d94b42b42e948 ]](player);
                }
                var_53d437e6c2b6037e = istrue(var_8467caaa6fe5fe32) && istrue(var_ae6d0dfe3a2dba21) && istrue(var_297b1c676daeacb3);
                break;
            case #"hash_187c7d31342c1d7c":
                eventname = #"hash_54106ec746cc7885";
                var_bf9f4947494d46bb = "blastshieldBoxUsed";
                var_5237a188ccda4d7b = "super_blastshield_drop";
                var_53d437e6c2b6037e = entity supportbox_onplayeruse(player);
                break;
            case #"hash_cf0bf67369c3ff42":
                eventname = #"hash_7986e8dccdee31d";
                var_bf9f4947494d46bb = "leaderBoxUsed";
                var_5237a188ccda4d7b = "super_leader_drop";
                if (isdefined(level.var_f24ae0993efca48f)) {
                    var_53d437e6c2b6037e = entity [[ level.var_f24ae0993efca48f ]](player);
                }
                break;
            case #"hash_bdd285c401cf9498":
                eventname = #"hash_dd967db653b981b4";
                var_bf9f4947494d46bb = "selfReviveBoxUsed";
                var_5237a188ccda4d7b = "super_self_revive_box";
                if (isdefined(level.var_130bc3f5f33bb97d)) {
                    var_53d437e6c2b6037e = entity [[ level.var_130bc3f5f33bb97d ]](player);
                }
                break;
            default:
                /#
                    assertmsg("Requested ref '" + entity.equipmentref + "' have no used callback.");
                #/
                break;
            }
            if (var_53d437e6c2b6037e) {
                entity.playersused[player getentitynumber()] = player;
                entity supportbox_updateheadicon(player);
                entity supportbox_givexpforuse(player, eventname, var_bf9f4947494d46bb, var_5237a188ccda4d7b);
                if (isdefined(entity.var_74a4e2fa253c5be8)) {
                    entity.var_74a4e2fa253c5be8 = entity.var_74a4e2fa253c5be8 + 10;
                }
            }
        }
    }
}

// Namespace namespace_1ceda47cf370258e/namespace_f9accfe6b1adc8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2970
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

