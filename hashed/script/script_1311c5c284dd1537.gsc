// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\teams.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\callouts.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\common\interactive.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_1311c5c284dd1537;
#using scripts\mp\equipment\nvg.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;

#namespace namespace_ff6dd778c8d54dc8;

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe46
// Size: 0x2d
function function_e24031140ed11f4f() {
    level.var_3e2a48a1c201b444 = [];
    namespace_3c37cb17ade254d::registersharedfunc("deployable_camera", "attachXRays", &function_e4d938ad226591fd);
    level.var_bb0266f422d9afa3 = [];
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7a
// Size: 0x35
function function_f0698aee89c18210(var_8862825a0618bda) {
    params = level.var_bb0266f422d9afa3[var_8862825a0618bda];
    /#
        assertex(isdefined(params), "level.dCamSettings does not have an entry for " + var_8862825a0618bda);
    #/
    return params;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0x43
function function_7c5e1578b6fc9166(grenade) {
    var_a681b7890cd017c7 = spawnstruct();
    childthread function_4ad19757691771f4(grenade, var_a681b7890cd017c7);
    childthread function_dbd4125446485a2c(grenade, var_a681b7890cd017c7);
    childthread function_7a1589c1a8d2cd25(grenade, var_a681b7890cd017c7);
    grenade waittill("deployableCamera_returnStuck");
    return var_a681b7890cd017c7;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf02
// Size: 0x31
function function_7a1589c1a8d2cd25(grenade, var_a681b7890cd017c7) {
    grenade endon("deployableCamera_returnStuck");
    grenade waittill("missile_water_impact");
    var_a681b7890cd017c7.isunderwater = 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3a
// Size: 0x43
function function_4ad19757691771f4(grenade, var_a681b7890cd017c7) {
    grenade endon("deployableCamera_returnStuck");
    var_c1d84ab4c521636d = grenade waittill("missile_door_stuck");
    var_a681b7890cd017c7.var_972c39a514f196d1 = var_c1d84ab4c521636d;
    grenade notify("deployableCamera_returnStuck");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x44
function function_dbd4125446485a2c(grenade, var_a681b7890cd017c7) {
    grenade endon("deployableCamera_returnStuck");
    stuckto = grenade waittill("missile_stuck");
    var_a681b7890cd017c7.var_82d5e3b42d0191c9 = stuckto;
    waitframe();
    grenade notify("deployableCamera_returnStuck");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcf
// Size: 0x2db
function function_ee24b83d39692536(var_73bdd079f000daad, stuckto, position, var_2ce0b44b312ec3cf, var_76ba9e808a42f81, var_8862825a0618bda, var_d20dfbbbcd940269) {
    worldup = (0, 0, 1);
    var_c83a8d3d629f1dac = anglestoup(var_73bdd079f000daad.angles);
    var_fccbf8939ad0065 = vectordot(worldup, var_c83a8d3d629f1dac);
    var_9745168c66baba25 = var_fccbf8939ad0065 <= -0.707;
    var_9ffcc6e392e7660e = var_fccbf8939ad0065 > -0.707 && var_fccbf8939ad0065 <= 0.707;
    var_243889c6e373ef11 = var_fccbf8939ad0065 > 0.707;
    mode = "";
    var_98afbd56092f6f05 = 0;
    if (var_9745168c66baba25) {
        mode = "ceiling";
    } else if (var_9ffcc6e392e7660e) {
        var_98afbd56092f6f05 = -90;
        mode = "wall";
    } else {
        mode = "ground";
    }
    turret = spawnturret("misc_turret", position, var_2ce0b44b312ec3cf, 1, 1, var_98afbd56092f6f05);
    turret.mode = mode;
    turret setmodel(var_76ba9e808a42f81);
    turret.team = self.team;
    if (!istrue(var_d20dfbbbcd940269)) {
        turret setturretowner(self);
        turret.owner = self;
        turret setotherent(self);
    }
    turret.origin = var_73bdd079f000daad.origin;
    turret.angles = var_73bdd079f000daad.angles;
    turret disableplayeruseforallplayers();
    turret setmode("sentry_offline");
    turret.var_8862825a0618bda = var_8862825a0618bda;
    destroyfunc = function_f0698aee89c18210(turret.var_8862825a0618bda).destroyfunc;
    /#
        level thread draw_angles(turret.angles, turret.origin, (1, 0, 0), 5000, 100);
    #/
    if (isdefined(stuckto)) {
        turret linkto(stuckto);
        turret thread namespace_1a507865f681850e::function_4af015619e2534ba(stuckto, destroyfunc, 0);
        turret.moving_platform = stuckto;
        data = spawnstruct();
        data.linkparent = turret.moving_platform;
        data.deathoverridecallback = destroyfunc;
        data.validateaccuratetouching = 1;
        turret thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
        turret thread function_15380cdf3e4666e6(destroyfunc);
    } else if (isdefined(level.wztrain_info)) {
        data = spawnstruct();
        data.deathoverridecallback = destroyfunc;
        turret thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    }
    return turret;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b2
// Size: 0x26
function function_15380cdf3e4666e6(destroyfunc) {
    self endon("death");
    while (isdefined(self getlinkedparent())) {
        waitframe();
    }
    self [[ destroyfunc ]]();
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12df
// Size: 0x8c
function function_5d36462331845d5f(var_4664ee07ad6b2cbd) {
    if (!isdefined(level.var_d381da74cc527ec5)) {
        level.var_d381da74cc527ec5 = [];
    }
    level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd] = [];
    foreach (team in level.teamnamelist) {
        level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][team] = [];
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1372
// Size: 0x65
function function_b1d73dd45d89a318(var_8862825a0618bda) {
    params = function_f0698aee89c18210(var_8862825a0618bda);
    if (!isdefined(self.var_d381da74cc527ec5)) {
        self.var_d381da74cc527ec5 = [];
    }
    if (!isdefined(self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa])) {
        self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa] = [];
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13de
// Size: 0x55
function function_c827c58258222d48(var_8862825a0618bda) {
    params = function_f0698aee89c18210(var_8862825a0618bda);
    if (level.teambased) {
        return function_78871160104c5295(params.var_53ec43fa38fc3243);
    } else {
        return self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa];
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a
// Size: 0x71
function function_e60e9ce3b6484e52(var_8862825a0618bda) {
    params = function_f0698aee89c18210(var_8862825a0618bda);
    if (isdefined(params)) {
        var_494d71491a409c84 = function_78871160104c5295(params.var_53ec43fa38fc3243);
        if (isdefined(var_494d71491a409c84) && var_494d71491a409c84.size > 0) {
            if (isdefined(params.var_5b125df6b587a5c2) && var_494d71491a409c84.size >= params.var_5b125df6b587a5c2) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14b3
// Size: 0xe8
function private function_78871160104c5295(var_4664ee07ad6b2cbd) {
    if (!isdefined(level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd])) {
        level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd] = [];
    }
    if (!isdefined(level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team])) {
        level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team] = [];
    }
    if (shouldmodesetsquads() && !isdefined(level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team][self.var_ff97225579de16a])) {
        level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team][self.var_ff97225579de16a] = [];
    }
    if (shouldmodesetsquads()) {
        return level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team][self.var_ff97225579de16a];
    } else {
        return level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team];
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15a2
// Size: 0x58
function private function_b785abae83e23e41(var_4664ee07ad6b2cbd, val) {
    if (shouldmodesetsquads()) {
        level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team][self.var_ff97225579de16a] = val;
    } else {
        level.var_d381da74cc527ec5[var_4664ee07ad6b2cbd][self.team] = val;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1601
// Size: 0x21d
function function_9c46884fe9337fa7(camera) {
    params = function_f0698aee89c18210(camera.var_8862825a0618bda);
    teamref = camera.owner.team;
    if (!isdefined(level.var_d381da74cc527ec5)) {
        level.var_d381da74cc527ec5 = [];
    }
    if (!isdefined(level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243])) {
        level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243] = [];
    }
    if (!isdefined(level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref])) {
        level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref] = [];
    }
    if (shouldmodesetsquads() && !isdefined(function_78871160104c5295(params.var_53ec43fa38fc3243))) {
        level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref][self.var_ff97225579de16a] = [];
    }
    foundindex = undefined;
    var_494d71491a409c84 = function_78871160104c5295(params.var_53ec43fa38fc3243);
    arraysize = var_494d71491a409c84.size;
    var_6de7667c11dfc31a = 0;
    while (1) {
        for (i = 0; i <= arraysize; i++) {
            if (i == arraysize) {
                foundindex = i;
                var_6de7667c11dfc31a = 1;
                break;
            }
            var_ca318dd2de5793d = var_494d71491a409c84[i];
            if (!isdefined(var_ca318dd2de5793d.cameraindex) || istrue(var_ca318dd2de5793d.isdestroyed)) {
                break;
            }
            if (var_ca318dd2de5793d.cameraindex != i) {
                foundindex = i;
                var_6de7667c11dfc31a = 1;
                break;
            }
        }
        if (var_6de7667c11dfc31a) {
            break;
        }
        waitframe();
    }
    var_494d71491a409c84 = array_add(var_494d71491a409c84, camera);
    camera.cameraindex = foundindex;
    function_b785abae83e23e41(params.var_53ec43fa38fc3243, array_sort_with_func(var_494d71491a409c84, &function_15a4c63a63af8b6b));
    level notify(params.var_4f401574fc47899e, camera);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1825
// Size: 0x3a
function function_e5a484f7c5faf5b(camera) {
    if (!isdefined(self) || !isalive(self) || !isdefined(camera) || istrue(camera.isdestroyed)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1866
// Size: 0x216
function function_f5cda4da64c5c579(camera) {
    level endon("game_ended");
    params = function_f0698aee89c18210(camera.var_8862825a0618bda);
    teamref = self.team;
    level notify(params.var_67d467748271444c, camera);
    if (shouldmodesetsquads()) {
        if (isdefined(level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref][self.var_ff97225579de16a])) {
            level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref][self.var_ff97225579de16a] = array_remove(level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref][self.var_ff97225579de16a], camera);
            if (level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref][self.var_ff97225579de16a].size == 0) {
                level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref][self.var_ff97225579de16a] = undefined;
            }
        } else {
            /#
                assertmsg("level.deployable_cameras[ " + params.var_53ec43fa38fc3243 + " ][ " + teamref + "][ " + self.var_ff97225579de16a + " ] is undefined, did we somehow mismanage level.deployable_cameras?");
            #/
        }
    } else if (isdefined(level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref])) {
        level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref] = array_remove(level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref], camera);
        if (level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref].size == 0) {
            level.var_d381da74cc527ec5[params.var_53ec43fa38fc3243][teamref] = undefined;
        }
    } else {
        /#
            assertmsg("level.deployable_cameras[ " + params.var_53ec43fa38fc3243 + " ][ " + teamref + " ] is undefined, did we somehow mismanage level.deployable_cameras?");
        #/
    }
    camera.cameraindex = undefined;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0x77
function function_8e7c5f27949002c7() {
    if (level.teambased) {
        var_f5d0256e4366d1ff = shouldmodesetsquads();
        if (var_f5d0256e4366d1ff) {
            return namespace_54d20dd0dd79277f::getsquadmates(self.owner.team, self.owner.squadindex, 0);
        } else {
            return getteamdata(self.ownerteam, "players");
        }
    } else {
        return self.owner;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b01
// Size: 0x33
function function_86b60845e9a3d301(var_4d91d0458127bdc0) {
    params = function_f0698aee89c18210(var_4d91d0458127bdc0);
    self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa] = undefined;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b3b
// Size: 0x26
function private function_cf9aa20eb9489de5(var_d2eee016e3820550) {
    return isdefined(self.var_d381da74cc527ec5) && isdefined(self.var_d381da74cc527ec5[var_d2eee016e3820550]);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b69
// Size: 0x5e
function function_3265a4a8a3bdb477(var_4d91d0458127bdc0) {
    params = function_f0698aee89c18210(var_4d91d0458127bdc0);
    return isdefined(self.var_d381da74cc527ec5) && isdefined(self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa]) && self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa].size > 0;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcf
// Size: 0x9d
function function_f7a32619bba6e450(var_4d91d0458127bdc0) {
    params = function_f0698aee89c18210(var_4d91d0458127bdc0);
    if (function_cf9aa20eb9489de5(params.var_9c35ca95bd1d22fa)) {
        foreach (camera in self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa]) {
            camera thread [[ params.destroyfunc ]](1);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c73
// Size: 0x1c0
function function_99f14479415346e9(camera) {
    params = function_f0698aee89c18210(camera.var_8862825a0618bda);
    if (!isdefined(self.var_d381da74cc527ec5)) {
        self.var_d381da74cc527ec5 = [];
    }
    if (!isdefined(self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa])) {
        self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa] = [];
    }
    var_495f77e8bd8d6576 = self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa];
    var_495f77e8bd8d6576[var_495f77e8bd8d6576.size] = camera;
    var_495f77e8bd8d6576 = array_sort_with_func(var_495f77e8bd8d6576, &function_945c96ad7442451f);
    if (var_495f77e8bd8d6576.size > params.var_1790d4c69d5f45a4) {
        var_e297b70980f770a3 = var_495f77e8bd8d6576[var_495f77e8bd8d6576.size - 1];
        var_e10e5a74d99b447a = var_495f77e8bd8d6576[0];
        if (isdefined(var_e297b70980f770a3.var_defbeed1a2c29c34)) {
            var_e10e5a74d99b447a.var_defbeed1a2c29c34 = var_e297b70980f770a3.var_defbeed1a2c29c34;
            if (!level.teambased) {
                camera.cameraindex = var_e10e5a74d99b447a.var_defbeed1a2c29c34;
            }
        }
        var_495f77e8bd8d6576[var_495f77e8bd8d6576.size - 1] [[ params.destroyfunc ]](1, 1);
        var_495f77e8bd8d6576 = array_remove(var_495f77e8bd8d6576, var_495f77e8bd8d6576[var_495f77e8bd8d6576.size - 1]);
    } else {
        if (isdefined(var_495f77e8bd8d6576[1])) {
            camera.var_defbeed1a2c29c34 = ter_op(var_495f77e8bd8d6576[1].var_defbeed1a2c29c34 == 0, 1, 0);
        } else {
            camera.var_defbeed1a2c29c34 = 0;
        }
        if (!level.teambased) {
            camera.cameraindex = camera.var_defbeed1a2c29c34;
        }
    }
    self.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa] = var_495f77e8bd8d6576;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3a
// Size: 0xab
function function_4be323b74b86dbc9(camera) {
    params = function_f0698aee89c18210(camera.var_8862825a0618bda);
    if (!isdefined(self.owner.var_d381da74cc527ec5) || !isdefined(self.owner.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa])) {
        return;
    }
    self.owner.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa] = array_remove(self.owner.var_d381da74cc527ec5[params.var_9c35ca95bd1d22fa], self);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eec
// Size: 0x98
function function_cef7db6abfe1ceeb(camera) {
    self endon("disconnect");
    camera endon("death");
    if (!isdefined(camera.var_defbeed1a2c29c34)) {
        return;
    }
    while (!istrue(camera.isdestroyed)) {
        var_5f04179f0ece1fa3 = distance(self.origin, camera.origin);
        var_5f04179f0ece1fa3 = int(floor(var_5f04179f0ece1fa3 * 0.0254));
        self setclientomnvar("ui_tactical_camera_cam_" + camera.var_defbeed1a2c29c34 + "_distance", var_5f04179f0ece1fa3);
        wait(0.2);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f8b
// Size: 0x36
function private function_945c96ad7442451f(a, b) {
    if (a.creationtime > b.creationtime) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fc8
// Size: 0x36
function private function_15a4c63a63af8b6b(a, b) {
    if (a.cameraindex < b.cameraindex) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2005
// Size: 0xa
function private function_583884ac581c52a4() {
    return namespace_8554064ba5e7d07::function_45d5ee5f369ad604(self);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2017
// Size: 0x96
function function_45a7e0edc973d037() {
    level endon("game_ended");
    self endon("explode");
    self endon("death");
    self.var_49996ebebbbbf375 = -1;
    var_4930cbce302555b1 = function_f0698aee89c18210(self.var_8862825a0618bda).var_315c43d476bb095;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    } else {
        while (1) {
            var_a69d4e3f623c9031 = function_583884ac581c52a4();
            if (isdefined(var_a69d4e3f623c9031) && self.var_49996ebebbbbf375 != var_a69d4e3f623c9031) {
                self.var_49996ebebbbbf375 = var_a69d4e3f623c9031;
                level notify(var_4930cbce302555b1, self);
            }
            wait(0.1);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b4
// Size: 0x5d
function function_23cf186c8b512748() {
    self endon("death");
    self.madedamageable = 1;
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    thread namespace_3e725f3cc58bddd3::monitordamage(params.maxhealth, "hitequip", params.var_604c545b594e97ec, params.var_4f1335fce3765da0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2118
// Size: 0x9f
function function_da29e274cc4a86f4(camera) {
    camera endon("death");
    self endon("disconnect");
    level endon("game_ended");
    timeoutduration = function_f0698aee89c18210(camera.var_8862825a0618bda).lifetime;
    timeelapsed = 0;
    while (timeelapsed < timeoutduration) {
        var_77b3f0514a25c019 = (timeoutduration - timeelapsed) / timeoutduration;
        var_77b3f0514a25c019 = int(ceil(clamp(var_77b3f0514a25c019, 0, 1) * 100));
        camera.var_5c93b81b2052d23b = var_77b3f0514a25c019;
        timeelapsed = timeelapsed + level.framedurationseconds;
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21be
// Size: 0x89
function function_b0210563a392f1a1(camera) {
    camera endon("death");
    self endon("stopMonitoringReticleState");
    self endon("disconnect");
    reticlestate = 0;
    while (1) {
        if (istrue(camera.markingtarget) && reticlestate == 0) {
            self setclientomnvar("ui_rcd_outer_ring", 1);
            reticlestate = 1;
        } else if (!istrue(camera.markingtarget) && reticlestate == 1) {
            self setclientomnvar("ui_rcd_outer_ring", 0);
            reticlestate = 0;
        }
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x224e
// Size: 0x25
function private function_d506961e2710d1e1() {
    if (!isdefined(self.var_dae7e92e87a31e4)) {
        return 0;
    }
    if (self.var_dae7e92e87a31e4.size > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227b
// Size: 0xc3
function function_d103dc61e5b6abc3(player) {
    if (!isdefined(player)) {
        return;
    }
    if (level.teambased) {
        if (!isdefined(level.var_7d17467eca3737aa) || !isdefined(level.var_7d17467eca3737aa[player.team])) {
            return;
        }
        if (shouldmodesetsquads()) {
            if (isdefined(level.var_7d17467eca3737aa[player.team][player.var_ff97225579de16a])) {
                return level.var_7d17467eca3737aa[player.team][player.var_ff97225579de16a];
            } else {
                return;
            }
        } else {
            return level.var_7d17467eca3737aa[player.team];
        }
    } else {
        return player.markedents;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2345
// Size: 0x52
function private function_f91c0feb9232b257(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_7305a0e8014e47be = function_d103dc61e5b6abc3(self);
    if (!isdefined(var_7305a0e8014e47be)) {
        return 0;
    }
    var_161e86c260d6864c = var_7305a0e8014e47be[target getentitynumber()];
    if (!isdefined(var_161e86c260d6864c)) {
        return 0;
    }
    return istrue(var_161e86c260d6864c.reconmarked);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x239f
// Size: 0x1c8
function private function_74598558cd270375(defaulticon, var_2f3cf0914d78ac25, target) {
    weaponicon = defaulticon;
    weaponoffset = var_2f3cf0914d78ac25;
    weaponstruct = spawnstruct();
    if (isdefined(target.weapon_name)) {
        weaponref = undefined;
        if (issubstr(target.weapon_name, "claymore")) {
            weaponref = "equip_claymore";
        } else if (issubstr(target.weapon_name, "c4")) {
            weaponref = "equip_c4";
        } else if (issubstr(target.weapon_name, "atMine")) {
            weaponref = "equip_at_mine";
        } else if (issubstr(target.weapon_name, "trophy")) {
            weaponref = "equip_trophy";
        }
        if (isdefined(weaponref)) {
            var_58907637f9a8d293 = undefined;
            if (issharedfuncdefined("equipment", "getEquipmentTableInfo")) {
                var_58907637f9a8d293 = [[ getsharedfunc("equipment", "getEquipmentTableInfo") ]](weaponref);
            }
            weaponicon = var_58907637f9a8d293.image;
        }
    } else if (isdefined(target.streakinfo)) {
        var_2b7cf61af0cb9960 = target.streakinfo.streakname;
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[var_2b7cf61af0cb9960];
        weaponicon = ter_op(isdefined(bundle) && isdefined(bundle.var_890bc2de5deadf64), bundle.var_890bc2de5deadf64, "");
        weaponoffset = 75;
    }
    weaponstruct.weaponicon = weaponicon;
    weaponstruct.weaponoffset = weaponoffset;
    return weaponstruct;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x256f
// Size: 0xcd
function private function_c2c3f444cfeb61ca(var_161e86c260d6864c, player) {
    var_f447bfdbb1256f69 = undefined;
    if (isdefined(var_161e86c260d6864c.markingent.pilot)) {
        var_f447bfdbb1256f69 = var_161e86c260d6864c.markingent.pilot;
    } else {
        var_f447bfdbb1256f69 = var_161e86c260d6864c.markingent.owner;
    }
    if (level.teambased) {
        if (shouldmodesetsquads()) {
            var_1b6ae0f8344f5cea = getsquadmates(var_f447bfdbb1256f69.team, var_f447bfdbb1256f69.var_ff97225579de16a, 0);
            return array_contains(var_1b6ae0f8344f5cea, player);
        } else {
            return namespace_f8065cafc523dba5::isfriendly(var_f447bfdbb1256f69.team, player);
        }
    } else {
        return (player == var_f447bfdbb1256f69);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2643
// Size: 0x63
function function_7d61d7b52c318d47() {
    self endon("disconnect");
    if (istrue(isusingremote())) {
        return;
    }
    visionset = "recon_drone_flash";
    if (istrue(self.pers["useNVG"])) {
        visionset = "recon_drone_flash_nvg";
    }
    self visionsetfadetoblackforplayer(visionset, 0.05);
    wait(0.08);
    self visionsetfadetoblackforplayer("", 1.2);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ad
// Size: 0x78
function function_748f3520a7e525a9() {
    if (!isdefined(self.markedomnvar)) {
        self.markedomnvar = 1;
        self setclientomnvar("ui_rcd_target_notify", self.markedomnvar);
        thread function_bebd32f6bc2a781f();
    } else {
        if (self.markedomnvar == 1) {
            self.markedomnvar = 2;
        } else {
            self.markedomnvar = 1;
        }
        self setclientomnvar("ui_rcd_target_notify", self.markedomnvar);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x272c
// Size: 0x4e
function private function_bebd32f6bc2a781f() {
    self endon("disconnect");
    self notify("markedUIUpdate");
    self endon("markedUIUpdate");
    if (issharedfuncdefined("helper_drone", "get_mark_ui_duration")) {
        wait(self [[ getsharedfunc("helper_drone", "get_mark_ui_duration") ]]());
    } else {
        wait(3);
    }
    thread function_3c3a95d13d184ac5();
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2781
// Size: 0x22
function private function_3c3a95d13d184ac5() {
    self notify("markedUIUpdate");
    self.markedomnvar = undefined;
    self setclientomnvar("ui_rcd_target_notify", 0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27aa
// Size: 0x3f
function private function_29e7d04cb1f3e556(player) {
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.var_654dfe33aae5b35c, player);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27f0
// Size: 0x3f
function private function_bf967bc1ac455bdf(player) {
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.var_654dfe33aae5b35c, player);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2836
// Size: 0x3f
function private function_7254a960f447a69b(player) {
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.var_654dfe33aae5b35c, player);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x287c
// Size: 0x3f
function private function_2f6abcf7fcc02f(player) {
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.var_654dfe33aae5b35c, player);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c2
// Size: 0x78
function function_67240db2bf930ccd() {
    if (isdefined(self.headiconbox)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconbox);
        self.headiconbox = undefined;
    }
    if (isdefined(self.headiconfaction)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconfaction);
        self.headiconfaction = undefined;
    }
    if (isdefined(self.var_654dfe33aae5b35c)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.var_654dfe33aae5b35c);
        self.var_654dfe33aae5b35c = undefined;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2941
// Size: 0x69
function private function_686c35e781f41189(var_5237a188ccda4d7b) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_ea3e848c25e3c926(player, undefined, var_5237a188ccda4d7b);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29b1
// Size: 0x50
function private function_49aabe4cb7c4c0a4(player, var_5237a188ccda4d7b) {
    if (isdefined(player.super) && player.super.staticdata.ref == var_5237a188ccda4d7b) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a08
// Size: 0x127
function function_ea3e848c25e3c926(player, unset, var_5237a188ccda4d7b) {
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
    var_d1c9d3655a4f3302 = self.var_654dfe33aae5b35c;
    if (!isdefined(var_d1c9d3655a4f3302)) {
        return;
    }
    isfriendly = namespace_f8065cafc523dba5::isfriendly(self.owner.team, player);
    var_7295a6a7d7aafad7 = function_49aabe4cb7c4c0a4(player, var_5237a188ccda4d7b);
    if (isfriendly) {
        if (istrue(unset)) {
            function_bf967bc1ac455bdf(player);
            return;
        }
        if (function_d506961e2710d1e1()) {
            function_7254a960f447a69b(player);
            return;
        }
        if (var_7295a6a7d7aafad7) {
            if (istrue(player.isusingcamera)) {
                function_2f6abcf7fcc02f(player);
            } else {
                function_29e7d04cb1f3e556(player);
            }
            return;
        } else {
            function_bf967bc1ac455bdf(player);
        }
    } else {
        function_2f6abcf7fcc02f(player);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b36
// Size: 0x238
function function_8b5781dd2d18a300(player) {
    var_c1a442604b2c5e96 = player function_eaf65bb46d1bd1a8();
    if (!isdefined(var_c1a442604b2c5e96)) {
        return undefined;
    }
    if (!level.teambased) {
        return undefined;
    }
    teammates = undefined;
    var_f5d0256e4366d1ff = shouldmodesetsquads();
    if (var_c1a442604b2c5e96 == self) {
        if (var_f5d0256e4366d1ff) {
            teammates = namespace_54d20dd0dd79277f::getsquadmates(player.team, player.var_ff97225579de16a, 1);
        } else {
            teammates = getteamdata(player.team, "players");
        }
        foreach (teammate in teammates) {
            if (teammate == player) {
                continue;
            } else if (!istrue(teammate.isusingcamera)) {
                continue;
            } else {
                namespace_f48c22429667eba9::function_69d232b5e8c5d652(player.var_8cc5d2e4cfbf42b0, teammate);
                if (var_f5d0256e4366d1ff) {
                    level.var_8cc5d2e4cfbf42b0[player.team][player.var_ff97225579de16a] = teammate;
                    level.var_8cc5d2e4cfbf42b0[player.team][player.var_ff97225579de16a].var_8cc5d2e4cfbf42b0 = player.var_8cc5d2e4cfbf42b0;
                } else {
                    level.var_8cc5d2e4cfbf42b0[player.team] = teammate;
                    level.var_8cc5d2e4cfbf42b0[player.team].var_8cc5d2e4cfbf42b0 = player.var_8cc5d2e4cfbf42b0;
                }
                player.var_8cc5d2e4cfbf42b0 = undefined;
                namespace_f48c22429667eba9::function_fd770a1099036688(level.var_8cc5d2e4cfbf42b0[player.team].var_8cc5d2e4cfbf42b0, player);
                return teammate;
            }
        }
        namespace_f48c22429667eba9::targetmarkergroup_off(var_c1a442604b2c5e96.var_8cc5d2e4cfbf42b0);
        if (var_f5d0256e4366d1ff) {
            level.var_8cc5d2e4cfbf42b0[player.team][player.var_ff97225579de16a] = undefined;
        } else {
            level.var_8cc5d2e4cfbf42b0[player.team] = undefined;
        }
    }
    return undefined;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d76
// Size: 0xad
function private function_eaf65bb46d1bd1a8() {
    var_e1c6011321fd25b9 = undefined;
    team = self.team;
    if (level.teambased) {
        if (!isdefined(level.var_8cc5d2e4cfbf42b0) || !isdefined(level.var_8cc5d2e4cfbf42b0[team])) {
            return undefined;
        }
        if (shouldmodesetsquads()) {
            if (!isdefined(level.var_8cc5d2e4cfbf42b0[team][self.var_ff97225579de16a])) {
                return undefined;
            } else {
                return level.var_8cc5d2e4cfbf42b0[team][self.var_ff97225579de16a];
            }
        } else {
            return level.var_8cc5d2e4cfbf42b0[team];
        }
    } else if (isdefined(self.var_8cc5d2e4cfbf42b0)) {
        return self;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2a
// Size: 0xb4
function function_bfcdb898d70f248c() {
    team = self.team;
    var_e1c6011321fd25b9 = function_eaf65bb46d1bd1a8();
    if (!isdefined(var_e1c6011321fd25b9) || !isdefined(var_e1c6011321fd25b9.var_8cc5d2e4cfbf42b0)) {
        return;
    }
    if (level.teambased) {
        newowner = undefined;
        if (var_e1c6011321fd25b9 == self) {
            newowner = function_8b5781dd2d18a300(self);
            if (isdefined(newowner)) {
                namespace_f48c22429667eba9::function_fd770a1099036688(newowner.var_8cc5d2e4cfbf42b0, self);
            }
        } else {
            namespace_f48c22429667eba9::function_fd770a1099036688(var_e1c6011321fd25b9.var_8cc5d2e4cfbf42b0, self);
        }
    } else {
        namespace_f48c22429667eba9::targetmarkergroup_off(var_e1c6011321fd25b9.var_8cc5d2e4cfbf42b0);
        var_e1c6011321fd25b9.var_8cc5d2e4cfbf42b0 = undefined;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee5
// Size: 0x57
function function_ec57e0acbc6c6879(var_c8462289edfc0aca, target, state) {
    var_7cbb905f3204b5d0 = (state >> 0) % 2 == 1;
    var_1f6ff6a3877bf04 = (state >> 1) % 2 == 1;
    targetmarkergroupsetentitystate(var_c8462289edfc0aca, target, var_7cbb905f3204b5d0);
    targetmarkergroupsetextrastate(var_c8462289edfc0aca, target, var_1f6ff6a3877bf04);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f43
// Size: 0x363
function function_c9ad5aaf3183b83c() {
    markedents = function_d103dc61e5b6abc3(self);
    if (!isdefined(self)) {
        return;
    }
    if (level.teambased) {
        if (!isdefined(level.var_8cc5d2e4cfbf42b0)) {
            level.var_8cc5d2e4cfbf42b0 = [];
        }
        if (shouldmodesetsquads()) {
            if (!isdefined(level.var_8cc5d2e4cfbf42b0[self.team])) {
                level.var_8cc5d2e4cfbf42b0[self.team] = [];
            }
            if (!isdefined(level.var_8cc5d2e4cfbf42b0[self.team][self.var_ff97225579de16a])) {
                level.var_8cc5d2e4cfbf42b0[self.team][self.var_ff97225579de16a] = self;
                self.var_8cc5d2e4cfbf42b0 = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self, undefined, self, 0, 0, 0);
                if (isdefined(markedents)) {
                    foreach (ent in markedents) {
                        if (isdefined(ent) && istrue(ent.reconmarked)) {
                            namespace_f48c22429667eba9::targetmarkergroup_markentity(ent.target, self.var_8cc5d2e4cfbf42b0, 0);
                            function_ec57e0acbc6c6879(self.var_8cc5d2e4cfbf42b0, ent.target, 2);
                        }
                    }
                }
            } else {
                var_e97b73032a8f6b63 = level.var_8cc5d2e4cfbf42b0[self.team][self.var_ff97225579de16a].var_8cc5d2e4cfbf42b0;
                namespace_f48c22429667eba9::function_b76f204edb67efc7(var_e97b73032a8f6b63, self);
            }
        } else if (!isdefined(level.var_8cc5d2e4cfbf42b0[self.team])) {
            level.var_8cc5d2e4cfbf42b0[self.team] = self;
            self.var_8cc5d2e4cfbf42b0 = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self, undefined, self, 0, 0, 0);
            if (isdefined(markedents)) {
                foreach (ent in markedents) {
                    if (istrue(ent.reconmarked)) {
                        namespace_f48c22429667eba9::targetmarkergroup_markentity(ent.target, self.var_8cc5d2e4cfbf42b0, 0);
                        function_ec57e0acbc6c6879(self.var_8cc5d2e4cfbf42b0, ent.target, 2);
                    }
                }
            }
        } else {
            var_e1c6011321fd25b9 = level.var_8cc5d2e4cfbf42b0[self.team];
            namespace_f48c22429667eba9::function_b76f204edb67efc7(var_e1c6011321fd25b9.var_8cc5d2e4cfbf42b0, self);
        }
    } else if (!isdefined(self.var_8cc5d2e4cfbf42b0)) {
        self.var_8cc5d2e4cfbf42b0 = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self, undefined, self, 0, 0, 0);
        if (isdefined(markedents)) {
            foreach (ent in markedents) {
                if (istrue(ent.reconmarked)) {
                    namespace_f48c22429667eba9::targetmarkergroup_markentity(ent.target, self.var_8cc5d2e4cfbf42b0, 0);
                    function_ec57e0acbc6c6879(self.var_8cc5d2e4cfbf42b0, ent.target, 2);
                }
            }
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ad
// Size: 0x31
function function_89b59bedb3802e41() {
    var_e1c6011321fd25b9 = function_eaf65bb46d1bd1a8();
    if (isdefined(var_e1c6011321fd25b9)) {
        var_c8462289edfc0aca = var_e1c6011321fd25b9.var_8cc5d2e4cfbf42b0;
        return var_c8462289edfc0aca;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e5
// Size: 0x8f
function function_fe1cd71ed406a649() {
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    self.headiconbox = namespace_7bdde15c3500a23f::setheadicon_singleimage([], params.var_6c8c1a666ed5f48d, 5, 1, 1000, 100, undefined, 1);
    self.headiconfaction = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 5, undefined, undefined, undefined, undefined, 1);
    self.var_654dfe33aae5b35c = namespace_7bdde15c3500a23f::setheadicon_singleimage([], "icon_ping_warning", 5, 1, 1000, 100, undefined, 1);
    function_686c35e781f41189(params.var_5237a188ccda4d7b);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x337b
// Size: 0xd0
function private function_b3d22408d6a4c7ac() {
    if (isdefined(self.watchers) && self.watchers.size > 0) {
        var_7d4ca51d82f94be6 = getfirstarraykey(self.watchers);
        var_298f2cf18f67224a = self.var_1b381f3aa944d595[var_7d4ca51d82f94be6];
        foreach (player in self.watchers) {
            entnum = player getentitynumber();
            timestamp = self.var_1b381f3aa944d595[entnum];
            if (timestamp < var_298f2cf18f67224a) {
                var_7d4ca51d82f94be6 = entnum;
            }
        }
        return var_7d4ca51d82f94be6;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3452
// Size: 0x37
function function_3098442b001f283a(player) {
    var_fa103815a248994b = 0;
    if (isdefined(self.watchers)) {
        var_fa103815a248994b = array_contains(self.watchers, player);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3490
// Size: 0x70
function function_a96f380b39543647(camera) {
    level endon("game_ended");
    camera endon("death");
    camera endon("explode");
    camera notify("updateTag");
    camera endon("updateTag");
    self endon("disconnect");
    while (isdefined(camera.pilot)) {
        camera.var_a820130a6d38f1e4.angles = camera.pilot getplayerangles();
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3507
// Size: 0xe8
function function_ca19a92a4f9d5c3d(var_8862825a0618bda) {
    self endon("death");
    level endon("game_ended");
    self endon("disconnect");
    self notify("monitoringPlayerExit");
    self endon("monitoringPlayerExit");
    self.pilot waittill("playerLeavingCurrentCamera");
    params = function_f0698aee89c18210(var_8862825a0618bda);
    if (isdefined(self.watchers) && self.watchers.size > 0) {
        idx = function_b3d22408d6a4c7ac();
        var_c888a471b47d0b99 = self.watchers[idx];
        timestamp = self.var_1b381f3aa944d595[idx];
        if (!isdefined(self.pilot)) {
            var_c888a471b47d0b99 [[ params.var_be3314f77fef5d6b ]](self, 1);
            waitframe();
            if (isdefined(var_c888a471b47d0b99) && isdefined(self)) {
                var_c888a471b47d0b99 thread [[ params.startfunc ]](self);
            }
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f6
// Size: 0x38
function function_e910b2eba1af834c() {
    var_fc36664f5893d75d = 1000;
    starttime = gettime();
    while (gettime() - starttime < var_fc36664f5893d75d) {
        self disablephysicaldepthoffieldscripting();
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3635
// Size: 0xb8
function function_6976f2b3945c32f(var_8862825a0618bda) {
    var_be3314f77fef5d6b = function_f0698aee89c18210(var_8862825a0618bda).var_be3314f77fef5d6b;
    if (isdefined(self.pilot)) {
        self.pilot function_cdb15c1f9cab7852(self, var_8862825a0618bda);
    }
    if (isdefined(self.watchers) && self.watchers.size > 0) {
        foreach (watcher in self.watchers) {
            watcher [[ var_be3314f77fef5d6b ]](self, 0);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f4
// Size: 0x90
function function_3ecfbd63a3e3bed3(player) {
    if (!isdefined(self)) {
        return 0;
    }
    status = 0;
    distsq = distancesquared(self.origin, player.origin);
    if (self.hasexploded) {
        status = 3;
    } else if (distsq > function_f0698aee89c18210(self.var_8862825a0618bda).var_eff1ab975c47fe2) {
        status = 2;
    } else if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        status = 4;
    } else {
        status = 1;
    }
    return status;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x378c
// Size: 0x75
function private function_9b4db9a4213984ce(camera, index, state, time) {
    camera notify("cameraStatusWait");
    camera endon("cameraStatusWait");
    wait(time);
    if (state == 3 || !isdefined(camera)) {
        thread function_45556aa41f4f9ae8(camera, index, 0);
    } else if (function_309c31383efd7d3(camera)) {
        thread function_45556aa41f4f9ae8(camera, index, 5);
    } else {
        thread function_45556aa41f4f9ae8(camera, index, 1);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3808
// Size: 0x8c
function function_81fb12166c3c0c2(player, unset, var_c380eb54a8adb38c, var_5237a188ccda4d7b) {
    var_ec9d4d0ec3d77690 = player [[ var_c380eb54a8adb38c ]]();
    if (!isdefined(var_ec9d4d0ec3d77690)) {
        return;
    }
    foreach (camera in var_ec9d4d0ec3d77690) {
        camera function_ea3e848c25e3c926(player, unset, var_5237a188ccda4d7b);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389b
// Size: 0x74
function function_b3b59c099f93a503(var_d20dfbbbcd940269) {
    self endon("death");
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    lifetime = getdvarint(@"hash_13717e6e87cb530f", 120);
    function_8578449c3bec6372(lifetime, var_d20dfbbbcd940269);
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        self thread [[ params.destroyfunc ]]();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3916
// Size: 0x55
function private function_8578449c3bec6372(var_50f9dc4f0164e90f, var_d20dfbbbcd940269) {
    if (!istrue(var_d20dfbbbcd940269)) {
        self.owner endon("disconnect");
        self.owner endon("joined_team");
        self.owner endon("joined_spectators");
    }
    level endon("game_ended");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(var_50f9dc4f0164e90f);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3972
// Size: 0x35
function function_57b6e09eda0090d6(ison, var_6d693a3a62aa8398) {
    if (ison) {
        function_7203e7aa96ff0ba9(27);
        thread function_16fc807677a307be();
    } else {
        function_7203e7aa96ff0ba9(0, var_6d693a3a62aa8398);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ae
// Size: 0x64
function function_16fc807677a307be() {
    if (!isdefined(level.var_62f6f7640e4431e3) || !istrue(level.var_62f6f7640e4431e3.var_5b66ed80c98f795b)) {
        return;
    }
    self notify("decoy_monitor_death");
    level endon("game_ended");
    self endon("camera_destoyed");
    self waittill("death");
    function_57b6e09eda0090d6(0);
    function_86b60845e9a3d301("tacCam");
    self notify("tacticalCamera_allCamerasRemoved");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a19
// Size: 0x291
function function_4e3aa9d829b3e164(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_27b697504d9397d = 0;
    var_fbcabd62b8f66eb8 = physics_createcontents([0:"physicscontents_itemclip", 1:"physicscontents_item", 2:"physicscontents_clipshot", 3:"physicscontents_missileclip", 4:"physicscontents_vehicle", 5:"physicscontents_ainosight"]);
    var_eb381492a5db110a = undefined;
    if (isdefined(self.pilot)) {
        var_eb381492a5db110a = self.pilot getvieworigin();
    } else {
        var_eb381492a5db110a = self.origin + anglestoup(self.angles) * 3.5;
    }
    var_8a4ea3a3baa22e4 = target.origin;
    tracepoints = [0:var_8a4ea3a3baa22e4];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            headpos = target [[ getsharedfunc("player", "getStanceTop") ]]();
        }
        centerpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            centerpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
        }
        tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    } else if (isagent(target)) {
        tracepoints = [0:var_8a4ea3a3baa22e4 + (0, 0, 1)];
    }
    ignorelist = [0:self, 1:target];
    vehicle = target getvehicle();
    if (isdefined(vehicle)) {
        ignorelist[ignorelist.size] = vehicle;
        var_bb7ac665413117fc = vehicle getlinkedchildren(1);
        foreach (child in var_bb7ac665413117fc) {
            ignorelist[ignorelist.size] = vehicle;
        }
    }
    var_27b697504d9397d = 0;
    for (i = 0; i < tracepoints.size; i++) {
        trace = namespace_2a184fc4902783dc::sphere_trace(var_eb381492a5db110a, tracepoints[i], 0.01, ignorelist, var_fbcabd62b8f66eb8, undefined, 1);
        if (trace["hittype"] == "hittype_none") {
            var_27b697504d9397d = 1;
            break;
        }
    }
    return var_27b697504d9397d;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cb2
// Size: 0x10c
function private function_f597ec02db6aa057(var_161e86c260d6864c, timeout) {
    self.owner endon("disconnect");
    if (isdefined(self.pilot)) {
        self.pilot endon("disconnect");
    }
    target = var_161e86c260d6864c.target;
    target endon("death");
    starttime = gettime();
    while (timeout * 1000 + starttime >= gettime()) {
        wait(0.05);
        var_192cc07924877d71 = 0;
        if (namespace_5a51aa78ea0b1b9f::is_empd()) {
            break;
        }
        var_368ae33cb19f91f8 = function_9d2bec87e0754872(target);
        if (isdefined(self.pilot) && isdefined(self) && isdefined(self.owner) && var_368ae33cb19f91f8.var_20aa5b4097887cb6 && var_368ae33cb19f91f8.isinrange && var_368ae33cb19f91f8.isvisible) {
            var_192cc07924877d71 = 1;
        }
        if (var_192cc07924877d71) {
            starttime = gettime();
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc5
// Size: 0x224
function function_54dea0f6292103cb() {
    pilot = self.pilot;
    pilot endon("disconnect");
    self endon("death");
    pilot endon("playerLeavingCurrentCamera");
    var_820e590cb5620371 = 0;
    self.markingtarget = undefined;
    while (1) {
        if (!isdefined(pilot)) {
            return;
        }
        self.targethascoldblooded = 0;
        targets = self.pilot.targetsinouterradius;
        var_c8462289edfc0aca = self.pilot function_89b59bedb3802e41();
        foreach (player in targets) {
            if (var_820e590cb5620371 >= 3) {
                var_820e590cb5620371 = 0;
                waitframe();
            }
            if (isplayer(player) && issharedfuncdefined("player", "isReallyAlive")) {
                jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](player)) LOC_00000118;
            } else {
            LOC_00000118:
                if (isagent(player) && !isalive(player)) {
                    continue;
                }
                if (!isdefined(player)) {
                    continue;
                }
                if (namespace_5a51aa78ea0b1b9f::is_empd()) {
                    continue;
                }
                if (pilot function_f91c0feb9232b257(player)) {
                    continue;
                }
                var_820e590cb5620371++;
                function_ec57e0acbc6c6879(var_c8462289edfc0aca, player, 1);
                var_368ae33cb19f91f8 = function_9d2bec87e0754872(player);
                var_177716bec3407a6a = 0;
                if (issharedfuncdefined("perk", "hasPerk")) {
                    if (isplayer(player) && player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                        var_177716bec3407a6a = 1;
                    }
                }
                if (var_368ae33cb19f91f8.var_20aa5b4097887cb6 && var_177716bec3407a6a) {
                    self.targethascoldblooded = 1;
                }
                if (var_177716bec3407a6a) {
                    function_ec57e0acbc6c6879(var_c8462289edfc0aca, player, 3);
                } else {
                    if (!var_368ae33cb19f91f8.var_20aa5b4097887cb6) {
                        continue;
                    }
                    if (istrue(self.markingtarget)) {
                        continue;
                    }
                    thread function_a295dfcb64a39664(player, "enemy", 0, 1);
                }
            }
        }
        var_820e590cb5620371 = 0;
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ff0
// Size: 0x7e
function private function_348f9aa9ccb88ffa(target) {
    if (!isdefined(self.var_dae7e92e87a31e4)) {
        self.var_dae7e92e87a31e4 = [];
    }
    if (isdefined(self.var_dae7e92e87a31e4[target getentitynumber()])) {
        return;
    } else {
        var_7150dff45b6d6577 = spawnstruct();
        var_7150dff45b6d6577.target = target;
        var_7150dff45b6d6577.entnum = target getentitynumber();
        self.var_dae7e92e87a31e4[target getentitynumber()] = var_7150dff45b6d6577;
        return var_7150dff45b6d6577;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4075
// Size: 0x4b
function private function_8b7c344955f8b4c5(var_7150dff45b6d6577, var_57b8f3bcfca33a4b, var_5237a188ccda4d7b) {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    wait(var_57b8f3bcfca33a4b);
    function_b61404171c7a024b(var_7150dff45b6d6577);
    function_686c35e781f41189(var_5237a188ccda4d7b);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40c7
// Size: 0x3a
function private function_b61404171c7a024b(var_7150dff45b6d6577) {
    if (isdefined(self.var_dae7e92e87a31e4[var_7150dff45b6d6577.entnum])) {
        self.var_dae7e92e87a31e4[var_7150dff45b6d6577.entnum] = undefined;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4108
// Size: 0x80
function private function_5a659105ba755498(target, var_57b8f3bcfca33a4b, var_5237a188ccda4d7b) {
    var_7150dff45b6d6577 = function_348f9aa9ccb88ffa(target);
    if (!isdefined(var_7150dff45b6d6577)) {
        return;
    }
    self playsoundtoplayer("ui_camera_proximity_alert", self.owner, self);
    function_686c35e781f41189(var_5237a188ccda4d7b);
    self.owner thread function_45556aa41f4f9ae8(self, self.var_defbeed1a2c29c34, 2, undefined, 3.25);
    thread function_8b7c344955f8b4c5(var_7150dff45b6d6577, var_57b8f3bcfca33a4b, var_5237a188ccda4d7b);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x418f
// Size: 0x32
function function_ff216d4d2c47565c(state) {
    /#
        assertex(state == 0 || state == 5, "Deployable Camera state must be in the range 0 or 5.");
    #/
    self setclientomnvar("ui_rcd_controls", state);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41c8
// Size: 0x13e
function private function_c9fce57d5da1f571(camera, var_43b83976503b9e6d) {
    if (!isdefined(self) || !isdefined(camera)) {
        return;
    }
    level endon("game_ended");
    self endon("disconnect");
    self endon("end_remote");
    self endon("monitoringExit");
    camera endon("death");
    while (self usebuttonpressed()) {
        waitframe();
    }
    holdtime = getdvarfloat(@"hash_8720ead849d3fbc3", 0.25);
    if (isdefined(var_43b83976503b9e6d)) {
        holdtime = var_43b83976503b9e6d;
    }
    updaterate = level.framedurationseconds;
    var_6a16936225a5a8ce = 1;
    while (1) {
        timeused = 0;
        if (var_6a16936225a5a8ce == 1) {
            self setclientomnvar("ui_exit_progress", 0);
            var_6a16936225a5a8ce = 0;
        }
        while (self usebuttonpressed()) {
            if (istrue(self.var_a7d181863f388645)) {
                break;
            }
            var_86eb80ff19554b0c = self usinggamepad();
            if (!var_86eb80ff19554b0c && camera.var_8862825a0618bda == "tacCam") {
                holdtime = 0.01;
            }
            timeused = timeused + updaterate;
            var_6a16936225a5a8ce = 1;
            self setclientomnvar("ui_exit_progress", timeused / holdtime);
            if (timeused > holdtime) {
                self notify("cameraExit");
                return;
            }
            wait(updaterate);
        }
        wait(updaterate);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x430d
// Size: 0x69
function function_9ac601e206d92def(camera, var_c748b31a33c02c14, var_8862825a0618bda) {
    level endon("game_ended");
    camera endon("death");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    if (!isdefined(var_c748b31a33c02c14)) {
        var_c748b31a33c02c14 = function_f0698aee89c18210(var_8862825a0618bda).var_be3314f77fef5d6b;
    }
    childthread function_c9fce57d5da1f571(camera);
    self waittill("cameraExit");
    self thread [[ var_c748b31a33c02c14 ]](camera, 0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x437d
// Size: 0x54
function function_cdb15c1f9cab7852(camera, var_8862825a0618bda) {
    var_83049232bcf4e965 = function_367656975db3f139(camera);
    if (!istrue(var_83049232bcf4e965) && !istrue(self.var_a7d181863f388645)) {
        self thread [[ function_f0698aee89c18210(var_8862825a0618bda).var_be3314f77fef5d6b ]](camera, 0, 1);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d8
// Size: 0x73
function function_73af051ec0973e1(camera, var_ded994656b8d402a, var_8862825a0618bda) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (1) {
        var_c7aaf56ec881e7b1 = array_contains(self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a], camera);
        if (!var_c7aaf56ec881e7b1) {
            break;
        }
        wait(0.25);
    }
    function_cdb15c1f9cab7852(camera, var_8862825a0618bda);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4452
// Size: 0x11b
function private function_4842c3896892dc17(var_161e86c260d6864c, var_b995f95867de9aab) {
    teamref = var_b995f95867de9aab.team;
    if (level.teambased) {
        if (isdefined(level.var_7d17467eca3737aa)) {
            if (shouldmodesetsquads()) {
                if (isdefined(level.var_7d17467eca3737aa[teamref][var_b995f95867de9aab.var_ff97225579de16a])) {
                    level.var_7d17467eca3737aa[teamref][var_b995f95867de9aab.var_ff97225579de16a] = array_remove_key(level.var_7d17467eca3737aa[teamref][var_b995f95867de9aab.var_ff97225579de16a], var_161e86c260d6864c.targetnum);
                }
            } else if (isdefined(level.var_7d17467eca3737aa[teamref])) {
                level.var_7d17467eca3737aa[teamref] = array_remove_key(level.var_7d17467eca3737aa[teamref], var_161e86c260d6864c.targetnum);
            }
        }
    } else if (isdefined(var_b995f95867de9aab.markedents)) {
        var_b995f95867de9aab.markedents = array_remove_key(var_b995f95867de9aab.markedents, var_161e86c260d6864c.targetnum);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4574
// Size: 0x11f
function private function_9921a8095e089065(var_161e86c260d6864c, var_b995f95867de9aab) {
    teamref = var_b995f95867de9aab.team;
    if (level.teambased) {
        if (!isdefined(level.var_7d17467eca3737aa)) {
            level.var_7d17467eca3737aa = [];
        }
        if (!isdefined(level.var_7d17467eca3737aa[teamref])) {
            level.var_7d17467eca3737aa[teamref] = [];
        }
        if (shouldmodesetsquads()) {
            if (!isdefined(level.var_7d17467eca3737aa[teamref][var_b995f95867de9aab.var_ff97225579de16a])) {
                level.var_7d17467eca3737aa[teamref][var_b995f95867de9aab.var_ff97225579de16a] = [];
            }
            level.var_7d17467eca3737aa[teamref][var_b995f95867de9aab.var_ff97225579de16a][var_161e86c260d6864c.targetnum] = var_161e86c260d6864c;
        } else {
            level.var_7d17467eca3737aa[teamref][var_161e86c260d6864c.targetnum] = var_161e86c260d6864c;
        }
    } else {
        if (!isdefined(var_b995f95867de9aab.markedents)) {
            var_b995f95867de9aab.markedents = [];
        }
        var_b995f95867de9aab.markedents[var_161e86c260d6864c.targetnum] = var_161e86c260d6864c;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469a
// Size: 0x145
function function_47c44d1bf801b8f0(var_161e86c260d6864c, var_b995f95867de9aab, useoutline) {
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(var_161e86c260d6864c.headicon);
    teamref = var_b995f95867de9aab.team;
    var_c8462289edfc0aca = var_b995f95867de9aab function_89b59bedb3802e41();
    function_4842c3896892dc17(var_161e86c260d6864c, var_b995f95867de9aab);
    if (isdefined(var_161e86c260d6864c.target)) {
        if (isdefined(var_c8462289edfc0aca) && namespace_f48c22429667eba9::targetmarkergroupexists(var_c8462289edfc0aca)) {
            function_ec57e0acbc6c6879(var_c8462289edfc0aca, var_161e86c260d6864c.target, 0);
        }
        var_161e86c260d6864c.reconmarked = undefined;
        var_161e86c260d6864c.beingmarked = undefined;
        if (isplayer(var_161e86c260d6864c.target) && useoutline) {
            if (issharedfuncdefined("outline", "outlineDisable")) {
                [[ getsharedfunc("outline", "outlineDisable") ]](var_161e86c260d6864c.outlineid, var_161e86c260d6864c.target);
            }
            if (issharedfuncdefined("outline", "hudOutlineViewmodelDisable")) {
                var_161e86c260d6864c.target [[ getsharedfunc("outline", "hudOutlineViewmodelDisable") ]]();
            }
        }
        var_161e86c260d6864c.target notify(var_161e86c260d6864c.notifytoendmark);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e6
// Size: 0x27
function function_c84cfcb1299f9b39() {
    if (isdefined(self.pilot)) {
        return self.pilot;
    } else {
        return self.owner;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4814
// Size: 0x117
function function_362c9a13d18031b1(var_7295a7fafbe0d543, var_4df19ef5b565978e, var_9410874ee76bf58e) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(var_9410874ee76bf58e);
    laststate = [];
    while (1) {
        time = var_bf15527477b41565 = state = index = camera = self waittill(var_7295a7fafbe0d543);
        if (isdefined(laststate[index])) {
            if (isdefined(laststate[index][0])) {
                if (laststate[index][0] != camera) {
                    if (state == 0 || state == 3 || state == 5) {
                        continue;
                    }
                }
            }
        }
        /#
            print("equip_claymore" + index + "equipment" + state + "camera_destoyed");
        #/
        self setclientomnvar(var_4df19ef5b565978e + index + "_status", state);
        if (state > 1 && state != 5) {
            childthread function_9b4db9a4213984ce(camera, index, state, time);
        }
        if (!isdefined(camera)) {
            laststate[index] = undefined;
        } else {
            laststate[index] = [0:camera, 1:state];
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4932
// Size: 0x40
function function_7858aa4f2bc91d80() {
    starttime = gettime();
    timeelapsed = starttime;
    while (timeelapsed < starttime + 10) {
        thread function_ff216d4d2c47565c(0);
        timeelapsed = timeelapsed + gettime() - timeelapsed;
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4979
// Size: 0x9b
function function_b501ce7305720779(camera) {
    var_4a3bbcea93cb04c5 = 0;
    if (!isdefined(camera.owner)) {
        return 0;
    }
    if (level.teambased) {
        if (shouldmodesetsquads()) {
            if (camera.owner.var_ff97225579de16a == self.var_ff97225579de16a) {
                var_4a3bbcea93cb04c5 = 1;
            }
        } else if (camera.ownerteam == self.team) {
            var_4a3bbcea93cb04c5 = 1;
        }
    } else if (camera.owner == self) {
        var_4a3bbcea93cb04c5 = 1;
    }
    return var_4a3bbcea93cb04c5;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1c
// Size: 0x257
function function_f6ba29efe27b0f81(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_efb14e53541b5b48 = self gettagangles("tag_player");
    var_51743d62f4cf524e = self gettagorigin("tag_player");
    if (isdefined(self.pilot)) {
        var_efb14e53541b5b48 = self.pilot getplayerangles();
        var_51743d62f4cf524e = self.pilot getvieworigin();
    }
    var_b5837ee451eabc71 = anglestoforward(var_efb14e53541b5b48);
    var_8a4ea3a3baa22e4 = target.origin;
    headpos = (0, 0, 0);
    if (issharedfuncdefined("player", "isReallyAlive")) {
        headpos = target [[ getsharedfunc("player", "getStanceTop") ]]();
    }
    centerpos = (0, 0, 0);
    if (issharedfuncdefined("player", "isReallyAlive")) {
        centerpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
    }
    tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    var_9ae205c4c40af967 = 0;
    foreach (point in tracepoints) {
        var_f4a43e5290bce44b = point - var_51743d62f4cf524e;
        var_56699f8802baa8e7 = math::anglebetweenvectors(var_b5837ee451eabc71, var_f4a43e5290bce44b);
        var_878f0eb51ab6a646 = math::anglebetweenvectors(var_b5837ee451eabc71, (0, 0, 1));
        var_cea5805c08f245d2 = math::anglebetweenvectors(var_f4a43e5290bce44b, (0, 0, 1));
        if (isdefined(self.pilot)) {
            var_e077f4a68ed9a464 = distancesquared(var_51743d62f4cf524e, point);
            if (var_e077f4a68ed9a464 > 10000) {
                if (abs(abs(var_878f0eb51ab6a646) - abs(var_cea5805c08f245d2)) > getdvarfloat(@"hash_77f60c1216fca977", 19)) {
                    return var_9ae205c4c40af967;
                }
            }
        }
        if (var_56699f8802baa8e7 <= getdvarfloat(@"hash_a20d9fbeab627f6", 31)) {
            var_9ae205c4c40af967 = 1;
        }
    }
    return var_9ae205c4c40af967;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c7b
// Size: 0x234
function private function_1b1409af5e47b098(var_d89f028a5c8db805, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a) {
    if (!isdefined(var_d89f028a5c8db805)) {
        return 0;
    }
    var_9b96536b85a38bc6 = 0;
    targetorigin = var_d89f028a5c8db805.origin;
    var_4e95fb5ddda03a33 = [0:targetorigin];
    var_c3d9e0b30c6f14a4 = distancesquared(self getvieworigin(), var_d89f028a5c8db805.origin);
    var_251f6ff6684a460c = 0;
    if (var_c3d9e0b30c6f14a4 <= 10000) {
        var_5e43b44751d01b1a = var_5e43b44751d01b1a * getdvarfloat(@"hash_20c9852b3129de04", 2.5);
        var_251f6ff6684a460c = 1;
    }
    if (isplayer(var_d89f028a5c8db805)) {
        var_40e2f5706584505c = var_d89f028a5c8db805 function_415fe9eeca7b2e2b();
        headpos = var_d89f028a5c8db805 namespace_7e17181d03156026::getstancetop();
        centerpos = var_d89f028a5c8db805 namespace_7e17181d03156026::getstancecenter();
        var_4e95fb5ddda03a33 = [0:headpos, 1:centerpos];
        if (!var_40e2f5706584505c) {
            var_4e95fb5ddda03a33 = array_add(var_4e95fb5ddda03a33, targetorigin);
        }
        if (var_251f6ff6684a460c) {
            var_102502c44898b35c = (headpos + centerpos) / 2;
            extrapoints = [0:var_102502c44898b35c];
            if (!var_40e2f5706584505c) {
                var_264b006395220d6 = (centerpos + targetorigin) / 2;
                extrapoints = array_add(extrapoints, var_264b006395220d6);
            }
            var_4e95fb5ddda03a33 = array_combine(var_4e95fb5ddda03a33, extrapoints);
        }
    } else if (isagent(var_d89f028a5c8db805)) {
        centerpos = var_d89f028a5c8db805 namespace_86b52005c685dfb9::function_b071e509c0fb69b0();
        headpos = var_d89f028a5c8db805 namespace_86b52005c685dfb9::function_2e1b23386b967c10();
        var_4e95fb5ddda03a33 = [0:targetorigin + (0, 0, 1), 1:centerpos, 2:headpos];
        if (var_251f6ff6684a460c) {
            var_264b006395220d6 = (centerpos + targetorigin) / 2;
            var_102502c44898b35c = (headpos + centerpos) / 2;
            extrapoints = [0:var_264b006395220d6, 1:var_102502c44898b35c];
            var_4e95fb5ddda03a33 = array_combine(var_4e95fb5ddda03a33, extrapoints);
        }
    }
    foreach (point in var_4e95fb5ddda03a33) {
        if (self worldpointinreticle_circle(point, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a)) {
            var_9b96536b85a38bc6 = 1;
            break;
        }
    }
    return var_9b96536b85a38bc6;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb7
// Size: 0x2d
function function_f254912b43c0f30a(target) {
    if (!isdefined(target)) {
        return 0;
    }
    return array_contains(self.pilot.targetsinouterradius, target);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eec
// Size: 0x29
function function_58a0cad2aba60238(camera) {
    return isdefined(camera.pilot) && self == camera.pilot;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f1d
// Size: 0x23
function function_fc9294ffbd3490f3() {
    self notify("supportBox_makeUnusable");
    namespace_ad136f1d5091df4a::interactive_removeusedcallbackfromentity();
    self makeunusable();
    self.playersused = undefined;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f47
// Size: 0x35
function function_88b3522bbdf2f7c1(ison) {
    var_68d9e792fe9def4d = "off";
    if (ison) {
        var_68d9e792fe9def4d = "on";
    }
    self setscriptablepartstate("target_marked", var_68d9e792fe9def4d, 0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f83
// Size: 0x68
function function_e593b8f6770c67e(var_161e86c260d6864c) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_f1493744aa061205(var_161e86c260d6864c, player);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ff2
// Size: 0x95
function function_f1493744aa061205(var_161e86c260d6864c, player) {
    if (!isdefined(var_161e86c260d6864c)) {
        return;
    }
    isfriendly = function_c2c3f444cfeb61ca(var_161e86c260d6864c, player);
    isusingcamera = isdefined(var_161e86c260d6864c.markingent) && istrue(player.isusingcamera);
    if (isdefined(var_161e86c260d6864c.headicon)) {
        if (isfriendly && !isusingcamera) {
            namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_161e86c260d6864c.headicon, player);
        } else {
            namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_161e86c260d6864c.headicon, player);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x508e
// Size: 0x16
function function_57d6a393b90824dc(maxz) {
    level.var_e87db96e1a77a100 = maxz;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ab
// Size: 0xb1
function function_6436809a4ed7e363() {
    if (function_2e2ac10bd717d529(self.var_8862825a0618bda, self.origin, self.owner.team)) {
        return 0;
    }
    if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(self.origin, self.owner.team)) {
        return 0;
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = self [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            return 0;
        }
    }
    if (!isdefined(level.var_e87db96e1a77a100)) {
        return 1;
    }
    if (self.origin[2] > level.var_e87db96e1a77a100) {
        return 0;
    }
    return 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5164
// Size: 0xb5
function function_5e8b74f5e3dc4c60() {
    self.owner endon("disconnect");
    self endon("death");
    var_1c945b3ba45ae582 = function_f0698aee89c18210(self.var_8862825a0618bda).destroyfunc;
    while (1) {
        isoob = namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(self.origin, self.owner.team);
        var_44ed718ee62282e1 = namespace_5633828963c62e57::function_6436809a4ed7e363();
        if (isoob || !var_44ed718ee62282e1) {
            if (istrue(self.var_11f51147ccff0163)) {
                self.owner refundsuper();
            }
            self thread [[ var_1c945b3ba45ae582 ]]();
        }
        wait(0.1);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5220
// Size: 0xd3
function function_2e2ac10bd717d529(var_8862825a0618bda, var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    var_e448b9771980dfd6 = 0;
    var_ac939183eb3c79d8 = function_f0698aee89c18210(var_8862825a0618bda).var_106bf36856a998f;
    if (!isdefined(var_ac939183eb3c79d8)) {
        return var_e448b9771980dfd6;
    } else {
        foreach (trigger in var_ac939183eb3c79d8) {
            if (ispointinvolume(var_863c619037f3ac74, trigger)) {
                if (isdefined(trigger.script_team) && isdefined(var_da8cec9bce12f9cb) && trigger.script_team != var_da8cec9bce12f9cb) {
                    continue;
                } else {
                    var_e448b9771980dfd6 = 1;
                    break;
                }
            }
        }
    }
    return var_e448b9771980dfd6;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52fb
// Size: 0x3c
function function_66758c7fff976896() {
    if (!isdefined(self.creationtime)) {
        return 1;
    }
    if (self.creationtime + 50 >= gettime()) {
        return 1;
    }
    if (istrue(self.var_86b37b7a946b6a67)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533f
// Size: 0x83
function function_e170d8c3cacdbaf5(camera, var_cde48a8a76bc5cd0, var_8862825a0618bda) {
    level endon("game_ended");
    self endon("disconnect");
    camera endon("entering");
    if (isdefined(var_cde48a8a76bc5cd0)) {
        self endon(var_cde48a8a76bc5cd0);
    }
    var_c748b31a33c02c14 = function_f0698aee89c18210(var_8862825a0618bda).var_be3314f77fef5d6b;
    waittill_any_4("death", "killed_player", "last_stand_start", "successful_exfil");
    if (istrue(self.isusingcamera)) {
        [[ var_c748b31a33c02c14 ]](camera, 0);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53c9
// Size: 0x199
function function_3c4da29d1ed157c7(var_ded994656b8d402a, var_cde48a8a76bc5cd0, var_83fa915761bef20, maxdistsq, var_c380eb54a8adb38c) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(var_cde48a8a76bc5cd0);
    self notify("cameraClusterMonitored");
    self endon("cameraClusterMonitored");
    if (!isdefined(self.var_7d73cbb5ca5d6e32)) {
        self.var_7d73cbb5ca5d6e32 = [];
    }
    self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a] = [];
    childthread function_e65f72cdec46d03e(var_ded994656b8d402a, var_83fa915761bef20);
    while (1) {
        waitframe();
        var_b65e76e261a6ed4d = self [[ var_c380eb54a8adb38c ]]();
        if (!isdefined(var_b65e76e261a6ed4d)) {
            continue;
        }
        foreach (camera in var_b65e76e261a6ed4d) {
            var_c7aaf56ec881e7b1 = array_contains(self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a], camera);
            if (!isdefined(camera) || istrue(camera.isdestroyed)) {
                if (var_c7aaf56ec881e7b1) {
                    function_6afedddb11741fc9(camera, var_ded994656b8d402a);
                }
            } else if (distancesquared(self.origin, camera.origin) <= maxdistsq) {
                if (!var_c7aaf56ec881e7b1) {
                    if (camera.owner == self) {
                        function_32c845c60c4e4b37(camera, 0);
                    }
                    function_3fb26da0d61f648b(camera, var_ded994656b8d402a);
                }
            } else if (var_c7aaf56ec881e7b1) {
                if (camera.owner == self) {
                    function_32c845c60c4e4b37(camera, 1);
                }
                function_6afedddb11741fc9(camera, var_ded994656b8d402a);
            }
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5569
// Size: 0x40
function private function_32c845c60c4e4b37(camera, var_bdef0c930308d4b7) {
    camera.var_50aa75d01d4622bb = var_bdef0c930308d4b7;
    thread function_45556aa41f4f9ae8(camera, camera.var_defbeed1a2c29c34, ter_op(var_bdef0c930308d4b7, 5, 1));
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55b0
// Size: 0x18
function private function_309c31383efd7d3(camera) {
    return istrue(camera.var_50aa75d01d4622bb);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55d0
// Size: 0x49
function private function_e65f72cdec46d03e(var_ded994656b8d402a, var_83fa915761bef20) {
    while (1) {
        camera = level waittill(var_83fa915761bef20);
        if (array_contains(self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a], camera)) {
            function_6afedddb11741fc9(camera, var_ded994656b8d402a);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5620
// Size: 0x32
function private function_3fb26da0d61f648b(camera, var_ded994656b8d402a) {
    self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a] = array_add(self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a], camera);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5659
// Size: 0x32
function private function_6afedddb11741fc9(camera, var_ded994656b8d402a) {
    self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a] = array_remove(self.var_7d73cbb5ca5d6e32[var_ded994656b8d402a], camera);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5692
// Size: 0x199
function private function_23643a7487214603(target, camera) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    camera endon("death");
    camera endon("emp_applied");
    var_c8462289edfc0aca = function_89b59bedb3802e41();
    if (!isdefined(var_c8462289edfc0aca)) {
        return;
    }
    self.targetsinouterradius[self.targetsinouterradius.size] = target;
    namespace_f48c22429667eba9::targetmarkergroup_markentity(target, var_c8462289edfc0aca, 0);
    function_ec57e0acbc6c6879(var_c8462289edfc0aca, target, 0);
    self playlocalsound("equip_tactical_cam_passive_marked");
    while (isdefined(target)) {
        if (isplayer(target) && issharedfuncdefined("player", "isReallyAlive")) {
            if (![[ getsharedfunc("player", "isReallyAlive") ]](target)) {
                break;
            }
        }
        if (isagent(target) && !isalive(target)) {
            break;
        }
        var_368ae33cb19f91f8 = camera function_9d2bec87e0754872(target);
        if (!function_f91c0feb9232b257(target)) {
            if (!istrue(var_368ae33cb19f91f8.isindetectrange) || !istrue(var_368ae33cb19f91f8.isvisible) || !istrue(var_368ae33cb19f91f8.var_9ae205c4c40af967)) {
                break;
            }
        }
        waitframe();
    }
    if (isdefined(target)) {
        var_c8462289edfc0aca = function_89b59bedb3802e41();
        if (isdefined(var_c8462289edfc0aca)) {
            if (namespace_f48c22429667eba9::targetmarkergroupexists(var_c8462289edfc0aca) && !function_f91c0feb9232b257(target)) {
                namespace_f48c22429667eba9::targetmarkergroup_unmarkentity(target, var_c8462289edfc0aca);
            }
        }
        if (array_contains(self.targetsinouterradius, target)) {
            self.targetsinouterradius = array_remove(self.targetsinouterradius, target);
        }
    } else {
        self.targetsinouterradius = array_removeundefined(self.targetsinouterradius);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5832
// Size: 0x11f
function private function_2d3e2d45f75d7b9f(camera, ent) {
    if (!isdefined(ent)) {
        return 0;
    }
    if (isplayer(ent)) {
        if (issharedfuncdefined("player", "isReallyAlive")) {
            if (![[ getsharedfunc("player", "isReallyAlive") ]](ent)) {
                return 0;
            }
        }
    }
    if (isagent(ent) && !isalive(ent)) {
        return 0;
    }
    if (level.teambased) {
        if (isdefined(ent.team) && ent.team == self.team) {
            return 0;
        }
    } else {
        if (isplayer(ent) && ent == self) {
            return 0;
        }
        if (isdefined(ent.owner) && ent.owner == self) {
            return 0;
        }
    }
    if (!camera function_a268c4595bd106ff(ent)) {
        return 0;
    }
    if (function_f91c0feb9232b257(ent)) {
        return 0;
    }
    if (camera namespace_5a51aa78ea0b1b9f::is_empd()) {
        return 0;
    }
    if (camera function_f254912b43c0f30a(ent)) {
        return 0;
    }
    if (!camera function_f6ba29efe27b0f81(ent)) {
        return 0;
    }
    if (!camera function_4e3aa9d829b3e164(ent)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5959
// Size: 0xeb
function function_fc89b224136fe202(camera) {
    level endon("game_ended");
    self endon("disconnect");
    camera endon("death");
    self endon("playerLeavingCurrentCamera");
    self.targetsinouterradius = [];
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player", 1:"etype_ai"]);
    while (1) {
        targetarray = function_b1eef70090b5b7b5(camera.origin, 1575, var_4f35a480b277acb6);
        foreach (ent in targetarray) {
            var_32608e38aa3071c4 = function_2d3e2d45f75d7b9f(camera, ent);
            if (var_32608e38aa3071c4) {
                thread function_23643a7487214603(ent, camera);
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4b
// Size: 0x22f
function function_c99b3a2b715c288b(duration, var_5237a188ccda4d7b) {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self endon("entering");
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player", 1:"etype_ai"]);
    while (1) {
        targetarray = function_b1eef70090b5b7b5(self.origin, 1575, var_4f35a480b277acb6);
        foreach (ent in targetarray) {
            if (!isdefined(ent)) {
                continue;
            }
            if (isplayer(ent) || isbot(ent)) {
                jumpiffalse(issharedfuncdefined("player", "isReallyAlive")) LOC_00000108;
                jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](ent)) LOC_00000108;
            } else {
            LOC_00000108:
                if (isagent(ent) && !isalive(ent)) {
                    continue;
                }
                if (level.teambased) {
                    if (isdefined(ent.team) && ent.team == self.ownerteam) {
                        continue;
                    }
                } else if (ent == self.owner) {
                    continue;
                }
                if (namespace_5a51aa78ea0b1b9f::is_empd()) {
                    continue;
                }
                var_368ae33cb19f91f8 = function_9d2bec87e0754872(ent);
                if (!var_368ae33cb19f91f8.isinrange || !var_368ae33cb19f91f8.isvisible || !var_368ae33cb19f91f8.isindetectrange || !var_368ae33cb19f91f8.var_9ae205c4c40af967) {
                    continue;
                }
                if (self.owner function_f91c0feb9232b257(ent)) {
                    continue;
                }
                if (istrue(self.markingtarget)) {
                    continue;
                }
                params = function_f0698aee89c18210(self.var_8862825a0618bda);
                function_5a659105ba755498(ent, params.var_57b8f3bcfca33a4b, params.var_5237a188ccda4d7b);
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c81
// Size: 0x22c
function function_ea702996ea718070() {
    self endon("death");
    level endon("game_ended");
    self setmode("manual");
    worldup = anglestoup((0, 0, 1));
    var_c83a8d3d629f1dac = anglestoup(self.angles);
    var_fccbf8939ad0065 = vectordot(worldup, var_c83a8d3d629f1dac);
    var_9745168c66baba25 = var_fccbf8939ad0065 < -0.001;
    var_9ffcc6e392e7660e = var_fccbf8939ad0065 >= -0.001 && var_fccbf8939ad0065 <= 0.001;
    var_243889c6e373ef11 = var_fccbf8939ad0065 > 0.001;
    if (var_9ffcc6e392e7660e) {
        var_5cbacc152fe4fd06 = anglestoup(self.angles);
        var_bebbfd784c183fdc = vectortoangles(var_5cbacc152fe4fd06);
    } else {
        var_5cbacc152fe4fd06 = anglestoforward(self.angles);
        var_bebbfd784c183fdc = vectortoangles(var_5cbacc152fe4fd06);
    }
    direction = 1;
    var_466e4d7d54778d71 = anglestoright(var_bebbfd784c183fdc);
    var_3117e27e0168d75e = anglestoforward(var_bebbfd784c183fdc);
    destpos = self.origin + var_466e4d7d54778d71 * 100 * direction;
    var_225777dddbe18ee = spawn_script_origin(destpos);
    level thread draw_angles(var_bebbfd784c183fdc, self.origin, (1, 0, 0), 1000, 50);
    while (1) {
        self settargetentity(var_225777dddbe18ee);
        level thread draw_angles(var_bebbfd784c183fdc, destpos, (1, 0, 0), 1000, 50);
        anglediff = math::anglebetweenvectors(anglestoforward(self gettagangles("tag_player")), var_466e4d7d54778d71);
        while (anglediff > 10 && anglediff < 170) {
            anglediff = math::anglebetweenvectors(anglestoforward(self gettagangles("tag_player")), var_466e4d7d54778d71);
            waitframe();
        }
        direction = direction * -1;
        destpos = self.origin + var_466e4d7d54778d71 * 100 * direction;
        var_225777dddbe18ee.origin = destpos;
        self cleartargetentity(var_225777dddbe18ee);
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5eb4
// Size: 0x22d
function private function_a295dfcb64a39664(target, var_39e02a8a79b6ba4c, var_cad4997ebda279c7, useoutline) {
    pilot = self.pilot;
    pilot endon("disconnect");
    self.owner endon("disconnect");
    level endon("game_ended");
    self endon("explode");
    pilot endon("playerLeavingCurrentCamera");
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    var_161e86c260d6864c = spawnstruct();
    var_161e86c260d6864c.target = target;
    var_161e86c260d6864c.targetnum = target getentitynumber();
    var_161e86c260d6864c.markingent = self;
    var_161e86c260d6864c.ownerteam = self.ownerteam;
    var_161e86c260d6864c.outlineid = undefined;
    var_161e86c260d6864c.headicon = undefined;
    var_161e86c260d6864c.beingmarked = undefined;
    var_161e86c260d6864c.reconmarked = undefined;
    var_161e86c260d6864c.notifytoendmark = "unmarked_" + var_161e86c260d6864c.targetnum;
    if (!isdefined(var_161e86c260d6864c.targetnum)) {
        return;
    }
    if (!isdefined(pilot)) {
        return;
    }
    var_c8462289edfc0aca = pilot function_89b59bedb3802e41();
    if (!isdefined(var_c8462289edfc0aca)) {
        return;
    }
    self.markingtarget = 1;
    pilot notify("marking_target");
    var_2095b8a1afaaf65e = self [[ params.var_6e5f6320607eb69 ]](target);
    pilot playlocalsound(params.var_91389dd68a70be33);
    self setscriptablepartstate("marking_target", "on", 0);
    while (var_2095b8a1afaaf65e > 0) {
        var_161e86c260d6864c.beingmarked = 1;
        if (!isdefined(target)) {
            return;
        }
        if (!pilot function_1b1409af5e47b098(target, 80, 40)) {
            var_161e86c260d6864c.beingmarked = undefined;
            self.markingtarget = undefined;
            pilot stoplocalsound("equip_tactical_cam_marking");
            self setscriptablepartstate("marking_target", "off", 0);
            pilot function_ff216d4d2c47565c(5);
            return;
        }
        var_2095b8a1afaaf65e = var_2095b8a1afaaf65e - 0.05;
        wait(0.05);
    }
    self thread [[ params.var_273f2a99f4833f00 ]](var_161e86c260d6864c, pilot, target, var_39e02a8a79b6ba4c, var_cad4997ebda279c7, useoutline);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x60e8
// Size: 0x18
function private function_7853d0aadd9c1525(target) {
    return istrue(target.beingmarked);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6108
// Size: 0x77
function function_6643dd06cf63b76a(var_161e86c260d6864c, var_b995f95867de9aab, timeout, useoutline) {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("explode");
    target = var_161e86c260d6864c.target;
    target endon(var_161e86c260d6864c.notifytoendmark);
    function_f597ec02db6aa057(var_161e86c260d6864c, timeout);
    function_47c44d1bf801b8f0(var_161e86c260d6864c, var_b995f95867de9aab, useoutline);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6186
// Size: 0x7b
function private function_b5be8b2f7743c406(delaytime, var_bc0df70f0a03d70b) {
    pilot = self.pilot;
    if (!isdefined(pilot)) {
        return;
    }
    level endon("game_ended");
    self endon("death");
    pilot endon("playerLeavingCurrentCamera");
    pilot endon("disconnect");
    pilot endon("marking_target");
    wait(delaytime);
    if (pilot.isusingcamera && pilot.currentcamera == self) {
        pilot function_ff216d4d2c47565c(var_bc0df70f0a03d70b);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6208
// Size: 0x2b6
function function_6f8fb8f7f63e5164(var_161e86c260d6864c, var_18cd5943fe5c2a7d, var_cad4997ebda279c7, useoutline) {
    target = var_161e86c260d6864c.target;
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    markedents = function_d103dc61e5b6abc3(var_18cd5943fe5c2a7d);
    if (isdefined(markedents) && array_contains_key(markedents, var_161e86c260d6864c.targetnum)) {
        return 0;
    }
    function_9921a8095e089065(var_161e86c260d6864c, var_18cd5943fe5c2a7d);
    var_39e02a8a79b6ba4c = "player";
    if (isagent(target)) {
        var_39e02a8a79b6ba4c = "agent";
    }
    self [[ params.var_547e8b267c03d017 ]](var_161e86c260d6864c.target, var_39e02a8a79b6ba4c);
    var_f98e48f2527d4205 = "hud_icon_new_marked";
    if (namespace_7bdde15c3500a23f::function_6ede573723f08c0f()) {
        var_f98e48f2527d4205 = "hud_icon_head_marked";
    }
    var_f9cd7fda74e92e2a = 8;
    if (isplayer(target)) {
        if (istrue(useoutline)) {
            if (level.teambased) {
                if (issharedfuncdefined("outline", "outlineEnableForTeam")) {
                    var_161e86c260d6864c.outlineid = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](target, "orange", self.owner.team, 0, 1, 0, "killstreak");
                }
            } else if (issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                var_161e86c260d6864c.outlineid = [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](target, "orange", self.owner, 0, 1, 0, "killstreak");
            }
            if (issharedfuncdefined("outline", "hudOutlineViewmodelEnable")) {
                target [[ getsharedfunc("outline", "hudOutlineViewmodelEnable") ]](5, 0, 1);
            }
        }
        target thread function_7d61d7b52c318d47();
        target function_748f3520a7e525a9();
        target playlocalsound("recon_drone_spotted_plr");
    } else {
        var_c6e17b4bc2eed915 = function_74598558cd270375(var_f98e48f2527d4205, var_f9cd7fda74e92e2a, target);
        var_f98e48f2527d4205 = var_c6e17b4bc2eed915.weaponicon;
        var_f9cd7fda74e92e2a = var_c6e17b4bc2eed915.weaponoffset;
    }
    if (istrue(var_cad4997ebda279c7)) {
        var_161e86c260d6864c.headicon = target namespace_7bdde15c3500a23f::setheadicon_singleimage([], var_f98e48f2527d4205, var_f9cd7fda74e92e2a, 1, 4000, 500, undefined, 1, 1);
        function_e593b8f6770c67e(var_161e86c260d6864c);
    }
    if (issharedfuncdefined("helper_drone", "watchMarkingEntStatus")) {
        self thread [[ getsharedfunc("helper_drone", "watchMarkingEntStatus") ]](var_161e86c260d6864c);
    }
    thread function_b5be8b2f7743c406(self [[ params.var_6e5f6320607eb69 ]](var_161e86c260d6864c.target), 5);
    return 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64c6
// Size: 0x91
function function_7abfae4e338cc940(player, func) {
    var_7305a0e8014e47be = function_d103dc61e5b6abc3(player);
    if (isdefined(var_7305a0e8014e47be)) {
        foreach (ent in var_7305a0e8014e47be) {
            if (istrue(ent.reconmarked)) {
                [[ func ]](var_7305a0e8014e47be[ent.targetnum], player);
            }
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655e
// Size: 0x9c
function function_1e34b5a5489be90(camera, var_7873097f48bd513, var_8862825a0618bda) {
    /#
        assertex(camera.pilot == self, "Camera is attempting to remove a pilot that isn't the player it's being called on");
    #/
    notification = function_f0698aee89c18210(var_8862825a0618bda).var_36411d05d3f1e503;
    level endon("game_ended");
    if (!var_7873097f48bd513) {
        function_7abfae4e338cc940(self, &function_f1493744aa061205);
        function_bfcdb898d70f248c();
    }
    camera.pilot = undefined;
    camera setscriptablepartstate("piloted", "off", 0);
    level notify(notification, camera);
    self remotecontrolturretoff(camera);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6601
// Size: 0xca
function function_b4e750dbd5734b12(camera, var_7873097f48bd513) {
    if (isdefined(camera.watchers) && isdefined(camera)) {
        var_c88649561f89170a = array_find(camera.watchers, self);
        if (isdefined(var_c88649561f89170a)) {
            camera.watchers = array_remove(camera.watchers, camera.watchers[var_c88649561f89170a]);
            camera.var_1b381f3aa944d595 = array_remove(camera.var_1b381f3aa944d595, camera.var_1b381f3aa944d595[var_c88649561f89170a]);
            if (!var_7873097f48bd513) {
                function_7abfae4e338cc940(self, &function_f1493744aa061205);
                function_bfcdb898d70f248c();
            }
            self cameraunlink();
            self lerpfovbypreset("default");
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d2
// Size: 0xc5
function function_81704d1224bd6fe0(usingcamera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (usingcamera) {
        val::set("tactical_camera_actions", "weapon_switch", 0);
        val::set("tactical_camera_actions", "offhand_weapons", 0);
        val::set("tactical_camera_actions", "fire", 0);
        val::set("tactical_camera_actions", "killstreaks", 0);
        val::set("tactical_camera_actions", "allow_movement", 0);
        val::set("tactical_camera_actions", "armor", 0);
        if (namespace_32b635fd0594e0cc::function_258c5e445c8b7f80()) {
            val::set("tactical_camera_actions", "nvg", 0);
        }
        function_7a22ab98be3d0849(1);
    } else {
        val::function_c9d0b43701bdba00("tactical_camera_actions");
        function_7a22ab98be3d0849(0);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x679e
// Size: 0xc0
function private function_7a22ab98be3d0849(usingcamera) {
    stance = self getstance();
    if (usingcamera) {
        if (stance == "stand") {
            val::set("tactical_camera_stance", "crouch", 0);
            val::set("tactical_camera_stance", "prone", 0);
        } else if (stance == "crouch") {
            val::set("tactical_camera_stance", "stand", 0);
            val::set("tactical_camera_stance", "prone", 0);
        } else if (stance == "prone") {
            val::set("tactical_camera_stance", "crouch", 0);
            val::set("tactical_camera_stance", "stand", 0);
        }
    } else {
        val::function_c9d0b43701bdba00("tactical_camera_stance");
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6865
// Size: 0x3c
function function_54e1472f61b86413(camera, destroyfunc, oninit) {
    if (istrue(camera.var_11f51147ccff0163)) {
        thread refundsuper();
    }
    camera [[ destroyfunc ]](1, undefined, oninit);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a8
// Size: 0x1343
function function_9cd4393cac778989(camera, destroyfunc, oninit) {
    camera endon("death");
    var_ed87dddadcb02cec = getdvarint(@"hash_c57f2daebacd2a11", 0) > 0;
    var_c7c4cb56353a2626 = getdvarint(@"hash_77164862b5dd9238", 1) > 0;
    var_5386d3f222c813ae = 0;
    if (getdvarint(@"hash_5d72d66fef5f7d5", 0) == 1) {
        var_5386d3f222c813ae = 1;
    }
    if (var_5386d3f222c813ae && istrue(oninit)) {
        offset = getdvarfloat(@"hash_a63eaacd700c5fe0", 0.75);
        camera.origin = camera.origin + anglestoup(camera.angles) * offset;
        wait(0.05);
    }
    oninit = istrue(oninit);
    if (!isdefined(destroyfunc)) {
        destroyfunc = function_f0698aee89c18210(camera.var_8862825a0618bda).destroyfunc;
    }
    if (oninit) {
        wait(0.05);
    }
    var_f09b1f15e73c9e38 = spawnstruct();
    var_5392a68c99c4a46d = getdvarfloat(@"hash_ea48e956738a089c", 8);
    var_f09b1f15e73c9e38.origin = camera.origin + anglestoup(camera.angles) * var_5392a68c99c4a46d;
    var_2fc7b90001702e5c = [0:camera, 1:self];
    contents = function_f0698aee89c18210(camera.var_8862825a0618bda).var_58906cc2ded735db;
    /#
        assertex(isdefined(contents), "Deployable Camera: Tried to set physics contents for orientation but they were undefined");
    #/
    var_f09b1f15e73c9e38.angles = camera gettagangles("tag_origin");
    if (camera.mode == "wall") {
        fwd = anglestoup(camera.angles);
        right = anglestoright(camera.angles);
        up = vectorcross(fwd, right);
        var_f09b1f15e73c9e38.angles = axistoangles(fwd, right, up);
    }
    var_558f2ec8e231df5d = getdvarfloat(@"hash_71131deb09e9dcbf", 2.125);
    tracestart = var_f09b1f15e73c9e38.origin + anglestoleft(var_f09b1f15e73c9e38.angles) * 0.2;
    tracestart = tracestart + anglestoforward(var_f09b1f15e73c9e38.angles) * getdvarfloat(@"hash_9837b8c055d50463", 1);
    var_f9788b8fc8dcb768 = tracestart + anglestoforward(var_f09b1f15e73c9e38.angles) * 16.1;
    var_f3739a2563448690 = tracestart + anglestoforward(var_f09b1f15e73c9e38.angles) * 16.1 * -1;
    var_2c009776dc6f509b = namespace_2a184fc4902783dc::sphere_trace(tracestart, var_f9788b8fc8dcb768, 2.125, var_2fc7b90001702e5c, contents, 0, 1);
    var_6ebfafcf06305e63 = namespace_2a184fc4902783dc::sphere_trace(tracestart, var_f3739a2563448690, 2.125, var_2fc7b90001702e5c, contents, 0, 1);
    if (isdefined(var_2c009776dc6f509b["position"])) {
        /#
            if (var_c7c4cb56353a2626) {
                level thread namespace_d028276791d9cff6::drawsphere(var_2c009776dc6f509b["tacticalCamera_allCamerasRemoved"], 0.5, 100, (1, 1, 1));
            }
        #/
    }
    if (isdefined(var_6ebfafcf06305e63["position"])) {
        /#
            if (var_c7c4cb56353a2626) {
                level thread namespace_d028276791d9cff6::drawsphere(var_6ebfafcf06305e63["tacticalCamera_allCamerasRemoved"], 0.5, 100, (0, 0, 0));
            }
        #/
    }
    var_21f7b8e410c6d2e0 = var_2c009776dc6f509b["hittype"] == "hittype_none";
    var_1515fef1b3851218 = var_6ebfafcf06305e63["hittype"] == "hittype_none";
    var_98c4fb9955ff6e51 = distancesquared(var_2c009776dc6f509b["position"], var_6ebfafcf06305e63["position"]);
    var_e339bfb2e37c6dcd = var_98c4fb9955ff6e51 <= 174.504;
    var_668318f72d08b88b = camera.origin + anglestoup(camera.angles) * -1.5;
    var_75728142e6146447 = camera gettagorigin("tag_player");
    var_f9f735a1790f607f = distancesquared(var_6ebfafcf06305e63["position"], var_668318f72d08b88b);
    var_fe15317bedb99e47 = distancesquared(var_2c009776dc6f509b["position"], var_75728142e6146447);
    if (var_fe15317bedb99e47 < 3) {
        function_54e1472f61b86413(camera, destroyfunc, oninit);
        return 0;
    }
    var_607a2501bce0189 = var_6ebfafcf06305e63["position"] - var_668318f72d08b88b;
    var_8971b89742aa65e7 = var_2c009776dc6f509b["position"] - var_75728142e6146447;
    var_22515e1e2a9b9ecc = [0:180, 1:180];
    var_443e943cc3579457 = [0:85, 1:85];
    if (!var_21f7b8e410c6d2e0 && !var_1515fef1b3851218) {
        if (var_e339bfb2e37c6dcd) {
            function_54e1472f61b86413(camera, destroyfunc, oninit);
            return 0;
        } else {
            tooclose = vectordot(anglestoforward(camera gettagangles("tag_player")), var_8971b89742aa65e7) < 1;
            if (tooclose) {
                function_54e1472f61b86413(camera, destroyfunc, oninit);
                return 0;
            }
            var_21f7b8e410c6d2e0 = 1;
        }
    }
    if (var_21f7b8e410c6d2e0 || var_1515fef1b3851218) {
        if (!var_21f7b8e410c6d2e0 && camera.mode != "wall" && istrue(oninit)) {
            var_38e7fb5a6c0292f2 = var_2c009776dc6f509b["normal"];
            newup = anglestoup(camera.angles);
            var_389660bb1a8e35cd = vectorcross(var_38e7fb5a6c0292f2, newup);
            var_f09b1f15e73c9e38.angles = axistoangles(var_38e7fb5a6c0292f2, var_389660bb1a8e35cd, newup);
            camera.angles = var_f09b1f15e73c9e38.angles;
            wait(0.05);
        }
        if (!var_21f7b8e410c6d2e0 || !var_1515fef1b3851218) {
            if (!var_21f7b8e410c6d2e0) {
                var_fcc5982a28f6ee8e = namespace_2a184fc4902783dc::ray_trace_detail_passed(tracestart, var_2c009776dc6f509b["position"] + var_2c009776dc6f509b["normal"] * -2, var_2fc7b90001702e5c, contents);
                if (var_fcc5982a28f6ee8e) {
                    function_54e1472f61b86413(camera, destroyfunc, oninit);
                    return 0;
                }
            }
            if (!var_1515fef1b3851218) {
                var_fcc5982a28f6ee8e = namespace_2a184fc4902783dc::ray_trace_detail_passed(tracestart, var_6ebfafcf06305e63["position"] + var_6ebfafcf06305e63["normal"] * -2, var_2fc7b90001702e5c, contents);
                if (var_fcc5982a28f6ee8e) {
                    function_54e1472f61b86413(camera, destroyfunc, oninit);
                    return 0;
                }
            }
            if (var_f9f735a1790f607f < 174.504 || var_fe15317bedb99e47 < 174.504) {
                var_22515e1e2a9b9ecc[0] = var_22515e1e2a9b9ecc[0] - 70;
                var_22515e1e2a9b9ecc[1] = var_22515e1e2a9b9ecc[1] - 70;
            }
        }
    }
    if (camera.mode == "wall") {
        var_22515e1e2a9b9ecc[0] = 110;
        var_22515e1e2a9b9ecc[1] = 110;
    } else if (camera.mode == "ground") {
        var_443e943cc3579457[1] = var_443e943cc3579457[1] - getdvarfloat(@"hash_fb3d586e02f08fc9", 30);
    } else {
        var_443e943cc3579457[0] = var_443e943cc3579457[0] - getdvarfloat(@"hash_fb3d586e02f08fc9", 30);
    }
    if (oninit) {
        var_38e7fb5a6c0292f2 = flatten_vector(anglestoforward(camera gettagangles("tag_player")));
        worldup = (0, 0, 1);
        var_389660bb1a8e35cd = vectorcross(var_38e7fb5a6c0292f2, worldup);
        var_f09b1f15e73c9e38.angles = axistoangles(var_38e7fb5a6c0292f2, var_389660bb1a8e35cd, worldup);
        var_a4b48904a62e6aee = getdvarfloat(@"hash_630da9dbea450037", 5.5);
        var_901ae9e096c5ad06 = getdvarfloat(@"hash_1ed9270646935e4f", 0.25);
        var_53f975d1bac9f666 = getdvarfloat(@"hash_158dbc8dfe38250f", 0.05);
        var_f09b1f15e73c9e38.origin = camera.origin + anglestoup(camera.angles) * var_a4b48904a62e6aee + anglestoleft(var_f09b1f15e73c9e38.angles) * var_901ae9e096c5ad06 + anglestoforward(var_f09b1f15e73c9e38.angles) * var_53f975d1bac9f666;
        camera.var_972db1e8c83af680 = var_f09b1f15e73c9e38.angles;
        camera.var_61b4bf1265754402 = var_f09b1f15e73c9e38.origin;
    } else {
        var_f09b1f15e73c9e38.angles = camera.var_972db1e8c83af680;
        var_f09b1f15e73c9e38.origin = camera.var_61b4bf1265754402;
    }
    if (camera.mode != "ground" && oninit) {
        var_64ec3898ed3d1cb3 = camera gettagorigin("tag_player");
        var_187b3c4c217506bf = camera gettagorigin("tag_origin");
        var_9b2d69c8a06fcc0b = [0:var_64ec3898ed3d1cb3, 1:var_187b3c4c217506bf];
        var_c6ea0ec449c6e3f7 = var_64ec3898ed3d1cb3 + anglestoleft(var_f09b1f15e73c9e38.angles) * 13.21;
        var_13a898e5c4b84ac4 = var_64ec3898ed3d1cb3 + anglestoright(var_f09b1f15e73c9e38.angles) * 13.21;
        var_1e4cc740e1cd5cd3 = var_187b3c4c217506bf + anglestoleft(var_f09b1f15e73c9e38.angles) * 13.21;
        var_4a90ce9b71e8f578 = var_187b3c4c217506bf + anglestoright(var_f09b1f15e73c9e38.angles) * 13.21;
        var_2fe0ccf3c745186a = namespace_2a184fc4902783dc::ray_trace(var_64ec3898ed3d1cb3, var_c6ea0ec449c6e3f7, var_2fc7b90001702e5c, contents, 0, 0, 1);
        var_e9b3dcdc29694157 = namespace_2a184fc4902783dc::ray_trace(var_64ec3898ed3d1cb3, var_13a898e5c4b84ac4, var_2fc7b90001702e5c, contents, 0, 0, 1);
        var_7b8dbe0a384c48b6 = namespace_2a184fc4902783dc::ray_trace(var_187b3c4c217506bf, var_1e4cc740e1cd5cd3, var_2fc7b90001702e5c, contents, 0, 0, 1);
        var_1163f374b636fb8b = namespace_2a184fc4902783dc::ray_trace(var_187b3c4c217506bf, var_4a90ce9b71e8f578, var_2fc7b90001702e5c, contents, 0, 0, 1);
        var_7d1af73532ea6ca9 = var_2fe0ccf3c745186a["hittype"] != "hittype_none" && var_7b8dbe0a384c48b6["hittype"] != "hittype_none";
        var_31344ce38dec89fc = var_e9b3dcdc29694157["hittype"] != "hittype_none" && var_1163f374b636fb8b["hittype"] != "hittype_none";
        if (var_31344ce38dec89fc && var_7d1af73532ea6ca9) {
            function_54e1472f61b86413(camera, destroyfunc, oninit);
            return 0;
        } else {
            offsetdistance = getdvarfloat(@"hash_cb3fea1ca4b915e8", 6);
            if (var_31344ce38dec89fc) {
                camera.origin = camera.origin + anglestoleft(var_f09b1f15e73c9e38.angles) * offsetdistance;
                var_f09b1f15e73c9e38.origin = var_f09b1f15e73c9e38.origin + anglestoleft(var_f09b1f15e73c9e38.angles) * offsetdistance;
                wait(0.05);
            } else if (var_7d1af73532ea6ca9) {
                camera.origin = camera.origin + anglestoright(var_f09b1f15e73c9e38.angles) * offsetdistance;
                var_f09b1f15e73c9e38.origin = var_f09b1f15e73c9e38.origin + anglestoright(var_f09b1f15e73c9e38.angles) * offsetdistance;
                wait(0.05);
            }
            camera.var_61b4bf1265754402 = var_f09b1f15e73c9e38.origin;
        }
        /#
            if (var_ed87dddadcb02cec) {
                level thread draw_line_for_time(var_c6ea0ec449c6e3f7, var_13a898e5c4b84ac4, 0, 1, 0, 100);
                level thread draw_line_for_time(var_1e4cc740e1cd5cd3, var_4a90ce9b71e8f578, 0, 1, 0, 100);
            }
        #/
    }
    if (oninit && camera.mode == "wall") {
        var_92fc2d8bf944acd6 = camera gettagorigin("tag_player");
        var_1f0bc580944ba8ed = var_f09b1f15e73c9e38.angles;
        traceoffset = getdvarfloat(@"hash_bb708c290ae38743", 20);
        tracestart = var_92fc2d8bf944acd6 + anglestoforward(var_1f0bc580944ba8ed) * -1;
        var_4b787d72c87edfd7 = var_92fc2d8bf944acd6 + anglestoforward(var_1f0bc580944ba8ed) * traceoffset + anglestoright(var_1f0bc580944ba8ed) * traceoffset;
        var_61795bc1d5be4f22 = var_92fc2d8bf944acd6 + anglestoforward(var_1f0bc580944ba8ed) * traceoffset + anglestoleft(var_1f0bc580944ba8ed) * traceoffset;
        var_b463c6a2527f428a = var_92fc2d8bf944acd6 + anglestoforward(var_1f0bc580944ba8ed) * traceoffset + anglestoup(var_1f0bc580944ba8ed) * traceoffset;
        var_a96922aa595eca1f = var_92fc2d8bf944acd6 + anglestoforward(var_1f0bc580944ba8ed) * traceoffset + anglestoup(var_1f0bc580944ba8ed) * traceoffset * -1;
        var_d253c9f2bb45b0d4 = [0:var_4b787d72c87edfd7, 1:var_61795bc1d5be4f22, 2:var_b463c6a2527f428a, 3:var_a96922aa595eca1f];
        var_dae0f3fc0fbfa6a5 = namespace_2a184fc4902783dc::sphere_trace(tracestart, var_b463c6a2527f428a, 1, var_2fc7b90001702e5c, contents, 0, 1);
        var_45505ea96c00d672 = namespace_2a184fc4902783dc::sphere_trace(tracestart, var_a96922aa595eca1f, 1, var_2fc7b90001702e5c, contents, 0, 1);
        var_8d79eccbac18169d = namespace_2a184fc4902783dc::sphere_trace(tracestart, var_61795bc1d5be4f22, 1, var_2fc7b90001702e5c, contents, 0, 1);
        var_b8290060d3aaf6ca = namespace_2a184fc4902783dc::sphere_trace(tracestart, var_4b787d72c87edfd7, 1, var_2fc7b90001702e5c, contents, 0, 1);
        var_349dea642cfcc3a9 = var_dae0f3fc0fbfa6a5["hittype"] != "hittype_none";
        var_71dff7ad0a7afed6 = var_45505ea96c00d672["hittype"] != "hittype_none";
        var_8e56f6f1f53a2e01 = var_8d79eccbac18169d["hittype"] != "hittype_none";
        var_bbf9a1560509dc4e = var_b8290060d3aaf6ca["hittype"] != "hittype_none";
        if (var_349dea642cfcc3a9 && var_71dff7ad0a7afed6 || var_8e56f6f1f53a2e01 && var_bbf9a1560509dc4e) {
            function_54e1472f61b86413(camera, destroyfunc, oninit);
            return 0;
        }
        /#
            if (var_ed87dddadcb02cec) {
                level thread draw_line_for_time(tracestart, var_b463c6a2527f428a, 1, 0, 0, 100);
                level thread draw_line_for_time(tracestart, var_a96922aa595eca1f, 1, 0, 0, 100);
                level thread draw_line_for_time(tracestart, var_61795bc1d5be4f22, 1, 0, 0, 100);
                level thread draw_line_for_time(tracestart, var_4b787d72c87edfd7, 1, 0, 0, 100);
            }
        #/
    }
    var_b4fc3c0beaf3b0d8 = getdvarfloat(@"hash_3c8365aa23c0a4e9", 8.5);
    tracestart = var_f09b1f15e73c9e38.origin;
    var_f9fbca64918f0d03 = physics_spherecast(tracestart, tracestart, var_b4fc3c0beaf3b0d8, contents, var_2fc7b90001702e5c, "physicsquery_all", "physicsquery_all", 1);
    var_aa1b18a5eb18abf2 = 6.65;
    var_8a1427f1b510f82c = 2.4;
    if (camera.mode == "wall") {
        var_aa1b18a5eb18abf2 = 6.65;
        var_8a1427f1b510f82c = 1.5;
    }
    for (i = 0; i < var_f9fbca64918f0d03.size - 1; i++) {
        tracepoints = var_f9fbca64918f0d03[i];
        foreach (trace in tracepoints) {
            if (!isdefined(trace["position"])) {
                continue;
            }
            if (!isdefined(trace["normal"])) {
                continue;
            }
            if (trace["hittype"] == "hittype_none") {
                continue;
            }
            var_340d59422336e85a = tracestart - trace["position"];
            dot = vectordot(anglestoforward(var_f09b1f15e73c9e38.angles), var_340d59422336e85a);
            if (dot > var_8a1427f1b510f82c || dot < var_aa1b18a5eb18abf2 * -1) {
                dot = vectordot(anglestoright(var_f09b1f15e73c9e38.angles), var_340d59422336e85a);
                if (dot < 0) {
                    var_22515e1e2a9b9ecc[1] = min(var_22515e1e2a9b9ecc[1], 110);
                } else if (dot > 0) {
                    var_22515e1e2a9b9ecc[0] = min(var_22515e1e2a9b9ecc[0], 110);
                }
                /#
                    if (var_c7c4cb56353a2626) {
                        level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (1, 0, 0));
                    }
                #/
            } else {
                var_27cf81241a809664 = vectordot(anglestoright(var_f09b1f15e73c9e38.angles), var_340d59422336e85a);
                var_f5f0be1aae34652d = vectordot(anglestoup(var_f09b1f15e73c9e38.angles), var_340d59422336e85a);
                if (var_27cf81241a809664 <= 1.6 && var_27cf81241a809664 >= -1.6) {
                    bounds = 2.25;
                    if (var_f5f0be1aae34652d <= bounds && var_f5f0be1aae34652d >= bounds * -1) {
                        /#
                            if (var_c7c4cb56353a2626) {
                                level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (1, 1, 0));
                            }
                        #/
                        continue;
                    }
                    if (camera.mode != "wall") {
                        if (var_f5f0be1aae34652d < 0) {
                            /#
                                if (var_c7c4cb56353a2626) {
                                    level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (1, 0, 1));
                                }
                            #/
                        }
                    }
                }
                if (var_27cf81241a809664 >= 6 || var_27cf81241a809664 <= -6) {
                    /#
                        if (var_c7c4cb56353a2626) {
                            level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (0, 1, 1));
                        }
                    #/
                } else if (var_f5f0be1aae34652d >= 6 || var_f5f0be1aae34652d < -6) {
                    /#
                        if (var_c7c4cb56353a2626) {
                            level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (0, 1, 1));
                        }
                    #/
                } else {
                    dot = vectordot(anglestoup(var_f09b1f15e73c9e38.angles), var_340d59422336e85a);
                    if (dot > 2.25 || dot < -2.25) {
                        /#
                            if (var_c7c4cb56353a2626) {
                                level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (0, 0, 1));
                            }
                        #/
                        var_54965e7ba439553d = ter_op(dot > 0, 1, 0);
                        var_443e943cc3579457[var_54965e7ba439553d] = 1;
                    } else {
                        var_ebe3d10dd7b17327 = anglestoforward(var_f09b1f15e73c9e38.angles);
                        var_5cc8d461e23b45ea = trace["position"] - tracestart;
                        var_8e56f6f1f53a2e01 = 0;
                        var_56699f8802baa8e7 = math::anglebetweenvectorssigned(var_ebe3d10dd7b17327, var_5cc8d461e23b45ea, (0, 0, 1));
                        if (var_56699f8802baa8e7 > 0) {
                            var_8e56f6f1f53a2e01 = 1;
                        }
                        var_56699f8802baa8e7 = abs(var_56699f8802baa8e7);
                        var_100094a8f26da73d = ter_op(var_8e56f6f1f53a2e01, 0, 1);
                        var_22515e1e2a9b9ecc[var_100094a8f26da73d] = 1;
                        /#
                            if (var_c7c4cb56353a2626) {
                                level thread namespace_d028276791d9cff6::drawsphere(trace["tacticalCamera_allCamerasRemoved"], 0.5, 100, (0, 1, 0));
                            }
                        #/
                    }
                }
            }
        }
    }
    if (oninit) {
        var_a820130a6d38f1e4 = spawn("script_model", camera.origin);
        var_a820130a6d38f1e4 setmodel("tag_origin");
        var_a820130a6d38f1e4.origin = camera gettagorigin("tag_player");
        var_a820130a6d38f1e4.angles = camera gettagangles("tag_player");
        camera.var_a820130a6d38f1e4 = var_a820130a6d38f1e4;
    }
    camera.var_df8eab23e5a5a0b7 = var_22515e1e2a9b9ecc;
    camera.var_3ebf8c1ae3acce22 = var_443e943cc3579457;
    return 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7bf3
// Size: 0x11b
function private function_736cf4e3ea65e3d0(currentcamera, var_d32db81facf26305) {
    if (!isdefined(currentcamera)) {
        return;
    }
    var_ea5e69cb5e96e49c = self [[ function_f0698aee89c18210(currentcamera.var_8862825a0618bda).var_1eb35a5a7992e498 ]]();
    /#
        assertex(isdefined(var_ea5e69cb5e96e49c), "Deployable Camera: Camera cluster undefined but we're attempting a switch. Are you sure things are properly unset?.");
    #/
    if (var_ea5e69cb5e96e49c.size == 0) {
        return currentcamera;
    }
    teamref = currentcamera.owner.team;
    curidx = array_find(var_ea5e69cb5e96e49c, currentcamera);
    if (!isdefined(curidx)) {
        curidx = 0;
    }
    var_294ae6f4e7a2ece9 = 1;
    if (istrue(var_d32db81facf26305)) {
        var_294ae6f4e7a2ece9 = -1;
    }
    var_d2e8ec5a21155950 = curidx + var_294ae6f4e7a2ece9;
    if (var_d2e8ec5a21155950 < 0) {
        var_d2e8ec5a21155950 = var_ea5e69cb5e96e49c.size - 1;
    }
    var_d2e8ec5a21155950 = var_d2e8ec5a21155950 % var_ea5e69cb5e96e49c.size;
    var_64177b5a8b8adba4 = var_ea5e69cb5e96e49c[var_d2e8ec5a21155950];
    while (var_d2e8ec5a21155950 != curidx) {
        if (isdefined(var_64177b5a8b8adba4) && !function_58a0cad2aba60238(var_64177b5a8b8adba4)) {
            break;
        }
        var_d2e8ec5a21155950 = curidx + var_294ae6f4e7a2ece9;
        if (var_d2e8ec5a21155950 < 0) {
            var_d2e8ec5a21155950 = var_ea5e69cb5e96e49c.size - 1;
        }
        var_d2e8ec5a21155950 = var_d2e8ec5a21155950 % var_ea5e69cb5e96e49c.size;
        var_64177b5a8b8adba4 = var_ea5e69cb5e96e49c[var_d2e8ec5a21155950];
        waitframe();
    }
    return var_64177b5a8b8adba4;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d16
// Size: 0x105
function private function_aa1196b484e39eca(currentcamera, var_61c10206b89fcb56) {
    level endon("game_ended");
    self endon("disconnect");
    self.var_a7d181863f388645 = 1;
    var_be3314f77fef5d6b = function_f0698aee89c18210(currentcamera.var_8862825a0618bda).var_be3314f77fef5d6b;
    namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0.25);
    var_fe7523ec001dd34d = 1;
    if (!isdefined(var_61c10206b89fcb56) || istrue(var_61c10206b89fcb56.isdestroyed) || !isalive(self)) {
        var_fe7523ec001dd34d = 0;
    }
    namespace_f8065cafc523dba5::_freezelookcontrols(0);
    if (!var_fe7523ec001dd34d) {
        thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.25);
        self thread [[ var_be3314f77fef5d6b ]](currentcamera, var_fe7523ec001dd34d);
    } else {
        self [[ var_be3314f77fef5d6b ]](currentcamera, var_fe7523ec001dd34d);
        thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.25);
        if (isdefined(var_61c10206b89fcb56)) {
            self [[ function_f0698aee89c18210(var_61c10206b89fcb56.var_8862825a0618bda).startfunc ]](var_61c10206b89fcb56);
        }
    }
    self.var_a7d181863f388645 = undefined;
    self notify("deployable_camera_switch_complete");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e22
// Size: 0x80
function function_ef76557bfc468ad7(var_91bf4c3aa63185a2, camera) {
    self endon("disconnect");
    self notify("cameraSwitchMonitored");
    self endon("cameraSwitchMonitored");
    self endon("playerExitingCameraMode");
    self endon(var_91bf4c3aa63185a2);
    self endon("death");
    while (1) {
        msg = function_537b1c669b864647();
        if (!isdefined(msg)) {
            continue;
        }
        var_234a04a66d98d450 = 0;
        if (msg == "cameraSwitchLeft") {
            var_234a04a66d98d450 = 1;
        }
        function_367656975db3f139(camera, var_234a04a66d98d450, var_91bf4c3aa63185a2);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ea9
// Size: 0x82
function function_367656975db3f139(camera, var_234a04a66d98d450, var_91bf4c3aa63185a2) {
    self endon("playerExitingCameraMode");
    self endon("death");
    if (!isdefined(var_91bf4c3aa63185a2)) {
        var_91bf4c3aa63185a2 = "tacticalCamera_allCamerasRemoved";
    }
    self endon(var_91bf4c3aa63185a2);
    if (istrue(self.var_a7d181863f388645)) {
        return 0;
    }
    var_64177b5a8b8adba4 = function_736cf4e3ea65e3d0(camera, var_234a04a66d98d450);
    if (!isdefined(var_64177b5a8b8adba4)) {
        return 0;
    }
    if (var_64177b5a8b8adba4 == camera) {
        return 0;
    } else {
        thread function_aa1196b484e39eca(camera, var_64177b5a8b8adba4);
        self waittill("deployable_camera_switch_complete");
        return 1;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f32
// Size: 0x24f
function function_6ecb6c565c248e04(camera) {
    level endon("game_ended");
    camera endon("death");
    camera endon("explode");
    self endon("disconnect");
    if (!isdefined(camera) || camera.hasexploded == 1) {
        return;
    }
    var_525a3c292fd60b90 = camera gettagangles("tag_player");
    var_e80ee348f3979bf2 = anglestoforward(var_525a3c292fd60b90);
    var_13cf1760124232f8 = anglestoup(var_525a3c292fd60b90);
    var_4f6b26e67cbc1fd4 = flatten_vector(var_e80ee348f3979bf2, (0, 0, 1));
    var_ef86f2326135bd83 = camera.var_972db1e8c83af680;
    var_254b947358335ee3 = flatten_vector(anglestoforward(var_ef86f2326135bd83), (0, 0, 1));
    var_75301576e282501b = anglestoup(var_ef86f2326135bd83);
    camera.var_509338690aeb5fac = [];
    camera.var_f7e06e4a1de98489 = [];
    var_e04f1cbea4a658ea = 0;
    var_d11c3a1b9568cddb = 0;
    if (camera.var_df8eab23e5a5a0b7[0] != 180 || camera.var_df8eab23e5a5a0b7[1] != 180) {
        var_d11c3a1b9568cddb = math::anglebetweenvectorssigned(var_254b947358335ee3, var_4f6b26e67cbc1fd4, (0, 0, 1));
        if (var_d11c3a1b9568cddb <= 0) {
            var_e04f1cbea4a658ea = 1;
        }
        anglediff = abs(var_d11c3a1b9568cddb);
        if (var_e04f1cbea4a658ea) {
            camera.var_509338690aeb5fac[1] = anglediff * -1;
            camera.var_509338690aeb5fac[0] = anglediff;
        } else {
            camera.var_509338690aeb5fac[1] = anglediff;
            camera.var_509338690aeb5fac[0] = anglediff * -1;
        }
    }
    var_2f30d3353d5dd64d = 0;
    var_f73236f3c070ce6e = math::anglebetweenvectorssigned(var_75301576e282501b, var_13cf1760124232f8, (0, 1, 0));
    if (var_f73236f3c070ce6e <= 0) {
        var_2f30d3353d5dd64d = 1;
    }
    anglediff = abs(var_f73236f3c070ce6e);
    if (var_2f30d3353d5dd64d) {
        camera.var_f7e06e4a1de98489[0] = anglediff;
        camera.var_f7e06e4a1de98489[1] = anglediff * -1;
    } else {
        camera.var_f7e06e4a1de98489[0] = anglediff * -1;
        camera.var_f7e06e4a1de98489[1] = anglediff;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8188
// Size: 0x103
function function_5a7867448f866939(data, var_c0754ca9aa8976da) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return;
    }
    self setscriptablepartstate("ddos", "disabled", 0);
    self.owner thread function_45556aa41f4f9ae8(self, self.var_defbeed1a2c29c34, 4, undefined, 6);
    if (isdefined(self.pilot)) {
        var_e7c55e8864b07cca = [0:self.pilot];
        if (isdefined(self.watchers) && self.watchers.size > 0) {
            var_e7c55e8864b07cca = array_combine(var_e7c55e8864b07cca, self.watchers);
        }
        foreach (user in var_e7c55e8864b07cca) {
            user thread function_e0a9c9a0a70b1ee5(self, var_c0754ca9aa8976da);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8292
// Size: 0xc6
function function_45556aa41f4f9ae8(camera, index, status, var_bf15527477b41565, var_be632e8c9259a360) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.var_2d5baa13a621c5eb)) {
        self.var_2d5baa13a621c5eb = [];
    }
    struct = spawnstruct();
    struct.camera = camera;
    struct.index = index;
    struct.status = status;
    struct.var_bf15527477b41565 = istrue(var_bf15527477b41565);
    struct.var_be632e8c9259a360 = ter_op(isdefined(var_be632e8c9259a360), var_be632e8c9259a360, 0);
    self.var_2d5baa13a621c5eb[self.var_2d5baa13a621c5eb.size] = struct;
    thread function_797aa6baae156a75();
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x835f
// Size: 0xce
function function_797aa6baae156a75() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("tacticalCamera_allCamerasRemoved");
    self notify("deployableCamera_statusQueue");
    self endon("deployableCamera_statusQueue");
    if (istrue(level.gameended) || !isdefined(self)) {
        return;
    }
    while (isdefined(self.var_2d5baa13a621c5eb) && self.var_2d5baa13a621c5eb.size > 0) {
        waitframe();
        struct = array_get_first_item(self.var_2d5baa13a621c5eb);
        self notify("personal_camera_status_updated", struct.camera);
        self.var_2d5baa13a621c5eb = array_remove(self.var_2d5baa13a621c5eb, struct);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8434
// Size: 0x51
function private function_3f6b8f7cff6a2c37(camera, transitiontime) {
    camera endon("emp_cleared");
    self endon("playerLeavingCurrentCamera");
    halftime = transitiontime / 2;
    function_7abf9767930dca21(camera, "taccam_static_start", halftime);
    wait(halftime);
    function_7abf9767930dca21(camera, "taccam_static_mid", halftime);
    wait(halftime);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x848c
// Size: 0x6a
function private function_e0a9c9a0a70b1ee5(camera, var_c0754ca9aa8976da) {
    level endon("game_ended");
    self endon("disconnect");
    namespace_5a51aa78ea0b1b9f::play_emp_scramble(1);
    var_110a8239b8d015bc = function_47e6ed10be33fef1(camera, var_c0754ca9aa8976da);
    if (!isdefined(var_110a8239b8d015bc) || var_110a8239b8d015bc != "timeout") {
        namespace_5a51aa78ea0b1b9f::function_f7c6d776d032122f();
        function_eca023ad97260f51(camera);
    } else {
        thread function_9f25ae386db6338a(camera);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84fd
// Size: 0x3d
function private function_47e6ed10be33fef1(camera, var_33153258526a7b2) {
    childthread function_3f6b8f7cff6a2c37(camera, var_33153258526a7b2);
    msg = namespace_3c37cb17ade254d::waittill_any_ents_or_timeout_return(var_33153258526a7b2, camera, "emp_cleared", self, "playerExitingCameraMode");
    return msg;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8542
// Size: 0x117
function function_9f25ae386db6338a(camera) {
    level endon("game_ended");
    self endon("disconnect");
    self notify("deployableCamera_monitoringEMP");
    self endon("deployableCamera_monitoringEMP");
    thread function_f238d4c7bab11c82(camera);
    self.targetsinouterradius = [];
    function_bfcdb898d70f248c();
    function_7abf9767930dca21(camera, "taccam_static_full");
    self setclientomnvar("ui_tactical_camera_ddos_on", 1);
    if (!isdefined(self.empscramblelevels) || self.empscramblelevels.size == 0) {
        namespace_5a51aa78ea0b1b9f::play_emp_scramble(3);
    }
    msg = camera waittill_any_ents_return(camera, "emp_cleared", self, "playerLeavingCurrentCamera", self, "death", self, "playerExitingCameraMode");
    if (!isdefined(msg) || msg == "playerLeavingCurrentCamera" || msg == "death") {
        function_eca023ad97260f51(camera);
    } else {
        function_4789702c319cd7a7(camera);
        function_c9ad5aaf3183b83c();
    }
    if (msg == "death" || msg == "playerExitingCameraMode" || msg == "emp_cleared" || msg == "playerLeavingCurrentCamera") {
        namespace_5a51aa78ea0b1b9f::function_f7c6d776d032122f();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8660
// Size: 0x5a
function function_f238d4c7bab11c82(camera) {
    level endon("game_ended");
    self endon("disconnect");
    camera notify("deployableCamera_monitoringEMPVFX");
    camera endon("deployableCamera_monitoringEMPVFX");
    camera waittill_any_2("death", "emp_cleared");
    camera setscriptablepartstate("ddos", "neutral", 0);
    self setclientomnvar("ui_tactical_camera_ddos_on", 0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86c1
// Size: 0xac
function function_652247ce1acb67c2(data) {
    attacker = data.attacker;
    self dodamage(self.maxhealth / 10, self.origin, attacker, data.inflictor);
    if (isdefined(self.damagetaken) && self.damagetaken >= 100) {
        if (!isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
            attacker notify("destroyed_equipment");
            attacker thread namespace_48a08c5037514e04::doscoreevent(#"destroyed_equipment");
            attacker namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8774
// Size: 0x4c
function function_c7dbea1f56df2b64(camera, var_8862825a0618bda) {
    var_c748b31a33c02c14 = function_f0698aee89c18210(var_8862825a0618bda).var_be3314f77fef5d6b;
    self endon("death");
    camera endon("entering");
    level waittill("game_ended");
    [[ var_c748b31a33c02c14 ]](camera, 0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c7
// Size: 0x8a
function function_30dd206c5d9b45a7() {
    childthread function_d600a854b585442d();
    childthread function_de1222813ff9939b();
    childthread function_ab5da94d0c38ab3c();
    msg = self waittill("activateCamera");
    self notifyonplayercommandremove("tacButtonPress", "+smoke");
    self notifyonplayercommandremove("tacButtonPress", "+actionslot 1");
    self notifyonplayercommandremove("fragButtonPress", "+frag");
    self notifyonplayercommandremove("fragButtonPress", "+equip_toggle_throw");
    self notifyonplayercommandremove("cameraActive", "+special");
    return msg == "success";
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8859
// Size: 0x2e
function private function_537b1c669b864647() {
    childthread function_ce83a297e29bc7dd();
    childthread function_f981c735613b390b();
    msg = self waittill("switchCamera");
    function_13e2543cd1847ca6();
    return msg;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x888f
// Size: 0x36
function function_13e2543cd1847ca6() {
    self notifyonplayercommandremove("camSwitchKBM", "+special");
    self notifyonplayercommandremove("cameraSwitchLeft", "+smoke");
    self notifyonplayercommandremove("cameraSwitchRight", "+frag");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88cc
// Size: 0x68
function private function_f981c735613b390b() {
    self endon("switchCamera");
    self notifyonplayercommand("cameraSwitchLeftController", "+smoke");
    self notifyonplayercommand("cameraSwitchRightController", "+frag");
    msg = waittill_any_return_2("cameraSwitchLeftController", "cameraSwitchRightController");
    if (is_player_gamepad_enabled()) {
        msg = strtok(msg, "Controller");
        self notify("switchCamera", msg[0]);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x893b
// Size: 0x68
function private function_ce83a297e29bc7dd() {
    self endon("switchCamera");
    self notifyonplayercommand("cameraSwitchLeftKBM", "+moveleft");
    self notifyonplayercommand("cameraSwitchRightKBM", "+moveright");
    msg = waittill_any_return_2("cameraSwitchLeftKBM", "cameraSwitchRightKBM");
    if (!is_player_gamepad_enabled()) {
        msg = strtok(msg, "KBM");
        self notify("switchCamera", msg[0]);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89aa
// Size: 0xfd
function function_eb1f8c19d4194ac3(var_b8f96bd12748f572, var_68eb6389cfeb3270, var_aea949753fb27001) {
    var_ea5e69cb5e96e49c = self [[ var_68eb6389cfeb3270 ]]();
    if (!isdefined(var_ea5e69cb5e96e49c) || var_ea5e69cb5e96e49c.size == 0) {
        return 0;
    }
    if (!function_84582dd92c385507(var_aea949753fb27001)) {
        return 0;
    }
    currentweapon = self.currentweapon;
    if (currentweapon.basename == "iw9_me_riotshield_mp") {
        self.var_75b981560f8453f4 = 1;
        self notify("activateCamera", "success");
        return 1;
    }
    ammoclip = self getweaponammoclip(currentweapon);
    ammostock = self getweaponammostock(currentweapon);
    _takeweapon(currentweapon);
    _takeweapon(var_b8f96bd12748f572);
    self clearoffhandspecial();
    self.var_75b981560f8453f4 = 1;
    self notify("activateCamera", "success");
    _giveweapon(var_b8f96bd12748f572);
    self assignweaponoffhandspecial(var_b8f96bd12748f572);
    thread function_299b7fa84b1d28d1(currentweapon, ammoclip, ammostock);
    return 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8aaf
// Size: 0x6e
function function_299b7fa84b1d28d1(previousweapon, ammoclip, ammostock) {
    level endon("game_ended");
    self endon("disconnect");
    waittime = getdvarfloat(@"hash_83f60684c63746be", 0);
    wait(waittime + 0.05);
    _giveweapon(previousweapon, undefined, undefined, 1);
    self setweaponammoclip(previousweapon, ammoclip);
    self setweaponammostock(previousweapon, ammostock);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b24
// Size: 0x30
function private function_d600a854b585442d() {
    self endon("activateCamera");
    self notifyonplayercommand("cameraActive", "+special");
    self waittill("cameraActive");
    self notify("activateCamera", "success");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b5b
// Size: 0x7e
function private function_de1222813ff9939b() {
    self endon("activateCamera");
    self notifyonplayercommand("tacButtonPress", "+smoke");
    self notifyonplayercommand("fragButtonPress", "+frag");
    var_bd1267e9dea3dba9 = [0:"tacButtonPress", 1:"fragButtonPress"];
    thread function_8d6d95114b2c9b0d(var_bd1267e9dea3dba9, [0:"activateCamera"], 0.75);
    msg = self waittill("controllerSuperPress");
    self notify("activateCamera", msg);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8be0
// Size: 0x7e
function private function_ab5da94d0c38ab3c() {
    self endon("activateCamera");
    self notifyonplayercommand("tacButtonPress", "+actionslot 1");
    self notifyonplayercommand("fragButtonPress", "+equip_toggle_throw");
    var_bd1267e9dea3dba9 = [0:"tacButtonPress", 1:"fragButtonPress"];
    thread function_8d6d95114b2c9b0d(var_bd1267e9dea3dba9, [0:"activateCamera"], 0.75);
    msg = self waittill("controllerSuperPress");
    self notify("activateCamera", msg);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c65
// Size: 0x10d
function function_84582dd92c385507(var_aea949753fb27001) {
    if (self function_6f55d55ccff20d14()) {
        return 0;
    }
    if (istrue(self.isjuggernaut)) {
        return 0;
    }
    if (self isinfreefall()) {
        return 0;
    }
    if (self isjumping()) {
        return 0;
    }
    if (self function_415fe9eeca7b2e2b()) {
        return 0;
    }
    if (self function_e5bf22923d0004bc()) {
        return 0;
    }
    if (self isthrowinggrenade()) {
        offhandweapon = self getheldoffhand();
        if (offhandweapon.basename != var_aea949753fb27001) {
            return 0;
        }
    }
    if (istrue(self.var_77fefc8456adb545)) {
        return 0;
    }
    if (istrue(self.isusingcamera)) {
        return 0;
    }
    if (isdefined(self.vehicle)) {
        return 0;
    }
    if (!val::get("supers")) {
        return 0;
    }
    if (istrue(self.super.isdeploying)) {
        return 0;
    }
    if (istrue(self.var_8a38603863a78b8e)) {
        return 0;
    }
    if (istrue(self.var_859654e0445a36d9)) {
        return 0;
    }
    if (self isswitchingweapon() && !istrue(self.var_75b981560f8453f4)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7a
// Size: 0x91
function function_b1fc1520e09105aa(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("playerLeavingCurrentCamera");
    if (!isdefined(self.c4s) || self.c4s.size == 0) {
        return 0;
    } else {
        self notifyonplayercommand("c4_detonated", "+detonate");
        self notifyonplayercommand("c4_detonated", "+attack");
        self setclientomnvar("ui_tactical_camera_can_detonate_c4", 1);
        self waittill("c4_detonated");
        self notify("detonate");
        self setclientomnvar("ui_tactical_camera_can_detonate_c4", 0);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e12
// Size: 0x25
function function_57e0efe2f886bd46() {
    self notifyonplayercommandremove("c4_detonated", "+detonate");
    self notifyonplayercommandremove("c4_detonated", "+attack");
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e3e
// Size: 0x69
function function_2699a7c2c0b71d3e(camera, var_8862825a0618bda) {
    var_c748b31a33c02c14 = function_f0698aee89c18210(var_8862825a0618bda).var_be3314f77fef5d6b;
    self endon("death_or_disconnect");
    camera endon("death");
    self endon("playerLeavingCurrentCamera");
    level endon("game_ended");
    while (1) {
        if (self isinexecutionvictim()) {
            break;
        }
        waitframe();
    }
    self thread [[ var_c748b31a33c02c14 ]](camera, 0);
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8eae
// Size: 0x21
function private function_e4d938ad226591fd(cam) {
    cam function_5226227bce83ebe9(3, cam.ownerteam);
    return cam;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed7
// Size: 0x8a
function function_b13a5b9e0ea04dbd(target) {
    if (!isdefined(target)) {
        return 0;
    }
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    var_128777c73408ae9d = params.var_37782917998d4ff2;
    if (istrue(self.isunderwater) || istrue(target function_988138367c74b1f5())) {
        var_128777c73408ae9d = params.var_9953dc2e8c205b77;
    }
    if (!isdefined(var_128777c73408ae9d)) {
        return;
    }
    return distancesquared(self.origin, target.origin) < var_128777c73408ae9d;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f69
// Size: 0x84
function function_a268c4595bd106ff(target) {
    if (!isdefined(target)) {
        return 0;
    }
    params = function_f0698aee89c18210(self.var_8862825a0618bda);
    var_7e2345a74ee18a53 = params.var_4fbadc7102d30912;
    if (istrue(self.isunderwater) || istrue(target function_988138367c74b1f5())) {
        var_7e2345a74ee18a53 = params.var_16187e4d354c3c97;
    }
    return distancesquared(self.origin, target.origin) < var_7e2345a74ee18a53;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ff5
// Size: 0x96
function function_9d2bec87e0754872(target) {
    info = spawnstruct();
    info.isvisible = function_4e3aa9d829b3e164(target);
    info.var_9ae205c4c40af967 = function_f6ba29efe27b0f81(target);
    info.isinrange = function_b13a5b9e0ea04dbd(target);
    info.isindetectrange = function_a268c4595bd106ff(target);
    if (isdefined(self.pilot)) {
        info.var_20aa5b4097887cb6 = self.pilot function_1b1409af5e47b098(target, 80, 40);
    }
    return info;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9093
// Size: 0x305
function function_8409d7ce07f426a1(camera) {
    level endon("game_ended");
    self endon("disconnect");
    camera endon("death");
    destroyfunc = function_f0698aee89c18210(camera.var_8862825a0618bda).destroyfunc;
    radius = getdvarfloat(@"hash_b076f58c9b234db3", 140);
    doors = namespace_9c1ec96c80ce894a::scriptable_door_get_in_radius(camera.origin, radius, 20);
    camera.var_8ac5efce71cc57c5 = [];
    foreach (door in doors) {
        var_31f5044848a4ae3 = spawnstruct();
        var_31f5044848a4ae3.door = door;
        var_31f5044848a4ae3.var_8ffb4040b18f4e9e = camera.origin - door.origin;
        var_31f5044848a4ae3.lastangles = door.angles;
        var_31f5044848a4ae3.var_c8767a772842d047 = 56;
        var_31f5044848a4ae3.var_2b0efc06e5b01e0a = 96;
        camera.var_8ac5efce71cc57c5 = array_add(camera.var_8ac5efce71cc57c5, var_31f5044848a4ae3);
    }
    if (camera.var_8ac5efce71cc57c5.size == 0) {
        return;
    }
    while (isdefined(camera) && !istrue(camera.isdestroyed)) {
        foreach (var_1e92d8d3755a9ff8 in camera.var_8ac5efce71cc57c5) {
            if (var_1e92d8d3755a9ff8.door.angles != var_1e92d8d3755a9ff8.lastangles) {
                var_1e92d8d3755a9ff8.lastangles = var_1e92d8d3755a9ff8.door.angles;
                var_77c133840a36c8a4 = math::anglebetweenvectors(flatten_vector(var_1e92d8d3755a9ff8.var_8ffb4040b18f4e9e), anglestoforward(var_1e92d8d3755a9ff8.door.angles));
                if (var_77c133840a36c8a4 < 5) {
                    var_88d662fc2c82edca = vectordot(anglestoforward(var_1e92d8d3755a9ff8.door.angles), var_1e92d8d3755a9ff8.var_8ffb4040b18f4e9e);
                    var_ed6905ba175361c5 = vectordot(anglestoup(var_1e92d8d3755a9ff8.door.angles), var_1e92d8d3755a9ff8.var_8ffb4040b18f4e9e);
                    if (var_88d662fc2c82edca < var_1e92d8d3755a9ff8.var_c8767a772842d047 && var_ed6905ba175361c5 < var_1e92d8d3755a9ff8.var_2b0efc06e5b01e0a) {
                        camera thread [[ destroyfunc ]]();
                        break;
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x939f
// Size: 0x78
function function_2f4e45ab83f0b424(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (1) {
        self waittill("switch_thermal_mode");
        if (camera namespace_5a51aa78ea0b1b9f::is_empd()) {
            continue;
        }
        visionset = function_149fe9342a5ea239(camera);
        camera function_7f8da30c35b9ab0(camera, ter_op(visionset == "tacCam", "killstreak_thermal", "tacCam"));
        function_4789702c319cd7a7(camera);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x941e
// Size: 0x21
function function_7f8da30c35b9ab0(camera, visionsetname) {
    camera.currentvisionset = visionsetname;
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9446
// Size: 0xf9
function function_4789702c319cd7a7(camera, var_3830144da9e3136b) {
    visionset = function_149fe9342a5ea239(camera);
    players = [0:self];
    if (!istrue(var_3830144da9e3136b)) {
        if (isdefined(camera.watchers)) {
            foreach (player in camera.watchers) {
                if (isdefined(player) && isalive(player)) {
                    players[players.size] = player;
                }
            }
        }
    }
    foreach (player in players) {
        player function_7abf9767930dca21(camera, visionset);
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9546
// Size: 0x77
function function_7abf9767930dca21(camera, visionsetname, transitiontime) {
    if (!isdefined(transitiontime)) {
        transitiontime = 0;
    }
    if (camera.currentvisionset == "killstreak_thermal") {
        self visionsetkillstreakforplayer("");
        self visionsetthermalforplayer(visionsetname, transitiontime);
        self thermalvisionon();
    } else {
        self visionsetthermalforplayer("");
        self visionsetkillstreakforplayer(visionsetname, transitiontime);
        self thermalvisionoff();
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95c4
// Size: 0x74
function function_eca023ad97260f51(camera, var_4602d2933c2d30a8) {
    /#
        assertex(isdefined(camera.currentvisionset), "Camera tried to apply a vision set but none has been defined. Please check your args.");
    #/
    if (camera.currentvisionset == "killstreak_thermal") {
        self visionsetthermalforplayer("");
    } else {
        self visionsetkillstreakforplayer("");
    }
    self thermalvisionoff();
    if (istrue(var_4602d2933c2d30a8)) {
        camera.currentvisionset = undefined;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x963f
// Size: 0x64
function function_149fe9342a5ea239(camera) {
    if (isdefined(camera.currentvisionset)) {
        return camera.currentvisionset;
    } else {
        if (namespace_36f464722d326bbe::isnightmap()) {
            camera.currentvisionset = "killstreak_thermal";
        } else {
            camera.currentvisionset = "tacCam";
        }
        return camera.currentvisionset;
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96aa
// Size: 0x7a
function function_804a24f3e1a7b680() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (1) {
        var_ff8e235b01cd7409 = getthermalswitchplayercommand();
        self notifyonplayercommand("switch_thermal_mode", var_ff8e235b01cd7409);
        var_fd99cc32b0ac87b4 = waittill_any_return_no_endon_death_2("input_type_changed", "thermal_handling_ended");
        self notifyonplayercommandremove("switch_thermal_mode", var_ff8e235b01cd7409);
        if (!isdefined(var_fd99cc32b0ac87b4) || var_fd99cc32b0ac87b4 == "thermal_handling_ended") {
            break;
        }
    }
}

// Namespace namespace_ff6dd778c8d54dc8/namespace_5633828963c62e57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972b
// Size: 0x46
function function_7df57541f06a5f0() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("usingCamera");
    starttime = gettime();
    while (gettime() < starttime + 1000) {
        self disablephysicaldepthoffieldscripting();
        wait(0.1);
    }
}

