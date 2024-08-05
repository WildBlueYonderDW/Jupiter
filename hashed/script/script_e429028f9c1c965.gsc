#using scripts\engine\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;

#namespace bottle;

// Namespace bottle / namespace_6bf921a46b995f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe
// Size: 0x7b
function precache(offhand) {
    level.g_effect["bottle_break"] = loadfx("vfx/iw9/core/bottle/vfx_bottle_explosion.vfx");
    level.offhands.bottle = spawnstruct();
    level.offhands.bottle.var_9c36b02032770c02 = undefined;
    /#
        setdvarifuninitialized(@"hash_600f7a3322505cf2", 0);
    #/
    registeroffhandfirefunc(offhand, &function_4b06c81b27875a14);
}

// Namespace bottle / namespace_6bf921a46b995f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x181
// Size: 0x164
function function_4b06c81b27875a14(grenade, weapon) {
    stuckto, hitpart, null, hitvelocity, position, hitnormal = grenade waittill("missile_stuck");
    /#
        if (function_402e63d965a03b3c()) {
            sphere(position, 5, (1, 0, 0), 0, 300);
        }
    #/
    grenade delete();
    thread play_sound_in_space("weap_bottle_explo", position);
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
        thread function_a32bb7bb61372225(stuckto, position, hitpart, hitvelocity);
    }
    if (!isplayer(self)) {
        level notify("bottle_impact");
        return;
    }
}

// Namespace bottle / namespace_6bf921a46b995f4d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed
// Size: 0x70
function function_a32bb7bb61372225(ai, position, hitpart, hitvelocity) {
    if (isdefined(ai.var_879faed8e3a3276f)) {
        ai thread [[ ai.var_879faed8e3a3276f ]](position, hitpart, hitvelocity);
    }
    waitframe();
    if (!istrue(ai.disablepain)) {
        ai notify("flashbang", position, 1, 1, level.player, "axis");
    }
}

/#

    // Namespace bottle / namespace_6bf921a46b995f4d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x365
    // Size: 0x14
    function function_402e63d965a03b3c() {
        return getdvarint(@"hash_600f7a3322505cf2");
    }

#/
