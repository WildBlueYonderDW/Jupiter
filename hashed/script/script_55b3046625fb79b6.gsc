#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using script_3433ee6b63c7e243;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using script_13d1c402f1421c35;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\common\debug.gsc;
#using scripts\anim\notetracks.gsc;
#using script_3aeb9f02de401a76;
#using scripts\asm\asm_sp.gsc;
#using scripts\aitypes\dismember.gsc;
#using scripts\engine\trace.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\sp\anim.gsc;
#using script_35de402efc5acfb3;
#using scripts\sp\pip_util.gsc;

#namespace namespace_67d243f3e2920da9;

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcda
// Size: 0x21
function registernotetracksifnot() {
    if (isdefined(anim.notetracks)) {
        return;
    }
    anim.notetracks = [];
    registernotetracks();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd03
// Size: 0x606
function registernotetracks() {
    level._defaultnotetrackhandler = &handlenotetrack;
    level.fnnotetrackprefixhandler = &notetrack_prefix_handler_sp;
    level.fnnotetrackmodeltranslate = &notetrack_model_translate;
    scripts\anim\notetracks::registernotetracks();
    anim.notetracks["fingers_out_start_left_hand"] = &notetrackfingerposeoffleft;
    anim.notetracks["fingers_out_start_right_hand"] = &notetrackfingerposeoffright;
    anim.notetracks["fingers_in_start_left_hand"] = &notetrackfingerposeonleft;
    anim.notetracks["fingers_in_start_right_hand"] = &notetrackfingerposeonright;
    anim.notetracks["anim_facial = idle"] = &notetrackfacialidle;
    anim.notetracks["anim_facial = run"] = &notetrackfacialrun;
    anim.notetracks["anim_facial = pain"] = &notetrackfacialpain;
    anim.notetracks["anim_facial = death"] = &notetrackfacialdeath;
    anim.notetracks["anim_facial = talk"] = &function_b07adb5f9d4bb4ee;
    anim.notetracks["anim_facial = talk_lg"] = &function_b090d15f9d63d223;
    anim.notetracks["anim_facial = talk_md"] = &function_b094c05f9d67a297;
    anim.notetracks["anim_facial = talk_sm"] = &function_b07adb5f9d4bb4ee;
    anim.notetracks["anim_facial = cheer"] = &notetrackfacialcheer;
    anim.notetracks["anim_facial = happy"] = &notetrackfacialhappy;
    anim.notetracks["anim_facial = angry"] = &notetrackfacialangry;
    anim.notetracks["anim_facial = scared"] = &notetrackfacialscared;
    anim.notetracks["anim_facial = gas_death"] = &notetrackfacialgasdeath;
    anim.notetracks["visor_raise"] = &notetrackvisorraise;
    anim.notetracks["visor_lower"] = &notetrackvisorlower;
    anim.notetracks["visor_lower_instant"] = &notetrackvisorlower_instant;
    anim.notetracks["visor_raise_instant"] = &notetrackvisorraise_instant;
    anim.notetracks["visor_lower_price_instant"] = &notetrackvisorpricelower_instant;
    anim.notetracks["visor_raise_price_instant"] = &notetrackvisorpriceraise_instant;
    anim.notetracks["visor_clearanim"] = &notetrackvisorraise_clear;
    anim.notetracks["bloodpool"] = &namespace_d7b8d979dba24484::play_blood_pool;
    anim.notetracks["mvmt_step_pre"] = &notetrackmovement;
    anim.notetracks["mvmt_step_post"] = &notetrackmovement;
    anim.notetracks["bodyfall_limb_small"] = &notetrackbodyfall;
    anim.notetracks["bodyfall_limb_large"] = &notetrackbodyfall;
    anim.notetracks["bodyfall_head"] = &notetrackbodyfall;
    anim.notetracks["bodyfall_torso"] = &notetrackbodyfall;
    anim.notetracks["footscrape"] = &notetrackfootscrape;
    anim.notetracks["land"] = &notetrackland;
    anim.notetracks["handstep_left"] = &notetrackhandstep;
    anim.notetracks["handstep_right"] = &notetrackhandstep;
    anim.notetracks["laser_on"] = &notetracklaser;
    anim.notetracks["laser_off"] = &notetracklaser;
    anim.notetracks["start_ragdoll"] = &notetrackstartragdoll;
    anim.notetracks["ragdollblendinit"] = &notetrackragdollblendinit;
    anim.notetracks["ragdollblendstart"] = &notetrackragdollblendstart;
    anim.notetracks["ragdollblendend"] = &notetrackragdollblendend;
    anim.notetracks["ragdollblendrootanim"] = &notetrackragdollblendrootanim;
    anim.notetracks["ragdollblendrootragdoll"] = &notetrackragdollblendrootragdoll;
    anim.notetracks["killai"] = &function_d935eab3adddb72e;
    anim.notetracks["drop clip"] = &notetrackdropclip;
    anim.notetracks["helmet_pop"] = &notetrackhelmetpop;
    anim.notetracks["gun drop"] = &notetrackgundrop;
    anim.notetracks["dropgun"] = &notetrackgundrop;
    anim.notetracks["gunhand = (gunhand)_left"] = &notetrackgunhand;
    anim.notetracks["anim_gunhand = left"] = &notetrackgunhand;
    anim.notetracks["gunhand = (gunhand)_right"] = &notetrackgunhand;
    anim.notetracks["anim_gunhand = right"] = &notetrackgunhand;
    anim.notetracks["anim_gunhand = none"] = &notetrackgunhand;
    anim.notetracks["anim_pose = \"stand\""] = &notetrackposestand;
    anim.notetracks["anim_pose = \"crouch\""] = &notetrackposecrouch;
    anim.notetracks["anim_pose = \"prone\""] = &notetrackposeprone;
    anim.notetracks["anim_pose = \"crawl\""] = &notetrackposecrawl;
    anim.notetracks["anim_pose = \"back\""] = &notetrackposeback;
    anim.notetracks["anim_gunhand = \"left\""] = &notetrackgunhand;
    anim.notetracks["anim_gunhand = \"right\""] = &notetrackgunhand;
    anim.notetracks["anim_gunhand = \"none\""] = &notetrackgunhand;
    anim.notetracks["anim_pose = stand"] = &notetrackposestand;
    anim.notetracks["anim_pose = crouch"] = &notetrackposecrouch;
    anim.notetracks["anim_pose = prone"] = &notetrackposeprone;
    anim.notetracks["anim_pose = crawl"] = &notetrackposecrawl;
    anim.notetracks["anim_pose = back"] = &notetrackposeback;
    anim.notetracks["eyes_on"] = &eyeonnotehandler;
    anim.notetracks["eyes_off"] = &eyeoffnotehandler;
    anim.notetracks["enable_weapons"] = &function_78d07eae81b909a4;
    anim.notetracks["disable_weapons"] = &function_f60a480f6d11b189;
    anim.notetracks["viewlinkmodel"] = &function_127bf3d03ce7da3a;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1311
// Size: 0x14b
function handlenotetrack(note, flagname, customfunction, customparams) {
    if (scripts\anim\notetracks::hascustomnotetrackhandler(note)) {
        return scripts\anim\notetracks::handlecustomnotetrackhandler(note, flagname, customfunction, customparams);
    }
    retval = scripts\anim\notetracks::handlecommonnotetrack(note, flagname, customfunction, customparams);
    if (isdefined(retval) && retval == "__unhandled") {
        retval = undefined;
        switch (note) {
        case #"hash_96500ba43eb6e086": 
            anim_stopanimscripted();
            return note;
        case #"hash_d9f86e4c127286b2": 
            if (weapon_pump_action_shotgun()) {
                self playsound("weap_reload_shotgun_pump_npc");
            }
            break;
        case #"hash_88cce8d6571fe7e1": 
            if (usingrocketlauncher()) {
                notetrackrocketlauncherammoattach();
            }
            break;
        default: 
            if (isdefined(customfunction)) {
                if (isdefined(customparams)) {
                    return [[ customfunction ]](note, customparams);
                } else {
                    return [[ customfunction ]](note);
                }
            }
            break;
        }
        if (string_starts_with(note, "pla_")) {
            if (!isai(self)) {
                assertmsg("'" + note + "' must be called on an AI.");
                return 1;
            }
            data = strtok(tolower(note), ",");
            data[0] = getsubstr(data[0], 4);
            function_4c5f855c0e23d2ec(data);
        }
    }
    return retval;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1465
// Size: 0x2e
function notetrackvisorraise(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 0;
    scripts\asm\asm_sp::asm_playvisorraise();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x149b
// Size: 0x2f
function notetrackvisorlower(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 1;
    scripts\asm\asm_sp::asm_playvisorraise();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14d2
// Size: 0x34
function notetrackvisorlower_instant(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 1;
    scripts\asm\asm_sp::asm_playvisorraise("_instant");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x150e
// Size: 0x33
function notetrackvisorraise_instant(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 0;
    scripts\asm\asm_sp::asm_playvisorraise("_instant");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1549
// Size: 0x34
function notetrackvisorpricelower_instant(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 1;
    scripts\asm\asm_sp::asm_playvisorraise("_price_instant");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1585
// Size: 0x33
function notetrackvisorpriceraise_instant(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 0;
    scripts\asm\asm_sp::asm_playvisorraise("_price_instant");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15c0
// Size: 0x2e
function notetrackvisorraise_clear(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self.visor_down = 0;
    scripts\asm\asm_sp::asm_clearvisoranim();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15f6
// Size: 0x1f
function notetrackfingerposeoffleft(note, flagname) {
    scripts\asm\asm_sp::asm_clearikfingeranim("left");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x161d
// Size: 0x1f
function notetrackfingerposeonleft(note, flagname) {
    scripts\asm\asm_sp::asm_ikfingeranim("left");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1644
// Size: 0x1f
function notetrackfingerposeoffright(note, flagname) {
    scripts\asm\asm_sp::asm_clearikfingeranim("left");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x166b
// Size: 0x1f
function notetrackfingerposeonright(note, flagname) {
    scripts\asm\asm_sp::asm_ikfingeranim("right");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1692
// Size: 0x1f
function notetrackfacialidle(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("idle");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16b9
// Size: 0x1f
function notetrackfacialrun(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("run");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0x1f
function notetrackfacialpain(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("pain");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1707
// Size: 0x1f
function notetrackfacialdeath(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("death");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x172e
// Size: 0x1f
function function_b090d15f9d63d223(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("talk_lg");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1755
// Size: 0x1f
function function_b094c05f9d67a297(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("talk_md");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x177c
// Size: 0x1f
function function_b07adb5f9d4bb4ee(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("talk_sm");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17a3
// Size: 0x1f
function notetrackfacialcheer(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("cheer");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17ca
// Size: 0x1f
function notetrackfacialhappy(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("happy");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17f1
// Size: 0x1f
function notetrackfacialscared(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("scared");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1818
// Size: 0x1f
function notetrackfacialangry(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("angry");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x183f
// Size: 0x1f
function notetrackfacialgasdeath(note, flagname) {
    scripts\asm\asm_sp::asm_playfacialanimfromnotetrack("gas_death");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1866
// Size: 0x6c
function notetrackmovement(note, flagname) {
    if (isdefined(self.classname) && self.classname != "script_model") {
        var_6608ae999a05364c = 1;
        if (issubstr(note, "post")) {
            var_6608ae999a05364c = 2;
        }
        var_4a6afe0b63c4e16b = get_notetrack_movement();
        self playclothmovesound(var_4a6afe0b63c4e16b, var_6608ae999a05364c);
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18da
// Size: 0xc4
function notetrackbodyfall(note, flagname) {
    switch (note) {
    case #"hash_2ef23a13196222ab": 
        soundalias = "anim_bodyfall_head";
        break;
    case #"hash_2e9368be03b7a895": 
        soundalias = "anim_bodyfall_limb_large";
        break;
    case #"hash_53bc96d0ea50bbf9": 
        soundalias = "anim_bodyfall_limb_small";
        break;
    case #"hash_cabf23769ef0902c": 
        soundalias = "anim_bodyfall_torso";
        break;
    default: 
        soundalias = "anim_bodyfall_limb_large";
        break;
    }
    if (isdefined(self.groundtype)) {
        groundtype = self.groundtype;
    } else {
        groundtype = "concrete_dry";
    }
    self playsurfacesound(soundalias, groundtype);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19a6
// Size: 0x3e
function notetrackfootscrape(note, flagname) {
    if (isdefined(self.groundtype)) {
        groundtype = self.groundtype;
        return;
    }
    groundtype = "dirt";
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ec
// Size: 0x6e
function notetrackland(note, flagname) {
    if (isdefined(self.groundtype)) {
        groundtype = self.groundtype;
    } else {
        groundtype = "dirt";
    }
    self playsurfacesound("step_default_npc_land", groundtype);
    self playclothmovesound("land", 2);
    self playequipmovesound("land", self.weapon);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a62
// Size: 0x19d
function playfootstep(var_ae6db4ab3762ff57, is_large, var_df283c0f77bc4d5c) {
    if (!isai(self)) {
        if (isdefined(self.var_ba304776b29ba32d)) {
            [[ self.var_ba304776b29ba32d ]](var_ae6db4ab3762ff57, is_large, var_df283c0f77bc4d5c);
            return;
        }
        if (!var_df283c0f77bc4d5c) {
            function_4f6cdffaa41ad3d1("dirt", "step", "run");
        }
        return;
    }
    groundtype = undefined;
    actiontype = "step";
    stairsstate = self.stairsstate;
    if (stairsstate == "up") {
        actiontype = "stepstairup";
    } else if (stairsstate == "down") {
        actiontype = "stepstairdown";
    }
    if (!isdefined(self.groundtype)) {
        if (!isdefined(self.lastgroundtype)) {
            if (!var_df283c0f77bc4d5c) {
                function_4f6cdffaa41ad3d1("dirt", actiontype, "run");
            }
            return;
        }
        groundtype = self.lastgroundtype;
    } else {
        groundtype = self.groundtype;
        self.lastgroundtype = self.groundtype;
    }
    foot = "J_Ball_RI";
    if (var_ae6db4ab3762ff57) {
        foot = "J_Ball_LE";
    }
    var_4a6afe0b63c4e16b = get_notetrack_movement();
    if (!var_df283c0f77bc4d5c) {
        function_4f6cdffaa41ad3d1(groundtype, actiontype, var_4a6afe0b63c4e16b);
    }
    if (is_large) {
        if (![[ anim.fnfootstepeffect ]](foot, groundtype)) {
            playfootstepeffectsmall(foot, groundtype);
        }
    } else if (![[ anim.fnfootstepeffectsmall ]](foot, groundtype)) {
        playfootstepeffect(foot, groundtype);
    }
    if (![[ anim.fnfootprinteffect ]](foot, groundtype)) {
        playfootprinteffect(foot, groundtype);
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c07
// Size: 0xe9
function playhandstep(var_ae6db4ab3762ff57, is_large) {
    if (!isai(self)) {
        return;
    }
    if (var_ae6db4ab3762ff57) {
        tag = "J_MID_LE_1";
        if (scripts\aitypes\dismember::get_scriptablepartinfo("left_arm") == "dismember") {
            return;
        }
    } else {
        tag = "J_MID_RI_1";
        if (scripts\aitypes\dismember::get_scriptablepartinfo("right_arm") == "dismember") {
            return;
        }
    }
    groundtype = undefined;
    if (!isdefined(self.groundtype)) {
        if (!isdefined(self.lastgroundtype)) {
            return;
        }
        groundtype = self.lastgroundtype;
    } else {
        groundtype = self.groundtype;
        self.lastgroundtype = self.groundtype;
    }
    if (![[ anim.optionalstepeffectsmallfunction ]](tag, groundtype)) {
        playfootstepeffect(tag, groundtype);
    }
    if (![[ anim.optionalfootprinteffectfunction ]](tag, groundtype)) {
        playfootprinteffect(tag, groundtype);
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf8
// Size: 0xae
function notetrackhandstep(note, flagname) {
    var_ae6db4ab3762ff57 = issubstr(note, "left");
    is_large = issubstr(note, "large");
    foot = "right";
    if (var_ae6db4ab3762ff57) {
        foot = "left";
    }
    if (isai(self)) {
        self.asm.footsteps.foot = foot;
        self.asm.footsteps.time = gettime();
    }
    playhandstep(var_ae6db4ab3762ff57, is_large);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dae
// Size: 0x1ae
function playfootprinteffect(foot, groundtype) {
    if (!isdefined(anim.optionalfootprinteffects[groundtype])) {
        return false;
    }
    var_d2328567c0454599 = self gettagorigin(foot);
    var_23801afaa7abe9b1 = self gettagangles(foot);
    var_97d840437b3ae840 = anglestoright(var_23801afaa7abe9b1) * -1;
    var_4be68345cf3cb03a = anglestoforward(var_23801afaa7abe9b1);
    tracestart = var_d2328567c0454599 + var_97d840437b3ae840 * -5;
    traceend = var_d2328567c0454599 + var_97d840437b3ae840 * 20;
    trace = scripts\engine\trace::_bullet_trace(tracestart, traceend, 0, self, 0, 0, 0, 0);
    if (trace["fraction"] == 1) {
        return true;
    }
    if (!isdefined(level._effect["footprint_" + groundtype][self.unittype])) {
        println("<dev string:x1c>" + self.unittype + "<dev string:x2f>" + "<dev string:x4a>" + groundtype);
        level._effect["footprint_" + groundtype][self.unittype] = level._effect["footprint_" + groundtype]["soldier"];
    }
    if (!anim.flirfootprinteffects) {
        playfx(level._effect["footprint_" + groundtype][self.unittype], trace["position"], trace["normal"], var_4be68345cf3cb03a);
    } else {
        thread track_flir_footstep(level._effect["footprint_" + groundtype][self.unittype], trace["position"], trace["normal"], var_4be68345cf3cb03a);
    }
    return true;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f65
// Size: 0xe7
function track_flir_footstep(effectid, org, forwardv, upv) {
    footstep = spawnstruct();
    footstep.effectid = effectid;
    footstep.org = org;
    footstep.forwardv = forwardv;
    footstep.upv = upv;
    footstep.spawntime = gettime();
    footstep.active = 0;
    anim.flirfootprints = array_add(anim.flirfootprints, footstep);
    if (level.player isnightvisionon() && level.player is_flir_vision_on()) {
        footstep thread play_flir_footstep_fx();
    }
    wait 10;
    anim.flirfootprints = array_remove(anim.flirfootprints, footstep);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2054
// Size: 0x68
function play_flir_footstep_fx() {
    if (self.active) {
        return;
    }
    self.active = 1;
    self.fx = spawnfx(self.effectid, self.org, self.forwardv, self.upv);
    triggerfx(self.fx, self.spawntime / 1000);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c4
// Size: 0x28
function kill_flir_footstep_fx() {
    if (!self.active) {
        return;
    }
    self.active = 0;
    self.fx delete();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20f4
// Size: 0x10a
function playfootstepeffect(foot, groundtype) {
    if (!isdefined(anim.optionalstepeffects[groundtype])) {
        return false;
    }
    org = self gettagorigin(foot);
    angles = self.angles;
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    if (!isdefined(level._effect["step_" + groundtype][self.unittype])) {
        println("<dev string:x55>" + self.unittype + "<dev string:x66>" + "<dev string:x85>" + groundtype);
        level._effect["step_" + groundtype][self.unittype] = level._effect["step_" + groundtype]["soldier"];
    }
    playfx(level._effect["step_" + groundtype][self.unittype], org, forward, up);
    return true;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2207
// Size: 0x10a
function playfootstepeffectsmall(foot, groundtype) {
    if (!isdefined(anim.optionalstepeffectssmall[groundtype])) {
        return false;
    }
    org = self gettagorigin(foot);
    angles = self.angles;
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    if (!isdefined(level._effect["step_small_" + groundtype][self.unittype])) {
        println("<dev string:x8b>" + self.unittype + "<dev string:x2f>" + "<dev string:xa2>" + groundtype);
        level._effect["step_small_" + groundtype][self.unittype] = level._effect["step_small_" + groundtype]["soldier"];
    }
    playfx(level._effect["step_small_" + groundtype][self.unittype], org, forward, up);
    return true;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231a
// Size: 0x1c1
function get_notetrack_movement() {
    if (isai(self) && !isbot(self)) {
        return self function_cbe5ad2464f5abe();
    }
    var_4a6afe0b63c4e16b = "run";
    animsetname = undefined;
    if (isdefined(self.asm)) {
        animsetname = self getbasearchetype();
    }
    if (isdefined(animsetname) && animspeedthresholdsexist(animsetname) && hasanimspeedthresholdstring(animsetname, "sprint") && isdefined(self.velocity)) {
        var_68a306f6cb2dda9c = getanimspeedbetweenthresholds(animsetname, "run", "sprint", 0.8);
        if (length2d(self.velocity) > var_68a306f6cb2dda9c) {
            var_4a6afe0b63c4e16b = "sprint";
        }
    }
    if (isdefined(self._blackboard)) {
        if (self._blackboard.movetype == "walk" || self._blackboard.movetype == "casual_gun" || self._blackboard.movetype == "patrol" || self._blackboard.movetype == "casual") {
            var_4a6afe0b63c4e16b = "walk";
        }
        if (scripts\asm\asm_bb::bb_getrequestedstance() == "prone") {
            var_4a6afe0b63c4e16b = "prone";
        }
    } else if (isdefined(self.a)) {
        if (isdefined(self.a.movement)) {
            if (self.a.movement == "walk") {
                var_4a6afe0b63c4e16b = "walk";
            }
        }
        if (isdefined(self.currentpose)) {
            if (self.currentpose == "prone") {
                var_4a6afe0b63c4e16b = "prone";
            }
        }
    }
    return var_4a6afe0b63c4e16b;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24e4
// Size: 0x3c
function notetracklaser(note, flagname) {
    if (note == "laser_on") {
        self.laserenabled = 1;
    } else {
        self.laserenabled = 0;
    }
    self updatelaserstatus();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2528
// Size: 0x92
function notetrackgunhand(note, flagname) {
    if (issubstr(note, "left")) {
        namespace_223959d3e5206cfb::placeweaponon(self.weapon, "left");
        self notify("weapon_switch_done");
        return;
    }
    if (issubstr(note, "right")) {
        namespace_223959d3e5206cfb::placeweaponon(self.weapon, "right");
        self notify("weapon_switch_done");
        return;
    }
    if (issubstr(note, "none")) {
        namespace_223959d3e5206cfb::placeweaponon(self.weapon, "none");
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25c2
// Size: 0x47
function notetrackposestand(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (self.currentpose == "prone") {
        exitpronewrapper(1);
    }
    setpose("stand");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2611
// Size: 0x47
function notetrackposecrouch(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (self.currentpose == "prone") {
        exitpronewrapper(1);
    }
    setpose("crouch");
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2660
// Size: 0x9e
function notetrackposeprone(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self setproneanimnodes(-45, 45, generic_human%prone_legs_down, generic_human%prone_dummy, generic_human%prone_legs_up);
    enterpronewrapper(0.5);
    setpose("prone");
    if (isdefined(self.a.goingtoproneaim)) {
        self.a.proneaiming = 1;
        return;
    }
    self.a.proneaiming = undefined;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2706
// Size: 0x6e
function notetrackposecrawl(note, flagname) {
    if (!isai(self)) {
        return;
    }
    self setproneanimnodes(-45, 45, generic_human%prone_legs_down, generic_human%prone_dummy, generic_human%prone_legs_up);
    enterpronewrapper(1);
    setpose("prone");
    self.a.proneaiming = undefined;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x277c
// Size: 0x94
function notetrackposeback(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (!issentient(self)) {
        return;
    }
    setpose("crouch");
    self.a.onback = 1;
    self.a.movement = "stop";
    self setproneanimnodes(-90, 90, generic_human%prone_legs_down, generic_human%prone_dummy, generic_human%prone_legs_up);
    enterpronewrapper(1);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2818
// Size: 0x4a
function notetrackrocketlauncherammoattach() {
    assert(isdefined(self));
    if (!isalive(self)) {
        return;
    }
    if (!usingrocketlauncher()) {
        return;
    }
    if (self tagexists("tag_accessory_left") && self tagexists("tag_rocket")) {
        self showpart("tag_rocket");
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x286a
// Size: 0x1c
function notetrackdropclip(note, flagname) {
    thread handledropclip(flagname);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x288e
// Size: 0x38
function notetrackhelmetpop(note, flagname) {
    if (isdefined(self.fnhelmetpop)) {
        self [[ self.fnhelmetpop ]]();
        self.dontbreakhelmet = 1;
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28ce
// Size: 0xd8
function notetrackstartragdoll(note, flagname) {
    if (isdefined(self.noragdoll)) {
        return;
    }
    if (isdefined(self.ragdolltime)) {
        return;
    }
    if (!isdefined(self.dont_unlink_ragdoll)) {
        thread unlinknextframe();
    }
    if (isdefined(self._blackboard)) {
        if (isdefined(self._blackboard.awaitingdropgunnotetrack) && self._blackboard.awaitingdropgunnotetrack == 1) {
            dropaiweapon();
            self.lastweapon = self.weapon;
        }
    }
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (isdefined(self)) {
        self startragdoll();
    }
    /#
        if (isalive(self)) {
            println("<dev string:xae>");
        }
    #/
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29ae
// Size: 0xbc
function notetrackragdollblendinit(note, flagname) {
    if (isdefined(self.noragdoll)) {
        return;
    }
    if (isdefined(self.ragdolltime)) {
        return;
    }
    if (!isdefined(self.dont_unlink_ragdoll)) {
        thread unlinknextframe();
    }
    if (isdefined(self._blackboard)) {
        if (isdefined(self._blackboard.awaitingdropgunnotetrack) && self._blackboard.awaitingdropgunnotetrack == 1) {
            dropaiweapon();
            self.lastweapon = self.weapon;
        }
    }
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    self ragdollblendinit();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a72
// Size: 0x13
function notetrackragdollblendstart(note, flagname) {
    
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8d
// Size: 0x13
function notetrackragdollblendend(note, flagname) {
    
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa8
// Size: 0x13
function notetrackragdollblendrootanim(note, flagname) {
    
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac3
// Size: 0x13
function notetrackragdollblendrootragdoll(note, flagname) {
    
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ade
// Size: 0x37
function function_d935eab3adddb72e(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (isalive(self)) {
        self startragdoll();
        wait 1;
        self kill();
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1d
// Size: 0x7c
function notetrackgundrop(note, flagname) {
    if (!isai(self)) {
        println("<dev string:xd2>" + function_a2eaafb222316a2(self) + "<dev string:xe4>" + note + "<dev string:xf7>");
        return;
    }
    dropaiweapon();
    if (isdefined(self._blackboard)) {
        self._blackboard.awaitingdropgunnotetrack = 0;
    }
    self.lastweapon = self.weapon;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba1
// Size: 0x45
function setpose(pose) {
    self.currentpose = pose;
    if (isdefined(self.a.onback)) {
        stoponback();
    }
    scripts\asm\asm_bb::bb_requeststance(pose);
    self notify("entered_pose" + pose);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bee
// Size: 0x14
function unlinknextframe() {
    wait 0.1;
    if (isdefined(self)) {
        self unlink();
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c0a
// Size: 0x152
function notetrack_model_translate(model) {
    result = model;
    switch (model) {
    case #"hash_325cb2e66f67d5b9":
    case #"hash_719417cb1de832b6":
    case #"hash_f731f17ca0fe624f": 
        if (isdefined(self.weaponinfo)) {
            foreach (info in self.weaponinfo) {
                weaponname = strtok(key, "+")[0];
                weap = nullweapon();
                if (isdefined(weaponname) && weaponname != "none" && weaponname != "") {
                    weap = make_weapon(weaponname);
                }
                if (model == "pistol" && weap.classname == "pistol") {
                    result = getweaponmodel(weap);
                    continue;
                }
                if (model != "pistol" && weap.inventorytype == model && result == model) {
                    result = getweaponmodel(weap);
                }
            }
        }
        if (result == model) {
            result = "none";
        }
        break;
    }
    return result;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d65
// Size: 0x83
function notetrack_vo(alias) {
    if (isdefined(self.anim_playsound_func)) {
        self thread [[ self.anim_playsound_func ]](alias, "j_head", 1);
        return;
    }
    if (isdefined(self.anim_playvo_func)) {
        self thread [[ self.anim_playvo_func ]](alias, "j_head", 1);
        return;
    }
    if (!issentient(self)) {
        thread playsoundontag(alias, "j_head", 1, alias);
        return;
    }
    scripts\sp\anim::play_sound_at_viewheight(alias, "sounddone", 1);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2df0
// Size: 0xdcf
function notetrack_prefix_handler_sp(notetrack) {
    prefix3 = getsubstr(notetrack, 0, 3);
    switch (prefix3) {
    case #"hash_8966586c51e34031": 
        alias = getsubstr(notetrack, 3);
        if (isdefined(self.anim_playsound_func)) {
            self thread [[ self.anim_playsound_func ]](alias, "j_head", 1);
        } else {
            params = strtok(alias, ",");
            if (params.size < 2) {
                thread playsoundontag(alias, undefined, 1);
            } else {
                thread playsoundontag(params[0], params[1], 1);
            }
        }
        return 1;
    case #"hash_7b1f866c4a8d9d17": 
        if (canplaynotetrackvo()) {
            alias = getsubstr(notetrack, 3);
            notetrack_vo(alias);
            return 1;
        }
        break;
    case #"hash_212b5a6c1b27bb77": 
        if (canplaynotetrackvo()) {
            var_dfd66055ff978a3c = getsubstr(notetrack, 3);
            prefix = namespace_378f8281e2d12ced::executeevent(var_dfd66055ff978a3c);
            return 1;
        }
        break;
    case #"hash_8fefc16c551511d7": 
        if (canplaynotetrackvo()) {
            alias = getsubstr(notetrack, 3);
            if (isdefined(self.anim_smartdialog_func)) {
                self thread [[ self.anim_smartdialog_func ]](alias);
            } else {
                thread smart_dialogue(alias);
            }
            return 1;
        }
        break;
    case #"hash_900fc16c552ea9bd": 
        if (canplaynotetrackvo()) {
            alias = getsubstr(notetrack, 3);
            level thread smart_radio_dialogue(alias);
            return 1;
        }
        break;
    case #"hash_256b66c0ab12624": 
        var_f058cbbc0c35931a = strtok(tolower(notetrack), "[]");
        str = strtok(getsubstr(var_f058cbbc0c35931a[0], 3), ",() ");
        vectors = [];
        if (var_f058cbbc0c35931a.size > 1) {
            for (i = 1; i < var_f058cbbc0c35931a.size; i++) {
                vector = strtok(var_f058cbbc0c35931a[i], ",");
                if (vector.size > 1) {
                    assertex(vector.size == 3, "anim.gsc: vector size not equal to 3 (" + vector.size);
                    str = array_add(str, (float(vector[0]), float(vector[1]), float(vector[2])));
                    continue;
                }
                str = array_add(str, vector[0]);
            }
        }
        if (str.size == 2) {
            if (str[0] == "exploder") {
                exploder(str[1]);
                return 1;
            } else if (str[0] == "stop_exploder") {
                stop_exploder(str[1]);
                return 1;
            } else {
                playfxontag(level._effect[str[0]], self, str[1]);
                return 1;
            }
        } else if (str.size == 3) {
            if (str[0] == "playfxontag") {
                playfxontag(level._effect[str[1]], self, str[2]);
                return 1;
            } else if (str[0] == "stopfxontag") {
                stopfxontag(level._effect[str[1]], self, str[2]);
                return 1;
            } else if (str[0] == "killfxontag") {
                killfxontag(level._effect[str[1]], self, str[2]);
                return 1;
            }
        } else if (str.size == 6) {
            if (str[0] == "debris") {
                playfxontag(level._effect[str[1]], self, str[2]);
                self hidepart(str[2], str[3]);
                return 1;
            }
        } else if (str.size == 11) {
            p = (float(str[2]), float(str[3]), float(str[4]));
            f = (float(str[5]), float(str[6]), float(str[7]));
            u = (float(str[8]), float(str[9]), float(str[10]));
            playfx(level._effect[str[1]], p, f, u);
        }
        break;
    case #"hash_4e4e106c32fa68d2": 
        if (!isai(self)) {
            return 1;
        }
        suffix = getsubstr(notetrack, 3, notetrack.size);
        if (suffix == "on" || suffix == "on_0") {
            if (!isdefined(self.ht_on)) {
                self.ht_on = 1;
                self setuplookatfornotetrack();
            }
            utility::lookatentity(level.player, 0);
        } else if (suffix == "on_1") {
            if (!isdefined(self.ht_on)) {
                self.ht_on = 1;
                self setuplookatfornotetrack();
            }
            utility::lookatentity(level.player, 1);
        } else {
            cleanupanimscriptedheadlook();
        }
        return 1;
    case #"hash_286f036c1eec89aa": 
        var_5bf1e96d631b62fe = getsubstr(notetrack, 3, notetrack.size);
        archetype = self getbasearchetype();
        assert(isdefined(archetype));
        desiredspeed = getanimspeedthreshold(archetype, var_5bf1e96d631b62fe);
        self aisetdesiredspeed(desiredspeed);
        self aisettargetspeed(desiredspeed);
        return 1;
    case #"hash_4e5ad06c3304916e": 
        parms = getsubstr(notetrack, 3);
        switch (parms) {
        case #"hash_fa2ad6f6bd651030": 
            if (isai(self)) {
                self function_e55c33850a5d2fea("request");
                self function_5621e511b99964a7(level.player);
            }
            return 1;
        case #"hash_23a4247209319a1": 
            if (isai(self)) {
                self function_e55c33850a5d2fea("request");
                self function_504a5e2df31069a4();
            }
            return 1;
        case #"hash_3699ac6c262c25ea": 
            if (isai(self)) {
                self function_e55c33850a5d2fea("prohibit");
            }
            return 1;
        }
        break;
    case #"hash_901bbd6c55379dcd": 
        var_b4572c9b8b2e61bb = strtok(notetrack, "_, ");
        right = ter_op(isdefined(var_b4572c9b8b2e61bb[1]), float(var_b4572c9b8b2e61bb[1]), 0);
        left = ter_op(isdefined(var_b4572c9b8b2e61bb[2]), float(var_b4572c9b8b2e61bb[2]), 0);
        top = ter_op(isdefined(var_b4572c9b8b2e61bb[3]), float(var_b4572c9b8b2e61bb[3]), 0);
        bottom = ter_op(isdefined(var_b4572c9b8b2e61bb[4]), float(var_b4572c9b8b2e61bb[4]), 0);
        blend = ter_op(isdefined(var_b4572c9b8b2e61bb[5]), float(var_b4572c9b8b2e61bb[5]), 0);
        level.player lerpviewangleclamp(blend, blend * 0.5, blend * 0.5, right, left, top, bottom, 1);
        return 1;
    case #"hash_7b3b466c4aa2fea6": 
        if (level.player islinked()) {
            viewfraction = getsubstr(notetrack, 3, notetrack.size);
            viewfraction = float(viewfraction);
            if (isdefined(level.player getlinkedparent())) {
                level.player function_6b8a3855966e9ada(viewfraction);
            }
        }
        return 1;
    case #"hash_8927586c51b1a365": 
        gesture = getsubstr(notetrack, 3, notetrack.size);
        level.player forceplaygestureviewmodel(gesture);
        return 1;
    case #"hash_ed53bb6c000173b4": 
        var_b4572c9b8b2e61bb = strtok(notetrack, "_, ");
        scale = ter_op(isdefined(var_b4572c9b8b2e61bb[1]), float(var_b4572c9b8b2e61bb[1]), 1);
        duration = ter_op(isdefined(var_b4572c9b8b2e61bb[2]), float(var_b4572c9b8b2e61bb[2]), 1);
        level.player earthquakeforplayer(scale, duration, level.player.origin, 1000);
        return 1;
    case #"hash_f493246c03c20b90": 
        if (isdefined(level.dyndof)) {
            utility::function_2af2e0ede2893721();
        }
        fstop = undefined;
        focusspeed = undefined;
        aperturespeed = undefined;
        angles = undefined;
        var_9ac1d65434108dcc = undefined;
        ignoreplayer = undefined;
        ignorecollision = undefined;
        parms = getsubstr(notetrack, 3, notetrack.size);
        var_b4572c9b8b2e61bb = strtok(parms, ", ");
        switch (var_b4572c9b8b2e61bb.size) {
        case 8: 
            ignorecollision = function_66eb0c2166aeef3d(var_b4572c9b8b2e61bb[7]);
        case 7: 
            ignoreplayer = function_66eb0c2166aeef3d(var_b4572c9b8b2e61bb[6]);
        case 6: 
            var_9ac1d65434108dcc = var_b4572c9b8b2e61bb[5];
            if (var_9ac1d65434108dcc == "-1") {
                var_9ac1d65434108dcc = undefined;
            }
        case 5: 
            angles = float(var_b4572c9b8b2e61bb[4]);
            if (angles < 0) {
                angles = undefined;
            }
        case 4: 
            aperturespeed = float(var_b4572c9b8b2e61bb[3]);
            if (aperturespeed < 0) {
                aperturespeed = undefined;
            }
        case 3: 
            focusspeed = float(var_b4572c9b8b2e61bb[2]);
            if (focusspeed < 0) {
                focusspeed = undefined;
            }
        case 2: 
            fstop = float(var_b4572c9b8b2e61bb[1]);
            if (fstop < 0) {
                fstop = undefined;
            }
        case 1: 
            break;
        }
        ignorelist = [];
        if (istrue(ignoreplayer)) {
            ignorelist = [level.player];
            if (isdefined(level.player_rig)) {
                ignorelist[ignorelist.size] = level.player_rig;
            }
        }
        level.player thread utility::dof_enable_autofocus(fstop, self, focusspeed, aperturespeed, angles, var_9ac1d65434108dcc, ignorelist, ignorecollision);
        return 1;
    case #"hash_8937186c51be0a98": 
        var_b4572c9b8b2e61bb = strtok(notetrack, "_, ");
        enabled = ter_op(isdefined(var_b4572c9b8b2e61bb[1]), int(var_b4572c9b8b2e61bb[1]), 1);
        if (enabled) {
            enable_procedural_bones();
        } else {
            disable_procedural_bones();
        }
        return 1;
    case #"hash_6d3c746c4385b41d": 
        var_b4572c9b8b2e61bb = strtok(notetrack, "_, ");
        from = ter_op(isdefined(var_b4572c9b8b2e61bb[1]), float(var_b4572c9b8b2e61bb[1]), 1);
        to = ter_op(isdefined(var_b4572c9b8b2e61bb[2]), float(var_b4572c9b8b2e61bb[2]), 1);
        duration = ter_op(isdefined(var_b4572c9b8b2e61bb[3]), float(var_b4572c9b8b2e61bb[3]), 1);
        setslowmotion(from, to, duration);
        return 1;
    }
    prefix4 = getsubstr(notetrack, 0, 4);
    switch (prefix4) {
    case #"hash_2ee8a084e861ef57": 
        if (canplaynotetrackvo()) {
            alias = getsubstr(notetrack, 4);
            radio_dialogue(alias);
            return 1;
        }
        break;
    case #"hash_8c1d5a8493291b9b": 
        if (canplaynotetrackvo()) {
            alias = getsubstr(notetrack, 4);
            if (isdefined(self.anim_playsound_func)) {
                self thread [[ self.anim_playsound_func ]](alias, "j_head", 1);
            } else {
                thread scripts\sp\pip_util::pip_dialogue(alias);
            }
            return 1;
        }
        break;
    case #"hash_1a446584ddfd0cd9": 
        if (canplaynotetrackvo()) {
            alias = getsubstr(notetrack, 4);
            if (isdefined(level.var_bb89bf6ff5d2b0e6)) {
                self thread [[ level.var_bb89bf6ff5d2b0e6 ]](alias);
            } else {
                thread smart_player_dialogue(alias);
            }
            return 1;
        }
        break;
    case #"hash_3ef4a7543fedd633": 
        state = getsubstr(notetrack, 4);
        if (state == "off") {
            utility::lookatstateoverride();
        } else {
            utility::lookatstateoverride(state);
        }
        return 1;
    case #"hash_77915f8488d69295": 
        if (!isai(self)) {
            assertmsg("'" + notetrack + "' must be called on an AI.");
            return 1;
        }
        data = strtok(tolower(notetrack), ",");
        data[0] = getsubstr(data[0], 4);
        function_4c5f855c0e23d2ec(data);
        return 1;
    case #"hash_a22f1814f7af01f5": 
        var_985c64fc7f3f4b6 = strtok(notetrack, "_");
        var_80698c7167df0cb7 = float(var_985c64fc7f3f4b6[1]);
        var_19fd165b9d684b3d = float(var_985c64fc7f3f4b6[2]);
        level.player lerpfovscalefactor(var_80698c7167df0cb7, var_19fd165b9d684b3d);
        return 1;
    case #"hash_f94a040a056fe52b": 
        var_5a7203790a8ccead = strtok(notetrack, "_");
        var_db689c59f0f9b985 = var_5a7203790a8ccead.size;
        var_71dfe6fb4627ff8b = float(var_5a7203790a8ccead[1]);
        var_2a0df86e83a41bb6 = float(var_5a7203790a8ccead[2]);
        var_8592a3d4811dc109 = undefined;
        var_88e40ad662b298be = undefined;
        if (var_db689c59f0f9b985 > 3) {
            var_8592a3d4811dc109 = float(var_5a7203790a8ccead[3]);
        }
        if (var_db689c59f0f9b985 > 4) {
            var_88e40ad662b298be = float(var_5a7203790a8ccead[4]);
        }
        level.player thread utility::dof_enable(var_71dfe6fb4627ff8b, var_2a0df86e83a41bb6, undefined, var_8592a3d4811dc109, var_88e40ad662b298be);
        return 1;
    }
    return scripts\anim\notetracks::notetrack_prefix_handler_common(notetrack);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc8
// Size: 0x2d
function canplaynotetrackvo() {
    if (level.missionfailed && !level.notetrackmissionfailedvo) {
        return false;
    }
    if (!level.notetrackvo) {
        return false;
    }
    return true;
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bfe
// Size: 0x32
function eyeonnotehandler(note, flagname) {
    self setanim(generic_human%lookat_eye_node, 1, 0.2, 1);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c38
// Size: 0x28
function eyeoffnotehandler(note, flagname) {
    self clearanim(generic_human%lookat_eye_node, 0.2);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c68
// Size: 0x3b
function function_78d07eae81b909a4(note, flagname) {
    if (isai(self)) {
        return;
    }
    level.player enableoffhandweapons();
    level.player enableweapons();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3cab
// Size: 0x3b
function function_f60a480f6d11b189(note, flagname) {
    if (isai(self)) {
        return;
    }
    level.player disableoffhandweapons();
    level.player disableweapons();
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cee
// Size: 0x15a
function function_4c5f855c0e23d2ec(parameters) {
    mode = parameters[0];
    switch (mode) {
    case #"hash_628ffe6f4a417560": 
        function_22238dd24555b428(parameters);
        break;
    case #"hash_f6706428c38f0019": 
        function_3d33d0c14b96b661(parameters);
        break;
    case #"hash_94ad480ead264ed8": 
        function_d61145721b9f2990(parameters);
        break;
    case #"hash_87d1443ef2805760": 
        function_8d6dc47bf25b58(parameters);
        break;
    case #"hash_cdd656b8cc7b709c": 
        function_bf398d3bbc1f1d84(parameters);
        break;
    case #"hash_148c417c2690352d": 
        function_fa7a1453b16a7545(parameters);
        break;
    case #"hash_6aeeafe63b5fd92f": 
        function_aeadf8545de91b27(parameters);
        break;
    case #"hash_fa2ad6f6bd651030": 
        self function_f51ff412609193b9(1, "anim");
        break;
    case #"hash_3699ac6c262c25ea": 
        self function_f51ff412609193b9(0, "anim");
        break;
    case #"hash_76d9f4ac5d921342": 
        self function_e99626add202fe1a(1, "anim");
        break;
    case #"hash_f54ad023c463669f": 
        self function_e99626add202fe1a(0, "anim");
        break;
    default: 
        assertmsg("Unknown procedural look-at notetrack 'pla_" + mode + "'");
        break;
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e50
// Size: 0x4a
function function_22238dd24555b428(parameters) {
    if (parameters.size != 2) {
        assertmsg("Notetrack pla_speed requires exactly 1 parameter - speed [0-4].");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    speed = int(parameters[1]);
    self function_106bce0aeee91d2c(speed);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea2
// Size: 0x74
function function_3d33d0c14b96b661(parameters) {
    if (parameters.size != 4) {
        assertmsg("Notetrack pla_bone_weights requires exactly 3 parameters - spine, neck, head.");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    var_e49dbba7580f19f8 = float(parameters[1]);
    neck = float(parameters[2]);
    head = float(parameters[3]);
    self function_1c46ba98e23c02c1(var_e49dbba7580f19f8, neck, head);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f1e
// Size: 0x6a
function function_d61145721b9f2990(parameters) {
    if (parameters.size != 4) {
        assertmsg("Notetrack pla_bone_speeds requires exactly 3 parameters - spine, neck, head.");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    var_e49dbba7580f19f8 = float(parameters[1]);
    neck = float(parameters[2]);
    head = float(parameters[3]);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f90
// Size: 0xb4
function function_8d6dc47bf25b58(parameters) {
    if (parameters.size != 2) {
        assertmsg("Notetrack pla_player requires exactly 1 parameter, on/off.");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    switch (tolower(parameters[1])) {
    case #"hash_31100fbc01bd387c":
    case #"hash_fa2ad6f6bd651030": 
        self function_5621e511b99964a7(level.player);
        break;
    case #"hash_311010bc01bd3a0f":
    case #"hash_3699ac6c262c25ea": 
        self function_504a5e2df31069a4();
        break;
    default: 
        assertmsg("Incorrect parameter for pla_player: '" + parameters[1] + "'. Should be on/off.");
        break;
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x404c
// Size: 0x5f
function function_bf398d3bbc1f1d84(parameters) {
    if (parameters.size != 3) {
        assertmsg("Notetrack pla_clamp requires exactly 2 parameters - horizontal, vertical.");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    horizontal = float(parameters[1]);
    vertical = float(parameters[2]);
    self function_5b21b24798da64b5(horizontal, vertical);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40b3
// Size: 0x7e
function function_fa7a1453b16a7545(parameters) {
    if (parameters.size != 5) {
        assertmsg("Notetrack pla_clamp_lopsided requires exactly 4 parameters - left, right, up, down.");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    left = float(parameters[1]);
    right = float(parameters[2]);
    up = float(parameters[3]);
    down = float(parameters[4]);
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4139
// Size: 0x3e
function function_aeadf8545de91b27(parameters) {
    if (parameters.size != 2) {
        assertmsg("Notetrack pla_head_offset requires exactly 1 parameter - amount.");
        return;
    }
    if (self function_e9e893b7f1032d7f() == 0) {
        return;
    }
    self function_81e6e6fa91aff70b(float(parameters[1]));
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x417f
// Size: 0x17d
function function_127bf3d03ce7da3a(note, flagname, customparams) {
    if (customparams.size == 3) {
        params = strtok(customparams[2], ",");
        if (params.size >= 3) {
            modelname = params[0];
            tagname = params[1];
            entitytargetname = params[2];
            positionoffset = [0, 0, 0];
            angleoffset = [0, 0, 0];
            var_65dbaba260bc5c52 = 3;
            var_ead6bb7b07e2fb30 = 6;
            for (paramindex = var_65dbaba260bc5c52; paramindex < params.size && paramindex < var_ead6bb7b07e2fb30; paramindex++) {
                positionoffset[paramindex - var_65dbaba260bc5c52] = float(params[paramindex]);
            }
            for (paramindex = var_ead6bb7b07e2fb30; paramindex < params.size; paramindex++) {
                angleoffset[paramindex - var_ead6bb7b07e2fb30] = float(params[paramindex]);
            }
            var_2638fb6f935ae522 = spawn("script_model", level.player.origin);
            var_2638fb6f935ae522 setmodel(modelname);
            var_2638fb6f935ae522 linktoplayerviewignoreparentrot(level.player, tagname, (positionoffset[0], positionoffset[1], positionoffset[2]), (angleoffset[0], angleoffset[1], angleoffset[2]), 0, 0, 0, 0);
            var_2638fb6f935ae522.targetname = entitytargetname;
        }
    }
}

// Namespace namespace_67d243f3e2920da9 / namespace_acef762f74130ac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4304
// Size: 0x29
function function_66eb0c2166aeef3d(str) {
    if (tolower(str) == "true") {
        return true;
    }
    return int(str) && true;
}

