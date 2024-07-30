#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;
#using script_4f794fb0bc50676b;
#using script_669f1da0d61f1ffa;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2d425a56b4025faa;

#namespace namespace_97a798e7cca1750b;

// Namespace namespace_97a798e7cca1750b / namespace_49687fb9a060bf03
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x15d
// Size: 0x21
function private autoexec __init__system__() {
    system::register(#"hash_ea7a2affe351ac7", #"ww_setup", &pre_main, undefined);
}

// Namespace namespace_97a798e7cca1750b / namespace_49687fb9a060bf03
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x186
// Size: 0x18
function private pre_main() {
    utility::registersharedfunc("ww_setup", "init", &init);
}

// Namespace namespace_97a798e7cca1750b / namespace_49687fb9a060bf03
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a6
// Size: 0x311
function private init() {
    level.var_f1339ee09ea219d8 = [];
    level.var_f1339ee09ea219d8 = array_add(level.var_f1339ee09ea219d8, "jup_pi_raygun_mp");
    level.var_f1339ee09ea219d8 = array_add(level.var_f1339ee09ea219d8, "jup_ar_dg2_mp");
    level.var_c16493593d07b88f = [];
    level.var_c16493593d07b88f = array_add(level.var_c16493593d07b88f, "jup_pi_raygun_mp");
    level.var_c16493593d07b88f = array_add(level.var_c16493593d07b88f, "jup_ar_dg2_mp");
    level.var_517ae1797c9e1995 = &function_517ae1797c9e1995;
    level.var_99a0ddbdeb40f977 = [];
    level.var_99a0ddbdeb40f977["jup_pi_raygun_mp"] = &function_3d68d8ff8bafc637;
    level.var_5287f18049ad084 = [];
    level.var_5287f18049ad084[0] = spawnstruct();
    level.var_5287f18049ad084[0].impact_damage = 1000;
    level.var_5287f18049ad084[0].var_22cd43fdb2005800 = 300;
    level.var_5287f18049ad084[0].var_b819eb69b7bd32d5 = 1500;
    level.var_5287f18049ad084[0].var_812a118beadac588 = 1200;
    level.var_5287f18049ad084[0].damage_scalar = 1;
    level.var_5287f18049ad084[1] = spawnstruct();
    level.var_5287f18049ad084[1].impact_damage = 1500;
    level.var_5287f18049ad084[1].var_22cd43fdb2005800 = 600;
    level.var_5287f18049ad084[1].var_b819eb69b7bd32d5 = 2000;
    level.var_5287f18049ad084[1].var_812a118beadac588 = 1400;
    level.var_5287f18049ad084[1].damage_scalar = 1.5;
    level.var_5287f18049ad084[2] = spawnstruct();
    level.var_5287f18049ad084[2].impact_damage = 3000;
    level.var_5287f18049ad084[2].var_22cd43fdb2005800 = 1200;
    level.var_5287f18049ad084[2].var_b819eb69b7bd32d5 = 3000;
    level.var_5287f18049ad084[2].var_812a118beadac588 = 1800;
    level.var_5287f18049ad084[2].damage_scalar = 3;
    level.var_5287f18049ad084[3] = spawnstruct();
    level.var_5287f18049ad084[3].impact_damage = 5000;
    level.var_5287f18049ad084[3].var_22cd43fdb2005800 = 2400;
    level.var_5287f18049ad084[3].var_b819eb69b7bd32d5 = 5000;
    level.var_5287f18049ad084[3].var_812a118beadac588 = 2600;
    level.var_5287f18049ad084[3].damage_scalar = 5;
    namespace_f50b7a445cd149bc::init();
}

// Namespace namespace_97a798e7cca1750b / namespace_49687fb9a060bf03
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf
// Size: 0x7d
function function_517ae1797c9e1995(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon) {
    if (isdefined(objweapon)) {
        if (objweapon.basename == "jup_pi_raygun_mp") {
            return 15;
        } else if (objweapon.basename == "monkey_bomb_mp") {
            return int(min(75, idamage));
        }
    }
    return idamage;
}

// Namespace namespace_97a798e7cca1750b / namespace_49687fb9a060bf03
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x545
// Size: 0x210
function function_3d68d8ff8bafc637(dmg_struct) {
    if (is_equal(dmg_struct.smeansofdeath, "MOD_MELEE")) {
        return dmg_struct.idamage;
    }
    var_29a8ba8c9dd43fd2 = undefined;
    if (issharedfuncdefined("zombie", "get_pap_level") && isdefined(dmg_struct.eattacker)) {
        var_29a8ba8c9dd43fd2 = dmg_struct.eattacker function_af5127390d3221e9(dmg_struct.objweapon);
    }
    if (!isdefined(var_29a8ba8c9dd43fd2) || var_29a8ba8c9dd43fd2 == 0) {
        return dmg_struct.idamage;
    }
    if (is_equal(dmg_struct.smeansofdeath, "MOD_PROJECTILE")) {
        splash_damage = dmg_struct.idamage - level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].impact_damage;
        var_a007b35451d483b0 = (splash_damage / level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].damage_scalar - level.var_5287f18049ad084[0].var_22cd43fdb2005800) / level.var_5287f18049ad084[0].var_812a118beadac588 * level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_812a118beadac588 + level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_22cd43fdb2005800;
        return (var_a007b35451d483b0 + level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].impact_damage);
    } else if (is_equal(dmg_struct.smeansofdeath, "MOD_PROJECTILE_SPLASH")) {
        var_a007b35451d483b0 = (dmg_struct.idamage / level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].damage_scalar - level.var_5287f18049ad084[0].var_22cd43fdb2005800) / level.var_5287f18049ad084[0].var_812a118beadac588 * level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_812a118beadac588 + level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_22cd43fdb2005800;
        return var_a007b35451d483b0;
    }
    return dmg_struct.idamage;
}

