// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_10b6724c15a95e8;

#namespace namespace_a5407b03b3e5f39f;

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0x51
function function_136fb87ad4393ef8() {
    if (isdefined(level.var_a5407b03b3e5f39f)) {
        return;
    }
    level.var_a5407b03b3e5f39f = spawnstruct();
    level.var_a5407b03b3e5f39f.var_8bd091e21fba9f3 = &cap_start;
    level.var_a5407b03b3e5f39f.var_55050a7cebe72181 = &function_b6af4ade50626e90;
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365
// Size: 0x14a
function cap_start(var_3e38ee41dc326fdc, animset, animscripted) {
    if (isai(self) && self isinscriptedstate()) {
        msg1 = "AI $e" + self getentitynumber() + " attempting to start CAP '" + var_3e38ee41dc326fdc + "' with Arc '" + animset + "' ";
        msg2 = "but is currently playing a scripted anim. This is not supported - you either need to avoid starting";
        var_fbf2c40df6d0d1ef = " a CAP when the AI is scripted, or first clear the scripted state using the normal method.";
        /#
            assertmsg(msg1 + msg2 + var_fbf2c40df6d0d1ef);
        #/
        return;
    }
    self.var_8f0bd1e175f2cf51 = self.origin;
    self.var_394377b94edabddf = self.angles;
    self notify("cap_start");
    if (!isai(self)) {
        self._blackboard = spawnstruct();
        self._blackboard.bfire = 0;
        function_b69db84955df12e5(var_3e38ee41dc326fdc, animset);
        return;
    } else {
        self._blackboard.var_7460b96395361857 = undefined;
    }
    /#
        assert(isalive(self) && isdefined(self.asm));
    #/
    self setoverridearchetype("animscript", animset, 0);
    self function_24eb7f77bc5e5950(var_3e38ee41dc326fdc);
    function_fb2e421e36c177a0(var_3e38ee41dc326fdc);
    if (istrue(animscripted)) {
        bb_setanimscripted();
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b6
// Size: 0x117
function function_b69db84955df12e5(var_b5da6777bfe1ace8, var_5e1ab61c2c7fe69b) {
    if (var_5e1ab61c2c7fe69b == "hero_salter" || var_5e1ab61c2c7fe69b == "farah" || var_5e1ab61c2c7fe69b == "soldier_female") {
        namespace_28edc79fcf2fe234::bb_setshort(1);
    }
    self.asmname = var_b5da6777bfe1ace8;
    if (!isdefined(self.asm)) {
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    /#
        assert(isdefined(var_5e1ab61c2c7fe69b) || isdefined(self.var_ae3ea15396b65c1f));
    #/
    if (isdefined(var_5e1ab61c2c7fe69b)) {
        self.var_ae3ea15396b65c1f = var_5e1ab61c2c7fe69b;
        self.var_6e12b535aff2899b = self.animationarchetype;
        self.animationarchetype = undefined;
    }
    self.var_1da0aaed22e00c51 = 1;
    self asminstantiate(var_b5da6777bfe1ace8);
    if (!isdefined(level.var_6fdc536a33de2d32)) {
        level.var_6fdc536a33de2d32 = [];
        level thread function_896667bf7f3ed3dc();
    }
    if (!array_contains(level.var_6fdc536a33de2d32, self)) {
        level.var_6fdc536a33de2d32[level.var_6fdc536a33de2d32.size] = self;
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0x58
function function_896667bf7f3ed3dc() {
    while (1) {
        for (var_89d86711a7226025 = 0; var_89d86711a7226025 < level.var_6fdc536a33de2d32.size; var_89d86711a7226025++) {
            var_44ad9fc1bb1ef07c = level.var_6fdc536a33de2d32[var_89d86711a7226025];
            if (isalive(var_44ad9fc1bb1ef07c)) {
                var_44ad9fc1bb1ef07c asmtick();
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x633
// Size: 0x51
function function_fb2e421e36c177a0(var_f48b8938602f359b, var_388552599bfcb74) {
    self asmterminate();
    self notify("asm_terminated");
    self.var_a709fbd9fea148f6 = undefined;
    if (!isdefined(var_388552599bfcb74)) {
        var_388552599bfcb74 = self.var_ae3ea15396b65c1f;
    }
    self [[ self.fnasm_init ]](tolower(var_f48b8938602f359b), var_388552599bfcb74);
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b
// Size: 0xf9
function function_b6af4ade50626e90() {
    if (!isai(self)) {
        self.asmname = undefined;
        self.animationarchetype = self.var_6e12b535aff2899b;
        self.var_6e12b535aff2899b = undefined;
        self.var_1da0aaed22e00c51 = undefined;
        if (array_contains(level.var_6fdc536a33de2d32, self)) {
            level.var_6fdc536a33de2d32 = array_remove(level.var_6fdc536a33de2d32, self);
        }
        return;
    }
    /#
        assert(self.asmname != self.var_a942dd31d55102c9, "Calling cap_exit when in default asm: " + self.var_a942dd31d55102c9);
    #/
    if (self.asmname == self.var_a942dd31d55102c9) {
        return;
    }
    if (bb_isanimscripted()) {
        bb_clearanimscripted();
    }
    self.var_a709fbd9fea148f6 = undefined;
    self function_73dec7a4d991183e();
    self.var_30452ad282afcd76 = undefined;
    if (isdefined(self.var_34df90223221b7a6)) {
        function_5a9987f1e5bbd641();
    }
    function_3327078daa3ecd38();
    self notify("cap_exit_completed");
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78b
// Size: 0x9e
function function_a996f137b4ef05ed() {
    self endon("entitydeleted");
    self endon("cap_exit_completed");
    if (self.team == "axis") {
        waittill_either("death", utility::function_a1260c3b5f229f69());
    } else {
        self waittill("death");
    }
    if (bb_isanimscripted()) {
        bb_clearanimscripted();
    }
    self stopanimscripted();
    self clearoverridearchetype("animscript");
    self function_24eb7f77bc5e5950(undefined);
    function_fb2e421e36c177a0(self.var_a942dd31d55102c9);
    if (isdefined(self.var_34df90223221b7a6)) {
        function_5a9987f1e5bbd641();
    }
    function_3327078daa3ecd38();
    self notify("cap_exit_completed");
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x830
// Size: 0xb6
function function_b58f0a57adf2948e(origin, var_3e38ee41dc326fdc, animset, var_9e6dcf179d658229) {
    self endon("death");
    if (isdefined(var_9e6dcf179d658229) && var_9e6dcf179d658229) {
        self.var_cc9da6f81dd0068 = self.scriptgoalpos;
        self.oldgoalradius = self.goalradius;
    }
    self setgoalpos(origin, 1);
    self waittill("goal");
    namespace_aebb27832287cd3a::cap_start(var_3e38ee41dc326fdc, animset);
    self waittill("cap_exit_completed");
    if (isdefined(self.var_cc9da6f81dd0068)) {
        self setgoalpos(self.var_cc9da6f81dd0068, self.oldgoalradius);
        self.var_cc9da6f81dd0068 = undefined;
        self.oldgoalradius = undefined;
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed
// Size: 0x92
function function_3a8bc84c604f9755() {
    msg = waittill_any_return_2("cap_reach_and_arrive", "bseq_user_deleted");
    if (isdefined(self.scriptedarrivalent)) {
        self.scriptedarrivalent delete();
    }
    if (isdefined(self.var_ddad29bbdecd1671)) {
        self.var_ddad29bbdecd1671 = undefined;
    }
    if (isdefined(msg)) {
        self finishcoverarrival("Custom");
        self clearbtgoal(1);
        if (msg == "bseq_user_deleted") {
            if (self.var_a942dd31d55102c9 != self.asmname) {
                function_b6af4ade50626e90();
            }
        }
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x986
// Size: 0x2d9
function cap_reach_and_arrive(scriptednode, var_3e38ee41dc326fdc, animset, var_26b7b68bee5a2349) {
    /#
        assert(isdefined(scriptednode.origin));
    #/
    self notify("cap_reach_and_arrive");
    self endon("cap_reach_and_arrive");
    thread function_3a8bc84c604f9755();
    self endon("bseq_user_deleted");
    if (!isdefined(self.scriptedarrivalent)) {
        self.scriptedarrivalent = spawn("script_origin", scriptednode.origin);
    }
    self.scriptedarrivalent.angles = scriptednode.angles;
    self.scriptedarrivalent.origin = scriptednode.origin;
    self.scriptedarrivalent.type = "Custom";
    var_2d3b08e66235831c = "cap_arrival";
    if (isdefined(var_26b7b68bee5a2349)) {
        var_2d3b08e66235831c = var_26b7b68bee5a2349;
    }
    var_28e3f014ae0041e6 = self.pushable;
    self.pushable = 0;
    goalpos = getclosestpointonnavmesh(scriptednode.origin, self);
    distancesq = distancesquared(goalpos, scriptednode.origin);
    if (distancesq >= 10000) {
        var_8eefcde993e5ae9d = 32;
        self setbtgoalradius(1, var_8eefcde993e5ae9d);
        self setbtgoalpos(1, scriptednode.origin);
    } else {
        var_8eefcde993e5ae9d = 4;
        self setbtgoalradius(1, var_8eefcde993e5ae9d);
        self setbtgoalpos(1, goalpos);
    }
    asm_fireephemeralevent("path_chosen", "end");
    /#
        assertex(archetypehasstate(animset, var_2d3b08e66235831c), "Cap Arc (" + animset + ") has no arrival state (" + var_2d3b08e66235831c + ")!");
    #/
    self.var_a57082fdf62bc898 = var_2d3b08e66235831c;
    self.var_33b4c07d1f388776 = animset;
    self.var_a41edf45bb0ff97 = scriptednode.angles;
    self.var_171120e99df3e286 = 1;
    self.var_ddad29bbdecd1671 = &function_e1c21b37d95134a;
    self.var_b4c85f2bc7abb407 = spawnstruct();
    self.var_b4c85f2bc7abb407.arrivalangles = scriptednode.angles;
    self.var_b4c85f2bc7abb407.asmname = var_3e38ee41dc326fdc;
    self.var_b4c85f2bc7abb407.var_74c9b1f78857273d = 0;
    self waittill("bt_goal");
    if (istrue(self.var_b4c85f2bc7abb407.var_74c9b1f78857273d)) {
        self waittill("custom_arrival_handler_done");
        self notify("lerp_arrive_finished");
    } else {
        self notify("lerp_arrive_finished");
        cap_start(var_3e38ee41dc326fdc, animset);
    }
    asm_fireephemeralevent("move", "end");
    self.pushable = var_28e3f014ae0041e6;
    self.var_b4c85f2bc7abb407 = undefined;
    self notify("cap_reach_and_arrive");
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc66
// Size: 0x11e
function private function_e1c21b37d95134a() {
    self endon("death");
    self endon("cap_exit_completed");
    /#
        assert(isdefined(self.var_b4c85f2bc7abb407));
    #/
    self.var_b4c85f2bc7abb407.var_74c9b1f78857273d = 1;
    cap_start(self.var_b4c85f2bc7abb407.asmname, self.var_33b4c07d1f388776);
    var_4900381bb16aafc0 = self asmgetcurrentstate(self.asmname);
    self asmsetstate(self.asmname, self.var_a57082fdf62bc898);
    timeouttime = gettime() + 5000;
    while (!asm_eventfired(self.asmname, "end") && gettime() < timeouttime) {
        waitframe();
    }
    if (isdefined(self.var_b4c85f2bc7abb407) && isdefined(self.var_b4c85f2bc7abb407.var_74c9b1f78857273d)) {
        self.var_b4c85f2bc7abb407.var_74c9b1f78857273d = 0;
    }
    self asmsetstate(self.asmname, var_4900381bb16aafc0);
    self notify("custom_arrival_handler_done");
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd8b
// Size: 0xa6
function function_a1ed6ae80ed92596(group) {
    /#
        assert(isarray(group));
    #/
    if (!isdefined(level.var_6961d0344027496f)) {
        level.var_6961d0344027496f = [];
    }
    var_dc40afdd39573c9a = level.var_6961d0344027496f.size;
    level.var_6961d0344027496f[var_dc40afdd39573c9a] = group;
    foreach (ent in group) {
        ent.var_34df90223221b7a6 = var_dc40afdd39573c9a;
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe38
// Size: 0x9c
function function_5a9987f1e5bbd641() {
    /#
        assert(isdefined(self.var_34df90223221b7a6) && isdefined(level.var_6961d0344027496f) && isdefined(level.var_6961d0344027496f[self.var_34df90223221b7a6]));
    #/
    level.var_6961d0344027496f[self.var_34df90223221b7a6] array_remove(level.var_6961d0344027496f[self.var_34df90223221b7a6], self);
    if (level.var_6961d0344027496f[self.var_34df90223221b7a6].size == 0) {
        array_remove(self.var_34df90223221b7a6, level.var_6961d0344027496f);
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedb
// Size: 0xdb
function function_3327078daa3ecd38() {
    if (isdefined(level.var_ba6be00a0c2658cc) && function_a6025442a4e1c649(level.var_ba6be00a0c2658cc, self)) {
        level notify("player_look_at_process");
        if (isdefined(level.var_f62b6e59c0e00d48.var_90ec46de988e0068)) {
            level.var_f62b6e59c0e00d48.var_90ec46de988e0068 = 0;
        }
        if (isdefined(level.var_ba6be00a0c2658cc)) {
            level.var_ba6be00a0c2658cc = undefined;
        }
    }
    if (isdefined(level.var_3fe0abfd459c8d0) && function_a6025442a4e1c649(level.var_3fe0abfd459c8d0, self)) {
        level notify("civilian_process_eye_look_at");
        if (isdefined(level.var_f62b6e59c0e00d48.var_c02d69c3f71770bd)) {
            level.var_f62b6e59c0e00d48.var_c02d69c3f71770bd = 0;
        }
        if (isdefined(level.var_3fe0abfd459c8d0)) {
            level.var_3fe0abfd459c8d0 = undefined;
        }
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfbd
// Size: 0x62
function function_8e7e29e55f6be1e1(var_3e38ee41dc326fdc, animset) {
    self.asmname = var_3e38ee41dc326fdc;
    if (!isdefined(self.asm)) {
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    self.var_ae3ea15396b65c1f = animset;
    self.animationarchetype = undefined;
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1026
// Size: 0x94
function function_882c76a8f1f5f9a6(states, var_b4c3697a9d2ed329) {
    self.var_f457c1616037ea52 = [];
    if (!isarray(states)) {
        states = [0:states];
    }
    foreach (state in states) {
        self.var_f457c1616037ea52[state] = 0;
    }
    if (isdefined(var_b4c3697a9d2ed329)) {
        self.var_dcf5e86549620338 = var_b4c3697a9d2ed329;
    }
}

// Namespace namespace_a5407b03b3e5f39f/namespace_aebb27832287cd3a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c1
// Size: 0x27
function function_a05f4d85f33e9eea(states) {
    if (!isarray(states)) {
        states = [0:states];
    }
    self.var_1836cd6bc75a5ce3 = states;
}

