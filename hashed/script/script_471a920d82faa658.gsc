// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_53651341190c5aab;
#using script_10b6724c15a95e8;
#using scripts\asm\asm.gsc;

#namespace namespace_6088e0bb8dc693c6;

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb
// Size: 0x13c
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_9f9e07224ff2a95a":
        return &function_18add0932f52ee9e;
    case #"hash_88347dbc54e3c555":
        return &function_17c9514d056f8b0c;
    case #"hash_55e74e391a612ea8":
        return &function_e62b12681729b218;
    case #"hash_d8934b522ed927fa":
        return &function_17557d7a61c7b24a;
    case #"hash_818982b14b2af1f":
        return &function_217dfeb1c92a9a53;
    case #"hash_3454d29ae45c6cdb":
        return &function_af686e8a0657ce57;
    case #"hash_c5687eec52003555":
        return &function_ec9dc4b6415cd3b9;
    case #"hash_e016759d0510a58c":
        return &function_ee02600437ca1900;
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
        break;
    }
    return namespace_f901a4f9d899be59::function_efcea5d26798e5b6(var_cc4f2e0388379546);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40f
// Size: 0xc9
function private function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    setdvarifuninitialized(@"hash_6bff7f7a44419fce", 0);
    if (!isdefined(function_60d6151af81a343(var_f8d4ed108521e632, "breachtype"))) {
        types = [0:"breach", 1:"kick", 2:"flashbang"];
        type = random(types);
        function_ae368fad1a1dc337(var_f8d4ed108521e632, "breachtype", type);
    }
    self.var_45134f4596be74ef = spawnstruct();
    if (isdefined(self.node)) {
        self.var_45134f4596be74ef.var_3d7e46c0d803ffa3 = self.node;
    } else {
        self.var_45134f4596be74ef.var_d5ab85c2b8501946 = self.pathgoalpos;
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4df
// Size: 0xf1
function private function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    if (isdefined(self.var_b4c85f2bc7abb407) && isdefined(self.var_b4c85f2bc7abb407.var_9c471c82abe76355)) {
        self.script_pushable = self.var_b4c85f2bc7abb407.var_9c471c82abe76355;
        self.var_d28e54645050df58 = self.var_b4c85f2bc7abb407.var_512299ff86496ad6;
    }
    self.var_45134f4596be74ef = undefined;
    self clearbtgoal(3);
    self.var_b4c85f2bc7abb407 = undefined;
    self.var_ddad29bbdecd1671 = undefined;
    if (self.var_a942dd31d55102c9 != self.asmname) {
        namespace_aebb27832287cd3a::function_b6af4ade50626e90();
    }
    users = function_adf0d34ff483c35a(var_f8d4ed108521e632);
    if (users.size == 1) {
        doorid = function_60d6151af81a343(var_f8d4ed108521e632, "doorindex");
        if (isdefined(doorid)) {
            function_e415e810d4e34ed(doorid, gettime() + 10000);
        }
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5d7
// Size: 0x3b3
function private function_18add0932f52ee9e(statename, role) {
    id = self function_92435c7a6ae85c3c();
    /#
        assert(isdefined(id));
    #/
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    var_dad5e6255a5bf2ac = anglestoforward(angles);
    var_5c6afc1001475042 = origin - self.origin;
    cross = vectorcross(var_5c6afc1001475042, var_dad5e6255a5bf2ac);
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
        var_8c2ea312139f3fde = function_60d6151af81a343(id, "activeside");
        if (var_8c2ea312139f3fde == "left") {
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
        var_9178c0eef9e08eb1 = var_9178c0eef9e08eb1 + "_doorless";
    }
    type = function_60d6151af81a343(id, "breachtype");
    var_975be27f963e2f30 = type;
    var_996949b7474560eb = function_a0cccf0b4c466b2c(self, var_975be27f963e2f30);
    animset = var_996949b7474560eb.animation;
    var_2c8936d08f85c5c1 = archetypegetrandomalias(animset, idlestate, var_9178c0eef9e08eb1, 0);
    /#
        assert(var_2c8936d08f85c5c1 >= 0);
    #/
    xanim = animsetgetanimfromindex(animset, idlestate, var_2c8936d08f85c5c1);
    var_78ff943ca85e1279 = getstartorigin(origin, angles, xanim);
    var_d78735c0a8459b07 = getstartangles(origin, angles, xanim);
    var_6f0a02205dd25d2e = getclosestpointonnavmesh(var_78ff943ca85e1279, self, 0, 1, 0);
    if (isdefined(var_6f0a02205dd25d2e)) {
        var_78ff943ca85e1279 = var_6f0a02205dd25d2e;
    }
    self.var_a57082fdf62bc898 = var_9178c0eef9e08eb1 + "_door_arrival";
    self.var_33b4c07d1f388776 = animset;
    self.var_a41edf45bb0ff97 = angles;
    self.var_b7c243f293b096d2 = var_d78735c0a8459b07;
    self.var_171120e99df3e286 = 1;
    self.var_a2a6c6c46defe8c4 = 1;
    self.var_b4c85f2bc7abb407 = spawnstruct();
    self.var_b4c85f2bc7abb407.asmname = var_996949b7474560eb.var_3e38ee41dc326fdc;
    self.var_b4c85f2bc7abb407.var_ae3ea15396b65c1f = animset;
    self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f = var_9178c0eef9e08eb1;
    self.var_b4c85f2bc7abb407.angles = var_d78735c0a8459b07;
    self.var_b4c85f2bc7abb407.var_2b1676bab1ba8985 = "solo";
    self.var_b4c85f2bc7abb407.role = role;
    self.var_b4c85f2bc7abb407.var_78ff943ca85e1279 = var_78ff943ca85e1279;
    if (role == "support") {
        self.var_b4c85f2bc7abb407.var_2b1676bab1ba8985 = "dual";
    }
    self.var_ddad29bbdecd1671 = &function_ddad29bbdecd1671;
    /#
        if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
            thread function_64fca4864613393f(var_78ff943ca85e1279, var_d78735c0a8459b07);
        }
    #/
    return var_78ff943ca85e1279;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x992
// Size: 0x1cb
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
        point = function_f0ef5d175747f19f(endpoint);
        if (isdefined(point)) {
            /#
                if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
                    print3d(point.origin + (0, 0, 100), "grenade_throw", (255, 255, 255), 1, 0.6, 200);
                    draw_circle(point.origin, 16, (1, 1, 0), 1, 0, 200);
                }
            #/
            return point.origin;
        } else {
            point = self getclosestreachablepointonnavmesh(endpoint);
        }
        /#
            if (getdvarint(@"hash_6bff7f7a44419fce", 0) == 1) {
                print3d(point + (0, 0, 100), "grenade_throw", (255, 255, 255), 1, 0.6, 200);
                draw_circle(point, 16, (1, 1, 0), 1, 0, 200);
            }
        #/
    }
    return point;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb65
// Size: 0x59
function private function_ddad29bbdecd1671() {
    /#
        assert(isdefined(self.var_b4c85f2bc7abb407));
    #/
    self.var_b4c85f2bc7abb407.var_74c9b1f78857273d = 1;
    namespace_aebb27832287cd3a::cap_start(self.var_b4c85f2bc7abb407.asmname, self.var_b4c85f2bc7abb407.var_ae3ea15396b65c1f);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc5
// Size: 0x14
function private function_217dfeb1c92a9a53(statename, params) {
    
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe0
// Size: 0x50
function private function_6d35024a1f783a16(statename, params) {
    self.var_a57082fdf62bc898 = undefined;
    self.var_33b4c07d1f388776 = undefined;
    self.var_a41edf45bb0ff97 = undefined;
    self.var_b7c243f293b096d2 = undefined;
    self.var_171120e99df3e286 = 0;
    self.var_a2a6c6c46defe8c4 = 0;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc37
// Size: 0x4e
function private function_d104ea3fd0d1be21(var_f8d4ed108521e632, var_d293838fe8a43473) {
    var_7449df250ed378c2 = function_60d6151af81a343(var_f8d4ed108521e632, "door");
    if (isdefined(var_7449df250ed378c2) && var_7449df250ed378c2 scriptabledoorisclosed()) {
        var_7449df250ed378c2 scriptabledooropen("away", self.origin);
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc8c
// Size: 0x1ac
function private function_ec9dc4b6415cd3b9(statename, params) {
    if (!istrue(self.var_b4c85f2bc7abb407.var_74c9b1f78857273d)) {
        function_6d35024a1f783a16();
        namespace_aebb27832287cd3a::cap_start(self.var_b4c85f2bc7abb407.asmname, self.var_b4c85f2bc7abb407.var_ae3ea15396b65c1f);
    }
    self.var_45134f4596be74ef.arrived = 1;
    self.var_b4c85f2bc7abb407.var_9c471c82abe76355 = self.script_pushable;
    self.var_b4c85f2bc7abb407.var_512299ff86496ad6 = self.var_d28e54645050df58;
    self.script_pushable = 0;
    self.var_d28e54645050df58 = 0;
    var_8cbc802e0992be6f = self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f;
    var_38b98bfa4426bcf9 = self.var_b4c85f2bc7abb407.var_2b1676bab1ba8985;
    var_4148b1f68bf5d60a = self.var_b4c85f2bc7abb407.role;
    self.var_b4c85f2bc7abb407.var_c58c71ebc71f7728 = var_8cbc802e0992be6f + "_" + var_38b98bfa4426bcf9 + "_" + var_4148b1f68bf5d60a;
    self function_fb02be5d663eca13();
    id = self function_92435c7a6ae85c3c();
    breachtype = function_60d6151af81a343(id, "breachtype");
    var_48d356c204bf2b81 = isdefined(breachtype) && breachtype == "flashbang";
    if (var_48d356c204bf2b81 && function_60d6151af81a343(id, "path_has_door")) {
        function_d104ea3fd0d1be21(id, self.origin);
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe3f
// Size: 0x57
function private function_ee02600437ca1900(statename, params) {
    id = self function_92435c7a6ae85c3c();
    function_fcf5d52b44c5be93(id);
    doorid = function_60d6151af81a343(id, "doorindex");
    if (isdefined(doorid)) {
        function_e415e810d4e34ed(doorid, gettime() + 10000);
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe9d
// Size: 0xfd
function private onenter(statename, params) {
    self endon("death");
    self.var_b4c85f2bc7abb407.var_3f651b778e93656e = 1;
    if (isdefined(self.var_45134f4596be74ef.var_3d7e46c0d803ffa3)) {
        self setbtgoalnode(3, self.var_45134f4596be74ef.var_3d7e46c0d803ffa3);
        self.var_45134f4596be74ef.var_3d7e46c0d803ffa3 = undefined;
    } else if (isdefined(self.var_45134f4596be74ef.var_d5ab85c2b8501946)) {
        self setbtgoalpos(3, self.var_45134f4596be74ef.var_d5ab85c2b8501946);
        self.var_45134f4596be74ef.var_d5ab85c2b8501946 = undefined;
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

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfa1
// Size: 0x38
function function_27dc505064bcf45b(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.var_b4c85f2bc7abb407.var_74c9b1f78857273d);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfe1
// Size: 0x38
function function_57787698e416086f(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.var_b4c85f2bc7abb407.var_3f651b778e93656e);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1021
// Size: 0x42
function function_14242f7e3e92261c(asmname, statename, params) {
    alias = self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f;
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, alias);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x106b
// Size: 0x76
function function_cfa7813e89867c4(asmname, statename, params) {
    alias = self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f + "_" + self.var_b4c85f2bc7abb407.var_2b1676bab1ba8985 + "_" + self.var_b4c85f2bc7abb407.role;
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, alias);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e9
// Size: 0x1b
function function_cea2a40434f5918() {
    if (utility::issp()) {
        return "flash";
    } else {
        return "flash_grenade_mp";
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110b
// Size: 0x14d
function function_ce30ac74cab64cfd(note) {
    if (note == "door_open") {
        function_d104ea3fd0d1be21(self function_92435c7a6ae85c3c(), self.origin);
    } else if (note == "grenade_left" || note == "grenade_right") {
        grenadeweapon = function_cea2a40434f5918();
        var_b4651e7d311139e = getweaponmodel(grenadeweapon);
        /#
            assert(isdefined(var_b4651e7d311139e));
        #/
        if (note == "grenade_left") {
            self.var_37477c0658477fa8 = t"hash_33cc111a";
        } else {
            self.var_37477c0658477fa8 = t"hash_2882fa67";
        }
        self attach(var_b4651e7d311139e, self.var_37477c0658477fa8);
        self.var_b4651e7d311139e = var_b4651e7d311139e;
        thread function_184b5862455e8902();
    } else if (note == "grenade_throw") {
        /#
            assert(isdefined(self.var_37477c0658477fa8));
        #/
        grenadeweapon = function_cea2a40434f5918();
        var_cd9c01ffc566883d = self gettagorigin(self.var_37477c0658477fa8);
        magicgrenademanual(grenadeweapon, var_cd9c01ffc566883d, self.var_45134f4596be74ef.var_1ea20cff44d04a78 * 20, 1, self);
        self detach(self.var_b4651e7d311139e, self.var_37477c0658477fa8);
        self.var_b4651e7d311139e = undefined;
        self.var_37477c0658477fa8 = undefined;
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125f
// Size: 0x93
function function_184b5862455e8902() {
    self endon("death");
    self endon("bseq_user_deleted");
    var_8d566e1f6d9b6381 = self gettagorigin(self.var_37477c0658477fa8);
    self.var_45134f4596be74ef.var_1ea20cff44d04a78 = anglestoforward(self.angles);
    waitframe();
    while (isdefined(self.var_37477c0658477fa8)) {
        var_f24f3237b7e83856 = self gettagorigin(self.var_37477c0658477fa8);
        self.var_45134f4596be74ef.var_1ea20cff44d04a78 = var_f24f3237b7e83856 - var_8d566e1f6d9b6381;
        var_8d566e1f6d9b6381 = var_f24f3237b7e83856;
        waitframe();
    }
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12f9
// Size: 0x71
function function_a3564484875da8f8(asmname, statename, params) {
    thread namespace_bf5a1761a8d1bb07::function_fb56c9527636713f(asmname, statename, 1);
    self orientmode("face angle", self.var_b4c85f2bc7abb407.angles[1]);
    self asmfireephemeralevent("arrived", "end");
    self.var_45134f4596be74ef.arrived = 1;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1371
// Size: 0x59
function function_26b903a39f018550(asmname, statename, params) {
    thread namespace_bf5a1761a8d1bb07::asm_playanimstate(asmname, statename, params);
    self function_802c56a3df8c7797(self.var_b4c85f2bc7abb407.var_78ff943ca85e1279, self.var_b4c85f2bc7abb407.angles, 0.3);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13d1
// Size: 0xe9
function function_a910d69a0daa7775(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(params) || isarray(params)) {
        /#
            assertmsg("SideAliasIs requires param 'left' or 'right', aborting.");
        #/
        return 0;
    }
    if (!isdefined(self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f)) {
        return 0;
    }
    side = self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f;
    if (isdefined(self.var_b4c85f2bc7abb407.role) && self.var_b4c85f2bc7abb407.role == "support") {
        if (side == "left") {
            side = "right";
        } else if (side == "right") {
            side = "left";
        }
    }
    return self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f == params;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14c2
// Size: 0x33
function private function_23cd7f6fdf460eb4(params) {
    return istrue(self.var_45134f4596be74ef.arrived) || self isingoal(self.origin);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14fd
// Size: 0x20
function private function_21bcb65ded71229f(params) {
    return istrue(self.var_45134f4596be74ef.arrived);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1525
// Size: 0x142
function private function_e62b12681729b218(asmname, statename, var_f2b19b25d457c2a6, params) {
    id = self function_92435c7a6ae85c3c();
    /#
        assert(isdefined(id));
    #/
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    var_dad5e6255a5bf2ac = anglestoforward(angles);
    var_5c6afc1001475042 = origin - self.origin;
    cross = vectorcross(var_5c6afc1001475042, var_dad5e6255a5bf2ac);
    bleft = 1;
    if (cross[2] < 0) {
        bleft = 0;
    }
    if (bleft) {
        var_9b185a7815a646b2 = "left";
    } else {
        var_9b185a7815a646b2 = "right";
    }
    var_bb3bfbc5f90b8e98 = function_60d6151af81a343(id, "door_knob");
    var_67ddfcef5f2744b4 = var_9b185a7815a646b2 == var_bb3bfbc5f90b8e98;
    openness = function_60d6151af81a343(id, "openness");
    dooropen = 1;
    if (isdefined(openness)) {
        openness = abs(openness);
        dooropen = openness >= 45;
    }
    if (var_67ddfcef5f2744b4 && dooropen) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x166f
// Size: 0x4e
function private function_17557d7a61c7b24a(asmname, statename, var_f2b19b25d457c2a6, params) {
    id = self function_92435c7a6ae85c3c();
    var_4af98eb05addd7bf = function_60d6151af81a343(id, "path_has_door");
    return !istrue(var_4af98eb05addd7bf);
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c5
// Size: 0xbf
function private function_27937ccb1b1abef1(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    id = self function_92435c7a6ae85c3c();
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    var_dad5e6255a5bf2ac = anglestoforward(angles);
    enemypos = self.enemy.origin;
    toenemy = function_767cea82b001f645(enemypos - origin);
    delta = vectordot(var_dad5e6255a5bf2ac, toenemy);
    return delta <= 0;
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x178c
// Size: 0x25
function private function_af686e8a0657ce57(var_f8d4ed108521e632) {
    self.var_b4c85f2bc7abb407.var_2b1676bab1ba8985 = "dual";
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b8
// Size: 0xc
function function_8055622a418ebd4f(var_f8d4ed108521e632) {
    
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cb
// Size: 0xc
function function_767fb54813708a82(var_f8d4ed108521e632) {
    
}

// Namespace namespace_6088e0bb8dc693c6/namespace_4ef97519f59e04e6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x17de
// Size: 0x1ae
function private function_64fca4864613393f(var_78ff943ca85e1279, var_d78735c0a8459b07) {
    self endon("death");
    forward = anglestoforward(var_d78735c0a8459b07);
    end = var_78ff943ca85e1279 + forward * 32;
    id = self function_92435c7a6ae85c3c();
    breachtype = function_60d6151af81a343(id, "breachtype");
    var_36aa5bfafc2e6678 = function_bbfc94714c82788b(id);
    var_b271f9fa9aa79b2f = anglestoforward(function_785f60047abcfa05(id));
    var_dd4554fab9cacfdf = var_36aa5bfafc2e6678 + var_b271f9fa9aa79b2f * 32;
    draw_arrow_time(var_36aa5bfafc2e6678, var_dd4554fab9cacfdf, (150, 50, 150), 5);
    draw_arrow_time(var_78ff943ca85e1279, end, (150, 50, 150), 5);
    /#
        print3d(var_78ff943ca85e1279 + (0, 0, 100), breachtype, (255, 255, 255), 1, 0.6, 200);
    #/
    /#
        print3d(var_78ff943ca85e1279 + (0, 0, 80), self.var_b4c85f2bc7abb407.var_d6cf89a3e47ada1f + "<unknown string>" + self.var_b4c85f2bc7abb407.var_2b1676bab1ba8985 + "<unknown string>" + self.var_b4c85f2bc7abb407.role, (255, 255, 255), 1, 0.6, 150);
    #/
    /#
        print3d(var_78ff943ca85e1279 + (0, 0, 60), self.var_a57082fdf62bc898, (255, 255, 255), 1, 0.4, 150);
    #/
}

