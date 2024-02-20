// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6df6604a74a7a9c7;
#using script_3b64eb40368c1450;
#using script_5d8202968463a21d;
#using script_4c770a9a4ad7659c;
#using script_3455e18e022b7abc;
#using script_71eca06c29041e9e;
#using script_2583ee5680cf4736;
#using script_639bf783929acf9b;

#namespace namespace_740a076c3d0a164d;

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x6
function function_7c6822271ce8a12() {
    /#
    #/
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a2
// Size: 0x10b
function init(manager) {
    self.manager = manager;
    self.var_e75861b9d1038ada = "";
    self.var_e9a3362a072a0053 = [];
    self.var_232a9bd68a2afb2d = [];
    self.active = 0;
    self.linked = 0;
    self.var_29c40fbd5803a5e8 = 0;
    self.var_6612ebb7de7a2933 = 0;
    self.var_506cb5149156445 = spawnscriptable("ob_combo_lock_door", self.origin - (0, 0, -52), self.angles);
    self.var_b6635982dbb1c0bf = self.var_506cb5149156445.origin + anglestoup(self.var_506cb5149156445.angles) * 30;
    var_8cc6eaf2ed86969a = getstruct(self.target, "targetname");
    var_8cc6eaf2ed86969a namespace_26e60c953dc40f2c::init(self);
    self.var_e9a3362a072a0053 = array_randomize(self.var_e9a3362a072a0053);
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4
// Size: 0x25
function function_2cade2c182251141(digit) {
    self.var_e9a3362a072a0053 = array_add(self.var_e9a3362a072a0053, digit);
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e0
// Size: 0x1ec
function function_3edb9b978dca8642(scriptable, value) {
    self.var_e75861b9d1038ada = self.var_e75861b9d1038ada + value;
    result = self.manager namespace_a07f20e9740e52::function_cb7a8125ea9acdce(self.var_e75861b9d1038ada);
    switch (result) {
    case #"hash_f43afb7b1b11f010":
        self.var_e75861b9d1038ada = "";
        self.var_232a9bd68a2afb2d = array_add(self.var_232a9bd68a2afb2d, scriptable.var_600daf0fc22de176);
        function_250b0660476f5dca(0);
        self.var_232a9bd68a2afb2d = [];
        self.var_506cb5149156445 setscriptablepartstate("sfx", "unlinked");
        break;
    case #"hash_4fca7d9b3c60a9b0":
        function_250b0660476f5dca(1, self.manager namespace_a07f20e9740e52::function_198a38d3011ec3bc(self.var_e75861b9d1038ada));
        self.var_232a9bd68a2afb2d = array_add(self.var_232a9bd68a2afb2d, scriptable.var_600daf0fc22de176);
        scriptable setscriptablepartstate("vfx", scriptable getscriptablepartstate("model", 0));
        scriptable setscriptablepartstate("model", "inactive");
        self.var_506cb5149156445 setscriptablepartstate("sfx", string(self.var_e75861b9d1038ada.size));
        self.var_e75861b9d1038ada = "";
        break;
    case #"hash_e2450218207b1651":
        self.var_232a9bd68a2afb2d = array_add(self.var_232a9bd68a2afb2d, scriptable.var_600daf0fc22de176);
        scriptable setscriptablepartstate("vfx", scriptable getscriptablepartstate("model", 0));
        scriptable setscriptablepartstate("model", "inactive");
        self.var_506cb5149156445 setscriptablepartstate("sfx", string(self.var_e75861b9d1038ada.size));
        break;
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d3
// Size: 0x11a
function function_a69dbc79d8e0c7c(var_d6bfa53c531546d6) {
    var_209f14c7cfd47bd7 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    zone_name = var_d6bfa53c531546d6.zonename;
    if (!var_209f14c7cfd47bd7) {
        return;
    }
    self.players_in_range = var_d6bfa53c531546d6.var_9f2dab34edc7e257;
    if (!self.active) {
        self notify("ZIP_TRANSITION_SINGLETON");
        self endon("ZIP_TRANSITION_SINGLETON");
        /#
            iprintln("interactions");
        #/
        self.active = 1;
        self.var_506cb5149156445 setscriptablepartstate("door", "spawned");
        for (idx = 0; idx < self.var_e9a3362a072a0053.size; idx++) {
            if (istrue(self.var_e9a3362a072a0053[idx].spawned)) {
                continue;
            }
            self.var_e9a3362a072a0053[idx] namespace_26e60c953dc40f2c::function_e8fc44296f4c9482(1, idx);
            wait(0.15);
        }
    } else if (self.var_29c40fbd5803a5e8 || self.var_6612ebb7de7a2933) {
        self notify("ZIP_TRANSITION_SINGLETON");
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f4
// Size: 0x75
function function_4dc883726bbcee81(var_d6bfa53c531546d6) {
    var_209f14c7cfd47bd7 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    zone_name = var_d6bfa53c531546d6.zonename;
    if (var_209f14c7cfd47bd7) {
        return;
    }
    if (self.active && var_d6bfa53c531546d6.var_9f2dab34edc7e257.size == 0) {
        /#
            iprintln("left");
        #/
        thread function_b62de3e2fa216219();
    } else {
        return;
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x870
// Size: 0xc1
function private function_b62de3e2fa216219() {
    self notify("ZIP_TRANSITION_SINGLETON");
    self endon("ZIP_TRANSITION_SINGLETON");
    while (self.var_29c40fbd5803a5e8 || self.linked) {
        waitframe();
    }
    if (self.var_232a9bd68a2afb2d.size > 0) {
        self.var_6612ebb7de7a2933 = 1;
        wait(60);
        self.var_6612ebb7de7a2933 = 0;
    }
    self.active = 0;
    self.var_506cb5149156445 setscriptablepartstate("door", "disappear");
    for (idx = 0; idx < self.var_e9a3362a072a0053.size; idx++) {
        self.var_e9a3362a072a0053[idx] namespace_26e60c953dc40f2c::function_e8fc44296f4c9482(0);
        wait(0.1);
    }
    self.var_e75861b9d1038ada = "";
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x938
// Size: 0xa4
function private function_250b0660476f5dca(var_fa6377eb24ac48ef, destination) {
    foreach (dig in self.var_232a9bd68a2afb2d) {
        dig namespace_26e60c953dc40f2c::function_f4e1863c3c57bcb(var_fa6377eb24ac48ef);
    }
    if (istrue(var_fa6377eb24ac48ef)) {
        self.linked = 1;
        thread function_f4ce626fde09f7e2(destination);
    } else {
        self.var_232a9bd68a2afb2d = [];
        self.linked = 0;
        self.var_29c40fbd5803a5e8 = 0;
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e3
// Size: 0xc5
function private function_f4ce626fde09f7e2(destination) {
    if (getdvar(@"hash_7130c1f3ad21f0ad", "0") != "1") {
        thread function_afc90ff2c54fd85c(destination.origin);
    }
    function_c0e0e7ff7351a670(1);
    self.var_506cb5149156445 setscriptablepartstate("door", "purchase");
    self.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_b6635982dbb1c0bf, 128, &function_3684a2eb8cb2f9d7, "SHARED_HINTSTRINGS/ZIP_DOOR_USE");
    self.interact sethintstringparams(1000);
    self.interact.door = self;
    self.interact.destination = destination;
    thread function_9efa238094778a76();
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaaf
// Size: 0x62
function private function_c0e0e7ff7351a670(var_dd4005eb0f452104) {
    foreach (dig in self.var_e9a3362a072a0053) {
        dig namespace_26e60c953dc40f2c::function_68950e640608ce20(var_dd4005eb0f452104);
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb18
// Size: 0xc7
function private function_4e26281a62cb2825(destination) {
    self.var_506cb5149156445 setscriptablepartstate("door", "opened");
    self.var_29c40fbd5803a5e8 = 1;
    self.current_trigger = function_f0a3a8ccf8f52412(self, (0, 0, 10), (20, 20, 20));
    thread function_43233144917da206();
    while (isdefined(self.current_trigger)) {
        data = self.current_trigger waittill("trigger");
        if (isplayer(data) && !istrue(data.teleporting)) {
            data.teleporting = 1;
            data thread function_dc8998400a3eb807(destination, self.var_506cb5149156445);
        }
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe6
// Size: 0x1d4
function private function_dc8998400a3eb807(destination, var_506cb5149156445) {
    playfxontagforclients(level._effect["vfx_player_screen_distortion"], self, "j_head", self);
    val::set("fasttravel", "allow_movement", 0);
    val::set("fasttravel_ignoreme", "ignoreme", 1);
    val::set("fasttravel", "weapon", 0);
    val::set("fasttravel", "freezecontrols", 1);
    val::set("fasttravel_hud", "show_hud", 0);
    val::set("fasttravel", "interactions", 0);
    val::set("fasttravel", "vehicle_use", 0);
    playfxontag(level._effect["vfx_zip_player_teleport"], self, "tag_origin");
    playfxontag(level._effect["vfx_zip_portal_teleport"], self, "tag_origin");
    wait(0.5);
    self function_c664a2459d6f3eaa("sndevent_zipdoor_teleport_out_2d");
    wait(0.5);
    thread function_4dfb8a88030327b();
    var_506cb5149156445 setscriptablepartstate("sfx", "teleport_out_3p");
    wait(0.25);
    self setorigin(destination.origin);
    self setplayerangles(destination.angles);
    val::function_c9d0b43701bdba00("fasttravel");
    playfxontagforclients(level._effect["vfx_player_screen_distortion_end"], self, "j_head", self);
    waitframe();
    self function_c664a2459d6f3eaa("sndevent_zipdoor_teleport_in");
    playfxontag(level._effect["vfx_zip_player_arrive"], self, "tag_origin");
    level callback::callback("zip_teleport_player", destination);
    wait(1);
    val::function_c9d0b43701bdba00("fasttravel_ignoreme");
    self.teleporting = undefined;
    stopfxontagforclients(level._effect["vfx_player_screen_distortion"], self, "j_head", self);
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdc1
// Size: 0x1e7
function private function_4dfb8a88030327b() {
    self notify("play_nuke_screen_flash");
    self endon("death_or_disconnect");
    self endon("play_nuke_screen_flash");
    if (!isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 = newclienthudelem(self);
        self.var_ad173ac833a970d4.x = 0;
        self.var_ad173ac833a970d4.y = 0;
        self.var_ad173ac833a970d4 setshader("white", 640, 480);
        self.var_ad173ac833a970d4.alignx = "left";
        self.var_ad173ac833a970d4.aligny = "top";
        self.var_ad173ac833a970d4.sort = 1;
        self.var_ad173ac833a970d4.horzalign = "fullscreen";
        self.var_ad173ac833a970d4.vertalign = "fullscreen";
        self.var_ad173ac833a970d4.alpha = 0;
        self.var_ad173ac833a970d4.foreground = 1;
        self.var_ad173ac833a970d4.archived = 0;
        self.var_ad173ac833a970d4.var_79a4133f925e83f8 = 1;
    }
    var_52bee65a8171b558 = 0.15;
    n_target_alpha = 1;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = n_target_alpha;
    wait(0.7);
    var_52bee65a8171b558 = 0.7;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = 0;
    wait(var_52bee65a8171b558);
    val::function_c9d0b43701bdba00("fasttravel_hud");
    if (isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 destroy();
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfaf
// Size: 0x47
function private function_43233144917da206() {
    wait(57);
    wait(3);
    self.current_trigger delete();
    self.var_506cb5149156445 setscriptablepartstate("door", "closed");
    wait(2);
    function_c0e0e7ff7351a670(0);
    function_250b0660476f5dca(0);
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xffd
// Size: 0x45
function private function_9efa238094778a76() {
    self endon("ZIP_DOOR_LINKED");
    wait(20);
    self.var_506cb5149156445 setscriptablepartstate("door", "linkfail");
    self.interact delete();
    function_c0e0e7ff7351a670(0);
    function_250b0660476f5dca(0);
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1049
// Size: 0x180
function private function_afc90ff2c54fd85c(location) {
    self.var_caa0834845100f69 = [];
    while (self.linked) {
        foreach (player in self.players_in_range) {
            if (!array_contains(self.var_caa0834845100f69, player)) {
                self.var_caa0834845100f69 = array_add(self.var_caa0834845100f69, player);
                player function_bc667001f9dd3808(location);
            }
        }
        var_8e5822fd681823ce = self.var_caa0834845100f69;
        foreach (player in self.var_caa0834845100f69) {
            if (!array_contains(self.players_in_range, player)) {
                var_8e5822fd681823ce = array_remove(var_8e5822fd681823ce, player);
                player clearpredictedstreampos();
            }
        }
        self.var_caa0834845100f69 = var_8e5822fd681823ce;
        waitframe();
    }
    foreach (player in self.var_caa0834845100f69) {
        player clearpredictedstreampos();
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11d0
// Size: 0x61
function private function_3684a2eb8cb2f9d7(player) {
    if (isdefined(player)) {
        if (!player namespace_7dfc6454a70f3f39::function_301addb53c1df990("essence", 1000, 1, 0, #"zip_door")) {
            return;
        }
        self.door notify("ZIP_DOOR_LINKED");
        self.door thread function_4e26281a62cb2825(self.destination);
        self delete();
    }
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1238
// Size: 0xc2
function private function_f0a3a8ccf8f52412(trigger_struct, offset, size) {
    /#
        assertex(isdefined(trigger_struct), "No Trigger Struct to spawn trigger volume!");
    #/
    offset = function_53c4c53197386572(offset, (0, 0, 0));
    size = function_53c4c53197386572(size, (100, 100, 100)) / 2;
    trigger_box = spawn("trigger_box", trigger_struct.origin + offset, 0, size, size + (1, 1, 1));
    if (isdefined(trigger_struct.angles)) {
        trigger_box.angles = trigger_struct.angles;
    }
    /#
        thread function_ca53007eead9ab91(trigger_box, size);
    #/
    return trigger_box;
}

// Namespace namespace_740a076c3d0a164d/namespace_b1453e6e8267c3ce
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1302
// Size: 0x62
function private function_ca53007eead9ab91(trigger_box, size) {
    while (isdefined(trigger_box)) {
        if (getdvarint(@"hash_99616e34386263aa", 0)) {
            /#
                orientedbox(trigger_box.origin, size * 2, trigger_box.angles, (0, 0, 1), 0, 1);
            #/
        }
        waitframe();
    }
}

