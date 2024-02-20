// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;

#namespace namespace_cc0f9da8a00806f6;

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3
// Size: 0x17a
function init() {
    level._effect["melee_spray"] = loadfx("vfx/core/screen/vfx_melee_blood_spray");
    level.enableshellshockfunc = &enableshellshockfunc;
    level.disableshellshockfunc = &disableshellshockfunc;
    level.shockpriorities = [];
    level.shockpriorities["top"] = 0;
    level.shockpriorities["flash"] = 1;
    level.shockpriorities["stun"] = 2;
    level.shockpriorities["gas"] = 3;
    level.shockpriorities["poison"] = 4;
    level.shockpriorities["explosion"] = 5;
    level.shockpriorities["damage"] = 6;
    level.shockpriorities["bottom"] = 7;
    level.shockinterruptdelayfuncs["top"] = &shellshock_interruptdelayfunc;
    level.shockinterruptdelayfuncs["flash"] = &shellshock_flashinterruptdelayfunc;
    level.shockinterruptdelayfuncs["stun"] = &shellshock_stuninterruptdelayfunc;
    level.shockinterruptdelayfuncs["gas"] = &shellshock_gasinterruptdelayfunc;
    level.shockinterruptdelayfuncs["poison"] = &shellshock_gasinterruptdelayfunc;
    level.shockinterruptdelayfuncs["explosion"] = &shellshock_interruptdelayfunc;
    level.shockinterruptdelayfuncs["damage"] = &shellshock_damageinterruptdelayfunc;
    level.shockinterruptdelayfuncs["bottom"] = &shellshock_nointerruptdelayfunc;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x624
// Size: 0x1e7
function _shellshock(name, category, duration, var_58b4cf4257914e62, var_85d98965b00f0093) {
    /#
        assertex(isdefined(level.shockpriorities), "_shellShock called before shellshock_utility::init()");
    #/
    /#
        assertex(array_contains(getarraykeys(level.shockpriorities), category), "_shellShock called with an invalid category.  Valid categories are top, flash, stun, gas, explosion, damage, and bottom.");
    #/
    if (!isdefined(var_85d98965b00f0093)) {
        /#
            assertex(isdefined(level.shockinterruptdelayfuncs[category]), "could not find an interrupt delay func for category: " + category + ".");
        #/
        var_85d98965b00f0093 = [[ level.shockinterruptdelayfuncs[category] ]](name, duration);
        /#
            assertex(isdefined(var_85d98965b00f0093), "Interrupt delay func for name: " + name + " and cagetory: " + category + " returned undefined.");
        #/
    }
    var_e1b45ec24abdbe91 = gettime() + var_85d98965b00f0093;
    if (category != "top") {
        if (!val::get("shellshock")) {
            return 0;
        }
    }
    if (isdefined(self.shockcategory)) {
        var_a88c64ed9e813835 = level.shockpriorities[self.shockcategory];
        var_ece43214e2fd6e1 = level.shockpriorities[category];
        if (var_ece43214e2fd6e1 > var_a88c64ed9e813835) {
            if (gettime() < self.shockinterrupttime) {
                return 0;
            }
        } else if (var_ece43214e2fd6e1 == var_a88c64ed9e813835) {
            if (var_e1b45ec24abdbe91 < self.shockinterrupttime) {
                return 0;
            }
        }
    }
    self.shockname = name;
    self.shockcategory = category;
    self.shockinterrupttime = var_e1b45ec24abdbe91;
    var_5cd5209e58a2b1c8 = 0;
    if (function_f3bb4f4911a1beb2("perk", "hasPerk", "specialty_dauntless")) {
        var_5cd5209e58a2b1c8 = 1;
    }
    if (isdefined(var_58b4cf4257914e62)) {
        self shellshock(name, duration, undefined, var_58b4cf4257914e62, var_5cd5209e58a2b1c8);
    } else {
        self shellshock(name, duration, undefined, undefined, var_5cd5209e58a2b1c8);
    }
    self notify("_shellshock_cleanup");
    thread shellshock_cleanup(duration);
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x812
// Size: 0x41
function shellshock_cleanup(duration) {
    self endon("disconnect");
    self endon("_stopShellShock");
    self endon("_shellshock_cleanup");
    wait(duration);
    self.shockname = undefined;
    self.shockcategory = undefined;
    self.shockinterrupttime = undefined;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85a
// Size: 0x3e
function _stopshellshock(var_fcef8d217a441961) {
    self notify("_stopShellShock");
    if (!istrue(var_fcef8d217a441961)) {
        self stopshellshock();
    }
    self.shockname = undefined;
    self.shockcategory = undefined;
    self.shockinterrupttime = undefined;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89f
// Size: 0x3
function enableshellshockfunc() {
    
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9
// Size: 0x10
function disableshellshockfunc() {
    _stopshellshock(function_287a1854579369f5());
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c0
// Size: 0x19
function shellshock_interruptdelayfunc(name, duration) {
    return 250;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e1
// Size: 0x7b
function shellshock_flashinterruptdelayfunc(name, duration) {
    var_c583d4c408e4580b = undefined;
    switch (name) {
    case #"hash_d072a0adddda0068":
        if (issharedfuncdefined("shellshock", "flashInterruptDelayFunc")) {
            var_c583d4c408e4580b = [[ getsharedfunc("shellshock", "flashInterruptDelayFunc") ]](duration);
        }
        break;
    default:
        /#
            assertmsg("shellshock_flashInterruptDelayFunc called with an invalid name.");
        #/
        break;
    }
    return var_c583d4c408e4580b;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x964
// Size: 0xee
function shellshock_stuninterruptdelayfunc(name, duration) {
    var_c583d4c408e4580b = undefined;
    switch (name) {
    case #"hash_1a5a56a6fdfa6d6b":
    case #"hash_32d1f6b72c93028a":
    case #"hash_34e7a4cd11aed6bc":
    case #"hash_4084fa47c230dc38":
    case #"hash_986a886b26c9ea90":
    case #"hash_ed469a6bfff6b265":
        if (issharedfuncdefined("shellshock", "concussionInterruptDelayFunc")) {
            var_c583d4c408e4580b = [[ getsharedfunc("shellshock", "concussionInterruptDelayFunc") ]](duration);
        }
        break;
    case #"hash_606cb2a6a1a3bd0a":
        if (issharedfuncdefined("thermobaric_grenade", "thermobaric_shellshock_interrupt_delay")) {
            var_c583d4c408e4580b = [[ getsharedfunc("thermobaric_grenade", "thermobaric_shellshock_interrupt_delay") ]](duration);
        }
        break;
    default:
        /#
            assertmsg("shellshock_stunInterruptDelayFunc called with an invalid name.");
        #/
        break;
    }
    return var_c583d4c408e4580b;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5a
// Size: 0x82
function shellshock_gasinterruptdelayfunc(name, duration) {
    var_c583d4c408e4580b = undefined;
    switch (name) {
    case #"hash_7cd59e9057f449d":
    case #"hash_7ef263b8ce60aa24":
        if (issharedfuncdefined("shellshock", "gasInterruptDelayFunc")) {
            var_c583d4c408e4580b = [[ getsharedfunc("shellshock", "gasInterruptDelayFunc") ]](duration);
        }
        break;
    default:
        var_c583d4c408e4580b = shellshock_interruptdelayfunc(duration);
        break;
    }
    return var_c583d4c408e4580b;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae4
// Size: 0x76
function shellshock_damageinterruptdelayfunc(name, duration) {
    var_c583d4c408e4580b = undefined;
    switch (name) {
    case #"hash_6f7dfab682794a56":
        if (issharedfuncdefined("shellshock", "lastStandInterruptDelayFunc")) {
            var_c583d4c408e4580b = [[ getsharedfunc("shellshock", "lastStandInterruptDelayFunc") ]](duration);
        }
        break;
    default:
        var_c583d4c408e4580b = shellshock_interruptdelayfunc(duration);
        break;
    }
    return var_c583d4c408e4580b;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb62
// Size: 0x15
function shellshock_nointerruptdelayfunc(name, duration) {
    return 0;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7f
// Size: 0x71
function bloodmeleeeffect(objweapon) {
    self endon("disconnect");
    if (!isdismembermentenabled()) {
        return;
    }
    scriptablestate = usescriptablemeleeblood(objweapon);
    if (isdefined(scriptablestate)) {
        thread activatemeleeblood(scriptablestate);
    } else {
        var_ab9868b0589a6052 = [0:"death"];
        thread play_fx_with_entity(level._effect["melee_spray"], var_ab9868b0589a6052, 1.5);
    }
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf7
// Size: 0x63
function usescriptablemeleeblood(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.receiver)) {
        return undefined;
    }
    if (function_bb839bb513295f10(objweapon)) {
        return "bloodFXNova";
    }
    if (function_55d5c766b382551e(objweapon)) {
        return "bloodFXDoom";
    }
    if (objweapon.receiver == "iw9_me_sword01") {
        return "bloodFX";
    } else {
        return undefined;
    }
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc61
// Size: 0x5f
function function_bb839bb513295f10(weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    if (!isdefined(weapon.basename) || !isdefined(weapon.variantid)) {
        return 0;
    }
    if (weapon.basename == "iw9_me_sword01_mp" && weapon.variantid == 2) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc8
// Size: 0x4b
function function_55d5c766b382551e(weapon) {
    if (isdefined(weapon) && isdefined(weapon.receiver)) {
        if (weapon.receiver == "rec_pickaxe" && weapon.receivervarindex == 2) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1b
// Size: 0x33
function activatemeleeblood(state) {
    self endon("disconnect");
    self setscriptablepartstate("meleeBlood", state);
    waitframe();
    waitframe();
    self setscriptablepartstate("meleeBlood", "neutral");
}

// Namespace namespace_cc0f9da8a00806f6/namespace_1ce798d596a27341
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd55
// Size: 0x5b
function play_fx_with_entity(fx, var_ab9868b0589a6052, timeout) {
    self endon("disconnect");
    var_22f48fd7df6c56fb = function_1f9d1f30f6845dd(fx, self geteye(), self);
    triggerfx(var_22f48fd7df6c56fb);
    var_22f48fd7df6c56fb function_e531ef189c6c5d1d();
    waittill_any_in_array_or_timeout(var_ab9868b0589a6052, timeout);
    var_22f48fd7df6c56fb delete();
}

