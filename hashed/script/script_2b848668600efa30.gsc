// mwiii decomp prototype
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;

#namespace namespace_824fdea5389ab963;

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3
// Size: 0xa8
function function_29b5fb70d7ea841() {
    function_406984e213848212("melee", &function_79d559d24ce75889, &function_f01c824a76203041);
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(0, undefined, 0));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(0, undefined, 1));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "walk", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "run", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "sprint", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, undefined, undefined));
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192
// Size: 0x43
function function_3ff40056b91b6e90() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_is_moving_melee_changed", &function_830afe26e7e7e559);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &function_b06e7f5eb1e44850);
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0xf
function function_bd41a979b3c3bcb6() {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f2
// Size: 0x18
function private function_830afe26e7e7e559(params) {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x18
function private function_b06e7f5eb1e44850(params) {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x230
// Size: 0x54
function private function_28d26d7ead912662(var_f261c2f31d7de033, var_5096c84907869455, var_d90af5177d0db456) {
    struct = spawnstruct();
    struct.var_f261c2f31d7de033 = var_f261c2f31d7de033;
    struct.var_5096c84907869455 = var_5096c84907869455;
    struct.var_d90af5177d0db456 = var_d90af5177d0db456;
    return struct;
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x10d
function private function_79d559d24ce75889(struct) {
    alias = "";
    if (isdefined(struct.var_f261c2f31d7de033)) {
        alias = alias + ter_op(istrue(self.var_f261c2f31d7de033), "move", "static");
        if (istrue(self.var_f261c2f31d7de033) != struct.var_f261c2f31d7de033) {
            return undefined;
        }
    }
    if (isdefined(struct.var_5096c84907869455)) {
        alias = alias + "_" + struct.var_5096c84907869455;
        if (self._blackboard.movetype != struct.var_5096c84907869455) {
            return undefined;
        }
    }
    if (isdefined(struct.var_d90af5177d0db456)) {
        alias = alias + ter_op(struct.var_d90af5177d0db456, ter_op(alias != "", "_", "") + "single_armed", "");
        if (self.var_f719fcdc90b79bb8 != struct.var_d90af5177d0db456) {
            return undefined;
        }
    }
    return alias;
}

// Namespace namespace_824fdea5389ab963/namespace_31f2d672614940ac
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a1
// Size: 0x19
function private function_f01c824a76203041(alias) {
    self function_164c05dd1bcfbca7("melee", alias);
}

