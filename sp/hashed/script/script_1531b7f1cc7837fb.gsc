#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\common\values.gsc;
#using script_309fdce416988e98;

#namespace namespace_3bc714f850dbe85e;

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0x10
function init() {
    level.var_971169afd6488423 = &function_58e4fce14e5f5f87;
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x184
// Size: 0x67
function private function_5cc158a4fe40668e() {
    var_5dc414c9a5344405 = getentarray("social_restricted", "targetname");
    foreach (trigger in var_5dc414c9a5344405) {
        childthread function_c14aa1dfa47335b6(trigger, var_5dc414c9a5344405);
    }
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1f3
// Size: 0x106
function private function_c14aa1dfa47335b6(trigger, var_5dc414c9a5344405) {
    player = self;
    trigger endon("death");
    while (true) {
        trigger waittill("trigger", var_246a92d332bb09f);
        if (var_246a92d332bb09f != player) {
            continue;
        }
        player thread namespace_5d422cd60f12e32e::function_2d2bf9bf75ae791e("restricted_area");
        player val::set("playerSocialTrespass", "stealth_social_reveal", 1);
        player notify("playerSocialTrespass", trigger);
        touching = 1;
        while (touching) {
            waitframe();
            touching = 0;
            foreach (trig in var_5dc414c9a5344405) {
                if (!isdefined(trig)) {
                    continue;
                }
                if (player istouching(trig)) {
                    touching = 1;
                    break;
                }
            }
        }
        player thread namespace_5d422cd60f12e32e::function_376aee39c931c5ff("restricted_area");
        player val::reset_all("playerSocialTrespass");
    }
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x301
// Size: 0xa5
function function_58e4fce14e5f5f87(enabled, var_29c27e623f6aa366, var_ce9e9cf314621bf1, var_d8f27b0d11d1236) {
    assert(isplayer(self));
    if (istrue(enabled)) {
        var_29c27e623f6aa366 = default_to(var_29c27e623f6aa366, "player");
        var_ce9e9cf314621bf1 = default_to(var_ce9e9cf314621bf1, "stealth_ignore");
        var_d8f27b0d11d1236 = default_to(var_d8f27b0d11d1236, "axis");
        createthreatbiasgroup(var_29c27e623f6aa366);
        createthreatbiasgroup(var_ce9e9cf314621bf1);
        createthreatbiasgroup(var_d8f27b0d11d1236);
        setignoremegroup(var_ce9e9cf314621bf1, var_d8f27b0d11d1236);
        self.var_5e76bb517d70f1ad = var_29c27e623f6aa366;
        self.var_ec9d26e6264e225c = var_ce9e9cf314621bf1;
        thread function_385496cb9cd5a920();
        return;
    }
    thread function_b66ba4277fbedcec();
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae
// Size: 0x33
function function_385496cb9cd5a920() {
    assert(isplayer(self));
    if (!ent_flag_exist("stealth_social_reveal")) {
        ent_flag_init("stealth_social_reveal");
    }
    thread playerSocialThread();
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0x62
function function_b66ba4277fbedcec() {
    assert(isplayer(self));
    self notify("playerSocialThread");
    val::reset_all("playerSocialMonitorThread");
    val::reset_all("playerSocialTrespass");
    if (isdefined(self.var_5e76bb517d70f1ad)) {
        self setthreatbiasgroup(self.var_5e76bb517d70f1ad);
    }
    self.var_5e76bb517d70f1ad = undefined;
    self.var_ec9d26e6264e225c = undefined;
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x453
// Size: 0xda
function private playerSocialThread() {
    assert(isplayer(self));
    self endon("death_or_disconnect");
    self notify("playerSocialThread");
    self endon("playerSocialThread");
    childthread playerSocialMonitorThread();
    childthread function_5cc158a4fe40668e();
    while (true) {
        if (!ent_flag("stealth_social_reveal")) {
            self setthreatbiasgroup(self.var_ec9d26e6264e225c);
        }
        ent_flag_wait("stealth_social_reveal");
        severity = val::get("stealth_social_reveal");
        var_b4a820a7f0c35792 = 1;
        if (severity >= 2) {
            var_b4a820a7f0c35792 = 0;
        }
        self setthreatbiasgroup(self.var_5e76bb517d70f1ad);
        ent_flag_waitopen("stealth_social_reveal");
        while (function_910a912f327b8d34(self) > var_b4a820a7f0c35792 || level flag("stealth_spotted")) {
            wait 1;
        }
    }
}

// Namespace namespace_3bc714f850dbe85e / namespace_35d4e4c5d417d54f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x535
// Size: 0x95
function private playerSocialMonitorThread() {
    assert(isplayer(self));
    while (true) {
        revealed = 0;
        weapon = self getcurrentweapon();
        if (default_to(weapon.classname, "item") != "item" && weapon.classname != "none") {
            revealed = 1;
        }
        if (revealed) {
            val::set("playerSocialMonitorThread", "stealth_social_reveal", 1);
        } else {
            val::reset_all("playerSocialMonitorThread");
        }
        waitframe();
    }
}

