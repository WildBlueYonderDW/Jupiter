// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_40ee7223a578cbc8;
#using scripts\common\devgui.gsc;

#namespace namespace_453f6d7726d3161e;

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4
// Size: 0x5d
function function_7f1a5cba2db537c5() {
    thread function_abafe9cd03c2c0ab();
    self._blackboard.var_d182b3cdaa8e3be7 = 3000;
    self._blackboard.var_d1a5a1cdaab45c09 = 5000;
    self._blackboard.var_4a850e88a81da5f9 = 7;
    self.var_306ac6ff52911f55 = &function_703e9acc55d0902b;
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138
// Size: 0x2f
function function_3f11738e6c8250e1(target_ent, arm_used) {
    self.var_a48c549d4a877cd6 = arm_used;
    self.var_c24f43a7d0d8d195 = target_ent;
    function_306feec3952fc2ef();
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x17
function function_550c2a40a7f8e322() {
    return istrue(self._blackboard.var_6b0939cf3fd5d7a1);
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18d
// Size: 0x5f
function private function_abafe9cd03c2c0ab() {
    self endon("death");
    while (true) {
        self waittill("unreachable_attack_start");
        /#
            assertex(istrue(self._blackboard.var_285a93cddadff26a), "Arms Used is not set to true within zombieaisettings");
        #/
        function_3f11738e6c8250e1(self.enemy, self._blackboard.var_37325e73c2b39c28);
    }
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x5a
function function_703e9acc55d0902b(idamage, eattacker, objweapon) {
    if (isdefined(eattacker.var_b285453af8b7df75) && isdefined(eattacker.grenadeweapon) && objweapon == eattacker.grenadeweapon) {
        idamage = eattacker.var_b285453af8b7df75;
    }
    return idamage;
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x31
function function_a9bcc765070d0b08() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_f104d7887d46f98e, 1);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x28d
// Size: 0xc2
function private function_f104d7887d46f98e() {
    /#
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        closest_zombie = scripts/engine/utility::get_array_of_closest(level.players[0].origin, zombies)[0];
        while (true) {
            if (!isdefined(closest_zombie) || !isalive(closest_zombie)) {
                return;
            }
            target = closest_zombie.enemy;
            if (!closest_zombie function_550c2a40a7f8e322()) {
                closest_zombie._blackboard.var_6b0939cf3fd5d7a1 = 1;
                closest_zombie._blackboard.var_d15d23565f5a60a1 = randomint(2) == 0;
                closest_zombie notify("<unknown string>");
            }
            waitframe();
        }
    #/
}

