// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_427ce33ec0c820cf;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace powerup_loot_master;

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1a5
// Size: 0x27
function autoexec main() {
    if (getdvarint(@"hash_7bb53daa26b41b60", 0)) {
        return;
    }
    init();
    /#
        function_172af363664b6357();
    #/
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3
// Size: 0x5f
function init() {
    powerups::register_powerup("loot_master", &powerup_grab);
    level thread namespace_7f0bcee5d45a1dea::add("cache_opened", &cache_opened);
    level.var_e78241b508792f72 = getdvar(@"hash_2c09072504f4441", "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_base.csv");
    level.var_c5fdd5b88e000108 = getdvar(@"hash_d6c2d3e0ce8901f5", "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_lege.csv");
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239
// Size: 0x74
function powerup_grab(str_powerup, var_4d44d70760d7ad71) {
    var_2db8e0791ae6b435 = function_a56a8b17eae57b09(str_powerup);
    foreach (player in var_2db8e0791ae6b435) {
        player thread function_fbdcbe03e66deea2();
    }
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x6d
function function_fbdcbe03e66deea2(var_5ed2ffb8d01c0e35) {
    self notify("powerup_loot_master");
    self endon("powerup_loot_master");
    self endon("disconnect");
    level endon("game_ended");
    self.var_3632a62a1d6e8748 = 1;
    if (!isdefined(var_5ed2ffb8d01c0e35)) {
        var_5ed2ffb8d01c0e35 = powerups::function_e419d148895ea689("loot_master");
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("loot_master", var_5ed2ffb8d01c0e35);
    waittill_any_timeout_2(var_5ed2ffb8d01c0e35, "end_powerup_loot_master", "death");
    function_ebfcf8d8c1086e4e();
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0x15
function function_ebfcf8d8c1086e4e() {
    self.var_3632a62a1d6e8748 = undefined;
    self notify("end_powerup_loot_master");
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344
// Size: 0x1a3
function cache_opened(params) {
    if (istrue(params.player.var_3632a62a1d6e8748)) {
        roll = randomintrange(1, 99);
        var_89b24eedd14bcd45 = spawnstruct();
        var_89b24eedd14bcd45.origin = params.instance.origin;
        var_89b24eedd14bcd45.angles = params.instance.angles + (0, 85, 0);
        var_a57a04f61ff45d3f = spawnstruct();
        var_a57a04f61ff45d3f.origin = params.instance.origin;
        var_a57a04f61ff45d3f.angles = params.instance.angles + (0, 95, 0);
        dropstruct = spawnstruct();
        dropstruct.dropcount = 0;
        dropstruct.var_dfba5a2c3c6f0a07 = 0;
        thread function_97462d6ebcf0bc27(params.player, "powerup_jup_loot_master_cache_fx", params.instance, 5);
        if (roll <= 100) {
            wait(0.5);
            var_986acb83cc29ed77 = var_89b24eedd14bcd45 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, undefined, level.var_e78241b508792f72);
        }
        if (roll <= 30) {
            wait(0.5);
            var_9afe9014523f8d7d = var_a57a04f61ff45d3f namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 4, 1, undefined, level.var_c5fdd5b88e000108);
        }
    }
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee
// Size: 0x1b4
function function_97462d6ebcf0bc27(owner, var_30f4e244e5c57497, cache, duration) {
    level endon("game_ended");
    payload = [0:#"hash_5f9c433bdcfb4e14", 1:owner getentitynumber()];
    var_57acadc40b2f0a8 = namespace_1b7e64f50cca9321::function_cb377a5e11eef62c(cache);
    var_31cfd1e3f2eaef5c = var_57acadc40b2f0a8[1];
    var_85b2c4040be4eeed = var_57acadc40b2f0a8[0];
    var_31cfd1e3f2eaef5c = ter_op(isdefined(var_31cfd1e3f2eaef5c), var_31cfd1e3f2eaef5c, cache.origin);
    angles = cache.angles;
    if (isdefined(var_85b2c4040be4eeed)) {
        angles = cache.angles + (0, var_85b2c4040be4eeed, 0);
    } else {
        angles = cache.angles + (0, 90, 0);
    }
    scriptable = spawnscriptable(var_30f4e244e5c57497, var_31cfd1e3f2eaef5c, angles, undefined, payload);
    scriptable setscriptablepartstate("fx", "spawn");
    if (isdefined(cache.var_841b09ee5baa92d9)) {
        var_ea3b9640a6ad3c8e = rotatevectorinverted(scriptable.origin - cache.var_841b09ee5baa92d9.origin, cache.var_841b09ee5baa92d9.angles);
        localangles = combineangles(invertangles(cache.var_841b09ee5baa92d9.angles), cache.angles);
        scriptable utility::function_6e506f39f121ea8a(cache.var_841b09ee5baa92d9, var_ea3b9640a6ad3c8e, localangles);
    }
    wait(duration);
    scriptable freescriptable();
}

// Namespace powerup_loot_master/namespace_4ae7984c584a92d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a9
// Size: 0x5d
function function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

