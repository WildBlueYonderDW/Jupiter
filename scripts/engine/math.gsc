// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;

#namespace math;

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175
// Size: 0x37
function anglebetweenvectors(var_2b2be2708df81cd, var_2b2bb2708df7b34) {
    return acos(clamp(vectordot(var_2b2be2708df81cd, var_2b2bb2708df7b34) / length(var_2b2be2708df81cd) * length(var_2b2bb2708df7b34), -1, 1));
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x20
function anglebetweenvectorsunit(v1, v2) {
    return acos(vectordot(v1, v2));
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x84
function anglebetweenvectorssigned(var_2b2be2708df81cd, var_2b2bb2708df7b34, var_12caeb2454e24879) {
    vec1 = vectornormalize(var_2b2be2708df81cd);
    vec2 = vectornormalize(var_2b2bb2708df7b34);
    angle = acos(clamp(vectordot(vec1, vec2), -1, 1));
    cross = vectorcross(vec1, vec2);
    if (vectordot(cross, var_12caeb2454e24879) < 0) {
        angle = angle * -1;
    }
    return angle;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x268
// Size: 0x23
function lerp(from, to, frac) {
    return from + (to - from) * frac;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293
// Size: 0x23
function lerp_fraction(from, to, n) {
    return (n - from) / (to - from);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x48
function fake_slerp(from, to, fraction) {
    return (angle_lerp(from[0], to[0], fraction), angle_lerp(from[1], to[1], fraction), angle_lerp(from[2], to[2], fraction));
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e
// Size: 0x2d
function angle_lerp(from, to, fraction) {
    return angleclamp(from + angleclamp180(to - from) * fraction);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343
// Size: 0x53
function get_dot(start_origin, start_angles, end_origin) {
    normal = vectornormalize(end_origin - start_origin);
    forward = anglestoforward(start_angles);
    dot = vectordot(forward, normal);
    return dot;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0x2b
function vector_project_onto_plane(vector, normal) {
    return vector - vectordot(normal, vector) / squared(length(normal)) * normal;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x62
function vector_project_endpoint(origin, angles, var_46f432042b3473d8) {
    /#
        assert(isdefined(origin));
    #/
    /#
        assert(isdefined(angles));
    #/
    /#
        assert(isdefined(var_46f432042b3473d8));
    #/
    dir = anglestoforward(angles);
    dir = dir * var_46f432042b3473d8;
    end = origin + dir;
    return end;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0x26
function vector_reflect(vector, normal) {
    return vectornormalize(2 * vector_project_onto_plane(vector, normal) - vector);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469
// Size: 0x72
function vector_area_parallelogram(v, a, b) {
    /#
        assert(isdefined(v));
    #/
    /#
        assert(isdefined(a));
    #/
    /#
        assert(isdefined(b));
    #/
    return a[0] * b[1] - a[1] * b[0] + b[0] * v[1] - v[0] * b[1] + v[0] * a[1] - a[0] * v[1];
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3
// Size: 0x20
function scalar_projection(veca, vecb) {
    return vectordot(vectornormalize(veca), vecb);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x50b
// Size: 0x81
function get_point_on_parabola(start, end, height, t) {
    var_b850e09eeb4ac957 = t * 2 - 1;
    direction = end - start;
    up = (0, 0, 1);
    result = start + t * direction;
    result = result + (var_b850e09eeb4ac957 * var_b850e09eeb4ac957 * -1 + 1) * height * up;
    return result;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x594
// Size: 0x40
function get_mid_point(var_4ad9b5baa7793165, var_4ad9b2baa7792acc) {
    return ((var_4ad9b5baa7793165[0] + var_4ad9b2baa7792acc[0]) * 0.5, (var_4ad9b5baa7793165[1] + var_4ad9b2baa7792acc[1]) * 0.5, (var_4ad9b5baa7793165[2] + var_4ad9b2baa7792acc[2]) * 0.5);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc
// Size: 0xd8
function round_float(value, precision, down) {
    /#
        assertex(isdefined(value), "value must be defined.");
    #/
    /#
        assertex(isdefined(precision), "precision must be defined.");
    #/
    /#
        assertex(precision == int(precision), "precision must be an integer.");
    #/
    precision = int(precision);
    if (precision < 0 || precision > 4) {
        /#
            assertmsg("Precision value must be an integer that is >= 0 and <= 4. This was passed in: " + precision);
        #/
        return value;
    }
    var_c0ce16db90da842 = 1;
    for (i = 1; i <= precision; i++) {
        var_c0ce16db90da842 = var_c0ce16db90da842 * 10;
    }
    var_f27d0b5c6511561e = value * var_c0ce16db90da842;
    if (!isdefined(down) || down) {
        var_f27d0b5c6511561e = floor(var_f27d0b5c6511561e);
    } else {
        var_f27d0b5c6511561e = ceil(var_f27d0b5c6511561e);
    }
    value = var_f27d0b5c6511561e / var_c0ce16db90da842;
    return value;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6bc
// Size: 0x44
function round_millisec_on_sec(value, precision, down) {
    var_2514ce91adde4e58 = value / 1000;
    var_2514ce91adde4e58 = round_float(var_2514ce91adde4e58, precision, down);
    value = var_2514ce91adde4e58 * 1000;
    return int(value);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x39
function remap(value, var_3c58d40ee22036ae, var_c979000e8e5b2aec, var_3c58d30ee220347b, var_c979030e8e5b3185) {
    return var_3c58d30ee220347b + (value - var_3c58d40ee22036ae) * (var_c979030e8e5b3185 - var_3c58d30ee220347b) / (var_c979000e8e5b2aec - var_3c58d40ee22036ae);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x749
// Size: 0x7d
function normalize_value(var_7194af5332b54e4, var_7194df5332b5b7d, var_a8fe33ce005d9c1e) {
    if (var_7194af5332b54e4 > var_7194df5332b5b7d) {
        upper = var_7194af5332b54e4;
        var_7194af5332b54e4 = var_7194df5332b5b7d;
        var_7194df5332b5b7d = upper;
    }
    if (var_a8fe33ce005d9c1e > var_7194df5332b5b7d) {
        return 1;
    } else if (var_a8fe33ce005d9c1e < var_7194af5332b54e4) {
        return 0;
    } else if (var_7194af5332b54e4 == var_7194df5332b5b7d) {
        /#
            assertmsg("clamp_a <" + var_7194af5332b54e4 + "> and <" + var_7194df5332b5b7d + " MUST be different values.");
        #/
    }
    return (var_a8fe33ce005d9c1e - var_7194af5332b54e4) / (var_7194df5332b5b7d - var_7194af5332b54e4);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x28
function normalized_to_growth_clamps(min, max, value) {
    return (max - min) * squared(value) + min;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7fe
// Size: 0x28
function normalized_to_decay_clamps(min, max, value) {
    return normalized_to_growth_clamps(min, max, 1 - value);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82e
// Size: 0x1e
function normalized_parabola(x) {
    return -1 * squared(2 * x - 1) + 1;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x854
// Size: 0x3f
function normalized_sin_wave(x) {
    y = x * 2 * 3.14159 - 1.5708;
    y = (sin(radians_to_degrees(y)) + 1) * 0.5;
    return y;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89b
// Size: 0x39
function normalized_cos_wave(x) {
    y = x * 2 * 3.14159;
    y = (cos(radians_to_degrees(y)) + 1) * 0.5;
    return y;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc
// Size: 0x33
function function_4118613456c64c5e(value, var_1a0c5bc8003822f2) {
    value = value + var_1a0c5bc8003822f2;
    if (value > 1) {
        value = value - 1;
    }
    if (value < 0) {
        value = value + 1;
    }
    return value;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x917
// Size: 0x13
function radians_to_degrees(var_75358e383ebedf15) {
    return var_75358e383ebedf15 * 57.2958;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x932
// Size: 0x13
function degrees_to_radians(degrees) {
    return degrees * 0.0174533;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94d
// Size: 0x26
function factor_value(var_bc94add9a6699813, max_val, var_c803ff82836ff926) {
    return max_val * var_c803ff82836ff926 + var_bc94add9a6699813 * (1 - var_c803ff82836ff926);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97b
// Size: 0x56
function function_889bef0ad1600791(num) {
    if (num < 0.5) {
        num = num * 2;
        num = normalized_float_smooth_in(num);
        num = num * 0.5;
    } else {
        num = (num - 0.5) * 2;
        num = normalized_float_smooth_out(num);
        num = num * 0.5 + 0.5;
    }
    return num;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d9
// Size: 0xf
function normalized_float_smooth_in(num) {
    return num * num;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f0
// Size: 0x1e
function normalized_float_smooth_out(num) {
    num = 1 - num;
    num = num * num;
    num = 1 - num;
    return num;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa16
// Size: 0x8a
function line_to_plane_intersection(var_d747962793d54b7d, var_d747932793d544e4, var_cab2b4b6598610c, plane_normal) {
    d = vectordot(plane_normal, var_cab2b4b6598610c);
    var_cb921303144e9e43 = var_d747932793d544e4 - var_d747962793d54b7d;
    var_f93d442fee36ceed = vectordot(plane_normal, var_cb921303144e9e43);
    if (var_f93d442fee36ceed == 0) {
        return undefined;
    }
    t = (d - vectordot(plane_normal, var_d747962793d54b7d)) / var_f93d442fee36ceed;
    var_5772a8229fd0ee85 = var_d747962793d54b7d + var_cb921303144e9e43 * t;
    return var_5772a8229fd0ee85;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa8
// Size: 0x62
function function_d3daf615a9f61ea6(point, aabb_min, aabb_max) {
    return point[0] <= aabb_max[0] && point[0] >= aabb_min[0] && point[1] <= aabb_max[1] && point[1] >= aabb_min[1] && point[2] <= aabb_max[2] && point[2] >= aabb_min[2];
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb12
// Size: 0x35
function ray_to_plane_intersection_distance(var_b7034ef67b8ca88d, var_60aaa286cd521d8c, var_d74074ad5396e58a, var_fad8ba79dadaf9ee) {
    return vectordot(var_d74074ad5396e58a - var_b7034ef67b8ca88d, var_fad8ba79dadaf9ee) / vectordot(var_60aaa286cd521d8c, var_fad8ba79dadaf9ee);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4f
// Size: 0x93
function function_b2858ff2d7212ba7(point, start, end) {
    var_496ceebaa5e8670b = (point[0], point[1], 0);
    var_b571fc374074e645 = (start[0], start[1], 0);
    var_e2d1db45f01495d8 = (end[0], end[1], 0);
    topoint = vectornormalize(var_496ceebaa5e8670b - var_b571fc374074e645);
    forward = vectornormalize(var_e2d1db45f01495d8 - var_b571fc374074e645);
    dot = vectordot(topoint, forward);
    return dot > 0;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea
// Size: 0x209
function function_d2c0d8330ab7ad7f(start, end, circlecenter, circleradius) {
    x1 = start[0] - circlecenter[0];
    y1 = start[1] - circlecenter[1];
    x2 = end[0] - circlecenter[0];
    y2 = end[1] - circlecenter[1];
    r = float(circleradius);
    dx = x2 - x1;
    dy = y2 - y1;
    var_ce254378f57859e7 = dx * dx + dy * dy;
    d = x1 * y2 - x2 * y1;
    dis = r * r * var_ce254378f57859e7 - d * d;
    if (dis < 0) {
        return;
    } else if (dis == 0) {
        var_bf6a113c5a54166f = d * dy / var_ce254378f57859e7 + circlecenter[0];
        var_bf6a103c5a54143c = -1 * d * dx / var_ce254378f57859e7 + circlecenter[1];
        return [0:(var_bf6a113c5a54166f, var_bf6a103c5a54143c, 0)];
    } else {
        var_cc551eacde13f215 = sqrt(dis);
        var_cdf02c78f53da23e = d * dy;
        var_cdf02b78f53da00b = namespace_3c37cb17ade254d::sign(dy) * dx * var_cc551eacde13f215;
        var_495ff8baa5da6884 = (var_cdf02c78f53da23e + var_cdf02b78f53da00b) / var_ce254378f57859e7 + circlecenter[0];
        var_496cfabaa5e8816f = (var_cdf02c78f53da23e - var_cdf02b78f53da00b) / var_ce254378f57859e7 + circlecenter[0];
        var_cdeb4878f537b6fb = -1 * d * dx;
        var_cdeb4978f537b92e = abs(dy) * var_cc551eacde13f215;
        var_495ff9baa5da6ab7 = (var_cdeb4878f537b6fb + var_cdeb4978f537b92e) / var_ce254378f57859e7 + circlecenter[1];
        var_496cf9baa5e87f3c = (var_cdeb4878f537b6fb - var_cdeb4978f537b92e) / var_ce254378f57859e7 + circlecenter[1];
        return [0:(var_495ff8baa5da6884, var_495ff9baa5da6ab7, 0), 1:(var_496cfabaa5e8816f, var_496cf9baa5e87f3c, 0)];
    }
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfa
// Size: 0xff
function function_cc2ad02dcf5030d8(start, end, circleorigin, circleradius) {
    result = function_d2c0d8330ab7ad7f(start, end, circleorigin, circleradius);
    if (!isdefined(result)) {
        return;
    } else if (result.size == 1) {
        if (function_b2858ff2d7212ba7(result[0], start, end)) {
            return result;
        }
    } else {
        var_7a5bcc8fdbc7fb9e = function_b2858ff2d7212ba7(result[0], start, end);
        var_80d347f931a2e541 = function_b2858ff2d7212ba7(result[1], start, end);
        if (!var_7a5bcc8fdbc7fb9e && !var_80d347f931a2e541) {
            return;
        } else if (var_7a5bcc8fdbc7fb9e && !var_80d347f931a2e541) {
            return result[0];
        } else if (var_80d347f931a2e541 && !var_7a5bcc8fdbc7fb9e) {
            return result[1];
        } else {
            var_4574ae4853374f88 = distance2dsquared(start, result[0]);
            var_4574b14853375621 = distance2dsquared(start, result[1]);
            if (var_4574ae4853374f88 < var_4574b14853375621) {
                return result[0];
            } else {
                return result[1];
            }
        }
    }
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf00
// Size: 0x8c
function segmentvssphere(pointa, pointb, var_507e3e6432c4ffad, var_c77e7a25454430da) {
    if (pointa == pointb) {
        return 0;
    }
    var_1b1c7be2a8e1295c = var_507e3e6432c4ffad - pointa;
    var_5cef7cfd464e0781 = pointb - pointa;
    var_80d56f0dca67f561 = clamp(vectordot(var_1b1c7be2a8e1295c, var_5cef7cfd464e0781) / vectordot(var_5cef7cfd464e0781, var_5cef7cfd464e0781), 0, 1);
    closestpoint = pointa + var_5cef7cfd464e0781 * var_80d56f0dca67f561;
    return lengthsquared(var_507e3e6432c4ffad - closestpoint) <= var_c77e7a25454430da * var_c77e7a25454430da;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xf94
// Size: 0xaf
function pointvscone(point, var_7d4419eee2e4cb28, var_16062da7c74d1d43, var_8db1f601729968b3, var_9eace12f534ad325, var_da2ce43c649b224a, var_5a151d2fdc3ad81a, var_ea4fdba37c5b9244) {
    var_32a966523b6d08a0 = point - var_7d4419eee2e4cb28;
    var_3abe054fbf02d18d = vectordot(var_32a966523b6d08a0, var_16062da7c74d1d43);
    var_e6cb9c8ccd2bc82d = vectordot(var_32a966523b6d08a0, var_8db1f601729968b3);
    if (var_3abe054fbf02d18d > var_9eace12f534ad325) {
        return 0;
    }
    if (var_3abe054fbf02d18d < var_da2ce43c649b224a) {
        return 0;
    }
    if (isdefined(var_ea4fdba37c5b9244)) {
        if (abs(var_e6cb9c8ccd2bc82d) > var_ea4fdba37c5b9244) {
            return 0;
        }
    }
    if (anglebetweenvectors(var_16062da7c74d1d43, var_32a966523b6d08a0) > var_5a151d2fdc3ad81a) {
        return 0;
    }
    return 1;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104b
// Size: 0x7f
function pointvscylinder(point, radiussqr, height, origin, up) {
    var_340d59422336e85a = point - origin;
    var_a0c60260c964694 = vectordot(var_340d59422336e85a, up);
    if (var_a0c60260c964694 < 0 || var_a0c60260c964694 > height) {
        return 0;
    }
    var_340d59422336e85a = var_340d59422336e85a - var_a0c60260c964694 * up;
    var_96fb14702ae758b4 = lengthsquared(var_340d59422336e85a);
    if (var_96fb14702ae758b4 > radiussqr) {
        return 0;
    }
    return 1;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10d2
// Size: 0x45
function point_side_of_line2d(v, a, b) {
    area = vector_area_parallelogram(v, a, b);
    if (area > 0) {
        return "left";
    }
    return "right";
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111f
// Size: 0x4d
function wrap(min, max, value) {
    var_66a7a56d18cca472 = max - min + 1;
    if (value < min) {
        value = value + var_66a7a56d18cca472 * int((min - value) / var_66a7a56d18cca472 + 1);
    }
    return min + (value - min) % var_66a7a56d18cca472;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x9d
function point_in_fov(origin, fov, var_871ea848f69e124f) {
    if (!isdefined(origin)) {
        return;
    }
    if (!isdefined(fov)) {
        fov = 0.766;
    }
    if (isent(self) && isplayer(self)) {
        forward = anglestoforward(self getplayerangles(!istrue(var_871ea848f69e124f)));
    } else {
        forward = anglestoforward(self.angles);
    }
    normalvec = vectornormalize(origin - self.origin);
    dot = vectordot(forward, normalvec);
    return dot > fov;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1219
// Size: 0x67
function within_fov_2d(start_origin, start_angles, end_origin, fov) {
    normal = vectornormalize((end_origin[0], end_origin[1], 0) - (start_origin[0], start_origin[1], 0));
    forward = anglestoforward((0, start_angles[1], 0));
    return vectordot(forward, normal) >= fov;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1288
// Size: 0x8b
function is_point_in_front(point) {
    dot = 0;
    if (isent(self) && isplayer(self)) {
        var_485b74cb677a51a9 = point - self getorigin();
        forward = anglestoforward(self getplayerangles(1));
        dot = vectordot(var_485b74cb677a51a9, forward);
    } else {
        var_485b74cb677a51a9 = point - self.origin;
        forward = anglestoforward(self.angles);
        dot = vectordot(var_485b74cb677a51a9, forward);
    }
    return dot > 0;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131b
// Size: 0x81
function is_point_on_right(point) {
    dot = 0;
    if (isplayer(self)) {
        var_485b74cb677a51a9 = point - self getorigin();
        right = anglestoright(self getplayerangles(1));
        dot = vectordot(var_485b74cb677a51a9, right);
    } else {
        var_485b74cb677a51a9 = point - self.origin;
        right = anglestoright(self.angles);
        dot = vectordot(var_485b74cb677a51a9, right);
    }
    return dot > 0;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a4
// Size: 0x57
function function_1c46b3e291eff242(dir, forward_vec, var_195a2ed93e9eaef9) {
    if (!isdefined(var_195a2ed93e9eaef9)) {
        var_195a2ed93e9eaef9 = (0, 0, 1);
    }
    cross = vectorcross(forward_vec, var_195a2ed93e9eaef9);
    dot = vectordot(cross, dir);
    return dot > 0;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1403
// Size: 0xc8
function function_6c1e6433c5e5cf79(point, center, half_size, forward_angles) {
    var_9b91a9e577670535 = point - center;
    result = center;
    var_161c18750f51fe9e = anglestoaxis(forward_angles);
    var_a53038dcfd7d76da = [0:var_161c18750f51fe9e["forward"], 1:var_161c18750f51fe9e["right"], 2:var_161c18750f51fe9e["up"]];
    for (i = 0; i <= 2; i++) {
        dist = vectordot(var_a53038dcfd7d76da[i], var_9b91a9e577670535);
        dist = clamp(dist, -1 * half_size[i], half_size[i]);
        result = result + dist * var_a53038dcfd7d76da[i];
    }
    return result;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d3
// Size: 0x28
function random_vector_2d() {
    var_57338c9e11b3e93 = randomfloat(360);
    return (cos(var_57338c9e11b3e93), sin(var_57338c9e11b3e93), 0);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1503
// Size: 0x5a
function set_matrix_from_up(new_up) {
    var_6139c7ae54a7bada = anglestoforward(self.angles);
    var_b2b893575005b08c = vectorcross(var_6139c7ae54a7bada, new_up);
    var_93d8002c576c2e0b = vectorcross(new_up, var_b2b893575005b08c);
    self.angles = axistoangles(var_93d8002c576c2e0b, var_b2b893575005b08c, new_up);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1564
// Size: 0x35
function set_matrix_from_up_and_angles(new_up, var_8583b7021ec2367) {
    if (!isdefined(var_8583b7021ec2367)) {
        var_8583b7021ec2367 = self.angles;
    }
    self.angles = build_matrix_from_up_and_angles(new_up, var_8583b7021ec2367);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a0
// Size: 0x6c
function build_matrix_from_up_and_angles(new_up, var_8583b7021ec2367) {
    var_89752207bcf12f45 = acos(-1 * vectordot(anglestoforward(var_8583b7021ec2367), new_up));
    var_93d8002c576c2e0b = anglestoup(var_8583b7021ec2367 + (var_89752207bcf12f45, 0, 0));
    var_b2b893575005b08c = vectorcross(var_93d8002c576c2e0b, new_up);
    var_93d8002c576c2e0b = vectorcross(new_up, var_b2b893575005b08c);
    return axistoangles(var_93d8002c576c2e0b, var_b2b893575005b08c, new_up);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1614
// Size: 0x27
function critically_damped_move_to(target_pos, var_6f3b0221662dbf46, var_f878dc67e6b8b59f) {
    thread critically_damped_move_to_thread(target_pos, var_6f3b0221662dbf46, var_f878dc67e6b8b59f);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1642
// Size: 0xa5
function critically_damped_move_to_thread(target_pos, var_6f3b0221662dbf46, var_f878dc67e6b8b59f) {
    self endon("death");
    self endon("stop_spring");
    if (!isdefined(var_f878dc67e6b8b59f)) {
        var_f878dc67e6b8b59f = 1;
    }
    var_d8a4196afba8742b = spring_make_critically_damped(var_6f3b0221662dbf46, self.origin, anglestoforward(self.angles) * var_f878dc67e6b8b59f);
    while (distancesquared(self.origin, target_pos) > squared(0.1)) {
        self.origin = spring_update(var_d8a4196afba8742b, target_pos);
        wait(0.05);
    }
    self notify("movedone");
    spring_delete(var_d8a4196afba8742b);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16ee
// Size: 0x27
function critically_damped_move_and_rotate_to(target_pos, var_6f3b0221662dbf46, var_f878dc67e6b8b59f) {
    thread critically_damped_move_and_rotate_to_thread(target_pos, var_6f3b0221662dbf46, var_f878dc67e6b8b59f);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171c
// Size: 0xba
function critically_damped_move_and_rotate_to_thread(target_pos, var_6f3b0221662dbf46, var_f878dc67e6b8b59f) {
    self endon("death");
    self endon("stop_spring");
    if (!isdefined(var_f878dc67e6b8b59f)) {
        var_f878dc67e6b8b59f = 1;
    }
    var_d8a4196afba8742b = spring_make_critically_damped(var_6f3b0221662dbf46, self.origin, anglestoforward(self.angles) * var_f878dc67e6b8b59f);
    while (distancesquared(self.origin, target_pos) > squared(0.1)) {
        self.origin = spring_update(var_d8a4196afba8742b, target_pos);
        self.angles = vectortoangles(spring_get_vel(var_d8a4196afba8742b));
        wait(0.05);
    }
    self notify("movedone");
    spring_delete(var_d8a4196afba8742b);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17dd
// Size: 0x88
function function_c5b0d1646ebc8eb3(start_point, target_point, var_641d483a41b435c0, var_55eec07c0c5c88af) {
    yaw = var_55eec07c0c5c88af;
    target_yaw = vectortoyaw(target_point - start_point);
    diff = angleclamp180(target_yaw - yaw);
    new_yaw = undefined;
    if (abs(diff) < var_641d483a41b435c0) {
        new_yaw = target_yaw;
    } else {
        new_yaw = yaw + namespace_3c37cb17ade254d::sign(diff) * var_641d483a41b435c0;
    }
    return int(new_yaw);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186d
// Size: 0x5a
function function_804deea7a479c83b(var_66280091b78eaf4f, var_e4baef9749309aec, limit) {
    diff = angleclamp180(var_e4baef9749309aec - var_66280091b78eaf4f);
    var_e8472fbf5c890f3d = undefined;
    if (abs(diff) < limit) {
        var_e8472fbf5c890f3d = var_e4baef9749309aec;
    } else {
        var_e8472fbf5c890f3d = var_66280091b78eaf4f + namespace_3c37cb17ade254d::sign(diff) * limit;
    }
    return var_e8472fbf5c890f3d;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cf
// Size: 0xb2
function function_e70fb12ac4e8f91b(center, outer_radius, inner_radius, var_81eab9f4b9cb06da, var_33a8409ba292ca46) {
    ratio = 0;
    if (isdefined(inner_radius)) {
        ratio = clamp(inner_radius / outer_radius, 0, 1);
    }
    if (!isdefined(var_81eab9f4b9cb06da)) {
        var_81eab9f4b9cb06da = 0;
    }
    if (!isdefined(var_33a8409ba292ca46)) {
        var_33a8409ba292ca46 = 360;
    }
    radius = outer_radius * sqrt(randomfloatrange(ratio * ratio, 1));
    theta = randomfloatrange(var_81eab9f4b9cb06da, var_33a8409ba292ca46);
    offset = (cos(theta) * radius, sin(theta) * radius, 0);
    return center + offset;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1989
// Size: 0x30
function over_damped_move_to(target_pos, var_6f3b0221662dbf46, var_f7ddbaaf878e7b63, var_f878dc67e6b8b59f) {
    thread over_damped_move_to_thread(target_pos, var_6f3b0221662dbf46, var_f7ddbaaf878e7b63, var_f878dc67e6b8b59f);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c0
// Size: 0xae
function over_damped_move_to_thread(target_pos, var_6f3b0221662dbf46, var_f7ddbaaf878e7b63, var_f878dc67e6b8b59f) {
    self endon("death");
    self endon("stop_spring");
    if (!isdefined(var_f878dc67e6b8b59f)) {
        var_f878dc67e6b8b59f = 1;
    }
    var_d8a4196afba8742b = spring_make_over_damped(var_6f3b0221662dbf46, var_f7ddbaaf878e7b63, self.origin, anglestoforward(self.angles) * var_f878dc67e6b8b59f);
    while (distancesquared(self.origin, target_pos) > squared(0.1)) {
        self.origin = spring_update(var_d8a4196afba8742b, target_pos);
        wait(0.05);
    }
    self notify("movedone");
    spring_delete(var_d8a4196afba8742b);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a75
// Size: 0x30
function under_damped_move_to(target_pos, freq, var_b857d472b19d37af, var_f878dc67e6b8b59f) {
    thread under_damped_move_to_thread(target_pos, freq, var_b857d472b19d37af, var_f878dc67e6b8b59f);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aac
// Size: 0xc9
function under_damped_move_to_thread(target_pos, freq, var_b857d472b19d37af, var_f878dc67e6b8b59f) {
    self endon("death");
    self endon("stop_spring");
    if (!isdefined(var_f878dc67e6b8b59f)) {
        var_f878dc67e6b8b59f = 1;
    }
    var_d8a4196afba8742b = spring_make_under_damped(freq, var_b857d472b19d37af, self.origin, anglestoforward(self.angles) * var_f878dc67e6b8b59f);
    while (distancesquared(self.origin, target_pos) > squared(0.1) || length(spring_get_vel(var_d8a4196afba8742b)) < squared(0.1)) {
        self.origin = spring_update(var_d8a4196afba8742b, target_pos);
        wait(0.05);
    }
    self notify("movedone");
    spring_delete(var_d8a4196afba8742b);
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7c
// Size: 0xd5
function spring_make_critically_damped(var_6f3b0221662dbf46, start_pos, var_b764147b98875e2f) {
    var_d8a4196afba8742b = spring_add(start_pos, var_b764147b98875e2f);
    k = var_6f3b0221662dbf46 * 0.05;
    e = exp(-1 * k);
    level.springs[var_d8a4196afba8742b].c0 = (k + 1) * e;
    level.springs[var_d8a4196afba8742b].c1 = e;
    level.springs[var_d8a4196afba8742b].c2 = -1 * k * k * e;
    level.springs[var_d8a4196afba8742b].c3 = (1 - k) * e;
    spring_set_pos(var_d8a4196afba8742b, start_pos);
    spring_set_vel(var_d8a4196afba8742b, var_b764147b98875e2f);
    return var_d8a4196afba8742b;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c59
// Size: 0x1b8
function spring_make_over_damped(var_6f3b0221662dbf46, var_f7ddbaaf878e7b63, start_pos, var_b764147b98875e2f) {
    /#
        assert(var_f7ddbaaf878e7b63 > 0);
    #/
    var_d8a4196afba8742b = spring_add(start_pos, var_b764147b98875e2f);
    k = var_6f3b0221662dbf46 * var_6f3b0221662dbf46;
    c = -1 * sqrt(var_f7ddbaaf878e7b63 * var_f7ddbaaf878e7b63 + 4 * k);
    var_cdd57878f51fed58 = 0.5 * (c + var_f7ddbaaf878e7b63);
    var_cdd57b78f51ff3f1 = 0.5 * (c - var_f7ddbaaf878e7b63);
    var_ce254378f57859e7 = var_cdd57b78f51ff3f1 - var_cdd57878f51fed58;
    var_cba816031466d80f = 1 / var_ce254378f57859e7;
    e1 = exp(var_cdd57878f51fed58 * 0.05);
    e2 = exp(var_cdd57b78f51ff3f1 * 0.05);
    de = e2 - e1;
    level.springs[var_d8a4196afba8742b].c1 = de * var_cba816031466d80f;
    level.springs[var_d8a4196afba8742b].c0 = e1 - var_cdd57878f51fed58 * level.springs[var_d8a4196afba8742b].c1;
    level.springs[var_d8a4196afba8742b].c3 = (var_cdd57b78f51ff3f1 * e2 - var_cdd57878f51fed58 * e1) * var_cba816031466d80f;
    level.springs[var_d8a4196afba8742b].c2 = var_cdd57878f51fed58 * (e1 - level.springs[var_d8a4196afba8742b].c3);
    spring_set_pos(var_d8a4196afba8742b, start_pos);
    spring_set_vel(var_d8a4196afba8742b, var_b764147b98875e2f);
    return var_d8a4196afba8742b;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e19
// Size: 0x16c
function spring_make_under_damped(freq, var_b857d472b19d37af, start_pos, var_b764147b98875e2f) {
    /#
        assert(freq > 0);
    #/
    var_d8a4196afba8742b = spring_add(start_pos, var_b764147b98875e2f);
    h = -0.5 * var_b857d472b19d37af;
    w = freq;
    e = exp(h * 0.05) / w;
    angle = angleclamp(w * 0.05);
    s = sin(angle);
    c = cos(angle);
    var_cde33a78f52fac83 = w * c;
    hs = h * s;
    level.springs[var_d8a4196afba8742b].c0 = e * (var_cde33a78f52fac83 - hs);
    level.springs[var_d8a4196afba8742b].c1 = e * s;
    level.springs[var_d8a4196afba8742b].c2 = e * -1 * s * (h * h + w * w);
    level.springs[var_d8a4196afba8742b].c3 = e * (var_cde33a78f52fac83 + hs);
    spring_set_pos(var_d8a4196afba8742b, start_pos);
    spring_set_vel(var_d8a4196afba8742b, var_b764147b98875e2f);
    return var_d8a4196afba8742b;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8d
// Size: 0x14f
function spring_update(var_d8a4196afba8742b, target_pos, var_dc3b6531176a056b, var_f5a4c43128b87e4e) {
    if (isdefined(var_dc3b6531176a056b)) {
        spring_set_pos(var_d8a4196afba8742b, var_dc3b6531176a056b);
    }
    if (isdefined(var_f5a4c43128b87e4e)) {
        spring_set_vel(var_d8a4196afba8742b, var_f5a4c43128b87e4e);
    }
    var_17efc75714761b9e = level.springs[var_d8a4196afba8742b].pos - target_pos;
    new_pos = level.springs[var_d8a4196afba8742b].c0 * var_17efc75714761b9e + level.springs[var_d8a4196afba8742b].c1 * level.springs[var_d8a4196afba8742b].vel;
    new_vel = level.springs[var_d8a4196afba8742b].c2 * var_17efc75714761b9e + level.springs[var_d8a4196afba8742b].c3 * level.springs[var_d8a4196afba8742b].vel;
    level.springs[var_d8a4196afba8742b].pos = new_pos + target_pos;
    level.springs[var_d8a4196afba8742b].vel = new_vel;
    return level.springs[var_d8a4196afba8742b].pos;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e4
// Size: 0x17
function spring_delete(var_d8a4196afba8742b) {
    level.springs[var_d8a4196afba8742b] = undefined;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2102
// Size: 0x21
function spring_get_pos(var_d8a4196afba8742b) {
    return level.springs[var_d8a4196afba8742b].pos;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x212b
// Size: 0x21
function spring_get_vel(var_d8a4196afba8742b) {
    return level.springs[var_d8a4196afba8742b].vel;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2154
// Size: 0x24
function spring_init() {
    if (!isdefined(level.springs)) {
        level.springs = [];
        level.spring_count = 0;
    }
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217f
// Size: 0xd5
function spring_add(start_pos, var_b764147b98875e2f) {
    spring_init();
    var_e22dc56261fcf460 = level.spring_count;
    level.spring_count++;
    level.springs[var_e22dc56261fcf460] = spawnstruct();
    level.springs[var_e22dc56261fcf460].pos = start_pos;
    level.springs[var_e22dc56261fcf460].vel = var_b764147b98875e2f;
    level.springs[var_e22dc56261fcf460].c0 = 0;
    level.springs[var_e22dc56261fcf460].c1 = 0;
    level.springs[var_e22dc56261fcf460].c2 = 0;
    level.springs[var_e22dc56261fcf460].c3 = 0;
    return var_e22dc56261fcf460;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225c
// Size: 0x2b
function spring_set_pos(var_d8a4196afba8742b, pos) {
    level.springs[var_d8a4196afba8742b].pos = pos;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228e
// Size: 0x2b
function spring_set_vel(var_d8a4196afba8742b, vel) {
    level.springs[var_d8a4196afba8742b].vel = vel;
}

// Namespace math/namespace_d3f3cb0a543667c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x22c0
// Size: 0xd6
function random_normal_distribution(mean, std_deviation, lower_bound, upper_bound) {
    x1 = 0;
    x2 = 0;
    w = 1;
    y1 = 0;
    while (w >= 1) {
        x1 = 2 * randomfloatrange(0, 1) - 1;
        x2 = 2 * randomfloatrange(0, 1) - 1;
        w = x1 * x1 + x2 * x2;
    }
    w = sqrt(-2 * log(w) / w);
    y1 = x1 * w;
    number = mean + y1 * std_deviation;
    if (isdefined(lower_bound) && number < lower_bound) {
        number = lower_bound;
    }
    if (isdefined(upper_bound) && number > upper_bound) {
        number = upper_bound;
    }
    return number;
}

