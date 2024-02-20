// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_f82856f41ab7e03c;

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd9
// Size: 0x109
function function_97bd7104f2a2ddfe() {
    level.var_424683abb42f67db = [];
    level.var_424683abb42f67db["linear"] = &function_18c7b74bb9e6d83d;
    level.var_424683abb42f67db["power"] = &function_a525f9c333f36b5;
    level.var_424683abb42f67db["quadratic"] = &function_5076f55422e87aca;
    level.var_424683abb42f67db["cubic"] = &function_1c2d93b88753de12;
    level.var_424683abb42f67db["quartic"] = &function_651839ae5c237167;
    level.var_424683abb42f67db["quintic"] = &function_8ed1dfbb99ebbffb;
    level.var_424683abb42f67db["exponential"] = &function_7c81847ebfb3f5b3;
    level.var_424683abb42f67db["logarithmic"] = &function_26eb6629640c404b;
    level.var_424683abb42f67db["sine"] = &function_5afb5d6ab00ef4b9;
    level.var_424683abb42f67db["back"] = &function_aa29dac668c507;
    level.var_424683abb42f67db["elastic"] = &function_d66c45282cb1cbcf;
    level.var_424683abb42f67db["bounce"] = &function_d472af24b9f3d4e4;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0x39
function function_18c7b74bb9e6d83d(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out) {
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
// Size: 0x4c
function function_a525f9c333f36b5(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out, power) {
    var_b1d0bc03029f6a2c = easepower(var_b1d0bc03029f6a2c, power, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0x45
function function_5076f55422e87aca(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out) {
    var_b1d0bc03029f6a2c = easepower(var_b1d0bc03029f6a2c, 2, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb
// Size: 0x45
function function_1c2d93b88753de12(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out) {
    var_b1d0bc03029f6a2c = easepower(var_b1d0bc03029f6a2c, 3, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x45
function function_651839ae5c237167(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out) {
    var_b1d0bc03029f6a2c = easepower(var_b1d0bc03029f6a2c, 4, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x365
// Size: 0x45
function function_8ed1dfbb99ebbffb(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out) {
    var_b1d0bc03029f6a2c = easepower(var_b1d0bc03029f6a2c, 5, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2
// Size: 0x4c
function function_7c81847ebfb3f5b3(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out, scale) {
    var_b1d0bc03029f6a2c = easeexponential(var_b1d0bc03029f6a2c, scale, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x406
// Size: 0x4c
function function_26eb6629640c404b(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out, var_27a598791ce01a3b) {
    var_b1d0bc03029f6a2c = easelogarithmic(var_b1d0bc03029f6a2c, var_27a598791ce01a3b, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x45a
// Size: 0x43
function function_5afb5d6ab00ef4b9(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out) {
    var_b1d0bc03029f6a2c = easesine(var_b1d0bc03029f6a2c, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5
// Size: 0x56
function function_aa29dac668c507(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out, var_210d57017070b86f, power) {
    var_b1d0bc03029f6a2c = easeback(var_b1d0bc03029f6a2c, var_210d57017070b86f, power, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x503
// Size: 0x60
function function_d66c45282cb1cbcf(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out, amplitude, frequency, var_a524625d9fa20054) {
    var_b1d0bc03029f6a2c = easeelastic(var_b1d0bc03029f6a2c, amplitude, frequency, var_a524625d9fa20054, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x56b
// Size: 0x56
function function_d472af24b9f3d4e4(start, end, var_b1d0bc03029f6a2c, ease_in, ease_out, bounces, var_90128bb71cc53f5a) {
    var_b1d0bc03029f6a2c = easebounce(var_b1d0bc03029f6a2c, bounces, var_90128bb71cc53f5a, ease_in, ease_out);
    return (1 - var_b1d0bc03029f6a2c) * start + var_b1d0bc03029f6a2c * end;
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x5c9
// Size: 0x62
function function_575bc35344a1c859(dvar, value, time, var_ea33b0c505c3cf24, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d, var_fa35d7807af025fa) {
    function_5a51a4e5eec18b00(&setdvar, dvar, value, time, var_ea33b0c505c3cf24, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d, var_fa35d7807af025fa);
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x632
// Size: 0x62
function function_106f0697ee4d2c55(dvar, value, time, var_ea33b0c505c3cf24, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d, var_fa35d7807af025fa) {
    function_5a51a4e5eec18b00(&setsaveddvar, dvar, value, time, var_ea33b0c505c3cf24, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d, var_fa35d7807af025fa);
}

// Namespace namespace_f82856f41ab7e03c/namespace_1291577eca690656
// Params a, eflags: 0x4
// Checksum 0x0, Offset: 0x69b
// Size: 0x195
function private function_5a51a4e5eec18b00(var_128b5293a461c48b, dvar, value, time, var_ea33b0c505c3cf24, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d, var_fa35d7807af025fa) {
    /#
        assert(isdefined(level.var_424683abb42f67db));
    #/
    /#
        assert(isdefined(level.var_424683abb42f67db[var_ea33b0c505c3cf24]));
    #/
    dvar_name = function_f28fd66285fa2c9(dvar);
    level notify("ease_dvar_" + dvar_name);
    level endon("ease_dvar_" + dvar_name);
    var_7ad74ca9fb5916d = getdvarfloat(dvar);
    var_4ce7c4c2088a4693 = var_7ad74ca9fb5916d;
    cur_time = 0;
    while (cur_time < time) {
        cur_time = cur_time + level.framedurationseconds;
        var_b1d0bc03029f6a2c = min(1, cur_time / time);
        if (isdefined(var_fa35d7807af025fa)) {
            var_4ce7c4c2088a4693 = [[ level.var_424683abb42f67db[var_ea33b0c505c3cf24] ]](var_7ad74ca9fb5916d, value, var_b1d0bc03029f6a2c, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d, var_fa35d7807af025fa);
        } else if (isdefined(var_fa35d8807af0282d)) {
            var_4ce7c4c2088a4693 = [[ level.var_424683abb42f67db[var_ea33b0c505c3cf24] ]](var_7ad74ca9fb5916d, value, var_b1d0bc03029f6a2c, ease_in, ease_out, var_fa35d5807af02194, var_fa35d8807af0282d);
        } else if (isdefined(var_fa35d5807af02194)) {
            var_4ce7c4c2088a4693 = [[ level.var_424683abb42f67db[var_ea33b0c505c3cf24] ]](var_7ad74ca9fb5916d, value, var_b1d0bc03029f6a2c, ease_in, ease_out, var_fa35d5807af02194);
        } else {
            var_4ce7c4c2088a4693 = [[ level.var_424683abb42f67db[var_ea33b0c505c3cf24] ]](var_7ad74ca9fb5916d, value, var_b1d0bc03029f6a2c, ease_in, ease_out);
        }
        builtin [[ var_128b5293a461c48b ]](dvar, var_4ce7c4c2088a4693);
        waitframe();
    }
    builtin [[ var_128b5293a461c48b ]](dvar, value);
}

