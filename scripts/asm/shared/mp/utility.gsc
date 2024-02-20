// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\asm\shared\mp\utility.gsc;

#namespace utility;

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x373
// Size: 0x43
function dotraversal() {
    self endon("killanimscript");
    startnode = self getnegotiationstartnode();
    animscript = startnode.animscript;
    self notify("traverse_begin", animscript);
    self waittill("traverse_end");
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd
// Size: 0x1d
function chooseanimwithoverride(asmname, statename, params) {
    return 0;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x89
function loopanimfortime(asmname, statename, params) {
    self endon(statename + "_finished");
    self endon("terminate_ai_threads");
    var_6de89ac92d7fa442 = "loop_end";
    t = 2;
    if (isarray(params)) {
        if (params.size > 0) {
            t = params[0];
        }
        if (params.size > 1) {
            var_6de89ac92d7fa442 = params[1];
        }
    } else {
        t = params;
    }
    thread function_fb56c9527636713f(asmname, statename, 1);
    wait(t);
    asm_fireevent(asmname, var_6de89ac92d7fa442);
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x90
function waitforpathchange(asmname, statename) {
    self endon(statename + "_finished");
    self waittill("path_set");
    var_2920e731907ba823 = self.lookaheaddir * self.lookaheaddist;
    var_16e62139c4b7a264 = [0:0, 1:var_2920e731907ba823, 2:0, 3:self.origin, 4:self.lookaheaddist];
    asm_fireevent(asmname, "sharp_turn", var_16e62139c4b7a264);
    thread waitforpathchange(asmname, statename);
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x509
// Size: 0x87
function playmoveloop_mp(asmname, statename, params) {
    thread waitforpathchange(asmname, statename);
    rate = 1;
    if (isdefined(self.asm.moveplaybackrate)) {
        rate = self.asm.moveplaybackrate;
    } else if (isdefined(self.moveplaybackrate)) {
        rate = self.moveplaybackrate;
    }
    function_fb56c9527636713f(asmname, statename, rate);
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x597
// Size: 0x7a
function isfacingenemy(mindot) {
    if (!isdefined(mindot)) {
        mindot = 0.5;
    }
    forward = anglestoforward(self.angles);
    dirtoenemy = vectornormalize(self.enemy.origin - self.origin);
    dot = vectordot(forward, dirtoenemy);
    if (dot < mindot) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x619
// Size: 0x10
function isweaponfacingenemy() {
    if (isaimedataimtarget()) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x631
// Size: 0x16
function wantstocrouch() {
    if (bb_getrequestedstance() == "crouch") {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f
// Size: 0xa6
function function_71eefa1c0da64a21(var_63a5b32b096323be) {
    if (!istrue(self._blackboard.shootparams_valid)) {
        return undefined;
    } else if (isdefined(self._blackboard.shootparams_ent)) {
        return self._blackboard.shootparams_ent getshootatpos();
    } else if (isdefined(self._blackboard.shootparams_pos)) {
        return self._blackboard.shootparams_pos;
    } else if (isdefined(self.enemy)) {
        return self.enemy getshootatpos();
    }
    return undefined;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fd
// Size: 0xf2
function isaimedataimtarget() {
    if (!isdefined(self._blackboard.shootparams_pos) && !isdefined(self._blackboard.shootparams_ent)) {
        return 1;
    }
    var_9cbcd63169ebe6b9 = self getmuzzleangle();
    var_63a5b32b096323be = self getshootfrompos();
    shootpos = function_71eefa1c0da64a21(var_63a5b32b096323be);
    if (!isdefined(shootpos)) {
        return 0;
    }
    var_17ffbc15989cd7cb = vectortoangles(shootpos - var_63a5b32b096323be);
    var_9aff98d3936d9da1 = absangleclamp180(var_9cbcd63169ebe6b9[1] - var_17ffbc15989cd7cb[1]);
    if (var_9aff98d3936d9da1 > anim.aimyawdifffartolerance) {
        if (distancesquared(self geteye(), shootpos) > anim.aimyawdiffclosedistsq || var_9aff98d3936d9da1 > anim.aimyawdiffclosetolerance) {
        }
    }
    aimpitchdifftolerance = getaimpitchdifftolerance();
    return absangleclamp180(var_9cbcd63169ebe6b9[0] - var_17ffbc15989cd7cb[0]) <= aimpitchdifftolerance;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f7
// Size: 0x27
function getaimpitchdifftolerance() {
    if (isdefined(self.aimpitchdifftolerance)) {
        return self.aimpitchdifftolerance;
    } else {
        return anim.aimpitchdifftolerance;
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x825
// Size: 0x24
function delayslowmotion(delay, start, end, time) {
    
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x850
// Size: 0x1c
function delaymodifybasefov(delay, fov, time) {
    
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x873
// Size: 0x7a
function animscriptmp(archetype, statename, aliasname, loop, var_c08b84490b532fb2, var_fbb4259c26024712, scriptednode, tag) {
    if (isdefined(var_fbb4259c26024712)) {
        thread animscriptmp_watchcancel(var_fbb4259c26024712);
    }
    if (istrue(loop)) {
        thread animscriptmp_loop_internal(archetype, statename, aliasname, var_c08b84490b532fb2, scriptednode, tag);
    } else {
        thread animscriptmp_single_internal(archetype, statename, aliasname, var_c08b84490b532fb2, scriptednode, tag);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f4
// Size: 0x1d
function cancelanimscriptmp() {
    if (!namespace_28edc79fcf2fe234::bb_isanimscripted()) {
        return 0;
    }
    cancelanimscriptmp_internal();
    self notify("CancelAnimscriptMP");
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x918
// Size: 0x2c
function animscriptmp_watchcancel(var_fbb4259c26024712) {
    self endon("AnimscriptMP_Complete");
    self endon("death");
    self endon("CancelAnimscriptMP");
    self waittill(var_fbb4259c26024712);
    cancelanimscriptmp();
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94b
// Size: 0x98
function animscriptmp_single_internal(archetype, statename, aliasname, var_c08b84490b532fb2, var_2937b8a737595e2a, tag) {
    animscriptmp_internal(archetype, statename, aliasname, var_c08b84490b532fb2, var_2937b8a737595e2a, tag);
    var_e1940c994503c932 = isdefined(var_c08b84490b532fb2) && var_c08b84490b532fb2 == 0;
    if (!var_e1940c994503c932 && isdefined(self) && isalive(self)) {
        cancelanimscriptmp_internal();
        self notify("AnimscriptMP_Complete");
        self notify("single anim", "end");
        self notify("looping anim", "end");
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ea
// Size: 0x57
function animscriptmp_loop_internal(archetype, statename, aliasname, var_c08b84490b532fb2, var_2937b8a737595e2a, tag) {
    self endon("CancelAnimscriptMP");
    self endon("death");
    while (1) {
        animscriptmp_internal(archetype, statename, aliasname, var_c08b84490b532fb2, var_2937b8a737595e2a, tag);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa48
// Size: 0xba
function private function_7618d8f3ba2fbcea(xanim, var_2937b8a737595e2a, tag, animindex) {
    if (isdefined(tag)) {
        /#
            assert(isent(var_2937b8a737595e2a));
        #/
        startpos = var_2937b8a737595e2a gettagorigin(tag);
        startangles = var_2937b8a737595e2a gettagangles(tag);
    } else {
        startpos = var_2937b8a737595e2a.origin;
        startangles = var_2937b8a737595e2a.angles;
    }
    var_bcf9684c0529009a = getstartorigin(startpos, startangles, xanim);
    var_f20bc08c9fc211a0 = getstartangles(startpos, startangles, xanim);
    self dontinterpolate();
    self forceteleport(var_bcf9684c0529009a, var_f20bc08c9fc211a0, 9999999, 0);
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb09
// Size: 0xee
function animscriptmp_internal(archetype, statename, aliasname, var_c08b84490b532fb2, var_2937b8a737595e2a, tag) {
    self endon("CancelAnimscriptMP");
    self endon("death");
    if (!isdefined(var_c08b84490b532fb2)) {
        var_c08b84490b532fb2 = 1;
    }
    self setoverridearchetype("animscript", archetype, 1);
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = archetypegetrandomalias(archetype, statename, aliasname, asm_isfrantic());
    xanim = animsetgetanimfromindex(archetype, statename, animindex);
    if (isdefined(var_2937b8a737595e2a)) {
        function_7618d8f3ba2fbcea(xanim, var_2937b8a737595e2a, tag, animindex);
    }
    self aisetanim(statename, animindex, var_c08b84490b532fb2);
    self aisetanimrate(statename, animindex, var_c08b84490b532fb2);
    animlength = getanimlength(xanim);
    self.scripted_mode = 1;
    self.ignoreall = 1;
    if (var_c08b84490b532fb2 > 0) {
        wait(animlength / var_c08b84490b532fb2);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfe
// Size: 0x33
function cancelanimscriptmp_internal() {
    namespace_28edc79fcf2fe234::bb_clearanimscripted();
    self function_e71dd503ca60dc48();
    self clearoverridearchetype("animscript", 0, 0);
    self.scripted_mode = 0;
    self.ignoreall = 0;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc38
// Size: 0xa0
function animscripted_single(aliasname, var_1a11aea0c900b403, statename) {
    /#
        assertex(isalive(self), "animscripted_single cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    if (!isdefined(statename)) {
        statename = "animscripted";
    }
    animindex = asm_lookupanimfromalias(statename, aliasname);
    self aisetanim(statename, animindex);
    if (!isdefined(var_1a11aea0c900b403)) {
        var_1a11aea0c900b403 = 0;
    }
    if (!var_1a11aea0c900b403) {
        xanim = asm_getxanim(statename, animindex);
        if (isdefined(xanim)) {
            animlength = getanimlength(xanim);
            wait(animlength);
        }
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x66
function function_dd94e74da0ad6ead(aliasname, statename) {
    /#
        assertex(isalive(self), "animscripted_first_frame cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    if (!isdefined(statename)) {
        statename = "animscripted";
    }
    animindex = asm_lookupanimfromalias(statename, aliasname);
    self aisetanim(statename, animindex, 0);
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd4c
// Size: 0x9b
function animscripted_single_earlyend(aliasname, time) {
    /#
        assertex(isalive(self), "animscripted_single_earlyend cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    /#
        assert(time > 0);
    #/
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    self aisetanim("animscripted", animindex);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (time < animlength) {
        wait(animlength - time);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdee
// Size: 0x98
function animscripted_loop(aliasname) {
    /#
        assertex(isalive(self), "animscripted_loop cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    while (1) {
        self aisetanim("animscripted", animindex);
        wait(animlength);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0xab
function animscripted_loop_earlyend(aliasname, time) {
    /#
        assertex(isalive(self), "animscripted_loop_earlyend cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (time < animlength) {
        animlength = animlength - time;
    }
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    while (1) {
        self aisetanim("animscripted", animindex);
        wait(animlength);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf3f
// Size: 0xbe
function animscripted_loop_for_time(aliasname, time) {
    /#
        assert(time > 0);
    #/
    /#
        assertex(isalive(self), "animscripted_loop_for_time cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    timeremaining = time;
    while (timeremaining >= 0) {
        self aisetanim("animscripted", animindex);
        wait(animlength);
        timeremaining = timeremaining - animlength;
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1004
// Size: 0xae
function animscripted_loop_n_times(aliasname, var_106bda484c78a52) {
    /#
        assert(var_106bda484c78a52);
    #/
    /#
        assertex(isalive(self), "animscripted_loop_n_times cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    while (var_106bda484c78a52 > 0) {
        self aisetanim("animscripted", animindex);
        wait(animlength);
        var_106bda484c78a52--;
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10b9
// Size: 0xcc
function animscripted_loop_relative(aliasname, ent, tag) {
    self endon("death");
    /#
        assert(isdefined(ent));
    #/
    /#
        assertex(isalive(self), "animscripted_loop_n_times cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    function_7618d8f3ba2fbcea(xanim, ent, tag, animindex);
    while (1) {
        if (!istrue(self._blackboard.animscriptedactive)) {
            return;
        }
        self aisetanim("animscripted", animindex);
        animlength = getanimlength(xanim);
        wait(animlength);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118c
// Size: 0xc4
function animscripted_single_relative(aliasname, ent, tag, var_1a11aea0c900b403, statename) {
    /#
        assert(isdefined(ent));
    #/
    /#
        assertex(isalive(self), "animscripted_single_relative cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    if (!isdefined(statename)) {
        statename = "animscripted";
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias(statename, aliasname);
    xanim = asm_getxanim(statename, animindex);
    function_7618d8f3ba2fbcea(xanim, ent, tag, animindex);
    self aisetanim(statename, animindex);
    if (!isdefined(var_1a11aea0c900b403)) {
        var_1a11aea0c900b403 = 0;
    }
    if (!var_1a11aea0c900b403) {
        animlength = getanimlength(xanim);
        wait(animlength);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1257
// Size: 0x10d
function animscripted_single_arrive_at(aliasname, pos, angles, var_1a11aea0c900b403) {
    /#
        assertex(isalive(self), "animscripted_single_arrive_at cannot be used on a dead AI");
    #/
    if (!isalive(self)) {
        return;
    }
    namespace_28d7bb9fcf17949d::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    var_95abccfe668f369a = getmovedelta(xanim);
    var_8c94765ca587f86c = getangledelta3d(xanim);
    startangles = combineangles(angles, invertangles(var_8c94765ca587f86c));
    startpos = pos - rotatevector(var_95abccfe668f369a, startangles);
    self dontinterpolate();
    self forceteleport(startpos, startangles, 9999999, 0);
    self aisetanim("animscripted", animindex);
    if (!isdefined(var_1a11aea0c900b403)) {
        var_1a11aea0c900b403 = 0;
    }
    if (!var_1a11aea0c900b403) {
        animlength = getanimlength(xanim);
        wait(animlength);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136b
// Size: 0x11
function animscripted_clear() {
    namespace_28edc79fcf2fe234::bb_clearanimscripted();
    self function_e71dd503ca60dc48();
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1383
// Size: 0x5e
function function_8fa69650e33c84ef(anime) {
    if (!isdefined(level.scr_anim) || !isdefined(self.animname) || !isdefined(level.scr_anim[self.animname]) || !isdefined(level.scr_anim[self.animname][anime])) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e9
// Size: 0xf0
function function_577d8abff6067c23(anime, var_314c4455b996b224, org, var_8c94765ca587f86c, var_77afb968fbcb113) {
    self endon("death");
    if (isstring(var_77afb968fbcb113)) {
        ent_flag_set(var_77afb968fbcb113);
    }
    aliasname = level.scr_anim[self.animname][anime];
    var_a4e4b601a14ef914 = anime + "_animscripted";
    callback::callback(var_a4e4b601a14ef914, {aliasname:aliasname});
    if (isdefined(org)) {
        anim_node = spawnstruct();
        anim_node.origin = org;
        anim_node.angles = var_8c94765ca587f86c;
        namespace_aaebfc23308fe5e4::animscripted_single_relative(aliasname, anim_node);
    } else {
        namespace_aaebfc23308fe5e4::animscripted_single(aliasname);
    }
    namespace_aaebfc23308fe5e4::animscripted_clear();
    self notify(var_314c4455b996b224, "end");
    if (isstring(var_77afb968fbcb113)) {
        ent_flag_clear(var_77afb968fbcb113);
    }
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e0
// Size: 0x68
function function_8efc1cbdaa97f95e(anime) {
    spawn_anim = namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("animscripted", level.scr_anim[self.animname][anime]);
    var_298593d96e8ea = animsetgetanimfromindex(namespace_34bf5965727c0922::function_2285421dfc79c4d5(), "animscripted", spawn_anim);
    var_7d881d4e81293ae5 = getmovedelta(var_298593d96e8ea, 0, 1);
    return var_7d881d4e81293ae5;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1550
// Size: 0x68
function function_5173aedda202662(anime) {
    spawn_anim = namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("animscripted", level.scr_anim[self.animname][anime]);
    var_298593d96e8ea = animsetgetanimfromindex(namespace_34bf5965727c0922::function_2285421dfc79c4d5(), "animscripted", spawn_anim);
    var_7d881d4e81293ae5 = getangledelta(var_298593d96e8ea, 0, 1);
    return var_7d881d4e81293ae5;
}

// Namespace utility/namespace_aaebfc23308fe5e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c0
// Size: 0x7f
function ai_anim_first_frame(animation, animname) {
    var_1ed6bbc02282dd5 = "agent_scripted_" + getdvar(@"hash_687fb8f9b7a23245");
    aliasname = getanimname(animation);
    if (archetypeassetloaded(var_1ed6bbc02282dd5)) {
        thread namespace_aaebfc23308fe5e4::animscriptmp(var_1ed6bbc02282dd5, "animscripted", aliasname, undefined, 0);
    } else {
        statename = "animscripted";
        thread namespace_aaebfc23308fe5e4::function_dd94e74da0ad6ead(aliasname, statename);
    }
}

