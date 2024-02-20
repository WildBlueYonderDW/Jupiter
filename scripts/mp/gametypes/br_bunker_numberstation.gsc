// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_d9f38e6b6f406a1f;

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3b
// Size: 0x25d
function init() {
    level.bunker11puzzleactive = getdvarint(@"hash_2b4e25fd276456be", 1);
    namespace_4b0406965e556711::gameflaginit("stop_phone_code_ringing", 0);
    level.bunker_numberstation = spawnstruct();
    doors = getentarray("bunker_door_11", "targetname");
    level.bunker_numberstation.door = doors[0];
    level.bunker_numberstation.hints["keypad"] = [];
    initbunker11keypad();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_keypad_bunker_11", &keypadscriptableused);
    if (level.bunker11puzzleactive) {
        level.bunker_numberstation.hints = [];
        level.bunker_numberstation.hints["phones_code"] = [];
        level.bunker_numberstation.hints["phones_morse"] = [];
        initvo();
        level.bunker_numberstation.code = [];
        level.bunker_numberstation.codeentered = [];
        level.bunker_numberstation.successfulteams = [];
        level.bunker_numberstation.teamcodeprogress = [];
        level.bunker_numberstation.codecorrectlyenteredbyanyone = 0;
        level.bunker_numberstation.bunkeropened = 0;
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_0", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_1", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_2", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_3", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_4", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_5", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_6", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_7", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_8", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_morse_9", &phonemorsesinglescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_phone_code", &codephonescriptableused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_computer_reboot", &computerrebootused);
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_red_button", &redbuttonused);
    }
    level thread initpostmain();
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9f
// Size: 0xf4
function initpostmain() {
    waittillframeend();
    level thread namespace_ff69a74765774dfd::initbunkerdoor(level.bunker_numberstation.door, 0);
    if (!level.bunker11puzzleactive) {
        return;
    }
    if (level.mapname == "mp_bm_bunker01") {
        initlocs_bunkertest();
    } else {
        initlocs_donetsk();
    }
    /#
        if (0) {
            level thread debug_hintadjustmentthink();
        }
        if (getdvarint(@"hash_664ec58759f1617", 0)) {
            level thread debug_bunkerpuzzledebugdraw();
        }
        level thread function_138da425d10b4a04();
    #/
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_885780d268327ba4 = getdvarint(@"hash_4bb3dd5af7368f36", 3);
    generatenumbercode(var_885780d268327ba4, level.bunker_numberstation);
    level thread phonesringing_singlemorse();
    level thread phonesringing_code();
    level thread namespace_cb965d2f71fefddc::registeruniquelootcallback(1, &awardbunker11blueprint);
    /#
        if (0) {
            computerrebootsequence_init();
            redbutton_init();
        }
    #/
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a
// Size: 0x19c
function initvo() {
    level.bunker11vo = [];
    level.bunker11vo["VO_MORSE_0"] = "dx_bra_rubc_bunker_keypad_0_10";
    level.bunker11vo["VO_MORSE_1"] = "dx_bra_rubc_bunker_keypad_1_10";
    level.bunker11vo["VO_MORSE_2"] = "dx_bra_rubc_bunker_keypad_2_10";
    level.bunker11vo["VO_MORSE_3"] = "dx_bra_rubc_bunker_keypad_3_10";
    level.bunker11vo["VO_MORSE_4"] = "dx_bra_rubc_bunker_keypad_4_10";
    level.bunker11vo["VO_MORSE_5"] = "dx_bra_rubc_bunker_keypad_5_10";
    level.bunker11vo["VO_MORSE_6"] = "dx_bra_rubc_bunker_keypad_6_10";
    level.bunker11vo["VO_MORSE_7"] = "dx_bra_rubc_bunker_keypad_7_10";
    level.bunker11vo["VO_MORSE_8"] = "dx_bra_rubc_bunker_keypad_8_10";
    level.bunker11vo["VO_MORSE_9"] = "dx_bra_rubc_bunker_keypad_9_10";
    level.bunker11vo["VO_OK_THATS_GOOD"] = "dx_bra_rubc_bunker_code_correct_10";
    level.bunker11vo["VO_NORTH_SECURE"] = "dx_bra_rubc_bunker_code_correct_20";
    level.bunker11vo["VO_BURN_TEAM_INBOUND"] = "dx_bra_rubc_bunker_code_correct_30";
    level.bunker11vo["VO_BASE_OVERRUN"] = "dx_bra_rubc_bunker_code_phone_10";
    level.bunker11vo["VO_STAND_BY"] = "dx_bra_rubc_bunker_code_phone_20";
    level.bunker11vo["VO_HEAR_THAT"] = "dx_bra_rubc_bunker_code_phone_30";
    level.bunker11vo["VO_LOCK_DOOR"] = "dx_bra_rubc_bunker_code_phone_40";
    level.bunker11vo["VO_NEGATIVE"] = "dx_bra_rubc_bunker_code_incorrect_10";
    level.bunker11vo["VO_WILL_COMPLY"] = "dx_bra_rubc_bunker_code_incorrect_20";
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3d
// Size: 0xac
function initbunker11keypad() {
    door = level.bunker_numberstation.door;
    forward = anglestoforward(door.angles);
    left = anglestoleft(door.angles);
    var_a10ae505a570d67e = door.origin + (0, 0, 45) + forward * 37 + left * 80;
    level.bunker_numberstation.hints["keypad"][0] = spawnscriptable("maphint_keypad_bunker_11", var_a10ae505a570d67e);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff0
// Size: 0x11
function initlocs_donetsk() {
    initlocs_morsephones();
    initlocs_codeprovidingphones();
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1008
// Size: 0x4c3
function initlocs_morsephones() {
    level.bunker_numberstation.hints["phones_morse"] = [];
    level.bunker_numberstation.hints["phones_morse"][0] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][0].origin = (3953, 46915, 1332);
    level.bunker_numberstation.hints["phones_morse"][1] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][1].origin = (23155, -18208, -22);
    level.bunker_numberstation.hints["phones_morse"][2] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][2].origin = (13949, 33510, 1665);
    level.bunker_numberstation.hints["phones_morse"][3] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][3].origin = (35858, 46586, 775);
    level.bunker_numberstation.hints["phones_morse"][3].sound = "br_phone_ring_1";
    level.bunker_numberstation.hints["phones_morse"][4] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][4].origin = (47165, 19980, -160);
    level.bunker_numberstation.hints["phones_morse"][5] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][5].origin = (15038, 16890, 195);
    level.bunker_numberstation.hints["phones_morse"][6] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][6].origin = (-22115, 27122, 1170);
    level.bunker_numberstation.hints["phones_morse"][6].sound = "br_phone_ring_2";
    level.bunker_numberstation.hints["phones_morse"][7] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][7].origin = (-21992, 18882, -330);
    level.bunker_numberstation.hints["phones_morse"][8] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][8].origin = (9911, -12258, -236);
    level.bunker_numberstation.hints["phones_morse"][9] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][9].origin = (-25179, 45438, 155);
    level.bunker_numberstation.hints["phones_morse"][9].sound = "br_phone_ring_2";
    foreach (index, hint in level.bunker_numberstation.hints["phones_morse"]) {
        hint.scriptable = spawnscriptable("maphint_phone_morse_" + index, hint.origin);
        hint.scriptable.ringing = 0;
        if (isdefined(hint.sound)) {
            hint.scriptable.sound = hint.sound;
        }
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d2
// Size: 0x6c3
function initlocs_codeprovidingphones() {
    level.bunker_numberstation.hints["phones_code"] = [];
    level.bunker_numberstation.hints["phones_code"][0] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][0].origin = (-12202, -26944, 20);
    level.bunker_numberstation.hints["phones_code"][1] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][1].origin = (-16380, -19702, -257);
    level.bunker_numberstation.hints["phones_code"][2] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][2].origin = (-28148, -18152, -165);
    level.bunker_numberstation.hints["phones_code"][3] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][3].origin = (19472, -21677, 28);
    level.bunker_numberstation.hints["phones_code"][4] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][4].origin = (21075, -15890, 1690);
    level.bunker_numberstation.hints["phones_code"][5] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][5].origin = (-6430, 1817, -250);
    level.bunker_numberstation.hints["phones_code"][6] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][6].origin = (2448, 29023, 80);
    level.bunker_numberstation.hints["phones_code"][7] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][7].origin = (15510, 18142, 193);
    level.bunker_numberstation.hints["phones_code"][8] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][8].origin = (45105, 16910, -312);
    level.bunker_numberstation.hints["phones_code"][9] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][9].origin = (14565, 36646, 1500);
    level.bunker_numberstation.hints["phones_code"][10] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][10].origin = (-24445, 43755, -118);
    level.bunker_numberstation.hints["phones_code"][10].sound = "br_phone_ring_2";
    level.bunker_numberstation.hints["phones_code"][11] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][11].origin = (-15246, 14332, -25);
    level.bunker_numberstation.hints["phones_code"][12] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][12].origin = (34305, 28940, 838);
    level.bunker_numberstation.hints["phones_code"][13] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][13].origin = (-2836, 57277, 661);
    level.bunker_numberstation.hints["phones_code"][14] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][14].origin = (36572, -29087, -462);
    level.bunker_numberstation.hints["phones_code"][15] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][15].origin = (16505, 2990, -530);
    level.bunker_numberstation.hints["phones_code"][16] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][16].origin = (45714, 1250, 80);
    foreach (hint in level.bunker_numberstation.hints["phones_code"]) {
        hint.scriptable = spawnscriptable("maphint_phone_code", hint.origin);
        hint.scriptable.ringing = 0;
        if (isdefined(hint.sound)) {
            hint.scriptable.sound = hint.sound;
        }
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9c
// Size: 0xb4
function awardbunker11blueprint(player) {
    foreach (teammate in getteamdata(player.team, "players")) {
        if (!isdefined(teammate)) {
            continue;
        }
        teammate namespace_aad14af462a74d08::onunlockitem("blueprint_unlock_584");
        teammate namespace_bd0162aedd8c8594::logevent_challengeitemunlocked(teammate, "blueprint_unlock_584", "blueprint", 584);
        optionalnumber = 0;
        if (optionalnumber > 0) {
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_unlockable_weapon_splash", optionalnumber);
        }
    }
    return 1;
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1c58
// Size: 0x52
function codephonescriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "maphint_phone_code");
    #/
    level thread _codephonescriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb1
// Size: 0x42f
function _codephonescriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        if ((!namespace_4b0406965e556711::gameflag("prematch_done") || !istrue(instance.startingcodephone)) && level.bunker_numberstation.successfulteams.size == 0) {
            playsoundatpos(instance.origin, "br_phone_deny");
            instance setscriptablepartstate("maphint_phone_code", "off");
            wait(3);
            instance setscriptablepartstate("maphint_phone_code", "on");
        } else {
            player namespace_99ac021a7547cae3::function_e636e108dffe6ab7();
            instance setscriptablepartstate("maphint_phone_code", "off");
            while (istrue(instance.ringing)) {
                waitframe();
            }
            instance notify("phone_picked_up");
            if (level.bunker_numberstation.successfulteams.size > 0) {
                playsoundatpos(instance.origin, "br_phone_code_correct");
                wait(1);
                playsoundatpos(instance.origin, level.bunker11vo["VO_NORTH_SECURE"]);
                level thread debug_show2dvotext("North Secure", 1.24);
                wait(1.24);
                playsoundatpos(instance.origin, level.bunker11vo["VO_NORTH_SECURE"]);
                level thread debug_show2dvotext("North Secure", 2);
                wait(2);
                playsoundatpos(instance.origin, level.bunker11vo["VO_OK_THATS_GOOD"]);
                level thread debug_show2dvotext("Ok. That's good.", 2);
                wait(2);
                playsoundatpos(instance.origin, level.bunker11vo["VO_BURN_TEAM_INBOUND"]);
                level thread debug_show2dvotext("Copy. Burn team inbound.", 2);
                wait(2);
                playsoundatpos(instance.origin, "br_phone_code_correct");
                wait(1);
                foreach (number in level.bunker_numberstation.code) {
                    playsoundatpos(instance.origin, level.bunker11vo["VO_MORSE_" + number]);
                    wait(1.5);
                }
                playsoundatpos(instance.origin, "br_phone_code_correct");
            } else {
                wait(1);
                playsoundatpos(instance.origin, level.bunker11vo["VO_BASE_OVERRUN"]);
                level thread debug_show2dvotext("All teams. Base has been overun. Switch to cryptography.", 3);
                wait(3);
                playsoundatpos(instance.origin, level.bunker11vo["VO_STAND_BY"]);
                level thread debug_show2dvotext("Stand By", 2);
                wait(2);
                playsoundatpos(instance.origin, "br_phone_code_correct");
                wait(1);
                foreach (number in level.bunker_numberstation.code) {
                    playsoundatpos(instance.origin, level.bunker11vo["VO_MORSE_" + number]);
                    wait(1.5);
                }
                playsoundatpos(instance.origin, "br_phone_code_correct");
                wait(1);
                playsoundatpos(instance.origin, level.bunker11vo["VO_HEAR_THAT"]);
                level thread debug_show2dvotext("You hear that?", 2);
                wait(2);
                playsoundatpos(instance.origin, level.bunker11vo["VO_LOCK_DOOR"]);
                level thread debug_show2dvotext("Lock the door! They're coming!", 2);
            }
            wait(3);
            instance setscriptablepartstate("maphint_phone_code", "on");
            instance thread ringphoneoccasionally();
        }
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x20e7
// Size: 0x1f9
function phonemorsesinglescriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "maphint_phone_morse_0" || part == "maphint_phone_morse_1" || part == "maphint_phone_morse_2" || part == "maphint_phone_morse_3" || part == "maphint_phone_morse_4" || part == "maphint_phone_morse_5" || part == "maphint_phone_morse_6" || part == "maphint_phone_morse_7" || part == "maphint_phone_morse_8" || part == "maphint_phone_morse_9");
    #/
    switch (part) {
    case #"hash_a45da4772fdfaea5":
        instance.morsenumber = 0;
        break;
    case #"hash_a45da3772fdfad12":
        instance.morsenumber = 1;
        break;
    case #"hash_a45da2772fdfab7f":
        instance.morsenumber = 2;
        break;
    case #"hash_a45da1772fdfa9ec":
        instance.morsenumber = 3;
        break;
    case #"hash_a45da0772fdfa859":
        instance.morsenumber = 4;
        break;
    case #"hash_a45d9f772fdfa6c6":
        instance.morsenumber = 5;
        break;
    case #"hash_a45d9e772fdfa533":
        instance.morsenumber = 6;
        break;
    case #"hash_a45d9d772fdfa3a0":
        instance.morsenumber = 7;
        break;
    case #"hash_a45dac772fdfbb3d":
        instance.morsenumber = 8;
        break;
    case #"hash_a45dab772fdfb9aa":
        instance.morsenumber = 9;
        break;
    default:
        /#
            assertmsg("Trying to use a map hint scriptable for a morse number that isn't supported.");
        #/
        break;
    }
    level thread _phonemorsesinglescriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x22e7
// Size: 0x2cc
function _phonemorsesinglescriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        team = player.team;
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            playsoundatpos(instance.origin, "br_morse_" + instance.morsenumber);
            instance setscriptablepartstate("maphint_phone_morse_" + instance.morsenumber, "off");
            wait(3);
            instance setscriptablepartstate("maphint_phone_morse_" + instance.morsenumber, "on");
        } else {
            player namespace_99ac021a7547cae3::function_e636e108dffe6ab7();
            instance setscriptablepartstate("maphint_phone_morse_" + instance.morsenumber, "off");
            while (istrue(instance.ringing)) {
                waitframe();
            }
            instance notify("phone_picked_up");
            if (level.bunker_numberstation.successfulteams.size > 0) {
                playsoundatpos(instance.origin, "br_phone_code_correct");
                wait(1);
                playsoundatpos(instance.origin, level.bunker11vo["VO_NORTH_SECURE"]);
                level thread debug_show2dvotext("North Secure", 1.24);
                wait(1.24);
                playsoundatpos(instance.origin, level.bunker11vo["VO_NORTH_SECURE"]);
                level thread debug_show2dvotext("North Secure", 2);
                wait(2);
                playsoundatpos(instance.origin, level.bunker11vo["VO_BURN_TEAM_INBOUND"]);
                level thread debug_show2dvotext("Copy. Burn team inbound.", 2);
                wait(2);
            }
            if (!array_contains(level.bunker_numberstation.successfulteams, team)) {
                playsoundatpos(instance.origin, "br_morse_" + instance.morsenumber);
                wait(2);
                if (!array_contains(level.bunker_numberstation.successfulteams, team)) {
                    entercodenumber(level.bunker_numberstation, instance.morsenumber, team);
                    var_b50f7cb6d7639b3a = checkcodeentered(level.bunker_numberstation, team);
                    if (var_b50f7cb6d7639b3a == 1) {
                        level thread correctcodeentered(instance, level.bunker_numberstation, team);
                    } else if (var_b50f7cb6d7639b3a == 0) {
                        level thread incorrectcodeentered(instance, level.bunker_numberstation, team);
                    }
                }
            }
            wait(3);
            instance setscriptablepartstate("maphint_phone_morse_" + instance.morsenumber, "on");
            instance thread ringphoneoccasionally();
        }
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x25ba
// Size: 0x42
function keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2603
// Size: 0x14b
function _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_keypad_bunker_11");
    #/
    if (level.bunker11puzzleactive && (getdvarint(@"hash_2b47e76d55a2b0b2", 0) == 1 || array_contains(level.bunker_numberstation.successfulteams, player.team))) {
        playsoundatpos(instance.origin, "br_keypad_confirm");
        instance setscriptablepartstate("maphint_keypad_bunker_11", "off");
        wait(2.5);
        level thread namespace_ff69a74765774dfd::openbunkerdoor(level.bunker_numberstation.door, 1, "bunker_loot_11", "door_open_puzzle");
        level.bunker_numberstation.bunkeropened = 1;
        level thread activatemusictrigger();
        if (1) {
            computerrebootsequence_init();
            redbutton_init();
        }
    } else {
        playsoundatpos(instance.origin, "br_keypad_deny");
        instance setscriptablepartstate("maphint_keypad_bunker_11", "off");
        wait(3);
        instance setscriptablepartstate("maphint_keypad_bunker_11", "on");
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2755
// Size: 0x88
function activatemusictrigger() {
    forward = anglestoforward(level.bunker_numberstation.door.angles);
    trigger = spawn("trigger_radius", level.bunker_numberstation.door.origin + forward * -128, 0, 128, 128);
    level thread musictriggerthink(trigger);
    wait(120);
    trigger notify("endMusicTrigger");
    trigger delete();
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27e4
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

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2866
// Size: 0x178
function phonesringing_code() {
    var_e2c22b9bab4c4908 = getdvarint(@"hash_9f70d8030533cf20", 50);
    var_e40f74266c39d166 = max(1, level.bunker_numberstation.hints["phones_code"].size * var_e2c22b9bab4c4908 * 0.01);
    level.bunker_numberstation.hints["phones_code"] = array_randomize(level.bunker_numberstation.hints["phones_code"]);
    var_f557519e38cbe212 = [];
    for (i = 0; i < int(var_e40f74266c39d166); i++) {
        var_f557519e38cbe212[var_f557519e38cbe212.size] = level.bunker_numberstation.hints["phones_code"][i];
    }
    foreach (var_ca8ba7c130852fcc in var_f557519e38cbe212) {
        var_ca8ba7c130852fcc.scriptable.startingcodephone = 1;
        var_ca8ba7c130852fcc.scriptable thread ringcodephoneconstantly();
        var_ca8ba7c130852fcc.scriptable setscriptablepartstate("maphint_phone_code", "on");
    }
    level.bunker_numberstation.chosencodephones = var_f557519e38cbe212;
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29e5
// Size: 0x73
function phonesringing_singlemorse() {
    foreach (var_ca8ba7c130852fcc in level.bunker_numberstation.hints["phones_morse"]) {
        var_ca8ba7c130852fcc.scriptable thread ringphoneoccasionally();
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5f
// Size: 0xb0
function codephonescodeenteredringingfrenzy() {
    level thread tracktimeringingfrenzy();
    foreach (var_ca8ba7c130852fcc in level.bunker_numberstation.hints["phones_code"]) {
        if (!istrue(var_ca8ba7c130852fcc.scriptable.startingcodephone)) {
            var_ca8ba7c130852fcc.scriptable thread ringcodephoneconstantly();
            var_ca8ba7c130852fcc.scriptable setscriptablepartstate("maphint_phone_code", "on");
        }
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b16
// Size: 0xd3
function ringphoneoccasionally() {
    self endon("phone_picked_up");
    wait(randomintrange(30, 55));
    while (!istrue(level.bunker_numberstation.bunkeropened)) {
        for (i = 0; i < 4; i++) {
            self.ringing = 1;
            if (1) {
                if (isdefined(self.sound)) {
                    playsoundatpos(self.origin, self.sound);
                } else {
                    playsoundatpos(self.origin, "br_phone_ring");
                }
            }
            if (0) {
                thread namespace_d028276791d9cff6::drawsphere(self.origin, 32, 3, (0, 1, 0));
            }
            wait(3);
            self.ringing = 0;
            wait(3);
        }
        wait(randomintrange(30, 55));
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf0
// Size: 0x9d
function ringcodephoneconstantly() {
    self endon("phone_picked_up");
    while (!namespace_4b0406965e556711::gameflag("stop_phone_code_ringing")) {
        self.ringing = 1;
        if (1) {
            if (isdefined(self.sound)) {
                playsoundatpos(self.origin, self.sound);
            } else {
                playsoundatpos(self.origin, "br_phone_ring");
            }
        }
        if (0) {
            thread namespace_d028276791d9cff6::drawsphere(self.origin, 32, 3, (1, 0, 0));
        }
        wait(3);
        self.ringing = 0;
        wait(3);
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c94
// Size: 0x12
function tracktimeringingfrenzy() {
    wait(120);
    namespace_4b0406965e556711::gameflagset("stop_phone_code_ringing");
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cad
// Size: 0x15c
function computerrebootsequence_init() {
    level.serverroomtvs = getstructarray("bunker11_serverTV", "targetname");
    level.warroomtvs = getstructarray("bunker11_warroomTV", "targetname");
    var_15e3f6188a142829 = getstructarray("bunker11_serverroom_computer", "targetname");
    spawnscriptable("maphint_computer_reboot", var_15e3f6188a142829[0].origin);
    foreach (index, var_cdde3f78f5298eab in level.serverroomtvs) {
        level.serverroomtvs[index].scriptable = spawnscriptable("bunker11_serverroom_monitor", var_cdde3f78f5298eab.origin, var_cdde3f78f5298eab.angles);
    }
    foreach (index, var_cdde3f78f5298eab in level.warroomtvs) {
        level.warroomtvs[index].scriptable = spawnscriptable("bunker11_warroom_monitor", var_cdde3f78f5298eab.origin, var_cdde3f78f5298eab.angles);
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2e10
// Size: 0x3f
function computerrebootused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _computerrebootsequence_start(instance, player);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e56
// Size: 0x20f
function _computerrebootsequence_start(instance, player) {
    instance setscriptablepartstate("maphint_computer_reboot", "off");
    playsoundatpos(instance.origin, "emt_bunk_pc_keyboard_typing");
    wait(3);
    playsoundatpos(instance.origin, "emt_bunk_pc_reboot");
    foreach (var_cdde3f78f5298eab in level.serverroomtvs) {
        var_cdde3f78f5298eab.scriptable setscriptablepartstate("bunker11_serverroom_monitor", "rebooting");
    }
    foreach (var_cdde3f78f5298eab in level.warroomtvs) {
        var_cdde3f78f5298eab.scriptable setscriptablepartstate("bunker11_warroom_monitor", "rebooting");
        wait(randomfloatrange(0.3, 0.6));
    }
    wait(3);
    foreach (var_cdde3f78f5298eab in level.serverroomtvs) {
        var_cdde3f78f5298eab.scriptable setscriptablepartstate("bunker11_serverroom_monitor", "ready");
        wait(randomfloatrange(0.3, 0.6));
    }
    foreach (var_cdde3f78f5298eab in level.warroomtvs) {
        var_cdde3f78f5298eab.scriptable setscriptablepartstate("bunker11_warroom_monitor", "countdown");
    }
    instance setscriptablepartstate("maphint_computer_reboot", "on");
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x306c
// Size: 0x1b0
function redbutton_init() {
    var_7538c6a3c6d4044 = getstructarray("bunker11_red_button", "targetname");
    level.bunker11_mistswindow = getstructarray("bunker11_cleanroom_window", "targetname");
    level.bunker11_mistsdoors = getstructarray("bunker11_cleanroom_door", "targetname");
    spawnscriptable("maphint_red_button", var_7538c6a3c6d4044[0].origin);
    foreach (index, window in level.bunker11_mistswindow) {
        angles = (0, 0, 0);
        if (isdefined(window.angles)) {
            angles = window.angles;
        }
        level.bunker11_mistswindow[index].scriptable = spawnscriptable("bunker11_cleanroom_mist", window.origin, angles);
    }
    foreach (index, door in level.bunker11_mistsdoors) {
        angles = (0, 0, 0);
        if (isdefined(door.angles)) {
            angles = door.angles;
        }
        level.bunker11_mistsdoors[index].scriptable = spawnscriptable("bunker11_cleanroom_mist_door", door.origin, angles);
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3223
// Size: 0x3f
function redbuttonused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _redbuttonused_internal(instance, player);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3269
// Size: 0x121
function _redbuttonused_internal(instance, player) {
    instance setscriptablepartstate("maphint_red_button", "off");
    playsoundatpos(instance.origin, "emt_bunk_red_button_press");
    foreach (window in level.bunker11_mistswindow) {
        window.scriptable setscriptablepartstate("bunker11_cleanroom_mist", "off");
    }
    foreach (door in level.bunker11_mistsdoors) {
        door.scriptable setscriptablepartstate("bunker11_cleanroom_mist_door", "off");
    }
    wait(5);
    instance setscriptablepartstate("maphint_red_button", "on");
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3391
// Size: 0x35
function generatenumbercode(var_885780d268327ba4, var_48b11326257052f1) {
    namespace_ff69a74765774dfd::generatenumbercode_array(var_885780d268327ba4, var_48b11326257052f1);
    if (0) {
        level thread printcodechosen(var_48b11326257052f1);
        level thread printcodeentered(var_48b11326257052f1);
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x33cd
// Size: 0x5a
function entercodenumber(var_48b11326257052f1, number, team) {
    if (!isdefined(var_48b11326257052f1.codeentered[team])) {
        var_48b11326257052f1.codeentered[team] = [];
    }
    var_48b11326257052f1.codeentered[team][var_48b11326257052f1.codeentered[team].size] = number;
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x342e
// Size: 0x7c
function checkcodeentered(var_48b11326257052f1, team) {
    if (var_48b11326257052f1.codeentered[team].size < var_48b11326257052f1.code.size) {
        return -1;
    }
    for (i = 0; i < var_48b11326257052f1.code.size; i++) {
        if (var_48b11326257052f1.code[i] != var_48b11326257052f1.codeentered[team][i]) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34b2
// Size: 0x1c0
function correctcodeentered(instance, var_48b11326257052f1, team) {
    if (0) {
        level thread showdebugresult("Correct Code Entered!");
    }
    if (var_48b11326257052f1.successfulteams.size == 0) {
        level.bunker_numberstation.door.lightscriptable setscriptablepartstate("bunker_active_indicator_light", "active");
    }
    var_48b11326257052f1.successfulteams[var_48b11326257052f1.successfulteams.size] = team;
    playsoundatpos(instance.origin, "br_phone_code_correct");
    wait(1);
    playsoundatpos(instance.origin, level.bunker11vo["VO_OK_THATS_GOOD"]);
    level thread debug_show2dvotext("Ok. That's good.", 2);
    wait(2);
    playsoundatpos(instance.origin, level.bunker11vo["VO_NORTH_SECURE"]);
    level thread debug_show2dvotext("North Secure", 1.1);
    wait(1.1);
    playsoundatpos(instance.origin, level.bunker11vo["VO_NORTH_SECURE"]);
    level thread debug_show2dvotext("North Secure", 2);
    wait(2);
    playsoundatpos(instance.origin, "br_phone_code_correct");
    wait(1);
    playsoundatpos(instance.origin, level.bunker11vo["VO_BURN_TEAM_INBOUND"]);
    level thread debug_show2dvotext("Copy. Burn team inbound.", 2);
    wait(2);
    if (!level.bunker_numberstation.codecorrectlyenteredbyanyone) {
        codephonescodeenteredringingfrenzy();
    } else {
        level.bunker_numberstation.codecorrectlyenteredbyanyone = 1;
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3679
// Size: 0xf6
function incorrectcodeentered(instance, var_48b11326257052f1, team) {
    var_48b11326257052f1.codeentered[team] = undefined;
    if (0) {
        level thread showdebugresult("ERROR: Wrong Code Entered!");
    }
    playsoundatpos(instance.origin, "br_phone_code_incorrect");
    wait(1);
    playsoundatpos(instance.origin, level.bunker11vo["VO_NEGATIVE"]);
    level thread debug_show2dvotext("Negative", 1.24);
    wait(1.24);
    playsoundatpos(instance.origin, level.bunker11vo["VO_NEGATIVE"]);
    level thread debug_show2dvotext("Negative", 1.5);
    wait(1.5);
    playsoundatpos(instance.origin, level.bunker11vo["VO_WILL_COMPLY"]);
    level thread debug_show2dvotext("Copy. Will comply.", 2);
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3776
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

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37c8
// Size: 0x106
function printcodechosen(var_48b11326257052f1) {
    level notify("endChosenCodeDebugPrint");
    level endon("endChosenCodeDebugPrint");
    var_dd1003ea8b91bb85 = 10;
    while (1) {
        /#
            printtoscreen2d(500, 400, "dx_bra_rubc_bunker_keypad_3_10", (1, 1, 1), 1);
        #/
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            /#
                printtoscreen2d(600, 400, "dx_bra_rubc_bunker_code_correct_10", (1, 1, 1), 1);
            #/
        } else {
            foreach (i, number in var_48b11326257052f1.code) {
                /#
                    printtoscreen2d(600 + var_dd1003ea8b91bb85 * i, 400, var_48b11326257052f1.code[i], (1, 1, 1), 1);
                #/
            }
        }
        waitframe();
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38d5
// Size: 0x191
function printcodeentered(var_48b11326257052f1) {
    level notify("endEnterdCodeDebugPrint");
    level endon("endEnterdCodeDebugPrint");
    var_dd1003ea8b91bb85 = 10;
    var_270767e7723efd31 = 30;
    while (1) {
        teamindex = 0;
        foreach (team, var_b62477949575453b in var_48b11326257052f1.codeentered) {
            /#
                printtoscreen2d(500, 430 + teamindex * var_270767e7723efd31, team + "on", (1, 1, 1), 1);
            #/
            if (!array_contains(var_48b11326257052f1.successfulteams, team)) {
                foreach (i, number in var_48b11326257052f1.codeentered[team]) {
                    /#
                        printtoscreen2d(700 + var_dd1003ea8b91bb85 * i, 430 + teamindex * var_270767e7723efd31, var_48b11326257052f1.codeentered[team][i], (1, 1, 1), 1);
                    #/
                }
            } else {
                /#
                    printtoscreen2d(700, 430 + teamindex * var_270767e7723efd31, "ERROR: Wrong Code Entered!", (1, 1, 1), 1);
                #/
            }
            teamindex++;
        }
        waitframe();
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6d
// Size: 0x563
function initlocs_bunkertest() {
    wait(5);
    level.bunker_numberstation.hints["phones_code"] = [];
    level.bunker_numberstation.hints["phones_code"][0] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][0].origin = (2673, -2032, 322);
    level.bunker_numberstation.hints["phones_code"][1] = spawnstruct();
    level.bunker_numberstation.hints["phones_code"][1].origin = (1551, -2032, 322);
    foreach (hint in level.bunker_numberstation.hints["phones_code"]) {
        hint.scriptable = spawnscriptable("maphint_phone_code", hint.origin);
        hint.scriptable.ringing = 0;
    }
    level.bunker_numberstation.hints["phones_morse"] = [];
    level.bunker_numberstation.hints["phones_morse"][0] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][0].origin = (2740, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][1] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][1].origin = (2620, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][2] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][2].origin = (2500, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][3] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][3].origin = (2360, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][4] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][4].origin = (2244, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][5] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][5].origin = (2115, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][6] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][6].origin = (1980, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][7] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][7].origin = (1850, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][8] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][8].origin = (1724, -2239, 300);
    level.bunker_numberstation.hints["phones_morse"][9] = spawnstruct();
    level.bunker_numberstation.hints["phones_morse"][9].origin = (1600, -2239, 300);
    foreach (index, hint in level.bunker_numberstation.hints["phones_morse"]) {
        hint.scriptable = spawnscriptable("maphint_phone_morse_" + index, hint.origin);
        hint.scriptable.ringing = 0;
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd7
// Size: 0x104
function debug_hintadjustmentthink() {
    while (1) {
        foreach (hint in level.bunker_numberstation.hints["phones_code"]) {
            hint.scriptable freescriptable();
        }
        foreach (hint in level.bunker_numberstation.hints["phones_morse"]) {
            hint.scriptable freescriptable();
        }
        if (level.mapname == "mp_bm_bunker01") {
            initlocs_bunkertest();
        } else {
            initlocs_donetsk();
        }
        wait(1);
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40e2
// Size: 0x1b7
function debug_bunkerpuzzledebugdraw() {
    level endon("endBunkerPhoneLocDraw");
    while (1) {
        foreach (hint in level.bunker_numberstation.hints["phones_code"]) {
            thread namespace_d028276791d9cff6::drawsphere(hint.scriptable.origin, 256, 1, (0, 1, 0));
        }
        foreach (hint in level.bunker_numberstation.hints["phones_morse"]) {
            thread namespace_d028276791d9cff6::drawsphere(hint.scriptable.origin, 256, 1, (1, 0, 0));
        }
        if (isdefined(level.bunker_numberstation.chosencodephones)) {
            foreach (hint in level.bunker_numberstation.chosencodephones) {
                thread namespace_d028276791d9cff6::drawsphere(hint.scriptable.origin, 128, 1, (0, 0, 1));
            }
        }
        wait(1);
    }
}

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42a0
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

// Namespace namespace_d9f38e6b6f406a1f/namespace_18de1d3c518da272
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4308
// Size: 0x86
function function_138da425d10b4a04() {
    /#
        while (1) {
            if (getdvarint(@"hash_664ec58759f1617", 0) == 1) {
                level thread debug_bunkerpuzzledebugdraw();
            } else {
                level notify("<unknown string>");
            }
            if (getdvarint(@"hash_4e1e0a899a9ac76c", 0) == 1) {
                level thread printcodechosen(level.bunker_numberstation);
                level thread printcodeentered(level.bunker_numberstation);
            } else {
                level notify("<unknown string>");
                level notify("<unknown string>");
            }
            wait(1);
        }
    #/
}

