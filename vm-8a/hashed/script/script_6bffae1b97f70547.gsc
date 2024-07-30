#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_2669878cf5a1b6bc;
#using script_6bffae1b97f70547;

#namespace ammo_mod;

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b4
// Size: 0x135
function function_9623157b28098d1() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    flag_init("ammo_mods_ready");
    level.ammo_mods = [];
    level.var_e090390c16d34b65 = [];
    level.var_a69c3b32e659291a = [];
    level.ammo_mods["none"] = spawnstruct();
    level.ammo_mods["none"].name = "none";
    level callback::add("player_connect", &function_66f877e287154069);
    level callback::add("player_weapon_change", &function_81650f24bdaebbf6);
    registersharedfunc("zombie", "ammo_mod_cooldown_init", &ammo_mod_cooldown_init);
    registersharedfunc("zombie", "has_ammo_mod", &has_ammo_mod);
    registersharedfunc("zombie", "get_ammo_mod_name", &get_ammo_mod_name);
    flag_set("ammo_mods_ready");
    /#
        level thread function_6f55a7e8fe9f4746();
    #/
    assertex(isdefined(level.gamemodebundle.var_4f59eded21c43059), "Create an ammomod bundle asset to use in this gamemode and add to gamemodebundle");
    level.var_f1240a9ac4f65616 = getscriptbundle("ammomod:" + level.gamemodebundle.var_4f59eded21c43059);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1
// Size: 0x446
function function_7f759db5de1b44b0(ammomodname, var_49acfea1433dc914, percentage, special_percentage, cooldown_time_entity, cooldown_time_attacker, cooldown_time_global, occurs_on_death, result_func, damage_feedback_icon, damage_feedback_sound, validation_func, element, var_ba6c8434012a2654, var_f253123a174ef757) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(ammomodname), "ammo_mod::register_ammo_mod(): name must be defined");
    assert("none" != ammomodname, "ammo_mod::register_ammo_mod(): name cannot be 'none', that name is reserved as an internal sentinel value");
    assert(!isdefined(level.ammo_mods[ammomodname]), "ammo_mod::register_ammo_mod(): Ammo Mod '" + ammomodname + "' has already been registered");
    assert(isdefined(percentage), "aat::register_ammo_mod(): AAT '" + ammomodname + "': percentage must be defined");
    assert(0 <= percentage && 1 > percentage, "aat::register_ammo_mod(): AAT '" + ammomodname + "': percentage must be a value greater than or equal to 0 and less than 1");
    assert(isdefined(cooldown_time_entity), "aat::register_ammo_mod(): AAT '" + ammomodname + "': cooldown_time_entity must be defined");
    assert(0 <= cooldown_time_entity, "aat::register_ammo_mod(): AAT '" + ammomodname + "': cooldown_time_entity must be a value greater than or equal to 0");
    assert(isdefined(cooldown_time_entity), "aat::register_ammo_mod(): AAT '" + ammomodname + "': cooldown_time_attacker must be defined");
    assert(0 <= cooldown_time_entity, "aat::register_ammo_mod(): AAT '" + ammomodname + "': cooldown_time_attacker must be a value greater than or equal to 0");
    assert(isdefined(cooldown_time_global), "aat::register_ammo_mod(): AAT '" + ammomodname + "': cooldown_time_global must be defined");
    assert(0 <= cooldown_time_global, "aat::register_ammo_mod(): AAT '" + ammomodname + "': cooldown_time_global must be a value greater than or equal to 0");
    assert(isdefined(occurs_on_death), "aat::register_ammo_mod(): AAT '" + ammomodname + "': occurs_on_death must be defined");
    assert(isdefined(result_func), "aat::register_ammo_mod(): AAT '" + ammomodname + "': result_func must be defined");
    assert(isdefined(damage_feedback_icon), "aat::register_ammo_mod(): AAT '" + ammomodname + "': damage_feedback_icon must be defined");
    assert(isstring(damage_feedback_icon), "aat::register_ammo_mod(): AAT '" + ammomodname + "': damage_feedback_icon must be a string");
    assert(isdefined(damage_feedback_sound), "aat::register_ammo_mod(): AAT '" + ammomodname + "': damage_feedback_sound must be defined");
    assert(isstring(damage_feedback_sound), "aat::register_ammo_mod(): AAT '" + ammomodname + "': damage_feedback_sound must be a string");
    level.ammo_mods[ammomodname] = spawnstruct();
    level.ammo_mods[ammomodname].name = ammomodname;
    level.ammo_mods[ammomodname].id = var_49acfea1433dc914;
    level.ammo_mods[ammomodname].percentage = percentage;
    level.ammo_mods[ammomodname].special_percentage = special_percentage;
    level.ammo_mods[ammomodname].cooldown_time_entity = cooldown_time_entity;
    level.ammo_mods[ammomodname].cooldown_time_attacker = cooldown_time_attacker;
    level.ammo_mods[ammomodname].cooldown_time_global = cooldown_time_global;
    level.ammo_mods[ammomodname].cooldown_time_global_start = 0;
    level.ammo_mods[ammomodname].occurs_on_death = occurs_on_death;
    level.ammo_mods[ammomodname].result_func = result_func;
    level.ammo_mods[ammomodname].damage_feedback_icon = damage_feedback_icon;
    level.ammo_mods[ammomodname].damage_feedback_sound = damage_feedback_sound;
    level.ammo_mods[ammomodname].validation_func = validation_func;
    level.ammo_mods[ammomodname].immune_trigger = [];
    level.ammo_mods[ammomodname].immune_result_direct = [];
    level.ammo_mods[ammomodname].immune_result_indirect = [];
    level.ammo_mods[ammomodname].var_ba6c8434012a2654 = var_ba6c8434012a2654;
    level.ammo_mods[ammomodname].var_f253123a174ef757 = var_f253123a174ef757;
    level.ammo_mods[ammomodname].element = element;
    default_to(level.var_6bab2b30ec5ad7e1, []);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd3f
// Size: 0xc6
function private function_eba55122e11c8f35(weapon) {
    var_362a3a0a1e485bf6 = undefined;
    altweaponoriginal = weapon;
    if (istrue(weapon.isalternate)) {
        altweaponoriginal = weapon getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.ammo_mod) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == weapon || var_e8b54d8a9deac064.weapon == altweaponoriginal)) {
            var_362a3a0a1e485bf6 = var_e8b54d8a9deac064.ammomodname;
        }
    }
    return var_362a3a0a1e485bf6;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0x16e
function function_352659ff5187d66d(damagestruct) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    if (!isplayer(damagestruct.eattacker)) {
        return;
    }
    b_death = damagestruct.idamage > self.health;
    function_5a96f5a116c2b46e(b_death, damagestruct.einflictor, damagestruct.eattacker, damagestruct.idamage, damagestruct.idflags, damagestruct.smeansofdeath, damagestruct.sweapon, damagestruct.vpoint, damagestruct.vdir, damagestruct.shitloc, damagestruct.timeoffset, damagestruct.modelindex, damagestruct.partname, damagestruct.objweapon);
    var_362a3a0a1e485bf6 = damagestruct.eattacker function_eba55122e11c8f35(damagestruct.sweapon);
    if (isdefined(var_362a3a0a1e485bf6) && b_death) {
        if (isdefined(level.ammo_mods[var_362a3a0a1e485bf6].var_ba6c8434012a2654) && b_death) {
            self thread [[ level.ammo_mods[var_362a3a0a1e485bf6].var_ba6c8434012a2654 ]](damagestruct.idamage, damagestruct.eattacker, damagestruct.sweapon);
        }
    }
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x538
function function_5a96f5a116c2b46e(death, einflictor, eattacker, idamage, idflags, mod, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!function_efdce4b346c97324(eattacker) || !isdefined(eattacker.ammo_mod) || !isdefined(sweapon)) {
        return false;
    }
    if (mod != "MOD_PISTOL_BULLET" && mod != "MOD_RIFLE_BULLET" && mod != "MOD_GRENADE" && mod != "MOD_PROJECTILE" && mod != "MOD_EXPLOSIVE" && mod != "MOD_IMPACT" && mod != "MOD_MELEE") {
        return false;
    }
    if (isdefined(level.var_fa6563c6f00a1ef1) && mod == "MOD_MELEE") {
        if (![[ level.var_fa6563c6f00a1ef1 ]](sweapon)) {
            return false;
        }
    }
    if (isdefined(einflictor) && isplayer(einflictor) && !isdefined(einflictor.ammo_mod)) {
        return false;
    }
    var_362a3a0a1e485bf6 = eattacker function_eba55122e11c8f35(sweapon);
    if (!isdefined(var_362a3a0a1e485bf6)) {
        return false;
    }
    if (istrue(death) && !istrue(level.ammo_mods[var_362a3a0a1e485bf6].occurs_on_death)) {
        return false;
    }
    if (!isdefined(self.basearchetype)) {
        return false;
    }
    if (istrue(self.var_b9527ed408c69385)) {
        return false;
    }
    if (ent_flag("turned")) {
        return false;
    }
    if (istrue(level.ammo_mods[var_362a3a0a1e485bf6].immune_trigger[self.basearchetype])) {
        return false;
    }
    now = gettime() / 1000;
    if (isdefined(level.var_c51f26733d1d1d84)) {
        if (self [[ level.var_c51f26733d1d1d84 ]](var_362a3a0a1e485bf6, now, eattacker)) {
            return false;
        }
    } else {
        var_d54958eb0301d644 = 0;
        /#
            if (getdvarint(@"hash_52dae5d17f82ce51", 0)) {
                var_d54958eb0301d644 = 1;
            }
        #/
        if (!var_d54958eb0301d644 && isdefined(self.var_1b9bba89a566cb5f) && now <= self.var_1b9bba89a566cb5f[var_362a3a0a1e485bf6] + level.ammo_mods[var_362a3a0a1e485bf6].cooldown_time_entity) {
            return false;
        }
        if (!var_d54958eb0301d644 && now <= eattacker.var_1b9bba89a566cb5f[var_362a3a0a1e485bf6] + level.ammo_mods[var_362a3a0a1e485bf6].cooldown_time_attacker) {
            return false;
        }
        if (!var_d54958eb0301d644 && now <= level.ammo_mods[var_362a3a0a1e485bf6].cooldown_time_global_start + level.ammo_mods[var_362a3a0a1e485bf6].cooldown_time_global) {
            return false;
        }
    }
    if (isdefined(level.ammo_mods[var_362a3a0a1e485bf6].validation_func)) {
        if (![[ level.ammo_mods[var_362a3a0a1e485bf6].validation_func ]]()) {
            return false;
        }
    }
    success = 0;
    reroll_icon = undefined;
    var_207306346a548632 = 1;
    percentage = 0;
    if (self.aicategory == "elite" || self.aicategory == "boss") {
        var_207306346a548632 = 0;
        percentage = 0;
    } else if (self.aicategory == "special") {
        percentage = level.ammo_mods[var_362a3a0a1e485bf6].special_percentage;
    } else {
        percentage = level.ammo_mods[var_362a3a0a1e485bf6].percentage;
    }
    if (istrue(var_207306346a548632) && isdefined(level.var_a69c3b32e659291a[var_362a3a0a1e485bf6])) {
        if (level.var_a69c3b32e659291a[var_362a3a0a1e485bf6] < percentage) {
            percentage = level.var_a69c3b32e659291a[var_362a3a0a1e485bf6];
        }
    }
    if (istrue(var_207306346a548632) && isdefined(eattacker.var_73a10012ece4e6f5)) {
        percentage = eattacker.var_73a10012ece4e6f5;
    }
    /#
        var_742896d6094322ae = getdvarfloat(@"hash_46a29d9f01b6b83d", 0);
        if (istrue(var_207306346a548632) && var_742896d6094322ae > 0) {
            percentage = var_742896d6094322ae;
        }
    #/
    if (percentage >= randomfloat(1)) {
        success = 1;
    }
    if (!success) {
        return false;
    }
    level.ammo_mods[var_362a3a0a1e485bf6].cooldown_time_global_start = now;
    eattacker.var_1b9bba89a566cb5f[var_362a3a0a1e485bf6] = now;
    self thread [[ level.ammo_mods[var_362a3a0a1e485bf6].result_func ]](death, eattacker, mod, sweapon, vpoint, shitloc, modelindex);
    sparams = spawnstruct();
    sparams.var_2632b2da60d34841 = var_362a3a0a1e485bf6;
    sparams.var_19560ec564499c6c = 0;
    sparams.zombie = self;
    if (isdefined(self.aicategory) && self.aicategory == "special") {
        sparams.var_19560ec564499c6c = 1;
    }
    eattacker callback::callback("ammomod_proc", sparams);
    if (isplayer(eattacker)) {
        eattacker playlocalsound("uin_ammomod_proc_to_player_2d");
    }
    return true;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c5
// Size: 0x18d
function function_6c40f58b29a952a9(weapon, var_362a3a0a1e485bf6, var_3d61bd5c1fd55131) {
    if (!isdefined(var_3d61bd5c1fd55131)) {
        var_3d61bd5c1fd55131 = 1;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(weapon), "ammo_mod::add_ammo_mod_to_weapon(): weapon must be defined");
    if (is_exempt_weapon(weapon)) {
        return;
    }
    if (isdefined(var_362a3a0a1e485bf6)) {
        assert(isdefined(level.ammo_mods[var_362a3a0a1e485bf6]), "ammo mod '" + var_362a3a0a1e485bf6 + "' was never registered");
        if (!has_ammo_mod(weapon)) {
            var_e8b54d8a9deac064 = spawnstruct();
            var_e8b54d8a9deac064.weapon = weapon getnoaltweapon();
            var_e8b54d8a9deac064.ammomodname = var_362a3a0a1e485bf6;
            self.ammo_mod = array_add(self.ammo_mod, var_e8b54d8a9deac064);
        } else {
            weapon = weapon getnoaltweapon();
            foreach (i, var_e8b54d8a9deac064 in self.ammo_mod) {
                if (var_e8b54d8a9deac064.weapon == weapon) {
                    self.ammo_mod[i].ammomodname = var_362a3a0a1e485bf6;
                }
            }
        }
        params = spawnstruct();
        params.player = self;
        params.var_362a3a0a1e485bf6 = var_362a3a0a1e485bf6;
        callback::callback("ammo_mod_equipped", params);
        if (var_3d61bd5c1fd55131) {
            function_f645fcd5bf711882();
        }
        self notify("ammo_mod_acquired");
    }
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165a
// Size: 0xea
function function_b4da81e43557ada1(weapon, var_3d61bd5c1fd55131) {
    if (!isdefined(var_3d61bd5c1fd55131)) {
        var_3d61bd5c1fd55131 = 1;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(weapon), "ammo_mod::remove_ammo_mod_from_weapon(): weapon must be defined");
    weapon = weapon getnoaltweapon();
    var_225a577cbeda65c2 = weapon.var_9d7facbe889e667c;
    foreach (i, var_e8b54d8a9deac064 in self.ammo_mod) {
        if (var_e8b54d8a9deac064.weapon == weapon) {
            self.ammo_mod = array_remove(self.ammo_mod, self.ammo_mod[i]);
        }
    }
    if (var_3d61bd5c1fd55131) {
        self setclientomnvar("ui_pap_current_ammomod", 0);
    }
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x174c
// Size: 0x12
function private function_81650f24bdaebbf6(params) {
    function_f645fcd5bf711882();
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1766
// Size: 0x76
function private function_f645fcd5bf711882(weapon) {
    weapon = default_to(weapon, self getcurrentweapon());
    var_6e60559721c5abee = undefined;
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        var_6e60559721c5abee = namespace_dc2e59577d3a271f::get_ammo_mod_name(weapon);
    }
    if (isdefined(var_6e60559721c5abee)) {
        self setclientomnvar("ui_pap_current_ammomod", default_to(level.ammo_mods[var_6e60559721c5abee].id, 0));
        return;
    }
    self setclientomnvar("ui_pap_current_ammomod", 0);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e4
// Size: 0x79
function function_66f877e287154069(params) {
    self.ammo_mod = [];
    self.var_1b9bba89a566cb5f = [];
    foreach (key, v in level.ammo_mods) {
        self.var_1b9bba89a566cb5f[key] = 0;
    }
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1865
// Size: 0x2e
function function_efdce4b346c97324(entity) {
    if (isdefined(entity) && (isplayer(entity) || istrue(entity.var_d419fad5b3e4517b))) {
        return true;
    }
    return false;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189c
// Size: 0x3c
function is_exempt_weapon(weapon) {
    var_225a577cbeda65c2 = weapon.var_9d7facbe889e667c;
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return false;
    }
    return isdefined(level.var_e090390c16d34b65[var_225a577cbeda65c2]);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e1
// Size: 0x5c
function function_6a22621172a35366(weapon) {
    if (is_exempt_weapon(weapon)) {
        return 0;
    }
    if (istrue(iskillstreakweapon(weapon))) {
        return 0;
    }
    if (weapon.ismelee && isdefined(level.var_fa6563c6f00a1ef1)) {
        return [[ level.var_fa6563c6f00a1ef1 ]](weapon);
    }
    if (istrue(iswonderweapon(weapon))) {
        return 0;
    }
    return 1;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1946
// Size: 0x74
function ammo_mod_cooldown_init() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    self.var_1b9bba89a566cb5f = [];
    foreach (key, v in level.ammo_mods) {
        self.var_1b9bba89a566cb5f[key] = 0;
    }
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19c2
// Size: 0x164
function register_immunity(var_362a3a0a1e485bf6, archetype, immune_trigger, immune_result_direct, immune_result_indirect) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(var_362a3a0a1e485bf6), "ammo_mod::register_immunity(): name must be defined");
    assert(isdefined(archetype), "ammo_mod::register_immunity(): archetype must be defined");
    assert(isdefined(immune_trigger), "ammo_mod::register_immunity(): immune_trigger must be defined");
    assert(isdefined(immune_result_direct), "ammo_mod::register_immunity(): immune_result_direct must be defined");
    assert(isdefined(immune_result_indirect), "ammo_mod::register_immunity(): immune_result_indirect must be defined");
    if (!isdefined(level.ammo_mods[var_362a3a0a1e485bf6].immune_trigger)) {
        level.ammo_mods[var_362a3a0a1e485bf6].immune_trigger = [];
    }
    if (!isdefined(level.ammo_mods[var_362a3a0a1e485bf6].immune_result_direct)) {
        level.ammo_mods[var_362a3a0a1e485bf6].immune_result_direct = [];
    }
    if (!isdefined(level.ammo_mods[var_362a3a0a1e485bf6].immune_result_indirect)) {
        level.ammo_mods[var_362a3a0a1e485bf6].immune_result_indirect = [];
    }
    level.ammo_mods[var_362a3a0a1e485bf6].immune_trigger[archetype] = immune_trigger;
    level.ammo_mods[var_362a3a0a1e485bf6].immune_result_direct[archetype] = immune_result_direct;
    level.ammo_mods[var_362a3a0a1e485bf6].immune_result_indirect[archetype] = immune_result_indirect;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2e
// Size: 0x27
function register_aat_exemption(var_88260bb1ed608124) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level.var_e090390c16d34b65[var_88260bb1ed608124] = 1;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5d
// Size: 0xdc
function has_ammo_mod(w_current) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return false;
    }
    if (isplayer(self) && isdefined(self.ammo_mod) && isdefined(w_current)) {
        altweaponoriginal = w_current;
        if (istrue(w_current.isalternate)) {
            altweaponoriginal = w_current getnoaltweapon();
        }
        foreach (var_e8b54d8a9deac064 in self.ammo_mod) {
            if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == altweaponoriginal)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c42
// Size: 0xd8
function function_60ade27585bef67(w_current, var_362a3a0a1e485bf6) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return false;
    }
    altweaponoriginal = w_current;
    if (istrue(w_current.isalternate)) {
        altweaponoriginal = w_current getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.ammo_mod) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == altweaponoriginal) && var_e8b54d8a9deac064.ammomodname == var_362a3a0a1e485bf6) {
            return true;
        }
    }
    return false;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d23
// Size: 0xf2
function function_10839073a33f4feb(w_current) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return int(0);
    }
    altweaponoriginal = w_current;
    if (istrue(w_current.isalternate)) {
        altweaponoriginal = w_current getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.ammo_mod) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == altweaponoriginal)) {
            ammomodname = var_e8b54d8a9deac064.ammomodname;
            return level.ammo_mods[ammomodname].id;
        }
    }
    return int(0);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1e
// Size: 0xd0
function get_ammo_mod_name(w_current) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return "";
    }
    altweaponoriginal = w_current;
    if (istrue(w_current.isalternate)) {
        altweaponoriginal = w_current getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.ammo_mod) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == altweaponoriginal)) {
            return var_e8b54d8a9deac064.ammomodname;
        }
    }
    return "";
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef7
// Size: 0xa5
function function_bd988da177969d52(id) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return "";
    }
    if (!isdefined(id) || id == 0) {
        return "";
    }
    foreach (var_362a3a0a1e485bf6, ammo_mod in level.ammo_mods) {
        if (isdefined(ammo_mod.id) && ammo_mod.id == id) {
            return var_362a3a0a1e485bf6;
        }
    }
    return "";
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa5
// Size: 0x8d
function function_2373b67af9c1cfc0(name) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return 0;
    }
    if (!isdefined(name) || name == "") {
        return 0;
    }
    foreach (var_362a3a0a1e485bf6, ammo_mod in level.ammo_mods) {
        if (name == var_362a3a0a1e485bf6) {
            return ammo_mod.id;
        }
    }
    return 0;
}

/#

    // Namespace ammo_mod / namespace_dc2e59577d3a271f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x203b
    // Size: 0x6b
    function function_3275fc3cab7a7a32() {
        if (getdvarfloat(@"hash_46a29d9f01b6b83d", 0) > 0) {
            setdvar(@"hash_46a29d9f01b6b83d", 0);
        } else {
            setdvar(@"hash_46a29d9f01b6b83d", 0.99);
        }
        iprintlnbold("<dev string:x1c>" + getdvarfloat(@"hash_46a29d9f01b6b83d", 0));
    }

    // Namespace ammo_mod / namespace_dc2e59577d3a271f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20ae
    // Size: 0x56
    function function_b9f455f8500b002e() {
        if (getdvarint(@"hash_52dae5d17f82ce51", 0)) {
            setdvar(@"hash_52dae5d17f82ce51", 0);
        } else {
            setdvar(@"hash_52dae5d17f82ce51", 1);
        }
        iprintlnbold("<dev string:x3f>" + getdvarint(@"hash_52dae5d17f82ce51", 0));
    }

    // Namespace ammo_mod / namespace_dc2e59577d3a271f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x210c
    // Size: 0x46
    function function_6f55a7e8fe9f4746() {
        function_6e7290c8ee4f558b("<dev string:x5d>");
        function_a9a864379a098ad6("<dev string:x6b>", "<dev string:x88>", &function_3275fc3cab7a7a32, 0);
        function_a9a864379a098ad6("<dev string:x9d>", "<dev string:xb7>", &function_b9f455f8500b002e, 0);
        function_fe953f000498048f();
    }

#/
