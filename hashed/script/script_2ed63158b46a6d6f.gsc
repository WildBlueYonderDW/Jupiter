// mwiii decomp prototype
#namespace string;

// Namespace string/namespace_15bcbf57b169d5f3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69
// Size: 0x1e
function function_8345560e22fe3b10(var) {
    if (isdefined(var)) {
        return ("" + var);
    }
    return "";
}

// Namespace string/namespace_15bcbf57b169d5f3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f
// Size: 0x1a
function function_46b9c00bb0535aa3(str) {
    return !isdefined(str) || str == "";
}

// Namespace string/namespace_15bcbf57b169d5f3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb1
// Size: 0x51
function rjust(str_input, n_length, str_fill) {
    /#
        if (!isdefined(str_fill)) {
            str_fill = "<unknown string>";
        }
        str_input = function_8345560e22fe3b10(str_input);
        n_fill_length = n_length - str_input.size;
        str_fill = fill(n_fill_length, str_fill);
        return str_fill + str_input;
    #/
}

// Namespace string/namespace_15bcbf57b169d5f3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x109
// Size: 0x51
function ljust(str_input, n_length, str_fill) {
    /#
        if (!isdefined(str_fill)) {
            str_fill = "<unknown string>";
        }
        str_input = function_8345560e22fe3b10(str_input);
        n_fill_length = n_length - str_input.size;
        str_fill = fill(n_fill_length, str_fill);
        return str_input + str_fill;
    #/
}

// Namespace string/namespace_15bcbf57b169d5f3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x68
function fill(n_length, str_fill) {
    /#
        if (!isdefined(str_fill) || str_fill == "<unknown string>") {
            str_fill = "<unknown string>";
        }
        str_return = "<unknown string>";
        while (n_length > 0) {
            str = getsubstr(str_fill, 0, n_length);
            n_length = n_length - str.size;
            str_return = str_return + str;
        }
        return str_return;
    #/
}

