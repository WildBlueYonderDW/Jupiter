// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\player.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1174abedbefe9ada;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\gasmask.gsc;
#using script_156835ef9924856a;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_e47cc086b3a2ff1d;

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b
// Size: 0x450
function function_3acf5939a1db7a7() {
    level.radiation = spawnstruct();
    level.radiation.var_ed47175eec456eb2 = [0:getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "startDamage"), 1), 1:getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "spreadingDamage"), 1), 2:getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "finalDamage"), 10)];
    level.radiation.var_e4f5ea2d49ff1661 = [0:getdvarfloat(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "startTickTime"), 1.5), 1:getdvarfloat(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "spreadingTickTime"), 1), 2:getdvarfloat(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "finalTickTime"), 1.5)];
    level.radiation.var_7fa6d03261608e14 = [];
    level.radiation.var_7fa6d03261608e14["angles"] = (getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "originAngleOffsetX"), 14000), getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "originAngleOffsetY"), 14000), 0);
    level.radiation.var_7fa6d03261608e14["origin"] = (getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "originOffsetX"), 9000), getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "originOffsetY"), 9000), 0);
    level.radiation.var_7fa6d03261608e14["spread"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "originSpread"), 4500);
    level.radiation.var_7fa6d03261608e14["maxDist"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "maxDistFromOrigin"), 10000);
    level.radiation.var_7fa6d03261608e14["minDistFromPOI"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "minDistFromPOI"), 11000);
    level.radiation.var_7fa6d03261608e14["minDistFromSpawn"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "minDistFromSpawn"), 4200);
    level.radiation.var_17dea46b55390175 = [];
    level.radiation.var_17dea46b55390175["starting"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "startingRadius"), 4000);
    level.radiation.var_17dea46b55390175["final"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "finalRadius"), 150000);
    level.radiation.var_17dea46b55390175["expTime"] = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "expansionSeconds"), 1200);
    level.radiation.var_c7d7b451939f1592 = getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "innerRadius"), 0.9);
    level.var_3c96ed7246169c1 = getdvarint(@"hash_5b07f4c484333549", 1) == 1;
    level.radiation.var_693e7d2a8db6a09d = [0:40, 1:75, 2:100];
    level.radiation.var_850942263638b598 = 0;
    level.radiation.var_378d3b538b839d2c = [];
    namespace_3c37cb17ade254d::registersharedfunc("radiation", "radiation_isInit", &radiation_isInit);
    namespace_3c37cb17ade254d::registersharedfunc("radiation", "radiation_signedDistanceFromRadiationCircle", &radiation_signedDistanceFromRadiationCircle);
    namespace_3c37cb17ade254d::registersharedfunc("radiation", "radiation_isInRadiation", &radiation_isInRadiation);
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "spawnAtStart"), 1)) {
        function_e97390ed5bc4fe34();
    }
    /#
        level.radiation thread function_718576c0d4d8ca36();
    #/
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2
// Size: 0x87
function function_e97390ed5bc4fe34() {
    level.radiation function_a430bf4dde5deaa8();
    level.radiation thread function_68d3d5b73680c590();
    level.radiation thread function_a75a30f41af1d381();
    level.radiation thread function_131e36da68551999();
    level.radiation thread function_94224cf552a24537();
    level.radiation thread function_6f9619adb55e091e();
    level.radiation thread function_3cb6790904a3c7d1();
    namespace_4b0406965e556711::gameflaginit("radiation_initialized", 1);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x980
// Size: 0x105
function private function_a430bf4dde5deaa8() {
    origin = function_dbf56756677d1ae1();
    var_4673b0931e86514c = "Radiation_Dmz";
    if (function_e21746abaaaf8414() || function_5e0e3a24dbb1fae1()) {
        var_4673b0931e86514c = "Radiation_SM_Dmz";
    }
    if (!isdefined(level.radiation.var_c075862f37971025)) {
        level.radiation.var_c075862f37971025 = spawnbrcircle(origin[0], origin[1], level.radiation.var_17dea46b55390175["starting"]);
        level.radiation function_6b6b6273f8180522(var_4673b0931e86514c, origin, level.radiation.var_17dea46b55390175["starting"]);
        level.radiation function_6988310081de7b45();
    } else {
        level.radiation function_6e148c8da2e4db13(origin);
    }
    function_9d8ad1ff0851c781(origin);
    function_bc92dd8ee5d9b16d(level.radiation.var_17dea46b55390175["starting"]);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8c
// Size: 0x52a
function private function_dbf56756677d1ae1() {
    while (!isnavmeshloaded() || !isdefined(level.startpoints) || level.startpoints.size <= 0 || !isdefined(level.var_acf99124377543bb) || level.var_acf99124377543bb.size <= 0) {
        waitframe();
    }
    waitframe();
    forceOrigin = getdvarvector(function_2ef675c13ca1c4af(@"hash_1829a1208c528e73", "forceOrigin"), (0, 0, 0));
    if (forceOrigin != (0, 0, 0)) {
        return forceOrigin;
    }
    points = [];
    foreach (set in level.startpoints) {
        if (isdefined(set.points)) {
            foreach (point in set.points) {
                if (isdefined(point.origin)) {
                    points[points.size] = point;
                }
            }
        }
        if (isdefined(set.origin)) {
            points[points.size] = set;
        }
    }
    var_9a288a2eba51e253 = [];
    var_43e62c00c7a5c99c = undefined;
    var_4c8a5ac107f58d50 = undefined;
    var_8e3a406071eaa1b0 = function_5b97e85e94d918a6(points);
    var_c46a79729cba49de = [];
    foreach (poi, origin in level.var_acf99124377543bb) {
        if (!issubstr(poi, "suburb")) {
            var_c46a79729cba49de[var_c46a79729cba49de.size] = origin;
        }
    }
    if (isdefined(level.var_2cdf30478fa435ff)) {
        foreach (loc in level.var_2cdf30478fa435ff) {
            valid = 1;
            foreach (start in points) {
                if (distance2d(start.origin, loc) < level.radiation.var_7fa6d03261608e14["minDistFromSpawn"]) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                var_9a288a2eba51e253[var_9a288a2eba51e253.size] = loc;
            }
        }
    } else {
        for (i = 0; i < 40; i++) {
            angle = randomfloatrange(0, 360);
            var_b58ba569ffda4497 = (cos(angle) * level.radiation.var_7fa6d03261608e14["angles"][0], sin(angle) * level.radiation.var_7fa6d03261608e14["angles"][1], 0) + var_8e3a406071eaa1b0;
            var_b58ba569ffda4497 = var_b58ba569ffda4497 + (randomfloat(level.radiation.var_7fa6d03261608e14["origin"][0]) - level.radiation.var_7fa6d03261608e14["spread"], randomfloat(level.radiation.var_7fa6d03261608e14["origin"][1]) - level.radiation.var_7fa6d03261608e14["spread"], 0);
            var_1172565abb556a22 = function_ef14a88ba5763880(var_b58ba569ffda4497, var_c46a79729cba49de);
            var_803bc6c7002f79a = function_ef14a88ba5763880(var_b58ba569ffda4497, points);
            var_c72adf2f44963edf = distance2d((0, 0, 0), var_b58ba569ffda4497);
            if (var_c72adf2f44963edf < level.radiation.var_7fa6d03261608e14["maxDist"]) {
                continue;
            }
            if (isdefined(var_803bc6c7002f79a) && var_803bc6c7002f79a > level.radiation.var_7fa6d03261608e14["minDistFromSpawn"] && isdefined(var_1172565abb556a22) && var_1172565abb556a22 > level.radiation.var_7fa6d03261608e14["minDistFromPOI"]) {
                var_9a288a2eba51e253[var_9a288a2eba51e253.size] = var_b58ba569ffda4497;
            }
            if (isdefined(var_803bc6c7002f79a) && (!isdefined(var_4c8a5ac107f58d50) || var_803bc6c7002f79a > var_4c8a5ac107f58d50)) {
                var_4c8a5ac107f58d50 = var_1172565abb556a22;
                var_43e62c00c7a5c99c = var_b58ba569ffda4497;
            }
        }
    }
    origin = undefined;
    if (var_9a288a2eba51e253.size > 0) {
        origin = random(var_9a288a2eba51e253);
    } else if (isdefined(var_43e62c00c7a5c99c)) {
        origin = var_43e62c00c7a5c99c;
    } else {
        angle = randomfloatrange(0, 360);
        origin = (cos(angle) * 5000, sin(angle) * 5000, 0);
    }
    return origin;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfbe
// Size: 0x23
function function_e32a9ba4aa8f9fa8() {
    if (!radiation_isInit()) {
        return;
    }
    level.radiation.var_9957c36d26b92420 = 1;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe8
// Size: 0x1a2
function function_a01f654e559ee5ec() {
    if (!radiation_isInit()) {
        return;
    }
    level notify("dmz_radiation_started");
    namespace_d696adde758cbe79::function_ae6091699e25d8b4("dmz_radiation_spreading", level.players);
    setomnvar("ui_dmz_radiation_spreading", 1);
    level function_ea5fb9090223b855(level.radiation.origin, level.radiation.var_17dea46b55390175["final"], level.radiation.var_17dea46b55390175["expTime"]);
    function_378499db9e139e34();
    level.radiation.var_9badbb469626f6 = 1;
    timer = 600;
    if (isdefined(level.var_c5074bf13ffb95ef)) {
        var_755bc4c5615671af = namespace_7789f919216d38a2::function_2a0c5b28dded3e06();
        var_1e6c96f9d4b225c4 = distance2d(level.var_c5074bf13ffb95ef.origin, level.radiation.origin) - level.radiation.var_17dea46b55390175["starting"];
        timer = var_1e6c96f9d4b225c4 / var_755bc4c5615671af;
        timer = timer - level.var_c7825757649c018e;
    }
    if (isdefined(level.var_cedd53bfc3112d91)) {
        timer = level.var_cedd53bfc3112d91;
    }
    wait(2);
    level.var_6fc3398b5a13400 = gettime() + int((timer - 2) * 1000);
    setomnvar("ui_hardpoint_timer", level.var_6fc3398b5a13400);
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("radiation_start_spread", level.players);
    level thread function_4c74b6fe35dadc38();
    wait(timer);
    level notify("dmz_radiation_complete");
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1191
// Size: 0xb5
function function_4c74b6fe35dadc38() {
    level endon("game_ended");
    if (getgametype() == "ob") {
        return;
    }
    wait(1.5);
    var_5f5f6114c9d25a18 = 23622;
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        playerdist = radiation_signedDistanceFromRadiationCircle(player.origin);
        if (playerdist > var_5f5f6114c9d25a18) {
            continue;
        }
        player thread function_4576ae886852cbfe();
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0xaa
function function_4576ae886852cbfe() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("successful_exfil");
    if (isdefined(player.var_acfbb9caed7125f9) && player.var_acfbb9caed7125f9 == 1) {
        var_c4db1877814da988 = function_17ee301cf0b5ba85("br_ring_final_classic");
        player setplayermusicstate(var_c4db1877814da988);
    } else {
        var_c4db1877814da988 = function_17ee301cf0b5ba85("br_ring_final");
        player setplayermusicstate(var_c4db1877814da988);
    }
    wait(90);
    if (!istrue(player.var_2441210fe6eea080) && !istrue(player.extracted)) {
        player setplayermusicstate("");
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fe
// Size: 0x25
function function_28f7a303238284ee() {
    return isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x132b
// Size: 0x1a
function private function_a75a30f41af1d381() {
    level endon("game_ended");
    while (1) {
        function_3c0ad5fce1b17f47();
        waitframe();
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x134c
// Size: 0x23
function private function_68d3d5b73680c590() {
    level endon("game_ended");
    while (1) {
        function_2f4c37edb355cfcc();
        function_c621c1a0a40ca1be();
        wait(1);
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1376
// Size: 0x34
function private function_3cb6790904a3c7d1() {
    wait(max(180, getdvarint(@"hash_e022fd0199a95f84", 1800) - 180));
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("radiation_winds_picking_up", level.players);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0x131
function private function_c621c1a0a40ca1be() {
    if (istrue(level.radiation.var_9badbb469626f6)) {
        return;
    }
    foreach (player in level.radiation.var_378d3b538b839d2c) {
        if (isdefined(player) && isdefined(player.origin) && function_1aa28ad2c858d3d7(player.origin)) {
            level.radiation.var_378d3b538b839d2c = array_remove(level.radiation.var_378d3b538b839d2c, player);
            if (namespace_9c6cddd872ad75f7::hasgasmask(player)) {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("radiation_approach_with_gas_mask", [0:player]);
            } else {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("radiation_approach", [0:player]);
            }
        } else if (!isdefined(player)) {
            level.radiation.var_378d3b538b839d2c = array_remove(level.radiation.var_378d3b538b839d2c, player);
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14e9
// Size: 0xa6
function private function_94224cf552a24537() {
    level endon("game_ended");
    while (1) {
        if (istrue(level.var_289df80e1ded586f)) {
            if (isdefined(level.agentarray)) {
                var_87feaef653a8c7da = array_randomize(level.agentarray);
                for (i = 0; i < var_87feaef653a8c7da.size; i++) {
                    if (i % 3 == 0) {
                        waitframe();
                    }
                    agent = var_87feaef653a8c7da[i];
                    if (isdefined(agent) && isalive(agent) && radiation_isInRadiation(agent.origin)) {
                        function_6153ad0458d8f809(agent);
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1596
// Size: 0x9a
function private function_6153ad0458d8f809(agent) {
    if (istrue(agent.var_65771500f49956c1)) {
        return;
    }
    damage = function_d6eeddef703ce569();
    damagemultiplier = ter_op(isdefined(agent.maxhealth), agent.maxhealth * 0.01, 1);
    agent dodamage(int(damage * damagemultiplier), agent.origin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br", "torso_upper");
    if (!isalive(agent)) {
        return;
    }
    function_1011b2aa6f43c79(agent);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1637
// Size: 0xb8
function private function_6f9619adb55e091e() {
    while (1) {
        damage = function_d00e59cfb504da1a();
        if (!isdefined(damage)) {
            return;
        }
        foreach (player in level.players) {
            if (isdefined(player)) {
                if (isdefined(player.origin) && !istrue(player.plotarmor) && radiation_isInRadiation(player.origin)) {
                    function_c4a3072ce7b3f1fd(player, damage);
                }
            }
        }
        wait(function_e083e00474123ef3());
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f6
// Size: 0xbd
function function_c4a3072ce7b3f1fd(player, damage, var_a9d135071a6dc843) {
    if (namespace_4033b03dc100de62::function_3abd8504e2419fce(player)) {
        if (level.var_3c96ed7246169c1) {
            damage = 0;
        } else {
            damage = player namespace_4033b03dc100de62::function_ac74ff0686d2886e(damage);
        }
    }
    if (!istrue(var_a9d135071a6dc843) && namespace_9c6cddd872ad75f7::hasgasmask(player) && damage > 0) {
        player namespace_9c6cddd872ad75f7::processdamage(damage);
    } else if (damage > 0) {
        if (player namespace_a2f809133c566621::isjuggernaut()) {
            damage = namespace_cf880efca02c6010::modifybrgasdamage(damage);
        }
        player dodamage(damage, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
        player namespace_f8d3520d3483c1::damagearmor(damage);
        if (randomint(100) >= 60) {
            player thread namespace_c5622898120e827f::tryplaycoughaudio();
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17ba
// Size: 0x45
function private function_d00e59cfb504da1a() {
    return level.radiation.var_ed47175eec456eb2[level.radiation.var_850942263638b598] + function_53c4c53197386572(level.radiation.var_28da8386c5007cb1, 0);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1807
// Size: 0x70
function function_9bc063861b9330f1(damage) {
    if (!radiation_isInit()) {
        return;
    }
    if (!isdefined(level.radiation.var_28da8386c5007cb1)) {
        level.radiation.var_28da8386c5007cb1 = 0;
    }
    level.radiation.var_28da8386c5007cb1 = level.radiation.var_28da8386c5007cb1 + int(damage);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x187e
// Size: 0x2a
function private function_d6eeddef703ce569() {
    return level.radiation.var_693e7d2a8db6a09d[level.radiation.var_850942263638b598];
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18b0
// Size: 0x2a
function private function_e083e00474123ef3() {
    return level.radiation.var_e4f5ea2d49ff1661[level.radiation.var_850942263638b598];
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18e2
// Size: 0x4e
function private function_378499db9e139e34() {
    level.radiation.var_850942263638b598 = int(min(level.radiation.var_850942263638b598 + 1, level.radiation.var_ed47175eec456eb2.size - 1));
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1937
// Size: 0xe0
function function_ea5fb9090223b855(goalorigin, goalradius, var_2fb858d06d406750) {
    level.radiation.goalorigin = goalorigin;
    level.radiation.goalradius = goalradius;
    level.radiation.var_2fb858d06d406750 = var_2fb858d06d406750;
    level.radiation.startorigin = level.radiation.origin;
    level.radiation.startradius = level.radiation.radius;
    level.radiation.var_9421d616ee332897 = 0;
    level.radiation.var_c075862f37971025 brcirclemoveto(goalorigin[0], goalorigin[1], goalradius, var_2fb858d06d406750);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1e
// Size: 0x85
function function_770129186512680c(pos) {
    var_607a972c1f87910a = distance2d(pos, level.radiation.startorigin);
    var_9ed6827753db2370 = (level.radiation.var_17dea46b55390175["final"] - level.radiation.origin) / level.radiation.var_17dea46b55390175["expTime"];
    return var_607a972c1f87910a / var_9ed6827753db2370;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aab
// Size: 0x50
function function_2a0c5b28dded3e06() {
    return (level.radiation.var_17dea46b55390175["final"] - level.radiation.var_17dea46b55390175["starting"]) / level.radiation.var_17dea46b55390175["expTime"];
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b03
// Size: 0x187
function private function_3c0ad5fce1b17f47() {
    if (!isdefined(level.radiation.var_2fb858d06d406750) || !isdefined(level.radiation.var_9421d616ee332897) || level.radiation.var_9421d616ee332897 > level.radiation.var_2fb858d06d406750) {
        return;
    }
    var_cd9eb3ebdb1cffa0 = level.radiation.var_9421d616ee332897 / level.radiation.var_2fb858d06d406750;
    if (isdefined(level.radiation.goalorigin) && isdefined(level.radiation.startorigin)) {
        function_9d8ad1ff0851c781(vectorlerp(level.radiation.startorigin, level.radiation.goalorigin, var_cd9eb3ebdb1cffa0));
    }
    if (isdefined(level.radiation.goalradius) && isdefined(level.radiation.startradius)) {
        function_bc92dd8ee5d9b16d(math::lerp(level.radiation.startradius, level.radiation.goalradius, var_cd9eb3ebdb1cffa0));
    }
    level.radiation.var_9421d616ee332897 = level.radiation.var_9421d616ee332897 + level.framedurationseconds;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c91
// Size: 0xdf
function private function_131e36da68551999() {
    level endon("game_ended");
    while (1) {
        if (istrue(level.var_289df80e1ded586f) && (istrue(level.radiation.var_9badbb469626f6) || istrue(level.radiation.var_9957c36d26b92420))) {
            var_9f14e5ad8cac3258 = array_randomize(level.agentarray);
            for (i = 0; i < var_9f14e5ad8cac3258.size; i++) {
                if (i % 3 == 0) {
                    waitframe();
                }
                agent = var_9f14e5ad8cac3258[i];
                if (isdefined(agent) && isdefined(agent.origin) && isalive(agent) && function_a47ed2d2b0485893(agent.origin)) {
                    function_1011b2aa6f43c79(agent);
                }
            }
            wait(5);
        } else {
            wait(5);
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d77
// Size: 0xa6
function private function_1011b2aa6f43c79(agent) {
    var_193a6f23ee4897c4 = function_106f0ecfa08284cd(agent.origin) * 2000;
    var_2e74a81498d831f9 = agent.origin - (var_193a6f23ee4897c4[0], var_193a6f23ee4897c4[1], 0);
    var_8de8f1b340a002be = getclosestpointonnavmesh(var_2e74a81498d831f9);
    if (length(var_2e74a81498d831f9 - var_8de8f1b340a002be) > 1000) {
        if (namespace_86b52005c685dfb9::iscivilian(agent)) {
            agent function_b661b022700ba72f("systemic", 0);
        }
        return;
    }
    if (namespace_86b52005c685dfb9::iscivilian(agent)) {
        agent function_b661b022700ba72f("script", 1);
    }
    thread namespace_2000a83505151e5b::function_a5117518725da028(agent, var_2e74a81498d831f9);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e24
// Size: 0xb1
function private function_2f4c37edb355cfcc() {
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.origin) && namespace_9c6cddd872ad75f7::hasgasmask(player) && !istrue(player.gasmaskswapinprogress)) {
            if (radiation_isInRadiation(player.origin)) {
                player namespace_cb965d2f71fefddc::function_cdf7f2f6bd3207("radiation");
            } else {
                player namespace_cb965d2f71fefddc::function_8206bc54a1ed73cb("radiation");
            }
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1edc
// Size: 0x4c
function function_1509b788f4410b94(player) {
    if (radiation_isInit()) {
        level.radiation.var_378d3b538b839d2c = array_add(level.radiation.var_378d3b538b839d2c, player);
        player thread function_ff259762d4378a33();
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f2f
// Size: 0x6d
function private function_ff259762d4378a33() {
    self endon("disconnect");
    while (1) {
        if (istrue(self.extracted)) {
            return;
        }
        if (radiation_isInit() && isreallyalive(self)) {
            var_744af42b66f6d746 = function_55436ce00ab60754(self.origin);
            if (isdefined(var_744af42b66f6d746)) {
                self playlocalsound("iw9_mp_radiation_tick");
                wait(var_744af42b66f6d746);
            } else {
                wait(1);
            }
        } else {
            wait(1);
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fa3
// Size: 0xc8
function private function_55436ce00ab60754(var_1cfccac3e5778bbb) {
    var_80bc91a54f223618 = function_485b5a399def53d0(var_1cfccac3e5778bbb);
    if (var_80bc91a54f223618 < level.radiation.var_77d736bcad3660a0) {
        return randomfloatrange(0.05, 0.2);
    } else if (var_80bc91a54f223618 < level.radiation.var_d7f903bdc28d6f6f) {
        return randomfloatrange(0.1, 0.25);
    } else if (var_80bc91a54f223618 < level.radiation.var_13609b12cabeaa49) {
        return randomfloatrange(0.15, 0.45);
    } else if (var_80bc91a54f223618 < level.radiation.var_1cb5a1b1ddcf5e52) {
        return randomfloatrange(0.2, 0.8);
    }
    return undefined;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2073
// Size: 0xc9
function private function_ef14a88ba5763880(origin, nodes) {
    if (!isdefined(origin)) {
        return undefined;
    }
    mindist = undefined;
    foreach (node in nodes) {
        dist = undefined;
        if (isvector(node)) {
            dist = distance2d(node, origin);
        } else if (isdefined(node.origin)) {
            dist = distance2d(node.origin, origin);
        }
        if (isdefined(dist) && (!isdefined(mindist) || dist < mindist)) {
            mindist = dist;
        }
    }
    return mindist;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2144
// Size: 0x20
function function_f3fb60f986f267c5() {
    if (radiation_isInit()) {
        return level.radiation.origin;
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216b
// Size: 0x20
function function_5ce400665ee103f9() {
    if (radiation_isInit()) {
        return level.radiation.radius;
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2192
// Size: 0x32
function private function_9d8ad1ff0851c781(origin) {
    level.radiation function_6e148c8da2e4db13(origin);
    level.radiation.origin = origin;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21cb
// Size: 0x1d5
function private function_bc92dd8ee5d9b16d(radius) {
    level.radiation function_4584ad1c0e2c58ec(radius);
    level.radiation.radius = radius;
    level.radiation.var_153347a332086343 = level.radiation.radius * 0.9;
    level.radiation.var_4dc2e5cf9d2f5ba6 = level.radiation.radius * 0.75;
    level.radiation.var_17944fccb70bb441 = level.radiation.radius * level.radiation.var_c7d7b451939f1592;
    level.radiation.var_aa30a34e39048796 = level.radiation.radius * 1.25;
    level.radiation.var_1cb5a1b1ddcf5e52 = level.radiation.radius * 1.4;
    level.radiation.var_13609b12cabeaa49 = level.radiation.radius * 1.15;
    level.radiation.var_d7f903bdc28d6f6f = level.radiation.radius * 1;
    level.radiation.var_77d736bcad3660a0 = level.radiation.radius * 0.3;
    level.radiation.var_5169808b5e9bfa77 = level.radiation.radius * 1.3;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23a7
// Size: 0x4c
function private function_a47ed2d2b0485893(var_1cfccac3e5778bbb) {
    var_a01833997c5f87a9 = function_485b5a399def53d0(var_1cfccac3e5778bbb);
    return var_a01833997c5f87a9 < level.radiation.var_aa30a34e39048796 && var_a01833997c5f87a9 > level.radiation.var_17944fccb70bb441;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23fb
// Size: 0x31
function radiation_isInRadiation(var_1cfccac3e5778bbb) {
    return radiation_isInit() && function_485b5a399def53d0(var_1cfccac3e5778bbb) < level.radiation.radius;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2434
// Size: 0x27
function private function_130808a5ea3b1a16(var_1cfccac3e5778bbb) {
    return function_485b5a399def53d0(var_1cfccac3e5778bbb) < level.radiation.var_153347a332086343;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2463
// Size: 0x27
function private function_c757b7694243cc8f(var_1cfccac3e5778bbb) {
    return function_485b5a399def53d0(var_1cfccac3e5778bbb) < level.radiation.var_4dc2e5cf9d2f5ba6;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2492
// Size: 0x27
function private function_1aa28ad2c858d3d7(var_1cfccac3e5778bbb) {
    return function_485b5a399def53d0(var_1cfccac3e5778bbb) < level.radiation.var_5169808b5e9bfa77;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c1
// Size: 0x3a
function function_cdcab1374db7f007(var_1cfccac3e5778bbb) {
    if (radiation_isInit()) {
        return (function_485b5a399def53d0(var_1cfccac3e5778bbb) < level.radiation.radius + 1500);
    } else {
        return 0;
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2502
// Size: 0x25
function function_485b5a399def53d0(var_1cfccac3e5778bbb) {
    return distance2d(var_1cfccac3e5778bbb, level.radiation.origin);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252f
// Size: 0x39
function radiation_signedDistanceFromRadiationCircle(origin) {
    return distance2d(origin, level.radiation.origin) - level.radiation.radius;
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2570
// Size: 0x26
function private function_106f0ecfa08284cd(origin) {
    return vectornormalize(level.radiation.origin - origin);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x259e
// Size: 0x137
function private function_5b97e85e94d918a6(points) {
    minx = undefined;
    maxx = undefined;
    miny = undefined;
    maxy = undefined;
    foreach (point in points) {
        if (!isdefined(minx) || point.origin[0] < minx) {
            minx = point.origin[0];
        }
        if (!isdefined(maxx) || point.origin[0] > maxx) {
            maxx = point.origin[0];
        }
        if (!isdefined(miny) || point.origin[1] < miny) {
            miny = point.origin[1];
        }
        if (!isdefined(maxy) || point.origin[1] > maxy) {
            maxy = point.origin[1];
        }
    }
    return ((minx + maxx) / 2, (miny + maxy) / 2, 0);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26dd
// Size: 0x28
function function_76ef3c8b8171d2d(origin) {
    if (radiation_isInit()) {
        return radiation_isInRadiation(origin);
    } else {
        return namespace_c5622898120e827f::function_24c5a8d31ae262f(origin);
    }
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270c
// Size: 0x25
function radiation_isInit() {
    return isdefined(level.radiation) && isdefined(level.radiation.origin);
}

// Namespace namespace_e47cc086b3a2ff1d/namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2739
// Size: 0x81
function private function_718576c0d4d8ca36() {
    /#
        level endon("radiation_isInRadiation");
        setdevdvarifuninitialized(@"hash_f16cecac3eb08047", 0);
        while (1) {
            waitframe();
            if (getdvarint(@"hash_bf14650f22fd02ae", 0) != 0) {
                setdvar(@"hash_bf14650f22fd02ae", 0);
                namespace_7789f919216d38a2::function_a430bf4dde5deaa8();
            }
            if (getdvarint(@"hash_f16cecac3eb08047", 0) != 0) {
                break;
            }
        }
        if (!radiation_isInit()) {
            function_e97390ed5bc4fe34();
        }
        level thread function_a01f654e559ee5ec();
    #/
}

