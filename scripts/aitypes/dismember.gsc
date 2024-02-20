// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\aitypes\dismember.gsc;

#namespace dismember;

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2
// Size: 0x91
function initscriptablepart(part) {
    if (!isdefined(self._blackboard.scriptableparts)) {
        self._blackboard.scriptableparts = [];
    }
    if (!isdefined(self._blackboard.scriptableparts[part])) {
        self._blackboard.scriptableparts[part] = spawnstruct();
        self._blackboard.scriptableparts[part].state = "normal";
    }
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18a
// Size: 0xfe
function set_scriptablepartinfo(part, state) {
    if (self._blackboard.scriptableparts[part].state == "dismember") {
        return;
    }
    if (self._blackboard.scriptableparts[part].state != "normal" && state != "dismember") {
        self._blackboard.scriptableparts[part].state = self._blackboard.scriptableparts[part].state + "_both";
    } else {
        self._blackboard.scriptableparts[part].state = state;
    }
    self._blackboard.scriptableparts[part].time = gettime();
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28f
// Size: 0xbd
function set_scriptablepartstate(part, state, waittime) {
    self endon("entitydeleted");
    set_scriptablepartinfo(part, state);
    if (isdefined(waittime)) {
        wait(waittime);
    }
    if (isdefined(self.scriptablecleanup)) {
        return 1;
    }
    var_68d9e792fe9def4d = self._blackboard.scriptableparts[part].state;
    if (isdefined(anim.dismemberheavyfx[self.unittype])) {
        if (part != "head" && var_68d9e792fe9def4d != "dismember") {
            if (usedismemberfxlite(self.unittype)) {
                var_68d9e792fe9def4d = var_68d9e792fe9def4d + "_lite";
            }
        }
    }
    self setscriptablepartstate(part, var_68d9e792fe9def4d);
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x353
// Size: 0xad
function setdismemberstatefx(part) {
    var_bedc4a2a8ea9768d = part + "_dism_fx";
    state = get_scriptablepartinfo(part);
    if (state == "normal") {
        state = "undamaged";
    } else if (issubstr(state, "_both")) {
        state = "dmg_both";
    }
    if (!isdefined(level.in_vr) && isdefined(anim.dismemberheavyfx[self.unittype])) {
        if (part != "head") {
            if (usedismemberfxlite(self.unittype)) {
                state = state + "_lite";
            }
        }
    }
    self setscriptablepartstate(var_bedc4a2a8ea9768d, state);
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x407
// Size: 0x99
function usedismemberfxlite(type) {
    newarray = [];
    for (i = 0; i < anim.dismemberheavyfx[type].size; i++) {
        if (gettime() - anim.dismemberheavyfx[type][i] > 1000) {
            continue;
        }
        newarray[newarray.size] = anim.dismemberheavyfx[type][i];
    }
    if (newarray.size < 0) {
        newarray[newarray.size] = gettime();
        anim.dismemberheavyfx[type] = newarray;
        return 0;
    }
    anim.dismemberheavyfx[type] = newarray;
    return 1;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a8
// Size: 0x67
function get_scriptablepartinfo(part) {
    if (!isdefined(self._blackboard.scriptableparts)) {
        return "normal";
    }
    if (!isdefined(self._blackboard.scriptableparts[part])) {
        return "normal";
    }
    return self._blackboard.scriptableparts[part].state;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x517
// Size: 0x30
function anylegdismembered() {
    if (get_scriptablepartinfo("left_leg") == "dismember" || get_scriptablepartinfo("right_leg") == "dismember") {
        return 1;
    }
    return 0;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54f
// Size: 0x30
function bothlegsdismembered() {
    if (get_scriptablepartinfo("left_leg") == "dismember" && get_scriptablepartinfo("right_leg") == "dismember") {
        return 1;
    }
    return 0;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x587
// Size: 0x30
function anyarmdismembered() {
    if (get_scriptablepartinfo("left_arm") == "dismember" || get_scriptablepartinfo("right_arm") == "dismember") {
        return 1;
    }
    return 0;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf
// Size: 0x1b
function rightarmdismembered() {
    if (get_scriptablepartinfo("right_arm") == "dismember") {
        return 1;
    }
    return 0;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e2
// Size: 0x1b
function leftarmdismembered() {
    if (get_scriptablepartinfo("left_arm") == "dismember") {
        return 1;
    }
    return 0;
}

// Namespace dismember/namespace_3cb6c1a61c8d4846
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x605
// Size: 0x30
function botharmsdismembered() {
    if (namespace_3cb6c1a61c8d4846::get_scriptablepartinfo("left_arm") == "dismember" && namespace_3cb6c1a61c8d4846::get_scriptablepartinfo("right_arm") == "dismember") {
        return 1;
    }
    return 0;
}

