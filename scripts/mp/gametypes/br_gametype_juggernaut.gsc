// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gametypes\br_gametype_juggernaut.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_7f4daf5b638a7cf5;

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x381
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_8322ecb8ef946d2e::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0
// Size: 0xa0
function init() {
    level thread brjugg_initfeatures();
    level thread brjugg_initpostmain();
    level thread brjugg_initdialog();
    level thread brjugg_initexternalfeatures();
    /#
        setdevdvarifuninitialized(@"hash_3d449b3ce63e3ace", 1);
        setdevdvarifuninitialized(@"hash_c090696117b74c62", 75);
        setdevdvarifuninitialized(@"hash_305a549345046786", 10);
        setdevdvarifuninitialized(@"hash_6033e70c81d4b924", 20);
        setdevdvarifuninitialized(@"hash_53800bc3e7ab723d", 1);
        setdvar(@"hash_f79cd84983250eda", 0);
        setdvar(@"hash_f77b78837563fb9a", 1);
    #/
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x6c
function brjugg_initfeatures() {
    if (getdvarint(@"hash_a780a85e3b40baf0", 0) == 1) {
        namespace_71073fa38f11492::disablefeature("circle");
        namespace_71073fa38f11492::disablefeature("gulag");
        namespace_71073fa38f11492::disablefeature("dropbag");
        namespace_71073fa38f11492::disablefeature("oneLife");
        namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    }
    namespace_71073fa38f11492::disablefeature("plunderSites");
    namespace_71073fa38f11492::enablefeature("tabletReplace");
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba
// Size: 0xcd
function brjugg_initpostmain() {
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &brjugg_playerwelcomesplashes);
    waittillframeend();
    namespace_4b0406965e556711::gameflaginit("start_jugg_delivery", 0);
    level.ontimelimit = &brjugg_ontimelimit;
    namespace_71073fa38f11492::registerbrgametypefunc("onJuggCrateActivate", &brjugg_oncrateactivate);
    namespace_71073fa38f11492::registerbrgametypefunc("onJuggCrateUse", &brjugg_oncrateuse);
    namespace_71073fa38f11492::registerbrgametypefunc("onJuggCrateDestroy", &brjugg_oncratedestroy);
    namespace_71073fa38f11492::registerbrgametypefunc("onJuggDropOnDeath", &brjugg_dropondeath);
    brjugg_cleanupents();
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    level.startjuggdelivery = 0;
    level thread brjugg_managedeliveries();
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58e
// Size: 0x19
function brjugg_initdialog() {
    wait(1);
    game["dialog"]["match_start"] = "gametype_juggernautroyale";
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ae
// Size: 0x3e
function brjugg_cleanupents() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f3
// Size: 0x3
function brjugg_initexternalfeatures() {
    
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fd
// Size: 0x7c
function brjugg_playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    wait(1);
    namespace_44abc05161e2e2cb::showsplash("br_gametype_juggernaut_prematch_welcome");
    if (!istrue(level.br_infils_disabled)) {
        self waittill("br_jump");
        while (!self isonground()) {
            waitframe();
        }
    } else {
        level waittill("prematch_done");
    }
    namespace_a011fbf6d93f25e5::branalytics_landing(self);
    wait(1);
    namespace_44abc05161e2e2cb::showsplash("br_gametype_juggernaut_welcome");
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("primary_objective", self, 0);
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x680
// Size: 0x25
function brjugg_ontimelimit() {
    if (isdefined(level.numendgame)) {
        level thread namespace_d20f8ef223912e12::startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ac
// Size: 0x176
function brjugg_managedeliveries() {
    level endon("game_ended");
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    level waittill("br_prematchEnded");
    /#
        if (level.mapname == "prematch_done" && !isdefined(level.br_circle)) {
            level.br_circle = spawnstruct();
            level.br_circle.circleindex = 0;
        }
    #/
    level thread brjugg_watchstartnotify();
    level thread brjugg_watchtimerstart();
    var_535e20b358bfdd66 = 1;
    while (1) {
        var_d3911db4da14f641 = getdvarint(@"hash_3d449b3ce63e3ace", 1);
        if (!var_d3911db4da14f641) {
            waitframe();
            continue;
        }
        var_fdfc755d4aa965c6 = namespace_cf880efca02c6010::getnumdrops();
        if (level.numactivejuggdrops > 0) {
            var_fdfc755d4aa965c6 = var_fdfc755d4aa965c6 - level.numactivejuggdrops;
        }
        level.juggdroplocations = array_randomize(level.juggdroplocations);
        droplocations = namespace_cf880efca02c6010::showdroplocations(var_fdfc755d4aa965c6, var_535e20b358bfdd66);
        while (!istrue(level.startjuggdelivery)) {
            waitframe();
            continue;
        }
        var_535e20b358bfdd66 = 0;
        level thread namespace_cf880efca02c6010::startdeliveries(droplocations, "gametype_juggernaut");
        level waittill("continue_jugg_drops");
        if (isdefined(level.gulag) && istrue(level.gulag.shutdown)) {
            break;
        }
        var_b2afe11b32a4439c = getdvarint(@"hash_6033e70c81d4b924", 20);
        wait(var_b2afe11b32a4439c);
    }
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0x21
function brjugg_watchstartnotify() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("start_jugg_delivery");
    level.startjuggdelivery = 1;
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x851
// Size: 0x4a
function brjugg_watchplayercounttostart(var_86da7bb1919b5a1e) {
    level endon("game_ended");
    while (1) {
        level waittill("br_player_eliminated");
        var_7f19e0518e7f95ba = namespace_d20f8ef223912e12::getbrplayersnoteliminated();
        if (var_7f19e0518e7f95ba.size <= var_86da7bb1919b5a1e) {
            namespace_4b0406965e556711::gameflagset("start_jugg_delivery");
            break;
        }
    }
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a2
// Size: 0x33
function brjugg_watchtimerstart() {
    level endon("game_ended");
    var_65de8866109dfcd3 = getdvarint(@"hash_305a549345046786", 10);
    wait(var_65de8866109dfcd3);
    namespace_4b0406965e556711::gameflagset("start_jugg_delivery");
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8dc
// Size: 0xc
function brjugg_oncrateactivate(var_d9bc1b05d016a86f) {
    
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ef
// Size: 0xc
function brjugg_oncrateuse(player) {
    
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x902
// Size: 0x14
function brjugg_oncratedestroy(immediate) {
    level notify("continue_jugg_drops");
}

// Namespace namespace_7f4daf5b638a7cf5/namespace_8322ecb8ef946d2e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x91d
// Size: 0x4a
function brjugg_dropondeath(dropstruct) {
    level notify("continue_jugg_drops");
    namespace_c6ccccd95254983f::dropplunderbyrarity(100, dropstruct);
    var_8b3ebf50f99bdb43 = getdvarint(@"hash_53800bc3e7ab723d", 1);
    if (var_8b3ebf50f99bdb43) {
        namespace_cb965d2f71fefddc::dropbrweapon("brloot_weapon_lm_dblmg_lege", dropstruct);
    }
}

