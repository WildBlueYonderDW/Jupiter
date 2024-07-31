#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_3fd9a2c55e3cddf2;
#using script_e4efcf5498b4d0a;
#using script_436b9cc7d3216aa0;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using script_3a2451c62aa22287;
#using script_af55484f1efcf56;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_81722f97ebc5bc2d;

// Namespace namespace_81722f97ebc5bc2d / namespace_dcba6e9692f51afd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x353
// Size: 0xc1
function main() {
    namespace_7984379dc12ba04e::main();
    namespace_9a9bc819232e88c8::main();
    namespace_ab8ba5197e3d2dd6::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_quarry");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_31dc060e85f4a689();
    if (level.gametype == "training_course") {
        function_8d4dae6254d91044();
    }
}

// Namespace namespace_81722f97ebc5bc2d / namespace_dcba6e9692f51afd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41c
// Size: 0x99
function function_8d4dae6254d91044() {
    level thread namespace_759803dbc54117d9::main();
    if (getdvarint(@"hash_9d5c413d77e87872", 0) == 0) {
        namespace_4ee0bc5b4cf0be4c::init_outofbounds();
    }
    objectsarray = [];
    objectsarray["weapon"] = getstruct("tut_ak", "script_noteworthy");
    objectsarray["triggers"] = function_f159c10d5cf8f0b4("ActionTrigger", "targetname");
    objectsarray["care_package"] = getstruct("tut_carepackage", "script_noteworthy");
    namespace_4ee0bc5b4cf0be4c::init_gameobjects(getentarray("tut_target", "targetname"), objectsarray);
    thread init_audio();
}

// Namespace namespace_81722f97ebc5bc2d / namespace_dcba6e9692f51afd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd
// Size: 0x21
function init_audio() {
    level endon("game_ended");
    level waittill("player_spawned");
    setglobalsoundcontext("gametype", "training_course");
}

// Namespace namespace_81722f97ebc5bc2d / namespace_dcba6e9692f51afd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e6
// Size: 0x238
function function_31dc060e85f4a689() {
    spawns = [];
    switch (getbasegametype()) {
    case #"hash_25397d96e5bc8403": 
        break;
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
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_axis_start", (897, 3550, 836.075), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_axis_start", (833, 3550, 828.565), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_axis_start", (769, 3550, 832.843), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_axis_start", (705, 3550, 835.415), (0, 270, 0), undefined, undefined);
        break;
    case #"hash_c51506c10984515":
    case #"hash_21eed743fb721f4a":
    case #"hash_31104ebc01bd9ba9":
    case #"hash_3696c16c262a0862":
    case #"hash_77eb1179a728005e":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005": 
        break;
    case #"hash_f4a9126c03d3385b": 
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

