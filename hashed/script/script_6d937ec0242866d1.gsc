// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_7edf952f8921aa6b;
#using script_398835140857d740;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_6bffae1b97f70547;
#using script_2669878cf5a1b6bc;

#namespace perk_elemental_pop;

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0x3c
function function_1c48a1ed54087b1a(var_1df6de077e30f8c2, var_fe59c44529c721a0) {
    level thread function_f3a23df892bf82f6("specialty_elemental_pop", var_1df6de077e30f8c2, var_fe59c44529c721a0, &function_ce2ae1a55866d69f, &function_c7c84f82dc37b551, 1);
    function_b5e57408c7878df7(&function_d7e4ceb7a0efa76d);
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7
// Size: 0xa
function function_ce2ae1a55866d69f() {
    function_3d3c00faf71112ba();
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8
// Size: 0x2b
function function_c7c84f82dc37b551(b_pause, str_perk, str_result, n_slot) {
    function_a95149aa2feecfbc();
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0xf
function function_3d3c00faf71112ba() {
    function_ab7a3ff9f75e4867("specialty_elemental_pop");
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220
// Size: 0xf
function function_a95149aa2feecfbc() {
    function_fe0d28e6f0008329("specialty_elemental_pop");
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x236
// Size: 0x301
function function_d7e4ceb7a0efa76d(params) {
    damage = params.idamage;
    attacker = params.eattacker;
    if (!function_9504b6ab098fd387(params.smeansofdeath)) {
        return damage;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return damage;
    }
    if (isplayer(attacker)) {
        if (attacker has_perk("specialty_elemental_pop")) {
            attacker.var_ae13f9cff6491601 = function_53c4c53197386572(attacker.var_ae13f9cff6491601, 0);
            chance = function_53c4c53197386572(level.var_a1ad2758fcbd2f5e["specialty_elemental_pop"].var_43b01f92fd35063f, 5);
            cooldown = function_53c4c53197386572(level.var_a1ad2758fcbd2f5e["specialty_elemental_pop"].var_71421e97c27613ba, 15);
            if (function_51d76700600cebe3(chance) && damage > 1 && attacker is_valid_weapon(params.sweapon) && attacker.var_ae13f9cff6491601 + function_a5b14435e3229bed(cooldown) < gettime()) {
                var_9c408b337e8416d0 = damage > self.health;
                str_current = attacker namespace_dc2e59577d3a271f::get_ammo_mod_name(params.sweapon);
                var_e913a21c04857481 = getarraykeys(level.var_1b3072262db80fc1);
                var_e913a21c04857481 = array_remove(var_e913a21c04857481, "none");
                if (isdefined(str_current) && var_e913a21c04857481.size > 1) {
                    var_e913a21c04857481 = array_remove(var_e913a21c04857481, str_current);
                }
                var_a5baf8157010c27a = function_7a2aaa4a09a4d250(var_e913a21c04857481);
                attacker.var_73a10012ece4e6f5 = 1;
                var_1c0f0548e64af397 = namespace_e0ee43ef2dddadaa::buildweapon(level.laststandweapon);
                attacker namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_1c0f0548e64af397, var_a5baf8157010c27a, 0);
                meansofdeath = "MOD_PISTOL_BULLET";
                attacker callback::callback("zm_perk_elemental_pop_proc");
                if (is_equal(self.aicategory, "normal") || is_equal(self.aicategory, "special")) {
                    if (namespace_dc2e59577d3a271f::function_5a96f5a116c2b46e(var_9c408b337e8416d0, params.inflictor, params.eattacker, damage, params.idflags, params.smeansofdeath, var_1c0f0548e64af397, params.vpoint, params.vdir, params.shitloc, params.timeoffset, params.modelindex, params.partname, params.objweapon)) {
                        attacker setscriptablepartstate("elemental_pop_fx", "perk_fx_on", 0);
                        attacker.var_ae13f9cff6491601 = gettime();
                    }
                }
                attacker namespace_dc2e59577d3a271f::function_b4da81e43557ada1(var_1c0f0548e64af397, 0);
                attacker thread unset_aat_override(var_1c0f0548e64af397);
            }
        }
    }
    return damage;
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f
// Size: 0x40
function unset_aat_override(var_1c0f0548e64af397) {
    self endon("death");
    self notify("unset_aat_override");
    self endon("unset_aat_override");
    waitframe();
    self setscriptablepartstate("elemental_pop_fx", "perk_fx_off", 0);
    waitframe();
    self.var_73a10012ece4e6f5 = undefined;
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586
// Size: 0x56
function is_valid_weapon(weapon) {
    if (weapon == level.weaponnone) {
        return 0;
    }
    if (isdefined(weapon.dualwieldweapon) && istrue(weapon.var_d7a3ad08f58ae189)) {
        weapon = weapon.dualwieldweapon;
    }
    if (isprimaryweapon(weapon)) {
        return 1;
    }
    return 0;
}

// Namespace perk_elemental_pop/namespace_a5e5d39b40a1867d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e4
// Size: 0x56
function function_9504b6ab098fd387(str_mod) {
    switch (str_mod) {
    case #"hash_571e46e17a3cf2e3":
    case #"hash_5f1054c48d66fd1c":
    case #"hash_966768b3f0c94767":
    case #"hash_a5123f4d02745600":
        return 1;
    default:
        return 0;
        break;
    }
}

