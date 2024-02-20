// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\soldier\arrival.gsc;
#using scripts\asm\soldier\move.gsc;
#using scripts\anim\animselector.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\traverse.gsc;
#using script_7e4d332e911e1b90;
#using scripts\asm\soldier\cover.gsc;

#namespace traverse;

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x40c
// Size: 0x1d6
function playtraverseanim_deprecated(asmname, statename, params) {
    self endon("death");
    self endon("terminate_ai_threads");
    checktraverse(statename);
    traverseanim = asm_getanim(asmname, statename);
    traversexanim = asm_getxanim(statename, traverseanim);
    self.desired_anim_pose = "crouch";
    namespace_f87a4b6569ce73b2::updateanimpose();
    self endon("killanimscript");
    self animmode("noclip");
    startnode = self getnegotiationstartnode();
    /#
        assert(isdefined(startnode));
    #/
    self orientmode("face angle", startnode.angles[1]);
    startnode.traverse_height = startnode.origin[2] + startnode.traverse_height_delta;
    var_4587095419257a6e = startnode.traverse_height - startnode.origin[2];
    thread teleportthread(var_4587095419257a6e - params);
    blendtime = 0.15;
    self aisetanim(statename, traverseanim);
    var_22943623b8e97c62 = 0.2;
    var_1e0f9ec2ac420034 = 0.2;
    thread traverse_donotetracks(asmname, statename);
    if (!animhasnotetrack(traversexanim, "gravity on")) {
        var_cc694b7fbbf6503c = 1.23;
        wait(var_cc694b7fbbf6503c - var_22943623b8e97c62);
        self animmode("gravity");
        wait(var_22943623b8e97c62);
    } else {
        self waittillmatch("traverse", "gravity on");
        self animmode("gravity");
        if (!animhasnotetrack(traversexanim, "blend")) {
            wait(var_22943623b8e97c62);
        } else {
            self waittillmatch("traverse", "blend");
        }
    }
    terminatetraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e9
// Size: 0x94
function playtraverseanim(asmname, statename, params) {
    traverseanim = asm_getanim(asmname, statename);
    checktraverse(statename);
    self animmode("noclip");
    startnode = self getnegotiationstartnode();
    /#
        assert(isdefined(startnode));
    #/
    self orientmode("face angle", startnode.angles[1]);
    self aisetanim(statename, traverseanim);
    asm_donotetracks(asmname, statename);
    terminatetraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x684
// Size: 0x301
function playtraverseanim_doublejump(asmname, statename, params) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(statename + "_finished");
    var_3016b22139446579 = getdvarint(@"hash_db3bdaface7c82ec", 0);
    if (var_3016b22139446579 != 3 && var_3016b22139446579 != 4) {
        checktraverse(statename);
    }
    self.ragdoll_immediate = 1;
    start_node = self getnegotiationstartnode();
    var_e14ac44f6f147496 = self getnegotiationendpos();
    start_node.traverse_height = start_node.origin[2] + start_node.traverse_height_delta - 44;
    var_559df5f9875a294e = [];
    if (start_node.traverse_height > var_e14ac44f6f147496[2]) {
        var_444c050f4f499268 = (start_node.origin[0] + var_e14ac44f6f147496[0]) * 0.5;
        var_444c060f4f49949b = (start_node.origin[1] + var_e14ac44f6f147496[1]) * 0.5;
        var_559df5f9875a294e[var_559df5f9875a294e.size] = (var_444c050f4f499268, var_444c060f4f49949b, start_node.traverse_height);
        /#
            if (var_3016b22139446579 != 0) {
                jump_over_position = var_559df5f9875a294e[0];
                function_52e0db833127ec95(self.origin, jump_over_position, (128, 0, 255), 100);
                function_52e0db833127ec95(self.origin, var_e14ac44f6f147496, (128, 0, 255), 100);
            }
        #/
    }
    var_559df5f9875a294e[var_559df5f9875a294e.size] = var_e14ac44f6f147496;
    var_4c5664c0523213f2 = spawn("script_model", start_node.origin);
    var_4c5664c0523213f2 setmodel("tag_origin");
    var_4c5664c0523213f2.angles = start_node.angles;
    thread delete_on_death(var_4c5664c0523213f2);
    self orientmode("face angle", start_node.angles[1]);
    max_time = 1.63;
    /#
        if (var_3016b22139446579 == 3) {
            max_time = 0.9;
        }
    #/
    self linkto(var_4c5664c0523213f2);
    jumpanim = asm_getanim(asmname, statename);
    asm_playfacialanim(asmname, statename, asm_getxanim(jumpanim));
    self aisetanim(statename, jumpanim);
    thread traverse_donotetracks(asmname, statename);
    foreach (org in var_559df5f9875a294e) {
        move_time = max_time / var_559df5f9875a294e.size;
        var_4c5664c0523213f2 moveto(org, move_time);
        var_4c5664c0523213f2 waittill("movedone");
    }
    self notify("double_jumped");
    self unlink();
    self.ragdoll_immediate = undefined;
    var_4c5664c0523213f2 delete();
    thread terminatetraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x98c
// Size: 0x2d
function traverse_doublejump_cleanup(asmname, statename, params) {
    self unlink();
    self.ragdoll_immediate = undefined;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c0
// Size: 0x3b
function traverse_donotetracks(asmname, statename) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(statename + "_finished");
    self endon("double_jumped");
    asm_donotetracks(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa02
// Size: 0x74
function getexternaltraverseinfo(var_57ee0a2aa16ac4d4) {
    /#
        assertex(isdefined(level.scr_traverse), "level.scr_traverse must be setup properly to use custom traverses");
    #/
    /#
        assertex(isdefined(level.scr_traverse[var_57ee0a2aa16ac4d4]), "level.scr_traverse[ " + var_57ee0a2aa16ac4d4 + " ] entry not defined.");
    #/
    if (isdefined(level.scr_traverse) && isdefined(level.scr_traverse[var_57ee0a2aa16ac4d4])) {
        return level.scr_traverse[var_57ee0a2aa16ac4d4];
    } else {
        return undefined;
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa7d
// Size: 0x49
function playtraverseanim_external(asmname, statename, params) {
    /#
        assertex(utility::issp(), "Unable to find traverse in asm: " + asmname + " -- state:" + statename + ". Custom traversals not supported in non-SP");
    #/
    playtraverseanim_scaled(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xacd
// Size: 0xba
function choosetraverseanim_external(asmname, statename, params) {
    startnode = self getnegotiationstartnode();
    /#
        assert(isdefined(startnode));
    #/
    var_57ee0a2aa16ac4d4 = startnode.animscript;
    if (isdefined(level.var_2a12779877c8c257) && isdefined(level.var_2a12779877c8c257[var_57ee0a2aa16ac4d4])) {
        xanim = [[ level.var_2a12779877c8c257[var_57ee0a2aa16ac4d4] ]](asmname, statename, params);
        /#
            assert(isanimation(xanim));
        #/
        return xanim;
    }
    animinfo = getexternaltraverseinfo(var_57ee0a2aa16ac4d4);
    /#
        assert(isanimation(animinfo));
    #/
    return animinfo;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb8f
// Size: 0xa0
function playdoublejumpfinishanim(asmname, statename, params) {
    self endon(statename + "_finished");
    self animmode("noclip");
    self orientmode("face angle", self.angles[1]);
    self.useanimgoalweight = 1;
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    asm_donotetracks(asmname, statename);
    thread terminatetraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc36
// Size: 0xc8
function getdoublejumpoffsetposition(asmname, var_223efa34c2b82dc8, endpos, endangles, notetrackname) {
    var_2c8936d08f85c5c1 = asm_chooseanim(asmname, var_223efa34c2b82dc8);
    /#
        assert(isdefined(var_2c8936d08f85c5c1));
    #/
    xanim = asm_getxanim(var_223efa34c2b82dc8, var_2c8936d08f85c5c1);
    var_926d6d611f7ff7ab = getnotetracktimes(xanim, notetrackname);
    /#
        assert(isdefined(var_926d6d611f7ff7ab) && var_926d6d611f7ff7ab.size > 0);
    #/
    time = var_926d6d611f7ff7ab[0];
    var_95abccfe668f369a = getmovedelta(xanim, 0, time);
    var_f73bea4534a3831f = getangledelta(xanim, 0, time);
    return namespace_d925b2b52656868e::calcanimstartpos(endpos, endangles[1], var_95abccfe668f369a, var_f73bea4534a3831f);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd06
// Size: 0x1ab
function doublejumpneedsfinishanim(asmname, var_7130b2131fee9bda, startnode, endpos) {
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(endpos));
    #/
    /#
        if (getdvarint(@"hash_db3bdaface7c82ec", 0) == 3) {
            return 0;
        }
    #/
    deltaz = endpos[2] - startnode.origin[2];
    if (deltaz < 0) {
        return 0;
    }
    if (isdefined(startnode.jump_over_offset) && getdvarint(@"hash_db3bdaface7c82ec", 0) != 2) {
        jump_over_offset = startnode.jump_over_offset;
        angleoffset = startnode.angles - startnode.startnodeoriginalangles;
        if (angleoffset != (0, 0, 0)) {
            jump_over_offset = rotatevector(jump_over_offset, angleoffset);
        }
        jump_over_position = startnode.origin + jump_over_offset;
        var_e5e2b98a87142185 = jump_over_position[2];
        var_e5e2b98a87142185 = var_e5e2b98a87142185 - 44;
        if (endpos[2] < var_e5e2b98a87142185) {
            return 0;
        }
    }
    delta = endpos - startnode.origin;
    delta = (delta[0], delta[1], 0);
    var_f1a4d9d10fd4b365 = vectortoangles(delta);
    offsetpos = getdoublejumpoffsetposition(asmname, var_7130b2131fee9bda, endpos, var_f1a4d9d10fd4b365, "footstep_left_small");
    var_992dca4693dcc459 = offsetpos - startnode.origin;
    if (vectordot(var_992dca4693dcc459, delta) < 0) {
        return 0;
    }
    return 1;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xeb9
// Size: 0x85
function checkdoublejumpfinish(asmname, statename, var_f2b19b25d457c2a6, params) {
    startnode = gettraversalstartnode();
    if (!isdefined(startnode)) {
        thread terminatetraverse(asmname, "double_jump");
        return 0;
    }
    endpos = self getnegotiationendpos();
    /#
        assert(isdefined(endpos));
    #/
    if (!doublejumpneedsfinishanim(asmname, var_f2b19b25d457c2a6, startnode, endpos)) {
        thread terminatetraverse(asmname, "double_jump");
        return 0;
    }
    return 1;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf46
// Size: 0x20
function gettraversalstartnode() {
    if (isdefined(self.traversal_start_node)) {
        return self.traversal_start_node;
    }
    return self getnegotiationstartnode();
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6e
// Size: 0x117
function playdoublejumpmantleorvault(asmname, statename, zoffset) {
    self endon(statename + "_finished");
    startnode = gettraversalstartnode();
    /#
        assert(isdefined(startnode.doublejumpmantlepos));
    #/
    /#
        assert(isdefined(startnode));
    #/
    endpos = startnode.doublejumpmantlepos;
    /#
    #/
    delta = endpos - startnode.origin;
    delta = (delta[0], delta[1], 0);
    var_f1a4d9d10fd4b365 = vectortoangles(delta);
    jumpanim = asm_getanim(asmname, statename);
    /#
        assert(isdefined(jumpanim));
    #/
    var_7130b2131fee9bda = statename + "_finish";
    var_3b137c718ea27788 = getdoublejumpoffsetposition(asmname, var_7130b2131fee9bda, endpos, var_f1a4d9d10fd4b365, "mantle_align");
    var_3b137c718ea27788 = (var_3b137c718ea27788[0], var_3b137c718ea27788[1], var_3b137c718ea27788[2] + zoffset);
    playscaledjump(asmname, statename, jumpanim, var_3b137c718ea27788, var_f1a4d9d10fd4b365, 1, 0, 1);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x108c
// Size: 0x27
function playdoublejumpmantle(asmname, statename, params) {
    playdoublejumpmantleorvault(asmname, statename, -8);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10ba
// Size: 0x27
function playdoublejumpvault(asmname, statename, params) {
    playdoublejumpmantleorvault(asmname, statename, -42);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e8
// Size: 0x3a
function doublejumpterminate(asmname, statename, params) {
    self.useanimgoalweight = 0;
    self.jump_over_position = undefined;
    self.traversal_start_node = undefined;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1129
// Size: 0x35
function doublejumpearlyterminate(asmname, statename, params) {
    if (!asm_eventfired(asmname, "end")) {
        doublejumpterminate(asmname, statename, params);
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1165
// Size: 0x4a
function isdoublejumpanimdone(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        if (getdvarint(@"hash_db3bdaface7c82ec", 0) == 3) {
            return 0;
        }
    #/
    return asm_eventfired(asmname, "end");
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11b7
// Size: 0x3cd
function playdoublejumptraversal(asmname, statename, params) {
    self endon(statename + "_finished");
    /#
        if (getdvarint(@"hash_db3bdaface7c82ec", 0) == 4) {
            playtraverseanim_doublejump(asmname, "down", params);
            return;
        }
        if (getdvarint(@"hash_db3bdaface7c82ec", 0) == 3) {
            playtraverseanim_doublejump(asmname, statename, params);
            return;
        }
    #/
    startnode = gettraversalstartnode();
    endpos = self getnegotiationendpos();
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(endpos));
    #/
    if (!isdefined(startnode.startnodeoriginalangles)) {
        startnode.startnodeoriginalangles = startnode.angles;
    }
    angleoffset = startnode.angles - startnode.startnodeoriginalangles;
    if (angleoffset != (0, 0, 0)) {
        endpos = rotatevector(endpos, angleoffset);
    }
    jump_over_position = undefined;
    var_3016b22139446579 = getdvarint(@"hash_db3bdaface7c82ec", 0);
    if (var_3016b22139446579 != 2) {
        if (isdefined(startnode.jump_over_offset)) {
            jump_over_offset = startnode.jump_over_offset;
            if (angleoffset != (0, 0, 0)) {
                jump_over_offset = rotatevector(jump_over_offset, angleoffset);
            }
            jump_over_position = startnode.origin + jump_over_offset;
            var_e5e2b98a87142185 = jump_over_position[2];
            var_e5e2b98a87142185 = var_e5e2b98a87142185 - 44;
            if (var_e5e2b98a87142185 > endpos[2]) {
                var_444c050f4f499268 = (startnode.origin[0] + endpos[0]) * 0.5;
                var_444c060f4f49949b = (startnode.origin[1] + endpos[1]) * 0.5;
                jump_over_position = (var_444c050f4f499268, var_444c060f4f49949b, jump_over_position[2]);
            } else {
                jump_over_position = undefined;
            }
        }
    }
    jumpanim = asm_getanim(asmname, statename);
    /#
        assert(isdefined(jumpanim));
    #/
    self.jump_over_position = jump_over_position;
    /#
        if (getdvarint(@"hash_db3bdaface7c82ec", 0) != 0) {
            if (isdefined(jump_over_position)) {
                function_52e0db833127ec95(self.origin, jump_over_position, (128, 0, 255), 100);
                function_52e0db833127ec95(self.origin, endpos, (128, 0, 255), 100);
            } else {
                function_52e0db833127ec95(self.origin, endpos, (128, 255, 0), 100);
            }
        }
    #/
    var_7130b2131fee9bda = statename + "_finish";
    if (doublejumpneedsfinishanim(asmname, var_7130b2131fee9bda, startnode, endpos)) {
        delta = endpos - startnode.origin;
        delta = (delta[0], delta[1], 0);
        var_f1a4d9d10fd4b365 = vectortoangles(delta);
        var_7130b2131fee9bda = statename + "_finish";
        offsetpos = getdoublejumpoffsetposition(asmname, var_7130b2131fee9bda, endpos, var_f1a4d9d10fd4b365, "footstep_left_small");
        endpos = offsetpos;
    }
    delta = endpos - startnode.origin;
    var_4c4c6c6d3c2b086b = 0;
    animendtime = 1;
    if (delta[2] < 0) {
        var_4c4c6c6d3c2b086b = 1;
        var_c4d9c443202bf996 = getnotetracktimes(asm_getxanim(statename, jumpanim), "gravity on");
        if (isdefined(var_c4d9c443202bf996) && var_c4d9c443202bf996.size > 0) {
            animendtime = var_c4d9c443202bf996[0];
        }
    }
    delta = (delta[0], delta[1], 0);
    var_f1a4d9d10fd4b365 = vectortoangles(delta);
    playscaledjump(asmname, statename, jumpanim, endpos, var_f1a4d9d10fd4b365, animendtime, var_4c4c6c6d3c2b086b, 1);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x158b
// Size: 0xe8
function choosedoublejumpanim(asmname, statename, params) {
    endpos = self getnegotiationendpos();
    /#
        assert(isdefined(endpos));
    #/
    alias = "double_jump_up";
    if (isdefined(params)) {
        /#
            assert(params == "up" || params == "down");
        #/
        alias = "double_jump_" + params;
    } else if (endpos[2] < self.origin[2]) {
        alias = "double_jump_down";
    }
    if (self.asm.footsteps.foot == "right") {
        prefix = "right_";
    } else {
        prefix = "left_";
    }
    alias = prefix + alias;
    animname = asm_lookupanimfromalias(statename, alias);
    return animname;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167b
// Size: 0x127
function getwallnodeposition(startnode, index) {
    /#
        assert(index >= 0);
    #/
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(isdefined(startnode.wall_info.nodeoffsets));
    #/
    /#
        assert(startnode.wall_info.nodeoffsets.size > index);
    #/
    angleoffset = startnode.angles - startnode.wall_info.startnodeoriginalangles;
    if (angleoffset != (0, 0, 0)) {
        var_728d033793cea02f = rotatevector(startnode.wall_info.nodeoffsets[index], angleoffset);
        var_76a8010a974fa50e = startnode.origin + var_728d033793cea02f;
    } else {
        var_76a8010a974fa50e = startnode.origin + startnode.wall_info.nodeoffsets[index];
    }
    return var_76a8010a974fa50e;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17aa
// Size: 0x160
function shouldwallrunshoot(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    enemypos = self.enemy.origin;
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(isdefined(self.wall_run_current_node_index));
    #/
    /#
        assert(startnode.wall_info.nodeoffsets.size > self.wall_run_current_node_index + 1);
    #/
    var_32386d797e03a9b = getwallnodeposition(startnode, self.wall_run_current_node_index);
    var_5c6241c759f06574 = getwallnodeposition(startnode, self.wall_run_current_node_index + 1);
    var_5c6241c759f06574 = (var_5c6241c759f06574[0], var_5c6241c759f06574[1], var_32386d797e03a9b[2]);
    enemypos = (enemypos[0], enemypos[1], var_32386d797e03a9b[2]);
    var_51c78b431f0e5118 = vectornormalize(var_5c6241c759f06574 - var_32386d797e03a9b);
    var_b3bca3e7f11a1cce = vectornormalize(enemypos - var_32386d797e03a9b);
    dot = vectordot(var_51c78b431f0e5118, var_b3bca3e7f11a1cce);
    if (dot < 0.2588) {
        return 0;
    }
    return 1;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1912
// Size: 0x4b
function choosewallrunanim(asmname, statename, params) {
    /#
        assert(isdefined(self.wall_run_direction));
    #/
    jumpanim = asm_lookupanimfromalias(statename, self.wall_run_direction);
    return jumpanim;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1965
// Size: 0x43
function getsmoothstep(delta) {
    /#
        if (getdvarint(@"hash_dd616d5851bec943", 1) == 2) {
            return (delta * delta * delta * (delta * (delta * 6 - 15) + 10));
        }
    #/
    return delta * delta * (3 - 2 * delta);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b0
// Size: 0x178
function teleportdeltaovernumframes(statename, waittime, delta, numframes, animname, var_c08b84490b532fb2) {
    self endon(statename + "_finished");
    if (waittime > 0) {
        wait(waittime);
    }
    framedelta = delta / numframes;
    startpos = self.origin[2];
    endpos = startpos + delta[2];
    var_d7b27cf20a29d5ed = self.origin[2];
    self setanimrate(animname, var_c08b84490b532fb2);
    for (i = 0; i < numframes; i++) {
        var_3897e5e4048f4e94 = 1;
        /#
            if (getdvarint(@"hash_dd616d5851bec943", 1) == 0) {
                var_3897e5e4048f4e94 = 0;
            }
        #/
        if (var_3897e5e4048f4e94) {
            var_b1d0bc03029f6a2c = i / (numframes - 1);
            smoothstep = getsmoothstep(var_b1d0bc03029f6a2c);
            newz = endpos * smoothstep + startpos * (1 - smoothstep);
            var_bc77fc372e8358f9 = newz - var_d7b27cf20a29d5ed;
            framedelta = (framedelta[0], framedelta[1], var_bc77fc372e8358f9);
            var_d7b27cf20a29d5ed = newz;
        }
        neworigin = self.origin + framedelta;
        self forceteleport(neworigin);
        if (i + 1 < numframes) {
            waitframe();
        }
    }
    self setanimrate(animname, 1);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2f
// Size: 0x55
function function_a7808f1a33760028(dest, statename) {
    /#
        self notify("single_jump");
        self endon("single_jump");
        self endon(statename + "off");
        while (1) {
            line(self.origin, dest, (0, 255, 0));
            waitframe();
        }
    #/
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8b
// Size: 0x40
function wallrunnotehandler(note, params) {
    if (note == "start_jump") {
        thread handlejumpteleports(params);
    } else if (note == "end_mantle") {
        self animmode("gravity");
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd2
// Size: 0x38c
function handlejumpteleports(params, animtime, var_c08b84490b532fb2) {
    /#
        assert(isarray(params));
    #/
    /#
        assert(params.size == 7);
    #/
    statename = params[0];
    animname = params[1];
    desiredendpos = params[2];
    starttime = params[3];
    var_8c2c7ea3bd382df4 = params[4];
    var_4c4c6c6d3c2b086b = params[5];
    var_87ef9fdeb401c595 = params[6];
    self endon(statename + "_finished");
    animlength = getanimlength(animname);
    if (!isdefined(animtime)) {
        animtime = (gettime() - starttime) * 0.001;
    }
    var_f2b13ab0eded36c8 = animtime / animlength;
    var_cab4a622d5af2e97 = getnotetracktimes(animname, "end_jump");
    var_930caef7352c0f86 = getnotetracktimes(animname, "end_double_jump");
    if (var_930caef7352c0f86.size > 0) {
        self.wall_run_double_jumping = 1;
        var_cab4a622d5af2e97 = var_930caef7352c0f86;
    } else {
        self.wall_run_double_jumping = 0;
    }
    /#
        assert(var_cab4a622d5af2e97.size > 0);
    #/
    if (isdefined(self.jump_over_position)) {
        var_8c2c7ea3bd382df4 = (var_cab4a622d5af2e97[0] - var_f2b13ab0eded36c8) / 2 + var_f2b13ab0eded36c8;
        var_cab4a622d5af2e97[0] = var_8c2c7ea3bd382df4;
        desiredendpos = self.jump_over_position;
    }
    movedelta = getmovedelta(animname, var_f2b13ab0eded36c8, var_8c2c7ea3bd382df4);
    animendpos = self localtoworldcoords(movedelta);
    /#
        if (getdvarint(@"hash_df899f2d04257001", 0) != 0 && isdefined(self.traversal_start_node)) {
            var_44a93f09b80b3ae = distance(self.origin, animendpos);
            var_3d5c613a9500564 = distance(self.origin, desiredendpos);
            var_e37286be71cbc5cd = var_3d5c613a9500564 / var_44a93f09b80b3ae;
            if (var_e37286be71cbc5cd < 0.8 || var_e37286be71cbc5cd > 1.2) {
                println("<unknown string>" + self.traversal_start_node.origin + "<unknown string>" + animname + "<unknown string>" + var_e37286be71cbc5cd);
                println("<unknown string>" + var_44a93f09b80b3ae + "<unknown string>" + var_3d5c613a9500564);
            }
        }
    #/
    if (!isdefined(var_c08b84490b532fb2)) {
        var_c08b84490b532fb2 = 1;
    }
    if (var_87ef9fdeb401c595) {
        var_44a93f09b80b3ae = distance(self.origin, animendpos);
        var_3d5c613a9500564 = distance(self.origin, desiredendpos);
        var_c08b84490b532fb2 = var_44a93f09b80b3ae / var_3d5c613a9500564;
        if (var_c08b84490b532fb2 < 0.7) {
            var_c08b84490b532fb2 = 0.7;
        } else if (var_c08b84490b532fb2 > 1.3) {
            var_c08b84490b532fb2 = 1.3;
        }
    }
    var_4f37a7756ec2161 = desiredendpos - animendpos;
    var_e7f1395489e50fc7 = var_cab4a622d5af2e97[0] * animlength;
    var_1d68f4358ce9d989 = var_e7f1395489e50fc7 - var_f2b13ab0eded36c8 * animlength;
    var_1d68f4358ce9d989 = var_1d68f4358ce9d989 * 1 / var_c08b84490b532fb2;
    numframes = var_1d68f4358ce9d989 * 20;
    numframes = ceil(numframes);
    var_e6e3302c3fab30f3 = gettime();
    teleportdeltaovernumframes(statename, 0, var_4f37a7756ec2161, numframes, animname, var_c08b84490b532fb2);
    if (isdefined(self.jump_over_position)) {
        var_b5b8fd952b4deb49 = (gettime() - var_e6e3302c3fab30f3) * var_c08b84490b532fb2;
        var_15d48e620b386a45 = animtime + var_b5b8fd952b4deb49 * 0.001;
        self.jump_over_position = undefined;
        params[6] = 0;
        handlejumpteleports(params, var_15d48e620b386a45, var_c08b84490b532fb2);
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f65
// Size: 0x75
function getwallrunyawfromstartnode(startnode) {
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(startnode.wall_info.nodeoffsets.size >= 2);
    #/
    delta = getwallnodeposition(startnode, 1) - getwallnodeposition(startnode, 0);
    var_f1a4d9d10fd4b365 = vectortoangles(delta);
    return var_f1a4d9d10fd4b365[1];
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe2
// Size: 0xfe
function getwallrundirectionfromstartnode(startnode) {
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(startnode.wall_info.nodeoffsets.size >= 2);
    #/
    self.wall_run_current_node_index = 0;
    delta = getwallnodeposition(startnode, 1) - getwallnodeposition(startnode, 0);
    var_f1a4d9d10fd4b365 = vectortoangles(delta);
    self.wall_run_yaw = var_f1a4d9d10fd4b365[1];
    startposition = getwallnodeposition(startnode, self.wall_run_current_node_index);
    right = anglestoright(var_f1a4d9d10fd4b365);
    dir = startposition - startnode.origin;
    dot = vectordot(right, dir);
    if (dot > 0) {
        return "right";
    }
    return "left";
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e8
// Size: 0x64
function setupwallrunifneeded() {
    if (isdefined(self.wall_run_direction)) {
        return;
    }
    if (!isdefined(self.traversal_start_node)) {
        self.traversal_start_node = self getnegotiationstartnode();
    }
    /#
        assert(isdefined(self.traversal_start_node));
    #/
    startnode = self.traversal_start_node;
    self.wall_run_direction = getwallrundirectionfromstartnode(startnode);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2153
// Size: 0x13
function getwallrundirection() {
    setupwallrunifneeded();
    return self.wall_run_direction;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x216e
// Size: 0x73
function wallrunterminate(asmname, statename, params) {
    self.wall_run_current_node_index = undefined;
    self.wall_run_direction = undefined;
    self.wall_run_double_jumping = undefined;
    self.wall_run_yaw = undefined;
    self.wall_run_attach_anim = undefined;
    self setdefaultaimlimits();
    self.useanimgoalweight = 0;
    self.jump_over_position = undefined;
    self.traversal_start_node = undefined;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21e8
// Size: 0x50
function traversalorientearlyterminate(asmname, statename, params) {
    if (!asm_eventfired(asmname, "end") && !asm_eventfired(asmname, "code_move")) {
        self.traversal_start_node = undefined;
        self.wall_run_direction = undefined;
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x223f
// Size: 0x147
function playwallrunattach(asmname, statename, params) {
    self animmode("noclip");
    self orientmode("face angle", self.angles[1]);
    self.useanimgoalweight = 1;
    if (isdefined(params) && params == "shoot") {
        setupwallrunaimlimits();
    }
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    var_bf02a06228e2e48e = getnotetracktimes(xanim, "wall_contact");
    /#
        assert(isdefined(var_bf02a06228e2e48e) && var_bf02a06228e2e48e.size > 0);
    #/
    time = var_bf02a06228e2e48e[0];
    angledelta = getangledelta(xanim, 0, time);
    var_d4c3d11ec9988c73 = self.wall_run_yaw - angledelta;
    var_34a46042d4886070 = (0, var_d4c3d11ec9988c73, 0);
    self forceteleport(self.origin, var_34a46042d4886070);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238d
// Size: 0xac
function getwallattachoffsetposition(asmname) {
    animname = choosewallattachanim(asmname, "wall_run_attach");
    /#
        assert(isdefined(animname));
    #/
    var_bf02a06228e2e48e = getnotetracktimes(animname, "wall_contact");
    /#
        assert(isdefined(var_bf02a06228e2e48e) && var_bf02a06228e2e48e.size > 0);
    #/
    time = var_bf02a06228e2e48e[0];
    var_95abccfe668f369a = getmovedelta(animname, 0, time);
    var_f73bea4534a3831f = getangledelta(animname, 0, time);
    return namespace_d925b2b52656868e::calcanimstartpos(getwallnodeposition(self.traversal_start_node, 0), self.wall_run_yaw, var_95abccfe668f369a, var_f73bea4534a3831f);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2441
// Size: 0x1b7
function playwallrunenter(asmname, statename, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(startnode.wall_info.nodeoffsets.size >= 2);
    #/
    self.wall_run_current_node_index = 0;
    var_86fca619ba5c4a5 = getwallnodeposition(startnode, 0);
    delta = var_86fca619ba5c4a5 - self.origin;
    delta = (delta[0], delta[1], 0);
    var_f1a4d9d10fd4b365 = vectortoangles(delta);
    var_fec5c3566ec9f0e3 = getwallattachoffsetposition();
    self orientmode("face angle", var_f1a4d9d10fd4b365[1]);
    /#
        assert(isdefined(self.wall_run_direction));
    #/
    /#
        if (getdvarint(@"hash_df899f2d04257001", 0) != 0) {
            function_52e0db833127ec95(self.origin, var_fec5c3566ec9f0e3, (128, 0, 255), 100);
        }
    #/
    animendtime = 1;
    var_def9680d43be7384 = getnotetracktimes(xanim, "code_move");
    if (isdefined(var_def9680d43be7384) && var_def9680d43be7384.size > 0) {
        animendtime = var_def9680d43be7384[0];
    }
    playscaledjump(asmname, statename, var_2c8936d08f85c5c1, var_fec5c3566ec9f0e3, var_f1a4d9d10fd4b365, animendtime, 0, 1);
    self forceteleport(var_fec5c3566ec9f0e3, var_f1a4d9d10fd4b365);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ff
// Size: 0x111
function playscaledjump(asmname, statename, var_2c8936d08f85c5c1, var_a41fa8f1437baeae, var_f1a4d9d10fd4b365, var_8c2c7ea3bd382df4, var_4c4c6c6d3c2b086b, var_87ef9fdeb401c595) {
    self endon(statename + "_finished");
    if (!isdefined(var_8c2c7ea3bd382df4)) {
        var_8c2c7ea3bd382df4 = 1;
    }
    if (!isdefined(var_4c4c6c6d3c2b086b)) {
        var_4c4c6c6d3c2b086b = 0;
    }
    if (!isdefined(var_87ef9fdeb401c595)) {
        var_87ef9fdeb401c595 = 0;
    }
    self forceteleport(self.origin, var_f1a4d9d10fd4b365);
    self animmode("noclip");
    self orientmode("face angle", var_f1a4d9d10fd4b365[1]);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    self.useanimgoalweight = 1;
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    var_847a224d4aad486 = [0:statename, 1:xanim, 2:var_a41fa8f1437baeae, 3:gettime(), 4:var_8c2c7ea3bd382df4, 5:var_4c4c6c6d3c2b086b, 6:var_87ef9fdeb401c595];
    asm_donotetracks(asmname, statename, &wallrunnotehandler, var_847a224d4aad486);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2717
// Size: 0xb8
function choosewallattachanim(asmname, statename, params) {
    if (isdefined(self.wall_run_attach_anim)) {
        return self.wall_run_attach_anim;
    }
    aliasname = self.wall_run_direction;
    var_5babffa7f03ce512 = angleclamp180(self.wall_run_yaw - self.angles[1]);
    var_5babffa7f03ce512 = abs(var_5babffa7f03ce512);
    if (var_5babffa7f03ce512 >= 22.5) {
        if (var_5babffa7f03ce512 > 67.5) {
            aliasname = aliasname + "_90";
        } else {
            aliasname = aliasname + "_45";
        }
    }
    self.wall_run_attach_anim = asm_lookupanimfromalias(statename, aliasname);
    return self.wall_run_attach_anim;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27d7
// Size: 0x1a9
function choosewallrunenteranim(asmname, statename, params) {
    setupwallrunifneeded();
    /#
        assert(isdefined(self.wall_run_direction));
    #/
    /#
        assert(isdefined(self.traversal_start_node));
    #/
    alias = self.wall_run_direction;
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(startnode.wall_info.nodeoffsets.size >= 2);
    #/
    var_15e16054caefc232 = getwallnodeposition(startnode, 0);
    var_61045d8733281ee5 = var_15e16054caefc232[2] - self.origin[2];
    var_b15cd98e18d1a870 = 0;
    if (var_61045d8733281ee5 >= 0) {
        if (var_61045d8733281ee5 > 120) {
            var_b15cd98e18d1a870 = 1;
        }
    } else if (0 - var_61045d8733281ee5 > 240) {
        var_b15cd98e18d1a870 = 1;
    }
    if (var_b15cd98e18d1a870 == 0) {
        distsq = distancesquared(self.origin, var_15e16054caefc232);
        if (distsq > 40000) {
            var_b15cd98e18d1a870 = 1;
        }
    }
    prefix = "left_";
    if (self.asm.footsteps.foot == "right") {
        prefix = "right_";
    }
    if (var_b15cd98e18d1a870) {
        alias = prefix + "double_jump";
    } else {
        alias = prefix + "single_jump";
    }
    jumpanim = asm_lookupanimfromalias(statename, alias);
    return jumpanim;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2988
// Size: 0x48
function senddelayedevent(asmname, statename, time, event, var_775aaa9fdd143162) {
    self endon(statename + "_finished");
    wait(time);
    asm_fireevent(asmname, event);
    if (var_775aaa9fdd143162) {
        self notify(event);
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x29d7
// Size: 0xbd
function hasanotherwallrun(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.wall_run_current_node_index)) {
        return 0;
    }
    startnode = self.traversal_start_node;
    if (!isdefined(startnode)) {
        return 0;
    }
    /#
        assert(isdefined(startnode.wall_info));
    #/
    var_a3e2cf82e6f677a4 = self.wall_run_current_node_index + 2;
    if (startnode.wall_info.nodeoffsets.size <= var_a3e2cf82e6f677a4) {
        return 0;
    }
    /#
        assert(startnode.wall_info.nodeoffsets.size > var_a3e2cf82e6f677a4 + 1);
    #/
    return 1;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9c
// Size: 0x10d
function playwallruncontinue(asmname, statename, params) {
    self endon(statename + "_finished");
    startnode = self.traversal_start_node;
    self function_62004d7561fd321e();
    /#
        assert(isdefined(startnode));
    #/
    self.wall_run_current_node_index = self.wall_run_current_node_index + 2;
    /#
        assert(startnode.wall_info.nodeoffsets.size > self.wall_run_current_node_index + 1);
    #/
    endpos = getwallnodeposition(startnode, self.wall_run_current_node_index);
    var_f1a4d9d10fd4b365 = self.angles;
    if (self.wall_run_direction == "left") {
        self.wall_run_direction = "right";
    } else {
        self.wall_run_direction = "left";
    }
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    playscaledjump(asmname, statename, var_2c8936d08f85c5c1, endpos, var_f1a4d9d10fd4b365);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb0
// Size: 0xde
function getwallrunmantleposition(startnode) {
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    /#
        assert(isdefined(startnode.wall_info.mantleoffset));
    #/
    angleoffset = startnode.angles - startnode.wall_info.startnodeoriginalangles;
    if (angleoffset == (0, 0, 0)) {
        return (startnode.origin + startnode.wall_info.mantleoffset);
    }
    var_728d033793cea02f = rotatevector(startnode.wall_info.mantleoffset, angleoffset);
    return startnode.origin + var_728d033793cea02f;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c96
// Size: 0xb7
function getwallrunmantleangles(startnode) {
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    if (!isdefined(startnode.wall_info.mantleangles)) {
        return undefined;
    }
    angleoffset = startnode.angles[1] - startnode.wall_info.startnodeoriginalangles[1];
    if (angleoffset == 0) {
        return startnode.wall_info.mantleangles;
    }
    return (0, angleclamp180(startnode.wall_info.mantleangles[1] + angleoffset), 0);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d55
// Size: 0x72
function getwallruntomantletype() {
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode));
    #/
    if (!isdefined(startnode.wall_info.mantleoffset)) {
        return "none";
    }
    var_ba9d9f198faba440 = getwallrunmantleposition(startnode);
    if (var_ba9d9f198faba440[2] >= self.origin[2]) {
        return "high";
    }
    return "low";
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2dcf
// Size: 0x73
function shouldwallruntovault(asmname, statename, var_f2b19b25d457c2a6, params) {
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode));
    #/
    if (!isdefined(startnode.wall_info.bvaultover)) {
        return 0;
    }
    return startnode.wall_info.bvaultover;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4a
// Size: 0x2c1
function playwallrunloop(asmname, statename, params) {
    self endon(statename + "_finished");
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    setupwallrunaimlimits();
    loopanim = asm_getanim(asmname, statename);
    /#
        assert(isdefined(loopanim));
    #/
    var_76c92379ed351610 = asm_getxanim(statename, loopanim);
    movedelta = getmovedelta(var_76c92379ed351610);
    var_c1c17849832b0c9d = length2d(movedelta);
    /#
        assert(var_c1c17849832b0c9d > 0);
    #/
    if (!isdefined(startnode.wall_info.mantleoffset) && self.wall_run_current_node_index == startnode.wall_info.nodeoffsets.size - 2) {
        exitanim = asm_getanim(asmname, "wall_run_exit");
        /#
            assert(isdefined(exitanim));
        #/
        var_315d9a31b78a7f02 = asm_getxanim("wall_run_exit", exitanim);
        var_7a01b5ed5ca503cd = getnotetracktimes(var_315d9a31b78a7f02, "start_jump");
        /#
            assert(isdefined(var_7a01b5ed5ca503cd) && var_7a01b5ed5ca503cd.size > 0);
        #/
        var_6949f2bc98970ee0 = getanimlength(var_315d9a31b78a7f02);
        var_d56a0b3c801f0bf6 = getmovedelta(var_315d9a31b78a7f02, 0, var_7a01b5ed5ca503cd[0]);
        var_d72c308d5da52d60 = length2d(var_d56a0b3c801f0bf6);
    } else {
        var_d72c308d5da52d60 = 0;
    }
    /#
        assert(startnode.wall_info.nodeoffsets.size > self.wall_run_current_node_index + 1);
    #/
    delta = getwallnodeposition(startnode, self.wall_run_current_node_index + 1) - self.origin;
    var_bb633c459e7832b8 = length(delta);
    var_bb633c459e7832b8 = var_bb633c459e7832b8 - var_d72c308d5da52d60;
    if (var_bb633c459e7832b8 < 0) {
        var_bb633c459e7832b8 = 0;
    }
    var_aeb58353cbdd1e6d = var_bb633c459e7832b8 / var_c1c17849832b0c9d;
    animlength = getanimlength(var_76c92379ed351610);
    var_2166da624f53fb6c = animlength * var_aeb58353cbdd1e6d;
    thread senddelayedevent(asmname, statename, var_2166da624f53fb6c, "wall_run_loop_done", 1);
    var_4dac4bf2efe97c4f = vectornormalize(delta);
    self orientmode("face direction", var_4dac4bf2efe97c4f);
    thread playwallrunendsound(statename);
    self animmode("noclip");
    self aisetanim(statename, loopanim);
    asm_playfacialanim(asmname, statename, var_76c92379ed351610);
    asm_donotetracks(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3112
// Size: 0x34
function playwallrunendsound(statename) {
    self endon("death");
    if (soundexists("wallrun_end_npc")) {
        self waittill("wall_run_loop_done");
        self playsound("wallrun_end_npc");
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x314d
// Size: 0x1df
function choosewallrunexitanim(asmname, statename, params) {
    alias = self.wall_run_direction;
    endpos = self getnegotiationendpos();
    var_61045d8733281ee5 = endpos[2] - self.origin[2];
    var_b15cd98e18d1a870 = 0;
    if (var_61045d8733281ee5 >= 0) {
        if (var_61045d8733281ee5 > 120) {
            var_b15cd98e18d1a870 = 1;
        }
    } else if (0 - var_61045d8733281ee5 > 240) {
        var_b15cd98e18d1a870 = 1;
    }
    if (var_b15cd98e18d1a870 == 0) {
        distsq = distancesquared(self.origin, endpos);
        if (distsq > 46225) {
            var_b15cd98e18d1a870 = 1;
        }
    }
    if (var_b15cd98e18d1a870) {
        alias = alias + "_double";
    }
    endpos = self getnegotiationendpos();
    startnode = self.traversal_start_node;
    /#
        assert(isdefined(startnode.wall_info.nodeoffsets[startnode.wall_info.nodeoffsets.size - 1]));
    #/
    dir = self getnegotiationendpos() - getwallnodeposition(startnode, startnode.wall_info.nodeoffsets.size - 1);
    dir = (dir[0], dir[1], 0);
    dir = vectornormalize(dir);
    var_f1a4d9d10fd4b365 = vectortoangles(dir);
    var_5babffa7f03ce512 = angleclamp180(var_f1a4d9d10fd4b365[1] - self.angles[1]);
    var_5babffa7f03ce512 = abs(var_5babffa7f03ce512);
    if (var_5babffa7f03ce512 >= 22.5) {
        if (var_5babffa7f03ce512 > 67.5) {
            alias = alias + "_90";
        } else {
            alias = alias + "_45";
        }
    }
    jumpanim = asm_lookupanimfromalias(statename, alias);
    return jumpanim;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3334
// Size: 0x16f
function playwallrunexit(asmname, statename, params) {
    self endon(statename + "_finished");
    startnode = self.traversal_start_node;
    endpos = self getnegotiationendpos();
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(endpos));
    #/
    /#
        assert(isdefined(startnode.wall_info));
    #/
    var_f1a4d9d10fd4b365 = self.angles;
    var_8c2c7ea3bd382df4 = 1;
    animname = asm_getanim(asmname, statename);
    var_40aee82e33a154c3 = getnotetracktimes(animname, "ground");
    self function_62004d7561fd321e();
    if (isdefined(var_40aee82e33a154c3) && var_40aee82e33a154c3.size > 0) {
        var_8c2c7ea3bd382df4 = var_40aee82e33a154c3[0];
    } else {
        var_930caef7352c0f86 = getnotetracktimes(animname, "end_double_jump");
        if (isdefined(var_930caef7352c0f86) && var_930caef7352c0f86.size > 0) {
            var_8c2c7ea3bd382df4 = var_930caef7352c0f86[0];
        } else {
            var_cab4a622d5af2e97 = getnotetracktimes(animname, "end_jump");
            if (isdefined(var_cab4a622d5af2e97) && var_cab4a622d5af2e97.size > 0) {
                var_8c2c7ea3bd382df4 = var_cab4a622d5af2e97[0];
            }
        }
    }
    if (soundexists("wallrun_end_npc")) {
        self playsound("wallrun_end_npc");
    }
    playscaledjump(asmname, statename, animname, endpos, var_f1a4d9d10fd4b365, var_8c2c7ea3bd382df4, 1, 1);
    thread terminatewallruntraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x34aa
// Size: 0xc2
function isnotdoingwallruntransition(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self.traversal_start_node)) {
        return 0;
    }
    /#
        if (getdvarint(@"hash_df899f2d04257001", 0) != 0) {
            if (self setuptraversaltransitioncheck(asmname, statename, var_f2b19b25d457c2a6, params)) {
                thread draworigin();
                thread drawdebugline(self.traversal_start_node.origin, (0, 0, 1), (1, 0, 0));
                thread function_c529e8a46bfdb3bd(statename, self.traversal_start_node, self getnegotiationendpos());
                self.traversal_start_node = undefined;
                self.wall_run_direction = undefined;
            }
        }
    #/
    return 1;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3574
// Size: 0x56
function terminatewallruntraverse(asmname, statename) {
    self.wall_run_current_node_index = undefined;
    self.wall_run_direction = undefined;
    self.wall_run_double_jumping = undefined;
    self.wall_run_yaw = undefined;
    self.wall_run_attach_anim = undefined;
    self setdefaultaimlimits();
    terminatetraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x35d1
// Size: 0x24f
function playwallruntomantle(asmname, statename, params) {
    self endon(statename + "_finished");
    startnode = self.traversal_start_node;
    endnodepos = self getnegotiationendpos();
    /#
        assert(isdefined(startnode));
    #/
    /#
        assert(isdefined(endnodepos));
    #/
    var_4f3c80d982122657 = getwallrunmantleposition(startnode);
    if (isdefined(startnode.wall_info.bvaultover) || getwallruntomantletype() == "high") {
        mantleangles = getwallrunmantleangles(startnode);
        if (!isdefined(mantleangles)) {
            delta = endnodepos - var_4f3c80d982122657;
            delta = (delta[0], delta[1], 0);
            mantleangles = vectortoangles(delta);
        }
    } else {
        delta = var_4f3c80d982122657 - self.origin;
        delta = (delta[0], delta[1], 0);
        mantleangles = vectortoangles(delta);
    }
    var_691e59d933435353 = asm_getanim(asmname, statename);
    /#
        assert(isdefined(var_691e59d933435353));
    #/
    animlength = getanimlength(var_691e59d933435353);
    var_fa917664aea6e292 = getnotetracktimes(var_691e59d933435353, "start_mantle");
    /#
        assert(var_fa917664aea6e292.size > 0);
    #/
    var_40d329cf034e4307 = var_fa917664aea6e292[0];
    var_4f0ca52986969139 = getnotetracktimes(var_691e59d933435353, "end_mantle");
    /#
        assert(var_4f0ca52986969139.size > 0);
    #/
    var_45d80567424231ae = var_4f0ca52986969139[0];
    var_99b01baf607ed310 = getmovedelta(var_691e59d933435353, var_40d329cf034e4307, var_45d80567424231ae);
    self forceteleport(self.origin, mantleangles);
    var_6f31e626554d6ab9 = self localtoworldcoords(var_99b01baf607ed310);
    var_36166c1716b38f9b = var_6f31e626554d6ab9 - self.origin;
    var_3b137c718ea27788 = var_4f3c80d982122657 - var_36166c1716b38f9b;
    /#
        if (getdvarint(@"hash_df899f2d04257001", 0) != 0) {
            function_52e0db833127ec95(self.origin, var_3b137c718ea27788, (255, 0, 0), 100);
        }
    #/
    playscaledjump(asmname, statename, var_691e59d933435353, var_3b137c718ea27788, mantleangles, var_40d329cf034e4307, 0, 1);
    thread terminatewallruntraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3827
// Size: 0x307
function playtraversaltransition(asmname, statename, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    if (!isdefined(var_2c8936d08f85c5c1)) {
        asm_fireevent(asmname, "code_move");
        return;
    }
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    animendtime = 1;
    var_95aca96ee2618fe = undefined;
    if (getdvarint(@"hash_f13997d88562c7b5", 1) == 1) {
        var_95aca96ee2618fe = getnotetracktimes(xanim, "align");
    }
    if (!isdefined(var_95aca96ee2618fe) || var_95aca96ee2618fe.size == 0) {
        var_95aca96ee2618fe = getnotetracktimes(xanim, "code_move");
    }
    if (isdefined(var_95aca96ee2618fe) && var_95aca96ee2618fe.size > 0) {
        animendtime = var_95aca96ee2618fe[0];
    }
    var_f075350fc4be0d85 = getmovedelta(xanim, 0, animendtime);
    var_fd7c686cead623aa = getangledelta(xanim, 0, animendtime);
    var_d5a54d862aacc2 = self.traversal_start_node;
    /#
        assert(isdefined(var_d5a54d862aacc2));
    #/
    /#
        if (getdvarint(@"hash_df899f2d04257001", 0) != 0 && self.traversal_start_node.animscript == "<unknown string>") {
            thread draworigin();
            thread drawdebugline(var_d5a54d862aacc2.origin, (0, 0, 1), (1, 0, 0));
            thread function_c529e8a46bfdb3bd(statename, self.traversal_start_node, self getnegotiationendpos());
        }
    #/
    var_228c1f2f3a2d92f1 = getanimlength(xanim) * animendtime;
    var_64366dd6eea5221d = int(ceil(var_228c1f2f3a2d92f1 * 20));
    if (self.traversal_start_node.animscript == "wall_run") {
        var_7fe6f6537340df66 = getwallnodeposition(self.traversal_start_node, 0) - self.origin;
        var_71ab5f95b941ad8d = vectortoangles(var_7fe6f6537340df66);
        desiredyaw = var_71ab5f95b941ad8d[1];
    } else {
        var_4e68f5990e21a5ed = self getnegotiationendpos() - self.traversal_start_node.origin;
        var_4e68f5990e21a5ed = (var_4e68f5990e21a5ed[0], var_4e68f5990e21a5ed[1], 0);
        var_f1a4d9d10fd4b365 = vectortoangles(var_4e68f5990e21a5ed);
        desiredyaw = var_f1a4d9d10fd4b365[1];
    }
    var_641c7b140664d9d3 = namespace_d925b2b52656868e::calcanimstartpos(var_d5a54d862aacc2.origin, desiredyaw, var_f075350fc4be0d85, var_fd7c686cead623aa);
    arrivalyaw = desiredyaw - var_fd7c686cead623aa;
    self.a.arrivalasmstatename = statename;
    self.useanimgoalweight = 1;
    self startcoverarrival(var_641c7b140664d9d3, arrivalyaw, var_64366dd6eea5221d);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3b35
// Size: 0x127
function choosetraversaltransition(asmname, statename, params) {
    approachdir = anglestoforward(self.angles);
    var_98309fe48684a69 = vectortoangles(approachdir);
    if (self.traversal_start_node.animscript == "wall_run") {
        var_f1a4d9d10fd4b365 = vectortoangles(getwallnodeposition(self.traversal_start_node, 0) - self.origin);
    } else {
        var_4e68f5990e21a5ed = self getnegotiationendpos() - self.traversal_start_node.origin;
        var_4e68f5990e21a5ed = (var_4e68f5990e21a5ed[0], var_4e68f5990e21a5ed[1], 0);
        var_f1a4d9d10fd4b365 = vectortoangles(var_4e68f5990e21a5ed);
    }
    desiredyaw = var_f1a4d9d10fd4b365[1];
    anglediff = angleclamp180(desiredyaw - var_98309fe48684a69[1]);
    angleindex = getangleindex(anglediff, 22.5);
    var_9b9c0392fa49456d = getstopanims(asmname, statename, undefined, 1);
    if (!isdefined(var_9b9c0392fa49456d[angleindex])) {
        return undefined;
    }
    return var_9b9c0392fa49456d[angleindex];
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3c64
// Size: 0x59
function shouldabortwallrunattach(asmname, statename, var_f2b19b25d457c2a6, params) {
    distsq = distance2dsquared(self.origin, getwallnodeposition(self.traversal_start_node, 1));
    if (distsq < 144) {
        return 1;
    }
    return 0;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc5
// Size: 0x40
function shouldtraversetransitionto(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (var_f2b19b25d457c2a6 == self.traversal_start_node.animscript) {
        return 1;
    }
    return 0;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0d
// Size: 0x55
function istraversaltransitionsupported(animscript) {
    switch (animscript) {
    case #"hash_3083e73248cdb399":
    case #"hash_5f054fa72e77b8dd":
    case #"hash_6fc6878fd3fd1e7a":
    case #"hash_8f681d217a32aef7":
    case #"hash_d14662a6eb371af5":
        return 1;
        break;
    }
    return 0;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6a
// Size: 0x313
function shoulddotraversaltransition(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.traversal_start_node)) {
        return 0;
    }
    if (!istraversaltransitionsupported(self.traversal_start_node.animscript)) {
        return 0;
    }
    if (!self.facemotion) {
        return 0;
    }
    var_e19498e123df4d73 = undefined;
    if (self.traversal_start_node.animscript == "wall_run") {
        var_e19498e123df4d73 = getwallrundirectionfromstartnode(self.traversal_start_node);
        var_4e68f5990e21a5ed = getwallnodeposition(self.traversal_start_node, 0) - self.origin;
        var_f1a4d9d10fd4b365 = vectortoangles(var_4e68f5990e21a5ed);
    } else {
        var_4e68f5990e21a5ed = self getnegotiationendpos() - self.traversal_start_node.origin;
        var_4e68f5990e21a5ed = (var_4e68f5990e21a5ed[0], var_4e68f5990e21a5ed[1], 0);
        var_e19498e123df4d73 = vectornormalize(var_4e68f5990e21a5ed);
        var_f1a4d9d10fd4b365 = vectortoangles(var_e19498e123df4d73);
    }
    var_d9bfc18f40907748 = var_f1a4d9d10fd4b365[1];
    approachdir = anglestoforward(self.angles);
    var_98309fe48684a69 = vectortoangles(approachdir);
    anglediff = angleclamp180(var_d9bfc18f40907748 - var_98309fe48684a69[1]);
    angleindex = getangleindex(anglediff, 22.5);
    var_9b9c0392fa49456d = getstopanims(asmname, var_f2b19b25d457c2a6, undefined, 1);
    stopanim = var_9b9c0392fa49456d[angleindex];
    if (!isdefined(stopanim)) {
        return 0;
    }
    animendtime = 1;
    var_95aca96ee2618fe = undefined;
    if (getdvarint(@"hash_f13997d88562c7b5", 1) == 1) {
        var_95aca96ee2618fe = getnotetracktimes(stopanim, "align");
    }
    if (!isdefined(var_95aca96ee2618fe) || var_95aca96ee2618fe.size == 0) {
        var_95aca96ee2618fe = getnotetracktimes(stopanim, "code_move");
    }
    if (isdefined(var_95aca96ee2618fe) && var_95aca96ee2618fe.size > 0) {
        animendtime = var_95aca96ee2618fe[0];
    }
    var_f075350fc4be0d85 = getmovedelta(stopanim, 0, animendtime);
    var_fd7c686cead623aa = getangledelta(stopanim, 0, animendtime);
    var_d49262ab30e7c20 = distance2d(self.origin, self.traversal_start_node.origin);
    var_4e851016ecec5294 = length(var_f075350fc4be0d85);
    delta = var_d49262ab30e7c20 - var_4e851016ecec5294;
    if (delta < 0) {
        var_2418c08254d8b1f6 = anglestoforward(var_f1a4d9d10fd4b365);
        dot = vectordot(approachdir, var_2418c08254d8b1f6);
        if (dot > 0.707) {
            if (abs(delta) > 10) {
                return 0;
            }
        } else if (abs(delta) > 64) {
            return 0;
        }
    } else if (delta > 10) {
        return 0;
    }
    if (self.traversal_start_node.animscript == "wall_run") {
        self.wall_run_direction = var_e19498e123df4d73;
    }
    return 1;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4085
// Size: 0x2f
function handlewallrunattachnotetrack(note) {
    if (note == "wall_contact") {
        if (soundexists("wallrun_start_npc")) {
            self playsound("wallrun_start_npc");
        }
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40bb
// Size: 0x2f
function setupwallrunaimlimits() {
    self.upaimlimit = -89;
    self.downaimlimit = 45;
    self.rightaimlimit = -90;
    self.leftaimlimit = 90;
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x40f1
// Size: 0x71
function drawdebugline(pos, normal, color) {
    /#
        self notify("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        lineend = pos + normal * 100;
        while (1) {
            line(pos, lineend, color, 1, 1, 1);
            wait(0.05);
        }
    #/
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4169
// Size: 0x3e
function function_52e0db833127ec95(from, to, color, duration) {
    /#
        if (!isdefined(duration)) {
            duration = 5;
        }
        line(from, to, color, 1, 1, duration);
    #/
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41ae
// Size: 0x9c
function draworigin() {
    /#
        self notify("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        color = (0, 0, 1);
        normal = (0, 0, 1);
        while (1) {
            pos = self.origin;
            lineend = pos + normal * 100;
            line(pos, lineend, color, 1, 1, 1);
            wait(0.05);
        }
    #/
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4251
// Size: 0x12b
function function_c529e8a46bfdb3bd(statename, startnode, endpos) {
    /#
        var_d6c2c3334e02123f = (0, 1, 0);
        var_d6c2c4334e021472 = (0, 0, 1);
        color = var_d6c2c3334e02123f;
        line(startnode.origin, getwallnodeposition(startnode, 0), color, 1, 1, 300);
        currentpos = startnode.origin;
        for (i = 0; i < startnode.wall_info.nodeoffsets.size - 1; i++) {
            if (i % 2 == 0) {
                color = var_d6c2c4334e021472;
            } else {
                color = var_d6c2c3334e02123f;
            }
            currentpos = getwallnodeposition(startnode, i);
            line(currentpos, getwallnodeposition(startnode, i + 1), color, 1, 1, 300);
            currentpos = getwallnodeposition(startnode, i + 1);
            if (i % 2 == 0) {
                color = var_d6c2c3334e02123f;
            } else {
                color = var_d6c2c4334e021472;
            }
        }
        line(currentpos, endpos, color, 1, 1, 300);
    #/
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4383
// Size: 0x43e
function playtraverseanim_ladder(asmname, statename, params) {
    self endon(statename + "_finished");
    self function_148259b5edf82f38(1);
    startnode = self getnegotiationstartnode();
    endpos = self getnegotiationendpos();
    /#
        assert(isdefined(startnode));
    #/
    self animmode("noclip", 0);
    self orientmode("face angle", startnode.angles[1]);
    starttoend = endpos - startnode.origin;
    demeanor = asm_getdemeanor();
    var_451f10c8ea3f02b7 = undefined;
    var_f3fa34446bde31bf = undefined;
    var_5af16561805a75b1 = undefined;
    var_571103a8a150fca9 = 0;
    if (starttoend[2] > 0) {
        var_91866250667c6232 = "off_" + demeanor;
        var_5af16561805a75b1 = asm_lookupanimfromaliasifexists(statename, var_91866250667c6232);
        if (!isdefined(var_5af16561805a75b1)) {
            if (!isdefined(startnode.traverse_drop_height_delta) || startnode.traverse_drop_height_delta < 6) {
                var_5af16561805a75b1 = asm_lookupanimfromalias(statename, "off");
            } else if (startnode.traverse_drop_height_delta < 36) {
                var_5af16561805a75b1 = asm_lookupanimfromalias(statename, "off_low");
                var_571103a8a150fca9 = 1;
            } else if (startnode.traverse_drop_height_delta < 60) {
                var_5af16561805a75b1 = asm_lookupanimfromalias(statename, "off_mid");
                var_571103a8a150fca9 = 1;
            } else {
                var_5af16561805a75b1 = asm_lookupanimfromalias(statename, "off_high");
                var_571103a8a150fca9 = 1;
            }
        }
        var_451f10c8ea3f02b7 = asm_lookupanimfromalias(statename, "up");
    } else {
        var_54f97b63ffa98208 = "on_" + demeanor;
        var_5af16561805a75b1 = asm_lookupanimfromaliasifexists(statename, var_54f97b63ffa98208);
        if (!isdefined(var_5af16561805a75b1)) {
            var_f3fa34446bde31bf = asm_lookupanimfromalias(statename, "on");
        }
        var_451f10c8ea3f02b7 = asm_lookupanimfromalias(statename, "down");
    }
    rate = 1;
    if (isdefined(self.moveplaybackrate)) {
        rate = self.moveplaybackrate;
    }
    if (isdefined(var_f3fa34446bde31bf)) {
        self aisetanim(statename, var_f3fa34446bde31bf, rate);
        asm_donotetracks(asmname, statename);
    }
    var_2a9e077675b53676 = endpos;
    if (isdefined(var_5af16561805a75b1)) {
        var_ba9f413c71dc05c1 = asm_getxanim(statename, var_5af16561805a75b1);
        var_7e1ef9266bfb4e87 = getmovedelta(var_ba9f413c71dc05c1);
        if (var_571103a8a150fca9) {
            var_2a9e077675b53676 = startnode.traverse_height - (0, 0, 48);
        } else {
            var_2a9e077675b53676 = endpos - var_7e1ef9266bfb4e87 + (0, 0, 1);
        }
    }
    /#
        assert(isdefined(var_451f10c8ea3f02b7));
    #/
    var_29dc8002ce343a5d = var_2a9e077675b53676 - self.origin;
    if (var_29dc8002ce343a5d[2] * starttoend[2] > 0) {
        var_4e385eff4bd3affb = asm_getxanim(statename, var_451f10c8ea3f02b7);
        var_4badba7b39f1758e = getmovedelta(var_4e385eff4bd3affb);
        var_2f9556e4b32808e = var_4badba7b39f1758e[2] * rate / getanimlength(var_4e385eff4bd3affb);
        var_340de6c50aee0a47 = var_29dc8002ce343a5d[2] / var_2f9556e4b32808e;
        /#
            assert(var_340de6c50aee0a47 > 0);
        #/
        if (!isdefined(var_4e385eff4bd3affb) || !isdefined(var_4badba7b39f1758e) || !isdefined(var_2f9556e4b32808e) || !isdefined(var_340de6c50aee0a47)) {
            var_38548703ea2bdadc = function_2285421dfc79c4d5();
            var_6af018c22f5f179f = self.basearchetype;
            /#
                println("<unknown string>" + var_451f10c8ea3f02b7 + "<unknown string>" + var_38548703ea2bdadc + "<unknown string>" + statename + "<unknown string>" + var_6af018c22f5f179f + "<unknown string>");
            #/
        }
        self aisetanim(statename, var_451f10c8ea3f02b7, rate);
        asm_donotetracksfortime(asmname, statename, var_340de6c50aee0a47);
    }
    if (isdefined(var_5af16561805a75b1)) {
        self aisetanim(statename, var_5af16561805a75b1, rate);
        waitframe();
        notetrackhandle = &namespace_39fbff2ac567437e::handletraversewarpnotetracks;
        self.traversestartnode = startnode;
        self.traverseendnode = self getnegotiationendnode();
        self.var_70a168924eccff58 = endpos;
        self.traversexanim = asm_getxanim(statename, var_5af16561805a75b1);
        asm_donotetracks(asmname, statename, notetrackhandle);
        self.var_70a168924eccff58 = undefined;
    }
    terminatetraverse(asmname, statename);
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x47c8
// Size: 0x58
function terminate_ladder(asmname, statename, params) {
    var_b48e997e59346e83 = !isalive(self);
    self.nogravityragdoll = var_b48e997e59346e83;
    self function_148259b5edf82f38(0);
    self.var_70a168924eccff58 = undefined;
    if (var_b48e997e59346e83) {
        self.forceragdollimmediate = 0;
    }
}

// Namespace traverse/namespace_3b7962b756121d75
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4827
// Size: 0x93
function traverse_basic(asmname, statename, params) {
    self endon(statename + "_finished");
    traverseanim = asm_getanim(asmname, statename);
    self animmode("noclip", 0);
    startnode = self getnegotiationstartnode();
    self orientmode("face angle", startnode.angles[1]);
    self aisetanim(statename, traverseanim);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    terminatetraverse(asmname, statename);
}

