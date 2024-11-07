#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\anim.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\player_rig.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\sp\objectives.gsc;
#using script_5d265b4fca61f070;
#using scripts\common\ai.gsc;
#using scripts\sp\hud_util.gsc;
#using script_53f4e6352b0b2425;
#using script_1db908936531314b;
#using script_6bf6c8e2e1fdccaa;
#using script_19163c4e4e504a5e;
#using script_4b7698942d6f679a;
#using script_e2fc04a6cc6c766;

#namespace namespace_a6d3081fd5d2d172;

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b
// Size: 0x25
function function_5d084583d28da7ff() {
    utility::set_start_location("start_escape_run", [level.player]);
    thread namespace_9c93a5b828db4a4b::function_e39d8a96b86719ce(0);
}

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0x49
function function_3eb536d67b1ad828() {
    utility::set_start_location("start_escape_run", [level.player]);
    level.player shellshock("default_nosound", 5);
    level.player hud_util::fade_in(4, "black");
}

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9
// Size: 0xfd
function function_16e7e34592d39ad4(array, notif) {
    guy1 = array[0];
    guy2 = array[1];
    foreach (guy in array) {
        guy linkto(self);
        guy utility::set_baseaccuracy(0.25);
        guy.health = 25;
        guy utility::set_ignoreall(1);
    }
    wait 3;
    foreach (guy in array) {
        guy utility::set_ignoreall(0);
    }
    utility::waittill_multiple_ents(guy1, "death", guy2, "death");
    level notify(notif);
}

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x2
function function_fca1f15e44a27511() {
    
}

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x37
function function_fb1d5e80f330c65() {
    utility::set_start_location("outro", [level.player]);
    setsaveddvar(@"hash_e3b392663b07939c", 1);
    thread namespace_9c93a5b828db4a4b::function_e39d8a96b86719ce(1);
}

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x307
// Size: 0x2
function function_42267542ddd353e() {
    
}

// Namespace namespace_a6d3081fd5d2d172 / namespace_e529e744e528c9d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x311
// Size: 0x2
function function_8fd119d2b021a4b7() {
    
}

