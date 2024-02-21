// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_486cd540f0260d2a;

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x11f
// Size: 0x19
function autoexec main() {
    level callback::add(#"hash_a8a01ea46bdd14d5", &function_4a702f9483c24663);
}

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f
// Size: 0x6c
function function_4a702f9483c24663(params) {
    bundle = level.var_a1ad2758fcbd2f5e["specialty_zombie_legs"];
    if (!isdefined(bundle)) {
        return;
    }
    if (isdefined(params.var_65863a18b3d1ad87)) {
        level [[ params.var_65863a18b3d1ad87 ]]("specialty_zombie_legs", &function_3c74efe69198fbba, &function_6150aca67b81215f, [0:"specialty_sprintreload", 1:"specialty_sprintmelee"]);
    }
}

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2
// Size: 0xb
function function_3c74efe69198fbba() {
    thread function_c6668bb917e966b2();
}

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4
// Size: 0x28
function function_6150aca67b81215f() {
    self lerpfovbypreset("default_2seconds");
    self notify("zombie_legs_unset");
    self.var_2cd6a0d57bdd5b1a = 0;
    function_b87b3a7ec17c52ba();
}

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x54
function function_c6668bb917e966b2() {
    self endon("death_or_disconnect");
    self endon("zombie_legs_unset");
    self refreshsprinttime();
    self lerpfovbypreset("zombiedefault");
    self.var_2cd6a0d57bdd5b1a = 1;
    function_74ef4a883340b273();
    while (1) {
        if (self issupersprinting()) {
            self refreshsprinttime();
        }
        wait(0.1);
    }
}

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e
// Size: 0x78
function function_74ef4a883340b273() {
    bundle = level.var_a1ad2758fcbd2f5e["specialty_zombie_legs"];
    speedmod = isdefined(bundle.var_ac707f58a9f3b733) ? bundle.var_ac707f58a9f3b733 : 0.1;
    self.var_7e94104134f2f40b = speedmod;
    if (utility::issharedfuncdefined("player", "updateMoveSpeed")) {
        utility::function_f3bb4f4911a1beb2("player", "updateMoveSpeed");
    }
}

// Namespace namespace_486cd540f0260d2a/namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0x31
function function_b87b3a7ec17c52ba() {
    self.var_7e94104134f2f40b = undefined;
    if (utility::issharedfuncdefined("player", "updateMoveSpeed")) {
        utility::function_f3bb4f4911a1beb2("player", "updateMoveSpeed");
    }
}

