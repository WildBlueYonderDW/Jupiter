#using script_7b2517368c79e5bc;

#namespace namespace_94efe9b48c602c39;

// Namespace namespace_94efe9b48c602c39 / namespace_954524c8d6293cb9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x34
function function_628ac163573e544e() {
    if (isdefined(level.var_50e605b4f0a0152b)) {
        [[ level.var_50e605b4f0a0152b ]]();
        return;
    }
    function_900f562c61c6a5d6("ammo", &use_ammo, &function_67d2e1159a24893);
}

// Namespace namespace_94efe9b48c602c39 / namespace_954524c8d6293cb9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa
// Size: 0xad
function use_ammo(itembundle, item) {
    ammoleft = item.count;
    ammoleft = function_dbeac47bbdfe2c89(self.currentprimaryweapon, itembundle, ammoleft);
    if (ammoleft == 0) {
        return 0;
    }
    primary_weapons = self getweaponslistprimaries();
    foreach (primary_weapon in primary_weapons) {
        ammoleft = function_dbeac47bbdfe2c89(primary_weapon, itembundle, ammoleft);
        if (ammoleft == 0) {
            return 0;
        }
    }
    return ammoleft;
}

// Namespace namespace_94efe9b48c602c39 / namespace_954524c8d6293cb9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0xc3
function function_67d2e1159a24893(itembundle, item, autouse, allowswap) {
    primary_weapons = self getweaponslistprimaries();
    foreach (primary_weapon in primary_weapons) {
        var_fe768d47e57d337a = function_207fcdc93a85aa07(primary_weapon);
        if (isdefined(var_fe768d47e57d337a) && var_fe768d47e57d337a == itembundle.ref) {
            current_ammo = self getweaponammostock(primary_weapon);
            if (current_ammo < primary_weapon.maxammo) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_94efe9b48c602c39 / namespace_954524c8d6293cb9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x32c
// Size: 0xe8
function private function_207fcdc93a85aa07(primary_weapon) {
    weapon_class = primary_weapon.classname;
    switch (weapon_class) {
    case #"hash_719417cb1de832b6":
    case #"hash_900cb96c552c5e8e":
    case #"hash_cc131451bc90bd5c":
        return "brloot_ammo_919";
    case #"hash_690c0d6a821b42e":
    case #"hash_23209741b93850b5":
        return "brloot_ammo_12g";
    case #"hash_2f2d546c2247838f":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_d4f05e450448c3ec":
        return "brloot_ammo_762";
    case #"hash_6191aaef9f922f96":
    case #"hash_f4b0076c03d93738":
        return "brloot_ammo_50cal";
    case #"hash_c5a1525ba35389fa":
        return "brloot_ammo_rocket";
    }
    println("<dev string:x1c>" + weapon_class + "<dev string:x47>");
    return "brloot_ammo_762";
}

// Namespace namespace_94efe9b48c602c39 / namespace_954524c8d6293cb9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41d
// Size: 0xa6
function function_dbeac47bbdfe2c89(primary_weapon, itembundle, ammoleft) {
    var_fe768d47e57d337a = function_207fcdc93a85aa07(primary_weapon);
    if (isdefined(var_fe768d47e57d337a) && var_fe768d47e57d337a == itembundle.ref) {
        current_ammo = self getweaponammostock(primary_weapon);
        if (current_ammo < primary_weapon.maxammo) {
            var_ae99050519de73b2 = primary_weapon.maxammo - current_ammo;
            var_cb8b543e9d0c0d0d = int(min(ammoleft, var_ae99050519de73b2));
            ammoleft -= var_cb8b543e9d0c0d0d;
            self setweaponammostock(primary_weapon, current_ammo + var_cb8b543e9d0c0d0d);
        }
    }
    return ammoleft;
}

