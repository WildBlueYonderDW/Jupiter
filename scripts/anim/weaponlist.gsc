// mwiii decomp prototype
#using scripts\anim\utility_common.gsc;

#namespace weaponlist;

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8
// Size: 0x37
function usingautomaticweapon() {
    return weaponisauto(self.weapon) || weaponisbeam(self.weapon) || weaponburstcount(self.weapon) > 0;
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107
// Size: 0x26
function usingsemiautoweapon() {
    return weaponissemiauto(self.weapon) || weaponburstcount(self.weapon) == 1;
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135
// Size: 0x2a
function autoshootanimrate() {
    if (usingautomaticweapon()) {
        return (0.1 / weaponfiretime(self.weapon));
    } else {
        return 0.5;
    }
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166
// Size: 0x39
function burstshootanimrate() {
    if (usingautomaticweapon()) {
        return (0.1 / weaponfiretime(self.weapon));
    } else if (namespace_7843e1029b5c80e::usingpistol()) {
        return 1;
    } else {
        return 0.2;
    }
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x8
function waitaftershot() {
    return 0.25;
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6
// Size: 0x5f
function shootanimtime(var_ca751625cc66a1f0) {
    if (!usingautomaticweapon() || isdefined(var_ca751625cc66a1f0) && var_ca751625cc66a1f0 == 1) {
        rand = 0.5 + randomfloat(1);
        return (weaponfiretime(self.weapon) * rand);
    } else {
        return weaponfiretime(self.weapon);
    }
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0x98
function refillclip() {
    /#
        assertex(isdefined(self.weapon), "self.weapon is not defined for " + self.model);
    #/
    if (isnullweapon(self.weapon)) {
        self.bulletsinclip = 0;
        return 0;
    }
    if (!isdefined(self.bulletsinclip)) {
        self.bulletsinclip = weaponclipsize(self.weapon);
    } else {
        self.bulletsinclip = weaponclipsize(self.weapon);
    }
    /#
        assertex(isdefined(self.bulletsinclip), "RefillClip failed");
    #/
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb
// Size: 0xb7
function add_weapon(name, type, time, clipsize, anims) {
    /#
        assert(isdefined(name));
    #/
    /#
        assert(isdefined(type));
    #/
    if (!isdefined(time)) {
        time = 3;
    }
    if (!isdefined(clipsize)) {
        time = 1;
    }
    if (!isdefined(anims)) {
        anims = "rifle";
    }
    name = tolower(name);
    anim.aiweapon[name]["type"] = type;
    anim.aiweapon[name]["time"] = time;
    anim.aiweapon[name]["clipsize"] = clipsize;
    anim.aiweapon[name]["anims"] = anims;
}

// Namespace weaponlist/namespace_192c166ad8ed6432
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x379
// Size: 0x28
function addturret(turret) {
    anim.aiweapon[tolower(turret)]["type"] = "turret";
}

