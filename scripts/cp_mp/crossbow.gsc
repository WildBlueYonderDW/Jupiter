// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\common\ai.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;

#namespace crossbow;

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x774
// Size: 0xe2
function initcrossbowusage(weapon) {
    if (!isdefined(level.crossbowbolts)) {
        level.crossbowbolts = [];
    }
    if (!isdefined(self.crossbow)) {
        self.crossbow = spawnstruct();
        self.crossbow.boltnumber = 0;
        self.crossbow.boltsinflight = [];
    }
    self.crossbow.active = 1;
    if (!isdefined(weapon::function_23defc57f8da7fbc("thermite_bolt_mp"))) {
        weapon::function_eac07882d12979d8("iw9_dm_crossbow", "thermite_bolt_mp");
        weapon::function_eac07882d12979d8("iw9_dm_crossbow", "thermite_bolt_radius_mp");
        weapon::function_eac07882d12979d8("iw9_dm_crossbow", "semtex_bolt_mp");
        weapon::function_eac07882d12979d8("iw9_dm_crossbow", "semtex_bolt_splash_mp");
        weapon::function_eac07882d12979d8("iw9_dm_crossbow", "molotov_bolt_mp");
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85d
// Size: 0x3d
function crossbowusageloop(weapon) {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    ammotype = getcrossbowammotype(weapon);
    thread crossbowimpactwatcher(weapon, ammotype);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a1
// Size: 0x1d
function cleanupafterweaponswitch() {
    self waittill("end_launcher");
    function_c0ab8a070e986732();
    wait(6);
    self notify("cleanupImpactWatcher");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c5
// Size: 0x4f
function crossbowimpactwatcher(var_551411054e80b44b, ammotype) {
    self notify("cleanupImpactWatcher");
    self endon("disconnect");
    self endon("cleanupImpactWatcher");
    childthread cleanupafterweaponswitch();
    childthread watchforimpact(var_551411054e80b44b, ammotype);
    childthread function_5d09c8fae400afb2(var_551411054e80b44b);
    childthread function_f16d37d0028d5de3(var_551411054e80b44b, ammotype);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91b
// Size: 0xcf
function watchforimpact(var_551411054e80b44b, ammotype) {
    var_74231e1029ef65b5 = getcrossbowimpactfunc(ammotype);
    while (1) {
        hitloc = impactpos = var_f07322c0d6ca069c = weapon = surfacetype = surfacenormal = var_b3fcd958f4d7876e = hitent = var_9d7ca6252f103a3b = self waittill("bullet_first_impact");
        if (var_551411054e80b44b != weapon) {
            continue;
        }
        bolt = spawncrossbowbolt(impactpos, var_f07322c0d6ca069c, ammotype, weapon);
        handleimpact(bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype, weapon, var_f07322c0d6ca069c, impactpos, var_74231e1029ef65b5);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f1
// Size: 0x7f
function function_f16d37d0028d5de3(var_551411054e80b44b, ammotype) {
    var_a0dfb992760d09e3 = function_f7e93e7794bb696d(ammotype);
    while (1) {
        var_3accf23ebcb854d9 = var_f07322c0d6ca069c = weapon = self waittill("bullet_terminated");
        if (var_551411054e80b44b != weapon) {
            continue;
        }
        bolt = spawncrossbowbolt(var_3accf23ebcb854d9, var_f07322c0d6ca069c, ammotype, weapon);
        function_5c14133d6577bef(bolt, var_a0dfb992760d09e3);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0xcf
function handleimpact(bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype, weapon, var_f07322c0d6ca069c, impactpos, var_74231e1029ef65b5) {
    if (shouldreflect(surfacetype, bolt, hitent, var_b3fcd958f4d7876e, weapon)) {
        reflectbolt(bolt, surfacenormal, var_f07322c0d6ca069c, impactpos);
    } else if (shoulddeleteimmediately(hitent)) {
        bolt delete();
        return;
    } else if (function_25f0d68ee22434eb(hitent, hitloc)) {
        function_29379c15699c9d7b(bolt);
    } else if (shouldlink(hitent)) {
        function_5478d81cf5ea8d4(bolt, hitent, var_b3fcd958f4d7876e);
    }
    if (isdefined(var_74231e1029ef65b5)) {
        [[ var_74231e1029ef65b5 ]](bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4d
// Size: 0x1e
function function_5c14133d6577bef(bolt, var_a0dfb992760d09e3) {
    if (isdefined(var_a0dfb992760d09e3)) {
        [[ var_a0dfb992760d09e3 ]](bolt);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb72
// Size: 0x11c
function impactfunc_explo(bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype) {
    bolt setscriptablepartstate("effects", "impact");
    if (isdefined(hitent) && (isplayer(hitent) || isagent(hitent))) {
        fusetime = 1.1;
    } else {
        fusetime = 2;
    }
    bolt.grenade = magicgrenademanual("semtex_bolt_mp", bolt.origin, (0, 0, 0), fusetime);
    bolt.grenade.angles = bolt.angles;
    bolt.grenade linkto(bolt, "tag_origin");
    if (isdefined(hitent) && isagent(hitent) && !istrue(hitent.var_274d3a7704e351ef)) {
        function_60daa23100a2b874(bolt.grenade, hitent);
    }
    thread exploboltexplode(bolt, fusetime, surfacenormal);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc95
// Size: 0x40
function impactfunc_fire(bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype) {
    thread function_9bda31fd01a8cb74(bolt, hitent, var_b3fcd958f4d7876e, hitloc);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdc
// Size: 0x6b
function impactfunc_stun(bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype) {
    if (!stunshoulddetonate(hitent, surfacetype)) {
        thread function_8fd268f7be208047(bolt);
    } else if (function_9d1cdbd50d208b78(bolt)) {
        thread function_397bf021cc9037f8(bolt);
    } else {
        thread function_2a6ac0fc60af6c16(bolt, surfacenormal);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4e
// Size: 0x40
function function_b086ad2ca32b8b08(bolt, hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype) {
    thread function_704dd2c09ad39716(bolt, hitent, var_b3fcd958f4d7876e, hitloc);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd95
// Size: 0xc
function function_a73c5b03989d6eda(bolt) {
    
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda8
// Size: 0xc
function function_1cc12bdc257818cc(bolt) {
    
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdbb
// Size: 0xc
function function_3088a41a2ae98710(bolt) {
    
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdce
// Size: 0x168
function exploboltexplode(bolt, fusetime, surfacenormal) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    bolt.grenade waittill_any_timeout_no_endon_death_1(fusetime, "explode");
    bolt function_acd8433c3043c4f2(surfacenormal);
    bolt setscriptablepartstate("effects", "explode");
    var_f6f7da32d9dcdd7f = makeweapon("semtex_bolt_mp");
    var_fc2162402fee9cea = makeweapon("semtex_bolt_splash_mp");
    function_49967318fbd12317(var_f6f7da32d9dcdd7f, bolt.weapon);
    function_49967318fbd12317(var_fc2162402fee9cea, bolt.weapon);
    if (isdefined(bolt.stuckenemyentity) && isalive(bolt.stuckenemyentity)) {
        bolt.stuckenemyentity namespace_169cd7a8fbc76ee5::forcestuckdamage();
        bolt.stuckenemyentity dodamage(110, bolt.origin, self, undefined, "MOD_EXPLOSIVE", var_f6f7da32d9dcdd7f, "none");
        bolt.stuckenemyentity namespace_169cd7a8fbc76ee5::forcestuckdamageclear();
        bolt.stuckenemyentity thread function_a8a4ce8f3b02b96(self);
    }
    radiusdamage(bolt.origin, 160, 110, 35, self, "MOD_EXPLOSIVE", var_fc2162402fee9cea);
    wait(0.4);
    if (!bolt validateboltent()) {
        return;
    }
    bolt delete();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3d
// Size: 0x5a
function function_a8a4ce8f3b02b96(inflictor) {
    self endon("disconnect");
    self notify("crossbow_semtex_blockDamage");
    self endon("crossbow_semtex_blockDamage");
    if (!isdefined(self.var_ea445bb2097eaa16)) {
        self.var_ea445bb2097eaa16 = [];
    }
    self.var_ea445bb2097eaa16[self.var_ea445bb2097eaa16.size] = inflictor;
    waittillframeend();
    self.var_ea445bb2097eaa16 = undefined;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e
// Size: 0x68
function function_9bda31fd01a8cb74(bolt, hitent, var_b3fcd958f4d7876e, hitloc) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    wait(0.18);
    bolt setscriptablepartstate("effects", "impact");
    thread thermiteboltstuckto(bolt, hitent, var_b3fcd958f4d7876e, hitloc);
    thread thermiteboltradiusdamage(bolt, hitent);
    thread thermiteboltburnout(bolt);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100d
// Size: 0x16c
function thermiteboltstuckto(bolt, hitent, var_b3fcd958f4d7876e, hitloc) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    var_f6f7da32d9dcdd7f = makeweapon("thermite_bolt_mp");
    function_49967318fbd12317(var_f6f7da32d9dcdd7f, bolt.weapon);
    if ((isplayer(hitent) || isbot(hitent)) && isdefined(hitloc) && hitloc == "shield") {
        hitloc = "torso_upper";
        bolt thread function_28832848cd860d4e(hitent);
    }
    if (isdefined(bolt.stuckenemyentity) && isalive(bolt.stuckenemyentity)) {
        if (isdefined(hitent.vehiclename) || isdefined(hitent.classname) && hitent.classname == "misc_turret") {
            damage_interval = 1;
        } else {
            damage_interval = 0.25;
        }
        ticks = int(4.5 / damage_interval);
        while (isdefined(hitent) && isdefined(bolt) && isalive(hitent) && ticks > 0) {
            hitent namespace_169cd7a8fbc76ee5::forcestuckdamage();
            hitent dodamage(5, bolt.origin, self, bolt, "MOD_FIRE", var_f6f7da32d9dcdd7f, hitloc);
            hitent namespace_169cd7a8fbc76ee5::forcestuckdamageclear();
            ticks--;
            wait(damage_interval);
        }
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1180
// Size: 0x33
function function_28832848cd860d4e(hitent) {
    hitent endon("disconnect");
    self endon("entitydeleted");
    hitent waittill("death");
    if (!validateboltent()) {
        return;
    }
    boltunlink();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ba
// Size: 0x14f
function thermiteboltradiusdamage(bolt, hitent) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    ticks = int(18);
    var_fa52c6d10ef1f00f = makeweapon("thermite_bolt_radius_mp");
    function_49967318fbd12317(var_fa52c6d10ef1f00f, bolt.weapon);
    bolt.thermiteradiusweaponref = var_fa52c6d10ef1f00f.basename;
    if (!isdefined(bolt.stuckenemyentity)) {
        bolt.badplace = function_49206079981e8dd9(bolt.origin);
    }
    while (ticks > 0) {
        if (isdefined(bolt.stuckenemyentity) && isalive(bolt.stuckenemyentity)) {
            bolt.stuckenemyentity namespace_169cd7a8fbc76ee5::adddamagemodifier("thermiteBoltStuck", 0, 0, &thermite_damagemodifierignorefunc);
        }
        bolt radiusdamage(bolt.origin, 50, 5, 3, self, "MOD_FIRE", var_fa52c6d10ef1f00f);
        if (isdefined(bolt.stuckenemyentity) && isalive(bolt.stuckenemyentity)) {
            bolt.stuckenemyentity namespace_169cd7a8fbc76ee5::removedamagemodifier("thermiteBoltStuck", 0);
        }
        ticks--;
        wait(0.25);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1310
// Size: 0x38
function function_49206079981e8dd9(var_96586eec2364c35b) {
    badplace = createnavbadplacebybounds(var_96586eec2364c35b, (50, 50, 50), (0, 0, 0));
    return badplace;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1350
// Size: 0x92
function thermite_damagemodifierignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    if (!isdefined(inflictor)) {
        return 1;
    }
    if (!isdefined(inflictor.thermiteradiusweaponref) || inflictor.thermiteradiusweaponref != "thermite_bolt_radius_mp") {
        return 1;
    }
    if (!isdefined(inflictor.stuckenemyentity) || inflictor.stuckenemyentity != victim) {
        return 1;
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ea
// Size: 0x79
function thermiteboltburnout(bolt) {
    bolt endon("entitydeleted");
    wait(4.5);
    if (!bolt validateboltent()) {
        return;
    }
    bolt setscriptablepartstate("effects", "burnEnd");
    wait(randomfloatrange(0.3, 2));
    if (isdefined(bolt.badplace)) {
        destroynavobstacle(bolt.badplace);
    }
    bolt boltunlink();
    bolt setmodel("weapon_wm_sn_crossbow_bolt_fire_static_dst");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146a
// Size: 0xd3
function function_2a6ac0fc60af6c16(bolt, surfacenormal) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    wait(0.16);
    bolt function_acd8433c3043c4f2(surfacenormal);
    bolt setscriptablepartstate("impact", "active");
    if (issharedfuncdefined("weapons", "gas_createTrigger")) {
        var_dc90dedcb800b720 = 0;
        if (isdefined(bolt.weapon) && issharedfuncdefined("zombie", "get_pap_level")) {
            var_dc90dedcb800b720 = function_af5127390d3221e9(bolt.weapon);
        }
        thread [[ getsharedfunc("weapons", "gas_createTrigger") ]](bolt.origin, self, self.team, 5, 0.45, 1, var_dc90dedcb800b720);
    }
    thread stunboltdelete(bolt);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1544
// Size: 0x31
function function_8fd268f7be208047(bolt) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    wait(0.1);
    bolt setscriptablepartstate("impact", "dud");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157c
// Size: 0x31
function function_397bf021cc9037f8(bolt) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    wait(0.1);
    bolt setscriptablepartstate("impact", "dudUnderwater");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b4
// Size: 0x2b
function stunboltdelete(bolt) {
    bolt endon("entitydeleted");
    wait(0.5);
    if (!bolt validateboltent()) {
        return;
    }
    bolt delete();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e6
// Size: 0xd9
function function_704dd2c09ad39716(bolt, hitent, var_b3fcd958f4d7876e, hitloc) {
    self endon("disconnect");
    bolt endon("entitydeleted");
    var_6951cf1f43bc8ebe = self getgunangles();
    var_8011cffb839e8243 = gettime();
    launchvelocity = anglestoforward(var_6951cf1f43bc8ebe) * 940 + anglestoup(var_6951cf1f43bc8ebe) * 120;
    traveltime = (gettime() - var_8011cffb839e8243) / 1000;
    var_ceab23e7a7e95404 = launchvelocity + (0, 0, -800 * traveltime);
    if (isdefined(hitent) && (isplayer(hitent) || isagent(hitent))) {
        thread function_8add0b9e806fa2fb(bolt, hitent, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    } else {
        thread function_a61b7128bcea5142(bolt, hitent, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c6
// Size: 0x1cb
function function_8add0b9e806fa2fb(bolt, hitent, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    if (issharedfuncdefined("molotov", "molotov_burn_for_time")) {
        hitent thread [[ getsharedfunc("molotov", "molotov_burn_for_time") ]](6, self, bolt, bolt);
    }
    var_ceab23e7a7e95404 = var_ceab23e7a7e95404 * (0, 0, 1);
    caststart = bolt.origin;
    castdir = (0, 0, -1);
    castend = caststart + castdir * 128;
    contents = function_f3bb4f4911a1beb2("molotov", "molotov_get_cast_contents");
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, bolt, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        castend = var_e021c2744cc7ed68[0]["position"];
        var_a95d04f8f906e839 = var_e021c2744cc7ed68[0]["normal"];
        var_8d3dd4e0ca9bb1c0 = var_e021c2744cc7ed68[0]["entity"];
        castend = castend - var_a95d04f8f906e839 * 1;
        d = vectordot(castend - caststart, castdir);
        t = sqrt(2 * d / -1 * -800);
        up = var_a95d04f8f906e839;
        right = anglestoright(var_6951cf1f43bc8ebe);
        var_4b65413211af7033 = function_f3bb4f4911a1beb2("molotov", "molotov_rebuild_angles_up_right", up, right);
        function_8b65648a30994e16(bolt, castend, var_4b65413211af7033, var_8d3dd4e0ca9bb1c0, var_ceab23e7a7e95404, gettime() + t * 1000);
        return;
    }
    bolt notify("death");
    level thread function_8d43b846ff1837f1(bolt);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1898
// Size: 0xca
function function_a61b7128bcea5142(bolt, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    angles = undefined;
    forward = vectornormalize(var_ceab23e7a7e95404);
    up = anglestoup(bolt.angles);
    right = anglestoright(var_6951cf1f43bc8ebe);
    if (abs(vectordot(forward, up)) >= 0.9848) {
        angles = function_f3bb4f4911a1beb2("molotov", "molotov_rebuild_angles_up_right", up, right);
    } else {
        angles = function_f3bb4f4911a1beb2("molotov", "molotov_rebuild_angles_up_forward", up, forward);
    }
    function_8b65648a30994e16(bolt, bolt.origin, angles, stuckto, var_ceab23e7a7e95404, gettime());
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1969
// Size: 0x5d
function function_8b65648a30994e16(bolt, castend, var_4b65413211af7033, var_8d3dd4e0ca9bb1c0, var_ceab23e7a7e95404, impacttime) {
    bolt setscriptablepartstate("effects", "explode", 0);
    function_f3bb4f4911a1beb2("molotov", "molotov_simulate_impact", bolt, castend, var_4b65413211af7033, var_8d3dd4e0ca9bb1c0, var_ceab23e7a7e95404, impacttime);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19cd
// Size: 0x2b
function function_8d43b846ff1837f1(bolt) {
    bolt endon("entitydeleted");
    wait(0.5);
    if (!bolt validateboltent()) {
        return;
    }
    bolt delete();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ff
// Size: 0x84
function stunshoulddetonate(hitent, surfacetype) {
    if (!isdefined(hitent)) {
        return 0;
    }
    if (isdefined(hitent.targetname) && hitent.targetname == "enemyTarget") {
        return 1;
    }
    if (!isplayer(hitent) && !isagent(hitent)) {
        return 0;
    }
    if (issameteamplayer(hitent)) {
        return 0;
    }
    if (issameteamagent(hitent)) {
        return 0;
    }
    if (isdefined(surfacetype) && surfacetype == "riotshield") {
        return 0;
    }
    return 1;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8b
// Size: 0x32
function function_9d1cdbd50d208b78(bolt) {
    if (function_6c71c72547bb931(bolt.origin + (0, 0, 10))) {
        return 1;
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac5
// Size: 0x113
function spawncrossbowbolt(impactpos, var_f07322c0d6ca069c, ammotype, weapon) {
    model = getboltmodel(ammotype);
    if (!isdefined(level.mapname)) {
        level.mapname = getdvar(@"hash_687fb8f9b7a23245");
    }
    if (issubstr(level.mapname, "frontend")) {
        model = model + "_fe";
    }
    bolt = spawn("script_model", impactpos);
    bolt setmodel(model);
    bolt notsolid();
    bolt.angles = vectortoangles(var_f07322c0d6ca069c);
    bolt setdeleteable(ammotype);
    bolt.owner = self;
    bolt.ammotype = ammotype;
    bolt.weapon = weapon;
    bolt.iscrossbowbolt = 1;
    if (shouldpickup(ammotype)) {
        bolt = makepickup(bolt);
    }
    bolt thread boltdeletethread();
    manageworldspawnedbolts(bolt);
    return bolt;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be0
// Size: 0x30
function shouldpickup(ammotype) {
    if (ammotype == "bolt_default" || ammotype == "bolt_stun" || ammotype == "bolt_stun_vday") {
        return 1;
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c18
// Size: 0xd5
function makepickup(bolt) {
    var_c0ee4d060004600b = bolt.origin + anglestoforward(bolt.angles) * 15;
    var_a712eb05ee38eab9 = axistoangles(anglestoup(bolt.angles), anglestoright(bolt.angles), anglestoforward(bolt.angles));
    trigger = spawn("trigger_rotatable_radius", var_c0ee4d060004600b, 0, 64, 79);
    trigger.angles = var_a712eb05ee38eab9;
    trigger.targetname = "bolt_pickup";
    trigger enablelinkto();
    trigger linkto(bolt);
    bolt.pickuptrigger = trigger;
    bolt thread bolt_watchpickup();
    return bolt;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf5
// Size: 0x34
function removepickup(bolt) {
    bolt notify("removePickup");
    if (isdefined(bolt.pickuptrigger)) {
        bolt.pickuptrigger delete();
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d30
// Size: 0xba
function bolt_watchpickup() {
    self endon("entitydeleted");
    self endon("removePickup");
    wait(2);
    while (1) {
        player = self.pickuptrigger waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (isdefined(self.stuckenemyentity) && isalive(self.stuckenemyentity) && !isdefined(self.stuckenemyentity.vehiclename)) {
            continue;
        }
        var_6fba2b63d1fb95e1 = get_weapon_ammo_matched(player getweaponslistprimaries());
        if (!isdefined(var_6fba2b63d1fb95e1)) {
            continue;
        }
        if (player bolt_trytopickup(var_6fba2b63d1fb95e1)) {
            self delete();
        }
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df1
// Size: 0xfb
function get_weapon_ammo_matched(weapons) {
    foreach (weapon in weapons) {
        if (isdefined(weapon.basename) && weapon.basename == "iw9_dm_crossbow_mp") {
            if (isdefined(weapon.modifier) && weapon.modifier == "ammo_bolt_std" && self.ammotype == "bolt_default") {
                return weapon;
            }
            if (isdefined(weapon.modifier) && weapon.modifier == "ammo_bolt_gas" && (self.ammotype == "bolt_stun" || self.ammotype == "bolt_stun_vday")) {
                return weapon;
            }
        }
    }
    return undefined;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef4
// Size: 0x88
function bolt_trytopickup(weapon) {
    maxammo = weaponmaxammo(weapon);
    var_ea34e536b58878dd = self getweaponammostock(weapon);
    if (var_ea34e536b58878dd >= maxammo) {
        return 0;
    }
    var_402cbd10005539a1 = int(min(maxammo, var_ea34e536b58878dd + 1));
    self setweaponammostock(weapon, var_402cbd10005539a1);
    if (issharedfuncdefined("damage", "hudIconType")) {
        self [[ getsharedfunc("damage", "hudIconType") ]]("crossbowbolt");
    }
    return 1;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f84
// Size: 0x9a
function setdeleteable(ammotype) {
    switch (ammotype) {
    case #"hash_5565a4776393e4b7":
        thread setdeleteabletimer(5);
        self.deleteable = 0;
        break;
    case #"hash_546f43dd604e633f":
        self.deleteable = 0;
        break;
    case #"hash_3f2013439426f0b8":
    case #"hash_f2adc5f71cba34f7":
        thread setdeleteabletimer(0.5);
        self.deleteable = 0;
        break;
    default:
        self.deleteable = 1;
        break;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2025
// Size: 0x27
function setdeleteabletimer(time) {
    self endon("entitydeleted");
    wait(time);
    self.deleteable = 1;
    manageworldspawnedbolts();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2053
// Size: 0xb3
function manageworldspawnedbolts(var_44c316327321c5fe) {
    if (isdefined(var_44c316327321c5fe)) {
        var_5c397c9cf7a06802 = [0:var_44c316327321c5fe];
    } else {
        var_5c397c9cf7a06802 = [];
    }
    foreach (bolt in level.crossbowbolts) {
        if (!isdefined(bolt)) {
            continue;
        }
        if (isdefined(bolt)) {
            if (var_5c397c9cf7a06802.size >= 24 && bolt.deleteable) {
                bolt delete();
            } else {
                var_5c397c9cf7a06802[var_5c397c9cf7a06802.size] = bolt;
            }
        }
    }
    level.crossbowbolts = var_5c397c9cf7a06802;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210d
// Size: 0x93
function getcrossbowammotype(weapon) {
    switch (weapon.modifier) {
    case #"hash_1384dc17fea40a53":
        return "bolt_explo";
    case #"hash_135ed917fe85f086":
        return "bolt_fire";
    case #"hash_19baf8c5b7e79ee1":
        if (weapon.modifiervarindex == 1) {
            return "bolt_stun_vday";
            goto LOC_00000046;
        }
        return "bolt_stun";
    case #"hash_464357c5cf40c360":
    LOC_00000046:
        return "bolt_molotov";
    default:
        return "bolt_default";
        break;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a7
// Size: 0x76
function getcrossbowimpactfunc(ammotype) {
    switch (ammotype) {
    case #"hash_546f43dd604e633f":
        return &impactfunc_explo;
    case #"hash_5565a4776393e4b7":
        return &impactfunc_fire;
    case #"hash_3f2013439426f0b8":
    case #"hash_f2adc5f71cba34f7":
        return &impactfunc_stun;
    case #"hash_ae030c32020d2f3b":
        return &function_b086ad2ca32b8b08;
    default:
        return;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2224
// Size: 0x6a
function function_f7e93e7794bb696d(ammotype) {
    switch (ammotype) {
    case #"hash_546f43dd604e633f":
        return &impactfunc_explo;
    case #"hash_5565a4776393e4b7":
        return &impactfunc_fire;
    case #"hash_f2adc5f71cba34f7":
        return &impactfunc_stun;
    case #"hash_ae030c32020d2f3b":
        return &function_b086ad2ca32b8b08;
    default:
        return;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2295
// Size: 0x81
function getboltmodel(ammotype) {
    switch (ammotype) {
    case #"hash_546f43dd604e633f":
        return "weapon_wm_sn_crossbow_bolt_explosive_static";
    case #"hash_5565a4776393e4b7":
        return "weapon_wm_sn_crossbow_bolt_fire_static";
    case #"hash_f2adc5f71cba34f7":
        return "weapon_wm_sn_crossbow_bolt_stun_static";
    case #"hash_3f2013439426f0b8":
        return "weapon_wm_sn_crossbow_bolt_stun_vday_static";
    case #"hash_ae030c32020d2f3b":
        return "weapon_wm_sn_crossbow_bolt_molotov_static";
    default:
        return "weapon_wm_sn_crossbow_bolt_static";
        break;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231d
// Size: 0x1fe
function shouldreflect(surfacetype, bolt, hitent, var_b3fcd958f4d7876e, weapon) {
    if (!isdefined(hitent) && isdefined(var_b3fcd958f4d7876e) && var_b3fcd958f4d7876e == function_3db00f01cdba4538("tag_origin")) {
        return 1;
    }
    if (isdefined(hitent) && istrue(hitent.var_9d4f1024957fde36)) {
        return 1;
    }
    if (isdefined(hitent) && isdefined(hitent.code_classname) && hitent.code_classname == "scriptable") {
        return 1;
    }
    if (issameteamplayer(hitent)) {
        return 1;
    }
    if (issameteamagent(hitent)) {
        return 1;
    }
    if (!isdefined(surfacetype)) {
        return 0;
    }
    switch (surfacetype) {
    case #"hash_886109ae17c9aa73":
    case #"hash_8c9d4c67dcde81f2":
        return 1;
        break;
    }
    if (function_1cef76b86c23032b(hitent, var_b3fcd958f4d7876e)) {
        return 1;
    }
    if (bolt.ammotype == "bolt_explo") {
        return 0;
    }
    if (issameteamplayer(hitent)) {
        return 1;
    }
    if (issameteamagent(hitent)) {
        return 1;
    }
    if (getcrossbowammotype(weapon) == "bolt_stun_vday" && (isplayer(hitent) || isagent(hitent)) && !isalive(hitent)) {
        return 1;
    }
    switch (surfacetype) {
    case #"hash_dacf073cf66fde4":
    case #"hash_67e845c97d1f9eda":
    case #"hash_f9100fc94321f813":
        return 1;
    case #"hash_fb5a4fd62140d3d":
    case #"hash_321a9678047d0a4e":
    case #"hash_519950fd846289c6":
    case #"hash_7fe735e403d9fe08":
    case #"hash_91afe7576024a903":
    case #"hash_b72d9dbb666bc59c":
    case #"hash_d70d4c17673f4162":
    case #"hash_f4d3c7f04f8ef31d":
        if (bolt.ammotype == "bolt_fire") {
            return 0;
            goto LOC_00000167;
        }
        return 1;
    default:
    LOC_00000167:
        return 0;
        break;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2522
// Size: 0x7d
function reflectbolt(bolt, surfacenormal, var_f07322c0d6ca069c, impactpos) {
    vec = math::vector_reflect(var_f07322c0d6ca069c, surfacenormal);
    dot = abs(vectordot(var_f07322c0d6ca069c, surfacenormal));
    var_91f849dfa0f2014c = math::factor_value(2300, 1000, dot);
    vec = vec * var_91f849dfa0f2014c;
    bolt solid();
    bolt physicslaunchserver(impactpos, vec);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a6
// Size: 0x58
function shoulddeleteimmediately(hitent) {
    if (!isdefined(hitent)) {
        return 0;
    }
    if (isdefined(hitent) && istrue(hitent.var_c122daa06de1cc56)) {
        return 1;
    }
    if (isagent(hitent) && hitent is_suicidebomber() && !isalive(hitent) && !isdefined(hitent getcorpseentity())) {
        return 1;
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2606
// Size: 0x96
function function_25f0d68ee22434eb(hitent, hitloc) {
    if (!isdefined(hitent)) {
        return 0;
    }
    if (isdefined(hitent) && istrue(hitent.var_48b4b50848b36508)) {
        return 1;
    }
    if ((isplayer(hitent) || isagent(hitent)) && !isalive(hitent) && !isdefined(hitent getcorpseentity())) {
        return 1;
    }
    if (isagent(hitent) && utility::issharedfuncdefined("ai", "isLimbDismembered")) {
        if (hitent [[ utility::getsharedfunc("ai", "isLimbDismembered") ]](hitloc)) {
            return 1;
        }
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a4
// Size: 0x1a
function function_29379c15699c9d7b(bolt) {
    bolt solid();
    bolt physicslaunchserver();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c5
// Size: 0x25
function shouldlink(hitent, var_b3fcd958f4d7876e, weapon) {
    if (!isdefined(hitent)) {
        return 0;
    }
    return 1;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f2
// Size: 0x21
function is_suicidebomber() {
    return istrue(isdefined(self.unittype) && self.unittype == "suicidebomber");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x271b
// Size: 0x169
function function_5478d81cf5ea8d4(bolt, hitent, var_b3fcd958f4d7876e) {
    if ((isplayer(hitent) || isagent(hitent)) && !isalive(hitent)) {
        corpse = hitent getcorpseentity();
        if (isdefined(corpse)) {
            hitent = corpse;
        }
    }
    if (isplayer(hitent) && bolt.ammotype != "bolt_stun") {
        bolt hidefromplayer(hitent);
        if (isdefined(bolt.pickuptrigger)) {
            bolt.pickuptrigger hidefromplayer(hitent);
        }
        if (bolt.ammotype == "bolt_fire") {
            hitent thread function_163ded397285c41e();
        }
    }
    if (isdefined(var_b3fcd958f4d7876e) && hitent tagexists(var_b3fcd958f4d7876e)) {
        bolt linkto(hitent, var_b3fcd958f4d7876e);
        bolt function_4510118c9d9ee7b2(hitent, var_b3fcd958f4d7876e);
    } else {
        bolt linkto(hitent);
    }
    bolt.linked = 1;
    if (cansticktoent(hitent)) {
        bolt.stuckenemyentity = hitent;
        bolt thread removestuckenemyondeathordisconnect(hitent);
    } else if (function_54546dc01019f527(hitent)) {
        bolt thread function_a4930163e0971504();
    }
    bolt function_1268ac885adc88a2(1);
    bolt thread boltunlinkonnote(hitent);
    bolt thread boltdeleteonnote(hitent, "vehicle_deleted");
    bolt thread boltdeleteonnote(hitent, "detonated");
    bolt thread boltdeleteonnote(hitent, "beginC130");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288b
// Size: 0x2a
function validateboltent() {
    if (isdefined(self) && istrue(self.iscrossbowbolt)) {
        return 1;
    } else {
        /#
            assertmsg("Ent expects to be a crossbow bolt, but no longer is.");
        #/
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28bc
// Size: 0x61
function removestuckenemyondeathordisconnect(hitent) {
    self endon("entitydeleted");
    hitent waittill_any_3("entitydeleted", "death", "disconnect");
    if (!validateboltent()) {
        return;
    }
    self.stuckenemyentity = undefined;
    if (isdefined(hitent) && isdefined(hitent.nocorpse)) {
        self delete();
    }
    function_a4930163e0971504();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2924
// Size: 0x38
function function_54546dc01019f527(hitent) {
    if (isdefined(hitent.targetname) && hitent.targetname == "player_corpse") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2963
// Size: 0x1e
function function_a4930163e0971504() {
    self endon("entitydeleted");
    wait(45);
    if (!validateboltent()) {
        return;
    }
    self delete();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2988
// Size: 0x2c
function boltunlinkonnote(hitent) {
    self endon("entitydeleted");
    hitent waittill_any_3("entitydeleted", "disconnect");
    boltunlink();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29bb
// Size: 0xae
function boltunlink(var_5be247f60b965650) {
    if (!validateboltent()) {
        return;
    }
    if (!isdefined(self.linked)) {
        return;
    }
    if (self islinked()) {
        self unlink();
    }
    self.linked = undefined;
    if (!isdefined(var_5be247f60b965650)) {
        var_5be247f60b965650 = (0, 0, 100);
    }
    if (!isdefined(self.model) || self.model == "tag_origin") {
        return;
    }
    if (!isdefined(self.classname) || self.classname != "script_model") {
        return;
    }
    self solid();
    self physicslaunchserver(self.origin, var_5be247f60b965650);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a70
// Size: 0x30
function boltdeleteonnote(hitent, note) {
    self endon("entitydeleted");
    hitent waittill(note);
    if (!validateboltent()) {
        return;
    }
    self delete();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa7
// Size: 0x43
function boltdeletethread() {
    self waittill("entitydeleted");
    if (isdefined(self.pickuptrigger)) {
        self.pickuptrigger delete();
    }
    if (isdefined(self.grenade)) {
        self.grenade delete();
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af1
// Size: 0x2a
function function_acd8433c3043c4f2(surfacenormal) {
    if (isdefined(surfacenormal)) {
        self dontinterpolate();
        self.angles = vectortoangles(surfacenormal * -1);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b22
// Size: 0x29
function issameteamplayer(hitent) {
    if (!isplayer(hitent)) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::isenemy(hitent)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b52
// Size: 0x43
function issameteamagent(hitent) {
    if (!isagent(hitent)) {
        return 0;
    }
    if (isdefined(hitent.agentteam) && self.team == hitent.agentteam) {
        return 1;
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9d
// Size: 0x132
function cansticktoent(hitent) {
    if (isai(hitent)) {
        return 1;
    }
    if (isplayer(hitent) || isagent(hitent)) {
        return 1;
    }
    if (isdefined(hitent.vehiclename)) {
        return 1;
    }
    if (isdefined(hitent.classname)) {
        if (hitent.classname == "misc_turret") {
            return 1;
        }
        if (hitent.classname == "script_model") {
            if (isdefined(hitent.streakinfo) && isdefined(hitent.streakinfo.streakname) && (hitent.streakinfo.streakname == "uav" || hitent.streakinfo.streakname == "gunship")) {
                return 1;
            }
            if (isdefined(hitent.targetname) && hitent.targetname == "enemyTarget") {
                return 1;
            }
        }
    }
    if (isdefined(hitent.equipmentref)) {
        if (hitent.equipmentref == "equip_tac_cover") {
            return 1;
        }
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd7
// Size: 0x2e
function function_fc87aff67fb01e6f(objweapon) {
    if (isdefined(objweapon.modifier)) {
        return (objweapon.modifier == "ammo_bolt_db");
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0d
// Size: 0x8
function function_42b0dfeb350f6ea5() {
    return 4.5;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1d
// Size: 0x54
function function_5d09c8fae400afb2(var_551411054e80b44b) {
    if (!function_f023a978eea742d3(var_551411054e80b44b)) {
        return;
    }
    function_c0ab8a070e986732();
    while (1) {
        self waittill("weapon_fired");
        function_a2e0841b4f6a8c5f();
        childthread function_e27041f5372c53f1();
        childthread function_e26f4be6d803c186();
        self waittill("reload");
        function_182a5b792f5c615a();
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d78
// Size: 0x4a
function function_f023a978eea742d3(objweapon) {
    if (isdefined(objweapon.scope) && objweapon.scope == "fourx04" && objweapon.scopevarindex == 4) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc9
// Size: 0x99
function function_e27041f5372c53f1() {
    self endon("bullet_terminated");
    self endon("reload");
    hitloc = impactpos = var_f07322c0d6ca069c = weapon = surfacetype = surfacenormal = var_b3fcd958f4d7876e = hitent = var_9d7ca6252f103a3b = self waittill("bullet_first_impact");
    if (stunshoulddetonate(hitent, surfacetype)) {
        function_32dd4ab63407230e();
    } else {
        function_4d540620ce852f82();
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e69
// Size: 0x20
function function_e26f4be6d803c186() {
    self endon("bullet_first_impact");
    self endon("reload");
    self waittill("bullet_terminated");
    function_4d540620ce852f82();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e90
// Size: 0x10
function function_c0ab8a070e986732() {
    self setclientomnvar("ui_reticle_mtx_action", 0);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea7
// Size: 0x11
function function_a2e0841b4f6a8c5f() {
    self setclientomnvar("ui_reticle_mtx_action", 1);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebf
// Size: 0x11
function function_32dd4ab63407230e() {
    self setclientomnvar("ui_reticle_mtx_action", 2);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed7
// Size: 0x11
function function_4d540620ce852f82() {
    self setclientomnvar("ui_reticle_mtx_action", 3);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eef
// Size: 0x11
function function_182a5b792f5c615a() {
    self setclientomnvar("ui_reticle_mtx_action", 4);
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f07
// Size: 0x7e
function function_163ded397285c41e() {
    var_63c7f7bafd29c6cf = spawn("script_origin", self.origin);
    var_63c7f7bafd29c6cf linkto(self);
    var_63c7f7bafd29c6cf playsound("thermite_bomb_crossbow_impact");
    var_63c7f7bafd29c6cf playloopsound("thermite_bomb_crossbow_fire_lp");
    waittill_any_timeout_3(4.5, "entitydeleted", "death", "disconnect");
    var_63c7f7bafd29c6cf playsound("thermite_bomb_crossbow_fire_end");
    var_63c7f7bafd29c6cf stoploopsound("thermite_bomb_crossbow_fire_lp");
    wait(5);
    var_63c7f7bafd29c6cf delete();
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8c
// Size: 0xb4
function function_1cef76b86c23032b(hitent, var_b3fcd958f4d7876e) {
    if (!isdefined(hitent)) {
        return 0;
    }
    if (!isdefined(var_b3fcd958f4d7876e)) {
        return 0;
    }
    var_cc077650ade11117 = function_8ed0ffa3f8be7c75(var_b3fcd958f4d7876e);
    if (!function_6efe6c06514615(var_cc077650ade11117)) {
        return 0;
    }
    if (isdefined(hitent.var_aab9695c92b0ed96) && var_cc077650ade11117 != "" && isdefined(hitent.var_aab9695c92b0ed96[var_cc077650ade11117]) && isdefined(hitent.var_aab9695c92b0ed96[var_cc077650ade11117].var_a776f097eb36e500)) {
        part = hitent.var_aab9695c92b0ed96[var_cc077650ade11117];
        if (part.var_a776f097eb36e500 == 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3048
// Size: 0xc7
function function_4510118c9d9ee7b2(hitent, var_b3fcd958f4d7876e) {
    var_cc077650ade11117 = function_8ed0ffa3f8be7c75(var_b3fcd958f4d7876e);
    if (!function_6efe6c06514615(var_cc077650ade11117)) {
        return;
    }
    if (isdefined(hitent.var_aab9695c92b0ed96) && var_cc077650ade11117 != "" && isdefined(hitent.var_aab9695c92b0ed96[var_cc077650ade11117])) {
        if (!isdefined(hitent.var_aab9695c92b0ed96[var_cc077650ade11117].var_673c6895d1418e1c)) {
            hitent.var_aab9695c92b0ed96[var_cc077650ade11117].var_673c6895d1418e1c = [];
        }
        hitent.var_aab9695c92b0ed96[var_cc077650ade11117].var_673c6895d1418e1c = array_add(hitent.var_aab9695c92b0ed96[var_cc077650ade11117].var_673c6895d1418e1c, self);
    }
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3116
// Size: 0x35
function function_8ed0ffa3f8be7c75(var_9427d76bd72bc70b) {
    if (!isdefined(level.var_d43e78e513933216)) {
        return "";
    }
    return function_53c4c53197386572(level.var_d43e78e513933216[var_9427d76bd72bc70b], "");
}

// Namespace crossbow/namespace_3544bf049e15c786
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3153
// Size: 0x31
function function_6efe6c06514615(var_a82468a449d0f391) {
    if (issubstr(var_a82468a449d0f391, "tag_wheel") || issubstr(var_a82468a449d0f391, "tag_door")) {
        return 1;
    } else {
        return 0;
    }
}

