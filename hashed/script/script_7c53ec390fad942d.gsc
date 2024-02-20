// mwiii decomp prototype
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using script_3d2770dc09c1243;

#namespace namespace_4095f42a23b0a059;

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x82a
function init() {
    var_5836c6d53a5f99a2 = getallnodes();
    level.var_367c15041e69a2a9.var_6fbb505de2f2b966 = [];
    level.var_367c15041e69a2a9.var_594b566a234fcfb8 = [];
    foreach (node in var_5836c6d53a5f99a2) {
        if (!isdefined(node.type) || node.type == "Begin" || node.type == "End" || node.type == "Path" || node.type == "Path 3D") {
            continue;
        }
        pos = (int(node.origin[0]), int(node.origin[1]), int(node.origin[2]));
        size = level.var_367c15041e69a2a9.var_6fbb505de2f2b966.size;
        level.var_367c15041e69a2a9.var_6fbb505de2f2b966[size] = pos;
    }
    triangles = [];
    var_94da0800e5d1a91 = function_b44e6c89329214fc(level.var_367c15041e69a2a9.var_6fbb505de2f2b966);
    triangles[triangles.size] = var_94da0800e5d1a91;
    foreach (pos in level.var_367c15041e69a2a9.var_6fbb505de2f2b966) {
        var_93fef0dca6a47f2 = [];
        foreach (tri in triangles) {
            if (function_3c42e495fb530329(tri, pos)) {
                tri.var_1c3231928bafe6a4 = 1;
                var_93fef0dca6a47f2[var_93fef0dca6a47f2.size] = tri.e1;
                var_93fef0dca6a47f2[var_93fef0dca6a47f2.size] = tri.e2;
                var_93fef0dca6a47f2[var_93fef0dca6a47f2.size] = tri.e3;
            }
        }
        var_db01c5bde88a365a = [];
        foreach (tri in triangles) {
            if (istrue(tri.var_1c3231928bafe6a4)) {
                continue;
            }
            var_db01c5bde88a365a[var_db01c5bde88a365a.size] = tri;
        }
        triangles = var_db01c5bde88a365a;
        for (i = 0; i < var_93fef0dca6a47f2.size - 1; i++) {
            for (j = i + 1; j < var_93fef0dca6a47f2.size; j++) {
                if (function_38bc51b4427edf82(var_93fef0dca6a47f2[i], var_93fef0dca6a47f2[j])) {
                    var_93fef0dca6a47f2[i].var_1c3231928bafe6a4 = 1;
                    var_93fef0dca6a47f2[j].var_1c3231928bafe6a4 = 1;
                }
            }
        }
        foreach (edge in var_93fef0dca6a47f2) {
            if (istrue(edge.var_1c3231928bafe6a4)) {
                continue;
            }
            triangles[triangles.size] = function_317af97ab1dcb958(edge.p1, edge.p2, pos);
        }
    }
    edges = [];
    foreach (tri in triangles) {
        if (tri.p1 == var_94da0800e5d1a91.p1 || tri.p2 == var_94da0800e5d1a91.p1 || tri.p3 == var_94da0800e5d1a91.p1 || tri.p1 == var_94da0800e5d1a91.p2 || tri.p2 == var_94da0800e5d1a91.p2 || tri.p3 == var_94da0800e5d1a91.p2 || tri.p1 == var_94da0800e5d1a91.p3 || tri.p2 == var_94da0800e5d1a91.p3 || tri.p3 == var_94da0800e5d1a91.p3) {
            continue;
        }
        key1 = function_591df68961acb2fa(tri.e1.p1) + "," + function_591df68961acb2fa(tri.e1.p2);
        key2 = function_591df68961acb2fa(tri.e1.p2) + "," + function_591df68961acb2fa(tri.e1.p1);
        if (!isdefined(edges[key1]) && !isdefined(edges[key2])) {
            level.var_367c15041e69a2a9.var_594b566a234fcfb8[level.var_367c15041e69a2a9.var_594b566a234fcfb8.size] = [0:tri.e1.p1, 1:tri.e1.p2];
            edges[key1] = 1;
        }
        key1 = function_591df68961acb2fa(tri.e2.p1) + "," + function_591df68961acb2fa(tri.e2.p2);
        key2 = function_591df68961acb2fa(tri.e2.p2) + "," + function_591df68961acb2fa(tri.e2.p1);
        if (!isdefined(edges[key1]) && !isdefined(edges[key2])) {
            level.var_367c15041e69a2a9.var_594b566a234fcfb8[level.var_367c15041e69a2a9.var_594b566a234fcfb8.size] = [0:tri.e2.p1, 1:tri.e2.p2];
            edges[key1] = 1;
        }
        key1 = function_591df68961acb2fa(tri.e3.p1) + "," + function_591df68961acb2fa(tri.e3.p2);
        key2 = function_591df68961acb2fa(tri.e3.p2) + "," + function_591df68961acb2fa(tri.e3.p1);
        if (!isdefined(edges[key1]) && !isdefined(edges[key2])) {
            level.var_367c15041e69a2a9.var_594b566a234fcfb8[level.var_367c15041e69a2a9.var_594b566a234fcfb8.size] = [0:tri.e3.p1, 1:tri.e3.p2];
            edges[key1] = 1;
        }
    }
    /#
        var_e5bbc2c8164960cb = level.var_367c15041e69a2a9.var_594b566a234fcfb8;
        level thread function_d9a511d78efb4abb(var_e5bbc2c8164960cb);
    #/
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x983
// Size: 0x7c
function private function_38bc51b4427edf82(e1, e2) {
    return e1.p1 == e2.p1 && e1.p2 == e2.p2 || e1.p1 == e2.p2 && e1.p2 == e2.p1;
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa07
// Size: 0x14f
function private function_b44e6c89329214fc(points) {
    var_4e9bdd57294562fd = 0;
    var_4e78e757291f3143 = 0;
    var_a056773a8ab0b014 = 0;
    var_a07a653a8ad90336 = 0;
    foreach (point in points) {
        if (point[0] < var_4e9bdd57294562fd) {
            var_4e9bdd57294562fd = point[0];
        }
        if (point[0] > var_4e78e757291f3143) {
            var_4e78e757291f3143 = point[0];
        }
        if (point[1] < var_a056773a8ab0b014) {
            var_a056773a8ab0b014 = point[1];
        }
        if (point[1] > var_a07a653a8ad90336) {
            var_a07a653a8ad90336 = point[1];
        }
    }
    dx = var_4e78e757291f3143 - var_4e9bdd57294562fd;
    dy = var_a07a653a8ad90336 - var_a056773a8ab0b014;
    if (dy > dx) {
        var_d98f07235af14e7 = dy;
    } else {
        var_d98f07235af14e7 = dx;
    }
    var_4e9bd35729454cff = var_4e9bdd57294562fd + dx * 0.5;
    var_a056713a8ab0a2e2 = var_a056773a8ab0b014 + dy * 0.5;
    var_f013d27f7cf2562d = 20;
    return function_317af97ab1dcb958((var_4e9bd35729454cff - var_f013d27f7cf2562d * var_d98f07235af14e7, var_a056713a8ab0a2e2 - var_d98f07235af14e7, 0), (var_4e9bd35729454cff, var_a056713a8ab0a2e2 + var_f013d27f7cf2562d * var_d98f07235af14e7, 0), (var_4e9bd35729454cff + var_f013d27f7cf2562d * var_d98f07235af14e7, var_a056713a8ab0a2e2 - var_d98f07235af14e7, 0));
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb5e
// Size: 0x3f
function private function_44c080e27e081191(pos1, pos2) {
    edge = spawnstruct();
    edge.p1 = pos1;
    edge.p2 = pos2;
    return edge;
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xba5
// Size: 0xcc
function private function_317af97ab1dcb958(pos1, pos2, pos3) {
    triangle = spawnstruct();
    triangle.p1 = pos1;
    triangle.p2 = pos2;
    triangle.p3 = pos3;
    triangle.e1 = function_44c080e27e081191(triangle.p1, triangle.p2);
    triangle.e2 = function_44c080e27e081191(triangle.p2, triangle.p3);
    triangle.e3 = function_44c080e27e081191(triangle.p3, triangle.p1);
    return triangle;
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc79
// Size: 0x1af
function private function_3c42e495fb530329(triangle, pos) {
    var_b079cc03012678da = triangle.p1[0];
    var_b079cd0301267b0d = triangle.p1[1];
    var_b075c603012275d1 = triangle.p2[0];
    var_b075c5030122739e = triangle.p2[1];
    var_b070c003011c3fc8 = triangle.p3[0];
    var_b070c103011c41fb = triangle.p3[1];
    var_ce0ee878f55f5e93 = 2 * (var_b075c603012275d1 - var_b079cc03012678da);
    b1 = 2 * (var_b075c5030122739e - var_b079cd0301267b0d);
    c1 = var_b075c603012275d1 * var_b075c603012275d1 + var_b075c5030122739e * var_b075c5030122739e - var_b079cc03012678da * var_b079cc03012678da - var_b079cd0301267b0d * var_b079cd0301267b0d;
    var_ce0ee978f55f60c6 = 2 * (var_b070c003011c3fc8 - var_b075c603012275d1);
    var_ce1bfb78f56d9ce1 = 2 * (var_b070c103011c41fb - var_b075c5030122739e);
    c2 = var_b070c003011c3fc8 * var_b070c003011c3fc8 + var_b070c103011c41fb * var_b070c103011c41fb - var_b075c603012275d1 * var_b075c603012275d1 - var_b075c5030122739e * var_b075c5030122739e;
    if (var_ce0ee878f55f5e93 * var_ce1bfb78f56d9ce1 - var_ce0ee978f55f60c6 * b1 == 0) {
        return 0;
    }
    var_8d99e47324560b57 = (c1 * var_ce1bfb78f56d9ce1 - c2 * b1) / (var_ce0ee878f55f5e93 * var_ce1bfb78f56d9ce1 - var_ce0ee978f55f60c6 * b1);
    var_8d99e37324560924 = (var_ce0ee878f55f5e93 * c2 - var_ce0ee978f55f60c6 * c1) / (var_ce0ee878f55f5e93 * var_ce1bfb78f56d9ce1 - var_ce0ee978f55f60c6 * b1);
    radiussq = distance2dsquared(triangle.p1, (var_8d99e47324560b57, var_8d99e37324560924, 0));
    return distance2dsquared(pos, (var_8d99e47324560b57, var_8d99e37324560924, 0)) < radiussq;
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe30
// Size: 0x253
function function_ffd4129f1032e796() {
    self.var_367c15041e69a2a9.onplayerkilled = &onplayerkilled;
    self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b = function_ac06ea67aca409ff();
    if (!isdefined(self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b)) {
        return;
    }
    var_d22fdca158e266e = 12;
    var_7d2294c58a5c346 = 50;
    if (distance2dsquared(self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0], function_f8350ab882cc2439(self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0])) > var_d22fdca158e266e * var_d22fdca158e266e) {
        report("teleport will fail", self, self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0], self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[1], undefined, "the starting point may not be on navmesh.");
        return;
    }
    var_fc77e2b383d17ec9 = function_721588ae374756b5(self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0], var_d22fdca158e266e, var_7d2294c58a5c346);
    if (isdefined(var_fc77e2b383d17ec9)) {
        report("teleport failed", self, self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0], self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[1], undefined, var_fc77e2b383d17ec9);
        return;
    }
    var_605274b4ca26e27d = function_71b519a5e0525acc();
    var_cbef341a3aeef001 = 40;
    var_e68c4bb8093910b8 = 120;
    function_9e400058ef021b03(self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[1], var_cbef341a3aeef001);
    startpos = self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0];
    endpos = self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[1];
    while (1) {
        result = function_b564050a363f08ec(self, 2);
        if (result == "goal") {
            break;
        } else if (result != "timeout") {
            report(result, self, startpos, endpos, self function_b96cea3ba44fc035(), undefined);
            break;
        } else if ((function_71b519a5e0525acc() - var_605274b4ca26e27d) / 1000 > var_e68c4bb8093910b8) {
            report("timeout", self, startpos, endpos, self function_b96cea3ba44fc035(), undefined);
            break;
        }
    }
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108a
// Size: 0x28
function function_60524de5341e2666() {
    if (isdefined(self)) {
        self botsetflag("disable_movement", 0);
        self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b = undefined;
    }
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b9
// Size: 0x31
function function_3113f44ebafe71b1() {
    return level.var_367c15041e69a2a9.var_594b566a234fcfb8.size > 0 || isdefined(self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b);
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10f2
// Size: 0x5e
function private onplayerkilled(var_642470e1abc1bbf9) {
    if (!isbot(self)) {
        return;
    }
    report("death", self, self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[0], self.var_367c15041e69a2a9.var_7e94a2c0fbf8691b[1], undefined, "deathpos: " + self.lastdeathpos);
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1157
// Size: 0x192
function private report(var_889f3d7e1c1ea6b, bot, start, target, path, comment) {
    var_444a5451f436094a = var_889f3d7e1c1ea6b + "; " + "bot:" + bot getentitynumber() + "; ";
    if (isdefined(start)) {
        var_444a5451f436094a = var_444a5451f436094a + "start:" + start;
    }
    var_444a5451f436094a = var_444a5451f436094a + "; ";
    if (isdefined(target)) {
        var_444a5451f436094a = var_444a5451f436094a + "target:" + target;
    }
    var_444a5451f436094a = var_444a5451f436094a + "; ";
    if (isdefined(path)) {
        pathstr = "path: ";
        for (i = 0; i < path.size; i++) {
            pathstr = pathstr + path[i];
        }
        var_444a5451f436094a = var_444a5451f436094a + pathstr;
    }
    var_444a5451f436094a = var_444a5451f436094a + "; ";
    if (isdefined(comment)) {
        var_444a5451f436094a = var_444a5451f436094a + "comment:" + comment;
    }
    function_9a0a24de119b078a("Connectivity", var_444a5451f436094a);
    /#
        if (isdefined(level.var_367c15041e69a2a9.var_db71539d3e4b4723)) {
            level.var_367c15041e69a2a9.var_db71539d3e4b4723 = level.var_367c15041e69a2a9.var_db71539d3e4b4723 + 1;
        } else {
            level.var_367c15041e69a2a9.var_db71539d3e4b4723 = 1;
        }
        function_f2bc01a7b0321f52("<unknown string>", start, start + (0, 0, 100), bot.var_367c15041e69a2a9.var_7e94a2c0fbf8691b, level.var_367c15041e69a2a9.var_db71539d3e4b4723);
    #/
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12f0
// Size: 0x84
function private function_ac06ea67aca409ff() {
    if (level.var_367c15041e69a2a9.var_594b566a234fcfb8.size > 0) {
        last = level.var_367c15041e69a2a9.var_594b566a234fcfb8[level.var_367c15041e69a2a9.var_594b566a234fcfb8.size - 1];
        level.var_367c15041e69a2a9.var_594b566a234fcfb8[level.var_367c15041e69a2a9.var_594b566a234fcfb8.size - 1] = undefined;
        return last;
    } else {
        return undefined;
    }
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x137b
// Size: 0x13
function private function_591df68961acb2fa(var_9601c425b78907de) {
    return "" + var_9601c425b78907de;
}

// Namespace namespace_4095f42a23b0a059/namespace_577f6919a96a7b63
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1396
// Size: 0x97
function private function_d9a511d78efb4abb(edges) {
    /#
        level endon("<unknown string>");
        if (!getdvarint(@"hash_19e8c17dd0841d5e", 0)) {
            return;
        }
        while (1) {
            foreach (edge in edges) {
                line(edge[0], edge[1], (0, 1, 0), 1, 1, 1);
            }
            waitframe();
        }
    #/
}

