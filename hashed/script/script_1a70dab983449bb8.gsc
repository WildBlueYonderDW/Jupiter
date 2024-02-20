// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_7556d6ff132b5aa;
#using script_7ef95bba57dc4b82;
#using script_5762ac2f22202ba2;

#namespace thermobaric_grenade;

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x311
// Size: 0x5b
function autoexec main() {
    registersharedfunc("thermobaric_grenade", "thermobaric_grenade_used", &thermobaric_grenade_used);
    registersharedfunc("thermobaric_grenade", "thermobaric_shellshock_interrupt_delay", &thermobaric_shellshock_interrupt_delay);
    registersharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage", &thermobaric_additional_explosive_damage);
    registersharedfunc("thermobaric_grenade", "thermobaric_grenade_init", &thermobaric_grenade_init);
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373
// Size: 0x70
function thermobaric_grenade_init() {
    var_e5255d7c501309dd = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_thermobaric_grenade");
    if (isdefined(var_e5255d7c501309dd) && isdefined(var_e5255d7c501309dd.bundle)) {
        utility::add_fx("thermobaric_explosion_ground", var_e5255d7c501309dd.bundle.var_908692e6c3d0fb58);
        utility::add_fx("thermobaric_explosion_air", var_e5255d7c501309dd.bundle.var_d1b32d9e6e3d5f0b);
    }
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea
// Size: 0x45e
function function_a4cf6140ad44312c(grenade, bundle) {
    level.var_1310e63387ada26 = grenade.weapon_name;
    bundle = function_faec1a1cb92464a4(level.var_1310e63387ada26);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"hash_9ac03668bc0a2bd5", @"hash_862f98773eb2b9bf", bundle.var_461270791602aa19, 1);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"hash_b52d0dd2ab9ca8fb", @"hash_9823776fa6f2b6bd", bundle.var_544bec498b7bd247, 1);
    function_cb722e58dd976a9a(level.var_1310e63387ada26, #"hash_d54311b633e8295", @"hash_bca4b85e9ff30fdf", bundle.var_35e2a0c2bac627f1, 1);
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

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f
// Size: 0xc9
function thermobaric_grenade_used(grenade) {
    self endon("disconnect");
    grenade endon("explode_end");
    function_a4cf6140ad44312c(grenade);
    if (isdefined(grenade.ticks) && grenade.ticks >= 1) {
        grenade.iscooked = 1;
    }
    var_4b0db67804e50aec = grenade.owner getgunangles();
    var_33b453837f886dae = anglestoforward(var_4b0db67804e50aec);
    var_f901cb7707ef1b2c = grenade.weapon_name;
    function_92580d8a2fdccb7b("equip_thermobaric_pool_mp_p", grenade.spawnpos, 5000);
    position = grenade waittill("explode");
    function_90a9e9f5e4922a2a(position, var_33b453837f886dae, var_f901cb7707ef1b2c);
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91f
// Size: 0x177
function function_90a9e9f5e4922a2a(position, var_33b453837f886dae, var_f901cb7707ef1b2c, var_155c56b2e3db23c9) {
    var_246648a337842d7d = getgroundposition(position, 5);
    var_fe54a074022bc207 = distancesquared(position, var_246648a337842d7d) <= squared(function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_a02f369aef3c6b3b"));
    function_8bc975f46b0dca4(var_fe54a074022bc207, position);
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_d54311b633e8295") == 1 && var_fe54a074022bc207 && issharedfuncdefined("molotov", "molotov_simulate_impact")) {
        thread thermobaric_fire(var_33b453837f886dae, var_246648a337842d7d);
    }
    explosionradius = getgrenadedamageradius(var_f901cb7707ef1b2c);
    agents = getaiarrayinradius(position, explosionradius);
    var_a783bf2bef7a7b30 = ter_op(isdefined(var_155c56b2e3db23c9), var_155c56b2e3db23c9, self.team);
    foreach (agent in agents) {
        if (agent namespace_448ccf1ca136fbbe::function_ec40425fb125f6cf("thermobaric", var_a783bf2bef7a7b30) || is_equal(agent.team, var_a783bf2bef7a7b30)) {
            continue;
        }
        agent function_ad3ba4982eef1921(self, position, explosionradius);
    }
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9d
// Size: 0x3f
function function_8bc975f46b0dca4(var_fe54a074022bc207, position) {
    if (var_fe54a074022bc207) {
        playfx(utility::getfx("thermobaric_explosion_ground"), position);
    } else {
        playfx(utility::getfx("thermobaric_explosion_air"), position);
    }
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae3
// Size: 0xef
function thermobaric_fire(var_33b453837f886dae, var_246648a337842d7d) {
    wait(0.25);
    worldup = (0, 0, 1);
    right = vectorcross(var_33b453837f886dae, worldup);
    forward = vectorcross(right, worldup);
    angles = axistoangles(forward, right, worldup);
    angles = (angles[0], angles[1], 0);
    velocity = rotatepointaroundvector(right, forward, function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_b92a2351a80ffbe8")) * function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_c1623ae8f1fff702");
    var_7b32a8c5291e5968 = function_13665242ac5e0b29(angles, var_246648a337842d7d);
    [[ getsharedfunc("molotov", "molotov_simulate_impact") ]](var_7b32a8c5291e5968, var_246648a337842d7d, angles, undefined, velocity, gettime(), "equip_thermobaric_pool_mp_p");
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd9
// Size: 0x23b
function function_13665242ac5e0b29(angles, position) {
    var_7b32a8c5291e5968 = spawn("script_origin", position);
    var_7b32a8c5291e5968.angles = angles;
    var_7b32a8c5291e5968.owner = self;
    var_7b32a8c5291e5968.team = self.team;
    var_7b32a8c5291e5968.script_noteworthy = "thermobaric_fire";
    var_7b32a8c5291e5968.weapon_name = level.var_1310e63387ada26;
    var_7b32a8c5291e5968.var_e569b726ededed94 = spawnstruct();
    var_7b32a8c5291e5968.var_e569b726ededed94.var_e0cf068ccab49e34 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_d98d6e38f81f7c43");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_74fbf35a2265fa59 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_d511323888718c");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_81c84c326caec1d2 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_99081da968d2dc99");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_9369d29bfd0aec71 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_409cbd0f5f8928d8");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_1b01e583ecc2fb9a = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_a8a98335d9870657");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_439885d26a2f9bf5 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_ae4bc4d33f256174");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_2d8b92ed79acc178 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_e84bcb27d615fb10");
    var_7b32a8c5291e5968.var_e569b726ededed94.var_f9e916cb313e0dbe = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_204b3b9e9e971d66");
    var_7b32a8c5291e5968.var_e569b726ededed94.means_of_death = "MOD_FIRE";
    var_7b32a8c5291e5968.var_e569b726ededed94.useweapon = level.var_1310e63387ada26;
    return var_7b32a8c5291e5968;
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1c
// Size: 0x20a
function onplayerdamaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    if (!isdefined(data.inflictor) && data.meansofdeath == "MOD_SUICIDE") {
        return 1;
    } else if (!isdefined(data.inflictor)) {
        return 0;
    }
    if (isdefined(data.inflictor.script_noteworthy) && data.inflictor.script_noteworthy == "thermobaric_fire") {
        return 1;
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
        return 1;
    }
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_9ac03668bc0a2bd5") == 1) {
        victim function_2cccb72d594d9345(data.inflictor, attacker, explosionradius, var_8907f741f3a7b3f7);
    }
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_b52d0dd2ab9ca8fb") == 1) {
        victim thread function_4499c828c334b707(attacker);
    }
    if (isdefined(attacker) && issharedfuncdefined("pers", "incPersStat")) {
        attacker [[ getsharedfunc("pers", "incPersStat") ]]("thermobaricGrenadeHits", 1);
    }
    return 1;
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102e
// Size: 0x10b
function function_ad3ba4982eef1921(attacker, explosionpos, explosionradius) {
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_b52d0dd2ab9ca8fb") == 1) {
        thread function_4499c828c334b707(attacker);
    }
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_9ac03668bc0a2bd5") == 1) {
        var_bdee91b326d03668 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8fc578945af768c0");
        var_be1187b326f66822 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8faa8e945ae0c66a");
        scale = clamp(1 - distance(self.origin, explosionpos) / explosionradius, 0, 1);
        var_4399a43cae1b5a8a = var_be1187b326f66822 - var_bdee91b326d03668;
        time = var_bdee91b326d03668 + var_4399a43cae1b5a8a * scale;
        self notify("flashbang", self.origin);
    }
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1140
// Size: 0x15d
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
    var_bdee91b326d03668 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8fc578945af768c0");
    var_be1187b326f66822 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8faa8e945ae0c66a");
    var_f7a2ecc9ae1a3cc7 = function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_469e0c07d101aa90");
    scale = clamp(1 - distance(self.origin, einflictor.origin) / explosionradius, 0, 1);
    var_4399a43cae1b5a8a = var_be1187b326f66822 - var_bdee91b326d03668;
    time = var_bdee91b326d03668 + var_4399a43cae1b5a8a * scale;
    if (var_8907f741f3a7b3f7) {
        time = time * var_f7a2ecc9ae1a3cc7;
    }
    if (issharedfuncdefined("perk", "applyStunResistence")) {
        time = [[ getsharedfunc("perk", "applyStunResistence") ]](eattacker, self, time);
    }
    utility::setplayerstunned();
    thread cleanupconcussionstun(time);
    _shellshock("thermobaric_grenade", "stun", time, 1);
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a4
// Size: 0xca
function function_4499c828c334b707(var_71e0be188d8b0eba) {
    waittillframeend();
    if (function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_3561a8bad495bd9f") == 1 && function_eba2f2e094684b8f("specialty_blastshield")) {
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

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1375
// Size: 0x2a
function function_f8694111713a4874(waittime) {
    self endon("kill_wait_for_explosion_mod_end");
    waittill_any_timeout_1(waittime, "death_or_disconnect");
    self.var_26b2ca341e1aebea = undefined;
}

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a6
// Size: 0x11d
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

// Namespace thermobaric_grenade/namespace_d61c6e0163d61af4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cb
// Size: 0x26
function thermobaric_shellshock_interrupt_delay(duration) {
    return function_74a4a69afb4bc82b(level.var_1310e63387ada26, #"hash_8018351b231b05ca") * duration;
}

