#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_13865ca76df87ea;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_7556d6ff132b5aa;
#using script_7ef95bba57dc4b82;
#using script_5762ac2f22202ba2;

#namespace thermobaric_grenade;

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3c7
// Size: 0x5a
function autoexec main() {
    registersharedfunc("thermobaric_grenade", "thermobaric_grenade_used", &thermobaric_grenade_used);
    registersharedfunc("thermobaric_grenade", "thermobaric_shellshock_interrupt_delay", &thermobaric_shellshock_interrupt_delay);
    registersharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage", &thermobaric_additional_explosive_damage);
    registersharedfunc("thermobaric_grenade", "thermobaric_grenade_init", &thermobaric_grenade_init);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x429
// Size: 0x82
function thermobaric_grenade_init() {
    equipmenttable = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_thermobaric_grenade");
    if (isdefined(equipmenttable) && isdefined(equipmenttable.bundle)) {
        utility::add_fx("thermobaric_explosion_ground", equipmenttable.bundle.var_908692e6c3d0fb58);
        utility::add_fx("thermobaric_explosion_air", equipmenttable.bundle.var_d1b32d9e6e3d5f0b);
    }
    function_b68fa1978a63823a(equipmenttable.bundle);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0x45d
function function_a4cf6140ad44312c(grenade, bundle) {
    level.var_1310e63387ada26 = grenade.weapon_name;
    bundle = function_faec1a1cb92464a4(level.var_1310e63387ada26);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"do_stun", @"hash_862f98773eb2b9bf", bundle.do_stun, 1);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"hash_b52d0dd2ab9ca8fb", @"hash_9823776fa6f2b6bd", bundle.var_544bec498b7bd247, 1);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"do_fire", @"hash_bca4b85e9ff30fdf", bundle.do_fire, 1);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"hash_3561a8bad495bd9f", @"hash_82eeaa9e860b9595", bundle.var_b077008c7b62a49b, 1);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_8fc578945af768c0", @"hash_770783e5df2c2a36", bundle.var_5df6fe5c5a356d54, 1.5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_8faa8e945ae0c66a", @"hash_772a75e5df525324", bundle.var_5e19ec5c5a5b8d76, 2.5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_8018351b231b05ca", @"hash_a880efcc3e0951f9", bundle.var_5df8c327698929d6, 0.5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_469e0c07d101aa90", @"hash_229530fdb1a3e9f2", bundle.var_6f34e8d572ccfc34, 0.75);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_e6153cc1a9d834d6", @"hash_986c99cc9347e974", bundle.var_cba499064b321462, 0.5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_6ce1773bbe616b11", @"hash_739c7df4562556b7", bundle.var_63988e1bfb3a94c5, 0.25);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_fd943806d8f5c319", @"hash_ad13e849de08290f", bundle.var_9d78b5e0ec40e9ed, 5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_a02f369aef3c6b3b", @"hash_444197ac5856ef55", bundle.var_453ab658e0511de7, 20);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_b92a2351a80ffbe8", @"hash_8bff08c18d34ee2e", bundle.var_883ec1a5dd3de90c, 75);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_c1623ae8f1fff702", @"hash_c5f0421a78ff3e80", bundle.var_dfd310f350465016, 50);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_d98d6e38f81f7c43", @"hash_11e932953e047b51", bundle.var_adf466e3a48e821f, 5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_d511323888718c", @"hash_814d7e5d855a1936", bundle.var_3cc3f266eac78a38, 10);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_99081da968d2dc99", @"hash_bfa2cab0f930aa5b", bundle.var_b1f129e220b4dd5, 15);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_409cbd0f5f8928d8", @"hash_ab38be00deb0ffba", bundle.var_e1b62a83d5e2b274, 1);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_a8a98335d9870657", @"hash_4bf79f13ab850b71", bundle.var_c78a9b04ceb4b063, 1);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_ae4bc4d33f256174", @"hash_1d867eba5e7f04e2", bundle.var_85753d23074e3618, 0.5);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_e84bcb27d615fb10", @"hash_c7337db56127306", bundle.var_225f848c094326a4, 4);
    function_e3093afa85e28051(level.var_1310e63387ada26, #"hash_204b3b9e9e971d66", @"hash_cc41b687ffa79510", bundle.var_8f12276f936aa42, 4.25);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x918
// Size: 0x146
function thermobaric_grenade_used(grenade) {
    self endon("disconnect");
    grenade endon("explode_end");
    function_a4cf6140ad44312c(grenade);
    blueprintindex = grenade.weapon_object.variantid;
    if (!isdefined(blueprintindex)) {
        blueprintindex = 0;
    }
    tableinfo = getequipmenttableinfo("equip_thermobaric_grenade");
    bundle = tableinfo.bundle;
    var_9b32d1936831f5aa = function_71efed8bf57f1d39(bundle, blueprintindex);
    grenade function_b383c6eb771d7283(var_9b32d1936831f5aa);
    if (isdefined(grenade.ticks) && grenade.ticks >= 1) {
        grenade.iscooked = 1;
    }
    gunangle = grenade.owner getgunangles();
    gunforward = anglestoforward(gunangle);
    var_f901cb7707ef1b2c = grenade.weapon_name;
    function_92580d8a2fdccb7b("equip_thermobaric_pool_mp_p", grenade.spawnpos, 5000);
    position = grenade waittill("explode");
    function_90a9e9f5e4922a2a(position, gunforward, var_f901cb7707ef1b2c, undefined, bundle, blueprintindex, grenade.weapon_object);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa66
// Size: 0x1a4
function function_90a9e9f5e4922a2a(position, gunforward, var_f901cb7707ef1b2c, forceteam, bundle, blueprintindex, objweapon) {
    groundposition = getgroundposition(position, 5);
    istouchingground = distancesquared(position, groundposition) <= squared(function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_a02f369aef3c6b3b"));
    function_8bc975f46b0dca4(istouchingground, position, bundle, blueprintindex);
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"do_fire") == 1 && istouchingground && issharedfuncdefined("molotov", "molotov_simulate_impact")) {
        var_810c15bb2f4abd89 = function_696473ef4d75f1d3(bundle, blueprintindex);
        thread thermobaric_fire(gunforward, groundposition, var_810c15bb2f4abd89, objweapon);
    }
    explosionradius = getgrenadedamageradius(var_f901cb7707ef1b2c);
    agents = getaiarrayinradius(position, explosionradius);
    var_a783bf2bef7a7b30 = ter_op(isdefined(forceteam), forceteam, self.team);
    foreach (agent in agents) {
        if (agent scripts\common\utility::function_ec40425fb125f6cf("thermobaric", var_a783bf2bef7a7b30) || is_equal(agent.team, var_a783bf2bef7a7b30)) {
            continue;
        }
        agent function_ad3ba4982eef1921(self, position, explosionradius);
    }
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc12
// Size: 0x48
function function_8bc975f46b0dca4(istouchingground, position, bundle, blueprintindex) {
    if (istouchingground) {
        function_1792d9f5ade0ae4a(bundle, blueprintindex, "ground_explosion", position);
        return;
    }
    function_1792d9f5ade0ae4a(bundle, blueprintindex, "air_explosion", position);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc62
// Size: 0xfe
function thermobaric_fire(gunforward, groundposition, var_810c15bb2f4abd89, objweapon) {
    wait 0.25;
    worldup = (0, 0, 1);
    right = vectorcross(gunforward, worldup);
    forward = vectorcross(right, worldup);
    angles = axistoangles(forward, right, worldup);
    angles = (angles[0], angles[1], 0);
    velocity = rotatepointaroundvector(right, forward, function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_b92a2351a80ffbe8")) * function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_c1623ae8f1fff702");
    firesource = function_13665242ac5e0b29(angles, groundposition, var_810c15bb2f4abd89, objweapon);
    [[ getsharedfunc("molotov", "molotov_simulate_impact") ]](firesource, groundposition, angles, undefined, velocity, gettime(), "equip_thermobaric_pool_mp_p");
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd68
// Size: 0x268
function function_13665242ac5e0b29(angles, position, var_810c15bb2f4abd89, objweapon) {
    firesource = spawn("script_origin", position);
    firesource.angles = angles;
    firesource.owner = self;
    firesource.team = self.team;
    firesource.script_noteworthy = "thermobaric_fire";
    firesource.weapon_name = level.var_1310e63387ada26;
    firesource.var_810c15bb2f4abd89 = var_810c15bb2f4abd89;
    firesource.var_e569b726ededed94 = spawnstruct();
    firesource.var_e569b726ededed94.var_e0cf068ccab49e34 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_d98d6e38f81f7c43");
    firesource.var_e569b726ededed94.var_74fbf35a2265fa59 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_d511323888718c");
    firesource.var_e569b726ededed94.var_81c84c326caec1d2 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_99081da968d2dc99");
    firesource.var_e569b726ededed94.var_9369d29bfd0aec71 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_409cbd0f5f8928d8");
    firesource.var_e569b726ededed94.var_1b01e583ecc2fb9a = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_a8a98335d9870657");
    firesource.var_e569b726ededed94.var_439885d26a2f9bf5 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_ae4bc4d33f256174");
    firesource.var_e569b726ededed94.var_2d8b92ed79acc178 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_e84bcb27d615fb10");
    firesource.var_e569b726ededed94.flamemaxduration = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_204b3b9e9e971d66");
    firesource.var_e569b726ededed94.means_of_death = "MOD_FIRE";
    firesource.var_e569b726ededed94.useweapon = objweapon;
    firesource.var_e569b726ededed94.var_e2d8f199fd43170d = 1;
    return firesource;
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfd9
// Size: 0x205
function onplayerdamaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return true;
    }
    if (!isdefined(data.inflictor) && data.meansofdeath == "MOD_SUICIDE") {
        return true;
    } else if (!isdefined(data.inflictor)) {
        return false;
    }
    if (isdefined(data.inflictor.script_noteworthy) && data.inflictor.script_noteworthy == "thermobaric_fire") {
        return true;
    }
    victim = data.victim;
    attacker = data.attacker;
    point = data.point;
    explosionradius = getgrenadedamageradius(data.objweapon.basename);
    var_a929ea32fd20e1c4 = explosionradius * function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_e6153cc1a9d834d6");
    if (isdefined(attacker)) {
        var_8907f741f3a7b3f7 = attacker == victim;
    } else {
        var_8907f741f3a7b3f7 = 0;
    }
    /#
        if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
            var_8907f741f3a7b3f7 = 0;
        }
    #/
    if (var_8907f741f3a7b3f7 && distance(point, victim.origin) > var_a929ea32fd20e1c4) {
        return true;
    }
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"do_stun") == 1) {
        victim function_2cccb72d594d9345(data.inflictor, attacker, explosionradius, var_8907f741f3a7b3f7);
    }
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_b52d0dd2ab9ca8fb") == 1) {
        victim thread function_4499c828c334b707(attacker);
    }
    if (isdefined(attacker) && issharedfuncdefined("pers", "incPersStat")) {
        attacker [[ getsharedfunc("pers", "incPersStat") ]]("thermobaricGrenadeHits", 1);
    }
    return true;
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11e7
// Size: 0x107
function function_ad3ba4982eef1921(attacker, explosionpos, explosionradius) {
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_b52d0dd2ab9ca8fb") == 1) {
        thread function_4499c828c334b707(attacker);
    }
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"do_stun") == 1) {
        stuntimemin = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8fc578945af768c0");
        stuntimemax = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8faa8e945ae0c66a");
        scale = clamp(1 - distance(self.origin, explosionpos) / explosionradius, 0, 1);
        scalevalue = stuntimemax - stuntimemin;
        time = stuntimemin + scalevalue * scale;
        self notify("flashbang", self.origin, 1, 1, attacker, "axis", time);
    }
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x12f6
// Size: 0x158
function function_2cccb72d594d9345(einflictor, eattacker, explosionradius, var_8907f741f3a7b3f7) {
    if (isusingremote()) {
        return;
    }
    if (istrue(self.concussionimmune)) {
        return;
    }
    if (!val::get("stunned")) {
        return;
    }
    stuntimemin = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8fc578945af768c0");
    stuntimemax = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8faa8e945ae0c66a");
    var_f7a2ecc9ae1a3cc7 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_469e0c07d101aa90");
    scale = clamp(1 - distance(self.origin, einflictor.origin) / explosionradius, 0, 1);
    scalevalue = stuntimemax - stuntimemin;
    time = stuntimemin + scalevalue * scale;
    if (var_8907f741f3a7b3f7) {
        time *= var_f7a2ecc9ae1a3cc7;
    }
    if (issharedfuncdefined("perk", "applyStunResistence")) {
        time = [[ getsharedfunc("perk", "applyStunResistence") ]](eattacker, self, time);
    }
    utility::setplayerstunned();
    thread cleanupconcussionstun(time);
    _shellshock("thermobaric_grenade", "stun", time, 1);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1456
// Size: 0xc9
function function_4499c828c334b707(var_71e0be188d8b0eba) {
    waittillframeend();
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_3561a8bad495bd9f") == 1 && player_hasperk("specialty_blastshield")) {
        return;
    }
    var_b9b206ac4598f4bd = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_6ce1773bbe616b11");
    var_830498e50511eec5 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_fd943806d8f5c319");
    self.var_26b2ca341e1aebea = spawnstruct();
    self.var_26b2ca341e1aebea.value = var_b9b206ac4598f4bd;
    self.var_26b2ca341e1aebea.owner = var_71e0be188d8b0eba;
    self notify("kill_wait_for_explosion_mod_end");
    thread function_f8694111713a4874(var_830498e50511eec5);
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1527
// Size: 0x29
function function_f8694111713a4874(waittime) {
    self endon("kill_wait_for_explosion_mod_end");
    waittill_any_timeout_1(waittime, "death_or_disconnect");
    self.var_26b2ca341e1aebea = undefined;
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1558
// Size: 0x11c
function thermobaric_additional_explosive_damage(victim, attacker, damage) {
    if (!isdefined(victim.var_26b2ca341e1aebea) || victim.var_26b2ca341e1aebea.value == 0) {
        return 0;
    } else if (isdefined(victim.var_26b2ca341e1aebea.owner) && isplayer(victim.var_26b2ca341e1aebea.owner)) {
        victim.var_26b2ca341e1aebea.owner namespace_e072c8407b2a861c::updatedamagefeedback("thermobaricexplosiveboost");
        if (victim.var_26b2ca341e1aebea.owner != attacker && issharedfuncdefined("player", "doScoreEvent")) {
            victim.var_26b2ca341e1aebea.owner thread [[ getsharedfunc("player", "doScoreEvent") ]](#"hash_26b7aad4cb014023");
        }
        return (damage * victim.var_26b2ca341e1aebea.value);
    }
    return 0;
}

// Namespace thermobaric_grenade / namespace_d61c6e0163d61af4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x167d
// Size: 0x25
function thermobaric_shellshock_interrupt_delay(duration) {
    return function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8018351b231b05ca") * duration;
}

