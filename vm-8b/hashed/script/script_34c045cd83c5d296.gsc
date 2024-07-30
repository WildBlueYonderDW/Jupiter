#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\utility\weapon.gsc;

#namespace full_ammo;

// Namespace full_ammo / namespace_70f20e4aa77900
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x143
// Size: 0x1c
function autoexec main() {
    if (getdvarint(@"hash_39efbbcf50eaa5", 0)) {
        return;
    }
    function_ad0467999b7de308();
}

// Namespace full_ammo / namespace_70f20e4aa77900
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167
// Size: 0x5f
function function_ad0467999b7de308() {
    register_powerup("full_ammo", &grab_full_ammo, &function_c826b28f14f58267, &modify_drop_chance);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2f>", "<dev string:x4e>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x71>", "<dev string:x90>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace full_ammo / namespace_70f20e4aa77900
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce
// Size: 0x82
function grab_full_ammo(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player give_ammo();
        player thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2(str_powerup);
    }
    level notify("zmb_max_ammo_level");
}

// Namespace full_ammo / namespace_70f20e4aa77900
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x45
function function_c826b28f14f58267() {
    if (utility::issharedfuncdefined("powerup_full_ammo", "should_drop")) {
        return utility::function_f3bb4f4911a1beb2("powerup_full_ammo", "should_drop");
    }
    root = function_ecdae672c660149e();
    return root.var_34d5d13b703a35c9 == 0;
}

// Namespace full_ammo / namespace_70f20e4aa77900
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0x3a
function modify_drop_chance(chance, context) {
    if (utility::issharedfuncdefined("powerup_full_ammo", "modify_drop_chance")) {
        return utility::function_f3bb4f4911a1beb2("powerup_full_ammo", "modify_drop_chance", chance, context);
    }
    return chance;
}

// Namespace full_ammo / namespace_70f20e4aa77900
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e9
// Size: 0x140
function give_ammo() {
    if (utility::issharedfuncdefined("powerup_full_ammo", "give_ammo")) {
        utility::function_f3bb4f4911a1beb2("powerup_full_ammo", "give_ammo");
        return;
    }
    weapons = self getweaponslistprimaries();
    foreach (weapon in weapons) {
        self givemaxammo(weapon);
        n_clip_current = self getweaponammoclip(weapon);
        n_clip_max = weaponclipsize(weapon);
        if (n_clip_current < n_clip_max) {
            if (scripts\mp\utility\weapon::isakimbo(weapon)) {
                self setweaponammoclip(weapon, weaponclipsize(weapon), "left");
                self setweaponammoclip(weapon, weaponclipsize(weapon), "right");
            } else {
                self setweaponammoclip(weapon, weaponclipsize(weapon));
            }
        }
        if (istrue(weapon.hasalternate)) {
            var_6890a4ce965bba99 = weapon getaltweapon();
            self givemaxammo(var_6890a4ce965bba99);
            n_clip_current = self getweaponammoclip(var_6890a4ce965bba99);
            n_clip_max = weaponclipsize(var_6890a4ce965bba99);
            if (n_clip_current < n_clip_max) {
                self setweaponammoclip(var_6890a4ce965bba99, weaponclipsize(var_6890a4ce965bba99));
            }
        }
    }
    self notify("zmb_max_ammo");
}

