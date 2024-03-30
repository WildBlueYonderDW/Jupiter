// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;

#namespace zombielegs;

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x11f
// Size: 0x19
function autoexec main() {
    level callback::add(#"register_perk", &perk_register);
}

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f
// Size: 0x6c
function perk_register(params) {
    bundle = level.perkbundles["specialty_zombie_legs"];
    if (!isdefined(bundle)) {
        return;
    }
    if (isdefined(params.var_65863a18b3d1ad87)) {
        level [[ params.var_65863a18b3d1ad87 ]]("specialty_zombie_legs", &perk_set, &perk_unset, ["specialty_sprintreload", "specialty_sprintmelee"]);
    }
}

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2
// Size: 0xb
function perk_set() {
    thread function_c6668bb917e966b2();
}

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4
// Size: 0x28
function perk_unset() {
    self lerpfovbypreset("default_2seconds");
    self notify("zombie_legs_unset");
    self.falldamageprotection = 0;
    function_b87b3a7ec17c52ba();
}

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x54
function function_c6668bb917e966b2() {
    self endon("death_or_disconnect");
    self endon("zombie_legs_unset");
    self refreshsprinttime();
    self lerpfovbypreset("zombiedefault");
    self.falldamageprotection = 1;
    function_74ef4a883340b273();
    while (true) {
        if (self issupersprinting()) {
            self refreshsprinttime();
        }
        wait(0.1);
    }
}

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e
// Size: 0x78
function function_74ef4a883340b273() {
    bundle = level.perkbundles["specialty_zombie_legs"];
    speedmod = isdefined(bundle.var_ac707f58a9f3b733) ? bundle.var_ac707f58a9f3b733 : 0.1;
    self.var_7e94104134f2f40b = speedmod;
    if (utility::issharedfuncdefined("player", "updateMoveSpeed")) {
        utility::function_f3bb4f4911a1beb2("player", "updateMoveSpeed");
    }
}

// Namespace zombielegs / namespace_4f5543ba95ffd011
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0x31
function function_b87b3a7ec17c52ba() {
    self.var_7e94104134f2f40b = undefined;
    if (utility::issharedfuncdefined("player", "updateMoveSpeed")) {
        utility::function_f3bb4f4911a1beb2("player", "updateMoveSpeed");
    }
}

