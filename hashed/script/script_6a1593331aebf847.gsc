// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7ff3a914e6c698c5;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_2cd07641bf71242a;
#using script_3b7ffa11ee92fc3;
#using script_13d927d1fbe8598c;
#using script_25a541cdebf5c6ce;
#using script_4e131720d70aa378;

#namespace namespace_5a87d005bee83137;

// Namespace namespace_5a87d005bee83137/namespace_d2273ed91d2b732b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f
// Size: 0x14
function precache(params) {
    function_cf142512f48666b7(params);
}

// Namespace namespace_5a87d005bee83137/namespace_d2273ed91d2b732b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a
// Size: 0x11
function private function_f49a30f92555b827() {
    function_304c63cbb536c526();
    function_e666bc1f7f826ea2();
}

// Namespace namespace_5a87d005bee83137/namespace_d2273ed91d2b732b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x142
// Size: 0xe8
function function_7c45a7e2b8990bee(asmname, statename, params) {
    function_a343ac31ca854535(&function_f49a30f92555b827);
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm_setmoveplaybackrate(1);
    function_ac7db7e26eb6926c();
    function_1d4cf90e795ad643();
    function_c84ae25edc875e49();
    function_75a233b1c9abd8f();
    function_64d97cf652a4d385();
    callback::add("on_ai_init", &on_ai_init);
    ent_flag_set("zombie_asm_init_finished");
}

// Namespace namespace_5a87d005bee83137/namespace_d2273ed91d2b732b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x231
// Size: 0x2f
function private on_ai_init(params) {
    function_f1e5805da192a1ef("run", "aitype_default", 0);
    callback::remove("on_ai_init", &on_ai_init);
}

