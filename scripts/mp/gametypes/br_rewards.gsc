// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace namespace_771a3ace0094a1c2;

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x496
// Size: 0x4b
function init_br_rewards() {
    processkillstreaksintotiers();
    level.tierrewardcounts = [];
    level.tierrewardcounts[3] = 0;
    level.tierrewardcounts[2] = 0;
    level.tierrewardcounts[1] = 0;
    level.tierrewardcounts[0] = 0;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e8
// Size: 0xa9
function runmissionrewarddelivery(var_96fb3d33fbd543f9, creditplayer, streakname, var_676b590ea065842f) {
    droplocation = undefined;
    if (!isdefined(var_96fb3d33fbd543f9.rewardlocation)) {
        droplocation = findclosestdroplocation(var_96fb3d33fbd543f9);
        if (!isdefined(droplocation)) {
            droplocation = calculatedroplocationnearlocation(var_96fb3d33fbd543f9, 64, 2048);
        }
    } else {
        droplocation = var_96fb3d33fbd543f9.rewardlocation;
    }
    if (isdefined(streakname)) {
        thread runkillstreakreward(droplocation, creditplayer, streakname);
    } else if (isdefined(var_676b590ea065842f)) {
        thread runkillstreakreward(droplocation, creditplayer, getkillstreak(var_676b590ea065842f));
    } else {
        thread runkillstreakreward(droplocation, creditplayer, getkillstreak(3));
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x598
// Size: 0x496
function runkillstreakreward(location, creditplayer, streakname) {
    level endon("game_ended");
    crate = undefined;
    if (!istrue(location.isinside)) {
        offset = 72;
    } else {
        offset = 40;
    }
    object = namespace_19b4203b51d56488::createobjidobject(location.origin, "neutral", (0, 0, offset), undefined, "any");
    maskobjectivetoplayerssquad(object, creditplayer);
    object.origin = location.origin;
    object.angles = location.angles;
    thread docratedropsmoke(undefined, location, 16);
    object.iconname = "_incoming";
    object.lockupdatingicons = 0;
    object namespace_19b4203b51d56488::setobjectivestatusicons(streakname);
    object.lockupdatingicons = 1;
    wait(3);
    wait(1);
    if (!istrue(location.isinside)) {
        crate = namespace_6c578d6ef48f10ef::droparmcratefromscriptedheli(creditplayer.team, streakname, location.origin, (0, randomint(360), 0), undefined);
        crate.skipminimapicon = 1;
        crate.nevertimeout = 0;
        crate.waitforobjectiveactivate = 1;
        crate.killminimapicon = 0;
        crate.disallowheadiconid = 1;
        crate.isarmcrate = 1;
        crate waittill("crate_dropped");
        object.useobj = crate;
        object.origin = crate.origin;
    } else {
        object.useobj = spawn("script_model", object.origin);
        object.useobj.disallowheadiconid = 1;
        object.useobj.cratetype = "arm_no_owner";
        levelData = namespace_6c578d6ef48f10ef::getleveldata(object.useobj.cratetype);
        object.useobj.minimapicon = levelData.minimapicon;
        object.useobj.capturestring = levelData.capturestring;
        object.useobj.rerollstring = levelData.rerollstring;
        object.useobj.supportsreroll = levelData.supportsreroll;
        object.useobj.isdummyarmcrate = 1;
        object.useobj.isarmcrate = 1;
        object.useobj.data = namespace_6c578d6ef48f10ef::getarmcratedatabystreakname(streakname);
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(object.objidnum, object.useobj);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(object.objidnum, 40);
    }
    var_de9e30874c191943 = 0;
    interval = 0.1;
    if (istrue(location.isinside)) {
        waittime = 15;
    } else {
        waittime = 1;
    }
    wait(waittime);
    if (!istrue(location.isinside)) {
        crate notify("objective_activate");
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(object.objidnum, crate);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(object.objidnum, 72);
    } else {
        object.useobj namespace_6c578d6ef48f10ef::makecrateusable();
        levelData = namespace_6c578d6ef48f10ef::getleveldata(object.useobj.cratetype);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(object.objidnum, 40);
    }
    object.iconname = "";
    object.lockupdatingicons = 0;
    object namespace_19b4203b51d56488::setobjectivestatusicons(streakname);
    object.lockupdatingicons = 1;
    objective_setlabel(object.objidnum, "");
    if (isdefined(crate)) {
        crate waittill("death");
    } else {
        object.useobj waittill("death");
    }
    object namespace_19b4203b51d56488::setvisibleteam("none");
    object namespace_19b4203b51d56488::releaseid();
    object.visibleteam = "none";
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa35
// Size: 0x47
function dropcrate(killstreakname, droplocation, team) {
    crate = namespace_6c578d6ef48f10ef::droparmcratefromscriptedheli(team, killstreakname, droplocation.origin, (0, randomint(360), 0), undefined);
    return crate;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa84
// Size: 0x133
function docratedropsmoke(crate, droplocation, duration) {
    var_e0d03a39e88dff15 = droplocation.origin + (0, 0, 2000);
    spawnpos = utility::groundpos(var_e0d03a39e88dff15, (0, 0, 1));
    droplocation.vfxent = spawn("script_model", spawnpos);
    droplocation.vfxent setmodel("tag_origin");
    droplocation.vfxent.angles = (0, 0, 0);
    droplocation.vfxent playloopsound("smoke_carepackage_smoke_lp");
    wait(1);
    playfxontag(getfx("vfx_smk_signal_gr"), droplocation.vfxent, "tag_origin");
    if (isdefined(crate)) {
        crate waittill_any_timeout_1(duration, "crate_dropped");
    } else {
        wait(duration);
    }
    stopfxontag(getfx("vfx_smk_signal_gr"), droplocation.vfxent, "tag_origin");
    droplocation.vfxent delete();
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbe
// Size: 0x4a
function getkillstreak(tier) {
    if (!isdefined(level.killstreaktierlist)) {
        processkillstreaksintotiers();
    }
    level.killstreaktierlist[tier] = array_randomize(level.killstreaktierlist[tier]);
    return level.killstreaktierlist[tier][0];
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc10
// Size: 0x275
function br_getrandomkillstreakreward() {
    var_c7856e174c7ca8dd = 0;
    var_c4ba6dd2b83a8bb5 = 0;
    var_78d4698c80fe0610 = 0;
    var_84f3d2d3acdf03f5 = 0;
    var_d2ba4103f3a95696 = 0;
    var_62760130e376fea3 = 0;
    var_7f64b15a67fcd125 = 10;
    var_7f64b05a67fccef2 = 35;
    var_7f64af5a67fcccbf = 35;
    var_7f64ae5a67fcca8c = 20;
    if (isdefined(level.tierrewardcounts[0]) && level.tierrewardcounts[0] < 2 || 0) {
        var_c7856e174c7ca8dd = var_c7856e174c7ca8dd + 10;
    } else {
        var_78d4698c80fe0610 = 1;
        var_7f64b15a67fcd125 = 0;
    }
    if (isdefined(level.tierrewardcounts[1]) && level.tierrewardcounts[1] < -1 || -1 == -1) {
        var_c7856e174c7ca8dd = var_c7856e174c7ca8dd + 35;
        if (!var_78d4698c80fe0610) {
            var_7f64b05a67fccef2 = var_7f64b05a67fccef2 + 10;
        }
    } else {
        var_84f3d2d3acdf03f5 = 1;
        var_7f64b05a67fccef2 = 0;
    }
    if (isdefined(level.tierrewardcounts[2]) && level.tierrewardcounts[2] < -1 || -1 == -1) {
        var_c7856e174c7ca8dd = var_c7856e174c7ca8dd + 35;
        if (!var_78d4698c80fe0610) {
            var_7f64af5a67fcccbf = var_7f64af5a67fcccbf + 10;
        }
        if (!var_84f3d2d3acdf03f5) {
            var_7f64af5a67fcccbf = var_7f64af5a67fcccbf + 35;
        }
    } else {
        var_d2ba4103f3a95696 = 1;
        var_7f64af5a67fcccbf = 0;
    }
    if (isdefined(level.tierrewardcounts[3]) && level.tierrewardcounts[3] < 15 || 0) {
        var_c7856e174c7ca8dd = var_c7856e174c7ca8dd + 20;
        if (!var_78d4698c80fe0610) {
            var_7f64ae5a67fcca8c = var_7f64ae5a67fcca8c + 10;
        }
        if (!var_84f3d2d3acdf03f5) {
            var_7f64ae5a67fcca8c = var_7f64ae5a67fcca8c + 35;
        }
        if (!var_84f3d2d3acdf03f5) {
            var_7f64ae5a67fcca8c = var_7f64ae5a67fcca8c + 35;
        }
    } else {
        var_62760130e376fea3 = 1;
        var_7f64ae5a67fcca8c = 0;
    }
    var_8b591b0bc361ab3d = randomintrange(1, var_c7856e174c7ca8dd);
    if (var_8b591b0bc361ab3d <= var_7f64b15a67fcd125) {
        level.tierrewardcounts[0]++;
        var_25f8f5da15b55857 = array_randomize(level.killstreaktierlist[0]);
        return var_25f8f5da15b55857[0];
    } else if (var_8b591b0bc361ab3d <= var_7f64b05a67fccef2) {
        level.tierrewardcounts[1]++;
        var_25f8f5da15b55857 = array_randomize(level.killstreaktierlist[1]);
        return var_25f8f5da15b55857[0];
    } else if (var_8b591b0bc361ab3d <= var_7f64af5a67fcccbf) {
        level.tierrewardcounts[2]++;
        var_25f8f5da15b55857 = array_randomize(level.killstreaktierlist[2]);
        return var_25f8f5da15b55857[0];
    } else {
        level.tierrewardcounts[3]++;
        var_25f8f5da15b55857 = array_randomize(level.killstreaktierlist[3]);
        return var_25f8f5da15b55857[0];
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8c
// Size: 0xa7
function processkillstreaksintotiers() {
    level.killstreaktierlist = [];
    level.killstreaktierlist[3] = [0:"cruise_predator", 1:"scrambler_drone_guard", 2:"uav"];
    level.killstreaktierlist[2] = [0:"precision_airstrike", 1:"multi_airstrike", 2:"bradley"];
    level.killstreaktierlist[1] = [0:"toma_strike", 1:"uav", 2:"pac_sentry", 3:"white_phosphorus"];
    level.killstreaktierlist[0] = [0:"uav"];
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf3a
// Size: 0x52
function br_getrewardicon(streakname) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[streakname];
    if (isdefined(bundle) && isdefined(bundle.hudicon)) {
        return bundle.hudicon;
    }
    return "";
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf94
// Size: 0x6f
function dropweaponcarepackage(position) {
    level endon("game_ended");
    dropstruct = namespace_6c578d6ef48f10ef::dropcratefrommanualheli(undefined, undefined, "battle_royale", position, (0, randomfloat(360), 0), 3000, 3000, position, namespace_6c578d6ef48f10ef::getbrcratedatabytype("weapon"));
    if (!isdefined(dropstruct)) {
        return undefined;
    } else if (!isdefined(dropstruct.crate)) {
        return undefined;
    }
    return dropstruct.crate;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100b
// Size: 0x195
function initdropbagsystem() {
    namespace_c5622898120e827f::function_eca79fa0f341ee08(17, &function_b90101a9db963bd1, &function_26a4c7cf6da4e2c0);
    namespace_6c578d6ef48f10ef::initplundercratedata();
    level.waypointstring["icon_waypoint_marker"] = "DROP_BAG";
    level.dropbagstruct = spawnstruct();
    level.dropbagstruct.clusters = getstructarray("dropBagCluterNode", "script_noteworthy");
    var_cf73b12323d082a = getstructarray("dropBagLocation", "script_noteworthy");
    foreach (location in var_cf73b12323d082a) {
        location.inuse = 0;
        foreach (cluster in level.dropbagstruct.clusters) {
            if (location.target == cluster.targetname) {
                if (!isdefined(cluster.droplocations)) {
                    cluster.droplocations = [];
                }
                if (cluster.droplocations.size < 7) {
                    cluster.droplocations[cluster.droplocations.size] = location;
                }
                continue;
            }
        }
    }
    initdropbagvo();
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a7
// Size: 0x16
function initdropbagvo() {
    game["dialog"]["dropbag_incoming"] = "drpb_grav_gmst";
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c4
// Size: 0x5ca
function precomputedropbagpositions(var_d0de15f793f14825) {
    playerlist = [];
    var_f4ab694b30ff6942 = [];
    circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
    circleradius = namespace_c5622898120e827f::getsafecircleradius();
    teamlist = getarraykeys(level.teamdata);
    foreach (team in teamlist) {
        if (level.teamdata[team]["teamCount"] > 0) {
            var_f115baff60d7fffa = 0;
            var_4cccc55b861f079e = undefined;
            foreach (player in level.teamdata[team]["alivePlayers"]) {
                if (!isdefined(var_4cccc55b861f079e) && !istrue(player.gulag)) {
                    var_4cccc55b861f079e = player;
                }
                if (istrue(player.issquadleader) && !istrue(player.gulag)) {
                    var_f115baff60d7fffa = 1;
                    playerlist[playerlist.size] = player;
                    if (istrue(var_d0de15f793f14825) && isdefined(level.br_spawns[player.team].groundorigin)) {
                        var_f4ab694b30ff6942[var_f4ab694b30ff6942.size] = level.br_spawns[player.team].groundorigin;
                    } else {
                        var_f4ab694b30ff6942[var_f4ab694b30ff6942.size] = player.origin;
                    }
                    break;
                }
            }
            if (!var_f115baff60d7fffa) {
                if (isdefined(var_4cccc55b861f079e)) {
                    player = var_4cccc55b861f079e;
                    playerlist[playerlist.size] = player;
                    if (istrue(var_d0de15f793f14825) && isdefined(level.br_spawns[player.team].groundorigin)) {
                        var_f4ab694b30ff6942[var_f4ab694b30ff6942.size] = level.br_spawns[player.team].groundorigin;
                    } else {
                        var_f4ab694b30ff6942[var_f4ab694b30ff6942.size] = player.origin;
                    }
                } else if (level.teamdata[team]["aliveCount"] > 0) {
                    player = level.teamdata[team]["alivePlayers"][0];
                    playerlist[playerlist.size] = player;
                    randangle = randomfloat(360);
                    var_97ad91666291cf6f = randomfloat(circleradius);
                    var_357c72ebba546824 = circleorigin + (cos(randangle) * var_97ad91666291cf6f, sin(randangle) * var_97ad91666291cf6f, 0);
                    var_f4ab694b30ff6942[var_f4ab694b30ff6942.size] = var_357c72ebba546824;
                }
            }
        }
    }
    /#
        assert(var_f4ab694b30ff6942.size == playerlist.size);
    #/
    var_342822c35fba7025 = 5;
    if (isdefined(level.dropbagstruct.clusters) && level.dropbagstruct.clusters.size && isdefined(level.dropbagstruct.clusters[0].droplocations)) {
        var_342822c35fba7025 = level.dropbagstruct.clusters[0].droplocations.size;
    }
    var_2827e1b47ae2ab6e = getdvarfloat(@"hash_ccc87b710135b98b", 3000);
    var_deeef4b8cb10cae0 = getdvarfloat(@"hash_2c7210432530f899", 7000);
    defaultpos = spawnstruct();
    defaultpos.origin = (0, 0, 0);
    positions = [0:defaultpos];
    var_aeed6ce6e6ff3f3e = getdvarint(@"hash_5a52e56ad2e6cdfb", 128);
    if (isdefined(level.br_level)) {
        if (circleradius > 0) {
            positions = computedropbagpositions(var_f4ab694b30ff6942, level.dropbagstruct.clusters, level.br_level.br_mapbounds, var_2827e1b47ae2ab6e, var_deeef4b8cb10cae0, 2000, var_342822c35fba7025, var_aeed6ce6e6ff3f3e, circleorigin, circleradius);
        } else {
            positions = computedropbagpositions(var_f4ab694b30ff6942, level.dropbagstruct.clusters, level.br_level.br_mapbounds, var_2827e1b47ae2ab6e, var_deeef4b8cb10cae0, 2000, var_342822c35fba7025, var_aeed6ce6e6ff3f3e);
        }
    }
    if (isdefined(positions)) {
        /#
            assert(positions.size == playerlist.size);
        #/
        for (i = 0; i < positions.size; i++) {
            player = playerlist[i];
            if (isdefined(positions[i].node)) {
                /#
                    assert(isdefined(positions[i].index));
                #/
                clusterindex = positions[i].node;
                /#
                    assert(clusterindex < level.dropbagstruct.clusters.size);
                #/
                cluster = level.dropbagstruct.clusters[clusterindex];
                var_c62b5998026b34f = positions[i].index;
                /#
                    assert(var_c62b5998026b34f < cluster.droplocations.size);
                #/
                player.precomputeddropbagpos = cluster.droplocations[var_c62b5998026b34f].origin;
            } else {
                player.precomputeddropbagpos = positions[i].origin;
            }
        }
        level.precomputeddropbags = 1;
        level thread spawndropbagsovertime(playerlist);
    }
    level thread managedropbags();
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1795
// Size: 0x156
function managedropbags() {
    level endon("game_ended");
    level notify("manageDropBags");
    level endon("manageDropBags");
    var_c192239c59747190 = -1;
    while (1) {
        if (!isdefined(level.br_pickups.crates) || !level.br_pickups.crates.size) {
            var_c192239c59747190 = -1;
            wait(1);
            continue;
        }
        var_c192239c59747190 = (var_c192239c59747190 + 1) % level.br_pickups.crates.size;
        crate = level.br_pickups.crates[var_c192239c59747190];
        if (!isdefined(crate)) {
            level.br_pickups.crates = array_removeundefined(level.br_pickups.crates);
            waitframe();
            continue;
        }
        if (isdefined(crate.team) && crate.team != "neutral") {
            numuses = 0;
            if (isdefined(crate.numuses)) {
                numuses = crate.numuses;
            }
            if (numuses >= level.teamdata[crate.team]["teamCount"]) {
                crate thread namespace_6c578d6ef48f10ef::destroycrate();
                waitframe();
                continue;
            }
        }
        waitframe();
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f2
// Size: 0xcf
function function_b90101a9db963bd1(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    var_52d59c928eb97c81 = var_e86632d645c137d0 + var_5d954f1724092f5a;
    var_c434624ff361bba2 = var_52d59c928eb97c81 * var_52d59c928eb97c81;
    foreach (crate in level.br_pickups.crates) {
        if (!isdefined(crate)) {
            continue;
        }
        var_e4e4ae4481958d2e = distance2dsquared(crate.origin, var_819edacdacb810e4) + level.var_53c0fa66001cff52 > var_c434624ff361bba2;
        if (var_e4e4ae4481958d2e) {
            crate thread namespace_6c578d6ef48f10ef::destroycrate();
        }
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c8
// Size: 0xcf
function function_26a4c7cf6da4e2c0(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    foreach (crate in level.br_pickups.crates) {
        if (!isdefined(crate)) {
            continue;
        }
        var_e4e4ae4481958d2e = !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(crate.origin, level.var_53c0fa66001cff52);
        var_8724c89e365130a7 = namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(crate.origin);
        if (var_e4e4ae4481958d2e && !var_8724c89e365130a7) {
            crate thread namespace_6c578d6ef48f10ef::destroycrate();
        }
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9e
// Size: 0xf3
function cleanupallbutxcratesforteam(team, cratecount) {
    var_52190e94ba536878 = [];
    foreach (crate in level.br_pickups.crates) {
        if (!isdefined(crate) || !isdefined(crate.team) || crate.team != team) {
            continue;
        }
        var_52190e94ba536878[var_52190e94ba536878.size] = crate;
    }
    var_6e95fa22aad7c8a5 = var_52190e94ba536878.size - cratecount;
    if (var_6e95fa22aad7c8a5 <= 0) {
        return;
    }
    for (index = var_6e95fa22aad7c8a5 - 1; index >= 0; index--) {
        var_4f7ec11230295c92 = var_52190e94ba536878[index];
        var_4f7ec11230295c92 thread namespace_6c578d6ef48f10ef::destroycrate();
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b98
// Size: 0xd5
function function_b4255b6f102b056d(var_26784414a3b75d58) {
    var_68e6f05a4ee24dee = physics_createcontents([0:"physicscontents_water", 1:"physicscontents_playerclip"]);
    var_7c89350c1bcac4f0 = var_26784414a3b75d58 + (0, 0, 100);
    var_66d7b2c988606651 = var_7c89350c1bcac4f0 + (0, 0, -10000);
    var_e021c2744cc7ed68 = physics_raycast(var_7c89350c1bcac4f0, var_66d7b2c988606651, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_closest");
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        var_23892b9ab76d2bf3 = var_e021c2744cc7ed68[0]["surfaceflags"];
        var_4b5a75d5223543c8 = physics_getsurfacetypefromflags(var_23892b9ab76d2bf3);
        var_2b9c39598d19ea34 = var_4b5a75d5223543c8["name"];
        if (isstartstr(var_2b9c39598d19ea34, "surftype_water")) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c75
// Size: 0x29e
function spawndropbagatposition(pos, var_add790a95b329400) {
    cleanupallbutxcratesforteam(self.team, 1);
    crate = namespace_6c578d6ef48f10ef::dropbrloadoutcrate(self.team, pos + (0, 0, 4096), pos + (0, 0, 512));
    /#
        assert(isdefined(crate));
    #/
    crate endon("death");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("redeploy_drone", "dropbag_collision_watcher")) {
        crate thread [[ namespace_3c37cb17ade254d::getsharedfunc("redeploy_drone", "dropbag_collision_watcher") ]]();
    }
    if (namespace_d20f8ef223912e12::function_374b5ec4199e8b21()) {
        crate setscriptablepartstate("objective_map", "custom");
        crate.var_7b5e5c2bbc8f9f79 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        if (crate.var_7b5e5c2bbc8f9f79 > -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(crate.var_7b5e5c2bbc8f9f79, "current", crate.origin, "ui_map_icon_drop_loadout");
            if (isdefined(crate.team)) {
                objective_removeallfrommask(crate.var_7b5e5c2bbc8f9f79);
                objective_showtoplayersinmask(crate.var_7b5e5c2bbc8f9f79);
                objective_addteamtomask(crate.var_7b5e5c2bbc8f9f79, crate.team);
                objective_setbackground(crate.var_7b5e5c2bbc8f9f79, 1);
            }
            objective_onentity(crate.var_7b5e5c2bbc8f9f79, crate);
            objective_setzoffset(crate.var_7b5e5c2bbc8f9f79, 70);
            crate thread function_164a7aa37ea0f8dd();
        }
    } else {
        crate.var_add790a95b329400 = var_add790a95b329400;
        enabledropbagobjective(crate, var_add790a95b329400);
    }
    choosedropbagmodel(crate);
    var_3be0d54d30a3593c = [];
    foreach (teammate in level.teamdata[self.team]["alivePlayers"]) {
        if (isdefined(teammate) && !teammate namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            var_3be0d54d30a3593c[var_3be0d54d30a3593c.size] = teammate;
            if (var_add790a95b329400 == 1) {
                teammate thread namespace_44abc05161e2e2cb::showsplash("br_airdrop_incoming_squad");
            } else {
                teammate thread namespace_44abc05161e2e2cb::showsplash("br_airdrop_incoming");
            }
        }
    }
    if (!namespace_d3d40f75bb4e4c32::istutorial()) {
        namespace_d3d40f75bb4e4c32::brleaderdialogteam("dropbag_incoming", self.team, 1, 2, undefined);
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        /#
            assert(isnumber(var_add790a95b329400));
        #/
        namespace_a011fbf6d93f25e5::branalytics_dropbagdeployed(self, pos, var_add790a95b329400, crate);
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1a
// Size: 0x22
function function_164a7aa37ea0f8dd() {
    level endon("game_ended");
    self waittill("death");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_7b5e5c2bbc8f9f79);
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f43
// Size: 0x1df
function spawndropbagsovertime(playerlist) {
    foreach (player in playerlist) {
        if (!isdefined(player)) {
            continue;
        }
        position = player.precomputeddropbagpos;
        if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
            circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
            circleradius = namespace_c5622898120e827f::getsafecircleradius();
            if (distance2dsquared(circleorigin, position) > circleradius * circleradius) {
                var_6cc1148e1d19e91e = vectornormalize(position - circleorigin);
                var_9a3f472a9b9f9a95 = circleorigin + var_6cc1148e1d19e91e * circleradius * 0.95;
                if (isnavmeshloaded()) {
                    position = getclosestpointonnavmesh(var_9a3f472a9b9f9a95);
                } else {
                    position = var_9a3f472a9b9f9a95;
                }
            }
            if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(position)) {
                circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
                var_9a3f472a9b9f9a95 = namespace_ad389306d44fc6b4::snappointtooutofboundstriggertrace(circleorigin, position);
                if (isnavmeshloaded()) {
                    position = getclosestpointonnavmesh(var_9a3f472a9b9f9a95);
                } else {
                    position = var_9a3f472a9b9f9a95;
                }
            }
        }
        if (namespace_36f464722d326bbe::function_e21746abaaaf8414() || namespace_36f464722d326bbe::function_314ff105a27cc131()) {
            if (function_b4255b6f102b056d(position)) {
                if (isnavmeshloaded()) {
                    position = getclosestpointonnavmesh(position);
                } else if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
                    circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
                    position = circleorigin;
                }
            }
        }
        var_902bf0ae43f091d9 = namespace_c3059e55bc606259::getdropbagspawntypeenum(0, 1, 0, 0, 0, 0);
        if (getdvarint(@"hash_589c7488b192cb36", 0) == 1) {
            var_902bf0ae43f091d9 = namespace_c3059e55bc606259::getdropbagspawntypeenum(1, 0, 0, 0, 0, 0);
        }
        player spawndropbagatposition(position, var_902bf0ae43f091d9);
        waitframe();
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2129
// Size: 0x99
function spawndropbagonlanding() {
    choosenlocation = undefined;
    choosenlocation = findunuseddropbaglocation(self);
    if (!isdefined(choosenlocation)) {
        var_2827e1b47ae2ab6e = getdvarfloat(@"hash_ccc87b710135b98b", 3000);
        var_deeef4b8cb10cae0 = getdvarfloat(@"hash_2c7210432530f899", 7000);
        choosenlocation = calculatedroplocationnearlocation(self, var_2827e1b47ae2ab6e, var_deeef4b8cb10cae0);
    }
    if (isdefined(choosenlocation)) {
        var_d20de36666a6d60a = namespace_c3059e55bc606259::getdropbagspawntypeenum(0, 0, 0, 0, 1, 0);
        spawndropbagatposition(choosenlocation.origin, var_d20de36666a6d60a);
        level thread managedropbags();
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c9
// Size: 0x1e3
function findunuseddropbaglocation(player) {
    var_16add9d62303e2d6 = [];
    var_2827e1b47ae2ab6e = getdvarfloat(@"hash_ccc87b710135b98b", 3000);
    var_deeef4b8cb10cae0 = getdvarfloat(@"hash_2c7210432530f899", 7000);
    mindistsq = var_2827e1b47ae2ab6e * var_2827e1b47ae2ab6e;
    maxdistsq = var_deeef4b8cb10cae0 * var_deeef4b8cb10cae0;
    foreach (cluster in level.dropbagstruct.clusters) {
        var_d2e4bddeddc9b4f9 = distance2dsquared(player.origin, cluster.origin);
        if (var_d2e4bddeddc9b4f9 >= mindistsq && var_d2e4bddeddc9b4f9 <= maxdistsq) {
            var_16add9d62303e2d6[var_16add9d62303e2d6.size] = cluster;
        }
    }
    if (var_16add9d62303e2d6.size == 0) {
        return undefined;
    }
    var_16add9d62303e2d6 = array_randomize(var_16add9d62303e2d6);
    var_106ac5fc8e31ec9f = 0;
    foreach (cluster in var_16add9d62303e2d6) {
        var_d6d0d0ab47b5b334 = array_randomize(cluster.droplocations);
        foreach (location in var_d6d0d0ab47b5b334) {
            if (!location.inuse) {
                location.inuse = 1;
                return location;
            }
        }
    }
    return undefined;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b4
// Size: 0x56
function enabledropbagobjective(crate, var_6884559161f6021) {
    crate setotherent(self);
    if (var_6884559161f6021 == 1) {
        crate setscriptablepartstate("objective", "active_squad");
    } else {
        crate setscriptablepartstate("objective", "active");
    }
    crate.var_83746f6469687186 = 1;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2411
// Size: 0x50
function function_4587a2683d863277(crate) {
    if (crate.var_add790a95b329400 == 1) {
        crate setscriptablepartstate("objective", "active_squad");
    } else {
        crate setscriptablepartstate("objective", "active");
    }
    crate.var_83746f6469687186 = 1;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2468
// Size: 0x2a
function disabledropbagobjective(crate) {
    crate setscriptablepartstate("objective", "inactive");
    crate.var_83746f6469687186 = 0;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2499
// Size: 0x25
function choosedropbagmodel(crate) {
    crate setotherent(self);
    crate setscriptablepartstate("model", "choose");
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c5
// Size: 0x85
function delaydropbags(var_70bcbf0ad5028219) {
    level endon("game_ended");
    var_bdb5d362355f04d0 = 0;
    foreach (delayseconds in var_70bcbf0ad5028219) {
        waittime = delayseconds - var_bdb5d362355f04d0;
        if (waittime > 0) {
            wait(waittime);
        }
        var_bdb5d362355f04d0 = delayseconds;
        precomputedropbagpositions(0);
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2551
// Size: 0x173
function allowreuseofalldropbags() {
    if (namespace_71073fa38f11492::isfeaturedisabled("dropbag")) {
        return;
    }
    foreach (crate in level.br_pickups.crates) {
        if (!isdefined(crate) || !isdefined(crate.team) || crate.team != self.team) {
            continue;
        }
        var_c9dba2970d4506fc = isdefined(crate.playerscaptured) && isdefined(crate.playerscaptured[self getentitynumber()]);
        if (var_c9dba2970d4506fc) {
            crate.playerscaptured[self getentitynumber()] = undefined;
            for (index = 0; index < crate.playersused.size; index++) {
                if (isdefined(crate.playersused[index]) && crate.playersused[index] == self) {
                    crate.playersused[index] = undefined;
                }
            }
            crate.playersused = array_removeundefined(crate.playersused);
            crate.numuses--;
        }
        if (!istrue(crate.var_83746f6469687186)) {
            function_4587a2683d863277(crate);
        }
    }
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26cb
// Size: 0xa
function onplayerrespawn() {
    allowreuseofalldropbags();
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26dc
// Size: 0x8f
function getdropbagspawntypeenum(var_dbe2a1d0a7766cfc, var_ef7a6a300ebf9493, var_e648e96614161011, var_283b7b1c42ab77de, var_fc0b9eab91a21b10, var_56f78457d5bfbac6) {
    /#
        assertex(var_dbe2a1d0a7766cfc + var_ef7a6a300ebf9493 + var_e648e96614161011 + var_283b7b1c42ab77de + var_fc0b9eab91a21b10 + var_56f78457d5bfbac6 == 1, "Illegal argument passed in - one and only one flag must be true.");
    #/
    if (istrue(var_dbe2a1d0a7766cfc)) {
        return 0;
    }
    if (istrue(var_ef7a6a300ebf9493)) {
        return 1;
    }
    if (istrue(var_e648e96614161011)) {
        return 1;
    }
    if (istrue(var_283b7b1c42ab77de)) {
        return 2;
    }
    if (istrue(var_fc0b9eab91a21b10)) {
        return 3;
    }
    if (istrue(var_56f78457d5bfbac6)) {
        return 4;
    }
    /#
        assertmsg("Somehow we sent an invalid drop bag spawn type.");
    #/
    return -1;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2773
// Size: 0x88
function function_efb496dab102df58() {
    /#
        if (!isdefined(self) || istrue(self.gulag)) {
            return;
        }
        mindist = 120;
        maxdist = 360;
        var_90438c7f217dc4a0 = calculatedroplocationnearlocation(self, mindist, maxdist);
        if (isdefined(var_90438c7f217dc4a0)) {
            var_c46075dfa7ca36d4 = namespace_c3059e55bc606259::getdropbagspawntypeenum(0, 0, 0, 0, 0, 1);
            spawndropbagatposition(var_90438c7f217dc4a0.origin, var_c46075dfa7ca36d4);
            level thread managedropbags();
        }
    #/
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2802
// Size: 0x23
function testmissionrewards() {
    runmissionrewarddelivery(level.players[0], level.players[0], undefined, 3);
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282c
// Size: 0xfd
function findclosestdroplocation(startlocation) {
    var_206c7349dd628bc8 = startlocation array_sort_with_func(level.dropbagstruct.clusters, &sortlocationsbydistance);
    foreach (cluster in var_206c7349dd628bc8) {
        var_d6d0d0ab47b5b334 = array_randomize(cluster.droplocations);
        foreach (location in var_d6d0d0ab47b5b334) {
            if (!location.inuse) {
                location.inuse = 1;
                return location;
            }
        }
    }
    return undefined;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2931
// Size: 0x47
function sortlocationsbydistance(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distancesquared(var_fcf7e6e6d8c4861.origin, self.origin) < distancesquared(var_fcf7b6e6d8c41c8.origin, self.origin);
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2980
// Size: 0x24c
function calculatedroplocationnearlocation(location, mindist, maxdist) {
    pos = location.origin;
    x = undefined;
    y = undefined;
    var_8b591b0bc361ab3d = randomint(2);
    direction = ter_op(var_8b591b0bc361ab3d, -1, 1);
    if (direction > 0) {
        x = randomfloatrange(pos[0] + mindist * direction, pos[0] + maxdist * direction);
        if (x >= level.br_level.br_mapbounds[0][0]) {
            x = level.br_level.br_mapbounds[0][0] - 250;
        }
    } else {
        x = randomfloatrange(pos[0] + maxdist * direction, pos[0] + mindist * direction);
        if (x <= level.br_level.br_mapbounds[1][0]) {
            x = level.br_level.br_mapbounds[1][0] + 250;
        }
    }
    var_8b591b0bc361ab3d = randomint(2);
    direction = ter_op(var_8b591b0bc361ab3d, -1, 1);
    if (direction > 0) {
        y = randomfloatrange(pos[1] + mindist * direction, pos[1] + maxdist * direction);
        if (y >= level.br_level.br_mapbounds[0][1]) {
            y = level.br_level.br_mapbounds[0][1] - 250;
        }
    } else {
        y = randomfloatrange(pos[1] + maxdist * direction, pos[1] + mindist * direction);
        if (y <= level.br_level.br_mapbounds[1][1]) {
            y = level.br_level.br_mapbounds[1][1] + 250;
        }
    }
    if (isnavmeshloaded()) {
        pointonnavmesh = getclosestpointonnavmesh((x, y, pos[2]));
        if (isdefined(pointonnavmesh)) {
            droplocation = spawnstruct();
            droplocation.origin = pointonnavmesh;
            return droplocation;
        }
    }
    droplocation = spawnstruct();
    droplocation.origin = (x, y, pos[2]);
    return droplocation;
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bd4
// Size: 0x29
function debugsphereonlocation(origin) {
    /#
        sphere(origin, 200, (1, 0, 0), 0, 5000);
    #/
}

// Namespace namespace_771a3ace0094a1c2/namespace_c3059e55bc606259
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c04
// Size: 0xb4
function maskobjectivetoplayerssquad(objective, var_9c34764b7d5ac247) {
    objective.visibilitymanuallycontrolled = 1;
    objective_removeallfrommask(objective.objidnum);
    foreach (player in level.squaddata[var_9c34764b7d5ac247.team][var_9c34764b7d5ac247.var_ff97225579de16a].players) {
        objective_addclienttomask(objective.objidnum, player);
    }
}

