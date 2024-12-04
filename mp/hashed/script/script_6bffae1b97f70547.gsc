#using script_2669878cf5a1b6bc;
#using script_6bffae1b97f70547;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace ammo_mod;

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
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
    assertex(isdefined(level.gamemodebundle.var_4f59eded21c43059), "<dev string:x1c>");
    level.var_f1240a9ac4f65616 = getscriptbundle("ammomod:" + level.gamemodebundle.var_4f59eded21c43059);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 15, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc
// Size: 0x446
function function_7f759db5de1b44b0(ammomodname, var_49acfea1433dc914, percentage, special_percentage, cooldown_time_entity, cooldown_time_attacker, cooldown_time_global, occurs_on_death, result_func, damage_feedback_icon, damage_feedback_sound, validation_func, element, var_ba6c8434012a2654, var_f253123a174ef757) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(ammomodname), "<dev string:x70>");
    assert("<dev string:xa7>" != ammomodname, "<dev string:xaf>");
    assert(!isdefined(level.ammo_mods[ammomodname]), "<dev string:x11c>" + ammomodname + "<dev string:x149>");
    assert(isdefined(percentage), "<dev string:x16a>" + ammomodname + "<dev string:x18d>");
    assert(0 <= percentage && 1 > percentage, "<dev string:x16a>" + ammomodname + "<dev string:x1ae>");
    assert(isdefined(cooldown_time_entity), "<dev string:x16a>" + ammomodname + "<dev string:x1fa>");
    assert(0 <= cooldown_time_entity, "<dev string:x16a>" + ammomodname + "<dev string:x225>");
    assert(isdefined(cooldown_time_entity), "<dev string:x16a>" + ammomodname + "<dev string:x26b>");
    assert(0 <= cooldown_time_entity, "<dev string:x16a>" + ammomodname + "<dev string:x298>");
    assert(isdefined(cooldown_time_global), "<dev string:x16a>" + ammomodname + "<dev string:x2e0>");
    assert(0 <= cooldown_time_global, "<dev string:x16a>" + ammomodname + "<dev string:x30b>");
    assert(isdefined(occurs_on_death), "<dev string:x16a>" + ammomodname + "<dev string:x351>");
    assert(isdefined(result_func), "<dev string:x16a>" + ammomodname + "<dev string:x377>");
    assert(isdefined(damage_feedback_icon), "<dev string:x16a>" + ammomodname + "<dev string:x399>");
    assert(isstring(damage_feedback_icon), "<dev string:x16a>" + ammomodname + "<dev string:x3c4>");
    assert(isdefined(damage_feedback_sound), "<dev string:x16a>" + ammomodname + "<dev string:x3f0>");
    assert(isstring(damage_feedback_sound), "<dev string:x16a>" + ammomodname + "<dev string:x41c>");
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
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x80a
// Size: 0xc3
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d6
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
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0xa4c
// Size: 0x53d
function function_5a96f5a116c2b46e(death, einflictor, eattacker, idamage, idflags, mod, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!function_efdce4b346c97324(eattacker) || !isdefined(eattacker.ammo_mod) || !isdefined(sweapon)) {
        return false;
    }
    if (mod != "MOD_PISTOL_BULLET" && mod != "MOD_RIFLE_BULLET" && mod != "MOD_GRENADE" && mod != "MOD_PROJECTILE" && mod != "MOD_EXPLOSIVE" && mod != "MOD_IMPACT" && mod != "MOD_MELEE" && mod != "MOD_EXPLOSIVE_BULLET") {
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
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf92
// Size: 0x18b
function function_6c40f58b29a952a9(weapon, var_362a3a0a1e485bf6, var_3d61bd5c1fd55131) {
    if (!isdefined(var_3d61bd5c1fd55131)) {
        var_3d61bd5c1fd55131 = 1;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(weapon), "<dev string:x449>");
    if (is_exempt_weapon(weapon)) {
        return;
    }
    if (isdefined(var_362a3a0a1e485bf6)) {
        assert(isdefined(level.ammo_mods[var_362a3a0a1e485bf6]), "<dev string:x487>" + var_362a3a0a1e485bf6 + "<dev string:x495>");
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1125
// Size: 0xe8
function function_b4da81e43557ada1(weapon, var_3d61bd5c1fd55131) {
    if (!isdefined(var_3d61bd5c1fd55131)) {
        var_3d61bd5c1fd55131 = 1;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(weapon), "<dev string:x4af>");
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
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1215
// Size: 0x12
function private function_81650f24bdaebbf6(params) {
    function_f645fcd5bf711882();
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x122f
// Size: 0x77
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ae
// Size: 0x78
function function_66f877e287154069(params) {
    self.ammo_mod = [];
    self.var_1b9bba89a566cb5f = [];
    foreach (key, v in level.ammo_mods) {
        self.var_1b9bba89a566cb5f[key] = 0;
    }
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132e
// Size: 0x2e
function function_efdce4b346c97324(entity) {
    if (isdefined(entity) && (isplayer(entity) || istrue(entity.var_d419fad5b3e4517b))) {
        return true;
    }
    return false;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1365
// Size: 0x3d
function is_exempt_weapon(weapon) {
    var_225a577cbeda65c2 = weapon.var_9d7facbe889e667c;
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return false;
    }
    return isdefined(level.var_e090390c16d34b65[var_225a577cbeda65c2]);
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ab
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
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1410
// Size: 0x73
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
// Checksum 0x0, Offset: 0x148b
// Size: 0x164
function register_immunity(var_362a3a0a1e485bf6, archetype, immune_trigger, immune_result_direct, immune_result_indirect) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    assert(isdefined(var_362a3a0a1e485bf6), "<dev string:x4f2>");
    assert(isdefined(archetype), "<dev string:x529>");
    assert(isdefined(immune_trigger), "<dev string:x565>");
    assert(isdefined(immune_result_direct), "<dev string:x5a6>");
    assert(isdefined(immune_result_indirect), "<dev string:x5ed>");
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
// Checksum 0x0, Offset: 0x15f7
// Size: 0x27
function register_aat_exemption(var_88260bb1ed608124) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level.var_e090390c16d34b65[var_88260bb1ed608124] = 1;
}

// Namespace ammo_mod / namespace_dc2e59577d3a271f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1626
// Size: 0xda
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1709
// Size: 0xd6
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e8
// Size: 0xef
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18e0
// Size: 0xce
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19b7
// Size: 0xa4
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a64
// Size: 0x8c
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
    // Checksum 0x0, Offset: 0x1af9
    // Size: 0x6b
    function function_3275fc3cab7a7a32() {
        if (getdvarfloat(@"hash_46a29d9f01b6b83d", 0) > 0) {
            setdvar(@"hash_46a29d9f01b6b83d", 0);
        } else {
            setdvar(@"hash_46a29d9f01b6b83d", 0.99);
        }
        iprintlnbold("<dev string:x636>" + getdvarfloat(@"hash_46a29d9f01b6b83d", 0));
    }

    // Namespace ammo_mod / namespace_dc2e59577d3a271f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b6c
    // Size: 0x56
    function function_b9f455f8500b002e() {
        if (getdvarint(@"hash_52dae5d17f82ce51", 0)) {
            setdvar(@"hash_52dae5d17f82ce51", 0);
        } else {
            setdvar(@"hash_52dae5d17f82ce51", 1);
        }
        iprintlnbold("<dev string:x65c>" + getdvarint(@"hash_52dae5d17f82ce51", 0));
    }

    // Namespace ammo_mod / namespace_dc2e59577d3a271f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bca
    // Size: 0x46
    function function_6f55a7e8fe9f4746() {
        function_6e7290c8ee4f558b("<dev string:x67d>");
        function_a9a864379a098ad6("<dev string:x68e>", "<dev string:x6ae>", &function_3275fc3cab7a7a32, 0);
        function_a9a864379a098ad6("<dev string:x6c6>", "<dev string:x6e3>", &function_b9f455f8500b002e, 0);
        function_fe953f000498048f();
    }

#/
