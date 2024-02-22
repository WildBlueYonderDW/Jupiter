// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\utility.gsc;
#using script_7b2517368c79e5bc;
#using script_43971bbeefd98f05;
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using scripts\cp_mp\challenges.gsc;
#using script_398835140857d740;
#using script_3ab210ea917601e7;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_64351208cb856df9;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_6a8ec730b2bfa844;
#using script_6d70705bb9712bb;
#using script_46c7c73b1a7e4773;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\engine\scriptable.gsc;
#using script_638d701d263ee1ed;
#using scripts\mp\gameobjects.gsc;
#using script_d60e0219a7419e0;
#using scripts\mp\hud_message.gsc;
#using script_22f1701e151b9d12;
#using script_120270bd0a747a35;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using script_2583ee5680cf4736;
#using script_58be75c518bf0d40;

#namespace namespace_5c6deef041b03f11;

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc00
// Size: 0x9c
function function_d3befda2a868e1ac() {
    if (!challengesenabled()) {
        return;
    }
    namespace_70f0bf4af2b789eb::main();
    namespace_3c37cb17ade254d::registersharedfunc("ob_quest_missions", "onConvoyActive", &onconvoyactive);
    namespace_3c37cb17ade254d::registersharedfunc("ob_quest_missions", "onMercStrongholdActive", &onmercstrongholdactive);
    namespace_3c37cb17ade254d::registersharedfunc("ob_quest_missions", "onOutlastActive", &onoutlastactive);
    namespace_3c37cb17ade254d::registersharedfunc("ob_quest_missions", "onSabotageExtractorDisabled", &onsabotageextractordisabled);
    namespace_3c37cb17ade254d::registersharedfunc("ob_quest_missions", "OnWeaponStashActive", &onweaponstashactive);
    callback::add("merc_warlord_death", &function_e23b5eafc9d0c7bf);
    level thread function_5233ec7f3a4cfa23();
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca3
// Size: 0xc0
function onconvoyactive(var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a callback::callback("on_convoy_begin");
    var_f905b8919064b561 = undefined;
    foreach (ai in var_2f5d509d7b71ce9a.var_70b5f128bfa2986e) {
        if (isdefined(ai) && isdefined(ai.agent_type) && (ai.agent_type == "actor_jup_ob_enemy_specialist_captain" || ai.agent_type == "actor_jup_ob_enemy_specialist_commander")) {
            var_2f5d509d7b71ce9a thread function_83f49b42abfbeddb(ai);
            break;
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6a
// Size: 0x16a
function function_83f49b42abfbeddb(boss) {
    attacker = boss waittill("death");
    v_pos = getclosestpointonnavmesh(boss.origin);
    v_ground = getgroundposition(v_pos, 50);
    var_c1928b11c1cc2424 = function_38e113a4c30f6c0d("obloot_key_human_stronghold", v_ground, (0, 0, 0), 0, 1, 1, 1);
    if (isdefined(var_c1928b11c1cc2424)) {
        var_c1928b11c1cc2424.var_1018ba92f1186325 = 1;
        itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_key_human_stronghold");
        lootid = function_6d15e119c2779a93(itembundle);
    }
    var_72b36e074e46074b = getplayersinradius(v_pos, 1500);
    foreach (player in var_72b36e074e46074b) {
        if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 16093) || getdvarint(@"hash_7846a66ee6afec3e", 0) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, var_c1928b11c1cc2424.origin, var_c1928b11c1cc2424.index, lootid);
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedb
// Size: 0x4b
function onweaponstashactive(var_2f5d509d7b71ce9a, player) {
    if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 16140) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
        player.var_d1e277c70c37ea5a = 1;
        var_2f5d509d7b71ce9a thread function_64e8f53ac12ac246();
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2d
// Size: 0x26
function function_64e8f53ac12ac246() {
    self.safe waittill("safe_unlocked");
    self.safe.var_208c5333afcd7102 = undefined;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5a
// Size: 0x75
function onmercstrongholdactive(var_2f5d509d7b71ce9a, player) {
    if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 16946) || namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0) || getdvarint(@"hash_7846a66ee6afec3e", 0)) {
        player.var_d1e277c70c37ea5a = 1;
        var_2f5d509d7b71ce9a thread function_4264199ac384ff4e();
        var_2f5d509d7b71ce9a thread function_fa4fe5913824beba();
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd6
// Size: 0x17
function function_4264199ac384ff4e() {
    self waittill("merc_stronghold_cleared");
    callback::callback("merc_stronghold_cleared");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff4
// Size: 0x120
function function_fa4fe5913824beba() {
    self.safe waittill("safe_unlocked");
    callback::callback("merc_stronghold_cleared");
    v_pos = getclosestpointonnavmesh(self.safe.origin);
    var_bbc56c643fd5a7a9 = undefined;
    while (!isdefined(var_bbc56c643fd5a7a9)) {
        var_bbc56c643fd5a7a9 = function_38e113a4c30f6c0d("obloot_ava_intel_merc_stronghold", v_pos, (0, 0, 0), 0, 1, 1, 1);
        waitframe();
    }
    wait(0.5);
    if (isdefined(var_bbc56c643fd5a7a9)) {
        itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_act1_tier4_intel_tablet");
        lootid = function_6d15e119c2779a93(itembundle);
        foreach (player in self.var_6c29f2fdb0054bbe) {
            player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, var_bbc56c643fd5a7a9.origin, var_bbc56c643fd5a7a9.index, lootid);
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111b
// Size: 0x1b2
function function_97386f131cccf1e6() {
    level.var_68fa4b22b3752b02 = spawnstruct();
    level.var_68fa4b22b3752b02.var_1e2b29129476352 = getdvarint(@"hash_de0487f3e5f484a3", 24000);
    level.var_68fa4b22b3752b02.var_f73c5aa20a9c44d5 = getdvarint(@"hash_3cf3f91f9a2e76d8", 1);
    level.var_68fa4b22b3752b02.var_83da016bafbafef6 = getdvarint(@"hash_d69ece7d8e88eaad", 1);
    level.var_68fa4b22b3752b02.var_ad82f4cd58962ce1 = getdvarint(@"hash_134e75ab81aab7de", 1);
    level.var_68fa4b22b3752b02.var_96dc0bded5d12406 = squared(level.var_68fa4b22b3752b02.var_1e2b29129476352);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("safe", &function_4b374266cdca5335);
    function_5f1aa46d828ea326();
    game["dialog"]["safecrack_safe_is_near"] = "dx_br_dmzo_cost_ovld_actualtoultra1target";
    game["dialog"]["safecrack_safe_bringing_heat"] = "dx_br_dmzo_cost_ovld_ultra1beadvisedthats";
    game["dialog"]["safecrack_enemies_incoming"] = "dx_br_dmzo_cost_ovld_ultra1yougothostiles";
    game["dialog"]["safecrack_enemies_alerted"] = "dx_br_dmzo_cost_ovld_headsupultra1thatsaf";
    game["dialog"]["safecrack_safe_is_open0"] = "dx_br_dmzo_cost_ovld_ultra1thesafeisopens";
    game["dialog"]["safecrack_safe_is_open1"] = "dx_br_dmzo_cost_ovld_ultra1safeisopensecu";
    game["dialog"]["safecrack_safe_is_open2"] = "dx_br_dmzo_cost_ovld_ultra1safeisopensecu_01";
    game["dialog"]["safecrack_enemies_at_safe"] = "dx_br_dmzo_cost_ovld_ultra1enemyoperators";
    game["dialog"]["safecrack_enemies_near_safe"] = "dx_br_dmzo_cost_ovld_actualtoultra1enemie";
    game["dialog"]["safecrack_enemies_opening_safe"] = "dx_br_dmzo_cost_ovld_ultra1hostilesareatt";
    function_922249df70b163b4();
    function_c6335e6b5148073c();
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d4
// Size: 0xba
function function_922249df70b163b4() {
    if (isdefined(self.var_cdde8e8fc33af4)) {
        self.var_fb44575552fa682 = self.var_cdde8e8fc33af4;
    } else {
        var_a4080b1a80515f14 = getstructarray(self.var_626b45032e1892da, "target");
        foreach (struct in var_a4080b1a80515f14) {
            if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "s_safe_spawn") {
                self.var_fb44575552fa682 = struct;
                break;
            }
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1395
// Size: 0x396
function function_c6335e6b5148073c() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.capture_radius = 150;
    self.attract_radius = 2048;
    self.var_e964223850a88d72 = 1;
    self.var_abc346fd5c06110b = "jup_ob_safecrack_encounter";
    var_76903f9b275f23d4 = self.var_fb44575552fa682;
    self.origin = var_76903f9b275f23d4.origin;
    self.angles = var_76903f9b275f23d4.angles;
    self.var_fc4ffac4746eb217 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.origin);
    switch (self.var_fc4ffac4746eb217) {
    default:
        self.var_fc4ffac4746eb217 = "difficulty_easy";
    case #"hash_7bb2cd766703d463":
        self.capture_time = 75;
        self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
        break;
    case #"hash_af83e47edfa8900a":
        self.capture_time = 75;
        self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
        break;
    case #"hash_5343b465e56ec9a4":
        self.capture_time = 75;
        self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
        break;
    case #"hash_651f76c0ad6741ec":
        self.capture_time = 75;
        self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
        break;
    }
    self.capture_time = float(self.capture_time);
    self.var_82fe1c44f0e59dd5 = squared(self.capture_radius);
    self.var_287c8f447c48c9aa = squared(self.attract_radius);
    safe = spawnscriptable("safecrack_safe", self.origin, self.angles);
    safe setscriptablepartstate("safe", "usable_not_open");
    safe.activity = self;
    self.safe = safe;
    safe.curorigin = safe.origin;
    safe.offset3d = (0, 0, 15);
    safe namespace_19b4203b51d56488::requestid(1, 1, undefined, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(safe.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(safe.objidnum, 15);
    namespace_5a22b6f3a56f7e9b::update_objective_position(safe.objidnum, safe.origin + (0, 0, 15));
    namespace_5a22b6f3a56f7e9b::objective_pin_global(safe.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(safe.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(safe.objidnum, 0);
    if (level.var_68fa4b22b3752b02.var_f73c5aa20a9c44d5) {
        namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(safe.objidnum);
    } else {
        namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(safe.objidnum);
    }
    namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(safe.objidnum);
    safe.trigger = spawn("trigger_radius", safe.origin, 0, self.capture_radius, self.capture_radius);
    safe.trigger trigger_off();
    safe thread function_972f4e9d555b09a6();
    if (level.var_68fa4b22b3752b02.var_83da016bafbafef6) {
        safe thread function_74717c53a1ed7f5();
    }
    self.safe waittill("safe_unlocking");
    thread function_bdfe768bd3eed7fc();
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1732
// Size: 0x21
function function_bdfe768bd3eed7fc() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.safe waittill("safe_looted");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x175a
// Size: 0x36
function function_ed260c1f4a6de9f8(activity_succeeded) {
    self endon("instance_destroyed");
    namespace_40713433c91dd86c::function_c402ecda1e84ba27(self.var_6c29f2fdb0054bbe, 0, self.difficulty_region, self.origin);
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1797
// Size: 0xa
function function_f0f250986bb9d773() {
    self endon("instance_destroyed");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a8
// Size: 0xb7
function function_4b374266cdca5335(safe, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(player) && istrue(player.var_859654e0445a36d9)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/DENY_USE_CARRY");
        return;
    }
    if (state == "usable_not_open") {
        thread function_58ab5bffacda35c3(safe, part, state, player);
    } else if (state == "open_usable") {
        if (!isdefined(safe.contents)) {
            safe notify("safe_looted");
            safe.var_46a3a8565ac0c17c = 4;
            namespace_9b83895815d12835::function_d71a41afca697376(safe, "ob_jup_items_contract_weaponstash", 5);
        }
        namespace_3883e3399f2870b5::function_30f5ea60517f9e06(safe, player);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1866
// Size: 0x10d
function function_58ab5bffacda35c3(safe, part, state, player) {
    safe setscriptablepartstate(part, "unusable");
    safe.var_b14a331ba425c286 = 0;
    safe thread function_6af78ce78267233c(player);
    safe function_5317479fee3ffd7d(player);
    if (istrue(safe.var_b14a331ba425c286)) {
        safe.teams = [0:player.team];
        safe.trigger trigger_on();
        if (level.var_68fa4b22b3752b02.var_ad82f4cd58962ce1) {
        }
        safe notify("safe_unlocking");
        namespace_5a22b6f3a56f7e9b::update_objective_state(safe.objidnum, "current");
        namespace_5a22b6f3a56f7e9b::objective_show_progress(safe.objidnum, 1);
        namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(safe.objidnum, player.team);
        safe thread function_76d84b28702a71fb();
    } else {
        safe setscriptablepartstate(part, "usable_not_open");
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197a
// Size: 0x260
function function_76d84b28702a71fb() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    var_306804c6c85c36b0 = undefined;
    var_94947ef251bf06d8 = 0;
    var_90fb369a18926018 = [];
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (!isdefined(var_306804c6c85c36b0)) {
                var_306804c6c85c36b0 = [0:0, 1:self.activity.capture_time / 4, 2:self.activity.capture_time / 2, 3:self.activity.capture_time / 100 * 75];
            }
            if (self.nearbyplayers.size > 0) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.activity.capture_time, self.progress + level.framedurationseconds);
            } else if (self.activity.var_e964223850a88d72) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
            }
            progress = self.progress / self.activity.capture_time;
            var_90fb369a18926018 = function_c24e63b1bc58730(self.nearbyplayers, var_90fb369a18926018, progress);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
            if (self.progress >= self.activity.capture_time) {
                thread function_81207cdee7c85896();
                thread function_dc8aff8faf2a6a3b();
            } else if (self.nearbyplayers.size > 0 && isdefined(var_306804c6c85c36b0[var_94947ef251bf06d8]) && self.progress >= var_306804c6c85c36b0[var_94947ef251bf06d8]) {
                var_94947ef251bf06d8++;
                function_99b95e1bcf411ecd();
                if (!istrue(self.var_d062a6468e65034e) && var_94947ef251bf06d8 == 2) {
                    self.shouldreinforce = 1;
                }
            } else if (self.nearbyplayers.size == 0 && var_94947ef251bf06d8 > 0) {
                var_94947ef251bf06d8 = 0;
            }
        }
        waitframe();
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be1
// Size: 0xbd
function function_dc8aff8faf2a6a3b() {
    v_pos = getclosestpointonnavmesh(self.origin);
    var_c1928b11c1cc2424 = function_38e113a4c30f6c0d("ob_jup_item_act1_tier4_intel_tablet", v_pos, (0, 0, 0), 0, 1, 1, 1);
    var_c1928b11c1cc2424 = undefined;
    wait(0.5);
    if (isdefined(var_c1928b11c1cc2424)) {
        itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_act1_tier4_intel_tablet");
        lootid = function_6d15e119c2779a93(itembundle);
        player = random(level.players);
        player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, var_c1928b11c1cc2424.origin, var_c1928b11c1cc2424.index, lootid);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x114
function function_c24e63b1bc58730(nearbyplayers, var_90fb369a18926018, progress) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
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

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc1
// Size: 0x187
function function_81207cdee7c85896() {
    if (!istrue(self.unlocked)) {
        self.unlocked = 1;
    }
    foreach (team in self.teams) {
        foreach (player in getteamdata(team, "players")) {
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            if (!isdefined(player.var_6b41d67653e80c4b)) {
                player.var_6b41d67653e80c4b = 0;
            }
            player.var_6b41d67653e80c4b++;
        }
        self.activity function_1281c7fff9456e18("safecrack_unlocked", getteamdata(team, "players"));
    }
    self setscriptablepartstate("safe", "opening");
    function_2169641d6a403864(self.encounterid);
    if (level.var_68fa4b22b3752b02.var_ad82f4cd58962ce1) {
        namespace_5381a59d140f4df8::function_349b67890a05c376(self.zombie_attractor);
    }
    self.trigger delete();
    namespace_19b4203b51d56488::releaseid();
    self notify("safe_unlocked");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4f
// Size: 0xbe
function function_972f4e9d555b09a6() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.nearbyplayers = [];
    while (1) {
        player = self.trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        childthread function_5372077bc94f2397(player);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2014
// Size: 0x8c
function function_5372077bc94f2397(player) {
    while (isdefined(self.trigger) && isdefined(player) && isalive(player) && distancesquared(self.trigger.origin, player.origin) < 1.1 * self.activity.var_82fe1c44f0e59dd5) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a7
// Size: 0xad
function function_74717c53a1ed7f5() {
    self.agents = [];
    self.encounterid = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:" + self.activity.var_abc346fd5c06110b, self.origin, 1024, 1, 1, 0);
    if (isdefined(self.encounterid)) {
        function_d37068aac7785c04(self.encounterid, self.activity.var_fc4ffac4746eb217, 1);
        namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(self.encounterid, &function_111b3e11bf99b915, [0:self]);
        namespace_614554f86e52695c::function_7a2920be35f4386(self.encounterid, &function_6d930ef0e465d1c6, [0:self]);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215b
// Size: 0xbc
function function_111b3e11bf99b915(requestid, userdata, agent, data) {
    agent endon("death");
    safe = userdata[0];
    if (isalive(agent)) {
        safe.agents[safe.agents.size] = agent;
        if (safe.agents.size <= 2) {
            childthread namespace_2000a83505151e5b::function_b11c1964f528574b(agent, 0);
        } else {
            childthread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 512, 256, safe.origin);
        }
        agent function_65cdab0fc78aba8f(safe.origin, safe.activity.capture_radius);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221e
// Size: 0x5c
function function_6d930ef0e465d1c6(requestid, userdata, var_dcff5961635938a9) {
    safe = userdata[0];
    if (!istrue(safe.var_d062a6468e65034e) && istrue(safe.shouldreinforce)) {
        safe.var_d062a6468e65034e = 1;
        return 1;
    }
    return 0;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2282
// Size: 0x10d
function function_99b95e1bcf411ecd() {
    agents = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(self.origin, self.activity.attract_radius, "team_hundred_ninety");
    var_fad30082b194307b = [];
    foreach (agent in agents) {
        if (!isplayer(agent)) {
            var_fad30082b194307b[var_fad30082b194307b.size] = agent;
        }
    }
    agents = var_fad30082b194307b;
    foreach (agent in agents) {
        agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, self.origin, 128, 64, undefined, 1, agents, 0);
    }
    self.agents = array_combine_unique(self.agents, agents);
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2396
// Size: 0xb7
function function_7d06997663e2b19f(attractor, zombie) {
    safe = attractor.source.safe;
    if (is_equal(zombie.aicategory, "normal") && distance(zombie.origin, safe.origin) > safe.activity.capture_radius / 2) {
        if (zombie.team == "team_two_hundred") {
            safe.agents[safe.agents.size] = zombie;
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2455
// Size: 0xc7
function function_5f1aa46d828ea326() {
    level.scr_animtree["safe_drill_player"] = %script_model;
    level.scr_anim["safe_drill_player"]["safedrill_enter"] = script_model%iw9_dmz_safedrill_enter_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_enter"] = %"safedrill_enter";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_enter"] = "iw9_dmz_safedrill_enter_sdr";
    level.scr_anim["safe_drill_player"]["safedrill_exit"] = script_model%iw9_dmz_safedrill_exit_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_exit"] = %"safedrill_exit";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_exit"] = "iw9_dmz_safedrill_exit_sdr";
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2523
// Size: 0x2c4
function function_5317479fee3ffd7d(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    player function_583c8ddc51dd46d6(0);
    var_a66fd1b124c32f51 = player getplayerangles();
    player.linktoent = player spawn_tag_origin(player.origin, player.var_a66fd1b124c32f51);
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1);
    goalpos = self.origin + rotatevector((50.586, -6.262, 0), self.angles);
    forward = (0, 0, 0) - anglestoforward(self.angles);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up);
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
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("safe_drill_player", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    self setscriptablepartstate("safe", "unusable_intro_drilling");
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
            player function_583c8ddc51dd46d6(1);
        }
    }
    self.var_b14a331ba425c286 = 1;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ee
// Size: 0x129
function function_583c8ddc51dd46d6(isallowed) {
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
        val::set("drilling", "execution_victim", 0);
        val::set("drilling", "vehicle_use", 0);
        self function_35501b42058d4de9();
    } else {
        val::function_c9d0b43701bdba00("drilling");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291e
// Size: 0x7d
function function_6af78ce78267233c(player) {
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
    player function_583c8ddc51dd46d6(1);
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29a2
// Size: 0xb9
function function_e34b2762fa082dcc(player) {
    wait(4);
    player thread namespace_44abc05161e2e2cb::showsplash("safecrack_revealed", undefined, undefined, undefined, 1, "splash_list_jup_ob");
    foreach (safe in level.safes) {
        if (distance2dsquared(safe.origin, player.origin) <= level.var_68fa4b22b3752b02.var_96dc0bded5d12406) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(safe.objidnum, player);
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a62
// Size: 0x15
function onoutlastactive(var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a thread function_da3f7ddab34651a2();
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7e
// Size: 0x3d2
function function_da3f7ddab34651a2() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self waittill("outlast_space_entered_first_time");
    var_3ec90d6d2afa472f = [];
    foreach (var_789ffbad4d195284 in self.var_cd05af3824c52cde) {
        if (isdefined(var_789ffbad4d195284.targetname) && var_789ffbad4d195284.targetname == "jup_zm_phase_crystal_floor") {
            if (var_789ffbad4d195284.origin[2] > self.var_a897d5b8c6afdc34.origin[2] + -10 && var_789ffbad4d195284.origin[2] < self.var_a897d5b8c6afdc34.origin[2] + 10) {
                var_3ec90d6d2afa472f[var_3ec90d6d2afa472f.size] = var_789ffbad4d195284;
            }
        }
    }
    spawn_origin = undefined;
    var_ee6145d714e45387 = undefined;
    if (isarray(var_3ec90d6d2afa472f) && var_3ec90d6d2afa472f.size > 0) {
        var_625aa7477bf23eaa = random(var_3ec90d6d2afa472f);
        spawn_origin = var_625aa7477bf23eaa.origin;
    } else if (isdefined(self.var_a897d5b8c6afdc34)) {
        spawn_origin = self.var_a897d5b8c6afdc34.origin;
    }
    if (isdefined(spawn_origin)) {
        var_ee6145d714e45387 = getclosestpointonnavmesh(spawn_origin);
    }
    if (!isdefined(var_ee6145d714e45387)) {
        if (isarray(self.var_2d5b80c94b21ea0e) && self.var_2d5b80c94b21ea0e.size > 0) {
            var_8be6275ca7feb8c6 = random(self.var_2d5b80c94b21ea0e);
            var_ee6145d714e45387 = var_8be6275ca7feb8c6.origin;
        } else if (isarray(self.var_6c29f2fdb0054bbe) && self.var_6c29f2fdb0054bbe.size > 0) {
            var_8be6275ca7feb8c6 = random(self.var_6c29f2fdb0054bbe);
            var_ee6145d714e45387 = var_8be6275ca7feb8c6.origin;
        } else {
            return;
        }
    }
    if (isarray(self.var_79b4bb874f4580f3["ava_tablet"]) && isdefined(self.var_79b4bb874f4580f3["ava_tablet"][0])) {
        var_ee6145d714e45387 = function_53c4c53197386572(self.var_79b4bb874f4580f3["ava_tablet"][0].origin, var_ee6145d714e45387);
    }
    self waittill("outlast_complete");
    var_d781ff762095c86d = 0;
    foreach (player in self.var_6c29f2fdb0054bbe) {
        if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 16822) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            var_d781ff762095c86d = 1;
        }
    }
    if (istrue(var_d781ff762095c86d)) {
        var_982663bc9a80a02f = function_38e113a4c30f6c0d("obloot_intel_tablet", var_ee6145d714e45387, (0, 0, 0), 0, 1, undefined, 1);
        var_982663bc9a80a02f.playerlist = self.var_6c29f2fdb0054bbe;
        wait(0.5);
        if (isdefined(var_982663bc9a80a02f)) {
            var_982663bc9a80a02f.var_6965f4722cba59d8 = 1;
            itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_act1_tier6_avas_tablet");
            lootid = function_6d15e119c2779a93(itembundle);
            foreach (player in self.var_6c29f2fdb0054bbe) {
                player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, var_982663bc9a80a02f.origin, var_982663bc9a80a02f.index, lootid);
            }
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e57
// Size: 0x37
function function_8361aeffba083290(player) {
    var_9d5bc8e32ee3635 = "uin_ob_pickup_valuable";
    player playsound(var_9d5bc8e32ee3635);
    callback::callback("outlast_tablet_interact");
    self freescriptable();
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e95
// Size: 0x162
function onsabotageextractordisabled(var_2f5d509d7b71ce9a, var_c88255f042016cd7) {
    if (var_2f5d509d7b71ce9a function_b978f5e2753317a4(16446) || getdvarint(@"hash_37acf332efd205cc", 0) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
        if (!isdefined(var_2f5d509d7b71ce9a.var_da225ff88f5191eb) || !var_2f5d509d7b71ce9a.var_da225ff88f5191eb) {
            var_85929467aad943a9 = undefined;
            v_pos = getclosestpointonnavmesh(var_c88255f042016cd7.origin);
            while (!isdefined(var_85929467aad943a9)) {
                var_85929467aad943a9 = function_38e113a4c30f6c0d("obloot_quest_a2t4_container", v_pos, undefined, undefined, undefined, undefined, 1);
                wait(0.5);
            }
            if (isdefined(var_85929467aad943a9)) {
                itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_act2_tier4_container");
                lootid = function_6d15e119c2779a93(itembundle);
                foreach (player in var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe) {
                    player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, var_85929467aad943a9.origin, var_85929467aad943a9.index, lootid);
                }
            }
            var_2f5d509d7b71ce9a.var_da225ff88f5191eb = 1;
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ffe
// Size: 0x161
function private function_bebd651e6464d232() {
    var_b0383c06c304c460 = getstruct("quest_a2t3_essence_bazaar", "targetname");
    var_a4871cdc42d9531b = function_38e113a4c30f6c0d("obloot_quest_a2t3_bazaar_container", var_b0383c06c304c460.origin, var_b0383c06c304c460.angles, undefined, 1, 1, 1);
    interact = namespace_5775ad2badedbcaa::function_32645103f7520635(var_a4871cdc42d9531b, &function_9dab7ca9c27dfb18);
    interact.var_eab36e0aaaebac0f = "bazaar";
    interact setscriptablepartstate("obloot_quest_a2t3_bazaar_container", "visible");
    foreach (player in level.players) {
        if (getdvarint(@"hash_7b8b09c504a0c9a0", 0) && !istrue(player.var_7f15f872dea27203)) {
            interact enablescriptablepartplayeruse(interact.type, player);
        } else if (!function_c7d3c1cb4a3958cf(player, 16655)) {
            interact disablescriptablepartplayeruse(interact.type, player);
        } else if (istrue(player.var_7f15f872dea27203)) {
            interact disablescriptablepartplayeruse(interact.type, player);
        }
        player thread function_d8e6504221fc91c6(interact, 16655);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3166
// Size: 0x161
function private function_66be43782ac9255e() {
    var_f23a4a1705f1a6dc = getstruct("quest_a2t3_essence_retail", "targetname");
    var_d9c350b9933516d3 = function_38e113a4c30f6c0d("obloot_quest_a2t3_retail_container", var_f23a4a1705f1a6dc.origin, var_f23a4a1705f1a6dc.angles, undefined, 1, 1, 1);
    interact = namespace_5775ad2badedbcaa::function_32645103f7520635(var_d9c350b9933516d3, &function_e81f6a73b0d66d0);
    interact.var_eab36e0aaaebac0f = "retail";
    interact setscriptablepartstate("obloot_quest_a2t3_retail_container", "visible");
    foreach (player in level.players) {
        if (getdvarint(@"hash_7b8b09c504a0c9a0", 0) && !istrue(player.var_f21eaf07ce1d28cb)) {
            interact enablescriptablepartplayeruse(interact.type, player);
        } else if (!function_c7d3c1cb4a3958cf(player, 16655)) {
            interact disablescriptablepartplayeruse(interact.type, player);
        } else if (istrue(player.var_f21eaf07ce1d28cb)) {
            interact disablescriptablepartplayeruse(interact.type, player);
        }
        player thread function_d8e6504221fc91c6(interact, 16655);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32ce
// Size: 0x161
function private function_48f5535dced65762() {
    var_2673e92da4f233fc = getstruct("quest_a2t3_essence_shops", "targetname");
    var_cbe0ad7315f99ee1 = function_38e113a4c30f6c0d("obloot_quest_a2t3_shops_container", var_2673e92da4f233fc.origin, var_2673e92da4f233fc.angles, undefined, 1, 1, 1);
    interact = namespace_5775ad2badedbcaa::function_32645103f7520635(var_cbe0ad7315f99ee1, &function_4224be92f5fc92be);
    interact.var_eab36e0aaaebac0f = "shops";
    interact setscriptablepartstate("obloot_quest_a2t3_shops_container", "visible");
    foreach (player in level.players) {
        if (getdvarint(@"hash_7b8b09c504a0c9a0", 0) && !istrue(player.var_329019ddf92d6969)) {
            interact enablescriptablepartplayeruse(interact.type, player);
        } else if (!function_c7d3c1cb4a3958cf(player, 16655)) {
            interact disablescriptablepartplayeruse(interact.type, player);
        } else if (istrue(player.var_329019ddf92d6969)) {
            interact disablescriptablepartplayeruse(interact.type, player);
        }
        player thread function_d8e6504221fc91c6(interact, 16655);
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3436
// Size: 0x93
function function_d8e6504221fc91c6(container, missionid) {
    self endon("death_or_disconnect");
    while (1) {
        self waittill("mission_completed");
        wait(5);
        if (function_c7d3c1cb4a3958cf(self, missionid) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            container enablescriptablepartplayeruse(container.type, self);
        }
        wait(5);
        if (function_c7d3c1cb4a3958cf(self, missionid) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            container enablescriptablepartplayeruse(container.type, self);
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d0
// Size: 0x27
function function_5233ec7f3a4cfa23() {
    level flag_wait("ob_infil_completed");
    function_bebd651e6464d232();
    waitframe();
    function_66be43782ac9255e();
    waitframe();
    function_48f5535dced65762();
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34fe
// Size: 0x39
function private function_9dab7ca9c27dfb18(player) {
    player.var_7f15f872dea27203 = 1;
    self disablescriptablepartplayeruse(self.type, player);
    level thread function_442e8b1568008551("bazaar");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x353e
// Size: 0x39
function private function_e81f6a73b0d66d0(player) {
    player.var_f21eaf07ce1d28cb = 1;
    self disablescriptablepartplayeruse(self.type, player);
    level thread function_442e8b1568008551("retail");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x357e
// Size: 0x39
function private function_4224be92f5fc92be(player) {
    player.var_329019ddf92d6969 = 1;
    self disablescriptablepartplayeruse(self.type, player);
    level thread function_442e8b1568008551("shops");
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35be
// Size: 0x6d
function private function_442e8b1568008551(var_dc9a5eacf161111f) {
    level endon("game_ended");
    switch (var_dc9a5eacf161111f) {
    case #"hash_ddc6dedfe833e70e":
        function_bebd651e6464d232();
        break;
    case #"hash_1c8aec9a2f0ee502":
        function_66be43782ac9255e();
        break;
    case #"hash_1f59933efce7a50e":
        function_48f5535dced65762();
        break;
    default:
        break;
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3632
// Size: 0x156
function private function_e23b5eafc9d0c7bf(params) {
    player = params.player;
    var_1b68ba89f80f2b5c = params.var_1b68ba89f80f2b5c;
    if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
        v_pos = getclosestpointonnavmesh(var_1b68ba89f80f2b5c);
        var_982663bc9a80a02f = undefined;
        while (!isdefined(var_982663bc9a80a02f)) {
            var_982663bc9a80a02f = function_38e113a4c30f6c0d("obloot_strauss_research_tablet", v_pos, (0, 0, 0), 0, 1, 1, 1);
            waitframe();
        }
        wait(0.5);
        if (isdefined(var_982663bc9a80a02f)) {
            itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_act3_tier3_strauss_research_tablet");
            lootid = function_6d15e119c2779a93(itembundle);
            squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
            foreach (member in squadmembers) {
                member namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, var_982663bc9a80a02f.origin, var_982663bc9a80a02f.index, lootid);
            }
        }
    }
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x378f
// Size: 0x5
function function_f3782faa5666a45c() {
    return 1;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x379c
// Size: 0x5
function function_bfe3066e432b33e() {
    return 1;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a9
// Size: 0x90
function function_b978f5e2753317a4(challengeid) {
    if (!isdefined(challengeid)) {
        return 0;
    }
    if (isdefined(self) && isdefined(self.var_6c29f2fdb0054bbe) && self.var_6c29f2fdb0054bbe.size) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (namespace_8361bad7391de074::function_c7d3c1cb4a3958cf(player, challengeid)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3841
// Size: 0xe
function function_7ee98f5b4994fad8(mission) {
    return 1;
}

// Namespace namespace_5c6deef041b03f11/namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3857
// Size: 0xe
function function_70b80e541c8ef42(mission) {
    return 1;
}

