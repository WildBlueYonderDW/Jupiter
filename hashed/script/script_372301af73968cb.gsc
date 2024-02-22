// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3b64eb40368c1450;
#using script_6a5d3bf7a5b7064a;
#using script_2fc9d8a91b9fce8f;
#using scripts\cp_mp\challenges.gsc;

#namespace playerhealth;

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x2e
function function_a6c2d3f08399946f() {
    if (!isdefined(level.var_be39d6b46044f344)) {
        level.var_be39d6b46044f344 = 40;
    }
    /#
        setdevdvarifuninitialized(@"hash_9e41eb34980a2301", 0);
    #/
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292
// Size: 0x74
function manageplayerregen() {
    self.deathsdoor = 0;
    self.deathsdoorsfx = 0;
    self.var_632fcfdf269b9dc8 = -99999;
    self.hasdonepainbreathloopthislife = 0;
    self.healing = 0;
    self stoplocalsound("deaths_door_out");
    self stoplocalsound("deaths_door_in");
    thread namespace_4887422e77f3514e::function_a2b4e6088394bade();
    thread function_c12e5fda7dc648ce();
    thread function_fb3404dca14b5916();
    /#
        thread function_31a13be1530a809b();
    #/
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0xb7
function private function_c12e5fda7dc648ce() {
    self endon("death_or_disconnect");
    self endon("enter_live_ragdoll");
    while (1) {
        smeansofdeath = vpoint = var_fea2a171f4ce7311 = eattacker = idamage = self waittill("damage");
        /#
            var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
            if (var_4552ad49778498ee) {
                if (isdefined(idamage)) {
                    print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + idamage);
                }
            }
        #/
        thread naturalhealthregen(smeansofdeath);
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cb
// Size: 0xe6
function private naturalhealthregen(smeansofdeath) {
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>");
        }
    #/
    if (!isreallyalive(self)) {
        return;
    }
    if (istrue(level.healthregendisabled)) {
        return;
    }
    self.var_73b0186b9643675a = undefined;
    self.currentregendelay = undefined;
    self notify("naturalHealthRegen");
    self endon("naturalHealthRegen");
    self endon("death_or_disconnect");
    self endon("enter_live_ragdoll");
    level endon("game_ended");
    self.healing = 0;
    while (istrue(level.healthregendisabled) && isusingremote()) {
        waitframe();
    }
    function_19b9bb9cef6a2d3();
    waitforhealthregendelay();
    function_8e4f69eea1104dcc();
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b8
// Size: 0x83
function private function_fb3404dca14b5916() {
    self endon("death_or_disconnect");
    self endon("enter_live_ragdoll");
    while (1) {
        self waittill("force_regeneration");
        self.var_af81fc2e2a39800f = 1;
        /#
            var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
            if (var_4552ad49778498ee) {
                print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>");
            }
        #/
        thread function_8e4f69eea1104dcc();
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x542
// Size: 0x197
function private waitforhealthregendelay() {
    if (isdefined(self.var_908c151f034b37e8)) {
        if (!istrue(self.var_7d5dc55c0e7c065b)) {
            thread namespace_360f523a8fbe8545::function_44ec1c3e385bd14b();
        }
    }
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>");
        }
    #/
    while (istrue(self.healthregendisabled) || !val::get("health_regen") || istrue(self.var_35116e057346139e)) {
        waitframe();
    }
    var_399288f08aaf56e5 = gettime();
    self.var_73b0186b9643675a = var_399288f08aaf56e5;
    self.currentregendelay = function_5c0987ada94437df();
    while (self.currentregendelay > 0) {
        self.currentregendelay = function_5c0987ada94437df(self.var_73b0186b9643675a);
        /#
            assert(self.var_73b0186b9643675a == var_399288f08aaf56e5);
        #/
        wait(0.05);
    }
    if (isdefined(level.gametype) && level.gametype == "dungeons") {
        while (utility::damageflag(2)) {
            waitframe();
        }
    }
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>");
        }
    #/
    self.currentregendelay = undefined;
    self.var_73b0186b9643675a = undefined;
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e0
// Size: 0x223
function private function_8e4f69eea1104dcc() {
    var_3998aa2fc8abba2c = !istrue(self.adrenalinepoweractive) && !istrue(self.var_808d06ddfc93a4e4) && !istrue(self.bandageactive) && !istrue(self.laststandhealisactive);
    if (var_3998aa2fc8abba2c && istrue(self.healing)) {
        return;
    }
    if (!_isalive()) {
        return;
    }
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>");
        }
    #/
    self notify("healOverTimeThink");
    self endon("healOverTimeThink");
    self endon("death_or_disconnect");
    self endon("enter_live_ragdoll");
    self endon("damage");
    level endon("game_ended");
    var_7f86cf029bef696d = istrue(self.adrenalinepoweractive);
    var_4a2ae12522ad9d95 = self.health;
    var_9cab7fb3eaa1ac48 = 0;
    var_2a0c127782c20593 = function_ffa24fdcb2f2f661(var_3998aa2fc8abba2c);
    while (self.health / self.maxhealth < var_2a0c127782c20593) {
        if (!val::get("health_regen") || istrue(self.healthregendisabled) && var_3998aa2fc8abba2c) {
            self.healing = 0;
            return;
        }
        self.healing = 1;
        function_326da60065b28039();
        var_9cab7fb3eaa1ac48 = var_9cab7fb3eaa1ac48 + gethealthperframe();
        self.health = int(min(self.maxhealth, var_9cab7fb3eaa1ac48 + self.health));
        function_25bcb1f5ecb2c04e();
        var_9cab7fb3eaa1ac48 = var_9cab7fb3eaa1ac48 % 1;
        function_19b9bb9cef6a2d3();
        wait(0.05);
    }
    self.healing = 0;
    if (isdefined(self.var_908c151f034b37e8)) {
        thread namespace_360f523a8fbe8545::function_6ed51e2f80c93fa6();
    }
    if (isdefined(self.var_af81fc2e2a39800f)) {
        self.var_af81fc2e2a39800f = undefined;
    }
    if (self.health >= self.maxhealth) {
        onfullhealth(var_4a2ae12522ad9d95, var_3998aa2fc8abba2c, var_7f86cf029bef696d);
        function_19b9bb9cef6a2d3();
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90a
// Size: 0xda
function private function_79429693a2f7755d(var_22b5b902570c2d6, var_33a536d1dbc55784) {
    /#
        assert(isdefined(var_22b5b902570c2d6));
    #/
    /#
        assert(isdefined(var_33a536d1dbc55784) && isfloat(var_33a536d1dbc55784));
    #/
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    if (!isdefined(self.var_278adeade4a9e3a5)) {
        self.var_278adeade4a9e3a5 = [];
    }
    if (array_contains_key(self.var_278adeade4a9e3a5, var_22b5b902570c2d6)) {
        return 0;
    } else {
        self.var_278adeade4a9e3a5[var_22b5b902570c2d6] = var_33a536d1dbc55784;
        /#
            var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
            if (var_4552ad49778498ee) {
                print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + var_22b5b902570c2d6);
            }
        #/
        return 1;
    }
    return 0;
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x34
function function_5457f0107a845374(var_22b5b902570c2d6, var_33a536d1dbc55784, var_5b1d349f3d7879ee) {
    function_79429693a2f7755d(var_22b5b902570c2d6, var_33a536d1dbc55784);
    if (isdefined(var_5b1d349f3d7879ee)) {
        thread function_c37d70b38d3aceba(var_22b5b902570c2d6, var_5b1d349f3d7879ee);
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa27
// Size: 0x47
function private function_c37d70b38d3aceba(var_22b5b902570c2d6, var_3669ac207c224e12) {
    level endon("game_ended");
    self notify("regenModifierTimeoutThread_" + var_22b5b902570c2d6);
    self endon("regenModifierTimeoutThread_" + var_22b5b902570c2d6);
    waittill_any_timeout_1(var_3669ac207c224e12 / 1000, "death_or_disconnect");
    function_4f8b5efd1816f6c3(var_22b5b902570c2d6);
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa75
// Size: 0xc3
function function_4f8b5efd1816f6c3(var_22b5b902570c2d6) {
    /#
        assert(isdefined(var_22b5b902570c2d6));
    #/
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    if (!isdefined(self) || !isdefined(self.var_278adeade4a9e3a5)) {
        return 0;
    }
    if (array_contains_key(self.var_278adeade4a9e3a5, var_22b5b902570c2d6)) {
        self.var_278adeade4a9e3a5 = array_remove_key(self.var_278adeade4a9e3a5, var_22b5b902570c2d6);
        /#
            var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
            if (var_4552ad49778498ee) {
                print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + var_22b5b902570c2d6);
            }
        #/
        return 1;
    }
    return 0;
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb40
// Size: 0x25
function function_7e8e4a9f891d5806() {
    if (isdefined(self.var_73b0186b9643675a)) {
        return function_5c0987ada94437df(self.var_73b0186b9643675a);
    } else {
        return undefined;
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6c
// Size: 0x264
function function_5c0987ada94437df(var_136d4cb8aa835cfb) {
    var_3d45dcb5c34b2867 = 5000;
    var_f17191554cd9309e = var_3d45dcb5c34b2867;
    if (!isdefined(self.regendelayspeed)) {
        self.regendelayspeed = 1;
    }
    if (isdefined(level.regendelayspeedfunc)) {
        self.regendelayspeed = [[ level.regendelayspeedfunc ]](self.regendelayspeed);
        /#
            var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
            if (var_4552ad49778498ee) {
                print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + self.regendelayspeed);
            }
        #/
    }
    if (isdefined(self.var_908c151f034b37e8)) {
        var_3d45dcb5c34b2867 = ceil(var_f17191554cd9309e * self.var_908c151f034b37e8);
    } else {
        var_12772f2177ce6466 = max(2 - function_71005b327450d873() - self.regendelayspeed, 0);
        if (isdefined(level.var_ddc10ba2983b0b0c) && function_eba2f2e094684b8f("specialty_elasomer_pads")) {
            var_12772f2177ce6466 = var_12772f2177ce6466 * level.var_ddc10ba2983b0b0c;
        }
        if (isdefined(self.var_93d588c5ef8b2dec)) {
            var_3d45dcb5c34b2867 = self.var_93d588c5ef8b2dec * 1000;
        } else if (isdefined(level.healthregendelay)) {
            var_3d45dcb5c34b2867 = ceil(level.healthregendelay * 1000 * var_12772f2177ce6466);
        } else if (isdefined(self.gs.healthregendelay)) {
            var_3d45dcb5c34b2867 = self.gs.healthregendelay * 1000;
        } else {
            var_3d45dcb5c34b2867 = ceil(5000 * var_12772f2177ce6466);
        }
        if (getdvarint(@"hash_a3ebe91e8c1fc085", -1) > 0) {
            var_cb8e3527c6c90e41 = getdvarint(@"hash_a3ebe91e8c1fc085", -1);
            var_3d45dcb5c34b2867 = ceil(var_cb8e3527c6c90e41 * var_12772f2177ce6466);
        }
    }
    if (isdefined(var_136d4cb8aa835cfb)) {
        timeoffset = gettime();
        timeoffset = timeoffset - var_136d4cb8aa835cfb;
        var_3d45dcb5c34b2867 = var_3d45dcb5c34b2867 - timeoffset;
    }
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + var_3d45dcb5c34b2867);
        }
    #/
    return max(var_3d45dcb5c34b2867, 0);
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd8
// Size: 0xd5
function private function_71005b327450d873() {
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    var_e9e9e13b20a550ab = 0;
    if (isdefined(self.var_278adeade4a9e3a5)) {
        foreach (mod in self.var_278adeade4a9e3a5) {
            var_e9e9e13b20a550ab = var_e9e9e13b20a550ab + mod;
        }
        /#
            var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
            if (var_4552ad49778498ee) {
                print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + var_e9e9e13b20a550ab);
            }
        #/
    }
    return var_e9e9e13b20a550ab;
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb5
// Size: 0x31
function function_ffa24fdcb2f2f661(var_3998aa2fc8abba2c) {
    if (var_3998aa2fc8abba2c && isdefined(level.var_e148f7d0b42fe6da)) {
        return level.var_e148f7d0b42fe6da;
    } else {
        return 1;
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeed
// Size: 0x5c
function private function_326da60065b28039() {
    if (isdefined(self.var_eaa417c82fc6f913)) {
        self [[ self.var_eaa417c82fc6f913 ]]();
    }
    if (isdefined(self.var_4aec8a632dc40e2c) && !isdefined(self.var_af81fc2e2a39800f) && self.health != self.maxhealth) {
        self [[ self.var_4aec8a632dc40e2c ]]();
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf50
// Size: 0x1f8
function gethealthperframe() {
    if (function_244067e915c0eabe()) {
        var_881fb15f4d296741 = level.playermaxhealth / 150;
    } else {
        var_881fb15f4d296741 = 1;
    }
    var_89e7b92573a50713 = level.var_be39d6b46044f344 * 0.05 * var_881fb15f4d296741;
    if (getdvarint(@"hash_b3d928c9f115218a", 0) > 0) {
        var_fbb0e274527f2097 = getdvarint(@"hash_b3d928c9f115218a", 0);
        var_89e7b92573a50713 = var_fbb0e274527f2097 * 0.05 * var_881fb15f4d296741;
    }
    if (issharedfuncdefined("player", "getGametypeHealthPerFrame")) {
        var_89e7b92573a50713 = self [[ getsharedfunc("player", "getGametypeHealthPerFrame") ]]();
    } else if (function_eba2f2e094684b8f("specialty_regenfaster") && isdefined(level.regenfasterhealthmod)) {
        var_89e7b92573a50713 = var_89e7b92573a50713 * level.regenfasterhealthmod;
    }
    if (isdefined(level.regenhealthaddfunc)) {
        var_89e7b92573a50713 = [[ level.regenhealthaddfunc ]](var_89e7b92573a50713);
    }
    var_ba669c07247b5ab0 = {var_7f2add2da3f0d3bf:1};
    callback::callback(#"hash_6a8a551945faab9", var_ba669c07247b5ab0);
    var_89e7b92573a50713 = var_89e7b92573a50713 * var_ba669c07247b5ab0.var_7f2add2da3f0d3bf;
    if (isdefined(level.var_57bb11871e940991)) {
        foreach (func in level.var_57bb11871e940991) {
            var_84ea1c2720d87124 = self [[ func ]](var_89e7b92573a50713);
            if (isdefined(var_84ea1c2720d87124)) {
                var_89e7b92573a50713 = var_89e7b92573a50713 * var_84ea1c2720d87124;
            }
        }
    }
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + var_89e7b92573a50713);
        }
    #/
    return var_89e7b92573a50713;
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1150
// Size: 0x1d
function private function_25bcb1f5ecb2c04e() {
    if (isdefined(self.var_50fbc0f48ccfe94e)) {
        self [[ self.var_50fbc0f48ccfe94e ]]();
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x13b
function private onfullhealth(var_4a2ae12522ad9d95, var_823ca369fafd4a36, var_7f86cf029bef696d) {
    var_e394e626ca540132 = self.health - var_4a2ae12522ad9d95;
    if (issharedfuncdefined("player", "onFullHealth")) {
        self [[ getsharedfunc("player", "onFullHealth") ]](var_4a2ae12522ad9d95, var_823ca369fafd4a36, var_7f86cf029bef696d);
    }
    if (var_7f86cf029bef696d) {
        namespace_aad14af462a74d08::onstim(var_e394e626ca540132);
    }
    function_9ef4f53d298067a2();
    self notify("healed");
    level notify("healed", self);
    if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9)) {
        if (!istrue(self.inlaststand)) {
            namespace_4887422e77f3514e::function_446043a04ae1bfe();
        }
    } else {
        thread namespace_4887422e77f3514e::removeoldattackersovertime();
    }
    if (!level.gameended && !isusingremote()) {
        self playlocalsound(ter_op(isfemale(), "Fem_breathing_better", "breathing_better"));
    }
    /#
        var_4552ad49778498ee = getdvarint(@"hash_9e41eb34980a2301", 0);
        if (var_4552ad49778498ee) {
            print(gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + var_e394e626ca540132);
        }
    #/
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12b6
// Size: 0x1d
function private function_9ef4f53d298067a2() {
    if (isdefined(self.var_71c054a8df6f6e2b)) {
        self [[ self.var_71c054a8df6f6e2b ]]();
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12da
// Size: 0x82
function function_19b9bb9cef6a2d3() {
    healthratio = self.health / self.maxhealth;
    if (healthratio > level.var_fdd1af3c4c6cbe86 && !istrue(self.inlaststand)) {
        namespace_4887422e77f3514e::onexitdeathsdoor(1);
    }
    if ((healthratio <= level.var_562530bdb8e83b66 || istrue(self.inlaststand)) && !namespace_448ccf1ca136fbbe::isusingremote() && !istrue(self.ignoredeathsdoor)) {
        namespace_4887422e77f3514e::onenterdeathsdoor(undefined);
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1363
// Size: 0x4e
function function_93cd34979e0adbdd(var_c79a45c6dcb67386) {
    /#
        assert(isdefined(var_c79a45c6dcb67386), "func_healthperframe_modifier is a required argument for register_healthperframe_modifier!");
    #/
    level.var_57bb11871e940991 = function_53c4c53197386572(level.var_57bb11871e940991, []);
    level.var_57bb11871e940991 = array_add(level.var_57bb11871e940991, var_c79a45c6dcb67386);
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13b8
// Size: 0xa1
function function_5f963b9b662284bc(var_c79a45c6dcb67386) {
    /#
        assert(isdefined(var_c79a45c6dcb67386), "func_healthperframe_modifier is a required argument for register_healthperframe_modifier!");
    #/
    level.var_57bb11871e940991 = function_53c4c53197386572(level.var_57bb11871e940991, []);
    foreach (func in level.var_57bb11871e940991) {
        if (func == var_c79a45c6dcb67386) {
            level.var_57bb11871e940991 = array_remove(level.var_57bb11871e940991, var_c79a45c6dcb67386);
        }
    }
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1460
// Size: 0x166
function function_31a13be1530a809b() {
    /#
        self endon("<unknown string>");
        self.var_8f835e0ab1dfb567 = spawnstruct();
        self.var_8f835e0ab1dfb567.var_946b001669de27fb = [];
        self.var_8f835e0ab1dfb567.active = 0;
        while (isdefined(self)) {
            if (getdvarint(@"hash_8ae88877360e4699") && !self.var_8f835e0ab1dfb567.active) {
                thread function_cdac508141881a7c();
                self.var_8f835e0ab1dfb567.active = 1;
            }
            if (!getdvarint(@"hash_8ae88877360e4699") && self.var_8f835e0ab1dfb567.active) {
                self notify("<unknown string>");
                foreach (var_bed6393fb2e34b6a in self.var_8f835e0ab1dfb567.var_946b001669de27fb) {
                    self.var_8f835e0ab1dfb567.var_946b001669de27fb = array_remove(self.var_8f835e0ab1dfb567.var_946b001669de27fb, var_bed6393fb2e34b6a);
                    var_bed6393fb2e34b6a destroy();
                }
                self.var_8f835e0ab1dfb567.active = 0;
            }
            waitframe();
        }
    #/
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15cd
// Size: 0x209
function function_cdac508141881a7c() {
    /#
        self endon("<unknown string>");
        function_6840973f983f0bae("<unknown string>");
        function_6840973f983f0bae("<unknown string>");
        while (1) {
            waittillframeend();
            if (utility::damageflag(2)) {
                color = (1, 0, 0);
            } else {
                color = (0, 1, 0);
            }
            self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"] setvalue(self.health);
            self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"].color = color;
            if (isalive(self)) {
                if (utility::damageflag(2)) {
                    if (utility::damageflag(1)) {
                        var_61cf390635798c6d = getdeathsshieldduration();
                        self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"] setdevtext("<unknown string>" + string(var_61cf390635798c6d) + "<unknown string>");
                        self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"].color = (0, 1, 0);
                    } else {
                        var_aceab7f4a1e5c8c3 = getdeathsdoorduration();
                        self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"] setdevtext("<unknown string>" + string(var_aceab7f4a1e5c8c3) + "<unknown string>");
                        self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"].color = (1, 0, 0);
                    }
                } else {
                    self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"] setdevtext("<unknown string>");
                }
            } else {
                self.var_8f835e0ab1dfb567.var_946b001669de27fb["<unknown string>"] setdevtext("<unknown string>");
            }
            waitframe();
        }
    #/
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17dd
// Size: 0xfd
function function_6840973f983f0bae(id) {
    /#
        var_9d69e3346516fb1d = 10;
        var_a433f967ff6228dc = 15;
        yoffset = self.var_8f835e0ab1dfb567.var_946b001669de27fb.size * var_a433f967ff6228dc;
        var_bed6393fb2e34b6a = newclienthudelem(self);
        var_bed6393fb2e34b6a.sort = 10;
        var_bed6393fb2e34b6a.x = 85;
        var_bed6393fb2e34b6a.y = var_9d69e3346516fb1d + yoffset;
        var_bed6393fb2e34b6a.fontscale = 1;
        var_bed6393fb2e34b6a.alignx = "<unknown string>";
        var_bed6393fb2e34b6a.aligny = "<unknown string>";
        var_bed6393fb2e34b6a.horzalign = "<unknown string>";
        var_bed6393fb2e34b6a.vertalign = "<unknown string>";
        var_bed6393fb2e34b6a.sort = 1;
        self.var_8f835e0ab1dfb567.var_946b001669de27fb[id] = var_bed6393fb2e34b6a;
    #/
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e1
// Size: 0x16
function getdeathsdoorduration() {
    return self.gs.deathsdoorduration;
}

// Namespace playerhealth/namespace_54a2eae43eaa8bf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ff
// Size: 0x2a
function getdeathsshieldduration() {
    return self.gs.invultime_deathshieldduration * self.gs.scripteddeathshielddurationscale;
}

