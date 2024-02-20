// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_46fdf7b12c5f5620;
#using script_3583ff375ab3a91e;
#using script_6172179f6bd0769e;
#using script_2669878cf5a1b6bc;
#using script_371b4c2ab5861e62;
#using scripts\mp\mp_agent.gsc;
#using script_3aa8e63a56e3416;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_10b6724c15a95e8;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_c28694cdd56d5c1a;

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0xd1
function function_25a296c2ed85e35f() {
    if (!level.var_43307855f189eb31.var_82fedf664ad855eb) {
        return;
    }
    function_ff712d25592cc337();
    var_9d3950220a7bba3 = function_5b3f79c906b20510();
    level.var_43307855f189eb31.var_c8fad0c23f319e5b = [];
    foreach (variation in var_9d3950220a7bba3) {
        level.var_43307855f189eb31.var_c8fad0c23f319e5b[variation.var_e0624b9863250a2] = variation;
    }
    level.var_43307855f189eb31.var_cb1a9a6651a906df = getdvarint(@"hash_c2aeee6f21d5d332", 4);
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0
// Size: 0x29
function function_ff712d25592cc337() {
    game["dialog"]["gulag_jailer_incoming"] = "fght_jalr_gutw";
    game["dialog"]["gulag_jailer_arrived"] = "fght_jalr_guji";
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0
// Size: 0xb0
function function_5b3f79c906b20510() {
    var_9d3950220a7bba3 = [];
    var_9d3950220a7bba3[var_9d3950220a7bba3.size] = "stationary_guards";
    var_9d3950220a7bba3[var_9d3950220a7bba3.size] = "mixed_combat";
    var_9d3950220a7bba3[var_9d3950220a7bba3.size] = "combat_rush";
    var_9d3950220a7bba3[var_9d3950220a7bba3.size] = "patrol_guards";
    var_9d3950220a7bba3[var_9d3950220a7bba3.size] = "jailer_guard";
    var_956d22f6fdb80ea1 = [];
    foreach (variation in var_9d3950220a7bba3) {
        var_7877f7a05191a34a = function_d873949dc73d9847(variation);
        if (isdefined(var_7877f7a05191a34a)) {
            var_956d22f6fdb80ea1[var_956d22f6fdb80ea1.size] = var_7877f7a05191a34a;
        }
    }
    return var_956d22f6fdb80ea1;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x788
// Size: 0x21b
function function_d873949dc73d9847(var_e0624b9863250a2) {
    if (isdefined(var_e0624b9863250a2)) {
        var_f53e52e268d0ecbf = function_23773068308f7b86(var_e0624b9863250a2);
        var_597299acd456db1a = getdvarfloat(function_2ef675c13ca1c4af(@"hash_ff06b06505b0fffc", var_e0624b9863250a2), var_f53e52e268d0ecbf);
        if (getdvar(@"hash_865217224dbe397", "") == var_e0624b9863250a2 || var_597299acd456db1a > 0) {
            var_7877f7a05191a34a = spawnstruct();
            var_7877f7a05191a34a.weight = var_597299acd456db1a;
            var_7877f7a05191a34a.var_e0624b9863250a2 = var_e0624b9863250a2;
            switch (var_e0624b9863250a2) {
            case #"hash_bb9a6dbe0d657692":
                var_7877f7a05191a34a.validatefunc = &function_f90bd5ce6fe97249;
                var_7877f7a05191a34a.var_ec2ec5f083df61cd = &function_609b4c8f19884c6d;
                var_7877f7a05191a34a.var_dea1b9b1cdabf819 = &function_d19a7fa3b438d083;
                return var_7877f7a05191a34a;
            case #"hash_c6c45a9602fd8ae1":
                var_7877f7a05191a34a.validatefunc = &function_e1f36d119d6700f4;
                var_7877f7a05191a34a.var_ec2ec5f083df61cd = &function_4e90e3f8408f39f8;
                var_7877f7a05191a34a.var_dea1b9b1cdabf819 = &function_f72c05143dd18bda;
                return var_7877f7a05191a34a;
            case #"hash_810f49d16cc7964c":
                var_7877f7a05191a34a.validatefunc = &function_dbe8fab19ce67ebb;
                var_7877f7a05191a34a.var_ec2ec5f083df61cd = &function_5467c6ba98a48fc7;
                var_7877f7a05191a34a.var_dea1b9b1cdabf819 = &function_93082ea5e92e3815;
                return var_7877f7a05191a34a;
            case #"hash_53a8ebfb578e35d6":
                var_7877f7a05191a34a.validatefunc = &function_2f225e6f823d9505;
                var_7877f7a05191a34a.var_ec2ec5f083df61cd = &function_bfc00912de655901;
                var_7877f7a05191a34a.var_dea1b9b1cdabf819 = &function_a8bf9e61af16ba9f;
                return var_7877f7a05191a34a;
            case #"hash_3f6c88fccde37f5c":
                var_7877f7a05191a34a.validatefunc = &function_cd1a60f4bf6d5907;
                var_7877f7a05191a34a.var_ec2ec5f083df61cd = &function_2badf4089a186133;
                var_7877f7a05191a34a.var_dea1b9b1cdabf819 = &function_536ddeab33ff6b51;
                return var_7877f7a05191a34a;
            default:
                var_7877f7a05191a34a.validatefunc = &function_f90bd5ce6fe97249;
                var_7877f7a05191a34a.var_ec2ec5f083df61cd = &function_609b4c8f19884c6d;
                var_7877f7a05191a34a.var_dea1b9b1cdabf819 = &function_d19a7fa3b438d083;
                return var_7877f7a05191a34a;
                break;
            }
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9aa
// Size: 0x71
function function_23773068308f7b86(var_e0624b9863250a2) {
    if (!isdefined(var_e0624b9863250a2)) {
        return 0;
    }
    switch (var_e0624b9863250a2) {
    case #"hash_bb9a6dbe0d657692":
        return 0;
    case #"hash_c6c45a9602fd8ae1":
        return 0;
    case #"hash_810f49d16cc7964c":
        return 0;
    case #"hash_53a8ebfb578e35d6":
        return 0;
    case #"hash_3f6c88fccde37f5c":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa22
// Size: 0x175
function function_89235e4fe5354b16(arena) {
    if (isdefined(level.var_43307855f189eb31.var_c8fad0c23f319e5b)) {
        var_bc2c7ebc26e6b6f = [];
        foreach (variation in level.var_43307855f189eb31.var_c8fad0c23f319e5b) {
            if (isdefined(variation.validatefunc) && [[ variation.validatefunc ]](arena)) {
                var_bc2c7ebc26e6b6f[var_bc2c7ebc26e6b6f.size] = variation.var_e0624b9863250a2;
            }
        }
        var_55d94b80d7d0a4a = getdvar(@"hash_865217224dbe397", "");
        var_3cb75658113711a4 = "stationary_guards";
        if (var_55d94b80d7d0a4a == "") {
            var_3cb75658113711a4 = function_9ce8f3ade5c16fb7(var_bc2c7ebc26e6b6f);
        } else if (isdefined(level.var_43307855f189eb31.var_c8fad0c23f319e5b[var_55d94b80d7d0a4a])) {
            var_3cb75658113711a4 = var_55d94b80d7d0a4a;
        } else {
            function_24601896fe5fa52("Invalid Variation Type given for override. Using default variation.");
        }
        var_9a8b9da48e504ed3 = level.var_43307855f189eb31.var_c8fad0c23f319e5b[var_3cb75658113711a4];
        if (isdefined(var_9a8b9da48e504ed3.var_ec2ec5f083df61cd)) {
            arena.var_a88cd2794ae356a7 = var_9a8b9da48e504ed3;
            [[ var_9a8b9da48e504ed3.var_ec2ec5f083df61cd ]](arena);
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0x11d
function function_9ce8f3ade5c16fb7(var_50f938af0ffcde52) {
    var_c35d9f1adc6b131f = 0;
    var_414d201bfca427a2 = [];
    foreach (var_40ef999c46820a15 in var_50f938af0ffcde52) {
        var_7877f7a05191a34a = level.var_43307855f189eb31.var_c8fad0c23f319e5b[var_40ef999c46820a15];
        /#
            assert(isdefined(var_7877f7a05191a34a));
        #/
        var_597299acd456db1a = var_7877f7a05191a34a.weight;
        var_c35d9f1adc6b131f = var_c35d9f1adc6b131f + var_597299acd456db1a;
        var_414d201bfca427a2[var_40ef999c46820a15] = var_c35d9f1adc6b131f;
    }
    var_f3fd55934af8f5d1 = randomfloat(var_c35d9f1adc6b131f);
    foreach (var_40ef999c46820a15 in var_50f938af0ffcde52) {
        if (var_414d201bfca427a2[var_40ef999c46820a15] >= var_f3fd55934af8f5d1) {
            return var_40ef999c46820a15;
        }
    }
    return "stationary_guards";
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc3
// Size: 0x2c
function private function_24601896fe5fa52(message) {
    if (getdvarint(@"hash_ac25b65055b213b3", 1)) {
        logstring("AI GULAG VARIATIONS: " + message);
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf6
// Size: 0xe
function function_f90bd5ce6fe97249(arena) {
    return 1;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0c
// Size: 0x65
function function_609b4c8f19884c6d(arena) {
    foreach (var_55e69fb0ce97f15e in arena.var_79f102b3abcc6f8a) {
        thread function_ca641bb5167e4a5b(arena, var_55e69fb0ce97f15e);
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd78
// Size: 0x142
function function_ca641bb5167e4a5b(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34, var_7ca24826046f8ee3, nationality) {
    level endon("game_ended");
    if (!isdefined(var_1439f86640d42e34)) {
        var_1439f86640d42e34 = "smg";
    }
    aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, var_7ca24826046f8ee3, nationality);
    spawnlocation = var_55e69fb0ce97f15e.origin;
    if (!getdvarint(@"hash_b3d7a9483362813e", 0)) {
        spawnlocation = getclosestpointonnavmesh(var_55e69fb0ce97f15e.origin);
    }
    agent = ai_mp_requestSpawnAgent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    if (isagent(agent)) {
        agent thread function_c31f3a6ef58a2928(arena);
        if (getdvarint(@"hash_b3d7a9483362813e", 0)) {
            agent forceteleport(spawnlocation, var_55e69fb0ce97f15e.angles);
            agent setgoalpos(agent.origin, 32);
            agent clearpath();
            agent.fixednode = 1;
            agent thread function_b11c1964f528574b(agent, 1, agent.origin);
        } else {
            agent thread function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec1
// Size: 0x14
function function_d19a7fa3b438d083(arena, var_536ac6b9e3d2178) {
    
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedc
// Size: 0xe
function function_e1f36d119d6700f4(arena) {
    return 1;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef2
// Size: 0xf2
function function_4e90e3f8408f39f8(arena) {
    foreach (var_55e69fb0ce97f15e in arena.var_79f102b3abcc6f8a) {
        if (isstartstr(var_55e69fb0ce97f15e.script_noteworthy, "gulag_ai_enemy_armory")) {
            thread function_55efd2583d54df2a(arena, var_55e69fb0ce97f15e, undefined, 2);
        } else if (isstartstr(var_55e69fb0ce97f15e.script_noteworthy, "gulag_ai_enemy_meeting")) {
            thread function_ca641bb5167e4a5b(arena, var_55e69fb0ce97f15e, undefined, 2);
        } else if (isstartstr(var_55e69fb0ce97f15e.script_noteworthy, "gulag_ai_enemy_economy")) {
            thread function_55efd2583d54df2a(arena, var_55e69fb0ce97f15e);
        } else if (isstartstr(var_55e69fb0ce97f15e.script_noteworthy, "gulag_ai_enemy_bar")) {
            thread function_ca641bb5167e4a5b(arena, var_55e69fb0ce97f15e);
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfeb
// Size: 0x14
function function_f72c05143dd18bda(arena, var_536ac6b9e3d2178) {
    
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1006
// Size: 0xe
function function_dbe8fab19ce67ebb(arena) {
    return 1;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101c
// Size: 0x65
function function_5467c6ba98a48fc7(arena) {
    foreach (var_55e69fb0ce97f15e in arena.var_79f102b3abcc6f8a) {
        thread function_55efd2583d54df2a(arena, var_55e69fb0ce97f15e);
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1088
// Size: 0xe9
function function_55efd2583d54df2a(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34, var_7ca24826046f8ee3, nationality) {
    level endon("game_ended");
    if (!isdefined(var_1439f86640d42e34)) {
        var_1439f86640d42e34 = "smg";
    }
    aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, var_7ca24826046f8ee3, nationality);
    spawnlocation = getclosestpointonnavmesh(var_55e69fb0ce97f15e.origin);
    agent = ai_mp_requestSpawnAgent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    if (isagent(agent)) {
        agent thread function_c31f3a6ef58a2928(arena);
        arena waittill("ai_gulag_matchStarted");
        var_c5e7fce963586ec0 = arena.fightspawns[0].origin;
        agent thread function_a5117518725da028(agent, var_c5e7fce963586ec0);
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1178
// Size: 0x14
function function_93082ea5e92e3815(arena, var_536ac6b9e3d2178) {
    
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1193
// Size: 0xe
function function_2f225e6f823d9505(arena) {
    return 1;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a9
// Size: 0x1e7
function function_bfc00912de655901(arena) {
    var_deb852aee36cbaf9 = getdvarint(@"hash_f8fe15aaf2f77c90", 3);
    if (var_deb852aee36cbaf9 <= 0) {
        return;
    }
    var_4d0dec66237fe9ae = getdvarfloat(@"hash_fab0873e75ed4193", 8);
    var_3c3d57fd381f981b = 0;
    var_bfe291b401a9bf2a = array_randomize(arena.var_79f102b3abcc6f8a);
    var_1439f86640d42e34 = undefined;
    if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena) && level.var_43307855f189eb31.var_cb1a9a6651a906df == 4) {
        var_1439f86640d42e34 = "jugg";
        if (!isdefined(level.bosses)) {
            level.bosses = [];
            namespace_817a152f5a5554f8::function_4c60c607a6e7b9ae();
            foreach (boss in level.bosses) {
                if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", boss.name, "_disabled"), 0) > 0) {
                    boss.disabled = 1;
                } else if (isdefined(boss.var_ec2ec5f083df61cd)) {
                    [[ boss.var_ec2ec5f083df61cd ]](boss);
                }
            }
        }
    }
    foreach (var_55e69fb0ce97f15e in var_bfe291b401a9bf2a) {
        thread function_287401a3027db2bf(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34, level.var_43307855f189eb31.var_cb1a9a6651a906df, undefined, var_4d0dec66237fe9ae);
        var_3c3d57fd381f981b++;
        if (var_3c3d57fd381f981b >= var_deb852aee36cbaf9) {
            break;
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1397
// Size: 0x14
function function_a8bf9e61af16ba9f(arena, var_536ac6b9e3d2178) {
    
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b2
// Size: 0x255
function function_287401a3027db2bf(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34, var_7ca24826046f8ee3, nationality, var_4d0dec66237fe9ae) {
    level endon("game_ended");
    if (!isdefined(var_1439f86640d42e34)) {
        var_1439f86640d42e34 = "smg";
    }
    agent = undefined;
    spawnlocation = var_55e69fb0ce97f15e.origin;
    spawnlocation = getgroundposition(spawnlocation, 12);
    if (var_1439f86640d42e34 == "jugg") {
        var_55e69fb0ce97f15e.origin = spawnlocation;
        agent = namespace_817a152f5a5554f8::function_7f6818be5068dd4e(var_55e69fb0ce97f15e, "gulag");
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sm_aviktor", [0:"thermal01", 1:"none", 2:"none", 3:"none", 4:"silencer01_sm", 5:"laserirsmg"], "none", "none");
        agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon);
    } else {
        aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, var_7ca24826046f8ee3, nationality);
        agent = ai_mp_requestSpawnAgent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    }
    if (!isdefined(agent)) {
        function_24601896fe5fa52("Agent failed to spawn in arena: " + arena.gulagindex);
        return;
    }
    agent.baseaccuracy = getdvarfloat(@"hash_3ec2e682b32338fe", 0.6);
    agent.accuracy = agent.baseaccuracy;
    agent.maxsightdistsqrd = getdvarfloat(@"hash_1f2b18095c07fd11", 31360000);
    if (isagent(agent)) {
        agent function_c31f3a6ef58a2928(arena);
        agent.var_4d0dec66237fe9ae = var_4d0dec66237fe9ae;
        if (isdefined(arena.var_d7baafc9b07f5094) && arena.var_d7baafc9b07f5094.size > 0) {
            pathstruct = arena.var_d7baafc9b07f5094[randomint(arena.var_d7baafc9b07f5094.size)];
            startindex = function_93e03a3112114bfb(spawnlocation, pathstruct.path);
            level thread function_25cc93d439c3033a([0:agent], pathstruct, startindex);
        } else {
            level thread function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160e
// Size: 0xe
function function_cd1a60f4bf6d5907(arena) {
    return 1;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1624
// Size: 0x14e
function function_2badf4089a186133(arena) {
    if (!isdefined(level.bosses) && namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena) && level.var_43307855f189eb31.var_cb1a9a6651a906df == 4) {
        level.bosses = [];
        namespace_817a152f5a5554f8::function_4c60c607a6e7b9ae();
        foreach (boss in level.bosses) {
            if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", boss.name, "_disabled"), 0) > 0) {
                boss.disabled = 1;
            } else if (isdefined(boss.var_ec2ec5f083df61cd)) {
                [[ boss.var_ec2ec5f083df61cd ]](boss);
            }
        }
    }
    var_55e69fb0ce97f15e = undefined;
    if (getdvarint(@"hash_fbf0c13ab4a94311", 0)) {
        var_55e69fb0ce97f15e = arena.var_198c1cb09f6dbfb1;
    } else {
        var_bfe291b401a9bf2a = array_randomize(arena.var_79f102b3abcc6f8a);
        var_55e69fb0ce97f15e = var_bfe291b401a9bf2a[0];
    }
    thread function_5038458e3ceeb5bd(arena, var_55e69fb0ce97f15e);
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1779
// Size: 0xc3
function function_5e687a5a783b435d(var_fb8418425dc67596) {
    result = [0:-1, 1:-1, 2:-1, 3:-1];
    index = 0;
    foreach (player in var_fb8418425dc67596.gulagarena.arenaplayers) {
        if (index == 4) {
            break;
        }
        if (isdefined(player)) {
            result[index] = float(player getentitynumber());
            index++;
        }
    }
    return result;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1844
// Size: 0x78a
function function_5038458e3ceeb5bd(arena, var_55e69fb0ce97f15e) {
    level endon("game_ended");
    arena endon("matchEnded");
    arena endon("fight_over");
    spawnlocation = var_55e69fb0ce97f15e.origin;
    spawnlocation = getgroundposition(spawnlocation, 12);
    var_55e69fb0ce97f15e.origin = spawnlocation;
    var_7ca24826046f8ee3 = level.var_43307855f189eb31.var_cb1a9a6651a906df;
    var_e46e01e060830b0 = getdvarfloat(@"hash_28fc993237fc1087", 30);
    var_5f9b4fd184dcb3a2 = max(0, getdvarfloat(@"hash_c75fae28e8a2210e", 6));
    delaytime = max(0, var_e46e01e060830b0 - var_5f9b4fd184dcb3a2);
    wait(delaytime);
    if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena) && isarray(arena.arenaplayers)) {
        foreach (player in arena.arenaplayers) {
            player namespace_ad49798629176e96::function_696f54da8fcb6bbe("gulag_jailer_incoming", arena);
        }
    }
    wait(var_5f9b4fd184dcb3a2);
    if (var_7ca24826046f8ee3 == 4) {
        agent = namespace_817a152f5a5554f8::function_7f6818be5068dd4e(var_55e69fb0ce97f15e, "gulag");
    } else {
        var_1439f86640d42e34 = "shotgun";
        aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, var_7ca24826046f8ee3);
        agent = ai_mp_requestSpawnAgent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    }
    if (!isdefined(agent)) {
        function_24601896fe5fa52("Agent failed to spawn in arena: " + arena.gulagindex);
        return;
    }
    weapon = undefined;
    var_39a346ed89fa49ae = getdvar(@"hash_b29e4f282f8eea21", "");
    switch (var_39a346ed89fa49ae) {
    case #"hash_900cb96c552c5e8e":
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sm_aviktor", [0:"thermal01", 1:"none", 2:"none", 3:"none", 4:"silencer01_sm", 5:"none"], "none", "none");
        break;
    case #"hash_40a94c5d9e4e265b":
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_me_fists_mp", [], "none", "none", -1);
        break;
    case #"hash_23209741b93850b5":
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sh_charlie725_mp", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
        break;
    default:
        break;
    }
    body = undefined;
    head = undefined;
    helmet = undefined;
    if (var_7ca24826046f8ee3 < 4) {
        body = "body_sp_opforce_shadow_company_elite_3_1";
        head = "head_sp_opforce_shadow_company_elite_3_1";
        helmet = getdvarint(@"hash_beb5c0190b33fea0", 10);
    } else {
        helmet = getdvarint(@"hash_beb5c0190b33fea0", 1500);
    }
    armor = getdvarint(@"hash_882a30a0c7844f34", 3400);
    agent namespace_34f6a6adabfc542d::set_agent_health(getdvarint(@"hash_971882d628502def", 100));
    var_a664aad02ee98bd2 = getdvarint(@"hash_617969f5d3fa5bb5", "frag_grenade_mp");
    grenadeammo = getdvarint(@"hash_6529e1ace08f3f17", 0);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet, 1);
    agent.var_c5459b9332d53733 = getdvarfloat(@"hash_727c76a293d85e6f", 4);
    agent.maxsightdistsqrd = getdvarfloat(@"hash_fa26f07d026720be", 12250000);
    agent.var_2626d6897d71b728 = getdvarfloat(@"hash_57f1a5678a01b7eb", 12250000);
    agent.var_b4e73b5c37fe850f = getdvarint(@"hash_8b0d1bd49a4054b5", 0);
    agent function_9f82c74eb1b7caf9(0);
    agent.goalradius = getdvarint(@"hash_d9a7939c74c23d34", 3200);
    agent.var_9ff99cfc426066a2 = agent.goalradius;
    agent.ballowexecutions = getdvarint(@"hash_52d3883d39c08659", 1);
    agent.minpaindamage = getdvarint(@"hash_289b813a732c2672", 450);
    agent.var_9440dc8a2aa90aed = getdvarint(@"hash_61ec5d7484718bc9", 500);
    agent.var_7d606bec79308eb5 = getdvarint(@"hash_a0b1e91f87faf171", 768);
    agent.var_85a0f6383a5dd784 = getdvarint(@"hash_f2334aa4fa920550", 512);
    agent.var_a67833fea11a521c = getdvarint(@"hash_95a0623d74d35620", 128);
    agent.var_427cbd3288a2f59 = getdvarint(@"hash_cb0a08edcac4931d", 128);
    agent.var_789bf98b36e292db = getdvarint(@"hash_34a27361609efe2f", 1000);
    agent.var_7878ef8b36bc3525 = getdvarint(@"hash_347f81616078d541", 500);
    var_4aaf2fa9e5d0f74a = 8;
    var_8c0f071f480a9d9a = getdvarfloat(@"hash_8be34599dfa102b8", 30) + getdvarfloat(@"hash_1ff83f4f24656c5b", 30) - getdvarfloat(@"hash_28fc993237fc1087", 25) + var_4aaf2fa9e5d0f74a;
    function_1b688b532168cd14(&function_5e687a5a783b435d);
    agent function_e451eecc3a7441c3("default", var_8c0f071f480a9d9a);
    agent.var_6c66afbc7f2ce4b0 = 1;
    agent.gulagarena = arena;
    agent.var_2a3ca6fc2d0e1cdc = agent.armorhealth + agent.maxhealth;
    agent.var_5888fe9dac2d7d8e = getdvarint(@"hash_2e956fd207e71d5a", 5);
    level.var_c0f958f7943f0cde = &function_d6bf9d11fd14acbc;
    agent function_450e0e26617a68f();
    var_6cfb886a97484c55 = [];
    var_6cfb886a97484c55[var_6cfb886a97484c55.size] = "wz_gulag_jailer_death_a";
    var_6cfb886a97484c55[var_6cfb886a97484c55.size] = "wz_gulag_jailer_death_b";
    var_6cfb886a97484c55[var_6cfb886a97484c55.size] = "wz_gulag_jailer_death_c";
    var_6cfb886a97484c55[var_6cfb886a97484c55.size] = "wz_gulag_jailer_death_d";
    agent.deathstate = "animscripted";
    agent.deathalias = random(var_6cfb886a97484c55);
    if (isagent(agent)) {
        agent namespace_6ea7652ec407cc80::function_82eee32bb4c490d8(arena);
        if (istrue(level.var_43307855f189eb31.var_6712560a5ef54a88)) {
            agent.nocorpse = 1;
        }
        arena notify("Jailer_Spawned");
        agent.ignoreall = 1;
        agent playloopsound("mus_jugg_01_hp");
        agent setclothtype(#"hash_46f0f4be27456e65");
        agent function_8abe5a968cc3c220(#"hash_134cc49a1cabaeda");
        agent function_3f32b2ac35f3ea96(arena);
        level thread function_dabf898f5f2a99e5(agent, arena);
        agent.ignoreall = 0;
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd5
// Size: 0xc
function function_536ddeab33ff6b51(arena) {
    
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe8
// Size: 0xa4
function function_450e0e26617a68f() {
    if (!getdvarint(@"hash_3019c51aaa25b462", 0)) {
        return;
    }
    arena = self.gulagarena;
    gulagplayers = array_combine(arena.arenaplayers, arena.jailedplayers);
    foreach (player in gulagplayers) {
        player setclientomnvar("ui_br_twotwo_gulag_jailer_health", 100);
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2093
// Size: 0x10a
function function_d6bf9d11fd14acbc(idamage) {
    if (isdefined(self.var_2a3ca6fc2d0e1cdc) && isdefined(idamage) && idamage >= 0 && getdvarint(@"hash_3019c51aaa25b462", 0)) {
        var_c047deea265f1e49 = self.health + self.armorhealth;
        var_8c3ce3103e9d62ef = int(ceil(var_c047deea265f1e49 / self.var_2a3ca6fc2d0e1cdc * 100));
        arena = self.gulagarena;
        gulagplayers = array_combine(arena.arenaplayers, arena.jailedplayers);
        foreach (player in gulagplayers) {
            player setclientomnvar("ui_br_twotwo_gulag_jailer_health", var_8c3ce3103e9d62ef);
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a4
// Size: 0x322
function function_3f32b2ac35f3ea96(arena) {
    var_7408385ae587ebad = [];
    var_7408385ae587ebad[var_7408385ae587ebad.size] = "wz_gulag_jailer_enter_a";
    var_7408385ae587ebad[var_7408385ae587ebad.size] = "wz_gulag_jailer_enter_b";
    var_7408385ae587ebad[var_7408385ae587ebad.size] = "wz_gulag_jailer_enter_c";
    var_7408385ae587ebad[var_7408385ae587ebad.size] = "wz_gulag_jailer_enter_d";
    var_feb9ded19a11d621 = [];
    var_feb9ded19a11d621[var_feb9ded19a11d621.size] = "wz_gulag_jailer_enter_doors_a";
    var_feb9ded19a11d621[var_feb9ded19a11d621.size] = "wz_gulag_jailer_enter_doors_b";
    var_feb9ded19a11d621[var_feb9ded19a11d621.size] = "wz_gulag_jailer_enter_doors_c";
    var_feb9ded19a11d621[var_feb9ded19a11d621.size] = "wz_gulag_jailer_enter_doors_d";
    var_f019f5897a011c52 = randomint(4);
    self.animationarchetype = "juggernaut";
    startpos = arena.var_198c1cb09f6dbfb1.origin;
    startangles = arena.var_198c1cb09f6dbfb1.angles;
    animindex = namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("animscripted", var_7408385ae587ebad[var_f019f5897a011c52]);
    xanim = namespace_bf5a1761a8d1bb07::asm_getxanim("animscripted", animindex);
    var_bcf9684c0529009a = getstartorigin(startpos, startangles, xanim);
    var_f20bc08c9fc211a0 = getstartangles(startpos, startangles, xanim);
    self forceteleport(var_bcf9684c0529009a, var_f20bc08c9fc211a0);
    namespace_28edc79fcf2fe234::bb_setanimscripted();
    self asmsetstate(self.asmname, "animscripted");
    self dontinterpolate();
    foreach (player in arena.arenaplayers) {
        player delaycall(0.1, &setplayermusicstate, "mx_mp_br_gulag_juggernaut");
        player delaythread(2.3, &namespace_44abc05161e2e2cb::showsplash, "br_twotwo_gulag_jailer_spawn");
        if (istrue(level.var_43307855f189eb31.var_41ba817a6aa8ea0a)) {
            player delaythread(3.5, &namespace_ad49798629176e96::function_696f54da8fcb6bbe, "gulag_jailer_arrived", arena);
        }
    }
    arena.var_945ac0df95f159b3 scriptmodelplayanimdeltamotionfrompos(var_feb9ded19a11d621[var_f019f5897a011c52], arena.var_198c1cb09f6dbfb1.origin, arena.var_198c1cb09f6dbfb1.angles);
    self aisetanim("animscripted", animindex);
    self animmode("noclip");
    var_228c1f2f3a2d92f1 = getanimlength(xanim);
    wait(var_228c1f2f3a2d92f1);
    thread function_c7e36fcf1462f9af(arena);
    var_3d698930d3181f40 = function_b6d4a15b2927be20(arena);
    animindex = namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("animscripted", "wz_gulag_jailer_well_walk_forward");
    xanim = namespace_bf5a1761a8d1bb07::asm_getxanim("animscripted", animindex);
    var_bcf9684c0529009a = getstartorigin(startpos, startangles, xanim);
    var_f20bc08c9fc211a0 = getstartangles(startpos, startangles, xanim);
    self forceteleport(var_bcf9684c0529009a + (0, 0, 8), var_f20bc08c9fc211a0);
    self dontinterpolate();
    self aisetanim("animscripted", animindex);
    self animmode("noclip");
    var_228c1f2f3a2d92f1 = getanimlength(xanim);
    wait(var_228c1f2f3a2d92f1);
    namespace_28edc79fcf2fe234::bb_clearanimscripted();
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24cd
// Size: 0x205
function function_c7e36fcf1462f9af(arena) {
    var_b14b8cdc38138db8 = 160;
    var_59d38865512dcbf9 = 10;
    var_78a3d5c778457697 = 75;
    var_bf4ceab43c3815c9 = 600;
    var_d88864d300c4668d = 1100;
    var_96db99f7468f1547 = [];
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        var_9d6746d0624b17fb = distance2d(player.origin, arena.var_198c1cb09f6dbfb1.origin);
        var_785b4da79140e397 = abs(player.origin[2] - arena.var_198c1cb09f6dbfb1.origin[2]);
        if (var_9d6746d0624b17fb < var_b14b8cdc38138db8 && var_785b4da79140e397 <= var_59d38865512dcbf9) {
            var_96db99f7468f1547[var_96db99f7468f1547.size] = player;
        }
    }
    foreach (player in var_96db99f7468f1547) {
        var_6a214550d82154a = undefined;
        var_9d6746d0624b17fb = distance2d(player.origin, arena.var_198c1cb09f6dbfb1.origin);
        var_6a214550d82154a = vectornormalize(player.origin - arena.var_198c1cb09f6dbfb1.origin) * ter_op(var_9d6746d0624b17fb < var_78a3d5c778457697, var_d88864d300c4668d, var_bf4ceab43c3815c9);
        player setvelocity(var_6a214550d82154a);
    }
    namespace_9e00394bef0f1e98::shellshock_artilleryearthquake(arena.var_198c1cb09f6dbfb1.origin, undefined, 3.5, var_b14b8cdc38138db8);
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d9
// Size: 0xc
function function_b6d4a15b2927be20(arena) {
    
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ec
// Size: 0x5f
function function_dabf898f5f2a99e5(agent, arena) {
    agent endon("death");
    namespace_2000a83505151e5b::function_1670c315976c767b();
    wait(1);
    agent.meleechargedistvsplayer = 100;
    agent.meleechargedist = 100;
    if (getdvarint(@"hash_8bf4874031af778a", 0)) {
        function_411c2b5ec5acd20a(agent, arena);
        goto LOC_0000005d;
    }
LOC_0000005d:
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2752
// Size: 0x2a8
function function_1b065d8d74e9eb4c(agent, arena) {
    var_a28aceeaa1666056 = getdvarint(@"hash_8d0b6a1b71c97774", 100);
    var_5f246a59ff52b9cb = getdvarint(@"hash_2be23112df934cb6", 8);
    var_624c453a0dace3be = getdvarint(@"hash_f31e28c193ae06a", 0);
    var_8b9c7217fe2ae0e8 = getdvarint(@"hash_47d84e982292419c", 1);
    while (1) {
        while (!agent.baimedataimtarget) {
            waitframe();
        }
        if (var_8b9c7217fe2ae0e8) {
            agent thread namespace_aebb27832287cd3a::cap_start("cap_jugg_sweep", "caps/common/cap_jugg_sweep");
            agent waittill("cap_exit_completed");
        } else {
            var_63a5b32b096323be = agent getshootfrompos();
            var_cff075b05a95577b = agent getshootpos(var_63a5b32b096323be);
            var_5e327849c41b7dd8 = undefined;
            if (isdefined(var_cff075b05a95577b)) {
                var_5e327849c41b7dd8 = var_cff075b05a95577b.shootpos;
            } else {
                var_5e327849c41b7dd8 = agent lastknownpos(agent.enemy);
            }
            forwardvec = vectornormalize(var_5e327849c41b7dd8 - var_63a5b32b096323be);
            agent.dontmelee = 1;
            agent setbtgoalpos(3, agent.origin);
            var_1b785cd99212d6d = forwardvec * 100 + var_63a5b32b096323be;
            var_3ff0c90a7e138c20 = spawn_script_origin(var_1b785cd99212d6d);
            if (var_624c453a0dace3be) {
                thread namespace_d028276791d9cff6::drawsphere(var_3ff0c90a7e138c20.origin, 25, 5, (0, 1, 0));
            }
            level thread function_32308e52ccff8164(var_3ff0c90a7e138c20, agent);
            agent setentitytarget(var_3ff0c90a7e138c20);
            waitframe();
            forwardangles = vectortoangles(forwardvec);
            var_579b30da898346e1 = forwardangles[1] + var_a28aceeaa1666056;
            var_38a99723f45fa9a2 = anglestoforward((0, var_579b30da898346e1, 0)) * distance2d(var_1b785cd99212d6d, var_63a5b32b096323be);
            var_75a658e067e7548c = var_1b785cd99212d6d + var_38a99723f45fa9a2;
            if (var_624c453a0dace3be) {
                thread namespace_d028276791d9cff6::drawsphere(var_75a658e067e7548c, 25, 5, (0, 1, 1));
            }
            var_3ff0c90a7e138c20 moveto(var_75a658e067e7548c, agent.var_5888fe9dac2d7d8e);
            wait(agent.var_5888fe9dac2d7d8e);
            agent forcereloading();
            agent.bulletsinclip = 0;
            agent.dontevershoot = 1;
            agent clearentitytarget();
            var_3ff0c90a7e138c20 delete();
            agent setgoalpos(agent.origin, 10000);
            agent.dontmelee = 0;
            wait(var_5f246a59ff52b9cb);
            agent.dontevershoot = 0;
        }
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a01
// Size: 0x2a
function function_32308e52ccff8164(var_3ff0c90a7e138c20, agent) {
    var_3ff0c90a7e138c20 endon("death");
    agent waittill("death");
    var_3ff0c90a7e138c20 delete();
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a32
// Size: 0x30b
function function_411c2b5ec5acd20a(agent, arena) {
    var_56cd131a91453511 = getdvarfloat(@"hash_15ec5f864d15e41d", 0.5);
    var_6fa953e577adc01e = getdvarfloat(@"hash_e54d8527ee6a429a", 0.4);
    var_600a0cc182c41cbd = getdvarfloat(@"hash_1a17d98123e7f319", 0.1);
    var_de3194c9477b34 = getdvarfloat(@"hash_ecaa9bfa3f51c620", 10);
    while (1) {
        var_c9d16956eb3a9d44 = [];
        var_8980dd54afd4cd16 = 0;
        var_b5bc250d2565700a = 0;
        var_d0c5a54a30143b50 = [];
        var_62f96d9fb747538f = [];
        var_7a9097c1cbfc3bde = [];
        foreach (player in arena.arenaplayers) {
            if (isalive(player)) {
                var_b47a8cc2e1180256 = array_contains(arena.var_801cdcfadc4d465c, player);
                playerid = player getentitynumber();
                var_62f96d9fb747538f = array_add(var_62f96d9fb747538f, player);
                if (var_b47a8cc2e1180256) {
                    var_8980dd54afd4cd16++;
                } else {
                    var_8980dd54afd4cd16--;
                }
                if (isdefined(player.var_a6e0850023a9d8f9)) {
                    if (!isdefined(player.var_9ead71e797f9eebb)) {
                        player.var_9ead71e797f9eebb = 0;
                    }
                    var_d0c5a54a30143b50[playerid] = player.var_a6e0850023a9d8f9 - player.var_9ead71e797f9eebb;
                    var_b5bc250d2565700a = var_b5bc250d2565700a + var_d0c5a54a30143b50[playerid];
                    player.var_9ead71e797f9eebb = player.var_a6e0850023a9d8f9;
                }
            }
        }
        var_62f96d9fb747538f = sortbydistance(var_62f96d9fb747538f, agent.origin);
        var_86380489b943a379 = -1;
        var_22c69a24a1ad0d6a = undefined;
        for (index = 0; index < var_62f96d9fb747538f.size; index++) {
            player = var_62f96d9fb747538f[index];
            playerid = player getentitynumber();
            var_c9d16956eb3a9d44[playerid] = 0;
            if (!istrue(arena.var_5f525e1e05714bb5)) {
                var_b47a8cc2e1180256 = array_contains(arena.var_801cdcfadc4d465c, player);
                if (var_b47a8cc2e1180256 && var_8980dd54afd4cd16 > 0) {
                    var_c9d16956eb3a9d44[playerid] = var_c9d16956eb3a9d44[playerid] + var_56cd131a91453511;
                } else if (!var_b47a8cc2e1180256 && var_8980dd54afd4cd16 < 0) {
                    var_c9d16956eb3a9d44[playerid] = var_c9d16956eb3a9d44[playerid] + var_56cd131a91453511;
                }
            }
            if (isdefined(var_d0c5a54a30143b50[playerid]) && var_b5bc250d2565700a > 0) {
                var_15dbe60970aab166 = var_d0c5a54a30143b50[playerid] / var_b5bc250d2565700a * var_6fa953e577adc01e;
                var_c9d16956eb3a9d44[playerid] = var_c9d16956eb3a9d44[playerid] + var_15dbe60970aab166;
            }
            var_d6f25d5146ebeba0 = (var_62f96d9fb747538f.size - index) / var_62f96d9fb747538f.size * var_600a0cc182c41cbd;
            var_c9d16956eb3a9d44[playerid] = var_c9d16956eb3a9d44[playerid] + var_d6f25d5146ebeba0;
            if (var_c9d16956eb3a9d44[playerid] > var_86380489b943a379) {
                var_86380489b943a379 = var_c9d16956eb3a9d44[playerid];
                var_22c69a24a1ad0d6a = player;
            }
        }
        if (isdefined(var_22c69a24a1ad0d6a)) {
            agent agentsetfavoriteenemy(var_22c69a24a1ad0d6a);
            agent setgoalentity(var_22c69a24a1ad0d6a);
        }
        wait(var_de3194c9477b34);
    }
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d44
// Size: 0xb6
function function_93e03a3112114bfb(origin, path) {
    if (!isdefined(path) || path.size < 1) {
        return undefined;
    }
    index = undefined;
    dist = undefined;
    foreach (i, node in path) {
        newdist = distancesquared(node.origin, origin);
        if (!isdefined(dist) || newdist < dist) {
            dist = newdist;
            index = i;
        }
    }
    return index;
}

// Namespace namespace_c28694cdd56d5c1a/namespace_ff791f8cbfc671f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e02
// Size: 0x5f
function function_62729cb2f806997a(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34) {
    level endon("game_ended");
    var_4d0dec66237fe9ae = self.var_4d0dec66237fe9ae;
    if (isdefined(var_4d0dec66237fe9ae)) {
        wait(var_4d0dec66237fe9ae);
    }
    level thread function_287401a3027db2bf(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34, level.var_43307855f189eb31.var_cb1a9a6651a906df, undefined, var_4d0dec66237fe9ae);
}

