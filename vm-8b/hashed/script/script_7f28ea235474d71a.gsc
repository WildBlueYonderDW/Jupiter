#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_40a09967cec8a9c8;

// Namespace namespace_40a09967cec8a9c8 / namespace_1c0403ec08adfbe0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8
// Size: 0x2e
function main() {
    thread lighting_setup_dvars();
    thread function_9b9701887eb61641();
    level.var_1550eea978f3c08 = getmapsuncolorandintensity();
    level.var_6df7b39edec9ac5b = getmapsundirection();
}

// Namespace namespace_40a09967cec8a9c8 / namespace_1c0403ec08adfbe0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde
// Size: 0x2
function lighting_setup_dvars() {
    
}

// Namespace namespace_40a09967cec8a9c8 / namespace_1c0403ec08adfbe0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8
// Size: 0xe
function function_9b9701887eb61641() {
    resetsundirection();
    resetsunlight();
}

// Namespace namespace_40a09967cec8a9c8 / namespace_1c0403ec08adfbe0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfe
// Size: 0x68
function function_83165e6c3fba43ff(var_1486d9950068fc3b, var_1eee77dc97d49765, intensity) {
    if (!isdefined(intensity)) {
        intensity = undefined;
    }
    var_e660de2f1c2dc655 = anglestoforward(var_1486d9950068fc3b);
    setsundirection(var_e660de2f1c2dc655);
    if (isdefined(intensity)) {
        setsuncolorandintensity(var_1eee77dc97d49765[0], var_1eee77dc97d49765[1], var_1eee77dc97d49765[2], intensity);
        return;
    }
    setsuncolorandintensity(var_1eee77dc97d49765[0], var_1eee77dc97d49765[1], var_1eee77dc97d49765[2]);
}

