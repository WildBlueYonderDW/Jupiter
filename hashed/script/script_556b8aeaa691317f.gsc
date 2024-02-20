// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\teamrevive.gsc;
#using script_556b8aeaa691317f;
#using scripts\cp_mp\challenges.gsc;
#using script_74b851b7aa1ef32d;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace super_stimpistol;

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262
// Size: 0x65
function function_c916427f116f1206() {
    level.var_b5f053a7ff75210e = getdvarint(@"hash_660a6d69270c9d7c", 1);
    level.var_7ddbbb03da35cba6 = getdvarint(@"hash_3a7a4bf29f0f6e78", 0);
    level.var_d6a1a4d7b320f72b = getdvarint(@"hash_bd6ad02d326bbffc", 1);
    level.var_73a59765d6944026 = getdvarint(@"hash_9f96b49415b4afab", 0);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce
// Size: 0x24
function function_76ca0b3d8b2555ca(weaponobj) {
    if (!isdefined(weaponobj)) {
        return 0;
    }
    return weaponobj.basename == "iw9_pi_stimpistol_mp";
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa
// Size: 0x3
function function_a377d33613e0c83() {
    
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x304
// Size: 0x19
function function_c61ee6d60763e771() {
    return level.var_b5f053a7ff75210e || level.var_7ddbbb03da35cba6;
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325
// Size: 0x5a
function function_31afe9d7b373900f() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    var_19163e14365d9264 = namespace_85d036cb78063c4a::getcurrentsuper();
    namespace_85d036cb78063c4a::setsuperisinuse(1);
    namespace_85d036cb78063c4a::setSuperIsActive(1);
    namespace_85d036cb78063c4a::function_a4496878854ae85b(var_19163e14365d9264.staticdata.useweapon, undefined, 100);
    namespace_cb965d2f71fefddc::resetsuper();
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386
// Size: 0x31
function function_807b3b0a3b4128f9() {
    if (isdefined(self.var_b24e609023ce8208)) {
        self.var_b24e609023ce8208 = undefined;
    }
    if (isdefined(self.var_98d31d9ce04b2b81)) {
        self.var_98d31d9ce04b2b81 = undefined;
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be
// Size: 0x60
function function_a35fff2ff233592a() {
    var_d3c112e63bf53ee5 = namespace_85d036cb78063c4a::getcurrentsuper();
    if (!isdefined(var_d3c112e63bf53ee5)) {
        return 0;
    }
    if (var_d3c112e63bf53ee5.staticdata.ref != "super_stimpistol") {
        return 0;
    }
    var_a063a7cebbe73076 = function_3889d69492a93008();
    if (var_a063a7cebbe73076 > 0 || issuperready()) {
        return 1;
    }
    return 0;
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x426
// Size: 0xa9
function private super_stimPistol_watchHits() {
    self notify("super_stimPistol_watchHits");
    self endon("super_stimPistol_watchHits");
    self endon("death_or_disconnect");
    while (1) {
        hitloc = impactpos = var_f07322c0d6ca069c = weapon = surfacetype = surfacenormal = var_b3fcd958f4d7876e = hitent = var_9d7ca6252f103a3b = self waittill("bullet_first_impact");
        if (isdefined(hitent) && function_76ca0b3d8b2555ca(weapon)) {
            thread function_8a99cebbc265563e(hitent, impactpos, weapon);
        }
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d6
// Size: 0x1e
function private function_ce78face7e6da5de(var_de6d964ca3fb3603) {
    return isdefined(var_de6d964ca3fb3603) && isdefined(var_de6d964ca3fb3603.var_ff06b80996e03e04);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fc
// Size: 0x1e
function private function_40bcb765cc81e05f(var_de6d964ca3fb3603) {
    return isdefined(var_de6d964ca3fb3603) && isdefined(var_de6d964ca3fb3603.var_516a933930eb2c27);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x9a
function private super_stimPistol_tagEntAsHit(var_df0969d1fc3f7545) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self notify("super_stimPistol_tagEntAsHit");
    self endon("super_stimPistol_tagEntAsHit");
    if (!isdefined(self.var_2e5de68612c3de1b)) {
        self.var_2e5de68612c3de1b = var_df0969d1fc3f7545;
    }
    if (isdefined(self.var_65a2b57b2b474c00) && !istrue(self.var_65a2b57b2b474c00.inuse)) {
        self.var_65a2b57b2b474c00.inuse = 1;
    }
    wait(3);
    while (namespace_7e17181d03156026::getbeingrevivedinternal()) {
        wait(0.1);
    }
    self.var_2e5de68612c3de1b = undefined;
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0xae
function private function_b66f1712709e29e1(var_9e2ce04b5ad662f7, var_bd37b214227476ca) {
    if (!isdefined(var_9e2ce04b5ad662f7)) {
        return;
    }
    if (!isplayer(var_9e2ce04b5ad662f7) || !isbot(var_9e2ce04b5ad662f7)) {
        return;
    }
    if (!istrue(var_9e2ce04b5ad662f7.inlaststand) && !istrue(var_9e2ce04b5ad662f7.liveRagdoll)) {
        return;
    }
    if (var_bd37b214227476ca == 1) {
        namespace_e072c8407b2a861c::updatehitmarker("standard", 0, 0, 0, "hitlaststand_stimpistol", self getentitynumber());
    } else if (var_bd37b214227476ca == 2) {
        namespace_e072c8407b2a861c::updatehitmarker("standard", 0, 0, 0, "hitcyber_stimpistol", self getentitynumber());
    } else {
        namespace_e072c8407b2a861c::updatehitmarker("standard", 0, 0, 0, undefined, self getentitynumber());
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x678
// Size: 0xd
function function_f0d1c9c39359efff() {
    return isdefined(self.var_2e5de68612c3de1b);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d
// Size: 0xa1
function function_4bdcd177675c91ba(revivee) {
    var_de6d964ca3fb3603 = spawnstruct();
    var_de6d964ca3fb3603.reviver = self;
    var_de6d964ca3fb3603.revivee = ter_op(isdefined(revivee), revivee, undefined);
    var_de6d964ca3fb3603.var_ff06b80996e03e04 = revivee namespace_7db13bdf599e41a6::function_15933e1583288208();
    var_de6d964ca3fb3603.var_516a933930eb2c27 = ter_op(isdefined(revivee.var_65a2b57b2b474c00), revivee.var_65a2b57b2b474c00, undefined);
    var_de6d964ca3fb3603.var_5fcb2d7778dddc58 = function_44c1a12f54ec6a4f();
    var_de6d964ca3fb3603.var_5c9e2171f24a94d8 = function_fa06085052105f5c();
    return var_de6d964ca3fb3603;
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x736
// Size: 0x3e
function function_22044a9973aa399c(var_2adff297ed7ea301, var_fab59a8dc2f2badc) {
    newweapon = makeweapon("iw9_pi_stimpistol_mp");
    var_2adff297ed7ea301 function_8a99cebbc265563e(var_fab59a8dc2f2badc, var_fab59a8dc2f2badc.origin, newweapon);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x77b
// Size: 0x1ab
function private function_8a99cebbc265563e(hitent, impactpos, weapon) {
    level endon("game_ended");
    if (isdefined(hitent)) {
        hitent endon("death_or_disconnect");
    }
    if (!istrue(function_76ca0b3d8b2555ca(weapon))) {
        return 0;
    }
    if (!isdefined(hitent)) {
        return 0;
    }
    if (!istrue(isplayer(hitent) || isagent(hitent))) {
        return 0;
    }
    if (!isdefined(hitent.team)) {
        return 0;
    }
    if (!istrue(level.var_b5f053a7ff75210e || level.var_7ddbbb03da35cba6)) {
        if (hitent.team != self.team) {
            return 0;
        }
    }
    hitent thread super_stimPistol_tagEntAsHit(self);
    var_de6d964ca3fb3603 = function_4bdcd177675c91ba(hitent);
    if (istrue(level.var_d6a1a4d7b320f72b)) {
        if (isdefined(var_de6d964ca3fb3603.revivee) && function_40bcb765cc81e05f(var_de6d964ca3fb3603) && isinlaststand(var_de6d964ca3fb3603.revivee)) {
            namespace_833bd5cc623ca701::function_466eb9801a8f5a59(var_de6d964ca3fb3603);
            namespace_aad14af462a74d08::function_d997435895422ecc("super_stimpistol", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
            function_b66f1712709e29e1(hitent, 1);
            return;
        }
    }
    if (istrue(level.var_73a59765d6944026)) {
        if (hitent.team != self.team && !istrue(level.var_7ddbbb03da35cba6)) {
            return 0;
        }
        if (function_ce78face7e6da5de(var_de6d964ca3fb3603)) {
            namespace_833bd5cc623ca701::function_ada94a4d4deecf34(var_de6d964ca3fb3603);
            namespace_aad14af462a74d08::function_d997435895422ecc("super_stimpistol", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
            function_b66f1712709e29e1(hitent, 2);
        }
        thread super_stimPistol_startCyberRevive_retryThread(hitent);
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92d
// Size: 0xf3
function function_466eb9801a8f5a59(var_de6d964ca3fb3603) {
    var_de6d964ca3fb3603.revivee playsoundtoplayer("weap_stimpistol_plr_hit_revive", var_de6d964ca3fb3603.revivee);
    var_de6d964ca3fb3603.var_516a933930eb2c27.var_2efb40714a6e9468 = 1;
    if (istrue(level.var_b5f053a7ff75210e)) {
        var_de6d964ca3fb3603.var_516a933930eb2c27.var_fd7344b9978191be = 1;
    }
    var_de6d964ca3fb3603.reviver.var_383e041e3e341315 = 1;
    var_de6d964ca3fb3603.var_516a933930eb2c27 notify("trigger", var_de6d964ca3fb3603.reviver);
    if (isdefined(var_de6d964ca3fb3603.revivee) && var_de6d964ca3fb3603.revivee.team == var_de6d964ca3fb3603.reviver.team) {
        namespace_a850435086c88de3::doOnActionScoreEvent(1, "superStimHeal");
    }
    namespace_8361bad7391de074::function_c0a3853f9497fad3(var_de6d964ca3fb3603);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa27
// Size: 0x121
function function_ada94a4d4deecf34(var_de6d964ca3fb3603) {
    var_de6d964ca3fb3603.revivee playsoundtoplayer("weap_stimpistol_plr_hit_revive", var_de6d964ca3fb3603.revivee);
    var_de6d964ca3fb3603.var_ff06b80996e03e04.var_2efb40714a6e9468 = 1;
    var_de6d964ca3fb3603.var_ff06b80996e03e04.var_70814aa80e0d3d1 = 1;
    var_de6d964ca3fb3603.var_ff06b80996e03e04.useweapon = undefined;
    var_de6d964ca3fb3603.var_ff06b80996e03e04.var_c99a7a6af360dabe = 1;
    if (istrue(level.var_7ddbbb03da35cba6)) {
        var_de6d964ca3fb3603.var_ff06b80996e03e04.var_c0ee3288dbec12c6 = 1;
    }
    namespace_7db13bdf599e41a6::function_301c4ec489f9bd39(var_de6d964ca3fb3603.var_ff06b80996e03e04, namespace_7db13bdf599e41a6::function_692cdf5f87a8667b(), undefined, var_de6d964ca3fb3603.reviver, undefined, undefined);
    if (isdefined(var_de6d964ca3fb3603.revivee) && var_de6d964ca3fb3603.revivee.team == var_de6d964ca3fb3603.reviver.team) {
        namespace_a850435086c88de3::doOnActionScoreEvent(1, "superStimHeal");
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb4f
// Size: 0xc1
function private super_stimPistol_startCyberRevive_retryThread(hitent) {
    hitent notify("super_stimPistol_startCyberRevive_retryThread");
    hitent endon("super_stimPistol_startCyberRevive_retryThread");
    hitent endon("last_stand_start");
    hitent endon("death_or_disconnect");
    var_de6d964ca3fb3603 = function_4bdcd177675c91ba(hitent);
    retrycount = 0;
    while (!function_ce78face7e6da5de(var_de6d964ca3fb3603) && istrue(hitent.liveRagdoll) && namespace_cd0b2d039510b38d::isteamreviveenabled()) {
        retrycount++;
        wait(1);
        hitent namespace_833bd5cc623ca701::super_stimPistol_tagEntAsHit(self);
        if (function_ce78face7e6da5de(var_de6d964ca3fb3603)) {
            namespace_833bd5cc623ca701::function_ada94a4d4deecf34(var_de6d964ca3fb3603);
            namespace_aad14af462a74d08::function_d997435895422ecc("super_stimpistol", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
            break;
        }
        if (retrycount >= 5) {
            break;
        }
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc17
// Size: 0x33
function private function_fa06085052105f5c() {
    out = ter_op(isdefined(level.teamReviveTime), level.teamReviveTime, 5);
    return ter_op(isdefined(out), out, undefined);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc52
// Size: 0x1e
function private function_44c1a12f54ec6a4f() {
    out = namespace_10260b963310d30e::getdefaultlaststandrevivetimervalue();
    return ter_op(isdefined(out), out, undefined);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc78
// Size: 0x39
function function_321c7891711e583f() {
    thread super_stimPistol_watchHits();
    function_ad32396bd89936bb(0);
    namespace_aad14af462a74d08::function_d997435895422ecc("super_stimpistol", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    return 1;
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb9
// Size: 0x27
function function_f5037ba4a5399b63(var_fcef8d217a441961) {
    self notify("super_stimPistol_watchHits");
    function_ad32396bd89936bb(1);
    self.var_bf5b10918f8418a1 = undefined;
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce7
// Size: 0xf
function function_9db6a100a4046d0c() {
    namespace_82dcd1d5ae30ff7::giveperk("specialty_pistoldeath");
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfd
// Size: 0x23
function function_3f29f7ceb8c0ec6d() {
    self.var_b24e609023ce8208 = undefined;
    self.var_98d31d9ce04b2b81 = undefined;
    namespace_82dcd1d5ae30ff7::removeperk("specialty_pistoldeath");
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd27
// Size: 0x29
function function_ad32396bd89936bb(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableweaponpickup();
    } else {
        self disableweaponpickup();
    }
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd57
// Size: 0x1e
function function_d44b1fe27ee0494f() {
    waittime = 10;
    thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw9_vm_ges_stimpistol_dart_remove", waittime);
}

// Namespace super_stimpistol/namespace_833bd5cc623ca701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd7c
// Size: 0x57
function function_b13d8e46564cdfda(var_1ae0500643033fb8) {
    /#
        if (var_1ae0500643033fb8 == 1) {
            thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("<unknown string>", 10);
        } else if (var_1ae0500643033fb8 == 2) {
            thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("<unknown string>", 10);
        } else if (var_1ae0500643033fb8 == 3) {
            thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("<unknown string>", 10);
        }
    #/
}

