// mwiii decomp prototype
#using scripts\mp\spawnfactor.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\dev.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace namespace_e64bfa6f54b07461;

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d
// Size: 0x28
function checkdynamicspawns(spawnpoints) {
    if (isdefined(level.dynamicspawns)) {
        spawnpoints = [[ level.dynamicspawns ]](spawnpoints);
    }
    return spawnpoints;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d
// Size: 0x21
function selectbestspawnpoint(var_747b3f2616d50d9f, spawnpoints) {
    bestspawn = var_747b3f2616d50d9f;
    return bestspawn;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396
// Size: 0x2a3
function findbuddyspawn() {
    if (!level.teambased || istrue(level.disablebuddyspawn)) {
        return undefined;
    }
    /#
        namespace_e6eafa63d63ab54d::function_75d2477e56b1aea8(self);
    #/
    if (!namespace_b2d5aa2baf2b5701::arespawnviewersvalid()) {
        namespace_b2d5aa2baf2b5701::updatespawnviewers();
    }
    teammates = getteammatesoutofcombat(namespace_b2d5aa2baf2b5701::getactivespawnquerycontext().team);
    spawnpoints = [];
    foreach (player in teammates) {
        spawnposition = findspawnlocationnearplayer(player);
        if (!isdefined(spawnposition)) {
            continue;
        }
        spawnpoint = spawnstruct();
        spawnpoint.origin = spawnposition;
        spawnpoint.angles = getbuddyspawnangles(player, spawnpoint.origin);
        spawnpoint.index = -1;
        spawnpoint.buddyspawn = 1;
        spawnpoint.isdynamicspawn = 1;
        spawnpoint.owner = player;
        spawnpoint namespace_b2d5aa2baf2b5701::spawnpointinit();
        if (isdefined(player.analyticslog) && isdefined(player.analyticslog.playerid)) {
            spawnpoint.buddyplayerid = player.analyticslog.playerid;
        }
        spawnpoints[spawnpoints.size] = spawnpoint;
    }
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") != 0) {
            namespace_e6eafa63d63ab54d::function_b1972efe5a8d2a37(spawnpoints);
        }
    #/
    var_59ba6be73235750f = [];
    updatespawnpoints(spawnpoints, 1);
    foreach (spawnpoint in spawnpoints) {
        if (!testbuddyspawncriticalfactors(spawnpoint)) {
            continue;
        }
        scorebuddyspawn(spawnpoint);
        var_59ba6be73235750f[var_59ba6be73235750f.size] = spawnpoint;
    }
    bestspawnpoint = undefined;
    foreach (spawnpoint in var_59ba6be73235750f) {
        if (!isdefined(bestspawnpoint) || spawnpoint.totalscore > bestspawnpoint.totalscore) {
            bestspawnpoint = spawnpoint;
        }
    }
    /#
        namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
    #/
    return bestspawnpoint;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x641
// Size: 0x329
function findteammatebuddyspawn(teammate) {
    if (!level.teambased || istrue(level.disablebuddyspawn)) {
        return undefined;
    }
    /#
        namespace_e6eafa63d63ab54d::function_75d2477e56b1aea8(self);
    #/
    if (!namespace_b2d5aa2baf2b5701::arespawnviewersvalid()) {
        namespace_b2d5aa2baf2b5701::updatespawnviewers();
    }
    spawninfo = spawnstruct();
    spawninfo.spawnposition = undefined;
    spawninfo.spawnangle = (0, teammate.angles[1], 0);
    spawninfo = capsulepass(spawninfo, teammate);
    if (!isdefined(spawninfo.spawnposition)) {
        spawninfo.spawnposition = teammate.origin;
        spawninfo.spawnangle = teammate.angles;
    }
    if (isdefined(teammate.vehicle)) {
        seat = namespace_1fbd40990ee60ede::function_d3d95972f58ad2bc(teammate.vehicle);
        if (isdefined(seat) && istrue(namespace_141c4634b6ea7b27::vehicle_interact_vehiclecanbeused(teammate.vehicle))) {
            data = spawnstruct();
            data.useonspawn = 1;
            data.enterstartwaitmsg = "spawned_player";
            thread namespace_1fbd40990ee60ede::vehicle_occupancy_enter(teammate.vehicle, seat, self, data);
            spawninfo.spawnposition = teammate.vehicle.origin + anglestoforward(teammate.vehicle.angles) * -200 + (0, 0, 64);
            spawninfo.spawnangle = (0, teammate.vehicle.angles[1], 0);
            self.spawningintovehicle = 1;
            namespace_3c5a4254f2b957ea::incpersstat("spawnSelectVehicle", 1);
        } else if (!isdefined(spawninfo.spawnposition)) {
            spawninfo.spawnposition = teammate.vehicle.origin + anglestoforward(teammate.vehicle.angles) * -200 + (0, 0, 64);
            spawninfo.spawnangle = (0, teammate.vehicle.angles[1], 0);
        }
    }
    spawnpoint = spawnstruct();
    spawnpoint.origin = spawninfo.spawnposition;
    spawnpoint.angles = spawninfo.spawnangle;
    spawnpoint.index = -1;
    spawnpoint.buddyspawn = 1;
    spawnpoint.isdynamicspawn = 1;
    spawnpoint.owner = teammate;
    spawnpoint namespace_b2d5aa2baf2b5701::spawnpointinit();
    if (isdefined(teammate.analyticslog) && isdefined(teammate.analyticslog.playerid)) {
        spawnpoint.buddyplayerid = teammate.analyticslog.playerid;
    }
    return spawnpoint;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972
// Size: 0x47c
function capsulepass(spawninfo, teammate) {
    radius = 16;
    var_64b62cb5dc1e7af6 = 64;
    var_68df1837cf28c9f3 = 64;
    var_722e02f3664a23c0 = 30;
    var_f03302c066639995 = 30;
    var_519305604d8e28e4 = 180 / var_f03302c066639995;
    var_40088284fa4b02c0 = 1;
    var_ad3fd9a25605f892 = 1;
    var_aaeee28d18a18c1b = radius / (80 - radius);
    var_d4ebddc5067723c4 = teammate.angles;
    var_634e1a5fda766caa = 1;
    dir = undefined;
    groundpos = teammate.origin;
    if (teammate haslastgroundorigin() && !teammate isswimming()) {
        groundpos = teammate getlastgroundorigin();
    }
    startpos = groundpos + (0, 0, var_722e02f3664a23c0);
    var_3bc387e9ae1342aa = [0:"physicscontents_characterproxy", 1:"physicscontents_item", 2:"physicscontents_glass", 3:"physicscontents_vehicle", 4:"physicscontents_playerclip"];
    if (!teammate isswimming()) {
        var_3bc387e9ae1342aa[var_3bc387e9ae1342aa.size] = "physicscontents_water";
    }
    contents = physics_createcontents(var_3bc387e9ae1342aa);
    var_22d9650d353e4416 = [0:teammate];
    while (var_40088284fa4b02c0 < var_519305604d8e28e4) {
        if (var_634e1a5fda766caa) {
            var_634e1a5fda766caa = 0;
            dir = anglestoforward(var_d4ebddc5067723c4);
        } else {
            dir = anglestoforward(var_d4ebddc5067723c4 + (0, ter_op(var_ad3fd9a25605f892, var_f03302c066639995, var_f03302c066639995 * -1) * var_40088284fa4b02c0, 0));
            var_ad3fd9a25605f892 = !var_ad3fd9a25605f892;
            if (var_ad3fd9a25605f892 == 1) {
                var_40088284fa4b02c0++;
            }
        }
        endpos = groundpos - dir * var_64b62cb5dc1e7af6 + (0, 0, var_722e02f3664a23c0);
        caststart = startpos - dir * radius * 0.5;
        trace = namespace_2a184fc4902783dc::player_trace(caststart, endpos, (0, 0, 0), var_22d9650d353e4416, contents);
        var_41302affd456fcb3 = trace["shape_position"];
        var_9406fd672e3b3b43 = 0;
        if (trace["fraction"] < 1 && trace["fraction"] > radius / var_64b62cb5dc1e7af6) {
            var_41302affd456fcb3 = var_41302affd456fcb3 + dir * radius - (0, 0, var_64b62cb5dc1e7af6 / 2);
            var_9406fd672e3b3b43 = 1;
        }
        if (trace["fraction"] > radius / var_64b62cb5dc1e7af6) {
            var_d1d588d0d0b637a3 = 0;
            caststart = var_41302affd456fcb3;
            castend = caststart + (0, 0, -80);
            var_e021c2744cc7ed68 = namespace_2a184fc4902783dc::player_trace(caststart, castend, (0, 0, 0), var_22d9650d353e4416, contents);
            if (var_e021c2744cc7ed68["fraction"] < 1) {
                angles = vectortoangles(dir);
                caststart = var_e021c2744cc7ed68["shape_position"] + (0, 0, 10);
                var_96d35f6bad0fcaed = caststart + anglestoforward(angles) * -32;
                var_c9d3752c67dedf74 = var_96d35f6bad0fcaed + (0, 0, -80);
                var_4b88ff510c2a6274 = namespace_2a184fc4902783dc::ray_trace(var_96d35f6bad0fcaed, var_c9d3752c67dedf74, var_22d9650d353e4416, contents);
                if (var_4b88ff510c2a6274["fraction"] == 1) {
                    continue;
                }
                var_c9f0e43ae2755870 = caststart + anglestoright(angles) * -32;
                var_d6e7b3f22a6dcdd1 = var_c9f0e43ae2755870 + (0, 0, -80);
                var_8d79eccbac18169d = namespace_2a184fc4902783dc::ray_trace(var_c9f0e43ae2755870, var_d6e7b3f22a6dcdd1, var_22d9650d353e4416, contents);
                if (var_8d79eccbac18169d["fraction"] == 1) {
                    continue;
                }
                var_c146c5b839ff0deb = caststart + anglestoright(angles) * 32;
                var_5dc374567c70cd4e = var_c146c5b839ff0deb + (0, 0, -80);
                var_b8290060d3aaf6ca = namespace_2a184fc4902783dc::ray_trace(var_c146c5b839ff0deb, var_c9d3752c67dedf74, var_22d9650d353e4416, contents);
                if (var_b8290060d3aaf6ca["fraction"] == 1) {
                    continue;
                }
                spawninfo.spawnposition = var_e021c2744cc7ed68["shape_position"];
                spawninfo.spawnangle = angles;
                break;
            } else if (teammate isswimming()) {
                spawninfo.spawnposition = var_41302affd456fcb3;
                spawninfo.spawnangle = vectortoangles(dir);
            } else {
                continue;
            }
        }
    }
    return spawninfo;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6
// Size: 0x30
function scorebuddyspawn(spawnpoint) {
    namespace_b41002c7afebd276::calculatefactorscore(spawnpoint, "avoidShortTimeToEnemySight", 1);
    namespace_b41002c7afebd276::calculatefactorscore(spawnpoint, "avoidClosestEnemy", 1);
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2d
// Size: 0x31
function getbuddyspawnangles(buddy, spawnlocation) {
    spawnangles = (0, buddy.angles[1], 0);
    return spawnangles;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0xfe
function getteammatesoutofcombat(team) {
    teammates = [];
    foreach (player in level.players) {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "preferNearGroupsOfTeamMates");
        #/
        if (!isdefined(player.team) || player.team != team) {
            /#
                namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
            #/
        } else if (player == self) {
            /#
                namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
            #/
        } else {
            if (!canplayerbebuddyspawnedon(player)) {
                continue;
            }
            if (!player val::get("player_for_spawn_logic")) {
                /#
                    namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
                #/
            } else {
                teammates[teammates.size] = player;
            }
        }
    }
    return array_randomize(teammates);
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6c
// Size: 0x114
function canplayerbebuddyspawnedon(player) {
    if (player.sessionstate != "playing") {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>" + player.sessionstate);
        #/
        return 0;
    }
    if (!isreallyalive(player)) {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
        #/
        return 0;
    }
    if (!player isonground()) {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
        #/
        return 0;
    }
    if (player isonladder()) {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
        #/
        return 0;
    }
    if (player isflashed()) {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
        #/
        return 0;
    }
    if (player.health < player.maxhealth && (!isdefined(player.lastdamagedtime) || gettime() < player.lastdamagedtime + 3000)) {
        /#
            namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
        #/
        return 0;
    }
    /#
        namespace_e6eafa63d63ab54d::function_fe598e0c02fe84ec(player, "<unknown string>");
    #/
    return 1;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1088
// Size: 0x4a
function findspawnlocationnearplayer(player) {
    var_41cdd7fc4a85331f = namespace_b2d5aa2baf2b5701::getplayertraceheight(player, 1);
    var_5541f7d00319b6bf = findbuddypathnode(player, var_41cdd7fc4a85331f, 0.5);
    if (isdefined(var_5541f7d00319b6bf)) {
        return var_5541f7d00319b6bf.origin;
    }
    return undefined;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10da
// Size: 0x179
function findbuddypathnode(buddy, var_41cdd7fc4a85331f, cosangle) {
    var_5836c6d53a5f99a2 = getnodesinradiussorted(buddy.origin, 192, 64, var_41cdd7fc4a85331f, "Path", 1);
    bestnode = undefined;
    if (isdefined(var_5836c6d53a5f99a2) && var_5836c6d53a5f99a2.size > 0) {
        var_cd4d7f06b22cefbe = anglestoforward(buddy.angles);
        /#
            if (getdvarint(@"hash_9bffca47d2e56b54") != 0) {
                namespace_e6eafa63d63ab54d::function_55db94df92c1a7c4(buddy, var_5836c6d53a5f99a2);
            }
        #/
        foreach (var_5541f7d00319b6bf in var_5836c6d53a5f99a2) {
            if (isdefined(level.badpathnodes) && array_contains(level.badpathnodes, var_5541f7d00319b6bf)) {
                continue;
            }
            var_644ab9fda129b92b = vectornormalize(var_5541f7d00319b6bf.origin - buddy.origin);
            dot = vectordot(var_cd4d7f06b22cefbe, var_644ab9fda129b92b);
            if (dot <= cosangle && !positionwouldtelefrag(var_5541f7d00319b6bf.origin)) {
                bestnode = var_5541f7d00319b6bf;
                if (dot <= 0) {
                    break;
                }
            }
        }
    }
    /#
        namespace_e6eafa63d63ab54d::function_c06e014cedb53155(buddy, bestnode);
    #/
    return bestnode;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125b
// Size: 0x14c
function initscoredata(spawnpoint) {
    spawnpoint.totalscore = 0;
    spawnpoint.totalpossiblescore = 0;
    spawnpoint.isbadspawn = 0;
    spawnpoint.lastscore = [];
    spawnpoint.lastscore["allies"] = 0;
    spawnpoint.lastscore["axis"] = 0;
    spawnpoint.analytics = spawnstruct();
    spawnpoint.analytics.allyaveragedist = 0;
    spawnpoint.analytics.enemyaveragedist = 0;
    spawnpoint.analytics.timesincelastspawn = 0;
    spawnpoint.analytics.maxenemysightfraction = 0;
    spawnpoint.analytics.randomscore = 0;
    spawnpoint.analytics.maxjumpingenemysightfraction = 0;
    spawnpoint.analytics.spawnusedbyenemies = 0;
    spawnpoint.analytics.spawntype = 0;
    /#
        spawnpoint.var_54cd879162b8b086 = [];
        spawnpoint.var_b158a46400d7573d = [];
    #/
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ae
// Size: 0xd1
function updatespawnpoints(spawnpoints, var_52a860668e62b853) {
    team = namespace_b2d5aa2baf2b5701::getspawnteam(self);
    var_52a860668e62b853 = istrue(var_52a860668e62b853);
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(team)[0];
    }
    foreach (spawnpoint in spawnpoints) {
        initscoredata(spawnpoint);
        namespace_b2d5aa2baf2b5701::initspawnpointvalues(spawnpoint);
        namespace_b2d5aa2baf2b5701::spawnpointdistanceupdate(spawnpoint);
        namespace_b2d5aa2baf2b5701::evaluateprecomputedlos(spawnpoint, team);
        if (!var_52a860668e62b853) {
            namespace_b2d5aa2baf2b5701::evaluateprecomputedlos(spawnpoint, enemyteam);
        }
    }
    if (!var_52a860668e62b853) {
        namespace_b41002c7afebd276::updatefrontline(team);
    }
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1486
// Size: 0x34
function criticalfactors_callback(spawnpoint) {
    if (!critical_factor(&avoidbradleys, spawnpoint)) {
        spawnpoint.badspawnreason = 8;
        return "bad";
    }
    return "primary";
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c2
// Size: 0x1d2
function function_3bf7bd55a835ee3a(spawnpoint) {
    /#
        if (getdvarint(@"hash_88da8d1aa9e42678") > 0) {
            return "<unknown string>";
        }
    #/
    if (!critical_factor(&function_22b490a6df990a49, spawnpoint)) {
        spawnpoint.badspawnreason = 0;
        return "bad";
    }
    if (!critical_factor(&function_5fdeed44e6029789, spawnpoint)) {
        spawnpoint.badspawnreason = 1;
        return "bad";
    }
    if (!critical_factor(&function_63d3482ba43b656c, spawnpoint)) {
        spawnpoint.badspawnreason = 2;
        return "bad";
    }
    if (!critical_factor(&avoidcarepackages, spawnpoint)) {
        spawnpoint.badspawnreason = 4;
        return "bad";
    }
    if (!critical_factor(&avoidbradleys, spawnpoint)) {
        spawnpoint.badspawnreason = 8;
        return "bad";
    }
    if (!critical_factor(&avoidtelefrag, spawnpoint)) {
        spawnpoint.badspawnreason = 5;
        return "bad";
    }
    if (!critical_factor(&function_bcea4ae71a95bddd, spawnpoint)) {
        spawnpoint.badspawnreason = 6;
        return "bad";
    }
    /#
        assert(!currentspawnlogicsupportsfrontline() || namespace_b41002c7afebd276::getglobalfrontlineinfo().lastupdatetime == gettime());
    #/
    if (isdefined(spawnpoint.frontlineteam) && level.frontlineinfo.isactive[self.team] && spawnpoint.frontlineteam != self.team) {
        spawnpoint.badspawnreason = 7;
        return "bad";
    }
    if (!critical_factor(&function_5e47ef2aeed10cf1, spawnpoint)) {
        return "secondary";
    }
    if (!critical_factor(&function_4546108b3957a698, spawnpoint)) {
        return "secondary";
    }
    return "primary";
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169c
// Size: 0x105
function testbuddyspawncriticalfactors(spawnpoint) {
    if (!critical_factor(&function_22b490a6df990a49, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    if (!critical_factor(&function_5fdeed44e6029789, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    if (!critical_factor(&function_63d3482ba43b656c, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    if (!critical_factor(&avoidcarepackages, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    if (!critical_factor(&avoidbradleys, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    if (!critical_factor(&avoidtelefrag, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    if (!critical_factor(&function_4546108b3957a698, spawnpoint)) {
        /#
            namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
        #/
        return 0;
    }
    /#
        namespace_e6eafa63d63ab54d::function_41fd2e38468e1538(spawnpoint, "<unknown string>");
    #/
    return 1;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17a9
// Size: 0x17c
function getstartspawnpoint_freeforall(spawnpoints) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    var_2d00675497c92ae7 = undefined;
    var_d4d7a55bc1e8f68e = namespace_b2d5aa2baf2b5701::getactiveplayerlist();
    spawnpoints = checkdynamicspawns(spawnpoints);
    if (!isdefined(var_d4d7a55bc1e8f68e) || var_d4d7a55bc1e8f68e.size == 0) {
        return namespace_b2d5aa2baf2b5701::getspawnpoint_random(spawnpoints);
    }
    var_6c95a82ab0a037a2 = 0;
    foreach (spawnpoint in spawnpoints) {
        if (canspawn(spawnpoint.origin) && !positionwouldtelefrag(spawnpoint.origin)) {
            var_8b91d828ab5a741 = undefined;
            foreach (player in var_d4d7a55bc1e8f68e) {
                disttoenemysq = distancesquared(spawnpoint.origin, player.origin);
                if (!isdefined(var_8b91d828ab5a741) || disttoenemysq < var_8b91d828ab5a741) {
                    var_8b91d828ab5a741 = disttoenemysq;
                }
            }
            if (!isdefined(var_2d00675497c92ae7) || var_8b91d828ab5a741 > var_6c95a82ab0a037a2) {
                var_2d00675497c92ae7 = spawnpoint;
                var_6c95a82ab0a037a2 = var_8b91d828ab5a741;
            }
        }
    }
    if (!isdefined(var_2d00675497c92ae7)) {
        return namespace_b2d5aa2baf2b5701::getspawnpoint_random(spawnpoints);
    }
    return var_2d00675497c92ae7;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192d
// Size: 0x85
function logbadspawn(typestring, var_4f3d36dd450e85d7) {
    if (isdefined(var_4f3d36dd450e85d7) && isdefined(var_4f3d36dd450e85d7.disablespawnwarnings) && var_4f3d36dd450e85d7.disablespawnwarnings) {
        return;
    }
    if (!isdefined(typestring)) {
        typestring = "";
    } else {
        typestring = typestring;
    }
    /#
        println("<unknown string>" + typestring + "<unknown string>");
    #/
    if (isdefined(level.matchrecording_logeventmsg)) {
        [[ level.matchrecording_logeventmsg ]]("LOG_BAD_SPAWN", gettime(), typestring);
    }
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19b9
// Size: 0x2c4
function getspawnpoint_legacy(spawnpoints, fallbackspawnpoints, factorparams, var_fcb3e7fed624752a, nobuddyspawns) {
    level.spawnglobals.spawnpointslist = spawnpoints;
    var_4db3cfd2ea2d7b8f = namespace_b2d5aa2baf2b5701::createspawnquerycontext(self, self.pers["team"]);
    namespace_b2d5aa2baf2b5701::setactivespawnquerycontext(var_4db3cfd2ea2d7b8f);
    resetperupdatespawnglobals();
    function_14ba921001eb3164();
    if (level.forcebuddyspawn) {
        spawnpoint = findbuddyspawn();
        if (isdefined(spawnpoint)) {
            /#
                namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
            #/
            return spawnpoint;
        }
    }
    var_e6dd1e4c471aa0f1 = undefined;
    level.spawnglobals.spawn_type = 0;
    var_466d8dd852311ef7 = function_fd731d7880fa8ed6(spawnpoints, 0);
    if (isdefined(var_466d8dd852311ef7)) {
        if (!istrue(var_466d8dd852311ef7.isbadspawn)) {
            /#
                namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
            #/
            return var_466d8dd852311ef7;
        } else {
            var_e6dd1e4c471aa0f1 = var_466d8dd852311ef7;
        }
    }
    if (isdefined(fallbackspawnpoints)) {
        var_8889c1e12aad0386 = function_fd731d7880fa8ed6(fallbackspawnpoints, 3);
        if (isdefined(var_8889c1e12aad0386)) {
            if (istrue(var_8889c1e12aad0386.isbadspawn)) {
                if (!isdefined(var_e6dd1e4c471aa0f1) || var_8889c1e12aad0386.totalscore > var_e6dd1e4c471aa0f1.totalscore) {
                    var_e6dd1e4c471aa0f1 = var_8889c1e12aad0386;
                }
            } else {
                /#
                    namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
                #/
                logbadspawn("Using a fallback spawn.", self);
                return var_8889c1e12aad0386;
            }
        }
    }
    if (istrue(var_fcb3e7fed624752a)) {
        /#
            namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
        #/
        return undefined;
    }
    logbadspawn("Using a LastResort spawn point.", self);
    /#
        if (isdefined(self) && isplayer(self)) {
            self iprintlnbold("<unknown string>");
        }
    #/
    if (!istrue(nobuddyspawns)) {
        buddyspawn = findbuddyspawn();
        if (isdefined(buddyspawn)) {
            buddyspawn.spawntype = 7;
            level.spawnglobals.buddyspawnid = 0;
            if (isdefined(buddyspawn.buddyplayerid)) {
                level.spawnglobals.buddyplayerid = buddyspawn.buddyplayerid;
            }
            /#
                namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
            #/
            return buddyspawn;
        }
        logbadspawn("UNABLE TO BUDDY SPAWN. EXTREMELY BAD", self);
    }
    if (level.teambased && !isanymlgmatch()) {
        lastbadspawntime = level.spawnglobals.lastbadspawntime[self.team];
        if (isdefined(lastbadspawntime) && gettime() - lastbadspawntime < 5000) {
            var_e6dd1e4c471aa0f1 = spawnpoints[randomint(spawnpoints.size)];
        } else {
            level.spawnglobals.lastbadspawntime[self.team] = gettime();
        }
    }
    /#
        namespace_b2d5aa2baf2b5701::function_50a59d95bac1964e();
    #/
    return var_e6dd1e4c471aa0f1;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c85
// Size: 0x1ff
function function_fd731d7880fa8ed6(spawnpoints, var_29b92441af87f23f) {
    spawnpoints = checkdynamicspawns(spawnpoints);
    var_db238c057df08dfc["primary"] = [];
    var_db238c057df08dfc["secondary"] = [];
    var_db238c057df08dfc["bad"] = [];
    updatespawnpoints(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        result = function_3bf7bd55a835ee3a(spawnpoint);
        var_db238c057df08dfc[result][var_db238c057df08dfc[result].size] = spawnpoint;
        spawnpoint.lastbucket[ter_op(isdefined(self.spawnlogicteam), self.spawnlogicteam, self.team)] = result;
        if (isdefined(spawnpoint.analytics) && isdefined(spawnpoint.analytics.spawntype)) {
            if (result == "primary") {
                spawnpoint.analytics.spawntype = var_29b92441af87f23f + 1;
            } else if (result == "secondary") {
                spawnpoint.analytics.spawntype = var_29b92441af87f23f + 2;
            } else {
                spawnpoint.analytics.spawntype = var_29b92441af87f23f + 3;
            }
        }
    }
    if (var_db238c057df08dfc["primary"].size) {
        result = gethighestscoringspawn(var_db238c057df08dfc["primary"]);
        result.spawn_type = 1;
        return result;
    }
    if (var_db238c057df08dfc["secondary"].size) {
        result = gethighestscoringspawn(var_db238c057df08dfc["secondary"]);
        result.spawn_type = 2;
        return result;
    }
    if (var_db238c057df08dfc["bad"].size) {
        logbadspawn("Using Bad Spawn", self);
        result = gethighestscoringspawn(var_db238c057df08dfc["bad"]);
        if (isdefined(result)) {
            result.isbadspawn = 1;
        }
        return result;
    }
    return undefined;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8c
// Size: 0x31
function resetperupdatespawnglobals() {
    spawnglobals = level.spawnglobals;
    spawnglobals.hasclusterdata = 0;
    spawnglobals.haslanedata = 0;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec4
// Size: 0x1bd
function function_14ba921001eb3164() {
    team = namespace_b2d5aa2baf2b5701::getspawnteam(self);
    namespace_b2d5aa2baf2b5701::updatespawnviewers();
    spawnglobals = level.spawnglobals;
    if (namespace_b2d5aa2baf2b5701::isfactorinuse("preferNearGroupsOfTeamMates")) {
        spawnglobals.teamclusters = [];
        spawnglobals.teamclusters[team] = namespace_b2d5aa2baf2b5701::calculateteamclusters(team);
    }
    if (namespace_b2d5aa2baf2b5701::isfactorinuse("preferOccupiedLanes") || namespace_b2d5aa2baf2b5701::isfactorinuse("preferToBalanceLanes")) {
        spawnglobals.occupiedlanemasks = [];
        foreach (var_8e574dae649f764d in level.spawnglobals.lanetriggers) {
            foreach (otherplayer in level.players) {
                var_b5d02014d41302ed = namespace_b2d5aa2baf2b5701::getspawnteam(otherplayer);
                if (!isreallyalive(otherplayer)) {
                    continue;
                }
                if (!otherplayer val::get("player_for_spawn_logic")) {
                    continue;
                }
                if (ispointinvolume(otherplayer.origin, var_8e574dae649f764d)) {
                    if (!isdefined(spawnglobals.occupiedlanemasks[var_b5d02014d41302ed])) {
                        spawnglobals.occupiedlanemasks[var_b5d02014d41302ed] = 0;
                    }
                    spawnglobals.occupiedlanemasks[var_b5d02014d41302ed] = spawnglobals.occupiedlanemasks[var_b5d02014d41302ed] | var_8e574dae649f764d.indexflag;
                }
            }
        }
    }
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2088
// Size: 0x8f
function gethighestscoringspawn(spawnpoints) {
    bestspawn = spawnpoints[0];
    foreach (spawnpoint in spawnpoints) {
        namespace_b2d5aa2baf2b5701::scorespawnpoint(spawnpoint);
        if (spawnpoint.totalscore > bestspawn.totalscore) {
            bestspawn = spawnpoint;
        }
    }
    bestspawn = selectbestspawnpoint(bestspawn, spawnpoints);
    return bestspawn;
}

// Namespace namespace_e64bfa6f54b07461/namespace_90f75d3fdf89a43e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211f
// Size: 0xf4
function squadspawndebug() {
    self endon("death_or_disconnect");
    spawninfo = spawnstruct();
    while (1) {
        spawninfo.spawnposition = undefined;
        spawninfo.spawnangle = undefined;
        spawninfo = capsulepass(spawninfo, self);
        failed = 0;
        if (!isdefined(spawninfo.spawnposition)) {
            spawninfo.spawnposition = self.origin;
            spawninfo.spawnangle = self.angles;
            failed = 1;
        }
        thread namespace_f2ffc0540883e1ad::drawsphere(spawninfo.spawnposition, 16, 0.1, ter_op(failed, (1, 0, 0), (0, 1, 0)));
        thread namespace_f2ffc0540883e1ad::drawangles(spawninfo.spawnposition, spawninfo.spawnangle, 0.1, 1);
        wait(0.1);
    }
}

