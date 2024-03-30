// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7ff3a914e6c698c5;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_2cd07641bf71242a;
#using script_33781ab60ef13663;
#using script_1bfe8e965532ee8a;

#namespace namespace_ce4d65499c0c19a1;

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0x131
function private function_f49a30f92555b827() {
    function_a66b42c7ea0c395b();
    function_fc3f9083a8c8a68c();
    function_96f220b689167b22();
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_is_moving_melee_changed", &on_is_moving_melee_changed);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_move_speed_changed", &on_move_speed_changed);
    level.scr_anim[self.animname]["spawn"] = "spawn";
    level.scr_anim[self.animname]["spawn_fast"] = "spawn_fast";
    level.scr_anim[self.animname]["emerge"] = "emerge";
    level.scr_anim[self.animname]["emerge_sprint"] = "emerge_sprint";
    level.scr_anim[self.animname]["emerge_attack"] = "emerge_attack";
    level.scr_anim[self.animname]["emerge_attack_hit"] = "emerge_attack_hit";
    level.scr_anim[self.animname]["emerge_attack_miss"] = "emerge_attack_miss";
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0xf6
function function_25dabcda59af1c66(asmname, statename, params) {
    if (ent_flag("zombie_asm_init_finished")) {
        return;
    }
    function_a343ac31ca854535(&function_f49a30f92555b827);
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm_setmoveplaybackrate(1);
    thread wander_listener();
    function_8626c13b5be18c1b("melee");
    function_64d97cf652a4d385();
    function_714b93f3cd89e618();
    callback::add("on_ai_init", &on_ai_init);
    ent_flag_set("zombie_asm_init_finished");
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x406
// Size: 0x2f
function private on_ai_init(params) {
    function_f1e5805da192a1ef("run", "aitype_default", 0);
    callback::remove("on_ai_init", &on_ai_init);
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x24
function on_move_speed_changed(params) {
    function_8626c13b5be18c1b("melee");
    function_8626c13b5be18c1b("move");
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x467
// Size: 0x24
function on_is_moving_melee_changed(params) {
    function_8626c13b5be18c1b("melee");
    function_8626c13b5be18c1b("move");
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x492
// Size: 0x42
function wander_listener() {
    self endon("death");
    while (true) {
        self waittill("wander_start");
        function_f1e5805da192a1ef("walk", "wander", 22);
        self waittill("wander_end");
        function_f1e5805da192a1ef(undefined, "wander");
    }
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0x4b
function function_fc3f9083a8c8a68c() {
    function_406984e213848212("move", &function_eee30195769f679e, &function_3efc6f398dd71d26);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk"), 2);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run"), 2);
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x52d
// Size: 0x2a
function private function_8776345ecd2673e5(move_type) {
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55f
// Size: 0x5f
function private function_eee30195769f679e(struct) {
    alias = "";
    if (isdefined(struct.move_type)) {
        alias = alias + struct.move_type;
        if (self._blackboard.movetype != struct.move_type) {
            return undefined;
        }
    }
    return alias;
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c6
// Size: 0x45
function private function_3efc6f398dd71d26(alias) {
    self function_164c05dd1bcfbca7("move", alias);
    if (asm_currentstatehasflag(self.asmname, "move")) {
        asm_fireevent_internal(self.asmname, "loop_reroll_anim");
    }
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x5f
function function_a66b42c7ea0c395b() {
    function_406984e213848212("melee", &function_79d559d24ce75889, &function_f01c824a76203041);
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "walk"));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "run"));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(0, undefined));
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x678
// Size: 0x3f
function private function_28d26d7ead912662(var_f261c2f31d7de033, move_type) {
    struct = spawnstruct();
    struct.var_f261c2f31d7de033 = var_f261c2f31d7de033;
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bf
// Size: 0xad
function private function_79d559d24ce75889(struct) {
    alias = "";
    if (isdefined(struct.var_f261c2f31d7de033)) {
        alias = alias + ter_op(istrue(self.var_f261c2f31d7de033), "move", "static");
        if (istrue(self.var_f261c2f31d7de033) != struct.var_f261c2f31d7de033) {
            return undefined;
        }
    }
    if (isdefined(struct.move_type)) {
        alias = alias + "_" + struct.move_type;
        if (self._blackboard.movetype != struct.move_type) {
            return undefined;
        }
    }
    return alias;
}

// Namespace namespace_ce4d65499c0c19a1 / namespace_186980387baf3bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x774
// Size: 0x19
function private function_f01c824a76203041(alias) {
    self function_164c05dd1bcfbca7("melee", alias);
}

