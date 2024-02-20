// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_6159d9fd44490f13;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using script_52d91cb28006a5bd;
#using script_479e458f6f530f0d;
#using script_7c40fa80892a721;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_ec0f9ad939b29e0;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\emp_drone_targeted.gsc;
#using scripts\cp_mp\killstreaks\emp_drone.gsc;

#namespace equipment;

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb93
// Size: 0x17a
function init() {
    level.equipment = spawnstruct();
    inititems();
    if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_bd5d1f5a11586ed4)) {
        level.var_e5255d7c501309dd = "equipmentlist:" + level.var_1a2b600a06ec21f4.var_bd5d1f5a11586ed4;
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_t10_mp";
        /#
            utility::function_631451c08249b9d2(" ", level.var_e5255d7c501309dd);
        #/
    } else if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) > 0) {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_mgl_mp";
        /#
            utility::function_631451c08249b9d2(" ", level.var_e5255d7c501309dd);
        #/
    } else if (utility::iscp()) {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_iw9_cp";
        /#
            utility::function_631451c08249b9d2(" ", level.var_e5255d7c501309dd);
        #/
    } else {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_iw9_mp";
        /#
            utility::function_631451c08249b9d2(" ", level.var_e5255d7c501309dd);
        #/
    }
    function_29d51c2a86346a9c();
    initlethalmaxoffsetmap();
    function_f8d145900d997580();
    if (!isdefined(level.onplayerspawncallbacks)) {
        level.onplayerspawncallbacks = [];
    }
    level.onplayerspawncallbacks[level.onplayerspawncallbacks.size] = &equiponplayerspawned;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd14
// Size: 0x21b
function inititems() {
    level.equipment.callbacks = [];
    var_584994fab4a8712b = level.equipment;
    namespace_eff8aaa83987a595::equipmentinteract_init();
    if (issharedfuncdefined("equipment", "equipment_init")) {
        var_584994fab4a8712b = [[ getsharedfunc("equipment", "equipment_init") ]](var_584994fab4a8712b);
    }
    namespace_eb0feb5c721a9f11::throwing_knife_init();
    namespace_9cff5695f11e1c45::function_12d7ca3ff609caba();
    var_584994fab4a8712b.callbacks["equip_throwing_knife"]["onGive"] = &namespace_eb0feb5c721a9f11::throwing_knife_ongive;
    var_584994fab4a8712b.callbacks["equip_throwing_knife"]["onTake"] = &namespace_eb0feb5c721a9f11::throwing_knife_ontake;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_fire"]["onGive"] = &namespace_eb0feb5c721a9f11::throwing_knife_ongive;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_fire"]["onTake"] = &namespace_eb0feb5c721a9f11::throwing_knife_ontake;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_electric"]["onGive"] = &namespace_eb0feb5c721a9f11::throwing_knife_ongive;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_electric"]["onTake"] = &namespace_eb0feb5c721a9f11::throwing_knife_ontake;
    var_584994fab4a8712b.callbacks["equip_throwstar"]["onGive"] = &namespace_9cff5695f11e1c45::function_e7715ffb329c1b40;
    var_584994fab4a8712b.callbacks["equip_throwstar"]["onTake"] = &namespace_9cff5695f11e1c45::function_92e126d1a5d3fb2;
    var_584994fab4a8712b.callbacks["equip_geigercounter"]["onGive"] = &namespace_96abc792b7f61807::function_60cba38635fd35cb;
    var_584994fab4a8712b.callbacks["equip_geigercounter"]["onTake"] = &namespace_96abc792b7f61807::function_bdd02627bcafe359;
    var_584994fab4a8712b.callbacks["equip_rfid"]["onGive"] = &namespace_96abc792b7f61807::function_60cba38635fd35cb;
    var_584994fab4a8712b.callbacks["equip_rfid"]["onTake"] = &namespace_96abc792b7f61807::function_bdd02627bcafe359;
    thread watchlethaldelay();
    if (issharedfuncdefined("game", "registerOnDisconnectEventCallback")) {
        [[ getsharedfunc("game", "registerOnDisconnectEventCallback") ]](&onownerdisconnect);
    }
    /#
        thread debughackequipment();
        thread debugemp();
        thread debugempdrone();
        thread debugdestroyempdrones();
    #/
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0x29
function private function_f8d145900d997580() {
    if (issharedfuncdefined("thermobaric_grenade", "thermobaric_grenade_init")) {
        [[ getsharedfunc("thermobaric_grenade", "thermobaric_grenade_init") ]]();
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf66
// Size: 0x46
function getcallback(ref, callback) {
    if (!isdefined(level.equipment.callbacks[ref])) {
        return undefined;
    }
    return level.equipment.callbacks[ref][callback];
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb4
// Size: 0x350
function loadtable() {
    level.equipment.table = [];
    level.var_415476758ec47760 = [];
    for (row = 1; 1; row++) {
        ref = tablelookupbyrow(level.var_e5255d7c501309dd, row, 1);
        if (!isdefined(ref) || ref == "") {
            break;
        }
        var_39061d840c9e9b1f = tolower(ref);
        struct = spawnstruct();
        struct.ref = var_39061d840c9e9b1f;
        weaponname = tablelookupbyrow(level.var_e5255d7c501309dd, row, 6);
        /#
            assertex(isdefined(weaponname) && weaponname != "", "equipment_mp.csv error -  "" + var_39061d840c9e9b1f + "" has no weapon");
        #/
        if (weaponname != "none") {
            var_ff180c307f2bafd3 = tablelookupbyrow(level.var_e5255d7c501309dd, row, 19);
            attachments = undefined;
            if (var_ff180c307f2bafd3 != "") {
                baseweapon = makeweapon(weaponname);
                if (!isnullweapon(baseweapon)) {
                    attachments = [0:var_ff180c307f2bafd3];
                }
            }
            struct.objweapon = makeweapon(weaponname, attachments);
            if (!isdefined(level.var_415476758ec47760[weaponname])) {
                level.var_415476758ec47760[weaponname] = var_39061d840c9e9b1f;
            }
        }
        struct.id = row;
        struct.image = tablelookupbyrow(level.var_e5255d7c501309dd, row, 4);
        struct.defaultslot = ter_op(tablelookupbyrow(level.var_e5255d7c501309dd, row, 7) == "2", "secondary", "primary");
        struct.scavengerammo = int(tablelookupbyrow(level.var_e5255d7c501309dd, row, 10));
        struct.ispassive = tolower(tablelookupbyrow(level.var_e5255d7c501309dd, row, 11)) == "true";
        struct.isselectable = tablelookupbyrow(level.var_e5255d7c501309dd, row, 8) != "-1";
        struct.weaponname = weaponname;
        var_da24fa61707aa57f = tablelookupbyrow(level.var_e5255d7c501309dd, row, 12);
        if (var_da24fa61707aa57f == "none") {
            goto LOC_0000032f;
        }
        if (var_da24fa61707aa57f == "") {
            if (weaponname != "none") {
                struct.damageweaponnames = [0:weaponname];
            }
        } else {
            damageweaponnames = [];
            if (weaponname != "none") {
                damageweaponnames[damageweaponnames.size] = weaponname;
            }
            var_a2643f257ee064a3 = strtok(var_da24fa61707aa57f, " ");
            foreach (var_f9ec6c92c0ff1f63 in var_a2643f257ee064a3) {
                damageweaponnames[damageweaponnames.size] = var_f9ec6c92c0ff1f63;
            }
            struct.damageweaponnames = damageweaponnames;
        LOC_0000032f:
        }
    LOC_0000032f:
        level.equipment.table[var_39061d840c9e9b1f] = struct;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130b
// Size: 0x410
function function_29d51c2a86346a9c() {
    level.equipment.table = [];
    level.var_a1e3b0d7b2a7836f = [];
    level.var_415476758ec47760 = [];
    var_9df9fe298aef6003 = getscriptbundle(level.var_e5255d7c501309dd);
    if (isdefined(var_9df9fe298aef6003)) {
        for (i = 0; i < var_9df9fe298aef6003.var_bd5d1f5a11586ed4.size; i++) {
            equipmentref = var_9df9fe298aef6003.var_bd5d1f5a11586ed4[i].ref;
            var_68cd8193f877cf60 = var_9df9fe298aef6003.var_bd5d1f5a11586ed4[i].bundle;
            if (isdefined(var_68cd8193f877cf60)) {
                var_85a1e8b6a105e2bb = getscriptbundle("equipment:" + var_68cd8193f877cf60);
                if (isdefined(var_85a1e8b6a105e2bb)) {
                    struct = spawnstruct();
                    struct.ref = equipmentref;
                    weaponname = var_85a1e8b6a105e2bb.useweapon;
                    /#
                        assertex(isdefined(weaponname), level.var_e5255d7c501309dd + " error -  "" + equipmentref + "" has no weapon");
                    #/
                    if (weaponname != "none") {
                        attachments = undefined;
                        baseweapon = makeweapon(weaponname);
                        if (!isnullweapon(baseweapon)) {
                            attachments = function_6527364c1ecca6c6(weaponname);
                        }
                        struct.objweapon = makeweapon(weaponname, attachments);
                        blueprints = function_bb92a5000082832a(weaponname);
                        foreach (blueprint, id in blueprints) {
                            var_1092bc40c58c1c9a = weaponname + "|" + string(id);
                            level.var_a1e3b0d7b2a7836f[var_1092bc40c58c1c9a] = function_3211981142ec5aee(weaponname, blueprint);
                        }
                        if (!isdefined(level.var_415476758ec47760[weaponname])) {
                            level.var_415476758ec47760[weaponname] = equipmentref;
                        }
                    }
                    struct.id = i;
                    struct.image = var_85a1e8b6a105e2bb.image;
                    struct.defaultslot = ter_op(isdefined(var_85a1e8b6a105e2bb.var_5472b77a1e1124b3) && var_85a1e8b6a105e2bb.var_5472b77a1e1124b3 == 2, "secondary", "primary");
                    struct.scavengerammo = ter_op(isdefined(var_85a1e8b6a105e2bb.scavengerammo), var_85a1e8b6a105e2bb.scavengerammo, 0);
                    struct.ispassive = isdefined(var_85a1e8b6a105e2bb.ispassive) && var_85a1e8b6a105e2bb.ispassive;
                    struct.isselectable = !isdefined(var_85a1e8b6a105e2bb.var_f9c517fd9d746051) || var_85a1e8b6a105e2bb.var_f9c517fd9d746051 != -1;
                    struct.weaponname = weaponname;
                    struct.bundle = var_85a1e8b6a105e2bb;
                    var_da24fa61707aa57f = var_85a1e8b6a105e2bb.var_e2a7d54c199db889;
                    if (!isdefined(var_da24fa61707aa57f)) {
                        if (weaponname != "none") {
                            struct.damageweaponnames = [0:weaponname];
                        }
                    } else {
                        if (var_da24fa61707aa57f == "none") {
                            goto LOC_000003ef;
                        }
                        damageweaponnames = [];
                        if (weaponname != "none") {
                            damageweaponnames[damageweaponnames.size] = weaponname;
                        }
                        var_a2643f257ee064a3 = strtok(var_da24fa61707aa57f, " ");
                        foreach (var_f9ec6c92c0ff1f63 in var_a2643f257ee064a3) {
                            damageweaponnames[damageweaponnames.size] = var_f9ec6c92c0ff1f63;
                        }
                        struct.damageweaponnames = damageweaponnames;
                    LOC_000003ef:
                    }
                LOC_000003ef:
                    level.equipment.table[equipmentref] = struct;
                }
            }
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1722
// Size: 0x56
function getequipmenttableinfo(ref) {
    if (isdefined(ref) && !isdefined(level.equipment.table[ref])) {
        /#
            assertmsg("getEquipmentTableInfo was called fo equipment with a ref that wasn't initialized: " + ref + "!");
        #/
    }
    return level.equipment.table[ref];
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1780
// Size: 0xc5
function function_f4f687e4e1edb923(equipmentname) {
    tokens = strtok(equipmentname, "_");
    tokens = array_remove_index(tokens, tokens.size - 1);
    if (tokens[0] == "jup") {
        tokens = array_remove_index(tokens, 0);
    }
    var_70a60eecf7ef55d7 = "";
    counter = 0;
    foreach (tok in tokens) {
        if (counter == 0) {
            var_70a60eecf7ef55d7 = var_70a60eecf7ef55d7 + tok;
            counter++;
        } else {
            var_70a60eecf7ef55d7 = var_70a60eecf7ef55d7 + "_" + tok;
        }
    }
    return var_70a60eecf7ef55d7;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184d
// Size: 0xcf
function function_9e77a3e4bb6c6e31(weaponname, variantid) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    if (isdefined(variantid) && variantid > 0) {
        weapon = makeweapon(weaponname, [], undefined, undefined, variantid);
        var_1092bc40c58c1c9a = weaponname + "|" + string(variantid);
        attachments = level.var_a1e3b0d7b2a7836f[var_1092bc40c58c1c9a];
        foreach (attachment, variant in attachments) {
            weapon = weapon withattachment(attachment, variant);
        }
    } else {
        weapon = makeweapon(weaponname);
    }
    return weapon;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1924
// Size: 0x28e
function giveequipment(ref, slot, class, variantid) {
    /#
        assert(isdefined(ref));
    #/
    /#
        assert(isdefined(slot));
    #/
    if (!isdefined(self.equipment)) {
        self.equipment = [];
    }
    if (ref == "none") {
        return;
    }
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    /#
        assertex(isdefined(var_8bf83d28be4c2d4f), "Attempting to give unknown equipment - "" + ref + """);
    #/
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return;
    }
    if (slot == "super") {
        var_5237a188ccda4d7b = level.br_pickups.var_14bd11727c4b6629[level.br_pickups.br_equipnametoscriptable[ref]];
        if (issharedfuncdefined("supers", "getSuperID")) {
            var_8bf83d28be4c2d4f.id = [[ getsharedfunc("supers", "getSuperID") ]](var_5237a188ccda4d7b);
        }
    }
    takeequipment(slot);
    weapon = undefined;
    if (isdefined(variantid)) {
        weapon = function_9e77a3e4bb6c6e31(var_8bf83d28be4c2d4f.weaponname, variantid);
    } else {
        weapon = var_8bf83d28be4c2d4f.objweapon;
    }
    if (isdefined(weapon) && is_equipment_slot_allowed(slot) && !var_8bf83d28be4c2d4f.ispassive) {
        self giveweapon(weapon);
        if (slot == "primary") {
            self assignweaponoffhandprimary(weapon);
        } else if (slot == "secondary") {
            self assignweaponoffhandsecondary(weapon);
        } else if (slot == "super") {
            self assignweaponoffhandspecial(weapon);
        }
    }
    sethudslot(slot, var_8bf83d28be4c2d4f.id);
    self.equipment[slot] = ref;
    var_645972186625daee = getcallback(ref, "onGive");
    if (isdefined(var_645972186625daee)) {
        self thread [[ var_645972186625daee ]](ref, slot, variantid);
    }
    function_22bf78eca6578d7d(slot, class);
    var_4e8271cf261e45dd = ref == "equip_throwing_knife" || ref == "equip_throwing_knife_fire" || ref == "equip_throwing_knife_electric" || ref == "equip_shuriken" || ref == "equip_throwstar";
    if (issharedfuncdefined("game", "getGameType") && [[ getsharedfunc("game", "getGameType") ]]() == "arena" && var_4e8271cf261e45dd) {
        goto LOC_00000282;
    }
    thread watchlethaldelayplayer(ref, slot);
LOC_00000282:
    self notify("equipment_given", ref);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb9
// Size: 0xf9
function takeequipment(slot) {
    /#
        assert(isdefined(slot));
    #/
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return;
    }
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        if (self hasweapon(var_8bf83d28be4c2d4f.objweapon)) {
            _takeweapon(var_8bf83d28be4c2d4f.objweapon);
            if (slot == "primary") {
                self clearoffhandprimary();
            } else if (slot == "secondary") {
                self clearoffhandsecondary();
            } else if (slot == "super") {
                self clearoffhandspecial();
            }
        }
    }
    sethudslot(slot, 0);
    self.equipment[slot] = undefined;
    var_c96c25b8a1f6fe18 = getcallback(ref, "onTake");
    if (isdefined(var_c96c25b8a1f6fe18)) {
        self thread [[ var_c96c25b8a1f6fe18 ]](ref, slot);
    }
    function_22bf78eca6578d7d(slot);
    self notify("equipment_taken_" + ref);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb9
// Size: 0x146
function equiponplayerdamaged(data) {
    weaponname = data.objweapon.basename;
    foreach (ref, var_8bf83d28be4c2d4f in level.equipment.table) {
        var_148e2d88d1deffd3 = getcallback(ref, "onPlayerDamaged");
        if (isdefined(var_148e2d88d1deffd3) && isdefined(var_8bf83d28be4c2d4f.damageweaponnames)) {
            foreach (var_f9ec6c92c0ff1f63 in var_8bf83d28be4c2d4f.damageweaponnames) {
                if (var_f9ec6c92c0ff1f63 == weaponname) {
                    var_b4998cf105f4856b = gettime();
                    result = [[ var_148e2d88d1deffd3 ]](data);
                    /#
                        assertex(gettime() == var_b4998cf105f4856b, "onPlayerDamagedCallback for " + ref + " cannot have waits.");
                    #/
                    return result;
                }
            }
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e06
// Size: 0x96
function ondestroyedbytrophy() {
    if (isdefined(self.equipmentref)) {
        var_99115207769478ff = getcallback(self.equipmentref, "onDestroyedByTrophy");
        if (isdefined(var_99115207769478ff)) {
            self thread [[ var_99115207769478ff ]]();
            return 1;
        } else if (issharedfuncdefined("equipment", "isPlantedEquipment") && [[ getsharedfunc("equipment", "isPlantedEquipment") ]](self)) {
            if (issharedfuncdefined("equipment", "deleteExplosive")) {
                self thread [[ getsharedfunc("equipment", "deleteExplosive") ]]();
                return 1;
            }
        }
    }
    return 0;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea4
// Size: 0x54
function is_equipment_slot_allowed(slot) {
    switch (slot) {
    case #"hash_325cb2e66f67d5b9":
        return val::get("equipment_primary");
    case #"hash_511d3c24fcedcdb1":
        return val::get("equipment_secondary");
    default:
        return 1;
        break;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x5f
function sethudslot(slot, id) {
    if (slot != "super") {
        self setclientomnvar("ui_equipment_id_" + slot, id);
    } else if (level.gametype == "dungeons") {
        self setclientomnvar("ui_field_upgrade_icon", id);
    } else {
        self setclientomnvar("ui_perk_package_super1", id);
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f65
// Size: 0x26
function getcurrentequipment(slot) {
    if (!isdefined(self.equipment)) {
        return undefined;
    }
    return self.equipment[slot];
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f93
// Size: 0x66
function clearallequipment() {
    if (!isdefined(self.equipment)) {
        return;
    }
    foreach (slot, ref in self.equipment) {
        takeequipment(slot);
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2000
// Size: 0x14
function function_f528e58424d9c3e3(var_fd84df04adead383, isprimary) {
    
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201b
// Size: 0xf3
function function_11a4d197e8db4f(var_fd84df04adead383) {
    if (!isdefined(level.var_1a2b600a06ec21f4) || !istrue(level.var_1a2b600a06ec21f4.var_e12ed09bf2e43167)) {
        if (issharedfuncdefined("loadout", "getExtraEquipmentPrimary")) {
            return [[ getsharedfunc("loadout", "getExtraEquipmentPrimary") ]](self.class_num);
        }
    } else {
        switch (var_fd84df04adead383) {
        case #"hash_44e999799ff10fce":
            if (issharedfuncdefined("loadout", "cac_getFlcExtraEquipmentPrimary")) {
                return [[ getsharedfunc("loadout", "cac_getFlcExtraEquipmentPrimary") ]](self.class_num);
            }
            break;
        default:
            if (issharedfuncdefined("loadout", "table_getFlcExtraEquipmentPrimary")) {
                return [[ getsharedfunc("loadout", "table_getFlcExtraEquipmentPrimary") ]](level.classtablename, self.class_num);
            }
            break;
        }
    }
    return 0;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2116
// Size: 0xf3
function function_58ea099b568dbfaf(var_fd84df04adead383) {
    if (!isdefined(level.var_1a2b600a06ec21f4) || !istrue(level.var_1a2b600a06ec21f4.var_e12ed09bf2e43167)) {
        if (issharedfuncdefined("loadout", "getExtraEquipmentSecondary")) {
            return [[ getsharedfunc("loadout", "getExtraEquipmentSecondary") ]](self.class_num);
        }
    } else {
        switch (var_fd84df04adead383) {
        case #"hash_44e999799ff10fce":
            if (issharedfuncdefined("loadout", "cac_getFlcExtraEquipmentSecondary")) {
                return [[ getsharedfunc("loadout", "cac_getFlcExtraEquipmentSecondary") ]](self.class_num);
            }
            break;
        default:
            if (issharedfuncdefined("loadout", "table_getFlcExtraEquipmentSecondary")) {
                return [[ getsharedfunc("loadout", "table_getFlcExtraEquipmentSecondary") ]](level.classtablename, self.class_num);
            }
            break;
        }
    }
    return 0;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2211
// Size: 0x3f2
function getequipmentmaxammo(ref, class) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return 0;
    }
    if (isdefined(level.var_986acb83cc29ed77)) {
        if (ref == "equip_armorplate") {
            return namespace_f8d3520d3483c1::function_47320a25b8ee003();
        }
        maxammo = weaponmaxammo(var_8bf83d28be4c2d4f.objweapon);
    } else if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        slot = findequipmentslot(ref);
        maxammo = undefined;
        if (isdefined(level.var_7ea1a9db4c78be14) && isdefined(slot) && (slot == "primary" || slot == "secondary")) {
            maxammo = self [[ level.var_7ea1a9db4c78be14 ]](ref, slot);
        }
        if (!isdefined(maxammo)) {
            if (ref == "equip_armorplate") {
                return namespace_f8d3520d3483c1::function_47320a25b8ee003();
            }
            if (issharedfuncdefined("perk", "hasPerk")) {
                var_3002827bca3dc613 = self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extraoffhandammo");
            } else {
                var_3002827bca3dc613 = 0;
            }
            maxammo = weaponmaxammo(var_8bf83d28be4c2d4f.objweapon, var_3002827bca3dc613);
            switch (ref) {
            case #"hash_6d194c409057b2":
            case #"hash_48d3196b46b0ba61":
            case #"hash_4b4a6458f00d9319":
            case #"hash_8770d1da0d7395b9":
            case #"hash_aa60ec2aec479ec8":
                break;
            default:
                if (level.gametype != "missions" && level.gametype != "dungeons") {
                    maxammo--;
                }
                break;
            }
            isprimary = isdefined(slot) && slot == "primary" || isequipmentlethal(ref);
            var_681ba90ff25200c5 = isdefined(slot) && slot == "secondary" || isequipmenttactical(ref);
            if (issharedfuncdefined("perk", "hasPerk")) {
                if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extra_deadly") && isprimary) {
                    if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_ninja_vest")) {
                        if (issubstr(ref, "throwing_knife") || issubstr(ref, "throwstar") || issubstr(ref, "shuriken")) {
                            maxammo++;
                        }
                    } else {
                        maxammo++;
                    }
                }
                if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extra_tactical") && var_681ba90ff25200c5) {
                    maxammo++;
                }
            }
            if (isdefined(class)) {
                var_fd84df04adead383 = undefined;
                if (issharedfuncdefined("loadout", "loadout_getClassType")) {
                    var_fd84df04adead383 = [[ getsharedfunc("loadout", "loadout_getClassType") ]](class);
                }
                var_1bc3bf54ae8e6ed7 = function_11a4d197e8db4f(var_fd84df04adead383);
                var_20327dd6b8d19acf = function_58ea099b568dbfaf(var_fd84df04adead383);
                if (var_1bc3bf54ae8e6ed7 && isprimary) {
                    maxammo++;
                }
                if (var_20327dd6b8d19acf && var_681ba90ff25200c5) {
                    maxammo++;
                }
            }
        }
    } else {
        equipmentname = level.br_pickups.br_equipnametoscriptable[var_8bf83d28be4c2d4f.ref];
        /#
            assertex(isdefined(level.br_pickups.maxcounts[equipmentname]), "Equipment " + equipmentname + " not found in level.br_pickups.maxCounts. Please add a stack size in the appropriate loot_item_defs table.");
        #/
        maxammo = level.br_pickups.maxcounts[equipmentname];
        if (!isdefined(maxammo)) {
            maxammo = 0;
        }
        if (ref == "equip_armorplate") {
            if (issharedfuncdefined("equipment", "hasPlatePouch")) {
                if (self [[ getsharedfunc("equipment", "hasPlatePouch") ]]()) {
                    maxammo = maxammo + getdvarint(@"hash_a5ab8ed6cc1b486a", 3);
                }
            }
        }
    }
    return maxammo;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x260b
// Size: 0x83
function getequipmentstartammo(ref) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return 0;
    }
    if (issharedfuncdefined("perk", "hasPerk")) {
        var_3002827bca3dc613 = self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extraoffhandammo");
    } else {
        var_3002827bca3dc613 = 0;
    }
    return weaponstartammo(var_8bf83d28be4c2d4f.objweapon, var_3002827bca3dc613);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2696
// Size: 0x47
function getequipmentammo(ref) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return 0;
    }
    return self getammocount(var_8bf83d28be4c2d4f.objweapon);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e5
// Size: 0x144
function setequipmentammo(ref, amount) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f) || !isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return;
    }
    var_a1a3722fb9707783 = self getweaponslistoffhands();
    foreach (equip in var_a1a3722fb9707783) {
        var_1189bd7fbe2861f8 = function_7f245729fcb6414d(equip.basename);
        if (isdefined(var_1189bd7fbe2861f8) && var_1189bd7fbe2861f8 == ref) {
            variantid = undefined;
            weapon = undefined;
            if (isdefined(equip.variantid) && equip.variantid > 0) {
                variantid = equip.variantid;
                weapon = namespace_4fb9dddfb8c1a67a::function_9e77a3e4bb6c6e31(equip.basename, variantid);
            } else {
                weapon = var_8bf83d28be4c2d4f.objweapon;
            }
            self setweaponammoclip(weapon, amount);
            break;
        }
    }
    function_22bf78eca6578d7d(findequipmentslot(ref));
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2830
// Size: 0x77
function function_1ab06e1478168800() {
    var_6b7cfc68e3d8be96 = 0;
    primary = getcurrentequipment("primary");
    if (isdefined(primary)) {
        var_6b7cfc68e3d8be96 = incrementequipmentammo(primary, getequipmentmaxammo(primary));
    }
    var_a13bca6b74db722a = 0;
    secondary = getcurrentequipment("secondary");
    if (isdefined(secondary)) {
        var_a13bca6b74db722a = incrementequipmentammo(secondary, getequipmentmaxammo(secondary));
    }
    return var_6b7cfc68e3d8be96 || var_a13bca6b74db722a;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28af
// Size: 0x69
function function_f1c136649b4207d6() {
    var_6e54da9f501e209b = 0;
    primary = getcurrentequipment("primary");
    if (isdefined(primary)) {
        var_6e54da9f501e209b = function_4394ceeb110e298f(primary);
    }
    var_7144516c7d25665f = 0;
    secondary = getcurrentequipment("secondary");
    if (isdefined(secondary)) {
        var_7144516c7d25665f = function_4394ceeb110e298f(secondary);
    }
    return var_6e54da9f501e209b || var_7144516c7d25665f;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2920
// Size: 0x69
function function_91bd2a98062313cb(slot, amount) {
    ref = getcurrentequipment(slot);
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return;
    }
    self setweaponammoclip(var_8bf83d28be4c2d4f.objweapon, amount);
    function_22bf78eca6578d7d(findequipmentslot(ref));
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2990
// Size: 0x63
function incrementequipmentammo(ref, var_930290d7f474a0ae, class) {
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb + var_930290d7f474a0ae, getequipmentmaxammo(ref, class)));
    setequipmentammo(ref, newammo);
    return var_3dbc3b058135cbfb != newammo;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29fb
// Size: 0x74
function decrementequipmentammo(ref, var_7d2e0ea9107a4c02, class) {
    if (!isdefined(var_7d2e0ea9107a4c02)) {
        var_7d2e0ea9107a4c02 = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    var_7d2e0ea9107a4c02 = int(min(var_7d2e0ea9107a4c02, var_3dbc3b058135cbfb));
    if (var_7d2e0ea9107a4c02 > 0) {
        newammo = int(min(var_3dbc3b058135cbfb - var_7d2e0ea9107a4c02, getequipmentmaxammo(ref, class)));
        setequipmentammo(ref, newammo);
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a76
// Size: 0x70
function incrementequipmentslotammo(slot, var_930290d7f474a0ae) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb + var_930290d7f474a0ae, getequipmentmaxammo(ref)));
    setequipmentammo(ref, newammo);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2aed
// Size: 0x70
function decrementequipmentslotammo(slot, var_7d2e0ea9107a4c02) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(var_7d2e0ea9107a4c02)) {
        var_7d2e0ea9107a4c02 = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb - var_7d2e0ea9107a4c02, getequipmentmaxammo(ref)));
    setequipmentammo(ref, newammo);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b64
// Size: 0x2c
function getequipmentslotammo(slot) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    return getequipmentammo(ref);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b98
// Size: 0x35
function setequipmentslotammo(slot, count) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    return setequipmentammo(ref, count);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd5
// Size: 0x36
function function_4394ceeb110e298f(ref) {
    switch (ref) {
    case #"hash_4b4a6458f00d9319":
        return namespace_8a392daf295e43f8::function_8803b12c07518865();
    default:
        return 0;
        break;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c12
// Size: 0x1e
function function_7f245729fcb6414d(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    return level.var_415476758ec47760[weaponname];
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c38
// Size: 0x97
function function_2113b6f7cb462692(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    foreach (var_8bf83d28be4c2d4f in level.equipment.table) {
        if (isdefined(var_8bf83d28be4c2d4f.weaponname) && weaponname == var_8bf83d28be4c2d4f.weaponname) {
            return var_8bf83d28be4c2d4f.bundle;
        }
    }
    return undefined;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd7
// Size: 0x15a
function mapequipmentweaponforref(objweapon) {
    weaponname = undefined;
    switch (objweapon.basename) {
    case #"hash_34f28162f0f54c6e":
    case #"hash_53d34fb712dd4235":
        weaponname = "throwingknife_mp";
        break;
    case #"hash_5701898d598fdb27":
        weaponname = "claymore_mp";
        break;
    case #"hash_1608b7d163aaf95f":
        weaponname = "jup_claymore_ob";
        break;
    case #"hash_cce14c95e4764532":
        weaponname = "at_mine_mp";
        break;
    case #"hash_8fd6158eb96a1f15":
    case #"hash_b2a8e1829f433bd7":
        weaponname = "thermite_mp";
        break;
    case #"hash_6547ec525f1340da":
    case #"hash_a009d256608f52ce":
    case #"hash_c4b9b21ecac2ced4":
        weaponname = "bunkerbuster_mp";
        break;
    case #"hash_9276d33dcce198b0":
    case #"hash_a51366582cde195e":
    case #"hash_adeee012d2581c12":
        weaponname = "jup_bunkerbuster_ob";
        break;
    case #"hash_5e5b9bb1e397e30a":
        weaponname = "shock_stick_mp";
        break;
    case #"hash_fd386aff9acf671":
        weaponname = "butterfly_mine_mp";
        break;
    case #"hash_aee3b09360147621":
        weaponname = "tracker_grenade_mp";
        break;
    }
    if (isdefined(weaponname)) {
        return namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(weaponname);
    }
    return objweapon;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e39
// Size: 0x2a
function getequipmentreffromweapon(objweapon) {
    objweapon = mapequipmentweaponforref(objweapon);
    return level.var_415476758ec47760[objweapon.basename];
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6b
// Size: 0x3e
function getweaponfromequipmentref(var_1189bd7fbe2861f8) {
    equip = level.equipment.table[var_1189bd7fbe2861f8];
    if (isdefined(equip)) {
        return equip.objweapon;
    }
    return undefined;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb1
// Size: 0xe1
function hasequipment(ref) {
    if (!isdefined(self.equipment)) {
        if (iscp() && isdefined(self.powers)) {
            foreach (key, value in self.powers) {
                if (key == ref) {
                    return 1;
                }
            }
        }
        return 0;
    }
    foreach (var_f03830bd1cd0cf91 in self.equipment) {
        if (var_f03830bd1cd0cf91 == ref) {
            return 1;
        }
    }
    return 0;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f9a
// Size: 0x70
function findequipmentslot(ref) {
    if (!isdefined(self.equipment)) {
        return undefined;
    }
    foreach (slot, var_f03830bd1cd0cf91 in self.equipment) {
        if (var_f03830bd1cd0cf91 == ref) {
            return slot;
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3011
// Size: 0x13
function isequipmentlethal(ref) {
    return isequipmentprimary(ref);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302c
// Size: 0x56
function isequipmentprimary(ref) {
    if (isdefined(ref) && isdefined(level.equipment.table[ref])) {
        return (level.equipment.table[ref].defaultslot == "primary");
    } else {
        return 0;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3089
// Size: 0x13
function isequipmenttactical(ref) {
    return isequipmentsecondary(ref);
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a4
// Size: 0x56
function isequipmentsecondary(ref) {
    if (isdefined(ref) && isdefined(level.equipment.table[ref])) {
        return (level.equipment.table[ref].defaultslot == "secondary");
    } else {
        return 0;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3101
// Size: 0x52
function isequipmentselectable(ref) {
    if (!isdefined(ref)) {
        return 0;
    }
    if (isdefined(level.equipment.table[ref])) {
        return istrue(level.equipment.table[ref].isselectable);
    } else {
        return 0;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315a
// Size: 0x114
function function_22bf78eca6578d7d(slot, class) {
    if (!isdefined(self.equipment) || self.equipment.size == 0) {
        return;
    }
    ammo = 0;
    maxammo = 0;
    ref = getcurrentequipment(slot);
    if (isdefined(ref)) {
        ammo = getequipmentslotammo(slot);
        maxammo = getequipmentmaxammo(ref, class);
    }
    if (slot == "primary") {
        self setclientomnvar("ui_power_num_charges", ammo);
        self setpowerammo("primary", ammo, maxammo);
    } else if (slot == "secondary") {
        self setclientomnvar("ui_power_secondary_num_charges", ammo);
        self setpowerammo("secondary", ammo, maxammo);
    } else if (slot == "health") {
        if (isdefined(self.pers["telemetry"].armor_collected)) {
            self.pers["telemetry"].armor_collected++;
        }
        self setclientomnvar("ui_equipment_id_health_numCharges", ammo, maxammo);
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3275
// Size: 0xb
function equiponplayerspawned() {
    thread watchoffhandfired();
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3287
// Size: 0xd
function resetequipment() {
    self.equipment = [];
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329b
// Size: 0x21d
function executeoffhandfired(objweapon) {
    foreach (slot, ref in self.equipment) {
        var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
        if (isdefined(var_8bf83d28be4c2d4f.objweapon) && objweapon == var_8bf83d28be4c2d4f.objweapon) {
            if (issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
                if (issharedfuncdefined("dlog", "brAnalytics_equipmentUse")) {
                    item_type = "";
                    if (isdefined(var_8bf83d28be4c2d4f.bundle) && isdefined(var_8bf83d28be4c2d4f.bundle.var_11d2f075e9a0e643)) {
                        item_type = var_8bf83d28be4c2d4f.bundle.var_11d2f075e9a0e643;
                    }
                    [[ getsharedfunc("dlog", "brAnalytics_equipmentUse") ]](self, objweapon, item_type);
                }
            }
            if (issharedfuncdefined("equipment", "getEquipmentRefFromWeapon")) {
                weaponref = [[ getsharedfunc("equipment", "getEquipmentRefFromWeapon") ]](objweapon);
                if (issharedfuncdefined("damage", "combatRecordEquipmentUsed")) {
                    self [[ getsharedfunc("damage", "combatRecordEquipmentUsed") ]](weaponref);
                }
            }
            var_98806ef14e691ff7 = getcallback(ref, "onFired");
            if (isdefined(var_98806ef14e691ff7)) {
                self thread [[ var_98806ef14e691ff7 ]](ref, slot, objweapon);
            }
            ammo = 0;
            ref = getcurrentequipment(slot);
            if (isdefined(ref)) {
                ammo = getequipmentslotammo(slot);
            }
            if (ammo == 0 && isdefined(level.var_87a4731d4dce4c3f)) {
                success = self [[ level.var_87a4731d4dce4c3f ]](self, slot, ref);
                if (istrue(success)) {
                    break;
                }
            }
            function_22bf78eca6578d7d(slot);
            break;
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34bf
// Size: 0x34
function watchoffhandfired() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (1) {
        objweapon = self waittill("offhand_fired");
        executeoffhandfired(objweapon);
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34fa
// Size: 0x85
function givescavengerammo() {
    foreach (ref in self.equipment) {
        var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
        if (var_8bf83d28be4c2d4f.scavengerammo > 0) {
            incrementequipmentammo(ref, var_8bf83d28be4c2d4f.scavengerammo);
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3586
// Size: 0x30
function getdefaultslot(ref) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    return var_8bf83d28be4c2d4f.defaultslot;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35be
// Size: 0x12b
function watchlethaldelay() {
    level endon("lethal_delay_end");
    level endon("round_end");
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    currentgametypestopsclock = currentgametypestopsclock();
    if (currentgametypestopsclock) {
        level.lethaldelaystarttime = gettime();
    } else if (issharedfuncdefined("game", "getTimePassed")) {
        level.lethaldelaystarttime = [[ getsharedfunc("game", "getTimePassed") ]]();
    }
    if (level.lethaldelay == 0) {
        level.lethaldelayendtime = level.lethaldelaystarttime;
        level notify("lethal_delay_end");
    }
    level.lethaldelayendtime = level.lethaldelaystarttime + level.lethaldelay * 1000;
    level notify("lethal_delay_start");
    while (1) {
        currenttime = undefined;
        if (currentgametypestopsclock) {
            currenttime = gettime();
        } else if (issharedfuncdefined("game", "getTimePassed")) {
            currenttime = [[ getsharedfunc("game", "getTimePassed") ]]();
        }
        if (currenttime >= level.lethaldelayendtime) {
            break;
        }
        waitframe();
    }
    level notify("lethal_delay_end");
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f0
// Size: 0x119
function watchlethaldelayplayer(equipmentref, slot) {
    self endon("death_or_disconnect");
    level endon("round_end");
    level endon("game_ended");
    if (lethaldelaypassed()) {
        return;
    }
    self notify("watchLethalDelayPlayer_" + slot);
    self endon("watchLethalDelayPlayer_" + slot);
    self endon("equipment_taken_" + equipmentref);
    if (!isdefined(self.lethaldelayallows) || !istrue(self.lethaldelayallows[slot])) {
        if (!isdefined(self.lethaldelayallows)) {
            self.lethaldelayallows = [];
        }
        self.lethaldelayallows[slot] = 1;
        if (slot == "primary ") {
            val::set("watchLethalDelayPlayer", "equipment_primary", 0);
        } else {
            val::set("watchLethalDelayPlayer", "equipment_secondary", 0);
        }
    }
    watchlethaldelayfeedbackplayer(self, slot);
    if (isdefined(self.lethaldelayallows) && istrue(self.lethaldelayallows[slot])) {
        self.lethaldelayallows[slot] = undefined;
        if (self.lethaldelayallows.size == 0) {
            self.lethaldelayallows = undefined;
        }
        val::function_c9d0b43701bdba00("watchLethalDelayPlayer");
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3810
// Size: 0x129
function watchlethaldelayfeedbackplayer(player, slot) {
    level endon("lethal_delay_end");
    if (!istrue(namespace_4b0406965e556711::gameflag("prematch_done"))) {
        level waittill("lethal_delay_start");
    }
    command = "+frag";
    if (slot != "primary") {
        command = "+smoke";
    }
    if (!isai(player)) {
        player notifyonplayercommand("lethal_attempt_" + slot, command);
    }
    currentgametypestopsclock = currentgametypestopsclock();
    while (1) {
        self waittill("lethal_attempt_" + slot);
        currenttime = undefined;
        if (currentgametypestopsclock) {
            currenttime = gettime();
        } else if (issharedfuncdefined("game", "getTimePassed")) {
            currenttime = [[ getsharedfunc("game", "getTimePassed") ]]();
        }
        n = (level.lethaldelayendtime - currenttime) / 1000;
        n = int(max(0, ceil(n)));
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/LETHALS_UNAVAILABLE_FOR_N", n);
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3940
// Size: 0x6f
function cancellethaldelay() {
    level.lethaldelay = 0;
    if (currentgametypestopsclock()) {
        level.lethaldelaystarttime = gettime();
    } else if (issharedfuncdefined("game", "getTimePassed")) {
        level.lethaldelaystarttime = [[ getsharedfunc("game", "getTimePassed") ]]();
    }
    level.lethaldelayendtime = level.lethaldelaystarttime;
    level notify("lethal_delay_end");
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b6
// Size: 0x82
function lethaldelaypassed() {
    if (isdefined(level.lethaldelay) && level.lethaldelay == 0) {
        return 1;
    }
    if (isdefined(level.lethaldelayendtime)) {
        currenttime = undefined;
        if (currentgametypestopsclock()) {
            currenttime = gettime();
        } else if (issharedfuncdefined("game", "getTimePassed")) {
            currenttime = [[ getsharedfunc("game", "getTimePassed") ]]();
        }
        return (currenttime > level.lethaldelayendtime);
    }
    return 0;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a40
// Size: 0x57
function currentgametypestopsclock() {
    if (issharedfuncdefined("game", "getGameType")) {
        gametype = [[ getsharedfunc("game", "getGameType") ]]();
        if (gametype == "hq" || gametype == "grnd" || gametype == "koth") {
            return 1;
        }
    }
    return 0;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9f
// Size: 0x8a
function onownerdisconnect(player) {
    if (issharedfuncdefined("equipment", "getAllEquip")) {
        var_7c3ce7ff13fbd7fc = player [[ getsharedfunc("equipment", "getAllEquip") ]]();
        foreach (equip in var_7c3ce7ff13fbd7fc) {
            equip notify("owner_disconnect");
        }
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b30
// Size: 0xe7
function hackequipment(hacker) {
    self.ishacked = 1;
    newowner = hacker;
    if (isdefined(hacker.owner) && hacker.equipmentref == "equip_capture_bot") {
        newowner = hacker.owner;
    }
    if (issharedfuncdefined("game", "setHasDoneCombat")) {
        newowner [[ getsharedfunc("game", "setHasDoneCombat") ]](newowner, 1);
    }
    hacker namespace_aad14af462a74d08::onhack(self.equipmentref);
    changeowner(newowner);
    if (level.teambased) {
        self filteroutplayermarks(newowner.team);
    } else {
        self filteroutplayermarks(newowner);
    }
    if (issharedfuncdefined("killstreak", "giveScoreForHack")) {
        newowner [[ getsharedfunc("killstreak", "giveScoreForHack") ]]();
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1e
// Size: 0x3e
function function_24fce6c89fd2bee3(CaptureBot) {
    if (isdefined(CaptureBot)) {
        if (!isdefined(self.var_134d6db4538498ee)) {
            self.var_134d6db4538498ee = [];
        }
        self.var_134d6db4538498ee[self.var_134d6db4538498ee.size] = CaptureBot;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c63
// Size: 0x76
function function_f5cbee8dfc1dc4f0(var_2c6dc87bb9f89da0) {
    if (isdefined(self.var_134d6db4538498ee)) {
        foreach (var_4d4b30bcb099ae1b in self.var_134d6db4538498ee) {
            if (isdefined(var_2c6dc87bb9f89da0) && var_4d4b30bcb099ae1b == var_2c6dc87bb9f89da0) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce1
// Size: 0xff
function changeowner(newowner) {
    var_c0f9139ffd72e62d = self.owner;
    if (!is_equal(self.turrettype, "sentry_turret")) {
        self setentityowner(newowner);
    }
    self.owner = newowner;
    self.team = newowner.team;
    self setotherent(newowner);
    if (issharedfuncdefined("equipment", "removeEquip")) {
        var_c0f9139ffd72e62d [[ getsharedfunc("equipment", "removeEquip") ]](self);
    }
    if (issharedfuncdefined("equipment", "updatePlantedArray")) {
        self.owner [[ getsharedfunc("equipment", "updatePlantedArray") ]](self);
    }
    onOwnerChanged = undefined;
    if (isdefined(self.equipmentref)) {
        onOwnerChanged = getcallback(self.equipmentref, "onOwnerChanged");
    }
    self notify("ownerChanged");
    if (isdefined(onOwnerChanged)) {
        self [[ onOwnerChanged ]](var_c0f9139ffd72e62d);
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de7
// Size: 0x143
function debughackequipment() {
    /#
        setdevdvar(@"hash_aa4a28e418803dd5", 0);
        while (1) {
            if (getdvarint(@"hash_aa4a28e418803dd5") != 0) {
                setdevdvar(@"hash_aa4a28e418803dd5", 0);
                var_dad9c3e8b724d629 = level.players[0];
                enemyplayer = undefined;
                for (i = 1; i < level.players.size; i++) {
                    if (issharedfuncdefined("table_getFlcExtraEquipmentSecondary", "specialty_ninja_vest") && var_dad9c3e8b724d629 [[ getsharedfunc("table_getFlcExtraEquipmentSecondary", "specialty_ninja_vest") ]](level.players[i])) {
                        enemyplayer = level.players[i];
                        break;
                    }
                }
                if (!isdefined(enemyplayer)) {
                    iprintlnbold("hasPlatePouch");
                    continue;
                }
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    var_7c3ce7ff13fbd7fc = var_dad9c3e8b724d629 [[ getsharedfunc("<unknown string>", "<unknown string>") ]]();
                    equipment = undefined;
                    if (var_7c3ce7ff13fbd7fc.size > 0) {
                        equipment = var_7c3ce7ff13fbd7fc[0];
                    }
                    if (!isdefined(equipment)) {
                        iprintlnbold("<unknown string>");
                        continue;
                    }
                    equipment hackequipment(enemyplayer);
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f31
// Size: 0xc3
function debugemp() {
    /#
        setdevdvar(@"hash_d39ba2fefaffd043", 0);
        while (1) {
            if (getdvarint(@"hash_d39ba2fefaffd043") != 0) {
                setdevdvar(@"hash_d39ba2fefaffd043", 0);
                if (level.players.size < 2) {
                    iprintlnbold("<unknown string>");
                    continue;
                }
                var_204da528aa0a3464 = level.players[1];
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    var_204da528aa0a3464 [[ getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", (0, 0, 0), (0, 0, 0), 0.05, 0);
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ffb
// Size: 0x105
function debugempdrone() {
    /#
        setdevdvar(@"hash_a6ef3bcfa25b1aef", 0);
        while (1) {
            if (getdvarint(@"hash_a6ef3bcfa25b1aef") != 0) {
                setdevdvar(@"hash_a6ef3bcfa25b1aef", 0);
                if (level.players.size < 2) {
                    iprintlnbold("<unknown string>");
                    continue;
                }
                firstplayer = level.players[0];
                var_204da528aa0a3464 = level.players[1];
                streakinfo = spawnstruct();
                streakinfo.streakname = "<unknown string>";
                streakinfo.owner = var_204da528aa0a3464;
                streakinfo.id = namespace_9abe40d2af041eb2::getuniquekillstreakid(var_204da528aa0a3464);
                streakinfo.lifeid = 0;
                targetpos = firstplayer.origin;
                drone = var_204da528aa0a3464 namespace_3ebc55488bf8fe66::empdrone_createdrone(streakinfo, targetpos);
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4107
// Size: 0xc5
function debugdestroyempdrones() {
    /#
        setdevdvar(@"hash_196b4febb9f4dd1f", 0);
        while (1) {
            if (getdvarint(@"hash_196b4febb9f4dd1f") != 0) {
                setdevdvar(@"hash_196b4febb9f4dd1f", 0);
                foreach (killstreak in level.activekillstreaks) {
                    if (isdefined(killstreak.streakinfo) && killstreak.streakinfo.streakname == "<unknown string>") {
                        killstreak namespace_5b16930b9511d4ed::empdrone_destroy();
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d3
// Size: 0xc8
function initlethalmaxoffsetmap() {
    level.lethal_equipmentmaskoffsets = [];
    bitindex = 0;
    foreach (equipment in level.equipment.table) {
        if (!equipment.isselectable) {
            continue;
        }
        if (equipment.id <= 0) {
            continue;
        }
        if (equipment.defaultslot == "secondary") {
            continue;
        }
        level.lethal_equipmentmaskoffsets[equipment.ref] = 1 << bitindex;
        bitindex++;
    }
}

// Namespace equipment/namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42a2
// Size: 0xb0
function function_707926e6ce8ddc60(slot, var_317d7e8b927bd393) {
    if (slot == "primary") {
        var_f366af1bb183316c = getcurrentequipment(slot);
        var_8bf83d28be4c2d4f = getequipmenttableinfo(var_f366af1bb183316c);
        if (!isdefined(var_8bf83d28be4c2d4f)) {
            var_f366af1bb183316c = "equip_frag";
        }
        thread giveequipment(var_f366af1bb183316c, "primary");
        setequipmentammo(var_f366af1bb183316c, var_317d7e8b927bd393);
    } else if (slot == "secondary") {
        var_5e7bdad4b7d0c7ac = getcurrentequipment(slot);
        var_8bf83d28be4c2d4f = getequipmenttableinfo(var_5e7bdad4b7d0c7ac);
        if (!isdefined(var_8bf83d28be4c2d4f)) {
            var_5e7bdad4b7d0c7ac = "equip_flash";
        }
        thread giveequipment(var_5e7bdad4b7d0c7ac, "secondary");
        setequipmentammo(var_5e7bdad4b7d0c7ac, var_317d7e8b927bd393);
    }
}

