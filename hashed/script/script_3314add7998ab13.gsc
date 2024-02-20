// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_6c4e8cea70bf4b6d;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5def7af2a9f04234;
#using script_4948cdf739393d2d;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_3ff084f114b7f6c9;
#using script_3314add7998ab13;
#using script_45f403e1732217d3;
#using scripts\mp\teams.gsc;
#using script_419eebc6f24e287;
#using script_662cbac61c1ae7e2;
#using script_c00335a7aeb2728;
#using script_358978e883d9f6c2;
#using script_46b3c7d0a4338d8;
#using script_3665d737b10b78d9;
#using script_6b7618d5ead05b66;
#using script_7fba4131729fe74d;
#using script_2e2e13d44d465832;
#using script_58fe895fd0fbe620;
#using script_241ff3c86d02a28d;
#using script_495022338d50407e;
#using script_3e32e216ce730ac2;
#using script_a62705cb078ec0a;
#using script_6a9e2d3385424b39;
#using script_34f71bd59550adcb;
#using script_1193c0b83fce13b;
#using script_78fe9876bb090d6b;
#using script_318621981299585a;
#using script_ef36a50d9b4627d;
#using script_4f9a55dee6aebc8f;
#using script_1174abedbefe9ada;
#using script_15ca41a3fbb0e379;
#using script_744cad313ed0a87e;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\objidpoolmanager.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using script_57d3850a12cf1d8f;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;

#namespace namespace_f01a5da246ac06b4;

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa99
// Size: 0x2ab
function function_df15f72187363229() {
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_279c4202b5ed4980);
    if (isdefined(level.autoassignfirstquest) && level.autoassignfirstquest == 1 || getdvarint(@"hash_85b85aad9f4aefea", 1) == 0) {
        return;
    }
    if (!istrue(level.var_1e0470dbb6cf1859)) {
        while (!isdefined(level.struct_class_names) || !isdefined(level.var_41670c1c65f3d3cf) || function_9a83377c98bce82a("everybody") <= 0 || !isdefined(level.var_49a5d647639e781e) || !istrue(level.var_f1073fbd45b59a06.var_9b87fdb80920f442) || !isdefined(level.startpoints)) {
            waitframe();
        }
    } else if (istrue(level.var_1e0470dbb6cf1859)) {
        while (!isdefined(level.var_f1073fbd45b59a06) || !isdefined(level.var_f1073fbd45b59a06.var_df987907a483df89)) {
            waitframe();
        }
    }
    level.var_1b7407dffe81e6e8 = spawnstruct();
    level.var_1b7407dffe81e6e8.teamlist = [];
    level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24 = [];
    level.var_fe29a5bf2f96b5d3 = [];
    foreach (node in getstructarray("dmz_missionObjectiveUniversal", "script_noteworthy")) {
        level.var_fe29a5bf2f96b5d3[level.var_fe29a5bf2f96b5d3.size] = node;
    }
    level.var_1b7407dffe81e6e8.var_a3e3841ab1affb3c = getdvar(@"hash_518d6090239df9b9", "mp/dmzactivities.csv");
    level.var_1b7407dffe81e6e8.var_d6d000f64c923fd6 = getdvarint(@"hash_10fcfffe932c9bd5", 1);
    level.var_13daf5d5cf8158b2 = getdvarint(@"hash_a598966b6e53fde8", 1);
    level.var_d1404cd77b68f22e = getdvarint(@"hash_51ca2e83111f7340", 0);
    level.var_fc3962361e2033a9 = getdvarint(@"hash_a17f8c87a9ffefa6", 1);
    level.var_427f173fa29d4e80 = getdvarint(@"hash_f173806bc718ddd1", 1);
    level.var_a4840e7885ef58e = getdvarint(@"hash_66a4a1572a0e159d", 1);
    if (istrue(level.var_1e0470dbb6cf1859)) {
        level.var_a4840e7885ef58e = 0;
    }
    level thread function_97479a799d6eb103();
    level thread function_4a6adeb5f340fcc8();
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::function_f3d757808130bac4(&function_22e206cc7ae5dbfd);
    }
    /#
        level thread function_5597de4be05ad14a();
    #/
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xd4b
// Size: 0x3e
function function_7460e0aba0b1f1b3(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread namespace_244fdc99ed0f5d2b::function_57ac6111c7db410f(instance, player);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd90
// Size: 0x119
function function_adc51ade78872d95(team) {
    if (function_5ea5a722c499078f(team)) {
        activity = function_b1d0568d9066a2ce(team);
        if (isdefined(activity)) {
            namespace_e77194a0203f683::function_1ef65d2654424502(activity, "fail", team);
            activity.var_b7718b6e41108129[0] function_8d4a1199159f7d52(team);
            if (istrue(level.var_1a2b600a06ec21f4.var_b0c3d102a683d3ee)) {
                foreach (player in getteamdata(team, "players")) {
                    player dlog_recordplayerevent("dlog_event_exgm_player_mission_complete", [0:"mission_ref", 1:activity.var_b7718b6e41108129[0].ref, 2:"completion_state", 3:"failed - team eliminated"]);
                }
            }
        }
    }
    teamcount = namespace_6d8da2b47f878104::getactiveteamcount();
    if (teamcount == 1) {
        namespace_b11859036e02907d::function_9afa2021a101589a();
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xeb0
// Size: 0x811
function private function_5597de4be05ad14a() {
    /#
        setdvar(@"hash_38667c3d89e33b7b", 0);
        setdvar(@"hash_b141c2b278951739", 0);
        setdvar(@"hash_d53193725af8249a", 0);
        setdvar(@"hash_49015467bf99bb3b", 0);
        while (1) {
            waitframe();
            if (isdefined(level.var_1b7407dffe81e6e8.spawndata)) {
                foreach (name, spawndata in level.var_1b7407dffe81e6e8.spawndata) {
                    if (getdvarint(function_2ef675c13ca1c4af(@"hash_31a2bba2a258c4a2", name, "Activity ent does not have a last touch time!"), 0) == 1 || getdvarint(function_2ef675c13ca1c4af(@"hash_31a2bba2a258c4a2", name, "task_ended"), 0) == 1) {
                        var_6572782cdec348bd = getdvarint(function_2ef675c13ca1c4af(@"hash_31a2bba2a258c4a2", name, "task_ended"), 0) == 1;
                        setdvar(function_2ef675c13ca1c4af(@"hash_31a2bba2a258c4a2", name, "Activity ent does not have a last touch time!"), 0);
                        setdvar(function_2ef675c13ca1c4af(@"hash_31a2bba2a258c4a2", name, "task_ended"), 0);
                        activity = undefined;
                        foreach (var_8b903503a248ef47 in level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24) {
                            if (isdefined(var_8b903503a248ef47.name) && name == var_8b903503a248ef47.name) {
                                activity = var_8b903503a248ef47;
                                break;
                            }
                        }
                        if (!isdefined(activity)) {
                            node = undefined;
                            foreach (var_51571f0c2d656751 in spawndata.nodes) {
                                if (function_39c4f5c52fb521d8(var_51571f0c2d656751.origin, spawndata.var_44f8910125ec2a45, spawndata.var_51f461a8e820667b, name)) {
                                    node = var_51571f0c2d656751;
                                    break;
                                }
                            }
                            if (isdefined(node)) {
                                activity = function_fbac8fe5cba1bccd(node, name, spawndata, 1);
                            } else {
                                /#
                                    assert("Per player task assignment failed!" + name + "<unknown string>");
                                #/
                            }
                        }
                        team = level.players[0].team;
                        if (var_6572782cdec348bd) {
                            foreach (player in level.players) {
                                if (isbot(player)) {
                                    team = player.team;
                                    break;
                                }
                            }
                        }
                        activity function_3faa04ef514a5fc4(team, undefined, level.players[0]);
                    }
                }
                if (getdvarint(@"hash_ef7e3cb3eb287471", 0)) {
                    setdvar(@"hash_ef7e3cb3eb287471", 0);
                    player = level.players[0];
                    if (function_5ea5a722c499078f(player.team)) {
                        activity = function_b1d0568d9066a2ce(player.team);
                        activity.var_b7718b6e41108129[0] function_8d4a1199159f7d52(player.team);
                    }
                }
                if (getdvarint(@"hash_e1cbc0efccbb05da", 0)) {
                    printtoscreen2d(50, 50, "<unknown string>");
                    y = 50;
                    total = 0;
                    foreach (name, spawndata in level.var_1b7407dffe81e6e8.spawndata) {
                        total = total + spawndata.spawned;
                        text = name + "<unknown string>" + spawndata.spawned;
                        y = y + 20;
                        printtoscreen2d(50, y, text);
                    }
                    y = y + 20;
                    printtoscreen2d(50, y, "<unknown string>" + total);
                }
            }
            if (getdvarint(@"hash_b141c2b278951739", 0) == 1) {
                var_d3ddded84427dd1c = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[0].teams[level.players[0].team];
                task = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[0].var_b7718b6e41108129[var_d3ddded84427dd1c];
                task function_18d4e8025ec24a0();
                setdvar(@"hash_b141c2b278951739", 0);
            }
            if (getdvarint(@"hash_38667c3d89e33b7b", 0) == 1) {
                activity = function_ebe9b1e455d46450(level.players[0]);
                activity function_3faa04ef514a5fc4(level.players[0].team);
                setdvar(@"hash_38667c3d89e33b7b", 0);
            }
            if (getdvarint(@"hash_d53193725af8249a")) {
                setdvar(@"hash_d53193725af8249a", 0);
                spawnpoint = level.players[0];
                var_5ea1be154aeb609b = spawnscriptable("<unknown string>" + "<unknown string>", spawnpoint.origin, spawnpoint.angles);
                var_5ea1be154aeb609b function_5220f38b5239eac8();
                var_5ea1be154aeb609b.var_dabe413c9c6c48f4 = randomint(tablelookupgetnumrows(level.var_1b7407dffe81e6e8.var_a3e3841ab1affb3c));
                var_5ea1be154aeb609b.var_d855aa87b99592a = randomint(100) + 1;
                var_5ea1be154aeb609b.var_e995bb533046188d = randomint(8);
                if (!isdefined(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38)) {
                    level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38 = [];
                }
                var_9a1c73c207674b5 = level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38.size;
                level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38[level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38.size] = var_5ea1be154aeb609b;
                if (var_9a1c73c207674b5 == 0) {
                    level thread function_4a6adeb5f340fcc8();
                }
            }
            if (getdvarint(@"hash_2039b0d4553f1be2", 0)) {
                setdvar(@"hash_2039b0d4553f1be2", 0);
                if (!isdefined(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38)) {
                    level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38 = [];
                }
                foreach (var_5ea1be154aeb609b in level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38) {
                    var_5ea1be154aeb609b function_66da9365bbfea8b7();
                }
            }
            if (getdvarint(@"hash_49015467bf99bb3b", 0) == 1) {
                setdvar(@"hash_49015467bf99bb3b", 0);
                node = spawnstruct();
                node.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 200;
                node.angles = level.players[0].angles;
                namespace_abc7ed0cde8527d4::function_d2441b457fa14419(node);
            }
        }
    #/
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c8
// Size: 0x52
function function_b713f2d39b34540f(data, createfunc, nodes) {
    /#
        assert(isdefined(data) && isdefined(createfunc) && isdefined(nodes), "activity_createSpawnData: Not all params defined");
    #/
    data.createfunc = createfunc;
    data.nodes = nodes;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1721
// Size: 0x6bb
function private function_38228778814192a() {
    spawndata = [];
    var_a3e3841ab1affb3c = level.var_1b7407dffe81e6e8.var_a3e3841ab1affb3c;
    numrows = tablelookupgetnumrows(var_a3e3841ab1affb3c);
    debug = getdvarint(@"hash_4ca9133f642d177f", 0) == 1;
    startpoints = [];
    foreach (set in level.startpoints) {
        if (isdefined(set.points)) {
            foreach (point in set.points) {
                if (isdefined(point.origin)) {
                    startpoints[startpoints.size] = point.origin;
                }
            }
        }
        if (isdefined(set.origin)) {
            startpoints[startpoints.size] = set.origin;
        }
    }
    for (row = 0; row < numrows; row++) {
        enabled = int(tablelookupbyrow(var_a3e3841ab1affb3c, row, 2));
        name = tablelookupbyrow(var_a3e3841ab1affb3c, row, 0);
        function_975afdc14c65649c(name, row);
        var_2362da841d75b7f2 = getdvarint(function_2ef675c13ca1c4af(@"hash_1b5fb36050170b0f", name, "_enabled"), -1);
        if (var_2362da841d75b7f2 != -1) {
            enabled = var_2362da841d75b7f2;
        }
        if (!enabled) {
            continue;
        }
        data = spawnstruct();
        data.index = row;
        data.type = tablelookupbyrow(var_a3e3841ab1affb3c, row, 3);
        data.var_723b8f7cb71ceb11 = int(tablelookupbyrow(var_a3e3841ab1affb3c, row, 4));
        data.difficulty = int(tablelookupbyrow(var_a3e3841ab1affb3c, row, 5));
        data.priority = float(tablelookupbyrow(var_a3e3841ab1affb3c, row, 7));
        data.var_44f8910125ec2a45 = float(tablelookupbyrow(var_a3e3841ab1affb3c, row, 8));
        data.var_51f461a8e820667b = float(tablelookupbyrow(var_a3e3841ab1affb3c, row, 9));
        data.var_e97d97a56bfe37ad = int(tablelookupbyrow(var_a3e3841ab1affb3c, row, 10));
        data.var_322a164a02a90407 = int(tablelookupbyrow(var_a3e3841ab1affb3c, row, 11));
        data.var_2ce8f82ad71eb571 = float(tablelookupbyrow(var_a3e3841ab1affb3c, row, 14));
        data.var_7a62616965ed6a2e = float(tablelookupbyrow(var_a3e3841ab1affb3c, row, 15));
        var_edabfa0430b5ad85 = int(tablelookupbyrow(var_a3e3841ab1affb3c, row, 16));
        if (var_edabfa0430b5ad85 > 0) {
            foreach (startpoint in startpoints) {
                function_d4d97591648f4390(startpoint, var_edabfa0430b5ad85, name, 1);
                /#
                    if (debug) {
                        draw_circle(startpoint + (0, 0, 800), var_edabfa0430b5ad85, (0, 1, 1), 1, 0, 20000);
                    }
                #/
            }
        }
        var_a620cb0e6444887f = getdvarint(function_2ef675c13ca1c4af(@"hash_1b5fb36050170b0f", name, "_numberToSpawn"), -1);
        if (var_a620cb0e6444887f != -1) {
            data.var_e97d97a56bfe37ad = var_a620cb0e6444887f;
            data.var_322a164a02a90407 = var_a620cb0e6444887f;
        }
        /#
            assert(data.var_e97d97a56bfe37ad <= data.var_322a164a02a90407, "activity_initSpawnData: activity " + name + " has minSpawn > maxSpawn");
        #/
        switch (name) {
        case #"hash_f4a9126c03d3385b":
            namespace_e1bfa87a2a692d3c::function_80d68c9701e1aea5(data);
            break;
        case #"hash_194f31f722d1fa09":
            namespace_4c19ca57323d483c::function_80d68c9701e1aea5(data);
            break;
        case #"hash_e91729d4ef79ca26":
            namespace_4f4cbea0f5b0bdb8::function_80d68c9701e1aea5(data);
            break;
        case #"hash_75b6db03edb1e84e":
            namespace_300f9f7dca7fc109::function_80d68c9701e1aea5(data);
            break;
        case #"hash_e9d9fcb8daba8602":
            namespace_fa9fd40f68ab8478::function_80d68c9701e1aea5(data);
            break;
        case #"hash_82ea0e6e4f123b62":
            namespace_b8c00f1eafbbd213::function_80d68c9701e1aea5(data);
            break;
        case #"hash_514d922eb8aed0b1":
            break;
        case #"hash_8fe6af6c550e39bc":
            namespace_30baceecda213256::function_80d68c9701e1aea5(data);
            break;
        case #"hash_cf3abe09f0094696":
            namespace_5ffce5a43b2d1ec2::function_80d68c9701e1aea5(data);
            break;
        case #"hash_e0b82e0f064c17d6":
            namespace_232aeaeb467df5bd::function_80d68c9701e1aea5(data);
            break;
        case #"hash_9682e089e580b4b8":
            namespace_38da3c68826ceb02::function_80d68c9701e1aea5(data);
            break;
        case #"hash_1e754eb11fa62651":
            namespace_d0483bb41cd4e112::function_80d68c9701e1aea5(data);
            break;
        case #"hash_9db32d30f2603c35":
            namespace_168c086126cfa488::function_80d68c9701e1aea5(data);
            break;
        case #"hash_37bb23543c319104":
            namespace_b11859036e02907d::function_80d68c9701e1aea5(data);
            break;
        case #"hash_be386dc37be6968e":
            namespace_20374f100d8c4183::function_80d68c9701e1aea5(data);
            break;
        case #"hash_4f62da1c4ed6f790":
            namespace_a3ac717bde4bea03::function_80d68c9701e1aea5(data);
            break;
        case #"hash_218ddcea32fa5fbc":
            namespace_210d6dd43cfaf195::function_80d68c9701e1aea5(data);
            break;
        case #"hash_5c317bf7b4be6e08":
            break;
        case #"hash_88570f89de3f4680":
            namespace_a713760a939752c1::function_80d68c9701e1aea5(data);
            break;
        default:
            /#
                assertmsg("activity_getSpawnData: Found a name in dmzactivities.csv which isn't accounted for: " + name);
            #/
            break;
        }
        data.var_a620cb0e6444887f = randomintrange(data.var_e97d97a56bfe37ad, data.var_322a164a02a90407 + 1);
        if (!isdefined(data.nodes) || !isarray(data.nodes) || data.nodes.size == 0 || data.var_a620cb0e6444887f <= 0) {
            continue;
        }
        data.spawned = 0;
        data.nodes = array_randomize(data.nodes);
        spawndata[name] = data;
    }
    /#
        level.var_1b7407dffe81e6e8.spawndata = spawndata;
    #/
    return spawndata;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de4
// Size: 0x158
function function_aece1e424e300380() {
    spawndata = [];
    numrows = tablelookupgetnumrows("mp/bractivities.csv");
    for (row = 0; row < numrows; row++) {
        enabled = int(tablelookupbyrow("mp/bractivities.csv", row, 2));
        name = tablelookupbyrow("mp/bractivities.csv", row, 0);
        function_975afdc14c65649c(name, row);
        if (!enabled) {
            continue;
        }
        data = spawnstruct();
        data.index = row;
        data.type = tablelookupbyrow("mp/bractivities.csv", row, 3);
        data.var_723b8f7cb71ceb11 = int(tablelookupbyrow("mp/bractivities.csv", row, 4));
        switch (name) {
        case #"hash_7e9cf92ed0a526f1":
            namespace_c96c5decac69fc6::function_7aae8cb0d8b0ac6a(data);
            break;
        case #"hash_890e226c519dc6ab":
            namespace_d4eb7462ff000665::function_7aae8cb0d8b0ac6a(data);
            break;
        case #"hash_dd93195493d0c818":
            namespace_b8f885001f04bb5::function_7aae8cb0d8b0ac6a(data);
            break;
        default:
            /#
                assertmsg("activity_getSpawnData: Found a name in bractivities.csv which isn't accounted for: " + name);
            #/
            break;
        }
        spawndata[name] = data;
    }
    level.var_1b7407dffe81e6e8.var_b2f15037287a033a = spawndata;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f43
// Size: 0x3f
function function_6507dea837a9799c(name) {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_b2f15037287a033a)) {
        function_aece1e424e300380();
    }
    return level.var_1b7407dffe81e6e8.var_b2f15037287a033a[name];
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f8a
// Size: 0x57
function private function_975afdc14c65649c(type, index) {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_cbf0325dfcc5a117)) {
        level.var_1b7407dffe81e6e8.var_cbf0325dfcc5a117 = [];
    }
    level.var_1b7407dffe81e6e8.var_cbf0325dfcc5a117[type] = index;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fe8
// Size: 0x74
function private function_f92c1a3d19210ccd(type) {
    /#
        assert(isdefined(level.var_1b7407dffe81e6e8) && isdefined(level.var_1b7407dffe81e6e8) && isdefined(level.var_1b7407dffe81e6e8.var_cbf0325dfcc5a117) && isdefined(level.var_1b7407dffe81e6e8.var_cbf0325dfcc5a117[type]));
    #/
    return level.var_1b7407dffe81e6e8.var_cbf0325dfcc5a117[type];
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2064
// Size: 0x75
function private function_3ee172d5f412da21() {
    level.var_1b7407dffe81e6e8.var_b2f15037287a033a = function_38228778814192a();
    level.var_1b7407dffe81e6e8.var_ba936a320ae753dd = getdvarint(@"hash_b44c01cc57de403d", 15);
    function_24d627b48a11f1f1(level.var_1b7407dffe81e6e8.var_b2f15037287a033a);
    function_fa609575f2417f18(level.var_1b7407dffe81e6e8.var_b2f15037287a033a);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20e0
// Size: 0x2d3
function private function_24d627b48a11f1f1(var_b2f15037287a033a) {
    if (!function_47d356083884f913()) {
        return;
    }
    var_fcf22b7b64b65cd5 = getdvarint(@"hash_870dad054972bf3e", 2);
    var_d4a378ed7d56a57a = [];
    foreach (var_171f90b9c4c76d44, _ in level.poi) {
        var_a620cb0e6444887f = getdvarint(function_2ef675c13ca1c4af(@"hash_c6cea952b5d6724c", var_171f90b9c4c76d44), ter_op(issubstr(var_171f90b9c4c76d44, "suburb"), 0, var_fcf22b7b64b65cd5));
        if (var_a620cb0e6444887f > 0) {
            var_d4a378ed7d56a57a[var_171f90b9c4c76d44] = var_a620cb0e6444887f;
        }
    }
    var_4e01f7c3200a9adb = 0;
    while (1) {
        var_bffcbb624987207b = function_b77f6d389fed1407(var_b2f15037287a033a);
        spawndata = var_bffcbb624987207b[1];
        name = var_bffcbb624987207b[0];
        if (!isdefined(name) || !isdefined(spawndata)) {
            return;
        }
        foreach (index, node in spawndata.nodes) {
            if (!isdefined(node.poi)) {
                node.poi = function_6cc445c02b5effac(node.origin, 1);
            }
            if (isdefined(node.poi) && isdefined(var_d4a378ed7d56a57a[node.poi]) && var_d4a378ed7d56a57a[node.poi] > 0 && function_39c4f5c52fb521d8(node.origin, spawndata.var_44f8910125ec2a45, spawndata.var_51f461a8e820667b, name) && !namespace_7789f919216d38a2::function_cdcab1374db7f007(node.origin)) {
                function_fbac8fe5cba1bccd(node, name, spawndata, getdvarint(@"hash_4ca9133f642d177f", 0) == 1);
                var_d4a378ed7d56a57a[node.poi]--;
                if (var_d4a378ed7d56a57a[node.poi] <= 0) {
                    var_d4a378ed7d56a57a[node.poi] = undefined;
                }
                spawndata.nodes[index] = undefined;
                var_4e01f7c3200a9adb++;
                if (var_4e01f7c3200a9adb >= level.var_1b7407dffe81e6e8.var_ba936a320ae753dd) {
                    var_4e01f7c3200a9adb = var_4e01f7c3200a9adb - level.var_1b7407dffe81e6e8.var_ba936a320ae753dd;
                    waitframe();
                }
                if (var_d4a378ed7d56a57a.size <= 0) {
                    return;
                }
                spawndata.spawned++;
                if (spawndata.spawned >= spawndata.var_a620cb0e6444887f) {
                    break;
                }
            }
        }
        var_b2f15037287a033a[name] = undefined;
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23ba
// Size: 0x1e5
function private function_fa609575f2417f18(var_b2f15037287a033a) {
    var_4e01f7c3200a9adb = 0;
    while (1) {
        var_bffcbd62498724e1 = function_b77f6d389fed1407(var_b2f15037287a033a);
        spawndata = var_bffcbd62498724e1[1];
        name = var_bffcbd62498724e1[0];
        if (!isdefined(name) || !isdefined(spawndata)) {
            break;
        }
        if (spawndata.spawned < spawndata.var_a620cb0e6444887f) {
            foreach (node in spawndata.nodes) {
                if (!isdefined(node.poi)) {
                    node.poi = function_6cc445c02b5effac(node.origin, 1);
                }
                if (function_39c4f5c52fb521d8(node.origin, spawndata.var_44f8910125ec2a45, spawndata.var_51f461a8e820667b, name) && (!function_47d356083884f913() || !isdefined(node.poi) || function_faa6481e65f14ade(node.poi)) && !namespace_7789f919216d38a2::function_cdcab1374db7f007(node.origin)) {
                    function_fbac8fe5cba1bccd(node, name, spawndata, getdvarint(@"hash_4ca9133f642d177f", 0) == 1);
                    var_4e01f7c3200a9adb++;
                    if (var_4e01f7c3200a9adb >= level.var_1b7407dffe81e6e8.var_ba936a320ae753dd) {
                        var_4e01f7c3200a9adb = var_4e01f7c3200a9adb - level.var_1b7407dffe81e6e8.var_ba936a320ae753dd;
                        waitframe();
                    }
                    spawndata.spawned++;
                    if (spawndata.spawned >= spawndata.var_a620cb0e6444887f) {
                        break;
                    }
                }
            }
        }
        var_b2f15037287a033a[name] = undefined;
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a6
// Size: 0xee
function function_f222bd80432744ff(name) {
    var_ffbcb57fe99f4f32 = self;
    spawndata = function_6507dea837a9799c(name);
    activity = function_aebc13d5b1e8d58d();
    if (isdefined(var_ffbcb57fe99f4f32.var_6a9a1aeeaa7c25df)) {
        activity.fortress = var_ffbcb57fe99f4f32;
    }
    activity.var_b7718b6e41108129[0] = [[ spawndata.createfunc ]](activity, var_ffbcb57fe99f4f32);
    activity.var_723b8f7cb71ceb11 = spawndata.var_723b8f7cb71ceb11;
    activity.name = name;
    activity.origin = var_ffbcb57fe99f4f32.origin;
    activity.type = spawndata.type;
    level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[activity.id] = activity;
    return activity function_5c8fa034ed436a02();
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x269c
// Size: 0x27e
function private function_fbac8fe5cba1bccd(node, name, spawndata, debug) {
    if (function_47d356083884f913() && !isdefined(node.poi)) {
        node.poi = function_6cc445c02b5effac(node.origin, 1);
    }
    if (function_2d421d1f793f6f93() && !isdefined(node.fortress)) {
        node.fortress = function_c0a211a69f5f8f2f(node.origin);
    }
    function_d4d97591648f4390(node.origin, spawndata.var_44f8910125ec2a45, name);
    activity = function_aebc13d5b1e8d58d();
    activity.var_b7718b6e41108129[0] = [[ spawndata.createfunc ]](activity, node);
    activity.var_723b8f7cb71ceb11 = spawndata.var_723b8f7cb71ceb11;
    activity.name = name;
    activity.origin = node.origin;
    activity.poi = node.poi;
    activity.fortress = node.fortress;
    activity.type = spawndata.type;
    level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[activity.id] = activity;
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6(name, name, "<unknown string>", undefined, activity.id, undefined, activity.poi, activity.origin);
    #/
    activity thread function_5c8fa034ed436a02();
    /#
        if (istrue(debug)) {
            line(node.origin, node.origin + (0, 0, 4096), (0, 1, 1), 1, 0, 20000);
            draw_circle(node.origin + (0, 0, 800), spawndata.var_44f8910125ec2a45, (1, 0, 0), 1, 0, 20000);
            draw_circle(node.origin + (0, 0, 800), spawndata.var_51f461a8e820667b, (1, 1, 0), 1, 0, 20000);
        }
    #/
    return activity;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2922
// Size: 0x12d
function private function_39c4f5c52fb521d8(origin, var_83d4d63f858eebb6, var_fd8a6ebe7ce71b34, name) {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_697f8897ff4784d4)) {
        level.var_1b7407dffe81e6e8.var_697f8897ff4784d4 = [];
    }
    foreach (point in level.var_1b7407dffe81e6e8.var_697f8897ff4784d4) {
        dist = distance(origin, point.origin);
        if (istrue(point.var_3d250f9d9916a3c)) {
            if (point.name == name && dist < point.radius) {
                return 0;
            }
        } else if (dist < point.radius || dist < var_83d4d63f858eebb6 || point.name == name && dist < var_fd8a6ebe7ce71b34) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a57
// Size: 0xbe
function private function_d4d97591648f4390(origin, radius, name, var_3d250f9d9916a3c) {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_697f8897ff4784d4)) {
        level.var_1b7407dffe81e6e8.var_697f8897ff4784d4 = [];
    }
    point = spawnstruct();
    point.origin = origin;
    point.radius = radius;
    point.name = name;
    point.var_3d250f9d9916a3c = var_3d250f9d9916a3c;
    level.var_1b7407dffe81e6e8.var_697f8897ff4784d4[level.var_1b7407dffe81e6e8.var_697f8897ff4784d4.size] = point;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b1c
// Size: 0xc1
function private function_b77f6d389fed1407(spawndata) {
    if (!isdefined(spawndata) || spawndata.size <= 0) {
        return [0:undefined, 1:undefined];
    }
    var_caccb7944ff88b19 = -1;
    var_9a9347ccd8359d98 = undefined;
    var_939bdf45ce71425b = undefined;
    foreach (name, data in spawndata) {
        if (data.priority > var_caccb7944ff88b19) {
            var_caccb7944ff88b19 = data.priority;
            var_9a9347ccd8359d98 = name;
            var_939bdf45ce71425b = data;
        }
    }
    return [0:var_9a9347ccd8359d98, 1:var_939bdf45ce71425b];
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2be5
// Size: 0x87
function private function_5c8fa034ed436a02() {
    foreach (index, task in self.var_b7718b6e41108129) {
        task.index = index;
        if (isdefined(task.funcs["onInit"])) {
            task [[ task.funcs["onInit"] ]]();
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c73
// Size: 0x196
function private function_97479a799d6eb103() {
    var_db5b04bc41f47c73 = 0;
    level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1 = [];
    if (istrue(level.var_1e0470dbb6cf1859)) {
        level namespace_bd614c3c2275579a::function_2e6a3f3e4d2731ea(1);
        if (istrue(level.var_187b57dd871ec189)) {
            foreach (agent in function_b4b9401715cf98ea("everybody")) {
                function_234dfccd8495c7d1(agent.team);
            }
            var_db5b04bc41f47c73 = function_9a83377c98bce82a("everybody");
        }
    } else {
        level function_3ee172d5f412da21();
        level thread function_98c331a3e2621695();
        level function_84ed600d2bd001ad();
        if (getdvarint(@"hash_5ebc91cfdc6a2402", 0)) {
            level thread namespace_b11859036e02907d::function_7562a66c42d923dc();
        }
    }
    level.var_1b7407dffe81e6e8.totalplayers = level.players.size + var_db5b04bc41f47c73;
    foreach (player in level.players) {
        function_234dfccd8495c7d1(player.team);
    }
    var_93aa5ac7d4107dab = getdvarint(@"hash_7aa1f51e05f1bd54", 5);
    if (var_93aa5ac7d4107dab > 0) {
        level thread function_672b3bf78b2f92e7(var_93aa5ac7d4107dab);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e10
// Size: 0x11d
function private function_672b3bf78b2f92e7(var_93aa5ac7d4107dab) {
    while (1) {
        if (level.var_1b7407dffe81e6e8.totalplayers < level.players.size) {
            foreach (player in level.players) {
                if (!isdefined(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[player.team])) {
                    function_234dfccd8495c7d1(player.team);
                }
            }
        }
        level.var_1b7407dffe81e6e8.totalplayers = level.players.size;
        if (istrue(level.var_187b57dd871ec189)) {
            level.var_1b7407dffe81e6e8.totalplayers = level.players.size + level.var_41670c1c65f3d3cf.spawned["everybody"].size;
        }
        wait(var_93aa5ac7d4107dab);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f34
// Size: 0x188
function private function_234dfccd8495c7d1(teamname) {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname])) {
        level.var_1b7407dffe81e6e8.teamlist[level.var_1b7407dffe81e6e8.teamlist.size] = teamname;
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname] = spawnstruct();
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_6299084ae61b350a = [];
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].trackingindex = -1;
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_83abcb9b3a5dbe24 = [];
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_4245d658e9ae8a3d = 0;
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].active = 0;
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_388b0969ae3525f2 = [];
        if (level.var_a4840e7885ef58e > 1) {
            if (!function_5ea5a722c499078f(teamname)) {
                player = getteamdata(teamname, "players")[0];
                if (isdefined(player)) {
                    activity = function_ebe9b1e455d46450(player);
                    if (isdefined(activity)) {
                        activity function_3faa04ef514a5fc4(teamname);
                    }
                }
            }
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c3
// Size: 0x196
function function_821fa443949531c9(var_e1dd7bed632a13c3, activity) {
    var_ffbcb57fe99f4f32 = self;
    level endon("game_ended");
    var_e1dd7bed632a13c3 endon("deleted");
    var_e1dd7bed632a13c3 endon("activity_ended");
    var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e = [];
    var_e1dd7bed632a13c3.var_3551befc72f03b2d = [];
    var_ffbcb57fe99f4f32 thread namespace_244fdc99ed0f5d2b::function_f222bd80432744ff(activity);
    while (1) {
        var_fd2e17866307aaa5 = 0;
        ent = var_e1dd7bed632a13c3 waittill("trigger");
        if (!istrue(var_ffbcb57fe99f4f32.unlocked) || istrue(level.var_6e53394b95fde2bf) && !istrue(var_ffbcb57fe99f4f32.var_7f893c2e20a823db)) {
            continue;
        }
        if (ent namespace_1f188a13f7e79610::isvehicle() && !isdefined(ent.streakinfo)) {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
            if (!isdefined(occupants)) {
                continue;
            }
            foreach (occupant in occupants) {
                if (var_e1dd7bed632a13c3 function_1a0a0367591e7f87(occupant)) {
                    var_fd2e17866307aaa5 = var_e1dd7bed632a13c3 function_7098ff5bc0ec9505(occupant, var_e1dd7bed632a13c3.entnum, var_ffbcb57fe99f4f32);
                    if (var_fd2e17866307aaa5) {
                        var_e1dd7bed632a13c3 function_c4839e806ac50bd6(occupant);
                    }
                }
            }
        } else if (var_e1dd7bed632a13c3 function_1a0a0367591e7f87(ent)) {
            var_fd2e17866307aaa5 = var_e1dd7bed632a13c3 function_7098ff5bc0ec9505(ent, var_e1dd7bed632a13c3.entnum, var_ffbcb57fe99f4f32);
            if (var_fd2e17866307aaa5) {
                var_e1dd7bed632a13c3 function_c4839e806ac50bd6(ent);
            }
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3260
// Size: 0x7b
function function_c4839e806ac50bd6(player) {
    var_e1dd7bed632a13c3 = self;
    playerentnum = player getentitynumber();
    if (!isdefined(var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e[playerentnum])) {
        var_e1dd7bed632a13c3 notify("trigger_enter", player);
        var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e[playerentnum] = player;
        var_e1dd7bed632a13c3.var_3551befc72f03b2d[playerentnum] = gettime();
    } else {
        var_e1dd7bed632a13c3.var_3551befc72f03b2d[playerentnum] = gettime();
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e2
// Size: 0xc5
function function_1a0a0367591e7f87(player) {
    var_7426b3050c68b548 = self;
    if (!isreallyalive(player)) {
        return 0;
    }
    if (istrue(var_7426b3050c68b548.trigger_off)) {
        return 0;
    }
    if (!istrue(level.var_187b57dd871ec189)) {
        if (!isbot(player) && namespace_36f464722d326bbe::isaigameparticipant(player)) {
            return 0;
        }
        if (!namespace_36f464722d326bbe::isgameparticipant(player)) {
            return 0;
        }
        if (isagent(player) && (!isdefined(player.team) || !isdefined(var_7426b3050c68b548.numtouching[player.team]))) {
            return 0;
        }
    }
    if (isdefined(player.classname) && player.classname == "script_vehicle") {
        return 0;
    }
    return 1;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33af
// Size: 0x36
function function_7098ff5bc0ec9505(player, var_e619efb5b1203664, var_ffbcb57fe99f4f32) {
    playerentnum = player getentitynumber();
    return function_ced68e0624873af5(player, var_e619efb5b1203664, var_ffbcb57fe99f4f32);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ed
// Size: 0x242
function function_a33c10c0682918bd(var_e1dd7bed632a13c3, var_9399bf62b66519d1) {
    /#
        assertex(isdefined(var_e1dd7bed632a13c3), "Volume based activity mission trigger must be defined!");
    #/
    task = self;
    level endon("game_ended");
    var_e1dd7bed632a13c3 endon("deleted");
    var_e1dd7bed632a13c3 endon("activity_ended");
    var_d0ff518e0d3279c6 = 1;
    if (!isdefined(var_9399bf62b66519d1)) {
        var_9399bf62b66519d1 = 9000;
    }
    var_51785c3dce118d4b = 0;
    if (!isdefined(var_e1dd7bed632a13c3.var_51785c3dce118d4b)) {
        var_51785c3dce118d4b = 300;
    } else {
        var_51785c3dce118d4b = var_e1dd7bed632a13c3.var_51785c3dce118d4b;
    }
    var_94ceee32950ddf00 = var_51785c3dce118d4b / 1000;
    /#
        assertex(var_94ceee32950ddf00 > 0, "Activity trigger needs a sample resolution!");
    #/
    while (1) {
        wait(var_94ceee32950ddf00);
        waittillframeend();
        foreach (playerentnum, var_7c991dcbc6a72c19 in var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e) {
            if (!isdefined(var_7c991dcbc6a72c19)) {
                var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e[playerentnum] = undefined;
                var_e1dd7bed632a13c3.var_3551befc72f03b2d[playerentnum] = undefined;
            } else {
                /#
                    assertex(isdefined(var_e1dd7bed632a13c3.var_3551befc72f03b2d[playerentnum]), "Activity ent does not have a last touch time!");
                #/
                currenttime = gettime();
                var_ca63cbdf2251b4af = currenttime - var_e1dd7bed632a13c3.var_3551befc72f03b2d[playerentnum];
                if (var_ca63cbdf2251b4af > var_9399bf62b66519d1) {
                    var_e1dd7bed632a13c3 notify("trigger_exit", var_7c991dcbc6a72c19);
                    if (isdefined(task.funcs["onPlayerExitTimeout"])) {
                        task thread [[ task.funcs["onPlayerExitTimeout"] ]](var_7c991dcbc6a72c19);
                    }
                    var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e[playerentnum] = undefined;
                    var_e1dd7bed632a13c3.var_3551befc72f03b2d[playerentnum] = undefined;
                } else if (var_ca63cbdf2251b4af > var_51785c3dce118d4b) {
                    if (isdefined(task.funcs["onPlayerExitVolume"])) {
                        task thread [[ task.funcs["onPlayerExitVolume"] ]](var_7c991dcbc6a72c19);
                    }
                } else if (istrue(var_7c991dcbc6a72c19.var_e09c6ea56555f1ed)) {
                    if (isdefined(task.funcs["onPlayerReenterVolume"])) {
                        task thread [[ task.funcs["onPlayerReenterVolume"] ]](var_7c991dcbc6a72c19);
                    }
                }
            }
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3636
// Size: 0x163
function private function_98c331a3e2621695() {
    while (1) {
        foreach (activity in level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24) {
            if (isdefined(activity)) {
                foreach (team, index in activity.teams) {
                    if (!level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].active) {
                        foreach (player in getteamdata(team, "players")) {
                            if (distancesquared(player.origin, activity.origin) < activity.var_8d3a05143c7a1142) {
                                activity function_3262f80d2b114587(team);
                                break;
                            }
                        }
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a0
// Size: 0x2a3
function function_c509b7faae587820(var_ffbcb57fe99f4f32) {
    player = self;
    if (istrue(istrue(player.var_38f4f1b1c66513f1))) {
        return 0;
    }
    if (!level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[player.team].active) {
        if (!isdefined(var_ffbcb57fe99f4f32.task)) {
            return 0;
        }
    } else if (!array_contains(var_ffbcb57fe99f4f32.task.players, player)) {
        var_388b0969ae3525f2 = level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[player.team].var_388b0969ae3525f2;
        foreach (activity in var_388b0969ae3525f2) {
            if (!isdefined(activity.var_b7718b6e41108129)) {
                continue;
            }
            foreach (task in activity.var_b7718b6e41108129) {
                if (!isdefined(task)) {
                    continue;
                }
                if (array_contains(task.players, player)) {
                    var_5d7b8825ae739ab4 = distance2d(task.circlecenter, player.origin);
                    var_3c7fa17be3f77a08 = distance2d(var_ffbcb57fe99f4f32.task.circlecenter, player.origin);
                    if (var_5d7b8825ae739ab4 > var_3c7fa17be3f77a08 && !istrue(player.var_38f4f1b1c66513f1)) {
                        player thread function_513d7f67ab57c97(task.activity, var_ffbcb57fe99f4f32.task.activity);
                    }
                    return 0;
                }
            }
        }
    } else if (array_contains(var_ffbcb57fe99f4f32.task.players, player)) {
        return 1;
    }
    player playlocalsound("mp_dmz_phone_pickup");
    var_ffbcb57fe99f4f32.task.activity function_3faa04ef514a5fc4(player.team, undefined, player, 1);
    var_ffbcb57fe99f4f32.task.activity function_6e31cc7110b536fd(player.team);
    return 1;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4b
// Size: 0x2b
function function_ced68e0624873af5(player, var_e619efb5b1203664, var_ffbcb57fe99f4f32) {
    if (isdefined(var_ffbcb57fe99f4f32)) {
        return player function_c509b7faae587820(var_ffbcb57fe99f4f32);
    }
    return 0;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7e
// Size: 0x393
function function_18d4e8025ec24a0(task, var_5e671fc71e72d5e8, var_644a33d86d8514bf) {
    var_c893965b0b5cc806 = isdefined(var_5e671fc71e72d5e8);
    var_7baf547d7eb18030 = task.index + 1;
    foreach (var_729f88304cd1d6f8 in task.teams) {
        victor = var_c893965b0b5cc806 && var_729f88304cd1d6f8 == var_5e671fc71e72d5e8;
        if (var_7baf547d7eb18030 >= self.var_b7718b6e41108129.size) {
            function_83d7eb52598be0b3(var_729f88304cd1d6f8);
            namespace_446fc987a980892f::function_70979c1eabf04180(getteamdata(var_729f88304cd1d6f8, "players"), self.name);
            level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[var_729f88304cd1d6f8].active = 0;
            if (victor) {
                players = getteamdata(var_729f88304cd1d6f8, "players");
                foreach (player in players) {
                    if (!isdefined(player.brmissionscompleted)) {
                        player.brmissionscompleted = 0;
                    }
                    player.brmissionscompleted++;
                    player namespace_48a08c5037514e04::doScoreEvent(#"hash_4f33a2c9e6f878f3");
                    if (istrue(level.var_9fb5000ae38dcf7f)) {
                        player setclientomnvar("ui_dmz_missions_completed", 0);
                    }
                    player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", player.brmissionscompleted);
                    if (istrue(level.var_1a2b600a06ec21f4.var_b0c3d102a683d3ee)) {
                        player dlog_recordplayerevent("dlog_event_exgm_player_mission_complete", [0:"mission_ref", 1:task.ref, 2:"completion_state", 3:"success"]);
                    }
                }
                level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[var_729f88304cd1d6f8].var_4245d658e9ae8a3d++;
                namespace_e77194a0203f683::function_1ef65d2654424502(self, "success", var_5e671fc71e72d5e8);
                var_4ab01941798b314c = undefined;
                if (isdefined(self.var_5ea1be154aeb609b) && isdefined(self.var_5ea1be154aeb609b.var_4ab01941798b314c)) {
                    var_4ab01941798b314c = self.var_5ea1be154aeb609b.var_4ab01941798b314c;
                }
                namespace_8361bad7391de074::function_a9f8fa06a358585b(var_5e671fc71e72d5e8, self.name, 1, var_4ab01941798b314c);
                if (isdefined(level.var_faa873310add1096)) {
                    level [[ level.var_faa873310add1096 ]](var_729f88304cd1d6f8, self);
                }
            }
            if (!istrue(var_644a33d86d8514bf)) {
                thread function_137d718c82ac0947(var_729f88304cd1d6f8);
            }
        } else {
            self.var_b7718b6e41108129[var_7baf547d7eb18030].teams[self.var_b7718b6e41108129[var_7baf547d7eb18030].teams.size] = var_729f88304cd1d6f8;
            self.teams[var_729f88304cd1d6f8] = var_7baf547d7eb18030;
            function_b7bbe29ed551ee90(self.var_b7718b6e41108129[var_7baf547d7eb18030].var_30e8a65cff941c7a, self.var_b7718b6e41108129[var_7baf547d7eb18030].tier, var_729f88304cd1d6f8);
            function_675059586a84fa06(var_729f88304cd1d6f8, "onTeamStart");
            self.var_b7718b6e41108129[var_7baf547d7eb18030].started = 1;
        }
    }
    if (var_7baf547d7eb18030 >= self.var_b7718b6e41108129.size) {
        activity_ended(var_5e671fc71e72d5e8);
    }
    task notify("task_ended");
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e18
// Size: 0x1b4
function activity_ended(var_5e671fc71e72d5e8) {
    level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[self.id] = undefined;
    if (isdefined(self.var_5ea1be154aeb609b)) {
        level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38 = array_remove(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38, self.var_5ea1be154aeb609b);
        self.var_5ea1be154aeb609b setscriptablepartstate("brloot_activity_starter", "hidden");
    }
    foreach (team, task in self.teams) {
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24 = array_remove(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24, self.id);
        if (!function_5ea5a722c499078f(team)) {
            function_d8625665d55f3941(team, 1);
        }
        if (level.var_a4840e7885ef58e > 0) {
            if (!function_5ea5a722c499078f(team)) {
                player = getteamdata(team, "players")[0];
                if (isdefined(player)) {
                    activity = function_ebe9b1e455d46450(player);
                    if (isdefined(activity)) {
                        activity function_3faa04ef514a5fc4(team);
                    }
                }
            }
        }
        if (!level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].active) {
            function_3fd9d5652f4642ad(team);
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fd3
// Size: 0xb6
function private function_3262f80d2b114587(team) {
    /#
        assertex(!level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].active, "Attempted to assign a DMZ activity to a team already on an activity.");
    #/
    level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].active = 1;
    function_675059586a84fa06(team, "onTeamStart");
    self.var_b7718b6e41108129[0].started = 1;
    task = function_73fd6fe2488e3ebf(self, team);
    function_b7bbe29ed551ee90(task.var_30e8a65cff941c7a, function_f8cd22fb229f4138(self.var_723b8f7cb71ceb11), team);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4090
// Size: 0x46
function private function_6e31cc7110b536fd(team) {
    level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].active = 1;
    self.var_b7718b6e41108129[0].started = 1;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40dd
// Size: 0xc9
function function_bf253015ff42711(player, team) {
    /#
        assert(function_5ea5a722c499078f(team), "Attempting to assign a player an activity that doesn't exist.");
    #/
    activity = function_b1d0568d9066a2ce(team);
    activity function_d36579bab450735a(player, team);
    foreach (task in activity.var_b7718b6e41108129) {
        if (isdefined(task.funcs["onPlayerJoined"])) {
            task thread [[ task.funcs["onPlayerJoined"] ]](player);
        }
    }
    activity function_37db4c1f01e80f2f(team);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41ad
// Size: 0x31
function function_90603f537224e960() {
    task_ended();
    if (isdefined(self.funcs["onForceEnd"])) {
        self thread [[ self.funcs["onForceEnd"] ]]();
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e5
// Size: 0x34
function function_8d4a1199159f7d52(team) {
    if (isdefined(self.funcs["onCancel"])) {
        self thread [[ self.funcs["onCancel"] ]](team);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4220
// Size: 0x1dd
function function_b2aef739a3653a70(player, team) {
    /#
        assert(function_5ea5a722c499078f(team), "Attempting to remove an activity from a player who does not have one.");
    #/
    activity = function_b1d0568d9066a2ce(team);
    function_6d93be335873296e(player);
    if (isdefined(activity.var_b7718b6e41108129[0].icon)) {
        activity.var_b7718b6e41108129[0] function_401535e3fa9e171c(player);
    } else if (isdefined(activity.var_b7718b6e41108129[0].objidnum)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(activity.var_b7718b6e41108129[0].objidnum, player);
    }
    foreach (task in activity.var_b7718b6e41108129) {
        if (isdefined(task.funcs["onPlayerRemoved"])) {
            task thread [[ task.funcs["onPlayerRemoved"] ]](player);
        }
        if (istrue(level.var_1a2b600a06ec21f4.var_b0c3d102a683d3ee)) {
            player dlog_recordplayerevent("dlog_event_exgm_player_mission_complete", [0:"mission_ref", 1:task.ref, 2:"completion_state", 3:"failed - task cancelled"]);
        }
    }
    if (isdefined(activity.var_972eddbdcf30619c)) {
        activity.var_972eddbdcf30619c = array_remove(activity.var_972eddbdcf30619c, player);
    }
    if (!activity.var_b7718b6e41108129[0] function_c251e35450891f3()) {
        activity.var_b7718b6e41108129[0] function_8d4a1199159f7d52(team);
    } else {
        activity function_37db4c1f01e80f2f(team);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4404
// Size: 0x9b
function function_513d7f67ab57c97(var_620cf537a8109af8, var_580e2b2cd55b4b53) {
    player = self;
    if (istrue(player.var_38f4f1b1c66513f1)) {
        return 0;
    }
    player.var_38f4f1b1c66513f1 = 1;
    var_620cf537a8109af8 function_b2aef739a3653a70(player, player.team);
    wait(3);
    player playlocalsound("mp_dmz_phone_pickup");
    var_580e2b2cd55b4b53 function_3faa04ef514a5fc4(player.team, undefined, player, 1);
    var_580e2b2cd55b4b53 function_6e31cc7110b536fd(player.team);
    player.var_38f4f1b1c66513f1 = 0;
    return 1;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a7
// Size: 0x76
function function_22e206cc7ae5dbfd(player, oldteam, newteam) {
    if (function_5ea5a722c499078f(oldteam)) {
        function_b2aef739a3653a70(player, oldteam);
    }
    function_6d93be335873296e(player);
    var_3dd2c57ac95be94f = function_5ea5a722c499078f(newteam);
    if (function_5ea5a722c499078f(newteam)) {
        function_bf253015ff42711(player, newteam);
    }
    function_64623e2ff7409f39(player, !var_3dd2c57ac95be94f || istrue(player.var_45b8e84de48bb89f));
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4524
// Size: 0x3c5
function function_3faa04ef514a5fc4(team, var_d3ddded84427dd1c, var_27e49251bb3376ea, var_21d04ce2f9146315) {
    if (function_5ea5a722c499078f(team) && !istrue(var_21d04ce2f9146315)) {
        return;
    }
    if (!isdefined(var_d3ddded84427dd1c)) {
        var_d3ddded84427dd1c = 0;
    }
    if (isdefined(self.var_5ea1be154aeb609b)) {
        level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38 = array_remove(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38, self.var_5ea1be154aeb609b);
        self.var_5ea1be154aeb609b setscriptablepartstate("brloot_activity_starter", "hidden");
    }
    if (istrue(level.var_9fb5000ae38dcf7f)) {
        foreach (player in getteamdata(team, "players")) {
            player setclientomnvar("ui_dmz_missions_completed", 1);
        }
    }
    if (isdefined(var_27e49251bb3376ea) && !namespace_36f464722d326bbe::isaigameparticipant(var_27e49251bb3376ea)) {
        function_d8625665d55f3941(team, 0);
        namespace_446fc987a980892f::function_2c722a2ef9574e87(getteamdata(team, "players"), self.name, 75);
    }
    self.teams[team] = var_d3ddded84427dd1c;
    if (!array_contains(self.var_b7718b6e41108129[var_d3ddded84427dd1c].teams, team)) {
        self.var_b7718b6e41108129[var_d3ddded84427dd1c].teams[self.var_b7718b6e41108129[var_d3ddded84427dd1c].teams.size] = team;
    }
    level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24 = array_add(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24, self.id);
    self.var_7ca287a82f54e4f6 = var_27e49251bb3376ea;
    if (isdefined(var_27e49251bb3376ea) && !namespace_36f464722d326bbe::isaigameparticipant(var_27e49251bb3376ea)) {
        thread function_415205c2b0df5476(team, var_27e49251bb3376ea);
    }
    foreach (task in self.var_b7718b6e41108129) {
        if (isdefined(task.funcs["onTeamAssigned"])) {
            task thread [[ task.funcs["onTeamAssigned"] ]](team);
        }
        if (isdefined(var_27e49251bb3376ea) && isdefined(task.funcs["onPlayerAssigned"]) && isdefined(task.funcs["onPlayerJoined"])) {
            task function_ecef3f5e98fb83c1(team, var_27e49251bb3376ea);
        }
        if (istrue(level.var_1a2b600a06ec21f4.var_b0c3d102a683d3ee)) {
            foreach (player in getteamdata(team, "players")) {
                player dlog_recordplayerevent("dlog_event_exgm_player_mission_assign", [0:"mission_ref", 1:task.ref]);
            }
        }
    }
    var_4ab01941798b314c = undefined;
    if (isdefined(self.var_5ea1be154aeb609b) && isdefined(self.var_5ea1be154aeb609b.var_4ab01941798b314c)) {
        var_4ab01941798b314c = self.var_5ea1be154aeb609b.var_4ab01941798b314c;
    }
    if (isdefined(var_27e49251bb3376ea)) {
        namespace_8361bad7391de074::function_a9f8fa06a358585b(team, self.name, 0, var_4ab01941798b314c);
    }
    namespace_27c74152ccb91331::function_44cdb18eb18593de(team, self);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f0
// Size: 0x211
function function_ecef3f5e98fb83c1(teamname, player) {
    task = self;
    var_f1c8753e7038e53f = task.teams.size == 1;
    var_f9d50b9d04af1c7f = task.players.size == 0;
    var_404766db14e343f = 0;
    var_96710dfe8fa22d93 = 0;
    size = level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_388b0969ae3525f2.size;
    if (var_f9d50b9d04af1c7f) {
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_388b0969ae3525f2[size] = task.activity;
        task thread [[ task.funcs["onPlayerAssigned"] ]](teamname, player);
        return;
    }
    if (task.teams.size >= 0) {
        foreach (var_6d018f66068582c5 in task.players) {
            if (!isdefined(var_6d018f66068582c5) || !isdefined(var_6d018f66068582c5.team)) {
                continue;
            }
            if (player.team == var_6d018f66068582c5.team) {
                var_404766db14e343f = 1;
                break;
            }
        }
        if (!var_404766db14e343f && !var_f1c8753e7038e53f) {
            var_96710dfe8fa22d93 = 1;
        }
    }
    if (var_404766db14e343f) {
        task thread [[ task.funcs["onPlayerJoined"] ]](player);
        return;
    }
    if (!var_f9d50b9d04af1c7f && var_96710dfe8fa22d93) {
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_388b0969ae3525f2[size] = task.activity;
        task thread [[ task.funcs["onPlayerAssigned"] ]](teamname, player);
        return;
    }
    /#
        assertex(0, "Per player task assignment failed!");
    #/
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b08
// Size: 0xb8
function private function_d36579bab450735a(player, team) {
    if (istrue(level.var_427f173fa29d4e80) && !istrue(level.var_1e0470dbb6cf1859)) {
        task = function_73fd6fe2488e3ebf(self, team);
        function_b43e9536b7e60884(player, task.var_30e8a65cff941c7a);
    }
    if (isdefined(self.var_b7718b6e41108129[0].icon)) {
        self.var_b7718b6e41108129[0] function_fbf23ae15945ee5a(player);
    } else if (isdefined(self.var_b7718b6e41108129[0].objidnum)) {
        objective_showtoplayersinmask(self.var_b7718b6e41108129[0].objidnum);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bc7
// Size: 0x28e
function private function_415205c2b0df5476(team, var_27e49251bb3376ea) {
    info = level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team];
    info.trackingindex = info.trackingindex + 1;
    info.trackingindex = ter_op(info.trackingindex >= level.var_fc3962361e2033a9, 0, info.trackingindex);
    foreach (index, id in info.var_6299084ae61b350a) {
        if (!isdefined(level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[id])) {
            info.trackingindex = index;
        }
    }
    if (isdefined(info.var_6299084ae61b350a[info.trackingindex])) {
        var_f33dedf5e2dc3021 = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[info.var_6299084ae61b350a[info.trackingindex]];
        if (isdefined(var_f33dedf5e2dc3021)) {
            if (level.var_d1404cd77b68f22e == 0) {
                return;
            }
            if (isdefined(self.var_b7718b6e41108129[0].icon)) {
                var_f33dedf5e2dc3021.var_b7718b6e41108129[0] function_743033b2e6c2d930(team);
            } else if (isdefined(self.var_b7718b6e41108129[0].objidnum)) {
                var_f33dedf5e2dc3021.var_b7718b6e41108129[0] function_e8d8df3da4392f0f(team);
            }
        }
    }
    info.var_6299084ae61b350a[info.trackingindex] = self.id;
    if (istrue(level.var_427f173fa29d4e80) && !istrue(level.var_1e0470dbb6cf1859)) {
        task = function_73fd6fe2488e3ebf(self, team);
        function_b7bbe29ed551ee90(task.var_30e8a65cff941c7a, function_f8cd22fb229f4138(self.var_723b8f7cb71ceb11), team);
    }
    if (!isdefined(self.var_b7718b6e41108129[0].icon) && !isdefined(self.var_b7718b6e41108129[0].objidnum)) {
        return;
    }
    self.var_b7718b6e41108129[0] endon("task_ended");
    self.var_b7718b6e41108129[0] function_ced2dbd3ba98d2(team, var_27e49251bb3376ea, 1);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e5c
// Size: 0x10e
function function_ced2dbd3ba98d2(team, var_27e49251bb3376ea, var_8064f574a628c5ee) {
    wait(2.4);
    if (isdefined(self.icon)) {
        function_a92867e16c21da22(team);
    } else if (isdefined(self.objidnum)) {
        function_30c89ac91cfae119(team);
    }
    if (!isdefined(var_27e49251bb3376ea)) {
        return;
    }
    if (istrue(var_8064f574a628c5ee)) {
        wait(2);
        if (isdefined(self.objidnum) || isdefined(self.icon)) {
            origin = self.origin;
            if (isdefined(self.var_7919c8f3a10feb86)) {
                origin = self.var_7919c8f3a10feb86;
            }
            if (isdefined(self.curorigin)) {
                origin = self.curorigin;
            }
            if (isdefined(self.offset3d)) {
                origin = origin + self.offset3d;
            }
            var_23ebe333d480b214 = function_53c4c53197386572(self.icon, self.objidnum);
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_23ebe333d480b214, 0);
            var_27e49251bb3376ea namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, origin, var_23ebe333d480b214);
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f71
// Size: 0x1b5
function private function_3fd9d5652f4642ad(team) {
    if (!function_5ea5a722c499078f(team)) {
        return;
    }
    var_dad9c3e8b724d629 = getteamdata(team, "players")[0];
    if (!isdefined(var_dad9c3e8b724d629)) {
        return;
    }
    var_d7ad79a8e4f34d8d = level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24[0];
    closestdist = 100000000;
    foreach (id in level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24) {
        var_72cb45d542fa0766 = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[id].origin;
        dist = distancesquared(var_72cb45d542fa0766, var_dad9c3e8b724d629.origin);
        /#
            assertex(isdefined(dist), "Activity has no origin: " + level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[id].var_b7718b6e41108129[0].ref);
        #/
        if (dist < closestdist) {
            closestdist = dist;
            var_d7ad79a8e4f34d8d = id;
        }
    }
    if (!array_contains(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_6299084ae61b350a, var_d7ad79a8e4f34d8d)) {
        level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[var_d7ad79a8e4f34d8d] thread function_415205c2b0df5476(team, var_dad9c3e8b724d629);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x512d
// Size: 0x1a8
function function_ca85c43247ab6279() {
    if (isdefined(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[self.team].var_83abcb9b3a5dbe24)) {
        foreach (var_3f96767f60a1d2c in level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[self.team].var_83abcb9b3a5dbe24) {
            activity = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[var_3f96767f60a1d2c];
            foreach (task in activity.var_b7718b6e41108129) {
                if (isdefined(task.funcs["onExtract"])) {
                    task thread [[ task.funcs["onExtract"] ]](self);
                }
            }
            if (istrue(level.var_1a2b600a06ec21f4.var_b0c3d102a683d3ee) && function_5ea5a722c499078f(self.team) && isdefined(activity)) {
                self dlog_recordplayerevent("dlog_event_exgm_player_mission_complete", [0:"mission_ref", 1:activity.var_b7718b6e41108129[0].ref, 2:"completion_state", 3:"failed - extracted"]);
            }
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x52dc
// Size: 0xa5
function private function_aebc13d5b1e8d58d() {
    activity = spawnstruct();
    activity.var_46334d99742b3bf3 = 0;
    activity.id = function_a4316795af2639f3();
    activity.teams = [];
    activity.var_b7718b6e41108129 = [];
    activity.var_8573076fa89267a1 = 2500;
    activity.var_8d3a05143c7a1142 = activity.var_8573076fa89267a1 * activity.var_8573076fa89267a1;
    activity.origin = (0, 0, 0);
    activity.var_75ded47b03386e57 = 0;
    return activity;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5389
// Size: 0x6f
function private function_a4316795af2639f3() {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_8d03da3910129d74)) {
        level.var_1b7407dffe81e6e8.var_8d03da3910129d74 = 0;
    } else {
        level.var_1b7407dffe81e6e8.var_8d03da3910129d74 = level.var_1b7407dffe81e6e8.var_8d03da3910129d74 + 1;
    }
    return level.var_1b7407dffe81e6e8.var_8d03da3910129d74;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5400
// Size: 0x16d
function private function_4a6adeb5f340fcc8() {
    level endon("game_ended");
    while (!isdefined(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38)) {
        waitframe();
    }
    var_b30b3c96c21fb5d8 = 160000;
    function_ae35ae0fa34731b8(var_b30b3c96c21fb5d8);
    while (level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38.size > 0) {
        foreach (player in level.players) {
            if (isdefined(player) && isdefined(player.origin) && isdefined(player.team) && isalive(player) && (!function_5ea5a722c499078f(player.team) || istrue(player.var_45b8e84de48bb89f))) {
                var_30a99625b9f5d98c = function_c1ac85f526f2b937(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38, player.origin, 400);
                if (isdefined(var_30a99625b9f5d98c)) {
                    player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_dmz_activity_starter_activity_type", var_30a99625b9f5d98c.var_dabe413c9c6c48f4);
                    player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_dmz_activity_starter_poi_name", var_30a99625b9f5d98c.var_e995bb533046188d);
                    namespace_210d6dd43cfaf195::function_604a7fc1fb4b6dfd(var_30a99625b9f5d98c, player);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5574
// Size: 0xf2
function private function_ae35ae0fa34731b8(mindistancesq) {
    foreach (var_5ea1be154aeb609b in level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38) {
        foreach (var_81a6258c743174db in level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38) {
            if (var_5ea1be154aeb609b == var_81a6258c743174db) {
                continue;
            }
            if (distancesquared(var_5ea1be154aeb609b.origin, var_81a6258c743174db.origin) <= mindistancesq) {
                /#
                    println("<unknown string>");
                #/
            }
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x566d
// Size: 0x45f
function private function_84ed600d2bd001ad() {
    level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38 = [];
    var_d48061d99a12dd19 = [];
    foreach (activity in level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24) {
        if (!isdefined(var_d48061d99a12dd19[activity.type])) {
            var_d48061d99a12dd19[activity.type] = [];
        }
        var_d48061d99a12dd19[activity.type][var_d48061d99a12dd19[activity.type].size] = activity;
    }
    var_b1e6cfea54837661 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_activity_starter");
    var_b1e6cfea54837661 = function_879faf1bea33f06(var_b1e6cfea54837661);
    var_202f4b66718ab8bd = [];
    foreach (var_5ea1be154aeb609b in var_b1e6cfea54837661) {
        type = getsubstr(var_5ea1be154aeb609b.type, 24);
        if (!isdefined(var_202f4b66718ab8bd[type])) {
            var_202f4b66718ab8bd[type] = [];
        }
        var_202f4b66718ab8bd[type][var_202f4b66718ab8bd[type].size] = var_5ea1be154aeb609b;
    }
    foreach (type, var_8d65040262935f78 in var_d48061d99a12dd19) {
        if (!isdefined(var_202f4b66718ab8bd[type])) {
            /#
                assertmsg("Activity starter of type " + type + " is not assigned properly");
            #/
        } else {
            foreach (activity in var_8d65040262935f78) {
                var_112e955ba5db3f2b = squared(level.var_1b7407dffe81e6e8.var_b2f15037287a033a[activity.name].var_2ce8f82ad71eb571);
                var_b03ad0ba8c8849ea = squared(level.var_1b7407dffe81e6e8.var_b2f15037287a033a[activity.name].var_7a62616965ed6a2e);
                var_5ea1be154aeb609b = function_368cfedcf00ab6f2(var_202f4b66718ab8bd[type], activity.origin, var_112e955ba5db3f2b, var_b03ad0ba8c8849ea);
                if (isdefined(var_5ea1be154aeb609b)) {
                    var_202f4b66718ab8bd[type] = array_remove(var_202f4b66718ab8bd[type], var_5ea1be154aeb609b);
                    var_5ea1be154aeb609b.var_d855aa87b99592a = int(clamp(distance(activity.origin, var_5ea1be154aeb609b.origin) / 200, 1, 100));
                    var_5ea1be154aeb609b.var_dabe413c9c6c48f4 = function_f92c1a3d19210ccd(activity.name);
                    var_5ea1be154aeb609b.var_e995bb533046188d = namespace_37f0fb6355a4618a::function_80cdaea4bd3ecf70(namespace_37f0fb6355a4618a::function_6cc445c02b5effac(activity.origin, undefined, undefined, 1));
                    var_5ea1be154aeb609b.var_4ab01941798b314c = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_5ea1be154aeb609b.origin, 0, 0, 0);
                    var_5ea1be154aeb609b.activity = activity;
                    activity.var_5ea1be154aeb609b = var_5ea1be154aeb609b;
                    var_5ea1be154aeb609b function_5220f38b5239eac8();
                    level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38[level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38.size] = var_5ea1be154aeb609b;
                    /#
                        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", activity.name, "<unknown string>", "<unknown string>", undefined, activity.id, activity.poi, var_5ea1be154aeb609b.origin);
                        if (getdvarint(@"hash_458fa5763ddccd6b", 0) == 1) {
                            line(var_5ea1be154aeb609b.origin, activity.origin, (0, 0, 1), 1, 0, 20000);
                            line(var_5ea1be154aeb609b.origin, var_5ea1be154aeb609b.origin + (0, 0, 3000), (1, 0, 1), 1, 0, 20000);
                        }
                    #/
                }
            }
        }
    }
    level notify("activitymanager_initActivityStarters_done");
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ad3
// Size: 0x3f
function function_5220f38b5239eac8() {
    if (istrue(level.var_1b7407dffe81e6e8.var_d6d000f64c923fd6)) {
        self setscriptablepartstate("brloot_activity_starter", "visible");
    } else {
        self setscriptablepartstate("brloot_activity_starter", "visible_no_icon");
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b19
// Size: 0x26
function function_66da9365bbfea8b7() {
    level notify("tablethide_kill_callout_" + self.origin);
    self setscriptablepartstate("brloot_activity_starter", "hidden");
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b46
// Size: 0x176
function private function_879faf1bea33f06(locations) {
    namespace_58dcf42cf567f34f::function_1a037d5cd64dc892();
    validlocations = [];
    var_229dd59111a2fa54 = getdvarint(@"hash_b54c660e3e9515b2", 1000);
    var_aa5a3885f8d284dc = var_229dd59111a2fa54 * var_229dd59111a2fa54;
    foreach (location in locations) {
        if ((!namespace_7789f919216d38a2::radiation_isInit() || !namespace_7789f919216d38a2::function_cdcab1374db7f007(location.origin)) && namespace_37f0fb6355a4618a::function_9c93e67f90980177(location.origin) && (!isdefined(level.var_f64c6ef6f688a407) || level.var_f64c6ef6f688a407.size == 0 || distance(sortbydistance(level.var_f64c6ef6f688a407, location.origin)[0].origin, location.origin) > 350) && (validlocations.size == 0 || distancesquared(sortbydistance(validlocations, location.origin)[0].origin, location.origin) > var_aa5a3885f8d284dc) && !namespace_9823ee6035594d67::function_f0201365c368cf88(location.origin)) {
            validlocations[validlocations.size] = location;
        }
    }
    return validlocations;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5cc4
// Size: 0xd6
function private function_368cfedcf00ab6f2(structs, origin, mindistancesq, var_205a760f75f8e9d6) {
    var_2b0591f184ae430e = undefined;
    var_6e51c4622aa0c30 = 999999999;
    foreach (struct in structs) {
        dist = distancesquared(struct.origin, origin);
        diff = abs(dist - var_205a760f75f8e9d6);
        if (diff < var_6e51c4622aa0c30 && dist > mindistancesq) {
            if (var_6e51c4622aa0c30 < 150) {
                return struct;
            }
            var_2b0591f184ae430e = struct;
            var_6e51c4622aa0c30 = diff;
        }
    }
    return var_2b0591f184ae430e;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da2
// Size: 0x301
function function_ebe9b1e455d46450(player) {
    if (!isdefined(level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24) || level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24.size == 0) {
        return undefined;
    }
    if (!isdefined(level.var_1b7407dffe81e6e8.var_786fda809023e24a)) {
        function_4b4f24e571cb5af9();
    }
    exfils = getteamdata(player.team, "exfils");
    /#
        assert(isdefined(exfils), "activity_getActivityForPlayer: Didn't find exfils for: " + player.team);
    #/
    if (istrue(level.var_1a2b600a06ec21f4.var_b0c3d102a683d3ee)) {
        var_c273b344396d4890 = [];
        foreach (exfil in exfils) {
            if (isdefined(exfil) && !isdefined(exfil.origin) && isdefined(exfil.ent)) {
                var_c273b344396d4890[var_c273b344396d4890.size] = exfil.ent;
            }
        }
        if (var_c273b344396d4890.size == exfils.size) {
            exfils = var_c273b344396d4890;
        } else {
            /#
                assert(0, "Exfils for" + player.name + " invalid!");
            #/
        }
    }
    playerorigin = player.origin;
    var_2a73d37d4f624825 = undefined;
    var_a96c0ad7583e3d = undefined;
    var_b6b0b797c6ef02e2 = 0;
    if (exfils.size > 0) {
        var_2a73d37d4f624825 = getclosest(playerorigin, exfils).origin;
        var_a96c0ad7583e3d = var_2a73d37d4f624825 - playerorigin;
        var_b6b0b797c6ef02e2 = distance(var_2a73d37d4f624825, playerorigin) > 2000;
    }
    var_c56664807b194adb = sortbydistance(level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24, playerorigin);
    var_7f767d0b39d7e455 = [];
    var_32f9bd0ca63c013e = 0;
    for (index = 0; index < var_c56664807b194adb.size && var_32f9bd0ca63c013e < 10; index++) {
        activity = var_c56664807b194adb[index];
        if (array_contains_key(activity.teams, player.team)) {
            continue;
        }
        var_43697de9671bb892 = activity.origin;
        score = 0;
        score = score + function_5f083fb42518423c(playerorigin, var_43697de9671bb892);
        if (isdefined(var_2a73d37d4f624825)) {
            score = score + function_2b921d0e6bc242e1(playerorigin, var_2a73d37d4f624825);
        }
        if (var_b6b0b797c6ef02e2) {
            score = score + function_52bb8aec483e159a(playerorigin, var_43697de9671bb892, var_a96c0ad7583e3d);
        }
        var_32f9bd0ca63c013e++;
        var_7f767d0b39d7e455[index] = score;
    }
    if (var_32f9bd0ca63c013e <= 0) {
        return undefined;
    }
    var_7f767d0b39d7e455 = function_6c2c22972f70be38(var_7f767d0b39d7e455);
    var_e98acf9fa9d0767d = function_76e8e9f07068ad3(var_7f767d0b39d7e455);
    /#
        function_6845df1d2d8832b8(var_c56664807b194adb, var_7f767d0b39d7e455, var_e98acf9fa9d0767d);
    #/
    return var_c56664807b194adb[var_e98acf9fa9d0767d];
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60ab
// Size: 0xc3
function private function_4b4f24e571cb5af9() {
    var_786fda809023e24a = spawnstruct();
    var_786fda809023e24a.var_6f1d78292f73ee46 = getdvarfloat(@"hash_c508e27b819d49b2", 0.15);
    var_786fda809023e24a.var_5845ba08c276f11 = getdvarfloat(@"hash_58211513a78506af", 0.3);
    var_786fda809023e24a.var_f9cff5c6714553f7 = getdvarfloat(@"hash_c321cda536bc126e", 0.3);
    var_786fda809023e24a.var_d6acb1cbf4657382 = getdvarfloat(@"hash_7cdac9442bc68fb2", 0.25);
    var_786fda809023e24a.var_7c0a2bb952bf39c = getdvarfloat(@"hash_f88016cb082a72ec", 0.5);
    level.var_1b7407dffe81e6e8.var_786fda809023e24a = var_786fda809023e24a;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6175
// Size: 0x9f
function private function_5f083fb42518423c(playerorigin, var_43697de9671bb892) {
    dist = distance(var_43697de9671bb892, playerorigin);
    var_74f7841a848c74df = (15000 - dist) / 15000;
    var_74f7841a848c74df = var_74f7841a848c74df * level.var_1b7407dffe81e6e8.var_786fda809023e24a.var_6f1d78292f73ee46;
    var_bb7a6b74942c715e = (40000 - dist) / 40000;
    var_bb7a6b74942c715e = var_bb7a6b74942c715e * level.var_1b7407dffe81e6e8.var_786fda809023e24a.var_5845ba08c276f11;
    return max(0, var_74f7841a848c74df) + max(0, var_bb7a6b74942c715e);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x621c
// Size: 0x5f
function private function_2b921d0e6bc242e1(playerorigin, var_2a73d37d4f624825) {
    dist = distance(var_2a73d37d4f624825, playerorigin);
    var_7a73315d7ca78155 = (15000 - dist) / 15000;
    return max(0, var_7a73315d7ca78155 * level.var_1b7407dffe81e6e8.var_786fda809023e24a.var_f9cff5c6714553f7);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6283
// Size: 0x68
function private function_52bb8aec483e159a(playerorigin, var_43697de9671bb892, var_a96c0ad7583e3d) {
    var_76c8be7626613ca = var_43697de9671bb892 - playerorigin;
    angle = math::anglebetweenvectors(var_76c8be7626613ca, var_a96c0ad7583e3d);
    return max(0, (1 - angle / 180) * level.var_1b7407dffe81e6e8.var_786fda809023e24a.var_d6acb1cbf4657382);
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x62f3
// Size: 0x164
function private function_6c2c22972f70be38(var_5201ad92c6e26086) {
    if (var_5201ad92c6e26086.size <= 1) {
        return var_5201ad92c6e26086;
    }
    var_7be91f1a817c1e47 = 100;
    maxscore = -100;
    foreach (score in var_5201ad92c6e26086) {
        if (score < var_7be91f1a817c1e47) {
            var_7be91f1a817c1e47 = score;
        }
        if (score > maxscore) {
            maxscore = score;
        }
    }
    range = maxscore - var_7be91f1a817c1e47;
    if (range <= 0) {
        foreach (key, score in var_5201ad92c6e26086) {
            var_5201ad92c6e26086[key] = 1;
        }
    } else {
        foreach (key, score in var_5201ad92c6e26086) {
            var_c715cb5bedb6bc8e = max(0, (score - var_7be91f1a817c1e47) / range);
            if (var_c715cb5bedb6bc8e < level.var_1b7407dffe81e6e8.var_786fda809023e24a.var_7c0a2bb952bf39c) {
                var_c715cb5bedb6bc8e = 0;
            }
            var_5201ad92c6e26086[key] = var_c715cb5bedb6bc8e;
        }
    }
    return var_5201ad92c6e26086;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x645f
// Size: 0xc1
function private function_76e8e9f07068ad3(var_5201ad92c6e26086) {
    totalscore = 0;
    foreach (score in var_5201ad92c6e26086) {
        totalscore = totalscore + score;
    }
    randomval = randomfloat(totalscore);
    foreach (key, score in var_5201ad92c6e26086) {
        randomval = randomval - score;
        if (randomval <= 0) {
            return key;
        }
    }
    return key;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x6528
// Size: 0xeb
function private function_6845df1d2d8832b8(var_c56664807b194adb, var_7f767d0b39d7e455, var_e98acf9fa9d0767d) {
    /#
        if (getdvarint(@"hash_e0b8b49a793faf58", 0) == 1) {
            for (index = 0; index < var_c56664807b194adb.size; index++) {
                var_38c35d880776e865 = 1000;
                color = (1, 0, 0);
                activity = var_c56664807b194adb[index];
                if (isdefined(var_7f767d0b39d7e455[index])) {
                    var_38c35d880776e865 = var_38c35d880776e865 + 4000 * var_7f767d0b39d7e455[index];
                    if (index == var_e98acf9fa9d0767d) {
                        color = (0, 1, 0);
                    } else if (var_7f767d0b39d7e455[index] > 0) {
                        color = (0, 0, 1);
                    }
                }
                line(activity.origin, activity.origin + (0, 0, var_38c35d880776e865), color, 1, 0, 800);
            }
        }
    #/
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661a
// Size: 0xad
function function_57ac6111c7db410f(struct, player) {
    instance = struct.instance;
    activity = instance.activity;
    level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38 = array_remove(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38, instance);
    instance setscriptablepartstate("brloot_activity_starter", "hidden");
    player playlocalsound("mp_dmz_phone_pickup");
    player function_9be29ad72a155ee1();
    if (isdefined(activity)) {
        activity function_3faa04ef514a5fc4(player.team, undefined, player);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66ce
// Size: 0x5d
function function_3ab4a84501caacde(container, player) {
    container notify("stopRinging");
    container function_d062142f367ed7b2();
    player function_9be29ad72a155ee1("intel_put_usb_in_tablet");
    activity = function_ebe9b1e455d46450(player);
    if (isdefined(activity)) {
        activity function_3faa04ef514a5fc4(player.team, undefined, player);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6732
// Size: 0x6d
function function_d8625665d55f3941(team, show) {
    foreach (player in getteamdata(team, "players")) {
        function_64623e2ff7409f39(player, show);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a6
// Size: 0xae
function function_64623e2ff7409f39(player, show) {
    if (isdefined(level.var_1b7407dffe81e6e8) && isdefined(level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38) && isdefined(player)) {
        foreach (var_b65b043741750c60 in level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38) {
            if (istrue(show)) {
                var_b65b043741750c60 enablescriptableplayeruse(player);
            } else {
                var_b65b043741750c60 disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x685b
// Size: 0x98
function function_5ea5a722c499078f(team) {
    return isdefined(team) && isdefined(level.var_1b7407dffe81e6e8) && isdefined(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1) && isdefined(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team]) && isdefined(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24) && level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24.size > 0;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68fb
// Size: 0x4b
function function_37416c14e9703fb6(player) {
    if (!function_5ea5a722c499078f(player.team)) {
        return;
    }
    activity = function_b1d0568d9066a2ce(player.team);
    if (isdefined(activity)) {
        return activity function_43c0a14bae1aa483(player);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x694d
// Size: 0xcb
function function_a2dcdcd112310e33(team, fortress) {
    if (function_5ea5a722c499078f(team)) {
        foreach (id in level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team].var_83abcb9b3a5dbe24) {
            activity = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[id];
            if (isdefined(activity) && isdefined(activity.fortress) && activity.fortress == fortress) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a20
// Size: 0x95
function function_40143c869e13213(teamname, dialog) {
    var_cb3339ece72dbdeb = game["dialog"][dialog];
    /#
        assertex(isdefined(var_cb3339ece72dbdeb), "dmzActivity_playDialogForTeam: Not given dialogue defined in game["dialog"]" + dialog);
    #/
    foreach (teammember in getteamdata(teamname, "players")) {
        teammember queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6abc
// Size: 0x6a
function function_73fd6fe2488e3ebf(activity, team) {
    if (isdefined(activity) && isdefined(activity.var_b7718b6e41108129) && isdefined(activity.teams) && array_contains_key(activity.teams, team)) {
        return activity.var_b7718b6e41108129[activity.teams[team]];
    }
    return undefined;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b2e
// Size: 0x51
function private function_675059586a84fa06(team, func) {
    task = function_73fd6fe2488e3ebf(self, team);
    if (isdefined(task) && isdefined(task.funcs[func])) {
        task thread [[ task.funcs[func] ]](team);
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b86
// Size: 0x46
function function_43c0a14bae1aa483(player) {
    if (isdefined(self.teams[player.team])) {
        return self.var_b7718b6e41108129[self.teams[player.team]];
    }
    return undefined;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bd4
// Size: 0x75
function private function_b1d0568d9066a2ce(team) {
    info = level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[team];
    trackingid = info.var_6299084ae61b350a[info.trackingindex];
    var_95c69228e0685e73 = level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[trackingid];
    if (isdefined(var_95c69228e0685e73)) {
        return var_95c69228e0685e73;
    }
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c50
// Size: 0x72
function private function_c251e35450891f3() {
    foreach (team in self.teams) {
        players = getteamdata(team, "players");
        if (players.size > 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cca
// Size: 0x154
function function_ad20469c1815a7c7(team, var_693b800e6cd7b21c) {
    task = self;
    var_ae2f1138c7599b30 = [];
    players = [];
    foreach (player in task.players) {
        if (!isdefined(player) || !isdefined(player.team)) {
            continue;
        }
        var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
        if (var_aa128e29d7c10074 && !var_693b800e6cd7b21c) {
            continue;
        }
        var_5c5d5d857ce5fd60 = array_contains(task.teams, team);
        var_87d653f5e64be2d7 = player.team == team;
        var_33a0c14b002fd190 = array_contains(task.teams, player.team);
        if (isdefined(team) && !var_5c5d5d857ce5fd60) {
            continue;
        }
        if (isdefined(team) && !var_87d653f5e64be2d7) {
            continue;
        }
        if (!isdefined(team) && !var_33a0c14b002fd190) {
            continue;
        }
        players[players.size] = player;
    }
    return players;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e26
// Size: 0xa0
function function_133eba493f1f3636(team) {
    if (!isdefined(self.var_972eddbdcf30619c)) {
        self.var_972eddbdcf30619c = [];
    }
    numplayers = 0;
    var_e2b2bbd9e6539f11 = getSquadmates(team, undefined, 1);
    foreach (player in var_e2b2bbd9e6539f11) {
        if (array_contains(self.var_972eddbdcf30619c, player)) {
            numplayers++;
        }
    }
    return numplayers;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ece
// Size: 0x108
function function_37db4c1f01e80f2f(team) {
    if (!isdefined(self.var_972eddbdcf30619c)) {
        self.var_972eddbdcf30619c = [];
    }
    var_e2b2bbd9e6539f11 = getSquadmates(team, undefined, 1);
    if (function_133eba493f1f3636(team) == var_e2b2bbd9e6539f11.size) {
        if (!istrue(self.var_b7718b6e41108129[0].var_bb74e27bbadcc48b)) {
            level thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("mission_cancel_complete", team, 1);
        }
        self.var_b7718b6e41108129[0] function_8d4a1199159f7d52(team);
        foreach (player in var_e2b2bbd9e6539f11) {
            player setclientomnvar("ui_br_contract_cancellation_state", 0);
        }
        if (!istrue(self.var_b7718b6e41108129[0].var_2fa3a0c38dfce74b)) {
            namespace_d696adde758cbe79::showDMZSplash("dmz_contract_cancelled_" + self.type, var_e2b2bbd9e6539f11);
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fde
// Size: 0x1b3
function function_15ab6babbe46e018() {
    if (isdefined(self) && isdefined(self.team) && function_5ea5a722c499078f(self.team)) {
        activity = function_b1d0568d9066a2ce(self.team);
        if (!isdefined(activity)) {
            /#
                assertmsg("activity_teamHasAMission returned true but the activity is undefined!");
            #/
            return;
        }
        if (!isdefined(activity.var_972eddbdcf30619c)) {
            activity.var_972eddbdcf30619c = [];
        }
        if (array_contains(activity.var_972eddbdcf30619c, self)) {
            activity function_37db4c1f01e80f2f(self.team);
            return;
        }
        activity.var_972eddbdcf30619c[activity.var_972eddbdcf30619c.size] = self;
        if (!activity function_37db4c1f01e80f2f(self.team)) {
            var_607da387f3617ed1 = getSquadmates(self.team, undefined, 1);
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("mission_cancel_request", array_remove_array(var_607da387f3617ed1, activity.var_972eddbdcf30619c));
            var_7aa06be6f06bef26 = activity function_133eba493f1f3636(self.team);
            totalplayers = var_607da387f3617ed1.size;
            var_587ec5b2038407de = var_7aa06be6f06bef26 | totalplayers << 3;
            foreach (player in var_607da387f3617ed1) {
                player setclientomnvar("ui_br_contract_cancellation_state", var_587ec5b2038407de);
            }
            namespace_d696adde758cbe79::showDMZSplash("dmz_contract_pending_" + activity.type, var_607da387f3617ed1, undefined, var_587ec5b2038407de);
        }
        goto LOC_000001b1;
    }
LOC_000001b1:
}

// Namespace namespace_f01a5da246ac06b4/namespace_244fdc99ed0f5d2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7198
// Size: 0x38
function function_279c4202b5ed4980(notification, value) {
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_9fd64c8b171158f":
            function_15ab6babbe46e018();
            break;
        }
    }
}

