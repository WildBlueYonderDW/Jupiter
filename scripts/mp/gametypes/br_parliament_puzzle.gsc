// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_d53a3a4240752622;

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62e
// Size: 0x94
function init() {
    level.var_4556e51a733145b4 = getdvarint(@"hash_4f4f4598b9cfcbcd", 1);
    level.parliament_puzzle = spawnstruct();
    if (level.var_4556e51a733145b4) {
        level.parliament_puzzle.hints = [];
        level.parliament_puzzle.var_66647dab4ad2648b = [];
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_computer", &codecomputerscriptableused);
    }
    level._effect["vfx_br_traproom_vent_gas_1"] = loadfx("vfx/iw8_br/gameplay/subway/vfx_br_traproom_vent_gas_1.vfx");
    level thread initpostmain();
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c9
// Size: 0x47
function initpostmain() {
    waittillframeend();
    level thread function_7a416269c3c3336();
    if (!level.var_4556e51a733145b4) {
        return;
    }
    /#
    #/
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!istrue(level.parliament_puzzle.var_7525ccc097f6ef8d)) {
        function_1f4fe3d56a5be372();
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x717
// Size: 0x62
function codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "maphint_computer");
    #/
    if (!isdefined(instance.var_9c3bc381e6121293)) {
        return;
    }
    level thread _codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x780
// Size: 0x22f
function _codecomputerscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        if (!namespace_4b0406965e556711::gameflag("prematch_done") || !istrue(level.parliament_puzzle.var_2c1beb232def3373)) {
            playsoundatpos(instance.origin, "br_computer_deny");
            instance setscriptablepartstate("maphint_computer", "off");
            wait(3);
            instance setscriptablepartstate("maphint_computer", "on");
        } else {
            player namespace_99ac021a7547cae3::playerhasmoved();
            instance setscriptablepartstate("maphint_computer", "off");
            playsoundatpos(instance.origin, "stadium_computer_code_start");
            wait(2);
            foreach (var_5d8b57cc867a9f80 in level.parliament_puzzle.pattern) {
                if (!isdefined(player) || !isalive(player)) {
                    break;
                }
                instance.var_d408a87ac65916ae setscriptablepartstate("parliament_code_computer", var_5d8b57cc867a9f80);
                playsoundatpos(instance.origin, "stadium_computer_code_number");
                wait(1);
            }
            if (isdefined(player) && isalive(player)) {
                namespace_ff69a74765774dfd::keypadscriptableused(level.parliament_puzzle.hints["escaperoom_terminal_keypad"].scriptable, "maphint_stadium_keypad", "on", player);
                instance.var_d408a87ac65916ae setscriptablepartstate("parliament_code_computer", "keypad");
                player waittill_any_return_3("doneWithKeypad", "keypad_kickPlayerFromKeypadMSG");
            }
            instance.var_b50f67b6d7636d0b = 1;
            playsoundatpos(instance.origin, "stadium_computer_code_end");
            wait(3);
            instance.var_d408a87ac65916ae setscriptablepartstate("parliament_code_computer", "intro");
            instance setscriptablepartstate("maphint_computer", "on");
        }
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b6
// Size: 0x38
function function_9fdadb62b1bdf018(instance) {
    playsoundatpos(instance.origin, "br_phone_code_correct");
    instance.var_b50f7cb6d7639b3a = 2;
    namespace_ff69a74765774dfd::unlockscriptabledoors(instance);
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f5
// Size: 0x197
function function_7a416269c3c3336() {
    locs = getstructarray("placard_holmes", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["holmes"] = locs;
    locs = getstructarray("placard_whitehouse", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["whitehouse"] = locs;
    locs = getstructarray("placard_blackhouse", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["blackhouse"] = locs;
    locs = getstructarray("placard_daryl", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["daryl"] = locs;
    locs = getstructarray("placard_horse", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["horse"] = locs;
    locs = getstructarray("placard_tinyhouse", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["tinyhouse"] = locs;
    locs = getstructarray("placard_franz", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["jolyon"] = locs;
    locs = getstructarray("placard_missing", "targetname");
    level.parliament_puzzle.var_66647dab4ad2648b["blank"] = locs;
    level.parliament_puzzle.var_903c5ef5126c054f = getent("parliament_interior_trigger", "targetname");
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb93
// Size: 0x9c
function function_62d0219553b4dec() {
    locs = getstructarray("secret_subway_serverTV", "targetname");
    level.parliament_puzzle.var_aa165caba5290eee["secret_subway_serverTV"] = locs;
    loc = getstruct("secret_subway_layover_computer", "targetname");
    level.parliament_puzzle.var_aa165caba5290eee["secret_subway_layover_computer"] = loc;
    loc = getstruct("secret_subway_departure_computer", "targetname");
    level.parliament_puzzle.var_aa165caba5290eee["secret_subway_departure_computer"] = loc;
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc36
// Size: 0x3e0
function function_1f4fe3d56a5be372() {
    doornode = getstruct("parliament_door", "targetname");
    doors = getentitylessscriptablearray(doornode.target, "targetname");
    loc = getstruct("maphint_keypad_escaperoom_lock", "targetname");
    loc.scriptable = spawnscriptable("maphint_stadium_keypad", loc.origin);
    loc.scriptable.name = "escaperoom_start_keypad";
    loc.scriptable.code = [];
    loc.scriptable.code["string"] = "2179";
    loc.scriptable.code["array"] = [0:2, 1:1, 2:7, 3:9];
    loc.scriptable.var_885780d268327ba4 = 4;
    loc.scriptable.successfunction = &function_a7da6dae9b8ca5ea;
    loc.scriptable.doors = doors;
    level.parliament_puzzle.hints["escaperoom_start_keypad"] = loc;
    loc = spawnstruct();
    loc.scriptable = spawnscriptable("maphint_stadium_keypad", level.parliament_puzzle.hints["escaperoom_start_keypad"].origin);
    loc.scriptable.name = "escaperoom_terminal_keypad";
    loc.scriptable.code = [];
    loc.scriptable.code["string"] = "2179";
    loc.scriptable.code["array"] = [0:2, 1:1, 2:7, 3:9];
    loc.scriptable.var_885780d268327ba4 = 4;
    loc.scriptable.successfunction = &function_7df49f51f4834135;
    loc.scriptable.doors = doors;
    level.parliament_puzzle.hints["escaperoom_terminal_keypad"] = loc;
    loc = getstruct("maphint_parliament_terminal", "targetname");
    loc.scriptable = spawnscriptable("maphint_computer", loc.origin, loc.angles);
    loc.scriptable.var_9c3bc381e6121293 = 1;
    loc.scriptable.keypad = level.parliament_puzzle.hints["escaperoom_terminal_keypad"].scriptable;
    loc.scriptable.var_b50f7cb6d7639b3a = 1;
    var_b557ddc2be0781fd = getstruct("parliament_terminal_monitor", "targetname");
    loc.scriptable.var_d408a87ac65916ae = spawnscriptable("parliament_code_computer", var_b557ddc2be0781fd.origin, var_b557ddc2be0781fd.angles);
    level.parliament_puzzle.hints["maphint_parliament_terminal"] = loc;
    if (1) {
        level thread computer_debugtestloop(loc.scriptable.var_d408a87ac65916ae);
    }
    level.parliament_puzzle.var_7525ccc097f6ef8d = 1;
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x101d
// Size: 0x102
function function_a7da6dae9b8ca5ea(instance) {
    level.parliament_puzzle.var_2c1beb232def3373 = 1;
    namespace_ff69a74765774dfd::closescriptabledoors(instance, 1);
    level.parliament_puzzle.var_3e9fedfea8104a09 = [];
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player) && player istouching(level.parliament_puzzle.var_903c5ef5126c054f)) {
            level.parliament_puzzle.var_3e9fedfea8104a09[level.parliament_puzzle.var_3e9fedfea8104a09.size] = player;
        }
    }
    function_22859c35105eab3();
    function_9fdce6fd13b04c1c();
    function_eed67c3b87d257f1();
    level thread function_fba005deace9b861();
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1126
// Size: 0xf7
function function_fba005deace9b861() {
    level endon("parliament_puzzle_solved");
    var_bd72523ee36f951e = getdvarint(@"hash_b881f9d1b1278f0f", 90);
    namespace_3c37cb17ade254d::exploder("gas_stage_1");
    wait(var_bd72523ee36f951e);
    namespace_3c37cb17ade254d::stop_exploder("gas_stage_1");
    namespace_3c37cb17ade254d::exploder("gas_stage_2");
    level thread function_be4056effad83342();
    while (level.parliament_puzzle.var_3e9fedfea8104a09.size > 0) {
        wait(1);
    }
    namespace_3c37cb17ade254d::stop_exploder("gas_stage_2");
    level notify("endParliamentGasDamageTick");
    level.parliament_puzzle.var_2c1beb232def3373 = 0;
    namespace_ff69a74765774dfd::unlockscriptabledoors(level.parliament_puzzle.hints["escaperoom_start_keypad"].scriptable);
    namespace_ff69a74765774dfd::openscriptabledoors(level.parliament_puzzle.hints["escaperoom_start_keypad"].scriptable);
    function_a2afc477c3ec9c61();
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1224
// Size: 0xe3
function function_7df49f51f4834135(instance) {
    level notify("parliament_puzzle_solved");
    level notify("endParliamentGasDamageTick");
    level.parliament_puzzle.var_2c1beb232def3373 = 0;
    if (!isdefined(level.parliament_puzzle.var_a7e7b4170e816665)) {
        level.parliament_puzzle.var_a7e7b4170e816665 = [];
    }
    level.parliament_puzzle.var_a7e7b4170e816665[level.parliament_puzzle.var_a7e7b4170e816665.size] = self.team;
    namespace_ff69a74765774dfd::unlockscriptabledoors(level.parliament_puzzle.hints["escaperoom_start_keypad"].scriptable);
    namespace_ff69a74765774dfd::openscriptabledoors(level.parliament_puzzle.hints["escaperoom_start_keypad"].scriptable);
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130e
// Size: 0x2b3
function function_eed67c3b87d257f1() {
    foreach (key, var_de9f8f62eb8bb154 in level.parliament_puzzle.var_e9b051b4a987405f) {
        foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b[key]) {
            angles = undefined;
            if (key == "blank") {
                angles = (360, 359.999, -8.79989);
            } else {
                angles = loc.angles + (0, 180, 0);
            }
            if (!isdefined(loc.scriptable)) {
                loc.scriptable = spawnscriptable("parliament_placard", loc.origin, angles);
            }
            loc.scriptable setscriptablepartstate("parliament_placard", var_de9f8f62eb8bb154);
        }
    }
    var_2813847c63a770e9 = getarraykeys(level.parliament_puzzle.var_e9b051b4a987405f);
    var_6e634c3a5020c0a6 = getarraykeys(level.parliament_puzzle.var_66647dab4ad2648b);
    foreach (key in var_6e634c3a5020c0a6) {
        if (!array_contains(var_2813847c63a770e9, key)) {
            foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b[key]) {
                angles = undefined;
                if (key == "blank") {
                    angles = (360, 359.999, -8.79989);
                } else {
                    angles = loc.angles + (0, 180, 0);
                }
                if (!isdefined(loc.scriptable)) {
                    loc.scriptable = spawnscriptable("parliament_placard", loc.origin, angles);
                }
                loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
            }
        }
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c8
// Size: 0xba
function function_a2afc477c3ec9c61() {
    foreach (var_71f68a71a1c9346d in level.parliament_puzzle.var_66647dab4ad2648b) {
        foreach (loc in var_71f68a71a1c9346d) {
            loc.scriptable setscriptablepartstate("parliament_placard", "blank");
        }
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1689
// Size: 0x27c
function function_22859c35105eab3() {
    var_2b32d871f51c34f1 = level.parliament_puzzle.hints["escaperoom_terminal_keypad"].scriptable;
    var_2b32d871f51c34f1.code = [];
    var_2b32d871f51c34f1.code["number_part"] = [];
    var_2b32d871f51c34f1.code["string"] = "";
    var_48cdf3767789993 = [0:2, 1:3, 2:4, 3:5, 4:7];
    var_48cdf3767789993 = array_randomize(var_48cdf3767789993);
    var_eb002df09b83b915 = [];
    for (i = 0; i < 4; i++) {
        var_eb002df09b83b915[i] = var_48cdf3767789993[i];
    }
    var_2b32d871f51c34f1.code["player_facing"] = var_eb002df09b83b915;
    foreach (number in var_eb002df09b83b915) {
        var_2b32d871f51c34f1.code["number_part"][var_2b32d871f51c34f1.code["number_part"].size] = "top" + number;
    }
    foreach (number in var_eb002df09b83b915) {
        var_2b32d871f51c34f1.code["number_part"][var_2b32d871f51c34f1.code["number_part"].size] = "bottom" + number;
    }
    var_2b32d871f51c34f1.code["array"] = function_2350e7d1796e79c8(var_2b32d871f51c34f1.code);
    foreach (num in var_2b32d871f51c34f1.code["array"]) {
        var_e30ee4ae67d05d90 = "" + num;
        var_2b32d871f51c34f1.code["string"] = var_2b32d871f51c34f1.code["string"] + var_e30ee4ae67d05d90;
    }
    var_2b32d871f51c34f1.successfunction = &function_9fdadb62b1bdf018;
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x190c
// Size: 0x1aa
function function_2350e7d1796e79c8(var_eb002df09b83b915) {
    level.parliament_puzzle.var_544a7dbc681bbe86 = [];
    level.parliament_puzzle.var_544a7dbc681bbe86["top2"] = 1;
    level.parliament_puzzle.var_544a7dbc681bbe86["bottom2"] = 2;
    level.parliament_puzzle.var_544a7dbc681bbe86["top3"] = 3;
    level.parliament_puzzle.var_544a7dbc681bbe86["bottom3"] = 4;
    level.parliament_puzzle.var_544a7dbc681bbe86["top4"] = 5;
    level.parliament_puzzle.var_544a7dbc681bbe86["bottom4"] = 6;
    level.parliament_puzzle.var_544a7dbc681bbe86["top5"] = 7;
    level.parliament_puzzle.var_544a7dbc681bbe86["bottom5"] = 8;
    level.parliament_puzzle.var_544a7dbc681bbe86["top7"] = 9;
    level.parliament_puzzle.var_544a7dbc681bbe86["bottom7"] = 0;
    var_36bdb0fe15a777b1 = [];
    foreach (key in var_eb002df09b83b915["number_part"]) {
        var_36bdb0fe15a777b1[var_36bdb0fe15a777b1.size] = level.parliament_puzzle.var_544a7dbc681bbe86[key];
    }
    return var_36bdb0fe15a777b1;
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1abe
// Size: 0x239
function function_9fdce6fd13b04c1c() {
    var_2b32d871f51c34f1 = level.parliament_puzzle.hints["escaperoom_terminal_keypad"].scriptable;
    level.parliament_puzzle.pattern = [];
    level.parliament_puzzle.var_e9b051b4a987405f = [];
    var_ee317dc6506cde30 = array_randomize(getarraykeys(level.parliament_puzzle.var_66647dab4ad2648b));
    foreach (number in var_2b32d871f51c34f1.code["player_facing"]) {
        level.parliament_puzzle.pattern[level.parliament_puzzle.pattern.size] = var_ee317dc6506cde30[0];
        var_882c98cb9757bcc = ter_op(number - 3 < 1, 1, number - 3);
        var_fb7961c7e608edae = ter_op(number + 3 > 10, 10, number + 3);
        var_650142a1b7f8ca7 = randomintrange(var_882c98cb9757bcc, var_fb7961c7e608edae);
        level.parliament_puzzle.var_e9b051b4a987405f[var_ee317dc6506cde30[0]] = "num" + var_650142a1b7f8ca7;
        offset = number - var_650142a1b7f8ca7;
        if (offset < 0) {
            level.parliament_puzzle.pattern[level.parliament_puzzle.pattern.size] = "minus" + int(abs(offset));
        } else if (offset > 0) {
            level.parliament_puzzle.pattern[level.parliament_puzzle.pattern.size] = "add" + offset;
        }
        level.parliament_puzzle.pattern[level.parliament_puzzle.pattern.size] = "stop";
        var_ee317dc6506cde30 = array_remove(var_ee317dc6506cde30, var_ee317dc6506cde30[0]);
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cfe
// Size: 0x153
function function_be4056effad83342() {
    level endon("game_ended");
    level endon("endParliamentGasDamageTick");
    while (1) {
        damagetick = 9;
        foreach (player in level.parliament_puzzle.var_3e9fedfea8104a09) {
            if (!isdefined(player) || !isdefined(player.origin) || !isalive(player)) {
                level.parliament_puzzle.var_3e9fedfea8104a09 = array_remove(level.parliament_puzzle.var_3e9fedfea8104a09, player);
            } else if (namespace_9c6cddd872ad75f7::hasgasmask(player)) {
                player namespace_cb965d2f71fefddc::function_cdf7f2f6bd3207("parliament_puzzle");
                player namespace_9c6cddd872ad75f7::processdamage(damagetick);
            } else {
                if (isdefined(level.modifybrgasdamage)) {
                    damagetick = player [[ level.modifybrgasdamage ]](damagetick);
                }
                if (player namespace_a2f809133c566621::isjuggernaut()) {
                    damagetick = namespace_cf880efca02c6010::modifybrgasdamage(damagetick);
                }
                player dodamage(damagetick, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
                player namespace_f8d3520d3483c1::damagearmor(damagetick);
                player namespace_c5622898120e827f::tryplaycoughaudio();
            }
        }
        wait(1);
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e58
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

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eaa
// Size: 0xfd
function debug_printcode(var_48b11326257052f1) {
    level notify("endStadiumCodeDebugPrint");
    level endon("endStadiumCodeDebugPrint");
    var_dd1003ea8b91bb85 = 10;
    while (1) {
        /#
            printtoscreen2d(500, 100, "horse", (1, 1, 1), 1);
        #/
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            /#
                printtoscreen2d(600, 100, "number_part", (1, 1, 1), 1);
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

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fae
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

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x213d
// Size: 0x17c
function computer_debugtestloop(scriptable) {
    while (1) {
        scriptable setscriptablepartstate("parliament_code_computer", "intro");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "blackhouse");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "blank");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "daryl");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "holmes");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "horse");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "jolyon");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "tinyhouse");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "whitehouse");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "keypad");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "overauthorized");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "add1");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "add2");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "add3");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "minus1");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "minus2");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "minus3");
        wait(1);
        scriptable setscriptablepartstate("parliament_code_computer", "stop");
        wait(1);
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22c0
// Size: 0x60
function debug_show2dvotext(text, time) {
    if (0) {
        return;
    }
    curtime = 0;
    while (curtime < time) {
        /#
            printtoscreen2d(500, 350, "brloot_offhand_advancedsupplydrop" + text, (1, 1, 1), 1.5);
        #/
        waitframe();
        curtime = curtime + 0.05;
    }
}

// Namespace namespace_d53a3a4240752622/namespace_5d8dc7adfd187b11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2327
// Size: 0x58a
function function_ecf6f13ab4edf73e() {
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["holmes"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles + (0, 180, 0));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["whitehouse"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles + (0, 180, 0));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["blackhouse"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles + (0, 180, 0));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["daryl"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles);
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["horse"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles + (0, 180, 0));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["tinyhouse"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles + (0, 180, 0));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["jolyon"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, loc.angles + (0, 180, 0));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
    foreach (loc in level.parliament_puzzle.var_66647dab4ad2648b["blank"]) {
        loc.scriptable = spawnscriptable("parliament_placard", loc.origin, (360, 359.999, -8.79989));
        loc.scriptable setscriptablepartstate("parliament_placard", "num" + randomintrange(1, 10));
    }
}

