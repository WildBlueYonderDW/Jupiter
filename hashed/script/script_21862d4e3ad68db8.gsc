// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_2669878cf5a1b6bc;
#using script_429c2a03090c1ea1;
#using script_5762ac2f22202ba2;
#using script_77be8cd2b6610d5;
#using script_16ea1b94f0f381b3;
#using scripts\mp\mp_agent_damage.gsc;
#using script_6c6a46b757ce4c71;
#using script_73926eaf280b0b75;
#using script_554830d27078277d;
#using script_58682e6578ce0515;
#using script_6bffae1b97f70547;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_70c2478fc6d8ef;
#using scripts\mp\vehicles\damage.gsc;

#namespace namespace_bfa7544d6e21dd10;

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a
// Size: 0x9a
function function_d3124a8270438a63() {
    level.modifyplayerdamage = &function_d4aa7cafd713196e;
    level.var_9b695d81b2f8bc58 = getdvarint(@"hash_f6c436971939cdb2", 200);
    level callback::add("on_zombie_ai_spawned", &function_6078f3e8c682a36);
    level callback::add("on_agent_spawned", &function_edf4c2f3f7732c67);
    level callback::add("on_zombie_ai_killed", &on_zombie_ai_killed);
    level callback::add("on_ai_killed", &function_e5ea18b76842725f);
    callback::function_e7fddda1f0b46b5e("zombie") callback::add("on_zombie_ai_damaged", &on_zombie_ai_damaged);
    /#
        level thread function_b904029d0acf2fd1();
    #/
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0xee
function function_d4aa7cafd713196e(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (isscriptedagent(eattacker) && eattacker.unittype == "soldier") {
        idamage = function_cf5321434f9b38c1(idamage, smeansofdeath, objweapon);
    }
    if (isdefined(einflictor)) {
        if (isdefined(einflictor.sentrytype) && einflictor.sentrytype == "ai_sentry_turret") {
            var_d11b5d9fd186a28 = int(idamage * 0.5);
        } else {
            var_d11b5d9fd186a28 = idamage;
        }
        return var_d11b5d9fd186a28;
    }
    if (isdefined(eattacker) && isdefined(eattacker.var_c70842e4e81f2852)) {
        return 0;
    }
    return idamage;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x531
// Size: 0x48
function function_a1a83a29e4afe4f1() {
    /#
        assertex(isdefined(level.vehicles), "init_damage_callback_data() called before level.vehicles was initialized.");
    #/
    setdvarifuninitialized(@"hash_9cf7e7a1964e81cc", 0.65);
    level.vehicles.damagecallback = &function_73cfe327bdf9d28f;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x580
// Size: 0xf9
function private function_edf4c2f3f7732c67(params) {
    agent = params.agent;
    if (agent.unittype != "soldier") {
        return;
    }
    agent.var_970170ffd4b081ac = &function_863ec3e354fbfe1f;
    var_473ec1e332bfd4a2 = [0:"molotov", 1:"flashbang", 2:"tear_gas", 3:"thermobaric"];
    agent.var_2e2e7605fb14820a = [];
    foreach (exclusion in var_473ec1e332bfd4a2) {
        agent.var_2e2e7605fb14820a[exclusion] = 1;
    }
    agent.var_21a8839dd03e31cd = [];
    agent callback::add("on_soldier_ai_damaged", &on_soldier_ai_damaged);
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x1a
function private function_6078f3e8c682a36(params) {
    self.var_970170ffd4b081ac = &function_d88acf085f34a24f;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params d, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0x765
function function_d88acf085f34a24f(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!getdvarint(@"hash_721d365f6275dc03", 0)) {
        time = gettime();
        isshotgun = isdefined(sweapon) && isdefined(sweapon.classname) && sweapon.classname == "spread" && !sweapon.isalternate;
        if (!isshotgun && isdefined(self.var_1dd7e0b72616a4e3) && isdefined(eattacker) && isdefined(self.var_656f66bef07b9ddf) && self.var_1dd7e0b72616a4e3 == time && self.var_656f66bef07b9ddf == eattacker) {
            self.var_c7bdf3bff391f1dd++;
            if (self.var_c7bdf3bff391f1dd > getdvarint(@"hash_3ce8e17eda588850", 3)) {
                /#
                    /#
                        assertmsg("artillery_rumble_heavy");
                    #/
                #/
                return 0;
            }
        } else {
            self.var_1dd7e0b72616a4e3 = time;
            self.var_656f66bef07b9ddf = eattacker;
            self.var_c7bdf3bff391f1dd = 1;
        }
    }
    var_d74fc41b6b10ccf5 = function_34e78cbd2dfff6df(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    if (isdefined(self.var_d37b75616f7c2ee)) {
        var_d74fc41b6b10ccf5.var_9b9dbc948c253172 = self.var_d37b75616f7c2ee.var_9b9dbc948c253172;
    } else {
        var_d74fc41b6b10ccf5.var_9b9dbc948c253172 = 0;
    }
    var_d74fc41b6b10ccf5.var_9b9dbc948c253172++;
    var_d74fc41b6b10ccf5.var_2bd7283211fa61e7 = function_6a3d1a2884883a23(var_d74fc41b6b10ccf5);
    /#
        assert(isdefined(var_d74fc41b6b10ccf5.idamage));
    #/
    var_bfbe28d9bcd4f274 = function_6a0b029f221e0ffe(var_d74fc41b6b10ccf5) == 0;
    if (function_b8fd1823ea584538(eattacker, objweapon, smeansofdeath) || var_bfbe28d9bcd4f274) {
        if (isplayer(eattacker) && self.team != eattacker.team) {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", 0);
        }
        return 0;
    }
    var_d74fc41b6b10ccf5.idamage = function_b5af5dd435f7f00a(var_d74fc41b6b10ccf5);
    var_d74fc41b6b10ccf5.idamage = function_73d296636c5ca3c6(var_d74fc41b6b10ccf5);
    var_d74fc41b6b10ccf5.idamage = function_942afcb4f4e24091(var_d74fc41b6b10ccf5);
    var_d74fc41b6b10ccf5.idamage = function_89cc24cfc33e2693(var_d74fc41b6b10ccf5);
    var_d74fc41b6b10ccf5.idamage = function_ba2823ac0204930c(var_d74fc41b6b10ccf5);
    var_d74fc41b6b10ccf5.idamage = function_f9c444fcf6bb992b(var_d74fc41b6b10ccf5);
    var_d74fc41b6b10ccf5.idamage = function_bc7da5341862e4e0(var_d74fc41b6b10ccf5);
    /#
        assert(isdefined(var_d74fc41b6b10ccf5.idamage) && var_d74fc41b6b10ccf5.idamage > 0 && int(var_d74fc41b6b10ccf5.idamage) > 0);
    #/
    var_d74fc41b6b10ccf5.idamage = function_4948d7eacb9f12be(var_d74fc41b6b10ccf5);
    if (isdefined(var_d74fc41b6b10ccf5.eattacker) && isplayer(var_d74fc41b6b10ccf5.eattacker.owner)) {
        var_d74fc41b6b10ccf5.eattacker = var_d74fc41b6b10ccf5.eattacker.owner;
    }
    if (isplayer(var_d74fc41b6b10ccf5.eattacker)) {
        namespace_dc2e59577d3a271f::function_352659ff5187d66d(var_d74fc41b6b10ccf5);
        var_d74fc41b6b10ccf5.var_941802a0997e0c42 = self.var_941802a0997e0c42;
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        if (issharedfuncdefined("thermobaric_grenade", "thermobaric_additional_explosive_damage")) {
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage + [[ getsharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage") ]](self, eattacker, var_d74fc41b6b10ccf5.idamage);
        }
    }
    namespace_36c516b387249c45::function_6b8e5b333b2b3e43(var_d74fc41b6b10ccf5);
    thread namespace_28253c2ed4569abd::function_5c8a92a87ae9751b(var_d74fc41b6b10ccf5.eattacker, var_d74fc41b6b10ccf5.var_feef4b237a6beb07, var_d74fc41b6b10ccf5.var_2eb474020f9d509, "hitarmorlight");
    namespace_36c516b387249c45::function_63e1cb89f73d0ad8(var_d74fc41b6b10ccf5);
    namespace_36c516b387249c45::function_71a411d4b5466318(var_d74fc41b6b10ccf5);
    namespace_36c516b387249c45::function_10a52a9d2dcaf262(var_d74fc41b6b10ccf5);
    if (istrue(self.var_cbee08d81e41) && (!isdefined(self.aicategory) || self.aicategory != "boss")) {
        var_d74fc41b6b10ccf5.idamage = self.health;
    }
    if (isdefined(eattacker) && (isplayer(eattacker) || isplayer(eattacker.owner))) {
        var_678a0776298909d1 = eattacker;
        var_cb5826a84ea1330c = undefined;
        var_85a6844c49746558 = undefined;
        if (isplayer(eattacker.owner)) {
            var_678a0776298909d1 = eattacker.owner;
        }
        var_678a0776298909d1.pers["participation"] = 1;
        if (isarray(self.var_691b16f55274b1c5) && isdefined(var_d74fc41b6b10ccf5.var_2bd7283211fa61e7)) {
            var_cb5826a84ea1330c = self.var_691b16f55274b1c5[var_d74fc41b6b10ccf5.var_2bd7283211fa61e7];
        }
        if (namespace_ac0edc67c1149926::function_73075c88c97d2d50() && namespace_ac0edc67c1149926::function_87c3b43d00319847()) {
            namespace_ac0edc67c1149926::function_c54b2cc2e762c201(var_678a0776298909d1, self, shitloc, smeansofdeath, objweapon, int(var_d74fc41b6b10ccf5.idamage), vpoint, 0, var_d74fc41b6b10ccf5.var_2bd7283211fa61e7, var_d74fc41b6b10ccf5.var_14edc6d1db3695bc, var_d74fc41b6b10ccf5.var_feef4b237a6beb07);
        } else if (istrue(var_cb5826a84ea1330c) && (!isdefined(shitloc) || shitloc != "shield")) {
            var_85a6844c49746558 = level.var_294d0b1503a8ccb9[var_d74fc41b6b10ccf5.var_2bd7283211fa61e7];
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback(var_85a6844c49746558, var_d74fc41b6b10ccf5.idamage >= self.health, var_d74fc41b6b10ccf5.var_14edc6d1db3695bc);
        }
        if (isplayer(eattacker) && var_d74fc41b6b10ccf5.idamage > 0 && (!isdefined(shitloc) || shitloc != "shield") && !isdefined(var_85a6844c49746558)) {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", var_d74fc41b6b10ccf5.idamage >= self.health, var_d74fc41b6b10ccf5.var_14edc6d1db3695bc);
        }
    }
    self.var_d37b75616f7c2ee = var_d74fc41b6b10ccf5;
    callback::callback("on_zombie_ai_damaged", var_d74fc41b6b10ccf5);
    if (isdefined(eattacker) && (isdefined(eattacker.var_69b049cf4b18c73b) || isdefined(eattacker.var_1d52051e15c4b0c5))) {
        n_multiplier = 1;
        if (isdefined(eattacker.var_69b049cf4b18c73b)) {
            n_multiplier = 200;
        } else if (isdefined(eattacker.var_1d52051e15c4b0c5)) {
            n_multiplier = eattacker.var_1d52051e15c4b0c5;
        }
        if (isdefined(var_d74fc41b6b10ccf5) && isdefined(var_d74fc41b6b10ccf5.idamage)) {
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * n_multiplier;
        }
    }
    var_7f44ebb892b36735 = int(var_d74fc41b6b10ccf5.idamage);
    if (!isdefined(var_7f44ebb892b36735) || var_7f44ebb892b36735 < 0) {
        /#
            assert(0);
        #/
        var_7f44ebb892b36735 = 0;
    }
    return var_7f44ebb892b36735;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0x86
function private on_zombie_ai_damaged(var_d74fc41b6b10ccf5) {
    if (isplayer(var_d74fc41b6b10ccf5.eattacker) && isdefined(self.var_21a8839dd03e31cd)) {
        self.var_21a8839dd03e31cd = function_6d6af8144a5131f1(self.var_21a8839dd03e31cd, var_d74fc41b6b10ccf5.eattacker);
    }
    thread namespace_28253c2ed4569abd::function_45500125495e46a6(var_d74fc41b6b10ccf5.eattacker, var_d74fc41b6b10ccf5.var_feef4b237a6beb07, var_d74fc41b6b10ccf5.var_2eb474020f9d509, "hitarmorlightbreak");
    function_344933dc7e648343(var_d74fc41b6b10ccf5);
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9b
// Size: 0x2ae
function function_344933dc7e648343(var_d74fc41b6b10ccf5) {
    if (isdefined(var_d74fc41b6b10ccf5.smeansofdeath) && var_d74fc41b6b10ccf5.smeansofdeath == "MOD_CRUSH") {
        var_1e0b2c127d2be63e = undefined;
        if (isdefined(var_d74fc41b6b10ccf5.eattacker) && var_d74fc41b6b10ccf5.eattacker namespace_1f188a13f7e79610::isvehicle()) {
            var_1e0b2c127d2be63e = var_d74fc41b6b10ccf5.eattacker;
        } else if (isdefined(var_d74fc41b6b10ccf5.einflictor) && var_d74fc41b6b10ccf5.einflictor namespace_1f188a13f7e79610::isvehicle()) {
            var_1e0b2c127d2be63e = var_d74fc41b6b10ccf5.einflictor;
        } else {
            return;
        }
        if (istrue(var_1e0b2c127d2be63e.var_85ccbd4bc4b4b792) || istrue(var_1e0b2c127d2be63e.var_aa4804cc1bc59e93)) {
            return;
        }
        var_1e0b2c127d2be63e.var_7fff3293eab0f7b8 = 1;
        /#
            println("<unknown string>" + var_1e0b2c127d2be63e.maxhealth);
        #/
        if (isdefined(var_1e0b2c127d2be63e.maxhealth) && var_1e0b2c127d2be63e.maxhealth > 0) {
            var_513d5276249f7427 = var_1e0b2c127d2be63e.maxhealth / 100 * 80;
            if (isdefined(self.var_d50c0574bc1995cc)) {
                if (time_has_passed(self.var_d50c0574bc1995cc, 1)) {
                    if (self.var_f169018a1b389971 > var_513d5276249f7427) {
                        return;
                    } else {
                        self.var_d50c0574bc1995cc = gettime();
                        self.var_f169018a1b389971 = 0;
                    }
                }
            } else {
                self.var_d50c0574bc1995cc = gettime();
                self.var_f169018a1b389971 = 0;
            }
        }
        if (isdefined(var_d74fc41b6b10ccf5.idamage)) {
            if (var_1e0b2c127d2be63e vehicle_getspeed() < 5) {
                return;
            }
            if (var_d74fc41b6b10ccf5.idamage < 15) {
                return;
            }
            var_c40c7a14462edbe6 = 41.1111;
            var_73069b4add1e8094 = "difficulty_easy";
            if (isfunction(level.var_8241e0d86017df29)) {
                var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](var_1e0b2c127d2be63e.origin);
            }
            switch (var_73069b4add1e8094) {
            case #"hash_af83e47edfa8900a":
                var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * 2;
                break;
            case #"hash_5343b465e56ec9a4":
                var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * 5;
                break;
            case #"hash_651f76c0ad6741ec":
                var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * 10;
                break;
            }
            if (!is_equal(self.aicategory, "normal")) {
                var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * 5;
            }
            var_c40c7a14462edbe6 = floor(var_c40c7a14462edbe6);
            if (isdefined(self.var_f169018a1b389971)) {
                self.var_f169018a1b389971 = self.var_f169018a1b389971 + var_c40c7a14462edbe6;
            } else {
                self.var_f169018a1b389971 = var_c40c7a14462edbe6;
            }
            var_1e0b2c127d2be63e thread function_743e37eebd6ba8e2(var_c40c7a14462edbe6);
        }
    }
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1150
// Size: 0xba
function function_743e37eebd6ba8e2(n_damage) {
    self endon("death");
    playsoundatpos(self.origin, "evt_zm_core_zombie_objective_impact");
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    if (isdefined(occupants)) {
        foreach (occupant in occupants) {
            if (isplayer(occupant)) {
                occupant playrumbleonpositionforclient("artillery_rumble_heavy", self.origin);
            }
        }
    }
    namespace_dbbb37eb352edf96::vehicle_damage(n_damage);
    wait(0.1);
    self.var_7fff3293eab0f7b8 = undefined;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1211
// Size: 0x4a
function private function_3c80d46239ce0a0e(var_d74fc41b6b10ccf5, shitloc, var_29a8ba8c9dd43fd2) {
    if (shitloc == "head" || shitloc == "neck") {
        var_d74fc41b6b10ccf5.var_14edc6d1db3695bc = 1;
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1263
// Size: 0x532
function function_863ec3e354fbfe1f(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (istrue(self.var_f327ed481efe4857)) {
        return 0;
    }
    var_d74fc41b6b10ccf5 = spawnstruct();
    var_d74fc41b6b10ccf5.einflictor = einflictor;
    var_d74fc41b6b10ccf5.eattacker = eattacker;
    var_d74fc41b6b10ccf5.idamage = idamage;
    var_d74fc41b6b10ccf5.idflags = idflags;
    var_d74fc41b6b10ccf5.smeansofdeath = smeansofdeath;
    var_d74fc41b6b10ccf5.sweapon = sweapon;
    var_d74fc41b6b10ccf5.vpoint = vpoint;
    var_d74fc41b6b10ccf5.vdir = vdir;
    var_d74fc41b6b10ccf5.shitloc = shitloc;
    var_d74fc41b6b10ccf5.timeoffset = timeoffset;
    var_d74fc41b6b10ccf5.modelindex = modelindex;
    var_d74fc41b6b10ccf5.partname = partname;
    var_d74fc41b6b10ccf5.objweapon = objweapon;
    var_d74fc41b6b10ccf5.var_14edc6d1db3695bc = 0;
    var_d74fc41b6b10ccf5.var_feef4b237a6beb07 = 0;
    if (isdefined(self.var_d37b75616f7c2ee)) {
        var_d74fc41b6b10ccf5.var_9b9dbc948c253172 = self.var_d37b75616f7c2ee.var_9b9dbc948c253172;
    } else {
        var_d74fc41b6b10ccf5.var_9b9dbc948c253172 = 0;
    }
    var_d74fc41b6b10ccf5.var_9b9dbc948c253172++;
    var_29a8ba8c9dd43fd2 = 0;
    if (issharedfuncdefined("zombie", "get_pap_level") && isplayer(var_d74fc41b6b10ccf5.eattacker)) {
        var_29a8ba8c9dd43fd2 = var_d74fc41b6b10ccf5.eattacker function_f3bb4f4911a1beb2("zombie", "get_pap_level", var_d74fc41b6b10ccf5.objweapon);
    }
    var_d74fc41b6b10ccf5.idamage = function_6a0b029f221e0ffe(var_d74fc41b6b10ccf5);
    if (var_29a8ba8c9dd43fd2 >= 1) {
        var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage / 2;
    }
    if (var_d74fc41b6b10ccf5.smeansofdeath == "MOD_PROJECTILE" && isdefined(eattacker) && isdefined(eattacker.var_4d7c50ad1d6ba348)) {
        var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * eattacker.var_4d7c50ad1d6ba348;
    }
    var_d74fc41b6b10ccf5.idamage = function_3c80d46239ce0a0e(var_d74fc41b6b10ccf5, shitloc, var_29a8ba8c9dd43fd2);
    if (isplayer(eattacker) && issharedfuncdefined("player", "onHumanGunPowerupDamage")) {
        adjusted_damage = eattacker [[ getsharedfunc("player", "onHumanGunPowerupDamage") ]](var_d74fc41b6b10ccf5);
        if (adjusted_damage != -1) {
            var_d74fc41b6b10ccf5.idamage = adjusted_damage;
        }
    }
    final_damage = var_d74fc41b6b10ccf5.idamage;
    if (isarray(level.var_8c2b0fd37157f872)) {
        foreach (func in level.var_8c2b0fd37157f872) {
            var_188a38cf4c902143 = self [[ func ]](var_d74fc41b6b10ccf5);
            if (var_188a38cf4c902143 != -1) {
                final_damage = var_188a38cf4c902143;
            }
        }
        var_d74fc41b6b10ccf5.idamage = final_damage;
    }
    if (isdefined(eattacker) && (isplayer(eattacker) || isplayer(eattacker.owner)) && !is_equal(eattacker.team, self.team)) {
        var_678a0776298909d1 = eattacker;
        var_2bd7283211fa61e7 = function_7d4c6e153055ebdc(sweapon);
        if (isplayer(eattacker.owner)) {
            var_678a0776298909d1 = eattacker.owner;
        }
        var_678a0776298909d1.pers["participation"] = 1;
        if (namespace_ac0edc67c1149926::function_9db5f6f105cde5da()) {
            namespace_ac0edc67c1149926::function_c54b2cc2e762c201(var_678a0776298909d1, self, shitloc, smeansofdeath, sweapon, int(final_damage), vpoint, 0, var_2bd7283211fa61e7, var_d74fc41b6b10ccf5.var_14edc6d1db3695bc, 0);
        }
        if (isplayer(eattacker) && final_damage > 0 && (!isdefined(shitloc) || shitloc != "shield")) {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", final_damage >= self.health);
        }
    }
    self.var_d37b75616f7c2ee = var_d74fc41b6b10ccf5;
    callback::callback("on_soldier_ai_damaged", var_d74fc41b6b10ccf5);
    if (isdefined(eattacker) && isdefined(eattacker.var_69b049cf4b18c73b)) {
        n_multiplier = 180;
        if (isdefined(final_damage)) {
            final_damage = final_damage * n_multiplier;
        }
    }
    if (istrue(self.bhasriotshieldattached) && shitloc == "shield") {
        if (isagent(eattacker) && eattacker.unittype == "zombie") {
            self.forcehitlocation = "none";
            final_damage = final_damage * 0.5;
        }
    }
    return int(final_damage);
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x179d
// Size: 0x16a
function private on_soldier_ai_damaged(var_d74fc41b6b10ccf5) {
    if (isplayer(var_d74fc41b6b10ccf5.eattacker) && isdefined(self.var_21a8839dd03e31cd)) {
        self.var_21a8839dd03e31cd = function_6d6af8144a5131f1(self.var_21a8839dd03e31cd, var_d74fc41b6b10ccf5.eattacker);
    }
    if (isdefined(var_d74fc41b6b10ccf5.einflictor) && var_d74fc41b6b10ccf5.einflictor namespace_1f188a13f7e79610::isvehicle() && !isdefined(var_d74fc41b6b10ccf5.einflictor.var_1cb92917037d8996) && isdefined(var_d74fc41b6b10ccf5.smeansofdeath) && var_d74fc41b6b10ccf5.smeansofdeath == "MOD_CRUSH" && !isdefined(var_d74fc41b6b10ccf5.einflictor.var_7fff3293eab0f7b8)) {
        vehicle = var_d74fc41b6b10ccf5.einflictor;
        vehicle.var_7fff3293eab0f7b8 = 1;
        vehicle playrumbleonentity("artillery_rumble_heavy");
        if (isdefined(var_d74fc41b6b10ccf5.idamage) && isdefined(self)) {
            n_damage = int(var_d74fc41b6b10ccf5.idamage * 0.1);
            if (isdefined(level.var_9b695d81b2f8bc58) && level.var_9b695d81b2f8bc58 >= 0) {
                n_damage = min(level.var_9b695d81b2f8bc58, n_damage);
            }
            vehicle thread function_743e37eebd6ba8e2(n_damage);
        }
    }
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x190e
// Size: 0x83
function private on_zombie_ai_killed(params) {
    var_3b5afcfeed8fb9cf = params.eattacker;
    if (isdefined(var_3b5afcfeed8fb9cf) && !isplayer(var_3b5afcfeed8fb9cf) && isplayer(var_3b5afcfeed8fb9cf.owner)) {
        var_3b5afcfeed8fb9cf = var_3b5afcfeed8fb9cf.owner;
    }
    if (isplayer(var_3b5afcfeed8fb9cf)) {
        var_3b5afcfeed8fb9cf thread namespace_ac0edc67c1149926::function_e6d4cd6d0ebc07e1(self, params.einflictor, params.objweapon);
        function_56869e118720ca3b(var_3b5afcfeed8fb9cf);
    }
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1998
// Size: 0x6e
function function_56869e118720ca3b(killer) {
    if (isdefined(killer) && killer namespace_1f188a13f7e79610::isvehicle()) {
        killer = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(killer);
    }
    if (isdefined(killer) && isplayer(killer)) {
        if (!isdefined(killer.agentKills)) {
            killer.agentKills = 1;
        } else {
            killer.agentKills = killer.agentKills + 1;
        }
    }
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a0d
// Size: 0x13
function private function_e5ea18b76842725f(params) {
    namespace_36f464722d326bbe::removefromcharactersarray();
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params e, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a27
// Size: 0x176
function function_73cfe327bdf9d28f(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    if (isplayer(attacker)) {
        if (issharedfuncdefined("zombie", "get_pap_level")) {
            var_29a8ba8c9dd43fd2 = attacker function_f3bb4f4911a1beb2("zombie", "get_pap_level", objweapon);
            if (var_29a8ba8c9dd43fd2 > 0) {
                damage = damage * getdvarfloat(@"hash_9cf7e7a1964e81cc", 0.65);
            }
        }
        if (isdefined(self.team) && self.team != "neutral" && isenemyteam(self.team, attacker.team)) {
            var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
            if (issubstr(var_366b0ecc2f28aead, "jup_jp22_la_dromeo")) {
                occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
                if (isdefined(occupants) && occupants.size > 0) {
                    namespace_d1df78f2235ca173::function_8c5062f666b9bf73(10, attacker);
                }
            }
        }
    }
    namespace_ad22b9cf6a2b30d::callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid);
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ba4
// Size: 0x88
function private function_6a0b029f221e0ffe(var_d74fc41b6b10ccf5) {
    if (var_d74fc41b6b10ccf5.smeansofdeath == "MOD_CRUSH") {
        if (time_has_passed(isdefined(self.var_64c4f7086b0c04f4) ? 0 : self.var_64c4f7086b0c04f4, getdvarfloat(@"hash_52fc7da1ba4e9d11", 1))) {
            self.var_64c4f7086b0c04f4 = gettime();
            return var_d74fc41b6b10ccf5.idamage;
        }
        self.var_64c4f7086b0c04f4 = gettime();
        return 0;
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c34
// Size: 0x57
function function_50dd3eeeda443cb0() {
    /#
        if (getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
            setdvar(@"hash_8a8ff6ed00ccc7a", 0);
        } else {
            setdvar(@"hash_8a8ff6ed00ccc7a", 1);
        }
        iprintlnbold("<unknown string>" + getdvarint(@"hash_8a8ff6ed00ccc7a", 0));
    #/
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c92
// Size: 0x93
function function_3bfa04dc5265d2be() {
    /#
        var_c856dd94cacef4a8 = "<unknown string>";
        if (getdvarint(@"hash_1661f35e34f544eb", 0)) {
            setdvar(@"hash_1661f35e34f544eb", 0);
        } else {
            setdvar(@"hash_1661f35e34f544eb", 1);
            if (!getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
                setdvar(@"hash_8a8ff6ed00ccc7a", 1);
                var_c856dd94cacef4a8 = "<unknown string>";
            }
        }
        iprintlnbold(var_c856dd94cacef4a8 + "<unknown string>" + getdvarint(@"hash_1661f35e34f544eb", 0));
    #/
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d2c
// Size: 0x93
function function_60344a654f5feab9() {
    /#
        var_c856dd94cacef4a8 = "<unknown string>";
        if (getdvarint(@"hash_5e1b3bfc576b756", 0)) {
            setdvar(@"hash_5e1b3bfc576b756", 0);
        } else {
            setdvar(@"hash_5e1b3bfc576b756", 1);
            if (!getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
                setdvar(@"hash_8a8ff6ed00ccc7a", 1);
                var_c856dd94cacef4a8 = "<unknown string>";
            }
        }
        iprintlnbold(var_c856dd94cacef4a8 + "<unknown string>" + getdvarint(@"hash_1661f35e34f544eb", 0));
    #/
}

// Namespace namespace_bfa7544d6e21dd10/namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc6
// Size: 0x5e
function function_b904029d0acf2fd1() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_50dd3eeeda443cb0, 0);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3bfa04dc5265d2be, 0);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_60344a654f5feab9, 0);
        function_fe953f000498048f();
    #/
}

