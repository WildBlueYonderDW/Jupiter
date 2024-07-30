#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_376c9374c3cfb4f2;
#using script_4b51a497b2012eb2;
#using script_7c1acc9cb08c2548;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_e1e72bdd1693b115;

// Namespace namespace_e1e72bdd1693b115 / namespace_57b59f6b9ff96f8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca
// Size: 0xa7
function main() {
    namespace_1a662c43829927be::main();
    namespace_b781ccc45f2577b8::main();
    namespace_ea8c57e25e1f54c6::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_arcade");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread function_213b0789ce58cfd5();
}

// Namespace namespace_e1e72bdd1693b115 / namespace_57b59f6b9ff96f8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x95
function function_213b0789ce58cfd5() {
    var_8c439f7c112081e = getstructarray("gondola_start", "script_noteworthy");
    foreach (var_61fb690ac4ff15c8 in var_8c439f7c112081e) {
        var_46e9c3ad7bbcde82 = spawn_model("jup_machinery_gondola_lift_car_vista_01", var_61fb690ac4ff15c8.origin, var_61fb690ac4ff15c8.angles);
        var_61fb690ac4ff15c8 thread function_c6daef16e4542187(var_46e9c3ad7bbcde82);
    }
}

// Namespace namespace_e1e72bdd1693b115 / namespace_57b59f6b9ff96f8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x316
// Size: 0xae
function function_c6daef16e4542187(var_46e9c3ad7bbcde82) {
    targetpoint = getstruct(self.target, "targetname");
    currentpoint = self;
    while (isdefined(targetpoint)) {
        var_7a7468a3f3fd54b = distance(currentpoint.origin, targetpoint.origin);
        var_4187040fa98742ee = var_7a7468a3f3fd54b / 160;
        thread function_9637cf9e39bf1ab7(var_46e9c3ad7bbcde82, targetpoint.origin, targetpoint.angles, var_4187040fa98742ee);
        wait var_4187040fa98742ee;
        currentpoint = targetpoint;
        targetpoint = getstruct(currentpoint.target, "targetname");
    }
}

// Namespace namespace_e1e72bdd1693b115 / namespace_57b59f6b9ff96f8d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc
// Size: 0x39
function function_9637cf9e39bf1ab7(var_46e9c3ad7bbcde82, targetorigin, targetangle, var_4187040fa98742ee) {
    var_46e9c3ad7bbcde82 moveto(targetorigin, var_4187040fa98742ee);
    var_46e9c3ad7bbcde82 rotateto(targetangle, 0.1);
}

