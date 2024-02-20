// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using script_58f20490049af6ac;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_7f96036adeb34fc3;

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4c7
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("doublexp_crate", &init);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e2
// Size: 0xf1
function init(config) {
    if (getdvarint(@"hash_da7fe1bcdf3005b7", 1) == 0) {
        return;
    }
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.validatefunc = &function_3e0ab74e4391f51;
    var_7ec7671a1e0c788f.activatefunc = &function_94b6a8cecf4460f4;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("doublexp_crate");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "doublexp_crate");
    namespace_d76af9f804655767::registerpublicevent(19, var_7ec7671a1e0c788f);
    initdialog();
    /#
        level thread debug_init();
    #/
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da
// Size: 0x3c
function initdialog() {
    game["dialog"]["dbxp_inbound"] = "dblx_grav_nbnd";
    game["dialog"]["dbxp_boost"] = "dblx_grav_boos";
    game["dialog"]["dbxp_active"] = "dblx_grav_dbxc";
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0x26b
function function_c9e871d29702e8cf() {
    level.var_849fbfb162366139 = spawnstruct();
    level.var_849fbfb162366139.var_5b5b63ad1aa0c600 = getdvarint(@"hash_9d51f9c0009f08f1", 5);
    level.var_849fbfb162366139.var_244c8b1a0fd7b3f2 = getdvarint(@"hash_bc16751befcea55d", 2);
    level.var_849fbfb162366139.var_1e5a000c9dd647d9 = getdvarint(@"hash_1ba89b1c84ffbfa1", 1);
    level.var_849fbfb162366139.var_e46c4bb389787c4b = getdvarint(@"hash_9ffcaa81d06c9318", 1);
    level.var_849fbfb162366139.var_c7b9959dc3806b9d = getdvarint(@"hash_9a2d81522af9d92e", 1);
    level.var_849fbfb162366139.var_87f7cae714bdead2 = getdvarint(@"hash_55f79e64c5d2a78c", 1);
    level.var_849fbfb162366139.var_9e26db7dc8713415 = getdvarint(@"hash_220ae379b570305d", 5);
    level.var_849fbfb162366139.var_cb99e35e55b5a678 = getdvarint(@"hash_40a3c8ac39a65a2c", 1);
    level.var_849fbfb162366139.var_c23382998980bae9 = getdvarint(@"hash_185b9052b3deb291", 4000);
    level.var_849fbfb162366139.var_6b4d4e4c82bcc857 = getdvarint(@"hash_1f536de4d89b0d4f", 300);
    level.var_849fbfb162366139.var_8337fdb41fc6f888 = [];
    var_ea4328915149d5a7 = strtok(getdvar(@"hash_7df719e8123c2c33", "500 750 1000 1250 1500"), " ");
    level.var_849fbfb162366139.var_5d8c02c2769162b1 = [];
    foreach (xpreward in var_ea4328915149d5a7) {
        level.var_849fbfb162366139.var_5d8c02c2769162b1[level.var_849fbfb162366139.var_5d8c02c2769162b1.size] = int(xpreward);
    }
    /#
        assertex(level.var_849fbfb162366139.var_244c8b1a0fd7b3f2 >= 1, "XP Multiplier can not be strictly lower than 1.0.");
    #/
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f
// Size: 0x53
function function_3e0ab74e4391f51() {
    if (istrue(level.var_2df69b8e552238b6) && !istrue(level.var_cb9a9bfbbc8b8a0f) && level.br_circle.circleindex > -1 && namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1 && !namespace_bbc79db4c3949a5c::function_29e8194ff7e13e2e()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ea
// Size: 0xd4
function function_92d23849fac69b79() {
    levelData = namespace_6c578d6ef48f10ef::getleveldata("battle_royale_doublexp_crate");
    levelData.capturestring = "MP/DOUBLEXP_CRATE_CAPTURE";
    levelData.basemodel = "military_carepackage_03_doublexp";
    levelData.mountmantlemodel = undefined;
    levelData.headicon = undefined;
    levelData.timeout = undefined;
    levelData.supportsownercapture = 0;
    levelData.onecaptureperplayer = 1;
    levelData.destroyoncapture = 1;
    levelData.var_c23ca3472233553d = 1;
    levelData.var_28eb33ffd1aa3e63 = 1;
    levelData.activatecallback = &function_6a082776d19d52ba;
    levelData.capturecallback = &function_c1c2f8b04e6586ed;
    levelData.destroycallback = &function_8e6e4e55266fbd15;
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c5
// Size: 0x4d
function function_94b6a8cecf4460f4() {
    function_92d23849fac69b79();
    namespace_d76af9f804655767::showsplashtoall("br_pe_doublexp_crate_start", "splash_list_br_pe_doublexp_crate");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("dbxp_inbound", 1, undefined, 0, 1, undefined);
    function_59c84ee8014ea5a8(level.var_849fbfb162366139.var_5b5b63ad1aa0c600);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa19
// Size: 0x38
function function_6a082776d19d52ba(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
    }
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa58
// Size: 0x22
function function_c1c2f8b04e6586ed(player) {
    function_fa22a58f778274e7();
    function_61b813c431fca619();
    player function_daa510e2d1ce6f2f();
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa81
// Size: 0x13
function function_8e6e4e55266fbd15(immediate) {
    function_61b813c431fca619();
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b
// Size: 0x95
function function_61b813c431fca619() {
    if (isdefined(self.var_7b5e5c2bbc8f9f79)) {
        objective_delete(self.var_7b5e5c2bbc8f9f79);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_7b5e5c2bbc8f9f79);
        self.var_7b5e5c2bbc8f9f79 = undefined;
    }
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate("smoke_signal", "off", 0);
        self.smokesignal delete();
    }
    if (isdefined(level.c130successfulairdrops)) {
        level.c130successfulairdrops = array_remove(level.c130successfulairdrops, self);
    }
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x273
function function_daa510e2d1ce6f2f() {
    player = self;
    player thread function_b7bfe6ae470e02c2();
    var_a18fd119c17c71f9 = player;
    var_244c8b1a0fd7b3f2 = level.var_849fbfb162366139.var_244c8b1a0fd7b3f2;
    if (level.var_849fbfb162366139.var_1e5a000c9dd647d9) {
        teamplayers = array_removeundefined(namespace_54d20dd0dd79277f::getteamdata(player.team, "players"));
        var_a18fd119c17c71f9 = teamplayers;
        if (level.var_849fbfb162366139.var_e46c4bb389787c4b) {
            namespace_62c556437da28f50::addteamrankxpmultiplier(var_244c8b1a0fd7b3f2, player.team, "battle_royale_doublexp_crate");
        }
        if (level.var_849fbfb162366139.var_c7b9959dc3806b9d) {
            foreach (var_736d8d9188ccbd45 in teamplayers) {
                var_736d8d9188ccbd45 namespace_4cd6e0abb58d4200::addweaponrankxpmultiplier(var_244c8b1a0fd7b3f2, "battle_royale_doublexp_crate");
            }
        }
    } else {
        if (level.var_849fbfb162366139.var_e46c4bb389787c4b) {
            player namespace_62c556437da28f50::addrankxpmultiplier(var_244c8b1a0fd7b3f2, "battle_royale_doublexp_crate");
        }
        if (level.var_849fbfb162366139.var_c7b9959dc3806b9d) {
            player namespace_4cd6e0abb58d4200::addweaponrankxpmultiplier(var_244c8b1a0fd7b3f2, "battle_royale_doublexp_crate");
        }
    }
    player function_e9e2cf1181eb7177();
    level.var_849fbfb162366139.dlogdata["nbOfCratesUsed"] = level.var_849fbfb162366139.dlogdata["nbOfCratesUsed"] + 1;
    if (player function_90fbfa0e04230b9()) {
        foreach (var_55f11faf1ba04750 in var_a18fd119c17c71f9) {
            if (level.var_849fbfb162366139.var_e46c4bb389787c4b) {
                var_55f11faf1ba04750 namespace_44abc05161e2e2cb::showsplash("event_double_xp", undefined, self);
            }
            if (level.var_849fbfb162366139.var_c7b9959dc3806b9d) {
                var_55f11faf1ba04750 namespace_44abc05161e2e2cb::showsplash("event_double_weapon_xp", undefined, self);
            }
        }
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("dbxp_active", undefined, var_a18fd119c17c71f9, 1, 1, undefined);
    } else {
        setlowermessageomnvar("doublexp_crate_already_used", undefined, 5);
    }
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb1
// Size: 0x8e
function function_90fbfa0e04230b9() {
    player = self;
    var_dcf5297e75df8644 = ter_op(level.var_849fbfb162366139.var_1e5a000c9dd647d9, player.team, player);
    if (array_contains(level.var_849fbfb162366139.var_8337fdb41fc6f888, var_dcf5297e75df8644)) {
        return 0;
    }
    level.var_849fbfb162366139.var_8337fdb41fc6f888 = array_add(level.var_849fbfb162366139.var_8337fdb41fc6f888, var_dcf5297e75df8644);
    return 1;
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe47
// Size: 0xde
function function_b7bfe6ae470e02c2() {
    xpreward = level.var_849fbfb162366139.var_5d8c02c2769162b1[0];
    if (isdefined(level.br_circle.circleindex) && level.br_circle.circleindex >= 0) {
        index = int(min(level.br_circle.circleindex, level.var_849fbfb162366139.var_5d8c02c2769162b1.size - 1));
        xpreward = level.var_849fbfb162366139.var_5d8c02c2769162b1[index];
    }
    var_b01aca3236595958 = spawnstruct();
    var_b01aca3236595958.var_efe4124eaa21ea43 = xpreward;
    namespace_62c556437da28f50::giverankxp(#"hash_795ee672e1287a92", xpreward, undefined, 0, 1, 1, var_b01aca3236595958);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2c
// Size: 0x143
function function_fa22a58f778274e7() {
    if (!istrue(level.var_849fbfb162366139.var_cb99e35e55b5a678)) {
        return;
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    droporigin = self.origin;
    dropangles = self.angles;
    itemlist = [];
    itemlist[itemlist.size] = [0:"brloot_plunder_cash_epic_1", 1:500];
    itemlist[itemlist.size] = [0:"brloot_super_munitionsbox", 1:1];
    itemlist[itemlist.size] = [0:"brloot_super_armorbox", 1:1];
    itemlist[itemlist.size] = [0:"brloot_super_deployablekiosk", 1:1];
    itemlist[itemlist.size] = [0:"brloot_super_reinforcement_flare", 1:1];
    foreach (item in itemlist) {
        if (namespace_1b7e64f50cca9321::canspawnitemname(item[0])) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, droporigin, dropangles, self);
            namespace_cb965d2f71fefddc::spawnpickup(item[0], var_cb4fad49263e20c4, item[1], 1);
        }
    }
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1076
// Size: 0x17e
function function_59c84ee8014ea5a8(var_5b5b63ad1aa0c600) {
    level endon("game_ended");
    if (var_5b5b63ad1aa0c600 <= 0) {
        return;
    }
    circle = spawnstruct();
    if (istrue(level.var_2df69b8e552238b6)) {
        circle.origin = level.br_level.br_circlecenters[level.br_circle.circleindex + 1];
        circle.radius = level.br_level.br_circleradii[level.br_circle.circleindex + 1];
    } else {
        circle.origin = namespace_c5622898120e827f::getsafecircleorigin();
        circle.radius = namespace_c5622898120e827f::getsafecircleradius();
    }
    pathstruct = namespace_d58f8bbad53774ad::c130airdrop_createpath(undefined, circle.origin);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = namespace_ad389306d44fc6b4::getc130speed();
    time = dist / travelspeed;
    var_184d0a0ce31a2b27 = namespace_d58f8bbad53774ad::c130airdrop_spawn(pathstruct, dist, travelspeed, time);
    var_184d0a0ce31a2b27.owner = undefined;
    var_184d0a0ce31a2b27.team = undefined;
    var_184d0a0ce31a2b27.dropfunc = &function_cc9f0006da726497;
    var_184d0a0ce31a2b27 namespace_d58f8bbad53774ad::c130airdrop_startdelivery(var_5b5b63ad1aa0c600, "battle_royale_doublexp_crate", "inactive", circle);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fb
// Size: 0x61
function function_60e9f1bb94a9d614(point, var_e81699436572aee6, var_42a55d59da918282) {
    var_e22310c8bdd48985 = pointonsegmentnearesttopoint(var_e81699436572aee6[0], var_e81699436572aee6[1], point);
    var_e2230dc8bdd482ec = pointonsegmentnearesttopoint(var_42a55d59da918282[0], var_42a55d59da918282[1], point);
    if (distance2dsquared(point, var_e22310c8bdd48985) > distance2dsquared(point, var_e2230dc8bdd482ec)) {
        return var_e22310c8bdd48985;
    }
    return var_e2230dc8bdd482ec;
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1264
// Size: 0x13d
function function_b2b7915585a31dc4(dropcircle) {
    var_b3d62ab023b59bf6 = level.br_level.br_mapcenter + namespace_ad389306d44fc6b4::function_1f389456d7c530a();
    var_6d7e4cc332c6d081 = namespace_ad389306d44fc6b4::getplanepathsaferadiusfromcenter();
    var_8e0605cb0d8ae85e = function_d2c0d8330ab7ad7f(self.startpt, self.endpt, dropcircle.origin, dropcircle.radius);
    var_690b677ae1ff4e7c = function_d2c0d8330ab7ad7f(self.startpt, self.endpt, var_b3d62ab023b59bf6, var_6d7e4cc332c6d081);
    if (!isdefined(var_8e0605cb0d8ae85e) || !isdefined(var_690b677ae1ff4e7c) || var_690b677ae1ff4e7c.size < 2) {
        return;
    }
    var_d4858c7c75f6ab04 = function_60e9f1bb94a9d614(self.startpt, var_8e0605cb0d8ae85e, var_690b677ae1ff4e7c);
    var_8ee83e2cbd3d747d = function_60e9f1bb94a9d614(self.endpt, var_8e0605cb0d8ae85e, var_690b677ae1ff4e7c);
    self.centerpt = (var_d4858c7c75f6ab04 + var_8ee83e2cbd3d747d) / 2;
    dropcircle.radius = distance2d(var_d4858c7c75f6ab04, self.centerpt) - 50;
    /#
        if (getdvarint(@"hash_5f45299d088c7963", 0) == 1) {
            thread function_432f4f8b51643066(dropcircle);
        }
    #/
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a8
// Size: 0x2df
function function_cc9f0006da726497(var_5b5b63ad1aa0c600, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle) {
    function_b2b7915585a31dc4(dropcircle);
    var_bd34ecac3ada85b = self.startpt;
    droppoint = self.centerpt;
    var_5d55352ed330471c = self.speed;
    var_800df1b7c6e3aa60 = (distance2d(var_bd34ecac3ada85b, droppoint) - dropcircle.radius) / var_5d55352ed330471c;
    cratedroptime = dropcircle.radius * 2 / var_5b5b63ad1aa0c600 / var_5d55352ed330471c;
    var_2119e0b45206e4b2 = 0;
    for (i = 0; i < var_5b5b63ad1aa0c600; i++) {
        wait(var_800df1b7c6e3aa60);
        var_800df1b7c6e3aa60 = cratedroptime;
        droplocation = namespace_d58f8bbad53774ad::c130airdrop_findvaliddroplocation(self.origin + anglestoforward(self.angles) * 500, 0, 1);
        if (!isdefined(droplocation)) {
            continue;
        }
        crate = namespace_6c578d6ef48f10ef::dropbrc130airdropcrate(droplocation + (0, 0, level.c130airdrop_heightoverride - 100), droplocation, self.angles, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, level.var_849fbfb162366139.var_87f7cae714bdead2, undefined, "ks_airdrop_crate_br_pe_doublexp");
        if (!isdefined(crate)) {
            continue;
        }
        crate setscriptablepartstate("objective_map", "hidden");
        objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        if (objid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", crate.origin, "ui_map_icon_drop_doublexp");
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
            namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, crate);
            namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 75);
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
            namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
            namespace_5a22b6f3a56f7e9b::function_98ba077848896a3(objid, 1);
            namespace_5a22b6f3a56f7e9b::function_f21e9b2e78de984b(objid, level.var_849fbfb162366139.var_c23382998980bae9 - level.var_849fbfb162366139.var_6b4d4e4c82bcc857, level.var_849fbfb162366139.var_c23382998980bae9);
            namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
            namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(objid, "MP/DOUBLEXP_CRATE_NAME");
            crate.var_7b5e5c2bbc8f9f79 = objid;
        }
        var_ef5d5141fdb51174 = namespace_6c578d6ef48f10ef::gettriggerobject(crate);
        var_ef5d5141fdb51174.usetimeoverride = level.var_849fbfb162366139.var_9e26db7dc8713415;
        level.c130successfulairdrops[level.c130successfulairdrops.size] = crate;
        var_2119e0b45206e4b2 = var_2119e0b45206e4b2 + 1;
    }
    if (getdvarint(@"hash_55f79e64c5d2a78c", 1) == 0) {
        level waittill("battle_royale_doublexp_crate" + "drop_anim_completed");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("dbxp_boost", 1, undefined, 0, 1, undefined);
    }
    function_bdfea1628154e7e3(var_2119e0b45206e4b2);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168e
// Size: 0x77
function function_bdfea1628154e7e3(var_2119e0b45206e4b2) {
    if (isdefined(level.var_849fbfb162366139.dlogdata)) {
        return;
    }
    level.var_849fbfb162366139.dlogdata = [];
    level.var_849fbfb162366139.dlogdata["nbOfCratesDropped"] = var_2119e0b45206e4b2;
    level.var_849fbfb162366139.dlogdata["nbOfCratesUsed"] = 0;
    thread function_68e995abe7e84297();
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170c
// Size: 0x83
function function_68e995abe7e84297() {
    level waittill("game_ended");
    dlog_recordevent("dlog_event_doublexp_crate_match_event", [0:"nb_of_crates_dropped", 1:level.var_849fbfb162366139.dlogdata["nbOfCratesDropped"], 2:"nb_of_crates_used", 3:level.var_849fbfb162366139.dlogdata["nbOfCratesUsed"], 4:"crate_benefits_entire_team", 5:level.var_849fbfb162366139.var_1e5a000c9dd647d9]);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1796
// Size: 0xcf
function function_e9e2cf1181eb7177() {
    circleindex = 0;
    if (isdefined(level.br_circle.circleindex) && level.br_circle.circleindex >= 0) {
        circleindex = level.br_circle.circleindex;
    }
    self dlog_recordplayerevent("dlog_event_doublexp_crate_participation", [0:"player_x", 1:self.origin[0], 2:"player_y", 3:self.origin[1], 4:"player_z", 5:self.origin[2], 6:"team", 7:self.team, 8:"circle_index", 9:circleindex]);
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x186c
// Size: 0x6
function function_3a24d044bf8e442e() {
    /#
    #/
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1879
// Size: 0x2f
function debug_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("brloot_super_deployablekiosk");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("dlog_event_doublexp_crate_participation", "<unknown string>", &function_db70bae7732f5204);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18af
// Size: 0x11
function function_db70bae7732f5204() {
    /#
        level thread namespace_d76af9f804655767::function_e37ee072d95a7c98(19);
    #/
}

// Namespace namespace_7f96036adeb34fc3/namespace_23cf3e2af85d0dda
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c7
// Size: 0xe2
function function_432f4f8b51643066(dropcircle) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        center = (self.centerpt[0], self.centerpt[1], 0);
        radius = dropcircle.radius;
        start = self.startpt;
        end = self.endpt;
        while (1) {
            waitframe();
            cylinder(center, center + (0, 0, 5000), radius, (1, 1, 0), 1, 1);
            line(start + (0, 0, 5000), end + (0, 0, 5000), (1, 1, 0));
        }
    #/
}

