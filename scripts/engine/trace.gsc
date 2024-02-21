// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace trace;

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505
// Size: 0xa9
function ray_trace(start, end, ignore, contentoverride, var_ef65bf3909d178e, ignoreclutter, var_b00c60a54d663ca2) {
    trace = physics_raycast(start, end, isdefined(contentoverride) ? create_default_contents() : contentoverride, ignore, 0, "physicsquery_closest", istrue(ignoreclutter), var_b00c60a54d663ca2);
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0xc1
function ray_trace_ents(start, end, ents, contentoverride, var_ef65bf3909d178e, ignoreclutter) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_f6dbad2cd5a99bb1 = ter_op(isdefined(ignoreclutter), ignoreclutter, 0);
    trace = physics_raycastents(start, end, content, ents, 0, "physicsquery_closest", var_f6dbad2cd5a99bb1);
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f
// Size: 0x86
function function_559be9820cd98ca4(var_1bfa180c6fdd09dd, var_ef65bf3909d178e, ignoreclutter, var_b00c60a54d663ca2) {
    if (!isdefined(var_1bfa180c6fdd09dd)) {
        var_1bfa180c6fdd09dd = create_all_contents();
    }
    if (!isdefined(var_ef65bf3909d178e)) {
        var_ef65bf3909d178e = 1;
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
    return ray_trace(self geteye(), self geteye() + anglestoforward(self getplayerangles()) * 10000, self, var_1bfa180c6fdd09dd, var_ef65bf3909d178e, ignoreclutter, var_b00c60a54d663ca2);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x114
function _bullet_trace(start, end, var_64e45ce4584053a6, ignore, itemclip, var_45ab9428a87b2b9f, var_c368ea2402a6a1ad, var_8812897bd00bf028, var_62d3dae92d988367) {
    content = [0:"physicscontents_clipshot", 1:"physicscontents_water", 2:"physicscontents_vehicle", 3:"physicscontents_item"];
    if (var_64e45ce4584053a6) {
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
    if (!isdefined(var_62d3dae92d988367) || var_62d3dae92d988367) {
        content[content.size] = "physicscontents_glass";
    }
    if (isdefined(var_45ab9428a87b2b9f) && var_45ab9428a87b2b9f) {
        return ray_trace_detail(start, end, ignore, physics_createcontents(content), 1);
    } else {
        return ray_trace(start, end, ignore, physics_createcontents(content), 1);
    }
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x35
function _bullet_trace_passed(start, end, var_64e45ce4584053a6, ignore) {
    return ray_trace_passed(start, end, ignore, create_default_contents(!var_64e45ce4584053a6));
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x865
// Size: 0xeb
function ray_trace_detail(start, end, ignore, contentoverride, var_ef65bf3909d178e, ignoreclutter, var_b00c60a54d663ca2) {
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
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x958
// Size: 0xd5
function ray_trace_get_all_results(start, end, ignore, contentoverride, var_ef65bf3909d178e) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_raycast(start, end, content, ignore, 0, "physicsquery_all");
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        foreach (i, t in trace) {
            trace[i] = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_ainoshoot", start, end);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa35
// Size: 0x4e
function ray_trace_passed(start, end, ignore, contentoverride) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    return !physics_raycast(start, end, content, ignore, 0, "physicsquery_any");
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8b
// Size: 0x4f
function ray_trace_detail_passed(start, end, ignore, contentoverride) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    return !physics_raycast(start, end, content, ignore, 1, "physicsquery_any");
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae2
// Size: 0x74
function can_see_origin(origin, var_ebb58ca93d8fb272) {
    /#
        assertex(isdefined(origin), "can_see_origin() requires a valid origin to be passed in.");
    #/
    /#
        assertex(isplayer(self) || isai(self), "can_see_origin() can only be called on a player or AI.");
    #/
    if (!isdefined(var_ebb58ca93d8fb272)) {
        var_ebb58ca93d8fb272 = 1;
    }
    if (!math::point_in_fov(origin)) {
        return 0;
    }
    return ray_trace_passed(self geteye(), origin, self, namespace_2a184fc4902783dc::create_contents(var_ebb58ca93d8fb272, 1, 0, 1, 0, 1));
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5e
// Size: 0xb7
function sphere_trace(start, end, radius, ignore, contentoverride, var_ef65bf3909d178e, var_b00c60a54d663ca2) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_spherecast(start, end, radius, content, ignore, "physicsquery_closest", undefined, var_b00c60a54d663ca2);
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(end);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_trigger", start, end, radius);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1d
// Size: 0xbe
function sphere_trace_get_all_results(start, end, radius, ignore, contentoverride, var_ef65bf3909d178e, var_b00c60a54d663ca2) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_spherecast(start, end, radius, content, ignore, "physicsquery_all", undefined, var_b00c60a54d663ca2);
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        for (i = 0; i < trace.size; i++) {
            trace[i] = convert_surface_flag(trace[i]);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_trigger", start, end, radius);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce3
// Size: 0x56
function sphere_trace_passed(start, end, radius, ignore, contentoverride) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    return !physics_spherecast(start, end, radius, content, ignore, "physicsquery_any");
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd41
// Size: 0xae
function sphere_get_closest_point(position, radius, var_be3f10a856eec49d, ignore, contentoverride, var_ef65bf3909d178e) {
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_getclosestpointtosphere(position, radius, var_be3f10a856eec49d, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "physicscontents_trigger", position, undefined, radius, undefined, undefined, var_be3f10a856eec49d);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0x104
function capsule_trace(start, end, radius, height, angles, ignore, contentoverride, var_ef65bf3909d178e) {
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
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "radius", start, end, radius, height, angles);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xf03
// Size: 0x137
function capsule_trace_get_all_results(start, end, radius, height, angles, ignore, contentoverride, var_ef65bf3909d178e) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_3ac658a13ffcbfb5 = convert_capsule_data(start, end, radius, height, angles);
    trace = physics_capsulecast(var_3ac658a13ffcbfb5["trace_start"], var_3ac658a13ffcbfb5["trace_end"], radius, var_3ac658a13ffcbfb5["half_height"], angles, content, ignore, "physicsquery_all");
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        foreach (t in trace) {
            t = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "radius", start, end, radius, height, angles);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
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

// Namespace trace/namespace_2a184fc4902783dc
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x10f2
// Size: 0xff
function capsule_get_closest_point(position, radius, height, angles, var_be3f10a856eec49d, ignore, contentoverride, var_ef65bf3909d178e) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    var_3ac658a13ffcbfb5 = convert_capsule_data(position, undefined, radius, height, angles);
    trace = physics_getclosestpointtocapsule(var_3ac658a13ffcbfb5["trace_start"], radius, var_3ac658a13ffcbfb5["half_height"], angles, var_be3f10a856eec49d, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "radius", position, undefined, radius, height, angles, var_be3f10a856eec49d);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f9
// Size: 0xe9
function player_trace(start, end, angles, ignore, contentoverride, var_ef65bf3909d178e, var_e98b3969bbe145d3) {
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
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x12ea
// Size: 0x11c
function player_trace_get_all_results(start, end, angles, ignore, contentoverride, var_ef65bf3909d178e, var_e98b3969bbe145d3) {
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
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        foreach (t in trace) {
            t = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
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

// Namespace trace/namespace_2a184fc4902783dc
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14a4
// Size: 0x40
function player_get_closest_point_static(var_be3f10a856eec49d, ignore, contentoverride, var_ef65bf3909d178e) {
    return player_get_closest_point(self.origin, self.angles, var_be3f10a856eec49d, ignore, contentoverride, var_ef65bf3909d178e);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0xf8
function player_get_closest_point(position, angles, var_be3f10a856eec49d, ignore, contentoverride, var_ef65bf3909d178e) {
    if (!isplayer(self)) {
        /#
            assertmsg("player_get_closest_point can only be called on a player!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self getplayerangles();
    }
    if (!isdefined(var_be3f10a856eec49d)) {
        var_be3f10a856eec49d = 0;
    }
    if (isarray(ignore)) {
        ignore = array_add(ignore, self);
    } else {
        ignore = self;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_default_contents());
    trace = physics_getclosestpointtocharacter(position, self, 0, angles, var_be3f10a856eec49d, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", position, undefined, undefined, undefined, angles, var_be3f10a856eec49d, self);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x15ec
// Size: 0xec
function ai_trace(start, end, angles, ignore, contentoverride, var_ef65bf3909d178e, var_e98b3969bbe145d3) {
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
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0x11f
function ai_trace_get_all_results(start, end, angles, ignore, contentoverride, var_ef65bf3909d178e, var_e98b3969bbe145d3) {
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
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        foreach (t in trace) {
            t = convert_surface_flag(t);
        }
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", start, end, undefined, undefined, angles, undefined, self);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
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

// Namespace trace/namespace_2a184fc4902783dc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x18a0
// Size: 0xe2
function ai_get_closest_point(position, angles, var_be3f10a856eec49d, ignore, contentoverride, var_ef65bf3909d178e) {
    if (!isai(self)) {
        /#
            assertmsg("ai_trace can only be called on an AI!");
        #/
        return;
    }
    if (!isdefined(angles)) {
        angles = self.angles;
    }
    if (!isdefined(var_be3f10a856eec49d)) {
        var_be3f10a856eec49d = 0;
    }
    content = ter_op(isdefined(contentoverride), contentoverride, create_solid_ai_contents());
    trace = physics_getclosestpointtocharacter(position, self, 0, angles, var_be3f10a856eec49d, content, ignore, "physicsquery_closest");
    if (trace.size) {
        trace = trace[0];
    } else {
        trace = internal_pack_default_trace(position);
    }
    if (isdefined(var_ef65bf3909d178e) && var_ef65bf3909d178e) {
        trace = convert_surface_flag(trace);
    }
    /#
        trace = internal_create_debug_data(trace, "hittype_none", position, undefined, undefined, undefined, angles, var_be3f10a856eec49d, self);
    #/
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198a
// Size: 0x52
function create_solid_ai_contents(var_29478236719cfd44) {
    content = [0:"physicscontents_aiclip", 1:"physicscontents_glass", 2:"physicscontents_vehicle"];
    if (!isdefined(var_29478236719cfd44) || !var_29478236719cfd44) {
        content = array_add(content, "physicscontents_characterproxy");
    }
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e4
// Size: 0x39
function function_2d88cb1f022d0989() {
    content = [0:"physicscontents_solid", 1:"physicscontents_playerclip", 2:"physicscontents_characterproxy", 3:"physicscontents_glass"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a25
// Size: 0x56
function create_opaque_ai_contents(var_a7089085c7d171df, var_9575abc4fbaafed3) {
    contents = [0:"physicscontents_ainosight", 1:"physicscontents_vehicle"];
    if (!istrue(var_a7089085c7d171df)) {
        contents[contents.size] = "physicscontents_characterproxy";
    }
    if (!istrue(var_9575abc4fbaafed3)) {
        contents[contents.size] = "physicscontents_foliage";
    }
    return physics_createcontents(contents);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0x27
function function_416688b9ffe933c4() {
    contents = [0:"physicscontents_foliage", 1:"physicscontents_foliage_audio"];
    return physics_createcontents(contents);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab2
// Size: 0x1e
function create_ainosight_contents() {
    content = [0:"physicscontents_ainosight"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad8
// Size: 0x27
function create_world_contents() {
    content = [0:"physicscontents_itemclip", 1:"physicscontents_water"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b07
// Size: 0x12
function function_b88b8bd51ea7fe24() {
    return physics_createcontents([0:"physicscontents_water"]);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x1e
function create_glass_contents() {
    content = [0:"physicscontents_glass"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b47
// Size: 0x1e
function create_ainoshoot_contents() {
    content = [0:"physicscontents_ainoshoot"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6d
// Size: 0x1e
function create_item_contents() {
    content = [0:"physicscontents_item"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b93
// Size: 0x1e
function create_itemclip_contents() {
    content = [0:"physicscontents_itemclip"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb9
// Size: 0x1e
function create_vehicle_contents() {
    content = [0:"physicscontents_vehicle"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdf
// Size: 0x1e
function function_f3dae12daeb1e8bb() {
    content = [0:"physicscontents_vehicleclip"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c05
// Size: 0x27
function create_shotclip_contents() {
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c34
// Size: 0x1e
function create_playerclip_contents() {
    content = [0:"physicscontents_playerclip"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5a
// Size: 0x1e
function create_character_contents() {
    content = [0:"physicscontents_characterproxy"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c80
// Size: 0x1e
function function_95da3996aeae6098() {
    content = [0:"physicscontents_cameraclip"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca6
// Size: 0x25
function create_default_contents(var_29478236719cfd44) {
    if (!isdefined(var_29478236719cfd44)) {
        var_29478236719cfd44 = 0;
    }
    return create_contents(!var_29478236719cfd44, 1, 1, 1, 0, 1);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd3
// Size: 0x193
function create_contents(character, world, glass, var_97d66cb843a8ec8f, item, vehicle, playerclip, ainosight, itemclip, vehicleclip, var_f5dbb25343a6de9a, var_320b652e6238032c) {
    content = 0;
    var_8f251dbf8f0c66f4 = isdefined(level.var_dd16da2ec35010ad) ? function_f00c9e807784481e() : level.var_dd16da2ec35010ad;
    if (istrue(character)) {
        content = content + var_8f251dbf8f0c66f4.character;
    }
    if (istrue(world)) {
        content = content + var_8f251dbf8f0c66f4.world;
    }
    if (istrue(glass)) {
        content = content + var_8f251dbf8f0c66f4.glass;
    }
    if (istrue(var_97d66cb843a8ec8f)) {
        content = content + var_8f251dbf8f0c66f4.var_97d66cb843a8ec8f;
    }
    if (istrue(item)) {
        content = content + var_8f251dbf8f0c66f4.item;
    }
    if (istrue(vehicle)) {
        content = content + var_8f251dbf8f0c66f4.vehicle;
    }
    if (istrue(playerclip)) {
        content = content + var_8f251dbf8f0c66f4.playerclip;
    }
    if (istrue(ainosight)) {
        content = content + var_8f251dbf8f0c66f4.ainosight;
    }
    if (istrue(itemclip)) {
        content = content + var_8f251dbf8f0c66f4.itemclip;
    }
    if (istrue(vehicleclip)) {
        content = content + var_8f251dbf8f0c66f4.vehicleclip;
    }
    if (istrue(var_f5dbb25343a6de9a)) {
        content = content + var_8f251dbf8f0c66f4.var_f5dbb25343a6de9a;
    }
    if (istrue(var_320b652e6238032c)) {
        content = content + var_8f251dbf8f0c66f4.var_320b652e6238032c;
    }
    return content;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6e
// Size: 0xca
function function_f00c9e807784481e() {
    level.var_dd16da2ec35010ad = {var_320b652e6238032c:function_95da3996aeae6098(), var_f5dbb25343a6de9a:function_b88b8bd51ea7fe24(), vehicleclip:function_f3dae12daeb1e8bb(), itemclip:create_itemclip_contents(), ainosight:create_ainosight_contents(), playerclip:create_playerclip_contents(), vehicle:create_vehicle_contents(), item:create_item_contents(), var_97d66cb843a8ec8f:create_shotclip_contents(), glass:create_glass_contents(), world:create_world_contents(), character:create_character_contents()};
    return level.var_dd16da2ec35010ad;
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f40
// Size: 0xb7
function create_all_contents() {
    content = [0:"physicscontents_foliage", 1:"physicscontents_foliage_audio", 2:"physicscontents_edge", 3:"physicscontents_glass", 4:"physicscontents_water", 5:"physicscontents_ainoshoot", 6:"physicscontents_missileclip", 7:"physicscontents_item", 8:"physicscontents_vehicleclip", 9:"physicscontents_itemclip", 10:"physicscontents_ainosight", 11:"physicscontents_clipshot", 12:"physicscontents_characterproxy", 13:"physicscontents_playerclip", 14:"physicscontents_aiclip", 15:"physicscontents_trigger", 16:"physicscontents_vehicle", 17:"physicscontents_useclip"];
    return physics_createcontents(content);
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fff
// Size: 0x42
function convert_surface_flag(trace) {
    var_ea126d64fbd440ef = physics_getsurfacetypefromflags(trace["surfaceflags"]);
    trace["surfaceindex"] = var_ea126d64fbd440ef["index"];
    trace["surfacetype"] = var_ea126d64fbd440ef["name"];
    return trace;
}

// Namespace trace/namespace_2a184fc4902783dc
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

// Namespace trace/namespace_2a184fc4902783dc
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2110
// Size: 0xd4
function draw_trace(trace, color, var_16ea998b9d34c9e0, duration) {
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
                thread draw_trace_hit(t, trace["<unknown string>"], color, var_16ea998b9d34c9e0, duration);
            }
        } else {
            thread draw_trace_hit(trace, trace["<unknown string>"], color, var_16ea998b9d34c9e0, duration);
        }
    #/
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x21eb
// Size: 0x3d2
function draw_trace_hit(trace, var_42ef1b9ce9e7de9c, color, var_16ea998b9d34c9e0, duration) {
    /#
        if (!isdefined(duration)) {
            duration = 1;
        }
        if (isdefined(trace["<unknown string>"])) {
            var_7afb60bd49503ae0 = color * 0.25;
            var_9407f5ee9a4c7957 = gettime() / 50 / 2 == int(gettime() / 50 / 2);
            if (var_9407f5ee9a4c7957) {
                color = (1, 1, 1);
            }
            sphere(trace["<unknown string>"], 5, color, 1, duration);
            line(trace["<unknown string>"], trace["<unknown string>"] + trace["<unknown string>"] * 15, color, 1, 1, duration);
            if (isdefined(var_16ea998b9d34c9e0) && var_16ea998b9d34c9e0) {
                cam_angles = level.player getplayerangles();
                var_b6f793785d0221d0 = anglestoup(cam_angles);
                var_606bf7a0c0297e47 = 0.25;
                var_5fe8853a9d295b8c = 11 * var_606bf7a0c0297e47;
                var_c3351f707d22ddc2 = 15;
                if (isdefined(trace["<unknown string>"])) {
                    var_c3351f707d22ddc2 = trace["<unknown string>"];
                }
                text_pos = trace["<unknown string>"] + trace["<unknown string>"] * var_c3351f707d22ddc2;
                print3d(text_pos, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 1, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                } else {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 1, "<unknown string>", (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                }
                print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 2, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 3, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                } else if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 3, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                } else {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 3, "<unknown string>", (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                }
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 4, "<unknown string>" + trace["<unknown string>"], (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                } else {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 4, "<unknown string>", (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                }
                if (isdefined(trace["<unknown string>"])) {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 5, "<unknown string>", (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 6, "<unknown string>" + trace["<unknown string>"] getentitynumber(), (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 7, "<unknown string>" + trace["<unknown string>"].classname, (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                } else {
                    print3d(text_pos - var_b6f793785d0221d0 * var_5fe8853a9d295b8c * 5, "<unknown string>", (1, 1, 1), 1, var_606bf7a0c0297e47, duration);
                }
            }
        }
    #/
}

// Namespace trace/namespace_2a184fc4902783dc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25c4
// Size: 0x3b6
function draw_trace_type(debugdata, color, duration) {
    /#
        if (!isdefined(duration)) {
            duration = 1;
        }
        var_7afb60bd49503ae0 = color * 0.75;
        var_7ab9fea52ffb405a = color * 0.1;
        start = debugdata["<unknown string>"];
        if (debugdata["<unknown string>"] == "physicscontents_ainoshoot") {
            end = debugdata["<unknown string>"];
            dist = distance(debugdata["<unknown string>"], debugdata["<unknown string>"]);
            sphere(start, 0.15, var_7ab9fea52ffb405a, 1, duration);
            sphere(end, 0.15, var_7afb60bd49503ae0, 1, duration);
            line(start, end, var_7ab9fea52ffb405a, 1, 0, duration);
            line(start, end, var_7afb60bd49503ae0, 1, 1, duration);
        } else if (debugdata["<unknown string>"] == "physicscontents_trigger") {
            radius = debugdata["<unknown string>"];
            if (isdefined(debugdata["<unknown string>"])) {
                end = debugdata["<unknown string>"];
                dist = distance(debugdata["<unknown string>"], debugdata["<unknown string>"]);
                count = max(ceil(dist / 128), 1);
                for (i = 0; i <= count; i++) {
                    sphere(vectorlerp(start, end, i / count), radius, var_7ab9fea52ffb405a, 0, duration);
                    sphere(vectorlerp(start, end, i / count), radius, var_7afb60bd49503ae0, 1, duration);
                }
                line(start, end, var_7ab9fea52ffb405a, 1, 0, duration);
                line(start, end, var_7afb60bd49503ae0, 1, 1, duration);
            } else {
                sphere(start, radius, var_7ab9fea52ffb405a, 0, duration);
                sphere(start, radius, var_7afb60bd49503ae0, 1, duration);
            }
        } else if (debugdata["<unknown string>"] == "radius" || debugdata["<unknown string>"] == "hittype_none") {
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
                    draw_capsule(vectorlerp(start, end, i / count), radius, height, angles, var_7ab9fea52ffb405a, 0, duration);
                    draw_capsule(vectorlerp(start, end, i / count), radius, height, angles, var_7afb60bd49503ae0, 1, duration);
                }
                up = anglestoup(angles);
                var_9994be7b8262d017 = start + up * height;
                var_eefa5a9c2b6a5142 = end + up * height;
                line(start, end, var_7ab9fea52ffb405a, 1, 0, duration);
                line(start, end, var_7afb60bd49503ae0, 1, 1, duration);
                line(var_9994be7b8262d017, var_eefa5a9c2b6a5142, var_7ab9fea52ffb405a, 1, 0, duration);
                line(var_9994be7b8262d017, var_eefa5a9c2b6a5142, var_7afb60bd49503ae0, 1, 1, duration);
            } else {
                draw_capsule(start, radius, height, angles, var_7ab9fea52ffb405a, 0);
            }
        }
    #/
}

// Namespace trace/namespace_2a184fc4902783dc
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

// Namespace trace/namespace_2a184fc4902783dc
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x2a07
// Size: 0xcc
function internal_create_debug_data(trace, type, start, end, radius, height, angles, var_be3f10a856eec49d, character) {
    /#
        trace["<unknown string>"]["<unknown string>"] = type;
        trace["<unknown string>"]["<unknown string>"] = start;
        trace["<unknown string>"]["<unknown string>"] = end;
        trace["<unknown string>"]["<unknown string>"] = radius;
        trace["<unknown string>"]["<unknown string>"] = height;
        trace["<unknown string>"]["<unknown string>"] = angles;
        trace["<unknown string>"]["<unknown string>"] = var_be3f10a856eec49d;
        trace["<unknown string>"]["hittype_none"] = character;
        return trace;
    #/
}

