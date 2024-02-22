// mwiii decomp prototype
#using script_49933f4f48d029a1;
#using script_1c8bc690442e0123;

#namespace namespace_ee1dacfbea82d21d;

// Namespace namespace_ee1dacfbea82d21d/namespace_de07b9ab09edf46a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x384
// Size: 0x3bd
function function_7fa382ebd44ac411() {
    level.var_6f626f29ffd28538 = spawnstruct();
    level.var_6f626f29ffd28538.steps = [];
    level.var_6f626f29ffd28538.var_e950dfdd6e1577dc = 1;
    level.var_6f626f29ffd28538.var_5f5f6fb97e94ac59 = 0;
    level.var_6f626f29ffd28538.var_d0baa670c4fcf6ff = 0;
    function_c699558663f2308a("infil", &infilsequence, undefined);
    function_c699558663f2308a("initial_execution", &function_be0865890f99c70e, undefined);
    function_c699558663f2308a("gamepad_prompt", &function_20e6c27a91c3accd, undefined);
    function_c699558663f2308a("spawn_forward_lock_1", &function_f68e1a166600bcdf, "forward_lock_1");
    function_c699558663f2308a("move_camera", &function_49cab10caac7c6cd, undefined);
    function_c699558663f2308a("move_to_pos_0", &function_91b5b282cb2b18fc, 0);
    function_c699558663f2308a("look_at_weapon", &function_931dc024b9a4425d, undefined);
    function_c699558663f2308a("pick_up_weapon", &function_6c00d659b72888bf, undefined);
    function_c699558663f2308a("despawn_forward_lock_1", &function_ec363f75c60d5900, "forward_lock_1");
    function_c699558663f2308a("spawn_forward_lock_2", &function_f68e1a166600bcdf, "forward_lock_2");
    function_c699558663f2308a("pick_up_ammo", &function_4b422fdc1b596ef9, undefined);
    function_c699558663f2308a("autofire_prompt", &function_ee69c387d92c4b38, undefined);
    function_c699558663f2308a("kill_with_autofire", &function_b6001ea887635de4, level.ftuedata.var_eee68edbe2ef2dbf.var_d705caa4889b1d9e);
    function_c699558663f2308a("reload", &function_f438de09fa371cfa, undefined);
    function_c699558663f2308a("armor_up", &function_8ab6a96b2278d5cf, undefined);
    function_c699558663f2308a("despawn_forward_lock_2", &function_ec363f75c60d5900, "forward_lock_2");
    function_c699558663f2308a("spawn_forward_lock_3", &function_f68e1a166600bcdf, "forward_lock_3");
    function_c699558663f2308a("move_to_pos_1", &function_91b5b282cb2b18fc, 1);
    function_c699558663f2308a("spawn_backward_lock_1", &function_f68e1a166600bcdf, "backward_lock_1");
    function_c699558663f2308a("aim_with_ads", &function_ed36379da3790cba, undefined);
    function_c699558663f2308a("despawn_forward_lock_3", &function_ec363f75c60d5900, "forward_lock_3");
    function_c699558663f2308a("spawn_forward_lock_4", &function_f68e1a166600bcdf, "forward_lock_4");
    function_c699558663f2308a("kill_with_ads", &function_3de63bdbd1b3e065, level.ftuedata.var_eee68edbe2ef2dbf.ads);
    function_c699558663f2308a("exit_ads", &function_7931a9f93d82dd27, undefined);
    function_c699558663f2308a("despawn_forward_lock_4", &function_ec363f75c60d5900, "forward_lock_4");
    function_c699558663f2308a("spawn_forward_lock_5", &function_f68e1a166600bcdf, "forward_lock_5");
    function_c699558663f2308a("move_to_pos_2", &function_91b5b282cb2b18fc, 2);
    function_c699558663f2308a("spawn_backward_lock_2", &function_f68e1a166600bcdf, "backward_lock_2");
    function_c699558663f2308a("manualfire_prompt", &function_463d388fed95c483, undefined);
    function_c699558663f2308a("kill_with_manualfire", &function_a31a8245682550c1, level.ftuedata.var_eee68edbe2ef2dbf.var_6e7d1a7e04df4beb);
    function_c699558663f2308a("choose_firemode_prompt", &function_de9508d62f36ec59, undefined);
    function_c699558663f2308a("despawn_forward_lock_5", &function_ec363f75c60d5900, "forward_lock_5");
    function_c699558663f2308a("spawn_forward_lock_6", &function_f68e1a166600bcdf, "forward_lock_6");
    function_c699558663f2308a("final_combat", &function_7f36a1282a73e40f, level.ftuedata.var_eee68edbe2ef2dbf.combat);
    function_c699558663f2308a("heli_destruction", &function_e48318bd7516fde6, undefined);
    function_c699558663f2308a("despawn_forward_lock_6", &function_ec363f75c60d5900, "forward_lock_6");
    function_c699558663f2308a("move_to_pos_3", &function_91b5b282cb2b18fc, 3);
    function_c699558663f2308a("end_match", &function_ab5ab2886323a8a5, undefined);
}

// Namespace namespace_ee1dacfbea82d21d/namespace_de07b9ab09edf46a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x58
function function_c53f0344e549edd5() {
    level endon("game_ended");
    function_56ddff8548c968d6();
    for (i = 0; i < level.var_6f626f29ffd28538.steps.size; i++) {
        function_fe5abc4fb25c1701(level.var_6f626f29ffd28538.steps[i]);
    }
}

