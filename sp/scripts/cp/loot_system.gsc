#using script_2669878cf5a1b6bc;
#using script_531cb1be084314f7;
#using script_600b944a95c3a7bf;
#using script_644c18834356d9dc;
#using script_66122a002aff5d57;
#using script_74502a9e0ef1f19c;
#using script_7c40fa80892a721;
#using script_7ef95bba57dc4b82;
#using scripts\common\utility;
#using scripts\cp\cp_hud_message;
#using scripts\cp\cp_outline_utility;
#using scripts\cp\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\gasmask;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\scriptable;
#using scripts\engine\utility;

#namespace loot_system;

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2a
// Size: 0x104
function init_loot() {
    level.disable_loot_drop = 1;
    level.active_loot_spots = [];
    level.assault_weapons_array = ["brloot_weapon_ak47", "brloot_weapon_famas", "brloot_weapon_m4", "brloot_weapon_mcx"];
    level.lmg_weapons_array = ["brloot_weapon_hk121", "brloot_weapon_pkm"];
    level.smg_weapons_array = ["brloot_weapon_aug", "brloot_weapon_mp5", "brloot_weapon_mp7", "brloot_weapon_p90"];
    level.shotgun_weapons_array = ["brloot_weapon_dp12", "brloot_weapon_m870"];
    level.sniper_weapons_array = ["brloot_weapon_as50", "brloot_weapon_kar98", "brloot_weapon_m14", "brloot_weapon_marlin"];
    level.pistol_weapons_array = ["brloot_weapon_g21", "brloot_weapon_python"];
    thread init_loot_scriptables();
    function_f3a7a75259866102();
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd36
// Size: 0x1f
function init_loot_scriptables() {
    level thread function_308763512997d07f();
    scripts\engine\scriptable::scriptable_addusedcallback(&loot_pickup);
    thread function_136bf6bcbf6c4cad();
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5d
// Size: 0x169
function function_136bf6bcbf6c4cad() {
    flag_wait("level_ready_for_script");
    flag_wait("player_spawned_with_loadout");
    var_264f37205942494f = getentarray("armor_restock", "targetname");
    foreach (refill_station in var_264f37205942494f) {
        plate_structs = getstructarray(refill_station.target, "targetname");
        refill_station.outline = scripts\cp\cp_outline_utility::outlineenableforall(refill_station, "shimmer_default", "level_script");
        refill_station.var_539eab42d5d1d18d = [];
        foreach (struct in plate_structs) {
            var_f892df7411a89d4c = spawnscriptable("brloot_armor_plate", struct.origin, struct.angles);
            var_f892df7411a89d4c setscriptablepartstate("brloot_armor_plate", "visible_no_use");
            var_f892df7411a89d4c disablescriptableplayeruse(level.player);
            refill_station.var_539eab42d5d1d18d[refill_station.var_539eab42d5d1d18d.size] = var_f892df7411a89d4c;
        }
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xece
// Size: 0x4cf
function loot_pickup(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (isdefined(instance.type) && instance.type == "armor_plate_restock_cp") {
        var_1cd29382d1867470 = player namespace_f8d3520d3483c1::function_600f6cf462e983f();
        var_a81adeb0e1f89320 = player namespace_f8d3520d3483c1::function_47320a25b8ee003();
        if (var_1cd29382d1867470 >= var_a81adeb0e1f89320) {
            player scripts\cp\cp_hud_message::showerrormessage("MP_INGAME_ONLY/ARMOR_RESTOCK_STOCK_FULL");
            return 0;
        }
        if (getdvarint(@"hash_da81381074863c6e", 1)) {
            if (!isdefined(instance.var_5e55631c4d45e890)) {
                instance.var_5e55631c4d45e890 = 5;
            }
            if (!isdefined(instance.var_973d7ce9abb3844e)) {
                instance.var_973d7ce9abb3844e = 0;
            }
        }
        var_6633986c5ebf1e8 = var_a81adeb0e1f89320 - var_1cd29382d1867470;
        if (var_6633986c5ebf1e8 > 3) {
            var_6633986c5ebf1e8 = 3;
        }
        if (getdvarint(@"hash_da81381074863c6e", 1)) {
            if (var_6633986c5ebf1e8 > instance.var_5e55631c4d45e890) {
                var_6633986c5ebf1e8 = instance.var_5e55631c4d45e890;
            }
        }
        var_e6ab079a55858647 = spawnstruct();
        var_e6ab079a55858647.scriptablename = "brloot_armor_plate";
        var_e6ab079a55858647.count = 0;
        player namespace_6250b14b3f614101::takeequipmentpickup(var_e6ab079a55858647, 0, undefined, undefined);
        if (var_1cd29382d1867470 < var_a81adeb0e1f89320) {
            player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(var_6633986c5ebf1e8);
        }
        if (getdvarint(@"hash_da81381074863c6e", 1)) {
            instance.var_973d7ce9abb3844e += var_6633986c5ebf1e8;
            instance.var_5e55631c4d45e890 -= var_6633986c5ebf1e8;
        }
        if (getdvarint(@"hash_da81381074863c6e", 1)) {
            for (i = 0; i < var_6633986c5ebf1e8; i++) {
                var_d2259bbc51d8d87 = scripts\engine\utility::function_350e192b13bea45c(instance.entity.var_539eab42d5d1d18d);
                var_d2259bbc51d8d87 setscriptablepartstate("brloot_armor_plate", "hidden");
                temp_array = array_remove_index(instance.entity.var_539eab42d5d1d18d, instance.entity.var_539eab42d5d1d18d.size - 1);
                instance.var_973d7ce9abb3844e -= 3;
                instance.entity.var_539eab42d5d1d18d = temp_array;
            }
        }
        player thread namespace_6250b14b3f614101::player_play_pickup_anim();
        instance thread function_df1c9968b5cbf288(player, 1);
        if (getdvarint(@"hash_da81381074863c6e", 1)) {
            if (instance.var_5e55631c4d45e890 <= 0) {
                instance disablescriptableplayeruse(player);
                instance setscriptablepartstate("armor_plate_restock", "USEABLE_OFF");
                scripts\cp\cp_outline_utility::outlinedisable(instance.entity.outline, instance.entity);
                instance.entity notify("offhand_box_kill");
            }
        }
        level notify("supplies_used", player);
        return;
    }
    if (state == "visible" || state == "visible_sublte_outline" || state == "visible_no_outline") {
        result = give_loot_based_on_pickup(part, player);
        if (istrue(result)) {
            level thread loot_on_pickup_success(instance, part, state, player);
            if (isdefined(instance.crate_num)) {
                if (isdefined(level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9)) {
                    crate_ent = level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9;
                    var_1bff94731f4cf31d = level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9.unused_pickups;
                    if (isdefined(var_1bff94731f4cf31d)) {
                        level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9.unused_pickups = level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9.unused_pickups - 1;
                        if (level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9.unused_pickups <= 0) {
                            crate_ent notify("crate_usable");
                            level.var_ccdd82907b113c40[instance.crate_num].var_a86f5d2ba9afbf9.unused_pickups = 0;
                        }
                    }
                }
            }
        }
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x13a5
// Size: 0x57
function private function_df1c9968b5cbf288(player, wait_time) {
    player endon("disconnect");
    self disablescriptableplayeruse(player);
    if (!isdefined(wait_time)) {
        wait_time = 90;
    }
    override_time = getdvarint(@"hash_a97dd1a639fa9ee5");
    if (override_time > 0) {
        wait_time = override_time;
    }
    wait wait_time;
    self enablescriptableplayeruse(player);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1404
// Size: 0x146
function loot_on_pickup_success(instance, part, state, player) {
    var_47674c5fdaa404e4 = strtok(part, "_");
    loot_type = var_47674c5fdaa404e4[1];
    var_831ae682a7c552bd = var_47674c5fdaa404e4[2];
    player playsoundtoplayer("scavenger_pack_pickup", player);
    instance setscriptablepartstate(part, "hidden");
    level notify("pickedupweapon_kill_callout_" + instance.type + instance.origin);
    level notify("pickedup_loot_success", instance.type, player, instance);
    if (loot_type == "munition") {
        if (function_240f7f4e57340e8f()) {
            player thread namespace_6250b14b3f614101::function_630bb1e4fdf27c6c();
            return;
        }
        boxmodel = spawn("script_model", instance.origin);
        boxmodel setmodel("offhand_wm_supportbox_killstreak");
        boxmodel.angles = instance.angles;
        boxmodel setscriptablepartstate("effects", "plant");
        boxmodel setscriptablepartstate("anims", "open");
        player thread scripts\cp\utility::playerplaypickupanim("iw9_ges_pickup");
        wait 1;
        boxmodel delete();
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1552
// Size: 0x35e
function give_loot_based_on_pickup(part, player) {
    var_47674c5fdaa404e4 = strtok(part, "_");
    loot_type = var_47674c5fdaa404e4[1];
    var_831ae682a7c552bd = var_47674c5fdaa404e4[2];
    result = 0;
    switch (loot_type) {
    case #"hash_db521e4972a48a9d":
        lootid = namespace_38b993c4618e76cd::getlootidfromref(part);
        result = function_1791c1e8974e9bd7(player, lootid, 1);
        break;
    case #"hash_55425b6c36803a4c":
        break;
    case #"hash_cfb0c3041d1bdc10":
        if (part == "jup_exgm_force_recon_keypad_code") {
            break;
        }
    case #"hash_dcbfe1b308421be9":
    case #"hash_f731f17ca0fe624f":
        break;
    case #"hash_27124c6c97ccffa1":
        result = give_ammo_from_scavenged_weapon(part, player);
        break;
    case #"hash_bae7f8af16c34da8":
        if (function_240f7f4e57340e8f()) {
            break;
        } else {
            result = give_munition(part, player);
            break;
        }
    case #"hash_59b8e9d05b31ff9":
    case #"hash_1cc92bad632fbc15":
    case #"hash_25789111b74943b4":
    case #"hash_2d1403e602f082a4":
    case #"hash_4059066c2be514e6":
    case #"hash_5c57b61aa79410db":
    case #"hash_723175e1d432ccef":
    case #"hash_7b0c576c4a7e4890":
    case #"hash_bf5597954aaed3d7":
    case #"hash_e534fd8ec73eafb4":
    case #"hash_ee5a421e18a58c0f":
    case #"hash_f2ed8a54cbe19f9b":
        break;
    case #"hash_b5028789f5b468d7":
        break;
    case #"hash_2c35334f040dba73":
        result = give_equipment(var_831ae682a7c552bd, player);
        break;
    case #"hash_4d63389017f81514":
        if (!function_240f7f4e57340e8f()) {
            player namespace_4fb9dddfb8c1a67a::giveequipment("equip_rock", "primary");
        }
        break;
    case #"hash_10174da3698669e3":
        if (isdefined(level.var_aa7bbd29dbf244d7)) {
            var_a81adeb0e1f89320 = namespace_f8d3520d3483c1::function_47320a25b8ee003();
            var_364d691b501cd27f = namespace_f8d3520d3483c1::function_600f6cf462e983f();
            var_687d4b05cfa572cc = var_a81adeb0e1f89320 - var_364d691b501cd27f;
            player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(level.var_aa7bbd29dbf244d7);
        } else if (part == "brloot_plate_pouch") {
            if (!istrue(player.hasplatepouch)) {
                player.hasplatepouch = 1;
            }
            var_a81adeb0e1f89320 = player namespace_f8d3520d3483c1::function_47320a25b8ee003();
            var_364d691b501cd27f = player namespace_f8d3520d3483c1::function_600f6cf462e983f();
            var_2f7b6d2030d5b87a = int(var_a81adeb0e1f89320 - var_364d691b501cd27f);
            if (var_2f7b6d2030d5b87a <= 0) {
                return 0;
            } else {
                player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(var_2f7b6d2030d5b87a);
                return 1;
            }
        } else {
            player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(3);
            return 1;
        }
        break;
    case #"hash_1cac65e1b8bf24a7":
        if (part == "brloot_killstreak_recondrone") {
            if (isdefined(get_empty_munition_slot(player))) {
                return 1;
            } else {
                return 0;
            }
        }
        break;
    case #"hash_8499464a48c4e157":
        if (level.gametype == "dungeons") {
            break;
        }
    default:
        assertmsg("^1 Loot " + part + " unsupported type <" + loot_type + ">. As its type <" + loot_type + "> is derived from loot name, add the type to this give_loot_based_on_pickup() function OR please verify with the Loot Tables (cp_loot_item_defs.csv and cp_loot_set.csv) ");
        return result;
    }
    return result;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18b9
// Size: 0x327
function give_munition(part, player) {
    var_47674c5fdaa404e4 = strtok(part, "_");
    name_string = "";
    if (isdefined(var_47674c5fdaa404e4[2]) && var_47674c5fdaa404e4[2] == "jup") {
        start = 3;
    } else {
        start = 2;
    }
    for (i = start; i < var_47674c5fdaa404e4.size; i++) {
        if (isdefined(var_47674c5fdaa404e4[i])) {
            if (name_string == "") {
                name_string += var_47674c5fdaa404e4[i];
                continue;
            }
            name_string = name_string + "_" + var_47674c5fdaa404e4[i];
        }
    }
    var_6e1ec6f2c0ee6b2c = undefined;
    total_slots = player getplayerdata("cp", "inventorySlots", "totalSlots");
    if (total_slots < 4) {
        var_6e1ec6f2c0ee6b2c = total_slots;
    } else {
        var_6e1ec6f2c0ee6b2c = player.dpad_selection_index - 1;
    }
    empty_slot = get_empty_munition_slot(player);
    if (isdefined(empty_slot)) {
        var_6e1ec6f2c0ee6b2c = empty_slot;
    } else {
        player hint_prompt("munition_slots_full", 1, 2);
        return 0;
    }
    switch (name_string) {
    case #"hash_65872b6ad36f2e8a":
        player namespace_94359011b63230a6::give_munition_to_slot("grenade_launcher", var_6e1ec6f2c0ee6b2c);
        return 1;
    case #"hash_ee5a421e18a58c0f":
        return player try_give_munition_to_slot(name_string, var_6e1ec6f2c0ee6b2c, "ammo_crate", "pickup");
    case #"hash_d95dd5d6012a0de1":
        return player try_give_munition_to_slot(name_string, var_6e1ec6f2c0ee6b2c, "munitions_crate", "pickup");
    case #"hash_d4850e4dfbc48417":
        return player try_give_munition_to_slot(name_string, var_6e1ec6f2c0ee6b2c, "manual_turret", "pickup");
    case #"hash_2f437058d5eef2ac":
        return player try_give_munition_to_slot("toma_strike", var_6e1ec6f2c0ee6b2c, undefined, "pickup");
    case #"hash_a9f638b560f8481f":
        return player try_give_munition_to_slot("gunship", var_6e1ec6f2c0ee6b2c, undefined, "pickup");
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_1fc9d3e5733715bd":
    case #"hash_25789111b74943b4":
    case #"hash_349713b5ad494dda":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_4ad475e6e15635bd":
    case #"hash_4d35eb58f9d545f0":
    case #"hash_52d9b7ed584bec3e":
    case #"hash_58136b573f30f5be":
    case #"hash_634b246c3da5c56f":
    case #"hash_6414903dd56a87f8":
    case #"hash_6637a8e7426ba85e":
    case #"hash_74e2f521aa352a6a":
    case #"hash_7a687f6a4d685110":
    case #"hash_8c766d6477287bb6":
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_b161e185f1b8e117":
    case #"hash_b4ac3581c343a029":
    case #"hash_d0bdc52ff30e5d95":
    case #"hash_dc674fc0f75e4925":
    case #"hash_e65b15f734e5ab84":
    case #"hash_eca3b9673d38fd59":
        return player try_give_munition_to_slot(name_string, var_6e1ec6f2c0ee6b2c, undefined, "pickup");
    default:
        break;
    }
    player iprintlnbold("^1 Can't pick this up unknown munition: " + part);
    return 0;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1be9
// Size: 0x43
function try_give_munition_to_slot(name_string, var_6e1ec6f2c0ee6b2c, var_1be1c31f65120104, source) {
    var_4c8e00ecddfac46b = name_string;
    if (isdefined(var_1be1c31f65120104)) {
        var_4c8e00ecddfac46b = var_1be1c31f65120104;
    }
    namespace_94359011b63230a6::give_munition_to_slot(var_4c8e00ecddfac46b, var_6e1ec6f2c0ee6b2c, source);
    return true;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c35
// Size: 0x24
function force_hint_prompt_timer(string_name, timer) {
    self forceusehinton(string_name);
    wait timer;
    self forceusehintoff();
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c61
// Size: 0x3b
function get_empty_munition_slot(player) {
    for (i = 0; i < player.munition_slots.size; i++) {
        if (player is_empty_or_none(i)) {
            return i;
        }
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca4
// Size: 0xc4
function is_empty_or_none(i) {
    player = self;
    if (!isdefined(player.munition_slots)) {
        return true;
    }
    if (!isdefined(player.munition_slots[i])) {
        return true;
    }
    if (player.munition_slots[i].ref == "none" || player.munition_slots[i].ref == "empty1" || player.munition_slots[i].ref == "empty2" || player.munition_slots[i].ref == "empty3") {
        return true;
    }
    return false;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d71
// Size: 0x15c
function give_ammo_from_scavenged_weapon(part, player) {
    weapon = player getcurrentweapon();
    weaponroot = getweaponrootname(weapon);
    classname = weapongroupmap(weaponroot);
    if (array_contains(level.assault_weapons_array, part) && (classname == "weapon_assault" || classname == "weapon_battle")) {
        return give_ammo(part, player);
    }
    if (array_contains(level.smg_weapons_array, part) && classname == "weapon_smg") {
        return give_ammo(part, player);
    }
    if (array_contains(level.sniper_weapons_array, part) && (classname == "weapon_sniper" || classname == "weapon_dmr")) {
        return give_ammo(part, player);
    }
    if (array_contains(level.lmg_weapons_array, part) && classname == "weapon_lmg") {
        return give_ammo(part, player);
    }
    if (array_contains(level.shotgun_weapons_array, part) && classname == "weapon_shotgun") {
        return give_ammo(part, player);
    }
    if (array_contains(level.pistol_weapons_array, part) && classname == "weapon_pistol") {
        return give_ammo(part, player);
    }
    return 0;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed5
// Size: 0x1a
function give_ammo(part, player) {
    return player give_ammo_clip();
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef8
// Size: 0x1ad
function give_ammo_clip() {
    weapon = self getcurrentweapon();
    base_weapon = getrawbaseweaponname(weapon);
    var_b7a2fc1c85e2492c = weaponclipsize(weapon);
    if (weapontype(weapon) == "riotshield" || namespace_a0628d6954815ef8::is_incompatible_weapon(weapon)) {
        primaries = self getweaponslistprimaries();
        foreach (primaryweapon in primaries) {
            if (primaryweapon == weapon) {
                continue;
            }
            if (!isbulletweapon(weapon)) {
                continue;
            }
            var_b7a2fc1c85e2492c = weaponclipsize(primaryweapon);
            base_weapon = getrawbaseweaponname(primaryweapon);
            if (self getweaponammostock(primaryweapon) < scripts\cp\utility::function_ed18a118c6fa5c4f(primaryweapon)) {
                var_7863b6d204a0cece = self getweaponammostock(primaryweapon);
                self setweaponammostock(primaryweapon, var_b7a2fc1c85e2492c + var_7863b6d204a0cece);
                self.itempicked = getcompleteweaponname(primaryweapon);
            } else if (self getweaponammoclip(primaryweapon) < weaponclipsize(primaryweapon)) {
                self setweaponammoclip(primaryweapon, weaponclipsize(primaryweapon));
            } else {
                return false;
            }
            return true;
        }
    } else if (self getweaponammostock(weapon) < scripts\cp\utility::function_ed18a118c6fa5c4f(weapon)) {
        var_7863b6d204a0cece = self getweaponammostock(weapon);
        self setweaponammostock(weapon, var_b7a2fc1c85e2492c + var_7863b6d204a0cece);
        self.itempicked = getcompleteweaponname(weapon);
    } else if (self getweaponammoclip(weapon) < weaponclipsize(weapon)) {
        self setweaponammoclip(weapon, weaponclipsize(weapon));
    } else {
        return false;
    }
    self playlocalsound("weap_ammo_pickup");
    return true;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20ae
// Size: 0x138
function give_equipment(part, player) {
    result = 0;
    switch (part) {
    case #"hash_9bb0b5639d19444a":
        if (!istrue(player.has_gasmask)) {
            player.has_gasmask = 1;
            player thread namespace_6250b14b3f614101::player_play_pickup_anim();
            player scripts\cp_mp\gasmask::init();
            result = 1;
        }
        break;
    case #"hash_fa1e80f6bd5b8e72":
        if (!isdefined(player.var_c1c897bd5219a540)) {
            player thread namespace_6250b14b3f614101::player_play_pickup_anim();
            result = 1;
        }
        break;
    case #"hash_3139b149199f668f":
        if (isdefined(player.var_4d572a54ed8571c4) && player.var_4d572a54ed8571c4 == 0) {
            result = 0;
        } else if (!istrue(player.var_8acc46a1366e9a86)) {
            player.var_8acc46a1366e9a86 = 1;
            player thread namespace_6250b14b3f614101::player_play_pickup_anim();
            if (function_240f7f4e57340e8f()) {
                player namespace_6250b14b3f614101::addItemToBackpackByRef("dmz_nvg", "consumable", 1);
            } else {
                player namespace_94359011b63230a6::give_munition_to_slot("nvg", 3);
            }
            player namespace_94359011b63230a6::assign_highest_full_slot_to_active();
            player.var_4d572a54ed8571c4 = 0;
            result = 1;
        }
        break;
    }
    return result;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21ef
// Size: 0x7e
function refill_grenades(player) {
    player notify("stop_restock_recharge");
    foreach (var_fc9386be5a415d15 in player.powers) {
        player notify("scavenged_ammo", var_fc9386be5a415d15.weaponuse);
        player playlocalsound("weap_ammo_pickup");
        waitframe();
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2275
// Size: 0x120
function function_308763512997d07f() {
    level endon("game_ended");
    flag_wait("strike_init_done");
    if (istrue(level.var_3423c60cbb355c81)) {
        return;
    }
    if (getdvarint(@"hash_f1d31d1dd564fc9e", 0)) {
        return;
    }
    armor_structs = getstructarray("armor_pickup", "targetname");
    foreach (armor_struct in armor_structs) {
        armor_struct.origin += anglestoforward(armor_struct.angles) * -10;
        armor_struct.angles += (90, 0, 0);
        dropinfo = namespace_6250b14b3f614101::getitemdropinfo(armor_struct.origin, armor_struct.angles);
        var_29bed75fb4428cd5 = namespace_6250b14b3f614101::spawnpickup("brloot_plate_pouch", dropinfo);
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x239d
// Size: 0x179
function function_bcf02ee8cb581fcd(model) {
    for (i = 0; i < level.players.size; i++) {
        model disablescriptableplayeruse(level.players[i]);
    }
    model.interact = spawn("script_model", model.origin + (0, 0, 32));
    model.interact.angles = model.angles;
    model.interact setmodel("tag_origin");
    model.interact makeusable();
    hintstring = %COOP_GAME_PLAY/ARMOR_SATCHEL;
    model.interact sethintstring(hintstring);
    model.interact setcursorhint("HINT_BUTTON");
    model.interact sethintdisplayrange(190);
    model.interact sethintdisplayfov(140);
    model.interact setuserange(105);
    model.interact setusefov(65);
    model.interact sethintonobstruction("show");
    model.interact setuseholdduration("duration_short");
    model.interact thread function_9c1cc325eacd48c1(model);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x251e
// Size: 0x64
function function_9c1cc325eacd48c1(model) {
    self endon("death");
    while (true) {
        self waittill("trigger", player);
        if (function_46a2b7d2ad2bdc13(model, player)) {
            if (istrue(level.var_b17f3dc7c65b1860)) {
                model setscriptablepartstate("brloot_plate_pouch", "hidden");
                model freescriptable();
                self delete();
            }
        }
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x258a
// Size: 0xea
function function_46a2b7d2ad2bdc13(interaction, player) {
    if (player hasplatepouch()) {
        return false;
    }
    player playsoundtoplayer("br_pickup_generic", player);
    player.hasplatepouch = 1;
    player setclientomnvar("ui_br_has_plate_pouch", 1);
    player thread scripts\cp\cp_hud_message::showsplash("br_plate_pouch_pickup");
    var_a81adeb0e1f89320 = player namespace_f8d3520d3483c1::function_47320a25b8ee003();
    var_364d691b501cd27f = player namespace_f8d3520d3483c1::function_600f6cf462e983f();
    player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(int(var_a81adeb0e1f89320 - var_364d691b501cd27f));
    if (istrue(level.var_b17f3dc7c65b1860)) {
        if (isdefined(interaction.target)) {
            satchel_models = getentarray(interaction.target, "targetname");
            for (i = 0; i < satchel_models.size; i++) {
                satchel_models[i] delete();
            }
        }
    }
    return true;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x267d
// Size: 0x59
function function_f3a7a75259866102() {
    level.lootweaponcache = [];
    level.lootweaponrefs = [];
    var_725f93c8f8f7cf9d = getdvarint(@"hash_d8d8d08bfd9ec4df", 30);
    level.var_de221bfb117f1fd1 = var_725f93c8f8f7cf9d * var_725f93c8f8f7cf9d;
    level.var_87960b9ce7021569 = getdvarfloat(@"hash_ed1ea4ac182c02cf", 0.8);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26de
// Size: 0x66
function getweaponassetfromrootweapon(rootweaponname, variantid) {
    varianttable = "mp/loot/weapon/" + rootweaponname + ".csv";
    weaponasset = tablelookup(varianttable, 0, variantid, 3);
    assertex(isdefined(weaponasset) && weaponasset != "", "Failed to find weapon asset for root weapon \"" + rootweaponname + "\" with variantID " + variantid);
    return weaponasset;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x274d
// Size: 0x66
function lookupvariantref(rootweaponname, variantid) {
    varianttable = "mp/loot/weapon/" + rootweaponname + ".csv";
    variantref = tablelookup(varianttable, 0, variantid, 1);
    assertex(isdefined(variantref) && variantref != "", "Failed to find variant ref for root weapon \"" + rootweaponname + "\" with variantID " + variantid);
    return variantref;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27bc
// Size: 0x18
function isweaponitem(lootItemID) {
    return namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootItemID) == "weapon";
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27dd
// Size: 0x4e
function getweaponqualitybyid(weapon, variantid) {
    if (!isdefined(variantid) || variantid < 0) {
        return 0;
    }
    var_c6c779c138e8c65 = getweaponloottable(weapon);
    quality = int(tablelookup(var_c6c779c138e8c65, 0, variantid, 4));
    return quality;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2834
// Size: 0x16
function getlootweaponref(lootItemID) {
    return level.lootweaponrefs[lootItemID];
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2853
// Size: 0x331
function function_30f5ea60517f9e06(opener, container) {
    var_57ac5dc40b2e5a9 = function_438749eb7a7b738(container.contents, opener, container);
    lastvalidindex = var_57ac5dc40b2e5a9[1];
    items = var_57ac5dc40b2e5a9[0];
    container.contents = items;
    opener.var_2fa5b49969def47 = container;
    opener.var_f2aa9ae949179907 = opener.origin;
    if (isdefined(container.linkedparent)) {
        opener.var_f2aa9ae949179907 = opener.origin - container.linkedparent.origin;
    }
    /#
        if (items.size > 10) {
            println("<dev string:x1c>" + items.size + "<dev string:x50>" + 10 + "<dev string:x69>");
        }
    #/
    for (itemindex = 0; itemindex < 10; itemindex++) {
        if (itemindex <= lastvalidindex) {
            function_446c7ad7bcc70992(opener, itemindex, items[itemindex]["lootID"], items[itemindex]["quantity"]);
            continue;
        }
        function_c7294f5b9b5006d5(opener, itemindex);
    }
    if (isdefined(container.weaponslotcontents)) {
        opener setclientomnvar("loot_container_weapon", container.weaponslotcontents);
    } else {
        opener setclientomnvar("loot_container_weapon", 0);
    }
    partname = container function_ec5f4851431f3382();
    partstate = container getscriptablepartstate(partname, 1);
    if (partstate != "opening_in_use") {
        container setscriptablepartstate(partname, "in_use");
    }
    if (!isdefined(container.containertype)) {
        container.containertype = 1;
    }
    containertype = container.containertype;
    if (containertype == 6) {
        if (isdefined(container.owner) && isdefined(container.owner.team) && isdefined(opener.team) && container.owner.team == opener.team && isdefined(container.owner.var_3f78c6a0862f9e25)) {
            containertype = 7 + container.owner.var_3f78c6a0862f9e25;
        }
        if (isdefined(container.deadplayerindex)) {
            opener setclientomnvar("loot_container_dead_player_index", container.deadplayerindex);
        }
    }
    opener setclientomnvar("loot_container_open", containertype);
    if (istrue(level.var_a101059dea76957c) && !istrue(container.previouslyopened) && container.containertype != 13) {
        container.previouslyopened = 1;
        if (issharedfuncdefined("player", "doScoreEvent")) {
            opener thread [[ getsharedfunc("player", "doScoreEvent") ]]("br_cacheOpen");
        }
    }
    container thread function_71a59f067d5fe986(container, opener);
    container thread function_47b931d76ffd028f(container, opener);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8c
// Size: 0x141
function function_438749eb7a7b738(items, opener, container) {
    assert(isdefined(items));
    validitems = [];
    firstindex = 0;
    lastindex = items.size - 1;
    foreach (item in items) {
        quantity = item["quantity"];
        lootid = item["lootID"];
        team = item["team"];
        visibilityCondition = item["visibilityCondition"];
        if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0 && (!isdefined(team) || team == opener.team) && (!isdefined(visibilityCondition) || [[ visibilityCondition ]](opener, container))) {
            validitems[firstindex] = item;
            firstindex++;
            continue;
        }
        validitems[lastindex] = item;
        lastindex--;
    }
    return [validitems, lastindex];
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd6
// Size: 0x40
function function_c7294f5b9b5006d5(player, index) {
    player setclientomnvar("loot_container_item_" + index, 0);
    player setclientomnvar("loot_container_quantity_" + index, 0);
    player setclientomnvar("loot_container_type_" + index, 0);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1e
// Size: 0x48
function function_47b931d76ffd028f(container, opener) {
    container endon("death");
    level endon("game_ended");
    container endon("closed");
    opener waittill_any_3("close_container", "flashbang", "concussed");
    closeLootableContainer(container, opener);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6e
// Size: 0xf4
function function_71a59f067d5fe986(container, opener) {
    container endon("death");
    level endon("game_ended");
    container endon("closed");
    opener endon("disconnect");
    while (scripts\cp_mp\utility\player_utility::isreallyalive(opener) && !istrue(opener.isdisconnecting) && isdefined(opener.origin) && (!isdefined(container.linkedparent) && distancesquared(opener.var_f2aa9ae949179907, opener.origin) <= level.var_de221bfb117f1fd1 || isdefined(container.linkedparent) && distancesquared(opener.var_f2aa9ae949179907, opener.origin - container.linkedparent.origin) <= level.var_de221bfb117f1fd1)) {
        wait 0.05;
    }
    closeLootableContainer(container, opener);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6a
// Size: 0x36
function function_d3e618521013c7eb() {
    self endon("death");
    level endon("game_ended");
    self waittill("opened_in_use");
    partname = self function_ec5f4851431f3382();
    self setscriptablepartstate(partname, "open_usable");
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea8
// Size: 0xd0
function closeLootableContainer(container, opener) {
    opener setclientomnvar("loot_container_open", 0);
    container notify("closed");
    partname = container function_ec5f4851431f3382();
    if (container getscriptableparthasstate(partname, "open_usable")) {
        partstate = container getscriptablepartstate(partname, 1);
        if (partstate != "opening_in_use") {
            container setscriptablepartstate(partname, "open_usable");
        } else {
            container thread function_d3e618521013c7eb();
            container notify("opened_in_use");
        }
    } else if (container getscriptableparthasstate(partname, "usable")) {
        container setscriptablepartstate(partname, "usable");
    } else {
        container setscriptablepartstate(partname, "visible");
    }
    if (istrue(opener.var_7f15935a89ea5b13)) {
        opener.var_7f15935a89ea5b13 = undefined;
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f80
// Size: 0x18
function isContainerOpen(player) {
    return player getclientomnvar("loot_container_open") > 0;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa1
// Size: 0xb2
function function_446c7ad7bcc70992(player, index, lootid, quantity) {
    typename = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    typedata = level.lootmaster[typename];
    if (lootid == 0) {
        function_c7294f5b9b5006d5(player, index);
        return;
    }
    if (isdefined(typedata)) {
        player setclientomnvar("loot_container_item_" + index, lootid);
        player setclientomnvar("loot_container_quantity_" + index, quantity);
        player setclientomnvar("loot_container_type_" + index, typedata.typevalue);
        return;
    }
    println("<dev string:x6b>" + lootid + "<dev string:x69>");
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x305b
// Size: 0x2c
function getLootIDAtContainerIndex(player, index) {
    var_5c9ddcf56d36f133 = player getclientomnvar("loot_container_item_" + index);
    return var_5c9ddcf56d36f133;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3090
// Size: 0x20
function function_8e5978971b5dcd16(player, index) {
    return player getclientomnvar("loot_container_quantity_" + index);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30b9
// Size: 0xb1
function isContainerEmpty(container) {
    if (!isdefined(container.contents)) {
        return true;
    }
    foreach (content in container.contents) {
        if (content["lootID"] > 0 && content["quantity"] > 0) {
            return false;
        }
    }
    if (isdefined(container.weaponslotcontents)) {
        containerweapon = self getclientomnvar("loot_container_weapon");
        if (istrue(containerweapon)) {
            return false;
        }
    }
    return true;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3173
// Size: 0xe4
function function_1791c1e8974e9bd7(player, lootid, quantity) {
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    success = 0;
    if (ref == "cash") {
        var_3466c10973e9c476 = namespace_6250b14b3f614101::getplundernamebyamount(quantity);
        fakepickup = spawnstruct();
        fakepickup.scriptablename = var_3466c10973e9c476;
        namespace_6250b14b3f614101::playpickupfeedback(fakepickup);
        player namespace_6250b14b3f614101::playerplunderpickup(quantity);
        player scripts\cp_mp\challenges::onpickupitem("plunder");
        success = 1;
    } else if (ref == "dmz_loot_quest_intel" || ref == "dmz_trap_quest_trigger") {
        namespace_6250b14b3f614101::function_37be6e543436f3b3(lootid);
        success = 1;
    } else if (isammo(ref)) {
        success = player namespace_6250b14b3f614101::function_54dac56d15dd3d93(ref, lootid, quantity);
    } else {
        success = player namespace_6250b14b3f614101::lootitem(lootid, quantity);
    }
    return success;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3260
// Size: 0x143
function function_a335aa664caa37c9(player) {
    lootid = namespace_6250b14b3f614101::function_d9b1550011525161(player);
    if (!isdefined(player.var_2fa5b49969def47.weaponslotobj)) {
        return;
    }
    var_c161ec212069668d = 1;
    foreach (weaponobj in player.primaryinventory) {
        if (weaponobj.basename == "iw9_me_fists_mp") {
            var_c161ec212069668d = 0;
            break;
        }
    }
    if (var_c161ec212069668d && namespace_6250b14b3f614101::function_efab78b72d131d76(player)) {
        scripts\cp\cp_hud_message::showerrormessage(level.br_pickups.br_pickupdenyequipnoroom);
        return;
    }
    if (!var_c161ec212069668d) {
        function_a92926d5b02cf6ed(player);
        return;
    }
    namespace_6250b14b3f614101::function_8107fe0feec27866(player, player.var_2fa5b49969def47.weaponslotobj);
    player playsoundtoplayer("br_pickup_weap", player);
    player setclientomnvar("loot_container_weapon", 0);
    player.var_2fa5b49969def47.weaponslotcontents = 0;
    player.var_2fa5b49969def47.weaponslotobj = undefined;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x33ab
// Size: 0x116
function function_2f00ca0526f3edc6(player, index, quantity) {
    lootid = getLootIDAtContainerIndex(player, index);
    itemquantity = function_8e5978971b5dcd16(player, index);
    if (!isdefined(quantity)) {
        quantity = itemquantity;
    }
    assert(itemquantity >= quantity, "Attempting to loot a higher quantity than what is available.");
    if (lootid == 0 || quantity == 0) {
        return 1;
    }
    success = function_1791c1e8974e9bd7(player, lootid, quantity);
    if (success) {
        newquantity = itemquantity - quantity;
        newlootid = lootid;
        if (isdefined(player.var_2fa5b49969def47)) {
            player.var_2fa5b49969def47.contents[index]["quantity"] = newquantity;
        }
        if (newquantity <= 0) {
            newlootid = 0;
            if (isdefined(player.var_2fa5b49969def47)) {
                player.var_2fa5b49969def47.contents[index]["lootID"] = newlootid;
            }
        }
        function_446c7ad7bcc70992(player, index, newlootid, newquantity);
    }
    return success;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34ca
// Size: 0x1b7
function function_a92926d5b02cf6ed(player) {
    lootid = player getclientomnvar("loot_container_weapon");
    if (lootid == 0) {
        return 1;
    }
    if (!isdefined(player.var_2fa5b49969def47.weaponslotobj)) {
        return 1;
    }
    weapon = player.var_2fa5b49969def47.weaponslotobj;
    foreach (weap in self.primaryweapons) {
        if (issameweapon(weap, weapon)) {
            scripts\cp\cp_hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveweapon);
            return;
        }
    }
    if (namespace_6250b14b3f614101::function_efab78b72d131d76(player)) {
        weaponslotweapon = namespace_6250b14b3f614101::function_2985254128b1c262(player);
        if (issameweapon(weaponslotweapon, weapon)) {
            scripts\cp\cp_hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveweapon);
            return;
        }
    }
    fullname = getcompleteweaponname(weapon);
    basename = undefined;
    if (isdefined(weapon.basename)) {
        basename = weapon.basename;
    } else {
        basename = getweaponbasename(weapon);
    }
    success = namespace_6250b14b3f614101::br_forcegivecustomweapon(player, weapon, fullname, basename);
    if (success) {
        player setclientomnvar("loot_container_weapon", 0);
        player.var_2fa5b49969def47.weaponslotcontents = 0;
        player.var_2fa5b49969def47.weaponslotobj = undefined;
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3689
// Size: 0x111
function function_3ae3712fe76d0c6a(player, index) {
    lootid = getLootIDAtContainerIndex(player, index);
    quantity = function_8e5978971b5dcd16(player, index);
    if (lootid == 0 || quantity == 0) {
        return;
    }
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    if (isammo(ref)) {
        var_bada25504e8844d7 = spawnstruct();
        var_bada25504e8844d7.scriptablename = ref;
        var_bada25504e8844d7.count = quantity;
        player namespace_6250b14b3f614101::addItemToBackpack(lootid, var_bada25504e8844d7);
    } else {
        var_6a80b9f81cd7ad99 = namespace_6250b14b3f614101::getAvailableDMZBackpackIndex();
        equipitem(lootid, quantity, var_6a80b9f81cd7ad99);
    }
    if (isdefined(player.var_2fa5b49969def47)) {
        player.var_2fa5b49969def47.contents[index]["quantity"] = 0;
        player.var_2fa5b49969def47.contents[index]["lootID"] = 0;
    }
    function_446c7ad7bcc70992(player, index, 0, 0);
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37a2
// Size: 0x1b5
function function_e146f016a8a7244f(notification, slotindex) {
    if (istrue(level.infilcinematicactive)) {
        return;
    }
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_31a47c100531f34f":
            function_9d924aea120c2693(self, slotindex);
            function_2f00ca0526f3edc6(self, slotindex, 1);
            break;
        case #"hash_b7e2e7e659da3043":
            if (slotindex == 100) {
                function_a335aa664caa37c9(self);
            } else {
                function_9d924aea120c2693(self, slotindex);
                function_2f00ca0526f3edc6(self, slotindex);
            }
            break;
        case #"hash_453445f0e586a78e":
            if (slotindex == 100) {
                function_a92926d5b02cf6ed(self);
            } else {
                function_9d924aea120c2693(self, slotindex);
                function_3ae3712fe76d0c6a(self, slotindex);
            }
            break;
        case #"hash_fb84b605789df05e":
            if (isdefined(self.var_2fa5b49969def47)) {
                closeLootableContainer(self.var_2fa5b49969def47, self);
            }
            break;
        default:
            return;
        }
    }
    if (isdefined(self.var_2fa5b49969def47) && isContainerEmpty(self.var_2fa5b49969def47)) {
        closeLootableContainer(self.var_2fa5b49969def47, self);
        if (!istrue(self.var_2fa5b49969def47.var_1498604de9cf5016)) {
            self.var_2fa5b49969def47 notify("death");
            self.var_2fa5b49969def47 freescriptable();
            self.var_2fa5b49969def47 = undefined;
            return;
        }
        partname = self.var_2fa5b49969def47 function_ec5f4851431f3382();
        if (self.var_2fa5b49969def47 getscriptableparthasstate(partname, "open")) {
            self.var_2fa5b49969def47 setscriptablepartstate(partname, "open");
        }
        self.var_2fa5b49969def47 = undefined;
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x395f
// Size: 0xcf
function function_9d924aea120c2693(player, slotindex) {
    lootid = getLootIDAtContainerIndex(player, slotindex);
    itemquantity = function_8e5978971b5dcd16(player, slotindex);
    if (lootid == 0 || itemquantity == 0) {
        return;
    }
    if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.contents) && isdefined(self.var_2fa5b49969def47.contents[slotindex]) && isdefined(self.var_2fa5b49969def47.contents[slotindex]["callback"])) {
        thread [[ self.var_2fa5b49969def47.contents[slotindex]["callback"] ]](self.var_2fa5b49969def47, player);
    }
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a36
// Size: 0x15
function function_55b384ecb923003e() {
    return getdvarint(@"hash_f86a28f69e6ccc38", 1) == 1;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a54
// Size: 0x14
function function_4749c1a092e650bd() {
    return getdvarint(@"hash_1b2e1ef116b3de36", 0) == 1;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a71
// Size: 0x15
function function_8306d72ea2e8889c() {
    return getdvarint(@"hash_b692410c5b56ffb5", 1) == 1;
}

// Namespace loot_system / scripts\cp\loot_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a8f
// Size: 0x1c
function function_310ab06891cb4517() {
    return function_4749c1a092e650bd() || function_8306d72ea2e8889c() || function_55b384ecb923003e();
}

