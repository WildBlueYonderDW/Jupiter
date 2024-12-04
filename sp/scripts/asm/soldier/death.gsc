#using script_159f253f9bd2314e;
#using script_16ea1b94f0f381b3;
#using script_3433ee6b63c7e243;
#using script_7e4d332e911e1b90;
#using scripts\anim\face;
#using scripts\anim\notetracks;
#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\asm\shared\utility;
#using scripts\asm\soldier\death;
#using scripts\asm\soldier\pain;
#using scripts\asm\soldier\patrol;
#using scripts\common\ai;
#using scripts\common\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace death;

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ec
// Size: 0x67
function deathlmgcleanup() {
    if (!isdefined(self._blackboard.leftweaponent)) {
        return;
    }
    weaponent = self._blackboard.leftweaponent;
    weaponent delete();
    self._blackboard.leftweaponent = undefined;
    namespace_223959d3e5206cfb::forceuseweapon(self.primaryweapon, "primary");
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa5b
// Size: 0x88f
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
    bexplosivedamage = utility::wasdamagedbyexplosive();
    if (shouldhelmetpopondeath(bexplosivedamage)) {
        helmetpop();
    }
    if (shouldheadpop(bexplosivedamage)) {
        headpop();
    }
    if (!isdefined(self.skipdeathanim)) {
        self aiclearanim(asm_getroot(), 0.3);
    }
    playdeathsound(bexplosivedamage);
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
                wait 0.1;
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
    deathanimdata = undefined;
    deathanim = undefined;
    deathxanim = undefined;
    assertex(isdefined(self.deathalias) && isdefined(self.deathstate) || !isdefined(self.deathalias) && !isdefined(self.deathstate), ".deathAlias and .deathState must both be defined, or neither defined");
    var_4d3cebad4e3e8617 = isdefined(self.deathalias) && isdefined(self.deathstate);
    if (!isdefined(self.skipdeathanim) || istrue(self.var_aa0214e1292a7b3)) {
        deathanimdata = function_ea379d7359bd10ae(asmname, statename, params);
        assert(isdefined(deathanimdata) && deathanimdata.size == 2);
        deathanim = deathanimdata[0];
        deathxanim = deathanimdata[1];
        if (!animhasnotetrack(deathxanim, "dropgun") && !animhasnotetrack(deathxanim, "fire_spray")) {
            namespace_223959d3e5206cfb::dropallaiweapons();
        }
        if (animhasnotetrack(deathxanim, "dropgun")) {
            self._blackboard.awaitingdropgunnotetrack = 1;
        }
        if (istrue(self.bhasriotshieldattached)) {
            detachriotshield();
        }
        if (isdefined(self.var_1bab8712529eb3c2) && self.var_1bab8712529eb3c2) {
            scripts\asm\soldier\patrol::detachflashlight();
        }
        handleburningtodeath(deathxanim);
        self.deathanimduration = int(getanimlength(deathxanim) * 1000);
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
            assertex(utility::issp(), "Custom death anim only supported in SP.");
            bodyknob = asm_getinnerrootknob();
            self clearanim(bodyknob, 0.05);
            self setflaggedanimknoballrestart(statename, deathanim, bodyknob, 1, 0.05);
        }
        if (var_4d3cebad4e3e8617) {
            asm_playfacialanim(asmname, self.deathstate, deathxanim);
        } else {
            asm_playfacialanim(asmname, statename, deathxanim);
        }
    }
    if (isdefined(self.deathanimmode)) {
        self animmode(self.deathanimmode);
    }
    if (isdefined(self.skipdeathanim)) {
        assertex(self.skipdeathanim, "self.skipDeathAnim must be either true or undefined.");
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
            wait 0.05;
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
        if (!isdefined(deathanimdata)) {
            deathanimdata = function_ea379d7359bd10ae(asmname, statename, params);
        }
        assert(isdefined(deathanimdata) && deathanimdata.size == 2);
        deathanim = deathanimdata[0];
        deathxanim = deathanimdata[1];
        ragdollnotetracks = getnotetracktimes(deathxanim, "start_ragdoll");
        var_73afa09bae81352a = !var_4d3cebad4e3e8617 && !isdefined(self.deathanim) && (ragdollnotetracks.size == 0 || ragdollnotetracks[0] > 0.5);
        if (var_73afa09bae81352a) {
            if (self.damagemod == "MOD_MELEE") {
                ragdollscaler = 0.7;
            } else {
                ragdollscaler = 0.35;
            }
            thread waitforragdoll(getanimlength(deathxanim) * ragdollscaler);
        }
    }
    /#
        if (getdvar(@"hash_27494f1d75fc0809") == "<dev string:x1c>") {
            if (animhasnotetrack(deathxanim, "<dev string:x1f>")) {
                return;
            }
            if (animhasnotetrack(deathxanim, "<dev string:x2e>")) {
                return;
            }
            println("<dev string:x3d>", deathxanim, "<dev string:x4e>");
            iprintlnbold("<dev string:x72>");
        }
    #/
    if (!isagent(self) && !isdefined(self.skipdeathanim)) {
        thread playdeathfx();
    }
    self endon("terminate_death_thread");
    if (!isagent(self)) {
        if (isdefined(self.skipdeathanim) && !istrue(self.var_aa0214e1292a7b3)) {
            wait 0.05;
        } else {
            notestatename = statename;
            if (var_4d3cebad4e3e8617) {
                notestatename = self.deathstate;
            }
            asm_donotetracks(asmname, notestatename, &deathnotetrackhandler);
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
            wait 0.5;
            if (!isdefined(self)) {
                return;
            }
            self aisetanimrate(asm_getroot(), 0);
        }
    }
    deathcleanup();
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f2
// Size: 0x51
function deathnotetrackhandler(note) {
    if (self.burningtodeath) {
        switch (note) {
        case #"hash_9af1375f4b1b97b8":
            handleburndeathmodelswap();
            return;
        case #"hash_251b15537436bbcd":
            thread handleburndeathvfx();
            return;
        }
    }
    scripts\anim\notetracks::notetrack_prefix_handler(note);
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x134b
// Size: 0x17c
function handleburningtodeath(deathxanim) {
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
            weaponname = "<dev string:xc7>";
            if (!isnullweapon(self.damageweapon)) {
                weaponname = self.damageweapon.basename;
            }
            assertmsg("<dev string:xd1>" + weaponname);
        #/
        return;
    }
    if (self.unittype != "dog" && (!isdefined(deathxanim) || !animhasnotetrack(deathxanim, "model_swap"))) {
        if (isdefined(self.headmodel)) {
            self detach(self.headmodel);
            self.headmodel = undefined;
        }
        if (isdefined(self.hatmodel)) {
            self detach(self.hatmodel);
            self.hatmodel = undefined;
        }
        self setmodel("burntbody_male");
        if (!isdefined(deathxanim) || !animhasnotetrack(deathxanim, "burn_vfx_death_start")) {
            thread handleburndeathvfx();
        }
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14cf
// Size: 0x5c
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

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1533
// Size: 0xe0
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
            wait 0.05;
        }
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161b
// Size: 0xe1
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

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1705
// Size: 0x46
function createburnvfxpacket(tag, burnvfx, smoldervfx) {
    packet = spawnstruct();
    packet.tag = tag;
    packet.burnvfx = burnvfx;
    return packet;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1754
// Size: 0x82
function detachriotshield(inexecution) {
    assert(istrue(self.bhasriotshieldattached));
    if (shoulddropriotshield()) {
        dropriotshield();
    }
    if (utility::issp()) {
        self detach(self.riotshieldmodel, self.riotshieldmodeltag);
    } else {
        self detachshieldmodel(self.riotshieldmodel, self.riotshieldmodeltag);
        if (istrue(inexecution)) {
            dropriotshieldweapon();
        }
    }
    self.bhasriotshieldattached = undefined;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17de
// Size: 0x13
function shoulddropriotshield() {
    if (istrue(self.shoulddropriotshield)) {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17fa
// Size: 0x8d
function dropriotshield() {
    shieldorigin = self gettagorigin(self.riotshieldmodeltag);
    var_3e3f178f45c14044 = self gettagangles(self.riotshieldmodeltag);
    shield = spawn("script_model", shieldorigin);
    shield.angles = var_3e3f178f45c14044;
    shield setmodel(self.riotshieldmodel);
    shield physicslaunchserver(shieldorigin, anglestoforward(self.angles) * 5);
    shield thread deleteriotshield(10);
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x188f
// Size: 0x6b
function dropriotshieldweapon() {
    shieldorigin = self gettagorigin(self.riotshieldmodeltag);
    var_3e3f178f45c14044 = self gettagangles(self.riotshieldmodeltag);
    strweap = "iw9_me_riotshield_mp";
    shield = spawn("weapon_" + strweap, shieldorigin);
    shield.angles = var_3e3f178f45c14044;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1902
// Size: 0x1b
function deleteriotshield(time) {
    self endon("death");
    wait time;
    self delete();
}

// Namespace death / scripts\asm\soldier\death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1925
// Size: 0x108
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
    wait time * 0.001 + 0.1;
    ent delete();
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a35
// Size: 0x134
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

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b71
// Size: 0x68
function playbalconydeathanim(asmname, statename, params) {
    function_2afce3c4640b03c9(gettime() + randomintrange(25000, 35000));
    self orientmode("face angle", self._blackboard.balconydeathnode.angles[1]);
    playdeathanim(asmname, statename, params);
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1be1
// Size: 0xb7
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
        scripts\asm\soldier\death::detachriotshield();
    }
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (!isdefined(self)) {
        return;
    }
    if (!var_2e6c636f8e86eff0) {
        self startragdoll();
        wait 0.1;
    }
    deathcleanup();
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca0
// Size: 0x2f
function chooseshockdeathanim(asmname, statename, tostatename, params) {
    return asm_lookupanimfromalias(statename, "standing");
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd8
// Size: 0x37
function shouldplayshockdeath(asmname, statename, tostatename, params) {
    return isshocked() || isdefined(self.shockdeath);
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d18
// Size: 0x5e
function shouldplayexplosivedeath(asmname, statename, tostatename, params) {
    if (self.unittype == "juggernaut") {
        return false;
    }
    if (istrue(self.forceexplosivedeath)) {
        self.forceexplosivedeath = 0;
        return true;
    }
    if (utility::wasdamagedbyexplosive()) {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d7f
// Size: 0x86
function function_a9ab7e592a976b98(asmname, statename, tostatename, params) {
    if (istrue(self.var_774a6020b81b9c70)) {
        self.var_774a6020b81b9c70 = 0;
        return true;
    }
    if (isdefined(self.damagemod) && self.damagemod == "MOD_IMPACT") {
        if (isdefined(self.attacker) && istrue(self.attacker.var_128e748fcc0a6687)) {
            return true;
        }
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0e
// Size: 0x76
function function_bd0988db0fd373a1(asmname, statename, params) {
    deathalias = "train";
    if (self.currentpose == "stand") {
        deathalias += "_stand";
    } else if (self.currentpose == "crouch") {
        deathalias += "_crouch";
    }
    deathalias += scripts\asm\soldier\pain::getpaindirectiontoactor();
    return asm_lookupanimfromalias(statename, deathalias);
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8d
// Size: 0x54
function function_d111a9b9015e2baa(asmname, statename, params) {
    self.nodrop = 1;
    self.nocorpse = 1;
    self.noragdoll = 1;
    self.deathanimmode = "noclip";
    playdeathanim(asmname, statename, params);
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee9
// Size: 0x73
function shouldplayplayermeleedeath(asmname, statename, tostatename, params) {
    if (isdefined(self.damagemod) && isalive(self.attacker)) {
        if (!isplayer(self.attacker)) {
            return false;
        }
        if (utility::getdamagetype(self.damagemod) != "melee") {
            return false;
        }
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f65
// Size: 0x14c
function shouldplaybalconydeath(asmname, statename, tostatename, params) {
    if (self.currentpose == "prone") {
        return false;
    }
    if (!self.burningtodeath && utility::wasdamagedbyexplosive()) {
        return false;
    }
    if (gettime() < function_75391f72c52786a5() && !istrue(self.forcebalconydeath)) {
        return false;
    }
    node = undefined;
    if (isdefined(self.covernode)) {
        node = self.covernode;
    } else if (isdefined(self._blackboard.lastusednode)) {
        node = self._blackboard.lastusednode;
    }
    if (!isdefined(node) || !isdefined(node.script_balcony)) {
        return false;
    }
    if (abs(angleclamp180(node.angles[1] - self.angles[1])) > 30) {
        return false;
    }
    if (isdefined(self.script_chance)) {
        if (randomfloat(1) > self.script_chance) {
            return false;
        }
    }
    if (self nearnode(node)) {
        self._blackboard.balconydeathnode = node;
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x20ba
// Size: 0x43
function shouldplaybalconyraildeath(asmname, statename, tostatename, params) {
    return self._blackboard.balconydeathnode.script_balcony == 1;
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2106
// Size: 0x33
function choosebalconydeathanim(asmname, statename, tostatename, params) {
    return asm_lookupanimfromalias(statename, self.currentpose);
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2142
// Size: 0x168
function shouldplaystrongdamagedeath(asmname, statename, tostatename, params) {
    objweapon = self.damageweapon;
    if (!isdefined(objweapon) || isnullweapon(objweapon)) {
        return false;
    }
    if (scripts\engine\utility::doinglongdeath()) {
        return false;
    }
    if (self.currentpose == "prone" || isdefined(self.a.onback)) {
        return false;
    }
    if (self.damagemod == "MOD_MELEE") {
        return false;
    }
    if (abs(self.damageyaw) < 45) {
        return false;
    }
    if (self.damagetaken > 500) {
        return true;
    }
    if (self.a.movement == "run" && !isattackerwithindist(self.attacker, 275)) {
        if (randomint(100) < 65) {
            return false;
        }
    }
    if (issniperrifle(objweapon) && self.maxhealth < self.damagetaken) {
        return true;
    }
    if (isshotgun(objweapon) && isattackerwithindist(self.attacker, 512)) {
        return true;
    }
    if (objweapon.basename == "iw7_devastator" && utility::isweaponepic(objweapon)) {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b3
// Size: 0x11a
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
    foreach (part in self._blackboard.scriptableparts) {
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

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d5
// Size: 0xe8
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

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24c5
// Size: 0x6b
function choosemovingdeathanim(asmname, statename, params) {
    curspeed = length(self.velocity);
    archetype = self getbasearchetype();
    speedstring = getnearestspeedthresholdname(archetype, curspeed);
    movingdeathanims = [];
    return asm_lookupanimfromalias(statename, speedstring);
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2557
// Size: 0x76
function choosecrouchingdeathanim(asmname, statename, params) {
    if (damagelocationisany("head", "neck")) {
        return asm_lookupanimfromalias(statename, "head");
    }
    if (damagelocationisany("torso_upper", "torso_lower", "left_arm_upper", "right_arm_upper", "neck")) {
        return asm_lookupanimfromalias(statename, "torso");
    }
    return asm_lookupanimfromalias(statename, "default");
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25d6
// Size: 0x1aa
function choosecoverdeathanim(asmname, statename, params) {
    assertex(isdefined(params), "Cover type not passed as param to state " + statename);
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
        } else {
            if (damagelocationisany("head", "neck")) {
                return asm_lookupanimfromalias(statename, "right_crouch_head");
            }
            return asm_lookupanimfromalias(statename, "right_crouch_default");
        }
    case #"hash_4ddb655e251e06c8":
        if (self.currentpose == "stand") {
            return asm_lookupanimfromalias(statename, "left_stand");
        } else {
            return asm_lookupanimfromalias(statename, "left_crouch");
        }
    case #"hash_307cdefbc9ff53fa":
        return asm_lookupanimfromalias(statename, "3d");
    }
    assertmsg("invalid cover type passed to asm death function.");
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2788
// Size: 0x231
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
    assert(deathanims.size > 0);
    return deathanims[randomint(deathanims.size)];
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29c2
// Size: 0x226
function chooseexplosivedeathanim(asmname, statename, params) {
    ismolotov = 0;
    objweapon = self.damageweapon;
    if (!isnullweapon(objweapon) && self.unittype != "juggernaut" && utility::shouldburnfromdamage(objweapon)) {
        if (asm_hasalias(statename, "molotov_f")) {
            ismolotov = 1;
        }
    }
    deathalias = undefined;
    if (ismolotov && self.currentpose == "prone") {
        deathalias = "molotov_prone";
    } else {
        deathalias = "explosive";
        if (ismolotov) {
            deathalias = "molotov";
        }
        if (self.currentpose == "crouch") {
            deathalias += "_crouch";
        } else if (self.currentpose == "prone") {
            deathalias += "_prone";
        }
        deathalias += scripts\asm\soldier\pain::getpaindirectiontoactor();
    }
    deathanim = asm_lookupanimfromalias(statename, deathalias);
    if (ismolotov) {
        deathanim = preventrecentanimindex(self, statename, deathalias, deathanim);
    }
    deathxanim = asm_getxanim(statename, deathanim);
    if (getdvar(@"hash_f53ba58df3983a20", "on") == "on") {
        t = 1;
        ragdollnotetracks = getnotetracktimes(deathxanim, "start_ragdoll");
        if (ragdollnotetracks.size > 0) {
            t = ragdollnotetracks[0];
        }
        localdeltavector = getmovedelta(deathxanim, 0, t);
        endpoint = self localtoworldcoords(localdeltavector);
        can_move = 0;
        if (actor_is3d()) {
            can_move = navtrace3d(self.origin, endpoint, 0);
        } else {
            can_move = self maymovefrompointtopoint(self.origin, endpoint, 0, 1);
        }
        if (!can_move) {
            if (ismolotov) {
                deathanim = asm_lookupanimfromalias(statename, "default_molotov");
            } else {
                deathanim = asm_lookupanimfromalias(statename, "default");
            }
        }
    }
    self.deathanimmode = "nogravity";
    return deathanim;
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf1
// Size: 0x150
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
    assert(deathanims.size > 0);
    return deathanims[randomint(deathanims.size)];
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4a
// Size: 0x27
function choosestandingmeleedeathanim(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, "default");
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7a
// Size: 0x3
function firingdeathallowed() {
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d86
// Size: 0x46
function playdeathfx() {
    self endon("killanimscript");
    if (self.stairsstate != "none") {
        return;
    }
    wait 2;
    if (isdefined(self.noragdoll) && self.damagemod != "MOD_MELEE") {
        play_blood_pool();
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd4
// Size: 0x10b
function play_blood_pool(note, flagname) {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.skipbloodpool)) {
        assertex(self.skipbloodpool, "Setting must be either true or undefined");
        return;
    }
    tagpos = self gettagorigin("j_SpineUpper");
    tagangles = self gettagangles("j_SpineUpper");
    forward = anglestoforward(tagangles);
    up = anglestoup(tagangles);
    right = anglestoright(tagangles);
    tagpos = tagpos + forward * -8.5 + up * 5 + right * 0;
    trace = scripts\engine\trace::_bullet_trace(tagpos + (0, 0, 30), tagpos - (0, 0, 100), 0, undefined);
    if (trace["normal"][2] > 0.9) {
        playfx(level._effect["deathfx_bloodpool_generic"], tagpos);
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee7
// Size: 0xf4
function shouldhelmetpoponpain(bexplosivedamage) {
    if (!istrue(self.shouldhelmetpop)) {
        return false;
    }
    if (isdefined(self.lastattacker) && isdefined(self.lastattacker.team) && isdefined(self.team) && self.lastattacker.team == self.team) {
        return false;
    }
    if (isdefined(self.helmetsubpart) && !bexplosivedamage) {
        return false;
    }
    if (isdefined(self.onlyhelmetpopondeath) && self.onlyhelmetpopondeath) {
        return false;
    }
    if (isdefined(self.magic_bullet_shield) && self.magic_bullet_shield) {
        return false;
    }
    if (isdefined(self.damagelocation) && self.damagelocation == "helmet") {
        return true;
    }
    if (bexplosivedamage && randomint(2) == 0) {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fe4
// Size: 0xae
function shouldhelmetpopondeath(bexplosivedamage) {
    if (!istrue(self.shouldhelmetpop)) {
        return false;
    }
    if (self.unittype != "soldier" && self.unittype != "juggernaut") {
        return false;
    }
    if (self.damagemod == "MOD_MELEE" && randomint(3) < 2) {
        return false;
    }
    if (isdefined(self.damagelocation) && (self.damagelocation == "helmet" || self.damagelocation == "head")) {
        return true;
    }
    if (bexplosivedamage && randomint(3) == 0) {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x309b
// Size: 0x251
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

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32f4
// Size: 0xe1
function helmetlaunch(damagedir) {
    launchforce = damagedir;
    launchforce *= randomfloatrange(2000, 4000);
    forcex = launchforce[0];
    forcey = launchforce[1];
    forcez = randomfloatrange(1500, 3000);
    contactpoint = self.origin + (randomfloatrange(-1, 1), randomfloatrange(-1, 1), randomfloatrange(-1, 1)) * 5;
    self physicslaunchclient(contactpoint, (forcex, forcey, forcez));
    wait 60;
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        if (distancesquared(self.origin, level.player.origin) > 262144) {
            break;
        }
        wait 30;
    }
    self delete();
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33dd
// Size: 0x1e
function getsuffocationdeathanim() {
    animation = undefined;
    if (randomint(11) >= 1) {
        return animation;
    }
    return animation;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3404
// Size: 0x3
function shouldplaysuffocatedeath() {
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3410
// Size: 0xc1
function shouldheadpop(bexplosivedamage) {
    if (self.unittype != "soldier" && self.unittype != "juggernaut") {
        return false;
    }
    if (isdefined(self.forceheadpop)) {
        return true;
    }
    if (self.damagemod == "MOD_MELEE") {
        return false;
    }
    if (self.damagemod == "MOD_FIRE") {
        return false;
    }
    objweapon = self.damageweapon;
    if (isnullweapon(objweapon)) {
        return false;
    }
    if (self.damagemod == "MOD_PROJECTILE" && objweapon.classname == "turret" && istrue(level.disableheadpopbyturret)) {
        return false;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34da
// Size: 0x65
function headpop() {
    if (!isdefined(self.headmodel)) {
        return;
    }
    playfxontag(level.g_effect["human_gib_head"], self, "j_head");
    playfxontag(level.g_effect["human_gib_head_cap"], self, "j_spine4");
    self detach(self.headmodel, "");
    self.headmodel = undefined;
}

// Namespace death / scripts\asm\soldier\death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3547
// Size: 0x24
function cross2d(a, b) {
    return a[0] * b[1] - b[0] * a[1];
}

// Namespace death / scripts\asm\soldier\death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3574
// Size: 0x6e
function meleegetattackercardinaldirection(var_e508c1784ebedbc6, var_d9c3b6b9654ffd8e) {
    dot = vectordot(var_d9c3b6b9654ffd8e, var_e508c1784ebedbc6);
    var_f90d3cb356bc0e24 = cos(60);
    if (squared(dot) < squared(var_f90d3cb356bc0e24)) {
        if (cross2d(var_e508c1784ebedbc6, var_d9c3b6b9654ffd8e) > 0) {
            return 1;
        } else {
            return 3;
        }
        return;
    }
    if (dot < 0) {
        return 0;
    }
    return 2;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35ea
// Size: 0x1ca
function orientmeleevictim(directional_orient) {
    knifeweapon = makeweapon("iw7_knife_upgrade1");
    var_af2a51355e17e303 = makeweapon("iw7_sonic");
    if (utility::isdamageweapon(knifeweapon) || utility::isdamageweapon(var_af2a51355e17e303)) {
        return;
    }
    if (directional_orient || self.damagemod == "MOD_MELEE" && isdefined(self.attacker) && !utility::wasdamagedbyoffhandshield() && !utility::isdamageweapon(var_af2a51355e17e303)) {
        if (actor_is3d()) {
            var_65ed85ed588949ac = self.attacker.origin - self.origin;
            var_910c18a863e61b73 = generateaxisanglesfromforwardvector(var_65ed85ed588949ac, self.angles);
            self orientmode("face angle 3d", var_910c18a863e61b73);
            return;
        }
        var_8300aa96877a3fc8 = self.damagedir;
        var_f7fe90f909c5141 = anglestoforward(self.angles);
        var_8305909687802f71 = vectornormalize((var_8300aa96877a3fc8[0], var_8300aa96877a3fc8[1], 0));
        var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
        var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
        var_ad639924557486d5 = var_5049ea3dcc6ed882 * 90;
        var_65f1abed588d9315 = (-1 * var_8305909687802f71[0], -1 * var_8305909687802f71[1], 0);
        resultvector = rotatevector(var_65f1abed588d9315, (0, var_ad639924557486d5, 0));
        targetyaw = vectortoyaw(resultvector);
        forward = anglestoforward((0, targetyaw, 0));
        self orientmode("face angle", targetyaw);
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37bc
// Size: 0x3f
function function_b84fca76682933d4() {
    if (!isdefined(self.attacker.lastkillalertsoundtime) || gettime() > self.attacker.lastkillalertsoundtime + 700) {
        return false;
    }
    return true;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3804
// Size: 0xa8
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

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38b4
// Size: 0x1d9
function playdeathsound(bexplosivedamage) {
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
        if (bexplosivedamage) {
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
    scripts\anim\face::saygenericdialogue(var_635e760983edc107);
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a95
// Size: 0x83
function shouldskipdeathsound() {
    if (!getdvarint(@"hash_f133094f3b5288b6", 0) && damagelocationisany("head", "helmet")) {
        if (isdefined(self.damageweapon) && !isnullweapon(self.damageweapon)) {
            if (self.damageweapon.classname == "spread") {
                return false;
            }
            if (function_f581838ce4328f7a(self.damageweapon) == "molotov") {
                return false;
            }
        }
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b21
// Size: 0x3f
function removeselffrom_squadlastseenenemypos(org) {
    for (i = 0; i < anim.squadindex.size; i++) {
        anim.squadindex[i] clearsightposnear(org);
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b68
// Size: 0x46
function clearsightposnear(org) {
    if (!isdefined(self.sightpos)) {
        return;
    }
    if (distance(org, self.sightpos) < 80) {
        self.sightpos = undefined;
        self.sighttime = gettime();
    }
}

// Namespace death / scripts\asm\soldier\death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb6
// Size: 0x3c
function isattackerwithindist(attacker, maxdist) {
    if (!isdefined(attacker)) {
        return false;
    }
    if (distance(self.origin, attacker.origin) > maxdist) {
        return false;
    }
    return true;
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3bfb
// Size: 0x30
function isspecialdeath(asmname, statename, tostatename, params) {
    if (isshocked()) {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c34
// Size: 0x45
function choosespecialdeath(asmname, statename, params) {
    if (isshocked()) {
        return asm_lookupanimfromalias(statename, "shock_death");
    }
    return asm_lookupanimfromalias("death_generic", "default");
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c81
// Size: 0x11d
function shouldgib() {
    if (!isdismembermentenabled()) {
        return false;
    }
    if (isdefined(self.nogib)) {
        return false;
    }
    if (self.unittype != "soldier" && self.unittype != "juggernaut" && self.unittype != "civilian") {
        return false;
    }
    if (isdefined(self.damagemod) && self.damagemod == "MOD_MELEE") {
        return false;
    }
    if (isdefined(self.damagemod) && isexplosivedamagemod(self.damagemod)) {
        if (isdefined(self.lastattacker) && (is_equal(self.lastattacker.asmname, "suicidebomber") || is_equal(self.lastattacker.asmname, "suicidebomber_cp"))) {
            return true;
        }
        if (isdefined(self.damageweapon) && is_equal(self.damageweapon.basename, "suicide_vest")) {
            return true;
        }
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3da7
// Size: 0xe8
function dogibdefault(victim) {
    origin = victim gettagorigin("j_spine4");
    if (isdefined(victim.damagedir) && victim.damagedir != (0, 0, 0)) {
        playfx(level.g_effect["human_gib_fullbody"], origin, victim.damagedir);
    } else {
        playfx(level.g_effect["human_gib_fullbody"], origin, (1, 0, 0));
    }
    if (isagent(victim)) {
        victim playsound("gib_fullbody");
        return;
    }
    ent = spawn("script_origin", origin);
    ent playsound("gib_fullbody", "sounddone");
    ent waittill("sounddone");
    wait 0.1;
    ent delete();
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e97
// Size: 0x2b
function dogib() {
    if (isdefined(self.gib_override_func)) {
        level thread [[ self.gib_override_func ]](self);
        return;
    }
    level thread dogibdefault(self);
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3eca
// Size: 0xf3
function shouldplayshieldbashdeath(asmname, statename, tostatename, params) {
    objweapon = self.damageweapon;
    if (isdefined(objweapon)) {
        if (objweapon.type == "shield") {
            return true;
        }
        weaponname = objweapon.basename;
        if (weaponname == "iw7_mauler_c8hack" || weaponname == "iw7_c6hack_melee" || weaponname == "iw7_c6worker_fists") {
            return true;
        }
    }
    if (isdefined(self.lastattacker) && isdefined(self.lastattacker.unittype) && self.lastattacker.unittype == "c8" && isdefined(self.damagemod) && self.damagemod == "MOD_MELEE") {
        return true;
    }
    return false;
}

// Namespace death / scripts\asm\soldier\death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc6
// Size: 0x1c1
function doshieldbashdeath(asmname, statename, tostatename, params) {
    stop_sounds();
    namespace_223959d3e5206cfb::dropallaiweapons();
    impactdir = vectornormalize(self.origin - level.player.origin + (0, 0, 30));
    objweapon = self.damageweapon;
    weaponname = objweapon.basename;
    if (weaponname == "iw7_c6hack_melee" || weaponname == "iw7_c6worker_fists") {
        impactdir = vectornormalize(self.origin - level.player.origin + (0, 0, 30) + anglestoright(level.player.angles) * 50);
    }
    self setanimrate(asm_getroot(), 0);
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (!isdefined(self)) {
        return;
    }
    self startragdollfromimpact("torso_upper", impactdir * 2400);
    if (isdefined(self.unittype) && self.unittype == "c6") {
        self playsound("shield_death_c6_1");
    }
    level.player playrumblelooponentity("damage_heavy");
    earthquake(0.5, 1, level.player.origin, 100);
    level.player delaycall(0.25, &stoprumble, "damage_heavy");
    wait 1;
    deathcleanup();
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x418f
// Size: 0xc8
function getpainbodypartdeath() {
    if (damagelocationisany("head", "helmet", "neck")) {
        part = "head";
        return part;
    }
    if (damagelocationisany("right_arm_upper", "right_arm_lower", "right_hand")) {
        part = "midbody";
        return part;
    }
    if (damagelocationisany("left_arm_upper", "left_arm_lower", "left_hand")) {
        part = "midbody";
        return part;
    }
    if (damagelocationisany("left_leg_upper", "left_leg_lower", "left_foot")) {
        part = "lowerbody_l";
        return part;
    }
    if (damagelocationisany("right_leg_upper", "right_leg_lower", "right_foot")) {
        part = "lowerbody_r";
        return part;
    }
    part = "midbody";
    return part;
}

// Namespace death / scripts\asm\soldier\death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x425f
// Size: 0x38
function getpainbodypartcrouchdeath() {
    if (damagelocationisany("head", "helmet", "neck")) {
        part = "head";
        return part;
    }
    part = "midbody";
    return part;
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x429f
// Size: 0x19e
function choosedirectionaldeathanim(asmname, statename, params) {
    size = scripts\asm\soldier\pain::getpainweaponsize();
    if (isdefined(self.var_687d9daf7a379462) && isdefined(self.var_aae53348ffc9b4dd) && isdefined(self.currentpose) && self.var_687d9daf7a379462 == "lowerbody" && self.var_aae53348ffc9b4dd == "_lg" && self.currentpose == "prone") {
        part = "lowerbody";
        size = "_lg";
    } else {
        part = getpainbodypartdeath();
        size = scripts\asm\soldier\pain::getpainweaponsize();
    }
    var_f7fe90f909c5141 = anglestoforward(self.angles);
    var_8305909687802f71 = vectornormalize((self.damagedir[0], self.damagedir[1], 0));
    var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
    var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
    deathdir = undefined;
    if (var_5049ea3dcc6ed882 == 2) {
        deathdir = "_8";
    } else if (var_5049ea3dcc6ed882 == 3) {
        deathdir = "_6";
    } else if (var_5049ea3dcc6ed882 == 1) {
        deathdir = "_4";
    } else {
        deathdir = "_2";
    }
    if (shouldfireintoairdeath(statename, part)) {
        aliasdeath = "fire_into_air";
    } else {
        aliasdeath = part + size + deathdir;
    }
    return asm_lookupanimfromalias(statename, aliasdeath);
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4446
// Size: 0x123
function choosedirectionalcrouchdeathanim(asmname, statename, params) {
    part = getpainbodypartcrouchdeath();
    size = scripts\asm\soldier\pain::getpainweaponsize();
    var_f7fe90f909c5141 = anglestoforward(self.angles);
    var_8305909687802f71 = vectornormalize((self.damagedir[0], self.damagedir[1], 0));
    var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
    var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
    deathdir = undefined;
    if (var_5049ea3dcc6ed882 == 2) {
        deathdir = "_8";
    } else if (var_5049ea3dcc6ed882 == 3) {
        deathdir = "_6";
    } else if (var_5049ea3dcc6ed882 == 1) {
        deathdir = "_4";
    } else {
        deathdir = "_2";
    }
    if (shouldfireintoairdeath(statename, part)) {
        aliasdeath = "fire_into_air";
    } else {
        aliasdeath = part + size + deathdir;
    }
    return asm_lookupanimfromalias(statename, aliasdeath);
}

// Namespace death / scripts\asm\soldier\death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4572
// Size: 0xd5
function shouldfireintoairdeath(statename, part) {
    if (utility::iscp()) {
        return false;
    }
    weapclass = weaponclass(self.weapon);
    diequietly = istrue(self.diequietly) || weapclass == "rocketlauncher" || weapclass == "spread" || weapclass == "pistol";
    if (!asm_hasalias(statename, "fire_into_air")) {
        return false;
    }
    if (!self._blackboard.bfire) {
        return false;
    }
    if (diequietly) {
        return false;
    }
    if (part == "lowerbody") {
        return false;
    }
    if (part == "head") {
        chance = 0.3;
    } else {
        chance = 0.15;
    }
    return randomfloat(1) < chance;
}

// Namespace death / scripts\asm\soldier\death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4650
// Size: 0x10a
function choosedirectionallargepaindeathanim(asmname, statename, params) {
    part = "lowerbody";
    size = "_lg";
    var_f7fe90f909c5141 = anglestoforward(self.angles);
    var_8305909687802f71 = vectornormalize((self.damagedir[0], self.damagedir[1], 0));
    var_f7bc30f909807d8 = vectornormalize((var_f7fe90f909c5141[0], var_f7fe90f909c5141[1], 0));
    var_5049ea3dcc6ed882 = meleegetattackercardinaldirection(var_f7bc30f909807d8, var_8305909687802f71);
    deathdir = undefined;
    if (var_5049ea3dcc6ed882 == 2) {
        deathdir = "_8";
    } else if (var_5049ea3dcc6ed882 == 3) {
        deathdir = "_6";
    } else if (var_5049ea3dcc6ed882 == 1) {
        deathdir = "_4";
    } else {
        deathdir = "_2";
    }
    aliasdeath = part + size + deathdir;
    return asm_lookupanimfromalias(statename, aliasdeath);
}

