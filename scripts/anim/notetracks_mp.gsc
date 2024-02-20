// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\anim\utility_common.gsc;
#using script_77c18cdedec620b3;
#using scripts\anim\notetracks.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace namespace_67c957f3e2881af7;

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153
// Size: 0x22
function registernotetracksifnot() {
    if (isdefined(anim.notetracks)) {
        return;
    }
    anim.notetracks = [];
    registernotetracks();
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c
// Size: 0x8f
function registernotetracks() {
    level._defaultnotetrackhandler = &handlenotetrack;
    level.fnnotetrackprefixhandler = &function_6d9ff7d18e45dc9c;
    namespace_a4081f3d58d76916::registernotetracks();
    anim.notetracks["anim_pose = stand"] = &notetrackposestand;
    anim.notetracks["anim_pose = crouch"] = &notetrackposecrouch;
    anim.notetracks["anim_pose = prone"] = &notetrackposeprone;
    anim.notetracks["gun drop"] = &notetrackgundrop;
    anim.notetracks["dropgun"] = &notetrackgundrop;
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x212
// Size: 0xbf
function handlenotetrack(note, flagname, customfunction, var_35ce7799b701c978) {
    if (namespace_a4081f3d58d76916::hascustomnotetrackhandler(note)) {
        return namespace_a4081f3d58d76916::handlecustomnotetrackhandler(note, flagname, customfunction, var_35ce7799b701c978);
    }
    retval = namespace_a4081f3d58d76916::handlecommonnotetrack(note, flagname, customfunction, var_35ce7799b701c978);
    if (isdefined(retval) && retval == "__unhandled") {
        retval = undefined;
        switch (note) {
        case #"hash_88cce8d6571fe7e1":
            if (weaponclass(self.weapon) == "rocketlauncher") {
                notetrackrocketlauncherammoattach();
            }
            break;
        default:
            if (isdefined(customfunction)) {
                if (isdefined(var_35ce7799b701c978)) {
                    return [[ customfunction ]](note, var_35ce7799b701c978);
                } else {
                    return [[ customfunction ]](note);
                }
            }
            break;
        }
    }
    return retval;
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9
// Size: 0x15a
function function_6d9ff7d18e45dc9c(notetrack) {
    prefix = getsubstr(notetrack, 0, 3);
    if (prefix == "as_") {
        alias = getsubstr(notetrack, 3);
        if (isdefined(self.anim_playsound_func)) {
            self thread [[ self.anim_playsound_func ]](alias);
        }
        return 1;
    }
    if (prefix == "vm_") {
        animation = getsubstr(notetrack, 3);
        if (isdefined(self.anim_playvm_func)) {
            self thread [[ self.anim_playvm_func ]](animation);
        }
        return 1;
    }
    if (prefix == "ws_") {
        state = getsubstr(notetrack, 3);
        if (isdefined(self.weapon_state_func)) {
            self thread [[ self.weapon_state_func ]](state);
        }
        return 1;
    }
    if (prefix == "cm_") {
        var_d8958445ed7ab829 = getsubstr(notetrack, 3);
        if (isdefined(self.cinematic_motion_override)) {
            self thread [[ self.cinematic_motion_override ]](var_d8958445ed7ab829);
        }
        return 1;
    }
    if (prefix == "df_") {
        var_2c300a0c859aa22 = getsubstr(notetrack, 3);
        if (isdefined(self.dof_func)) {
            self thread [[ self.dof_func ]](var_2c300a0c859aa22);
        }
        return 1;
    }
    return namespace_a4081f3d58d76916::notetrack_prefix_handler_common(notetrack);
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0x3c
function notetrackrocketlauncherammoattach() {
    /#
        assert(isdefined(self));
    #/
    if (!isalive(self)) {
        return;
    }
    if (!usingrocketlauncher()) {
        return;
    }
    if (self tagexists("tag_rocket")) {
        self showpart("tag_rocket");
    }
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e
// Size: 0x5c
function notetrackgundrop(note, flagname) {
    if (!isai(self)) {
        /#
            println("<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>" + note + "<unknown string>");
        #/
        return;
    }
    if (isdefined(self.fndropweapon)) {
        self [[ self.fndropweapon ]]();
    }
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e1
// Size: 0x28
function setpose(pose) {
    self.currentpose = pose;
    namespace_28edc79fcf2fe234::bb_requeststance(pose);
    self notify("entered_pose" + pose);
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510
// Size: 0x20
function notetrackposestand(note, flagname) {
    setpose("stand");
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537
// Size: 0x20
function notetrackposecrouch(note, flagname) {
    setpose("crouch");
}

// Namespace namespace_67c957f3e2881af7/namespace_aca06a2f73bc4246
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e
// Size: 0x20
function notetrackposeprone(note, flagname) {
    setpose("prone");
}

