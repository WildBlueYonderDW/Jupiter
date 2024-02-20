// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_427ce33ec0c820cf;
#using script_72ef6b9f0cf1f55a;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace powerups;

// Namespace powerups/namespace_2520ec51681db245
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd
// Size: 0xb4
function init(var_cc680f1d779ccc51, var_40708f9ae5a8070e, var_42ae0bca056bb628) {
    init_powerups(&function_1bc17f51290823ab);
    root = function_ecdae672c660149e();
    root.var_cc680f1d779ccc51 = var_cc680f1d779ccc51;
    root.var_40708f9ae5a8070e = var_40708f9ae5a8070e;
    root.var_b0d3396c2b9e78d4 = &function_cad183d7f2f4f301;
    root.var_5a4c4a84060b59da = &function_5bfe254c7e9aa4db;
    root.var_5cdeaceda00983a3 = &function_f91870701cdc3aaa;
    utility::registersharedfunc("powerups", "showPowerupHud", &function_676437737684783f);
    init_fx();
    if (!istrue(var_42ae0bca056bb628)) {
        namespace_55af56d47545b2f7::function_8ca4b49ee68720bf("on_zombie_ai_killed");
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x51
function private init_fx() {
    level._effect["powerup_intro"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_powerup_spawn_in_green.vfx");
    level._effect["powerup_on"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_powerup_glow_green.vfx");
    level._effect["powerup_grabbed"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_powerup_glow_green_grab.vfx");
}

// Namespace powerups/namespace_2520ec51681db245
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f0
// Size: 0x14
function private function_1bc17f51290823ab() {
    callback::add("player_laststand", &function_23cb67253c852e2a);
}

// Namespace powerups/namespace_2520ec51681db245
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40b
// Size: 0x62
function private function_f91870701cdc3aaa() {
    player = undefined;
    var_432ee43b6ef993aa = self;
    if (isplayer(var_432ee43b6ef993aa)) {
        player = var_432ee43b6ef993aa;
    }
    if (var_432ee43b6ef993aa namespace_1f188a13f7e79610::isvehicle()) {
        if (isdefined(var_432ee43b6ef993aa.owner) && isplayer(var_432ee43b6ef993aa.owner)) {
            player = var_432ee43b6ef993aa.owner;
        }
    }
    return player;
}

// Namespace powerups/namespace_2520ec51681db245
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x475
// Size: 0xed
function private function_cad183d7f2f4f301(var_14254f0bfa23268d, lifetime) {
    if (!isplayer(self)) {
        return;
    }
    self endon("powerup_hud_show_" + var_14254f0bfa23268d.str_powerup);
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(var_14254f0bfa23268d) || !isdefined(lifetime)) {
        return;
    }
    function_34cdeb95aa809736(var_14254f0bfa23268d, lifetime);
    var_eaffb8d26a6d3161 = 10;
    var_b6f5fb735ca50f7b = 5;
    var_905bfa0b020bf718 = max(0, lifetime - var_eaffb8d26a6d3161);
    var_ee6b5d9d51067ae3 = max(0, lifetime - var_905bfa0b020bf718 - var_b6f5fb735ca50f7b);
    end_wait = min(var_b6f5fb735ca50f7b, lifetime);
    wait(var_905bfa0b020bf718);
    function_d28fa5295a04d555("hud_powerup_" + var_14254f0bfa23268d.str_powerup, "blink");
    wait(var_ee6b5d9d51067ae3);
    function_d28fa5295a04d555("hud_powerup_" + var_14254f0bfa23268d.str_powerup, "blinkfast");
    wait(end_wait);
}

// Namespace powerups/namespace_2520ec51681db245
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x569
// Size: 0x4e
function private function_5bfe254c7e9aa4db(str_powerup) {
    if (!isplayer(self)) {
        return;
    }
    waitframe();
    if (!isalive(self)) {
        return;
    }
    refname = "hud_powerup_" + str_powerup;
    if (istrue(function_ada0825249682644(refname))) {
        function_fb3c9a259f146781(refname);
    }
    thread function_9717dc981f38ff6c();
}

// Namespace powerups/namespace_2520ec51681db245
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5be
// Size: 0x27
function private function_34cdeb95aa809736(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35) {
    function_380e378432f94ac2(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35, 1);
    thread function_9717dc981f38ff6c();
}

// Namespace powerups/namespace_2520ec51681db245
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec
// Size: 0xc9
function function_676437737684783f(var_9dd1bbe0eb638be0, var_5ed2ffb8d01c0e35) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    root = function_ecdae672c660149e();
    if (istrue(root.var_3c8193fca198f526)) {
        thread function_c0d098ef786b87f6(var_9dd1bbe0eb638be0, var_5ed2ffb8d01c0e35);
    }
    if (isdefined(var_5ed2ffb8d01c0e35) && var_5ed2ffb8d01c0e35 > 0) {
        var_14254f0bfa23268d = function_587ecc90909a8c38(var_9dd1bbe0eb638be0);
        init_timer(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35);
        if (istrue(root.var_3c8193fca198f526)) {
            var_937491868c5da50f = 3;
            msg = waittill_notify_or_timeout_return("powerup_hud_show_" + var_9dd1bbe0eb638be0, var_937491868c5da50f);
            if (msg == "timeout") {
                function_87ee9b2ac9dac707(var_9dd1bbe0eb638be0, var_5ed2ffb8d01c0e35 - var_937491868c5da50f);
            }
        } else {
            function_87ee9b2ac9dac707(var_9dd1bbe0eb638be0, var_5ed2ffb8d01c0e35);
        }
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bc
// Size: 0x82
function private function_c0d098ef786b87f6(var_9dd1bbe0eb638be0, var_5ed2ffb8d01c0e35) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    root = function_ecdae672c660149e();
    var_d87ec833533287a2 = root.var_eaf13acb539829eb[var_9dd1bbe0eb638be0];
    for (i = 0; i < var_d87ec833533287a2; i++) {
        waitframe();
    }
    self setclientomnvar("ui_powerup_splash", var_d87ec833533287a2);
    self setclientomnvar("ui_powerup_splash_notify", gettime());
}

// Namespace powerups/namespace_2520ec51681db245
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x745
// Size: 0x9c
function private hide_timer(str_powerup, var_86b2c10e3c5de35e, var_72e0ea8e48ab3921) {
    /#
        assert(isplayer(self));
    #/
    if (function_dd6c086a7d5e3b85() && !istrue(var_72e0ea8e48ab3921)) {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    refname = "hud_powerup_" + str_powerup;
    player = self;
    isactive = player function_ada0825249682644(refname);
    if (!istrue(isactive)) {
        return;
    }
    player function_d28fa5295a04d555(refname, "hide");
    if (isdefined(var_86b2c10e3c5de35e) && var_86b2c10e3c5de35e > 0) {
        wait(var_86b2c10e3c5de35e);
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e8
// Size: 0x1ae
function private function_380e378432f94ac2(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35, var_5ed92702665ccbc8, var_9f6f493675057d64) {
    /#
        assert(isplayer(self));
    #/
    if (function_dd6c086a7d5e3b85()) {
        return;
    }
    self endon("death_or_disconnect");
    root = function_ecdae672c660149e();
    var_486ef34a9f4d1717 = function_e6f547b7f0a996ed();
    /#
        assertex(isdefined(root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup]), "The hud_powerup, " + var_14254f0bfa23268d.str_powerup + ", does not exist in the powerup list. Please check the poweruplist asset in APE for that powerup ref.");
    #/
    var_e66f8bc0f155720f = var_486ef34a9f4d1717.var_5a95e049dbbdc1ec;
    if (!isdefined(var_e66f8bc0f155720f) || var_e66f8bc0f155720f == "") {
        return;
    }
    player = self;
    index = var_14254f0bfa23268d.index;
    refname = "hud_powerup_" + var_14254f0bfa23268d.str_powerup;
    state = function_53c4c53197386572(var_486ef34a9f4d1717.var_fec1fa2e735d7499, "");
    var_8d076e93bc8ccd99 = [];
    var_8d076e93bc8ccd99["bundle_index"] = root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup];
    var_8d076e93bc8ccd99["time"] = var_5ed2ffb8d01c0e35;
    isactive = player function_ada0825249682644(refname);
    if (!isactive) {
        init_timer(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35, var_5ed92702665ccbc8, var_9f6f493675057d64);
        player function_d28fa5295a04d555(refname, state);
    } else {
        player function_d28fa5295a04d555(refname, "Show");
    }
    if (!istrue(var_9f6f493675057d64)) {
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x99d
// Size: 0x1ad
function private init_timer(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35, var_5ed92702665ccbc8, var_9f6f493675057d64) {
    /#
        assert(isplayer(self));
    #/
    if (function_dd6c086a7d5e3b85()) {
        return;
    }
    self endon("death_or_disconnect");
    root = function_ecdae672c660149e();
    var_486ef34a9f4d1717 = function_e6f547b7f0a996ed();
    /#
        assertex(isdefined(root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup]), "The hud_powerup, " + var_14254f0bfa23268d.str_powerup + ", does not exist in the powerup list. Please check the poweruplist asset in APE for that powerup ref.");
    #/
    var_e66f8bc0f155720f = var_486ef34a9f4d1717.var_5a95e049dbbdc1ec;
    if (!isdefined(var_e66f8bc0f155720f) || var_e66f8bc0f155720f == "") {
        return;
    }
    player = self;
    index = var_14254f0bfa23268d.index;
    refname = "hud_powerup_" + var_14254f0bfa23268d.str_powerup;
    state = "Hide";
    var_8d076e93bc8ccd99 = [];
    var_8d076e93bc8ccd99["bundle_index"] = root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup];
    var_8d076e93bc8ccd99["time"] = var_5ed2ffb8d01c0e35;
    isactive = player function_ada0825249682644(refname);
    if (!isactive) {
        player function_90de31b2cbef19f9(refname, var_e66f8bc0f155720f);
        player function_d28fa5295a04d555(refname, state);
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
        if (!istrue(var_5ed92702665ccbc8)) {
            player thread function_9717dc981f38ff6c(var_14254f0bfa23268d.str_powerup);
        }
    }
    if (!istrue(var_9f6f493675057d64)) {
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb51
// Size: 0x1f8
function private function_9717dc981f38ff6c(str_powerup) {
    var_486ef34a9f4d1717 = function_e6f547b7f0a996ed();
    var_f765538941d0eccd = function_f845164fd6027e79(var_486ef34a9f4d1717.var_99a990e9f5ea961c);
    var_949530d3a6b789b3 = function_863b22a1564f8eb(var_486ef34a9f4d1717.var_40a95d7bb8872fa2);
    var_93ad9d99a27ac228 = function_53c4c53197386572(var_486ef34a9f4d1717.var_fde517927a257ba7, 0);
    var_93ad9e99a27ac45b = function_53c4c53197386572(var_486ef34a9f4d1717.var_fde516927a257974, 0);
    stepx = function_53c4c53197386572(var_486ef34a9f4d1717.var_3a83b92e9fcd024a, 0);
    var_63f43f469b885ec6 = function_53c4c53197386572(var_486ef34a9f4d1717.var_3a83ba2e9fcd047d, 0);
    var_9445ccda1f06a14e = self.var_a0e1c0f50ca3ef0f;
    var_1df4c15ca0d10bca = float(var_9445ccda1f06a14e.size - 1) * 0.5;
    var_613803e654807723 = [];
    foreach (hp in var_9445ccda1f06a14e) {
        var_613803e654807723[var_613803e654807723.size] = hp;
    }
    foreach (i, hp in var_613803e654807723) {
        if (isdefined(str_powerup) && hp != str_powerup) {
            continue;
        }
        refname = "hud_powerup_" + hp;
        if (!istrue(function_ada0825249682644(refname))) {
            continue;
        }
        posx = (i - var_1df4c15ca0d10bca) * stepx + var_93ad9d99a27ac228;
        posy = var_93ad9e99a27ac45b + i * var_63f43f469b885ec6;
        function_f4c37324750dc183(refname, posx, posy, var_f765538941d0eccd, var_949530d3a6b789b3);
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd50
// Size: 0xd
function private function_dd6c086a7d5e3b85() {
    return istrue(self.inlaststand);
}

// Namespace powerups/namespace_2520ec51681db245
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd65
// Size: 0x90
function private function_23cb67253c852e2a(params) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waitframe();
    if (isalive(self)) {
        root = function_ecdae672c660149e();
        foreach (ref, powerup in root.powerups) {
            thread hide_timer(ref, 0, 1);
        }
    }
}

// Namespace powerups/namespace_2520ec51681db245
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfc
// Size: 0x119
function function_96e1cf53bdd43f1c(params) {
    if (!level flag("drop_powerups")) {
        return 0;
    }
    if (!isplayer(params.eattacker)) {
        return 0;
    }
    root = function_ecdae672c660149e();
    if (istrue(root.no_powerups) || isdefined(params.weapon) && istrue(params.weapon.isheroweapon)) {
        return 0;
    }
    if (istrue(root.use_powerup_volumes)) {
        volumes = getentarray("no_powerups", "targetname");
        foreach (volume in volumes) {
            if (ispointinvolume(params.origin, volume)) {
                return 0;
            }
        }
    }
    if (!ispointonnavmesh(params.origin)) {
        return 0;
    }
    return 1;
}

