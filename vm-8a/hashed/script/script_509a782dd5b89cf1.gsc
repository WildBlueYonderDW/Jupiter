#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_509a782dd5b89cf1;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace uav_bigmap;

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d
// Size: 0x96
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

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0x4d
function function_f2b595d060c7b8d1() {
    game["dialog"]["uav_bigmap_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["uav_bigmap_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["uav_bigmap_destroyed"] = "killstreak_remote_operator" + "_crash";
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360
// Size: 0x6f
function function_8fcbc948e54837e1() {
    level.var_1a92f34363247d37 = [];
    foreach (gameplayteam in level.teamnamelist) {
        level.var_1a92f34363247d37[gameplayteam] = [];
    }
    level thread function_123f8da350e72770();
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7
// Size: 0x32
function function_10d96f03366a78a8() {
    level.var_7b9204710b5ccc9b = [];
    if (getdvarint(@"hash_4c7c5844364d23ec", 0)) {
        level.var_627afd3a97c2d347 = 1;
    }
    level thread function_c73f8180ddbbca7e();
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0x333
function function_123f8da350e72770() {
    level endon("game_ended");
    while (true) {
        currenttime = gettime();
        foreach (teamname, arr in level.var_1a92f34363247d37) {
            if (level.var_1a92f34363247d37[teamname].size > 0) {
                var_8506ba4041fbe9bb = 0;
                for (i = level.var_1a92f34363247d37[teamname].size - 1; i >= 0; i--) {
                    uavstruct = level.var_1a92f34363247d37[teamname][i];
                    if (!isdefined(uavstruct)) {
                        continue;
                    }
                    removeuav = 0;
                    for (index = uavstruct.starttimes.size - 1; index >= 0; index--) {
                        if (uavstruct.starttimes[index] + uavstruct.duration * 1000 < currenttime) {
                            uavstruct.starttimes[index] = undefined;
                            uavstruct.owner playkillstreakoperatordialog("uav", "uav_leave", 1);
                            if (issharedfuncdefined("player", "printGameAction")) {
                                [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - UAV", uavstruct.owner);
                            }
                            removeuav = 1;
                        }
                    }
                    if (removeuav) {
                        uavstruct.starttimes = array_removeundefined(uavstruct.starttimes);
                    }
                    if (uavstruct.starttimes.size == 0) {
                        level.var_1a92f34363247d37[teamname][i] = undefined;
                        var_8506ba4041fbe9bb = 1;
                        continue;
                    }
                    if (!(isalive(uavstruct.owner) && !isdefined(uavstruct.owner.fauxdead) && !istrue(uavstruct.owner.delayedspawnedplayernotify) && !istrue(uavstruct.owner.liveragdoll))) {
                        level.var_1a92f34363247d37[teamname][i] = undefined;
                        var_8506ba4041fbe9bb = 1;
                    }
                }
                if (var_8506ba4041fbe9bb) {
                    level.var_1a92f34363247d37[teamname] = array_removeundefined(level.var_1a92f34363247d37[teamname]);
                }
                for (j = 0; j < level.var_1a92f34363247d37[teamname].size; j++) {
                    uavstruct = level.var_1a92f34363247d37[teamname][j];
                    uavcount = uavstruct.starttimes.size;
                    if (uavstruct.var_8b226fa0a4438980 + uavstruct.sweepinterval * 1000 / uavcount < currenttime) {
                        function_d1444dd5b0f1ebac(uavstruct);
                        function_e457560e955be5f5(uavstruct.owner.team, uavstruct.owner.origin, uavstruct.radius, uavstruct.sweepinterval + 0.05);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c
// Size: 0xbb
function function_e457560e955be5f5(ownerteam, pinglocation, pingradius, pingtime) {
    if (istrue(level.var_627afd3a97c2d347) || !isbrstylegametype()) {
        return;
    }
    var_a0e0ace3a15f1029 = getplayersinradius(pinglocation, pingradius);
    foreach (player in var_a0e0ace3a15f1029) {
        if (player.team != ownerteam) {
            player setclientomnvar("ui_br_under_uav", 1);
            function_8d15d4705e80ad1b(player, pingtime);
        }
    }
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80f
// Size: 0xec
function private function_8d15d4705e80ad1b(player, duration) {
    if (!isdefined(level.var_7b9204710b5ccc9b)) {
        level.var_7b9204710b5ccc9b = [];
    }
    var_44917c970d977234 = player getentitynumber();
    if (isdefined(level.var_7b9204710b5ccc9b[var_44917c970d977234])) {
        currentend = gettime() + duration * 1000;
        if (currentend > level.var_7b9204710b5ccc9b[var_44917c970d977234].var_b87821c5690418e8) {
            level.var_7b9204710b5ccc9b[var_44917c970d977234].player = player;
            level.var_7b9204710b5ccc9b[var_44917c970d977234].var_b87821c5690418e8 = currentend;
        }
        return;
    }
    pingstruct = spawnstruct();
    pingstruct.player = player;
    pingstruct.var_b87821c5690418e8 = gettime() + duration * 1000;
    level.var_7b9204710b5ccc9b[var_44917c970d977234] = pingstruct;
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x903
// Size: 0x14b
function private function_c73f8180ddbbca7e() {
    level endon("game_ended");
    if (!isdefined(level.var_7b9204710b5ccc9b)) {
        level.var_7b9204710b5ccc9b = [];
    }
    while (true) {
        if (level.var_7b9204710b5ccc9b.size > 0) {
            currenttime = gettime();
            var_7788478921559b44 = [];
            foreach (pingstruct in level.var_7b9204710b5ccc9b) {
                if (pingstruct.var_b87821c5690418e8 < currenttime) {
                    if (isplayer(pingstruct.player)) {
                        pingstruct.player setclientomnvar("ui_br_under_uav", 0);
                    }
                    var_7788478921559b44[var_7788478921559b44.size] = pingstruct.player getentitynumber();
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

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa56
// Size: 0xba
function function_e5931b9f76ed6cda(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return false;
        }
    }
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_phone_mp"));
    if (!istrue(deployresult)) {
        return false;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return false;
        }
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]]("uav", self.origin);
    }
    namespace_2c99f682179581bf::function_e24c416c5028bccc(self, streakinfo);
    return true;
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb19
// Size: 0x1f8
function function_e24c416c5028bccc(owner, streakinfo) {
    if (!isdefined(level.var_1a92f34363247d37)) {
        level thread init();
    }
    if (issharedfuncdefined("player", "doOnActionScoreEvent")) {
        owner [[ getsharedfunc("player", "doOnActionScoreEvent") ]](2, "uavUsed");
    }
    calloutsplash = level.uavsettings["uav"].teamsplash;
    vostreakname = streakinfo.streakname;
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](owner, vostreakname);
        var_52a5be2e2f91d710 = 2;
    }
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (isbr) {
        killstreak_dangernotifyplayersinrange(owner, owner.team, 15000, vostreakname);
    } else {
        owner thread playkillstreakoperatordialog("uav", vostreakname + "_use", 1, var_52a5be2e2f91d710);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](calloutsplash, owner);
    }
    var_45aed8fd3d63e0db = function_4b696648abf2a7cd(owner.team);
    if (var_45aed8fd3d63e0db + 1 >= getdvarint(@"hash_306f1f0806522199", 3)) {
        if (function_3713808120900a4(owner)) {
            function_b9a6e42f8062d9e(owner.team);
            return;
        }
    }
    playerstruct = function_d8f7d7425ee3435b(owner);
    if (isdefined(playerstruct)) {
        playerstruct.starttimes[playerstruct.starttimes.size] = gettime();
        return;
    }
    function_b26df19671891830(owner, streakinfo);
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd19
// Size: 0x86
function function_4b696648abf2a7cd(team) {
    uavcount = 0;
    if (isdefined(level.var_1a92f34363247d37[team])) {
        foreach (struct in level.var_1a92f34363247d37[team]) {
            uavcount += struct.starttimes.size;
        }
    }
    return uavcount;
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda8
// Size: 0x4d
function function_b9a6e42f8062d9e(team) {
    if (isdefined(level.var_1a92f34363247d37[team])) {
        for (index = level.var_1a92f34363247d37[team].size - 1; index >= 0; index--) {
            level.var_1a92f34363247d37[team][index] = undefined;
        }
    }
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0x81
function function_3713808120900a4(owner) {
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo("directional_uav", owner);
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
    return owner scripts\cp_mp\killstreaks\uav::uav_use(streakinfo.streakname, streakinfo);
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe87
// Size: 0xa0
function function_d8f7d7425ee3435b(player) {
    playerstruct = undefined;
    if (isdefined(level.var_1a92f34363247d37[player.team])) {
        foreach (struct in level.var_1a92f34363247d37[player.team]) {
            if (struct.owner == player) {
                playerstruct = struct;
                break;
            }
        }
    }
    return playerstruct;
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf30
// Size: 0x11f
function function_b26df19671891830(owner, streakinfo) {
    duration = getdvarfloat(@"hash_2c4aa32449462d6e", 25);
    sweeptime = getdvarfloat(@"hash_8caa0944a27274aa", 2);
    sweepinterval = getdvarfloat(@"hash_baea8656875e8f33", 4);
    radius = getdvarint(@"hash_b0336da463c5b9a4", 12000);
    if (owner scripts\cp_mp\utility\player_utility::player_hasperk("specialty_overwatch") && !isbrstylegametype()) {
        sweeptime *= 0.5;
        sweepinterval *= 0.5;
    }
    if (owner scripts\cp_mp\utility\player_utility::player_hasperk("specialty_uav_buff")) {
        duration *= ter_op(isdefined(level.var_1408c77a4f773854), level.var_1408c77a4f773854, 1);
        radius = int(radius * ter_op(isdefined(level.var_c0fe6cb6face684e), level.var_c0fe6cb6face684e, 1));
    }
    uavstruct = function_c1f0080375451d78(owner, radius, duration, sweeptime, sweepinterval, streakinfo);
    function_48b2b4d259d7d51d(uavstruct);
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1057
// Size: 0x69
function function_48b2b4d259d7d51d(uavstruct) {
    if (!isdefined(level.var_1a92f34363247d37[uavstruct.team])) {
        level.var_1a92f34363247d37[uavstruct.team] = [];
    }
    level.var_1a92f34363247d37[uavstruct.team][level.var_1a92f34363247d37[uavstruct.team].size] = uavstruct;
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c8
// Size: 0xd7
function function_c1f0080375451d78(owner, radius, duration, sweeptime, sweepinterval, streakinfo) {
    uavdata = spawnstruct();
    uavdata.starttimes = [];
    uavdata.starttimes[0] = gettime();
    uavdata.owner = owner;
    uavdata.team = owner.team;
    uavdata.var_8b226fa0a4438980 = 0;
    uavdata.radius = radius;
    uavdata.sweeptime = sweeptime;
    uavdata.sweepinterval = sweepinterval;
    uavdata.duration = duration;
    uavdata.streakinfo = streakinfo;
    return uavdata;
}

// Namespace uav_bigmap / namespace_2c99f682179581bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0xb5
function function_d1444dd5b0f1ebac(uavstruct) {
    if (level.teambased) {
        triggerportableradarpingteam(uavstruct.owner.origin, uavstruct.team, uavstruct.radius, int(uavstruct.sweeptime * 1000));
    } else {
        triggerportableradarping(uavstruct.owner.origin, uavstruct.owner, uavstruct.radius, int(uavstruct.sweeptime * 1000));
    }
    uavstruct.var_8b226fa0a4438980 = gettime();
}

