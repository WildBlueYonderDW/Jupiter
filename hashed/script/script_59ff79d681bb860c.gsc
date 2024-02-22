// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using script_72af5a878a9d3397;
#using scripts\mp\bots\bots.gsc;
#using script_d74ae0b4aa21186;
#using script_7c40fa80892a721;
#using script_40e63dd222434655;
#using scripts\mp\hostmigration.gsc;
#using script_4c9bd9a3bf3f8cf7;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;
#using scripts\mp\equipment.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;

#namespace namespace_dc8eaf12d4db25da;

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245
// Size: 0xa5
function function_21b2d65575e9c0cc(var_a4273e17f90bfbe6) {
    self.var_89dab0876dc8a170 = 1;
    namespace_92443376a63aa4bd::function_3283fdac29887de();
    namespace_e4a5fcd525f0b19b::function_81c6c4218188e7d8();
    bot_set_personality("run_and_gun");
    if (!isdefined(self.var_e2055bf088954e86)) {
        self.var_e2055bf088954e86 = function_15782eaeb4ab0963();
        /#
            assert(isdefined(self.var_e2055bf088954e86));
        #/
    }
    function_142b713a2846f9ac("Spawned");
    function_1e8fe34f5dfdea49(var_a4273e17f90bfbe6);
    self botsetflag("disable_random_goal", 1);
    self botsetflag("allow_slide_for_any_script_goal", 1);
    self botsetflag("ignore_script_weapon", 1);
    namespace_56b9cc3deb6e3f5e::initialize();
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1
// Size: 0x1d0
function function_d55289ceec7cf934() {
    var_11bfc6b0e47d4408 = level.var_eeb46e40d3dfd8be;
    if (!isdefined(var_11bfc6b0e47d4408)) {
        var_8c5d55b0ead80abf = getdvarfloat(@"hash_60ae0d4490076046", 1);
        var_35e09d79ae15a095 = getdvarfloat(@"hash_55ccab727e144f34", 0);
        var_7aac57efd078c334 = getdvarfloat(@"hash_b3f66372fb38fccb", 0);
        var_b5873813dd27a2f2 = getdvarfloat(@"hash_ff9490c8b80cf74f", 0);
        var_f8793c23a0ec47ab = var_8c5d55b0ead80abf + var_35e09d79ae15a095 + var_7aac57efd078c334 + var_b5873813dd27a2f2;
        /#
            assert(var_8c5d55b0ead80abf >= 0);
        #/
        /#
            assert(var_35e09d79ae15a095 >= 0);
        #/
        /#
            assert(var_7aac57efd078c334 >= 0);
        #/
        /#
            assert(var_b5873813dd27a2f2 >= 0);
        #/
        /#
            assert(var_f8793c23a0ec47ab > 0);
        #/
        var_11bfc6b0e47d4408 = spawnstruct();
        var_11bfc6b0e47d4408.var_85ec8c8fb7e29d44 = var_8c5d55b0ead80abf / var_f8793c23a0ec47ab;
        var_11bfc6b0e47d4408.var_3191bfdecbf41aae = var_35e09d79ae15a095 / var_f8793c23a0ec47ab + var_11bfc6b0e47d4408.var_85ec8c8fb7e29d44;
        var_11bfc6b0e47d4408.var_a206039ee7e144ad = var_7aac57efd078c334 / var_f8793c23a0ec47ab + var_11bfc6b0e47d4408.var_3191bfdecbf41aae;
        var_11bfc6b0e47d4408.var_62f1be7958898e07 = var_b5873813dd27a2f2 / var_f8793c23a0ec47ab + var_11bfc6b0e47d4408.var_a206039ee7e144ad;
        level.var_eeb46e40d3dfd8be = var_11bfc6b0e47d4408;
    }
    var_4084c1d43f28940f = randomfloat(1);
    if (var_4084c1d43f28940f < var_11bfc6b0e47d4408.var_85ec8c8fb7e29d44) {
        return "recruit";
    } else if (var_4084c1d43f28940f < var_11bfc6b0e47d4408.var_3191bfdecbf41aae) {
        return "regular";
    } else if (var_4084c1d43f28940f < var_11bfc6b0e47d4408.var_a206039ee7e144ad) {
        return "hardened";
    } else if (var_4084c1d43f28940f < var_11bfc6b0e47d4408.var_62f1be7958898e07) {
        return "veteran";
    } else {
        /#
            assertmsg("GetRandomBotDifficulty(): invalid difficulty, fallback to regular difficulty.");
        #/
        return "regular";
    }
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c8
// Size: 0x9c
function function_15782eaeb4ab0963() {
    var_87acbab9a27b0757 = level.mind.var_87acbab9a27b0757;
    targetvalue = randomfloat(1);
    var_47b598f3ff58a345 = 0;
    foreach (name, personality in var_87acbab9a27b0757) {
        var_47b598f3ff58a345 = var_47b598f3ff58a345 + personality.var_f7a0e9390034c85b;
        if (targetvalue < var_47b598f3ff58a345) {
            return name;
        }
    }
    return undefined;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x127
function function_76ba0b66f2a5ef09(bot) {
    var_c6895f82adec6365 = 0.3;
    var_ccbba16287668f0a = 0;
    var_672cd2a44615cd4d = var_c6895f82adec6365;
    switch (bot botgetdifficulty()) {
    case #"hash_29f66d99d48ef101":
        var_ccbba16287668f0a = getdvarfloat(@"hash_27c78d2661500e49", var_ccbba16287668f0a);
        var_672cd2a44615cd4d = getdvarfloat(@"hash_c6db8f289a513376", var_672cd2a44615cd4d);
        break;
    case #"hash_284b2545dbaa82f7":
        var_ccbba16287668f0a = getdvarfloat(@"hash_1ab2939c54efab3f", var_ccbba16287668f0a);
        var_672cd2a44615cd4d = getdvarfloat(@"hash_71720d5fda9ada04", var_672cd2a44615cd4d);
        break;
    case #"hash_bd9217f8be6084ee":
        var_ccbba16287668f0a = getdvarfloat(@"hash_3fe6928216982556", var_ccbba16287668f0a);
        var_672cd2a44615cd4d = getdvarfloat(@"hash_d3f0c08b944e8c3b", var_672cd2a44615cd4d);
        break;
    case #"hash_b66ed8ef2f4f67f4":
        var_ccbba16287668f0a = getdvarfloat(@"hash_9ee861df3ee7281c", var_ccbba16287668f0a);
        var_672cd2a44615cd4d = getdvarfloat(@"hash_cc3a6aab020970df", var_672cd2a44615cd4d);
        break;
    default:
        /#
            assertmsg("Invalid difficulty name");
        #/
        break;
    }
    return (var_ccbba16287668f0a, var_672cd2a44615cd4d, 0);
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b
// Size: 0x117
function function_d111733407f6518(meansofdeath, victim, attacker, damage, var_498a2226e5aa47ee, var_dfabe685a74f1b33) {
    meansofdeath = function_53c4c53197386572(meansofdeath, "");
    if (meansofdeath == "MOD_TRIGGER_HURT" && isdefined(victim) && istrue(victim.var_76b390d02672ecea)) {
        return 0;
    }
    var_da6ac2eacbad4a17 = isdefined(attacker) && isbot(attacker);
    if (!var_da6ac2eacbad4a17) {
        return damage;
    }
    var_5c83e2a7751cf1fe = isdefined(victim) && isplayer(victim) && !isbot(victim);
    if (var_5c83e2a7751cf1fe) {
        ratio = function_4be81427cc9844c4(attacker, victim, var_498a2226e5aa47ee);
    } else if (istrue(var_dfabe685a74f1b33)) {
        var_afcea1a9ddcd5adc = 0.7;
        ratio = getdvarfloat(@"hash_72dce163d860183a", var_afcea1a9ddcd5adc);
    } else {
        var_9e653cd64bad1cbc = 1.5;
        ratio = getdvarfloat(@"hash_19b1deee03b39dce", var_9e653cd64bad1cbc);
    }
    return damage * ratio;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ba
// Size: 0x101
function function_4be81427cc9844c4(var_81c9e961cbe1a2ab, var_bd4b60a1d502ed7e, var_498a2226e5aa47ee) {
    health = var_bd4b60a1d502ed7e.health;
    maxhealth = var_bd4b60a1d502ed7e.maxhealth;
    if (istrue(var_498a2226e5aa47ee)) {
        if (isdefined(var_bd4b60a1d502ed7e.var_8790c077c95db752)) {
            if (var_bd4b60a1d502ed7e namespace_f8d3520d3483c1::hasarmor()) {
                health = health + var_bd4b60a1d502ed7e namespace_f8d3520d3483c1::function_ac266fc218266d08();
            }
            maxhealth = maxhealth + var_bd4b60a1d502ed7e.var_8790c077c95db752;
        }
    }
    var_47d36f3cb2120a2b = health / maxhealth;
    var_ccbba16287668f0a = 0;
    var_672cd2a44615cd4d = 0;
    var_2ae0fccd506b8b92 = 1;
    if (istrue(var_498a2226e5aa47ee)) {
        result = namespace_bc2665cbe6cf4e1f::function_a12de8d6fa23a4d9();
        if (isdefined(result)) {
            var_ccbba16287668f0a = result[1];
            var_672cd2a44615cd4d = result[2];
            var_2ae0fccd506b8b92 = 0;
        }
    }
    if (var_2ae0fccd506b8b92) {
        result = function_76ba0b66f2a5ef09(var_81c9e961cbe1a2ab);
        var_ccbba16287668f0a = result[0];
        var_672cd2a44615cd4d = result[1];
    }
    return var_47d36f3cb2120a2b * var_ccbba16287668f0a + var_672cd2a44615cd4d;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3
// Size: 0x397
function function_7d92b857142dbdc6(var_50ade409b1e5efcb, team, var_46c357e31a65af85, var_a018df45312ba50f, var_dfc67eaaf62bc0) {
    level.var_9bb484946bcc49b2 = 1;
    var_f1b03ffe289c1025 = gettime() + 15000;
    var_103a2009f383a1a = var_50ade409b1e5efcb.size;
    var_821516dc10ec00f0 = [];
    botindex = var_821516dc10ec00f0.size;
    while (level.players.size < namespace_c52269d70f989750::bot_get_client_limit() && var_821516dc10ec00f0.size < var_103a2009f383a1a && gettime() < var_f1b03ffe289c1025) {
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.05);
        var_89a675c5bde8848f = var_50ade409b1e5efcb[botindex];
        if (isdefined(var_89a675c5bde8848f.xuid)) {
            bot = addbot(var_89a675c5bde8848f.name, var_89a675c5bde8848f.xuid);
        } else {
            bot = addbot(var_89a675c5bde8848f.name);
        }
        if (!isdefined(bot)) {
            /#
                if (gettime() >= var_f1b03ffe289c1025) {
                    println("<unknown string>");
                } else {
                    println("<unknown string>");
                }
            #/
            if (isdefined(var_a018df45312ba50f) && var_a018df45312ba50f) {
                if (isdefined(var_dfc67eaaf62bc0)) {
                    self notify(var_dfc67eaaf62bc0);
                }
                return [];
            }
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
            continue;
        } else {
            /#
                assert(!isdefined(var_89a675c5bde8848f.bot));
            #/
            if (istrue(var_89a675c5bde8848f.uibot)) {
                namespace_c50b30148766aa59::function_b9c4a50390b0b5eb(bot, var_89a675c5bde8848f);
            }
            bot namespace_92443376a63aa4bd::function_3283fdac29887de();
            bot namespace_e4a5fcd525f0b19b::function_81c6c4218188e7d8();
            connecting = spawnstruct();
            connecting.bot = bot;
            connecting.ready = 0;
            connecting.abort = 0;
            connecting.index = botindex;
            connecting.difficulty = var_89a675c5bde8848f.difficulty;
            connecting.var_e2055bf088954e86 = var_89a675c5bde8848f.var_e2055bf088954e86;
            connecting.var_b5517a8d74ed63a3 = var_89a675c5bde8848f.squad;
            var_821516dc10ec00f0[var_821516dc10ec00f0.size] = connecting;
            botteam = ter_op(isdefined(team), team, var_89a675c5bde8848f.team);
            connecting.bot thread namespace_e4a5fcd525f0b19b::spawn_bot_latent(botteam, var_46c357e31a65af85, connecting);
            botindex++;
        }
    }
    /#
        if (gettime() >= var_f1b03ffe289c1025) {
            println("<unknown string>");
        }
    #/
    var_65c7bcbb8685efc3 = 0;
    var_f1b03ffe289c1025 = gettime() + 60000;
    while (var_65c7bcbb8685efc3 < var_821516dc10ec00f0.size && gettime() < var_f1b03ffe289c1025) {
        var_65c7bcbb8685efc3 = 0;
        foreach (connecting in var_821516dc10ec00f0) {
            if (connecting.ready || connecting.abort) {
                var_65c7bcbb8685efc3++;
            }
        }
        wait(0.05);
    }
    var_43ef75c950adab71 = [];
    foreach (connecting in var_821516dc10ec00f0) {
        if (isdefined(connecting.bot)) {
            var_43ef75c950adab71[var_43ef75c950adab71.size] = connecting.bot;
        }
    }
    if (isdefined(var_dfc67eaaf62bc0)) {
        self notify(var_dfc67eaaf62bc0);
    }
    level.var_9bb484946bcc49b2 = undefined;
    return var_43ef75c950adab71;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc62
// Size: 0x88
function function_5e0e534f768708a3(radius, center) {
    center = function_53c4c53197386572(center, self.origin);
    radius = function_53c4c53197386572(radius, 2500);
    var_fc8b7e5e0a42ae83 = 60;
    point = function_fcc75af6225b896b(center, radius, 0.85, 1, self.angles[1] - var_fc8b7e5e0a42ae83, self.angles[1] + var_fc8b7e5e0a42ae83);
    var_3863887fed6f155 = function_207ba502560fa1d2(point);
    return var_3863887fed6f155;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf2
// Size: 0x68
function function_fcc75af6225b896b(origin, radius, var_8108b284f99b128a, var_812bbc84f9c17040, minangle, maxangle) {
    pos = namespace_c5622898120e827f::getrandompointincircle(origin, radius, var_8108b284f99b128a, var_812bbc84f9c17040, 0, 0, minangle, maxangle);
    return function_f8350ab882cc2439((pos[0], pos[1], self.origin[2]));
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd62
// Size: 0x16
function function_142b713a2846f9ac(status) {
    self.status = status;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7f
// Size: 0x16
function function_1e8fe34f5dfdea49(status) {
    self.var_a4273e17f90bfbe6 = status;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9c
// Size: 0xc
function function_9230bcb84b43d245() {
    return self.var_a4273e17f90bfbe6;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0x41
function function_9e400058ef021b03(origin, radius) {
    /#
        assert(radius == 0 || radius >= 4);
    #/
    self botclearscriptgoal();
    self botsetscriptgoal(origin, radius, "tactical", undefined, undefined, 1);
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x82
function function_207ba502560fa1d2(randompoint, maxdistance) {
    dist2d = distance2d(self.origin, randompoint);
    maxdistance = function_53c4c53197386572(maxdistance, 2000);
    if (dist2d > maxdistance) {
        var_536b3e9dad0768fb = vectorlerp(self.origin, randompoint, maxdistance / dist2d);
        randompoint = function_f8350ab882cc2439((var_536b3e9dad0768fb[0], var_536b3e9dad0768fb[1], self.origin[2]));
    }
    return self getclosestreachablepointonnavmesh(randompoint);
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe82
// Size: 0x6d
function function_2c2b5b435027f895(enemy) {
    if (isdefined(enemy) && isdefined(self.scriptenemy) && isdefined(self.enemy) && self.scriptenemy == enemy && self.enemy == enemy) {
        return;
    }
    if (isdefined(enemy)) {
        self botsetscriptenemy(enemy);
    } else {
        self botclearscriptenemy();
    }
    self.scriptenemy = enemy;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef6
// Size: 0x29
function function_ded80385ea7471db(player) {
    return isdefined(player) && istrue(player.connected) && namespace_7e17181d03156026::isreallyalive(player);
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf27
// Size: 0x28
function isvalidplayer(player) {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return namespace_bc2665cbe6cf4e1f::function_36fd4f80d95cd0c4(player);
    } else {
        return namespace_da125b44c190d236::function_36e75380d944a65d(player);
    }
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf56
// Size: 0x24
function function_f309740bc6350c0e(agent) {
    if (!isagent(agent)) {
        return 0;
    }
    if (!isalive(agent)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf82
// Size: 0x7f
function function_42266a7fd7932c50(player) {
    if (!isvalidplayer(player) && !function_f309740bc6350c0e(player)) {
        return 0;
    }
    if (isdefined(player.vehicle) && istrue(player.vehicle.isheli)) {
        var_cea0b2e80126162e = 658;
        if (player.origin[2] - self.origin[2] > var_cea0b2e80126162e) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1009
// Size: 0x35
function function_6ddd1f755a24720f(var_6f7ce33fc2a39bcd) {
    if (var_6f7ce33fc2a39bcd.var_1cd1b7db5606880e == "main" && isdefined(self)) {
        function_2c2b5b435027f895(undefined);
        self botclearscriptgoal();
    }
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1045
// Size: 0x201
function function_cf1a9e98122e3931(target) {
    var_bb7a7034f796af47 = namespace_1a507865f681850e::getequipmentslotammo("primary");
    var_79a42e6a2f51cf87 = namespace_1a507865f681850e::getequipmentslotammo("secondary");
    var_a9fbde0565fc4be7 = isdefined(var_bb7a7034f796af47) && var_bb7a7034f796af47 > 0 || isdefined(var_79a42e6a2f51cf87) && var_79a42e6a2f51cf87 > 0;
    if (var_a9fbde0565fc4be7) {
        var_e1dfc5a054b93827 = distancesquared(self.origin, target.origin);
        var_ffe68641c6dc7cd3 = 211600;
        if (var_e1dfc5a054b93827 < var_ffe68641c6dc7cd3) {
            return;
        }
        var_962e254e583d9e3 = self botcanseeentity(target);
        if (!var_962e254e583d9e3) {
            var_13c4033676c21c00 = target gettagorigin("j_spinelower");
            var_962e254e583d9e3 = namespace_2a184fc4902783dc::can_see_origin(var_13c4033676c21c00);
        }
        if (!var_962e254e583d9e3) {
            var_6c304568af601dbe = vectornormalize(target.origin - self.origin);
            var_dcd388ddc7034fa8 = (var_6c304568af601dbe[1], var_6c304568af601dbe[0] * -1, 0);
            var_95d7facdceab8bb7 = (var_6c304568af601dbe[1] * -1, var_6c304568af601dbe[0], 0);
            var_7a645c4a72dfd237 = [];
            var_7e3c85e8f41644c4 = target gettagorigin("j_mainroot");
            var_7a645c4a72dfd237[var_7a645c4a72dfd237.size] = target gettagorigin("j_head") + (0, 0, 50);
            var_7a645c4a72dfd237[var_7a645c4a72dfd237.size] = var_7e3c85e8f41644c4 + var_dcd388ddc7034fa8 * 50;
            var_7a645c4a72dfd237[var_7a645c4a72dfd237.size] = var_7e3c85e8f41644c4 + var_95d7facdceab8bb7 * 50;
            var_7a645c4a72dfd237[var_7a645c4a72dfd237.size] = var_7e3c85e8f41644c4 + var_dcd388ddc7034fa8 * 100;
            var_7a645c4a72dfd237[var_7a645c4a72dfd237.size] = var_7e3c85e8f41644c4 + var_95d7facdceab8bb7 * 100;
            foreach (point in var_7a645c4a72dfd237) {
                if (namespace_2a184fc4902783dc::can_see_origin(point)) {
                    self botthrowscriptedgrenade(point, "lethal", 1);
                    break;
                }
            }
        }
    }
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x83
function function_ee72e3f03e5196b7(entity) {
    /#
        assert(isent(entity));
    #/
    if (isplayer(entity) && !isbot(entity)) {
        return ("#" + entity function_7a32b0201993d7f7());
    } else if (isdefined(entity.name)) {
        return entity.name;
    } else if (isdefined(entity.var_8aa9efe6383c1d5a)) {
        return entity.var_8aa9efe6383c1d5a;
    }
    return "entity" + entity getentitynumber();
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d8
// Size: 0x16
function function_c73ffcc4d5a2bc9c(notifystr) {
    waitframe();
    if (isdefined(self)) {
        self notify(notifystr);
    }
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f5
// Size: 0x51
function function_57195fc2e39f0e10(var_4690ee88748bdf9b) {
    for (index = 0; index < var_4690ee88748bdf9b.size - 1; index++) {
        current = var_4690ee88748bdf9b[index];
        next = var_4690ee88748bdf9b[index + 1];
        if (current > next) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134e
// Size: 0xad
function function_9d1ab012058221bb(x, var_14ab65671e2b6421, var_ac1f4177a80907ae) {
    /#
        assert(function_57195fc2e39f0e10(var_14ab65671e2b6421));
    #/
    /#
        assert(var_14ab65671e2b6421.size > 0 && var_14ab65671e2b6421.size == var_ac1f4177a80907ae.size);
    #/
    for (i = 0; i < var_14ab65671e2b6421.size; i++) {
        var_1a91606a95a6f428 = var_14ab65671e2b6421[i];
        if (x < var_1a91606a95a6f428) {
            if (i == 0) {
                return var_ac1f4177a80907ae[0];
            } else {
                rate = lerp_fraction(var_14ab65671e2b6421[i - 1], var_1a91606a95a6f428, x);
                return lerp(var_ac1f4177a80907ae[i - 1], var_ac1f4177a80907ae[i], rate);
            }
        }
    }
    return var_ac1f4177a80907ae[var_ac1f4177a80907ae.size - 1];
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1403
// Size: 0xc3
function function_3569a4bec8b9af17(player) {
    if (isdefined(self.attackerdata) && self.attackerdata.size > 0) {
        foreach (attacker in self.attackerdata) {
            if (isdefined(attacker) && isdefined(attacker.attackerent) && attacker.attackerent == player && !istrue(player.inlaststand)) {
                return (gettime() - attacker.lasttimedamaged < 5000);
            }
        }
    }
    return 0;
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ce
// Size: 0x74
function function_479aea2ae06a371c() {
    /#
        var_3f4cc5498664136f = namespace_e4a5fcd525f0b19b::get_human_player();
        if (!isdefined(var_3f4cc5498664136f)) {
            return;
        }
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        level thread function_a47f77af11ab531d();
        var_3f4cc5498664136f thread function_d3d9d9ce8bb3754d();
    #/
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1549
// Size: 0x13a
function function_94d6b8da353cf462(command) {
    /#
        var_32e0e7f0e4419fb0 = "<unknown string>";
        var_c6e53317564be0a = strtok(command, "<unknown string>");
        var_33d0c828e12e3e8e = 0;
        foreach (tok in var_c6e53317564be0a) {
            token = strtok(tok, "<unknown string>");
            count = 1;
            size = token.size;
            foreach (var_1a598a8191bcb170 in token) {
                if (count < size) {
                    var_32e0e7f0e4419fb0 = var_32e0e7f0e4419fb0 + var_1a598a8191bcb170 + "<unknown string>";
                } else {
                    var_32e0e7f0e4419fb0 = var_32e0e7f0e4419fb0 + var_1a598a8191bcb170;
                }
                count++;
            }
            var_33d0c828e12e3e8e++;
            if (var_33d0c828e12e3e8e < var_c6e53317564be0a.size) {
                var_32e0e7f0e4419fb0 = var_32e0e7f0e4419fb0 + "<unknown string>";
            }
        }
        adddebugcommand(var_32e0e7f0e4419fb0);
    #/
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168a
// Size: 0x188
function function_a47f77af11ab531d() {
    /#
        level endon("<unknown string>");
        while (!isdefined(level.players)) {
            wait(1);
        }
        setdvarifuninitialized(@"hash_283524741d876bcd", 0);
        var_bb24f915e23b49e = 0;
        while (1) {
            if (var_bb24f915e23b49e != getdvarint(@"hash_283524741d876bcd", 0)) {
                var_bb24f915e23b49e = getdvarint(@"hash_283524741d876bcd", 0);
                if (var_bb24f915e23b49e > 0) {
                    foreach (player in level.players) {
                        if (!isbot(player)) {
                            continue;
                        }
                        if (isdefined(player.enemy)) {
                            player hudoutlineenable("<unknown string>");
                        } else {
                            player hudoutlineenable("<unknown string>");
                        }
                    }
                } else {
                    foreach (player in level.players) {
                        if (!isbot(player)) {
                            continue;
                        }
                        player hudoutlinedisable();
                    }
                }
            }
            msg = level waittill_any_in_array_or_timeout([0:"<unknown string>"], 1);
            if (msg == "<unknown string>") {
                var_bb24f915e23b49e = !getdvarint(@"hash_283524741d876bcd", 0);
            }
        }
    #/
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1819
// Size: 0x4e3
function function_d3d9d9ce8bb3754d() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_2f602ff4fd08630f", 0);
        setdvarifuninitialized(@"hash_d458c30556bf9e8c", 0);
        var_de5a5558ba4d830a = (1, 0.94902, 0);
        var_c89cc0d4a5adb6d5 = (1, 0.8, 0.5);
        var_76bf76544f2ff143 = 30;
        while (1) {
            var_c38878e340e7114a = getdvarint(@"hash_2f602ff4fd08630f", 0);
            if (var_c38878e340e7114a <= 0) {
                wait(1);
                continue;
            }
            var_cc5690140005fde = getdvarint(@"hash_d458c30556bf9e8c", 0);
            foreach (bot in level.players) {
                eliminated = namespace_36f464722d326bbe::isbrstylegametype() && bot namespace_bc2665cbe6cf4e1f::iseliminated();
                if (!isbot(bot) || eliminated) {
                    continue;
                }
                if (var_cc5690140005fde) {
                    bots = namespace_54d20dd0dd79277f::getteamdata(bot.team, "<unknown string>");
                    foreach (teammate in bots) {
                        if (teammate == bot || !isvalidplayer(teammate)) {
                            continue;
                        }
                        line(bot.origin, teammate.origin, (0, 0, 1), 1, 0, 1);
                    }
                }
                scale = 0.75;
                if (var_c38878e340e7114a == 2) {
                    distance = distance(self.origin, bot.origin);
                    scale = distance * 0.65 / 600;
                    if (scale < 0.4) {
                        scale = 0.4;
                    }
                }
                linespacing = -1 / scale * 10;
                var_170eade86c1cb4fb = bot.origin;
                var_13c5603d4beea2fc = namespace_a9c534dc7832aba4::playergetspectatingplayer();
                var_89bee820769f600d = isdefined(var_13c5603d4beea2fc) && var_13c5603d4beea2fc == bot;
                var_2586bb7195d68847 = 600;
                var_2586ba7195d68614 = 700;
                var_3b3911dbb789b1d = "<unknown string>" + bot.team + "<unknown string>" + bot.name;
                print3d(var_170eade86c1cb4fb, var_3b3911dbb789b1d, var_de5a5558ba4d830a, 1, scale, 1);
                var_170eade86c1cb4fb = var_170eade86c1cb4fb + (0, 0, linespacing);
                if (var_89bee820769f600d) {
                    printtoscreen2d(var_2586bb7195d68847, var_2586ba7195d68614, var_3b3911dbb789b1d, var_c89cc0d4a5adb6d5, 1.5);
                    var_2586ba7195d68614 = var_2586ba7195d68614 + var_76bf76544f2ff143;
                }
                if (isdefined(bot.status) && bot.status.size > 0) {
                    var_3b3911dbb789b1d = "<unknown string>" + bot.status;
                    if (isdefined(bot.var_e2055bf088954e86)) {
                        var_3b3911dbb789b1d = var_3b3911dbb789b1d + "<unknown string>" + bot function_d72fc34d742ef919();
                    }
                    var_3b3911dbb789b1d = var_3b3911dbb789b1d + "<unknown string>" + bot function_21fe18b1e1e83a2a();
                    print3d(var_170eade86c1cb4fb, var_3b3911dbb789b1d, var_de5a5558ba4d830a, 1, scale, 1);
                    var_170eade86c1cb4fb = var_170eade86c1cb4fb + (0, 0, linespacing);
                    if (var_89bee820769f600d) {
                        printtoscreen2d(var_2586bb7195d68847, var_2586ba7195d68614, var_3b3911dbb789b1d, var_c89cc0d4a5adb6d5, 1.5);
                        var_2586ba7195d68614 = var_2586ba7195d68614 + var_76bf76544f2ff143;
                    }
                }
                if (isdefined(bot.mind)) {
                    var_c7fdf89d998c52f1 = 3;
                    var_577f45571c039a54 = bot namespace_56b9cc3deb6e3f5e::function_e3becfc53745debe(var_c7fdf89d998c52f1);
                    if (var_577f45571c039a54.size > 0) {
                        print3d(var_170eade86c1cb4fb, "<unknown string>" + var_577f45571c039a54, var_de5a5558ba4d830a, 1, scale, 1);
                        if (var_89bee820769f600d) {
                            printtoscreen2d(var_2586bb7195d68847, var_2586ba7195d68614, "<unknown string>" + var_577f45571c039a54, var_c89cc0d4a5adb6d5, 1.5);
                        }
                    }
                    var_170eade86c1cb4fb = var_170eade86c1cb4fb + (0, 0, linespacing);
                    if (var_89bee820769f600d) {
                        var_2586ba7195d68614 = var_2586ba7195d68614 + var_76bf76544f2ff143;
                    }
                    actions = bot namespace_56b9cc3deb6e3f5e::function_895e12d8ae226936();
                    if (actions.size > 0) {
                        print3d(var_170eade86c1cb4fb, "<unknown string>" + actions, var_de5a5558ba4d830a, 1, scale, 1);
                        var_170eade86c1cb4fb = var_170eade86c1cb4fb + (0, 0, linespacing);
                        if (var_89bee820769f600d) {
                            printtoscreen2d(var_2586bb7195d68847, var_2586ba7195d68614, "<unknown string>" + actions, var_c89cc0d4a5adb6d5, 1.5);
                            var_2586ba7195d68614 = var_2586ba7195d68614 + var_76bf76544f2ff143;
                        }
                    }
                    lasterror = bot namespace_56b9cc3deb6e3f5e::function_7ec4108a3d7a4091();
                    if (isdefined(lasterror)) {
                        var_3b3911dbb789b1d = "<unknown string>" + lasterror;
                        print3d(var_170eade86c1cb4fb, var_3b3911dbb789b1d, var_de5a5558ba4d830a, 1, scale, 1);
                        var_170eade86c1cb4fb = var_170eade86c1cb4fb + (0, 0, linespacing);
                        if (var_89bee820769f600d) {
                            printtoscreen2d(var_2586bb7195d68847, var_2586ba7195d68614, var_3b3911dbb789b1d, var_c89cc0d4a5adb6d5, 1.5);
                            var_2586ba7195d68614 = var_2586ba7195d68614 + var_76bf76544f2ff143;
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d03
// Size: 0x6d
function function_d72fc34d742ef919() {
    /#
        switch (self.var_e2055bf088954e86) {
        case #"hash_7038dec66d8275be":
            return "<unknown string>";
        case #"hash_6191aaef9f922f96":
            return "<unknown string>";
        case #"hash_2a3c28f3f1f0f8a":
            return "<unknown string>";
        default:
            /#
                assertmsg("<unknown string>");
            #/
            return "<unknown string>";
            break;
        }
    #/
}

// Namespace namespace_dc8eaf12d4db25da/namespace_41f4dfb71dd08362
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d77
// Size: 0x7c
function function_21fe18b1e1e83a2a() {
    /#
        switch (self botgetdifficulty()) {
        case #"hash_29f66d99d48ef101":
            return "<unknown string>";
        case #"hash_284b2545dbaa82f7":
            return "<unknown string>";
        case #"hash_bd9217f8be6084ee":
            return "<unknown string>";
        case #"hash_b66ed8ef2f4f67f4":
            return "<unknown string>";
        default:
            /#
                assertmsg("<unknown string>");
            #/
            return "<unknown string>";
            break;
        }
    #/
}

