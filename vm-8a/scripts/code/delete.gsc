#namespace delete;

// Namespace delete / scripts\code\delete
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68
// Size: 0x1b
function main() {
    assert(isdefined(self));
    wait 0;
    if (isdefined(self)) {
        self delete();
    }
}

