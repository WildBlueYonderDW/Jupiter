// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_d9a39aa74c54b9dd;

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1ef
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("firesale", &init);
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0xcc
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.waitfunc = &waitfunc;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("firesale");
    namespace_d76af9f804655767::registerpublicevent(2, var_7ec7671a1e0c788f);
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd
// Size: 0x29
function function_c9e871d29702e8cf() {
    game["dialog"]["public_events_firesale_start"] = "pblc_grav_frsc";
    game["dialog"]["public_events_firesale_end"] = "pblc_grav_frsn";
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0x5a
function validatefunc() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex) && level.br_circle.circleindex <= 1) {
        return 1;
    }
    var_35c1e70b1d29218 = namespace_a4b43c1cf86c6fe5::function_8301ce82f0ae1be6();
    return var_35c1e70b1d29218 >= 1;
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f
// Size: 0x24
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    eventstarttime = calculateeventstarttime();
    wait(eventstarttime);
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a
// Size: 0x176
function activatefunc() {
    level endon("game_ended");
    namespace_d76af9f804655767::showsplashtoall("br_pe_firesale_start");
    namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_firesale_start", undefined, undefined, undefined, 1.5);
    setomnvar("ui_minimap_pulse", 1);
    setomnvar("ui_publicevent_timer_type", 1);
    eventduration = function_fbb2d5e09e58db7();
    eventendtime = gettime() + eventduration * 1000;
    setomnvar("ui_publicevent_timer", eventendtime);
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    if (isdefined(level.var_a4078546548cb0a)) {
        [[ level.var_a4078546548cb0a ]]();
    }
    level notify("public_event_firesale_start");
    var_49978e5850a50d57 = 5;
    if (eventduration > var_49978e5850a50d57) {
        wait(eventduration - var_49978e5850a50d57);
    } else {
        var_49978e5850a50d57 = int(eventduration);
    }
    for (i = 0; i < var_49978e5850a50d57; i++) {
        clockobject playsound("ui_mp_fire_sale_timer");
        wait(1);
    }
    if (isdefined(level.var_4fecf02c9241f7f0)) {
        [[ level.var_4fecf02c9241f7f0 ]]();
    }
    namespace_d76af9f804655767::function_2907d01a7d692108(2);
    level notify("public_event_firesale_end");
    showsplashtoall("br_pe_firesale_end");
    namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_firesale_end", undefined, undefined, undefined, 1.5);
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    clockobject delete();
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x517
// Size: 0xf3
function function_fbb2d5e09e58db7() {
    eventduration = getdvarfloat(@"hash_104f9a52db6ef74", 90);
    var_cc5318567913f501 = isdefined(level.br_circle) && isdefined(level.br_circle.circleindex) && level.br_circle.circleindex != -1;
    var_543c8e4d624ff7a3 = getdvarint(@"hash_cc7fed1c42605966", 1) == 1;
    if (var_543c8e4d624ff7a3 && var_cc5318567913f501) {
        eventduration = min(eventduration, namespace_c5622898120e827f::function_abbfb4d18d1a9ca7());
    }
    var_8812000c33aed3c9 = getdvarint(@"hash_18c9ea0970a9d3aa", 0) == 1;
    if (var_8812000c33aed3c9 && var_cc5318567913f501) {
        eventduration = namespace_c5622898120e827f::function_abbfb4d18d1a9ca7();
    }
    var_5f651e1139ef776f = getdvarint(@"hash_394bce38a6950030", 15);
    eventduration = max(eventduration, var_5f651e1139ef776f);
    return eventduration;
}

// Namespace namespace_d9a39aa74c54b9dd/namespace_6adec1aba4ef17d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x52
function calculateeventstarttime() {
    var_87940078241e4580 = getdvarfloat(@"hash_3549564826254716", 795);
    var_7af9598177dc2de = getdvarfloat(@"hash_356d4848264da304", 1110);
    if (var_7af9598177dc2de > var_87940078241e4580) {
        return randomfloatrange(var_87940078241e4580, var_7af9598177dc2de);
    } else {
        return var_87940078241e4580;
    }
}

