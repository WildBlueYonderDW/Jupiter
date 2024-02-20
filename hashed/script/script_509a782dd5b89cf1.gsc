// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_509a782dd5b89cf1;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace uav_bigmap;

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d
// Size: 0x97
function init() {
    /#
        setdevdvarifuninitialized(@"hash_2c4aa32449462d6e", 25);
        setdevdvarifuninitialized(@"hash_8caa0944a27274aa", 2);
        setdevdvarifuninitialized(@"hash_baea8656875e8f33", 4);
        setdevdvarifuninitialized(@"hash_b0336da463c5b9a4", 12000);
        setdevdvarifuninitialized(@"hash_306f1f0806522199", 3);
    #/
    if (issharedfuncdefined("uav_bigmap", "init")) {
        [[ getsharedfunc("uav_bigmap", "init") ]]();
    }
    function_f2b595d060c7b8d1();
    function_8fcbc948e54837e1();
    function_10d96f03366a78a8();
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0x4e
function function_f2b595d060c7b8d1() {
    game["dialog"]["uav_bigmap_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["uav_bigmap_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["uav_bigmap_destroyed"] = "killstreak_remote_operator" + "_crash";
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360
// Size: 0x70
function function_8fcbc948e54837e1() {
    level.var_1a92f34363247d37 = [];
    foreach (var_2e79aa0fbcdb8210 in level.teamnamelist) {
        level.var_1a92f34363247d37[var_2e79aa0fbcdb8210] = [];
    }
    level thread function_123f8da350e72770();
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7
// Size: 0x33
function function_10d96f03366a78a8() {
    level.var_7b9204710b5ccc9b = [];
    if (getdvarint(@"hash_4c7c5844364d23ec", 0)) {
        level.var_627afd3a97c2d347 = 1;
    }
    level thread function_c73f8180ddbbca7e();
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0x334
function function_123f8da350e72770() {
    level endon("game_ended");
    while (1) {
        currenttime = gettime();
        foreach (teamname, arr in level.var_1a92f34363247d37) {
            if (level.var_1a92f34363247d37[teamname].size > 0) {
                var_8506ba4041fbe9bb = 0;
                for (i = level.var_1a92f34363247d37[teamname].size - 1; i >= 0; i--) {
                    var_9df9b10a1d4123ba = level.var_1a92f34363247d37[teamname][i];
                    if (!isdefined(var_9df9b10a1d4123ba)) {
                        continue;
                    }
                    var_94016b8397435ce3 = 0;
                    for (index = var_9df9b10a1d4123ba.starttimes.size - 1; index >= 0; index--) {
                        if (var_9df9b10a1d4123ba.starttimes[index] + var_9df9b10a1d4123ba.duration * 1000 < currenttime) {
                            var_9df9b10a1d4123ba.starttimes[index] = undefined;
                            var_9df9b10a1d4123ba.owner playkillstreakoperatordialog("uav", "uav_leave", 1);
                            if (issharedfuncdefined("player", "printGameAction")) {
                                [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - UAV", var_9df9b10a1d4123ba.owner);
                            }
                            var_94016b8397435ce3 = 1;
                        }
                    }
                    if (var_94016b8397435ce3) {
                        var_9df9b10a1d4123ba.starttimes = array_removeundefined(var_9df9b10a1d4123ba.starttimes);
                    }
                    if (var_9df9b10a1d4123ba.starttimes.size == 0) {
                        level.var_1a92f34363247d37[teamname][i] = undefined;
                        var_8506ba4041fbe9bb = 1;
                    } else if (!(isalive(var_9df9b10a1d4123ba.owner) && !isdefined(var_9df9b10a1d4123ba.owner.fauxdead) && !istrue(var_9df9b10a1d4123ba.owner.delayedspawnedplayernotify) && !istrue(var_9df9b10a1d4123ba.owner.liveRagdoll))) {
                        level.var_1a92f34363247d37[teamname][i] = undefined;
                        var_8506ba4041fbe9bb = 1;
                        continue;
                    }
                }
                if (var_8506ba4041fbe9bb) {
                    level.var_1a92f34363247d37[teamname] = array_removeundefined(level.var_1a92f34363247d37[teamname]);
                }
                for (j = 0; j < level.var_1a92f34363247d37[teamname].size; j++) {
                    var_9df9b10a1d4123ba = level.var_1a92f34363247d37[teamname][j];
                    var_eb42c9a48fe362f2 = var_9df9b10a1d4123ba.starttimes.size;
                    if (var_9df9b10a1d4123ba.var_8b226fa0a4438980 + var_9df9b10a1d4123ba.var_a2a010ca62b6691e * 1000 / var_eb42c9a48fe362f2 < currenttime) {
                        function_d1444dd5b0f1ebac(var_9df9b10a1d4123ba);
                        function_e457560e955be5f5(var_9df9b10a1d4123ba.owner.team, var_9df9b10a1d4123ba.owner.origin, var_9df9b10a1d4123ba.radius, var_9df9b10a1d4123ba.var_a2a010ca62b6691e + 0.05);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c
// Size: 0xbc
function function_e457560e955be5f5(ownerteam, pinglocation, var_9f47268324f609b3, var_b6b08a6a6f96b5c4) {
    if (istrue(level.var_627afd3a97c2d347) || !isBRStyleGameType()) {
        return;
    }
    var_a0e0ace3a15f1029 = getplayersinradius(pinglocation, var_9f47268324f609b3);
    foreach (player in var_a0e0ace3a15f1029) {
        if (player.team != ownerteam) {
            player setclientomnvar("ui_br_under_uav", 1);
            function_8d15d4705e80ad1b(player, var_b6b08a6a6f96b5c4);
        }
    }
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80f
// Size: 0xed
function private function_8d15d4705e80ad1b(player, duration) {
    if (!isdefined(level.var_7b9204710b5ccc9b)) {
        level.var_7b9204710b5ccc9b = [];
    }
    var_44917c970d977234 = player getentitynumber();
    if (isdefined(level.var_7b9204710b5ccc9b[var_44917c970d977234])) {
        var_eec6cbdd17b2ea6b = gettime() + duration * 1000;
        if (var_eec6cbdd17b2ea6b > level.var_7b9204710b5ccc9b[var_44917c970d977234].var_b87821c5690418e8) {
            level.var_7b9204710b5ccc9b[var_44917c970d977234].player = player;
            level.var_7b9204710b5ccc9b[var_44917c970d977234].var_b87821c5690418e8 = var_eec6cbdd17b2ea6b;
        }
    } else {
        var_20fee2178a0610e0 = spawnstruct();
        var_20fee2178a0610e0.player = player;
        var_20fee2178a0610e0.var_b87821c5690418e8 = gettime() + duration * 1000;
        level.var_7b9204710b5ccc9b[var_44917c970d977234] = var_20fee2178a0610e0;
    }
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x903
// Size: 0x14c
function private function_c73f8180ddbbca7e() {
    level endon("game_ended");
    if (!isdefined(level.var_7b9204710b5ccc9b)) {
        level.var_7b9204710b5ccc9b = [];
    }
    while (1) {
        if (level.var_7b9204710b5ccc9b.size > 0) {
            currenttime = gettime();
            var_7788478921559b44 = [];
            foreach (var_20fee2178a0610e0 in level.var_7b9204710b5ccc9b) {
                if (var_20fee2178a0610e0.var_b87821c5690418e8 < currenttime) {
                    if (isplayer(var_20fee2178a0610e0.player)) {
                        var_20fee2178a0610e0.player setclientomnvar("ui_br_under_uav", 0);
                    }
                    var_7788478921559b44[var_7788478921559b44.size] = var_20fee2178a0610e0.player getentitynumber();
                }
            }
            if (var_7788478921559b44.size > 0) {
                foreach (id in var_7788478921559b44) {
                    level.var_7b9204710b5ccc9b[id] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa56
// Size: 0xbb
function function_e5931b9f76ed6cda(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_phone_mp"));
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]]("uav", self.origin);
    }
    namespace_2c99f682179581bf::function_e24c416c5028bccc(self, streakinfo);
    return 1;
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb19
// Size: 0x1f9
function function_e24c416c5028bccc(owner, streakinfo) {
    if (!isdefined(level.var_1a92f34363247d37)) {
        level thread init();
    }
    if (issharedfuncdefined("player", "doOnActionScoreEvent")) {
        owner [[ getsharedfunc("player", "doOnActionScoreEvent") ]](2, "uavUsed");
    }
    var_ef41235a89500ad8 = level.uavsettings["uav"].teamsplash;
    var_274a2749ef16ee1f = streakinfo.streakname;
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](owner, var_274a2749ef16ee1f);
        var_52a5be2e2f91d710 = 2;
    }
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (var_e005d4b70d6f2611) {
        killstreak_dangerNotifyPlayersInRange(owner, owner.team, 15000, var_274a2749ef16ee1f);
    } else {
        owner thread playkillstreakoperatordialog("uav", var_274a2749ef16ee1f + "_use", 1, var_52a5be2e2f91d710);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](var_ef41235a89500ad8, owner);
    }
    var_45aed8fd3d63e0db = function_4b696648abf2a7cd(owner.team);
    if (var_45aed8fd3d63e0db + 1 >= getdvarint(@"hash_306f1f0806522199", 3)) {
        if (function_3713808120900a4(owner)) {
            function_b9a6e42f8062d9e(owner.team);
            return;
        }
    }
    var_13aaab0ee500428d = function_d8f7d7425ee3435b(owner);
    if (isdefined(var_13aaab0ee500428d)) {
        var_13aaab0ee500428d.starttimes[var_13aaab0ee500428d.starttimes.size] = gettime();
    } else {
        function_b26df19671891830(owner, streakinfo);
    }
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd19
// Size: 0x87
function function_4b696648abf2a7cd(team) {
    var_eb42c9a48fe362f2 = 0;
    if (isdefined(level.var_1a92f34363247d37[team])) {
        foreach (struct in level.var_1a92f34363247d37[team]) {
            var_eb42c9a48fe362f2 = var_eb42c9a48fe362f2 + struct.starttimes.size;
        }
    }
    return var_eb42c9a48fe362f2;
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda8
// Size: 0x4e
function function_b9a6e42f8062d9e(team) {
    if (isdefined(level.var_1a92f34363247d37[team])) {
        for (index = level.var_1a92f34363247d37[team].size - 1; index >= 0; index--) {
            level.var_1a92f34363247d37[team][index] = undefined;
        }
    }
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0x82
function function_3713808120900a4(owner) {
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("directional_uav", owner);
    streakinfo.skipequippedstreakcheck = 1;
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    return owner namespace_f1fe279354a7da2::function_d64c0d6be4dbbaaf(streakinfo.streakname, streakinfo);
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe87
// Size: 0xa1
function function_d8f7d7425ee3435b(player) {
    var_13aaab0ee500428d = undefined;
    if (isdefined(level.var_1a92f34363247d37[player.team])) {
        foreach (struct in level.var_1a92f34363247d37[player.team]) {
            if (struct.owner == player) {
                var_13aaab0ee500428d = struct;
                break;
            }
        }
    }
    return var_13aaab0ee500428d;
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf30
// Size: 0x120
function function_b26df19671891830(owner, streakinfo) {
    duration = getdvarfloat(@"hash_2c4aa32449462d6e", 25);
    var_5888fe9dac2d7d8e = getdvarfloat(@"hash_8caa0944a27274aa", 2);
    var_a2a010ca62b6691e = getdvarfloat(@"hash_baea8656875e8f33", 4);
    radius = getdvarint(@"hash_b0336da463c5b9a4", 12000);
    if (owner namespace_f8065cafc523dba5::function_eba2f2e094684b8f("specialty_overwatch") && !isBRStyleGameType()) {
        var_5888fe9dac2d7d8e = var_5888fe9dac2d7d8e * 0.5;
        var_a2a010ca62b6691e = var_a2a010ca62b6691e * 0.5;
    }
    if (owner namespace_f8065cafc523dba5::function_eba2f2e094684b8f("specialty_uav_buff")) {
        duration = duration * ter_op(isdefined(level.var_1408c77a4f773854), level.var_1408c77a4f773854, 1);
        radius = int(radius * ter_op(isdefined(level.var_c0fe6cb6face684e), level.var_c0fe6cb6face684e, 1));
    }
    var_9df9b10a1d4123ba = function_c1f0080375451d78(owner, radius, duration, var_5888fe9dac2d7d8e, var_a2a010ca62b6691e, streakinfo);
    function_48b2b4d259d7d51d(var_9df9b10a1d4123ba);
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1057
// Size: 0x6a
function function_48b2b4d259d7d51d(var_9df9b10a1d4123ba) {
    if (!isdefined(level.var_1a92f34363247d37[var_9df9b10a1d4123ba.team])) {
        level.var_1a92f34363247d37[var_9df9b10a1d4123ba.team] = [];
    }
    level.var_1a92f34363247d37[var_9df9b10a1d4123ba.team][level.var_1a92f34363247d37[var_9df9b10a1d4123ba.team].size] = var_9df9b10a1d4123ba;
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c8
// Size: 0xd8
function function_c1f0080375451d78(owner, radius, duration, var_5888fe9dac2d7d8e, var_a2a010ca62b6691e, streakinfo) {
    var_8c0551592e3b775b = spawnstruct();
    var_8c0551592e3b775b.starttimes = [];
    var_8c0551592e3b775b.starttimes[0] = gettime();
    var_8c0551592e3b775b.owner = owner;
    var_8c0551592e3b775b.team = owner.team;
    var_8c0551592e3b775b.var_8b226fa0a4438980 = 0;
    var_8c0551592e3b775b.radius = radius;
    var_8c0551592e3b775b.var_5888fe9dac2d7d8e = var_5888fe9dac2d7d8e;
    var_8c0551592e3b775b.var_a2a010ca62b6691e = var_a2a010ca62b6691e;
    var_8c0551592e3b775b.duration = duration;
    var_8c0551592e3b775b.streakinfo = streakinfo;
    return var_8c0551592e3b775b;
}

// Namespace uav_bigmap/namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0xb6
function function_d1444dd5b0f1ebac(var_9df9b10a1d4123ba) {
    if (level.teambased) {
        triggerportableradarpingteam(var_9df9b10a1d4123ba.owner.origin, var_9df9b10a1d4123ba.team, var_9df9b10a1d4123ba.radius, int(var_9df9b10a1d4123ba.var_5888fe9dac2d7d8e * 1000));
    } else {
        triggerportableradarping(var_9df9b10a1d4123ba.owner.origin, var_9df9b10a1d4123ba.owner, var_9df9b10a1d4123ba.radius, int(var_9df9b10a1d4123ba.var_5888fe9dac2d7d8e * 1000));
    }
    var_9df9b10a1d4123ba.var_8b226fa0a4438980 = gettime();
}

