// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;

#namespace namespace_b5630838e70308f0;

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xec
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("stronghold", &init);
}

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107
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
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("stronghold");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "stronghold");
    namespace_d76af9f804655767::registerpublicevent(6, var_7ec7671a1e0c788f);
}

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7
// Size: 0xc
function function_c9e871d29702e8cf() {
    level thread function_1386247d217a2b2e();
}

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x2e
function function_1386247d217a2b2e() {
    level endon("br_stronghold_pe_start");
    level waittill_any_2("br_pe_start", "br_pe_no_event");
    level.var_b098cf330b024cb9 = 0;
    level notify("br_stronghold_pe_start");
}

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f
// Size: 0x5
function validatefunc() {
    return 1;
}

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x2d
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    waittime = getdvarfloat(@"hash_ea37831ad1304a1c", 0);
    wait(waittime);
}

// Namespace namespace_b5630838e70308f0/namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270
// Size: 0x12
function activatefunc() {
    level endon("game_ended");
    level notify("br_stronghold_pe_start");
}

