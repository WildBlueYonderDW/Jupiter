#using script_100adcc1cc11d2fa;
#using script_16428d24c490aed3;
#using script_16ea1b94f0f381b3;
#using script_1d43c78ad6bb95e2;
#using script_1f97a44d1761c919;
#using script_2047cdbf5176ba0;
#using script_22f1701e151b9d12;
#using script_253bcb0ddbc438ca;
#using script_2b264b25c7da0b12;
#using script_398835140857d740;
#using script_3d91fbc054526de1;
#using script_41ffdbe01998b61a;
#using script_4e6e58ab5d96c2b0;
#using script_528320cb3630530d;
#using script_64316dc775e91122;
#using script_6bffae1b97f70547;
#using script_71721925888affd9;
#using script_7396e8f29969c90c;
#using script_7b2517368c79e5bc;
#using script_7c40fa80892a721;
#using script_92b815b18f0ba61;
#using script_c838ca7da22db1;
#using script_dd514a31d0a27e2;
#using scripts\anim\notetracks_mp;
#using scripts\common\callbacks;
#using scripts\common\cap;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_lighting;
#using scripts\mp\utility\player;

#namespace mp_jup_hydro_ob;

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xccc
// Size: 0x10
function autoexec init() {
    level.var_b803ce6ba2261e5 = &main;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce4
// Size: 0x246
function main() {
    setdvar(@"hash_2fe0283b419ff08a", 1);
    function_eb7f544259415a09("mp_jup_hydro_ob");
    level.var_dbca431b3ea02d2e = 1;
    level.var_b017944f02bb5e97 = 1;
    level.outofboundstriggers = getentarray("OutOfBounds_ob", "targetname");
    level.var_db80981879714f15 = &namespace_b000de497fab9bf4::function_348e0a3041479e64;
    level.var_ad60db7d1b6758ff = &function_a1cf1abf679a2c12;
    level.var_104dfa63c8e33c5a = &function_f3a272be026f65cf;
    level.var_186478f460903bc9 = &function_51a438d5cd8a5d0c;
    level.var_2a85f1809bcaec82 = &function_d304e397fd8be129;
    level.var_a12f0fa2ac033f69 = &function_edb604ca8191a7a1;
    level.var_718ee74a7cdbfee5 = &function_a3b9cffbd4aab638;
    level function_e12249c96bb7bd37();
    function_452e757b6e673474();
    namespace_b000de497fab9bf4::function_c9eea6ea790d37bd();
    function_43983d74c830fa72("outbreak_riftrun");
    callback::add("player_spawned", &function_2dcca6d862cc31d5);
    callback::add("player_connect", &function_c154e3abec6b5381);
    if (!getdvarint(@"hash_abc1d9ea495ec189", 0)) {
        callback::add("player_item_drop", &namespace_618dd2e6238edda3::on_item_drop);
    }
    namespace_c80b48d458bcbe24::main();
    namespace_f1cbe04e1535b396::main();
    scripts\engine\utility::flag_set("lockedspaces_create_script_initialized");
    thread scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_lighting::main();
    thread function_135c08561081b6cf();
    thread function_8bdadb53e67e2c47();
    thread disable_announcer();
    level callback::add("register_features", &function_f0e3823c8c30d665);
    level callback::add("register_activities", &function_6ac5f072c4c17d83);
    if (getdvarint(@"ob_s3_rift_run", 0)) {
        level callback::add("ob_dark_aether_exit_used", &function_61aea37385c298a9);
        level callback::add("register_objectives", &function_19986c800d077a36);
        level callback::add("outlast_phase_crystals_destroyed", &scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_lighting::function_bfd6485208f4b621);
        namespace_d38a1af3e02dea2f::function_48e697a59457ec45();
        namespace_55c852bca1486d64::main();
        thread function_7e3b3e54fd85da26();
        return;
    }
    if (getdvarint(@"hash_596074b5ab54d0ab", 0)) {
        if (!getdvarint(@"hash_61aee601c3850804", 0)) {
            scripts\engine\utility::registersharedfunc("obInfil", "customInfilSkipFlow", &function_e9d22563e1d95d65);
        } else {
            /#
                if (!getdvarint(@"hash_89636cd66a9c9811", 0)) {
                    level thread function_fa78585bed75ccf7();
                }
            #/
        }
        namespace_1ba749db5720b611::main();
        thread function_9a5a6967260ab033();
        thread function_632bf331b85b85ac();
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf32
// Size: 0x26
function function_e12249c96bb7bd37() {
    flag_init("ob_rift_run_ambient_zombie_start");
    flag_init("ob_infil_squad_setup");
    flag_init("ob_ambient_spawn_zombie_waves");
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf60
// Size: 0x1a
function disable_announcer() {
    level flag_wait("ob_infil_completed");
    level.disableannouncer = 1;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf82
// Size: 0x1e7
function function_e9d22563e1d95d65() {
    setdvar(@"hash_45ce1e830caba62a", 0.75);
    callback::add("player_connect", &namespace_d3f2c5e05b9c4573::on_connect);
    level.var_9b36be4fbd603ba7 = getdvarfloat(@"hash_39ea6191970eb227", 30);
    level.var_598d90c6bc821de7 = getdvarfloat(@"hash_d0703186b655c867", 5);
    level.var_4df4777277c281ff = 1;
    level.var_fd915e8bd20b6d09 = &namespace_d3f2c5e05b9c4573::function_93e3fe0e5693889b;
    foreach (team in level.teamnamelist) {
        level.requiredplayercount[team] = 0;
    }
    level.prematchperiod = getdvarint(@"hash_e6284eb71e04d627", 28);
    level.matchcountdowntime = level.prematchperiod + level.var_eb7998aaa13bd57 + getdvarint(@"hash_5f260044fe919a23", 1);
    level.prematchperiodend = level.matchcountdowntime;
    if (getdvarint(@"hash_89636cd66a9c9811", 0)) {
        level flag_set("ob_rift_run_ambient_zombie_start");
        thread scripts\mp\gamelogic::matchstarttimer("match_starting_in", level.prematchperiodend);
        level thread function_fe00122676a4c472();
        return;
    }
    setdvar(@"hash_1b65b5ed4995fe92", 0);
    level.prematchperiod = getdvarint(@"hash_e6284eb71e04d627", 28);
    level.matchcountdowntime = level.prematchperiod + getdvarint(@"hash_5f260044fe919a23", 1);
    level.prematchperiodend = level.matchcountdowntime;
    thread scripts\mp\gamelogic::matchstarttimer("match_starting_in", level.prematchperiodend);
    level thread function_219ccd13654aeca0();
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1171
// Size: 0x125
function function_fe00122676a4c472() {
    scripts\mp\flags::gameflagset("infil_will_run");
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    level thread function_3592326f48a109c9();
    /#
        if (isdefined(level.var_2feb1fee386da049)) {
            println("<dev string:x1c>" + level.var_2feb1fee386da049);
        }
        if (isdefined(level.var_6cbb7e30776f280e)) {
            println("<dev string:x58>" + level.var_6cbb7e30776f280e);
        }
    #/
    foreach (teamname, var_70643c8580524236 in level.squaddata) {
        foreach (squad in var_70643c8580524236) {
            if (squad.players.size > 0) {
                level thread function_809182c66f4e3922(teamname, squad.index);
                waitframe();
            }
        }
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x129e
// Size: 0xdb
function function_b896c581d1a39b24(teamname, squadid) {
    if (!(isdefined(level.squaddata[teamname]) && isdefined(level.squaddata) && isdefined(squadid) && isdefined(teamname) && isdefined(level.squaddata[teamname][squadid]))) {
        return undefined;
    }
    players = level.squaddata[teamname][squadid].players;
    spawnpoint = function_67d9a8af368e98a0(teamname, squadid);
    if (!isdefined(spawnpoint)) {
        return undefined;
    }
    var_9bcca6aa56ca8e0c = getdvarint(@"hash_d04abc712354de2d");
    level thread namespace_d3f2c5e05b9c4573::function_f8e774228da7fd80(spawnpoint, teamname, var_9bcca6aa56ca8e0c);
    players = array_removeundefined(players);
    if (getdvarint(@"hash_7b68b0ae5369bbe4", 0) == 1) {
        players = array_randomize(players);
    }
    if (!players.size) {
        return undefined;
    }
    return players;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1382
// Size: 0x1de
function function_809182c66f4e3922(teamname, squadid) {
    players = function_b896c581d1a39b24(teamname, squadid);
    if (!isdefined(players)) {
        return;
    }
    var_dbf9fd586b2fd32e = 28;
    foreach (player in players) {
        player thread namespace_d3f2c5e05b9c4573::function_892644c616e3636d(var_dbf9fd586b2fd32e);
        player val::set("ob_infil", "show_hud", 0);
        player val::set("ob_infil", "freezecontrols", 1);
        var_70d0a1f75125a63f = level.prematchperiodend - 20;
        if (var_70d0a1f75125a63f < 0) {
            var_70d0a1f75125a63f = 1;
        }
        player delaythread(var_70d0a1f75125a63f, &namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2, [player]);
    }
    wait var_dbf9fd586b2fd32e;
    level flag_set("ob_infil_igc_start");
    scripts\mp\flags::gameflagset("infil_started");
    players = array_removeundefined(players);
    foreach (player in players) {
        player notify("ob_playInfil");
        player clearsoundsubmix("jup_ob_prematch", 1);
        player.var_f4bb3d8522246fdc = undefined;
        player utility::delaythread(1, &val::reset, "ob_infil", "show_hud");
        player lerpfovscalefactor(0, 0);
        println("<dev string:x92>" + player.name + "<dev string:xb0>" + gettime());
        logstring("OB Rift Run Infil: Player " + player.name + " starting infil! at time " + gettime());
        thread function_82b06dfd59cced40(player);
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1568
// Size: 0x10f
function function_82b06dfd59cced40(player) {
    player endon("disconnect");
    var_f85ec083b500a1ca = getdvarfloat(@"hash_45ce1e830caba62a", 0.75);
    wait var_f85ec083b500a1ca;
    if (!isdefined(player)) {
        return;
    }
    player _freezelookcontrols(0, 1);
    player val::reset_all("ob_infil");
    player playershow(1);
    player lerpfovbypreset("default");
    player function_af4b9b0f0e7c6c42(0);
    player notify("screen_completely_black");
    player lerpfovscalefactor(1, 1);
    logstring("OB INFIL: Player " + player.name + " status of participating in cinematics after infil: [" + player function_3e2c0f85fe7ca957() + "] at time " + gettime());
    assertex(!player function_3e2c0f85fe7ca957(), "<dev string:xcd>");
    println("<dev string:x12a>" + player.name + "<dev string:x13f>" + gettime());
    logstring("OB INFIL: Player " + player.name + " done with custom infil at time " + gettime());
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167f
// Size: 0xb0
function function_3592326f48a109c9() {
    setomnvar("ui_mp_extended_load_screen", 0);
    setomnvar("ui_in_infil", 1);
    level.player setsoundsubmix("jup_ob_bink_infil_rr");
    level flag_wait_or_timeout("ob_infil_igc_start", level.prematchperiod);
    setomnvar("ui_in_infil", 2);
    level notify("obInfil_countdownStart");
    scripts\mp\flags::gameflagwait("prematch_done");
    setomnvar("ui_in_infil", -1);
    level.infilcompleted = 1;
    level flag_set("ob_infil_completed");
    level.player clearsoundsubmix("jup_ob_bink_infil_rr", 0.2);
    callback::callback("on_ob_infil_complete");
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1737
// Size: 0x1a8
function function_219ccd13654aeca0() {
    level endon("game_ended");
    scripts\mp\flags::gameflagset("infil_will_run");
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    setomnvar("ui_mp_extended_load_screen", 0);
    setomnvar("ui_in_infil", -1);
    level thread function_f39906ad71bd2029();
    /#
        if (isdefined(level.var_2feb1fee386da049)) {
            println("<dev string:x1c>" + level.var_2feb1fee386da049);
        }
        if (isdefined(level.var_6cbb7e30776f280e)) {
            println("<dev string:x58>" + level.var_6cbb7e30776f280e);
        }
    #/
    level thread function_b34e1f20415bda49(1);
    level thread function_30ce08f2e9b1715a(1);
    foreach (teamname, var_70643c8580524236 in level.squaddata) {
        foreach (squad in var_70643c8580524236) {
            if (squad.players.size > 0) {
                players = function_b896c581d1a39b24(teamname, squad.index);
                level thread function_7cec19ffa37cd482(players);
                waitframe();
            }
        }
    }
    level flag_set("ob_infil_squad_setup");
    level flag_wait("ob_infil_sergei_ravenov_spawned");
    level flag_wait("ob_infil_ava_jansen_spawned");
    wait 2;
    level.var_1da22412ed7ad03b thread function_48dc1d3baa07c8f0();
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e7
// Size: 0x50
function function_f39906ad71bd2029() {
    level flag_wait_or_timeout("ob_infil_igc_start", level.prematchperiod);
    level notify("obInfil_countdownStart");
    scripts\mp\flags::gameflagwait("prematch_done");
    level.infilcompleted = 1;
    level flag_set("ob_infil_completed");
    callback::callback("on_ob_infil_complete");
}

/#

    // Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x193f
    // Size: 0xdd
    function function_fa78585bed75ccf7() {
        self endon("<dev string:x163>");
        setdvar(@"hash_befab5d3b543da43", 2);
        self.skipprematch = getdvarint(@"hash_ac8b983ff0c7b406", 1);
        flag_wait("<dev string:x171>");
        level flag_set("<dev string:x187>");
        setdvar(@"hash_fbe07433fe8dff79", 0);
        var_5967e9e936f0d1c8 = getstruct("<dev string:x19f>", "<dev string:x1bc>");
        spawnorigin = var_5967e9e936f0d1c8.origin;
        spawnangles = var_5967e9e936f0d1c8.angles;
        thread function_30ce08f2e9b1715a(0, spawnorigin, spawnangles);
        flag_wait("<dev string:x1ca>");
        self.var_1da22412ed7ad03b function_552d5faaaedbde90();
        level flag_set("<dev string:x1ed>");
    }

#/

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a24
// Size: 0x1a1
function function_67d9a8af368e98a0(teamname, squadid) {
    spawnpoint = undefined;
    if (!(isdefined(level.squaddata[teamname]) && isdefined(level.squaddata) && isdefined(squadid) && isdefined(teamname) && isdefined(level.squaddata[teamname][squadid]))) {
        return spawnpoint;
    }
    players = level.squaddata[teamname][squadid].players;
    if (isdefined(level.var_796ae5bb031f323d)) {
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
    return spawnpoint;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bce
// Size: 0x219
function function_7cec19ffa37cd482(players) {
    if (!isdefined(players)) {
        return;
    }
    foreach (player in players) {
        player thread namespace_d3f2c5e05b9c4573::function_ba66440ae6d60988("ob_infil_ava_jansen_spawned", "ob_infil_sergei_ravenov_spawned");
        player.var_f4bb3d8522246fdc = undefined;
        player val::set("ob_infil", "show_hud", 1);
        player val::set("ob_infil", "freezecontrols", 0);
        var_1d6aa90a9f946bbe = "story_infil_jansen_start";
        var_e8067a3d33f14df6 = utility::getstruct(var_1d6aa90a9f946bbe, "targetname");
        end_angle = vectortoangles(var_e8067a3d33f14df6.origin - player geteye());
        var_8a255e18f4e97c7e = utility::spawn_script_origin(player.origin, end_angle);
        var_8a255e18f4e97c7e setmodel("tag_origin");
        player setplayerangles(end_angle);
        player playerlinktodelta(var_8a255e18f4e97c7e, "tag_origin", 0, 30, 30, 20, 20, 1);
    }
    scripts\mp\flags::gameflagset("infil_started");
    level flag_wait("ob_infil_completed");
    level thread namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2(players);
    players = array_removeundefined(players);
    foreach (player in players) {
        player notify("ob_playInfil");
        player clearsoundsubmix("jup_ob_prematch", 1);
        player.var_f4bb3d8522246fdc = undefined;
        player lerpfovscalefactor(0, 0);
        println("<dev string:x92>" + player.name + "<dev string:xb0>" + gettime());
        logstring("OB Rift Run Infil: Player " + player.name + " starting infil! at time " + gettime());
        thread function_82b06dfd59cced40(player);
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1def
// Size: 0x86
function function_b34e1f20415bda49(var_cdd0724a1b84bd90) {
    self endon("game_ended");
    flag_wait("ob_infil_squad_setup");
    if (!getdvarint(@"hash_35714a9311024ab7", 1)) {
        return;
    }
    var_1d6aa90a9f946bbe = "story_infil_jansen_start";
    var_e8067a3d33f14df6 = utility::getstruct(var_1d6aa90a9f946bbe, "targetname");
    function_b03da05ad9547b7f(var_e8067a3d33f14df6.origin, var_e8067a3d33f14df6.angles, level.var_d8b57d2fd521c427, 1, 1, 1, 0);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e7d
// Size: 0x29b
function function_30ce08f2e9b1715a(var_cdd0724a1b84bd90, var_4254242e225c8fac, var_7ec747ab678812ae) {
    self endon("game_ended");
    flag_wait("ob_infil_squad_setup");
    if (getdvarint(@"hash_89636cd66a9c9811", 0)) {
        return;
    }
    if (isdefined(self.var_1da22412ed7ad03b) && istrue(self.var_1da22412ed7ad03b.var_8f825bd739498693)) {
        self.var_1da22412ed7ad03b function_e3e2805312bb39c0();
        self.var_1da22412ed7ad03b = undefined;
    }
    aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("sergei_ravenov")[0];
    var_1d6aa90a9f946bbe = "story_infil_ravenov_start";
    var_2de6b144694b16ce = utility::getstruct(var_1d6aa90a9f946bbe, "targetname");
    if (isdefined(var_4254242e225c8fac)) {
        spawnpoint = var_4254242e225c8fac;
    } else {
        spawnpoint = var_2de6b144694b16ce.origin;
    }
    if (isdefined(var_7ec747ab678812ae)) {
        spawnangles = var_7ec747ab678812ae;
    } else {
        spawnangles = var_2de6b144694b16ce.angles;
    }
    while (!isdefined(self.var_1da22412ed7ad03b)) {
        waitframe();
        self.var_1da22412ed7ad03b = spawnnewaitype_sharedfunc(aitype, spawnpoint, spawnangles, level.var_d8b57d2fd521c427);
    }
    if (isdefined(self.var_1da22412ed7ad03b)) {
        self.var_1da22412ed7ad03b setoverridearchetype("default", "agent_mp_jup_ob_ravenov", 1);
        self.var_1da22412ed7ad03b function_c364ad2c70c7754b("sergei_ravenov", 1, 1);
        self.scr_anim[self.var_1da22412ed7ad03b.animname]["ravenov_walk_loop"] = "ravenov_walk_loop";
        self.scr_anim[self.var_1da22412ed7ad03b.animname]["ravenov_wakeup_paired"] = "jup_ob_s3_entity_reveal_ravenov_wakeup_paired";
        self.scr_anim[self.var_1da22412ed7ad03b.animname]["ravenov_paired_idle_to_exit"] = "jup_ob_s3_entity_reveal_ravenov_paired_idle_to_exit";
        self.scr_anim[self.var_1da22412ed7ad03b.animname]["ravenov_ground_paired_idle"] = "jup_ob_s3_entity_reveal_ravenov_ground_paired_idle";
        self.scr_anim[self.var_1da22412ed7ad03b.animname]["ravenov_enter_idle"] = "jup_ob_s3_entity_reveal_ravenov_enter_idle";
        if (istrue(var_cdd0724a1b84bd90)) {
            self.var_1da22412ed7ad03b function_6fc794f2bb3469b1();
        }
        self.var_1da22412ed7ad03b scripts\common\utility::set_battlechatter(1);
        self.var_1da22412ed7ad03b.battlechatter.stateoverride = "combat";
        self.var_1da22412ed7ad03b.var_8f825bd739498693 = 1;
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2120
// Size: 0x31
function function_1809dfa468133ff8() {
    if (!isdefined(level.var_2ada333c838a2316) || level.var_2ada333c838a2316 != self) {
        return;
    }
    scripts\common\cap::cap_start("jup_ob_rift_intro_infil", "caps/outbreak/cap_ava");
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2159
// Size: 0x9b
function function_5cb50d89c340d04f() {
    self endon("death");
    level endon("game_ended");
    level flag_wait("ob_infil_ava_jansen_spawned");
    self.rift_run.var_607d49aee79396c = 1;
    var_20512396ccc3b545 = "story_infil_jansen_end";
    endstruct = utility::getstruct(var_20512396ccc3b545, "targetname");
    endpoint = endstruct.origin;
    function_603c0e4ccd02a98e(endpoint);
    waittill_any_ents(level, "ob_infil_animscripted_done", self, "goal");
    level.var_2ada333c838a2316 = undefined;
    function_e3e2805312bb39c0();
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21fc
// Size: 0x50
function function_ad199ba79ff9da5c() {
    if (!isdefined(level.var_2ada333c838a2316) || level.var_2ada333c838a2316 != self) {
        return;
    }
    if (!isdefined(self.rift_run)) {
        self.rift_run = spawnstruct();
    }
    self.rift_run.var_8692faee8a2110f = 0;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2254
// Size: 0x37
function function_5eb2824d433804f3() {
    var_9f429e0821beb3c5 = getdvarint(@"hash_8c60d2fe26c0abc", 4);
    wait var_9f429e0821beb3c5;
    level thread namespace_446fc987a980892f::playconversation("quest_s35_inside_the_rift", level.players);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2293
// Size: 0x50
function function_f3c5700c7fbc20aa() {
    var_2ef9ac1a8ab6baa0 = getdvarint(@"hash_3c187420cb32b295", 2);
    wait var_2ef9ac1a8ab6baa0;
    level thread namespace_446fc987a980892f::playconversation("quest_s35_enter_storm", level.players);
    wait var_2ef9ac1a8ab6baa0;
    level thread namespace_446fc987a980892f::playevent("quest_s35_enter_storm_resp", level.players);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22eb
// Size: 0x31
function function_6fc794f2bb3469b1() {
    if (!isdefined(level.var_1da22412ed7ad03b) || level.var_1da22412ed7ad03b != self) {
        return;
    }
    scripts\common\cap::cap_start("jup_ob_rift_intro_infil", "caps/outbreak/cap_ravenov");
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2324
// Size: 0x110
function function_48dc1d3baa07c8f0() {
    self endon("death");
    level endon("game_ended");
    level flag_wait("ob_infil_sergei_ravenov_spawned");
    function_5eb2824d433804f3();
    var_a16757278731a569 = getdvarint(@"hash_6cb9899d87af04eb", 6);
    wait var_a16757278731a569;
    level.var_2ada333c838a2316 thread function_5cb50d89c340d04f();
    var_d2bc9e9c18cb522c = getdvarint(@"hash_ebc473037d390ff9", 7);
    wait var_d2bc9e9c18cb522c;
    self.rift_run.var_607d49aee79396c = 1;
    self.rift_run.var_7ce0aa572a8e124b = 1;
    var_20512396ccc3b545 = "story_infil_ravenov_end";
    endstruct = utility::getstruct(var_20512396ccc3b545, "targetname");
    endpoint = endstruct.origin;
    function_603c0e4ccd02a98e(endpoint);
    self waittill("goal");
    thread function_73cab470b35094();
    var_85d5d95cb89b1fef = getdvarint(@"hash_6cb0faf29973960e", 0);
    wait var_85d5d95cb89b1fef;
    level notify("ob_infil_animscripted_done");
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x243c
// Size: 0x37
function function_648f240b0093dddd() {
    var_3a0a24772f433b98 = getdvarint(@"hash_dcd51c1e4683a872", 7);
    wait var_3a0a24772f433b98;
    level thread namespace_446fc987a980892f::playevent("quest_s35_chase_ava", level.players);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247b
// Size: 0x50
function function_2a543136fec78fcb() {
    if (!isdefined(level.var_1da22412ed7ad03b) || level.var_1da22412ed7ad03b != self) {
        return;
    }
    if (!isdefined(self.rift_run)) {
        self.rift_run = spawnstruct();
    }
    self.rift_run.var_8692faee8a2110f = 0;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24d3
// Size: 0x62
function initcap(asmname, statename, params) {
    self animmode("normal");
    self orientmode("face current");
    self.useanimgoalweight = 1;
    self.fnasm_handlenotetrack = &scripts\anim\notetracks_mp::handlenotetrack;
    self.rift_run.var_8692faee8a2110f = 1;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x253d
// Size: 0x2d
function function_1834bd086c8afb3a(asmname, statename, params) {
    self setgoalpos(self.origin, 10);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2572
// Size: 0x3d
function function_78f4d64469ef2c66(asmname, statename, params) {
    return isdefined(self.rift_run) && !istrue(self.rift_run.var_8692faee8a2110f);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25b8
// Size: 0x3d
function function_eb38a032512f79d(asmname, statename, params) {
    return isdefined(self.rift_run) && istrue(self.rift_run.var_607d49aee79396c);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25fe
// Size: 0x59
function function_26ddc4d1a0a9958a(asmname, statename, params) {
    if (isdefined(self.rift_run) && istrue(self.rift_run.var_7ce0aa572a8e124b)) {
        self.rift_run.var_7ce0aa572a8e124b = 0;
        return true;
    }
    return false;
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2660
// Size: 0x90
function function_c154e3abec6b5381(sparams) {
    delaythread(0.5, &function_1b4c60d1baa7885f, "outbreak_riftrun");
    if (getdvarint(@"hash_596074b5ab54d0ab", 0)) {
        var_1d6aa90a9f946bbe = "story_infil_ravenov_start";
        var_2de6b144694b16ce = utility::getstruct(var_1d6aa90a9f946bbe, "targetname");
        if (isdefined(var_2de6b144694b16ce)) {
            self setplayerangles(var_2de6b144694b16ce.angles);
        }
        if (!isdefined(level.var_d8b57d2fd521c427)) {
            level.var_d8b57d2fd521c427 = self.team;
        }
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26f8
// Size: 0x15d
function function_8bdadb53e67e2c47() {
    level flag_wait("ai_spawn_director_initialized");
    if (getdvarint(@"hash_596074b5ab54d0ab", 0) && !getdvarint(@"hash_61aee601c3850804", 0)) {
        level flag_wait_all("ob_infil_completed", "ob_rift_run_ambient_zombie_start");
    }
    if (getdvarint(@"ob_s3_rift_run", 0)) {
        function_9b8829ab4092a7d7("ob_rift_run", 0);
        function_9b8829ab4092a7d7("ob_s3_rift_run", 1);
        function_9b8829ab4092a7d7("ob_rift_run_zombie_waves", 1);
        function_9b8829ab4092a7d7("ob_zombie_ambient", 0);
    } else {
        function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
        function_9b8829ab4092a7d7("ob_zombie_ambient_s3_story", 1);
    }
    setdvar(@"hash_f1d095735ac37f33", 1);
    a_blockers = getstructarray("s_ambient_blocker", "targetname");
    foreach (pos in a_blockers) {
        if (isdefined(pos.radius)) {
            function_606642b946a01237("ambient_blocker", pos.origin, pos.radius, 1);
        }
    }
    level notify("ai_spawn_director_ambient_setup_done");
    level flag_set("ai_spawn_director_ambient_setup_done");
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x285d
// Size: 0x16
function function_135c08561081b6cf() {
    level flag_wait("ai_spawn_director_initialized");
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x287b
// Size: 0x220
function function_632bf331b85b85ac() {
    level flag_wait("ob_infil_completed");
    var_aa44570d0ce3af7c = [];
    var_cd05af3824c52cde = getentitylessscriptablearray("s_outlast_hydro", "target");
    foreach (prop_scriptable in var_cd05af3824c52cde) {
        if (is_equal(prop_scriptable.script_noteworthy, "outlast_phase_crystal")) {
            if (!isdefined(prop_scriptable.targetname)) {
                continue;
            }
            switch (prop_scriptable.targetname) {
            case #"hash_3fc1dec043e7c2ed":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_01");
                break;
            case #"hash_4f4b067cdd2a227d":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_02");
                break;
            case #"hash_fafe02a60e439165":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_03");
                break;
            case #"hash_9ceae540f6c4f91f":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_04");
                break;
            case #"hash_3e70bc44fce010a4":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_05");
                break;
            case #"hash_59ca4af302edd1d9":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_06");
                break;
            }
            continue;
        }
        if (is_equal(prop_scriptable.targetname, "outlast_aether_vfx_prop") && isdefined(prop_scriptable.script_noteworthy) && prop_scriptable getscriptableparthasstate("body", prop_scriptable.script_noteworthy)) {
            prop_scriptable setscriptablepartstate("body", prop_scriptable.script_noteworthy);
            continue;
        }
        if (prop_scriptable getscriptableparthasstate("body", "enabled")) {
            prop_scriptable setscriptablepartstate("body", "enabled");
            continue;
        }
        if (prop_scriptable getscriptableparthasstate("base", "enabled")) {
            prop_scriptable setscriptablepartstate("base", "enabled");
        }
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa3
// Size: 0x135
function function_edb604ca8191a7a1() {
    self endon("death");
    level endon("game_ended");
    self.var_1e0eb63ecb3f1e2 = 0;
    wait 0.5;
    while (self.health > 0) {
        if (isdefined(level.var_ad60db7d1b6758ff) && isdefined(level.var_104dfa63c8e33c5a)) {
            foreach (player in level.players) {
                if (isalive(player)) {
                    if (distance2dsquared(self.origin, player.origin) < 256000000) {
                        if (isdefined(self.zombieaisettings.var_e58a65b7a8f5973c.bosshealthbar)) {
                            player [[ level.var_ad60db7d1b6758ff ]](self.zombieaisettings.var_e58a65b7a8f5973c.bosshealthbar, self);
                        }
                    } else {
                        player [[ level.var_104dfa63c8e33c5a ]]();
                    }
                    continue;
                }
                player [[ level.var_104dfa63c8e33c5a ]]();
            }
        }
        wait 2;
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2be0
// Size: 0xfb
function private function_a1cf1abf679a2c12(var_8c55111e0c85f768, var_7f26f0ab75172e97) {
    s_bundle = getscriptbundle("bosshealthbar:" + var_8c55111e0c85f768);
    if (isdefined(s_bundle)) {
        level.var_cae1a9afa788d36 = utility::default_to(s_bundle.var_57f17703d0c54bd5, 500);
        level.var_cae1a9afa788d36 = int(level.var_cae1a9afa788d36);
        if (!level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::open(self);
        }
        if (isdefined(s_bundle.icon)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::function_c4b608fac8636725(self, s_bundle.icon);
        }
        if (isdefined(s_bundle.bossname)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::function_fa61dfb76d14641f(self, s_bundle.bossname);
        }
        function_51a438d5cd8a5d0c(var_7f26f0ab75172e97.health, var_7f26f0ab75172e97.maxhealth);
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2ce3
// Size: 0x72
function private function_f3a272be026f65cf() {
    foreach (player in level.players) {
        if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(player)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::close(player);
        }
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2d5d
// Size: 0xa2
function private function_51a438d5cd8a5d0c(health, maxhealth) {
    if (!isdefined(health)) {
        health = 0;
    }
    if (!isdefined(maxhealth)) {
        maxhealth = 1;
    }
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        maxwidth = 500;
        if (isdefined(level.var_cae1a9afa788d36)) {
            maxwidth = level.var_cae1a9afa788d36;
        }
        var_1b60b445e73cfb77 = health / maxhealth;
        if (health <= 0 || maxhealth == 1) {
            var_1b60b445e73cfb77 = 0;
        }
        var_f2dfc5643b7c0d56 = int(maxwidth * var_1b60b445e73cfb77);
        level.var_15f48d5838e26ba0 zmbosshealthbar::function_4032c55b1a2de180(self, var_f2dfc5643b7c0d56);
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e07
// Size: 0x63
function private function_d304e397fd8be129(health) {
    if (!isdefined(health)) {
        health = 0;
    }
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        if (isdefined(self.var_1d9b646d4823feea) && health < self.var_1d9b646d4823feea) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::function_7996b90ec9893e23(self, gettime());
        }
        self.var_1d9b646d4823feea = health;
    }
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e72
// Size: 0x26
function private function_a3b9cffbd4aab638(isinvulnerable) {
    if (!isdefined(isinvulnerable)) {
        isinvulnerable = 0;
    }
    level.var_15f48d5838e26ba0 zmbosshealthbar::function_205b1b924ed09c63(self, isinvulnerable);
}

// Namespace mp_jup_hydro_ob / scripts\mp\maps\mp_jup_hydro\mp_jup_hydro_ob
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea0
// Size: 0x230
function function_b60de1b748c7230f() {
    ammo_mods = ["brainrot", "deadwire", "napalmburst", "cryofreeze", "shatterblast"];
    self.var_bed158a6dfac230d = 3;
    self.maxarmorhealth = self.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    waitframe();
    namespace_f8d3520d3483c1::setArmorHealth(self.maxarmorhealth);
    waitframe();
    namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(3);
    waitframe();
    namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    waitframe();
    a_weapons = self getweaponslist("primary");
    foreach (weapon in a_weapons) {
        self takeweapon(weapon);
    }
    waitframe();
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 50;
    item_entry = "ob_jup_item_weapon_ar_acharlie_blue";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 50;
    item_entry = "ob_jup_item_weapon_sm_coscar635_blue";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    wait 0.5;
    a_weapons = self getweaponslist("primary");
    for (i = 0; i < 2; i++) {
        currentweapon = a_weapons[i];
        if (namespace_a4ff02beedc1bce8::can_pap(currentweapon)) {
            namespace_a4ff02beedc1bce8::pap_weapon(currentweapon, 2);
        }
        waitframe();
        var_4bc27b790622bd85 = randomint(ammo_mods.size);
        namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(a_weapons[i], ammo_mods[var_4bc27b790622bd85]);
    }
    waitframe();
    namespace_876b4362ef613d7a::give_perk("specialty_juggernog", 0);
    namespace_876b4362ef613d7a::give_perk("specialty_speedcola", 0);
}

