#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\common\exploder.gsc;
#using script_1870e90529eb0822;
#using script_d7628a6dfc41b52;
#using script_9510f49310de468;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\animation_suite.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_3bf2ebc37c28e4f;

// Namespace namespace_3bf2ebc37c28e4f / namespace_508f32749fc055ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x411
// Size: 0xf2
function main() {
    namespace_769de59f0a855e26::main();
    namespace_44641bea01898318::main();
    namespace_393b906fe4032e26::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_shipment_iw9");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    setdvar(@"r_umbraaccurateocclusionthreshold", 384);
    scripts\cp_mp\utility\game_utility::registersmallmap();
    if (level.gametype == "arena") {
        scripts\cp_mp\utility\game_utility::registerarenamap();
    }
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread function_e182fb0acb8f13db();
    thread scripts\mp\animation_suite::animationsuite();
    thread function_31dc060e85f4a689();
    level function_3c37e8e4377aa2b3();
    level.var_5cd0b14f081d7d7a = 1;
    level.gethillspawnshutoffradius = &function_69fcdbec24a02352;
}

// Namespace namespace_3bf2ebc37c28e4f / namespace_508f32749fc055ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50b
// Size: 0x13
function function_69fcdbec24a02352() {
    return getdvarint(@"hash_c0cf50f594cc8ecc", 512);
}

// Namespace namespace_3bf2ebc37c28e4f / namespace_508f32749fc055ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x527
// Size: 0x14
function function_e182fb0acb8f13db() {
    wait 1;
    exploder("shipsplash_back_l");
}

// Namespace namespace_3bf2ebc37c28e4f / namespace_508f32749fc055ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x543
// Size: 0x9a
function function_3c37e8e4377aa2b3() {
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-356, -292, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-348, -856, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-1032, -356, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-1100, -120, -184), 0);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-596, 336, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((140, -112, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((80, -356, -184), 0);
}

// Namespace namespace_3bf2ebc37c28e4f / namespace_508f32749fc055ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e5
// Size: 0xd45
function function_31dc060e85f4a689() {
    spawns = [];
    switch (getbasegametype()) {
    case #"hash_1a5d186c17c00d3c":
        break;
    case #"hash_a1313b745c17c07e":
        break;
    case #"hash_5ff8e011d5b9d1c8":
        break;
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        break;
    case #"hash_fa0ed2f6bd4f4395":
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
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1024, -870, -174), (0, 36, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-790, -496, -174), (0, 92, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1126, -394, -174), (0, 296, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1026, -380, -174), (0, 288, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1014, -118, -174), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1110, -72, -174), (0, 54, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-550, 352, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (62, -94, -174), (0, 98, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (146, -78, -174), (0, 122, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (170, -332, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (170, -390, -180), (0, 196, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-304, 380, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (-430, 340, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (126, -164, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (90, -294, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (-374, -490, -174), (0, 82, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (-430, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (-1056, -288, -174), (0, 286, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (-1140, -314, -174), (0, 278, 0), undefined, undefined);
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432":
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1024, -870, -174), (0, 36, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-790, -496, -174), (0, 92, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1126, -394, -174), (0, 296, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1026, -380, -174), (0, 288, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1014, -118, -174), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1110, -72, -174), (0, 54, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-550, 352, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (62, -94, -174), (0, 98, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (146, -78, -174), (0, 122, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (170, -332, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (170, -390, -180), (0, 196, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-304, 380, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (-430, 340, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (126, -164, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (90, -294, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (-374, -490, -174), (0, 82, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (-430, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (-1056, -288, -174), (0, 286, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (-1140, -314, -174), (0, 278, 0), undefined, undefined);
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
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1024, -870, -174), (0, 36, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-790, -496, -174), (0, 92, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1126, -394, -174), (0, 296, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1026, -380, -174), (0, 288, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1014, -118, -174), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1110, -72, -174), (0, 54, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-550, 352, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (62, -94, -174), (0, 98, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (146, -78, -174), (0, 122, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (170, -332, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (170, -390, -180), (0, 196, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (-430, 340, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (126, -164, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (90, -294, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (-430, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (-1056, -288, -174), (0, 286, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (-1140, -314, -174), (0, 278, 0), undefined, undefined);
        break;
    }
    if (level.mapname == "mp_jup_shipment_alt") {
        level.modifiedspawnpoints["-526 -872 -172"]["mp_ctf_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_ctf_spawn_secondary"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_arena_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_arena_spawn_secondary"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_dd_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_dd_spawn_secondary"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_tdm_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_tdm_spawn_secondary"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_koth_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_koth_spawn_secondary"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_dm_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_dm_spawn_secondary"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_dom_spawn"]["removeradius"] = 32;
        level.modifiedspawnpoints["-526 -872 -172"]["mp_dom_spawn_secondary"]["removeradius"] = 32;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (-484, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (-484, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn_secondary", (-484, -870, -176), (0, 0, 0), undefined, undefined);
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

