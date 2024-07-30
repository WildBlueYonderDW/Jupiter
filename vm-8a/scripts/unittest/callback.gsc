#namespace callback;

// Namespace callback / scripts\unittest\callback
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68
// Size: 0x24
function exec_callback(func, data) {
    if (isdefined(data)) {
        [[ func ]](data);
        return;
    }
    [[ func ]]();
}

