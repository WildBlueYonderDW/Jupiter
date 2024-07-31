#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_4edb60547fc8dff2;
#using script_16893fc2525dac44;
#using script_7a72d26d7a72796e;
#using script_1c3ec92145488c34;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_4a4b85b5b3beb4dd;

// Namespace namespace_4a4b85b5b3beb4dd / namespace_ef777cbd72b9a9a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2
// Size: 0xc1
function main() {
    namespace_ade9c827c041167e::main();
    namespace_cba6c4b3a2979a8c::main();
    namespace_277e30e23402ee7c::main();
    namespace_d50b72ca099866a::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_terminal_alt");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_2c1e7d6df0d51540();
    level thread function_92de98a3203eeb8d();
    level thread function_31dc060e85f4a689();
}

// Namespace namespace_4a4b85b5b3beb4dd / namespace_ef777cbd72b9a9a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49b
// Size: 0xbe
function function_92de98a3203eeb8d() {
    var_bb4de8520fe416a1 = getentarray("bombzone", "targetname");
    var_2726ba3fabe146c5 = (648, 3620, 204);
    var_4818e762328da9ce = (-36, 16, 0);
    foreach (trigger in var_bb4de8520fe416a1) {
        if (isdefined(trigger.script_label) && trigger.script_label == "_a") {
            trigger.origin = var_2726ba3fabe146c5;
        }
    }
}

// Namespace namespace_4a4b85b5b3beb4dd / namespace_ef777cbd72b9a9a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x561
// Size: 0x170
function function_2c1e7d6df0d51540() {
    gametype = getbasegametype();
    if (gametype == "war" || gametype == "cmd" || gametype == "ctf" || gametype == "cyber" || gametype == "tdm" || gametype == "dom" || gametype == "koth" || gametype == "conf") {
        level waittill("infil_setup_complete");
        if (!gameflag("infil_will_run")) {
            var_590640ad61ade716 = (784.5, 7370.5, 193);
            var_6cfce437b59d8dcc = (0, 0, 0);
            var_d68df10ea3f20efb = spawn_model("building_saba_elevator_set", var_590640ad61ade716, var_6cfce437b59d8dcc);
            var_430ac5dbe368d1f = (1365.5, 7370.5, 193);
            var_ca3f58f0d52aa841 = (0, 180, 0);
            var_e1adbea499235908 = spawn_model("building_saba_elevator_set", var_430ac5dbe368d1f, var_ca3f58f0d52aa841);
        }
        return;
    }
    var_590640ad61ade716 = (784.5, 7370.5, 193);
    var_6cfce437b59d8dcc = (0, 0, 0);
    var_d68df10ea3f20efb = spawn_model("building_saba_elevator_set", var_590640ad61ade716, var_6cfce437b59d8dcc);
    var_430ac5dbe368d1f = (1365.5, 7370.5, 193);
    var_ca3f58f0d52aa841 = (0, 180, 0);
    var_e1adbea499235908 = spawn_model("building_saba_elevator_set", var_430ac5dbe368d1f, var_ca3f58f0d52aa841);
}

// Namespace namespace_4a4b85b5b3beb4dd / namespace_ef777cbd72b9a9a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d9
// Size: 0x7f9
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
        level.modifiedspawnpoints["587 7175"]["mp_tdm_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["926 7419"]["mp_tdm_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["1208 7421"]["mp_tdm_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["1537 7813"]["mp_tdm_spawn"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (587, 7175, 208), (0, 310, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (926, 7419, 208), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (1208, 7421, 208), (0, 266, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (1537, 7183, 208), (0, 210, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (1284, 6980, 208), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (854, 6980, 208), (0, 270, 0), undefined, undefined);
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432": 
        level.modifiedspawnpoints["2430 2463"]["mp_koth_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["2276 2633"]["mp_koth_spawn"]["remove"] = 1;
        break;
    case #"hash_c51506c10984515":
    case #"hash_21eed743fb721f4a":
    case #"hash_31104ebc01bd9ba9":
    case #"hash_3696c16c262a0862":
    case #"hash_77eb1179a728005e":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005": 
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2528, 2620, 56), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1072, 2500, 56), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (628, 3144, 198.5), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (36, 3416, 56), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1464, 4056, 184), (0, 50, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2868, 4296, 64), (0, 200, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2876, 4476, 208), (0, 160, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1360, 4748, 61.9746), (0, 240, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (580, 4872, 56), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2748, 5304, 208), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1444, 5592, 208), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (412, 5192, 208), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2424, 6304, 208), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (476, 6496, 208), (0, 185, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1512, 7204, 208), (0, 215, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1072, 7400, 208), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (612, 7188, 208), (0, 315, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2820, 2612, 56), (0, 170, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (164, 6784, 208), (0, 315, 0), undefined, undefined);
        break;
    case #"hash_f4a9126c03d3385b": 
        level.modifiedspawnpoints["587 7175"]["mp_dom_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["926 7419"]["mp_dom_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["1208 7421"]["mp_dom_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["1537 7813"]["mp_dom_spawn"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (587, 7175, 208), (0, 310, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (926, 7419, 208), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (1208, 7421, 208), (0, 266, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn_secondary", (1537, 7183, 208), (0, 210, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (1284, 6980, 208), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (854, 6980, 208), (0, 270, 0), undefined, undefined);
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

