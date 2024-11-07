#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_2fdeb8023287be67;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\poi.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\weapons.gsc;
#using script_784aa75d4a32fa24;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\points.gsc;
#using script_46cf752d93dc17b;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;

#namespace dmz_bosses_chopper;

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x668
// Size: 0x18
function autoexec init() {
    registersharedfunc("dmz_bosses_chopper", "chopper_getCurrentTargetPlayer", &chopper_getCurrentTargetPlayer);
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x688
// Size: 0x8c
function function_c96f19c0bebdc014() {
    bossdetails = spawnstruct();
    bossdetails.spawnlocs = [];
    bossdetails.name = "chopper";
    bossdetails.initfunc = &function_a98b4087642d8e07;
    bossdetails.spawnfunc = &function_369a1dfb674d9262;
    bossdetails.var_e68429b39c75b6ee = &function_369a1dfb674d9262;
    bossdetails.var_7232c52496c3a94a = &function_463307a73b2cd8df;
    namespace_ebd0a1ae72bca61b::function_469eceae21900c7d(bossdetails, "additive", 1);
    namespace_ebd0a1ae72bca61b::registerboss(bossdetails);
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71c
// Size: 0x364
function function_a98b4087642d8e07(bossdetails) {
    level.var_cb36bea0db8a829f = getdvarint(@"hash_41a5f023a6b9d7b6", 100);
    level.var_d44040648e9624f = getdvarint(@"hash_2e1a1ee4432ba896", 4000);
    level.var_426503bd899fe79d = getdvarint(@"hash_f8cfa0a3e3979732", 6000);
    level.var_8b0166c08f79ba6f = getdvarint(@"hash_fb9f16d91bcc8a8", 420);
    level.var_af333105a68edcaf = getdvarint(@"hash_d539a28855e76e9a", 0);
    level.var_72f4ae7b6cc41376 = getdvarint(@"hash_4b206bd3a88e108b", 360);
    level.var_7317a07b6cea3c64 = getdvarint(@"hash_4afd81d3a867f935", 440);
    level.var_6884e659bd874ed9 = getdvarint(@"hash_29c7a74c7b9dd1b2", 3);
    level.var_920d2d352811f372 = getdvarint(@"hash_4e73bb68df397fbf", 6);
    level.var_eda461803cdadc2c = getdvarint(@"hash_995dd383d134e9ed", 10000);
    level.var_fdd8206d27c6e843 = getdvarint(@"hash_7926da00afdcd474", 4500);
    level.var_147a8bca293848ea = getdvarint(@"hash_87a6941b45c05399", 4);
    level.var_c11e773465a38fb7 = getdvarint(@"hash_b45a6072bee6b2d4", 15);
    level.var_f787cf36b2e0e7f7 = getdvarint(@"hash_369e173b0e8d08ba", 12);
    level.var_50b14458069e6de = getdvarint(@"hash_8b1842e92794c807", 7);
    level.var_26c9eb02a050f11a = getdvarint(@"hash_cc7feb01eae01a3f", 1);
    level.var_103b912267715093 = getdvarint(@"hash_45da2e0688e80016", 5000);
    level.var_808f834a75546c5c = getdvarint(@"hash_dd6e4061977972e5", 4);
    level.var_30c5e90e94b964fc = getdvarint(@"hash_1da644016c35bdad", 0) == 1;
    level.var_e21f87900a38b4e0 = getdvarint(@"hash_2b111045e5d27399", 155);
    level.var_e21f8a900a38bb79 = getdvarint(@"hash_2b110d45e5d26d00", 75);
    level.var_e21f89900a38b946 = getdvarint(@"hash_2b110e45e5d26f33", 10);
    level.var_59c6585d2f989571 = getdvarint(@"hash_23583556fb69ec0e", 30) * 1000;
    level.var_baff2d8310c2551d = int(level.var_59c6585d2f989571 * 0.4);
    if (scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        level.var_80d62fadb785ec94 = ["saba_moderncity"];
        level.var_b4d5f28b79e4c447 = ["saba_moderncity", "saba_observatory"];
    } else if (scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414()) {
        level.var_80d62fadb785ec94 = ["sealion_castle", "sealion_coastalruins", "sealion_culdesac", "sealion_powerplant", "sealion_shipwreck", "sealion_watertreatment", "sealion_waterways"];
    } else if (scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1()) {
        level.var_80d62fadb785ec94 = ["delta_castle", "delta_museum"];
        level.var_b4d5f28b79e4c447 = ["delta_castle", "delta_museum"];
    }
    level.averagealliesz = 0;
    level.killstreakweaponmap["chopper_gunner_proj_dmz"] = "chopper_gunner";
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa88
// Size: 0x4b
function function_369a1dfb674d9262(var_a862ef8246b0e151) {
    if (getdvarint(@"hash_e8345a47ed69d00a", 1) != 1) {
        return;
    }
    if (!percent_chance(level.var_cb36bea0db8a829f)) {
        return;
    }
    /#
        level thread function_b12b6f997c04f0d0();
    #/
    level thread function_289402be40270fb7(var_a862ef8246b0e151);
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xadb
// Size: 0x1cf
function function_289402be40270fb7(var_a862ef8246b0e151) {
    instance = namespace_ebd0a1ae72bca61b::function_2e6e2b664dfe3186("chopper");
    instance.spawned = 0;
    instance.bossname = "chopper";
    if (isdefined(var_a862ef8246b0e151) && isstruct(var_a862ef8246b0e151)) {
        if (scripts\mp\poi::function_47d356083884f913()) {
            instance.var_91403901a31fa2f8 = scripts\mp\poi::function_6cc445c02b5effac(var_a862ef8246b0e151.origin, 1);
        }
    } else {
        keys = getarraykeys(level.poi_origins);
        keys = array_randomize(keys);
        foreach (key in keys) {
            if (!isdefined(level.var_80d62fadb785ec94) || !isdefined(array_find(level.var_80d62fadb785ec94, key))) {
                instance.var_91403901a31fa2f8 = key;
                break;
            }
        }
    }
    if (!isdefined(instance.var_91403901a31fa2f8)) {
        instance.var_91403901a31fa2f8 = random_key(level.poi_origins);
    }
    instance.spawnloc = level.poi_origins[instance.var_91403901a31fa2f8];
    instance scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("Boss_Dmz", instance.spawnloc, 6000);
    scripts\mp\flags::gameflagwait("prematch_done");
    waittime = ter_op(level.var_af333105a68edcaf, randomintrange(level.var_72f4ae7b6cc41376, level.var_7317a07b6cea3c64), level.var_8b0166c08f79ba6f);
    wait waittime;
    instance function_3ead0708199ba214();
    instance notify("boss_spawned");
}

/#

    // Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcb2
    // Size: 0xe0
    function function_b12b6f997c04f0d0() {
        level endon("<dev string:x1c>");
        while (true) {
            if (getdvarint(@"hash_4caeed66c64f0e35", 0) == 1) {
                instance = namespace_ebd0a1ae72bca61b::function_2e6e2b664dfe3186("<dev string:x2a>");
                instance.spawned = 0;
                instance.spawnloc = level.players[0].origin;
                chopper = instance function_978010e5ff5d52bc(instance.spawnloc);
                if (isdefined(chopper)) {
                    instance.spawned = 1;
                    instance.boss = chopper;
                    instance.boss.var_109d6afbc11c5f9 = 3;
                    instance.chopper = chopper;
                }
                setdvar(@"hash_4caeed66c64f0e35", 0);
            }
            waitframe();
        }
    }

#/

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a
// Size: 0x57
function function_c2a173266d940d79(chopper) {
    if (isalive(chopper) && isstring(chopper.currentstate)) {
        state = chopper.currentstate;
        if (state == "idle") {
            state = "patrol";
        }
        return state;
    }
    return "death";
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfa
// Size: 0x9d
function chopper_getCurrentTargetPlayer(chopper) {
    if (isdefined(chopper) && isdefined(chopper.currenttarget) && isarray(chopper.threatlist) && isdefined(chopper.threatlist[chopper.currenttarget]) && isplayer(chopper.threatlist[chopper.currenttarget].player)) {
        return chopper.threatlist[chopper.currenttarget].player;
    }
    return undefined;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea0
// Size: 0x48
function function_6c1462b3f7b01684(chopper) {
    targetplayer = chopper_getCurrentTargetPlayer(chopper);
    if (isplayer(targetplayer) && isstring(targetplayer.team)) {
        return targetplayer.team;
    }
    return undefined;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef1
// Size: 0x1a7
function function_3ead0708199ba214() {
    poiname = self.var_91403901a31fa2f8;
    if (!isdefined(level.poi_origins) || !array_contains_key(level.poi_origins, poiname)) {
        assertmsg("<dev string:x35>" + poiname + "<dev string:x62>");
        return;
    }
    self.spawnloc += (0, 0, level.var_103b912267715093);
    chopper = function_978010e5ff5d52bc(self.spawnloc);
    chopper.bossinstance = self;
    self.spawned = 1;
    self.boss = chopper;
    self.boss.var_109d6afbc11c5f9 = getdvarint(@"hash_abc9aa0d61dcc958", 3);
    scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
    foreach (team in self.var_7d8ad21e5dfd7c94) {
        scripts\mp\objidpoolmanager::objective_teammask_addtomask(self.objidnum, team);
    }
    thread chopper_splash(self.spawnloc, poiname);
    scripts\mp\weapons::function_e00b77a9cb4d8322(chopper);
    var_985ae874212b863e = [];
    var_985ae874212b863e["idle"] = ["dmz_boss_chopper_escape", 0];
    var_985ae874212b863e["combat"] = ["dmz_boss_chopper_combat", 1.5];
    thread function_b5be3a44077aec21(self, var_985ae874212b863e, level.var_baff2d8310c2551d, level.var_59c6585d2f989571);
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a0
// Size: 0x21b
function function_978010e5ff5d52bc(pos) {
    var_44dd61e9bc4b4304 = getdvar(@"hash_85e8885fce5027e7", "veh9_mil_air_heli_hind_physics_dmz");
    choppermodel = getdvar(@"hash_fad92b3f5a4631f2", "veh9_mil_air_heli_hind_dmz_weapons");
    chopper = namespace_8c3daeeca6bd42c0::function_4c4df9aeb773709a(pos, var_44dd61e9bc4b4304, choppermodel, level.var_d44040648e9624f, "dmz_boss_chopper");
    chopper function_247ad6a91f6a4ffe(1);
    chopper.var_980d543a9814a36f = 20;
    chopper.var_d31810c7eb37abfe = 500;
    chopper.var_cd2fa7e9b25262d0 = chopper.var_d31810c7eb37abfe;
    chopper.currenthealth = level.var_426503bd899fe79d;
    chopper.health = level.var_426503bd899fe79d;
    chopper.maxhealth = level.var_426503bd899fe79d;
    chopper.lootfunc = &function_4ad380a5e1b9c51a;
    chopper.var_ecbc9cd30d3db0be = [];
    chopper.combatstate = 0;
    chopper.shouldshoot = 1;
    chopper.var_e0bf649e3b37455d = 0;
    chopper.var_c6c4017b9f56bff4 = &function_c23bf5e680c0b0fc;
    chopper.var_f09811d8bb92df96 = &function_80eb9ba6d517fefe;
    chopper.attackfunc = &function_a5298692f21a8421;
    chopper.funcs["strafe"] = &function_c1feeb5592d1018;
    chopper.var_580ba3be57af233e = 0;
    chopper.missileweapon = makeweapon("chopper_gunner_proj_dmz");
    chopper.bossname = "chopper";
    chopper thread function_7d5210c8e3520f4c();
    self.chopper = chopper;
    namespace_ebd0a1ae72bca61b::function_8002b09b8348902c(pos, "ui_map_icon_boss_chopper");
    scripts\mp\objidpoolmanager::update_objective_onentity(self.objidnum, chopper);
    scripts\mp\vehicles\damage::set_death_callback(self.chopper.vehiclename, &function_31529a6224103b1a);
    thread function_37985716c0079c86();
    if (isdefined(level.var_d8d4808549090419)) {
        [[ level.var_d8d4808549090419 ]](self);
    }
    return chopper;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c4
// Size: 0x25
function function_37985716c0079c86() {
    self.chopper waittill("death");
    scripts\mp\gameobjects::releaseid();
    namespace_ebd0a1ae72bca61b::function_3e409004edf37731("chopper");
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f1
// Size: 0x7c
function function_80eb9ba6d517fefe(player) {
    if (isdefined(player) && isdefined(player.team) && isreallyalive(player) && isdefined(self.var_ecbc9cd30d3db0be[player.team]) && self.var_ecbc9cd30d3db0be[player.team] >= level.var_147a8bca293848ea && !istrue(player.extracted)) {
        return true;
    }
    return false;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1376
// Size: 0x1f2
function function_c23bf5e680c0b0fc(data) {
    scripts\cp_mp\killstreaks\chopper_support::function_400022dabdb64055(data);
    if (isplayer(data.attacker)) {
        namespace_ebd0a1ae72bca61b::function_9483543f1b1bfa73("chopper", undefined, data.attacker, undefined, 20000);
    }
    switch (self.damagestate) {
    case 0:
        if (self.currenthealth < level.var_426503bd899fe79d * 0.65) {
            self.damagestate = 1;
            self setscriptablepartstate("body_damage_light", "on", 0);
        }
        break;
    case 1:
        if (self.currenthealth < level.var_426503bd899fe79d * 0.25) {
            self.damagestate = 2;
            self setscriptablepartstate("damage_left_wing", "on", 0);
            self setscriptablepartstate("body_damage_medium", "on", 0);
        }
        break;
    case 2:
        if (self.currenthealth < level.var_426503bd899fe79d * 0.05) {
            self.damagestate = 3;
            self setscriptablepartstate("damage_right_wing", "on", 0);
            self setscriptablepartstate("body_damage_heavy", "on", 0);
        }
        break;
    case 3:
    default:
        break;
    }
    if (!self.combatstate) {
        function_4b35485c0af17453();
    }
    if (isdefined(data.attacker) && isplayer(data.attacker) && !istrue(level.var_f7ca3f03d0ed22a9)) {
        namespace_ebd0a1ae72bca61b::function_ae49568842bce7e(data.attacker, "chopper", 1);
        self.var_ecbc9cd30d3db0be[data.attacker.team] = level.var_147a8bca293848ea;
    }
    return true;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1571
// Size: 0x95
function function_31529a6224103b1a(data) {
    instance = self.bossinstance;
    if (isdefined(instance)) {
        instance notify("boss_death");
        instance.killed = 1;
        instance.killer = data.attacker;
    }
    scripts\cp_mp\killstreaks\chopper_support::choppersupport_handledeathdamage(data);
    thread function_aa4375c53e07b7ec(data.attacker.team);
    thread function_103478f5d3688256(self, data.attacker);
    self notify("death");
    return true;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x160f
// Size: 0xf8
function function_aa4375c53e07b7ec(team) {
    chopper = self;
    if (!isstring(team)) {
        return;
    }
    while (isdefined(chopper)) {
        waitframe();
    }
    delaytime = 5;
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("boss_chopper_eliminated", team, delaytime);
    xpoverride = getdvarint(@"hash_dfcad66b7ba8da13", 500);
    foreach (player in scripts\mp\utility\teams::getteamdata(team, "players")) {
        if (!isdefined(player.var_8c8050d7d861d06c)) {
            player.var_8c8050d7d861d06c = 0;
        }
        player.var_8c8050d7d861d06c++;
        player thread scripts\mp\utility\points::doScoreEvent(#"kill", undefined, undefined, xpoverride, self, undefined, undefined, 1, undefined, 1);
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170f
// Size: 0x17e
function function_7d5210c8e3520f4c() {
    self endon("death");
    level endon("game_ended");
    while (!self.combatstate) {
        players = utility::function_2d7fd59d039fa69b(self.origin, level.var_fdd8206d27c6e843, 1);
        var_694236c50bb536fe = [];
        foreach (player in players) {
            if (!isdefined(var_694236c50bb536fe[player.team])) {
                var_694236c50bb536fe[player.team] = 1;
                if (!isdefined(self.var_ecbc9cd30d3db0be[player.team])) {
                    self.var_ecbc9cd30d3db0be[player.team] = 0;
                }
                self.var_ecbc9cd30d3db0be[player.team]++;
                if (self.var_ecbc9cd30d3db0be[player.team] >= level.var_147a8bca293848ea) {
                    function_4b35485c0af17453();
                }
            }
        }
        if (!istrue(level.var_30c5e90e94b964fc)) {
            self setscriptablepartstate("speaker", "idle", 0);
            wait 1;
            if (scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414()) {
                self setscriptablepartstate("speaker", "warning_sc", 0);
            } else {
                self setscriptablepartstate("speaker", "warning", 0);
            }
        }
        wait level.var_c11e773465a38fb7;
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1895
// Size: 0x15
function function_4b35485c0af17453() {
    self.combatstate = 1;
    thread function_e20f2ba1dcb6f312();
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18b2
// Size: 0x74
function function_e20f2ba1dcb6f312() {
    self endon("death");
    level endon("game_ended");
    while (true) {
        if (!istrue(level.var_30c5e90e94b964fc)) {
            self setscriptablepartstate("speaker", "idle", 0);
            wait 1;
            if (scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414()) {
                self setscriptablepartstate("speaker", "attacking_sc", 0);
            } else {
                self setscriptablepartstate("speaker", "attacking", 0);
            }
        }
        wait level.var_c11e773465a38fb7;
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x192e
// Size: 0x2b3
function chopper_splash(bossorigin, poiname) {
    if (level.var_eda461803cdadc2c < 0) {
        return;
    }
    if (level.var_eda461803cdadc2c > 0) {
        playerlist = [];
        foreach (player in level.players) {
            if (distance2dsquared(player.origin, bossorigin) < level.var_eda461803cdadc2c) {
                playerlist[playerlist.size] = player;
            }
        }
    } else {
        playerlist = level.players;
    }
    teamlist = [];
    foreach (player in playerlist) {
        if (!isarray(teamlist[player.team])) {
            teamlist[player.team] = [];
        }
        teamlist[player.team] = array_add(teamlist[player.team], player);
    }
    var_5619598e6a21f53c = [];
    foreach (players in teamlist) {
        if (players.size == 1) {
            var_5619598e6a21f53c[var_5619598e6a21f53c.size] = players[0];
            continue;
        }
        if (players.size > 1) {
            closestplayer = undefined;
            foreach (player in players) {
                if (!isdefined(closestplayer)) {
                    closestplayer = player;
                    continue;
                }
                if (isdefined(closestplayer) && isdefined(player)) {
                    var_762f99b56d7dfc4c = distance2dsquared(closestplayer.origin, bossorigin);
                    var_6008ea8bacb77120 = distance2dsquared(player.origin, bossorigin);
                    if (var_6008ea8bacb77120 < var_762f99b56d7dfc4c) {
                        closestplayer = player;
                    }
                }
            }
            if (isdefined(closestplayer)) {
                var_5619598e6a21f53c[var_5619598e6a21f53c.size] = closestplayer;
            }
        }
    }
    foreach (var_4c9c6a9aa1f72df4 in var_5619598e6a21f53c) {
        function_463307a73b2cd8df(var_4c9c6a9aa1f72df4, 0, 1);
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1be9
// Size: 0xc5
function function_4ad380a5e1b9c51a() {
    crate = namespace_fd99f400a596934b::function_52f17e5fbec318a6(self.origin, level.supplydroptypes["dmz_boss_drop"], self.origin);
    if (isdefined(crate)) {
        crate unlink();
        crate physicslaunchserver((0, 0, 0), (0, 0, 0));
        bodyid = crate physics_getbodyid(0);
        physics_setbodycenterofmassnormal(bodyid, (0, 0, -0.75));
        crate.physicsactivated = 1;
        crate.usetime = 10;
        crate setscriptablepartstate("dmz_supply_drop", "usable");
        crate.var_5cc8ac2ed7a3d9fa = &function_e018ddec11a442b;
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb6
// Size: 0x44
function function_e018ddec11a442b(instance, player) {
    if (!isdefined(instance.contents)) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_konni_safehouse_intel");
        instance scripts\mp\gametypes\br_lootcache::function_d683a60016231237(lootid, 1);
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d02
// Size: 0x1ee
function function_a5298692f21a8421(target) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    if (!isdefined(target)) {
        return;
    }
    var_40130bd790669c04 = target.origin;
    targetpoi = scripts\mp\poi::function_6cc445c02b5effac(target.origin);
    var_cb9ac661c1f66862 = 1;
    if (isdefined(level.var_b4d5f28b79e4c447) && isdefined(targetpoi)) {
        var_cb9ac661c1f66862 = !array_contains(level.var_b4d5f28b79e4c447, targetpoi);
    }
    self.shouldshoot = 1;
    self.var_e0bf649e3b37455d = 0;
    thread function_d105b5766895909d(target);
    if (isplayer(target)) {
        namespace_ebd0a1ae72bca61b::function_9483543f1b1bfa73("chopper", undefined, target, undefined, 20000);
    }
    while (true) {
        if (isdefined(target)) {
            self setturrettargetvec(target.origin);
            if (function_dd5ca63b6ca176b8(target)) {
                if (self.var_580ba3be57af233e > level.var_6884e659bd874ed9) {
                    if (level.var_920d2d352811f372 > 0 && self.damagestate < 3 && var_cb9ac661c1f66862) {
                        namespace_8c3daeeca6bd42c0::function_9f656e924a854c1b(target, 4000, 8, randomint(360), 1000);
                    } else {
                        function_e278235100ed92f4(target);
                    }
                } else {
                    function_e278235100ed92f4(target);
                    if (level.var_920d2d352811f372 > 0 && self.damagestate < 3 && var_cb9ac661c1f66862) {
                        namespace_8c3daeeca6bd42c0::function_9f656e924a854c1b(target, 4000, 8, randomint(360), 1000);
                    } else {
                        self.var_580ba3be57af233e = 0;
                    }
                }
            }
        }
        if (!isdefined(target) || !isreallyalive(target)) {
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            return;
        }
        if (distance2dsquared(var_40130bd790669c04, target.origin) > 100000000) {
            namespace_8c3daeeca6bd42c0::function_3be784d69cc30a0(target, -800);
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            return;
        }
        wait 3;
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef8
// Size: 0x148
function function_c1feeb5592d1018(target) {
    self.var_580ba3be57af233e = 0;
    missiletags = ["tag_gun_right1", "tag_gun_left1", "tag_gun_right2", "tag_gun_left2"];
    wait 1;
    for (i = 0; i < level.var_920d2d352811f372; i++) {
        if (self.damagestate > 1 && (i % 4 == 1 || i % 4 == 3)) {
            wait 0.3;
            continue;
        } else if (self.damagestate > 2) {
            wait 0.3;
            continue;
        }
        missilestart = self gettagorigin(missiletags[i % 4]) + anglestoforward(self.angles + (6, 0, 0)) * 200;
        missileend = self gettagorigin(missiletags[i % 4]) + anglestoforward(self.angles + (6, 0, 0)) * 1000;
        missile = scripts\cp_mp\utility\weapon_utility::_magicbullet(self.missileweapon, missilestart, missileend, self.owner);
        wait 0.3;
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2048
// Size: 0x1e6
function function_d105b5766895909d(target) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    target endon("death_or_disconnect");
    self setlookatent(target);
    var_29ae2ed56e057510 = 0;
    timer = 0;
    while (true) {
        if (!istrue(self.strafing)) {
            if (!isdefined(target) || !isdefined(target.origin)) {
                namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            }
            contentsoverride = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0);
            canseetarget = ray_trace_passed(target.origin, self.origin, self.ignorelist, contentsoverride) && !target.notarget;
            if (timer > level.var_808f834a75546c5c || !canseetarget || distance2dsquared(target.origin, self.origin) > 20250000 || distance2dsquared(target.origin, self.origin) < 2250000) {
                timer = 0;
                if (!namespace_8c3daeeca6bd42c0::function_e9cb677b6ba63162(target, 3000, 8, randomint(360))) {
                    var_29ae2ed56e057510++;
                    if (var_29ae2ed56e057510 > level.var_26c9eb02a050f11a) {
                        self.var_e0bf649e3b37455d = 1;
                    }
                    if (var_29ae2ed56e057510 > level.var_50b14458069e6de) {
                        self.shouldshoot = 0;
                    }
                    if (var_29ae2ed56e057510 > level.var_f787cf36b2e0e7f7) {
                        namespace_8c3daeeca6bd42c0::function_3be784d69cc30a0(target, -500);
                        namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
                    }
                } else {
                    self.var_e0bf649e3b37455d = 0;
                    self.shouldshoot = 1;
                }
            } else {
                self.var_e0bf649e3b37455d = 0;
                self.shouldshoot = 1;
            }
        }
        timer += 0.5;
        wait 0.5;
    }
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2236
// Size: 0x2db
function function_e278235100ed92f4(target) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    if (!isdefined(target)) {
        return;
    }
    attackradius = level.var_e21f87900a38b4e0;
    var_795d7f662ba7e1a1 = 0;
    self.var_d706b7e51984c2ec = undefined;
    self.var_580ba3be57af233e++;
    guid = target.guid;
    dir = anglestoforward(target.angles);
    dir2d = vectornormalize((dir[0], dir[1], 0));
    for (i = 0; i < 100; i++) {
        if (self.health <= 0) {
            return;
        }
        if (!isdefined(target)) {
            namespace_8c3daeeca6bd42c0::function_83388ed388ddbddc(guid);
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            return;
        }
        if (isreallyalive(target) && istrue(target.inlaststand)) {
            namespace_8c3daeeca6bd42c0::function_3be784d69cc30a0(target, -2000);
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            return;
        }
        if (i == 35) {
            attackradius = level.var_e21f8a900a38bb79;
        } else if (i == 65) {
            attackradius = level.var_e21f89900a38b946;
        }
        if (self.var_e0bf649e3b37455d && !isdefined(self.var_d706b7e51984c2ec)) {
            self.var_d706b7e51984c2ec = attackradius;
            var_795d7f662ba7e1a1 = 50;
            attackradius = int(level.var_e21f87900a38b4e0);
        } else if (!self.var_e0bf649e3b37455d && isdefined(self.var_d706b7e51984c2ec)) {
            attackradius = self.var_d706b7e51984c2ec;
            var_795d7f662ba7e1a1 = 0;
            self.var_d706b7e51984c2ec = undefined;
        }
        if (!self.shouldshoot) {
            wait 0.1;
            continue;
        }
        if (!isdefined(target) || !isdefined(target gettagorigin("j_spineupper"))) {
            namespace_8c3daeeca6bd42c0::function_83388ed388ddbddc(guid);
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            return;
        }
        centerpoint = target gettagorigin("j_spineupper");
        randdist = randomint(attackradius) + var_795d7f662ba7e1a1;
        randangle = randomint(360);
        x = centerpoint[0] + randdist * cos(randangle);
        y = centerpoint[1] + randdist * sin(randangle);
        z = centerpoint[2];
        point = (x, y, z);
        if (self.var_cd2fa7e9b25262d0 > 0) {
            point += dir2d * self.var_cd2fa7e9b25262d0;
            self.var_cd2fa7e9b25262d0 -= self.var_980d543a9814a36f;
        }
        self setturrettargetvec(point);
        wait 0.1;
        self fireweapon();
    }
    self.var_cd2fa7e9b25262d0 = self.var_d31810c7eb37abfe;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2519
// Size: 0x70
function function_dd5ca63b6ca176b8(target) {
    var_97f0985016aa48cb = 0.8;
    turretforward = anglestoforward(self gettagangles("tag_flash"));
    targetdisplace = vectornormalize(target.origin - self gettagorigin("tag_flash"));
    var_ff53e400dd536b82 = vectordot(turretforward, targetdisplace);
    return var_ff53e400dd536b82 >= var_97f0985016aa48cb;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2592
// Size: 0x99
function function_6326efaea227c12a(turret) {
    if (isdefined(self.currenttarget) && self.currenttarget == turret.attackingtarget) {
        self.currenttarget.var_5b7ed65d780010d7 = gettime();
        self.currenttarget = undefined;
    }
    if (istrue(turret.targetbrokelos)) {
        turret.targetbrokelos = undefined;
    }
    turret.attackingtarget = undefined;
    turret cleartargetentity();
    turret.groundtargetent unlink();
    turret notify("lost_target");
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2633
// Size: 0x1f1
function function_463307a73b2cd8df(player, showicon, var_91e5939bcaba8460) {
    assertex(isplayer(player), "<dev string:x78>");
    assertex(isstring(player.team), "<dev string:xa3>");
    team = player.team;
    if (array_contains(self.var_7d8ad21e5dfd7c94, team)) {
        return false;
    }
    if (istrue(self.spawned) && !isdefined(self.chopper)) {
        return false;
    }
    self.var_7d8ad21e5dfd7c94 = array_add(self.var_7d8ad21e5dfd7c94, team);
    players = getteamdata(team, "players");
    var_ac4c51bf033f6323 = players;
    if (!istrue(self.spawned)) {
        foreach (player in players) {
            scripts\cp_mp\utility\game_utility::function_cfd53c8f6878014f(player);
        }
    } else {
        scripts\mp\objidpoolmanager::objective_teammask_addtomask(self.objidnum, team);
        if (istrue(var_91e5939bcaba8460)) {
            function_5c07a5046a6dc0f4(team, self.spawnloc, level.var_eda461803cdadc2c, "dmz_boss_chopper_approach", 1.5);
        } else {
            function_5c07a5046a6dc0f4(team, player, level.var_b1149892b2595056, "dmz_boss_chopper_approach", 1.5);
        }
    }
    poiname = undefined;
    if (scripts\mp\poi::function_47d356083884f913()) {
        poiname = scripts\mp\poi::function_6cc445c02b5effac(self.spawnloc, 1, 0);
    }
    splash = ter_op(istrue(self.spawned), "dmz_chopper_revealed", "dmz_chopper_revealed_circle");
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, var_ac4c51bf033f6323, poiname);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("boss_chopper_near", team, 2);
    return true;
}

// Namespace dmz_bosses_chopper / namespace_c2ee1d0cb79d4ef7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x282d
// Size: 0xb5
function function_103478f5d3688256(chopper, killer) {
    assertex(isent(chopper), "<dev string:xd8>");
    assertex(isstruct(chopper.bossinstance), "<dev string:x105>");
    assertex(isent(killer), "<dev string:x13f>");
    bossinstance = chopper.bossinstance;
    bossinstance notify("stop_boss_ai_music_thread");
    function_caeaf68ab0e87565(bossinstance.musicplayers, "");
    while (isdefined(chopper)) {
        waitframe();
    }
    function_73f954808739f7bc(bossinstance, killer, "dmz_boss_chopper_win", 2.5, "dmz_boss_chopper_escape", 0);
}

