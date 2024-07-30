#using scripts\engine\utility.gsc;

#namespace zombie_pain;

// Namespace zombie_pain / namespace_78c973ae34c2db64
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x34
function isinpain(taskid, params) {
    if (!ent_flag("in_pain")) {
        return anim.failure;
    }
    return anim.success;
}

