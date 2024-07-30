#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7ff3a914e6c698c5;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_2cd07641bf71242a;
#using script_620eb610e5593d47;
#using script_2b848668600efa30;
#using script_33781ab60ef13663;

#namespace namespace_d94cac041d4a3fb0;

// Namespace namespace_d94cac041d4a3fb0 / namespace_47165a56c84fbe8f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x100
// Size: 0x17
function private function_f49a30f92555b827() {
    function_304c63cbb536c526();
    function_29b5fb70d7ea841();
    function_96f220b689167b22();
}

// Namespace namespace_d94cac041d4a3fb0 / namespace_47165a56c84fbe8f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11f
// Size: 0xd9
function function_e3e1894798c371bf(asmname, statename, params) {
    function_a343ac31ca854535(&function_f49a30f92555b827);
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm_setmoveplaybackrate(1);
    function_161807de85552fb();
    function_bd41a979b3c3bcb6();
    function_64d97cf652a4d385();
    callback::add("on_ai_init", &on_ai_init);
    ent_flag_set("zombie_asm_init_finished");
}

// Namespace namespace_d94cac041d4a3fb0 / namespace_47165a56c84fbe8f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x200
// Size: 0x2e
function private on_ai_init(params) {
    function_f1e5805da192a1ef("walk", "aitype_default", 0);
    callback::remove("on_ai_init", &on_ai_init);
}

