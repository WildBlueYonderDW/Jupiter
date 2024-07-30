#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace br_publicevent_firesale;

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1ef
// Size: 0x13
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("firesale", &init);
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0xcb
function init(config) {
    eventinfo = spawnstruct();
    eventinfo.validatefunc = &validatefunc;
    eventinfo.weight = config.weight;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
    eventinfo.var_d72a1842c5b57d1d = config.maxtimes;
    eventinfo.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    eventinfo.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("firesale");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(2, eventinfo);
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd
// Size: 0x28
function postinitfunc() {
    game["dialog"]["public_events_firesale_start"] = "pblc_grav_frsc";
    game["dialog"]["public_events_firesale_end"] = "pblc_grav_frsn";
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0x59
function validatefunc() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex) && level.br_circle.circleindex <= 1) {
        return true;
    }
    var_35c1e70b1d29218 = scripts\mp\gametypes\br_armory_kiosk::function_8301ce82f0ae1be6();
    return var_35c1e70b1d29218 >= 1;
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f
// Size: 0x23
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    eventstarttime = calculateeventstarttime();
    wait eventstarttime;
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a
// Size: 0x175
function activatefunc() {
    level endon("game_ended");
    scripts\mp\gametypes\br_publicevents::showsplashtoall("br_pe_firesale_start");
    scripts\mp\gametypes\br_public::brleaderdialog("public_events_firesale_start", undefined, undefined, undefined, 1.5);
    setomnvar("ui_minimap_pulse", 1);
    setomnvar("ui_publicevent_timer_type", 1);
    eventduration = getduration();
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
        wait eventduration - var_49978e5850a50d57;
    } else {
        var_49978e5850a50d57 = int(eventduration);
    }
    for (i = 0; i < var_49978e5850a50d57; i++) {
        clockobject playsound("ui_mp_fire_sale_timer");
        wait 1;
    }
    if (isdefined(level.var_4fecf02c9241f7f0)) {
        [[ level.var_4fecf02c9241f7f0 ]]();
    }
    scripts\mp\gametypes\br_publicevents::function_2907d01a7d692108(2);
    level notify("public_event_firesale_end");
    showsplashtoall("br_pe_firesale_end");
    scripts\mp\gametypes\br_public::brleaderdialog("public_events_firesale_end", undefined, undefined, undefined, 1.5);
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    clockobject delete();
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x517
// Size: 0xf2
function getduration() {
    eventduration = getdvarfloat(@"hash_104f9a52db6ef74", 90);
    var_cc5318567913f501 = isdefined(level.br_circle) && isdefined(level.br_circle.circleindex) && level.br_circle.circleindex != -1;
    var_543c8e4d624ff7a3 = getdvarint(@"hash_cc7fed1c42605966", 1) == 1;
    if (var_543c8e4d624ff7a3 && var_cc5318567913f501) {
        eventduration = min(eventduration, scripts\mp\gametypes\br_circle::function_abbfb4d18d1a9ca7());
    }
    var_8812000c33aed3c9 = getdvarint(@"hash_18c9ea0970a9d3aa", 0) == 1;
    if (var_8812000c33aed3c9 && var_cc5318567913f501) {
        eventduration = scripts\mp\gametypes\br_circle::function_abbfb4d18d1a9ca7();
    }
    minduration = getdvarint(@"hash_394bce38a6950030", 15);
    eventduration = max(eventduration, minduration);
    return eventduration;
}

// Namespace br_publicevent_firesale / scripts\mp\gametypes\br_publicevent_firesale
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x51
function calculateeventstarttime() {
    minstarttime = getdvarfloat(@"hash_3549564826254716", 795);
    maxstarttime = getdvarfloat(@"hash_356d4848264da304", 1110);
    if (maxstarttime > minstarttime) {
        return randomfloatrange(minstarttime, maxstarttime);
    }
    return minstarttime;
}

