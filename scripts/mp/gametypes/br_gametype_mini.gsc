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
#using scripts\mp\gametypes\br_gametype_mini.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace namespace_4785fd2ee6d8a632;

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ad
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_22750b9631720d79::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc
// Size: 0xe6
function init() {
    level thread brmini_initfeatures();
    level thread brmini_initpostmain();
    level thread brmini_initdialog();
    level thread brmini_initexternalfeatures();
    setdvarifuninitialized(@"hash_e84ce12f7a01a55a", 0);
    /#
        setdevdvarifuninitialized(@"hash_16bd795a6d0dd17c", 0);
    #/
    level.quest_domdistmin = getdvarint(@"hash_17a688fddae58969", 2000);
    level.quest_domdistmax = getdvarint(@"hash_17837afddabf22e7", 4000);
    level.quest_assdistmin = getdvarint(@"hash_cd101811114c12be", 2500);
    level.quest_assdistmax = getdvarint(@"hash_cced2a111125f29c", 5500);
    level.quest_scavdistmin = getdvarint(@"hash_e44264bcea496a40", 2000);
    level.quest_scavdistmax = getdvarint(@"hash_e41f7abcea2352ea", 4000);
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9
// Size: 0xa8
function brmini_initfeatures() {
    if (getdvarint(@"hash_16bd795a6d0dd17c", 0) == 1) {
        namespace_71073fa38f11492::disablefeature("circle");
        namespace_71073fa38f11492::disablefeature("gulag");
        namespace_71073fa38f11492::disablefeature("dropbag");
        namespace_71073fa38f11492::disablefeature("oneLife");
        namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    }
    namespace_71073fa38f11492::disablefeature("plunderSites");
    namespace_71073fa38f11492::disablefeature("randomizeCircleCenter");
    namespace_71073fa38f11492::disablefeature("planeSnapToOOB");
    namespace_71073fa38f11492::disablefeature("movingCircle");
    namespace_71073fa38f11492::enablefeature("tabletReplace");
    namespace_71073fa38f11492::enablefeature("planeUseCircleRadius");
    namespace_71073fa38f11492::enablefeature("circleEarlyStart");
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x568
// Size: 0x1fb
function brmini_initpostmain() {
    namespace_71073fa38f11492::registerbrgametypefunc("createC130PathStruct", &brmini_createc130pathstruct);
    namespace_71073fa38f11492::registerbrgametypefunc("addToC130Infil", &brmini_addtoc130infil);
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &brmini_playerwelcomesplashes);
    dropPlaneDelay = getdvarint(@"hash_96c9be1f54511dfc", 375);
    namespace_71073fa38f11492::registerbrgametypedata("dropPlaneDelay", dropPlaneDelay);
    namespace_71073fa38f11492::registerbrgametypedata("dropBagDelay", 100);
    waittillframeend();
    level.ontimelimit = &brmini_ontimelimit;
    brmini_cleanupents();
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    circleindex = level waittill("br_circle_set");
    circleindex = level waittill("br_circle_set");
    var_5d954f1724092f5a = getdvarfloat(@"hash_d6d1181cd67d957d", 1000);
    var_819edacdacb810e4 = namespace_c5622898120e827f::getdangercircleorigin();
    var_e86632d645c137d0 = namespace_c5622898120e827f::getdangercircleradius();
    if (isdefined(level.var_41f4bc9ee8c7c9c6) && isdefined(level.var_41f4bc9ee8c7c9c6.activetablets)) {
        if (istrue(level.var_41f4bc9ee8c7c9c6.activetablets.size > 0)) {
            activetablets = level.var_41f4bc9ee8c7c9c6.activetablets;
            foreach (tablet in activetablets) {
                if (distance2dsquared(var_819edacdacb810e4, tablet.origin) > var_e86632d645c137d0 * var_e86632d645c137d0) {
                    namespace_cb965d2f71fefddc::loothide(tablet);
                    namespace_c6ccccd95254983f::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
                }
            }
        }
    }
    namespace_1eb3c4e0e28fac71::dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a);
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76a
// Size: 0x12
function brmini_initdialog() {
    level endon("game_ended");
    level waittill("br_dialog_initialized");
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x783
// Size: 0x3e
function brmini_cleanupents() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c8
// Size: 0x3
function brmini_initexternalfeatures() {
    
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2
// Size: 0x70
function brmini_playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    wait(1);
    namespace_44abc05161e2e2cb::showsplash("br_gametype_mini_prematch_welcome");
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
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("primary_objective", self, 0);
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x849
// Size: 0x25
function brmini_ontimelimit() {
    if (isdefined(level.numendgame)) {
        level thread namespace_d20f8ef223912e12::startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x875
// Size: 0xbe
function brmini_createc130pathstruct() {
    /#
        assertex(isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters) && isdefined(level.br_level.br_circleradii), "brMini_createC130PathStruct: Trying to create a C130 path within BR Mini, without level.br_level defined!");
    #/
    var_f9cbff5134da960b = (level.br_level.br_circlecenters[1][0], level.br_level.br_circlecenters[1][1], 0);
    var_e5bd279d3767139f = level.br_level.br_circleradii[1];
    c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path(var_f9cbff5134da960b, var_e5bd279d3767139f);
    return c130pathstruct;
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93b
// Size: 0x10
function brmini_addtoc130infil() {
    thread namespace_d3d40f75bb4e4c32::kickplayersatcircleedge(&function_b740ad755cfac3b);
}

// Namespace namespace_4785fd2ee6d8a632/namespace_22750b9631720d79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x952
// Size: 0x22
function function_b740ad755cfac3b() {
    var_de97b83556c2e527 = 1;
    if (istrue(level.var_63a70ff2d38d8bee)) {
        var_de97b83556c2e527 = 2;
    }
    return var_de97b83556c2e527;
}

