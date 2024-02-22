// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_247745a526421ba7;
#using script_608c50392df8c7d1;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\interactive.gsc;
#using script_1ed1214969b5eba7;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_372301af73968cb;

#namespace namespace_bd133e11ee7b392b;

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x60a
// Size: 0x19
function autoexec main() {
    registersharedfunc("super_med_box", "init", &function_40e8a5a7f496a5e1);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62a
// Size: 0xdb
function function_40e8a5a7f496a5e1() {
    setdvarifuninitialized(@"hash_f0fb5d0ed88ab0c1", 0.2);
    setdvarifuninitialized(@"hash_8421e297e070a231", 15);
    setdvarifuninitialized(@"hash_aab0b04330cc870b", 0);
    setdvarifuninitialized(@"hash_8ed5cff8032a5943", 0);
    level.var_326bb184c77c764b = [];
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&function_3122c424cb613711, "equip_medbox");
    if (issharedfuncdefined("team_utility", "joinTeamAggregator")) {
        [[ getsharedfunc("team_utility", "joinTeamAggregator") ]](&function_7189d58307e0232d);
    }
    level._effect["vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx"] = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    level._effect["vfx/jup/equipment/vfx_equip_medcrate_vignette.vfx"] = loadfx("vfx/jup/equipment/vfx_equip_medcrate_vignette.vfx");
    registersharedfunc("super_med_box", "medBox_used", &medbox_used);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70c
// Size: 0x67
function function_7189d58307e0232d(player) {
    foreach (var_46c577e5ccb7bab2 in level.var_326bb184c77c764b) {
        if (isdefined(var_46c577e5ccb7bab2)) {
            var_46c577e5ccb7bab2 function_693a82b036cfba91(player);
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77a
// Size: 0x34c
function box_used_common_setup(grenade, equipmentname, superid, headicon) {
    grenade.var_f89ce82fc6abacd5 = 0;
    grenade endon("death");
    grenade.issuper = 1;
    staticsuperdata = level.superglobals.staticsuperdata[superid];
    grenade.superid = staticsuperdata.id;
    grenade.lifetime = staticsuperdata.bundle.lifetime;
    if (isdefined(grenade.lifetime) && grenade.lifetime > 0) {
        grenade thread function_cdfda8cc0153b5d6();
    }
    grenade thread function_5fac0b2ef5c1e31c();
    grenade thread function_7c185a75f2dfdaf9(self);
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            if (issharedfuncdefined("supers", "refundSuper")) {
                self [[ getsharedfunc("supers", "refundSuper") ]]();
            }
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("EQUIPMENT/PLANT_FAILED");
            }
            grenade delete();
            return;
        }
    }
    grenade function_354b5edf045a416d(stuckto);
    grenade.bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3(superid);
    if (issharedfuncdefined("weapons", "onEquipmentPlanted")) {
        self [[ getsharedfunc("weapons", "onEquipmentPlanted") ]](grenade, equipmentname, &function_2850334505f6e7f7);
    }
    level.var_326bb184c77c764b[grenade getentitynumber()] = grenade;
    grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_91bbfcf9c145de2c);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_91bbfcf9c145de2c);
    }
    self.var_719e5222169cb898 = grenade;
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_396418c8b2e4fc03);
    grenade function_49197cd063a740ea(&function_2850334505f6e7f7);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
        }
    }
    if (!istrue(grenade.madedamageable)) {
        grenade function_c5fc51cc2864328();
    }
    grenade.makedamageable = undefined;
    grenade setscriptablepartstate("visibility", "show", 0);
    wait(0);
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        grenade function_5ab1f822624461d(headicon);
    }
    wait(0.75);
    grenade setscriptablepartstate("effects", "plant", 0);
    grenade setscriptablepartstate("anims", "open", 0);
    wait(grenade function_71823b2e5023e827());
    grenade setscriptablepartstate("beacon", "active", 0);
    grenade setscriptablepartstate("anims", "openIdle", 0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x12f
function function_7c185a75f2dfdaf9(player) {
    self endon("death");
    self endon("missile_stuck");
    player endon("disconnect");
    msg = waittill_any_timeout_1(2, "touching_platform");
    if (msg == "timeout") {
        return;
    }
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius(self.origin, 500, 500);
    ignoreents[ignoreents.size] = self;
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 1);
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + (0, 0, var_3a7f0173b03f5767);
    traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8);
    if (traceresults["fraction"] < 1) {
        groundentity = traceresults["entity"];
        if (isdefined(groundentity)) {
            if (is_train_ent(groundentity)) {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc03
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

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcab
// Size: 0x114
function medbox_used(grenade) {
    grenade endon("death");
    var_1d40e40dab99437e = "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx";
    var_6fb6e09c0716e21e = "vfx/jup/equipment/vfx_equip_medcrate_vignette.vfx";
    equipname = "equip_medbox";
    var_5237a188ccda4d7b = "super_med_box";
    headicon = "jup_hud_icon_equipment_med_box";
    var_598ba2bc14718181 = ter_op(self usinggamepad(), "EQUIPMENT_HINTS/MED_BOX_HOLD_USE", "EQUIPMENT_HINTS/MED_BOX_PRESS_USE");
    if (isdefined(self.var_719e5222169cb898)) {
        self.var_719e5222169cb898 thread function_2850334505f6e7f7(0);
    }
    grenade.timeoutvfxname = var_1d40e40dab99437e;
    grenade.var_774fe42bb6fc7cc7 = var_6fb6e09c0716e21e;
    box_used_common_setup(grenade, equipname, var_5237a188ccda4d7b, headicon);
    grenade function_67340ce4394d6a9(equipname, var_598ba2bc14718181);
    if (getdvarint(@"hash_8ed5cff8032a5943") >= 1) {
        thread function_3122c424cb613711(grenade, self);
    }
    namespace_aad14af462a74d08::function_d997435895422ecc(var_5237a188ccda4d7b, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc6
// Size: 0x6c
function function_5fac0b2ef5c1e31c(time) {
    self endon("death");
    self endon("missile_stuck");
    var_722684af55e05749 = getdvarfloat(@"hash_ed9a51db36904e30", 0);
    self setscriptablepartstate("visibility", "hide", 0);
    wait(var_722684af55e05749);
    self.madedamageable = 1;
    function_c5fc51cc2864328();
    self setscriptablepartstate("visibility", "show", 0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe39
// Size: 0x9c
function function_311a39a241b6e438() {
    if (1) {
        foreach (var_6dc86f1ebed6034c in self.plantedsuperequip) {
            if (var_6dc86f1ebed6034c.equipmentref == "equip_medbox") {
                var_6dc86f1ebed6034c thread function_2850334505f6e7f7(1);
                if (issharedfuncdefined("weapons", "removeEquip")) {
                    self [[ getsharedfunc("weapons", "removeEquip") ]](var_6dc86f1ebed6034c);
                }
            }
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedc
// Size: 0x1a5
function function_2850334505f6e7f7(immediate, var_4fac8b8ce36e09f1, var_d3f5ceb48370a22a) {
    if (!isdefined(immediate)) {
        immediate = !istrue(self.planted);
    }
    timeoutvfxname = "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx";
    if (isdefined(self.timeoutvfxname)) {
        timeoutvfxname = self.timeoutvfxname;
    }
    closetime = 0;
    if (istrue(var_d3f5ceb48370a22a)) {
        closetime = function_4868d9728ebf387a();
    }
    var_cbf7be4f62a0ddb2 = 0;
    if (!istrue(immediate)) {
        var_cbf7be4f62a0ddb2 = 0.1;
    }
    thread function_b349fbedc61f01e4(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1);
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
        self setscriptablepartstate("effects", "destroy", 0);
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1088
// Size: 0x112
function function_b349fbedc61f01e4(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    self.isdestroyed = 1;
    self setcandamage(0);
    if (isdefined(self.owner)) {
        if (issharedfuncdefined("weapons", "removeEquip")) {
            self.owner [[ getsharedfunc("weapons", "removeEquip") ]](self);
        }
    }
    function_8463e9c51dc49f4c();
    medbox_makeunusable();
    var_5237a188ccda4d7b = "super_med_box";
    if (var_5237a188ccda4d7b == "super_med_box") {
        self.owner namespace_aad14af462a74d08::function_d997435895422ecc(var_5237a188ccda4d7b, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
    }
    if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
        [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
    }
    wait(var_cbf7be4f62a0ddb2);
    self delete();
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a1
// Size: 0x8e
function function_67340ce4394d6a9(equipmentname, hintstring) {
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
    thread function_7debe3e49eeb21cb();
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1236
// Size: 0x7d
function medbox_makeunusable() {
    self notify("medBox_makeUnusable");
    namespace_ad136f1d5091df4a::interactive_removeusedcallbackfromentity();
    self makeunusable();
    if (isdefined(self.playersused)) {
        foreach (player in self.playersused) {
        }
    }
    self.playersused = undefined;
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ba
// Size: 0x45
function function_7debe3e49eeb21cb() {
    self endon("death");
    self endon("medBox_makeUnusable");
    var_47facc6abff4fd71 = gettime();
    while (1) {
        if (gettime() >= var_47facc6abff4fd71) {
            function_7ab94d4ac032f716();
            var_47facc6abff4fd71 = gettime() + 150;
        }
        waitframe();
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1306
// Size: 0x87
function function_7ab94d4ac032f716() {
    var_ef269077a28646eb = utility::playersnear(self.origin, 300);
    foreach (player in var_ef269077a28646eb) {
        if (isdefined(player)) {
            if (!function_cb4fbeffb3529c7(player)) {
                self disableplayeruse(player);
            } else {
                self enableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1394
// Size: 0xb3
function function_42d1dd4813d81681() {
    foreach (player in self.playersused) {
        if (isdefined(player)) {
            entnum = player getentitynumber();
            if (issharedfuncdefined("player", "isReallyAlive")) {
                if (![[ getsharedfunc("player", "isReallyAlive") ]](player) && isdefined(self.playersused[entnum])) {
                    self.playersused[entnum] = undefined;
                    function_693a82b036cfba91(player);
                }
            }
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144e
// Size: 0x75
function function_cb4fbeffb3529c7(player) {
    if (issharedfuncdefined("player", "isReallyAlive")) {
        if (![[ getsharedfunc("player", "isReallyAlive") ]](player)) {
            return 0;
        }
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

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cb
// Size: 0x58
function function_7a3ec75c9ecb32a(player) {
    if (!isdefined(self.equipmentref)) {
        /#
            /#
                assertmsg("disconnect");
            #/
        #/
        return;
    }
    function_ac68a8c0957eeeeb(player);
    thread function_9dc18231b25d8653();
    self.var_ee55bd57abd7930b = 1;
    var_5237a188ccda4d7b = "super_med_box";
    return 1;
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152b
// Size: 0x1e
function function_ac68a8c0957eeeeb(player) {
    if (isdefined(player)) {
        player playsoundtoplayer("jup_med_box_use", player);
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1550
// Size: 0x58
function function_9dc18231b25d8653() {
    self endon("death");
    if (istrue(self.onuseanimplaying)) {
        return;
    }
    self setscriptablepartstate("anims", "openUse", 0);
    self.onuseanimplaying = 1;
    wait(function_d3cc6eb39b0771f5());
    self setscriptablepartstate("anims", "openIdle", 0);
    self.onuseanimplaying = undefined;
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15af
// Size: 0x76
function function_c5fc51cc2864328() {
    bundle = self.bundle;
    var_b28c788c46e9a6 = 100;
    if (isdefined(bundle)) {
        var_b28c788c46e9a6 = function_53c4c53197386572(bundle.var_e53ecfd9f4fef4fa, 100);
    }
    if (issharedfuncdefined("damage", "monitorDamage")) {
        self thread [[ getsharedfunc("damage", "monitorDamage") ]](var_b28c788c46e9a6, "hitequip", &function_12b512237730ace8, &function_79a97ee01dc267d3);
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162c
// Size: 0x2a
function function_12b512237730ace8(data) {
    function_2bdf5e5dc8f22e66(data.attacker);
    thread function_2850334505f6e7f7(0, 1, 0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165d
// Size: 0x40
function function_320b2af6f6bd1910() {
    if (isdefined(self.outlineid)) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](self.outlineid, self);
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a4
// Size: 0x48
function function_5ab1f822624461d(headicon) {
    self.headiconbox = namespace_7bdde15c3500a23f::setheadicon_singleimage([], headicon, 20, 1, 1000, 100, undefined, 1);
    self.headiconfaction = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 20, undefined, undefined, undefined, undefined, 1);
    function_69873580a9e98ea();
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f3
// Size: 0x51
function function_8463e9c51dc49f4c() {
    if (isdefined(self.headiconbox)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconbox);
        self.headiconbox = undefined;
    }
    if (isdefined(self.headiconfaction)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconfaction);
        self.headiconfaction = undefined;
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174b
// Size: 0x112
function function_2bdf5e5dc8f22e66(attacker, var_d60fddb3d37776a1) {
    if (!isdefined(self.owner) || istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        if (issharedfuncdefined("player", "doScoreEvent")) {
            var_ad8c6c5cc50af10b = 0;
            if (istrue(var_d60fddb3d37776a1)) {
                var_ad8c6c5cc50af10b = 1;
            }
            attacker thread [[ getsharedfunc("player", "doScoreEvent") ]](#"destroyed_equipment", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_ad8c6c5cc50af10b);
        }
        if (isdefined(self.weapon_name)) {
            if (self.weapon_name == "ammo_box_mp") {
                if (issharedfuncdefined("battlechatter", "onFieldUpgradeDestroy")) {
                    attacker thread [[ getsharedfunc("battlechatter", "onFieldUpgradeDestroy") ]](#"hash_457fd36b5024c8f8");
                }
            } else if (issharedfuncdefined("battlechatter", "onFieldUpgradeDestroy")) {
                attacker thread [[ getsharedfunc("battlechatter", "onFieldUpgradeDestroy") ]](#"hash_de589684778b50e5");
            }
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1864
// Size: 0xf0
function function_e2df8d98b73b2414(player, eventname, var_bf9f4947494d46bb, var_5237a188ccda4d7b) {
    if (isdefined(self.owner) && !namespace_f8065cafc523dba5::playersareenemies(self.owner, player)) {
        if (self.owner != player) {
            if (issharedfuncdefined("player", "doScoreEvent")) {
                self.owner thread [[ getsharedfunc("player", "doScoreEvent") ]](eventname);
            }
        }
        if (issharedfuncdefined("pers", "incPersStat")) {
            self.owner [[ getsharedfunc("pers", "incPersStat") ]](var_bf9f4947494d46bb, 1);
        }
        if (issharedfuncdefined("supers", "combatRecordSuperMisc")) {
            self.owner [[ getsharedfunc("supers", "combatRecordSuperMisc") ]](var_5237a188ccda4d7b);
        }
        self.usedcount++;
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195b
// Size: 0x14
function function_65c63d1724f6b2a7(data) {
    function_2850334505f6e7f7(0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1976
// Size: 0xda
function function_246699c2be1e55c2(data) {
    owner = self.owner;
    if (!isdefined(owner)) {
        return;
    }
    if (issharedfuncdefined("player", "getCurrentSuper")) {
        var_19163e14365d9264 = owner [[ getsharedfunc("player", "getCurrentSuper") ]]();
        if (isdefined(var_19163e14365d9264) && level.allowsupers) {
            if (!istrue(self.var_ee55bd57abd7930b)) {
                var_19163e14365d9264.wasrefunded = 1;
                if (issharedfuncdefined("supers", "setSuperBasePoints") && issharedfuncdefined("supers", "getSuperPointsNeeded")) {
                    owner [[ getsharedfunc("supers", "setSuperBasePoints") ]](owner [[ getsharedfunc("supers", "getSuperPointsNeeded") ]]());
                }
            }
        }
    }
    function_2850334505f6e7f7(0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a57
// Size: 0xba
function function_354b5edf045a416d(stuckto) {
    data = spawnstruct();
    data.linkparent = stuckto;
    data.deathoverridecallback = &function_65c63d1724f6b2a7;
    data.invalidparentoverridecallback = &function_246699c2be1e55c2;
    data.endonstring = "death";
    data.validateaccuratetouching = 1;
    if (isdefined(stuckto) && namespace_9db09f982acd35b4::is_train_ent(stuckto)) {
        data.var_49cb2c45d3230ed8 = 1;
        self function_7e73001e97fe87b9(1);
    }
    if (issharedfuncdefined("game", "handlemovingplatforms")) {
        self thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b18
// Size: 0x2d
function function_cdfda8cc0153b5d6() {
    self endon("death");
    function_c13f96eaa3be2dab();
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread function_2850334505f6e7f7(0);
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4c
// Size: 0x82
function function_c13f96eaa3be2dab() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    if (isdefined(self.lifetime) && self.lifetime > 0) {
        if (issharedfuncdefined("hostmigration", "waitLongDurationWithPause")) {
            [[ getsharedfunc("hostmigration", "waitLongDurationWithPause") ]](self.lifetime);
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd5
// Size: 0x35
function function_91bbfcf9c145de2c(data) {
    attacker = data.attacker;
    function_2bdf5e5dc8f22e66(attacker, 1);
    thread function_2850334505f6e7f7(0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c11
// Size: 0x33
function function_396418c8b2e4fc03(data) {
    attacker = data.attacker;
    function_2bdf5e5dc8f22e66(attacker);
    thread function_2850334505f6e7f7(0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4b
// Size: 0x5e
function function_69873580a9e98ea() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_693a82b036cfba91(player);
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb0
// Size: 0x111
function function_693a82b036cfba91(player) {
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
    if (issharedfuncdefined("player", "isFriendly")) {
        isfriendly = [[ getsharedfunc("player", "isFriendly") ]](self.owner.team, player);
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
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc8
// Size: 0x11
function function_71823b2e5023e827() {
    return getanimlength(scriptables%wm_support_box_ground_open);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de1
// Size: 0x11
function function_d3cc6eb39b0771f5() {
    return getanimlength(scriptables%wm_support_box_ground_idle_open_use);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfa
// Size: 0x11
function function_4868d9728ebf387a() {
    return getanimlength(scriptables%wm_support_box_ground_close);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e13
// Size: 0x151
function function_3122c424cb613711(entity, player) {
    if (istrue(player.isjuggernaut) && !namespace_36f464722d326bbe::isbrstylegametype()) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_USED");
        }
        return;
    }
    if (entity function_cb4fbeffb3529c7(player)) {
        var_53d437e6c2b6037e = 0;
        eventname = undefined;
        var_bf9f4947494d46bb = undefined;
        var_5237a188ccda4d7b = undefined;
        if (isdefined(entity.equipmentref)) {
            eventname = #"hash_7ebcf978472ab1f4";
            var_bf9f4947494d46bb = "medBoxUsed";
            var_5237a188ccda4d7b = "super_med_box";
            if (getdvarint(@"hash_aab0b04330cc870b") >= 1) {
                if (!entity.var_f89ce82fc6abacd5) {
                    thread function_708bb89e4bbfc40(entity, player);
                    entity.var_f89ce82fc6abacd5 = 1;
                }
            }
            player.var_908c151f034b37e8 = getdvarfloat(@"hash_f0fb5d0ed88ab0c1");
            player thread function_58225ad9f963583d();
            var_53d437e6c2b6037e = entity function_7a3ec75c9ecb32a(player);
            if (var_53d437e6c2b6037e) {
                entity.playersused[player getentitynumber()] = player;
                entity function_693a82b036cfba91(player);
                entity function_e2df8d98b73b2414(player, eventname, var_bf9f4947494d46bb, var_5237a188ccda4d7b);
            }
        }
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6b
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f88
// Size: 0x80
function function_58225ad9f963583d() {
    self endon("medBoxHealed");
    if (isdefined(self.var_908c151f034b37e8)) {
        self waittill("death_or_disconnect");
        self setscriptablepartstate("medBoxVfx", "off", 0);
        self.var_908c151f034b37e8 = undefined;
        self.var_7d5dc55c0e7c065b = undefined;
        if (isdefined(self.var_808d06ddfc93a4e4)) {
            var_c9d3262a60835c51 = getdvarfloat(@"hash_f7ec6896361f0e48");
            namespace_54a2eae43eaa8bf5::function_5457f0107a845374("battleRage_beginSuper", var_c9d3262a60835c51);
        }
        self notify("medBoxHealed");
    }
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200f
// Size: 0x1f
function function_6ed51e2f80c93fa6() {
    self.var_7d5dc55c0e7c065b = undefined;
    self setscriptablepartstate("medBoxVfx", "off", 0);
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2035
// Size: 0x20
function function_44ec1c3e385bd14b() {
    self setscriptablepartstate("medBoxVfx", "vfx_start", 0);
    self.var_7d5dc55c0e7c065b = 1;
}

// Namespace namespace_bd133e11ee7b392b/namespace_360f523a8fbe8545
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205c
// Size: 0xe6
function function_708bb89e4bbfc40(grenade, player) {
    teammates = namespace_f8065cafc523dba5::getplayersinradius(grenade.origin, 600, player.team, player);
    foreach (teammate in teammates) {
        if (isalive(teammate)) {
            teammate.var_908c151f034b37e8 = getdvarfloat(@"hash_f0fb5d0ed88ab0c1");
            teammate thread function_58225ad9f963583d();
            var_53d437e6c2b6037e = grenade function_7a3ec75c9ecb32a(teammate);
            if (var_53d437e6c2b6037e) {
                grenade.playersused[teammate getentitynumber()] = teammate;
                grenade function_693a82b036cfba91(teammate);
            }
        }
    }
}

