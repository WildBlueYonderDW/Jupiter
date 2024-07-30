#using scripts\engine\utility.gsc;
#using scripts\common\createfxmenu.gsc;
#using scripts\common\createfx.gsc;
#using scripts\common\fx.gsc;
#using scripts\mp\utility\player.gsc;

#namespace createfx;

// Namespace createfx / scripts\mp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa
// Size: 0x14c
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

// Namespace createfx / scripts\mp\createfx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24e
// Size: 0x1e
function func_position_player_get(lastplayerorigin) {
    return level.player.origin;
}

// Namespace createfx / scripts\mp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275
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

// Namespace createfx / scripts\mp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31e
// Size: 0x56
function func_player_speed() {
    scale = level._createfx.player_speed / 190;
    level.player setmovespeedscale(scale);
    setdvar(@"hash_11a6aaf18b50047b", level._createfx.player_speed);
}

// Namespace createfx / scripts\mp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37c
// Size: 0x17f
function reflectionprobe_hide_hp() {
    /#
        neutralpoint = getentarray("<dev string:x1c>", "<dev string:x35>");
        enemypoint = getentarray("<dev string:x43>", "<dev string:x35>");
        friendpoint = getentarray("<dev string:x62>", "<dev string:x35>");
        contestpoint = getentarray("<dev string:x82>", "<dev string:x35>");
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

// Namespace createfx / scripts\mp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x503
// Size: 0xe5
function reflectionprobe_hide_front() {
    /#
        var_a5d9ff994b1d7ab6 = getent("<dev string:xa3>", "<dev string:x35>");
        if (isdefined(var_a5d9ff994b1d7ab6)) {
            var_a5d9ff994b1d7ab6 hide();
        }
        var_a5d9fe994b1d7883 = getent("<dev string:xc6>", "<dev string:x35>");
        if (isdefined(var_a5d9fe994b1d7883)) {
            var_a5d9fe994b1d7883 hide();
        }
        var_a5da04994b1d85b5 = getent("<dev string:xe8>", "<dev string:x35>");
        if (isdefined(var_a5da04994b1d85b5)) {
            var_a5da04994b1d85b5 hide();
        }
        var_a57411994aac8dfb = getent("<dev string:x10c>", "<dev string:x35>");
        if (isdefined(var_a57411994aac8dfb)) {
            var_a57411994aac8dfb hide();
        }
        var_a57412994aac902e = getent("<dev string:x12d>", "<dev string:x35>");
        if (isdefined(var_a57412994aac902e)) {
            var_a57412994aac902e hide();
        }
        var_a57414994aac9494 = getent("<dev string:x14d>", "<dev string:x35>");
        if (isdefined(var_a57414994aac9494)) {
            var_a57414994aac9494 hide();
        }
    #/
}

