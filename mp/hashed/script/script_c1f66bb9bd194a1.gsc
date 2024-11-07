#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace astar;

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x113
// Size: 0x522
function astar_get_path(grid, start_pos, end_pos, exclude, dyn_node, grid_size) {
    if (!isdefined(grid_size)) {
        grid_size = 1024;
    }
    if (!isdefined(exclude)) {
        exclude = [];
    }
    collisioncontents = physics_createcontents(["physicscontents_glass", "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot"]);
    node_grid = [];
    foreach (node in grid) {
        if (!node_is_valid(node, exclude, collisioncontents)) {
            continue;
        }
        node_grid[node_grid.size] = node;
    }
    if (isdefined(dyn_node) && node_is_valid(dyn_node, exclude, collisioncontents)) {
        node_grid[node_grid.size] = dyn_node;
    }
    start_node = getclosest(start_pos, node_grid);
    end_node = getclosest(end_pos, node_grid);
    if (distancesquared(start_node.origin, end_node.origin) < 256) {
        return undefined;
    }
    nodes_set_children(node_grid, start_node, exclude, grid_size);
    open_list = [];
    open_list[open_list.size] = start_node;
    start_node.open = 1;
    start_node.closed = 0;
    while (open_list.size > 0) {
        current_node = open_list[open_list.size - 1];
        for (i = 0; i < open_list.size; i++) {
            if (open_list[i].f < current_node.f) {
                current_node = open_list[i];
            }
        }
        if (current_node == end_node) {
            path = [];
            for (current = current_node; isdefined(current); current = current.parent) {
                path[path.size] = current;
                if (!isdefined(current.parent)) {
                    break;
                }
            }
            data = spawnstruct();
            data.path = array_reverse(path);
            data.end_node = end_node;
            data.start_node = start_node;
            return data;
        }
        open_list = array_remove(open_list, current_node);
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
            }
            if (current_node.f < current_node.children[i].f && current_node.children[i].open) {
                continue;
            }
            if (!current_node.children[i].open && !current_node.children[i].closed) {
                if (!node_cansee_child(current_node.children[i], current_node, exclude, collisioncontents)) {
                    /#
                        if (getdvar(@"hash_f9d938304e5a0a21") != "<dev string:x1c>") {
                            line(current_node.origin, current_node.children[i].origin, (1, 0, 0), 1, 0, 20);
                        }
                    #/
                    continue;
                }
                open_list[open_list.size] = current_node.children[i];
                current_node.children[i].parent = current_node;
                current_node.children[i].open = 1;
                current_node.children[i].closed = 0;
            }
        }
    }
}

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x63d
// Size: 0xa2
function nodes_set_children(valid_nodes, start_node, exclude, grid_size) {
    for (i = 0; i < valid_nodes.size; i++) {
        valid_nodes[i].g = 0;
        valid_nodes[i].h = 0;
        valid_nodes[i].f = 0;
        valid_nodes[i].parent = undefined;
        valid_nodes[i].open = 0;
        valid_nodes[i].closed = 0;
        node_set_children(valid_nodes[i], valid_nodes, start_node, grid_size);
    }
}

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6e7
// Size: 0x5b
function node_set_children(node, all_nodes, start_node, grid_size) {
    exclude = [node, start_node];
    children = node_get_children(node, all_nodes, grid_size, exclude);
    node.children = children;
}

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x74a
// Size: 0x111
function node_get_children(node, all_nodes, grid_size, excluders) {
    if (!isdefined(excluders)) {
        excluders = [];
    }
    max_dist_sq = squared(grid_size);
    all_nodes = sortbydistance(all_nodes, node.origin);
    children = [];
    for (i = 0; i < all_nodes.size; i++) {
        excluded = 0;
        for (j = 0; j < excluders.size; j++) {
            if (all_nodes[i] == excluders[j]) {
                excluded = 1;
                break;
            }
        }
        if (excluded) {
            continue;
        }
        if (isdefined(all_nodes[i].radius)) {
            max_dist_sq = squared(all_nodes[i].radius);
        }
        dist_sq = distancesquared(node.origin, all_nodes[i].origin);
        if (dist_sq > max_dist_sq) {
            break;
        }
        children[children.size] = all_nodes[i];
    }
    return children;
}

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x864
// Size: 0x12b
function node_cansee_child(start_node, end_node, exclude, collisioncontents) {
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
    passed = scripts\engine\trace::sphere_trace_passed(startpos, endpos, radius, exclude, collisioncontents);
    /#
        if (getdvar(@"hash_f9d938304e5a0a21") != "<dev string:x1c>") {
            if (!passed) {
                debug_data = sphere_trace(startpos, endpos, radius, exclude, collisioncontents, 1);
            }
        }
    #/
    return passed;
}

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x998
// Size: 0x137
function node_is_valid(node, exclude, collisioncontents) {
    if (istrue(node.claimed)) {
        return 0;
    }
    high_offset = 256;
    if (isdefined(level.var_ac33444df3b5f6b)) {
        high_offset = level.var_ac33444df3b5f6b;
    }
    low_offset = 128;
    if (isdefined(level.var_e769257ba0ea53f7)) {
        low_offset = level.var_e769257ba0ea53f7;
    }
    startpos = node.origin + (0, 0, high_offset);
    endpos = node.origin + (0, 0, low_offset);
    radius = 72;
    if (isdefined(level.astar_node_radius_override)) {
        radius = level.astar_node_radius_override;
    }
    passed = scripts\engine\trace::sphere_trace_passed(startpos, endpos, radius, exclude, collisioncontents);
    /#
        if (getdvar(@"hash_f9d938304e5a0a21") != "<dev string:x1c>") {
            if (!passed) {
                clr = (1, 0, 0);
                debug_data = sphere_trace(startpos, endpos, radius, exclude, collisioncontents, 1);
            }
        }
    #/
    return passed;
}

// Namespace astar / namespace_c7d6e3e0686eb85
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xad8
// Size: 0x170
function function_845fd743c0fadc39(grid, start_pos, end_pos, exclude, dyn_node, grid_size) {
    if (!isdefined(level.astar_queue)) {
        level.astar_queue = [];
    }
    modifier = 1;
    if (isdefined(level.var_2c85db303881a3c8)) {
        modifier = level.var_2c85db303881a3c8;
    }
    if (modifier > 0) {
        framesbetween = level.frameduration * modifier;
        var_9e1154a76b3eb920 = gettime();
        foreach (value in level.astar_queue) {
            if (gettime() >= value + framesbetween) {
                level.astar_queue = array_remove(level.astar_queue, value);
            }
        }
        if (level.astar_queue.size > 0) {
            var_9e1154a76b3eb920 += level.astar_queue.size * framesbetween;
        }
        level.astar_queue[level.astar_queue.size] = var_9e1154a76b3eb920;
        while (gettime() < var_9e1154a76b3eb920) {
            wait 0.05;
        }
    }
    path_data = astar_get_path(grid, start_pos, end_pos, exclude, dyn_node, grid_size);
    return path_data;
}

