// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7ff3a914e6c698c5;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_2cd07641bf71242a;
#using script_1336e8b6e220bbfa;
#using script_3fe2c7524c8d3505;
#using script_56e851046f535a9a;
#using script_23b580b08abe064f;

#namespace namespace_dc9c4cdd011135ef;

// Namespace namespace_dc9c4cdd011135ef/namespace_1cf004a8aa98eafd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x149
// Size: 0xeb
function private function_f49a30f92555b827() {
    function_29b5fb70d7ea841();
    function_304c63cbb536c526();
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &on_move_speed_changed);
    level.scr_anim[self.animname]["spawn"] = "spawn";
    level.scr_anim[self.animname]["dig"] = "dig";
    level.scr_anim[self.animname]["drop"] = "drop";
    level.scr_anim[self.animname]["spawn_ground"] = "spawn_ground";
    level.scr_anim[self.animname]["howl"] = "howl";
    level.scr_anim[self.animname]["spawn_fast"] = "spawn";
}

// Namespace namespace_dc9c4cdd011135ef/namespace_1cf004a8aa98eafd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x23b
// Size: 0xe8
function function_e62bc0179274066c(asmname, statename, params) {
    function_a343ac31ca854535(&function_f49a30f92555b827);
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm_setmoveplaybackrate(1);
    function_be2d0b11a3aaba0c();
    function_659c38a2f52dc596();
    function_64d97cf652a4d385();
    init_traverse();
    function_c1fd3bf3e4513334();
    callback::add("on_ai_init", &on_ai_init);
    ent_flag_set("zombie_asm_init_finished");
}

// Namespace namespace_dc9c4cdd011135ef/namespace_1cf004a8aa98eafd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32a
// Size: 0x2f
function private on_ai_init(params) {
    function_f1e5805da192a1ef("run", "aitype_default", 0);
    callback::remove("on_ai_init", &on_ai_init);
}

// Namespace namespace_dc9c4cdd011135ef/namespace_1cf004a8aa98eafd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x360
// Size: 0xc
function private on_move_speed_changed(params) {
    
}

