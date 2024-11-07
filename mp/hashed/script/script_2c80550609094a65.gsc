#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_a1ce10e842f9ca0;
#using script_2531353e7d14439e;
#using script_5b44d014fbcc4324;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using script_48814951e916af89;
#using script_30fbbeb9a6251e9a;
#using scripts\stealth\enemy.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_54a357a6d601240a;

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b4
// Size: 0xd0
function main() {
    namespace_a1e979af15e52f24::main();
    namespace_10757be27cd716cc::main();
    namespace_328633e3782beb3a::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_scrapyard");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_31dc060e85f4a689();
    if (getdvarint(@"hash_5f60d5026cd2c8b0") == 1) {
        function_476e26432f5d3edd();
    }
    function_e06c6de255dd9770();
    wait 0.05;
}

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48c
// Size: 0x9a
function function_476e26432f5d3edd() {
    var_8b1c18e78b52638 = getstructarray("jackolantern", "script_noteworthy");
    var_140e4695f31a730d = 4096;
    foreach (var_ac64400b9ee8389b in var_8b1c18e78b52638) {
        if (distance2dsquared(var_ac64400b9ee8389b.origin, (428.998, 883.746, -173.375)) <= var_140e4695f31a730d) {
            deletestruct_ref(var_ac64400b9ee8389b);
        }
    }
}

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52e
// Size: 0x40
function function_1682cf22619a5e55() {
    level waittill("infil_setup_complete");
    var_6120df12544987e8 = getent("static_infil_van", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_6120df12544987e8)) {
        var_6120df12544987e8 hide();
    }
}

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x576
// Size: 0x2a
function function_e06c6de255dd9770() {
    if (!function_d86d387e8205b87f()) {
        return;
    }
    level.var_648cfe8e093ab1e = &function_f4c47c36c9a0f0d;
    setdvar(@"hash_365d77262b3a350e", 0);
}

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a8
// Size: 0x1a8
function function_f4c47c36c9a0f0d(player) {
    player endon("death");
    player endon("disconnect");
    if (!function_d86d387e8205b87f()) {
        return;
    }
    offsets = [];
    offsets[0] = (0, 0, 0);
    offsets[1] = (0, 85, 250);
    offsets[2] = (85, 0, 500);
    team = player.pers["team"];
    /#
        if (getdvarint(@"hash_8d1e4d803cf510c4", 0)) {
            team = getotherteam(team)[0];
        }
    #/
    for (i = 0; i < 3; i++) {
        x = offsets[i][0];
        y = offsets[i][1];
        z = 0;
        up = anglestoup((0, 0, 0));
        safeorigin = getclosestpointonnavmesh(player.origin + (x, y, z), up);
        if (getnumactiveagents("actor_jup_enemy_mp_ar_gl") >= getdvarint(@"hash_6bd2368eb9f278c6", 9)) {
            return;
        }
        ai = namespace_bfef6903bca5845d::ai_mp_requestspawnagent("actor_jup_enemy_mp_ar_gl", safeorigin, undefined, "high", "everybody", undefined, undefined, team);
        primaryweaponhash = "iw9_ar_akilo, [ none, none, none, none, none, none ], none, none";
        ai endon("death");
        waitframe();
        ai thread namespace_30bebe2c8fdd4f94::function_c789cc0bd60384c2(safeorigin + (0, 0, 1000 + offsets[i][2]), safeorigin);
        ai scripts\stealth\enemy::bt_set_stealth_state("combat");
    }
}

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x758
// Size: 0x11
function function_d86d387e8205b87f() {
    return getdvarint(@"hash_969da081cdd3cead", 0);
}

// Namespace namespace_54a357a6d601240a / namespace_7217147be6ec6a19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x772
// Size: 0x6f9
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
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (642, -826, -258.414), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (192, -566, -259.824), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-90, 48, -217.25), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-272, 842, -209.25), (0, 343, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-414, 1196, -201.5), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-466, 1404, -199.827), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-616, 1860, -196.378), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-556, 2164, -203.458), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-762, 2296, -188.274), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-596, 3012, -188.274), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-444, 2896, -188.274), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (-374, 3086, -200), (0, 313, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (82, 2180, -184.059), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (488, 3332, -200), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1218, 3490, -204.609), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1426, 2988, -200.748), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1216, 2472, -204.239), (0, 285, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (488, 1488, -200.828), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (828, 1346, -154.707), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1436, 1668, -144), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1766, 1786, -144), (0, 195, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1476, 1318, -144.5), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1892, 1322, -144.5), (0, 195, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1560, 952, -144.5), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1692, 846, -149.935), (0, 15, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1556, 596, -183.251), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1066, 392, -238.113), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (598, 244, -229.015), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1382, -634, -224), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1494, -276, -224.633), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (1858, -166, -221.768), (0, 105, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dm_spawn", (2010, 378, -154.81), (0, 105, 0), undefined, undefined);
        break;
    case #"hash_f4a9126c03d3385b":
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

