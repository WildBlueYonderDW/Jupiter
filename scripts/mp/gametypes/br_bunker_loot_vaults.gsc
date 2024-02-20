// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\gametypes\br_bunker_alt.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_b97784ad34653176;

// Namespace namespace_b97784ad34653176/namespace_f066127c5446cbd7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c
// Size: 0x212
function init() {
    level.lootbunkersactive = getdvarint(@"hash_48fd1e2273274091", 1);
    level.maxaccesscardspawns_red = getdvarint(@"hash_bba96189687d4ae7", 5);
    level.accesscardsspawned_red = 0;
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_keypad", &keypadscriptableused);
    var_56224d01d10ea4d1 = [0:1, 1:2, 2:3, 3:7, 4:10];
    if (getdvarint(@"hash_dbf8b77ea6cffc8d", 0) == 1) {
        var_752def01b8bfd717 = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:9, 9:10];
    } else {
        var_752def01b8bfd717 = [0:0, 1:4, 2:5, 3:6, 4:9];
    }
    level.bunker_loot_vaults = spawnstruct();
    level.bunker_loot_vaults.doors = [];
    level.bunker_loot_vaults.hints = [];
    for (i = 0; i <= 10; i++) {
        var_ac7a80eca239ede7 = "bunker_door_" + i;
        var_4ea0a8f8e7fb6273 = getaltbunkerindexforname(var_ac7a80eca239ede7);
        if (var_4ea0a8f8e7fb6273 >= 0) {
            continue;
        }
        doors = getentarray(var_ac7a80eca239ede7, "targetname");
        level.bunker_loot_vaults.doors[i] = doors[0];
        if (!isdefined(level.bunker_loot_vaults.doors[i])) {
            continue;
        }
        var_a0636bd2191a4bbc = namespace_3c37cb17ade254d::array_contains(var_752def01b8bfd717, i) && level.lootbunkersactive;
        level thread namespace_ff69a74765774dfd::initbunkerdoor(level.bunker_loot_vaults.doors[i], var_a0636bd2191a4bbc);
        initlootvaultkeypad(var_a0636bd2191a4bbc, i, namespace_3c37cb17ade254d::array_contains(var_56224d01d10ea4d1, i));
    }
}

// Namespace namespace_b97784ad34653176/namespace_f066127c5446cbd7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x335
// Size: 0x1f7
function initlootvaultkeypad(var_a0636bd2191a4bbc, var_c0560ea98ea1fc50, var_2d0e7ac083ad5250, var_b0bd841cacf6d96d) {
    if (istrue(var_b0bd841cacf6d96d)) {
        door = level.br_bunker_alt.bunkervaults.doors[var_c0560ea98ea1fc50];
    } else {
        door = level.bunker_loot_vaults.doors[var_c0560ea98ea1fc50];
    }
    forward = anglestoforward(door.angles);
    left = anglestoleft(door.angles);
    var_a10ae505a570d67e = undefined;
    if (istrue(var_2d0e7ac083ad5250)) {
        var_a10ae505a570d67e = door.origin + (0, 0, 45) + forward * 50 + left * 97;
    } else {
        var_a10ae505a570d67e = door.origin + (0, 0, 45) + forward * 37 + left * 80;
    }
    if (istrue(var_b0bd841cacf6d96d)) {
        level.br_bunker_alt.bunkervaults.hints[var_c0560ea98ea1fc50] = spawnscriptable("maphint_keypad_bunker_alt", var_a10ae505a570d67e);
        level.br_bunker_alt.bunkervaults.hints[var_c0560ea98ea1fc50].isopenable = var_a0636bd2191a4bbc;
        level.br_bunker_alt.bunkervaults.hints[var_c0560ea98ea1fc50].door = door;
    } else {
        level.bunker_loot_vaults.hints[var_c0560ea98ea1fc50] = spawnscriptable("maphint_keypad", var_a10ae505a570d67e);
        level.bunker_loot_vaults.hints[var_c0560ea98ea1fc50].isopenable = var_a0636bd2191a4bbc;
        level.bunker_loot_vaults.hints[var_c0560ea98ea1fc50].door = door;
    }
}

// Namespace namespace_b97784ad34653176/namespace_f066127c5446cbd7
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x533
// Size: 0x42
function keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_b97784ad34653176/namespace_f066127c5446cbd7
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x57c
// Size: 0x167
function _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_keypad");
    #/
    var_b0bd841cacf6d96d = namespace_dd9c7fa8aa834c52::isaltbunkerscriptable(instance);
    /#
        assert(!var_b0bd841cacf6d96d);
    #/
    if (istrue(instance.backwallkeypad)) {
        if (soundexists("br_keypad_deny")) {
            playsoundatpos(player.origin, "br_keypad_deny");
        }
        instance setscriptablepartstate("maphint_keypad", "off");
        wait(3);
        instance setscriptablepartstate("maphint_keypad", "on");
    } else if (getdvarint(@"hash_8c6e1c43e3d41dd3", 0) == 1 || istrue(instance.isopenable) && player namespace_d3d40f75bb4e4c32::hasaccesscard()) {
        level thread namespace_ff69a74765774dfd::openbunkerdoor(instance.door, 1, "bunker_loot_shared", "door_open");
        instance setscriptablepartstate("maphint_keypad", "off");
        player namespace_cb965d2f71fefddc::removeaccesscard();
    } else {
        if (soundexists("br_keypad_deny")) {
            playsoundatpos(player.origin, "br_keypad_deny");
        }
        instance setscriptablepartstate("maphint_keypad", "off");
        wait(3);
        instance setscriptablepartstate("maphint_keypad", "on");
    }
}

