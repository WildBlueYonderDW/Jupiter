// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_60cc31ea91d0ad55;
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_7edf952f8921aa6b;
#using script_405d05c89e998922;

#namespace namespace_85955b341e67f12f;

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0x2cf
function function_304c63cbb536c526(var_e9de22bdc3e99ea0) {
    function_406984e213848212("move", &function_eee30195769f679e, &function_3efc6f398dd71d26);
    if (var_e9de22bdc3e99ea0) {
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk", "down", undefined), 9);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk", "up", undefined), 10);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run", "down", undefined), 6);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run", "up", undefined), 6);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run", undefined, 1));
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint", "down", undefined), 4);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint", "up", undefined), 3);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint", undefined, 1));
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("super_sprint", undefined, undefined), 3);
    } else {
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk", "down", undefined), 16);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk", "up", undefined), 14);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run", "down", undefined), 12);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run", "up", undefined), 12);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run", undefined, 1));
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint", "down", undefined), 7);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint", "up", undefined), 6);
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint", undefined, 1));
        function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("super_sprint", undefined, undefined), 4);
    }
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("super_sprint", undefined, 1));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("investigate", undefined, undefined));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("wander_shuffle", undefined, undefined));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("wander_agitated", undefined, undefined));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("wander", undefined, undefined));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5(undefined, undefined, 1));
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x482
// Size: 0x63
function function_d03eea41ff9cfe90() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &function_36985b9cd291d92);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_is_moving_melee_changed", &function_9fd711257824bb04);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_is_crawling_changed", &function_f32e8d8176ba8554);
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec
// Size: 0x1a
function function_3426adec3c5d6cb6() {
    function_8c77e60abbae83bd();
    thread function_692d3f57a32b93d9();
    thread function_1f797587d4ca0c09();
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50d
// Size: 0x5c
function private function_36985b9cd291d92(params) {
    var_38f563e00311ee1b = function_8626c13b5be18c1b("move");
    /#
        record3dtext("<unknown string>" + var_38f563e00311ee1b, self.origin + (0, 0, 48), (1, 0, 0), "<unknown string>", self);
    #/
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x570
// Size: 0x18
function private function_9fd711257824bb04(params) {
    function_8626c13b5be18c1b("move");
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x58f
// Size: 0x2a
function private function_f32e8d8176ba8554(params) {
    if (asm_currentstatehasflag(self.asmname, "move")) {
        function_3bf2c1ee7854b63a();
    }
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c0
// Size: 0x54
function private function_8776345ecd2673e5(var_5096c84907869455, var_ab8bf90d2d11f3e0, is_crawling) {
    struct = spawnstruct();
    struct.var_5096c84907869455 = var_5096c84907869455;
    struct.var_ab8bf90d2d11f3e0 = var_ab8bf90d2d11f3e0;
    struct.is_crawling = is_crawling;
    return struct;
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x61c
// Size: 0x146
function private function_eee30195769f679e(struct) {
    alias = "";
    if (isdefined(struct.var_5096c84907869455)) {
        alias = alias + struct.var_5096c84907869455;
        if (self._blackboard.movetype != struct.var_5096c84907869455) {
            return undefined;
        }
    }
    if (isdefined(struct.var_ab8bf90d2d11f3e0)) {
        alias = alias + "_a" + ter_op(struct.var_ab8bf90d2d11f3e0 == "down", "d", "u");
        if (!isdefined(self._blackboard.var_f20ced1f24ab8752) || ter_op(self._blackboard.var_f20ced1f24ab8752 > 0, "up", "down") != struct.var_ab8bf90d2d11f3e0) {
            return undefined;
        }
    }
    if (isdefined(struct.is_crawling)) {
        var_88644d142fca51e5 = alias == "";
        alias = alias + ter_op(struct.is_crawling, ter_op(var_88644d142fca51e5, "", "_crawl"));
        if (namespace_9e6ef02d993a7eba::is_crawling() != struct.is_crawling) {
            return undefined;
        }
    }
    return alias;
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x76a
// Size: 0x45
function private function_3efc6f398dd71d26(alias) {
    self function_164c05dd1bcfbca7("move", alias);
    if (asm_currentstatehasflag(self.asmname, "move")) {
        asm_fireevent_internal(self.asmname, "loop_reroll_anim");
    }
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b6
// Size: 0x17e
function private function_692d3f57a32b93d9() {
    self endon("death");
    var_43a41b8e241075d9 = self.var_274e0c05ec5c89c0;
    var_f1a9200c39365c50 = self.var_d28e54645050df58;
    var_e7559f0d8df0d81b = self.script_pushable;
    var_5551942656a0fa38 = self.var_8f499cbc08e88e90;
    var_22af11ae0bd93d28 = 0.5;
    while (1) {
        self waittill("wander_start");
        move_speed = self.var_47399212b3052720.var_96e932e5fc805af8[1].movetype;
        if (function_2201d3f3d7ab07a7() > 20) {
            move_speed = "wander_agitated";
        }
        function_f1e5805da192a1ef(move_speed, "wander", 22);
        self.var_274e0c05ec5c89c0 = 0;
        self.var_d28e54645050df58 = 0;
        self.script_pushable = 0;
        if (self.turnrate > 0 && self.turnrate * var_22af11ae0bd93d28 > 0) {
            self.turnrate = self.turnrate * var_22af11ae0bd93d28;
        }
        self waittill("wander_end");
        function_f1e5805da192a1ef(undefined, "wander");
        self.var_274e0c05ec5c89c0 = var_43a41b8e241075d9;
        self.var_d28e54645050df58 = var_f1a9200c39365c50;
        self.var_d28e54645050df58 = var_e7559f0d8df0d81b;
        if (self.turnrate > 0 && self.turnrate / var_22af11ae0bd93d28 > 0) {
            self.turnrate = self.turnrate / var_22af11ae0bd93d28;
        }
    }
}

// Namespace namespace_85955b341e67f12f/namespace_15764f2455729041
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93b
// Size: 0x5a
function private function_1f797587d4ca0c09() {
    self endon("death");
    while (1) {
        self waittill("investigate_start");
        if (function_2201d3f3d7ab07a7() <= 20) {
            move_speed = "investigate";
            function_f1e5805da192a1ef(move_speed, "investigate", 23);
            self waittill("investigate_end");
            function_f1e5805da192a1ef(undefined, "investigate");
        }
    }
}

