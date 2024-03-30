// mwiii decomp prototype
#using scripts\common\values.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using script_713ccfa3a01d4d19;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_5c65d346ac65390c;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_58f20490049af6ac;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\poi.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using script_3aacf02225ca0da5;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_247745a526421ba7;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\gametypes\br_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_38792c8a2bf7f251;

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x3 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x362
function autoexec init() {
    svEnabled = getmatchrulesdata("brData", "svEnabled");
    var_183344133d2e1d5e = getdvarint(@"hash_f35af94032732e47", svEnabled);
    if (!var_183344133d2e1d5e) {
        return false;
    }
    if (isdefined(level.secondaryvictory)) {
        return true;
    }
    svData = getmatchrulesdata("brData", "svData");
    if (!isdefined(svData)) {
        return false;
    }
    svbundlename = hashcat(%"hash_7ab67ff682ad6a50", svData);
    svbundle = getscriptbundle(svbundlename);
    function_89db4cf4358b1915(1);
    /#
        scripts/mp/gametypes/br_dev::registerhandlecommand(&function_6a7b9641a3a20e1f);
    #/
    level.secondaryvictory = spawnstruct();
    level.secondaryvictory.started = 0;
    level.secondaryvictory.var_7210c81ee207cdb0 = max(getdvarint(@"hash_31739bb33b05d74c", svbundle.choppertime), 26.5);
    level.secondaryvictory.choppertotaltime = level.secondaryvictory.var_7210c81ee207cdb0 + svbundle.var_4ccd047b077a4b6a.waittime;
    level.secondaryvictory.scriptbundle = svbundle;
    level.secondaryvictory.var_f1a47f3d1492db51 = &function_f1a47f3d1492db51;
    level.secondaryvictory.var_3a91667e613d19c1 = &function_3a91667e613d19c1;
    level.secondaryvictory.var_ca6df075cc967173 = [];
    level.secondaryvictory.missions = [];
    level.secondaryvictory.var_5fc0bb331fcc1784 = svbundle.var_5fc0bb331fcc1784;
    level.secondaryvictory.var_ddb244800e3f1329 = randomintrange(0, svbundle.var_8396ddb130a38012);
    level.secondaryvictory.var_ddd94078236bd05 = getdvarint(@"hash_8546cb8c5523f232", 20);
    level.secondaryvictory.mindistance = getdvarint(@"hash_ec6a0742a30321bd", svbundle.mindistance);
    level.secondaryvictory.maxdistance = getdvarint(@"hash_b083e7f0964a470f", svbundle.maxdistance);
    /#
        level.secondaryvictory.var_c0c782ebf134ee03 = getdvarint(@"hash_d45f2e96f48c9129", 0);
    #/
    /#
        assert(level.secondaryvictory.var_5fc0bb331fcc1784 > 0);
    #/
    function_15ec8dc28147b1b7(@"hash_64d082079ceb46b6", &function_b878acdc34c32bd, &function_e89fc0ef7d6123d9, "cash");
    function_15ec8dc28147b1b7(@"hash_64d081079ceb4483", &function_677a58693f27bb60, &function_15e5e77836d740c2, "");
    game["dialog"]["brsv_pickup_inbound"] = "chop_grav_chne";
    game["dialog"]["brsv_pickup_arrived"] = "chop_grav_char";
    game["dialog"]["brsv_exfiltration"] = "chop_grav_chle";
    /#
        level.var_82a0e660e66306dc = 1;
    #/
    thread function_7d47bded29ed7882(svbundle.var_4ccd047b077a4b6a);
    level thread function_48f199019893233();
    return true;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88c
// Size: 0xcb
function function_7d47bded29ed7882(var_4ccd047b077a4b6a) {
    /#
        assert(isdefined(var_4ccd047b077a4b6a));
    #/
    namespace_e8fceb5cf6e8cdf8::function_7d47bded29ed7882(var_4ccd047b077a4b6a.var_92fea9c582fd2caa, var_4ccd047b077a4b6a.heliheight, var_4ccd047b077a4b6a.waittime, var_4ccd047b077a4b6a.minwaittime, var_4ccd047b077a4b6a.var_1a7e969d835799f2, var_4ccd047b077a4b6a.exitheight, var_4ccd047b077a4b6a.var_abe738473a42706b, var_4ccd047b077a4b6a.helihealth);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("player_exfil_timer", &function_7b63b062159d64cb);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("music_stop", &function_118dc20289bc94a0);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("exfil_players", &function_d15cbb4f920e92fd);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("reset_exfil", &function_7b51c79840a37c3a);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("setup_gas_masks", &function_8c8e1037bb8c3ef4);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x95e
// Size: 0xf2
function function_6a7b9641a3a20e1f(command, args) {
    /#
        switch (command) {
        case #"hash_af32b9b7ebc04c7":
            function_30fb8dea9a7466c4(level.secondaryvictory.var_6a74104a63470ca2);
            break;
        case #"hash_1b4ecfb568298fd2":
            level thread function_627d884a50e4bbbc();
            break;
        case #"hash_7c8ad5104b2870aa":
            function_8f78f23c923cee28(args);
            break;
        case #"hash_fdff73e06f359bb":
            devvictory(args);
            break;
        case #"hash_d4e56e3ef5685967":
            function_ddd97b020459c8d1(args);
            break;
        case #"hash_8ffd5b7429ec26f2":
            devsplash(args);
            break;
        case #"hash_5177508bcd7a8800":
            player = devgetplayer();
            player playsoundtoteam(args[0], player.team);
            break;
        }
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa57
// Size: 0x5b
function private function_627d884a50e4bbbc() {
    /#
        player = devgetplayer();
        while (true) {
            wait(1);
            triggers = function_4edea32bcde90be0(player.origin);
            if (isdefined(level.var_87a042f91827f93d)) {
                function_30fb8dea9a7466c4(triggers);
            }
            function_30fb8dea9a7466c4(triggers);
        }
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xab9
// Size: 0x14b
function private function_30fb8dea9a7466c4(triggers) {
    /#
        if (!isdefined(level.var_87a042f91827f93d)) {
            level.var_87a042f91827f93d = [];
            if (isdefined(level.secondaryvictory) && isdefined(triggers)) {
                foreach (et in triggers) {
                    objid = scripts/mp/objidpoolmanager::requestobjectiveid(99);
                    if (objid != -1) {
                        scripts/mp/objidpoolmanager::objective_add_objective(objid, "<unknown string>", et.origin, "<unknown string>");
                        scripts/mp/objidpoolmanager::update_objective_setbackground(objid, 1);
                        scripts/mp/objidpoolmanager::objective_set_play_intro(objid, 1);
                        level.var_87a042f91827f93d[level.var_87a042f91827f93d.size] = objid;
                        continue;
                    }
                    /#
                        println("<unknown string>");
                    #/
                }
            }
            return;
        }
        foreach (objid in level.var_87a042f91827f93d) {
            scripts/mp/objidpoolmanager::returnobjectiveid(objid);
        }
        level.var_87a042f91827f93d = undefined;
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc0b
// Size: 0x51
function private devgetplayer(args) {
    /#
        player = scripts/mp/gametypes/br_dev::function_69dffe7a5cb1b4b9();
        if (isdefined(args) && args.size > 0 && int(args[0]) > 0) {
            player = level.players[int(args[0])];
        }
        return player;
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc63
// Size: 0x64
function private function_8f78f23c923cee28(args) {
    /#
        if (!isdefined(level.secondaryvictory)) {
            iprintln("<unknown string>");
            return;
        }
        if (!level.secondaryvictory.started) {
            iprintln("<unknown string>");
            return;
        }
        player = devgetplayer(args);
        player function_2aa9a736450d87ce();
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcce
// Size: 0x9a
function private devvictory(args) {
    /#
        if (!isdefined(level.secondaryvictory)) {
            iprintln("<unknown string>");
            return;
        }
        endingid = 0;
        if (isdefined(args) && args.size > 0) {
            endingid = int(args[0]);
        } else {
            endingid = level.secondaryvictory.var_ddb244800e3f1329;
            function_1324ed2d881d301f();
        }
        player = devgetplayer();
        player function_d15cbb4f920e92fd([player], function_d6da5b6a241b8149(player.team));
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd6f
// Size: 0x79
function private function_ddd97b020459c8d1(args) {
    /#
        if (!isdefined(level.secondaryvictory)) {
            iprintln("<unknown string>");
            return;
        }
        player = devgetplayer();
        players = level.teamdata[player.team]["<unknown string>"];
        player function_d15cbb4f920e92fd(players, function_d6da5b6a241b8149(player.team));
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdef
// Size: 0x7f
function private function_d6da5b6a241b8149(team) {
    /#
        seq = spawnstruct();
        seq.team = team;
        seq.trigger = spawnstruct();
        seq.trigger.origin = (0, 0, 0);
        info = spawnstruct();
        info.var_394aebba88e4e8c2 = seq;
        return info;
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe75
// Size: 0x47
function private devsplash(args) {
    /#
        if (!isdefined(args) || args.size < 1) {
            return;
        }
        player = devgetplayer();
        splash = args[0];
        player function_f3830638ad346e8e(splash);
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec3
// Size: 0x666
function function_48f199019893233() {
    level endon("game_ended");
    level waittill("prematch_done");
    if (level.mapname == "mp_jup_br_mechanics") {
        utility::addstruct({origin:(487, -2506, 0), angles:(0, 0, 0), script_noteworthy:"chopper_exfil_covert"});
        utility::addstruct({origin:(-1528, -2257, 0), angles:(0, 90, 0), script_noteworthy:"chopper_exfil_covert"});
        utility::addstruct({origin:(-1309, 466, 0), angles:(0, 90, 0), script_noteworthy:"chopper_exfil_covert"});
    } else if (scripts/cp_mp/utility/game_utility::function_314ff105a27cc131()) {
        finalstruct = {origin:(-2870, 416, 1258), angles:(0, 53, 0), script_noteworthy:"chopper_exfil_covert"};
        utility::addstruct(finalstruct);
    } else if (scripts/cp_mp/utility/game_utility::function_eb4bce9b222e36ac()) {
        var_6a74104a63470ca2 = getstructarray("chopper_exfil_covert", "script_noteworthy");
        if (var_6a74104a63470ca2.size == 0) {
            utility::addstruct({origin:(7053, 5551, 1440), angles:(0, 61, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-22731, -9846, 1503), angles:(0, 352, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(6990, -26253, 1705), angles:(0, 88, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(23741, 10660, 1469), angles:(0, 0, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-166, 19195, 998), angles:(0, 255, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-355, -15090, 2042), angles:(0, 175, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-16673, 10802, 1274), angles:(0, 340, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-11505, -20149, 1745), angles:(0, 128, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(26560, -16714, 3066), angles:(0, 70, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(23985, 428, 2549), angles:(0, 70, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-27443, 4315, 1029), angles:(0, 15, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-2047, 1837, 2006), angles:(0, 210, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(-13712, 28828, 2589), angles:(0, 94, 0), script_noteworthy:"chopper_exfil_covert"});
            utility::addstruct({origin:(11350, 26786, 1564), angles:(0, 150, 0), script_noteworthy:"chopper_exfil_covert"});
        }
    }
    level.secondaryvictory.var_6a74104a63470ca2 = getstructarray("chopper_exfil_covert", "script_noteworthy");
    iprintln("exfil trigger count: " + level.secondaryvictory.var_6a74104a63470ca2.size);
    for (i = 0; i < level.secondaryvictory.var_6a74104a63470ca2.size; i++) {
        if (isdefined(level.secondaryvictory.var_6a74104a63470ca2[i].target)) {
            helinode = getstruct(level.secondaryvictory.var_6a74104a63470ca2[i].target, "targetname");
            if (isdefined(helinode)) {
                level.secondaryvictory.var_6a74104a63470ca2[i].heliorigin = helinode.origin;
                level.secondaryvictory.var_6a74104a63470ca2[i].heliangles = helinode.angles;
            }
        }
    }
    level thread function_d2c4882ce103ea5();
    initteamdata();
    level.secondaryvictory.started = 1;
    function_3049b4b9d7489dca(1);
    function_3f39c7ace07c243();
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1530
// Size: 0x76
function function_d2c4882ce103ea5() {
    waitframe();
    for (i = 0; i < level.secondaryvictory.var_6a74104a63470ca2.size; i++) {
        node = level.secondaryvictory.var_6a74104a63470ca2[i];
        node.circleinfo = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(node.origin);
        if (i % 20 == 0) {
            waitframe();
        }
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ad
// Size: 0x58
function function_f1a47f3d1492db51() {
    player = self;
    teamdata = getteamdata(player.team);
    if (isdefined(teamdata.var_394aebba88e4e8c2)) {
        /#
            iprintln(player.name + "<unknown string>");
        #/
        return false;
    }
    return true;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160d
// Size: 0x3c
function function_3a91667e613d19c1(pickupent) {
    player = self;
    if (!isdefined(level.secondaryvictory)) {
        return;
    }
    /#
        iprintlnbold("<unknown string>");
    #/
    player function_2aa9a736450d87ce();
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1650
// Size: 0xcf
function function_70ee001b7b3a1bd0() {
    player = self;
    teamdata = getteamdata(player.team);
    if (!scripts/cp_mp/vehicles/vehicle_tracking::canspawnvehicle()) {
        /#
            iprintln("<unknown string>" + player.name + "<unknown string>");
        #/
        return 27;
    }
    if (isdefined(teamdata.var_394aebba88e4e8c2)) {
        /#
            iprintln("<unknown string>" + player.name + "<unknown string>");
        #/
        return 26;
    }
    trigger = function_64b11aef75e78506(player.origin);
    if (!isdefined(trigger)) {
        /#
            iprintln("<unknown string>" + player.name + "<unknown string>");
        #/
        return 18;
    }
    return 2;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1727
// Size: 0x10e
function function_2aa9a736450d87ce() {
    /#
        assert(level.secondaryvictory.started);
    #/
    /#
        if (istrue(level.secondaryvictory.var_c0c782ebf134ee03)) {
            foreach (trigger in level.secondaryvictory.var_6a74104a63470ca2) {
                thread startevent(self, trigger);
            }
            return;
        }
    #/
    if (function_70ee001b7b3a1bd0() != 2) {
        return;
    }
    player = self;
    teamdata = getteamdata(player.team);
    /#
        assert(!isdefined(teamdata.var_394aebba88e4e8c2));
    #/
    trigger = function_64b11aef75e78506(player.origin);
    /#
        assert(isdefined(trigger));
    #/
    thread startevent(player, trigger);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183c
// Size: 0x26a
function startevent(player, trigger) {
    var_394aebba88e4e8c2 = function_fdd037317409179e(player);
    team = player.team;
    teamdata = getteamdata(team);
    teamdata.var_394aebba88e4e8c2 = var_394aebba88e4e8c2;
    level endon("game_ended");
    if (var_394aebba88e4e8c2.achieved || var_394aebba88e4e8c2.inprogress) {
        return;
    }
    function_92993664746f4afa(team, level.secondaryvictory.scriptbundle.var_48b81409af379a6b);
    function_6a694b8e45c2ca3c("brsv_pickup_inbound", var_394aebba88e4e8c2.team, 3);
    /#
        iprintln("<unknown string>" + var_394aebba88e4e8c2.name);
    #/
    var_394aebba88e4e8c2.inprogress = 1;
    trigger.inuse = 1;
    var_394aebba88e4e8c2 thread function_203ccd957c2ef7e4(level.teamdata[team]["players"]);
    avg_dist = 0;
    foreach (p in level.teamdata[team]["players"]) {
        d = distance2d(p.origin, trigger.origin);
        avg_dist = avg_dist + d;
        p function_810f4a04a9253967(d);
    }
    teamsize = level.teamdata[team]["players"].size;
    avg_dist = avg_dist / teamsize;
    function_4c04d9675ebe2f9f(team, teamsize, trigger.origin, avg_dist, level.secondaryvictory.var_7210c81ee207cdb0);
    /#
        assert(!isdefined(var_394aebba88e4e8c2.var_86909aea6009b811));
    #/
    var_394aebba88e4e8c2 initchopper(trigger);
    var_394aebba88e4e8c2 function_160e85c84dcd9d28();
    var_394aebba88e4e8c2 choppersequence();
    var_394aebba88e4e8c2 cleanup();
    var_394aebba88e4e8c2.inprogress = 0;
    teamdata.var_394aebba88e4e8c2 = undefined;
    /#
        iprintln("<unknown string>" + var_394aebba88e4e8c2.name + "<unknown string>");
    #/
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aad
// Size: 0x1fe
function function_4edea32bcde90be0(origin) {
    scriptbundle = level.secondaryvictory.scriptbundle;
    min2 = squared(level.secondaryvictory.mindistance);
    max2 = squared(level.secondaryvictory.maxdistance);
    comparetime = level.secondaryvictory.choppertotaltime;
    weights = [];
    maxweight = 0;
    for (i = 0; i < level.secondaryvictory.var_6a74104a63470ca2.size; i++) {
        exfiltrigger = level.secondaryvictory.var_6a74104a63470ca2[i];
        d2 = distance2dsquared(exfiltrigger.origin, origin);
        weight = 0;
        if (d2 > min2) {
            weight = weight + 1;
        }
        if (d2 < max2) {
            weight = weight + 2;
        }
        if (isdefined(exfiltrigger.circleinfo)) {
            dangertime = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(exfiltrigger.circleinfo);
            if (dangertime >= comparetime) {
                weight = weight + 4;
            }
        }
        weights[i] = weight;
        maxweight = max(maxweight, weight);
    }
    besttriggers = [];
    for (i = 0; i < level.secondaryvictory.var_6a74104a63470ca2.size; i++) {
        exfiltrigger = level.secondaryvictory.var_6a74104a63470ca2[i];
        if (weights[i] == maxweight && !istrue(exfiltrigger.inuse)) {
            besttriggers[besttriggers.size] = exfiltrigger;
        }
    }
    if (besttriggers.size > 5) {
        besttriggers = sortbydistance(besttriggers, origin);
        besttriggers = array_slice(besttriggers, 0, 5);
    }
    return besttriggers;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb3
// Size: 0x2e
function function_64b11aef75e78506(origin) {
    besttriggers = function_4edea32bcde90be0(origin);
    if (besttriggers.size == 0) {
        return undefined;
    }
    return random(besttriggers);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce9
// Size: 0x6b
function initchopper(trigger) {
    var_394aebba88e4e8c2 = self;
    var_394aebba88e4e8c2.trigger = trigger;
    var_394aebba88e4e8c2.var_3064fa24dbbd5bbf = function_ee503e14666bf0b9(var_394aebba88e4e8c2.trigger);
    var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.var_394aebba88e4e8c2 = var_394aebba88e4e8c2;
    function_68d3e10e25ad432(var_394aebba88e4e8c2.var_3064fa24dbbd5bbf);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5b
// Size: 0x237
function function_363fe741930d5e4b() {
    var_394aebba88e4e8c2 = self;
    scriptbundle = level.secondaryvictory.scriptbundle;
    radius2 = scriptbundle.var_8544cdb39053b6da * scriptbundle.var_8544cdb39053b6da;
    time = min(scriptbundle.var_fccf931e70112a65, level.secondaryvictory.var_7210c81ee207cdb0);
    wait(time);
    /#
        iprintln("<unknown string>" + scriptbundle.var_8544cdb39053b6da + "<unknown string>");
    #/
    teamsinrange = [];
    foreach (team, data in level.teamdata) {
        if (team == var_394aebba88e4e8c2.team) {
            continue;
        }
        foreach (player in data["players"]) {
            if (distance2dsquared(player.origin, var_394aebba88e4e8c2.trigger.origin) < radius2) {
                teamsinrange = function_6d6af8144a5131f1(teamsinrange, player.team);
                break;
            }
        }
    }
    foreach (team in teamsinrange) {
        /#
            iprintln("<unknown string>" + player.team);
        #/
        function_92993664746f4afa(team, scriptbundle.var_a5dce8ab6aa7ff9b);
    }
    ent = var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent;
    ent setscriptablepartstate("br_sv_exfil_icon", "communal_icon");
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f99
// Size: 0xb3
function choppersequence() {
    var_394aebba88e4e8c2 = self;
    /#
        assert(isdefined(var_394aebba88e4e8c2.player));
    #/
    var_394aebba88e4e8c2 thread function_3681229b1ab89438();
    var_394aebba88e4e8c2 thread function_363fe741930d5e4b();
    overhead = 26.5;
    waittime = max(level.secondaryvictory.var_7210c81ee207cdb0 - overhead, 0);
    wait(waittime);
    var_394aebba88e4e8c2.player thread namespace_e8fceb5cf6e8cdf8::function_d1478474b036b87f(var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent, undefined, undefined, var_394aebba88e4e8c2.player, undefined, undefined, undefined, "vj001");
    var_394aebba88e4e8c2 waittill("chopperSequence_done");
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2053
// Size: 0x52
function function_3681229b1ab89438() {
    var_394aebba88e4e8c2 = self;
    waittime = int(level.secondaryvictory.var_7210c81ee207cdb0);
    function_b27feffb50ecce3(self.player.team, waittime);
    wait(waittime - 1);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ac
// Size: 0xed
function function_68d3e10e25ad432(var_3064fa24dbbd5bbf, model) {
    if (isdefined(var_3064fa24dbbd5bbf.ent)) {
        return;
    }
    if (!isdefined(model)) {
        model = var_3064fa24dbbd5bbf.modelname;
    }
    ent = spawn("script_model", var_3064fa24dbbd5bbf.origin);
    ent setmodel(model);
    ent.angles = var_3064fa24dbbd5bbf.angles;
    ent.info = var_3064fa24dbbd5bbf;
    ent.var_394aebba88e4e8c2 = var_3064fa24dbbd5bbf.var_394aebba88e4e8c2;
    scripts/cp_mp/calloutmarkerping::function_6b9641d0060c3a2c(ent);
    ent setscriptablepartstate("dmz_exfil_smoke", "smoking", 0);
    ent setscriptablepartstate("dmz_exfil_site", "standby");
    ent setotherent(var_3064fa24dbbd5bbf.var_394aebba88e4e8c2.player);
    var_3064fa24dbbd5bbf.ent = ent;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a0
// Size: 0x174
function function_ee503e14666bf0b9(node) {
    var_3064fa24dbbd5bbf = spawnstruct();
    if (isdefined(node.poi)) {
        var_3064fa24dbbd5bbf.poi = node.poi;
    } else {
        var_3064fa24dbbd5bbf.poi = scripts/mp/poi::function_55cf921efa4cbd09(node.origin);
    }
    var_3064fa24dbbd5bbf.angles = node.angles;
    var_3064fa24dbbd5bbf.origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(getclosestpointonnavmesh(node.origin));
    var_3064fa24dbbd5bbf.modelname = level.secondaryvictory.scriptbundle.var_abd5187f5fa7e8f8;
    if (isdefined(node.heliorigin) && isdefined(node.heliangles)) {
        var_3064fa24dbbd5bbf.helitargetorigin = node.heliorigin;
        var_3064fa24dbbd5bbf.helitargetangles = node.heliangles;
    } else {
        var_3064fa24dbbd5bbf.helitargetorigin = node.origin;
        var_3064fa24dbbd5bbf.helitargetangles = node.angles;
    }
    if (isdefined(node.script_label)) {
        if (node.script_label == "land") {
            var_3064fa24dbbd5bbf.land = 1;
        }
    }
    return var_3064fa24dbbd5bbf;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231c
// Size: 0x1b5
function function_7b63b062159d64cb(heli, time, dist) {
    self notify("exgm_exfil_timer");
    self endon("disconnect");
    self endon("exgm_exfil_timer");
    timer = time;
    if (heli.callingteam != self.team) {
        return;
    }
    teamdata = getteamdata(heli.callingteam);
    if (!isdefined(teamdata.var_394aebba88e4e8c2)) {
        return;
    }
    var_394aebba88e4e8c2 = teamdata.var_394aebba88e4e8c2;
    /#
        assert(isdefined(var_394aebba88e4e8c2) && isdefined(var_394aebba88e4e8c2.var_241735be4107a4fa));
    #/
    if (!var_394aebba88e4e8c2.var_241735be4107a4fa) {
        function_f3830638ad346e8e(level.secondaryvictory.scriptbundle.var_916f6b3ff9e56ecb);
        function_6a694b8e45c2ca3c("brsv_pickup_arrived", var_394aebba88e4e8c2.team);
        var_394aebba88e4e8c2.var_241735be4107a4fa = 1;
    }
    if (!isdefined(timer) || !isdefined(heli)) {
        return;
    }
    while (timer > 0) {
        if (timer < 11) {
            self setentitysoundcontext("lobby_fade", "on");
        }
        if (isdefined(dist) && (!isdefined(self) || distance(heli.origin, self.origin) > dist)) {
            break;
        }
        if (timer < 80) {
            function_74cdb6b6565f33a3(timer);
        }
        timer--;
        wait(1);
    }
    namespace_e8fceb5cf6e8cdf8::function_423f49e2512a5f53();
    function_74cdb6b6565f33a3(0);
    self setentitysoundcontext("lobby_fade", "", 2);
    function_6a694b8e45c2ca3c("brsv_exfiltration", var_394aebba88e4e8c2.team);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d8
// Size: 0x126
function function_8c8e1037bb8c3ef4(heli) {
    var_bf80f581fdce86d2 = heli.angles + (0, -90, -18);
    var_840c2ee92c8f78fe = [(33, 40, -198), (-15, 40, -198), (-58, 40, -198), (-105, 40, -198)];
    foreach (offset in var_840c2ee92c8f78fe) {
        relativeoffset = rotatevector(offset, heli.angles);
        dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(heli.origin + relativeoffset, var_bf80f581fdce86d2);
        gasmask = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_equip_gasmask", dropinfo, 108);
        gasmask utility::function_6e506f39f121ea8a(heli, offset);
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2605
// Size: 0x101
function function_b27feffb50ecce3(team, time) {
    self notify("exgm_exfil_timer");
    self endon("disconnect");
    self endon("exgm_exfil_timer");
    timer = time;
    if (!isdefined(timer)) {
        return;
    }
    while (timer > 0) {
        foreach (teammember in level.teamdata[team]["players"]) {
            teammember function_74cdb6b6565f33a3(timer);
        }
        timer--;
        wait(1);
    }
    foreach (teammember in level.teamdata[team]["players"]) {
        teammember function_74cdb6b6565f33a3(0);
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270d
// Size: 0xe1
function function_8f6b4a55252d124c(player) {
    var_394aebba88e4e8c2 = self;
    player notify("end_heli_exit_listener");
    player endon("end_heli_exit_listener");
    while (true) {
        msg = function_7b9e0e7ca4b3b940(player, "abort_exfil_music", player, "exited_chopper", var_394aebba88e4e8c2, "chopperSequence_done");
        if (isstring(msg)) {
            if (msg == "abort_exfil_music") {
                break;
            }
            if (msg == "exited_chopper") {
                if (istrue(var_394aebba88e4e8c2.liftoff)) {
                    break;
                }
                continue;
            }
        }
    }
    waittillframeend();
    if (!isplayer(player) || istrue(player.extracted)) {
        return;
    }
    function_f47d0805b8290615([player], 1);
    musicstate = function_17ee301cf0b5ba85("br_secondary_exfil_aborted");
    player setplayermusicstate(musicstate);
    player.var_43fa6aa15d11c927 = undefined;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f5
// Size: 0x14a
function function_203ccd957c2ef7e4(players, finalexfil) {
    level endon("game_ended");
    self endon("exfil_lifted_off");
    musicstate = function_17ee301cf0b5ba85("br_secondary_exfil");
    while (true) {
        active_players = scripts/mp/music_and_dialog::function_aecafe54c65c0e35(players);
        foreach (player in active_players) {
            if (isplayer(player) && !istrue(player.var_43fa6aa15d11c927)) {
                player.var_43fa6aa15d11c927 = 1;
                player setplayermusicstate(musicstate);
                thread function_8f6b4a55252d124c(player);
            }
        }
        inactive_players = array_difference(players, active_players);
        foreach (player in inactive_players) {
            if (isplayer(player) && istrue(player.var_43fa6aa15d11c927)) {
                player notify("abort_exfil_music");
            }
        }
        wait(1);
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2946
// Size: 0x11d
function function_118dc20289bc94a0(playersinside, finalexfil) {
    player = self;
    teamdata = getteamdata(player.team);
    /#
        assert(isdefined(teamdata.var_394aebba88e4e8c2));
    #/
    var_394aebba88e4e8c2 = teamdata.var_394aebba88e4e8c2;
    var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent setscriptablepartstate("br_sv_exfil_icon", "hidden_icon");
    var_394aebba88e4e8c2.liftoff = 1;
    var_394aebba88e4e8c2 notify("exfil_lifted_off");
    players_outside = array_difference(level.teamdata[player.team]["players"], playersinside);
    foreach (outside_player in players_outside) {
        outside_player notify("abort_exfil_music");
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6a
// Size: 0x7c
function function_2bf05f985938205e(players, fadetime) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player setsoundsubmix("solo_cin_igc_music", fadetime);
        player.var_30dc7dfd9be2a276 = 1;
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aed
// Size: 0x71
function function_f47d0805b8290615(players, fadetime) {
    foreach (player in players) {
        player clearsoundsubmix("solo_cin_igc_music", fadetime);
        player.var_30dc7dfd9be2a276 = undefined;
    }
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b65
// Size: 0x262
function function_d15cbb4f920e92fd(players, info) {
    /#
        assert(isdefined(info.var_394aebba88e4e8c2));
    #/
    var_394aebba88e4e8c2 = info.var_394aebba88e4e8c2;
    trigger = var_394aebba88e4e8c2.trigger;
    team_count = 0;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player notify("end_heli_exit_listener");
        if (player.team == var_394aebba88e4e8c2.team) {
            team_count++;
        }
    }
    has_weapon_case = 0;
    endingid = level.secondaryvictory.var_ddb244800e3f1329;
    function_1324ed2d881d301f();
    namespace_a8b2b88699fc40fb::function_25a4b6a2083e2ab(players);
    scripts/mp/gametypes/br::function_50e7496b6d13c173(players);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player.extracted = 1;
        if (namespace_a8b2b88699fc40fb::function_5a7168b0b511bec3(player)) {
            has_weapon_case = 1;
        }
        player thread function_1e1dd16af9297efd(player.origin, player.angles, -1, endingid, var_394aebba88e4e8c2);
    }
    relevantplayers = array_combine_unique(players, level.teamdata[var_394aebba88e4e8c2.team]["players"]);
    foreach (player in relevantplayers) {
        player scripts/cp_mp/challenges::function_565d6af7da923110(istrue(player.extracted));
    }
    fullyextracted = function_751af1123571e361(self.team);
    function_b1c6ce7b2edc4ec2(trigger.origin, var_394aebba88e4e8c2.team, team_count, fullyextracted, players.size, has_weapon_case, endingid);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dce
// Size: 0x1aa
function private function_1e1dd16af9297efd(extractpos, var_831b4ced8bc8fbee, var_532ecf4a03864da7, endingid, var_394aebba88e4e8c2) {
    if (!isdefined(self)) {
        return;
    }
    /#
        iprintln("<unknown string>" + self.name);
    #/
    self.extracted = 1;
    level endon("game_ended");
    self endon("disconnect");
    scripts/cp_mp/challenges::function_b7793133df5fb0df(namespace_649c2fab0fd72b8b::function_e2ff8f4b4e94f723(#"hash_4a7f024e87253788", #"hash_cbddf4cbba197f26"));
    if (istrue(level.secondaryvictory.var_ca6df075cc967173[self.team])) {
        self setclientomnvar("ui_br_sv_extract_successful", 2);
    } else {
        fullyextracted = function_751af1123571e361(self.team);
        if (fullyextracted) {
            level.secondaryvictory.var_ca6df075cc967173[self.team] = 1;
            self setclientomnvar("ui_br_sv_extract_successful", 2);
        } else {
            self setclientomnvar("ui_br_sv_extract_successful", 1);
        }
    }
    self allowmovement(0);
    self allowfire(0);
    self freezecontrols(1);
    self disableweapons();
    scripts/mp/gametypes/br_pickups::function_4d16b9c52efa3b8();
    self notify("successful_exfil");
    musicstate = function_17ee301cf0b5ba85("br_secondary_exfil_success");
    self setplayermusicstate(musicstate);
    function_2bf05f985938205e([self], 2);
    function_f3830638ad346e8e(level.secondaryvictory.scriptbundle.var_b0c0afb388cd54e2);
    scripts/mp/hud_message::showerrormessage("MP_BR_INGAME/SECONDARY_VICTORY");
    thread handleplayerexfildone(endingid, var_394aebba88e4e8c2);
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f7f
// Size: 0x1e6
function private handleplayerexfildone(endingid, var_394aebba88e4e8c2) {
    player = self;
    /#
        assert(istrue(player.extracted));
    #/
    namespace_a8b2b88699fc40fb::function_5704ab2a9381630f(player);
    player scripts/mp/utility/stats::incpersstat("secondaryVictories", 1);
    holding_weapon_case = namespace_a8b2b88699fc40fb::function_5a7168b0b511bec3(player);
    if (holding_weapon_case) {
        player scripts/mp/utility/stats::incpersstat("weaponCaseExfils", 1);
        scripts/cp_mp/challenges::function_8359cadd253f9604(player, "weapons_case_secondary_exfil", 1);
    }
    if (isdefined(var_394aebba88e4e8c2)) {
        player function_f35d9659b8af4887(var_394aebba88e4e8c2.team, holding_weapon_case, endingid, var_394aebba88e4e8c2.trigger.origin);
    }
    player function_10da62a5050109ed(endingid);
    player setclientomnvar("ui_br_squad_eliminated_active", 1);
    player setclientomnvar("ui_round_end_title", game["round_end"]["secondary_victory"]);
    player setclientomnvar("ui_round_end_reason", game["end_reason"]["covert_exfil"]);
    player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
    if (getdvarint(@"hash_14f8aed437e5e3b1", 0) == 1) {
        player kill();
        return;
    }
    player.fauxdead = 1;
    player.plotarmor = 1;
    scripts/mp/gametypes/br_spectate::migratespectators(player, undefined, 0);
    wait(1);
    if (!isdefined(player)) {
        return;
    }
    player.skipplaybodycountsound = 1;
    player namespace_4887422e77f3514e::onexitdeathsdoor(0);
    scripts/mp/gametypes/br_utility::markplayeraseliminated(player, "svExfil");
    player scripts/mp/playerlogic::removefromalivecount(0, "svExfil");
    scripts/mp/utility/teams::validatealivecount("extract", player.team, player);
    level thread scripts/mp/gametypes/br::updateplayerandteamcountui();
    player thread scripts/mp/gametypes/br_spectate::spawnspectator();
    wait(13);
    if (!isdefined(player)) {
        return;
    }
    function_f47d0805b8290615([player], 3);
    player.var_43fa6aa15d11c927 = undefined;
    player.plotarmor = undefined;
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316c
// Size: 0x42
function function_7b51c79840a37c3a(team) {
    self endon("disable");
    self setscriptablepartstate("dmz_exfil_smoke", "smoking", 1);
    var_394aebba88e4e8c2 = self.var_394aebba88e4e8c2;
    var_394aebba88e4e8c2 notify("chopperSequence_done");
}

// Namespace namespace_38792c8a2bf7f251 / namespace_3460310ddf4d9cfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b5
// Size: 0xc5
function cleanup() {
    var_394aebba88e4e8c2 = self;
    if (isdefined(var_394aebba88e4e8c2.var_3064fa24dbbd5bbf)) {
        if (isdefined(var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent)) {
            var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent.var_394aebba88e4e8c2 = undefined;
            var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent delete();
            var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.ent = undefined;
        }
        var_394aebba88e4e8c2.var_3064fa24dbbd5bbf.var_394aebba88e4e8c2 = undefined;
        var_394aebba88e4e8c2.var_3064fa24dbbd5bbf = undefined;
    }
    var_394aebba88e4e8c2.trigger.inuse = 0;
    var_394aebba88e4e8c2 destroyhudelements();
}

