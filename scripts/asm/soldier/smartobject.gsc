// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\smartobjects\utility.gsc;
#using scripts\anim\notetracks.gsc;
#using scripts\asm\soldier\move.gsc;
#using scripts\asm\soldier\patrol.gsc;
#using scripts\asm\soldier\pain.gsc;
#using scripts\asm\soldier\death.gsc;

#namespace smartobject;

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc
// Size: 0x71
function smartobjectinit(asmname, var_9b08cc0ca316e788, params) {
    /#
        assert(!isdefined(self.asm.smartobject));
    #/
    self.asm.smartobject = bb_getrequestedsmartobject();
    /#
        assert(isdefined(self.asm.smartobject));
    #/
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0x84
function smartobjectcomplete(asmname, statename, params) {
    self.asm.smartobject.lastusetime = gettime();
    self.asm.smartobject smartobject_setnextuse();
    self.asm.smartobject = undefined;
    bb_clearplaysmartobject();
    asm_fireephemeralevent("smartobject", "finished");
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff
// Size: 0x3e
function getsmartobjectinfo() {
    type = getsmartobjecttype(self.asm.smartobject.script_smartobject);
    return [[ type.fngetinfo ]]();
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x345
// Size: 0x48
function smartobjecthasintro(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    if (!isdefined(info.hasintro)) {
        return 0;
    }
    return 1;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x26
function smartobjecthaslogic(asmname, statename, var_f2b19b25d457c2a6, params) {
    return 1;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3c3
// Size: 0x48
function smartobjecthasoutro(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    if (!isdefined(info.hasoutro)) {
        return 0;
    }
    return 1;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x413
// Size: 0x41
function smartobjecthasexits(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    return istrue(info.hasexits);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0x41
function shouldplaysmartobjectpain(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    return istrue(info.haspain);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5
// Size: 0x41
function shouldplaysmartobjectdeath(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    return istrue(info.hasdeath);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee
// Size: 0x41
function shouldplaysmartobjectreact(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    return istrue(info.hasreact);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x537
// Size: 0xa0
function shouldsmartobjectreact(asmname, statename, var_f2b19b25d457c2a6, params) {
    info = getsmartobjectinfo();
    if (istrue(info.bdonotreact)) {
        return 0;
    }
    if (self function_a4a9e73b2d25ff8b()) {
        return 1;
    }
    if (isdefined(info.fninterrupt) && self [[ info.fninterrupt ]]()) {
        if (!isdefined(self.var_fd01ad49b4e38ae8)) {
            self.var_fd01ad49b4e38ae8 = "med";
        }
        self.var_df902e311df99de7 = gettime();
        return 1;
    }
    return 0;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5df
// Size: 0x6c
function playsmartobjectintro(asmname, statename, params) {
    smartobject = self.asm.smartobject;
    if (isdefined(smartobject.angles)) {
        self orientmode("face angle", smartobject.angles[1]);
    }
    playsmartobjectanim(asmname, statename);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x652
// Size: 0xbc
function playsmartobjectlogic(asmname, statename, params) {
    self endon(statename + "_finished");
    smartobject = self.asm.smartobject;
    if (isdefined(smartobject.angles)) {
        self orientmode("face angle", smartobject.angles[1]);
    }
    info = getsmartobjectinfo();
    if (isdefined(info.fnonuse)) {
        self [[ info.fnonuse ]](smartobject);
    }
    playsmartobjectanim(asmname, statename, 0.1, "finished");
    self asmfireevent(asmname, "smartobject_finished");
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x715
// Size: 0x9c
function choosesmartobjectanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    if (istrue(info.var_d0fc6475ed819558)) {
        return undefined;
    }
    animalias = info.animlist[statename];
    data = spawnstruct();
    data.animindex = asm_lookupanimfromalias(info.animstatename, animalias);
    data.statename = info.animstatename;
    return data;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b9
// Size: 0x13a
function playsmartobjectanim(asmname, statename, var_8352485f68c78819, var_6c79d6772822f969) {
    self endon(statename + "_finished");
    var_5ec185bb9e766d14 = asm_getanim(asmname, statename);
    if (!isdefined(var_5ec185bb9e766d14)) {
        self waittill("forever");
    }
    self aisetanim(var_5ec185bb9e766d14.statename, var_5ec185bb9e766d14.animindex);
    asm_playfacialanim(asmname, var_5ec185bb9e766d14.statename, asm_getxanim(var_5ec185bb9e766d14.statename, var_5ec185bb9e766d14.animindex));
    if (isdefined(var_8352485f68c78819) && isdefined(var_6c79d6772822f969)) {
        xanim = asm_getxanim(var_5ec185bb9e766d14.statename, var_5ec185bb9e766d14.animindex);
        waittime = getanimlength(xanim) - var_8352485f68c78819;
        childthread smartobject_earlynotifier(waittime, var_6c79d6772822f969);
    }
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), undefined, var_5ec185bb9e766d14.statename);
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, statename, undefined, undefined, var_5ec185bb9e766d14.statename);
    }
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fa
// Size: 0x23
function smartobject_earlynotifier(waittime, var_6c79d6772822f969) {
    wait(waittime);
    asm_fireephemeralevent("smartobject", var_6c79d6772822f969);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x924
// Size: 0x47
function smartobject_notetrackhandler(note) {
    if (namespace_a4081f3d58d76916::notetrack_prefix_handler(note)) {
        return;
    }
    info = getsmartobjectinfo();
    if (isdefined(info.fnnotetrackhandle)) {
        return self [[ info.fnnotetrackhandle ]](note);
    }
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x972
// Size: 0x43
function smartobject_shouldexitintomove(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self.pathgoalpos) && length2dsquared(self.velocity) > 1;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd
// Size: 0x68
function playsmartobjectexit(asmname, statename, params) {
    info = getsmartobjectinfo();
    exitanim = asm_getanim(asmname, statename);
    if (!isdefined(exitanim)) {
        asm_fireevent(asmname, "abort");
        return;
    }
    namespace_d09b117bc1b1d73e::playstartanim(asmname, info.animstatename, exitanim, 0);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa2c
// Size: 0x40
function choosesmartobjectexitanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    return namespace_d09b117bc1b1d73e::chooseanim_exit(asmname, info.animstatename, params);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa74
// Size: 0x41
function playsmartobjectreactanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    namespace_58609e68adef6b3d::playanim_patrolreact_internal(asmname, statename, info.animstatename);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xabc
// Size: 0xfd
function choosesmartobjectreactanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    if (isdefined(info.animlist) && isdefined(info.animlist[statename])) {
        /#
            assert(asm_hasalias(info.animstatename, info.animlist[statename]));
        #/
        return asm_lookupanimfromalias(info.animstatename, info.animlist[statename]);
    }
    var_394efcef72c7ebea = namespace_58609e68adef6b3d::getpatrolreactdirindex();
    alias = "react_med_" + var_394efcef72c7ebea;
    /#
        assertex(asm_hasalias(info.animstatename, alias), "Smart object reaction aliases for " + info.animstatename + " set up incorrectly.  Unable to find alias " + alias);
    #/
    return asm_lookupanimfromalias(info.animstatename, alias);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbc1
// Size: 0x45
function playsmartobjectpainanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    namespace_7eac13b458714f13::playpainaniminternal(asmname, statename, params, 0, 1, info.animstatename);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc0d
// Size: 0x5a
function playsmartobjectdeathanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    self.deathstate = info.animstatename;
    self.deathalias = choosesmartobjectdeathalias(statename);
    namespace_f0a0c13f724da4b::playdeathanim(asmname, statename);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc6e
// Size: 0xf1
function choosesmartobjectpainanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    if (isdefined(info.animlist) && isdefined(info.animlist[statename])) {
        /#
            assert(asm_hasalias(info.animstatename, info.animlist[statename]));
        #/
        return asm_lookupanimfromalias(info.animstatename, info.animlist[statename]);
    }
    var_7b9fb896860064ab = "pain_" + smtobjgetdamagedir();
    /#
        assertex(asm_hasalias(info.animstatename, var_7b9fb896860064ab), "Smart object pain aliases for " + info.animstatename + " set up incorrectly.  Unable to find alias " + var_7b9fb896860064ab);
    #/
    return asm_lookupanimfromalias(info.animstatename, var_7b9fb896860064ab);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd67
// Size: 0x6f
function smtobjgetdamagedir() {
    anglediff = angleclamp180(self.damageyaw - self.angles[1]);
    if (anglediff < -135) {
        return "2";
    } else if (anglediff < -45) {
        return "4";
    } else if (anglediff > 135) {
        return "2";
    } else if (anglediff > 45) {
        return "6";
    } else {
        return "8";
    }
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xddd
// Size: 0x51
function choosesmartobjectdeathanim(asmname, statename, params) {
    info = getsmartobjectinfo();
    deathalias = choosesmartobjectdeathalias(statename);
    return asm_lookupanimfromalias(info.animstatename, deathalias);
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe36
// Size: 0xbf
function choosesmartobjectdeathalias(statename) {
    info = getsmartobjectinfo();
    if (isdefined(info.animlist) && isdefined(info.animlist[statename])) {
        /#
            assert(asm_hasalias(info.animstatename, info.animlist[statename]));
        #/
        return info.animlist[statename];
    }
    deathalias = "death_" + smtobjgetdamagedir();
    /#
        assertex(asm_hasalias(info.animstatename, deathalias), "Smart object death aliases for " + info.animstatename + " set up incorrectly. Unable to find alias " + deathalias);
    #/
    return deathalias;
}

// Namespace smartobject/namespace_738087d4bfdfdfef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xefd
// Size: 0x8d
function needtoturntosmartobject(asmname, statename, params) {
    var_6c66de307018dfe3 = bb_getrequestedsmartobject();
    if (!isdefined(var_6c66de307018dfe3)) {
        return 0;
    }
    if (!isdefined(var_6c66de307018dfe3.angles)) {
        return 0;
    }
    anglediff = angleclamp180(var_6c66de307018dfe3.angles[1] - self.angles[1]);
    if (-45 < anglediff && anglediff < 45) {
        return 0;
    }
    self.desiredturnyaw = anglediff;
    return 1;
}

