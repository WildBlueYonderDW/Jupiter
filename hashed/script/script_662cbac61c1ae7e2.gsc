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
#using scripts\mp\flags.gsc;
#using script_4948cdf739393d2d;
#using script_5def7af2a9f04234;
#using script_1174abedbefe9ada;
#using script_15ca41a3fbb0e379;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\hud_message.gsc;
#using script_5307834cd39b435c;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\utility\points.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using script_b7a9ce0a2282b79;

#namespace namespace_f4aa6c284dc35785;

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fc
// Size: 0x3e8
function function_3e18070e9c4c07db() {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("safe", &function_7c5eefd0cbce6520);
    script_model_anims();
    level.var_ac29bbe3a85fc5fa = spawnstruct();
    level.var_ac29bbe3a85fc5fa.var_ea60f992b9bed16c = getdvarint(@"hash_6c64e4ed1b2661b0", 1);
    level.var_ac29bbe3a85fc5fa.var_a7208b64e85e109e = getdvarint(@"hash_4ae9be8b66f04d02", 0);
    level.var_ac29bbe3a85fc5fa.var_a4186f089a36d2f0 = getdvarint(@"hash_20ad09d3184793f8", 2);
    level.var_ac29bbe3a85fc5fa.capturetime = getdvarint(@"hash_40d76dd47f1ffbc5", 75);
    level.var_ac29bbe3a85fc5fa.var_29a79d378c70e0b = getdvarint(@"hash_8fd341ad9e996d3a", 800);
    level.var_ac29bbe3a85fc5fa.var_1e2b29129476352 = getdvarint(@"hash_e5c47808565489f1", 24000);
    level.var_ac29bbe3a85fc5fa.var_96dc0bded5d12406 = level.var_ac29bbe3a85fc5fa.var_1e2b29129476352 * level.var_ac29bbe3a85fc5fa.var_1e2b29129476352;
    level.var_ac29bbe3a85fc5fa.var_3c1656d0de196c00 = getdvarint(@"hash_d0b1d795f6610eb5", 4);
    level.var_ac29bbe3a85fc5fa.var_3bf36cd0ddf354aa = getdvarint(@"hash_d0d4c195f687260b", 5);
    level.var_ac29bbe3a85fc5fa.var_f73c5aa20a9c44d5 = getdvarint(@"hash_d8c8e09d145b3aa", 1);
    level.var_ac29bbe3a85fc5fa.var_83da016bafbafef6 = getdvarint(@"hash_fe63eef908e3ebd7", 1);
    if (!level.var_ac29bbe3a85fc5fa.var_ea60f992b9bed16c) {
        return;
    }
    while (!isdefined(level.struct_class_names) || !isdefined(level.var_41670c1c65f3d3cf) || function_9a83377c98bce82a("everybody") <= 0) {
        waitframe();
    }
    namespace_4b0406965e556711::function_1240434f4201ac9d("radiation_initialized");
    var_ab2be8088c0a7c90 = getstructarray("dmz_safe", "script_noteworthy");
    validlocations = [];
    foreach (var_2a438b0332b8a143 in var_ab2be8088c0a7c90) {
        fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(var_2a438b0332b8a143.origin);
        if (!isdefined(fortress) && namespace_37f0fb6355a4618a::poi_isPOIActive(var_2a438b0332b8a143.poi) && !namespace_7789f919216d38a2::radiation_isInRadiation(var_2a438b0332b8a143.origin)) {
            if (!isdefined(validlocations[var_2a438b0332b8a143.poi])) {
                validlocations[var_2a438b0332b8a143.poi] = [];
            }
            validlocations[var_2a438b0332b8a143.poi][validlocations[var_2a438b0332b8a143.poi].size] = var_2a438b0332b8a143;
        }
    }
    level.safes = [];
    foreach (arr in validlocations) {
        var_fc617751f654a141 = min(randomintrange(level.var_ac29bbe3a85fc5fa.var_a7208b64e85e109e, level.var_ac29bbe3a85fc5fa.var_a4186f089a36d2f0 + 1), arr.size);
        locs = array_randomize(arr);
        for (var_279b7817564584c = 0; var_279b7817564584c < var_fc617751f654a141; var_279b7817564584c++) {
            function_d2441b457fa14419(locs[var_279b7817564584c]);
        }
    }
    /#
        thread function_747adf1e8fdb5ce6();
    #/
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8eb
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("", "allow_jump");
    #/
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x342
function function_d2441b457fa14419(node, var_caa1515c4ad207eb) {
    if (!isdefined(node)) {
        return;
    }
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("tag_origin", "<unknown string>", undefined, "", undefined, undefined, node.poi, node.origin);
    #/
    var_b66875eaf0848550 = "dmz_safe";
    if (isdefined(level.var_1789643b227cf471)) {
        var_b66875eaf0848550 = [[ level.var_1789643b227cf471 ]](node);
    }
    safe = spawnscriptable(var_b66875eaf0848550, node.origin, node.angles);
    safe.curorigin = safe.origin;
    safe.offset3d = (0, 0, 15);
    safe namespace_19b4203b51d56488::requestid(1, 0, undefined, 1);
    objid = safe.objidnum;
    namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, "ui_map_icon_safe");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 15);
    namespace_5a22b6f3a56f7e9b::update_objective_position(objid, safe.origin + (0, 0, 15));
    namespace_5a22b6f3a56f7e9b::objective_pin_global(objid, 1);
    namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    if (level.var_ac29bbe3a85fc5fa.var_f73c5aa20a9c44d5) {
        namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(objid);
    } else {
        namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(objid);
    }
    namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(objid);
    safe.node = node;
    node.safe = safe;
    safe setscriptablepartstate("safe", "usable_not_open");
    if (isdefined(var_caa1515c4ad207eb)) {
        safe.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(getscriptablelootcachecontents(safe));
        safe.contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(safe.contents, 1, var_caa1515c4ad207eb);
        safe.contents = array_randomize(safe.contents);
    }
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", "<unknown string>", undefined, "<unknown string>", undefined, undefined, node.poi, node.origin);
    #/
    safe.trigger = spawn("trigger_radius", safe.node.origin, 0, int(level.var_ac29bbe3a85fc5fa.var_29a79d378c70e0b), int(level.var_ac29bbe3a85fc5fa.var_29a79d378c70e0b));
    safe.trigger trigger_off();
    safe.capturetime = level.var_ac29bbe3a85fc5fa.capturetime;
    safe.var_4e29111f80d17365 = [];
    if (level.var_ac29bbe3a85fc5fa.var_83da016bafbafef6) {
        safe function_a17b754d1372f83e(2);
    }
    safe thread function_474e2e9b4a997564(safe.trigger, level.var_ac29bbe3a85fc5fa.var_29a79d378c70e0b);
    level.safes[level.safes.size] = safe;
    safe.var_ceb543956c7203e7 = &function_9618cc73546d253d;
    return safe;
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc53
// Size: 0x45
function function_9618cc73546d253d(container, player) {
    if (!isdefined(container) || !isdefined(player)) {
        return;
    }
    if (container getscriptableparthasstate("safe", "open_usable")) {
        container setscriptablepartstate("safe", "open_usable");
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9f
// Size: 0x2d
function function_20d58c7fb1074fc6(teamname) {
    if (istrue(self.unlocked)) {
        return;
    }
    self notify("safe_unlocked");
    self.unlocked = 1;
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd3
// Size: 0x284
function function_7c5eefd0cbce6520(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.team)) {
        return;
    }
    if (isdefined(instance.var_ab0e150eda2b5e13)) {
        self [[ instance.var_ab0e150eda2b5e13 ]](instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
        return;
    }
    if (!function_9ab4d7ea05385788(player)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    if (state == "usable_not_open") {
        if (function_42d3f8081a96f0b0(instance, part, state, player)) {
            instance.teams = [0:player.team];
            instance.trigger trigger_on();
            namespace_25b25d188ef778c4::function_1c2bd1696d29935b(player.team, "dmz_mission_safe_opening");
            function_c1fd3441ccfba6f8(player.team, "dmz_trap_drill", 0.5, "dmz_trap_drill_classic");
            namespace_5a22b6f3a56f7e9b::update_objective_state(instance.objidnum, "current");
            namespace_5a22b6f3a56f7e9b::objective_show_progress(instance.objidnum, 1);
            namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(instance.objidnum, player.team);
            instance thread function_a765843f381ad171();
            wait(1);
            namespace_d696adde758cbe79::showDMZSplash("dmz_safe_defend_started", getteamdata(player.team, "players"), instance.node.poi);
        } else {
            instance setscriptablepartstate(part, "usable_not_open");
        }
    } else if (state == "open_usable") {
        if (instance getscriptableparthasstate("safe", "unusable")) {
            instance setscriptablepartstate("safe", "unusable");
        }
        if (!isdefined(instance.contents)) {
            var_9256a8c4667baa69 = getdvarint(@"hash_4c9b0494a5ffac13", 2);
            items = namespace_1b7e64f50cca9321::function_a76b46f057488cc0(instance, player.team, 23, var_9256a8c4667baa69);
            instance.var_46a3a8565ac0c17c = 4;
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(items, 1, player, instance.contents);
            instance function_20d58c7fb1074fc6(player.team);
        } else {
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(undefined, 1, player, instance.contents);
        }
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5e
// Size: 0x5e
function function_42d3f8081a96f0b0(safe, part, state, player) {
    safe setscriptablepartstate(part, "unusable");
    safe.var_b14a331ba425c286 = 0;
    safe thread function_24765a7aabf0093e(player);
    safe function_7f10e8e120314f4b(player, part);
    return istrue(safe.var_b14a331ba425c286);
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc4
// Size: 0x21a
function function_a17b754d1372f83e(var_6e6ee0d9f73a2999) {
    self.agents = [];
    aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "short_range", undefined, 2);
    forwarddist = anglestoforward(self.angles) * 80;
    origin = getclosestpointonnavmesh(self.origin + forwarddist);
    agent = namespace_bfef6903bca5845d::ai_mp_requestSpawnAgent(aitype, origin, self.angles, "high", "mission", "safeInitialGuards", undefined, undefined, undefined, self.node.poi, 0, undefined, 1);
    if (isdefined(agent)) {
        self.agents[0] = agent;
        thread namespace_2000a83505151e5b::function_b11c1964f528574b(agent, 0);
    }
    for (i = 0; i < var_6e6ee0d9f73a2999; i++) {
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "short_range");
        var_50fbac14da970ae7 = randomfloatrange(144, 360);
        forward = anglestoforward(self.angles) * var_50fbac14da970ae7;
        right = vectorcross((0, 0, 1), forward);
        facingangle = axistoangles(forward, right, (0, 0, 1));
        var_88b83b0d7a43ea72 = i / var_6e6ee0d9f73a2999 * 360 + randomfloatrange(-30, 30) % 360;
        offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
        origin = getclosestpointonnavmesh(self.origin + offset);
        agent = namespace_bfef6903bca5845d::ai_mp_requestSpawnAgent(aitype, origin, facingangle, "high", "mission", "safe", undefined, undefined, undefined, self.node.poi, 0, undefined, 0);
        if (isdefined(agent)) {
            self.agents[self.agents.size] = agent;
            thread namespace_2000a83505151e5b::function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e5
// Size: 0x324
function function_a765843f381ad171() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    var_a81135442ee1a731 = 0;
    var_306804c6c85c36b0 = undefined;
    var_94947ef251bf06d8 = 0;
    var_f7d8df490bd332c3 = 512;
    var_7cc37d084d5e863c = 0;
    var_90fb369a18926018 = [];
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (!isdefined(var_306804c6c85c36b0)) {
                var_306804c6c85c36b0 = [0:0, 1:self.capturetime / 4, 2:self.capturetime / 2, 3:self.capturetime / 100 * 75];
            }
            if (self.nearbyplayers.size > 0) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            } else {
                var_f8527642ea162ae5 = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
            }
            progress = self.progress / self.capturetime;
            var_90fb369a18926018 = function_75a1596e8181156(self.nearbyplayers, var_90fb369a18926018, progress);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
            if (self.progress >= self.capturetime) {
                function_67abfc6a70af2ccc();
                if (isdefined(level.var_67abfc6a70af2ccc)) {
                    self [[ level.var_67abfc6a70af2ccc ]]();
                }
            } else if (level.var_ac29bbe3a85fc5fa.var_83da016bafbafef6 && self.nearbyplayers.size > 0 && isdefined(var_306804c6c85c36b0[var_94947ef251bf06d8]) && self.progress >= var_306804c6c85c36b0[var_94947ef251bf06d8]) {
                var_94947ef251bf06d8++;
                var_f7d8df490bd332c3 = var_f7d8df490bd332c3 + 768;
                if (var_f7d8df490bd332c3 > 2816) {
                    var_f7d8df490bd332c3 = 2816;
                }
                agents = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.origin, var_f7d8df490bd332c3, undefined, 3, undefined, 64, 128);
                if (isdefined(agents)) {
                    self.agents = array_combine(self.agents, agents);
                    var_a81135442ee1a731 = var_a81135442ee1a731 + agents.size;
                }
                if (!var_7cc37d084d5e863c && var_94947ef251bf06d8 == 1 && var_a81135442ee1a731 < 4) {
                    var_da117ca38efac51b = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, self.origin, "high", "mission", "safeReinforcements", undefined, undefined, 1, self.node.poi, "Helicopter", 32, 64);
                    if (isdefined(var_da117ca38efac51b) && var_da117ca38efac51b.size > 0) {
                        var_7cc37d084d5e863c = 1;
                        self.agents = array_combine(self.agents, var_da117ca38efac51b);
                    }
                }
            } else if (self.nearbyplayers.size == 0 && var_94947ef251bf06d8 > 0) {
                var_94947ef251bf06d8 = 0;
                var_f7d8df490bd332c3 = 512;
            }
        }
        waitframe();
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1510
// Size: 0x161
function function_75a1596e8181156(nearbyplayers, var_90fb369a18926018, progress) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.team) && !array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            if (namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.objidnum, player, 1, 2, "MP_DMZ_MISSIONS/OPENING_SAFE")) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, player);
                var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
            }
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1679
// Size: 0x188
function function_67abfc6a70af2ccc() {
    self.trigger delete();
    foreach (team in self.teams) {
        foreach (player in getteamdata(team, "players")) {
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            if (!isdefined(player.var_35b94c88cc1cea97)) {
                player.var_35b94c88cc1cea97 = 0;
            }
            player.var_35b94c88cc1cea97++;
            player namespace_48a08c5037514e04::doScoreEvent(#"hash_c02c8c802f07c908");
        }
        namespace_d696adde758cbe79::showDMZSplash("dmz_safe_defend_unlocked", getteamdata(team, "players"));
        namespace_25b25d188ef778c4::function_1c2bd1696d29935b(team, "dmz_mission_safe_unlocked");
        namespace_8361bad7391de074::function_a9f8fa06a358585b(team, "safe", 1, self.node.poi, 1);
        function_c1fd3441ccfba6f8(team, "", 1.5);
    }
    self.opened = 1;
    namespace_19b4203b51d56488::releaseid();
    self setscriptablepartstate("safe", "opening");
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1808
// Size: 0xc9
function function_474e2e9b4a997564(trigger, radius) {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.nearbyplayers = [];
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_d5720ae15e13ff51(trigger, player, radius);
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d8
// Size: 0x82
function function_d5720ae15e13ff51(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.trigger) && distance(trigger.origin, player.origin) < radius * 1.2) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1961
// Size: 0xc7
function script_model_anims() {
    level.scr_animtree["safe_drill_player"] = %script_model;
    level.scr_anim["safe_drill_player"]["safedrill_enter"] = script_model%iw9_dmz_safedrill_enter_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_enter"] = %"safedrill_enter";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_enter"] = "iw9_dmz_safedrill_enter_sdr";
    level.scr_anim["safe_drill_player"]["safedrill_exit"] = script_model%iw9_dmz_safedrill_exit_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_exit"] = %"safedrill_exit";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_exit"] = "iw9_dmz_safedrill_exit_sdr";
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2f
// Size: 0x12b
function function_680b501eb7141c84(isallowed, key) {
    if (!isdefined(key)) {
        key = "drilling";
    }
    if (!isallowed) {
        val::set(key, "allow_jump", 0);
        val::set(key, "gesture", 0);
        val::set(key, "melee", 0);
        val::set(key, "mantle", 0);
        val::set(key, "offhand_weapons", 0);
        val::set(key, "allow_movement", 0);
        val::set(key, "sprint", 0);
        val::set(key, "fire", 0);
        val::set(key, "reload", 0);
        val::set(key, "weapon_pickup", 0);
        val::set(key, "weapon_switch", 0);
        val::set(key, "offhand_weapons", 0);
        val::set(key, "execution_victim", 0);
        val::set(key, "vehicle_use", 0);
        val::set(key, "supers", 0);
        self setclientomnvar("ui_br_inventory_disabled", 1);
        self function_35501b42058d4de9();
    } else {
        val::function_c9d0b43701bdba00(key);
        self setclientomnvar("ui_br_inventory_disabled", 0);
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b61
// Size: 0x324
function function_7f10e8e120314f4b(player, part) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    player function_680b501eb7141c84(0);
    var_bf8e5f003146af44 = self.var_bf8e5f003146af44;
    goalpos = self.origin + rotatevector((50.586, -6.262, 0), self.angles);
    forward = (0, 0, 0) - anglestoforward(self.angles);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up);
    if (!isdefined(var_bf8e5f003146af44)) {
        var_a66fd1b124c32f51 = player getplayerangles();
        player.linktoent = player spawn_tag_origin(player.origin, player.var_a66fd1b124c32f51);
        player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1);
        player setstance("stand");
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
    } else {
        player setstance("stand");
        player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    }
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("safe_drill_player", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    if (isdefined(var_bf8e5f003146af44)) {
        player.player_rig linkto(var_bf8e5f003146af44);
    }
    self setscriptablepartstate(part, "unusable_intro_drilling");
    namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "safedrill_enter");
    if (isreallyalive(player)) {
        namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "safedrill_exit");
    }
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
            player function_680b501eb7141c84(1);
        }
    }
    self.var_b14a331ba425c286 = 1;
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8c
// Size: 0x7d
function function_24765a7aabf0093e(player) {
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
    player function_680b501eb7141c84(1);
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f10
// Size: 0x168
function function_9967799221f8dd5e(team, origin) {
    wait(4);
    poi = namespace_37f0fb6355a4618a::function_55cf921efa4cbd09(origin, 0, 0, 1);
    namespace_d696adde758cbe79::showDMZSplash("dmz_safes_revealed", getteamdata(team, "players"), poi);
    sorted = sortbydistance(level.safes, origin);
    var_26f0c58cf64ab613 = 0;
    var_d4266812b99539b6 = namespace_a38a2e1fe7519183::function_e860c1be7ff11f5b(team, 21);
    var_6451409d2bfddb20 = randomintrange(level.var_ac29bbe3a85fc5fa.var_3c1656d0de196c00, level.var_ac29bbe3a85fc5fa.var_3bf36cd0ddf354aa + 1) + var_d4266812b99539b6;
    foreach (safe in sorted) {
        if (!istrue(safe.opened) && !array_contains(safe.var_4e29111f80d17365, team)) {
            namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(safe.objidnum, team);
            safe.var_4e29111f80d17365[safe.var_4e29111f80d17365.size] = team;
            var_26f0c58cf64ab613++;
            if (var_26f0c58cf64ab613 >= var_6451409d2bfddb20) {
                break;
            }
        }
    }
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207f
// Size: 0x25
function function_9ab4d7ea05385788(player) {
    if (isdefined(player) && istrue(player.var_859654e0445a36d9)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_f4aa6c284dc35785/namespace_abc7ed0cde8527d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ac
// Size: 0x63
function function_747adf1e8fdb5ce6() {
    /#
        while (1) {
            if (getdvarint(@"hash_c3c6da5323f1370f", 0)) {
                setdvar(@"hash_c3c6da5323f1370f", 0);
                thread function_9967799221f8dd5e(level.players[0].team, level.players[0].origin);
            }
            waitframe();
        }
    #/
}

