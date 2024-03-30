// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\supers.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_189b67b2735b981d;
#using script_74b851b7aa1ef32d;
#using scripts\mp\gamelogic.gsc;
#using script_372301af73968cb;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_19fd5b5d73d44c18;

#namespace battlerage;

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3bf
// Size: 0x2f
function autoexec function_6f185a47e9e89d31() {
    scripts/engine/utility::registersharedfunc("battlerage", "suspendVisionSets", &function_67a8dd7e70c037cc);
    scripts/engine/utility::registersharedfunc("battlerage", "resumeVisionSets", &function_b2cbb30462cc3a75);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5
// Size: 0x98
function function_905b7bada6fd91cb(var_fd778fc5467d97b2, var_67d84be6232392d2) {
    self endon("disconnect");
    var_fd778fc5467d97b2 = default_to(var_fd778fc5467d97b2, 0);
    if (istrue(self.var_808d06ddfc93a4e4)) {
        function_1d07621770d39602();
    }
    function_c98b181b50b131b2();
    thread battleRage_beginSuper(var_fd778fc5467d97b2, var_67d84be6232392d2);
    function_2e7548a311865111(1);
    if (var_fd778fc5467d97b2 == 2) {
        thread function_f53fab1c650c0081();
        thread function_f53f3c80d282e10c(var_fd778fc5467d97b2, var_67d84be6232392d2);
    } else if (var_fd778fc5467d97b2 == 4) {
        thread function_f53f3c80d282e10c(var_fd778fc5467d97b2, var_67d84be6232392d2);
        thread function_b117e43076596748(var_67d84be6232392d2);
    }
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "self_apply");
    return true;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x495
// Size: 0xd9
function function_d04e75b8e793111f(equipmentref, slot, objweapon) {
    var_b863fc5b39ccf66d = istrue(self.var_808d06ddfc93a4e4) && self.var_fd778fc5467d97b2 == 1;
    var_1da4fe93ac63834a = istrue(self.var_808d06ddfc93a4e4) && self.var_fd778fc5467d97b2 != 1;
    if (var_1da4fe93ac63834a) {
        function_1d07621770d39602();
    }
    function_c98b181b50b131b2();
    thread function_14b332b353d098d5();
    if (var_b863fc5b39ccf66d) {
        defaultduration = getdvarfloat(@"hash_30001650209bd887", 6) * 1000;
        self.var_64190ac6a5aa31d5 = gettime() + defaultduration;
    } else {
        thread function_63172f4acc7e60e7();
        thread function_86f5e70ef8ff3f00();
        thread function_8a06a761037c26c0();
    }
    function_2e7548a311865111(1);
    return true;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x576
// Size: 0x5b
function private function_2e7548a311865111(binit) {
    if (binit) {
        self.var_eaa417c82fc6f913 = &function_6722a2088302142b;
        self.var_71c054a8df6f6e2b = &function_532d00cda484cdf3;
        self.var_50fbc0f48ccfe94e = &function_cbcbdc79db5a1426;
        return;
    }
    self.var_eaa417c82fc6f913 = undefined;
    self.var_71c054a8df6f6e2b = undefined;
    self.var_50fbc0f48ccfe94e = undefined;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5d8
// Size: 0x35
function private function_c98b181b50b131b2() {
    self.var_59317c0cd98c577 = undefined;
    self.var_808d06ddfc93a4e4 = undefined;
    self.var_2ad94435da5cc11b = undefined;
    self.var_fd778fc5467d97b2 = undefined;
    self.var_3876c573b9e66b57 = undefined;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x614
// Size: 0x15b
function battleRage_beginSuper(var_fd778fc5467d97b2, var_67d84be6232392d2) {
    self endon("disconnect");
    if (var_fd778fc5467d97b2 != 2 && var_fd778fc5467d97b2 != 4) {
        superinfo = getcurrentsuper();
        superinfo.usepercent = 0;
    }
    self notify("battleRageStart");
    self.var_808d06ddfc93a4e4 = 1;
    self.var_fd778fc5467d97b2 = var_fd778fc5467d97b2;
    self.var_3876c573b9e66b57 = var_67d84be6232392d2;
    self.superkills = 0;
    namespace_a850435086c88de3::doonactionscoreevent(1, "battleRageUsed");
    if (getdvarint(@"hash_5ecbc2e485434bb5", 0)) {
        self notify("force_regeneration");
    }
    scripts/mp/gamelogic::sethasdonecombat(self, 1);
    thread function_dcd48bb3e1cec589(var_fd778fc5467d97b2, var_67d84be6232392d2);
    if (getdvarint(@"hash_8edd6dd73c1d8ae4", 1)) {
        thread function_f0dd3d086c2d739d();
    }
    var_58edd809ad5343f6 = ter_op(var_fd778fc5467d97b2 == 3 || var_fd778fc5467d97b2 == 4, 0.05, 0.2);
    childthread battleRage_visionSetsPainSurge(0.5, var_58edd809ad5343f6);
    regendelay = getdvarfloat(@"hash_f7ec6896361f0e48", 0);
    namespace_54a2eae43eaa8bf5::function_5457f0107a845374("battleRage_beginSuper", regendelay);
    scripts/cp_mp/challenges::function_d997435895422ecc("super_battlerage", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    function_6458a8552104dc8b();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x776
// Size: 0xbf
function private function_14b332b353d098d5() {
    self notify("battleRageStart");
    self.var_808d06ddfc93a4e4 = 1;
    self.var_fd778fc5467d97b2 = 1;
    self.var_3876c573b9e66b57 = undefined;
    namespace_a850435086c88de3::doonactionscoreevent(0, "battleRageUsed");
    if (getdvarint(@"hash_5ecbc2e485434bb5", 0)) {
        self notify("force_regeneration");
    }
    scripts/mp/gamelogic::sethasdonecombat(self, 1);
    thread function_784f533d5ed19525();
    if (getdvarint(@"hash_8edd6dd73c1d8ae4", 1)) {
        thread function_f0dd3d086c2d739d();
    }
    thread battleRage_visionSetsPainSurge(0.5, 0.2);
    regendelay = getdvarfloat(@"hash_f7ec6896361f0e48", 0);
    namespace_54a2eae43eaa8bf5::function_5457f0107a845374("battleRage_beginSuper", regendelay);
    function_6458a8552104dc8b();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83c
// Size: 0x49
function function_f009283993c81afd(var_959265805dc9a79d) {
    self notify("battleRage_visionSetsPainSurge");
    if (!istrue(var_959265805dc9a79d)) {
        self setscriptablepartstate("battleRageVfx", "off", 0);
    }
    if (!istrue(self.var_5cd1342d8fd3dd61)) {
        self visionsetnakedforplayer("", 0.5);
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88c
// Size: 0x1e
function function_7fa9c564c245f4e3() {
    var_8c34f6ad9a062cc8 = getdvarint(@"hash_25f7326c9fb11c5b", 0);
    return var_8c34f6ad9a062cc8;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b2
// Size: 0x93
function function_fe088cdea420c6d6(attacker, victim) {
    var_99d1abc1148a35ad = isdefined(attacker) && isdefined(victim) && isplayer(attacker) && attacker != victim;
    if (isdefined(attacker) && isdefined(victim) && !var_99d1abc1148a35ad) {
        return;
    }
    function_c01286a01fdf16c1();
    self.superkills++;
    if (getdvarint(@"hash_fa795fa5ac66dd8c", 1)) {
        self notify("force_regeneration");
    }
    if (istrue(self.var_808d06ddfc93a4e4)) {
        thread scripts/mp/utility/points::doScoreEvent(#"hash_2ea2e76452c29f97");
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94c
// Size: 0xa
function function_3f783a5aca22152d() {
    function_c01286a01fdf16c1();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95d
// Size: 0x10f
function private function_c01286a01fdf16c1() {
    if (!isdefined(self.var_59317c0cd98c577)) {
        self.var_59317c0cd98c577 = 0;
    }
    var_66bf0bad2a84cd3c = getdvarfloat(@"hash_7e8c0274f6a1d8ac", 0.01);
    var_c213330088c02d7c = getdvarfloat(@"hash_b9c50a6287359eb0", 10);
    if (var_66bf0bad2a84cd3c <= 0) {
        return;
    }
    var_1cf4c56d1a6f42a7 = self.var_59317c0cd98c577 + var_66bf0bad2a84cd3c;
    var_f1e8a376d1b8a918 = var_c213330088c02d7c <= 0;
    var_8d21991ea863707d = var_1cf4c56d1a6f42a7 < var_c213330088c02d7c;
    if (var_f1e8a376d1b8a918 || var_8d21991ea863707d) {
        self.var_59317c0cd98c577 = self.var_59317c0cd98c577 + var_66bf0bad2a84cd3c;
        function_7c67c8e12db38300(var_66bf0bad2a84cd3c);
    } else {
        var_f3ad0a5016cb1aae = var_c213330088c02d7c - self.var_59317c0cd98c577;
        var_f3ad0a5016cb1aae = max(var_f3ad0a5016cb1aae, 0);
        if (var_f3ad0a5016cb1aae <= 0) {
            return;
        }
        self.var_59317c0cd98c577 = self.var_59317c0cd98c577 + var_f3ad0a5016cb1aae;
        function_7c67c8e12db38300(var_f3ad0a5016cb1aae);
    }
    /#
        assert(self.var_59317c0cd98c577 <= var_c213330088c02d7c || var_f1e8a376d1b8a918);
    #/
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa73
// Size: 0x67
function private function_5c3dada836d495ef() {
    var_d154cddd30b04ed9 = getdvarint(@"hash_e2b1912f2da8b4b5", 0.2);
    var_c892d16db21d47de = var_d154cddd30b04ed9 > 0;
    var_72623d06007724ba = getdvarint(@"hash_a5dd59d7c6441104", 0);
    if (var_72623d06007724ba <= 0) {
        return;
    }
    if (var_c892d16db21d47de) {
        function_2bb6d8cd4a2eee43(var_72623d06007724ba);
        return;
    }
    function_e434212c54afd8e4(var_72623d06007724ba);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0x88
function private function_2bb6d8cd4a2eee43(incomingheal) {
    basemaxhealth = scripts/mp/tweakables::gettweakablevalue("player", "maxhealth");
    var_2efb8e4e26a9a29d = getdvarfloat(@"hash_e2b1912f2da8b4b5", 0.2);
    var_79d8cbca2aa1639e = basemaxhealth + basemaxhealth * var_2efb8e4e26a9a29d;
    if (self.health + incomingheal > basemaxhealth) {
        self.maxhealth = var_79d8cbca2aa1639e;
    }
    function_e434212c54afd8e4(incomingheal);
    if (function_49d89d9d6340ae00()) {
        thread battleRage_monitorOverheal();
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb70
// Size: 0x44
function private function_e434212c54afd8e4(incomingheal) {
    self.health = int(min(self.maxhealth, self.health + incomingheal));
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x29
function private function_49d89d9d6340ae00() {
    basemaxhealth = scripts/mp/tweakables::gettweakablevalue("player", "maxhealth");
    return self.maxhealth > basemaxhealth;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbec
// Size: 0x3b
function private battleRage_monitorOverheal() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    self notify("battleRage_monitorOverheal");
    self endon("battleRage_monitorOverheal");
    while (function_49d89d9d6340ae00()) {
        waitframe();
    }
    function_feb90bb1ccdc8a59();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2e
// Size: 0x15a
function function_739a5f064c7debdf(var_fd778fc5467d97b2, var_67d84be6232392d2, var_84ad7d139c3431dc) {
    if (!istrue(self.var_808d06ddfc93a4e4)) {
        return;
    }
    var_fd778fc5467d97b2 = default_to(var_fd778fc5467d97b2, 0);
    if (var_fd778fc5467d97b2 != self.var_fd778fc5467d97b2) {
        return;
    }
    if (var_fd778fc5467d97b2 == 4 && var_67d84be6232392d2 != self.var_3876c573b9e66b57) {
        return;
    }
    self notify("battleRageEnd");
    function_f009283993c81afd();
    self.var_808d06ddfc93a4e4 = undefined;
    self.var_fd778fc5467d97b2 = undefined;
    self.var_3876c573b9e66b57 = undefined;
    self.superkills = undefined;
    function_feb90bb1ccdc8a59();
    var_26a8a7973ea6de8b = getdvarint(@"hash_55316648a7be13d", 0);
    var_f40baf4e34be03b9 = getdvarint(@"hash_cf91c5d3c93671ad", 0);
    if (isdefined(self.var_59317c0cd98c577)) {
        scripts/cp_mp/challenges::function_d997435895422ecc("super_battlerage", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), int(round(self.var_59317c0cd98c577)));
    }
    if (!istrue(var_84ad7d139c3431dc) && !istrue(level.gameended) && scripts/mp/utility/player::function_ad443bbcdcf37b85(self)) {
        function_a47db0cce0bd80f4(var_26a8a7973ea6de8b, var_f40baf4e34be03b9);
    }
    function_c98b181b50b131b2();
    function_564391eab6880a70();
    function_2e7548a311865111(0);
    namespace_54a2eae43eaa8bf5::function_4f8b5efd1816f6c3("battleRage_beginSuper");
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8f
// Size: 0x12b
function function_130f3c57dcc28043(var_84ad7d139c3431dc) {
    self notify("battleRageEnd");
    if (!istrue(self.var_808d06ddfc93a4e4) || self.var_fd778fc5467d97b2 != 1) {
        return;
    }
    function_f009283993c81afd();
    self.var_808d06ddfc93a4e4 = undefined;
    self.var_fd778fc5467d97b2 = undefined;
    self.var_3876c573b9e66b57 = undefined;
    self.superkills = undefined;
    var_d154cddd30b04ed9 = getdvarint(@"hash_e2b1912f2da8b4b5", 0.2);
    var_c892d16db21d47de = var_d154cddd30b04ed9 > 0;
    if (var_c892d16db21d47de) {
        function_feb90bb1ccdc8a59();
    }
    var_26a8a7973ea6de8b = getdvarint(@"hash_55316648a7be13d", 0);
    var_f40baf4e34be03b9 = getdvarint(@"hash_cf91c5d3c93671ad", 0);
    self.var_64190ac6a5aa31d5 = undefined;
    self.var_59317c0cd98c577 = undefined;
    if (!istrue(var_84ad7d139c3431dc) && !istrue(level.gameended) && scripts/mp/utility/player::function_ad443bbcdcf37b85(self)) {
        function_a47db0cce0bd80f4(var_26a8a7973ea6de8b, var_f40baf4e34be03b9);
    }
    function_c98b181b50b131b2();
    function_564391eab6880a70();
    function_2e7548a311865111(0);
    namespace_54a2eae43eaa8bf5::function_4f8b5efd1816f6c3("battleRage_beginSuper");
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec1
// Size: 0x1c
function function_bd68ba32d66dde65(equipmentref, slot) {
    self notify("battlerage_taken");
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xee4
// Size: 0x5c
function private function_1d07621770d39602() {
    /#
        assertex(istrue(self.var_808d06ddfc93a4e4), "Trying to interrupt a battle rage but the effect is not active.");
    #/
    var_84ad7d139c3431dc = 1;
    if (self.var_fd778fc5467d97b2 == 1) {
        function_130f3c57dcc28043(var_84ad7d139c3431dc);
        return;
    }
    function_739a5f064c7debdf(self.var_fd778fc5467d97b2, self.var_3876c573b9e66b57, var_84ad7d139c3431dc);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf47
// Size: 0x8b
function private function_a47db0cce0bd80f4(var_3b080dda61799f72, blocksprint) {
    if (var_3b080dda61799f72) {
        endhealth = self.maxhealth * 0.2;
        if (self.health > endhealth) {
            var_45dfead668cc412a = self.health - endhealth;
            self dodamage(var_45dfead668cc412a, self.origin, self, self, "MOD_TRIGGER_HURT", undefined, "torso_upper");
        }
    }
    if (isreallyalive(self) && blocksprint) {
        thread function_1be90fa9fc4f75d4();
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfd9
// Size: 0x4f
function private function_1be90fa9fc4f75d4() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    val::set("battleRage", "sprint", 0);
    val::set("battleRage", "supersprint", 0);
    waittill_any_timeout_1(5, "battleRageStart");
    val::reset_all("battleRage");
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x102f
// Size: 0x3e
function private function_dcd48bb3e1cec589(var_fd778fc5467d97b2, var_3876c573b9e66b57) {
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    level waittill_any_2("game_ended", "prematch_cleanup");
    thread function_739a5f064c7debdf(var_fd778fc5467d97b2, var_3876c573b9e66b57);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1074
// Size: 0x2b
function private function_784f533d5ed19525() {
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    level waittill_any_2("game_ended", "prematch_cleanup");
    thread function_130f3c57dcc28043();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a6
// Size: 0x3b
function private function_f53f3c80d282e10c(var_fd778fc5467d97b2, var_67d84be6232392d2) {
    self endon("disconnect");
    self endon("battleRageEnd");
    level endon("game_ended");
    self waittill("death");
    thread function_739a5f064c7debdf(var_fd778fc5467d97b2, var_67d84be6232392d2);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10e8
// Size: 0x28
function private function_8a06a761037c26c0() {
    self endon("disconnect");
    self endon("battleRageEnd");
    level endon("game_ended");
    self waittill("death");
    thread function_130f3c57dcc28043();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1117
// Size: 0x7e
function private function_79e60a54c8ed1ce8() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("undyingEnd");
    hipfireforced = 0;
    while (true) {
        healthpercent = clamp(self.health / self.maxhealth, 0.22, 1);
        self setmovespeedscale(healthpercent);
        if (healthpercent <= 0.3 && !istrue(hipfireforced)) {
            self notify("battleRage_lowHealth");
            hipfireforced = 1;
        }
        waitframe();
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x119c
// Size: 0x33
function private function_d4f1267e22f50847(deployweaponname) {
    self endon("death_or_disconnect");
    if (!isdefined(deployweaponname)) {
        return 0;
    }
    objweapon = makeweapon(deployweaponname);
    _takeweapon(objweapon);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11d6
// Size: 0x37
function private function_222aebcc1d1c9fe1(deployweaponname) {
    self endon("death_or_disconnect");
    objweapon = makeweapon(deployweaponname);
    result = giveandfireoffhandreliable(objweapon);
    return result;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1215
// Size: 0x4f
function private function_feb90bb1ccdc8a59() {
    var_d704ca6c9899b649 = scripts/mp/tweakables::gettweakablevalue("player", "maxhealth");
    if (self.maxhealth != var_d704ca6c9899b649 && !istrue(self.isjuggernaut)) {
        self.maxhealth = var_d704ca6c9899b649;
        function_ed279f6b5eba9fd4();
        return true;
    }
    return false;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x126c
// Size: 0x29
function private function_ed279f6b5eba9fd4() {
    self.health = int(clamp(self.health, 0, self.maxhealth));
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0x43
function private function_6458a8552104dc8b() {
    giveperk("specialty_blastshield");
    giveperk("specialty_tac_resist");
    if (getdvarint(@"hash_18cd69f9e0e0c0f9", 0) || scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        giveperk("specialty_battlerage_reduce_damage");
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e6
// Size: 0x51
function private function_564391eab6880a70() {
    if (_hasperk("specialty_blastshield")) {
        removeperk("specialty_blastshield");
    }
    if (_hasperk("specialty_tac_resist")) {
        removeperk("specialty_tac_resist");
    }
    if (_hasperk("specialty_battlerage_reduce_damage")) {
        removeperk("specialty_battlerage_reduce_damage");
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x133e
// Size: 0x32
function private function_f0dd3d086c2d739d() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    while (true) {
        wait(0.1);
        if (isdefined(self)) {
            self refreshsprinttime();
        }
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1377
// Size: 0x58
function private function_170fa6465d8f157a(var_4776e6542f71c13e, var_b70102123ffbdd14) {
    if (!isdefined(var_4776e6542f71c13e)) {
        return 0;
    }
    if (istrue(self.var_808d06ddfc93a4e4) && var_b70102123ffbdd14) {
        if (var_4776e6542f71c13e) {
            function_f009283993c81afd(1);
        } else {
            function_cba32179eb094ec9(0.5, 0.5);
        }
    }
    self.var_5cd1342d8fd3dd61 = var_4776e6542f71c13e;
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d6
// Size: 0xe
function function_67a8dd7e70c037cc() {
    function_170fa6465d8f157a(1, 1);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13eb
// Size: 0xd
function function_b2cbb30462cc3a75() {
    function_170fa6465d8f157a(0, 1);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13ff
// Size: 0x9e
function private battleRage_visionSetsPainSurge(fblendtime, var_3bcd7e754ee4931d) {
    self notify("battleRage_visionSetsPainSurge");
    self endon("battleRage_visionSetsPainSurge");
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    self earthquakeforplayer(0.3, fblendtime, self.origin, 50);
    if (!istrue(self.var_5cd1342d8fd3dd61)) {
        self visionsetnakedforplayer("battlerage-low-health", fblendtime);
    }
    if (!scripts/mp/utility/player::isinlaststand(self)) {
        self playlocalsound("plr_breath_pain_init");
    }
    wait(var_3bcd7e754ee4931d);
    self setscriptablepartstate("battleRageVfx", "vfx_start", 0);
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14a4
// Size: 0x7e
function private function_cba32179eb094ec9(var_d64fcaaa5c3dda68, var_e477d587907eacb9) {
    if (istrue(self.var_5cd1342d8fd3dd61)) {
        return 0;
    }
    if (self.health <= 0) {
        return;
    }
    var_99e1809851c25f06 = self.health / self.maxhealth;
    if (var_99e1809851c25f06 < 0.9) {
        self visionsetnakedforplayer("battlerage-low-health", var_d64fcaaa5c3dda68);
    }
    if (var_99e1809851c25f06 >= 0.9) {
        self visionsetnakedforplayer("battlerage-full-health", var_e477d587907eacb9);
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1529
// Size: 0x14
function function_6722a2088302142b() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1544
// Size: 0x14
function function_cbcbdc79db5a1426() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155f
// Size: 0x14
function function_532d00cda484cdf3() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157a
// Size: 0x14
function function_903a8abde1f77240() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1595
// Size: 0x7d
function function_63172f4acc7e60e7() {
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    level endon("game_ended");
    defaultduration = getdvarfloat(@"hash_30001650209bd887", 6) * 1000;
    self.var_64190ac6a5aa31d5 = int(gettime() + defaultduration);
    while (isdefined(self.var_64190ac6a5aa31d5) && gettime() < self.var_64190ac6a5aa31d5) {
        wait(0.25);
    }
    thread function_130f3c57dcc28043();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1619
// Size: 0x3c
function function_86f5e70ef8ff3f00() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    while (true) {
        self waittill("killed_enemy");
        function_8d51c3ded47b38dd();
        if (istrue(self.var_808d06ddfc93a4e4)) {
        }
    }
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165c
// Size: 0xa
function function_9e87f6624dd929f1() {
    function_8d51c3ded47b38dd();
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166d
// Size: 0x149
function function_8d51c3ded47b38dd() {
    if (!isdefined(self.var_59317c0cd98c577)) {
        self.var_59317c0cd98c577 = 0;
    }
    var_66bf0bad2a84cd3c = getdvarfloat(@"hash_7e8c0274f6a1d8ac", 0.01);
    var_c213330088c02d7c = getdvarfloat(@"hash_b9c50a6287359eb0", 10);
    if (var_66bf0bad2a84cd3c <= 0) {
        return;
    }
    var_1cf4c56d1a6f42a7 = self.var_59317c0cd98c577 + var_66bf0bad2a84cd3c;
    var_f1e8a376d1b8a918 = var_c213330088c02d7c <= 0;
    var_8d21991ea863707d = var_1cf4c56d1a6f42a7 < var_c213330088c02d7c;
    if (var_f1e8a376d1b8a918 || var_8d21991ea863707d) {
        self.var_59317c0cd98c577 = self.var_59317c0cd98c577 + var_66bf0bad2a84cd3c;
        self.var_64190ac6a5aa31d5 = self.var_64190ac6a5aa31d5 + var_66bf0bad2a84cd3c * 1000;
    } else {
        var_f3ad0a5016cb1aae = var_c213330088c02d7c - self.var_59317c0cd98c577;
        var_f3ad0a5016cb1aae = max(var_f3ad0a5016cb1aae, 0);
        if (var_f3ad0a5016cb1aae > 0) {
            self.var_59317c0cd98c577 = self.var_59317c0cd98c577 + var_f3ad0a5016cb1aae;
            self.var_64190ac6a5aa31d5 = self.var_64190ac6a5aa31d5 + var_f3ad0a5016cb1aae * 1000;
        }
    }
    if (getdvarint(@"hash_fa795fa5ac66dd8c", 1)) {
        self notify("force_regeneration");
    }
    /#
        assert(self.var_59317c0cd98c577 <= var_c213330088c02d7c || var_f1e8a376d1b8a918);
    #/
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bd
// Size: 0xbf
function function_f53fab1c650c0081() {
    self endon("death_or_disconnect");
    self endon("killed_player");
    self endon("stopped_self_revive");
    self endon("battleRageEnd");
    level endon("game_ended");
    var_26ccda53555eceb2 = level.superglobals.staticsuperdata["super_battlerage"];
    var_176d1bc49ea13a43 = var_26ccda53555eceb2.usetime;
    secondselapsed = 0;
    self waittill("last_stand_revived");
    self playlocalsound("plr_breath_pain_init");
    while (secondselapsed < var_176d1bc49ea13a43) {
        if (secondselapsed >= var_176d1bc49ea13a43) {
            break;
        }
        if (!scripts/mp/utility/player::function_ad443bbcdcf37b85(self) && secondselapsed > 0) {
            break;
        }
        waitframe();
        secondselapsed = secondselapsed + level.framedurationseconds;
    }
    thread function_739a5f064c7debdf(2);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1883
// Size: 0x15
function function_cc4ed2ddd1a0c88d() {
    thread namespace_e6ac9d98b8876b98::battleRage_visionSetsPainSurge(0.5, 0.2);
}

// Namespace battlerage / namespace_e6ac9d98b8876b98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189f
// Size: 0xbd
function function_b117e43076596748(var_67d84be6232392d2) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    var_a55d0c63a6a8001f = getentbynum(var_67d84be6232392d2);
    if (!isdefined(var_a55d0c63a6a8001f) || var_a55d0c63a6a8001f.team != self.team) {
        return;
    }
    while (true) {
        self waittill("killed_enemy");
        if (getdvarint(@"hash_fa795fa5ac66dd8c", 1)) {
            self notify("force_regeneration");
        }
        thread scripts/mp/utility/points::doScoreEvent(#"hash_2ea2e76452c29f97");
        if (isdefined(var_a55d0c63a6a8001f) && istrue(var_a55d0c63a6a8001f.var_808d06ddfc93a4e4) && var_a55d0c63a6a8001f.var_fd778fc5467d97b2 == 3) {
            var_a55d0c63a6a8001f function_c01286a01fdf16c1();
        }
    }
}

