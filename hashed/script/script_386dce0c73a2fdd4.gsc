// mwiii decomp prototype
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_405d05c89e998922;

#namespace namespace_b4de76d2d2c1c2ca;

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a
// Size: 0x114
function function_29b5fb70d7ea841() {
    function_406984e213848212("melee", &function_79d559d24ce75889, &function_f01c824a76203041);
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(undefined, undefined, 1));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "walk", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "run", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "sprint", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "super_sprint", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "wander", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "wander_shuffle", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "wander_agitated", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(1, "investigate", undefined));
    function_3f5173a731bdfe2f("melee", function_28d26d7ead912662(0, undefined, 0));
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0x63
function function_52b682d1bb0ddc02() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &function_b06e7f5eb1e44850);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_is_moving_melee_changed", &function_830afe26e7e7e559);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_is_crawling_changed", &function_6221279973a1af55);
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf
// Size: 0xf
function function_be2d0b11a3aaba0c() {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d5
// Size: 0x18
function private function_b06e7f5eb1e44850(params) {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x18
function private function_830afe26e7e7e559(params) {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x313
// Size: 0x18
function private function_6221279973a1af55(params) {
    function_8626c13b5be18c1b("melee");
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x332
// Size: 0x54
function private function_28d26d7ead912662(var_f261c2f31d7de033, var_5096c84907869455, is_crawling) {
    struct = spawnstruct();
    struct.var_f261c2f31d7de033 = var_f261c2f31d7de033;
    struct.var_5096c84907869455 = var_5096c84907869455;
    struct.is_crawling = is_crawling;
    return struct;
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38e
// Size: 0x10a
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
    if (isdefined(struct.is_crawling)) {
        alias = alias + ter_op(struct.is_crawling, ter_op(alias != "", "_", "") + "crawl", "");
        if (namespace_9e6ef02d993a7eba::is_crawling() != struct.is_crawling) {
            return undefined;
        }
    }
    return alias;
}

// Namespace namespace_b4de76d2d2c1c2ca/namespace_e14c6ab0ceb9c048
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a0
// Size: 0x19
function private function_f01c824a76203041(alias) {
    self function_164c05dd1bcfbca7("melee", alias);
}

