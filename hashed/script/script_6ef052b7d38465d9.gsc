#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_422801cfe4074e05;

#namespace namespace_5b79e0098b7edf4d;

// Namespace namespace_5b79e0098b7edf4d / namespace_fffc43c197b763f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98
// Size: 0x2a
function init() {
    assert(flag("<dev string:x1c>"));
    callback::add("player_spawned", &on_player_spawn);
}

// Namespace namespace_5b79e0098b7edf4d / namespace_fffc43c197b763f7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xca
// Size: 0x36
function private on_player_spawn(params) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    analytics::addevent("player_spawned", player getorigin(), 0, "", player);
}

