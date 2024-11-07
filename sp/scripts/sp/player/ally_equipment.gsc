#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\engine\math.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\loot.gsc;

#namespace namespace_68728a7c04d69134;

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x473
// Size: 0xd
function ally_equipment_init() {
    precachemodel("un_military_backpack_01");
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x488
// Size: 0x510
function ally_equipment_backpack(ally, var_6f9f720f49e07bb0, amount, var_8c37bcb12e8ca715) {
    ally ally_equipment_remove();
    level.player endon("death");
    ally endon("death");
    ally endon("remove_ally_equipment");
    flag_msg = undefined;
    rpg = 0;
    var_c9c9b235995c8d1e = %SHARED_HINTSTRINGS/AMMO_PICKUP;
    icon = undefined;
    flag_msg = undefined;
    var_6f9f720f49e07bb0 = default_to(var_6f9f720f49e07bb0, "flash_full");
    var_13115a914e8ca5ce = 1;
    ally.support_equipment_disabled = default_to(ally.support_equipment_disabled, 0);
    if (!isdefined(ally.var_8c37bcb12e8ca715)) {
        ally.var_8c37bcb12e8ca715 = default_to(var_8c37bcb12e8ca715, 1);
    }
    if (istrue(ally.var_8c37bcb12e8ca715)) {
        ally.attached_model = default_to(ally.attached_model, "un_military_backpack_01");
        ally.var_1ae907b1366dd253 = default_to(ally.var_1ae907b1366dd253, (10, 7, 8));
        ally.var_eac248c2afa119 = default_to(ally.var_eac248c2afa119, (-7, 5, -6));
        ally.var_66d195592de5a634 = default_to(ally.var_66d195592de5a634, (0, 90, 90));
        ally.var_25650bf958716989 = default_to(ally.var_25650bf958716989, "j_spine4");
        ally.var_8690ca1f0d153417 = default_to(ally.var_8690ca1f0d153417, 1);
    }
    switch (var_6f9f720f49e07bb0) {
    case #"hash_a68c414683465b09":
        icon = "hud_icon_equipment_flash";
        flag_msg = "flash_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/FLASH_BR;
        break;
    case #"hash_d8f795eb14c75e6":
        icon = "hud_icon_equipment_smoke";
        flag_msg = "smoke_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/SMOKE;
        break;
    case #"hash_d675a16354a5298":
        icon = "hud_icon_equipment_smoke";
        flag_msg = "smoke_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/SMOKE;
        break;
    case #"hash_a8e4a914fb03a4d5":
        icon = "hud_icon_equipment_frag";
        flag_msg = "frag_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/FRAG_BR;
        break;
    case #"hash_c9a436974fe60919":
        icon = "hud_icon_equipment_molotov";
        flag_msg = "molotov_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/MOLOTOV_BR;
        break;
    case #"hash_fa1e80f6bd5b8e72":
        var_6f9f720f49e07bb0 = "c4_sp";
    case #"hash_56a97e9cc12c06d4":
        icon = "hud_icon_equipment_c4";
        flag_msg = "c4_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/C4;
        break;
    case #"hash_515260130b210bff":
    case #"hash_9d57562863499a06":
    case #"hash_bfabb834c595ff16":
    case #"hash_ed185ef2530ec2b1":
        var_6f9f720f49e07bb0 = "at_mine_sp";
    case #"hash_ab4a2e8160d2c3d":
    case #"hash_5e638d3145315dd8":
        icon = "hud_icon_equipment_at_mine";
        flag_msg = "mine_full";
        var_c9c9b235995c8d1e = %EQUIPMENT/AT_MINE;
        break;
    case #"hash_ee5a421e18a58c0f":
        flag_msg = "ammo_full";
    case #"hash_6470111e4b773e43":
        flag_msg = "ammo_all";
    case #"hash_b780a36f890d44b5":
        flag_msg = "ammo_current";
        icon = "hud_icon_ammo";
        var_13115a914e8ca5ce = 0;
        break;
    case #"hash_6bbd731e4f43eb76":
        flag_msg = "ammo_current";
        icon = "hud_icon_ammo";
        var_13115a914e8ca5ce = 0;
        break;
    case #"hash_6470091e4b7731ab":
        flag_msg = "ammo_alt";
        icon = "hud_icon_loot_ammo_40mmgrenade";
        var_c9c9b235995c8d1e = %WEAPON/GL_M203;
        var_13115a914e8ca5ce = 0;
        break;
    case #"hash_16f8a4115fdfa32a":
    case #"hash_390ba811ad3f09bc":
    case #"hash_cf1462f7b03a4799":
        icon = "hud_icon_ammo_rocket";
        flag_msg = "rpg_full";
        rpg = 1;
        var_c9c9b235995c8d1e = %WEAPON/AMMO_POOL_LAUNCHER;
        var_13115a914e8ca5ce = 0;
        break;
    default:
        return;
    }
    if (var_13115a914e8ca5ce) {
        assert(scripts\sp\equipment\offhands::offhandisprecached(var_6f9f720f49e07bb0));
        ally.support_equipment = default_to(amount, 4);
    } else {
        ally.support_equipment = default_to(amount, 1);
    }
    if (isdefined(ally.attached_model)) {
        ally.var_94c25faa82591b05 = ally spawn_tag_origin(ally gettagorigin(ally.var_25650bf958716989), (0, 0, 0));
        ally.var_94c25faa82591b05 dontinterpolate();
        ally.var_94c25faa82591b05 linkto(ally, ally.var_25650bf958716989, ally.var_eac248c2afa119, ally.var_66d195592de5a634);
        ally.var_94c25faa82591b05 setmodel(ally.attached_model);
        ally.var_94c25faa82591b05 show();
    }
    childthread ally_equipment_backpack_interact(ally, var_6f9f720f49e07bb0, icon, flag_msg, var_c9c9b235995c8d1e);
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a0
// Size: 0x103
function function_a51aea67738798e1(ally) {
    if (!isdefined(ally.var_5b1cbdbeba360fef)) {
        ally.var_5b1cbdbeba360fef = spawn_tag_origin((0, 0, 0), (0, 0, 0));
        ally.var_5b1cbdbeba360fef dontinterpolate();
        if (isdefined(ally.var_94c25faa82591b05)) {
            ally.var_5b1cbdbeba360fef linkto(ally.var_94c25faa82591b05, "tag_origin", default_to(ally.var_1ae907b1366dd253, (0, 12, 0)), (0, 45, 0));
            return;
        }
        ally.var_5b1cbdbeba360fef linkto(ally, "j_spine4", default_to(ally.var_1ae907b1366dd253, (0, 12, 0)), ally gettagangles("j_spine4") + (90, 90, 90));
    }
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xaab
// Size: 0x264
function ally_equipment_backpack_interact(ally, var_6f9f720f49e07bb0, icon, flag_msg, var_c9c9b235995c8d1e) {
    function_a51aea67738798e1(ally);
    for (;;) {
        while (istrue(ally.support_equipment_disabled) || function_7dbb09ffa524d01c() || function_d1e56b2427928d7b(ally)) {
            waitframe();
        }
        var_3619f00a65ff1269 = default_to(ally.var_3619f00a65ff1269, 75);
        var_e974e658fb7adde6 = default_to(ally.var_e974e658fb7adde6, 200);
        ally.var_5b1cbdbeba360fef create_cursor_hint("tag_origin", (0, 0, 0), var_c9c9b235995c8d1e, 40, var_e974e658fb7adde6, var_3619f00a65ff1269, ally.var_8690ca1f0d153417, undefined, undefined, icon, "duration_none", undefined, undefined, 30, 120);
        result = level.player waittill_any_ents_return(ally.var_5b1cbdbeba360fef, "trigger", ally.var_5b1cbdbeba360fef, "support_equipment_disabled", level, "support_equipment_disabled");
        if (result == "support_equipment_disabled" || istrue(ally.support_equipment_disabled)) {
            ally.var_5b1cbdbeba360fef remove_cursor_hint();
        } else {
            if (getdvar(@"hash_1d835d6f15184c6b") == "autobuild") {
                dlog_recordevent("sp_ally_equipment", ["type", flag_msg, "levelname", level.script, "x", level.player.origin[0], "y", level.player.origin[1], "z", level.player.origin[2], "checkpoint", level.start_point, "ally", ally.script_friendname]);
            }
            ally.var_d7d251c81168fe2b = gettime();
            ally ally_equipment_think(flag_msg, var_6f9f720f49e07bb0);
            if (ally.support_equipment == 0) {
                ally ally_equipment_remove();
                break;
            }
        }
        waitframe();
    }
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd17
// Size: 0x48
function function_d1e56b2427928d7b(ally) {
    if (istrue(ally.var_8c9f79c94446e918)) {
        return false;
    }
    if (isdefined(ally.var_d7d251c81168fe2b) && gettime() - ally.var_d7d251c81168fe2b < 20000) {
        return true;
    }
    return false;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd68
// Size: 0x296
function ally_equipment_think(flag_msg, var_6f9f720f49e07bb0) {
    if (issubstr(var_6f9f720f49e07bb0, "ammo")) {
        function_d6ced30303d5f7a5(1);
        var_d389c316fcfe5dff = 0;
        if (var_6f9f720f49e07bb0 == "ammo_alt") {
            weapons = level.player getweaponslistprimaries();
            var_d389c316fcfe5dff = function_f9983dfe5cdfd0d2(weapons, var_d389c316fcfe5dff);
        } else if (var_6f9f720f49e07bb0 == "ammo_all" || var_6f9f720f49e07bb0 == "ammo_bag") {
            weapons = level.player getweaponslistall();
            var_d389c316fcfe5dff = function_3063b842afeb3c2f(weapons, var_d389c316fcfe5dff);
        } else if (var_6f9f720f49e07bb0 == "ammo_current") {
            currentweapon = level.player getcurrentweapon();
            var_d389c316fcfe5dff = function_3063b842afeb3c2f([currentweapon], var_d389c316fcfe5dff);
        } else {
            weapons = level.player.primaryweapons;
            var_d389c316fcfe5dff = function_3063b842afeb3c2f(weapons, var_d389c316fcfe5dff);
        }
        if (!var_d389c316fcfe5dff) {
            return;
        }
        function_33ee1aeb13f82406();
    } else {
        var_de8a9ead75a0581 = level.player getammocount(var_6f9f720f49e07bb0);
        maxammo = weaponmaxammo(var_6f9f720f49e07bb0);
        diff = maxammo - var_de8a9ead75a0581;
        if (var_de8a9ead75a0581 == maxammo) {
            function_d6ced30303d5f7a5(0);
            return;
        }
        function_d6ced30303d5f7a5(1);
        if (flag_msg == "rpg_full") {
            level.player givemaxammo(var_6f9f720f49e07bb0);
            level.player switchtoweapon(var_6f9f720f49e07bb0);
            level.player setweaponammoclip(var_6f9f720f49e07bb0, weaponclipsize(var_6f9f720f49e07bb0));
            function_33ee1aeb13f82406();
        } else {
            var_e56a188d1825c45b = level.player function_2d5903b6e5981438(var_6f9f720f49e07bb0);
            var_1fa6fa16414dbc09 = undefined;
            if (isdefined(var_e56a188d1825c45b)) {
                var_1fa6fa16414dbc09 = level.player getammocount(var_e56a188d1825c45b);
            }
            if (self.support_equipment < 0) {
                var_29b65713c058661f = 4;
            } else if (diff <= self.support_equipment) {
                var_29b65713c058661f = diff + var_de8a9ead75a0581;
            } else {
                var_29b65713c058661f = self.support_equipment + var_de8a9ead75a0581;
            }
            if (self.support_equipment > 0) {
                self.support_equipment -= diff;
            }
            level.player give_offhand(var_6f9f720f49e07bb0, var_29b65713c058661f);
            level.player notify("equipment_given");
            thread scripts\sp\loot::createnotification(var_6f9f720f49e07bb0);
            if (isdefined(var_e56a188d1825c45b)) {
                thread ally_equipment_backpack(self, var_e56a188d1825c45b.basename, var_1fa6fa16414dbc09);
            }
        }
    }
    wait 1;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1006
// Size: 0x25
function function_33ee1aeb13f82406() {
    if (self.support_equipment > 0) {
        self.support_equipment -= 1;
    }
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1033
// Size: 0xbb
function function_2d5903b6e5981438(var_6f9f720f49e07bb0) {
    var_67e18444a629499a = 1;
    weapon = undefined;
    foreach (weapon in self.offhandinventory) {
        if (weapon.basename == var_6f9f720f49e07bb0) {
            var_67e18444a629499a = 0;
        }
    }
    if (istrue(var_67e18444a629499a)) {
        if (scripts\sp\equipment\offhands::getweaponoffhandtype(weapon) == "primaryoffhand") {
            var_6c85c3860ab378b3 = "secondaryoffhand";
        } else {
            var_6c85c3860ab378b3 = "primaryoffhand";
        }
        var_e56a188d1825c45b = self getcurrentoffhand(var_6c85c3860ab378b3);
        return var_e56a188d1825c45b;
    }
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10f6
// Size: 0x143
function function_3063b842afeb3c2f(weapons, var_d389c316fcfe5dff) {
    foreach (weapon in weapons) {
        var_de8a9ead75a0581 = level.player getammocount(weapon) - weapon.clipsize;
        max_ammo = weaponmaxammo(weapon);
        if (var_de8a9ead75a0581 > weapon.maxammo + weapon.clipsize) {
            var_fb3e4293192537ea = 0 - weapon.clipsize;
            foreach (weapon in level.player.primaryweapons) {
                var_fb3e4293192537ea += weaponmaxammo(weapon);
            }
            if (var_de8a9ead75a0581 >= var_fb3e4293192537ea) {
                continue;
            }
        } else if (var_de8a9ead75a0581 >= max_ammo) {
            continue;
        }
        var_d389c316fcfe5dff = 1;
        level.player givemaxammo(weapon);
    }
    return var_d389c316fcfe5dff;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1242
// Size: 0xbe
function function_f9983dfe5cdfd0d2(weapons, var_d389c316fcfe5dff) {
    foreach (weaponobj in weapons) {
        if (weaponobj.hasalternate) {
            var_6890a4ce965bba99 = weaponobj getaltweapon();
            var_de8a9ead75a0581 = level.player getammocount(var_6890a4ce965bba99);
            max_ammo = weaponmaxammo(var_6890a4ce965bba99);
            if (var_de8a9ead75a0581 >= max_ammo) {
                continue;
            }
            level.player givemaxammo(var_6890a4ce965bba99);
            var_d389c316fcfe5dff = 1;
        }
    }
    return var_d389c316fcfe5dff;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1309
// Size: 0x22b
function function_7dbb09ffa524d01c() {
    if (isdefined(level.var_6356b636336eac83)) {
        return [[ level.var_6356b636336eac83 ]]();
    }
    foreach (weapon in level.player.offhandinventory) {
        if (!isdefined(weapon.maxammo)) {
            continue;
        }
        var_de8a9ead75a0581 = level.player getammocount(weapon);
        if (var_de8a9ead75a0581 < weapon.maxammo) {
            return 0;
        }
    }
    foreach (weapon in level.player.primaryweapons) {
        if (isdefined(weapon.hasalternate)) {
            var_6890a4ce965bba99 = weapon getaltweapon();
            var_3c60aef0715062b8 = weaponaltweaponname(weapon);
            if (var_6890a4ce965bba99.maxammo > 0 && !issubstr(var_3c60aef0715062b8, "select")) {
                var_de8a9ead75a0581 = level.player getammocount(var_6890a4ce965bba99);
                if (var_de8a9ead75a0581 < var_6890a4ce965bba99.maxammo) {
                    return 0;
                }
            }
        }
        var_de8a9ead75a0581 = level.player getammocount(weapon);
        if (var_de8a9ead75a0581 < weapon.maxammo) {
            return 0;
        }
        if (var_de8a9ead75a0581 > weapon.maxammo + weapon.clipsize) {
            var_fb3e4293192537ea = 0 - weapon.clipsize;
            foreach (weapon in level.player.primaryweapons) {
                var_fb3e4293192537ea += weaponmaxammo(weapon);
            }
            if (var_de8a9ead75a0581 < var_fb3e4293192537ea) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x153d
// Size: 0x8b
function function_d6ced30303d5f7a5(var_d1876e602e68ce82) {
    if (var_d1876e602e68ce82) {
        level.player player_gesture_force("iw9_ges_pickup");
        wait 0.3;
        level.player playsound("loot_pickup_offhand");
        level.player playrumbleonentity("damage_heavy");
        return;
    }
    level.player forceplaygestureviewmodel("iw9_ges_pickup");
    wait 0.75;
    level.player stopgestureviewmodel("iw9_ges_pickup", 0.5);
    wait 3;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15d0
// Size: 0x2b
function ally_increase_equipment(ally, ammount) {
    ammount = default_to(ammount, 1);
    ally.support_equipment = ammount;
}

// Namespace namespace_68728a7c04d69134 / scripts\sp\player\ally_equipment
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1603
// Size: 0x6b
function ally_equipment_remove() {
    if (isdefined(self.var_5b1cbdbeba360fef)) {
        self.var_5b1cbdbeba360fef notify("trigger");
        self.var_5b1cbdbeba360fef thread remove_cursor_hint();
    }
    if (isdefined(self.support_equipment)) {
        self.support_equipment = 0;
    }
    if (isdefined(self.var_94c25faa82591b05)) {
        self.var_94c25faa82591b05 delete();
    }
    self notify("remove_ally_equipment");
}

