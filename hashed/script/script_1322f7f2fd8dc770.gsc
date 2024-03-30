// mwiii decomp prototype
#namespace callback;

// Namespace callback / namespace_a3133fad183319dc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68
// Size: 0x25
function exec_callback(func, data) {
    if (isdefined(data)) {
        [[ func ]](data);
        return;
    }
    [[ func ]]();
}

