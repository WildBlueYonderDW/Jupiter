// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace br_supply_drops_common;

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462
// Size: 0xa7
function init() {
    level notify("br_supply_drops_init");
    level.var_5d2af95280a3cf58 = getdvarint(@"hash_b2f1a70335c6a20b", 17250);
    level.var_f13b219a6cb9496 = [0:"onFirstDrop", 1:"generateFlightPath", 2:"supplyDropFall", 3:"planeDropRun", 4:"spawnDropCrate", 5:"onDropSpawned", 6:"onPlayerEnterGulag", 7:"onPlayerRespawn"];
    cratedata = namespace_6c578d6ef48f10ef::getleveldata("br_supply_drops_common");
    cratedata.hasnointeraction = 1;
    /#
        level thread function_5691429fc16cddc2();
    #/
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510
// Size: 0x239
function function_69b2e5235bfb7998(name, cratemodel, var_b55272982c57a2ce, onopenfunc) {
    if (!isdefined(level.var_ef63e063e320acfc)) {
        level.var_ef63e063e320acfc = [];
    }
    /#
        assertex(!isdefined(level.var_ef63e063e320acfc[name]), "Error registering supply drop type: duplicate type name");
    #/
    level.var_ef63e063e320acfc[name] = spawnstruct();
    level.var_ef63e063e320acfc[name].cratemodel = cratemodel;
    level.var_ef63e063e320acfc[name].funcs = [];
    level.var_ef63e063e320acfc[name].planemodel = "veh9_mil_air_cargo_plane_wm";
    level.var_ef63e063e320acfc[name].var_f01f4ab1d5d21f9c = getdvarint(@"hash_c5003af4e1ec5349", 0.3);
    level.var_ef63e063e320acfc[name].var_62ba925df2f38d68 = getdvarint(@"hash_b35f53a26ed16372", 5);
    level.var_ef63e063e320acfc[name].var_2e0d8ba0a46ce1b1 = getdvarint(@"hash_9604835948da8a54", 3);
    level.var_ef63e063e320acfc[name].userate = getdvarint(@"hash_b995fd166e3ec5b0", 1);
    level.var_ef63e063e320acfc[name].usetime = getdvarint(@"hash_b663c9a86f4ca8e3", 4);
    level.var_ef63e063e320acfc[name].name = name;
    if (!istrue(var_b55272982c57a2ce)) {
        level.var_ef63e063e320acfc[name].funcs["generateFlightPath"] = &function_4a7c28606a956f8d;
        level.var_ef63e063e320acfc[name].funcs["supplyDropFall"] = &function_7dec3b199d2e73b8;
        level.var_ef63e063e320acfc[name].funcs["planeDropRun"] = &function_8862805d448b58d4;
        level.var_ef63e063e320acfc[name].funcs["spawnDropCrate"] = &function_52f17e5fbec318a6;
        level.var_ef63e063e320acfc[name].funcs["onOpenFunc"] = onopenfunc;
    }
    return level.var_ef63e063e320acfc[name];
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x751
// Size: 0x6d
function function_80e49e34fc8d70b8(name, funcname, func) {
    /#
        assertex(isdefined(level.var_ef63e063e320acfc[name]), "Error registering supply drop func: unregistered supply drop type");
    #/
    /#
        assertex(array_contains(level.var_f13b219a6cb9496, funcname), "Error registering supply drop func: invalid function name");
    #/
    level.var_ef63e063e320acfc[name].funcs[funcname] = func;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0x60
function function_4b941a30db41d07e(container, opener) {
    if (isdefined(container.entity.smokesignal) && namespace_3f0ea7483345a2c0::iscontainerempty(container, opener)) {
        container.entity.smokesignal setscriptablepartstate("smoke_signal", "off", 1);
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82c
// Size: 0x197
function function_5691429fc16cddc2() {
    /#
        level thread function_d1044a7030f099f9();
    #/
    while (1) {
        wait(2);
        if (getdvar(@"hash_26efc86d59cbd50e", "") != "") {
            function_1241afbfb2cfed35(level.players[0].origin, getdvar(@"hash_26efc86d59cbd50e", ""));
            setdvar(@"hash_26efc86d59cbd50e", "");
        }
        if (getdvar(@"hash_c3236a6c15b391d3", "") != "") {
            function_1a01863a6ec2ad05(level.players[0].origin, getdvar(@"hash_c3236a6c15b391d3", ""));
            setdvar(@"hash_c3236a6c15b391d3", "");
        }
        if (getdvar(@"hash_67245232e538d11d", "") != "") {
            droptype = getdvar(@"hash_67245232e538d11d", "");
            dropstruct = level.var_ef63e063e320acfc[droptype];
            if (isdefined(dropstruct)) {
                var_8ee83e2cbd3d747d = level.players[0].origin;
                var_d4858c7c75f6ab04 = (var_8ee83e2cbd3d747d[0], var_8ee83e2cbd3d747d[1], 500);
                crate = [[ dropstruct.funcs["spawnDropCrate"] ]](var_8ee83e2cbd3d747d, dropstruct);
            }
            setdvar(@"hash_67245232e538d11d", "");
        }
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ca
// Size: 0x6
function function_1422ffcd34611fd1() {
    return 3044;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d8
// Size: 0x12f
function function_1a01863a6ec2ad05(pos, droptype) {
    var_a82277e7547cf269 = level.var_ef63e063e320acfc[droptype];
    planemodel = var_a82277e7547cf269.planemodel;
    pathstruct = [[ var_a82277e7547cf269.funcs["generateFlightPath"] ]](pos, var_a82277e7547cf269);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = function_1422ffcd34611fd1();
    time = dist / travelspeed;
    plane = function_2496cdd7babaed39(pathstruct, dist, travelspeed, time, planemodel);
    /#
        println("audio_exit");
    #/
    plane setscriptablepartstate("audio_loop", "on", 0);
    plane setscriptablepartstate("objective", "active_yellow", 0);
    plane moveto(plane.endpt, plane.lifetime);
    plane thread [[ var_a82277e7547cf269.funcs["planeDropRun"] ]](var_a82277e7547cf269);
    plane thread function_6cc331348e2faa9a();
    return plane;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0f
// Size: 0x48
function function_1241afbfb2cfed35(pos, droptype) {
    dropstruct = level.var_ef63e063e320acfc[droptype];
    crate = function_98e40becf6aae51f(pos, dropstruct);
    level.var_c9516b6c38fa7bc8 = crate;
    return crate;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5f
// Size: 0x117
function function_8862805d448b58d4(dropstruct) {
    self endon("death");
    var_bd693dcf6bece704 = self.lifetime;
    var_11f20c6978f7d6a6 = var_bd693dcf6bece704 * dropstruct.var_f01f4ab1d5d21f9c;
    numcrates = 0;
    wait(var_11f20c6978f7d6a6);
    while (numcrates < dropstruct.var_2e0d8ba0a46ce1b1) {
        if (dropstruct.var_62ba925df2f38d68 < var_bd693dcf6bece704 - var_11f20c6978f7d6a6) {
            wait(dropstruct.var_62ba925df2f38d68);
        } else {
            waitframe();
        }
        droplocation = function_95a507dc67864770(self.origin + anglestoforward(self.angles) * 500);
        if (!isdefined(droplocation)) {
            if (istrue(dropstruct.var_5214bb02998ff284)) {
                numcrates++;
            }
            continue;
        }
        crate = function_98e40becf6aae51f(droplocation, dropstruct);
        if (!isdefined(crate)) {
            continue;
        }
        if (numcrates == 0 && isdefined(dropstruct.funcs["onFirstDrop"])) {
            [[ dropstruct.funcs["onFirstDrop"] ]]();
        }
        numcrates++;
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7d
// Size: 0x148
function function_c28362a9638e7931(dropstruct) {
    level endon("game_ended");
    self endon("death");
    var_bd693dcf6bece704 = self.lifetime;
    var_11f20c6978f7d6a6 = var_bd693dcf6bece704 * dropstruct.var_f01f4ab1d5d21f9c;
    /#
        assertex(dropstruct.var_2e0d8ba0a46ce1b1 == 1, "brSupplyDrop_startSinglePreciseDrop only supports a single supply drop, adjust dropStruct.cratesToDrop to 1");
    #/
    var_d4dae76eac378b = (self.centerpt[0], self.centerpt[1], level.var_5d2af95280a3cf58);
    var_f8aae4b48dfccace = function_95a507dc67864770(var_d4dae76eac378b);
    var_6060a1273859d593 = (var_f8aae4b48dfccace[0], var_f8aae4b48dfccace[1], level.var_5d2af95280a3cf58);
    var_cff400c8a67610f7 = distance(self.origin, var_6060a1273859d593);
    while (1) {
        var_b0732ce0dde34a1f = distance(self.origin, self.startpt);
        if (var_b0732ce0dde34a1f >= var_cff400c8a67610f7) {
            break;
        }
        waitframe();
    }
    crate = function_98e40becf6aae51f(var_f8aae4b48dfccace, dropstruct);
    if (isdefined(dropstruct.funcs["onFirstDrop"])) {
        [[ dropstruct.funcs["onFirstDrop"] ]]();
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x142
function function_95a507dc67864770(starttrace, var_5ce47de2b275eec8) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 30000);
    ignorelist = [0:self];
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1, 1, 1);
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignorelist, contents);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        pos = trace["position"];
        droplocation = getclosestpointonnavmesh(pos);
        var_8391900d9d61fe30 = droplocation - pos;
        var_8391900d9d61fe30 = (var_8391900d9d61fe30[0], var_8391900d9d61fe30[1], 0);
        var_84d0c5c148da4a7a = 100;
        if (length2dsquared(var_8391900d9d61fe30) > var_84d0c5c148da4a7a * var_84d0c5c148da4a7a) {
            var_8391900d9d61fe30 = var_8391900d9d61fe30 + vectornormalize(var_8391900d9d61fe30) * getdvarint(@"hash_ada223fd974a9d0b", var_84d0c5c148da4a7a);
        }
        droplocation = getclosestpointonnavmesh(namespace_d3d40f75bb4e4c32::droptogroundmultitrace(droplocation + var_8391900d9d61fe30, 10500));
    }
    if (isdefined(droplocation) && !istrue(var_5ce47de2b275eec8)) {
        validpoint = namespace_c5622898120e827f::isvalidpointinbounds(droplocation, 1);
        if (!istrue(validpoint)) {
            droplocation = undefined;
        }
    }
    return droplocation;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf16
// Size: 0x15c
function function_4a7c28606a956f8d(centerpos, dropstruct) {
    r = level.br_level.br_circleradii[0];
    var_821b13082f214589 = function_53c4c53197386572(dropstruct.var_821b13082f214589, randomfloatrange(0, 360));
    var_6300d0f047679b46 = function_53c4c53197386572(dropstruct.var_6300d0f047679b46, level.var_5d2af95280a3cf58);
    var_639828dc8bac6376 = var_6300d0f047679b46;
    if (isdefined(dropstruct.zoffset)) {
        var_639828dc8bac6376 = var_639828dc8bac6376 + dropstruct.zoffset;
    }
    var_7d0d99f1231f6085 = (r * cos(var_821b13082f214589), r * sin(var_821b13082f214589), var_639828dc8bac6376);
    startpt = var_7d0d99f1231f6085 + centerpos;
    startpt = (startpt[0], startpt[1], var_639828dc8bac6376);
    endpt = centerpos - var_7d0d99f1231f6085;
    endpt = (endpt[0], endpt[1], var_639828dc8bac6376);
    pathdir = vectornormalize(endpt - startpt);
    pathstruct = spawnstruct();
    pathstruct.startpt = startpt;
    pathstruct.endpt = endpt;
    pathstruct.angle = vectortoangles(pathdir);
    pathstruct.centerpt = centerpos;
    return pathstruct;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107a
// Size: 0xa2
function function_6cc331348e2faa9a() {
    self endon("death");
    level endon("game_ended");
    wait(max(self.lifetime - 1, 0.05));
    self setscriptablepartstate("audio_exit", "on", 0);
    wait(1);
    self setscriptablepartstate("audio_loop", "off", 0);
    if (isdefined(self.minimapid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.minimapid);
    }
    if (isdefined(self.chassis)) {
        self.chassis delete();
    }
    if (isdefined(self)) {
        self delete();
    }
    /#
        println("<unknown string>");
    #/
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123
// Size: 0x141
function function_2496cdd7babaed39(var_41c8bb9afb483172, pathdist, var_f0192932004dce8d, var_5b16491505732b2b, model) {
    if (!isdefined(model)) {
        model = "veh9_mil_air_cargo_plane_wm";
    }
    plane = spawn("script_model", var_41c8bb9afb483172.startpt);
    plane setmodel(model);
    plane setcandamage(0);
    plane.maxhealth = 100000;
    plane.health = plane.maxhealth;
    plane.startpt = var_41c8bb9afb483172.startpt;
    plane.endpt = var_41c8bb9afb483172.endpt;
    plane.centerpt = var_41c8bb9afb483172.centerpt;
    plane.dir = vectornormalize(plane.endpt - plane.startpt);
    plane.angles = vectortoangles(plane.dir);
    plane.pathdist = pathdist;
    plane.speed = var_f0192932004dce8d;
    plane.lifetime = var_5b16491505732b2b;
    return plane;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126c
// Size: 0x104
function function_52f17e5fbec318a6(var_8ee83e2cbd3d747d, dropstruct, var_d4858c7c75f6ab04) {
    var_fdfe2d4aaf8ec33d = level.var_5d2af95280a3cf58;
    if (!isdefined(var_d4858c7c75f6ab04)) {
        var_d4858c7c75f6ab04 = (var_8ee83e2cbd3d747d[0], var_8ee83e2cbd3d747d[1], var_fdfe2d4aaf8ec33d);
    }
    crate = spawn("script_model", var_d4858c7c75f6ab04);
    crate setmodel(dropstruct.cratemodel);
    crate.physicsactivated = 0;
    crate.isdestroyed = 0;
    crate.id = "care_package";
    crate.userate = dropstruct.userate;
    crate.curprogress = 0;
    crate.usetime = dropstruct.usetime;
    crate.onopenfunc = dropstruct.onopenfunc;
    crate.supportsreroll = 0;
    crate.cratetype = "br_supply_drops_common";
    return crate;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1378
// Size: 0x12e
function function_98e40becf6aae51f(var_8ee83e2cbd3d747d, dropstruct) {
    crate = undefined;
    if (isdefined(dropstruct.funcs["spawnDropCrate"])) {
        crate = [[ dropstruct.funcs["spawnDropCrate"] ]](var_8ee83e2cbd3d747d, dropstruct);
    }
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        if (!istrue(crate.var_329fe561abc84fdb)) {
            chute = spawn("script_model", crate.origin);
            chute.angles = crate.angles;
            chute setmodel("veh9_mil_lnd_parachute_carepackage_br");
            crate.chute = chute;
            crate.var_c23ca3472233553d = 1;
            chute linkto(crate);
        }
        if (isdefined(dropstruct.funcs["onDropSpawned"])) {
            crate thread [[ dropstruct.funcs["onDropSpawned"] ]](var_8ee83e2cbd3d747d);
        }
        if (isdefined(dropstruct.funcs["supplyDropFall"])) {
            crate thread [[ dropstruct.funcs["supplyDropFall"] ]](var_8ee83e2cbd3d747d, dropstruct);
        }
    }
    return crate;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ae
// Size: 0x346
function function_7dec3b199d2e73b8(point, dropstruct) {
    self endon("death");
    var_81986b2d8e843970 = ter_op(isdefined(dropstruct.var_81986b2d8e843970), dropstruct.var_81986b2d8e843970, 10000000);
    var_eb4187dd85e05b36 = ter_op(isdefined(dropstruct.var_eb4187dd85e05b36), dropstruct.var_eb4187dd85e05b36, 1000);
    var_623db0cc7c389a05 = ter_op(isdefined(dropstruct.var_623db0cc7c389a05), dropstruct.var_623db0cc7c389a05, 1);
    if (var_eb4187dd85e05b36 > 0) {
        var_a8708d55fbea7fc2 = randomvector(1) * var_eb4187dd85e05b36;
        point = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(point + var_a8708d55fbea7fc2);
    }
    if (istrue(dropstruct.var_f453aecd14b7f921)) {
        thread function_d982cb8f96ba4d30();
    }
    var_4d7f0c602124bb0a = distancesquared(namespace_d3d40f75bb4e4c32::droptogroundmultitrace(self.origin, -100), self.origin);
    while (var_4d7f0c602124bb0a > var_81986b2d8e843970 && !istrue(self.var_69c5e9413f4bdb05)) {
        thread function_3a64ec0c7632f6cc(point, dropstruct);
        waitframe();
        var_4d7f0c602124bb0a = distancesquared(namespace_d3d40f75bb4e4c32::droptogroundmultitrace(self.origin, -100), self.origin);
    }
    self notify("crate_drift_end");
    self.var_661d71d55253757d = undefined;
    self.var_69c5e9413f4bdb05 = undefined;
    if (isdefined(self.chute)) {
        self.chute delete();
    }
    if (!istrue(self.physicsactivated)) {
        self unlink();
        self physicslaunchserver((0, 0, 0), (0, 0, 0));
        var_212a44a5393c3b34 = self physics_getbodyid(0);
        physics_setbodycenterofmassnormal(var_212a44a5393c3b34, (0, 0, -0.75));
        self.physicsactivated = 1;
    }
    endpos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(self.origin, 25, -20000);
    self physics_registerforcollisioncallback();
    thread namespace_6c578d6ef48f10ef::monitorimpactinternal(0.1);
    if (istrue(var_623db0cc7c389a05)) {
        scriptable = ter_op(isdefined(self.var_13ba232eee7e6069), self.var_13ba232eee7e6069, "ks_airdrop_crate_dmz");
        self.smokesignal = spawn("script_model", endpos);
        self.smokesignal setmodel(scriptable);
        self.smokesignal setscriptablepartstate("smoke_signal", "on", 0);
    }
    wait(3);
    if (!istrue(dropstruct.var_30daf66a65a215e7)) {
        self setscriptablepartstate("dmz_supply_drop", "usable");
    }
    childthread namespace_6c578d6ef48f10ef::monitoraveragevelocities(0.1, 8);
    var_717e0cfd076f91d = 0;
    while (1) {
        wait(0.1);
        avlinvel = namespace_6c578d6ef48f10ef::getaveragelinearvelocity();
        avangvel = namespace_6c578d6ef48f10ef::getaverageangularvelocity();
        if (!isdefined(avlinvel) || !isdefined(avangvel)) {
            continue;
        }
        if (avlinvel > namespace_6c578d6ef48f10ef::function_3c4492046080faa9() || avangvel > namespace_6c578d6ef48f10ef::function_f7e3f128296ac3b6()) {
            var_717e0cfd076f91d = 0;
            continue;
        }
        var_717e0cfd076f91d++;
        if (var_717e0cfd076f91d != namespace_6c578d6ef48f10ef::function_d4833b6c916db9c6()) {
            continue;
        }
        self.physicssettled = 1;
        break;
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fb
// Size: 0x2a
function function_d982cb8f96ba4d30() {
    self endon("death");
    self endon("crate_drift_end");
    wait(3);
    self waittill("collision");
    self.var_69c5e9413f4bdb05 = 1;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182c
// Size: 0x255
function function_3a64ec0c7632f6cc(point, dropstruct) {
    self endon("death");
    self endon("crate_drift_end");
    if (isdefined(self.var_661d71d55253757d)) {
        return;
    }
    self.var_661d71d55253757d = 1;
    timestep = ter_op(isdefined(dropstruct.timestep), dropstruct.timestep, 3);
    var_3077f6d3d97bb34b = ter_op(isdefined(dropstruct.var_3077f6d3d97bb34b), dropstruct.var_3077f6d3d97bb34b, 400);
    var_3c3ed534c61a56e4 = ter_op(isdefined(dropstruct.var_3c3ed534c61a56e4), dropstruct.var_3c3ed534c61a56e4, 100);
    var_94ae57fe158c3c29 = ter_op(isdefined(dropstruct.var_94ae57fe158c3c29), dropstruct.var_94ae57fe158c3c29, 100);
    var_9612b650d147f458 = ter_op(isdefined(dropstruct.var_9612b650d147f458), dropstruct.var_9612b650d147f458, 500);
    var_191ebd2dd0d5f975 = randomfloat(var_94ae57fe158c3c29) + var_3077f6d3d97bb34b;
    var_67a81e668b8a7dbd = randomfloat(var_9612b650d147f458) + var_3c3ed534c61a56e4;
    dir = point - self.origin;
    var_6ef6398383ae0cf6 = vectornormalize((dir[0], dir[1], 0));
    topoint = (var_6ef6398383ae0cf6[0] * var_67a81e668b8a7dbd, var_6ef6398383ae0cf6[1] * var_67a81e668b8a7dbd, 0 - var_191ebd2dd0d5f975);
    startpoint = self.origin;
    timer = 0;
    while (timer < timestep) {
        dt = level.framedurationseconds;
        t = timer / timestep;
        var_531e349ad5675163 = t * t * (3 - 2 * t);
        var_e3e0425bf610e7b4 = t * t * 0.5 + 0.5 * t;
        if (!isdefined(topoint) || !isdefined(var_531e349ad5675163) || !isdefined(var_e3e0425bf610e7b4)) {
            break;
        }
        var_868fbf655bd5e977 = (topoint[0] * var_531e349ad5675163, topoint[1] * var_531e349ad5675163, topoint[2] * var_e3e0425bf610e7b4);
        self.origin = startpoint + var_868fbf655bd5e977;
        timer = timer + dt;
        waitframe();
    }
    self.var_661d71d55253757d = undefined;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a88
// Size: 0x1fb
function function_94ff06d2db58e807(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!istrue(instance.entity.open)) {
        if (istrue(instance.entity function_6b3bfd072d1faafb(player))) {
            instance.entity.open = 1;
            instance.entity.playerusing = undefined;
            instance.entity notify("crate_opened");
        } else {
            return;
        }
    }
    if (isdefined(instance.entity.smokesignal) && !isdefined(instance.var_ceb543956c7203e7)) {
        instance.var_ceb543956c7203e7 = &function_4b941a30db41d07e;
    }
    instance setscriptablepartstate("dmz_supply_drop", "partially_open_in_use_unusable");
    if (isdefined(instance.entity.onopenfunc)) {
        [[ instance.entity.onopenfunc ]](instance, player);
    }
    if (isdefined(level.var_2ff67632074bc957)) {
        instance [[ level.var_2ff67632074bc957 ]](player);
    }
    items = getscriptablelootcachecontents(instance);
    if (issharedfuncdefined("pmc_missions", "onOpenSupplyDrop")) {
        items = [[ getsharedfunc("pmc_missions", "onOpenSupplyDrop") ]](player, instance, items);
    }
    if (!isdefined(instance.contents)) {
        instance.var_46a3a8565ac0c17c = 3;
        instance namespace_1b7e64f50cca9321::lootcachespawncontents(items, 1, player, instance.contents);
    } else {
        instance namespace_1b7e64f50cca9321::lootcachespawncontents(undefined, 1, player, instance.contents);
    }
    if (!isdefined(player.lootcachesopened)) {
        player.lootcachesopened = 1;
    } else {
        player.lootcachesopened++;
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8a
// Size: 0x128
function function_6b3bfd072d1faafb(player) {
    player endon("disconnect");
    player endon("joined_team");
    player endon("joined_spectators");
    self endon("crate_opened");
    level endon("game_ended");
    if (istrue(self.playerusing)) {
        return 0;
    }
    thread function_b8bfc63550a2b619(player);
    while (isdefined(player) && player namespace_f8065cafc523dba5::_isalive() && cankeepusingcrate(player) && player usebuttonpressed()) {
        if (!isdefined(self.playerusing)) {
            self.playerusing = 1;
        }
        self.curprogress = self.curprogress + level.framedurationseconds * self.userate;
        if (self.curprogress >= self.usetime) {
            self.curprogress = 0;
            stopusingcrate(player);
            return 1;
        }
        if (issharedfuncdefined("airdrop", "updateUIProgress")) {
            player [[ getsharedfunc("airdrop", "updateUIProgress") ]](self, 1);
        }
        waitframe();
    }
    self.playerusing = undefined;
    stopusingcrate(player);
    self.curprogress = 0;
    return 0;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dba
// Size: 0x3b
function function_b8bfc63550a2b619(player) {
    level endon("game_ended");
    self endon("crate_opened");
    player waittill_any_3("disconnect", "joined_team", "joined_spectators");
    self.playerusing = undefined;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfc
// Size: 0x35
function stopusingcrate(player) {
    if (issharedfuncdefined("airdrop", "updateUIProgress")) {
        player [[ getsharedfunc("airdrop", "updateUIProgress") ]](self, 0);
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e38
// Size: 0x63
function cankeepusingcrate(player) {
    if (!player namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (player meleebuttonpressed()) {
        return 0;
    }
    if (player isinexecutionvictim()) {
        return 0;
    }
    if (istrue(player.inlaststand)) {
        return 0;
    }
    if (distancesquared(player.origin, self.origin) >= 10000) {
        return 0;
    }
    return 1;
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea3
// Size: 0x88
function function_d545b198b75385f6() {
    if (!isdefined(level.var_ef63e063e320acfc)) {
        return;
    }
    foreach (dropstruct in level.var_ef63e063e320acfc) {
        if (isdefined(dropstruct.funcs["onPlayerEnterGulag"])) {
            self [[ dropstruct.funcs["onPlayerEnterGulag"] ]]();
        }
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f32
// Size: 0x89
function function_f5d7f1682f6fc578() {
    if (!isdefined(level.var_ef63e063e320acfc)) {
        return;
    }
    foreach (dropstruct in level.var_ef63e063e320acfc) {
        if (isdefined(dropstruct.funcs["onPlayerRespawn"])) {
            self thread [[ dropstruct.funcs["onPlayerRespawn"] ]]();
        }
    }
}

// Namespace br_supply_drops_common/namespace_fd99f400a596934b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc2
// Size: 0x155
function function_d1044a7030f099f9() {
    /#
        level endon("<unknown string>");
        while (1) {
            val = getdvarint(@"hash_d3c611ad65845e41", 0);
            if (val) {
                setdvar(@"hash_d3c611ad65845e41", 0);
                if (!isdefined(level.var_c9516b6c38fa7bc8)) {
                    continue;
                }
                selectedplayer = undefined;
                foreach (player in level.players) {
                    if (isbot(player)) {
                        selectedplayer = player;
                        break;
                    }
                }
                if (!isdefined(selectedplayer)) {
                    continue;
                }
                forward = anglestoforward(level.var_c9516b6c38fa7bc8.angles);
                pos = level.var_c9516b6c38fa7bc8.origin + forward * 35;
                groundpos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(pos);
                selectedplayer setorigin(groundpos);
                waitframe();
                selectedplayer botlookatpoint(level.var_c9516b6c38fa7bc8.origin, 11);
                waitframe();
                selectedplayer botpressbutton("<unknown string>", 20);
            }
            waitframe();
        }
    #/
}

