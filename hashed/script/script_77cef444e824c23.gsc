// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_38eb8f4be20d54f4;
#using script_7edf952f8921aa6b;
#using scripts\mp\utility\perk.gsc;
#using script_58682e6578ce0515;
#using scripts\engine\trace.gsc;
#using scripts\mp\supers.gsc;
#using script_38db8bccc9eb301f;
#using script_16ea1b94f0f381b3;
#using script_63d03bd53d001217;

#namespace namespace_25dc7c066230bd21;

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f
// Size: 0x127
function init() {
    level._effect["frost_blast_aoe"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_fld_frost_blast.vfx");
    namespace_85d036cb78063c4a::function_53110a12409d01da("super_frost_blast", &function_f69fd160104f81cf, &function_e859744038631e6a, &function_c8f80bb08bb7e042, &function_de53ca4e5d02597e, undefined);
    function_b5e57408c7878df7(&on_ai_damage);
    /#
        function_6e7290c8ee4f558b("elite");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
    var_7c7b046a6b9536fc = getscriptbundle(level.var_7c7b046a6b9536fc);
    foreach (super in var_7c7b046a6b9536fc.var_63b618614d288401) {
        if (super.ref == "super_frost_blast") {
            level.var_f04301db8ca5ecfa["super_frost_blast"] = getscriptbundle("super:" + super.bundle);
            break;
        }
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d
// Size: 0x37
function function_f69fd160104f81cf() {
    extra_charge = function_b2f0a842c1cbcb2b("extra_charge");
    if (!isint(extra_charge) || extra_charge <= 0) {
        return;
    }
    namespace_82dcd1d5ae30ff7::giveperk("specialty_overcharge_field_upgrade");
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb
// Size: 0x46
function function_e859744038631e6a() {
    extra_charge = function_b2f0a842c1cbcb2b("extra_charge");
    if (!isint(extra_charge) || extra_charge <= 0) {
        return;
    }
    if (istrue(namespace_82dcd1d5ae30ff7::_hasperk("specialty_overcharge_field_upgrade"))) {
        namespace_82dcd1d5ae30ff7::removeperk("specialty_overcharge_field_upgrade");
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508
// Size: 0x6f
function function_c8f80bb08bb7e042() {
    if (isdefined(level.var_f04301db8ca5ecfa["super_frost_blast"])) {
        var_6a7ac7ba29bd7091 = level.var_f04301db8ca5ecfa["super_frost_blast"].offhandweapon;
        var_d54d53eaf955518d = namespace_e23f629a8349dfaf::function_75abcff430ed00b7(var_6a7ac7ba29bd7091);
        if (istrue(var_d54d53eaf955518d)) {
            self setscriptablepartstate("wand_fx", "wand_on_frost_blast", 0);
            thread function_17aa7ae7adc05fea();
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57f
// Size: 0x15
function function_de53ca4e5d02597e(var_fcef8d217a441961, attacker) {
    return 0;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c
// Size: 0x19
function function_17aa7ae7adc05fea() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    thread function_a09e395daeb68f70();
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bc
// Size: 0x64
function private function_fdb8e2f52b8ca1d2(var_3ac96baf5da33c26) {
    waittill_any_2("death_or_disconnect", "frost_blast_ended");
    if (isdefined(var_3ac96baf5da33c26)) {
        var_3ac96baf5da33c26.scriptable setscriptablepartstate("audio", "deactivate");
        waitframe();
        var_3ac96baf5da33c26.scriptable freescriptable();
        var_3ac96baf5da33c26 function_ad9433aab9fcdf04(15, "death", &delete);
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x627
// Size: 0xbb
function private function_f7c203e43c0e7737() {
    var_12baea29dc62088 = function_2e9e02e8bda61ef2();
    if (isdefined(var_12baea29dc62088) && isdefined(var_12baea29dc62088.groundent) && isdefined(var_12baea29dc62088.var_ea3b9640a6ad3c8e) && isdefined(var_12baea29dc62088.localangles)) {
        if (isdefined(self.var_bf8e5f003146af44)) {
            self.var_bf8e5f003146af44 linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.var_ea3b9640a6ad3c8e, var_12baea29dc62088.localangles);
        } else {
            self linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.var_ea3b9640a6ad3c8e, var_12baea29dc62088.localangles);
        }
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e9
// Size: 0x42e
function function_a09e395daeb68f70() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    radius = function_b2f0a842c1cbcb2b("frost_blast_base_radius");
    damage_radius = function_b2f0a842c1cbcb2b("frost_blast_base_damage_radius");
    duration = 2;
    var_ec6719abe43520a3 = 1;
    self.var_d024694422cf29ac = 1;
    area = spawn_tag_origin(self.origin, anglestoforward(self.angles));
    area.var_8c2116883aec8d9c = duration * 1000;
    area.var_d099defdb7f04dd1 = gettime();
    area.var_44dbf7668c66e452 = [];
    area.owner = self;
    area.var_c7e7d95f462f239c = 1;
    var_4ec22504ea4836f0 = [];
    waitframe();
    thread function_56b4007131d440d3(area);
    thread function_fdb8e2f52b8ca1d2(area);
    while (isdefined(area) && area.var_8c2116883aec8d9c > 0) {
        cur_time = gettime();
        delta_time = cur_time - area.var_d099defdb7f04dd1;
        area.var_d099defdb7f04dd1 = cur_time;
        area.var_8c2116883aec8d9c = area.var_8c2116883aec8d9c - delta_time;
        var_59d8a38b844d1e11 = getaiarrayinradius(area.origin, radius);
        foreach (var_5c0a31a149731954 in area.var_44dbf7668c66e452) {
            ai = var_5c0a31a149731954.ai;
            if (!array_contains(var_59d8a38b844d1e11, ai)) {
                if (isdefined(ai)) {
                    ai function_71d2ef391b770c6e();
                    ai function_b1ecaa5886f4bf2b(0);
                    ai function_b7c09ba6ad057c79(0);
                }
                area.var_44dbf7668c66e452 = array_remove(area.var_44dbf7668c66e452, var_5c0a31a149731954);
            }
        }
        foreach (var_765da0dc0411dbbd in var_59d8a38b844d1e11) {
            if (!isalive(var_765da0dc0411dbbd)) {
                continue;
            }
            if (isdefined(var_765da0dc0411dbbd.team) && var_765da0dc0411dbbd.team == self.team) {
                continue;
            }
            var_765da0dc0411dbbd function_b7c09ba6ad057c79(1, self);
            var_4ec22504ea4836f0[var_765da0dc0411dbbd getentitynumber()] = var_765da0dc0411dbbd;
            if (!array_contains_key(area.var_44dbf7668c66e452, var_765da0dc0411dbbd getentitynumber())) {
                if (var_ec6719abe43520a3) {
                    if (distancesquared(var_765da0dc0411dbbd.origin, area.origin) <= damage_radius * damage_radius) {
                        var_765da0dc0411dbbd function_fea8b8d300f71280(self);
                        if (!isalive(var_765da0dc0411dbbd)) {
                            waitframe();
                            continue;
                        }
                    }
                }
                var_a81fb1712ccea251 = spawnstruct();
                var_a81fb1712ccea251.ai = var_765da0dc0411dbbd;
                var_a81fb1712ccea251.var_e4cd2fedf698526b = cur_time;
                area.var_44dbf7668c66e452[var_765da0dc0411dbbd getentitynumber()] = var_a81fb1712ccea251;
            }
            var_9f88f5c467218406 = area.var_44dbf7668c66e452[var_765da0dc0411dbbd getentitynumber()];
            var_75f764da6c0d418a = var_765da0dc0411dbbd function_2fb9b4401941c475();
            if (!istrue(var_75f764da6c0d418a) && !utility::is_equal(var_765da0dc0411dbbd.type, "human")) {
                var_765da0dc0411dbbd thread function_16755d49f5cc3b3(self, area.var_8c2116883aec8d9c / 1000);
                waitframe();
            }
        }
        var_ec6719abe43520a3 = 0;
        waitframe();
    }
    self.var_d024694422cf29ac = undefined;
    foreach (ai in var_4ec22504ea4836f0) {
        ai function_b7c09ba6ad057c79(0);
    }
    self notify("frost_blast_ended");
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb1e
// Size: 0x79
function private function_b7c09ba6ad057c79(b_enabled, e_attacker) {
    if (!isalive(self)) {
        return;
    }
    if (b_enabled) {
        self.var_fb0325e04fae6ce8 = e_attacker;
        if (!ent_flag_exist("frost_blast_active")) {
            ent_flag_init("frost_blast_active");
        }
        ent_flag_set("frost_blast_active");
    } else {
        self.var_fb0325e04fae6ce8 = undefined;
        if (ent_flag_exist("frost_blast_active")) {
            ent_flag_clear("frost_blast_active");
        }
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0xc2
function function_56b4007131d440d3(area) {
    area show();
    area function_f7c203e43c0e7737();
    playfxontag(getfx("frost_blast_aoe"), area, "tag_origin");
    scriptable = spawnscriptable("super_frost_blast", area.origin);
    area.scriptable = scriptable;
    area.scriptable setscriptablepartstate("audio", "on");
    damage_radius = function_b2f0a842c1cbcb2b("frost_blast_base_radius");
    damage_amount = function_b2f0a842c1cbcb2b("frost_blast_base_damage_amount");
    self radiusdamage(self.origin, damage_radius, damage_amount, damage_amount, self, "MOD_EXPLOSIVE", undefined, 1);
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc67
// Size: 0x256
function function_fea8b8d300f71280(attacker) {
    damage = 0;
    if (utility::is_equal(self.aicategory, "normal")) {
        damage = self.maxhealth;
        val::set("insta_kill", "kill_on_damage", 1);
        ent_flag_set("frost_killed");
    }
    if (damage == 0 && utility::is_equal(self.type, "human")) {
        if (isdefined(self.subclass) && issubstr(self.subclass, "warlord")) {
            var_43ea7ee7224a5f65 = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2(self.origin);
            var_c95551588209ec44 = function_b2f0a842c1cbcb2b("frost_blast_base_damage_amount");
            damage = namespace_73f07f62510f0f5b::function_6f4c937aa843fac2(var_c95551588209ec44, var_43ea7ee7224a5f65, "frag_grenade", "elite", self.maxhealth);
        } else {
            damage = function_53c4c53197386572(function_b2f0a842c1cbcb2b("frost_blast_ai_soldier_damage"), 0);
        }
    }
    if (damage == 0 && isdefined(self.aicategory)) {
        var_43ea7ee7224a5f65 = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2(self.origin);
        var_c95551588209ec44 = function_b2f0a842c1cbcb2b("frost_blast_base_damage_amount");
        damage = namespace_73f07f62510f0f5b::function_6f4c937aa843fac2(var_c95551588209ec44, var_43ea7ee7224a5f65, "frag_grenade", self.aicategory, self.maxhealth);
    }
    sweapon = "none";
    if (isdefined(level.var_96c4059aa2eabfb8[%"frost_blast"])) {
        if (!isdefined(level.var_96c4059aa2eabfb8[%"frost_blast"].weaponobj)) {
            sweapon = makeweapon(level.var_96c4059aa2eabfb8[%"frost_blast"].weapon);
            level.var_96c4059aa2eabfb8[%"frost_blast"].weaponobj = sweapon;
        } else {
            sweapon = level.var_96c4059aa2eabfb8[%"frost_blast"].weaponobj;
        }
    }
    if (damage >= self.health) {
        val::set("insta_kill", "kill_on_damage", 1);
        val::set("zm_allow_give_super_point", "allow_give_super_point", 0);
    }
    self dodamage(damage, self.origin, attacker, attacker, "MOD_ELEMENTAL_COLD", sweapon, "none", undefined, 65536);
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec4
// Size: 0xa5
function function_16755d49f5cc3b3(attacker, duration) {
    level endon("game_ended");
    self endon("death");
    if (duration <= 0.1) {
        return;
    }
    if (isdefined(self.aisettings) && istrue(self.aisettings.var_c9cbc4a3332e44c6)) {
        var_83f668dad03f9b9 = function_b2f0a842c1cbcb2b("frost_blast_ai_slow_percentage");
        slow("frost_blast", var_83f668dad03f9b9, duration, attacker, &function_4f2ca6985698e967);
        if (self isscriptable() && self getscriptablehaspart("cryofreeze")) {
            self setscriptablepartstate("cryofreeze", "cryofreeze_on");
        }
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf70
// Size: 0x53
function function_b6c568cd7589eed8(str_label, str_tag) {
    level endon("game_ended");
    waitframe();
    fx = getfx(str_label);
    if (isalive(self)) {
        stopfxontag(fx, self, str_tag);
    }
    waitframe();
    if (isalive(self)) {
        playfxontag(fx, self, str_tag);
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfca
// Size: 0x32
function function_4f2ca6985698e967() {
    if (!isdefined(self)) {
        return;
    }
    if (self isscriptable() && self getscriptablehaspart("cryofreeze")) {
        self setscriptablepartstate("cryofreeze", "cryofreeze_shatter");
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1003
// Size: 0x18
function function_71d2ef391b770c6e() {
    if (function_2fb9b4401941c475()) {
        stop_slow("frost_blast");
    }
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1022
// Size: 0xe
function function_2fb9b4401941c475() {
    return function_c0111492d9bfc56d("frost_blast");
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1038
// Size: 0x65
function on_ai_damage(params) {
    if (function_2fb9b4401941c475() && isdefined(params.eattacker)) {
        return function_136a046f13726c77(params.idamage, params.eattacker, params.smeansofdeath, params.shitloc, params.sweapon);
    }
    return -1;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a5
// Size: 0x36
function function_136a046f13726c77(idamage, eattacker, smeansofdeath, shitloc, sweapon) {
    idamage = 1.25 * idamage;
    return idamage;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e3
// Size: 0xc
function function_655260b42a308bfd() {
    function_b1ecaa5886f4bf2b(1);
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f6
// Size: 0x5
function function_6bcb782f3aa81d3c() {
    return 1;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1103
// Size: 0xc
function function_3e8a1f7e5d6d1037() {
    return self.var_5ea46721aab49440;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1117
// Size: 0x16
function function_b1ecaa5886f4bf2b(b_value) {
    self.var_5ea46721aab49440 = b_value;
}

// Namespace namespace_25dc7c066230bd21/namespace_36cac461fc37e847
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1134
// Size: 0x18
function function_b2f0a842c1cbcb2b(str_field) {
    return namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_frost_blast", str_field);
}

