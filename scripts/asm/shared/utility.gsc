// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\weaponlist.gsc;
#using script_35de402efc5acfb3;
#using scripts\common\ai.gsc;

#namespace utility;

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6d0
// Size: 0x8d
function chooseanimshoot(asmname, statename, params) {
    var_e592890e140b7faa = params;
    /#
        assert(isdefined(var_e592890e140b7faa));
    #/
    alias = self._blackboard.shootstate + "_" + var_e592890e140b7faa;
    if (isdefined(self._blackboard.shootstate) && asm_hasalias(statename, alias)) {
        return asm_lookupanimfromalias(statename, alias);
    }
    return asm_lookupanimfromalias(statename, params);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x765
// Size: 0x80
function choosedemeanoranimwithoverride(asmname, statename, params) {
    demeanor = asm_getdemeanor();
    if (asm_hasdemeanoranimoverride(demeanor, params)) {
        override = asm_getdemeanoranimoverride(demeanor, params);
        if (isarray(override)) {
            return override[randomint(override.size)];
        }
        return override;
    }
    if (!asm_hasalias(statename, demeanor)) {
        return asm_lookupanimfromalias(statename, "default");
    }
    return asm_lookupanimfromalias(statename, demeanor);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7ed
// Size: 0xc4
function choosedemeanoranimwithoverridevariants(asmname, statename, params) {
    demeanor = asm_getdemeanor();
    if (asm_hasdemeanoranimoverride(demeanor, params)) {
        override = asm_getdemeanoranimoverride(demeanor, params);
        if (isarray(override)) {
            return override[randomint(override.size)];
        }
        return override;
    }
    if (!asm_hasalias(statename, demeanor)) {
        var_d3ebb1fd79cbe1d2 = [];
        var_d3ebb1fd79cbe1d2[0] = asm_lookupanimfromalias(statename, "trans_to_one_hand_run");
        var_d3ebb1fd79cbe1d2[1] = asm_lookupanimfromalias(statename, "one_hand_run");
        var_d3ebb1fd79cbe1d2[2] = asm_lookupanimfromalias(statename, "trans_to_two_hand_run");
        var_d3ebb1fd79cbe1d2[3] = asm_lookupanimfromalias(statename, "two_hand_run");
        return var_d3ebb1fd79cbe1d2;
    }
    return asm_lookupanimfromalias(statename, demeanor);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b9
// Size: 0x57
function overridecovercrouchnodetype(node) {
    if (node.type == "Cover Crouch" && isdefined(self._blackboard.croucharrivaltype)) {
        return self._blackboard.croucharrivaltype;
    }
    return node.type;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x918
// Size: 0xb6
function allowlmgarrival() {
    if (istrue(self.disablelmgmount)) {
        return 0;
    }
    var_e02db7b70d9b56d9 = weaponclass(self.weapon) == "mg";
    if (var_e02db7b70d9b56d9) {
        if (!isdefined(self.node) || self.node isnodelmgmountable()) {
            return 1;
        }
        return 0;
    }
    if (isdefined(self._blackboard.deployedlmgnode) && isdefined(self.node) && self.node == self._blackboard.deployedlmgnode && self.node isnodelmgmountable()) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d6
// Size: 0x68
function getnodeforwardyaw(node, var_e7d9cb9558cb8470, var_83ca7917ee6a88e8) {
    /#
        assert(isai(self));
    #/
    /#
        assert(!actor_is3d());
    #/
    if (!isdefined(var_83ca7917ee6a88e8)) {
        var_83ca7917ee6a88e8 = 1;
    }
    offset = self getnodeyawoffset(node, var_e7d9cb9558cb8470, var_83ca7917ee6a88e8);
    return node.angles[1] + offset;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa46
// Size: 0x2a
function nodeiscoverstand3dtype(node) {
    if (node.type == "Cover Stand 3D") {
        return !nodeiscoverexposed3dtype(node);
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78
// Size: 0x48
function nodeiscoverexposed3dtype(node) {
    if (node.type == "Cover Stand 3D") {
        if (isdefined(node.script_parameters) && node.script_parameters == "exposed") {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac8
// Size: 0x35
function getnodetypename(node) {
    if (isdefined(node)) {
        if (nodeiscoverexposed3dtype(node)) {
            return "Cover Exposed 3D";
        } else {
            return node.type;
        }
    }
    return "undefined";
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb05
// Size: 0xba
function choosestrongdamagedeath(asmname, statename, params) {
    alias = undefined;
    if (abs(self.damageyaw) > 150) {
        if (damagelocationisany("left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower", "left_foot", "right_foot")) {
            alias = "legs";
        } else if (self.damagelocation == "torso_lower") {
            alias = "torso_lower";
        } else {
            alias = "default";
        }
    } else if (self.damageyaw < 0) {
        alias = "right";
    } else {
        alias = "left";
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc7
// Size: 0xa
function isatcovernode() {
    return isdefined(namespace_28edc79fcf2fe234::bb_getcovernode());
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbd9
// Size: 0xaa
function shouldleaveanimscripted(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (bb_isanimscripted()) {
        return 0;
    }
    if (isdefined(params)) {
        /#
            assert(!isarray(params));
        #/
        var_c33b7d825b24a8bb = params;
        if (var_c33b7d825b24a8bb) {
            if (self.a.movement == "stop") {
                return 0;
            }
            if (!bb_moverequested()) {
                return 0;
            }
        } else if (bb_moverequested() && self.a.movement != "stop") {
            return 0;
        }
    }
    return 1;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc8b
// Size: 0x7d
function animscriptedaction(asmname, statename, params) {
    self endon(statename + "_finished");
    self.a.movement = "run";
    self.gunposeoverride_internal = "disable";
    animindex = asm_lookupanimfromalias(statename, "blank");
    self aisetanim(statename, animindex);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd0f
// Size: 0xe1
function randomizepassthroughchildren(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_4826b510746869c3 = anim.asm[asmname].states[var_f2b19b25d457c2a6];
    /#
        assert(isdefined(var_4826b510746869c3));
    #/
    if (isdefined(var_4826b510746869c3.transitions)) {
        if (var_4826b510746869c3.transitions.size == 2) {
            if (cointoss()) {
                temp = var_4826b510746869c3.transitions[0];
                var_4826b510746869c3.transitions[0] = var_4826b510746869c3.transitions[1];
                var_4826b510746869c3.transitions[1] = temp;
            }
        } else {
            var_4826b510746869c3.transitions = namespace_3c37cb17ade254d::array_randomize(var_4826b510746869c3.transitions);
        }
    }
    return 1;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x5c
function nodeshouldfaceangles(node) {
    if (!isdefined(node)) {
        return 0;
    }
    if (isdefined(node.angles)) {
        return 1;
    }
    if (isstruct(node)) {
        return 0;
    }
    return isdefined(node.type) && node.type != "Path" && !isnodeexposed3d(node);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5c
// Size: 0x4e
function choosecrouchorstand(guy, node) {
    return int(node.origin[0] + node.origin[1] + node.origin[2] + guy getentitynumber()) % 2;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb2
// Size: 0x35
function choosecrouchorstandtac(guy, var_8e98a1b3e95386a5) {
    return int(abs(var_8e98a1b3e95386a5[0] + var_8e98a1b3e95386a5[1] + var_8e98a1b3e95386a5[2] + guy getentitynumber())) % 2;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeef
// Size: 0xd4
function getarrivalnode() {
    if (istrue(self.leavecasualkiller)) {
        return undefined;
    }
    if (isdefined(self.scriptedarrivalent) && !self btgoalvalid()) {
        /#
            assert(isdefined(self.scriptedarrivalent.type));
        #/
        return self.scriptedarrivalent;
    }
    if (isdefined(self.node)) {
        return self.node;
    }
    if (isdefined(self.prevnode) && isdefined(self.pathgoalpos) && distance2dsquared(self.prevnode.origin, self.pathgoalpos) < 36) {
        return self.prevnode;
    }
    if (isdefined(self.last_set_goalnode)) {
        return self.last_set_goalnode;
    }
    return self.last_set_goalent;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfcb
// Size: 0x37f
function isarrivaltypecivilian(asmname, var_8695dc19ef4c8376) {
    if (isdefined(self.var_a57082fdf62bc898)) {
        return (var_8695dc19ef4c8376 == "Custom");
    }
    if (bb_smartobjectrequested()) {
        return (var_8695dc19ef4c8376 == "Exposed");
    }
    node = getarrivalnode();
    if (isdefined(node) && isnode(node) && node iscovermultinode()) {
        var_bc81741e5658c761 = getbestcovermultinodetype(node);
        if (isdefined(var_bc81741e5658c761)) {
            node setcovermultinodetype(var_bc81741e5658c761);
        }
    }
    if (!isdefined(node) || !isdefined(node.type) || node.type == "struct" || !self function_ea13d460afb9afb3()) {
        return (var_8695dc19ef4c8376 == "Exposed");
    }
    if (isdefined(node) && node.type == "Cover Crouch") {
        covertype = getdvar(@"hash_f72dde9792b94cc9");
        if (covertype != "") {
            return (var_8695dc19ef4c8376 == covertype);
        }
        if (isdefined(self._blackboard.croucharrivaltype)) {
            return (var_8695dc19ef4c8376 == self._blackboard.croucharrivaltype);
        } else if (isdefined(node.covercrouchtype)) {
            return (var_8695dc19ef4c8376 == node.covercrouchtype);
        }
    }
    demeanor = asm_getdemeanor();
    var_775bd34dfd0c192f = (!isnode(node) || node doesnodeallowstance("stand")) && self isstanceallowed("stand");
    var_2030158f5eb8b187 = (!isnode(node) || node doesnodeallowstance("crouch")) && self isstanceallowed("crouch") && demeanor != "casual" && demeanor != "casual_gun";
    switch (var_8695dc19ef4c8376) {
    case #"hash_cf178f370da8b13":
        if (node.type != "Path" && node.type != "Exposed") {
            return 0;
        }
        if (var_2030158f5eb8b187 && choosecrouchorstand(self, node)) {
            return 0;
        }
        return var_775bd34dfd0c192f;
    case #"hash_78bfa3258dd84af":
        if (node.type != "Path" && node.type != "Exposed") {
            return 0;
        }
        if (var_775bd34dfd0c192f && !choosecrouchorstand(self, node)) {
            return 0;
        }
        return var_2030158f5eb8b187;
    case #"hash_c3b74422dec48736":
        return (node.type == "Cover Crouch" || node.type == "Conceal Crouch" || node.type == "Cover Crouch Window" || node.type == "Cover Stand" || node.type == "Conceal Stand" || node.type == "Cover Prone" || node.type == "Conceal Prone");
    case #"hash_e1d8e1adebed5a61":
        return (node.type == "Cover Left");
    case #"hash_cd3ffe799551db82":
        return (node.type == "Cover Right");
    case #"hash_a85b3cf9ab13da63":
        return (node.type == "Exposed Moving");
        break;
    }
    return var_8695dc19ef4c8376 == node.type;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1352
// Size: 0x73c
function isarrivaltype(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_8695dc19ef4c8376 = params;
    if (isdefined(self.var_a57082fdf62bc898)) {
        return (var_8695dc19ef4c8376 == "Custom");
    }
    if (bb_smartobjectrequested()) {
        return (var_8695dc19ef4c8376 == "Exposed");
    }
    node = getarrivalnode();
    if (isdefined(node) && isnode(node) && node iscovermultinode()) {
        var_bc81741e5658c761 = getbestcovermultinodetype(node);
        if (isdefined(var_bc81741e5658c761) && node.type != var_bc81741e5658c761 && var_8695dc19ef4c8376 == var_bc81741e5658c761) {
            node setcovermultinodetype(var_bc81741e5658c761);
        }
    }
    if (!isdefined(node) || !isdefined(node.type) || node.type == "struct" || !self function_ea13d460afb9afb3()) {
        if (actor_is3d()) {
            return (var_8695dc19ef4c8376 == "Exposed 3D");
        } else {
            return (var_8695dc19ef4c8376 == "Exposed");
        }
    }
    lmg = namespace_34bf5965727c0922::allowlmgarrival();
    if (isdefined(node) && node.type == "Cover Crouch" && !lmg) {
        covertype = getdvar(@"hash_f72dde9792b94cc9");
        if (covertype != "") {
            return (var_8695dc19ef4c8376 == covertype);
        }
        if (isdefined(self._blackboard.croucharrivaltype)) {
            return (var_8695dc19ef4c8376 == self._blackboard.croucharrivaltype);
        } else if (isdefined(node.covercrouchtype)) {
            return (var_8695dc19ef4c8376 == node.covercrouchtype);
        }
    }
    demeanor = asm_getdemeanor();
    var_775bd34dfd0c192f = (!isnode(node) || node doesnodeallowstance("stand")) && self isstanceallowed("stand");
    var_2030158f5eb8b187 = (!isnode(node) || node doesnodeallowstance("crouch")) && self isstanceallowed("crouch") && demeanor != "casual" && demeanor != "casual_gun";
    if (asmname == "zero_gravity_space") {
        switch (var_8695dc19ef4c8376) {
        case #"hash_4626de3588a73d7e":
            return (isnodeexposed3d(node) && var_775bd34dfd0c192f);
        case #"hash_b786e406d37a0dd7":
            return (node.type == "Cover 3D");
        case #"hash_bdacbb6eaaa538c7":
            return nodeiscoverstand3dtype(node);
        case #"hash_a8e3c2570a26f937":
            return nodeiscoverexposed3dtype(node);
        case #"hash_78bfa3258dd84af":
        case #"hash_cf178f370da8b13":
        case #"hash_55ed607005f12d49":
        case #"hash_667bc7e605903a6c":
        case #"hash_c051a32186a33cae":
        case #"hash_c3b74422dec48736":
        case #"hash_cd3ffe799551db82":
        case #"hash_e1d8e1adebed5a61":
        case #"hash_fd7cd04a31eca976":
            /#
                assertmsg(var_8695dc19ef4c8376 + " node type not supported in zero-gravity.");
            #/
            break;
        }
    } else if (asmname == "zero_gravity") {
        switch (var_8695dc19ef4c8376) {
        case #"hash_cf178f370da8b13":
            return ((node.type == "Path" || node.type == "Exposed") && var_775bd34dfd0c192f);
        case #"hash_78bfa3258dd84af":
            return ((node.type == "Path" || node.type == "Exposed") && var_2030158f5eb8b187);
        case #"hash_c3b74422dec48736":
            return (node.type == "Cover Crouch" || node.type == "Conceal Crouch");
        case #"hash_78b110033ccb68b0":
            return (node.type == "Cover Stand" || node.type == "Conceal Stand");
        case #"hash_55ed607005f12d49":
        case #"hash_667bc7e605903a6c":
        case #"hash_c051a32186a33cae":
        case #"hash_cd3ffe799551db82":
        case #"hash_e1d8e1adebed5a61":
            /#
                assertmsg(var_8695dc19ef4c8376 + " node type not supported in zero-gravity.");
            #/
            break;
        }
    } else {
        switch (var_8695dc19ef4c8376) {
        case #"hash_cf178f370da8b13":
            if (node.type != "Path" && node.type != "Exposed") {
                return 0;
            }
            if (var_2030158f5eb8b187 && choosecrouchorstand(self, node)) {
                return 0;
            }
            return var_775bd34dfd0c192f;
        case #"hash_78bfa3258dd84af":
            if (node.type != "Path" && node.type != "Exposed") {
                return 0;
            }
            if (var_775bd34dfd0c192f && !choosecrouchorstand(self, node)) {
                return 0;
            }
            return var_2030158f5eb8b187;
        case #"hash_c3b74422dec48736":
            return (node.type == "Cover Crouch" || node.type == "Conceal Crouch" || node.type == "Cover Crouch Window");
        case #"hash_78b110033ccb68b0":
            return (node.type == "Cover Stand" || node.type == "Conceal Stand");
        case #"hash_c051a32186a33cae":
            return (node.type == "Cover Prone" || node.type == "Conceal Prone");
        case #"hash_e1d8e1adebed5a61":
            if (node.type != "Cover Left") {
                return 0;
            }
            if (var_2030158f5eb8b187 && choosecrouchorstand(self, node)) {
                return 0;
            }
            return var_775bd34dfd0c192f;
        case #"hash_55ed607005f12d49":
            if (node.type != "Cover Left") {
                return 0;
            }
            if (var_775bd34dfd0c192f && !choosecrouchorstand(self, node)) {
                return 0;
            }
            return var_2030158f5eb8b187;
        case #"hash_cd3ffe799551db82":
            if (node.type != "Cover Right") {
                return 0;
            }
            if (var_2030158f5eb8b187 && choosecrouchorstand(self, node)) {
                return 0;
            }
            return var_775bd34dfd0c192f;
        case #"hash_667bc7e605903a6c":
            if (node.type != "Cover Right") {
                return 0;
            }
            if (var_775bd34dfd0c192f && !choosecrouchorstand(self, node)) {
                return 0;
            }
            return var_2030158f5eb8b187;
        case #"hash_5478c96ea12827c6":
            return ((node.type == "Cover Crouch" || node.type == "Cover Prone") && namespace_34bf5965727c0922::allowlmgarrival());
        case #"hash_bfb9a0387a2536f4":
            return (node.type == "Cover Stand" && namespace_34bf5965727c0922::allowlmgarrival());
        case #"hash_a85b3cf9ab13da63":
            return (node.type == "Exposed Moving");
            break;
        }
    }
    return var_8695dc19ef4c8376 == node.type;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0x61
function playmoveloop(asmname, statename, params) {
    self endon(statename + "_finished");
    self.requestarrivalnotify = 1;
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 0;
    rate = 1;
    function_fb56c9527636713f(asmname, statename, rate, 1);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1afe
// Size: 0x26
function playmoveloopcasual(asmname, statename, params) {
    playmoveloop(asmname, statename, params);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2b
// Size: 0x3c
function playanimwithdooropen(asmname, statename, params) {
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 1;
    playanim(asmname, statename, params);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6e
// Size: 0x1c
function playmoveloopcasualcleanup(asmname, statename, params) {
    
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b91
// Size: 0x67
function calcdooropenspeed() {
    if (iscp()) {
        return 0.8;
    }
    t = 0.75;
    speed = length(self.velocity);
    if (speed > 0) {
        t = 24 / speed;
    }
    if (t < 0.15) {
        t = 0.15;
    } else if (t > 1) {
        t = 1;
    }
    return t;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c00
// Size: 0x15c
function opendooratreasonabletime() {
    door = self._blackboard.doortoopen;
    fndooropen = self.fndooropen;
    if (!isdefined(door) || !isdefined(fndooropen)) {
        return;
    }
    self._blackboard.door_opened = 1;
    self endon("death");
    door endon("death");
    self endon("path_has_door");
    doorcenter = self [[ self.fngetdoorcenter ]](door);
    var_f195bad2134db294 = distance2dsquared(doorcenter, self.origin);
    var_9f24038fd2e04755 = 5476;
    if (!issp()) {
        var_b2c29e3fba2e1d31 = 0.8 * length(self.velocity);
        var_b2c29e3fba2e1d31 = var_b2c29e3fba2e1d31 * 0.9;
        var_9f24038fd2e04755 = max(var_b2c29e3fba2e1d31 * var_b2c29e3fba2e1d31, var_9f24038fd2e04755);
    }
    while (var_f195bad2134db294 > var_9f24038fd2e04755) {
        if (isdefined(self._blackboard.doortoopen) && door != self._blackboard.doortoopen) {
            return;
        }
        waitframe();
        var_f195bad2134db294 = distance2dsquared(doorcenter, self.origin);
    }
    t = calcdooropenspeed();
    self notify("opening_door");
    self thread [[ fndooropen ]](door, t);
    return t;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d64
// Size: 0x4c
function opendooratreasonabletime_waitforabort(statename) {
    self endon("opening_door_done");
    self waittill(statename + "_finished");
    if (!isalive(self)) {
        return;
    }
    self._blackboard.doortoopen = undefined;
    self.isopeningdoor = 0;
    self notify("opening_door_done");
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db7
// Size: 0x3d
function closedoorifnecessary(door) {
    /#
        assert(isdefined(self.fndoorneedstoclose));
    #/
    if (self [[ self.fndoorneedstoclose ]](door)) {
        self [[ self.fndoorclose ]](door);
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfb
// Size: 0x9d
function function_b6a072e9e59fb82e(asmname, statename, var_d6e02014cb6c5b06) {
    self endon(statename + "_finished");
    self endon("death");
    if (isdefined(self._blackboard.doortoopen)) {
        var_eb8ea5fef7306d32 = function_7e553ea72ae6828a();
        if (var_eb8ea5fef7306d32) {
            self._blackboard.doortoopen = undefined;
        } else {
            var_b09e54ca84b4af9 = 0;
            if (!self.facemotion) {
                var_b09e54ca84b4af9 = function_ff35aef6aed32425(statename);
            }
            if (!var_b09e54ca84b4af9) {
                function_4d06ccc14a583480(asmname, statename, var_d6e02014cb6c5b06);
            }
        }
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9f
// Size: 0x88
function function_7e553ea72ae6828a() {
    var_eb8ea5fef7306d32 = 0;
    if (self [[ self.fndooralreadyopen ]](self._blackboard.doortoopen)) {
        var_eb8ea5fef7306d32 = 1;
    }
    if (!var_eb8ea5fef7306d32 && !(isent(self._blackboard.doortoopen) || self._blackboard.doortoopen scriptableisdoor())) {
        if (!isdefined(self getmodifierlocationonpath("door", 200))) {
            var_eb8ea5fef7306d32 = 1;
        }
    }
    return var_eb8ea5fef7306d32;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2f
// Size: 0xd4
function function_ff35aef6aed32425(statename) {
    self endon(statename + "_finished");
    self endon("death");
    var_b09e54ca84b4af9 = 0;
    lookaheaddir = self.lookaheaddir;
    lookaheaddir = vectornormalize((lookaheaddir[0], lookaheaddir[1], 0));
    facingdir = anglestoforward(self.angles);
    if (vectordot(lookaheaddir, facingdir) < 0.966) {
        self.isopeningdoor = 1;
        thread function_4dd19bfd2ee610f1(statename);
        t = opendooratreasonabletime();
        if (isdefined(t)) {
            thread opendooratreasonabletime_waitforabort(statename);
            wait(t);
        }
        self notify("opening_door_done");
        self._blackboard.doortoopen = undefined;
        self.isopeningdoor = 0;
        var_b09e54ca84b4af9 = 1;
    }
    return var_b09e54ca84b4af9;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200b
// Size: 0x204
function function_4d06ccc14a583480(asmname, statename, var_d6e02014cb6c5b06) {
    self endon(statename + "_finished");
    self endon("death");
    door = self._blackboard.doortoopen;
    self._blackboard.door_opened = undefined;
    var_36effa6a4b76959f = 1;
    var_e3897a292b9511dd = 160;
    var_ccd231d7c8137213 = 2;
    targetspeed = length2d(self.velocity);
    if (!istrue(var_d6e02014cb6c5b06)) {
        var_9db8509018bbb8a = function_20962146e1a2e0dd(statename, targetspeed);
        if (isdefined(var_9db8509018bbb8a[1])) {
            var_e3897a292b9511dd = function_e183019dcea5b774(var_9db8509018bbb8a[0], var_9db8509018bbb8a[1], targetspeed);
        } else {
            var_d6e02014cb6c5b06 = 1;
        }
    }
    var_76c751e661fc569f = var_36effa6a4b76959f + var_e3897a292b9511dd + var_ccd231d7c8137213;
    doorcenter = self [[ self.fngetdoorcenter ]](door);
    var_8a2d1a3f463dffac = distance2d(doorcenter, self.origin);
    if (var_8a2d1a3f463dffac < var_76c751e661fc569f) {
        self.isopeningdoor = 1;
        thread closedoorifnecessary(door);
        var_382ab682aa991089 = 5;
        if (istrue(var_d6e02014cb6c5b06)) {
            var_382ab682aa991089 = 2;
        }
        if (istrue(var_d6e02014cb6c5b06) || var_8a2d1a3f463dffac < var_76c751e661fc569f - targetspeed * var_382ab682aa991089 * level.framedurationseconds) {
            /#
                assert(isdefined(self.fndooropen));
            #/
            thread function_4dd19bfd2ee610f1(statename);
            t = opendooratreasonabletime();
            if (isdefined(t)) {
                thread opendooratreasonabletime_waitforabort(statename);
                wait(t);
            }
            self notify("opening_door_done");
            self._blackboard.doortoopen = undefined;
            self.isopeningdoor = 0;
        } else {
            self setupdooropen(door, var_76c751e661fc569f, getdooropenspeedlookup());
            thread handledooropennotetrack(asmname, statename);
            thread handledooropenterminate(asmname, statename);
            self waittill("opening_door_done");
        }
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2216
// Size: 0xbd
function function_e183019dcea5b774(doorstate, var_60caa01062501fdc, targetspeed) {
    var_9605cbcca5366f66 = asm_getxanim(doorstate, var_60caa01062501fdc);
    /#
        assertex(animhasnotetrack(var_9605cbcca5366f66, "door_touch"), var_9605cbcca5366f66 + " missing door_touch notetrack");
    #/
    var_9f5284e7925797fd = getnotetracktimes(var_9605cbcca5366f66, "door_touch");
    /#
        assert(var_9f5284e7925797fd.size > 0);
    #/
    var_eb1c18bb49d8770c = (var_9f5284e7925797fd[0] * getanimlength(var_9605cbcca5366f66) + 3 * level.framedurationseconds) * targetspeed;
    var_e3897a292b9511dd = var_eb1c18bb49d8770c + 24;
    /#
        assertex(animhasnotetrack(var_9605cbcca5366f66, "door_open"), var_9605cbcca5366f66 + " missing door_open notetrack");
    #/
    return var_e3897a292b9511dd;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22db
// Size: 0xbb
function function_20962146e1a2e0dd(statename, targetspeed) {
    doorstate = statename;
    var_7f980e69def745b8 = asm_lookupanimfromaliasifexists(statename, "2");
    if (!isdefined(var_7f980e69def745b8)) {
        targetspeed = self aigettargetspeed();
        var_8707d88b63f131d1 = getnearestspeedthresholdname(self.basearchetype, targetspeed);
        if (isdefined(var_8707d88b63f131d1)) {
            var_d6cf89a3e47ada1f = var_8707d88b63f131d1 + "2";
            var_7f980e69def745b8 = asm_lookupanimfromaliasifexists(statename, var_d6cf89a3e47ada1f);
            if (!isdefined(var_7f980e69def745b8)) {
                doorstate = "door_open";
                var_7f980e69def745b8 = asm_lookupanimfromaliasifexists("door_open", var_d6cf89a3e47ada1f);
            }
        }
    }
    if (!isdefined(var_7f980e69def745b8)) {
        var_7f980e69def745b8 = asm_lookupanimfromaliasifexists("door_open", "2");
    }
    return [0:doorstate, 1:var_7f980e69def745b8];
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239e
// Size: 0x127
function handledooropennotetrack(asmname, statename) {
    self endon(statename + "_finished");
    self endon("opening_door_done");
    while (1) {
        notes = self waittill("door_open");
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        for (var_e30613a25cef86a4 = 0; var_e30613a25cef86a4 < notes.size; var_e30613a25cef86a4++) {
            if (notes[var_e30613a25cef86a4] == "door_open") {
                if (isdefined(self.fndooropen) && isdefined(self._blackboard.doortoopen)) {
                    self notify("opening_door");
                    t = calcdooropenspeed();
                    self thread [[ self.fndooropen ]](self._blackboard.doortoopen, t);
                    self._blackboard.door_opened = 1;
                }
            } else if (notes[var_e30613a25cef86a4] == "end") {
                self._blackboard.doortoopen = undefined;
                self.isopeningdoor = 0;
                self cleardooropen();
                self notify("opening_door_done");
            }
        }
        waitframe();
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24cc
// Size: 0x79
function handledooropenterminate(asmname, statename) {
    self endon("opening_door_done");
    self waittill(statename + "_finished");
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (!istrue(self._blackboard.door_opened)) {
        thread opendooratreasonabletime();
    }
    self._blackboard.doortoopen = undefined;
    self.isopeningdoor = 0;
    self cleardooropen();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254c
// Size: 0x53
function function_4dd19bfd2ee610f1(statename) {
    self endon("opening_door_done");
    self endon("death");
    var_ceaf8d53bc34c60d = statename + "_finished";
    msg = waittill_any_return_2(var_ceaf8d53bc34c60d, "opening_door");
    if (msg == var_ceaf8d53bc34c60d) {
        self.isopeningdoor = 0;
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a6
// Size: 0x5a
function getdooropenspeedlookup() {
    if (self.var_ae3ea15396b65c1f == "civilian_panic") {
        return "civilian_panic";
    } else if (self.unittype == "civilian") {
        return "civilian";
    } else if (self.var_ae3ea15396b65c1f == "juggernaut") {
        return "soldier";
    } else {
        return "soldier";
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2607
// Size: 0x26
function playanim(asmname, statename, params) {
    asm_playanimstate(asmname, statename, params);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2634
// Size: 0x2e
function playanimwithsound(asmname, statename, params) {
    self playsound(params);
    asm_playanimstate(asmname, statename, params);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2669
// Size: 0x2a
function loopanim(asmname, statename, params) {
    function_fb56c9527636713f(asmname, statename, 1);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x269a
// Size: 0xbb
function chooseanimidle(asmname, statename, params) {
    demeanor = asm_getdemeanor();
    if (asm_hasdemeanoranimoverride(demeanor, "idle")) {
        override = asm_getdemeanoranimoverride(demeanor, "idle");
        if (isarray(override)) {
            return override[randomint(override.size)];
        }
        return override;
    }
    if (isdefined(self.node) && self.node.type == "Cover Stand") {
        if (!self.node isvalidpeekoutdir("over")) {
            params = params + "_high";
        }
    }
    return chooseanim_weaponclassprepended(asmname, statename, params);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275d
// Size: 0xc0
function chooseanim_weaponclassprepended(asmname, statename, params) {
    /#
        assert(isdefined(self.weapon));
    #/
    weapclass = weaponclass(self.weapon);
    alias = undefined;
    if (!isdefined(params)) {
        return asm_getrandomanim(asmname, statename);
    } else {
        alias = params;
    }
    if (!asm_hasalias(statename, weapclass + alias)) {
        weapclass = "rifle";
        /#
            assertex(asm_hasalias(statename, weapclass + alias), "Archetype " + self.var_ae3ea15396b65c1f + " State " + statename + " doesn't have " + weapclass + alias + " anims");
        #/
    }
    return asm_lookupanimfromalias(statename, weapclass + alias);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2825
// Size: 0x26c
function getarrivaltype() {
    if (isdefined(self.var_a57082fdf62bc898)) {
        return "Custom";
    }
    if (bb_smartobjectrequested()) {
        return "Exposed";
    }
    node = getarrivalnode();
    if (!isdefined(node) || !isnode(node) || !isdefined(node.type) || node.type == "struct" || !self function_ea13d460afb9afb3()) {
        var_d707fa69a5dae9b6 = self getcovertacpoint();
        if (isdefined(var_d707fa69a5dae9b6)) {
            demeanor = asm_getdemeanor();
            var_2030158f5eb8b187 = self isstanceallowed("crouch") && demeanor == "combat";
            if (var_2030158f5eb8b187 && choosecrouchorstandtac(self, var_d707fa69a5dae9b6)) {
                return "Exposed Crouch";
            }
            return "Exposed";
        }
        if (bb_getrequestedstance() == "crouch" || isfixednodeinbadplaceandshouldcrouch() && self isstanceallowed("crouch")) {
            return "Exposed Crouch";
        }
        return "Exposed";
    }
    if (isdefined(self.enemy) && self iscoverinvalidagainstenemy(node) || shouldinitiallyattackfromexposed(node)) {
        if (node doesnodeallowstance("stand") && self isstanceallowed("stand")) {
            return "Exposed";
        } else if (node doesnodeallowstance("crouch") && self isstanceallowed("crouch")) {
            return "Exposed Crouch";
        } else {
            return "Cover Prone";
        }
    }
    if (isnode(node) && node iscovermultinode()) {
        var_bc81741e5658c761 = getbestcovermultinodetype(node);
        if (isdefined(var_bc81741e5658c761) && var_bc81741e5658c761 != node.type) {
            node setcovermultinodetype(var_bc81741e5658c761);
        }
    }
    nodetype = node.type;
    lmg = namespace_34bf5965727c0922::allowlmgarrival();
    if (lmg) {
        switch (nodetype) {
        case #"hash_c051a32186a33cae":
        case #"hash_c3b74422dec48736":
            return "Cover Crouch LMG";
        case #"hash_78b110033ccb68b0":
            return "Cover Stand LMG";
            break;
        }
    }
    if (isdefined(self._blackboard.croucharrivaltype) && !lmg) {
        return self._blackboard.croucharrivaltype;
    }
    return self choosearrivaltype(node, nodetype);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a99
// Size: 0x44
function shouldstrafe(asmname, statename, var_f2b19b25d457c2a6, params) {
    return bb_moverequested() && !self.facemotion && self.allowstrafe;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae5
// Size: 0x52
function shouldabortstrafe(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!shouldstrafe(asmname, statename, var_f2b19b25d457c2a6, params)) {
        return 1;
    }
    if (!bb_movetyperequested("combat")) {
        return 1;
    }
    if (bb_meleechargerequested()) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b3f
// Size: 0x4a
function chooseanimmovetype(asmname, statename, params) {
    demeanor = asm_getdemeanor();
    if (!asm_hasalias(statename, demeanor)) {
        return asm_chooseanim(asmname, statename, params);
    }
    return asm_lookupanimfromalias(statename, demeanor);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2b91
// Size: 0x2a
function transition_isflashed(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isflashed();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc3
// Size: 0x2a
function function_2c4c65a1362c43f6(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isstunned();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf5
// Size: 0x46
function transition_isburning(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self._blackboard.isburning) && !istrue(self.damageshield);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2c43
// Size: 0x58
function function_5129b58498c1a96f(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self._blackboard.var_453b42f68499e7fc) && gettime() - self._blackboard.var_453b42f68499e7fc < 100;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca3
// Size: 0x6c
function shouldreacttolight(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self.lightreaction_requesttime) && self.lightreaction_requesttime >= gettime() - 1000) {
        archetype = self getbasearchetype();
        if (isspeedwithincqbrange(archetype, self aigetdesiredspeed())) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d17
// Size: 0x14e
function chooselightreactionanim(asmname, statename, params) {
    direction = "center";
    if (!isdefined(self.lightreaction_lightorigin)) {
        return asm_lookupanimfromalias(statename, direction);
    }
    if (isdefined(self.covernode)) {
        var_22a308b658761b73 = anglestoright(self.covernode.angles);
        var_8d39b8ad31508804 = anglestoforward(self.covernode.angles);
        var_4a01d3a5d7389412 = vectornormalize(self.lightreaction_lightorigin - self.origin);
    } else {
        var_22a308b658761b73 = anglestoright(self.angles);
        var_8d39b8ad31508804 = anglestoforward(self.angles);
        var_4a01d3a5d7389412 = vectornormalize(self.lightreaction_lightorigin - self.origin);
    }
    var_52809b82c18e7907 = vectordot(var_22a308b658761b73, var_4a01d3a5d7389412) >= 0;
    var_1e3ac8ad87f9f410 = vectordot(var_8d39b8ad31508804, var_4a01d3a5d7389412);
    if (var_1e3ac8ad87f9f410 >= 0.866) {
        direction = "center";
    } else if (var_52809b82c18e7907) {
        direction = "right";
    } else {
        direction = "left";
    }
    return asm_lookupanimfromalias(statename, direction);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6d
// Size: 0xe3
function isshocked(asmname, currentstate, var_caae90accdd1699c, params) {
    if (isdefined(self.damagemod) && self.damagemod == "MOD_IMPACT") {
        return 0;
    }
    if (isdamageweapon(makeweapon("emp"))) {
        return 1;
    }
    if (self.unittype == "c6" || self.unittype == "c8") {
        if (isdamageweapon(makeweapon("iw7_sonic")) && isweaponepic(self.damageweapon)) {
            return 1;
        }
    }
    if (isdamageweapon(makeweapon("iw7_atomizer")) && self.damagemod != "MOD_MELEE" && self.health <= 0) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f58
// Size: 0x95
function getdamagedirstring() {
    damagedir = -1 * self.damagedir;
    facingdir = anglestoforward(self.angles);
    dot = vectordot(facingdir, damagedir);
    if (dot > 0.707) {
        return "front";
    } else if (dot < -0.707) {
        return "back";
    } else {
        cross = vectorcross(facingdir, damagedir);
        if (cross[2] > 0) {
            return "left";
        } else {
            return "right";
        }
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff4
// Size: 0x53
function gethumandamagedirstring() {
    damagedir = -1 * self.damagedir;
    facingdir = anglestoforward(self.angles);
    dot = vectordot(facingdir, damagedir);
    if (dot < -0.5) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x304f
// Size: 0x31
function playanimandusegoalweight(asmname, statename, params) {
    self setuseanimgoalweight(0.2);
    asm_playanimstate(asmname, statename);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3087
// Size: 0x75
function animscriptedaction_terminate(asmname, statename, params) {
    self orientmode("face angle 3d", self.angles);
    self.gunposeoverride_internal = undefined;
    if (isdefined(self.lookatatrnode)) {
        var_ae4bd9db62367d96 = asm_getheadlookknobifexists();
        if (isdefined(var_ae4bd9db62367d96)) {
            self clearanim(var_ae4bd9db62367d96, 0.2);
            self.lookatatrnode = undefined;
        }
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3103
// Size: 0x5f
function animsriptedactioncivilian_terminate(asmname, statename, params) {
    if (isdefined(self.lookatatrnode)) {
        var_ae4bd9db62367d96 = asm_getheadlookknobifexists();
        if (isdefined(var_ae4bd9db62367d96)) {
            self clearanim(var_ae4bd9db62367d96, 0.2, self.lookatatrnode);
            self.lookatatrnode = undefined;
        }
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3169
// Size: 0x14
function cleanupanimscriptedheadlook() {
    self.ht_on = undefined;
    lookatentity();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3184
// Size: 0x2d
function animscriptedstartup(asmname, statename, params) {
    self.ht_on = undefined;
    self stoplookat();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31b8
// Size: 0x30
function animscriptedcleanup(asmname, statename, params) {
    cleanupanimscriptedheadlook();
    self aisettargetspeed(self aigetdesiredspeed());
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31ef
// Size: 0x23
function animscriptedaction_cleanup(asmname, statename, params) {
    cleanupanimscriptedheadlook();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3219
// Size: 0x87
function disabledefaultfacialanims(var_49f31e97fe6a3857) {
    if (!isdefined(self.headknob)) {
        self.headknob = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "head"));
    }
    if (!isdefined(var_49f31e97fe6a3857) || var_49f31e97fe6a3857) {
        setfacialstate("animscripted");
        if (isai(self)) {
            self setfacialindex("none");
        } else {
            setfacialindexfornonai("none");
        }
    } else {
        clearfacialstate("animscripted");
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a7
// Size: 0x153
function setfacialindexfornonai(state) {
    states = [];
    states["none"] = 0;
    states["idle"] = 1;
    states["aim"] = 2;
    states["run"] = 3;
    states["pain"] = 4;
    states["death"] = 5;
    states["talk_lg"] = 6;
    states["talk_md"] = 7;
    states["talk_sm"] = 8;
    states["happy"] = 9;
    states["cheer"] = 10;
    states["scared"] = 11;
    states["angry"] = 12;
    states["gas_death"] = 13;
    /#
        assertex(isdefined(states[state]), "Unsupported facial state " + state);
    #/
    /#
        assert(!isai(self));
    #/
    /#
        assert(issp());
    #/
    self setcustomnodegameparameter("animtime", self getentitynumber());
    self setcustomnodegameparameterbyte("facialindex", states[state]);
    var_7c2e7606fe2f4b3d = asm_lookupanimfromalias("knobs", "head");
    if (state == "none") {
        self clearanim(asm_getxanim("knobs", var_7c2e7606fe2f4b3d), 0.2);
    } else {
        self setanim(asm_getxanim("knobs", var_7c2e7606fe2f4b3d), 1, 0.2, 1);
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3401
// Size: 0xac
function function_ee3e5d584e317d35(state) {
    if (state == "none") {
        var_7c2e7606fe2f4b3d = asm_lookupanimfromalias("knobs", "head_fakeactor");
        self clearanim(asm_getxanim("knobs", var_7c2e7606fe2f4b3d), 0.2);
        return;
    }
    var_a8b3655415e2cd1 = asm_lookupanimfromalias("facial_animation_fakeactor", state);
    if (!isdefined(var_a8b3655415e2cd1)) {
        iprintln("Missing facial: " + self.var_ae3ea15396b65c1f + " " + state);
    }
    var_bc15003c3e2cd832 = asm_getxanim("facial_animation_fakeactor", var_a8b3655415e2cd1);
    self setanimknob(var_bc15003c3e2cd832, 1, 0.2);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b4
// Size: 0x16
function setfacialstate(state) {
    self.facialstate = state;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d1
// Size: 0x3c
function clearfacialstate(state) {
    self.facialstate = "asm";
    if (!isdefined(self.fakeactor_face_anim) || !self.fakeactor_face_anim) {
        asm_restorefacialanim();
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3514
// Size: 0xa8
function isfacialstateallowed(state) {
    if (!isai(self) && (!isdefined(self.fakeactor_face_anim) || !self.fakeactor_face_anim)) {
        return 0;
    }
    if (!isdefined(self.facialstate)) {
        self.facialstate = "asm";
    }
    priorities = [];
    priorities["asm"] = 0;
    priorities["filler"] = 1;
    priorities["animscripted"] = 2;
    /#
        assertex(isdefined(priorities[state]), "Facial anim state " + state + " is invalid");
    #/
    if (priorities[state] >= priorities[self.facialstate]) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35c4
// Size: 0x19
function decrementbulletsinclip() {
    if (self.bulletsinclip) {
        self.bulletsinclip--;
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35e4
// Size: 0xc
function grenadelauncherfirerate() {
    return randomfloatrange(5, 8);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35f8
// Size: 0x2d
function shotgunfirerate() {
    if (weapon_pump_action_shotgun()) {
        return 1;
    }
    if (namespace_192c166ad8ed6432::usingautomaticweapon()) {
        return (namespace_192c166ad8ed6432::autoshootanimrate() * 0.7);
    }
    return 0.4;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x362d
// Size: 0xc3
function melee_checktimer(unittype, checkplayer) {
    /#
        if (getdvarint(@"hash_a36b45ede9e79a0a", 0) == 1) {
            return 1;
        }
    #/
    if (isdefined(self.meleeignoretimer) && self.meleeignoretimer) {
        return 1;
    }
    if (!isdefined(checkplayer)) {
        checkplayer = 0;
    }
    if (checkplayer) {
        if (!isdefined(anim.meleechargeplayertimers)) {
            return 1;
        }
        if (!isdefined(anim.meleechargeplayertimers[unittype])) {
            return 1;
        }
        return (gettime() > anim.meleechargeplayertimers[unittype]);
    } else {
        if (!isdefined(anim.meleechargetimers)) {
            return 1;
        }
        if (!isdefined(anim.meleechargetimers[unittype])) {
            return 1;
        }
        return (gettime() > anim.meleechargetimers[unittype]);
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f7
// Size: 0x232
function setupsoldierdefaults() {
    curtime = gettime();
    self.var_14070a5a0597bf51 = 0;
    self.primaryweapon = self.weapon;
    self.agentname = "MP/HOSTILE_SOLDIER";
    if (isdefined(level.gametype) && level.gametype == "gwtdm") {
        self.agentname = "MP/GWTDM_SOLDIER";
    }
    self.currentpose = "stand";
    self.a.movement = "stop";
    self.dropweapon = 1;
    self.minexposedgrenadedist = 750;
    isally = !self isbadguy();
    self.a.lastenemytime = curtime;
    self.var_98add129a7ecb962 = !isally;
    self.a.paintime = 0;
    self.reacttobulletchance = 0.8;
    self._animactive = 0;
    self._lastanimtime = 0;
    self.misstime = 0;
    self.a.nodeath = 0;
    self.misstime = 0;
    self.misstimedebounce = 0;
    self.a.disablepain = 0;
    self.battlechatter = spawnstruct();
    if (!issp()) {
        callback::add("on_ai_killed", &namespace_378f8281e2d12ced::function_d6731c6d074dc7d0);
    }
    self.chatinitialized = 0;
    self.defaultturnthreshold = 55;
    namespace_34bf5965727c0922::setfacialstate("asm");
    self.speedscalemult = 0.95 + randomfloat(0.15);
    self.script_forcegrenade = 0;
    self.lastenemysighttime = 0;
    self.combattime = 0;
    self.suppressed = 0;
    self.suppressedtime = 0;
    if (isally) {
        self.suppressionthreshold = 0.5;
    } else {
        self.suppressionthreshold = 0;
    }
    self.ammocheatinterval = 8000;
    self.ammocheattime = 0;
    self.var_20d73f2e5569b90f = 75;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3930
// Size: 0x95
function getspeedmatchanimrate(xanim, var_fc5f278cd84bd79, var_10c9a5d419c90668) {
    /#
        assert(var_fc5f278cd84bd79 < var_10c9a5d419c90668);
    #/
    currentspeed = length(self.velocity);
    if (currentspeed < 1) {
        return 1;
    }
    var_eb1c18bb49d8770c = length(getmovedelta(xanim, var_fc5f278cd84bd79, var_10c9a5d419c90668));
    if (var_eb1c18bb49d8770c < 1) {
        return 1;
    }
    animtime = getanimlength(xanim) * (var_10c9a5d419c90668 - var_fc5f278cd84bd79);
    var_f9060dc3720a1b67 = var_eb1c18bb49d8770c / animtime;
    return currentspeed / var_f9060dc3720a1b67;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39cd
// Size: 0x25
function isentasoldier() {
    return self.unittype == "soldier" || self.unittype == "juggernaut";
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39fa
// Size: 0x25
function isentnotabomber() {
    return self.asmname != "suicidebomber" && self.asmname != "suicidebomber_cp";
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a27
// Size: 0x1b
function demeanorhasblendspace() {
    demeanor = asm_getdemeanor();
    return demeanor == "combat";
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4a
// Size: 0x59
function isfixednodeinbadplaceandshouldcrouch() {
    if (self.fixednode && !isdefined(self.node) && isdefined(self.color_node) && self isnodeinbadplace(self.color_node) && self.color_node doesnodeallowstance("crouch")) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aab
// Size: 0x289
function gethighestallowedstance() {
    var_6e42e802f04ee4b6 = undefined;
    var_58b5e042653e4c9 = 1;
    var_1462639ed10c0aa5 = 1;
    var_fbc7d1fe7086d737 = 1;
    if (isdefined(self.node) && isatcovernode()) {
        var_58b5e042653e4c9 = self.node doesnodeallowstance("stand");
        var_1462639ed10c0aa5 = self.node doesnodeallowstance("crouch");
        var_fbc7d1fe7086d737 = self.node doesnodeallowstance("prone");
    } else if (!namespace_28edc79fcf2fe234::bb_moverequested() && istrue(self._blackboard.shootparams_valid) && isdefined(self._blackboard.shootparams_pos)) {
        var_6e728f1543cfb7bf = self isstanceallowed("crouch");
        if (var_6e728f1543cfb7bf && isfixednodeinbadplaceandshouldcrouch()) {
            return "crouch";
        }
        var_1ffc686a2062eba7 = distancesquared(self.origin, self._blackboard.shootparams_pos);
        if (var_1ffc686a2062eba7 > 262144 && var_6e728f1543cfb7bf && !actor_is3d() && !isusingsidearm()) {
            var_6e728f1543cfb7bf = 1;
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < 16 && !self.node doesnodeallowstance("crouch")) {
                var_6e728f1543cfb7bf = abs(angleclamp180(self.node.angles[1] - self.angles[1])) > 90;
            }
            if (var_6e728f1543cfb7bf) {
                if (sighttracepassed(self.origin + (0, 0, 32), self._blackboard.shootparams_pos, 0, undefined)) {
                    return "crouch";
                }
            }
        }
    }
    while (1) {
        if (self isstanceallowed("stand") && var_58b5e042653e4c9) {
            return "stand";
        }
        if (self isstanceallowed("crouch") && var_1462639ed10c0aa5) {
            return "crouch";
        }
        if (self isstanceallowed("prone") && var_fbc7d1fe7086d737) {
            return "prone";
        }
        if (!var_58b5e042653e4c9 || !var_1462639ed10c0aa5 || !var_fbc7d1fe7086d737) {
            var_58b5e042653e4c9 = 1;
            var_1462639ed10c0aa5 = 1;
            var_fbc7d1fe7086d737 = 1;
            continue;
        }
        break;
    }
    /#
        assertmsg("No stances allowed on actor - at least one stance must always be allowed");
    #/
    return "crouch";
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3c
// Size: 0x14d
function determinerequestedstance() {
    higheststance = gethighestallowedstance();
    var_55372344a55a6d53 = bb_getrequestedstance();
    var_5730c0aa523383e = [];
    var_5730c0aa523383e["prone"] = 0;
    var_5730c0aa523383e["crouch"] = 1;
    var_5730c0aa523383e["stand"] = 2;
    demeanor = self function_869f129f31d72088();
    if (isdefined(self.pathgoalpos) && distance2dsquared(self.pathgoalpos, self.origin) > 1) {
        var_55372344a55a6d53 = "stand";
    }
    if (self._blackboard.bgrenadereturnthrow) {
        var_55372344a55a6d53 = "stand";
    }
    if (!isdefined(higheststance)) {
        higheststance = var_55372344a55a6d53;
    }
    if (demeanor == "casual" || demeanor == "casual_gun") {
        var_55372344a55a6d53 = "stand";
    } else if (higheststance == "prone" && self.unittype == "c6") {
        var_55372344a55a6d53 = "crouch";
    } else if (var_5730c0aa523383e[higheststance] < var_5730c0aa523383e[var_55372344a55a6d53]) {
        var_55372344a55a6d53 = higheststance;
    } else if (var_55372344a55a6d53 == "prone" && higheststance != var_55372344a55a6d53) {
        var_55372344a55a6d53 = higheststance;
    } else if (var_55372344a55a6d53 == "crouch" && var_5730c0aa523383e[higheststance] > var_5730c0aa523383e["crouch"]) {
        if (bb_isinbadcrouchspot()) {
            var_55372344a55a6d53 = "stand";
        }
    }
    return var_55372344a55a6d53;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e91
// Size: 0x54
function function_87d74491d0318ba3(archetype) {
    /#
        if (isagent(self)) {
            return 1;
        }
        if (!isdefined(level.var_a34e5c8668851782)) {
            level.var_a34e5c8668851782 = [];
        }
        if (!isdefined(level.var_a34e5c8668851782[archetype])) {
            level.var_a34e5c8668851782[archetype] = 1;
            return 0;
        }
        return 1;
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3eec
// Size: 0x70
function function_d6919795e4b24d3a(asmname, statename, xanim, note) {
    /#
        if (!animhasnotetrack(xanim, note)) {
            print("Custom" + note + "angry" + asmname + "asm" + statename + "suicidebomber_cp" + function_3c8848a3a11b2553(getanimname(xanim)) + "poiauto_glanceend");
            level.var_e941151b3a81c996 = 0;
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3f63
// Size: 0x70
function function_37064c5f2a8f68ef(asmname, statename, xanim, note) {
    /#
        if (animhasnotetrack(xanim, note)) {
            print("<unknown string>" + note + "angry" + asmname + "asm" + statename + "suicidebomber_cp" + function_3c8848a3a11b2553(getanimname(xanim)) + "poiauto_glanceend");
            level.var_e941151b3a81c996 = 0;
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3fda
// Size: 0xa3
function function_6893c43c1838f552(asmname, statename, xanim, var_48fc94ce2fec8aa8, var_48fc97ce2fec9141) {
    /#
        if (!animhasnotetrack(xanim, var_48fc94ce2fec8aa8) || !animhasnotetrack(xanim, var_48fc97ce2fec9141)) {
            return;
        }
        if (getnotetracktimes(xanim, var_48fc94ce2fec8aa8)[0] >= getnotetracktimes(xanim, var_48fc97ce2fec9141)[0]) {
            print("<unknown string>" + var_48fc94ce2fec8aa8 + "<unknown string>" + var_48fc97ce2fec9141 + "angry" + asmname + "asm" + statename + "suicidebomber_cp" + function_3c8848a3a11b2553(getanimname(xanim)) + "poiauto_glanceend");
            level.var_e941151b3a81c996 = 0;
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4084
// Size: 0x9b
function function_3474c2003e05a5e0(asmname, statename, xanim, var_e68e984de4e68ee7) {
    /#
        movedelta = getmovedelta(xanim);
        d = length(movedelta);
        if (d < var_e68e984de4e68ee7) {
            println("<unknown string>" + var_e68e984de4e68ee7 + "<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>");
            level.var_e941151b3a81c996 = 0;
            println("<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)) + "<unknown string>" + d);
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4126
// Size: 0x19d
function function_481385c3b908b994(asmname, statename, xanim, var_d43784c16c429ec1) {
    /#
        stop_time = 1;
        if (animhasnotetrack(xanim, "<unknown string>") || animhasnotetrack(xanim, "<unknown string>")) {
            var_ad9ba4beee7c6c8e = getnotetracktimes(xanim, "<unknown string>");
            foreach (note in var_ad9ba4beee7c6c8e) {
                stop_time = min(stop_time, note);
            }
            var_ec92f7e363a1800 = getnotetracktimes(xanim, "<unknown string>");
            foreach (note in var_ec92f7e363a1800) {
                stop_time = min(stop_time, note);
            }
        }
        movedelta = getmovedelta(xanim, 0, stop_time);
        d = length(movedelta);
        if (d > var_d43784c16c429ec1) {
            println("<unknown string>" + var_d43784c16c429ec1 + "<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>");
            level.var_e941151b3a81c996 = 0;
            println("<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)) + "<unknown string>" + d);
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x42ca
// Size: 0x1fa
function function_7329f095ddbdb229(asmname, statename, xanim, notetrack, var_d43784c16c429ec1) {
    /#
        stop_time = 1;
        if (animhasnotetrack(xanim, "<unknown string>")) {
            var_ad9ba4beee7c6c8e = getnotetracktimes(xanim, "<unknown string>");
            if (var_ad9ba4beee7c6c8e.size != 1) {
                println("<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)));
            }
            stop_time = var_ad9ba4beee7c6c8e[0];
        }
        if (animhasnotetrack(xanim, "<unknown string>")) {
            var_ec92f7e363a1800 = getnotetracktimes(xanim, "<unknown string>");
            if (var_ec92f7e363a1800.size != 1) {
                println("<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)));
            }
            stop_time = min(stop_time, var_ec92f7e363a1800[0]);
        }
        start_time = 0;
        if (animhasnotetrack(xanim, notetrack)) {
            notes = getnotetracktimes(xanim, notetrack);
            if (notes.size != 1) {
                println("<unknown string>" + notetrack + "<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)));
            }
            start_time = notes[0];
        } else {
            return;
        }
        movedelta = getmovedelta(xanim, start_time, stop_time);
        d = length(movedelta);
        if (d > var_d43784c16c429ec1) {
            println("<unknown string>" + var_d43784c16c429ec1 + "<unknown string>" + notetrack + "<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>");
            level.var_e941151b3a81c996 = 0;
            println("<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)) + "<unknown string>" + d);
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x44cb
// Size: 0x8c
function function_96b38b91937c6971(asmname, statename, note) {
    /#
        if (isagent(self)) {
            return;
        }
        var_6fa083eab22dac63 = asm_getallanimsforstate(statename);
        foreach (xanim in var_6fa083eab22dac63) {
            function_d6919795e4b24d3a(asmname, statename, xanim, note);
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x455e
// Size: 0x90
function function_2376c1e1ca3ac68e(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        var_6fa083eab22dac63 = asm_getallanimsforstate(statename);
        foreach (xanim in var_6fa083eab22dac63) {
            function_481385c3b908b994(asmname, statename, xanim, 0.1);
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x45f5
// Size: 0x98
function function_6421e5a82688da9d(asmname, statename, tolerance) {
    /#
        if (isagent(self)) {
            return;
        }
        if (!isdefined(tolerance)) {
            tolerance = 8;
        }
        var_6fa083eab22dac63 = asm_getallanimsforstate(statename);
        foreach (xanim in var_6fa083eab22dac63) {
            function_3474c2003e05a5e0(asmname, statename, xanim, tolerance);
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4694
// Size: 0x14a
function function_fb8af5455aa10890(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        tolerance = 0.1;
        var_67d6da562a00e06b = 0.1;
        var_6fa083eab22dac63 = asm_getallanimsforstate(statename);
        foreach (xanim in var_6fa083eab22dac63) {
            t = 0;
            while (t < 1) {
                t = min(t + var_67d6da562a00e06b, 1);
                movedelta = getmovedelta(xanim, 0, t);
                d = length(movedelta);
                if (d > tolerance) {
                    println("<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>" + tolerance + "<unknown string>");
                    level.var_e941151b3a81c996 = 0;
                    println("<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)) + "<unknown string>" + d + "<unknown string>" + t);
                    break;
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x47e5
// Size: 0x2da
function function_e291a61d131cb535(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        if (!isdefined(aliases)) {
            println("<unknown string>" + self.var_ae3ea15396b65c1f + "<unknown string>" + statename + "<unknown string>");
            return;
        }
        foreach (alias in aliases) {
            var_a401bfc2f3617031 = undefined;
            if (issubstr(alias, "<unknown string>")) {
                var_a401bfc2f3617031 = 1;
            } else if (issubstr(alias, "<unknown string>")) {
                var_a401bfc2f3617031 = 2;
            } else if (issubstr(alias, "<unknown string>")) {
                var_a401bfc2f3617031 = 3;
            } else if (issubstr(alias, "<unknown string>")) {
                var_a401bfc2f3617031 = 4;
            } else if (issubstr(alias, "<unknown string>")) {
                var_a401bfc2f3617031 = 5;
            } else if (issubstr(alias, "<unknown string>")) {
                var_a401bfc2f3617031 = 6;
            }
            if (isdefined(var_a401bfc2f3617031)) {
                var_fb34eb17f76fc7a1 = archetypegetalias(arc, statename, alias, 0);
                var_3a8e690b2371c6d2 = archetypegetalias(arc, statename, alias, 1);
                if (isarray(var_fb34eb17f76fc7a1.anims)) {
                    anims = var_fb34eb17f76fc7a1.anims;
                } else {
                    anims = [0:var_fb34eb17f76fc7a1.anims];
                }
                if (isarray(var_3a8e690b2371c6d2.anims)) {
                    var_3a8e690b2371c6d2 = var_3a8e690b2371c6d2.anims;
                } else {
                    var_3a8e690b2371c6d2 = [0:var_3a8e690b2371c6d2.anims];
                }
                var_6fa083eab22dac63 = namespace_3c37cb17ade254d::array_combine_unique(anims, var_3a8e690b2371c6d2);
                foreach (xanim in var_6fa083eab22dac63) {
                    var_45d925e78e0e783a = getnotetracktimes(xanim, "<unknown string>");
                    if (var_45d925e78e0e783a.size < var_a401bfc2f3617031) {
                        println("<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>");
                        level.var_e941151b3a81c996 = 0;
                        println("<unknown string>" + alias + "<unknown string>" + function_3c8848a3a11b2553(getanimname(xanim)) + "<unknown string>" + var_45d925e78e0e783a.size + "<unknown string>" + var_a401bfc2f3617031);
                    }
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac6
// Size: 0x1f
function function_3668c851be298257(asmname, statename, params) {
    /#
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4aec
// Size: 0x1f
function function_e7680ae9c1ad905c(asmname, statename, params) {
    /#
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4b12
// Size: 0xad
function function_291d962b22a07e21(asmname, statename, alias, xanim) {
    /#
        if (isagent(self)) {
            return;
        }
        if (issubstr(statename, "<unknown string>") && (issubstr(alias, "<unknown string>") || issubstr(alias, "<unknown string>")) || issubstr(statename, "<unknown string>") && (issubstr(alias, "<unknown string>") || issubstr(alias, "<unknown string>"))) {
            function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
            function_6893c43c1838f552(asmname, statename, xanim, "<unknown string>", "<unknown string>");
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc6
// Size: 0x185
function function_5ac3e08bd8b8783b(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    function_291d962b22a07e21(asmname, statename, alias, xanim);
                    function_481385c3b908b994(asmname, statename, xanim, 85);
                    function_3474c2003e05a5e0(asmname, statename, xanim, 16);
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_7329f095ddbdb229(asmname, statename, xanim, "<unknown string>", 1);
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d52
// Size: 0x1a2
function function_498119c92072487f(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    function_291d962b22a07e21(asmname, statename, alias, xanim);
                    function_481385c3b908b994(asmname, statename, xanim, 85);
                    function_3474c2003e05a5e0(asmname, statename, xanim, 16);
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4efb
// Size: 0x1fa
function function_9a500dc0cc17d6da(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        pistol_pickup = "<unknown string>";
        var_9232727e455493f7 = "<unknown string>";
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    if (!animhasnotetrack(xanim, "<unknown string>") && !animhasnotetrack(xanim, "<unknown string>") && !animhasnotetrack(xanim, "<unknown string>")) {
                        print("<unknown string>" + asmname + "asm" + statename + "suicidebomber_cp" + function_3c8848a3a11b2553(getanimname(xanim)) + "poiauto_glanceend");
                        level.var_e941151b3a81c996 = 0;
                    }
                    if (!animhasnotetrack(xanim, "<unknown string>") && !animhasnotetrack(xanim, "<unknown string>")) {
                        print("<unknown string>" + asmname + "asm" + statename + "suicidebomber_cp" + function_3c8848a3a11b2553(getanimname(xanim)) + "poiauto_glanceend");
                        level.var_e941151b3a81c996 = 0;
                    }
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x50fc
// Size: 0x1a7
function function_5cfc0f7a00ff16ae(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    function_291d962b22a07e21(asmname, statename, alias, xanim);
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    function_6893c43c1838f552(asmname, statename, xanim, "<unknown string>", "<unknown string>");
                    function_481385c3b908b994(asmname, statename, xanim, 65);
                    function_3474c2003e05a5e0(asmname, statename, xanim, 8);
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x52aa
// Size: 0x1fe
function function_d63d29d0192b914(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    if (animhasnotetrack(xanim, "<unknown string>")) {
                        var_acfa015f21c55596 = 0.05 / max(getanimlength(xanim), 0.05);
                        var_d8b09ba073e85d21 = getnotetracktimes(xanim, "<unknown string>");
                        foreach (note in var_d8b09ba073e85d21) {
                            if (note > var_acfa015f21c55596) {
                                print("<unknown string>" + asmname + "asm" + statename + "suicidebomber_cp" + function_3c8848a3a11b2553(getanimname(xanim)) + "poiauto_glanceend");
                                level.var_e941151b3a81c996 = 0;
                            }
                        }
                    }
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x54af
// Size: 0x1aa
function function_a61779d8c4b66cda(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    function_6893c43c1838f552(asmname, statename, xanim, "<unknown string>", "<unknown string>");
                    function_481385c3b908b994(asmname, statename, xanim, 65);
                    function_3474c2003e05a5e0(asmname, statename, xanim, 8);
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                    function_37064c5f2a8f68ef(asmname, statename, xanim, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5660
// Size: 0x15b
function function_a92ee440c129eb3b(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            if (issubstr(alias, "<unknown string>")) {
                continue;
            }
            anims = asm_getallanimsforalias(arc, statename, alias);
            var_36eebb886bbddcca = !issubstr(alias, "<unknown string>");
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    if (var_36eebb886bbddcca) {
                        function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                    }
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57c2
// Size: 0x137
function function_7f7e506dee7aa8c2(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        /#
            assert(isdefined(self.var_ae3ea15396b65c1f));
        #/
        function_6421e5a82688da9d(asmname, statename, params);
        arc = self.var_ae3ea15396b65c1f;
        aliases = archetypegetaliases(arc, statename);
        foreach (alias in aliases) {
            anims = asm_getallanimsforalias(arc, statename, alias);
            if (isdefined(anims)) {
                foreach (xanim in anims) {
                    function_291d962b22a07e21(asmname, statename, alias, xanim);
                    function_d6919795e4b24d3a(asmname, statename, xanim, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5900
// Size: 0x51
function mapangleindextonumpad(idx) {
    mapping = [0:2, 1:3, 2:6, 3:9, 4:8, 5:7, 6:4, 7:1, 8:2];
    return mapping[idx];
}

// Namespace utility/namespace_34bf5965727c0922
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5959
// Size: 0x8e
function toggle_poiauto(var_f17895b3929d1bf5, yawmin, yawmax, pitchmin, pitchmax) {
    if (var_f17895b3929d1bf5) {
        if (!isdefined(self.poiauto)) {
            poiauto_init(yawmin, yawmax, pitchmin, pitchmax);
            thread poiauto_think();
            namespace_6205bc7c5e394598::set_gunpose("disable");
        }
    } else {
        self notify("poiauto_disable");
        self.poiauto = undefined;
        self.var_7731804dd640d78d = 0;
        namespace_6205bc7c5e394598::set_gunpose("automatic");
        self stoplookat();
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x59ee
// Size: 0x183
function set_poiauto_constraints(yawmax, yawmin, pitchmin, pitchmax) {
    /#
        assert(isdefined(self.poiauto));
    #/
    if (!isdefined(self.poiauto.og_yawmax)) {
        self.poiauto.og_yawmax = self.poiauto.yawmax;
    }
    if (!isdefined(self.poiauto.og_yawmin)) {
        self.poiauto.og_yawmin = self.poiauto.yawmin;
    }
    if (!isdefined(self.poiauto.og_pitchmin)) {
        self.poiauto.og_pitchmin = self.poiauto.pitchmin;
    }
    if (!isdefined(self.poiauto.og_pitchmax)) {
        self.poiauto.og_pitchmax = self.poiauto.pitchmax;
    }
    self.poiauto.yawmax = yawmax;
    self.poiauto.yawmin = yawmin;
    self.poiauto.pitchmin = pitchmin;
    self.poiauto.pitchmax = pitchmax;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b78
// Size: 0xeb
function reset_poiauto_constraints() {
    /#
        assert(isdefined(self.og_yawmax));
    #/
    /#
        assert(isdefined(self.og_yawmin));
    #/
    /#
        assert(isdefined(self.og_pitchmin));
    #/
    /#
        assert(isdefined(self.og_pitchmax));
    #/
    self.poiauto.yawmax = self.poiauto.og_yawmax;
    self.poiauto.yawmin = self.poiauto.og_yawmin;
    self.poiauto.pitchmin = self.poiauto.og_pitchmin;
    self.poiauto.pitchmax = self.poiauto.og_pitchmax;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c6a
// Size: 0x21c
function toggle_poi(var_f17895b3929d1bf5, firstpoint) {
    /#
        assertex(var_f17895b3929d1bf5 == 1 || var_f17895b3929d1bf5 == 0, "shouldEnable needs to be either true or false");
    #/
    self.currentpoi = undefined;
    self.nextpoi = undefined;
    self.doingpoi = var_f17895b3929d1bf5;
    self.disablelookdownpath = var_f17895b3929d1bf5;
    if (isdefined(self.cqb_point_of_interest)) {
        self.cqb_point_of_interest = undefined;
        self function_f7d83c92f61dcc31(0);
    }
    if (!var_f17895b3929d1bf5) {
        /#
            assertex(isdefined(level.poi_activeai), "Can't disable from POI if POIs have never been enabled!!!!");
        #/
        level.poi_activeai = array_remove(level.poi_activeai, self);
        self.turnrate = ter_op(isdefined(self.poi_oldturnrate), self.poi_oldturnrate, self.turnrate);
        self.gunadditiveoverride = undefined;
        self.disablelookdownpath = undefined;
        self._blackboard.forcestrafe = 0;
        self.gunposeoverride = undefined;
        self stoplookat();
    } else {
        currentspeed = self aigetdesiredspeed();
        archetype = self getbasearchetype();
        var_1e5343d5beae9c26 = getanimspeedthreshold(archetype, "fast");
        self aisetdesiredspeed(min(currentspeed, var_1e5343d5beae9c26));
        if (!isdefined(level.poi_activeai)) {
            level.poi_activeai = [];
        }
        level.poi_activeai[level.poi_activeai.size] = self;
        if (isdefined(level.fnfindcqbpointsofinterest) && !istrue(level.alreadyfindingpoi)) {
            level thread [[ level.fnfindcqbpointsofinterest ]]();
            level.alreadyfindingpoi = 1;
        }
        /#
            assert(!isdefined(firstpoint) || isstruct(firstpoint));
        #/
        self.poi_oldturnrate = self.turnrate;
        self.turnrate = 0.25;
        self.leftaimlimit = 90;
        self.rightaimlimit = -90;
        self.poi_firstpoint = firstpoint;
        self.gunposeoverride = "disable";
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8d
// Size: 0x1f
function shouldinitiallyattackfromexposed(node) {
    return self._blackboard.shouldinitiallyattackfromexposed;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb4
// Size: 0x1e9
function cover_canattackfromexposed(enemyorigin, node) {
    /#
        assert(isdefined(self.enemy));
    #/
    if (!isplayer(self.enemy) && !isai(self.enemy)) {
        return 1;
    }
    if (cover_canattackfromexposedcached()) {
        return cover_canattackfromexposedgetcache();
    }
    if (!isdefined(node)) {
        node = self.covernode;
    }
    if (!isdefined(node)) {
        node = self.node;
    }
    if (!isdefined(node)) {
        return 0;
    }
    higheststance = gethighestallowedstance();
    var_639828dc8bac6376 = 56;
    if (higheststance != "stand") {
        var_639828dc8bac6376 = 32;
    }
    startorigin = node.origin + (0, 0, var_639828dc8bac6376);
    if (!isdefined(enemyorigin)) {
        if (isai(self.enemy) && !isbot(self.enemy)) {
            enemyorigin = self.enemy getapproxeyepos();
        } else {
            enemyorigin = self.enemy geteye();
        }
    }
    var_d786be37f6c3bf95 = 1000;
    self._blackboard.canattackfromexposed = sighttracepassed(startorigin, enemyorigin, 0, undefined);
    self._blackboard.canattackfromexposedtime = gettime() + var_d786be37f6c3bf95;
    /#
        if (getdvarint(@"hash_12099888645f099a")) {
            color = (1, 0, 0);
            if (self._blackboard.canattackfromexposed) {
                color = (0, 1, 0);
            }
            print3d(startorigin, "<unknown string>", color, 1, 1, 15);
            line(startorigin, enemyorigin, color, 1, 1, 15);
        }
    #/
    return self._blackboard.canattackfromexposed;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60a5
// Size: 0x34
function cover_canattackfromexposedcached() {
    return isdefined(self._blackboard.canattackfromexposedtime) && self._blackboard.canattackfromexposedtime > gettime();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e1
// Size: 0x16
function cover_canattackfromexposedgetcache() {
    return self._blackboard.canattackfromexposed;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60ff
// Size: 0xb4
function poiauto_init(yawmin, yawmax, pitchmin, pitchmax) {
    if (!isdefined(yawmin)) {
        yawmin = 15;
    }
    if (!isdefined(yawmax)) {
        yawmax = 35;
    }
    if (!isdefined(pitchmin)) {
        pitchmin = -20;
    }
    if (!isdefined(pitchmax)) {
        pitchmax = 0;
    }
    self.poiauto = spawnstruct();
    self.poiauto.yawmax = yawmax;
    self.poiauto.yawmin = yawmin;
    self.poiauto.pitchmin = pitchmin;
    self.poiauto.pitchmax = pitchmax;
    self.var_7731804dd640d78d = 1;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61ba
// Size: 0x152
function poiauto_think() {
    self endon("poiauto_disable");
    self endon("death");
    var_c2d5805bcd983331 = 500;
    var_5c9ae5533ed1462 = 0;
    var_4fc17a8ee1c0d087 = 0;
    var_46de370fcb18a1b0 = gettime() + 30000;
    if (!isdefined(self.poiauto)) {
        poiauto_init();
    }
    while (1) {
        var_d74b916a1980d11a = 0;
        if (var_46de370fcb18a1b0 <= gettime()) {
            self.poiauto_angles = (0, 0, 0);
            if (var_46de370fcb18a1b0 == var_5c9ae5533ed1462) {
                var_d74b916a1980d11a = 1;
            }
        }
        if (var_5c9ae5533ed1462 <= gettime()) {
            var_46de370fcb18a1b0 = gettime() + int(randomfloatrange(0.8, 1.8) * 1000);
            var_4fc17a8ee1c0d087 = gettime();
            poiauto_setnewaimangle(var_d74b916a1980d11a);
            var_3080e8000aad4930 = var_c2d5805bcd983331 - gettime();
            var_37b7ec64d7b29bdb = var_46de370fcb18a1b0 - gettime();
            if (abs(var_37b7ec64d7b29bdb - var_3080e8000aad4930) >= 550 && cointoss()) {
                var_5c9ae5533ed1462 = var_46de370fcb18a1b0;
            } else if (var_3080e8000aad4930 > 3000) {
                var_5c9ae5533ed1462 = gettime() + randomintrange(2000, 3000);
            } else {
                var_5c9ae5533ed1462 = gettime() + var_3080e8000aad4930 + 550 + randomintrange(1000, 2000);
            }
        }
        waitframe();
    }
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6313
// Size: 0x5d
function poiauto_relativeangletopos(angles) {
    forward = anglestoforward(angles);
    var_c568587f2f09cb94 = rotatevector(forward, self.angles);
    eye = self getapproxeyepos();
    pos = eye + var_c568587f2f09cb94 * 128;
    return pos;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6378
// Size: 0x5b
function poiauto_glancerandom() {
    yaw = randomfloatrange(-45, 45);
    pitch = randomfloatrange(-20, 20);
    pos = poiauto_relativeangletopos((pitch, yaw, 0));
    self.var_8ce6d9fc1435dd86 = 1;
    thread poiauto_glanceend();
    self glanceatpos(pos);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63da
// Size: 0x22
function poiauto_glanceend() {
    self notify("poiauto_glanceend");
    self endon("poiauto_glanceend");
    wait(0.55);
    self.var_8ce6d9fc1435dd86 = 0;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6403
// Size: 0xd
function poiauto_isglancing() {
    return istrue(self.var_8ce6d9fc1435dd86);
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6418
// Size: 0xf6
function poiauto_setnewaimangle(var_d74b916a1980d11a) {
    if (var_d74b916a1980d11a) {
        yaw = randomfloatrange(self.poiauto_angles[1] + 5, self.poiauto_angles[1] + 10);
        pitch = randomfloatrange(5, 10);
        if (cointoss()) {
            pitch = pitch * -1;
        }
        pitch = self.poiauto_angles[0] + pitch;
    } else {
        poiauto = self.poiauto;
        yaw = randomfloatrange(poiauto.yawmin, poiauto.yawmax);
        pitch = randomfloatrange(poiauto.pitchmin, poiauto.pitchmax);
    }
    if (cointoss()) {
        yaw = yaw * -1;
    }
    self.poiauto_nextangles = (pitch, yaw, 0);
    self.poiauto_nextaimtime = randomintrange(100, 300) + gettime();
}

// Namespace utility/namespace_34bf5965727c0922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6515
// Size: 0x36
function function_2285421dfc79c4d5() {
    var_38548703ea2bdadc = undefined;
    if (isdefined(self.animationarchetype)) {
        var_38548703ea2bdadc = self.animationarchetype;
    } else {
        var_38548703ea2bdadc = self.var_ae3ea15396b65c1f;
    }
    return var_38548703ea2bdadc;
}

// Namespace utility/namespace_34bf5965727c0922
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6553
// Size: 0xc8
function function_75996a8dac6970f2(range) {
    if (!isdefined(range)) {
        range = 1024;
    }
    if (issp()) {
        player = level.player;
    } else {
        players = sortbydistance(level.players, self.origin);
        player = players[0];
    }
    if (self isnearanyplayer(range)) {
        lookpoint = player.origin + (0, 0, 55);
    } else {
        lookpoint = self.origin + (0, 0, 55) + anglestoforward(self.angles + (0, randomintrange(-135, 180), 0)) * 300;
    }
    return lookpoint;
}

