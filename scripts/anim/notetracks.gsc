// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_77c18cdedec620b3;
#using scripts\common\notetrack.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\anim\weaponlist.gsc;

#namespace notetracks;

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f4
// Size: 0x1ac
function function_ac31558a07af4e6b(note) {
    /#
        if (getdvarint(@"hash_a19781010239d2e6") != 1 && getdvarint(@"hash_a19781010239d2e6") != self getentitynumber()) {
            return;
        }
        self endon("load_shell");
        anim.var_6011144769939896 = 30;
        anim.var_6bf5d5ac4b32352f = 20;
        duration = anim.var_6bf5d5ac4b32352f + int(20 / anim.var_6011144769939896);
        color = (0.5, 0.75, 1);
        if (note == "gun_2_right" || note == "pistol_pickup") {
            color = (0.25, 0.4, 0.5);
        } else if (note == "ht_off") {
            color = (1, 0.5, 0.5);
        }
        for (i = 0; i < duration; i++) {
            if (duration - i <= anim.var_6bf5d5ac4b32352f) {
                amnt = 1 * (i - duration - anim.var_6bf5d5ac4b32352f) / anim.var_6bf5d5ac4b32352f;
            } else {
                amnt = 0;
            }
            time = 1 * i / 20;
            alpha = 1 - amnt * amnt;
            if (isai(self)) {
                pos = self geteye() + (0, 0, 20 + anim.var_6011144769939896 * time);
            } else {
                pos = self.origin;
            }
            print3d(pos, note, color, alpha, 0.5);
            waitframe();
        }
    #/
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa7
// Size: 0x4e0
function registernotetracks() {
    thread function_1f7bb66025f2aedf();
    anim.notetracks["anim_movement = "stop""] = &notetrackmovementstop;
    anim.notetracks["anim_movement = "walk""] = &notetrackmovementwalk;
    anim.notetracks["anim_movement = "run""] = &notetrackmovementrun;
    anim.notetracks["anim_movement = stop"] = &notetrackmovementstop;
    anim.notetracks["anim_movement = walk"] = &notetrackmovementwalk;
    anim.notetracks["anim_movement = run"] = &notetrackmovementrun;
    anim.notetracks["anim_movement_gun_pose_override = run_gun_down"] = &notetrackmovementgunposeoverride;
    anim.notetracks["anim_coverpose = cover_left"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = cover_right"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = cover_crouch"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = cover_stand"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = cover_left_crouch"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = cover_right_crouch"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = exposed"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = exposed_crouch"] = &notetrackcoverposerequest;
    anim.notetracks["anim_coverpose = prone"] = &notetrackcoverposerequest;
    anim.notetracks["anim_aiming = 1"] = &notetrackalertnessaiming;
    anim.notetracks["anim_aiming = 0"] = &notetrackalertnessalert;
    anim.notetracks["anim_alertness = causal"] = &notetrackalertnesscasual;
    anim.notetracks["anim_alertness = alert"] = &notetrackalertnessalert;
    anim.notetracks["anim_alertness = aiming"] = &notetrackalertnessaiming;
    anim.notetracks["gravity on"] = &notetrackgravity;
    anim.notetracks["gravity off"] = &notetrackgravity;
    anim.notetracks["bodyfall large"] = &notetrackbodyfall;
    anim.notetracks["bodyfall small"] = &notetrackbodyfall;
    anim.notetracks["code_move"] = &notetrackcodemove;
    anim.notetracks["face_enemy"] = &notetrackfaceenemy;
    anim.notetracks["pistol_rechamber"] = &notetrackpistolrechamber;
    anim.notetracks["load_shell"] = &notetrackloadshell;
    anim.notetracks["fire_if_loaded"] = &function_df92aadf78bfcf42;
    anim.notetracks["fire"] = &notetrackfire;
    anim.notetracks["fire_spray"] = &notetrackfirespray;
    anim.notetracks["gun_2_chest"] = &notetrackguntochest;
    anim.notetracks["gun_2_back"] = &notetrackguntoback;
    anim.notetracks["gun_2_right"] = &notetrackguntoright;
    anim.notetracks["gun_2_hand"] = &function_12e1635911fd2716;
    anim.notetracks["secondary_pickup"] = &function_c99ec552dfea0f86;
    anim.notetracks["secondary_putaway"] = &function_316d2ec7583a1e29;
    anim.notetracks["pistol_pickup"] = &notetrackpistolpickup;
    anim.notetracks["pistol_putaway"] = &notetrackpistolputaway;
    anim.notetracks["refill clip"] = &notetrackrefillclip;
    anim.notetracks["reload done"] = &notetrackrefillclip;
    anim.notetracks["ht_on"] = &notetrackhton0;
    anim.notetracks["ht_on_0"] = &notetrackhton0;
    anim.notetracks["ht_on_1"] = &notetrackhton1;
    anim.notetracks["ht_off"] = &notetrackhtoff;
    anim.notetracks["hp_on"] = &function_5a8f2c4ba78d7bff;
    anim.notetracks["hp_on_pos"] = &function_ab37da002eddaf9f;
    anim.notetracks["hp_off"] = &function_b67df3617c4f2903;
    anim.notetracks["notify"] = &function_c7c1dd20323389c9;
    anim.notetracks["viewunlinkmodel"] = &function_5b7a0a74bd3d5e0b;
    anim.notetracks["charge_abort"] = &function_28b89c4ec5292326;
    anim.notetracks["melee_swipe"] = &function_1777a8463e80f52e;
    if (isdefined(level._notetrackfx)) {
        keys = getarraykeys(level._notetrackfx);
        foreach (key in keys) {
            anim.notetracks[key] = &customnotetrackfx;
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf8e
// Size: 0x14
function notetrackstopanim(note, flagname) {
    
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa9
// Size: 0xdd
function notetrackcoverposerequest(note, flagname) {
    /#
        assert(issubstr(note, "anim_coverpose = "));
    #/
    var_6b92e7e9d48f74a9 = strtok(note, " = ")[1];
    switch (var_6b92e7e9d48f74a9) {
    case #"hash_175771022bc5e75d":
    case #"hash_4ddb655e251e06c8":
    case #"hash_9d76c99eddd14433":
    case #"hash_c475427a998ee26c":
    case #"hash_d165cddb82d41e6a":
    case #"hash_d44cb989edc40ab3":
    case #"hash_d91940431ed7c605":
    case #"hash_e7aface284179b3b":
    case #"hash_f1676baca0ae608b":
        self.var_b74cb68648b5306e = var_6b92e7e9d48f74a9;
        break;
    default:
        /#
            assertmsg("Unrecognized coverpose selector");
        #/
        break;
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108d
// Size: 0x2d
function notetrackmovementstop(note, flagname) {
    self.a.movement = "stop";
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c1
// Size: 0x2d
function notetrackmovementwalk(note, flagname) {
    self.a.movement = "walk";
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f5
// Size: 0x2d
function notetrackmovementrun(note, flagname) {
    self.a.movement = "run";
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1129
// Size: 0x2d
function notetrackmovementgunposeoverride(note, flagname) {
    self.asm.movementgunposeoverride = "run_gun_down";
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115d
// Size: 0x14
function notetrackalertnessaiming(note, flagname) {
    
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1178
// Size: 0x14
function notetrackalertnesscasual(note, flagname) {
    
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1193
// Size: 0x14
function notetrackalertnessalert(note, flagname) {
    
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11ae
// Size: 0x6f
function function_48e7a4a270c0d370(note, flagname) {
    /#
        setdvarifuninitialized(@"hash_d54f2997c58912ce", "Unrecognized coverpose selector");
        if (getdvarint(@"hash_d54f2997c58912ce") < 1) {
            return;
        }
        if (!isdefined(flagname)) {
            flagname = "walk";
        }
        if (issubstr(note, "run_gun_down")) {
            println("gravity" + note + "," + flagname);
        }
    #/
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1224
// Size: 0x14
function notetrackloadshell(note, flagname) {
    
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123f
// Size: 0x14
function notetrackpistolrechamber(note, flagname) {
    
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125a
// Size: 0x4b
function notetrackgravity(note, flagname) {
    if (issubstr(note, "on")) {
        self animmode("gravity");
    } else if (issubstr(note, "off")) {
        self animmode("nogravity");
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x143
function customnotetrackfx(note, flagname) {
    /#
        assert(isdefined(level._notetrackfx[note]));
    #/
    if (isdefined(self.groundtype)) {
        groundtype = self.groundtype;
    } else {
        groundtype = "dirt";
    }
    struct = undefined;
    if (isdefined(level._notetrackfx[note][groundtype])) {
        struct = level._notetrackfx[note][groundtype];
    } else if (isdefined(level._notetrackfx[note]["all"])) {
        struct = level._notetrackfx[note]["all"];
    }
    if (!isdefined(struct)) {
        return;
    }
    if (isai(self) && isdefined(struct.fx)) {
        playfxontag(struct.fx, self, struct.tag);
    }
    if (!isdefined(struct.sound_prefix) && !isdefined(struct.sound_suffix)) {
        return;
    }
    alias = "" + struct.sound_prefix + groundtype + struct.sound_suffix;
    if (soundexists(alias)) {
        self playsound(alias);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f6
// Size: 0x19
function notetrackcodemove(note, flagname) {
    return "code_move";
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1417
// Size: 0x20
function notetrackfaceenemy(note, flagname) {
    self orientmode("face enemy");
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143e
// Size: 0x8b
function notetrackbodyfall(note, flagname) {
    suffix = "_small";
    if (issubstr(note, "large")) {
        suffix = "_large";
    }
    if (isdefined(self.groundtype)) {
        groundtype = self.groundtype;
    } else {
        groundtype = "dirt";
    }
    if (suffix == "_large") {
        self playsurfacesound("bodyfall_torso", groundtype);
    } else {
        self playsurfacesound("bodyfall_limb_small", groundtype);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d0
// Size: 0xbd
function donotetracks(flagname, customfunction, debugidentifier) {
    for (;;) {
        notes = self waittill(flagname);
        if (!isdefined(notes)) {
            notes = [0:"undefined"];
        }
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        validatenotetracks(flagname, notes);
        foreach (note in notes) {
            val = handlenotetrack(note, flagname, customfunction);
            if (isdefined(val)) {
                return val;
            }
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1594
// Size: 0x79
function handlenotetrack(note, flagname, customfunction, var_35ce7799b701c978) {
    if (isdefined(self.fnasm_handlenotetrack)) {
        return [[ self.fnasm_handlenotetrack ]](note, flagname, customfunction, var_35ce7799b701c978);
    } else if (isdefined(level._defaultnotetrackhandler)) {
        return [[ level._defaultnotetrackhandler ]](note, flagname, customfunction, var_35ce7799b701c978);
    } else {
        /#
            assertmsg("No note track handler for ent " + self getentitynumber());
        #/
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1614
// Size: 0x3b
function hascustomnotetrackhandler(note) {
    notetrackfunc = anim.notetracks[note];
    if (isdefined(notetrackfunc)) {
        return 1;
    }
    if (isdefined(self.customnotetrackhandler)) {
        return 1;
    }
    return 0;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1657
// Size: 0x98
function handlecustomnotetrackhandler(note, flagname, customfunction, var_35ce7799b701c978) {
    /#
        assert(hascustomnotetrackhandler(note));
    #/
    notetrackfunc = anim.notetracks[note];
    /#
        function_48e7a4a270c0d370(note, flagname);
    #/
    if (isdefined(notetrackfunc)) {
        return [[ notetrackfunc ]](note, flagname);
    } else if (isdefined(self.customnotetrackhandler)) {
        if (isdefined(var_35ce7799b701c978)) {
            return [[ self.customnotetrackhandler ]](note, flagname, customfunction, var_35ce7799b701c978);
        } else {
            return [[ self.customnotetrackhandler ]](note, flagname, customfunction);
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f6
// Size: 0x27c
function handlecommonnotetrack(note, flagname, customfunction, var_35ce7799b701c978) {
    /#
        thread function_ac31558a07af4e6b(note);
    #/
    switch (note) {
    case #"hash_b61583709daf623":
    case #"hash_247cc07ab83949f2":
    case #"hash_2a91eda16e3944d1":
    case #"hash_ed49946bfff8e78a":
        return note;
    case #"hash_1962676868099dfd":
        if (isdefined(self.enemy)) {
            return note;
        }
        break;
    case #"hash_49af0c46b8bd5fb2":
        thread play_sound_in_space("melee_swing_small", self gettagorigin("TAG_WEAPON_RIGHT"));
        break;
    case #"hash_466ca7b853d8962e":
        thread play_sound_in_space("melee_swing_large", self gettagorigin("TAG_WEAPON_RIGHT"));
        break;
    case #"hash_e01205bce6c9351c":
        self.a.nodeath = 1;
        break;
    case #"hash_96585dbff62202c2":
        self.allowpain = 0;
        break;
    case #"hash_fc9342b5a91869ea":
        self.allowpain = 1;
        break;
    case #"hash_39305061b0d59e1e":
    case #"hash_83ed1371a36bf0b6":
        self.a.meleestate = "right";
        break;
    case #"hash_d97e6d5be66b4c5":
    case #"hash_31521d11dde26e47":
        self.a.meleestate = "left";
        break;
    case #"hash_7701f1d5cbc5085d":
        if (isdefined(self.hatmodel)) {
            if (isdefined(self.helmetsidemodel)) {
                self detach(self.helmetsidemodel, "TAG_HELMETSIDE");
                self.helmetsidemodel = undefined;
            }
            self detach(self.hatmodel, "");
            self attach(self.hatmodel, "TAG_WEAPON_LEFT");
            self.hatmodel = undefined;
        }
        break;
    case #"hash_6f55d0ff4f5a774":
        level notify("glass_break", self);
        break;
    case #"hash_275f5641f230746b":
        level notify("glass_break", self);
        break;
    case #"hash_ff2ad0514dabb22b":
        if (!self.fixednode) {
            self animmode("physics_drift");
        }
        break;
    default:
        return "__unhandled";
        break;
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1979
// Size: 0x101
function donotetracksintercept(flagname, interceptfunction, debugidentifier) {
    /#
        assert(isdefined(interceptfunction));
    #/
    for (;;) {
        notes = self waittill(flagname);
        if (!isdefined(notes)) {
            notes = [0:"undefined"];
        }
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        validatenotetracks(flagname, notes);
        intercepted = [[ interceptfunction ]](notes);
        if (isdefined(intercepted) && intercepted) {
            continue;
        }
        var_fc9a12fe1f57542a = undefined;
        foreach (note in notes) {
            val = handlenotetrack(note, flagname);
            if (isdefined(val)) {
                var_fc9a12fe1f57542a = val;
                break;
            }
        }
        if (isdefined(var_fc9a12fe1f57542a)) {
            return var_fc9a12fe1f57542a;
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a81
// Size: 0xdc
function donotetrackspostcallback(flagname, postfunction) {
    /#
        assert(isdefined(postfunction));
    #/
    for (;;) {
        notes = self waittill(flagname);
        if (!isdefined(notes)) {
            notes = [0:"undefined"];
        }
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        validatenotetracks(flagname, notes);
        var_fc9a12fe1f57542a = undefined;
        foreach (note in notes) {
            val = handlenotetrack(note, flagname);
            if (isdefined(val)) {
                var_fc9a12fe1f57542a = val;
                break;
            }
        }
        [[ postfunction ]](notes);
        if (isdefined(var_fc9a12fe1f57542a)) {
            return var_fc9a12fe1f57542a;
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b64
// Size: 0x2e
function donotetracksfortimeout(flagname, killstring, customfunction, debugidentifier) {
    donotetracks(flagname, customfunction, debugidentifier);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b99
// Size: 0x34
function donotetracksforever(flagname, killstring, customfunction, debugidentifier) {
    donotetracksforeverproc(&donotetracks, flagname, killstring, customfunction, debugidentifier);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd4
// Size: 0x34
function donotetracksforeverintercept(flagname, killstring, interceptfunction, debugidentifier) {
    donotetracksforeverproc(&donotetracksintercept, flagname, killstring, interceptfunction, debugidentifier);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0f
// Size: 0xe2
function donotetracksforeverproc(notetracksfunc, flagname, killstring, customfunction, debugidentifier) {
    if (isdefined(killstring)) {
        self endon(killstring);
    }
    self endon("killanimscript");
    if (!isdefined(debugidentifier)) {
        debugidentifier = "undefined";
    }
    for (;;) {
        time = gettime();
        returnednote = [[ notetracksfunc ]](flagname, customfunction, debugidentifier);
        timetaken = gettime() - time;
        if (timetaken < 0.05) {
            time = gettime();
            returnednote = [[ notetracksfunc ]](flagname, customfunction, debugidentifier);
            timetaken = gettime() - time;
            if (timetaken < 0.05) {
                /#
                    println(gettime() + "dof_stop" + debugidentifier + "unlinkmodel" + flagname + "<unknown string>" + returnednote + "<unknown string>");
                #/
                wait(0.05 - timetaken);
            }
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf8
// Size: 0x4e
function donotetrackswithtimeout(flagname, time, customfunction, debugidentifier) {
    ent = spawnstruct();
    ent thread donotetracksfortimeendnotify(time);
    donotetracksfortimeproc(&donotetracksfortimeout, flagname, customfunction, debugidentifier, ent);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4d
// Size: 0x4e
function donotetracksfortime(time, flagname, customfunction, debugidentifier) {
    ent = spawnstruct();
    ent thread donotetracksfortimeendnotify(time);
    donotetracksfortimeproc(&donotetracksforever, flagname, customfunction, debugidentifier, ent);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1da2
// Size: 0x4e
function donotetracksfortimeintercept(time, flagname, interceptfunction, debugidentifier) {
    ent = spawnstruct();
    ent thread donotetracksfortimeendnotify(time);
    donotetracksfortimeproc(&donotetracksforeverintercept, flagname, interceptfunction, debugidentifier, ent);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df7
// Size: 0x3b
function donotetracksfortimeproc(donotetracksforeverfunc, flagname, customfunction, debugidentifier, ent) {
    ent endon("stop_notetracks");
    [[ donotetracksforeverfunc ]](flagname, undefined, customfunction, debugidentifier);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e39
// Size: 0x16
function donotetracksfortimeendnotify(time) {
    wait(time);
    self notify("stop_notetracks");
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x2b
function notetrack_prefix_handler(notetrack) {
    /#
        assert(isdefined(level.fnnotetrackprefixhandler));
    #/
    return [[ level.fnnotetrackprefixhandler ]](notetrack);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e89
// Size: 0x1c
function function_8b5c774e7238fec5(guy, notetrack) {
    function_580423f29d7d5065(notetrack);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eac
// Size: 0x80
function function_6ba70af530538250() {
    if (utility::iscp() || utility::ismp()) {
        var_9f4c94def2af44d6 = self getlinkedchildren();
        foreach (ent in var_9f4c94def2af44d6) {
            if (isplayer(ent)) {
                return ent;
            }
        }
    }
    return level.player;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f34
// Size: 0xac1
function notetrack_prefix_handler_common(notetrack) {
    var_7cdb504e7250f362 = getsubstr(notetrack, 0, 3);
    if (var_7cdb504e7250f362 == "sm_") {
        model = function_8d7149eabaa11e1(getsubstr(notetrack, 3));
        self setmodel(model);
    } else if (var_7cdb504e7250f362 == "fb_") {
        player = function_6ba70af530538250();
        /#
            assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
        #/
        var_d9d23d8c4870df60 = strtok(notetrack, "_");
        var_21c15ce9aa5f97e2 = tolower(var_d9d23d8c4870df60[1]);
        var_3e748cf38c614200 = undefined;
        var_21e5d264c2eefa94 = undefined;
        var_9f075c08a89eab6f = undefined;
        if (var_21c15ce9aa5f97e2 == "to") {
            var_3e748cf38c614200 = float(var_d9d23d8c4870df60[2]);
        } else if (var_21c15ce9aa5f97e2 == "from") {
            var_9f075c08a89eab6f = float(var_d9d23d8c4870df60[2]);
        } else if (var_21c15ce9aa5f97e2 == "tofrom") {
            var_3e748cf38c614200 = float(var_d9d23d8c4870df60[2]);
            var_21e5d264c2eefa94 = float(var_d9d23d8c4870df60[3]);
            var_9f075c08a89eab6f = float(var_d9d23d8c4870df60[4]);
        }
        player thread function_f74121b03472e19d(var_3e748cf38c614200, var_21e5d264c2eefa94, var_9f075c08a89eab6f);
        return 1;
    } else if (var_7cdb504e7250f362 == "rm_") {
        player = function_6ba70af530538250();
        /#
            assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
        #/
        rumble = getsubstr(notetrack, 3);
        player playrumbleonentity(rumble);
        return 1;
    } else if (var_7cdb504e7250f362 == "at_") {
        function_fdb7ea91bda694dc(getsubstr(notetrack, 3));
        return 1;
    } else if (var_7cdb504e7250f362 == "dt_") {
        params = getsubstr(notetrack, 3);
        if (params == "all") {
            function_78157f1bf846e991();
        } else {
            function_a06953a984b6a42a(params);
        }
        return 1;
    } else if (var_7cdb504e7250f362 == "ds_") {
        function_45f825a87c104b8e(getsubstr(notetrack, 3));
        return 1;
    } else if (var_7cdb504e7250f362 == "as_") {
        function_8ecc4b9e8758773e(getsubstr(notetrack, 3));
        return 1;
    } else if (var_7cdb504e7250f362 == "fs_") {
        flag_set(getsubstr(notetrack, 3));
        return 1;
    } else if (var_7cdb504e7250f362 == "fc_") {
        flag_clear(getsubstr(notetrack, 3));
        return 1;
    }
    var_7cdb4b4e7250e863 = getsubstr(notetrack, 0, 4);
    if (var_7cdb4b4e7250e863 == "fsf_") {
        player = function_6ba70af530538250();
        /#
            assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
        #/
        var_985c64fc7f3f4b6 = strtok(notetrack, "_");
        var_80698c7167df0cb7 = float(var_985c64fc7f3f4b6[1]);
        var_19fd165b9d684b3d = float(var_985c64fc7f3f4b6[2]);
        player lerpfovscalefactor(var_80698c7167df0cb7, var_19fd165b9d684b3d);
        return 1;
    } else if (var_7cdb4b4e7250e863 == "rms_") {
        rumble = function_6add3fe5d360337b(notetrack, var_7cdb4b4e7250e863);
        if (rumble == "all") {
            stopallrumbles();
        } else {
            player = function_6ba70af530538250();
            /#
                assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
            #/
            player stoprumble(rumble);
        }
        return 1;
    } else if (var_7cdb4b4e7250e863 == "rml_") {
        player = function_6ba70af530538250();
        /#
            assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
        #/
        rumble = function_6add3fe5d360337b(notetrack, var_7cdb4b4e7250e863);
        player playrumblelooponentity(rumble);
        return 1;
    } else if (var_7cdb4b4e7250e863 == "fov_") {
        player = function_6ba70af530538250();
        /#
            assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
        #/
        if (!isdefined(player)) {
            return 1;
        }
        var_4712e8231030af95 = strtok(notetrack, "_");
        var_555d27d0d0741def = tolower(var_4712e8231030af95[1]);
        var_d542d908656284ba = undefined;
        var_3cf456b26f4e4414 = undefined;
        var_4ddc157b83fb4768 = undefined;
        var_d774055d7a1b20db = undefined;
        var_9a3e5dc4eb196631 = undefined;
        if (var_555d27d0d0741def == "start") {
            var_d542d908656284ba = float(var_4712e8231030af95[2]);
            if (isdefined(var_4712e8231030af95[3])) {
                var_3cf456b26f4e4414 = float(var_4712e8231030af95[3]);
            }
            var_9a3e5dc4eb196631 = 4;
        } else {
            var_d542d908656284ba = 65;
            if (isdefined(var_4712e8231030af95[2])) {
                var_3cf456b26f4e4414 = float(var_4712e8231030af95[2]);
            }
            var_9a3e5dc4eb196631 = 3;
        }
        var_52f71a00dd433a4a = var_4712e8231030af95[var_9a3e5dc4eb196631];
        if (isdefined(var_52f71a00dd433a4a)) {
            if (var_52f71a00dd433a4a == "easein") {
                var_4ddc157b83fb4768 = float(var_4712e8231030af95[var_9a3e5dc4eb196631 + 1]);
                var_f2cba4268aa5b3c7 = var_4712e8231030af95[var_9a3e5dc4eb196631 + 2];
                if (isdefined(var_f2cba4268aa5b3c7) && var_f2cba4268aa5b3c7 == "easeout") {
                    var_d774055d7a1b20db = float(var_4712e8231030af95[var_9a3e5dc4eb196631 + 3]);
                }
            } else if (var_52f71a00dd433a4a == "easeout") {
                var_d774055d7a1b20db = float(var_4712e8231030af95[var_9a3e5dc4eb196631 + 1]);
            }
        }
        player modifybasefov(var_d542d908656284ba, var_3cf456b26f4e4414, var_4ddc157b83fb4768, var_d774055d7a1b20db);
        return 1;
    } else if (var_7cdb4b4e7250e863 == "dof_") {
        player = function_6ba70af530538250();
        /#
            assertex(isdefined(player), "Player undefined in notetrack: " + notetrack);
        #/
        var_afafe5ed1c093fed = strtok(notetrack, ",");
        var_3f6822b43fe907ad = tolower(var_afafe5ed1c093fed[0]);
        if (var_3f6822b43fe907ad == "dof_auto") {
            if (!isdefined(var_afafe5ed1c093fed[1])) {
                /#
                    /#
                        assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                    #/
                #/
                return;
            }
            fstop = float(var_afafe5ed1c093fed[1]);
            var_f94941fb655b0a39 = function_305541769c1da042(var_afafe5ed1c093fed[2]);
            var_b225076a313507bb = function_305541769c1da042(var_afafe5ed1c093fed[3]);
            player namespace_448ccf1ca136fbbe::dof_enable_autofocus(fstop, undefined, var_f94941fb655b0a39, var_b225076a313507bb);
        } else if (var_3f6822b43fe907ad == "dof_ent" || var_3f6822b43fe907ad == "dof_ent1") {
            if (!isdefined(var_afafe5ed1c093fed[1])) {
                /#
                    /#
                        assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                    #/
                #/
                return;
            }
            fstop = float(var_afafe5ed1c093fed[1]);
            var_f94941fb655b0a39 = function_305541769c1da042(var_afafe5ed1c093fed[2]);
            var_b225076a313507bb = function_305541769c1da042(var_afafe5ed1c093fed[3]);
            var_d39c526e012bc59c = undefined;
            if (isdefined(var_afafe5ed1c093fed[4])) {
                var_d39c526e012bc59c = function_8d7149eabaa11e1(var_afafe5ed1c093fed[4]);
                if (isdefined(var_d39c526e012bc59c) && !self tagexists(var_d39c526e012bc59c)) {
                    /#
                        /#
                            assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                        #/
                    #/
                    return;
                }
            }
            var_d6c219c0784f4dc6 = function_b8ba8f3c8f62ace7(var_afafe5ed1c093fed[5]);
            var_6cea64849afafc65 = self;
            if (var_3f6822b43fe907ad == "dof_ent") {
                player namespace_448ccf1ca136fbbe::dof_enable_autofocus(fstop, var_6cea64849afafc65, var_f94941fb655b0a39, var_b225076a313507bb, undefined, var_d39c526e012bc59c, undefined, var_d6c219c0784f4dc6, 1);
            } else {
                var_9690d3494ad2efcb = distance(player geteye(), var_6cea64849afafc65.origin);
                player utility::dof_enable(fstop, var_9690d3494ad2efcb, undefined, var_f94941fb655b0a39, var_b225076a313507bb, undefined, var_d39c526e012bc59c);
            }
        } else if (var_3f6822b43fe907ad == "dof_distance" || var_3f6822b43fe907ad == "dof_distance1") {
            if (!isdefined(var_afafe5ed1c093fed[1])) {
                /#
                    /#
                        assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                    #/
                #/
                return;
            }
            var_9690d3494ad2efcb = float(var_afafe5ed1c093fed[1]);
            if (!isdefined(var_afafe5ed1c093fed[2])) {
                /#
                    /#
                        assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                    #/
                #/
                return;
            }
            fstop = float(var_afafe5ed1c093fed[2]);
            var_f94941fb655b0a39 = function_305541769c1da042(var_afafe5ed1c093fed[3]);
            var_b225076a313507bb = function_305541769c1da042(var_afafe5ed1c093fed[4]);
            if (var_3f6822b43fe907ad == "dof_distance") {
                player namespace_448ccf1ca136fbbe::dof_enable_autofocus(fstop, undefined, var_f94941fb655b0a39, var_b225076a313507bb, undefined, var_9690d3494ad2efcb, undefined, 1);
            } else {
                player utility::dof_enable(fstop, var_9690d3494ad2efcb, undefined, var_f94941fb655b0a39, var_b225076a313507bb);
            }
        } else if (var_3f6822b43fe907ad == "dof_pos" || var_3f6822b43fe907ad == "dof_pos1") {
            var_3dd01883bd5fb96a = function_71da05b697e393a1(var_afafe5ed1c093fed[1], var_afafe5ed1c093fed[2], var_afafe5ed1c093fed[3]);
            if (!isdefined(var_3dd01883bd5fb96a)) {
                /#
                    /#
                        assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                    #/
                #/
                return;
            }
            if (!isdefined(var_afafe5ed1c093fed[4])) {
                /#
                    /#
                        assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                    #/
                #/
                return;
            }
            fstop = float(var_afafe5ed1c093fed[4]);
            var_f94941fb655b0a39 = function_305541769c1da042(var_afafe5ed1c093fed[5]);
            var_b225076a313507bb = function_305541769c1da042(var_afafe5ed1c093fed[6]);
            if (var_3f6822b43fe907ad == "dof_pos") {
                player namespace_448ccf1ca136fbbe::dof_enable_autofocus(fstop, undefined, var_f94941fb655b0a39, var_b225076a313507bb, undefined, var_3dd01883bd5fb96a, undefined, 1);
            } else {
                var_9690d3494ad2efcb = distance(player geteye(), var_3dd01883bd5fb96a);
                player utility::dof_enable(fstop, var_9690d3494ad2efcb, undefined, var_f94941fb655b0a39, var_b225076a313507bb, var_3dd01883bd5fb96a);
            }
        } else if (var_3f6822b43fe907ad == "dof_stop") {
            player namespace_448ccf1ca136fbbe::dof_disable_autofocus();
        } else {
            /#
                /#
                    assertmsg("<unknown string>" + notetrack + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
                #/
            #/
        }
        return 1;
    }
    if (isstartstr(notetrack, "linkmodel")) {
        params = getsubstr(notetrack, 10);
        function_f22b886a2036c871(params);
        return 1;
    } else if (isstartstr(notetrack, "unlinkmodel")) {
        params = getsubstr(notetrack, 12);
        if (params == "all") {
            function_b305ad01e100f851();
        } else {
            function_e5e7e79093ba26ea(params);
        }
        return 1;
    } else if (isstartstr(notetrack, "hide")) {
        params = getsubstr(notetrack, 5);
        var_78057acea4f71dbc = strtok(params, ",");
        tag = var_78057acea4f71dbc[0];
        if (isdefined(tag)) {
            if (utility::issp()) {
                if (isdefined(var_78057acea4f71dbc[1])) {
                    self hidepart(tag, var_78057acea4f71dbc[1]);
                } else {
                    self hidepart(tag);
                }
            }
        } else {
            self hide();
        }
        return 1;
    } else if (isstartstr(notetrack, "show")) {
        params = getsubstr(notetrack, 5);
        var_78057acea4f71dbc = strtok(params, ",");
        tag = var_78057acea4f71dbc[0];
        if (isdefined(tag)) {
            if (utility::issp()) {
                params = getsubstr(notetrack, 5);
                var_3750d248dfe18f81 = strtok(params, ",");
                if (isdefined(var_3750d248dfe18f81[1])) {
                    self showpart(tag, var_3750d248dfe18f81[1]);
                } else {
                    self showpart(tag);
                }
            }
        } else {
            self show();
        }
        return 1;
    }
    return 0;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29fd
// Size: 0x9f
function shootnotetrack() {
    waittillframeend();
    if (isdefined(self) && isalive(self) && gettime() > self._blackboard.var_60dcaa3d3be97ab) {
        if (istrue(self._blackboard.shootparams_valid)) {
            var_9bc9d0ee2a8a46f5 = self._blackboard.shootparams_shotsperburst == 1;
        } else {
            var_9bc9d0ee2a8a46f5 = 1;
        }
        shootenemywrapper(var_9bc9d0ee2a8a46f5);
        decrementbulletsinclip();
        if (weaponclass(self.weapon) == "rocketlauncher") {
            self.rocketammo--;
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa3
// Size: 0x29
function function_df92aadf78bfcf42(note, flagname) {
    if (self.bulletsinclip) {
        notetrackfire(note, flagname);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad3
// Size: 0x5b
function notetrackfire(note, flagname) {
    if (isdefined(self.script) && isdefined(anim.fire_notetrack_functions[self.script])) {
        thread [[ anim.fire_notetrack_functions[self.script] ]]();
    } else {
        thread shootnotetrack();
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b35
// Size: 0x1ed
function notetrackfirespray(note, flagname) {
    if (!isalive(self) && self isbadguy()) {
        if (isdefined(self.changed_team)) {
            return;
        }
        self.changed_team = 1;
        teams["axis"] = "team3";
        teams["team3"] = "axis";
        /#
            assertex(isdefined(teams[self.team]), "no team for " + self.team);
        #/
        self.team = teams[self.team];
    }
    if (!issentient(self)) {
        self notify("fire");
        return;
    }
    if (isundefinedweapon(self.a.weaponpos["right"])) {
        return;
    }
    var_36e9bb1631d024f5 = self getmuzzlepos();
    dir = anglestoforward(self getmuzzleangle());
    ang = 10;
    if (isdefined(self.isrambo)) {
        ang = 20;
    }
    var_9c3a83531a8a275a = 0;
    if (isalive(self.enemy) && issentient(self.enemy) && self canshootenemy()) {
        var_b3bca3e7f11a1cce = vectornormalize(self.enemy geteye() - var_36e9bb1631d024f5);
        if (vectordot(dir, var_b3bca3e7f11a1cce) > cos(ang)) {
            var_9c3a83531a8a275a = 1;
        }
    }
    if (var_9c3a83531a8a275a) {
        shootenemywrapper();
    } else {
        dir = dir + ((randomfloat(2) - 1) * 0.1, (randomfloat(2) - 1) * 0.1, (randomfloat(2) - 1) * 0.1);
        pos = var_36e9bb1631d024f5 + dir * 1000;
        self [[ anim.shootposwrapper_func ]](pos);
    }
    decrementbulletsinclip();
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d29
// Size: 0x1b
function notetrackrefillclip(note, flagname) {
    namespace_192c166ad8ed6432::refillclip();
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4b
// Size: 0x49
function function_c7c1dd20323389c9(note, flagname, var_35ce7799b701c978) {
    player = level.players[var_35ce7799b701c978[0]];
    if (var_35ce7799b701c978.size == 3 && isdefined(player)) {
        player notify(var_35ce7799b701c978[2]);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9b
// Size: 0x75
function function_5b7a0a74bd3d5e0b(note, flagname, var_35ce7799b701c978) {
    if (var_35ce7799b701c978.size == 3) {
        params = strtok(var_35ce7799b701c978[2], ",");
        if (params.size >= 1) {
            var_f8a3b6e282b87e24 = params[0];
            var_f67659ab5e885a58 = getent(var_f8a3b6e282b87e24, "targetname");
            if (isdefined(var_f67659ab5e885a58)) {
                var_f67659ab5e885a58 delete();
            }
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e17
// Size: 0x6d
function getpreferredweapon() {
    if (self._blackboard.weaponrequest == weaponclass(self.primaryweapon)) {
        return self.primaryweapon;
    } else if (self._blackboard.weaponrequest == weaponclass(self.secondaryweapon)) {
        return self.secondaryweapon;
    }
    return self.primaryweapon;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8c
// Size: 0x3c
function notetrackguntochest(note, flagname) {
    if (isdefined(self.fnplaceweaponon)) {
        self [[ self.fnplaceweaponon ]](self.weapon, "chest");
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ecf
// Size: 0x62
function notetrackguntoback(note, flagname) {
    if (isdefined(self.fnplaceweaponon)) {
        self [[ self.fnplaceweaponon ]](self.weapon, "back");
    }
    self.weapon = getpreferredweapon();
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f38
// Size: 0x106
function notetrackpistolpickup(note, flagname) {
    var_3701b823d5a1dd65 = "right";
    if (!isdefined(self.sidearm) || isnullweapon(self.sidearm) || self.weapon == self.sidearm && isdefined(self.a.weaponpos[var_3701b823d5a1dd65]) && self.a.weaponpos[var_3701b823d5a1dd65] == self.weapon) {
        return;
    }
    if (isdefined(self.fnplaceweaponon)) {
        self [[ self.fnplaceweaponon ]](self.sidearm, var_3701b823d5a1dd65);
    }
    if (isdefined(self.stowsidearmposition)) {
        self.a.weaponpos[self.stowsidearmposition] = undefined;
    }
    self.bulletsinclip = weaponclipsize(self.weapon);
    self notify("weapon_switch_done");
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3045
// Size: 0x91
function notetrackpistolputaway(note, flagname) {
    if (isdefined(self.fnplaceweaponon)) {
        if (isdefined(self.stowsidearmposition)) {
            self [[ self.fnplaceweaponon ]](self.sidearm, self.stowsidearmposition);
        } else {
            self [[ self.fnplaceweaponon ]](self.sidearm, "none");
        }
    }
    self.weapon = getpreferredweapon();
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30dd
// Size: 0xef
function function_c99ec552dfea0f86(note, flagname) {
    var_3701b823d5a1dd65 = "right";
    /#
        assert(isdefined(self.secondaryweapon));
    #/
    if (!isdefined(self.secondaryweapon) || isnullweapon(self.secondaryweapon) || self.weapon == self.secondaryweapon && isdefined(self.a.weaponpos[var_3701b823d5a1dd65]) && self.a.weaponpos[var_3701b823d5a1dd65] == self.secondaryweapon) {
        return;
    }
    if (isdefined(self.fnplaceweaponon)) {
        self [[ self.fnplaceweaponon ]](self.secondaryweapon, var_3701b823d5a1dd65);
    }
    self.bulletsinclip = weaponclipsize(self.weapon);
    self notify("weapon_switch_done");
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d3
// Size: 0x91
function function_316d2ec7583a1e29(note, flagname) {
    if (isdefined(self.fnplaceweaponon)) {
        if (isdefined(self.var_ef50854f0fa381a9)) {
            self [[ self.fnplaceweaponon ]](self.secondaryweapon, self.var_ef50854f0fa381a9);
        } else {
            self [[ self.fnplaceweaponon ]](self.secondaryweapon, "none");
        }
    }
    self.weapon = getpreferredweapon();
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326b
// Size: 0x53
function notetrackguntoright(note, flagname) {
    if (isdefined(self.fnplaceweaponon)) {
        self [[ self.fnplaceweaponon ]](self.weapon, "right");
    }
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c5
// Size: 0x53
function function_12e1635911fd2716(note, flagname) {
    if (isdefined(self.fnplaceweaponon)) {
        self [[ self.fnplaceweaponon ]](self.weapon, "inhand");
    }
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331f
// Size: 0x31
function notetrackhton0(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (!self isinscriptedstate()) {
        self enablestatelookat(1, 0);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3357
// Size: 0x32
function notetrackhton1(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (!self isinscriptedstate()) {
        self enablestatelookat(1, 1);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3390
// Size: 0x2f
function notetrackhtoff(note, flagname) {
    if (!isai(self)) {
        return;
    }
    if (!self isinscriptedstate()) {
        self enablestatelookat(0);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c6
// Size: 0x42
function function_5a8f2c4ba78d7bff(note, flagname) {
    if (isai(self)) {
        self function_e55c33850a5d2fea("request");
        if (utility::issp()) {
            self function_5621e511b99964a7(level.player);
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340f
// Size: 0x30
function function_ab37da002eddaf9f(note, flagname) {
    if (isai(self)) {
        self function_e55c33850a5d2fea("request");
        self function_504a5e2df31069a4();
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3446
// Size: 0x30
function function_b67df3617c4f2903(note, flagname) {
    if (isai(self)) {
        self function_e55c33850a5d2fea("prohibit");
        self setlookatentity();
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347d
// Size: 0x2e
function function_28b89c4ec5292326(note, flagname) {
    if (isai(self)) {
        self asmfireevent(self.asmname, note);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b2
// Size: 0x2f
function function_1777a8463e80f52e(note, flagname) {
    if (isdefined(self.var_9087e842f157d27c)) {
        return [[ self.var_9087e842f157d27c ]](note, flagname);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e8
// Size: 0x1f7
function function_6b6fe2ba8bff11cd(var_bed488ee5acfc2b9) {
    info = strtok(var_bed488ee5acfc2b9, ",", 1);
    model = info[0];
    tag = info[1];
    var_ce33a6c6053578ec = info[2];
    var_14ee0603c207e865 = info[3];
    var_14ee0503c207e632 = info[4];
    var_14ee0403c207e3ff = info[5];
    var_ed521c3c847b0289 = info[6];
    var_8884c57621afac10 = info[7];
    var_832509d239257e56 = info[8];
    if (!isdefined(model)) {
        return [0:undefined, 1:undefined, 2:undefined, 3:undefined, 4:undefined];
    }
    if (isdefined(level.fnnotetrackmodeltranslate)) {
        model = [[ level.fnnotetrackmodeltranslate ]](model);
    }
    if (isdefined(model)) {
        model = function_8d7149eabaa11e1(model);
    }
    if (isdefined(tag)) {
        tag = function_8d7149eabaa11e1(tag);
    }
    var_ee3807ab9a6a9c73 = function_b8ba8f3c8f62ace7(var_ce33a6c6053578ec);
    var_26b9fd069cbbe5da = function_71da05b697e393a1(var_14ee0603c207e865, var_14ee0503c207e632, var_14ee0403c207e3ff);
    var_4cfe7205fd162f00 = function_71da05b697e393a1(var_ed521c3c847b0289, var_8884c57621afac10, var_832509d239257e56);
    if (!isdefined(tag) || tag == "") {
        tag = "";
    } else if (isent(self) && !self tagexists(tag)) {
        /#
            /#
                assertmsg("<unknown string>" + var_bed488ee5acfc2b9 + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>" + tag + "<unknown string>");
            #/
        #/
        return undefined;
    }
    if (!isdefined(model)) {
        /#
            /#
                assertmsg("<unknown string>" + var_bed488ee5acfc2b9 + "<unknown string>" + function_a2eaafb222316a2(self) + "<unknown string>");
            #/
        #/
        return undefined;
    }
    return [0:model, 1:tag, 2:var_ee3807ab9a6a9c73, 3:var_26b9fd069cbbe5da, 4:var_4cfe7205fd162f00];
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e7
// Size: 0xaa
function function_fdb7ea91bda694dc(attachinfo) {
    var_c00a2c6249962d83 = function_6b6fe2ba8bff11cd(attachinfo);
    var_ee3807ab9a6a9c73 = var_c00a2c6249962d83[2];
    tag = var_c00a2c6249962d83[1];
    model = var_c00a2c6249962d83[0];
    if (isdefined(self.var_e2991d2d4b030c75) && isdefined(self.var_e2991d2d4b030c75[tag])) {
        function_bccbbce06002296d(tag);
    }
    if (model != "none" && model != "") {
        self attach(model, tag, 1);
        self.var_e2991d2d4b030c75[tag] = model;
        self.var_da5fb6e1939953ca[tag] = var_ee3807ab9a6a9c73;
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3798
// Size: 0x162
function function_f22b886a2036c871(attachinfo) {
    var_c00a2b6249962b50 = function_6b6fe2ba8bff11cd(attachinfo);
    var_4cfe7205fd162f00 = var_c00a2b6249962b50[4];
    var_1584e0068f21668e = var_c00a2b6249962b50[3];
    var_ee3807ab9a6a9c73 = var_c00a2b6249962b50[2];
    tag = var_c00a2b6249962b50[1];
    model = var_c00a2b6249962b50[0];
    if (isdefined(self.var_42d97b626fd6d9cf) && isdefined(self.var_42d97b626fd6d9cf[tag])) {
        function_ef14ac1aa72b102c(tag);
    }
    spawned = undefined;
    if (model != "none" && model != "") {
        spawned = spawn("script_model", self.origin);
        spawned setmodel(model);
        if (!isdefined(var_1584e0068f21668e)) {
            var_1584e0068f21668e = (0, 0, 0);
        }
        if (!isdefined(var_4cfe7205fd162f00)) {
            var_4cfe7205fd162f00 = (0, 0, 0);
        }
        var_e877a78529e3d72d = tag;
        if (var_e877a78529e3d72d == "") {
            var_e877a78529e3d72d = spawned function_557f8f6e8a4de1af(0);
            if (!self tagexists(var_e877a78529e3d72d)) {
                var_e877a78529e3d72d = self function_557f8f6e8a4de1af(0);
            }
        }
        spawned linkto(self, var_e877a78529e3d72d, var_1584e0068f21668e, var_4cfe7205fd162f00);
        self.var_42d97b626fd6d9cf[tag] = spawned;
        self.var_f97c1baea165488c[tag] = var_ee3807ab9a6a9c73;
        script_func("notetrack_linkmodel_callback", spawned);
    }
    return spawned;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3902
// Size: 0x6d
function function_a06953a984b6a42a(attachinfo) {
    var_c00a2e62499631e9 = function_6b6fe2ba8bff11cd(attachinfo);
    tag = var_c00a2e62499631e9[1];
    model = var_c00a2e62499631e9[0];
    if (isdefined(self.var_e2991d2d4b030c75) && isdefined(self.var_e2991d2d4b030c75[tag])) {
        function_bccbbce06002296d(tag);
    } else {
        self detach(model, tag);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3976
// Size: 0x35
function private function_bccbbce06002296d(tag) {
    self detach(self.var_e2991d2d4b030c75[tag], tag);
    self.var_e2991d2d4b030c75[tag] = undefined;
    self.var_da5fb6e1939953ca[tag] = undefined;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b2
// Size: 0xe3
function function_e5e7e79093ba26ea(attachinfo) {
    var_c00a2d6249962fb6 = function_6b6fe2ba8bff11cd(attachinfo);
    tag = var_c00a2d6249962fb6[1];
    model = var_c00a2d6249962fb6[0];
    if (isdefined(self.var_42d97b626fd6d9cf) && isdefined(self.var_42d97b626fd6d9cf[tag])) {
        function_ef14ac1aa72b102c(tag);
    } else {
        children = self getlinkedchildren();
        foreach (child in children) {
            if (isdefined(child.model) && child.model == model) {
                child delete();
            }
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a9c
// Size: 0x33
function private function_ef14ac1aa72b102c(tag) {
    self.var_42d97b626fd6d9cf[tag] delete();
    self.var_42d97b626fd6d9cf[tag] = undefined;
    self.var_f97c1baea165488c[tag] = undefined;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad6
// Size: 0xa8
function function_45f825a87c104b8e(attachinfo) {
    var_c00a326249963ab5 = function_6b6fe2ba8bff11cd(attachinfo);
    tag = var_c00a326249963ab5[1];
    modelname = var_c00a326249963ab5[0];
    model = spawn("script_model", self gettagorigin(tag));
    model.angles = self gettagangles(tag);
    model setmodel(modelname);
    if (!isdefined(self.var_1fec75f88c15aed8)) {
        self.var_1fec75f88c15aed8 = [];
    }
    self.var_1fec75f88c15aed8[self.var_1fec75f88c15aed8.size] = model;
    function_a06953a984b6a42a(attachinfo);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b85
// Size: 0x93
function function_8ecc4b9e8758773e(info) {
    info = strtok(info, ",");
    tag = info[0];
    index = self.var_1fec75f88c15aed8.size - 1;
    ent = self.var_1fec75f88c15aed8[index];
    self.var_1fec75f88c15aed8[index] = undefined;
    self attach(ent.model, tag, 1);
    self.var_e2991d2d4b030c75[tag] = ent.model;
    ent delete();
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1f
// Size: 0xb8
function function_78157f1bf846e991(var_9d5f59d543dcaaab) {
    if (isdefined(self.var_e2991d2d4b030c75)) {
        tags = getarraykeys(self.var_e2991d2d4b030c75);
        foreach (tag in tags) {
            if (!istrue(var_9d5f59d543dcaaab) || istrue(self.var_da5fb6e1939953ca[tag])) {
                function_bccbbce06002296d(tag);
            }
        }
        if (self.var_e2991d2d4b030c75.size == 0) {
            self.var_e2991d2d4b030c75 = undefined;
            self.var_da5fb6e1939953ca = undefined;
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cde
// Size: 0xb8
function function_b305ad01e100f851(var_9d5f59d543dcaaab) {
    if (isdefined(self.var_42d97b626fd6d9cf)) {
        tags = getarraykeys(self.var_42d97b626fd6d9cf);
        foreach (tag in tags) {
            if (!istrue(var_9d5f59d543dcaaab) || istrue(self.var_f97c1baea165488c[tag])) {
                function_ef14ac1aa72b102c(tag);
            }
        }
        if (self.var_42d97b626fd6d9cf.size == 0) {
            self.var_42d97b626fd6d9cf = undefined;
            self.var_f97c1baea165488c = undefined;
        }
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9d
// Size: 0x1e
function function_580423f29d7d5065(note) {
    function_78157f1bf846e991(1);
    function_b305ad01e100f851(1);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc2
// Size: 0x3d
function function_f74121b03472e19d(var_3e748cf38c614200, var_21e5d264c2eefa94, var_9f075c08a89eab6f) {
    if (isdefined(var_3e748cf38c614200)) {
        fadetoblack(var_3e748cf38c614200);
    }
    if (isdefined(var_21e5d264c2eefa94)) {
        wait(var_21e5d264c2eefa94);
    }
    if (isdefined(var_9f075c08a89eab6f)) {
        function_e680e372d73b3702(var_9f075c08a89eab6f);
    }
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e06
// Size: 0x101
function fadetoblack(fadetime) {
    self notify("do_fade_from_black");
    self notify("do_fade_to_black");
    self endon("do_fade_to_black");
    if (!isdefined(self.var_6eb3b97622fc45cd)) {
        self.var_6eb3b97622fc45cd = newclienthudelem(self);
        self.var_6eb3b97622fc45cd setshader("black", 640, 480);
        self.var_6eb3b97622fc45cd.sort = 1;
        self.var_6eb3b97622fc45cd.horzalign = "fullscreen";
        self.var_6eb3b97622fc45cd.vertalign = "fullscreen";
        self.var_6eb3b97622fc45cd.foreground = 1;
    }
    if (fadetime > 0) {
        self.var_6eb3b97622fc45cd.alpha = 0;
        self.var_6eb3b97622fc45cd fadeovertime(fadetime);
    }
    self.var_6eb3b97622fc45cd.alpha = 1;
    wait(fadetime);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0e
// Size: 0x110
function function_e680e372d73b3702(fadetime) {
    self notify("do_fade_from_black");
    self notify("do_fade_to_black");
    self endon("do_fade_from_black");
    if (!isdefined(self.var_6eb3b97622fc45cd)) {
        self.var_6eb3b97622fc45cd = newclienthudelem(self);
        self.var_6eb3b97622fc45cd setshader("black", 640, 480);
        self.var_6eb3b97622fc45cd.sort = 1;
        self.var_6eb3b97622fc45cd.horzalign = "fullscreen";
        self.var_6eb3b97622fc45cd.vertalign = "fullscreen";
        self.var_6eb3b97622fc45cd.foreground = 1;
    }
    if (fadetime > 0) {
        self.var_6eb3b97622fc45cd.alpha = 1;
        self.var_6eb3b97622fc45cd fadeovertime(fadetime);
    }
    self.var_6eb3b97622fc45cd.alpha = 0;
    wait(fadetime);
    self.var_6eb3b97622fc45cd destroy();
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4025
// Size: 0x50
function function_305541769c1da042(var_30a74e45da3f113d) {
    if (isdefined(var_30a74e45da3f113d)) {
        var_30a74e45da3f113d = function_8d7149eabaa11e1(var_30a74e45da3f113d);
        if (isstartstr(var_30a74e45da3f113d, "undef")) {
            return undefined;
        }
        time = float(var_30a74e45da3f113d);
        var_c848189224d90a0c = utility::function_32fd8e6a43da67b8(time);
        return var_c848189224d90a0c;
    }
    return undefined;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407d
// Size: 0x3e
function function_b8ba8f3c8f62ace7(var_ce33a6c6053578ec) {
    if (isdefined(var_ce33a6c6053578ec)) {
        var_ce33a6c6053578ec = tolower(var_ce33a6c6053578ec);
        if (issubstr(var_ce33a6c6053578ec, "f")) {
            return 0;
        } else if (issubstr(var_ce33a6c6053578ec, "t")) {
            return 1;
        }
    }
    return undefined;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c3
// Size: 0x4e
function function_71da05b697e393a1(var_e789cae7be3cc3c, var_e789dae7be3ce6f, var_e789eae7be3d0a2) {
    if (isdefined(var_e789cae7be3cc3c) && isdefined(var_e789dae7be3ce6f) && isdefined(var_e789eae7be3d0a2)) {
        vector = (float(var_e789cae7be3cc3c), float(var_e789dae7be3ce6f), float(var_e789eae7be3d0a2));
        return vector;
    }
    return undefined;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4119
// Size: 0x5a
function function_8d7149eabaa11e1(string) {
    string = tolower(string);
    var_46f432042b3473d8 = string.size;
    if (isstartstr(string, " ") || isendstr(string, " ")) {
        tokens = strtok(string, " ");
        string = tokens[0];
    }
    return string;
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417b
// Size: 0x1c
function function_6add3fe5d360337b(notetrack, var_c17e3cb80baa6926) {
    return getsubstr(notetrack, var_c17e3cb80baa6926.size);
}

// Namespace notetracks/namespace_a4081f3d58d76916
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x419f
// Size: 0x2c4
function function_1f7bb66025f2aedf() {
    if (!issp()) {
        return;
    }
    waittillframeend();
    if (!isdefined(level.scr_anim)) {
        return;
    }
    var_2076c164305ff2a6[0] = "at_";
    var_2076c164305ff2a6[1] = "linkmodel_";
    var_2076c164305ff2a6[2] = "sm_";
    var_2076c164305ff2a6[3] = "dt_";
    var_2076c164305ff2a6[4] = "unlinkmodel_";
    var_e681aa5d14129651[0] = "rm_";
    var_e681aa5d14129651[1] = "rml_";
    var_e681aa5d14129651[2] = "rms_";
    var_7efcb4fa162fff17 = array_combine(var_2076c164305ff2a6, var_e681aa5d14129651);
    foreach (var_5452e6acec0818e1 in level.scr_anim) {
        foreach (var_b0051352d1332656 in var_5452e6acec0818e1) {
            if (!isarray(var_b0051352d1332656)) {
                var_b0051352d1332656 = [0:var_b0051352d1332656];
            }
            foreach (animation in var_b0051352d1332656) {
                foreach (var_c17e3cb80baa6926 in var_7efcb4fa162fff17) {
                    if (!isanimation(animation)) {
                        continue;
                    }
                    var_56ff212b0ed39c9d = function_c8bcc9dbbf542ce3(animation, var_c17e3cb80baa6926, 1);
                    foreach (result in var_56ff212b0ed39c9d) {
                        if (isstartstr(var_c17e3cb80baa6926, "rm")) {
                            rumble = function_6add3fe5d360337b(result["name"], var_c17e3cb80baa6926);
                            if (isdefined(rumble)) {
                                precacherumble(rumble);
                            }
                        } else {
                            var_cfe35eb9f14957a0 = getsubstr(result["name"], var_c17e3cb80baa6926.size);
                            var_bffcb26249870cb0 = function_6b6fe2ba8bff11cd(var_cfe35eb9f14957a0);
                            tag = var_bffcb26249870cb0[1];
                            model = var_bffcb26249870cb0[0];
                            if (isdefined(model)) {
                                if (model != "all") {
                                    precachemodel(model);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

