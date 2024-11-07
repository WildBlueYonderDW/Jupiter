#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_7efba2db2dbb87b8;
#using script_6ba5e65cf4f487e;
#using script_7e7d259aeed2b404;
#using scripts\mp\gametypes\aon.gsc;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_d38d84f7b23f9a44;

// Namespace namespace_d38d84f7b23f9a44 / namespace_e67cd1b0f54d265d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x361
// Size: 0xe7
function main() {
    namespace_1cbda33674120e60::main();
    namespace_a978727f44b70de8::main();
    namespace_45cbeb39d619edf6::main();
    level.var_cceea51a1fecb716 = &scripts\mp\gametypes\aon::main;
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_rust_alt_toon");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_1682cf22619a5e55();
    scripts\cp_mp\utility\game_utility::registersmallmap();
    if (getdvarint(@"hash_75c08b5d09e65c6c", 1) == 1) {
        level.var_e886c825dc0634c0 = 1;
    }
    level thread function_31dc060e85f4a689();
}

// Namespace namespace_d38d84f7b23f9a44 / namespace_e67cd1b0f54d265d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x40
function function_1682cf22619a5e55() {
    level waittill("infil_setup_complete");
    var_6120df12544987e8 = getent("static_infil_van", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_6120df12544987e8)) {
        var_6120df12544987e8 hide();
    }
}

// Namespace namespace_d38d84f7b23f9a44 / namespace_e67cd1b0f54d265d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x498
// Size: 0x413
function function_31dc060e85f4a689() {
    spawns = [];
    switch (getbasegametype()) {
    case #"hash_1a5d186c17c00d3c":
        break;
    case #"hash_a1313b745c17c07e":
        break;
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        break;
    case #"hash_2fcf99fb5dbdcffb":
    case #"hash_3a17de6e294210d2":
    case #"hash_515260130b210bff":
    case #"hash_7485fa6c474ec865":
    case #"hash_973d1db8b6644466":
    case #"hash_b0eb18371d980895":
    case #"hash_b9458959b10637f8":
    case #"hash_c3668076a0827ce0":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ddd385f0a27d71bb":
    case #"hash_ea061d29bbd1f237":
    case #"hash_ec24570718a340f5":
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432":
        break;
    case #"hash_c51506c10984515":
    case #"hash_21eed743fb721f4a":
    case #"hash_31104ebc01bd9ba9":
    case #"hash_3696c16c262a0862":
    case #"hash_77eb1179a728005e":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005":
        level.modifiedspawnpoints["580 -95"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["1288 -165"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["1618 509"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["852 932"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["1129 1799"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["-201 -57"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["860 604"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["1746 1148"]["mp_dm_spawn_start"]["remove"] = 1;
        level.modifiedspawnpoints["148 1472"]["mp_dm_spawn_start"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (1372, 1539.5, 51), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (1515.5, 922, 31), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (1553.5, -52, 30.2574), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (1055.5, 880, 53.343), (0, 28, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (838, 494.5, 38.5457), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (572, -27.5, 70), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (-186, -57.5, 45.3439), (0, 342, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (-246, 1004.5, 45.3439), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn_start", (-100, 1780.5, 19.9797), (0, 0, 0), undefined, undefined);
        break;
    case #"hash_f4a9126c03d3385b":
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

