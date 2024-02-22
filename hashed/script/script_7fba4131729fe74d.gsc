// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
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
#using script_3314add7998ab13;
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
#using script_120270bd0a747a35;

#namespace namespace_98928b726f88096a;

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b9
// Size: 0x1d1
function function_80d68c9701e1aea5(data) {
    level.var_caba91eecf74c36c = spawnstruct();
    level.var_caba91eecf74c36c.capturetime = getdvarint(@"hash_3c0f9fa2bc4d4d67", 120);
    level.var_caba91eecf74c36c.var_29a79d378c70e0b = getdvarint(@"hash_57953e874d9dd19c", 800);
    level.var_caba91eecf74c36c.var_dfe92bb3a3b6a89a = getdvarint(@"hash_1ec4d1950e884a45", 800);
    level.var_caba91eecf74c36c.var_5e7a8e300a12b235 = getdvarint(@"hash_f4b9219b332581a2", 1);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_secret_stash", &function_2d03c352afd1f1bf);
    script_model_anims();
    while (!isdefined(level.var_f1073fbd45b59a06) || !istrue(level.var_f1073fbd45b59a06.var_f9cf165941d1a5be)) {
        waitframe();
    }
    var_879badb8c80b0204 = [];
    var_bcb418497d44610b = getstructarray("dmz_secret_stash", "script_noteworthy");
    if (!istrue(level.var_caba91eecf74c36c.var_5e7a8e300a12b235)) {
        var_bcb418497d44610b = getunusedlootcachepoints();
    }
    foreach (node in var_bcb418497d44610b) {
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

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x891
// Size: 0x6e
function script_model_anims() {
    level.scr_animtree["gun_safe_drill_player"] = %script_model;
    level.scr_anim["gun_safe_drill_player"]["gun_safe_enter"] = script_model%iw9_dmz_stashdrill_enter_stand_sdr;
    level.scr_eventanim["gun_safe_drill_player"]["gun_safe_enter"] = %"gun_safe_enter";
    level.scr_viewmodelanim["gun_safe_drill_player"]["gun_safe_enter"] = "iw9_dmz_stashdrill_enter_stand_sdr";
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x906
// Size: 0x117
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
    } else {
        val::function_c9d0b43701bdba00("drilling");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa24
// Size: 0x307
function function_d5612c9774f4ed30(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    player function_9b5fc1d0b7049fd3(0);
    var_a66fd1b124c32f51 = player getplayerangles();
    player.linktoent = player spawn_tag_origin(player.origin, player.var_a66fd1b124c32f51);
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1);
    goalpos = self.origin + rotatevector((0, 41.127, 0), self.angles + (0, -90, 0));
    forward = (0, 0, 0) - anglestoforward(self.angles);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up) + (0, 0, 0);
    var_57c87883ae437750 = 0.5;
    player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
    player.linktoent rotateto(goalangles, var_57c87883ae437750, 0.1, 0.1);
    player setstance("stand");
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = var_57c87883ae437750 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000;
    waittime = max(0, var_218f64cb035d54be);
    wait(waittime);
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("gun_safe_drill_player", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    animstruct = spawnstruct();
    animstruct.origin = self.origin;
    animstruct.angles = self.angles + (0, 90, 0);
    self setscriptablepartstate("dmz_secret_stash", "drill_enter");
    animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "gun_safe_enter");
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
    self.var_b14a331ba425c286 = 1;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd32
// Size: 0x7d
function function_783f84b2aaf11d69(player) {
    player endon("interact_finished");
    player namespace_3c37cb17ade254d::waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
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

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb6
// Size: 0x1c0
function private function_2d03c352afd1f1bf(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.team)) {
        return;
    }
    if (part == "dmz_secret_stash" && state == "usable") {
        instance setscriptablepartstate("dmz_secret_stash", "unusable");
        instance.var_b14a331ba425c286 = 0;
        instance thread function_783f84b2aaf11d69(player);
        instance function_d5612c9774f4ed30(player);
        if (istrue(instance.var_b14a331ba425c286)) {
            instance.task thread function_f339128058791c31(player.team);
        } else {
            instance setscriptablepartstate("dmz_secret_stash", "usable");
        }
    } else if (part == "dmz_secret_stash" && (state == "closed_usable" || state == "partially_open_usable")) {
        if (!isdefined(instance.contents)) {
            items = namespace_1b7e64f50cca9321::function_a76b46f057488cc0(instance, player.team, 22, getdvarint(@"hash_3aa9346edffdb1bd", 2));
            instance.var_46a3a8565ac0c17c = 5;
            instance.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
            var_8bd50c7e994c7434 = int(instance.task.var_723b8f7cb71ceb11);
            instance.contents = namespace_1b7e64f50cca9321::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 750);
            namespace_1b7e64f50cca9321::lootcacheused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, 1);
        } else {
            namespace_1b7e64f50cca9321::lootcacheused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, 1);
        }
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf7d
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("usable", "dmz_trap_approach_classic");
    #/
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9b
// Size: 0x103
function function_3f49db86fc08365d(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_1ca0090ac5fec38e;
    task.funcs["onPlayerJoined"] = &function_b91953894e06c4fc;
    task.funcs["onPlayerRemoved"] = &function_f04510c7f0f2bddf;
    task.funcs["onTeamAssigned"] = &function_3ad407f03f87fbc5;
    task.funcs["onTeamStart"] = &function_d757790e96368877;
    task.funcs["onCancel"] = &function_b69813e0ef9569be;
    task.ref = "dmz_fortress_search";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    task.fortress = node.fortress;
    return task;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a6
// Size: 0x16a
function function_1ca0090ac5fec38e() {
    self.activity.origin = self.node.origin;
    self.capturetime = level.var_caba91eecf74c36c.capturetime;
    function_e7f010f72a055377();
    self.var_1c17e70621bb1bbc = function_8b3d13f0d1a8607d(self.fortress);
    self.var_65513ad5397a67ef = "trap" + gettime();
    foreach (door in self.var_1c17e70621bb1bbc) {
        door.var_65513ad5397a67ef = self.var_65513ad5397a67ef;
        door.var_af0662d6485d5d58 = "trap";
    }
    self.var_69b705b3551a18c0 = 0;
    self.curorigin = self.cache.origin;
    self.offset3d = (0, 0, 85);
    function_c847bfd52c064289(self.curorigin + self.offset3d, "trap");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.icon, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.icon, 0);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1217
// Size: 0x31
function function_b91953894e06c4fc(player) {
    self.cache enablescriptableplayeruse(player);
    player.var_65513ad5397a67ef = self.var_65513ad5397a67ef;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124f
// Size: 0x34
function function_f04510c7f0f2bddf(player) {
    if (!istrue(self.var_b0b10c60924b7f5f)) {
        self.cache disablescriptableplayeruse(player);
    }
    player.var_65513ad5397a67ef = undefined;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128a
// Size: 0x133
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
    self.var_723b8f7cb71ceb11 = function_9c6ab63c4b6bd08b(teamname);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13c4
// Size: 0x36
function private function_16d030ed02ec724d(teamname) {
    function_c1fd3441ccfba6f8(teamname, "dmz_trap_start", 1.5, "dmz_trap_start_classic");
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("trap_assigned", teamname, 2.5);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1401
// Size: 0x30
function function_d757790e96368877(teamname) {
    function_c1fd3441ccfba6f8(teamname, "dmz_trap_approach", 0, "dmz_trap_approach_classic");
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("trap_near", teamname);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1438
// Size: 0x9d
function function_b69813e0ef9569be(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        if (!istrue(self.var_b0b10c60924b7f5f)) {
            self.cache disablescriptableplayeruse(player);
        }
    }
    function_c1fd3441ccfba6f8(teamname, undefined, undefined);
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14dc
// Size: 0x4d
function function_8250fd658e3aae32() {
    self.complete = 1;
    if (!istrue(self.var_b0b10c60924b7f5f)) {
        self.cache.trigger delete();
        function_629ed367d1393020();
    }
    function_45bd3184ff146b46(self.teams[0]);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1530
// Size: 0xed
function function_91b74d9dfa893111(teamname) {
    if (isdefined(self.cache.trigger)) {
        self.cache.trigger delete();
    }
    function_629ed367d1393020();
    if (!istrue(self.complete)) {
        function_8250fd658e3aae32();
        foreach (team in self.teams) {
            function_a1738a95d7aa8094("dmz_survive_unlocked", "trap", self.activity.var_723b8f7cb71ceb11, team);
            function_c1fd3441ccfba6f8(team, "", 1.5);
        }
        task_ended(self.teams[0]);
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1624
// Size: 0x15b
function private function_e7f010f72a055377() {
    origin = self.node.origin;
    angles = self.node.angles;
    if (!istrue(level.var_caba91eecf74c36c.var_5e7a8e300a12b235)) {
        angles = angles + (0, 90, 0);
    }
    cache = spawnscriptable("dmz_secret_stash", origin, angles);
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("mp_dmz_alrm_trap", self.activity.name, undefined, "usable", undefined, undefined, self.activity.poi, origin);
    #/
    cache.task = self;
    self.cache = cache;
    trigger = spawn("trigger_radius", self.cache.origin, 0, level.var_caba91eecf74c36c.var_29a79d378c70e0b, level.var_caba91eecf74c36c.var_dfe92bb3a3b6a89a);
    trigger trigger_off();
    self.cache.trigger = trigger;
    thread function_bb2ca071f1918797(trigger, level.var_caba91eecf74c36c.var_29a79d378c70e0b);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1786
// Size: 0x3b0
function private function_f339128058791c31(teamname) {
    self.var_69b705b3551a18c0 = getteamdata(teamname, "players").size;
    self.cache.trigger trigger_on();
    if (!istrue(self.cache.var_9aef22e3cd04e1dd)) {
        function_5314298e777e5688("dmz_trap");
        self.fortress.var_6451879e18908224 setscriptablepartstate("fortress_tacmap_location_scriptable", "attacked", 0);
        objective_setshowprogress(self.icon, 1);
        thread function_24f28c302a07b6a1(self.var_1c17e70621bb1bbc);
        thread function_e6c617663e95d7e7(self.var_1c17e70621bb1bbc);
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
    self.var_b0b10c60924b7f5f = 1;
    thread function_f61cf2955d03326b(self.cache.origin, teamname);
    namespace_f2c68794a1018c9d::function_c9f97baa0d7f59bf("dmz_global_trap_start", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_trap_drill", 1.5, "dmz_trap_drill_classic");
    self.agents = [];
    self.var_90fb369a18926018 = [];
    self.progress = 0;
    while (1) {
        if (isdefined(self.cache.trigger) && !istrue(self.cache.trigger.trigger_off)) {
            if (self.nearbyplayers.size > 0) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            }
            progress = self.progress / self.capturetime;
            if (self.progress >= self.capturetime) {
                function_dc537616aa6cd0b0();
                return;
            } else if (!istrue(self.cache.var_9aef22e3cd04e1dd)) {
                self.var_90fb369a18926018 = function_f69e0b0e05fd9b85(self.nearbyplayers, self.var_90fb369a18926018);
                namespace_5a22b6f3a56f7e9b::objective_set_progress(self.icon, progress);
            }
        }
        waitframe();
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3d
// Size: 0x131
function function_dc537616aa6cd0b0() {
    self notify("cache_unlocked");
    self.cache setscriptablepartstate("dmz_secret_stash", "opening");
    if (!istrue(self.cache.var_9aef22e3cd04e1dd)) {
        foreach (player in self.var_90fb369a18926018) {
            if (isdefined(player)) {
                namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.icon, player);
            }
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.icon);
        objective_setshowprogress(self.icon, 0);
        var_ac4c51bf033f6323 = array_combine_unique(getteamdata(self.teams[0], "players"), self.nearbyplayers);
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("trap_unlocked", var_ac4c51bf033f6323);
        self.fortress.var_6451879e18908224 setscriptablepartstate("fortress_tacmap_location_scriptable", "visible", 0);
        function_91b74d9dfa893111(self.teams[0]);
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c75
// Size: 0x163
function function_f69e0b0e05fd9b85(nearbyplayers, var_90fb369a18926018) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            if (namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.icon, player, 2, 2, "MP_DMZ_MISSIONS/STASH_DRILL_PROGRESS_TITLE")) {
                namespace_5a22b6f3a56f7e9b::objective_pin_player(self.icon, player);
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.icon, player);
                var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
            }
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            if (self.teams[0] != player.team || istrue(self.complete)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.icon, player);
            }
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.icon, player);
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.icon, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1de0
// Size: 0x3a
function private function_f61cf2955d03326b(location, teamname) {
    wait(randomintrange(2, 4));
    playsoundatpos(location, "mp_dmz_alrm_trap");
    wait(3);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("trap_start_unlock", teamname);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e21
// Size: 0x79
function private function_24f28c302a07b6a1(nodes) {
    wait(45);
    for (i = 0; i < 2; i++) {
        foreach (node in nodes) {
            thread function_401f6c148c1fd7a8(node);
        }
        wait(30);
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea1
// Size: 0x5c
function function_401f6c148c1fd7a8(node) {
    wait(randomfloatrange(0, 2));
    magicgrenademanual("smoke_grenade_mp", node.var_f87ce576cbf4518a, (0, 0, -10), 0.5);
    thread play_sound_in_space("smoke_grenade_expl_trans", node.var_f87ce576cbf4518a);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f04
// Size: 0x58
function private function_e6c617663e95d7e7(doors) {
    foreach (door in doors) {
        door function_80902296b05be00a();
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f63
// Size: 0xcd
function private function_6727841e301aff6e(location, numagents, groupname, var_7d97c0571433f835) {
    level endon("game_ended");
    agents = [];
    var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, level.spawnset["guard"], 1);
    var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, location, "high", "mission", "trapWave1", groupname, undefined, 1, self.node.poi, undefined, undefined, undefined, var_cf2ff249c028b242);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait(1);
    }
    self.var_7afe9cf22b565562 = agents;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2037
// Size: 0x75
function dmztask_setupsecondwaveagent(agent) {
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", [0:"laserbox_hip04", 1:"none", 2:"none", 3:"none", 4:"silencer01_ar", 5:"none"], "none", "none");
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon, "smoke_grenade_mp", 5);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20b3
// Size: 0x13b
function private function_126dc0519b8a8ef6(location, numagents, groupname, var_7d97c0571433f835) {
    level endon("game_ended");
    wait(15);
    agents = [];
    var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, level.spawnset["guard"], 2);
    var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, location, "high", "mission", "trapWave2", groupname, undefined, 0, self.node.poi, undefined, undefined, undefined, var_cf2ff249c028b242);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait(1);
    }
    self.var_7158f739db4a1d2f = agents;
    foreach (agent in agents) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_setupSecondWaveAgent", &dmztask_setupsecondwaveagent);
        if (isagent(agent)) {
            dmztask_setupsecondwaveagent(agent);
        }
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f5
// Size: 0x75
function dmztask_setupthirdwaveagent(agent) {
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", [0:"laserbox_hip04", 1:"none", 2:"none", 3:"none", 4:"silencer01_ar", 5:"none"], "none", "none");
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon, "smoke_grenade_mp", 5);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2271
// Size: 0x13b
function private function_3af43b43f5a74cd9(location, numagents, groupname, var_7d97c0571433f835) {
    level endon("game_ended");
    wait(35);
    agents = [];
    var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, level.spawnset["guard"], 3);
    var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, location, "high", "mission", "trapWave3", groupname, undefined, 0, self.node.poi, undefined, undefined, undefined, var_cf2ff249c028b242);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait(1);
    }
    self.var_e4b11d6c6e0cf57c = agents;
    foreach (agent in agents) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_setupThirdWaveAgent", &dmztask_setupthirdwaveagent);
        if (isagent(agent)) {
            dmztask_setupthirdwaveagent(agent);
        }
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x23b3
// Size: 0xe3
function private function_1939c892064fcc20(agents, location, var_7d97c0571433f835) {
    var_7d97c0571433f835 = !isdefined(var_7d97c0571433f835) || var_7d97c0571433f835;
    foreach (agent in agents) {
        if (!isdefined(agent)) {
            continue;
        }
        if (var_7d97c0571433f835) {
            if (isagent(agent)) {
                dmztask_overrideboss(agent);
            }
            namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_overrideBoss", &dmztask_overrideboss);
            var_7d97c0571433f835 = 0;
        } else {
            if (isagent(agent)) {
                dmztask_overridereinforcementagent(agent);
            }
            namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "dmzTask_overrideReinforcementAgent", &dmztask_overridereinforcementagent);
        }
        thread namespace_2000a83505151e5b::function_a5117518725da028(agent, location);
        self.agents[self.agents.size] = agent;
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x249d
// Size: 0xca
function private function_8e59903830e24c80(a, b) {
    var_96fb76c792e9f0ec = 1000000;
    var_414f1189604255f3 = 1000000;
    foreach (player in level.players) {
        var_96fb76c792e9f0ec = min(var_96fb76c792e9f0ec, distance(player.origin, a.origin));
        var_414f1189604255f3 = min(var_414f1189604255f3, distance(player.origin, b.origin));
    }
    return var_96fb76c792e9f0ec > var_414f1189604255f3;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x256f
// Size: 0x4e
function private function_3d5f26ce20a7fb6e(location, var_193413008fe594ec, var_b91c2d6441fba51c) {
    angle = var_193413008fe594ec / var_b91c2d6441fba51c * 360;
    return (location[0] + cos(angle) * 25, location[1] + sin(angle) * 25, location[2]);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25c5
// Size: 0x7d
function private function_8b3d13f0d1a8607d(fortress) {
    locations = [];
    foreach (node in fortress.var_e2cd8aa8b46d18ac) {
        if (!istrue(node.var_3d9512b73bdc1514)) {
            locations[locations.size] = node;
        }
    }
    return locations;
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264a
// Size: 0x94
function dmztask_overridereinforcementagent(agent) {
    weapon = random([0:"brloot_weapon_sm_uzulu_epic", 1:"brloot_weapon_ar_mike4_rare"]);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff("body_mp_eastern_nikto_2_1", "head_mp_eastern_nikto_3_1", level.br_lootiteminfo[weapon].fullweaponobj, "smoke_grenade_mp");
    if (randomfloat(1) > 0.3) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropWeapon", 0);
    }
    if (randomfloat(1) > 0) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropBackpack", 0);
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e5
// Size: 0x8f
function dmztask_overrideboss(agent) {
    weapon = random([0:"brloot_weapon_sm_uzulu_epic", 1:"brloot_weapon_ar_mike4_rare"]);
    namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, level.br_lootiteminfo[weapon].fullweaponobj);
    if (randomfloat(1) > 0.3) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropWeapon", 0);
    }
    if (randomfloat(1) > 0) {
        namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropBackpack", 0);
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x277b
// Size: 0xd3
function function_bb2ca071f1918797(trigger, radius) {
    level endon("game_ended");
    self endon("cache_unlocked");
    self.nearbyplayers = [];
    self.var_c72c79b235e12114 = [];
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.var_c72c79b235e12114, player.team)) {
            self.var_c72c79b235e12114[self.var_c72c79b235e12114.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_984758c25dbcd3ee(trigger, player, radius);
    }
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2855
// Size: 0x89
function function_984758c25dbcd3ee(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.cache.trigger) && distance(trigger.origin, player.origin) < radius + 100) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28e5
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

// Namespace namespace_98928b726f88096a/namespace_b8c00f1eafbbd213
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2971
// Size: 0x14b
function function_d781a77d91710067() {
    /#
        while (1) {
            if (getdvarint(@"hash_3f7460cd0a96699d", 0)) {
                setdvar(@"hash_3f7460cd0a96699d", 0);
                player = level.players[0];
                node = spawnstruct();
                node.origin = player.origin + anglestoforward(player.angles) * 100;
                node.angles = player.angles;
                task = spawnstruct();
                task.node = node;
                task.activity = spawnstruct();
                task.activity.var_723b8f7cb71ceb11 = 50;
                task function_e7f010f72a055377();
                task.cache.var_9aef22e3cd04e1dd = 1;
                task.capturetime = level.var_caba91eecf74c36c.capturetime;
                task.cache setscriptablepartstate("usable", "dmzTask_setupThirdWaveAgent");
                task.cache enablescriptableplayeruse(player);
            }
            waitframe();
        }
    #/
}

