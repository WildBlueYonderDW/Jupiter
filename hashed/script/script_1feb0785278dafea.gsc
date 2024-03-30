// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\supers.gsc;
#using script_38db8bccc9eb301f;
#using scripts\mp\utility\player.gsc;
#using script_2b264b25c7da0b12;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_3b78d23dad7ec5be;

#namespace namespace_80be1a420d9464c2;

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b
// Size: 0xf9
function init() {
    scripts/mp/supers::function_53110a12409d01da("super_healing_aura", undefined, undefined, &function_100df54dff03edbb, &function_732c446e8109dfdf, undefined);
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
    supertable = getscriptbundle(level.supertable);
    foreach (super in supertable.super_list) {
        if (super.ref == "super_healing_aura") {
            level.var_f04301db8ca5ecfa["super_healing_aura"] = getscriptbundle("super:" + super.bundle);
            break;
        }
    }
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b
// Size: 0x6e
function function_100df54dff03edbb() {
    if (isdefined(level.var_f04301db8ca5ecfa["super_healing_aura"])) {
        var_518800153d623ef2 = level.var_f04301db8ca5ecfa["super_healing_aura"].offhandweapon;
        deploysuccess = namespace_e23f629a8349dfaf::function_75abcff430ed00b7(var_518800153d623ef2);
        if (deploysuccess) {
            self setscriptablepartstate("wand_fx", "wand_on_healing_aura", 0);
            thread function_e5fda42c3da4e793();
            return true;
        }
    }
    return false;
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1
// Size: 0x15
function function_732c446e8109dfdf(fromdeath, attacker) {
    return false;
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce
// Size: 0xb
function function_e5fda42c3da4e793() {
    thread function_117332a41d3ff196();
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e0
// Size: 0xa2
function function_117332a41d3ff196() {
    players = function_3451fc6440a9b8db();
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        player heal_player(self);
        if (isdefined(level.var_9dd45392c2bffc71) && isdefined(level.var_9dd45392c2bffc71["id_healing_aura_heal"])) {
            self [[ level.var_9dd45392c2bffc71["id_healing_aura_heal"] ]]();
        }
    }
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x489
// Size: 0x51
function heal_player(reviver) {
    thread function_4add5a3d6212791(1);
    var_d551990ed29466a0 = 1;
    if (istrue(var_d551990ed29466a0) && istrue(self.inlaststand)) {
        thread function_c750ffefbb8e1dab();
        thread revive_player(reviver);
        return;
    }
    function_4eb285a61cf68dc6();
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e1
// Size: 0x46
function function_4add5a3d6212791(duration) {
    self endon("disconnect");
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    self setscriptablepartstate("healing_aura_fx", "super_fx_on", 0);
    wait(duration);
    self setscriptablepartstate("healing_aura_fx", "super_fx_off", 0);
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0xf0
function revive_player(reviver) {
    self notify("healing_aura_revive_player");
    self endon("healing_aura_revive_player");
    self endon("death_or_disconnect");
    level endon("game_ended");
    for (n_timeout = 8; scripts/mp/utility/player::isinlaststand(self) && !istrue(self.var_2fb534abd9eb93ca); n_timeout = n_timeout - level.framedurationseconds) {
        if (n_timeout <= 0) {
            break;
        }
        waitframe();
    }
    if (istrue(self.beingrevived)) {
        scripts/mp/utility/player::setbeingrevivedinternal(0);
        reviver = utility::default_to(reviver, self);
        if (isdefined(self.reviver)) {
            reviver = self.reviver;
        }
        namespace_1d863a7bbc05fc52::finishreviveplayer("use_hold_revive_success", reviver);
    } else {
        self notify("last_stand_heal_success");
    }
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype() || istrue(level.var_6d63cbd43e47315e)) {
        scripts/mp/gametypes/br_public::setplayerbeingrevivedextrainfo(0);
    }
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_securing_progress", 0);
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625
// Size: 0x3d
function function_c750ffefbb8e1dab(var_976d79abcce342da) {
    self notify("heal_player_from_revive");
    self endon("heal_player_from_revive");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self waittill("last_stand_finished");
    function_4eb285a61cf68dc6();
    if (istrue(var_976d79abcce342da)) {
    }
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x669
// Size: 0xc2
function function_3451fc6440a9b8db() {
    bundle = namespace_e23f629a8349dfaf::function_ed72d0f08d00c1c0();
    affected_radius = bundle.var_d1ac061f0c3c0eeb;
    players = [];
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (isdefined(affected_radius) && distancesquared(player.origin, self.origin) > squared(affected_radius)) {
            continue;
        }
        players[players.size] = player;
    }
    return players;
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x733
// Size: 0x33
function function_4eb285a61cf68dc6() {
    self.health = self.maxhealth;
    namespace_4887422e77f3514e::onexitdeathsdoor(1);
    if (istrue(self.revivingteammate)) {
        self notify("finish_buddy_reviving");
    }
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76d
// Size: 0xf4
function function_b581a4659c1ed2fc() {
    level endon("game_ended");
    players = function_3451fc6440a9b8db();
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        beampos = utility::groundpos(player.origin);
        beamentity = spawn("script_model", beampos);
        beamentity setmodel("tag_origin");
        beamentity linkto(player);
        otherfxent = spawn("script_model", beampos);
        otherfxent setmodel("tag_origin");
        otherfxent linkto(beamentity);
        beamentity.otherfxent = otherfxent;
        beamentity thread function_69b2e6f4e33c0784(self);
    }
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x868
// Size: 0x2e
function function_2f3c8bf61931b1d8(fx_label) {
    self endon("disconnect");
    level endon("game_ended");
    waitframe();
    playfxontag(getfx(fx_label), self, "tag_origin");
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89d
// Size: 0x121
function function_69b2e6f4e33c0784(user_player) {
    self endon("death");
    time = 0;
    settings = user_player namespace_e23f629a8349dfaf::function_ed72d0f08d00c1c0();
    duration = settings.var_624f2456097d6c99;
    tick = settings.var_18033fb4a757efbc;
    beam_radius = settings.beam_radius;
    while (time <= duration) {
        players = user_player function_3451fc6440a9b8db();
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            if (distance2dsquared(self.origin, player.origin) <= squared(beam_radius)) {
                player heal_player(user_player);
            }
        }
        time = time + tick;
        wait(tick);
    }
    wait(tick);
    self delete();
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c5
// Size: 0x76
function set_regen() {
    level endon("game_ended");
    players = function_3451fc6440a9b8db();
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        player thread function_a8e441b6bb8e5b3c(self);
    }
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa42
// Size: 0x100
function function_a8e441b6bb8e5b3c(user_player) {
    id = self getentitynumber();
    self notify("do_player_regen" + id);
    self endon("do_player_regen" + id);
    self endon("death_or_disconnect");
    time = 0;
    settings = user_player namespace_e23f629a8349dfaf::function_ed72d0f08d00c1c0();
    duration = settings.var_b059843c0ec240fc;
    tick = settings.var_bd46bbf416f7d28d;
    var_e69b85ec21afb78b = settings.var_ccedea33ed4a75c2;
    while (time <= duration) {
        if (!istrue(self.inlaststand)) {
            if (isnumber(self.health) && isnumber(self.maxhealth)) {
                self.health = int(min(self.health + var_e69b85ec21afb78b, self.maxhealth));
            }
        }
        time = time + tick;
        wait(tick);
    }
    waitframe();
}

// Namespace namespace_80be1a420d9464c2 / namespace_f585f5e438cbdbc8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb49
// Size: 0x13b
function function_182ed32c1dbe94ed() {
    settings = namespace_e23f629a8349dfaf::function_ed72d0f08d00c1c0();
    knockdown_radius = settings.var_2e0d868cadea7953;
    players = function_3451fc6440a9b8db();
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        nearby_zombies = getaiarrayinradius(player.origin, knockdown_radius);
        foreach (zombie in nearby_zombies) {
            if (isdefined(zombie.team) && zombie.team == self.team) {
                continue;
            }
            if (!isalive(zombie)) {
                continue;
            }
            zombie namespace_db1ce2c035564e2c::function_e96aac065abbec4e(player.origin);
        }
        waitframe();
    }
}

