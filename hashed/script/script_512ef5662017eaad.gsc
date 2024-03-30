// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_429c2a03090c1ea1;

#namespace namespace_d7599bf3652c29ff;

// Namespace namespace_d7599bf3652c29ff / namespace_8d0d7515863476ad
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xde
// Size: 0x20
function autoexec main() {
    var_601bcee5d276f46d = "zombie_base_armored";
    function_d6736c5ef5ac2990(var_601bcee5d276f46d, &function_b9f4b7206d76e7ce);
}

// Namespace namespace_d7599bf3652c29ff / namespace_8d0d7515863476ad
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x105
// Size: 0x1e
function private function_b9f4b7206d76e7ce(params) {
    function_ebb83c1efeaae2c7(params.var_c02b1f6c1721c844);
}

// Namespace namespace_d7599bf3652c29ff / namespace_8d0d7515863476ad
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a
// Size: 0x57
function private function_ebb83c1efeaae2c7(var_c02b1f6c1721c844) {
    if (self getscriptablehaspart(var_c02b1f6c1721c844)) {
        self setscriptablepartstate(var_c02b1f6c1721c844, "destroyed");
        function_3d2728c0e2252a1d(var_c02b1f6c1721c844, "exposed");
        if (var_c02b1f6c1721c844 == "armored_head") {
            function_7380ccd6f2c49392(var_c02b1f6c1721c844, 1);
        }
        return;
    }
    /#
        assertmsg("Trying to destroy invalid metabone. Name: " + var_c02b1f6c1721c844);
    #/
}

