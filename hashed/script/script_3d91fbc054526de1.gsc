// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_72a196b6c7df2f38;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_1f97a44d1761c919;
#using script_7ab5b649fa408138;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\flags.gsc;
#using script_4e6e58ab5d96c2b0;
#using scripts\common\vehicle.gsc;

#namespace namespace_e47f1f0e697a80a;

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x670
// Size: 0x2cb
function function_e85a33353200a325() {
    /#
        level thread function_fff3d0f8a5f042ad();
    #/
    setomnvar("ui_mp_extended_load_screen", 1);
    mapname = namespace_36f464722d326bbe::getmapname();
    if (mapname != "mp_jup_bigmap") {
        setdvar(@"hash_2fe0283b419ff08a", 1);
    }
    level.var_eb7998aaa13bd57 = getdvarint(@"hash_33dc02542068fcd7", 0);
    if (getdvarint(@"hash_2fe0283b419ff08a", 0) == 1 || !function_2030cc4ad67d1634("mp_infil_ob_jup_blima_tr")) {
        if (issharedfuncdefined("obInfil", "customInfilSkipFlow")) {
            level thread [[ getsharedfunc("obInfil", "customInfilSkipFlow") ]]();
        } else {
            level.prematchperiodend = level.var_eb7998aaa13bd57;
            level thread function_6abfc74b7f83b7f8();
        }
        return;
    }
    callback::add("player_connect", &on_connect);
    scene::add_scene_func("jup_cin_zm_infil", &function_76e1657e2f2df35c, "callback_play");
    scene::add_scene_func("jup_cin_zm_infil", &function_7db747abca8e8f0e, "callback_done");
    level.var_cd516359c1840501 = getdvarint(@"hash_5cc93a1ff8e7a881", 1);
    level.var_ee961c9258701907 = getdvarint(@"hash_d6c6f27e2890ab87", 3);
    level.var_9b36be4fbd603ba7 = getdvarfloat(@"hash_39ea6191970eb227", 30);
    level.var_40a9c107e8fda0b6 = getdvarint(@"hash_4a2b6a2a09fd036", 0);
    level.var_598d90c6bc821de7 = getdvarfloat(@"hash_d0703186b655c867", 5);
    level.var_e2efffa7ec8ffced = getdvarint(@"hash_81a3a2e9c63e736d", 0);
    level.var_e6e8b7b242097949 = [];
    level.var_4df4777277c281ff = 1;
    level.var_fd915e8bd20b6d09 = &function_93e3fe0e5693889b;
    foreach (team in level.teamnamelist) {
        level.requiredplayercount[team] = 0;
    }
    level.prematchperiod = getdvarint(@"hash_c653d32c30815d2b", 60);
    var_ba9a385288d1a919 = 15.0333;
    level.matchcountdowntime = var_ba9a385288d1a919 + level.var_eb7998aaa13bd57 + getdvarint(@"hash_7061556e5a6fcbc7", 1);
    level.prematchperiodend = var_ba9a385288d1a919 + level.var_eb7998aaa13bd57 + getdvarint(@"hash_7061556e5a6fcbc7", 1);
    thread namespace_d576b6dc7cef9c62::matchstarttimer("match_starting_in", level.prematchperiod + level.prematchperiodend);
    function_f1aed36ab4598ea("blima_infil");
    level.var_6bec823e343dacea = 1;
    level thread function_475b703f6d063a37();
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x942
// Size: 0x1b9
function function_6abfc74b7f83b7f8() {
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    level thread function_9f45e0d90ddd909d();
    foreach (teamname, var_70643c8580524236 in level.squaddata) {
        foreach (squad in var_70643c8580524236) {
            if (squad.players.size > 0) {
                if (isdefined(squad.players[0].var_87a91b2a8231f4f8)) {
                    spawnpoint = squad.players[0].var_87a91b2a8231f4f8;
                } else if (isdefined(level.var_796ae5bb031f323d)) {
                    spawnpoint = squad.players[0] [[ level.var_796ae5bb031f323d ]]();
                } else {
                    spawnpoint = level.teamdata[teamname]["startPoint"];
                }
                level thread function_f8e774228da7fd80(spawnpoint, teamname);
                foreach (player in squad.players) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    player val::function_c9d0b43701bdba00("ob_infil");
                    player playershow(1);
                }
            }
        }
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb02
// Size: 0x9b
function on_connect(params) {
    if (!level flag("ob_infil_completed")) {
        self endon("disconnect");
        self.var_f4bb3d8522246fdc = 1;
        val::set("ob_infil", "show_hud", 0);
        val::set("ob_infil", "freezecontrols", 1);
        namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0);
        level flag_wait("ob_infil_completed");
        wait(1);
        if (isdefined(self)) {
            self.var_f4bb3d8522246fdc = undefined;
            val::function_c9d0b43701bdba00("ob_infil");
            self playershow(1);
            namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0);
        }
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba4
// Size: 0x39
function function_1433671d0a15b57b(var_f2bc0551e983edbd, var_4ff53c0f1206c71d) {
    /#
        assert(isdefined(var_f2bc0551e983edbd));
    #/
    level endon("prematch_done");
    level endon("prematch_over");
    if (isdefined(var_4ff53c0f1206c71d)) {
        self endon(var_4ff53c0f1206c71d);
    }
    self waittill(var_f2bc0551e983edbd);
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe4
// Size: 0x27f
function function_93e3fe0e5693889b() {
    if (!isdefined(level.var_970834636e10db54)) {
        level.var_970834636e10db54 = gettime();
    }
    /#
        if (!isdefined(level.var_2feb1fee386da049)) {
            level.var_584594cfe5be79ab = gettime();
        } else {
            level.var_6cbb7e30776f280e = gettime();
        }
    #/
    var_19cc131bc3772e16 = 0;
    var_71b179643f3088fe = function_425d34ddd114f3de();
    if (level.players.size < var_71b179643f3088fe) {
        level.var_970834636e10db54 = gettime();
        return 0;
    }
    var_f32326388fb1991c = level.var_970834636e10db54 + function_a5b14435e3229bed(level.var_9b36be4fbd603ba7);
    if (gettime() > var_f32326388fb1991c) {
        return 1;
    }
    if (gettime() - level.var_970834636e10db54 < function_a5b14435e3229bed(level.var_598d90c6bc821de7)) {
        return 0;
    }
    if (level.players.size > 0) {
        var_19cc131bc3772e16 = 1;
        foreach (team in level.teamnamelist) {
            players = getteamdata(team, "players");
            foreach (player in players) {
                if (!istrue(player.pers["streamSyncComplete"]) || player.model == "" || !player ispredictedstreamposready() || !player isadditionalstreamposready()) {
                    /#
                        if (!istrue(player.pers["obInfil_countdownStart"])) {
                            if (!isdefined(player.var_acb3470fd92a831)) {
                                player.var_acb3470fd92a831 = gettime();
                            } else {
                                player.var_690843a63d7f6150 = gettime();
                            }
                        }
                        if (player.model == "screen_completely_black") {
                            if (!isdefined(player.var_e298a3ca3ed1a049)) {
                                player.var_e298a3ca3ed1a049 = gettime();
                            } else {
                                player.var_f12e6635eb2fe3b8 = gettime();
                            }
                        }
                    #/
                    var_19cc131bc3772e16 = 0;
                    break;
                }
            }
            if (!var_19cc131bc3772e16) {
                break;
            }
        }
    }
    return var_19cc131bc3772e16;
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0x12a
function function_475b703f6d063a37() {
    namespace_4b0406965e556711::gameflagset("infil_will_run");
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    level thread function_9f45e0d90ddd909d();
    /#
        if (isdefined(level.var_2feb1fee386da049)) {
            println(" status of participating in cinematics after infil: [" + level.var_2feb1fee386da049);
        }
        if (isdefined(level.var_6cbb7e30776f280e)) {
            println("<unknown string>" + level.var_6cbb7e30776f280e);
        }
    #/
    foreach (teamname, var_70643c8580524236 in level.squaddata) {
        foreach (squad in var_70643c8580524236) {
            if (squad.players.size > 0) {
                level thread function_2796212b16ece5a4(teamname, squad.index);
                waitframe();
            }
        }
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9c
// Size: 0xba
function function_9f45e0d90ddd909d() {
    setomnvar("ui_mp_extended_load_screen", 0);
    if (getdvarint(@"hash_2fe0283b419ff08a", 0)) {
        setomnvar("ui_in_infil", -1);
    } else {
        setomnvar("ui_in_infil", 1);
        level flag_wait_or_timeout("ob_infil_igc_start", level.prematchperiod);
        setomnvar("ui_in_infil", 2);
    }
    level notify("obInfil_countdownStart");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    setomnvar("ui_in_infil", -1);
    level.var_466a09c79541fc26 = 1;
    level flag_set("ob_infil_completed");
    level delaythread(50, &function_f4e0ff5cb899686d, "blima_infil");
    callback::callback("on_ob_infil_complete");
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x105d
// Size: 0x82
function function_a6854cf05a485ced(pos, angles, var_3d69da7e79a7d44c) {
    var_c9af3092a01dca55 = ter_op(isdefined(var_3d69da7e79a7d44c), var_3d69da7e79a7d44c, 0);
    cameraent = spawn("script_model", pos);
    if (isdefined(angles)) {
        cameraent.angles = angles;
    }
    cameraent setmodel("tag_origin");
    cameraent.animname = "ob_infil_cam" + var_c9af3092a01dca55;
    cameraent useanimtree(%script_model);
    return cameraent;
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e7
// Size: 0x66
function function_f8e774228da7fd80(spawnpoint, teamname) {
    if (isvector(spawnpoint.origin)) {
        flag_wait("ai_spawn_director_initialized");
        var_d14e12c472ce3518 = teamname + "_Infil";
        function_606642b946a01237(var_d14e12c472ce3518, spawnpoint.origin, 2000, 1);
        function_c7311cb3f768f21e(var_d14e12c472ce3518, 300);
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1154
// Size: 0x582
function function_2796212b16ece5a4(teamname, squadid, var_cfc2ca5ebfa83db2, var_4048e94312776eed) {
    if (!(isdefined(level.squaddata[teamname]) && isdefined(level.squaddata) && isdefined(squadid) && isdefined(teamname) && isdefined(level.squaddata[teamname][squadid]))) {
        return;
    }
    players = level.squaddata[teamname][squadid].players;
    if (isdefined(var_cfc2ca5ebfa83db2)) {
        spawnpoint = var_cfc2ca5ebfa83db2;
    } else if (isdefined(level.var_796ae5bb031f323d)) {
        var_c47fa8157a1a841e = [];
        foreach (player in players) {
            if (isdefined(player.var_87a91b2a8231f4f8)) {
                squad_spawn = player.var_87a91b2a8231f4f8;
            } else {
                squad_spawn = player [[ level.var_796ae5bb031f323d ]]();
            }
            var_c47fa8157a1a841e[var_c47fa8157a1a841e.size] = squad_spawn;
        }
        var_c4df5904366785de = var_c47fa8157a1a841e[0];
        foreach (squad_spawn in var_c47fa8157a1a841e) {
            if (squad_spawn.origin[2] > var_c4df5904366785de.origin[2]) {
                var_c4df5904366785de = squad_spawn;
            }
        }
        spawnpoint = var_c4df5904366785de;
    } else {
        spawnpoint = level.teamdata[teamname]["startPoint"];
    }
    level thread function_f8e774228da7fd80(spawnpoint, teamname);
    players = array_removeundefined(players);
    /#
        foreach (player in players) {
            if (isdefined(player.var_e298a3ca3ed1a049)) {
                println("<unknown string>" + player.name + "<unknown string>" + player.var_e298a3ca3ed1a049);
            }
            if (isdefined(player.var_f12e6635eb2fe3b8)) {
                println("<unknown string>" + player.name + "<unknown string>" + player.var_f12e6635eb2fe3b8);
            }
            if (isdefined(player.var_acb3470fd92a831)) {
                println("<unknown string>" + player.name + "<unknown string>" + player.var_acb3470fd92a831);
            }
            if (isdefined(player.var_690843a63d7f6150)) {
                println("<unknown string>" + player.name + "<unknown string>" + player.var_690843a63d7f6150);
            }
            println("<unknown string>" + player.name + "<unknown string>" + gettime());
        }
    #/
    if (getdvarint(@"hash_7b68b0ae5369bbe4", 0) == 1) {
        players = array_randomize(players);
    }
    /#
        assertex(players.size <= 4, "Squad sizes greater than 4 are not supported by OB infils.");
    #/
    /#
        assertex(players.size > 0, "Infil attempted on a squad with no players.");
    #/
    if (!players.size) {
        return;
    }
    waittime = getdvarint(@"hash_7061556e5a6fcbc7", 1);
    waittime = isdefined(var_4048e94312776eed) ? waittime : var_4048e94312776eed;
    if (getdvarint(@"hash_20aac00f832266c", 1)) {
        spawnpoint scene::function_6438932e35cbbfb7(players, undefined, waittime + 2, "jup_cin_zm_infil");
    } else {
        spawnpoint scene::init(players, undefined, "jup_cin_zm_infil");
    }
    var_6f86873bd08fc95c = spawnpoint scene::function_3f8173e45076d687();
    foreach (entity in var_6f86873bd08fc95c) {
        if (isent(entity) && !isplayer(entity)) {
            entity hide();
        }
    }
    foreach (player in players) {
        player thread function_892644c616e3636d(waittime);
        player val::set("ob_infil", "show_hud", 0);
        player val::set("ob_infil", "freezecontrols", 1);
        var_70d0a1f75125a63f = level.prematchperiodend - 20;
        if (var_70d0a1f75125a63f < 0) {
            var_70d0a1f75125a63f = 1;
        }
        player delaythread(var_70d0a1f75125a63f, &namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2, [0:player]);
        foreach (entity in var_6f86873bd08fc95c) {
            if (isent(entity) && !isplayer(entity)) {
                entity showtoplayer(player);
            }
        }
    }
    wait(waittime);
    level flag_set("ob_infil_igc_start");
    namespace_4b0406965e556711::gameflagset("infil_started");
    players = array_removeundefined(players);
    function_74a7839b271cb87f(players, spawnpoint, "jup_cin_zm_infil");
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dd
// Size: 0x303
function function_74a7839b271cb87f(players, spawnpoint, var_e25d1d189177a7c) {
    foreach (player in players) {
        player notify("ob_playInfil");
        player cameraunlink();
        player thread function_c42fe306277ca4fe();
        player clearsoundsubmix("jup_ob_prematch", 1);
        player setsoundsubmix("jup_ob_infil");
        player setsoundsubmix("jup_ob_infil_secondary");
        player.var_f4bb3d8522246fdc = undefined;
        player utility::delaythread(1, &val::reset, "ob_infil", "show_hud");
        player lerpfovscalefactor(0, 0);
        /#
            println("<unknown string>" + player.name + "<unknown string>" + gettime());
        #/
        logstring("OB INFIL: Player " + player.name + " starting infil! at time " + gettime());
    }
    n_wait = getdvarfloat(@"hash_45ce1e830caba62a", 0.75);
    wait(n_wait);
    players = array_removeundefined(players);
    if (players.size) {
        spawnpoint scene::play(players, undefined, var_e25d1d189177a7c);
    } else {
        /#
            println("<unknown string>" + (isdefined(spawnpoint.script_noteworthy) ? "screen_completely_black" : spawnpoint.script_noteworthy) + "<unknown string>" + spawnpoint.origin);
        #/
        logstring("OB INFIL No players in squad for infil scene at spawnPoint group " + (isdefined(spawnpoint.script_noteworthy) ? "" : spawnpoint.script_noteworthy) + " at location " + spawnpoint.origin);
        wait(15.0333);
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player _freezelookcontrols(0, 1);
        player val::function_c9d0b43701bdba00("ob_infil");
        player playershow(1);
        player lerpfovbypreset("default");
        player cameraunlink();
        player notify("screen_completely_black");
        player lerpfovscalefactor(1, 1);
        logstring("OB INFIL: Player " + player.name + " status of participating in cinematics after infil: [" + player function_3e2c0f85fe7ca957() + "] at time " + gettime());
        /#
            assertex(!player function_3e2c0f85fe7ca957(), "Player is still participating in cinematics after the Outbreak Infil scene has finished. ");
        #/
        player thread function_4315c4f1aade4338();
        /#
            println("<unknown string>" + player.name + "<unknown string>" + gettime());
        #/
        logstring("OB INFIL: Player " + player.name + " done with infil at time " + gettime());
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e7
// Size: 0x14d
function function_4315c4f1aade4338() {
    self endon("disconnect");
    if (!self isonground() || self isskydiving()) {
        v_ground = getgroundposition(self.origin, 32, 500, 1000);
        if (isdefined(v_ground)) {
            self setorigin(v_ground);
            waitframe();
            if (!self isonground() && isdefined(self.var_87a91b2a8231f4f8)) {
                self setorigin(self.var_87a91b2a8231f4f8.origin);
                return;
            }
        }
    }
    if (!ispointonnavmesh(self.origin)) {
        v_point = getclosestpointonnavmesh(self.origin);
        if (isdefined(v_point)) {
            self setorigin(v_point);
            return;
        }
    }
    v_start_origin = self.origin;
    var_a0bfbffbdfb1f04c = 15;
    var_b1618474e3b5fbc1 = 0;
    while (var_a0bfbffbdfb1f04c > 0) {
        if (distance(self.origin, v_start_origin) > 5) {
            var_b1618474e3b5fbc1 = 1;
            break;
        }
        wait(1);
        var_a0bfbffbdfb1f04c = var_a0bfbffbdfb1f04c - 1;
    }
    if (!var_b1618474e3b5fbc1) {
        self setorigin(self.origin + (0, 0, 32));
    }
    val::function_c9d0b43701bdba00("scene_shot");
    val::function_c9d0b43701bdba00("scene_scene");
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3b
// Size: 0x49
function function_c42fe306277ca4fe() {
    self endon("disconnect");
    self endon("end_ob_infil_monitor_third_person");
    self.var_8789029d90c5e2de = self getplayerdata("common", "mpProgression", "thirdPerson");
    while (1) {
        if (self getcamerathirdperson()) {
            self setcamerathirdperson(0);
        }
        waitframe();
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b8b
// Size: 0x1f0
function private function_76e1657e2f2df35c() {
    players = [];
    foreach (s_object in self.var_84b542bb7490bea7.var_214d924f4e137244) {
        if (isplayer(s_object.entity)) {
            players[players.size] = s_object.entity;
            thread function_29fc786decbf9a1f(s_object.entity);
        } else if (isdefined(s_object.entity) && s_object.entity namespace_dbbb37eb352edf96::isvehicle()) {
            s_object.entity notify("infil_heli_scene_complete");
        }
    }
    thread function_4a33f9cf31ab0db6(players);
    wait(0.5);
    var_71fcea457c2df618 = [];
    if (players.size == 2) {
        var_71fcea457c2df618 = [0:"tablet3"];
    } else if (players.size == 1) {
        var_71fcea457c2df618 = [0:"tablet2", 1:"tablet3"];
    }
    foreach (s_object in self.var_84b542bb7490bea7.var_214d924f4e137244) {
        if (isdefined(s_object.entity) && isdefined(s_object.entity.animname) && utility::array_contains(var_71fcea457c2df618, s_object.entity.animname)) {
            s_object.entity delete();
        }
    }
    if (getdvarint(@"hash_8da4a5e690432cd0", 1) == 1) {
        thread function_7ac2ef359a625bc4(players);
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d82
// Size: 0x173
function private function_29fc786decbf9a1f(player) {
    player endon("disconnect");
    player.var_7c6c008ca46286b0 endon("death");
    var_36fedcca9fa6b8bb = player getcurrentweapon();
    if (isnullweapon(var_36fedcca9fa6b8bb)) {
        foreach (weapon in player.primaryweapons) {
            if (!isnullweapon(weapon)) {
                var_36fedcca9fa6b8bb = weapon;
                break;
            }
        }
    }
    player takeweapon(var_36fedcca9fa6b8bb);
    msg = player utility::waittill_any_timeout_1(20, "ws_raise");
    player.var_7c6c008ca46286b0 hidefromplayer(player);
    player hidefromplayer(player);
    player setdemeanorviewmodel("normal");
    player val::reset("scene_shot", "weapon");
    player takeweapon(var_36fedcca9fa6b8bb);
    player giveweapon(var_36fedcca9fa6b8bb);
    player switchtoweaponimmediate(var_36fedcca9fa6b8bb);
    player notify("end_ob_infil_monitor_third_person");
    setthirdperson = istrue(player.var_8789029d90c5e2de);
    player setcamerathirdperson(setthirdperson);
    player setclientomnvar("ui_toggle_third_person", setthirdperson);
    player setplayerdata("common", "mpProgression", "thirdPerson", setthirdperson);
    player.var_8789029d90c5e2de = undefined;
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1efc
// Size: 0xf0
function private function_7db747abca8e8f0e() {
    players = [];
    helis = [];
    foreach (s_object in self.var_84b542bb7490bea7.var_214d924f4e137244) {
        if (isdefined(s_object.entity)) {
            if (isplayer(s_object.entity)) {
                players[players.size] = s_object.entity;
            } else if (s_object.entity namespace_dbbb37eb352edf96::isvehicle()) {
                s_object.entity.var_cb77a772d04fc8e4 = &infil_heli_scene_complete;
                helis[helis.size] = s_object.entity;
            }
        }
    }
    level thread function_18913a2266e5579d(helis);
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ff3
// Size: 0x2d
function private function_18913a2266e5579d(helis) {
    while (helis.size > 0) {
        helis = function_fdc9d5557c53078e(helis);
        wait(1);
    }
    unloadinfiltransient("mp_infil_ob_jup_blima_tr");
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2027
// Size: 0xcd
function infil_heli_scene_complete() {
    self notify("infil_heli_scene_complete");
    self endon("infil_heli_scene_complete");
    self endon("death");
    /#
        println("<unknown string>");
    #/
    logstring("OB INFIL: Helicopter done with scene!");
    self function_247ad6a91f6a4ffe(1);
    n_speed = 75;
    var_a7dc5c095368121c = 25000;
    var_85e713504c80c981 = anglestoforward(self.angles * (0, 1, 0));
    v_end = self.origin + (0, 0, 2500) + var_85e713504c80c981 * var_a7dc5c095368121c;
    self vehicle_setspeed(n_speed, 15);
    self setvehgoalpos(v_end, 0);
    thread function_16db53e1905b43f5();
    self waittill("goal");
    self delete();
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20fb
// Size: 0xd9
function private function_16db53e1905b43f5() {
    self endon("death");
    wait(8);
    while (1) {
        b_can_see = 0;
        foreach (player in level.players) {
            if (!isalive(player) || player.sessionstate == "spectator") {
                continue;
            }
            if (!isbot(player) && utility::within_fov(player.origin, player getplayerangles(), self.origin, 0.7)) {
                b_can_see = 1;
            }
            waitframe();
        }
        if (!b_can_see) {
            self delete();
        }
        wait(0.5);
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21db
// Size: 0xb7
function function_4a33f9cf31ab0db6(players) {
    self notify("endon_obInfil_playInfilVO");
    self endon("endon_obInfil_playInfilVO");
    var_f1621847a2f09760 = [0:"fang", 1:"greene", 2:"ravenov", 3:"soap"];
    var_33e9eb2cccf9e200 = getdvar(@"hash_a9078d5ae739b39a", "");
    if (array_contains(var_f1621847a2f09760, var_33e9eb2cccf9e200)) {
        var_178abd1095da1dcf = var_33e9eb2cccf9e200;
    } else {
        var_178abd1095da1dcf = random(var_f1621847a2f09760);
    }
    var_c323591577074b17 = "ob_infil_" + var_178abd1095da1dcf;
    wait(5);
    players = array_removeundefined(players);
    overlord::function_d87d5deb069bf8e5(var_c323591577074b17, players, undefined, undefined, 1);
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2299
// Size: 0xf2
function function_7ac2ef359a625bc4(players) {
    wait(getdvarint(@"hash_120410411ba2e0d1", 15));
    players = array_removeundefined(players);
    foreach (player in players) {
        player setclientomnvar("ui_dmz_mission_overlay", 1);
        player _freezecontrols(0, 1);
        player _freezelookcontrols(0, 1);
    }
    wait(getdvarint(@"hash_65aacd5faa9482f2", 4));
    players = array_removeundefined(players);
    foreach (player in players) {
        player setclientomnvar("ui_dmz_mission_overlay", 0);
    }
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2392
// Size: 0x3e
function function_892644c616e3636d(waittime) {
    self endon("disconnect");
    namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0);
    wait(waittime + getdvarfloat(@"hash_45ce1e830caba62a", 0.75));
    namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0);
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d7
// Size: 0x236
function function_fff3d0f8a5f042ad() {
    /#
        while (!isdefined(level.var_7a8e039103b51e0f)) {
            waitframe();
        }
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_926714d6eed28ff3, 1);
        foreach (var_44934ca35515c2c6, var_6f2d35eec7db0a3 in level.var_7a8e039103b51e0f) {
            foreach (n_spawn, var_a52af6b9e435b1cf in var_6f2d35eec7db0a3) {
                if (!isdefined(var_a52af6b9e435b1cf.script_noteworthy)) {
                    continue;
                }
                var_dce4f9020e3900b2 = var_a52af6b9e435b1cf.script_noteworthy;
                devgui::function_b23a59dfb4ca49a1("<unknown string>" + var_dce4f9020e3900b2 + "<unknown string>" + n_spawn + "<unknown string>", "<unknown string>" + var_44934ca35515c2c6 + "<unknown string>" + n_spawn, &function_35ab01589cc4f6c6);
                devgui::function_b23a59dfb4ca49a1("<unknown string>" + var_dce4f9020e3900b2 + "<unknown string>" + n_spawn + "<unknown string>", "<unknown string>" + var_44934ca35515c2c6 + "<unknown string>" + n_spawn, &function_e7f0b651d2ebaf9d);
            }
        }
        if (istrue(level.var_46901be2468e1d90)) {
            var_9091c4080e2751f2 = spawnlogic::getspawnpointarray("<unknown string>");
            foreach (n_spawn, var_4ca1988ce7e52ba1 in var_9091c4080e2751f2) {
                var_dce4f9020e3900b2 = "<unknown string>";
                var_44934ca35515c2c6 = "<unknown string>";
                devgui::function_b23a59dfb4ca49a1("<unknown string>" + var_dce4f9020e3900b2 + "<unknown string>" + n_spawn + "<unknown string>", "<unknown string>" + var_44934ca35515c2c6 + "<unknown string>" + n_spawn, &function_35ab01589cc4f6c6);
                devgui::function_b23a59dfb4ca49a1("<unknown string>" + var_dce4f9020e3900b2 + "<unknown string>" + n_spawn + "<unknown string>", "<unknown string>" + var_44934ca35515c2c6 + "<unknown string>" + n_spawn, &function_e7f0b651d2ebaf9d);
            }
        }
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2614
// Size: 0x17e
function function_926714d6eed28ff3() {
    /#
        while (1) {
            foreach (var_6f2d35eec7db0a3 in level.var_7a8e039103b51e0f) {
                foreach (n_spawn, var_a52af6b9e435b1cf in var_6f2d35eec7db0a3) {
                    if (!isdefined(var_a52af6b9e435b1cf.script_noteworthy)) {
                        continue;
                    }
                    print3d(var_a52af6b9e435b1cf.origin, "<unknown string>" + var_a52af6b9e435b1cf.classname, undefined, undefined, 0.25);
                    print3d(var_a52af6b9e435b1cf.origin + (0, 0, -5), "<unknown string>" + var_a52af6b9e435b1cf.script_noteworthy, undefined, undefined, 0.25);
                    print3d(var_a52af6b9e435b1cf.origin + (0, 0, -10), "<unknown string>" + n_spawn, undefined, undefined, 0.25);
                    utility::draw_angles(var_a52af6b9e435b1cf.angles, var_a52af6b9e435b1cf.origin);
                    utility::draw_capsule(var_a52af6b9e435b1cf.origin, 16, 64, var_a52af6b9e435b1cf.angles);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2799
// Size: 0x1ae
function function_35ab01589cc4f6c6(params) {
    /#
        var_eb5a9091076e21e8 = level.players[0] squad_utility::getsquadmembers(undefined, 1);
        if (params[0] == "<unknown string>") {
            var_9091c4080e2751f2 = spawnlogic::getspawnpointarray("<unknown string>");
            n_spawn = int(params[1]);
            foreach (player in var_eb5a9091076e21e8) {
                spawnpoint = var_9091c4080e2751f2[n_spawn];
                player setorigin(spawnpoint.origin);
                player setplayerangles(spawnpoint.angles);
                n_spawn++;
                if (n_spawn >= var_9091c4080e2751f2.size) {
                    n_spawn = 0;
                }
            }
            return;
        }
        var_44934ca35515c2c6 = int(params[0]);
        n_spawn = int(params[1]);
        var_eb5a9091076e21e8 = level.players[0] squad_utility::getsquadmembers(undefined, 1);
        foreach (player in var_eb5a9091076e21e8) {
            spawnpoint = level.var_7a8e039103b51e0f[var_44934ca35515c2c6][n_spawn];
            player setorigin(spawnpoint.origin);
            player setplayerangles(spawnpoint.angles);
            n_spawn++;
            if (n_spawn >= level.var_7a8e039103b51e0f[var_44934ca35515c2c6].size) {
                n_spawn = 0;
            }
        }
    #/
}

// Namespace namespace_e47f1f0e697a80a/namespace_d3f2c5e05b9c4573
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x294e
// Size: 0x202
function function_e7f0b651d2ebaf9d(params) {
    /#
        if (params[0] == "<unknown string>") {
            var_9091c4080e2751f2 = spawnlogic::getspawnpointarray("<unknown string>");
            n_spawn = int(params[1]);
            spawnpoint = var_9091c4080e2751f2[n_spawn];
            foreach (teamname, var_70643c8580524236 in level.squaddata) {
                foreach (squad in var_70643c8580524236) {
                    if (array_contains(squad.players, level.players[0])) {
                        level thread function_2796212b16ece5a4(teamname, squad.index, spawnpoint, 2);
                        return;
                    }
                }
            }
            return;
        }
        var_44934ca35515c2c6 = int(params[0]);
        n_spawn = int(params[1]);
        spawnpoint = level.var_7a8e039103b51e0f[var_44934ca35515c2c6][n_spawn];
        foreach (teamname, var_70643c8580524236 in level.squaddata) {
            foreach (squad in var_70643c8580524236) {
                if (array_contains(squad.players, level.players[0])) {
                    level thread function_2796212b16ece5a4(teamname, squad.index, spawnpoint, 2);
                    return;
                }
            }
        }
    #/
}

