// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\dev.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\carriable.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\calloutmarkerping_mp.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_263974019a8ba3fa;
#using scripts\mp\gametypes\br_keypad_util.gsc;
#using script_fea74ca25a69884;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_3c46a15a541390cf;
#using script_58f20490049af6ac;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_helicopters.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_callouts.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_b7a9ce0a2282b79;
#using script_6893a0a79807f057;
#using script_64acb6ce534155b7;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_303fd53078a244f1;
#using scripts\mp\class.gsc;
#using script_600b944a95c3a7bf;
#using script_7c40fa80892a721;
#using scripts\mp\menus.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\agents\agent_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_55e418c5cc946593;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using script_4c770a9a4ad7659c;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_6775ad452d13858;
#using script_188008b85f8b14d4;

#namespace namespace_22a3b9eb980b7c41;

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c3
// Size: 0x41
function init() {
    /#
        registerhandlecommand(&function_c96d7535862e245c);
        level thread function_7c57dd42429eb995();
        level thread function_fe99ab4dc900865e();
        thread commandwatcher(@"hash_97cda940cb7bd182", &handlecommand);
    #/
    namespace_ed19ace3eeb2e4::init();
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0xc0
function commandwatcher(dvarname, var_d4bb121b87421c8) {
    level notify("commandWatcher_" + function_f28fd66285fa2c9(dvarname));
    level endon("commandWatcher_" + function_f28fd66285fa2c9(dvarname));
    setdvar(dvarname, "");
    while (1) {
        waitframe();
        dvarvalue = getdvar(dvarname);
        if (dvarvalue == "") {
            continue;
        }
        setdvar(dvarname, "");
        tokens = strtok(dvarvalue, " ");
        if (!isdefined(tokens) || tokens.size < 1) {
            continue;
        }
        command = tokens[0];
        arglist = array_slice(tokens, 1);
        [[ var_d4bb121b87421c8 ]](command, arglist);
    }
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x75
function handlecommand(command, args) {
    if (!isdefined(level.handlecommandfuncs)) {
        return;
    }
    foreach (func in level.handlecommandfuncs) {
        [[ func ]](command, args);
    }
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x39
function registerhandlecommand(func) {
    if (!isdefined(level.handlecommandfuncs)) {
        level.handlecommandfuncs = [];
    }
    level.handlecommandfuncs[level.handlecommandfuncs.size] = func;
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48e
// Size: 0x78
function function_6a7b9641a3a20e1f(command, args) {
    /#
        if (!isdefined(level.var_e06803212476eb2a)) {
            return;
        }
        foreach (func in level.var_e06803212476eb2a) {
            [[ func ]](command, args);
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x50d
// Size: 0x3d3f
function function_c96d7535862e245c(command, args) {
    /#
        firstplayer = level.players[0];
        if (!isdefined(firstplayer)) {
            return;
        }
        switch (command) {
        case #"hash_2546668b41b70df2":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                break;
            }
            var_96f03b58138c074b = args[0];
            if (!isscriptabledefined(var_96f03b58138c074b)) {
                iprintlnbold("<unknown string>");
                break;
            }
            function_4d1c100badcf41a8(firstplayer, var_96f03b58138c074b);
            break;
        case #"hash_fa47ccf6bd7c59c1":
            namespace_15d3019056d1bcea::brvehiclesreset();
            break;
        case #"hash_fa11c2f6bd5168fc":
            resetglass();
            break;
        case #"hash_fa37ccf6bd6f8dce":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
            }
            victimname = args[0];
            attackername = args[1];
            function_5b5ab8ab53c49d4d(victimname, attackername);
            break;
        case #"hash_fa34c6f6bd6d45c5":
            if (args.size < 2) {
                iprintlnbold("<unknown string>");
            }
            var_6cca86b6634aa67e = args[0];
            victimname = args[1];
            attackername = args[2];
            function_53a0f5e4d6bbc7a4(victimname, attackername, var_6cca86b6634aa67e);
            break;
        case #"hash_30b20a099c3735ec":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
            }
            playername = args[0];
            function_72c1806e62a9bd10(playername);
            break;
        case #"hash_543cf0bb67313e3a":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
            }
            playername = args[0];
            function_72c1806e62a9bd10(playername, 1);
            break;
        case #"hash_425434cf8e59e2f1":
            level thread function_2729e9ab8a4ec44e();
            break;
        case #"hash_d7404b430bfb6e59":
            firstplayer thread namespace_44abc05161e2e2cb::showsplash("<unknown string>");
            break;
        case #"hash_4c34e58a34face70":
            level thread function_9bb9422480e6aa6d();
            break;
        case #"hash_6201f99dbadb9e66":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
            }
            winningteam = args[0];
            function_429110eb5af4a19c();
            if (isdefined(level.teamswithplayers) && array_contains(level.teamswithplayers, winningteam)) {
                level thread function_c3b8a31470635593(winningteam);
            }
            break;
        case #"hash_9a4940566b4804d1":
            firstplayer namespace_cb965d2f71fefddc::droponplayerdeath();
            break;
        case #"hash_59a2b6aee1837a39":
            setomnvar("<unknown string>", 1);
            wait(5);
            setomnvar("<unknown string>", -1);
            break;
        case #"hash_65f1ac7ad95daf95":
            firstplayer namespace_cb965d2f71fefddc::function_874048c58e96731();
            break;
        case #"hash_23b3bc8a2f9265f7":
            if (args.size < 3) {
                iprintlnbold("<unknown string>");
            }
            var_99594a4d67fef20b = int(args[0]);
            foreach (var_8f7c03ec5f22fe86 in level.players) {
                if (var_99594a4d67fef20b == var_8f7c03ec5f22fe86 getentitynumber()) {
                    var_8f7c03ec5f22fe86 namespace_d3d40f75bb4e4c32::updatebrscoreboardstat(args[1], int(args[2]));
                    break;
                }
            }
            break;
        case #"hash_ec91a685aa7f22c0":
            var_87311634879581b3 = int(args[0]);
            firstplayer thread function_9cbddfdef8f1125b(var_87311634879581b3);
            break;
        case #"hash_fe9c87c407e02cfd":
            if (args.size > 0) {
                minradius = undefined;
                var_3cb5ed493d942368 = undefined;
                maxradius = float(args[0]);
                if (args.size > 1) {
                    minradius = float(args[1]);
                    if (args.size > 2) {
                        var_3cb5ed493d942368 = int(args[2]) != 0;
                        points = getunusedlootcachepoints(firstplayer.origin, maxradius, minradius, var_3cb5ed493d942368);
                    } else {
                        points = getunusedlootcachepoints(firstplayer.origin, maxradius, minradius);
                    }
                } else {
                    points = getunusedlootcachepoints(firstplayer.origin, maxradius);
                }
            } else {
                points = getunusedlootcachepoints();
            }
            foreach (point in points) {
                debugstar(point.origin, (1, 0, 1), 100);
            }
            break;
        case #"hash_3622bda090e50ce6":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                return;
            }
            var_46cd67825792b125 = int(args[0]);
            origin = undefined;
            maxradius = undefined;
            minradius = undefined;
            var_3cb5ed493d942368 = undefined;
            if (args.size > 1) {
                origin = firstplayer.origin;
                maxradius = float(args[1]);
                if (args.size > 2) {
                    minradius = float(args[2]);
                    if (args.size > 3) {
                        var_3cb5ed493d942368 = int(args[3]) != 0;
                        points = getquestpoints(var_46cd67825792b125, origin, maxradius, minradius, var_3cb5ed493d942368);
                    } else {
                        points = getquestpoints(var_46cd67825792b125, origin, maxradius, minradius);
                    }
                } else {
                    points = getquestpoints(var_46cd67825792b125, origin, maxradius);
                }
            } else {
                points = getquestpoints(var_46cd67825792b125);
            }
            foreach (point in points) {
                debugstar(point.origin, (0, 1, 1), 100);
            }
            break;
        case #"hash_f458016c03940942":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                return;
            }
            pointindex = int(args[0]);
            disablelootspawnpoint(pointindex);
            break;
        case #"hash_31f1df2db98384de":
            if (args.size < 4) {
                iprintlnbold("<unknown string>");
            }
            var_6dbe510564c00969 = (float(args[0]), float(args[1]), float(args[2]));
            yaw = float(args[3]);
            firstplayer notify("<unknown string>", var_6dbe510564c00969);
            break;
        case #"hash_6d84033b4c81f07":
            level thread namespace_d20f8ef223912e12::brclosealldoors();
            break;
        case #"hash_22cf50efb1690259":
            level thread namespace_c5622898120e827f::function_9eb173d6a8fed181();
            break;
        case #"hash_b4f4ef49f66ee87e":
            namespace_dc84b0aa8d501507::function_afa41ee45eb3172f();
            break;
        case #"hash_94c57f2ff385d10c":
            namespace_dc84b0aa8d501507::function_7176642fe2ed10cd(0);
            break;
        case #"hash_88184c9f0929a28e":
            namespace_dc84b0aa8d501507::function_7176642fe2ed10cd(1);
            break;
        case #"hash_f9203276319358ff":
            namespace_dc84b0aa8d501507::function_14767b88f55e26e0();
            break;
        case #"hash_66f6a40540298feb":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                break;
            }
            circle = int(args[0]);
            level thread namespace_d04031d92bc84201::function_5d9c9221653df2f3(circle);
            break;
        case #"hash_35d376d7e454979a":
            level thread namespace_d04031d92bc84201::function_154cd3a077d16782();
            break;
        case #"hash_6a1fabe3febface6":
            level thread namespace_c5622898120e827f::function_46097952cff4dc2e();
            break;
        case #"hash_286b6adaa1a6599":
            level thread namespace_c5622898120e827f::function_e5958529715b6395();
            break;
        case #"hash_89b2c6b04528a2a":
            level thread namespace_c5622898120e827f::function_6a6e7f489e42bcda();
            break;
        case #"hash_f968160ea226d84e":
            level thread namespace_d04031d92bc84201::function_cdabf323178aabc6();
            break;
        case #"hash_399f8b169219d209":
            level thread namespace_d04031d92bc84201::function_295e765fd8265c81();
            break;
        case #"hash_f484096c03b6a81c":
            points = args[0];
            if (isdefined(points)) {
                points = float(points);
            }
            var_baa9e68ccfc47d07 = args[1];
            if (isdefined(var_baa9e68ccfc47d07)) {
                var_baa9e68ccfc47d07 = int(var_baa9e68ccfc47d07);
            }
            circleindex = args[2];
            if (isdefined(circleindex)) {
                circleindex = int(circleindex);
            }
            level thread namespace_c5622898120e827f::function_907a72325980713f(points, var_baa9e68ccfc47d07, circleindex);
            break;
        case #"hash_fa53d3f6bd855f22":
            namespace_c5622898120e827f::applycirclesettings();
            level thread namespace_d04031d92bc84201::function_f92da29572a7dc78();
            level thread namespace_c5622898120e827f::_precalcsafecirclecenters();
            level thread namespace_d04031d92bc84201::function_e71987651701448a();
            break;
        case #"hash_1a92216c17e9696e":
            if (isdefined(level.player)) {
                namespace_c5622898120e827f::applycirclesettings();
                level thread namespace_d04031d92bc84201::function_f92da29572a7dc78();
                level thread namespace_c5622898120e827f::_precalcsafecirclecenters(level.player.origin);
                level thread namespace_d04031d92bc84201::function_e71987651701448a();
            }
            break;
        case #"hash_3671f92e8779a2d":
            namespace_bbc79db4c3949a5c::function_9dcc9c74376e3a91();
            break;
        case #"hash_b15d9bc5054a8bdc":
            namespace_bbc79db4c3949a5c::function_d12a7c7251710cbf();
            break;
        case #"hash_e6cefeebcbd5658d":
            level thread namespace_c5622898120e827f::function_184d1e23ec969c18(10);
            break;
        case #"hash_f4a2ff6c03ce9d44":
            if (isdefined(level.player)) {
                if (isdefined(level.var_2bec641aeb4e5980)) {
                    foreach (index in level.var_2bec641aeb4e5980) {
                        namespace_5a22b6f3a56f7e9b::returnobjectiveid(index);
                    }
                    level.var_2bec641aeb4e5980 = undefined;
                } else {
                    foreground = args[0];
                    if (!isdefined(foreground)) {
                        foreground = "<unknown string>";
                    }
                    var_48094c816bbd08e0 = 6;
                    level.var_2bec641aeb4e5980 = [];
                    for (i = 0; i < var_48094c816bbd08e0; i++) {
                        objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
                        if (objectiveiconid != -1) {
                            level.var_2bec641aeb4e5980[level.var_2bec641aeb4e5980.size] = objectiveiconid;
                            origin = level.player.origin + (1, i - int(var_48094c816bbd08e0 / 2), 0) * 400;
                            namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "<unknown string>", origin, foreground);
                            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, i);
                        }
                    }
                }
            }
            break;
        case #"hash_81ebf88ef0730994":
            player = level.players[0];
            player.var_859654e0445a36d9 = !istrue(player.var_859654e0445a36d9);
            break;
        case #"hash_13432d1b64f9f725":
            namespace_cb965d2f71fefddc::spawndebugpickupfromdevgui(args[0]);
            break;
        case #"hash_88aa1ef1a7274457":
            namespace_cb965d2f71fefddc::spawndebugpickupfromdevgui(args[0], 0, args[1]);
            break;
        case #"hash_6f2d097b3165fadb":
            namespace_cb965d2f71fefddc::spawndebugpickupfromdevgui(args[0], 1);
            break;
        case #"hash_d156118a517dec2e":
            namespace_cb965d2f71fefddc::function_c87696a022a2c6fc();
            break;
        case #"hash_f50dad861a606d48":
            namespace_cb965d2f71fefddc::function_c87696a022a2c6fc(1);
            break;
        case #"hash_d50c079dfca42a66":
            namespace_cb965d2f71fefddc::function_510f82785bd2c148();
            break;
        case #"hash_ce57e2eaa93aa441":
            namespace_cb965d2f71fefddc::function_b158d838449b637e(args[0]);
            break;
        case #"hash_91bce2b64809c686":
            namespace_cb965d2f71fefddc::function_e2d83df8b282b199(args[0]);
            break;
        case #"hash_c715dc4c34c07470":
            for (index = 0; index < 20; index++) {
                namespace_cb965d2f71fefddc::spawndebugpickupfromdevgui(args[0]);
                wait(0.3);
            }
            break;
        case #"hash_bb2e498025a5100":
            foreach (player in level.players) {
                player thread namespace_cb965d2f71fefddc::function_849640d4a4d5ae98();
            }
            break;
        case #"hash_ee0dc7e8340124b0":
            itemslotindex = int(args[0]);
            foreach (player in level.players) {
                player thread namespace_cb965d2f71fefddc::quickdropitem(itemslotindex);
            }
            break;
        case #"hash_55977e57b7d74172":
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(host)) {
                var_2b48101ca8ad8249 = int(args[0]);
                namespace_1b7e64f50cca9321::spawnlootcache(host.origin, host.angles, var_2b48101ca8ad8249);
            }
            break;
        case #"hash_543d105aa3e01d5f":
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(host)) {
                spawnorigin = host.origin + anglestoforward(host.angles) * 100 + (0, 0, 10);
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    [[ getsharedfunc("<unknown string>", "<unknown string>") ]](spawnorigin, host.angles);
                }
            }
            break;
        case #"hash_3fd5c20ad5fdf076":
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(host)) {
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    spawnorigin = host.origin + anglestoforward(host.angles) * 100 + (0, 0, 10);
                    level thread [[ getsharedfunc("<unknown string>", "<unknown string>") ]](spawnorigin, host.angles);
                }
            }
            break;
        case #"hash_21d7c416f08db3ca":
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                level thread [[ getsharedfunc("<unknown string>", "<unknown string>") ]](8, int(args[0]));
            }
            break;
        case #"hash_4a7dcc9be6321a31":
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                level thread [[ getsharedfunc("<unknown string>", "<unknown string>") ]](int(args[0]));
            }
            break;
        case #"hash_e67849f9be3e5694":
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                level thread [[ getsharedfunc("<unknown string>", "<unknown string>") ]]();
            }
            break;
        case #"hash_f4bfffd3aac18802":
            namespace_5dd9c938a1d0a5bf::forceejectall();
            break;
        case #"hash_e13779c2ed7bb949":
            foreach (player in level.players) {
                player thread namespace_c3059e55bc606259::function_efb496dab102df58();
                break;
            }
            break;
        case #"hash_fa8ca7ecbb266177":
            level thread namespace_c3059e55bc606259::precomputedropbagpositions(0);
            break;
        case #"hash_7c2b8c824464365d":
            foreach (player in level.players) {
                player setorigin((0, 0, 24000));
                player thread namespace_5078ee98abb32db9::startfreefall(5, 0, undefined, (1, 0, 0) * namespace_ad389306d44fc6b4::getc130speed());
                break;
            }
            break;
        case #"hash_a6aaa6d4367207ed":
            amount = int(args[0]);
            foreach (player in level.players) {
                player namespace_c6ccccd95254983f::playerplunderpickup(amount);
            }
            break;
        case #"hash_18ff195f73506428":
            foreach (player in level.players) {
                player namespace_c6ccccd95254983f::playerthrowsmokesignal();
            }
            break;
        case #"hash_a369d55fee4139a4":
            var_bdae9d5232fbe5cd = int(args[0]);
            level thread namespace_d20f8ef223912e12::debugtestcirclevfx(var_bdae9d5232fbe5cd);
            break;
        case #"hash_2d711ba89ea418a":
            level thread namespace_a011fbf6d93f25e5::branalytics_endgame();
            break;
        case #"hash_f484066c03b6a363":
            level thread namespace_cf43e8181d279e3e::function_1d1637db14bbc7d1();
            break;
        case #"hash_d5d3012bbaba6238":
            thread namespace_ad389306d44fc6b4::function_6fd27619248c2584();
            break;
        case #"hash_4e4776a3fadda5df":
            thread namespace_ad389306d44fc6b4::function_c6f09ac70af3c7cb();
            break;
        case #"hash_ac9fc9d4872c3163":
            thread namespace_ad389306d44fc6b4::function_22c604d143e3eb87(args[0]);
            break;
        case #"hash_8ff3986c5518a2e3":
            if (args.size < 2) {
                iprintlnbold("<unknown string>");
                return;
            }
            type = args[0];
            if (type == "<unknown string>") {
                var_9714ddda6a6df159 = int(max(0, int(args[1]) / 100));
                firstplayer namespace_c6ccccd95254983f::playersetplundercount(var_9714ddda6a6df159);
            }
            break;
        case #"hash_ba72800f31a3607c":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                return;
            }
            var_c7383d9309c52a8d["<unknown string>"] = &function_fd61b9aa3a4c64bf;
            var_c7383d9309c52a8d["<unknown string>"] = &function_bc261c1a1cb59524;
            var_c7383d9309c52a8d["<unknown string>"] = &function_28dc06904e18e469;
            var_c7383d9309c52a8d["<unknown string>"] = &function_5377fd507f9ea057;
            var_c7383d9309c52a8d["<unknown string>"] = &function_c41e8bac1d7f3bc8;
            var_c7383d9309c52a8d["<unknown string>"] = &function_a2fdd1067da9ff6e;
            var_c7383d9309c52a8d["<unknown string>"] = &function_26ab41fd72f1c761;
            if (args[0] == "<unknown string>") {
                args = getarraykeys(var_c7383d9309c52a8d);
            }
            foreach (type in args) {
                foreach (player in level.players) {
                    utility::trycall(var_c7383d9309c52a8d[type], player);
                }
            }
            break;
        case #"hash_1447f46e153fa1b6":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                return;
            }
            var_c7383d9309c52a8d["<unknown string>"] = &function_559b4cb8f64848b5;
            if (args[0] == "<unknown string>") {
                args = getarraykeys(var_c7383d9309c52a8d);
            }
            foreach (type in args) {
                foreach (player in level.players) {
                    utility::trycall(var_c7383d9309c52a8d[type], player);
                }
            }
            break;
        case #"hash_fa11c4f6bd516c22":
            ammount = int(args[0]);
            if (args.size == 3) {
                team = args[1];
                index = int(args[2]);
                level.teamdata[team]["<unknown string>"][index] namespace_c6ccccd95254983f::playerplunderpickup(ammount);
            } else if (args.size == 2) {
                team = args[1];
                foreach (player in level.teamdata[team]["<unknown string>"]) {
                    player namespace_c6ccccd95254983f::playerplunderpickup(ammount);
                }
            } else {
                foreach (team, data in level.teamdata) {
                    foreach (player in data["<unknown string>"]) {
                        player namespace_c6ccccd95254983f::playerplunderpickup(ammount);
                    }
                }
            }
            break;
        case #"hash_39157f6520b45cf3":
            thread namespace_ad389306d44fc6b4::function_7d4cd5dc8e9151a0();
            break;
        case #"hash_70cd4cd3fcb23ac2":
            thread function_4c35185bbc6a8506();
            break;
        case #"hash_6d0d996c43611d83":
            level thread function_7a26b30793922b87();
            break;
        case #"hash_fa21b3f6bd5e1d52":
            level thread namespace_c5622898120e827f::function_acc901c78fe65b94(args);
            break;
        case #"hash_ca0d86eadeeb0f28":
            namespace_c758024ed02b8875::function_a1a40eb763fdd549(args[0]);
            break;
        case #"hash_262e09660f30b224":
            namespace_c758024ed02b8875::function_a6ec7bb20c89f0e8();
            break;
        case #"hash_f9b86a90368cfa3e":
            level thread function_29e8c83db696b457();
            break;
        case #"hash_1b126254bb5a3b99":
            level thread function_820b8302ada04c55();
            break;
        case #"hash_520d2a58ee102c35":
            level thread namespace_c758024ed02b8875::function_a48e852b0f6a3295(args[0]);
            break;
        case #"hash_c902de6620bec3c9":
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(host)) {
                host namespace_a4b43c1cf86c6fe5::playerhandlecirclepickitem();
            }
            break;
        case #"hash_9f5c4b24b1adbf08":
            thread function_d671c39a7867f243(args);
            break;
        case #"hash_eeb8782d88cce2a1":
            if (isdefined(level.var_802eea8e2cbeb0)) {
                level thread [[ level.var_802eea8e2cbeb0 ]](args[0]);
            }
            break;
        case #"hash_ee1f628b0f38b069":
            if (args[0].size > 0) {
                value = int(args[0]);
                host = namespace_d576b6dc7cef9c62::gethostplayer();
                host function_179a8d5a185dfb56(value);
            }
            break;
        case #"hash_a95269034d36f9c":
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            bot = host function_5718089fc75809c3();
            if (isdefined(bot) && isbot(bot)) {
                botnum = bot getentitynumber();
                kick(botnum);
            }
            break;
        case #"hash_3da52d78f16a33d":
            foreach (player in level.players) {
                player thread namespace_a38a2e1fe7519183::function_c563bbc48f1dd3d2(player);
            }
            break;
        case #"hash_73d6df617868209":
            foreach (player in level.players) {
                player namespace_a38a2e1fe7519183::function_e64d9a42c66018c9(player);
            }
            break;
        case #"hash_d3e042390aa07110":
            namespace_bf7e4ac48f40185::activate();
            break;
        case #"hash_b4d8c64baa74a93":
            namespace_bf7e4ac48f40185::function_1d901a49ea1a6787();
            break;
        case #"hash_9a14147eba150d7":
            level thread function_9503654ca3380f8a(args);
            break;
        case #"hash_67690a8767af2434":
            if (args.size == 1) {
                function_237b71faf9fb62d9(firstplayer, args[0]);
            }
            break;
        case #"hash_f3962c3d914738f7":
            if (args.size == 2) {
                player = function_b32113236442c6ab(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                namespace_1eb3c4e0e28fac71::function_22671614e8f79513(player, args[0]);
            } else if (args.size == 1) {
                namespace_1eb3c4e0e28fac71::function_22671614e8f79513(firstplayer, args[0]);
            }
            break;
        case #"hash_f8cd0b61d913bc46":
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            var_c0173f6249a46bd1 = namespace_e8a49b70d0769b66::gethighestscore();
            highestscore = var_c0173f6249a46bd1[1];
            var_1ff67ba127220e2 = var_c0173f6249a46bd1[0];
            namespace_e8a49b70d0769b66::_setteamscore(host.team, highestscore + 1);
            namespace_d576b6dc7cef9c62::forceend();
            break;
        case #"hash_ce1f2c196fa400a8":
            if (args[0] == "<unknown string>") {
                var_99bcf6bdf31a0e49 = 1;
            } else if (args[0] == "<unknown string>") {
                var_99bcf6bdf31a0e49 = 0;
            } else {
                iprintlnbold("<unknown string>");
                break;
            }
            if (args.size == 2) {
                player = function_b32113236442c6ab(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    [[ getsharedfunc("<unknown string>", "<unknown string>") ]](player, var_99bcf6bdf31a0e49);
                }
            } else if (args.size == 1) {
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    [[ getsharedfunc("<unknown string>", "<unknown string>") ]](firstplayer, var_99bcf6bdf31a0e49);
                }
            }
            break;
        case #"hash_e155e96b5e579879":
            if (args.size != 2) {
                iprintlnbold("<unknown string>");
                break;
            }
            initialplayer = function_b32113236442c6ab(args[0]);
            var_784c8ada1184ff89 = function_b32113236442c6ab(args[1]);
            if (!isdefined(initialplayer) || !isdefined(var_784c8ada1184ff89)) {
                iprintlnbold("<unknown string>");
                break;
            }
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                [[ getsharedfunc("<unknown string>", "<unknown string>") ]](initialplayer, var_784c8ada1184ff89, 0);
            }
            break;
        case #"hash_a739340327e3089e":
            var_99bcf6bdf31a0e49 = 1;
            if (isdefined(args[0])) {
                if (args[0] == "<unknown string>") {
                    var_99bcf6bdf31a0e49 = 1;
                } else if (args[0] == "<unknown string>") {
                    var_99bcf6bdf31a0e49 = 0;
                }
            }
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            var_1a115880d69eba7d = host function_bfe726b5e0b35c27();
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                [[ getsharedfunc("<unknown string>", "<unknown string>") ]](host, var_1a115880d69eba7d, var_99bcf6bdf31a0e49, 0);
            }
            break;
        case #"hash_cdd3d19e11186e13":
            var_1ebfd0ce882dbcc6 = level.player;
            if (args.size >= 1) {
                var_1ebfd0ce882dbcc6 = function_b2dcd958dd436171(tolower(args[0]));
            }
            if (isdefined(var_1ebfd0ce882dbcc6)) {
                var_1ebfd0ce882dbcc6 dodamage(var_1ebfd0ce882dbcc6.health, var_1ebfd0ce882dbcc6.origin, var_1ebfd0ce882dbcc6);
            }
            break;
        case #"hash_779e498488e0fd4f":
        case #"hash_d542616c7a17d00d":
        case #"hash_dddecc2751311914":
        case #"hash_663b0900ff0e81c7":
        case #"hash_5549fae4e940416f":
        case #"hash_fa4dbef6bd80c0e5":
        case #"hash_fa50aaf6bd82e000":
            if (issharedfuncdefined(command, "<unknown string>")) {
                level thread [[ getsharedfunc(command, "<unknown string>") ]](args);
            }
            break;
        case #"hash_4bbfcf4e978d515f":
            duration = int(ter_op(isdefined(args[0]), args[0], 60));
            suffix = ter_op(isdefined(args[1]), args[1], "<unknown string>");
            function_f92878651d302fe9(duration, suffix);
            break;
        case #"hash_54601a5ea45e2833":
            showsplash(args[0], args[1]);
            break;
        case #"hash_b9253a7e780b5cc4":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                break;
            }
            player = firstplayer;
            if (args.size == 2) {
                player = function_b32113236442c6ab(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
            }
            if (args[0] == "<unknown string>") {
                player namespace_aad14af462a74d08::function_ca0ab723ebcf6d79();
            } else if (args[0] == "<unknown string>") {
                player namespace_aad14af462a74d08::function_8935e658d461fc50();
            } else if (args[0] == "<unknown string>") {
                var_f73de96940fdbd55 = player namespace_aad14af462a74d08::function_3d871e989c0bdb6d();
                println("<unknown string>" + player.name + "<unknown string>" + var_f73de96940fdbd55);
            }
            break;
        case #"hash_bd306f1bddba5304":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                break;
            }
            player = firstplayer;
            if (args.size == 2) {
                player = function_b32113236442c6ab(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
            }
            if (!function_1fb1cb439aa1e23c(args[0])) {
                iprintlnbold("<unknown string>");
                break;
            }
            var_b17717476a1e148d = int(args[0]);
            if (var_b17717476a1e148d < 0) {
                iprintlnbold("<unknown string>");
                break;
            }
            if (var_b17717476a1e148d > namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_4a7f024e87253788", #"hash_c34c2acd5ddc3949")) {
                iprintlnbold("<unknown string>");
            }
            player namespace_aad14af462a74d08::function_b7793133df5fb0df(var_b17717476a1e148d);
            break;
        case #"hash_26072a9c395b034d":
            if (!isdefined(level.arrow)) {
                return;
            }
            level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb = 1;
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            tablet = namespace_6c622b52017c6808::function_3ff56f0ba058501a(host.origin, (0, 0, 0));
            level.arrow.props.var_e0d1e3a2b6f5323a[level.arrow.props.var_e0d1e3a2b6f5323a.size] = tablet;
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                level thread [[ getsharedfunc("<unknown string>", "<unknown string>") ]](tablet);
            }
            namespace_6c622b52017c6808::function_cd4ce58be10fb51d();
            break;
        case #"hash_f5a6eea7650767e2":
            if (args.size < 1) {
                iprintlnbold("<unknown string>");
                break;
            }
            var_bfbe9638e9832d90 = args[0];
            if (isdefined(args[1])) {
                size = int(args[1]);
            } else {
                size = 6000;
            }
            var_1592c280e0665445 = spawnstruct();
            var_1592c280e0665445 namespace_36f464722d326bbe::function_6b6b6273f8180522(var_bfbe9638e9832d90, level.players[0].origin, size);
            var_1592c280e0665445 namespace_36f464722d326bbe::function_6988310081de7b45();
            break;
        case #"hash_b2e3447c4867d691":
            if (isdefined(level.var_ed20ae31a47f989f) && isdefined(level.var_ed20ae31a47f989f.var_a0345a183786f074)) {
                [[ level.var_ed20ae31a47f989f.var_a0345a183786f074 ]]();
            } else {
                iprintlnbold("<unknown string>");
            }
            break;
        case #"hash_99831dfe2bc2e9a5":
            amount = 10;
            if (args.size > 0) {
                amount = int(args[0]);
            }
            function_548e30d6072b85e9(firstplayer, amount);
            break;
        case #"hash_6631f1880c4f8339":
            namespace_a5b4009d7c2e0b3d::function_84cb89cc5c3af95a();
            break;
        case #"hash_aa98a879ea5c1a8b":
            function_510cb3df7efc44a7(firstplayer);
            break;
        case #"hash_ac6e596ee6823fff":
            firstplayer namespace_d20f8ef223912e12::givestandardtableloadout(0, 1);
            break;
        case #"hash_1872556a49857987":
            if (isdefined(firstplayer.classstruct) && isdefined(firstplayer.classstruct.var_91e10e152b08ec1d) && !firstplayer hasweapon(firstplayer.classstruct.var_91e10e152b08ec1d)) {
                firstplayer namespace_d19129e4fa5d176::function_4ffce833ce15363c(firstplayer.classstruct);
            }
            break;
        case #"hash_34260c14fedd5a2e":
            if (args.size < 2) {
                iprintlnbold("<unknown string>");
                break;
            }
            player = firstplayer;
            if (args.size == 3) {
                player = function_b32113236442c6ab(args[2]);
                if (!isdefined(player)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
            }
            if (args[0] == "<unknown string>") {
                player namespace_cb965d2f71fefddc::function_7cb3c8630787467e(args[1]);
            }
            if (args[0] == "<unknown string>") {
                player namespace_cb965d2f71fefddc::function_b53322f9aca1b83b(args[1]);
            }
            break;
        case #"hash_87532133ab44aca2":
            lootid = undefined;
            var_e9cfd120b0b43ef = ter_op(args.size > 1 && isdefined(args[1]), args[1], "<unknown string>");
            if (!isdefined(args) || !isdefined(args[0]) || args[0] == "<unknown string>") {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>" + var_e9cfd120b0b43ef);
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>" + var_e9cfd120b0b43ef + "<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>" + var_e9cfd120b0b43ef + "<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>" + var_e9cfd120b0b43ef + "<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>");
            }
            if (!isdefined(lootid)) {
                break;
            }
            foreach (player in level.players) {
                if (!isbot(player)) {
                    continue;
                }
                player.avoidkillstreakonspawntimer = undefined;
                player function_d8cd9c1941a88194(lootid, 1);
                player namespace_f8d3520d3483c1::setarmorhealth(player.var_8790c077c95db752);
            }
            break;
        case #"hash_ad34b62d6259eff9":
            lootid = undefined;
            if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>");
            } else if (issubstr(args[0], "<unknown string>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<unknown string>");
            }
            if (!isdefined(lootid)) {
                break;
            }
            foreach (player in level.players) {
                if (!isbot(player)) {
                    continue;
                }
                player function_d8cd9c1941a88194(lootid, 1);
            }
            break;
        case #"hash_a500569760927bb6":
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                player namespace_e5ed2f5a5ee8410e::handleteamchange("<unknown string>", 3);
                break;
            }
            break;
        case #"hash_f43300f0e110f9f7":
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (isdefined(level.var_4358d3a0ee13b0f9)) {
                    [[ level.var_4358d3a0ee13b0f9 ]](player, player.origin);
                }
                break;
            }
            break;
        case #"hash_d729000c152b2477":
            if (isdefined(level.var_ed2dca1658da90b2) && isdefined(level.var_ed2dca1658da90b2.drones)) {
                level.var_ed2dca1658da90b2.drones = array_removeundefined(level.var_ed2dca1658da90b2.drones);
                foreach (var_fe9c88140bfaeef5 in level.var_ed2dca1658da90b2.drones) {
                    if (isdefined(level.var_ae0244c4c517ba75)) {
                        var_fe9c88140bfaeef5 thread [[ level.var_ae0244c4c517ba75 ]](level.players[0]);
                    }
                }
            }
            break;
        case #"hash_b60a10a83e46ca28":
            function_5263a8371400329b();
            break;
        case #"hash_e3a60bc0c0aa07ff":
            part = args[0];
            state = args[1];
            ent = function_274ba9ea825a3b5f(level.player);
            if (isdefined(ent)) {
                result = ent namespace_448ccf1ca136fbbe::function_3677f2be30fdd581(part, state);
                if (result) {
                    color = (0, 1, 0);
                    text = "<unknown string>";
                } else {
                    color = (1, 0, 0);
                    text = "<unknown string>";
                }
                iprintlnbold(text);
                drawentitybounds(ent, color, 1, 20);
            } else {
                iprintlnbold("<unknown string>");
            }
            break;
        case #"hash_bf920f1431fc58e7":
            level.players[0] nightvisionviewon();
            break;
        case #"hash_8f2d4dcab02be48b":
            level.players[0] nightvisionviewoff();
            break;
        case #"hash_77cdec786733416b":
            if (!isdefined(level.var_ec572828f01f1c6d)) {
                break;
            }
            blacksite = undefined;
            if (isdefined(firstplayer.var_d62b8c292b19cf68) && firstplayer.var_d62b8c292b19cf68.size > 0) {
                blacksite = firstplayer.blacksite[0];
            } else if (isdefined(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68)) {
                var_e880c9b9e22eb6c1 = randomint(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size);
                blacksite = level.var_f1073fbd45b59a06.var_d62b8c292b19cf68[var_e880c9b9e22eb6c1];
            }
            firstplayer [[ level.var_ec572828f01f1c6d ]](blacksite);
            break;
        case #"hash_5bfe76ac355e2867":
            if (!isdefined(level.var_91044985cdb24c8b)) {
                break;
            }
            blacksite = undefined;
            if (isdefined(firstplayer.var_d62b8c292b19cf68) && firstplayer.var_d62b8c292b19cf68.size > 0) {
                blacksite = firstplayer.blacksite[0];
            } else if (isdefined(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68)) {
                var_e880c9b9e22eb6c1 = randomint(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size);
                blacksite = level.var_f1073fbd45b59a06.var_d62b8c292b19cf68[var_e880c9b9e22eb6c1];
            }
            firstplayer [[ level.var_91044985cdb24c8b ]](blacksite);
            break;
        case #"hash_70f3163baf120876":
            var_477bd548940c3a78 = args[0];
            var_5c9ddcf56d36f133 = undefined;
            if (args.size > 1) {
                var_5c9ddcf56d36f133 = int(args[1]);
            }
            if (!isdefined(var_5c9ddcf56d36f133)) {
                var_5c9ddcf56d36f133 = 1;
            }
            firstplayer preloadcinematicforplayer(var_477bd548940c3a78);
            firstplayer playcinematicforplayer(var_477bd548940c3a78);
            firstplayer setclientomnvar("<unknown string>", var_5c9ddcf56d36f133);
            wait(5);
            firstplayer setclientomnvar("<unknown string>", 0);
            firstplayer stopcinematicforplayer();
            break;
        case #"hash_8673ffe7cf06c3b1":
            player = firstplayer;
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), player.team);
            blacksite = level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d[0];
            blacksite notify("<unknown string>");
            waitframe();
            boss = blacksite.var_837c4b569aa8a376[0];
            var_896452c986f0513b = function_7eb04ca16d045775("<unknown string>");
            var_6a26c26c2fce3a4e = var_896452c986f0513b[0];
            namespace_86b52005c685dfb9::killagent(var_6a26c26c2fce3a4e);
            wait(1);
            aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("<unknown string>")[0];
            namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, boss.origin, (0, 0, 0), boss.team);
            break;
        case #"hash_259e6db48da06ba7":
            if (args.size > 1) {
                attacker = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[0]);
                victim = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[1]);
                if (isdefined(attacker) && isdefined(victim) && isdefined(level.var_d1df695cab85185c)) {
                    victim thread [[ level.var_d1df695cab85185c ]](attacker);
                    attacker function_758ee105bdf0c62d();
                }
            }
            break;
        case #"hash_78bd6494a4d6e599":
            if (args.size > 0) {
                perk = args[0];
                player = level.players[0];
                if (args.size > 1) {
                    player = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[1]);
                }
                if (isdefined(player) && isdefined(perk)) {
                    player giveperk(perk);
                }
            }
            break;
        case #"hash_3ed5eb31dd5ed16c":
            if (args.size > 0) {
                var_84a5decdc6b5a4c0 = args[0];
                weaponobj = function_fb77bd36161c7d9b(var_84a5decdc6b5a4c0);
                player = level.players[0];
                if (args.size > 1) {
                    player = function_b32113236442c6ab(args[1]);
                }
                if (isdefined(weaponobj)) {
                    maxammo = weaponmaxammo(weaponobj);
                    dropstruct = function_7b9f3966a7a42003();
                    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    namespace_cb965d2f71fefddc::spawnpickup(var_84a5decdc6b5a4c0, var_cb4fad49263e20c4, maxammo, 1, weaponobj, 0, 0);
                }
            }
            break;
        case #"hash_cf9a6afff924db7d":
            reviver = undefined;
            revivee = undefined;
            var_b1ba82194643d11d = 1;
            itemdata = ["<unknown string>":["<unknown string>":[], "<unknown string>":[]], "<unknown string>":["<unknown string>":[], "<unknown string>":[]]];
            if (args.size > 0) {
                foreach (arg in args) {
                    var_a6bf85cbfade3e88 = tolower(arg);
                    multival = strtok(var_a6bf85cbfade3e88, "<unknown string>");
                    switch (multival.size) {
                    case 2:
                        player = namespace_e4c20df2c9115a56::function_b32113236442c6ab(multival[1]);
                        if (isdefined(player)) {
                            switch (multival[0]) {
                            case #"hash_94a335b456789386":
                                reviver = player;
                                break;
                            case #"hash_94a348b45678b16f":
                                revivee = player;
                                break;
                            }
                        }
                        break;
                    case 1:
                        var_f56523e4e60d3b68 = issubstr(var_a6bf85cbfade3e88, "<unknown string>");
                        var_f5651ae4e60d279d = issubstr(var_a6bf85cbfade3e88, "<unknown string>");
                        var_7a37a35903d77329 = getsubstr(var_a6bf85cbfade3e88, 0, 2) == "<unknown string>";
                        var_47b75bbc48a0809a = issubstr(var_a6bf85cbfade3e88, "<unknown string>");
                        var_e74398cf5ec73470 = issubstr(var_a6bf85cbfade3e88, "<unknown string>");
                        var_b7739b4d7e762d6b = undefined;
                        if (istrue(var_f56523e4e60d3b68)) {
                            var_b7739b4d7e762d6b = "<unknown string>";
                        } else if (istrue(var_f5651ae4e60d279d)) {
                            var_b7739b4d7e762d6b = "<unknown string>";
                        }
                        if (isdefined(var_b7739b4d7e762d6b)) {
                            var_fa18b14ee43c464b = undefined;
                            var_2f7ebdb72844939 = undefined;
                            if (istrue(var_7a37a35903d77329)) {
                                var_fa18b14ee43c464b = "<unknown string>";
                            } else {
                                var_fa18b14ee43c464b = "<unknown string>";
                            }
                            if (istrue(var_47b75bbc48a0809a)) {
                                var_2f7ebdb72844939 = "<unknown string>";
                            } else if (istrue(var_e74398cf5ec73470)) {
                                var_2f7ebdb72844939 = "<unknown string>";
                            }
                            if (isdefined(var_2f7ebdb72844939)) {
                                var_2473e092f49eb0d6 = itemdata[var_b7739b4d7e762d6b][var_fa18b14ee43c464b].size;
                                var_80d10756b23df0bf = 1;
                                itemdata[var_b7739b4d7e762d6b][var_fa18b14ee43c464b][var_2473e092f49eb0d6] = var_2f7ebdb72844939;
                            }
                        }
                        if (!istrue(var_80d10756b23df0bf)) {
                            switch (var_a6bf85cbfade3e88) {
                            case #"hash_285e1562bf1a1d13":
                                var_e1407db69ba9775f = 1;
                                break;
                            default:
                                player = namespace_e4c20df2c9115a56::function_b32113236442c6ab(var_a6bf85cbfade3e88);
                                if (isdefined(player)) {
                                    if (!isdefined(reviver)) {
                                        reviver = player;
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    default:
                        break;
                    }
                }
            }
            if (!isdefined(reviver)) {
                reviver = level.players[0];
            }
            attacker = undefined;
            foreach (player in level.players) {
                if (!isdefined(attacker) && player.team != reviver.team && isreallyalive(player) && !isinlaststand(player)) {
                    attacker = player;
                }
                if (!isdefined(revivee) && player != reviver && (!istrue(var_b1ba82194643d11d) || isbot(player)) && player.team == reviver.team && isreallyalive(player) && !isinlaststand(player)) {
                    revivee = player;
                }
                if (isdefined(revivee) && isdefined(attacker)) {
                    break;
                }
            }
            if (!isdefined(revivee)) {
                return;
            }
            itemdata["<unknown string>"]["<unknown string>"] = revivee;
            itemdata["<unknown string>"]["<unknown string>"] = reviver;
            if (istrue(var_e1407db69ba9775f) && !revivee namespace_a548bd428a566cf3::hasselfrevivetoken()) {
                revivee function_aaaa1b3dfe18885c(1, 8548);
            }
            foreach (var_1108a44dc10e24a7 in itemdata) {
                foreach (item in [0:"<unknown string>", 1:"<unknown string>"]) {
                    player = var_1108a44dc10e24a7["<unknown string>"];
                    var_318865938276a951 = issubstr(item, "<unknown string>");
                    var_4aa12e0ed3f6b745 = issubstr(item, "<unknown string>");
                    if (array_contains(var_1108a44dc10e24a7["<unknown string>"], item)) {
                        if (var_318865938276a951) {
                            if (!player _hasperk(item)) {
                                player giveperk(item);
                            }
                        } else if (var_4aa12e0ed3f6b745) {
                            player function_9a34cb51ac957c0(item);
                        }
                    }
                    if (array_contains(var_1108a44dc10e24a7["<unknown string>"], item)) {
                        if (var_318865938276a951) {
                            if (player _hasperk(item)) {
                                player removeperk(item);
                            }
                        } else if (var_4aa12e0ed3f6b745) {
                            if (isdefined(player.var_4045f099f3da4bd) && player.var_4045f099f3da4bd == item) {
                                player function_f5e211bdcc0d8f79();
                            }
                        }
                    }
                }
            }
            lookpos = function_a104c06453297036(reviver);
            revivee setorigin(lookpos);
            if (isreallyalive(revivee)) {
                if (!isinlaststand(revivee)) {
                    revivee dodamage(99999, attacker.origin, attacker, attacker, "<unknown string>");
                } else if (isdefined(revivee.var_65a2b57b2b474c00)) {
                    revivee.var_65a2b57b2b474c00.curprogress = 0;
                }
            }
            if (isbot(revivee) && istrue(var_e1407db69ba9775f)) {
                level.var_78184ec36f669844 = 1;
                revivee.var_f932828585d0926c = 1;
            }
            thread function_1eaac96384e4a9d7(revivee);
            break;
        case #"hash_f8135c74ca6027b2":
            revivee = level.players[0];
            if (args.size > 0) {
                foreach (arg in args) {
                    var_a6bf85cbfade3e88 = tolower(arg);
                    if (var_a6bf85cbfade3e88 == "<unknown string>") {
                        var_757d32718dcfc4e6 = 1;
                    } else if (var_a6bf85cbfade3e88 == "<unknown string>") {
                        var_9bf3bd9792819eec = 1;
                    } else {
                        player = namespace_e4c20df2c9115a56::function_b32113236442c6ab(var_a6bf85cbfade3e88);
                        if (isdefined(player)) {
                            revivee = player;
                        }
                    }
                }
            }
            if (!isdefined(revivee)) {
                return;
            }
            attacker = undefined;
            foreach (player in level.players) {
                if (!isdefined(attacker) && player.team != revivee.team && isreallyalive(player) && !isinlaststand(player)) {
                    attacker = player;
                    break;
                }
            }
            if (!revivee namespace_a548bd428a566cf3::hasselfrevivetoken()) {
                revivee function_aaaa1b3dfe18885c(1, 8548);
            }
            if (istrue(var_757d32718dcfc4e6) && !revivee _hasperk("<unknown string>")) {
                revivee giveperk("<unknown string>");
            }
            if (istrue(var_9bf3bd9792819eec)) {
                revivee function_9a34cb51ac957c0("<unknown string>");
            }
            if (isdefined(attacker)) {
                damagepos = attacker.origin;
            } else {
                damagepos = revivee.origin;
            }
            if (isreallyalive(revivee) && !isinlaststand(revivee)) {
                revivee dodamage(99999, damagepos, attacker, attacker, "<unknown string>");
            } else if (isdefined(revivee.var_65a2b57b2b474c00)) {
                revivee.var_65a2b57b2b474c00.curprogress = 0;
            }
            thread function_1eaac96384e4a9d7(revivee);
            break;
        case #"hash_ad336c5f44b99d2e":
            player = level.players[0];
            if (args.size > 0) {
                var_791add3793fa5a62 = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[0]);
                if (isdefined(var_791add3793fa5a62)) {
                    player = var_791add3793fa5a62;
                }
            }
            player namespace_708f627020de59d3::function_19868614946c4df4();
            player function_e98a5a4e0e001ac3(player);
            var_96e16459d5114277 = namespace_d19129e4fa5d176::function_87c3b562f2b366ee(player);
            if (isdefined(player.perks)) {
                foreach (perk, count in player.perks) {
                    if (isdefined(player.loadoutperks) && array_contains(player.loadoutperks, perk)) {
                        player.loadoutperks = array_remove(player.loadoutperks, perk);
                    }
                    if (!array_contains(var_96e16459d5114277, perk)) {
                        player namespace_b6a8027f477010e1::_unsetperk(perk);
                    }
                }
                player function_df87366a6b9bc3a0(player.loadoutperks);
            }
            break;
        case #"hash_1f46336a51f2920c":
            thread function_d3b9dc1b6f956ff8();
            break;
        case #"hash_cb39bf247f39251f":
            if (args.size > 0) {
                victim = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[0]);
                attacker = undefined;
                if (args.size > 1) {
                    attacker = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[0]);
                } else {
                    foreach (player in level.players) {
                        if (player.team != victim.team && isreallyalive(player)) {
                            attacker = player;
                            break;
                        }
                    }
                }
                if (isdefined(attacker) && isdefined(victim)) {
                    var_629cef8d43ca621b = namespace_708f627020de59d3::function_fb59c1d91c97a058(attacker);
                    if (!isdefined(var_629cef8d43ca621b) || function_43044da0ed44d79f(var_629cef8d43ca621b)) {
                        var_a746cf0b1aac05a1 = function_5162a2aaad39b2c7(level.var_952400f520b7f68d, randomint(level.var_952400f520b7f68d.size));
                        var_a0ce8000d303764c = level.br_pickups.var_838863c4848d4c26[var_a746cf0b1aac05a1];
                        fakeent = spawnstruct();
                        fakeent.scriptablename = var_a0ce8000d303764c;
                        attacker namespace_708f627020de59d3::function_c3023358dc648bf1(fakeent, 0, 0, undefined, 0);
                    }
                    if (victim _hasperk("<unknown string>")) {
                        victim removeperk("<unknown string>");
                    }
                    player.var_15da77dc195bd80a = 0;
                    victim.var_add7dba6d7dab7d9 = 1;
                    victim dodamage(999999, attacker.origin, attacker, attacker, "<unknown string>");
                    victim.var_add7dba6d7dab7d9 = undefined;
                }
            }
            break;
        case #"hash_8ffd6bd28ea1c5bc":
            if (args.size > 0) {
                var_1189bd7fbe2861f8 = args[0];
                var_c00e3162499a2e59 = function_94c116c69c037a47(var_1189bd7fbe2861f8, [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"]);
                scriptbundle = var_c00e3162499a2e59[1];
                type = var_c00e3162499a2e59[0];
                if (!isdefined(type) || !isdefined(scriptbundle)) {
                    return;
                }
                switch (type) {
                case #"hash_93c71e7b6c0b81d7":
                    equipmentref = scriptbundle.ref;
                    var_85a1e8b6a105e2bb = scriptbundle;
                    var_dc10fffeca656a2 = scriptbundle.useweapon;
                    var_46ac7f4d7d7d2705 = getscriptbundle("<unknown string>", var_dc10fffeca656a2);
                    break;
                case #"hash_e534fd8ec73eafb4":
                    var_dc10fffeca656a2 = scriptbundle.offhandweapon;
                    var_46ac7f4d7d7d2705 = getscriptbundle("<unknown string>", var_dc10fffeca656a2);
                    var_ebec497ff8b18a45 = var_1189bd7fbe2861f8;
                    var_19c643069b108770 = scriptbundle;
                    break;
                case #"hash_a30c9a25c758a239":
                    var_dc10fffeca656a2 = var_1189bd7fbe2861f8;
                    var_46ac7f4d7d7d2705 = scriptbundle;
                    break;
                case #"hash_9c153fb2a039b16f":
                    equipmentref = scriptbundle.baseweapon;
                    var_4234fcea48190d36 = ter_op(array_contains_key(level.equipment.table, equipmentref), level.equipment.table[equipmentref], undefined);
                    if (!isdefined(var_4234fcea48190d36)) {
                        return;
                    }
                    var_72c1dea3127525bf = var_4234fcea48190d36.bundle;
                    var_dc10fffeca656a2 = var_4234fcea48190d36.weaponname;
                    var_46ac7f4d7d7d2705 = getscriptbundle("<unknown string>", var_dc10fffeca656a2);
                    break;
                default:
                    return;
                }
                if (!isdefined(equipmentref)) {
                    foreach (equip, item in level.equipment.table) {
                        if (item.weaponname == var_dc10fffeca656a2) {
                            equipmentref = equip;
                            var_85a1e8b6a105e2bb = item.bundle;
                            break;
                        }
                    }
                }
                if (!isdefined(equipmentref)) {
                    return;
                }
                if (isdefined(var_85a1e8b6a105e2bb)) {
                    switch (var_85a1e8b6a105e2bb.var_11d2f075e9a0e643) {
                    case #"hash_b5ec22be8111413a":
                    case #"hash_e534fd8ec73eafb4":
                        if (!isdefined(var_ebec497ff8b18a45)) {
                            var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getsuperrefforsuperuseweapon(var_dc10fffeca656a2);
                            var_19c643069b108770 = getscriptbundle(function_2ef675c13ca1c4af("<unknown string>", var_ebec497ff8b18a45));
                        }
                        break;
                    }
                }
                victim = level.players[0];
                if (args.size > 1) {
                    var_791add3793fa5a62 = namespace_e4c20df2c9115a56::function_b32113236442c6ab(args[1]);
                    if (isdefined(var_791add3793fa5a62)) {
                        victim = var_791add3793fa5a62;
                    }
                }
                attacker = function_5da181c6905a7a49(victim);
                spawnpos = function_a104c06453297036(victim);
                if (!isdefined(attacker)) {
                    return;
                }
                if (isdefined(var_ebec497ff8b18a45)) {
                    var_5d7589bf09bdf4d8 = getscriptbundle(level.var_7c7b046a6b9536fc);
                    foreach (item in var_5d7589bf09bdf4d8.var_63b618614d288401) {
                        if (isdefined(item.bundle) && item.bundle == var_ebec497ff8b18a45) {
                            var_6d6900affc4ca6f = item.ref;
                            break;
                        }
                    }
                    if (isdefined(var_6d6900affc4ca6f)) {
                        attacker givesuper(var_6d6900affc4ca6f);
                        attacker setorigin(spawnpos);
                        waitframe();
                        attacker namespace_727d2aa1d6c72038::perkpackage_forceusesuper();
                    }
                } else {
                    grenade = attacker _launchgrenade(var_dc10fffeca656a2, spawnpos + (0, 0, 5), (0, 0, 0), undefined, 0);
                    attacker namespace_3bbb5a98b932c46f::grenadeused(grenade);
                }
            }
            break;
        case #"hash_a9ac0a5962cdb952":
            isfriendly = 1;
            if (args.size > 0) {
                isfriendly = int(args[0]);
            }
            var_78836748d345cd08 = undefined;
            if (isfriendly) {
                teammates = namespace_54d20dd0dd79277f::getteamdata(firstplayer.team, "<unknown string>");
                if (teammates.size > 1) {
                    foreach (teammate in teammates) {
                        if (teammate != firstplayer) {
                            var_78836748d345cd08 = teammate;
                            break;
                        }
                    }
                }
            } else {
                foreach (teamname, teamdata in level.teamdata) {
                    if (teamname == firstplayer.team) {
                        continue;
                    }
                    teammembers = namespace_54d20dd0dd79277f::getteamdata(teamname, "<unknown string>");
                    if (teammembers.size > 0) {
                        var_78836748d345cd08 = teammembers[0];
                        break;
                    }
                }
            }
            if (isdefined(var_78836748d345cd08)) {
                streakinfo = spawnstruct();
                streakinfo.streakname = "<unknown string>";
                streakinfo.debug_state = "<unknown string>";
                streakinfo.shots_fired = 0;
                location = firstplayer.origin;
                animname = level.scr_anim[streakinfo.streakname]["<unknown string>"];
                var_4c4796c182975686 = getanimlength(animname);
                var_7225662d8217d65a = get_notetrack_time(animname, "<unknown string>");
                var_b333ee8fea365230 = var_4c4796c182975686 - 5;
                airstrikeid = namespace_203b58a09d020a50::airstrike_addactivestrike(location, var_78836748d345cd08, var_b333ee8fea365230);
                var_78836748d345cd08 thread airstrike_watchkills(streakinfo, var_7225662d8217d65a * 2, airstrikeid);
                var_78836748d345cd08 thread watchairstrikeowner(airstrikeid);
                var_78836748d345cd08 thread airstrike_watchgameend(streakinfo, airstrikeid);
                var_78836748d345cd08 finishairstrikeusage(location, undefined, undefined, streakinfo, animname, airstrikeid);
                level thread function_7893c28cfbf65865(var_78836748d345cd08, airstrikeid, var_b333ee8fea365230);
                namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_4c4796c182975686);
                level namespace_7f0bcee5d45a1dea::callback("<unknown string>", {streakinfo:streakinfo});
            }
            break;
        case #"hash_19160383ea61c1b5":
            var_742e3b452c9bb9b0 = 0;
            if (args.size > 0) {
                var_742e3b452c9bb9b0 = int(args[0]);
            }
            level thread function_533bda33b99fab22(firstplayer, var_742e3b452c9bb9b0);
            break;
        default:
            break;
        }
    LOC_00003d3d:
    #/
LOC_00003d3d:
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4253
// Size: 0x87
function givesuper(var_ebec497ff8b18a45) {
    /#
        if (!isdefined(var_ebec497ff8b18a45) || !array_contains_key(level.br_pickups.var_838863c4848d4c26, var_ebec497ff8b18a45)) {
            return;
        }
        var_a06806243448e2c7 = level.br_pickups.var_838863c4848d4c26[var_ebec497ff8b18a45];
        fakeent = spawnstruct();
        fakeent.scriptablename = var_a06806243448e2c7;
        fakeent.count = 1;
        namespace_cb965d2f71fefddc::takesuperpickup(fakeent);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42e1
// Size: 0x9f
function function_94c116c69c037a47(refname, var_34a9fc147b411574) {
    /#
        foreach (type in var_34a9fc147b411574) {
            var_52b51cc074f7e234 = type + "<unknown string>" + refname;
            bundle = getscriptbundle(var_52b51cc074f7e234);
            if (isdefined(bundle)) {
                return [0:type, 1:bundle];
            }
        }
        return [0:undefined, 1:undefined];
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4387
// Size: 0xd8
function function_5da181c6905a7a49(targetplayer, var_7a0f7391462c30d) {
    /#
        if (!isdefined(var_7a0f7391462c30d)) {
            var_7a0f7391462c30d = 0;
        }
        if (!isdefined(targetplayer)) {
            return;
        }
        if (isstring(targetplayer)) {
            targetplayer = namespace_e4c20df2c9115a56::function_b32113236442c6ab(targetplayer);
        }
        if (!isdefined(targetplayer) || !isplayer(targetplayer)) {
            return;
        }
        foreach (player in level.players) {
            if (player.team != targetplayer.team && isreallyalive(player) && !isinlaststand(player) && (isbot(player) || !istrue(var_7a0f7391462c30d))) {
                return player;
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4466
// Size: 0x265
function function_fb77bd36161c7d9b(scriptable, var_fa785c6c96c8bab) {
    /#
        if (!isdefined(var_fa785c6c96c8bab)) {
            var_fa785c6c96c8bab = "<unknown string>";
        }
        var_97f1b48fd49a7224 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_36fa976a8ae12763", var_fa785c6c96c8bab));
        if (isdefined(var_97f1b48fd49a7224) && isdefined(var_97f1b48fd49a7224.var_890049f984dd3e53)) {
            foreach (data in var_97f1b48fd49a7224.var_890049f984dd3e53) {
                var_a6961e95809442eb = data.var_fc4d515870dd3af3;
                if (isdefined(var_a6961e95809442eb)) {
                    var_d8cd9c1941a88194 = getscriptbundle(function_2ef675c13ca1c4af(%"loot_item_def:", var_a6961e95809442eb));
                    if (isdefined(var_d8cd9c1941a88194)) {
                        if (var_d8cd9c1941a88194.name == scriptable) {
                            lootid = var_d8cd9c1941a88194.lootid;
                            var_4bb9768282d4260d = function_1cc3fd00b6ccc3ba(lootid);
                            var_25152a36c536d7f = loot::function_793e8a72cedb8ef3(lootid);
                            var_e31692dcf0614ebc = var_d8cd9c1941a88194.attachmentlist;
                            attachmentlist = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6ab26ee9c0dc2c2f", var_e31692dcf0614ebc));
                            var_91bbf8d2294a656e = [];
                            if (isdefined(attachmentlist)) {
                                foreach (data in attachmentlist.var_4f1703e5bf8c7fed) {
                                    if (isdefined(data.attachmentid)) {
                                        var_91bbf8d2294a656e[data.attachment] = data.attachmentid;
                                    } else {
                                        var_91bbf8d2294a656e[data.attachment] = 0;
                                    }
                                }
                            }
                            var_92fce7b1696254e3 = var_4bb9768282d4260d;
                            camo = undefined;
                            if (isdefined(var_d8cd9c1941a88194.camo)) {
                                camo = var_d8cd9c1941a88194.camo;
                            }
                            fullweaponobj = undefined;
                            if (!isdefined(var_91bbf8d2294a656e)) {
                                fullweaponobj = namespace_e0ee43ef2dddadaa::buildweapon_attachmentidmap(var_4bb9768282d4260d, camo, undefined, undefined);
                            } else {
                                fullweaponobj = namespace_e0ee43ef2dddadaa::buildweapon_attachmentidmap(var_4bb9768282d4260d, var_91bbf8d2294a656e, camo, undefined, undefined);
                            }
                            return fullweaponobj;
                        }
                    }
                }
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46d2
// Size: 0x6b
function function_9a34cb51ac957c0(var_19cadf7d520f4072, var_bd5fd506df61590d) {
    /#
        function_e98a5a4e0e001ac3(self, var_19cadf7d520f4072);
        waittime = 0;
        maxwaittime = 1000;
        if (isdefined(var_bd5fd506df61590d)) {
            maxwaittime = var_bd5fd506df61590d;
        }
        while (self.var_4045f099f3da4bd != var_19cadf7d520f4072) {
            if (waittime >= maxwaittime) {
                return;
            }
            waitframe();
            waittime = waittime + level.frameduration;
        }
        return 1;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4744
// Size: 0x3b
function function_f5e211bdcc0d8f79() {
    /#
        var_2e1d1af8afe39ba8 = getdvarint(@"hash_fde1113ce9981d91", 3);
        var_347aa4935f42810 = namespace_d3d40f75bb4e4c32::function_c2f2bb9e0ae9a454(var_2e1d1af8afe39ba8);
        function_9a34cb51ac957c0(var_347aa4935f42810);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4786
// Size: 0x13f
function function_1eaac96384e4a9d7(revivee) {
    /#
        level endon("<unknown string>");
        revivee endon("<unknown string>");
        revivee notify("<unknown string>");
        revivee.var_8fc34ee7d773b639 = 0;
        revivee.var_4ab61a57453e2816 = 1;
        var_a698d2d8b999ee99 = revivee waittill_any_return_4("<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>");
        if ((var_a698d2d8b999ee99 == "<unknown string>" || var_a698d2d8b999ee99 == "<unknown string>") && isalive(revivee) && isdefined(revivee.var_8fc34ee7d773b639) && revivee.var_8fc34ee7d773b639 > 0) {
            var_f7d28c4d1c3c4108 = 3000;
            framecount = int(var_f7d28c4d1c3c4108 / level.frameduration + 0.5);
            var_80af7edebd9df6d8 = "<unknown string>" + revivee.var_8fc34ee7d773b639 + "<unknown string>";
            printtoscreen2d(800, 300, var_80af7edebd9df6d8, (1, 1, 1), 2, framecount);
        }
        if (var_a698d2d8b999ee99 != "<unknown string>") {
            revivee.var_4ab61a57453e2816 = undefined;
            revivee.var_8fc34ee7d773b639 = undefined;
            revivee.var_f932828585d0926c = undefined;
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48cc
// Size: 0x10f
function function_4d1c100badcf41a8(player, var_96f03b58138c074b) {
    /#
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        tracestart = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        traceend = tracestart + playerforward * 5000;
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
        trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, player, var_fbcabd62b8f66eb8);
        spawnorigin = tracestart + playerforward * 100;
        if (trace["<unknown string>"] < 1) {
            spawnorigin = trace["<unknown string>"];
        }
        spawnorigin = spawnorigin + (0, 0, 5);
        scriptable = spawnscriptable(var_96f03b58138c074b, spawnorigin, (0, 0, 0));
        namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        return scriptable;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49e2
// Size: 0x1d
function function_5d92949cc218ebdd(playername) {
    /#
        return strtok(playername, "<unknown string>")[0];
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a06
// Size: 0x87
function function_b2dcd958dd436171(name) {
    /#
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == name) {
                return player;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a94
// Size: 0x170
function function_5b5ab8ab53c49d4d(victimname, attackername) {
    /#
        attacker = undefined;
        victimname = tolower(victimname);
        victim = function_b2dcd958dd436171(victimname);
        if (isdefined(attackername)) {
            attackername = tolower(attackername);
            foreach (player in level.players) {
                shortname = function_5d92949cc218ebdd(player.name);
                if (tolower(shortname) == attackername) {
                    attacker = player;
                    break;
                }
            }
        } else {
            foreach (player in level.players) {
                if (victim.team != player.team) {
                    attacker = player;
                    break;
                }
            }
        }
        if (isdefined(victim)) {
            victim.var_add7dba6d7dab7d9 = 1;
            victim dodamage(999999, victim.origin, attacker, attacker, "<unknown string>");
            victim.var_add7dba6d7dab7d9 = undefined;
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4c0b
// Size: 0x1da
function function_53a0f5e4d6bbc7a4(victimname, attackername, damage) {
    /#
        victim = undefined;
        attacker = undefined;
        victimname = tolower(victimname);
        attackerweapon = undefined;
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == victimname) {
                victim = player;
                break;
            }
        }
        if (isdefined(attackername)) {
            attackername = tolower(attackername);
            foreach (player in level.players) {
                shortname = function_5d92949cc218ebdd(player.name);
                if (tolower(shortname) == attackername) {
                    attacker = player;
                    attackerweapon = attacker.primaryweapon;
                    break;
                }
            }
        } else {
            foreach (player in level.players) {
                if (victim.team != player.team) {
                    attacker = player;
                    break;
                }
            }
        }
        if (isdefined(victim)) {
            victim dodamage(float(damage), victim.origin, attacker, attacker);
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4dec
// Size: 0xc6
function function_72c1806e62a9bd10(playername, var_6be1bd68cd41dbbd) {
    /#
        playername = tolower(playername);
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == playername) {
                clientnum = player getentitynumber();
                if (istrue(var_6be1bd68cd41dbbd)) {
                    kick(clientnum, "<unknown string>", 1);
                } else {
                    kick(clientnum);
                }
                break;
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb9
// Size: 0x98
function function_5718089fc75809c3() {
    /#
        start = self geteye();
        dir = anglestoforward(self getplayerangles());
        end = start + 8000 * dir;
        trace = namespace_2a184fc4902783dc::_bullet_trace(start, end, 1, self);
        player = undefined;
        if (isdefined(trace["<unknown string>"]) && isplayer(trace["<unknown string>"]) && isreallyalive(trace["<unknown string>"])) {
            player = trace["<unknown string>"];
        }
        return player;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f58
// Size: 0xc5
function function_78ec4accff5f158b(player) {
    /#
        angles = player getplayerangles();
        fwd = anglestoforward(angles);
        eye = player geteye();
        end = eye + fwd * 10000;
        traces = namespace_2a184fc4902783dc::ray_trace_get_all_results(eye, end);
        foreach (trace in traces) {
            if (!isdefined(trace["<unknown string>"])) {
                return trace["<unknown string>"];
            }
        }
        return undefined;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5024
// Size: 0xc5
function function_274ba9ea825a3b5f(player) {
    /#
        angles = player getplayerangles();
        fwd = anglestoforward(angles);
        eye = player geteye();
        end = eye + fwd * 10000;
        traces = namespace_2a184fc4902783dc::ray_trace_get_all_results(eye, end);
        foreach (trace in traces) {
            if (isdefined(trace["<unknown string>"])) {
                return trace["<unknown string>"];
            }
        }
        return undefined;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50f0
// Size: 0x118
function function_c3b8a31470635593(winningteam) {
    /#
        setdvar(@"hash_31bfb430e958888c", 2);
        wait(2);
        foreach (team in level.teamswithplayers) {
            if (team != winningteam) {
                teamplayers = getteamdata(team, "<unknown string>");
                foreach (player in teamplayers) {
                    if (isalive(player)) {
                        player.var_add7dba6d7dab7d9 = 1;
                        player dodamage(999999, player.origin, player, player, "<unknown string>");
                        player.var_add7dba6d7dab7d9 = undefined;
                        wait(1);
                    }
                }
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x520f
// Size: 0x98
function function_429110eb5af4a19c() {
    /#
        foreach (team in level.teamnamelist) {
            teamcount = getteamdata(team, "<unknown string>");
            if (teamcount && !array_contains(level.teamswithplayers, team)) {
                level.teamswithplayers[level.teamswithplayers.size] = team;
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52ae
// Size: 0x16b
function function_9bb9422480e6aa6d() {
    /#
        level endon("<unknown string>");
        if (istrue(level.var_4887475a9fd2c26)) {
            return;
        }
        level.var_4887475a9fd2c26 = 1;
        var_bbefcb75fed18601 = function_1ce3276d3ef55a0a("<unknown string>", 0.8);
        var_bbefcb75fed18601 setpoint("<unknown string>", "<unknown string>", 200, 160);
        var_bbefcb75fed18601 setdevtext("<unknown string>");
        var_580827942b9d1324 = "<unknown string>";
        while (1) {
            wait(0.1);
            if (!isdefined(level.players) || !level.players.size) {
                continue;
            }
            var_53b8c11d8f14f732 = "<unknown string>";
            function_429110eb5af4a19c();
            foreach (teamname in level.teamswithplayers) {
                var_6428e68df37399d3 = "<unknown string>";
                if (isdefined(level.var_8f337a661bccb9f) && isdefined(level.var_8f337a661bccb9f[teamname])) {
                    var_6428e68df37399d3 = level.var_8f337a661bccb9f[teamname];
                }
                var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + teamname + "<unknown string>" + var_6428e68df37399d3 + "<unknown string>";
            }
            if (var_53b8c11d8f14f732 != var_580827942b9d1324) {
                var_bbefcb75fed18601 setdevtext(var_53b8c11d8f14f732);
                var_580827942b9d1324 = var_53b8c11d8f14f732;
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5420
// Size: 0x3ff
function function_2729e9ab8a4ec44e() {
    /#
        level endon("<unknown string>");
        if (istrue(level.var_5f61ffe168666863)) {
            return;
        }
        level.var_5f61ffe168666863 = 1;
        var_bbefcb75fed18601 = function_1ce3276d3ef55a0a("<unknown string>", 0.8);
        var_bbefcb75fed18601 setpoint("<unknown string>", "<unknown string>", 20, 160);
        var_bbefcb75fed18601 setdevtext("<unknown string>");
        var_580827942b9d1324 = "<unknown string>";
        while (1) {
            waitframe();
            if (!isdefined(level.players) || !level.players.size) {
                continue;
            }
            var_53b8c11d8f14f732 = "<unknown string>";
            function_429110eb5af4a19c();
            foreach (teamname in level.teamswithplayers) {
                var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + teamname + "<unknown string>";
                foreach (player in getteamarray(teamname)) {
                    entnum = player getentitynumber();
                    print3d(player.origin + (0, 0, 70), "<unknown string>" + entnum + "<unknown string>" + player.name, (1, 1, 1), 1, 0.4, 1);
                    print3d(player.origin + (0, 0, 65), teamname + "<unknown string>" + player.health + player.armorhealth, (1, 1, 1), 1, 0.3, 1);
                    isplayeralive = isalive(player) && !istrue(player.gulag);
                    var_2e74464713803f2f = get_int_or_0(player.gulaguses);
                    playername = ter_op(isdefined(player.name), player.name, "<unknown string>") + "<unknown string>" + var_2e74464713803f2f + "<unknown string>";
                    if (isplayeralive) {
                        var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + playername + "<unknown string>";
                    } else if (!istrue(level.br_prematchstarted)) {
                        var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + playername + "<unknown string>";
                    } else if (namespace_a9c534dc7832aba4::isvalidspectatetarget(player)) {
                        var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + playername + "<unknown string>";
                    } else if (istrue(player.br_iseliminated)) {
                        var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + playername + "<unknown string>";
                        var_138237e9db047d3d = ter_op(istrue(player.killcam), "<unknown string>", "<unknown string>");
                        var_13c5603d4beea2fc = player getspectatingplayer();
                        if (isdefined(var_13c5603d4beea2fc)) {
                            var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + var_138237e9db047d3d + var_13c5603d4beea2fc.name + "<unknown string>";
                        }
                        if (isdefined(level.var_8f337a661bccb9f) && isdefined(level.var_8f337a661bccb9f[player.team])) {
                            var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + level.var_8f337a661bccb9f[player.team] + "<unknown string>";
                        }
                    } else {
                        var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>" + playername + "<unknown string>";
                    }
                    var_53b8c11d8f14f732 = var_53b8c11d8f14f732 + "<unknown string>";
                }
            }
            if (var_53b8c11d8f14f732.size > 1000) {
                var_53b8c11d8f14f732 = getsubstr(var_53b8c11d8f14f732, 0, 1000);
            }
            if (var_53b8c11d8f14f732 != var_580827942b9d1324) {
                var_bbefcb75fed18601 setdevtext(var_53b8c11d8f14f732);
                var_580827942b9d1324 = var_53b8c11d8f14f732;
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5826
// Size: 0xe9
function function_1ce3276d3ef55a0a(font, fontscale) {
    /#
        hudelem = newhudelem();
        hudelem.elemtype = "<unknown string>";
        hudelem.font = font;
        hudelem.fontscale = fontscale;
        hudelem.basefontscale = fontscale;
        hudelem.x = 0;
        hudelem.y = 0;
        hudelem.width = 0;
        hudelem.height = int(level.fontheight * fontscale);
        hudelem.xoffset = 0;
        hudelem.yoffset = 0;
        hudelem.children = [];
        hudelem setparent(level.uiparent);
        hudelem.hidden = 0;
        return hudelem;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5916
// Size: 0x69
function function_69dffe7a5cb1b4b9() {
    /#
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player)) {
                return player;
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5986
// Size: 0x1c7
function function_7a26b30793922b87() {
    /#
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            iprintlnbold("<unknown string>");
            return;
        }
        if (!istrue(level.br_prematchstarted)) {
            level notify("<unknown string>");
            wait(3);
        }
        var_d3a4d4e30c0118d3 = [[ getsharedfunc("<unknown string>", "<unknown string>") ]](notbot.team, 1);
        if (var_d3a4d4e30c0118d3.size < 2) {
            if (level.maxteamsize < 2) {
                level.maxteamsize = 2;
            }
            setdvar(@"hash_9e5da81386e98d36", notbot.team);
            setdvar(@"hash_955d9d2c8102c6bc", 1);
            while (var_d3a4d4e30c0118d3.size < 2) {
                waitframe();
                var_d3a4d4e30c0118d3 = [[ getsharedfunc("<unknown string>", "<unknown string>") ]](notbot.team, 1);
            }
            var_a1763ab85640fc6b = 0;
            while (1) {
                if (var_a1763ab85640fc6b > 100) {
                    iprintlnbold("<unknown string>");
                    return;
                }
                var_6bd50561c8c42809 = 0;
                foreach (player in var_d3a4d4e30c0118d3) {
                    if (player == notbot) {
                        continue;
                    }
                    if (player.sessionstate != "<unknown string>") {
                        var_6bd50561c8c42809 = 1;
                        break;
                    }
                }
                if (var_6bd50561c8c42809) {
                    break;
                }
                var_a1763ab85640fc6b++;
                waitframe();
            }
        }
        waittillframeend();
        setdvar(@"hash_12d23346fbacee91", 2);
        setdvar(@"hash_6ce01b6572751b18", 1);
        notbot.gulagloser = 1;
        notbot namespace_d20f8ef223912e12::sendafksquadmembertogulag();
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b54
// Size: 0xc5
function function_9cbddfdef8f1125b(var_c0560ea98ea1fc50) {
    /#
        player = self;
        player playersetkeypadstateindex(1);
        player playersetkeypadcodelengthindex(8);
        while (1) {
            value = message = player waittill("<unknown string>");
            if (isdefined(message)) {
                if (message == "<unknown string>") {
                    if (verifybunkercode(var_c0560ea98ea1fc50, value)) {
                        player playersetkeypadstateindex(2);
                        wait(2);
                        iprintlnbold("<unknown string>");
                        break;
                    } else {
                        player playersetkeypadstateindex(3);
                        waitframe();
                        iprintlnbold("<unknown string>");
                        player playersetkeypadstateindex(1);
                    }
                } else if (message == "<unknown string>") {
                    break;
                }
            }
        }
        player playersetkeypadstateindex(0);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c20
// Size: 0x8f
function function_b32113236442c6ab(playername) {
    /#
        playername = tolower(playername);
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == playername) {
                return player;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cb6
// Size: 0x37
function function_bc261c1a1cb59524(player) {
    /#
        br_forcegivecustompickupitem(player, "<unknown string>", 1, level.br_pickups.maxcounts["<unknown string>"]);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cf4
// Size: 0x67
function function_fd61b9aa3a4c64bf(player) {
    /#
        foreach (ammotype, maxcount in level.br_ammo_max) {
            br_ammo_give_type(player, ammotype, maxcount, 0);
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d62
// Size: 0x2a
function function_28dc06904e18e469(player) {
    /#
        player namespace_c6ccccd95254983f::playerplunderpickup(level.br_plunder.plunderlimit);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d93
// Size: 0x17
function function_c41e8bac1d7f3bc8(player) {
    /#
        player addrespawntoken();
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5db1
// Size: 0x17
function function_5377fd507f9ea057(player) {
    /#
        player addselfrevivetoken();
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5dcf
// Size: 0x26
function function_559b4cb8f64848b5(player) {
    /#
        if (!isdefined(player.inlaststand)) {
            player removeselfrevivetoken();
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5dfc
// Size: 0x1e
function function_a2fdd1067da9ff6e(player) {
    /#
        br_forcegivecustompickupitem(player, "<unknown string>", 1);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e21
// Size: 0x2b
function function_26ab41fd72f1c761(player) {
    /#
        var_783b4185a19005c3 = namespace_3bcd40a3005712ec::br_getrandomlootweapon();
        br_forcegivecustompickupitem(player, var_783b4185a19005c3, 1);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e53
// Size: 0x76
function function_fe99ab4dc900865e() {
    /#
        var_62a9e105632784d0 = getentarray("<unknown string>", "<unknown string>");
        foreach (trigger in var_62a9e105632784d0) {
            trigger.targetname = "<unknown string>";
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ed0
// Size: 0xb6
function function_4c35185bbc6a8506() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        foreach (player in level.players) {
            if (isdefined(player) && !isalive(player) && !istrue(player.br_iseliminated) && !istrue(player.gulag)) {
                if (isdefined(host)) {
                    host iprintlnbold("<unknown string>" + player.name + "<unknown string>");
                }
            }
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f8d
// Size: 0xfb
function function_7c57dd42429eb995() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_5ec38dd7bdfbfe50", 0);
        while (1) {
            if (getdvarint(@"hash_5ec38dd7bdfbfe50", 0)) {
                var_eb78e248c90d841c = [];
                foreach (player in level.players) {
                    if (player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                        var_eb78e248c90d841c = array_add(var_eb78e248c90d841c, player);
                    }
                }
                foreach (player in var_eb78e248c90d841c) {
                    player namespace_d20f8ef223912e12::abandonbrsquadleader();
                }
                setdvar(@"hash_5ec38dd7bdfbfe50", 0);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x608f
// Size: 0xfd
function function_29e8c83db696b457() {
    /#
        player = function_69dffe7a5cb1b4b9();
        if (!isdefined(player)) {
            iprintlnbold("<unknown string>");
            return;
        }
        spawndata = spawnstruct();
        spawndata.origin = player.origin + (100, 0, 0);
        spawndata.angles = player.angles;
        spawndata.modelname = "<unknown string>";
        spawndata.vehicletype = "<unknown string>";
        spawndata.targetname = "<unknown string>";
        spawndata.cannotbesuspended = 1;
        var_ee8da5624236dc89 = spawnstruct();
        vehicle = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata, var_ee8da5624236dc89);
        player setusingremote("<unknown string>");
        vehicle setotherent(player);
        vehicle setentityowner(player);
        player controlslinkto(vehicle);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6193
// Size: 0x1e
function function_820b8302ada04c55() {
    /#
        player = function_69dffe7a5cb1b4b9();
        player function_968fe965d3e8c967();
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61b8
// Size: 0x5a1
function function_d671c39a7867f243(args) {
    /#
        var_a3f2c8b5048491c9 = 5000;
        var_177fceb85436c082 = 100;
        var_fe52faf102ebf57b = 1000;
        var_e0be8bb269d1b3ee = -2400;
        if (isdefined(level.br_level) && isdefined(level.br_level.var_540c681a924e2df2)) {
            var_e0be8bb269d1b3ee = level.br_level.var_540c681a924e2df2;
        }
        var_3b5ad6f63af5e57a = 10000;
        var_e25c6801a01f7fce = 5000;
        var_befd185e0007a7b8 = -18000 + var_e0be8bb269d1b3ee;
        var_e89346b6c5bfd043 = 15;
        resolution = 1000;
        precision = 5;
        var_1c8f7cdf53fa7b1f = 8000;
        if (args.size == 1 && int(args[0]) == 0) {
            if (istrue(level.var_90a078e35115c032)) {
                level notify("<unknown string>");
                level notify("<unknown string>");
                level.var_90a078e35115c032 = undefined;
                level.var_3308d09ba32f94af = [];
                level.var_3308d19ba32f96e2 = [];
                level.var_ca369ce88e799edd = [];
                level.var_ca3699e88e799844 = [];
                level.var_ca369ae88e799a77 = [];
                level.var_fce03ebb07aa6a47 = [];
                level.var_fce03fbb07aa6c7a = [];
                level.var_8fd311aaa85b95cf = [];
                level.var_8fd312aaa85b9802 = [];
                return;
            }
        } else if (args.size > 0 && int(args[0]) > 1) {
            resolution = int(args[0]);
            if (args.size > 1) {
                precision = int(max(1, int(args[1])));
            }
            if (args.size > 2) {
                var_1c8f7cdf53fa7b1f = int(max(1, int(args[1])));
            }
        }
        level endon("<unknown string>");
        level.var_90a078e35115c032 = 1;
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        origin = host.origin;
        level.var_3308d09ba32f94af = [];
        level.var_3308d19ba32f96e2 = [];
        level.var_ca369ce88e799edd = [];
        level.var_ca3699e88e799844 = [];
        level.var_ca369ae88e799a77 = [];
        level.var_fce03ebb07aa6a47 = [];
        level.var_fce03fbb07aa6c7a = [];
        level.var_8fd311aaa85b95cf = [];
        level.var_8fd312aaa85b9802 = [];
        thread function_f474574f5e52f583();
        contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
        org = namespace_2a184fc4902783dc::sphere_trace(origin + (0, 0, var_e25c6801a01f7fce), origin + (0, 0, var_befd185e0007a7b8), var_e89346b6c5bfd043, undefined, contents)["<unknown string>"];
        var_c473eeeb53ba4f3c = org[2] - var_fe52faf102ebf57b;
        count = 0;
        var_dce0e813cd7c733f = 0;
        total = pow(2 * resolution / precision, 2) * 1;
        x = -1 * resolution;
        while (x <= resolution) {
            host iprintlnbold("<unknown string>" + int(var_dce0e813cd7c733f / total * 100));
            y = -1 * resolution;
            while (y <= resolution) {
                var_dce0e813cd7c733f++;
                var_e4a58e54d20994f2 = (x + origin[0], y + origin[1], origin[2]);
                var_e1acc489eb122240 = droptogroundmultitrace(var_e4a58e54d20994f2);
                count++;
                if (count >= var_1c8f7cdf53fa7b1f) {
                    waitframe();
                    count = 0;
                }
                if (var_e1acc489eb122240[2] < var_e0be8bb269d1b3ee) {
                    if (level.var_3308d09ba32f94af.size > var_a3f2c8b5048491c9) {
                        break;
                    }
                    level.var_3308d09ba32f94af[level.var_3308d09ba32f94af.size] = var_e4a58e54d20994f2 + (0, 0, var_e25c6801a01f7fce);
                    level.var_3308d19ba32f96e2[level.var_3308d19ba32f96e2.size] = var_e1acc489eb122240;
                } else {
                    count++;
                    if (count >= var_1c8f7cdf53fa7b1f) {
                        waitframe();
                        count = 0;
                    }
                    var_e1acc589eb122473 = namespace_3c37cb17ade254d::drop_to_ground(var_e4a58e54d20994f2, var_e25c6801a01f7fce, var_befd185e0007a7b8, undefined, contents);
                    if (var_e1acc589eb122473[2] < var_e0be8bb269d1b3ee) {
                        if (level.var_ca369ce88e799edd.size > var_a3f2c8b5048491c9) {
                            break;
                        }
                        level.var_ca369ce88e799edd[level.var_ca369ce88e799edd.size] = var_e4a58e54d20994f2 + (0, 0, var_e25c6801a01f7fce);
                        level.var_ca3699e88e799844[level.var_ca3699e88e799844.size] = var_e1acc489eb122240;
                        level.var_ca369ae88e799a77[level.var_ca369ae88e799a77.size] = var_e1acc589eb122473;
                    } else if (var_e1acc589eb122473[2] < var_c473eeeb53ba4f3c && level.var_fce03ebb07aa6a47.size < var_177fceb85436c082) {
                        level.var_fce03ebb07aa6a47[level.var_fce03ebb07aa6a47.size] = var_e4a58e54d20994f2 + (0, 0, var_e25c6801a01f7fce);
                        level.var_fce03fbb07aa6c7a[level.var_fce03fbb07aa6c7a.size] = var_e1acc589eb122473;
                    } else if ((abs(x) == abs(resolution) || x + precision > resolution) && (abs(y) == abs(resolution) || y + precision > resolution)) {
                        level.var_8fd311aaa85b95cf[level.var_8fd311aaa85b95cf.size] = var_e4a58e54d20994f2 + (0, 0, var_e25c6801a01f7fce);
                        level.var_8fd312aaa85b9802[level.var_8fd312aaa85b9802.size] = var_e1acc489eb122240;
                    }
                }
                y = y + precision;
            }
            if (level.var_3308d09ba32f94af.size > var_a3f2c8b5048491c9 || level.var_ca369ce88e799edd.size > var_a3f2c8b5048491c9) {
                break;
            }
            x = x + precision;
        }
        host iprintlnbold("<unknown string>" + level.var_3308d09ba32f94af.size + "<unknown string>" + level.var_ca369ce88e799edd.size + "<unknown string>" + level.var_fce03ebb07aa6a47.size);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6760
// Size: 0x19e
function function_f474574f5e52f583() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            for (i = 0; i < level.var_3308d09ba32f94af.size; i++) {
                var_6c12a13f3372dc24 = level.var_3308d09ba32f94af[i];
                var_6c12a43f3372e2bd = level.var_3308d19ba32f96e2[i];
                line(var_6c12a13f3372dc24, var_6c12a43f3372e2bd, (1, 0, 0), 1, 1, 1);
            }
            for (i = 0; i < level.var_ca369ce88e799edd.size; i++) {
                var_6c12a13f3372dc24 = level.var_ca369ce88e799edd[i];
                var_6c12a43f3372e2bd = level.var_ca3699e88e799844[i];
                var_6c12a33f3372e08a = level.var_ca369ae88e799a77[i];
                line(var_6c12a13f3372dc24, var_6c12a43f3372e2bd, (1, 1, 0), 1, 1, 1);
                line(var_6c12a43f3372e2bd, var_6c12a33f3372e08a, (1, 0, 0), 1, 1, 1);
            }
            for (i = 0; i < level.var_fce03ebb07aa6a47.size; i++) {
                var_6c12a13f3372dc24 = level.var_fce03ebb07aa6a47[i];
                var_6c12a43f3372e2bd = level.var_fce03fbb07aa6c7a[i];
                line(var_6c12a13f3372dc24, var_6c12a43f3372e2bd, (1, 0, 1), 1, 1, 1);
            }
            for (i = 0; i < level.var_8fd311aaa85b95cf.size; i++) {
                var_6c12a13f3372dc24 = level.var_8fd311aaa85b95cf[i];
                var_6c12a43f3372e2bd = level.var_8fd312aaa85b9802[i];
                line(var_6c12a13f3372dc24, var_6c12a43f3372e2bd, (0, 1, 0), 1, 1, 1);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6905
// Size: 0x19e
function function_237b71faf9fb62d9(player, var_1bbeb265ef74bc60) {
    /#
        if (!isdefined(player)) {
            return;
        }
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        tracestart = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        traceend = tracestart + playerforward * 5000;
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(0);
        trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, player, var_fbcabd62b8f66eb8);
        if (isdefined(trace["<unknown string>"]) || isalive(trace["<unknown string>"])) {
            namespace_1eb3c4e0e28fac71::function_22671614e8f79513(trace["<unknown string>"], var_1bbeb265ef74bc60);
            return;
        }
        closestplayer = undefined;
        closestdist = 0;
        foreach (otherplayer in level.players) {
            if (otherplayer == player) {
                continue;
            }
            dist = distance2dsquared(otherplayer.origin, trace["<unknown string>"]);
            if (closestdist == 0 || dist < closestdist) {
                closestdist = dist;
                closestplayer = otherplayer;
            }
        }
        if (isdefined(closestplayer)) {
            namespace_1eb3c4e0e28fac71::function_22671614e8f79513(closestplayer, var_1bbeb265ef74bc60);
            return;
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6aaa
// Size: 0x170
function function_9503654ca3380f8a(args) {
    /#
        skin = undefined;
        if (args.size > 0) {
            skin = args[0];
        } else {
            skins = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>", 7:"<unknown string>"];
            skin = function_7a2aaa4a09a4d250(skins);
        }
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skin);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skin);
        if (body == "<unknown string>" || head == "<unknown string>") {
            return;
        }
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        start = host geteye();
        dir = anglestoforward(host getplayerangles());
        end = start + 8000 * dir;
        trace = namespace_2a184fc4902783dc::_bullet_trace(start, end, 1, host);
        if (trace["<unknown string>"] >= 1) {
            return;
        }
        neworigin = trace["<unknown string>"];
        newent = spawn("<unknown string>", neworigin);
        newent function_dd6d30b9ec87c1b3(body, head, "<unknown string>");
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c21
// Size: 0x24
function showsplash(splash, var_42b1e877ab187c6) {
    /#
        namespace_52f6938dd902c7d0::showsplashtoall(splash, undefined, undefined, undefined, undefined, var_42b1e877ab187c6);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c4c
// Size: 0x1c1
function function_548e30d6072b85e9(player, amount) {
    /#
        var_affbd0043656d928 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>", 7:"<unknown string>", 8:"<unknown string>", 9:"<unknown string>", 10:"<unknown string>", 11:"<unknown string>", 12:"<unknown string>", 13:"<unknown string>", 14:"<unknown string>"];
        var_74c0315f0da36a59 = arraycopy(var_affbd0043656d928);
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        for (i = 0; i < amount - 2; i++) {
            if (var_74c0315f0da36a59.size == 0) {
                var_74c0315f0da36a59 = array_combine(var_affbd0043656d928);
            }
            var_a1093166de09e6b8 = random(var_74c0315f0da36a59);
            var_74c0315f0da36a59 = array_remove(var_74c0315f0da36a59, var_a1093166de09e6b8);
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
            namespace_cb965d2f71fefddc::spawnpickup(var_a1093166de09e6b8, var_cb4fad49263e20c4);
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        namespace_cb965d2f71fefddc::spawnpickup("<unknown string>", var_cb4fad49263e20c4);
        weapon = player getcurrentprimaryweapon();
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        namespace_cb965d2f71fefddc::spawnpickup(weapon.basename, var_cb4fad49263e20c4, 1, undefined, weapon);
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e14
// Size: 0x238
function function_510cb3df7efc44a7(player) {
    /#
        teammate = undefined;
        closestdist = 0;
        foreach (otherplayer in level.players) {
            if (isbot(otherplayer) && otherplayer.team == player.team) {
                dist = distance2dsquared(otherplayer.origin, player.origin);
                if (closestdist == 0 || dist < closestdist) {
                    closestdist = dist;
                    teammate = otherplayer;
                }
            }
        }
        if (!isdefined(teammate)) {
            return;
        }
        var_394466c2ddb208cb = undefined;
        var_3955adf97a897629 = 0;
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        var_6e226a212b12f77f = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        var_b2e0a2db9493ce49 = 5000;
        var_1bd3970314fa9aea = var_6e226a212b12f77f + playerforward * var_b2e0a2db9493ce49;
        for (var_abc56346e63aa2e3 = 0; var_abc56346e63aa2e3 < 10; var_abc56346e63aa2e3++) {
            isowner = player namespace_ede58c1e66c2c280::function_1e008bf9d31b2b01(var_abc56346e63aa2e3);
            if (isowner && player calloutmarkerping_getactive(var_abc56346e63aa2e3)) {
                var_8512c523dca1fd8f = player calloutmarkerping_getorigin(var_abc56346e63aa2e3);
                var_c8fb4167ea618ba8 = pointonsegmentnearesttopoint(var_6e226a212b12f77f, var_1bd3970314fa9aea, var_8512c523dca1fd8f);
                var_3a8a224f346d546f = distance(var_8512c523dca1fd8f, var_c8fb4167ea618ba8);
                if (!isdefined(var_394466c2ddb208cb) || var_3a8a224f346d546f < var_3955adf97a897629) {
                    var_394466c2ddb208cb = var_abc56346e63aa2e3;
                    var_3955adf97a897629 = var_3a8a224f346d546f;
                }
            }
        }
        if (!isdefined(var_394466c2ddb208cb)) {
            return;
        }
        if (player function_9482e9c50b5fe82(teammate, var_394466c2ddb208cb)) {
            player function_69aa7fcdcfff4e0a(teammate, var_394466c2ddb208cb, 0);
        } else {
            player function_69aa7fcdcfff4e0a(teammate, var_394466c2ddb208cb, 1);
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7053
// Size: 0x38
function function_5263a8371400329b() {
    /#
        level endon("<unknown string>");
        namespace_27cdbf2464b21c84::function_ed4c2d913d203bf(level.players, "<unknown string>");
        waitframe();
        namespace_27cdbf2464b21c84::function_ed4c2d913d203bf(level.players, "<unknown string>");
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7092
// Size: 0x98
function function_bfe726b5e0b35c27() {
    /#
        start = self geteye();
        dir = anglestoforward(self getplayerangles());
        end = start + 8000 * dir;
        trace = namespace_2a184fc4902783dc::_bullet_trace(start, end, 1, self);
        player = undefined;
        if (isdefined(trace["<unknown string>"]) && isplayer(trace["<unknown string>"]) && isreallyalive(trace["<unknown string>"])) {
            player = trace["<unknown string>"];
        }
        return player;
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7131
// Size: 0x39
function function_d3b9dc1b6f956ff8() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        if (isdefined(host.var_5fb036c33cddd360)) {
            host namespace_d20f8ef223912e12::function_7fbb2e52f100474e();
        } else {
            host namespace_d20f8ef223912e12::function_10ffa1071b1c2681();
        }
    #/
}

// Namespace namespace_22a3b9eb980b7c41/namespace_e4c20df2c9115a56
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7171
// Size: 0x49
function function_533bda33b99fab22(victim, var_742e3b452c9bb9b0) {
    /#
        level endon("<unknown string>");
        victim namespace_f8d3520d3483c1::function_13caa305c839a278("<unknown string>", var_742e3b452c9bb9b0);
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        function_53a0f5e4d6bbc7a4(victim.name, undefined, 300);
    #/
}

