// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\cap.gsc;
#using scripts\common\cap.gsc;

#namespace interaction_common;

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273
// Size: 0x14
function function_72d72588305107b4(interactionid) {
    self notify("interaction_started");
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x3c
function function_8add99cb1b82b964(interactionid) {
    self.var_7916f201efb9963f = undefined;
    self._blackboard.idlenode = undefined;
    self._blackboard.var_c71a487341c700f3 = undefined;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1
// Size: 0x133
function function_efcea5d26798e5b6(funcid) {
    switch (funcid) {
    case #"hash_4d7ca12cb5ce1028":
        return &startcap;
    case #"hash_303d74db152a39b9":
        return &function_606c28b248baddfd;
    case #"hash_996b6e15533d90f1":
        return &withindisttogoal;
    case #"hash_ea4044776d5dc7d8":
        return &function_75bde4ab677d8c14;
    case #"hash_b541f16499b1633d":
        return &processevent;
    case #"hash_c0639b15cea67610":
        return &function_72d72588305107b4;
    case #"hash_96053be986d24f88":
        return &function_8add99cb1b82b964;
    case #"hash_cec0f8624eb06844":
        return &scripts/asm/cap::function_8439b78c94685919;
    case #"hash_af8904470869cfc3":
        return &function_5b942e48767afec7;
    case #"hash_fa94bdd8e04e26b2":
        return &isincombat;
    case #"hash_ebaec88a56e0a8a5":
        return &shouldreact;
    case #"hash_a56eca06864aaf61":
        return &inplace;
    case #"hash_8cc77e3e31358f72":
        return &function_8f98221d71dafe6e;
    case #"hash_fd9154ff75bc4e6b":
        return &function_d8786f820807c4f;
    case #"hash_e8db290ca384380d":
        return &function_688018e12db6e359;
    }
    /#
        assertmsg("Missing function pointer for " + funcid);
    #/
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b
// Size: 0x45
function function_606c28b248baddfd(statename, params) {
    /#
        assert(params.size == 1);
    #/
    phasename = params[0];
    self._blackboard.var_7460b96395361857 = phasename;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x457
// Size: 0x215
function startcap(statename, params) {
    if (istrue(self.var_3605e45b535f0536)) {
        function_b76d8b8ad8e2c823(statename, params);
    }
    capinfo = function_a0cccf0b4c466b2c(self, params[0]);
    if (!isdefined(capinfo)) {
        return;
    }
    capname = capinfo.capname;
    animset = capinfo.animation;
    var_bcf3c74b1d8b4883 = capinfo.var_bcf3c74b1d8b4883;
    introstatename = capinfo.initialstate;
    var_127e00a9379f717c = capinfo.var_bad4f0bd11cbdcf9;
    interaction = spawnstruct();
    interaction.angles = self._blackboard.var_66c82b7660f29059;
    interaction.origin = self._blackboard.var_ad5eda311c73f5d7;
    if (isdefined(self findoverridearchetype("default"))) {
        var_51fb64c4bfcd847 = self findoverridearchetype("default") + "_cap_arrival";
        if (archetypehasstate(capname, var_51fb64c4bfcd847)) {
            var_bcf3c74b1d8b4883 = var_51fb64c4bfcd847;
        }
    }
    if (isdefined(introstatename) && isdefined(var_127e00a9379f717c)) {
        alias = archetypegetalias(animset, introstatename, var_127e00a9379f717c, 0);
        animation = alias.anims;
        if (isarray(animation)) {
            animation = animation[0];
        }
        originalangles = interaction.angles;
        originalorigin = interaction.origin;
        interaction.origin = getstartorigin(originalorigin, originalangles, animation);
        interaction.angles = getstartangles(originalorigin, originalangles, animation);
    }
    self.var_a70672e669ca7f00 = interaction.angles;
    self.interaction_origin = getgroundposition(interaction.origin, 1);
    scripts/common/cap::cap_reach_and_arrive(interaction, capname, animset, var_bcf3c74b1d8b4883);
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x673
// Size: 0x21a
function function_b76d8b8ad8e2c823(statename, params) {
    capinfo = function_a0cccf0b4c466b2c(self, params[0]);
    capname = capinfo.capname;
    animset = capinfo.animation;
    var_bcf3c74b1d8b4883 = capinfo.var_bcf3c74b1d8b4883;
    introstatename = capinfo.initialstate;
    var_127e00a9379f717c = capinfo.var_bad4f0bd11cbdcf9;
    interaction = spawnstruct();
    interaction.angles = self._blackboard.var_66c82b7660f29059;
    interaction.origin = self._blackboard.var_ad5eda311c73f5d7;
    if (isdefined(self findoverridearchetype("default"))) {
        var_51fb64c4bfcd847 = self findoverridearchetype("default") + "_cap_arrival";
        if (archetypehasstate(capname, var_51fb64c4bfcd847)) {
            var_bcf3c74b1d8b4883 = var_51fb64c4bfcd847;
        }
    }
    if (isdefined(introstatename) && isdefined(var_127e00a9379f717c)) {
        alias = archetypegetalias(animset, introstatename, var_127e00a9379f717c, 0);
        animation = alias.anims;
        if (isarray(animation)) {
            animation = animation[0];
        }
        originalangles = interaction.angles;
        originalorigin = interaction.origin;
        interaction.origin = getstartorigin(originalorigin, originalangles, animation);
        interaction.angles = getstartangles(originalorigin, originalangles, animation);
    }
    self.var_a70672e669ca7f00 = interaction.angles;
    self.interaction_origin = interaction.origin;
    scripts/common/cap::cap_start(capname, animset, 0);
    scripts/asm/asm::asm_fireephemeralevent("move", "end");
    self forceteleport(self.interaction_origin, self.var_a70672e669ca7f00, 2048);
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x894
// Size: 0x38
function withindisttogoal(statename, params) {
    mindist = params[0];
    if (self.pathpending) {
        return false;
    }
    return self pathdisttogoal() <= mindist;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d4
// Size: 0x187
function processevent(receiver, info, origin) {
    if (info == "relaxed") {
        return true;
    } else if (info == "panicked" || info == "cower" || info == "scared" || info == "flee") {
        scripts/asm/cap::prop_drop();
        self._blackboard.var_7460b96395361857 = "exit";
    } else if (info == "curious") {
        self._blackboard.var_c71a487341c700f3 = self._blackboard.var_7460b96395361857;
        var_2aa3f9382269a724 = self function_c0de39048eedde94();
        if (scripts/asm/cap::function_f179ede0989e6734("curious", "curious_anim")) {
            self._blackboard.var_7460b96395361857 = "curious";
            return true;
        } else if (!var_2aa3f9382269a724) {
            return true;
        } else {
            scripts/asm/cap::prop_drop();
            self._blackboard.var_7460b96395361857 = "exit";
            return false;
        }
    } else if (!isdefined(self._blackboard.var_7460b96395361857) || isdefined(self._blackboard.var_7460b96395361857) && self._blackboard.var_7460b96395361857 != "end") {
        self._blackboard.var_7460b96395361857 = "react";
        return true;
    }
    return false;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa63
// Size: 0x4f
function function_75bde4ab677d8c14(params) {
    if (isdefined(self._blackboard.var_7460b96395361857) && isdefined(params) && params.size > 0) {
        if (self._blackboard.var_7460b96395361857 == params[0]) {
            return true;
        }
    }
    return false;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaba
// Size: 0xc
function empty(params) {
    
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x51
function function_5b942e48767afec7(param) {
    statename = "curious";
    alias = "curious_anim";
    animresult = archetypegetrandomalias(self.animsetname, statename, alias, 0);
    if (isdefined(animresult)) {
        return true;
    }
    return false;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb26
// Size: 0x1d
function isincombat(statename, params) {
    return self.bisincombat;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4b
// Size: 0x12
function shouldreact(params) {
    return self function_a4a9e73b2d25ff8b();
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb65
// Size: 0x4e
function inplace(statename, params) {
    self._blackboard.var_f725b0bb1f8d27ee = 1;
    interactionid = self function_92435c7a6ae85c3c();
    /#
        assert(isdefined(interactionid));
    #/
    function_c2a860252b030c52(interactionid);
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbba
// Size: 0x25
function function_25c933655d73066a(interactionid) {
    repulsorname = function_d980c506b2f1a19b(interactionid);
    destroynavrepulsor(repulsorname);
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe6
// Size: 0x13
function private function_d980c506b2f1a19b(interactionid) {
    return "civilian_interaction_" + interactionid;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc01
// Size: 0x2c3
function private function_c2a860252b030c52(interactionid) {
    var_36b6c21725713470 = function_adf0d34ff483c35a(interactionid);
    if (var_36b6c21725713470.size == 0) {
        return;
    }
    var_97e5d2c62501499e = [];
    foreach (bsequser in var_36b6c21725713470) {
        if (bsequser._blackboard.var_f725b0bb1f8d27ee) {
            var_97e5d2c62501499e[var_97e5d2c62501499e.size] = bsequser;
        }
    }
    if (var_97e5d2c62501499e.size == 0) {
        return;
    }
    circleorigin = (0, 0, 0);
    circleradius = 0;
    if (var_97e5d2c62501499e.size == 1) {
        circleorigin = var_97e5d2c62501499e[0].origin;
        circleradius = 15;
    } else if (var_97e5d2c62501499e.size >= 2) {
        minx = var_97e5d2c62501499e[0].origin[0];
        maxx = var_97e5d2c62501499e[0].origin[0];
        miny = var_97e5d2c62501499e[0].origin[1];
        maxy = var_97e5d2c62501499e[0].origin[1];
        for (i = 1; i < var_97e5d2c62501499e.size; i++) {
            var_5d8d3f6a643b89ed = var_97e5d2c62501499e[i].origin;
            if (var_5d8d3f6a643b89ed[0] < minx) {
                minx = var_5d8d3f6a643b89ed[0];
            } else if (var_5d8d3f6a643b89ed[0] > maxx) {
                maxx = var_5d8d3f6a643b89ed[0];
            }
            if (var_5d8d3f6a643b89ed[1] < miny) {
                miny = var_5d8d3f6a643b89ed[1];
                continue;
            }
            if (var_5d8d3f6a643b89ed[1] > maxy) {
                maxy = var_5d8d3f6a643b89ed[1];
            }
        }
        circleorigin = ((maxx + minx) / 2, (maxy + miny) / 2, 0);
        circleradiussq = 0;
        circleoriginz = 0;
        foreach (user in var_97e5d2c62501499e) {
            circleoriginz = circleoriginz + user.origin[2];
            distancefromcentersq = distance2dsquared(circleorigin, user.origin);
            if (distancefromcentersq > circleradiussq) {
                circleradiussq = distancefromcentersq;
            }
        }
        circleoriginz = circleoriginz / var_97e5d2c62501499e.size;
        circleorigin = circleorigin + (0, 0, circleoriginz);
        circleradius = sqrt(circleradiussq) + 24;
    }
    repulsorname = function_d980c506b2f1a19b(interactionid);
    destroynavrepulsor(repulsorname);
    createnavrepulsor(repulsorname, -1, circleorigin, circleradius, 0, "all");
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb
// Size: 0x51
function function_8f98221d71dafe6e(param) {
    statename = "react";
    alias = "8";
    animresult = archetypegetrandomalias(self.animsetname, statename, alias, 0);
    if (isdefined(animresult)) {
        return true;
    }
    return false;
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf24
// Size: 0x8a
function function_d8786f820807c4f(statename, params) {
    newstate = "custom_patrol_lookaround_passthrough";
    if (!isdefined(params[0])) {
        newstate = "stl_react_passthrough";
        if (!isdefined(self.var_fd01ad49b4e38ae8)) {
            self.var_fd01ad49b4e38ae8 = "med";
        }
    }
    if (self asmhasstate(self.asmname, newstate)) {
        /#
            assert(self asmhasstate(self.asmname, newstate));
        #/
        self asmsetstate(self.asmname, newstate);
    }
}

// Namespace interaction_common / namespace_f901a4f9d899be59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb5
// Size: 0x6b
function function_688018e12db6e359(param) {
    statename = "friend_down";
    alias = "friend_down_anim";
    if (!scripts/asm/cap::function_f179ede0989e6734(statename, alias)) {
        return false;
    }
    if (!isdefined(self._blackboard.var_7460b96395361857)) {
        return false;
    }
    return self._blackboard.var_7460b96395361857 == "friend_down";
}

