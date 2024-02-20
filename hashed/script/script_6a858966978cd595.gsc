// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6a858966978cd595;

#namespace bottle;

// Namespace bottle/namespace_97bfc19addb080f3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d
// Size: 0xcc
function function_cea0fdee711d03ac() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("bottle", "init")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("bottle", "init") ]]();
    }
    level.g_effect["bottle_break"] = loadfx("vfx/iw9/core/bottle/vfx_bottle_explosion.vfx");
    /#
        setdvarifuninitialized(@"hash_600f7a3322505cf2", 0);
    #/
    var_584994fab4a8712b = level.equipment;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("equipment", "equipment_init")) {
        var_584994fab4a8712b = [[ namespace_3c37cb17ade254d::getsharedfunc("equipment", "equipment_init") ]](var_584994fab4a8712b);
    }
    var_584994fab4a8712b.callbacks["equip_bottle"]["onGive"] = &namespace_97bfc19addb080f3::function_946f58c7e13e4fde;
    var_584994fab4a8712b.callbacks["equip_bottle"]["onTake"] = &namespace_97bfc19addb080f3::function_6c5ffe7c9b0c2fdc;
}

// Namespace bottle/namespace_97bfc19addb080f3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x46
function function_946f58c7e13e4fde(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("bottle", "onGive")) {
        self [[ getsharedfunc("bottle", "onGive") ]](equipmentref, var_cbb2b3d05e48bd27, variantid);
    }
}

// Namespace bottle/namespace_97bfc19addb080f3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26d
// Size: 0x3d
function function_6c5ffe7c9b0c2fdc(equipmentref, var_cbb2b3d05e48bd27) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("bottle", "onTake")) {
        self [[ getsharedfunc("bottle", "onTake") ]](equipmentref, var_cbb2b3d05e48bd27);
    }
}

// Namespace bottle/namespace_97bfc19addb080f3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1
// Size: 0x15d
function function_d647f861e60f2d5f(grenade) {
    hitnormal = position = var_aa416133e3cf5bf5 = null = var_41453c3c237f2df = stuckto = grenade waittill("missile_stuck");
    /#
        if (function_402e63d965a03b3c()) {
            sphere(position, 5, (1, 0, 0), 0, 300);
        }
    #/
    grenade delete();
    thread play_sound_in_space("eqp_bottle_explo", position);
    right = undefined;
    if (is_equal(hitnormal, (0, 0, 1)) || is_equal(hitnormal, (0, 0, -1))) {
        right = (1, 0, 0);
    } else {
        right = vectorcross(hitnormal, (0, 0, 1));
    }
    playfx(level.g_effect["bottle_break"], position, right, hitnormal);
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.15, 0.35, position, 300);
    if (isdefined(stuckto) && isai(stuckto)) {
        thread function_a32bb7bb61372225(stuckto, position, var_41453c3c237f2df, var_aa416133e3cf5bf5);
    }
    if (!isplayer(self)) {
        level notify("bottle_impact");
        return;
    }
}

// Namespace bottle/namespace_97bfc19addb080f3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x415
// Size: 0x71
function function_a32bb7bb61372225(ai, position, var_41453c3c237f2df, var_aa416133e3cf5bf5) {
    if (isdefined(ai.var_879faed8e3a3276f)) {
        ai thread [[ ai.var_879faed8e3a3276f ]](position, var_41453c3c237f2df, var_aa416133e3cf5bf5);
    }
    waitframe();
    if (!istrue(ai.disablepain)) {
        ai notify("flashbang", position);
    }
}

// Namespace bottle/namespace_97bfc19addb080f3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48d
// Size: 0x15
function function_402e63d965a03b3c() {
    /#
        return getdvarint(@"hash_600f7a3322505cf2");
    #/
}

