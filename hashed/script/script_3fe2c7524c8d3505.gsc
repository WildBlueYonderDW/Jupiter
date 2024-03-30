// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_60cc31ea91d0ad55;
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_7edf952f8921aa6b;

#namespace namespace_609eb53ca299cce5;

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a
// Size: 0xa9
function function_304c63cbb536c526() {
    function_406984e213848212("move", &function_eee30195769f679e, &function_3efc6f398dd71d26);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("wander"), 1);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk"), 1);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run"), 2);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint"), 2);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("super_sprint"), 2);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5(undefined));
}

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x23
function function_659c38a2f52dc596() {
    callback::add("on_move_speed_changed", &function_36985b9cd291d92);
    init_move();
    thread wander_listener();
}

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x5c
function private function_36985b9cd291d92(params) {
    anim_alias = function_8626c13b5be18c1b("move");
    /#
        record3dtext("<unknown string>" + anim_alias, self.origin + (0, 0, 48), (1, 0, 0), "<unknown string>", self);
    #/
}

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x2a
function private function_8776345ecd2673e5(move_type) {
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x289
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

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f0
// Size: 0x45
function private function_3efc6f398dd71d26(alias) {
    self function_164c05dd1bcfbca7("move", alias);
    if (asm_currentstatehasflag(self.asmname, "move")) {
        asm_fireevent_internal(self.asmname, "loop_reroll_anim");
    }
}

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33c
// Size: 0x75
function private wander_listener() {
    self endon("death");
    while (true) {
        self waittill("wander_start");
        move_speed = self.zombieaisettings.var_96e932e5fc805af8[0].movetype;
        function_f1e5805da192a1ef(move_speed, "wander", 22);
        thread function_931d5acb3377ff79("wander_end");
        self waittill("wander_end");
        function_f1e5805da192a1ef(undefined, "wander");
    }
}

// Namespace namespace_609eb53ca299cce5 / namespace_d072ae166408a92b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b8
// Size: 0xb3
function private function_931d5acb3377ff79(end_note) {
    level endon("game_ended");
    self endon("death");
    if (isdefined(end_note)) {
        self endon(end_note);
    }
    if (istrue(self.var_873d30685528d962)) {
        return;
    }
    self function_65cdab0fc78aba8f(self.origin, 500);
    last_pos = self.origin;
    while (true) {
        if (istrue(self.var_873d30685528d962)) {
            return;
        }
        if (!isdefined(self.enemy)) {
            if (distancesquared(last_pos, self.origin) >= 90000) {
                self function_65cdab0fc78aba8f(self.origin, 500);
                last_pos = self.origin;
            }
        }
        wait(5);
    }
}

