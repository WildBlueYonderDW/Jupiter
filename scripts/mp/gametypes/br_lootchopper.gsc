// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\events.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace br_lootchopper;

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626
// Size: 0x1d0
function init() {
    level.averagealliesz = 0;
    level.loot_choppers = [];
    if (namespace_cd0b2d039510b38d::getsubgametype() != "plunder") {
        registersharedfunc("br_lootchopper", "lootChopper_onCrateUse", &lootchopper_oncrateuse);
    }
    level.quadgridcenterpoints = [];
    level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (-21299.2, 41779.2, 0);
    level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (37683.2, 41779.2, 0);
    level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (37683.2, -17203.2, 0);
    level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (-21299.2, -17203.2, 0);
    level thread registerleveldataforvehicle();
    /#
        setdevdvarifuninitialized(@"hash_6e1432e14f4ba139", 0);
        setdevdvarifuninitialized(@"hash_1853d73ee1c86fd4", 0);
        setdevdvarifuninitialized(@"hash_d043ee66392f7b83", 6);
        setdevdvarifuninitialized(@"hash_117db97fcbbffbb8", 4500);
        setdevdvarifuninitialized(@"hash_6ab65ba1a8931841", 9999);
        setdevdvarifuninitialized(@"hash_5db4b9205b63bbd3", 0);
        setdevdvarifuninitialized(@"hash_880c7f3811901ea1", 1500);
        setdevdvarifuninitialized(@"hash_ad78da1d72e62dd3", 4000);
        setdevdvarifuninitialized(@"hash_38568daa586b1fe3", 6000);
        setdevdvarifuninitialized(@"hash_31c380c6ba1eab38", 360);
        setdevdvarifuninitialized(@"hash_31e696c6ba452352", 480);
        setdevdvarifuninitialized(@"hash_c027db5b75ded4aa", 100000);
        setdevdvarifuninitialized(@"hash_7daf22bb16ed19fe", 50000);
        setdevdvarifuninitialized(@"hash_6b87854981a58552", 3);
    #/
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fd
// Size: 0x3a
function registerleveldataforvehicle() {
    while (!isdefined(level.vehicle)) {
        waitframe();
    }
    var_e2818ad39a3341b4 = namespace_1f188a13f7e79610::vehicle_getleveldataforvehicle("loot_chopper", 1);
    var_e2818ad39a3341b4.canfly = 1;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e
// Size: 0x254
function lootchopper_initspawninfo(var_ed09715e306a1455) {
    var_a43491919a0d6a88 = lootchopper_getspawnlocations(var_ed09715e306a1455);
    level.loot_chopper_spawns = [];
    level.loot_chopper_spawns["quad_1"] = [];
    level.loot_chopper_spawns["quad_2"] = [];
    level.loot_chopper_spawns["quad_3"] = [];
    level.loot_chopper_spawns["quad_4"] = [];
    if (!isdefined(var_a43491919a0d6a88)) {
        return;
    }
    foreach (spawnzone in var_a43491919a0d6a88) {
        closestdist = undefined;
        closestquad = undefined;
        var_64602cfeef6c46da = undefined;
        if (var_ed09715e306a1455.isvalid) {
            foreach (quadindex, quad in var_ed09715e306a1455.quadpoints) {
                var_8d6061447ac0bf39 = distance2dsquared(spawnzone.origin, quad);
                if (!isdefined(closestdist) || var_8d6061447ac0bf39 < closestdist) {
                    closestdist = var_8d6061447ac0bf39;
                    closestquad = quad;
                    var_64602cfeef6c46da = "quad_" + quadindex + 1;
                }
            }
        } else {
            foreach (quadindex, quad in level.quadgridcenterpoints) {
                var_8d6061447ac0bf39 = distance2dsquared(spawnzone.origin, quad);
                if (!isdefined(closestdist) || var_8d6061447ac0bf39 < closestdist) {
                    closestdist = var_8d6061447ac0bf39;
                    closestquad = quad;
                    var_64602cfeef6c46da = "quad_" + quadindex + 1;
                }
            }
        }
        spawnzone.origin = spawnzone.origin * (1, 1, 0);
        spawnzone.origin = namespace_d20f8ef223912e12::getoffsetspawnoriginmultitrace(spawnzone.origin, (0, 0, 10000));
        level.loot_chopper_spawns[var_64602cfeef6c46da][level.loot_chopper_spawns[var_64602cfeef6c46da].size] = spawnzone;
    }
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa99
// Size: 0xda
function lootchopper_getspawnlocations(var_ed09715e306a1455) {
    var_1b5b62b6222f38c0 = [];
    foreach (location in level.br_prematchspawnlocations) {
        if (var_ed09715e306a1455.isvalid) {
            jumpiffalse(distance2dsquared(location.origin, var_ed09715e306a1455.center) > var_ed09715e306a1455.radius * var_ed09715e306a1455.radius) LOC_000000a1;
        } else {
        LOC_000000a1:
            newlocation = spawnstruct();
            newlocation.origin = location.origin;
            var_1b5b62b6222f38c0[var_1b5b62b6222f38c0.size] = newlocation;
        }
    }
    return var_1b5b62b6222f38c0;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7b
// Size: 0x11e
function lootchopper_initcircleinfo(circlecenter, circleradius) {
    var_ed09715e306a1455 = spawnstruct();
    var_ed09715e306a1455.isvalid = isdefined(circlecenter) && isdefined(circleradius);
    if (var_ed09715e306a1455.isvalid) {
        var_ed09715e306a1455.center = circlecenter;
        var_ed09715e306a1455.radius = circleradius;
        var_28752bf2ea017628 = 45;
        cosangle = cos(var_28752bf2ea017628);
        var_50972e48b8d175a4 = sin(var_28752bf2ea017628);
        var_ed09715e306a1455.quadpoints[0] = circlecenter + (-1 * cosangle, var_50972e48b8d175a4, 0) * circleradius * 0.5;
        var_ed09715e306a1455.quadpoints[1] = circlecenter + (cosangle, var_50972e48b8d175a4, 0) * circleradius * 0.5;
        var_ed09715e306a1455.quadpoints[2] = circlecenter + (cosangle, -1 * var_50972e48b8d175a4, 0) * circleradius * 0.5;
        var_ed09715e306a1455.quadpoints[3] = circlecenter + (-1 * cosangle, -1 * var_50972e48b8d175a4, 0) * circleradius * 0.5;
    }
    return var_ed09715e306a1455;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca1
// Size: 0x267
function lootchopper_managespawns() {
    level endon("game_ended");
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    circlecenter = undefined;
    circleradius = undefined;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        circlecenter = namespace_c5622898120e827f::getsafecircleorigin();
        circleradius = namespace_c5622898120e827f::getsafecircleradius();
    }
    var_ed09715e306a1455 = namespace_479f2912131dabfc::lootchopper_initcircleinfo(circlecenter, circleradius);
    lootchopper_initspawninfo(var_ed09715e306a1455);
    /#
        level thread function_fb7c809b0f8f7639();
    #/
    level waittill("br_prematchEnded");
    var_e1ce21e5b4d1163f = getdvarint(@"hash_d043ee66392f7b83", 6);
    var_477413d8c0675495 = getdvarint(@"hash_38568daa586b1fe3", 6000);
    var_f013e3fc1f370ca7 = getdvarint(@"hash_31c380c6ba1eab38", 360);
    var_3fb775a12c864c31 = getdvarint(@"hash_31e696c6ba452352", 480);
    if (level.mapname == "mp_br_mechanics") {
        var_477413d8c0675495 = 1000;
    }
    while (1) {
        var_992edc40264e2f58 = getdvarint(@"hash_1853d73ee1c86fd4", 0);
        if (!var_992edc40264e2f58) {
            waitframe();
            continue;
        }
        var_b1d5325407f562dd = randomintrange(var_f013e3fc1f370ca7, var_3fb775a12c864c31);
        if (istrue(level.usemilestonephases)) {
            namespace_4b0406965e556711::gameflagwait("activate_cash_helis");
        } else {
            wait(var_b1d5325407f562dd);
        }
        if (level.loot_choppers.size < var_e1ce21e5b4d1163f) {
            var_6eebc4632b89c8c8 = var_e1ce21e5b4d1163f - level.loot_choppers.size;
            for (i = 0; i < var_6eebc4632b89c8c8; i++) {
                var_32b962c704fde3e7 = i + 1;
                if (var_32b962c704fde3e7 > 4) {
                    var_32b962c704fde3e7 = 1;
                }
                patrolzone = lootchopper_findunoccupiedpatrolzone(level.loot_chopper_spawns["quad_" + var_32b962c704fde3e7], var_477413d8c0675495);
                if (!isdefined(patrolzone)) {
                    /#
                        iprintlnbold("chopper_support_turret_br" + var_32b962c704fde3e7 + "<unknown string>");
                    #/
                    wait(1);
                }
                if (i == 0) {
                    showsplashtoall("br_lootchopper_incoming");
                }
                lootchopper_spawn(patrolzone);
                if (istrue(level.usemilestonephases)) {
                    wait(randomintrange(1, 2));
                }
            }
            if (istrue(level.usemilestonephases)) {
                return;
            }
        } else {
            while (level.loot_choppers.size >= var_e1ce21e5b4d1163f) {
                waitframe();
            }
        }
    }
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0f
// Size: 0xe7
function function_fb7c809b0f8f7639() {
    /#
        level endon("<unknown string>");
        var_32b962c704fde3e7 = 0;
        while (1) {
            var_94498af4ca201804 = getdvarint(@"hash_6e1432e14f4ba139", 0);
            if (!var_94498af4ca201804) {
                waitframe();
                continue;
            }
            var_477413d8c0675495 = getdvarint(@"hash_38568daa586b1fe3", 6000);
            if (level.mapname == "<unknown string>") {
                var_477413d8c0675495 = 1000;
            }
            var_32b962c704fde3e7++;
            if (var_32b962c704fde3e7 > 4) {
                var_32b962c704fde3e7 = 1;
            }
            patrolzone = lootchopper_findunoccupiedpatrolzone(level.loot_chopper_spawns["<unknown string>" + var_32b962c704fde3e7], var_477413d8c0675495);
            if (!isdefined(patrolzone)) {
                iprintlnbold("chopper_support_turret_br" + var_32b962c704fde3e7 + "<unknown string>");
                wait(1);
            }
            showsplashtoall("<unknown string>");
            lootchopper_spawn(patrolzone);
            setdvar(@"hash_6e1432e14f4ba139", 0);
            waitframe();
        }
    #/
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffd
// Size: 0xc6
function lootchopper_findunoccupiedpatrolzone(var_eb629964517b0c20, var_6d423f3f70906691) {
    patrolzone = undefined;
    if (var_eb629964517b0c20.size > 0) {
        var_93e8eb0cc5bc4cb9 = [];
        foreach (var_6c00c2e1adf59f74 in var_eb629964517b0c20) {
            if (istrue(var_6c00c2e1adf59f74.chopperoccupied)) {
                continue;
            }
            if (lootchopper_isnearbyoccupiedspawns(var_6c00c2e1adf59f74, var_6d423f3f70906691)) {
                continue;
            }
            var_93e8eb0cc5bc4cb9[var_93e8eb0cc5bc4cb9.size] = var_6c00c2e1adf59f74;
        }
        if (var_93e8eb0cc5bc4cb9.size > 0) {
            patrolzone = var_93e8eb0cc5bc4cb9[randomint(var_93e8eb0cc5bc4cb9.size)];
        }
        if (isdefined(patrolzone)) {
            patrolzone.chopperoccupied = 1;
        }
    }
    return patrolzone;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cb
// Size: 0x117
function lootchopper_isnearbyoccupiedspawns(var_6c00c2e1adf59f74, var_6d423f3f70906691) {
    var_7128b7aee8de7665 = 0;
    var_1094f1264dd82c0c = level.loot_chopper_spawns;
    mindistsq = var_6d423f3f70906691 * var_6d423f3f70906691;
    if (isdefined(var_1094f1264dd82c0c)) {
        foreach (var_e7b2ec6d5cfcad0d in var_1094f1264dd82c0c) {
            foreach (var_c629cfb5aee5be94 in var_e7b2ec6d5cfcad0d) {
                if (istrue(var_c629cfb5aee5be94.chopperoccupied)) {
                    if (distance2dsquared(var_6c00c2e1adf59f74.origin, var_c629cfb5aee5be94.origin) < mindistsq) {
                        var_7128b7aee8de7665 = 1;
                        break;
                    }
                }
            }
            if (istrue(var_7128b7aee8de7665)) {
                break;
            }
        }
    }
    return var_7128b7aee8de7665;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ea
// Size: 0x81
function lootchopper_getzonebyindex(index) {
    var_6622760dd5560c8a = undefined;
    zonecount = 0;
    foreach (zone in level.loot_chopper_spawns) {
        if (zonecount == index) {
            var_6622760dd5560c8a = zone;
            break;
        }
        zonecount++;
    }
    return var_6622760dd5560c8a;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1273
// Size: 0x8b7
function lootchopper_spawn(patrolzone, var_ee7155023f428e5b, var_cecd1599dbcc976, overrideweapon) {
    patrollocation = undefined;
    patrolradius = getdvarint(@"hash_ad78da1d72e62dd3", 4000);
    if (isdefined(patrolzone)) {
        patrollocation = patrolzone.origin;
    } else {
        playersalive = [];
        foreach (player in level.players) {
            if (isreallyalive(player)) {
                playersalive[playersalive.size] = player;
            }
        }
        if (playersalive.size > 0) {
            randomindex = randomint(playersalive.size);
            patrollocation = playersalive[randomindex].origin;
        }
        if (isdefined(patrollocation)) {
            patrollocation = namespace_d20f8ef223912e12::getoffsetspawnoriginmultitrace(patrollocation, (0, 0, 10000));
        }
    }
    if (!isdefined(patrollocation)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_a5639d6f3f95033a = namespace_343543689c1d8859::getpathstart(patrollocation);
    startingangles = vectortoangles(patrollocation - var_a5639d6f3f95033a);
    if (getdvarint(@"hash_f3aec952abe1e494", 1)) {
        var_e0be8bb269d1b3ee = namespace_d3d40f75bb4e4c32::function_cc755ff7170d3dd0();
        var_18459465a6813445 = var_e0be8bb269d1b3ee + 10000;
        if (var_a5639d6f3f95033a[2] < var_18459465a6813445) {
            var_a5639d6f3f95033a = (var_a5639d6f3f95033a[0], var_a5639d6f3f95033a[1], var_18459465a6813445);
        }
    }
    var_6ea44339b53b31bc = ter_op(isdefined(var_ee7155023f428e5b), var_ee7155023f428e5b, "veh_chopper_support_dmz_mp");
    var_a5c6d4f05fa73949 = "veh8_mil_air_palfa_east";
    if (istrue(level.var_a83a4e71446bfef7)) {
        var_a5c6d4f05fa73949 = "veh9_mil_air_heli_hind";
    }
    if (isdefined(var_cecd1599dbcc976)) {
        var_a5c6d4f05fa73949 = var_cecd1599dbcc976;
    }
    chopper = namespace_f64231d5b7a2c3c4::_spawnhelicopter(level.players[randomint(level.players.size)], var_a5639d6f3f95033a, startingangles, var_6ea44339b53b31bc, var_a5c6d4f05fa73949);
    if (!isdefined(chopper)) {
        logstring("br_lootchopper::lootChopper_spawn - chopper failed to spawn!");
        return;
    }
    chopper.speed = 100;
    chopper.accel = 50;
    chopper.lifetime = getdvarint(@"hash_6ab65ba1a8931841", 9999);
    chopper.team = "neutral";
    chopper.angles = startingangles;
    chopper.flaresreservecount = getdvarint(@"hash_5db4b9205b63bbd3", 0);
    chopper.pathstart = var_a5639d6f3f95033a;
    chopper.pathgoal = patrollocation;
    chopper.currentaction = "patrol";
    chopper.currenttarget = undefined;
    chopper.heightoffset = (0, 0, getdvarint(@"hash_880c7f3811901ea1", 1500));
    chopper.patrolzone = patrolzone;
    chopper.patrollocation = patrollocation;
    chopper.patrolradius = patrolradius;
    chopper.stage3accradius = 35;
    chopper.crashoffset = chopper.heightoffset[2] - 250;
    chopper setmaxpitchroll(15, 15);
    chopper vehicle_setspeed(chopper.speed, chopper.accel);
    chopper sethoverparams(50, 5, 2.5);
    chopper setturningability(0.5);
    chopper setyawspeed(100, 25, 25, 0.1);
    chopper setcandamage(1);
    chopper setneargoalnotifydist(768);
    chopper setvehicleteam(chopper.team);
    chopper.health = getdvarint(@"hash_117db97fcbbffbb8", 4500);
    chopper.maxhealth = getdvarint(@"hash_117db97fcbbffbb8", 4500);
    chopper.currenthealth = getdvarint(@"hash_117db97fcbbffbb8", 4500);
    chopper namespace_6d9917c3dc05dbe9::registersentient("Level_Vehicle", chopper.team);
    chopper lootchopper_setupdamagefunctionality();
    chopper setscriptablepartstate("blinking_lights", "on", 0);
    chopper setscriptablepartstate("engine", "on", 0);
    turretmodel = "veh9_mil_air_heli_ahotel64_turret";
    linktag = "tag_turret_front";
    if (istrue(level.var_a83a4e71446bfef7)) {
        turretmodel = "veh9_mil_air_heli_hind_turret";
        linktag = "tag_turret";
    }
    weaponname = "chopper_support_turret_br";
    if (isdefined(overrideweapon)) {
        weaponname = overrideweapon;
    }
    chopper.frontturret = spawnturret("misc_turret", chopper gettagorigin(linktag), weaponname);
    chopper.frontturret setmodel(turretmodel);
    chopper.frontturret.team = chopper.team;
    chopper.frontturret.angles = chopper.angles;
    chopper.frontturret.turreton = 1;
    chopper.frontturret.name = "front_turret";
    chopper.frontturret.attackingtarget = undefined;
    chopper.frontturret.vehicleparent = "loot_chopper";
    chopper.frontturret linkto(chopper);
    chopper.frontturret setturretteam(chopper.team);
    chopper.frontturret setturretmodechangewait(0);
    chopper.frontturret setmode("manual");
    chopper.frontturret setdefaultdroppitch(45);
    chopper.frontturret.groundtargetent = spawn("script_model", chopper.origin);
    chopper.frontturret.groundtargetent setmodel("tag_origin");
    chopper.frontturret.groundtargetent dontinterpolate();
    if (!istrue(level.var_a83a4e71446bfef7)) {
        chopper.rearturret = spawnturret("misc_turret", chopper gettagorigin("tag_turret_rear"), weaponname);
        chopper.rearturret setmodel("veh9_mil_air_heli_ahotel64_turret");
        chopper.rearturret.team = chopper.team;
        chopper.rearturret.angles = chopper.angles;
        chopper.rearturret.turreton = 1;
        chopper.rearturret.name = "rear_turret";
        chopper.rearturret.attackingtarget = undefined;
        chopper.rearturret.vehicleparent = "loot_chopper";
        chopper.rearturret linkto(chopper);
        chopper.rearturret setturretteam(chopper.team);
        chopper.rearturret setturretmodechangewait(0);
        chopper.rearturret setmode("manual");
        chopper.rearturret setdefaultdroppitch(45);
        chopper.rearturret.groundtargetent = spawn("script_model", chopper.origin);
        chopper.rearturret.groundtargetent setmodel("tag_origin");
        chopper.rearturret.groundtargetent dontinterpolate();
    }
    level.loot_choppers[level.loot_choppers.size] = chopper;
    chopper.patrolfunc = &lootchopper_patrolzone;
    chopper.lootfunc = &lootchopper_droploot;
    chopper.cleanupfunc = &lootchopper_cleanup;
    chopper lootchopper_createobjective();
    chopper thread namespace_343543689c1d8859::choppersupport_neargoalsettings();
    chopper thread namespace_343543689c1d8859::choppersupport_watchdestroyed();
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        chopper thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&namespace_343543689c1d8859::choppersupport_handlemissiledetection);
    }
    chopper thread namespace_343543689c1d8859::choppersupport_movetolocation(chopper.pathgoal, 1);
    return chopper;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b32
// Size: 0x2f8
function lootchopper_setupdamagefunctionality() {
    self.vehiclename = "loot_chopper";
    namespace_ad22b9cf6a2b30d::set_vehicle_hit_damage_data(self.vehiclename, 20);
    lootchopper_modifyweapondamage("iw9_la_gromeo_mp", 4, 20);
    lootchopper_modifyweapondamage("iw9_la_kgolf_mp", 4, 20);
    lootchopper_modifyweapondamage("iw9_la_rpapa7_mp", 4, 20);
    lootchopper_modifyweapondamage("iw9_la_juliet_mp", 5, 20);
    lootchopper_modifyweapondamage("iw9_la_gromeo_mp", 4, 20);
    lootchopper_modifyweapondamage("iw9_la_mike32_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("c4_mp", 4, 20);
    lootchopper_modifyweapondamage("semtex_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("frag_grenade_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("pop_rocket_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("molotov_mp", 1.81818, 20);
    lootchopper_modifyweapondamage("at_mine_ap_mp", 1.81818, 20);
    lootchopper_modifyweapondamage("at_mine_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("thermite_mp", 1, 36);
    lootchopper_modifyweapondamage("thermite_av_mp", 1, 36);
    lootchopper_modifyweapondamage("thermite_bolt_mp", 1, 30);
    lootchopper_modifyweapondamage("thermite_xmike109_mp", 1, 52);
    lootchopper_modifyweapondamage("emp_grenade_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("claymore_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("semtex_bolt_mp", 2, 20);
    lootchopper_modifyweapondamage("semtex_xmike109_mp", 1.42857, 20);
    lootchopper_modifyweapondamage("chopper_gunner_proj_mp", 5, 20);
    lootchopper_modifyweapondamage("toma_proj_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("cruise_proj_mp", 6.66667, 20);
    lootchopper_modifyweapondamage("artillery_mp", 6.66667, 20);
    lootchopper_modifyweapondamage("nuke_mp", 10, 20);
    lootchopper_modifyweapondamage("gunship_hellfire_mp", 10, 20);
    lootchopper_modifyweapondamage("gunship_105mm_mp", 10, 20);
    lootchopper_modifyweapondamage("gunship_40mm_mp", 5, 20);
    lootchopper_modifyweapondamage("gunship_25mm_mp", 2.85714, 20);
    lootchopper_modifyweapondamage("hover_jet_proj_mp", 5, 20);
    namespace_5a0f3ca265d3a4c8::vehicle_damage_enableownerdamage(self);
    namespace_ad22b9cf6a2b30d::get_vehicle_mod_damage_data(self.vehiclename, 1);
    namespace_ad22b9cf6a2b30d::set_pre_mod_damage_callback(self.vehiclename, &lootchopper_premodifydamage);
    namespace_ad22b9cf6a2b30d::set_post_mod_damage_callback(self.vehiclename, &lootchopper_postmodifydamage);
    namespace_ad22b9cf6a2b30d::set_death_callback(self.vehiclename, &lootchopper_handledeathdamage);
    namespace_9abe40d2af041eb2::function_cfc5e3633ef950fd(1, 2000, &function_c300bcca405c826d);
    namespace_9abe40d2af041eb2::function_cfc5e3633ef950fd(2, 1000, &function_f70041f0a83148ce);
    namespace_9abe40d2af041eb2::function_cfc5e3633ef950fd(3, 500, &function_3cd972f38ff76d2c);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(self);
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e31
// Size: 0x40
function lootchopper_modifyweapondamage(weaponname, var_dc9cc1d7198502c2, var_e88cbe78a1e25e8a) {
    namespace_ad22b9cf6a2b30d::set_weapon_hit_damage_data_for_vehicle(weaponname, var_dc9cc1d7198502c2, self.vehiclename);
    namespace_ad22b9cf6a2b30d::set_vehicle_hit_damage_data_for_weapon(self.vehiclename, var_e88cbe78a1e25e8a, weaponname);
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e78
// Size: 0x3a
function lootchopper_premodifydamage(data) {
    damage = data.damage;
    attacker = data.attacker;
    return 1;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eba
// Size: 0x106
function lootchopper_postmodifydamage(data) {
    namespace_343543689c1d8859::function_400022dabdb64055(data);
    if (!isdefined(self.attackers)) {
        self.attackers = [];
    }
    var_996b260954d28d79 = lootchopper_getattackerdata(data.attacker);
    if (!isdefined(var_996b260954d28d79)) {
        var_bbca3e84d8043876 = spawnstruct();
        var_bbca3e84d8043876.player = data.attacker;
        var_bbca3e84d8043876.objweapon = data.objweapon;
        var_bbca3e84d8043876.totaldamage = data.damage;
        self.attackers[self.attackers.size] = var_bbca3e84d8043876;
    } else {
        var_996b260954d28d79.totaldamage = var_996b260954d28d79.totaldamage + data.damage;
        var_996b260954d28d79.objweapon = data.objweapon;
    }
    namespace_9abe40d2af041eb2::killstreak_updatedamagestate(self.currenthealth);
    return 1;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc8
// Size: 0x136
function lootchopper_handledeathdamage(data) {
    namespace_343543689c1d8859::choppersupport_handledeathdamage(data);
    scoreevent = undefined;
    points = undefined;
    killer = data.attacker;
    foreach (var_a64d70120038e5fa in self.attackers) {
        if (isdefined(var_a64d70120038e5fa.player)) {
            if (isdefined(killer) && killer == var_a64d70120038e5fa.player) {
                scoreevent = #"hash_916af74a28436e1c";
            } else {
                scoreevent = #"hash_59b8198b31baf7ea";
            }
            points = namespace_62c556437da28f50::getscoreinfovalue(scoreevent);
            var_a64d70120038e5fa.player thread namespace_62c556437da28f50::giverankxp(scoreevent, points, var_a64d70120038e5fa.objweapon);
            var_a64d70120038e5fa.player thread namespace_391de535501b0143::killeventtextpopup(scoreevent, 0);
            thread namespace_aad14af462a74d08::vehiclekilled(self, var_a64d70120038e5fa.player, 0, var_a64d70120038e5fa.objweapon);
        }
    }
    self notify("death");
    return 1;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2106
// Size: 0xfb
function lootchopper_patrolzone(var_ce938a4ea8a54d5) {
    if (self.currentaction != "patrol") {
        self.currentaction = "patrol";
    } else if (self.currentaction == "patrol" && !istrue(var_ce938a4ea8a54d5)) {
        return;
    }
    self clearlookatent();
    self setneargoalnotifydist(300);
    var_65af68838583c396 = 0;
    var_b9a46106a6a99ee8 = 0;
    while (1) {
        if (self.currentaction == "attacking") {
            if (!istrue(var_65af68838583c396)) {
                var_65af68838583c396 = 1;
            }
            waitframe();
            continue;
        }
        if (!istrue(var_ce938a4ea8a54d5) && istrue(var_65af68838583c396)) {
            var_65af68838583c396 = 0;
        }
        var_6e281dbd69fc980e = self.patrollocation + anglestoforward((0, var_b9a46106a6a99ee8, 0)) * int(self.patrolradius / 1.2);
        var_b9a46106a6a99ee8 = var_b9a46106a6a99ee8 + 90;
        namespace_343543689c1d8859::choppersupport_movetolocation(var_6e281dbd69fc980e, 1);
        if (var_b9a46106a6a99ee8 >= 360) {
            var_b9a46106a6a99ee8 = 0;
        }
        wait(0.5);
    }
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2208
// Size: 0x6b
function lootchopper_droploot() {
    droplocation = lootchopper_finddroplocation(self.origin + (0, 0, 500));
    if (isdefined(droplocation)) {
        var_e38f5ec33ed2cb0 = namespace_6c578d6ef48f10ef::dropbrlootchoppercrate(self.origin, droplocation);
        var_ef5d5141fdb51174 = namespace_6c578d6ef48f10ef::gettriggerobject(var_e38f5ec33ed2cb0);
        var_ef5d5141fdb51174.usetimeoverride = 10;
    }
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227a
// Size: 0xa6
function lootchopper_finddroplocation(starttrace) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 20000);
    ignorelist = [];
    if (isent(self)) {
        ignorelist = [0:self, 1:self.frontturret, 2:self.rearturret];
        ignorelist = array_removeundefined(ignorelist);
    }
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignorelist);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        droplocation = trace["position"];
    }
    return droplocation;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2328
// Size: 0x166
function lootchopper_oncrateuse(player) {
    var_c8a8cadcfbff950a = getdvarint(@"hash_c027db5b75ded4aa", 100000);
    if (istrue(level.bmoovertime)) {
        var_e168aeaf2d8a83f4 = getdvarint(@"hash_7daf22bb16ed19fe", 50000);
        var_c8a8cadcfbff950a = var_c8a8cadcfbff950a + var_e168aeaf2d8a83f4;
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    dropstruct.var_dfba5a2c3c6f0a07 = 10;
    self.itemsdropped = 0;
    var_e05413a53b5d9167 = namespace_c6ccccd95254983f::dropplunderbyrarity(var_c8a8cadcfbff950a / 100, dropstruct);
    foreach (ent in var_e05413a53b5d9167) {
        ent.lootsource = "loot_chopper";
    }
    if (!isdefined(player.lootcachesopened)) {
        player.lootcachesopened = 1;
    } else {
        player.lootcachesopened++;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "risk" || namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("lootCachesOpened", player.lootcachesopened);
    }
    player thread namespace_48a08c5037514e04::doscoreevent(#"hash_70e5de61cfaa916b");
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2495
// Size: 0x7d
function lootchopper_cleanup() {
    if (isdefined(self.dropzone)) {
        self.dropzone delete();
    }
    if (isdefined(self.patrolzone)) {
        self.patrolzone.chopperoccupied = undefined;
    }
    if (isdefined(self.objectiveiconid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    level.loot_choppers = array_remove(level.loot_choppers, self);
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2519
// Size: 0x6b
function lootchopper_createobjective() {
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "active", self.origin, "ui_mp_br_mapmenu_icon_boss_chopper", "icon_medium");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objectiveiconid);
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(objectiveiconid, self);
        objective_sethideelevation(objectiveiconid, 1);
    }
    self.objectiveiconid = objectiveiconid;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258b
// Size: 0x93
function lootchopper_getattackerdata(var_76b6b96d4589e81d) {
    attackerdata = undefined;
    if (!isdefined(var_76b6b96d4589e81d)) {
        return attackerdata;
    }
    foreach (var_6b478dcf436ae4c0 in self.attackers) {
        if (isdefined(var_6b478dcf436ae4c0.player) && var_76b6b96d4589e81d == var_6b478dcf436ae4c0.player) {
            attackerdata = var_6b478dcf436ae4c0;
            break;
        }
    }
    return attackerdata;
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2626
// Size: 0x14
function function_c300bcca405c826d() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2641
// Size: 0x14
function function_f70041f0a83148ce() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace br_lootchopper/namespace_479f2912131dabfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265c
// Size: 0x14
function function_3cd972f38ff76d2c() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

