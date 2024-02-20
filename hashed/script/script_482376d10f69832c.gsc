// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_427ce33ec0c820cf;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_7b2517368c79e5bc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_5815a7cb4d944542;
#using script_5f71ed065b9cea1e;
#using script_6b684505b9959a08;
#using script_3d3d1ef33cecfb62;
#using script_64351208cb856df9;
#using script_6a8ec730b2bfa844;
#using script_2590b7a7de3dfc79;
#using script_686729055b66c6e4;
#using script_43971bbeefd98f05;
#using scripts\engine\trace.gsc;
#using script_638d701d263ee1ed;
#using script_38eb8f4be20d54f4;
#using script_39d11000e476a42a;
#using script_482376d10f69832c;

#namespace namespace_24722a171904c83b;

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x934
// Size: 0x4a
function init() {
    /#
        thread function_de2062aa7eaf5617();
        callback::add("ob_jup_items_contracts_riftrun_hard", &function_ac138c84c0432491);
    #/
    function_8b5b2a3392fc7e2a("ActivityEnd", &function_23b66008ea86e35c);
    level._effect["rift_marked_zombie"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_reward_rift_zombie_death.vfx");
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x985
// Size: 0x171
function function_4318321c0172ec43(var_580db0023b1afd04, var_d7f5721cea7df9c5, var_16093b68c8441bb3, difficulty_region, var_168c108518d4bac9) {
    var_757a604855c8ec90 = spawnstruct();
    var_757a604855c8ec90.var_6c29f2fdb0054bbe = var_16093b68c8441bb3;
    var_757a604855c8ec90.difficulty_region = difficulty_region;
    if (istrue(var_d7f5721cea7df9c5)) {
        function_d7f5721cea7df9c5(var_757a604855c8ec90);
    }
    if (istrue(var_580db0023b1afd04)) {
        var_db1036d6c298e796 = spawnstruct();
        spawn_contract_reward_rift(self, self.var_e0a0dc78cd0e70f3, var_db1036d6c298e796);
        level thread function_f4ca5678b389bda1(var_db1036d6c298e796, self);
        var_182cc1d59535d7d4 = namespace_3dd7203b843229f9::function_7af151bd42e8132d(self, "UseGameModeSetting");
        var_757a604855c8ec90.var_182cc1d59535d7d4 = var_182cc1d59535d7d4;
        var_757a604855c8ec90 thread function_739d8a46061aa4ba();
    }
    if (isdefined(self.var_6c29f2fdb0054bbe) && isdefined(self.var_b90c26f642e9b96e)) {
        var_1b903f780de3dc79 = spawnstruct();
        var_1b903f780de3dc79.scoreevent = self.var_b90c26f642e9b96e;
        var_1b903f780de3dc79.reason = #"hash_e4190edf8f5e7356";
        foreach (player in var_16093b68c8441bb3) {
            player callback::callback("zombie_score_event", var_1b903f780de3dc79);
        }
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafd
// Size: 0xf7
function spawn_contract_reward_rift(var_e6013eac45290cab, var_e0a0dc78cd0e70f3, var_5edef452e5fc2cd7) {
    namespace_c4d0d7d42beedd07::function_1c972fc13937297c("ob_objective_rewards.gsc: Attempting to spawn a contract reward rift for activity instance with variant tag: " + namespace_4fda5d7358015a06::function_a4748b32a824c79c(var_e6013eac45290cab));
    /#
        var_88a08b25571f4a24 = namespace_68375b5cba416e13::function_1edea59f189f9a02(var_e6013eac45290cab, "REV_OB_DEFEND_MERCS", "ob_jup_items_reward_loot_schematic_yellow");
        if (!var_88a08b25571f4a24) {
            namespace_c4d0d7d42beedd07::function_1c5f030d48fdff4c("<unknown string>" + namespace_4fda5d7358015a06::function_a4748b32a824c79c(var_e6013eac45290cab) + "<unknown string>" + "ob_jup_items_reward_loot_schematic_yellow" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
        }
    #/
    var_6f8af5eb76deac21 = spawnstruct();
    if (isdefined(var_e0a0dc78cd0e70f3)) {
        var_6f8af5eb76deac21.var_e0a0dc78cd0e70f3 = var_e0a0dc78cd0e70f3;
    }
    if (isdefined(var_5edef452e5fc2cd7)) {
        var_be39a270e44a0361 = spawnstruct();
        var_6f8af5eb76deac21.var_44fadde66021a763 = var_be39a270e44a0361;
    }
    namespace_68dc261109a9503f::function_ce906635a152d2d0(self, "spawn_contract_reward_rift", var_6f8af5eb76deac21);
    if (isdefined(var_5edef452e5fc2cd7)) {
        thread function_a57eb235aa288f81(var_6f8af5eb76deac21.var_44fadde66021a763, var_5edef452e5fc2cd7, var_e6013eac45290cab);
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfb
// Size: 0x7b
function function_863be9e39e19fe2f(var_2c06da1b550fc8fb, var_182cc1d59535d7d4, lootfunc, var_5812163a4b6704c8, var_3c99a2a84c4b850f) {
    var_bae6a1d8f73bc001 = namespace_9a8748f9afa48155::function_ec54b8019f59c0ef("reward_rift_default");
    var_f07d96bc912b9e7b = namespace_81b7e1672a7e54da::function_4d6ae01e1e47320c("reward_rift_default_behavior");
    var_ce0e8fe5ee941ba9 = &namespace_3dd7203b843229f9::function_885b8eee6652a555;
    namespace_6d633d94b557096d::function_75e180b08f394748(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b, var_2c06da1b550fc8fb, var_182cc1d59535d7d4, var_ce0e8fe5ee941ba9, lootfunc, var_5812163a4b6704c8, undefined, undefined, var_3c99a2a84c4b850f);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc7d
// Size: 0xc9
function private function_a57eb235aa288f81(var_be39a270e44a0361, var_5edef452e5fc2cd7, var_e6013eac45290cab) {
    if (!isdefined(var_be39a270e44a0361)) {
        /#
            assertmsg("Cannot wait for contract reward rift to spawn - undefined objectToNotifyWithSpawnedCaches was supplied!");
        #/
        return;
    }
    if (!isdefined(var_5edef452e5fc2cd7)) {
        /#
            assertmsg("Cannot wait for contract reward rift to spawn - undefined objectToNotifyWithSpawnedRift was supplied!");
        #/
        return;
    }
    if (!isdefined(var_e6013eac45290cab)) {
        /#
            assertmsg("Cannot wait for contract reward rift to spawn - undefined activityInstance was supplied!");
        #/
        return;
    }
    var_9c985bdb5d9108c = var_be39a270e44a0361 waittill("activity_reward_caches_done_spawning");
    if (var_9c985bdb5d9108c.size > 1) {
        namespace_c4d0d7d42beedd07::function_e02e37e34dec2042("Attempted to return a contract reward rift with the activation name " + "spawn_contract_reward_rift" + " but more than one cache was spawned! Only a single cache is expected to spawn with that activation name. Please" + " check your activitydefinition settings for duplicate activity reward caches with that activation name and remove" + " the duplicate (activity variant: " + namespace_4fda5d7358015a06::function_a4748b32a824c79c(var_e6013eac45290cab) + ")");
    }
    if (var_9c985bdb5d9108c.size > 0) {
        var_26462efc3f103314 = var_9c985bdb5d9108c[0];
    } else {
        var_26462efc3f103314 = undefined;
    }
    var_5edef452e5fc2cd7 notify("reward_rift_spawn_done", var_26462efc3f103314);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4d
// Size: 0xb1
function function_9d71b982e1eb2f81(difficulty_region) {
    var_7b60c91792761e4f = #"hash_6b316738ef8d272";
    if (isdefined(difficulty_region)) {
        switch (difficulty_region) {
        case #"hash_7bb2cd766703d463":
            var_7b60c91792761e4f = #"hash_6b316738ef8d272";
            break;
        case #"hash_af83e47edfa8900a":
            var_7b60c91792761e4f = #"hash_4db4235976d94fc7";
            break;
        case #"hash_5343b465e56ec9a4":
            var_7b60c91792761e4f = #"hash_876c51b14bc99659";
            break;
        case #"hash_651f76c0ad6741ec":
            var_7b60c91792761e4f = #"hash_73c4b7d4f0baf972";
            break;
        default:
            var_7b60c91792761e4f = #"hash_6b316738ef8d272";
            break;
        }
    }
    return var_7b60c91792761e4f;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe06
// Size: 0x92
function function_d7f5721cea7df9c5(var_757a604855c8ec90) {
    if (!isdefined(var_757a604855c8ec90)) {
        return;
    }
    var_7b60c91792761e4f = function_9d71b982e1eb2f81(var_757a604855c8ec90.difficulty_region);
    foreach (player in var_757a604855c8ec90.var_6c29f2fdb0054bbe) {
        player namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(var_7b60c91792761e4f, undefined, 1, #"hash_e4190edf8f5e7356");
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9f
// Size: 0x130
function function_739d8a46061aa4ba() {
    a_ai = getaiarrayinradius(self.var_182cc1d59535d7d4.origin, 575);
    var_6bfbb345d937798e = [];
    foreach (player in self.var_6c29f2fdb0054bbe) {
        foreach (ai in a_ai) {
            if (ai.team == player.team || ai.team == "neutral" || array_contains(var_6bfbb345d937798e, ai)) {
                continue;
            }
            var_6bfbb345d937798e = array_add(var_6bfbb345d937798e, ai);
        }
    }
    function_5a2c160d3a406b94(self.var_182cc1d59535d7d4.origin, var_6bfbb345d937798e, 1);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd6
// Size: 0x398
function function_5a2c160d3a406b94(var_f8307191d62cc285, var_e936931c04ab9b3c, var_8d1aa1efbf8b3c6e) {
    foreach (ai in var_e936931c04ab9b3c) {
        if (isalive(ai)) {
            ai function_5c38bc01727d2c5c(1.5);
        }
    }
    wait(0.5);
    var_473ff5b31f1ed342 = array_removedead(var_e936931c04ab9b3c);
    var_473ff5b31f1ed342 = get_array_of_closest(var_f8307191d62cc285, var_473ff5b31f1ed342);
    var_f00cdf3d3bfc5a54 = [];
    foreach (ai in var_473ff5b31f1ed342) {
        if (!isalive(ai)) {
            continue;
        }
        b_skip = 0;
        if (istrue(ai.magic_bullet_shield)) {
            b_skip = 1;
        }
        if (istrue(ai.marked_for_death)) {
            b_skip = 1;
        }
        if (b_skip) {
            ai function_e0d13e2a538e2947();
        } else {
            ai.marked_for_death = 1;
            if (!istrue(ai.var_9eb8bf12bddbe7f6)) {
                ai.var_9eb8bf12bddbe7f6 = 1;
                ai.no_powerups = 1;
                ai.var_7e4b076a06c6df27 = 1;
                ai.full_gib = 1;
                ai.var_745cd904c1ec804c = 1;
                var_f00cdf3d3bfc5a54 = array_add(var_f00cdf3d3bfc5a54, ai);
            }
        }
    }
    var_60d4e0f1aeb32f84 = undefined;
    foreach (ai_killed in var_f00cdf3d3bfc5a54) {
        wait(randomfloatrange(0.05, 0.15));
        if (!isalive(ai_killed)) {
            continue;
        }
        ai_killed function_e0d13e2a538e2947();
        if (istrue(ai_killed.magic_bullet_shield)) {
            continue;
        }
        var_bc8818c262ac2b04 = undefined;
        if (isdefined(ai_killed.aicategory) && !istrue(var_8d1aa1efbf8b3c6e)) {
            if (ai_killed.aicategory == "special") {
                var_bc8818c262ac2b04 = ai_killed.maxhealth * function_519d44e54a9b8ae5("nuke").var_74576b4dd247d7b1;
            } else if (ai_killed.aicategory == "elite" || ai_killed.aicategory == "boss") {
                var_bc8818c262ac2b04 = ai_killed.maxhealth * function_519d44e54a9b8ae5("nuke").var_e896465ad8ccd911;
            }
        }
        if (isdefined(var_bc8818c262ac2b04) && var_bc8818c262ac2b04 < ai_killed.health) {
            if (!isdefined(var_60d4e0f1aeb32f84)) {
                var_60d4e0f1aeb32f84 = spawn("script_model", var_f8307191d62cc285);
            }
            if (var_bc8818c262ac2b04 > 0) {
                ai_killed dodamage(int(var_bc8818c262ac2b04), ai_killed.origin, undefined, var_60d4e0f1aeb32f84, "MOD_UNKNOWN", "none", "none", undefined, 65536);
            }
            ai_killed.marked_for_death = 0;
            ai_killed.var_9eb8bf12bddbe7f6 = 0;
            ai_killed.var_745cd904c1ec804c = 0;
            ai_killed.no_powerups = 0;
            ai_killed.var_7e4b076a06c6df27 = 0;
            ai_killed.full_gib = 0;
        } else {
            ai_killed kill();
        }
    }
    if (isdefined(var_60d4e0f1aeb32f84)) {
        var_60d4e0f1aeb32f84 delete();
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1375
// Size: 0x57
function private function_5c38bc01727d2c5c(var_8c28aac0b76c1e2e) {
    playfxontag(getfx("rift_marked_zombie"), self, "j_spine4");
    namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(var_8c28aac0b76c1e2e);
    params = spawnstruct();
    params.attacker = undefined;
    params.var_51357609845cf128 = gettime();
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13d3
// Size: 0x4d
function private function_e0d13e2a538e2947() {
    namespace_ed7c38f3847343dc::clear_stun();
    params = spawnstruct();
    params.attacker = undefined;
    params.var_51357609845cf128 = gettime();
    stopfxontag(getfx("rift_marked_zombie"), self, "j_spine4");
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0x3c
function function_d67ffd8ae22bf637(cache) {
    var_757a604855c8ec90 = self;
    var_757a604855c8ec90 function_d364b924be9b36e8(cache);
    var_757a604855c8ec90 function_3ed651fb51ed438c(cache);
    var_757a604855c8ec90 function_24781fccafc7f6dc(cache);
    var_757a604855c8ec90 function_d55d0e38986d17f3(cache);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146a
// Size: 0x12b
function function_d364b924be9b36e8(cache) {
    items = [];
    if (getdvarint(@"hash_7661484c77058395", 0)) {
        if (getdvarint(@"hash_73cfb77eb49c943", 0)) {
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_riftrun_hard", 3);
        } else {
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_riftrun_normal", 3);
        }
    } else {
        if (!isdefined(self.difficulty_region)) {
            self.difficulty_region = "";
        }
        switch (self.difficulty_region) {
        case #"hash_7bb2cd766703d463":
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_green", 3);
            break;
        case #"hash_af83e47edfa8900a":
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_yellow", 3);
            break;
        case #"hash_5343b465e56ec9a4":
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_orange", 3);
            break;
        case #"hash_651f76c0ad6741ec":
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_red", 3);
            break;
        default:
            items = function_bc2f4857c90f5344("ob_jup_items_contracts_green", 3);
            break;
        }
    }
    function_fd95ef820bb2b980(items, cache);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159c
// Size: 0x99
function function_24781fccafc7f6dc(cache) {
    if (!getdvarint(@"hash_abc1d9ea495ec189", 0) && !getdvarint(@"hash_7661484c77058395", 0)) {
        return;
    }
    if (!isarray(self.var_19d8d6f6f454266a)) {
        return;
    }
    player = self.var_19d8d6f6f454266a[0];
    if (!isplayer(player)) {
        return;
    }
    if (!istrue(player.var_f618a05d316a2fd6)) {
        return;
    }
    items = function_297f306b101939f6(self);
    if (isarray(items)) {
        function_fd95ef820bb2b980(items, cache);
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c
// Size: 0xb8
function function_297f306b101939f6(var_19cf40c8ea46e1c9) {
    if (!isdefined(var_19cf40c8ea46e1c9.difficulty_region)) {
        return;
    }
    if (var_19cf40c8ea46e1c9.difficulty_region == "difficulty_hard" && !getdvarint(@"hash_7661484c77058395", 0)) {
        if (randomint(100) < getdvarint(@"hash_cdde840571118831", 33)) {
            return [0:"ob_jup_item_key_rift_token_low"];
        }
        return;
    }
    if (var_19cf40c8ea46e1c9.difficulty_region == "difficulty_darkaether" || getdvarint(@"hash_7661484c77058395", 0)) {
        if (randomint(100) < getdvarint(@"hash_ee2108899883315f", 33)) {
            return [0:"ob_jup_item_key_rift_token_high"];
        }
        return;
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fb
// Size: 0x52
function function_2be245cf8652128f() {
    var_1fdcab615049aa6f = [];
    var_1fdcab615049aa6f["REV_OB_ZOMBIE_CONTROL"] = 16643;
    var_1fdcab615049aa6f["REV_OB_SABOTAGE"] = 14707;
    var_1fdcab615049aa6f["REV_OB_ESCORT_ZOMBIES"] = 17063;
    var_1fdcab615049aa6f["REV_OB_WEAPON_STASH"] = 16644;
    var_1fdcab615049aa6f["REV_OB_DEFEND_MERCS"] = 17069;
    var_1fdcab615049aa6f["REV_OB_OUTLAST"] = 17089;
    return var_1fdcab615049aa6f;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x5e
function function_2723a1632cd9aed9() {
    var_f031d67155304339 = [];
    var_f031d67155304339["REV_OB_ZOMBIE_CONTROL"] = "ob_jup_items_quest_loot_zombie_control";
    var_f031d67155304339["REV_OB_SABOTAGE"] = "ob_jup_items_quest_loot_sabotage";
    var_f031d67155304339["REV_OB_ESCORT_ZOMBIES"] = "ob_jup_items_quest_loot_escort";
    var_f031d67155304339["REV_OB_WEAPON_STASH"] = "ob_jup_items_quest_loot_weaponstash";
    var_f031d67155304339["REV_OB_DEFEND_MERCS"] = "ob_jup_items_quest_loot_mercdefend";
    var_f031d67155304339["REV_OB_OUTLAST"] = "ob_jup_items_quest_loot_outlast";
    return var_f031d67155304339;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bb
// Size: 0x16a
function function_f4ca5678b389bda1(var_db1036d6c298e796, var_2f5d509d7b71ce9a, var_e10194ca6271ac0a) {
    if (!isdefined(var_e10194ca6271ac0a)) {
        var_e10194ca6271ac0a = undefined;
    }
    if (!isdefined(var_2f5d509d7b71ce9a)) {
        return;
    }
    var_757a604855c8ec90 = spawnstruct();
    var_757a604855c8ec90.var_c083bd8353c655c1 = namespace_4fda5d7358015a06::function_2dabe17056c2563f(var_2f5d509d7b71ce9a);
    var_757a604855c8ec90.var_cc4e306d6425c182 = [];
    var_757a604855c8ec90.var_33e96096a10a0f25 = [];
    var_757a604855c8ec90.var_1fdcab615049aa6f = [];
    var_757a604855c8ec90.var_f031d67155304339 = [];
    var_757a604855c8ec90.var_1fdcab615049aa6f = function_2be245cf8652128f();
    var_757a604855c8ec90.var_f031d67155304339 = function_2723a1632cd9aed9();
    foreach (player in var_757a604855c8ec90.var_c083bd8353c655c1) {
        if (function_7937b1cfc8818d50(player, var_2f5d509d7b71ce9a, var_757a604855c8ec90)) {
            var_757a604855c8ec90.var_cc4e306d6425c182[var_757a604855c8ec90.var_cc4e306d6425c182.size] = player;
        }
    }
    if (var_757a604855c8ec90.var_cc4e306d6425c182.size == 0) {
        return;
    }
    var_757a604855c8ec90.var_5da0c861642aa1e8 = spawnstruct();
    var_757a604855c8ec90.var_5da0c861642aa1e8.type = var_2f5d509d7b71ce9a.type;
    function_b3fbe14081c02a2c(var_db1036d6c298e796, var_757a604855c8ec90, var_e10194ca6271ac0a);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192c
// Size: 0xc5
function function_b3fbe14081c02a2c(var_db1036d6c298e796, var_757a604855c8ec90, var_6eee8785d833d021) {
    var_e10194ca6271ac0a = undefined;
    if (!isdefined(var_6eee8785d833d021)) {
        var_6eee8785d833d021 = var_db1036d6c298e796 waittill("reward_rift_spawn_done");
        if (!isdefined(var_6eee8785d833d021)) {
            return;
        }
    }
    var_e10194ca6271ac0a = var_6eee8785d833d021;
    namespace_6d633d94b557096d::function_a52e804f95d8ef78(var_e10194ca6271ac0a);
    foreach (player in var_757a604855c8ec90.var_cc4e306d6425c182) {
        if (isplayer(player)) {
            var_757a604855c8ec90.var_33e96096a10a0f25[player getentitynumber()] = namespace_6d633d94b557096d::function_805de4f236be02cc(var_e10194ca6271ac0a, player);
        }
    }
    function_dc1a9b9610b44060(var_e10194ca6271ac0a, var_757a604855c8ec90);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f8
// Size: 0x1dc
function function_dc1a9b9610b44060(var_e10194ca6271ac0a, var_757a604855c8ec90) {
    timer = 15;
    while (timer > 0) {
        foreach (player in var_757a604855c8ec90.var_cc4e306d6425c182) {
            /#
                if (getdvarint(@"hash_9273f5c68dce75e4", 0)) {
                    goto LOC_000000eb;
                }
            #/
            if (isplayer(player)) {
                if (function_9f94c5a87e6da54b(var_757a604855c8ec90, player)) {
                    function_f006e75899cdd353(var_e10194ca6271ac0a, player, var_757a604855c8ec90);
                    var_757a604855c8ec90.var_cc4e306d6425c182 = array_remove(var_757a604855c8ec90.var_cc4e306d6425c182, player);
                LOC_000000eb:
                }
            LOC_000000eb:
            }
        LOC_000000eb:
        }
        if (var_757a604855c8ec90.var_cc4e306d6425c182.size == 0) {
            break;
        }
        wait(1);
        timer = timer - 1;
    }
    var_6552a99327ada555 = var_757a604855c8ec90.var_5da0c861642aa1e8.type;
    if (isdefined(var_6552a99327ada555)) {
        var_40791919d3f24302 = var_757a604855c8ec90.var_f031d67155304339[var_6552a99327ada555];
        if (isdefined(var_40791919d3f24302)) {
            foreach (player in var_757a604855c8ec90.var_cc4e306d6425c182) {
                if (isplayer(player)) {
                    var_cd68c23920cc227f = {var_40791919d3f24302:var_40791919d3f24302, var_6552a99327ada555:var_6552a99327ada555};
                    player callback::add("ob_exfil_success", &function_de8f5de2296c5596, var_cd68c23920cc227f);
                    player callback::add("player_disconnect", &function_de8f5de2296c5596, var_cd68c23920cc227f);
                }
            }
        }
    }
    function_f1c1ef5a544c2add(var_e10194ca6271ac0a);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdb
// Size: 0xa9
function function_f006e75899cdd353(var_e10194ca6271ac0a, player, var_757a604855c8ec90) {
    cache = spawnstruct();
    var_c545f61c9ba000a9 = function_864e6e1dfc3fa879(var_757a604855c8ec90, player);
    if (isdefined(var_c545f61c9ba000a9)) {
        items = function_bc2f4857c90f5344(var_c545f61c9ba000a9, 1);
        function_fd95ef820bb2b980(items, cache);
    } else {
        return;
    }
    var_69281e57808f26f6 = cache.contents[0];
    var_789b03a07b72284c = var_757a604855c8ec90.var_33e96096a10a0f25[player getentitynumber()];
    namespace_6d633d94b557096d::function_8b4f7ed65818ac99(var_e10194ca6271ac0a, player, var_789b03a07b72284c, var_69281e57808f26f6);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8b
// Size: 0xe5
function function_de8f5de2296c5596(var_c83415bd493a8315, var_cd68c23920cc227f) {
    var_6b0364a106b77b84 = {var_5da0c861642aa1e8:{type:var_cd68c23920cc227f.var_6552a99327ada555}};
    if (function_9f94c5a87e6da54b(var_6b0364a106b77b84, self)) {
        items = namespace_49e179ec476603d6::function_bc2f4857c90f5344(var_cd68c23920cc227f.var_40791919d3f24302, 1);
        if (isarray(items) && isstring(items[0])) {
            itembundle = getscriptbundle(function_2ef675c13ca1c4af(%"itemspawnentry:", items[0]));
            if (isdefined(itembundle)) {
                callback::callback("item_exfiled", {lootid:namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle)});
            }
        }
    }
    callback::remove("ob_exfil_success", &function_de8f5de2296c5596, 1);
    callback::remove("player_disconnect", &function_de8f5de2296c5596, 1);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d77
// Size: 0x11f
function function_7937b1cfc8818d50(player, var_2f5d509d7b71ce9a, var_757a604855c8ec90) {
    var_af0662d6485d5d58 = var_2f5d509d7b71ce9a.type;
    if (!isdefined(var_af0662d6485d5d58)) {
        return 0;
    }
    if (!isdefined(player)) {
        return 0;
    }
    if (!isdefined(var_757a604855c8ec90) || !isdefined(var_757a604855c8ec90.var_1fdcab615049aa6f)) {
        return 0;
    }
    if (!isdefined(player.var_754fe06b68c0554b)) {
        player.var_754fe06b68c0554b = [];
    }
    foreach (schematic in player.var_754fe06b68c0554b) {
        if (schematic == var_af0662d6485d5d58) {
            return 0;
        }
    }
    quest = var_757a604855c8ec90.var_1fdcab615049aa6f[var_af0662d6485d5d58];
    if (!isdefined(quest)) {
        return 0;
    }
    /#
        if (getdvarint(@"hash_387419b90066e4b5", 0)) {
            if (function_2ec9ca2251929c15(player, quest)) {
                return 1;
            }
        }
    #/
    if (pmc_missions::function_c7d3c1cb4a3958cf(player, quest)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9e
// Size: 0x199
function function_9f94c5a87e6da54b(var_757a604855c8ec90, player) {
    var_af0662d6485d5d58 = var_757a604855c8ec90.var_5da0c861642aa1e8.type;
    var_919ba53f6defbc64 = [];
    missionid = "";
    if (!isdefined(var_af0662d6485d5d58)) {
        return 0;
    }
    switch (var_af0662d6485d5d58) {
    case #"hash_427820bb3395e2bf":
        var_919ba53f6defbc64[0] = 16965;
        var_919ba53f6defbc64[1] = 16970;
        missionid = 16643;
        break;
    case #"hash_5191681fd986c4eb":
        var_919ba53f6defbc64[0] = 16133;
        var_919ba53f6defbc64[1] = 16134;
        var_919ba53f6defbc64[2] = 16135;
        missionid = 14707;
        break;
    case #"hash_40d422a1ae5ecf0f":
        var_919ba53f6defbc64[0] = 17060;
        var_919ba53f6defbc64[1] = 17061;
        var_919ba53f6defbc64[2] = 17062;
        missionid = 17063;
        break;
    case #"hash_bcceffcc02978e65":
        var_919ba53f6defbc64[0] = 16636;
        var_919ba53f6defbc64[1] = 16950;
        var_919ba53f6defbc64[2] = 16951;
        missionid = 16644;
        break;
    case #"hash_b034a4d29df58c9a":
        var_919ba53f6defbc64[0] = 17066;
        var_919ba53f6defbc64[1] = 17067;
        var_919ba53f6defbc64[2] = 17068;
        missionid = 17069;
        break;
    case #"hash_17b1c4f2de901a59":
        var_919ba53f6defbc64[0] = 17087;
        var_919ba53f6defbc64[1] = 17088;
        missionid = 17089;
        break;
    default:
        return 0;
        break;
    }
    /#
        if (getdvarint(@"hash_387419b90066e4b5", 0)) {
            if (function_534aa21626b78242(player, missionid, var_919ba53f6defbc64)) {
                return 1;
            } else {
                return 0;
            }
        }
    #/
    if (function_d97cb9fd43673c44(player, missionid, var_919ba53f6defbc64)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203f
// Size: 0xa5
function function_864e6e1dfc3fa879(var_757a604855c8ec90, player) {
    var_af0662d6485d5d58 = var_757a604855c8ec90.var_5da0c861642aa1e8.type;
    if (!isdefined(var_af0662d6485d5d58)) {
        return;
    }
    if (!isdefined(var_757a604855c8ec90) || !isdefined(var_757a604855c8ec90.var_f031d67155304339)) {
        return;
    }
    if (isdefined(var_757a604855c8ec90.var_f031d67155304339[var_af0662d6485d5d58])) {
        if (!isdefined(player.var_754fe06b68c0554b)) {
            player.var_754fe06b68c0554b = [];
        }
        player.var_754fe06b68c0554b[player.var_754fe06b68c0554b.size] = var_af0662d6485d5d58;
    }
    return var_757a604855c8ec90.var_f031d67155304339[var_af0662d6485d5d58];
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ec
// Size: 0xc0
function function_d97cb9fd43673c44(player, challengeid, var_919ba53f6defbc64) {
    if (!isplayer(player)) {
        return 0;
    }
    if (getdvarint(@"hash_7c5a823345cc6183", 0)) {
        return 1;
    } else if (pmc_missions::function_c7d3c1cb4a3958cf(player, challengeid) && !pmc_missions::function_62b41959b3c5a9ca(player, challengeid)) {
        if (isarray(var_919ba53f6defbc64) && var_919ba53f6defbc64.size > 0) {
            foreach (id in var_919ba53f6defbc64) {
                if (!pmc_missions::function_62b41959b3c5a9ca(player, id)) {
                    return 0;
                }
            }
            return 1;
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b4
// Size: 0x124
function function_1b907bcbe2da5ad7() {
    var_1a2b600a06ec21f4 = function_1e231fc15fdab31d();
    if (isdefined(var_1a2b600a06ec21f4) && isdefined(self.difficulty_region)) {
        if (getdvarint(@"hash_dd47e07605565dd8", -1) >= 0) {
            return function_51d76700600cebe3(getdvarint(@"hash_dd47e07605565dd8", -1));
        }
        switch (self.difficulty_region) {
        case #"hash_7bb2cd766703d463":
            if (isdefined(var_1a2b600a06ec21f4.var_e5501e76175e89d8)) {
                return function_51d76700600cebe3(var_1a2b600a06ec21f4.var_e5501e76175e89d8);
            }
            break;
        case #"hash_af83e47edfa8900a":
            if (isdefined(var_1a2b600a06ec21f4.var_5aa095e9ecdb25e5)) {
                return function_51d76700600cebe3(var_1a2b600a06ec21f4.var_5aa095e9ecdb25e5);
            }
            break;
        case #"hash_5343b465e56ec9a4":
            if (isdefined(var_1a2b600a06ec21f4.var_35605faa1dfd28f)) {
                return function_51d76700600cebe3(var_1a2b600a06ec21f4.var_35605faa1dfd28f);
            }
            break;
        default:
            if (isdefined(var_1a2b600a06ec21f4.var_e5501e76175e89d8)) {
                return function_51d76700600cebe3(var_1a2b600a06ec21f4.var_e5501e76175e89d8);
            }
            break;
        }
    }
    return 0;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e0
// Size: 0x27c
function function_3ed651fb51ed438c(cache) {
    if (!isdefined(self.var_2f5d509d7b71ce9a)) {
        return;
    }
    if (!isdefined(self.difficulty_region)) {
        self.difficulty_region = "";
    }
    var_2f5d509d7b71ce9a = self.var_2f5d509d7b71ce9a;
    if (!isdefined(var_2f5d509d7b71ce9a.var_bfde552b90af5b08)) {
        var_2f5d509d7b71ce9a.var_bfde552b90af5b08 = 0;
        var_5154b3fd66de98e = 0;
        if (getdvarint(@"hash_7661484c77058395", 0)) {
            if (getdvarint(@"hash_73cfb77eb49c943", 0) && isdefined(level.var_e345b15591192b73)) {
                var_5154b3fd66de98e = 1;
            }
        }
        if (function_1b907bcbe2da5ad7() || istrue(var_5154b3fd66de98e)) {
            var_2f5d509d7b71ce9a.var_bfde552b90af5b08 = 1;
        } else {
            return;
        }
        var_2f5d509d7b71ce9a.var_27974d271f391cc2 = [];
        if (getdvarint(@"hash_7661484c77058395", 0)) {
            if (getdvarint(@"hash_73cfb77eb49c943", 0) && isdefined(level.var_e345b15591192b73)) {
                switch (level.var_e345b15591192b73) {
                case 1:
                    var_2f5d509d7b71ce9a.var_27974d271f391cc2 = [0:"ob_jup_item_schematic_classified_dog_bone"];
                    break;
                case 2:
                    var_2f5d509d7b71ce9a.var_27974d271f391cc2 = [0:"ob_jup_item_schematic_classified_golden_armor_plate"];
                    break;
                case 3:
                    var_2f5d509d7b71ce9a.var_27974d271f391cc2 = [0:"ob_jup_item_schematic_classified_aetherblade"];
                    break;
                default:
                    break;
                }
            }
        } else {
            switch (self.difficulty_region) {
            case #"hash_7bb2cd766703d463":
                var_2f5d509d7b71ce9a.var_27974d271f391cc2 = function_bc2f4857c90f5344("ob_jup_items_reward_loot_schematic_green", 1);
                break;
            case #"hash_af83e47edfa8900a":
                var_2f5d509d7b71ce9a.var_27974d271f391cc2 = function_bc2f4857c90f5344("ob_jup_items_reward_loot_schematic_yellow", 1);
                break;
            case #"hash_5343b465e56ec9a4":
                var_2f5d509d7b71ce9a.var_27974d271f391cc2 = function_bc2f4857c90f5344("ob_jup_items_reward_loot_schematic_orange", 1);
                break;
            default:
                var_2f5d509d7b71ce9a.var_27974d271f391cc2 = function_bc2f4857c90f5344("ob_jup_items_reward_loot_schematic_green", 1);
                break;
            }
        }
    }
    if (istrue(var_2f5d509d7b71ce9a.var_bfde552b90af5b08) && isdefined(var_2f5d509d7b71ce9a.var_27974d271f391cc2)) {
        function_fd95ef820bb2b980(var_2f5d509d7b71ce9a.var_27974d271f391cc2, cache);
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2563
// Size: 0xee
function function_d55d0e38986d17f3(cache) {
    if (!isdefined(self.var_2f5d509d7b71ce9a)) {
        return;
    }
    var_2f5d509d7b71ce9a = self.var_2f5d509d7b71ce9a;
    var_f279996e2fdbdd12 = [];
    var_f279996e2fdbdd12 = array_add(var_f279996e2fdbdd12, "ob_jup_item_revive_self_revive");
    var_c083bd8353c655c1 = namespace_4fda5d7358015a06::function_2dabe17056c2563f(var_2f5d509d7b71ce9a);
    if (isdefined(var_c083bd8353c655c1)) {
        if (is_equal(var_c083bd8353c655c1.size, 1) && !istrue(var_c083bd8353c655c1[0].var_3ecab5a58be77f0e)) {
            var_c083bd8353c655c1[0].var_3ecab5a58be77f0e = 1;
            function_fd95ef820bb2b980(var_f279996e2fdbdd12, cache);
        } else {
            foreach (player in var_c083bd8353c655c1) {
                player.var_3ecab5a58be77f0e = 1;
            }
        }
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2658
// Size: 0x6c
function function_fd95ef820bb2b980(items, cache) {
    foreach (item in items) {
        if (!isdefined(item)) {
            continue;
        }
        namespace_3883e3399f2870b5::function_ff5a53c1d3232e2f(cache, 1, item);
    }
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26cb
// Size: 0x188
function function_b3c1e8c1d1b05b20(center_origin, n_radius, var_cd00b21daa6ae0b4) {
    var_f10d2bae0aa4fce7 = [];
    var_46edfbf5c8ec3711 = [];
    var_5ac1024b00cecc71 = (0, 0, 48);
    i = 0;
    while (i < 360) {
        x1 = n_radius * cos(i * 57.2958);
        y1 = n_radius * sin(i * 57.2958);
        var_28bcdecf0f208418 = center_origin + (x1, y1, 0);
        pos_on_navmesh = getclosestpointonnavmesh(var_28bcdecf0f208418);
        if (isdefined(pos_on_navmesh)) {
            var_80d60a888604dbda = namespace_2a184fc4902783dc::ray_trace_passed(center_origin + var_5ac1024b00cecc71, pos_on_navmesh + var_5ac1024b00cecc71, self.var_6c29f2fdb0054bbe);
            if (istrue(var_80d60a888604dbda)) {
                var_46edfbf5c8ec3711[var_46edfbf5c8ec3711.size] = pos_on_navmesh;
            }
        }
        i = i + 20;
    }
    if (is_equal(var_46edfbf5c8ec3711.size, 0)) {
        pos_on_navmesh = getclosestpointonnavmesh(center_origin);
        var_46edfbf5c8ec3711[var_46edfbf5c8ec3711.size] = pos_on_navmesh;
    }
    for (i = 0; i < var_46edfbf5c8ec3711.size; i++) {
        s_spot = spawnstruct();
        s_spot.origin = var_46edfbf5c8ec3711[i];
        s_spot.angles = (0, 0, 0);
        var_f10d2bae0aa4fce7[var_f10d2bae0aa4fce7.size] = s_spot;
    }
    if (istrue(var_cd00b21daa6ae0b4)) {
        return var_f10d2bae0aa4fce7;
    }
    var_a0c3489d2ad5aa8d = randomintrange(0, var_f10d2bae0aa4fce7.size);
    return var_f10d2bae0aa4fce7[var_a0c3489d2ad5aa8d];
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x285b
// Size: 0xa7
function private function_23b66008ea86e35c(var_b381b0883bcd4847) {
    if (!istrue(function_bdd22095c4312f34(self)) || !isdefined(level.var_61a5fdd9ce50aa4a)) {
        return;
    }
    var_571e8bd2c6ff9bf = function_c6bad126e3d76334();
    var_a8a21fdc220ea3d5 = function_7224bb7d017a588a();
    if (!var_571e8bd2c6ff9bf && !var_a8a21fdc220ea3d5 && !isdefined(self.var_b90c26f642e9b96e)) {
        return;
    }
    var_84fe3185d80d053b = function_208c5a28152e1218();
    var_b351958e76ad6ed1 = function_63be43d99c4aca4a();
    var_c083bd8353c655c1 = function_2dabe17056c2563f(self);
    [[ level.var_61a5fdd9ce50aa4a ]](var_a8a21fdc220ea3d5, var_571e8bd2c6ff9bf, var_c083bd8353c655c1, var_84fe3185d80d053b, var_b351958e76ad6ed1);
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2909
// Size: 0x35
function private function_208c5a28152e1218() {
    var_84fe3185d80d053b = "";
    if (isdefined(level.var_fac39a693f085779)) {
        var_84fe3185d80d053b = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
    }
    return var_84fe3185d80d053b;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2946
// Size: 0x1c
function private function_63be43d99c4aca4a() {
    var_b351958e76ad6ed1 = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
    return var_b351958e76ad6ed1;
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x296a
// Size: 0x195
function function_de2062aa7eaf5617(params) {
    /#
        wait(5);
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_891f5abdda30f2cb, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b06
// Size: 0x25c
function function_891f5abdda30f2cb(params) {
    /#
        var_317e5132733169cb = getclosestpointonnavmesh((level.players[0].origin[0], level.players[0].origin[1], level.players[0].origin[2]));
        var_17e72d451d0c9aca = 0;
        if (is_equal(params[0], "<unknown string>")) {
            var_17e72d451d0c9aca = 1;
        } else if (is_equal(params[0], "<unknown string>")) {
            var_17e72d451d0c9aca = 1;
            var_11eb9d2d65d00180 = getdvarint(@"hash_eff5e2218caf8354", 0);
            setdvar(@"hash_eff5e2218caf8354", 1);
        } else {
            var_317e5132733169cb = getclosestpointonnavmesh((level.players[0].origin[0] + 64, level.players[0].origin[1] + 64, level.players[0].origin[2]));
        }
        spawn_point = level.players[0].origin;
        if (isdefined(var_317e5132733169cb)) {
            spawn_point = var_317e5132733169cb;
        }
        a_players = level.players;
        difficulty_region = "<unknown string>";
        if (is_equal(params[0], "<unknown string>")) {
            spawn_point = spawn_point + (600, 0, 0);
        } else if (is_equal(params[0], "<unknown string>")) {
            a_players = array_remove(a_players, level.players[0]);
        } else if (isdefined(params[0])) {
            difficulty_region = params[0];
        }
        if (is_equal(difficulty_region, "<unknown string>")) {
            if (isdefined(level.var_fac39a693f085779)) {
                difficulty_region = [[ level.var_fac39a693f085779 ]](spawn_point);
            }
        }
        var_b351958e76ad6ed1 = "<unknown string>";
        var_b351958e76ad6ed1 = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(spawn_point);
        function_4318321c0172ec43(0, 1, a_players, difficulty_region, var_b351958e76ad6ed1);
        function_35a0497a05c5f84(a_players, difficulty_region, var_b351958e76ad6ed1, spawn_point, level.players[0].angles, var_17e72d451d0c9aca);
        if (is_equal(params[0], "<unknown string>")) {
            setdvar(@"hash_eff5e2218caf8354", var_11eb9d2d65d00180);
        }
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2d69
// Size: 0x124
function function_35a0497a05c5f84(a_players, difficulty_region, var_206e4103dc80d41b, spawn_point, spawn_angles, var_17e72d451d0c9aca) {
    /#
        var_2c06da1b550fc8fb = [];
        foreach (player in a_players) {
            var_2c06da1b550fc8fb[var_2c06da1b550fc8fb.size] = [0:player];
        }
        var_182cc1d59535d7d4 = namespace_71ca15b739deab72::function_3ae7f99339b96499(spawn_point, var_17e72d451d0c9aca);
        lootfunc = &function_7ca191e9301a4a83;
        var_5812163a4b6704c8 = {var_206e4103dc80d41b:var_206e4103dc80d41b, difficulty_region:difficulty_region};
        var_757a604855c8ec90 = spawnstruct();
        var_757a604855c8ec90.var_182cc1d59535d7d4 = var_182cc1d59535d7d4;
        var_757a604855c8ec90.var_6c29f2fdb0054bbe = level.players;
        var_757a604855c8ec90 thread function_739d8a46061aa4ba();
        function_863be9e39e19fe2f(var_2c06da1b550fc8fb, var_182cc1d59535d7d4, lootfunc, var_5812163a4b6704c8);
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e94
// Size: 0xdd
function function_7ca191e9301a4a83(var_5812163a4b6704c8) {
    /#
        difficulty_region = var_5812163a4b6704c8.difficulty_region;
        var_206e4103dc80d41b = var_5812163a4b6704c8.var_206e4103dc80d41b;
        var_19d8d6f6f454266a = var_5812163a4b6704c8.var_19d8d6f6f454266a;
        var_757a604855c8ec90 = spawnstruct();
        var_757a604855c8ec90.difficulty_region = difficulty_region;
        var_757a604855c8ec90.var_206e4103dc80d41b = var_206e4103dc80d41b;
        var_757a604855c8ec90.var_19d8d6f6f454266a = var_19d8d6f6f454266a;
        var_757a604855c8ec90.var_2f5d509d7b71ce9a = spawnstruct();
        var_757a604855c8ec90.var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe = level.players;
        cache = spawnstruct();
        var_757a604855c8ec90 namespace_e8853d3344e33cf6::function_d67ffd8ae22bf637(cache);
        return cache.contents;
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f78
// Size: 0x1e0
function function_cdffe21a96903d57(params) {
    /#
        function_9a56442a0d3e18f();
        foreach (player in level.players) {
            if (player.name == params[1]) {
                if (params[0] == "<unknown string>") {
                    iprintlnbold("<unknown string>" + player.name + "<unknown string>");
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[0].completed = 1;
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[1].completed = 1;
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[2].completed = 1;
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[3].completed = 0;
                } else {
                    iprintlnbold("<unknown string>" + player.name + "<unknown string>");
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[0].completed = 0;
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[1].completed = 0;
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[2].completed = 0;
                    player.var_35e979f919589ba3.var_351b70af7ba3f2[3].completed = 0;
                }
            }
        }
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x315f
// Size: 0xc4
function function_534aa21626b78242(player, challengeid, var_919ba53f6defbc64) {
    /#
        if (!isplayer(player)) {
            return 0;
        }
        if (getdvarint(@"hash_7c5a823345cc6183", 0)) {
            return 1;
        } else if (function_2ec9ca2251929c15(player, challengeid) && !function_8dbce1bc41af1b64(player, challengeid)) {
            if (isarray(var_919ba53f6defbc64) && var_919ba53f6defbc64.size > 0) {
                foreach (id in var_919ba53f6defbc64) {
                    if (!function_8dbce1bc41af1b64(player, id)) {
                        return 0;
                    }
                }
                return 1;
            }
            return 1;
        }
        return 0;
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x322a
// Size: 0xe3
function function_2ec9ca2251929c15(player, challengeid) {
    /#
        if (!isdefined(challengeid)) {
            return 0;
        }
        for (missionindex = 0; missionindex < 3; missionindex++) {
            challenge = player.var_35e979f919589ba3.var_560fa645d1b57df2;
            if (isdefined(challenge) && challenge > 0 && challenge == challengeid) {
                return 1;
            }
            if (isdefined(challenge) && challenge > 0) {
                for (childindex = 0; childindex < player.var_35e979f919589ba3.var_351b70af7ba3f2.size; childindex++) {
                    child = player.var_35e979f919589ba3.var_351b70af7ba3f2[childindex];
                    if (isdefined(child) && child.mission == challengeid) {
                        return 1;
                    }
                }
            }
        }
        return 0;
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3314
// Size: 0xd3
function function_8dbce1bc41af1b64(player, challengeid) {
    /#
        for (missionindex = 0; missionindex < 3; missionindex++) {
            challenge = player.var_35e979f919589ba3.var_560fa645d1b57df2;
            if (!isdefined(challenge) || challenge <= 0) {
                continue;
            }
            for (childindex = 0; childindex < player.var_35e979f919589ba3.var_351b70af7ba3f2.size; childindex++) {
                child = player.var_35e979f919589ba3.var_351b70af7ba3f2[childindex];
                if (isdefined(child) && child.mission == challengeid) {
                    return child.completed;
                }
            }
        }
        return 0;
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33ee
// Size: 0x251
function function_9a56442a0d3e18f() {
    /#
        foreach (player in level.players) {
            iprintlnbold("<unknown string>" + player.name + "<unknown string>");
            player.var_35e979f919589ba3 = spawnstruct();
            player.var_35e979f919589ba3.var_560fa645d1b57df2 = 16132;
            player.var_35e979f919589ba3.var_351b70af7ba3f2 = [];
            player.var_35e979f919589ba3.var_351b70af7ba3f2[0] = spawnstruct();
            player.var_35e979f919589ba3.var_351b70af7ba3f2[0].mission = 16133;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[0].completed = 1;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[1] = spawnstruct();
            player.var_35e979f919589ba3.var_351b70af7ba3f2[1].mission = 16134;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[1].completed = 1;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[2] = spawnstruct();
            player.var_35e979f919589ba3.var_351b70af7ba3f2[2].mission = 16135;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[2].completed = 1;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[3] = spawnstruct();
            player.var_35e979f919589ba3.var_351b70af7ba3f2[3].mission = 14707;
            player.var_35e979f919589ba3.var_351b70af7ba3f2[3].completed = 0;
        }
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3646
// Size: 0xa0
function function_cdd311c6e43e2ca3() {
    /#
        if (getdvarint(@"hash_387419b90066e4b5", 0)) {
            wait(6);
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
            namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>" + self.name, "<unknown string>" + self.name, &function_cdffe21a96903d57, 1);
            namespace_b032b0cc17b10064::function_fe953f000498048f();
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
            namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>" + self.name, "<unknown string>" + self.name, &function_cdffe21a96903d57, 1);
            namespace_b032b0cc17b10064::function_fe953f000498048f();
            function_9a56442a0d3e18f();
        }
    #/
}

// Namespace namespace_24722a171904c83b/namespace_e8853d3344e33cf6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36ed
// Size: 0x1e
function function_ac138c84c0432491(params) {
    /#
        self endon("<unknown string>");
        thread function_cdd311c6e43e2ca3();
    #/
}

