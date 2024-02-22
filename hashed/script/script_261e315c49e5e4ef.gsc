// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_58f20490049af6ac;
#using script_46cf752d93dc17b;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_e84530fe9afbbd74;

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0x1ac
function init() {
    namespace_fd99f400a596934b::init();
    if (getdvarint(@"hash_74abb928ab13113b", 0) && !getdvarint(@"hash_82bde055b11e6698", 0) && isdefined(level.arrow)) {
        dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("br_elite_arrow_bombsite_drop", "military_carepackage_01_cq");
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_elite_arrow_bombsite_drop", "planeDropRun", &function_4583dcd65450a629);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_elite_arrow_bombsite_drop", "spawnDropCrate", &function_849aa3a04cef2d5c);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_elite_arrow_bombsite_drop", "supplyDropFall", &function_daaa2ba7597fe13e);
        dropstruct function_90692628e3f5a1c1();
    }
    if (!getdvarint(@"hash_48cbd77125939b20", 1)) {
        dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("legendary_supply_drop");
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("legendary_supply_drop", "planeDropRun", &function_4583dcd65450a629);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("legendary_supply_drop", "spawnDropCrate", &function_54fed18839fe1a00);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("legendary_supply_drop", "supplyDropFall", &function_8e11624a19039380);
        dropstruct function_20d10ab03caa7c74();
    }
    if (!getdvarint(@"hash_4c8e33496c92cd2e", 0)) {
        dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("br_loadout_drop");
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_loadout_drop", "spawnDropCrate", &function_70500b035ce9f1c);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_loadout_drop", "supplyDropFall", &function_4d10308e44e23ac2);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_loadout_drop", "onPlayerEnterGulag", &function_fd96e89abd30cc4f);
        dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_loadout_drop", "onPlayerRespawn", &function_de7e06e42793bd7f);
        game["dialog"]["dropbag_incoming"] = "drpb_grav_gmst";
    }
    namespace_7f0bcee5d45a1dea::callback("br_supply_drops_init");
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551
// Size: 0x15
function function_4583dcd65450a629(dropstruct) {
    thread namespace_fd99f400a596934b::function_c28362a9638e7931(dropstruct);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d
// Size: 0x27
function function_849aa3a04cef2d5c(var_8ee83e2cbd3d747d, dropstruct) {
    crate = function_8992a7892fe3a42c(var_8ee83e2cbd3d747d);
    return crate;
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c
// Size: 0x2b
function function_daaa2ba7597fe13e(var_8ee83e2cbd3d747d, dropstruct) {
    crate = self;
    crate thread function_f19fdce841e05d0d(var_8ee83e2cbd3d747d, dropstruct);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce
// Size: 0x38
function function_20d10ab03caa7c74() {
    dropstruct = self;
    dropstruct.var_2e0d8ba0a46ce1b1 = 1;
    dropstruct.zoffset = level.var_5d2af95280a3cf58 * -0.5;
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d
// Size: 0x8c
function function_54fed18839fe1a00(var_8ee83e2cbd3d747d, dropstruct) {
    var_d4858c7c75f6ab04 = var_8ee83e2cbd3d747d + (0, 0, level.var_5d2af95280a3cf58 / 2 - 600);
    angles = (0, 0, 0);
    crate = namespace_6c578d6ef48f10ef::createcrate(undefined, undefined, "legendary_supply_drop", var_d4858c7c75f6ab04, angles, var_8ee83e2cbd3d747d, undefined, 1);
    if (isdefined(crate)) {
        crate.var_329fe561abc84fdb = 1;
        crate.var_4cd5b8f62d173211 = 1;
    }
    return crate;
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0x33
function function_8e11624a19039380(var_8ee83e2cbd3d747d, dropstruct) {
    level endon("game_ended");
    level endon("br_ending_start");
    crate = self;
    if (isdefined(crate)) {
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6db
// Size: 0x67
function function_70500b035ce9f1c(var_8ee83e2cbd3d747d, dropstruct) {
    var_d4858c7c75f6ab04 = var_8ee83e2cbd3d747d + (0, 0, level.var_5d2af95280a3cf58);
    crate = namespace_6c578d6ef48f10ef::dropbrloadoutcrate("neutral", var_d4858c7c75f6ab04, var_8ee83e2cbd3d747d);
    if (isdefined(crate)) {
        crate.var_329fe561abc84fdb = 1;
        crate.var_4cd5b8f62d173211 = 1;
    }
    return crate;
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a
// Size: 0x5f
function function_4d10308e44e23ac2(var_8ee83e2cbd3d747d, dropstruct) {
    level endon("game_ended");
    level endon("br_ending_start");
    crate = self;
    if (isdefined(crate)) {
        crate function_a37db87a4770b8a();
        crate childthread function_c8a76e7b9d477bcc();
        crate childthread function_643937a5f43eb434();
        crate childthread function_9e398892d48ba3a6();
        level notify("loadout_crate_fall", crate);
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0
// Size: 0x1bf
function function_607167c18661377b(var_70bcbf0ad5028219, droptype, var_a07a6cc29e3b5458) {
    level notify("loadout_plane_stop");
    level endon("loadout_plane_stop");
    level endon("game_ended");
    level endon("br_ending_start");
    var_308d5f146d61745d = getdvarint(@"hash_4cc81b833e45a79d", 3);
    if (var_308d5f146d61745d == 0) {
        return;
    }
    if (!isdefined(droptype)) {
        droptype = "br_loadout_drop";
    }
    var_7ba2c5f32045574 = 0;
    for (i = 0; i < var_70bcbf0ad5028219.size; i++) {
        delaytime = var_70bcbf0ad5028219[i];
        waittime = delaytime - var_7ba2c5f32045574;
        if (waittime <= 0) {
            continue;
        }
        wait(waittime);
        var_7ba2c5f32045574 = delaytime;
        multicirclecount = 1;
        if (istrue(level.var_2df69b8e552238b6) && !function_29e8194ff7e13e2e() && !function_d8fbacc18e5d8498()) {
            multicirclecount = function_d987886bb9de9137();
        }
        cratecount = getdvarint(@"hash_711a9f3cf948c5c9", 8);
        if (i > 0) {
            cratecount = getdvarint(@"hash_b3d8a888eea5f976", 3);
            var_308d5f146d61745d = 1;
        }
        if (multicirclecount > 1) {
            var_2e0d8ba0a46ce1b1 = int(ceil(cratecount / multicirclecount));
            for (var_879103158bbd385a = 0; var_879103158bbd385a < multicirclecount; var_879103158bbd385a++) {
                function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, var_879103158bbd385a, undefined, undefined, droptype);
                waitframe();
            }
        } else if (var_308d5f146d61745d == 2) {
            function_bdc1fb0f306d02fa(cratecount, droptype);
        } else if (var_308d5f146d61745d == 3) {
            function_f12f1b0fd0c95b97(cratecount, droptype);
        } else {
            function_c3d1f879c57a12a6(cratecount, 0, undefined, undefined, droptype);
        }
        if (!isdefined(var_a07a6cc29e3b5458) || !var_a07a6cc29e3b5458) {
            level childthread function_792f056feea2f3c9();
        }
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x976
// Size: 0xb4
function function_bdc1fb0f306d02fa(cratecount, droptype) {
    var_821b13082f214589 = randomfloatrange(0, 360);
    var_2e0d8ba0a46ce1b1 = int(ceil(cratecount / 2));
    function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, 0, var_821b13082f214589, undefined, droptype);
    var_8cf8ffdb3d3b7d6e = getdvarfloat(@"hash_f96cf03ab951508e", 2);
    if (var_8cf8ffdb3d3b7d6e > 0) {
        wait(var_8cf8ffdb3d3b7d6e);
    }
    offsetangle = 90;
    var_f7b5065a48a75b79 = randomfloatrange(-5, 5);
    var_821b13082f214589 = angleclamp(var_821b13082f214589 + offsetangle + var_f7b5065a48a75b79);
    function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, 0, var_821b13082f214589, undefined, droptype);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa31
// Size: 0xeb
function function_f12f1b0fd0c95b97(cratecount, droptype) {
    var_821b13082f214589 = randomfloatrange(0, 360);
    if (getdvarint(@"hash_89202350d7308671", 1)) {
        circlecenter = getsafecircleorigin();
        var_821b13082f214589 = vectortoyaw(circlecenter * -1);
    }
    var_2e0d8ba0a46ce1b1 = int(ceil(cratecount / 3));
    var_4da52bfabb572a1d = getdvarfloat(@"hash_407d738b9ba721fd", 0.5);
    function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, 0, var_821b13082f214589, 0, droptype);
    var_555ad7fd7f889a31 = getdvarfloat(@"hash_974235136f18adef", 5);
    if (var_555ad7fd7f889a31 > 0) {
        wait(var_555ad7fd7f889a31);
    }
    function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, 0, var_821b13082f214589, var_4da52bfabb572a1d, droptype);
    waitframe();
    function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, 0, var_821b13082f214589, -1 * var_4da52bfabb572a1d, droptype);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb23
// Size: 0x2c0
function function_c3d1f879c57a12a6(var_2e0d8ba0a46ce1b1, var_822c3c9bbe304562, var_d9aa6a35eb465619, var_eda78f398e8dfbde, droptype) {
    if (!isdefined(droptype)) {
        droptype = "br_loadout_drop";
    }
    dropstruct = level.var_ef63e063e320acfc[droptype];
    if (!isdefined(dropstruct)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Supply drop type "" + droptype + "" does not exist.");
        return;
    }
    var_e81e88a0ec548b57 = level.br_level.br_circleradii[0];
    if (var_2e0d8ba0a46ce1b1 <= 0 || var_e81e88a0ec548b57 <= 0) {
        return;
    }
    var_5d55352ed330471c = namespace_fd99f400a596934b::function_1422ffcd34611fd1();
    droppos = getsafecircleorigin();
    circleradius = getsafecircleradius();
    if (istrue(level.var_2df69b8e552238b6)) {
        droppos = function_799fe4ee850f911(var_822c3c9bbe304562);
        circleradius = function_8a985543e6853bbd(var_822c3c9bbe304562);
    } else {
        var_1f191f72b443bb6d = getdvarint(@"hash_daf294d5b4e5a87a", 0);
        if (var_1f191f72b443bb6d) {
            droppos = getnextsafecircleorigin();
            circleradius = getnextsafecircleradius();
        }
    }
    if (isdefined(level.var_e486acb8f70c45a2) && flag("chokehold_closed")) {
        droppos = getdangercircleorigin();
        circleradius = getdangercircleradius();
    }
    if (!isdefined(level.br_circle)) {
        circleradius = level.br_level.br_circleradii[0];
    }
    if (isdefined(var_d9aa6a35eb465619) && isdefined(var_eda78f398e8dfbde) && var_eda78f398e8dfbde != 0) {
        var_b0915b4828983df7 = vectornormalize(anglestoright((0, var_d9aa6a35eb465619, 0)));
        var_d2666395e6cf4732 = var_eda78f398e8dfbde * circleradius;
        droppos = droppos + var_b0915b4828983df7 * var_d2666395e6cf4732;
        circleradius = sqrt(squared(circleradius) - squared(var_d2666395e6cf4732));
    }
    var_e12d1c28ef3db42a = circleradius * 2;
    pathdistance = var_e81e88a0ec548b57 * 2;
    var_f01f4ab1d5d21f9c = (var_e81e88a0ec548b57 - circleradius) / pathdistance;
    var_58ad628ea64156f9 = var_e12d1c28ef3db42a / var_5d55352ed330471c / (var_2e0d8ba0a46ce1b1 + 1);
    dropstruct.var_2e0d8ba0a46ce1b1 = var_2e0d8ba0a46ce1b1;
    dropstruct.var_f01f4ab1d5d21f9c = var_f01f4ab1d5d21f9c;
    dropstruct.var_62ba925df2f38d68 = var_58ad628ea64156f9;
    dropstruct.var_322b7887f80acc62 = 1;
    dropstruct.zoffset = getdvarfloat(@"hash_8f28d4ead9cec8ea", 1000) * var_822c3c9bbe304562;
    dropstruct.var_821b13082f214589 = var_d9aa6a35eb465619;
    var_b75b26bd9c0f60ad = getdvarint(@"hash_d62b4f29572ebf87", 1);
    if (var_b75b26bd9c0f60ad) {
        dropstruct.var_5214bb02998ff284 = 1;
    }
    namespace_fd99f400a596934b::function_1a01863a6ec2ad05(droppos, droptype);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdea
// Size: 0x36
function function_792f056feea2f3c9() {
    level notify("crate_fall_watch");
    level endon("crate_fall_watch");
    level waittill("loadout_crate_fall");
    level childthread function_ad91760f4f41c169(2.5);
    level childthread function_ab8c6a785614ca99(1);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe27
// Size: 0x8f
function function_ad91760f4f41c169(delaytime) {
    if (isdefined(delaytime) && delaytime > 0) {
        wait(delaytime);
    }
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_airdrop_incoming");
        }
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebd
// Size: 0x3e
function function_ab8c6a785614ca99(delaytime) {
    if (isdefined(delaytime) && delaytime > 0) {
        wait(delaytime);
    }
    if (!namespace_d3d40f75bb4e4c32::istutorial()) {
        namespace_d3d40f75bb4e4c32::brleaderdialog("dropbag_incoming", 1, undefined, 0, 2, undefined, "dx_br_dmzc_");
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf02
// Size: 0x186
function function_a37db87a4770b8a() {
    crate = self;
    crate.minimapicon = "ui_map_icon_drop_loadout";
    crate namespace_6c578d6ef48f10ef::createminimapicon();
    objid = crate.minimapid;
    if (isdefined(objid) && objid != -1) {
        crate setscriptablepartstate("objective_map", "custom");
        objective_state(objid, "active");
        objective_setownerteam(objid, "neutral");
        objective_setlabel(objid, "MP_INGAME_ONLY/DROP_BAG_CAPS");
        objective_setzoffset(objid, 75);
        objective_setpings(objid, 1);
        function_a16750cd44f57931(objid, 1);
        function_865f9c5d005f9a08(objid, 1);
        var_467f4d9b8d9063b = getdvarfloat(@"hash_e9d0abfe80024d80", 3937);
        var_d9db7be56114e3b9 = getdvarfloat(@"hash_ec4adb02477bc5b2", 0.97);
        var_a7c6c5d6c3d369aa = var_467f4d9b8d9063b * var_d9db7be56114e3b9;
        function_c047d7ffe7a83501(objid, var_a7c6c5d6c3d369aa, var_467f4d9b8d9063b);
        foreach (player in level.players) {
            if (isalive(player) && !isbot(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
            }
        }
        crate.var_7b5e5c2bbc8f9f79 = objid;
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0xbb
function function_c8a76e7b9d477bcc() {
    crate = self;
    crate notify("crate_impact_watch");
    crate endon("crate_impact_watch");
    crate endon("death");
    wait(1);
    crate waittill("collision");
    wait(1);
    var_49f7615f089f4575 = getdvarint(@"hash_1263820ad3a08477", 60);
    if (var_49f7615f089f4575 > 0) {
        crate setscriptablepartstate("smoke_signal", "drop_plane_on", 0);
        wait(var_49f7615f089f4575);
        if (getdvarint(@"hash_ad77e9f65a2e05c2", 0)) {
            objid = crate.minimapid;
            if (isdefined(objid) && objid != -1) {
                objective_state(objid, "active");
            }
        }
    }
    crate setscriptablepartstate("smoke_signal", "off", 0);
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1151
// Size: 0x85
function function_643937a5f43eb434() {
    if (getdvarint(@"hash_33f880a10e8651ae", 0)) {
        return;
    }
    crate = self;
    crate notify("crate_capture_watch");
    crate endon("crate_capture_watch");
    crate endon("death");
    while (1) {
        player = crate waittill("brLoadoutPostCapture");
        objid = crate.minimapid;
        if (isdefined(player) && isdefined(objid) && objid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(objid, player);
        }
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11dd
// Size: 0x5c
function function_9e398892d48ba3a6() {
    crate = self;
    crate notify("crate_death_watch");
    crate endon("crate_death_watch");
    crate waittill("death");
    objid = crate.minimapid;
    if (isdefined(objid) && objid != -1) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
        crate.minimapid = undefined;
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1240
// Size: 0xa4
function function_fd96e89abd30cc4f() {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    foreach (crate in level.br_pickups.crates) {
        if (isdefined(crate) && istrue(crate.var_4cd5b8f62d173211) && isdefined(crate.minimapid)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.minimapid, player);
        }
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12eb
// Size: 0xca
function function_de7e06e42793bd7f() {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    foreach (crate in level.br_pickups.crates) {
        if (isdefined(crate) && istrue(crate.var_4cd5b8f62d173211) && isdefined(crate.minimapid)) {
            if (!isdefined(crate.playersused) || !array_contains(crate.playersused, player)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(crate.minimapid, player);
            }
        }
    }
}

// Namespace namespace_e84530fe9afbbd74/namespace_f51c41a139e03299
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bc
// Size: 0x126
function function_3241afdfec957cb9(player) {
    switch (self.source) {
    case #"hash_a00e0121c83189e5":
        namespace_b5b2280a66414fff::function_2410e069c697ba3c(player);
        break;
    case #"hash_5057f4744606f16e":
        var_bab0d10e51188531 = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
        if (isdefined(level.var_f385b864293e8777) && isdefined(level.var_f385b864293e8777.var_17e70eb167a5dfa6)) {
            [[ level.var_f385b864293e8777.var_17e70eb167a5dfa6 ]](self.var_8c5ee84d75ab881, self.origin, self.angles, var_bab0d10e51188531, 0, self.score_event, self.var_36685cc32931d3a, self.ammo_count, player);
        }
        break;
    case #"hash_12609d8c77ae1e34":
        if (utility::issharedfuncdefined("dd_sidequest_cursed", "supplyDropUsed")) {
            utility::function_f3bb4f4911a1beb2("dd_sidequest_cursed", "supplyDropUsed", player);
        }
        break;
    default:
        /#
            assertmsg("Supply drop not given a source");
        #/
        break;
    }
}

