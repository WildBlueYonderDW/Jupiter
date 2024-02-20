// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using script_7d535542e36d66f9;
#using script_53651341190c5aab;
#using script_10b6724c15a95e8;
#using script_5262c59c62fa4892;

#namespace namespace_a0526ae8e2e2b67;

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x10f
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_902f9e79d5e57c83":
        return &function_d9a30a0827fab997;
    case #"hash_ae182ac0084f18fa":
        return &function_13c5106712ee80f6;
    case #"hash_cfc067e44f70f86b":
        return &reviving;
    case #"hash_e7ffa3549475787":
        return &function_7436e5b9117c6fab;
    case #"hash_f5cf55913a442596":
        return &function_23319222a7765cf2;
    case #"hash_303d74db152a39b9":
        return &namespace_f901a4f9d899be59::function_606c28b248baddfd;
    case #"hash_be6abeab18f64c91":
        return &function_3f662d6595827e55;
    case #"hash_25397093dba07e3a":
        return &function_c99a7a6af360dabe;
    case #"hash_2a5b537d23266f19":
        return &function_44b26bbd70e007bd;
    case #"hash_669a3d0df855846d":
        return &function_8cfa9efbcd45c5b1;
    case #"hash_18372b0f69e4b08c":
        return &function_c94b8b5381c080f8;
        break;
    }
    /#
        assertmsg("Missing function pointer for " + var_cc4f2e0388379546);
    #/
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0xc
function function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417
// Size: 0x136
function function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    /#
        if (isagent(self)) {
            /#
                assertex(self isscriptable(), "4" + self.agent_type + "<unknown string>");
            #/
        }
    #/
    var_8a46c62f0a756dd3 = "revival_helper_stim";
    if (self isscriptable() && self getscriptablehaspart(var_8a46c62f0a756dd3)) {
        self setscriptablepartstate(var_8a46c62f0a756dd3, "default");
    }
    self unlink();
    self.pushable = 1;
    self.skipdyingbackcrawl = 0;
    if (!isalive(self)) {
        function_ae368fad1a1dc337(var_f8d4ed108521e632, "death", 1);
    } else {
        if (self.var_fe5ebefa740c7106 == 0) {
            function_ae368fad1a1dc337(var_f8d4ed108521e632, "stealth_idle", 1);
        } else if (self.asmname == self.var_a942dd31d55102c9) {
            function_ae368fad1a1dc337(var_f8d4ed108521e632, "death", 1);
        }
        asm_fireephemeralevent("revival", "end");
        self clearbtgoal(3);
        self.var_26aa5cb1924a027 = 0;
        self.var_c3b6984b9532af5b = 0;
        if (self.var_d3404efce3fc4fa6) {
            function_4c1d28fa0f0bbba8();
            function_ddf0d739daa1d97c();
        }
    }
    self notify("end_revival");
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x554
// Size: 0x8d
function function_d9a30a0827fab997(receiver, info, origin) {
    if (info == "focused_on" && !doinglongdeath()) {
        distsq = distancesquared(receiver.origin, origin);
        var_63233bca53efdd98 = 200;
        if (distsq < var_63233bca53efdd98 * var_63233bca53efdd98 && !istrue(function_60d6151af81a343(self function_92435c7a6ae85c3c(), "death"))) {
            function_ae368fad1a1dc337(self function_92435c7a6ae85c3c(), "death", 1);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9
// Size: 0x3c6
function function_13c5106712ee80f6(statename, params) {
    self endon("death");
    self endon("end_revival");
    var_ceb886eb060aed49 = function_fa0aae45ce9c1727();
    if (!isdefined(var_ceb886eb060aed49)) {
        function_2d7fa1f11c70ad04();
    }
    var_ceb886eb060aed49 endon("death");
    var_ceb886eb060aed49 endon("end_revival");
    var_8eefcde993e5ae9d = 10;
    var_c104ef9b1caef15d = var_ceb886eb060aed49.origin;
    self setbtgoalpos(3, var_c104ef9b1caef15d);
    self setbtgoalradius(3, var_8eefcde993e5ae9d);
    self waittill("path_set");
    self.var_26aa5cb1924a027 = 1;
    self.var_c3b6984b9532af5b = 1;
    var_6bc273ba321491f0 = 200;
    pathlength = self pathdisttogoal();
    while (pathlength > var_6bc273ba321491f0) {
        if (!isdefined(var_ceb886eb060aed49)) {
            function_2d7fa1f11c70ad04();
        }
        var_c104ef9b1caef15d = var_ceb886eb060aed49.origin;
        self setbtgoalpos(3, var_c104ef9b1caef15d);
        wait(0.2);
        pathlength = self pathdisttogoal();
    }
    if (!isdefined(var_ceb886eb060aed49)) {
        function_2d7fa1f11c70ad04();
    }
    var_ceb886eb060aed49 animmode("angle deltas");
    var_ceb886eb060aed49.skipdyingbackcrawl = 1;
    var_ceb886eb060aed49 asmfireevent(var_ceb886eb060aed49.asmname, "dying_back_crawl_done");
    var_c104ef9b1caef15d = var_ceb886eb060aed49.origin;
    var_ceb886eb060aed49.pushable = 0;
    self.pushable = 0;
    var_b3cd99f8e04ad13f = function_9d6585cc199439cb(var_ceb886eb060aed49);
    var_975be27f963e2f30 = "reviving_guy";
    var_996949b7474560eb = function_a0cccf0b4c466b2c(self, var_975be27f963e2f30);
    var_12d7533dd135629e = var_996949b7474560eb.animation;
    var_b70cf2e9eaa2927e = "reviving_intro";
    alias = archetypegetalias(var_12d7533dd135629e, var_b70cf2e9eaa2927e, var_b3cd99f8e04ad13f, 0);
    animation = alias.anims;
    startorigin = getstartorigin(var_ceb886eb060aed49.origin, var_ceb886eb060aed49.angles, animation);
    startangles = getstartangles(var_ceb886eb060aed49.origin, var_ceb886eb060aed49.angles, animation);
    if (!ispointonnavmesh(startorigin, self)) {
        var_9373e8da64267c1f = function_be5400e991ae040a(var_b3cd99f8e04ad13f);
        alias = archetypegetalias(var_12d7533dd135629e, var_b70cf2e9eaa2927e, var_9373e8da64267c1f, 0);
        animation = alias.anims;
        startorigin = getstartorigin(var_ceb886eb060aed49.origin, var_ceb886eb060aed49.angles, animation);
        startangles = getstartangles(var_ceb886eb060aed49.origin, var_ceb886eb060aed49.angles, animation);
        if (!ispointonnavmesh(startorigin, self)) {
            var_ceb886eb060aed49.var_d5e499e7fe2c490b = 0;
            function_ae368fad1a1dc337(self function_92435c7a6ae85c3c(), "death", 1);
        }
    }
    self.var_14461074a827aac9 = startorigin;
    self setbtgoalpos(3, self.var_14461074a827aac9);
    self.var_6f56798704f22ad1 = startangles;
    self.var_a41edf45bb0ff97 = self.var_6f56798704f22ad1;
    self.var_c55c721292fdb08b = "crouch";
    var_c70217358eddbeb2 = 2;
    waittill_any_timeout_1(var_c70217358eddbeb2, "bt_goal");
    while (istrue(self.arriving)) {
        waitframe();
    }
    if (!isdefined(var_ceb886eb060aed49)) {
        function_2d7fa1f11c70ad04();
    }
    var_a9efda5c39dab5c0 = 32;
    if (distancesquared(self.origin, self.var_14461074a827aac9) < var_a9efda5c39dab5c0 * var_a9efda5c39dab5c0) {
        namespace_aebb27832287cd3a::cap_start("cap_ai_revival", "caps/interactions/cap_ai_revival");
        self waittill("reviving_intro_starts");
    } else {
        function_ae368fad1a1dc337(self function_92435c7a6ae85c3c(), "death", 1);
    }
    self.var_26aa5cb1924a027 = 0;
    self clearbtgoal(3);
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b6
// Size: 0x7a
function reviving(statename, params) {
    self endon("death");
    self endon("end_revival");
    self endon("cap_exit_completed");
    childthread function_971f2ce9ce3cf9e8();
    wait(0.3);
    var_278c159e227fb4e3 = function_fa0aae45ce9c1727();
    self.var_26aa5cb1924a027 = 0;
    if (isdefined(var_278c159e227fb4e3)) {
        self linktoblendtotag(var_278c159e227fb4e3, "tag_sync");
    }
    self waittill("cap_exit_completed");
    self.var_f69704726b42b5c2 = gettime();
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x96
function function_7436e5b9117c6fab(statename, params) {
    self endon("death");
    self endon("end_revival");
    namespace_aebb27832287cd3a::cap_start("cap_ai_revival", "caps/interactions/cap_ai_revival");
    while (!asm_ephemeraleventfired("being_revived", "end")) {
        frametime = level.frameduration;
        self.desiredtimeofdeath = self.desiredtimeofdeath + frametime;
        waitframe();
    }
    self.doinglongdeath = 0;
    self.health = 150;
    self waittill("cap_exit_completed");
    function_db717d5877caf11d();
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x68
function function_23319222a7765cf2(statename, params) {
    self endon("death");
    self endon("end_revival");
    asm_fireevent(self.asmname, "early_revived_success");
    if (istrue(self.doinglongdeath)) {
        self.doinglongdeath = 0;
        self.health = 150;
    }
    self waittill("cap_exit_completed");
    function_db717d5877caf11d();
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb43
// Size: 0x11f
function function_3f662d6595827e55(statename, params) {
    self endon("death");
    self endon("end_revival");
    self function_9f82c74eb1b7caf9(0);
    self allowedstances("stand");
    self.revivetarget = function_fa0aae45ce9c1727();
    targetpos = self.revivetarget.origin;
    var_7a92b8154e0aeec8 = self cansee(self.revivetarget);
    if (!var_7a92b8154e0aeec8 || distancesquared(self.origin, targetpos) > self.var_5f147643cac35943 * self.var_5f147643cac35943) {
        var_5dc6e1ba94643e35 = self.revivetarget getapproxeyepos();
        goalpos = findclosestlospointwithinradius(var_5dc6e1ba94643e35, self.var_5f147643cac35943, var_5dc6e1ba94643e35, self.origin);
        self setbtgoalpos(3, goalpos);
        self setbtgoalradius(3, 32);
        self waittill("bt_goal");
    } else {
        self function_e64ea2b4e79c4b74(3);
    }
    while (self.arriving) {
        waitframe();
    }
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc69
// Size: 0x3b
function function_c99a7a6af360dabe(statename, params) {
    self endon("death");
    self endon("end_revival");
    namespace_aebb27832287cd3a::cap_start("cap_ai_revival", "caps/interactions/cap_ai_revival");
    self waittill("cap_exit_completed");
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcab
// Size: 0x96
function function_44b26bbd70e007bd(statename, params) {
    self endon("death");
    self endon("end_revival");
    self.revivetarget = undefined;
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.var_f3827976dc178720 = self.maxfaceenemydist;
    self.maxfaceenemydist = 2048;
    self.providecoveringfire = 1;
    self.balwayscoverexposed = 1;
    self.shootstyleoverride = "full";
    wait(self.var_1ed26f360217ee85);
    function_ddf0d739daa1d97c();
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd48
// Size: 0x2a
function function_c94b8b5381c080f8(statename, params) {
    self endon("death");
    self endon("end_revival");
    self waittill("shot_by_revive_pistol");
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd79
// Size: 0x57
function function_8cfa9efbcd45c5b1(statename, params) {
    self endon("death");
    self endon("end_revival");
    namespace_aebb27832287cd3a::cap_start("cap_ai_revival", "caps/interactions/cap_ai_revival");
    self waittill("cap_exit_completed");
    self.doinglongdeath = 0;
    self.health = self.maxhealth;
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd7
// Size: 0x4b
function private function_ddf0d739daa1d97c() {
    if (!isdefined(self.var_f3827976dc178720)) {
        return;
    }
    self.providecoveringfire = 0;
    self.balwayscoverexposed = 0;
    self.shootstyleoverride = undefined;
    self.maxfaceenemydist = self.var_f3827976dc178720;
    self.var_f3827976dc178720 = undefined;
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe29
// Size: 0x3e
function private function_4c1d28fa0f0bbba8() {
    self.ignoreall = 0;
    self.combatmode = "cover";
    self function_9f82c74eb1b7caf9(1);
    self allowedstances("stand", "crouch");
    self clearbtgoal(3);
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe6e
// Size: 0x20
function private function_db717d5877caf11d() {
    var_ec2ebfc4cc6bffc1 = function_5669cb34cd563512();
    if (isdefined(var_ec2ebfc4cc6bffc1)) {
        var_ec2ebfc4cc6bffc1 unlink();
    }
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe95
// Size: 0x100
function private function_971f2ce9ce3cf9e8() {
    startpos = self.origin;
    startangles = self.angles;
    var_41845ce3e73bb4f2 = distancesquared(startpos, self.var_14461074a827aac9) > 100;
    var_8df2b0c826a4a7b2 = absangleclamp180(startangles[1] - self.var_6f56798704f22ad1[1]) > 7;
    if (var_41845ce3e73bb4f2 || var_8df2b0c826a4a7b2) {
        interval = 300;
        endtime = gettime() + interval;
        while (endtime > gettime()) {
            fraction = 1 - (endtime - gettime()) / interval;
            newpos = vectorlerp(startpos, self.var_14461074a827aac9, fraction);
            newangles = anglelerpquatfrac(startangles, self.var_6f56798704f22ad1, fraction);
            self forceteleport(newpos, newangles);
            waitframe();
        }
    }
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf9c
// Size: 0x44
function private function_9d6585cc199439cb(var_ceb886eb060aed49) {
    var_3b3c2e088b48d1e2 = 6;
    var_44fbe4141b0cb046 = "_back";
    if (isdefined(var_ceb886eb060aed49)) {
        var_3b3c2e088b48d1e2 = namespace_55d2e8f86217c54a::function_a1e95f167c3c1107(var_ceb886eb060aed49, self);
        var_44fbe4141b0cb046 = var_ceb886eb060aed49 namespace_55d2e8f86217c54a::getdamagedirectionsuffix();
    }
    return var_3b3c2e088b48d1e2 + var_44fbe4141b0cb046;
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfe8
// Size: 0x39
function private function_be5400e991ae040a(alias) {
    if (alias[0] == "4") {
        return ("6" + getsubstr(alias, 1));
    } else {
        return ("4" + getsubstr(alias, 1));
    }
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1028
// Size: 0x1d
function private function_2d7fa1f11c70ad04() {
    function_ae368fad1a1dc337(self function_92435c7a6ae85c3c(), "death", 1);
    self function_ea63241a4d3092c4();
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x104c
// Size: 0x2d
function private function_fa0aae45ce9c1727() {
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6(id, "dying_guy");
    return users[0];
}

// Namespace namespace_a0526ae8e2e2b67/namespace_35286fc8500a0a07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1081
// Size: 0x2d
function private function_5669cb34cd563512() {
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6(id, "reviving_guy");
    return users[0];
}

