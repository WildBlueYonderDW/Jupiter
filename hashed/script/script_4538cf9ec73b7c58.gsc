// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7534b1d3ac3ea47a;

#namespace namespace_7ee9a03c8b80c102;

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61e
// Size: 0xbe
function function_5f1c9b52db389ec4(var_5f2112921f67c9ce, max_health) {
    computer = spawn("script_model", var_5f2112921f67c9ce.origin);
    computer.scriptable = spawnscriptable("jup_zm_merc_defend_computer_scriptable", var_5f2112921f67c9ce.origin + (0, 0, 62));
    computer function_c65b61b6c47fc0ac("jup_zm_merc_defend_computer_combined");
    computer.maxhealth = max_health + 1000000;
    computer.health = max_health + 1000000;
    computer.angles = var_5f2112921f67c9ce.angles;
    computer thread function_d40e4373c3f471cd();
    load_vfx();
    return computer;
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e4
// Size: 0xe9
function function_2373624b48cd1404(player) {
    self.computer makeentitysentient("allies");
    self.computer setcandamage(1);
    createthreatbiasgroup("computer");
    self.computer setthreatbiasgroup("computer");
    setignoremegroup("computer", "team_two_hundred");
    setignoremegroup("computer", "allies");
    setignoremegroup("computer", "team_players");
    createthreatbiasgroup("defenders");
    setignoremegroup("computer", "defenders");
    killfxontag(getfx("merc_defend_idle"), self.computer, "tag_origin");
    playfxontag(getfx("merc_defend_active"), self.computer, "tag_origin");
    self.computer notify("begin_transmission");
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d4
// Size: 0xf0
function function_e32c618c7255ea99() {
    killfxontag(getfx("merc_defend_idle"), self, "tag_origin");
    killfxontag(getfx("merc_defend_active"), self, "tag_origin");
    killfxontag(getfx("merc_defend_active_damage"), self, "tag_origin");
    killfxontag(getfx("merc_defend_damage_25"), self, "tag_origin");
    killfxontag(getfx("merc_defend_damage_50"), self, "tag_origin");
    killfxontag(getfx("merc_defend_damage_75"), self, "tag_origin");
    killfxontag(getfx("merc_defend_explode"), self, "tag_origin");
    killfxontag(getfx("merc_defend_damage_destroyed"), self, "tag_origin");
    if (isdefined(self.scriptable)) {
        self.scriptable freescriptable();
        self.scriptable = undefined;
    }
    self notify("deleted");
    self delete();
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cb
// Size: 0x1d
function function_38df7cd1dc2f5bc9(computer) {
    return computer.health - 1000000;
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f0
// Size: 0x2f
function function_1b71094fb5bf7c52(computer) {
    return (computer.health - 1000000) / (computer.maxhealth - 1000000);
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x927
// Size: 0x30
function function_d40e4373c3f471cd() {
    self endon("deleted");
    self endon("death");
    self endon("objective_success");
    childthread function_f87a5315febf0348();
    childthread damage_watcher();
    childthread function_fb2d80cc508cccc4();
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95e
// Size: 0x180
function private function_fb2d80cc508cccc4() {
    players = self waittill("activate_interact");
    playfxontag(getfx("merc_defend_idle"), self, "tag_origin");
    if (isdefined(self.scriptable)) {
        self.scriptable setscriptablepartstate("audio", "on_inactive");
    }
    self.var_1727a556677b01c3 = namespace_29b5250e9959ea::function_a7ed9b756a764621("jup_hacking_device_ob", self.origin + (0, 0, 64), "ob_defend_computer_anim_interact", &function_2373624b48cd1404, undefined, undefined);
    self.var_1727a556677b01c3.computer = self;
    foreach (player in level.players) {
        self.var_1727a556677b01c3 disablescriptableplayeruse(player);
    }
    foreach (var_835454e02a99b339 in players) {
        self.var_1727a556677b01c3 enablescriptableplayeruse(var_835454e02a99b339);
    }
    self waittill("begin_transmission");
    if (isdefined(self.scriptable)) {
        self.scriptable setscriptablepartstate("audio", "on_active");
    }
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae5
// Size: 0x192
function private damage_watcher() {
    var_b908dc65de258838 = self.maxhealth - 1000000;
    childthread function_bcece8d1bbafb65b();
    while (1) {
        objweapon = idflags = partname = tagname = modelname = damage_type = point = direction = attacker = amount = self waittill("damage");
        if (array_contains(level.players, attacker) || attacker.classname == "script_vehicle") {
            self.health = self.health + amount;
            continue;
        }
        var_d223f098d6d86030 = function_9e4fe40b486284c8(var_b908dc65de258838, objweapon);
        if (amount > var_d223f098d6d86030) {
            var_fbd60cbc6be94f3f = amount - var_d223f098d6d86030;
            self.health = self.health + int(var_fbd60cbc6be94f3f);
        }
        if (self.health - 1000000 <= 0 && self.var_dff8e9c4d0311380 != "jup_zm_merc_defend_computer_destroyed_combined") {
            self.health = self.health - 1000000;
            thread function_fbfb3bfa5318ab1();
            function_c65b61b6c47fc0ac("jup_zm_merc_defend_computer_destroyed_combined");
            self notify("damage_modify");
            self notify("death");
        }
        self notify("damage_modify");
    }
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7e
// Size: 0x96
function function_9e4fe40b486284c8(totalhealth, objweapon) {
    filter = 0.01;
    if (!isdefined(objweapon) || !isdefined(objweapon.classname)) {
        return (totalhealth * filter);
    }
    switch (objweapon.classname) {
    case #"hash_690c0d6a821b42e":
        filter = 0.03;
        break;
    case #"hash_61e969dacaaf9881":
        filter = 0.1;
        break;
    case #"hash_e224d0b635d0dadd":
        filter = 0.1;
        break;
    }
    return totalhealth * filter;
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c
// Size: 0xae
function function_fbfb3bfa5318ab1() {
    playfxontag(getfx("merc_defend_explode"), self, "tag_origin");
    playfxontag(getfx("merc_defend_damage_destroyed"), self, "tag_origin");
    stopfxontag(getfx("merc_defend_damage_75"), self, "tag_origin");
    self playsound("c4_expl_swt");
    if (isdefined(self.scriptable)) {
        self.scriptable freescriptable();
        self.scriptable = undefined;
    }
    wait(1);
    killfxontag(getfx("merc_defend_active"), self, "tag_origin");
    killfxontag(getfx("merc_defend_active_damage"), self, "tag_origin");
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd1
// Size: 0x7d
function private function_bcece8d1bbafb65b() {
    self endon("death");
    while (1) {
        self waittill("damage_modify");
        killfxontag(getfx("merc_defend_active"), self, "tag_origin");
        playfxontag(getfx("merc_defend_active_damage"), self, "tag_origin");
        wait(3);
        killfxontag(getfx("merc_defend_active_damage"), self, "tag_origin");
        playfxontag(getfx("merc_defend_active"), self, "tag_origin");
        waitframe();
    }
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe55
// Size: 0xfd
function private function_f87a5315febf0348() {
    current_state = 0;
    while (1) {
        var_7bf2efc0fde1d084 = function_1b71094fb5bf7c52(self);
        switch (current_state) {
        case 0:
            if (var_7bf2efc0fde1d084 < 0.75) {
                playfxontag(getfx("merc_defend_damage_25"), self, "tag_origin");
                current_state = 1;
            }
            break;
        case 1:
            if (var_7bf2efc0fde1d084 < 0.5) {
                current_state = 2;
                playfxontag(getfx("merc_defend_damage_50"), self, "tag_origin");
                stopfxontag(getfx("merc_defend_damage_25"), self, "tag_origin");
            }
            break;
        case 2:
            if (var_7bf2efc0fde1d084 < 0.25) {
                current_state = 3;
                playfxontag(getfx("merc_defend_damage_75"), self, "tag_origin");
                stopfxontag(getfx("merc_defend_damage_50"), self, "tag_origin");
            }
            break;
        }
        waitframe();
    }
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf59
// Size: 0x1e
function private function_c65b61b6c47fc0ac(newmodel) {
    self.var_dff8e9c4d0311380 = newmodel;
    self setmodel(newmodel);
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf7e
// Size: 0x155
function private load_vfx() {
    level._effect["merc_defend_explode"] = loadfx("vfx/iw9/killstreaks/bombdrone/vfx_bomb_drone_exp.vfx");
    level._effect["merc_defend_idle"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_idle.vfx");
    level._effect["merc_defend_active"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_active.vfx");
    level._effect["merc_defend_active_damage"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_active_damage.vfx");
    level._effect["merc_defend_damage_25"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_25.vfx");
    level._effect["merc_defend_damage_50"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_50.vfx");
    level._effect["merc_defend_damage_75"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_75.vfx");
    level._effect["merc_defend_damage_destroyed"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_destroyed.vfx");
    level._effect["merc_defend_lights_red"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_lights_blinking_red.vfx");
    level._effect["merc_defend_lights_green"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_lights_blinking_green.vfx");
    level._effect["merc_defend_loadbar"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_loadbar.vfx");
    level._effect["merc_defend_cig_tray"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_cigarette_tray_smoke.vfx");
    level._effect["merc_defend_sparks_sml"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_sparks_dir_sml.vfx");
}

// Namespace namespace_7ee9a03c8b80c102/namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10da
// Size: 0xa
function private function_ebc62d30ce909ad2() {
    self freeentitysentient();
}

