#using script_16ea1b94f0f381b3;
#using script_2669878cf5a1b6bc;
#using script_48814951e916af89;
#using script_4a6760982b403bad;
#using script_600b944a95c3a7bf;
#using script_6cb121f049b87187;
#using script_72ef6b9f0cf1f55a;
#using script_7d3e27aa82b5d70b;
#using script_7edf952f8921aa6b;
#using script_9880b9dc28bc25e;
#using scripts\asm\shared\mp\utility;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\utility\callback_group;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\throttle;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\equipment\decoy_grenade;
#using scripts\mp\flags;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\hud_message;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\outofbounds;
#using scripts\mp\rank;
#using scripts\mp\utility\game;
#using scripts\mp\utility\points;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\weapons;

#namespace namespace_fb4e60babf7f8008;

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x124d
// Size: 0x1ec
function autoexec main() {
    if (getdvarint(@"hash_57efffe601711595", 0)) {
        level.dogtagsenabled = 1;
        level.var_d914655fe46b8e34 = 0;
        function_99ac3b02d82812e2();
        init_fx();
        level.var_cd97b8529d2084ec = 0;
        level.var_cfefa2ba0f234157 = 0;
        level.var_a43b67b5f86b3332 = 0;
        level.var_64dfea01f5c51f4c = 0;
        level.var_be60801963958c7f = 0;
        level.var_3c58cca11f993e45 = getdvarint(@"hash_13f1e7cf58d07a48", 30);
        level.var_36a0d9736ff96a13 = getdvarint(@"hash_108740640b42aa29", 30);
        level.var_e098f97eef14d3de = getdvarint(@"hash_761217d70cf604e3", 1);
        level.var_688cbf4629dc04ed = getdvarint(@"hash_38c619834ed85685", 10);
        setdvar(@"hash_46eaad837c804540", 5);
        setdvar(@"hash_f40f6794bc55022e", 1);
        level.var_29a59b6489c9891c = &function_a2a65ab511d8d308;
        level.difficulty_ramp = getdvarint(@"hash_603574596f04a744", 1);
        level thread difficulty_ramp();
        if (level.difficulty_ramp) {
            level.spawn_zombies = 0;
        } else {
            level.spawn_zombies = 1;
        }
        level thread init_spawns();
        level thread function_7b6ff5793cbddbca();
        level thread function_542402e1da1b422b();
        namespace_d491530661d3e380::function_eb4aeba58080eb81();
        level.bones = [];
        level.skulls = [];
        level callback::add("player_connect", &function_4fea0f8d04cd5a9f);
        level callback::add("player_death", &on_player_death);
        scripts\mp\weapons::registerusedcallback("decoy_grenade", &function_e69695ef0a64f686);
        level thread function_4d963287920f7456();
        /#
            if (getdvarint(@"hash_c3bdf3d5dac2e29f", 0)) {
                level thread function_d2829ca2fa8d53e();
            }
            level thread function_935c4742baf8caf8();
        #/
    }
    level.var_85f0faee1e7958bb = "team_two_hundred";
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1441
// Size: 0x52
function function_4d963287920f7456() {
    while (!threatbiasgroupexists("Tactical_Static") || !threatbiasgroupexists("Killstreak_Static")) {
        waitframe();
    }
    if (!getdvarint(@"hash_46222cac1c9060a5", 1)) {
        return;
    }
    setthreatbiasagainstall("Tactical_Static", -10000);
    setthreatbiasagainstall("Killstreak_Static", -10000);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149b
// Size: 0x66
function function_542402e1da1b422b() {
    level.var_e6d635dd9b7f73b3 = getdvarint(@"hash_4d20ec8ae363e71", 10);
    level.var_2862a46691940273 = getdvarint(@"hash_f833ad7fd4812441", 1);
    level.var_eb9d721411a7178a = getdvarint(@"hash_8bdb0dc56b721f30", 1);
    level.var_2a0c9dcc6a722a85 = getdvarint(@"hash_b909a7c21f7d3a53", 1);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1509
// Size: 0x79
function function_4fea0f8d04cd5a9f(params) {
    self.var_7a6ac8a30c8eef4c = [];
    if (!isdefined(self.var_d0b217f00fef3917)) {
        self.var_d0b217f00fef3917 = 0;
    }
    if (!isdefined(self.var_d848e2025d8597d2)) {
        self.var_d848e2025d8597d2 = 0;
    }
    if (!isdefined(self.var_92e210c188ad9778)) {
        self.var_92e210c188ad9778 = 0;
    }
    if (!isdefined(self.var_55b63b79ebd4a56d)) {
        self.var_55b63b79ebd4a56d = 0;
    }
    thread function_fbb76db792abc436();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x158a
// Size: 0x6b
function function_e69695ef0a64f686(grenade) {
    grenade endon("death");
    thread scripts\mp\equipment\decoy_grenade::decoy_used(grenade);
    grenade waittill("decoy_activated");
    grenade.attractor = namespace_5381a59d140f4df8::add_attractor(grenade, 1, grenade.tableinfo.bundle.var_3b8cd7cf44335571, 0, undefined, &function_79b2d283ccebd40d, 0, undefined, 1);
    grenade thread function_79cbe6d4fa8dc740();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fd
// Size: 0x27
function function_79cbe6d4fa8dc740() {
    self waittill("death");
    if (isdefined(self.attractor)) {
        namespace_5381a59d140f4df8::remove_attractor(self.attractor);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x162c
// Size: 0x29
function function_79b2d283ccebd40d(attractor, ai) {
    return is_equal(ai.aicategory, "normal");
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165e
// Size: 0x9e
function function_fbb76db792abc436() {
    while (true) {
        self waittill("juggernaut_start");
        weapons = self getweaponslistall();
        foreach (weap in weapons) {
            if (isdefined(weap.camo) && scripts\engine\utility::function_5b7e9a4c946f3a13(weap.camo, level.camo_array)) {
                self takeweapon(weap);
            }
        }
        wait 1;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1704
// Size: 0x2ed
function function_99ac3b02d82812e2() {
    var_c70099220a5c67ee = getdvarint(@"hash_e8ce149c9dcc3710", 4);
    if (true) {
        switch (var_c70099220a5c67ee) {
        case 1:
            level.zombie_count = getdvarint(@"hash_85db80b182f19142", 12);
            level.armored_count = getdvarint(@"hash_259a131f3a180ee", 0);
            level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 0);
            level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 0);
            level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
            break;
        case 2:
            level.zombie_count = getdvarint(@"hash_85db80b182f19142", 7);
            level.armored_count = getdvarint(@"hash_259a131f3a180ee", 5);
            level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 0);
            level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 0);
            level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
            break;
        case 3:
            level.zombie_count = getdvarint(@"hash_85db80b182f19142", 4);
            level.armored_count = getdvarint(@"hash_259a131f3a180ee", 4);
            level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 3);
            level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 0);
            level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
            break;
        case 4:
            level.zombie_count = getdvarint(@"hash_85db80b182f19142", 3);
            level.armored_count = getdvarint(@"hash_259a131f3a180ee", 3);
            level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 2);
            level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 2);
            level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
            break;
        case 5:
            level.zombie_count = getdvarint(@"hash_85db80b182f19142", 5);
            level.armored_count = getdvarint(@"hash_259a131f3a180ee", 5);
            level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 2);
            level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 2);
            level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 2);
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f9
// Size: 0x4bf
function difficulty_ramp() {
    level endon("game_ended");
    if (level.difficulty_ramp) {
        scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
        var_c70099220a5c67ee = getdvarint(@"hash_e8ce149c9dcc3710", 4);
        while (level.zoneislocked) {
            waitframe();
        }
        while (true) {
            current_zone = level.zone;
            level thread function_1599a5eece9a737c();
            level.zombie_count = getdvarint(@"hash_d5f1accb3e5f2489", 12);
            level.armored_count = 0;
            level.hellhound_count = 0;
            level.var_cead06788dacad3e = 0;
            level.var_7dda105d87b7b147 = 0;
            var_fe5c41047e3f9f48 = getdvarint(@"hash_a8a110c6ef5e7307", 30);
            wait var_fe5c41047e3f9f48;
            if (var_c70099220a5c67ee != 1 && level.spawn_zombies) {
                foreach (player in level.players) {
                    player thread scripts\mp\hud_message::showsplash("horde_elite_zombies_incoming");
                    player playlocalsound("jup_hordepoint_elite_splash");
                }
            }
            switch (var_c70099220a5c67ee) {
            case 1:
                level.zombie_count = getdvarint(@"hash_85db80b182f19142", 12);
                level.armored_count = getdvarint(@"hash_259a131f3a180ee", 0);
                level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 0);
                level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 0);
                level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
                break;
            case 2:
                level.zombie_count = getdvarint(@"hash_85db80b182f19142", 7);
                level.armored_count = getdvarint(@"hash_259a131f3a180ee", 5);
                level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 0);
                level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 0);
                level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
                break;
            case 3:
                level.zombie_count = getdvarint(@"hash_85db80b182f19142", 4);
                level.armored_count = getdvarint(@"hash_259a131f3a180ee", 4);
                level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 3);
                level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 0);
                level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
                break;
            case 4:
                level.zombie_count = getdvarint(@"hash_85db80b182f19142", 3);
                level.armored_count = getdvarint(@"hash_259a131f3a180ee", 3);
                level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 2);
                level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 2);
                level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 0);
                break;
            case 5:
                level.zombie_count = getdvarint(@"hash_85db80b182f19142", 3);
                level.armored_count = getdvarint(@"hash_259a131f3a180ee", 3);
                level.hellhound_count = getdvarint(@"hash_e4fb1c433ccb63e7", 2);
                level.var_cead06788dacad3e = getdvarint(@"hash_124c1cc21a271e81", 2);
                level.var_7dda105d87b7b147 = getdvarint(@"hash_49f9aee48c12854", 2);
                break;
            default:
                break;
            }
            while (current_zone == level.zone) {
                waitframe();
            }
            level.spawn_zombies = 0;
            if (isdefined(level.portal)) {
                str_fx = getfx("big_portal_spawn");
                stopfxontag(str_fx, level.portal, "tag_origin");
                level.portal.var_2fe318403a6542f6 stoploopsound();
                playsoundatpos(level.portal.var_2fe318403a6542f6.origin + (0, 0, 50), "jup_hordepoint_portal_lp_end");
            }
            level.portal_zone = undefined;
            waitframe();
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec0
// Size: 0x15
function function_1599a5eece9a737c() {
    level waittill("zone_captured");
    level.spawn_zombies = 1;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1edd
// Size: 0x4a
function init_spawns() {
    setdvar(@"hash_365d77262b3a350e", 0);
    while (!isdefined(level.gametypebundle)) {
        waitframe();
    }
    namespace_bfef6903bca5845d::init();
    level.var_289df80e1ded586f = 1;
    scripts\mp\flags::gameflagwait("prematch_done");
    level thread function_dbd05fba7c666ad1();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2f
// Size: 0x45e
function function_dbd05fba7c666ad1() {
    level.var_fe093e9b2b6c3751 = 0;
    level endon("game_ended");
    while (!isdefined(level.objectives)) {
        waitframe();
    }
    namespace_22b8ba12655bf3f2::function_40eca5c2157229bc();
    var_4669b4be8fecfbd4 = getdvarfloat(@"hash_50a56aab001bf987", 1);
    var_5c02f2a9821bedb5 = getdvarfloat(@"hash_d14518b425f79f71", 1);
    while (true) {
        if (!level.spawn_zombies) {
            waitframe();
            continue;
        }
        function_40c1f0d70102699d();
        waitframe();
        if (var_5c02f2a9821bedb5 && !isdefined(level.portal_zone)) {
            level.portal_zone = function_12d3db51fd7f88b5(level.zone);
            level.portal = scripts\engine\utility::spawn_tag_origin(level.portal_zone + (0, 0, 50), (0, 0, 0));
            str_fx = getfx("big_portal_spawn");
            if (!isdefined(level.portal.var_2fe318403a6542f6)) {
                level.portal.var_2fe318403a6542f6 = spawn("script_model", level.portal_zone + (0, 0, 50));
            }
            level.portal show();
            playfxontag(str_fx, level.portal, "tag_origin");
            playsoundatpos(level.portal_zone + (0, 0, 50), "jup_hordepoint_portal_lp_open");
            level.portal.var_2fe318403a6542f6 playloopsound("jup_hordepoint_portal_lp");
        }
        foreach (zombie in level.var_ca1314ff09b650f1) {
            safeorigin = undefined;
            if (level.zone.active) {
                safeorigin = function_efaf11bef8c9efed(level.zone);
            }
            if (!isdefined(safeorigin) && isdefined(level.players)) {
                player = array_random(level.players);
                safeorigin = function_ca817bf862167332(player);
            }
            if (isdefined(level.portal)) {
                safeorigin = function_f5cda710477f2725(level.portal, 50, 100);
            }
            zombie_type = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc(zombie)[0];
            ai = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(zombie_type, safeorigin, (0, randomint(360), 0), "team_two_hundred");
            if (isagent(ai)) {
                round_number = 8;
                if (isdefined(ai.zombieaisettings.healthscriptbundle)) {
                    ai scripts\common\ai::function_dd21d67ede8ba22(namespace_22b8ba12655bf3f2::function_cf858e0766110297(ai.zombieaisettings.healthscriptbundle, round_number));
                    ai.health = ai.maxhealth;
                }
                if (var_4669b4be8fecfbd4 > 1) {
                    health_value = ai.health;
                    ai.health = int(health_value * var_4669b4be8fecfbd4);
                }
                ai.goalradius = 16;
                ai.stealth_enabled = 0;
                ai.pathenemyfightdist = 0;
                ai.friendlyteam = "team_two_hundred";
                if (!istrue(zombie == "zombie_base" || zombie == "zombie_base_armored_heavy")) {
                    ai setentitysoundcontext("jup_map", "hordepoint");
                }
                if (zombie == "zombie_mimic") {
                    ai namespace_dd16d65e824b8e9::function_f1e5805da192a1ef("sprint", "horde_spawn", 1);
                } else {
                    ai namespace_dd16d65e824b8e9::function_f1e5805da192a1ef("walk", "horde_spawn", 1);
                    ai thread speed_increase(2.5, 10);
                }
                playfx(level._effect["ground_portal_spawn"], safeorigin);
                playsoundatpos(safeorigin + (0, 0, 10), "jup_hordepoint_ground_portal_open");
                ai thread scripts\asm\shared\mp\utility::function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
                ai thread function_dcfd39bb50e8f992(zombie);
            }
            wait 0.15;
        }
        wait 5;
        level.var_ca1314ff09b650f1 = [];
        waitframe();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2395
// Size: 0x81
function speed_increase(var_247cc03625bd32f1, var_d8c5344572cddf4c) {
    self endon("death");
    if (!isdefined(var_247cc03625bd32f1)) {
        var_247cc03625bd32f1 = 2;
    }
    if (!isdefined(var_d8c5344572cddf4c)) {
        var_d8c5344572cddf4c = 10;
    }
    wait var_247cc03625bd32f1;
    namespace_dd16d65e824b8e9::function_f1e5805da192a1ef("sprint", "horde_spawn", 1);
    if (!is_equal(self.subclass, "zombie_base")) {
        return;
    }
    if (!percent_chance(level.var_688cbf4629dc04ed)) {
        return;
    }
    wait var_d8c5344572cddf4c;
    namespace_dd16d65e824b8e9::function_f1e5805da192a1ef("super_sprint", "horde_spawn", 1);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x241e
// Size: 0x203
function function_40c1f0d70102699d() {
    level.var_ca1314ff09b650f1 = [];
    if (level.var_cd97b8529d2084ec < level.zombie_count) {
        add_amount = level.zombie_count - level.var_cd97b8529d2084ec;
        for (i = 0; i < add_amount; i++) {
            level.var_ca1314ff09b650f1 = array_add(level.var_ca1314ff09b650f1, "zombie_base");
            level.var_cd97b8529d2084ec++;
        }
    }
    if (level.var_cfefa2ba0f234157 < level.armored_count) {
        add_amount = level.armored_count - level.var_cfefa2ba0f234157;
        for (i = 0; i < add_amount; i++) {
            level.var_ca1314ff09b650f1 = array_add(level.var_ca1314ff09b650f1, "zombie_base_armored_heavy");
            level.var_cfefa2ba0f234157++;
        }
    }
    if (level.var_a43b67b5f86b3332 < level.hellhound_count) {
        add_amount = level.hellhound_count - level.var_a43b67b5f86b3332;
        for (i = 0; i < add_amount; i++) {
            level.var_ca1314ff09b650f1 = array_add(level.var_ca1314ff09b650f1, "zombie_hellhound");
            level.var_a43b67b5f86b3332++;
        }
    }
    if (level.var_64dfea01f5c51f4c < level.var_cead06788dacad3e) {
        add_amount = level.var_cead06788dacad3e - level.var_64dfea01f5c51f4c;
        for (i = 0; i < add_amount; i++) {
            level.var_ca1314ff09b650f1 = array_add(level.var_ca1314ff09b650f1, "zombie_mimic");
            level.var_64dfea01f5c51f4c++;
        }
    }
    if (level.var_be60801963958c7f < level.var_7dda105d87b7b147) {
        add_amount = level.var_7dda105d87b7b147 - level.var_be60801963958c7f;
        for (i = 0; i < add_amount; i++) {
            level.var_ca1314ff09b650f1 = array_add(level.var_ca1314ff09b650f1, "zombie_mangler");
            level.var_be60801963958c7f++;
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2629
// Size: 0x121
function function_ca817bf862167332(player) {
    min_dist = 400;
    max_dist = 1000;
    if (!isdefined(player)) {
        return undefined;
    }
    x = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    y = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    safeorigin = getclosestpointonnavmesh(player.origin + (x, y, 0), undefined, 0, undefined, 0);
    if (scripts\mp\outofbounds::ispointinoutofbounds(safeorigin)) {
        dist = distance(safeorigin, level.zone.trigger.origin);
        nodes = getnodesinradiussorted(safeorigin, dist + 100, 0, 512, "path");
        node = nodes[0];
    } else {
        nodes = getnodesinradiussorted(safeorigin, 300, 0, 128, "path");
        node = array_random(nodes);
    }
    return node.origin;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2753
// Size: 0x18e
function function_efaf11bef8c9efed(zone, min_value, max_value) {
    min_dist = 400;
    max_dist = 800;
    if (isdefined(min_value)) {
        min_dist = min_value;
    }
    if (isdefined(max_value)) {
        max_dist = max_value;
    }
    if (!isdefined(zone)) {
        return undefined;
    }
    x = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    y = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    safeorigin = getclosestpointonnavmesh(zone.trigger.origin + (x, y, 0));
    if (!isdefined(safeorigin)) {
        safeorigin = getclosestpointonnavmesh(zone.trigger.origin);
    }
    if (scripts\mp\outofbounds::ispointinoutofbounds(safeorigin)) {
        dist = distance(safeorigin, level.zone.trigger.origin);
        nodes = getnodesinradiussorted(safeorigin, dist + 100, 0, 512, "path");
        node = array_random(nodes);
    } else {
        nodes = getnodesinradiussorted(safeorigin, 400, 0, 256, "path");
        node = array_random(nodes);
    }
    if (!isdefined(node)) {
        nodes = getnodesinradiussorted(safeorigin, 300, 0, 128, "path");
        node = nodes[0];
    }
    return node.origin;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28ea
// Size: 0x277
function function_f5cda710477f2725(zone, min_value, max_value) {
    min_dist = 400;
    max_dist = 800;
    if (isdefined(min_value)) {
        min_dist = min_value;
    }
    if (isdefined(max_value)) {
        max_dist = max_value;
    }
    if (!isdefined(zone)) {
        return undefined;
    }
    x = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    y = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    safeorigin = getclosestpointonnavmesh(zone.origin + (x, y, 0));
    if (!isdefined(safeorigin)) {
        safeorigin = getclosestpointonnavmesh(zone.origin);
    }
    if (scripts\mp\outofbounds::ispointinoutofbounds(safeorigin)) {
        dist = distance(safeorigin, level.portal.origin);
        nodes = getnodesinradiussorted(safeorigin, dist + 100, 0, 512, "path");
    } else {
        nodes = getnodesinradiussorted(safeorigin, 400, 0, 256, "path");
    }
    if (!isdefined(nodes)) {
        nodes = getnodesinradiussorted(safeorigin, 300, 0, 128, "path");
    }
    nodes = array_randomize(nodes);
    offset = (0, 0, 50);
    foreach (node in nodes) {
        if (!ispointinvolume(node.origin + offset, level.zone.trigger)) {
            return node.origin;
        }
    }
    nodes = getnodesinradiussorted(safeorigin, 600, 0, 128, "path");
    nodes = array_randomize(nodes);
    foreach (node in nodes) {
        if (!ispointinvolume(node.origin + offset, level.zone.trigger)) {
            return node.origin;
        }
    }
    return safeorigin;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6a
// Size: 0x16a
function function_12d3db51fd7f88b5(zone) {
    min_dist = 600;
    max_dist = 700;
    if (!isdefined(zone)) {
        return undefined;
    }
    x = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    y = randomintrange(min_dist, max_dist) * pow(-1, randomint(2));
    safeorigin = getclosestpointonnavmesh(zone.trigger.origin + (x, y, 0));
    if (!isdefined(safeorigin)) {
        safeorigin = getclosestpointonnavmesh(zone.trigger.origin);
    }
    if (scripts\mp\outofbounds::ispointinoutofbounds(safeorigin)) {
        dist = distance(safeorigin, level.zone.trigger.origin);
        nodes = getnodesinradiussorted(safeorigin, dist + 100, 0, 512, "path");
        node = array_random(nodes);
    } else {
        nodes = getnodesinradiussorted(safeorigin, 400, 0, 256, "path");
        node = array_random(nodes);
    }
    if (!isdefined(node)) {
        nodes = getnodesinradiussorted(safeorigin, 300, 0, 128, "path");
        node = nodes[0];
    }
    return node.origin;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cdd
// Size: 0xe9
function function_915d5e6e37ca560d() {
    self endon("death");
    self.goalpos_set = 0;
    self.script_goalradius = 500;
    while (true) {
        if (isdefined(level.zone) && level.zone.active) {
            if (!self.goalpos_set && level.zone.active && distance(self.origin, level.zone.trigger.origin) < self.script_goalradius) {
                self.goalpos_set = 1;
                self setgoalpos(level.zone.trigger.origin);
            } else {
                self.goalpos_set = 0;
                waitframe();
                continue;
            }
        }
        waitframe();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dce
// Size: 0x209
function function_dcfd39bb50e8f992(zombie_type) {
    self waittill("death", attacker);
    spawn_location = self.origin;
    if (getgametype() == "koth_horde_haunting" && getdvarint(@"hash_56c4a304cb548a29") == 1) {
        level thread namespace_caa20322e8a4324d::function_7502f58e600e74a2(self, attacker, "new_loot_item_spawned");
    }
    switch (zombie_type) {
    case #"hash_1380581f5144c465":
        if (getgametype() != "koth_horde_haunting" && percent_chance(getdvarint(@"hash_31208c43b301e179", 100))) {
            thread create_bone(spawn_location);
        }
        level.var_cd97b8529d2084ec--;
        break;
    case #"hash_99a38be9e88b5244":
        if (getgametype() != "koth_horde_haunting" && percent_chance(getdvarint(@"hash_cf9352a60a71c1b1", 100))) {
            thread create_skull(spawn_location, "zombie_base_armored_heavy");
        }
        level.var_cfefa2ba0f234157--;
        break;
    case #"hash_99d5ac2f7a4d8083":
        if (getgametype() != "koth_horde_haunting" && percent_chance(getdvarint(@"hash_4d4145d74d1c4569", 100))) {
            thread create_skull(spawn_location, "zombie_hellhound");
        }
        level.var_a43b67b5f86b3332--;
        break;
    case #"hash_59740dd906312a95":
        if (getgametype() != "koth_horde_haunting" && percent_chance(getdvarint(@"hash_b140669a64f9e9e7", 100))) {
            thread create_skull(spawn_location, "zombie_mimic");
        }
        level.var_64dfea01f5c51f4c--;
        break;
    case #"hash_2f5c52f1e6ef9284":
        if (getgametype() != "koth_horde_haunting" && percent_chance(getdvarint(@"hash_aac96287cd992e0e", 100))) {
            thread create_skull(spawn_location, "zombie_mimic");
        }
        level.var_be60801963958c7f--;
        break;
    default:
        break;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fdf
// Size: 0x236
function create_bone(spawn_location) {
    visuals[0] = spawn("script_model", (0, 0, 0));
    visuals[0] setmodel("jup_accessory_horde_bone_pile_01");
    visuals[0] hudoutlineenable("outline_depth_white");
    trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
    useteam = "any";
    usetime = 0;
    bone = scripts\mp\gameobjects::createuseobject(useteam, trigger, visuals, (0, 0, 16), "undefined", 1);
    bone.ownerteam = "neutral";
    level.bones = array_add(level.bones, bone);
    bone.onuse = &function_93b7660d07191552;
    bone scripts\mp\gameobjects::setusetime(usetime);
    pos = spawn_location + (0, 0, 14);
    bone.curorigin = pos;
    bone.trigger.origin = pos;
    bone.visuals[0].origin = pos;
    bone.var_2fe318403a6542f6 = spawn("script_model", pos + (0, 0, 5));
    bone scripts\mp\gameobjects::initializetagpathvariables();
    bone scripts\mp\gameobjects::allowuse("any");
    playsoundatpos(bone.trigger.origin + (0, 0, 15), "jup_hordepoint_bone_drop");
    bone.var_2fe318403a6542f6 playloopsound("jup_hordepoint_bone_lp");
    foreach (player in level.players) {
        bone.visuals[0] showtoplayer(player);
    }
    bone thread function_96d560240ecdae0d();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x321d
// Size: 0x2c2
function create_skull(spawn_location, zombie_type) {
    switch (zombie_type) {
    case #"hash_99a38be9e88b5244":
        skull_model = "jup_accessory_horde_armored_skull_01";
        break;
    case #"hash_99d5ac2f7a4d8083":
        skull_model = "jup_accessory_horde_hellhound_skull_01";
        break;
    case #"hash_59740dd906312a95":
        skull_model = "jup_accessory_horde_mimic_skull_01";
        break;
    case #"hash_2f5c52f1e6ef9284":
        skull_model = "jup_accessory_horde_armored_skull_01";
        break;
    default:
        break;
    }
    visuals[0] = spawn("script_model", (0, 0, 0));
    visuals[0] setmodel(skull_model);
    visuals[0] hudoutlineenable("outline_depth_orange");
    trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
    useteam = "any";
    usetime = 0;
    skull = scripts\mp\gameobjects::createuseobject(useteam, trigger, visuals, (0, 0, 16), "undefined", 1);
    skull.ownerteam = "neutral";
    skull.skull_type = zombie_type;
    level.skulls = array_add(level.skulls, skull);
    skull.onuse = &function_ba520f4a9495a8a1;
    skull scripts\mp\gameobjects::setusetime(usetime);
    pos = spawn_location + (0, 0, 14);
    skull.curorigin = pos;
    skull.trigger.origin = pos;
    skull.visuals[0].origin = pos;
    skull.var_2fe318403a6542f6 = spawn("script_model", pos + (0, 0, 5));
    skull scripts\mp\gameobjects::initializetagpathvariables();
    skull scripts\mp\gameobjects::allowuse("any");
    playsoundatpos(skull.trigger.origin + (0, 0, 15), "jup_hordepoint_skull_drop");
    skull.var_2fe318403a6542f6 playloopsound("jup_hordepoint_skull_lp");
    foreach (player in level.players) {
        skull.visuals[0] showtoplayer(player);
    }
    skull thread function_96d560240ecdae0d();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34e7
// Size: 0x14a
function function_93b7660d07191552(player) {
    if (!isdefined(player.bone_count)) {
        player.bone_count = 0;
    }
    player.bone_count += level.var_e6d635dd9b7f73b3;
    player scripts\cp_mp\challenges::function_8359cadd253f9604(player, "event_the_hunt_bones", level.var_e6d635dd9b7f73b3);
    player function_b216b39d9ea94e4a(level.var_e6d635dd9b7f73b3);
    player playsoundtoplayer("jup_hordepoint_bone_pickup", player);
    player playsoundtoteam("jup_hordepoint_bone_pickup_enemy", getotherteam(player.team)[0], player);
    player playsoundtoteam("jup_hordepoint_bone_pickup_ally", player.team, player);
    self.var_2fe318403a6542f6 stoploopsound();
    str_fx = getfx("bones");
    stopfxontag(str_fx, self.tag, "tag_origin");
    self notify("stop_spin");
    self.visuals[0] delete();
    self.var_2fe318403a6542f6 delete();
    thread scripts\mp\gameobjects::deleteuseobject();
    level.bones = array_remove(level.bones, self);
    player notify("drop_pickup");
    player thread function_b591b3abd719646c();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3639
// Size: 0x482
function function_ba520f4a9495a8a1(player) {
    playersonteam = scripts\mp\utility\teams::getteamdata(player.team, "players");
    switch (self.skull_type) {
    case #"hash_99a38be9e88b5244":
        foreach (member in playersonteam) {
            if (!isdefined(member.var_d0b217f00fef3917)) {
                member.var_d0b217f00fef3917 = 0;
            }
            member.var_d0b217f00fef3917 += level.var_eb9d721411a7178a;
            member scripts\cp_mp\challenges::function_8359cadd253f9604(member, "event_the_hunt_skulls_armored", level.var_eb9d721411a7178a);
            member function_cadce08fab348041(level.var_eb9d721411a7178a);
        }
        player playsoundtoplayer("jup_hordepoint_skull_helmet_pickup", player);
        player playsoundtoteam("jup_hordepoint_skull_helmet_pickup_enemy", getotherteam(player.team)[0], player);
        player playsoundtoteam("jup_hordepoint_skull_helmet_pickup_ally", player.team, player);
        break;
    case #"hash_99d5ac2f7a4d8083":
        foreach (member in playersonteam) {
            if (!isdefined(member.var_d848e2025d8597d2)) {
                member.var_d848e2025d8597d2 = 0;
            }
            member.var_d848e2025d8597d2 += level.var_2862a46691940273;
            member scripts\cp_mp\challenges::function_8359cadd253f9604(member, "event_the_hunt_skulls_hellhound", level.var_2862a46691940273);
            member function_cadce08fab348041(level.var_2862a46691940273);
        }
        player playsoundtoplayer("jup_hordepoint_skull_dog_pickup", player);
        player playsoundtoteam("jup_hordepoint_skull_dog_pickup_enemy", getotherteam(player.team)[0], player);
        player playsoundtoteam("jup_hordepoint_skull_dog_pickup_ally", player.team, player);
        break;
    case #"hash_59740dd906312a95":
        foreach (member in playersonteam) {
            if (!isdefined(member.var_92e210c188ad9778)) {
                member.var_92e210c188ad9778 = 0;
            }
            member.var_92e210c188ad9778 += level.var_2a0c9dcc6a722a85;
            member scripts\cp_mp\challenges::function_8359cadd253f9604(member, "event_the_hunt_skulls_mimic", level.var_2a0c9dcc6a722a85);
            member function_cadce08fab348041(level.var_2a0c9dcc6a722a85);
        }
        player playsoundtoplayer("jup_hordepoint_skull_elite_pickup", player);
        player playsoundtoteam("jup_hordepoint_skull_elite_pickup_enemy", getotherteam(player.team)[0], player);
        player playsoundtoteam("jup_hordepoint_skull_elite_pickup_ally", player.team, player);
        break;
    case #"hash_2f5c52f1e6ef9284":
        foreach (member in playersonteam) {
            member.var_55b63b79ebd4a56d++;
        }
        player playsoundtoplayer("jup_hordepoint_skull_helmet_pickup", player);
        player playsoundtoteam("jup_hordepoint_skull_helmet_pickup_enemy", getotherteam(player.team)[0], player);
        player playsoundtoteam("jup_hordepoint_skull_helmet_pickup_ally", player.team, player);
        break;
    default:
        break;
    }
    str_fx = getfx("bones");
    stopfxontag(str_fx, self.tag, "tag_origin");
    self.var_2fe318403a6542f6 stoploopsound();
    self notify("stop_spin");
    self.visuals[0] delete();
    self.var_2fe318403a6542f6 delete();
    thread scripts\mp\gameobjects::deleteuseobject();
    level.skulls = array_remove(level.skulls, self);
    player notify("drop_pickup");
    player thread function_b591b3abd719646c();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ac3
// Size: 0x61
function function_b216b39d9ea94e4a(drop_amount) {
    if (getdvarint(@"hash_f51ed3869549c4df", 1) == 1) {
        if (!isdefined(self.var_71466585b9fe6080)) {
            self.var_71466585b9fe6080 = 0;
        }
        self.var_71466585b9fe6080 += drop_amount;
        self setclientomnvar("ui_bones_collected", self.var_71466585b9fe6080);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2c
// Size: 0x61
function function_cadce08fab348041(drop_amount) {
    if (getdvarint(@"hash_f51ed3869549c4df", 1) == 1) {
        if (!isdefined(self.var_4096aeb7caafc01f)) {
            self.var_4096aeb7caafc01f = 0;
        }
        self.var_4096aeb7caafc01f += drop_amount;
        self setclientomnvar("ui_skulls_collected", self.var_4096aeb7caafc01f);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b95
// Size: 0x263
function function_96d560240ecdae0d() {
    self endon("stop_spin");
    var_d9f76c34e90dfb4d = 6;
    str_fx = getfx("bones");
    self.tag = scripts\engine\utility::spawn_tag_origin(self.visuals[0].origin, (0, 0, 0));
    self.tag linkto(self.visuals[0]);
    self.tag show();
    waitframe();
    if (isdefined(self.tag)) {
        playfxontag(str_fx, self.tag, "tag_origin");
    }
    rotation_value = randomintrange(140, 180);
    going_up = cointoss();
    for (i = 0; i < level.var_3c58cca11f993e45; i++) {
        self.visuals[0] rotateby((0, rotation_value, 0), 1);
        if (going_up) {
            self.visuals[0] moveto(self.visuals[0].origin + (0, 0, 5), 1, 0.25, 0.25);
            going_up = !going_up;
        } else {
            self.visuals[0] moveto(self.visuals[0].origin - (0, 0, 5), 1, 0.25, 0.25);
            going_up = !going_up;
        }
        if (i > level.var_3c58cca11f993e45 - var_d9f76c34e90dfb4d) {
            self.visuals[0] hide();
            wait 0.5;
            self.visuals[0] show();
            wait 0.5;
            continue;
        }
        wait 1;
    }
    stopfxontag(str_fx, self.tag, "tag_origin");
    self.var_2fe318403a6542f6 stoploopsound();
    self.visuals[0] delete();
    self.var_2fe318403a6542f6 delete();
    thread scripts\mp\gameobjects::deleteuseobject();
    if (isdefined(self.skull_type)) {
        level.skulls = array_remove(level.skulls, self);
        return;
    }
    level.bones = array_remove(level.bones, self);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e00
// Size: 0x23
function function_b591b3abd719646c() {
    self endon("death");
    self.var_93d588c5ef8b2dec = 0;
    wait 0.25;
    self.var_93d588c5ef8b2dec = undefined;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2b
// Size: 0x92
function function_7b6ff5793cbddbca() {
    init_powerups("on_zombie_ai_killed");
    utility::registersharedfunc("powerups", "showPowerupHud", &function_676437737684783f);
    function_c507569144b8d1a3("on_zombie_ai_killed");
    level callback::add("on_zombie_ai_killed", &function_1c0957ff8e2f49df);
    root = function_ecdae672c660149e();
    root.var_b0d3396c2b9e78d4 = &function_cad183d7f2f4f301;
    root.var_5a4c4a84060b59da = &function_5bfe254c7e9aa4db;
    root.var_5cdeaceda00983a3 = &function_f91870701cdc3aaa;
    level.dangerzoneskipequipment = 1;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec5
// Size: 0x3c
function function_ecdae672c660149e() {
    if (!isdefined(level.powerups_root)) {
        level.powerups_root = spawnstruct();
    }
    level.powerups_root.show_splash = 1;
    return level.powerups_root;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0a
// Size: 0x19
function function_c507569144b8d1a3(event) {
    level callback::add(event, &function_962ed9cc14292aa5);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f2b
// Size: 0x13a
function init_fx() {
    level._effect["powerup_intro"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_powerup_spawn_in_green.vfx");
    level._effect["powerup_on"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_powerup_glow_green.vfx");
    level._effect["powerup_grabbed"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_powerup_glow_green_grab.vfx");
    level._effect["blue"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_essence_vials_sm.vfx");
    level._effect["purple"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_zm_crystal_rarity_small_rare.vfx");
    level._effect["bones"] = loadfx("vfx/jup/modes/vfx_skull_glow_white.vfx");
    level._effect["pap_weapon_epic"] = loadfx("vfx/jup/modes/vfx_pap_pickup_purp.vfx");
    level._effect["pap_weapon_legend"] = loadfx("vfx/jup/modes/vfx_pap_pickup_orng.vfx");
    level._effect["ground_portal_spawn"] = loadfx("vfx/t10/levels/zm_t10_garnet/vfx_aether_squall_gateway_portal_ground.vfx");
    level._effect["portal_spawn"] = loadfx("vfx/t10/levels/zm_t10_garnet/vfx_aether_squall_gateway_portal.vfx");
    level._effect["big_portal_spawn"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_hvt_aether_portal_spawn.vfx");
    level._effect["big_portal_close"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_hvt_aether_portal_close.vfx");
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x406d
// Size: 0x166
function function_1c0957ff8e2f49df(params) {
    playerattacker = params.eattacker;
    if (!isdefined(playerattacker) || !isplayer(playerattacker)) {
        return;
    }
    playerattacker scripts\mp\utility\stats::incpersstat("zombieDeaths", 1);
    playerattacker scripts\mp\utility\stats::setextrascore2(playerattacker.pers["zombieDeaths"]);
    if (!isdefined(playerattacker.pers["agentsKillstreakCount"])) {
        playerattacker.pers["agentsKillstreakCount"] = 1;
    } else {
        playerattacker.pers["agentsKillstreakCount"]++;
    }
    if (playerattacker.pers["agentsKillstreakCount"] == level.agentskillstreakcount) {
        if (playerattacker scripts\cp_mp\utility\player_utility::_isalive()) {
            event = #"kill";
            points = scripts\mp\rank::getscoreinfovalue(event);
            playerattacker scripts\mp\killstreaks\killstreaks::givestreakpoints(event, 1, points);
        }
        playerattacker.pers["agentsKillstreakCount"] = 0;
    }
    scripts\mp\gamescore::giveteamscoreforobjective(playerattacker.pers["team"], level.var_e098f97eef14d3de, 0);
    playerattacker thread scripts\mp\utility\points::doScoreEvent(#"hash_5262ef3adf2e95f4");
    if (playerattacker istouching(level.zone.trigger)) {
        playerattacker thread scripts\mp\utility\points::doScoreEvent(#"hash_837ac343227cf54c");
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41db
// Size: 0x230
function function_962ed9cc14292aa5(params) {
    if (!function_76ccbdb9c3d32f22()) {
        return;
    }
    if (istrue(self.no_powerups)) {
        return;
    }
    var_7428d4b8de94a392 = getdvarint(@"hash_1b4e207b7705cf4a", 5);
    var_67c8a51223f3afcc = getdvarint(@"hash_1b712a7b772c2d00", 15);
    var_429f631e84274dd3 = randomintrange(var_7428d4b8de94a392, var_67c8a51223f3afcc);
    /#
        if (getdvarint(@"hash_3d6b1368ab7a225f", 0)) {
            var_429f631e84274dd3 = 100;
        }
    #/
    if (scripts\engine\utility::percent_chance(var_429f631e84274dd3)) {
        drop_origin = isai(self) ? self.var_f182de6049d1ab48 : self.origin;
        thread function_11c37750961667d4(drop_origin);
        return;
    }
    var_1ffd96483dfd0025 = getdvarint(@"hash_ca7423874db221e7", 10);
    var_61c1ec429e840863 = getdvarint(@"hash_ca9711874dd84209", 20);
    var_429f631e84274dd3 = randomintrange(var_1ffd96483dfd0025, var_61c1ec429e840863);
    if (!scripts\engine\utility::percent_chance(var_429f631e84274dd3)) {
        return;
    }
    root = function_ecdae672c660149e();
    if (isdefined(root.var_4e1cce72cf8d8f63)) {
        if (!self [[ root.var_4e1cce72cf8d8f63 ]](params)) {
            return;
        }
    }
    drop_pos = isai(self) ? self.var_f182de6049d1ab48 : self.origin;
    if (!isdefined(level.var_2a474bda8984ac2a)) {
        level.var_2a474bda8984ac2a = throttle_initialize("powerup_drop", 1, level.framedurationseconds);
    }
    var_8ed8f695a88af352 = spawnstruct();
    function_f632348cbb773537(level.var_2a474bda8984ac2a, var_8ed8f695a88af352);
    var_cdcc412515151986 = 1;
    if (isdefined(root.var_29e4cb253683279f)) {
        params.etarget = self;
        var_cdcc412515151986 = level [[ root.var_29e4cb253683279f ]](params);
    }
    if (var_cdcc412515151986) {
        var_d01a68d4c8274caf = undefined;
        var_d01a68d4c8274caf = function_3f65dbe307c93086();
        if (isdefined(var_d01a68d4c8274caf)) {
            offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
            level thread powerup_drop(var_d01a68d4c8274caf, drop_pos + offset);
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4413
// Size: 0x3a1
function function_11c37750961667d4(drop_origin) {
    weapons = ["jup_jp19_ar_acharlie_mp", "jup_jp02_sm_scharlie3_mp", "jup_cp08_br_xmike5_mp", "jup_jp02_dm_bromeop_mp", "jup_jp06_lm_pkilop_mp"];
    random_weapon = randomintrange(0, weapons.size);
    var_901751caeef17d3 = weapons[random_weapon];
    if (random_weapon == 0) {
        weapon_blueprints = ["jup_jp19_ar_acharlie_v2998", "jup_jp19_ar_acharlie_v2999"];
    } else if (random_weapon == 1) {
        weapon_blueprints = ["jup_jp02_sm_scharlie3_v2998", "jup_jp02_sm_scharlie3_v2999"];
    } else if (random_weapon == 2) {
        weapon_blueprints = ["jup_cp08_br_xmike5_v2998", "jup_cp08_br_xmike5_v2999"];
    } else if (random_weapon == 3) {
        weapon_blueprints = ["jup_jp02_dm_bromeop_v2998", "jup_jp02_dm_bromeop_v2999"];
    } else if (random_weapon == 4) {
        weapon_blueprints = ["jup_jp06_lm_pkilop_v2998", "jup_jp06_lm_pkilop_v2999"];
    }
    attachments = [];
    spawnflags = 1;
    angles = (0, 0, 0);
    weapon_pos = drop_origin;
    dist = randomfloatrange(16, 32);
    dir = flatten_vector(randomvector(1));
    v_pos = weapon_pos + dir * dist;
    drop_pos = getclosestpointonnavmesh(v_pos);
    weapon_pos = getgroundposition(drop_pos, 16) + (0, 0, 24);
    level.camo_array = ["jup_camo_pap_a_01_mp", "jup_camo_pap_a_03_mp"];
    rarity = randomintrange(0, level.camo_array.size);
    camo = level.camo_array[rarity];
    blueprint = weapon_blueprints[rarity];
    id = namespace_38b993c4618e76cd::getlootidfromref(blueprint);
    weapon_variant = function_64ccc54bdbae5cf6(id);
    var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(var_901751caeef17d3);
    var_91bbf8d2294a656e = namespace_e0ee43ef2dddadaa::weaponattachcustomtoidmap(var_49e6ef3edadd524e, weapon_variant);
    attachmentids = [];
    foreach (attachment, id in var_91bbf8d2294a656e) {
        attachments[attachments.size] = attachment;
        attachmentids[attachmentids.size] = id;
    }
    drop = scripts\common\utility::function_ec8a443fe8165fe4(var_901751caeef17d3, weapon_pos, attachments, angles, spawnflags, camo);
    drop.rarity = rarity;
    var_232d01cd17ccac9d = spawn("script_model", weapon_pos + (0, 0, 5));
    var_c8cb5949cc431171 = weaponclipsize(drop);
    ammo_multiplier = getdvarint(@"hash_c09da51fabee43b6", 1);
    drop itemweaponsetammo(var_c8cb5949cc431171, var_c8cb5949cc431171 * ammo_multiplier);
    array = ["pap_weapon_epic", "pap_weapon_legend"];
    str_fx = getfx(array[rarity]);
    waitframe();
    if (isdefined(drop)) {
        playfxontag(str_fx, drop, "j_gun");
        playsoundatpos(weapon_pos + (0, 0, 5), "jup_hordepoint_pap_weapon_appear");
        var_232d01cd17ccac9d playloopsound("jup_hordepoint_pap_weapon_lp");
        drop thread function_ba51ee549bec6b9c(var_232d01cd17ccac9d, var_901751caeef17d3);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47bc
// Size: 0x69
function function_ba51ee549bec6b9c(var_c7a36896c1b990da, var_901751caeef17d3) {
    level endon("game_ended");
    var_bffcbd62498724e1 = function_f50c5efa63074cf6(var_c7a36896c1b990da);
    droppeditem = var_bffcbd62498724e1[1];
    player = var_bffcbd62498724e1[0];
    if (isdefined(droppeditem)) {
        player playlocalsound("jup_hordepoint_pap_weapon_pickup");
    }
    var_c7a36896c1b990da stoploopsound();
    waitframe();
    var_c7a36896c1b990da delete();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x482e
// Size: 0x3d
function function_f50c5efa63074cf6(var_c7a36896c1b990da) {
    thread function_b4aef3b848dbb73a(var_c7a36896c1b990da);
    self waittill("trigger", player, droppeditem);
    return [player, droppeditem];
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4874
// Size: 0x87
function function_b4aef3b848dbb73a(var_c7a36896c1b990da) {
    self endon("entitydeleted");
    for (i = 0; i < level.var_36a0d9736ff96a13; i++) {
        if (i < level.var_36a0d9736ff96a13 - 6) {
            wait 1;
            continue;
        }
        self hide(1);
        wait 0.5;
        self show();
        wait 0.5;
    }
    if (isdefined(var_c7a36896c1b990da)) {
        var_c7a36896c1b990da stoploopsound();
        waitframe();
        var_c7a36896c1b990da delete();
    }
    if (isdefined(self)) {
        self delete();
    }
    return undefined;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4904
// Size: 0x94
function init_powerups(var_751ff6b802605de7, var_931062a9b77a0c65) {
    level flag_set("drop_powerups");
    root = function_ecdae672c660149e();
    root.active_powerups = [];
    root.powerups = [];
    root.powerup_index = 0;
    root.var_eaf13acb539829eb = [];
    root.var_211f18c4ee5c760f = [];
    level thread function_4d4c49885e6b2490(var_751ff6b802605de7, var_931062a9b77a0c65);
    utility::registersharedfunc("powerups", "dropPowerup", &powerup_drop);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x49a0
// Size: 0x4bb
function private function_4d4c49885e6b2490(var_751ff6b802605de7, var_931062a9b77a0c65) {
    wait 1;
    root = function_ecdae672c660149e();
    var_80a668917844846 = function_e6f547b7f0a996ed();
    list_index = 0;
    foreach (var_610934571c352e02 in var_80a668917844846.powerup_list) {
        if (isdefined(var_610934571c352e02.ref) && isdefined(var_610934571c352e02.bundle)) {
            var_2fa928445372d72 = getscriptbundle("powerup:" + var_610934571c352e02.bundle);
            root.powerups[var_610934571c352e02.ref] = var_2fa928445372d72;
            root.var_eaf13acb539829eb[var_610934571c352e02.ref] = list_index;
            if (istrue(var_610934571c352e02.var_cc9e5dd3893defb)) {
                root.var_211f18c4ee5c760f[root.var_211f18c4ee5c760f.size] = var_610934571c352e02.ref;
            }
        }
        list_index++;
    }
    root.var_211f18c4ee5c760f = array_randomize(root.var_211f18c4ee5c760f);
    function_5b0b83c04b92d1fa("drop_event_incremental_number_per_player", var_80a668917844846.drop_event_incremental_number_per_player);
    if (isarray(var_80a668917844846.var_652fff0810f34100)) {
        drop_event_ranges = [];
        foreach (range in var_80a668917844846.var_652fff0810f34100) {
            range_struct = spawnstruct();
            range_struct.n_players = range.player_number;
            range_struct.n_min = range.min;
            range_struct.n_max = range.max;
            range_struct.var_9bf1ae0273911662 = range.var_7cce2df0592b4cf;
            range_struct.str_label = range.category_label;
            drop_event_ranges[drop_event_ranges.size] = range_struct;
        }
        function_5b0b83c04b92d1fa("drop_event_ranges", drop_event_ranges);
    }
    function_5b0b83c04b92d1fa("drop_height_offset", default_to(var_80a668917844846.drop_height_offset, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_max", default_to(var_80a668917844846.model_drop_delay_max, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_min", default_to(var_80a668917844846.model_drop_delay_min, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_distance_outer", default_to(var_80a668917844846.model_drop_delay_distance_outer, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_distance_inner", default_to(var_80a668917844846.model_drop_delay_distance_inner, 0));
    function_5b0b83c04b92d1fa("intro_vfx_label", var_80a668917844846.intro_vfx_label);
    function_5b0b83c04b92d1fa("intro_vfx_duration", var_80a668917844846.intro_vfx_duration);
    function_5b0b83c04b92d1fa("idle_vfx_label", var_80a668917844846.idle_vfx_label);
    function_5b0b83c04b92d1fa("grabbed_vfx_label", var_80a668917844846.grabbed_vfx_label);
    function_5b0b83c04b92d1fa("grabbed_vfx_duration", var_80a668917844846.grabbed_vfx_duration);
    var_19aff13734d0248d = function_5b0b83c04b92d1fa("powerup_ammo_spacing_min", int(default_to(var_80a668917844846.var_67c7338208a813a2, 0)));
    var_198cdb3734a9ac73 = function_5b0b83c04b92d1fa("powerup_ammo_spacing_max", int(default_to(var_80a668917844846.var_67a41d8208819b88, 0)));
    if (var_198cdb3734a9ac73 != 0 || var_19aff13734d0248d != 0) {
        if (var_198cdb3734a9ac73 > var_19aff13734d0248d) {
            root.var_34d5d13b703a35c9 = function_1652f8a8050283bd(var_19aff13734d0248d, var_198cdb3734a9ac73);
        } else {
            assertmsg("<dev string:x1c>" + root.var_8487d1e9569b89de);
        }
    }
    if (isarray(root.var_4add5bc41afc8ae)) {
        foreach (struct in root.var_4add5bc41afc8ae) {
            _register(struct.str_powerup, struct.func_grab_powerup, struct.func_should_drop_with_regular_powerups, struct.var_58a4e1d475eb979b);
        }
        root.var_4add5bc41afc8ae = undefined;
    }
    if (isdefined(var_931062a9b77a0c65)) {
        level [[ var_931062a9b77a0c65 ]]();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e63
// Size: 0x19
function function_8ca4b49ee68720bf(event) {
    level callback::add(event, &function_320c6c17c3136d0a);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e84
// Size: 0x152
function function_e6f547b7f0a996ed() {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_a61c20c83f255666)) {
        if (isdefined(level.var_a77c94576da6cab0)) {
            var_a77c94576da6cab0 = "poweruplist:" + level.var_a77c94576da6cab0;
            root.var_8487d1e9569b89de = level.var_a77c94576da6cab0;
        } else {
            var_a77c94576da6cab0 = undefined;
            if (isdefined(level.gametypebundle) && isdefined(level.gametypebundle.powerup_list)) {
                var_a77c94576da6cab0 = "poweruplist:" + level.gametypebundle.powerup_list;
                root.var_8487d1e9569b89de = level.gametypebundle.powerup_list;
            } else if (isdefined(level.gamemodebundle) && isdefined(level.gamemodebundle.powerup_list)) {
                var_a77c94576da6cab0 = "poweruplist:" + level.gamemodebundle.powerup_list;
                root.var_8487d1e9569b89de = level.gamemodebundle.powerup_list;
            }
            assertex(isdefined(var_a77c94576da6cab0), "<dev string:x52>");
        }
        root.var_a61c20c83f255666 = getscriptbundle(var_a77c94576da6cab0);
    }
    return root.var_a61c20c83f255666;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4fdf
// Size: 0x73
function register_powerup(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b) {
    root = function_ecdae672c660149e();
    if (isarray(root.powerups) && root.powerups.size > 0) {
        _register(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b);
        return;
    }
    function_854b2d27ee860e0e(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x505a
// Size: 0x9c
function _register(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b) {
    root = function_ecdae672c660149e();
    if (isdefined(root.powerups[str_powerup])) {
        root.powerups[str_powerup].func_grab_powerup = func_grab_powerup;
        root.powerups[str_powerup].func_should_drop_with_regular_powerups = default_to(func_should_drop_with_regular_powerups, &func_should_always_drop);
        root.powerups[str_powerup].var_58a4e1d475eb979b = var_58a4e1d475eb979b;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x50fe
// Size: 0xb2
function function_854b2d27ee860e0e(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b) {
    root = function_ecdae672c660149e();
    if (!isarray(root.var_4add5bc41afc8ae)) {
        root.var_4add5bc41afc8ae = [];
    }
    struct = spawnstruct();
    struct.str_powerup = str_powerup;
    struct.func_grab_powerup = func_grab_powerup;
    struct.func_should_drop_with_regular_powerups = func_should_drop_with_regular_powerups;
    struct.var_58a4e1d475eb979b = var_58a4e1d475eb979b;
    root.var_4add5bc41afc8ae[root.var_4add5bc41afc8ae.size] = struct;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x51b8
// Size: 0x52
function powerup_activate(str_powerup, ent_powerup) {
    assert(isplayer(self));
    player = self;
    var_2fa928445372d72 = function_519d44e54a9b8ae5(str_powerup);
    player thread [[ var_2fa928445372d72.func_grab_powerup ]](str_powerup, ent_powerup);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5212
// Size: 0x1d
function function_a7f6960c623182d2(str_powerup) {
    return istrue(function_519d44e54a9b8ae5(str_powerup).var_87bfb9b44387c5c8);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5238
// Size: 0x29
function function_c414330b83d2e427(str_powerup) {
    return !function_a7f6960c623182d2(str_powerup) && istrue(function_519d44e54a9b8ae5(str_powerup).var_7af5681aad466bb);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x526a
// Size: 0x34
function function_896f9300bcde23c2(str_powerup) {
    affected_radius = function_519d44e54a9b8ae5(str_powerup).var_11a46abceed0ee1c;
    if (isfloat(affected_radius)) {
        return affected_radius;
    }
    return 0;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52a7
// Size: 0x1d
function function_519d44e54a9b8ae5(str_powerup) {
    return function_ecdae672c660149e().powerups[str_powerup];
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52cd
// Size: 0x191
function function_a56a8b17eae57b09(str_powerup, powerup_origin) {
    root = function_ecdae672c660149e();
    a_players = [];
    if (function_a7f6960c623182d2(str_powerup)) {
        a_players = array_add(a_players, self);
    } else if (function_c414330b83d2e427(str_powerup)) {
        a_players = level.players;
    } else if (isdefined(root.var_d476bc08981505b4)) {
        a_players = self [[ root.var_d476bc08981505b4 ]]();
    } else {
        foreach (player in level.players) {
            if (isalive(player) && self.team == player.team) {
                a_players = array_add(a_players, player);
            }
        }
    }
    final_players = [];
    var_e920c25b027ffdde = function_896f9300bcde23c2(str_powerup);
    if (isdefined(powerup_origin) && var_e920c25b027ffdde > 0) {
        foreach (player in a_players) {
            if (distancesquared(player.origin, powerup_origin) <= squared(var_e920c25b027ffdde)) {
                final_players = array_add(final_players, player);
            }
        }
    } else {
        final_players = a_players;
    }
    return final_players;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5467
// Size: 0x117
function function_d4be622286a198(str_powerup, v_spawn_pos, v_spawn_angles) {
    level endon("game_ended");
    e_powerup = powerup_drop(str_powerup, v_spawn_pos, -1, 0);
    if (isdefined(e_powerup)) {
        e_powerup.angles = v_spawn_angles;
        e_powerup.mesh_mdl.angles = v_spawn_angles;
        e_powerup setmodel("jup_zm_powerup_vfx");
        contents = trace::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
        v_up = anglestoup(e_powerup.angles);
        caststart = e_powerup.origin + v_up * 32;
        castend = caststart + v_up * -100;
        traceresult = trace::ray_trace(caststart, castend, [], contents);
        if (isdefined(traceresult["entity"])) {
            e_powerup linkto(traceresult["entity"]);
            e_powerup.mesh_mdl linkto(traceresult["entity"]);
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5586
// Size: 0x4e
function function_c38c89a662ac4f51(str_powerup, origin) {
    if (!isdefined(origin)) {
        assertmsg("<dev string:xc2>");
        return;
    }
    offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
    level thread powerup_drop(str_powerup, origin + offset);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x55dc
// Size: 0x1a3
function powerup_drop(str_powerup, v_spawn_pos, var_cfca9abfbb48775e, var_31a30ed92b3baeec) {
    if (!isdefined(var_31a30ed92b3baeec)) {
        var_31a30ed92b3baeec = 1;
    }
    self endon("powerup_grabbed");
    self endon("death");
    root = function_ecdae672c660149e();
    var_2fa928445372d72 = function_519d44e54a9b8ae5(str_powerup);
    e_powerup = spawn("script_model", v_spawn_pos);
    e_powerup setmodel("tag_origin");
    e_powerup function_52bb753b67c409bd(var_2fa928445372d72.model, 1);
    e_powerup.str_powerup = str_powerup;
    function_afb7ebfa593cc2d5(str_powerup);
    offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
    if (var_31a30ed92b3baeec) {
        groundent = e_powerup thread function_ff48fa45d1f0c4e1(offset);
        groundent = e_powerup.mesh_mdl function_ff48fa45d1f0c4e1(offset);
        e_powerup thread powerup_wobble(e_powerup.mesh_mdl, groundent);
    }
    e_powerup thread powerup_timeout(var_cfca9abfbb48775e);
    e_powerup thread powerup_wait_for_pickup();
    root.active_powerups = array_add(root.active_powerups, e_powerup);
    level notify("powerup_dropped", e_powerup);
    if (isdefined(root.dropped_callbacks)) {
        foreach (dc in root.dropped_callbacks) {
            level [[ dc ]](e_powerup);
        }
    }
    return e_powerup;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5788
// Size: 0xe7
function function_ff48fa45d1f0c4e1(offset) {
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    var_12baea29dc62088 = function_2e9e02e8bda61ef2();
    if (isdefined(var_12baea29dc62088) && isdefined(var_12baea29dc62088.groundent) && isdefined(var_12baea29dc62088.localorigin) && isdefined(var_12baea29dc62088.localangles)) {
        if (isdefined(self.linkedparent)) {
            self.linkedparent linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.localorigin, var_12baea29dc62088.localangles);
        } else {
            self linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.localorigin + offset, var_12baea29dc62088.localangles);
        }
        return var_12baea29dc62088.groundent;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5878
// Size: 0x53
function function_6941afdf7d54f58c(func_callback) {
    root = function_ecdae672c660149e();
    if (!isdefined(root.dropped_callbacks)) {
        root.dropped_callbacks = [];
    }
    root.dropped_callbacks[root.dropped_callbacks.size] = func_callback;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58d3
// Size: 0x7d
function function_afb7ebfa593cc2d5(str_powerup) {
    root = function_ecdae672c660149e();
    if (isdefined(root.var_34d5d13b703a35c9)) {
        if (str_powerup == "full_ammo") {
            root.var_34d5d13b703a35c9 = function_1652f8a8050283bd(function_edeba0070ca0709e("powerup_ammo_spacing_min"), function_edeba0070ca0709e("powerup_ammo_spacing_max"));
            return;
        }
        if (root.var_34d5d13b703a35c9 > 0) {
            root.var_34d5d13b703a35c9--;
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5958
// Size: 0x113
function powerup_wobble(ent_model, groundent) {
    self endon("powerup_grabbed");
    self endon("powerup_timedout");
    self endon("death");
    powerup_info = function_519d44e54a9b8ae5(self.str_powerup);
    if (istrue(powerup_info.var_4b1dd9ec52ba79a3)) {
        return;
    }
    while (isdefined(ent_model)) {
        waittime = randomfloatrange(2.5, 5);
        yaw = randomint(360);
        if (yaw > 300) {
            yaw = 300;
        } else if (yaw < 60) {
            yaw = 60;
        }
        yaw = ent_model.angles[1] + yaw;
        new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
        if (isdefined(groundent)) {
            ent_model rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        } else {
            ent_model rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        }
        wait randomfloat(waittime - 0.1);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a73
// Size: 0xe2
function powerup_timeout(n_lifetime) {
    if (isdefined(n_lifetime) && n_lifetime < 0) {
        return;
    }
    powerup_info = function_519d44e54a9b8ae5(self.str_powerup);
    n_lifetime = default_to(n_lifetime, powerup_info.var_7f552635d01b5fd5);
    self endon("powerup_grabbed");
    self endon("death");
    self endon("powerup_reset");
    blinktime = 10;
    var_e4416a8eb368fdd7 = max(0, n_lifetime - blinktime);
    wait var_e4416a8eb368fdd7;
    thread hide_and_show(&powerup_hide, &powerup_show);
    wait blinktime;
    self notify("powerup_timedout");
    if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("sound")) {
        self.mesh_mdl setscriptablepartstate("sound", "timed_out");
    }
    thread function_98041907892dbd80();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b5d
// Size: 0xb2
function powerup_hide() {
    if (isdefined(self)) {
        self hide();
    }
    if (isdefined(self.mesh_mdl)) {
        if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("blink")) {
            self.mesh_mdl setscriptablepartstate("blink", "blink_hide");
            return;
        }
        if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("idle")) {
            self.mesh_mdl setscriptablepartstate("idle", "hide");
            return;
        }
        self.mesh_mdl hide();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c17
// Size: 0xdc
function powerup_show(var_bce144cbc1e37b8e) {
    if (isdefined(self)) {
        self show();
    }
    if (isdefined(self.mesh_mdl)) {
        if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("blink")) {
            if (istrue(var_bce144cbc1e37b8e)) {
                self.mesh_mdl setscriptablepartstate("blink", "blink_show");
            } else {
                self.mesh_mdl setscriptablepartstate("blink", "blink_show_with_audio");
            }
            return;
        }
        if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("idle")) {
            self.mesh_mdl setscriptablepartstate("idle", "show");
            return;
        }
        self.mesh_mdl show();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5cfb
// Size: 0x82
function hide_and_show(hide_func, show_func) {
    self endon("death");
    var_bce144cbc1e37b8e = 0;
    for (i = 0; i < 40; i++) {
        if (i % 2) {
            self [[ show_func ]](var_bce144cbc1e37b8e);
        } else {
            self [[ hide_func ]]();
        }
        if (i < 16) {
            wait 0.5;
            continue;
        }
        if (i < 24) {
            var_bce144cbc1e37b8e = 1;
            wait 0.25;
            continue;
        }
        var_bce144cbc1e37b8e = 1;
        wait 0.1;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d85
// Size: 0x76
function powerup_delete() {
    if (isdefined(self.e_trigger)) {
        self.e_trigger delete();
    }
    if (isdefined(self.mesh_mdl)) {
        self.mesh_mdl delete();
    }
    root = function_ecdae672c660149e();
    if (isdefined(self)) {
        root.active_powerups = array_remove(root.active_powerups, self);
        self delete();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e03
// Size: 0x364
function powerup_wait_for_pickup() {
    self endon("death");
    root = function_ecdae672c660149e();
    var_2fa928445372d72 = function_519d44e54a9b8ae5(self.str_powerup);
    offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
    origin = self.origin - offset;
    self.e_trigger = spawn("trigger_radius", origin, 0, 32, 72);
    self.e_trigger enablelinkto();
    self.e_trigger linkto(self);
    while (true) {
        self.e_trigger waittill("trigger", ent);
        player = ent;
        if (isdefined(root.var_5cdeaceda00983a3)) {
            player = ent [[ root.var_5cdeaceda00983a3 ]]();
        }
        if (!istrue(var_2fa928445372d72.var_f9f899d9e6df9373) && !isplayer(player)) {
            continue;
        }
        if (!istrue(var_2fa928445372d72.var_872243630fdf0168) && istrue(player.inlaststand)) {
            continue;
        }
        if (isdefined(self.mesh_mdl)) {
            if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("sound")) {
                self.mesh_mdl setscriptablepartstate("sound", "pickup");
            }
        }
        var_269d8af30921f43d = player function_a56a8b17eae57b09(self.str_powerup, self.origin);
        foreach (player_sound in var_269d8af30921f43d) {
            sound_event = "sndevent_powerup_" + self.str_powerup;
            player_sound playsoundevent(sound_event, player_sound);
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_operator_vo", {#target:undefined, #speaker:player_sound, #sound_event:sound_event, #sound_type:undefined, #script_func_name:"zm:powerup_wait_for_pickup"});
        }
        if (isdefined(var_2fa928445372d72.var_c5a9d2297ea16382)) {
            a_players = player function_a56a8b17eae57b09(self.str_powerup, self.origin);
            foreach (player_sound in a_players) {
                if (isalive(player_sound)) {
                    player_sound namespace_53fc9ddbb516e6e1::function_2ad34da25e5bdd45(var_2fa928445372d72.var_c5a9d2297ea16382, player_sound);
                }
            }
        }
        /#
            if (isdefined(player.name) && false) {
                iprintlnbold(self.str_powerup + "<dev string:xe9>" + player.name);
            }
        #/
        level callback::callback(#"player_powerup", {#player:player, #powerup:self});
        player powerup_activate(self.str_powerup, self);
        player namespace_53fc9ddbb516e6e1::function_990cf49669e49965();
        self notify("powerup_grabbed", player);
        thread function_98041907892dbd80(1);
        return;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x616f
// Size: 0xbd
function get_next_powerup() {
    root = function_ecdae672c660149e();
    /#
        if (isdefined(level.var_7f2e8af1175e5aa5)) {
            str_powerup = level.var_7f2e8af1175e5aa5;
            level.var_7f2e8af1175e5aa5 = undefined;
            return str_powerup;
        }
    #/
    if (isdefined(level.var_37858f4d4dbe2433)) {
        str_powerup = level.var_37858f4d4dbe2433;
        level.var_37858f4d4dbe2433 = undefined;
    } else {
        str_powerup = root.var_211f18c4ee5c760f[root.powerup_index];
        root.powerup_index++;
        if (root.powerup_index >= root.var_211f18c4ee5c760f.size) {
            root.powerup_index = 0;
            function_39a01e773f00003();
        }
    }
    return str_powerup;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6235
// Size: 0x31
function function_39a01e773f00003() {
    root = function_ecdae672c660149e();
    root.var_211f18c4ee5c760f = array_randomize(root.var_211f18c4ee5c760f);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x626e
// Size: 0x4
function func_should_always_drop() {
    return true;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x627b
// Size: 0x3
function func_should_never_drop() {
    return false;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6287
// Size: 0x147
function function_320c6c17c3136d0a(params) {
    if (!function_76ccbdb9c3d32f22()) {
        return;
    }
    if (istrue(self.no_powerups)) {
        return;
    }
    root = function_ecdae672c660149e();
    if (isdefined(root.var_4e1cce72cf8d8f63)) {
        if (!self [[ root.var_4e1cce72cf8d8f63 ]](params)) {
            return;
        }
    }
    drop_pos = isai(self) ? self.var_f182de6049d1ab48 : self.origin;
    if (!isdefined(level.var_2a474bda8984ac2a)) {
        level.var_2a474bda8984ac2a = throttle_initialize("powerup_drop", 1, level.framedurationseconds);
    }
    var_8ed8f695a88af352 = spawnstruct();
    function_f632348cbb773537(level.var_2a474bda8984ac2a, var_8ed8f695a88af352);
    var_cdcc412515151986 = 1;
    if (isdefined(root.var_29e4cb253683279f)) {
        params.etarget = self;
        var_cdcc412515151986 = level [[ root.var_29e4cb253683279f ]](params);
    }
    if (var_cdcc412515151986) {
        var_d01a68d4c8274caf = undefined;
        var_d01a68d4c8274caf = function_3f65dbe307c93086();
        if (isdefined(var_d01a68d4c8274caf)) {
            offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
            level thread powerup_drop(var_d01a68d4c8274caf, drop_pos + offset);
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63d6
// Size: 0xb8
function function_3f65dbe307c93086() {
    level endon("game_ended");
    root = function_ecdae672c660149e();
    /#
        if (isdefined(level.var_7f2e8af1175e5aa5)) {
            str_powerup = level.var_7f2e8af1175e5aa5;
            level.var_7f2e8af1175e5aa5 = undefined;
            return str_powerup;
        }
    #/
    for (n_loop = root.var_211f18c4ee5c760f.size * 2; n_loop > 0; n_loop--) {
        str_powerup = get_next_powerup();
        powerup_info = function_519d44e54a9b8ae5(str_powerup);
        if (!isdefined(powerup_info.func_should_drop_with_regular_powerups)) {
            return str_powerup;
        }
        is_available = [[ powerup_info.func_should_drop_with_regular_powerups ]]();
        if (istrue(is_available)) {
            return str_powerup;
        }
    }
    return undefined;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6497
// Size: 0x1d
function function_8edb8c0ed499f61e(var_b963bd568903c6d) {
    function_ecdae672c660149e().var_7d478c526f5d7a85 = var_b963bd568903c6d;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x64bc
// Size: 0x31
function private function_76ccbdb9c3d32f22() {
    root = function_ecdae672c660149e();
    if (isdefined(root.var_7d478c526f5d7a85)) {
        return root.var_7d478c526f5d7a85;
    }
    return 1;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x64f6
// Size: 0x3c
function function_5b0b83c04b92d1fa(zvar, value) {
    if (!isdefined(value)) {
        return undefined;
    }
    root = function_ecdae672c660149e();
    root.powerup_vars[zvar] = value;
    return value;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x653b
// Size: 0x2a
function function_edeba0070ca0709e(zvar) {
    root = function_ecdae672c660149e();
    return root.powerup_vars[zvar];
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x656e
// Size: 0x8a
function powerup_hud_show(str_powerup, n_lifetime) {
    self endon("powerup_hud_show_" + str_powerup);
    self endon("disconnect");
    root = function_ecdae672c660149e();
    self [[ root.var_b0d3396c2b9e78d4 ]](self.var_e2d9965430ae7f24[str_powerup], n_lifetime);
    self.var_a0e1c0f50ca3ef0f[self.var_e2d9965430ae7f24[str_powerup].index] = undefined;
    self.var_e2d9965430ae7f24[str_powerup] = undefined;
    self [[ root.var_5a4c4a84060b59da ]](str_powerup);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6600
// Size: 0x199
function function_587ecc90909a8c38(str_powerup) {
    self notify("powerup_hud_show_" + str_powerup);
    self endon("powerup_hud_show_" + str_powerup);
    self endon("disconnect");
    root = function_ecdae672c660149e();
    if (!isdefined(self.var_e2d9965430ae7f24)) {
        self.var_e2d9965430ae7f24 = [];
    }
    if (!isdefined(self.var_e2d9965430ae7f24[str_powerup])) {
        self.var_e2d9965430ae7f24[str_powerup] = spawnstruct();
    }
    if (!isdefined(self.var_a0e1c0f50ca3ef0f)) {
        self.var_a0e1c0f50ca3ef0f = [];
    }
    powerupbundle = function_e6f547b7f0a996ed();
    poweruplist = powerupbundle.powerup_list;
    powerupindex = 0;
    spotfound = 0;
    for (i = 0; i < poweruplist.size; i++) {
        var_f8358178900f0d5f = isdefined(self.var_a0e1c0f50ca3ef0f[i]);
        var_8952024062b19822 = var_f8358178900f0d5f && self.var_a0e1c0f50ca3ef0f[i] == str_powerup;
        if (!var_f8358178900f0d5f || var_8952024062b19822) {
            if (!spotfound) {
                powerupindex = i;
                spotfound = 1;
                continue;
            }
            self.var_a0e1c0f50ca3ef0f[i] = undefined;
        }
    }
    self.var_e2d9965430ae7f24[str_powerup].str_powerup = str_powerup;
    self.var_e2d9965430ae7f24[str_powerup].start = gettime();
    self.var_e2d9965430ae7f24[str_powerup].index = powerupindex;
    self.var_a0e1c0f50ca3ef0f[powerupindex] = str_powerup;
    return self.var_e2d9965430ae7f24[str_powerup];
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67a2
// Size: 0x263
function function_e91cc9367bcb7f1a(hud_powerup, n_lifetime) {
    assert(isplayer(self));
    root = function_ecdae672c660149e();
    poweruplist = function_e6f547b7f0a996ed();
    assertex(isdefined(root.var_eaf13acb539829eb[hud_powerup.str_powerup]), "<dev string:x103>" + hud_powerup.str_powerup + "<dev string:x118>");
    player = self;
    index = hud_powerup.index;
    var_e66f8bc0f155720f = poweruplist.var_5a95e049dbbdc1ec;
    refname = "hud_powerup_" + hud_powerup.str_powerup;
    isactive = player function_ada0825249682644(refname);
    if (n_lifetime > 0 && isdefined(var_e66f8bc0f155720f) && var_e66f8bc0f155720f != "") {
        state = default_to(poweruplist.var_fec1fa2e735d7499, "");
        anchorhorz = function_f845164fd6027e79(poweruplist.var_99a990e9f5ea961c);
        var_949530d3a6b789b3 = function_863b22a1564f8eb(poweruplist.var_40a95d7bb8872fa2);
        anchorx = default_to(poweruplist.var_fde517927a257ba7, 0);
        anchory = default_to(poweruplist.var_fde516927a257974, 0);
        stepx = default_to(poweruplist.var_3a83b92e9fcd024a, 0);
        stepy = default_to(poweruplist.var_3a83ba2e9fcd047d, 0);
        if (!isactive) {
            player function_90de31b2cbef19f9(refname, var_e66f8bc0f155720f);
            player function_d28fa5295a04d555(refname, state);
        }
        var_8d076e93bc8ccd99 = [];
        var_8d076e93bc8ccd99["bundle_index"] = root.var_eaf13acb539829eb[hud_powerup.str_powerup];
        var_8d076e93bc8ccd99["time"] = n_lifetime;
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
        player function_f4c37324750dc183(refname, anchorx + index * stepx, anchory + index * stepy, anchorhorz, var_949530d3a6b789b3);
        return;
    }
    if (isactive) {
        player function_d28fa5295a04d555(refname, "hide");
        wait 1.5;
        player function_fb3c9a259f146781(refname);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a0d
// Size: 0x16d
function function_aa5cdd71af797058(hud_powerup, n_lifetime) {
    assert(isplayer(self));
    root = function_ecdae672c660149e();
    poweruplist = function_e6f547b7f0a996ed();
    assertex(isdefined(root.var_eaf13acb539829eb[hud_powerup.str_powerup]), "<dev string:x103>" + hud_powerup.str_powerup + "<dev string:x118>");
    player = self;
    index = root.var_eaf13acb539829eb[hud_powerup.str_powerup];
    var_e66f8bc0f155720f = poweruplist.var_509cf6c285b05999;
    refname = "hud_powerup_vignette";
    isactive = player function_ada0825249682644(refname);
    if (n_lifetime > 0 && isdefined(var_e66f8bc0f155720f) && var_e66f8bc0f155720f != "") {
        state = default_to(poweruplist.var_31bc54db39a319a2, "");
        param = default_to(poweruplist.var_193b808b8bdb874e, "");
        if (!isactive) {
            player function_90de31b2cbef19f9(refname, var_e66f8bc0f155720f);
            player function_d28fa5295a04d555(refname, state);
            player function_af4f62f0f944a8f1(refname, param);
        }
        return;
    }
    if (isactive) {
        player function_fb3c9a259f146781(refname);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b82
// Size: 0xda
function function_5bfe254c7e9aa4db(str_powerup) {
    if (!isdefined(self.var_a0e1c0f50ca3ef0f)) {
        return;
    }
    poweruplist = function_e6f547b7f0a996ed();
    for (i = 0; i < self.var_a0e1c0f50ca3ef0f.size; i++) {
        self.var_a0e1c0f50ca3ef0f[i] = undefined;
    }
    foreach (powerup in poweruplist.powerup_list) {
        refname = "hud_powerup_" + powerup.ref;
        isactive = namespace_6917e6eed10cfc44::function_ada0825249682644(refname);
        if (isactive) {
            namespace_6917e6eed10cfc44::function_fb3c9a259f146781(refname);
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c64
// Size: 0x13f
function function_52bb753b67c409bd(model_name, var_f77ed8ae404fb650) {
    self endon("powerup_grabbed");
    self endon("death");
    intro_fx = function_edeba0070ca0709e("intro_vfx_label");
    var_3d0000bc842db347 = istrue(var_f77ed8ae404fb650) && isdefined(intro_fx) && fxexists(intro_fx);
    if (var_3d0000bc842db347) {
        function_5b0773c04b8eb8f3(intro_fx);
        wait function_edeba0070ca0709e("intro_vfx_duration");
    }
    function_5b0773c04b8eb8f3(function_edeba0070ca0709e("idle_vfx_label"));
    mdl_delay = function_fb089abb8dac6216();
    wait mdl_delay;
    self.mesh_mdl = spawn("script_model", self.origin);
    self.mesh_mdl setmodel(model_name);
    if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("idle")) {
        self.mesh_mdl setscriptablepartstate("idle", "show");
    }
    if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("sound")) {
        self.mesh_mdl setscriptablepartstate("sound", "spawn");
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6dab
// Size: 0xda
function function_98041907892dbd80(b_play_fx) {
    self endon("death");
    if (isdefined(self.e_trigger)) {
        self.e_trigger delete();
    }
    if (self.mesh_mdl isscriptable() && self.mesh_mdl getscriptablehaspart("idle")) {
        self.mesh_mdl setscriptablepartstate("idle", "hide");
    } else {
        self.mesh_mdl hide();
    }
    grabbed_vfx = function_edeba0070ca0709e("grabbed_vfx_label");
    var_26bf64b63e12ec04 = istrue(b_play_fx) && isdefined(grabbed_vfx) && fxexists(grabbed_vfx);
    if (var_26bf64b63e12ec04) {
        function_5b0773c04b8eb8f3(grabbed_vfx);
        wait function_edeba0070ca0709e("grabbed_vfx_duration");
    }
    wait 0.05;
    powerup_delete();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e8d
// Size: 0x3e
function function_5b0773c04b8eb8f3(str_fx_name) {
    if (!isdefined(self)) {
        return;
    }
    if (!fxexists(str_fx_name)) {
        return;
    }
    str_fx = getfx(str_fx_name);
    stop_vfx();
    play_vfx(str_fx);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ed3
// Size: 0x2e
function stop_vfx() {
    if (isdefined(self.n_powerup_fx)) {
        stopfxontag(self.n_powerup_fx, self, "tag_origin");
        self.n_powerup_fx = undefined;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f09
// Size: 0x20
function play_vfx(str_fx) {
    self.n_powerup_fx = playfxontag(str_fx, self, "tag_origin");
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f31
// Size: 0x50
function function_e419d148895ea689(powerup_name) {
    lifetime = function_ecdae672c660149e().powerups[powerup_name].var_f862e718db266e0a;
    if (isdefined(level.powerup_timeout_override)) {
        lifetime = self [[ level.powerup_timeout_override ]](lifetime);
    }
    return lifetime;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6f8a
// Size: 0xf0
function private function_fb089abb8dac6216() {
    root = function_ecdae672c660149e();
    delay_min = function_edeba0070ca0709e("model_drop_delay_min");
    delay_max = function_edeba0070ca0709e("model_drop_delay_max");
    distance_outer = function_edeba0070ca0709e("model_drop_delay_distance_outer");
    distance_inner = function_edeba0070ca0709e("model_drop_delay_distance_inner");
    if (istrue(root.var_a43bd6a1b5aa5858)) {
        return delay_min;
    }
    e_player = getclosest(self.origin, level.players);
    if (!isdefined(e_player)) {
        return delay_max;
    }
    n_distance = distance(e_player.origin, self.origin);
    if (n_distance > distance_outer) {
        return delay_min;
    } else if (n_distance < distance_inner) {
        return delay_max;
    }
    n_delay = mapfloat(distance_inner, distance_outer, delay_max, delay_min, n_distance);
    return n_delay;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7083
// Size: 0x1d
function function_1652f8a8050283bd(var_a24595ceea8d9a67, var_9c82af4273cc1f01) {
    return randomintrange(var_a24595ceea8d9a67, var_9c82af4273cc1f01 + 1);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x70a9
// Size: 0x61
function private function_f91870701cdc3aaa() {
    player = undefined;
    activator_ent = self;
    if (isplayer(activator_ent)) {
        player = activator_ent;
    }
    if (activator_ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        if (isdefined(activator_ent.owner) && isplayer(activator_ent.owner)) {
            player = activator_ent.owner;
        }
    }
    return player;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7113
// Size: 0xc3
function private function_cad183d7f2f4f301(hud_powerup, n_lifetime) {
    if (!isplayer(self)) {
        return;
    }
    self endon("powerup_hud_show_" + hud_powerup.str_powerup);
    self endon("disconnect");
    level endon("game_ended");
    if (!isdefined(hud_powerup) || !isdefined(n_lifetime)) {
        return;
    }
    reveal_timer(hud_powerup, n_lifetime);
    var_eaffb8d26a6d3161 = 10;
    var_b6f5fb735ca50f7b = 5;
    var_e4416a8eb368fdd7 = max(0, n_lifetime - var_eaffb8d26a6d3161);
    wait var_e4416a8eb368fdd7;
    function_d28fa5295a04d555("hud_powerup_" + hud_powerup.str_powerup, "blink");
    wait var_eaffb8d26a6d3161 - var_b6f5fb735ca50f7b;
    function_d28fa5295a04d555("hud_powerup_" + hud_powerup.str_powerup, "blinkfast");
    wait var_b6f5fb735ca50f7b;
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x71de
// Size: 0x26
function private reveal_timer(hud_powerup, n_lifetime) {
    show_timer(hud_powerup, n_lifetime, 1);
    thread function_9717dc981f38ff6c();
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x720c
// Size: 0x8c
function function_676437737684783f(powerupref, n_lifetime) {
    self endon("disconnect");
    level endon("game_ended");
    thread function_c0d098ef786b87f6(powerupref, n_lifetime);
    if (isdefined(n_lifetime) && n_lifetime > 0) {
        hud_powerup = function_587ecc90909a8c38(powerupref);
        init_timer(hud_powerup, n_lifetime);
        waitdur = 3;
        msg = waittill_notify_or_timeout_return("powerup_hud_show_" + powerupref, waitdur);
        if (msg == "timeout") {
            powerup_hud_show(powerupref, n_lifetime - waitdur);
        }
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x72a0
// Size: 0x80
function private function_c0d098ef786b87f6(powerupref, n_lifetime) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    root = function_ecdae672c660149e();
    powerupid = root.var_eaf13acb539829eb[powerupref];
    for (i = 0; i < powerupid; i++) {
        waitframe();
    }
    self setclientomnvar("ui_powerup_splash", powerupid);
    self setclientomnvar("ui_powerup_splash_notify", gettime());
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x7328
// Size: 0x9a
function private hide_timer(str_powerup, var_86b2c10e3c5de35e, var_72e0ea8e48ab3921) {
    assert(isplayer(self));
    if (function_dd6c086a7d5e3b85() && !istrue(var_72e0ea8e48ab3921)) {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    refname = "hud_powerup_" + str_powerup;
    player = self;
    isactive = player function_ada0825249682644(refname);
    if (!istrue(isactive)) {
        return;
    }
    player function_d28fa5295a04d555(refname, "hide");
    if (isdefined(var_86b2c10e3c5de35e) && var_86b2c10e3c5de35e > 0) {
        wait var_86b2c10e3c5de35e;
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x73ca
// Size: 0x1a6
function private show_timer(hud_powerup, n_lifetime, b_init, var_9f6f493675057d64) {
    assert(isplayer(self));
    if (function_dd6c086a7d5e3b85()) {
        return;
    }
    self endon("death_or_disconnect");
    root = function_ecdae672c660149e();
    poweruplist = function_e6f547b7f0a996ed();
    assertex(isdefined(root.var_eaf13acb539829eb[hud_powerup.str_powerup]), "<dev string:x103>" + hud_powerup.str_powerup + "<dev string:x118>");
    var_e66f8bc0f155720f = poweruplist.var_5a95e049dbbdc1ec;
    if (!isdefined(var_e66f8bc0f155720f) || var_e66f8bc0f155720f == "") {
        return;
    }
    player = self;
    index = hud_powerup.index;
    refname = "hud_powerup_" + hud_powerup.str_powerup;
    state = default_to(poweruplist.var_fec1fa2e735d7499, "");
    var_8d076e93bc8ccd99 = [];
    var_8d076e93bc8ccd99["bundle_index"] = root.var_eaf13acb539829eb[hud_powerup.str_powerup];
    var_8d076e93bc8ccd99["time"] = n_lifetime;
    isactive = player function_ada0825249682644(refname);
    if (!isactive) {
        init_timer(hud_powerup, n_lifetime, b_init, var_9f6f493675057d64);
        player function_d28fa5295a04d555(refname, state);
    } else {
        player function_d28fa5295a04d555(refname, "Show");
    }
    if (!istrue(var_9f6f493675057d64)) {
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x7578
// Size: 0x1a5
function private init_timer(hud_powerup, n_lifetime, b_init, var_9f6f493675057d64) {
    assert(isplayer(self));
    if (function_dd6c086a7d5e3b85()) {
        return;
    }
    self endon("death_or_disconnect");
    root = function_ecdae672c660149e();
    poweruplist = function_e6f547b7f0a996ed();
    assertex(isdefined(root.var_eaf13acb539829eb[hud_powerup.str_powerup]), "<dev string:x103>" + hud_powerup.str_powerup + "<dev string:x118>");
    var_e66f8bc0f155720f = poweruplist.var_5a95e049dbbdc1ec;
    if (!isdefined(var_e66f8bc0f155720f) || var_e66f8bc0f155720f == "") {
        return;
    }
    player = self;
    index = hud_powerup.index;
    refname = "hud_powerup_" + hud_powerup.str_powerup;
    state = "Hide";
    var_8d076e93bc8ccd99 = [];
    var_8d076e93bc8ccd99["bundle_index"] = root.var_eaf13acb539829eb[hud_powerup.str_powerup];
    var_8d076e93bc8ccd99["time"] = n_lifetime;
    isactive = player function_ada0825249682644(refname);
    if (!isactive) {
        player function_90de31b2cbef19f9(refname, var_e66f8bc0f155720f);
        player function_d28fa5295a04d555(refname, state);
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
        if (!istrue(b_init)) {
            player thread function_9717dc981f38ff6c(hud_powerup.str_powerup);
        }
    }
    if (!istrue(var_9f6f493675057d64)) {
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7725
// Size: 0x1e7
function private function_9717dc981f38ff6c(str_powerup) {
    poweruplist = function_e6f547b7f0a996ed();
    anchorhorz = function_f845164fd6027e79(poweruplist.var_99a990e9f5ea961c);
    var_949530d3a6b789b3 = function_863b22a1564f8eb(poweruplist.var_40a95d7bb8872fa2);
    anchorx = default_to(poweruplist.var_fde517927a257ba7, 0);
    anchory = default_to(poweruplist.var_fde516927a257974, 0);
    stepx = default_to(poweruplist.var_3a83b92e9fcd024a, 0);
    stepy = default_to(poweruplist.var_3a83ba2e9fcd047d, 0);
    var_9445ccda1f06a14e = self.var_a0e1c0f50ca3ef0f;
    var_1df4c15ca0d10bca = float(var_9445ccda1f06a14e.size - 1) * 0.5;
    var_613803e654807723 = [];
    foreach (hp in var_9445ccda1f06a14e) {
        var_613803e654807723[var_613803e654807723.size] = hp;
    }
    foreach (i, hp in var_613803e654807723) {
        if (isdefined(str_powerup) && hp != str_powerup) {
            continue;
        }
        refname = "hud_powerup_" + hp;
        if (!istrue(function_ada0825249682644(refname))) {
            continue;
        }
        posx = (i - var_1df4c15ca0d10bca) * stepx + anchorx;
        posy = anchory + i * stepy;
        function_f4c37324750dc183(refname, posx, posy, anchorhorz, var_949530d3a6b789b3);
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7914
// Size: 0xc
function private function_dd6c086a7d5e3b85() {
    return istrue(self.inlaststand);
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7929
// Size: 0x39
function on_player_death(params) {
    root = function_ecdae672c660149e();
    if (isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 destroy();
    }
}

// Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x796a
// Size: 0x3d
function function_a2a65ab511d8d308(timeout, string1) {
    while (true) {
        msg = waittill_any_timeout_1(timeout, string1);
        if (!isdefined(msg)) {
            continue;
        }
        break;
    }
}

/#

    // Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x79af
    // Size: 0x22
    function debug_display() {
        self endon("<dev string:x181>");
        while (true) {
            draw_entity_bounds(self, 0.05);
            waitframe();
        }
    }

    // Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x79d9
    // Size: 0xb7
    function function_ad8fdc6004c25e47() {
        self endon("<dev string:x181>");
        while (true) {
            self waittill("<dev string:x18a>", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor);
            if (false) {
                iprintlnbold(damage);
            }
            waitframe();
        }
    }

    // Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7a98
    // Size: 0xc4
    function function_935c4742baf8caf8() {
        while (true) {
            if (getdvarint(@"hash_d9ce8fb295e1baf", 0)) {
                val = getdvarint(@"hash_d9ce8fb295e1baf", 0);
                ref = "<dev string:x194>";
                if (val == 1) {
                    ref = "<dev string:x194>";
                }
                if (val == 2) {
                    ref = "<dev string:x1a2>";
                }
                setdvar(@"hash_d9ce8fb295e1baf", 0);
                level thread powerup_drop(ref, level.player.origin + 96 * anglestoforward(flat_angle(level.player.angles)) + (0, 0, 40));
            }
            waitframe();
            waitframe();
        }
    }

    // Namespace namespace_fb4e60babf7f8008 / namespace_ceba5eb2bad92af9
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7b64
    // Size: 0x34
    function function_d2829ca2fa8d53e() {
        while (!scripts\mp\flags::gameflagexists("<dev string:x1aa>")) {
            waitframe();
        }
        scripts\mp\flags::gameflagwait("<dev string:x1aa>");
        adddebugcommand("<dev string:x1bb>" + "<dev string:x1c7>");
    }

#/
