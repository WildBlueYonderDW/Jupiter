// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_b4261c1ccd852b38;

// Namespace namespace_b4261c1ccd852b38/namespace_a384727bb5fa6510
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_dm();
}

// Namespace namespace_b4261c1ccd852b38/namespace_a384727bb5fa6510
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_b4261c1ccd852b38/namespace_a384727bb5fa6510
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_dm_think;
}

// Namespace namespace_b4261c1ccd852b38/namespace_a384727bb5fa6510
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff
// Size: 0x3
function setup_bot_dm() {
    
}

// Namespace namespace_b4261c1ccd852b38/namespace_a384727bb5fa6510
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109
// Size: 0x58
function bot_dm_think() {
    self notify("bot_dm_think");
    self endon("bot_dm_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        self [[ self.personality_update_function ]]();
        wait(0.05);
    }
}

