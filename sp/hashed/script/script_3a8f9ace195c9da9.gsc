#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\math.gsc;
#using script_66122a002aff5d57;
#using script_16ddd685a448c6d2;
#using scripts\cp\utility.gsc;
#using script_1c0c872aa3bf0cb0;
#using script_600b944a95c3a7bf;
#using script_56bbc6b044d9068e;
#using script_5d265b4fca61f070;
#using script_2669878cf5a1b6bc;
#using scripts\cp\perks\cp_perks.gsc;
#using script_7ef95bba57dc4b82;
#using script_7c40fa80892a721;
#using scripts\cp_mp\execution.gsc;
#using script_12e2fb553ec1605e;
#using script_4a6760982b403bad;
#using scripts\cp\coop_stealth.gsc;
#using scripts\stealth\player.gsc;
#using scripts\stealth\utility.gsc;
#using script_48324b060b129b7b;
#using script_74502a9e0ef1f19c;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\scene.gsc;
#using script_3a8f9ace195c9da9;
#using scripts\cp\utility\player.gsc;
#using scripts\cp\cp_objectives.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\common\devgui.gsc;
#using script_737f801e6beb18c7;
#using scripts\common\vehicle.gsc;
#using script_6bfe39bd5c12f84a;
#using script_116171939929af39;
#using script_7e7eaa110dbb1c83;
#using script_afb7e332aee4bf2;
#using scripts\cp\cp_checkpoint.gsc;
#using script_46b342a079938c68;
#using scripts\engine\trace.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;

#namespace namespace_96731f4d002634f6;

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c48
// Size: 0x2e3
function spawn_weapon_model(lootid, index, var_e77bd69b16289bb3, modeltype) {
    if (!isdefined(lootid)) {
        println("<dev string:x1c>" + index + "<dev string:x60>" + var_e77bd69b16289bb3);
        return;
    }
    var_9d5e14018a42cda5 = getstruct("loadout_camera", "targetname");
    playerforward = anglestoforward(level.player.angles);
    spawnpos = (0, 0, -50) + var_9d5e14018a42cda5.origin + playerforward * 50;
    if (modeltype == "weapon") {
        var_7553576e6f3295c7 = function_64ccc54bdbae5cf6(lootid);
        var_c008b90277874ace = function_1cc3fd00b6ccc3ba(lootid);
        if (!isdefined(var_c008b90277874ace)) {
            /#
                iprintln("<dev string:x76>" + lootid + "<dev string:x94>" + index);
            #/
            return;
        }
        if (var_c008b90277874ace != "iw9_lm_dblmg_jup_mp") {
            var_c008b90277874ace = function_c4080e8a53a0fed4(var_c008b90277874ace);
        }
        weapon_camo = function_c7771194200d360e(lootid);
        if (var_c008b90277874ace == "iw9_me_fists") {
            weapon_camo = undefined;
        }
        weapon_obj = level.player namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_c008b90277874ace, weapon_camo, "none", var_7553576e6f3295c7, undefined, undefined, 1);
        level.var_7cc74eb243f43287[index] = weapon_obj;
        var_962d7583f68be225 = getcompleteweaponname(weapon_obj);
        level.var_a104ae5b3c263ceb[index] = spawn("weapon_" + var_962d7583f68be225, spawnpos, 1);
    } else if (modeltype == "equipment") {
        level.var_ba87eee4c794214f[index] = spawn("script_model", spawnpos, 1);
        bundlename = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[index].equipment;
        var_6f5ea5f282920343 = getscriptbundle(hashcat(%"hash_1117605451d279d0", bundlename));
        level.var_ba87eee4c794214f[index] setmodel(var_6f5ea5f282920343.model);
    } else if (modeltype == "super") {
        level.var_ba87eee4c794214f[index] = spawn("script_model", spawnpos, 1);
        bundlename = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[index].super;
        superdata = getscriptbundle(hashcat(%"super:", bundlename));
        level.var_ba87eee4c794214f[index] setmodel(superdata.frontendmodel);
    }
    if (var_e77bd69b16289bb3) {
        level.var_a776d05f784ee5ff[index] = lootid;
        level.var_17584db95edfe6f0[index] = modeltype;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f33
// Size: 0x199
function function_a7cfbaaea3046f47() {
    if (isdefined(level.var_a776d05f784ee5ff)) {
        if (isdefined(level.var_ba87eee4c794214f) && level.var_ba87eee4c794214f.size > 0) {
            function_32135cb1e03b2ec8();
        }
        for (i = 0; i < level.var_a776d05f784ee5ff.size; i++) {
            spawn_weapon_model(level.var_a776d05f784ee5ff[i], i, 1, level.var_17584db95edfe6f0[i]);
        }
        return;
    }
    level.var_ba87eee4c794214f = [];
    level.var_a776d05f784ee5ff = [];
    level.var_17584db95edfe6f0 = [];
    var_4c7c8c272a931d5d = self.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d;
    index = 0;
    for (i = 0; i < var_4c7c8c272a931d5d.size; i++) {
        lootid = function_60bebdf35a6b266f(var_4c7c8c272a931d5d, i, function_ce720be6f935d1d4(level.mapname));
        unlock = var_4c7c8c272a931d5d[i];
        if (unlock.weaponblueprint != "" || unlock.weaponid != "") {
            spawn_weapon_model(lootid, index, 1, "weapon");
            index++;
            continue;
        }
        if (unlock.equipment != "") {
            spawn_weapon_model(lootid, index, 1, "equipment");
            index++;
            continue;
        }
        if (unlock.super != "") {
            spawn_weapon_model(lootid, index, 1, "super");
            index++;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20d4
// Size: 0xbb
function function_481bbe989e2575a4(weaponfound, var_62bb3a62a94fbfb1) {
    weaponfound.origin += var_62bb3a62a94fbfb1;
    if (isdefined(level.var_b1c663e72c9df6a3)) {
        level.var_b1c663e72c9df6a3.origin += var_62bb3a62a94fbfb1;
    }
    weaponname = strtok(weaponfound.classname, "+");
    weaponname = weaponname[0];
    println("<dev string:xa0>" + level.var_b1c663e72c9df6a3.targetname + "<dev string:xb0>" + weaponfound.origin);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2197
// Size: 0x21f
function function_758a56fd5a3d8eb3() {
    level notify("singleton_loadout_shifter");
    level endon("singleton_loadout_shifter");
    up_pressed = 0;
    down_pressed = 0;
    var_11db0fb46eb49ba9 = 0;
    var_f8334e63c299ccf8 = 0;
    var_7a67d34d36a09e70 = 0;
    var_72330567b970edd2 = 0;
    level.var_61b4827f1d2e9c74 = undefined;
    while (!isdefined(level.player)) {
        wait 1;
    }
    while (true) {
        if (isdefined(level.var_61b4827f1d2e9c74)) {
            weaponfound = level.var_61b4827f1d2e9c74;
            if (level.player buttonpressed("i") && !up_pressed) {
                up_pressed = 1;
            } else if (up_pressed) {
                up_pressed = 0;
                function_481bbe989e2575a4(weaponfound, (0, 0, 0.1));
            }
            if (level.player buttonpressed("k") && !down_pressed) {
                down_pressed = 1;
            } else if (down_pressed) {
                down_pressed = 0;
                function_481bbe989e2575a4(weaponfound, (0, 0, -0.1));
            }
            if (level.player buttonpressed("j") && !var_11db0fb46eb49ba9) {
                var_11db0fb46eb49ba9 = 1;
            } else if (var_11db0fb46eb49ba9) {
                var_11db0fb46eb49ba9 = 0;
                function_481bbe989e2575a4(weaponfound, (0, 0.1, 0));
            }
            if (level.player buttonpressed("l") && !var_f8334e63c299ccf8) {
                var_f8334e63c299ccf8 = 1;
            } else if (var_f8334e63c299ccf8) {
                var_f8334e63c299ccf8 = 0;
                function_481bbe989e2575a4(weaponfound, (0, -0.1, 0));
            }
            if (level.player buttonpressed("enter") && !var_7a67d34d36a09e70) {
                var_7a67d34d36a09e70 = 1;
            } else if (var_7a67d34d36a09e70) {
                var_7a67d34d36a09e70 = 0;
                function_481bbe989e2575a4(weaponfound, (0.1, 0, 0));
            }
            if (level.player buttonpressed("rshift") && !var_72330567b970edd2) {
                var_72330567b970edd2 = 1;
            } else if (var_72330567b970edd2) {
                var_72330567b970edd2 = 0;
                function_481bbe989e2575a4(weaponfound, (-0.1, 0, 0));
            }
            waitframe();
            continue;
        }
        wait 0.5;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23be
// Size: 0x101
function function_c33f5b700efef63b(slot, equipname) {
    for (i = 0; i < level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d.size; i++) {
        itemref = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].equipment;
        itemref = strip_suffix(itemref, "_cp");
        itemref = strip_suffix(itemref, "_mp");
        itemref = strip_suffix(itemref, "_jup");
        if (itemref == equipname) {
            if (slot == "primary") {
                function_b28ea2077fe04c46(function_ce720be6f935d1d4(level.mapname), "lethalGrenade", i);
                break;
            }
            if (slot == "secondary") {
                function_b28ea2077fe04c46(function_ce720be6f935d1d4(level.mapname), "tacticalGrenade", i);
                break;
            }
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24c7
// Size: 0xc3
function function_769d5ba5e4540f87(supername) {
    for (i = 0; i < level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d.size; i++) {
        itemref = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].super;
        itemref = strip_suffix(itemref, "_cp");
        itemref = strip_suffix(itemref, "_mp");
        itemref = strip_suffix(itemref, "_jup");
        if (itemref == supername) {
            function_b28ea2077fe04c46(function_ce720be6f935d1d4(level.mapname), "fieldEquipment", i);
            break;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2592
// Size: 0x74a
function function_b66c3d85ea26d412() {
    self endon("loadout_class_selected");
    assert(isdefined(level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d));
    setdvar(@"hash_4b2ffd34fab7a20", 0);
    previndex = -1;
    prevclass = "";
    var_9d5e14018a42cda5 = getstruct("loadout_camera", "targetname");
    while (true) {
        self waittill("luinotifyserver", channel, value);
        if (channel == "loadout_item_hovered") {
            self notify("loadout_item_hovered_received");
            for (i = 0; i < level.var_a776d05f784ee5ff.size; i++) {
                if (isdefined(level.var_a776d05f784ee5ff[i]) && level.var_a776d05f784ee5ff[i] == value) {
                    if (i != previndex && issubstr(prevclass, "weapon")) {
                        if (isdefined(level.var_ba87eee4c794214f[previndex])) {
                            level.var_ba87eee4c794214f[previndex] delete();
                            level.var_ba87eee4c794214f[previndex] = undefined;
                        }
                    }
                    /#
                        if (getdvarint(@"hash_4b5c7d9c5837b915", 0) == 1) {
                            level.var_61b4827f1d2e9c74 = level.var_ba87eee4c794214f[i];
                        }
                    #/
                    itemref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(level.var_a776d05f784ee5ff[i]));
                    if (level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].weaponblueprint != "") {
                        itemref = function_1cc3fd00b6ccc3ba(int(level.var_a776d05f784ee5ff[i]));
                        itemref = function_c4080e8a53a0fed4(itemref);
                        var_3977f65b494ec8ba = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].weaponblueprint;
                    }
                    if (level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].equipment != "") {
                        class = "equipment";
                        var_3977f65b494ec8ba = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].equipment;
                    } else if (level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].super != "") {
                        class = "super";
                        var_3977f65b494ec8ba = level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].super;
                    } else {
                        class = getweaponclass(itemref);
                        if (!isdefined(var_3977f65b494ec8ba)) {
                            var_3977f65b494ec8ba = itemref;
                        }
                    }
                    var_f64d8a4a0e335169 = getstruct("loadout_" + var_3977f65b494ec8ba, "targetname");
                    if (isdefined(var_f64d8a4a0e335169) && level.var_1b908bf18691b097.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].weaponblueprint == "jup_jp13_sn_svictor_sp_v1" && isdefined(level.mapname) && level.mapname == "cp_jup_chemical") {
                        var_f64d8a4a0e335169.origin = (-3076.54, 25692.1, -847.321);
                    }
                    var_3977f65b494ec8ba = undefined;
                    var_bbce82cf6d52a22b = (0, 90, 0);
                    if (!isdefined(var_f64d8a4a0e335169)) {
                        switch (class) {
                        case #"hash_8af0086b038622b5":
                            var_f64d8a4a0e335169 = getstruct("loadout_ars", "targetname");
                            break;
                        case #"hash_ab10f9c080fe4faf":
                            var_f64d8a4a0e335169 = getstruct("loadout_smgs", "targetname");
                            break;
                        case #"hash_bef5ec0b3e197ae":
                            var_f64d8a4a0e335169 = getstruct("loadout_lmgs", "targetname");
                            break;
                        case #"hash_16cf6289ab06bd30":
                            var_f64d8a4a0e335169 = getstruct("loadout_shotguns", "targetname");
                            break;
                        case #"hash_c095d67337b1f5a1":
                            var_f64d8a4a0e335169 = getstruct("loadout_snipes", "targetname");
                            break;
                        case #"hash_47368bc0d2ef1565":
                            var_f64d8a4a0e335169 = getstruct("loadout_dmrs", "targetname");
                            break;
                        case #"hash_34340d457a63e7f1":
                            var_f64d8a4a0e335169 = getstruct("loadout_pistols", "targetname");
                            break;
                        case #"hash_a1f27f97be15d620":
                            var_f64d8a4a0e335169 = getstruct("loadout_melee2", "targetname");
                            break;
                        case #"hash_9d18adab1b65a661":
                            var_f64d8a4a0e335169 = getstruct("loadout_launchers", "targetname");
                            break;
                        case #"hash_93c71e7b6c0b81d7":
                            var_f64d8a4a0e335169 = getstruct("loadout_lethals", "targetname");
                            break;
                        case #"hash_e534fd8ec73eafb4":
                            var_f64d8a4a0e335169 = getstruct("loadout_field_upgrades", "targetname");
                            break;
                        default:
                            var_f64d8a4a0e335169 = getstruct("loadout_ars", "targetname");
                            break;
                        }
                    }
                    playerforward = anglestoforward(level.player.angles);
                    spawnpos = (0, 0, -50) + level.player.origin + playerforward * 50;
                    if (previndex >= 0) {
                        if (isdefined(level.var_ba87eee4c794214f[previndex])) {
                            level.var_ba87eee4c794214f[previndex].origin = spawnpos;
                            level.var_ba87eee4c794214f[previndex] dontinterpolate();
                        }
                    }
                    waitframe();
                    if (issubstr(class, "weapon")) {
                        if (!isdefined(level.var_ba87eee4c794214f[i])) {
                            var_962d7583f68be225 = getcompleteweaponname(level.var_7cc74eb243f43287[i]);
                            level.var_ba87eee4c794214f[i] = spawn("weapon_" + var_962d7583f68be225, spawnpos, 1);
                        }
                    }
                    if (isdefined(level.var_ba87eee4c794214f[i])) {
                        thread function_a2100ee5afee7876(var_f64d8a4a0e335169, class, i);
                    }
                    previndex = i;
                    prevclass = class;
                    break;
                }
            }
            continue;
        }
        if (channel == "item_selection_exit") {
            /#
                if (getdvarint(@"hash_4b5c7d9c5837b915", 0) == 1) {
                    level.var_61b4827f1d2e9c74 = undefined;
                }
            #/
            println(level.var_a776d05f784ee5ff.size);
            for (i = 0; i < level.var_a776d05f784ee5ff.size; i++) {
                println(i + "<dev string:xb4>" + level.var_a776d05f784ee5ff[i]);
                playerforward = anglestoforward(level.player.angles);
                spawnpos = (0, 0, -50) + var_9d5e14018a42cda5.origin + playerforward * 50;
                if (isdefined(level.var_ba87eee4c794214f[i])) {
                    level.var_ba87eee4c794214f[i].origin = spawnpos;
                    level.var_ba87eee4c794214f[i] dontinterpolate();
                }
            }
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce4
// Size: 0x17b
function function_a2100ee5afee7876(var_f64d8a4a0e335169, class, i) {
    self endon("loadout_item_hovered_received");
    if (isdefined(var_f64d8a4a0e335169)) {
        if (issubstr(class, "weapon")) {
            var_b60f4ada498a350c = 50;
            var_a4007eb2a63d3e78 = var_b60f4ada498a350c;
            while (!level.var_7cc74eb243f43287[i] function_f4070ccd888c07b9(3, 1)) {
                wait 0.1;
                var_a4007eb2a63d3e78 -= 1;
                if (var_a4007eb2a63d3e78 == 0) {
                    println("<dev string:xc5>" + level.var_a776d05f784ee5ff[i] + "<dev string:xe1>" + var_b60f4ada498a350c * 0.1 + "<dev string:xf5>");
                    break;
                }
            }
        }
        println("<dev string:xc5>" + level.var_a776d05f784ee5ff[i] + "<dev string:x129>" + var_f64d8a4a0e335169.origin);
        level.var_ba87eee4c794214f[i].origin = var_f64d8a4a0e335169.origin;
        /#
            if (getdvarint(@"hash_4b5c7d9c5837b915", 0) == 1) {
                level.var_b1c663e72c9df6a3 = var_f64d8a4a0e335169;
            }
        #/
        if (isdefined(var_f64d8a4a0e335169.angles) && isvector(var_f64d8a4a0e335169.angles)) {
            var_bbce82cf6d52a22b = var_f64d8a4a0e335169.angles;
        }
    }
    level.var_ba87eee4c794214f[i].angles = var_bbce82cf6d52a22b;
    level.var_ba87eee4c794214f[i] dontinterpolate();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e67
// Size: 0xc5
function function_32135cb1e03b2ec8() {
    if (isdefined(level.var_ba87eee4c794214f)) {
        for (i = level.var_ba87eee4c794214f.size - 1; i >= 0; i--) {
            if (isdefined(level.var_ba87eee4c794214f[i])) {
                level.var_ba87eee4c794214f[i] delete();
            }
            level.var_ba87eee4c794214f[i] = undefined;
        }
        level.var_ba87eee4c794214f = undefined;
    }
    if (isdefined(level.var_a104ae5b3c263ceb)) {
        for (i = level.var_a104ae5b3c263ceb.size - 1; i >= 0; i--) {
            if (isdefined(level.var_a104ae5b3c263ceb[i])) {
                level.var_a104ae5b3c263ceb[i] delete();
            }
            level.var_a104ae5b3c263ceb[i] = undefined;
        }
        level.var_a104ae5b3c263ceb = undefined;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f34
// Size: 0x23
function function_8d89ce0ee29f2012() {
    self waittill("loadout_class_selected", value);
    if (value == 1) {
        function_2381e221a64411c2();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5f
// Size: 0x7af
function function_2381e221a64411c2() {
    setdvar(@"hash_4b2ffd34fab7a20", 1);
    if (!isdefined(level.scriptperks["specialty_incendiary"])) {
        scripts\cp\perks\cp_perks::registerscriptperk("specialty_incendiary");
        scripts\cp\utility::giveperk("specialty_incendiary");
    }
    var_45b5d412f51a1445 = namespace_4fb9dddfb8c1a67a::getequipmentslotammo("health");
    if (isdefined(level.var_a18b35bc1529ade3)) {
        self [[ level.var_a18b35bc1529ade3 ]]();
    }
    self takeallweapons();
    level thread function_32135cb1e03b2ec8();
    var_15d0dde23ad3bb64 = function_d97519ec24ef0572(level.var_82191bfa9f751f4c, "primaryWeapon");
    var_80b92ef4bf8f4da4 = function_d97519ec24ef0572(level.var_82191bfa9f751f4c, "secondaryWeapon");
    var_35f27656995012fa = function_d97519ec24ef0572(level.var_82191bfa9f751f4c, "lethalGrenade");
    var_2838a63ddcefcddb = function_d97519ec24ef0572(level.var_82191bfa9f751f4c, "tacticalGrenade");
    var_4587f0e982edf200 = function_d97519ec24ef0572(level.var_82191bfa9f751f4c, "fieldEquipment");
    self.var_ff741d59e10631a = [];
    self.var_ff741d59e10631a[0] = var_15d0dde23ad3bb64;
    self.var_ff741d59e10631a[1] = var_80b92ef4bf8f4da4;
    var_9633e389beca7d52 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_15d0dde23ad3bb64)));
    var_1bfc508d9d4df492 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_80b92ef4bf8f4da4)));
    var_8967bb722103cd58 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_35f27656995012fa)));
    var_acf4240d189539a7 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_2838a63ddcefcddb)));
    var_7acc1a8b69e79b42 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_4587f0e982edf200)));
    var_dc3cf59695a3e26b = function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_15d0dde23ad3bb64);
    var_e01354377432ecab = function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_80b92ef4bf8f4da4);
    var_7eb440195b5b964d = function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_35f27656995012fa);
    var_b89095f886e9dcaa = function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_2838a63ddcefcddb);
    var_de7804d5414e8c51 = function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_4587f0e982edf200);
    currentloadout = [var_dc3cf59695a3e26b, var_e01354377432ecab, var_7eb440195b5b964d, var_b89095f886e9dcaa, var_de7804d5414e8c51];
    currentloadout = array_removeundefined(currentloadout);
    var_324375f2f392c8ee = level.var_1b908bf18691b097.var_9fe46adfd5a9aa19;
    var_bcaf3654a128dc26 = 1;
    foreach (itemid in currentloadout) {
        if (!istrue(array_contains(var_324375f2f392c8ee, itemid))) {
            var_bcaf3654a128dc26 = 0;
            break;
        }
    }
    if (!istrue(var_bcaf3654a128dc26)) {
        println("<dev string:x13b>" + level.var_82191bfa9f751f4c);
        level.player function_2bd9c79b322a6eae("SandBoxAchievementData", level.var_82191bfa9f751f4c + "_changedloadout", 1);
        level thread function_de2d867ede2eebdf();
    }
    var_2c657d4291f00115 = function_1cc3fd00b6ccc3ba(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_15d0dde23ad3bb64)));
    var_2c657d4291f00115 = function_c4080e8a53a0fed4(var_2c657d4291f00115);
    if (var_2c657d4291f00115 == "iw9_drown") {
        var_2c657d4291f00115 = "iw9_me_fists";
    }
    var_fd464247e82127cb = function_64ccc54bdbae5cf6(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_15d0dde23ad3bb64)));
    var_2be2590c0684a555 = function_1cc3fd00b6ccc3ba(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_80b92ef4bf8f4da4)));
    var_2be2590c0684a555 = function_c4080e8a53a0fed4(var_2be2590c0684a555);
    if (var_2be2590c0684a555 == "iw9_drown") {
        var_2be2590c0684a555 = "iw9_me_fists";
    }
    var_bb70007d1fdc480b = function_64ccc54bdbae5cf6(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_80b92ef4bf8f4da4)));
    primarycamo = function_c7771194200d360e(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_15d0dde23ad3bb64)));
    primary = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_2c657d4291f00115, primarycamo, undefined, var_fd464247e82127cb);
    secondary = undefined;
    secondarycamo = function_c7771194200d360e(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_80b92ef4bf8f4da4)));
    if (var_2be2590c0684a555 != "") {
        secondary = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_2be2590c0684a555, secondarycamo, undefined, var_bb70007d1fdc480b);
    } else {
        secondary = namespace_e0ee43ef2dddadaa::buildweapon(var_1bfc508d9d4df492, undefined, secondarycamo);
    }
    /#
        if (!function_7ff93cc9f74e1d68(primary) && var_2c657d4291f00115 != "<dev string:x161>") {
            var_f8b3d328c425a168 = makeweapon(function_1cc3fd00b6ccc3ba(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_15d0dde23ad3bb64))), primary.attachments);
            primary = var_f8b3d328c425a168;
        }
        if (!function_7ff93cc9f74e1d68(secondary) && var_2be2590c0684a555 != "<dev string:x161>") {
            var_1a6922fe693b3eb8 = makeweapon(function_1cc3fd00b6ccc3ba(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_80b92ef4bf8f4da4))), secondary.attachments);
            secondary = var_1a6922fe693b3eb8;
        }
    #/
    if (primary.basename != "defaultweapon") {
        self giveweapon(primary, undefined, primary.isdualwield, -1, istrue(self.var_a4f4164908559548));
        var_a315a5e37d7f0f61 = self.var_a4f4164908559548;
        self.var_a4f4164908559548 = undefined;
        self.var_c78381bf9f73c34e = 1;
        self notify("gave_weapon");
    }
    if (istrue(level.var_b9d5a2af2d535f77)) {
        self waittill("swap_weapon");
    }
    self switchtoweapon(primary);
    if (secondary.basename != "defaultweapon") {
        self giveweapon(secondary);
    }
    namespace_6250b14b3f614101::giveammo(self);
    namespace_4fb9dddfb8c1a67a::clearallequipment();
    if (namespace_38b993c4618e76cd::function_282cf83c9eeda744(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_35f27656995012fa))) == "equipment") {
        namespace_4fb9dddfb8c1a67a::giveequipment(var_8967bb722103cd58, "primary");
    }
    if (namespace_38b993c4618e76cd::function_282cf83c9eeda744(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_2838a63ddcefcddb))) == "equipment") {
        namespace_4fb9dddfb8c1a67a::giveequipment(var_acf4240d189539a7, "secondary");
    }
    namespace_4fb9dddfb8c1a67a::function_1ab06e1478168800();
    if (namespace_38b993c4618e76cd::function_282cf83c9eeda744(int(function_e511e6f4347ff261(level.var_82191bfa9f751f4c, var_4587f0e982edf200))) == "super") {
        forcegivesuper(var_7acc1a8b69e79b42);
    }
    if (isdefined(var_45b5d412f51a1445)) {
        function_774133dc8df0ccd5(var_45b5d412f51a1445);
    }
    var_34c0881201a93176 = "jup_execution_first_person_001";
    if (isdefined(level.var_2a226e97d7ab297)) {
        var_34c0881201a93176 = level.var_2a226e97d7ab297;
    }
    scripts\cp_mp\execution::_giveexecution(var_34c0881201a93176, 1);
    loadoutstruct = spawnstruct();
    loadoutstruct.player = level.player;
    loadoutstruct.primaryweapon = var_9633e389beca7d52;
    loadoutstruct.secondaryweapon = var_1bfc508d9d4df492;
    loadoutstruct.lethalGrenade = var_8967bb722103cd58;
    loadoutstruct.tactical = var_acf4240d189539a7;
    loadoutstruct.fieldupgrade = var_7acc1a8b69e79b42;
    namespace_751288259782653c::function_a6eb74f88574f882();
    namespace_751288259782653c::function_a01818ae9edecbe6(1);
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_loadout_changed", loadoutstruct);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3716
// Size: 0x14
function function_8b4a89ac15af6483(spawned) {
    thread function_aaaf73cfeb6433fb(spawned);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3732
// Size: 0x13a
function function_aaaf73cfeb6433fb(spawned) {
    if (issubstr(self.model, "body") && self.classname == "script_model") {
        self endon("death");
        spawned endon("death");
        namespace_c5f7e08ad7ea4280::function_8ba05ef17e2b7d10(spawned, self.team);
        while (true) {
            var_f9180f1cc14005fe = self function_552a60676985f5b2();
            if (isdefined(var_f9180f1cc14005fe) && (var_f9180f1cc14005fe.size == 1 || var_f9180f1cc14005fe.size == 2)) {
                if (var_f9180f1cc14005fe.size == 1 || var_f9180f1cc14005fe[0]["animtime"] < var_f9180f1cc14005fe[1]["animtime"]) {
                    var_a5c34c14d305079 = var_f9180f1cc14005fe[0];
                } else {
                    var_a5c34c14d305079 = var_f9180f1cc14005fe[1];
                }
                var_feb41c9e9eab7f7f = var_a5c34c14d305079["animtime"];
                var_6f7d9378a2df16d9 = var_a5c34c14d305079["name"];
                if (var_feb41c9e9eab7f7f < 0.015) {
                    spawned scriptmodelplayanim(var_6f7d9378a2df16d9, undefined, 0);
                } else {
                    animation = var_a5c34c14d305079["animation"];
                    var_ceaeb39d91d4f57f = getanimlength(animation) * var_feb41c9e9eab7f7f;
                    spawned scriptmodelplayanim(animation, undefined, var_ceaeb39d91d4f57f);
                }
                self waittill("stop_sequencing_notetracks");
                continue;
            }
            break;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3874
// Size: 0x62
function function_65938d8e60837b34() {
    self notify("setup_player_stealth");
    self endon("setup_player_stealth");
    self endon("disconnect");
    if (scripts\cp\coop_stealth::level_should_run_sp_stealth()) {
        flag_wait("level_stealth_initialized");
        scripts\stealth\player::main();
        if (getdvarint(@"hash_93e4fa38585a6c6f", 0) != 0) {
            function_531194f673a06de5(1);
        } else {
            function_531194f673a06de5(0);
        }
        thread scripts\cp\coop_stealth::suspicious_door_monitor();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38de
// Size: 0x76
function function_51f974c859969b7e() {
    if (isdefined(level.var_6465a2cba220aab3)) {
        return;
    }
    function_574f8f02f2bbf6fa("price", "jup_cp_price");
    function_574f8f02f2bbf6fa("gaz", "jup_cp_gaz");
    function_574f8f02f2bbf6fa("soap", "jup_cp_soap");
    function_574f8f02f2bbf6fa("ghost", "jup_cp_ghost");
    function_574f8f02f2bbf6fa("farah", "jup_cp_farah");
    function_574f8f02f2bbf6fa("farah_port", "jup_cp_farah_port");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x395c
// Size: 0x107
function function_61411c49eaca86e2(var_90c8edea1e8b793a) {
    var_8e04f647cb8c4021 = undefined;
    var_15655027aaaacf68 = undefined;
    var_965cd465abaa1a = undefined;
    var_3e8686bd64fd3f91 = undefined;
    var_7c8ee05acd3a6e01 = undefined;
    var_461d3a38ea2cbe91 = undefined;
    if (!isdefined(level.var_6465a2cba220aab3)) {
        function_51f974c859969b7e();
    }
    /#
        if (getdvar(@"hash_9a41dcb00ef528c4", "<dev string:x16e>") != "<dev string:x16e>") {
            var_90c8edea1e8b793a = getdvar(@"hash_9a41dcb00ef528c4");
        }
    #/
    if (var_90c8edea1e8b793a == "null") {
        return;
    }
    var_9544bada23b1e335 = level.var_6465a2cba220aab3[var_90c8edea1e8b793a];
    if (isdefined(var_9544bada23b1e335)) {
        namespace_751288259782653c::function_ef21ab05bfa5c5a1(var_9544bada23b1e335.var_8e04f647cb8c4021, var_9544bada23b1e335.var_15655027aaaacf68, var_9544bada23b1e335.var_965cd465abaa1a, var_9544bada23b1e335.var_3e8686bd64fd3f91, var_9544bada23b1e335.var_7c8ee05acd3a6e01, var_9544bada23b1e335.var_461d3a38ea2cbe91);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6b
// Size: 0xd5
function function_574f8f02f2bbf6fa(var_aa3ccf1cd864619b, operator, head, body, vm, suit, var_461d3a38ea2cbe91) {
    if (!isdefined(level.var_6465a2cba220aab3)) {
        level.var_6465a2cba220aab3 = [];
    }
    var_9544bada23b1e335 = spawnstruct();
    var_9544bada23b1e335.var_8e04f647cb8c4021 = operator;
    var_9544bada23b1e335.var_15655027aaaacf68 = head;
    var_9544bada23b1e335.var_965cd465abaa1a = body;
    var_9544bada23b1e335.var_3e8686bd64fd3f91 = vm;
    var_9544bada23b1e335.var_7c8ee05acd3a6e01 = suit;
    var_9544bada23b1e335.var_461d3a38ea2cbe91 = var_461d3a38ea2cbe91;
    level.var_6465a2cba220aab3[var_aa3ccf1cd864619b] = var_9544bada23b1e335;
    /#
        function_682da8addae457fd(var_aa3ccf1cd864619b, level.var_6465a2cba220aab3.size);
    #/
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b48
// Size: 0x10
function function_9250dfcc43a9ccb9() {
    level.getspawnpoint = &function_361c013a939bf3b7;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b60
// Size: 0xdc
function function_361c013a939bf3b7() {
    var_d95f0483aa7fd94d = level.start_point + "_start";
    var_89770fe705541944 = getstructarray(var_d95f0483aa7fd94d, "targetname");
    if (var_89770fe705541944.size == 0) {
        assertmsg("getCustomSpawnPoint() - Trying to spawn player at struct w/ targetname '" + var_d95f0483aa7fd94d + "' for startpoint '" + level.start_point + "' but there are no such structs");
    }
    for (i = 0; i < level.players.size; i++) {
        if (self == level.players[i]) {
            if (!isdefined(level.player_respawn)) {
                level.player_respawn = [];
            }
            if (!isdefined(level.player_respawn[i])) {
                self.respawn_index = i;
                level.player_respawn[i] = var_89770fe705541944[i];
            }
            return level.player_respawn[i];
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c44
// Size: 0x72
function function_14f52e3e375a2355(ent1, ent2) {
    dist1 = distance(ent1.origin, level.player.origin);
    dist2 = distance(ent2.origin, level.player.origin);
    return dist1 < dist2;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3cbf
// Size: 0x19
function delaynotify(time, notify_string) {
    wait time;
    self notify(notify_string);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ce0
// Size: 0x1d
function function_1c4d592029f2b0d3(name) {
    if (!isdefined(name)) {
        return undefined;
    }
    return getent(name, "targetname");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d06
// Size: 0x1d
function function_3fd029c94a177d06(name) {
    if (!isdefined(name)) {
        return undefined;
    }
    return getentarray(name, "targetname");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2c
// Size: 0x1e
function function_7a18da6e48b71c35(name) {
    if (!isdefined(name)) {
        return undefined;
    }
    return getstruct(name, "targetname");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d53
// Size: 0x78
function function_da0fc97699b7c873(var_32d37323ddc0f39d) {
    ent_array = getentarray(var_32d37323ddc0f39d, "targetname");
    foreach (ent in ent_array) {
        if (level.player istouching(ent)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd4
// Size: 0x1d
function function_ef5226389e773adc(name) {
    if (!isdefined(name)) {
        return undefined;
    }
    return getnode(name, "targetname");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3dfa
// Size: 0x26
function delete_on_flag(wait_flag) {
    self endon("death");
    flag_wait(wait_flag);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3e28
// Size: 0x4f
function function_ec0d7ba8c7cd4120(var_197fd3fbcd4abbff, var_63c7e7f5afe86d25, var_edbc734145da38e, var_f56aa5622073f649, var_8758e8a11616e552) {
    var_c8e0f2d22b1cc2f4 = getentarray(var_197fd3fbcd4abbff, "targetname");
    level thread function_c7a2e07632403134(var_c8e0f2d22b1cc2f4, var_63c7e7f5afe86d25, var_edbc734145da38e, var_f56aa5622073f649, var_8758e8a11616e552);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x3e7f
// Size: 0x1cd
function private function_c7a2e07632403134(var_c8e0f2d22b1cc2f4, var_63c7e7f5afe86d25, var_edbc734145da38e, var_f56aa5622073f649, var_8758e8a11616e552) {
    while (!isdefined(level.players) || !isdefined(level.players[0])) {
        waitframe();
    }
    level.players[0] endon("death");
    level.players[0] endon("disconnect");
    if (!isdefined(var_63c7e7f5afe86d25)) {
        var_63c7e7f5afe86d25["prone"] = 100;
        var_63c7e7f5afe86d25["crouch"] = 200;
        var_63c7e7f5afe86d25["stand"] = 600;
    }
    if (!isdefined(var_edbc734145da38e)) {
        var_edbc734145da38e["prone"] = 200;
        var_edbc734145da38e["crouch"] = 600;
        var_edbc734145da38e["stand"] = 800;
    }
    if (!isdefined(var_f56aa5622073f649)) {
        var_f56aa5622073f649["prone"] = 0;
        var_f56aa5622073f649["crouch"] = 0;
        var_f56aa5622073f649["stand"] = 0;
    }
    if (!isdefined(var_8758e8a11616e552)) {
        var_8758e8a11616e552["prone"] = 0;
        var_8758e8a11616e552["crouch"] = 0;
        var_8758e8a11616e552["stand"] = 0;
    }
    scripts\stealth\utility::function_f3883fe06a11269(var_f56aa5622073f649, var_8758e8a11616e552);
    level.var_9e86aa94cdbc3b82 = 0;
    while (true) {
        var_ce23b5f1f6a7ac71 = 0;
        foreach (vol in var_c8e0f2d22b1cc2f4) {
            if (level.players[0] istouching(vol)) {
                var_ce23b5f1f6a7ac71 = 1;
                break;
            }
        }
        if (level.var_9e86aa94cdbc3b82 != var_ce23b5f1f6a7ac71) {
            if (var_ce23b5f1f6a7ac71) {
                var_fac370d058479827 = var_63c7e7f5afe86d25;
                var_fb574b7959625bf0 = var_edbc734145da38e;
            } else {
                var_fac370d058479827 = var_f56aa5622073f649;
                var_fb574b7959625bf0 = var_8758e8a11616e552;
            }
            scripts\stealth\utility::function_f3883fe06a11269(var_fac370d058479827, var_fb574b7959625bf0);
            level.var_9e86aa94cdbc3b82 = var_ce23b5f1f6a7ac71;
        }
        waitframe();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4054
// Size: 0x5f
function function_fa7c87f2585bd907(var_12f15f7e611a7314) {
    if (!isdefined(var_12f15f7e611a7314)) {
        var_12f15f7e611a7314 = 1;
    }
    if (var_12f15f7e611a7314) {
        level thread [[ level.endgame ]]("allies", level.end_game_string_index["win"]);
        return;
    }
    level thread [[ level.endgame ]]("axis", level.end_game_string_index["fail"]);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x40bb
// Size: 0x59
function function_a0d4a0a7264d1772(mission_name, item_id, var_2e474b73e6b424df) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    self function_2bd9c79b322a6eae("sandboxInventoryData", mission_name, "SboxItems", item_id, "unlockState", var_2e474b73e6b424df);
    level.var_a314f28155dfb0f9[item_id] = var_2e474b73e6b424df;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x411c
// Size: 0x42
function function_fef34e1a36b57bf6(mission_name, item_id) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    return self function_f811dfc822b6f33a("sandboxInventoryData", mission_name, "SboxItems", item_id, "unlockState");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4167
// Size: 0x59
function function_23092c668a272b35(mission_name, item_id, item_ref) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    self function_2bd9c79b322a6eae("sandboxInventoryData", mission_name, "SboxItems", item_id, "itemID", item_ref);
    level.var_a314f28155dfb0f9[item_id] = item_ref;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41c8
// Size: 0x42
function function_e511e6f4347ff261(mission_name, item_id) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    return self function_f811dfc822b6f33a("sandboxInventoryData", mission_name, "SboxItems", item_id, "itemID");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4213
// Size: 0x59
function function_10e81f91fc857e5e(mission_name, item_id, var_847005bc86397401) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    self function_2bd9c79b322a6eae("sandboxInventoryData", mission_name, "SboxItems", item_id, "isNewUnlock", var_847005bc86397401);
    level.var_bf0aff1dbb6d18ce[item_id] = var_847005bc86397401;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4274
// Size: 0x42
function function_4c4f0a229229ad62(mission_name, item_id) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    return self function_f811dfc822b6f33a("sandboxInventoryData", mission_name, "SboxItems", item_id, "isNewUnlock");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42bf
// Size: 0x38
function function_d97519ec24ef0572(mission_name, loadout_slot) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    return self function_f811dfc822b6f33a("sandboxLoadoutData", mission_name, loadout_slot);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4300
// Size: 0x42
function function_b28ea2077fe04c46(mission_name, loadout_slot, item_id) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    self function_2bd9c79b322a6eae("sandboxLoadoutData", mission_name, loadout_slot, item_id);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x434a
// Size: 0x5c
function function_46c9df4f42d97bfd(mission_name) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    for (i = 0; i < 40; i++) {
        level.player function_a0d4a0a7264d1772(mission_name, i, 0);
        level.var_a314f28155dfb0f9[i] = 0;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43ae
// Size: 0x5e
function function_9a4cab249e22a036(mission_name) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    for (i = 0; i < 40; i++) {
        level.player function_a0d4a0a7264d1772(mission_name, i, 1);
        level.var_a314f28155dfb0f9[i] = 1;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4414
// Size: 0x8c
function function_c2368b5493761df9(mission_name) {
    mission_name = default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    level.var_a314f28155dfb0f9 = [];
    level.var_bf0aff1dbb6d18ce = [];
    for (i = 0; i < 40; i++) {
        level.var_a314f28155dfb0f9[i] = istrue(level.player function_fef34e1a36b57bf6(mission_name, i));
        level.var_bf0aff1dbb6d18ce[i] = istrue(level.player function_4c4f0a229229ad62(mission_name, i));
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44a8
// Size: 0xa9
function function_f7475c0922084f67(mission_name) {
    default_to(mission_name, function_ce720be6f935d1d4(level.mapname));
    for (i = 0; i < 40; i++) {
        level.player function_a0d4a0a7264d1772(mission_name, i, 0);
        level.player function_10e81f91fc857e5e(mission_name, i, 0);
        level.var_a314f28155dfb0f9[i] = 0;
        level.var_bf0aff1dbb6d18ce[i] = 0;
    }
    level.player function_b28ea2077fe04c46(mission_name, "lethalGrenade", 0);
    level.player function_b28ea2077fe04c46(mission_name, "primaryWeapon", 0);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4559
// Size: 0x4
function function_f912da4730b0d087() {
    return 40;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x4566
// Size: 0x1be
function function_238241ece18c042c(var_8b0921e666da27c8, offset, userange, displayrange, hintstring, hinticon, var_d1fdd329f0bbe3e5, priority, var_7cff52334740fd08) {
    var_cffca1a9623f41d5 = spawn("script_model", self.origin, 40);
    var_cffca1a9623f41d5.angles = self.angles;
    if (isdefined(offset)) {
        var_cffca1a9623f41d5.origin += offset;
    }
    if (isdefined(var_8b0921e666da27c8)) {
        var_cffca1a9623f41d5 setmodel(var_8b0921e666da27c8);
    }
    displayrange = default_to(displayrange, 200);
    userange = default_to(userange, 60);
    priority = default_to(priority, -10);
    var_d1fdd329f0bbe3e5 = default_to(var_d1fdd329f0bbe3e5, "show");
    hintstring = default_to(hintstring, %MP/LIGHT_SWITCH);
    hinttag = undefined;
    hinttype = "HINT_BUTTON";
    usefov = 360;
    hintfov = 360;
    duration = "duration_short";
    var_cffca1a9623f41d5 scripts\cp\utility::sethintobject(hinttag, hinttype, hinticon, hintstring, priority, duration, var_d1fdd329f0bbe3e5, displayrange, hintfov, userange, usefov);
    foreach (player in level.players) {
        var_cffca1a9623f41d5 enableplayeruse(player);
    }
    if (isdefined(var_7cff52334740fd08)) {
        thread internal_hint_toggle_use_by_angles(var_cffca1a9623f41d5, var_7cff52334740fd08, userange);
    }
    return var_cffca1a9623f41d5;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x472d
// Size: 0x15f
function private internal_hint_toggle_use_by_angles(var_52145fc3d0fab939, var_d9be5b54e8a3f098, userange) {
    assert(isdefined(self.angles), "<dev string:x16f>");
    self endon("death");
    self endon("hint_destroyed");
    if (!isdefined(level.player)) {
        /#
            iprintlnbold("<dev string:x1b4>");
        #/
        return;
    }
    level.player endon("death");
    var_c5f846c1088d726e = 1;
    var_2fef5331164585f9 = cos(var_d9be5b54e8a3f098);
    while (true) {
        if (!function_44daa65837a12044(level.player, self.origin, userange * 3)) {
            wait 2;
            continue;
        } else {
            waitframe();
        }
        origin = self.origin;
        angles = self.angles;
        fwd = anglestoforward(angles);
        var_64ef820441895b24 = vectornormalize(level.player geteye() - origin);
        dot = vectordot(fwd, var_64ef820441895b24);
        can_use = dot >= var_2fef5331164585f9;
        if (can_use != var_c5f846c1088d726e) {
            if (can_use) {
                var_52145fc3d0fab939 setuserange(userange);
            } else {
                var_52145fc3d0fab939 setuserange(1);
            }
            var_c5f846c1088d726e = can_use;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4894
// Size: 0xf0
function function_7546ccfe83476b5c() {
    var_8af4b3d4b300ab3f = getentarray("cp_jup_itembox", "targetname");
    foreach (var_e0bcc7da9dbd4c17 in var_8af4b3d4b300ab3f) {
        var_20dcca919eadf136 = spawnstruct();
        var_20dcca919eadf136.origin = var_e0bcc7da9dbd4c17.origin;
        var_20dcca919eadf136.angles = var_e0bcc7da9dbd4c17.angles;
        var_e0bcc7da9dbd4c17.usetrigger = var_20dcca919eadf136 thread function_238241ece18c042c(undefined, (0, 0, 20), 100, undefined, "", undefined, "hide");
        var_e0bcc7da9dbd4c17.var_41dd6b4fc3fbbd3c = int(var_e0bcc7da9dbd4c17.script_noteworthy);
        var_e0bcc7da9dbd4c17 thread function_ad29c6d3e109149d();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x498c
// Size: 0x51
function function_ad29c6d3e109149d() {
    self.usetrigger waittill("trigger");
    namespace_23750629c2b7a3d3::temp_dialogue("Item box collected!");
    level.player function_a0d4a0a7264d1772(level.mapname, self.var_41dd6b4fc3fbbd3c, 1);
    self.usetrigger delete();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49e5
// Size: 0xd7
function function_17e182dda2380009() {
    var_880d6cf79089d010 = getentarray("cp_loot_box", "targetname");
    foreach (var_8b442a017fbc9c54 in var_880d6cf79089d010) {
        var_7b140f3d2485af1a = getstruct(var_8b442a017fbc9c54.target, "targetname");
        var_d89706e203d76d4c = getent(var_7b140f3d2485af1a.target, "targetname");
        var_8b442a017fbc9c54.usetrigger = var_7b140f3d2485af1a thread function_238241ece18c042c(undefined, undefined, undefined, undefined, "", undefined, "hide");
        var_8b442a017fbc9c54.var_f89520dab87e80de = var_d89706e203d76d4c;
        var_8b442a017fbc9c54 thread function_c60d6a7e70d312c2();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac4
// Size: 0xf1
function function_295fb0103fd4f3b9() {
    var_d1baff6e6a8fe26c = getentarray("cp_loadout_pile", "targetname");
    foreach (var_78ba9777544f5f97 in var_d1baff6e6a8fe26c) {
        var_f1434fd5dfcf684d = getstruct(var_78ba9777544f5f97.target, "targetname");
        var_f1434fd5dfcf684d.angles = (0, 0, 0);
        var_a47b297ace5691c9 = getent(var_f1434fd5dfcf684d.target, "targetname");
        var_78ba9777544f5f97.usetrigger = var_f1434fd5dfcf684d thread function_238241ece18c042c(undefined, undefined, 120, undefined, "", undefined, "hide");
        var_78ba9777544f5f97.var_f89520dab87e80de = var_a47b297ace5691c9;
        var_78ba9777544f5f97 thread function_4af250952ae91caf();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bbd
// Size: 0x2b
function function_4af250952ae91caf() {
    while (true) {
        self.usetrigger waittill("trigger");
        function_b5587a46d5f44f68(level.player);
        waitframe();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf0
// Size: 0x52
function function_c60d6a7e70d312c2() {
    self.usetrigger waittill("trigger");
    namespace_23750629c2b7a3d3::temp_dialogue("Loot box collected!");
    self.var_f89520dab87e80de connectpaths();
    self.var_f89520dab87e80de delete();
    self.usetrigger delete();
    self delete();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4a
// Size: 0x3d
function function_c2a4331f598ca13e(disconnect_paths) {
    if (isdefined(self)) {
        self hide();
        self notsolid();
        if (self.classname != "script_model" && istrue(disconnect_paths)) {
            self connectpaths();
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c8f
// Size: 0x3d
function function_702ec76ba0d8ebad(connect_paths) {
    if (isdefined(self)) {
        self show();
        self solid();
        if (self.classname != "script_model" && istrue(connect_paths)) {
            self disconnectpaths();
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd4
// Size: 0x62
function function_30760b510aeb8b65(fov_value, fov_time) {
    if (!isdefined(level.var_61017590a469f2de)) {
        level.var_61017590a469f2de = getdvarint(@"hash_b38fcf293d1e91a8", 65);
    }
    if (!isdefined(fov_value)) {
        fov_value = level.var_61017590a469f2de;
    }
    if (!isdefined(fov_time)) {
        fov_time = 0;
    }
    level.player modifybasefov(fov_value, fov_time);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d3e
// Size: 0x87
function function_79a4d351eac40e17(toggle) {
    if (!isdefined(toggle)) {
        toggle = 1;
    }
    if (istrue(toggle)) {
        self scriptabledoorfreeze(1);
        self function_9af4c9b2cc1bf989(1);
        self.blocked = 1;
        self.var_a16669fdd0578e00 = 0;
        self disablescriptableplayeruse(level.player);
        return;
    }
    self scriptabledoorfreeze(0);
    self function_80902296b05be00a();
    self enablescriptableplayeruse(level.player);
    self.blocked = undefined;
    self.var_a16669fdd0578e00 = 1;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dcd
// Size: 0x107
function function_d8e8164dba3b33c9(steam) {
    vehicles = vehicle_getarray();
    if (vehicles.size < 1) {
        return vehicles;
    }
    steam = default_to(steam, "axis");
    temp_array = [];
    foreach (vehicle in vehicles) {
        if (is_equal(vehicle.team, steam)) {
            temp_array[temp_array.size] = vehicle;
        }
    }
    vehicles = temp_array;
    if (vehicles.size < 1) {
        return vehicles;
    }
    var_516e71354a7ab950 = [];
    foreach (vehicle in vehicles) {
        if (vehicle istouching(self)) {
            var_516e71354a7ab950[var_516e71354a7ab950.size] = vehicle;
        }
    }
    return var_516e71354a7ab950;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4edd
// Size: 0x33
function function_7cc9b8f5c34a4300(ent) {
    trigger = function_1c4d592029f2b0d3(ent);
    while (!level.player istouching(trigger)) {
        waitframe();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f19
// Size: 0x75
function spawn_anim_model(animname, origin, angles) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    model = spawn("script_model", origin);
    model.animname = animname;
    model assign_model();
    model assign_animtree();
    if (isdefined(angles)) {
        model.angles = angles;
    }
    return model;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f97
// Size: 0x60
function assign_animtree(animname) {
    if (isdefined(animname)) {
        self.animname = animname;
    }
    assertex(isdefined(level.scr_animtree[self.animname]), "There is no level.scr_animtree for animname " + self.animname);
    self useanimtree(level.scr_animtree[self.animname]);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fff
// Size: 0xa6
function assign_model() {
    assertex(isdefined(level.scr_model[self.animname]), "There is no level.scr_model for animname " + self.animname);
    if (isarray(level.scr_model[self.animname])) {
        randindex = randomint(level.scr_model[self.animname].size);
        self setmodel(level.scr_model[self.animname][randindex]);
        return;
    }
    self setmodel(level.scr_model[self.animname]);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50ad
// Size: 0x104
function function_acc596689d609fdf() {
    if (!isdefined(level.player)) {
        level waittill("player_spawned");
    }
    weapon_string = undefined;
    var_ffad5db0cade7e2d = undefined;
    foreach (weapon in level.player.primaryweapons) {
        if (function_fd11e651c16415b4(weapon.basename)) {
            weapon_string = weapon.basename;
            var_ffad5db0cade7e2d = weapon.attachments;
            break;
        }
    }
    if (!isdefined(weapon_string)) {
        weapon_string = "iw9_ar_mike4_mp";
    }
    objweapon = namespace_a0628d6954815ef8::spawn_script_weapon(weapon_string, var_ffad5db0cade7e2d, self gettagorigin("j_gun"), self gettagangles("j_gun"));
    objweapon dontinterpolate();
    objweapon makeunusable();
    objweapon linkto(self, "j_gun");
    return objweapon;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51ba
// Size: 0x53
function function_fd11e651c16415b4(weapon_name) {
    if (!isdefined(weapon_name)) {
        return false;
    }
    if (issubstr(weapon_name, "iw9_la_") || issubstr(weapon_name, "iw9_me_")) {
        return false;
    }
    if (issubstr(weapon_name, "iw9_pi_")) {
        return false;
    }
    if (issubstr(weapon_name, "gunless")) {
        return false;
    }
    return true;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5216
// Size: 0x10b
function function_a88c360e19062b00(var_58dff5bcf8df104b) {
    if (istrue(var_58dff5bcf8df104b)) {
        if (isdefined(level.var_5e84860df880bbce)) {
            level.var_5e84860df880bbce show();
            if (isdefined(level.var_5e84860df880bbce.headmodel)) {
                level.var_5e84860df880bbce.headmodel show();
            }
            if (isdefined(level.var_5e84860df880bbce.weapon)) {
                level.var_5e84860df880bbce.weapon show();
            }
        }
        return;
    }
    if (isdefined(level.var_5e84860df880bbce)) {
        level.var_5e84860df880bbce hide();
        if (isdefined(level.var_5e84860df880bbce.headmodel)) {
            level.var_5e84860df880bbce.headmodel hide();
        }
        if (isdefined(level.var_5e84860df880bbce.weapon)) {
            level.var_5e84860df880bbce.weapon hide();
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5329
// Size: 0xd8
function igc_camera(bool) {
    registered = "igc";
    function_1ae8f046dee579e0(bool);
    if (bool) {
        level.player setstance("stand", 1, 1, 1);
        level.player val::set(registered, "freezecontrols", 1);
        level.player val::set(registered, "cinematic_motion", 0);
        level.player val::set(registered, "weapon", 0);
        level.player val::set(registered, "damage", 0);
        level.player val::set(registered, "breath_system", 0);
        level.player cleardamageindicators();
        return;
    }
    level.player val::reset_all(registered);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5409
// Size: 0x17
function function_1ae8f046dee579e0(bool) {
    setomnvar("ui_cutscene_active", bool);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5428
// Size: 0xe
function function_63171981a45b3ad8() {
    return getomnvar("ui_cutscene_active") > 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x543f
// Size: 0x12
function function_e483413541e6f5cc() {
    self notify("stop_loop");
    scripts\asm\shared\mp\utility::cancelanimscriptmp();
    waittillframeend();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5459
// Size: 0x3a
function function_a455e04c3087c72b(channel, val) {
    if (channel == "bink_complete") {
        level notify("bink_complete");
        return;
    }
    if (channel == "skip_bink_input") {
        level notify("skip_bink_input");
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x549b
// Size: 0x250
function skip_intro(anim_org, var_5954cdf3d7a5a71a, var_86738c912cfa8014) {
    scripts\cp_mp\utility\game_utility::fadetoblackforplayer(level.player, 1, 0);
    foreach (ent in var_5954cdf3d7a5a71a) {
        ent dontinterpolate();
        anim_org thread anim_single_solo(ent, var_86738c912cfa8014);
        if (isai(ent)) {
            ent show();
        }
    }
    wait 0.1;
    if (isdefined(level.player.var_f296f7e55b9e9150)) {
        level.player modifybasefov(level.player.var_f296f7e55b9e9150, 0.05);
    }
    var_3868e4075b0909ab = 0.7;
    var_2224d55de2f81930 = var_3868e4075b0909ab - 2;
    if (var_2224d55de2f81930 < 0) {
        var_2224d55de2f81930 = 0;
    }
    foreach (ent in var_5954cdf3d7a5a71a) {
        anim_length = getanimlength(ent getanim(var_86738c912cfa8014));
        if (ent == level.player_rig) {
            buffer = var_3868e4075b0909ab;
        } else {
            buffer = var_2224d55de2f81930;
        }
        time = (anim_length - buffer) / anim_length;
        ent setanimtime(ent getanim(var_86738c912cfa8014), time);
        if (isdefined(ent.var_42d97b626fd6d9cf)) {
            foreach (head in ent.var_42d97b626fd6d9cf) {
                if (issubstr(head.model, "head")) {
                    head scriptmodelclearanim();
                    head hide();
                }
            }
        }
    }
    delaythread(0.5, &scripts\cp_mp\utility\game_utility::fadetoblackforplayer, level.player, 0, 0.7);
    level delaythread(var_3868e4075b0909ab, &function_860a5c1214190a7c, anim_org);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56f3
// Size: 0x130
function function_860a5c1214190a7c(anim_org) {
    level.player namespace_162cff1cf88b9bbf::userskip_stop();
    if (isdefined(anim_org) && (isdefined(level.player_rig) || isdefined(level.var_8176a36d7ccf27ed))) {
        anim_org unlink_player_from_rig(undefined, undefined, undefined, 1);
    }
    if (isdefined(level.player.hidehudenabled) && level.player.hidehudenabled > 0) {
        level.player utility::hidehuddisable();
    }
    if (isdefined(level.player_rig)) {
        level.player_rig hide();
    }
    function_a88c360e19062b00(0);
    if (isdefined(level.player.var_f296f7e55b9e9150)) {
        level.player modifybasefov(level.player.var_f296f7e55b9e9150, 0.5);
    }
    if (!istrue(level.player.pers["saw_intro"])) {
        level.player.pers["saw_intro"] = 1;
    }
    flag_set("flag_dungeon_intro_complete");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x582b
// Size: 0x26
function function_666769c607f16d10() {
    if (function_4f7f12c0dd2bcac4() || istrue(level.var_8878bf131ba576d6)) {
        return;
    }
    utility::flag_set("flag_dungeon_intro_complete");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5859
// Size: 0x8c
function function_4f7f12c0dd2bcac4() {
    if (is_equal(getdvarint(@"hash_bc9e12bc3b91798", 0), 1)) {
        return true;
    }
    if (is_equal(getdvarint(@"hash_dbb53c7a147a3ed1", 0), 1)) {
        return false;
    }
    var_8c7cb31a334adfc0 = function_87ce7c6cba6c393();
    if (var_8c7cb31a334adfc0.size) {
        return false;
    }
    return !istrue(level.player.pers["saw_intro"]) || istrue(level.player.pers["pauseMenu_restart"]);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x58ee
// Size: 0x42
function function_aa47047a0f7d56da(player, fadetoblack, fadetime, var_dd8b0e146fd638e) {
    player scripts\cp_mp\utility\game_utility::function_20cb4a5f727abe6e(0);
    thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, fadetoblack, fadetime);
    thread scripts\cp_mp\utility\game_utility::function_852712268d005332(player, fadetoblack, fadetime);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5938
// Size: 0x8e
function function_b96b3877eda7204() {
    visionsetnaked("", 0.1);
    level.player disablephysicaldepthoffieldscripting();
    hidecinematicletterboxing(2, 0);
    level.player clearcinematicmotionoverride();
    level.player hidelegsandshadow();
    if (isdefined(level.player getlinkedparent())) {
        level.player unlink();
    }
    if (flag("chyrons_on")) {
        level.player namespace_9766820f5baa93fb::function_b809ac841a0c626e();
    }
    function_d8bb4bf1f8383fc();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59ce
// Size: 0x157
function function_d8bb4bf1f8383fc() {
    sceneroot = self;
    if (isdefined(sceneroot.scenedata) && isdefined(sceneroot.scenedata.var_214d924f4e137244)) {
        foreach (object in sceneroot.scenedata.var_214d924f4e137244) {
            if (!isdefined(object)) {
                continue;
            }
            if (isent(object)) {
                object stopsounds();
            }
            if (!isdefined(object.entity) || !isdefined(object.entity.var_42d97b626fd6d9cf)) {
                continue;
            }
            foreach (head in object.entity.var_42d97b626fd6d9cf) {
                if (issubstr(head.model, "head")) {
                    head scriptmodelclearanim();
                    head hide();
                }
            }
        }
    }
    sceneroot scripts\common\scene::cleanup(1);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x5b2d
// Size: 0x2f8
function link_player_to_rig(anime, stance, var_56d6792605cbc9d5, blendtime, var_b85605ef08d6e4c2, rightarc, leftarc, toparc, bottomarc, var_562ff78798cbfcc8, var_984ba707a4ae718e, var_26967d556f885965, var_fc98921609ed148d) {
    rig = get_player_rig(1, var_fc98921609ed148d);
    rig endon("unlink_player");
    level notify("link_player_to_rig");
    if (isdefined(var_984ba707a4ae718e)) {
        rig [[ var_984ba707a4ae718e ]]();
    }
    if (!isdefined(rig.allows)) {
        set_player_rig_allows();
    }
    level.player dontcastshadows();
    rig hide();
    if (isdefined(anime)) {
        thread scripts\common\anim::anim_first_frame_solo(rig, anime);
    }
    rig.ogstance = level.player getstance();
    if (!isdefined(stance)) {
        stance = "stand";
    }
    rig.stance = stance;
    switch (stance) {
    case #"hash_c6775c88e38f7803":
        rig.allows = array_combine_unique(rig.allows, ["crouch", "prone"]);
        break;
    case #"hash_3fed0cbd303639eb":
        rig.allows = array_combine_unique(rig.allows, ["stand", "prone"]);
        break;
    case #"hash_d91940431ed7c605":
        rig.allows = array_combine_unique(rig.allows, ["crouch", "stand"]);
        break;
    }
    level.player setstance(stance);
    level.player function_73341653f76b4e43();
    if (!isdefined(var_56d6792605cbc9d5)) {
        var_56d6792605cbc9d5 = 1;
    }
    if (var_56d6792605cbc9d5) {
        if (!isdefined(blendtime)) {
            blendtime = 0.2;
        }
        blendtime = max(0, blendtime - 0.05);
        level.player playerlinktoblend(rig, "tag_player", blendtime);
        wait blendtime;
        waitframe();
    }
    if (istrue(var_b85605ef08d6e4c2)) {
        level.player playerlinktoabsolute(rig, "tag_player");
    } else {
        if (!isdefined(var_562ff78798cbfcc8)) {
            var_562ff78798cbfcc8 = 0;
        }
        level.player playerlinktodelta(rig, "tag_player", 1, 0, 0, 0, 0, var_562ff78798cbfcc8, 0, 1);
        if (!isdefined(rightarc)) {
            rightarc = 45;
        }
        if (!isdefined(leftarc)) {
            leftarc = 45;
        }
        if (!isdefined(toparc)) {
            toparc = 15;
        }
        if (!isdefined(bottomarc)) {
            bottomarc = 15;
        }
        if (rightarc || leftarc || toparc || bottomarc) {
            level.player thread function_32511959517bbb91(1, 0.2, 0.1, 0.1, rightarc, leftarc, toparc, bottomarc);
        }
    }
    rig show();
    nvidiaansel_scriptdisable(1);
    return rig;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e2e
// Size: 0xae
function get_player_rig(var_3e3e6fc934c518cb, var_a871c06af7cb87c6) {
    if (!isdefined(level.player_rig)) {
        level.player_rig = spawn_anim_model("player_rig");
        var_3e3e6fc934c518cb = 1;
        if (default_to(var_a871c06af7cb87c6, 0)) {
            level.player_rig hide();
        }
    }
    if (istrue(var_3e3e6fc934c518cb)) {
        level.player_rig.origin = level.player.origin;
        level.player_rig.angles = level.player.angles;
    }
    return level.player_rig;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ee5
// Size: 0x7d
function set_player_rig_allows(allows) {
    assert(isdefined(level.player_rig) || isdefined(level.var_8176a36d7ccf27ed));
    if (!isdefined(allows)) {
        allows = function_62d61f52bf8d2cbf();
    }
    if (isdefined(level.player_rig)) {
        level.player_rig.allows = allows;
    }
    if (isdefined(level.var_8176a36d7ccf27ed)) {
        level.var_8176a36d7ccf27ed.allows = allows;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f6a
// Size: 0x60
function function_62d61f52bf8d2cbf() {
    allows = ["weapon", "offhand_weapons", "melee", "sprint", "allow_jump", "mantle", "usability", "backpack_inventory", "tacmap_scoreboard"];
    return allows;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fd3
// Size: 0x79
function function_73341653f76b4e43(allows) {
    assert(isdefined(level.player_rig));
    assert(isdefined(level.player_rig.allows));
    level.player val::reset_all("player_rig");
    level.player val::set_array("player_rig", level.player_rig.allows, 0);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x6054
// Size: 0x7d
function function_32511959517bbb91(delay_time, time, var_58e880c74a9b44c3, var_a22a7d71895fd8ba, rightarc, leftarc, toparc, bottomarc) {
    self endon("death");
    self endon("disconnect");
    level endon("unlink_player_from_rig");
    wait delay_time;
    if (self islinked() && !self isufo()) {
        self lerpviewangleclamp(time, var_58e880c74a9b44c3, var_a22a7d71895fd8ba, rightarc, leftarc, toparc, bottomarc);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x60d9
// Size: 0x1c0
function unlink_player_from_rig(var_1b2bf4bf5e71b6a4, var_5296297044db37d9, var_cc25a02716e677a4, var_dfb81d6b53106f39, var_fc98921609ed148d, var_13d9b15b8a937b29) {
    if (istrue(var_fc98921609ed148d) && isdefined(level.var_8176a36d7ccf27ed)) {
        rig = level.var_8176a36d7ccf27ed;
    } else {
        rig = level.player_rig;
    }
    rig notify("unlink_player");
    level notify("unlink_player_from_rig");
    level.player val::reset_all("player_rig");
    if (istrue(var_1b2bf4bf5e71b6a4)) {
        var_5296297044db37d9 = rig.ogstance;
    }
    if (isdefined(var_5296297044db37d9)) {
        if (istrue(var_cc25a02716e677a4)) {
            level.player setstance(var_5296297044db37d9, 1, 1, 1);
            new_origin = drop_to_ground(level.player geteye(), 0, -60, (0, 0, 1));
            if (isdefined(var_13d9b15b8a937b29)) {
                level.player setorigin(new_origin + var_13d9b15b8a937b29, 1);
            } else {
                level.player setorigin(new_origin, 1);
            }
        } else if (var_5296297044db37d9 != rig.stance) {
            level.player setstance(var_5296297044db37d9);
        }
    }
    if (isdefined(rig.var_8fddf836ad6d3406)) {
        level.player playersetgroundreferenceent(undefined);
        rig.var_8fddf836ad6d3406 delete();
        rig.var_8fddf836ad6d3406 = undefined;
    }
    level.player castshadows();
    level.player hidelegsandshadow();
    level.player unlink();
    if (!istrue(var_dfb81d6b53106f39)) {
        rig delete();
    }
    nvidiaansel_scriptdisable(0);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62a1
// Size: 0x30
function function_2311740fe797906a(key, value) {
    level.player.pers["dungeon"][key] = value;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62d9
// Size: 0x6d
function function_69fa4a2561ada985(key) {
    if (!isdefined(level.player)) {
        return undefined;
    }
    if (!isdefined(level.player.pers)) {
        return undefined;
    }
    if (!isdefined(level.player.pers["dungeon"])) {
        return undefined;
    }
    return level.player.pers["dungeon"][key];
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x634f
// Size: 0x32
function createquestcircle(objectivestruct, origin, radius) {
    objectivestruct scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("TestCircle", origin, radius);
    objectivestruct scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6389
// Size: 0x94
function function_2ca95efba5b5d995(objectivestruct, triggertargetname, var_e16949feebc0262b, label, complete_flag) {
    level endon("game_ended");
    trigger = getent(triggertargetname, "targetname");
    if (isdefined(trigger)) {
        trigger function_ae165af362de18a2();
        objectivestruct scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
        objindex = namespace_1170726b2799ea65::function_f60f3ac2fb2776f7(objectivestruct, "icon_waypoint_objective_general", "icon_small", var_e16949feebc0262b, "current", label, undefined, undefined, 0, 0);
        if (isdefined(complete_flag)) {
            level flag_set(complete_flag);
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6425
// Size: 0xda
function function_ae165af362de18a2() {
    level endon("game_ended");
    while (true) {
        self waittill("trigger", entity);
        if (isdefined(entity.vehicletype)) {
            vehicleoccupants = entity.occupants;
            var_95dfb4ea629973 = 0;
            if (!isdefined(vehicleoccupants)) {
                continue;
            }
            foreach (occupant in vehicleoccupants) {
                if (isplayer(occupant)) {
                    var_95dfb4ea629973 = 1;
                    break;
                }
            }
            if (var_95dfb4ea629973) {
                break;
            }
        }
        if (!isplayer(entity)) {
            continue;
        }
        if (!scripts\cp\utility\player::isreallyalive(entity)) {
            continue;
        }
        break;
    }
    self notify("player_trigger", entity);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6507
// Size: 0x3b
function function_d14fcd3a04720601(var_da7974c159f6f7ea) {
    trigs = getentarray(var_da7974c159f6f7ea, "targetname");
    array_thread(trigs, &function_ae165af362de18a2);
    waittill_any_ents_array(trigs, "player_trigger");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x654a
// Size: 0x50
function function_e2f14dc89a2fa632(targetname) {
    assert(isstring(targetname));
    trig = getent(targetname, "targetname");
    while (level.player istouching(trig)) {
        waitframe();
    }
    self notify("player_left_trigger_" + targetname);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65a2
// Size: 0x34
function delete_grenade_when_thrown() {
    level.player waittill("grenade_fire", grenade, weapon);
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65de
// Size: 0x23
function nvidiaansel_scriptdisable(val) {
    if (nvidiaanselisenabled()) {
        setsaveddvar(@"hash_941ecb757e3d818e", val);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x6609
// Size: 0x155
function function_f60f3ac2fb2776f7(objectivestruct, icon, var_e279957026596430, location, objstate, label, description, background, playintro, var_291e42d0f9f4f9da) {
    playintro = default_to(playintro, 1);
    var_291e42d0f9f4f9da = default_to(var_291e42d0f9f4f9da, 1);
    assertex(isdefined(objectivestruct.index), "The objective struct has no index.");
    var_ef16180c22171af4 = scripts\cp\cp_objectives::requestworldid("marker_obj" + objectivestruct.index, 1 + int(objectivestruct.index));
    objectivestruct.var_aa2e0492a2d8b18d = var_ef16180c22171af4;
    playintro = default_to(playintro, 1);
    objective_setplayintro(var_ef16180c22171af4, playintro);
    objective_setplayoutro(var_ef16180c22171af4, var_291e42d0f9f4f9da);
    objective_icon(var_ef16180c22171af4, icon);
    objective_setminimapiconsize(var_ef16180c22171af4, var_e279957026596430);
    objective_setlocation(var_ef16180c22171af4, 0, location);
    state = ter_op(isdefined(objstate), objstate, "current");
    objective_state(var_ef16180c22171af4, state);
    if (isdefined(label)) {
        objective_setlabel(var_ef16180c22171af4, label);
    }
    if (isdefined(description)) {
        objective_setdescription(var_ef16180c22171af4, description);
    }
    if (!isdefined(background)) {
        objective_setbackground(var_ef16180c22171af4, 1);
    } else {
        objective_setbackground(var_ef16180c22171af4, background);
    }
    return var_ef16180c22171af4;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6767
// Size: 0x6a
function function_448adabb169120d7(objectivestruct, objstate) {
    if (isdefined(objectivestruct.var_aa2e0492a2d8b18d)) {
        state = ter_op(isdefined(objstate), objstate, "empty");
        objective_state(objectivestruct.var_aa2e0492a2d8b18d, state);
        scripts\cp\cp_objectives::freeworldidbyobjid(objectivestruct.var_aa2e0492a2d8b18d);
        objectivestruct.var_aa2e0492a2d8b18d = undefined;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67d9
// Size: 0x35
function function_9b14a4ae42c7de46(objectivestruct, location) {
    if (isdefined(objectivestruct.var_aa2e0492a2d8b18d)) {
        objective_setlocation(objectivestruct.var_aa2e0492a2d8b18d, 0, location);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6816
// Size: 0x90
function function_d2d3ee8c76511439(var_cebd629b7ad95789) {
    var_873549b569d7b961 = 1;
    if (isdefined(var_cebd629b7ad95789)) {
        foreach (trig in var_cebd629b7ad95789) {
            if (isstring(trig)) {
                if (!flag(trig)) {
                    var_873549b569d7b961 = 0;
                    break;
                }
                continue;
            }
            if (isfunction(trig)) {
                if (![[ trig ]]()) {
                    var_873549b569d7b961 = 0;
                    break;
                }
            }
        }
    }
    return var_873549b569d7b961;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68af
// Size: 0x91
function function_6907702392fb190c(var_cebd629b7ad95789) {
    var_873549b569d7b961 = 0;
    if (isdefined(var_cebd629b7ad95789)) {
        foreach (trig in var_cebd629b7ad95789) {
            if (isstring(trig)) {
                if (flag(trig)) {
                    var_873549b569d7b961 = 1;
                    break;
                }
                continue;
            }
            if (isfunction(trig)) {
                if ([[ trig ]]()) {
                    var_873549b569d7b961 = 1;
                    break;
                }
            }
        }
    }
    return var_873549b569d7b961;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6949
// Size: 0xcf
function function_916233af1855619c() {
    if (isdefined(self.script_parameters)) {
        self.var_55cc71192b8f1931 = strtok(self.script_parameters, ",");
        return;
    }
    if (isdefined(self.struct) && isdefined(self.struct.script_parameters)) {
        self.struct.var_55cc71192b8f1931 = strtok(self.struct.script_parameters, ",");
        return;
    }
    if (isdefined(self.directorspawndata) && isdefined(self.directorspawndata.script_parameters)) {
        self.var_55cc71192b8f1931 = strtok(self.struct.script_parameters, ",");
        return;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a20
// Size: 0x6d
function function_68f8b8bd65b54d3(tag) {
    return isdefined(self.var_55cc71192b8f1931) && array_contains(self.var_55cc71192b8f1931, tag) || isdefined(self.struct) && isdefined(self.struct.var_55cc71192b8f1931) && array_contains(self.struct.var_55cc71192b8f1931, tag);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6a96
// Size: 0x28d
function function_60bebdf35a6b266f(itemlist, id, var_82191bfa9f751f4c) {
    itemid = 0;
    if (itemlist[id].weaponblueprint != "") {
        itemid = namespace_38b993c4618e76cd::getlootidfromref(itemlist[id].weaponblueprint);
    } else if (itemlist[id].weaponid != "") {
        var_4c13446bfa1c38c3 = itemlist[id].weaponid;
        var_4c13446bfa1c38c3 = function_c4080e8a53a0fed4(var_4c13446bfa1c38c3);
        itemid = namespace_38b993c4618e76cd::getlootidfromref(var_4c13446bfa1c38c3);
    } else if (itemlist[id].equipment != "") {
        var_5a3a473d25f13add = 0;
        for (j = 0; j < level.equipmentbundle.equipment_list.size; j++) {
            if (isdefined(level.equipmentbundle.equipment_list[j].bundle) && itemlist[id].equipment == level.equipmentbundle.equipment_list[j].bundle) {
                itemid = namespace_38b993c4618e76cd::getlootidfromref(level.equipmentbundle.equipment_list[j].ref);
                var_5a3a473d25f13add = 1;
                break;
            }
        }
        if (!var_5a3a473d25f13add) {
            assertmsg("Equipment at index " + id + " in " + var_82191bfa9f751f4c + "_unlocklist with name " + itemlist[id].equipment + " is not found in equipment_list_jup_cp, please ask the level owner to use the version in equipment_list_jup_cp");
        }
    } else if (itemlist[id].super != "") {
        for (j = 0; j < level.superbundle.super_list.size; j++) {
            if (isdefined(level.superbundle.super_list[j].bundle) && itemlist[id].super == level.superbundle.super_list[j].bundle) {
                itemid = namespace_38b993c4618e76cd::getlootidfromref(level.superbundle.super_list[j].ref);
                break;
            }
        }
    } else {
        setdvar(@"hash_c11db9baa9e5bc9b", 1);
        assertmsg("Item at index " + id + " is completely empty in " + var_82191bfa9f751f4c + "_unlocklist! Please ask the level owner to verify. You will be given default weapons and loadouts will be disabled in this level!");
        return;
    }
    return itemid;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d2b
// Size: 0x58
function function_c4080e8a53a0fed4(var_4c13446bfa1c38c3) {
    if (!isdefined(var_4c13446bfa1c38c3) || var_4c13446bfa1c38c3 == "") {
        return var_4c13446bfa1c38c3;
    }
    if (issubstr(var_4c13446bfa1c38c3, "_mp") || issubstr(var_4c13446bfa1c38c3, "_cp")) {
        var_4c13446bfa1c38c3 = strip_suffix(var_4c13446bfa1c38c3, "_cp");
        var_4c13446bfa1c38c3 = strip_suffix(var_4c13446bfa1c38c3, "_mp");
    }
    return var_4c13446bfa1c38c3;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d8c
// Size: 0x3c
function function_97ccc150115699dc(objectiveid, mission) {
    if (!isdefined(mission)) {
        mission = level.mapname;
    }
    return self function_f811dfc822b6f33a("sandboxMissionObjectiveData", function_ce720be6f935d1d4(mission), "objective_" + objectiveid);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6dd1
// Size: 0x46
function function_a9652366b0728328(state, objectiveid, mission) {
    if (!isdefined(mission)) {
        mission = level.mapname;
    }
    self function_2bd9c79b322a6eae("sandboxMissionObjectiveData", function_ce720be6f935d1d4(mission), "objective_" + objectiveid, state);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e1f
// Size: 0x5f
function function_50f02a42c72031cb(mission) {
    if (getdvarint(@"hash_f004b2ccc04fdc8d", 0)) {
        last_map = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_map");
        if (isdefined(last_map) && last_map == mission) {
            return self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint");
        } else {
            return undefined;
        }
        return;
    }
    return undefined;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e86
// Size: 0x2d
function function_1fcb318b0c28347b() {
    last_map = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_map");
    if (isdefined(last_map)) {
        return last_map;
    }
    return "";
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ebb
// Size: 0x54
function function_f66bc987efb3cd9() {
    last_map = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_map");
    current_map = level.script;
    if (isdefined(last_map) && last_map == current_map) {
        return istrue(self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_nvg_state"));
    }
    return 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x6f17
// Size: 0x22b
function function_5de16de5f3a1776f(mission, checkpoint, difficulty, var_e746c8aa068de268, player_origin, player_angles) {
    /#
        game["<dev string:x1d3>"] = spawnstruct();
        game["<dev string:x1d3>"].last_checkpoint_map = default_to(mission, "<dev string:x16e>");
        game["<dev string:x1d3>"].last_checkpoint = default_to(checkpoint, "<dev string:x16e>");
        game["<dev string:x1d3>"].last_checkpoint_difficulty = default_to(difficulty, -1);
        game["<dev string:x1d3>"].last_checkpoint_nvg_state = default_to(var_e746c8aa068de268, 0);
        game["<dev string:x1d3>"].last_checkpoint_position = default_to(player_origin, "<dev string:x16e>");
        game["<dev string:x1d3>"].last_checkpoint_angles = default_to(player_angles, "<dev string:x16e>");
        game["<dev string:x1d3>"].last_checkpoint_armor_plates = namespace_f8d3520d3483c1::function_600f6cf462e983f();
        game["<dev string:x1d3>"].last_checkpoint_armor_health = namespace_f8d3520d3483c1::function_ac266fc218266d08();
        game["<dev string:x1d3>"].last_checkpoint_self_revive = namespace_d4aab8c9cb8ecb14::hasselfrevivetoken();
    #/
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_map", default_to(mission, ""));
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint", default_to(checkpoint, ""));
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_difficulty", default_to(difficulty, -1));
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_nvg_state", default_to(var_e746c8aa068de268, 0));
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_position", default_to(player_origin, ""));
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_angles", default_to(player_angles, ""));
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_armor_plates", namespace_f8d3520d3483c1::function_600f6cf462e983f());
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_armor_health", namespace_f8d3520d3483c1::function_ac266fc218266d08());
    self function_2bd9c79b322a6eae("sandboxLastCheckpointData", "last_checkpoint_self_revive", namespace_d4aab8c9cb8ecb14::hasselfrevivetoken());
    function_2bc461567e40437d();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x714a
// Size: 0x67
function function_3b5e6f57536a8c76() {
    last_map = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_map");
    current_map = level.script;
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (isdefined(last_map) && last_map == current_map && isdefined(checkpoint) && checkpoint != "") {
        return 1;
    }
    return 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71b9
// Size: 0x22
function function_beebc333010c5122() {
    if (function_3b5e6f57536a8c76()) {
        return istrue(self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_self_revive"));
    }
    return 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71e3
// Size: 0x21
function function_25ae243b0c56d3fc() {
    if (function_3b5e6f57536a8c76()) {
        return self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_armor_plates");
    }
    return 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x720c
// Size: 0x21
function function_a00ff86fba36d23e() {
    if (function_3b5e6f57536a8c76()) {
        return self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_armor_health");
    }
    return 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7235
// Size: 0x8e
function function_124086d0afefcee3() {
    last_map = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_map");
    current_map = level.script;
    if (isdefined(last_map) && last_map == current_map) {
        origin = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_position");
        angles = self function_f811dfc822b6f33a("sandboxLastCheckpointData", "last_checkpoint_angles");
        return [origin, angles];
    }
    return [undefined, undefined];
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72cb
// Size: 0x20
function function_2bc461567e40437d() {
    level.player function_2bd9c79b322a6eae("sandboxLastCheckpointData", "sandboxCheckpointTimestamp", getsystemtime());
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72f3
// Size: 0x61
function function_5da6074f59f93979(mission) {
    objective_struct = spawnstruct();
    objective_struct.objectives = [];
    for (i = 0; i < 16; i++) {
        objective_struct.objectives[i] = level.player function_97ccc150115699dc(i, mission);
    }
    return objective_struct;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x735d
// Size: 0x1a
function function_8dcc0f3d1bacc30c() {
    level.var_4898102a23066ba = function_5da6074f59f93979(level.mapname);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x737f
// Size: 0x11
function function_2f51d89f7ca2ea6f() {
    level.var_89c4ca17a73081fd = function_e37f7811ae4599ea();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7398
// Size: 0x67
function function_e37f7811ae4599ea() {
    var_871060a64a6c8075 = spawnstruct();
    var_871060a64a6c8075.var_3eb0a25d6bf9529b = [];
    for (i = 0; i < 15; i++) {
        var_871060a64a6c8075.var_3eb0a25d6bf9529b[i] = level.player function_f811dfc822b6f33a("gameplaytutorials", "tutorial_" + i + "_displays");
    }
    return var_871060a64a6c8075;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7408
// Size: 0x3b
function function_f12562902f6f598b(var_b33ddc0995abe29e, count) {
    if (count >= 0 && count < 4) {
        self function_2bd9c79b322a6eae("gameplaytutorials", "tutorial_" + var_b33ddc0995abe29e + "_displays", count);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x744b
// Size: 0x23
function function_7d97fa985af1c8a5(var_b33ddc0995abe29e) {
    return self function_f811dfc822b6f33a("gameplaytutorials", "tutorial_" + var_b33ddc0995abe29e + "_displays");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7477
// Size: 0x4c
function function_600a40840f16740a() {
    for (i = 0; i < 15; i++) {
        self function_2bd9c79b322a6eae("gameplaytutorials", "tutorial_" + i + "_displays", 0);
        level.var_89c4ca17a73081fd.var_3eb0a25d6bf9529b[i] = 0;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74cb
// Size: 0x3c
function function_5e2bfc80545dc98e(var_b33ddc0995abe29e) {
    self function_2bd9c79b322a6eae("gameplaytutorials", "tutorial_" + var_b33ddc0995abe29e + "_displays", 0);
    level.var_89c4ca17a73081fd.var_3eb0a25d6bf9529b[var_b33ddc0995abe29e] = 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x750f
// Size: 0x864
function function_7e6994d769b9b3cd(missionname) {
    var_82191bfa9f751f4c = function_ce720be6f935d1d4(missionname);
    level.var_82191bfa9f751f4c = var_82191bfa9f751f4c;
    if (!isdefined(var_82191bfa9f751f4c)) {
        return undefined;
    }
    while (!isdefined(level.players[0])) {
        waitframe();
    }
    var_b4e0ee16bfdf7885 = level.players[0];
    var_bf7ad4203d026205 = spawnstruct();
    var_bf7ad4203d026205.attempts = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_attempts");
    var_bf7ad4203d026205.var_eb7eef48d12a4125 = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_should_show_loadout");
    var_bf7ad4203d026205.successes = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_successes");
    var_bf7ad4203d026205.failures = var_bf7ad4203d026205.attempts - var_bf7ad4203d026205.successes;
    var_bf7ad4203d026205.checkpoint = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_checkpoint_id");
    var_bf7ad4203d026205.var_c15a756c46f86d7 = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_ascender_tool");
    var_bf7ad4203d026205.var_5d7f8f33889c093c = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", "cp_jup_parachute_activated");
    var_bf7ad4203d026205.var_5feb596b2efa27b6 = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_plate_level");
    var_bf7ad4203d026205.nvg = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_nvg");
    if (var_bf7ad4203d026205.var_5feb596b2efa27b6 < 1) {
        var_bf7ad4203d026205.var_5feb596b2efa27b6 = 1;
    }
    var_bf7ad4203d026205.var_eee1738f65c4792a = [];
    for (i = 0; i < 16; i++) {
        var_bf7ad4203d026205.var_eee1738f65c4792a[i] = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_map_unlocks", i);
    }
    var_bf7ad4203d026205.var_761018175530ce24 = [];
    for (i = 0; i < 4; i++) {
        var_bf7ad4203d026205.var_761018175530ce24[i] = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_ks_unlocks", i);
    }
    for (i = 0; i < function_e1e2c6c4a3a0ebad(); i++) {
        var_bf7ad4203d026205.var_1c91c276fc7873f7[i] = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_discoverables", i);
    }
    for (i = 0; i < 25; i++) {
        var_bf7ad4203d026205.var_39ab125bd634220d[i] = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_82191bfa9f751f4c + "_plate_carriers", i);
    }
    if (!isdefined(var_bf7ad4203d026205.var_f8228bcbbb16cbf)) {
        var_bf7ad4203d026205.var_f8228bcbbb16cbf = [];
    }
    var_bf7ad4203d026205.var_884e10986cbfccc7 = getscriptbundle("sandboxmission_unlocklist:" + var_82191bfa9f751f4c + "_unlocklist");
    level.var_c335132972e17f77 = getscriptbundle(hashcat(%"hash_2c963b11e7ff7304", "jup_weapon_class_list"));
    level.equipmentbundle = getscriptbundle(hashcat(%"hash_1b39dfd4f5b5414", "equipment_list_jup_cp"));
    level.superbundle = getscriptbundle(hashcat(%"hash_566e2c9a9c9869dd", "super_list_jup_cp"));
    if (var_bf7ad4203d026205.attempts == 0) {
        for (id = 0; id < var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d.size; id++) {
            var_bf7ad4203d026205.var_f8228bcbbb16cbf[id] = var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[id].isunlocked;
            var_b4e0ee16bfdf7885 function_a0d4a0a7264d1772(var_82191bfa9f751f4c, id, var_bf7ad4203d026205.var_f8228bcbbb16cbf[id]);
            itemid = function_60bebdf35a6b266f(var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d, id, var_82191bfa9f751f4c);
            var_b4e0ee16bfdf7885 function_23092c668a272b35(var_82191bfa9f751f4c, id, itemid);
            if (var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[id].isdefault && itemid != 0) {
                itemtype = namespace_38b993c4618e76cd::function_282cf83c9eeda744(int(itemid));
                itemref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(int(itemid));
                if (var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[id].weaponblueprint != "") {
                    itemref = function_1cc3fd00b6ccc3ba(int(itemid));
                    itemref = function_c4080e8a53a0fed4(itemref);
                }
                itemslot = undefined;
                if (isdefined(itemtype)) {
                    if (itemtype == "weapon") {
                        var_56e092bae310563a = getweaponclass(itemref);
                        for (j = 0; j < level.var_c335132972e17f77.var_c4845e17f657feec.size; j++) {
                            weaponclassdata = getscriptbundle(hashcat(%"hash_231e89190f5116c0", level.var_c335132972e17f77.var_c4845e17f657feec[j].bundle));
                            if (weaponclassdata.var_373ff0906d8ba8e0 == var_56e092bae310563a) {
                                itemslot = weaponclassdata.weaponslot;
                                if (var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[id].var_840b562ce1809de) {
                                    itemslot = 1;
                                }
                                break;
                            }
                        }
                    } else if (itemtype == "equipment") {
                        for (j = 0; j < level.equipmentbundle.equipment_list.size; j++) {
                            if (itemref == level.equipmentbundle.equipment_list[j].ref) {
                                var_6f5ea5f282920343 = getscriptbundle(hashcat(%"hash_1117605451d279d0", level.equipmentbundle.equipment_list[j].bundle));
                                if (var_6f5ea5f282920343.equipmenttype == "lethal") {
                                    itemslot = 3;
                                    break;
                                }
                                if (var_6f5ea5f282920343.equipmenttype == "tactical" || var_6f5ea5f282920343.equipmenttype == "equipment_other") {
                                    itemslot = 4;
                                    break;
                                }
                            }
                        }
                    } else if (itemtype == "super") {
                        itemslot = 5;
                    }
                }
                if (isdefined(itemslot)) {
                    switch (itemslot) {
                    case 1:
                        var_b4e0ee16bfdf7885 function_b28ea2077fe04c46(var_82191bfa9f751f4c, "primaryWeapon", id);
                        break;
                    case 2:
                        var_b4e0ee16bfdf7885 function_b28ea2077fe04c46(var_82191bfa9f751f4c, "secondaryWeapon", id);
                        break;
                    case 3:
                        var_b4e0ee16bfdf7885 function_b28ea2077fe04c46(var_82191bfa9f751f4c, "lethalGrenade", id);
                        break;
                    case 4:
                        var_b4e0ee16bfdf7885 function_b28ea2077fe04c46(var_82191bfa9f751f4c, "tacticalGrenade", id);
                        break;
                    case 5:
                        var_b4e0ee16bfdf7885 function_b28ea2077fe04c46(var_82191bfa9f751f4c, "fieldEquipment", id);
                        break;
                    default:
                        break;
                    }
                }
            }
        }
    } else {
        for (i = 0; i < var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d.size; i++) {
            itemid = function_60bebdf35a6b266f(var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d, i, var_82191bfa9f751f4c);
            if (itemid != var_b4e0ee16bfdf7885 function_e511e6f4347ff261(var_82191bfa9f751f4c, i)) {
                var_b4e0ee16bfdf7885 function_23092c668a272b35(var_82191bfa9f751f4c, i, itemid);
                var_b4e0ee16bfdf7885 function_a0d4a0a7264d1772(var_82191bfa9f751f4c, i, var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].isunlocked);
            }
            if (var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].isunlocked && !istrue(var_b4e0ee16bfdf7885 function_fef34e1a36b57bf6(var_82191bfa9f751f4c, i))) {
                var_b4e0ee16bfdf7885 function_a0d4a0a7264d1772(var_82191bfa9f751f4c, i, var_bf7ad4203d026205.var_884e10986cbfccc7.var_4c7c8c272a931d5d[i].isunlocked);
            }
            var_bf7ad4203d026205.var_f8228bcbbb16cbf[i] = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("sandboxInventoryData", var_82191bfa9f751f4c, "SboxItems", i, "unlockState");
        }
    }
    return var_bf7ad4203d026205;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d7c
// Size: 0x49
function function_225de78e99eb1232(perk) {
    perkbundle = getscriptbundle("perk:" + perk);
    perkid = perkbundle.lootid;
    println("<dev string:x1e3>" + perkid);
    return perkid;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7dce
// Size: 0x19c
function function_ce720be6f935d1d4(missionname, var_d25dda2927a1f8da) {
    var_b1f1735134f3dd86 = undefined;
    if (istrue(level.var_bb3505b72e24c478) && !istrue(var_d25dda2927a1f8da)) {
        missionname = "cp_jup_chemical";
    }
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    missionname = strip_suffix(missionname, "_dev");
    switch (missionname) {
    case #"hash_c3c819184bc33817":
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        break;
    case #"hash_5c03122b70ff4094":
        var_b1f1735134f3dd86 = "cp_jup_port";
        break;
    case #"hash_48fc93178a593780":
        var_b1f1735134f3dd86 = "cp_jup_milbase";
        break;
    case #"hash_619829c7b3c4c3e3":
        var_b1f1735134f3dd86 = "cp_jup_ranch";
        break;
    case #"hash_3705bde815a332ea":
        var_b1f1735134f3dd86 = "cp_jup_resort";
        break;
    case #"hash_6b2477606925177a":
        var_b1f1735134f3dd86 = "cp_jup_apt";
        break;
    case #"hash_8e2389607af0427b":
        var_b1f1735134f3dd86 = "cp_jup_dam";
        break;
    case #"hash_2f7993e5b4a6dc99":
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        break;
    case #"hash_ddd09c6970ff6bef":
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        break;
    case #"hash_52a1e348843c18ee":
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        break;
    case #"hash_8bb4791ca384f2f5":
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        break;
    default:
        println("<dev string:x1f0>" + missionname + "<dev string:x1ff>");
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        break;
    }
    if (isdefined(var_b1f1735134f3dd86)) {
        return var_b1f1735134f3dd86;
    }
    if (istrue(level.var_bb3505b72e24c478)) {
        var_b1f1735134f3dd86 = "cp_jup_chemical";
        return var_b1f1735134f3dd86;
    }
    return undefined;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f73
// Size: 0x2d
function function_43ff573da0995241(missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7fa8
// Size: 0xf8
function function_3fc39fc10ef1d9d1(var_aff9ed3ed38ceba9, missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    if (!isdefined(var_aff9ed3ed38ceba9)) {
        var_aff9ed3ed38ceba9 = 0;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    var_202422c88a2368b8 = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_2bfb2e8196104365 + "_attempts");
    var_fb9aff99a0103175 = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_2bfb2e8196104365 + "_successes");
    if (var_202422c88a2368b8 < 99) {
        var_202422c88a2368b8++;
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_attempts", var_202422c88a2368b8);
        level.var_1b908bf18691b097.attempts = var_202422c88a2368b8;
    }
    if (var_aff9ed3ed38ceba9 && var_fb9aff99a0103175 < 99) {
        var_fb9aff99a0103175++;
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_successes", var_fb9aff99a0103175);
        level.var_1b908bf18691b097.successes = var_fb9aff99a0103175;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x80a8
// Size: 0xa4
function function_bd9c984cefed4209(var_36a06e16bd272121, missionname) {
    if (!isdefined(var_36a06e16bd272121)) {
        var_36a06e16bd272121 = 0;
    }
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    if (var_36a06e16bd272121 >= 0 && var_36a06e16bd272121 <= 15) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_checkpoint_id", var_36a06e16bd272121);
    }
    if (isdefined(level.var_1b908bf18691b097)) {
        level.var_1b908bf18691b097.checkpoint = var_36a06e16bd272121;
    }
    setomnvar("ui_cp_checkpoint", 1);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8154
// Size: 0x98
function function_965540c9de8803c9(isunlocked, missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    if (!isdefined(isunlocked)) {
        isunlocked = 1;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    if (isunlocked == 1 || isunlocked == 0) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_ascender_tool", isunlocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.var_c15a756c46f86d7 = isunlocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81f4
// Size: 0x6c
function function_f045fd5df4bf1896(isunlocked) {
    if (!isdefined(isunlocked)) {
        isunlocked = 1;
    }
    var_b4e0ee16bfdf7885 = level.players[0];
    if (isunlocked == 1 || isunlocked == 0) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", "cp_jup_parachute_activated", isunlocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.var_5d7f8f33889c093c = isunlocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8268
// Size: 0x98
function function_ed4f7e1b0b42e2c4(isunlocked, missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    if (!isdefined(isunlocked)) {
        isunlocked = 1;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    if (isunlocked == 1 || isunlocked == 0) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_nvg", isunlocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.nvg = isunlocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8308
// Size: 0xa3
function function_58311dfacdcaf94c(var_5feb596b2efa27b6, missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    if (!isdefined(var_5feb596b2efa27b6)) {
        var_60e6f0db21be5b54 = var_b4e0ee16bfdf7885 function_f811dfc822b6f33a("spProgData", var_2bfb2e8196104365 + "_plate_level");
        var_5feb596b2efa27b6 = var_60e6f0db21be5b54 + 1;
    }
    if (var_5feb596b2efa27b6 <= 3) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_plate_level", var_5feb596b2efa27b6);
        level.var_1b908bf18691b097.var_5feb596b2efa27b6 = var_5feb596b2efa27b6;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x83b3
// Size: 0xb9
function function_7b9d564209811c6e(index, isunlocked, missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    if (!isdefined(isunlocked)) {
        isunlocked = 1;
    }
    assertex(isdefined(index), "UpdateMissionDDL_ks_unlock called without specifying the index");
    if (!isdefined(index)) {
        return;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    if (index >= 0 && index < 4) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_ks_unlocks", index, isunlocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.var_761018175530ce24[index] = isunlocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8474
// Size: 0xb9
function function_3c666ab28a3f2008(index, isunlocked, missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    if (!isdefined(isunlocked)) {
        isunlocked = 1;
    }
    assertex(isdefined(index), "UpdateMissionDDL_map_unlock called without specifying the index");
    if (!isdefined(index)) {
        return;
    }
    var_2bfb2e8196104365 = function_ce720be6f935d1d4(missionname);
    var_b4e0ee16bfdf7885 = level.players[0];
    if (index >= 0 && index < 16) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_map_unlocks", index, isunlocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.var_eee1738f65c4792a[index] = isunlocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8535
// Size: 0xbc
function function_cc8a338bb3b0a9fe(index, isunlocked, missionname) {
    var_2bfb2e8196104365 = default_to(missionname, function_ce720be6f935d1d4(level.mapname));
    if (!isdefined(isunlocked)) {
        isunlocked = 1;
    }
    assertex(isdefined(index), "UpdateMissionDDL_discoverables_unlock called without specifying the index");
    if (!isdefined(index)) {
        return;
    }
    var_b4e0ee16bfdf7885 = level.players[0];
    if (index >= 0 && index < function_e1e2c6c4a3a0ebad()) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_discoverables", index, isunlocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.var_1c91c276fc7873f7[index] = isunlocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x85f9
// Size: 0xb8
function function_bad5ef3aa306f41f(index, islocked, missionname) {
    var_2bfb2e8196104365 = default_to(missionname, function_ce720be6f935d1d4(level.mapname));
    if (!isdefined(islocked)) {
        islocked = 1;
    }
    assertex(isdefined(index), "UpdateMissionDDL_plate_carriers_unlock called without specifying the index");
    if (!isdefined(index)) {
        return;
    }
    var_b4e0ee16bfdf7885 = level.players[0];
    if (index >= 0 && index < 25) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_2bfb2e8196104365 + "_plate_carriers", index, islocked);
        if (isdefined(level.var_1b908bf18691b097)) {
            level.var_1b908bf18691b097.var_39ab125bd634220d[index] = islocked;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x86b9
// Size: 0xbc
function function_e1e2c6c4a3a0ebad(missionname) {
    missionname = default_to(missionname, function_ce720be6f935d1d4(level.mapname));
    switch (missionname) {
    case #"hash_c3c819184bc33817":
        var_8fd4f4614f12573 = 350;
        break;
    case #"hash_5c03122b70ff4094":
        var_8fd4f4614f12573 = 200;
        break;
    case #"hash_619829c7b3c4c3e3":
        var_8fd4f4614f12573 = 64;
        break;
    case #"hash_3705bde815a332ea":
        var_8fd4f4614f12573 = 128;
        break;
    case #"hash_6b2477606925177a":
        var_8fd4f4614f12573 = 128;
        break;
    case #"hash_8e2389607af0427b":
        var_8fd4f4614f12573 = 128;
        break;
    default:
        var_8fd4f4614f12573 = 64;
        break;
    }
    return var_8fd4f4614f12573;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x877e
// Size: 0x4
function function_c9e9a9b526daf36a() {
    return 3;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x878b
// Size: 0x4
function function_7a8132b8df34eec4() {
    return true;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8798
// Size: 0x4
function function_5b284c7d428229fb() {
    return 25;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87a5
// Size: 0x39
function function_c795e60600c096c9() {
    return ["cp_jup_apt", "cp_jup_chemical", "cp_jup_dam", "cp_jup_port", "cp_jup_ranch", "cp_jup_resort"];
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x87e7
// Size: 0x109
function function_e4c6e53c9f6e94c8(var_ed8ae2e428c38839, var_c31c79e40a0f1610, var_6788e3106fcb4652, var_e2e57e89a2e974e0, var_b3484693f17ad5a) {
    if (!isdefined(var_ed8ae2e428c38839) || level.gametype != "dungeons") {
        return;
    }
    if (function_809ac4c516df27d3(var_6788e3106fcb4652) || isdefined(var_6788e3106fcb4652) && !isint(var_6788e3106fcb4652)) {
        return;
    }
    currentprogress = 0;
    var_b3484693f17ad5a = default_to(var_b3484693f17ad5a, 1);
    var_e2e57e89a2e974e0 = default_to(var_e2e57e89a2e974e0, 1);
    if (isdefined(var_c31c79e40a0f1610)) {
        currentprogress = function_fb43dbfed97eef6a(var_c31c79e40a0f1610);
    }
    newprogress = currentprogress + var_b3484693f17ad5a;
    /#
        level.player iprintlnbold("<dev string:x235>" + var_ed8ae2e428c38839 + "<dev string:x238>" + newprogress);
    #/
    if (var_e2e57e89a2e974e0 || isdefined(var_6788e3106fcb4652) && isint(var_6788e3106fcb4652) && newprogress >= var_6788e3106fcb4652) {
        level.player function_6a369480dbaf1090(var_ed8ae2e428c38839, newprogress);
    }
    if (isdefined(var_c31c79e40a0f1610)) {
        level.player function_2bd9c79b322a6eae("spData", var_c31c79e40a0f1610, newprogress);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88f8
// Size: 0x26
function function_fb43dbfed97eef6a(var_c31c79e40a0f1610) {
    return default_to(level.player function_f811dfc822b6f33a("spData", var_c31c79e40a0f1610), 0);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8927
// Size: 0x45
function private function_809ac4c516df27d3(var_6788e3106fcb4652) {
    if (isdefined(var_6788e3106fcb4652)) {
        if (isfunction(var_6788e3106fcb4652)) {
            return istrue([[ var_6788e3106fcb4652 ]]());
        } else if (isstring(var_6788e3106fcb4652)) {
            var_62edc2f36ec2afb7 = function_fb43dbfed97eef6a(var_6788e3106fcb4652);
            if (istrue(var_62edc2f36ec2afb7)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8975
// Size: 0x189
function function_5c700aae58d02578() {
    level endon("game_ended");
    while (true) {
        if (level.mapname == "cp_jup_chemical") {
            flag_wait("infil_player_landed");
            waittillframeend();
        }
        level.player waittill("player_landed", var_b6a57549a0ce42f1);
        if (!isdefined(var_b6a57549a0ce42f1) || !istrue(var_b6a57549a0ce42f1.var_4ade7c346de27170.parachute)) {
            continue;
        }
        if (level.mapname == "cp_jup_port") {
            roof = function_f159c10d5cf8f0b4("achievement_fightOrFlight_roof", "script_noteworthy");
            if (isdefined(roof) && roof[0] namespace_d18e5dabdf7709e4::function_b7755ccb57f05b94(level.player.origin)) {
                cranes = function_f159c10d5cf8f0b4("achievement_fightOrFlight_crane", "script_noteworthy");
                if (isdefined(cranes)) {
                    foreach (crane in cranes) {
                        if (crane namespace_d18e5dabdf7709e4::function_b7755ccb57f05b94(var_b6a57549a0ce42f1.last_good_pos)) {
                            namespace_1170726b2799ea65::function_e4c6e53c9f6e94c8("jup_sp_fightorflight");
                        }
                    }
                }
            }
        }
        distancemeters = distance(var_b6a57549a0ce42f1.last_good_pos, level.player.origin) * 0.0254;
        if (distancemeters >= 150) {
            function_e4c6e53c9f6e94c8("jup_sp_frequentflier");
        }
        waitframe();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8b06
// Size: 0x2
function private function_7cdf2ace21ffd216() {
    
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b10
// Size: 0x51
function function_40b2971a2486ffe1() {
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("cp_blueprint_crate_dungeons", &function_d6f497a23e94db93);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("cp_loadout_crate_dungeons", &function_b716a25f1ab9e6f6);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("cp_loadout_pile", &function_b5587a46d5f44f68);
    setdvarifuninitialized(@"hash_9c7b7540824ac88e", 0);
    /#
        level thread namespace_cfe848c6b27fe834::function_e3c4d9826d0b82f6();
    #/
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b69
// Size: 0x1e8
function function_2e9d1ffd6d4f7e1(missionname) {
    missiondata = spawnstruct();
    missiondata.missionname = missionname;
    missiondata.scriptbundle = getscriptbundle("sandboxmission_unlocklist:" + missionname + "_unlocklist");
    missiondata.attempts = level.player function_f811dfc822b6f33a("spProgData", missionname + "_attempts");
    missiondata.unlocks = [];
    var_dec1d52ffce12e7b = [];
    var_884e10986cbfccc7 = [];
    if (missiondata.attempts == 0) {
        for (i = 0; i < missiondata.scriptbundle.var_4c7c8c272a931d5d.size; i++) {
            var_dec1d52ffce12e7b[i] = level.player function_fef34e1a36b57bf6(missionname, i);
            var_884e10986cbfccc7[i] = missiondata.scriptbundle.var_4c7c8c272a931d5d[i].isunlocked;
        }
        var_cce446b3e29a3f83 = 0;
        for (i = 0; i < var_dec1d52ffce12e7b.size; i++) {
            if (var_dec1d52ffce12e7b[i] == 1) {
                var_cce446b3e29a3f83 = 1;
                break;
            }
        }
        if (var_cce446b3e29a3f83 == 0) {
            var_dec1d52ffce12e7b = var_884e10986cbfccc7;
            for (i = 0; i < missiondata.scriptbundle.var_4c7c8c272a931d5d.size; i++) {
                level.player function_a0d4a0a7264d1772(missionname, i, var_884e10986cbfccc7[i]);
            }
        }
        if (array_compare(var_dec1d52ffce12e7b, var_884e10986cbfccc7) == 1) {
            missiondata.unlocks = var_884e10986cbfccc7;
        } else {
            missiondata.unlocks = var_dec1d52ffce12e7b;
        }
    } else {
        for (i = 0; i < missiondata.scriptbundle.var_4c7c8c272a931d5d.size; i++) {
            missiondata.unlocks[i] = level.player function_fef34e1a36b57bf6(missionname, i);
        }
    }
    return missiondata;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d5a
// Size: 0x4a5
function function_29c7b140e0c906de(mission) {
    flag_wait("strike_init_done");
    flag_wait("scriptables_ready");
    flag_wait("dungeon_load_finished");
    flag_wait("loot_hack_complete");
    var_d25dda2927a1f8da = 0;
    var_2bf46003ba58c954 = [];
    flag_wait("item_caches_populated");
    if (getdvarint(@"hash_9c7b7540824ac88e", 0) == 1) {
        var_2bf46003ba58c954 = level.var_2bf46003ba58c954;
    } else {
        var_141babbdcbee2031 = getentitylessscriptablearray("cp_blueprint_crate_dungeons_pistol");
        var_d9b74d1eb592e7d8 = getentitylessscriptablearray("cp_blueprint_crate_dungeons");
        var_d9b74d1eb592e7d8 = array_combine(var_d9b74d1eb592e7d8, getentitylessscriptablearray("cp_blueprint_crate_dungeons_depth01"));
        var_d9b74d1eb592e7d8 = array_combine(var_d9b74d1eb592e7d8, getentitylessscriptablearray("cp_blueprint_crate_dungeons_depth03"));
        var_d9b74d1eb592e7d8 = array_combine(var_d9b74d1eb592e7d8, getentitylessscriptablearray("cp_blueprint_crate_dungeons_depth06"));
        var_d4fa1b0bd1f675c5 = getentitylessscriptablearray("cp_blueprint_crate_dungeons_large");
        var_d4fa1b0bd1f675c5 = array_combine(var_d4fa1b0bd1f675c5, getentitylessscriptablearray("cp_blueprint_crate_dungeons_large_depth01"));
        var_d4fa1b0bd1f675c5 = array_combine(var_d4fa1b0bd1f675c5, getentitylessscriptablearray("cp_blueprint_crate_dungeons_large_depth03"));
        var_d4fa1b0bd1f675c5 = array_combine(var_d4fa1b0bd1f675c5, getentitylessscriptablearray("cp_blueprint_crate_dungeons_large_depth06"));
        var_d4fa1b0bd1f675c5 = array_combine(var_d4fa1b0bd1f675c5, getentitylessscriptablearray("cp_blueprint_crate_dungeons_large_depth10"));
        var_eb101bd59341bbe1 = getentitylessscriptablearray("cp_blueprint_crate_dungeons_xlarge");
        var_eb101bd59341bbe1 = array_combine(var_eb101bd59341bbe1, getentitylessscriptablearray("cp_blueprint_crate_dungeons_xlarge_depth03"));
        var_eb101bd59341bbe1 = array_combine(var_eb101bd59341bbe1, getentitylessscriptablearray("cp_blueprint_crate_dungeons_xlarge_depth07"));
        var_eb101bd59341bbe1 = array_combine(var_eb101bd59341bbe1, getentitylessscriptablearray("cp_blueprint_crate_dungeons_xlarge_depth15"));
        var_eb101bd59341bbe1 = array_combine(var_eb101bd59341bbe1, getentitylessscriptablearray("cp_blueprint_crate_dungeons_xlarge_depth30"));
        var_2bf46003ba58c954 = array_combine(var_d9b74d1eb592e7d8, var_d4fa1b0bd1f675c5, var_eb101bd59341bbe1, var_141babbdcbee2031);
        level.var_2bf46003ba58c954 = var_2bf46003ba58c954;
    }
    if (mission == "cp_jup_lootbox_unlock_wb") {
        var_d25dda2927a1f8da = 1;
    }
    if (mission == "cp_jup_lootbox_unlock_wb") {
        var_c85bd7b3f6961d17 = ["cp_jup_apt", "cp_jup_chemical", "cp_jup_dam", "cp_jup_port", "cp_jup_ranch", "cp_jup_resort"];
    } else {
        var_c85bd7b3f6961d17 = [function_ce720be6f935d1d4(mission)];
    }
    var_5db3d9282f4cd51b = [];
    for (i = 0; i < var_c85bd7b3f6961d17.size; i++) {
        missionname = var_c85bd7b3f6961d17[i];
        var_5db3d9282f4cd51b[i] = function_2e9d1ffd6d4f7e1(missionname);
    }
    if (!isdefined(var_2bf46003ba58c954) || is_equal(var_2bf46003ba58c954.size, 0)) {
        return;
    }
    for (id = 0; id < var_2bf46003ba58c954.size; id++) {
        var_fa819f01102b9048 = var_2bf46003ba58c954[id];
        missionname = var_fa819f01102b9048.missionname;
        var_614ed255922d8001 = 1;
        var_279c0c9fd75638ee = 0;
        if (!isdefined(missionname)) {
            if (isdefined(mission)) {
                missionname = function_ce720be6f935d1d4(mission);
            } else {
                missionname = function_ce720be6f935d1d4(level.mapname, 1);
                var_279c0c9fd75638ee = 1;
            }
        } else {
            var_279c0c9fd75638ee = 1;
        }
        var_2a77e9e1ef38b0e5 = isdefined(var_fa819f01102b9048.script_noteworthy) ? var_fa819f01102b9048.script_noteworthy : var_fa819f01102b9048.itemname;
        if (!isdefined(var_2a77e9e1ef38b0e5)) {
            println("<dev string:x23b>" + var_fa819f01102b9048.origin);
            var_614ed255922d8001 = 0;
        }
        if (var_614ed255922d8001 == 1) {
            if (!isdefined(mission)) {
                var_d7a6548f32143da5 = undefined;
                for (i = 0; i < var_5db3d9282f4cd51b.size; i++) {
                    if (var_5db3d9282f4cd51b[i].missionname == missionname) {
                        missionindex = i;
                    }
                }
            } else {
                var_d7a6548f32143da5 = function_ce720be6f935d1d4(mission);
                missionindex = 0;
            }
            itemslot = undefined;
            for (i = 0; i < var_5db3d9282f4cd51b[missionindex].scriptbundle.var_4c7c8c272a931d5d.size; i++) {
                var_7172b0464da9497f = var_5db3d9282f4cd51b[missionindex].scriptbundle.var_4c7c8c272a931d5d[i];
                if (var_7172b0464da9497f.equipment == var_2a77e9e1ef38b0e5 || var_7172b0464da9497f.super == var_2a77e9e1ef38b0e5 || var_7172b0464da9497f.weaponblueprint == var_2a77e9e1ef38b0e5 || var_7172b0464da9497f.weaponid == var_2a77e9e1ef38b0e5) {
                    itemslot = i;
                    break;
                }
            }
            if (isdefined(itemslot)) {
                if (level.player function_fef34e1a36b57bf6(missionname, itemslot) == 1) {
                    function_63bb9d1cd72deb8b(var_fa819f01102b9048, var_2a77e9e1ef38b0e5);
                } else {
                    thread function_4342188980d175a(var_fa819f01102b9048, var_2a77e9e1ef38b0e5);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9207
// Size: 0x152
function function_a15b9a53bdf93971(var_1b276f35dd9e0aea, dropinfo) {
    var_acc87f20536c1e10 = undefined;
    var_72f2253976f9bb1e = undefined;
    var_1b276f35dd9e0aea = strip_suffix(var_1b276f35dd9e0aea, "_mp");
    var_1b276f35dd9e0aea = strip_suffix(var_1b276f35dd9e0aea, "_ob");
    var_1b276f35dd9e0aea = strip_suffix(var_1b276f35dd9e0aea, "_jup");
    println("<dev string:x260>" + var_1b276f35dd9e0aea);
    switch (var_1b276f35dd9e0aea) {
    case #"hash_ac2ab6307a9fe4ec":
        var_acc87f20536c1e10 = "brloot_super_armorbox";
        break;
    case #"hash_3d18c216d6eeb2cc":
        var_acc87f20536c1e10 = "brloot_super_suppressionrounds";
        break;
    case #"hash_6f4c7534ae718637":
        var_acc87f20536c1e10 = "brloot_super_taccover";
        break;
    case #"hash_cedad6d52b2b36c2":
        var_acc87f20536c1e10 = "brloot_super_heartbeatsensor";
        break;
    case #"hash_29972969a98220a1":
        var_acc87f20536c1e10 = "brloot_super_munitionsbox";
        break;
    case #"hash_4599084f04ba2bfe":
        var_acc87f20536c1e10 = "brloot_super_sonarpulse";
        break;
    case #"hash_7266a252f51150e9":
        var_acc87f20536c1e10 = "brloot_super_recondrone";
        break;
    case #"hash_2a2d382fc09b9c1b":
        var_acc87f20536c1e10 = "brloot_super_tacticalcamera";
        break;
    default:
        var_acc87f20536c1e10 = undefined;
        break;
    }
    if (isdefined(var_acc87f20536c1e10)) {
        var_72f2253976f9bb1e = namespace_6250b14b3f614101::spawnpickup(var_acc87f20536c1e10, dropinfo, 1);
        var_72f2253976f9bb1e disablescriptableplayeruse(level.player);
    }
    return var_72f2253976f9bb1e;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9362
// Size: 0x5c
function function_7f422514e0bd54e4(weapon_obj) {
    switch (weapon_obj.basename) {
    case #"hash_87262a67e163f7c9":
        ammo_count = weaponclipsize(weapon_obj) * 10;
        break;
    default:
        ammo_count = weaponclipsize(weapon_obj) * 3;
        break;
    }
    return ammo_count;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93c7
// Size: 0xd
function function_ac85cab902c62430(newweapon) {
    return 60;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93dd
// Size: 0xd
function function_57ecbf1081ef772c(newweapon) {
    return 60;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x93f3
// Size: 0xf3
function function_4ff8438426311e0f(var_1b276f35dd9e0aea, item_name, item_id, var_7391e47bc337367c) {
    objweapon = namespace_a0628d6954815ef8::function_768c9a047aed19f4(var_1b276f35dd9e0aea);
    weapon_name = namespace_e0ee43ef2dddadaa::getweaponrootname(item_name);
    if (isdefined(var_7391e47bc337367c)) {
        var_7553576e6f3295c7 = function_64ccc54bdbae5cf6(var_7391e47bc337367c);
        weapon_camo = function_c7771194200d360e(var_7391e47bc337367c);
    } else {
        var_7553576e6f3295c7 = function_64ccc54bdbae5cf6(item_id);
        weapon_camo = function_c7771194200d360e(item_id);
    }
    if (!isdefined(weapon_camo)) {
        weapon_camo = "none";
    }
    println("<dev string:x273>" + weapon_name);
    if (isdefined(var_7553576e6f3295c7)) {
        weapon_obj = level.player namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapon_name, weapon_camo, "none", var_7553576e6f3295c7);
    } else {
        println("<dev string:x28b>");
        weapon_obj = level.player namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapon_name, weapon_camo, "none", 0);
    }
    return weapon_obj;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x94ef
// Size: 0xd7
function function_ab13214d963e223f(weapon_obj, item_id, var_7391e47bc337367c, var_fa819f01102b9048, dropinfo) {
    var_962d7583f68be225 = getcompleteweaponname(weapon_obj);
    if (isdefined(var_fa819f01102b9048.script_count)) {
        ammo_count = var_fa819f01102b9048.script_count;
    } else {
        ammo_count = function_7f422514e0bd54e4(weapon_obj);
    }
    var_d226ec5acedacd3c = weapon_obj.displayname;
    var_72f2253976f9bb1e = namespace_6250b14b3f614101::spawnpickup(var_962d7583f68be225, dropinfo, ammo_count, 0, weapon_obj, 0);
    var_72f2253976f9bb1e disablescriptableplayeruse(level.player);
    if (isdefined(var_7391e47bc337367c) && isdefined(item_id)) {
        var_72f2253976f9bb1e.var_9b7df99df9e2fe65 = item_id;
    }
    var_72f2253976f9bb1e.var_b5c99a0d29afb1ac = 1;
    return var_72f2253976f9bb1e;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x95cf
// Size: 0x1e2
function function_e7aaa45f3161e592(var_1b276f35dd9e0aea, item_name, item_id, var_7391e47bc337367c, var_fa819f01102b9048, dropinfo) {
    objweapon = namespace_a0628d6954815ef8::function_768c9a047aed19f4(var_1b276f35dd9e0aea);
    weapon_name = namespace_e0ee43ef2dddadaa::getweaponrootname(item_name);
    if (isdefined(var_7391e47bc337367c)) {
        var_7553576e6f3295c7 = function_64ccc54bdbae5cf6(var_7391e47bc337367c);
        weapon_camo = function_c7771194200d360e(var_7391e47bc337367c);
    } else {
        var_7553576e6f3295c7 = function_64ccc54bdbae5cf6(item_id);
        weapon_camo = function_c7771194200d360e(item_id);
    }
    if (!isdefined(weapon_camo)) {
        weapon_camo = "none";
    }
    println("<dev string:x273>" + weapon_name);
    if (isdefined(var_7553576e6f3295c7)) {
        weapon_obj = level.player namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapon_name, weapon_camo, "none", var_7553576e6f3295c7);
    } else {
        println("<dev string:x28b>");
        weapon_obj = level.player namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapon_name, weapon_camo, "none", 0);
    }
    var_962d7583f68be225 = getcompleteweaponname(weapon_obj);
    if (isdefined(var_fa819f01102b9048.script_count)) {
        ammo_count = var_fa819f01102b9048.script_count;
    } else {
        ammo_count = function_7f422514e0bd54e4(weapon_obj);
    }
    var_6112042b063efd67 = function_ac85cab902c62430(weapon_obj);
    var_b9870ce12dac56b3 = function_57ecbf1081ef772c(weapon_obj);
    var_d226ec5acedacd3c = weapon_obj.displayname;
    var_72f2253976f9bb1e = namespace_6250b14b3f614101::spawnpickup(var_962d7583f68be225, dropinfo, ammo_count, 0, weapon_obj, 0, var_b9870ce12dac56b3, var_6112042b063efd67);
    var_72f2253976f9bb1e disablescriptableplayeruse(level.player);
    if (isdefined(var_7391e47bc337367c) && isdefined(item_id)) {
        var_72f2253976f9bb1e.var_9b7df99df9e2fe65 = item_id;
    }
    var_72f2253976f9bb1e.var_b5c99a0d29afb1ac = 1;
    return var_72f2253976f9bb1e;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x97ba
// Size: 0x20e
function function_3de9d7877f75c529(var_fa819f01102b9048, iteminfo, var_1f213921962c951e, item_type) {
    new_angles = (0, 0, 0);
    var_f394d756662fa922 = (0, 0, 6);
    var_ad409acef85b4be0 = var_1f213921962c951e.var_ad409acef85b4be0;
    switch (var_fa819f01102b9048.type) {
    case #"hash_1c91a53a2491ebf6":
    case #"hash_7d4f4a065120d548":
        new_angles += (0, 0, 90);
        break;
    default:
        if (item_type == "weapon") {
            new_angles += (0, 0, 90);
        } else {
            new_angles += (0, -90, 0);
        }
        break;
    }
    new_angles += iteminfo.var_298349d024e91598;
    var_9331ff02293d3cb1 = iteminfo.weaponoffset;
    if (var_fa819f01102b9048.type == "scriptable_cp_blueprint_crate_dungeons_pistol" || var_fa819f01102b9048.type == "cp_blueprint_crate_dungeons_pistol") {
        var_f394d756662fa922 = (0, 0, 0);
        var_ad409acef85b4be0 = (0, 0, 0);
    }
    var_96d7ecbed85f7c34 = combineangles(var_fa819f01102b9048.angles, new_angles);
    var_c39abbe9e9363589 = var_ad409acef85b4be0 + var_9331ff02293d3cb1 + var_f394d756662fa922;
    var_5edee71a2864871b = rotatevector(var_c39abbe9e9363589, var_fa819f01102b9048.angles);
    var_df9c5733fb2c98c7 = var_fa819f01102b9048.origin + var_5edee71a2864871b;
    dropinfo = spawnstruct();
    dropinfo.origin = var_df9c5733fb2c98c7;
    dropinfo.angles = var_96d7ecbed85f7c34;
    dropinfo.var_b5c99a0d29afb1ac = 1;
    dropinfo.payload = 0;
    dropinfo.var_97331585b4002aa7 = 1;
    return dropinfo;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99d1
// Size: 0x86
function function_7f8a8c961b21d573(item_name) {
    if (string_starts_with(item_name, " ") && item_name != "") {
        item_name = getsubstr(item_name, 1);
    }
    if (issubstr(item_name, "_mp") || issubstr(item_name, "_cp")) {
        item_name = strip_suffix(item_name, "_cp");
        item_name = strip_suffix(item_name, "_mp");
        if (string_starts_with(item_name, "equip_")) {
            item_name = strip_suffix(item_name, "_jup");
        }
    }
    return item_name;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9a60
// Size: 0x1d6
function function_63bb9d1cd72deb8b(var_fa819f01102b9048, item_name) {
    if (istrue(var_fa819f01102b9048.var_d2237f9cdc52bf94)) {
        return;
    }
    var_fa819f01102b9048.var_d2237f9cdc52bf94 = 1;
    var_f4c6bda68d182f75 = 0;
    if (isent(var_fa819f01102b9048)) {
        var_f4c6bda68d182f75 = 1;
    }
    var_72f2253976f9bb1e = undefined;
    var_1794342ed0ece8ff = item_name;
    item_name = function_7f8a8c961b21d573(item_name);
    item_id = namespace_38b993c4618e76cd::getlootidfromref(item_name);
    item_type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(item_id);
    var_1b276f35dd9e0aea = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item_id);
    boxtype = var_fa819f01102b9048.type;
    iteminfo = namespace_cfe848c6b27fe834::function_231f43f1d8cf0ef1(var_1794342ed0ece8ff);
    var_1f213921962c951e = namespace_cfe848c6b27fe834::function_6c8f43b0ad6fe1(boxtype, iteminfo.var_3124d97e64e2ed57);
    dropinfo = function_3de9d7877f75c529(var_fa819f01102b9048, iteminfo, var_1f213921962c951e, item_type);
    var_fa819f01102b9048.var_1f213921962c951e = var_1f213921962c951e;
    switch (item_type) {
    case #"hash_27124c6c97ccffa1":
        var_72f2253976f9bb1e = function_e7aaa45f3161e592(var_1b276f35dd9e0aea, item_name, item_id, undefined, var_fa819f01102b9048, dropinfo);
        break;
    case #"hash_e534fd8ec73eafb4":
        var_72f2253976f9bb1e = function_a15b9a53bdf93971(var_1b276f35dd9e0aea, dropinfo);
        break;
    }
    var_fa819f01102b9048.var_72f2253976f9bb1e = var_72f2253976f9bb1e;
    var_fa819f01102b9048.var_cea55c49c1be059f = var_72f2253976f9bb1e.origin;
    var_72f2253976f9bb1e.var_e0bcc7da9dbd4c17 = var_fa819f01102b9048;
    var_72f2253976f9bb1e.var_ad409acef85b4be0 = var_1f213921962c951e.var_ad409acef85b4be0;
    var_72f2253976f9bb1e.var_9331ff02293d3cb1 = iteminfo.weaponoffset;
    var_fa819f01102b9048 setscriptablepartstate("cp_blueprint_crate_dungeons", "fully_open_unusable");
    var_72f2253976f9bb1e enablescriptableplayeruse(level.player);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x9c3e
// Size: 0x41
function function_d6f497a23e94db93(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    thread function_d100e5bc9c6f93b9(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x9c87
// Size: 0x721
function function_d100e5bc9c6f93b9(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    var_fa819f01102b9048 = instance;
    var_f4c6bda68d182f75 = 0;
    if (isdefined(instance.entity)) {
        var_f4c6bda68d182f75 = 1;
        var_fa819f01102b9048 = instance.entity;
    }
    if (istrue(var_fa819f01102b9048.var_d2237f9cdc52bf94)) {
        return;
    }
    var_fa819f01102b9048.var_d2237f9cdc52bf94 = 1;
    var_b1384b7a11a4b6d = 0;
    if (isdefined(var_fa819f01102b9048.itemname)) {
        item_name = var_fa819f01102b9048.itemname;
    } else {
        item_name = var_fa819f01102b9048.script_noteworthy;
    }
    if (isdefined(var_fa819f01102b9048.missionname)) {
        var_565460fb587d52aa = var_fa819f01102b9048.missionname;
        var_b1384b7a11a4b6d = 1;
    } else {
        var_565460fb587d52aa = function_ce720be6f935d1d4(level.mapname);
    }
    println("<dev string:x2b5>" + var_565460fb587d52aa);
    var_d226ec5acedacd3c = undefined;
    var_d3ba0e31867f03fc = undefined;
    var_7391e47bc337367c = undefined;
    var_5c3c19452417fd1c = 0;
    var_e0fbe3abd2214926 = item_name;
    println("<dev string:x2ca>" + item_name);
    item_name = function_7f8a8c961b21d573(item_name);
    var_7391e47bc337367c = namespace_38b993c4618e76cd::getlootidfromref(item_name);
    println("<dev string:x2e1>" + var_7391e47bc337367c);
    if (var_7391e47bc337367c == 0) {
        println("<dev string:x2f8>");
        var_7391e47bc337367c = getlootidfromref(item_name);
    }
    item_id = undefined;
    var_a47a8cad864ef139 = 0;
    println("<dev string:x31f>" + var_565460fb587d52aa);
    for (i = 0; i < 40; i++) {
        if (int(var_7391e47bc337367c) == int(level.player function_e511e6f4347ff261(function_ce720be6f935d1d4(var_565460fb587d52aa, var_b1384b7a11a4b6d), i))) {
            var_a47a8cad864ef139 = 1;
            item_id = i;
            break;
        }
    }
    item_type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_7391e47bc337367c);
    var_1b276f35dd9e0aea = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_7391e47bc337367c);
    var_bd90a7abcb11636b = var_fa819f01102b9048.type;
    iteminfo = namespace_cfe848c6b27fe834::function_231f43f1d8cf0ef1(var_e0fbe3abd2214926);
    var_1f213921962c951e = namespace_cfe848c6b27fe834::function_6c8f43b0ad6fe1(var_bd90a7abcb11636b, iteminfo.var_3124d97e64e2ed57);
    var_fa819f01102b9048.var_1f213921962c951e = var_1f213921962c951e;
    dropinfo = function_3de9d7877f75c529(var_fa819f01102b9048, iteminfo, var_1f213921962c951e, item_type);
    if (!flag("map_scanner_idle") && istrue(var_fa819f01102b9048.var_b0a89836085223fc) && (!isdefined(var_fa819f01102b9048.var_c19e3c62ad7e396c) || !isdefined(var_fa819f01102b9048.var_72f2253976f9bb1e))) {
        var_fa819f01102b9048 waittill_notify_or_timeout("item_spawned", 1);
    }
    if (!isdefined(var_fa819f01102b9048.var_72f2253976f9bb1e)) {
        var_fa819f01102b9048 notify("item_cache_preload_aborted");
        if (isdefined(var_fa819f01102b9048.var_c19e3c62ad7e396c) && var_fa819f01102b9048.var_c19e3c62ad7e396c function_73cc0f04c4c5001d()) {
            var_fa819f01102b9048.var_c19e3c62ad7e396c freescriptable();
        }
        switch (item_type) {
        case #"hash_27124c6c97ccffa1":
            weapon_obj = function_4ff8438426311e0f(var_1b276f35dd9e0aea, item_name, item_id, var_7391e47bc337367c);
            var_72f2253976f9bb1e = function_ab13214d963e223f(weapon_obj, item_id, var_7391e47bc337367c, var_fa819f01102b9048, dropinfo);
            if (isdefined(weapon_obj)) {
                var_b60f4ada498a350c = 50;
                var_a4007eb2a63d3e78 = var_b60f4ada498a350c;
                while (!weapon_obj function_f4070ccd888c07b9()) {
                    wait 0.1;
                    var_a4007eb2a63d3e78 -= 1;
                    if (var_a4007eb2a63d3e78 == 0) {
                        println("<dev string:x333>" + item_name + "<dev string:xe1>" + var_b60f4ada498a350c * 0.1 + "<dev string:xf5>");
                        break;
                    }
                }
                /#
                    if (var_a4007eb2a63d3e78 > 0) {
                        println("<dev string:x333>" + item_name + "<dev string:x348>" + (var_b60f4ada498a350c - var_a4007eb2a63d3e78) * 0.1 + "<dev string:x359>");
                    }
                #/
            }
            break;
        case #"hash_e534fd8ec73eafb4":
            var_72f2253976f9bb1e = function_a15b9a53bdf93971(var_1b276f35dd9e0aea, dropinfo);
            break;
        }
    } else {
        var_fa819f01102b9048.var_72f2253976f9bb1e.origin = dropinfo.origin;
        var_72f2253976f9bb1e = var_fa819f01102b9048.var_72f2253976f9bb1e;
    }
    println("<dev string:x35c>" + level.player function_fef34e1a36b57bf6(function_ce720be6f935d1d4(var_565460fb587d52aa, var_b1384b7a11a4b6d), item_id));
    if (!istrue(level.player function_fef34e1a36b57bf6(function_ce720be6f935d1d4(var_565460fb587d52aa, var_b1384b7a11a4b6d), item_id))) {
        level notify("new_splash");
        level.player setclientomnvar("ui_new_item_discovered", var_7391e47bc337367c);
        level.player function_10e81f91fc857e5e(function_ce720be6f935d1d4(var_565460fb587d52aa, var_b1384b7a11a4b6d), item_id, 1);
        var_5c3c19452417fd1c = 1;
        level.player function_a0d4a0a7264d1772(function_ce720be6f935d1d4(var_565460fb587d52aa, var_b1384b7a11a4b6d), item_id, 1);
        println("<dev string:x374>" + var_7391e47bc337367c + "<dev string:x394>" + item_id);
    }
    if (var_5c3c19452417fd1c == 1) {
        var_72f2253976f9bb1e.var_da00cb32efd73efc = 1;
    }
    var_5814d27874b48e54 = spawnstruct();
    var_5814d27874b48e54.player = level.player;
    var_5814d27874b48e54.item_name = item_name;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_open_lootcrate", var_5814d27874b48e54);
    var_fa819f01102b9048.var_72f2253976f9bb1e = var_72f2253976f9bb1e;
    var_fa819f01102b9048.var_cea55c49c1be059f = var_72f2253976f9bb1e.origin;
    var_72f2253976f9bb1e.var_e0bcc7da9dbd4c17 = var_fa819f01102b9048;
    instance setscriptablepartstate(part, "opening_unusable");
    level.player function_2bd9c79b322a6eae("spProgData", level.var_82191bfa9f751f4c + "_should_show_loadout", 1);
    function_a946c5633329882(var_565460fb587d52aa);
    var_72f2253976f9bb1e enablescriptableplayeruse(level.player);
    var_fa819f01102b9048 notify("blueprint_crate_opened");
    level.player notify("blueprint_crate_opened");
    level notify("blueprint_crate_used", item_name);
    waitframe();
    if (isdefined(var_fa819f01102b9048.var_72f2253976f9bb1e) && isdefined(var_fa819f01102b9048.var_72f2253976f9bb1e.origin) && isdefined(dropinfo) && var_fa819f01102b9048.var_72f2253976f9bb1e.origin[2] == -650) {
        var_fa819f01102b9048.var_72f2253976f9bb1e.origin = dropinfo.origin;
        for (i = 0; i <= 3; i++) {
            waitframe();
            if (isdefined(var_fa819f01102b9048.var_72f2253976f9bb1e) && isdefined(var_fa819f01102b9048.var_72f2253976f9bb1e.origin) && var_fa819f01102b9048.var_72f2253976f9bb1e.origin[2] == -650) {
                var_fa819f01102b9048.var_72f2253976f9bb1e.origin = dropinfo.origin;
            }
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3b0
// Size: 0x39a
function function_4342188980d175a(var_fa819f01102b9048, item_name) {
    level endon("game_ended");
    if (isdefined(level.player)) {
        level.player endon("death_or_disconnect");
    }
    var_fa819f01102b9048 notify("item_cache_discovery_thread_start");
    var_fa819f01102b9048 endon("item_cache_discovery_thread_start");
    var_fa819f01102b9048 endon("item_cache_preload_aborted");
    var_fa819f01102b9048 waittill("object_discovered");
    if (istrue(var_fa819f01102b9048.var_b0a89836085223fc)) {
        return;
    }
    var_fa819f01102b9048.var_b0a89836085223fc = 1;
    var_b1384b7a11a4b6d = 0;
    if (isdefined(var_fa819f01102b9048.missionname)) {
        var_565460fb587d52aa = var_fa819f01102b9048.missionname;
        var_b1384b7a11a4b6d = 1;
    } else {
        var_565460fb587d52aa = function_ce720be6f935d1d4(level.mapname);
    }
    var_e0fbe3abd2214926 = item_name;
    item_name = function_7f8a8c961b21d573(item_name);
    var_7391e47bc337367c = namespace_38b993c4618e76cd::getlootidfromref(item_name);
    if (var_7391e47bc337367c == 0) {
        println("<dev string:x2f8>");
        var_7391e47bc337367c = getlootidfromref(item_name);
    }
    item_id = undefined;
    var_a47a8cad864ef139 = 0;
    for (i = 0; i < 40; i++) {
        if (int(var_7391e47bc337367c) == int(level.player function_e511e6f4347ff261(function_ce720be6f935d1d4(var_565460fb587d52aa, var_b1384b7a11a4b6d), i))) {
            var_a47a8cad864ef139 = 1;
            item_id = i;
            break;
        }
    }
    item_type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_7391e47bc337367c);
    var_1b276f35dd9e0aea = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_7391e47bc337367c);
    var_bd90a7abcb11636b = var_fa819f01102b9048.type;
    iteminfo = namespace_cfe848c6b27fe834::function_231f43f1d8cf0ef1(var_e0fbe3abd2214926);
    var_1f213921962c951e = namespace_cfe848c6b27fe834::function_6c8f43b0ad6fe1(var_bd90a7abcb11636b, iteminfo.var_3124d97e64e2ed57);
    var_fa819f01102b9048.var_1f213921962c951e = var_1f213921962c951e;
    dropinfo = function_3de9d7877f75c529(var_fa819f01102b9048, iteminfo, var_1f213921962c951e, item_type);
    switch (item_type) {
    case #"hash_27124c6c97ccffa1":
        weapon_obj = function_4ff8438426311e0f(var_1b276f35dd9e0aea, item_name, item_id, var_7391e47bc337367c);
        var_72f2253976f9bb1e = function_ab13214d963e223f(weapon_obj, item_id, var_7391e47bc337367c, var_fa819f01102b9048, dropinfo);
        var_fa819f01102b9048.var_c19e3c62ad7e396c = var_72f2253976f9bb1e;
        if (isdefined(weapon_obj)) {
            var_b60f4ada498a350c = 50;
            var_a4007eb2a63d3e78 = var_b60f4ada498a350c;
            while (!weapon_obj function_f4070ccd888c07b9()) {
                wait 0.1;
                var_a4007eb2a63d3e78 -= 1;
                if (var_a4007eb2a63d3e78 == 0) {
                    println("<dev string:x333>" + item_name + "<dev string:xe1>" + var_b60f4ada498a350c * 0.1 + "<dev string:xf5>");
                    break;
                }
            }
            /#
                if (var_a4007eb2a63d3e78 > 0) {
                    println("<dev string:x333>" + item_name + "<dev string:x348>" + (var_b60f4ada498a350c - var_a4007eb2a63d3e78) * 0.1 + "<dev string:x359>");
                }
            #/
        }
        break;
    case #"hash_e534fd8ec73eafb4":
        var_72f2253976f9bb1e = function_a15b9a53bdf93971(var_1b276f35dd9e0aea, dropinfo);
        var_fa819f01102b9048.var_c19e3c62ad7e396c = var_72f2253976f9bb1e;
        break;
    }
    if (isdefined(var_fa819f01102b9048.var_c19e3c62ad7e396c)) {
        var_fa819f01102b9048.var_72f2253976f9bb1e = var_fa819f01102b9048.var_c19e3c62ad7e396c;
        waitframe();
        if (!istrue(var_fa819f01102b9048.var_d2237f9cdc52bf94)) {
            var_fa819f01102b9048.var_72f2253976f9bb1e.origin = (var_fa819f01102b9048.var_72f2253976f9bb1e.origin[0], var_fa819f01102b9048.var_72f2253976f9bb1e.origin[1], -650);
        }
    }
    var_fa819f01102b9048 notify("item_spawned");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa752
// Size: 0x2
function private function_d36ffa7b1ad228e9() {
    
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa75c
// Size: 0x6f
function function_b5587a46d5f44f68(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (player val::get("crate_use")) {
        thread function_2047a0d96c8e7504();
        player setclientomnvar("ui_requested_loadout_state", 2);
        player setclientomnvar("ui_options_menu", 5);
        thread function_683f31a0f8a1a6bf(self);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa7d3
// Size: 0x68
function function_b716a25f1ab9e6f6(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    instance setscriptablepartstate(part, "opening_unusable", 0);
    instance thread function_62f168ca703b055c(instance, part);
    player setclientomnvar("ui_requested_loadout_state", 2);
    player setclientomnvar("ui_options_menu", 5);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa843
// Size: 0x85
function function_683f31a0f8a1a6bf(var_507c9b4c6252f2d8) {
    while (true) {
        level.player waittill("luinotifyserver", channel, value);
        if (channel == "dungeon_loadout_selected") {
            thread function_32ab00dfd93d0138();
            level.player setclientomnvar("ui_options_menu", 0);
            if (value == 1) {
                level.player function_2381e221a64411c2();
            }
            stopmusicstate("mx_frontend_loadout");
            break;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8d0
// Size: 0x2a
function function_2047a0d96c8e7504() {
    level.player playsound("ui_cp_loadout_change_open");
    level.player setsoundsubmix("jup_ui_cp_loadout_change");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa902
// Size: 0x2c
function function_32ab00dfd93d0138() {
    level.player playsound("ui_cp_loadout_change_close_01");
    level.player clearsoundsubmix("jup_ui_cp_loadout_change", 2);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa936
// Size: 0x8f
function function_62f168ca703b055c(instance, part) {
    while (true) {
        level.player waittill("luinotifyserver", channel, value);
        if (channel == "dungeon_loadout_selected") {
            level.player setclientomnvar("ui_options_menu", 0);
            if (value == 1) {
                level.player function_2381e221a64411c2();
            }
            instance setscriptablepartstate(part, "closing_unusable");
            instance notify("loadout_crate_opened");
            break;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9cd
// Size: 0x181
function function_1605b19eafaf18c4() {
    var_35f8943f1e8539ad = [];
    var_8ad3ed6e5b80bf6b = [];
    for (i = 0; i < 40; i++) {
        var_35f8943f1e8539ad[i] = level.player function_e511e6f4347ff261(function_ce720be6f935d1d4(level.mapname), i);
    }
    println("<dev string:x3a1>");
    if (var_35f8943f1e8539ad.size > 0) {
        for (i = 0; i < var_35f8943f1e8539ad.size; i++) {
            var_8ad3ed6e5b80bf6b[i] = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_35f8943f1e8539ad[i]);
            println("<dev string:x3dc>" + i + "<dev string:x3e3>" + var_8ad3ed6e5b80bf6b[i]);
        }
    }
    var_141babbdcbee2031 = getentitylessscriptablearray("cp_blueprint_crate_dungeons_pistol");
    var_d9b74d1eb592e7d8 = getentitylessscriptablearray("cp_blueprint_crate_dungeons");
    var_d4fa1b0bd1f675c5 = getentitylessscriptablearray("cp_blueprint_crate_dungeons_large");
    var_eb101bd59341bbe1 = getentitylessscriptablearray("cp_blueprint_crate_dungeons_xlarge");
    var_d502a63e660a35b8 = array_combine(var_d9b74d1eb592e7d8, var_d4fa1b0bd1f675c5, var_eb101bd59341bbe1, var_141babbdcbee2031);
    var_64aea63c1344ad60 = [];
    if (var_d502a63e660a35b8.size > 0) {
        /#
            println("<dev string:x16e>");
            println("<dev string:x3e5>");
        #/
        for (i = 0; i < var_d502a63e660a35b8.size; i++) {
            var_64aea63c1344ad60[i] = var_d502a63e660a35b8[i].script_noteworthy;
            println("<dev string:x420>" + i + "<dev string:x3e3>" + var_64aea63c1344ad60[i]);
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab56
// Size: 0xab
function function_70a87a63a6332a7b() {
    level.var_b2c3be1433210f36 = 1;
    var_156316a832e946db = ["cp_jup_chemical", "cp_jup_port", "cp_jup_ranch", "cp_jup_resort", "cp_jup_apt", "cp_jup_dam"];
    foreach (mission in var_156316a832e946db) {
        function_6184d3208cbeb4fa(mission);
    }
    flag_set("wait_for_map_data_clear");
    function_84f24763bf2bd555();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac09
// Size: 0x1f
function function_84f24763bf2bd555() {
    level flag_wait("player_spawned_pre_loadout");
    level.player namespace_f8d3520d3483c1::givestartingarmor();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac30
// Size: 0x354
function function_6184d3208cbeb4fa(missionname) {
    if (!isdefined(missionname)) {
        missionname = level.mapname;
    }
    println("<dev string:x436>" + missionname);
    var_347c6359b52d0f63 = function_ce720be6f935d1d4(missionname);
    function_f7475c0922084f67(var_347c6359b52d0f63);
    var_b4e0ee16bfdf7885 = level.players[0];
    for (i = 0; i < 16; i++) {
        var_b4e0ee16bfdf7885 function_a9652366b0728328(0, i, level.mapname);
    }
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_attempts", 0);
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_should_show_loadout", 0);
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_successes", 0);
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_ascender_tool", 0);
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_nvg", 0);
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_checkpoint_id", 0);
    var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_plate_level", 1);
    for (i = 0; i < 16; i++) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_map_unlocks", i, 0);
        level.var_1b908bf18691b097.var_eee1738f65c4792a[i] = 0;
    }
    for (i = 0; i < 4; i++) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_ks_unlocks", i, 0);
        level.var_1b908bf18691b097.var_761018175530ce24[i] = 0;
    }
    for (i = 0; i < function_e1e2c6c4a3a0ebad(var_347c6359b52d0f63); i++) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_discoverables", i, 0);
        level.var_1b908bf18691b097.var_1c91c276fc7873f7[i] = 0;
    }
    for (i = 0; i < 25; i++) {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", var_347c6359b52d0f63 + "_plate_carriers", i, 0);
        level.var_1b908bf18691b097.var_39ab125bd634220d[i] = 0;
    }
    for (i = 0; i < 16; i++) {
        var_b4e0ee16bfdf7885 function_a9652366b0728328(0, i);
        level.var_4898102a23066ba.objectives[i] = 0;
    }
    if (missionname == "cp_jup_port") {
        var_b4e0ee16bfdf7885 function_2bd9c79b322a6eae("spProgData", "cp_jup_parachute_activated", 0);
        level.var_1b908bf18691b097.var_5d7f8f33889c093c = 0;
    }
    level.var_1b908bf18691b097.attempts = 0;
    level.var_1b908bf18691b097.successes = 0;
    level.var_1b908bf18691b097.failures = 0;
    level.var_1b908bf18691b097.var_f46213ecf5100f4b = 0;
    level.var_1b908bf18691b097.var_c15a756c46f86d7 = 0;
    level.var_1b908bf18691b097.nvg = 0;
    level.var_1b908bf18691b097.checkpoint = 0;
    level.var_1b908bf18691b097.var_5feb596b2efa27b6 = 1;
    println(var_347c6359b52d0f63 + "<dev string:x451>");
    if (!isdefined(level.var_b2c3be1433210f36) || level.var_b2c3be1433210f36 == 0) {
        flag_set("wait_for_mission_DDL_data_clear");
        function_84f24763bf2bd555();
    }
}

/#

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xaf8c
    // Size: 0x5
    function private function_37cb5c6458f8c10e() {
        
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xaf99
    // Size: 0x3e
    function function_682da8addae457fd(var_aa3ccf1cd864619b, order) {
        var_9af94c1035c9530e = "<dev string:x477>" + var_aa3ccf1cd864619b;
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x48e>" + var_aa3ccf1cd864619b, var_9af94c1035c9530e, &function_83491a0cdbf890f7, undefined, order);
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xafdf
    // Size: 0xfb
    function function_83491a0cdbf890f7(var_2d385bc9ad36a118) {
        var_aa3ccf1cd864619b = var_2d385bc9ad36a118[0];
        var_9544bada23b1e335 = level.var_6465a2cba220aab3[var_aa3ccf1cd864619b];
        namespace_751288259782653c::function_ef21ab05bfa5c5a1(var_9544bada23b1e335.var_8e04f647cb8c4021, var_9544bada23b1e335.var_15655027aaaacf68, var_9544bada23b1e335.var_965cd465abaa1a, var_9544bada23b1e335.var_3e8686bd64fd3f91, var_9544bada23b1e335.var_7c8ee05acd3a6e01, var_9544bada23b1e335.var_461d3a38ea2cbe91);
        level.player.operatorcustomization.rebuild = 1;
        level.player.var_dc196d396886fb97 = level.var_e129f1e4a5717456 deck_draw();
        level.player.pers["<dev string:x4b0>"] = level.player.var_dc196d396886fb97;
        level.player namespace_751288259782653c::setupplayermodel();
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb0e2
    // Size: 0xee
    function function_748fe2e59aef2dea() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x4c2>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x4d5>", "<dev string:x4df>", &function_172e687f6523940f);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x4e9>", "<dev string:x4fc>", &function_bb319aa2451fc716);
        scripts\common\devgui::function_fe953f000498048f();
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x50d>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x52c>", "<dev string:x53d>", &function_1605b19eafaf18c4);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x54e>", "<dev string:x565>", &function_f7475c0922084f67);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x57c>", "<dev string:x593>", &function_3b07a2411def7296, 1);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x5b0>", "<dev string:x5c7>", &function_6184d3208cbeb4fa);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x5de>", "<dev string:x5fd>", &function_a63edf793f189f5a);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x61c>", "<dev string:x62d>", &function_9a4cab249e22a036);
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x64e>", "<dev string:x65b>");
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb1d8
    // Size: 0x91
    function function_a63edf793f189f5a() {
        var_cef669281c67d8aa = level.player getweaponslistall();
        println("<dev string:x67a>");
        println("<dev string:x6c5>");
        println("<dev string:x67a>");
        foreach (weapon in var_cef669281c67d8aa) {
            namespace_e0ee43ef2dddadaa::function_c7901c1f857aa1a0(weapon);
        }
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb271
    // Size: 0x62
    function function_172e687f6523940f() {
        while (!isdefined(level.player)) {
            waitframe();
        }
        level.player visionsetthermalforplayer("<dev string:x6f5>");
        level.player namespace_6250b14b3f614101::function_9d094fac5ae6454e("<dev string:x70b>", "<dev string:x713>", 1);
        level.player.pers["<dev string:x71e>"] = 1;
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb2db
    // Size: 0x2b
    function function_bb319aa2451fc716() {
        while (!isdefined(level.player)) {
            waitframe();
        }
        level.player scripts\cp\utility::giveperk("<dev string:x725>");
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb30e
    // Size: 0xe1
    function function_3b07a2411def7296() {
        if (!flag_exist("<dev string:x73b>")) {
            flag_init("<dev string:x73b>");
        }
        if (flag("<dev string:x73b>")) {
            flag_clear("<dev string:x73b>");
            return;
        }
        var_141babbdcbee2031 = getentitylessscriptablearray("<dev string:x755>");
        var_d9b74d1eb592e7d8 = getentitylessscriptablearray("<dev string:x778>");
        var_d4fa1b0bd1f675c5 = getentitylessscriptablearray("<dev string:x794>");
        var_eb101bd59341bbe1 = getentitylessscriptablearray("<dev string:x7b6>");
        var_4267c3fd3d6b7247 = array_combine(var_d9b74d1eb592e7d8, var_d4fa1b0bd1f675c5, var_eb101bd59341bbe1, var_141babbdcbee2031);
        /#
            if (isdefined(level.var_92bc844b6f90242a)) {
                var_4267c3fd3d6b7247 = array_combine(var_4267c3fd3d6b7247, level.var_92bc844b6f90242a);
            }
        #/
        if (var_4267c3fd3d6b7247.size > 0) {
            flag_set("<dev string:x73b>");
            thread function_15a346834cfb21b0(var_4267c3fd3d6b7247);
        }
    }

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb3f7
    // Size: 0x1fe
    function function_15a346834cfb21b0(var_4267c3fd3d6b7247) {
        while (flag("<dev string:x73b>")) {
            foreach (var_e0bcc7da9dbd4c17 in var_4267c3fd3d6b7247) {
                if (isdefined(var_e0bcc7da9dbd4c17.itemname)) {
                    var_cfc56849e630ba66 = var_e0bcc7da9dbd4c17.itemname;
                } else {
                    var_cfc56849e630ba66 = var_e0bcc7da9dbd4c17.script_noteworthy;
                }
                var_6cbaadcccd58952 = var_e0bcc7da9dbd4c17.origin + (0, 0, 25);
                if (isdefined(var_cfc56849e630ba66)) {
                    if (!isdefined(var_e0bcc7da9dbd4c17.var_d2237f9cdc52bf94) || var_e0bcc7da9dbd4c17.var_d2237f9cdc52bf94 == 0) {
                        var_1568e57fd0e55e34 = 0;
                        print3d(var_6cbaadcccd58952, var_cfc56849e630ba66, (0.48, 9.4, 0.76), 0.85, 0.7, 1, 1);
                    } else if (isdefined(var_e0bcc7da9dbd4c17.var_d2237f9cdc52bf94) && var_e0bcc7da9dbd4c17.var_d2237f9cdc52bf94 == 1) {
                        print3d(var_6cbaadcccd58952, "<dev string:x7d9>" + var_cfc56849e630ba66, (1, 0, 0), 0.85, 0.7, 1, 1);
                        var_1568e57fd0e55e34 = 1;
                    }
                } else {
                    print3d(var_6cbaadcccd58952, "<dev string:x7ed>", (0.48, 9.4, 0.76), 0.85, 0.7, 1, 1);
                }
                if (isdefined(level.player)) {
                    if (var_1568e57fd0e55e34 == 0) {
                        line(level.player.origin, var_6cbaadcccd58952, (0.48, 9.4, 0.76), 0.75);
                        continue;
                    }
                    line(level.player.origin, var_6cbaadcccd58952, (1, 0, 0), 0.75);
                }
            }
            wait 0.05;
        }
    }

#/

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb5fd
// Size: 0x24d
function function_dfd16174f3e3cd29(targetname, var_3db3b04447a8ced, delay, var_6a856aaa6ed967d7) {
    if (isdefined(delay)) {
        wait delay;
    }
    if (isdefined(targetname)) {
        object = getent(targetname, "targetname");
    } else {
        object = self;
    }
    end = undefined;
    if (isdefined(var_3db3b04447a8ced)) {
        end = function_1c4d592029f2b0d3(var_3db3b04447a8ced);
    } else {
        end = function_1c4d592029f2b0d3(object.target);
    }
    while (true) {
        if (!isdefined(end)) {
            break;
        }
        speed = 120;
        if (isdefined(end.script_noteworthy)) {
            if (!isnumber(end.script_noteworthy)) {
                switch (end.script_noteworthy) {
                case #"hash_fd151a3694ec335":
                    speed = 12000;
                    break;
                case #"hash_24da4a3cf8d69647":
                    speed = 2000;
                    break;
                case #"hash_fde9200bb250ca8e":
                    speed = 1000;
                    break;
                case #"hash_50b13b06e3c137e0":
                    speed = 480;
                    break;
                case #"hash_9c8ed152deb360f":
                    speed = 240;
                    break;
                case #"hash_e8f0758a10ec7618":
                    speed = 60;
                    break;
                default:
                    break;
                }
            } else {
                speed = end.script_noteworthy;
            }
        }
        if (isdefined(end.script_flag_true)) {
            flag_wait(end.script_flag_true);
        }
        if (isdefined(end.script_delay)) {
            wait end.script_delay;
        }
        time = distance(object.origin, end.origin) / speed;
        if (time > 0) {
            object rotateto(end.angles, time);
            object moveto(end.origin, time);
            wait time;
        }
        if (isdefined(end.script_flag)) {
            flag_set(end.script_flag);
        }
        if (isdefined(end.target)) {
            end = function_1c4d592029f2b0d3(end.target);
            continue;
        }
        break;
    }
    if (istrue(var_6a856aaa6ed967d7)) {
        object delete();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb852
// Size: 0x24d
function function_5be116fa7a9eb7a7(targetname, var_3db3b04447a8ced, delay, var_6a856aaa6ed967d7) {
    if (isdefined(delay)) {
        wait delay;
    }
    if (isdefined(targetname)) {
        object = getent(targetname, "targetname");
    } else {
        object = self;
    }
    end = undefined;
    if (isdefined(var_3db3b04447a8ced)) {
        end = function_7a18da6e48b71c35(var_3db3b04447a8ced);
    } else {
        end = function_7a18da6e48b71c35(object.target);
    }
    while (true) {
        if (!isdefined(end)) {
            break;
        }
        speed = 120;
        if (isdefined(end.script_noteworthy)) {
            if (!isnumber(end.script_noteworthy)) {
                switch (end.script_noteworthy) {
                case #"hash_fd151a3694ec335":
                    speed = 12000;
                    break;
                case #"hash_24da4a3cf8d69647":
                    speed = 2000;
                    break;
                case #"hash_fde9200bb250ca8e":
                    speed = 1000;
                    break;
                case #"hash_50b13b06e3c137e0":
                    speed = 480;
                    break;
                case #"hash_9c8ed152deb360f":
                    speed = 240;
                    break;
                case #"hash_e8f0758a10ec7618":
                    speed = 60;
                    break;
                default:
                    break;
                }
            } else {
                speed = end.script_noteworthy;
            }
        }
        if (isdefined(end.script_flag_true)) {
            flag_wait(end.script_flag_true);
        }
        if (isdefined(end.script_delay)) {
            wait end.script_delay;
        }
        time = distance(object.origin, end.origin) / speed;
        if (time > 0) {
            object rotateto(end.angles, time);
            object moveto(end.origin, time);
            wait time;
        }
        if (isdefined(end.script_flag)) {
            flag_set(end.script_flag);
        }
        if (isdefined(end.target)) {
            end = function_7a18da6e48b71c35(end.target);
            continue;
        }
        break;
    }
    if (istrue(var_6a856aaa6ed967d7)) {
        object delete();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbaa7
// Size: 0x82
function function_4090b944fec04037(flag_name, var_af4fbcf49672568d) {
    level flag_wait("level_ready_for_script");
    ents = getentarray(var_af4fbcf49672568d, "targetname");
    foreach (vol in ents) {
        level thread function_7f9af65edd6122c3(flag_name, vol);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xbb31
// Size: 0x5c
function private function_7f9af65edd6122c3(flag_name, vol) {
    level endon("game_ended");
    level endon(flag_name);
    while (!isdefined(level.player)) {
        waitframe();
    }
    level.player endon("death");
    while (!level.player istouching(vol)) {
        waitframe();
    }
    level flag_set(flag_name);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbb95
// Size: 0x6e
function private function_1cf18ac15ae7df3f(state) {
    ascenders = getentitylessscriptablearray("military_ascendertop_heavy");
    foreach (ascender in ascenders) {
        ascender setscriptablepartstate("top", state);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc0b
// Size: 0x3f
function function_5933e14a9af84b82(var_ad62847b6044e732) {
    if (var_ad62847b6044e732) {
        level.var_4ed3f3b99d808198 = 1;
        function_1cf18ac15ae7df3f("use");
        return;
    }
    level.var_4ed3f3b99d808198 = 0;
    function_1cf18ac15ae7df3f("inoperable");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc52
// Size: 0x30
function function_9529eb86e25b4574() {
    level.var_4ed3f3b99d808198 = undefined;
    if (function_1f067aa9b7648939()) {
        function_1cf18ac15ae7df3f("use");
        return;
    }
    function_1cf18ac15ae7df3f("inoperable");
}

/#

    // Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbc8a
    // Size: 0x71
    function function_dbf55c8b4e2d4fd1() {
        level flag_wait("<dev string:x7fa>");
        self endon("<dev string:x810>");
        self endon("<dev string:x816>");
        var_8fc496a9b6de32ae = 1;
        while (true) {
            var_9a91c16857c1cf45 = getdvarint(@"hash_dae30cab4377b4c8", 1);
            if (var_9a91c16857c1cf45 != var_8fc496a9b6de32ae) {
                if (!var_9a91c16857c1cf45) {
                    function_5933e14a9af84b82(1);
                } else {
                    function_9529eb86e25b4574();
                }
                var_8fc496a9b6de32ae = var_9a91c16857c1cf45;
            }
            waitframe();
        }
    }

#/

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd03
// Size: 0x7f
function function_418b23e1002e9083() {
    level flag_wait("dungeon_load_finished");
    /#
        setdvarifuninitialized(@"hash_dae30cab4377b4c8", 1);
    #/
    function_c57e43adc31f7c33("cp_ascender_device");
    var_12e16f1e390a88d0 = getentitylessscriptablearray("cp_ascender_device");
    if (var_12e16f1e390a88d0.size >= 1) {
        function_9529eb86e25b4574();
    } else {
        function_5933e14a9af84b82(1);
    }
    function_547c48dc070b2109(&function_b55d95d35f24de72);
    /#
        level.player thread function_dbf55c8b4e2d4fd1();
    #/
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xbd8a
// Size: 0xb7
function function_b55d95d35f24de72(instance, player, edgeindex, isinverted, isvertical, var_7bd9fd9d3e7c7aa) {
    if (isdefined(level.player.values["nvg"]) && istrue(level.player val::get("nvg"))) {
        level.player val::set("runNVG", "nvg", 0);
        level.player delaythread(1, &val::set, "runNVG", "nvg", 1);
    }
    level.player notify("ascender_device_use_success");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe49
// Size: 0x64
function function_1f067aa9b7648939() {
    if (isdefined(level.var_4ed3f3b99d808198)) {
        return level.var_4ed3f3b99d808198;
    }
    if (!istrue(level.var_bb3505b72e24c478)) {
        is_unlocked = level.var_1b908bf18691b097.var_c15a756c46f86d7;
    } else {
        is_unlocked = istrue(level.player.pers["ascender_device_unlocked"]);
    }
    return is_unlocked;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbeb6
// Size: 0x7c
function function_7edca09707286001() {
    level flag_wait("dungeon_load_finished");
    if (!isdefined(level.var_1b908bf18691b097)) {
        if (!isdefined(level.player.pers["kick_downs"])) {
            level.player.pers["kick_downs"] = [];
        }
    }
    var_b4195d9651125898 = getstructarray("unlock_ascender", "targetname");
    array_thread(var_b4195d9651125898, &function_772603b1ff80fa1c);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf3a
// Size: 0x18a
function function_772603b1ff80fa1c() {
    unlock = self;
    var_89019d958485f73a = getentitylessscriptablearray(unlock.target, "targetname");
    assert(var_89019d958485f73a.size == 1);
    var_4b2a6bd9f76be9de = var_89019d958485f73a[0];
    if (istrue(var_4b2a6bd9f76be9de.deployed)) {
        return;
    }
    assert(isdefined(unlock.script_noteworthy));
    var_b2f03be3203d49cd = int(unlock.script_noteworthy);
    is_unlocked = 0;
    if (!istrue(level.var_bb3505b72e24c478)) {
        is_unlocked = level.var_1b908bf18691b097.var_eee1738f65c4792a[var_b2f03be3203d49cd];
    } else {
        is_unlocked = istrue(level.player.pers["kick_downs"][var_b2f03be3203d49cd]);
    }
    if (is_unlocked) {
        function_1083fd74c5a3eece(var_4b2a6bd9f76be9de, 1);
        return;
    }
    var_4b2a6bd9f76be9de setscriptablepartstate("top", "off");
    unlock.angles = (0, 0, 0);
    var_cffca1a9623f41d5 = unlock function_238241ece18c042c(undefined, undefined, 100, 400, %DUNGEONS/KICKDOWN_ASCENDER_INTERACT);
    var_cffca1a9623f41d5 setusepriority(0);
    var_cffca1a9623f41d5 waittill("trigger");
    var_cffca1a9623f41d5 delete();
    if (!istrue(level.var_bb3505b72e24c478)) {
        function_3c666ab28a3f2008(var_b2f03be3203d49cd, 1);
    } else {
        level.player.pers["kick_downs"][var_b2f03be3203d49cd] = 1;
    }
    function_1083fd74c5a3eece(var_4b2a6bd9f76be9de, 0);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc0cc
// Size: 0x36f
function function_1083fd74c5a3eece(var_4b2a6bd9f76be9de, var_c2b60e209b8685c0) {
    if (istrue(var_4b2a6bd9f76be9de.deployed)) {
        return;
    }
    interact = self;
    var_fe1d04a7697595ac = function_1c4d592029f2b0d3(var_4b2a6bd9f76be9de.target);
    if (!isdefined(var_fe1d04a7697595ac)) {
        return;
    }
    rope = function_1c4d592029f2b0d3(var_fe1d04a7697595ac.target);
    var_e1669931c25ceae6 = getstructarray("bottom_marker", "targetname");
    bottom_marker = undefined;
    foreach (marker in var_e1669931c25ceae6) {
        if (is_equal(marker.script_noteworthy, var_4b2a6bd9f76be9de.script_noteworthy)) {
            bottom_marker = marker;
            break;
        }
    }
    assert(isdefined(bottom_marker));
    var_9b9dc458865328ab = rope.origin + (0, 0, 16);
    var_3be3b66a20321f8e = 200;
    var_ac11b9ba0095d9a7 = rope.origin[2] - bottom_marker.origin[2];
    var_7094f05aaa0c4e3d = 0.3;
    var_1d4b9f529e03338a = 1.5;
    if (istrue(var_c2b60e209b8685c0)) {
        var_3be3b66a20321f8e = 2000;
        var_7094f05aaa0c4e3d = 0;
        var_1d4b9f529e03338a = 0;
        travel_time = 0.1;
    } else {
        travel_time = var_ac11b9ba0095d9a7 / var_3be3b66a20321f8e;
    }
    var_4b2a6bd9f76be9de.deployed = 1;
    var_de3d56d1f133410f = rope;
    if (!var_c2b60e209b8685c0) {
        rope moveto((rope.origin[0], rope.origin[1], bottom_marker.origin[2]), travel_time, var_7094f05aaa0c4e3d, var_1d4b9f529e03338a);
        var_fe1d04a7697595ac rotateby((2160, 0, 0), travel_time, var_7094f05aaa0c4e3d, var_1d4b9f529e03338a);
        thread namespace_23750629c2b7a3d3::function_a60e7c732b5440e2(var_9b9dc458865328ab);
        while (true) {
            if (rope.origin[2] <= bottom_marker.origin[2]) {
                break;
            }
            if (var_9b9dc458865328ab[2] - var_de3d56d1f133410f.origin[2] < 16) {
                waitframe();
                continue;
            }
            while (var_9b9dc458865328ab[2] > var_de3d56d1f133410f.origin[2]) {
                var_b842c424720d4c7a = spawn("script_model", var_de3d56d1f133410f.origin + (0, 0, 16));
                var_b842c424720d4c7a setmodel("decor_dock_boat_rope_spline_01_16_zipline_test");
                var_b842c424720d4c7a linkto(var_de3d56d1f133410f, "tag_origin", (0, 0, 16), (0, 0, 0));
                var_de3d56d1f133410f = var_b842c424720d4c7a;
            }
            waitframe();
        }
    } else {
        steps = var_ac11b9ba0095d9a7 / 16 - 1;
        for (i = 1; i < steps; i++) {
            var_b842c424720d4c7a = spawn("script_model", rope.origin + (0, 0, -16 * i));
            var_b842c424720d4c7a setmodel("decor_dock_boat_rope_spline_01_16_zipline_test");
            var_b842c424720d4c7a.angles = rope.angles;
        }
    }
    var_4b2a6bd9f76be9de setscriptablepartstate("top", "use");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc443
// Size: 0x37
function function_1c928f4978365d99() {
    level flag_wait("dungeon_load_finished");
    var_24107c4e2ac158a6 = getstructarray("trigger_ascender", "targetname");
    array_thread(var_24107c4e2ac158a6, &function_6fb419ba35f2db16);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc482
// Size: 0xba
function function_6fb419ba35f2db16() {
    unlock = self;
    var_89019d958485f73a = getentitylessscriptablearray(unlock.target, "targetname");
    assert(var_89019d958485f73a.size == 1);
    var_4b2a6bd9f76be9de = var_89019d958485f73a[0];
    assert(isdefined(unlock.script_noteworthy));
    var_4b2a6bd9f76be9de setscriptablepartstate("top", "off");
    unlock.angles = (0, 0, 0);
    assert(isdefined(unlock.script_flag_wait));
    level flag_wait(unlock.script_flag_wait);
    function_1083fd74c5a3eece(var_4b2a6bd9f76be9de, 0);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc544
// Size: 0x61
function function_6f0de80fb3c3b9d4() {
    level flag_wait("dungeon_load_finished");
    setdvarifuninitialized(@"hash_3f45e8048e5cf1c6", 1);
    function_c57e43adc31f7c33("cp_parachute_activator");
    var_ccd5c755d9b62345 = getentitylessscriptablearray("cp_parachute_activator");
    if (var_ccd5c755d9b62345.size >= 1) {
        level.var_3d4e22af11e4c0c5 = 1;
        return;
    }
    level.var_3d4e22af11e4c0c5 = 0;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc5ad
// Size: 0x71
function function_26cd112800a1c035() {
    if (!level.var_3d4e22af11e4c0c5 || !getdvarint(@"hash_3f45e8048e5cf1c6", 1)) {
        return 1;
    }
    if (!istrue(level.var_bb3505b72e24c478)) {
        is_unlocked = level.var_1b908bf18691b097.var_5d7f8f33889c093c;
    } else {
        is_unlocked = istrue(level.player.pers["parachute_activator_unlocked"]);
    }
    return is_unlocked;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc627
// Size: 0x8d
function function_c57e43adc31f7c33(scriptable) {
    structs = getstructarray(scriptable, "targetname");
    if (isdefined(structs) && structs.size > 0) {
        foreach (struct in structs) {
            spawnscriptable(scriptable, struct.origin, struct.angles);
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6bc
// Size: 0xcb
function function_525da54dd2ac1fe2(scriptable) {
    self endon("death");
    self endon("disconnect");
    pickups = getentitylessscriptablearray(scriptable);
    if ((!isdefined(pickups) || pickups.size == 0) && !flag("cp_custom_pickups_spawned") || !flag("dungeon_load_finished")) {
        flag_wait_all("cp_custom_pickups_spawned", "dungeon_load_finished");
        waitframe();
        pickups = getentitylessscriptablearray(scriptable);
    }
    if (isdefined(pickups) && pickups.size > 0) {
        foreach (instance in pickups) {
            instance setscriptablepartstate(scriptable, "hidden");
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xc78f
// Size: 0xd3
function waittill_player_lookat(player_fov, min_dist, max_dist, offset, var_e2c4d0ba624043d, hold_time, var_e080e218fbaf1a80, predicates) {
    level endon("game_ended");
    var_e080e218fbaf1a80 = default_to(var_e080e218fbaf1a80, 0.25);
    if (!isnumber(var_e080e218fbaf1a80)) {
        assertmsg("waittill_player_lookat requires poll_time to be a number.");
        return;
    }
    var_51013b329d94fb94 = isnumber(hold_time);
    hold_count = 0;
    while (true) {
        wait var_e080e218fbaf1a80;
        target = function_61aef23379ae7542(self, player_fov, min_dist, max_dist, offset, var_e2c4d0ba624043d, predicates);
        if (!isdefined(target)) {
            continue;
        }
        if (!var_51013b329d94fb94) {
            return target;
        }
        hold_count += var_e080e218fbaf1a80;
        if (hold_count >= hold_time) {
            return target;
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc86a
// Size: 0x85
function function_1418dfaca3b1702a() {
    if (isdefined(level.player)) {
        cg_fov = getdvarint(@"cg_fov");
        zoomfov = level.player playergetzoomfov();
        var_1c2b9d4c764a8bd8 = level.player playerads() || level.player namespace_e875ad14b292bd61::binoculars_isads();
        var_8ce1f7dd12ba3832 = var_1c2b9d4c764a8bd8 ? zoomfov : cg_fov;
        return var_8ce1f7dd12ba3832;
    }
    return 65;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xc8f8
// Size: 0x2e6
function function_61aef23379ae7542(targets, player_fov, min_dist, max_dist, offset, var_e2c4d0ba624043d, predicates) {
    player = level.player;
    min_dist = default_to(min_dist, 0);
    max_dist = default_to(max_dist, 4000);
    player_fov = default_to(player_fov, function_1418dfaca3b1702a());
    offset = default_to(offset, (0, 0, 0));
    var_e2c4d0ba624043d = default_to(var_e2c4d0ba624043d, 300);
    var_6a3cc2111e30d71d = squared(min_dist);
    max_dist_sq = squared(max_dist);
    var_2b515f760b066c84 = isnumber(player_fov) && isnumber(min_dist) && isnumber(max_dist) && isvector(offset) && isnumber(var_e2c4d0ba624043d);
    if (!var_2b515f760b066c84) {
        assertmsg("player_lookat_any was provided a parameter with the wrong type.");
        return;
    }
    if (!isarray(targets)) {
        targets = [targets];
    }
    if (!isarray(predicates)) {
        predicates = [predicates];
    }
    foreach (target in targets) {
        if (!isdefined(target)) {
            continue;
        }
        var_b183161a9e5cab9a = distancesquared(player.origin, target.origin);
        if (var_b183161a9e5cab9a > max_dist_sq || var_b183161a9e5cab9a < var_6a3cc2111e30d71d) {
            continue;
        }
        look_at_point = offset;
        if (isai(target)) {
            look_at_point += target geteye() + (0, 0, 12);
        } else if (isdefined(target.origin)) {
            look_at_point += target.origin;
        } else {
            assertmsg("No valid target for player_lookat");
            return undefined;
        }
        is_looking_at = player worldpointinreticle_circle(look_at_point, player_fov, var_e2c4d0ba624043d);
        var_a49fe39fe684c761 = sighttracepassed(look_at_point + (0, 0, 18), player geteye(), 0, target);
        var_98d00ca8ed146469 = 1;
        foreach (var_6788e3106fcb4652 in predicates) {
            if (!istrue(var_98d00ca8ed146469)) {
                break;
            }
            if (!isfunction(var_6788e3106fcb4652)) {
                continue;
            }
            var_98d00ca8ed146469 = istrue([[ var_6788e3106fcb4652 ]]());
        }
        if (is_looking_at && var_a49fe39fe684c761 && istrue(var_98d00ca8ed146469)) {
            return target;
        }
    }
    return undefined;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcbe7
// Size: 0x4a
function function_8f65921ce7cbe746() {
    while (!isdefined(level.player)) {
        waitframe();
    }
    while (!isdefined(level.player.pers)) {
        waitframe();
    }
    level.player.pers["dungeonsPlayerActive"] = 1;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc39
// Size: 0x4f
function function_8dccb7c870f39d61() {
    while (!isdefined(level.player)) {
        waitframe();
    }
    while (!isdefined(level.player.pers)) {
        waitframe();
    }
    while (!isdefined(level.player.pers["dungeonsPlayerActive"])) {
        waitframe();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc90
// Size: 0xe7
function function_de5ae0c94d33b9c8() {
    level endon("game_ended");
    while (!isdefined(level.player)) {
        wait 1;
    }
    level.player endon("death");
    flag_wait("level_ready_for_script");
    var_e94eed96ff4445ea = function_1c4d592029f2b0d3("debug_outofworld");
    while (isdefined(var_e94eed96ff4445ea)) {
        var_e94eed96ff4445ea waittill("trigger", ent);
        if (isplayer(ent) && (ent isnoclip() || ent isufo())) {
            wait 0.1;
            continue;
        }
        /#
            assertmsg("<dev string:x821>" + ent.origin);
            iprintlnbold("<dev string:x821>" + ent.origin);
        #/
        if (isplayer(ent) || isai(ent) || ent scripts\common\vehicle::isvehicle()) {
            ent kill();
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd7f
// Size: 0x10c
function function_57d85dbfbd24236() {
    level endon("game_ended");
    self endon("disconnect");
    wait 5;
    maxdistsq = istrue(level.var_dfd215e11ace150f) ? 47886400 : 4000000;
    while (true) {
        wait 0.25;
        if (!isalive(self)) {
            continue;
        }
        if (!isdefined(level.var_f78fb7634e3797c4) || level.var_f78fb7634e3797c4.size == 0) {
            continue;
        }
        var_c984f49843a26a7b = 0;
        for (i = 0; i < level.var_f78fb7634e3797c4.size; i++) {
            if (distance2dsquared(self.origin, level.var_f78fb7634e3797c4[i].origin) <= maxdistsq) {
                var_c984f49843a26a7b++;
            }
        }
        if (var_c984f49843a26a7b == 0) {
            self setclientomnvar("ui_target_entity_num", -1);
            self setclientomnvar("ui_target_name_index", -1);
            level.var_9149aa09e5534d8b = -1;
            level.var_e8a53778eb5c127d = undefined;
            continue;
        }
        function_8cefc66e54e3d02e();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce93
// Size: 0x137
function function_7c2d0e47d44a53a6() {
    tracestart = self geteye();
    playerangles = self getplayerangles();
    playerlookdir = anglestoforward(playerangles);
    traceend = tracestart + playerlookdir * 2500;
    results = scripts\engine\trace::_bullet_trace(tracestart, traceend, 1, self, 0, 0, 0, 0, 0);
    hitentity = results["entity"];
    if (isdefined(hitentity) && issentient(hitentity) && !isplayer(hitentity)) {
        if (isdefined(hitentity.team) && isdefined(hitentity.entity_number)) {
            var_e0143f4f183d8a12 = isdefined(hitentity.var_e0143f4f183d8a12);
            team = hitentity.team;
            self setclientomnvar("ui_target_has_callsign", var_e0143f4f183d8a12);
            self setclientomnvar("ui_target_team", team);
            self setclientomnvar("ui_target_entity_num", hitentity.entity_number);
            return hitentity.entity_number;
        }
    }
    self setclientomnvar("ui_target_entity_num", -1);
    self setclientomnvar("ui_target_name_index", -1);
    return -1;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcfd3
// Size: 0x113
function function_f0772b50fc376504() {
    tracestart = self geteye();
    playerangles = self getplayerangles();
    playerlookdir = anglestoforward(playerangles);
    traceend = tracestart + playerlookdir * 2500;
    results = scripts\engine\trace::_bullet_trace(tracestart, traceend, 1, self, 0, 0, 0, 0, 0);
    hitentity = results["entity"];
    if (isdefined(hitentity) && issentient(hitentity) && !isplayer(hitentity)) {
        if (isdefined(hitentity.team)) {
            var_e0143f4f183d8a12 = isdefined(hitentity.var_e0143f4f183d8a12);
            self setclientomnvar("ui_target_has_callsign", var_e0143f4f183d8a12);
            team = hitentity.team;
            self setclientomnvar("ui_target_team", team);
            name_index = function_ec4bba595b3af91e(hitentity);
            self setclientomnvar("ui_target_name_index", name_index);
            return hitentity.name;
        }
    }
    return undefined;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0ef
// Size: 0x5f
function function_5d38a925b3f9ef49(var_d7ce6f119ec2187b) {
    foreach (ent in var_d7ce6f119ec2187b) {
        if (isdefined(ent.entity_number)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd157
// Size: 0x1f6
function function_8cefc66e54e3d02e() {
    tracestart = self geteye();
    playerangles = self getplayerangles();
    playerlookdir = anglestoforward(playerangles);
    traceend = istrue(level.var_dfd215e11ace150f) ? tracestart + playerlookdir * 7735 : tracestart + playerlookdir * 2500;
    within_fov = 1;
    if (istrue(level.var_dfd215e11ace150f)) {
        var_421f592f3c5f5c57 = 131072;
        var_d7ce6f119ec2187b = self function_c5140fff72feca2d(7735, 0.85, var_421f592f3c5f5c57, 1);
        within_fov = function_5d38a925b3f9ef49(var_d7ce6f119ec2187b);
    }
    if (within_fov) {
        results = scripts\engine\trace::_bullet_trace(tracestart, traceend, 1, self, 0, 0, 0, 0, 0);
        hitentity = results["entity"];
        if (isdefined(hitentity) && issentient(hitentity) && !isplayer(hitentity)) {
            if (isdefined(hitentity.team) && isdefined(hitentity.entity_number)) {
                var_e0143f4f183d8a12 = isdefined(hitentity.var_e0143f4f183d8a12);
                team = hitentity.team;
                self setclientomnvar("ui_target_has_callsign", var_e0143f4f183d8a12);
                self setclientomnvar("ui_target_team", team);
                self setclientomnvar("ui_target_entity_num", hitentity.entity_number);
                name_index = function_ec4bba595b3af91e(hitentity);
                self setclientomnvar("ui_target_name_index", name_index);
                level.var_9149aa09e5534d8b = hitentity.entity_number;
                level.var_e8a53778eb5c127d = hitentity.name;
                return;
            }
        }
    }
    self setclientomnvar("ui_target_entity_num", -1);
    self setclientomnvar("ui_target_name_index", -1);
    level.var_9149aa09e5534d8b = -1;
    level.var_e8a53778eb5c127d = undefined;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd355
// Size: 0x143
function function_ec4bba595b3af91e(hitentity) {
    if (!isdefined(level.var_cb71fb22be469134)) {
        function_70829df0e123dce4();
    }
    if (!isdefined(level.var_9b049e545a497637)) {
        function_a598e3b3c0a6eb3d();
    }
    index = -1;
    i = 0;
    foreach (var_9caa3d289889dde4 in level.var_cb71fb22be469134) {
        if (isdefined(hitentity.name) && var_9caa3d289889dde4 == hitentity.name) {
            index = i;
            return i;
        }
        i += 1;
    }
    index = -1;
    i = 0;
    foreach (var_196ac30bf10d4cd3 in level.var_9b049e545a497637) {
        if (isdefined(hitentity.name) && var_196ac30bf10d4cd3 == hitentity.name) {
            index = i;
            return i;
        }
        i += 1;
    }
    return index;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4a1
// Size: 0x74
function function_70829df0e123dce4() {
    row = 0;
    if (!isdefined(level.var_cb71fb22be469134)) {
        level.var_cb71fb22be469134 = [];
    }
    table = "cp/ally_name_table.csv";
    for (i = 0; i < tablelookupgetnumrows("cp/ally_name_table.csv"); i++) {
        level.var_cb71fb22be469134[level.var_cb71fb22be469134.size] = tablelookupbyrow(table, i, 1);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd51d
// Size: 0x74
function function_a598e3b3c0a6eb3d() {
    row = 0;
    if (!isdefined(level.var_9b049e545a497637)) {
        level.var_9b049e545a497637 = [];
    }
    table = "cp/axis_name_table.csv";
    for (i = 0; i < tablelookupgetnumrows("cp/axis_name_table.csv"); i++) {
        level.var_9b049e545a497637[level.var_9b049e545a497637.size] = tablelookupbyrow(table, i, 1);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd599
// Size: 0x6c
function function_624150e2bc78e81f(var_3ee8ad672d0b559f) {
    if (isdefined(var_3ee8ad672d0b559f)) {
        self.name = var_3ee8ad672d0b559f;
    }
    if (!isdefined(level.var_f78fb7634e3797c4)) {
        level.var_f78fb7634e3797c4 = [];
    }
    level.var_f78fb7634e3797c4[level.var_f78fb7634e3797c4.size] = self;
    self.var_ec7f24b7685542b0 = level.var_f78fb7634e3797c4.size - 1;
    self.entity_number = self getentitynumber();
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd60d
// Size: 0x18c
function function_5b13a92c82e81024(var_6192dd250b0c63df, var_c4b6602cdb280094) {
    if (!isdefined(var_c4b6602cdb280094)) {
        var_c4b6602cdb280094 = 1;
    }
    level.player freezecontrols(1);
    level.player utility::hidehudenable();
    level.player playerhide();
    level.player.vo_disabled = 1;
    level.player function_54d3bd59bff7e908(1, 1);
    level.player clearhudtutorialmessage();
    battlechatter_off();
    if (isdefined(var_6192dd250b0c63df) & var_6192dd250b0c63df == 1) {
        var_cd977be97bc0fc1e = getaiarray("axis");
        var_cd977be97bc0fc1e = utility::array_removedead_or_dying(var_cd977be97bc0fc1e);
        if (isdefined(var_cd977be97bc0fc1e)) {
            foreach (enemy in var_cd977be97bc0fc1e) {
                if (isdefined(enemy) && isalive(enemy)) {
                    enemy.diequietly = 1;
                    enemy namespace_14d36171baccf528::despawnagent();
                }
            }
        }
    }
    if (istrue(var_c4b6602cdb280094)) {
        vehicles = getvehiclearray();
        if (isdefined(vehicles)) {
            foreach (vehicle in vehicles) {
                vehicle delete();
            }
        }
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd7a1
// Size: 0x174
function function_a946c5633329882(mission) {
    if (!isdefined(mission)) {
        mission = function_ce720be6f935d1d4(level.mapname);
    }
    var_72b043c81ce7080 = mission;
    var_c7c7a5d27dba64ef = 1;
    bundle = getscriptbundle("sandboxmission_unlocklist:" + mission + "_unlocklist");
    bundle = bundle.var_4c7c8c272a931d5d;
    var_1eb910bb90ac325b = [];
    /#
        var_7568865d4a13b6f3 = [];
    #/
    var_ccd658e1ff8631db = 0;
    for (i = 0; i < bundle.size; i++) {
        if (bundle[i].isunlocked == 0) {
            var_1eb910bb90ac325b[var_1eb910bb90ac325b.size] = i;
            /#
                var_7568865d4a13b6f3[var_7568865d4a13b6f3.size] = spawnstruct();
                var_312ee66263ed863c = var_7568865d4a13b6f3.size - 1;
                var_7568865d4a13b6f3[var_312ee66263ed863c].id = i;
                var_7568865d4a13b6f3[var_312ee66263ed863c].unlockstate = level.player function_fef34e1a36b57bf6(var_72b043c81ce7080, i);
            #/
            var_ccd658e1ff8631db++;
        }
    }
    for (i = 0; i < var_ccd658e1ff8631db; i++) {
        if (!istrue(level.player function_fef34e1a36b57bf6(var_72b043c81ce7080, var_1eb910bb90ac325b[i]))) {
            var_c7c7a5d27dba64ef = 0;
        }
    }
    if (istrue(var_c7c7a5d27dba64ef)) {
        println("<dev string:x898>" + var_72b043c81ce7080);
        level.player function_2bd9c79b322a6eae("SandBoxAchievementData", var_72b043c81ce7080 + "_allitemscollected", 1);
        function_1e54b6af8762d82c();
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd91d
// Size: 0x127
function function_1e54b6af8762d82c() {
    var_15e57f992aae2f7c = 1;
    var_c85bd7b3f6961d17 = namespace_1170726b2799ea65::function_c795e60600c096c9();
    /#
        var_7568865d4a13b6f3 = [];
        foreach (mission in var_c85bd7b3f6961d17) {
            var_7568865d4a13b6f3[var_7568865d4a13b6f3.size] = spawnstruct();
            var_7568865d4a13b6f3[var_7568865d4a13b6f3.size - 1].mission = mission;
            var_7568865d4a13b6f3[var_7568865d4a13b6f3.size - 1].var_132100fe57354bb1 = level.player function_f811dfc822b6f33a("<dev string:x8ba>", mission + "<dev string:x8d1>");
        }
    #/
    for (i = 0; i < var_c85bd7b3f6961d17.size; i++) {
        var_72b043c81ce7080 = var_c85bd7b3f6961d17[i];
        var_b0027c0373e9680 = level.player function_f811dfc822b6f33a("SandBoxAchievementData", var_72b043c81ce7080 + "_allitemscollected");
        if (!istrue(var_b0027c0373e9680)) {
            var_15e57f992aae2f7c = 0;
            return;
        }
    }
    level.player function_6a369480dbaf1090("jup_sp_professionalhoarder");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda4d
// Size: 0x7d
function function_de2d867ede2eebdf() {
    var_140cf66c6caa3b60 = 1;
    var_c85bd7b3f6961d17 = namespace_1170726b2799ea65::function_c795e60600c096c9();
    for (i = 0; i < var_c85bd7b3f6961d17.size; i++) {
        var_72b043c81ce7080 = var_c85bd7b3f6961d17[i];
        if (!istrue(level.player function_f811dfc822b6f33a("SandBoxAchievementData", var_72b043c81ce7080 + "_changedloadout"))) {
            var_140cf66c6caa3b60 = 0;
            return;
        }
    }
    level.player function_6a369480dbaf1090("jup_sp_timeforanewplan");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdad3
// Size: 0x70
function function_cece888a7dfbeb0b() {
    while (!isdefined(level.player)) {
        waitframe();
    }
    level.player.var_eb504fc7e1cfeb4c = 1;
    level.player.var_51450f0a443fff = 0;
    level.var_bf2dc0f07fa83cf0 = -700;
    level.var_8f710a4504c6b92a = 1000;
    level.var_d0194f1352d26da0 = 650;
    level.var_71af99b8f5d6ec32 = 1.25;
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb4b
// Size: 0xe8
function function_4576aecf9d0c4082(entity) {
    if (!isdefined(entity)) {
        return;
    }
    if (!isdefined(entity.team)) {
        return;
    }
    level endon("ff_mission_failed");
    level childthread notifydamage(entity);
    level childthread notifydeath(entity);
    team = entity.team;
    for (;;) {
        if (!isdefined(entity)) {
            return;
        }
        if (entity.health <= 0) {
            return;
        }
        damage = undefined;
        attacker = undefined;
        direction = undefined;
        point = undefined;
        method = undefined;
        weaponname = undefined;
        entity waittill("friendlyfire_notify", damage, attacker, direction, point, method, objweapon);
        function_937a5f05c5c6114b(entity, team, damage, attacker, direction, point, method, objweapon);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xdc3b
// Size: 0x295
function function_937a5f05c5c6114b(entity, team, damage, attacker, direction, point, method, objweapon) {
    if (!isdefined(attacker)) {
        return;
    }
    if (!isdefined(entity)) {
        return;
    }
    if (!isdefined(objweapon)) {
        objweapon = entity.damageweapon;
    }
    if (isplayer(attacker)) {
        var_54c4c82bfa9fee40 = 1;
    } else {
        return;
    }
    if (!var_54c4c82bfa9fee40) {
        return;
    }
    killed = damage == -1;
    if (!isdefined(level.team) || !istrue(level.team == "allies")) {
        if (team == "axis" && istrue(killed)) {
            level.player.var_51450f0a443fff += level.var_d0194f1352d26da0;
            level.player.var_51450f0a443fff = clamp(level.player.var_51450f0a443fff, level.var_bf2dc0f07fa83cf0, level.var_8f710a4504c6b92a);
            return;
        } else if (team == "allies") {
            function_216c67ab6749137a(entity, undefined, "friendly_fire");
        } else {
            return;
        }
    } else {
        function_216c67ab6749137a(entity, undefined, "friendly_fire");
    }
    if (isdefined(objweapon)) {
        basename = objweapon.basename;
        if (basename == "claymore") {
            return;
        }
        if (basename == "flash") {
            return;
        }
        if (basename == "semtex" && isdefined(entity.semtexstuckto)) {
            damage = 9999;
        }
        if (basename == "throwingknife") {
            damage = 9999;
        }
        if (basename == "molotov") {
            damage = 9999;
        }
    }
    level.player.var_51450f0a443fff -= damage;
    level.player.var_51450f0a443fff = clamp(level.player.var_51450f0a443fff, level.var_bf2dc0f07fa83cf0, level.var_8f710a4504c6b92a);
    childthread function_705bd86edccd093(level.var_71af99b8f5d6ec32, damage);
    if (level.player.var_51450f0a443fff <= level.var_bf2dc0f07fa83cf0 || istrue(killed)) {
        setomnvar("ui_death_hint", 990);
        thread function_fa7c87f2585bd907(0);
        level notify("ff_mission_failed");
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xded8
// Size: 0x82
function notifydamage(entity) {
    entity endon("death");
    for (;;) {
        entity waittill("damage", damage, attacker, direction, point, method, unused, unused, unused, unused, objweapon);
        entity notify("friendlyfire_notify", damage, attacker, direction, point, method, objweapon);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf62
// Size: 0x5a
function notifydeath(entity) {
    team = entity.team;
    entity waittill("death", attacker, method, objweapon);
    function_937a5f05c5c6114b(entity, team, -1, attacker, undefined, undefined, method, objweapon);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdfc4
// Size: 0x7c
function function_705bd86edccd093(time, damage) {
    wait time;
    level.player.var_51450f0a443fff += damage;
    level.player.var_51450f0a443fff = clamp(level.player.var_51450f0a443fff, level.var_bf2dc0f07fa83cf0, level.var_8f710a4504c6b92a);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe048
// Size: 0xcf
function function_8e01c459332b0111() {
    flag_wait("dungeon_load_finished");
    flag_wait("scriptables_ready");
    wait 0.2;
    var_277cca8770388aaa = getstructarray("one_way", "script_noteworthy");
    var_1ff5d2ac0e927779 = 100;
    foreach (var_61aca9339f58c4dd in var_277cca8770388aaa) {
        doors = scripts\cp_mp\utility\scriptable_door_utility::scriptable_door_get_in_radius(var_61aca9339f58c4dd.origin, var_1ff5d2ac0e927779, var_1ff5d2ac0e927779);
        door = getclosest(var_61aca9339f58c4dd.origin, doors);
        door thread function_1caab8ea824ad63f(var_61aca9339f58c4dd);
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe11f
// Size: 0x343
function function_1caab8ea824ad63f(var_f2e43eb6e3be03ef) {
    level endon("game_ended");
    var_574153d380277441 = function_7a18da6e48b71c35(var_f2e43eb6e3be03ef.target);
    locked_struct = function_7a18da6e48b71c35(var_574153d380277441.target);
    var_b7433f3195fb19a6 = function_1c4d592029f2b0d3(locked_struct.target);
    if (!isdefined(level.player.pers["one_way_doors"])) {
        level.player.pers["one_way_doors"] = [];
    }
    var_5ed57325bba4a19b = function_c5e1e53d08d84cf1();
    function_79a4d351eac40e17();
    self.var_7b4b93daa27c204e = 1;
    var_110800550bda2a16 = spawn("script_model", locked_struct.origin);
    var_110800550bda2a16 setmodel("tag_origin");
    var_110800550bda2a16 makeusable();
    var_c220fc433755156a = isdefined(level.var_af4d3c79160d24d9) ? level.var_af4d3c79160d24d9 : 200;
    var_110800550bda2a16 sethintstring(%MP/DOOR_USE_OPEN);
    var_110800550bda2a16 setcursorhint("HINT_BUTTON");
    var_110800550bda2a16 sethintdisplayrange(var_c220fc433755156a);
    var_110800550bda2a16 sethintdisplayfov(90);
    var_110800550bda2a16 setuserange(72);
    var_110800550bda2a16 setusefov(180);
    var_110800550bda2a16 sethintonobstruction("hide");
    var_110800550bda2a16 setuseholdduration("duration_short");
    var_8ff70926f303b918 = spawn("script_model", var_f2e43eb6e3be03ef.origin);
    var_8ff70926f303b918 setmodel("tag_origin");
    var_8ff70926f303b918 makeusable();
    var_8ff70926f303b918 sethintstring(%DUNGEONS/ONE_WAY_DOOR_CLEAR);
    var_8ff70926f303b918 setcursorhint("HINT_BUTTON");
    var_8ff70926f303b918 sethintdisplayrange(300);
    var_8ff70926f303b918 sethintdisplayfov(90);
    var_8ff70926f303b918 setuserange(72);
    var_8ff70926f303b918 setusefov(180);
    var_8ff70926f303b918 sethintonobstruction("hide");
    var_8ff70926f303b918 setuseholdduration("duration_short");
    var_8ff70926f303b918.owner = self;
    blocker = spawnscriptable("furniture_wood_rustic_chair_01_apt", var_574153d380277441.origin, var_574153d380277441.angles);
    thread function_963d07814fa1b80a(blocker, var_5ed57325bba4a19b);
    thread function_b9f61f4082e19b9f(var_8ff70926f303b918, var_5ed57325bba4a19b);
    thread function_8c72288bbef1b705(var_110800550bda2a16, var_5ed57325bba4a19b);
    var_25e4d139f7ff6b1f = undefined;
    if (!istrue(level.player.pers["one_way_doors"][var_5ed57325bba4a19b]) || getdvarint(@"hash_efb137e10a8a6268", 0) == 1) {
        var_25e4d139f7ff6b1f = waittill_any_return_2("blocker_destroyed", "door_unlatched");
    }
    if (is_equal(var_25e4d139f7ff6b1f, "door_unlatched") || istrue(level.player.pers["one_way_doors"][var_5ed57325bba4a19b])) {
        blocker setscriptablepartstate("base", "spawn vfx");
    }
    self.var_7b4b93daa27c204e = undefined;
    var_110800550bda2a16 hide();
    var_8ff70926f303b918 hide();
    var_b7433f3195fb19a6 hide();
    var_b7433f3195fb19a6 connectpaths();
    function_79a4d351eac40e17(0);
    self scriptabledooropen();
    level.player.pers["one_way_doors"][var_5ed57325bba4a19b] = 1;
    level flag_set(var_5ed57325bba4a19b + "_solved");
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe46a
// Size: 0x77
function function_8c72288bbef1b705(var_110800550bda2a16, var_5ed57325bba4a19b) {
    self endon("door_unlatched");
    player_used = 0;
    while (true) {
        var_110800550bda2a16 function_ae165af362de18a2();
        if (!player_used) {
            thread function_45d78b7e9abdb484(var_110800550bda2a16);
            player_used = 1;
        }
        if (isdefined(level.var_83782d6266ec4fb4)) {
            thread [[ level.var_83782d6266ec4fb4 ]]();
        }
        wait 0.25;
        level notify("door_attempted " + var_5ed57325bba4a19b);
        wait 0.25;
    }
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4e9
// Size: 0x32
function function_45d78b7e9abdb484(var_110800550bda2a16) {
    self endon("door_unlatched");
    var_110800550bda2a16 hide();
    wait 0.15;
    var_110800550bda2a16 show();
    var_110800550bda2a16 sethintstring(%MP_DMZ_LOCKS/STUCK);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe523
// Size: 0x5d
function function_963d07814fa1b80a(var_4b94ac2b585ccfe0, var_5ed57325bba4a19b) {
    self endon("door_unlatched");
    while (true) {
        state = var_4b94ac2b585ccfe0 getscriptablepartstate("base");
        if (state != "pristine vfx-dyn") {
            break;
        }
        wait 0.1;
    }
    self notify("blocker_destroyed");
    level notify("blocker_destroyed " + var_5ed57325bba4a19b);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe588
// Size: 0x34
function function_b9f61f4082e19b9f(var_aa9ce13377009b7b, var_5ed57325bba4a19b) {
    self endon("blocker_destroyed");
    var_aa9ce13377009b7b function_ae165af362de18a2();
    self notify("door_unlatched");
    level notify("door_unlatched " + var_5ed57325bba4a19b);
}

// Namespace namespace_96731f4d002634f6 / namespace_1170726b2799ea65
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5c4
// Size: 0x11
function function_c5e1e53d08d84cf1() {
    return "" + self.origin;
}

