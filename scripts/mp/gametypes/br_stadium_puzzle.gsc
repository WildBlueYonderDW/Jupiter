// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace br_stadium_puzzle;

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53b
// Size: 0x9b
function init() {
    level.stadiumpuzzleactive = getdvarint(@"hash_3c07e307bec0051b", 1);
    level.stadium_puzzle = spawnstruct();
    if (level.stadiumpuzzleactive) {
        level.stadium_puzzle.hints = [];
        level.stadium_puzzle.code = [];
        scripts/engine/scriptable::scriptable_addusedcallbackbypart("maphint_stadium_code_computer", &codecomputerscriptableused);
        scripts/engine/scriptable::scriptable_addusedcallbackbypart("maphint_stadium_access_reader", &accessreaderscriptableused);
    }
    level thread scripts/mp/gametypes/br_pickups::registeruniquelootcallback(2, &awardstadiumblueprint);
    level thread initpostmain();
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dd
// Size: 0x96
function initpostmain() {
    waittillframeend();
    level thread gatherstadiumlocs();
    if (!level.stadiumpuzzleactive) {
        return;
    }
    if (level.mapname == "mp_bm_bunker01") {
        debug_bunkertestaccesscardlocs();
        debug_spawnrewardstest();
    } else {
        registeraccesscardlocs();
    }
    spawnaccesscards();
    /#
        level thread function_138da425d10b4a04();
    #/
    scripts/mp/flags::gameflagwait("prematch_done");
    codelength = getdvarint(@"hash_2b534a885f537dfa", 8);
    setupboardroomcode(codelength, level.stadium_puzzle);
    serverroomrewardroll();
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67a
// Size: 0x104
function setupboardroomcode(codelength, codestruct) {
    scripts/mp/gametypes/br_bunker_utility::generatenumbercode(codelength, codestruct, 1, 1);
    codestruct.displaycodes = scripts/mp/gametypes/br_bunker_utility::generatecodestoshow(codestruct.code, 3, 1, 1);
    scripts/mp/gametypes/br_bunker_utility::assigncodecomputersdisplaycodes(codestruct.hints["maphint_stadium_code_computer"], codestruct.displaycodes);
    foreach (keypad in level.stadium_puzzle.hints["stadium_boardroom_keypad"]) {
        keypad.scriptable.code = codestruct.code;
        keypad.scriptable.successfunction = &boardroomdoorcodeentrysuccess;
    }
    if (false) {
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x785
// Size: 0x52
function codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    /#
        assert(part == "maphint_stadium_code_computer");
    #/
    level thread _codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7de
// Size: 0x220
function _codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        if (!scripts/mp/flags::gameflag("prematch_done")) {
            playsoundatpos(instance.origin, "br_computer_deny");
            instance setscriptablepartstate("maphint_stadium_code_computer", "off");
            wait(3);
            instance setscriptablepartstate("maphint_stadium_code_computer", "on");
            return;
        }
        player scripts/mp/playerlogic::playerhasmoved();
        displaycode = scripts/mp/gametypes/br_bunker_utility::getcodecomputerdisplaycode(level.stadium_puzzle, instance.displaycodeindex);
        instance setscriptablepartstate("maphint_stadium_code_computer", "off");
        while (istrue(instance.computermakingnose)) {
            waitframe();
        }
        instance notify("computer_used");
        playsoundatpos(instance.origin, "stadium_computer_code_start");
        instance.computerscriptable setscriptablepartstate("stadium_code_computer", "blank");
        wait(2);
        foreach (screenid in displaycode) {
            if (isint(screenid)) {
                screenid = "num" + screenid;
            }
            instance.computerscriptable setscriptablepartstate("stadium_code_computer", screenid);
            playsoundatpos(instance.origin, "stadium_computer_code_number");
            wait(0.6);
            instance.computerscriptable setscriptablepartstate("stadium_code_computer", "blank");
            wait(0.1);
        }
        instance.computerscriptable setscriptablepartstate("stadium_code_computer", "reset");
        playsoundatpos(instance.origin, "stadium_computer_code_end");
        wait(3);
        instance.computerscriptable setscriptablepartstate("stadium_code_computer", "intro");
        instance setscriptablepartstate("maphint_stadium_code_computer", "on");
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa05
// Size: 0x42
function accessreaderscriptableused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread _accessreaderscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xa4e
// Size: 0x10b
function _accessreaderscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_stadium_access_reader");
    #/
    instance setscriptablepartstate("maphint_stadium_access_reader", "off");
    if (getdvarint(@"hash_c18b5c0b64eb7d60", 0) == 1 || player scripts/mp/gametypes/br_public::hasaccesscard(instance.requiredcardtype)) {
        playsoundatpos(instance.origin, "br_keypad_confirm");
        scripts/mp/gametypes/br_bunker_utility::openscriptabledoors(instance);
        instance setscriptablepartstate("maphint_stadium_access_reader", "off");
        player scripts/mp/gametypes/br_pickups::removeaccesscard();
        instance.addedcollision delete();
        return;
    }
    if (soundexists("br_keypad_deny")) {
        playsoundatpos(player.origin, "br_keypad_deny");
    }
    instance setscriptablepartstate("maphint_stadium_access_reader", "off");
    wait(3);
    instance setscriptablepartstate("maphint_stadium_access_reader", "on");
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb60
// Size: 0xcd
function boardroomdoorcodeentrysuccess(instance) {
    playsoundatpos(instance.origin, "br_phone_code_correct");
    scripts/mp/gametypes/br_bunker_utility::unlockscriptabledoors(instance);
    if (!istrue(level.stadium_puzzle.boardroomopen)) {
        spawnuniqueboardroomloot();
    }
    level.stadium_puzzle.boardroomopen = 1;
    foreach (collisionpiece in level.stadium_puzzle.var_e696f89e8fdc4b64) {
        if (isdefined(collisionpiece)) {
            collisionpiece delete();
        }
    }
    scripts/engine/utility::exploder("stad_fireworks");
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc34
// Size: 0x16d
function spawnuniqueboardroomloot() {
    spawnboardroomblueprintweapons();
    var_c1a111fce3901443 = 1;
    if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "plunder") {
        var_c1a111fce3901443 = 0;
    }
    var_eb80fbb0bf8736d = getdvarint(@"hash_9139ece0e4029efd", 1);
    var_41d59b96cf4ecc51 = getdvarint(@"hash_93865cc30c681ea1", 1);
    var_cc2b025d5d9d414d = getdvarint(@"hash_26db1a3371c6b1bd", 1);
    var_94c29ef7c8696d31 = getdvarint(@"hash_7fd1c77d842e36e1", var_c1a111fce3901443);
    var_4b38d0dfdae99bfb = getdvarint(@"hash_5753ef97f2730d0b", 1);
    var_1b32ecd6577d3426 = getdvarint(@"hash_caa47d318ede8a16", 1);
    total = 1 + var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31 + var_4b38d0dfdae99bfb + var_1b32ecd6577d3426;
    var_8b591b0bc361ab3d = randomintrange(1, total);
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d) {
        spawnboardroom_auav();
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51) {
        spawnboardroom_specialist();
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d) {
        spawnboardroom_loadoutdrop();
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31) {
        spawnboardroom_gasmask();
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31 + var_4b38d0dfdae99bfb) {
        spawnboardroom_miniguns();
        return;
    }
    spawnboardroom_juggdrop();
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda8
// Size: 0x142
function spawnboardroomblueprintweapons() {
    var_7957ae38c168f3df = "brloot_weapon_bp_reward_sm_mpapa7_lege";
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount(var_7957ae38c168f3df);
    origin1 = (31270, -265, 21.5);
    angles1 = (0, 266, 80);
    origin2 = (31385, -373, 21.5);
    angles2 = (0, 23, 80);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = (1247, -4060, 300);
        angles1 = (0, 177, 75);
        origin2 = (1260, -3826, 300);
        angles2 = (0, 1776, 75);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
    if (isdefined(scriptable)) {
        scriptable.uniquelootitemid = "uniqueLootItem_2";
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin2, angles2);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
    if (isdefined(scriptable)) {
        scriptable.uniquelootitemid = "uniqueLootItem_2";
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef1
// Size: 0x83
function spawnboardroom_auav() {
    origin1 = (31484, -464, 12);
    angles1 = (0, 135, 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_killstreak_auav", dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf7b
// Size: 0x135
function spawnboardroom_specialist() {
    origin1 = (31484, -464, 7);
    angles1 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_specialist_bonus", dropinfo, 1, 0);
    origin1 = (31332, -82, 7);
    angles1 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_specialist_bonus", dropinfo, 1, 0);
    origin1 = (31086, -370, 7);
    angles1 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_specialist_bonus", dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b7
// Size: 0x83
function spawnboardroom_loadoutdrop() {
    origin1 = (31484, -464, 7);
    angles1 = (0, 135, 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_offhand_advancedsupplydrop", dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1141
// Size: 0x135
function spawnboardroom_gasmask() {
    origin1 = (31484, -464, 7);
    angles1 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_equip_gasmask_durable", dropinfo, 1, 0);
    origin1 = (31332, -82, 7);
    angles1 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_equip_gasmask_durable", dropinfo, 1, 0);
    origin1 = (31086, -370, 7);
    angles1 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_equip_gasmask_durable", dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127d
// Size: 0x113
function spawnboardroom_miniguns() {
    origin1 = (31390, 0, 2);
    angles1 = (-70, 145, 80);
    origin2 = (31022, -348, 2);
    angles2 = (-70, 132, 80);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = (1247, -4060, 300);
        angles1 = (0, 177, 75);
        origin2 = (1260, -3826, 300);
        angles2 = (0, 1776, 75);
    }
    var_7957ae38c168f3df = "brloot_weapon_lm_dblmg_lege";
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount(var_7957ae38c168f3df);
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin2, angles2);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1397
// Size: 0x83
function spawnboardroom_juggdrop() {
    origin1 = (31484, -464, 7);
    angles1 = (0, 135, 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin1, angles1);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_killstreak_juggernaut", dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1421
// Size: 0xb4
function awardstadiumblueprint(player) {
    foreach (teammate in getteamdata(player.team, "players")) {
        if (!isdefined(teammate)) {
            continue;
        }
        teammate scripts/cp_mp/challenges::onunlockitem("blueprint_unlock_629");
        teammate scripts/mp/analyticslog::logevent_challengeitemunlocked(teammate, "blueprint_unlock_629", "blueprint", 629);
        optionalnumber = 0;
        if (optionalnumber > 0) {
            teammate thread scripts/mp/hud_message::showsplash("br_unlockable_weapon_splash", optionalnumber);
        }
    }
    return true;
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14dd
// Size: 0x88
function activatemusictrigger() {
    forward = anglestoforward(level.stadium_puzzle.interiordoor.angles);
    trigger = spawn("trigger_radius", level.stadium_puzzle.interiordoor.origin + forward * -128, 0, 128, 128);
    level thread musictriggerthink(trigger);
    wait(120);
    trigger notify("endMusicTrigger");
    trigger delete();
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156c
// Size: 0x7b
function musictriggerthink(trigger) {
    trigger endon("endMusicTrigger");
    while (true) {
        player = trigger waittill("trigger");
        waitframe();
        if (!isdefined(player)) {
            continue;
        }
        if (!isplayer(player)) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (istrue(player.bunkermusicstarted)) {
            continue;
        }
        player.bunkermusicstarted = 1;
        player setplayermusicstate("br_bunker_reveal");
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ee
// Size: 0x7dc
function gatherstadiumlocs() {
    loc = getstruct("stadium_parking_garage_access_reader", "targetname");
    loc.scriptable = spawnscriptable("maphint_stadium_access_reader", loc.origin);
    loc.scriptable.name = "stadium_parking_garage_access_reader";
    loc.scriptable.requiredcardtype = "brloot_access_card_blue_stadium_parking";
    loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
    scripts/mp/gametypes/br_bunker_utility::lockscriptabledoors(loc.scriptable);
    door = loc.scriptable.doors[0];
    forward = anglestoforward(door.angles);
    right = anglestoright(door.angles);
    patchposition = door.origin + forward * 27 + right * 64;
    patch7 = getent("clip128x128x128", "targetname");
    var_10688b3021acc893 = spawn("script_model", patchposition);
    var_10688b3021acc893.angles = door.angles;
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(patch7);
    loc.scriptable.addedcollision = var_10688b3021acc893;
    level.stadium_puzzle.hints["stadium_parking_garage_access_reader"] = loc;
    loc = getstruct("stadium_concourse_access_reader", "targetname");
    loc.scriptable = spawnscriptable("maphint_stadium_access_reader", loc.origin);
    loc.scriptable.name = "stadium_concourse_access_reader";
    loc.scriptable.requiredcardtype = "brloot_access_card_blue_stadium_concourse";
    loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
    scripts/mp/gametypes/br_bunker_utility::lockscriptabledoors(loc.scriptable);
    door = loc.scriptable.doors[0];
    forward = anglestoforward(door.angles);
    right = anglestoright(door.angles);
    patchposition = door.origin + forward * 27 + right * 64;
    patch7 = getent("clip128x128x128", "targetname");
    var_10688b3021acc893 = spawn("script_model", patchposition);
    var_10688b3021acc893.angles = door.angles;
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(patch7);
    loc.scriptable.addedcollision = var_10688b3021acc893;
    level.stadium_puzzle.hints["stadium_concourse_access_reader"] = loc;
    loc = getstruct("stadium_upper_level_access_card", "targetname");
    loc.origin = loc.origin - (2, 4, -2);
    loc.scriptable = spawnscriptable("maphint_stadium_access_reader", loc.origin);
    loc.scriptable.name = "stadium_upper_level_access_card";
    loc.scriptable.requiredcardtype = "brloot_access_card_blue_stadium_executive";
    loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
    scripts/mp/gametypes/br_bunker_utility::lockscriptabledoors(loc.scriptable);
    door = loc.scriptable.doors[0];
    forward = anglestoforward(door.angles);
    right = anglestoright(door.angles);
    patchposition = door.origin + forward * 27 + right * 64;
    patch7 = getent("clip128x128x128", "targetname");
    var_10688b3021acc893 = spawn("script_model", patchposition);
    var_10688b3021acc893.angles = door.angles;
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(patch7);
    loc.scriptable.addedcollision = var_10688b3021acc893;
    level.stadium_puzzle.hints["stadium_upper_level_access_card"] = loc;
    locs = getstructarray("maphint_stadium_code_computer", "targetname");
    level.stadium_puzzle.hints["maphint_stadium_code_computer"] = [];
    foreach (i, loc in locs) {
        computerscriptable = spawnscriptable("stadium_code_computer", loc.origin, loc.angles);
        if (false) {
            level thread computer_debugtestloop(computerscriptable);
        }
        targetarray = getstructarray(loc.target, "targetname");
        loc.scriptable = spawnscriptable("maphint_stadium_code_computer", targetarray[0].origin, targetarray[0].angles);
        loc.scriptable.computerscriptable = computerscriptable;
        level.stadium_puzzle.hints["maphint_stadium_code_computer"][i] = loc;
    }
    locs = getstructarray("stadium_boardroom_keypad", "targetname");
    level.stadium_puzzle.var_e696f89e8fdc4b64 = [];
    foreach (loc in locs) {
        collisionorigin = undefined;
        if (distance2dsquared(loc.origin, (31075, -521, 42)) < 1024) {
            loc.origin = loc.origin - (5, 5, 0);
            collisionorigin = (31226, -510, 0);
        } else {
            collisionorigin = (31499, -192, 0);
        }
        loc.scriptable = spawnscriptable("maphint_stadium_keypad", loc.origin);
        loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
        loc.scriptable.name = "stadium_boardroom_keypad";
        scripts/mp/gametypes/br_bunker_utility::lockscriptabledoors(loc.scriptable);
        door = loc.scriptable.doors[0];
        patch7 = getent("clip128x128x128", "targetname");
        var_10688b3021acc893 = spawn("script_model", collisionorigin);
        var_10688b3021acc893.angles = door.angles;
        var_10688b3021acc893 clonebrushmodeltoscriptmodel(patch7);
        level.stadium_puzzle.var_e696f89e8fdc4b64[level.stadium_puzzle.var_e696f89e8fdc4b64.size] = var_10688b3021acc893;
    }
    level.stadium_puzzle.hints["stadium_boardroom_keypad"] = locs;
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd1
// Size: 0x4bb
function registeraccesscardlocs() {
    level.stadium_puzzle.keycardlocs = [];
    level.stadium_puzzle.keycardlocs[0] = (32343, 1601, -614);
    level.stadium_puzzle.keycardlocs[1] = (27868, 115, -614);
    level.stadium_puzzle.keycardlocs[2] = (27788, 1064, -686);
    level.stadium_puzzle.keycardlocs[3] = (26328, 3252, -662);
    level.stadium_puzzle.keycardlocs[4] = (29046, 4572, -614);
    level.stadium_puzzle.keycardlocs[5] = (27803, 6043, -614);
    level.stadium_puzzle.keycardlocs[6] = (27089, 5807, -614);
    level.stadium_puzzle.keycardlocs[7] = (25513, 4366, -614);
    level.stadium_puzzle.keycardlocs[8] = (25010, 3209, -614);
    level.stadium_puzzle.keycardlocs[9] = (25521, 2418, -614);
    level.stadium_puzzle.keycardlocs[10] = (25459, 1454, -614);
    level.stadium_puzzle.keycardlocs[11] = (29470, 3561, -748);
    level.stadium_puzzle.keycardlocs[12] = (30640, 2603, -662);
    level.stadium_puzzle.keycardlocs[13] = (28113, 5767, -422);
    level.stadium_puzzle.keycardlocs[14] = (25253, 2907, -422);
    level.stadium_puzzle.keycardlocs[15] = (27085, 1023, -470);
    level.stadium_puzzle.keycardlocs[16] = (31592, 1282, -494);
    level.stadium_puzzle.keycardlocs[17] = (28554, 134, -806);
    level.stadium_puzzle.keycardlocs[18] = (28896, 272, -806);
    level.stadium_puzzle.keycardlocs[19] = (25164, 2910, -871);
    level.stadium_puzzle.keycardlocs[20] = (26221, 5046, -878);
    level.stadium_puzzle.keycardlocs[21] = (26709, 5693, -870);
    level.stadium_puzzle.keycardlocs[22] = (29938, 5509, -870);
    level.stadium_puzzle.keycardlocs[23] = (31855, 4102, -870);
    level.stadium_puzzle.keycardlocs[24] = (31491, -1129, -878);
    level.stadium_puzzle.keycardlocs[25] = (32145, -453, -878);
    level.stadium_puzzle.keycardlocs[26] = (26502, 2027, -870);
    level.stadium_puzzle.keycardlocs[27] = (25909, 4970, 42);
    level.stadium_puzzle.keycardlocs[28] = (26570, 5592, 26);
    level.stadium_puzzle.keycardlocs[29] = (28871, 6308, 35);
    level.stadium_puzzle.keycardlocs[30] = (30576, 4789, 41);
    level.stadium_puzzle.keycardlocs[31] = (32066, 3792, 41);
    level.stadium_puzzle.keycardlocs[32] = (27438, -744, 41);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2293
// Size: 0x228
function spawnaccesscards() {
    var_f4dd331cd2cb26f1 = getdvarint(@"hash_54e24cefd08ff3c1", 1);
    var_208f22ae47059089 = (0, 0, 15);
    level.stadium_puzzle.keycardlocs = array_randomize(level.stadium_puzzle.keycardlocs);
    level.stadium_puzzle.keycardlocs_chosen = [];
    for (i = 0; i < var_f4dd331cd2cb26f1 * 3; i = i + 3) {
        origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(level.stadium_puzzle.keycardlocs[i], 0) + var_208f22ae47059089;
        scriptable = spawnscriptable("brloot_access_card_blue_stadium_parking", origin);
        scripts/mp/gametypes/br_pickups::registerscriptableinstance(scriptable);
        level.stadium_puzzle.keycardlocs_chosen[level.stadium_puzzle.keycardlocs_chosen.size] = scriptable;
        if (false) {
            thread scripts/mp/utility/debug::drawsphere(origin, 128, 10000, (0, 1, 0));
        }
        origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(level.stadium_puzzle.keycardlocs[i + 1], 0) + var_208f22ae47059089;
        scriptable = spawnscriptable("brloot_access_card_blue_stadium_executive", origin);
        scripts/mp/gametypes/br_pickups::registerscriptableinstance(scriptable);
        level.stadium_puzzle.keycardlocs_chosen[level.stadium_puzzle.keycardlocs_chosen.size] = scriptable;
        if (false) {
            thread scripts/mp/utility/debug::drawsphere(origin, 128, 10000, (0, 1, 0));
        }
        origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(level.stadium_puzzle.keycardlocs[i + 2], 0) + var_208f22ae47059089;
        scriptable = spawnscriptable("brloot_access_card_blue_stadium_concourse", origin);
        scripts/mp/gametypes/br_pickups::registerscriptableinstance(scriptable);
        level.stadium_puzzle.keycardlocs_chosen[level.stadium_puzzle.keycardlocs_chosen.size] = scriptable;
        if (false) {
            thread scripts/mp/utility/debug::drawsphere(origin, 128, 10000, (0, 1, 0));
        }
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c2
// Size: 0x548
function serverroomrewardroll() {
    level.stadium_puzzle.serverroomrewardlocs = [];
    if (level.mapname == "mp_bm_bunker01") {
        level.stadium_puzzle.serverroomrewardlocs[0] = spawnstruct();
        level.stadium_puzzle.serverroomrewardlocs[0].origin = (2237, -3467, 322);
        level.stadium_puzzle.serverroomrewardlocs[0].angles = (5, 180, 0);
        level.stadium_puzzle.serverroomrewardlocs[0].locname = "stadium_parking_garage_access_reader";
        level.stadium_puzzle.serverroomrewardlocs[1] = spawnstruct();
        level.stadium_puzzle.serverroomrewardlocs[1].origin = (2237, -4005, 322);
        level.stadium_puzzle.serverroomrewardlocs[1].angles = (0, 0, 0);
        level.stadium_puzzle.serverroomrewardlocs[1].locname = "stadium_upper_level_access_card";
        level.stadium_puzzle.serverroomrewardlocs[2] = spawnstruct();
        level.stadium_puzzle.serverroomrewardlocs[2].origin = (2237, -4400, 322);
        level.stadium_puzzle.serverroomrewardlocs[2].angles = (0, 0, 0);
        level.stadium_puzzle.serverroomrewardlocs[2].locname = "stadium_concourse_access_reader";
    } else {
        level.stadium_puzzle.serverroomrewardlocs[0] = spawnstruct();
        level.stadium_puzzle.serverroomrewardlocs[0].origin = (28811, -5117, -1100);
        level.stadium_puzzle.serverroomrewardlocs[0].angles = (5, 180, 0);
        level.stadium_puzzle.serverroomrewardlocs[0].locname = "stadium_parking_garage_access_reader";
        level.stadium_puzzle.serverroomrewardlocs[1] = spawnstruct();
        level.stadium_puzzle.serverroomrewardlocs[1].origin = (28617, -1566, 10);
        level.stadium_puzzle.serverroomrewardlocs[1].angles = (0, 0, 0);
        level.stadium_puzzle.serverroomrewardlocs[1].locname = "stadium_upper_level_access_card";
        level.stadium_puzzle.serverroomrewardlocs[2] = spawnstruct();
        level.stadium_puzzle.serverroomrewardlocs[2].origin = (25743, 1821, -635);
        level.stadium_puzzle.serverroomrewardlocs[2].angles = (0, 0, 0);
        level.stadium_puzzle.serverroomrewardlocs[2].locname = "stadium_concourse_access_reader";
    }
    var_c1a111fce3901443 = 8;
    if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "plunder") {
        var_c1a111fce3901443 = 0;
    }
    var_eb80fbb0bf8736d = getdvarint(@"hash_f6309d261cb765a6", 8);
    var_41d59b96cf4ecc51 = getdvarint(@"hash_c9f85fe8a0808a02", 8);
    var_cc2b025d5d9d414d = getdvarint(@"hash_a0f7456d2a7f2ec0", 8);
    var_94c29ef7c8696d31 = getdvarint(@"hash_8ba797c60efac2a0", var_c1a111fce3901443);
    var_1b32ecd6577d3426 = getdvarint(@"hash_dfc4be00d82601f1", 18);
    var_80932ed77012b17d = getdvarint(@"hash_fcba69702bf87b60", 50);
    total = var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31 + var_1b32ecd6577d3426 + var_80932ed77012b17d;
    var_8b591b0bc361ab3d = randomintrange(1, total);
    if (var_8b591b0bc361ab3d < var_eb80fbb0bf8736d) {
        serverroomrewardspawn("brloot_killstreak_auav");
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51) {
        serverroomrewardspawn("brloot_specialist_bonus");
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d) {
        serverroomrewardspawn("brloot_offhand_advancedsupplydrop");
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31) {
        serverroomrewardspawn("brloot_equip_gasmask_durable");
        return;
    }
    if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31 + var_1b32ecd6577d3426) {
        serverroomrewardspawn("brloot_killstreak_juggernaut");
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a11
// Size: 0x6d
function serverroomrewardspawn(rewardtype) {
    loc = random(level.stadium_puzzle.serverroomrewardlocs);
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(loc.origin, loc.angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(rewardtype, dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a85
// Size: 0x4b
function showdebugresult(resulttext) {
    for (timeshown = 0; timeshown < 5; timeshown = timeshown + 0.05) {
        /#
            printtoscreen2d(500, 500, resulttext, (1, 1, 1), 1);
        #/
        waitframe();
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad7
// Size: 0xfd
function debug_printcode(codestruct) {
    level notify("endStadiumCodeDebugPrint");
    level endon("endStadiumCodeDebugPrint");
    numberspacing = 10;
    while (true) {
        /#
            printtoscreen2d(500, 100, "brloot_weapon_lm_dblmg_lege", (1, 1, 1), 1);
        #/
        if (!scripts/mp/flags::gameflag("prematch_done")) {
            /#
                printtoscreen2d(600, 100, "num3", (1, 1, 1), 1);
            #/
        } else {
            foreach (i, number in codestruct.code["array"]) {
                /#
                    printtoscreen2d(700 + numberspacing * i, 100, number, (1, 1, 1), 1);
                #/
            }
        }
        waitframe();
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bdb
// Size: 0x113
function debug_bunkertestaccesscardlocs() {
    level.stadium_puzzle.keycardlocs = [];
    level.stadium_puzzle.keycardlocs[0] = (1949, -3276, 322);
    level.stadium_puzzle.keycardlocs[1] = (1949, -3576, 322);
    level.stadium_puzzle.keycardlocs[2] = (1949, -3776, 322);
    level.stadium_puzzle.keycardlocs[3] = (1949, -3976, 322);
    level.stadium_puzzle.keycardlocs[4] = (1949, -4176, 322);
    level.stadium_puzzle.keycardlocs[5] = (1949, -4276, 322);
    level.stadium_puzzle.keycardlocs[6] = (1949, -3076, 322);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf5
// Size: 0xea
function debug_spawnallaccesscards() {
    var_95e0549c81b7f37d = ["brloot_access_card_blue_stadium_parking", "brloot_access_card_blue_stadium_executive", "brloot_access_card_blue_stadium_concourse"];
    var_208f22ae47059089 = (0, 0, 15);
    foreach (loc in level.stadium_puzzle.keycardlocs) {
        origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(loc, 0) + var_208f22ae47059089;
        scriptable = spawnscriptable(random(var_95e0549c81b7f37d), origin);
        scripts/mp/gametypes/br_pickups::registerscriptableinstance(scriptable);
        thread scripts/mp/utility/debug::drawsphere(origin, 128, 10000, (0, 1, 0));
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2de6
// Size: 0x188
function debug_spawnrewardstest() {
    angles = (0, 0, 0);
    origin = (1563, -3289, 300);
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount("brloot_killstreak_auav");
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin, angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_killstreak_auav", dropinfo, count, 0);
    origin = (1563, -3402, 300);
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount("brloot_specialist_bonus");
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin, angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_specialist_bonus", dropinfo, 1, 0);
    origin = (1563, -3533, 300);
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount("brloot_offhand_advancedsupplydrop");
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin, angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_offhand_advancedsupplydrop", dropinfo, 1, 0);
    origin = (1563, -3650, 300);
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount("brloot_equip_gasmask_durable");
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin, angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_equip_gasmask_durable", dropinfo, 1, 0);
    origin = (1690, -3289, 300);
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount("brloot_weapon_lm_dblmg_lege");
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin, angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_weapon_lm_dblmg_lege", dropinfo, 1, 0);
    origin = (1690, -3402, 300);
    count = scripts/mp/gametypes/br_bunker_utility::getitemcount("brloot_killstreak_juggernaut");
    dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(origin, angles);
    scriptable = scripts/mp/gametypes/br_pickups::spawnpickup("brloot_killstreak_juggernaut", dropinfo, 1, 0);
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f75
// Size: 0x154
function computer_debugtestloop(scriptable) {
    while (true) {
        scriptable setscriptablepartstate("stadium_code_computer", "intro");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num0");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num1");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num2");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num3");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num4");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num5");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num6");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num7");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num8");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "num9");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "symbol1");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "symbol2");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "symbol3");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "symbol4");
        wait(1);
        scriptable setscriptablepartstate("stadium_code_computer", "reset");
        wait(1);
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30d0
// Size: 0xa7
function debug_showcardlocs() {
    level notify("endStadiumCardLocs");
    level endon("endStadiumCardLocs");
    while (true) {
        foreach (scriptable in level.stadium_puzzle.keycardlocs_chosen) {
            if (isdefined(scriptable.origin)) {
                thread scripts/mp/utility/debug::drawsphere(scriptable.origin, 128, 1, (0, 1, 0));
            }
        }
        wait(1);
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x317e
// Size: 0x61
function debug_show2dvotext(text, time) {
    if (true) {
        return;
    }
    for (curtime = 0; curtime < time; curtime = curtime + 0.05) {
        /#
            printtoscreen2d(500, 350, "<unknown string>" + text, (1, 1, 1), 1.5);
        #/
        waitframe();
    }
}

// Namespace br_stadium_puzzle / scripts/mp/gametypes/br_stadium_puzzle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31e6
// Size: 0x165
function function_138da425d10b4a04() {
    /#
        while (true) {
            if (getdvarint(@"hash_b816c5e95360de9e", 0) == 1) {
                if (!istrue(level.stadium_puzzle.boardroomopen)) {
                    if (level.stadium_puzzle.hints["<unknown string>"].size > 0) {
                        foreach (keypad in level.stadium_puzzle.hints["<unknown string>"]) {
                            boardroomdoorcodeentrysuccess(keypad.scriptable);
                        }
                    } else {
                        level.stadium_puzzle.boardroomopen = 1;
                        spawnuniqueboardroomloot();
                    }
                } else {
                    scripts/engine/utility::exploder("<unknown string>");
                }
                setdvar(@"hash_b816c5e95360de9e", 0);
            }
            if (getdvarint(@"hash_ed073eb605049cef", 0) == 1) {
                level thread debug_printcode(level.stadium_puzzle);
            } else {
                level notify("<unknown string>");
            }
            if (getdvarint(@"hash_6d2b60f74eb2d6f7", 0) == 1) {
                level thread debug_showcardlocs();
            } else {
                level notify("<unknown string>");
            }
            wait(1);
        }
    #/
}

