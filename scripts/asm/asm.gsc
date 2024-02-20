// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\anim\animselector.gsc;

#namespace asm;

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb7
// Size: 0x28
function function_c051a94f99bd65f1(asmname) {
    self asminstantiate(asmname);
    self.asmasset = undefined;
    self.animationarchetype = undefined;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbe6
// Size: 0x63
function asm_getfunction(asmname, var_cc4f2e0388379546) {
    /#
        assertex(isdefined(anim.asmfuncs[asmname]), "ASMRegister was not called on ASM " + asmname);
    #/
    /#
        assertex(isdefined(anim.asmfuncs[asmname][var_cc4f2e0388379546]), "Unable to find asm func " + var_cc4f2e0388379546 + " in ASM " + asmname);
    #/
    return anim.asmfuncs[asmname][var_cc4f2e0388379546];
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc51
// Size: 0x8
function asm_getgenerichandler() {
    return &asm_generichandler;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc61
// Size: 0x42
function asm_setupaim(asmname, statename, blendtime, var_7d7e52a729d0b9b0) {
    if (isdefined(self.fnasm_setupaim)) {
        self [[ self.fnasm_setupaim ]](asmname, statename, blendtime, var_7d7e52a729d0b9b0);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcaa
// Size: 0x154
function asm_settransitionorientmode(var_6c1c5f905d32f13a) {
    if (!isai(self)) {
        return;
    }
    switch (var_6c1c5f905d32f13a) {
    case #"hash_96a6a25bd7beed30":
        var_8e1451b5845405b1 = 1024;
        if (actor_is3d()) {
            var_5e1cf0a9046f6f99 = self.angles;
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
                var_5e1cf0a9046f6f99 = self function_f134f30c17faeaf(self.node);
            }
            self orientmode("face angle 3d", var_5e1cf0a9046f6f99);
        } else {
            yaw = self.angles[1];
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
                yaw = getnodeforwardyaw(self.node);
            }
            self orientmode("face angle", yaw);
        }
        break;
    case #"hash_579a1f64b8b40d31":
        self orientmode("face angle 3d", self.angles);
        break;
    default:
        self orientmode(var_6c1c5f905d32f13a);
        break;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe05
// Size: 0x31
function asm_settransitionanimmode(anim_mode) {
    if (isdefined(self.fnasm_setanimmode)) {
        self [[ self.fnasm_setanimmode ]](anim_mode);
        return;
    }
    self animmode(anim_mode, 0);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0xe2
function asm_generichandler(var_2264872ee8a7d354, asmname, param1, param2, param3) {
    switch (var_2264872ee8a7d354) {
    case #"hash_fc8a71042f2cb15b":
        asm_setupaim(asmname, param1, 0.2, undefined);
        break;
    case #"hash_db521e4972a48a9d":
        var_8ac9186b53b0e4f2 = asm_getnotehandler(asmname, undefined);
        val = [[ self.fnasm_handlenotetrack ]](param2, param1, var_8ac9186b53b0e4f2, undefined);
        if (!isdefined(val)) {
            val = asm_handlenewnotetracks(asmname, param2, param1);
        }
        if (isdefined(val) && !asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
        break;
    default:
        /#
            assertmsg("unknown handler: " + var_2264872ee8a7d354);
        #/
        break;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf26
// Size: 0x5a
function asm_setoverrideparams(asmname, params) {
    /#
        assert(isdefined(anim.asmparams));
    #/
    /#
        assert(isdefined(anim.asmparams[asmname]));
    #/
    var_c237adaa8f06b26b = 9999;
    anim.asmparams[asmname][var_c237adaa8f06b26b] = params;
    return var_c237adaa8f06b26b;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf88
// Size: 0x1b
function asm_globalinit() {
    if (isdefined(anim.asm)) {
        return;
    }
    anim.asm = [];
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfaa
// Size: 0x26
function asm_fireephemeralevent(var_550ad7fdd85835ee, eventname, params) {
    self asmfireephemeralevent(var_550ad7fdd85835ee, eventname, params);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd7
// Size: 0x35
function asm_init_blackboard() {
    if (isdefined(self._blackboard)) {
        return;
    }
    self._blackboard = self getaiblackboard();
    self._blackboard.bfire = 0;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1013
// Size: 0x7f
function asm_terminateandreplace(var_f48b8938602f359b, var_388552599bfcb74) {
    self asmterminate();
    self clearaiblackboard();
    self._blackboard = undefined;
    self notify("asm_terminated");
    self.var_a709fbd9fea148f6 = undefined;
    if (!isdefined(var_388552599bfcb74)) {
        var_388552599bfcb74 = self.var_ae3ea15396b65c1f;
    }
    var_2a6dba1cf4fb4026 = tolower(var_f48b8938602f359b);
    asm_init_blackboard();
    self [[ self.fnasm_init ]](var_2a6dba1cf4fb4026, var_388552599bfcb74);
    self.var_a942dd31d55102c9 = var_2a6dba1cf4fb4026;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1099
// Size: 0x4e
function asm_getnotehandler(asmname, statename) {
    var_70b5fd7365f6b50c = self asmgetnotehandler(asmname);
    if (!isdefined(var_70b5fd7365f6b50c)) {
        return undefined;
    }
    if (isint(var_70b5fd7365f6b50c)) {
        if (var_70b5fd7365f6b50c != -1) {
            return anim.asmfuncs[asmname][var_70b5fd7365f6b50c];
        }
        return undefined;
    }
    return var_70b5fd7365f6b50c;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ef
// Size: 0x2c
function asm_currentstatehasflag(asmname, flagname) {
    if (istrue(self.var_15b9736ae2dde804)) {
        return 1;
    }
    return self asmcurrentstatehasflag(asmname, flagname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123
// Size: 0x26
function asm_fireevent_internal(asmname, eventname, params) {
    self asmfireevent(asmname, eventname, params);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1150
// Size: 0x4b
function asm_fireevent(asmname, eventname, params) {
    asm_fireevent_internal(asmname, eventname, params);
    if (eventname == "anim_will_finish" || eventname == "finish") {
        eventname = "end";
        asm_fireevent_internal(asmname, eventname);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a2
// Size: 0x37
function asm_ephemeraleventfired(var_550ad7fdd85835ee, eventname, var_bd6b21f67400a4) {
    var_d6ad4e2c0e339a1b = self asmephemeraleventfired(var_550ad7fdd85835ee, eventname);
    if (var_d6ad4e2c0e339a1b) {
        return 1;
    }
    return 0;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x1e
function asm_eventfiredrecently(asmname, eventname) {
    return self asmeventfiredwithin(asmname, eventname, 50);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1207
// Size: 0x1c
function asm_geteventtime(asmname, eventname) {
    return self asmgeteventtime(asmname, eventname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122b
// Size: 0x1c
function asm_geteventdata(asmname, eventname) {
    return self asmgeteventdata(asmname, eventname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124f
// Size: 0x1c
function asm_getephemeraleventdata(var_550ad7fdd85835ee, eventname) {
    return self asmgetephemeraleventdata(var_550ad7fdd85835ee, eventname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1273
// Size: 0xa
function asm_clearallephemeralevents() {
    self asmclearephemeralevents();
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1284
// Size: 0xa0
function asm_shouldpowerdown(asmname, currentstate) {
    if (!isdefined(self.bpowerdown) || !self.bpowerdown) {
        return 0;
    }
    if (isdefined(self.asm.bpowereddown) && self.asm.bpowereddown) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (bb_isanimscripted()) {
        return 0;
    }
    if (isdefined(self._blackboard.btraversing)) {
        return 0;
    }
    if (self.var_a97ac004f00c5df9) {
        return 0;
    }
    return 1;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x1c
function asm_eventfired(asmname, eventname) {
    return self asmeventfired(asmname, eventname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1350
// Size: 0x25
function asm_checktransitions(asmname, currentstatename, var_7bb056e0e335a770) {
    self asmtick(1);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137c
// Size: 0x5f
function asm_setstate(var_f2b19b25d457c2a6, params) {
    if (self asmhasstate(self.asmname, var_f2b19b25d457c2a6)) {
        if (isdefined(anim.callbacks["StopAnimscripted"])) {
            self [[ anim.callbacks["StopAnimscripted"] ]]();
        }
        self asmsetstate(self.asmname, var_f2b19b25d457c2a6, params);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e2
// Size: 0x6b
function function_ac90fa5cc0a80298(state_name, params) {
    current = self asmgetcurrentstate(self.asmname);
    if (current != state_name) {
        if (isdefined(anim.callbacks["StopAnimscripted"])) {
            self [[ anim.callbacks["StopAnimscripted"] ]]();
        }
        self asmsetstate(self.asmname, state_name);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1454
// Size: 0x11
function asm_tick() {
    /#
        assertmsg("This ent is using the completely obsolete script-driven ASM!");
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x146c
// Size: 0x50
function highestallowedstance(asmname, statename, var_f2b19b25d457c2a6, stance) {
    /#
        assert(isdefined(stance));
    #/
    highestallowedstance = gethighestallowedstance();
    if (isdefined(highestallowedstance) && highestallowedstance != stance) {
        return 0;
    }
    return 1;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c4
// Size: 0x16
function asm_getdemeanor() {
    return self._blackboard.movetype;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e2
// Size: 0x3
function asm_updatefrantic() {
    
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0x4
function asm_isfrantic() {
    return 0;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f8
// Size: 0x17
function asm_iscrawlmelee() {
    return isdefined(self.asm.crawlmelee);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1517
// Size: 0x21
function asm_setcrawlmelee(val) {
    self.asm.crawlmelee = val;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x153f
// Size: 0x35
function asm_setdemeanoranimoverride(demeanor, override, anime) {
    self.asm.animoverrides[demeanor][override] = anime;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x157b
// Size: 0x36
function asm_cleardemeanoranimoverride(demeanor, override) {
    if (asm_hasdemeanoranimoverride(demeanor, override)) {
        self.asm.animoverrides[demeanor][override] = undefined;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b8
// Size: 0x46
function asm_hasdemeanoranimoverride(demeanor, override) {
    return isdefined(self.asm.animoverrides[demeanor]) && isdefined(self.asm.animoverrides[demeanor][override]);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1606
// Size: 0x3c
function asm_getdemeanoranimoverride(demeanor, override) {
    /#
        assert(asm_hasdemeanoranimoverride(demeanor, override));
    #/
    return self.asm.animoverrides[demeanor][override];
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164a
// Size: 0x13
function asm_getcurrentstate(asmname) {
    return self asmgetcurrentstate(asmname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1665
// Size: 0x50
function asm_hasalias(statename, alias) {
    var_38548703ea2bdadc = function_2285421dfc79c4d5();
    /#
        assertex(isdefined(var_38548703ea2bdadc), "AI does not have archetype defined.");
    #/
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
    return isdefined(var_eabf81b5be8ddb5);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16bd
// Size: 0x91
function asm_getanim(asmname, statename, params) {
    if (isarray(params)) {
        if (params.size == 1) {
            return self asmgetanim(asmname, statename, params[0]);
        } else if (params.size == 2) {
            return self asmgetanim(asmname, statename, params[0], params[1]);
        } else if (params.size == 3) {
            return self asmgetanim(asmname, statename, params[0], params[1], params[2]);
        } else {
            /#
                assertmsg("what gsc needs is some varargs and array flatten functionality.");
            #/
        }
    } else {
        return self asmgetanim(asmname, statename, params);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x2e
function asm_getrandomanim(asmname, statename) {
    var_b6648a33085e43a = asm_getrandomalias(statename);
    return asm_lookupanimfromalias(statename, var_b6648a33085e43a);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178b
// Size: 0x63
function asm_getrandomalias(statename) {
    aliases = archetypegetaliases(self.var_ae3ea15396b65c1f, statename);
    /#
        assertex(aliases.size > 0, "No aliases found in archetype state '" + self.var_ae3ea15396b65c1f + "->" + statename + "' for " + self.classname);
    #/
    return aliases[randomint(aliases.size)];
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f6
// Size: 0x52
function function_c1bf21c5e8625ea(statename, alias) {
    var_38548703ea2bdadc = self.basearchetype;
    /#
        assertex(isdefined(var_38548703ea2bdadc), "AI does not have base archetype defined.");
    #/
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
    return var_eabf81b5be8ddb5;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1850
// Size: 0x4f
function asm_lookupanimfromaliasifexists(statename, alias) {
    var_38548703ea2bdadc = function_2285421dfc79c4d5();
    /#
        assertex(isdefined(var_38548703ea2bdadc), "AI does not have archetype defined.");
    #/
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
    return var_eabf81b5be8ddb5;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a7
// Size: 0x92
function function_62d0bb5a77d09499(statename, alias) {
    var_38548703ea2bdadc = self.basearchetype;
    /#
        assertex(isdefined(var_38548703ea2bdadc), "AI does not have base archetype defined.");
    #/
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
    /#
        /#
            assertex(isdefined(var_eabf81b5be8ddb5), "pass_right" + function_3c8848a3a11b2553(alias) + "head_fakeactor" + var_38548703ea2bdadc + "iw7_sdfshotty" + statename + "gesture_on_me" + self.classname + "gesture_point_right");
        #/
    #/
    return var_eabf81b5be8ddb5;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1941
// Size: 0x8f
function asm_lookupanimfromalias(statename, alias) {
    var_38548703ea2bdadc = function_2285421dfc79c4d5();
    /#
        assertex(isdefined(var_38548703ea2bdadc), "AI does not have archetype defined.");
    #/
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
    /#
        /#
            assertex(isdefined(var_eabf81b5be8ddb5), "pass_right" + function_3c8848a3a11b2553(alias) + "head_fakeactor" + var_38548703ea2bdadc + "iw7_sdfshotty" + statename + "gesture_on_me" + self.classname + "gesture_point_right");
        #/
    #/
    return var_eabf81b5be8ddb5;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d8
// Size: 0xe9
function asm_getallanimsforstate(statename) {
    /#
        assert(isdefined(self.var_ae3ea15396b65c1f));
    #/
    arc = self.var_ae3ea15396b65c1f;
    aliases = archetypegetaliases(arc, statename);
    anims = [];
    foreach (alias in aliases) {
        var_5ec185bb9e766d14 = archetypegetalias(arc, statename, alias, 0);
        if (isarray(var_5ec185bb9e766d14.anims)) {
            anims = namespace_3c37cb17ade254d::array_combine(anims, var_5ec185bb9e766d14.anims);
        } else {
            anims[anims.size] = var_5ec185bb9e766d14.anims;
        }
    }
    return anims;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac9
// Size: 0x60
function asm_getallanimsforalias(archetype, statename, alias) {
    var_3a8e690b2371c6d2 = archetypegetalias(archetype, statename, alias, 1);
    if (!isdefined(var_3a8e690b2371c6d2)) {
        return undefined;
    }
    var_64c0e1b7d8039263 = var_3a8e690b2371c6d2.anims;
    if (!isarray(var_64c0e1b7d8039263)) {
        var_64c0e1b7d8039263 = [0:var_64c0e1b7d8039263];
    }
    return var_64c0e1b7d8039263;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b31
// Size: 0x24
function asm_getallanimindicesforalias(statename, alias) {
    return animsetgetallanimindicesforalias(self.var_ae3ea15396b65c1f, statename, alias);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5d
// Size: 0x89
function asm_playanimstate(asmname, statename, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1bed
// Size: 0x50
function function_74a66de812856ba(asmname, statename, params) {
    self endon(statename + "_finished");
    var_abe93f4471a03711 = float(params);
    thread asm_playanimstate(asmname, statename, params);
    wait(var_abe93f4471a03711);
    asm_fireevent(asmname, "end");
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c44
// Size: 0x31
function asm_hasknobs() {
    if (isagent(self) && !istrue(self.bsoldier) && self.unittype != "civilian") {
        return 0;
    }
    return 1;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7d
// Size: 0x267
function function_fb56c9527636713f(asmname, statename, var_c08b84490b532fb2, var_9177df4fa6f67675) {
    self endon(statename + "_finished");
    if (!isdefined(var_c08b84490b532fb2)) {
        var_c08b84490b532fb2 = 1;
    }
    if (asm_hasknobs()) {
        var_d5c987658103bffd = asm_getbodyknob();
        if (isdefined(var_9177df4fa6f67675) && var_9177df4fa6f67675) {
            var_97ca3d05716b420d = asm_lookupanimfromaliasifexists("knobs", "move");
            if (isdefined(var_97ca3d05716b420d)) {
                var_bf3de88b0e06a07c = asm_getxanim("knobs", var_97ca3d05716b420d);
                self setmoveanimknob(var_bf3de88b0e06a07c);
            }
        }
    }
    var_3931ff7e891d898f = asm_getnotehandler(asmname, statename);
    timestep = 0.2;
    var_51e5af01d440606d = isdefined(var_9177df4fa6f67675) && var_9177df4fa6f67675;
    var_cf42338e505695c0 = 1;
    while (1) {
        loopanim = asm_getanim(asmname, statename);
        var_76c92379ed351610 = asm_getxanim(statename, loopanim);
        if (isdefined(var_9177df4fa6f67675) && var_9177df4fa6f67675) {
            var_c08b84490b532fb2 = asm_getmoveplaybackrate();
            self codemoveanimrate(var_c08b84490b532fb2);
        }
        if (!var_51e5af01d440606d) {
            var_cf42338e505695c0 = self aigetanimweight(var_76c92379ed351610) == 0;
        }
        if (isnumber(loopanim)) {
            self aisetanim(statename, loopanim, var_c08b84490b532fb2);
        } else {
            /#
                assertex(utility::issp(), "looped anims that are not in the animset (demeanor override?) is only supported by SP.");
            #/
            var_c8aaf5bc74c22bb = asm_lookupanimfromalias(statename, "blank");
            self aisetanim(statename, var_c8aaf5bc74c22bb);
            if (var_cf42338e505695c0) {
                self setflaggedanimrestart(statename, loopanim, 1, 0.2, var_c08b84490b532fb2);
            } else {
                self setflaggedanim(statename, loopanim, 1, 0.2, var_c08b84490b532fb2);
            }
        }
        if (var_51e5af01d440606d) {
            var_cf42338e505695c0 = 0;
        }
        asm_playfacialanim(asmname, statename, var_76c92379ed351610);
        animtime = getanimlength(var_76c92379ed351610);
        if (animtime <= 0.05) {
            return;
        }
        var_80b5b8a637e870dd = undefined;
        var_136f34daf1a3c277 = var_c08b84490b532fb2;
        while (!isdefined(var_80b5b8a637e870dd)) {
            var_80b5b8a637e870dd = asm_donotetrackswithtimeout(asmname, statename, timestep, var_3931ff7e891d898f);
            if (!isdefined(var_80b5b8a637e870dd) && var_51e5af01d440606d) {
                var_c08b84490b532fb2 = asm_getmoveplaybackrate();
                if (var_c08b84490b532fb2 != var_136f34daf1a3c277) {
                    self codemoveanimrate(var_c08b84490b532fb2);
                    if (isnumber(loopanim)) {
                        self aisetanimrate(statename, loopanim, var_c08b84490b532fb2);
                    } else {
                        self setanimrate(var_76c92379ed351610, var_c08b84490b532fb2);
                    }
                }
            }
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eeb
// Size: 0x102
function asm_lookupdirectionalfootanim(var_603e405c2854ee22, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051) {
    prefix = "";
    if (isdefined(var_7b0f2a3348ab051)) {
        prefix = var_7b0f2a3348ab051;
    }
    if (var_5217df91f13c7c48) {
        if (asm_eventfiredrecently(asmname, "pass_left")) {
            var_33cde98bee4c1299 = prefix + "left";
        } else if (asm_eventfiredrecently(asmname, "pass_right")) {
            var_33cde98bee4c1299 = prefix + "right";
        } else if (self.asm.footsteps.foot == "right") {
            var_33cde98bee4c1299 = prefix + "right";
        } else {
            var_33cde98bee4c1299 = prefix + "left";
        }
    } else {
        var_33cde98bee4c1299 = prefix;
    }
    var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists(statename, var_33cde98bee4c1299 + var_603e405c2854ee22);
    if (isdefined(var_2c8936d08f85c5c1)) {
        return var_2c8936d08f85c5c1;
    }
    if (prefix != var_33cde98bee4c1299) {
        var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists(statename, prefix + var_603e405c2854ee22);
        if (isdefined(var_2c8936d08f85c5c1)) {
            return var_2c8936d08f85c5c1;
        }
    }
    return undefined;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff5
// Size: 0x16
function asm_setmoveplaybackrate(rate) {
    self.moveplaybackrate = rate;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2012
// Size: 0xc
function asm_getmoveplaybackrate() {
    return self.moveplaybackrate;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2026
// Size: 0x13
function asm_getcurrentstatename(asmname) {
    return self asmgetcurrentstate(asmname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2041
// Size: 0x11b
function asm_dosinglenotetrack(asmname, statename, customfunction, var_35ce7799b701c978, var_fa1ad2aa0b55766f) {
    flagname = statename;
    if (isdefined(var_fa1ad2aa0b55766f)) {
        flagname = var_fa1ad2aa0b55766f;
    }
    notes = self waittill(flagname);
    if (!isdefined(notes)) {
        notes = [0:"undefined"];
    }
    if (!isarray(notes)) {
        notes = [0:notes];
    }
    /#
        assert(isdefined(self.fnasm_handlenotetrack));
    #/
    var_fc9a12fe1f57542a = undefined;
    foreach (note in notes) {
        asm_fireevent(asmname, note);
        val = [[ self.fnasm_handlenotetrack ]](note, flagname, customfunction, var_35ce7799b701c978);
        if (!isdefined(val)) {
            val = asm_handlenewnotetracks(asmname, note, statename);
        }
        if (isdefined(val)) {
            var_fc9a12fe1f57542a = val;
        }
    }
    return var_fc9a12fe1f57542a;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2164
// Size: 0x8f
function asm_handlenewnotetracks(asmname, note, statename) {
    if (asm_tryhandledeathstatechangenotetrack(note)) {
        return;
    }
    switch (note) {
    case #"hash_3f80c02caeb2ec99":
        if (asm_currentstatehasflag(asmname, "notetrackAim")) {
            asm_setupaim(asmname, statename, 0.2);
        }
        break;
    case #"hash_9076111750d00173":
        self.var_5e9ef980ddc3f18e = 1;
        break;
    case #"hash_39f7ecb43786b597":
        self.var_5e9ef980ddc3f18e = 0;
        break;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21fa
// Size: 0x138
function asm_tryhandledeathstatechangenotetrack(notetrack) {
    if (!isstartstr(notetrack, "ds ")) {
        return 0;
    }
    charindex = 3;
    /#
        assertex(notetrack[charindex] == "[", "Format for death state override notetrack should be 'ds [name] [param]'");
    #/
    self.asm.deathstateoverride = spawnstruct();
    charindex = charindex + 1;
    deathstate = "";
    while (charindex < notetrack.size && notetrack[charindex] != "]") {
        deathstate = deathstate + notetrack[charindex];
        charindex = charindex + 1;
    }
    self.asm.deathstateoverride.statename = deathstate;
    charindex = charindex + 1;
    if (charindex < notetrack.size) {
        /#
            assertex(notetrack[charindex] + notetrack[charindex + 1] == " [", "Format for death state override notetrack should be 'ds [name]' or 'ds [name] [param]'");
        #/
        charindex = charindex + 2;
        params = "";
        while (charindex < notetrack.size && notetrack[charindex] != "]") {
            params = params + notetrack[charindex];
            charindex = charindex + 1;
        }
        self.asm.deathstateoverride.params = params;
    }
    return 1;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233a
// Size: 0x5e
function asm_donotetracksfortime(asmname, statename, time, customfunction, var_35ce7799b701c978) {
    var_24a91f52de25eb75 = statename + "_timeout";
    self endon(var_24a91f52de25eb75);
    childthread asm_donotetracksfortime_helper(var_24a91f52de25eb75, time);
    while (1) {
        asm_dosinglenotetrack(asmname, statename, customfunction, var_35ce7799b701c978);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239f
// Size: 0x25
function asm_donotetrackswithtimeout_helper(endonstring, notifystring, timeout) {
    self endon(endonstring);
    wait(timeout);
    self notify(notifystring);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23cb
// Size: 0x7c
function asm_donotetrackswithtimeout(asmname, statename, timeout, customfunction, var_35ce7799b701c978) {
    var_24a91f52de25eb75 = statename + "_timeout";
    var_7386724c9bd1d65c = statename + "_endHelper";
    self endon(var_24a91f52de25eb75);
    childthread asm_donotetrackswithtimeout_helper(var_7386724c9bd1d65c, var_24a91f52de25eb75, timeout);
    retval = asm_donotetracks(asmname, statename, customfunction, var_35ce7799b701c978);
    self notify(var_7386724c9bd1d65c);
    return retval;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244f
// Size: 0x81
function asm_donotetracks(asmname, statename, customfunction, var_35ce7799b701c978, var_fa1ad2aa0b55766f, var_5c0d1cbfc351f2e1) {
    if (!isdefined(var_5c0d1cbfc351f2e1)) {
        var_5c0d1cbfc351f2e1 = 1;
    }
    for (;;) {
        val = asm_dosinglenotetrack(asmname, statename, customfunction, var_35ce7799b701c978, var_fa1ad2aa0b55766f);
        if (isdefined(val)) {
            if (var_5c0d1cbfc351f2e1 && !asm_eventfired(asmname, "end")) {
                asm_fireevent(asmname, "end");
            }
            return val;
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d7
// Size: 0x153
function asm_donotetrackswithinterceptor(asmname, statename, interceptfunction, var_314a4fbce09143e7, var_fa1ad2aa0b55766f) {
    /#
        assert(isdefined(interceptfunction));
    #/
    flagname = statename;
    if (isdefined(var_fa1ad2aa0b55766f)) {
        flagname = var_fa1ad2aa0b55766f;
    }
    for (;;) {
        notes = self waittill(flagname);
        if (!isdefined(notes)) {
            notes = [0:"undefined"];
        }
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        var_fc9a12fe1f57542a = undefined;
        foreach (note in notes) {
            asm_fireevent(asmname, note);
            intercepted = [[ interceptfunction ]](statename, note, var_314a4fbce09143e7);
            if (isdefined(intercepted) && intercepted) {
                continue;
            }
            /#
                assert(isdefined(self.fnasm_handlenotetrack));
            #/
            val = [[ self.fnasm_handlenotetrack ]](note, statename, undefined, undefined);
            if (!isdefined(val)) {
                val = asm_handlenewnotetracks(asmname, note, statename);
            }
            if (isdefined(val)) {
                var_fc9a12fe1f57542a = val;
            }
        }
        if (isdefined(var_fc9a12fe1f57542a)) {
            return var_fc9a12fe1f57542a;
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2631
// Size: 0x8a
function asm_donotetrackssingleloop(asmname, statename, xanim, customfunction) {
    notifyname = statename + "_note_loop_end";
    self endon(notifyname);
    length = getanimlength(xanim);
    /#
        assertex(length > 0, "missing anim for state " + statename + " (anim " + xanim + " has length of 0)");
    #/
    thread asm_donotetrackssingleloop_waiter(notifyname, statename + "_finished", length);
    asm_donotetracks(asmname, statename, customfunction);
    self notify(notifyname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c2
// Size: 0x36
function asm_donotetrackssingleloop_waiter(notifyname, var_cb57658b734d4b0c, time) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(notifyname);
    self endon(var_cb57658b734d4b0c);
    wait(time);
    self notify(notifyname);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ff
// Size: 0x1a
function asm_donotetracksfortime_helper(notifystring, time) {
    wait(time);
    self notify(notifystring);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2720
// Size: 0xbc
function asm_waitforaimnotetrack(asmname, statename, blendtime) {
    self endon(statename + "_finished");
    var_3cba51f785093d95 = 0;
    while (!var_3cba51f785093d95) {
        notes = self waittill(statename);
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        foreach (note in notes) {
            if (note == "start_aim") {
                asm_setupaim(asmname, statename, blendtime);
                var_3cba51f785093d95 = 1;
                break;
            }
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e3
// Size: 0x1a5
function asm_lookuprandomalias(statename, var_7b0f2a3348ab051, var_d0d422e79c49095c) {
    /#
        assertex(isdefined(self.var_ae3ea15396b65c1f), "AI does not have archetype defined.");
    #/
    archetype = self.var_ae3ea15396b65c1f;
    aliases = archetypegetaliases(archetype, statename);
    var_9449eb175477a20e = 0;
    chosen = undefined;
    var_89add265e84914cc = -1;
    if (isdefined(var_7b0f2a3348ab051)) {
        var_89add265e84914cc = var_7b0f2a3348ab051.size;
    }
    if (!isdefined(aliases)) {
        /#
            if (!istrue(var_d0d422e79c49095c)) {
                msg = "gesture_point_down" + statename + "^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + archetype;
                if (isdefined(var_7b0f2a3348ab051)) {
                    msg = msg + "animscript" + var_7b0f2a3348ab051;
                }
                /#
                    assertmsg(msg);
                #/
            }
        #/
        return undefined;
    }
    foreach (aliasname in aliases) {
        if (var_89add265e84914cc < 0 || getsubstr(aliasname, 0, var_89add265e84914cc) == var_7b0f2a3348ab051) {
            var_9449eb175477a20e = var_9449eb175477a20e + 1;
            chance = 1 / var_9449eb175477a20e;
            if (randomfloat(1) <= chance) {
                chosen = aliasname;
            }
        }
    }
    /#
        if (!istrue(var_d0d422e79c49095c) && !isdefined(chosen)) {
            msg = "gesture_point_down" + statename + "^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + archetype;
            if (isdefined(var_7b0f2a3348ab051)) {
                msg = msg + "animscript" + var_7b0f2a3348ab051;
            }
            /#
                assertmsg(msg);
            #/
        }
    #/
    return chosen;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2990
// Size: 0xa7
function asm_chooseanim(asmname, statename, params) {
    if (!isdefined(params)) {
        var_b6648a33085e43a = asm_lookuprandomalias(statename);
        if (isdefined(var_b6648a33085e43a)) {
            return asm_lookupanimfromalias(statename, var_b6648a33085e43a);
        } else {
            /#
                assertmsg("ASM_ChooseAnim called with undefined alias and ASM_LookupRandomAlias failed to find an alias. ASM: " + asmname + " State: " + statename);
            #/
            return undefined;
        }
    } else {
        result = undefined;
        var_457feb6671add6f0 = bb_getprefixstring(params);
        if (isdefined(var_457feb6671add6f0)) {
            var_b6648a33085e43a = asm_lookuprandomalias(statename, var_457feb6671add6f0);
            result = asm_lookupanimfromalias(statename, var_b6648a33085e43a);
        } else {
            result = asm_lookupanimfromalias(statename, params);
        }
        return result;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a3e
// Size: 0x7c
function asm_clearfacialanim() {
    if (self.facialstate != "filler") {
        if (isai(self)) {
            self setfacialindex("none");
        } else if (isdefined(self.var_5247d15da29e8539)) {
            var_7c2e7606fe2f4b3d = asm_lookupanimfromalias("knobs", "head_fakeactor");
            self clearanim(asm_getxanim("knobs", var_7c2e7606fe2f4b3d), 0.2);
        } else {
            setfacialindexfornonai("none");
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac1
// Size: 0x49
function asm_restorefacialanim() {
    asmname = self.asmname;
    statename = self asmgetcurrentstate(asmname);
    if (statename == "animscripted" || self function_e3dadb2823f1da8a(asmname)) {
        return;
    }
    asm_playfacialanim(asmname, statename, undefined);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b11
// Size: 0x38
function asm_playfacialanim(asmname, statename, animname) {
    if (isdefined(self.fnasm_playfacialanim)) {
        [[ self.fnasm_playfacialanim ]](asmname, statename, animname);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b50
// Size: 0x5d
function asm_getroot() {
    /#
        assert(asm_hasknobs());
    #/
    var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists("knobs", "root");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return asm_getxanim("knobs", var_2c8936d08f85c5c1);
    }
    var_2c8936d08f85c5c1 = function_62d0bb5a77d09499("knobs", "root");
    return function_6aa159fc2f693af7("knobs", var_2c8936d08f85c5c1);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb5
// Size: 0x4e
function asm_getbodyknob() {
    var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists("knobs", "body");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return asm_getxanim("knobs", var_2c8936d08f85c5c1);
    }
    var_2c8936d08f85c5c1 = function_62d0bb5a77d09499("knobs", "body");
    return function_6aa159fc2f693af7("knobs", var_2c8936d08f85c5c1);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0b
// Size: 0x5a
function asm_getinnerrootknob() {
    var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists("knobs", "inner_root");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return asm_getxanim("knobs", var_2c8936d08f85c5c1);
    }
    var_2c8936d08f85c5c1 = function_c1bf21c5e8625ea("knobs", "inner_root");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return function_6aa159fc2f693af7("knobs", var_2c8936d08f85c5c1);
    }
    return asm_getbodyknob();
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6d
// Size: 0x54
function asm_getfacialknob() {
    var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists("always_on", "facial");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return asm_getxanim("always_on", var_2c8936d08f85c5c1);
    }
    var_2c8936d08f85c5c1 = function_c1bf21c5e8625ea("always_on", "facial");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return function_6aa159fc2f693af7("always_on", var_2c8936d08f85c5c1);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc8
// Size: 0x54
function asm_getheadlookknobifexists() {
    var_2c8936d08f85c5c1 = asm_lookupanimfromaliasifexists("knobs", "headlook");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return asm_getxanim("knobs", var_2c8936d08f85c5c1);
    }
    var_2c8936d08f85c5c1 = function_c1bf21c5e8625ea("knobs", "headlook");
    if (isdefined(var_2c8936d08f85c5c1)) {
        return function_6aa159fc2f693af7("knobs", var_2c8936d08f85c5c1);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d23
// Size: 0xac
function asm_isweaponoverride() {
    currentweapon = self.weapon;
    weapon = getweaponbasename(currentweapon);
    var_2fbcadf015a28bea = [0:"iw7_cheytac", 1:"iw7_kbs", 2:"iw7_m1", 3:"iw7_m8", 4:"iw7_mauler", 5:"iw7_sdflmg", 6:"iw7_ameli", 7:"iw7_steeldragon", 8:"iw7_sonic", 9:"iw7_sdfshotty", 10:"iw7_spas"];
    if (isdefined(weapon) && array_contains(var_2fbcadf015a28bea, weapon)) {
        return 1;
    }
    return 0;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd7
// Size: 0x5c
function function_6aa159fc2f693af7(statename, var_2c8936d08f85c5c1) {
    /#
        assert(isdefined(statename));
    #/
    /#
        assertex(isdefined(var_2c8936d08f85c5c1), "Undefined animId passed in for state " + statename);
    #/
    if (isnumber(var_2c8936d08f85c5c1)) {
        archetype = self.basearchetype;
        return animsetgetanimfromindex(archetype, statename, var_2c8936d08f85c5c1);
    } else {
        return var_2c8936d08f85c5c1;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3a
// Size: 0x59
function asm_getxanim(statename, var_2c8936d08f85c5c1) {
    /#
        assert(isdefined(statename));
    #/
    /#
        assertex(isdefined(var_2c8936d08f85c5c1), "Undefined animId passed in for state " + statename);
    #/
    if (isnumber(var_2c8936d08f85c5c1)) {
        archetype = function_2285421dfc79c4d5();
        return animsetgetanimfromindex(archetype, statename, var_2c8936d08f85c5c1);
    } else {
        return var_2c8936d08f85c5c1;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9a
// Size: 0x95
function asm_playanimstatewithnotetrackinterceptor(asmname, statename, var_179213470e3d2f54, var_49bd3392cc4caeb2) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    endnote = asm_donotetrackswithinterceptor(asmname, statename, var_179213470e3d2f54, var_49bd3392cc4caeb2);
    if (endnote == "end") {
        if (!asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f36
// Size: 0x6d
function asm_playanimstatenotransition(asmname, statename, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2faa
// Size: 0x80
function function_30df7eff2a4557a5(statename, aliasname) {
    self endon("death");
    namespace_28edc79fcf2fe234::bb_setanimscripted();
    self asmsetstate(self.asmname, "animscripted");
    animindex = asm_lookupanimfromalias(statename, aliasname);
    self aisetanim(statename, animindex);
    xanim = asm_getxanim(statename, animindex);
    animlength = getanimlength(xanim);
    wait(animlength);
    namespace_28edc79fcf2fe234::bb_clearanimscripted();
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3031
// Size: 0x3e
function asm_playadditiveanimloopstate(asmname, statename, params) {
    /#
        assert(isdefined(self.fnasm_playadditiveanimloopstate));
    #/
    [[ self.fnasm_playadditiveanimloopstate ]](asmname, statename, params);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3076
// Size: 0x1c
function function_6e9cb6cd0535fe65() {
    normalizedtime = self function_9f1a3a76adea61f6();
    self function_d07a6cd6faca576d(normalizedtime);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3099
// Size: 0x16
function function_8d1655ae223d862a(rate) {
    self.var_ccbe1d3fece5c310 = rate;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b6
// Size: 0xc
function function_4bb232c0fca955f6() {
    return self.var_ccbe1d3fece5c310;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ca
// Size: 0x52
function yawdiffto2468(diff) {
    if (diff < -135) {
        return "2";
    } else if (diff < -45) {
        return "6";
    } else if (diff > 135) {
        return "2";
    } else if (diff > 45) {
        return "4";
    } else {
        return "8";
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3123
// Size: 0x25
function function_9de97eaaf31f9e35() {
    /#
        if (isdefined(level.var_9197bd66f91ccd30) && level.var_9197bd66f91ccd30) {
            return 1;
        }
        return 0;
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x314f
// Size: 0x4d
function function_3271c00e44d9636b() {
    /#
        dvar = getdvar(@"hash_9f9979f32e427f14");
        if (dvar == "<unknown string>") {
            return 0;
        }
        if (dvar == "<unknown string>") {
            return 1;
        }
        if (int(dvar) == self getentitynumber()) {
            return 1;
        }
        return 0;
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31a3
// Size: 0x20
function function_57bc598a3c0d7a1e(msg) {
    /#
        if (!function_3271c00e44d9636b()) {
            return;
        }
        println(msg);
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31ca
// Size: 0x712
function asm_setupgesture(asmname, statename) {
    demeanor = asm_getdemeanor();
    var_59c51d94cf774c12 = asm_isfrantic();
    gestures = self.asm.gestures;
    arc = self.var_ae3ea15396b65c1f;
    gestures.gesture_moveup_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_move_up", var_59c51d94cf774c12));
    gestures.gesture_armup_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_armup", var_59c51d94cf774c12));
    gestures.gesture_onme_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_on_me", var_59c51d94cf774c12));
    gestures.gesture_hold_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_hold", var_59c51d94cf774c12));
    gestures.gesture_fallback_up_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_fallback_up", var_59c51d94cf774c12));
    gestures.gesture_fallback_down_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_fallback_down", var_59c51d94cf774c12));
    if (demeanor == "casual") {
        gestures.gesture_point_center = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_center", var_59c51d94cf774c12));
        gestures.gesture_point_left = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_left", var_59c51d94cf774c12));
        gestures.gesture_point_right = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_right", var_59c51d94cf774c12));
        gestures.gesture_point_up = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_up", var_59c51d94cf774c12));
        gestures.gesture_point_down = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_down", var_59c51d94cf774c12));
        gestures.gesture_shrug_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_shrug_anim", var_59c51d94cf774c12));
        gestures.gesture_cross_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_cross_anim", var_59c51d94cf774c12));
        gestures.gesture_nod_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_nod_anim", var_59c51d94cf774c12));
        gestures.gesture_shake_head_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_shake_head_anim", var_59c51d94cf774c12));
        gestures.gesture_salute_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_salute_anim", var_59c51d94cf774c12));
        gestures.gesture_wave_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_wave_anim", var_59c51d94cf774c12));
        gestures.gesture_wait_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_wait_anim", var_59c51d94cf774c12));
    } else if (demeanor == "casual_gun") {
        gestures.gesture_point_center = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_center", var_59c51d94cf774c12));
        gestures.gesture_point_left = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_left", var_59c51d94cf774c12));
        gestures.gesture_point_right = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_right", var_59c51d94cf774c12));
        gestures.gesture_point_up = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_up", var_59c51d94cf774c12));
        gestures.gesture_point_down = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_down", var_59c51d94cf774c12));
        gestures.gesture_shrug_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shrug_anim", var_59c51d94cf774c12));
        gestures.gesture_cross_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_cross_anim", var_59c51d94cf774c12));
        gestures.gesture_nod_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_nod_anim", var_59c51d94cf774c12));
        gestures.gesture_shake_head_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shake_head_anim", var_59c51d94cf774c12));
        gestures.gesture_salute_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_salute_anim", var_59c51d94cf774c12));
        gestures.gesture_wave_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wave_anim", var_59c51d94cf774c12));
        gestures.gesture_wait_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wait_anim", var_59c51d94cf774c12));
    } else {
        gestures.gesture_point_center = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_center", var_59c51d94cf774c12));
        gestures.gesture_point_left = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_left", var_59c51d94cf774c12));
        gestures.gesture_point_right = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_right", var_59c51d94cf774c12));
        gestures.gesture_point_up = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_up", var_59c51d94cf774c12));
        gestures.gesture_point_down = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_down", var_59c51d94cf774c12));
        gestures.gesture_shrug_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shrug_anim", var_59c51d94cf774c12));
        gestures.gesture_cross_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_cross_anim", var_59c51d94cf774c12));
        gestures.gesture_nod_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_nod_anim", var_59c51d94cf774c12));
        gestures.gesture_shake_head_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shake_head_anim", var_59c51d94cf774c12));
        gestures.gesture_salute_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_salute_anim", var_59c51d94cf774c12));
        gestures.gesture_wave_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wave_anim", var_59c51d94cf774c12));
        gestures.gesture_wait_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wait_anim", var_59c51d94cf774c12));
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e3
// Size: 0xf4
function setup_level_ents() {
    level endon("game_ended");
    count = 0;
    foreach (t in getnodearray("traverse", "targetname")) {
        t traversethink();
        count++;
        if (count > 1000) {
            count = 0;
            waitframe();
        }
    }
    callback::callback("setup_all_traversals");
    /#
        foreach (t in getnodearray("<unknown string>", "<unknown string>")) {
            t thread function_f1e58f7103a22462();
        }
        level thread function_97003d3ab21d621f();
        level thread function_2bbb4d05ad09c81e();
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39de
// Size: 0x89
function function_35dd4cad0ca3fafc() {
    foreach (t in getallnodes()) {
        if (isdefined(t.type) && t.type == "Begin" && !isdefined(t.traverse_height)) {
            t function_ece7865eb2447554();
            waitframe();
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6e
// Size: 0x58
function processdoublejumpmantletraversal(target) {
    /#
        assert(isdefined(target));
    #/
    self.doublejumpmantlepos = target.origin;
    self.startnodeoriginalangles = self.angles;
    if (isent(target)) {
        target delete();
    } else {
        deletestruct_ref(target);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3acd
// Size: 0x4f2
function traversethink() {
    ent = getent(self.target, "targetname");
    if (!isdefined(ent)) {
        ent = getstruct(self.target, "targetname");
    }
    end_node = getnode(self.target, "targetname");
    if (!isdefined(end_node)) {
        if (level.script != "mp_jup_map" && level.script != "mp_jup_bigmap_wz2" && level.script != "mp_jup_bm_live_wz2" && level.script != "mp_jup_bm_wz2_s4") {
            /#
                assertex(isdefined(end_node), "Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target);
            #/
        }
        logstring("^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target);
        return;
    }
    if (self.animscript == "traverse_ground") {
        function_2121ee28acaa2765(ent, end_node);
        return;
    }
    if (!isdefined(ent)) {
        /#
            println("<unknown string>" + self.animscript + "<unknown string>");
        #/
        calculate_traverse_data(averagepoint([0:self.origin, 1:end_node.origin]), end_node.origin);
        return;
    }
    switch (self.animscript) {
    case #"hash_8f681d217a32aef7":
        processwallruntraversal(ent);
    case #"hash_2517ba3af2f13858":
        function_af7d10bc22de3494(ent);
    case #"hash_6fc6878fd3fd1e7a":
    case #"hash_d14662a6eb371af5":
        /#
            if (getdvarint(@"hash_a838875af4383ca1", 0) != 0) {
                if (isdefined(self.target)) {
                    node = getnode(self.target, "<unknown string>");
                    if (isdefined(node)) {
                        self.var_2ec927a0b0085925 = node.origin;
                    }
                }
            }
        #/
        processdoublejumpmantletraversal(ent);
    case #"hash_5f054fa72e77b8dd":
        /#
            if (getdvarint(@"hash_a838875af4383ca1", 0) != 0) {
                if (isdefined(self.target)) {
                    node = getnode(self.target, "<unknown string>");
                    if (isdefined(node)) {
                        self.var_2ec927a0b0085925 = node.origin;
                    }
                }
            }
        #/
        self.startnodeoriginalangles = self.angles;
        self.jump_over_offset = ent.origin - self.origin;
        self.jump_over_ent_origin = ent.origin;
        break;
    case #"hash_3083e73248cdb399":
        self.startnodeoriginalangles = self.angles;
        /#
            if (getdvarint(@"hash_a838875af4383ca1", 0) != 0) {
                self.var_2ec927a0b0085925 = getnode(self.target, "<unknown string>").origin;
                self.var_5d8aff9e6ac666b5 = ent.origin;
            }
        #/
        break;
    default:
        break;
    }
    if (isdefined(ent.target) && (level.script != "mp_jup_bigmap" && level.script != "mp_jup_bigmap_wz2" && level.script != "mp_jup_bm_live_wz2" && level.script != "mp_jup_bm_wz2_s4" || !isendstr(ent.target, "auto12190374188911454432"))) {
        ent2 = getent(ent.target, "targetname");
        if (!isdefined(ent2)) {
            ent2 = getstruct(ent.target, "targetname");
        }
        /#
            assertex(isdefined(ent2), self.animscript + " traverse at " + self.origin + " has ent " + ent.targetname + " at " + ent.origin + " pointing to missing ent/struct " + ent.target);
        #/
        if (isdefined(ent2)) {
            calculate_traverse_data(ent.origin, end_node.origin, ent2.origin);
        } else {
            calculate_traverse_data(ent.origin, end_node.origin);
        }
    } else {
        calculate_traverse_data(ent.origin, end_node.origin);
    }
    if (isdefined(self.parentname)) {
        store_original_traverse_data();
    }
    if (isent(ent)) {
        ent delete();
    } else {
        deletestruct_ref(ent);
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc6
// Size: 0xcd
function function_ece7865eb2447554() {
    var_e071eb2967f2a5b4 = undefined;
    end_node = getnode(self.target, "targetname");
    /#
        assertex(isdefined(end_node), "Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target);
    #/
    var_e071eb2967f2a5b4 = function_fda6a76c32365675(self.origin, end_node.origin);
    if (!isdefined(var_e071eb2967f2a5b4)) {
        /#
            assertmsg("Unable to calculate apex position for traversal starting at " + self.origin + ", using an average of the start and end points as a fallback");
        #/
        var_e071eb2967f2a5b4 = averagepoint([0:self.origin, 1:end_node.origin]);
    }
    calculate_traverse_data(var_e071eb2967f2a5b4, end_node.origin);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409a
// Size: 0x181
function store_original_traverse_data() {
    self.original_data = spawnstruct();
    self.original_data.origin = self.origin;
    self.original_data.angles = self.angles;
    self.original_data.traverse_height = self.traverse_height;
    self.original_data.traverse_height_delta = self.traverse_height_delta;
    self.original_data.traverse_drop_height_delta = self.traverse_drop_height_delta;
    self.original_data.apex_delta = self.apex_delta;
    self.original_data.apex_delta_local = rotatevectorinverted(self.apex_delta, self.angles);
    if (isdefined(self.across_delta)) {
        self.original_data.across_delta = self.across_delta;
        self.original_data.across_delta_local = rotatevectorinverted(self.across_delta, self.angles);
    }
    end_node = getnode(self.target, "targetname");
    if (isdefined(end_node)) {
        self.original_data.endnode_pos = end_node.origin;
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4222
// Size: 0x125
function calculate_traverse_data(var_7f55865ef7657985, endnode_pos, var_83a69c989077feb7) {
    /#
        assert(self.type == "Begin");
    #/
    if (self.animscript == "ladder_up" || self.animscript == "ladder_down") {
        var_f1af323ad78c802a = isdefined(var_83a69c989077feb7) ? isdefined(var_7f55865ef7657985) ? endnode_pos : var_7f55865ef7657985 : var_83a69c989077feb7;
        self.traverse_height = var_f1af323ad78c802a[2];
        self.traverse_height_delta = var_f1af323ad78c802a[2] - self.origin[2];
        self.traverse_drop_height_delta = var_f1af323ad78c802a[2] - endnode_pos[2];
        self.apex_delta = var_f1af323ad78c802a - self.origin;
    } else {
        self.traverse_height = var_7f55865ef7657985[2];
        self.traverse_height_delta = var_7f55865ef7657985[2] - self.origin[2];
        self.traverse_drop_height_delta = var_7f55865ef7657985[2] - endnode_pos[2];
        self.apex_delta = var_7f55865ef7657985 - self.origin;
        if (isdefined(var_83a69c989077feb7)) {
            self.across_delta = var_83a69c989077feb7 - var_7f55865ef7657985;
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x434e
// Size: 0xd1
function re_calculate_traverse_data(var_6a1d4524b34f5a3b, var_7f55865ef7657985, endnode_pos, var_83a69c989077feb7) {
    if (!isdefined(var_7f55865ef7657985)) {
        var_7f55865ef7657985 = self.origin + rotatevector(var_6a1d4524b34f5a3b.original_data.apex_delta_local, self.angles);
    }
    if (!isdefined(endnode_pos)) {
        endnode_pos = var_6a1d4524b34f5a3b.original_data.endnode_pos;
    }
    if (!isdefined(var_83a69c989077feb7) && isdefined(var_6a1d4524b34f5a3b.original_data.across_delta_local)) {
        var_f671cc4a667b804f = rotatevector(var_6a1d4524b34f5a3b.original_data.across_delta_local, self.angles);
        var_83a69c989077feb7 = var_7f55865ef7657985 + var_f671cc4a667b804f;
    }
    calculate_traverse_data(var_7f55865ef7657985, endnode_pos, var_83a69c989077feb7);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4426
// Size: 0x637
function processwallruntraversal(target) {
    /#
        assert(isdefined(target));
    #/
    var_38a9abab335e383a = getent(target.target, "targetname");
    if (!isdefined(var_38a9abab335e383a)) {
        var_38a9abab335e383a = getstruct(target.target, "targetname");
    }
    /#
        assert(isdefined(var_38a9abab335e383a));
    #/
    /#
        dist = distance(self.origin, target.origin);
        if (dist > 400) {
            println("<unknown string>" + self.origin + "<unknown string>" + dist + "<unknown string>" + 400);
        }
    #/
    self.wall_info = spawnstruct();
    var_70d5f712a9e22e96 = target;
    var_76045cf7c0669684 = 0;
    self.wall_info.startnodeoriginalangles = self.angles;
    /#
        deltaz = var_70d5f712a9e22e96.origin[2] - self.origin[2];
        if (deltaz > 208) {
            println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + deltaz + "<unknown string>" + 208);
        }
    #/
    var_51c78b431f0e5118 = undefined;
    while (isdefined(var_70d5f712a9e22e96)) {
        self.wall_info.nodeoffsets[var_76045cf7c0669684] = var_70d5f712a9e22e96.origin - self.origin;
        var_76045cf7c0669684++;
        var_d258406ada10ec0a = getstruct(var_70d5f712a9e22e96.target, "targetname");
        /#
            assert(isdefined(var_d258406ada10ec0a));
        #/
        /#
            dist = distance(var_70d5f712a9e22e96.origin, var_d258406ada10ec0a.origin);
            if (dist > 544) {
                println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + dist + "<unknown string>" + 544);
            }
            var_51c78b431f0e5118 = vectornormalize(var_d258406ada10ec0a.origin - var_70d5f712a9e22e96.origin);
            var_13654841eca9f761 = var_70d5f712a9e22e96.origin - self.origin;
            var_13654841eca9f761 = (var_13654841eca9f761[0], var_13654841eca9f761[1], 0);
            var_13654841eca9f761 = vectornormalize(var_13654841eca9f761);
            var_d45030edb8fba9 = vectordot(var_51c78b431f0e5118, var_13654841eca9f761);
            if (var_d45030edb8fba9 < 0) {
                println("<unknown string>" + self.origin + "<unknown string>");
            }
        #/
        deletestruct_ref(var_70d5f712a9e22e96);
        var_70d5f712a9e22e96 = var_d258406ada10ec0a;
        /#
            assert(isdefined(var_70d5f712a9e22e96));
        #/
        self.wall_info.nodeoffsets[var_76045cf7c0669684] = var_70d5f712a9e22e96.origin - self.origin;
        var_76045cf7c0669684++;
        if (isdefined(var_70d5f712a9e22e96.target)) {
            temp = getstruct(var_70d5f712a9e22e96.target, "targetname");
        } else {
            temp = undefined;
        }
        deletestruct_ref(var_70d5f712a9e22e96);
        var_70d5f712a9e22e96 = temp;
        /#
            if (!isdefined(var_70d5f712a9e22e96)) {
                var_ce328dd248bf94c6 = getnode(self.target, "<unknown string>");
                /#
                    assert(isdefined(var_ce328dd248bf94c6));
                #/
                /#
                    assert(isdefined(var_51c78b431f0e5118));
                #/
                var_66a49caa0a5f70ba = var_ce328dd248bf94c6.origin - var_d258406ada10ec0a.origin;
                var_66a49caa0a5f70ba = (var_66a49caa0a5f70ba[0], var_66a49caa0a5f70ba[1], 0);
                var_66a49caa0a5f70ba = vectornormalize(var_66a49caa0a5f70ba);
                var_d45030edb8fba9 = vectordot(var_66a49caa0a5f70ba, var_51c78b431f0e5118);
                if (var_d45030edb8fba9 < 0) {
                    println("<unknown string>" + self.origin + "<unknown string>");
                }
                dist = distance(var_d258406ada10ec0a.origin, var_ce328dd248bf94c6.origin);
                if (dist > 512) {
                    println("<unknown string>" + self.origin + "<unknown string>" + dist + "<unknown string>" + 512);
                }
            }
        #/
        if (isdefined(var_70d5f712a9e22e96) && isdefined(var_70d5f712a9e22e96.script_wallrun_type)) {
            if (var_70d5f712a9e22e96.script_wallrun_type == "wallrun_mantle") {
                /#
                    dist = distance(var_d258406ada10ec0a.origin, var_70d5f712a9e22e96.origin);
                    deltaz = var_70d5f712a9e22e96.origin[2] - var_d258406ada10ec0a.origin[2];
                    if (deltaz > 0) {
                        if (dist > 420) {
                            println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + dist + "<unknown string>" + 420);
                        }
                        if (deltaz > 200) {
                            println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + deltaz + "<unknown string>" + 200);
                        }
                    } else if (dist > 512) {
                        println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + dist + "<unknown string>" + 512);
                    }
                #/
                self.wall_info.mantleoffset = var_70d5f712a9e22e96.origin - self.origin;
                if (isdefined(var_70d5f712a9e22e96.angles)) {
                    self.wall_info.mantleangles = var_70d5f712a9e22e96.angles;
                }
                deletestruct_ref(var_70d5f712a9e22e96);
                break;
            } else if (var_70d5f712a9e22e96.script_wallrun_type == "wallrun_vault") {
                self.wall_info.mantleoffset = var_70d5f712a9e22e96.origin - self.origin;
                self.wall_info.bvaultover = 1;
                /#
                    deltaz = var_70d5f712a9e22e96.origin[2] - var_d258406ada10ec0a.origin[2];
                    if (deltaz > 164) {
                        println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + deltaz + "<unknown string>" + 164);
                    }
                #/
                deletestruct_ref(var_70d5f712a9e22e96);
                break;
            }
        }
    }
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a64
// Size: 0xd1
function function_2121ee28acaa2765(target, end_node) {
    /#
        assert(isdefined(end_node));
    #/
    self.var_5822b500407415f6 = [];
    self.var_5822b500407415f6 = array_add(self.var_5822b500407415f6, self.origin);
    currentgoal = target;
    while (isdefined(currentgoal)) {
        self.var_5822b500407415f6 = array_add(self.var_5822b500407415f6, currentgoal.origin);
        if (isdefined(currentgoal.target)) {
            currentgoal = getstruct(currentgoal.target, "targetname");
        } else {
            currentgoal = undefined;
        }
    }
    self.var_5822b500407415f6 = array_add(self.var_5822b500407415f6, end_node.origin);
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3c
// Size: 0x191
function function_af7d10bc22de3494(target) {
    /#
        assert(isdefined(target));
    #/
    self.var_a8392bf67e62cf17 = [];
    self.var_a4a172256f89bf7a = [];
    currentgoal = target;
    while (isdefined(currentgoal)) {
        self.var_a8392bf67e62cf17 = array_add(self.var_a8392bf67e62cf17, currentgoal.origin);
        self.var_a4a172256f89bf7a = array_add(self.var_a4a172256f89bf7a, currentgoal.angles[2]);
        var_9af6866c153dc36d = currentgoal;
        if (isdefined(currentgoal.target)) {
            currentgoal = getstruct(currentgoal.target, "targetname");
        } else {
            currentgoal = undefined;
        }
        deletestruct_ref(var_9af6866c153dc36d);
    }
    /#
        assert(self.var_a8392bf67e62cf17.size >= 2);
    #/
    if (self.var_a8392bf67e62cf17.size >= 2 && self.var_a4a172256f89bf7a[0] == 0) {
        var_51c78b431f0e5118 = self.var_a8392bf67e62cf17[1] - self.var_a8392bf67e62cf17[0];
        var_3c849103cdf923f1 = vectorcross(var_51c78b431f0e5118, (0, 0, 1));
        var_30501b8da540ea16 = self.var_a8392bf67e62cf17[0] - self.origin;
        var_51ad8d431ef22c74 = vectordot(var_3c849103cdf923f1, var_30501b8da540ea16);
        self.var_143b20e77684b51 = vectordot(var_3c849103cdf923f1, var_30501b8da540ea16) < 0;
    }
    self.traverse_height = 0;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd4
// Size: 0x316
function function_fda6a76c32365675(var_67f1ef51bb69b5f, end_pos) {
    var_e071eb2967f2a5b4 = undefined;
    var_7533ff429b05d245 = var_67f1ef51bb69b5f;
    var_f38af0b4e9fff9f1 = end_pos;
    var_a5d0297b89fc7ef4 = flatten_vector(end_pos - var_67f1ef51bb69b5f);
    delta_z = abs(end_pos[2] - var_67f1ef51bb69b5f[2]);
    start_z = min(var_67f1ef51bb69b5f[2], end_pos[2]);
    var_177ffb6884c84cbb = max(var_67f1ef51bb69b5f[2], end_pos[2]) + 1;
    var_67f1ef51bb69b5f = (var_67f1ef51bb69b5f[0], var_67f1ef51bb69b5f[1], var_177ffb6884c84cbb);
    end_pos = (end_pos[0], end_pos[1], var_177ffb6884c84cbb);
    trace_end = physicstrace(var_67f1ef51bb69b5f, end_pos);
    var_30d6320d769d3f2c = 0.01;
    if (distance2dsquared(trace_end, end_pos) < var_30d6320d769d3f2c) {
        if (var_7533ff429b05d245[2] < var_f38af0b4e9fff9f1[2]) {
            var_e7422a2f5f335f66 = var_67f1ef51bb69b5f;
            var_67f1ef51bb69b5f = end_pos;
            end_pos = var_e7422a2f5f335f66;
        }
        iteration_limit = 3;
        var_56f6aa688d4977c = var_67f1ef51bb69b5f;
        var_5160014ce4ec2684 = undefined;
        var_a2d80e0c0cf75c95 = undefined;
        for (i = 0; i < iteration_limit; i++) {
            var_5160014ce4ec2684 = averagepoint([0:var_67f1ef51bb69b5f, 1:end_pos]);
            var_f67c19a5dbe2ccec = 20;
            var_a8da4fd8b61d7002 = var_5160014ce4ec2684 - (0, 0, var_f67c19a5dbe2ccec);
            trace_end = physicstrace(var_5160014ce4ec2684, var_a8da4fd8b61d7002);
            var_f49807d1d5831577 = vectordot(vectornormalize(var_67f1ef51bb69b5f - trace_end), vectornormalize(end_pos - trace_end));
            if (trace_end == var_a8da4fd8b61d7002 || abs(var_f49807d1d5831577) > 0.2) {
                end_pos = var_5160014ce4ec2684;
                var_a2d80e0c0cf75c95 = var_5160014ce4ec2684;
            } else {
                var_67f1ef51bb69b5f = var_5160014ce4ec2684;
                var_56f6aa688d4977c = trace_end;
            }
        }
        if (isdefined(var_a2d80e0c0cf75c95)) {
            var_8c522d40ce23da01 = (var_a2d80e0c0cf75c95[0], var_a2d80e0c0cf75c95[1], var_56f6aa688d4977c[2] - 1);
            var_e071eb2967f2a5b4 = physicstrace(var_8c522d40ce23da01, var_56f6aa688d4977c);
            var_e071eb2967f2a5b4 = (var_e071eb2967f2a5b4[0], var_e071eb2967f2a5b4[1], min(var_e071eb2967f2a5b4[2], var_5160014ce4ec2684[2]));
        } else {
            var_e071eb2967f2a5b4 = (var_56f6aa688d4977c[0], var_56f6aa688d4977c[1], min(var_56f6aa688d4977c[2], var_5160014ce4ec2684[2]));
        }
    } else {
        var_d71f6138568be40f = 0;
        var_827921a3c3a33294 = trace_end;
        iteration_limit = 10;
        var_77de5470517da14b = 0;
        var_bb3a6419e378030e = 15;
        while (!var_d71f6138568be40f && var_77de5470517da14b < iteration_limit) {
            var_177ffb6884c84cbb = var_177ffb6884c84cbb + var_bb3a6419e378030e;
            var_67f1ef51bb69b5f = (var_67f1ef51bb69b5f[0], var_67f1ef51bb69b5f[1], var_177ffb6884c84cbb);
            end_pos = (end_pos[0], end_pos[1], var_177ffb6884c84cbb);
            trace_end = physicstrace(var_67f1ef51bb69b5f, end_pos);
            if (distance2dsquared(trace_end, end_pos) < var_30d6320d769d3f2c) {
                var_d71f6138568be40f = 1;
            } else {
                var_827921a3c3a33294 = trace_end;
            }
            var_77de5470517da14b++;
        }
        if (istrue(var_d71f6138568be40f)) {
            var_587e797be31a4462 = var_827921a3c3a33294 + var_a5d0297b89fc7ef4 + (0, 0, var_bb3a6419e378030e);
            var_e071eb2967f2a5b4 = physicstrace(var_587e797be31a4462, var_587e797be31a4462 - (0, 0, var_bb3a6419e378030e));
        }
        /#
            if (!isdefined(var_e071eb2967f2a5b4)) {
                println("<unknown string>" + iteration_limit + "<unknown string>" + var_67f1ef51bb69b5f);
            }
        #/
    }
    return var_e071eb2967f2a5b4;
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff2
// Size: 0x30
function function_e722e0c504ced0ee(asmname, statename, params) {
    self notify("agent_scene_stop");
    self clearoverridearchetype("animscript");
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5029
// Size: 0x54
function function_f1e58f7103a22462() {
    /#
        wait(0.05);
        println("<unknown string>" + self.origin);
        if (getdvarint(@"hash_60bc1b675216e3d")) {
            while (1) {
                print3d(self.origin, "<unknown string>");
                wait(0.05);
            }
        }
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5084
// Size: 0x59
function function_7f518689b97303ed(traverse) {
    /#
        return traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>";
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50e4
// Size: 0x208
function function_12534104fbe54e32() {
    /#
        println("<unknown string>");
        foreach (t in getnodearray("<unknown string>", "<unknown string>")) {
            if (!function_7f518689b97303ed(t.animscript)) {
                continue;
            }
            s = 20;
            while (s < 280) {
                yaw = -180;
                while (yaw <= 180) {
                    var_e9db8fc3741a7e52 = [];
                    var_e9db8fc3741a7e52["<unknown string>"] = t.traverse_height_delta;
                    var_e9db8fc3741a7e52["<unknown string>"] = t.traverse_drop_height_delta;
                    var_e9db8fc3741a7e52["<unknown string>"] = yaw;
                    var_e9db8fc3741a7e52["<unknown string>"] = s;
                    if (t.animscript == "<unknown string>") {
                        var_e9db8fc3741a7e52["<unknown string>"] = length2d(t.across_delta);
                    }
                    alias = level namespace_814214ba854030e6::selectanim(t.animscript, var_e9db8fc3741a7e52, 0);
                    if (alias == "<unknown string>") {
                        var_442c5cf82fe1c374 = "<unknown string>";
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + t.animscript;
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + t.origin;
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + t.traverse_height_delta;
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + t.traverse_drop_height_delta;
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + s;
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + yaw;
                        if (t.animscript == "<unknown string>") {
                            var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>" + length2d(t.across_delta);
                        }
                        var_442c5cf82fe1c374 = var_442c5cf82fe1c374 + "<unknown string>";
                        println(var_442c5cf82fe1c374);
                    }
                    yaw = yaw + 15;
                }
                waitframe();
                s = s + 10;
            }
        }
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f3
// Size: 0x114
function function_97003d3ab21d621f() {
    /#
        while (1) {
            waitframe();
            if (getdvarint(@"hash_c67513927ea56f3a", 0) <= 0) {
                continue;
            }
            var_a44082f7607725b9 = getdvarint(@"hash_a83f59607205c9c0", 0) > 0;
            foreach (t in getallnodes()) {
                if (isdefined(t.type) && t.type == "<unknown string>" && isdefined(t.traverse_height)) {
                    var_e071eb2967f2a5b4 = t.origin + t.apex_delta;
                    if (var_a44082f7607725b9) {
                        recordsphere(var_e071eb2967f2a5b4, 15, (0.2, 1, 0));
                    } else {
                        sphere(var_e071eb2967f2a5b4, 15, (0.2, 1, 0));
                    }
                }
            }
        }
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x540e
// Size: 0x493
function private function_2bbb4d05ad09c81e() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_e42ac6b1ddb1188e", 0);
        while (1) {
            if (getdvarint(@"hash_e42ac6b1ddb1188e", 0) <= 0) {
                waitframe();
                continue;
            }
            break;
        }
        while (!isalive(level.players[0])) {
            waitframe();
        }
        var_c22f0f91887e7488 = spawnstruct();
        var_c22f0f91887e7488.var_32f7f51bf9417f40 = [];
        var_c22f0f91887e7488.var_d1debc37b000d65d = [];
        level childthread function_25f6ff1e2f38d5a(var_c22f0f91887e7488);
        iprintlnbold("<unknown string>");
        var_b6362fe16b6d1c59 = 0;
        var_cad470dc9521c3b3 = function_47ac2016d8dbf2c5(var_b6362fe16b6d1c59);
        var_cad470dc9521c3b3 = {origin:getclosestpointonnavmesh(var_cad470dc9521c3b3.origin)};
        var_c52c258b548af58d = 0;
        while (isdefined(var_cad470dc9521c3b3)) {
            var_4b5523fa148a15c9 = undefined;
            var_3bbd592cb0b58f64 = [];
            foreach (var_80847fa4c21ff44b in var_c22f0f91887e7488.var_32f7f51bf9417f40) {
                var_5ad30512ab225696 = 0;
                dist = distance(var_cad470dc9521c3b3.origin, var_80847fa4c21ff44b.origin);
                if (dist > 4000) {
                    continue;
                }
                if (is_equal(var_4b5523fa148a15c9, var_80847fa4c21ff44b.var_3fb944fa54fe4518)) {
                    var_5ad30512ab225696 = 1;
                } else if (!var_5ad30512ab225696) {
                    var_59be945b7442f9c1 = findpathcustom(var_cad470dc9521c3b3.origin, var_80847fa4c21ff44b.origin);
                    var_5ad30512ab225696 = function_b391661c3185e255(var_59be945b7442f9c1, var_80847fa4c21ff44b.origin);
                    if (var_5ad30512ab225696) {
                        var_59be915b7442f328 = findpathcustom(var_80847fa4c21ff44b.origin, var_cad470dc9521c3b3.origin);
                        var_5ad30512ab225696 = function_b391661c3185e255(var_59be915b7442f328, var_cad470dc9521c3b3.origin);
                    }
                }
                if (var_5ad30512ab225696) {
                    var_4b5523fa148a15c9 = isdefined(var_4b5523fa148a15c9) ? var_80847fa4c21ff44b.var_3fb944fa54fe4518 : var_4b5523fa148a15c9;
                    var_4b5523fa148a15c9 = min(var_4b5523fa148a15c9, var_80847fa4c21ff44b.var_3fb944fa54fe4518);
                    var_3bbd592cb0b58f64[var_3bbd592cb0b58f64.size] = var_80847fa4c21ff44b;
                }
            }
            foreach (var_80847fa4c21ff44b in var_3bbd592cb0b58f64) {
                var_80847fa4c21ff44b.var_3fb944fa54fe4518 = int(var_4b5523fa148a15c9);
            }
            var_c22f0f91887e7488.var_32f7f51bf9417f40[var_c22f0f91887e7488.var_32f7f51bf9417f40.size] = var_cad470dc9521c3b3;
            if (!isdefined(var_4b5523fa148a15c9)) {
                var_cad470dc9521c3b3.var_3fb944fa54fe4518 = int(var_c52c258b548af58d);
                var_c52c258b548af58d++;
            } else {
                var_cad470dc9521c3b3.var_3fb944fa54fe4518 = int(var_4b5523fa148a15c9);
            }
            var_b6362fe16b6d1c59++;
            var_cad470dc9521c3b3 = function_47ac2016d8dbf2c5(var_b6362fe16b6d1c59);
            if (isdefined(var_cad470dc9521c3b3)) {
                var_cad470dc9521c3b3 = {origin:getclosestpointonnavmesh(var_cad470dc9521c3b3.origin)};
            }
            if (var_b6362fe16b6d1c59 % 150 == 0) {
                waitframe();
            }
        }
        foreach (var_cad470dc9521c3b3 in var_c22f0f91887e7488.var_32f7f51bf9417f40) {
            var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518] = isdefined(var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518]) ? 0 : var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518];
            var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518] = var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518] + 1;
        }
        waitframe();
        logstring("<unknown string>");
        foreach (var_cad470dc9521c3b3 in var_c22f0f91887e7488.var_32f7f51bf9417f40) {
            if (is_equal(var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518], 1)) {
                logstring("<unknown string>" + var_cad470dc9521c3b3.origin);
            }
        }
        iprintlnbold("<unknown string>");
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x58a8
// Size: 0x43
function private function_b391661c3185e255(path, end_point) {
    /#
        if (isdefined(path) && path.size > 0) {
            dist = distance(path[path.size - 1], end_point);
            return (dist < 10);
        }
        return 0;
    #/
}

// Namespace asm/namespace_bf5a1761a8d1bb07
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x58f2
// Size: 0x234
function private function_25f6ff1e2f38d5a(var_c22f0f91887e7488) {
    /#
        var_9a3849d89286b99c = [];
        var_1981b06c7fa79440 = int(ceil(1 / level.framedurationseconds));
        while (1) {
            if (getdvarint(@"hash_e42ac6b1ddb1188e", 0) <= 0) {
                waitframe();
                continue;
            }
            foreach (var_cad470dc9521c3b3 in var_c22f0f91887e7488.var_32f7f51bf9417f40) {
                if (!isdefined(var_9a3849d89286b99c[var_cad470dc9521c3b3.var_3fb944fa54fe4518])) {
                    var_9a3849d89286b99c[var_cad470dc9521c3b3.var_3fb944fa54fe4518] = (randomfloat(1), randomfloat(1), randomfloat(1));
                }
                col = var_9a3849d89286b99c[var_cad470dc9521c3b3.var_3fb944fa54fe4518];
                alpha = 1;
                if (isdefined(var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518])) {
                    if (var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518] == 1) {
                        line(var_cad470dc9521c3b3.origin, var_cad470dc9521c3b3.origin + (0, 0, 4000), col, undefined, 0, var_1981b06c7fa79440);
                        sphere(var_cad470dc9521c3b3.origin + (0, 0, 4000), 500, col, 1, var_1981b06c7fa79440);
                        goto LOC_000001d0;
                    }
                    jumpiffalse(var_c22f0f91887e7488.var_d1debc37b000d65d[var_cad470dc9521c3b3.var_3fb944fa54fe4518] > 50) LOC_000001d0;
                    alpha = 0.5;
                    jumpiffalse(distance(var_cad470dc9521c3b3.origin, level.players[0].origin) > 2000) LOC_000001d0;
                } else {
                LOC_000001d0:
                    sphere(var_cad470dc9521c3b3.origin, 20, col, 0, var_1981b06c7fa79440);
                    print3d(var_cad470dc9521c3b3.origin + (0, 0, 10), "<unknown string>" + var_cad470dc9521c3b3.var_3fb944fa54fe4518, col, alpha, undefined, var_1981b06c7fa79440);
                }
            }
            wait(1);
        }
    #/
}

