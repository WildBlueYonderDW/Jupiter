#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_71377694f2ad3445;
#using script_345063fd82f0759e;
#using script_62f8d390888e967a;
#using script_45021122541efa90;
#using scripts\mp\load.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_4ee3cf03f4470c9e;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\gametypes\wm_objectives.gsc;

#namespace namespace_3ce5328d463f2501;

// Namespace namespace_3ce5328d463f2501 / namespace_a1d1cb6d99cf1f9f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x300
// Size: 0x22d
function main() {
    namespace_56ae7976ec67bdf3::main();
    namespace_40e0e1c29e46db8a::main();
    namespace_bce91ecf98352a58::main();
    namespace_78065fe0e46d6966::main();
    scripts\mp\load::main();
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_7d729daff9f41dee::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    if (function_a7caa13ebe4c4ba5() || isgroundwarcoremode()) {
        if (!isdefined(scripts\cp_mp\utility\game_utility::getlocaleid())) {
            if (getgametype() == "gwtdm") {
                setdvar(@"scr_localeID", 991);
            } else {
                setdvar(@"scr_localeID", 999);
            }
        }
        scripts\mp\gametypes\arm::arm_initoutofbounds();
    } else {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
        level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
        setdvar(@"hash_9365c7a237edaa2f", 1);
        level.parachutecancutautodeploy = 1;
        level.parachutecancutparachute = 1;
    }
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    allvolumes = function_f159c10d5cf8f0b4("noent_volume_minimap", "classname");
    foreach (volume in allvolumes) {
        volume delete();
    }
    scripts\mp\compass::setupminimap("compass_map_mp_jup_gw_fallout");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    if (getgametype() == "wm") {
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(1, "_a", "zone_1", "jup_dam_wb_capture_zone_a");
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(1, "_b", "zone_2", "jup_dam_wb_capture_zone_b");
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(1, "_c", "zone_3", "jup_dam_wb_capture_zone_c");
    }
    setdvar(@"fd_helicopter_altitude_limiter", 4000);
    function_274cd16d0af35466();
}

// Namespace namespace_3ce5328d463f2501 / namespace_a1d1cb6d99cf1f9f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x535
// Size: 0x66e
function function_274cd16d0af35466() {
    if (level.gametype == "gwtdm") {
        level.modifiedspawnpoints["-9418 29422.3 1197.02"]["mp_gw_spawn_axis_start"]["removeradius"] = 256;
        level.modifiedspawnpoints["-9086.81 30692 1201.66"]["mp_gw_spawn_axis_start"]["removeradius"] = 256;
        spawns = [];
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9555.75, 29346.9, 1186.55), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9535.28, 29410.2, 1185.79), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9516.1, 29471.3, 1190.98), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9496.95, 29532.3, 1193.74), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9483.82, 29360.6, 1183.65), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9464.67, 29421.6, 1186.81), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9445.5, 29482.7, 1191.7), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9433.62, 29308.6, 1186.77), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9426.34, 29543.7, 1194.17), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9413.24, 29371.9, 1187.36), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9393.97, 29433, 1188.92), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9374.82, 29494, 1190.15), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9361.69, 29322.2, 1192.83), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9355.64, 29555.1, 1191.51), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9342.54, 29383.3, 1194.05), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9323.36, 29444.4, 1190.37), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9304.2, 29505.4, 1191.14), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9190.08, 30667.4, 1196.05), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9173.8, 30729.2, 1202.94), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9157.48, 30791.2, 1208.92), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9152.59, 30558.3, 1194.59), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9136.3, 30620.1, 1194.38), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9120.01, 30682, 1196.9), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9103.7, 30743.9, 1203.71), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9082.61, 30572.9, 1192.93), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9066.3, 30634.8, 1192.99), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9050.01, 30696.6, 1202.39), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9036.53, 30763.4, 1203.8), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9028.84, 30525.6, 1191.06), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-9012.54, 30587.5, 1190.85), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-8996.24, 30649.4, 1200.3), (0, 0, 0), undefined, "locale_991");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_gw_spawn_allies_start", (-8979.93, 30711.3, 1202.27), (0, 0, 0), undefined, "locale_991");
        if (spawns.size > 0) {
            addscriptedspawnpoints(spawns);
        }
    }
}

