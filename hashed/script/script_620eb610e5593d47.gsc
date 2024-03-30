// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_60cc31ea91d0ad55;
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_7edf952f8921aa6b;

#namespace namespace_de0969f065ce9e6c;

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f
// Size: 0x77
function function_304c63cbb536c526() {
    function_406984e213848212("move", &function_eee30195769f679e, &function_3efc6f398dd71d26);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk"), 1);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run"), 1);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint"), 1);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5(undefined));
}

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad
// Size: 0x23
function function_161807de85552fb() {
    callback::add("on_move_speed_changed", &function_36985b9cd291d92);
    init_move();
    thread wander_listener();
}

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x5c
function private function_36985b9cd291d92(params) {
    anim_alias = function_8626c13b5be18c1b("move");
    /#
        record3dtext("<unknown string>" + anim_alias, self.origin + (0, 0, 48), (1, 0, 0), "<unknown string>", self);
    #/
}

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23a
// Size: 0x2a
function private function_8776345ecd2673e5(move_type) {
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26c
// Size: 0x8e
function private function_eee30195769f679e(struct) {
    alias = "";
    if (isdefined(struct.move_type)) {
        alias = alias + struct.move_type;
        if (self._blackboard.movetype != struct.move_type) {
            return undefined;
        }
    }
    /#
        assertex(alias != "", "Unable to find move speed variant: " + self._blackboard.movetype + " defined");
    #/
    return alias;
}

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x302
// Size: 0x45
function private function_3efc6f398dd71d26(alias) {
    self function_164c05dd1bcfbca7("move", alias);
    if (asm_currentstatehasflag(self.asmname, "move")) {
        asm_fireevent_internal(self.asmname, "loop_reroll_anim");
    }
}

// Namespace namespace_de0969f065ce9e6c / namespace_42cd599857fc6c45
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34e
// Size: 0x42
function private wander_listener() {
    self endon("death");
    while (true) {
        self waittill("wander_start");
        function_f1e5805da192a1ef("walk", "wander", 22);
        self waittill("wander_end");
        function_f1e5805da192a1ef(undefined, "wander");
    }
}

