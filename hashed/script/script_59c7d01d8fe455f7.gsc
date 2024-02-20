// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7ff3a914e6c698c5;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_2cd07641bf71242a;
#using script_ac32c5a74321662;
#using script_4d5690421d14cda9;
#using script_4fa22bc28608e9bd;
#using script_3e4f26df9dc4b465;

#namespace namespace_50f6658a88689353;

// Namespace namespace_50f6658a88689353/namespace_b9742a57ad9ac793
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x158
// Size: 0x76
function private function_f49a30f92555b827() {
    function_e763a1820edbfd28();
    function_7e95224caecd6944();
    function_3f12f7bb3b0f7b28();
    level.scr_anim[self.animname]["spawn"] = "spawn";
    level.scr_anim[self.animname]["spawn_fast"] = "spawn_fast";
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &on_move_speed_changed);
}

// Namespace namespace_50f6658a88689353/namespace_b9742a57ad9ac793
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5
// Size: 0xf0
function function_f4d5b246417ef16a(asmname, statename, params) {
    function_a343ac31ca854535(&function_f49a30f92555b827);
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm_setmoveplaybackrate(1);
    thread function_692d3f57a32b93d9();
    function_64d97cf652a4d385();
    function_a9a0b485d2e58d71();
    function_949f643edcd1aade();
    function_d956fa70427897a();
    function_99484082dc3884de();
    callback::add("on_ai_init", &on_ai_init);
    ent_flag_set("zombie_asm_init_finished");
}

// Namespace namespace_50f6658a88689353/namespace_b9742a57ad9ac793
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0x2f
function private on_ai_init(params) {
    function_f1e5805da192a1ef("run", "aitype_default", 0);
    callback::remove("on_ai_init", &on_ai_init);
}

// Namespace namespace_50f6658a88689353/namespace_b9742a57ad9ac793
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302
// Size: 0x42
function function_692d3f57a32b93d9() {
    self endon("death");
    while (1) {
        self waittill("wander_start");
        function_f1e5805da192a1ef("walk", "wander", 22);
        self waittill("wander_end");
        function_f1e5805da192a1ef(undefined, "wander");
    }
}

// Namespace namespace_50f6658a88689353/namespace_b9742a57ad9ac793
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b
// Size: 0x1b
function on_move_speed_changed(params) {
    self.var_30158902d2e2c3c0 = self aigetdesiredspeed();
}

