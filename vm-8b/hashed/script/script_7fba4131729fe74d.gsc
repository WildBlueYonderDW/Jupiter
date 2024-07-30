#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\activity_manager.gsc;
#using scripts\engine\scriptable.gsc;
#using script_4948cdf739393d2d;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\objidpoolmanager.gsc;
#using script_1f97a44d1761c919;
#using script_15ca41a3fbb0e379;
#using script_48814951e916af89;
#using script_2669878cf5a1b6bc;
#using script_371b4c2ab5861e62;
#using scripts\mp\ai_behavior.gsc;

#namespace namespace_98928b726f88096a;

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ea
// Size: 0x1cc
function function_80d68c9701e1aea5(data) {
    level.trapprops = spawnstruct();
    level.trapprops.capturetime = getdvarint(@"hash_3c0f9fa2bc4d4d67", 120);
    level.trapprops.captureradius = getdvarint(@"hash_57953e874d9dd19c", 800);
    level.trapprops.captureheight = getdvarint(@"hash_1ec4d1950e884a45", 800);
    level.trapprops.usenodes = getdvarint(@"hash_f4b9219b332581a2", 1);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("dmz_secret_stash", &function_2d03c352afd1f1bf);
    script_model_anims();
    while (!isdefined(level.var_f1073fbd45b59a06) || !istrue(level.var_f1073fbd45b59a06.gatheredvolumes)) {
        waitframe();
    }
    var_879badb8c80b0204 = [];
    possiblenodes = getstructarray("dmz_secret_stash", "script_noteworthy");
    if (!istrue(level.trapprops.usenodes)) {
        possiblenodes = getunusedlootcachepoints();
    }
    foreach (node in possiblenodes) {
        fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(node.origin);
        if (isdefined(fortress) && !namespace_9823ee6035594d67::function_4ec4f39a2e1745f2(fortress)) {
            node.fortress = fortress;
            var_879badb8c80b0204[var_879badb8c80b0204.size] = node;
        }
    }
    /#
        thread function_d781a77d91710067();
    #/
    function_b713f2d39b34540f(data, &function_3f49db86fc08365d, var_879badb8c80b0204);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9be
// Size: 0x6d
function script_model_anims() {
    level.scr_animtree["gun_safe_drill_player"] = %script_model;
    level.scr_anim["gun_safe_drill_player"]["gun_safe_enter"] = script_model%iw9_dmz_stashdrill_enter_stand_sdr;
    level.scr_eventanim["gun_safe_drill_player"]["gun_safe_enter"] = %"gun_safe_enter";
    level.scr_viewmodelanim["gun_safe_drill_player"]["gun_safe_enter"] = "iw9_dmz_stashdrill_enter_stand_sdr";
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa33
// Size: 0x116
function function_9b5fc1d0b7049fd3(isallowed) {
    if (!isallowed) {
        val::set("drilling", "allow_jump", 0);
        val::set("drilling", "gesture", 0);
        val::set("drilling", "melee", 0);
        val::set("drilling", "mantle", 0);
        val::set("drilling", "offhand_weapons", 0);
        val::set("drilling", "allow_movement", 0);
        val::set("drilling", "sprint", 0);
        val::set("drilling", "fire", 0);
        val::set("drilling", "reload", 0);
        val::set("drilling", "weapon_pickup", 0);
        val::set("drilling", "weapon_switch", 0);
        val::set("drilling", "offhand_weapons", 0);
        val::set("drilling", "supers", 0);
        self function_35501b42058d4de9();
        return;
    }
    val::reset_all("drilling");
    self function_bb04491d50d9e43e();
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb51
// Size: 0x2fc
function function_d5612c9774f4ed30(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    player function_9b5fc1d0b7049fd3(0);
    playerviewangles = player getplayerangles();
    player.linktoent = player spawn_tag_origin(player.origin, player.playerviewangles);
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1);
    goalpos = self.origin + rotatevector((0, 41.127, 0), self.angles + (0, -90, 0));
    forward = (0, 0, 0) - anglestoforward(self.angles);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up) + (0, 0, 0);
    movetotime = 0.5;
    player.linktoent moveto(goalpos, movetotime, 0.1, 0.1);
    player.linktoent rotateto(goalangles, movetotime, 0.1, 0.1);
    player setstance("stand");
    var_cd9982adb17761a8 = gettime();
    player scripts\cp_mp\utility\inventory_utility::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = movetotime - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000;
    waittime = max(0, var_218f64cb035d54be);
    wait waittime;
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    player thread scripts\mp\utility\infilexfil::infil_player_rig_updated("gun_safe_drill_player", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    animstruct = spawnstruct();
    animstruct.origin = self.origin;
    animstruct.angles = self.angles + (0, 90, 0);
    self setscriptablepartstate("dmz_secret_stash", "drill_enter");
    animstruct scripts\mp\anim::anim_player_solo(player, player.player_rig, "gun_safe_enter");
    if (isdefined(player) && isreallyalive(player)) {
        player notify("interact_finished");
    }
    waitframe();
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(player)) {
        player notify("remove_rig");
        if (isreallyalive(player)) {
            player function_9b5fc1d0b7049fd3(1);
        }
    }
    self.successfuluse = 1;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe55
// Size: 0x7c
function function_783f84b2aaf11d69(player) {
    player endon("interact_finished");
    player scripts\engine\utility::waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
    player notify("interact_interrupt");
    player stopanimscriptsceneevent();
    if (isdefined(player.linktoent)) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    player notify("remove_rig");
    player function_9b5fc1d0b7049fd3(1);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xed9
// Size: 0x1bf
function private function_2d03c352afd1f1bf(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player.team)) {
        return;
    }
    if (part == "dmz_secret_stash" && state == "usable") {
        instance setscriptablepartstate("dmz_secret_stash", "unusable");
        instance.successfuluse = 0;
        instance thread function_783f84b2aaf11d69(player);
        instance function_d5612c9774f4ed30(player);
        if (istrue(instance.successfuluse)) {
            instance.task thread function_f339128058791c31(player.team);
        } else {
            instance setscriptablepartstate("dmz_secret_stash", "usable");
        }
        return;
    }
    if (part == "dmz_secret_stash" && (state == "closed_usable" || state == "partially_open_usable")) {
        if (!isdefined(instance.contents)) {
            items = scripts\mp\gametypes\br_lootcache::function_a76b46f057488cc0(instance, player.team, 22, getdvarint(@"hash_3aa9346edffdb1bd", 2));
            instance.containertype = 5;
            instance.contents = scripts\mp\gametypes\br_lootcache::function_ec87b214cd429e96(items, undefined);
            var_8bd50c7e994c7434 = int(instance.task.cashreward);
            instance.contents = scripts\mp\gametypes\br_lootcache::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 750);
            scripts\mp\gametypes\br_lootcache::lootcacheused(instance, part, state, player, var_a5b2c541413aa895, usestring, 1);
            return;
        }
        scripts\mp\gametypes\br_lootcache::lootcacheused(instance, part, state, player, var_a5b2c541413aa895, usestring, 1);
    }
}

/#

    // Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10a0
    // Size: 0x16
    function function_a07f7c4c0c4ef8e3() {
        return getstructarray("<dev string:x1c>", "<dev string:x30>");
    }

#/

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10be
// Size: 0x103
function function_3f49db86fc08365d(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_1ca0090ac5fec38e;
    task.funcs["onPlayerJoined"] = &function_b91953894e06c4fc;
    task.funcs["onPlayerRemoved"] = &function_f04510c7f0f2bddf;
    task.funcs["onTeamAssigned"] = &function_3ad407f03f87fbc5;
    task.funcs["onTeamStart"] = &function_d757790e96368877;
    task.funcs["onCancel"] = &function_b69813e0ef9569be;
    task.ref = "dmz_fortress_search";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    task.fortress = node.fortress;
    return task;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ca
// Size: 0x168
function function_1ca0090ac5fec38e() {
    self.activity.origin = self.node.origin;
    self.capturetime = level.trapprops.capturetime;
    function_e7f010f72a055377();
    self.entrances = function_8b3d13f0d1a8607d(self.fortress);
    self.activitykey = "trap" + gettime();
    foreach (door in self.entrances) {
        door.activitykey = self.activitykey;
        door.activitytype = "trap";
    }
    self.var_69b705b3551a18c0 = 0;
    self.curorigin = self.cache.origin;
    self.offset3d = (0, 0, 85);
    function_c847bfd52c064289(self.curorigin + self.offset3d, "trap");
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.icon, 1);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.icon, 0);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133a
// Size: 0x30
function function_b91953894e06c4fc(player) {
    self.cache enablescriptableplayeruse(player);
    player.activitykey = self.activitykey;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1372
// Size: 0x33
function function_f04510c7f0f2bddf(player) {
    if (!istrue(self.traptriggered)) {
        self.cache disablescriptableplayeruse(player);
    }
    player.activitykey = undefined;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ad
// Size: 0x12e
function function_3ad407f03f87fbc5(teamname) {
    if (self.cache getscriptablepartstate("dmz_secret_stash") == "unusable") {
        self.cache setscriptablepartstate("dmz_secret_stash", "usable");
    }
    function_1759acfd39bb5edf("dmz_trap_assigned", teamname);
    foreach (player in level.players) {
        self.cache disablescriptableplayeruse(player);
    }
    var_e99a003997b05a0c = getteamdata(teamname, "players");
    foreach (player in var_e99a003997b05a0c) {
        self.cache enablescriptableplayeruse(player);
    }
    function_dffcbce998c9ee50(teamname);
    function_16d030ed02ec724d(teamname);
    self.cashreward = function_9c6ab63c4b6bd08b(teamname);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14e3
// Size: 0x35
function private function_16d030ed02ec724d(teamname) {
    function_c1fd3441ccfba6f8(teamname, "dmz_trap_start", 1.5, "dmz_trap_start_classic");
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("trap_assigned", teamname, 2.5);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1520
// Size: 0x2f
function function_d757790e96368877(teamname) {
    function_c1fd3441ccfba6f8(teamname, "dmz_trap_approach", 0, "dmz_trap_approach_classic");
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("trap_near", teamname);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1557
// Size: 0x9a
function function_b69813e0ef9569be(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        if (!istrue(self.traptriggered)) {
            self.cache disablescriptableplayeruse(player);
        }
    }
    function_c1fd3441ccfba6f8(teamname, undefined, undefined);
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f9
// Size: 0x4c
function function_8250fd658e3aae32() {
    self.complete = 1;
    if (!istrue(self.traptriggered)) {
        self.cache.trigger delete();
        function_629ed367d1393020();
    }
    function_45bd3184ff146b46(self.teams[0]);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164d
// Size: 0xeb
function function_91b74d9dfa893111(teamname) {
    if (isdefined(self.cache.trigger)) {
        self.cache.trigger delete();
    }
    function_629ed367d1393020();
    if (!istrue(self.complete)) {
        function_8250fd658e3aae32();
        foreach (team in self.teams) {
            function_a1738a95d7aa8094("dmz_survive_unlocked", "trap", self.activity.cashreward, team);
            function_c1fd3441ccfba6f8(team, "", 1.5);
        }
        task_ended(self.teams[0]);
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1740
// Size: 0x158
function private function_e7f010f72a055377() {
    origin = self.node.origin;
    angles = self.node.angles;
    if (!istrue(level.trapprops.usenodes)) {
        angles += (0, 90, 0);
    }
    cache = spawnscriptable("dmz_secret_stash", origin, angles);
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<dev string:x45>", self.activity.name, undefined, "<dev string:x1c>", undefined, undefined, self.activity.poi, origin);
    #/
    cache.task = self;
    self.cache = cache;
    trigger = spawn("trigger_radius", self.cache.origin, 0, level.trapprops.captureradius, level.trapprops.captureheight);
    trigger trigger_off();
    self.cache.trigger = trigger;
    thread function_bb2ca071f1918797(trigger, level.trapprops.captureradius);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x18a0
// Size: 0x3a5
function private function_f339128058791c31(teamname) {
    self.var_69b705b3551a18c0 = getteamdata(teamname, "players").size;
    self.cache.trigger trigger_on();
    if (!istrue(self.cache.var_9aef22e3cd04e1dd)) {
        function_5314298e777e5688("dmz_trap");
        self.fortress.var_6451879e18908224 setscriptablepartstate("fortress_tacmap_location_scriptable", "attacked", 0);
        objective_setshowprogress(self.icon, 1);
        thread function_24f28c302a07b6a1(self.entrances);
        thread function_e6c617663e95d7e7(self.entrances);
        groupname = "no_group";
        var_13666cfbc0b4d87b = getdvarint(@"hash_dc6efd2d90a799e4", 6);
        var_cfdda0a45322f3b1 = getdvarint(@"hash_d9950352be0cdcd0", 8);
        var_399dd745f3429984 = getdvarint(@"hash_eafc74f33b34f9e7", 6);
        var_ba7dd45bd1a38818 = getdvarint(@"hash_fc93bfbca571ee92", 1);
        var_1b61ed3f5bba31fc = getdvarint(@"hash_a9568da46c605fce", 1);
        var_aedacc7bf9f69197 = getdvarint(@"hash_5c3cc2a96e90e73f", 1);
        thread function_6727841e301aff6e(self.cache.origin, var_13666cfbc0b4d87b, groupname, var_ba7dd45bd1a38818);
        thread function_126dc0519b8a8ef6(self.cache.origin, var_cfdda0a45322f3b1, groupname, var_1b61ed3f5bba31fc);
        thread function_3af43b43f5a74cd9(self.cache.origin, var_399dd745f3429984, groupname, var_aedacc7bf9f69197);
    }
    foreach (player in level.players) {
        if (isdefined(player)) {
            self.cache enablescriptableplayeruse(player);
        }
    }
    self.traptriggered = 1;
    thread function_f61cf2955d03326b(self.cache.origin, teamname);
    namespace_f2c68794a1018c9d::function_c9f97baa0d7f59bf("dmz_global_trap_start", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_trap_drill", 1.5, "dmz_trap_drill_classic");
    self.agents = [];
    self.shownplayers = [];
    self.progress = 0;
    while (true) {
        if (isdefined(self.cache.trigger) && !istrue(self.cache.trigger.trigger_off)) {
            if (self.nearbyplayers.size > 0) {
                progressbefore = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            }
            progress = self.progress / self.capturetime;
            if (self.progress >= self.capturetime) {
                function_dc537616aa6cd0b0();
                return;
            } else if (!istrue(self.cache.var_9aef22e3cd04e1dd)) {
                self.shownplayers = function_f69e0b0e05fd9b85(self.nearbyplayers, self.shownplayers);
                scripts\mp\objidpoolmanager::objective_set_progress(self.icon, progress);
            }
        }
        waitframe();
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4d
// Size: 0x12e
function function_dc537616aa6cd0b0() {
    self notify("cache_unlocked");
    self.cache setscriptablepartstate("dmz_secret_stash", "opening");
    if (!istrue(self.cache.var_9aef22e3cd04e1dd)) {
        foreach (player in self.shownplayers) {
            if (isdefined(player)) {
                scripts\mp\objidpoolmanager::function_26259bd38697b5ad(self.icon, player);
            }
        }
        scripts\mp\objidpoolmanager::objective_playermask_hidefromall(self.icon);
        objective_setshowprogress(self.icon, 0);
        var_ac4c51bf033f6323 = array_combine_unique(getteamdata(self.teams[0], "players"), self.nearbyplayers);
        namespace_446fc987a980892f::playevent("trap_unlocked", var_ac4c51bf033f6323);
        self.fortress.var_6451879e18908224 setscriptablepartstate("fortress_tacmap_location_scriptable", "visible", 0);
        function_91b74d9dfa893111(self.teams[0]);
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d83
// Size: 0x15f
function function_f69e0b0e05fd9b85(nearbyplayers, shownplayers) {
    allplayers = array_combine(nearbyplayers, shownplayers);
    var_f6fd7b0e73c3270c = shownplayers;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(shownplayers, player) && array_contains(nearbyplayers, player)) {
            if (scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(self.icon, player, 2, 2, %MP_DMZ_MISSIONS/STASH_DRILL_PROGRESS_TITLE)) {
                scripts\mp\objidpoolmanager::objective_pin_player(self.icon, player);
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.icon, player);
                var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
            }
            continue;
        }
        if (array_contains(shownplayers, player) && !array_contains(nearbyplayers, player)) {
            if (self.teams[0] != player.team || istrue(self.complete)) {
                scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.icon, player);
            }
            scripts\mp\objidpoolmanager::objective_unpin_player(self.icon, player);
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad(self.icon, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1eeb
// Size: 0x39
function private function_f61cf2955d03326b(location, teamname) {
    wait randomintrange(2, 4);
    playsoundatpos(location, "mp_dmz_alrm_trap");
    wait 3;
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("trap_start_unlock", teamname);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f2c
// Size: 0x76
function private function_24f28c302a07b6a1(nodes) {
    wait 45;
    for (i = 0; i < 2; i++) {
        foreach (node in nodes) {
            thread function_401f6c148c1fd7a8(node);
        }
        wait 30;
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1faa
// Size: 0x5b
function function_401f6c148c1fd7a8(node) {
    wait randomfloatrange(0, 2);
    magicgrenademanual("smoke_grenade_mp", node.outerorigin, (0, 0, -10), 0.5);
    thread play_sound_in_space("smoke_grenade_expl_trans", node.outerorigin);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x200d
// Size: 0x56
function private function_e6c617663e95d7e7(doors) {
    foreach (door in doors) {
        door function_80902296b05be00a();
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x206b
// Size: 0xcc
function private function_6727841e301aff6e(location, numagents, groupname, spawnboss) {
    level endon("game_ended");
    agents = [];
    agentpackage = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, level.spawnset["guard"], 1);
    agentpackage.reinforcementtype = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, location, "high", "mission", "trapWave1", groupname, undefined, 1, self.node.poi, undefined, undefined, undefined, agentpackage);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait 1;
    }
    self.var_7afe9cf22b565562 = agents;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x213f
// Size: 0x75
function dmzTask_setupSecondWaveAgent(agent) {
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", ["laserbox_hip04", "none", "none", "none", "silencer01_ar", "none"], "none", "none");
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon, "smoke_grenade_mp", 5);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x21bc
// Size: 0x137
function private function_126dc0519b8a8ef6(location, numagents, groupname, spawnboss) {
    level endon("game_ended");
    wait 15;
    agents = [];
    agentpackage = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, level.spawnset["guard"], 2);
    agentpackage.reinforcementtype = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, location, "high", "mission", "trapWave2", groupname, undefined, 0, self.node.poi, undefined, undefined, undefined, agentpackage);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait 1;
    }
    self.var_7158f739db4a1d2f = agents;
    foreach (agent in agents) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_setupSecondWaveAgent", &dmzTask_setupSecondWaveAgent);
        if (isagent(agent)) {
            dmzTask_setupSecondWaveAgent(agent);
        }
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22fb
// Size: 0x75
function dmzTask_setupThirdWaveAgent(agent) {
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", ["laserbox_hip04", "none", "none", "none", "silencer01_ar", "none"], "none", "none");
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon, "smoke_grenade_mp", 5);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x2378
// Size: 0x137
function private function_3af43b43f5a74cd9(location, numagents, groupname, spawnboss) {
    level endon("game_ended");
    wait 35;
    agents = [];
    agentpackage = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, level.spawnset["guard"], 3);
    agentpackage.reinforcementtype = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, location, "high", "mission", "trapWave3", groupname, undefined, 0, self.node.poi, undefined, undefined, undefined, agentpackage);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait 1;
    }
    self.var_e4b11d6c6e0cf57c = agents;
    foreach (agent in agents) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_setupThirdWaveAgent", &dmzTask_setupThirdWaveAgent);
        if (isagent(agent)) {
            dmzTask_setupThirdWaveAgent(agent);
        }
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x24b7
// Size: 0xe1
function private function_1939c892064fcc20(agents, location, spawnboss) {
    spawnboss = !isdefined(spawnboss) || spawnboss;
    foreach (agent in agents) {
        if (!isdefined(agent)) {
            continue;
        }
        if (spawnboss) {
            if (isagent(agent)) {
                dmzTask_overrideBoss(agent);
            }
            namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_overrideBoss", &dmzTask_overrideBoss);
            spawnboss = 0;
        } else {
            if (isagent(agent)) {
                dmzTask_overrideReinforcementAgent(agent);
            }
            namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_overrideReinforcementAgent", &dmzTask_overrideReinforcementAgent);
        }
        thread scripts\mp\ai_behavior::function_a5117518725da028(agent, location);
        self.agents[self.agents.size] = agent;
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x25a0
// Size: 0xc6
function private function_8e59903830e24c80(a, b) {
    amindist = 1000000;
    bmindist = 1000000;
    foreach (player in level.players) {
        amindist = min(amindist, distance(player.origin, a.origin));
        bmindist = min(bmindist, distance(player.origin, b.origin));
    }
    return amindist > bmindist;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x266f
// Size: 0x4e
function private function_3d5f26ce20a7fb6e(location, spawnnum, var_b91c2d6441fba51c) {
    angle = spawnnum / var_b91c2d6441fba51c * 360;
    return (location[0] + cos(angle) * 25, location[1] + sin(angle) * 25, location[2]);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x26c6
// Size: 0x7a
function private function_8b3d13f0d1a8607d(fortress) {
    locations = [];
    foreach (node in fortress.lockeddoors) {
        if (!istrue(node.doubledoor)) {
            locations[locations.size] = node;
        }
    }
    return locations;
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2749
// Size: 0x94
function dmzTask_overrideReinforcementAgent(agent) {
    weapon = random(["brloot_weapon_sm_uzulu_epic", "brloot_weapon_ar_mike4_rare"]);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff("body_mp_eastern_nikto_2_1", "head_mp_eastern_nikto_3_1", level.br_lootiteminfo[weapon].fullweaponobj, "smoke_grenade_mp");
    if (randomfloat(1) > 0.3) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropWeapon", 0);
    }
    if (randomfloat(1) > 0) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropBackpack", 0);
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27e5
// Size: 0x8f
function dmzTask_overrideBoss(agent) {
    weapon = random(["brloot_weapon_sm_uzulu_epic", "brloot_weapon_ar_mike4_rare"]);
    namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, level.br_lootiteminfo[weapon].fullweaponobj);
    if (randomfloat(1) > 0.3) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropWeapon", 0);
    }
    if (randomfloat(1) > 0) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropBackpack", 0);
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x287c
// Size: 0xd3
function function_bb2ca071f1918797(trigger, radius) {
    level endon("game_ended");
    self endon("cache_unlocked");
    self.nearbyplayers = [];
    self.capturingteams = [];
    while (true) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.capturingteams, player.team)) {
            self.capturingteams[self.capturingteams.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_984758c25dbcd3ee(trigger, player, radius);
    }
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2957
// Size: 0x88
function function_984758c25dbcd3ee(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.cache.trigger) && distance(trigger.origin, player.origin) < radius + 100) {
        wait 0.2;
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29e7
// Size: 0x85
function play_spotrep_capture_sfx(progress, team) {
    if (!isdefined(self.lastsfxplayedtime)) {
        self.lastsfxplayedtime = gettime();
    }
    if (self.lastsfxplayedtime + 995 < gettime()) {
        self.lastsfxplayedtime = gettime();
        var_c3ddfb0eaa8f761c = "";
        progress = int(floor(progress * 10));
        var_c3ddfb0eaa8f761c = "mp_dom_capturing_tick_0" + progress;
        self playsoundtoteam(var_c3ddfb0eaa8f761c, team);
    }
}

/#

    // Namespace namespace_98928b726f88096a / namespace_b8c00f1eafbbd213
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2a74
    // Size: 0x149
    function function_d781a77d91710067() {
        while (true) {
            if (getdvarint(@"hash_3f7460cd0a96699d", 0)) {
                setdvar(@"hash_3f7460cd0a96699d", 0);
                player = level.players[0];
                node = spawnstruct();
                node.origin = player.origin + anglestoforward(player.angles) * 100;
                node.angles = player.angles;
                task = spawnstruct();
                task.node = node;
                task.activity = spawnstruct();
                task.activity.cashreward = 50;
                task function_e7f010f72a055377();
                task.cache.var_9aef22e3cd04e1dd = 1;
                task.capturetime = level.trapprops.capturetime;
                task.cache setscriptablepartstate("<dev string:x1c>", "<dev string:x59>");
                task.cache enablescriptableplayeruse(player);
            }
            waitframe();
        }
    }

#/
