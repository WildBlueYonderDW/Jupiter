// mwiii decomp prototype
#using script_bd0d3e8f9ff5c11;

#namespace namespace_16e4ada217cd5608;

// Namespace namespace_16e4ada217cd5608/namespace_80283ad72c21b0c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0xf8
function function_b209f843e410abb5(taskid) {
    target = self.enemy;
    if (!isalive(target)) {
        return anim.failure;
    }
    if (abs(target.origin[2] - self.origin[2]) > 100) {
        return anim.failure;
    }
    if (!istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a379ec913c7fcfa1)) {
        return anim.failure;
    }
    var_2ab7eab2d8c5a35f = function_f0ef5d175747f19f(target.origin);
    if (isdefined(var_2ab7eab2d8c5a35f)) {
        var_5472fac695b32f65 = function_5e2c6953b8312bd6(var_2ab7eab2d8c5a35f);
        if (var_5472fac695b32f65 < 1000) {
            return anim.failure;
        }
    }
    if (function_e82696e7b59178f3(target.origin)) {
        return anim.failure;
    }
    return anim.success;
}

