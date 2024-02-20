// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_a3eba96da74e0bf8;

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x342
// Size: 0x4c
function init() {
    if (isdefined(level.var_a3eba96da74e0bf8)) {
        return;
    }
    function_45f38d9c4f09112b();
    level._effect["vfx_golden_loot_explosion_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_golden_loot_explosion_flare");
    level._effect["vfx_br_legendary_loot_glow"] = loadfx("vfx/iw8_br/gameplay/vfx_br_launch_code_glow");
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x136
function function_45f38d9c4f09112b() {
    if (!isdefined(level.var_a3eba96da74e0bf8)) {
        level.var_a3eba96da74e0bf8 = spawnstruct();
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd = [];
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["rifle"] = "brloot_ammo_762";
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["mg"] = "brloot_ammo_762";
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["pistol"] = "brloot_ammo_919";
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["smg"] = "brloot_ammo_919";
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["sniper"] = "brloot_ammo_50cal";
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["rocketlauncher"] = "brloot_ammo_rocket";
        level.var_a3eba96da74e0bf8.var_32137b56af4c22dd["spread"] = "brloot_ammo_12g";
    }
    level.var_a3eba96da74e0bf8.var_e481959866261112 = [];
    level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531 = [];
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2
// Size: 0x84
function function_8cd7f4939fad286d(key, var_744edf9c7df03f55) {
    if (!isdefined(level.var_a3eba96da74e0bf8)) {
        /#
            assertmsg("Loot Spawner has not been initiated!");
        #/
        return;
    }
    if (!array_contains_key(level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531, key)) {
        level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[key] = function_7d7a712ef3b127ea(key, var_744edf9c7df03f55);
    } else {
        /#
            assertmsg("A loot table already exist at key " + key + ". Use ReplaceLootTable() instead");
        #/
    }
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55d
// Size: 0x53
function function_7b8ccedb73cc8fd3(var_d974cc8b12dcba2f, var_b3067c4046466191) {
    if (function_53b4df89c7012e9a(var_d974cc8b12dcba2f)) {
        return;
    }
    if (array_contains_key(level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531, var_d974cc8b12dcba2f)) {
        level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[var_d974cc8b12dcba2f] = var_b3067c4046466191;
    }
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7
// Size: 0xb2
function function_ef51288f40f95d1b(key, itemid, var_73783e51d7dca907) {
    if (function_53b4df89c7012e9a(key)) {
        return;
    }
    var_36bcc1e84d2a5f78 = level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[key];
    if (!array_contains_key(var_36bcc1e84d2a5f78, itemid)) {
        level.var_a3eba96da74e0bf8.var_e481959866261112[key][itemid] = var_73783e51d7dca907;
        level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[key] = function_7d7a712ef3b127ea(key, level.var_a3eba96da74e0bf8.var_e481959866261112[key]);
    } else {
        /#
            assertmsg(itemid + " already exist in loot table: " + key);
        #/
    }
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x670
// Size: 0xc3
function function_26022cd17e1904ce(key, itemid) {
    if (function_53b4df89c7012e9a(key)) {
        return;
    }
    var_36bcc1e84d2a5f78 = level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[key];
    if (array_contains_key(var_36bcc1e84d2a5f78, itemid)) {
        level.var_a3eba96da74e0bf8.var_e481959866261112[key] = array_remove_key(level.var_a3eba96da74e0bf8.var_e481959866261112[key], itemid);
        level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[key] = function_7d7a712ef3b127ea(key, level.var_a3eba96da74e0bf8.var_e481959866261112[key]);
    } else {
        /#
            assertmsg(itemid + " does not exist in loot table: " + key);
        #/
    }
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73a
// Size: 0x2c
function function_b3d3903f8130fff7(key) {
    if (function_53b4df89c7012e9a(key)) {
        return;
    }
    return level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531[key];
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76e
// Size: 0x26
function function_d9ef8d5dab99814c(key) {
    return array_contains_key(level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531, key);
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x79c
// Size: 0x288
function function_889a4446bb24ec16(var_bab91ec21655f39c, position, spawncount, var_72e8f6018c6615a0, args) {
    if (function_53b4df89c7012e9a(var_bab91ec21655f39c)) {
        return;
    }
    var_36bcc1e84d2a5f78 = function_b3d3903f8130fff7(var_bab91ec21655f39c);
    var_60ce74182e7c83a7 = spawnstruct();
    var_60ce74182e7c83a7.dropcount = randomintrange(1, 10);
    var_60ce74182e7c83a7.heightoffset = 0;
    var_60ce74182e7c83a7.origin = position;
    if (isstring(var_72e8f6018c6615a0)) {
        goto LOC_000000ff;
    }
    if (var_72e8f6018c6615a0) {
        playfx(getfx("vfx_golden_loot_explosion_flare"), position);
    LOC_000000ff:
    }
LOC_000000ff:
    for (i = 0; i < spawncount; i++) {
        var_3b9ee963911a96c0 = randomfloat(1);
        foreach (key, entry in var_36bcc1e84d2a5f78) {
            var_f35b93a944c13de8 = entry[2];
            var_2b4ef98997be493 = entry[3];
            if (var_3b9ee963911a96c0 >= var_f35b93a944c13de8 && var_3b9ee963911a96c0 <= var_2b4ef98997be493) {
                switch (key) {
                case #"hash_637736d2cc79a66a":
                    goto LOC_0000026e;
                case #"hash_414a0057bc9c9914":
                    if (!isdefined(args)) {
                        /#
                            assertmsg(isdefined(args["eAttacker"]), "Using brloot_ammo_killer_based, but missing args param in this function call");
                        #/
                        goto LOC_0000026e;
                    }
                    if (!isdefined(args["eAttacker"])) {
                        /#
                            assertex(isdefined(args["eAttacker"]), "Using brloot_ammo_killer_based, but missing args[eAttacker] param in this function call");
                        #/
                        goto LOC_0000026e;
                    }
                    attacker = args["eAttacker"];
                    var_5131da474c4c19ca = undefined;
                    if (isplayer(attacker) || isbot(attacker) || isagent(attacker)) {
                        var_5131da474c4c19ca = weaponclass(args["eAttacker"] getcurrentweapon());
                    }
                    if (!isdefined(var_5131da474c4c19ca)) {
                        goto LOC_0000026e;
                    }
                    var_60ce74182e7c83a7.item = level.var_a3eba96da74e0bf8.var_32137b56af4c22dd[var_5131da474c4c19ca];
                    if (!isdefined(var_60ce74182e7c83a7.item)) {
                        goto LOC_0000026e;
                    }
                    break;
                default:
                    var_60ce74182e7c83a7.item = key;
                    break;
                }
                var_60ce74182e7c83a7.dropcount = var_60ce74182e7c83a7.dropcount + 2;
                thread spawnloot(var_60ce74182e7c83a7);
                waitframe();
            LOC_0000026e:
            }
        LOC_0000026e:
        }
    }
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa2b
// Size: 0x3d
function function_53b4df89c7012e9a(key) {
    if (!array_contains_key(level.var_a3eba96da74e0bf8.var_8b7d7ce1b42f0531, key)) {
        /#
            assertmsg("No loot table exist at key " + key);
        #/
        return 1;
    }
    return 0;
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa70
// Size: 0xbc
function spawnloot(var_60ce74182e7c83a7) {
    var_60ce74182e7c83a7.legendary = issubstr(var_60ce74182e7c83a7.item, "lege");
    itemname = var_60ce74182e7c83a7.item;
    spawnposition = var_60ce74182e7c83a7.origin + (0, 0, var_60ce74182e7c83a7.heightoffset);
    angles = (0, 0, 0);
    var_63354ed1d936777b = namespace_1b7e64f50cca9321::lootspawnitem(itemname, var_60ce74182e7c83a7, spawnposition, angles, 0, var_60ce74182e7c83a7.legendary, 0);
    var_60ce74182e7c83a7.heightoffset = var_60ce74182e7c83a7.heightoffset + 3;
}

// Namespace namespace_a3eba96da74e0bf8/namespace_5ec5215ed7483164
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb33
// Size: 0x1a0
function function_7d7a712ef3b127ea(var_ccf10def4015e022, var_36bcc1e84d2a5f78) {
    var_7f076c6b7a5ef5b3 = [];
    var_7a3c33a815c53ca3 = 0;
    foreach (value in var_36bcc1e84d2a5f78) {
        var_7a3c33a815c53ca3 = var_7a3c33a815c53ca3 + value;
    }
    index = 0;
    var_b67d18cac8627e8c = getarraykeys(var_36bcc1e84d2a5f78);
    var_800802af73fa0898 = undefined;
    /#
        iprintln("<unknown string>");
        iprintln("<unknown string>" + var_ccf10def4015e022);
    #/
    foreach (key, value in var_36bcc1e84d2a5f78) {
        var_7f076c6b7a5ef5b3[key] = [];
        var_716c638075c3b64e = value / var_7a3c33a815c53ca3;
        if (index == 0) {
            var_bde41274f0d07563 = 0;
            var_b57be88bb1f41a6e = var_716c638075c3b64e;
        } else {
            var_bde41274f0d07563 = var_800802af73fa0898[3];
            var_b57be88bb1f41a6e = var_bde41274f0d07563 + var_716c638075c3b64e;
        }
        var_7f076c6b7a5ef5b3[key] = [0:value, 1:var_716c638075c3b64e, 2:var_bde41274f0d07563, 3:var_b57be88bb1f41a6e];
        var_800802af73fa0898 = var_7f076c6b7a5ef5b3[key];
        /#
            iprintln(key + "<unknown string>" + var_7f076c6b7a5ef5b3[key][1]);
        #/
        index++;
    }
    /#
        iprintln("<unknown string>");
    #/
    level.var_a3eba96da74e0bf8.var_e481959866261112[var_ccf10def4015e022] = var_36bcc1e84d2a5f78;
    return var_7f076c6b7a5ef5b3;
}

