#using scripts\common\values.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_2583ee5680cf4736;
#using script_43971bbeefd98f05;
#using script_7b2517368c79e5bc;
#using script_22f1701e151b9d12;
#using script_7d3e27aa82b5d70b;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4fa7e9e11630166c;
#using script_7153ce70c6d8ab9b;
#using script_62a4f7a62643fe8;
#using script_9880b9dc28bc25e;
#using scripts\common\scene.gsc;
#using script_100adcc1cc11d2fa;
#using script_41ffdbe01998b61a;
#using scripts\mp\gametypes\ob.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_2b264b25c7da0b12;
#using script_46c7c73b1a7e4773;
#using script_1f97a44d1761c919;
#using script_4e6e58ab5d96c2b0;
#using scripts\stealth\friendly.gsc;
#using scripts\common\ai.gsc;
#using script_371b4c2ab5861e62;
#using script_16ea1b94f0f381b3;
#using scripts\mp\mp_agent.gsc;
#using script_29cc982fdb174b47;
#using script_3f9c618c4c35ed2;
#using script_5200937492b52afd;
#using script_5762ac2f22202ba2;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\mp_agent_damage.gsc;
#using script_39d11000e476a42a;
#using script_58be75c518bf0d40;
#using script_482376d10f69832c;
#using script_2d400da2610fe542;
#using script_860bfdfe82326e3;
#using script_5080d40cd904ba73;
#using script_2590b7a7de3dfc79;

#namespace namespace_699654668bb05382;

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2485
// Size: 0x106
function function_9a5a6967260ab033() {
    level.var_e859e3e2283ccd72 = [];
    level.var_378ba68d7497e1d8 = [];
    level.crystals = [];
    level.orbs = [];
    level.var_29b5a6cada516f4 = [];
    level.var_b9302982132a18f4 = [];
    namespace_26050772d3578b37::function_98264e8b6400bc85("invalid", &function_4d8f396ff67ee981);
    namespace_26050772d3578b37::function_98264e8b6400bc85("valid", &function_e842371a9d56f3c);
    namespace_26050772d3578b37::function_98264e8b6400bc85("complete", &function_7e1c2731433235c1);
    level.var_49839a7ef42e68d8 = getspawnarray("mp_ob_spawn_story_start");
    level.var_2e2204c429664d9b = 1;
    level thread function_35b9ded36a8bcce1();
    level flag_wait("ob_systems_init_complete");
    function_79a555dd34feed87();
    level flag_wait("ob_infil_completed");
    level flag_wait("ob_infil_sergei_ravenov_spawned");
    setup_objectives();
    function_d5c1639a55d4747b();
    function_b76c8b4d1174ce98();
    /#
        setdevdvarifuninitialized(@"hash_ada96eeaba619d95", 0);
        thread function_37c4c59f6db8d93d();
    #/
    function_5fcb0fa5dbc72f8f();
    level thread function_c43d5fd390a4b9c1();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2593
// Size: 0x92
function function_35b9ded36a8bcce1() {
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    foreach (player in level.players) {
        player setsoundsubmix("jup_ob_story_intro_hallucination");
        player setsoundsubmix("jup_ob_global_s3_5_story");
        player clearsoundsubmix("jup_ob_prematch", 2);
        player playsound("ob_intro_storm_atmosphere");
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262d
// Size: 0x1eb
function function_79a555dd34feed87() {
    level.var_fdae3845de57bc9d = [];
    level.var_6f075a113ecf77c7 = [];
    level.var_c3fbc3c2dd4e5240 = [];
    level.var_747eee71c41ccadc = "";
    level.var_6b879e3378fe4f93 = 0;
    level.var_833c19ce35f0fdc0 = 0;
    level.var_d27f8b283029b2d9 = 0;
    level.var_f6026c03a08e67fa = [20, 25, 30, 45];
    level.var_b5c75487d8c13198 = 0;
    level.var_f607826b73b56d1c = [10, 7.5, 5];
    level.var_6d298bb3b2c8bf0 = 0;
    thread namespace_b000de497fab9bf4::function_ccde446fe7425514(1);
    if (!getdvarint(@"hash_1c2c174b18e6d9b8", 0)) {
        thread namespace_72d85a5f3cb24eec::function_4dd5d69d550c0999();
    }
    level.var_5737d2d2df1ce153 = 0;
    level._effect["crystal_impact"] = loadfx("vfx/jup/ob/gameplay/riftrun/s3_5/vfx_aether_crystal_impact.vfx");
    level._effect["rift_teleport"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_send.vfx");
    level._effect["item_portal"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_geotrail_portal.vfx");
    level._effect["item_glow_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_elec_trail.vfx");
    level._effect["entity_full_sequence"] = loadfx("vfx/jup/ob/gameplay/riftrun/s3_5/story_mission/the_entity/vfx_the_entity_full_sequence.vfx");
    level._effect["entity_ground_vortex_debris"] = loadfx("vfx/jup/ob/gameplay/riftrun/s3_5/story_mission/the_entity/vfx_the_entity_ground_vortex_debris.vfx");
    level._effect["entity_ground_vortex_out"] = loadfx("vfx/jup/ob/gameplay/riftrun/s3_5/story_mission/the_entity/vfx_the_entity_vortex_out.vfx");
    level._effect["zombie_explosion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_blast.vfx");
    thread function_7ea3baa66a1632a8();
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
    callback::add("ob_dark_aether_exit_used", &function_326173fb9c124250);
    callback::add("teleport_movie_complete", &play_outro_movie);
    /#
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        scripts\common\devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2820
// Size: 0x39a
function setup_objectives() {
    structs = getstructarray("objectiveloc", "targetname");
    var_c5e64707d1197842 = getscriptablearray("beamloc", "targetname");
    level.var_f3bab756384e809c = 0;
    foreach (objective in structs) {
        objname = objective.script_noteworthy;
        level.var_378ba68d7497e1d8[objname] = requestobjectiveid();
        level.var_e859e3e2283ccd72[objname] = objective;
        objective_add_objective(level.var_378ba68d7497e1d8[objname], "current", objective.origin + (0, 0, 40), "jup_ui_map_icon_generic_marker");
        update_objective_setbackground(level.var_378ba68d7497e1d8[objname], 1);
        objective_playermask_hidefromall(level.var_378ba68d7497e1d8[objname]);
        if (string_starts_with(objname, "shatter_crystal")) {
            function_814cce9446388493(objective);
        }
        if (string_starts_with(objname, "relic")) {
            var_8de84d74a1d3c4e6 = objective.script_noteworthy;
            level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6] = requestobjectiveid();
            objective_add_objective(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6], "current", objective.origin + (0, 0, 40), "jup_ui_map_icon_generic_marker");
            update_objective_setbackground(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6], 1);
            objective_playermask_hidefromall(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6]);
            function_73952f00a88cf059(objective, var_c5e64707d1197842);
        }
        if (string_starts_with(objname, "ally")) {
            ally = objective.script_noteworthy;
            level.var_378ba68d7497e1d8[ally] = requestobjectiveid();
            objective_add_objective(level.var_378ba68d7497e1d8[ally], "current", objective.origin + (0, 0, 40), "jup_ui_map_icon_generic_marker");
            update_objective_setbackground(level.var_378ba68d7497e1d8[ally], 1);
            objective_playermask_hidefromall(level.var_378ba68d7497e1d8[ally]);
        }
    }
    level.var_378ba68d7497e1d8["ally_ravenov"] = requestobjectiveid();
    objective_add_objective(level.var_378ba68d7497e1d8["ally_ravenov"], "current", level.var_1da22412ed7ad03b.origin + (0, 0, 70), "jup_ui_map_icon_generic_marker");
    update_objective_setbackground(level.var_378ba68d7497e1d8["ally_ravenov"], 1);
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["ally_ravenov"]);
    exfil_struct = getstruct("exfil_loc", "targetname");
    level.var_378ba68d7497e1d8["exfil_loc"] = requestobjectiveid();
    objective_add_objective(level.var_378ba68d7497e1d8["exfil_loc"], "current", exfil_struct.origin + (0, 0, 70), "jup_ui_map_icon_generic_marker");
    update_objective_setbackground(level.var_378ba68d7497e1d8["exfil_loc"], 1);
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["exfil_loc"]);
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("quest_s3_start", level.players);
    thread function_7eb3998d94066771();
    thread function_7fbb91645484b381();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc2
// Size: 0x6a
function function_7eb3998d94066771() {
    /#
        iprintlnbold("<dev string:x2b>");
    #/
    story_b4_blocker_backtrack = getent("story_b4_blocker_backtrack", "targetname");
    story_b4_blocker_shortcut = getent("story_b4_blocker_shortcut", "targetname");
    if (isdefined(story_b4_blocker_backtrack)) {
        story_b4_blocker_backtrack hide();
        story_b4_blocker_backtrack connectpaths();
    }
    if (isdefined(story_b4_blocker_shortcut)) {
        story_b4_blocker_shortcut hide();
        story_b4_blocker_shortcut connectpaths();
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c34
// Size: 0x82
function function_d5c1639a55d4747b() {
    structs = getstructarray("story_beat04_zombies", "targetname");
    foreach (var_72389a7e4c3fc8a4 in structs) {
        spawnpointname = var_72389a7e4c3fc8a4.script_noteworthy;
        level.var_f7a8d2e78fd2b52[spawnpointname] = var_72389a7e4c3fc8a4;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbe
// Size: 0x82
function function_b76c8b4d1174ce98() {
    structs = getstructarray("story_beat01_zombies", "targetname");
    foreach (var_3fba0a0b195a54ef in structs) {
        spawnpointname = var_3fba0a0b195a54ef.script_noteworthy;
        level.var_e1f421359687c085[spawnpointname] = var_3fba0a0b195a54ef;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d48
// Size: 0x81
function function_5fcb0fa5dbc72f8f() {
    if (level.players.size == 1) {
        level.players[0] namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    }
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s3_mi_invest_rift", 3);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd1
// Size: 0x198
function function_7fbb91645484b381() {
    if (!getdvarint(@"hash_b4be31edea652ee9", 0)) {
        if (!getdvarint(@"hash_16dd9ae8fc1d73e2", 0)) {
            thread function_8dd10b31a8f74003();
            level waittill("follow_jansen_done");
            function_3833d25304de8536("s3_mi_follow_jansen");
            thread function_b8484dc5c6089d34();
            level waittill("orbs_completed");
            function_3833d25304de8536("s3_mi_investigate_orbs");
            foreach (player in level.players) {
                player thread function_7cf6dbaa9ef8cccb();
            }
            thread function_a0e1fb5429cd7a1b();
            level waittill("shatter_complete");
            function_3833d25304de8536("s3_mi_shatter_crystals");
        }
        thread function_12379c8e50226132();
        level waittill("located_jansen");
        function_3833d25304de8536("s3_mi_locate_jansen");
        thread function_d213b5f14508efa3();
        level waittill("jansen_ascended");
        function_3833d25304de8536("s3_mi_jansen_float");
        thread function_ea799f5e293b64d4();
        level flag_wait("cleanse_complete");
        function_3833d25304de8536("s3_mi_cleanse_relics");
        thread function_d799b40ff023b54f();
        level waittill("champion_summoned");
        function_3833d25304de8536("s3_mi_investigate_relic");
        thread function_a35de6c5b343cfa3();
        level flag_wait("champion_defeated");
    }
    thread function_bc1a52fa90669800();
    level waittill("ava_assisted");
    function_3833d25304de8536("s3_mi_assist_jansen");
    function_6023fdec597394f3();
    thread function_bddaf96c035ab757();
    level flag_wait("approaching_exfil");
    function_533099706980bfb3();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2f71
// Size: 0x62
function private function_3833d25304de8536(challengeid) {
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09(challengeid, 3);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fdb
// Size: 0x306
function function_8dd10b31a8f74003() {
    level endon("game_ended");
    function_3546f2dacbfd6d45();
    foreach (player in level.players) {
        playerteam = player.team;
        break;
    }
    level flag_init("ava_spawned_b1");
    level flag_init("enter_storm_vo_done");
    level flag_init("interact_storm_vo_done");
    level flag_init("enter_storm_resp_vo_done");
    level flag_init("chase_ava_vo_done");
    s_ava = getstruct("ava_b1_follow", "script_noteworthy");
    var_e99a00d4556827b1 = getstruct("aether_storm_wall_spawnpoint", "targetname");
    var_314d64f88165a16c = getstruct("story_beat01_zombies_01_trigger", "targetname");
    var_314d67f88165a805 = getstruct("story_beat01_zombies_02_trigger", "targetname");
    var_314d66f88165a5d2 = getstruct("story_beat01_zombies_03_trigger", "targetname");
    var_4a68e3bda3dc8cf7 = distance2d(s_ava.origin, var_314d64f88165a16c.origin);
    var_4a68e4bda3dc8f2a = distance2d(s_ava.origin, var_314d67f88165a805.origin);
    var_4a68e5bda3dc915d = distance2d(s_ava.origin, var_314d66f88165a5d2.origin);
    function_606642b946a01237("jansen_b1", var_e99a00d4556827b1.origin, 2048, 1);
    level thread ava_spawn(1, 1, playerteam, 0);
    level flag_wait("ava_spawned_b1");
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_FOLLOW_JANSEN");
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["ally_ravenov"]);
    update_objective_onentity(level.var_378ba68d7497e1d8["ally_ravenov"], level.var_1da22412ed7ad03b);
    update_objective_setzoffset(level.var_378ba68d7497e1d8["ally_ravenov"], 70);
    thread function_b089e62f0a9ba1ae();
    /#
        iprintlnbold("<dev string:x49>" + var_4a68e3bda3dc8cf7);
    #/
    thread function_a5b76e0f5024cc9a(s_ava, "B1_ENCOUNTER_01", var_4a68e3bda3dc8cf7);
    level waittill("B1_ENCOUNTER_01");
    thread function_a5b76e0f5024cc9a(s_ava, "B1_ENCOUNTER_02", var_4a68e4bda3dc8f2a);
    level waittill("B1_ENCOUNTER_02");
    thread function_1e83d7b5929adc62();
    thread function_a5b76e0f5024cc9a(s_ava, "B1_ENCOUNTER_03", var_4a68e5bda3dc915d);
    level waittill("B1_ENCOUNTER_03");
    thread function_a5b76e0f5024cc9a(s_ava, "follow_jansen_enter_storm", 1940, 1);
    thread function_a6da8325b3f4c06a();
    level flag_wait("follow_jansen_enter_storm");
    thread function_c516db5b300eafd3();
    level flag_wait("enter_storm_resp_vo_done");
    thread function_37534ba08f2061db();
    flag_wait_all("interact_storm_vo_done", "enter_storm_resp_vo_done");
    level notify("orb_approach");
    level notify("follow_jansen_done");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32e9
// Size: 0x18b
function function_b8484dc5c6089d34() {
    level endon("game_ended");
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["ally_ravenov"]);
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["ava_b1_follow"]);
    wait 2;
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_INVESTIGATE_ORBS");
    namespace_324cb75236a72d33::function_a110e6203cd98cc9();
    for (i = 0; i < level.orbs.size; i++) {
        objname = "investigate_orb" + i + 1;
        level.var_378ba68d7497e1d8[objname] = requestobjectiveid();
        objective_add_objective(level.var_378ba68d7497e1d8[objname], "current", level.orbs[i].orb.move.origin + (0, 0, 192), "jup_ui_map_icon_generic_marker");
        update_objective_setbackground(level.var_378ba68d7497e1d8[objname], 1);
        objective_playermask_hidefromall(level.var_378ba68d7497e1d8[objname]);
        objective_onentity(level.var_378ba68d7497e1d8[objname], level.orbs[i].orb.move);
        objective_setzoffset(level.var_378ba68d7497e1d8[objname], 128);
        objective_playermask_showtoall(level.var_378ba68d7497e1d8[objname]);
        thread function_a5b76e0f5024cc9a(level.orbs[i].orb, "orbs_approached", 500, 1, undefined, undefined, 0);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x347c
// Size: 0xdc
function function_a0e1fb5429cd7a1b() {
    level endon("game_ended");
    foreach (crystal in level.crystals) {
        crystal.currstate = "QUEST_0_RIFT_S3_INVESTIGATE_CRYSTAL";
    }
    crystals_shattered = 0;
    while (crystals_shattered < 2) {
        level waittill("crystal_shattered");
        if (crystals_shattered == 0) {
            level thread namespace_446fc987a980892f::playconversation("quest_s35_crystal_1_shattered", level.players);
        } else if (crystals_shattered == 1) {
            level thread namespace_446fc987a980892f::playconversation("quest_s35_crystal_2_shattered", level.players);
        }
        crystals_shattered++;
        function_1b44e23d17799600(crystals_shattered);
    }
    function_1b44e23d17799600(0);
    level notify("shatter_complete");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3560
// Size: 0x175
function function_12379c8e50226132() {
    level endon("game_ended");
    thread function_f7c1ac7fa153a63b();
    foreach (player in level.players) {
        playerteam = player.team;
        break;
    }
    level flag_init("ava_spawned_b3");
    level thread ava_spawn(3, 0, playerteam, 0);
    level flag_wait("ava_spawned_b3");
    thread function_2ad9be8ccf6f1d13(3);
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_LOCATE_JANSEN");
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["ava_b3_locate"]);
    var_bcf33bc107f1e315 = getstruct("aether_storm_wall_spawnpoint", "targetname");
    function_606642b946a01237("jansen_b3", var_bcf33bc107f1e315.origin, 2048, 1);
    thread function_a5b76e0f5024cc9a(level.var_2ada333c838a2316, "approaching_jansen", 2560, 1, undefined, undefined, 0);
    waitframe();
    level flag_wait("approaching_jansen");
    thread function_d73ba5fb6ec69587();
    thread function_a5b76e0f5024cc9a(level.var_2ada333c838a2316, "located_jansen", 1600, 1, undefined, undefined, 0);
    waitframe();
    level flag_wait("located_jansen");
    level thread namespace_446fc987a980892f::playevent("quest_s35_prone_reaction", level.players);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36dd
// Size: 0x156
function function_d213b5f14508efa3() {
    level endon("game_ended");
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_JANSEN_FLOAT");
    var_ce8d6b3caec941b4 = getstruct("story_b3_jansen_assist_proximity", "targetname");
    thread function_a5b76e0f5024cc9a(var_ce8d6b3caec941b4, "investigated_relic", var_ce8d6b3caec941b4.radius, 1, undefined, undefined, 0);
    level flag_wait("investigated_relic");
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["ava_b3_locate"]);
    var_f974fadbc30a402e = getstruct("beat_03_entity_damage", "targetname");
    level.var_a80b68a2ba50f107 = var_f974fadbc30a402e.radius;
    level.var_7ba655706284de54 = 1;
    foreach (player in level.players) {
        player thread function_be582da155d48283(var_f974fadbc30a402e);
    }
    level waittill("jansen_ascended");
    foreach (player in level.players) {
        player playsound("ob_entity_reveal_impact_swt");
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x383b
// Size: 0x271
function function_ea799f5e293b64d4() {
    level endon("game_ended");
    foreach (struct in level.var_c3fbc3c2dd4e5240) {
        if (struct.element != "relic_net") {
            struct.beam setscriptablepartstate("beam", "on");
        }
        if (struct.element == "relic_net") {
            struct setscriptablepartstate("body", "blocked_giraffe");
        }
    }
    level namespace_446fc987a980892f::playconversation("quest_s35_floating", level.players);
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_CLEANSE_RELICS");
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["relic_journal"]);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["relic_laptop"]);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["relic_picture"]);
    function_c7311cb3f768f21e("jansen_b3");
    var_ffab411219d86e8e = getstruct("story_b3_cleanse_spawn_exclusion", "targetname");
    function_606642b946a01237("ravenov_b3_cleanse", var_ffab411219d86e8e.origin, var_ffab411219d86e8e.radius, 1);
    function_f18f39783c8cedc4(1, 0);
    foreach (struct in level.var_c3fbc3c2dd4e5240) {
        if (struct.element != "relic_net") {
            struct setscriptablepartstate("interact", "on");
        }
    }
    var_cee7c088cea1ce15 = 0;
    while (var_cee7c088cea1ce15 < 3) {
        level waittill("relic_cleansed");
        if (var_cee7c088cea1ce15 == 0) {
            level thread namespace_446fc987a980892f::playconversation("quest_s35_relic_1_cleansed", level.players);
        } else if (var_cee7c088cea1ce15 == 1) {
            level thread namespace_446fc987a980892f::playevent("quest_s35_relic_2_cleansed", level.players);
        } else if (var_cee7c088cea1ce15 == 2) {
            level thread namespace_446fc987a980892f::playconversation("quest_s35_relic_3_cleansed", level.players);
        }
        var_cee7c088cea1ce15++;
        function_1b44e23d17799600(var_cee7c088cea1ce15);
    }
    level flag_init("cleanse_complete");
    level flag_set("cleanse_complete");
    function_1b44e23d17799600(0);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab4
// Size: 0xc8
function function_d799b40ff023b54f() {
    level endon("game_ended");
    foreach (struct in level.var_c3fbc3c2dd4e5240) {
        if (struct.element == "relic_net") {
            struct setscriptablepartstate("interact", "on");
            struct setscriptablepartstate("body", "spawned_giraffe");
            struct.beam setscriptablepartstate("beam", "on");
            function_9306d91e52ec93e1("QUEST_0_RIFT_S3_INVESTIGATE_RELIC");
            objective_playermask_showtoall(level.var_378ba68d7497e1d8["relic_net"]);
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b84
// Size: 0x16a
function function_a35de6c5b343cfa3() {
    level endon("game_ended");
    function_c7311cb3f768f21e("ravenov_b3_cleanse");
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_DEFEAT_CHAMPION");
    level thread namespace_446fc987a980892f::playconversation("quest_s35_champion_spawn", level.players);
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle");
    function_f18f39783c8cedc4(1, 0);
    var_ab713f295daebce3 = level.var_e859e3e2283ccd72["defeat_champion"].origin + (0, 0, 100);
    level.var_e859e3e2283ccd72["defeat_champion"].requestid = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_04_champion", var_ab713f295daebce3, level.var_e859e3e2283ccd72["defeat_champion"].radius, 0, 1);
    foreach (player in level.players) {
        player setsoundsubmix("jup_ob_story_disciple_battle");
    }
    id = level.var_e859e3e2283ccd72["defeat_champion"].requestid;
    function_fc38783a3da0bc71(id, 1);
    namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(id, &function_9971fb846a82dae0);
    function_adcc96a7d541aa36(id, 0);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf6
// Size: 0xf1
function function_bc1a52fa90669800() {
    level endon("game_ended");
    foreach (player in level.players) {
        playerteam = player.team;
        break;
    }
    level flag_wait("jansen_descended");
    level.var_292a147310d4230f = "talk_ava";
    level.var_2ada333c838a2316 function_f7eedc699e0197bc();
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_ASSIST_JANSEN");
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["ava_b3_locate"]);
    update_objective_onentity(level.var_378ba68d7497e1d8["ava_b3_locate"], self.var_2ada333c838a2316);
    update_objective_setzoffset(level.var_378ba68d7497e1d8["ava_b3_locate"], 70);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3def
// Size: 0x35
function function_bddaf96c035ab757() {
    level endon("game_ended");
    thread function_2ad9be8ccf6f1d13(4);
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["defeat_champion"]);
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_ESCAPE_RIFT");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2c
// Size: 0x75
function function_9306d91e52ec93e1(var_72b043c81ce7080) {
    namespace_262d6474998a2356::function_641bc1548cff8210(var_72b043c81ce7080, level.players);
    foreach (player in level.players) {
        player setclientomnvar("ui_ob_active_contract_region_difficulty", 0);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea9
// Size: 0x18d
function function_f7eedc699e0197bc() {
    if (level.var_292a147310d4230f == "assist_ava") {
        var_cd5aaf61ae8fd97a = self.origin + (-24, 0, 16);
    } else if (level.var_292a147310d4230f == "talk_ava") {
        var_cd5aaf61ae8fd97a = self.origin + (-8, -24, 16);
    }
    self.interaction_handle = namespace_5775ad2badedbcaa::register_interact(var_cd5aaf61ae8fd97a, 96, &function_4eea21c9a865da34);
    self.interaction_handle linkto(self);
    self.interaction_handle setuseholdduration("duration_medium");
    self.interaction_handle sethintrequiresholding(1);
    self.interaction_handle sethintonobstruction("show");
    if (level.var_292a147310d4230f == "assist_ava") {
        self.interaction_handle setcursorhint("HINT_BUTTON");
        self.interaction_handle sethintstring(%JUP_OB_S3/ASSIST_JANSEN);
    } else if (level.var_292a147310d4230f == "talk_ava") {
        self.interaction_handle setcursorhint("HINT_BUTTON");
        self.interaction_handle sethintstring(%JUP_OB_S3/ASSIST_JANSEN);
    } else {
        self.interaction_handle setcursorhint("HINT_NOICON");
        self.interaction_handle sethintstring(%);
    }
    thread delete_on_death(self.interaction_handle);
    self.interaction_handle.agent = self;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x403e
// Size: 0xa1
function function_4eea21c9a865da34(player) {
    if (isdefined(player) && isdefined(level.var_292a147310d4230f)) {
        if (level.var_292a147310d4230f == "assist_ava") {
            player forceplaygestureviewmodel("jup_ges_open_portal");
            wait 0.1;
            level flag_init("investigated_relic");
            level flag_set("investigated_relic");
            level.var_292a147310d4230f = undefined;
            self delete();
            return;
        }
        if (level.var_292a147310d4230f == "talk_ava") {
            level notify("ava_assisted");
            level.var_292a147310d4230f = undefined;
            self delete();
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x40e7
// Size: 0x1c9
function function_c364ad2c70c7754b(var_90a13a0855079abe, var_594d8fc14ba5b0c1, var_fda338f25b2f012b) {
    if (istrue(var_594d8fc14ba5b0c1)) {
        level flag_init("ob_infil_" + var_90a13a0855079abe + "_spawned");
    }
    self.var_69b049cf4b18c73b = 1;
    self.rift_run = spawnstruct();
    self.animname = self.animsetname;
    var_91363db0fa8a40a6 = getdvarint(@"hash_8072b5d9a8b538f8", 200);
    if (var_fda338f25b2f012b) {
        if (!isdefined(self.stealth)) {
            thread scripts\stealth\friendly::main();
            ent_flag_wait("stealth_enabled");
            self.stealth_enabled = 1;
        }
        self.var_5323a94889eff1de = 1;
        self.var_3056d8c9bd11f1f2 = 1;
        self.var_cbd87a0bc497b778 = 1;
        if (isdefined(self.fnsetstealthstate)) {
            self [[ self.fnsetstealthstate ]]("combat");
            self aisetdesiredspeed(var_91363db0fa8a40a6);
        }
        scripts\common\ai::set_gunpose("gun_down");
    }
    self function_e99626add202fe1a(1);
    utility::set_battlechatter(0);
    self notify("removed from battleChatter");
    self.ignoresuppression = 1;
    self forcenetfieldhighlod(1);
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.damageshield = 1;
    self.dontmeleeme = 1;
    self.var_d8a098b0872bb2cb = 1;
    scripts\common\ai::magic_bullet_shield();
    self.var_9f009877c3bea958 = 1;
    self.dontgrenademe = 1;
    val::set(var_90a13a0855079abe, "damage", 0);
    val::set(var_90a13a0855079abe, "ignoreme", 1);
    if (istrue(var_594d8fc14ba5b0c1)) {
        flag_set("ob_infil_" + var_90a13a0855079abe + "_spawned");
    }
    self setgoalpos(self.origin, 10);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42b8
// Size: 0x53
function function_e3e2805312bb39c0() {
    self.nocorpse = 1;
    self.var_7e4b076a06c6df27 = 1;
    self.dropweapon = 0;
    self.damageshield = 0;
    self.var_d8a098b0872bb2cb = 0;
    if (istrue(self.magic_bullet_shield)) {
        scripts\common\ai::stop_magic_bullet_shield();
    }
    namespace_14d36171baccf528::function_7056963336f2bbec(1);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4313
// Size: 0x247
function function_b03da05ad9547b7f(spawnpoint, spawnangles, team, var_8b4f509c0e3d5e95, var_cdd0724a1b84bd90, var_594d8fc14ba5b0c1, var_fda338f25b2f012b) {
    self endon("game_ended");
    if (isdefined(self.var_2ada333c838a2316) && istrue(self.var_2ada333c838a2316.var_9c7b54b172c87654)) {
        self.var_2ada333c838a2316 function_e3e2805312bb39c0();
        self.var_2ada333c838a2316 = undefined;
    }
    aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("ava_jansen")[0];
    while (!isdefined(self.var_2ada333c838a2316)) {
        waitframe();
        self.var_2ada333c838a2316 = spawnnewaitype_sharedfunc(aitype, spawnpoint, spawnangles, team);
    }
    if (isdefined(self.var_2ada333c838a2316)) {
        if (istrue(var_8b4f509c0e3d5e95)) {
            self.var_2ada333c838a2316 setoverridearchetype("animscript", "agent_mp_jup_ob_ava", 1);
            if (istrue(var_fda338f25b2f012b)) {
                self.var_2ada333c838a2316.primaryweapon = self.var_2ada333c838a2316.sidearm;
                self.var_2ada333c838a2316.weapon = self.var_2ada333c838a2316.primaryweapon;
            } else {
                self.var_2ada333c838a2316.primaryweapon = nullweapon();
                self.var_2ada333c838a2316.weapon = self.var_2ada333c838a2316.primaryweapon;
            }
            self.var_2ada333c838a2316 [[ self.var_2ada333c838a2316.fnplaceweaponon ]](self.var_2ada333c838a2316.primaryweapon, "none");
            self.var_2ada333c838a2316.forcesidearm = 1;
        }
        self.var_2ada333c838a2316 function_c364ad2c70c7754b("ava_jansen", var_594d8fc14ba5b0c1, var_fda338f25b2f012b);
        if (istrue(var_cdd0724a1b84bd90)) {
            self.var_2ada333c838a2316 function_1809dfa468133ff8();
        }
        self.var_2ada333c838a2316 scripts\common\utility::set_battlechatter(1);
        self.var_2ada333c838a2316.battlechatter.stateoverride = "combat";
        self.var_2ada333c838a2316.var_9c7b54b172c87654 = 1;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4562
// Size: 0x13d
function ava_spawn(beat, var_cdd0724a1b84bd90, playerteam, var_fda338f25b2f012b) {
    level endon("game_ended");
    if (beat == 1) {
        s_ava = getstruct("ava_b1_follow", "script_noteworthy");
    } else if (beat == 3) {
        s_ava = getstruct("ava_b3_locate", "script_noteworthy");
    } else if (beat == 4) {
        s_ava = getstruct("ava_b4_exfil", "script_noteworthy");
    }
    if (!isdefined(var_fda338f25b2f012b)) {
        var_fda338f25b2f012b = 0;
    }
    function_b03da05ad9547b7f(s_ava.origin, s_ava.angles, playerteam, 1, var_cdd0724a1b84bd90, 0, var_fda338f25b2f012b);
    self.var_2ada333c838a2316 thread function_e6fba762c142fad4(beat);
    if (beat == 1) {
        level flag_set("ava_spawned_b1");
    }
    if (beat == 3) {
        level flag_set("ava_spawned_b3");
        thread function_6862e49547705509();
    }
    if (beat == 4) {
        self.var_2ada333c838a2316 setscriptablepartstate("minimap", "active");
        level flag_set("ava_spawned_b4");
        level.var_292a147310d4230f = "talk_ava";
        level.var_2ada333c838a2316 function_f7eedc699e0197bc();
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x46a7
// Size: 0x8c
function rift_run_animscripted_loop(animstring, org, var_8c94765ca587f86c) {
    level endon("game_ended");
    self notify("rift_run_animscripted_loop");
    self endon("rift_run_animscripted_loop");
    self endon("death");
    self endon("rift_run_animscripted_loop_end");
    if (isdefined(org)) {
        anim_node = spawnstruct();
        anim_node.origin = org;
        anim_node.angles = var_8c94765ca587f86c;
        animscripted_loop_relative(animstring, anim_node);
    } else {
        animscripted_loop(animstring);
    }
    while (true) {
        waitframe();
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x473b
// Size: 0x20
function rift_run_animscripted_loop_end() {
    level endon("game_ended");
    self endon("death");
    self notify("rift_run_animscripted_loop_end");
    animscripted_clear();
    waitframe();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4763
// Size: 0xc0
function function_e352ab768da80eb4(playerteam) {
    level endon("game_ended");
    var_2de6b144694b16ce = getstruct("story_b4_ravenov_spawn", "targetname");
    if (isdefined(var_2de6b144694b16ce)) {
        self.var_1da22412ed7ad03b = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_ally_ravenov_base", var_2de6b144694b16ce.origin, var_2de6b144694b16ce.angles, playerteam);
        if (isdefined(self.var_1da22412ed7ad03b)) {
            self.var_1da22412ed7ad03b.var_69b049cf4b18c73b = 1;
            self.var_1da22412ed7ad03b.var_9f009877c3bea958 = 1;
            self.var_1da22412ed7ad03b setscriptablepartstate("minimap", "active");
            self.var_1da22412ed7ad03b scripts\common\ai::magic_bullet_shield();
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x482b
// Size: 0x29
function function_1e83d7b5929adc62() {
    level namespace_446fc987a980892f::playconversation("quest_s35_enter_storm", level.players, 0);
    wait 4;
    level flag_set("enter_storm_vo_done");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x485c
// Size: 0x26
function function_c516db5b300eafd3() {
    level namespace_446fc987a980892f::playevent("quest_s35_enter_storm_resp", level.players, 0);
    level flag_set("enter_storm_resp_vo_done");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x488a
// Size: 0x26
function function_a6da8325b3f4c06a() {
    level namespace_446fc987a980892f::playevent("quest_s35_chase_ava", level.players, 0);
    level flag_set("chase_ava_vo_done");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48b8
// Size: 0x29
function function_37534ba08f2061db() {
    level namespace_446fc987a980892f::playevent("quest_s35_interact_storm_edge", level.players, 0);
    wait 5;
    level flag_set("interact_storm_vo_done");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48e9
// Size: 0xd6
function function_d73ba5fb6ec69587() {
    function_9b8829ab4092a7d7("ob_zombie_ambient", 0);
    function_9b8829ab4092a7d7("ob_zombie_ambient_s3_story", 0);
    foreach (player in level.players) {
        subzones = function_edaf361096c5af0c(player.origin, 2000);
        foreach (subzone in subzones) {
            function_df12bc7ed6efed1f(subzone.zoneindex);
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49c7
// Size: 0x1c
function function_54819c25cbc75ae9() {
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    function_9b8829ab4092a7d7("ob_zombie_ambient_s3_story", 1);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x49eb
// Size: 0x35
function function_f18f39783c8cedc4(var_e6a4d8c8216e66fc, var_92ba40b46d0eed9) {
    if (isdefined(var_e6a4d8c8216e66fc)) {
        function_9b8829ab4092a7d7("ob_zombie_ambient", var_e6a4d8c8216e66fc);
    }
    if (isdefined(var_92ba40b46d0eed9)) {
        function_9b8829ab4092a7d7("ob_zombie_ambient_s3_story", var_92ba40b46d0eed9);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a28
// Size: 0x40
function function_603c0e4ccd02a98e(pos, radius) {
    goalradius = radius;
    if (!isdefined(radius)) {
        goalradius = getdvarint(@"hash_e06f3741d186fe1c", 32);
    }
    self setgoalpos(pos, goalradius);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a70
// Size: 0x18
function function_552d5faaaedbde90() {
    self.ignoreall = 0;
    scripts\common\ai::set_gunpose("disable");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a90
// Size: 0x19
function function_6c5efbac5017bfed() {
    self.ignoreall = 1;
    scripts\common\ai::set_gunpose("gun_down");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab1
// Size: 0x8f
function function_9445edd8b9c81009() {
    var_e22803049e8a74a8 = getstruct("story_b1_ravenov_path_bridge", "targetname");
    var_32bee7a508f186c = getdvarint(@"hash_e06f3741d186fe1c", 32) + 32;
    while (true) {
        if (distancesquared(self.origin, var_e22803049e8a74a8.origin) < var_32bee7a508f186c * var_32bee7a508f186c) {
            break;
        }
        wait 1;
    }
    self.var_aeef663902296a44 = 1;
    namespace_7b853fc16496a9b1::function_2a543136fec78fcb();
    function_552d5faaaedbde90();
    level flag_set("ob_rift_run_ambient_zombie_start");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b48
// Size: 0xa3
function function_73cab470b35094() {
    level endon("game_ended");
    var_5967e9e936f0d1c8 = getstruct("story_b1_ravenov_path_wait", "targetname");
    var_5eeac69fb9196f66 = getstruct("story_b1_ravenov_path_end", "targetname");
    level waittill("ob_infil_animscripted_done");
    thread function_9445edd8b9c81009();
    function_603c0e4ccd02a98e(var_5967e9e936f0d1c8.origin, var_5967e9e936f0d1c8.radius);
    level flag_wait("follow_jansen_enter_storm");
    wait 3;
    function_603c0e4ccd02a98e(var_5eeac69fb9196f66.origin);
    self waittill("goal");
    level flag_set("ravenov_storm_edge");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf3
// Size: 0x156
function function_b089e62f0a9ba1ae() {
    level waittill("B1_ENCOUNTER_01");
    var_e3c1a3daeb820408 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_01_entrance_01", level.var_e1f421359687c085["story_beat01_zombies_01"].origin, level.var_e1f421359687c085["story_beat01_zombies_01"].radius, 0, 1);
    function_fc38783a3da0bc71(var_e3c1a3daeb820408, 1);
    level waittill("B1_ENCOUNTER_02");
    function_fc38783a3da0bc71(var_e3c1a3daeb820408, 0);
    var_e3c1a6daeb820aa1 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_01_entrance_02", level.var_e1f421359687c085["story_beat01_zombies_02"].origin, level.var_e1f421359687c085["story_beat01_zombies_02"].radius, 0, 1);
    function_fc38783a3da0bc71(var_e3c1a6daeb820aa1, 1);
    level waittill("B1_ENCOUNTER_03");
    function_fc38783a3da0bc71(var_e3c1a6daeb820aa1, 0);
    var_e3c1a5daeb82086e = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_01_entrance_03", level.var_e1f421359687c085["story_beat01_zombies_03"].origin, level.var_e1f421359687c085["story_beat01_zombies_03"].radius, 0, 1);
    function_fc38783a3da0bc71(var_e3c1a5daeb82086e, 1);
    level flag_wait("follow_jansen_enter_storm");
    thread function_f18f39783c8cedc4(0, 0);
    function_fc38783a3da0bc71(var_e3c1a5daeb82086e, 0);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d51
// Size: 0x29b
function function_7ea3baa66a1632a8() {
    level endon("game_ended");
    thread function_4dd6b6d215526478();
    level flag::flag_wait("ob_infil_completed");
    var_5e64675a5f0ce8cb = getstruct("ob_circle_start", "targetname");
    level.ob_circle = spawnbrcircle(var_5e64675a5f0ce8cb.origin[0], var_5e64675a5f0ce8cb.origin[1], var_5e64675a5f0ce8cb.radius);
    level.ob_circle show();
    start_time = gettime();
    endtime = start_time + int(1800000);
    setomnvar("ui_hardpoint_timer", endtime);
    setomnvar("ui_br_circle_state", 5);
    level.var_eb1e1026f86571fd = 9;
    level.ob_circle thread namespace_88d9f8b28d831818::circledamagetick();
    var_afe0e659397387a7 = 5.55556 * 1;
    new_radius = 10000;
    alerted = 0;
    level.ob_circle.var_20cc6f37f44ddf9d = 1;
    while (true) {
        if (alerted == 0 && 1000 * 1200 < gettime() - start_time) {
            setomnvar("ui_br_circle_state", 9);
            alerted = 1;
        }
        if (new_radius < 0) {
            var_ae4e969ba4f5fa85 = namespace_88d9f8b28d831818::function_19cc82eefa6754b5();
            function_74bc1b7b9d88a8eb(var_ae4e969ba4f5fa85, 0);
            setomnvar("ui_br_circle_state", 4);
            thread namespace_88d9f8b28d831818::function_b6c284a8a98ae76f();
            return;
        }
        new_radius -= var_afe0e659397387a7;
        if (level.var_5737d2d2df1ce153 == 0) {
            new_radius = isdefined(level.var_7f26f0ab75172e97) && new_radius > 2560 ? 2560 : new_radius;
            var_ae4e969ba4f5fa85 = namespace_88d9f8b28d831818::function_19cc82eefa6754b5();
            function_74bc1b7b9d88a8eb(var_ae4e969ba4f5fa85, new_radius);
        } else if (level.var_5737d2d2df1ce153 == 1) {
            new_radius = new_radius < 1024 ? new_radius : 1024;
            if (isdefined(self.var_2ada333c838a2316) && !flag("ava_finished_exfil_path")) {
                function_74bc1b7b9d88a8eb(self.var_2ada333c838a2316.origin, new_radius);
            } else {
                exfil = getstruct("exfil_loc", "targetname");
                function_74bc1b7b9d88a8eb(exfil.origin, new_radius);
            }
        }
        if (!level.ob_circle.var_20cc6f37f44ddf9d) {
            remaining = (endtime - gettime()) / 1000;
            var_afe0e659397387a7 = new_radius / remaining * 1;
            level.ob_circle.var_20cc6f37f44ddf9d = 1;
        }
        wait 1;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff4
// Size: 0x187
function function_4dd6b6d215526478() {
    var_c1aadab58878f676 = getstruct("aether_storm_spawnpoint", "targetname");
    level.var_c1aadab58878f676 = var_c1aadab58878f676;
    var_bcf33bc107f1e315 = getstruct("aether_storm_wall_spawnpoint", "targetname");
    level.var_7ba655706284de54 = 1;
    level.storm_wall = spawnscriptable("jup_zm_rift_cyclone_jansen_smoke_cover", var_bcf33bc107f1e315.origin, var_bcf33bc107f1e315.angles);
    level.var_54c6f60291f6049a = utility::spawn_model("jup_zm_rift_cyclone", var_c1aadab58878f676.origin, var_c1aadab58878f676.angles);
    level.storm_wall setscriptablepartstate("storm_wall", "on");
    level.var_a80b68a2ba50f107 = 1520;
    level.var_42aba4f03acde712 = spawnstruct();
    level.var_42aba4f03acde712 function_6b6b6273f8180522("Radiation_Ob", var_c1aadab58878f676.origin, var_c1aadab58878f676.radius);
    level.var_42aba4f03acde712 function_6988310081de7b45();
    level.var_ef49e5e604863c9e = namespace_ef96e7c723871c3d::function_c94f363ec8793bc2(var_c1aadab58878f676.origin, var_c1aadab58878f676.radius);
    foreach (player in level.players) {
        player thread function_be582da155d48283(var_c1aadab58878f676);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5183
// Size: 0xc2
function function_be582da155d48283(struct) {
    level endon("game_ended");
    level endon("crystals_shattered");
    level endon("champion_defeated");
    while (level.var_7ba655706284de54 == 1) {
        if (!isdefined(self) || !isalive(self)) {
            return;
        }
        if (distance2dsquared(self.origin, struct.origin) < level.var_a80b68a2ba50f107 * level.var_a80b68a2ba50f107) {
            self dodamage(20, struct.origin, self, undefined, "MOD_TRIGGER_HURT", "<explicitweaponnone>");
            self playsoundtoplayer("ob_entity_idle_damage_hit_plr", self);
        }
        level.var_42aba4f03acde712 function_4584ad1c0e2c58ec(level.var_a80b68a2ba50f107);
        wait 1.5;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x524d
// Size: 0x6d
function function_f7c1ac7fa153a63b() {
    level.var_54c6f60291f6049a setscriptablepartstate("vortex", "off");
    level.storm_wall setscriptablepartstate("storm_wall", "off");
    level.var_7ba655706284de54 = 0;
    level.var_42aba4f03acde712 function_4eaf685bc40a3b9();
    namespace_ef96e7c723871c3d::function_e05a3fe61be76eed(level.var_ef49e5e604863c9e);
    level.var_54c6f60291f6049a hide();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52c2
// Size: 0x2c
function function_74bc1b7b9d88a8eb(v_center, var_1cee67764fdc54de) {
    level.ob_circle brcirclemoveto(v_center[0], v_center[1], var_1cee67764fdc54de, 1);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f6
// Size: 0x2c
function function_15ca9f70cbe9c312() {
    self endon("game_ended");
    wait 5;
    level.var_5737d2d2df1ce153 = 1;
    level.ob_circle.var_20cc6f37f44ddf9d = 0;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x532a
// Size: 0x2c9
function function_3546f2dacbfd6d45() {
    level.orbs = getstructarray("orb_spawn", "targetname");
    level.orbs_completed = 0;
    index = 0;
    foreach (struct in level.orbs) {
        struct.spawn_pos = level.var_c1aadab58878f676.origin;
        struct.var_a88cf56769e54b8c = struct.origin;
        struct.orb = spawnscriptable("jup_zm_rift_orb", struct.spawn_pos);
        struct.orb.move_to_point = spawn("script_model", struct.spawn_pos);
        struct.orb.move_to_point setmodel("tag_origin");
        struct.orb.move = spawn("script_model", struct.spawn_pos);
        struct.orb.move setmodel("jup_zm_harvester_orb_invisible");
        struct.orb utility::function_6e506f39f121ea8a(struct.orb.move);
        var_ba4c16ad30a65991 = struct.name + "_path";
        struct.orb.path_start = getstruct(var_ba4c16ad30a65991, "targetname");
        struct.orb.var_b36f416ea2901969 = 128;
        struct.orb.var_4b277984303eb7df = 96;
        struct.orb.movespeed = 256;
        struct.orb thread function_fded7aee0416cc60();
        wait 0.1;
        struct.orb setscriptablepartstate("audio_loop", "on");
        struct.orb setscriptablepartstate("orb_vfx", "idle");
        struct.orb setscriptablepartstate("orb_trail_vfx", "on");
        struct.orb thread orb_approach(struct.var_a88cf56769e54b8c);
        struct.orb thread function_d1097fde26527288(index);
        struct.orb thread function_d6b6bdff230eaca7(index);
        index++;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55fb
// Size: 0xfd
function function_3b88b508a7f3c29f() {
    level endon("game_ended");
    level endon("orb_approach");
    level endon("orbs_investigated");
    deg = randomint(360);
    while (true) {
        r = 768;
        deg = deg + 15 >= 360 ? deg - 345 : deg + 15;
        offset = (r * cos(deg), r * sin(deg), 512);
        offset += (randomint(25), randomint(25), randomint(75));
        nextpoint = level.var_c1aadab58878f676.origin + offset;
        self.move playsoundonmovingent("ob_entity_orb_movement_storm");
        traveltime = function_4109edaf4da7c260(self.origin, nextpoint, self.movespeed * 6);
        self.move moveto(nextpoint, traveltime);
        wait traveltime;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5700
// Size: 0xe0
function orb_approach(position) {
    level endon("game_ended");
    level endon("orbs_approached");
    level endon("orbs_investigated");
    level waittill("orb_approach");
    traveltime = function_4109edaf4da7c260(self.origin, position, self.movespeed * 3);
    self.move moveto(position + (0, 0, 10), traveltime);
    self.move playsound("ob_entity_orb_spawn_in");
    wait traveltime;
    while (true) {
        offset = position + (randomint(25), randomint(25), randomint(25));
        traveltime = function_4109edaf4da7c260(self.origin, offset, self.movespeed / 3);
        self.move moveto(offset, traveltime);
        wait traveltime;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x57e8
// Size: 0x95
function private function_a66a20e7abefd245() {
    level endon("game_ended");
    self endon("orbs_investigated");
    traveltime = function_b9cd62f3073d79ee();
    while (true) {
        if (distancesquared(self.origin, self.nextpoint.origin) < 400) {
            self.currentpoint = self.nextpoint;
            self.nextpoint = getstruct(self.currentpoint.target, "targetname");
            traveltime = function_b9cd62f3073d79ee();
        }
        wait traveltime;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5885
// Size: 0x223
function private function_fded7aee0416cc60() {
    level endon("game_ended");
    self endon("orbs_investigated");
    self.move setcandamage(1);
    self.move.maxhealth = 100000;
    self.move.health = self.move.maxhealth;
    while (true) {
        damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self.move waittill("damage");
        attacker namespace_e072c8407b2a861c::updatehitmarker("standard", 0, 0, 0, undefined);
        self.move.health -= damage;
        if (self.move.maxhealth - self.move.health > 200) {
            if (!istrue(self.var_391454b918d6bbd7)) {
                foreach (var_47b102162a99163b in level.orbs) {
                    level notify("orbs_approached");
                    var_47b102162a99163b.orb.var_391454b918d6bbd7 = 1;
                }
                self.move.health = self.move.maxhealth;
            }
            if (istrue(self.var_e6efe97e978409b5)) {
                self notify("orbs_investigated");
            }
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ab0
// Size: 0x153
function private function_b9cd62f3073d79ee(movespeed) {
    if (isdefined(movespeed)) {
        self.movespeed = movespeed;
    }
    if (!isdefined(self.movespeed)) {
        self.movespeed = 256;
    }
    self.nextpoint = getstruct(self.currentpoint.target, "targetname");
    if (isdefined(self.nextpoint)) {
        var_bb00d74626744a15 = self.nextpoint.origin;
        traveltime = function_4109edaf4da7c260(self.origin, self.nextpoint.origin, self.movespeed);
        if (traveltime == 0) {
            self.currentpoint = self.nextpoint;
            self.nextpoint = getstruct(self.currentpoint.target, "targetname");
            var_bb00d74626744a15 = self.nextpoint.origin + (randomint(25), randomint(25), randomint(25));
            traveltime = function_4109edaf4da7c260(self.origin, var_bb00d74626744a15, self.movespeed);
        }
        self.move moveto(var_bb00d74626744a15, traveltime);
    }
    return traveltime;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0c
// Size: 0x10b
function function_d1097fde26527288(index) {
    level endon("game_ended");
    self endon("orbs_investigated");
    level waittill("orbs_approached");
    traveltime = function_4109edaf4da7c260(self.origin, self.path_start.origin, self.movespeed * 3);
    self.move playsoundonmovingent("ob_entity_orb_movement");
    self.move moveto(self.path_start.origin, traveltime);
    self.currentpoint = self.path_start;
    wait 1;
    function_c7311cb3f768f21e("jansen_b1");
    function_54819c25cbc75ae9();
    level thread namespace_446fc987a980892f::playevent("quest_s35_orb_spawn", level.players);
    wait traveltime - 1;
    thread function_a5b76e0f5024cc9a(self, "orbs_investigated", 500, 1, undefined, undefined, 1);
    self.var_e6efe97e978409b5 = 1;
    self.movespeed = 256;
    thread function_a66a20e7abefd245();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d1f
// Size: 0x1cf
function function_d6b6bdff230eaca7(index) {
    self waittill("orbs_investigated");
    var_47b102162a99163b = level.orbs[index];
    var_6fb11fc7c885b1e3 = getstruct("shatter_" + var_47b102162a99163b.script_noteworthy, "script_noteworthy");
    traveltime = function_4109edaf4da7c260(var_47b102162a99163b.orb.move.origin, var_6fb11fc7c885b1e3.origin, var_47b102162a99163b.orb.movespeed * 4);
    var_47b102162a99163b.orb.move moveto(var_6fb11fc7c885b1e3.origin, traveltime);
    self.move playsoundonmovingent("ob_entity_orb_movement");
    wait traveltime;
    var_47b102162a99163b.orb setscriptablepartstate("orb_vfx", "destroy");
    var_6fb11fc7c885b1e3.crystal setscriptablepartstate("interact", "on");
    var_6fb11fc7c885b1e3.crystal setscriptablepartstate("body", "imbued");
    level.orbs_completed++;
    if (index == 0) {
        objective_playermask_hidefromall(level.var_378ba68d7497e1d8["investigate_orb1"]);
        objective_playermask_showtoall(level.var_378ba68d7497e1d8["shatter_crystal_01"]);
    } else {
        objective_playermask_hidefromall(level.var_378ba68d7497e1d8["investigate_orb2"]);
        objective_playermask_showtoall(level.var_378ba68d7497e1d8["shatter_crystal_02"]);
    }
    if (level.orbs_completed == 1) {
        level notify("orbs_completed", index);
    }
    waitframe();
    var_47b102162a99163b.orb.move delete();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5ef6
// Size: 0x31
function function_4109edaf4da7c260(startpos, endpos, movespeed) {
    movetime = distance(startpos, endpos) / movespeed;
    return movetime;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f30
// Size: 0x2f4
function function_814cce9446388493(struct) {
    struct.crystal = spawnscriptable("jup_zm_rift_runed_crystal", struct.origin, struct.angles);
    struct.crystal setscriptablepartstate("body", "idle");
    struct.crystal setscriptablepartstate("interact", "off");
    struct.crystal.objname = struct.script_noteworthy;
    struct.crystal.sequence = struct.script_parameters;
    struct.currstate = "QUEST_0_RIFT_S3_INVESTIGATE_CRYSTAL";
    struct.crystal.rad = struct.radius;
    struct.crystal.invis = spawn("script_model", struct.origin);
    struct.crystal.invis setmodel("jup_zm_phase_crystal_floor_invisible");
    struct.crystal.invis.angles = struct.crystal.angles;
    struct.crystal.invis.aitypeid = function_2336488258354fbc(#"aitype", %"hash_5699e1035dbe3602");
    struct.crystal.invis.var_534e788bc498be9f = getscriptbundle(%"hash_27607d0a0826b151");
    struct.crystal.invis.var_1e0eb63ecb3f1e2 = 0;
    struct.crystal.invis.var_4919d15787f01154 = 1;
    struct.crystal.invis.fake_health = 1000;
    struct.crystal.health = struct.crystal.invis.fake_health;
    struct.crystal.invis.max_fake_health = 1000;
    struct.crystal.struct = struct;
    namespace_5775ad2badedbcaa::function_32645103f7520635(struct.crystal, &function_c178feb60d2deed5, undefined, &function_75e3c394904a2ff9);
    struct.crystal namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_d31c6370e6588338);
    level.crystals = array_add(level.crystals, struct);
    scripts\engine\scriptable::scriptable_adddamagedcallback(&function_daccb84b610468d3);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x622c
// Size: 0xae
function function_7cf6dbaa9ef8cccb() {
    level endon("game_ended");
    level endon("shatter_complete");
    while (true) {
        foreach (crystal in level.crystals) {
            if (function_5ef2e1ba215a6a35(self, crystal)) {
                var_708703779c71170f = crystal;
                break;
            }
        }
        if (isdefined(var_708703779c71170f)) {
            function_9230d6caa28540bb(self, var_708703779c71170f.currstate);
        } else {
            function_9230d6caa28540bb(self, "QUEST_0_RIFT_S3_SHATTER_CRYSTALS");
        }
        var_708703779c71170f = undefined;
        wait 0.1;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62e2
// Size: 0x45
function function_5ef2e1ba215a6a35(player, ent) {
    if (distance2d(player.origin, ent.origin) < ent.radius) {
        return 1;
    }
    return 0;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x632f
// Size: 0x81
function function_9230d6caa28540bb(player, obj) {
    var_5ce85f49892885d8 = tablelookuprownum("ob/ob_missions.csv", 1, obj);
    var_f1a21b880815d306 = var_5ce85f49892885d8 != -1;
    if (var_f1a21b880815d306) {
        contractindexstring = tablelookupbyrow("ob/ob_missions.csv", var_5ce85f49892885d8, 0);
        contractindex = int(contractindexstring);
        if (player getclientomnvar("ui_br_objective_index") != contractindex) {
            player setclientomnvar("ui_br_objective_index", contractindex);
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x63b8
// Size: 0x57
function function_b89bce7e1862e65e(var_56698d2cf6041d4f, var_2c9ef10973cf3ce3) {
    if (var_2c9ef10973cf3ce3 == 1) {
        return ter_op(var_56698d2cf6041d4f, "ai_flood_fill_encounter:s3_rift_sm_02_crystal_ambient_01", "ai_encounter:s3_rift_sm_02_crystal_01");
    }
    if (var_2c9ef10973cf3ce3 == 2) {
        return ter_op(var_56698d2cf6041d4f, "ai_flood_fill_encounter:s3_rift_sm_02_crystal_ambient_02", "ai_encounter:s3_rift_sm_02_crystal_02");
    }
    error("unexpected crystal_number");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6417
// Size: 0x21
function function_1c5d2fbeb5f73ca0(requestid, crystal) {
    wait 30;
    return crystal.is_active;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6441
// Size: 0x1f
function function_d3c1be1a85307ac8(requestid, crystal) {
    return !crystal.is_active;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6469
// Size: 0x5d
function function_7289fa22c19e33b() {
    crystal = self;
    var_25e0d40bee7ebafb = spawn_request(function_b89bce7e1862e65e(1, level.var_f3bab756384e809c), self.origin, 1000, 1, 1, 0);
    function_bc5315dc37ae4cf(var_25e0d40bee7ebafb, &function_1c5d2fbeb5f73ca0, self);
    function_73147cdf5c28d10c(var_25e0d40bee7ebafb, &function_d3c1be1a85307ac8, self);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64ce
// Size: 0xcf
function function_c178feb60d2deed5(player) {
    sequence = self.sequence;
    crystal = self;
    level.var_29b5a6cada516f4[sequence] = crystal;
    crystal.is_active = 1;
    var_266a2e67ff9628e1 = level.var_f3bab756384e809c;
    level.var_f3bab756384e809c++;
    crystal function_7289fa22c19e33b();
    crystal function_6b6b6273f8180522("Quest_Ob", crystal.origin, crystal.rad);
    crystal function_6988310081de7b45();
    namespace_324cb75236a72d33::function_857ac0179192120b(3, sequence, -1, var_266a2e67ff9628e1);
    crystal setscriptablepartstate("interact", "off");
    crystal.struct.currstate = "QUEST_0_RIFT_S3_WEAKEN_CRYSTAL";
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65a5
// Size: 0x26
function function_75e3c394904a2ff9(player) {
    wait 0.5;
    if (player usebuttonpressed()) {
        player forceplaygestureviewmodel("jup_ges_open_portal");
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65d3
// Size: 0x30
function function_d31c6370e6588338(interact, player) {
    return {#string:%JUP_OB_S3/INSPECT_CRYSTAL, #type:"HINT_BUTTON"};
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x660c
// Size: 0xbe
function function_4d8f396ff67ee981(sequence, eattacker) {
    crystal = level.var_29b5a6cada516f4[sequence];
    spawn_request(function_b89bce7e1862e65e(0, level.var_f3bab756384e809c), crystal.origin, 1000, 1, 1, 0);
    wait ter_op(isdefined(level.var_569c02e2320ca130), level.var_569c02e2320ca130, 1.5);
    level.var_f3bab756384e809c--;
    crystal.is_active = 0;
    crystal setscriptablepartstate("interact", "on");
    crystal.struct.currstate = "QUEST_0_RIFT_S3_INVESTIGATE_CRYSTAL";
    crystal function_4eaf685bc40a3b9();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66d2
// Size: 0x19
function function_e842371a9d56f3c(sequence, eattacker) {
    wait 0.1;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66f3
// Size: 0xbb
function function_7e1c2731433235c1(sequence, eattacker) {
    crystal = level.var_29b5a6cada516f4[sequence];
    crystal.is_active = 0;
    crystal.vulnerable = 1;
    crystal.invis.var_1e0eb63ecb3f1e2 = 1;
    crystal function_4eaf685bc40a3b9();
    crystal setscriptablepartstate("body", "vulnerable");
    crystal.struct.currstate = "QUEST_0_RIFT_S3_CRYSTAL_VULNERABLE";
    objective_icon(level.var_378ba68d7497e1d8[crystal.struct.script_noteworthy], "jup_ui_icon_contract_act_big_bounty");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x67b6
// Size: 0x251
function function_daccb84b610468d3(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (is_equal(instance.type, "jup_zm_rift_runed_crystal")) {
        if (istrue(instance.vulnerable) && !istrue(instance.destroyed)) {
            if (weapon::iswonderweapon(objweapon)) {
                idamage = function_8f6917b46e766cfa(idamage);
            }
            if (isdefined(instance.health)) {
                instance.health -= idamage;
                if (isplayer(eattacker)) {
                    instance.var_f49149402765ecae = function_6d6af8144a5131f1(instance.var_f49149402765ecae, eattacker);
                    if (scripts\mp\mp_agent_damage::function_87c3b43d00319847()) {
                        scripts\mp\mp_agent_damage::function_c54b2cc2e762c201(eattacker, instance.eidentifier, "none", smeansofdeath, objweapon, int(idamage), undefined, 0, undefined, 0, 0);
                    }
                    eattacker namespace_e072c8407b2a861c::updatehitmarker("standard", instance.health <= 0, 0, 0, undefined);
                    playfx(level._effect["crystal_impact"], shitloc, vdir);
                }
                if (instance.health <= 0) {
                    thread function_5f684837e5288b1e(instance.origin, 2000);
                    instance.destroyed = 1;
                    instance setscriptablepartstate("body", "destroyed");
                    instance setscriptablepartstate("health", "ignore_damage");
                    objective_playermask_hidefromall(level.var_378ba68d7497e1d8[instance.objname]);
                    instance.struct.currstate = "QUEST_0_RIFT_S3_SHATTER_CRYSTALS";
                    instance.invis.var_1e0eb63ecb3f1e2 = 0;
                    instance.invis delete();
                    level notify("crystal_shattered");
                    return;
                }
                instance.invis.fake_health = instance.health;
            }
            return;
        }
        namespace_72d85a5f3cb24eec::function_51b521e60a5390ca(eattacker, instance, smeansofdeath, objweapon);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a0f
// Size: 0x19
function function_8f6917b46e766cfa(idamage) {
    return int(max(idamage, 500));
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a31
// Size: 0x201
function function_6862e49547705509() {
    level.var_e56668c73d7cf4a0 = 0;
    actors = [level.var_2ada333c838a2316, level.var_1da22412ed7ad03b];
    animnode = utility::getstruct("scene_jup_ob_s3_entity_reveal", "targetname");
    animnode thread scene::play(actors, "shot_090", "scene_jup_ob_s3_entity_reveal");
    level flag_wait("investigated_relic");
    animnode scene::play(actors, "shot_010", "scene_jup_ob_s3_entity_reveal");
    level notify("jansen_ascended");
    animnode thread scene::play(actors, "shot_020", "scene_jup_ob_s3_entity_reveal");
    level.var_2ada333c838a2316 playloopsound("ob_entity_idle_lp");
    level flag_wait("champion_defeated");
    animnode scene::play(actors, "shot_030", "scene_jup_ob_s3_entity_reveal");
    animnode thread scene::play(actors, "shot_040", "scene_jup_ob_s3_entity_reveal");
    level flag_wait("ravenov_assist_ready");
    wait 1;
    animnode scene::play(level.var_1da22412ed7ad03b, "shot_050", "scene_jup_ob_s3_entity_reveal");
    animnode scene::play(actors, "shot_060", "scene_jup_ob_s3_entity_reveal");
    level flag_set("jansen_descended");
    animnode thread scene::play(actors, "shot_070", "scene_jup_ob_s3_entity_reveal");
    level waittill("ava_assisted");
    s_start = getstruct("story_b4_jansen_path_start", "targetname");
    level.var_2ada333c838a2316 setgoalpos(s_start.origin, 16);
    level.var_2ada333c838a2316.var_aeef663902296a44 = 1;
    level.var_2ada333c838a2316.primaryweapon = level.var_2ada333c838a2316.sidearm;
    level.var_2ada333c838a2316.weapon = level.var_2ada333c838a2316.primaryweapon;
    animnode scene::play(actors, "shot_080", "scene_jup_ob_s3_entity_reveal");
    level notify("ava_up");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6c3a
// Size: 0x1ac
function function_9971fb846a82dae0(requestid, dummy, agent, data) {
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["defeat_champion"]);
    update_objective_onentity(level.var_378ba68d7497e1d8["defeat_champion"], agent);
    update_objective_icon(level.var_378ba68d7497e1d8["defeat_champion"], "jup_ui_icon_contract_act_big_bounty");
    update_objective_setzoffset(level.var_378ba68d7497e1d8["defeat_champion"], 90);
    level.var_7f26f0ab75172e97 = agent;
    level.ob_circle.var_20cc6f37f44ddf9d = 0;
    agent.var_e23d72f180832aa = 1;
    agent.dontmeleeme = 1;
    agent.var_2c94b75746ceabe2 = 1;
    agent function_65cdab0fc78aba8f(level.var_e859e3e2283ccd72["defeat_champion"].origin, 2048);
    var_ab713f295daebce3 = level.var_e859e3e2283ccd72["defeat_champion"].origin + (0, 0, 100);
    agent setgoalpos(var_ab713f295daebce3, level.var_e859e3e2283ccd72["defeat_champion"].radius);
    agent scripts\common\callbacks::add("on_zombie_ai_damaged", &function_904e96c563b1581d);
    agent scripts\common\callbacks::add("on_zombie_ai_killed", &function_157eba852e9f6ccc);
    agent thread [[ level.var_a12f0fa2ac033f69 ]]();
    level flag_init("champion_spawned");
    level flag_set("champion_spawned");
    /#
        if (getdvarint(@"hash_232048f872f522a", 0)) {
            function_92ca01f14492b7e(agent);
        }
    #/
}

/#

    // Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x6dee
    // Size: 0x3f
    function function_92ca01f14492b7e(agent) {
        level endon("<dev string:x5c>");
        agent endon("<dev string:x6a>");
        wait 5;
        agent dodamage(agent.health - 10, agent.origin);
    }

#/

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e35
// Size: 0x2c8
function function_157eba852e9f6ccc(data) {
    level endon("game_ended");
    self thread [[ level.var_104dfa63c8e33c5a ]]();
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle_complete");
    setmusicstate("ob_underscore");
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_story_disciple_battle");
    }
    var_d9c21b88ca804bac = self.origin;
    id = level.var_e859e3e2283ccd72["defeat_champion"].requestid;
    function_fc38783a3da0bc71(id, 0);
    wait 2;
    explosionzombies = getaiarrayinradius(var_d9c21b88ca804bac, 3072, "team_two_hundred");
    foreach (zombie in explosionzombies) {
        if (isalive(zombie)) {
            zombie.marked_for_death = 1;
            zombie.nuked = 1;
            zombie.full_gib = 1;
            zombie.var_745cd904c1ec804c = 1;
            zombie kill();
        }
    }
    function_d73ba5fb6ec69587();
    function_b8b15f7f0820954e(level.players);
    waitframe();
    wait 2;
    level.var_c3fbc3c2dd4e5240["relic_net"] setscriptablepartstate("body", "spawned_giraffe");
    var_f064b76727edb83a = namespace_71ca15b739deab72::function_3ae7f99339b96499(getstruct("reward_rift", "targetname").origin);
    a_players = level.players[0] namespace_ca7b90256548aa40::getsquadmembers();
    var_3c99a2a84c4b850f = spawnstruct();
    reward_groups = [];
    foreach (player in a_players) {
        reward_groups[reward_groups.size] = [player];
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s3_mi_defeat_champion", 3);
    }
    namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, var_f064b76727edb83a, &function_44a005cc5d5a630e, undefined, var_3c99a2a84c4b850f);
    var_e10194ca6271ac0a = var_3c99a2a84c4b850f waittill("managed_reward_cache_spawn_done");
    wait 6;
    level flag_init("champion_defeated");
    level flag_set("champion_defeated");
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["defeat_champion"]);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7105
// Size: 0x18d
function function_904e96c563b1581d(sparams) {
    if (istrue(isplayer(sparams.einflictor)) && istrue(sparams.einflictor.isjuggernaut)) {
        sparams.idamage *= 10;
    }
    if (isdefined(level.var_186478f460903bc9)) {
        foreach (player in level.players) {
            newhealth = self.health - int(sparams.idamage);
            player [[ level.var_186478f460903bc9 ]](newhealth, self.maxhealth);
            player [[ level.var_2a85f1809bcaec82 ]](newhealth);
        }
    }
    if (self.health <= self.maxhealth * 0.5 && !isdefined(level.var_234110bb1dd86c6a)) {
        level thread namespace_446fc987a980892f::playevent("quest_s35_champion_low_health", level.players);
        level.var_234110bb1dd86c6a = 1;
    }
    if (self.health <= self.maxhealth * 0.15 && !isdefined(level.var_60493a17a6c40a4e)) {
        level thread namespace_446fc987a980892f::playevent("quest_s35_champion_low_health_resp", level.players);
        level.var_60493a17a6c40a4e = 1;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x729a
// Size: 0x47
function function_44a005cc5d5a630e(var_f7f66a8bcca0ac73) {
    cache = spawnstruct();
    items = function_bc2f4857c90f5344("ob_jup_hydro_obelisk_reward_giraffe_s3", 1);
    common_cache::function_fd95ef820bb2b980(items, cache);
    return cache.contents;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72ea
// Size: 0x3f
function function_6023fdec597394f3() {
    thread function_d73ba5fb6ec69587();
    level thread function_15ca9f70cbe9c312();
    thread function_a5b76e0f5024cc9a(getstruct("exfil_loc", "targetname"), "approaching_exfil", 1500);
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7331
// Size: 0x4d
function function_60bda6462db759b0(msg, goal) {
    if (msg != "reached" && msg != "goal") {
        self forceteleport(goal.origin, goal.angles);
        self notify("teleported");
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7386
// Size: 0x16
function function_6dca2c45c6fd335() {
    thread function_c5c7ffe1d92cd484();
    flag_wait("player_close");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73a4
// Size: 0x467
function function_e6fba762c142fad4(beat) {
    self endon("death");
    self.health = 1000;
    if (isdefined(level.players[0])) {
        self.team = level.players[0].team;
    }
    self setgoalpos(self.origin, 4);
    switch (beat) {
    case 1: 
        level flag_wait("follow_jansen_enter_storm");
        self.rift_run.var_607d49aee79396c = 1;
        var_103b7318ab7422e0 = getstruct("story_b1_jansen_end", "targetname");
        self setgoalpos(var_103b7318ab7422e0.origin, 32);
        self waittill("goal");
        level notify("ava_storm_end");
        level.var_2ada333c838a2316 = undefined;
        function_e3e2805312bb39c0();
        break;
    case 2: 
        break;
    case 3: 
        level waittill("ava_up");
        thread function_e7e794b8f5df5ba2();
        self pushplayer(1);
        self.pushable = 0;
        self.script_pushable = 0;
        self.var_5323a94889eff1de = 1;
        self.var_3056d8c9bd11f1f2 = 1;
        self.var_cbd87a0bc497b778 = 1;
        if (isdefined(self.fnsetstealthstate)) {
            self [[ self.fnsetstealthstate ]]("combat");
            self aisetdesiredspeed(200);
        }
        if (isalive(level.players[0])) {
            level.players[0] callback::callback("ava_defended");
        }
        setmusicstate("mx_jup_ob_q_energy_medium");
        wait 1;
        s_start = getstruct("story_b4_jansen_path_start", "targetname");
        self setgoalpos(s_start.origin, 16);
        msg = waittill_any_timeout_2(10, "goal");
        function_60bda6462db759b0(msg, s_start);
        function_6dca2c45c6fd335();
        s_goal = getstruct(s_start.target, "targetname");
        while (true) {
            self setgoalpos(s_goal.origin, s_goal.radius);
            flag_clear("player_close");
            msg = waittill_any_timeout_2(10, "goal");
            function_60bda6462db759b0(msg, s_goal);
            shouldwait = 1;
            if (isdefined(s_goal.script_noteworthy)) {
                thread function_c71a8f0ae166b4c3(s_goal);
                shouldwait = 0;
            }
            if (shouldwait) {
                function_6dca2c45c6fd335();
            }
            if (isdefined(s_goal.target)) {
                s_goal = getstruct(s_goal.target, "targetname");
                continue;
            }
            function_6dca2c45c6fd335();
            level flag_init("ava_path_complete");
            level flag_set("ava_path_complete");
            flag_clear("player_close");
            break;
        }
        break;
    case 4: 
        thread function_e7e794b8f5df5ba2();
        break;
    case #"hash_7c31479cf04292f": 
        level waittill("gate_spawned");
        level notify("ava_finished_exfil_path");
        wait 3;
        self notify("release");
        s_goal = getstruct("ai_exfil_point", "targetname");
        self setgoalpos(s_goal.origin, 25);
        self waittill("goal");
        playfxontag(getfx("rift_teleport"), self, "tag_origin");
        wait 1;
        stopfxontag(getfx("rift_teleport"), self, "tag_origin");
        objective_playermask_hidefromall(level.var_378ba68d7497e1d8["ava_b4_exfil"]);
        level notify("jansen_exited");
        function_5314ee75857e6c63(level.riftgate);
        objective_playermask_showtoall(level.var_378ba68d7497e1d8["exfil_loc"]);
        foreach (obj in level.var_378ba68d7497e1d8) {
            if (obj != level.var_378ba68d7497e1d8["exfil_loc"]) {
                objective_delete(obj);
            }
        }
        function_9306d91e52ec93e1("MISSION_OBJ_ESCAPE_RIFT");
        level.var_2ada333c838a2316 = undefined;
        function_e3e2805312bb39c0();
        break;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7813
// Size: 0x9d
function function_e7e794b8f5df5ba2() {
    self endon("death");
    s_door = getstruct("ava_at_door", "script_noteworthy");
    a_doors = [];
    var_a1b43f8114001a4c = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(s_door, a_doors, "ava_door", 0, undefined, undefined, 200);
    foreach (door in var_a1b43f8114001a4c) {
        namespace_f6368c72597c6d90::function_b092780f9ec4496e(door);
        door scriptabledooropen();
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78b8
// Size: 0x53
function function_c5c7ffe1d92cd484() {
    self endon("death");
    while (true) {
        player = getclosest(self.origin, level.players, 250);
        if (isalive(player)) {
            flag_set("player_close");
            return;
        }
        wait 0.1;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7913
// Size: 0x306
function function_c71a8f0ae166b4c3(s_goal) {
    switch (s_goal.script_noteworthy) {
    case #"hash_3fb6fc8aba73431f": 
        break;
    case #"hash_6288b2d979a85ea7": 
        id1 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_05_escape_01", level.var_f7a8d2e78fd2b52["story_beat04_zombies_01"].origin, level.var_f7a8d2e78fd2b52["story_beat04_zombies_01"].radius, 0, 1);
        function_fc38783a3da0bc71(id1, 1);
        level thread namespace_446fc987a980892f::playevent("quest_s35_escape_early", level.players);
        break;
    case #"hash_6288b3d979a8603a": 
        id2 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_05_escape_02", level.var_f7a8d2e78fd2b52["story_beat04_zombies_02"].origin, level.var_f7a8d2e78fd2b52["story_beat04_zombies_02"].radius, 0, 1);
        function_fc38783a3da0bc71(id2, 1);
        story_b4_blocker_backtrack = getent("story_b4_blocker_backtrack", "targetname");
        story_b4_blocker_shortcut = getent("story_b4_blocker_shortcut", "targetname");
        if (isdefined(story_b4_blocker_backtrack)) {
            story_b4_blocker_backtrack show();
            story_b4_blocker_backtrack disconnectpaths();
        }
        if (isdefined(story_b4_blocker_shortcut)) {
            story_b4_blocker_shortcut show();
            story_b4_blocker_shortcut disconnectpaths();
        }
        break;
    case #"hash_6288b4d979a861cd": 
        var_fe8f3203f630a715 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_05_escape_03", level.var_f7a8d2e78fd2b52["story_beat04_zombies_03"].origin, level.var_f7a8d2e78fd2b52["story_beat04_zombies_03"].radius, 0, 1);
        function_fc38783a3da0bc71(var_fe8f3203f630a715, 1);
        level thread namespace_446fc987a980892f::playevent("quest_s35_escape_middle", level.players);
        break;
    case #"hash_6288add979a856c8": 
        var_fe8f2b03f63097b0 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_05_escape_04", level.var_f7a8d2e78fd2b52["story_beat04_zombies_04"].origin, level.var_f7a8d2e78fd2b52["story_beat04_zombies_04"].radius, 0, 1);
        function_fc38783a3da0bc71(var_fe8f2b03f63097b0, 1);
        break;
    case #"hash_6288aed979a8585b": 
        var_fe8f2c03f63099e3 = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s3_rift_sm_05_escape_05", level.var_f7a8d2e78fd2b52["story_beat04_zombies_05"].origin, level.var_f7a8d2e78fd2b52["story_beat04_zombies_05"].radius, 0, 1);
        function_fc38783a3da0bc71(var_fe8f2c03f63099e3, 1);
        level waittill("gate_spawned");
        level thread namespace_446fc987a980892f::playevent("quest_s35_escape_end", level.players);
        break;
    case #"hash_5314a91e767e967": 
        level flag_wait("ava_path_complete");
        level flag_set("ava_finished_exfil_path");
        break;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c21
// Size: 0x438
function function_2ad9be8ccf6f1d13(beat) {
    self endon("death");
    level endon("game_ended");
    switch (beat) {
    case 1: 
        break;
    case 2: 
        break;
    case 3: 
        level flag_init("ravenov_assist_ready");
        namespace_7b853fc16496a9b1::function_6fc794f2bb3469b1();
        self.var_1da22412ed7ad03b waittill("goal");
        var_e6ca0bc10d713615 = getstruct("story_b3_ravenov_path_ascend_wait", "targetname");
        var_3bf522695f6e76ea = getstruct("story_b3_ravenov_path_cleanse", "targetname");
        var_a162d3b2c3f7ce7e = getstruct("story_b4_ravenov_path_assist_ava", "targetname");
        self.var_1da22412ed7ad03b setgoalpos(var_e6ca0bc10d713615.origin, 64);
        self.var_1da22412ed7ad03b waittill("goal");
        level flag_wait("investigated_relic");
        self.var_1da22412ed7ad03b namespace_7b853fc16496a9b1::function_2a543136fec78fcb();
        if (isdefined(self.var_1da22412ed7ad03b.fnsetstealthstate)) {
            self.var_1da22412ed7ad03b [[ self.var_1da22412ed7ad03b.fnsetstealthstate ]]("combat");
        }
        self.var_1da22412ed7ad03b setgoalpos(var_3bf522695f6e76ea.origin, 768);
        self.var_1da22412ed7ad03b waittill("goal");
        level flag_wait("champion_spawned");
        if (getdvarint(@"hash_2c59932456bf1826", 1)) {
            if (isdefined(level.var_7f26f0ab75172e97)) {
                wait 3;
                if (isdefined(level.var_7f26f0ab75172e97)) {
                    self.var_1da22412ed7ad03b thread function_7f7f4b8d2f7ae5ce(level.var_7f26f0ab75172e97, level.var_c1aadab58878f676.origin, 2560);
                }
            }
        }
        level flag_wait("champion_defeated");
        self.var_1da22412ed7ad03b setgoalpos(var_a162d3b2c3f7ce7e.origin, 32);
        msg = self.var_1da22412ed7ad03b waittill_any_timeout_2(10, "goal");
        self.var_1da22412ed7ad03b function_60bda6462db759b0(msg, var_a162d3b2c3f7ce7e);
        self.var_1da22412ed7ad03b orientmode("face angle 3d", var_a162d3b2c3f7ce7e.angles);
        level flag_set("ravenov_assist_ready");
        break;
    case 4: 
        level waittill("ava_up");
        s_start = getstruct("story_b4_jansen_path_start", "targetname");
        level.var_1da22412ed7ad03b setgoalpos(s_start.origin, 32);
        level.var_1da22412ed7ad03b pushplayer(1);
        level.var_1da22412ed7ad03b.pushable = 0;
        level.var_1da22412ed7ad03b.script_pushable = 0;
        level.var_1da22412ed7ad03b waittill("goal");
        if (isdefined(level.var_2ada333c838a2316)) {
            level.var_1da22412ed7ad03b setgoalentity(level.var_2ada333c838a2316);
            level.var_1da22412ed7ad03b.goalradius = 50;
            level.var_1da22412ed7ad03b.var_cbd2c45e12e0c27a = level.var_2ada333c838a2316;
        }
        break;
    case #"hash_7c31479cf04292f": 
        level.var_1da22412ed7ad03b setgoalpos(level.var_1da22412ed7ad03b.origin, 25);
        level waittill("jansen_exited");
        wait 2;
        var_d42ab97775d5c9ff = getstruct("ai_exfil_point", "targetname");
        level.var_1da22412ed7ad03b setgoalpos(var_d42ab97775d5c9ff.origin, 25);
        self.var_1da22412ed7ad03b waittill("goal");
        playfxontag(getfx("rift_teleport"), self.var_1da22412ed7ad03b, "tag_origin");
        wait 1;
        stopfxontag(getfx("rift_teleport"), self.var_1da22412ed7ad03b, "tag_origin");
        self.var_1da22412ed7ad03b function_e3e2805312bb39c0();
        self.var_1da22412ed7ad03b = undefined;
        break;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8061
// Size: 0x9f
function function_7f7f4b8d2f7ae5ce(var_f7c09e4d1c282b42, var_c30bf0ad52b35f12, dist) {
    level endon("game_ended");
    level endon("champion_defeated");
    while (isdefined(var_f7c09e4d1c282b42)) {
        var_98ee6ac7b44ffc2e = distance2dsquared(self.origin, var_c30bf0ad52b35f12);
        var_5df22e60db2abaf0 = distance2dsquared(var_f7c09e4d1c282b42.origin, var_c30bf0ad52b35f12);
        if (var_98ee6ac7b44ffc2e >= squared(dist) || var_5df22e60db2abaf0 >= squared(dist)) {
            self cleargoalentity();
            self setgoalpos(var_c30bf0ad52b35f12, dist);
        } else {
            self setgoalentity(var_f7c09e4d1c282b42);
        }
        wait 0.5;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8108
// Size: 0x22f
function function_533099706980bfb3() {
    level flag_wait("ava_path_complete");
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["ava_b4_exfil"]);
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_ESCAPE_RIFT_DEFEND");
    level.var_2ada333c838a2316 thread function_e6fba762c142fad4("exfil");
    level thread function_2ad9be8ccf6f1d13("exfil");
    var_da8d68cc5b875714 = getstructarray("exfil_loc", "targetname");
    foreach (s_exit in var_da8d68cc5b875714) {
        var_d0809b7599d6c0c3 = spawnscriptable("s2_ob_jup_scriptable_rift_gate_vortex", s_exit.origin, s_exit.angles);
        earthquake(0.3, 10, s_exit.origin, 30000);
    }
    var_d0809b7599d6c0c3 setscriptablepartstate("vortex", "on");
    wait 3;
    var_d0809b7599d6c0c3 setscriptablepartstate("vortex", "off");
    var_e759223f74ab2a4e = spawnscriptable("s2_ob_jup_scriptable_rift_portal_formation", s_exit.origin, s_exit.angles);
    var_e759223f74ab2a4e setscriptablepartstate("formation_vfx", "active");
    wait 8.5;
    foreach (s_exit in var_da8d68cc5b875714) {
        gate_model = namespace_4164bc931714b00b::spawn_script_model(s_exit, "jup_zm_rift_portal_small", 1, 1);
        level.riftgate = gate_model;
        if (isdefined(gate_model)) {
            gate_model.targetname = "dark_aether_exit";
            level.riftgate setscriptablepartstate("aether_exit_body", "rift_mission_exit");
        }
    }
    thread function_5f684837e5288b1e(s_exit.origin, 2000);
    wait 2;
    var_e759223f74ab2a4e setscriptablepartstate("formation_vfx", "off");
    level notify("gate_spawned");
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_ESCAPE_RIFT_EXFIL");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x833f
// Size: 0x83
function function_5314ee75857e6c63(gate_model) {
    level.riftgate setscriptablepartstate("aether_exit_body", "rift_mission_exit");
    gate_model.gate_interact = namespace_5775ad2badedbcaa::register_interact(gate_model.origin + (0, 0, 48), 150, &function_5927fdb24018f9c7);
    gate_model.gate_interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_5aa40913d9085c11);
    gate_model.gate_interact sethintonobstruction("hide");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x83ca
// Size: 0x64
function function_5aa40913d9085c11(interact, player) {
    if (level.mapname == "mp_jup_bigmap") {
        return {#string:%JUP_OB_OBJECTIVES/BIGMAP_EXFILL, #type:"HINT_BUTTON"};
    }
    return {#string:%JUP_OB_S1/RIFT_EXIT, #type:"HINT_BUTTON"};
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8436
// Size: 0xbb
function function_5927fdb24018f9c7(player) {
    foreach (spectator in level.players) {
        spectatingplayer = spectator getspectatingplayer();
        if (isdefined(spectatingplayer)) {
            if (spectatingplayer == player) {
                if (!istrue(spectator.var_f52eb40ba99ffa4c)) {
                    thread function_b67447cfa15eb9e6(spectator);
                }
            }
        }
    }
    if (istrue(player.var_f52eb40ba99ffa4c)) {
        return;
    }
    thread function_b67447cfa15eb9e6(player);
    player setsoundsubmix("jup_ob_s3_rift_mission_outro");
    player clearsoundsubmix("jup_ob_global_s3_5_story");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84f9
// Size: 0x13
function function_b67447cfa15eb9e6(player) {
    namespace_b000de497fab9bf4::function_b67447cfa15eb9e6(player);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8514
// Size: 0x3d
function function_326173fb9c124250(params) {
    if (isplayer(self)) {
        namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s3_mi_escape_rift", 3);
        namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s3_rift_mission_complete", 3);
        function_b8b15f7f0820954e([self]);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8559
// Size: 0xe0
function play_outro_movie(params) {
    var_7848ff3f98ef4a73 = 0;
    var_8c6c2faac72ea626 = 10;
    videoname = "jup_ob_s3_outro";
    videoduration = 193;
    var_1bab87417f147c8f = 0;
    self setplayermusicstate("");
    self setsoundsubmix("jup_ob_endgame");
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 0, 0);
    thread scripts\common\utility::letterbox_enable(1);
    level.battlechatterdisabled = 1;
    self setclientomnvar("ui_br_bink_overlay_state", var_8c6c2faac72ea626);
    utility::hidehudenable();
    waitframe();
    self playcinematicforplayer(videoname, 1, var_1bab87417f147c8f);
    wait videoduration;
    self stopcinematicforplayer();
    self setclientomnvar("ui_br_bink_overlay_state", var_7848ff3f98ef4a73);
    level.battlechatterdisabled = 0;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 1, 0);
    level thread namespace_134d54e39331ee45::function_bf01aba31e9023d1(0, [self]);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8641
// Size: 0xd3
function private function_5f684837e5288b1e(location, radius) {
    level endon("game_ended");
    waitframe();
    explosionzombies = getaiarrayinradius(location, radius, "team_two_hundred");
    playfx(level._effect["zombie_explosion"], location);
    foreach (zombie in explosionzombies) {
        if (isalive(zombie)) {
            zombie.marked_for_death = 1;
            zombie.nuked = 1;
            zombie.full_gib = 1;
            zombie.var_745cd904c1ec804c = 1;
            zombie kill();
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x871c
// Size: 0x165
function function_a5b76e0f5024cc9a(s_spot, str_notify, n_radius, var_6b491201eb4dd277, str_endon, var_767372a33fdf060f, var_eb0972d6df2380ff) {
    level endon("game_ended");
    if (istrue(var_6b491201eb4dd277)) {
        if (isdefined(str_endon)) {
            level endon(str_endon);
        } else {
            level endon(str_notify);
        }
    }
    if (!istrue(var_eb0972d6df2380ff)) {
        level flag_init(str_notify);
    }
    if (!isdefined(n_radius)) {
        n_dist = squared(int(s_spot.radius * 0.7));
    } else {
        n_dist = squared(n_radius);
    }
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(s_spot.origin, player.origin) < n_dist) {
                    if (istrue(var_eb0972d6df2380ff)) {
                        s_spot notify(str_notify);
                    } else {
                        level flag_set(str_notify);
                        level notify(str_notify);
                    }
                    if (istrue(var_767372a33fdf060f)) {
                        objective_playermask_hidefromall(level.var_378ba68d7497e1d8[s_spot.script_noteworthy]);
                    }
                    return;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8889
// Size: 0x64
function function_1b44e23d17799600(value) {
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_param", value);
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x88f5
// Size: 0x47
function function_319c2f097ede51e0(targetname, entities, shot, time_fraction) {
    animnode = utility::getstruct(targetname, "targetname");
    animnode scene::play(entities, shot, undefined, time_fraction);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8944
// Size: 0x49
function function_57ac36ea7abb5af4(targetname, entities, shots, time_fraction) {
    if (isdefined(targetname)) {
        function_319c2f097ede51e0(targetname, entities, shots, time_fraction);
    } else {
        scene::play(entities, shots, undefined, time_fraction);
    }
    self notify("scene_complete");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8995
// Size: 0x276
function function_73952f00a88cf059(var_7bd2768769ec27ca, beams) {
    var_8de84d74a1d3c4e6 = var_7bd2768769ec27ca.script_noteworthy;
    level.var_6f075a113ecf77c7[var_8de84d74a1d3c4e6] = spawnscriptable("jup_zm_rift_s3_pedestal_top_scriptable", var_7bd2768769ec27ca.origin + (0, 0, 40), var_7bd2768769ec27ca.angles);
    level.var_6f075a113ecf77c7[var_8de84d74a1d3c4e6] setscriptablepartstate("fx", "off");
    level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] = spawnscriptable("jup_zm_rift_s3_pedestal_base_scriptable", var_7bd2768769ec27ca.origin, var_7bd2768769ec27ca.angles);
    level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].element = var_8de84d74a1d3c4e6;
    level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].completed = 0;
    if (var_8de84d74a1d3c4e6 == "relic_net") {
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("body", "spawned_" + "giraffe");
    }
    if (var_8de84d74a1d3c4e6 == "relic_journal") {
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("body", "spawned_" + "journal");
    }
    if (var_8de84d74a1d3c4e6 == "relic_laptop") {
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("body", "spawned_" + "laptop");
    }
    if (var_8de84d74a1d3c4e6 == "relic_picture") {
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("body", "spawned_" + "crayon");
    }
    foreach (beam in beams) {
        if (beam.script_noteworthy == level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].element) {
            level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].beam = beam;
        }
    }
    level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].beam setscriptablepartstate("beam", "off");
    level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("interact", "off");
    namespace_5775ad2badedbcaa::function_32645103f7520635(level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6], &function_c0b488aa76c77316, undefined, &function_3940ad0af0562d02);
    level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_dda97bcf0f20e53f);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8c13
// Size: 0x64
function function_dda97bcf0f20e53f(interact, player) {
    if (level.var_747eee71c41ccadc != "") {
        return {#string:%JUP_OB_S1/SEAL_ALREADY_ACTIVE, #type:"HINT_NOBUTTON"};
    }
    return {#string:%JUP_OB_S1/ACTIVATE_OBELISK, #type:"HINT_BUTTON"};
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c7f
// Size: 0x2d
function function_3940ad0af0562d02(player) {
    level endon("game_ended");
    wait 0.5;
    if (player usebuttonpressed()) {
        player forceplaygestureviewmodel("jup_ges_open_portal");
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8cb4
// Size: 0x3cc
function function_c0b488aa76c77316(player) {
    if (level.var_747eee71c41ccadc != "") {
        return;
    }
    level.var_747eee71c41ccadc = self.element;
    foreach (base in level.var_c3fbc3c2dd4e5240) {
        base setscriptablepartstate("interact", "off");
    }
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_contract_action_loop");
    self setscriptablepartstate("interact", "off");
    self.beam setscriptablepartstate("beam", "off");
    if (self.element == "relic_net") {
        if (level.var_833c19ce35f0fdc0 > 2) {
            level.var_6f075a113ecf77c7["relic_net"] setscriptablepartstate("body", "destroyed");
            level.var_6f075a113ecf77c7["relic_net"] setscriptablepartstate("fx", "electric" + "_done");
            self setscriptablepartstate("body", "active_" + "giraffe");
            level notify("champion_summoned");
            objective_playermask_hidefromall(level.var_378ba68d7497e1d8["relic_net"]);
            return;
        }
        self.completed = 1;
        level flag_init("investigated_relic");
        level flag_set("investigated_relic");
        return;
    }
    if (self.element == "relic_journal") {
        self setscriptablepartstate("body", "active_" + "journal");
    }
    if (self.element == "relic_laptop") {
        self setscriptablepartstate("body", "active_" + "laptop");
    }
    if (self.element == "relic_picture") {
        self setscriptablepartstate("body", "active_" + "crayon");
    }
    level.var_68d7534b8c965ed9 = spawnscriptable("jup_zm_rift_pedestal_orb_scriptable", self.origin + (0, 0, 40), self.angles);
    objective_setlabel(level.var_378ba68d7497e1d8[self.element], %JUP_OB_S1/ACTIVE_OBELISK);
    function_9306d91e52ec93e1("MISSION_OBJ_ACTIVE_OBELISK");
    waitframe();
    level.var_9763d266beaea837 = level.var_f6026c03a08e67fa[level.var_833c19ce35f0fdc0] * (1 + 0.6 * (min(level.players.size, 3) - 1));
    /#
        if (getdvarint(@"hash_7ab73409d133576a", 0)) {
            level.var_9763d266beaea837 = getdvarint(@"hash_7ab73409d133576a", 0);
        }
    #/
    level callback::add("on_ai_killed", &function_6e42339d9503b6b7);
    level callback::add("player_laststand", &function_35682bc06e3a7d3a);
    foreach (var_427c4a1fb88ca4b3 in level.var_c3fbc3c2dd4e5240) {
        if (var_427c4a1fb88ca4b3.element != self.element && var_427c4a1fb88ca4b3.completed != 1) {
            objective_playermask_hidefromall(level.var_378ba68d7497e1d8[var_427c4a1fb88ca4b3.element]);
        }
    }
    /#
        if (getdvarint(@"hash_cb4f8d269153bfa3", 0)) {
            obelisk_completed(level.var_6f075a113ecf77c7[level.var_747eee71c41ccadc].origin);
            return;
        }
    #/
    function_6094ec6f1a58a381();
    thread function_658b421b37fd7662();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9088
// Size: 0x69
function function_6094ec6f1a58a381() {
    var_44b27a8e32ebe296 = spawn_request("ai_flood_fill_encounter:s3_rift_sm_03_cleanse_0" + level.var_833c19ce35f0fdc0 + 1, self.origin, 1000, 1, 1, 0);
    function_bc5315dc37ae4cf(var_44b27a8e32ebe296, &function_b07493f60764eed4, level.var_833c19ce35f0fdc0);
    function_73147cdf5c28d10c(var_44b27a8e32ebe296, &function_64f4df7704af6dc2, self);
    function_e4a67fe4ddca7ed5(var_44b27a8e32ebe296, &function_5d1738a71dc36fa0, self);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90f9
// Size: 0x141
function function_658b421b37fd7662() {
    while (level.var_747eee71c41ccadc != "") {
        var_f911aed45eb961a3 = getaiarrayinradius(self.origin, 1000);
        foreach (zombie in var_f911aed45eb961a3) {
            if (!isdefined(zombie.var_f89106513931332c)) {
                zombie.var_f89106513931332c = 0;
            }
            var_52d83275cdaec498 = distance2dsquared(zombie.origin, self.origin) < 262144;
            if (var_52d83275cdaec498 == 1 && zombie.var_f89106513931332c == 0 && isalive(zombie)) {
                zombie function_3ab9164ef76940fd("obelisk_vfx", level.var_747eee71c41ccadc);
                zombie.var_f89106513931332c = 1;
                continue;
            }
            if (var_52d83275cdaec498 == 0 && zombie.var_f89106513931332c == 1) {
                zombie function_3ab9164ef76940fd("obelisk_vfx", "off");
                zombie.var_f89106513931332c = 0;
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9242
// Size: 0xb1
function function_35682bc06e3a7d3a(params) {
    if (level.var_747eee71c41ccadc != "" && level.var_6d298bb3b2c8bf0 == 0) {
        if (distance2dsquared(self.origin, level.var_6f075a113ecf77c7[level.var_747eee71c41ccadc].origin) < 1000000) {
            if (level.var_b5c75487d8c13198 < level.var_f607826b73b56d1c.size) {
                level.var_6d298bb3b2c8bf0 = level.var_f607826b73b56d1c[level.var_b5c75487d8c13198];
                level.var_b5c75487d8c13198++;
                wait level.var_6d298bb3b2c8bf0;
                level.var_6d298bb3b2c8bf0 = 0;
            }
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x92fb
// Size: 0xd7
function function_b07493f60764eed4(requestid, var_833c19ce35f0fdc0) {
    squadsize = level.players.size;
    var_b4a0bb985e832edf = level.var_d27f8b283029b2d9 / 100;
    var_415fd8a0dbe8422f = 1.5 / min(squadsize, 3) + 0.1 * max(3 - var_833c19ce35f0fdc0, 0) - 0.5;
    var_ebae3ffd14f48d6e = 4.5 / min(squadsize, 3) + 0.2 * max(3 - var_833c19ce35f0fdc0, 0) - 0.5;
    waveinterval = var_415fd8a0dbe8422f + (var_ebae3ffd14f48d6e - var_415fd8a0dbe8422f) * (1 - var_b4a0bb985e832edf);
    wait waveinterval + level.var_6d298bb3b2c8bf0;
    if (level.var_747eee71c41ccadc != "") {
        return 1;
    }
    return 0;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x93da
// Size: 0x2d
function function_64f4df7704af6dc2(requestid, userdata) {
    if (level.var_747eee71c41ccadc != "") {
        return 0;
    }
    return 1;
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x940f
// Size: 0x3a
function function_5d1738a71dc36fa0(requestid, obelisk, zombie, ai_data) {
    zombie function_65cdab0fc78aba8f(obelisk.origin, 768);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9451
// Size: 0xef
function function_6e42339d9503b6b7(params) {
    self function_9322f3cb1cd4111a();
    function_3ab9164ef76940fd("obelisk_vfx", "off");
    var_3e5bef4b6dd3e32a = level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc].origin;
    if (distance2dsquared(self.origin, var_3e5bef4b6dd3e32a) < 262144) {
        playfx(getfx("zombie_death"), self.origin);
        if (level.var_d27f8b283029b2d9 < level.var_9763d266beaea837) {
            level.var_d27f8b283029b2d9 += getdvarint(@"hash_a49725c449ea0e2b", 1) * 1;
            function_2b6783f1c69393ff(self.origin + (0, 0, 40), var_3e5bef4b6dd3e32a + (0, 0, 170), 0.25);
        }
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9548
// Size: 0x6b
function function_2b6783f1c69393ff(spawn_origin, goal_position, var_6feb1183955c97a0) {
    var_6feb1183955c97a0 = utility::default_to(var_6feb1183955c97a0, 0);
    trail = utility::spawn_model("tag_origin", spawn_origin);
    trail.goal_position = goal_position;
    playfxontag(getfx("zombie_soul"), trail, "tag_origin");
    trail thread function_57961c5b765c270(var_6feb1183955c97a0);
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95bb
// Size: 0xa7
function function_57961c5b765c270(var_6feb1183955c97a0) {
    self endon("death");
    self playsound("evt_ob_rr_obelisk_soul_spawn");
    self playloopsound("evt_ob_rr_obelisk_soul_lp");
    if (var_6feb1183955c97a0 > 0) {
        wait var_6feb1183955c97a0;
    }
    self moveto(self.goal_position, 0.8, 0.2);
    self waittill("movedone");
    playfx(getfx("zombie_soul_impact"), self.goal_position);
    killfxontag(getfx("zombie_soul"), self, "tag_origin");
    playsoundatpos(self.origin, "evt_ob_rr_obelisk_soul_impact");
    function_4234407e34a559f9();
    self delete();
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x966a
// Size: 0xd6
function function_4234407e34a559f9() {
    var_2da558e8c88e09c = min(level.var_d27f8b283029b2d9 / level.var_9763d266beaea837, 1);
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_progress_bar", int(var_2da558e8c88e09c * 100));
    }
    if (var_2da558e8c88e09c >= 1) {
        obelisk_completed(level.var_6f075a113ecf77c7[level.var_747eee71c41ccadc].origin);
        return;
    }
    if (var_2da558e8c88e09c * 4 >= level.var_6b879e3378fe4f93 + 1) {
        level.var_6b879e3378fe4f93++;
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9748
// Size: 0x49c
function obelisk_completed(var_5535f2813b83d678) {
    level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc].completed = 1;
    level.var_833c19ce35f0fdc0++;
    foreach (base in level.var_c3fbc3c2dd4e5240) {
        if (!istrue(base.completed) && base.element != "relic_net") {
            base setscriptablepartstate("interact", "on");
        }
    }
    level.var_6f075a113ecf77c7[level.var_747eee71c41ccadc] setscriptablepartstate("body", "destroyed");
    level.var_6f075a113ecf77c7[level.var_747eee71c41ccadc] setscriptablepartstate("fx", "fire" + "_done");
    if (level.var_747eee71c41ccadc == "relic_journal") {
        level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc] setscriptablepartstate("body", "spawned_" + "journal");
    }
    if (level.var_747eee71c41ccadc == "relic_laptop") {
        level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc] setscriptablepartstate("body", "spawned_" + "laptop");
    }
    if (level.var_747eee71c41ccadc == "relic_picture") {
        level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc] setscriptablepartstate("body", "spawned_" + "crayon");
    }
    level.var_68d7534b8c965ed9 setscriptablepartstate("body", "done");
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_contract_win");
    thread function_c5c782caa574255f(var_5535f2813b83d678);
    returnobjectiveid(level.var_378ba68d7497e1d8[level.var_747eee71c41ccadc]);
    foreach (var_427c4a1fb88ca4b3 in level.var_c3fbc3c2dd4e5240) {
        if (var_427c4a1fb88ca4b3.completed != 1 && var_427c4a1fb88ca4b3.element != "relic_net") {
            objective_playermask_showtoall(level.var_378ba68d7497e1d8[var_427c4a1fb88ca4b3.element]);
        }
    }
    level.var_747eee71c41ccadc = "";
    level.var_6b879e3378fe4f93 = 0;
    level.var_b5c75487d8c13198 = 0;
    level.var_d27f8b283029b2d9 = 0;
    level callback::remove("on_ai_killed", &function_6e42339d9503b6b7);
    level callback::remove("player_laststand", &function_35682bc06e3a7d3a);
    function_c7311cb3f768f21e("obelisk", 10);
    explosionzombies = getaiarrayinradius(var_5535f2813b83d678, 1000, "team_two_hundred");
    foreach (zombie in explosionzombies) {
        if (isalive(zombie)) {
            zombie function_3ab9164ef76940fd("obelisk_vfx", "off");
            zombie kill();
            corpse = zombie getcorpseentity();
            if (isdefined(corpse)) {
                var_a33d2a2c3ffecb81 = corpse.origin - var_5535f2813b83d678 + (0, 0, 60);
                var_83fd98f3ac829176 = max(500 - distance2d(corpse.origin, var_5535f2813b83d678), 0) / 4;
                corpse startragdollfromimpact("torso_upper", var_a33d2a2c3ffecb81 * var_83fd98f3ac829176);
            }
        }
    }
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_param", level.var_833c19ce35f0fdc0);
        player setclientomnvar("ui_br_objective_progress_bar", 0);
        player namespace_301533d2f1378cb9::function_b5b4f530f1c579aa(2000);
    }
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    function_9b8829ab4092a7d7("ob_zombie_ambient_s3_story", 0);
    function_b8b15f7f0820954e(level.players);
    waitframe();
    function_9306d91e52ec93e1("QUEST_0_RIFT_S3_CLEANSE_RELICS");
    level notify("relic_cleansed");
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9bec
// Size: 0x176
function function_c5c782caa574255f(var_c2d35eda877c6b2c) {
    var_5a2483b8cdfb9542 = level.var_747eee71c41ccadc;
    switch (var_5a2483b8cdfb9542) {
    case #"hash_5b878377f6679274": 
        item = utility::spawn_model("jup_zm_relic_hunt_journal", var_c2d35eda877c6b2c);
        break;
    case #"hash_b073b032407e29c9": 
        item = utility::spawn_model("jup_zm_relic_hunt_laptop", var_c2d35eda877c6b2c);
        break;
    case #"hash_cf1ec0f3809a889d": 
        item = utility::spawn_model("jup_zm_relic_hunt_crayon_drawing", var_c2d35eda877c6b2c);
        break;
    }
    if (isdefined(item)) {
        item playloopsound("evt_ob_rr_obelisk_item_lp");
        playfxontag(getfx("item_glow_electric"), item, "tag_prop_fx");
        var_8ecb5bcd6e64e487 = 0;
        while (var_8ecb5bcd6e64e487 < 160) {
            item.origin = var_c2d35eda877c6b2c + (0, 0, 10 + 1.5 * cos(var_8ecb5bcd6e64e487 * 10));
            item.angles += (0, 2, 0);
            var_8ecb5bcd6e64e487 += 1;
            waitframe();
        }
        item playsound("evt_ob_rr_obelisk_item_takeoff");
        item moveto(var_c2d35eda877c6b2c + (0, 0, 1600), 4, 2);
        wait 4;
        playsoundatpos(item.origin, "evt_ob_rr_obelisk_item_end");
        playfx(getfx("item_portal"), item.origin);
        item delete();
    }
}

// Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9d6a
// Size: 0x160
function private function_c43d5fd390a4b9c1() {
    debris = utility::spawn_model("tag_origin", (-12035, 12241, 500));
    var_6c080715fc0509ac = utility::spawn_model("tag_origin", (-12097, 12304, 1244));
    var_7c53cee6a9d820c7 = getstruct("s_entity_full_sequence", "targetname");
    level.var_8d4f25dfdb2e4ec5 = utility::spawn_model("jup_zm_rift_entity", var_7c53cee6a9d820c7.origin, var_7c53cee6a9d820c7.angles);
    level waittill("the_entity_ground_vortex");
    playfxontag(getfx("entity_ground_vortex_debris"), debris, "tag_origin");
    level waittill("the_entity_full_sequence");
    level.var_8d4f25dfdb2e4ec5 setscriptablepartstate("entity_reveal", "entity_full_sequence");
    level waittill("the_entity_ground_vortex_off");
    killfxontag(getfx("entity_ground_vortex_debris"), debris, "tag_origin");
    level waittill("the_entity_vortex_out");
    level.var_8d4f25dfdb2e4ec5 setscriptablepartstate("entity_off", "vortex_out");
    level.var_2ada333c838a2316 stoploopsound("ob_entity_idle_lp");
    level waittill("the_entity_full_sequence_off");
    level.var_8d4f25dfdb2e4ec5 setscriptablepartstate("entity_reveal", "off");
    level waittill("jansen_paired_idle_vo");
    level thread namespace_446fc987a980892f::playconversation("quest_s35_recovery", level.players);
}

/#

    // Namespace namespace_699654668bb05382 / namespace_c7b56f74bc8bd1ce
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x9ed2
    // Size: 0x1cc
    function private function_37c4c59f6db8d93d() {
        level endon("<dev string:x5c>");
        var_cf8e9ca8050be819 = 0;
        while (true) {
            var_cf8e9ca8050be819 = getdvarint(@"hash_ada96eeaba619d95", 0);
            if (var_cf8e9ca8050be819 > 0) {
                switch (var_cf8e9ca8050be819) {
                case 1: 
                    level notify("<dev string:x73>");
                    break;
                case 2: 
                    level notify("<dev string:x82>");
                    break;
                case 3: 
                    foreach (orb in level.orbs) {
                        orb notify("<dev string:x98>");
                    }
                    break;
                case 4: 
                    level notify("<dev string:xad>");
                    break;
                case 5: 
                    level notify("<dev string:xc1>");
                    break;
                case 6: 
                    level notify("<dev string:xd3>");
                    break;
                case 7: 
                    level notify("<dev string:xe9>");
                    break;
                case 8: 
                    level notify("<dev string:xfc>");
                    break;
                case 9: 
                    level notify("<dev string:x110>");
                    break;
                case 10: 
                    level notify("<dev string:x125>");
                    break;
                case 11: 
                    level notify("<dev string:x13a>");
                    break;
                case 12: 
                    level notify("<dev string:x14a>");
                    break;
                case 13: 
                    level notify("<dev string:x15f>");
                    break;
                }
            }
            setdvar(@"hash_ada96eeaba619d95", 0);
            wait 1;
        }
    }

#/
