#namespace debug_utility;

/#

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x68
    // Size: 0xa5
    function drawent(ent, radius, forwardlen, drawtimeseconds, color) {
        drawframes = int(drawtimeseconds / level.framedurationseconds);
        for (frame = 0; frame < drawframes; frame++) {
            sphere(ent.origin, radius, color);
            line(ent.origin, ent.origin + anglestoforward(ent.angles) * forwardlen, color);
            waitframe();
        }
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 4, eflags: 0x2 linked
    // Checksum 0x0, Offset: 0x115
    // Size: 0x63
    function drawline(start, end, drawtimeseconds, color) {
        drawframes = int(drawtimeseconds / level.framedurationseconds);
        for (frame = 0; frame < drawframes; frame++) {
            line(start, end, color);
            waitframe();
        }
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 4, eflags: 0x2 linked
    // Checksum 0x0, Offset: 0x180
    // Size: 0x63
    function drawsphere(origin, radius, drawtimeseconds, color) {
        drawframes = int(drawtimeseconds / level.framedurationseconds);
        for (frame = 0; frame < drawframes; frame++) {
            sphere(origin, radius, color);
            waitframe();
        }
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x1eb
    // Size: 0x73
    function drawcylinder(origin, radius, height, drawtimeseconds, color) {
        drawframes = int(drawtimeseconds / level.framedurationseconds);
        for (frame = 0; frame < drawframes; frame++) {
            cylinder(origin, origin + (0, 0, height), radius, color);
            waitframe();
        }
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 10, eflags: 0x0
    // Checksum 0x0, Offset: 0x266
    // Size: 0xf2
    function drawboxfrompoints(topleftfront, toprightfront, topleftback, toprightback, bottomleftfront, bottomrightfront, var_2febbcb4c37b3b64, var_3a64b6f876a6b09f, drawtimeseconds, color) {
        thread drawline(topleftfront, toprightfront, drawtimeseconds, color);
        thread drawline(topleftfront, bottomleftfront, drawtimeseconds, color);
        thread drawline(topleftfront, topleftback, drawtimeseconds, color);
        thread drawline(toprightfront, toprightback, drawtimeseconds, color);
        thread drawline(toprightfront, bottomrightfront, drawtimeseconds, color);
        thread drawline(topleftback, var_2febbcb4c37b3b64, drawtimeseconds, color);
        thread drawline(topleftback, toprightback, drawtimeseconds, color);
        thread drawline(toprightback, var_3a64b6f876a6b09f, drawtimeseconds, color);
        thread drawline(bottomleftfront, bottomrightfront, drawtimeseconds, color);
        thread drawline(bottomleftfront, var_2febbcb4c37b3b64, drawtimeseconds, color);
        thread drawline(bottomrightfront, var_3a64b6f876a6b09f, drawtimeseconds, color);
        thread drawline(var_3a64b6f876a6b09f, var_2febbcb4c37b3b64, drawtimeseconds, color);
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 4, eflags: 0x2 linked
    // Checksum 0x0, Offset: 0x360
    // Size: 0xf4
    function drawangles(origin, angles, var_3e6845817408f87e, scalar) {
        if (!isdefined(scalar)) {
            scalar = 1;
        }
        drawframes = int(var_3e6845817408f87e / level.framedurationseconds);
        for (frame = 0; frame < drawframes; frame++) {
            fwd = anglestoforward(angles);
            right = anglestoright(angles);
            up = anglestoup(angles);
            line(origin, origin + fwd * 12 * scalar, (1, 0, 0));
            line(origin, origin + right * 12 * scalar, (0, 1, 0));
            line(origin, origin + up * 12 * scalar, (0, 0, 1));
            waitframe();
        }
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x45c
    // Size: 0x69
    function function_bb5850f548a9d261() {
        timescalecode = getdvarfloat(@"hash_4899ba8ad5536527");
        while (true) {
            timescale = getdvarfloat(@"hash_4899ba8ad5536527");
            if (timescalecode != timescale) {
                adddebugcommand("<dev string:x1c>" + timescale);
                timescalecode = timescale;
            }
            if (timescale >= 1) {
                wait 0.25;
                continue;
            }
            waitframe();
        }
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x4cd
    // Size: 0xf7
    function function_7111207db5db2175(midpoint, halfsize, drawtimeseconds, color) {
        vertices = [];
        vertices[0] = midpoint + (halfsize[0] * -1, halfsize[1] * -1, halfsize[2]);
        vertices[1] = midpoint + (halfsize[0], halfsize[1] * -1, halfsize[2]);
        vertices[2] = midpoint + (halfsize[0] * -1, halfsize[1], halfsize[2]);
        vertices[3] = midpoint + halfsize;
        vertices[4] = midpoint - halfsize;
        vertices[5] = midpoint + (halfsize[0], halfsize[1] * -1, halfsize[2] * -1);
        vertices[6] = midpoint + (halfsize[0] * -1, halfsize[1], halfsize[2] * -1);
        vertices[7] = midpoint + (halfsize[0], halfsize[1], halfsize[2] * -1);
        thread drawboxfrompoints(vertices[0], vertices[1], vertices[2], vertices[3], vertices[4], vertices[5], vertices[6], vertices[7], drawtimeseconds, color);
    }

    // Namespace debug_utility / scripts\cp_mp\utility\debug_utility
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x5cc
    // Size: 0xfe
    function waitfordvar(dvar, dvar_type, input_func) {
        level notify("<dev string:x2b>" + function_f28fd66285fa2c9(dvar));
        level endon("<dev string:x2b>" + function_f28fd66285fa2c9(dvar));
        setdvarifuninitialized(dvar, "<dev string:x35>");
        while (true) {
            if (getdvar(dvar, "<dev string:x35>") != "<dev string:x35>") {
                var_4f9df27618277b1e = "<dev string:x35>";
                switch (dvar_type) {
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
                setdvar(dvar, "<dev string:x35>");
            }
            wait 0.1;
        }
    }

#/
