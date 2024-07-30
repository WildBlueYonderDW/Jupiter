#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_2583ee5680cf4736;
#using script_43971bbeefd98f05;
#using script_7b2517368c79e5bc;
#using script_22f1701e151b9d12;
#using script_7d3e27aa82b5d70b;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4fa7e9e11630166c;
#using script_4e6e58ab5d96c2b0;
#using script_100adcc1cc11d2fa;
#using script_3f9c618c4c35ed2;
#using script_1c6e50e1bfd8faaa;
#using scripts\mp\gametypes\ob.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_2b264b25c7da0b12;
#using script_46c7c73b1a7e4773;
#using script_1f97a44d1761c919;
#using script_2590b7a7de3dfc79;
#using scripts\mp\mp_agent.gsc;
#using script_39d11000e476a42a;
#using script_58be75c518bf0d40;
#using script_482376d10f69832c;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5080d40cd904ba73;

#namespace namespace_1accee5a5436c3b4;

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9c
// Size: 0x83
function function_3dd46b5ca402d985() {
    level thread function_35b9ded36a8bcce1();
    level flag_wait("ob_systems_init_complete");
    function_79a555dd34feed87();
    level flag_wait("ob_infil_completed");
    setup_objectives();
    function_5fcb0fa5dbc72f8f();
    if (getdvarint(@"hash_f9ee8faa2cac8429", 0) == 0) {
        thread function_73952f00a88cf059();
        level waittill("obelisks_complete");
    }
    function_6023fdec597394f3();
    level waittill("approaching_exfil");
    spawn_deathworm();
    level waittill("respawn_exit");
    function_fc99ac2e6ca4ea02();
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd27
// Size: 0x80
function function_35b9ded36a8bcce1() {
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    level thread namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2(level.players);
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_prematch", 2);
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdaf
// Size: 0x1e3
function function_79a555dd34feed87() {
    level.Obelisks = [];
    level.var_c3fbc3c2dd4e5240 = [];
    level.var_747eee71c41ccadc = "";
    level.var_6b879e3378fe4f93 = 0;
    level.var_833c19ce35f0fdc0 = 0;
    level.var_d27f8b283029b2d9 = 0;
    level.var_f6026c03a08e67fa = [30, 35, 40, 45];
    level.var_b5c75487d8c13198 = 0;
    level.var_f607826b73b56d1c = [10, 7.5, 5];
    level.var_6d298bb3b2c8bf0 = 0;
    level.var_378ba68d7497e1d8 = [];
    level._effect["item_glow_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_toxic_trail.vfx");
    level._effect["item_glow_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_elec_trail.vfx");
    level._effect["item_glow_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_fire_trail.vfx");
    level._effect["item_glow_ice"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_cryo_trail.vfx");
    level._effect["item_portal"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_geotrail_portal.vfx");
    level._effect["zombie_death"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_spawn.vfx");
    level._effect["zombie_soul"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_trail.vfx");
    level._effect["zombie_soul_impact"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_impact.vfx");
    thread namespace_b000de497fab9bf4::function_ccde446fe7425514();
    thread namespace_88d9f8b28d831818::function_ecd079f7925cc275();
    thread namespace_a2e8eaa629316056::function_4dd5d69d550c0999();
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
    callback::add("ob_dark_aether_exit_used", &function_d67013e07c9dfbaa);
    callback::add("teleport_movie_complete", &play_outro_movie);
    /#
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x2b>", "<dev string:x3b>", &function_3d5b3aa6ffe90a9e);
        scripts\common\devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf9a
// Size: 0x1a3
function setup_objectives() {
    function_641bc1548cff8210("MISSION_OBJ_CORRUPT_OBELISKS", level.players);
    var_3c0264cdf25b5bdb = getstructarray("obeliskspawn", "targetname");
    foreach (var_7bd2768769ec27ca in var_3c0264cdf25b5bdb) {
        var_8de84d74a1d3c4e6 = var_7bd2768769ec27ca.script_noteworthy;
        level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6] = requestobjectiveid();
        objective_add_objective(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6], "current", var_7bd2768769ec27ca.origin + (0, 0, 40), "jup_ui_map_icon_generic_marker");
        update_objective_setbackground(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6], 1);
        objective_playermask_hidefromall(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6]);
    }
    exfil_struct = getstruct("exfil_loc", "targetname");
    level.var_378ba68d7497e1d8["escape"] = requestobjectiveid();
    objective_add_objective(level.var_378ba68d7497e1d8["escape"], "current", exfil_struct.origin + (0, 0, 70), "jup_ui_map_icon_generic_marker");
    update_objective_setbackground(level.var_378ba68d7497e1d8["escape"], 1);
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["escape"]);
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("quest_s1_start", level.players);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1145
// Size: 0x81
function function_5fcb0fa5dbc72f8f() {
    if (level.players.size == 1) {
        level.players[0] namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    }
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s1_mi_invest_rift", 2);
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ce
// Size: 0x1bc
function function_73952f00a88cf059() {
    var_3c0264cdf25b5bdb = getstructarray("obeliskspawn", "targetname");
    wait 8;
    foreach (var_7bd2768769ec27ca in var_3c0264cdf25b5bdb) {
        var_8de84d74a1d3c4e6 = var_7bd2768769ec27ca.script_noteworthy;
        level.Obelisks[var_8de84d74a1d3c4e6] = spawnscriptable("jup_zm_rift_pedestal_top_scriptable", var_7bd2768769ec27ca.origin + (0, 0, 40), var_7bd2768769ec27ca.angles);
        level.Obelisks[var_8de84d74a1d3c4e6] setscriptablepartstate("fx", "off");
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] = spawnscriptable("jup_zm_rift_pedestal_base_scriptable", var_7bd2768769ec27ca.origin, var_7bd2768769ec27ca.angles);
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].element = var_8de84d74a1d3c4e6;
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6].completed = 0;
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("body", "spawned_" + var_8de84d74a1d3c4e6);
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] setscriptablepartstate("interact", "on");
        namespace_5775ad2badedbcaa::function_32645103f7520635(level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6], &function_c0b488aa76c77316, undefined, &function_3940ad0af0562d02);
        level.var_c3fbc3c2dd4e5240[var_8de84d74a1d3c4e6] namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_dda97bcf0f20e53f);
        objective_playermask_showtoall(level.var_378ba68d7497e1d8[var_8de84d74a1d3c4e6]);
    }
    level thread namespace_446fc987a980892f::playevent("quest_s1_welcome", level.players);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1392
// Size: 0x64
function function_dda97bcf0f20e53f(interact, player) {
    if (level.var_747eee71c41ccadc != "") {
        return {#string:%JUP_OB_S1/SEAL_ALREADY_ACTIVE, #type:"HINT_NOBUTTON"};
    }
    return {#string:%JUP_OB_S1/ACTIVATE_OBELISK, #type:"HINT_BUTTON"};
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13fe
// Size: 0x26
function function_3940ad0af0562d02(player) {
    wait 1.15;
    if (player usebuttonpressed()) {
        player forceplaygestureviewmodel("jup_ges_open_portal");
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x142c
// Size: 0x1ff
function function_c0b488aa76c77316(player) {
    if (level.var_747eee71c41ccadc != "") {
        return;
    }
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_contract_action_loop");
    self setscriptablepartstate("body", "active_" + self.element);
    self setscriptablepartstate("interact", "off");
    level.var_68d7534b8c965ed9 = spawnscriptable("jup_zm_rift_pedestal_orb_scriptable", self.origin + (0, 0, 40), self.angles);
    objective_setlabel(level.var_378ba68d7497e1d8[self.element], %JUP_OB_S1/ACTIVE_OBELISK);
    function_641bc1548cff8210("MISSION_OBJ_ACTIVE_OBELISK", level.players);
    waitframe();
    level.var_9763d266beaea837 = level.var_f6026c03a08e67fa[level.var_833c19ce35f0fdc0] * (1 + 0.6 * (min(level.players.size, 3) - 1));
    level.var_747eee71c41ccadc = self.element;
    level callback::add("on_ai_killed", &function_6e42339d9503b6b7);
    level callback::add("player_laststand", &function_35682bc06e3a7d3a);
    foreach (var_427c4a1fb88ca4b3 in level.var_c3fbc3c2dd4e5240) {
        if (var_427c4a1fb88ca4b3.element != self.element && var_427c4a1fb88ca4b3.completed != 1) {
            objective_playermask_hidefromall(level.var_378ba68d7497e1d8[var_427c4a1fb88ca4b3.element]);
        }
    }
    function_606642b946a01237("obelisk", self.origin, 1500, self.element == "ice");
    function_6094ec6f1a58a381();
    thread function_658b421b37fd7662();
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1633
// Size: 0x66
function function_6094ec6f1a58a381() {
    var_44b27a8e32ebe296 = spawn_request("ai_flood_fill_encounter:ob_s1_mission_obelisk_encounter_" + self.element, self.origin, 1000, 1, 1, 0);
    function_bc5315dc37ae4cf(var_44b27a8e32ebe296, &function_b07493f60764eed4, level.var_833c19ce35f0fdc0);
    function_73147cdf5c28d10c(var_44b27a8e32ebe296, &function_64f4df7704af6dc2, self);
    function_e4a67fe4ddca7ed5(var_44b27a8e32ebe296, &function_5d1738a71dc36fa0, self);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a1
// Size: 0x141
function function_658b421b37fd7662() {
    while (level.var_747eee71c41ccadc != "") {
        var_f911aed45eb961a3 = getaiarrayinradius(self.origin, 1000);
        foreach (zombie in var_f911aed45eb961a3) {
            if (!isdefined(zombie.var_f89106513931332c)) {
                zombie.var_f89106513931332c = 0;
            }
            var_52d83275cdaec498 = distance2dsquared(zombie.origin, self.origin) < 122500;
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

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17ea
// Size: 0xb1
function function_35682bc06e3a7d3a(params) {
    if (level.var_747eee71c41ccadc != "" && level.var_6d298bb3b2c8bf0 == 0) {
        if (distance2dsquared(self.origin, level.Obelisks[level.var_747eee71c41ccadc].origin) < 1000000) {
            if (level.var_b5c75487d8c13198 < level.var_f607826b73b56d1c.size) {
                level.var_6d298bb3b2c8bf0 = level.var_f607826b73b56d1c[level.var_b5c75487d8c13198];
                level.var_b5c75487d8c13198++;
                wait level.var_6d298bb3b2c8bf0;
                level.var_6d298bb3b2c8bf0 = 0;
            }
        }
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18a3
// Size: 0xde
function function_b07493f60764eed4(requestid, var_833c19ce35f0fdc0) {
    squadsize = level.players.size;
    var_b4a0bb985e832edf = level.var_d27f8b283029b2d9 / level.var_9763d266beaea837;
    var_415fd8a0dbe8422f = 1.5 / min(squadsize, 3) + 0.1 * max(3 - var_833c19ce35f0fdc0, 0) - 0.5;
    var_ebae3ffd14f48d6e = 4.5 / min(squadsize, 3) + 0.2 * max(3 - var_833c19ce35f0fdc0, 0) - 0.5;
    waveinterval = var_415fd8a0dbe8422f + (var_ebae3ffd14f48d6e - var_415fd8a0dbe8422f) * (1 - var_b4a0bb985e832edf);
    wait waveinterval + level.var_6d298bb3b2c8bf0;
    if (level.var_747eee71c41ccadc != "") {
        return 1;
    }
    return 0;
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1989
// Size: 0x2d
function function_64f4df7704af6dc2(requestid, userdata) {
    if (level.var_747eee71c41ccadc != "") {
        return 0;
    }
    return 1;
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x19be
// Size: 0x3a
function function_5d1738a71dc36fa0(requestid, obelisk, zombie, ai_data) {
    zombie function_65cdab0fc78aba8f(obelisk.origin, 525);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a00
// Size: 0xd3
function function_6e42339d9503b6b7(params) {
    self function_9322f3cb1cd4111a();
    function_3ab9164ef76940fd("obelisk_vfx", "off");
    var_3e5bef4b6dd3e32a = level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc].origin;
    if (distance2dsquared(self.origin, var_3e5bef4b6dd3e32a) < 122500) {
        playfx(getfx("zombie_death"), self.origin);
        if (level.var_d27f8b283029b2d9 < level.var_9763d266beaea837) {
            level.var_d27f8b283029b2d9++;
            function_2b6783f1c69393ff(self.origin + (0, 0, 40), var_3e5bef4b6dd3e32a + (0, 0, 170), 0.25);
        }
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1adb
// Size: 0x6b
function function_2b6783f1c69393ff(spawn_origin, goal_position, var_6feb1183955c97a0) {
    var_6feb1183955c97a0 = utility::default_to(var_6feb1183955c97a0, 0);
    trail = utility::spawn_model("tag_origin", spawn_origin);
    trail.goal_position = goal_position;
    playfxontag(getfx("zombie_soul"), trail, "tag_origin");
    trail thread function_57961c5b765c270(var_6feb1183955c97a0);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4e
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

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfd
// Size: 0x13a
function function_4234407e34a559f9() {
    var_2da558e8c88e09c = min(level.var_d27f8b283029b2d9 / level.var_9763d266beaea837, 1);
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_progress_bar", int(var_2da558e8c88e09c * 100));
    }
    if (var_2da558e8c88e09c >= 1) {
        obelisk_completed(level.Obelisks[level.var_747eee71c41ccadc].origin);
        return;
    }
    if (var_2da558e8c88e09c * 4 >= level.var_6b879e3378fe4f93 + 1) {
        if (level.var_6b879e3378fe4f93 == 0 && randomint(100) < 66) {
            level thread namespace_446fc987a980892f::playevent("quest_s1_injured", level.players);
        }
        level.var_6b879e3378fe4f93++;
        level.Obelisks[level.var_747eee71c41ccadc] setscriptablepartstate("fx", level.var_747eee71c41ccadc + level.var_6b879e3378fe4f93);
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3f
// Size: 0x390
function obelisk_completed(var_5535f2813b83d678) {
    level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc].completed = 1;
    level.Obelisks[level.var_747eee71c41ccadc] setscriptablepartstate("body", "destroyed");
    level.Obelisks[level.var_747eee71c41ccadc] setscriptablepartstate("fx", level.var_747eee71c41ccadc + "_done");
    level.var_c3fbc3c2dd4e5240[level.var_747eee71c41ccadc] setscriptablepartstate("body", "spawned_" + level.var_747eee71c41ccadc);
    level.var_68d7534b8c965ed9 setscriptablepartstate("body", "done");
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_contract_win");
    thread function_c5c782caa574255f(var_5535f2813b83d678);
    returnobjectiveid(level.var_378ba68d7497e1d8[level.var_747eee71c41ccadc]);
    foreach (var_427c4a1fb88ca4b3 in level.var_c3fbc3c2dd4e5240) {
        if (var_427c4a1fb88ca4b3.completed != 1) {
            objective_playermask_showtoall(level.var_378ba68d7497e1d8[var_427c4a1fb88ca4b3.element]);
        }
    }
    level.var_747eee71c41ccadc = "";
    level.var_6b879e3378fe4f93 = 0;
    level.var_b5c75487d8c13198 = 0;
    level.var_d27f8b283029b2d9 = 0;
    level.var_833c19ce35f0fdc0++;
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
    function_b8b15f7f0820954e(level.players);
    waitframe();
    if (level.var_833c19ce35f0fdc0 < level.var_f6026c03a08e67fa.size) {
        function_641bc1548cff8210("MISSION_OBJ_CORRUPT_OBELISKS", level.players);
        return;
    }
    level notify("obelisks_complete");
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20d7
// Size: 0x215
function function_c5c782caa574255f(var_c2d35eda877c6b2c) {
    var_5a2483b8cdfb9542 = level.var_747eee71c41ccadc;
    switch (var_5a2483b8cdfb9542) {
    case #"hash_ceb098150f024a39": 
        item = utility::spawn_model("jup_zm_relic_hunt_collar", var_c2d35eda877c6b2c, (0, 0, 30));
        level thread namespace_446fc987a980892f::playevent("quest_s1_collar", level.players);
        break;
    case #"hash_6fe0d38b135245cc": 
        item = utility::spawn_model("jup_zm_relic_hunt_script_bottle", var_c2d35eda877c6b2c);
        level thread namespace_446fc987a980892f::playevent("quest_s1_pill_bottle", level.players);
        break;
    case #"hash_f7a6ad55f66e4e1e": 
        item = utility::spawn_model("jup_zm_relic_hunt_surveillance_camera", var_c2d35eda877c6b2c);
        level thread namespace_446fc987a980892f::playevent("quest_s1_camera", level.players);
        break;
    case #"hash_47276d6c2f4cfd60": 
        item = utility::spawn_model("jup_zm_relic_hunt_diary", var_c2d35eda877c6b2c, (0, 0, 30));
        level thread namespace_446fc987a980892f::playevent("quest_s1_diary", level.players);
        break;
    }
    if (isdefined(item)) {
        item playloopsound("evt_ob_rr_obelisk_item_lp");
        playfxontag(getfx("item_glow_" + var_5a2483b8cdfb9542), item, "tag_prop_fx");
        var_8ecb5bcd6e64e487 = 0;
        while (var_8ecb5bcd6e64e487 < 160) {
            item.origin = var_c2d35eda877c6b2c + (0, 0, 10 + 1.5 * cos(var_8ecb5bcd6e64e487 * 10));
            item.angles += (0, 2, 0);
            var_8ecb5bcd6e64e487 += 1;
            waitframe();
        }
        if (var_5a2483b8cdfb9542 != "ice") {
            item playsound("evt_ob_rr_obelisk_item_takeoff");
            item moveto(var_c2d35eda877c6b2c + (0, 0, 1600), 4, 2);
            wait 4;
        }
        playsoundatpos(item.origin, "evt_ob_rr_obelisk_item_end");
        playfx(getfx("item_portal"), item.origin);
        item delete();
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f4
// Size: 0xc2
function function_6023fdec597394f3() {
    function_641bc1548cff8210("MISSION_OBJ_ESCAPE_RIFT", level.players);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["escape"]);
    namespace_b000de497fab9bf4::function_a13799ae222a8b48("exfil_loc", 1);
    thread function_a5b76e0f5024cc9a(getstruct("exfil_loc", "targetname"), "approaching_exfil", 1050);
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s1_mi_destroy_seals", 2);
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23be
// Size: 0x1cd
function spawn_deathworm() {
    var_988e467272839847 = getstruct("exfil_loc", "targetname").origin;
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle");
    death_worm = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_deathworm_quest_s1", var_988e467272839847, getstruct("exfil_loc", "targetname").angles, "team_two_hundred");
    death_worm callback::add("on_zombie_ai_killed", &function_7d81180cfc146b9a);
    objective_playermask_hidefromall(level.var_378ba68d7497e1d8["escape"]);
    function_641bc1548cff8210("MISSION_OBJ_DEATHWORM", level.players);
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s1_mi_escape_to_beach", 2);
    }
    namespace_b000de497fab9bf4::function_fc3d453bbcdb9a5a();
    wait 0.5;
    beachzombies = getaiarrayinradius(var_988e467272839847, 2000, "team_two_hundred");
    foreach (zombie in beachzombies) {
        if (isalive(zombie) && zombie != death_worm) {
            zombie kill(var_988e467272839847, death_worm, death_worm, "MOD_PROJECTILE_SPLASH");
        }
    }
    function_606642b946a01237("deathworm_blocker", var_988e467272839847, 4000, 1);
    thread function_78a1e90d0861679f(death_worm, var_988e467272839847);
    level thread namespace_446fc987a980892f::playevent("quest_s1_portal_spawn", level.players);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2593
// Size: 0x1c5
function function_78a1e90d0861679f(boss, var_f918a6b933be3035) {
    wait 10;
    while (isalive(boss)) {
        if (getaiarrayinradius(var_f918a6b933be3035, 2000).size < min(level.players.size, 3) * 5) {
            foreach (player in level.players) {
                if (isalive(boss)) {
                    if (randomint(100) < 33) {
                        ai_zombie = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base_armored_light", function_c62375923163b86c(boss.origin, 800), undefined, "team_two_hundred");
                    } else {
                        ai_zombie = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base", function_c62375923163b86c(boss.origin, 800), undefined, "team_two_hundred");
                    }
                    ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
                    wait randomfloat(1.5);
                }
            }
        }
        if (isalive(boss)) {
            wait 6 + 4 * boss.health / boss.maxhealth;
        }
    }
    beachzombies = getaiarrayinradius(var_f918a6b933be3035, 2000, "team_two_hundred");
    foreach (zombie in beachzombies) {
        if (isalive(zombie)) {
            zombie kill(var_f918a6b933be3035, boss, boss, "MOD_PROJECTILE_SPLASH");
        }
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2760
// Size: 0x135
function function_7d81180cfc146b9a(params) {
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle_complete");
    wait 12;
    thread function_f531ac7f1617663c(20);
    var_f064b76727edb83a = namespace_71ca15b739deab72::function_3ae7f99339b96499(getstruct("reward_rift", "targetname").origin);
    a_players = level.players[0] namespace_ca7b90256548aa40::getsquadmembers();
    var_3c99a2a84c4b850f = spawnstruct();
    reward_groups = [];
    foreach (player in a_players) {
        reward_groups[reward_groups.size] = [player];
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s1_mi_defeat_worm", 2);
    }
    namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, var_f064b76727edb83a, &function_b01b869968ed56bf, undefined, var_3c99a2a84c4b850f);
    var_e10194ca6271ac0a = var_3c99a2a84c4b850f waittill("managed_reward_cache_spawn_done");
    function_641bc1548cff8210("MISSION_OBJ_LOOT_RIFT", level.players);
    var_e10194ca6271ac0a waittill("managed_reward_cache_despawned");
    level notify("respawn_exit");
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x289d
// Size: 0x15
function function_f531ac7f1617663c(var_aeddcd74a8fad53c) {
    wait var_aeddcd74a8fad53c;
    level notify("respawn_exit");
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28ba
// Size: 0x47
function function_b01b869968ed56bf(var_f7f66a8bcca0ac73) {
    cache = spawnstruct();
    items = function_bc2f4857c90f5344("ob_jup_items_caches_s1_mission_end", 1);
    common_cache::function_fd95ef820bb2b980(items, cache);
    return cache.contents;
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x290a
// Size: 0x4b
function function_fc99ac2e6ca4ea02() {
    namespace_b000de497fab9bf4::function_e7995c28c01d9c();
    function_641bc1548cff8210("MISSION_OBJ_ESCAPE_RIFT", level.players);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["escape"]);
    level thread namespace_446fc987a980892f::playevent("quest_s1_exfil_ready", level.players);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x295d
// Size: 0x3d
function function_d67013e07c9dfbaa(params) {
    if (isplayer(self)) {
        namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s1_mi_leave_rift", 2);
        namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s1_rift_mission_complete", 2);
        function_b8b15f7f0820954e([self]);
    }
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29a2
// Size: 0xe0
function play_outro_movie(params) {
    var_7848ff3f98ef4a73 = 0;
    var_8c6c2faac72ea626 = 10;
    videoname = "jup_ob_s1_outro";
    videoduration = 130;
    var_1bab87417f147c8f = 0;
    self setplayermusicstate("");
    self setsoundsubmix("jup_ob_endgame");
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 0, 0);
    thread scripts\common\utility::letterbox_enable(1);
    self setclientomnvar("ui_br_bink_overlay_state", var_8c6c2faac72ea626);
    utility::hidehudenable();
    waitframe();
    level.battlechatterdisabled = 1;
    self playcinematicforplayer(videoname, 1, var_1bab87417f147c8f);
    wait videoduration;
    self stopcinematicforplayer();
    self setclientomnvar("ui_br_bink_overlay_state", var_7848ff3f98ef4a73);
    level.battlechatterdisabled = 0;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 1, 0);
    level thread namespace_134d54e39331ee45::function_bf01aba31e9023d1(0, [self]);
}

// Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8a
// Size: 0xdc
function function_a5b76e0f5024cc9a(s_spot, str_notify, n_radius) {
    if (!isdefined(n_radius)) {
        n_dist = squared(int(s_spot.radius * 0.7));
    } else {
        n_dist = squared(n_radius);
    }
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(s_spot.origin, player.origin) < n_dist) {
                    level notify(str_notify);
                    return;
                }
            }
        }
        wait 0.1;
    }
}

/#

    // Namespace namespace_1accee5a5436c3b4 / namespace_e0bfde17ecc90820
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b6e
    // Size: 0xad
    function function_3d5b3aa6ffe90a9e(param) {
        if (level.var_747eee71c41ccadc != "<dev string:x4b>") {
            level.var_d27f8b283029b2d9 = int(level.var_9763d266beaea837 - 1);
            foreach (player in level.players) {
                player setclientomnvar("<dev string:x4f>", int(level.var_d27f8b283029b2d9 / level.var_9763d266beaea837 * 100));
            }
        }
    }

#/
