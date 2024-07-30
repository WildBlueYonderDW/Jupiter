#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;

#namespace namespace_b5630838e70308f0;

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xec
// Size: 0x13
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("stronghold", &init);
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107
// Size: 0xd8
function init(config) {
    eventinfo = spawnstruct();
    eventinfo.validatefunc = &validatefunc;
    eventinfo.weight = config.weight;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
    eventinfo.var_d72a1842c5b57d1d = config.maxtimes;
    eventinfo.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    eventinfo.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("stronghold");
    scripts\mp\gametypes\br_publicevents::function_5b7d8ca93f8705f1(eventinfo, "stronghold");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(6, eventinfo);
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7
// Size: 0xb
function postinitfunc() {
    level thread function_1386247d217a2b2e();
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x2d
function function_1386247d217a2b2e() {
    level endon("br_stronghold_pe_start");
    level waittill_any_2("br_pe_start", "br_pe_no_event");
    level.var_b098cf330b024cb9 = 0;
    level notify("br_stronghold_pe_start");
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f
// Size: 0x4
function validatefunc() {
    return true;
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x2c
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    waittime = getdvarfloat(@"hash_ea37831ad1304a1c", 0);
    wait waittime;
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270
// Size: 0x11
function activatefunc() {
    level endon("game_ended");
    level notify("br_stronghold_pe_start");
}

