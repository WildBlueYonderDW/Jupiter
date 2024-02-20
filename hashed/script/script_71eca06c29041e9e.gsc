// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d8202968463a21d;
#using script_67055b3ff4918256;
#using scripts\engine\scriptable.gsc;
#using script_3455e18e022b7abc;

#namespace namespace_727755bff008cc75;

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x44c
function init() {
    level._effect["vfx_player_screen_distortion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_zm_aether_canisters_energy_full_screen.vfx");
    level._effect["vfx_player_screen_distortion_end"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_outbreak_tear_screen_reverse.vfx");
    level._effect["vfx_player_screen_distortion_rift"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_outbreak_tear_screen.vfx");
    level._effect["vfx_zip_player_teleport"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_send_show.vfx");
    level._effect["vfx_zip_portal_teleport"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_send.vfx");
    level._effect["vfx_zip_player_arrive"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_send_land.vfx");
    wait(3);
    level.var_4c443c9d4819c4e9 = spawnstruct();
    level.var_4c443c9d4819c4e9.destinations = getstructarray("zip_door_destination", "targetname");
    level.var_4c443c9d4819c4e9.doors = getstructarray("zip_door_entry", "targetname");
    level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e = [];
    level.var_4c443c9d4819c4e9.var_d27f7588f394e61d = [];
    foreach (door in level.var_4c443c9d4819c4e9.doors) {
        if (!isdefined(door.script_noteworthy) || getdvar(@"hash_b7734f303b1ee759", "0") == "1") {
            level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e[level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e.size] = [0:door];
        } else if (!isdefined(level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e[door.script_noteworthy])) {
            level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e[door.script_noteworthy] = [0:door];
        } else {
            level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e[door.script_noteworthy][level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e[door.script_noteworthy].size] = door;
        }
    }
    namespace_17c25f0877bfb620::scriptable_adddamagedcallback(&namespace_26e60c953dc40f2c::function_cdbec4722f88f614);
    namespace_17c25f0877bfb620::scriptable_addnotifycallback("idle", &namespace_26e60c953dc40f2c::function_25da66b947454d11);
    namespace_17c25f0877bfb620::scriptable_addnotifycallback("invisible", &namespace_26e60c953dc40f2c::function_d44e5d38e3b8fb2c);
    foreach (var_92eb675b1a771f99 in level.var_4c443c9d4819c4e9.var_92d4375b33fb2f9e) {
        door = random(var_92eb675b1a771f99);
        door namespace_b1453e6e8267c3ce::init(level.var_4c443c9d4819c4e9);
        level.var_4c443c9d4819c4e9.var_d27f7588f394e61d[level.var_4c443c9d4819c4e9.var_d27f7588f394e61d.size] = door;
        namespace_4c2b495b8d79cc2e::function_99a59990b4652967(door);
        namespace_4c2b495b8d79cc2e::function_51ad14107ca158fb(door, "player_prox", door.origin, 300, 0);
        namespace_4c2b495b8d79cc2e::function_51ad14107ca158fb(door, "player_prox_leave", door.origin, 400, 0);
    }
    foreach (destination in level.var_4c443c9d4819c4e9.destinations) {
        function_795b9d7a2dd37cc6(destination);
    }
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("ZIP_DOORS", &function_854e735a80062ac0, &namespace_740a076c3d0a164d::function_a69dbc79d8e0c7c, "player_prox", 0.5);
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("ZIP_DOORS", &function_854e735a80062ac0, &namespace_740a076c3d0a164d::function_4dc883726bbcee81, "player_prox_leave", 0.5);
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("ZIP_DESTINATIONS", &function_49bec70b76a8a03d, &function_7ba6d68cb012bac0, "destination_prox", 0.5);
    /#
        level.var_4c443c9d4819c4e9 function_7e3a130c966df56a();
    #/
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b1
// Size: 0x16
function function_49bec70b76a8a03d() {
    return level.var_4c443c9d4819c4e9.destinations;
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cf
// Size: 0x16
function function_854e735a80062ac0() {
    return level.var_4c443c9d4819c4e9.var_d27f7588f394e61d;
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x123
function private function_7ba6d68cb012bac0(var_d6bfa53c531546d6) {
    var_209f14c7cfd47bd7 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    self notify("ZIP_TRANSITION_SINGLETON");
    self endon("ZIP_TRANSITION_SINGLETON");
    /#
        iprintln("ob_combo_lock_exit" + var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e);
    #/
    if (var_209f14c7cfd47bd7 && !self.active) {
        /#
            iprintln("<unknown string>");
        #/
        self.active = 1;
        function_52fa5880f2576edb(self.script_noteworthy);
    } else if (!var_209f14c7cfd47bd7 && self.active && var_d6bfa53c531546d6.var_9f2dab34edc7e257.size == 0) {
        /#
            iprintln("<unknown string>");
        #/
        self.active = 0;
        foreach (scriptable in self.var_44ccea5f694b1b51) {
            function_dd2203e6575aad88(scriptable);
        }
        self.var_44ccea5f694b1b51 = [];
    }
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x917
// Size: 0xb9
function function_7e3a130c966df56a() {
    /#
        while (1) {
            if (getdvar(@"hash_b3f9138f359b1d5d", "<unknown string>") != "<unknown string>") {
                dest = function_cb7a8125ea9acdce(getdvar(@"hash_b3f9138f359b1d5d", "<unknown string>"));
                foreach (player in level.players) {
                    player namespace_b1453e6e8267c3ce::function_dc8998400a3eb807(dest);
                }
                setdvar(@"hash_b3f9138f359b1d5d", "<unknown string>");
            }
            waitframe();
        }
    #/
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d7
// Size: 0x94
function function_cb7a8125ea9acdce(var_8bb6b9b919c2c19d) {
    foreach (dest in self.destinations) {
        if (var_8bb6b9b919c2c19d == getsubstr(dest.script_noteworthy, 0, var_8bb6b9b919c2c19d.size)) {
            if (var_8bb6b9b919c2c19d.size == dest.script_noteworthy.size) {
                return "connected";
            }
            return "valid";
        }
    }
    return "invalid";
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa73
// Size: 0x6b
function function_198a38d3011ec3bc(var_8bb6b9b919c2c19d) {
    foreach (dest in self.destinations) {
        if (var_8bb6b9b919c2c19d == dest.script_noteworthy) {
            return dest;
        }
    }
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae5
// Size: 0x35
function function_52fa5880f2576edb(var_8bb6b9b919c2c19d) {
    digit = getstruct(self.target, "targetname");
    function_f15d4eff102c4891(undefined, var_8bb6b9b919c2c19d, digit);
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb21
// Size: 0x49
function function_795b9d7a2dd37cc6(destination) {
    destination.var_44ccea5f694b1b51 = [];
    destination.active = 0;
    function_99a59990b4652967(destination);
    function_51ad14107ca158fb(destination, "destination_prox", destination.origin, 250, 0);
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb71
// Size: 0xe3
function function_f15d4eff102c4891(index, var_8bb6b9b919c2c19d, digit) {
    index = function_53c4c53197386572(index, 0);
    forward = anglestoforward(digit.angles);
    scriptable = spawnscriptable("ob_combo_lock_exit", digit.origin + forward, digit.angles + (90, 0, 0));
    scriptable setscriptablepartstate("model", var_8bb6b9b919c2c19d[index], 0);
    self.var_44ccea5f694b1b51 = array_add(self.var_44ccea5f694b1b51, scriptable);
    if (!isdefined(digit.target)) {
        return;
    }
    var_eef112353143e04a = getstruct(digit.target, "targetname");
    function_f15d4eff102c4891(index + 1, var_8bb6b9b919c2c19d, var_eef112353143e04a);
}

// Namespace namespace_727755bff008cc75/namespace_a07f20e9740e52
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5b
// Size: 0x25
function function_dd2203e6575aad88(scriptable) {
    scriptable setscriptablepartstate("model", "inactive", 0);
    scriptable freescriptable();
}

