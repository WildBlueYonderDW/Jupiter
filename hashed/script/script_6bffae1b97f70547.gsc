// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_2669878cf5a1b6bc;
#using script_6bffae1b97f70547;

#namespace namespace_2e04133215e83a48;

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b4
// Size: 0x136
function function_9623157b28098d1() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    flag_init("ammo_mods_ready");
    level.var_1b3072262db80fc1 = [];
    level.var_e090390c16d34b65 = [];
    level.var_a69c3b32e659291a = [];
    level.var_1b3072262db80fc1["none"] = spawnstruct();
    level.var_1b3072262db80fc1["none"].name = "none";
    level callback::add("player_connect", &function_66f877e287154069);
    level callback::add("player_weapon_change", &function_81650f24bdaebbf6);
    registersharedfunc("zombie", "ammo_mod_cooldown_init", &ammo_mod_cooldown_init);
    registersharedfunc("zombie", "has_ammo_mod", &has_ammo_mod);
    registersharedfunc("zombie", "get_ammo_mod_name", &get_ammo_mod_name);
    flag_set("ammo_mods_ready");
    /#
        level thread function_6f55a7e8fe9f4746();
    #/
    /#
        assertex(isdefined(level.var_1a2b600a06ec21f4.var_4f59eded21c43059), "Create an ammomod bundle asset to use in this gamemode and add to gamemodebundle");
    #/
    level.var_f1240a9ac4f65616 = getscriptbundle("ammomod:" + level.var_1a2b600a06ec21f4.var_4f59eded21c43059);
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params f, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1
// Size: 0x447
function function_7f759db5de1b44b0(var_509909a6c0371efa, var_49acfea1433dc914, percentage, var_a6cb110617906bb1, cooldown_time_entity, cooldown_time_attacker, cooldown_time_global, occurs_on_death, result_func, damage_feedback_icon, damage_feedback_sound, validation_func, element, var_ba6c8434012a2654, var_f253123a174ef757) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    /#
        assert(isdefined(var_509909a6c0371efa), "ammo_mod::register_ammo_mod(): name must be defined");
    #/
    /#
        assert("none" != var_509909a6c0371efa, "ammo_mod::register_ammo_mod(): name cannot be 'none', that name is reserved as an internal sentinel value");
    #/
    /#
        assert(!isdefined(level.var_1b3072262db80fc1[var_509909a6c0371efa]), "ammo_mod::register_ammo_mod(): Ammo Mod '" + var_509909a6c0371efa + "' has already been registered");
    #/
    /#
        assert(isdefined(percentage), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': percentage must be defined");
    #/
    /#
        assert(0 <= percentage && 1 > percentage, "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': percentage must be a value greater than or equal to 0 and less than 1");
    #/
    /#
        assert(isdefined(cooldown_time_entity), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': cooldown_time_entity must be defined");
    #/
    /#
        assert(0 <= cooldown_time_entity, "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': cooldown_time_entity must be a value greater than or equal to 0");
    #/
    /#
        assert(isdefined(cooldown_time_entity), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': cooldown_time_attacker must be defined");
    #/
    /#
        assert(0 <= cooldown_time_entity, "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': cooldown_time_attacker must be a value greater than or equal to 0");
    #/
    /#
        assert(isdefined(cooldown_time_global), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': cooldown_time_global must be defined");
    #/
    /#
        assert(0 <= cooldown_time_global, "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': cooldown_time_global must be a value greater than or equal to 0");
    #/
    /#
        assert(isdefined(occurs_on_death), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': occurs_on_death must be defined");
    #/
    /#
        assert(isdefined(result_func), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': result_func must be defined");
    #/
    /#
        assert(isdefined(damage_feedback_icon), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': damage_feedback_icon must be defined");
    #/
    /#
        assert(isstring(damage_feedback_icon), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': damage_feedback_icon must be a string");
    #/
    /#
        assert(isdefined(damage_feedback_sound), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': damage_feedback_sound must be defined");
    #/
    /#
        assert(isstring(damage_feedback_sound), "aat::register_ammo_mod(): AAT '" + var_509909a6c0371efa + "': damage_feedback_sound must be a string");
    #/
    level.var_1b3072262db80fc1[var_509909a6c0371efa] = spawnstruct();
    level.var_1b3072262db80fc1[var_509909a6c0371efa].name = var_509909a6c0371efa;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].id = var_49acfea1433dc914;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].percentage = percentage;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].var_a6cb110617906bb1 = var_a6cb110617906bb1;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].cooldown_time_entity = cooldown_time_entity;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].cooldown_time_attacker = cooldown_time_attacker;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].cooldown_time_global = cooldown_time_global;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].cooldown_time_global_start = 0;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].occurs_on_death = occurs_on_death;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].result_func = result_func;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].damage_feedback_icon = damage_feedback_icon;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].damage_feedback_sound = damage_feedback_sound;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].validation_func = validation_func;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].immune_trigger = [];
    level.var_1b3072262db80fc1[var_509909a6c0371efa].immune_result_direct = [];
    level.var_1b3072262db80fc1[var_509909a6c0371efa].immune_result_indirect = [];
    level.var_1b3072262db80fc1[var_509909a6c0371efa].var_ba6c8434012a2654 = var_ba6c8434012a2654;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].var_f253123a174ef757 = var_f253123a174ef757;
    level.var_1b3072262db80fc1[var_509909a6c0371efa].element = element;
    function_53c4c53197386572(level.var_6bab2b30ec5ad7e1, []);
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd3f
// Size: 0xc7
function private function_eba55122e11c8f35(weapon) {
    var_362a3a0a1e485bf6 = undefined;
    var_ddf3519d2b3daa73 = weapon;
    if (istrue(weapon.isalternate)) {
        var_ddf3519d2b3daa73 = weapon getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == weapon || var_e8b54d8a9deac064.weapon == var_ddf3519d2b3daa73)) {
            var_362a3a0a1e485bf6 = var_e8b54d8a9deac064.var_509909a6c0371efa;
        }
    }
    return var_362a3a0a1e485bf6;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0x16f
function function_352659ff5187d66d(var_419e24dbc44963ed) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    if (!isplayer(var_419e24dbc44963ed.eattacker)) {
        return;
    }
    var_9c408b337e8416d0 = var_419e24dbc44963ed.idamage > self.health;
    function_5a96f5a116c2b46e(var_9c408b337e8416d0, var_419e24dbc44963ed.einflictor, var_419e24dbc44963ed.eattacker, var_419e24dbc44963ed.idamage, var_419e24dbc44963ed.idflags, var_419e24dbc44963ed.smeansofdeath, var_419e24dbc44963ed.sweapon, var_419e24dbc44963ed.vpoint, var_419e24dbc44963ed.vdir, var_419e24dbc44963ed.shitloc, var_419e24dbc44963ed.timeoffset, var_419e24dbc44963ed.modelindex, var_419e24dbc44963ed.partname, var_419e24dbc44963ed.objweapon);
    var_362a3a0a1e485bf6 = var_419e24dbc44963ed.eattacker function_eba55122e11c8f35(var_419e24dbc44963ed.sweapon);
    if (isdefined(var_362a3a0a1e485bf6) && var_9c408b337e8416d0) {
        if (isdefined(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].var_ba6c8434012a2654) && var_9c408b337e8416d0) {
            self thread [[ level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].var_ba6c8434012a2654 ]](var_419e24dbc44963ed.idamage, var_419e24dbc44963ed.eattacker, var_419e24dbc44963ed.sweapon);
        }
    }
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x539
function function_5a96f5a116c2b46e(death, einflictor, eattacker, idamage, idflags, mod, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!function_efdce4b346c97324(eattacker) || !isdefined(eattacker.var_2e04133215e83a48) || !isdefined(sweapon)) {
        return 0;
    }
    if (mod != "MOD_PISTOL_BULLET" && mod != "MOD_RIFLE_BULLET" && mod != "MOD_GRENADE" && mod != "MOD_PROJECTILE" && mod != "MOD_EXPLOSIVE" && mod != "MOD_IMPACT" && mod != "MOD_MELEE") {
        return 0;
    }
    if (isdefined(level.var_fa6563c6f00a1ef1) && mod == "MOD_MELEE") {
        if (![[ level.var_fa6563c6f00a1ef1 ]](sweapon)) {
            return 0;
        }
    }
    if (isdefined(einflictor) && isplayer(einflictor) && !isdefined(einflictor.var_2e04133215e83a48)) {
        return 0;
    }
    var_362a3a0a1e485bf6 = eattacker function_eba55122e11c8f35(sweapon);
    if (!isdefined(var_362a3a0a1e485bf6)) {
        return 0;
    }
    if (istrue(death) && !istrue(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].occurs_on_death)) {
        return 0;
    }
    if (!isdefined(self.basearchetype)) {
        return 0;
    }
    if (istrue(self.var_b9527ed408c69385)) {
        return 0;
    }
    if (ent_flag("turned")) {
        return 0;
    }
    if (istrue(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_trigger[self.basearchetype])) {
        return 0;
    }
    now = gettime() / 1000;
    if (isdefined(level.var_c51f26733d1d1d84)) {
        if (self [[ level.var_c51f26733d1d1d84 ]](var_362a3a0a1e485bf6, now, eattacker)) {
            return 0;
        }
    } else {
        var_d54958eb0301d644 = 0;
        /#
            if (getdvarint(@"hash_52dae5d17f82ce51", 0)) {
                var_d54958eb0301d644 = 1;
            }
        #/
        if (!var_d54958eb0301d644 && isdefined(self.var_1b9bba89a566cb5f) && now <= self.var_1b9bba89a566cb5f[var_362a3a0a1e485bf6] + level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].cooldown_time_entity) {
            return 0;
        }
        if (!var_d54958eb0301d644 && now <= eattacker.var_1b9bba89a566cb5f[var_362a3a0a1e485bf6] + level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].cooldown_time_attacker) {
            return 0;
        }
        if (!var_d54958eb0301d644 && now <= level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].cooldown_time_global_start + level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].cooldown_time_global) {
            return 0;
        }
    }
    if (isdefined(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].validation_func)) {
        if (![[ level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].validation_func ]]()) {
            return 0;
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
        percentage = level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].var_a6cb110617906bb1;
    } else {
        percentage = level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].percentage;
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
        return 0;
    }
    level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].cooldown_time_global_start = now;
    eattacker.var_1b9bba89a566cb5f[var_362a3a0a1e485bf6] = now;
    self thread [[ level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].result_func ]](death, eattacker, mod, sweapon, vpoint, shitloc, modelindex);
    var_d27680ff86693f5c = spawnstruct();
    var_d27680ff86693f5c.var_2632b2da60d34841 = var_362a3a0a1e485bf6;
    var_d27680ff86693f5c.var_19560ec564499c6c = 0;
    var_d27680ff86693f5c.zombie = self;
    if (isdefined(self.aicategory) && self.aicategory == "special") {
        var_d27680ff86693f5c.var_19560ec564499c6c = 1;
    }
    eattacker callback::callback("ammomod_proc", var_d27680ff86693f5c);
    if (isplayer(eattacker)) {
        eattacker playlocalsound("uin_ammomod_proc_to_player_2d");
    }
    return 1;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c5
// Size: 0x18e
function function_6c40f58b29a952a9(weapon, var_362a3a0a1e485bf6, var_3d61bd5c1fd55131) {
    if (!isdefined(var_3d61bd5c1fd55131)) {
        var_3d61bd5c1fd55131 = 1;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    /#
        assert(isdefined(weapon), "ammo_mod::add_ammo_mod_to_weapon(): weapon must be defined");
    #/
    if (is_exempt_weapon(weapon)) {
        return;
    }
    if (isdefined(var_362a3a0a1e485bf6)) {
        /#
            assert(isdefined(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6]), "ammo mod '" + var_362a3a0a1e485bf6 + "' was never registered");
        #/
        if (!has_ammo_mod(weapon)) {
            var_e8b54d8a9deac064 = spawnstruct();
            var_e8b54d8a9deac064.weapon = weapon getnoaltweapon();
            var_e8b54d8a9deac064.var_509909a6c0371efa = var_362a3a0a1e485bf6;
            self.var_2e04133215e83a48 = array_add(self.var_2e04133215e83a48, var_e8b54d8a9deac064);
        } else {
            weapon = weapon getnoaltweapon();
            foreach (i, var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
                if (var_e8b54d8a9deac064.weapon == weapon) {
                    self.var_2e04133215e83a48[i].var_509909a6c0371efa = var_362a3a0a1e485bf6;
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

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165a
// Size: 0xeb
function function_b4da81e43557ada1(weapon, var_3d61bd5c1fd55131) {
    if (!isdefined(var_3d61bd5c1fd55131)) {
        var_3d61bd5c1fd55131 = 1;
    }
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    /#
        assert(isdefined(weapon), "ammo_mod::remove_ammo_mod_from_weapon(): weapon must be defined");
    #/
    weapon = weapon getnoaltweapon();
    var_225a577cbeda65c2 = weapon.var_9d7facbe889e667c;
    foreach (i, var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
        if (var_e8b54d8a9deac064.weapon == weapon) {
            self.var_2e04133215e83a48 = array_remove(self.var_2e04133215e83a48, self.var_2e04133215e83a48[i]);
        }
    }
    if (var_3d61bd5c1fd55131) {
        self setclientomnvar("ui_pap_current_ammomod", 0);
    }
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x174c
// Size: 0x13
function private function_81650f24bdaebbf6(params) {
    function_f645fcd5bf711882();
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1766
// Size: 0x77
function private function_f645fcd5bf711882(weapon) {
    weapon = function_53c4c53197386572(weapon, self getcurrentweapon());
    var_6e60559721c5abee = undefined;
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        var_6e60559721c5abee = namespace_dc2e59577d3a271f::get_ammo_mod_name(weapon);
    }
    if (isdefined(var_6e60559721c5abee)) {
        self setclientomnvar("ui_pap_current_ammomod", function_53c4c53197386572(level.var_1b3072262db80fc1[var_6e60559721c5abee].id, 0));
    } else {
        self setclientomnvar("ui_pap_current_ammomod", 0);
    }
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e4
// Size: 0x7a
function function_66f877e287154069(params) {
    self.var_2e04133215e83a48 = [];
    self.var_1b9bba89a566cb5f = [];
    foreach (key, v in level.var_1b3072262db80fc1) {
        self.var_1b9bba89a566cb5f[key] = 0;
    }
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1865
// Size: 0x2f
function function_efdce4b346c97324(entity) {
    if (isdefined(entity) && (isplayer(entity) || istrue(entity.var_d419fad5b3e4517b))) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189c
// Size: 0x3d
function is_exempt_weapon(weapon) {
    var_225a577cbeda65c2 = weapon.var_9d7facbe889e667c;
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return 0;
    }
    return isdefined(level.var_e090390c16d34b65[var_225a577cbeda65c2]);
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e1
// Size: 0x5d
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
    if (istrue(function_6faaa2882e3d2e4e(weapon))) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1946
// Size: 0x75
function ammo_mod_cooldown_init() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    self.var_1b9bba89a566cb5f = [];
    foreach (key, v in level.var_1b3072262db80fc1) {
        self.var_1b9bba89a566cb5f[key] = 0;
    }
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19c2
// Size: 0x165
function register_immunity(var_362a3a0a1e485bf6, archetype, immune_trigger, immune_result_direct, immune_result_indirect) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    /#
        assert(isdefined(var_362a3a0a1e485bf6), "ammo_mod::register_immunity(): name must be defined");
    #/
    /#
        assert(isdefined(archetype), "ammo_mod::register_immunity(): archetype must be defined");
    #/
    /#
        assert(isdefined(immune_trigger), "ammo_mod::register_immunity(): immune_trigger must be defined");
    #/
    /#
        assert(isdefined(immune_result_direct), "ammo_mod::register_immunity(): immune_result_direct must be defined");
    #/
    /#
        assert(isdefined(immune_result_indirect), "ammo_mod::register_immunity(): immune_result_indirect must be defined");
    #/
    if (!isdefined(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_trigger)) {
        level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_trigger = [];
    }
    if (!isdefined(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_result_direct)) {
        level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_result_direct = [];
    }
    if (!isdefined(level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_result_indirect)) {
        level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_result_indirect = [];
    }
    level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_trigger[archetype] = immune_trigger;
    level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_result_direct[archetype] = immune_result_direct;
    level.var_1b3072262db80fc1[var_362a3a0a1e485bf6].immune_result_indirect[archetype] = immune_result_indirect;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2e
// Size: 0x28
function register_aat_exemption(var_88260bb1ed608124) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level.var_e090390c16d34b65[var_88260bb1ed608124] = 1;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5d
// Size: 0xdd
function has_ammo_mod(w_current) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return 0;
    }
    if (isplayer(self) && isdefined(self.var_2e04133215e83a48) && isdefined(w_current)) {
        var_ddf3519d2b3daa73 = w_current;
        if (istrue(w_current.isalternate)) {
            var_ddf3519d2b3daa73 = w_current getnoaltweapon();
        }
        foreach (var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
            if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == var_ddf3519d2b3daa73)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c42
// Size: 0xd9
function function_60ade27585bef67(w_current, var_362a3a0a1e485bf6) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return 0;
    }
    var_ddf3519d2b3daa73 = w_current;
    if (istrue(w_current.isalternate)) {
        var_ddf3519d2b3daa73 = w_current getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == var_ddf3519d2b3daa73) && var_e8b54d8a9deac064.var_509909a6c0371efa == var_362a3a0a1e485bf6) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d23
// Size: 0xf3
function function_10839073a33f4feb(w_current) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return int(0);
    }
    var_ddf3519d2b3daa73 = w_current;
    if (istrue(w_current.isalternate)) {
        var_ddf3519d2b3daa73 = w_current getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == var_ddf3519d2b3daa73)) {
            var_509909a6c0371efa = var_e8b54d8a9deac064.var_509909a6c0371efa;
            return level.var_1b3072262db80fc1[var_509909a6c0371efa].id;
        }
    }
    return int(0);
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1e
// Size: 0xd1
function get_ammo_mod_name(w_current) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return "";
    }
    var_ddf3519d2b3daa73 = w_current;
    if (istrue(w_current.isalternate)) {
        var_ddf3519d2b3daa73 = w_current getnoaltweapon();
    }
    foreach (var_e8b54d8a9deac064 in self.var_2e04133215e83a48) {
        if (isdefined(var_e8b54d8a9deac064.weapon) && (var_e8b54d8a9deac064.weapon == w_current || var_e8b54d8a9deac064.weapon == var_ddf3519d2b3daa73)) {
            return var_e8b54d8a9deac064.var_509909a6c0371efa;
        }
    }
    return "";
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef7
// Size: 0xa6
function function_bd988da177969d52(id) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return "";
    }
    if (!isdefined(id) || id == 0) {
        return "";
    }
    foreach (var_362a3a0a1e485bf6, var_2e04133215e83a48 in level.var_1b3072262db80fc1) {
        if (isdefined(var_2e04133215e83a48.id) && var_2e04133215e83a48.id == id) {
            return var_362a3a0a1e485bf6;
        }
    }
    return "";
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa5
// Size: 0x8e
function function_2373b67af9c1cfc0(name) {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return 0;
    }
    if (!isdefined(name) || name == "") {
        return 0;
    }
    foreach (var_362a3a0a1e485bf6, var_2e04133215e83a48 in level.var_1b3072262db80fc1) {
        if (name == var_362a3a0a1e485bf6) {
            return var_2e04133215e83a48.id;
        }
    }
    return 0;
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x203b
// Size: 0x6c
function function_3275fc3cab7a7a32() {
    /#
        if (getdvarfloat(@"hash_46a29d9f01b6b83d", 0) > 0) {
            setdvar(@"hash_46a29d9f01b6b83d", 0);
        } else {
            setdvar(@"hash_46a29d9f01b6b83d", 0.99);
        }
        iprintlnbold("': damage_feedback_sound must be a string" + getdvarfloat(@"hash_46a29d9f01b6b83d", 0));
    #/
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ae
// Size: 0x57
function function_b9f455f8500b002e() {
    /#
        if (getdvarint(@"hash_52dae5d17f82ce51", 0)) {
            setdvar(@"hash_52dae5d17f82ce51", 0);
        } else {
            setdvar(@"hash_52dae5d17f82ce51", 1);
        }
        iprintlnbold("<unknown string>" + getdvarint(@"hash_52dae5d17f82ce51", 0));
    #/
}

// Namespace namespace_2e04133215e83a48/namespace_dc2e59577d3a271f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x210c
// Size: 0x47
function function_6f55a7e8fe9f4746() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3275fc3cab7a7a32, 0);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b9f455f8500b002e, 0);
        function_fe953f000498048f();
    #/
}

