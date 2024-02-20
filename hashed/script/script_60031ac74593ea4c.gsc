// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace namespace_106f587ebebd0cab;

// Namespace namespace_106f587ebebd0cab/namespace_b49c18f409ab6bce
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa2
// Size: 0x12
function private function_8497ce9a9d90ff60() {
    /#
        test_print("<unknown string>");
    #/
}

// Namespace namespace_106f587ebebd0cab/namespace_b49c18f409ab6bce
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbb
// Size: 0xf
function private function_60b66029d3b0fd37() {
    test_print("call to scriptsunittestprivate::_internal");
}

// Namespace namespace_106f587ebebd0cab/namespace_b49c18f409ab6bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1
// Size: 0x2c
function main() {
    test_begin("Private");
    function_60b66029d3b0fd37();
    /#
        function_8497ce9a9d90ff60();
    #/
    test_end("Private");
}

