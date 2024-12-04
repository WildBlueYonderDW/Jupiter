#using script_26f456dbdf9aa216;
#using script_5d265b4fca61f070;
#using script_7d535542e36d66f9;
#using scripts\asm\cap;
#using scripts\common\cap;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace coverfire;

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0x132
function getfunction(funcid) {
    switch (funcid) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_99e614e786e54290":
        return &function_bd30a256562f3cdc;
    case #"hash_51e4cbdddb672391":
        return &function_b98f00d5db5e9c5d;
    case #"hash_48a1e8ac44615177":
        return &function_5ef09b6972c9fab;
    case #"hash_3958941e1685548a":
        return &function_c753b2bac95c6bfe;
    case #"hash_713dc5b1c250d91c":
        return &coveringfire;
    case #"hash_a3836dc7307ecb50":
        return &function_ddf0d739daa1d97c;
    case #"hash_99efb042f2d3bcd8":
        return &changecover;
    case #"hash_20885c126c27e8a5":
        return &function_30b70873a0937989;
    case #"hash_c51876f65be2c3b3":
        return &dialogue;
    case #"hash_80804c8d4d60b774":
        return &namespace_a3bb9840357a7ef2::function_5ad32ab5f21ddf93;
    case #"hash_49987181712dbfd5":
        return &setstationary;
    case #"hash_ebecb858f57398a5":
        return &function_c3722414c55a6ae1;
    case #"hash_2bb757aa70fc12dd":
        return &cleargoal;
    }
    assertmsg("<dev string:x1c>" + funcid);
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b8
// Size: 0x2d
function function_3dbd361f74b442f9(interactionid) {
    self.keepclaimednode = 1;
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed
// Size: 0x61
function function_a157fbbc31d9eb1a(interactionid) {
    self clearbtgoal(1);
    self.maxfaceenemydist = 300;
    self aiclearscriptdesiredspeed();
    self notify("endcoverfire");
    self.keepclaimednode = 0;
    self.shootstyleoverride = undefined;
    self setlookatentity();
    if (!isalive(self)) {
        function_ae368fad1a1dc337(interactionid, "death", 1);
    }
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x456
// Size: 0x28
function setstationary(statename, params) {
    self function_e64ea2b4e79c4b74(1);
    self setbtgoalradius(1, params[0]);
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x486
// Size: 0x8b
function function_bd30a256562f3cdc(statename, params) {
    users = getaiarray(self.team);
    users = sortbydistance(users, self.origin);
    other = users[1];
    self endon("death");
    other endon("death");
    if (!isdefined(other)) {
        return;
    }
    enablelookatentity(other, 1);
    scripts\common\cap::cap_start("cap_coverfire", "caps/interactions/cap_coverfire");
    function_216c67ab6749137a(self, other, "moving");
    wait 1;
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x8a
function function_b98f00d5db5e9c5d(statename, params) {
    self endon("death");
    other = function_cbe869548ea6baac("changingcover");
    if (!isdefined(other)) {
        return;
    }
    other endon("death");
    enablelookatentity(other, 1, 0.8);
    wait 1;
    if (!isdefined(other) || !isdefined(self)) {
        return;
    }
    function_216c67ab6749137a(self, other, "suppressing");
    wait 1;
    if (!isdefined(other) || !isdefined(self)) {
        return;
    }
    other function_1c339daaba3f71db(0);
    self function_1c339daaba3f71db(0);
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ab
// Size: 0x63
function function_5ef09b6972c9fab(statename, params) {
    other = function_cbe869548ea6baac("changingcover");
    self endon("death");
    other endon("death");
    enablelookatentity(other, 1);
    scripts\common\cap::cap_start("cap_coverfire", "caps/interactions/cap_coverfire_volunteer");
    function_216c67ab6749137a(self, other, "suppressing");
    wait 1;
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x616
// Size: 0x81
function function_c753b2bac95c6bfe(statename, params) {
    users = getaiarray(self.team);
    users = sortbydistance(users, self.origin);
    other = users[1];
    self endon("death");
    other endon("death");
    wait 2;
    if (!isdefined(other) || !isdefined(self)) {
        return;
    }
    enablelookatentity(other, 1);
    function_216c67ab6749137a(self, other, "moving");
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x69f
// Size: 0xb4
function coveringfire(statename, params) {
    self endon("death");
    self endon("endcoverfire");
    other = function_cbe869548ea6baac("changingcover");
    if (!isdefined(other)) {
        return;
    }
    other endon("death");
    self function_1c339daaba3f71db(0);
    self.maxfaceenemydist = 2048;
    var_8d92e2462e6c7e1f = 3000;
    var_adc43cf18baabed5 = gettime() + 10000;
    self.balwayscoverexposed = 1;
    self.providecoveringfire = 1;
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.shootstyleoverride = "full";
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x75b
// Size: 0x27
function function_ddf0d739daa1d97c(statename, params) {
    self.balwayscoverexposed = 0;
    self.providecoveringfire = 0;
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78a
// Size: 0x9b
function changecover(statename, params) {
    self endon("death");
    self endon("endcoverfire");
    self.maxfaceenemydist = 64;
    self aisetdesiredspeed(270);
    maxtime = 5000;
    starttime = gettime();
    self.keepclaimednode = 0;
    function_216c67ab6749137a(self, undefined, "moving_up");
    while (isdefined(self.covernode)) {
        waitframe();
    }
    while (!isdefined(self.covernode) && gettime() < starttime + maxtime) {
        waitframe();
    }
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82d
// Size: 0x24
function dialogue(statename, params) {
    if (isdefined(params[0])) {
        namespace_71a239de73c38174::say(params[0]);
    }
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x859
// Size: 0x1f
function function_c3722414c55a6ae1(statename) {
    return isdefined(self.covernode) || !isalive(self);
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x881
// Size: 0x14
function cleargoal(statename) {
    self clearbtgoal(1);
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x89d
// Size: 0x61
function dodelay(interval, func, param, bool) {
    time = gettime() + interval;
    while (gettime() < time) {
        if (!isdefined(bool)) {
            waitframe();
        }
        if (isdefined(func)) {
            if (isdefined(param)) {
                self [[ func ]](param);
                continue;
            }
            self [[ func ]]();
        }
    }
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x906
// Size: 0x44
function function_30b70873a0937989(var_22e9090a351646e9) {
    /#
        print3d(self.origin + (0, 0, 80), var_22e9090a351646e9, (1, 1, 1), 1, 0.8, 1, 1);
    #/
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x952
// Size: 0x31
function function_cbe869548ea6baac(tag) {
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6(id, tag);
    return users[0];
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x98c
// Size: 0x16c
function function_9867614bbd49f378(asmname, statename, params) {
    targetpos = undefined;
    if (isdefined(self.node) && distancesquared(self.node.origin, self.origin) > 1024) {
        targetpos = self.node.origin;
    } else if (isdefined(self.enemy)) {
        targetpos = self.enemy.origin;
    }
    anglediff = 0;
    if (isdefined(targetpos)) {
        var_935ce979bb3ef270 = vectortoyaw(targetpos - self.origin);
        anglediff = angleclamp180(var_935ce979bb3ef270 - self.angles[1]);
    }
    turnanim = undefined;
    var_5263a610669efa35 = abs(anglediff);
    animindex = 8;
    if (var_5263a610669efa35 > 135) {
        animindex = 2;
    } else if (anglediff > 45 && anglediff <= 135) {
        animindex = 6;
    } else if (anglediff >= -135 && anglediff < -45) {
        animindex = 4;
    }
    turnanim = scripts\asm\cap::function_18e6c36c02a94dbd(statename, statename + "_" + animindex);
    assertex(isdefined(turnanim), "<dev string:x3d>" + animindex + "<dev string:x5a>" + self.animsetname);
    return turnanim;
}

// Namespace coverfire / namespace_c35c41aba500a8a0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb01
// Size: 0x4e
function function_8fd655a41a26c662(asmname, statename, tostatename, param) {
    if (!isdefined(self.prevcovernode)) {
        return false;
    }
    if (!isdefined(param)) {
        return false;
    }
    return self.prevcovernode.type == param;
}

