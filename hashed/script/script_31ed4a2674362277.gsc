// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_67fb1233e876ed8;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace puzzle_cache;

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1fb
// Size: 0xa5
function autoexec init() {
    var_f0a41e29e2358f1a = getdvarint(@"hash_509756357a8b62e3", 0) == 1;
    if (!var_f0a41e29e2358f1a) {
        return;
    }
    /#
        iprintln("<unknown string>");
        function_172af363664b6357();
    #/
    level.var_fa1aaea5978f2c8e = getdvarint(@"hash_41511be21090e24a", 0) == 1;
    if (getdvarint(@"hash_89be1a979c1ec008", 0)) {
        namespace_4b0406965e556711::function_1240434f4201ac9d("POIs_initialized");
        function_28d7437a275a45c7();
        namespace_c5622898120e827f::function_eca79fa0f341ee08(16, &dangercircletick);
    }
    registersharedfunc("brPuzzleLootCache", "spawnCacheSingleBase", &spawnCacheSingleBase);
    function_d9c64c99bd5f47a0();
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7
// Size: 0x4e
function function_28d7437a275a45c7() {
    level endon("game_ended");
    while (!isdefined(level.var_be6fec030b2f8e04)) {
        waitframe();
    }
    namespace_7052decdced06e44::function_4f7660cfd85cd517("puzzle_cache", &function_e6c1c35181a2870f);
    namespace_7052decdced06e44::function_412f527ef0863f0e("puzzle_cache", &function_88501e89a993b890);
    namespace_7052decdced06e44::function_eded5b87f8f7bdfd("puzzle_cache", &function_688349ac143a54bc);
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x25
function function_d9c64c99bd5f47a0() {
    while (!isdefined(game["dialog"])) {
        waitframe();
    }
    game["dialog"]["puzzle_cache_destroyed"] = "eaeg_eean_eest";
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0x24
function function_e6c1c35181a2870f(var_cab957adc8d7710f) {
    var_25227f181a5bb8c9 = getstructarray(var_cab957adc8d7710f, "targetname");
    return var_25227f181a5bb8c9;
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354
// Size: 0x42
function function_88501e89a993b890(var_cab957adc8d7710f, var_e521ba0c87dee5a4) {
    if (!isdefined(level.var_e901d9c7ae760bd6)) {
        level.var_e901d9c7ae760bd6 = [];
    }
    level.var_e901d9c7ae760bd6[level.var_e901d9c7ae760bd6.size] = var_e521ba0c87dee5a4;
    return var_e521ba0c87dee5a4;
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0x16d
function function_688349ac143a54bc(var_cab957adc8d7710f) {
    level endon("game_ended");
    level waittill("scriptable_loot_hide_off");
    waitframe();
    if (!isdefined(level.var_e901d9c7ae760bd6) || level.var_e901d9c7ae760bd6.size == 0) {
        return;
    }
    level.var_b8279fd758a757fc = [];
    var_8be7c5e7fb168d52 = getdvarint(@"hash_724f93c58932f368", 50);
    if (var_8be7c5e7fb168d52 > 0) {
        level.var_e901d9c7ae760bd6 = array_randomize(level.var_e901d9c7ae760bd6);
        var_8be7c5e7fb168d52 = int(min(var_8be7c5e7fb168d52, level.var_e901d9c7ae760bd6.size));
        for (i = 0; i < var_8be7c5e7fb168d52; i++) {
            var_e521ba0c87dee5a4 = level.var_e901d9c7ae760bd6[i];
            cache = function_13ace45be109698e(var_e521ba0c87dee5a4);
            level.var_b8279fd758a757fc = array_add(level.var_b8279fd758a757fc, cache);
        }
    } else {
        foreach (var_e521ba0c87dee5a4 in level.var_e901d9c7ae760bd6) {
            cache = function_13ace45be109698e(var_e521ba0c87dee5a4);
            level.var_b8279fd758a757fc = array_add(level.var_b8279fd758a757fc, cache);
        }
    }
    namespace_17c25f0877bfb620::scriptable_adddamagedcallback(&function_86eda8d9956d4976);
    level.var_e901d9c7ae760bd6 = undefined;
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x512
// Size: 0x61
function function_13ace45be109698e(var_e521ba0c87dee5a4) {
    if (!isdefined(level.var_de91da3e2aa2f9a6)) {
        level.var_de91da3e2aa2f9a6 = [];
    }
    cache = spawnCacheSingleBase(var_e521ba0c87dee5a4.origin, var_e521ba0c87dee5a4.angles);
    level.var_de91da3e2aa2f9a6[level.var_de91da3e2aa2f9a6.size] = cache;
    return cache;
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b
// Size: 0x51
function spawnCacheSingleBase(origin, angles) {
    cache = spawnscriptable("br_puzzle_loot_cache", origin, angles);
    cache setscriptablepartstate("base", "visible");
    if (level.var_fa1aaea5978f2c8e) {
        function_a20133b287aa61da(cache);
    }
    return cache;
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0x12a
function function_86eda8d9956d4976(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    cache = instance;
    if (cache.type != "br_puzzle_loot_cache" || istrue(cache.popped)) {
        return;
    }
    thread function_94532590f01ef010(cache, eattacker);
    var_607da387f3617ed1 = [[ getsharedfunc("game", "getSquadmates") ]](eattacker.team, eattacker.var_ff97225579de16a, 1);
    foreach (player in var_607da387f3617ed1) {
        namespace_aad14af462a74d08::function_8359cadd253f9604(player, "BR_EASTEREGG_BUNNYKILL", 1);
    }
    cache function_77d22365736898e2();
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705
// Size: 0xa4
function function_94532590f01ef010(cache, eattacker) {
    waitframe();
    if (isdefined(cache.popped) && cache.popped) {
        return;
    }
    items = getscriptcachecontents("br_puzzle_loot_cache", randomint(20));
    cache.var_46a3a8565ac0c17c = 4;
    cache.itemsdropped = 0;
    if (eattacker namespace_dbbb37eb352edf96::isvehicle()) {
        eattacker = eattacker.owner;
    }
    cache namespace_1b7e64f50cca9321::lootcachespawncontents(items, 0, eattacker, undefined);
    cache.popped = 1;
    function_1dc8d7e303dba9a3(eattacker);
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0
// Size: 0x25
function function_1dc8d7e303dba9a3(player) {
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("puzzle_cache_destroyed", player, 1, undefined, 0, undefined, "dx_br_jpbm_");
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc
// Size: 0x7d
function function_77d22365736898e2() {
    cache = self;
    cache setscriptablepartstate("base", "dead");
    if (level.var_fa1aaea5978f2c8e) {
        if (isdefined(cache.var_7b5e5c2bbc8f9f79)) {
            objective_delete(cache.var_7b5e5c2bbc8f9f79);
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(cache.var_7b5e5c2bbc8f9f79);
            cache.var_7b5e5c2bbc8f9f79 = undefined;
        } else {
            cache setscriptablepartstate("debug_icon", "disabled");
        }
    }
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x860
// Size: 0x98
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    var_52d59c928eb97c81 = var_e86632d645c137d0 + var_5d954f1724092f5a;
    foreach (cache in level.var_b8279fd758a757fc) {
        if (distance2dsquared(var_819edacdacb810e4, cache.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
            cache function_77d22365736898e2();
        }
    }
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ff
// Size: 0xa1
function function_a20133b287aa61da(cache) {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (objid != -1) {
        cache setscriptablepartstate("debug_icon", "disabled");
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", cache.origin, "jup_ui_map_icon_mr_peeks");
        namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 75);
        namespace_5a22b6f3a56f7e9b::function_98ba077848896a3(objid, 1);
        namespace_5a22b6f3a56f7e9b::function_846c2acd91309cd8(objid, 66, 73, 224);
        cache.var_7b5e5c2bbc8f9f79 = objid;
    } else {
        cache setscriptablepartstate("debug_icon", "visible");
    }
}

// Namespace puzzle_cache/namespace_e903b84b2bb5cc3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a7
// Size: 0x2a
function function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
}

