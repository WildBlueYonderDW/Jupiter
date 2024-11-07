#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_bigmap_ob_s5_rift_gate_cs;

// Namespace mp_jup_bigmap_ob_s5_rift_gate_cs / namespace_c9c464b650c167ca
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23d
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_bigmap_ob_s5_rift_gate_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_bigmap_ob_s5_rift_gate_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_bigmap_ob_s5_rift_gate_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_bigmap_ob_s5_rift_gate_cs / namespace_c9c464b650c167ca
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_bigmap_ob_s5_rift_gate_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_bigmap_ob_s5_rift_gate_cs");
}

// Namespace mp_jup_bigmap_ob_s5_rift_gate_cs / namespace_c9c464b650c167ca
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x321
// Size: 0x504
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 4600;
    s.name = "STM_VO_trigger_25";
    fe [[ f ]](s, us, cf, (6894.9, -2984.52, 471.43), (0, 0, 0), "STM_VO_trigger_25", undefined, "STM_VO_trigger_25", undefined, undefined, undefined, undefined, 30000, undefined, 512);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (6894.9, -2984.52, 2392.25), (0, 0, 0), "ob_s5_story_mission_portal", undefined, "ob_s5_story_mission_portal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 4600;
    s.name = "STM_VO_trigger_50";
    fe [[ f ]](s, us, cf, (6894.9, -2984.52, 471.43), (0, 0, 0), "STM_VO_trigger_50", undefined, "STM_VO_trigger_50", undefined, undefined, undefined, undefined, 19500, undefined, 512);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 3000;
    s.name = "STM_VO_trigger_75";
    fe [[ f ]](s, us, cf, (6894.9, -2984.52, 1438.92), (0, 0, 0), "STM_VO_trigger_75", undefined, "STM_VO_trigger_75", undefined, undefined, undefined, undefined, 11000, undefined, 512);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (7436.19, -4266.28, 2392), (0, 225, 0), "mrPeeks", "s5_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (7435.91, -4556.9, 2392), (0, 135, 0), "aetherGiraffe", "s5_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (7145.6, -4557.01, 2392), (0, 45, 0), "aetherDiary", "s5_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (7145.66, -4266.75, 2391.94), (359.85, 315, -0), "aetherDrum", "s5_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    s.name = "s5_rift_gate";
    fe [[ f ]](s, us, cf, (7778.53, -3923.16, 2391.84), (0, 135, 0), "s5_rift_gate", undefined, "s5_rift_gate");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    s.script_label = "low";
    fe [[ f ]](s, us, cf, (7609.94, -3816.57, 2444.29), (0, 135.07, -90), "s5_rift_token_prompt", "s5_rift_gate", "ob_rift_token_prompt");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    s.script_label = "high";
    fe [[ f ]](s, us, cf, (7947.22, -4029.45, 2444.87), (0, 135.07, 90), "s5_rift_token_prompt", "s5_rift_gate", "ob_rift_token_prompt");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (7705.22, -3996.47, 2392), (0, 225, 0), "s5_rift_encounter", "s5_rift_gate", "ob_rift_encounter", undefined, undefined, undefined, undefined, 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_s5_rift_gate_cs";
    fe [[ f ]](s, us, cf, (7579.93, -4121.75, 2391.84), (0, 225, 0), "s5_rift_gate_reward", "s5_rift_gate", "ob_rift_gate_reward");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_bigmap_ob_s5_rift_gate_cs / namespace_c9c464b650c167ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82d
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_bigmap_ob_s5_rift_gate_cs / namespace_c9c464b650c167ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x837
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_bigmap_ob_s5_rift_gate_cs");
}

