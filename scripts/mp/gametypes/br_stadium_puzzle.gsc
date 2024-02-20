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

#namespace namespace_bf72bcf3668ff172;

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53b
// Size: 0x9b
function init() {
    level.stadiumpuzzleactive = getdvarint(@"hash_3c07e307bec0051b", 1);
    level.stadium_puzzle = spawnstruct();
    if (level.stadiumpuzzleactive) {
        level.stadium_puzzle.hints = [];
        level.stadium_puzzle.code = [];
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_stadium_code_computer", &codecomputerscriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_stadium_access_reader", &accessreaderscriptableused);
    }
    level thread namespace_cb965d2f71fefddc::registeruniquelootcallback(2, &awardstadiumblueprint);
    level thread initpostmain();
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
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
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_885780d268327ba4 = getdvarint(@"hash_2b534a885f537dfa", 8);
    setupboardroomcode(var_885780d268327ba4, level.stadium_puzzle);
    serverroomrewardroll();
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67a
// Size: 0x104
function setupboardroomcode(var_885780d268327ba4, var_48b11326257052f1) {
    namespace_ff69a74765774dfd::generatenumbercode(var_885780d268327ba4, var_48b11326257052f1, 1, 1);
    var_48b11326257052f1.displaycodes = namespace_ff69a74765774dfd::generatecodestoshow(var_48b11326257052f1.code, 3, 1, 1);
    namespace_ff69a74765774dfd::assigncodecomputersdisplaycodes(var_48b11326257052f1.hints["maphint_stadium_code_computer"], var_48b11326257052f1.displaycodes);
    foreach (keypad in level.stadium_puzzle.hints["stadium_boardroom_keypad"]) {
        keypad.scriptable.code = var_48b11326257052f1.code;
        keypad.scriptable.successfunction = &boardroomdoorcodeentrysuccess;
    }
    if (0) {
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x785
// Size: 0x52
function codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "maphint_stadium_code_computer");
    #/
    level thread _codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7de
// Size: 0x220
function _codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            playsoundatpos(instance.origin, "br_computer_deny");
            instance setscriptablepartstate("maphint_stadium_code_computer", "off");
            wait(3);
            instance setscriptablepartstate("maphint_stadium_code_computer", "on");
        } else {
            player namespace_99ac021a7547cae3::function_e636e108dffe6ab7();
            var_259704388e91fe40 = namespace_ff69a74765774dfd::getcodecomputerdisplaycode(level.stadium_puzzle, instance.displaycodeindex);
            instance setscriptablepartstate("maphint_stadium_code_computer", "off");
            while (istrue(instance.computermakingnose)) {
                waitframe();
            }
            instance notify("computer_used");
            playsoundatpos(instance.origin, "stadium_computer_code_start");
            instance.computerscriptable setscriptablepartstate("stadium_code_computer", "blank");
            wait(2);
            foreach (var_5d8b57cc867a9f80 in var_259704388e91fe40) {
                if (isint(var_5d8b57cc867a9f80)) {
                    var_5d8b57cc867a9f80 = "num" + var_5d8b57cc867a9f80;
                }
                instance.computerscriptable setscriptablepartstate("stadium_code_computer", var_5d8b57cc867a9f80);
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
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa05
// Size: 0x42
function accessreaderscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _accessreaderscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xa4e
// Size: 0x10b
function _accessreaderscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_stadium_access_reader");
    #/
    instance setscriptablepartstate("maphint_stadium_access_reader", "off");
    if (getdvarint(@"hash_c18b5c0b64eb7d60", 0) == 1 || player namespace_d3d40f75bb4e4c32::hasaccesscard(instance.requiredcardtype)) {
        playsoundatpos(instance.origin, "br_keypad_confirm");
        namespace_ff69a74765774dfd::openscriptabledoors(instance);
        instance setscriptablepartstate("maphint_stadium_access_reader", "off");
        player namespace_cb965d2f71fefddc::removeaccesscard();
        instance.addedcollision delete();
    } else {
        if (soundexists("br_keypad_deny")) {
            playsoundatpos(player.origin, "br_keypad_deny");
        }
        instance setscriptablepartstate("maphint_stadium_access_reader", "off");
        wait(3);
        instance setscriptablepartstate("maphint_stadium_access_reader", "on");
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb60
// Size: 0xcd
function boardroomdoorcodeentrysuccess(instance) {
    playsoundatpos(instance.origin, "br_phone_code_correct");
    namespace_ff69a74765774dfd::unlockscriptabledoors(instance);
    if (!istrue(level.stadium_puzzle.boardroomopen)) {
        spawnuniqueboardroomloot();
    }
    level.stadium_puzzle.boardroomopen = 1;
    foreach (var_f4c1a97f167eec9b in level.stadium_puzzle.var_e696f89e8fdc4b64) {
        if (isdefined(var_f4c1a97f167eec9b)) {
            var_f4c1a97f167eec9b delete();
        }
    }
    namespace_3c37cb17ade254d::exploder("stad_fireworks");
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc34
// Size: 0x16d
function spawnuniqueboardroomloot() {
    spawnboardroomblueprintweapons();
    var_c1a111fce3901443 = 1;
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "plunder") {
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
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51) {
        spawnboardroom_specialist();
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d) {
        spawnboardroom_loadoutdrop();
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31) {
        spawnboardroom_gasmask();
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31 + var_4b38d0dfdae99bfb) {
        spawnboardroom_miniguns();
    } else {
        spawnboardroom_juggdrop();
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda8
// Size: 0x142
function spawnboardroomblueprintweapons() {
    var_7957ae38c168f3df = "brloot_weapon_bp_reward_sm_mpapa7_lege";
    count = namespace_ff69a74765774dfd::getitemcount(var_7957ae38c168f3df);
    origin1 = (31270, -265, 21.5);
    var_924af5f42304dae4 = (0, 266, 80);
    origin2 = (31385, -373, 21.5);
    angles2 = (0, 23, 80);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = (1247, -4060, 300);
        var_924af5f42304dae4 = (0, 177, 75);
        origin2 = (1260, -3826, 300);
        angles2 = (0, 1776, 75);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
    if (isdefined(scriptable)) {
        scriptable.uniquelootitemid = "uniqueLootItem_2";
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin2, angles2);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
    if (isdefined(scriptable)) {
        scriptable.uniquelootitemid = "uniqueLootItem_2";
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef1
// Size: 0x83
function spawnboardroom_auav() {
    origin1 = (31484, -464, 12);
    var_924af5f42304dae4 = (0, 135, 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_killstreak_auav", var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf7b
// Size: 0x135
function spawnboardroom_specialist() {
    origin1 = (31484, -464, 7);
    var_924af5f42304dae4 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_specialist_bonus", var_cb4fad49263e20c4, 1, 0);
    origin1 = (31332, -82, 7);
    var_924af5f42304dae4 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_specialist_bonus", var_cb4fad49263e20c4, 1, 0);
    origin1 = (31086, -370, 7);
    var_924af5f42304dae4 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_specialist_bonus", var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b7
// Size: 0x83
function spawnboardroom_loadoutdrop() {
    origin1 = (31484, -464, 7);
    var_924af5f42304dae4 = (0, 135, 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_offhand_advancedsupplydrop", var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1141
// Size: 0x135
function spawnboardroom_gasmask() {
    origin1 = (31484, -464, 7);
    var_924af5f42304dae4 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_equip_gasmask_durable", var_cb4fad49263e20c4, 1, 0);
    origin1 = (31332, -82, 7);
    var_924af5f42304dae4 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_equip_gasmask_durable", var_cb4fad49263e20c4, 1, 0);
    origin1 = (31086, -370, 7);
    var_924af5f42304dae4 = (0, randomint(359), 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_equip_gasmask_durable", var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127d
// Size: 0x113
function spawnboardroom_miniguns() {
    origin1 = (31390, 0, 2);
    var_924af5f42304dae4 = (-70, 145, 80);
    origin2 = (31022, -348, 2);
    angles2 = (-70, 132, 80);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = (1247, -4060, 300);
        var_924af5f42304dae4 = (0, 177, 75);
        origin2 = (1260, -3826, 300);
        angles2 = (0, 1776, 75);
    }
    var_7957ae38c168f3df = "brloot_weapon_lm_dblmg_lege";
    count = namespace_ff69a74765774dfd::getitemcount(var_7957ae38c168f3df);
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin2, angles2);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1397
// Size: 0x83
function spawnboardroom_juggdrop() {
    origin1 = (31484, -464, 7);
    var_924af5f42304dae4 = (0, 135, 0);
    if (level.mapname == "mp_bm_bunker01") {
        origin1 = origin1 + (-30113, -3566, 300);
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin1, var_924af5f42304dae4);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_killstreak_juggernaut", var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1421
// Size: 0xb4
function awardstadiumblueprint(player) {
    foreach (teammate in getteamdata(player.team, "players")) {
        if (!isdefined(teammate)) {
            continue;
        }
        teammate namespace_aad14af462a74d08::onunlockitem("blueprint_unlock_629");
        teammate namespace_bd0162aedd8c8594::logevent_challengeitemunlocked(teammate, "blueprint_unlock_629", "blueprint", 629);
        optionalnumber = 0;
        if (optionalnumber > 0) {
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_unlockable_weapon_splash", optionalnumber);
        }
    }
    return 1;
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
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

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156c
// Size: 0x7b
function musictriggerthink(trigger) {
    trigger endon("endMusicTrigger");
    while (1) {
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

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ee
// Size: 0x7dc
function gatherstadiumlocs() {
    loc = getstruct("stadium_parking_garage_access_reader", "targetname");
    loc.scriptable = spawnscriptable("maphint_stadium_access_reader", loc.origin);
    loc.scriptable.name = "stadium_parking_garage_access_reader";
    loc.scriptable.requiredcardtype = "brloot_access_card_blue_stadium_parking";
    loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
    namespace_ff69a74765774dfd::lockscriptabledoors(loc.scriptable);
    door = loc.scriptable.doors[0];
    forward = anglestoforward(door.angles);
    right = anglestoright(door.angles);
    var_c548d45f1d62279a = door.origin + forward * 27 + right * 64;
    var_1e15ca204f179886 = getent("clip128x128x128", "targetname");
    var_10688b3021acc893 = spawn("script_model", var_c548d45f1d62279a);
    var_10688b3021acc893.angles = door.angles;
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(var_1e15ca204f179886);
    loc.scriptable.addedcollision = var_10688b3021acc893;
    level.stadium_puzzle.hints["stadium_parking_garage_access_reader"] = loc;
    loc = getstruct("stadium_concourse_access_reader", "targetname");
    loc.scriptable = spawnscriptable("maphint_stadium_access_reader", loc.origin);
    loc.scriptable.name = "stadium_concourse_access_reader";
    loc.scriptable.requiredcardtype = "brloot_access_card_blue_stadium_concourse";
    loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
    namespace_ff69a74765774dfd::lockscriptabledoors(loc.scriptable);
    door = loc.scriptable.doors[0];
    forward = anglestoforward(door.angles);
    right = anglestoright(door.angles);
    var_c548d45f1d62279a = door.origin + forward * 27 + right * 64;
    var_1e15ca204f179886 = getent("clip128x128x128", "targetname");
    var_10688b3021acc893 = spawn("script_model", var_c548d45f1d62279a);
    var_10688b3021acc893.angles = door.angles;
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(var_1e15ca204f179886);
    loc.scriptable.addedcollision = var_10688b3021acc893;
    level.stadium_puzzle.hints["stadium_concourse_access_reader"] = loc;
    loc = getstruct("stadium_upper_level_access_card", "targetname");
    loc.origin = loc.origin - (2, 4, -2);
    loc.scriptable = spawnscriptable("maphint_stadium_access_reader", loc.origin);
    loc.scriptable.name = "stadium_upper_level_access_card";
    loc.scriptable.requiredcardtype = "brloot_access_card_blue_stadium_executive";
    loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
    namespace_ff69a74765774dfd::lockscriptabledoors(loc.scriptable);
    door = loc.scriptable.doors[0];
    forward = anglestoforward(door.angles);
    right = anglestoright(door.angles);
    var_c548d45f1d62279a = door.origin + forward * 27 + right * 64;
    var_1e15ca204f179886 = getent("clip128x128x128", "targetname");
    var_10688b3021acc893 = spawn("script_model", var_c548d45f1d62279a);
    var_10688b3021acc893.angles = door.angles;
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(var_1e15ca204f179886);
    loc.scriptable.addedcollision = var_10688b3021acc893;
    level.stadium_puzzle.hints["stadium_upper_level_access_card"] = loc;
    locs = getstructarray("maphint_stadium_code_computer", "targetname");
    level.stadium_puzzle.hints["maphint_stadium_code_computer"] = [];
    foreach (i, loc in locs) {
        computerscriptable = spawnscriptable("stadium_code_computer", loc.origin, loc.angles);
        if (0) {
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
        var_a5b06cfcda6b2425 = undefined;
        if (distance2dsquared(loc.origin, (31075, -521, 42)) < 1024) {
            loc.origin = loc.origin - (5, 5, 0);
            var_a5b06cfcda6b2425 = (31226, -510, 0);
        } else {
            var_a5b06cfcda6b2425 = (31499, -192, 0);
        }
        loc.scriptable = spawnscriptable("maphint_stadium_keypad", loc.origin);
        loc.scriptable.doors = getentitylessscriptablearray(loc.target, "targetname");
        loc.scriptable.name = "stadium_boardroom_keypad";
        namespace_ff69a74765774dfd::lockscriptabledoors(loc.scriptable);
        door = loc.scriptable.doors[0];
        var_1e15ca204f179886 = getent("clip128x128x128", "targetname");
        var_10688b3021acc893 = spawn("script_model", var_a5b06cfcda6b2425);
        var_10688b3021acc893.angles = door.angles;
        var_10688b3021acc893 clonebrushmodeltoscriptmodel(var_1e15ca204f179886);
        level.stadium_puzzle.var_e696f89e8fdc4b64[level.stadium_puzzle.var_e696f89e8fdc4b64.size] = var_10688b3021acc893;
    }
    level.stadium_puzzle.hints["stadium_boardroom_keypad"] = locs;
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
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

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2293
// Size: 0x228
function spawnaccesscards() {
    var_f4dd331cd2cb26f1 = getdvarint(@"hash_54e24cefd08ff3c1", 1);
    var_208f22ae47059089 = (0, 0, 15);
    level.stadium_puzzle.keycardlocs = array_randomize(level.stadium_puzzle.keycardlocs);
    level.stadium_puzzle.keycardlocs_chosen = [];
    i = 0;
    while (i < var_f4dd331cd2cb26f1 * 3) {
        origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(level.stadium_puzzle.keycardlocs[i], 0) + var_208f22ae47059089;
        scriptable = spawnscriptable("brloot_access_card_blue_stadium_parking", origin);
        namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        level.stadium_puzzle.keycardlocs_chosen[level.stadium_puzzle.keycardlocs_chosen.size] = scriptable;
        if (0) {
            thread namespace_d028276791d9cff6::drawsphere(origin, 128, 10000, (0, 1, 0));
        }
        origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(level.stadium_puzzle.keycardlocs[i + 1], 0) + var_208f22ae47059089;
        scriptable = spawnscriptable("brloot_access_card_blue_stadium_executive", origin);
        namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        level.stadium_puzzle.keycardlocs_chosen[level.stadium_puzzle.keycardlocs_chosen.size] = scriptable;
        if (0) {
            thread namespace_d028276791d9cff6::drawsphere(origin, 128, 10000, (0, 1, 0));
        }
        origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(level.stadium_puzzle.keycardlocs[i + 2], 0) + var_208f22ae47059089;
        scriptable = spawnscriptable("brloot_access_card_blue_stadium_concourse", origin);
        namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        level.stadium_puzzle.keycardlocs_chosen[level.stadium_puzzle.keycardlocs_chosen.size] = scriptable;
        if (0) {
            thread namespace_d028276791d9cff6::drawsphere(origin, 128, 10000, (0, 1, 0));
        }
        i = i + 3;
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
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
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "plunder") {
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
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51) {
        serverroomrewardspawn("brloot_specialist_bonus");
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d) {
        serverroomrewardspawn("brloot_offhand_advancedsupplydrop");
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31) {
        serverroomrewardspawn("brloot_equip_gasmask_durable");
    } else if (var_8b591b0bc361ab3d <= var_eb80fbb0bf8736d + var_41d59b96cf4ecc51 + var_cc2b025d5d9d414d + var_94c29ef7c8696d31 + var_1b32ecd6577d3426) {
        serverroomrewardspawn("brloot_killstreak_juggernaut");
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a11
// Size: 0x6d
function serverroomrewardspawn(rewardtype) {
    loc = random(level.stadium_puzzle.serverroomrewardlocs);
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(loc.origin, loc.angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(rewardtype, var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a85
// Size: 0x4b
function showdebugresult(var_1b0d855f76756d57) {
    var_18da35a53f30ffd = 0;
    while (var_18da35a53f30ffd < 5) {
        /#
            printtoscreen2d(500, 500, var_1b0d855f76756d57, (1, 1, 1), 1);
        #/
        waitframe();
        var_18da35a53f30ffd = var_18da35a53f30ffd + 0.05;
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad7
// Size: 0xfd
function debug_printcode(var_48b11326257052f1) {
    level notify("endStadiumCodeDebugPrint");
    level endon("endStadiumCodeDebugPrint");
    var_dd1003ea8b91bb85 = 10;
    while (1) {
        /#
            printtoscreen2d(500, 100, "brloot_weapon_lm_dblmg_lege", (1, 1, 1), 1);
        #/
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            /#
                printtoscreen2d(600, 100, "num3", (1, 1, 1), 1);
            #/
        } else {
            foreach (i, number in var_48b11326257052f1.code["array"]) {
                /#
                    printtoscreen2d(700 + var_dd1003ea8b91bb85 * i, 100, number, (1, 1, 1), 1);
                #/
            }
        }
        waitframe();
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
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

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf5
// Size: 0xea
function debug_spawnallaccesscards() {
    var_95e0549c81b7f37d = [0:"brloot_access_card_blue_stadium_parking", 1:"brloot_access_card_blue_stadium_executive", 2:"brloot_access_card_blue_stadium_concourse"];
    var_208f22ae47059089 = (0, 0, 15);
    foreach (loc in level.stadium_puzzle.keycardlocs) {
        origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(loc, 0) + var_208f22ae47059089;
        scriptable = spawnscriptable(random(var_95e0549c81b7f37d), origin);
        namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        thread namespace_d028276791d9cff6::drawsphere(origin, 128, 10000, (0, 1, 0));
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2de6
// Size: 0x188
function debug_spawnrewardstest() {
    angles = (0, 0, 0);
    origin = (1563, -3289, 300);
    count = namespace_ff69a74765774dfd::getitemcount("brloot_killstreak_auav");
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_killstreak_auav", var_cb4fad49263e20c4, count, 0);
    origin = (1563, -3402, 300);
    count = namespace_ff69a74765774dfd::getitemcount("brloot_specialist_bonus");
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_specialist_bonus", var_cb4fad49263e20c4, 1, 0);
    origin = (1563, -3533, 300);
    count = namespace_ff69a74765774dfd::getitemcount("brloot_offhand_advancedsupplydrop");
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_offhand_advancedsupplydrop", var_cb4fad49263e20c4, 1, 0);
    origin = (1563, -3650, 300);
    count = namespace_ff69a74765774dfd::getitemcount("brloot_equip_gasmask_durable");
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_equip_gasmask_durable", var_cb4fad49263e20c4, 1, 0);
    origin = (1690, -3289, 300);
    count = namespace_ff69a74765774dfd::getitemcount("brloot_weapon_lm_dblmg_lege");
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_weapon_lm_dblmg_lege", var_cb4fad49263e20c4, 1, 0);
    origin = (1690, -3402, 300);
    count = namespace_ff69a74765774dfd::getitemcount("brloot_killstreak_juggernaut");
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup("brloot_killstreak_juggernaut", var_cb4fad49263e20c4, 1, 0);
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f75
// Size: 0x154
function computer_debugtestloop(scriptable) {
    while (1) {
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

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30d0
// Size: 0xa7
function debug_showcardlocs() {
    level notify("endStadiumCardLocs");
    level endon("endStadiumCardLocs");
    while (1) {
        foreach (scriptable in level.stadium_puzzle.keycardlocs_chosen) {
            if (isdefined(scriptable.origin)) {
                thread namespace_d028276791d9cff6::drawsphere(scriptable.origin, 128, 1, (0, 1, 0));
            }
        }
        wait(1);
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x317e
// Size: 0x61
function debug_show2dvotext(text, time) {
    if (1) {
        return;
    }
    curtime = 0;
    while (curtime < time) {
        /#
            printtoscreen2d(500, 350, "<unknown string>" + text, (1, 1, 1), 1.5);
        #/
        waitframe();
        curtime = curtime + 0.05;
    }
}

// Namespace namespace_bf72bcf3668ff172/namespace_12df19270b2bc59f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31e6
// Size: 0x165
function function_138da425d10b4a04() {
    /#
        while (1) {
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
                    namespace_3c37cb17ade254d::exploder("<unknown string>");
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

