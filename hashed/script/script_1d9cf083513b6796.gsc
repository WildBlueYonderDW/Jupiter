#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\common\vehicle.gsc;

#namespace br_breakable_loot_cache;

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x195
// Size: 0x75
function autoexec init() {
    if (!getdvarint(@"hash_50661a2e735c4ff4", 1)) {
        return;
    }
    if (getdvarint(@"hash_89be1a979c1ec008", 0)) {
        scripts\mp\flags::function_1240434f4201ac9d("ssc_initialized");
        namespace_7052decdced06e44::function_4f7660cfd85cd517("breakable_cache", &function_e6c1c35181a2870f);
        namespace_7052decdced06e44::function_412f527ef0863f0e("breakable_cache", &function_88501e89a993b890);
        namespace_7052decdced06e44::function_eded5b87f8f7bdfd("breakable_cache", &function_688349ac143a54bc);
        scripts\mp\gametypes\br_circle::function_eca79fa0f341ee08(19, &dangercircletick);
    }
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x212
// Size: 0x24
function function_e6c1c35181a2870f(structname) {
    allspawnlocations = getstructarray(structname, "targetname");
    return allspawnlocations;
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x41
function function_88501e89a993b890(structname, cachestruct) {
    if (!isdefined(level.var_1bc7ff1d89c35da9)) {
        level.var_1bc7ff1d89c35da9 = [];
    }
    level.var_1bc7ff1d89c35da9[level.var_1bc7ff1d89c35da9.size] = cachestruct;
    return cachestruct;
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0xd8
function function_688349ac143a54bc(structname) {
    level endon("game_ended");
    level waittill("scriptable_loot_hide_off");
    waitframe();
    if (!isdefined(level.var_1bc7ff1d89c35da9) || level.var_1bc7ff1d89c35da9.size == 0) {
        return;
    }
    level.var_430915b3b28cf27d = [];
    foreach (cachestruct in level.var_1bc7ff1d89c35da9) {
        cache = function_13ace45be109698e(cachestruct);
        level.var_430915b3b28cf27d = array_add(level.var_430915b3b28cf27d, cache);
    }
    scripts\engine\scriptable::scriptable_adddamagedcallback(&function_86eda8d9956d4976);
    level.var_1bc7ff1d89c35da9 = undefined;
    thread function_eb667f4637b65478();
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x369
// Size: 0x84
function function_eb667f4637b65478() {
    level waittill("br_ending_start");
    if (!isdefined(level.var_430915b3b28cf27d) || level.var_430915b3b28cf27d.size == 0) {
        return;
    }
    foreach (cache in level.var_430915b3b28cf27d) {
        if (isdefined(cache)) {
            cache scripts\mp\gametypes\br_pickups::deletescriptableinstance(1);
        }
    }
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f5
// Size: 0x61
function function_13ace45be109698e(cachestruct) {
    if (!isdefined(level.var_8ccc53d3eec3626f)) {
        level.var_8ccc53d3eec3626f = [];
    }
    cache = function_84a9a18653459d3(cachestruct.origin, cachestruct.angles);
    level.var_8ccc53d3eec3626f[level.var_8ccc53d3eec3626f.size] = cache;
    return cache;
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45f
// Size: 0x3d
function function_84a9a18653459d3(origin, angles) {
    cache = spawnscriptable("br_breakable_loot_cache", origin, angles);
    cache setscriptablepartstate("base", "visible");
    return cache;
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5
// Size: 0x9f
function function_86eda8d9956d4976(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    cache = instance;
    if (!isdefined(cache) || cache.type != "br_breakable_loot_cache") {
        return;
    }
    level thread function_c0897471dbdb42ad(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x54c
// Size: 0xb7
function function_c0897471dbdb42ad(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    cache = instance;
    waittillframeend();
    if (eattacker scripts\common\vehicle::isvehicle()) {
        eattacker = eattacker.owner;
    }
    items = getscriptcachecontents("br_breakable_cache", randomint(20));
    cache.itemsdropped = 0;
    cache scripts\mp\gametypes\br_lootcache::lootcachespawncontents(items, 0, eattacker, undefined);
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0x20
function scriptablehide() {
    cache = self;
    cache setscriptablepartstate("base", "dead");
}

// Namespace br_breakable_loot_cache / namespace_c193e1252d09364
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x633
// Size: 0xa2
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (isdefined(level.var_430915b3b28cf27d)) {
        var_52d59c928eb97c81 = dangercircleradius + thresholdradius;
        foreach (cache in level.var_430915b3b28cf27d) {
            if (distance2dsquared(var_819edacdacb810e4, cache.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
                cache scriptablehide();
            }
        }
    }
}

