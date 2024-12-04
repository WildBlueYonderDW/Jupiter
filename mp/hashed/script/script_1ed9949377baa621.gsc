#using script_118c3165d7948d8b;
#using script_1f97a44d1761c919;
#using script_22f1701e151b9d12;
#using script_3a13b8032b62a5e6;
#using script_3e2f8cc477d57433;
#using script_3e34d236a84cfd96;
#using script_42f1b4ddcbbf98b4;
#using script_485622d93fa7e4cf;
#using script_58be75c518bf0d40;
#using script_600b944a95c3a7bf;
#using script_7b2517368c79e5bc;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\objidpoolmanager;

#namespace namespace_c241d588869e3606;

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x893
// Size: 0x19
function private autoexec __init__system__() {
    system::register(#"hash_e73406fc3d33467a", undefined, &__init__, undefined);
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b4
// Size: 0x140
function __init__() {
    if (!getdvarint(@"hash_abc1d9ea495ec189", 0)) {
        return;
    }
    level.var_d0ae7d85b0070ba0 = &function_e3727c08fb1fccd3;
    level._effect["rift_gate_contract_streak_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_trail_toxic.vfx");
    level._effect["rift_gate_contract_streak_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_trail_elec.vfx");
    level._effect["rift_gate_contract_streak_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_trail_fire.vfx");
    level._effect["rift_gate_aether_tear_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_outbreak_tear_loop_green.vfx");
    level._effect["rift_gate_aether_tear_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_outbreak_tear_loop_yellow.vfx");
    level._effect["rift_gate_aether_tear_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_outbreak_tear_loop_red.vfx");
    level._effect["rift_gate_contract_glow_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_activity_phone_poison.vfx");
    level._effect["rift_gate_contract_glow_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_activity_phone_elec.vfx");
    level._effect["rift_gate_contract_glow_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_activity_phone_fire.vfx");
    callback::add("exited_aether_tear", &function_fde77e1c68b8218);
    callback::add("big_bounty_target_spawned", &function_19e866494b6bb2d8);
    callback::add("big_bounty_quest_contract_starting", &function_90a1c6f54083cb20);
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9fc
// Size: 0x28
function function_e1312e922e4654b5(player) {
    if (getdvarint(@"hash_67e441ba61ff128a", 0)) {
        return 1;
    }
    return player namespace_510e82113265fae9::function_3bb8b73991355a1(0);
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa2d
// Size: 0x3e
function function_e3727c08fb1fccd3(player) {
    if (getdvarint(@"hash_abc1d9ea495ec189", 0) == 0 || istrue(player.var_f618a05d316a2fd6) || !function_e1312e922e4654b5(player)) {
        return false;
    }
    return true;
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa74
// Size: 0xcf
function function_fde77e1c68b8218(params) {
    if (!isplayer(params.player)) {
        return;
    }
    if (istrue(params.instance.var_2142d16e683eb8d7)) {
        return;
    }
    player = params.player;
    v_loc = params.instance.exit_point;
    v_angles = params.instance.playerangles;
    var_ffad6ab8078b60b7 = params.player function_ba2121dc766a1ac3();
    if (var_ffad6ab8078b60b7.size) {
        params.instance.var_2142d16e683eb8d7 = 1;
        function_c2a41406b8cd7098(params, var_ffad6ab8078b60b7);
    }
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xb4b
// Size: 0x1f7
function private function_c2a41406b8cd7098(params, var_ffad6ab8078b60b7) {
    player = params.player;
    v_start = params.instance.exit_point;
    v_angles = params.instance.playerangles;
    instance = params.instance;
    if (!isdefined(v_angles)) {
        v_angles = player.angles;
    }
    var_ae661a94e0b1221e = v_start + anglestoforward(v_angles) * randomintrange(4500, 5000) + (0, 0, 200);
    var_ae661994e0b11feb = v_start + rotatevector(anglestoforward(v_angles) * randomintrange(4500, 5000), (0, -10, 0)) + (0, 0, 200);
    var_ae661894e0b11db8 = v_start + rotatevector(anglestoforward(v_angles) * randomintrange(4500, 5000), (0, 10, 0)) + (0, 0, 200);
    var_91cc019ad690c815 = [var_ae661a94e0b1221e, var_ae661994e0b11feb, var_ae661894e0b11db8];
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    foreach (lootid in var_ffad6ab8078b60b7) {
        if (var_91cc019ad690c815.size == 0) {
            break;
        }
        str_type = function_45d2185ed093391e(lootid);
        if (isdefined(str_type)) {
            v_loc = var_91cc019ad690c815[0];
            var_91cc019ad690c815 = array_remove(var_91cc019ad690c815, v_loc);
            instance thread function_72007910bbbe62bb(v_loc, str_type, a_squad, lootid);
        }
    }
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xd4a
// Size: 0x1d7
function private function_72007910bbbe62bb(v_loc, str_type, a_players, lootid) {
    level endon("game_ended");
    aethertear = utility::spawn_model("jup_zm_aethertear_s1_quest_" + str_type, v_loc);
    aethertear hide();
    foreach (player in a_players) {
        aethertear showtoplayer(player);
    }
    aethertear setscriptablepartstate("body_aethertear", "usable");
    aethertear setscriptablepartstate("entrance_vfx", "on");
    n_timer = 90;
    n_start_time = gettime();
    var_8356321c5f5eb4c3 = undefined;
    trigger = spawn("trigger_radius", v_loc, 0, 100, 100);
    while (isdefined(trigger)) {
        player = trigger wait_for_trigger_or_timeout(n_timer);
        if (isplayer(player) && array_contains(a_players, player) && !player ent_flag("teleporting")) {
            var_ffad6ab8078b60b7 = player function_ba2121dc766a1ac3();
            if (!isdefined(var_8356321c5f5eb4c3) && array_contains(var_ffad6ab8078b60b7, lootid)) {
                spawnid = lootid;
                var_8356321c5f5eb4c3 = player;
                var_8356321c5f5eb4c3 thread function_82c5fb1ff2519f0d(self, v_loc, a_players, spawnid);
                aethertear setscriptablepartstate("entrance_vfx", "on");
                waitframe();
                continue;
            }
            if (isdefined(var_8356321c5f5eb4c3) && isalive(var_8356321c5f5eb4c3)) {
                var_8356321c5f5eb4c3 utility::ent_flag_waitopen("teleporting");
                player function_82c5fb1ff2519f0d(self, v_loc);
            }
        }
    }
    if (isdefined(trigger)) {
        trigger delete();
    }
    if (isdefined(aethertear)) {
        aethertear delete();
    }
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf29
// Size: 0x37
function private wait_for_trigger_or_timeout(n_timeout) {
    self endon("death");
    self endon("trigger_timeout");
    thread function_b4b04de87729a6f3(n_timeout);
    self waittill("trigger", player);
    return player;
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf69
// Size: 0x6c
function private function_45d2185ed093391e(lootid) {
    itembundlename = namespace_2abc885019e1956::function_fc925a153c7fd55c(lootid);
    if (issubstr(itembundlename, "toxic")) {
        str_type = "toxic";
    } else if (issubstr(itembundlename, "electric")) {
        str_type = "electric";
    } else if (issubstr(itembundlename, "fire")) {
        str_type = "fire";
    }
    return str_type;
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfde
// Size: 0xf2
function private function_ba2121dc766a1ac3() {
    var_3fa0ceb5fb31d6b = [];
    var_421f1da1a7cf188f = "ob_jup_items_keys_rift_gate_season1";
    itemlistbundle = getscriptbundle("itemspawnlist:" + var_421f1da1a7cf188f);
    foreach (itementry in itemlistbundle.itementries) {
        itembundle = getscriptbundle("itemspawnentry:" + itementry.itemspawnentry);
        if (isdefined(itembundle) && !issubstr(itembundle.ref, "attuned")) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(itembundle.ref);
            if (isdefined(lootid)) {
                var_3fa0ceb5fb31d6b = function_6d6af8144a5131f1(var_3fa0ceb5fb31d6b, lootid);
            }
        }
    }
    return function_5f3b67bb1be94acf(var_3fa0ceb5fb31d6b);
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d9
// Size: 0x66
function function_5f3b67bb1be94acf(var_3fa0ceb5fb31d6b) {
    var_f6898e71aa21712a = [];
    backpacksize = namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        currentlootid = namespace_feea61bc660e9e0f::function_d870b2c45335bd88(i);
        if (array_contains(var_3fa0ceb5fb31d6b, currentlootid)) {
            var_f6898e71aa21712a = function_6d6af8144a5131f1(var_f6898e71aa21712a, currentlootid);
        }
    }
    return var_f6898e71aa21712a;
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1148
// Size: 0x2e7
function private function_82c5fb1ff2519f0d(var_2afa3ed3b5a38ad6, v_portal, a_players, lootid) {
    self endon("death_or_disconnect");
    ent_flag_set("teleporting");
    self playsoundevent("snd_aethertear_teleport_plr");
    self freezecontrols(1);
    var_e55048a9812bc496 = spawn("script_model", self.origin);
    var_e55048a9812bc496 setmodel("tag_origin");
    self playerlinkto(var_e55048a9812bc496);
    if (isdefined(lootid)) {
        itembundlename = namespace_2abc885019e1956::function_fc925a153c7fd55c(lootid);
        function_d9ea41b8d6c2f159(v_portal, itembundlename);
        namespace_feea61bc660e9e0f::function_181a584e4a68d5d6(lootid);
        while (true) {
            level waittill("gate_quest_contract_starter_spawned", params);
            if (isdefined(params.player) && params.player == self && isdefined(params.instance.var_b189a678c1c3489a)) {
                params.instance.var_295815e7263cda4d = self;
                var_2afa3ed3b5a38ad6.v_starter = params.instance.var_b189a678c1c3489a.origin;
                params.instance.quest_objid = namespace_871f41e67db0bf7a::function_40062e64625f8b19("jup_ob_s1_quest_contract_marker");
                update_objective_position(params.instance.quest_objid, var_2afa3ed3b5a38ad6.v_starter);
                function_9cad42ac02eff950(params.instance.quest_objid);
                foreach (player in a_players) {
                    objective_playermask_addshowplayer(params.instance.quest_objid, player);
                }
                break;
            }
        }
    }
    thread namespace_5d8c3870222947b5::function_7669f67b44245f73();
    v_starter = var_2afa3ed3b5a38ad6.v_starter;
    wait 1;
    var_8afc7e276a01ea96 = 4000;
    var_3d03754756a9cd41 = 2500;
    v_target = v_starter + (0, 0, var_3d03754756a9cd41);
    v_teleport = v_target + vectornormalize(v_portal - v_target) * var_8afc7e276a01ea96;
    v_angles = vectortoangles(v_starter - v_teleport);
    self unlink();
    var_e55048a9812bc496 delete();
    self setorigin(v_teleport);
    self setplayerangles(v_angles);
    self freezecontrols(0);
    ent_flag_clear("teleporting");
    if (isdefined(lootid)) {
        wait 0.75;
        level thread function_af7a62a8522565bd(self.origin, params.instance.var_b189a678c1c3489a, a_players, itembundlename);
    }
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1437
// Size: 0xf9
function private function_d9ea41b8d6c2f159(v_portal, itembundlename) {
    if (issubstr(itembundlename, "toxic")) {
        str_difficulty = "difficulty_easy";
        str_ai = "zombie_mimic_hvt";
    } else if (issubstr(itembundlename, "electric")) {
        str_difficulty = "difficulty_normal";
        str_ai = "zombie_disciple_hvt";
    } else {
        str_difficulty = "difficulty_hard";
        str_ai = "zombie_mangler_hvt";
    }
    /#
        if (level.mapname == "<dev string:x1c>" || level.mapname == "<dev string:x37>") {
            str_difficulty = undefined;
        }
    #/
    var_f923d1b5e7f75c3b = namespace_27def95c6086c32a::function_f805f042fa2f4b2(1);
    var_f923d1b5e7f75c3b.var_b20fac6bac1d6fde = self;
    var_f923d1b5e7f75c3b.str_ai = str_ai;
    while (true) {
        b_spawned = namespace_af57321bdeb06a78::function_9485315c704e6f6d("REV_OB_BIGBOUNTY", v_portal, str_difficulty, var_f923d1b5e7f75c3b);
        if (b_spawned) {
            return;
        }
        str_difficulty = undefined;
        wait 0.1;
    }
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1538
// Size: 0x4c
function function_90a1c6f54083cb20(params) {
    level endon("game_ended");
    if (isdefined(params.instance)) {
        while (!isdefined(params.instance.var_b189a678c1c3489a)) {
            wait 0.1;
        }
    }
    level notify("gate_quest_contract_starter_spawned", params);
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x158c
// Size: 0x26a
function private function_af7a62a8522565bd(v_teleport, starter, a_players, itembundlename) {
    level endon("game_ended");
    var_bf76aabb89e83a00 = 3;
    v_offset = (0, 0, -100);
    var_6d0b16236c57106e = spawn("script_model", v_teleport + v_offset);
    var_6d0b16236c57106e setmodel("tag_origin");
    var_6d0b16236c57106e playsoundonmovingent("evt_rr_phone_spawn");
    if (issubstr(itembundlename, "toxic")) {
        str_type = "toxic";
    } else if (issubstr(itembundlename, "electric")) {
        str_type = "electric";
    } else {
        str_type = "fire";
    }
    foreach (player in a_players) {
        if (isalive(player)) {
            playfxontagforclients(level._effect["rift_gate_contract_streak_" + str_type], var_6d0b16236c57106e, "tag_origin", player);
        }
    }
    n_wait = var_6d0b16236c57106e gravity_launch(starter.origin, var_bf76aabb89e83a00);
    wait n_wait;
    var_6d0b16236c57106e.origin = starter.origin;
    foreach (player in a_players) {
        if (isdefined(player)) {
            stopfxontagforclients(level._effect["rift_gate_contract_streak_" + str_type], var_6d0b16236c57106e, "tag_origin", player);
            playfxontagforclients(level._effect["rift_gate_contract_glow_" + str_type], var_6d0b16236c57106e, "tag_origin", player);
            player thread function_ee03790495df57f(starter);
        }
    }
    starter waittill("quest_contract_starter_cleanup");
    if (isdefined(var_6d0b16236c57106e)) {
        var_6d0b16236c57106e delete();
    }
    foreach (player in a_players) {
        if (isdefined(player)) {
            player notify("quest_contract_starter_cleanup");
        }
    }
    thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_contract_start", a_players, 3);
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x17fe
// Size: 0x72
function private function_ee03790495df57f(starter) {
    self endon("death_or_disconnect");
    self endon("quest_contract_starter_cleanup");
    while (true) {
        self waittill("ob_activity_starter_used", s_result);
        if (s_result.var_b189a678c1c3489a == starter) {
            starter notify("quest_contract_starter_cleanup");
            scripts\mp\objidpoolmanager::objective_playermask_hidefromall(s_result.quest_objid);
            scripts\mp\objidpoolmanager::returnobjectiveid(s_result.quest_objid);
            return;
        }
    }
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1878
// Size: 0xb8
function private gravity_launch(target_pos, time) {
    start_pos = self.origin;
    gravity = getdvarint(@"bg_gravity", 0) * -1;
    dist = distance(start_pos, target_pos);
    power = dist / time;
    delta = target_pos - start_pos;
    drop = 0.5 * gravity * time * time;
    velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self movegravity(velocity, time);
    return time;
}

// Namespace namespace_c241d588869e3606 / namespace_362d01f5d79f9001
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1939
// Size: 0x164
function function_19e866494b6bb2d8(params) {
    instance = params.instance;
    if (!istrue(instance.var_24a16c52437dde0f)) {
        return;
    }
    switch (instance.ai_type) {
    case #"hash_57f1e1130e644c8e":
        instance.var_cda97c89ff1bb729 = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_season1_toxic_attuned");
        break;
    case #"hash_d5d252eb91d1700b":
        instance.var_cda97c89ff1bb729 = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_season1_fire_attuned");
        break;
    case #"hash_8b1acdb45ebb6052":
        instance.var_cda97c89ff1bb729 = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_season1_electric_attuned");
        break;
    }
    var_9e3cc96b3a2c2e2c = 350;
    s_encounter = "ai_encounter:enc_ob_rift_gate_bounty_adds_" + instance.ai_type;
    encounterid = namespace_614554f86e52695c::spawn_request(s_encounter, instance.aispawnstruct.origin, var_9e3cc96b3a2c2e2c, 1, 1, 0);
    if (isdefined(instance.ai_zombie)) {
        instance.ai_zombie waittill("death");
    }
    namespace_614554f86e52695c::function_9950e6e485bf5261(encounterid);
    if (isarray(instance.var_6c29f2fdb0054bbe)) {
        thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_contract_success", instance.var_6c29f2fdb0054bbe, 3.5);
    }
}

