#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_422801cfe4074e05;

#namespace namespace_30101e0cca498f6;

// Namespace namespace_30101e0cca498f6 / namespace_8a8c1d3ffd176d9c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f
// Size: 0x3b
function init() {
    assert(flag("<dev string:x1c>"));
    callback::add("on_agent_spawned", &on_ai_spawn);
    callback::add("on_ai_killed", &on_ai_killed);
}

// Namespace namespace_30101e0cca498f6 / namespace_8a8c1d3ffd176d9c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x172
// Size: 0x58
function private on_ai_spawn(params) {
    ent = params.agent;
    if (!isdefined(ent)) {
        return;
    }
    state = 0;
    data = ent.agent_type;
    analytics::function_a569c60476357392("agent_spawn", ent, state, data);
}

// Namespace namespace_30101e0cca498f6 / namespace_8a8c1d3ffd176d9c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d2
// Size: 0x151
function private on_ai_killed(params) {
    ent = self;
    if (!isdefined(ent)) {
        return;
    }
    attacker = params.eattacker;
    if (!isdefined(attacker) || !(isagent(attacker) || isplayer(attacker)) || !isdefined(attacker.classname) || attacker.classname == "worldspawn" || attacker.classname == "script_vehicle" || attacker.classname == "script_model" || attacker.classname == "misc_turret" || attacker.classname == "misc_samsite" || attacker.classname == "trigger_hurt" || attacker.classname == "trigger_multiple" || attacker.classname == "script_origin") {
        var_9c46fc77656f0e4b = "world";
    } else {
        attacker_weapon = attacker getcurrentweapon();
        var_9c46fc77656f0e4b = attacker_weapon.basename;
    }
    state = 0;
    analytics::function_a569c60476357392("agent_down", ent, state, var_9c46fc77656f0e4b);
}

