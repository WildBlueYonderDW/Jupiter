#namespace string;

// Namespace string / scripts\common\string
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69
// Size: 0x1d
function to_string(var) {
    if (isdefined(var)) {
        return ("" + var);
    }
    return "";
}

// Namespace string / scripts\common\string
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f
// Size: 0x19
function function_46b9c00bb0535aa3(str) {
    return !isdefined(str) || str == "";
}

/#

    // Namespace string / scripts\common\string
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xb1
    // Size: 0x50
    function rjust(str_input, n_length, str_fill) {
        if (!isdefined(str_fill)) {
            str_fill = "<dev string:x1c>";
        }
        str_input = to_string(str_input);
        n_fill_length = n_length - str_input.size;
        str_fill = fill(n_fill_length, str_fill);
        return str_fill + str_input;
    }

    // Namespace string / scripts\common\string
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x109
    // Size: 0x50
    function ljust(str_input, n_length, str_fill) {
        if (!isdefined(str_fill)) {
            str_fill = "<dev string:x1c>";
        }
        str_input = to_string(str_input);
        n_fill_length = n_length - str_input.size;
        str_fill = fill(n_fill_length, str_fill);
        return str_input + str_fill;
    }

    // Namespace string / scripts\common\string
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x161
    // Size: 0x67
    function fill(n_length, str_fill) {
        if (!isdefined(str_fill) || str_fill == "<dev string:x1e>") {
            str_fill = "<dev string:x1c>";
        }
        for (str_return = "<dev string:x1e>"; n_length > 0; str_return += str) {
            str = getsubstr(str_fill, 0, n_length);
            n_length -= str.size;
        }
        return str_return;
    }

#/
