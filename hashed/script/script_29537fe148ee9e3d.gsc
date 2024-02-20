// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7d535542e36d66f9;
#using script_53651341190c5aab;

#namespace namespace_6ecb0b3bf9e2cf33;

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad
// Size: 0x133
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_8a6929c703898e78":
        return &function_22ad2c8bca9871a4;
    case #"hash_3830c02ed29b9bd":
        return &function_1829959bc78f41a9;
    case #"hash_2a3b81fd59207935":
        return &function_273633da55df7339;
    case #"hash_1d9348daf6d1a5c7":
        return &function_c441fa0827d790a3;
    case #"hash_b3cada4cba95eb5d":
        return &function_9aa657f85926df09;
    case #"hash_4f54865eea297354":
        return &function_9c6badb8075c4880;
    case #"hash_561e0f0540b7f727":
        return &function_f7911b207b7ea23b;
    case #"hash_dca2cd774e93c43b":
        return &function_f6f3ce8b49c1c3e7;
    case #"hash_cb9a60b9c8cfca45":
        return &function_1eb86a6134b967f9;
    case #"hash_cc3a03d50cb74f10":
        return &function_59f0c716b5f99a1c;
    case #"hash_49987181712dbfd5":
        return &function_46a6cb991c2a5d49;
    case #"hash_303d74db152a39b9":
        return &namespace_f901a4f9d899be59::function_606c28b248baddfd;
    case #"hash_2bb757aa70fc12dd":
        return &function_8586052802bd2c79;
        break;
    }
    /#
        assertmsg("Missing function pointer for " + var_cc4f2e0388379546);
    #/
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7
// Size: 0x2a5
function function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    if (!isdefined(level.var_80275ca89b572683)) {
        level.var_80275ca89b572683 = [];
    }
    if (!isdefined(level.var_80275ca89b572683[var_f8d4ed108521e632])) {
        level.var_80275ca89b572683[var_f8d4ed108521e632] = spawnstruct();
        level.var_80275ca89b572683[var_f8d4ed108521e632].var_e6aac1358274bc10 = 0;
        level.var_80275ca89b572683[var_f8d4ed108521e632].var_4e79a41164de0c24 = [];
    }
    if (!isdefined(self.var_80275ca89b572683)) {
        self.var_80275ca89b572683 = spawnstruct();
        self.var_80275ca89b572683.var_35c7cd77665dd90a = 0;
    }
    self.var_34127a7fbdb497c5 = 1;
    self.var_ecb9f6a505b89af6 = 1;
    self reacquireclear();
    self function_9f82c74eb1b7caf9(0, "bseq");
    self.var_80275ca89b572683.speed = self aigetdesiredspeed();
    self aisetdesiredspeed(120);
    self function_e64ea2b4e79c4b74(1);
    self setbtgoalradius(1, 20);
    level.var_80275ca89b572683[var_f8d4ed108521e632].var_4e79a41164de0c24[level.var_80275ca89b572683[var_f8d4ed108521e632].var_4e79a41164de0c24.size] = self.origin;
    self.var_80275ca89b572683.allowedstances = [];
    self.var_80275ca89b572683.var_d65f2a1135f5c6c6 = 0;
    if (self function_e862ed56b787162b("stand")) {
        self.var_80275ca89b572683.allowedstances[self.var_80275ca89b572683.var_d65f2a1135f5c6c6] = "stand";
        self.var_80275ca89b572683.var_d65f2a1135f5c6c6 = self.var_80275ca89b572683.var_d65f2a1135f5c6c6 + 1;
    }
    if (self function_e862ed56b787162b("crouch")) {
        self.var_80275ca89b572683.allowedstances[self.var_80275ca89b572683.var_d65f2a1135f5c6c6] = "crouch";
        self.var_80275ca89b572683.var_d65f2a1135f5c6c6 = self.var_80275ca89b572683.var_d65f2a1135f5c6c6 + 1;
    }
    if (self function_e862ed56b787162b("prone")) {
        self.var_80275ca89b572683.allowedstances[self.var_80275ca89b572683.var_d65f2a1135f5c6c6] = "prone";
        self.var_80275ca89b572683.var_d65f2a1135f5c6c6 = self.var_80275ca89b572683.var_d65f2a1135f5c6c6 + 1;
    }
    self allowedstances("stand");
    self notify("startlkpbehavior");
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0x195
function function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    self clearbtgoal(1);
    self aiclearscriptdesiredspeed();
    self function_9f82c74eb1b7caf9(1, "bseq");
    function_ae368fad1a1dc337(var_f8d4ed108521e632, "lkpanimtype", "none");
    self stoplookat();
    self.var_ecb9f6a505b89af6 = 0;
    self.var_34127a7fbdb497c5 = 0;
    if (self.var_80275ca89b572683.var_d65f2a1135f5c6c6 == 3) {
        self allowedstances(self.var_80275ca89b572683.allowedstances[0], self.var_80275ca89b572683.allowedstances[1], self.var_80275ca89b572683.allowedstances[2]);
    } else if (self.var_80275ca89b572683.var_d65f2a1135f5c6c6 == 2) {
        self allowedstances(self.var_80275ca89b572683.allowedstances[0], self.var_80275ca89b572683.allowedstances[1]);
    } else if (self.var_80275ca89b572683.var_d65f2a1135f5c6c6 == 1) {
        self allowedstances(self.var_80275ca89b572683.allowedstances[0]);
    }
    if (!isalive(self)) {
        function_ae368fad1a1dc337(var_f8d4ed108521e632, "death", 1);
    }
    self.var_80275ca89b572683 = undefined;
    var_9b83affdd5ed7ae0 = function_cbe869548ea6baac("primary_investigator", var_f8d4ed108521e632);
    if (!isdefined(var_9b83affdd5ed7ae0) || var_9b83affdd5ed7ae0 == self) {
        level.var_80275ca89b572683[var_f8d4ed108521e632] = undefined;
    }
    self notify("endlkpbehavior");
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82f
// Size: 0x7c
function function_22ad2c8bca9871a4(statename, params) {
    var_9b83affdd5ed7ae0 = function_cbe869548ea6baac("primary_investigator");
    var_9b83affdd5ed7ae0 endon("death");
    var_9b83affdd5ed7ae0 endon("endlkpbehavior");
    id = self function_92435c7a6ae85c3c();
    var_70637b1fcca27427 = function_cbd389222bce05ae("backup_investigator");
    var_412ab049e38bf9fa = var_9b83affdd5ed7ae0.origin;
    return function_a6f064acc25e8db8(var_412ab049e38bf9fa);
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b3
// Size: 0xb5
function function_1829959bc78f41a9(statename, params) {
    var_9b83affdd5ed7ae0 = function_cbe869548ea6baac("primary_investigator");
    var_9b83affdd5ed7ae0 endon("death");
    var_9b83affdd5ed7ae0 endon("endlkpbehavior");
    id = self function_92435c7a6ae85c3c();
    var_70637b1fcca27427 = function_cbd389222bce05ae("backup_investigator");
    level.var_80275ca89b572683[id].var_e6aac1358274bc10++;
    if (level.var_80275ca89b572683[id].var_e6aac1358274bc10 >= var_70637b1fcca27427.size) {
        function_ae368fad1a1dc337(id, "move_complete_initial", 1);
        level.var_80275ca89b572683[id].var_e6aac1358274bc10 = 0;
    }
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96f
// Size: 0x8f
function function_273633da55df7339(statename, params) {
    var_9b83affdd5ed7ae0 = function_cbe869548ea6baac("primary_investigator");
    var_9b83affdd5ed7ae0 endon("death");
    var_9b83affdd5ed7ae0 endon("endlkpbehavior");
    id = self function_92435c7a6ae85c3c();
    self function_e64ea2b4e79c4b74(1);
    lastknownposition = function_60d6151af81a343(id, "last_known_position");
    self setlookat(lastknownposition + (0, 0, 63));
    function_ae368fad1a1dc337(id, "lkpanimtype", "idle");
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa05
// Size: 0x18c
function function_c441fa0827d790a3(statename, params) {
    self endon("endlkpbehavior");
    self endon("death");
    wait(0.2);
    id = self function_92435c7a6ae85c3c();
    nummembers = function_60d6151af81a343(id, "num_members");
    if (isdefined(level.var_80275ca89b572683) && isdefined(level.var_80275ca89b572683[id]) && isdefined(level.var_80275ca89b572683[id].var_4e79a41164de0c24)) {
        level.var_80275ca89b572683[id].var_4e79a41164de0c24[level.var_80275ca89b572683[id].var_4e79a41164de0c24.size] = self.origin;
        lastknownposition = function_60d6151af81a343(id, "last_known_position");
        level.var_80275ca89b572683[id].var_4e79a41164de0c24[level.var_80275ca89b572683[id].var_4e79a41164de0c24.size] = lastknownposition;
        var_181b810d3de25443 = function_cbd389222bce05ae("backup_investigator");
        var_e598e495307893b6 = function_cbd389222bce05ae("RestOfThem");
        function_ae368fad1a1dc337(id, "num_backup_members", var_181b810d3de25443.size);
        nummembers = var_181b810d3de25443.size + var_e598e495307893b6.size;
        function_ae368fad1a1dc337(id, "num_members", nummembers);
        if (nummembers > 1) {
            function_ae368fad1a1dc337(id, "lkpanimtype", "cease_fire");
            self.var_63d7585bee031305 = 1;
            function_216c67ab6749137a(self, self.enemy, "last_known_position", "cease_fire", 0);
        }
    }
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb98
// Size: 0x8f
function function_5c56ba321fd2aec8() {
    var_497ae74eaa2f9c07 = undefined;
    if (isdefined(level.stealth) && isdefined(level.stealth.combat_volumes) && isdefined(self.stealth) && isdefined(level.stealth.combat_volumes[self.script_stealthgroup])) {
        var_497ae74eaa2f9c07 = level.stealth.combat_volumes[self.script_stealthgroup];
    } else {
        var_497ae74eaa2f9c07 = self getgoalvolume();
    }
    return var_497ae74eaa2f9c07;
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2f
// Size: 0x16a
function function_9aa657f85926df09(statename, params) {
    id = self function_92435c7a6ae85c3c();
    lastknownposition = function_60d6151af81a343(id, "last_known_position");
    var_e8d51bf2e0fd9bf4 = undefined;
    var_6df5cd3ffe06e6ce = 64;
    self setlookat(lastknownposition + (0, 0, 63));
    function_ae368fad1a1dc337(id, "lkpanimtype", "none");
    var_497ae74eaa2f9c07 = function_5c56ba321fd2aec8();
    if (isdefined(var_497ae74eaa2f9c07)) {
        var_e8d51bf2e0fd9bf4 = findclosestlospointwithinvolume(var_497ae74eaa2f9c07, lastknownposition + (0, 0, 63), lastknownposition, level.var_80275ca89b572683[id].var_4e79a41164de0c24, 0);
        if (!isdefined(var_e8d51bf2e0fd9bf4)) {
            var_e8d51bf2e0fd9bf4 = findclosestnonlospointwithinvolume(var_497ae74eaa2f9c07, lastknownposition + (0, 0, 63), lastknownposition, level.var_80275ca89b572683[id].var_4e79a41164de0c24, var_6df5cd3ffe06e6ce);
        }
    }
    if (!isdefined(var_e8d51bf2e0fd9bf4)) {
        var_e8d51bf2e0fd9bf4 = lastknownposition;
    }
    goalpos = self getclosestreachablepointonnavmesh(var_e8d51bf2e0fd9bf4);
    level.var_80275ca89b572683[id].var_4e79a41164de0c24[level.var_80275ca89b572683[id].var_4e79a41164de0c24.size] = goalpos;
    /#
        if (getdvarint(@"hash_9961f6e93a09b113") != 0) {
            sphere(goalpos, 6, (1, 0, 0), 0, 100);
        }
    #/
    return goalpos;
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1
// Size: 0x5b
function function_9c6badb8075c4880(statename, params) {
    id = self function_92435c7a6ae85c3c();
    function_ae368fad1a1dc337(id, "lkpanimtype", "lost_target");
    self.var_63d7585bee031305 = 1;
    function_216c67ab6749137a(self, self.enemy, "last_known_position", "lost_target");
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe03
// Size: 0x7c
function function_f7911b207b7ea23b(statename, params) {
    var_9b83affdd5ed7ae0 = function_cbe869548ea6baac("primary_investigator");
    var_9b83affdd5ed7ae0 endon("death");
    var_9b83affdd5ed7ae0 endon("endlkpbehavior");
    id = self function_92435c7a6ae85c3c();
    lastknownposition = function_60d6151af81a343(id, "last_known_position");
    self setlookat(lastknownposition + (0, 0, 63));
    return function_a6f064acc25e8db8(lastknownposition);
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe87
// Size: 0xb5
function function_f6f3ce8b49c1c3e7(statename, params) {
    var_9b83affdd5ed7ae0 = function_cbe869548ea6baac("primary_investigator");
    var_9b83affdd5ed7ae0 endon("death");
    var_9b83affdd5ed7ae0 endon("endlkpbehavior");
    id = self function_92435c7a6ae85c3c();
    level.var_80275ca89b572683[id].var_e6aac1358274bc10++;
    var_70637b1fcca27427 = function_cbd389222bce05ae("backup_investigator");
    if (level.var_80275ca89b572683[id].var_e6aac1358274bc10 >= var_70637b1fcca27427.size) {
        function_ae368fad1a1dc337(id, "move_complete_lkp", 1);
        level.var_80275ca89b572683[id].var_e6aac1358274bc10 = 0;
    }
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf43
// Size: 0x8a
function function_1eb86a6134b967f9(statename, params) {
    self endon("endlkpbehavior");
    self endon("death");
    waittill_any_timeout_1(5, "exposed_lkp");
    id = self function_92435c7a6ae85c3c();
    animtype = function_60d6151af81a343(id, "lkpanimtype");
    timeout = 10;
    if (animtype == "idle" || animtype == "none") {
        timeout = 2;
    }
    waittill_any_timeout_1(timeout, "exposed_lkp_finished");
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd4
// Size: 0x29
function function_46a6cb991c2a5d49(statename, params) {
    self function_e64ea2b4e79c4b74(1);
    self setbtgoalradius(1, params[0]);
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1004
// Size: 0x34
function function_59f0c716b5f99a1c(statename) {
    goalradius = 16;
    pathlength = self pathdisttogoal();
    if (pathlength <= goalradius) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1040
// Size: 0x15
function function_8586052802bd2c79(statename) {
    self clearbtgoal(1);
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105c
// Size: 0x38
function function_cbe869548ea6baac(tag, var_f8d4ed108521e632) {
    self endon("death");
    self endon("endlkpbehavior");
    users = function_cbd389222bce05ae(tag, var_f8d4ed108521e632);
    return users[0];
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109c
// Size: 0x42
function function_cbd389222bce05ae(tag, var_f8d4ed108521e632) {
    self endon("death");
    self endon("endlkpbehavior");
    if (!isdefined(var_f8d4ed108521e632)) {
        var_f8d4ed108521e632 = self function_92435c7a6ae85c3c();
    }
    users = function_fce201c1f66b31b6(var_f8d4ed108521e632, tag);
    return users;
}

// Namespace namespace_6ecb0b3bf9e2cf33/namespace_995db87c2e6671d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e6
// Size: 0x1bb
function function_a6f064acc25e8db8(var_79029e89a95370d9) {
    self endon("death");
    self endon("endlkpbehavior");
    id = self function_92435c7a6ae85c3c();
    var_6df5cd3ffe06e6ce = 100;
    var_497ae74eaa2f9c07 = function_5c56ba321fd2aec8();
    if (isdefined(var_497ae74eaa2f9c07)) {
        var_e8d51bf2e0fd9bf4 = findclosestlospointwithinvolume(var_497ae74eaa2f9c07, var_79029e89a95370d9 + (0, 0, 63), var_79029e89a95370d9, level.var_80275ca89b572683[id].var_4e79a41164de0c24, var_6df5cd3ffe06e6ce);
        if (!isdefined(var_e8d51bf2e0fd9bf4)) {
            var_e8d51bf2e0fd9bf4 = findclosestnonlospointwithinvolume(var_497ae74eaa2f9c07, var_79029e89a95370d9 + (0, 0, 63), var_79029e89a95370d9, level.var_80275ca89b572683[id].var_4e79a41164de0c24, var_6df5cd3ffe06e6ce);
        }
    } else {
        var_2e61d47fcb18d101 = 1000;
        var_e8d51bf2e0fd9bf4 = findclosestlospointwithinradius(self.origin, var_2e61d47fcb18d101, var_79029e89a95370d9 + (0, 0, 63), var_79029e89a95370d9, level.var_80275ca89b572683[id].var_4e79a41164de0c24, var_6df5cd3ffe06e6ce);
    }
    if (!isdefined(var_e8d51bf2e0fd9bf4)) {
        curpos = self.origin;
        variance = randomintrange(100, 150);
        var_e8d51bf2e0fd9bf4 = var_79029e89a95370d9 - variance * vectornormalize(var_79029e89a95370d9 - curpos);
    }
    goalpos = self getclosestreachablepointonnavmesh(var_e8d51bf2e0fd9bf4);
    level.var_80275ca89b572683[id].var_4e79a41164de0c24[level.var_80275ca89b572683[id].var_4e79a41164de0c24.size] = goalpos;
    /#
        if (getdvarint(@"hash_9961f6e93a09b113") != 0) {
            sphere(goalpos, 6, (0, 0, 1), 0, 100);
        }
    #/
    return goalpos;
}

