// mwiii decomp prototype
#namespace debug;

// Namespace debug/namespace_d028276791d9cff6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0xa6
function drawent(ent, radius, var_f614dcdafd466705, var_7cadcf765f48d20b, color) {
    /#
        var_f8a269392b9c9b15 = int(var_7cadcf765f48d20b / level.framedurationseconds);
        for (frame = 0; frame < var_f8a269392b9c9b15; frame++) {
            sphere(ent.origin, radius, color);
            line(ent.origin, ent.origin + anglestoforward(ent.angles) * var_f614dcdafd466705, color);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d028276791d9cff6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115
// Size: 0x64
function drawline(start, end, var_7cadcf765f48d20b, color) {
    /#
        var_f8a269392b9c9b15 = int(var_7cadcf765f48d20b / level.framedurationseconds);
        for (frame = 0; frame < var_f8a269392b9c9b15; frame++) {
            line(start, end, color);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d028276791d9cff6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180
// Size: 0x64
function drawsphere(origin, radius, var_7cadcf765f48d20b, color) {
    /#
        var_f8a269392b9c9b15 = int(var_7cadcf765f48d20b / level.framedurationseconds);
        for (frame = 0; frame < var_f8a269392b9c9b15; frame++) {
            sphere(origin, radius, color);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d028276791d9cff6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0xf5
function drawangles(origin, angles, var_3e6845817408f87e, scalar) {
    /#
        if (!isdefined(scalar)) {
            scalar = 1;
        }
        var_f8a269392b9c9b15 = int(var_3e6845817408f87e / level.framedurationseconds);
        for (frame = 0; frame < var_f8a269392b9c9b15; frame++) {
            fwd = anglestoforward(angles);
            right = anglestoright(angles);
            up = anglestoup(angles);
            line(origin, origin + fwd * 12 * scalar, (1, 0, 0));
            line(origin, origin + right * 12 * scalar, (0, 1, 0));
            line(origin, origin + up * 12 * scalar, (0, 0, 1));
            waitframe();
        }
    #/
}

