#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_48814951e916af89;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\activity_manager.gsc;
#using script_79d4b1c751a51f03;
#using script_2c17aa19d1e937b2;
#using script_64acb6ce534155b7;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_15ca41a3fbb0e379;
#using script_1f97a44d1761c919;
#using scripts\mp\ai_behavior.gsc;
#using script_371b4c2ab5861e62;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_f545455fbfd50745;

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a4
// Size: 0x25
function function_80d68c9701e1aea5(data) {
    function_ad4172a44f169cb6();
    function_b713f2d39b34540f(data, &function_60616e75be26b24f, function_f14f2cd0267b6ab7());
}

/#

    // Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7d1
    // Size: 0x16
    function function_a07f7c4c0c4ef8e3() {
        return getstructarray("<dev string:x1c>", "<dev string:x28>");
    }

#/

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ef
// Size: 0xe2
function function_60616e75be26b24f(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_129f1ef2e5686f84;
    task.funcs["onTeamStart"] = &function_65fceeccc5c94e3d;
    task.funcs["onTeamAssigned"] = &function_59ae2a3abcf5622f;
    task.ref = "dmz_destroy_sam";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.samsite = node;
    if (!isdefined(level.var_264bfa04d0bef161)) {
        level.var_264bfa04d0bef161 = 0;
    }
    task.assignmentname = "samMission" + level.var_264bfa04d0bef161;
    level.var_264bfa04d0bef161++;
    return task;
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8da
// Size: 0x14e
function function_129f1ef2e5686f84() {
    self.teams = [];
    self.samsite.task = self;
    self.curorigin = self.samsite.origin;
    self.offset3d = (0, 0, 100);
    scripts\mp\gameobjects::requestid(1, 1, undefined, 1);
    scripts\mp\objidpoolmanager::update_objective_icon(self.objidnum, "ui_map_icon_obj_bomb_collect");
    scripts\mp\objidpoolmanager::update_objective_setbackground(self.objidnum, 4);
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<dev string:x33>", "<dev string:x45>", undefined, "<dev string:x49>", undefined, undefined, self.activity.poi, self.samsite.origin);
    #/
    objective_setbackground(self.objidnum, 1);
    objective_addalltomask(self.objidnum);
    objective_hidefromplayersinmask(self.objidnum);
    var_93383f767581b397 = randomintrange(level.var_d57c61fe001f1707.var_4bb2ff3e6e82c373, level.var_d57c61fe001f1707.var_ffb94540411249a9 + 1);
    thread function_49c1da07d69b6895(var_93383f767581b397);
    self.initialized = 1;
    self notify("task_initialized");
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa30
// Size: 0x35
function function_65fceeccc5c94e3d(teamname) {
    self endon("end_task");
    if (!isdefined(self.initialized) || !self.initialized) {
        self waittill("task_initialized");
    }
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d
// Size: 0x87
function function_59ae2a3abcf5622f(teamname) {
    self endon("end_task");
    if (!isdefined(self.initialized) || !self.initialized) {
        self waittill("task_initialized");
    }
    self.samsite thread function_d67c0c4b6154b087();
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_assigned", teamname, 5);
    thread function_c373f127dafc389a(teamname);
    waitframe();
    function_1759acfd39bb5edf("dmz_destroy_sam_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafc
// Size: 0xaf
function function_930bc6dc39f516db(teamname) {
    self notify("end_task");
    players = utility::function_2d7fd59d039fa69b(self.samsite.origin, level.var_d57c61fe001f1707.var_176bb2898f619e87, 1);
    foreach (player in players) {
        scripts\mp\objidpoolmanager::function_7299a742781a5030(0, player);
    }
    function_d062142f367ed7b2();
    wait 2.5;
    task_ended(teamname);
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbb3
// Size: 0x2ab
function private function_49c1da07d69b6895(numagents) {
    self.numagents = 0;
    self.agents = [];
    for (i = 0; i < numagents; i++) {
        aitype = function_d5bc07eabf352abb(undefined, undefined, "overwatch");
        var_fb30e2e6aca1d19 = randomfloatrange(144, 360);
        forward = anglestoforward(self.samsite.angles) * var_fb30e2e6aca1d19;
        right = vectorcross((0, 0, 1), forward);
        facingangle = axistoangles(forward, right, (0, 0, 1));
        var_88b83b0d7a43ea72 = i / numagents * 360 + randomfloatrange(-30, 30) % 360;
        offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
        origin = self.samsite.origin + offset;
        if (issubstr(aitype, "sniper") && isdefined(self.samsite.snipernodes) && self.samsite.snipernodes.size > 0) {
            node = random(self.samsite.snipernodes);
            self.samsite.snipernodes = array_remove(self.samsite.snipernodes, node);
            origin = node.origin;
            facingangle = node.angles;
        }
        agent = ai_mp_requestspawnagent(aitype, origin, facingangle, "medium", "mission", "samInitialGuards", undefined, undefined, undefined, self.poi);
        if (isdefined(agent)) {
            self.agents[i] = agent;
            agent thread scripts\mp\ai_behavior::function_b11c1964f528574b(agent);
        }
    }
    if (isdefined(self.agents)) {
        foreach (agent in self.agents) {
            thread namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "assignment", self.assignmentname);
        }
    }
    self.numagents = self.agents.size;
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0x542
function private function_33b12655deb4b72a(time) {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_defused");
    self.plantedbomb thread playtickingsound();
    starttime = gettime();
    self.timeremaining = level.var_d57c61fe001f1707.explodetime;
    while (true) {
        currenttime = gettime();
        duration = (currenttime - starttime) / 1000;
        var_de2c2a1fd468b5f = 1 - duration / level.var_d57c61fe001f1707.explodetime;
        progress = clamp(var_de2c2a1fd468b5f, 0, 1);
        objective_setprogress(self.task.objidnum, progress);
        self.timeremaining = level.var_d57c61fe001f1707.explodetime - duration;
        if (var_de2c2a1fd468b5f <= 0) {
            self notify("bomb_exploded");
            break;
        }
        waitframe();
    }
    foreach (team in self.task.teams) {
        objective_hideprogressforteam(self.task.objidnum, team);
    }
    if (isdefined(self.plantedbomb)) {
        rot = randomfloat(360);
        effect = "samsite_bomb_explosion";
        explosionpos = self.plantedbomb.origin + (0, 0, 50);
        explosioneffect = spawnfx(level._effect[effect], explosionpos, (0, 0, 1), (cos(rot), sin(rot), 0));
        triggerfx(explosioneffect);
        physicsexplosionsphere(explosionpos, 200, 100, 3);
        playrumbleonposition("grenade_rumble", self.plantedbomb.origin);
        earthquake(0.75, 2, self.plantedbomb.origin, 2000);
        playsoundatpos(explosionpos, "exp_bombsite_lr");
        self.plantedbomb.useent delete();
        self.plantedbomb delete();
    }
    self radiusdamage(self.origin + (0, 0, 50), 2750, 500, 10, self, "MOD_EXPLOSIVE", "bomb_site_mp");
    wait 0.1;
    self.health = 0;
    self setscriptablepartstate("base", "destroyed");
    thread play_loopsound_in_space("dst_sam_site_fire_lp", self.origin);
    foreach (missile in [self.missile1, self.missile2, self.missile3]) {
        if (isdefined(missile) && !istrue(missile.launched)) {
            if (isdefined(level._effect["c4_explosion_convoy"])) {
                playfx(level._effect["c4_explosion_convoy"], missile.origin);
            }
            missile delete();
            waitframe();
        }
    }
    if (isdefined(self.soundent)) {
        self.soundent delete();
    }
    if (isdefined(self.useent)) {
        self.useent delete();
    }
    team = self.plantplayer.team;
    if (isdefined(team)) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_exploded", team, 1.5);
        self.task function_1759acfd39bb5edf("dmz_destroy_sam_exploded", team);
        function_c1fd3441ccfba6f8(team, "dmz_activity_win", 1.5);
    }
    self.task function_cd4f277cf0d6a560(team, level.var_d57c61fe001f1707.explodereward);
    self.task thread function_930bc6dc39f516db(team);
    waitframe();
    self.task.destroyedsamsite = spawn("script_model", self.origin);
    self.task.destroyedsamsite.angles = self.angles;
    self.task.destroyedsamsite setmodel("military_samsite_01_damaged_rig_skeleton_mp");
    self.task.destroyedsamsite setscriptablepartstate("base", "destroyed");
    self notify("samsite_dead", self.plantplayer);
    wait 10;
    self delete();
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13b0
// Size: 0x56f
function private function_d67c0c4b6154b087() {
    self.useent = spawn("script_model", self.origin + rotatevector((0, 0, 20), self.angles));
    self.useent setmodel("tag_origin");
    self.useent sethintstring(%MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_SAMSITE_PLANT_HINT);
    self.useent sethinticon("hud_icon_c4_plant");
    self.useent sethintdisplayrange(512);
    self.useent setuserange(level.var_d57c61fe001f1707.plantrange);
    self.useent setcursorhint("HINT_BUTTON");
    self.useent sethintdisplayfov(65);
    self.useent sethintonobstruction("show");
    self.useent sethintrequiresholding(1);
    self.useent setuseholdduration("duration_short");
    while (true) {
        if (function_6fa1ef232e896897()) {
            break;
        }
    }
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_planted", self.plantplayer.team);
    function_c1fd3441ccfba6f8(self.plantplayer.team, "dmz_activity_action", 0, "dmz_activity_action_classic");
    self setscriptablepartstate("base", "attacked");
    self.icon setscriptablepartstate("icon", "attacked");
    objective_setpinned(self.task.objidnum, 1);
    objective_position(self.task.objidnum, self.plantedbomb.origin + (0, 0, 50));
    objective_removeallfrommask(self.task.objidnum);
    objective_showtoplayersinmask(self.task.objidnum);
    self.plantedbomb.useent = spawn("script_model", self.plantedbomb.origin + rotatevector((0, 0, 20), self.plantedbomb.angles));
    self.plantedbomb.useent setmodel("tag_origin");
    self.plantedbomb.useent sethintstring(%MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_SAMSITE_DEFUSE_HINT);
    self.plantedbomb.useent sethinticon("hud_icon_c4_plant");
    self.plantedbomb.useent sethintdisplayrange(512);
    self.plantedbomb.useent setuserange(120);
    self.plantedbomb.useent setcursorhint("HINT_BUTTON");
    self.plantedbomb.useent sethintdisplayfov(65);
    self.plantedbomb.useent sethintonobstruction("show");
    self.plantedbomb.useent sethintrequiresholding(1);
    self.plantedbomb.useent setuseholdduration("duration_short");
    playersonteam = getteamdata(self.plantplayer.team, "players");
    foreach (player in playersonteam) {
        self.plantedbomb.useent disableplayeruse(player);
    }
    thread function_33b12655deb4b72a(level.var_d57c61fe001f1707.explodetime);
    thread function_1839a40e099bb63f();
    thread function_f2b5581eaab77646();
    var_7408ed52662703d3 = level.poi[self.poi]["players"];
    var_7408ed52662703d3 = array_remove_array(var_7408ed52662703d3, getteamdata(self.task.teams[0], "players"));
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_destroy_sam_invited", var_7408ed52662703d3);
    thread namespace_446fc987a980892f::playevent("destroy_sam_invite", var_7408ed52662703d3, 2);
    foreach (var_bcc7fec8b738d541 in self.task.agents) {
        thread scripts\mp\ai_behavior::function_a5117518725da028(var_bcc7fec8b738d541, self.plantedbomb.origin);
    }
    self.var_7b45aaac74192c14 = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.plantedbomb.origin, level.var_d57c61fe001f1707.reinforcementrange);
    if (self.var_7b45aaac74192c14.size < 5) {
        thread callreinforcements();
    }
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1927
// Size: 0x16d
function private function_1839a40e099bb63f() {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_exploded");
    while (true) {
        if (function_29cbbcbd8b278cf8()) {
            break;
        }
    }
    self notify("bomb_defused");
    self.plantedbomb.useent delete();
    self.plantedbomb delete();
    self setscriptablepartstate("base", "healthy");
    self.icon setscriptablepartstate("icon", "healthy");
    defuseteam = self.defuseplayer.team;
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_invite_win", defuseteam, 1.5);
    function_1759acfd39bb5edf("dmz_destroy_sam_defused_win", defuseteam);
    function_c1fd3441ccfba6f8(defuseteam, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    planterteam = self.plantplayer.team;
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_defused", planterteam, 1.5);
    function_1759acfd39bb5edf("dmz_destroy_sam_defused_lose", planterteam);
    function_c1fd3441ccfba6f8(planterteam, "dmz_activity_lose", 1, "dmz_activity_lose_classic");
    self.task function_cd4f277cf0d6a560(defuseteam, level.var_d57c61fe001f1707.defusereward);
    self.task thread function_930bc6dc39f516db(undefined);
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a9c
// Size: 0x2ad
function private function_6fa1ef232e896897() {
    self.useent makeusable();
    self.useent disableplayeruseforallplayers();
    playersonteam = getteamdata(self.task.teams[0], "players");
    foreach (player in playersonteam) {
        self.useent enableplayeruse(player);
    }
    player = self.useent waittill("trigger");
    self.useent makeunusable();
    if (isdefined(self.planting) && istrue(self.planting)) {
        return false;
    }
    self.planting = 1;
    bomb = function_cadc5181c3b67e3f(player);
    thread watchcancel(player);
    buttontime = 0;
    while (buttontime < level.var_d57c61fe001f1707.planttime) {
        if (self.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
            self.planting = 0;
            function_db896f4486ca187(player, bomb);
            return false;
        }
        buttontime += level.framedurationseconds;
        waitframe();
    }
    function_db896f4486ca187(player, bomb);
    bombent = spawn("script_model", player.origin);
    bombent setmodel("offhand_2h_wm_briefcase_bomb_v0");
    bombent.visuals = [];
    bombent.visuals[0] = spawn("script_model", player.origin);
    bombent.visuals[0] setmodel("tag_origin");
    bombent.curorigin = bombent.origin;
    bombent.offset3d = (0, 0, 15);
    bombent.safeorigin = bombent.origin;
    bombent.trigger = spawnstruct();
    bombent.objidnum = -1;
    bombent scripts\mp\gameobjects::setdropped(undefined, undefined);
    self.plantedbomb = bombent;
    self.task.bombplanted = 1;
    self.plantplayer = player;
    self.task notify("bomb_planted");
    return true;
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d52
// Size: 0x280
function private function_29cbbcbd8b278cf8(player) {
    self.plantedbomb.useent makeusable();
    self.plantedbomb.useent enableplayeruseforallplayers();
    playersonteam = getteamdata(self.task.teams[0], "players");
    foreach (player in playersonteam) {
        self.plantedbomb.useent disableplayeruse(player);
    }
    player = self.plantedbomb.useent waittill("trigger");
    self.plantedbomb.useent makeunusable();
    if (isdefined(self.defusing) && istrue(self.defusing)) {
        return false;
    }
    if (isdefined(self.timeremaining) && self.timeremaining < level.var_d57c61fe001f1707.defusetime) {
        return false;
    }
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_defusing", self.plantplayer.team);
    self.defusing = 1;
    self.plantedbomb hide();
    bomb = function_cadc5181c3b67e3f(player);
    thread watchcancel(player);
    buttontime = 0;
    while (buttontime < level.var_d57c61fe001f1707.defusetime) {
        if (self.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1 || self.timeremaining < level.var_d57c61fe001f1707.defusetime - buttontime) {
            self.defusing = 0;
            function_db896f4486ca187(player, bomb);
            self.plantedbomb show();
            return false;
        }
        buttontime += level.framedurationseconds;
        waitframe();
    }
    function_db896f4486ca187(player, bomb);
    self.defuseplayer = player;
    self.task.bombdefused = 1;
    self.task notify("bomb_defused");
    return true;
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fdb
// Size: 0x1d2
function private function_f2b5581eaab77646() {
    self.task endon("bomb_defused");
    self endon("bomb_exploded");
    objective_setplayintro(self.task.objidnum, 0);
    objective_removeallfrommask(self.task.objidnum);
    objective_showtoplayersinmask(self.task.objidnum);
    waitframe();
    objective_setplayintro(self.task.objidnum, 1);
    var_f225c15dca10fd0d = 0;
    while (true) {
        var_7408ed52662703d3 = utility::function_2d7fd59d039fa69b(self.origin, level.var_d57c61fe001f1707.var_176bb2898f619e87, 1);
        objective_removeallfrommask(self.task.objidnum);
        foreach (player in var_7408ed52662703d3) {
            objective_addclienttomask(self.task.objidnum, player);
            objective_showprogressforclient(self.task.objidnum, player);
            function_8b71eb96e1636edc("MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_PROGRESS_TEXT", player);
            function_d1b64c3d055ceeb0(2, player);
            if (!var_f225c15dca10fd0d) {
                if (player.team != self.plantplayer.team) {
                    namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_hostiles", self.plantplayer.team);
                    var_f225c15dca10fd0d = 1;
                }
            }
        }
        objective_showtoplayersinmask(self.task.objidnum);
        wait 1;
    }
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21b5
// Size: 0x68
function private watchcancel(player) {
    self.task endon("bomb_planted");
    self.task endon("bomb_defused");
    player notifyonplayercommand("cancel", "+weapnext");
    self.cancel = 0;
    player waittill("cancel");
    self.cancel = 1;
    player notifyonplayercommandremove("cancel", "+weapnext");
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2225
// Size: 0x54
function private function_cadc5181c3b67e3f(player) {
    player function_bf9ec93bee75f88c(0);
    bomb = makeweapon("briefcase_bomb_mp");
    player scripts\cp_mp\utility\inventory_utility::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread scripts\mp\gameobjects::switchtouseweapon(bomb, 1);
    return bomb;
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2282
// Size: 0x6a
function private function_db896f4486ca187(player, bomb) {
    lastweaponobj = player scripts\mp\utility\inventory::getlastweapon();
    if (player scripts\mp\utility\killstreak::isjuggernaut()) {
        lastweaponobj = scripts\mp\juggernaut::jugg_getminigunweapon();
    } else if (!player hasweapon(lastweaponobj)) {
        lastweaponobj = player scripts\mp\utility\inventory::getfirstprimaryweapon();
    }
    player scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch(lastweaponobj, 0, 0);
    player takeweapon(bomb);
    player function_bf9ec93bee75f88c(1);
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22f4
// Size: 0x6d
function private callreinforcements() {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_exploded");
    agents = undefined;
    while (!isdefined(agents)) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, self.origin, "medium", "mission", "samReinforcements", undefined, undefined, 1, self.poi);
        if (!isdefined(agents)) {
            wait 1;
        }
    }
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2369
// Size: 0x104
function private function_bf9ec93bee75f88c(isallowed) {
    val::set("sam_holding_bomb", "allow_movement", isallowed);
    val::set("sam_holding_bomb", "sprint", isallowed);
    val::set("sam_holding_bomb", "fire", isallowed);
    val::set("sam_holding_bomb", "reload", isallowed);
    val::set("sam_holding_bomb", "weapon_pickup", isallowed);
    val::set("sam_holding_bomb", "weapon_switch", isallowed);
    val::set("sam_holding_bomb", "allow_jump", isallowed);
    val::set("sam_holding_bomb", "gesture", isallowed);
    self function_35501b42058d4de9();
    if (isallowed) {
        waittill_any_timeout_1(0.8, "bomb_allow_offhands");
    }
    val::set("sam_holding_bomb", "melee", isallowed);
    val::set("sam_holding_bomb", "mantle", isallowed);
    val::set("sam_holding_bomb", "offhand_weapons", isallowed);
    if (isallowed) {
        val::reset_all("sam_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2475
// Size: 0xe6
function playtickingsound() {
    self endon("death");
    self endon("stop_ticking");
    level endon("game_ended");
    time = level.var_d57c61fe001f1707.explodetime;
    var_8aa881db64e772e5 = 45;
    var_a46637c818d15dbf = 10;
    var_f139dbcfce7a127d = 2;
    while (true) {
        if (time > var_8aa881db64e772e5) {
            play_sound_on_entity("mp_iw9_dmz_sam_bomb_timer");
            time -= 1;
            wait 1;
        } else if (time > var_a46637c818d15dbf) {
            play_sound_on_entity("mp_iw9_dmz_sam_bomb_timer_urgent");
            time -= 1;
            wait 1;
        } else if (time > var_f139dbcfce7a127d) {
            play_sound_on_entity("mp_iw9_dmz_sam_bomb_timer_finish_beep");
            time -= 0.5;
            wait 0.5;
        } else {
            play_sound_on_entity("mp_iw9_dmz_sam_bomb_timer_last_second");
            time -= 0.25;
            wait 0.25;
        }
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

// Namespace namespace_f545455fbfd50745 / namespace_30baceecda213256
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2563
// Size: 0x18d
function private function_c373f127dafc389a(team) {
    self endon("end_task");
    var_27483a41d2410cc8 = 9000000;
    var_b485e3529246a8de = 90000;
    var_44937005a0f57f50 = 0;
    while (true) {
        players = getteamdata(team, "players");
        mindistsq = 10000000000;
        minorigin = (0, 0, 0);
        foreach (player in players) {
            if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            distsq = distance2dsquared(self.samsite.origin, player.origin);
            if (mindistsq > distsq) {
                mindistsq = distsq;
                minorigin = player.origin;
            }
        }
        if (!var_44937005a0f57f50 && mindistsq < var_27483a41d2410cc8) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_near", team);
            function_c1fd3441ccfba6f8(team, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
            var_44937005a0f57f50 = 1;
        }
        if (mindistsq < var_b485e3529246a8de) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("destroy_sam_approach", team);
            function_c1fd3441ccfba6f8(team, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
            return;
        }
        wait 1;
    }
}

