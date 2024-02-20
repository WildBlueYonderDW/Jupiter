// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3e31016b9c11a616;
#using script_16ea1b94f0f381b3;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_6df6604a74a7a9c7;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_3ab210ea917601e7;
#using script_5753ba9c28794a65;

#namespace namespace_c8a807248ca3f47d;

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f
// Size: 0xa0
function function_31e28d0e057c0d07() {
    function_89384091f7a2dbd("REV_OB_SEISMIC_REFRACTOR", 0, &function_cfb28dad6a5410be);
    function_89384091f7a2dbd("REV_OB_SEISMIC_REFRACTOR", 1, &function_3d85412dd6a84866);
    function_89384091f7a2dbd("REV_OB_SEISMIC_REFRACTOR", 2, &activity_ended);
    function_89384091f7a2dbd("REV_OB_SEISMIC_REFRACTOR", 3, &function_79e66eac19016c0d);
    function_89384091f7a2dbd("REV_OB_SEISMIC_REFRACTOR", 4, &function_6bb48579974ebf1e);
    function_89384091f7a2dbd("REV_OB_SEISMIC_REFRACTOR", 5, &function_81c481082c5b5b33);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_SEISMIC_REFRACTOR");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_SEISMIC_REFRACTOR");
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216
// Size: 0x102
function function_cfb28dad6a5410be() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self.var_fb827f87612aec15 = getstruct(self.var_626b45032e1892da, "targetname");
    self.var_d1ae8ddead6cd001 = getstruct(self.var_626b45032e1892da + "_RADIANT", "targetname");
    self.var_5e039caea04140ad = self.var_d1ae8ddead6cd001 function_50b5e4fcc500bb90("seismic_refractor_console", "targetname")[0];
    self.var_5e039caea04140ad setscriptablepartstate("model", "1");
    self.var_be8ebaf932e93656 = function_3ee36bc763779ba1(self.var_d1ae8ddead6cd001.target, 1, 1, 2, 2);
    function_84b829dec3e573eb(self.var_be8ebaf932e93656, &function_e79f9faf8ebf2975, var_2f5d509d7b71ce9a);
    while (!(self.var_5e039caea04140ad getscriptablepartstate("model") == "active")) {
        waitframe();
    }
    function_b6fc2c96b463c007(var_2f5d509d7b71ce9a);
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f
// Size: 0x3b
function function_3d85412dd6a84866() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    thread function_29e25c057d535749();
    wait(4);
    function_55caa7ecdad1659c(self.var_be8ebaf932e93656);
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x361
// Size: 0x7f
function private function_29e25c057d535749() {
    var_85605e53426618ed = randomintrange(8, 12);
    var_2a4bffc6b2eef12d = 300;
    for (i = 0; i < var_85605e53426618ed; i++) {
        offset = function_6174330574a2a273() * var_2a4bffc6b2eef12d;
        while (!(self.var_5e039caea04140ad getscriptablepartstate("effects") == "pulse")) {
            waitframe();
        }
        wait(1);
    }
    function_612d18fdbc979c0b(self, 0);
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e7
// Size: 0x26
function private function_e79f9faf8ebf2975(requestid, userdata, var_43276c036d41a5a2, data) {
    return 1;
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415
// Size: 0x1f
function activity_ended(activity_succeeded) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0x1d
function function_79e66eac19016c0d() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    function_c0d31caee717b8eb();
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x35
function function_c0d31caee717b8eb() {
    self.var_5e039caea04140ad setscriptablepartstate("effects", "0");
    self.var_5e039caea04140ad setscriptablepartstate("model", "0");
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b
// Size: 0x10
function function_6bb48579974ebf1e() {
    return (0, 0, 0);
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3
// Size: 0x5a
function function_81c481082c5b5b33() {
    var_cc7aa96a854fd8ee = spawnstruct();
    var_cc7aa96a854fd8ee.origin = self.var_d1ae8ddead6cd001.origin + (0, 50, 0);
    var_cc7aa96a854fd8ee.angles = (0, 0, 0);
    return var_cc7aa96a854fd8ee;
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x515
// Size: 0x38
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_c8a807248ca3f47d/namespace_d56687a02b91720a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x554
// Size: 0x22
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
}

