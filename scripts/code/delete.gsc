// mwiii decomp prototype
#namespace delete;

// Namespace delete/namespace_195e35e0aea6fe41
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68
// Size: 0x1c
function main() {
    /#
        assert(isdefined(self));
    #/
    wait(0);
    if (isdefined(self)) {
        self delete();
    }
}

