// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_keypad_util.gsc;
#using scripts\engine\scriptable.gsc;
#using script_3bf3f0172d4a2247;

#namespace vault_door;

// Namespace vault_door/namespace_a203e146814baef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x468
// Size: 0x22
function init() {
    initbunkervfx();
    function_2fcaee708b41d832();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_keypad_bunker_interior", &keypadscriptableused);
}

// Namespace vault_door/namespace_a203e146814baef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x491
// Size: 0x9f
function initbunkervfx() {
    level._effect["vfx_br_bunker_open"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_open.vfx");
    level._effect["vfx_br_bunker_open_2"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_open_2.vfx");
    level._effect["vfx_br_bunker_open_puzzle"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_open_puzzle.vfx");
    level._effect["vfx_br_bulb_vault_green"] = loadfx("vfx/jup/lighting/vfx_br_bulb_lensflare_green.vfx");
    level._effect["vfx_br_bulb_vault_red"] = loadfx("vfx/jup/lighting/vfx_br_bulb_lensflare_red.vfx");
    level._effect["vfx_br_bulb_vault_red_blink"] = loadfx("vfx/jup/lighting/vfx_br_bulb_lensflare_red_blinking.vfx");
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x537
// Size: 0xc9
function function_789d06b1a9f377c5(door) {
    level thread function_c3bf2f88b7bdad0f(door);
    forward = anglestoforward(door.angles);
    forwardoffset = 128;
    var_c548d45f1d62279a = door.origin + (0, 0, -110) + forward * forwardoffset;
    var_1e15ca204f179886 = getent("clip256x256x256", "targetname");
    if (isdefined(var_1e15ca204f179886)) {
        var_10688b3021acc893 = spawn("script_model", var_c548d45f1d62279a);
        var_10688b3021acc893.angles = (0, 0, 0);
        var_10688b3021acc893 clonebrushmodeltoscriptmodel(var_1e15ca204f179886);
        door.addedcollision = var_10688b3021acc893;
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x607
// Size: 0xc1
function function_c3bf2f88b7bdad0f(door) {
    forward = anglestoforward(door.angles);
    var_faf188be54649452 = anglestoright(door.angles);
    var_f6f6dc0578a5ab9b = door.origin + (0, 0, 135) + forward * -18 + var_faf188be54649452 * -38;
    door.lightscriptable = spawnscriptable("vault_indicator_light", var_f6f6dc0578a5ab9b);
    /#
        assertex(isdefined(door.lightscriptable), "br_bunker_utility::initVaultLightEffects - Vault Light Scriptable failed to spawn.");
    #/
    door.lightscriptable.var_50054f8ed68966d5 = 1;
    function_a5d6387bab61ba00(door);
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6cf
// Size: 0x34
function function_8ba0ae9d52f5f35f(team) {
    if (!isdefined(level.teamdata[team]["vault_doors"])) {
        level.teamdata[team]["vault_doors"] = [];
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70a
// Size: 0x2e
function function_f35b8fbc776c2211(lightscriptable) {
    return isdefined(lightscriptable) && isdefined(lightscriptable.var_50054f8ed68966d5) && istrue(lightscriptable.var_50054f8ed68966d5);
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x740
// Size: 0x3b
function function_ea45f200ad54ab3d(door) {
    if (function_f35b8fbc776c2211(door.lightscriptable)) {
        door.lightscriptable setscriptablepartstate("vault_indicator_light", "alarm");
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x782
// Size: 0x3b
function function_78ef9be55a4536cb(door) {
    if (function_f35b8fbc776c2211(door.lightscriptable)) {
        door.lightscriptable setscriptablepartstate("vault_indicator_light", "active");
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c4
// Size: 0x3b
function function_a5d6387bab61ba00(door) {
    if (function_f35b8fbc776c2211(door.lightscriptable)) {
        door.lightscriptable setscriptablepartstate("vault_indicator_light", "inactive");
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x806
// Size: 0x7d
function function_702f682e2a3526df(door) {
    if (isdefined(door)) {
        if (soundexists("br_bunker_door_open_02")) {
            door playsound("br_bunker_door_open_02");
        }
        var_902fcffd5545e0f0 = 4;
        var_79b37dfd4bea6cb3 = 4;
        door rotateyaw(-120, 8, var_902fcffd5545e0f0, var_79b37dfd4bea6cb3);
        wait(4);
        if (isdefined(door.addedcollision)) {
            door.addedcollision delete();
        }
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0xdd
function function_2fcaee708b41d832() {
    level.bunkerinteriorkeypads = [];
    var_c347d25e165ac454 = getstructarray("bunker_back_keypad", "targetname");
    foreach (var_6efe0c080eeedd55 in var_c347d25e165ac454) {
        scriptable = spawnscriptable("maphint_keypad_bunker_interior", var_6efe0c080eeedd55.origin);
        scriptable.backwallkeypad = 1;
        if (isdefined(var_6efe0c080eeedd55.script_noteworthy)) {
            scriptable.bunkernum = int(var_6efe0c080eeedd55.script_noteworthy);
            level.bunkerinteriorkeypads[scriptable.bunkernum] = scriptable;
        }
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x96e
// Size: 0x42
function keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace vault_door/namespace_a203e146814baef
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x9b7
// Size: 0x93
function _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_keypad_bunker_interior");
    #/
    instance setscriptablepartstate(part, "off");
    player keypad_playerinteractwithkeypadloop(instance);
    if (isdefined(player)) {
        if (instance.var_b50f7cb6d7639b3a == 0) {
            wait(2);
        }
        player playersetkeypadstateindex(0);
    }
    if (instance.var_b50f7cb6d7639b3a != 0) {
        wait(1);
        instance setscriptablepartstate(part, "on");
    }
}

// Namespace vault_door/namespace_a203e146814baef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa51
// Size: 0x318
function keypad_playerinteractwithkeypadloop(instance) {
    level endon("game_ended");
    self endon("keypad_kickPlayerFromKeypadMSG");
    thread keypad_damagedeathdisconnectwatch();
    thread keypad_playeridlewatch();
    playersetkeypadstateindex(1);
    var_885780d268327ba4 = 8;
    if (isdefined(instance.var_885780d268327ba4)) {
        var_885780d268327ba4 = instance.var_885780d268327ba4;
    }
    playersetkeypadcodelengthindex(var_885780d268327ba4);
    if (!isdefined(instance.var_cd4cdbeafa3971f7)) {
        instance.var_cd4cdbeafa3971f7 = 3;
    }
    if (!isdefined(instance.var_44c8e3d2260da815)) {
        instance.var_44c8e3d2260da815 = 3;
    }
    function_5392765d56bf59ea(instance.var_44c8e3d2260da815);
    team = self.pers["team"];
    var_7ad93963b383039d = level.teamdata[team]["vault_doors"];
    if (isdefined(var_7ad93963b383039d)) {
        var_e0a02e8974284d15 = var_7ad93963b383039d[instance.door.index];
        if (isdefined(var_e0a02e8974284d15)) {
            if (isdefined(var_e0a02e8974284d15.var_2e46f15e79793691)) {
                function_b899a0471538d3d4(var_e0a02e8974284d15.var_2e46f15e79793691);
            }
            objid = namespace_5aecb7b921208f15::function_c2e1be16e83ddac0(instance.door);
            if (isdefined(objid)) {
                function_da718c8ec624b4da(objid);
            }
            function_b751dd55c6c31d6d(instance.code["array"], var_e0a02e8974284d15.var_fa0f2d5aeb7a3af9, objid);
        } else {
            function_b751dd55c6c31d6d(instance.code["array"], 0, undefined);
        }
    }
    while (isdefined(self) && getkeypadstatefromomnvar() != 0) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message)) {
            if (message == "submit_br_keypad") {
                thread keypad_playeridlewatch();
                if (isdefined(instance.code) && iscodecorrect(instance, value)) {
                    playersetkeypadstateindex(2);
                    instance.var_b50f7cb6d7639b3a = 0;
                    if (isdefined(instance.successfunction)) {
                        [[ instance.successfunction ]](instance, self);
                    }
                    break;
                } else {
                    if (soundexists("br_keypad_deny")) {
                        playsoundatpos(self.origin, "br_keypad_deny");
                    }
                    if (instance.var_44c8e3d2260da815 > 0) {
                        instance.var_44c8e3d2260da815 = instance.var_44c8e3d2260da815 - 1;
                    }
                    function_5392765d56bf59ea(instance.var_44c8e3d2260da815);
                    instance.var_b50f7cb6d7639b3a = 1;
                    playersetkeypadstateindex(3);
                    waitframe();
                    if (isdefined(instance.code) && isdefined(instance.var_883dae71484975fd)) {
                        [[ instance.var_883dae71484975fd ]](instance, self);
                    }
                    if (isdefined(self)) {
                        playersetkeypadstateindex(1);
                    }
                }
            } else if (message == "exit_br_keypad") {
                instance.var_b50f7cb6d7639b3a = 1;
                break;
            }
        }
    }
    self notify("doneWithKeypad");
}

// Namespace vault_door/namespace_a203e146814baef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd70
// Size: 0x2f
function keypad_damagedeathdisconnectwatch() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    level endon("game_ended");
    waittill_any_3("death", "disconnect", "damage");
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace vault_door/namespace_a203e146814baef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda6
// Size: 0x24
function keypad_playeridlewatch() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    self notify("keypad_playerIdleWatch");
    self endon("keypad_playerIdleWatch");
    wait(30);
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace vault_door/namespace_a203e146814baef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdd1
// Size: 0x55
function iscodecorrect(instance, value) {
    if (!isdefined(instance.code["string"])) {
        return;
    }
    var_391df67337eedff2 = int(instance.code["string"]);
    if (value == var_391df67337eedff2) {
        return 1;
    }
    return 0;
}

// Namespace vault_door/namespace_a203e146814baef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe2e
// Size: 0x316
function generatenumbercode(var_885780d268327ba4, var_48b11326257052f1, var_2e698aed0de1ce13, var_d3da81df8d468200) {
    numbers = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9];
    var_48b11326257052f1.code = [];
    if (!isdefined(var_2e698aed0de1ce13)) {
        var_2e698aed0de1ce13 = 0;
    } else {
        var_48b11326257052f1.code["doubles"] = [];
    }
    if (!isdefined(var_d3da81df8d468200)) {
        var_d3da81df8d468200 = 0;
    } else {
        var_48b11326257052f1.code["triples"] = [];
    }
    var_6cb4c9e48f55503e = var_885780d268327ba4 - var_2e698aed0de1ce13 - var_d3da81df8d468200 * 2;
    /#
        assert(var_6cb4c9e48f55503e > var_2e698aed0de1ce13 + var_d3da81df8d468200, "Code generation request asking for too many doubles or triples.");
    #/
    numbers = array_randomize(numbers);
    for (i = 0; i < var_6cb4c9e48f55503e; i++) {
        var_48b11326257052f1.code["array"][i] = numbers[i];
    }
    var_91ef66919bfe4233 = var_48b11326257052f1.code["array"];
    for (i = 0; i < var_2e698aed0de1ce13; i++) {
        var_19f414b6862a5d43 = var_91ef66919bfe4233[i];
        var_48b11326257052f1.code["array"][var_48b11326257052f1.code["array"].size] = var_19f414b6862a5d43;
        var_48b11326257052f1.code["doubles"][var_48b11326257052f1.code["doubles"].size] = var_19f414b6862a5d43;
        var_91ef66919bfe4233 = array_remove(var_91ef66919bfe4233, var_91ef66919bfe4233[i]);
    }
    for (i = 0; i < var_d3da81df8d468200; i++) {
        var_7e2e31fbe4946a0a = var_91ef66919bfe4233[i];
        for (x = 0; x < 2; x++) {
            var_48b11326257052f1.code["array"][var_48b11326257052f1.code["array"].size] = var_7e2e31fbe4946a0a;
        }
        var_48b11326257052f1.code["triples"][var_48b11326257052f1.code["triples"].size] = var_7e2e31fbe4946a0a;
        var_91ef66919bfe4233 = array_remove(var_91ef66919bfe4233, var_91ef66919bfe4233[i]);
    }
    var_48b11326257052f1.code["array"] = array_randomize(var_48b11326257052f1.code["array"]);
    var_48b11326257052f1.code["string"] = "";
    foreach (num in var_48b11326257052f1.code["array"]) {
        var_e30ee4ae67d05d90 = "" + num;
        var_48b11326257052f1.code["string"] = var_48b11326257052f1.code["string"] + var_e30ee4ae67d05d90;
    }
}

