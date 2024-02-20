// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5762ac2f22202ba2;
#using script_1ed1214969b5eba7;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_608c50392df8c7d1;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_247745a526421ba7;
#using scripts\engine\math.gsc;

#namespace capture_bot;

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x9dc
// Size: 0x19
function autoexec main() {
    utility::registersharedfunc("super_capture_bot", "init", &function_67dd16c63e4dfc65);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fc
// Size: 0xfe
function function_67dd16c63e4dfc65() {
    level.var_e0f77360ddb0ba30 = [];
    if (utility::issharedfuncdefined("team_utility", "joinTeamAggregator")) {
        [[ utility::getsharedfunc("team_utility", "joinTeamAggregator") ]](&function_287c3582fae35289);
    }
    function_b2f29740cb52f391();
    if (istrue(level.var_c48ab672d4fb36a)) {
        level.var_92b4162e3c890dc0 = utility::function_53c4c53197386572(level.var_92b4162e3c890dc0, []);
        level.var_92b4162e3c890dc0["capture_bot"] = &function_c66d85003c294dcf;
    }
    utility::registersharedfunc("super_capture_bot", "captureBot_used", &captureBot_used);
    utility::registersharedfunc("super_capture_bot", "captureBot_setClaimants", &captureBot_setClaimants);
    utility::registersharedfunc("super_capture_bot", "captureBot_getTeamIndex", &captureBot_getTeamIndex);
    utility::registersharedfunc("super_capture_bot", "captureBot_getBotOwner", &captureBot_getTeamIndex);
    utility::registersharedfunc("super_capture_bot", "captureBot_shouldCaptureObjective", &captureBot_shouldCaptureObjective);
    utility::registersharedfunc("super_capture_bot", "captureBot_isGrenadeEntity", &captureBot_isGrenadeEntity);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb01
// Size: 0x2f
function function_b2f29740cb52f391() {
    setdvarifuninitialized(@"hash_df5f30944ffffafd", 1);
    level.var_c48ab672d4fb36a = getdvarint(@"hash_c5dbbc4cf9126008", 0) == 1;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x67
function function_287c3582fae35289(player) {
    foreach (CaptureBot in level.var_e0f77360ddb0ba30) {
        if (isdefined(CaptureBot)) {
            CaptureBot function_136158ea18135f55(player);
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba5
// Size: 0x2c7
function captureBot_used(grenade) {
    grenade endon("death");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self.var_6fbd39a3be3e9cb4 = gettime();
    equipname = "equip_capture_bot";
    var_5237a188ccda4d7b = "super_capture_bot";
    headicon = "hud_icon_fieldupgrade_ammo_box";
    grenade endon("death");
    grenade thread function_78e3ab1589a567fa();
    grenade setscriptablepartstate("visibility", "show", 0);
    grenade thread function_4ef1bb5943972405(self);
    stuckto = grenade waittill("missile_stuck");
    grenade function_4325018d2242ad19(stuckto);
    grenade.issuper = 1;
    grenade.superid = level.superglobals.staticsuperdata[var_5237a188ccda4d7b].id;
    grenade.bundle = supers::function_bf9c7e9dd30180e3(var_5237a188ccda4d7b);
    if (utility::issharedfuncdefined("weapons", "onEquipmentPlanted")) {
        self [[ utility::getsharedfunc("weapons", "onEquipmentPlanted") ]](grenade, equipname, &function_41639d40af82c243);
    }
    level.var_e0f77360ddb0ba30[grenade getentitynumber()] = grenade;
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_714e85f59c6e39f8);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_3d80d4d22659ee31);
    }
    grenade namespace_595aac1b2bf891fc::set_apply_emp_callback(&function_e9230259bf4617b2);
    grenade haywire::function_172d848d58051fdf(&function_a5cef44666db8c3f);
    if (!istrue(grenade.madedamageable)) {
        grenade function_1b3ec96c8e90d21c();
    }
    grenade.makedamageable = undefined;
    grenade function_4cee86508ff92bb5();
    grenade.var_24e84b82ab1d5516 = 0;
    grenade.var_482696b5ff815a0f = 0;
    grenade.isempd = 0;
    grenade.var_a806c9eead3eb563 = getdvarint(@"hash_5aa813bbab6ce3", grenade.bundle.var_fcdbf98845ac8a63);
    grenade thread function_edccceae8cca6c8d(getdvarfloat(@"hash_553f589c514d1d1f", grenade.bundle.var_3f1a7102eef0fd38) * getdvarfloat(@"hash_553f589c514d1d1f", grenade.bundle.var_3f1a7102eef0fd38));
    if (function_2d798bcb76b38072()) {
        grenade thread function_aabf8c1c069532();
    }
    namespace_aad14af462a74d08::function_d997435895422ecc("super_capture_bot", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    grenade.headiconid = grenade entityheadicons::setheadicon_factionimage(0, 20, undefined, undefined, undefined, undefined, 1);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe73
// Size: 0x12f
function function_4ef1bb5943972405(player) {
    self endon("death");
    self endon("missile_stuck");
    player endon("disconnect");
    msg = utility::waittill_any_timeout_1(2, "touching_platform");
    if (msg == "timeout") {
        return;
    }
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius(self.origin, 500, 500);
    ignoreents[ignoreents.size] = self;
    var_fbcabd62b8f66eb8 = trace::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 1);
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + (0, 0, var_3a7f0173b03f5767);
    traceresults = trace::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8);
    if (traceresults["fraction"] < 1) {
        groundentity = traceresults["entity"];
        if (isdefined(groundentity)) {
            if (is_train_ent(groundentity)) {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa9
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

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1051
// Size: 0x9b
function function_c0e6a02651998844() {
    if (0) {
        foreach (var_6dc86f1ebed6034c in self.plantedsuperequip) {
            if (var_6dc86f1ebed6034c.equipmentref == "equip_capture_bot") {
                var_6dc86f1ebed6034c thread function_41639d40af82c243(1);
                if (utility::issharedfuncdefined("weapons", "removeEquip")) {
                    self [[ utility::getsharedfunc("weapons", "removeEquip") ]](var_6dc86f1ebed6034c);
                }
            }
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f3
// Size: 0x181
function function_41639d40af82c243(immediate, var_4fac8b8ce36e09f1) {
    if (!isdefined(immediate)) {
        immediate = !istrue(self.planted);
    }
    closetime = 0;
    var_cbf7be4f62a0ddb2 = 0;
    if (!immediate) {
        closetime = function_f677e51f4fa22a46() + function_8e87b1379bf12c7c();
        var_cbf7be4f62a0ddb2 = closetime + 0.1;
    } else {
        var_cbf7be4f62a0ddb2 = 0.1;
    }
    if (isdefined(self.var_16cbcb7ef09e2111)) {
        if (utility::issharedfuncdefined("robj", "removeExistingCaptureBot")) {
            self.var_16cbcb7ef09e2111 [[ utility::getsharedfunc("robj", "removeExistingCaptureBot") ]](self);
        }
        self.var_16cbcb7ef09e2111 = undefined;
    }
    moving_platform = undefined;
    var_34a47d4b8f3a4596 = undefined;
    thread function_58dfa4afe1169c68(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1);
    if (isdefined(self)) {
        fxorigin = self.origin;
        var_92246546867d1d04 = anglestoforward(self.angles);
        fxup = anglestoup(self.angles);
        var_dfdfaa4e665b31fc = self getlinkedparent();
        if (isdefined(var_dfdfaa4e665b31fc)) {
            moving_platform = var_dfdfaa4e665b31fc;
            var_34a47d4b8f3a4596 = moving_platform.origin - fxorigin;
        }
        if (!immediate) {
            function_ae7efb31b65492c6();
        }
        self setscriptablepartstate("destroy", "active", 0);
        if (isdefined(moving_platform) && isent(moving_platform)) {
            fxorigin = moving_platform.origin - var_34a47d4b8f3a4596;
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127b
// Size: 0x11e
function function_58dfa4afe1169c68(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    self.var_ca026d0b161c5997 = 1;
    wait(var_cbf7be4f62a0ddb2);
    self.isdestroyed = 1;
    self setcandamage(0);
    function_fabe2e590fd0eeea();
    if (isdefined(self.owner)) {
        if (utility::issharedfuncdefined("weapons", "removeEquip")) {
            self.owner [[ utility::getsharedfunc("weapons", "removeEquip") ]](self);
        }
    }
    self.exploding = 1;
    function_d4e56c54c8235018();
    var_5237a188ccda4d7b = "super_capture_bot";
    if (utility::issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
        [[ utility::getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
    }
    self.owner namespace_aad14af462a74d08::function_d997435895422ecc(var_5237a188ccda4d7b, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
    self delete();
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a0
// Size: 0x77
function captureBot_getTeamIndex(team) {
    /#
        assertex(isdefined(team), "getTeamIndex: team is undefined!");
    #/
    teamindex = 0;
    if (level.teambased) {
        switch (team) {
        case #"hash_7c2d091e6337bf54":
            teamindex = 1;
            break;
        case #"hash_5f54b9bf7583687f":
            teamindex = 2;
            break;
        case #"hash_11f9d28d306ceab7":
            teamindex = 3;
            break;
        }
    }
    return teamindex;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141f
// Size: 0x7e
function captureBot_setClaimants(team, var_51f08547fa39ce14, objidnum) {
    if (function_8b221111ad9228b8()) {
        var_e600d3d36fcd2556 = function_4daa2b488e4b8604(objidnum);
        var_70c4b747be58b854 = "ui_objective_" + var_e600d3d36fcd2556 + "_capture_bot_team_count";
        namespace_ef5ace8ba0e01c9d::function_d3cf7ff1a257e2c3(var_70c4b747be58b854, 0, 8, var_51f08547fa39ce14[1]);
        namespace_ef5ace8ba0e01c9d::function_d3cf7ff1a257e2c3(var_70c4b747be58b854, 8, 8, var_51f08547fa39ce14[2]);
        namespace_ef5ace8ba0e01c9d::function_d3cf7ff1a257e2c3(var_70c4b747be58b854, 16, 8, var_51f08547fa39ce14[3]);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a4
// Size: 0x24
function function_1411e5eb39a3b4b6(var_b49f304ef25ca00a) {
    if (function_7f15ad998050dd8c()) {
        return (var_b49f304ef25ca00a == -1 || var_b49f304ef25ca00a == 0);
    }
    return var_b49f304ef25ca00a == -1;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d0
// Size: 0x1b3
function function_4daa2b488e4b8604(var_448456f634611aaf) {
    var_ab487d0582646fb5 = getomnvar("ui_objective_1_capture_bot_index");
    var_ecd140b376bd5731 = getomnvar("ui_objective_2_capture_bot_index");
    var_6aa51027179c32a0 = getomnvar("ui_objective_3_capture_bot_index");
    var_2de8907a1cc0535d = getomnvar("ui_objective_4_capture_bot_index");
    var_253e657e6e5344d8 = getomnvar("ui_objective_5_capture_bot_index");
    var_1c2a2d5a99d780a3 = getomnvar("ui_objective_6_capture_bot_index");
    if (var_448456f634611aaf == var_ab487d0582646fb5 || function_1411e5eb39a3b4b6(var_ab487d0582646fb5)) {
        if (function_1411e5eb39a3b4b6(var_ab487d0582646fb5)) {
            setomnvar("ui_objective_1_capture_bot_index", var_448456f634611aaf);
        }
        return 1;
    } else if (var_448456f634611aaf == var_ecd140b376bd5731 || function_1411e5eb39a3b4b6(var_ecd140b376bd5731)) {
        if (function_1411e5eb39a3b4b6(var_ecd140b376bd5731)) {
            setomnvar("ui_objective_2_capture_bot_index", var_448456f634611aaf);
        }
        return 2;
    } else if (var_448456f634611aaf == var_6aa51027179c32a0 || function_1411e5eb39a3b4b6(var_6aa51027179c32a0)) {
        if (function_1411e5eb39a3b4b6(var_6aa51027179c32a0)) {
            setomnvar("ui_objective_3_capture_bot_index", var_448456f634611aaf);
        }
        return 3;
    } else if (var_448456f634611aaf == var_2de8907a1cc0535d || function_1411e5eb39a3b4b6(var_2de8907a1cc0535d)) {
        if (function_1411e5eb39a3b4b6(var_2de8907a1cc0535d)) {
            setomnvar("ui_objective_4_capture_bot_index", var_448456f634611aaf);
        }
        return 4;
    } else if (var_448456f634611aaf == var_253e657e6e5344d8 || function_1411e5eb39a3b4b6(var_253e657e6e5344d8)) {
        if (function_1411e5eb39a3b4b6(var_253e657e6e5344d8)) {
            setomnvar("ui_objective_5_capture_bot_index", var_448456f634611aaf);
        }
        return 5;
    } else if (var_448456f634611aaf == var_1c2a2d5a99d780a3 || function_1411e5eb39a3b4b6(var_1c2a2d5a99d780a3)) {
        if (function_1411e5eb39a3b4b6(var_1c2a2d5a99d780a3)) {
            setomnvar("ui_objective_6_capture_bot_index", var_448456f634611aaf);
        }
        return 6;
    } else {
        /#
            assertmsg("Ran out of useable omnvars, will need to increase the number.");
        #/
        return;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168a
// Size: 0x988
function function_edccceae8cca6c8d(var_c8e959c23607116a) {
    self endon("death");
    self endon("disable_hack");
    self.owner endon("death_or_disconnect");
    self.var_25a2efbe80ec4bf6 = [];
    if (isdefined(self.bundle.var_4c8ec3b47c6e3e6c)) {
        self.var_4c8ec3b47c6e3e6c = self.bundle.var_4c8ec3b47c6e3e6c;
    } else {
        self.var_4c8ec3b47c6e3e6c = 0;
    }
    if (isdefined(self.bundle.var_dcdf6f89d1968bfd)) {
        self.var_dcdf6f89d1968bfd = self.bundle.var_dcdf6f89d1968bfd;
    } else {
        self.var_dcdf6f89d1968bfd = 0;
    }
    if (isdefined(self.bundle.var_206e0f4b760ffb78)) {
        self.var_206e0f4b760ffb78 = self.bundle.var_206e0f4b760ffb78;
    } else {
        self.var_206e0f4b760ffb78 = 0;
    }
    if (isdefined(self.var_482696b5ff815a0f)) {
        while (!self.var_482696b5ff815a0f) {
            var_98fa4b76d957b210 = [[ level.getactiveequipmentarray ]]();
            var_6c845d64be969ce8 = level.activekillstreaks;
            var_110247e38c97089b = undefined;
            if (isdefined(level.var_d381da74cc527ec5["tacticalCameraList"])) {
                foreach (team in level.teamnamelist) {
                    if (team != self.owner.team) {
                        if (!isdefined(var_110247e38c97089b)) {
                            var_110247e38c97089b = level.var_d381da74cc527ec5["tacticalCameraList"][team];
                        } else {
                            var_110247e38c97089b = utility::array_combine_unique(var_110247e38c97089b, level.var_d381da74cc527ec5["tacticalCameraList"][team]);
                        }
                    }
                }
            }
            var_34ca454bbec477f1 = undefined;
            if (isdefined(var_6c845d64be969ce8) && isdefined(var_98fa4b76d957b210) && isdefined(var_110247e38c97089b)) {
                var_34ca454bbec477f1 = utility::array_combine_unique(var_6c845d64be969ce8, var_98fa4b76d957b210);
                var_34ca454bbec477f1 = utility::array_combine_unique(var_34ca454bbec477f1, var_110247e38c97089b);
            } else {
                if (isdefined(var_6c845d64be969ce8)) {
                    var_34ca454bbec477f1 = var_6c845d64be969ce8;
                }
                if (isdefined(var_98fa4b76d957b210)) {
                    if (isdefined(var_34ca454bbec477f1)) {
                        var_34ca454bbec477f1 = utility::array_combine_unique(var_34ca454bbec477f1, var_98fa4b76d957b210);
                    } else {
                        var_34ca454bbec477f1 = var_98fa4b76d957b210;
                    }
                }
                if (isdefined(var_110247e38c97089b)) {
                    if (isdefined(var_34ca454bbec477f1)) {
                        var_34ca454bbec477f1 = utility::array_combine_unique(var_34ca454bbec477f1, var_110247e38c97089b);
                    } else {
                        var_34ca454bbec477f1 = var_110247e38c97089b;
                    }
                }
            }
            if (!isdefined(var_34ca454bbec477f1)) {
                continue;
            }
            foreach (var_5a425ca023be6097 in var_34ca454bbec477f1) {
                if (!isdefined(var_5a425ca023be6097)) {
                    continue;
                }
                if (istrue(var_5a425ca023be6097.exploding)) {
                    continue;
                }
                if (var_5a425ca023be6097 == self) {
                    continue;
                }
                if (function_654bd872537c923(var_5a425ca023be6097)) {
                    continue;
                }
                var_d980f116a46c07b2 = var_5a425ca023be6097.owner;
                var_f31940d93afc41db = 1;
                if (var_f31940d93afc41db) {
                    jumpiffalse(isdefined(var_d980f116a46c07b2) && !istrue(namespace_e47104b48662385b::playersareenemies(self.owner, var_d980f116a46c07b2))) LOC_0000033b;
                } else {
                LOC_0000033b:
                    if (distancesquared(var_5a425ca023be6097.origin, self.origin) > var_c8e959c23607116a) {
                        continue;
                    }
                    var_a9cff4a574bdbd94 = undefined;
                    if (isdefined(var_5a425ca023be6097.streakname)) {
                        var_a9cff4a574bdbd94 = var_5a425ca023be6097.streakname;
                    } else if (isdefined(var_5a425ca023be6097.var_8862825a0618bda)) {
                        var_a9cff4a574bdbd94 = var_5a425ca023be6097.var_8862825a0618bda;
                    } else {
                        if (isdefined(var_5a425ca023be6097.weapon_name)) {
                            var_a9cff4a574bdbd94 = var_5a425ca023be6097.weapon_name;
                        }
                        if (!isdefined(var_a9cff4a574bdbd94) && isdefined(var_5a425ca023be6097.weapon_object)) {
                            var_a9cff4a574bdbd94 = var_5a425ca023be6097.weapon_object.basename;
                        }
                    }
                    if (isdefined(var_a9cff4a574bdbd94)) {
                        switch (var_a9cff4a574bdbd94) {
                        case #"hash_30c41b4430deef71":
                            if (isdefined(var_5a425ca023be6097.var_24e84b82ab1d5516)) {
                                if (var_5a425ca023be6097.isempd) {
                                    if (utility::issharedfuncdefined("player", "doScoreEvent")) {
                                        self.owner [[ utility::getsharedfunc("player", "doScoreEvent") ]]("capture_bot_unilateral_destruction");
                                    }
                                    var_5a425ca023be6097 thread function_41639d40af82c243(1, 1);
                                } else if (!var_5a425ca023be6097.var_24e84b82ab1d5516) {
                                    self.var_24e84b82ab1d5516 = 1;
                                    self.var_482696b5ff815a0f = 1;
                                    var_5a425ca023be6097.var_24e84b82ab1d5516 = 1;
                                    var_5a425ca023be6097.var_482696b5ff815a0f = 1;
                                    self.var_25a2efbe80ec4bf6[self.var_25a2efbe80ec4bf6.size] = var_5a425ca023be6097.owner;
                                    var_5a425ca023be6097 thread function_f46e9de463ee24b5(self.owner);
                                }
                            }
                            break;
                        case #"hash_14272647c44d6052":
                        case #"hash_1a5a56a6fdfa6d6b":
                        case #"hash_432644fc4753dde9":
                        case #"hash_435258fc47768fa7":
                        case #"hash_4a85ee2b82965fe2":
                        case #"hash_5e3fa526a48eaaa5":
                        case #"hash_5e8f81314553dd36":
                        case #"hash_6a2e4f9c54756dc7":
                            if (var_5a425ca023be6097 equipment::function_f5cbee8dfc1dc4f0(self)) {
                                equipment::function_24fce6c89fd2bee3(self);
                                if (utility::issharedfuncdefined("equipment", "hackEquipment")) {
                                    self.var_a806c9eead3eb563--;
                                    var_5a425ca023be6097 thread [[ utility::getsharedfunc("equipment", "hackEquipment") ]](self);
                                    if (utility::issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                                        [[ utility::getsharedfunc("outline", "outlineEnableForPlayer") ]](var_5a425ca023be6097, self.owner, "capture_bot", "equipment");
                                    }
                                }
                            }
                            break;
                        case #"hash_d746f684beafad9f":
                            if (utility::issharedfuncdefined("super_comm_scrambler", "commScrambler_onHacked")) {
                                self.var_a806c9eead3eb563--;
                                var_aaa527f17d8f8387 = utility::getsharedfunc("super_comm_scrambler", "commScrambler_onHacked");
                                var_5a425ca023be6097 namespace_8894a0caa4c34dc6::function_888f3a0124b03ddc(self.owner, "super_comm_scrambler", "capture_bot", var_aaa527f17d8f8387);
                            }
                            break;
                        case #"hash_56ee829cc162271a":
                        case #"hash_c46d19aa871781fa":
                            if (getdvarint(@"hash_497f584b55da1305", self.var_4c8ec3b47c6e3e6c) == 1) {
                                if (var_5a425ca023be6097 equipment::function_f5cbee8dfc1dc4f0(self)) {
                                    equipment::function_24fce6c89fd2bee3(self);
                                    if (utility::issharedfuncdefined("equipment", "hackEquipment")) {
                                        self.var_a806c9eead3eb563--;
                                        var_5a425ca023be6097 thread [[ utility::getsharedfunc("equipment", "hackEquipment") ]](self);
                                    }
                                }
                            }
                            break;
                        case #"hash_de91d496aad63a86":
                            if (getdvarint(@"hash_497f584b55da1305", self.var_4c8ec3b47c6e3e6c) == 1) {
                                if (utility::issharedfuncdefined("cameras", "tacticalCamera_Hack")) {
                                    self.var_a806c9eead3eb563--;
                                    var_5a425ca023be6097 thread [[ utility::getsharedfunc("cameras", "tacticalCamera_Hack") ]](self.owner);
                                }
                            }
                            break;
                        case #"hash_b4a17c60413030e7":
                            if (getdvarint(@"hash_36d6aab0c3496454", self.var_dcdf6f89d1968bfd) == 1) {
                                if (var_5a425ca023be6097 equipment::function_f5cbee8dfc1dc4f0(self)) {
                                    equipment::function_24fce6c89fd2bee3(self);
                                    if (utility::issharedfuncdefined("equipment", "hackEquipment")) {
                                        var_5a425ca023be6097 thread [[ utility::getsharedfunc("equipment", "hackEquipment") ]](self);
                                        self.var_a806c9eead3eb563--;
                                        if (utility::issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                                            [[ utility::getsharedfunc("outline", "outlineEnableForPlayer") ]](var_5a425ca023be6097, self.owner, "capture_bot", "equipment");
                                        }
                                    }
                                }
                            }
                            break;
                        case #"hash_19dd9a3a4147e09e":
                            if (getdvarint(@"hash_97bedf9b3dc1501d", self.var_206e0f4b760ffb78) == 1) {
                                if (utility::issharedfuncdefined("lrad", "LRAD_Hack")) {
                                    self.var_a806c9eead3eb563--;
                                    var_5a425ca023be6097 thread [[ utility::getsharedfunc("lrad", "LRAD_Hack") ]](self.owner);
                                    if (utility::issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                                        [[ utility::getsharedfunc("outline", "outlineEnableForPlayer") ]](var_5a425ca023be6097, self.owner, "capture_bot", "equipment");
                                    }
                                }
                            }
                            break;
                        case #"hash_b571a6187bf67f9e":
                            if (getdvarint(@"hash_97bedf9b3dc1501d", self.var_206e0f4b760ffb78) == 1) {
                                if (utility::issharedfuncdefined("missile_turret", "missile_turret_Hack")) {
                                    self.var_a806c9eead3eb563--;
                                    var_5a425ca023be6097 thread [[ utility::getsharedfunc("missile_turret", "missile_turret_Hack") ]](self.owner, var_5a425ca023be6097.owner);
                                    if (utility::issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                                        [[ utility::getsharedfunc("outline", "outlineEnableForPlayer") ]](var_5a425ca023be6097, self.owner, "capture_bot", "equipment");
                                    }
                                }
                            }
                            break;
                        }
                        if (self.var_a806c9eead3eb563 == 0) {
                            self.var_482696b5ff815a0f = 1;
                        }
                    }
                }
            }
            if (isdefined(self.var_482696b5ff815a0f)) {
                if (isdefined(self.var_24e84b82ab1d5516) && self.var_24e84b82ab1d5516) {
                    thread function_a3b944ae13709c67(self.var_25a2efbe80ec4bf6);
                } else if (self.var_482696b5ff815a0f) {
                    thread function_41639d40af82c243(0);
                }
            }
            wait(0.25);
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2019
// Size: 0x2d9
function function_aabf8c1c069532() {
    self endon("death");
    switch (function_60bf8d82001fc22c()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_6efb0f59a62300fb":
    case #"hash_a1313b745c17c07e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa44d9f6bd7a2fa1":
        function_2f3251d1a020fb1d();
        break;
    case #"hash_4d60179017f5a28a":
        if (isdefined(level.var_6d2de76d16fe8af7)) {
            var_965773d41d1464b7 = level.var_6d2de76d16fe8af7;
            foreach (var_8afcd15bf7bb71e in var_965773d41d1464b7) {
                if (utility::issharedfuncdefined("robj", "identifyObjTypForCaptureBot")) {
                    switch ([[ utility::getsharedfunc("robj", "identifyObjTypForCaptureBot") ]](var_8afcd15bf7bb71e)) {
                    case #"hash_2daf318af0c70342":
                    case #"hash_74d906400c48adf8":
                        if (distancesquared(self.origin, var_8afcd15bf7bb71e.curorigin) < 26406.2) {
                            if (getdvarint(@"hash_df5f30944ffffafd") == 0) {
                                castcontents = physics_createcontents([0:"physicscontents_ainosight"]);
                                var_e021c2744cc7ed68 = physics_raycast(self.origin, var_8afcd15bf7bb71e.curorigin, castcontents, [0:self], 0, "physicsquery_closest", 1);
                                if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                                    if (isdefined(var_e021c2744cc7ed68[0]["entity"]) && isdefined(var_e021c2744cc7ed68[0]["entity"].script_gameobjectname) && var_e021c2744cc7ed68[0]["entity"].script_gameobjectname == "robj") {
                                        function_4120d7ad8ea536(var_8afcd15bf7bb71e);
                                        self.var_16cbcb7ef09e2111 = var_8afcd15bf7bb71e;
                                        self setscriptablepartstate("objective", "on_objective", 0);
                                    } else {
                                        self setscriptablepartstate("objective", "neutral", 0);
                                    }
                                } else {
                                    function_4120d7ad8ea536(var_8afcd15bf7bb71e);
                                    self.var_16cbcb7ef09e2111 = var_8afcd15bf7bb71e;
                                    self setscriptablepartstate("objective", "on_objective", 0);
                                }
                            } else {
                                function_4120d7ad8ea536(var_8afcd15bf7bb71e);
                                self.var_16cbcb7ef09e2111 = var_8afcd15bf7bb71e;
                                self setscriptablepartstate("objective", "on_objective", 0);
                            }
                        } else {
                            self setscriptablepartstate("objective", "neutral", 0);
                            thread function_e1fe4c930d13eaec();
                        }
                        break;
                    case #"hash_fed0dfe3f74ac025":
                        break;
                    case #"hash_2916b409ed596650":
                        break;
                    default:
                        break;
                    }
                }
            }
        }
        break;
    default:
        break;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f9
// Size: 0x34
function function_4120d7ad8ea536(currentobjective) {
    if (utility::issharedfuncdefined("robj", "setUpNewCaptureBot")) {
        currentobjective [[ utility::getsharedfunc("robj", "setUpNewCaptureBot") ]](self);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2334
// Size: 0x41
function function_ed4aa674488778bd(obj) {
    self endon("death");
    wait((level.zoneendtime - gettime()) / 1000);
    while (function_38946e56052cc38d(obj)) {
        wait(0.2);
    }
    function_2f3251d1a020fb1d();
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237c
// Size: 0x162
function function_2f3251d1a020fb1d() {
    aitype = undefined;
    if (istrue(level.var_c48ab672d4fb36a)) {
        var_a5593b41cb874a1c = namespace_fb05e1623b934e8::function_3290e192ac188e2d("capture_bot");
        if (isdefined(var_a5593b41cb874a1c)) {
            /#
                assert(var_a5593b41cb874a1c.size == 1);
            #/
            if (var_a5593b41cb874a1c.size == 1) {
                aitype = var_a5593b41cb874a1c[0];
            }
        }
    }
    levelobjectives = level.objectives;
    if (isdefined(levelobjectives)) {
        foreach (obj in levelobjectives) {
            if (function_38946e56052cc38d(obj)) {
                if (function_60bf8d82001fc22c() == "koth" && obj.trigger getentitynumber() == level.var_fbb04ff4ffa6d364.trigger getentitynumber() && function_1fa1324f0208e72d(obj)) {
                    thread function_ed4aa674488778bd(obj);
                }
            } else if (function_1fa1324f0208e72d(obj)) {
                function_e23fba4163e12de6(obj, aitype);
                break;
            } else {
                self.owner setclientomnvar("ui_owned_capture_bot_capturing", 0);
                self.owner setclientomnvar("ui_owned_capture_bot_index", 0);
                self setscriptablepartstate("objective", "neutral", 0);
            }
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e5
// Size: 0x73
function function_38946e56052cc38d(obj) {
    if (!isdefined(obj.trigger) || isdefined(obj.trigger.trigger_off) && istrue(obj.trigger.trigger_off) || isdefined(obj.cancontestclaim) && !obj.cancontestclaim) {
        return 1;
    }
    return 0;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2560
// Size: 0xf0
function function_1fa1324f0208e72d(obj) {
    switch (function_60bf8d82001fc22c()) {
    case #"hash_f4a9126c03d3385b":
        return namespace_d3f3cb0a543667c1::pointvscylinder(self.origin, squared(obj.trigger.radius), obj.trigger.height, obj.trigger.origin, anglestoup(obj.trigger.angles));
    case #"hash_ca6516c10db2c95":
    case #"hash_6efb0f59a62300fb":
    case #"hash_a1313b745c17c07e":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa44d9f6bd7a2fa1":
        return self istouching(obj.trigger);
    default:
        return 0;
        break;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2657
// Size: 0x3b
function captureBot_shouldCaptureObjective(obj) {
    return !istrue(self.var_ca026d0b161c5997) && istrue(self.var_b8d1c74d660fef2d) && !function_38946e56052cc38d(obj) && function_1fa1324f0208e72d(obj);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269a
// Size: 0x261
function function_e23fba4163e12de6(obj, aitype) {
    self.var_b8d1c74d660fef2d = 1;
    if (istrue(level.var_c48ab672d4fb36a)) {
        if (utility::issharedfuncdefined("agents", "spawnNewAgentAiType")) {
            self.agent = self [[ utility::getsharedfunc("agents", "spawnNewAgentAiType") ]](aitype, self.origin, self.angles, self.owner.team);
            if (!isdefined(self.agent)) {
                return;
            }
        }
        if (utility::issharedfuncdefined("player", "getUniqueId")) {
            self.agent.guid = self.agent [[ utility::getsharedfunc("player", "getUniqueId") ]]();
        }
        self.agent.name = self.agent.guid;
        self.agent setentityowner(self.owner);
        self.agent.owner = self.owner;
        level notify("spawned_agent", self.agent);
    } else {
        if (!istrue(self.var_7b38ff940ed46ab6)) {
            self.pers = [];
            self.pers["team"] = self.owner.team;
            self.touchtriggers = [];
            self.guid = "CaptureBot" + self getentitynumber();
            self.objectivescaler = 1;
            self.clientid = self.owner.clientid;
            self.var_7b38ff940ed46ab6 = 1;
        }
        thread function_3bd485992b40ae54(obj);
    }
    if (isdefined(obj.objectivekey)) {
        self.var_61619d7980e9add9 = obj.objectivekey;
        self.owner setclientomnvar("ui_owned_capture_bot_capturing", 1);
        self.owner setclientomnvar("ui_owned_capture_bot_index", obj.objidnum + 1);
        self.owner.var_c252dc621d931184 = obj.objidnum;
    }
    self setscriptablepartstate("objective", "on_objective", 0);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2902
// Size: 0x59
function function_3bd485992b40ae54(obj) {
    self endon("death");
    self endon("disable_capturing");
    while (captureBot_shouldCaptureObjective(obj)) {
        if (utility::issharedfuncdefined("game", "processTouchEnt")) {
            obj utility::function_f3bb4f4911a1beb2("game", "processTouchEnt", self, obj.entnum);
        }
        waitframe();
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2962
// Size: 0x15b
function function_e1fe4c930d13eaec() {
    self endon("death");
    level waittill("new_robj_location");
    if (isdefined(level.var_6d2de76d16fe8af7)) {
        var_965773d41d1464b7 = level.var_6d2de76d16fe8af7;
        foreach (var_8afcd15bf7bb71e in var_965773d41d1464b7) {
            if (utility::issharedfuncdefined("robj", "identifyObjTypForCaptureBot")) {
                switch ([[ utility::getsharedfunc("robj", "identifyObjTypForCaptureBot") ]](var_8afcd15bf7bb71e)) {
                case #"hash_2daf318af0c70342":
                case #"hash_74d906400c48adf8":
                    if (distancesquared(self.origin, var_8afcd15bf7bb71e.trigger.origin) < 26406.2) {
                        function_4120d7ad8ea536(var_8afcd15bf7bb71e);
                        self.var_16cbcb7ef09e2111 = var_8afcd15bf7bb71e;
                        self setscriptablepartstate("objective", "on_objective", 0);
                    } else {
                        thread function_e1fe4c930d13eaec();
                        self setscriptablepartstate("objective", "neutral", 0);
                    }
                    break;
                case #"hash_fed0dfe3f74ac025":
                    break;
                case #"hash_2916b409ed596650":
                    break;
                default:
                    break;
                }
            }
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac4
// Size: 0x76
function function_2d798bcb76b38072() {
    switch (function_60bf8d82001fc22c()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_4d60179017f5a28a":
    case #"hash_6efb0f59a62300fb":
    case #"hash_a1313b745c17c07e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa44d9f6bd7a2fa1":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b41
// Size: 0x76
function function_8b221111ad9228b8() {
    switch (function_60bf8d82001fc22c()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_4d60179017f5a28a":
    case #"hash_6efb0f59a62300fb":
    case #"hash_a1313b745c17c07e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa44d9f6bd7a2fa1":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bbe
// Size: 0x1a5
function function_654bd872537c923(var_5a425ca023be6097) {
    var_a9cff4a574bdbd94 = undefined;
    if (isdefined(var_5a425ca023be6097.streakname)) {
        var_a9cff4a574bdbd94 = var_5a425ca023be6097.streakname;
    } else if (isdefined(var_5a425ca023be6097.var_8862825a0618bda)) {
        var_a9cff4a574bdbd94 = var_5a425ca023be6097.var_8862825a0618bda;
    } else {
        if (isdefined(var_5a425ca023be6097.weapon_name)) {
            var_a9cff4a574bdbd94 = var_5a425ca023be6097.weapon_name;
        }
        if (!isdefined(var_a9cff4a574bdbd94) && isdefined(var_5a425ca023be6097.weapon_object)) {
            var_a9cff4a574bdbd94 = var_5a425ca023be6097.weapon_object.basename;
        }
    }
    if (isdefined(var_a9cff4a574bdbd94)) {
        switch (var_a9cff4a574bdbd94) {
        case #"hash_b4a17c60413030e7":
            if (getdvarint(@"hash_36d6aab0c3496454", self.var_dcdf6f89d1968bfd) == 1) {
                return 0;
            } else {
                return 1;
            }
            break;
        case #"hash_56ee829cc162271a":
        case #"hash_c46d19aa871781fa":
            if (getdvarint(@"hash_497f584b55da1305", self.var_4c8ec3b47c6e3e6c) == 1) {
                return 0;
            } else {
                return 1;
            }
            break;
        case #"hash_de91d496aad63a86":
            if (getdvarint(@"hash_497f584b55da1305", self.var_4c8ec3b47c6e3e6c) == 1) {
                return 0;
            } else {
                return 1;
            }
            break;
        case #"hash_19dd9a3a4147e09e":
        case #"hash_b571a6187bf67f9e":
            if (getdvarint(@"hash_97bedf9b3dc1501d", self.var_206e0f4b760ffb78) == 1) {
                return 0;
            } else {
                return 1;
            }
            break;
        default:
            return 0;
            break;
        }
    }
    return 1;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6b
// Size: 0x76
function function_1b3ec96c8e90d21c() {
    bundle = self.bundle;
    var_b28c788c46e9a6 = 100;
    if (isdefined(bundle)) {
        var_b28c788c46e9a6 = utility::function_53c4c53197386572(bundle.maxhealth, 100);
    }
    if (utility::issharedfuncdefined("damage", "monitorDamage")) {
        self thread [[ utility::getsharedfunc("damage", "monitorDamage") ]](var_b28c788c46e9a6, "hitequip", &function_cc6cf839252877ac, &function_79a97ee01dc267d3);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de8
// Size: 0x2a
function function_cc6cf839252877ac(data) {
    function_2c95b12fb62aed02(data.attacker);
    thread function_41639d40af82c243(1, 1);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e19
// Size: 0x27
function captureBot_isGrenadeEntity() {
    if (isdefined(self.equipmentref) && self.equipmentref == "equip_capture_bot") {
        return 1;
    }
    return 0;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e48
// Size: 0x40
function function_fd1ef4f80a8a90bc() {
    if (isdefined(self.outlineid)) {
        if (utility::issharedfuncdefined("outline", "outlineDisable")) {
            [[ utility::getsharedfunc("outline", "outlineDisable") ]](self.outlineid, self);
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8f
// Size: 0x51
function function_d4e56c54c8235018() {
    if (isdefined(self.headiconid)) {
        entityheadicons::setheadicon_deleteicon(self.headiconid);
        self.headiconid = undefined;
    }
    if (isdefined(self.headiconfaction)) {
        entityheadicons::setheadicon_deleteicon(self.headiconfaction);
        self.headiconfaction = undefined;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee7
// Size: 0x8e
function function_2c95b12fb62aed02(attacker) {
    if (!isdefined(self.owner) || namespace_e47104b48662385b::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        if (utility::issharedfuncdefined("player", "doScoreEvent")) {
            attacker thread [[ utility::getsharedfunc("player", "doScoreEvent") ]](#"destroyed_equipment");
        }
        if (utility::issharedfuncdefined("battlechatter", "equipmentDestroyed")) {
            [[ utility::getsharedfunc("battlechatter", "equipmentDestroyed") ]](self);
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7c
// Size: 0xf0
function function_9d62753b509a9310(player, eventname, var_bf9f4947494d46bb, var_5237a188ccda4d7b) {
    if (isdefined(self.owner) && !namespace_e47104b48662385b::playersareenemies(self.owner, player)) {
        if (self.owner != player) {
            if (utility::issharedfuncdefined("player", "doScoreEvent")) {
                self.owner thread [[ utility::getsharedfunc("player", "doScoreEvent") ]](eventname);
            }
        }
        if (utility::issharedfuncdefined("pers", "incPersStat")) {
            self.owner [[ utility::getsharedfunc("pers", "incPersStat") ]](var_bf9f4947494d46bb, 1);
        }
        if (utility::issharedfuncdefined("supers", "combatRecordSuperMisc")) {
            self.owner [[ utility::getsharedfunc("supers", "combatRecordSuperMisc") ]](var_5237a188ccda4d7b);
        }
        self.usedcount++;
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3073
// Size: 0x15
function function_9269207a0488f67b(data) {
    function_41639d40af82c243(1);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308f
// Size: 0xd1
function function_fa5b4ff59c725f9e(data) {
    owner = self.owner;
    if (!isdefined(owner)) {
        return;
    }
    var_19163e14365d9264 = undefined;
    if (utility::issharedfuncdefined("player", "getCurrentSuper")) {
        var_19163e14365d9264 = owner [[ utility::getsharedfunc("player", "getCurrentSuper") ]]();
    }
    if (isdefined(var_19163e14365d9264) && level.allowsupers) {
        var_19163e14365d9264.wasrefunded = 1;
        if (utility::issharedfuncdefined("supers", "getSuperPointsNeeded") && utility::issharedfuncdefined("supers", "setSuperBasePoints")) {
            owner [[ utility::getsharedfunc("supers", "setSuperBasePoints") ]](owner [[ utility::getsharedfunc("supers", "getSuperPointsNeeded") ]]());
        }
    }
    function_41639d40af82c243(1);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3167
// Size: 0xba
function function_4325018d2242ad19(stuckto) {
    data = spawnstruct();
    data.linkparent = stuckto;
    data.deathoverridecallback = &function_9269207a0488f67b;
    data.invalidparentoverridecallback = &function_fa5b4ff59c725f9e;
    data.endonstring = "death";
    data.validateaccuratetouching = 1;
    if (isdefined(stuckto) && namespace_a51e05c6a6f8c5b2::is_train_ent(stuckto)) {
        data.var_49cb2c45d3230ed8 = 1;
        self function_7e73001e97fe87b9(1);
    }
    if (utility::issharedfuncdefined("game", "handlemovingplatforms")) {
        self thread [[ utility::getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3228
// Size: 0x2e
function function_78e3ab1589a567fa() {
    self endon("death");
    function_6644754dabdb7f27();
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread function_41639d40af82c243(1);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325d
// Size: 0x80
function function_6644754dabdb7f27() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    if (utility::issharedfuncdefined("hostmigration", "waitLongDurationWithPause")) {
        [[ utility::getsharedfunc("hostmigration", "waitLongDurationWithPause") ]](getdvarfloat(@"hash_68780fdf22059a6f", supers::function_bf9c7e9dd30180e3("super_capture_bot").var_a6cdc017c04a56de));
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e4
// Size: 0x60
function function_e9230259bf4617b2(data) {
    data.victim endon("death");
    data.victim endon("destroyed");
    function_774ef28b06fdf891(data);
    wait(getdvarfloat(@"hash_c98fb670dab45239", self.bundle.var_a84cf5adbb56f9cf));
    function_86c56d246ccda848(data);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334b
// Size: 0x36
function function_714e85f59c6e39f8(data) {
    data.victim endon("death");
    data.victim endon("destroyed");
    function_774ef28b06fdf891(data);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3388
// Size: 0x14
function function_3d80d4d22659ee31(data) {
    function_86c56d246ccda848(data);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a3
// Size: 0x92
function function_774ef28b06fdf891(data) {
    if (isdefined(data.attacker)) {
        if (utility::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ utility::getsharedfunc("player", "doScoreEvent") ]]("disabled_capture_bot", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        }
    }
    self.isempd = 1;
    data.victim notify("disable_hack");
    function_fabe2e590fd0eeea();
    data.victim function_ae7efb31b65492c6();
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343c
// Size: 0x9a
function function_86c56d246ccda848(data) {
    data.victim function_4cee86508ff92bb5();
    self.isempd = 0;
    data.victim thread function_edccceae8cca6c8d(getdvarfloat(@"hash_553f589c514d1d1f", self.bundle.var_3f1a7102eef0fd38) * getdvarfloat(@"hash_553f589c514d1d1f", self.bundle.var_3f1a7102eef0fd38));
    if (function_2d798bcb76b38072()) {
        data.victim thread function_aabf8c1c069532();
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34dd
// Size: 0x34
function function_a5cef44666db8c3f(data) {
    attacker = data.attacker;
    function_2c95b12fb62aed02(attacker);
    thread function_41639d40af82c243(1);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3518
// Size: 0x6b
function function_ae7efb31b65492c6() {
    self setscriptablepartstate("objective", "neutral", 0);
    self setscriptablepartstate("activate", "neutral", 0);
    self setscriptablepartstate("active", "neutral", 0);
    self setscriptablepartstate("deactivate", "deactivate", 0);
    wait(function_f677e51f4fa22a46());
    self setscriptablepartstate("inactive", "inactive", 0);
    wait(function_8e87b1379bf12c7c());
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x358a
// Size: 0x59
function function_4cee86508ff92bb5() {
    self setscriptablepartstate("deactivate", "neutral", 0);
    self setscriptablepartstate("inactive", "neutral", 0);
    self setscriptablepartstate("activate", "activate", 0);
    wait(function_2f1a6016f12d412c());
    self setscriptablepartstate("active", "active", 0);
    wait(function_d459d243d134c89a());
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ea
// Size: 0x19f
function function_fabe2e590fd0eeea() {
    if (level.var_c48ab672d4fb36a && isdefined(self.agent)) {
        if (utility::issharedfuncdefined("agents", "deactivateAgent")) {
            self.agent [[ utility::getsharedfunc("agents", "deactivateAgent") ]]();
        }
        self.agent.nocorpse = 1;
        self.agent kill();
        self.agent = undefined;
    }
    self notify("disable_capturing");
    if (isdefined(self.var_b8d1c74d660fef2d)) {
        self.var_b8d1c74d660fef2d = undefined;
    }
    if (isdefined(self.var_61619d7980e9add9)) {
        self.var_61619d7980e9add9 = undefined;
    }
    if (isdefined(self.owner)) {
        if (function_8b221111ad9228b8()) {
            var_f5c99cb09dc5c654 = self.owner getclientomnvar("ui_owned_capture_bot_index");
            if (var_f5c99cb09dc5c654 > 0) {
                var_d861f893072a477e = function_4daa2b488e4b8604(var_f5c99cb09dc5c654);
                teamindex = captureBot_getTeamIndex(self.owner.team);
                if (teamindex > 0) {
                    omnvar = "ui_objective_" + var_d861f893072a477e + "_capture_bot_team_count";
                    oldval = namespace_ef5ace8ba0e01c9d::function_610e0cca26bba2f(omnvar, (var_d861f893072a477e - 1) * 8, 8);
                    if (oldval > 0) {
                        namespace_ef5ace8ba0e01c9d::function_d3cf7ff1a257e2c3(omnvar, (var_d861f893072a477e - 1) * 8, 8, oldval - 1);
                    }
                }
            }
            self.owner setclientomnvar("ui_owned_capture_bot_index", 0);
            self.owner setclientomnvar("ui_owned_capture_bot_capturing", 0);
        }
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3790
// Size: 0x41
function function_f46e9de463ee24b5(attacker) {
    if (utility::issharedfuncdefined("player", "doScoreEvent")) {
        attacker [[ utility::getsharedfunc("player", "doScoreEvent") ]]("capture_bot_mutual_destruction");
    }
    thread function_41639d40af82c243(0);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d8
// Size: 0x86
function function_a3b944ae13709c67(var_fb0ece5f482aff3e) {
    foreach (attacker in var_fb0ece5f482aff3e) {
        if (utility::issharedfuncdefined("player", "doScoreEvent")) {
            attacker [[ utility::getsharedfunc("player", "doScoreEvent") ]]("capture_bot_mutual_destruction");
        }
    }
    thread function_41639d40af82c243(0);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3865
// Size: 0x5e
function function_9df1056705dc708e() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_136158ea18135f55(player);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ca
// Size: 0xdf
function function_136158ea18135f55(player) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.owner)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    var_d39dea1586e13c6c = self.headiconfaction;
    if (!isdefined(var_d39dea1586e13c6c)) {
        return;
    }
    isfriendly = undefined;
    if (utility::issharedfuncdefined("player", "isFriendly")) {
        isfriendly = [[ utility::getsharedfunc("player", "isFriendly") ]](self.owner.team, player);
    }
    isused = isdefined(self.playersused) && isdefined(self.playersused[player getentitynumber()]);
    if (isfriendly && !isused) {
        entityheadicons::setheadicon_removeclientfrommask(var_d39dea1586e13c6c, player);
    } else if (isfriendly) {
        entityheadicons::setheadicon_addclienttomask(var_d39dea1586e13c6c, player);
    } else {
        entityheadicons::setheadicon_removeclientfrommask(var_d39dea1586e13c6c, player);
    }
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b0
// Size: 0x157
function function_c66d85003c294dcf() {
    self.pers = [];
    self.hasdied = 0;
    self.isactive = 0;
    self.isagent = 1;
    self.movespeedscaler = undefined;
    self.avoidkillstreakonspawntimer = undefined;
    self.touchtriggers = undefined;
    self.carryobject = undefined;
    self.canpickupobject = undefined;
    self.guid = undefined;
    self.name = undefined;
    self.sessionteam = self.team;
    self.sessionstate = "playing";
    self.shieldbullethits = 0;
    self.recentshieldxp = 0;
    self.agent_gameparticipant = 1;
    self.agent_teamparticipant = 1;
    self.var_599b158d152c358d = 1;
    self.objectivescaler = 1;
    if (utility::issharedfuncdefined("player", "initPlayerGameobjects")) {
        self [[ utility::getsharedfunc("player", "initPlayerGameobjects") ]]();
    }
    namespace_587e5812d2dfd34c::addtoparticipantsarray();
    self setsolid(0);
    self hide();
    self.candamage = 0;
    self.ballowexecutions = 0;
    self.ignoreme = 1;
    self.candocombat = 0;
    self.canmove = 0;
    self.cannotmelee = 1;
    self.isvisible = 0;
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b0e
// Size: 0x11
function function_2f1a6016f12d412c() {
    return getanimlength(capture_bot%wm_capturebot_ground_open);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b27
// Size: 0x11
function function_f677e51f4fa22a46() {
    return getanimlength(capture_bot%wm_capturebot_ground_close);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b40
// Size: 0x11
function function_8e87b1379bf12c7c() {
    return getanimlength(capture_bot%wm_capturebot_ground_idle_closed);
}

// Namespace capture_bot/namespace_6623714b7e306bd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b59
// Size: 0x11
function function_d459d243d134c89a() {
    return getanimlength(capture_bot%wm_capturebot_ground_idle_open);
}

