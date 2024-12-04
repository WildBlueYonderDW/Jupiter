#using scripts\aitypes\bt_util;
#using scripts\aitypes\dismember;
#using scripts\anim\utility_common;

#namespace dismember;

// Namespace dismember / scripts\aitypes\dismember
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2
// Size: 0x90
function initscriptablepart(part) {
    if (!isdefined(self._blackboard.scriptableparts)) {
        self._blackboard.scriptableparts = [];
    }
    if (!isdefined(self._blackboard.scriptableparts[part])) {
        self._blackboard.scriptableparts[part] = spawnstruct();
        self._blackboard.scriptableparts[part].state = "normal";
    }
}

// Namespace dismember / scripts\aitypes\dismember
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18a
// Size: 0xfd
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

// Namespace dismember / scripts\aitypes\dismember
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28f
// Size: 0xbc
function set_scriptablepartstate(part, state, waittime) {
    self endon("entitydeleted");
    set_scriptablepartinfo(part, state);
    if (isdefined(waittime)) {
        wait waittime;
    }
    if (isdefined(self.scriptablecleanup)) {
        return 1;
    }
    partstate = self._blackboard.scriptableparts[part].state;
    if (isdefined(anim.dismemberheavyfx[self.unittype])) {
        if (part != "head" && partstate != "dismember") {
            if (usedismemberfxlite(self.unittype)) {
                partstate += "_lite";
            }
        }
    }
    self setscriptablepartstate(part, partstate);
}

// Namespace dismember / scripts\aitypes\dismember
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x353
// Size: 0xac
function setdismemberstatefx(part) {
    fx_part = part + "_dism_fx";
    state = get_scriptablepartinfo(part);
    if (state == "normal") {
        state = "undamaged";
    } else if (issubstr(state, "_both")) {
        state = "dmg_both";
    }
    if (!isdefined(level.in_vr) && isdefined(anim.dismemberheavyfx[self.unittype])) {
        if (part != "head") {
            if (usedismemberfxlite(self.unittype)) {
                state += "_lite";
            }
        }
    }
    self setscriptablepartstate(fx_part, state);
}

// Namespace dismember / scripts\aitypes\dismember
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x407
// Size: 0x98
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
        return false;
    }
    anim.dismemberheavyfx[type] = newarray;
    return true;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a8
// Size: 0x66
function get_scriptablepartinfo(part) {
    if (!isdefined(self._blackboard.scriptableparts)) {
        return "normal";
    }
    if (!isdefined(self._blackboard.scriptableparts[part])) {
        return "normal";
    }
    return self._blackboard.scriptableparts[part].state;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x517
// Size: 0x2f
function anylegdismembered() {
    if (get_scriptablepartinfo("left_leg") == "dismember" || get_scriptablepartinfo("right_leg") == "dismember") {
        return true;
    }
    return false;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54f
// Size: 0x2f
function bothlegsdismembered() {
    if (get_scriptablepartinfo("left_leg") == "dismember" && get_scriptablepartinfo("right_leg") == "dismember") {
        return true;
    }
    return false;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x587
// Size: 0x2f
function anyarmdismembered() {
    if (get_scriptablepartinfo("left_arm") == "dismember" || get_scriptablepartinfo("right_arm") == "dismember") {
        return true;
    }
    return false;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf
// Size: 0x1a
function rightarmdismembered() {
    if (get_scriptablepartinfo("right_arm") == "dismember") {
        return true;
    }
    return false;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e2
// Size: 0x1a
function leftarmdismembered() {
    if (get_scriptablepartinfo("left_arm") == "dismember") {
        return true;
    }
    return false;
}

// Namespace dismember / scripts\aitypes\dismember
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x605
// Size: 0x2f
function botharmsdismembered() {
    if (scripts\aitypes\dismember::get_scriptablepartinfo("left_arm") == "dismember" && scripts\aitypes\dismember::get_scriptablepartinfo("right_arm") == "dismember") {
        return true;
    }
    return false;
}

