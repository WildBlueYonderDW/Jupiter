// mwiii decomp prototype
#using script_372d8c5f69b0ae2e;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_73353db38b27e9b2;

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x503
// Size: 0x137
function init() {
    if (!isdefined(level.var_74a171505d979cbc)) {
        level.var_74a171505d979cbc = spawnstruct();
    }
    if (istrue(level.var_74a171505d979cbc.disabled)) {
        return;
    }
    level.var_74a171505d979cbc.var_1fc4fd3ef975e8c8 = &function_78748799de25da5f;
    level.var_74a171505d979cbc.var_2ec260ca66f2378 = &function_65bbb083561fa648;
    level.var_74a171505d979cbc.var_efaa5d51e08521eb = &function_6c512ed7af23eb04;
    level.var_74a171505d979cbc.var_3522908002cc5af = &function_b3cab4bbbd2f27bf;
    level.var_74a171505d979cbc.var_16a2ad3bccc62bb5 = &function_53bc249de0d47b05;
    level.var_74a171505d979cbc.var_2eda72772d041081 = &function_63cac0421acbe53c;
    level.var_74a171505d979cbc.var_fbd8726770c4c39 = &function_d8f48ab0dfd5ef51;
    level.var_74a171505d979cbc.var_8a66fb76621b9c84 = &function_91c24157247ef2fc;
    level.var_74a171505d979cbc.var_5415e799cae1bac7 = &function_497a27b31d43d6af;
    level.var_74a171505d979cbc.playerlinkeduselinkedvelocity = &function_5e2b19fd9204a302;
    namespace_db6d5eb4a31b23a::main();
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x641
// Size: 0x17f
function function_78748799de25da5f() {
    function_b0c99390cdb7edd5();
    anims = [];
    anims["scripted_melee_kill_01_left"] = generic_human%vm_sp_context_melee_stand_1_left_enemy;
    anims["scripted_melee_kill_01_right"] = generic_human%vm_sp_context_melee_stand_1_right_enemy;
    anims["scripted_melee_kill_01_front"] = generic_human%vm_sp_context_melee_stand_1_front_enemy;
    anims["scripted_melee_kill_01_back"] = generic_human%vm_sp_context_melee_stand_1_rear_enemy;
    anims["scripted_melee_kill_02_left"] = generic_human%vm_sp_context_melee_stand_2_left_enemy;
    anims["scripted_melee_kill_02_right"] = generic_human%vm_sp_context_melee_stand_2_right_enemy;
    anims["scripted_melee_kill_02_front"] = generic_human%vm_sp_context_melee_stand_2_front_enemy;
    anims["scripted_melee_kill_02_back"] = generic_human%vm_sp_context_melee_stand_2_rear_enemy;
    anims["scripted_melee_stealth_kill_01_back"] = generic_human%vm_sp_context_melee_stand_1_rear_enemy;
    anims["scripted_melee_stealth_kill_01_left"] = generic_human%vm_sp_context_melee_stand_1_left_enemy;
    anims["scripted_melee_stealth_kill_01_right"] = generic_human%vm_sp_context_melee_stand_1_right_enemy;
    anims["scripted_melee_stealth_kill_01_front"] = generic_human%vm_sp_context_melee_stand_1_front_enemy;
    foreach (key, var_4f3089070d8b1e24 in anims) {
        level.scr_anim["generic"][key] = var_4f3089070d8b1e24;
        namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_death", &function_d8f48ab0dfd5ef51, key);
        namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_ragdoll", &function_91c24157247ef2fc, key);
        namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_fx", &function_497a27b31d43d6af, key);
    }
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c7
// Size: 0x2c8
function function_b0c99390cdb7edd5() {
    level.scr_animtree["scripted_melee_player_rig"] = %script_model;
    if (!isdefined(level.scr_model) || !isdefined(level.scr_model["scripted_melee_player_rig"])) {
        level.scr_model["scripted_melee_player_rig"] = "viewhands_base_iw8";
    }
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_01_left"] = script_model%vm_sp_context_melee_stand_1_left_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_01_right"] = script_model%vm_sp_context_melee_stand_1_right_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_01_front"] = script_model%vm_sp_context_melee_stand_1_front_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_01_back"] = script_model%vm_sp_context_melee_stand_1_rear_player;
    utility::function_7a5a6498179656fc("scripted_melee_kill_01_left", "left", &function_7e355057c5e32c56);
    utility::function_7a5a6498179656fc("scripted_melee_kill_01_right", "right", &function_7e355057c5e32c56);
    utility::function_7a5a6498179656fc("scripted_melee_kill_01_front", "front", &function_7e355057c5e32c56);
    utility::function_7a5a6498179656fc("scripted_melee_kill_01_back", "back", &function_7e355057c5e32c56);
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_02_left"] = script_model%vm_sp_context_melee_stand_2_left_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_02_right"] = script_model%vm_sp_context_melee_stand_2_right_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_02_front"] = script_model%vm_sp_context_melee_stand_2_front_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_kill_02_back"] = script_model%vm_sp_context_melee_stand_2_rear_player;
    utility::function_7a5a6498179656fc("scripted_melee_kill_02_left", "left", &function_7e355057c5e32c56);
    utility::function_7a5a6498179656fc("scripted_melee_kill_02_right", "right", &function_7e355057c5e32c56);
    utility::function_7a5a6498179656fc("scripted_melee_kill_02_front", "front", &function_7e355057c5e32c56);
    utility::function_7a5a6498179656fc("scripted_melee_kill_02_back", "back", &function_7e355057c5e32c56);
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_stealth_kill_01_left"] = script_model%vm_sp_context_melee_stand_1_left_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_stealth_kill_01_right"] = script_model%vm_sp_context_melee_stand_1_right_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_stealth_kill_01_front"] = script_model%vm_sp_context_melee_stand_1_front_player;
    level.scr_anim["scripted_melee_player_rig"]["scripted_melee_stealth_kill_01_back"] = script_model%vm_sp_context_melee_stand_1_rear_player;
    utility::function_7a5a6498179656fc("scripted_melee_stealth_kill_01_left", "left", &function_9d501e35f4127f85);
    utility::function_7a5a6498179656fc("scripted_melee_stealth_kill_01_right", "right", &function_9d501e35f4127f85);
    utility::function_7a5a6498179656fc("scripted_melee_stealth_kill_01_front", "front", &function_9d501e35f4127f85);
    utility::function_7a5a6498179656fc("scripted_melee_stealth_kill_01_back", "back", &function_9d501e35f4127f85);
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa96
// Size: 0x8b
function spawn_anim_model(animname, origin, angles) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    model = spawn("script_model", origin);
    model.animname = animname;
    model useanimtree(%script_model);
    model setmodel(level.scr_model[model.animname]);
    if (isdefined(angles)) {
        model.angles = angles;
    }
    return model;
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb29
// Size: 0x41
function function_65bbb083561fa648() {
    self.scripted_melee_player_rig = spawn_anim_model("scripted_melee_player_rig", self.origin, self.angles);
    self.scripted_melee_player_rig namespace_bc4a4b9456315863::function_1cb661b457551a3(1, self, 0.35);
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb71
// Size: 0x34
function function_6c512ed7af23eb04() {
    var_765a8198c5e89918 = getaiarray("axis");
    namespace_3c37cb17ade254d::array_call(var_765a8198c5e89918, &function_f23f106f8976771d);
    /#
        namespace_3c37cb17ade254d::array_thread(var_765a8198c5e89918, &function_7eaecc1fbfd9ad25, self);
    #/
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbac
// Size: 0x3
function function_b3cab4bbbd2f27bf() {
    
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb6
// Size: 0x3
function function_53bc249de0d47b05() {
    
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc0
// Size: 0xc
function function_91c24157247ef2fc(guy) {
    
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd3
// Size: 0x9
function function_63cac0421acbe53c() {
    return function_e5433a928bc95cca();
}

// Namespace namespace_73353db38b27e9b2/namespace_54765065ecffdfad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe4
// Size: 0xc
function function_5e2b19fd9204a302(bool) {
    
}

