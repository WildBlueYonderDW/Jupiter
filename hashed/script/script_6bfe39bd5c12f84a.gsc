// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_86bd2c6e12e86a39;

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4
// Size: 0x16
function main(var_ab5381a1c9cf0ce5) {
    level thread function_741772fd1005a4c9(var_ab5381a1c9cf0ce5);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f1
// Size: 0x10e
function private function_741772fd1005a4c9(var_ab5381a1c9cf0ce5) {
    var_36256eeb4f76a38c = getdvar(@"hash_33a01af682caae50", 0);
    setdvarifuninitialized(@"hash_33a01af682caae50", var_36256eeb4f76a38c);
    if (getdvarint(@"hash_33a01af682caae50", -1) <= 0) {
        return;
    }
    level.var_d766faf69209bbd6 = spawnstruct();
    level.var_d766faf69209bbd6.var_5ebb807c9da025a5 = [];
    level.var_d766faf69209bbd6.funcs = [];
    if (isfunction(var_ab5381a1c9cf0ce5)) {
        var_ab5381a1c9cf0ce5 = [[ var_ab5381a1c9cf0ce5 ]]();
    }
    foreach (index, func in var_ab5381a1c9cf0ce5) {
        level.var_d766faf69209bbd6.funcs[index] = func;
    }
    if (!istrue(function_9ddaf19178508d55())) {
        return;
    }
    level thread function_9d4b2121c099b285();
    /#
        level thread function_8977a3724ec5ce9e();
    #/
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x606
// Size: 0x3e
function private function_9ddaf19178508d55() {
    if (isdefined(level.var_d766faf69209bbd6.funcs["shouldRun"])) {
        return level [[ level.var_d766faf69209bbd6.funcs["shouldRun"] ]]();
    }
    return 0;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x64c
// Size: 0x144
function private function_9d4b2121c099b285() {
    level endon("game_ended");
    if (isdefined(level.var_d766faf69209bbd6.funcs["init"])) {
        level [[ level.var_d766faf69209bbd6.funcs["init"] ]]();
    }
    level childthread [[ level.var_d766faf69209bbd6.funcs["checkForDataUpdates"] ]]();
    while (1) {
        val = player = level waittill("visibilityModeValUpdatedForPlayer");
        level.var_d766faf69209bbd6.var_5ebb807c9da025a5 = function_c1d9fd48eb09c8c9();
        if (level.var_d766faf69209bbd6.var_5ebb807c9da025a5.size == 0) {
            continue;
        }
        for (index = 0; index < level.var_d766faf69209bbd6.var_5ebb807c9da025a5.size; index++) {
            if (isdefined(level.var_d766faf69209bbd6.var_5ebb807c9da025a5[index]) && !isdefined(level.var_d766faf69209bbd6.var_5ebb807c9da025a5[index].var_ada3f21a8212c26f)) {
                level thread function_c3ae50f84a8329ac(level.var_d766faf69209bbd6.var_5ebb807c9da025a5[index]);
            }
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x797
// Size: 0xbe
function private function_afe539c207a6b2fb(firstplayer, var_204da528aa0a3464) {
    if (issp()) {
        return (firstplayer.team == "axis");
    }
    if (!isdefined(firstplayer) || !isdefined(var_204da528aa0a3464)) {
        return 0;
    }
    if (!isdefined(firstplayer.team) || !isdefined(var_204da528aa0a3464.team)) {
        return 0;
    }
    if (firstplayer.team == "civilian" || var_204da528aa0a3464.team == "civilian") {
        return 0;
    }
    if (level.teambased) {
        var_8b1b7044e27e6a56 = firstplayer.team == var_204da528aa0a3464.team;
        return !var_8b1b7044e27e6a56;
    }
    return firstplayer != var_204da528aa0a3464;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x85d
// Size: 0x22
function private function_753e2e2a70ae2d65(ent) {
    return isalive(ent) || istrue(ent.var_d4ca148f5670a1f6);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x887
// Size: 0x143
function private function_c3ae50f84a8329ac(client) {
    client endon("disconnect");
    client.var_ada3f21a8212c26f = 1;
    playernum = client getentitynumber();
    client childthread function_40353363f8512bb0();
    client thread function_924634e910fbfc75();
    while (client function_5f46cf1503a0541a()) {
        wait(0.5);
        if (!client function_5f46cf1503a0541a()) {
            break;
        }
        if (!isalive(client)) {
            continue;
        }
        var_c68737226b9498a = [[ level.var_d766faf69209bbd6.funcs["getTargetArray"] ]](client);
        var_c68737226b9498a = array_combine(var_c68737226b9498a, level.var_d766faf69209bbd6.var_c3f9401112fb5d27);
        for (i = 0; i < var_c68737226b9498a.size; i++) {
            if (var_c68737226b9498a[i] == client) {
                continue;
            }
            if (!function_753e2e2a70ae2d65(var_c68737226b9498a[i])) {
                continue;
            }
            if (var_c68737226b9498a[i] function_3359e7308038233e(client)) {
                continue;
            }
            if (isdefined(var_c68737226b9498a[i].var_79a7c8a11ed7c0e3)) {
                jumpiffalse(isdefined(var_c68737226b9498a[i].var_79a7c8a11ed7c0e3[playernum])) LOC_00000112;
            } else if (isdefined(var_c68737226b9498a[i])) {
                var_c68737226b9498a[i] thread function_8419f0f3143cdcfa(client);
            }
        }
    }
    client.var_ada3f21a8212c26f = undefined;
    client notify("visibiltyMode_disabled");
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d1
// Size: 0x164
function private function_8419f0f3143cdcfa(client) {
    if (istrue(self.var_533e1f58c82c7473)) {
        return;
    }
    playernum = client getentitynumber();
    if (isdefined(self.var_79a7c8a11ed7c0e3)) {
        if (isdefined(self.var_79a7c8a11ed7c0e3[playernum])) {
            return;
        }
    }
    if (!isdefined(self.team)) {
        return;
    }
    var_517520758f9c478f = client function_266da5d877397673();
    if (function_afe539c207a6b2fb(self, client)) {
        if (var_517520758f9c478f == "alliesonly") {
            return;
        }
        self.var_23e106fcb074622f = client function_ea4e39208c784a4a();
    } else if (isplayer(self)) {
        if (var_517520758f9c478f == "enemiesonly") {
            return;
        }
        self.var_23e106fcb074622f = client function_63a1833b6a352cd7();
    } else {
        if (var_517520758f9c478f == "enemiesonly") {
            return;
        }
        self.var_23e106fcb074622f = client function_4448756918b98e87();
    }
    var_1d5eb7943c015cc = level.var_d766faf69209bbd6.funcs["enableForClient"];
    if (!isdefined(self.var_79a7c8a11ed7c0e3)) {
        self.var_79a7c8a11ed7c0e3 = [];
    }
    id = self [[ var_1d5eb7943c015cc ]](client, self.var_23e106fcb074622f, "lowest");
    clientnum = client getentitynumber();
    self.var_79a7c8a11ed7c0e3[clientnum] = id;
    thread function_c0ae1fa01f6b706b(client);
    thread visibilitymode_disableoutlineondeath();
    thread function_e5c56140ae690938(client);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb3c
// Size: 0xf3
function private visibilitymode_disableoutlineondeath() {
    level endon("game_ended");
    self notify("visibilityMode_disableOutlineOnDeath");
    self endon("visibilityMode_disableOutlineOnDeath");
    outlineids = [];
    foreach (id in self.var_79a7c8a11ed7c0e3) {
        outlineids[outlineids.size] = id;
    }
    self waittill("death_or_disconnect");
    foreach (id in outlineids) {
        if (isdefined(id)) {
            self [[ level.var_d766faf69209bbd6.funcs["disable"] ]](id);
        }
    }
    self.var_23e106fcb074622f = undefined;
    self.var_79a7c8a11ed7c0e3 = undefined;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc36
// Size: 0xe6
function private function_c0ae1fa01f6b706b(client) {
    self endon("death");
    client endon("disconnect");
    if (isplayer(self)) {
        self endon("disconnect");
    }
    clientnum = client getentitynumber();
    self notify("visibilityMode_disableOutlineOnCallback_" + clientnum);
    self endon("visibilityMode_disableOutlineOnCallback_" + clientnum);
    oldvalue = client.visibilitymodeval;
    var_26d30630ea0383c3 = client.var_5615f87228f360c8;
    while (1) {
        var_b5c8180e91e8c890 = val = client waittill("visibilityModeVal");
        if (isdefined(val) && val == 0) {
            break;
        }
        if (val != oldvalue || var_b5c8180e91e8c890 != var_26d30630ea0383c3) {
            function_85e0f20ba385bf6d(client);
        }
        oldvalue = client.visibilitymodeval;
        var_26d30630ea0383c3 = client.var_5615f87228f360c8;
    }
    function_6b814eafddccdd4d(client);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0xac
function private function_6b814eafddccdd4d(client) {
    if (!isdefined(self.var_79a7c8a11ed7c0e3)) {
        return;
    }
    foreach (playernum, id in self.var_79a7c8a11ed7c0e3) {
        clientnum = client getentitynumber();
        if (clientnum == playernum) {
            if (isdefined(id)) {
                self [[ level.var_d766faf69209bbd6.funcs["disable"] ]](id);
                self.var_79a7c8a11ed7c0e3[playernum] = undefined;
            }
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd6
// Size: 0x1d
function private function_85e0f20ba385bf6d(client) {
    function_6b814eafddccdd4d(client);
    thread function_8419f0f3143cdcfa(client);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdfa
// Size: 0xb4
function private function_e5c56140ae690938(client) {
    if (!isdefined(level.var_d766faf69209bbd6.funcs["outlineOccluded"])) {
        return;
    }
    clientnum = client getentitynumber();
    self notify("visibilityMode_disableOnsmokeOcclude_" + clientnum);
    self endon("visibilityMode_disableOnsmokeOcclude_" + clientnum);
    self endon("death_or_disconnect");
    client endon("disconnect");
    client endon("visibiltyMode_disabled");
    while (1) {
        wait(0.5);
        if (!within_fov(client.origin, client.angles, self.origin, 0.766)) {
            continue;
        }
        if (function_3359e7308038233e(client)) {
            function_6b814eafddccdd4d(client);
            return;
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb5
// Size: 0xef
function private function_3359e7308038233e(client) {
    if (!isdefined(level.var_d766faf69209bbd6.funcs["outlineOccluded"])) {
        return 0;
    }
    var_f1fccda1ad4edf59 = undefined;
    if (issentient(self)) {
        var_f1fccda1ad4edf59 = self geteye();
    } else if (istrue(self.var_d4ca148f5670a1f6)) {
        if (self tagexists("TAG_EYE")) {
            var_f1fccda1ad4edf59 = self gettagorigin("TAG_EYE");
        } else if (self tagexists("TAG_HEAD")) {
            var_f1fccda1ad4edf59 = self gettagorigin("TAG_HEAD");
        } else {
            midpoint = function_abf76cc289cf03a3(self.model);
            var_f1fccda1ad4edf59 = self.origin + (0, 0, midpoint[2] * 2);
        }
    }
    if ([[ level.var_d766faf69209bbd6.funcs["outlineOccluded"] ]](client geteye(), var_f1fccda1ad4edf59)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfac
// Size: 0x10b
function function_8c2e8285c9915b12(var_1a265c496508b47b, var_a501e8f119cc62ce) {
    /#
        println("outlinefill_depth_green" + var_1a265c496508b47b);
    #/
    var_fbc7ad2d6177ce87 = spawnstruct();
    var_fbc7ad2d6177ce87.currentvalue = var_1a265c496508b47b;
    var_fbc7ad2d6177ce87.var_a501e8f119cc62ce = var_a501e8f119cc62ce;
    var_fbc7ad2d6177ce87.controllerindex = 0;
    var_fbc7ad2d6177ce87.var_93549f28b5b2d802 = "normal";
    var_fbc7ad2d6177ce87.var_4d49c11adf0f1d63 = "green";
    var_fbc7ad2d6177ce87.var_7205d3d5d54d0b33 = "blue";
    var_fbc7ad2d6177ce87.var_29100ed6a90836be = "red";
    var_fbc7ad2d6177ce87.var_9275b71d42944e57 = 0;
    var_fbc7ad2d6177ce87 = function_f3239764175224da(var_fbc7ad2d6177ce87);
    var_fbc7ad2d6177ce87 = function_70cde4aff892c728(var_fbc7ad2d6177ce87);
    var_fbc7ad2d6177ce87 = function_3b372246c79c0658(var_fbc7ad2d6177ce87);
    var_fbc7ad2d6177ce87 = function_d7ed7d211a79ceb3(var_fbc7ad2d6177ce87);
    var_fbc7ad2d6177ce87 = function_93260fadbd47622b(var_fbc7ad2d6177ce87);
    self.var_be1e6d7ff9628b76 = var_fbc7ad2d6177ce87;
    self.visibilitymodeval = var_1a265c496508b47b;
    self.var_5615f87228f360c8 = var_a501e8f119cc62ce;
    self notify("visibilityModeVal", var_1a265c496508b47b);
    level notify("visibilityModeValUpdatedForPlayer", self);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10be
// Size: 0x68
function private function_f3239764175224da(data) {
    if (data.currentvalue >= 3) {
        data.var_93549f28b5b2d802 = "alliesonly";
    } else if (data.currentvalue >= 2) {
        data.var_93549f28b5b2d802 = "enemiesonly";
    } else {
        data.var_93549f28b5b2d802 = "normal";
    }
    return data;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112e
// Size: 0x190
function private function_70cde4aff892c728(data) {
    if (isdefined(data.var_a501e8f119cc62ce) && data.var_a501e8f119cc62ce == 0) {
        data.currentvalue = data.currentvalue - 0;
        data.var_4d49c11adf0f1d63 = "outlinefill_depth_green";
    } else if (isdefined(data.var_a501e8f119cc62ce) && data.var_a501e8f119cc62ce == 1) {
        data.currentvalue = data.currentvalue - 64;
        data.var_4d49c11adf0f1d63 = "outline_highvis_green";
    } else if (data.currentvalue >= 192) {
        data.currentvalue = data.currentvalue - 192;
        data.var_4d49c11adf0f1d63 = "outline_depth_white";
    } else if (data.currentvalue >= 128) {
        data.currentvalue = data.currentvalue - 128;
        data.var_4d49c11adf0f1d63 = "outlinefill_depth_white";
    } else if (data.currentvalue >= 64) {
        data.currentvalue = data.currentvalue - 64;
        data.var_4d49c11adf0f1d63 = "outline_highvis_green";
    } else {
        data.currentvalue = data.currentvalue - 0;
        data.var_4d49c11adf0f1d63 = "outlinefill_depth_green";
    }
    return data;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12c6
// Size: 0x190
function private function_3b372246c79c0658(data) {
    if (isdefined(data.var_a501e8f119cc62ce) && data.var_a501e8f119cc62ce == 0) {
        data.currentvalue = data.currentvalue - 0;
        data.var_7205d3d5d54d0b33 = "outlinefill_depth_cyan";
    } else if (isdefined(data.var_a501e8f119cc62ce) && data.var_a501e8f119cc62ce == 1) {
        data.currentvalue = data.currentvalue - 16;
        data.var_7205d3d5d54d0b33 = "outline_depth_cyan";
    } else if (data.currentvalue >= 48) {
        data.currentvalue = data.currentvalue - 48;
        data.var_7205d3d5d54d0b33 = "outline_depth_green";
    } else if (data.currentvalue >= 32) {
        data.currentvalue = data.currentvalue - 32;
        data.var_7205d3d5d54d0b33 = "outlinefill_depth_green";
    } else if (data.currentvalue >= 16) {
        data.currentvalue = data.currentvalue - 16;
        data.var_7205d3d5d54d0b33 = "outline_depth_cyan";
    } else {
        data.currentvalue = data.currentvalue - 0;
        data.var_7205d3d5d54d0b33 = "outlinefill_depth_cyan";
    }
    return data;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x145e
// Size: 0x190
function private function_d7ed7d211a79ceb3(data) {
    if (isdefined(data.var_a501e8f119cc62ce) && data.var_a501e8f119cc62ce == 0) {
        data.currentvalue = data.currentvalue - 0;
        data.var_29100ed6a90836be = "outlinefill_depth_red";
    } else if (isdefined(data.var_a501e8f119cc62ce) && data.var_a501e8f119cc62ce == 1) {
        data.currentvalue = data.currentvalue - 4;
        data.var_29100ed6a90836be = "outline_depth_red";
    } else if (data.currentvalue >= 12) {
        data.currentvalue = data.currentvalue - 12;
        data.var_29100ed6a90836be = "outline_depth_yellow";
    } else if (data.currentvalue >= 8) {
        data.currentvalue = data.currentvalue - 8;
        data.var_29100ed6a90836be = "outlinefill_depth_yellow";
    } else if (data.currentvalue >= 4) {
        data.currentvalue = data.currentvalue - 4;
        data.var_29100ed6a90836be = "outline_depth_red";
    } else {
        data.currentvalue = data.currentvalue - 0;
        data.var_29100ed6a90836be = "outlinefill_depth_red";
    }
    return data;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15f6
// Size: 0x6f
function private function_93260fadbd47622b(data) {
    if (data.currentvalue > 2) {
        data.currentvalue = data.currentvalue - 2;
        data.var_9275b71d42944e57 = 1;
    } else {
        data.currentvalue = data.currentvalue - 0;
        data.var_9275b71d42944e57 = 0;
    }
    return data;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x166d
// Size: 0x55
function private function_40353363f8512bb0() {
    childthread function_d26ee9ff27d79349();
    while (function_5f46cf1503a0541a()) {
        wait(0.1);
        if (!isalive(self)) {
            continue;
        }
        if (!function_787341d4cc18bba()) {
            continue;
        }
        playerads = self playerads();
        if (playerads == 1) {
            childthread function_c4e7b8218a1533cc();
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c9
// Size: 0x1f6
function private function_c4e7b8218a1533cc() {
    var_bdf908d5d1aae9f2 = function_b8618b0d8d7ff3e3();
    entity = var_bdf908d5d1aae9f2.entity;
    if (isdefined(entity) && isdefined(entity.team) && isdefined(entity.var_23e106fcb074622f)) {
        var_517520758f9c478f = function_266da5d877397673();
        if (function_afe539c207a6b2fb(entity, self)) {
            if (var_517520758f9c478f == "alliesonly") {
                return;
            }
            var_5000bb58f1128c5c = 0;
            if (var_bdf908d5d1aae9f2.type == "middle") {
                if (var_5000bb58f1128c5c) {
                    if (soundexists("ui_text_type")) {
                        self playlocalsound("ui_text_type");
                    }
                }
                if (soundexists("2pop")) {
                    self playlocalsound("2pop");
                }
            } else if (var_bdf908d5d1aae9f2.type == "middle_near") {
                if (var_5000bb58f1128c5c) {
                    if (soundexists("ui_menu_ability_hover")) {
                        self playlocalsound("ui_menu_ability_hover");
                    }
                }
                if (soundexists("2pop_low")) {
                    self playlocalsound("2pop_low");
                }
            } else if (var_bdf908d5d1aae9f2.type == "left") {
                if (var_5000bb58f1128c5c) {
                    if (soundexists("ui_menu_ability_hover")) {
                        self playlocalsound("ui_menu_ability_hover");
                    }
                }
                if (soundexists("2pop_low")) {
                    self playlocalsound("2pop_low");
                }
            } else {
                if (var_5000bb58f1128c5c) {
                    if (soundexists("ui_menu_ability_hover")) {
                        self playlocalsound("ui_menu_ability_hover");
                    }
                }
                if (soundexists("2pop_low")) {
                    self playlocalsound("2pop_low");
                }
            }
        } else if (isplayer(entity)) {
            if (var_517520758f9c478f == "enemiesonly") {
                return;
            }
            if (soundexists("ui_chyron_firstline")) {
                self playlocalsound("ui_chyron_firstline");
            }
        } else {
            if (var_517520758f9c478f == "enemiesonly") {
                return;
            }
            if (soundexists("ui_chyron_plusminus")) {
                self playlocalsound("ui_chyron_plusminus");
            }
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18c6
// Size: 0x39e
function private function_b8618b0d8d7ff3e3() {
    tracedist = self [[ level.var_d766faf69209bbd6.funcs["getADSWeaponDist"] ]]();
    playerangles = self getgunangles();
    traceend = self geteye() + anglestoforward(playerangles) * tracedist;
    traceoffset = (0, 0, 0);
    var_9ccff25b22cb483b = 32;
    var_5d9720c9f3a6df33 = spawnstruct();
    var_5d9720c9f3a6df33.entity = undefined;
    var_5d9720c9f3a6df33.type = "middle";
    for (i = 0; i < 15; i++) {
        if (i == 1) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * -1, 0), playerangles);
            var_5d9720c9f3a6df33.type = "left";
        } else if (i == 2) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b, 0), playerangles);
            var_5d9720c9f3a6df33.type = "right";
        } else if (i == 3) {
            traceoffset = rotatevector((0, 0, var_9ccff25b22cb483b), playerangles);
            var_5d9720c9f3a6df33.type = "middle_near";
        } else if (i == 4) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * -1, var_9ccff25b22cb483b), playerangles);
            var_5d9720c9f3a6df33.type = "left";
        } else if (i == 5) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b, var_9ccff25b22cb483b), playerangles);
            var_5d9720c9f3a6df33.type = "right";
        } else if (i == 6) {
            traceoffset = rotatevector((0, 0, var_9ccff25b22cb483b * -1), playerangles);
            var_5d9720c9f3a6df33.type = "middle_near";
        } else if (i == 7) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * -1, var_9ccff25b22cb483b * -1), playerangles);
            var_5d9720c9f3a6df33.type = "left";
        } else if (i == 8) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b, var_9ccff25b22cb483b * -1), playerangles);
            var_5d9720c9f3a6df33.type = "right";
        } else if (i == 9) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * -2, var_9ccff25b22cb483b), playerangles);
            var_5d9720c9f3a6df33.type = "left";
        } else if (i == 10) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * -2, 0), playerangles);
            var_5d9720c9f3a6df33.type = "left";
        } else if (i == 11) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * -2, var_9ccff25b22cb483b * -1), playerangles);
            var_5d9720c9f3a6df33.type = "left";
        } else if (i == 12) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * 2, var_9ccff25b22cb483b), playerangles);
            var_5d9720c9f3a6df33.type = "right";
        } else if (i == 13) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * 2, 0), playerangles);
            var_5d9720c9f3a6df33.type = "right";
        } else if (i == 14) {
            traceoffset = rotatevector((0, var_9ccff25b22cb483b * 2, var_9ccff25b22cb483b * -1), playerangles);
            var_5d9720c9f3a6df33.type = "right";
        }
        trace = namespace_2a184fc4902783dc::ray_trace(self geteye(), traceend + traceoffset);
        if (isdefined(trace["entity"]) && (isplayer(trace["entity"]) || issentient(trace["entity"]))) {
            if (var_5d9720c9f3a6df33.type == "middle") {
                var_5d9720c9f3a6df33.type = function_4ffad916a54ca2f(trace, playerangles, tracedist);
            }
            var_5d9720c9f3a6df33.entity = trace["entity"];
            return var_5d9720c9f3a6df33;
        }
    }
    return var_5d9720c9f3a6df33;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c6c
// Size: 0x143
function private function_4ffad916a54ca2f(trace, playerangles, tracedist) {
    hitpos = trace["position"];
    var_1dc4c86806743c5c = trace["entity"] geteye();
    var_db58ac8cd20f8954 = trace["entity"] gettagorigin("tag_origin", 1);
    var_734d8fcbdd28f284 = self geteye() + anglestoforward(playerangles) * tracedist * 1.5;
    if (isdefined(var_1dc4c86806743c5c) && isdefined(var_db58ac8cd20f8954)) {
        data = namespace_3c37cb17ade254d::closestdistancebetweenlines(var_db58ac8cd20f8954, var_1dc4c86806743c5c, self geteye(), var_734d8fcbdd28f284);
        if (isdefined(data) && data[2] < 7) {
            return "middle";
        } else if (isdefined(data)) {
            up = anglestoup(playerangles);
            var_8a15205372a55a43 = function_767cea82b001f645(var_734d8fcbdd28f284 - self.origin);
            var_6a4277ff9e64049f = function_767cea82b001f645(var_db58ac8cd20f8954 - self.origin);
            var_c5f68cdf7b9421d9 = math::anglebetweenvectorssigned(var_8a15205372a55a43, var_6a4277ff9e64049f, up);
            if (var_c5f68cdf7b9421d9 > 0) {
                return "right";
            } else {
                return "left";
            }
        }
    }
    return "middle";
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1db7
// Size: 0xd2
function private function_d26ee9ff27d79349() {
    self.var_ff7a6caa0a544d30 = 0;
    self.var_44446bd6d8fd6ed0 = 0;
    self notifyonplayercommand("vis_sprint_pressed", "+breath_sprint");
    self notifyonplayercommand("vis_sprint_pressed", "+melee_breath");
    while (function_5f46cf1503a0541a()) {
        wait(0.1);
        if (!isalive(self)) {
            continue;
        }
        if (!function_787341d4cc18bba()) {
            wait(1);
            continue;
        }
        playerads = self playerads();
        if (playerads == 1) {
            if (self.var_ff7a6caa0a544d30 == 0) {
                self.var_ff7a6caa0a544d30 = 1;
                thread function_dc7453c8550c512c();
                thread function_eec104c84dc70618("vis_sprint_pressed");
            }
        } else if (playerads < 1) {
            self.var_ff7a6caa0a544d30 = 0;
            self.var_44446bd6d8fd6ed0 = 0;
            self notify("visibilityMode_stopads");
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e90
// Size: 0x49
function private function_eec104c84dc70618(type) {
    self endon("death_or_disconnect");
    self endon("visibilityMode_stopads");
    if (type == "vis_sprint_pressed") {
        while (1) {
            self waittill("vis_sprint_pressed");
            function_b17c1eba153a25e8();
            function_5c04dcd5e95fbb53();
            function_49afc10334084167();
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ee0
// Size: 0x40
function private function_b17c1eba153a25e8() {
    if (self getstance() != "prone") {
        return;
    }
    angles = (0, self.angles[1], self.angles[2]);
    self setplayerangles(angles);
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f27
// Size: 0x161
function private function_5c04dcd5e95fbb53() {
    self endon("death_or_disconnect");
    self endon("visibilityMode_stopads");
    if (istrue(level.var_d766faf69209bbd6.var_419d1a784e4b187c)) {
        return;
    }
    var_fb4c50d90a50b2dc = function_e3c04f03881b4dc7();
    active_players = [];
    var_b94177401c42c6ef = [];
    foreach (ally in var_fb4c50d90a50b2dc) {
        if (isplayer(ally)) {
            active_players[active_players.size] = ally;
        } else {
            var_b94177401c42c6ef[var_b94177401c42c6ef.size] = ally;
        }
    }
    active_players = sortbydistance(active_players, self.origin);
    for (i = 0; i < active_players.size; i++) {
        if (active_players[i] == self) {
            continue;
        }
        if (!isdefined(active_players[i]) || !isalive(active_players[i])) {
            continue;
        }
        if (!istrue(active_players[i].inlaststand)) {
            if (soundexists("uin_ping_confirm")) {
                active_players[i] playsound("uin_ping_confirm");
            }
        } else if (soundexists("uin_ping_wheel_announce_help")) {
            active_players[i] playsound("uin_ping_wheel_announce_help");
        }
        if (active_players.size > 1) {
            wait(0.2);
        }
    }
    if (active_players.size > 0) {
        wait(0.5);
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x208f
// Size: 0x143
function private function_dc7453c8550c512c() {
    self endon("death_or_disconnect");
    self endon("visibilityMode_stopads");
    if (self.var_44446bd6d8fd6ed0 == 0) {
        self.var_44446bd6d8fd6ed0 = 1;
    } else {
        return;
    }
    maxdist = self [[ level.var_d766faf69209bbd6.funcs["getADSWeaponDist"] ]]();
    maxdistsq = squared(maxdist);
    var_9103858b121b07ee = function_90ce2459298d263();
    var_9103858b121b07ee = sortbydistance(var_9103858b121b07ee, self.origin);
    var_72013161599ed91b = min(5, var_9103858b121b07ee.size);
    for (i = 0; i < var_72013161599ed91b; i++) {
        if (!function_8eee51af38988db6(self, var_9103858b121b07ee[i])) {
            continue;
        }
        if (!isdefined(var_9103858b121b07ee[i]) || !isalive(var_9103858b121b07ee[i])) {
            continue;
        }
        var_c92a4399b993144a = distancesquared(var_9103858b121b07ee[i].origin, self.origin);
        if (var_c92a4399b993144a < maxdistsq) {
            if (soundexists("uin_ping_enemy")) {
                var_9103858b121b07ee[i] playsound("uin_ping_enemy");
                delay = math::remap(var_c92a4399b993144a, 0, maxdistsq, 0.15, 0.6);
                wait(delay);
            }
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21d9
// Size: 0x1ae
function private function_49afc10334084167() {
    self endon("death_or_disconnect");
    self endon("visibilityMode_stopads");
    if (istrue(level.var_d766faf69209bbd6.var_a7628fab5ece8d7a)) {
        return;
    }
    flag_wait("objectives_registered");
    var_4267b02eda9e961 = [];
    for (i = 0; i < level.worldobjidpool.active.size; i++) {
        if (isdefined(level.worldobjidpool.active[i].identifier) && level.worldobjidpool.active[i].identifier == "nonobj_marker") {
            continue;
        }
        objstruct = spawnstruct();
        objstruct.var_6a7a0a172be2f436 = level.worldobjidpool.active[i];
        objstruct.origin = function_5651d05b13fcf64(level.worldobjidpool.active[i].objid, 0);
        var_4267b02eda9e961[var_4267b02eda9e961.size] = objstruct;
    }
    var_4267b02eda9e961 = sortbydistance(var_4267b02eda9e961, self.origin);
    for (i = 0; i < var_4267b02eda9e961.size; i++) {
        var_8137caff89efd99 = function_bd41d880db5c1bad(var_4267b02eda9e961[i].var_6a7a0a172be2f436.identifier);
        if (isdefined(var_8137caff89efd99)) {
            level thread function_95cd04544bc213e5(var_4267b02eda9e961[i].origin, self, var_8137caff89efd99);
        } else {
            level thread function_95cd04544bc213e5(var_4267b02eda9e961[i].origin, self);
        }
        if (var_4267b02eda9e961.size > 1) {
            wait(1);
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x238e
// Size: 0x70
function private function_95cd04544bc213e5(origin, player, var_aecb65519abb47c1) {
    tag_origin = spawn("script_model", origin);
    tag_origin setmodel("tag_origin");
    var_90e6bc3a37537c77 = "uin_ping_mission";
    if (isdefined(var_aecb65519abb47c1)) {
        var_90e6bc3a37537c77 = var_aecb65519abb47c1;
    }
    player playsound(var_90e6bc3a37537c77);
    wait(lookupsoundlength(var_90e6bc3a37537c77) / 1000);
    tag_origin delete();
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2405
// Size: 0x83
function private function_bd41d880db5c1bad(var_bc23a0a6125c16f4) {
    if (isdefined(level.var_d766faf69209bbd6.var_3a5f706a07632f07)) {
        foreach (index, sound in level.var_d766faf69209bbd6.var_3a5f706a07632f07) {
            if (index == var_bc23a0a6125c16f4) {
                return sound;
            }
        }
    }
    return undefined;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2490
// Size: 0x7f
function function_7068f93aacf2ef59(var_bc23a0a6125c16f4, soundalias) {
    if (!isdefined(level.var_d766faf69209bbd6)) {
        return;
    }
    if (!isdefined(level.var_d766faf69209bbd6.var_3a5f706a07632f07)) {
        level.var_d766faf69209bbd6.var_3a5f706a07632f07 = [];
    }
    if (isdefined(level.var_d766faf69209bbd6.var_3a5f706a07632f07[var_bc23a0a6125c16f4])) {
        return;
    }
    level.var_d766faf69209bbd6.var_3a5f706a07632f07[var_bc23a0a6125c16f4] = soundalias;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2516
// Size: 0xdc
function function_8eee51af38988db6(player, target) {
    if (!within_fov(player.origin, player.angles, target.origin, 0.766)) {
        return 0;
    }
    playereye = player geteye();
    var_8588ce8cb050baf3 = target.origin;
    if (sighttracepassed(playereye, var_8588ce8cb050baf3, 1, player, target)) {
        return 1;
    }
    eyeorigin = undefined;
    if (isagent(target)) {
        eyeorigin = target getapproxeyepos();
    } else {
        eyeorigin = target geteye();
    }
    if (sighttracepassed(playereye, eyeorigin, 1, player, target)) {
        return 1;
    }
    var_59a0ba7c30f92d0b = (eyeorigin + var_8588ce8cb050baf3) * 0.5;
    if (sighttracepassed(playereye, var_59a0ba7c30f92d0b, 1, player, target)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25fa
// Size: 0x1d
function function_5f46cf1503a0541a() {
    if (isdefined(self.visibilitymodeval)) {
        return (self.visibilitymodeval > 0);
    }
    return 0;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261f
// Size: 0x4e
function function_ea4e39208c784a4a() {
    color = "outline_depth_red";
    if (isdefined(self.var_be1e6d7ff9628b76) && isdefined(self.var_be1e6d7ff9628b76.var_29100ed6a90836be)) {
        color = self.var_be1e6d7ff9628b76.var_29100ed6a90836be;
    }
    return color;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2675
// Size: 0x4e
function function_4448756918b98e87() {
    color = "outline_depth_cyan";
    if (isdefined(self.var_be1e6d7ff9628b76) && isdefined(self.var_be1e6d7ff9628b76.var_7205d3d5d54d0b33)) {
        color = self.var_be1e6d7ff9628b76.var_7205d3d5d54d0b33;
    }
    return color;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26cb
// Size: 0x4e
function function_63a1833b6a352cd7() {
    color = "outline_highvis_green";
    if (isdefined(self.var_be1e6d7ff9628b76) && isdefined(self.var_be1e6d7ff9628b76.var_4d49c11adf0f1d63)) {
        color = self.var_be1e6d7ff9628b76.var_4d49c11adf0f1d63;
    }
    return color;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2721
// Size: 0x4e
function function_266da5d877397673() {
    mode = "normal";
    if (isdefined(self.var_be1e6d7ff9628b76) && isdefined(self.var_be1e6d7ff9628b76.var_93549f28b5b2d802)) {
        mode = self.var_be1e6d7ff9628b76.var_93549f28b5b2d802;
    }
    return mode;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2777
// Size: 0x4a
function function_787341d4cc18bba() {
    var_9275b71d42944e57 = 0;
    if (isdefined(self.var_be1e6d7ff9628b76) && isdefined(self.var_be1e6d7ff9628b76.var_9275b71d42944e57)) {
        var_9275b71d42944e57 = self.var_be1e6d7ff9628b76.var_9275b71d42944e57;
    }
    return var_9275b71d42944e57;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c9
// Size: 0x8d
function function_88ec96d66632c2b9() {
    var_c68737226b9498a = [[ level.var_d766faf69209bbd6.funcs["getTargetArray"] ]](self);
    var_86be86845d4493c7 = [];
    playernum = self getentitynumber();
    for (i = 0; i < var_c68737226b9498a.size; i++) {
        if (isdefined(var_c68737226b9498a[i].var_79a7c8a11ed7c0e3)) {
            if (isdefined(var_c68737226b9498a[i].var_79a7c8a11ed7c0e3[playernum])) {
                var_86be86845d4493c7[var_86be86845d4493c7.size] = var_c68737226b9498a[i];
            }
        }
    }
    return var_86be86845d4493c7;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x285e
// Size: 0x4f
function function_90ce2459298d263() {
    all_targets = function_88ec96d66632c2b9();
    var_a85b3bf58543dc2 = [];
    for (i = 0; i < all_targets.size; i++) {
        if (function_afe539c207a6b2fb(all_targets[i], self)) {
            var_a85b3bf58543dc2[var_a85b3bf58543dc2.size] = all_targets[i];
        }
    }
    return var_a85b3bf58543dc2;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b5
// Size: 0x4f
function function_e3c04f03881b4dc7() {
    all_targets = function_88ec96d66632c2b9();
    var_a85b3bf58543dc2 = [];
    for (i = 0; i < all_targets.size; i++) {
        if (!function_afe539c207a6b2fb(all_targets[i], self)) {
            var_a85b3bf58543dc2[var_a85b3bf58543dc2.size] = all_targets[i];
        }
    }
    return var_a85b3bf58543dc2;
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290c
// Size: 0x88
function function_c1d9fd48eb09c8c9() {
    if (isdefined(level.players)) {
        activeplayers = [];
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i] function_5f46cf1503a0541a()) {
                activeplayers[activeplayers.size] = level.players[i];
            }
        }
        return activeplayers;
    } else if (isdefined(level.player)) {
        return level.player function_5f46cf1503a0541a();
    } else {
        return [];
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299b
// Size: 0x134
function function_924634e910fbfc75() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("visibiltyMode_disabled");
    while (1) {
        var_5f622d6d58521bea = var_495f693cc568c9a7 = teamname = level waittill("visibilityTeamName");
        foreach (soldier in var_495f693cc568c9a7) {
            if (!function_753e2e2a70ae2d65(soldier)) {
                continue;
            }
            soldier.team = teamname;
            if (istrue(var_5f622d6d58521bea)) {
                soldier.agentname = undefined;
            }
            if (!isdefined(soldier.lastteam)) {
                soldier.lastteam = "";
            }
            if (teamname != soldier.lastteam) {
                soldier function_85e0f20ba385bf6d(self);
                soldier.lastteam = teamname;
                if (isdefined(soldier.headmodel) && isent(soldier.headmodel)) {
                    function_8ba05ef17e2b7d10(soldier.headmodel, teamname);
                }
            }
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad6
// Size: 0xa7
function function_8ba05ef17e2b7d10(entity, team) {
    if (!isdefined(level.var_d766faf69209bbd6.var_c3f9401112fb5d27)) {
        level.var_d766faf69209bbd6.var_c3f9401112fb5d27 = [];
    }
    entity.var_d4ca148f5670a1f6 = 1;
    ent_number = entity getentitynumber();
    if (!is_equal(entity.team, team)) {
        entity.team = team;
        level.var_d766faf69209bbd6.var_c3f9401112fb5d27[ent_number] = entity;
        level notify("visibilityTeamName", team);
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b84
// Size: 0x73
function function_b6e23e71bb7ad50f(entity) {
    if (isdefined(entity)) {
        ent_number = entity getentitynumber();
        if (isdefined(level.var_d766faf69209bbd6.var_c3f9401112fb5d27) && isdefined(level.var_d766faf69209bbd6.var_c3f9401112fb5d27[ent_number])) {
            entity.var_d4ca148f5670a1f6 = undefined;
            level.var_d766faf69209bbd6.var_c3f9401112fb5d27[ent_number] = undefined;
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bfe
// Size: 0xef
function function_d5f76e611c78509a() {
    entity = self;
    model = entity.model;
    headmodel = entity.headmodel;
    if (istrue(entity.var_d4ca148f5670a1f6)) {
        return;
    }
    if (isplayer(entity) || isai(entity) || issentient(entity)) {
        return;
    }
    if (self tagexists("TAG_EYE") || self tagexists("j_head")) {
        if (model == "military_carepackage_01_loadout_mp") {
            function_8ba05ef17e2b7d10(entity, entity.team);
        } else if (issubstr(model, "enemy") || issubstr(model, "axis") || issubstr(model, "villain")) {
            function_8ba05ef17e2b7d10(entity, "axis");
        } else {
            function_8ba05ef17e2b7d10(entity, "allies");
        }
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2cf4
// Size: 0x70
function private function_8977a3724ec5ce9e() {
    level endon("game_ended");
    dvar = @"hash_5ecd08979278a317";
    while (1) {
        while (1) {
            var_4f9df27618277b1e = getdvar(dvar, "");
            if (var_4f9df27618277b1e != "") {
                level thread function_bf79c9a4bc54b7da(var_4f9df27618277b1e);
                setdvar(dvar, "");
            }
            wait(0.1);
        }
        wait(0.1);
    }
}

// Namespace namespace_86bd2c6e12e86a39/namespace_c5f7e08ad7ea4280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d6b
// Size: 0x27
function private function_bf79c9a4bc54b7da(val) {
    val = int(val);
    level.players[0] function_8c2e8285c9915b12(val);
}

