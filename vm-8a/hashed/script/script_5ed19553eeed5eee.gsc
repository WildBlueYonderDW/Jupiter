#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\throttle.gsc;

#namespace despawn;

// Namespace despawn / namespace_cbab8cef24b931b4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa1
// Size: 0x1b
function terminatedespawn(asmname, statename) {
    thread queue_despawn();
}

// Namespace despawn / namespace_cbab8cef24b931b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4
// Size: 0x6d
function queue_despawn() {
    self endon("death");
    level endon("game_ended");
    if (!isdefined(level.despawnThrottle)) {
        level.despawnThrottle = throttle_initialize("despawnThrottle", getdvarint(@"hash_31df6612d8150a09", 3), level.framedurationseconds);
    }
    function_f632348cbb773537(level.despawnThrottle, self);
    self.nocorpse = 1;
    self kill();
}

