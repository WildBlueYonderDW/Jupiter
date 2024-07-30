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
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace br_gametype_mini;

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3be
// Size: 0x17
function main() {
    level.var_cdc15ee14362fbf = &scripts\mp\gametypes\br_gametype_mini::init;
    scripts\mp\gametypes\br::main();
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd
// Size: 0xe5
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

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ca
// Size: 0xa7
function brmini_initfeatures() {
    if (getdvarint(@"hash_16bd795a6d0dd17c", 0) == 1) {
        scripts\mp\gametypes\br_gametypes::disablefeature("circle");
        scripts\mp\gametypes\br_gametypes::disablefeature("gulag");
        scripts\mp\gametypes\br_gametypes::disablefeature("dropbag");
        scripts\mp\gametypes\br_gametypes::disablefeature("oneLife");
        scripts\mp\gametypes\br_gametypes::enablefeature("allowLateJoiners");
    }
    scripts\mp\gametypes\br_gametypes::disablefeature("plunderSites");
    scripts\mp\gametypes\br_gametypes::disablefeature("randomizeCircleCenter");
    scripts\mp\gametypes\br_gametypes::disablefeature("planeSnapToOOB");
    scripts\mp\gametypes\br_gametypes::disablefeature("movingCircle");
    scripts\mp\gametypes\br_gametypes::enablefeature("tabletReplace");
    scripts\mp\gametypes\br_gametypes::enablefeature("planeUseCircleRadius");
    scripts\mp\gametypes\br_gametypes::enablefeature("circleEarlyStart");
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x579
// Size: 0x20e
function brmini_initpostmain() {
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("createC130PathStruct", &brmini_createc130pathstruct);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("addToC130Infil", &brmini_addtoc130infil);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("playerWelcomeSplashes", &brmini_playerwelcomesplashes);
    dropPlaneDelay = getdvarint(@"hash_96c9be1f54511dfc", 375);
    dropBagDelay = getdvarint(@"hash_96796b8396b643a4", 350);
    scripts\mp\gametypes\br_gametypes::registerbrgametypedata("dropPlaneDelay", dropPlaneDelay);
    scripts\mp\gametypes\br_gametypes::registerbrgametypedata("dropBagDelay", dropBagDelay);
    waittillframeend();
    level.ontimelimit = &brmini_ontimelimit;
    brmini_cleanupents();
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    circleindex = level waittill("br_circle_set");
    circleindex = level waittill("br_circle_set");
    thresholdradius = getdvarfloat(@"hash_d6d1181cd67d957d", 1000);
    var_819edacdacb810e4 = scripts\mp\gametypes\br_circle::getdangercircleorigin();
    dangercircleradius = scripts\mp\gametypes\br_circle::getdangercircleradius();
    if (isdefined(level.contractmanager) && isdefined(level.contractmanager.activetablets)) {
        if (istrue(level.contractmanager.activetablets.size > 0)) {
            activetablets = level.contractmanager.activetablets;
            foreach (tablet in activetablets) {
                if (distance2dsquared(var_819edacdacb810e4, tablet.origin) > dangercircleradius * dangercircleradius) {
                    scripts\mp\gametypes\br_pickups::loothide(tablet);
                    scripts\mp\gametypes\br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
                }
            }
        }
    }
    namespace_1eb3c4e0e28fac71::dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius);
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78f
// Size: 0x11
function brmini_initdialog() {
    level endon("game_ended");
    level waittill("br_dialog_initialized");
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a8
// Size: 0x3d
function brmini_cleanupents() {
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("delete_on_load", "targetname");
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ed
// Size: 0x2
function brmini_initexternalfeatures() {
    
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f7
// Size: 0x4f
function brmini_playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    wait 1;
    scripts\mp\hud_message::showsplash("br_gametype_mini_prematch_welcome");
    if (!istrue(self.infil_landing_done)) {
        self waittill("infil_landing_done");
    }
    wait 1;
    scripts\mp\gametypes\br_public::brleaderdialogplayer("primary_objective", self, 0);
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84e
// Size: 0x24
function brmini_ontimelimit() {
    if (isdefined(level.numendgame)) {
        level thread scripts\mp\gametypes\br::startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0xbc
function brmini_createc130pathstruct() {
    assertex(isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters) && isdefined(level.br_level.br_circleradii), "<dev string:x1c>");
    originoverride = (level.br_level.br_circlecenters[1][0], level.br_level.br_circlecenters[1][1], 0);
    radiusoverride = level.br_level.br_circleradii[1];
    c130pathstruct = scripts\mp\gametypes\br_c130::createtestc130path(originoverride, radiusoverride);
    return c130pathstruct;
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93f
// Size: 0xf
function brmini_addtoc130infil() {
    thread scripts\mp\gametypes\br_public::kickplayersatcircleedge(&function_b740ad755cfac3b);
}

// Namespace br_gametype_mini / scripts\mp\gametypes\br_gametype_mini
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x956
// Size: 0x22
function function_b740ad755cfac3b() {
    var_de97b83556c2e527 = 1;
    if (istrue(level.var_63a70ff2d38d8bee)) {
        var_de97b83556c2e527 = 2;
    }
    return var_de97b83556c2e527;
}

