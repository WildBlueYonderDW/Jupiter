// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7d535542e36d66f9;
#using script_26f456dbdf9aa216;
#using script_10b6724c15a95e8;
#using script_5d265b4fca61f070;
#using script_4e1d4dd23699a8a4;

#namespace namespace_699ab846d7e50040;

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x133
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
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
        return &function_32d11ef968f509a0;
    case #"hash_a3836dc7307ecb50":
        return &function_ddf0d739daa1d97c;
    case #"hash_99efb042f2d3bcd8":
        return &function_e94882b86c7aadac;
    case #"hash_20885c126c27e8a5":
        return &function_30b70873a0937989;
    case #"hash_c51876f65be2c3b3":
        return &dialogue;
    case #"hash_80804c8d4d60b774":
        return &namespace_a3bb9840357a7ef2::function_5ad32ab5f21ddf93;
    case #"hash_49987181712dbfd5":
        return &function_46a6cb991c2a5d49;
    case #"hash_ebecb858f57398a5":
        return &function_c3722414c55a6ae1;
    case #"hash_2bb757aa70fc12dd":
        return &function_8586052802bd2c79;
        break;
    }
    /#
        assertmsg("Missing function pointer for " + var_cc4f2e0388379546);
    #/
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f
// Size: 0x2e
function function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    self.keepclaimednode = 1;
    self.bulletsinclip = weaponclipsize(self.weapon);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d4
// Size: 0x62
function function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    self clearbtgoal(1);
    self.maxfaceenemydist = 300;
    self aiclearscriptdesiredspeed();
    self notify("endcoverfire");
    self.keepclaimednode = 0;
    self.shootstyleoverride = undefined;
    self setlookatentity();
    if (!isalive(self)) {
        function_ae368fad1a1dc337(var_f8d4ed108521e632, "death", 1);
    }
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0x29
function function_46a6cb991c2a5d49(statename, params) {
    self function_e64ea2b4e79c4b74(1);
    self setbtgoalradius(1, params[0]);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d
// Size: 0x8c
function function_bd30a256562f3cdc(statename, params) {
    users = getaiarray(self.team);
    users = sortbydistance(users, self.origin);
    other = users[1];
    self endon("death");
    other endon("death");
    if (!isdefined(other)) {
        return;
    }
    function_6fbea72303085c6f(other, 1);
    namespace_aebb27832287cd3a::cap_start("cap_coverfire", "caps/interactions/cap_coverfire");
    function_216c67ab6749137a(self, other, "moving");
    wait(1);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x500
// Size: 0x8a
function function_b98f00d5db5e9c5d(statename, params) {
    self endon("death");
    other = function_cbe869548ea6baac("changingcover");
    if (!isdefined(other)) {
        return;
    }
    other endon("death");
    function_6fbea72303085c6f(other, 1, 0.8);
    wait(1);
    if (!isdefined(other) || !isdefined(self)) {
        return;
    }
    function_216c67ab6749137a(self, other, "suppressing");
    wait(1);
    if (!isdefined(other) || !isdefined(self)) {
        return;
    }
    other function_1c339daaba3f71db(0);
    self function_1c339daaba3f71db(0);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591
// Size: 0x63
function function_5ef09b6972c9fab(statename, params) {
    other = function_cbe869548ea6baac("changingcover");
    self endon("death");
    other endon("death");
    function_6fbea72303085c6f(other, 1);
    namespace_aebb27832287cd3a::cap_start("cap_coverfire", "caps/interactions/cap_coverfire_volunteer");
    function_216c67ab6749137a(self, other, "suppressing");
    wait(1);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fb
// Size: 0x82
function function_c753b2bac95c6bfe(statename, params) {
    users = getaiarray(self.team);
    users = sortbydistance(users, self.origin);
    other = users[1];
    self endon("death");
    other endon("death");
    wait(2);
    if (!isdefined(other) || !isdefined(self)) {
        return;
    }
    function_6fbea72303085c6f(other, 1);
    function_216c67ab6749137a(self, other, "moving");
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x684
// Size: 0xb6
function function_32d11ef968f509a0(statename, params) {
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

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741
// Size: 0x28
function function_ddf0d739daa1d97c(statename, params) {
    self.balwayscoverexposed = 0;
    self.providecoveringfire = 0;
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x770
// Size: 0x9c
function function_e94882b86c7aadac(statename, params) {
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

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x813
// Size: 0x25
function dialogue(statename, params) {
    if (isdefined(params[0])) {
        namespace_71a239de73c38174::say(params[0]);
    }
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f
// Size: 0x20
function function_c3722414c55a6ae1(statename) {
    return isdefined(self.covernode) || !isalive(self);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x867
// Size: 0x15
function function_8586052802bd2c79(statename) {
    self clearbtgoal(1);
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x883
// Size: 0x61
function function_678bbf15ac4b000f(interval, func, param, bool) {
    time = gettime() + interval;
    while (gettime() < time) {
        if (!isdefined(bool)) {
            waitframe();
        }
        if (isdefined(func)) {
            if (isdefined(param)) {
                self [[ func ]](param);
            } else {
                self [[ func ]]();
            }
        }
    }
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0x45
function function_30b70873a0937989(var_22e9090a351646e9) {
    /#
        print3d(self.origin + (0, 0, 80), var_22e9090a351646e9, (1, 1, 1), 1, 0.8, 1, 1);
    #/
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x937
// Size: 0x32
function function_cbe869548ea6baac(tag) {
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6(id, tag);
    return users[0];
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x971
// Size: 0x171
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
    turnanim = namespace_dd3a5c61bf082e18::function_18e6c36c02a94dbd(statename, statename + "_" + animindex);
    /#
        assertex(isdefined(turnanim), "Cardinal turn anim index " + animindex + "is missing in cap animset " + self.var_ae3ea15396b65c1f);
    #/
    return turnanim;
}

// Namespace namespace_699ab846d7e50040/namespace_c35c41aba500a8a0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x4f
function function_8fd655a41a26c662(asmname, statename, var_f2b19b25d457c2a6, param) {
    if (!isdefined(self.prevcovernode)) {
        return 0;
    }
    if (!isdefined(param)) {
        return 0;
    }
    return self.prevcovernode.type == param;
}

