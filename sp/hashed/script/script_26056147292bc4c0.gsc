#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_66122a002aff5d57;

#namespace attachment_pickup;

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x500
// Size: 0x93
function function_8b7dae212f7ff902() {
    level.var_5ff8e03eb9e6b4 = "reflex,therm, acog, hybrid,holo ,magazine,gl,ubsh,brake,comp,grip,cash";
    level.var_5ff8e03eb9e6b4 = function_8cecd5dd91836bba(level.var_5ff8e03eb9e6b4);
    function_845600fab0a4a95b();
    pickups = getentarray("attachment_pickup", "targetname");
    foreach (pickup in pickups) {
        pickup thread function_aba2da3a3ea77c90();
    }
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59b
// Size: 0x62
function function_8cecd5dd91836bba(var_3bc79acda463a258) {
    var_a6a1f6fe2990c155 = strtok(var_3bc79acda463a258, " ");
    new_string = undefined;
    if (var_a6a1f6fe2990c155.size > 1) {
        new_string = var_a6a1f6fe2990c155[0];
        for (i = 1; i < var_a6a1f6fe2990c155.size; i++) {
            new_string += var_a6a1f6fe2990c155[i];
        }
        return new_string;
    }
    return var_3bc79acda463a258;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x605
// Size: 0x270
function function_aba2da3a3ea77c90() {
    var_77460031ae8e47a4 = level.var_5ff8e03eb9e6b4;
    if (isdefined(self.script_noteworthy)) {
        var_77460031ae8e47a4 = self.script_noteworthy;
        var_77460031ae8e47a4 = function_8cecd5dd91836bba(var_77460031ae8e47a4);
    }
    type_array = strtok(var_77460031ae8e47a4, ",");
    if (type_array.size == 1) {
        var_d75739e39bc74e9 = type_array[0];
    } else {
        var_d75739e39bc74e9 = function_17c409fd49d47c84(type_array);
    }
    if (var_d75739e39bc74e9 == "cash") {
        function_8d01902b9d93b4c6();
        self delete();
        return;
    }
    var_8058e47866d8ac53 = function_d8e20b4db8aa13df(var_d75739e39bc74e9);
    if (isdefined(var_8058e47866d8ac53)) {
        self setmodel(var_8058e47866d8ac53);
    }
    self.base_type = function_de6f178182ba85a(var_d75739e39bc74e9);
    self.var_d75739e39bc74e9 = var_d75739e39bc74e9;
    hint_string = function_4b8d9fcb8af000f9(var_d75739e39bc74e9);
    self makeusable();
    self sethintstring(hint_string);
    self sethintdisplayrange(512);
    self setcursorhint("HINT_BUTTON");
    self setuserange(75);
    while (true) {
        self waittill("trigger", player);
        var_674582f0e7ce1160 = function_9e4552c702a237c5(player, var_d75739e39bc74e9);
        if (!isdefined(var_674582f0e7ce1160.attachment)) {
            break;
        } else if (var_674582f0e7ce1160.attachment == "failed") {
        } else if (issubstr(var_674582f0e7ce1160.attachment, "iron")) {
            break;
        } else {
            var_d75739e39bc74e9 = var_674582f0e7ce1160.attachment;
            var_8058e47866d8ac53 = function_d8e20b4db8aa13df(var_d75739e39bc74e9);
            if (isdefined(var_8058e47866d8ac53)) {
                self setmodel(var_8058e47866d8ac53);
            }
            type_array = function_5fbcc7fc1266b377(self.base_type);
            foreach (attachment in type_array) {
                if (issubstr(var_d75739e39bc74e9, attachment)) {
                    var_d75739e39bc74e9 = attachment;
                    break;
                }
            }
            hint_string = function_4b8d9fcb8af000f9(var_d75739e39bc74e9);
            self sethintstring(hint_string);
            self.var_d75739e39bc74e9 = var_d75739e39bc74e9;
            if (isdefined(var_674582f0e7ce1160.var_42006c656a8f39fb)) {
                self.var_87fd41ffd79d9072 = var_674582f0e7ce1160.var_42006c656a8f39fb;
                self.var_e2d00b1889eb04a = var_674582f0e7ce1160.var_f24c44ff50730d8b;
            }
        }
        wait 0.25;
    }
    self delete();
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87d
// Size: 0xfe
function function_17c409fd49d47c84(list) {
    array = [];
    total_weight = 0;
    foreach (element in list) {
        weight = function_306995537187bee2(element);
        if (weight > 0) {
            total_weight += weight;
            array[total_weight] = element;
        }
    }
    rand_num = randomint(total_weight);
    var_eb7ef060bafc3e3 = total_weight;
    foreach (key, value in array) {
        if (key > rand_num) {
            if (key < var_eb7ef060bafc3e3) {
                var_eb7ef060bafc3e3 = key;
            }
        }
    }
    return array[var_eb7ef060bafc3e3];
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x984
// Size: 0x198
function function_845600fab0a4a95b() {
    level.var_b03faa157debd02a = [];
    level.var_b03faa157debd02a["reflex"] = 20;
    level.var_b03faa157debd02a["therm"] = 10;
    level.var_b03faa157debd02a["acog"] = 10;
    level.var_b03faa157debd02a["hybrid"] = 10;
    level.var_b03faa157debd02a["holo"] = 10;
    level.var_b03faa157debd02a["scope"] = 10;
    level.var_b03faa157debd02a["silencer"] = 10;
    level.var_b03faa157debd02a["brake"] = 20;
    level.var_b03faa157debd02a["comp"] = 20;
    level.var_b03faa157debd02a["flash"] = 10;
    level.var_b03faa157debd02a["melee"] = 10;
    level.var_b03faa157debd02a["choke"] = 10;
    level.var_b03faa157debd02a["grip"] = 20;
    level.var_b03faa157debd02a["gl"] = 20;
    level.var_b03faa157debd02a["ubsh"] = 20;
    level.var_b03faa157debd02a["magazine"] = 30;
    level.var_b03faa157debd02a["mags"] = 30;
    level.var_b03faa157debd02a["drum"] = 20;
    level.var_b03faa157debd02a["cal"] = 20;
    level.var_b03faa157debd02a["trig"] = 10;
    level.var_b03faa157debd02a["pistol"] = 10;
    level.var_b03faa157debd02a["cash"] = 10;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb24
// Size: 0x2c
function function_306995537187bee2(type_string) {
    if (isdefined(level.var_b03faa157debd02a[type_string])) {
        return level.var_b03faa157debd02a[type_string];
    }
    return 10;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb58
// Size: 0x8e
function function_8d01902b9d93b4c6() {
    drop_type = "brloot_plunder_cash_common_1";
    amount = 100;
    dropinfo = spawnstruct();
    dropinfo.origin = self.origin;
    dropinfo.angles = self.angles;
    dropinfo.payload = 13827;
    dropinfo.payload = 0;
    item = namespace_6250b14b3f614101::spawnpickup(drop_type, dropinfo, amount, 1, undefined, 1);
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbee
// Size: 0x10
function function_d8e20b4db8aa13df(var_8c3c8ce6accb8243) {
    return "container_ammo_box_01_nophysics";
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc07
// Size: 0x1bf
function function_9e4552c702a237c5(player, var_d75739e39bc74e9) {
    var_674582f0e7ce1160 = spawnstruct();
    base_type = function_de6f178182ba85a(var_d75739e39bc74e9);
    if (!isdefined(base_type)) {
        iprintlnbold("Cannot use this " + var_d75739e39bc74e9 + " attachment");
        var_674582f0e7ce1160.attachment = "failed";
        return var_674582f0e7ce1160;
    }
    var_8c3c8ce6accb8243 = undefined;
    if (!function_bd75d13c13984bd0(var_d75739e39bc74e9)) {
        var_8c3c8ce6accb8243 = [var_d75739e39bc74e9];
    }
    curweapon = player getcurrentweapon();
    player.var_8ebba13cc4b90346 = player function_fb5497098da5db2a(curweapon, base_type);
    if (!isdefined(player.var_8ebba13cc4b90346) || player.var_8ebba13cc4b90346.size == 0) {
        iprintlnbold("Cannot use this " + var_d75739e39bc74e9 + " attachment");
        var_674582f0e7ce1160.attachment = "failed";
        return var_674582f0e7ce1160;
    }
    var_effb4ae1788a8b10 = player function_bea1ef4192c7c497(curweapon, player.var_8ebba13cc4b90346, var_8c3c8ce6accb8243);
    if (isdefined(var_effb4ae1788a8b10)) {
        displaystring = tablelookupistring("mp/attachmenttable.csv", 4, var_effb4ae1788a8b10, 3);
        iprintlnbold(var_effb4ae1788a8b10 + " / " + var_effb4ae1788a8b10);
        iprintln(displaystring);
        var_87fd41ffd79d9072 = undefined;
        var_e2d00b1889eb04a = undefined;
        if (isdefined(self.var_87fd41ffd79d9072)) {
            var_87fd41ffd79d9072 = self.var_87fd41ffd79d9072;
            var_e2d00b1889eb04a = self.var_e2d00b1889eb04a;
        }
        var_674582f0e7ce1160 = player function_60fdadc426db6334(curweapon, var_effb4ae1788a8b10, var_87fd41ffd79d9072, var_e2d00b1889eb04a);
        return var_674582f0e7ce1160;
    }
    iprintlnbold("Cannot use this " + var_d75739e39bc74e9 + " attachment");
    var_674582f0e7ce1160.attachment = "failed";
    return var_674582f0e7ce1160;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdcf
// Size: 0x90
function function_bd75d13c13984bd0(var_d75739e39bc74e9) {
    switch (var_d75739e39bc74e9) {
    case #"hash_c9e63a9bddd371e":
    case #"hash_2630d03d6f5fc192":
    case #"hash_3c53eb274322e803":
    case #"hash_412112410dc298ec":
    case #"hash_6fc1c97a058fdcc9":
    case #"hash_754f51acf0f54d82":
    case #"hash_a836d5af28105786":
    case #"hash_c693ed0e3896fe7b":
    case #"hash_e32d2a49d1ac024c":
    case #"hash_ee66a2867a3477e3":
        return true;
    }
    return false;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe68
// Size: 0x189
function function_de6f178182ba85a(var_d75739e39bc74e9) {
    switch (var_d75739e39bc74e9) {
    case #"hash_c9e63a9bddd371e":
    case #"hash_2c52850905eba1cb":
    case #"hash_562af81e4f0e0363":
    case #"hash_64b510104b17ffc3":
    case #"hash_a3ace681aebdd3a5":
    case #"hash_bd4d2e05f809e09f":
    case #"hash_dd93145493d0c039":
        return "optic";
    case #"hash_1cf09102712cef10":
    case #"hash_6605477145cc573a":
    case #"hash_b083bda1f739c2b7":
    case #"hash_e32d2a49d1ac024c":
    case #"hash_ea093129bbd4504a":
        return "muzzle";
    case #"hash_754f51acf0f54d82":
    case #"hash_dd65960f4365976d":
    case #"hash_fa11b8f6bd51593e":
    case #"hash_fc10e6650f85ea75":
        return "undermount";
    case #"hash_1a86006c17e03b1f":
    case #"hash_306c23099bffb04d":
    case #"hash_3c53eb274322e803":
    case #"hash_fb08f234e4b4da65":
        return "magazine";
    case #"hash_47826d3ddc469627":
    case #"hash_8303296e4f25ed9b":
    case #"hash_ee66a2867a3477e3":
        return "trigger";
    case #"hash_719417cb1de832b6":
    case #"hash_c693ed0e3896fe7b":
        return "reargrip";
    case #"hash_a836d5af28105786":
        return "unique";
    default:
        return "optic";
    }
    return undefined;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xffa
// Size: 0x12b
function function_5fbcc7fc1266b377(base_type) {
    switch (base_type) {
    case #"hash_c9e63a9bddd371e":
        return ["reflex", "therm", "acog", "hybrid", "holo", "scope"];
    case #"hash_e32d2a49d1ac024c":
        return ["silencer", "brake", "comp", "choke"];
    case #"hash_754f51acf0f54d82":
        return ["grip", "gl", "ubsh"];
    case #"hash_3c53eb274322e803":
        return ["mags", "drum", "cal"];
    case #"hash_ee66a2867a3477e3":
        return ["trig", "hammer"];
    case #"hash_c693ed0e3896fe7b":
        return ["pistol"];
    case #"hash_a836d5af28105786":
        return ["unique"];
    }
    return undefined;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112e
// Size: 0x21d
function function_4b8d9fcb8af000f9(var_d75739e39bc74e9) {
    switch (var_d75739e39bc74e9) {
    case #"hash_c9e63a9bddd371e":
        return %CP_WEAPON_BUY/ATTACHMENT_OPTIC;
    case #"hash_bd4d2e05f809e09f":
        return %CP_WEAPON_BUY/ATTACHMENT_REFLEX;
    case #"hash_a3ace681aebdd3a5":
        return %CP_WEAPON_BUY/ATTACHMENT_THERMAL;
    case #"hash_562af81e4f0e0363":
        return %CP_WEAPON_BUY/ATTACHMENT_ACOG;
    case #"hash_64b510104b17ffc3":
        return %CP_WEAPON_BUY/ATTACHMENT_HYBRID;
    case #"hash_dd93145493d0c039":
        return %CP_WEAPON_BUY/ATTACHMENT_HOLO;
    case #"hash_2c52850905eba1cb":
        return %CP_WEAPON_BUY/ATTACHMENT_SNIPERSCOPE;
    case #"hash_e32d2a49d1ac024c":
    case #"hash_b083bda1f739c2b7":
    case #"hash_a68c414683465b09":
    case #"hash_40a94c5d9e4e265b":
    case #"hash_6605477145cc573a":
        return %CP_WEAPON_BUY/ATTACHMENT_MUZZLE;
    case #"hash_1cf09102712cef10":
        return %CP_WEAPON_BUY/ATTACHMENT_BRAKE;
    case #"hash_ea093129bbd4504a":
        return %CP_WEAPON_BUY/ATTACHMENT_COMP;
    case #"hash_3b4588bd30f76bd7":
    case #"hash_754f51acf0f54d82":
        return %CP_WEAPON_BUY/ATTACHMENT_UNDERMOUNT;
    case #"hash_fa11b8f6bd51593e":
        return %CP_WEAPON_BUY/ATTACHMENT_UBGL;
    case #"hash_fc10e6650f85ea75":
        return %CP_WEAPON_BUY/ATTACHMENT_UBSH;
    case #"hash_dd65960f4365976d":
        return %CP_WEAPON_BUY/ATTACHMENT_GRIP;
    case #"hash_3c53eb274322e803":
    case #"hash_306c23099bffb04d":
    case #"hash_1a86006c17e03b1f":
    case #"hash_fb08f234e4b4da65":
        return %CP_WEAPON_BUY/ATTACHMENT_MAGAZINE;
    case #"hash_412112410dc298ec":
    case #"hash_125f83890bcd3175":
        return %CP_WEAPON_BUY/ATTACHMENT_BACK;
    case #"hash_2630d03d6f5fc192":
    case #"hash_2125856c1b2381fa":
        return %CP_WEAPON_BUY/ATTACHMENT_FRONT;
    case #"hash_8303296e4f25ed9b":
    case #"hash_ee66a2867a3477e3":
    case #"hash_47826d3ddc469627":
        return %CP_WEAPON_BUY/ATTACHMENT_TRIGGER;
    case #"hash_c693ed0e3896fe7b":
    case #"hash_719417cb1de832b6":
        return %CP_WEAPON_BUY/ATTACHMENT_GRIP;
    case #"hash_a836d5af28105786":
        return %CP_WEAPON_BUY/ATTACHMENT_UNIQUE;
    }
    return %CP_WEAPON_BUY/ATTACHMENT_DEFAULT;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1354
// Size: 0xdf
function function_fb5497098da5db2a(weapon, category) {
    weapon = getweaponrootname(weapon);
    if (!isdefined(category) || category == "1") {
        category = attachmentmap_tocategory(level.weaponattachments[weapon][0]);
    }
    var_28e5fd1571faec86 = [];
    if (!isdefined(level.weaponattachments[weapon])) {
        return undefined;
    }
    foreach (attachment in level.weaponattachments[weapon]) {
        if (string_starts_with(attachment, "pistolgrip")) {
            if (category == "reargrip") {
                var_28e5fd1571faec86[var_28e5fd1571faec86.size] = attachment;
            }
            continue;
        }
        if (attachmentmap_tocategory(attachment) == category) {
            var_28e5fd1571faec86[var_28e5fd1571faec86.size] = attachment;
        }
    }
    return var_28e5fd1571faec86;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x143c
// Size: 0xf2
function function_bea1ef4192c7c497(weapon, attachments, var_8c3c8ce6accb8243) {
    if (isdefined(var_8c3c8ce6accb8243)) {
        new_array = [];
        foreach (attachment_string in var_8c3c8ce6accb8243) {
            foreach (attachment in attachments) {
                if (issubstr(attachment, attachment_string)) {
                    new_array[new_array.size] = attachment;
                }
            }
        }
        if (new_array.size == 0) {
            return undefined;
        } else {
            attachments = new_array;
        }
    }
    attachments = array_randomize(attachments);
    self.var_d1786583fce8a543 = attachments[0];
    return self.var_d1786583fce8a543;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1537
// Size: 0x4b8
function function_60fdadc426db6334(weapon, attachment, var_87fd41ffd79d9072, var_e2d00b1889eb04a) {
    attachments = getweaponattachments(weapon);
    var_4f63ac1a66a909c3 = attachments;
    var_3cec9a92a775752e = 0;
    if (array_contains(attachments, attachment)) {
        var_3cec9a92a775752e = 1;
    }
    attachments = array_add(attachments, attachment);
    attachments = array_remove_duplicates(attachments);
    var_7312a46fa51227e3 = attachment;
    root_name = getweaponrootname(weapon);
    var_74fff52b1e2c1bfb = 0;
    if (weapon.inventorytype == "altmode") {
        var_74fff52b1e2c1bfb = 1;
    }
    clip_ammo = self getweaponammoclip(weapon);
    stock_ammo = self getweaponammostock(weapon);
    var_58a72877a2d03f1a = undefined;
    var_3ef7a96abde76230 = undefined;
    var_7589f78d5d7ba855 = undefined;
    primary_weapons = self getweaponslistprimaries();
    foreach (var_b71257aaac24c36a in primary_weapons) {
        if (var_b71257aaac24c36a.basename == weapon.basename) {
            if (var_b71257aaac24c36a.inventorytype == "altmode") {
                var_58a72877a2d03f1a = self getweaponammoclip(var_b71257aaac24c36a);
                var_3ef7a96abde76230 = self getweaponammostock(var_b71257aaac24c36a);
                continue;
            }
            clip_ammo = self getweaponammoclip(var_b71257aaac24c36a);
            stock_ammo = self getweaponammostock(var_b71257aaac24c36a);
        }
    }
    newweapon = namespace_e0ee43ef2dddadaa::buildweapon(getweaponrootname(weapon), attachments);
    var_9009bfbc354a4c09 = getweaponattachments(newweapon);
    var_4e5fdcb7f54380f7 = undefined;
    foreach (attachment in var_4f63ac1a66a909c3) {
        found = 0;
        foreach (obj in var_9009bfbc354a4c09) {
            if (attachment == obj) {
                found = 1;
            }
        }
        if (!found) {
            var_4e5fdcb7f54380f7 = attachment;
        }
    }
    var_2c9e4ac6987f5630 = newweapon.basename;
    var_42006c656a8f39fb = undefined;
    var_f24c44ff50730d8b = undefined;
    if (isdefined(var_4e5fdcb7f54380f7)) {
        if (issubstr(var_4e5fdcb7f54380f7, "gl") || issubstr(var_4e5fdcb7f54380f7, "ubsh")) {
            var_42006c656a8f39fb = var_58a72877a2d03f1a;
            var_f24c44ff50730d8b = var_3ef7a96abde76230;
        } else {
            var_7589f78d5d7ba855 = 1;
        }
    } else if (issubstr(var_7312a46fa51227e3, "gl") || issubstr(var_7312a46fa51227e3, "ubsh")) {
        if (var_3cec9a92a775752e) {
            var_42006c656a8f39fb = var_58a72877a2d03f1a;
            var_f24c44ff50730d8b = var_3ef7a96abde76230;
        }
    } else {
        var_7589f78d5d7ba855 = 1;
    }
    self takeweapon(weapon);
    self giveweapon(newweapon);
    self switchtoweapon(newweapon);
    primary_weapons = self getweaponslistprimaries();
    foreach (weapon in primary_weapons) {
        if (weapon.basename == var_2c9e4ac6987f5630) {
            if (weapon.inventorytype == "altmode") {
                if (isdefined(weapon.underbarrel)) {
                    if (istrue(var_7589f78d5d7ba855)) {
                        self setweaponammoclip(weapon, var_58a72877a2d03f1a);
                        self setweaponammostock(weapon, var_3ef7a96abde76230);
                    } else {
                        if (isdefined(var_87fd41ffd79d9072)) {
                            self setweaponammoclip(weapon, var_87fd41ffd79d9072);
                        } else {
                            self setweaponammoclip(weapon, weaponclipsize(weapon));
                        }
                        if (weapon.underbarrel == "ubshtgn") {
                            self setweaponammostock(weapon, 0);
                        } else if (isdefined(var_e2d00b1889eb04a)) {
                            self setweaponammostock(weapon, var_e2d00b1889eb04a);
                        } else {
                            self setweaponammostock(weapon, scripts\cp\utility::function_ed18a118c6fa5c4f(weapon));
                        }
                    }
                } else {
                    self setweaponammoclip(weapon, clip_ammo);
                    self setweaponammostock(weapon, stock_ammo);
                }
                continue;
            }
            self setweaponammoclip(weapon, clip_ammo);
            self setweaponammostock(weapon, stock_ammo);
        }
    }
    var_674582f0e7ce1160 = spawnstruct();
    var_674582f0e7ce1160.attachment = var_4e5fdcb7f54380f7;
    if (isdefined(var_42006c656a8f39fb)) {
        var_674582f0e7ce1160.var_42006c656a8f39fb = int(float(var_42006c656a8f39fb));
        var_674582f0e7ce1160.var_f24c44ff50730d8b = int(float(var_f24c44ff50730d8b));
    }
    return var_674582f0e7ce1160;
}

// Namespace attachment_pickup / namespace_d6a8a70d90243b1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f8
// Size: 0x2
function function_f0474c520f02df01() {
    
}

