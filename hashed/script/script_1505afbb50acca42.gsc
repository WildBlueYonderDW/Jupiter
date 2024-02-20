// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_57ce8f0135b8b312;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_5efcec8ad1769dd1;

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x140
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("flybuy", &init);
}

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b
// Size: 0xd9
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.waitfunc = &waitfunc;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("flybuy");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "flybuy");
    namespace_d76af9f804655767::registerpublicevent(24, var_7ec7671a1e0c788f);
}

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b
// Size: 0x29
function function_c9e871d29702e8cf() {
    game["dialog"]["flybuy_intro"] = "flyb_grav_pest";
    game["dialog"]["flybuy_desc"] = "pblc_grav_bsnv";
}

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b
// Size: 0x5
function validatefunc() {
    return 1;
}

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278
// Size: 0x11
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
}

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x49
function activatefunc() {
    level endon("game_ended");
    namespace_d76af9f804655767::showsplashtoall("br_pe_flybuy_start", "splash_list_br_pe_flybuy");
    namespace_d3d40f75bb4e4c32::brleaderdialog("flybuy_intro", 1, undefined, undefined, 1);
    function_3c4cffdc51b69fa4();
    namespace_d3d40f75bb4e4c32::brleaderdialog("flybuy_desc", 1, undefined, undefined, 2.5);
}

// Namespace namespace_5efcec8ad1769dd1/namespace_f562c6bd50b011a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0x11e
function function_3c4cffdc51b69fa4() {
    level endon("game_ended");
    if (istrue(level.circleclosing)) {
        circleindex = level.br_circle.circleindex + 1;
    } else {
        circleindex = level.br_circle.circleindex;
    }
    circlecenter = level.br_level.br_circlecenters[circleindex];
    radius = level.br_level.br_circleradii[circleindex];
    count = getdvarint(@"hash_6e5b7248bf9c147a", 6);
    step = 360 / count;
    yaw = 0;
    for (i = 0; i < count; i++) {
        randompoint = namespace_c5622898120e827f::getrandompointinboundscircle(circlecenter, radius, 0.25, 0.75, 1, 1, 1, undefined, yaw, yaw + step);
        yaw = yaw + step;
        namespace_118d21fe30d82c84::function_590979ef771686a8(undefined, randompoint, 1);
    }
}

