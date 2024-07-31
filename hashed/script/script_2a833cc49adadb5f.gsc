#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_43ee407dd64b8586;
#using script_1b7a8b0794ef5f02;
#using script_13d8fd098278b5c4;
#using script_24ba5d35724ca692;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_5606f0ec3c55f74d;

// Namespace namespace_5606f0ec3c55f74d / namespace_56d512bc7db4c9d7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0xce
function main() {
    namespace_8f1b04c619266ce2::main();
    namespace_109a5b65e906dd7a::main();
    namespace_321191adedbdac86::main();
    namespace_e768889220f6456c::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_delayed");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"r_umbraAccurateOcclusionThreshold", 1024);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread play_movie("pic_screens_delayed");
    level thread function_2c1e7d6df0d51540();
}

// Namespace namespace_5606f0ec3c55f74d / namespace_56d512bc7db4c9d7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x333
// Size: 0x170
function function_2c1e7d6df0d51540() {
    gametype = getbasegametype();
    if (gametype == "war" || gametype == "cmd" || gametype == "ctf" || gametype == "cyber" || gametype == "tdm" || gametype == "dom" || gametype == "koth" || gametype == "conf") {
        level waittill("infil_setup_complete");
        if (!gameflag("infil_will_run")) {
            var_590640ad61ade716 = (2920, -1128, 150);
            var_6cfce437b59d8dcc = (0, 90, 0);
            var_d68df10ea3f20efb = spawn_model("building_saba_elevator_set", var_590640ad61ade716, var_6cfce437b59d8dcc);
            var_430ac5dbe368d1f = (2920, -548, 150);
            var_ca3f58f0d52aa841 = (0, 270, 0);
            var_e1adbea499235908 = spawn_model("building_saba_elevator_set", var_430ac5dbe368d1f, var_ca3f58f0d52aa841);
        }
        return;
    }
    var_590640ad61ade716 = (2920, -1128, 150);
    var_6cfce437b59d8dcc = (0, 90, 0);
    var_d68df10ea3f20efb = spawn_model("building_saba_elevator_set", var_590640ad61ade716, var_6cfce437b59d8dcc);
    var_430ac5dbe368d1f = (2920, -548, 150);
    var_ca3f58f0d52aa841 = (0, 270, 0);
    var_e1adbea499235908 = spawn_model("building_saba_elevator_set", var_430ac5dbe368d1f, var_ca3f58f0d52aa841);
}

// Namespace namespace_5606f0ec3c55f74d / namespace_56d512bc7db4c9d7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab
// Size: 0x57
function play_movie(bink) {
    if (getdvarint(@"hash_e6afce2cf5cf7515") == 1) {
        return;
    }
    while (true) {
        if (flag("nuke_bink_done")) {
            break;
        }
        setdvar(@"bg_cinematicFullscreen", "0");
        playcinematicforalllooping(bink);
        wait 3;
    }
}

