#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\common\cap.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\asm\asm.gsc;
#using scripts\sp\spawner.gsc;

#namespace namespace_5bf3bd82da62657f;

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2051
// Size: 0x48
function function_f5102a91e43f54c() {
    level.var_4e54744114646611 = -1;
    setdvarifuninitialized(@"hash_fca88e0fd0d8219", 1);
    /#
        setdvarifuninitialized(@"hash_a9dc1d3a6b52a4e", 0);
        setdvarifuninitialized(@"hash_5da9c798d17a834", 0);
    #/
    function_79a41c436fac1a57();
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x20a1
// Size: 0xd8b
function private function_79a41c436fac1a57() {
    level.var_b3f1be0e22c453e6 = [2, 3, 6, 9, 8, 7, 4, 1, 2];
    level.var_a9326f5eacbd188b = gettime() + 20000 + randomfloatrange(60000, 120000);
    level.var_1b77801913f2dcab = randomfloatrange(60000, 120000);
    level.scr_anim["generic"]["impactreact_stand_stopped_9"] = [generic_human%sdr_stl_exposed_lg_reaction01_1, generic_human%sdr_com_exposed_reaction_lookaround01_1, generic_human%sdr_com_exposed_reaction_lookaround02_1];
    level.scr_anim["generic"]["impactreact_stand_stopped_8"] = [generic_human%sdr_stl_exposed_lg_reaction01_2, generic_human%sdr_com_exposed_reaction_lookaround01_2, generic_human%sdr_com_exposed_reaction_lookaround02_2, generic_human%sdr_com_exposed_reaction_lookaround03_2];
    level.scr_anim["generic"]["impactreact_stand_stopped_7"] = [generic_human%sdr_stl_exposed_lg_reaction01_3, generic_human%sdr_com_exposed_reaction_lookaround01_3, generic_human%sdr_com_exposed_reaction_lookaround02_3];
    level.scr_anim["generic"]["impactreact_stand_stopped_6"] = [generic_human%sdr_stl_exposed_lg_reaction01_4, generic_human%sdr_com_exposed_reaction_lookaround01_4, generic_human%sdr_com_exposed_reaction_lookaround02_4];
    level.scr_anim["generic"]["impactreact_stand_stopped_4"] = [generic_human%sdr_stl_exposed_lg_reaction01_6, generic_human%sdr_com_exposed_reaction_lookaround01_6, generic_human%sdr_com_exposed_reaction_lookaround02_6];
    level.scr_anim["generic"]["impactreact_stand_stopped_3"] = [generic_human%sdr_stl_exposed_lg_reaction01_7, generic_human%sdr_com_exposed_reaction_lookaround01_7, generic_human%sdr_com_exposed_reaction_lookaround02_7];
    level.scr_anim["generic"]["impactreact_stand_stopped_2"] = [generic_human%sdr_stl_exposed_lg_reaction01_8, generic_human%sdr_com_exposed_reaction_lookaround01_8, generic_human%sdr_com_exposed_reaction_lookaround02_8];
    level.scr_anim["generic"]["impactreact_stand_stopped_1"] = [generic_human%sdr_stl_exposed_lg_reaction01_9, generic_human%sdr_com_exposed_reaction_lookaround01_9, generic_human%sdr_com_exposed_reaction_lookaround02_9];
    level.scr_anim["generic"]["impactreact_crouch_stopped_1"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_1, generic_human%sdr_com_exp_crouch_reaction02_exit_1, generic_human%sdr_com_exp_crouch_reaction03_exit_1, generic_human%sdr_com_exp_crouch_reaction04_exit_1];
    level.scr_anim["generic"]["impactreact_crouch_stopped_2"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_2, generic_human%sdr_com_exp_crouch_reaction02_exit_2];
    level.scr_anim["generic"]["impactreact_crouch_stopped_3"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_3, generic_human%sdr_com_exp_crouch_reaction02_exit_3];
    level.scr_anim["generic"]["impactreact_crouch_stopped_4"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_4, generic_human%sdr_com_exp_crouch_reaction02_exit_4];
    level.scr_anim["generic"]["impactreact_crouch_stopped_6"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_6, generic_human%sdr_com_exp_crouch_reaction02_exit_6];
    level.scr_anim["generic"]["impactreact_crouch_stopped_7"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_7, generic_human%sdr_com_exp_crouch_reaction02_exit_7];
    level.scr_anim["generic"]["impactreact_crouch_stopped_8"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_8l, generic_human%sdr_com_exp_crouch_reaction01_exit_8r, generic_human%sdr_com_exp_crouch_reaction02_exit_8l, generic_human%sdr_com_exp_crouch_reaction02_exit_8r];
    level.scr_anim["generic"]["impactreact_crouch_stopped_9"] = [generic_human%sdr_com_exp_crouch_reaction01_exit_9, generic_human%sdr_com_exp_crouch_reaction02_exit_9];
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_1"] = [generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_1, generic_human%sdr_com_exp_crouch_reaction_to_prone02_exit_1];
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_2"] = [generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_2, generic_human%sdr_com_exp_crouch_reaction_to_prone02_exit_2];
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_3"] = generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_3;
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_4"] = [generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_4, generic_human%sdr_com_exp_crouch_reaction_to_prone02_exit_4];
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_6"] = generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_6;
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_7"] = generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_7;
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_8"] = [generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_8l, generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_8r, generic_human%sdr_com_exp_crouch_reaction_to_prone02_exit_8l];
    level.scr_anim["generic"]["impactreact_crouchtoprone_stopped_9"] = [generic_human%sdr_com_exp_crouch_reaction_to_prone01_exit_9, generic_human%sdr_com_exp_crouch_reaction_to_prone02_exit_9];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_1"] = [generic_human%sdr_com_exposed_reaction_point01_1, generic_human%sdr_com_exposed_reaction_point02_1];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_2"] = [generic_human%sdr_com_exposed_reaction_point01_2, generic_human%sdr_com_exposed_reaction_point02_2, generic_human%sdr_com_exposed_reaction_point03_2, generic_human%sdr_com_exposed_reaction_point04_2];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_3"] = [generic_human%sdr_com_exposed_reaction_point01_3, generic_human%sdr_com_exposed_reaction_point02_3];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_4"] = [generic_human%sdr_com_exposed_reaction_point01_4, generic_human%sdr_com_exposed_reaction_point02_4, generic_human%sdr_com_exposed_reaction_point03_4, generic_human%sdr_com_exposed_reaction_point04_4];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_6"] = [generic_human%sdr_com_exposed_reaction_point01_6, generic_human%sdr_com_exposed_reaction_point02_6];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_7"] = [generic_human%sdr_com_exposed_reaction_point01_7, generic_human%sdr_com_exposed_reaction_point02_7];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_8"] = [generic_human%sdr_com_exposed_reaction_point01_8, generic_human%sdr_com_exposed_reaction_point02_8, generic_human%sdr_com_exposed_reaction_point03_8, generic_human%sdr_com_exposed_reaction_point04_8];
    level.scr_anim["generic"]["impactreact_standpoint_stopped_9"] = [generic_human%sdr_com_exposed_reaction_point01_9, generic_human%sdr_com_exposed_reaction_point02_9];
    level.scr_anim["generic"]["impactreact_veerright"] = [generic_human%sdr_com_strafe_run_stumble_veerright01, generic_human%sdr_com_strafe_run_stumble_veerright02, generic_human%sdr_com_strafe_run_stumble_veerright03];
    level.scr_anim["generic"]["impactreact_veerleft"] = [generic_human%sdr_com_strafe_run_stumble_veerleft01, generic_human%sdr_com_strafe_run_stumble_veerleft02, generic_human%sdr_com_strafe_run_stumble_veerleft03];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_9"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_1, generic_human%civ_pnc_exposed_stand_sm_reaction02_1];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_8"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_2, generic_human%civ_pnc_exposed_stand_sm_reaction02_2, generic_human%civ_pnc_exposed_stand_sm_reaction03_2];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_7"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_3, generic_human%civ_pnc_exposed_stand_sm_reaction02_3, generic_human%civ_pnc_exposed_stand_sm_reaction03_3];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_6"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_4, generic_human%civ_pnc_exposed_stand_sm_reaction02_4, generic_human%civ_pnc_exposed_stand_sm_reaction03_4];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_4"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_6, generic_human%civ_pnc_exposed_stand_sm_reaction02_6, generic_human%civ_pnc_exposed_stand_sm_reaction03_6];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_3"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_7, generic_human%civ_pnc_exposed_stand_sm_reaction02_7, generic_human%civ_pnc_exposed_stand_sm_reaction03_7];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_2"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_8, generic_human%civ_pnc_exposed_stand_sm_reaction02_8];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_sm_1"] = [generic_human%civ_pnc_exposed_stand_sm_reaction01_9, generic_human%civ_pnc_exposed_stand_sm_reaction02_9, generic_human%civ_pnc_exposed_stand_sm_reaction03_9];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_9"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_1, generic_human%civ_pnc_exposed_stand_md_reaction02_1];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_8"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_2, generic_human%civ_pnc_exposed_stand_md_reaction02_2, generic_human%civ_pnc_exposed_stand_md_reaction03_2];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_7"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_3, generic_human%civ_pnc_exposed_stand_md_reaction02_3, generic_human%civ_pnc_exposed_stand_md_reaction03_3];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_6"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_4, generic_human%civ_pnc_exposed_stand_md_reaction02_4, generic_human%civ_pnc_exposed_stand_md_reaction03_4];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_4"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_6, generic_human%civ_pnc_exposed_stand_md_reaction02_6, generic_human%civ_pnc_exposed_stand_md_reaction03_6];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_3"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_7, generic_human%civ_pnc_exposed_stand_md_reaction02_7, generic_human%civ_pnc_exposed_stand_md_reaction03_7];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_2"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_8, generic_human%civ_pnc_exposed_stand_md_reaction02_8, generic_human%civ_pnc_exposed_stand_md_reaction03_8];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_md_1"] = [generic_human%civ_pnc_exposed_stand_md_reaction01_9, generic_human%civ_pnc_exposed_stand_md_reaction02_9, generic_human%civ_pnc_exposed_stand_md_reaction03_9];
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_9"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_1;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_8"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_2;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_7"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_3;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_6"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_4;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_4"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_6;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_3"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_7;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_2"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_8;
    level.scr_anim["generic"]["impactreact_civ_exp_stand_lg_1"] = generic_human%civ_pnc_exposed_stand_lg_reaction01_9;
    level.scr_anim["generic"]["impactreact_civ_truckguy_9"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_1@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_8"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_2l@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_7"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_3@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_6"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_4@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_4"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_6@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_3"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_7@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_2"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01@1;
    level.scr_anim["generic"]["impactreact_civ_truckguy_1"] = generic_human%civ_cap_relax01_stand_exposed_to_panic01_turn_9@1;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2e34
// Size: 0x1c
function private function_99f7bbbacd20bcd3() {
    level.var_a9326f5eacbd188b = gettime() + randomintrange(30000, 60000);
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2e58
// Size: 0x1c
function private function_58dada2341b4f033() {
    level.var_1b77801913f2dcab = gettime() + randomintrange(15000, 45000);
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7c
// Size: 0x16
function function_3128f6417cd641c8() {
    if (!function_bec698acfc9face2()) {
        return true;
    }
    function_62595a7dcb6f8288();
    return false;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2e9b
// Size: 0x12a
function private function_bec698acfc9face2() {
    if (istrue(self.var_e169a98f19389f0d)) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x1c>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return false;
    }
    if (istrue(self.var_a2cc368f643121b)) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x2e>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return false;
    }
    if (isdefined(self.var_3cd0247f55f054cf) && gettime() < self.var_3cd0247f55f054cf) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x43>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return false;
    }
    if (!istrue(self.var_d969c19cd8c7770a) && self isinscriptedstate()) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x59>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return false;
    }
    return true;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2fce
// Size: 0x28c
function private function_9aa9579f6f4d57ad(impactdata) {
    prefix = undefined;
    ismoving = isdefined(self.pathgoalpos) && length(self.velocity) > 80;
    if (!ismoving) {
        var_74bc90a66066ec6b = 0;
        var_50c48395313cb9de = 0;
        if (self.currentpose == "stand") {
            if (distance2dsquared(self.origin, impactdata.origin) > squared(impactdata.var_ceffcb0d6eeac4e6 * 0.75) && gettime() > level.var_1b77801913f2dcab) {
                var_50c48395313cb9de = cointoss();
            }
        } else if (self.currentpose == "crouch") {
            if (gettime() > level.var_a9326f5eacbd188b) {
                var_74bc90a66066ec6b = cointoss();
            }
        }
        if (var_50c48395313cb9de) {
            prefix = "impactreact_standpoint_stopped_";
            self.var_aeab0d571314b52f = 1;
            function_58dada2341b4f033();
        } else if (var_74bc90a66066ec6b) {
            prefix = "impactreact_crouchtoprone_stopped_";
            function_99f7bbbacd20bcd3();
        } else {
            prefix = "impactreact_" + self.currentpose + "_stopped_";
        }
    } else if (getdvarint(@"hash_fca88e0fd0d8219") > 0) {
        var_c5846d4a1737a425 = squared(impactdata.var_ceffcb0d6eeac4e6 * 0.5);
        var_1b837b6e7f2f4e73 = squared(impactdata.var_ceffcb0d6eeac4e6 * 1);
        distsqrd = distance2dsquared(self.origin, impactdata.origin);
        if (distsqrd < var_c5846d4a1737a425 || distsqrd > var_1b837b6e7f2f4e73) {
            return undefined;
        }
        right = vectornormalize(anglestoright(self.angles));
        dot = vectordot((0, right[1], 0), impactdata.flatdir);
        self.var_211b1c0251a20e76 = 1;
        if (dot > 0) {
            if (function_9514792684c48831()) {
                /#
                    print3d(self.origin, "<dev string:x68>", (1, 0, 0), 1, 1, 100);
                #/
            }
            prefix = "impactreact_veerright";
        } else {
            if (function_9514792684c48831()) {
                /#
                    print3d(self.origin, "<dev string:x73>", (1, 0, 0), 1, 1, 100);
                #/
            }
            prefix = "impactreact_veerleft";
        }
    }
    return prefix;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3263
// Size: 0x65a
function private function_62595a7dcb6f8288(impactdata) {
    self endon("death");
    if (!function_bec698acfc9face2()) {
        return 0;
    }
    var_4c9c8667b5961059 = istrue(self.a.painplaying);
    if (var_4c9c8667b5961059) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x7d>", (1, 0, 0), 1, 1, 100);
            }
        #/
        function_28f677f8f4951bc2(1);
        return;
    }
    if (!isdefined(impactdata)) {
        impactdata = level.gunship.var_c8122d8b582aef7f;
        var_4b65413211af7033 = vectortoangles(self.origin - impactdata.origin);
    } else {
        var_4b65413211af7033 = impactdata.var_58486720d3770552;
    }
    if (isdefined(self.var_d0fc15b7a3fcc7b2)) {
        prefix = self.var_d0fc15b7a3fcc7b2;
        self.var_d0fc15b7a3fcc7b2 = undefined;
        self.var_d969c19cd8c7770a = undefined;
    } else if (self.team == "axis") {
        prefix = function_9aa9579f6f4d57ad(impactdata);
    } else {
        prefix = "impactreact_civ_";
        distsqrd = distancesquared(impactdata.origin, self.origin);
        if (distsqrd > squared(impactdata.var_ceffcb0d6eeac4e6)) {
            return 1;
        }
        if (distsqrd < squared(impactdata.var_ceffcb0d6eeac4e6 * 0.25)) {
            prefix += "exp_stand_lg_";
        } else if (distsqrd < squared(impactdata.var_ceffcb0d6eeac4e6 * 0.5)) {
            prefix += "exp_stand_md_";
        } else if (distsqrd < squared(impactdata.var_ceffcb0d6eeac4e6)) {
            prefix += "exp_stand_sm_";
        }
    }
    if (!isdefined(prefix)) {
        return;
    }
    var_f5f6dbdad6bda2ab = isdefined(self.var_211b1c0251a20e76);
    if (!var_f5f6dbdad6bda2ab) {
        if (isdefined(self.var_aeab0d571314b52f)) {
            self.var_863de1a5bd6ce636 = undefined;
            var_4b65413211af7033 = vectortoangles(level.gunship.model_ent.camera.origin - self.origin);
            anglediff = angleclamp180(var_4b65413211af7033[1] - self.angles[1]);
        } else {
            anglediff = angleclamp180(var_4b65413211af7033[1] - self.angles[1]);
        }
        index = getangleindex(anglediff, 10);
        animindex = level.var_b3f1be0e22c453e6[index];
        anime = prefix + animindex;
    } else {
        animindex = -1;
        anime = prefix;
    }
    if (!isdefined(level.scr_anim["generic"][anime])) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, anime + "<dev string:x88>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return 0;
    }
    if (isarray(level.scr_anim["generic"][anime])) {
        size = level.scr_anim["generic"][anime].size;
        self.var_c224879dd05c38f6 = level.scr_anim["generic"][anime][randomint(size)];
    } else {
        self.var_c224879dd05c38f6 = level.scr_anim["generic"][anime];
    }
    if (istrue(self.var_dd9b788487474de1)) {
        self.var_dd9b788487474de1 = undefined;
        canmove = 1;
        movedelta = self.origin + (100, 0, 0);
    } else {
        movedelta = getmovedelta(self.var_c224879dd05c38f6, 0, 1);
        movedelta = self localtoworldcoords(movedelta);
        canmove = navisstraightlinereachable(self.origin, movedelta);
    }
    if (isdefined(self.var_211b1c0251a20e76)) {
        self.var_211b1c0251a20e76 = undefined;
        allies = getaiarray("allies");
        foreach (ally in allies) {
            if (!isalive(ally)) {
                continue;
            }
            if (distancesquared(ally.origin, self.origin) < 360000) {
                /#
                    if (function_9514792684c48831()) {
                        print3d(self.origin, "<dev string:x94>", (1, 0, 0), 1, 1, 100);
                    }
                #/
                return 0;
            }
        }
    }
    if (!canmove) {
        /#
            if (function_9514792684c48831()) {
                line(self.origin, movedelta, (1, 0, 0), 1, 1, 150);
                print3d(self.origin, anime + "<dev string:xad>", (1, 0, 0), 1, 1, 100);
            }
        #/
        self.var_c224879dd05c38f6 = undefined;
        return 0;
    } else {
        /#
            if (function_9514792684c48831()) {
                line(self.origin, movedelta, (0, 1, 0), 1, 1, 150);
            }
        #/
    }
    /#
        if (function_9514792684c48831()) {
            function_1dc1ecd44e0686d(animindex);
            var_46dea5aca6a85a66 = self.origin + anglestoforward((0, var_4b65413211af7033[1], 0)) * 100;
            line(self.origin, var_46dea5aca6a85a66, (1, 1, 1), 1, 0, 100);
            print3d(self.origin, anime, (1, 1, 1), 1, 1, 100);
        }
    #/
    disable_pain();
    self.var_a2cc368f643121b = 1;
    if (self.asmname != self.var_a942dd31d55102c9) {
        scripts\common\cap::cap_exit();
    }
    scripts\asm\asm_sp::asm_animcustom(&function_f09bb1449dcf19e2);
    self waittill("gunship_animmode_done");
    enable_pain();
    function_28f677f8f4951bc2();
    self.var_3cd0247f55f054cf = gettime() + 500;
    return 1;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x38c6
// Size: 0x22
function private function_28f677f8f4951bc2(donotify) {
    if (istrue(donotify)) {
        self notify("gunship_animmode_done");
    }
    self.var_a2cc368f643121b = 0;
}

/#

    // Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x38f0
    // Size: 0x160
    function private function_1dc1ecd44e0686d(chosen) {
        var_2d702ddb2a9c3231 = [];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [8, 0];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [7, 45];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [4, 90];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [1, 135];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [2, 180];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [3, -135];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [6, -90];
        var_2d702ddb2a9c3231[var_2d702ddb2a9c3231.size] = [9, -45];
        foreach (array in var_2d702ddb2a9c3231) {
            point = self.origin + anglestoforward((0, self.angles[1] + array[1], 0)) * 50;
            if (array[0] == chosen) {
                print3d(point, array[0], (0.9, 0.9, 0), 1, 1, 100);
                continue;
            }
            print3d(point, array[0], (1, 1, 1), 1, 1, 100);
        }
    }

#/

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a58
// Size: 0x183
function function_f09bb1449dcf19e2() {
    self endon("death");
    animation = self.var_c224879dd05c38f6;
    self.var_c224879dd05c38f6 = undefined;
    origin = getstartorigin(self.origin, self.angles, animation);
    angles = getstartangles(self.origin, self.angles, animation);
    neworigin = self getdroptofloorposition(origin);
    if (isdefined(neworigin)) {
        origin = neworigin;
    } else {
        println("<dev string:xba>" + self getentitynumber() + "<dev string:xfb>");
    }
    if (!isdefined(self.noteleport)) {
        self teleport(origin, angles);
    }
    self.pushable = 0;
    var_6e2597877d503152 = 0.2;
    blend_time = 0.2;
    self clearanim(scripts\asm\asm::asm_getroot(), 0.2);
    facialknob = scripts\asm\asm::asm_getfacialknob();
    if (isdefined(facialknob)) {
        self setanim(facialknob, 1, 0.3, 1);
    }
    self orientmode("face angle", angles[1]);
    self animmode("zonly_physics", 1);
    animflag = "gunship_animcustom";
    self setflaggedanimrestart(animflag, animation, 1, blend_time, 1);
    endnote = scripts\asm\asm::asm_donotetracks(self.asmname, animflag);
    self notify("gunship_animmode_done");
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3be3
// Size: 0x2f5
function private function_fc6c0a1e72f571d3(var_166045b0e3134cff) {
    impacts = sortbydistance(level.gunship.var_b16fecb954d8b304, self.origin);
    var_32cb65c645a87807 = 0;
    var_d8cfab43566be48c = (0, 0, 0);
    var_ce6dd2dd691a73b3 = 0;
    var_cedcbd0d6ec45e64 = 50;
    var_ceffcb0d6eeac4e6 = 100;
    var_33b583adc48ec7c0 = 1;
    scalar = 1;
    var_2dacc85d72ec17c1 = [];
    foreach (index, impact in impacts) {
        if (!istrue(var_166045b0e3134cff)) {
            distsqrd = distance2dsquared(impact.origin, self.origin);
            if (distsqrd > impact.var_c5f1b9c2e07616f4) {
                if (index == 0) {
                    var_cedcbd0d6ec45e64 = impact.var_cedcbd0d6ec45e64;
                    var_ceffcb0d6eeac4e6 = impact.var_ceffcb0d6eeac4e6;
                    var_33b583adc48ec7c0 = 0;
                    var_d8cfab43566be48c = vectornormalize(self.origin - impact.origin);
                }
                continue;
            }
        }
        dist = distance(impact.origin, self.origin);
        magnitude = dist / impact.var_cedcbd0d6ec45e64;
        magnitude = 1 - min(0.99, magnitude);
        scalar = magnitude * 1.2;
        if (index == 0) {
            var_32cb65c645a87807 = dist;
            var_cedcbd0d6ec45e64 = impact.var_cedcbd0d6ec45e64;
            var_ceffcb0d6eeac4e6 = impact.var_ceffcb0d6eeac4e6;
            var_33b583adc48ec7c0 = scalar;
        }
        var_2dacc85d72ec17c1[var_2dacc85d72ec17c1.size] = [impact.origin, scalar];
        var_d8cfab43566be48c += vectornormalize(self.origin - impact.origin) * scalar;
        var_ce6dd2dd691a73b3++;
    }
    if (var_2dacc85d72ec17c1.size == 0) {
        return undefined;
    }
    dir = vectornormalize(var_d8cfab43566be48c);
    data = spawnstruct();
    angles = vectortoangles(dir);
    data.var_58486720d3770552 = (0, angles[1], 0);
    data.flatdir = anglestoforward(data.var_58486720d3770552);
    data.dist = var_32cb65c645a87807;
    data.var_cedcbd0d6ec45e64 = var_cedcbd0d6ec45e64;
    data.var_ceffcb0d6eeac4e6 = var_ceffcb0d6eeac4e6;
    data.var_33b583adc48ec7c0 = var_33b583adc48ec7c0;
    data.origin = function_1735935b2e0468e(var_2dacc85d72ec17c1);
    level.reactdata = data;
    level.var_4e54744114646611 = gettime();
    return data;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3ee1
// Size: 0x87
function private function_1735935b2e0468e(var_2dacc85d72ec17c1) {
    var_6bfdb1a9e88afc12 = 0;
    var_83e83011d0854293 = (0, 0, 0);
    foreach (var_fdbab450a62c1248 in var_2dacc85d72ec17c1) {
        var_83e83011d0854293 += var_fdbab450a62c1248[0] * var_fdbab450a62c1248[1];
        var_6bfdb1a9e88afc12 += var_fdbab450a62c1248[1];
    }
    return var_83e83011d0854293 / var_6bfdb1a9e88afc12;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f71
// Size: 0x332
function private function_88194481ee0979fd(data) {
    if (self.team != "axis") {
        if (isdefined(self.var_5ccff9c1ae9cb737)) {
            thread function_f7f0674ea54e72d5(1);
        }
        return;
    }
    if (!isdefined(self.var_544e94c62ca8d735)) {
        self.var_544e94c62ca8d735 = 0;
    }
    if (gettime() < self.var_544e94c62ca8d735) {
        return;
    }
    if (!isdefined(level.var_37e0325de8c6b80b)) {
        level.var_37e0325de8c6b80b = getentarray("fleeing_ignore", "script_noteworthy");
    }
    foreach (volume in level.var_37e0325de8c6b80b) {
        if (self istouching(volume)) {
            return;
        }
    }
    if (istrue(self.var_7811134668469758)) {
        return;
    }
    self endon("death");
    if (!isdefined(self.var_d39adb66d4154683)) {
        function_3ddcab276130bdff();
    }
    self.var_544e94c62ca8d735 = gettime() + 200;
    if (isdefined(self.currentnode)) {
        if (!istrue(self.var_74de6ed414a0c996)) {
            self.var_71f409a8b7fb35af = self.currentnode;
            self.var_4eecd29cd51d4128 = self.goalradius;
        }
        self notify("stop_going_to_node");
    }
    if (data.dist < data.var_ceffcb0d6eeac4e6) {
        if (istrue(self.maystumble)) {
            self.stumbledelay = gettime() + randomint(1000);
            self.shouldstumble = 1;
        }
        var_17eadcd897988d4f = clamp(data.var_33b583adc48ec7c0, 0, 1);
        dist = 200 + data.var_ceffcb0d6eeac4e6 * var_17eadcd897988d4f;
        dist += randomint(300) * var_17eadcd897988d4f;
        pos = self.origin + data.flatdir * dist;
        /#
            if (getdvarint(@"hash_f2f36ad676e3835b")) {
                line(self.origin, pos, (1, 1, 0), 1, 1, 60);
            }
        #/
        navpos = getclosestpointonnavmesh(pos);
        self.goalradius = dist * 0.5;
        self setgoalpos(navpos);
    } else if (!istrue(self.var_d39adb66d4154683)) {
        self.goalradius = 300;
        self setgoalpos(self.origin);
    }
    self.var_d39adb66d4154683 = 1;
    waittillframeend();
    thread function_f7f0674ea54e72d5(0);
    guys = getaiarrayinradius(self.origin, 500, "axis");
    foreach (guy in guys) {
        if (istrue(guy.var_d39adb66d4154683)) {
            continue;
        }
        guy thread function_88194481ee0979fd(data);
    }
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x42ab
// Size: 0x2d
function private function_3ddcab276130bdff() {
    anim_stopanimscripted();
    if (scripts\engine\utility::issharedfuncdefined("aiReact", "combatHot")) {
        scripts\engine\utility::function_f3bb4f4911a1beb2("aiReact", "combatHot");
    }
}

/#

    // Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x42e0
    // Size: 0x6c
    function private function_d5129dab6d889852() {
        self endon("<dev string:xfe>");
        while (true) {
            if (isdefined(self.goalpos)) {
                line(self.origin, self.goalpos);
            } else if (isdefined(self.goalnode)) {
                line(self.origin, self.goalnode.origin);
            }
            waitframe();
        }
    }

#/

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4354
// Size: 0x212
function private function_f7f0674ea54e72d5(var_ea69e390541ce33e) {
    self endon("death");
    self notify("stop_flee_goalradius_thread");
    self endon("stop_flee_goalradius_thread");
    if (!isdefined(var_ea69e390541ce33e)) {
        var_ea69e390541ce33e = 0;
    }
    if (isdefined(self.var_71f409a8b7fb35af)) {
        if (isdefined(self.var_71f409a8b7fb35af.var_f5790d6cef4e9a20)) {
            if (isdefined(self.var_71f409a8b7fb35af.script_delay_min)) {
                var_98d9de4693801960 = randomfloatrange(self.var_71f409a8b7fb35af.script_delay_min, self.var_71f409a8b7fb35af.script_delay_max);
                var_98d9de4693801960 = max(0, (gettime() - var_98d9de4693801960) * 0.001);
                self.var_71f409a8b7fb35af.script_delay = var_98d9de4693801960;
                self.var_71f409a8b7fb35af.script_delay_min = undefined;
                self.var_71f409a8b7fb35af.script_delay_max = undefined;
            } else {
                self.var_71f409a8b7fb35af.script_delay = (gettime() - self.var_71f409a8b7fb35af.var_f5790d6cef4e9a20) * 0.001;
            }
        }
        if (!var_ea69e390541ce33e) {
            wait 2;
        }
        self notify("stop_going_to_node");
        self.goalradius = self.var_4eecd29cd51d4128;
        childthread scripts\sp\spawner::go_to_node(self.var_71f409a8b7fb35af);
        self.var_71f409a8b7fb35af = undefined;
        return;
    }
    if (isdefined(self.var_f3e7389b53b13f4d)) {
        if (!var_ea69e390541ce33e) {
            wait 2;
        }
        self setgoalnode(self.var_f3e7389b53b13f4d);
        return;
    }
    if (isdefined(self.var_5ccff9c1ae9cb737)) {
        self notify("stop_going_to_node");
        if (!var_ea69e390541ce33e) {
            wait 2;
        }
        childthread scripts\sp\spawner::go_to_node(self.var_5ccff9c1ae9cb737);
        return;
    }
    if (isdefined(self.var_500ae92ed478c56f)) {
        self notify("stop_going_to_node");
        if (var_ea69e390541ce33e) {
            wait 2;
        }
        childthread scripts\sp\spawner::go_to_node(self.var_500ae92ed478c56f);
        return;
    }
    while (self.goalradius < 1000) {
        wait 5;
        self.goalradius += 300;
    }
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x456e
// Size: 0xef
function function_56909bc02dcec30d(var_166045b0e3134cff) {
    self endon("death");
    if (!function_4a0ef315d57a9a2b()) {
        return;
    }
    data = function_fc6c0a1e72f571d3(var_166045b0e3134cff);
    if (!isdefined(data)) {
        return;
    }
    wait randomfloatrange(0, 0.2);
    dist = distance(data.origin, self.origin);
    if (dist > data.var_cedcbd0d6ec45e64) {
        time = math::lerp(0, 0.3, dist / data.var_ceffcb0d6eeac4e6 * 1.2);
        if (isdefined(time)) {
            wait time;
        }
    }
    if (!isdefined(data)) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x104>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return;
    }
    function_62595a7dcb6f8288(data);
    thread function_88194481ee0979fd(data);
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4665
// Size: 0xc5
function private function_4a0ef315d57a9a2b() {
    if (doinglongdeath() || self isinscriptedstate()) {
        return 0;
    }
    if (self islinked()) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x10c>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return 0;
    }
    if (!isdefined(self.var_a1ec8357cdd3b224)) {
        self.var_a1ec8357cdd3b224 = 0;
    }
    if (gettime() < self.var_a1ec8357cdd3b224) {
        /#
            if (function_9514792684c48831()) {
                print3d(self.origin, "<dev string:x115>", (1, 0, 0), 1, 1, 100);
            }
        #/
        return;
    }
    self.var_544e94c62ca8d735 = gettime() + 200;
    return 1;
}

// Namespace namespace_5bf3bd82da62657f / namespace_2d87f81135fa1a67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4733
// Size: 0x13
function function_9514792684c48831() {
    return getdvarint(@"hash_a9dc1d3a6b52a4e", 0) > 0;
}

