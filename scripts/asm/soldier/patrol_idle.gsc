// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\soldier\patrol.gsc;
#using script_2ed63158b46a6d6f;
#using scripts\common\anim.gsc;
#using scripts\asm\soldier\death.gsc;

#namespace patrol_idle;

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c
// Size: 0x46
function patrol_idle_getcellphone() {
    modelname = "offhand_wm_smartphone_on";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_cellphone"])) {
        modelname = level.scr_model["idle_cellphone"];
    }
    return modelname;
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca
// Size: 0x2e
function patrol_idle_init(asmname, statename, params) {
    self.newenemyreactiondistsq = 0;
    thread patrol_prop_waitfordelete();
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff
// Size: 0x5f
function patrol_idle_cleanup(asmname, statename, params) {
    self.newenemyreactiondistsq = 262144;
    self function_f7cff9f6dafb297();
    if (isdefined(self.idle_prop)) {
        self.idle_prop delete();
        self.idle_prop = undefined;
    }
    self notify("patrol_idle_complete");
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x465
// Size: 0x7d
function patrol_idle_istype(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(self._blackboard.var_6ff150891bb0c47);
    #/
    /#
        assert(isdefined(self._blackboard.var_fe458d6a41146a8c));
    #/
    return self._blackboard.var_fe458d6a41146a8c == params;
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x40
function patrol_getcustomfunc(var_e25d1d189177a7c, funcname) {
    if (isdefined(level.idle_funcs) && isdefined(level.idle_funcs[var_e25d1d189177a7c])) {
        return level.idle_funcs[var_e25d1d189177a7c][funcname];
    }
    return undefined;
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532
// Size: 0x6d
function patrol_idle_getnotehandler(asmname, statename, params) {
    if (isdefined(self._blackboard.customidlenode)) {
        var_3931ff7e891d898f = patrol_getcustomfunc(self._blackboard.customidlenode, params + "_note");
        if (isdefined(var_3931ff7e891d898f)) {
            return var_3931ff7e891d898f;
        }
    }
    return asm_getnotehandler(asmname, statename);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a7
// Size: 0xd4
function patrol_playanim(asmname, statename, params, var_3931ff7e891d898f, animrate) {
    self endon(statename + "_finished");
    var_b3795e278e36ba46 = asm_getanim(asmname, statename);
    var_65f172f2b76bd30 = asm_getxanim(statename, var_b3795e278e36ba46);
    if (isnumber(var_b3795e278e36ba46)) {
        self aisetanim(statename, var_b3795e278e36ba46, animrate);
    } else {
        /#
            assertex(utility::issp(), "Only supporting custom patrol idles in SP.");
        #/
        var_c8aaf5bc74c22bb = asm_lookupanimfromalias(statename, "blank");
        self aisetanim(statename, var_c8aaf5bc74c22bb, animrate);
        self setflaggedanimrestart(statename, var_b3795e278e36ba46, 1, animrate);
    }
    asm_playfacialanim(asmname, statename, var_65f172f2b76bd30);
    asm_donotetracks(asmname, statename, var_3931ff7e891d898f, statename);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x682
// Size: 0xbd
function patrol_playidleintro(asmname, statename, params) {
    self animmode("zonly_physics", 0);
    desiredangle = self.angles[1];
    if (self._blackboard.var_6ff150891bb0c47) {
        if (isdefined(self._blackboard.var_227cc162483aa47)) {
            desiredangle = self._blackboard.var_227cc162483aa47[1];
        } else {
            desiredangle = 0;
        }
    }
    self orientmode("face angle", desiredangle);
    var_3931ff7e891d898f = patrol_idle_getnotehandler(asmname, statename, "intro");
    patrol_playanim(asmname, statename, params, var_3931ff7e891d898f, 1);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x746
// Size: 0x10a
function patrol_playidleloop(asmname, statename, params) {
    self endon(statename + "_finished");
    var_d5c987658103bffd = asm_getbodyknob();
    prevanim = var_d5c987658103bffd;
    var_3931ff7e891d898f = patrol_idle_getnotehandler(asmname, statename, "loop");
    while (1) {
        loopanim = asm_getanim(asmname, statename);
        if (isnumber(loopanim)) {
            self aisetanim(statename, loopanim);
        } else {
            /#
                assertex(utility::issp(), "Only supporting custom patrol loops in SP.");
            #/
            var_c8aaf5bc74c22bb = asm_lookupanimfromalias(statename, "blank");
            self aisetanim(statename, var_c8aaf5bc74c22bb);
            self setflaggedanimrestart(statename, loopanim, 1, 0.2, 1);
        }
        var_76c92379ed351610 = asm_getxanim(statename, loopanim);
        asm_playfacialanim(asmname, statename, var_76c92379ed351610);
        prevanim = loopanim;
        asm_donotetracks(asmname, statename, var_3931ff7e891d898f, statename);
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x857
// Size: 0x5f
function patrol_chooseidlereact(asmname, statename, params) {
    var_c5e576cf2978534b = 0;
    alias = namespace_58609e68adef6b3d::function_a23a26adcf97fdd0();
    if (isint(alias)) {
        alias = namespace_15bcbf57b169d5f3::function_8345560e22fe3b10(alias);
    }
    var_93a2c35bc9547955 = asm_lookupanimfromalias(statename, alias);
    return var_93a2c35bc9547955;
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be
// Size: 0x15e
function patrol_playidlereact(asmname, statename, params) {
    self endon(statename + "_finished");
    self function_f7cff9f6dafb297();
    var_b3795e278e36ba46 = asm_getanim(asmname, statename);
    var_3931ff7e891d898f = patrol_idle_getnotehandler(asmname, statename, "react");
    var_65f172f2b76bd30 = asm_getxanim(statename, var_b3795e278e36ba46);
    animrate = 1;
    if (isdefined(self.var_aebf462ec3f3362d)) {
        animlength = getanimlength(var_65f172f2b76bd30);
        var_e01c6c89a1eb3d21 = (self.var_aebf462ec3f3362d - gettime()) / 2000;
        if (var_e01c6c89a1eb3d21 < animlength) {
            if (var_e01c6c89a1eb3d21 < 0.3) {
                var_e01c6c89a1eb3d21 = 0.3;
            }
            animrate = animlength / var_e01c6c89a1eb3d21;
        }
    }
    if (isnumber(var_b3795e278e36ba46)) {
        self aisetanim(statename, var_b3795e278e36ba46, animrate);
    } else {
        /#
            assertex(utility::issp(), "Only supporting custom patrol reactions in SP.");
        #/
        var_c8aaf5bc74c22bb = asm_lookupanimfromalias(statename, "blank");
        self aisetanim(statename, var_c8aaf5bc74c22bb, animrate);
        self setflaggedanimrestart(statename, var_b3795e278e36ba46, 1, 0.2, animrate);
    }
    asm_playfacialanim(asmname, statename, var_65f172f2b76bd30);
    self function_df303d9c05757e6b(var_b3795e278e36ba46, statename);
    asm_donotetracks(asmname, statename, var_3931ff7e891d898f, statename);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa23
// Size: 0x49
function patrol_playidleend(asmname, statename, params) {
    var_3931ff7e891d898f = patrol_idle_getnotehandler(asmname, statename, "end");
    self notify("smoking_end");
    patrol_playanim(asmname, statename, params, var_3931ff7e891d898f, 1);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa73
// Size: 0x15c
function patrol_notehandler_smoking(note, statename) {
    note = getsubstr(note, 10);
    if (isstartstr(note, "attach")) {
        self.idle_fx = level.g_effect["cigarette_unlit"];
        playfxontag(self.idle_fx, self, "tag_accessory_right");
    } else if (isstartstr(note, "light")) {
        self.idle_fx = level.g_effect["cigarette_lit"];
        playfxontag(self.idle_fx, self, "tag_accessory_right");
        stopfxontag(level.g_effect["cigarette_unlit"], self, "tag_accessory_right");
        playfx(level.g_effect["lighter_glow"], self gettagorigin("tag_accessory_right"));
        thread patrol_smoking_blowsmoke(statename);
    } else if (isstartstr(note, "detach")) {
        stopfxontag(level.g_effect["cigarette_lit"], self, "tag_accessory_right");
        self.idle_fx = undefined;
        playfx(level.g_effect["cigarette_lit_toss"], self gettagorigin("tag_accessory_right"), anglestoforward(self gettagangles("tag_accessory_right")));
    } else if (isstartstr(note, "face_goal")) {
        namespace_58609e68adef6b3d::handlefacegoalnotetrack(statename, note, undefined);
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd6
// Size: 0x81
function patrol_smoking_blowsmoke(statename) {
    self endon("smoking_end");
    self endon("death");
    while (1) {
        self.smoke_fx_ent = playfxontag(level.g_effect["cigarette_smoke"], self, "tag_eye");
        waittime = randomintrange(5, 8);
        wait(waittime);
        if (isdefined(self.smoke_fx_ent)) {
            self.smoke_fx_ent delete();
            self.smoke_fx_ent = undefined;
        }
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc5e
// Size: 0x80
function patrol_smoking_cleanup(asmname, statename, params) {
    self notify("smoking_end");
    if (isdefined(self.idle_fx)) {
        stopfxontag(self.idle_fx, self, "tag_accessory_right");
        self.idle_fx = undefined;
    }
    if (isdefined(self.smoke_fx_ent)) {
        self.smoke_fx_ent delete();
        self.smoke_fx_ent = undefined;
    }
    patrol_idle_cleanup(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xce5
// Size: 0xd0
function patrol_notehandler_cellphone(note, statename) {
    self endon(statename + "_finished");
    switch (note) {
    case #"hash_2d1403e602f082a4":
        self.idle_prop = namespace_bc4a4b9456315863::anim_link_tag_model(patrol_idle_getcellphone(), "tag_accessory_right");
        wait(2);
        if (isdefined(self.idle_prop)) {
            playfxontag(level.g_effect["cellphone_glow"], self.idle_prop, "tag_origin");
        }
        break;
    case #"hash_682ec8b49fe7aa12":
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
        break;
    case #"hash_2c250facc201a952":
        namespace_58609e68adef6b3d::handlefacegoalnotetrack(statename, note, undefined);
        break;
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbc
// Size: 0x113
function patrol_prop_cleanup(asmname, statename, params) {
    if (isdefined(self.idle_prop)) {
        if (![[ self.fnisinstealthidle ]]() || !isalive(self)) {
            var_363cd698ce6c69c1 = anglestoforward(self.angles);
            var_363cd698ce6c69c1 = var_363cd698ce6c69c1 * randomfloatrange(30, 45);
            var_d43803be5b18ddd8 = var_363cd698ce6c69c1[0];
            var_d43804be5b18e00b = var_363cd698ce6c69c1[1];
            var_d43805be5b18e23e = randomfloatrange(80, 90);
            self.idle_prop unlink();
            self.idle_prop physicslaunchserver(self.idle_prop.origin, (var_d43803be5b18ddd8, var_d43804be5b18e00b, var_d43805be5b18e23e));
            self.idle_prop thread patrol_prop_delete();
            self.idle_prop = undefined;
        } else if ([[ self.fnstealthisidlecurious ]]()) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed6
// Size: 0x4f
function patrol_prop_delete() {
    wait(5);
    while (isalive(level.player) && distance2dsquared(level.player.origin, self.origin) < 160000) {
        wait(1);
    }
    self delete();
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf2c
// Size: 0x93
function patrol_notehandler_drinking(note, statename) {
    switch (note) {
    case #"hash_2d1403e602f082a4":
        self.idle_prop = namespace_bc4a4b9456315863::anim_link_tag_model("p7_bottle_plastic_16oz_water", "tag_accessory_right");
        break;
    case #"hash_682ec8b49fe7aa12":
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
        break;
    case #"hash_2c250facc201a952":
        namespace_58609e68adef6b3d::handlefacegoalnotetrack(statename, note, undefined);
        break;
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc6
// Size: 0x1c8
function patrol_playidlesittingloop(asmname, statename, params) {
    self endon(statename + "_finished");
    self animmode("noclip");
    groundpos = namespace_3c37cb17ade254d::drop_to_ground(self._blackboard.var_8fe741f6905abcb9, 8, -128);
    if (isdefined(params)) {
        /#
            assert(self._blackboard.var_6ff150891bb0c47);
        #/
        /#
            assert(isdefined(level.fnanimatedprop_setup));
        #/
        [[ level.fnanimatedprop_setup ]]("idle_chair", params, groundpos, self._blackboard.var_227cc162483aa47);
    }
    var_b95ecd0bf886bb98 = 1;
    var_d5c987658103bffd = asm_getbodyknob();
    prevanim = var_d5c987658103bffd;
    while (1) {
        loopanim = asm_getanim(asmname, statename);
        var_76c92379ed351610 = asm_getxanim(statename, loopanim);
        self aisetanim(statename, loopanim);
        asm_playfacialanim(asmname, statename, var_76c92379ed351610);
        prevanim = loopanim;
        if (var_b95ecd0bf886bb98) {
            /#
                assert(self._blackboard.var_6ff150891bb0c47);
            #/
            movedelta = getmovedelta(var_76c92379ed351610);
            startpos = groundpos - rotatevector(movedelta, self._blackboard.var_227cc162483aa47);
            self startcoverarrival(startpos, self._blackboard.var_227cc162483aa47[1]);
            thread patrol_idlesitting_checkforcoverarrivalcomplete(statename, groundpos);
            var_b95ecd0bf886bb98 = 0;
        }
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), statename);
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1195
// Size: 0x45
function patrol_idlesitting_checkforcoverarrivalcomplete(statename, endpos) {
    self endon(statename + "_finished");
    while (1) {
        if (distance2dsquared(self.origin, endpos) < 4) {
            self finishcoverarrival();
            break;
        }
        waitframe();
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x23
function patrol_playidlesittingloop_cleanup(asmname, statename, params) {
    self finishcoverarrival();
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x120b
// Size: 0x30
function patrol_playidlesittingloop_prop_cleanup(asmname, statename, params) {
    patrol_prop_cleanup(asmname, statename, params);
    patrol_playidlesittingloop_cleanup(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1242
// Size: 0x26
function patrol_playidlesittingloop_sleeping(asmname, statename, params) {
    patrol_playidlesittingloop(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x126f
// Size: 0x26
function patrol_playidlesittingloop_sleeping_cleanup(asmname, statename, params) {
    patrol_playidlesittingloop_cleanup(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x129c
// Size: 0x63
function patrol_playidlesittingloop_cellphone(asmname, statename, params) {
    self.idle_prop = namespace_bc4a4b9456315863::anim_link_tag_model(patrol_idle_getcellphone(), "tag_accessory_right");
    playfxontag(level.g_effect["cellphone_glow"], self.idle_prop, "tag_origin");
    patrol_playidlesittingloop(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1306
// Size: 0x26
function patrol_playidlesittingloop_laptop(asmname, statename, params) {
    patrol_playidlesittingloop(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1333
// Size: 0x3f
function patrol_playidlesittingloop_pistolclean(asmname, statename, params) {
    self.idle_prop = namespace_bc4a4b9456315863::anim_link_tag_model("weapon_wm_pi_mike1911_phys", "tag_accessory_right");
    patrol_playidlesittingloop(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1379
// Size: 0x58
function patrol_playdeathanim_sitting(asmname, statename, params) {
    if (isdefined(self.animated_prop)) {
        /#
            assert(isdefined(level.fnanimatedprop_startanim));
        #/
        self [[ level.fnanimatedprop_startanim ]]("idle_chair", params);
    }
    namespace_f0a0c13f724da4b::playdeathanim(asmname, statename);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13d8
// Size: 0x49
function patrol_playidlesittingreact(asmname, statename, params) {
    self animmode("noclip");
    if (isdefined(params)) {
        self [[ level.fnanimatedprop_setanim ]]("idle_chair", params);
    }
    asm_playanimstate(asmname, statename);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1428
// Size: 0xba
function patrol_hascustomanim(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self._blackboard.customidlenode)) {
        var_e25d1d189177a7c = self._blackboard.customidlenode;
    } else {
        var_e25d1d189177a7c = self._blackboard.var_fe458d6a41146a8c;
    }
    /#
        assert(isdefined(var_e25d1d189177a7c));
    #/
    return isdefined(level.scr_anim["patrol_idle"]) && isdefined(level.scr_anim["patrol_idle"][var_e25d1d189177a7c]) && isdefined(level.scr_anim["patrol_idle"][var_e25d1d189177a7c][params]);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14ea
// Size: 0xdb
function patrol_iscustomanimdefaultvalue(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self._blackboard.customidlenode)) {
        var_e25d1d189177a7c = self._blackboard.customidlenode;
    } else {
        var_e25d1d189177a7c = self._blackboard.var_fe458d6a41146a8c;
    }
    /#
        assert(isdefined(var_e25d1d189177a7c));
    #/
    /#
        assert(isdefined(level.scr_anim["patrol_idle"]) && isdefined(level.scr_anim["patrol_idle"][var_e25d1d189177a7c]) && isdefined(level.scr_anim["patrol_idle"][var_e25d1d189177a7c][params]));
    #/
    return isnumber(level.scr_anim["patrol_idle"][var_e25d1d189177a7c][params]);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15cd
// Size: 0x208
function patrol_chooseanim_custom(asmname, statename, params) {
    /#
        assert(isdefined(self._blackboard.customidlenode));
    #/
    var_e25d1d189177a7c = self._blackboard.customidlenode;
    state = params;
    /#
        assert(isdefined(var_e25d1d189177a7c));
    #/
    /#
        assert(isdefined(level.scr_anim));
    #/
    /#
        assert(isdefined(level.scr_anim["patrol_idle"]), "Unable to find entry for patrol idle anim " + var_e25d1d189177a7c + " in level.scr_anim[ " + "patrol_idle" + " ] array.");
    #/
    /#
        assert(isdefined(level.scr_anim["patrol_idle"][var_e25d1d189177a7c]), "Unable to find entry for patrol idle anim " + var_e25d1d189177a7c + " in level.scr_anim[ " + "patrol_idle" + " ] array.");
    #/
    /#
        assert(isdefined(level.scr_anim["patrol_idle"][var_e25d1d189177a7c][state]), "Unable to find entry for state " + state + " in level.scr_anim[ " + "patrol_idle" + " ][ " + var_e25d1d189177a7c + " ] array.");
    #/
    if (isarray(level.scr_anim["patrol_idle"][var_e25d1d189177a7c][state])) {
        var_ab337a614ac67fef = level.scr_anim["patrol_idle"][var_e25d1d189177a7c][state].size;
        /#
            assert(var_ab337a614ac67fef > 0);
        #/
        if (var_ab337a614ac67fef > 1) {
            if (isdefined(self.fnisinstealthinvestigate) && [[ self.fnisinstealthinvestigate ]]()) {
                if (isdefined(self.var_bb3bab49c9a764a4)) {
                    if (self.var_f97ff24102472069 == "investigate") {
                        return level.scr_anim["patrol_idle"][var_e25d1d189177a7c][state][0];
                    }
                }
            }
            return level.scr_anim["patrol_idle"][var_e25d1d189177a7c][state][1];
        } else {
            return level.scr_anim["patrol_idle"][var_e25d1d189177a7c][0];
        }
    } else {
        return level.scr_anim["patrol_idle"][var_e25d1d189177a7c][state];
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17dc
// Size: 0x86
function patrol_idle_custom_init(asmname, statename, params) {
    /#
        assert(self._blackboard.var_6ff150891bb0c47);
    #/
    /#
        assert(isdefined(self._blackboard.var_fe458d6a41146a8c));
    #/
    self._blackboard.customidlenode = self._blackboard.var_fe458d6a41146a8c;
    patrol_idle_init(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1869
// Size: 0x4e
function patrol_idle_custom_cleanup(asmname, statename, params) {
    patrol_idle_cleanup(asmname, statename, params);
    patrol_idle_callcustomcallback("cleanup");
    if (isalive(self)) {
        self._blackboard.customidlenode = undefined;
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18be
// Size: 0x87
function patrol_idle_callcustomcallback(funcname) {
    if (isdefined(level.idle_funcs)) {
        /#
            assert(isdefined(self._blackboard.customidlenode));
        #/
        var_e25d1d189177a7c = self._blackboard.customidlenode;
        if (isdefined(level.idle_funcs[var_e25d1d189177a7c]) && isdefined(level.idle_funcs[var_e25d1d189177a7c][funcname])) {
            self thread [[ level.idle_funcs[var_e25d1d189177a7c][funcname] ]]();
        }
    }
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x194c
// Size: 0x32
function patrol_playidleintro_custom(asmname, statename, params) {
    patrol_idle_callcustomcallback("intro_begin");
    patrol_playidleintro(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1985
// Size: 0x32
function patrol_playidleloop_custom(asmname, statename, params) {
    patrol_idle_callcustomcallback("loop_begin");
    patrol_playidleloop(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19be
// Size: 0x32
function patrol_playidlereact_custom(asmname, statename, params) {
    patrol_idle_callcustomcallback("react_begin");
    patrol_playidlereact(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19f7
// Size: 0x32
function patrol_playidleend_custom(asmname, statename, params) {
    patrol_idle_callcustomcallback("exit_begin");
    patrol_playidleend(asmname, statename, params);
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a30
// Size: 0x52
function patrol_playidle_custom_terminate(asmname, statename, params) {
    /#
        assert(isdefined(self._blackboard.customidlenode));
    #/
    /#
        assert(isdefined(params));
    #/
    patrol_idle_callcustomcallback(params + "_end");
}

// Namespace patrol_idle/namespace_f3685185f4e84ef0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a89
// Size: 0x2e
function patrol_prop_waitfordelete() {
    self endon("patrol_idle_complete");
    self waittill("entitydeleted");
    if (isdefined(self.idle_prop)) {
        self.idle_prop delete();
    }
}

