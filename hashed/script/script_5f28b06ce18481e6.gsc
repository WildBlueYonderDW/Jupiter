#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_56ef8d52fe1b48a1;
#using scripts\cp\cp_player_battlechatter.gsc;
#using script_372301af73968cb;
#using scripts\mp\tweakables.gsc;

#namespace battlerage;

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x335
// Size: 0x24
function function_905b7bada6fd91cb() {
    function_c98b181b50b131b2();
    thread battleRage_beginSuper();
    function_2e7548a311865111(1);
    thread function_e0457147d4924ce6();
    return true;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x362
// Size: 0xd
function function_e0457147d4924ce6() {
    wait 15;
    thread function_739a5f064c7debdf();
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x377
// Size: 0x5a
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

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3d9
// Size: 0x20
function private function_c98b181b50b131b2() {
    self.var_59317c0cd98c577 = undefined;
    self.var_808d06ddfc93a4e4 = undefined;
    self.var_2ad94435da5cc11b = undefined;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x401
// Size: 0xcf
function private battleRage_beginSuper() {
    self.super_activated = 1;
    thread namespace_44edfb3e2b433c17::drain_super_meter(15);
    superinfo = namespace_44edfb3e2b433c17::getcurrentsuper();
    superinfo.usepercent = 0;
    self notify("battleRageStart");
    self.var_808d06ddfc93a4e4 = 1;
    self notify("force_regeneration");
    if (issharedfuncdefined("game", "setHasDoneCombat")) {
        [[ getsharedfunc("game", "setHasDoneCombat") ]](self, 1);
    }
    self.var_5cd1342d8fd3dd61 = 1;
    thread scripts\cp\cp_player_battlechatter::function_204aeba40a2aa027("super_battlerage");
    thread function_dcd48bb3e1cec589();
    thread function_f0dd3d086c2d739d();
    thread battleRage_visionSetsPainSurge(0.5, 0.2);
    namespace_54a2eae43eaa8bf5::function_5457f0107a845374("battleRage_beginSuper", 0.8);
    function_6458a8552104dc8b();
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4d8
// Size: 0x25
function private function_f009283993c81afd() {
    self setscriptablepartstate("battleRageVfx", "off", 0);
    self visionsetnakedforplayer("", 0.5);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x505
// Size: 0x1e
function function_7fa9c564c245f4e3() {
    var_8c34f6ad9a062cc8 = getdvarint(@"hash_25f7326c9fb11c5b", 160);
    return var_8c34f6ad9a062cc8;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
// Size: 0x9
function function_fe088cdea420c6d6() {
    function_c01286a01fdf16c1();
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53d
// Size: 0x9
function function_3f783a5aca22152d() {
    function_c01286a01fdf16c1();
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x54e
// Size: 0x10d
function private function_c01286a01fdf16c1() {
    if (!isdefined(self.var_59317c0cd98c577)) {
        self.var_59317c0cd98c577 = 0;
    }
    var_66bf0bad2a84cd3c = getdvarfloat(@"hash_7e8c0274f6a1d8ac", 1.5);
    var_c213330088c02d7c = getdvarfloat(@"hash_b9c50a6287359eb0", 0);
    if (var_66bf0bad2a84cd3c <= 0) {
        return;
    }
    var_1cf4c56d1a6f42a7 = self.var_59317c0cd98c577 + var_66bf0bad2a84cd3c;
    var_f1e8a376d1b8a918 = var_c213330088c02d7c <= 0;
    var_8d21991ea863707d = var_1cf4c56d1a6f42a7 < var_c213330088c02d7c;
    if (var_f1e8a376d1b8a918 || var_8d21991ea863707d) {
        self.var_59317c0cd98c577 += var_66bf0bad2a84cd3c;
        namespace_44edfb3e2b433c17::function_7c67c8e12db38300(var_66bf0bad2a84cd3c);
    } else {
        var_f3ad0a5016cb1aae = var_c213330088c02d7c - self.var_59317c0cd98c577;
        var_f3ad0a5016cb1aae = max(var_f3ad0a5016cb1aae, 0);
        if (var_f3ad0a5016cb1aae <= 0) {
            return;
        }
        self.var_59317c0cd98c577 += var_f3ad0a5016cb1aae;
        namespace_44edfb3e2b433c17::function_7c67c8e12db38300(var_f3ad0a5016cb1aae);
    }
    assert(self.var_59317c0cd98c577 <= var_c213330088c02d7c || var_f1e8a376d1b8a918);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x663
// Size: 0x66
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

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6d1
// Size: 0x87
function private function_2bb6d8cd4a2eee43(incomingheal) {
    basemaxhealth = scripts\mp\tweakables::gettweakablevalue("player", "maxhealth");
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

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x760
// Size: 0x43
function private function_e434212c54afd8e4(incomingheal) {
    self.health = int(min(self.maxhealth, self.health + incomingheal));
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7ab
// Size: 0x28
function private function_49d89d9d6340ae00() {
    basemaxhealth = scripts\mp\tweakables::gettweakablevalue("player", "maxhealth");
    return self.maxhealth > basemaxhealth;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7dc
// Size: 0x3a
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

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81e
// Size: 0x8b
function function_739a5f064c7debdf() {
    self notify("battleRageEnd");
    function_f009283993c81afd();
    self.super_activated = 0;
    self.var_808d06ddfc93a4e4 = undefined;
    function_feb90bb1ccdc8a59();
    var_26a8a7973ea6de8b = getdvarint(@"hash_55316648a7be13d", 0);
    var_f40baf4e34be03b9 = getdvarint(@"hash_cf91c5d3c93671ad", 0);
    function_a47db0cce0bd80f4(var_26a8a7973ea6de8b, var_f40baf4e34be03b9);
    function_c98b181b50b131b2();
    function_564391eab6880a70();
    function_2e7548a311865111(0);
    namespace_54a2eae43eaa8bf5::function_4f8b5efd1816f6c3("battleRage_beginSuper");
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8b1
// Size: 0x96
function private function_a47db0cce0bd80f4(var_3b080dda61799f72, blocksprint) {
    if (var_3b080dda61799f72) {
        endhealth = self.maxhealth * 0.2;
        if (self.health > endhealth) {
            var_45dfead668cc412a = self.health - endhealth;
            self dodamage(var_45dfead668cc412a, self.origin, self, self, "MOD_TRIGGER_HURT", undefined, "torso_upper");
        }
    }
    if ([[ getsharedfunc("player", "isReallyAlive") ]](self) && blocksprint) {
        thread function_1be90fa9fc4f75d4();
    }
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x94f
// Size: 0x43
function private function_1be90fa9fc4f75d4() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    val::set("battleRage", "sprint", 0);
    val::set("battleRage", "supersprint", 0);
    wait 5;
    val::reset_all("battleRage");
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x99a
// Size: 0x29
function private function_dcd48bb3e1cec589() {
    self endon("death_or_disconnect");
    self endon("battleRageEnd");
    level waittill_any_2("game_ended", "prematch_cleanup");
    function_739a5f064c7debdf();
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9cb
// Size: 0x7d
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

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa50
// Size: 0x32
function private function_d4f1267e22f50847(deployweaponname) {
    self endon("death_or_disconnect");
    if (!isdefined(deployweaponname)) {
        return 0;
    }
    objweapon = makeweapon(deployweaponname);
    _takeweapon(objweapon);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa8a
// Size: 0x36
function private function_222aebcc1d1c9fe1(deployweaponname) {
    self endon("death_or_disconnect");
    objweapon = makeweapon(deployweaponname);
    result = giveandfireoffhandreliable(objweapon);
    return result;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xac9
// Size: 0x40
function private function_feb90bb1ccdc8a59() {
    var_d704ca6c9899b649 = scripts\mp\tweakables::gettweakablevalue("player", "maxhealth");
    if (self.maxhealth != var_d704ca6c9899b649) {
        self.maxhealth = var_d704ca6c9899b649;
        function_ed279f6b5eba9fd4();
        return true;
    }
    return false;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb12
// Size: 0x28
function private function_ed279f6b5eba9fd4() {
    self.health = int(clamp(self.health, 0, self.maxhealth));
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb42
// Size: 0xe3
function private function_6458a8552104dc8b() {
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_fastreload");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_fastoffhand");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_falldamage");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_quickswap");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_quickdraw");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_fastcrouchmovement");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_fastsprintrecovery");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_tracker");
    self [[ getsharedfunc("perk", "givePerk") ]]("specialty_fast_health_regen");
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc2d
// Size: 0xe3
function private function_564391eab6880a70() {
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_fastreload");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_fastoffhand");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_falldamage");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_quickswap");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_quickdraw");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_fastcrouchmovement");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_fastsprintrecovery");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_tracker");
    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_fast_health_regen");
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd18
// Size: 0x1e
function private function_f0dd3d086c2d739d() {
    self endon("battleRageEnd");
    while (true) {
        wait 0.1;
        self refreshsprinttime();
    }
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd3e
// Size: 0x47
function private function_170fa6465d8f157a(var_4776e6542f71c13e, var_b70102123ffbdd14) {
    if (!isdefined(var_4776e6542f71c13e)) {
        return 0;
    }
    if (var_b70102123ffbdd14) {
        if (!var_4776e6542f71c13e) {
            function_f009283993c81afd();
        } else {
            function_cba32179eb094ec9(0.5, 0.5);
        }
    }
    self.var_5cd1342d8fd3dd61 = var_4776e6542f71c13e;
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8d
// Size: 0xd
function function_67a8dd7e70c037cc() {
    function_170fa6465d8f157a(1, 1);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda2
// Size: 0xc
function function_b2cbb30462cc3a75() {
    function_170fa6465d8f157a(0, 1);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdb6
// Size: 0x81
function private battleRage_visionSetsPainSurge(fblendtime, var_3bcd7e754ee4931d) {
    self notify("battleRage_visionSetsPainSurge");
    self endon("battleRage_visionSetsPainSurge");
    self.var_5cd1342d8fd3dd61 = 1;
    self earthquakeforplayer(0.3, fblendtime, self.origin, 50);
    self visionsetnakedforplayer("battlerage-low-health", fblendtime);
    wait var_3bcd7e754ee4931d;
    self.var_5cd1342d8fd3dd61 = 0;
    self setscriptablepartstate("battleRageVfx", "vfx_start", 0);
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe3f
// Size: 0x7c
function private function_cba32179eb094ec9(var_d64fcaaa5c3dda68, var_e477d587907eacb9) {
    if (self.var_5cd1342d8fd3dd61) {
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

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec3
// Size: 0x13
function function_6722a2088302142b() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xede
// Size: 0x13
function function_cbcbdc79db5a1426() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef9
// Size: 0x13
function function_532d00cda484cdf3() {
    function_cba32179eb094ec9(0.5, 0.5);
}

// Namespace battlerage / namespace_aa50c3a113d96b64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf14
// Size: 0x13
function function_903a8abde1f77240() {
    function_cba32179eb094ec9(0.5, 0.5);
}

