// mwiii decomp prototype
#namespace namespace_c10c97d19621a21b;

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
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

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
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

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
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

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb
// Size: 0x74
function drawcylinder(origin, radius, height, var_7cadcf765f48d20b, color) {
    /#
        var_f8a269392b9c9b15 = int(var_7cadcf765f48d20b / level.framedurationseconds);
        for (frame = 0; frame < var_f8a269392b9c9b15; frame++) {
            cylinder(origin, origin + (0, 0, height), radius, color);
            waitframe();
        }
    #/
}

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x266
// Size: 0xf3
function drawboxfrompoints(var_35a43f1d588a99bc, var_2e27bd18dfe68565, var_3034b10ee587f92e, var_23f57be14a18a221, var_5de23e0bafeeeb6a, var_f5245e120de48db3, var_2febbcb4c37b3b64, var_3a64b6f876a6b09f, var_7cadcf765f48d20b, color) {
    /#
        thread drawline(var_35a43f1d588a99bc, var_2e27bd18dfe68565, var_7cadcf765f48d20b, color);
        thread drawline(var_35a43f1d588a99bc, var_5de23e0bafeeeb6a, var_7cadcf765f48d20b, color);
        thread drawline(var_35a43f1d588a99bc, var_3034b10ee587f92e, var_7cadcf765f48d20b, color);
        thread drawline(var_2e27bd18dfe68565, var_23f57be14a18a221, var_7cadcf765f48d20b, color);
        thread drawline(var_2e27bd18dfe68565, var_f5245e120de48db3, var_7cadcf765f48d20b, color);
        thread drawline(var_3034b10ee587f92e, var_2febbcb4c37b3b64, var_7cadcf765f48d20b, color);
        thread drawline(var_3034b10ee587f92e, var_23f57be14a18a221, var_7cadcf765f48d20b, color);
        thread drawline(var_23f57be14a18a221, var_3a64b6f876a6b09f, var_7cadcf765f48d20b, color);
        thread drawline(var_5de23e0bafeeeb6a, var_f5245e120de48db3, var_7cadcf765f48d20b, color);
        thread drawline(var_5de23e0bafeeeb6a, var_2febbcb4c37b3b64, var_7cadcf765f48d20b, color);
        thread drawline(var_f5245e120de48db3, var_3a64b6f876a6b09f, var_7cadcf765f48d20b, color);
        thread drawline(var_3a64b6f876a6b09f, var_2febbcb4c37b3b64, var_7cadcf765f48d20b, color);
    #/
}

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360
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

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0x6a
function function_bb5850f548a9d261() {
    /#
        var_a2666c80e90bf0a7 = getdvarfloat(@"hash_4899ba8ad5536527");
        while (1) {
            timescale = getdvarfloat(@"hash_4899ba8ad5536527");
            if (var_a2666c80e90bf0a7 != timescale) {
                adddebugcommand("<unknown string>" + timescale);
                var_a2666c80e90bf0a7 = timescale;
            }
            if (timescale >= 1) {
                wait(0.25);
            } else {
                waitframe();
            }
        }
    #/
}

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd
// Size: 0xf8
function function_7111207db5db2175(midpoint, halfsize, var_7cadcf765f48d20b, color) {
    /#
        vertices = [];
        vertices[0] = midpoint + (halfsize[0] * -1, halfsize[1] * -1, halfsize[2]);
        vertices[1] = midpoint + (halfsize[0], halfsize[1] * -1, halfsize[2]);
        vertices[2] = midpoint + (halfsize[0] * -1, halfsize[1], halfsize[2]);
        vertices[3] = midpoint + halfsize;
        vertices[4] = midpoint - halfsize;
        vertices[5] = midpoint + (halfsize[0], halfsize[1] * -1, halfsize[2] * -1);
        vertices[6] = midpoint + (halfsize[0] * -1, halfsize[1], halfsize[2] * -1);
        vertices[7] = midpoint + (halfsize[0], halfsize[1], halfsize[2] * -1);
        thread drawboxfrompoints(vertices[0], vertices[1], vertices[2], vertices[3], vertices[4], vertices[5], vertices[6], vertices[7], var_7cadcf765f48d20b, color);
    #/
}

// Namespace namespace_c10c97d19621a21b/namespace_f2ffc0540883e1ad
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc
// Size: 0xff
function function_40570eb631da98ae(dvar, var_a1afd6f11218e679, input_func) {
    /#
        level notify("<unknown string>" + function_f28fd66285fa2c9(dvar));
        level endon("<unknown string>" + function_f28fd66285fa2c9(dvar));
        setdvarifuninitialized(dvar, "<unknown string>");
        while (1) {
            if (getdvar(dvar, "<unknown string>") != "<unknown string>") {
                var_4f9df27618277b1e = "<unknown string>";
                switch (var_a1afd6f11218e679) {
                case #"hash_4730906c2f53f03e":
                    var_4f9df27618277b1e = getdvarint(dvar);
                    break;
                case #"hash_3e4a6f464c850b65":
                    var_4f9df27618277b1e = getdvarfloat(dvar);
                    break;
                case #"hash_a08ace5b3c23c762":
                    var_4f9df27618277b1e = getdvarvector(dvar);
                    break;
                case #"hash_2ac140ce3b5ea398":
                default:
                    var_4f9df27618277b1e = getdvar(dvar, 0);
                    break;
                }
                level thread [[ input_func ]](var_4f9df27618277b1e);
                setdvar(dvar, "<unknown string>");
            }
            wait(0.1);
        }
    #/
}

