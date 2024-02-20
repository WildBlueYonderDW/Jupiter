// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;

#namespace despawn;

// Namespace despawn/namespace_cbab8cef24b931b4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa1
// Size: 0x1c
function function_f47c0d9f38df3006(asmname, statename) {
    thread function_c28d901dcf1366a5();
}

// Namespace despawn/namespace_cbab8cef24b931b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4
// Size: 0x6e
function function_c28d901dcf1366a5() {
    self endon("death");
    level endon("game_ended");
    if (!isdefined(level.despawnThrottle)) {
        level.despawnThrottle = function_e4c99b0f178ffb98("despawnThrottle", getdvarint(@"hash_31df6612d8150a09", 3), level.framedurationseconds);
    }
    function_f632348cbb773537(level.despawnThrottle, self);
    self.nocorpse = 1;
    self kill();
}

