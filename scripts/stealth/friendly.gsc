// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\manager.gsc;
#using scripts\stealth\utility.gsc;

#namespace friendly;

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0x57
function main() {
    if (!isdefined(level.stealth)) {
        namespace_833595e973766257::main();
    }
    init_settings();
    self.var_d7f4a1b60f84e53f = self.script_stealthgroup;
    thread spotted_thread();
    thread visibility_thread();
    self function_95d5375059c2a022("mp_stealth");
    /#
        thread function_3c165dbd67e4c5aa();
    #/
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0x80
function init_settings() {
    /#
        assertex(!isdefined(self.stealth), "Friendly is already initialized for stealth");
    #/
    self.stealth = spawnstruct();
    self.stealth.funcs = [];
    ent_flag_init("stealth_enabled");
    ent_flag_set("stealth_enabled");
    ent_flag_init("stealth_in_shadow");
    namespace_e124d8b75dab4be0::group_flag_init("stealth_spotted");
    namespace_e124d8b75dab4be0::group_add();
    self.var_fe5ebefa740c7106 = 0;
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220
// Size: 0x95
function spotted_thread() {
    self endon("death");
    self notify("spotted_thread");
    self endon("spotted_thread");
    while (1) {
        ent_flag_wait("stealth_enabled");
        namespace_e124d8b75dab4be0::group_flag_waitopen("stealth_spotted");
        if (!ent_flag("stealth_enabled")) {
            ent_flag_wait("stealth_enabled");
        }
        thread state_hidden();
        ent_flag_wait("stealth_enabled");
        namespace_e124d8b75dab4be0::group_flag_wait("stealth_spotted");
        if (!ent_flag("stealth_enabled")) {
            ent_flag_wait("stealth_enabled");
        }
        thread state_spotted();
    }
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc
// Size: 0x7c
function state_hidden() {
    thread namespace_e124d8b75dab4be0::setbattlechatter(0);
    self.stealth.oldgrenadeammo = self.grenadeammo;
    self.grenadeammo = 0;
    self.forcesidearm = 0;
    self.dontevershoot = 1;
    self.dontattackme = 1;
    if (isdefined(self.stealth.funcs["hidden"])) {
        stealth_call_thread("hidden");
    }
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f
// Size: 0xa3
function state_spotted() {
    /#
        assert(!isplayer(self));
    #/
    thread namespace_e124d8b75dab4be0::setbattlechatter(1);
    if (isdefined(self.stealth.oldgrenadeammo)) {
        self.grenadeammo = self.stealth.oldgrenadeammo;
    } else {
        self.grenadeammo = 3;
    }
    self.dontevershoot = 0;
    self.dontattackme = 0;
    self pushplayer(0);
    if (isdefined(self.stealth.funcs["spotted"])) {
        stealth_call_thread("spotted");
    }
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0xa
function getup_from_prone() {
    self endon("death");
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fa
// Size: 0x51
function visibility_thread() {
    self endon("death");
    self endon("long_death");
    while (1) {
        ent_flag_wait("stealth_enabled");
        if (!isdefined(self.stealth.ignore_visibility)) {
            self.maxvisibledist = get_detect_range();
        }
        wait(0.05);
    }
}

// Namespace friendly/namespace_d611598f63dea5a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x452
// Size: 0x89
function get_detect_range() {
    stance = self.currentpose;
    if (stance == "back") {
        stance = "prone";
    }
    if (namespace_e124d8b75dab4be0::group_spotted_flag()) {
        detection = "spotted";
    } else {
        detection = "hidden";
    }
    range = function_10cf685da2bffeda(detection, stance);
    if (ent_flag("stealth_in_shadow")) {
        range = max(function_10cf685da2bffeda("hidden", "prone"), range * 0.5);
    }
    return range;
}

