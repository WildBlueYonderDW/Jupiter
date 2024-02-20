// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_3213ad392f3a6fc;

// Namespace namespace_3213ad392f3a6fc/namespace_78c973ae34c2db64
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x35
function function_467e902477696e(taskid, params) {
    if (!ent_flag("in_pain")) {
        return anim.failure;
    }
    return anim.success;
}

