// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_383c80ef68455090;

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe7
// Size: 0x52e
function astar_get_path(var_e032318567f8afcd, start_pos, end_pos, exclude, var_6ee6c2ca7c64e9c9, var_acf81f9900be7297) {
    if (!isdefined(var_acf81f9900be7297)) {
        var_acf81f9900be7297 = 1024;
    }
    if (!isdefined(exclude)) {
        exclude = [];
    }
    var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_vehicleclip", 2:"physicscontents_missileclip", 3:"physicscontents_clipshot"]);
    node_grid = [];
    foreach (node in var_e032318567f8afcd) {
        if (!node_is_valid(node, exclude, var_1bfa180c6fdd09dd)) {
            continue;
        }
        node_grid[node_grid.size] = node;
    }
    if (isdefined(var_6ee6c2ca7c64e9c9) && node_is_valid(var_6ee6c2ca7c64e9c9, exclude, var_1bfa180c6fdd09dd)) {
        node_grid[node_grid.size] = var_6ee6c2ca7c64e9c9;
    }
    start_node = getclosest(start_pos, node_grid);
    end_node = getclosest(end_pos, node_grid);
    if (distancesquared(start_node.origin, end_node.origin) < 256) {
        return undefined;
    }
    nodes_set_children(node_grid, start_node, exclude, var_acf81f9900be7297);
    var_162b3e05faa30992 = [];
    var_162b3e05faa30992[var_162b3e05faa30992.size] = start_node;
    start_node.open = 1;
    start_node.closed = 0;
    while (var_162b3e05faa30992.size > 0) {
        current_node = var_162b3e05faa30992[var_162b3e05faa30992.size - 1];
        for (i = 0; i < var_162b3e05faa30992.size; i++) {
            if (var_162b3e05faa30992[i].f < current_node.f) {
                current_node = var_162b3e05faa30992[i];
            }
        }
        if (current_node == end_node) {
            path = [];
            current = current_node;
            while (isdefined(current)) {
                path[path.size] = current;
                if (!isdefined(current.parent)) {
                    break;
                }
                current = current.parent;
            }
            data = spawnstruct();
            data.path = array_reverse(path);
            data.end_node = end_node;
            data.start_node = start_node;
            return data;
        } else {
            var_162b3e05faa30992 = array_remove(var_162b3e05faa30992, current_node);
            current_node.closed = 1;
            current_node.open = 0;
            if (!isdefined(current_node.children)) {
                continue;
            }
            for (i = 0; i < current_node.children.size; i++) {
                current_node.children[i].g = current_node.g + distance(start_node.origin, current_node.children[i].origin);
                current_node.children[i].h = distance(end_node.origin, current_node.children[i].origin);
                current_node.children[i].f = current_node.children[i].g + current_node.children[i].h;
                if (current_node.children[i].f < current_node.f && current_node.children[i].closed) {
                    continue;
                } else if (current_node.f < current_node.children[i].f && current_node.children[i].open) {
                    continue;
                } else if (!current_node.children[i].open && !current_node.children[i].closed) {
                    if (!node_cansee_child(current_node.children[i], current_node, exclude, var_1bfa180c6fdd09dd)) {
                        /#
                            if (getdvar(@"hash_f9d938304e5a0a21") != "<unknown string>") {
                                line(current_node.origin, current_node.children[i].origin, (1, 0, 0), 1, 0, 20);
                            }
                        #/
                    } else {
                        var_162b3e05faa30992[var_162b3e05faa30992.size] = current_node.children[i];
                        current_node.children[i].parent = current_node;
                        current_node.children[i].open = 1;
                        current_node.children[i].closed = 0;
                    }
                }
            }
        }
    }
}

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x61c
// Size: 0xa2
function nodes_set_children(var_2aad46d2df2bce53, start_node, exclude, var_acf81f9900be7297) {
    for (i = 0; i < var_2aad46d2df2bce53.size; i++) {
        var_2aad46d2df2bce53[i].g = 0;
        var_2aad46d2df2bce53[i].h = 0;
        var_2aad46d2df2bce53[i].f = 0;
        var_2aad46d2df2bce53[i].parent = undefined;
        var_2aad46d2df2bce53[i].open = 0;
        var_2aad46d2df2bce53[i].closed = 0;
        node_set_children(var_2aad46d2df2bce53[i], var_2aad46d2df2bce53, start_node, var_acf81f9900be7297);
    }
}

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6c5
// Size: 0x5c
function node_set_children(node, var_c6736586ae30f7ea, start_node, var_acf81f9900be7297) {
    exclude = [0:node, 1:start_node];
    children = node_get_children(node, var_c6736586ae30f7ea, var_acf81f9900be7297, exclude);
    node.children = children;
}

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x728
// Size: 0x116
function node_get_children(node, var_c6736586ae30f7ea, var_acf81f9900be7297, excluders) {
    if (!isdefined(excluders)) {
        excluders = [];
    }
    max_dist_sq = squared(var_acf81f9900be7297);
    var_c6736586ae30f7ea = sortbydistance(var_c6736586ae30f7ea, node.origin);
    children = [];
    for (i = 0; i < var_c6736586ae30f7ea.size; i++) {
        excluded = 0;
        for (j = 0; j < excluders.size; j++) {
            if (var_c6736586ae30f7ea[i] == excluders[j]) {
                excluded = 1;
                break;
            }
        }
        if (excluded) {
            continue;
        }
        if (isdefined(var_c6736586ae30f7ea[i].radius)) {
            max_dist_sq = squared(var_c6736586ae30f7ea[i].radius);
        }
        dist_sq = distancesquared(node.origin, var_c6736586ae30f7ea[i].origin);
        if (dist_sq > max_dist_sq) {
            break;
        }
        children[children.size] = var_c6736586ae30f7ea[i];
    }
    return children;
}

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x846
// Size: 0x130
function node_cansee_child(start_node, end_node, exclude, var_1bfa180c6fdd09dd) {
    offset = 128;
    if (isdefined(level.var_9def439b33eac09d)) {
        offset = level.var_9def439b33eac09d;
    }
    startpos = start_node.origin + (0, 0, offset);
    endpos = end_node.origin + (0, 0, offset);
    if (isdefined(start_node.target)) {
        if (isdefined(end_node.targetname)) {
            if (end_node.targetname == start_node.target) {
                return 1;
            }
        }
    }
    radius = 64;
    if (isdefined(level.astar_node_radius_override)) {
        radius = level.astar_node_radius_override;
    }
    passed = namespace_2a184fc4902783dc::sphere_trace_passed(startpos, endpos, radius, exclude, var_1bfa180c6fdd09dd);
    /#
        if (getdvar(@"hash_f9d938304e5a0a21") != "<unknown string>") {
            if (!passed) {
                debug_data = sphere_trace(startpos, endpos, radius, exclude, var_1bfa180c6fdd09dd, 1);
            }
        }
    #/
    return passed;
}

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x97e
// Size: 0x13e
function node_is_valid(node, exclude, var_1bfa180c6fdd09dd) {
    if (istrue(node.claimed)) {
        return 0;
    }
    var_745eb0a20e398d5d = 256;
    if (isdefined(level.var_ac33444df3b5f6b)) {
        var_745eb0a20e398d5d = level.var_ac33444df3b5f6b;
    }
    var_7f7202915d835c61 = 128;
    if (isdefined(level.var_e769257ba0ea53f7)) {
        var_7f7202915d835c61 = level.var_e769257ba0ea53f7;
    }
    startpos = node.origin + (0, 0, var_745eb0a20e398d5d);
    endpos = node.origin + (0, 0, var_7f7202915d835c61);
    radius = 72;
    if (isdefined(level.astar_node_radius_override)) {
        radius = level.astar_node_radius_override;
    }
    passed = namespace_2a184fc4902783dc::sphere_trace_passed(startpos, endpos, radius, exclude, var_1bfa180c6fdd09dd);
    /#
        if (getdvar(@"hash_f9d938304e5a0a21") != "<unknown string>") {
            if (!passed) {
                clr = (1, 0, 0);
                debug_data = sphere_trace(startpos, endpos, radius, exclude, var_1bfa180c6fdd09dd, 1);
            }
        }
    #/
    return passed;
}

// Namespace namespace_383c80ef68455090/namespace_c7d6e3e0686eb85
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xac4
// Size: 0x176
function function_845fd743c0fadc39(var_e032318567f8afcd, start_pos, end_pos, exclude, var_6ee6c2ca7c64e9c9, var_acf81f9900be7297) {
    if (!isdefined(level.var_1b2cd26d577b5480)) {
        level.var_1b2cd26d577b5480 = [];
    }
    modifier = 1;
    if (isdefined(level.var_2c85db303881a3c8)) {
        modifier = level.var_2c85db303881a3c8;
    }
    if (modifier > 0) {
        var_8bca894b5a04261d = level.frameduration * modifier;
        var_9e1154a76b3eb920 = gettime();
        foreach (value in level.var_1b2cd26d577b5480) {
            if (gettime() >= value + var_8bca894b5a04261d) {
                level.var_1b2cd26d577b5480 = array_remove(level.var_1b2cd26d577b5480, value);
            }
        }
        if (level.var_1b2cd26d577b5480.size > 0) {
            var_9e1154a76b3eb920 = var_9e1154a76b3eb920 + level.var_1b2cd26d577b5480.size * var_8bca894b5a04261d;
        }
        level.var_1b2cd26d577b5480[level.var_1b2cd26d577b5480.size] = var_9e1154a76b3eb920;
        while (gettime() < var_9e1154a76b3eb920) {
            wait(0.05);
        }
    }
    path_data = astar_get_path(var_e032318567f8afcd, start_pos, end_pos, exclude, var_6ee6c2ca7c64e9c9, var_acf81f9900be7297);
    return path_data;
}

