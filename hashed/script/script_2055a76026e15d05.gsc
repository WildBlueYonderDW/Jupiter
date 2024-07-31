#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_711efae9eaf019c2;
#using script_4e41c1c063e1047e;
#using script_2031d3ecb6ad9004;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_5dc590d71a6587e4;

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0xb6
function main() {
    namespace_afcf0cc29e6e647e::main();
    namespace_db62b9d641c65a14::main();
    namespace_d0a25dec56bb3fa2::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_blackheart");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    scripts\cp_mp\utility\game_utility::registersmallmap();
    thread crusher();
    thread shredder();
}

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x86
function crusher() {
    level endon("game_ended");
    button = getent("crusher_button", "targetname");
    var_303a18afe9c2c7b = getent("crusher_kill", "targetname");
    if (!isdefined(var_303a18afe9c2c7b)) {
        return;
    }
    var_303a18afe9c2c7b trigger_off();
    msg = "crusher";
    thread show_label(button, msg);
    while (true) {
        player = button waittill("trigger");
        crush(var_303a18afe9c2c7b);
    }
}

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x86
function shredder() {
    level endon("game_ended");
    button = getent("shredder_button", "targetname");
    var_303a18afe9c2c7b = getent("shredder_kill", "targetname");
    if (!isdefined(var_303a18afe9c2c7b)) {
        return;
    }
    var_303a18afe9c2c7b trigger_off();
    msg = "shredder";
    thread show_label(button, msg);
    while (true) {
        player = button waittill("trigger");
        function_6e1c2cef124d8489(var_303a18afe9c2c7b);
    }
}

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x434
// Size: 0x7c
function show_label(trig, machine) {
    level endon("game_ended");
    while (true) {
        pos = trig.origin + (0, 0, 4);
        msg = "Press F to activate " + machine;
        /#
            print3d(pos, msg, (0.9, 0.9, 0.9), 1, 0.2, 1, 1);
        #/
        waitframe();
    }
}

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x5f
function crush(trig) {
    crusher = getent("crusher", "targetname");
    crusher movez(-128, 8, 1, 1);
    wait 8;
    time = 6;
    function_8b45da99e2a6da1c(trig, time);
    crusher movez(128, 7, 1, 1);
    wait 7;
}

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51f
// Size: 0xed
function function_6e1c2cef124d8489(trig) {
    var_7105bdb05a2247b0 = getent("shredder_one", "targetname");
    var_a45b04b13c657546 = getent("shredder_two", "targetname");
    var_d1030d895bd655a = getent("shredder_one_col", "targetname");
    var_59b0e90096e2b534 = getent("shredder_two_col", "targetname");
    time = 6;
    thread function_8b45da99e2a6da1c(trig, time);
    var_7105bdb05a2247b0 rotateby((0, 0, -360), time, 1, 1);
    var_a45b04b13c657546 rotateby((0, 0, -360), time, 1, 1);
    var_d1030d895bd655a rotateby((0, 0, 360), time, 1, 1);
    var_59b0e90096e2b534 rotateby((0, 0, -360), time, 1, 1);
    wait time;
}

// Namespace namespace_5dc590d71a6587e4 / namespace_d08d882e2b924331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x614
// Size: 0x25
function function_8b45da99e2a6da1c(trig, time) {
    trig trigger_on();
    wait time;
    trig trigger_off();
}

