// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\createfxmenu.gsc;
#using scripts\common\createfx.gsc;
#using scripts\common\fx.gsc;
#using scripts\mp\utility\player.gsc;

#namespace createfx;

// Namespace createfx / scripts/mp/createfx
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9
// Size: 0x14d
function createfx() {
    level.func_position_player = &void;
    level.func_position_player_get = &func_position_player_get;
    level.func_loopfxthread = &loopfxthread;
    level.func_oneshotfxthread = &oneshotfxthread;
    level.func_create_loopsound = &create_loopsound;
    level.func_updatefx = &restart_fx_looper;
    level.func_process_fx_rotater = &process_fx_rotater;
    level.func_player_speed = &func_player_speed;
    level.mp_createfx = 1;
    level.callbackstartgametype = &void;
    level.callbackplayeractive = &void;
    level.callbackplayerconnect = &void;
    level.callbackplayerdisconnect = &void;
    level.callbackplayerdamage = &void;
    level.callbackplayerkilled = &void;
    level.callbackplayerlaststand = &void;
    level.callbackplayerconnect = &callback_playerconnect;
    level.callbackplayermigrated = &void;
    level.var_42d9b617bbca6a42 = &void;
    level.var_935c97aa3757676f = &void;
    level.var_cda3af1f73639c7c = &void;
    thread reflectionprobe_hide_hp();
    thread reflectionprobe_hide_front();
    thread func_get_level_fx();
    createfx_common();
    level waittill("eternity");
}

// Namespace createfx / scripts/mp/createfx
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d
// Size: 0x1f
function func_position_player_get(lastplayerorigin) {
    return level.player.origin;
}

// Namespace createfx / scripts/mp/createfx
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0xa1
function callback_playerconnect() {
    self waittill("begin");
    if (!isdefined(level.player)) {
        spawnpoints = getentarray("mp_global_intermission", "classname");
        self spawn(spawnpoints[0].origin, spawnpoints[0].angles);
        updatesessionstate("playing", "");
        self.maxhealth = 10000000;
        self.health = 10000000;
        level.player = self;
        thread createfxlogic();
        return;
    }
    kick(self getentitynumber());
}

// Namespace createfx / scripts/mp/createfx
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec
// Size: 0x56
function func_player_speed() {
    scale = level._createfx.player_speed / 190;
    level.player setmovespeedscale(scale);
    setdvar(@"hash_11a6aaf18b50047b", level._createfx.player_speed);
}

// Namespace createfx / scripts/mp/createfx
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349
// Size: 0x18b
function reflectionprobe_hide_hp() {
    /#
        neutralpoint = getentarray("<unknown string>", "<unknown string>");
        enemypoint = getentarray("<unknown string>", "<unknown string>");
        friendpoint = getentarray("<unknown string>", "<unknown string>");
        contestpoint = getentarray("<unknown string>", "<unknown string>");
        foreach (zone in neutralpoint) {
            zone hide();
        }
        foreach (zone in enemypoint) {
            zone hide();
        }
        foreach (zone in friendpoint) {
            zone hide();
        }
        foreach (zone in contestpoint) {
            zone hide();
        }
    #/
}

// Namespace createfx / scripts/mp/createfx
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0xea
function reflectionprobe_hide_front() {
    /#
        var_a5d9ff994b1d7ab6 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a5d9ff994b1d7ab6)) {
            var_a5d9ff994b1d7ab6 hide();
        }
        var_a5d9fe994b1d7883 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a5d9fe994b1d7883)) {
            var_a5d9fe994b1d7883 hide();
        }
        var_a5da04994b1d85b5 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a5da04994b1d85b5)) {
            var_a5da04994b1d85b5 hide();
        }
        var_a57411994aac8dfb = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a57411994aac8dfb)) {
            var_a57411994aac8dfb hide();
        }
        var_a57412994aac902e = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a57412994aac902e)) {
            var_a57412994aac902e hide();
        }
        var_a57414994aac9494 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a57414994aac9494)) {
            var_a57414994aac9494 hide();
        }
    #/
}

