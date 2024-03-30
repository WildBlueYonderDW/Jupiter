// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_159f253f9bd2314e;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\notetracks.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_3433ee6b63c7e243;

#namespace death;

// Namespace death / namespace_965f49d67e204fd4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24e
// Size: 0x5fe
function function_7f42b3806988f8db(asmname, statename, params) {
    stop_sounds();
    self stoplookat();
    if (isdefined(self.fnasm_clearfingerposes)) {
        self [[ self.fnasm_clearfingerposes ]]();
    }
    if (isdefined(self.fnachievements)) {
        self thread [[ self.fnachievements ]]();
    }
    self.disabledeathorient = !(isdefined(self.a) && istrue(self.a.nodeath)) || istrue(self.noragdoll);
    if (isdefined(self.a) && istrue(self.a.nodeath)) {
        deathcleanup();
        return;
    }
    bexplosivedamage = utility::wasdamagedbyexplosive();
    if (!isdefined(self.skipdeathanim)) {
        self aiclearanim(asm_getroot(), 0.3);
    }
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
    deathanimdata = undefined;
    deathanim = undefined;
    deathxanim = undefined;
    /#
        assertex(isdefined(self.deathalias) && isdefined(self.deathstate) || !isdefined(self.deathalias) && !isdefined(self.deathstate), ".deathAlias and .deathState must both be defined, or neither defined");
    #/
    var_4d3cebad4e3e8617 = isdefined(self.deathalias) && isdefined(self.deathstate);
    if (!isdefined(self.skipdeathanim) || istrue(self.var_aa0214e1292a7b3)) {
        deathanimdata = function_ea379d7359bd10ae(asmname, statename, params);
        /#
            assert(isdefined(deathanimdata) && deathanimdata.size == 2);
        #/
        deathanim = deathanimdata[0];
        deathxanim = deathanimdata[1];
        self.deathanimduration = int(getanimlength(deathxanim) * 1000);
        directional_orient = isdefined(params) && params == "directional_orient";
        if (istrue(self.disabledeathdirectionalorient)) {
            directional_orient = 0;
        }
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
        if (!isdefined(deathanimdata)) {
            deathanimdata = function_ea379d7359bd10ae(asmname, statename, params);
        }
        /#
            assert(isdefined(deathanimdata) && deathanimdata.size == 2);
        #/
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
    self endon("terminate_death_thread");
    if (!isagent(self)) {
        if (isdefined(self.skipdeathanim) && !istrue(self.var_aa0214e1292a7b3)) {
            wait(0.05);
        } else {
            notestatename = statename;
            if (var_4d3cebad4e3e8617) {
                notestatename = self.deathstate;
            }
            asm_donotetracks(asmname, notestatename, &deathnotetracks);
        }
    }
    if (!isdefined(self)) {
        return;
    }
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

// Namespace death / namespace_965f49d67e204fd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x853
// Size: 0x14
function deathnotetracks(note) {
    scripts/anim/notetracks::notetrack_prefix_handler(note);
}

// Namespace death / namespace_965f49d67e204fd4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86e
// Size: 0x10c
function function_ea379d7359bd10ae(asmname, statename, params) {
    /#
        assertex(isdefined(self.deathalias) && isdefined(self.deathstate) || !isdefined(self.deathalias) && !isdefined(self.deathstate), ".deathAlias and .deathState must both be defined, or neither defined");
    #/
    var_4d3cebad4e3e8617 = isdefined(self.deathalias) && isdefined(self.deathstate);
    if (isdefined(self.deathanim)) {
        deathanim = self.deathanim;
        deathxanim = asm_getxanim(statename, deathanim);
    } else if (var_4d3cebad4e3e8617) {
        deathanim = asm_lookupanimfromalias(self.deathstate, self.deathalias);
        deathxanim = asm_getxanim(self.deathstate, deathanim);
    } else {
        deathanim = asm_getanim(asmname, statename, params);
        deathxanim = asm_getxanim(statename, deathanim);
    }
    return [deathanim, deathxanim];
}

// Namespace death / namespace_965f49d67e204fd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x982
// Size: 0x2a
function stop_sounds() {
    self stopsoundchannel("voice_bchatter_1_3d");
    self stopsoundchannel("voice_air_3d");
    disabledefaultfacialanims(0);
    self stoploopsound();
}

// Namespace death / namespace_965f49d67e204fd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b3
// Size: 0x6a
function deathcleanup() {
    if (istrue(self.skipdeathcleanup)) {
        return;
    }
    scripts/asm/asm_bb::bb_clearmeleetarget();
    self notify("terminate_ai_threads");
    if (isagent(self)) {
        return;
    }
    numattempts = 3;
    while (isdefined(self) && self.script != "death" && numattempts > 0) {
        numattempts--;
        wait(0.05);
    }
    self notify("killanimscript");
}

// Namespace death / namespace_965f49d67e204fd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa24
// Size: 0x1e1
function doimmediateragdolldeath() {
    if (isdefined(self.weapon)) {
        namespace_223959d3e5206cfb::dropallaiweapons();
    }
    self.skipdeathanim = 1;
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.vehicle_idling)) {
        return;
    }
    initialimpulse = 10;
    damagetype = utility::getdamagetype(self.damagemod);
    if (isdefined(self.attacker) && self.attacker == level.player && damagetype == "melee") {
        initialimpulse = 5;
    }
    damagetaken = self.damagetaken;
    if (damagetype == "bullet" || isdefined(self.damagemod) && self.damagemod == "MOD_FIRE") {
        damagetaken = min(damagetaken, 300);
    } else {
        damagetaken = min(damagetaken, 5000);
    }
    damagescale = initialimpulse * damagetaken;
    if (isdefined(self.var_1447d8fee27482b0)) {
        vector = self.var_1447d8fee27482b0;
    } else {
        directionup = min(0.3, self.damagedir[2]);
        vector = (self.damagedir[0], self.damagedir[1], directionup);
    }
    if (isdefined(self.var_9deba7456a84f2cb)) {
        vector = vector * self.var_9deba7456a84f2cb;
    } else {
        vector = vector * damagescale;
    }
    if (self.forceragdollimmediate) {
        vector = vector + self.prevanimdelta * 20 * 10;
    }
    damagelocation = self.damagelocation;
    if (damagelocation == "none") {
        damagelocation = "torso_upper";
    }
    self startragdollfromimpact(damagelocation, vector);
    waitframe();
}

// Namespace death / namespace_965f49d67e204fd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0c
// Size: 0x6c
function waitforragdoll(time) {
    wait(time);
    if (!isdefined(self)) {
        return;
    }
    if (isagent(self)) {
        return;
    }
    if (isdefined(self) && isdefined(self.weapon)) {
        namespace_223959d3e5206cfb::dropallaiweapons();
    }
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (isdefined(self) && !istrue(self.noragdoll)) {
        self startragdoll();
    }
}

// Namespace death / namespace_965f49d67e204fd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7f
// Size: 0x5b
function startragdollwithoutwait() {
    if (isagent(self)) {
        return;
    }
    if (isdefined(self) && isdefined(self.weapon)) {
        namespace_223959d3e5206cfb::dropallaiweapons();
    }
    if (isdefined(self.fnpreragdoll)) {
        self [[ self.fnpreragdoll ]]();
    }
    if (isdefined(self) && !isdefined(self.noragdoll)) {
        self startragdoll();
    }
}

