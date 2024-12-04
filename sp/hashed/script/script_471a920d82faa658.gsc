#using script_53651341190c5aab;
#using scripts\asm\asm;
#using scripts\common\cap;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace door_check;

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1
// Size: 0x129
function getfunction(funcid) {
    switch (funcid) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_9f9e07224ff2a95a":
        return &calcstartorigin;
    case #"hash_88347dbc54e3c555":
        return &function_17c9514d056f8b0c;
    case #"hash_55e74e391a612ea8":
        return &function_e62b12681729b218;
    case #"hash_d8934b522ed927fa":
        return &function_17557d7a61c7b24a;
    case #"hash_818982b14b2af1f":
        return &arrivalsetup;
    case #"hash_3454d29ae45c6cdb":
        return &function_af686e8a0657ce57;
    case #"hash_c5687eec52003555":
        return &function_ec9dc4b6415cd3b9;
    case #"hash_d50b41c248a37316":
        return &onenter;
    case #"hash_214ba25246813d79":
        return &function_8055622a418ebd4f;
    case #"hash_1ac92cc267a9ec26":
        return &function_767fb54813708a82;
    case #"hash_f81d03def0fb7e01":
        return &function_27937ccb1b1abef1;
    case #"hash_94e93145a62541a4":
        return &function_23cd7f6fdf460eb4;
    case #"hash_987435cc91e79a2f":
        return &function_21bcb65ded71229f;
    }
    return namespace_f901a4f9d899be59::function_efcea5d26798e5b6(funcid);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f3
// Size: 0xc8
function private function_3dbd361f74b442f9(interactionid) {
    setdvarifuninitialized(@"hash_6bff7f7a44419fce", 0);
    if (!isdefined(function_60d6151af81a343(interactionid, "breachtype"))) {
        types = ["breach", "kick", "flashbang"];
        type = random(types);
        function_ae368fad1a1dc337(interactionid, "breachtype", type);
    }
    self.doorcheck = spawnstruct();
    if (isdefined(self.node)) {
        self.doorcheck.priornode = self.node;
        return;
    }
    self.doorcheck.priorgoalpos = self.pathgoalpos;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c3
// Size: 0xf0
function private function_a157fbbc31d9eb1a(interactionid) {
    if (isdefined(self.capdata) && isdefined(self.capdata.var_9c471c82abe76355)) {
        self.script_pushable = self.capdata.var_9c471c82abe76355;
        self.var_d28e54645050df58 = self.capdata.var_512299ff86496ad6;
    }
    self.doorcheck = undefined;
    self clearbtgoal(3);
    self.capdata = undefined;
    self.var_ddad29bbdecd1671 = undefined;
    if (self.var_a942dd31d55102c9 != self.asmname) {
        scripts\common\cap::cap_exit();
    }
    users = function_adf0d34ff483c35a(interactionid);
    if (users.size == 1) {
        doorid = function_60d6151af81a343(interactionid, "doorindex");
        if (isdefined(doorid)) {
            function_e415e810d4e34ed(doorid, gettime() + 10000);
        }
    }
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5bb
// Size: 0x3b2
function private calcstartorigin(statename, role) {
    id = self function_92435c7a6ae85c3c();
    assert(isdefined(id));
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    doordir = anglestoforward(angles);
    var_5c6afc1001475042 = origin - self.origin;
    cross = vectorcross(var_5c6afc1001475042, doordir);
    bleft = 1;
    if (cross[2] < 0) {
        bleft = 0;
    }
    idlestate = "door_idle";
    if (bleft) {
        var_9178c0eef9e08eb1 = "left";
    } else {
        var_9178c0eef9e08eb1 = "right";
    }
    door_knob = function_60d6151af81a343(id, "door_knob");
    if (isdefined(door_knob)) {
        var_9178c0eef9e08eb1 = door_knob;
    }
    if (role == "active") {
        function_ae368fad1a1dc337(id, "activeside", var_9178c0eef9e08eb1);
    } else {
        occupiedside = function_60d6151af81a343(id, "activeside");
        if (occupiedside == "left") {
            var_9178c0eef9e08eb1 = "right";
        } else {
            var_9178c0eef9e08eb1 = "left";
        }
    }
    openness = function_60d6151af81a343(id, "openness");
    if (isdefined(openness)) {
        openness = abs(openness);
    }
    if (!istrue(function_60d6151af81a343(id, "path_has_door")) || isdefined(openness) && openness > 45) {
        var_9178c0eef9e08eb1 += "_doorless";
    }
    type = function_60d6151af81a343(id, "breachtype");
    rolestring = type;
    capinfo = function_a0cccf0b4c466b2c(self, rolestring);
    animset = capinfo.animation;
    animid = archetypegetrandomalias(animset, idlestate, var_9178c0eef9e08eb1, 0);
    assert(animid >= 0);
    xanim = animsetgetanimfromindex(animset, idlestate, animid);
    idleorigin = getstartorigin(origin, angles, xanim);
    var_d78735c0a8459b07 = getstartangles(origin, angles, xanim);
    var_6f0a02205dd25d2e = getclosestpointonnavmesh(idleorigin, self, 0, 1, 0);
    if (isdefined(var_6f0a02205dd25d2e)) {
        idleorigin = var_6f0a02205dd25d2e;
    }
    self.var_a57082fdf62bc898 = var_9178c0eef9e08eb1 + "_door_arrival";
    self.var_33b4c07d1f388776 = animset;
    self.var_a41edf45bb0ff97 = angles;
    self.var_b7c243f293b096d2 = var_d78735c0a8459b07;
    self.var_171120e99df3e286 = 1;
    self.var_a2a6c6c46defe8c4 = 1;
    self.capdata = spawnstruct();
    self.capdata.asmname = capinfo.capname;
    self.capdata.animsetname = animset;
    self.capdata.var_d6cf89a3e47ada1f = var_9178c0eef9e08eb1;
    self.capdata.angles = var_d78735c0a8459b07;
    self.capdata.var_2b1676bab1ba8985 = "solo";
    self.capdata.role = role;
    self.capdata.idleorigin = idleorigin;
    if (role == "support") {
        self.capdata.var_2b1676bab1ba8985 = "dual";
    }
    self.var_ddad29bbdecd1671 = &function_ddad29bbdecd1671;
    /#
        if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
            thread function_64fca4864613393f(idleorigin, var_d78735c0a8459b07);
        }
    #/
    return idleorigin;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x976
// Size: 0x1ca
function private function_17c9514d056f8b0c(statename, mindist, maxdist) {
    id = self function_92435c7a6ae85c3c();
    origin = function_bbfc94714c82788b(id);
    var_9dfa31b22e1f2822 = vectornormalize(self.origin - origin);
    dist = randomintrange(mindist, maxdist);
    endpoint = origin + var_9dfa31b22e1f2822 * dist;
    /#
        if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
            line(origin, endpoint, (0, 0, 1), 1, 0, 200);
        }
    #/
    point = findclosestlospointwithinradius(origin, maxdist, origin, endpoint);
    if (!isdefined(point)) {
        point = findclosesttacpoint(endpoint);
        if (isdefined(point)) {
            /#
                if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
                    print3d(point.origin + (0, 0, 100), "<dev string:x1c>", (255, 255, 255), 1, 0.6, 200);
                    draw_circle(point.origin, 16, (1, 1, 0), 1, 0, 200);
                }
            #/
            return point.origin;
        } else {
            point = self getclosestreachablepointonnavmesh(endpoint);
        }
        /#
            if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
                print3d(point + (0, 0, 100), "<dev string:x1c>", (255, 255, 255), 1, 0.6, 200);
                draw_circle(point, 16, (1, 1, 0), 1, 0, 200);
            }
        #/
    }
    return point;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb49
// Size: 0x58
function private function_ddad29bbdecd1671() {
    assert(isdefined(self.capdata));
    self.capdata.var_74c9b1f78857273d = 1;
    scripts\common\cap::cap_start(self.capdata.asmname, self.capdata.animsetname);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xba9
// Size: 0x13
function private arrivalsetup(statename, params) {
    
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xbc4
// Size: 0x4f
function private arrivalcleanup(statename, params) {
    self.var_a57082fdf62bc898 = undefined;
    self.var_33b4c07d1f388776 = undefined;
    self.var_a41edf45bb0ff97 = undefined;
    self.var_b7c243f293b096d2 = undefined;
    self.var_171120e99df3e286 = 0;
    self.var_a2a6c6c46defe8c4 = 0;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc1b
// Size: 0x4d
function private opendoor(interactionid, var_d293838fe8a43473) {
    doorobj = function_60d6151af81a343(interactionid, "door");
    if (isdefined(doorobj) && doorobj scriptabledoorisclosed()) {
        doorobj scriptabledooropen("away", self.origin);
    }
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc70
// Size: 0x1ab
function private function_ec9dc4b6415cd3b9(statename, params) {
    if (!istrue(self.capdata.var_74c9b1f78857273d)) {
        arrivalcleanup();
        scripts\common\cap::cap_start(self.capdata.asmname, self.capdata.animsetname);
    }
    self.doorcheck.arrived = 1;
    self.capdata.var_9c471c82abe76355 = self.script_pushable;
    self.capdata.var_512299ff86496ad6 = self.var_d28e54645050df58;
    self.script_pushable = 0;
    self.var_d28e54645050df58 = 0;
    sidetoken = self.capdata.var_d6cf89a3e47ada1f;
    numbertoken = self.capdata.var_2b1676bab1ba8985;
    roletoken = self.capdata.role;
    self.capdata.var_c58c71ebc71f7728 = sidetoken + "_" + numbertoken + "_" + roletoken;
    self function_fb02be5d663eca13();
    id = self function_92435c7a6ae85c3c();
    breachtype = function_60d6151af81a343(id, "breachtype");
    var_48d356c204bf2b81 = isdefined(breachtype) && breachtype == "flashbang";
    if (var_48d356c204bf2b81 && function_60d6151af81a343(id, "path_has_door")) {
        opendoor(id, self.origin);
    }
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe23
// Size: 0xfc
function private onenter(statename, params) {
    self endon("death");
    self.capdata.var_3f651b778e93656e = 1;
    if (isdefined(self.doorcheck.priornode)) {
        self setbtgoalnode(3, self.doorcheck.priornode);
        self.doorcheck.priornode = undefined;
    } else if (isdefined(self.doorcheck.priorgoalpos)) {
        self setbtgoalpos(3, self.doorcheck.priorgoalpos);
        self.doorcheck.priorgoalpos = undefined;
    }
    endtime = gettime() + 5000;
    waitframe();
    while (gettime() < endtime) {
        if (self asmeventfired(self.asmname, "end")) {
            break;
        }
        waitframe();
    }
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf27
// Size: 0x37
function function_27dc505064bcf45b(asmname, statename, tostatename, params) {
    return istrue(self.capdata.var_74c9b1f78857273d);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf67
// Size: 0x37
function function_57787698e416086f(asmname, statename, tostatename, params) {
    return istrue(self.capdata.var_3f651b778e93656e);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfa7
// Size: 0x41
function function_14242f7e3e92261c(asmname, statename, params) {
    alias = self.capdata.var_d6cf89a3e47ada1f;
    return scripts\asm\asm::asm_lookupanimfromalias(statename, alias);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xff1
// Size: 0x75
function function_cfa7813e89867c4(asmname, statename, params) {
    alias = self.capdata.var_d6cf89a3e47ada1f + "_" + self.capdata.var_2b1676bab1ba8985 + "_" + self.capdata.role;
    return scripts\asm\asm::asm_lookupanimfromalias(statename, alias);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106f
// Size: 0x1a
function function_cea2a40434f5918() {
    if (utility::issp()) {
        return "flash";
    }
    return "flash_grenade_mp";
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1091
// Size: 0x14c
function function_ce30ac74cab64cfd(note) {
    if (note == "door_open") {
        opendoor(self function_92435c7a6ae85c3c(), self.origin);
        return;
    }
    if (note == "grenade_left" || note == "grenade_right") {
        grenadeweapon = function_cea2a40434f5918();
        grenademodel = getweaponmodel(grenadeweapon);
        assert(isdefined(grenademodel));
        if (note == "grenade_left") {
            self.var_37477c0658477fa8 = t"tag_accessory_left";
        } else {
            self.var_37477c0658477fa8 = t"tag_accessory_right";
        }
        self attach(grenademodel, self.var_37477c0658477fa8);
        self.grenademodel = grenademodel;
        thread function_184b5862455e8902();
        return;
    }
    if (note == "grenade_throw") {
        assert(isdefined(self.var_37477c0658477fa8));
        grenadeweapon = function_cea2a40434f5918();
        grenadepos = self gettagorigin(self.var_37477c0658477fa8);
        magicgrenademanual(grenadeweapon, grenadepos, self.doorcheck.grenadedir * 20, 1, self);
        self detach(self.grenademodel, self.var_37477c0658477fa8);
        self.grenademodel = undefined;
        self.var_37477c0658477fa8 = undefined;
    }
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e5
// Size: 0x92
function function_184b5862455e8902() {
    self endon("death");
    self endon("bseq_user_deleted");
    var_8d566e1f6d9b6381 = self gettagorigin(self.var_37477c0658477fa8);
    self.doorcheck.grenadedir = anglestoforward(self.angles);
    waitframe();
    while (isdefined(self.var_37477c0658477fa8)) {
        handpos = self gettagorigin(self.var_37477c0658477fa8);
        self.doorcheck.grenadedir = handpos - var_8d566e1f6d9b6381;
        var_8d566e1f6d9b6381 = handpos;
        waitframe();
    }
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x127f
// Size: 0x70
function function_a3564484875da8f8(asmname, statename, params) {
    thread scripts\asm\asm::function_fb56c9527636713f(asmname, statename, 1);
    self orientmode("face angle", self.capdata.angles[1]);
    self asmfireephemeralevent("arrived", "end");
    self.doorcheck.arrived = 1;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12f7
// Size: 0x58
function function_26b903a39f018550(asmname, statename, params) {
    thread scripts\asm\asm::asm_playanimstate(asmname, statename, params);
    self function_802c56a3df8c7797(self.capdata.idleorigin, self.capdata.angles, 0.3);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1357
// Size: 0xe8
function function_a910d69a0daa7775(asmname, statename, tostatename, params) {
    if (!isdefined(params) || isarray(params)) {
        assertmsg("SideAliasIs requires param 'left' or 'right', aborting.");
        return false;
    }
    if (!isdefined(self.capdata.var_d6cf89a3e47ada1f)) {
        return false;
    }
    side = self.capdata.var_d6cf89a3e47ada1f;
    if (isdefined(self.capdata.role) && self.capdata.role == "support") {
        if (side == "left") {
            side = "right";
        } else if (side == "right") {
            side = "left";
        }
    }
    return self.capdata.var_d6cf89a3e47ada1f == params;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1448
// Size: 0x32
function private function_23cd7f6fdf460eb4(params) {
    return istrue(self.doorcheck.arrived) || self isingoal(self.origin);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1483
// Size: 0x1f
function private function_21bcb65ded71229f(params) {
    return istrue(self.doorcheck.arrived);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x14ab
// Size: 0x141
function private function_e62b12681729b218(asmname, statename, tostatename, params) {
    id = self function_92435c7a6ae85c3c();
    assert(isdefined(id));
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    doordir = anglestoforward(angles);
    var_5c6afc1001475042 = origin - self.origin;
    cross = vectorcross(var_5c6afc1001475042, doordir);
    bleft = 1;
    if (cross[2] < 0) {
        bleft = 0;
    }
    if (bleft) {
        desiredside = "left";
    } else {
        desiredside = "right";
    }
    var_bb3bfbc5f90b8e98 = function_60d6151af81a343(id, "door_knob");
    mustcross = desiredside == var_bb3bfbc5f90b8e98;
    openness = function_60d6151af81a343(id, "openness");
    dooropen = 1;
    if (isdefined(openness)) {
        openness = abs(openness);
        dooropen = openness >= 45;
    }
    if (mustcross && dooropen) {
        return false;
    }
    return true;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x15f5
// Size: 0x4d
function private function_17557d7a61c7b24a(asmname, statename, tostatename, params) {
    id = self function_92435c7a6ae85c3c();
    hasdoor = function_60d6151af81a343(id, "path_has_door");
    return !istrue(hasdoor);
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x164b
// Size: 0xbe
function private function_27937ccb1b1abef1(asmname, statename, tostatename, params) {
    if (!isdefined(self.enemy)) {
        return false;
    }
    id = self function_92435c7a6ae85c3c();
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    doordir = anglestoforward(angles);
    enemypos = self.enemy.origin;
    toenemy = vectornormalize2(enemypos - origin);
    delta = vectordot(doordir, toenemy);
    return delta <= 0;
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1712
// Size: 0x24
function private function_af686e8a0657ce57(interactionid) {
    self.capdata.var_2b1676bab1ba8985 = "dual";
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x173e
// Size: 0xb
function function_8055622a418ebd4f(interactionid) {
    
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1751
// Size: 0xb
function function_767fb54813708a82(interactionid) {
    
}

// Namespace door_check / namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1764
// Size: 0x1ad
function private function_64fca4864613393f(idleorigin, var_d78735c0a8459b07) {
    self endon("death");
    forward = anglestoforward(var_d78735c0a8459b07);
    end = idleorigin + forward * 32;
    id = self function_92435c7a6ae85c3c();
    breachtype = function_60d6151af81a343(id, "breachtype");
    intorg = function_bbfc94714c82788b(id);
    intfwd = anglestoforward(function_785f60047abcfa05(id));
    intend = intorg + intfwd * 32;
    draw_arrow_time(intorg, intend, (150, 50, 150), 5);
    draw_arrow_time(idleorigin, end, (150, 50, 150), 5);
    /#
        print3d(idleorigin + (0, 0, 100), breachtype, (255, 255, 255), 1, 0.6, 200);
    #/
    /#
        print3d(idleorigin + (0, 0, 80), self.capdata.var_d6cf89a3e47ada1f + "<dev string:x30>" + self.capdata.var_2b1676bab1ba8985 + "<dev string:x30>" + self.capdata.role, (255, 255, 255), 1, 0.6, 150);
    #/
    /#
        print3d(idleorigin + (0, 0, 60), self.var_a57082fdf62bc898, (255, 255, 255), 1, 0.4, 150);
    #/
}

