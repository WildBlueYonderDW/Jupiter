#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\cap.gsc;

#namespace cap;

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30d
// Size: 0x50
function init_cap() {
    if (isdefined(level.cap)) {
        return;
    }
    level.cap = spawnstruct();
    level.cap.fnstart = &cap_start;
    level.cap.fnexit = &cap_exit;
}

// Namespace cap / scripts\common\cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x365
// Size: 0x149
function cap_start(capname, animset, animscripted) {
    if (isai(self) && self isinscriptedstate()) {
        msg1 = "AI $e" + self getentitynumber() + " attempting to start CAP '" + capname + "' with Arc '" + animset + "' ";
        msg2 = "but is currently playing a scripted anim. This is not supported - you either need to avoid starting";
        msg3 = " a CAP when the AI is scripted, or first clear the scripted state using the normal method.";
        assertmsg(msg1 + msg2 + msg3);
        return;
    }
    self.caporigin = self.origin;
    self.capangles = self.angles;
    self notify("cap_start");
    if (!isai(self)) {
        self._blackboard = spawnstruct();
        self._blackboard.bfire = 0;
        function_b69db84955df12e5(capname, animset);
        return;
    } else {
        self._blackboard.var_7460b96395361857 = undefined;
    }
    assert(isalive(self) && isdefined(self.asm));
    self setoverridearchetype("animscript", animset, 0);
    self function_24eb7f77bc5e5950(capname);
    function_fb2e421e36c177a0(capname);
    if (istrue(animscripted)) {
        bb_setanimscripted();
    }
}

// Namespace cap / scripts\common\cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b6
// Size: 0x116
function function_b69db84955df12e5(var_b5da6777bfe1ace8, archetypename) {
    if (archetypename == "hero_salter" || archetypename == "farah" || archetypename == "soldier_female") {
        scripts\asm\asm_bb::bb_setshort(1);
    }
    self.asmname = var_b5da6777bfe1ace8;
    if (!isdefined(self.asm)) {
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    assert(isdefined(archetypename) || isdefined(self.animsetname));
    if (isdefined(archetypename)) {
        self.animsetname = archetypename;
        self.var_6e12b535aff2899b = self.animationarchetype;
        self.animationarchetype = undefined;
    }
    self.scriptmodelcap = 1;
    self asminstantiate(var_b5da6777bfe1ace8);
    if (!isdefined(level.capscriptmodels)) {
        level.capscriptmodels = [];
        level thread function_896667bf7f3ed3dc();
    }
    if (!array_contains(level.capscriptmodels, self)) {
        level.capscriptmodels[level.capscriptmodels.size] = self;
    }
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d4
// Size: 0x57
function function_896667bf7f3ed3dc() {
    while (true) {
        for (capindex = 0; capindex < level.capscriptmodels.size; capindex++) {
            capent = level.capscriptmodels[capindex];
            if (isalive(capent)) {
                capent asmtick();
            }
        }
        wait 0.05;
    }
}

// Namespace cap / scripts\common\cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x633
// Size: 0x50
function function_fb2e421e36c177a0(var_f48b8938602f359b, var_388552599bfcb74) {
    self asmterminate();
    self notify("asm_terminated");
    self.var_a709fbd9fea148f6 = undefined;
    if (!isdefined(var_388552599bfcb74)) {
        var_388552599bfcb74 = self.animsetname;
    }
    self [[ self.fnasm_init ]](tolower(var_f48b8938602f359b), var_388552599bfcb74);
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68b
// Size: 0xf8
function cap_exit() {
    if (!isai(self)) {
        self.asmname = undefined;
        self.animationarchetype = self.var_6e12b535aff2899b;
        self.var_6e12b535aff2899b = undefined;
        self.scriptmodelcap = undefined;
        if (array_contains(level.capscriptmodels, self)) {
            level.capscriptmodels = array_remove(level.capscriptmodels, self);
        }
        return;
    }
    assert(self.asmname != self.var_a942dd31d55102c9, "Calling cap_exit when in default asm: " + self.var_a942dd31d55102c9);
    if (self.asmname == self.var_a942dd31d55102c9) {
        return;
    }
    if (bb_isanimscripted()) {
        bb_clearanimscripted();
    }
    self.var_a709fbd9fea148f6 = undefined;
    self clearcap();
    self.var_30452ad282afcd76 = undefined;
    if (isdefined(self.capgroup)) {
        function_5a9987f1e5bbd641();
    }
    function_3327078daa3ecd38();
    self notify("cap_exit_completed");
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78b
// Size: 0x9d
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
    if (isdefined(self.capgroup)) {
        function_5a9987f1e5bbd641();
    }
    function_3327078daa3ecd38();
    self notify("cap_exit_completed");
}

// Namespace cap / scripts\common\cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x830
// Size: 0xb5
function function_b58f0a57adf2948e(origin, capname, animset, var_9e6dcf179d658229) {
    self endon("death");
    if (isdefined(var_9e6dcf179d658229) && var_9e6dcf179d658229) {
        self.var_cc9da6f81dd0068 = self.scriptgoalpos;
        self.oldgoalradius = self.goalradius;
    }
    self setgoalpos(origin, 1);
    self waittill("goal");
    scripts\common\cap::cap_start(capname, animset);
    self waittill("cap_exit_completed");
    if (isdefined(self.var_cc9da6f81dd0068)) {
        self setgoalpos(self.var_cc9da6f81dd0068, self.oldgoalradius);
        self.var_cc9da6f81dd0068 = undefined;
        self.oldgoalradius = undefined;
    }
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ed
// Size: 0x91
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
                cap_exit();
            }
        }
    }
}

// Namespace cap / scripts\common\cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x986
// Size: 0x2d8
function cap_reach_and_arrive(scriptednode, capname, animset, var_26b7b68bee5a2349) {
    assert(isdefined(scriptednode.origin));
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
    arrival_state = "cap_arrival";
    if (isdefined(var_26b7b68bee5a2349)) {
        arrival_state = var_26b7b68bee5a2349;
    }
    oldpushable = self.pushable;
    self.pushable = 0;
    goalpos = getclosestpointonnavmesh(scriptednode.origin, self);
    distancesq = distancesquared(goalpos, scriptednode.origin);
    if (distancesq >= 10000) {
        goalrad = 32;
        self setbtgoalradius(1, goalrad);
        self setbtgoalpos(1, scriptednode.origin);
    } else {
        goalrad = 4;
        self setbtgoalradius(1, goalrad);
        self setbtgoalpos(1, goalpos);
    }
    asm_fireephemeralevent("path_chosen", "end");
    assertex(archetypehasstate(animset, arrival_state), "Cap Arc (" + animset + ") has no arrival state (" + arrival_state + ")!");
    self.var_a57082fdf62bc898 = arrival_state;
    self.var_33b4c07d1f388776 = animset;
    self.var_a41edf45bb0ff97 = scriptednode.angles;
    self.var_171120e99df3e286 = 1;
    self.var_ddad29bbdecd1671 = &function_e1c21b37d95134a;
    self.capdata = spawnstruct();
    self.capdata.arrivalangles = scriptednode.angles;
    self.capdata.asmname = capname;
    self.capdata.var_74c9b1f78857273d = 0;
    self waittill("bt_goal");
    if (istrue(self.capdata.var_74c9b1f78857273d)) {
        self waittill("custom_arrival_handler_done");
        self notify("lerp_arrive_finished");
    } else {
        self notify("lerp_arrive_finished");
        cap_start(capname, animset);
    }
    asm_fireephemeralevent("move", "end");
    self.pushable = oldpushable;
    self.capdata = undefined;
    self notify("cap_reach_and_arrive");
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc66
// Size: 0x11d
function private function_e1c21b37d95134a() {
    self endon("death");
    self endon("cap_exit_completed");
    assert(isdefined(self.capdata));
    self.capdata.var_74c9b1f78857273d = 1;
    cap_start(self.capdata.asmname, self.var_33b4c07d1f388776);
    initstate = self asmgetcurrentstate(self.asmname);
    self asmsetstate(self.asmname, self.var_a57082fdf62bc898);
    timeouttime = gettime() + 5000;
    while (!asm_eventfired(self.asmname, "end") && gettime() < timeouttime) {
        waitframe();
    }
    if (isdefined(self.capdata) && isdefined(self.capdata.var_74c9b1f78857273d)) {
        self.capdata.var_74c9b1f78857273d = 0;
    }
    self asmsetstate(self.asmname, initstate);
    self notify("custom_arrival_handler_done");
}

// Namespace cap / scripts\common\cap
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd8b
// Size: 0xa1
function function_a1ed6ae80ed92596(group) {
    assert(isarray(group));
    if (!isdefined(level.capgroups)) {
        level.capgroups = [];
    }
    var_dc40afdd39573c9a = level.capgroups.size;
    level.capgroups[var_dc40afdd39573c9a] = group;
    foreach (ent in group) {
        ent.capgroup = var_dc40afdd39573c9a;
    }
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe34
// Size: 0x9b
function function_5a9987f1e5bbd641() {
    assert(isdefined(self.capgroup) && isdefined(level.capgroups) && isdefined(level.capgroups[self.capgroup]));
    level.capgroups[self.capgroup] array_remove(level.capgroups[self.capgroup], self);
    if (level.capgroups[self.capgroup].size == 0) {
        array_remove(self.capgroup, level.capgroups);
    }
}

// Namespace cap / scripts\common\cap
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed7
// Size: 0xda
function function_3327078daa3ecd38() {
    if (isdefined(level.var_ba6be00a0c2658cc) && function_a6025442a4e1c649(level.var_ba6be00a0c2658cc, self)) {
        level notify("player_look_at_process");
        if (isdefined(level.var_f62b6e59c0e00d48.lookatlock)) {
            level.var_f62b6e59c0e00d48.lookatlock = 0;
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

// Namespace cap / scripts\common\cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfb9
// Size: 0x61
function cap_prop(capname, animset) {
    self.asmname = capname;
    if (!isdefined(self.asm)) {
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    self.animsetname = animset;
    self.animationarchetype = undefined;
}

// Namespace cap / scripts\common\cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1022
// Size: 0x8f
function function_882c76a8f1f5f9a6(states, var_b4c3697a9d2ed329) {
    self.resumestatetime = [];
    if (!isarray(states)) {
        states = [states];
    }
    foreach (state in states) {
        self.resumestatetime[state] = 0;
    }
    if (isdefined(var_b4c3697a9d2ed329)) {
        self.var_dcf5e86549620338 = var_b4c3697a9d2ed329;
    }
}

// Namespace cap / scripts\common\cap
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b9
// Size: 0x26
function function_a05f4d85f33e9eea(states) {
    if (!isarray(states)) {
        states = [states];
    }
    self.relativestates = states;
}

