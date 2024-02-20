// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_26660ae1076e2d99;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_6cb0280f7aa7d3cd;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_188008b85f8b14d4;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_419eebc6f24e287;
#using scripts\mp\gamelogic.gsc;
#using script_3ff084f114b7f6c9;

#namespace namespace_5a187497fd5f85f2;

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x295
// Size: 0x35f
function function_5ba1bb4933edc5da() {
    level.var_7481c0699a7c035c = getdvarint(@"hash_f996b86ac195da4e", 1);
    if (!function_217e5c3b8a4ca539() || !level.var_7481c0699a7c035c) {
        return;
    }
    namespace_71073fa38f11492::enablefeature("player_bounty");
    level.var_2ccb3bb7c65824bd = getdvarint(@"hash_bb981387b47d3b0a", 7);
    level.var_9918180a152a2c49 = getdvarint(@"hash_b0d283949fa83cfe", 8);
    level.var_42413476c36f4de9 = getdvarfloat(@"hash_d3d9b12ad067b71a", 0.1);
    level.var_ea588ca4581980e3 = getdvarfloat(@"hash_9283db15697679a8", 3);
    level.var_66901f8a5a5028d2 = getdvarint(@"hash_8b4fd26f8d0f1f27", 60) * 1000;
    level.var_c33be36f17c6f1c4 = getdvarint(@"hash_de0a66da13bf686d", 60) * 1000;
    level.var_33081ad92157d89 = getdvarint(@"hash_7e7e58269eec0c4c", 4096);
    level.var_30cb0ad9930b995b = getdvarint(@"hash_88fbe092f035854e", 1000);
    level.var_8c5f100dfcbd8eca = getdvarint(@"hash_17211ebb2d6e7fdc", 120);
    level.var_30dc2b175c83ce3b = getdvarfloat(@"hash_e15493bf7aa7d925", 0.25);
    level.var_da85db0b3fd47276 = getdvarfloat(@"hash_71ca88ed28116f2e", 1.5);
    level.var_c7b897c856840e47 = getdvarfloat(@"hash_a75878fca2a61a60", 0.25);
    level.var_b404cefc87a66195 = getdvarfloat(@"hash_c01362bafd123e2", 1);
    level.var_2c5b630622af3240 = getdvarint(@"hash_9006008df935add2", 4);
    level.var_13a790a07dc25d17 = getdvarfloat(@"hash_2547f1e25cbfa8bc", 0.5);
    level.var_b0db22c3e521dd39 = getdvarfloat(@"hash_ffd443b9cee024f6", 1);
    level.var_a13977795d78d39c = getdvarint(@"hash_4dc3c6509a8ba03e", 4);
    level.var_18e721fdd859ea38 = getdvarint(@"hash_ee7f29468bcf226f", 2);
    level.var_5353dacaef431f99 = getdvarfloat(@"hash_cebe90dac8b47fc", 0.25);
    level.var_153696eee67770d3 = getdvarint(@"hash_43ed1d607588204e", 3);
    level.var_a767584fed5587e8 = getdvarfloat(@"hash_96b1854ee4098c22", 1.5);
    level.var_f8a9056ab7fc0fa4 = getdvarfloat(@"hash_1627ed73590ddd4f", 0.5);
    level.var_ea415dd712d4dc36 = getdvarint(@"hash_7d402a6d000f55c5", 1);
    level.var_22f3f5dfaf76570c = getdvarint(@"hash_fc41fa9f3257837a", 1);
    level.var_f50f4e9c206bacd = getdvarint(@"hash_ff69c5cbcbfc5fc0", 1500);
    level.var_29d13063d54a343e = getdvarint(@"hash_3a113f3a21a87f53", 5);
    level.var_c2812f877fae7f90 = getdvarint(@"hash_774b8b91e4bcda07", 0);
    level.var_2d99c1a64eab0ce3 = getdvarfloat(@"hash_ffc46b09301c5eb6", 5);
    level.var_1384a410983757e1 = [];
    level.var_c704d3de31dfe51f = [];
    namespace_fd8ff6a1c9b4f3c7::function_95c943d6949814d1(&function_c7aa23953196010a);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_9dcdfd37eeab85e);
    /#
        level thread function_49601a5b7595734c();
    #/
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fb
// Size: 0x228
function function_47ef2434c27b063c(victim, attacker, meansofdeath, var_2e81af6d411890c9) {
    if (!namespace_71073fa38f11492::isfeatureenabled("player_bounty")) {
        return;
    }
    if (!function_217e5c3b8a4ca539() || !level.var_7481c0699a7c035c || !isdefined(level.var_1384a410983757e1)) {
        return;
    }
    if (!isdefined(attacker) || !isdefined(victim) || !isplayer(attacker) || !isplayer(victim)) {
        return;
    }
    if (!isdefined(attacker.pers) || !isdefined(victim.pers)) {
        return;
    }
    wassuicide = isdefined(meansofdeath) && (meansofdeath == "MOD_SUICIDE" || meansofdeath == "MOD_FALLING") || isdefined(attacker) && attacker == victim;
    if (wassuicide) {
        return;
    }
    if (!function_760c732463d67abd(victim, attacker)) {
        return;
    }
    attackerid = attacker namespace_7e17181d03156026::getuniqueid();
    var_48b7b944a7a02b2c = victim namespace_7e17181d03156026::getuniqueid();
    if (!isdefined(level.var_1384a410983757e1[attackerid])) {
        level.var_1384a410983757e1[attackerid] = spawnstruct();
        level.var_1384a410983757e1[attackerid].victims = [];
        level.var_1384a410983757e1[attackerid].score = 0;
        level.var_1384a410983757e1[attackerid].lastkilltime = 0;
    }
    if (function_c54f9c19d5062c2d(attackerid, var_48b7b944a7a02b2c) && !isdefined(var_2e81af6d411890c9)) {
        return;
    }
    currenttime = gettime();
    level.var_1384a410983757e1[attackerid].victims[var_48b7b944a7a02b2c] = currenttime + level.var_66901f8a5a5028d2;
    lastscore = function_9d1edaafd9ae1f43(attackerid);
    level.var_1384a410983757e1[attackerid].score = function_49514c83ede61c52(attackerid, attacker, victim);
    level.var_1384a410983757e1[attackerid].lastkilltime = currenttime;
    if (isdefined(var_2e81af6d411890c9)) {
        level.var_1384a410983757e1[attackerid].score = var_2e81af6d411890c9;
    }
    function_c115071fc3ad7124(attacker, lastscore);
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82a
// Size: 0x1bd
function function_625d7eecad65e25f(var_cc75e0b74ee84d57) {
    var_4eebf10183cb21f2 = var_cc75e0b74ee84d57.var_4eebf10183cb21f2;
    var_54920cbb1f92b9ea = var_cc75e0b74ee84d57.var_54920cbb1f92b9ea;
    var_2329e2336d8412bc = [];
    if (isdefined(var_4eebf10183cb21f2)) {
        var_2329e2336d8412bc = getteamdata(var_4eebf10183cb21f2, "players");
        foreach (player in var_2329e2336d8412bc) {
            if (namespace_f8065cafc523dba5::isreallyalive(player)) {
                namespace_27cdbf2464b21c84::function_ed4c2d913d203bf([0:player], "bounty_completed", level.var_2d99c1a64eab0ce3);
            }
        }
    } else if (isdefined(var_54920cbb1f92b9ea)) {
        var_2329e2336d8412bc[var_2329e2336d8412bc.size] = var_54920cbb1f92b9ea;
        namespace_27cdbf2464b21c84::function_ed4c2d913d203bf([0:var_54920cbb1f92b9ea], "bounty_completed", level.var_2d99c1a64eab0ce3);
    }
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_plunder_cash_common_1");
    foreach (player in var_2329e2336d8412bc) {
        player namespace_c6ccccd95254983f::playerplunderpickup(level.var_30cb0ad9930b995b);
        if (isdefined(lootid)) {
            level thread function_8723026f5a8e1127(player, lootid, level.var_2d99c1a64eab0ce3);
        }
    }
    if (isdefined(var_cc75e0b74ee84d57.player)) {
        attackerid = var_cc75e0b74ee84d57.player namespace_7e17181d03156026::getuniqueid();
        level.var_1384a410983757e1[attackerid] = undefined;
        var_cc75e0b74ee84d57.player.var_69a9151e7de440f1 = undefined;
    }
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ee
// Size: 0xf5
function function_87e294701a141ce(var_cc75e0b74ee84d57, player) {
    if (var_cc75e0b74ee84d57.player.team == player.team) {
        return;
    }
    if (!isdefined(var_cc75e0b74ee84d57.watcher)) {
        var_cc75e0b74ee84d57.watcher = [];
    }
    currenttime = gettime();
    playerid = player namespace_7e17181d03156026::getuniqueid();
    if (!isdefined(var_cc75e0b74ee84d57.watcher[playerid])) {
        var_cc75e0b74ee84d57.watcher[playerid] = gettime() + level.var_c33be36f17c6f1c4;
        namespace_27cdbf2464b21c84::function_ed4c2d913d203bf([0:player], "bounty_placed_enemy", level.var_2d99c1a64eab0ce3);
        player namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_killed_nearby_callout", [0:player]);
    } else if (var_cc75e0b74ee84d57.watcher[playerid] < currenttime) {
        var_cc75e0b74ee84d57.watcher[playerid] = undefined;
    }
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaea
// Size: 0x64
function private function_8723026f5a8e1127(player, lootid, waittime) {
    player notify("bounty_reward_delay");
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("bounty_reward_delay");
    wait(waittime + 1);
    view_origin = player getvieworigin();
    player namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, level.var_30cb0ad9930b995b);
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb55
// Size: 0xd
function private function_9dcdfd37eeab85e() {
    level thread function_84703a2ee79a7bba(self);
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 14, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb69
// Size: 0x2ab
function private function_c7aa23953196010a(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (!isbulletdamage(smeansofdeath)) {
        return;
    }
    if (!isdefined(eattacker) || !isdefined(victim) || !isdefined(eattacker.team) || !isdefined(victim.team) || eattacker.team == victim.team) {
        return;
    }
    if (!isdefined(level.var_c704d3de31dfe51f[victim.team])) {
        level.var_c704d3de31dfe51f[victim.team] = [];
    }
    currenttime = gettime();
    if (!isdefined(level.var_c704d3de31dfe51f[victim.team][eattacker.team])) {
        level.var_c704d3de31dfe51f[victim.team][eattacker.team] = spawnstruct();
        level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_6f635bfcc8e71408 = currenttime;
        level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_7a7953de79b5d5c0 = currenttime;
    } else if (isdefined(level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_7a7953de79b5d5c0) && level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_7a7953de79b5d5c0 + level.var_8c5f100dfcbd8eca * 1000 < currenttime) {
        level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_6f635bfcc8e71408 = currenttime;
        level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_7a7953de79b5d5c0 = currenttime;
    } else {
        level.var_c704d3de31dfe51f[victim.team][eattacker.team].var_7a7953de79b5d5c0 = currenttime;
    }
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe1b
// Size: 0x26b
function private function_84703a2ee79a7bba(player) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        forward = position = distance = attacker = player waittill("bulletwhizby");
        if (!isdefined(attacker) || !isdefined(attacker.team) || attacker.team == player.team) {
            continue;
        }
        if (!isdefined(level.var_c704d3de31dfe51f[player.team])) {
            level.var_c704d3de31dfe51f[player.team] = [];
        }
        currenttime = gettime();
        if (!isdefined(level.var_c704d3de31dfe51f[player.team][attacker.team])) {
            level.var_c704d3de31dfe51f[player.team][attacker.team] = spawnstruct();
            level.var_c704d3de31dfe51f[player.team][attacker.team].var_6f635bfcc8e71408 = currenttime;
            level.var_c704d3de31dfe51f[player.team][attacker.team].var_a6c14dfbe6016990 = currenttime;
        } else if (isdefined(level.var_c704d3de31dfe51f[player.team][attacker.team].var_a6c14dfbe6016990) && level.var_c704d3de31dfe51f[player.team][attacker.team].var_a6c14dfbe6016990 + level.var_8c5f100dfcbd8eca * 1000 < currenttime) {
            level.var_c704d3de31dfe51f[player.team][attacker.team].var_6f635bfcc8e71408 = currenttime;
            level.var_c704d3de31dfe51f[player.team][attacker.team].var_a6c14dfbe6016990 = currenttime;
        } else {
            level.var_c704d3de31dfe51f[player.team][attacker.team].var_a6c14dfbe6016990 = currenttime;
        }
    }
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x108d
// Size: 0x115
function private function_5d60f21784f774f4(attacker, victim) {
    if (!isdefined(attacker) || !isdefined(victim)) {
        return 0;
    }
    if (!isdefined(level.var_c704d3de31dfe51f[attacker.team]) || !isdefined(level.var_c704d3de31dfe51f[attacker.team][victim.team])) {
        return 0;
    }
    var_a05ccc186b33a983 = level.var_c704d3de31dfe51f[attacker.team][victim.team].var_6f635bfcc8e71408;
    var_e296cf4b39b5a680 = 0;
    if (isdefined(level.var_c704d3de31dfe51f[victim.team]) && isdefined(level.var_c704d3de31dfe51f[victim.team][attacker.team])) {
        var_e296cf4b39b5a680 = level.var_c704d3de31dfe51f[victim.team][attacker.team].var_6f635bfcc8e71408;
    }
    return var_a05ccc186b33a983 <= var_e296cf4b39b5a680;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11aa
// Size: 0xf3
function private function_760c732463d67abd(victim, attacker) {
    var_48b7b944a7a02b2c = victim namespace_7e17181d03156026::getuniqueid();
    var_773ad909331cee07 = getteamdata(victim.team, "players");
    foreach (teammate in var_773ad909331cee07) {
        var_a779ea1a22e09530 = teammate namespace_7e17181d03156026::getuniqueid();
        if (isdefined(var_a779ea1a22e09530) && isdefined(level.var_1384a410983757e1[var_a779ea1a22e09530]) && isdefined(level.var_1384a410983757e1[var_a779ea1a22e09530].var_cc75e0b74ee84d57)) {
            return 0;
        }
    }
    if (namespace_b11859036e02907d::function_5fac7d775590ecdd(victim.team, attacker.team)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a5
// Size: 0x83
function private function_140a6288c05473fe(player) {
    playerid = player namespace_7e17181d03156026::getuniqueid();
    if (!isdefined(level.var_1384a410983757e1[playerid])) {
        level.var_1384a410983757e1[playerid] = spawnstruct();
        level.var_1384a410983757e1[playerid].victims = [];
        level.var_1384a410983757e1[playerid].score = 0;
        level.var_1384a410983757e1[playerid].lastkilltime = 0;
    }
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x132f
// Size: 0x223
function private function_c115071fc3ad7124(attacker, lastscore) {
    if (istrue(attacker.var_69a9151e7de440f1)) {
        return;
    }
    attackerid = attacker namespace_7e17181d03156026::getuniqueid();
    currentscore = function_9d1edaafd9ae1f43(attackerid);
    var_4597ff2ed063cf9 = function_39c1f2930fd57db5(currentscore);
    var_fbfaa7d0bc334da7 = function_39c1f2930fd57db5(lastscore);
    if (var_4597ff2ed063cf9 == 3 && var_fbfaa7d0bc334da7 != 2) {
        var_4597ff2ed063cf9 = 2;
        level.var_1384a410983757e1[attackerid].score = level.var_9918180a152a2c49 - 0.1;
    }
    if (var_4597ff2ed063cf9 < 3) {
        function_6029f97c06c2236(attacker, var_4597ff2ed063cf9);
        return;
    }
    function_6029f97c06c2236(attacker, var_4597ff2ed063cf9);
    overridesettings = spawnstruct();
    if (level.var_ea415dd712d4dc36) {
        function_59d1b7f99d093e0e(overridesettings);
    } else {
        function_993eb16c9ec92291(overridesettings);
    }
    attacker.var_69a9151e7de440f1 = 1;
    overridesettings.var_652d26f30484afe1 = "ui_map_icon_bounty_s5";
    overridesettings.var_9fccd0c71039eff7 = &function_87e294701a141ce;
    overridesettings.var_88c5361db8dbceac = &function_625d7eecad65e25f;
    var_cc75e0b74ee84d57 = function_4647cbf23f54d6f6(attacker, overridesettings);
    namespace_27cdbf2464b21c84::function_ed4c2d913d203bf([0:attacker], "bounty_placed_self", level.var_2d99c1a64eab0ce3);
    var_8bed5039285f4038 = getteamdata(attacker, "players");
    foreach (player in var_8bed5039285f4038) {
        player setclientomnvar("ui_dmz_bounty_squad_index", attacker.var_3f78c6a0862f9e25);
        if (player != attacker && namespace_f8065cafc523dba5::isreallyalive(player)) {
            namespace_27cdbf2464b21c84::function_ed4c2d913d203bf([0:player], "bounty_placed_friendly", level.var_2d99c1a64eab0ce3);
        }
    }
    level.var_1384a410983757e1[attackerid].var_cc75e0b74ee84d57 = var_cc75e0b74ee84d57;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1559
// Size: 0x4d
function private function_993eb16c9ec92291(overridesettings) {
    overridesettings.var_d66266e27481ace9 = ter_op(level.var_22f3f5dfaf76570c, 2, 0);
    overridesettings.var_40ca706da5962314 = 2;
    overridesettings.var_a0c9c946b5c00006 = level.var_c2812f877fae7f90;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ad
// Size: 0x84
function private function_59d1b7f99d093e0e(overridesettings) {
    overridesettings.var_d66266e27481ace9 = ter_op(level.var_22f3f5dfaf76570c, 2, 0);
    overridesettings.var_40ca706da5962314 = 1;
    overridesettings.circleradius = level.var_f50f4e9c206bacd;
    overridesettings.var_212406c9408b2d05 = level.var_29d13063d54a343e;
    overridesettings.var_e6f187bcb4b1648e = "Bounty_DMZ";
    overridesettings.var_d77771d6bfb89518 = "ui_map_icon_bounty_s5";
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1638
// Size: 0x81
function private function_c54f9c19d5062c2d(attackerid, var_48b7b944a7a02b2c) {
    if (!isdefined(level.var_1384a410983757e1[attackerid].victims) || !isdefined(level.var_1384a410983757e1[attackerid].victims[var_48b7b944a7a02b2c])) {
        return 0;
    }
    cooldowntime = level.var_1384a410983757e1[attackerid].victims[var_48b7b944a7a02b2c];
    currenttime = gettime();
    return cooldowntime <= currenttime;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c1
// Size: 0x4b8
function private function_49514c83ede61c52(attackerid, attacker, victim) {
    currentscore = function_9d1edaafd9ae1f43(attackerid);
    var_bb812ffe48276652 = getdvarint(@"hash_9d43c91bd2b1870e", 1);
    newscore = 1;
    var_ebe73726f006a63f = function_53c4c53197386572(attacker.pers["kills"], 0);
    var_86dbd4c78b4b630a = function_53c4c53197386572(victim.pers["kills"], 0);
    switch (var_bb812ffe48276652) {
    case 1:
        newscore = ter_op(function_5d60f21784f774f4(attacker, victim), level.var_30dc2b175c83ce3b, 1);
        var_a36e49c4e7a7e02d = namespace_d576b6dc7cef9c62::gettimeremainingpercentage();
        var_c5f06dd68c41574 = level.var_da85db0b3fd47276 * ter_op(var_a36e49c4e7a7e02d < 0.75, var_a36e49c4e7a7e02d, 1);
        newscore = newscore * var_c5f06dd68c41574;
        var_e9b7eb3fb1bc573a = getteamdata(victim.team, "players");
        var_f873dca25c9dd763 = getteamdata(attacker.team, "players");
        var_ec3e0c1a53056d7f = 1 + (var_f873dca25c9dd763.size - var_e9b7eb3fb1bc573a.size) / namespace_76a219af07c28c13::getMaxAssimilationTeamSize();
        newscore = newscore * var_ec3e0c1a53056d7f;
        var_8c7e696211fe4f37 = level.var_2c5b630622af3240 / (var_86dbd4c78b4b630a + 1);
        newscore = newscore * clamp(var_8c7e696211fe4f37, level.var_c7b897c856840e47, level.var_b404cefc87a66195);
        var_97761a3c665cbcde = 1;
        foreach (var_78d4262a23453d9e in var_f873dca25c9dd763) {
            var_ec91e42317212dce = function_53c4c53197386572(var_78d4262a23453d9e.pers["kills"], 0);
            var_97761a3c665cbcde = var_97761a3c665cbcde + var_ec91e42317212dce;
        }
        if (var_97761a3c665cbcde >= level.var_153696eee67770d3) {
            foreach (var_78d4262a23453d9e in var_f873dca25c9dd763) {
                if (var_78d4262a23453d9e != attacker) {
                    function_140a6288c05473fe(var_78d4262a23453d9e);
                    var_d91669507fbfa423 = var_78d4262a23453d9e namespace_7e17181d03156026::getuniqueid();
                    var_6ff1df16b93e2a45 = ter_op(function_5d60f21784f774f4(attacker, victim), level.var_30dc2b175c83ce3b, 1);
                    level.var_1384a410983757e1[var_d91669507fbfa423].score = level.var_1384a410983757e1[var_d91669507fbfa423].score + var_6ff1df16b93e2a45;
                }
            }
        }
        var_d893e028fddae063 = getteamdata(victim.team, "aliveCount");
        if (var_d893e028fddae063 <= 0) {
            newscore = newscore * level.var_a767584fed5587e8;
        }
        if (isdefined(victim.attackers)) {
            foreach (assister in victim.attackers) {
                if (isplayer(assister) && assister != attacker && assister != victim) {
                    function_140a6288c05473fe(assister);
                    var_af47de65831fe700 = assister namespace_7e17181d03156026::getuniqueid();
                    var_6ff1df16b93e2a45 = ter_op(function_5d60f21784f774f4(attacker, victim), level.var_30dc2b175c83ce3b, 1);
                    level.var_1384a410983757e1[var_af47de65831fe700].score = level.var_1384a410983757e1[var_af47de65831fe700].score + level.var_f8a9056ab7fc0fa4 * var_6ff1df16b93e2a45;
                }
            }
        }
        if (isdefined(victim.pers["assists"])) {
            var_fddc8aa6f0828e47 = level.var_a13977795d78d39c / (victim.pers["assists"] + 1);
            newscore = newscore * clamp(var_8c7e696211fe4f37, level.var_13a790a07dc25d17, level.var_b0db22c3e521dd39);
        }
        if (var_ebe73726f006a63f + 1 <= level.var_18e721fdd859ea38) {
            newscore = newscore * level.var_5353dacaef431f99;
        }
        break;
    default:
        break;
    }
    newscore = clamp(newscore, level.var_42413476c36f4de9, level.var_ea588ca4581980e3);
    return currentscore + newscore;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b81
// Size: 0x32
function private function_9d1edaafd9ae1f43(attackerid) {
    if (!isdefined(level.var_1384a410983757e1[attackerid])) {
        return 0;
    }
    return level.var_1384a410983757e1[attackerid].score;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bbb
// Size: 0x5a
function function_f59bb0593a8f98a9(player) {
    if (!isdefined(level.var_1384a410983757e1) || !isdefined(player)) {
        return 0;
    }
    playerid = player namespace_7e17181d03156026::getuniqueid();
    if (!isdefined(level.var_1384a410983757e1[playerid])) {
        return 0;
    }
    return level.var_1384a410983757e1[playerid].score;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c1d
// Size: 0x44
function private function_39c1f2930fd57db5(score) {
    threshold = 0;
    if (score > 0) {
        threshold++;
    }
    if (score >= level.var_2ccb3bb7c65824bd) {
        threshold++;
    }
    if (score >= level.var_9918180a152a2c49) {
        threshold++;
    }
    return threshold;
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c69
// Size: 0x92
function private function_6029f97c06c2236(attacker, threshold) {
    switch (threshold) {
    case 1:
        attacker namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_killed_marked_warning_first", [0:attacker]);
        break;
    case 2:
        attacker namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_killed_marked_second", [0:attacker]);
        break;
    case 3:
        attacker namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_killed_marked_final", [0:attacker]);
        break;
    default:
        break;
    }
}

// Namespace namespace_5a187497fd5f85f2/namespace_1bfb3e255db0a9f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d02
// Size: 0x396
function function_49601a5b7595734c() {
    /#
        level endon("<unknown string>");
        level waittill("<unknown string>");
        while (1) {
            dvarval = getdvarint(@"hash_556d37654f88e155", 0);
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            var_8850d9f771525016 = undefined;
            foreach (player in level.players) {
                if (isbot(player) && namespace_f8065cafc523dba5::isreallyalive(player) && player.team != host.team) {
                    var_8850d9f771525016 = player;
                    break;
                }
            }
            if (isdefined(var_8850d9f771525016) && isdefined(host)) {
                switch (dvarval) {
                case 1:
                    function_47ef2434c27b063c(host, var_8850d9f771525016, "<unknown string>", level.var_9918180a152a2c49);
                    break;
                case 2:
                    attackerid = var_8850d9f771525016 namespace_7e17181d03156026::getuniqueid();
                    namespace_8042e17e26cb2c7f::function_a10c4276271c4ad7(level.var_1384a410983757e1[attackerid].var_cc75e0b74ee84d57, 1, 0);
                    level.var_1384a410983757e1[attackerid] = undefined;
                    break;
                case 3:
                    function_47ef2434c27b063c(var_8850d9f771525016, host, "<unknown string>", 7);
                    host.pers["<unknown string>"] = host.pers["<unknown string>"] + 7;
                    break;
                case 4:
                    attackerid = host namespace_7e17181d03156026::getuniqueid();
                    namespace_8042e17e26cb2c7f::function_a10c4276271c4ad7(level.var_1384a410983757e1[attackerid].var_cc75e0b74ee84d57, 1, 0);
                    level.var_1384a410983757e1[attackerid] = undefined;
                    break;
                case 5:
                    foreach (player in level.players) {
                        if (isbot(player) && namespace_f8065cafc523dba5::isreallyalive(player) && player.team == host.team && !function_bc09557189d65e55(player)) {
                            function_47ef2434c27b063c(var_8850d9f771525016, player, "<unknown string>", 7);
                            player.pers["<unknown string>"] = player.pers["<unknown string>"] + 7;
                            break;
                        }
                    }
                    break;
                case 6:
                    foreach (player in level.players) {
                        if (isbot(player) && namespace_f8065cafc523dba5::isreallyalive(player) && player.team == host.team && function_bc09557189d65e55(player)) {
                            attackerid = player namespace_7e17181d03156026::getuniqueid();
                            namespace_8042e17e26cb2c7f::function_a10c4276271c4ad7(level.var_1384a410983757e1[attackerid].var_cc75e0b74ee84d57, 1, 0);
                            level.var_1384a410983757e1[attackerid] = undefined;
                            break;
                        }
                    }
                    break;
                }
            }
            setdvar(@"hash_556d37654f88e155", 0);
            wait(1);
        }
    #/
}

