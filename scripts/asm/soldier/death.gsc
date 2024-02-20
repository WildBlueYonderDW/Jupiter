// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_159f253f9bd2314e;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_3433ee6b63c7e243;
#using scripts\asm\soldier\patrol.gsc;
#using scripts\anim\notetracks.gsc;
#using scripts\asm\soldier\death.gsc;
#using scripts\asm\soldier\pain.gsc;
#using scripts\engine\trace.gsc;
#using scripts\anim\face.gsc;

#namespace death;

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x68
function deathlmgcleanup() {
    if (!isdefined(self._blackboard.leftweaponent)) {
        return;
    }
    var_7bc1c35c0ab292c2 = self._blackboard.leftweaponent;
    var_7bc1c35c0ab292c2 delete();
    self._blackboard.leftweaponent = undefined;
    namespace_223959d3e5206cfb::forceuseweapon(self.primaryweapon, "primary");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5b
// Size: 0x890
function playdeathanim(asmname, statename, params) {
    stop_sounds();
    self stoplookat();
    if (isdefined(self.fnlaseroff)) {
        self [[ self.fnlaseroff ]]();
    }
    if (isdefined(self.fnasm_clearfingerposes)) {
        self [[ self.fnasm_clearfingerposes ]]();
    }
    if (isdefined(self.fnachievements)) {
        self thread [[ self.fnachievements ]]();
    }
    removeselffrom_squadlastseenenemypos(self.origin);
    if (isdefined(self.scriptedarrivalent)) {
        self.scriptedarrivalent delete();
    }
    function_9912fb866ada47d7(function_5a05c362af7e301b() - 1);
    function_e004a29f97015c17(function_d3d3f12a9fd105eb() - 1);
    deathlmgcleanup();
    self.disabledeathorient = !(self.a.nodeath || istrue(self.noragdoll));
    if (self.a.nodeath) {
        deathcleanup();
        return;
    }
    var_ab1c9a379f19d469 = utility::wasdamagedbyexplosive();
    if (shouldhelmetpopondeath(var_ab1c9a379f19d469)) {
        helmetpop();
    }
    if (shouldheadpop(var_ab1c9a379f19d469)) {
        headpop();
    }
    if (!isdefined(self.skipdeathanim)) {
        self aiclearanim(asm_getroot(), 0.3);
    }
    playdeathsound(var_ab1c9a379f19d469);
    if (isdefined(self.asm.deathfunc)) {
        self [[ self.asm.deathfunc ]]();
        if (!isdefined(self.deathfunction)) {
            deathcleanup();
            return;
        }
    }
    if (isdefined(self.deathfunction)) {
        result = self [[ self.deathfunction ]]();
        if (!isdefined(result)) {
            result = 1;
        }
        if (result) {
            deathcleanup();
            return;
        }
    }
    if (isdefined(self.ragdoll_immediate) || self.forceragdollimmediate) {
        if (isagent(self)) {
            if (istrue(self.bhasriotshieldattached)) {
                detachriotshield();
            }
            namespace_223959d3e5206cfb::dropallaiweapons();
            return;
        }
        if (isdefined(self.doantigravgrenaderagdoll) && self.doantigravgrenaderagdoll) {
            self animmode("noclip");
        } else if (istrue(self.nogravityragdoll)) {
            self animmode("nogravity");
        } else {
            self animmode("gravity");
        }
        doimmediateragdolldeath();
        if (!isdefined(self)) {
            return;
        }
    }
    self endon("entitydeleted");
    if (shouldgib() && !self isragdoll()) {
        if (istrue(self.bhasriotshieldattached)) {
            detachriotshield();
        }
        namespace_223959d3e5206cfb::dropallaiweapons();
        dogib();
        if (isagent(self)) {
            self.nocorpse = 1;
        } else {
            self hide();
            if (!isagent(self)) {
                wait(0.1);
            }
        }
        if (isdefined(self)) {
            deathcleanup();
            if (!isagent(self)) {
                self delete();
            }
        }
        return;
    }
    if (isdefined(self.deathbysuffocation) && !isdefined(self.deathanim)) {
        set_deathanim(getsuffocationdeathanim());
    }
    var_41154210564d7c9c = undefined;
    deathanim = undefined;
    var_60ce35ef4ea0ccaa = undefined;
    /#
        assertex(isdefined(self.deathalias) && isdefined(self.deathstate) || !isdefined(self.deathalias) && !isdefined(self.deathstate), ".deathAlias and .deathState must both be defined, or neither defined");
    #/
    var_4d3cebad4e3e8617 = isdefined(self.deathalias) && isdefined(self.deathstate);
    if (!isdefined(self.skipdeathanim) || istrue(self.var_aa0214e1292a7b3)) {
        var_41154210564d7c9c = function_ea379d7359bd10ae(asmname, statename, params);
        /#
            assert(isdefined(var_41154210564d7c9c) && var_41154210564d7c9c.size == 2);
        #/
        deathanim = var_41154210564d7c9c[0];
        var_60ce35ef4ea0ccaa = var_41154210564d7c9c[1];
        if (!animhasnotetrack(var_60ce35ef4ea0ccaa, "dropgun") && !animhasnotetrack(var_60ce35ef4ea0ccaa, "fire_spray")) {
            namespace_223959d3e5206cfb::dropallaiweapons();
        }
        if (animhasnotetrack(var_60ce35ef4ea0ccaa, "dropgun")) {
            self._blackboard.awaitingdropgunnotetrack = 1;
        }
        if (istrue(self.bhasriotshieldattached)) {
            detachriotshield();
        }
        if (isdefined(self.var_1bab8712529eb3c2) && self.var_1bab8712529eb3c2) {
            namespace_58609e68adef6b3d::detachflashlight();
        }
        handleburningtodeath(var_60ce35ef4ea0ccaa);
        self.deathanimduration = int(getanimlength(var_60ce35ef4ea0ccaa) * 1000);
        directional_orient = isdefined(params) && params == "directional_orient";
        if (istrue(self.disabledeathdirectionalorient)) {
            directional_orient = 0;
        }
        orientmeleevictim(directional_orient);
        if (isnumber(deathanim)) {
            if (var_4d3cebad4e3e8617) {
                self aisetanim(self.deathstate, deathanim);
            } else {
                self aisetanim(statename, deathanim);
            }
        } else {
            /#
                assertex(utility::issp(), "Custom death anim only supported in SP.");
            #/
            var_d5c987658103bffd = asm_getinnerrootknob();
            self clearanim(var_d5c987658103bffd, 0.05);
            self setflaggedanimknoballrestart(statename, deathanim, var_d5c987658103bffd, 1, 0.05);
        }
        if (var_4d3cebad4e3e8617) {
            asm_playfacialanim(asmname, self.deathstate, var_60ce35ef4ea0ccaa);
        } else {
            asm_playfacialanim(asmname, statename, var_60ce35ef4ea0ccaa);
        }
    }
    if (isdefined(self.deathanimmode)) {
        self animmode(self.deathanimmode);
    }
    if (isdefined(self.skipdeathanim)) {
        /#
            assertex(self.skipdeathanim, "self.skipDeathAnim must be either true or undefined.");
        #/
        if (!isdefined(self.noragdoll)) {
            if (isdefined(self.fnpreragdoll)) {
                self [[ self.fnpreragdoll ]]();
            }
            if (!isdefined(self)) {
                return;
            }
            if (istrue(self.bhasriotshieldattached)) {
                detachriotshield();
            }
            namespace_223959d3e5206cfb::dropallaiweapons();
            if (istrue(self.nogravityragdoll)) {
                self animmode("nogravity");
            }
            self startragdoll();
        }
        if (!isagent(self)) {
            wait(0.05);
            if (!isdefined(self)) {
                return;
            }
            self animmode("gravity");
        }
    } else if (isdefined(self.ragdolltime)) {
        thread waitforragdoll(self.ragdolltime);
    } else if (getdvarint(@"hash_8c30a87f78a7d97e") == 1) {
        thread startragdollwithoutwait();
    } else {
        if (!isdefined(var_41154210564d7c9c)) {
            var_41154210564d7c9c = function_ea379d7359bd10ae(asmname, statename, params);
        }
        /#
            assert(isdefined(var_41154210564d7c9c) && var_41154210564d7c9c.size == 2);
        #/
        deathanim = var_41154210564d7c9c[0];
        var_60ce35ef4ea0ccaa = var_41154210564d7c9c[1];
        var_689ef6000ed3e5fc = getnotetracktimes(var_60ce35ef4ea0ccaa, "start_ragdoll");
        var_73afa09bae81352a = !var_4d3cebad4e3e8617 && !isdefined(self.deathanim) && (var_689ef6000ed3e5fc.size == 0 || var_689ef6000ed3e5fc[0] > 0.5);
        if (var_73afa09bae81352a) {
            if (self.damagemod == "MOD_MELEE") {
                var_22356424bd0219b4 = 0.7;
            } else {
                var_22356424bd0219b4 = 0.35;
            }
            thread waitforragdoll(getanimlength(var_60ce35ef4ea0ccaa) * var_22356424bd0219b4);
        }
    }
    /#
        if (getdvar(@"hash_27494f1d75fc0809") == "j_hip_proc_le") {
            if (animhasnotetrack(var_60ce35ef4ea0ccaa, "j_spine4")) {
                return;
            }
            if (animhasnotetrack(var_60ce35ef4ea0ccaa, "iw7_knife_upgrade1")) {
                return;
            }
            println("_both", var_60ce35ef4ea0ccaa, "crouch_back");
            iprintlnbold("none");
        }
    #/
    if (!isagent(self) && !isdefined(self.skipdeathanim)) {
        thread playdeathfx();
    }
    self endon("terminate_death_thread");
    if (!isagent(self)) {
        if (isdefined(self.skipdeathanim) && !istrue(self.var_aa0214e1292a7b3)) {
            wait(0.05);
        } else {
            var_ed309e19b5083d1 = statename;
            if (var_4d3cebad4e3e8617) {
                var_ed309e19b5083d1 = self.deathstate;
            }
            asm_donotetracks(asmname, var_ed309e19b5083d1, &deathnotetrackhandler);
        }
    }
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.bhasriotshieldattached)) {
        detachriotshield();
    }
    namespace_223959d3e5206cfb::dropallaiweapons();
    self notify("endPlayDeathAnim");
    if (!isagent(self)) {
        if (isdefined(self.ragdoll_immediate) || self.forceragdollimmediate) {
            wait(0.5);
            if (!isdefined(self)) {
                return;
            }
            self aisetanimrate(asm_getroot(), 0);
        }
    }
    deathcleanup();
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x52
function deathnotetrackhandler(note) {
    if (self.burningtodeath) {
        switch (note) {
        case #"hash_9af1375f4b1b97b8":
            handleburndeathmodelswap();
        case #"hash_251b15537436bbcd":
            thread handleburndeathvfx();
            return;
        }
    }
    namespace_a4081f3d58d76916::notetrack_prefix_handler(note);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134b
// Size: 0x17d
function handleburningtodeath(var_60ce35ef4ea0ccaa) {
    if (isscriptedagent(self) && !isnullweapon(self.damageweapon) && self.unittype != "juggernaut" && utility::shouldburnfromdamage(self.damageweapon)) {
        self.burningtodeath = 1;
        thread handleburndeathvfx();
        return;
    }
    if (isscriptedagent(self) && self.unittype == "juggernaut") {
        return;
    }
    if (!self.burningtodeath) {
        return;
    }
    if (isscriptedagent(self)) {
        /#
            weaponname = "<unknown string>";
            if (!isnullweapon(self.damageweapon)) {
                weaponname = self.damageweapon.basename;
            }
            /#
                assertmsg("<unknown string>" + weaponname);
            #/
        #/
        return;
    }
    if (self.unittype != "dog" && (!isdefined(var_60ce35ef4ea0ccaa) || !animhasnotetrack(var_60ce35ef4ea0ccaa, "model_swap"))) {
        if (isdefined(self.headmodel)) {
            self detach(self.headmodel);
            self.headmodel = undefined;
        }
        if (isdefined(self.hatmodel)) {
            self detach(self.hatmodel);
            self.hatmodel = undefined;
        }
        self setmodel("burntbody_male");
        if (!isdefined(var_60ce35ef4ea0ccaa) || !animhasnotetrack(var_60ce35ef4ea0ccaa, "burn_vfx_death_start")) {
            thread handleburndeathvfx();
        }
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cf
// Size: 0x5d
function handleburndeathmodelswap() {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
        self.headmodel = undefined;
    }
    if (isdefined(self.hatmodel)) {
        self detach(self.hatmodel);
        self.hatmodel = undefined;
    }
    self setmodel("burntbody_male");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1533
// Size: 0xe5
function handleburndeathvfx() {
    self endon("stop_burn_VFX");
    self endon("entitydeleted");
    var_32561454d6dff5f7 = 1;
    if (self isscriptable()) {
        currentstate = self getscriptablepartstate("burn_to_death_by_molotov", 1);
        if (isdefined(currentstate)) {
            self setscriptablepartstate("burn_to_death_by_molotov", "active");
            var_32561454d6dff5f7 = 0;
        }
    }
    if (var_32561454d6dff5f7) {
        var_379506d5f8ebe669 = getburnvfxtagpackets();
        foreach (var_bd804c4d30dbc230 in var_379506d5f8ebe669) {
            if (!isdefined(self)) {
                return;
            }
            playfxontag(level.g_effect[var_bd804c4d30dbc230.burnvfx], self, var_bd804c4d30dbc230.tag);
            wait(0.05);
        }
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161f
// Size: 0xe2
function getburnvfxtagpackets() {
    var_bd804c4d30dbc230 = [];
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_knee_ri", "vfx_burn_sml_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_knee_le", "vfx_burn_sml_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_hip_proc_ri", "vfx_burn_med_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_hip_proc_le", "vfx_burn_med_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_spinelower", "vfx_burn_med_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_spine4", "vfx_burn_lrg_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_elbow_ri", "vfx_burn_sml_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_elbow_le", "vfx_burn_sml_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_shoulder_ri", "vfx_burn_med_high");
    var_bd804c4d30dbc230[var_bd804c4d30dbc230.size] = createburnvfxpacket("j_shoulder_le", "vfx_burn_med_high");
    return var_bd804c4d30dbc230;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1709
// Size: 0x47
function createburnvfxpacket(tag, burnvfx, var_e941d82a2ee0d75f) {
    var_ad98e6d70679846d = spawnstruct();
    var_ad98e6d70679846d.tag = tag;
    var_ad98e6d70679846d.burnvfx = burnvfx;
    return var_ad98e6d70679846d;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1758
// Size: 0x9c
function detachriotshield(var_350e6177ac9228d0) {
    /#
        assert(istrue(self.bhasriotshieldattached));
    #/
    if (function_b6ac2ca2ce25f58()) {
        dropriotshield();
    }
    if (utility::issp()) {
        self detach(self.riotshieldmodel, self.riotshieldmodeltag);
    } else {
        self detachshieldmodel(self.riotshieldmodel, self.riotshieldmodeltag);
        if (istrue(var_350e6177ac9228d0) && !istrue(isagent(self) && istrue(level.var_e97d3de5b99775a6))) {
            function_351311c324d67693();
        }
    }
    self.bhasriotshieldattached = undefined;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fb
// Size: 0x14
function function_b6ac2ca2ce25f58() {
    if (istrue(self.var_b6ac2ca2ce25f58)) {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1817
// Size: 0x8e
function dropriotshield() {
    var_9ccc24389a9eddee = self gettagorigin(self.riotshieldmodeltag);
    var_3e3f178f45c14044 = self gettagangles(self.riotshieldmodeltag);
    shield = spawn("script_model", var_9ccc24389a9eddee);
    shield.angles = var_3e3f178f45c14044;
    shield setmodel(self.riotshieldmodel);
    shield physicslaunchserver(var_9ccc24389a9eddee, anglestoforward(self.angles) * 5);
    shield thread function_99a6b622f75d372d(10);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ac
// Size: 0x6c
function function_351311c324d67693() {
    var_9ccc24389a9eddee = self gettagorigin(self.riotshieldmodeltag);
    var_3e3f178f45c14044 = self gettagangles(self.riotshieldmodeltag);
    var_ceab9b1d397ec45 = "iw9_me_riotshield_mp";
    shield = spawn("weapon_" + var_ceab9b1d397ec45, var_9ccc24389a9eddee);
    shield.angles = var_3e3f178f45c14044;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191f
// Size: 0x1c
function function_99a6b622f75d372d(time) {
    self endon("death");
    wait(time);
    self delete();
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1942
// Size: 0x109
function c8deathsound(c8, notetrack) {
    prefix = getsubstr(notetrack, 0, 3);
    if (prefix == "vo_") {
        alias = getsubstr(notetrack, 3);
        c8 [[ anim.callbacks["PlaySoundAtViewHeight"] ]](alias);
        return;
    }
    if (prefix != "ps_") {
        return;
    }
    alias = getsubstr(notetrack, 3);
    if (!isdefined(c8.deathsoundent)) {
        c8.deathsoundent = spawn("script_origin", c8.origin);
        c8.deathsoundent linkto(c8, "");
    }
    ent = c8.deathsoundent;
    ent notify("stop_C8DeathSound");
    ent endon("stop_C8DeathSound");
    ent playsound(alias);
    time = lookupsoundlength(alias);
    wait(time * 0.001 + 0.1);
    ent delete();
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a52
// Size: 0x135
function playexplosivedeathanim(asmname, statename, params) {
    if ((utility::isdamageweapon(makeweapon("iw7_knife_upgrade1")) || utility::wasdamagedbyoffhandshield() || utility::isdamageweapon(makeweapon("iw7_sonic"))) && isdefined(self.attacker)) {
        var_85e28f54b572f39f = vectortoyaw(self.attacker.origin - self.origin);
        if (self.damageyaw > 135 || self.damageyaw <= -135) {
            self orientmode("face angle", var_85e28f54b572f39f);
        } else if (self.damageyaw > 45 && self.damageyaw <= 135) {
            self orientmode("face angle", var_85e28f54b572f39f + 90);
        } else if (self.damageyaw > -45 && self.damageyaw <= 45) {
            self orientmode("face angle", var_85e28f54b572f39f - 180);
        } else {
            self orientmode("face angle", var_85e28f54b572f39f - 90);
        }
    }
    playdeathanim(asmname, statename, params);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8e
// Size: 0x69
function playbalconydeathanim(asmname, statename, params) {
    function_2afce3c4640b03c9(gettime() + randomintrange(25000, 35000));
    self orientmode("face angle", self._blackboard.balconydeathnode.angles[1]);
    playdeathanim(asmname, statename, params);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfe
// Size: 0xb8
function playdeathanim_melee_ragdolldelayed(asmname, statename, params) {
    var_2e6c636f8e86eff0 = isagent(self);
    if (!var_2e6c636f8e86eff0) {
        if (isdefined(self.meleestatename)) {
            time = params;
            if (!isdefined(time)) {
                time = 10;
            }
            asm_donotetrackswithtimeout(asmname, self.meleestatename, time);
        }
    }
    namespace_223959d3e5206cfb::dropallaiweapons();
    if (istrue(self.bhasriotshieldattached)) {
        namespace_f0a0c13f724da4b::detachriotshield();
    }
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (!isdefined(self)) {
        return;
    }
    if (!var_2e6c636f8e86eff0) {
        self startragdoll();
        wait(0.1);
    }
    deathcleanup();
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1cbd
// Size: 0x30
function chooseshockdeathanim(asmname, statename, var_f2b19b25d457c2a6, params) {
    return asm_lookupanimfromalias(statename, "standing");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf5
// Size: 0x38
function shouldplayshockdeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isshocked() || isdefined(self.shockdeath);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d35
// Size: 0x5f
function shouldplayexplosivedeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (self.unittype == "juggernaut") {
        return 0;
    }
    if (istrue(self.forceexplosivedeath)) {
        self.forceexplosivedeath = 0;
        return 1;
    }
    if (utility::wasdamagedbyexplosive()) {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9c
// Size: 0x87
function function_a9ab7e592a976b98(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (istrue(self.var_774a6020b81b9c70)) {
        self.var_774a6020b81b9c70 = 0;
        return 1;
    }
    if (isdefined(self.damagemod) && self.damagemod == "MOD_IMPACT") {
        if (isdefined(self.attacker) && istrue(self.attacker.var_128e748fcc0a6687)) {
            return 1;
        }
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2b
// Size: 0x77
function function_bd0988db0fd373a1(asmname, statename, params) {
    deathalias = "train";
    if (self.currentpose == "stand") {
        deathalias = deathalias + "_stand";
    } else if (self.currentpose == "crouch") {
        deathalias = deathalias + "_crouch";
    }
    deathalias = deathalias + namespace_7eac13b458714f13::getpaindirectiontoactor();
    return asm_lookupanimfromalias(statename, deathalias);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1eaa
// Size: 0x55
function function_d111a9b9015e2baa(asmname, statename, params) {
    self.nodrop = 1;
    self.nocorpse = 1;
    self.noragdoll = 1;
    self.deathanimmode = "noclip";
    playdeathanim(asmname, statename, params);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f06
// Size: 0x74
function shouldplayplayermeleedeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self.damagemod) && isalive(self.attacker)) {
        if (!isplayer(self.attacker)) {
            return 0;
        }
        if (utility::getdamagetype(self.damagemod) != "melee") {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f82
// Size: 0x14d
function shouldplaybalconydeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (self.currentpose == "prone") {
        return 0;
    }
    if (!self.burningtodeath && utility::wasdamagedbyexplosive()) {
        return 0;
    }
    if (gettime() < function_75391f72c52786a5() && !istrue(self.forcebalconydeath)) {
        return 0;
    }
    node = undefined;
    if (isdefined(self.covernode)) {
        node = self.covernode;
    } else if (isdefined(self._blackboard.lastusednode)) {
        node = self._blackboard.lastusednode;
    }
    if (!isdefined(node) || !isdefined(node.script_balcony)) {
        return 0;
    }
    if (abs(angleclamp180(node.angles[1] - self.angles[1])) > 30) {
        return 0;
    }
    if (isdefined(self.script_chance)) {
        if (randomfloat(1) > self.script_chance) {
            return 0;
        }
    }
    if (self nearnode(node)) {
        self._blackboard.balconydeathnode = node;
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x20d7
// Size: 0x44
function shouldplaybalconyraildeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    return self._blackboard.balconydeathnode.script_balcony == 1;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2123
// Size: 0x34
function choosebalconydeathanim(asmname, statename, var_f2b19b25d457c2a6, params) {
    return asm_lookupanimfromalias(statename, self.currentpose);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x215f
// Size: 0x169
function shouldplaystrongdamagedeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    objweapon = self.damageweapon;
    if (!isdefined(objweapon) || isnullweapon(objweapon)) {
        return 0;
    }
    if (namespace_3c37cb17ade254d::doinglongdeath()) {
        return 0;
    }
    if (self.currentpose == "prone" || isdefined(self.a.onback)) {
        return 0;
    }
    if (self.damagemod == "MOD_MELEE") {
        return 0;
    }
    if (abs(self.damageyaw) < 45) {
        return 0;
    }
    if (self.damagetaken > 500) {
        return 1;
    }
    if (self.a.movement == "run" && !isattackerwithindist(self.attacker, 275)) {
        if (randomint(100) < 65) {
            return 0;
        }
    }
    if (issniperrifle(objweapon) && self.maxhealth < self.damagetaken) {
        return 1;
    }
    if (isshotgun(objweapon) && isattackerwithindist(self.attacker, 512)) {
        return 1;
    }
    if (objweapon.basename == "iw7_devastator" && utility::isweaponepic(objweapon)) {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d0
// Size: 0x11f
function c6_scriptablecleanup() {
    if (!isdefined(self)) {
        return;
    }
    self.bt.disabledismemberbehaviors = 1;
    if (isdefined(self.asm.bpreragdolled)) {
        return;
    }
    self.asm.bpreragdolled = 1;
    self.scriptablecleanup = 1;
    if (!isdefined(self._blackboard.scriptableparts)) {
        return;
    }
    foreach (partname, part in self._blackboard.scriptableparts) {
        state = part.state;
        if (state == "normal") {
            continue;
        }
        if (issubstr(state, "_both")) {
            state = "dmg_both";
        }
        self setscriptablepartstate(partname, state + "_stopfx");
    }
    self setscriptablepartstate("torso_overload_fx", "normal");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f6
// Size: 0xed
function c8_scriptablecleanup() {
    self.bt.disabledismemberbehaviors = 1;
    if (isdefined(self.asm.bpreragdolled)) {
        return;
    }
    self.asm.bpreragdolled = 1;
    self.scriptablecleanup = 1;
    if (!isdefined(self._blackboard.scriptableparts)) {
        return;
    }
    foreach (partname, part in self._blackboard.scriptableparts) {
        if (issubstr(partname, "dmg_fx")) {
            self setscriptablepartstate(partname, "stopfx");
        }
    }
    self setscriptablepartstate("torso_overload_fx", "normal");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24ea
// Size: 0x6c
function choosemovingdeathanim(asmname, statename, params) {
    curspeed = length(self.velocity);
    archetype = self getbasearchetype();
    var_c7eeabfb94518b4d = getnearestspeedthresholdname(archetype, curspeed);
    var_cd86e6c9b1afd8cf = [];
    return asm_lookupanimfromalias(statename, var_c7eeabfb94518b4d);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x257c
// Size: 0x77
function choosecrouchingdeathanim(asmname, statename, params) {
    if (damagelocationisany("head", "neck")) {
        return asm_lookupanimfromalias(statename, "head");
    }
    if (damagelocationisany("torso_upper", "torso_lower", "left_arm_upper", "right_arm_upper", "neck")) {
        return asm_lookupanimfromalias(statename, "torso");
    }
    return asm_lookupanimfromalias(statename, "default");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25fb
// Size: 0x1ab
function choosecoverdeathanim(asmname, statename, params) {
    /#
        assertex(isdefined(params), "Cover type not passed as param to state " + statename);
    #/
    switch (params) {
    case #"hash_f1676baca0ae608b":
        return asm_lookupanimfromalias(statename, "stand");
    case #"hash_a315be2e1164ff6b":
        return asm_lookupanimfromalias(statename, "exposed");
    case #"hash_9d76c99eddd14433":
        if (damagelocationisany("head", "neck") && (self.damageyaw > 135 || self.damageyaw <= -45)) {
            return asm_lookupanimfromalias(statename, "crouch_head");
        }
        if (self.damageyaw > -45 && self.damageyaw <= 45) {
            return asm_lookupanimfromalias(statename, "crouch_back");
        }
        return asm_lookupanimfromalias(statename, "crouch_default");
    case #"hash_175771022bc5e75d":
        if (self.currentpose == "stand") {
            return asm_lookupanimfromalias(statename, "right_stand");
            goto LOC_00000114;
        }
        if (damagelocationisany("head", "neck")) {
            return asm_lookupanimfromalias(statename, "right_crouch_head");
        }
        return asm_lookupanimfromalias(statename, "right_crouch_default");
    case #"hash_4ddb655e251e06c8":
    LOC_00000114:
        if (self.currentpose == "stand") {
            return asm_lookupanimfromalias(statename, "left_stand");
            goto LOC_00000143;
        }
        return asm_lookupanimfromalias(statename, "left_crouch");
    case #"hash_307cdefbc9ff53fa":
    LOC_00000143:
        return asm_lookupanimfromalias(statename, "3d");
        break;
    }
    /#
        assertmsg("invalid cover type passed to asm death function.");
    #/
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27ad
// Size: 0x232
function choosestandingdeathanim(asmname, statename, params) {
    if (isusingsidearm()) {
        return choosestandingpistoldeathanim(asmname, statename, params);
    }
    if (isdefined(self.attacker) && self shouldplaymeleedeathanim(self.attacker)) {
        return choosestandingmeleedeathanim(asmname, statename, params);
    }
    deathanims = [];
    if (damagelocationisany("torso_lower", "left_leg_upper", "left_leg_lower", "right_leg_lower", "right_leg_lower")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "lower_body");
    } else if (damagelocationisany("head", "helmet")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "head");
    } else if (damagelocationisany("neck")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "neck");
    } else if (damagelocationisany("torso_upper", "left_arm_upper")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "left_shoulder");
    }
    if (damagelocationisany("torso_upper")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "torso_upper");
    }
    if (self.damageyaw > 135 || self.damageyaw <= -135) {
        if (damagelocationisany("neck", "head", "helmet")) {
            deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "torso_2");
        }
        if (damagelocationisany("torso_upper")) {
            deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "torso_2");
        }
    } else if (self.damageyaw > -45 && self.damageyaw <= 45) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "back");
    }
    var_d623bc8479f9f4a4 = deathanims.size > 0;
    if (!var_d623bc8479f9f4a4 || randomint(100) < 15) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "default");
    }
    if (randomint(100) < 10 && firingdeathallowed()) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "default_firing");
    }
    /#
        assert(deathanims.size > 0);
    #/
    return deathanims[randomint(deathanims.size)];
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29e7
// Size: 0x227
function chooseexplosivedeathanim(asmname, statename, params) {
    var_c81a61ae7e6e7025 = 0;
    objweapon = self.damageweapon;
    if (!isnullweapon(objweapon) && self.unittype != "juggernaut" && utility::shouldburnfromdamage(objweapon)) {
        if (asm_hasalias(statename, "molotov_f")) {
            var_c81a61ae7e6e7025 = 1;
        }
    }
    deathalias = undefined;
    if (var_c81a61ae7e6e7025 && self.currentpose == "prone") {
        deathalias = "molotov_prone";
    } else {
        deathalias = "explosive";
        if (var_c81a61ae7e6e7025) {
            deathalias = "molotov";
        }
        if (self.currentpose == "crouch") {
            deathalias = deathalias + "_crouch";
        } else if (self.currentpose == "prone") {
            deathalias = deathalias + "_prone";
        }
        deathalias = deathalias + namespace_7eac13b458714f13::getpaindirectiontoactor();
    }
    deathanim = asm_lookupanimfromalias(statename, deathalias);
    if (var_c81a61ae7e6e7025) {
        deathanim = preventrecentanimindex(self, statename, deathalias, deathanim);
    }
    var_60ce35ef4ea0ccaa = asm_getxanim(statename, deathanim);
    if (getdvar(@"hash_f53ba58df3983a20", "on") == "on") {
        t = 1;
        var_689ef6000ed3e5fc = getnotetracktimes(var_60ce35ef4ea0ccaa, "start_ragdoll");
        if (var_689ef6000ed3e5fc.size > 0) {
            t = var_689ef6000ed3e5fc[0];
        }
        localdeltavector = getmovedelta(var_60ce35ef4ea0ccaa, 0, t);
        endpoint = self localtoworldcoords(localdeltavector);
        var_63a8dcf3642cfe17 = 0;
        if (actor_is3d()) {
            var_63a8dcf3642cfe17 = navtrace3d(self.origin, endpoint, 0);
        } else {
            var_63a8dcf3642cfe17 = self maymovefrompointtopoint(self.origin, endpoint, 0, 1);
        }
        if (!var_63a8dcf3642cfe17) {
            if (var_c81a61ae7e6e7025) {
                deathanim = asm_lookupanimfromalias(statename, "default_molotov");
            } else {
                deathanim = asm_lookupanimfromalias(statename, "default");
            }
        }
    }
    self.deathanimmode = "nogravity";
    return deathanim;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c16
// Size: 0x151
function choosestandingpistoldeathanim(asmname, statename, params) {
    if (abs(self.damageyaw) < 50) {
        return asm_lookupanimfromalias(statename, "pistol_2");
    }
    deathanims = [];
    if (abs(self.damageyaw) < 110) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "pistol_2");
    }
    if (damagelocationisany("torso_upper", "torso_lower", "left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "pistol_torso_upper");
    }
    if (!damagelocationisany("head", "neck", "helmet", "left_foot", "right_foot", "left_hand", "right_hand", "gun") && randomint(2) == 0) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "pistol_upper_body");
    }
    if (deathanims.size == 0 || damagelocationisany("torso_lower", "torso_upper", "neck", "head", "helmet", "right_arm_upper", "left_arm_upper")) {
        deathanims[deathanims.size] = asm_lookupanimfromalias(statename, "pistol_default");
    }
    /#
        assert(deathanims.size > 0);
    #/
    return deathanims[randomint(deathanims.size)];
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6f
// Size: 0x28
function choosestandingmeleedeathanim(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, "default");
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9f
// Size: 0x4
function firingdeathallowed() {
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dab
// Size: 0x47
function playdeathfx() {
    self endon("killanimscript");
    if (self.stairsstate != "none") {
        return;
    }
    wait(2);
    if (isdefined(self.noragdoll) && self.damagemod != "MOD_MELEE") {
        play_blood_pool();
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df9
// Size: 0x10c
function play_blood_pool(note, flagname) {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.skipbloodpool)) {
        /#
            assertex(self.skipbloodpool, "Setting must be either true or undefined");
        #/
        return;
    }
    tagpos = self gettagorigin("j_SpineUpper");
    tagangles = self gettagangles("j_SpineUpper");
    forward = anglestoforward(tagangles);
    up = anglestoup(tagangles);
    right = anglestoright(tagangles);
    tagpos = tagpos + forward * -8.5 + up * 5 + right * 0;
    trace = namespace_2a184fc4902783dc::_bullet_trace(tagpos + (0, 0, 30), tagpos - (0, 0, 100), 0, undefined);
    if (trace["normal"][2] > 0.9) {
        playfx(level._effect["deathfx_bloodpool_generic"], tagpos);
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f0c
// Size: 0xf5
function shouldhelmetpoponpain(var_ab1c9a379f19d469) {
    if (!istrue(self.shouldhelmetpop)) {
        return 0;
    }
    if (isdefined(self.lastattacker) && isdefined(self.lastattacker.team) && isdefined(self.team) && self.lastattacker.team == self.team) {
        return 0;
    }
    if (isdefined(self.helmetsubpart) && !var_ab1c9a379f19d469) {
        return 0;
    }
    if (isdefined(self.onlyhelmetpopondeath) && self.onlyhelmetpopondeath) {
        return 0;
    }
    if (isdefined(self.magic_bullet_shield) && self.magic_bullet_shield) {
        return 0;
    }
    if (isdefined(self.damagelocation) && self.damagelocation == "helmet") {
        return 1;
    }
    if (var_ab1c9a379f19d469 && randomint(2) == 0) {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3009
// Size: 0xaf
function shouldhelmetpopondeath(var_ab1c9a379f19d469) {
    if (!istrue(self.shouldhelmetpop)) {
        return 0;
    }
    if (self.unittype != "soldier" && self.unittype != "juggernaut") {
        return 0;
    }
    if (self.damagemod == "MOD_MELEE" && randomint(3) < 2) {
        return 0;
    }
    if (isdefined(self.damagelocation) && (self.damagelocation == "helmet" || self.damagelocation == "head")) {
        return 1;
    }
    if (var_ab1c9a379f19d469 && randomint(3) == 0) {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c0
// Size: 0x252
function helmetpop() {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.hatmodel)) {
        return;
    }
    if (isdefined(self.dontbreakhelmet) && self.dontbreakhelmet) {
        return;
    }
    pos = self gettagorigin("j_head");
    if (isdefined(self.helmetshatterfx)) {
        forward = anglestoforward(self gettagangles("j_head"));
        playfx(self.helmetshatterfx, pos, forward);
    }
    playsoundatpos(pos, "prj_bullet_small_flesh_helmet_npc");
    if (isdefined(self.helmetsubpart)) {
        self.helmetsubpart = undefined;
        damage = self getdamageparthealth("helmet", "helmet");
        if (damage > 0) {
            self damagedamagepart(damage, "helmet", "helmet");
        }
    }
    partname = getpartname(self.hatmodel, 0);
    model = spawn("script_model", self.origin + (0, 0, 64));
    model setmodel(self.hatmodel);
    model.origin = self gettagorigin(partname);
    model.angles = self gettagangles(partname);
    waitframe();
    if (isdefined(self.damagedir) && self.damagedir != (0, 0, 0)) {
        model thread helmetlaunch(self.damagedir);
    } else {
        model thread helmetlaunch((randomfloatrange(-0.25, 0.25), randomfloatrange(-0.25, 0.25), randomfloatrange(-1, 1)));
    }
    self detach(self.hatmodel, "");
    self.hatmodel = undefined;
    self hidepartandchildren_allinstances("j_helmet");
    if (isalive(self) && shouldplaysuffocatedeath()) {
        playfxontag(level.g_effect["helmet_break_suffocate"], self, "j_head");
        if (self.asmname != "zero_gravity_space" && self.asmname != "zero_gravity") {
            self.deathbysuffocation = 1;
        }
        self kill();
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3319
// Size: 0xe2
function helmetlaunch(damagedir) {
    var_363cd698ce6c69c1 = damagedir;
    var_363cd698ce6c69c1 = var_363cd698ce6c69c1 * randomfloatrange(2000, 4000);
    var_d43803be5b18ddd8 = var_363cd698ce6c69c1[0];
    var_d43804be5b18e00b = var_363cd698ce6c69c1[1];
    var_d43805be5b18e23e = randomfloatrange(1500, 3000);
    contactpoint = self.origin + (randomfloatrange(-1, 1), randomfloatrange(-1, 1), randomfloatrange(-1, 1)) * 5;
    self physicslaunchclient(contactpoint, (var_d43803be5b18ddd8, var_d43804be5b18e00b, var_d43805be5b18e23e));
    wait(60);
    while (1) {
        if (!isdefined(self)) {
            return;
        }
        if (distancesquared(self.origin, level.player.origin) > 262144) {
            break;
        }
        wait(30);
    }
    self delete();
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3402
// Size: 0x1f
function getsuffocationdeathanim() {
    animation = undefined;
    if (randomint(11) >= 1) {
        return animation;
    }
    return animation;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3429
// Size: 0x4
function shouldplaysuffocatedeath() {
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3435
// Size: 0xc2
function shouldheadpop(var_ab1c9a379f19d469) {
    if (self.unittype != "soldier" && self.unittype != "juggernaut") {
        return 0;
    }
    if (isdefined(self.forceheadpop)) {
        return 1;
    }
    if (self.damagemod == "MOD_MELEE") {
        return 0;
    }
    if (self.damagemod == "MOD_FIRE") {
        return 0;
    }
    objweapon = self.damageweapon;
    if (isnullweapon(objweapon)) {
        return 0;
    }
    if (self.damagemod == "MOD_PROJECTILE" && objweapon.classname == "turret" && istrue(level.disableheadpopbyturret)) {
        return 0;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ff
// Size: 0x66
function headpop() {
    if (!isdefined(self.headmodel)) {
        return;
    }
    playfxontag(level.g_effect["human_gib_head"], self, "j_head");
    playfxontag(level.g_effect["human_gib_head_cap"], self, "j_spine4");
    self detach(self.headmodel, "");
    self.headmodel = undefined;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356c
// Size: 0x25
function cross2d(a, b) {
    return a[0] * b[1] - b[0] * a[1];
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3599
// Size: 0x6f
function meleegetattackercardinaldirection(var_e508c1784ebedbc6, var_d9c3b6b9654ffd8e) {
    dot = vectordot(var_d9c3b6b9654ffd8e, var_e508c1784ebedbc6);
    var_f90d3cb356bc0e24 = cos(60);
    if (squared(dot) < squared(var_f90d3cb356bc0e24)) {
        if (cross2d(var_e508c1784ebedbc6, var_d9c3b6b9654ffd8e) > 0) {
            return 1;
        } else {
            return 3;
        }
    } else if (dot < 0) {
        return 0;
    } else {
        return 2;
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360f
// Size: 0x1cb
function orientmeleevictim(directional_orient) {
    var_f968c960c23738e6 = makeweapon("iw7_knife_upgrade1");
    var_af2a51355e17e303 = makeweapon("iw7_sonic");
    if (utility::isdamageweapon(var_f968c960c23738e6) || utility::isdamageweapon(var_af2a51355e17e303)) {
        return;
    }
    if (directional_orient || self.damagemod == "MOD_MELEE" && isdefined(self.attacker) && !utility::wasdamagedbyoffhandshield() && !utility::isdamageweapon(var_af2a51355e17e303)) {
        if (actor_is3d()) {
            var_65ed85ed588949ac = self.attacker.origin - self.origin;
            var_910c18a863e61b73 = generateaxisanglesfromforwardvector(var_65ed85ed588949ac, self.angles);
            self orientmode("face angle 3d", var_910c18a863e61b73);
        } else {
            var_8300aa96877a3fc8 = self.damagedir;
            var_f7fe90f909c5141 = anglestoforward(self.angles);
            var_8305909687802f71 = vectornormalize((var_8300aa96877a3fc8[0], var_8300aa96877a3fc8[1], 0));
            var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
            var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
            var_ad639924557486d5 = var_5049ea3dcc6ed882 * 90;
            var_65f1abed588d9315 = (-1 * var_8305909687802f71[0], -1 * var_8305909687802f71[1], 0);
            var_b69039ea120956af = rotatevector(var_65f1abed588d9315, (0, var_ad639924557486d5, 0));
            targetyaw = vectortoyaw(var_b69039ea120956af);
            forward = anglestoforward((0, targetyaw, 0));
            self orientmode("face angle", targetyaw);
        }
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e1
// Size: 0x40
function function_b84fca76682933d4() {
    if (!isdefined(self.attacker.lastkillalertsoundtime) || gettime() > self.attacker.lastkillalertsoundtime + 700) {
        return 0;
    }
    return 1;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3829
// Size: 0xa9
function function_2ae52d0a5e94265a() {
    isbullet = isdefined(self.damageweapon) && weapontype(self.damageweapon) == "bullet";
    if (isplayer(self.attacker) && isbullet && !function_b84fca76682933d4()) {
        if (damagelocationisany("head", "helmet")) {
            function_2ad34da25e5bdd45("bullet_impact_headshot", level.player);
        } else {
            function_2ad34da25e5bdd45("mp_kill_alert", level.player);
        }
        self.attacker.lastkillalertsoundtime = gettime();
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d9
// Size: 0x1da
function playdeathsound(var_ab1c9a379f19d469) {
    if (utility::issp()) {
        function_2ae52d0a5e94265a();
    }
    if (istrue(self.var_f543095c3ca1b743)) {
        return;
    }
    if (isdefined(self.diequietly) && self.diequietly) {
        if (isdefined(self.attacker) && isplayer(self.attacker) || isdefined(self.lastattacker) && isplayer(self.lastattacker)) {
            var_635e760983edc107 = "death_quiet";
        } else {
            return;
        }
    }
    if (shouldskipdeathsound()) {
        return;
    }
    if (isdefined(self.diequietly) && self.diequietly) {
        var_635e760983edc107 = "death_quiet";
    } else {
        var_635e760983edc107 = "death";
    }
    var_d43b9ff976e8ce31 = undefined;
    rootname = undefined;
    if (isdefined(self.damagemod) && self.damagemod == "MOD_MELEE") {
        if (isdefined(self.diequietly) && self.diequietly) {
            var_635e760983edc107 = "death_quiet";
        } else {
            var_635e760983edc107 = "death";
        }
    } else {
        if (isdefined(self.damageweapon) && !isnullweapon(self.damageweapon)) {
            var_d43b9ff976e8ce31 = getweaponammopoolname(self.damageweapon);
            rootname = function_f581838ce4328f7a(self.damageweapon);
        }
        if (var_ab1c9a379f19d469) {
            if (isdefined(rootname) && rootname == "molotov") {
                var_635e760983edc107 = "flamedeath";
            } else {
                var_635e760983edc107 = "explodeath";
            }
        } else {
            if (isdefined(self._blackboard.balconydeathnode)) {
                var_635e760983edc107 = "falldeath";
            }
            if (isdefined(var_d43b9ff976e8ce31) && var_d43b9ff976e8ce31 == %"incendiary") {
                var_635e760983edc107 = "incendeath";
            }
        }
    }
    namespace_166dc34a2c7481df::saygenericdialogue(var_635e760983edc107);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aba
// Size: 0x84
function shouldskipdeathsound() {
    if (!getdvarint(@"hash_f133094f3b5288b6", 0) && damagelocationisany("head", "helmet")) {
        if (isdefined(self.damageweapon) && !isnullweapon(self.damageweapon)) {
            if (self.damageweapon.classname == "spread") {
                return 0;
            }
            if (function_f581838ce4328f7a(self.damageweapon) == "molotov") {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b46
// Size: 0x40
function removeselffrom_squadlastseenenemypos(org) {
    for (i = 0; i < anim.squadindex.size; i++) {
        anim.squadindex[i] clearsightposnear(org);
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8d
// Size: 0x47
function clearsightposnear(org) {
    if (!isdefined(self.sightpos)) {
        return;
    }
    if (distance(org, self.sightpos) < 80) {
        self.sightpos = undefined;
        self.sighttime = gettime();
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bdb
// Size: 0x3d
function isattackerwithindist(attacker, maxdist) {
    if (!isdefined(attacker)) {
        return 0;
    }
    if (distance(self.origin, attacker.origin) > maxdist) {
        return 0;
    }
    return 1;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3c20
// Size: 0x31
function isspecialdeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isshocked()) {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c59
// Size: 0x46
function choosespecialdeath(asmname, statename, params) {
    if (isshocked()) {
        return asm_lookupanimfromalias(statename, "shock_death");
    } else {
        return asm_lookupanimfromalias("death_generic", "default");
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca6
// Size: 0x11e
function shouldgib() {
    if (!isdismembermentenabled()) {
        return 0;
    }
    if (isdefined(self.nogib)) {
        return 0;
    }
    if (self.unittype != "soldier" && self.unittype != "juggernaut" && self.unittype != "civilian") {
        return 0;
    }
    if (isdefined(self.damagemod) && self.damagemod == "MOD_MELEE") {
        return 0;
    }
    if (isdefined(self.damagemod) && isexplosivedamagemod(self.damagemod)) {
        if (isdefined(self.lastattacker) && (is_equal(self.lastattacker.asmname, "suicidebomber") || is_equal(self.lastattacker.asmname, "suicidebomber_cp"))) {
            return 1;
        }
        if (isdefined(self.damageweapon) && is_equal(self.damageweapon.basename, "suicide_vest")) {
            return 1;
        }
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dcc
// Size: 0xe9
function dogibdefault(victim) {
    origin = victim gettagorigin("j_spine4");
    if (isdefined(victim.damagedir) && victim.damagedir != (0, 0, 0)) {
        playfx(level.g_effect["human_gib_fullbody"], origin, victim.damagedir);
    } else {
        playfx(level.g_effect["human_gib_fullbody"], origin, (1, 0, 0));
    }
    if (isagent(victim)) {
        victim playsound("gib_fullbody");
    } else {
        ent = spawn("script_origin", origin);
        ent playsound("gib_fullbody", "sounddone");
        ent waittill("sounddone");
        wait(0.1);
        ent delete();
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ebc
// Size: 0x2c
function dogib() {
    if (isdefined(self.gib_override_func)) {
        level thread [[ self.gib_override_func ]](self);
    } else {
        level thread dogibdefault(self);
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3eef
// Size: 0xf4
function shouldplayshieldbashdeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    objweapon = self.damageweapon;
    if (isdefined(objweapon)) {
        if (objweapon.type == "shield") {
            return 1;
        }
        weaponname = objweapon.basename;
        if (weaponname == "iw7_mauler_c8hack" || weaponname == "iw7_c6hack_melee" || weaponname == "iw7_c6worker_fists") {
            return 1;
        }
    }
    if (isdefined(self.lastattacker) && isdefined(self.lastattacker.unittype) && self.lastattacker.unittype == "c8" && isdefined(self.damagemod) && self.damagemod == "MOD_MELEE") {
        return 1;
    }
    return 0;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3feb
// Size: 0x1c2
function doshieldbashdeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    stop_sounds();
    namespace_223959d3e5206cfb::dropallaiweapons();
    var_483b72bbc1109ab2 = vectornormalize(self.origin - level.player.origin + (0, 0, 30));
    objweapon = self.damageweapon;
    weaponname = objweapon.basename;
    if (weaponname == "iw7_c6hack_melee" || weaponname == "iw7_c6worker_fists") {
        var_483b72bbc1109ab2 = vectornormalize(self.origin - level.player.origin + (0, 0, 30) + anglestoright(level.player.angles) * 50);
    }
    self setanimrate(asm_getroot(), 0);
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (!isdefined(self)) {
        return;
    }
    self startragdollfromimpact("torso_upper", var_483b72bbc1109ab2 * 2400);
    if (isdefined(self.unittype) && self.unittype == "c6") {
        self playsound("shield_death_c6_1");
    }
    level.player playrumblelooponentity("damage_heavy");
    earthquake(0.5, 1, level.player.origin, 100);
    level.player delaycall(0.25, &stoprumble, "damage_heavy");
    wait(1);
    deathcleanup();
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b4
// Size: 0xc9
function getpainbodypartdeath() {
    if (damagelocationisany("head", "helmet", "neck")) {
        part = "head";
        return part;
    } else if (damagelocationisany("right_arm_upper", "right_arm_lower", "right_hand")) {
        part = "midbody";
        return part;
    } else if (damagelocationisany("left_arm_upper", "left_arm_lower", "left_hand")) {
        part = "midbody";
        return part;
    } else if (damagelocationisany("left_leg_upper", "left_leg_lower", "left_foot")) {
        part = "lowerbody_l";
        return part;
    } else if (damagelocationisany("right_leg_upper", "right_leg_lower", "right_foot")) {
        part = "lowerbody_r";
        return part;
    } else {
        part = "midbody";
        return part;
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4284
// Size: 0x39
function getpainbodypartcrouchdeath() {
    if (damagelocationisany("head", "helmet", "neck")) {
        part = "head";
        return part;
    } else {
        part = "midbody";
        return part;
    }
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42c4
// Size: 0x19f
function choosedirectionaldeathanim(asmname, statename, params) {
    size = namespace_7eac13b458714f13::getpainweaponsize();
    if (isdefined(self.var_687d9daf7a379462) && isdefined(self.var_aae53348ffc9b4dd) && isdefined(self.currentpose) && self.var_687d9daf7a379462 == "lowerbody" && self.var_aae53348ffc9b4dd == "_lg" && self.currentpose == "prone") {
        part = "lowerbody";
        size = "_lg";
    } else {
        part = getpainbodypartdeath();
        size = namespace_7eac13b458714f13::getpainweaponsize();
    }
    var_f7fe90f909c5141 = anglestoforward(self.angles);
    var_8305909687802f71 = vectornormalize((self.damagedir[0], self.damagedir[1], 0));
    var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
    var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
    var_fe5360fcc38632f8 = undefined;
    if (var_5049ea3dcc6ed882 == 2) {
        var_fe5360fcc38632f8 = "_8";
    } else if (var_5049ea3dcc6ed882 == 3) {
        var_fe5360fcc38632f8 = "_6";
    } else if (var_5049ea3dcc6ed882 == 1) {
        var_fe5360fcc38632f8 = "_4";
    } else {
        var_fe5360fcc38632f8 = "_2";
    }
    if (shouldfireintoairdeath(statename, part)) {
        var_e187b80bfb4878e7 = "fire_into_air";
    } else {
        var_e187b80bfb4878e7 = part + size + var_fe5360fcc38632f8;
    }
    return asm_lookupanimfromalias(statename, var_e187b80bfb4878e7);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x446b
// Size: 0x124
function choosedirectionalcrouchdeathanim(asmname, statename, params) {
    part = getpainbodypartcrouchdeath();
    size = namespace_7eac13b458714f13::getpainweaponsize();
    var_f7fe90f909c5141 = anglestoforward(self.angles);
    var_8305909687802f71 = vectornormalize((self.damagedir[0], self.damagedir[1], 0));
    var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
    var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
    var_fe5360fcc38632f8 = undefined;
    if (var_5049ea3dcc6ed882 == 2) {
        var_fe5360fcc38632f8 = "_8";
    } else if (var_5049ea3dcc6ed882 == 3) {
        var_fe5360fcc38632f8 = "_6";
    } else if (var_5049ea3dcc6ed882 == 1) {
        var_fe5360fcc38632f8 = "_4";
    } else {
        var_fe5360fcc38632f8 = "_2";
    }
    if (shouldfireintoairdeath(statename, part)) {
        var_e187b80bfb4878e7 = "fire_into_air";
    } else {
        var_e187b80bfb4878e7 = part + size + var_fe5360fcc38632f8;
    }
    return asm_lookupanimfromalias(statename, var_e187b80bfb4878e7);
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4597
// Size: 0xd6
function shouldfireintoairdeath(statename, part) {
    if (utility::iscp()) {
        return 0;
    }
    weapclass = weaponclass(self.weapon);
    diequietly = istrue(self.diequietly) || weapclass == "rocketlauncher" || weapclass == "spread" || weapclass == "pistol";
    if (!asm_hasalias(statename, "fire_into_air")) {
        return 0;
    }
    if (!self._blackboard.bfire) {
        return 0;
    }
    if (diequietly) {
        return 0;
    }
    if (part == "lowerbody") {
        return 0;
    }
    if (part == "head") {
        chance = 0.3;
    } else {
        chance = 0.15;
    }
    return randomfloat(1) < chance;
}

// Namespace death/namespace_f0a0c13f724da4b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4675
// Size: 0x10b
function choosedirectionallargepaindeathanim(asmname, statename, params) {
    part = "lowerbody";
    size = "_lg";
    var_f7fe90f909c5141 = anglestoforward(self.angles);
    var_8305909687802f71 = vectornormalize((self.damagedir[0], self.damagedir[1], 0));
    var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
    var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
    var_fe5360fcc38632f8 = undefined;
    if (var_5049ea3dcc6ed882 == 2) {
        var_fe5360fcc38632f8 = "_8";
    } else if (var_5049ea3dcc6ed882 == 3) {
        var_fe5360fcc38632f8 = "_6";
    } else if (var_5049ea3dcc6ed882 == 1) {
        var_fe5360fcc38632f8 = "_4";
    } else {
        var_fe5360fcc38632f8 = "_2";
    }
    var_e187b80bfb4878e7 = part + size + var_fe5360fcc38632f8;
    return asm_lookupanimfromalias(statename, var_e187b80bfb4878e7);
}

