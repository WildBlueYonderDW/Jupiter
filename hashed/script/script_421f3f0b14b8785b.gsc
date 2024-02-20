// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_9e7e287a72e995a1;

// Namespace namespace_9e7e287a72e995a1/namespace_2db0a94a6f3680c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0x46
function function_88de778c36c85601(taskid) {
    self.var_81de213f1930ca23 = function_fdc9d5557c53078e(self.var_81de213f1930ca23);
    if (self.var_81de213f1930ca23.size > 0) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace namespace_9e7e287a72e995a1/namespace_2db0a94a6f3680c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe
// Size: 0x6f
function function_d76a0008f2159ab4(taskid) {
    var_3fd3b525001c8401 = isdefined(self.var_aa9ea14cf354838f) ? 1 : self.var_aa9ea14cf354838f;
    var_8f04bb19de1233e8 = self.health / self.maxhealth;
    if (var_3fd3b525001c8401 - var_8f04bb19de1233e8 >= 0.2) {
        return anim.success;
    }
    return anim.failure;
}

