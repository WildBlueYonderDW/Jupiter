// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_422801cfe4074e05;

#namespace namespace_5b79e0098b7edf4d;

// Namespace namespace_5b79e0098b7edf4d/namespace_fffc43c197b763f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98
// Size: 0x2b
function init() {
    /#
        /#
            assert(flag("<unknown string>"));
        #/
    #/
    callback::add("player_spawned", &on_player_spawn);
}

// Namespace namespace_5b79e0098b7edf4d/namespace_fffc43c197b763f7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xca
// Size: 0x37
function private on_player_spawn(params) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    analytics::function_bf23e005e136dc90("player_spawned", player getorigin(), 0, "", player);
}

