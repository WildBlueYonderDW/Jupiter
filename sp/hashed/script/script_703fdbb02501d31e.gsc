#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_66122a002aff5d57;

#namespace agent_drops;

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x411
// Size: 0x10
function function_6620b2d387064d74() {
    function_22ad9cf8a9381198();
    function_cb24c57ae08ed7ae();
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x429
// Size: 0x45
function function_22ad9cf8a9381198() {
    level.var_d932f46857d6d61 = [];
    level.var_dd7e94a4498cc047 = [];
    level.var_82482823a4bd9581 = [];
    level.var_d5149904ccb5fe9d = [];
    level.var_f7c5323d78892a4b = [];
    level.var_365210df3b94b112 = [];
    function_d2475f924f681ec3();
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x476
// Size: 0xca
function function_d2475f924f681ec3() {
    level.var_13503c3176b8b0b1 = [];
    level.var_13503c3176b8b0b1["brloot_ammo_762"] = 38;
    level.var_13503c3176b8b0b1["brloot_ammo_919"] = 37;
    level.var_13503c3176b8b0b1["brloot_ammo_50cal"] = 10;
    level.var_13503c3176b8b0b1["brloot_ammo_12g"] = 10;
    level.var_13503c3176b8b0b1["brloot_ammo_rocket"] = 5;
    level.var_20e9e1c4da44b83 = [];
    level.var_20e9e1c4da44b83["brloot_ammo_762"] = -1;
    level.var_20e9e1c4da44b83["brloot_ammo_919"] = -1;
    level.var_20e9e1c4da44b83["brloot_ammo_50cal"] = -1;
    level.var_20e9e1c4da44b83["brloot_ammo_12g"] = -1;
    level.var_20e9e1c4da44b83["brloot_ammo_rocket"] = -1;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x548
// Size: 0x2eb
function function_cb24c57ae08ed7ae() {
    if (!function_240f7f4e57340e8f()) {
        function_6c38af1ab38e980e("headshot_cash", &function_8cd9ca26d81fd9d, "money", 1, 30, 10, 1);
        function_6c38af1ab38e980e("cash_drop_50", &function_8cd9ca26d81fd9d, "money", 1, 30, 10, 1);
        function_6c38af1ab38e980e("cash_drop_100", &function_8cd9ca26d81fd9d, "money", 1, undefined, 5, 0);
        function_6c38af1ab38e980e("cash_drop_150", &function_8cd9ca26d81fd9d, "money", 1, 30, 10, 1);
        function_6c38af1ab38e980e("cash_drop_500", &function_8cd9ca26d81fd9d, "money", 1, undefined, 5, 0);
        function_6c38af1ab38e980e("cash_drop_1000", &function_8cd9ca26d81fd9d, "money", 1, 30, 10, 1);
    }
    function_6c38af1ab38e980e("brloot_powerup_armor", &function_9eec29e4018e3bd9, "power_up", 0, 30, 10, 1);
    function_6c38af1ab38e980e("brloot_ammo_762", &function_e5fbaab3da0af6de, "ammo", 1, undefined, 20, 0);
    function_6c38af1ab38e980e("brloot_ammo_rocket", &function_e5fbaab3da0af6de, "ammo", 1, undefined, 5, 0);
    function_6c38af1ab38e980e("brloot_ammo_rocket_rpg_ai", &function_e5fbaab3da0af6de, "forced_ammo", 0, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_ammo_919", &function_e5fbaab3da0af6de, "ammo", 1, undefined, 20, 0);
    function_6c38af1ab38e980e("brloot_ammo_50cal", &function_e5fbaab3da0af6de, "ammo", 1, undefined, 5, 0);
    function_6c38af1ab38e980e("brloot_ammo_12g", &function_e5fbaab3da0af6de, "ammo", 1, undefined, 10, 0);
    function_6c38af1ab38e980e("drop_random_ammo_types", &function_e4bd43508c05c894, "ammo", 1, undefined, 20, 0);
    function_6c38af1ab38e980e("brloot_armor_plate", &function_9eec29e4018e3bd9, "power_up", 0, 8, 20, 0);
    function_6c38af1ab38e980e("brloot_powerup_ammo", &function_9eec29e4018e3bd9, "power_up", 0, 30, 10, 0);
    function_6c38af1ab38e980e("brloot_powerup_equipment", &function_9eec29e4018e3bd9, "power_up", 0, undefined, 10, 0);
    function_6c38af1ab38e980e("brloot_offhand_claymore", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_offhand_decoy", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_offhand_flash", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_offhand_gas", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_offhand_smoke", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_offhand_snapshot", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_offhand_throwingknife", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 1);
    function_6c38af1ab38e980e("brloot_offhand_heartbeatsensor", &function_3eeb69d40ad71f2b, "equipment", 1, undefined, 100, 0);
    function_6c38af1ab38e980e("brloot_equip_gasmask", &function_66d0a6e429fdf0f4, "equipment", 1, undefined, 100, 0);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x83b
// Size: 0x128
function function_6c38af1ab38e980e(var_d49285246b443066, drop_func, drop_type, var_138c8168e3b1a349, time_between_spawns, var_429f631e84274dd3, var_3b2e46e915ea397b) {
    if (istrue(var_3b2e46e915ea397b)) {
        return;
    }
    if (function_92031ff8a97d9e90(var_d49285246b443066)) {
        assertmsg("scriptscpagent_drops::register_agent_drop was called using a drop_name (" + var_d49285246b443066 + ") that was previously registered.");
    }
    if (!isdefined(level.var_d932f46857d6d61[var_d49285246b443066])) {
        level.var_d932f46857d6d61[var_d49285246b443066] = [];
    }
    level.var_d932f46857d6d61[var_d49285246b443066] = drop_func;
    if (isdefined(drop_type)) {
        if (!isdefined(level.var_dd7e94a4498cc047[drop_type])) {
            level.var_dd7e94a4498cc047[drop_type] = [];
        }
        level.var_dd7e94a4498cc047[var_d49285246b443066] = drop_type;
    }
    if (istrue(var_138c8168e3b1a349)) {
        level.var_82482823a4bd9581[var_d49285246b443066] = 1;
    }
    if (isdefined(time_between_spawns)) {
        function_630229e935873b44(var_d49285246b443066, time_between_spawns);
    }
    if (isdefined(var_429f631e84274dd3)) {
        level.var_365210df3b94b112[var_d49285246b443066] = var_429f631e84274dd3;
    } else {
        level.var_365210df3b94b112[var_d49285246b443066] = 100;
    }
    setdvar(hashcat(@"hash_6e663fb6f8a19320", var_d49285246b443066), level.var_365210df3b94b112[var_d49285246b443066]);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96b
// Size: 0x42
function function_276d0d2c772b45bb(var_d49285246b443066) {
    level.var_d932f46857d6d61[var_d49285246b443066] = undefined;
    level.var_365210df3b94b112[var_d49285246b443066] = undefined;
    level.var_82482823a4bd9581[var_d49285246b443066] = undefined;
    level.var_dd7e94a4498cc047[var_d49285246b443066] = undefined;
    level.var_d5149904ccb5fe9d[var_d49285246b443066] = undefined;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9b5
// Size: 0x24
function function_630229e935873b44(var_d49285246b443066, time_between_spawns) {
    level.var_d5149904ccb5fe9d[var_d49285246b443066] = time_between_spawns * 1000;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e1
// Size: 0x17
function function_6c418592a0f5850d(var_d49285246b443066) {
    return isdefined(level.var_d5149904ccb5fe9d[var_d49285246b443066]);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa01
// Size: 0x16
function function_9c2f4b63b917cbc1(var_d49285246b443066) {
    return level.var_d5149904ccb5fe9d[var_d49285246b443066];
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa20
// Size: 0x2b
function function_a74a1ad1bba9f0fd(var_d49285246b443066) {
    if (isdefined(level.var_f7c5323d78892a4b[var_d49285246b443066])) {
        return level.var_f7c5323d78892a4b[var_d49285246b443066];
    }
    return 0;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa53
// Size: 0x64
function function_526976d2fd70521f(var_d49285246b443066) {
    var_3238a12b980595e1 = function_b843fbf56b48d7a5(var_d49285246b443066);
    if (randomint(100) < var_3238a12b980595e1) {
        if (function_6c418592a0f5850d(var_d49285246b443066)) {
            time = gettime();
            var_67940dbf6482e648 = function_a74a1ad1bba9f0fd(var_d49285246b443066);
            return (time >= var_67940dbf6482e648);
        } else {
            return 1;
        }
        return;
    }
    return 0;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabf
// Size: 0x7b
function function_b843fbf56b48d7a5(var_d49285246b443066) {
    if (getdvarint(@"hash_2cda10d708006761")) {
        return 100;
    }
    if (isdefined(level.var_365210df3b94b112[var_d49285246b443066])) {
        if (getdvarint(hashcat(@"hash_6e663fb6f8a19320", var_d49285246b443066)) != level.var_365210df3b94b112[var_d49285246b443066]) {
            return getdvarint(hashcat(@"hash_6e663fb6f8a19320", var_d49285246b443066));
        } else {
            return level.var_365210df3b94b112[var_d49285246b443066];
        }
        return;
    }
    return 100;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb42
// Size: 0x46
function function_304333ff6b2313f(var_d49285246b443066) {
    if (function_6c418592a0f5850d(var_d49285246b443066)) {
        var_13face5b7d5ce7b4 = function_9c2f4b63b917cbc1(var_d49285246b443066);
        time = gettime();
        level.var_f7c5323d78892a4b[var_d49285246b443066] = time + var_13face5b7d5ce7b4;
    }
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb90
// Size: 0x2b
function function_29a7cb456961b143(var_d49285246b443066) {
    if (isdefined(level.var_dd7e94a4498cc047[var_d49285246b443066])) {
        return level.var_dd7e94a4498cc047[var_d49285246b443066];
    }
    return undefined;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc3
// Size: 0x8b
function function_6fdbf71c8217cfc5(var_d49285246b443066) {
    if (!function_713174da2f52de61()) {
        return;
    }
    if (!function_e4e9a069045bf808(var_d49285246b443066)) {
        return;
    }
    if (function_9fffc56f57c8f7c8(var_d49285246b443066)) {
        return;
    }
    if (!isdefined(self.var_d932f46857d6d61)) {
        self.var_d932f46857d6d61 = [];
    }
    if (function_92031ff8a97d9e90(var_d49285246b443066)) {
        if (function_2a5a6ec75498cac6(var_d49285246b443066)) {
            drop_type = function_29a7cb456961b143(var_d49285246b443066);
            if (isdefined(drop_type)) {
                function_8c4c5c17f08ff6f0(drop_type);
            }
        }
        self.var_d932f46857d6d61[self.var_d932f46857d6d61.size] = var_d49285246b443066;
    }
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc56
// Size: 0x50
function function_713174da2f52de61() {
    if (isdefined(self.unittype)) {
        switch (self.unittype) {
        case #"hash_f4a90c6c03d32ee9":
            return 0;
        case #"hash_e87767df2e5c3a68":
            return 0;
        default:
            return 1;
        }
        return;
    }
    return 0;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcae
// Size: 0x4d
function function_9fffc56f57c8f7c8(var_d49285246b443066) {
    if (isdefined(self.var_d932f46857d6d61)) {
        for (i = 0; i < self.var_d932f46857d6d61.size; i++) {
            if (self.var_d932f46857d6d61[i] == var_d49285246b443066) {
                return true;
            }
        }
    }
    return false;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd04
// Size: 0x17
function function_92031ff8a97d9e90(var_d49285246b443066) {
    return isdefined(level.var_d932f46857d6d61[var_d49285246b443066]);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd24
// Size: 0x17
function function_2a5a6ec75498cac6(var_d49285246b443066) {
    return istrue(level.var_82482823a4bd9581[var_d49285246b443066]);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd44
// Size: 0x6f
function function_8c4c5c17f08ff6f0(var_528b2fc70e7691cc) {
    if (isdefined(self.var_d932f46857d6d61)) {
        var_947ace46408cfb9c = self.var_d932f46857d6d61;
        for (i = 0; i < var_947ace46408cfb9c.size; i++) {
            drop_type = function_29a7cb456961b143(var_947ace46408cfb9c[i]);
            if (isdefined(drop_type) && drop_type == var_528b2fc70e7691cc) {
                function_8033aadb6558d0fe(var_947ace46408cfb9c[i]);
            }
        }
    }
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdbb
// Size: 0x70
function function_8033aadb6558d0fe(var_d49285246b443066) {
    if (!isdefined(self.var_d932f46857d6d61)) {
        return;
    }
    temp_array = [];
    for (i = 0; i < self.var_d932f46857d6d61.size; i++) {
        if (self.var_d932f46857d6d61[i] != var_d49285246b443066) {
            temp_array[temp_array.size] = self.var_d932f46857d6d61[i];
        }
    }
    self.var_d932f46857d6d61 = temp_array;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xe33
// Size: 0xcc
function function_c568b761a7f0b678(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, timeoffset, deathanimduration) {
    if (isdefined(self.var_d932f46857d6d61)) {
        for (i = 0; i < self.var_d932f46857d6d61.size; i++) {
            var_b703f10aa66786b1 = self.var_d932f46857d6d61[i];
            if (isdefined(level.var_d932f46857d6d61[var_b703f10aa66786b1]) && function_526976d2fd70521f(var_b703f10aa66786b1)) {
                self.var_d0e9753b09126417 = var_b703f10aa66786b1;
                if (self [[ level.var_d932f46857d6d61[var_b703f10aa66786b1] ]]()) {
                    function_304333ff6b2313f(var_b703f10aa66786b1);
                }
            }
        }
    }
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf07
// Size: 0x43
function function_e4e9a069045bf808(var_d49285246b443066) {
    /#
        if (getdvarint(@"hash_1cda994c72edfabe", 0)) {
            return false;
        }
    #/
    if (!scripts\cp\utility::coop_mode_has("agent_drops")) {
        return false;
    }
    if (istrue(level.var_ea8aff4b580b0b8d)) {
        return false;
    }
    return true;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf53
// Size: 0x34
function function_b1c55038843de38b() {
    if (isdefined(self.var_7c968c5609aded2)) {
        return_value = self.var_7c968c5609aded2;
        self.var_7c968c5609aded2++;
        return return_value;
    }
    return 0;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8f
// Size: 0x11e
function function_8cd9ca26d81fd9d() {
    amount = 100;
    drop_type = "brloot_plunder_cash_common_1";
    if (isdefined(self.var_d0e9753b09126417)) {
        switch (self.var_d0e9753b09126417) {
        case #"hash_d0eeb6cbc5a7b58f":
            drop_type = "brloot_plunder_cash_uncommon_2";
            amount = 200;
            break;
        case #"hash_68a7a13097c6d8b2":
            drop_type = "brloot_plunder_cash_uncommon_2";
            amount = 500;
            break;
        case #"hash_51d09164e6d2cea2":
            drop_type = "brloot_plunder_cash_rare_1";
            amount = 1000;
            break;
        case #"hash_49b303308736b4eb":
            drop_type = "brloot_plunder_cash_uncommon_1";
            amount = 100;
            break;
        case #"hash_1bf0dcf87f6c7bf6":
        case #"hash_49bc7530873e2426":
        default:
            drop_type = "brloot_plunder_cash_common_1";
            amount = 100;
            break;
        }
    }
    dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
    item = spawnpickup(drop_type, dropinfo, amount, 1, undefined, 1);
    return true;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b6
// Size: 0x1e6
function function_e4bd43508c05c894() {
    drops = function_d7555674b07d6fc9();
    var_6c5825b2e510a830 = function_ee2a1706b8952b4c(drops);
    ammo_count = function_9a9eb8e1438e9cb8();
    var_9a2766c35b457773 = weighted_array_randomize(drops, var_6c5825b2e510a830);
    drops = array_remove(drops, var_9a2766c35b457773);
    dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
    switch (var_9a2766c35b457773) {
    case #"hash_672892a4af1e94cc":
        item = spawnpickup("brloot_ammo_762", dropinfo, ammo_count[var_9a2766c35b457773], 1, undefined, 1);
        break;
    case #"hash_755a9bafcd63b343":
        item = spawnpickup("brloot_ammo_rocket", dropinfo, ammo_count[var_9a2766c35b457773], 1, undefined, 1);
        break;
    case #"hash_1cd9ffa488237604":
        item = spawnpickup("brloot_ammo_919", dropinfo, ammo_count[var_9a2766c35b457773], 1, undefined, 1);
        break;
    case #"hash_f1734c15f85881ca":
        item = spawnpickup("brloot_ammo_50cal", dropinfo, ammo_count[var_9a2766c35b457773], 1, undefined, 1);
        break;
    case #"hash_57e5eda4a702c559":
        item = spawnpickup("brloot_ammo_12g", dropinfo, ammo_count[var_9a2766c35b457773], 1, undefined, 1);
        break;
    }
    drops = function_d7555674b07d6fc9(var_9a2766c35b457773);
    var_6c5825b2e510a830 = function_ee2a1706b8952b4c(drops);
    var_730abf41238d2467 = weighted_array_randomize(drops, var_6c5825b2e510a830);
    var_3238a12b980595e1 = int(function_b843fbf56b48d7a5(var_730abf41238d2467) * 0.5);
    result = randomint(100) < var_3238a12b980595e1;
    if (result) {
        dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
        item = spawnpickup(var_730abf41238d2467, dropinfo, ammo_count[var_730abf41238d2467], 1, undefined, 1);
        function_304333ff6b2313f(var_730abf41238d2467);
    }
    return true;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a5
// Size: 0xb5
function function_d7555674b07d6fc9(var_65ddea6c7e53503d) {
    if (isdefined(var_65ddea6c7e53503d)) {
        var_7bbda18a855c7111 = [];
        if (!isarray(var_65ddea6c7e53503d)) {
            var_65ddea6c7e53503d = [var_65ddea6c7e53503d];
        }
        keys = getarraykeys(level.var_13503c3176b8b0b1);
        for (i = 0; i < keys.size; i++) {
            var_db40693db52522e8 = 1;
            for (j = 0; j < var_65ddea6c7e53503d.size; j++) {
                if (keys[i] == var_65ddea6c7e53503d[j]) {
                    var_db40693db52522e8 = 0;
                    break;
                }
            }
            if (var_db40693db52522e8) {
                var_7bbda18a855c7111[var_7bbda18a855c7111.size] = keys[i];
            }
        }
        return var_7bbda18a855c7111;
    }
    return getarraykeys(level.var_13503c3176b8b0b1);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1362
// Size: 0x4b
function function_ee2a1706b8952b4c(ammo_types) {
    var_6c5825b2e510a830 = [];
    for (i = 0; i < ammo_types.size; i++) {
        rate = function_d4d68b57453c54e0(ammo_types[i]);
        var_6c5825b2e510a830[var_6c5825b2e510a830.size] = rate;
    }
    return var_6c5825b2e510a830;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13b6
// Size: 0x46
function function_d4d68b57453c54e0(var_25f2ebe6b0bcd6dc) {
    if (isdefined(level.var_20e9e1c4da44b83[var_25f2ebe6b0bcd6dc]) && level.var_20e9e1c4da44b83[var_25f2ebe6b0bcd6dc] >= 0) {
        return level.var_20e9e1c4da44b83[var_25f2ebe6b0bcd6dc];
    }
    return level.var_13503c3176b8b0b1[var_25f2ebe6b0bcd6dc];
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1404
// Size: 0x20
function function_6cd80be6451f285(var_25f2ebe6b0bcd6dc, var_3238a12b980595e1) {
    level.var_20e9e1c4da44b83[var_25f2ebe6b0bcd6dc] = var_3238a12b980595e1;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x142c
// Size: 0x56
function function_38924fb7672b340d(var_d49285246b443066, var_429f631e84274dd3) {
    if (isdefined(var_429f631e84274dd3)) {
        level.var_365210df3b94b112[var_d49285246b443066] = var_429f631e84274dd3;
    } else {
        level.var_365210df3b94b112[var_d49285246b443066] = 100;
    }
    setdvar(hashcat(@"hash_6e663fb6f8a19320", var_d49285246b443066), level.var_365210df3b94b112[var_d49285246b443066]);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x148a
// Size: 0x3f
function function_77f5254d6847360b(var_25f2ebe6b0bcd6dc) {
    drops = function_d7555674b07d6fc9();
    for (i = 0; i < drops.size; i++) {
        function_73a9ff1e1e7ef586(drops[i]);
    }
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14d1
// Size: 0x15
function function_73a9ff1e1e7ef586(var_25f2ebe6b0bcd6dc) {
    function_6cd80be6451f285(var_25f2ebe6b0bcd6dc, -1);
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x41
function function_9a9eb8e1438e9cb8() {
    ammo_count = [];
    ammo_count["brloot_ammo_762"] = 30;
    ammo_count["brloot_ammo_919"] = 25;
    ammo_count["brloot_ammo_50cal"] = 10;
    ammo_count["brloot_ammo_12g"] = 10;
    ammo_count["brloot_ammo_rocket"] = 1;
    return ammo_count;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1538
// Size: 0x2c
function function_c530de57dafe4bd8(var_d49285246b443066) {
    var_e10d206e63187808 = function_9a9eb8e1438e9cb8();
    if (isdefined(var_e10d206e63187808[var_d49285246b443066])) {
        return var_e10d206e63187808[var_d49285246b443066];
    }
    return undefined;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x156c
// Size: 0xf8
function function_e5fbaab3da0af6de() {
    if (isdefined(self.var_d0e9753b09126417)) {
        var_d49285246b443066 = self.var_d0e9753b09126417;
        amount = function_c530de57dafe4bd8(var_d49285246b443066);
        switch (var_d49285246b443066) {
        case #"hash_1cd9ffa488237604":
        case #"hash_57e5eda4a702c559":
        case #"hash_672892a4af1e94cc":
        case #"hash_755a9bafcd63b343":
        case #"hash_f1734c15f85881ca":
            break;
        case #"hash_7bbe2f3bfd8d0162":
            var_d49285246b443066 = "brloot_ammo_rocket";
            amount = 1;
            function_304333ff6b2313f(var_d49285246b443066);
            break;
        }
        dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
        dropinfo.var_a61783b788746c54 = 1;
        item = spawnpickup(var_d49285246b443066, dropinfo, amount, 1, undefined, 1);
        return 1;
    }
    return 0;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166c
// Size: 0x9f
function function_8f956de778c73e8e() {
    var_3238a12b980595e1 = getdvarint(@"hash_5372d188bbf813ac", 10);
    if (randomint(100) <= var_3238a12b980595e1) {
        drop_type = "brloot_armor_plate";
        amount = 1;
        dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
        dropinfo.var_a61783b788746c54 = 1;
        item = spawnpickup(drop_type, dropinfo, amount, 1, undefined, 1);
        return 1;
    }
    return 0;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1713
// Size: 0x176
function function_9eec29e4018e3bd9() {
    if (isdefined(self.var_d0e9753b09126417)) {
        var_d49285246b443066 = "brloot_powerup_ammo";
        amount = 1;
        var_a5b2c541413aa895 = 1;
        var_3238a12b980595e1 = getdvarint(@"hash_5b1597cf9406744", 5);
        switch (self.var_d0e9753b09126417) {
        case #"hash_444817d1d52f73b3":
            var_d49285246b443066 = "brloot_powerup_ammo";
            amount = 1;
            break;
        case #"hash_f7690febb5e098cb":
            var_d49285246b443066 = scripts\engine\utility::random(["brloot_offhand_claymore", "brloot_offhand_c4", "brloot_offhand_frag", "brloot_offhand_molotov", "brloot_offhand_semtex", "brloot_offhand_thermite", "brloot_offhand_throwingknife"]);
            var_a5b2c541413aa895 = 0;
            amount = 4;
            break;
        case #"hash_2eb74e6e69980388":
            var_d49285246b443066 = "brloot_powerup_armor";
            amount = 1;
            break;
        case #"hash_55798564991651ac":
            var_d49285246b443066 = "brloot_armor_plate";
            amount = 1;
            var_a5b2c541413aa895 = getdvarint(@"hash_9925f8ad1812f844", 1);
            break;
        }
        dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
        dropinfo.var_a61783b788746c54 = 1;
        item = spawnpickup(var_d49285246b443066, dropinfo, amount, 0, undefined, var_a5b2c541413aa895);
        return true;
    }
    return false;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1892
// Size: 0x83
function function_3eeb69d40ad71f2b() {
    if (isdefined(self.var_d0e9753b09126417)) {
        amount = 4;
        var_d49285246b443066 = self.var_d0e9753b09126417;
        dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
        dropinfo.var_a61783b788746c54 = 1;
        item = spawnpickup(var_d49285246b443066, dropinfo, amount, 0, undefined, 0);
        return true;
    }
    return false;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191e
// Size: 0xa1
function function_66d0a6e429fdf0f4() {
    if (isdefined(self.gasmaskhealth) && self.gasmaskhealth > 0) {
        if (isdefined(self.var_d0e9753b09126417)) {
            amount = 4;
            var_d49285246b443066 = self.var_d0e9753b09126417;
            dropinfo = getitemdroporiginandangles(function_b1c55038843de38b(), self.origin, self.angles, self);
            dropinfo.var_a61783b788746c54 = 1;
            item = spawnpickup(var_d49285246b443066, dropinfo, amount, 0, undefined, 0);
            return true;
        }
        return false;
    }
    return false;
}

// Namespace agent_drops / namespace_7335f9420e698c48
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19c8
// Size: 0x8b
function weighted_array_randomize(array, weights) {
    assert(array.size == weights.size);
    var_13acbd53528ed1ff = 0;
    for (i = 0; i < weights.size; i++) {
        var_13acbd53528ed1ff += weights[i];
    }
    random_weight = randomfloat(var_13acbd53528ed1ff);
    var_98abcc65d2b0707d = 0;
    for (i = 0; i < array.size; i++) {
        var_98abcc65d2b0707d += weights[i];
        if (var_98abcc65d2b0707d >= random_weight) {
            return array[i];
        }
    }
}

