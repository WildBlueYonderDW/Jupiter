// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace trace;

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505
// Size: 0xa9
function ray_trace(start, end, ignore, contentoverride, getsurfacetype, ignoreclutter, var_b00c60a54d663ca2) {
    trace = physics_raycast(start, end, isdefined(contentoverride) ? contentoverride : create_default_contents(), ignore, 0, "physicsquery_closest", istrue(ignoreclutter), var_b00c60a54d663ca2);
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0xc1
function ray_trace_ents(start, end, ents, contentoverride, getsurfacetype, ignoreclutter) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_f6dbad2cd5a99bb1 = ter_op(isdefined(ignoreclutter), ignoreclutter, 0);
    trace = physics_raycastents(start, end, content, ents, 0, "physicsquery_closest", var_f6dbad2cd5a99bb1);
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f
// Size: 0x86
function player_viewangles(collisioncontents, getsurfacetype, ignoreclutter, var_b00c60a54d663ca2) {
    if (!isdefined(collisioncontents)) {
        collisioncontents = create_all_contents();
    }
    if (!isdefined(getsurfacetype)) {
        getsurfacetype = 1;
    }
    if (!isdefined(ignoreclutter)) {
        ignoreclutter = 1;
    }
    if (!isdefined(var_b00c60a54d663ca2)) {
        var_b00c60a54d663ca2 = 1;
    }
    /#
        assert(isplayer(self));
    #/
    return ray_trace(self geteye(), self geteye() + anglestoforward(self getplayerangles()) * 10000, self, collisioncontents, getsurfacetype, ignoreclutter, var_b00c60a54d663ca2);
}

// Namespace trace / scripts/engine/trace
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x114
function _bullet_trace(start, end, hitcharacters, ignore, itemclip, var_45ab9428a87b2b9f, var_c368ea2402a6a1ad, var_8812897bd00bf028, testglass) {
    content = ["physicscontents_clipshot", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item"];
    if (hitcharacters) {
        content[content.size] = "physicscontents_characterproxy";
    }
    if (isdefined(itemclip) && itemclip) {
        content[content.size] = "physicscontents_itemclip";
    }
    if (isdefined(var_c368ea2402a6a1ad) && var_c368ea2402a6a1ad) {
        content[content.size] = "physicscontents_vehicleclip";
    }
    if (!isdefined(var_8812897bd00bf028) || !var_8812897bd00bf028) {
        content[content.size] = "physicscontents_clipshot";
    }
    if (!isdefined(testglass) || testglass) {
        content[content.size] = "physicscontents_glass";
    }
    if (isdefined(var_45ab9428a87b2b9f) && var_45ab9428a87b2b9f) {
        return ray_trace_detail(start, end, ignore, physics_createcontents(content), 1);
    }
    return ray_trace(start, end, ignore, physics_createcontents(content), 1);
}

// Namespace trace / scripts/engine/trace
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x35
function _bullet_trace_passed(start, end, hitcharacters, ignore) {
    return ray_trace_passed(start, end, ignore, create_default_contents(!hitcharacters));
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x865
// Size: 0xeb
function ray_trace_detail(start, end, ignore, contentoverride, getsurfacetype, ignoreclutter, var_b00c60a54d663ca2) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_f6dbad2cd5a99bb1 = ter_op(isdefined(ignoreclutter), ignoreclutter, 0);
    if (isdefined(var_b00c60a54d663ca2)) {
        trace = physics_raycast(start, end, content, ignore, 1, "physicsquery_closest", var_f6dbad2cd5a99bb1, var_b00c60a54d663ca2);
    } else {
        trace = physics_raycast(start, end, content, ignore, 1, "physicsquery_closest", var_f6dbad2cd5a99bb1);
    }
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x958
// Size: 0xd5
function ray_trace_get_all_results(start, end, ignore, contentoverride, getsurfacetype) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_raycast(start, end, content, ignore, 0, "physicsquery_all");
    if (isdefined(getsurfacetype) && getsurfacetype) {
        foreach (i, t in trace) {
            trace[i] = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa35
// Size: 0x4e
function ray_trace_passed(start, end, ignore, contentoverride) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    return !physics_raycast(start, end, content, ignore, 0, "physicsquery_any");
}

// Namespace trace / scripts/engine/trace
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8b
// Size: 0x4f
function ray_trace_detail_passed(start, end, ignore, contentoverride) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    return !physics_raycast(start, end, content, ignore, 1, "physicsquery_any");
}

// Namespace trace / scripts/engine/trace
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae2
// Size: 0x74
function can_see_origin(origin, test_characters) {
    /#
        assertex(isdefined(origin), "can_see_origin() requires a valid origin to be passed in.");
    #/
    /#
        assertex(isplayer(self) || isai(self), "can_see_origin() can only be called on a player or AI.");
    #/
    if (!isdefined(test_characters)) {
        test_characters = 1;
    }
    if (!math::point_in_fov(origin)) {
        return 0;
    }
    return ray_trace_passed(self geteye(), origin, self, scripts/engine/trace::create_contents(test_characters, 1, 0, 1, 0, 1));
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5e
// Size: 0xb7
function sphere_trace(start, end, radius, ignore, contentoverride, getsurfacetype, var_b00c60a54d663ca2) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_spherecast(start, end, radius, content, ignore, "physicsquery_closest", undefined, var_b00c60a54d663ca2);
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_trigger", start, end, radius);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1d
// Size: 0xbe
function sphere_trace_get_all_results(start, end, radius, ignore, contentoverride, getsurfacetype, var_b00c60a54d663ca2) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_spherecast(start, end, radius, content, ignore, "physicsquery_all", undefined, var_b00c60a54d663ca2);
    if (isdefined(getsurfacetype) && getsurfacetype) {
        for (i = 0; i < trace.size; i++) {
            trace[i] = convert_surface_flag(trace[i]);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_trigger", start, end, radius);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce3
// Size: 0x56
function sphere_trace_passed(start, end, radius, ignore, contentoverride) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    return !physics_spherecast(start, end, radius, content, ignore, "physicsquery_any");
}

// Namespace trace / scripts/engine/trace
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd41
// Size: 0xae
function sphere_get_closest_point(position, radius, search_distance, ignore, contentoverride, getsurfacetype) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_getclosestpointtosphere(position, radius, search_distance, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_trigger", position, undefined, radius, undefined, undefined, search_distance);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0x104
function capsule_trace(start, end, radius, height, angles, ignore, contentoverride, getsurfacetype) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_3ac658a13ffcbfb5 = convert_capsule_data(start, end, radius, height, angles);
    trace = physics_capsulecast(var_3ac658a13ffcbfb5["trace_start"], var_3ac658a13ffcbfb5["trace_end"], radius, var_3ac658a13ffcbfb5["half_height"], angles, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "radius", start, end, radius, height, angles);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xf03
// Size: 0x137
function capsule_trace_get_all_results(start, end, radius, height, angles, ignore, contentoverride, getsurfacetype) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_3ac658a13ffcbfb5 = convert_capsule_data(start, end, radius, height, angles);
    trace = physics_capsulecast(var_3ac658a13ffcbfb5["trace_start"], var_3ac658a13ffcbfb5["trace_end"], radius, var_3ac658a13ffcbfb5["half_height"], angles, content, ignore, "physicsquery_all");
    if (isdefined(getsurfacetype) && getsurfacetype) {
        foreach (t in trace) {
            t = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "radius", start, end, radius, height, angles);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1042
// Size: 0xa8
function capsule_trace_passed(start, end, radius, height, angles, ignore, contentoverride) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_3ac658a13ffcbfb5 = convert_capsule_data(start, end, radius, height, angles);
    return !physics_capsulecast(var_3ac658a13ffcbfb5["trace_start"], var_3ac658a13ffcbfb5["trace_end"], radius, var_3ac658a13ffcbfb5["half_height"], angles, content, ignore, "physicsquery_any");
}

// Namespace trace / scripts/engine/trace
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x10f2
// Size: 0xff
function capsule_get_closest_point(position, radius, height, angles, search_distance, ignore, contentoverride, getsurfacetype) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_3ac658a13ffcbfb5 = convert_capsule_data(position, undefined, radius, height, angles);
    trace = physics_getclosestpointtocapsule(var_3ac658a13ffcbfb5["trace_start"], radius, var_3ac658a13ffcbfb5["half_height"], angles, search_distance, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "radius", position, undefined, radius, height, angles, search_distance);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f9
// Size: 0xe9
function player_trace(start, end, angles, ignore, contentoverride, getsurfacetype, var_e98b3969bbe145d3) {
    if (!isplayer(self)) {
        /#
            assertmsg("player_trace can only be called on a player!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self getplayerangles();
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    if (!isdefined(var_e98b3969bbe145d3)) {
        var_e98b3969bbe145d3 = 0;
    }
    trace = physics_charactercast(start, end, self, var_e98b3969bbe145d3, angles, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x12ea
// Size: 0x11c
function player_trace_get_all_results(start, end, angles, ignore, contentoverride, getsurfacetype, var_e98b3969bbe145d3) {
    if (!isplayer(self)) {
        /#
            assertmsg("player_trace_get_all_results can only be called on a player!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self getplayerangles();
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    if (!isdefined(var_e98b3969bbe145d3)) {
        var_e98b3969bbe145d3 = 0;
    }
    trace = physics_charactercast(start, end, self, var_e98b3969bbe145d3, angles, content, ignore, "physicsquery_all");
    if (isdefined(getsurfacetype) && getsurfacetype) {
        foreach (t in trace) {
            t = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140e
// Size: 0x8e
function player_trace_passed(start, end, angles, ignore, contentoverride, var_e98b3969bbe145d3) {
    if (!isplayer(self)) {
        /#
            assertmsg("player_trace_passed can only be called on a player!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self getplayerangles();
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    if (!isdefined(var_e98b3969bbe145d3)) {
        var_e98b3969bbe145d3 = 0;
    }
    return !physics_charactercast(start, end, self, var_e98b3969bbe145d3, angles, content, ignore, "physicsquery_any");
}

// Namespace trace / scripts/engine/trace
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14a4
// Size: 0x40
function player_get_closest_point_static(search_distance, ignore, contentoverride, getsurfacetype) {
    return player_get_closest_point(self.origin, self.angles, search_distance, ignore, contentoverride, getsurfacetype);
}

// Namespace trace / scripts/engine/trace
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0xf8
function player_get_closest_point(position, angles, search_distance, ignore, contentoverride, getsurfacetype) {
    if (!isplayer(self)) {
        /#
            assertmsg("player_get_closest_point can only be called on a player!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self getplayerangles();
    }
    if (!isdefined(search_distance)) {
        search_distance = 0;
    }
    if (isarray(ignore)) {
        ignore = array_add(ignore, self);
    } else {
        ignore = self;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_getclosestpointtocharacter(position, self, 0, angles, search_distance, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", position, undefined, undefined, undefined, angles, search_distance, self);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x15ec
// Size: 0xec
function ai_trace(start, end, angles, ignore, contentoverride, getsurfacetype, var_e98b3969bbe145d3) {
    if (!isai(self)) {
        /#
            assertmsg("ai_trace can only be called on an AI!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self.angles;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_solid_ai_contents());
    if (!isdefined(var_e98b3969bbe145d3)) {
        var_e98b3969bbe145d3 = 0;
    }
    trace = physics_charactercast(start, end, self, var_e98b3969bbe145d3, angles, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0x11f
function ai_trace_get_all_results(start, end, angles, ignore, contentoverride, getsurfacetype, var_e98b3969bbe145d3) {
    if (!isai(self)) {
        /#
            assertmsg("ai_trace_get_all_results can only be called on an AI!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self.angles;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_solid_ai_contents());
    if (!isdefined(var_e98b3969bbe145d3)) {
        var_e98b3969bbe145d3 = 0;
    }
    trace = physics_charactercast(start, end, self, var_e98b3969bbe145d3, angles, content, ignore, "physicsquery_all");
    if (isdefined(getsurfacetype) && getsurfacetype) {
        foreach (t in trace) {
            t = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1807
// Size: 0x91
function ai_trace_passed(start, end, angles, ignore, contentoverride, var_e98b3969bbe145d3) {
    if (!isai(self)) {
        /#
            assertmsg("ai_trace can only be called on an AI!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self.angles;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_solid_ai_contents());
    if (!isdefined(var_e98b3969bbe145d3)) {
        var_e98b3969bbe145d3 = 0;
    }
    return !physics_charactercast(start, end, self, var_e98b3969bbe145d3, angles, content, ignore, "physicsquery_any");
}

// Namespace trace / scripts/engine/trace
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x18a0
// Size: 0xe2
function ai_get_closest_point(position, angles, search_distance, ignore, contentoverride, getsurfacetype) {
    if (!isai(self)) {
        /#
            assertmsg("ai_trace can only be called on an AI!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self.angles;
    }
    if (!isdefined(search_distance)) {
        search_distance = 0;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_solid_ai_contents());
    trace = physics_getclosestpointtocharacter(position, self, 0, angles, search_distance, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(getsurfacetype) && getsurfacetype) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", position, undefined, undefined, undefined, angles, search_distance, self);
    #/
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198a
// Size: 0x52
function create_solid_ai_contents(ignore_characters) {
    content = ["physicscontents_aiclip", "physicscontents_glass", "physicscontents_vehicle"];
    if (!isdefined(ignore_characters) || !ignore_characters) {
        content = array_add(content, "physicscontents_characterproxy");
    }
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e4
// Size: 0x39
function function_2d88cb1f022d0989() {
    content = ["physicscontents_solid", "physicscontents_playerclip", "physicscontents_characterproxy", "physicscontents_glass"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a25
// Size: 0x56
function create_opaque_ai_contents(ignore_character, ignore_foliage) {
    contents = ["physicscontents_ainosight", "physicscontents_vehicle"];
    if (!istrue(ignore_character)) {
        contents[contents.size] = "physicscontents_characterproxy";
    }
    if (!istrue(ignore_foliage)) {
        contents[contents.size] = "physicscontents_foliage";
    }
    return physics_createcontents(contents);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0x27
function function_416688b9ffe933c4() {
    contents = ["physicscontents_foliage", "physicscontents_foliage_audio"];
    return physics_createcontents(contents);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab2
// Size: 0x1e
function create_ainosight_contents() {
    content = ["physicscontents_ainosight"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad8
// Size: 0x27
function create_world_contents() {
    content = ["physicscontents_itemclip", "physicscontents_water"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b07
// Size: 0x12
function function_b88b8bd51ea7fe24() {
    return physics_createcontents(["physicscontents_water"]);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x1e
function create_glass_contents() {
    content = ["physicscontents_glass"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b47
// Size: 0x1e
function create_ainoshoot_contents() {
    content = ["physicscontents_ainoshoot"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6d
// Size: 0x1e
function create_item_contents() {
    content = ["physicscontents_item"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b93
// Size: 0x1e
function create_itemclip_contents() {
    content = ["physicscontents_itemclip"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb9
// Size: 0x1e
function create_vehicle_contents() {
    content = ["physicscontents_vehicle"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdf
// Size: 0x1e
function function_f3dae12daeb1e8bb() {
    content = ["physicscontents_vehicleclip"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c05
// Size: 0x27
function create_shotclip_contents() {
    content = ["physicscontents_clipshot", "physicscontents_missileclip"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c34
// Size: 0x1e
function create_playerclip_contents() {
    content = ["physicscontents_playerclip"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5a
// Size: 0x1e
function create_character_contents() {
    content = ["physicscontents_characterproxy"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c80
// Size: 0x1e
function function_95da3996aeae6098() {
    content = ["physicscontents_cameraclip"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca6
// Size: 0x25
function create_default_contents(ignore_characters) {
    if (!isdefined(ignore_characters)) {
        ignore_characters = 0;
    }
    return create_contents(!ignore_characters, 1, 1, 1, 0, 1);
}

// Namespace trace / scripts/engine/trace
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd3
// Size: 0x193
function create_contents(character, world, glass, shotclip, item, vehicle, playerclip, ainosight, itemclip, vehicleclip, waterclip, cameraclip) {
    content = 0;
    contentcache = isdefined(level.var_dd16da2ec35010ad) ? level.var_dd16da2ec35010ad : function_f00c9e807784481e();
    if (istrue(character)) {
        content = content + contentcache.character;
    }
    if (istrue(world)) {
        content = content + contentcache.world;
    }
    if (istrue(glass)) {
        content = content + contentcache.glass;
    }
    if (istrue(shotclip)) {
        content = content + contentcache.shotclip;
    }
    if (istrue(item)) {
        content = content + contentcache.item;
    }
    if (istrue(vehicle)) {
        content = content + contentcache.vehicle;
    }
    if (istrue(playerclip)) {
        content = content + contentcache.playerclip;
    }
    if (istrue(ainosight)) {
        content = content + contentcache.ainosight;
    }
    if (istrue(itemclip)) {
        content = content + contentcache.itemclip;
    }
    if (istrue(vehicleclip)) {
        content = content + contentcache.vehicleclip;
    }
    if (istrue(waterclip)) {
        content = content + contentcache.waterclip;
    }
    if (istrue(cameraclip)) {
        content = content + contentcache.cameraclip;
    }
    return content;
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6e
// Size: 0xca
function function_f00c9e807784481e() {
    level.var_dd16da2ec35010ad = {cameraclip:function_95da3996aeae6098(), waterclip:function_b88b8bd51ea7fe24(), vehicleclip:function_f3dae12daeb1e8bb(), itemclip:create_itemclip_contents(), ainosight:create_ainosight_contents(), playerclip:create_playerclip_contents(), vehicle:create_vehicle_contents(), item:create_item_contents(), shotclip:create_shotclip_contents(), glass:create_glass_contents(), world:create_world_contents(), character:create_character_contents()};
    return level.var_dd16da2ec35010ad;
}

// Namespace trace / scripts/engine/trace
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f40
// Size: 0xb7
function create_all_contents() {
    content = ["physicscontents_foliage", "physicscontents_foliage_audio", "physicscontents_edge", "physicscontents_glass", "physicscontents_water", "physicscontents_ainoshoot", "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicleclip", "physicscontents_itemclip", "physicscontents_ainosight", "physicscontents_clipshot", "physicscontents_characterproxy", "physicscontents_playerclip", "physicscontents_aiclip", "physicscontents_trigger", "physicscontents_vehicle", "physicscontents_useclip"];
    return physics_createcontents(content);
}

// Namespace trace / scripts/engine/trace
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fff
// Size: 0x42
function convert_surface_flag(trace) {
    var_ea126d64fbd440ef = physics_getsurfacetypefromflags(trace["surfaceflags"]);
    trace["surfaceindex"] = var_ea126d64fbd440ef["index"];
    trace["surfacetype"] = var_ea126d64fbd440ef["name"];
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2049
// Size: 0xbf
function convert_capsule_data(var_cc43f8a28dc3bc22, var_b26c88a9b9f4ef65, radius, height, angles) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    half_height = height * 0.5;
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    var_3ac658a13ffcbfb5 = [];
    var_3ac658a13ffcbfb5["trace_start"] = var_cc43f8a28dc3bc22 + up * half_height;
    if (isdefined(var_b26c88a9b9f4ef65)) {
        var_3ac658a13ffcbfb5["trace_end"] = var_b26c88a9b9f4ef65 + up * half_height;
    }
    var_3ac658a13ffcbfb5["radius"] = radius;
    var_3ac658a13ffcbfb5["angles"] = angles;
    var_3ac658a13ffcbfb5["half_height"] = half_height;
    return var_3ac658a13ffcbfb5;
}

// Namespace trace / scripts/engine/trace
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2110
// Size: 0xd4
function draw_trace(trace, color, display_details, duration) {
    /#
        if (!isdefined(trace)) {
            return;
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (isdefined(trace["<unknown string>"])) {
            draw_trace_type(trace["<unknown string>"], color, duration);
        }
        if (isdefined(trace[0])) {
            foreach (t in trace) {
                thread draw_trace_hit(t, trace["<unknown string>"], color, display_details, duration);
            }
            return;
        }
        thread draw_trace_hit(trace, trace["<unknown string>"], color, display_details, duration);
    #/
}

// Namespace trace / scripts/engine/trace
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x21eb
// Size: 0x3d2
function draw_trace_hit(trace, var_42ef1b9ce9e7de9c, color, display_details, duration) {
    /#
        if (!isdefined(duration)) {
            duration = 1;
        }
        if (isdefined(trace["<unknown string>"])) {
            half_color = color * 0.25;
            is_white = gettime() / 50 / 2 == int(gettime() / 50 / 2);
            if (is_white) {
                color = (1, 1, 1);
            }
            sphere(trace["<unknown string>"], 5, color, 1, duration);
            line(trace["<unknown string>"], trace["<unknown string>"] + trace["<unknown string>"] * 15, color, 1, 1, duration);
            if (isdefined(display_details) && display_details) {
                cam_angles = level.player getplayerangles();
                cam_up = anglestoup(cam_angles);
                text_scale = 0.25;
                new_line = 11 * text_scale;
                normal_len = 15;
                if (isdefined(trace["<unknown string>"])) {
                    normal_len = trace["<unknown string>"];
                }
                text_pos = trace["<unknown string>"] + trace["<unknown string>"] * normal_len;
                print3d(text_pos, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, text_scale, duration);
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - cam_up * new_line * 1, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, text_scale, duration);
                } else {
                    print3d(text_pos - cam_up * new_line * 1, "<unknown string>", (1, 1, 1), 1, text_scale, duration);
                }
                print3d(text_pos - cam_up * new_line * 2, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, text_scale, duration);
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - cam_up * new_line * 3, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, text_scale, duration);
                } else if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - cam_up * new_line * 3, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, text_scale, duration);
                } else {
                    print3d(text_pos - cam_up * new_line * 3, "<unknown string>", (1, 1, 1), 1, text_scale, duration);
                }
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - cam_up * new_line * 4, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, text_scale, duration);
                } else {
                    print3d(text_pos - cam_up * new_line * 4, "<unknown string>", (1, 1, 1), 1, text_scale, duration);
                }
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - cam_up * new_line * 5, "<unknown string>", (1, 1, 1), 1, text_scale, duration);
                    print3d(text_pos - cam_up * new_line * 6, "<unknown string>" + trace["<unknown string>"] getentitynumber(), (1, 1, 1), 1, text_scale, duration);
                    print3d(text_pos - cam_up * new_line * 7, "<unknown string>" + trace["<unknown string>"].classname, (1, 1, 1), 1, text_scale, duration);
                    return;
                }
                print3d(text_pos - cam_up * new_line * 5, "<unknown string>", (1, 1, 1), 1, text_scale, duration);
            }
        }
    #/
}

// Namespace trace / scripts/engine/trace
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25c4
// Size: 0x3b6
function draw_trace_type(debugdata, color, duration) {
    /#
        if (!isdefined(duration)) {
            duration = 1;
        }
        half_color = color * 0.75;
        no_color = color * 0.1;
        start = debugdata["<unknown string>"];
        if (debugdata["<unknown string>"] == "physicscontents_ainoshoot") {
            end = debugdata["<unknown string>"];
            dist = distance(debugdata["<unknown string>"], debugdata["<unknown string>"]);
            sphere(start, 0.15, no_color, 1, duration);
            sphere(end, 0.15, half_color, 1, duration);
            line(start, end, no_color, 1, 0, duration);
            line(start, end, half_color, 1, 1, duration);
            return;
        }
        if (debugdata["<unknown string>"] == "physicscontents_trigger") {
            radius = debugdata["<unknown string>"];
            if (isdefined(debugdata["<unknown string>"])) {
                end = debugdata["<unknown string>"];
                dist = distance(debugdata["<unknown string>"], debugdata["<unknown string>"]);
                count = max(ceil(dist / 128), 1);
                for (i = 0; i <= count; i++) {
                    sphere(vectorlerp(start, end, i / count), radius, no_color, 0, duration);
                    sphere(vectorlerp(start, end, i / count), radius, half_color, 1, duration);
                }
                line(start, end, no_color, 1, 0, duration);
                line(start, end, half_color, 1, 1, duration);
            } else {
                sphere(start, radius, no_color, 0, duration);
                sphere(start, radius, half_color, 1, duration);
            }
            return;
        }
        if (debugdata["<unknown string>"] == "radius" || debugdata["<unknown string>"] == "hittype_none") {
            if (debugdata["<unknown string>"] == "hittype_none" & isdefined(debugdata["hittype_none"])) {
                angles = debugdata["<unknown string>"];
                var_3ac658a13ffcbfb5 = debugdata["hittype_none"] physics_getcharactercollisioncapsule();
                radius = var_3ac658a13ffcbfb5["<unknown string>"];
                height = var_3ac658a13ffcbfb5["<unknown string>"] * 2;
            } else {
                radius = debugdata["<unknown string>"];
                angles = debugdata["<unknown string>"];
                height = debugdata["<unknown string>"];
            }
            if (isdefined(debugdata["<unknown string>"])) {
                end = debugdata["<unknown string>"];
                dist = distance(debugdata["<unknown string>"], debugdata["<unknown string>"]);
                count = max(ceil(dist / 128), 1);
                for (i = 0; i <= count; i++) {
                    draw_capsule(vectorlerp(start, end, i / count), radius, height, angles, no_color, 0, duration);
                    draw_capsule(vectorlerp(start, end, i / count), radius, height, angles, half_color, 1, duration);
                }
                up = anglestoup(angles);
                start_top = start + up * height;
                end_top = end + up * height;
                line(start, end, no_color, 1, 0, duration);
                line(start, end, half_color, 1, 1, duration);
                line(start_top, end_top, no_color, 1, 0, duration);
                line(start_top, end_top, half_color, 1, 1, duration);
                return;
            }
            draw_capsule(start, radius, height, angles, no_color, 0);
        }
    #/
}

// Namespace trace / scripts/engine/trace
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2981
// Size: 0x7e
function internal_pack_default_trace(pos) {
    trace = [];
    trace["fraction"] = 1;
    trace["surfaceflags"] = 0;
    trace["distance"] = 0;
    trace["position"] = pos;
    trace["shape_position"] = pos;
    trace["normal"] = (0, 0, 0);
    trace["contact_normal"] = (0, 0, 0);
    trace["hittype"] = "hittype_none";
    return trace;
}

// Namespace trace / scripts/engine/trace
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x2a07
// Size: 0xcc
function internal_create_debug_data(trace, type, start, end, radius, height, angles, search_distance, character) {
    /#
        trace["<unknown string>"]["<unknown string>"] = type;
        trace["<unknown string>"]["<unknown string>"] = start;
        trace["<unknown string>"]["<unknown string>"] = end;
        trace["<unknown string>"]["<unknown string>"] = radius;
        trace["<unknown string>"]["<unknown string>"] = height;
        trace["<unknown string>"]["<unknown string>"] = angles;
        trace["<unknown string>"]["<unknown string>"] = search_distance;
        trace["<unknown string>"]["hittype_none"] = character;
        return trace;
    #/
}

