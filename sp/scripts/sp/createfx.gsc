#using scripts\common\createfx;
#using scripts\common\createfxmenu;
#using scripts\common\fx;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\trigger;
#using scripts\sp\utility;

#namespace createfx;

// Namespace createfx / scripts\sp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0
// Size: 0xe4
function createfx() {
    if (!level.createfx_enabled) {
        return;
    }
    clearstartpointtransients();
    level.func_position_player = &func_position_player;
    level.func_position_player_get = &func_position_player_get;
    level.func_updatefx = &restart_fx_looper;
    level.func_process_fx_rotater = &process_fx_rotater;
    level.func_player_speed = &func_player_speed;
    level.mp_createfx = 0;
    array_call(getaiarray(), &delete);
    array_call(getspawnerarray(), &delete);
    ai = getaiarray();
    array_call(ai, &delete);
    createfx_common();
    thread createfxlogic();
    thread func_get_level_fx();
    level.player allowcrouch(0);
    level.player allowprone(0);
    createfx_only_triggers();
    level waittill("eternity");
}

// Namespace createfx / scripts\sp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x7b
function createfx_only_triggers() {
    var_b65f27b4ba84b114 = [];
    var_b65f27b4ba84b114["trigger_multiple_createart_transient"] = &scripts\sp\trigger::trigger_createart_transient;
    foreach (function in var_b65f27b4ba84b114) {
        triggers = getentarray(classname, "classname");
        array_levelthread(triggers, function);
    }
}

// Namespace createfx / scripts\sp\createfx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24f
// Size: 0xac
function func_position_player_get(lastplayerorigin) {
    if (distancesquared(lastplayerorigin, level.player.origin) > 4096) {
        setdvar(@"hash_57b68f9976f53f0d", level.player.origin[0]);
        setdvar(@"hash_57b68e9976f53cda", level.player.origin[1]);
        setdvar(@"hash_57b68d9976f53aa7", level.player.origin[2]);
    }
    return level.player.origin;
}

// Namespace createfx / scripts\sp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x304
// Size: 0x89
function func_position_player() {
    playerpos = [];
    playerpos[0] = getdvarint(@"hash_57b68f9976f53f0d");
    playerpos[1] = getdvarint(@"hash_57b68e9976f53cda");
    playerpos[2] = getdvarint(@"hash_57b68d9976f53aa7");
    level.player setorigin((playerpos[0], playerpos[1], playerpos[2]));
    level.player setplayerangles((0, level.player.angles[1], 0));
}

// Namespace createfx / scripts\sp\createfx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x24
function func_player_speed() {
    setsaveddvar(@"g_speed", level._createfx.player_speed);
}

