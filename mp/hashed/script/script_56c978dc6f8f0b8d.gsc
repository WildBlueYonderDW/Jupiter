#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_3f390a9dccfcba22;
#using script_77b7a3060a672b16;
#using script_3a9d4462da6a707c;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_13f90ae1a8d374dd;

// Namespace namespace_13f90ae1a8d374dd / namespace_82856015e5509f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27b
// Size: 0x90
function main() {
    namespace_2ab676595852ebae::main();
    namespace_d8952d477a90d4d4::main();
    namespace_846498a62cd11662::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_quarry_alt");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_31dc060e85f4a689();
}

// Namespace namespace_13f90ae1a8d374dd / namespace_82856015e5509f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x313
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

