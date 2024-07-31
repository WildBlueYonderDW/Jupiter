#using scripts\common\callbacks.gsc;
#using scripts\common\debug.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_9096cac48c2eafc0;

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x2d8
// Size: 0x17
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82(%"heavyarmor", &init);
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7
// Size: 0x87
function init(eventinfo) {
    if (!getdvarint(@"hash_44792e9d3f0215c4", 1)) {
        return;
    }
    eventinfo.validatefunc = &event_validate;
    eventinfo.waitfunc = &event_wait;
    eventinfo.activatefunc = &function_dce158cd5558c35d;
    eventinfo.postinitfunc = &function_de40a46baab733f5;
    eventinfo.deactivatefunc = &event_deactivate;
    initdialog();
    /#
        level thread debug_init();
    #/
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x386
// Size: 0x28
function initdialog() {
    game["dialog"]["activateHeavyArmor"] = "pblc_grav_harb";
    game["dialog"]["heavyArmorNag"] = "pblc_grav_harn";
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b6
// Size: 0xc3
function function_de40a46baab733f5() {
    level.var_f9b94491f3b9951 = spawnstruct();
    level.var_f9b94491f3b9951.var_e1c3bf71c38cefa5 = getdvarint(@"hash_ffe403fdc0fe3ff9", 1);
    level.var_f9b94491f3b9951.var_1d15bc0e6aa8b694 = getdvarint(@"hash_862b1fbe176484b0", 1);
    level.var_f9b94491f3b9951.var_a8a32287a4421c1a = getdvarint(@"hash_9635c3c8b4f7d5bb", 0);
    level.var_f9b94491f3b9951.activationdelay = getdvarint(@"hash_a64f6d835ad204f1", 3);
    level.var_f9b94491f3b9951.var_7df5b7df93fa7590 = getdvarint(@"hash_e7ce66ed5400ebae", 45);
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x481
// Size: 0x4
function event_validate() {
    return true;
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48e
// Size: 0x2
function event_wait() {
    
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x498
// Size: 0x16b
function function_dce158cd5558c35d() {
    level.var_f9b94491f3b9951.timestarted = gettime();
    scripts\mp\gametypes\br_publicevents::showsplashtoall("br_pe_heavyarmor_start", "splash_list_br_pe_heavyarmor");
    if (level.var_f9b94491f3b9951.activationdelay > 0) {
        wait level.var_f9b94491f3b9951.activationdelay;
    }
    setomnvar("ui_publicevent_heavyarmor_active", 1);
    level.var_75c3b6e138fd717c = 1;
    level.br_pickups.maxcounts["brloot_armor_plate"] = level.br_pickups.maxcounts["brloot_armor_plate"] + 1;
    foreach (player in level.players) {
        scripts\mp\gametypes\br_public::brleaderdialogplayer("activateHeavyArmor", player, 1, 0, 0, undefined, "dx_br_brdm_");
        var_818f98f8cb1f2249 = player.armorhealth + (istrue(level.var_f9b94491f3b9951.var_e1c3bf71c38cefa5) ? player namespace_f8d3520d3483c1::function_85e373bb15921966() : 0);
        player namespace_f8d3520d3483c1::function_11ae05e08cc74847(var_818f98f8cb1f2249);
        player thread function_2b35b40e77841755();
        player thread function_f82951e97a733217();
        player armor::function_50deea7508dbf174();
    }
    function_48ecb1d91abc38ee();
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0xb9
function event_deactivate() {
    if (istrue(level.var_f9b94491f3b9951.var_a8a32287a4421c1a)) {
        setomnvar("ui_publicevent_heavyarmor_active", 0);
        level.var_75c3b6e138fd717c = 0;
        level.br_pickups.maxcounts["brloot_armor_plate"] = level.br_pickups.maxcounts["brloot_armor_plate"] - 1;
        foreach (player in level.players) {
            player namespace_f8d3520d3483c1::function_11ae05e08cc74847();
        }
    }
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6cc
// Size: 0x7d
function function_2b35b40e77841755() {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    var_27ce56995c29eabd = player namespace_f8d3520d3483c1::function_20b8437058079297();
    var_785f0e8ea0884115 = player namespace_f8d3520d3483c1::function_763f5fb36de6d3df();
    var_7f2f699c3670092b = var_785f0e8ea0884115;
    while (var_785f0e8ea0884115 > 0) {
        if (var_27ce56995c29eabd < var_785f0e8ea0884115) {
            return;
        }
        player waittill("armor_plate_inserted");
        var_27ce56995c29eabd = player namespace_f8d3520d3483c1::function_20b8437058079297();
        var_785f0e8ea0884115 = player namespace_f8d3520d3483c1::function_763f5fb36de6d3df();
    }
    player function_bdf4a6a9a60593ac(var_7f2f699c3670092b);
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x751
// Size: 0x4f
function function_f82951e97a733217() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("heavy_armor_heard");
    for (var_785f0e8ea0884115 = namespace_f8d3520d3483c1::function_763f5fb36de6d3df(); var_785f0e8ea0884115 > 0; var_785f0e8ea0884115 = namespace_f8d3520d3483c1::function_763f5fb36de6d3df()) {
        if (namespace_f8d3520d3483c1::function_20b8437058079297() > 0) {
            function_10b25ce2e593ce92();
        }
        wait 1;
    }
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a8
// Size: 0x62
function function_10b25ce2e593ce92() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("armor_plate_inserted");
    wait level.var_f9b94491f3b9951.var_7df5b7df93fa7590;
    if (namespace_f8d3520d3483c1::function_763f5fb36de6d3df() == 0) {
        return;
    }
    if (namespace_f8d3520d3483c1::function_20b8437058079297() == 0) {
        return;
    }
    scripts\mp\gametypes\br_public::brleaderdialogplayer("heavyArmorNag", self, 1, 0, 0, undefined, "dx_br_brdm_");
    self notify("heavy_armor_heard");
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x812
// Size: 0x56
function function_48ecb1d91abc38ee() {
    currentcircleindex = isdefined(level.br_circle.circleindex) ? level.br_circle.circleindex : 0;
    dlog_recordevent("dlog_event_heavyarmor_match_event", ["circle_index", currentcircleindex]);
}

// Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x870
// Size: 0xc9
function function_bdf4a6a9a60593ac(var_7f2f699c3670092b) {
    currentcircleindex = isdefined(level.br_circle.circleindex) ? level.br_circle.circleindex : 0;
    currenttime = gettime();
    var_a554411125b4408e = currenttime - level.var_f9b94491f3b9951.timestarted;
    dlog_recordevent("dlog_event_heavyarmor_fully_plated", ["circle_index", currentcircleindex, "time_since_heavyarmor", var_a554411125b4408e, "initial_empty_plate_slot_count", var_7f2f699c3670092b, "fill_new_slot_enabled", level.var_f9b94491f3b9951.var_e1c3bf71c38cefa5]);
}

/#

    // Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x941
    // Size: 0x2e
    function debug_init() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x34>", "<dev string:x43>", &function_db70bae7732f5204);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_9096cac48c2eafc0 / namespace_fd17b85b21ec30cd
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x977
    // Size: 0x2b
    function function_db70bae7732f5204() {
        if (!isdefined(level.var_f9b94491f3b9951)) {
            function_de40a46baab733f5();
        }
        level thread scripts\mp\gametypes\br_publicevents::function_e37ee072d95a7c98(%"heavyarmor");
    }

#/
