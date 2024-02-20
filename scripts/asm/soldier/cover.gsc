// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\soldier\script_funcs.gsc;
#using scripts\anim\notetracks.gsc;

#namespace cover;

// Namespace cover/namespace_d925b2b52656868e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0x2b
function shouldcoverexpose() {
    return bb_getrequestedcoverstate() == "exposed" && isdefined(self.enemy) && isdefined(self.node);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x46
function shouldcoverexposedreload(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self.covernode) && self.balwayscoverexposed) {
        return bb_reloadrequested();
    }
    return 0;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e
// Size: 0x57
function calcanimstartpos(var_d59ce05d15358f85, var_2cdc979364d3101c, var_95abccfe668f369a, var_f73bea4534a3831f) {
    var_ce5c9b08861a4466 = var_2cdc979364d3101c - var_f73bea4534a3831f;
    angles = (0, var_ce5c9b08861a4466, 0);
    var_728d033793cea02f = rotatevector(var_95abccfe668f369a, angles);
    return var_d59ce05d15358f85 - var_728d033793cea02f;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x26
function ishighnode(node) {
    if (!isdefined(node)) {
        return 0;
    }
    if (node isvalidpeekoutdir("over")) {
        return 0;
    }
    return 1;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x56
function start_conceal_add(statename, anime, waittime) {
    self endon(statename + "_finished");
    waittime = max(waittime, 0.05);
    wait(waittime);
    self setanim(anime, 1, 0.4, 1, 1);
    thread conceal_add_cleanup(statename);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x358
// Size: 0x4b
function transitionedfromrun(asmname) {
    prevstate = self asmgetstatetransitioningfrom(asmname);
    if (isdefined(prevstate)) {
        if (prevstate == "stand_run_loop") {
            return 1;
        } else if (actor_is3d() && prevstate == "stand_run_strafe_loop") {
            return 1;
        }
    }
    return 0;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab
// Size: 0x18e
function playcoveranimloop3d(asmname, statename, params) {
    if (!isdefined(self.asm.lastcovernode)) {
        var_9f34b86d9ac843f4 = [0:namespace_28edc79fcf2fe234::bb_getcovernode(), 1:self.node];
        for (i = 0; !isdefined(self.asm.lastcovernode) && i < var_9f34b86d9ac843f4.size; i++) {
            if (isdefined(var_9f34b86d9ac843f4[i]) && distancesquared(self.origin, var_9f34b86d9ac843f4[i].origin) < 256) {
                self.asm.lastcovernode = var_9f34b86d9ac843f4[i];
            }
        }
    }
    /#
        if (isdefined(self.asm.lastcovernode)) {
            if (statename == "<unknown string>" && !nodeiscoverexposed3dtype(self.asm.lastcovernode)) {
                /#
                    assertmsg("<unknown string>" + getnodetypename(self.asm.lastcovernode));
                #/
            } else if (statename == "<unknown string>" && !nodeiscoverstand3dtype(self.asm.lastcovernode)) {
                /#
                    assertmsg("<unknown string>" + getnodetypename(self.asm.lastcovernode));
                #/
            }
        }
    #/
    playcoveranimloop(asmname, statename, params);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x540
// Size: 0x158
function playcoveranimloop(asmname, statename, params) {
    self.keepclaimednodeifvalid = 1;
    if (isdefined(params)) {
        if (params == "stickToNode") {
            covernode = namespace_28edc79fcf2fe234::bb_getcovernode();
            if (isdefined(covernode)) {
                if (distancesquared(covernode.origin, self.origin) < 16) {
                    self safeteleport(covernode.origin);
                } else {
                    thread lerpto(covernode, 4, statename + "_finished");
                }
            }
            self.keepclaimednodeifvalid = 0;
            if (transitionedfromrun(asmname)) {
                self setuseanimgoalweight(0.2);
            }
        }
    }
    if (!isagent(self)) {
        animindex = archetypegetrandomalias(self.var_ae3ea15396b65c1f, statename, "conceal_add", 0);
        covernode = bb_getcovernode();
        if (isdefined(animindex) && isdefined(covernode) && (covernode.type == "Conceal Crouch" || covernode.type == "Conceal Stand")) {
            var_b2c6a031d79506f7 = asm_getxanim(statename, animindex);
            self setanim(var_b2c6a031d79506f7, 1, 0.2, 1, 1);
            thread conceal_add_cleanup(statename);
        }
    }
    function_fb56c9527636713f(asmname, statename, 1);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0x89
function conceal_add_cleanup(statename) {
    self endon("death");
    self endon("entitydeleted");
    self notify("conceal_add_cleanup");
    self endon("conceal_add_cleanup");
    self waittill(statename + "_finished");
    if (archetypehasstate(self.var_ae3ea15396b65c1f, "knobs")) {
        anime = archetypegetalias(self.var_ae3ea15396b65c1f, "knobs", "conceal_add", 0);
        if (isdefined(anime)) {
            self clearanim(anime.anims, 0.4);
        }
    }
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f
// Size: 0x9e
function lerpto(covernode, var_2f841227a5cdde35, var_a86ac46ef036b2b6) {
    self endon(var_a86ac46ef036b2b6);
    while (1) {
        var_eda694106bcafae6 = covernode.origin - self.origin;
        var_28660e5725a496a2 = length(var_eda694106bcafae6);
        if (var_28660e5725a496a2 < var_2f841227a5cdde35) {
            self safeteleport(covernode.origin);
            break;
        }
        var_eda694106bcafae6 = var_eda694106bcafae6 / var_28660e5725a496a2;
        dest = self.origin + var_eda694106bcafae6 * var_2f841227a5cdde35;
        self safeteleport(dest);
        wait(0.05);
    }
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7d4
// Size: 0x3e
function terminatecoverreload(asmname, statename, params) {
    asm_fireephemeralevent("reload", "end");
    self function_4ea7891f787c6725();
    namespace_1a7cea57c200f504::reload_cleanup(asmname, statename, params);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x819
// Size: 0x7d
function playcoveranim_droprpg(asmname, statename, params) {
    self.keepclaimednodeifvalid = 1;
    var_d6dd63cefb3c4ee = asm_getanim(asmname, statename);
    var_66aebe1d33f3b18 = asm_getxanim(statename, var_d6dd63cefb3c4ee);
    self orientmode("face current");
    self aisetanim(statename, var_d6dd63cefb3c4ee);
    asm_playfacialanim(asmname, statename, var_66aebe1d33f3b18);
    asm_donotetracks(asmname, statename, namespace_bf5a1761a8d1bb07::asm_getnotehandler(asmname, statename));
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x89d
// Size: 0x147
function playshuffleloop(asmname, statename, params) {
    var_946cbac627c6d79d = [];
    var_946cbac627c6d79d["crouch_shuffle_right"] = -90;
    var_946cbac627c6d79d["crouch_shuffle_left"] = 90;
    var_946cbac627c6d79d["stand_shuffle_right"] = -90;
    var_946cbac627c6d79d["stand_shuffle_left"] = 90;
    self endon(statename + "_finished");
    var_6c3daa22f3c8f9c3 = asm_getanim(asmname, statename);
    var_9def5b8f72499c7f = asm_getxanim(statename, var_6c3daa22f3c8f9c3);
    self aisetanim(statename, var_6c3daa22f3c8f9c3);
    asm_playfacialanim(asmname, statename, var_9def5b8f72499c7f);
    if (isdefined(self._blackboard.shufflenode)) {
        var_7f55545f660ef1bb = self._blackboard.shufflenode.angles[1];
    } else if (isdefined(self.node)) {
        var_7f55545f660ef1bb = self.node.angles[1];
    } else {
        var_7f55545f660ef1bb = self.angles[1];
    }
    if (self.unittype != "c6" && isdefined(var_946cbac627c6d79d[statename])) {
        var_7f55545f660ef1bb = var_7f55545f660ef1bb + var_946cbac627c6d79d[statename];
    }
    self orientmode("face angle", var_7f55545f660ef1bb);
    asm_donotetracks(asmname, statename);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9eb
// Size: 0xc8
function shouldplayshuffleenter(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(self._blackboard.shufflenode));
    #/
    var_e7097d92847c054c = asm_getrandomanim(asmname, var_f2b19b25d457c2a6);
    var_fca130e132110162 = asm_getxanim(var_f2b19b25d457c2a6, var_e7097d92847c054c);
    var_f63319923b121d0 = getmovedelta(var_fca130e132110162);
    var_9e00fac7aa4e669 = lengthsquared(var_f63319923b121d0);
    disttogoalsq = distancesquared(self.origin, self._blackboard.shufflenode.origin);
    return var_9e00fac7aa4e669 <= disttogoalsq + 1;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xabb
// Size: 0x2f
function abortshufflecleanup(asmname, statename, params) {
    self._blackboard.shufflenode = undefined;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaf1
// Size: 0x2ac
function shouldbeginshuffleexit(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(self._blackboard.shufflenode));
    #/
    /#
        assert(isdefined(self.node));
    #/
    /#
        assert(self.node == self._blackboard.shufflenode);
    #/
    shufflefromnode = self.prevcovernode;
    if (!isdefined(shufflefromnode)) {
        shufflefromnode = self.covernode;
    }
    /#
        assert(isdefined(shufflefromnode));
    #/
    nodetype = self._blackboard.shufflenode.type;
    if (isdefined(nodetype) && (nodetype == "Cover Crouch" || nodetype == "Cover Crouch Window" || nodetype == "Conceal Crouch")) {
        dvarvalue = getdvar(@"hash_f72dde9792b94cc9");
        if (isdefined(self.node.covercrouchtype)) {
            nodetype = self.node.covercrouchtype;
        } else if (dvarvalue != "") {
            nodetype = dvarvalue;
        }
    }
    if (isdefined(params) && nodetype != params) {
        return 0;
    }
    exitanim = asm_getrandomanim(asmname, var_f2b19b25d457c2a6);
    var_315d9a31b78a7f02 = asm_getxanim(statename, exitanim);
    var_7b749c88c64b98dc = self._blackboard.shufflenode.origin - self.origin;
    goaldir = vectornormalize(var_7b749c88c64b98dc);
    var_d56a0b3c801f0bf6 = getmovedelta(var_315d9a31b78a7f02, 0, 1);
    var_b1151bc68af15725 = length(var_d56a0b3c801f0bf6);
    goalpos = self._blackboard.shufflenode.origin - goaldir * var_b1151bc68af15725;
    var_7b749c88c64b98dc = goalpos - self.origin;
    var_97698266774f21ac = self._blackboard.shufflenode.origin - shufflefromnode.origin;
    var_97698266774f21ac = (var_97698266774f21ac[0], var_97698266774f21ac[1], 0);
    if (vectordot(var_97698266774f21ac, var_7b749c88c64b98dc) <= 0) {
        return 1;
    }
    if (length2dsquared(self.velocity) > 1 && vectordot(goaldir, self.velocity) <= 0) {
        return 1;
    }
    return 0;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xda5
// Size: 0x1b7
function playshuffleanim_arrival(asmname, statename, params) {
    self.a.arrivalasmstatename = statename;
    arrivalanim = asm_getanim(asmname, statename);
    arrivalxanim = asm_getxanim(statename, arrivalanim);
    self aisetanim(statename, arrivalanim);
    asm_playfacialanim(asmname, statename, arrivalxanim);
    var_773bbe3e674f23b7 = getmovedelta(arrivalxanim);
    var_9e90966804914dea = getangledelta3d(arrivalxanim);
    if (isdefined(self._blackboard.shufflenode)) {
        node = self._blackboard.shufflenode;
    } else {
        node = self.node;
    }
    if (isdefined(node)) {
        desiredendpos = node.origin;
        var_611d21936599bc82 = (0, getnodeforwardyaw(node), 0);
        var_83da498ee1b4f7fb = combineangles(var_611d21936599bc82, invertangles(var_9e90966804914dea));
        var_3de691449164f7eb = node.origin - rotatevector(var_773bbe3e674f23b7, var_83da498ee1b4f7fb);
    } else {
        desiredendpos = self.origin + var_773bbe3e674f23b7;
        var_611d21936599bc82 = combineangles(self.angles, var_9e90966804914dea);
        var_3de691449164f7eb = self.origin;
        var_83da498ee1b4f7fb = self.angles;
    }
    var_6040e7eba5e09557 = int(1000 * getanimlength(arrivalxanim) - 200);
    self startcoverarrival();
    self motionwarpwithanim(var_3de691449164f7eb, var_83da498ee1b4f7fb, desiredendpos, var_611d21936599bc82, var_6040e7eba5e09557);
    asm_donotetracks(asmname, statename);
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf63
// Size: 0x49
function playshuffleanim_terminate(asmname, statename, params) {
    self._blackboard.shufflenode = undefined;
    self._blackboard.shufflefromnode = undefined;
    self finishcoverarrival();
}

// Namespace cover/namespace_d925b2b52656868e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfb3
// Size: 0x15
function coverreloadnotetrackhandler(note) {
    namespace_a4081f3d58d76916::notetrack_prefix_handler(note);
    return undefined;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfd0
// Size: 0x1e7
function cover3dpickexposedir(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(self.enemy));
    #/
    /#
        assert(isdefined(self.node));
    #/
    /#
        assert(self.node.type == "Cover 3D");
    #/
    self.bt.cover3dexposedirpicked = undefined;
    enemyeye = (self.enemy.origin + getenemyeyepos()) / 2;
    current_state = anim.asm[asmname].states[var_f2b19b25d457c2a6];
    var_eeb5ebbb83f5768d = array_randomize(current_state.transitions);
    var_d34161275b1730c1 = undefined;
    foreach (transition in var_eeb5ebbb83f5768d) {
        /#
            assert(isdefined(transition.shouldtransitionparams));
        #/
        var_d34161275b1730c1 = transition.shouldtransitionparams;
        if (var_d34161275b1730c1 == "up") {
            break;
        }
        nodeoffset = getcover3dnodeoffset(self.node, var_d34161275b1730c1);
        var_ecd488c76cf5e978 = self.node.origin + nodeoffset;
        if (sighttracepassed(var_ecd488c76cf5e978, enemyeye, 0, undefined)) {
            break;
        }
    }
    /#
        assert(isdefined(var_d34161275b1730c1));
    #/
    self.bt.cover3dexposedirpicked = asmname + "_" + var_f2b19b25d457c2a6 + "_" + var_d34161275b1730c1;
    return 1;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11bf
// Size: 0x55
function cover3dcanexposedir(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_b045478fad8648fe = asmname + "_" + statename + "_" + params;
    return var_b045478fad8648fe == self.bt.cover3dexposedirpicked;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x121c
// Size: 0xdb
function checkcovermultichangerequest(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!bb_iscovermultiswitchrequested()) {
        return 0;
    }
    covernode = namespace_28edc79fcf2fe234::bb_getcovernode();
    /#
        assert(isdefined(covernode));
    #/
    requestednodetype = bb_getrequestedcovermultiswitchnodetype();
    if (requestednodetype != params) {
        return 0;
    }
    /#
        assert(!isdefined(self.asm.covermultiswitchdata));
    #/
    self.asm.covermultiswitchdata = spawnstruct();
    self.asm.covermultiswitchdata.requestednode = covernode;
    self.asm.covermultiswitchdata.requestednodetype = requestednodetype;
    return 1;
}

// Namespace cover/namespace_d925b2b52656868e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12ff
// Size: 0x9f
function finishcovermultichangerequest(asmname, statename, params) {
    /#
        assert(isdefined(self.asm.covermultiswitchdata));
    #/
    requestednodetype = self.asm.covermultiswitchdata.requestednodetype;
    self.asm.covermultiswitchdata.requestednode setcovermultinodetype(requestednodetype);
    self.asm.covermultiswitchdata = undefined;
    self function_4ea7891f787c6725();
}

