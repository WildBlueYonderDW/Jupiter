#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_398835140857d740;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;

#namespace free_perk;

// Namespace free_perk / namespace_2c8bebc278e21cf3
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x9a
// Size: 0x9
function autoexec main() {
    function_bf3da8298127a63b();
}

// Namespace free_perk / namespace_2c8bebc278e21cf3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab
// Size: 0x55
function function_bf3da8298127a63b() {
    register_powerup("free_perk", &grab_free_perk);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2c>", "<dev string:x48>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x68>", "<dev string:x84>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace free_perk / namespace_2c8bebc278e21cf3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108
// Size: 0x7c
function grab_free_perk(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player function_236b69ee9dd7d2d();
        player thread function_676437737684783f(str_powerup);
    }
}

// Namespace free_perk / namespace_2c8bebc278e21cf3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c
// Size: 0x36
function function_236b69ee9dd7d2d() {
    perk_str = zombie_perks::function_cdb669c56d86f5c4();
    /#
        if (isdefined(perk_str)) {
            iprintlnbold("<dev string:xa4>" + perk_str);
            return;
        }
        iprintlnbold("<dev string:xbb>");
    #/
}

