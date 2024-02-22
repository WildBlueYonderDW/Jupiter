// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\engine\trace.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;
#using scripts\anim\utility_common.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_38eb8f4be20d54f4;

#namespace namespace_f35b248fe3d46dfb;

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407
// Size: 0x74
function function_4417babebd3bada7(params) {
    level._effect["mimic_prop_emerge_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_emerge_base.vfx");
    level._effect["mimic_prop_spawn_in_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_prop_spawn_in.vfx");
    level._effect["mimic_prop_spawn_out_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_prop_spawn_out.vfx");
    level._effect["mimic_prop_rattle_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_prop_shake.vfx");
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x482
// Size: 0x103
function function_272f7819479cfd8f() {
    level.var_a0ab8c8dc1b484ea = [];
    level.var_c333aca3fe5f8c29 = [];
    level.var_c1aeb5800a25fc5c = [];
    level.var_931a7da56efcbaac = [];
    level.var_d4032c90a01fcf71 = &function_d4032c90a01fcf71;
    waitframe();
    level.var_46382c5eecf4baf3 = 1;
    level.var_682b8798cd1ca21c = getstructarray("mimic_spawn_point", "variantname");
    level thread function_60ec83db29237577();
    /#
        function_f40e9354c7ef87f2();
    #/
    level.var_5c92ad41bd603ba8 = 3;
    level.var_542901d8545006be = 5;
    wait(5);
    var_aee622405433fd31 = getstructarray("ambient_mimic_spawn", "script_noteworthy");
    foreach (point in var_aee622405433fd31) {
        level.var_682b8798cd1ca21c = function_6d6af8144a5131f1(level.var_682b8798cd1ca21c, point);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0x139
function function_60ec83db29237577() {
    wait(5);
    if (isdefined(level.interacts)) {
        foreach (interact in level.interacts) {
            if (!isent(interact) || isdefined(interact.var_fb92b63798596049) || isdefined(interact.var_751df20fceaee5)) {
                continue;
            }
            if (!isdefined(interact.model) || interact.model == "" || interact.model == "tag_origin") {
                continue;
            }
            prop = spawnstruct();
            prop.interact = interact;
            prop.lure_prop_type = 1;
            prop.origin = interact.origin;
            prop.angles = interact.angles;
            level.var_682b8798cd1ca21c[level.var_682b8798cd1ca21c.size] = prop;
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cc
// Size: 0x8c
function function_7f3bb3916bbd189d(var_e376b152041e9caa, entity, var_e2f522f2f5303b23, var_ec2a6291d745649e, var_c2bab6b4faeb4e0d) {
    var_86ca8e1c112dc232 = [];
    if (var_e376b152041e9caa.size > 0) {
        var_2f5c52f48c970f90 = randomintrange(level.var_5c92ad41bd603ba8, level.var_542901d8545006be);
        var_86ca8e1c112dc232 = function_6942ed5cf6ec66c5(var_e376b152041e9caa, var_2f5c52f48c970f90, entity, var_ec2a6291d745649e);
    }
    if (!isdefined(var_e2f522f2f5303b23)) {
        if (var_86ca8e1c112dc232.size > 0) {
            var_e2f522f2f5303b23 = var_86ca8e1c112dc232[0];
        }
    }
    return function_f9d849950dd83510(var_86ca8e1c112dc232, entity, var_e2f522f2f5303b23, undefined, var_ec2a6291d745649e, var_c2bab6b4faeb4e0d);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x760
// Size: 0x95
function function_232cabbc43f9536(origin, entity, var_e2f522f2f5303b23, var_929915bf1b6066b6, search_radius, var_c2bab6b4faeb4e0d) {
    if (!isdefined(var_929915bf1b6066b6)) {
        var_929915bf1b6066b6 = randomintrange(level.var_5c92ad41bd603ba8, level.var_542901d8545006be);
    }
    search_radius = function_53c4c53197386572(search_radius, 1000);
    spawn_points = function_3f1e49f4d09e7020(origin, search_radius, var_929915bf1b6066b6);
    if (spawn_points.size || isdefined(var_e2f522f2f5303b23)) {
        if (!spawn_points.size) {
            spawn_points[spawn_points.size] = var_e2f522f2f5303b23;
        }
        return function_7f3bb3916bbd189d(spawn_points, entity, var_e2f522f2f5303b23, undefined, var_c2bab6b4faeb4e0d);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0x18a
function function_f9d849950dd83510(var_86ca8e1c112dc232, mimic, var_a39a25ddb1825426, var_17bc6acbb16c0769, var_ec2a6291d745649e, var_c2bab6b4faeb4e0d) {
    if (isstruct(var_a39a25ddb1825426)) {
        if (isdefined(level.var_f1e6d22d8d08c3a5[var_a39a25ddb1825426.lure_prop_type])) {
            var_57ad0dc40b2fdda = [[ level.var_f1e6d22d8d08c3a5[var_a39a25ddb1825426.lure_prop_type].handler ]](var_a39a25ddb1825426);
            activation_func = var_57ad0dc40b2fdda[1];
            prop = var_57ad0dc40b2fdda[0];
            var_a39a25ddb1825426 = prop;
            var_c2bab6b4faeb4e0d = activation_func;
        } else {
            var_a39a25ddb1825426 = function_72e4884f48bcab54(var_a39a25ddb1825426, var_ec2a6291d745649e);
        }
        if (isdefined(var_a39a25ddb1825426)) {
            var_86ca8e1c112dc232[var_86ca8e1c112dc232.size] = var_a39a25ddb1825426;
        }
    }
    if (!var_86ca8e1c112dc232.size) {
        return;
    }
    if (!isdefined(var_a39a25ddb1825426)) {
        var_f06a2edce44032b8 = array_randomize(var_86ca8e1c112dc232);
        foreach (prop in var_f06a2edce44032b8) {
            if (istrue(prop.var_1b98067f3a0cb593)) {
                var_a39a25ddb1825426 = prop;
                break;
            }
        }
        var_a39a25ddb1825426 = function_53c4c53197386572(var_a39a25ddb1825426, var_f06a2edce44032b8[0]);
    }
    if (!isdefined(var_a39a25ddb1825426)) {
        return;
    }
    level.var_c333aca3fe5f8c29 = function_6d6af8144a5131f1(level.var_c333aca3fe5f8c29, var_a39a25ddb1825426);
    if (isdefined(var_17bc6acbb16c0769)) {
        var_a39a25ddb1825426.origin = var_17bc6acbb16c0769;
    }
    function_7903ab5a9ef7f51e(mimic, var_a39a25ddb1825426, var_86ca8e1c112dc232, var_c2bab6b4faeb4e0d);
    return var_a39a25ddb1825426;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98e
// Size: 0xda
function function_1809c70d20427151(position) {
    if (function_48b1349a9ec06480(1)) {
        return 1;
    } else if (isdefined(position)) {
        var_1baee7f8317b909c = get_array_of_closest(position, level.var_682b8798cd1ca21c, undefined, undefined, 1000);
        foreach (spawn_point in var_1baee7f8317b909c) {
            if (isdefined(spawn_point.lure_prop_type) && isdefined(level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type]) && [[ level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type].var_d9212d524858ed7d ]](spawn_point)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa70
// Size: 0x24
function function_fe67f8f3027d7e36() {
    level.var_c333aca3fe5f8c29 = array_removeundefined(level.var_c333aca3fe5f8c29);
    return level.var_c333aca3fe5f8c29;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9c
// Size: 0x8a
function function_64c4514f0c04c092() {
    level.var_c333aca3fe5f8c29 = array_removeundefined(level.var_c333aca3fe5f8c29);
    var_925e4c81432bf4c8 = [];
    foreach (prop in level.var_c333aca3fe5f8c29) {
        if (!prop get("hide")) {
            var_925e4c81432bf4c8[var_925e4c81432bf4c8.size] = prop;
        }
    }
    return var_925e4c81432bf4c8;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2e
// Size: 0x13
function function_c7611d5bb2984c15() {
    if (!isdefined(level.var_f1e6d22d8d08c3a5)) {
        return [];
    }
    return [];
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb49
// Size: 0x17a
function function_3f1e49f4d09e7020(origin, radius, var_929915bf1b6066b6, var_12c1ebd2e12984d9) {
    var_1baee7f8317b909c = get_array_of_closest(origin, level.var_682b8798cd1ca21c, undefined, undefined, radius);
    var_a08abb5ab21c8166 = [];
    foreach (spawn_point in var_1baee7f8317b909c) {
        if (isdefined(spawn_point.lure_prop_type) && isdefined(level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type]) && ![[ level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type].var_d9212d524858ed7d ]](spawn_point)) {
            continue;
        }
        if (istrue(var_12c1ebd2e12984d9) && istrue(spawn_point.claimed)) {
            continue;
        }
        var_a08abb5ab21c8166[var_a08abb5ab21c8166.size] = spawn_point;
    }
    if (var_a08abb5ab21c8166.size > var_929915bf1b6066b6) {
        var_a08abb5ab21c8166 = array_randomize(var_a08abb5ab21c8166);
        array_size = var_a08abb5ab21c8166.size;
        for (i = 0; i < array_size; i++) {
            if (i >= var_929915bf1b6066b6) {
                var_a08abb5ab21c8166[i] = undefined;
            }
        }
    }
    if (var_a08abb5ab21c8166.size < var_929915bf1b6066b6 && isdefined(level.var_d4032c90a01fcf71)) {
        var_a08abb5ab21c8166 = array_combine(var_a08abb5ab21c8166, [[ level.var_d4032c90a01fcf71 ]](origin, var_929915bf1b6066b6 - var_a08abb5ab21c8166.size));
    }
    return var_a08abb5ab21c8166;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x51
function function_48b1349a9ec06480(var_929915bf1b6066b6, entity) {
    in_array = isdefined(entity) && array_contains(level.var_c1aeb5800a25fc5c, entity);
    return 20 - level.var_a0ab8c8dc1b484ea.size + level.var_c1aeb5800a25fc5c.size - in_array >= var_929915bf1b6066b6;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd24
// Size: 0x16e
function function_6942ed5cf6ec66c5(spawn_points, var_929915bf1b6066b6, entity, var_ec2a6291d745649e) {
    var_929915bf1b6066b6 = min(var_929915bf1b6066b6, spawn_points.size);
    level.var_a0ab8c8dc1b484ea = array_removeundefined(level.var_a0ab8c8dc1b484ea);
    var_86ca8e1c112dc232 = [];
    if (!function_48b1349a9ec06480(var_929915bf1b6066b6, entity)) {
        in_array = isdefined(entity) && array_contains(level.var_c1aeb5800a25fc5c, entity);
        if (level.var_a0ab8c8dc1b484ea.size + level.var_c1aeb5800a25fc5c.size >= 20) {
            return var_86ca8e1c112dc232;
        }
        var_929915bf1b6066b6 = 20 - level.var_a0ab8c8dc1b484ea.size + level.var_c1aeb5800a25fc5c.size - in_array;
    }
    if (!spawn_points.size) {
        return var_86ca8e1c112dc232;
    }
    spawn_points = array_randomize(spawn_points);
    foreach (loc in spawn_points) {
        if (function_883458a342af3041(loc.origin, 300).size) {
            continue;
        }
        if (isdefined(loc.lure_prop_type)) {
            var_86ca8e1c112dc232[var_86ca8e1c112dc232.size] = loc;
        } else {
            prop = function_72e4884f48bcab54(loc, var_ec2a6291d745649e);
            var_86ca8e1c112dc232[var_86ca8e1c112dc232.size] = prop;
            if (var_86ca8e1c112dc232.size >= var_929915bf1b6066b6) {
                break;
            }
        }
    }
    return var_86ca8e1c112dc232;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9a
// Size: 0x246
function function_e188ceb88ab77286(spawn_loc, var_ec2a6291d745649e) {
    bundle = undefined;
    if (isdefined(var_ec2a6291d745649e)) {
        bundle = getscriptbundle(var_ec2a6291d745649e);
    } else if (isdefined(spawn_loc.scriptbundlename)) {
        bundle = getscriptbundle(spawn_loc.scriptbundlename);
    } else if (isdefined(level.var_660d3f6e932dbe49)) {
        bundle = getscriptbundle(level.var_660d3f6e932dbe49);
    } else {
        bundle = getscriptbundle("mimicproplist:mimic_prop_list_default");
    }
    result = spawnstruct();
    if (!isdefined(bundle)) {
        result.var_1126685ee85ab1e2 = "decor_barrel_metal_rusty_01";
        result.var_6fb457c29faa6359 = (0, 0, 0);
        result.angle_offset = (0, 0, 0);
        result.var_274ce48b57b7b685 = 1;
        return result;
    }
    var_47c648dcdce3ffa5 = bundle.var_9fdd81c7fdbb8ed2[randomint(bundle.var_9fdd81c7fdbb8ed2.size)];
    if (!isdefined(var_47c648dcdce3ffa5)) {
        return undefined;
    }
    result.var_6fb457c29faa6359 = (function_53c4c53197386572(var_47c648dcdce3ffa5.offset_x, 0), function_53c4c53197386572(var_47c648dcdce3ffa5.offset_y, 0), function_53c4c53197386572(var_47c648dcdce3ffa5.offset_z, 0));
    result.angle_offset = (function_53c4c53197386572(var_47c648dcdce3ffa5.pitch, 0), function_53c4c53197386572(var_47c648dcdce3ffa5.yaw, 0), function_53c4c53197386572(var_47c648dcdce3ffa5.roll, 0));
    result.var_1126685ee85ab1e2 = var_47c648dcdce3ffa5.model;
    if (!isdefined(var_47c648dcdce3ffa5.model) && isdefined(var_47c648dcdce3ffa5.itemspawnentry)) {
        result.var_65a915817a7f4a40 = 1;
        result.var_1126685ee85ab1e2 = "itemspawnentry:" + var_47c648dcdce3ffa5.itemspawnentry;
    }
    result.var_201370eaf92ac7db = var_47c648dcdce3ffa5.var_201370eaf92ac7db;
    result.var_91013cb9036a51d8 = var_47c648dcdce3ffa5.var_62b718a2641f309;
    result.var_274ce48b57b7b685 = istrue(var_47c648dcdce3ffa5.var_f709cbf04455619a);
    return result;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e8
// Size: 0x318
function function_72e4884f48bcab54(spawn_loc, var_ec2a6291d745649e, var_76000a0eb3503385, var_38ca70c47a370ad1) {
    var_b8328de59ac77659 = function_e188ceb88ab77286(spawn_loc, var_ec2a6291d745649e);
    model_name = "tag_origin";
    var_bf2d5e2704ee3910 = undefined;
    var_a37db2cadacc4dfe = undefined;
    spawn_loc.angles = function_53c4c53197386572(spawn_loc.angles, (0, 0, 0));
    if (istrue(var_b8328de59ac77659.var_65a915817a7f4a40)) {
        itemspawnentry = getscriptbundle(var_b8328de59ac77659.var_1126685ee85ab1e2);
        var_b8328de59ac77659.var_6fb457c29faa6359 = (function_53c4c53197386572(itemspawnentry.var_71434a5acf1c30eb, 0), function_53c4c53197386572(itemspawnentry.var_7143495acf1c2eb8, 0), function_53c4c53197386572(itemspawnentry.var_71434c5acf1c3551, 0));
        var_b8328de59ac77659.angle_offset = (function_53c4c53197386572(itemspawnentry.var_1f05ac25981886ad, 0), function_53c4c53197386572(itemspawnentry.var_1f05ab259818847a, 0), function_53c4c53197386572(itemspawnentry.var_1f05aa2598188247, 0));
        if (isdefined(itemspawnentry.scriptable)) {
            var_a37db2cadacc4dfe = itemspawnentry.scriptable;
            var_bf2d5e2704ee3910 = spawnscriptable(itemspawnentry.scriptable, spawn_loc.origin + var_b8328de59ac77659.var_6fb457c29faa6359, spawn_loc.angles + var_b8328de59ac77659.angle_offset);
            var_bf2d5e2704ee3910.disable = 1;
        }
        if (isdefined(itemspawnentry.worldmodel)) {
            model_name = itemspawnentry.worldmodel;
        }
    } else {
        model_name = var_b8328de59ac77659.var_1126685ee85ab1e2;
    }
    if (isdefined(var_76000a0eb3503385)) {
        model_name = var_76000a0eb3503385;
    }
    if (!istrue(var_38ca70c47a370ad1)) {
        playfx(getfx("mimic_prop_spawn_in_fx"), spawn_loc.origin + var_b8328de59ac77659.var_6fb457c29faa6359);
    }
    model = utility::spawn_model(model_name, spawn_loc.origin + var_b8328de59ac77659.var_6fb457c29faa6359, spawn_loc.angles + var_b8328de59ac77659.angle_offset);
    spawn_loc.claimed = 1;
    model.spawn_loc = spawn_loc;
    model.var_201370eaf92ac7db = var_b8328de59ac77659.var_201370eaf92ac7db;
    model.var_274ce48b57b7b685 = var_b8328de59ac77659.var_274ce48b57b7b685;
    model.var_91013cb9036a51d8 = var_b8328de59ac77659.var_91013cb9036a51d8;
    model.var_bf2d5e2704ee3910 = var_bf2d5e2704ee3910;
    model.var_a37db2cadacc4dfe = var_a37db2cadacc4dfe;
    if (istrue(model.var_274ce48b57b7b685)) {
        model.navobstacle = createnavobstaclebyent(model);
    } else {
        model notsolid();
    }
    model thread_on_notify_no_endon_death("death", &function_1eaeeddcc77f7896);
    level.var_a0ab8c8dc1b484ea[level.var_a0ab8c8dc1b484ea.size] = model;
    return model;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1408
// Size: 0x3f
function function_1eaeeddcc77f7896() {
    if (isdefined(self.spawn_loc)) {
        self.spawn_loc.claimed = undefined;
    }
    if (isdefined(self.var_3b320b9f87d84c81)) {
        self.var_3b320b9f87d84c81 delete();
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144e
// Size: 0x4f
function function_cfa8ac2b4b30b60(entity) {
    var_48b1349a9ec06480 = function_48b1349a9ec06480(1, entity);
    if (var_48b1349a9ec06480 && !array_contains(level.var_c1aeb5800a25fc5c, entity)) {
        level.var_c1aeb5800a25fc5c[level.var_c1aeb5800a25fc5c.size] = entity;
    }
    return var_48b1349a9ec06480;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a5
// Size: 0x25
function function_758159430083e297(entity) {
    level.var_c1aeb5800a25fc5c = array_remove(level.var_c1aeb5800a25fc5c, entity);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d1
// Size: 0x188
function function_6463c3c6bfff5460(prop, var_86ca8e1c112dc232, condition_func) {
    if (!isdefined(condition_func)) {
        condition_func = &function_aba5d57ebacc9eca;
    }
    prop.var_1b98067f3a0cb593 = 1;
    prop.var_599dd4f330308ca3 = getclosestpointonnavmesh(prop.origin);
    if (isdefined(prop.var_599dd4f330308ca3)) {
        if (abs(prop.origin[2] - prop.var_599dd4f330308ca3[2]) > 64) {
            prop.var_599dd4f330308ca3 = undefined;
        }
        if (isdefined(prop.var_599dd4f330308ca3) && istrue(prop.var_274ce48b57b7b685)) {
            prop thread function_64e3a7fad130e985();
        }
    }
    prop thread function_2ec989be14ef1ba3(condition_func);
    if (!isdefined(prop.lure_prop_type)) {
        prop thread function_67c6c3ee54255f52();
        prop val::reset("mimic_spawn", "hide");
    }
    if (istrue(prop.var_274ce48b57b7b685)) {
        prop solid();
    }
    if (isdefined(prop.var_91013cb9036a51d8)) {
        level thread function_810e1686a0bf4f11(prop);
    }
    if (isdefined(prop.var_a37db2cadacc4dfe) && !isdefined(prop.var_bf2d5e2704ee3910)) {
        prop.var_bf2d5e2704ee3910 = spawnscriptable(prop.var_a37db2cadacc4dfe, prop.origin, prop.angles);
        prop.var_bf2d5e2704ee3910.disable = 1;
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1660
// Size: 0x47
function function_64e3a7fad130e985() {
    self endon("death_or_disconnect");
    wait(1);
    if (isdefined(self)) {
        v_forward = anglestoforward(self.angles) * 8;
        self.var_599dd4f330308ca3 = getclosestpointonnavmesh(self.var_599dd4f330308ca3 + v_forward);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ae
// Size: 0xc4
function function_810e1686a0bf4f11(prop) {
    var_c696168f8ee0be6e = getrandomnavpoints(prop.origin, 48, 12);
    if (var_c696168f8ee0be6e.size == 0) {
        return;
    }
    if (isdefined(level.var_1654879168aff1ca)) {
        loc = [[ level.var_1654879168aff1ca ]](prop.origin, var_c696168f8ee0be6e);
    } else {
        loc = function_7a2aaa4a09a4d250(var_c696168f8ee0be6e);
    }
    if (!isdefined(loc)) {
        return;
    }
    var_8e09651a6fc0baf0 = utility::groundpos(loc, 32);
    var_da100663ad724529 = utility::spawn_model(prop.var_91013cb9036a51d8, var_8e09651a6fc0baf0, (0, 0, 0));
    if (isdefined(var_da100663ad724529)) {
        prop.var_da100663ad724529 = var_da100663ad724529;
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1779
// Size: 0x5f
function function_7903ab5a9ef7f51e(mimic, var_a39a25ddb1825426, var_86ca8e1c112dc232, var_c2bab6b4faeb4e0d) {
    /#
        assert(array_contains(var_86ca8e1c112dc232, var_a39a25ddb1825426), "trap prop must be in mimic prop array");
    #/
    var_a39a25ddb1825426.var_86ca8e1c112dc232 = var_86ca8e1c112dc232;
    if (isdefined(mimic)) {
        function_67db44d38891dc3f(mimic, var_a39a25ddb1825426);
    }
    function_6463c3c6bfff5460(var_a39a25ddb1825426, var_86ca8e1c112dc232, var_c2bab6b4faeb4e0d);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17df
// Size: 0x42
function function_d4032c90a01fcf71(origin, num_points) {
    if (!isdefined(origin)) {
        return [];
    }
    spawn_points = function_848b07e8d4887cc8(origin, num_points * 2, 50, 1000, 0);
    spawn_points = function_422f1d07881ec8b3(spawn_points, num_points);
    return spawn_points;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1829
// Size: 0xb6
function function_422f1d07881ec8b3(points, num) {
    var_553a299d31ba3a7b = [];
    var_1c8fac2b39577df = array_removeundefined(level.var_a0ab8c8dc1b484ea);
    foreach (point in points) {
        if (get_array_of_closest(point.origin, var_1c8fac2b39577df, undefined, undefined, 32).size > 0) {
            continue;
        }
        var_553a299d31ba3a7b[var_553a299d31ba3a7b.size] = point;
        var_1c8fac2b39577df[var_1c8fac2b39577df.size] = point;
        if (var_553a299d31ba3a7b.size >= num) {
            break;
        }
    }
    return var_553a299d31ba3a7b;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e7
// Size: 0x324
function function_aba5d57ebacc9eca() {
    prop_height = (0, 0, 64);
    players = function_883458a342af3041(self.origin, 400);
    if (players.size) {
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            if (istrue(player.ignoreme) || istrue(player.inlaststand) || istrue(player.notarget) || istrue(player.var_f2f5db77ae69537f)) {
                continue;
            }
            /#
                if (getdvarint(@"hash_821690ed248715f7", 0)) {
                    sphere(player.origin, 20, (0, 1, 0), 0, 1, 1);
                }
            #/
            if (isdefined(player.last_valid_position) && isdefined(self.var_599dd4f330308ca3)) {
                if (!ray_trace_passed(player.last_valid_position, self.var_599dd4f330308ca3, [0:self], create_default_contents(1))) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(player.last_valid_position, self.var_599dd4f330308ca3, (0, 1, 1), 1, 0, 1);
                            sphere(self.var_599dd4f330308ca3, 20, (1, 0, 0), 0, 1, 1);
                        }
                    #/
                    continue;
                }
            } else {
                var_dace4b70df8d5f18 = player gettagorigin("j_spine4");
                var_dace4b70df8d5f18 = function_53c4c53197386572(var_dace4b70df8d5f18, player getcentroid());
                if (isdefined(var_dace4b70df8d5f18) && !sighttracepassed(self.origin + prop_height, var_dace4b70df8d5f18, 0, self)) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(self.origin + prop_height, player gettagorigin("mimic_trap_prop"), (1, 1, 0), 1, 0, 1);
                        }
                    #/
                    continue;
                }
            }
            traceresult = playerphysicstrace(self.origin + (0, 0, 20), player.origin + (0, 0, 36), player, undefined, self, 1);
            if (traceresult["fraction"] >= 1) {
                self notify("stop_shake_tell");
                return player;
            } else {
                /#
                    if (getdvarint(@"hash_821690ed248715f7", 0)) {
                        line(self.origin + (0, 0, 8), player.origin + (0, 0, 8), (1, 0, 0), 1, 0, 1);
                        sphere(traceresult["evt_mimic_prop_hide"], 4, (1, 0, 0), 1, 0, 10, 1);
                    }
                #/
            }
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c12
// Size: 0xdd
function function_2ec989be14ef1ba3(condition_func) {
    self endon("death");
    self endon("damage_transform");
    self endon("normal_transform");
    level endon("game_ended");
    if (!isdefined(level.var_5370b827a6ad3135)) {
        level.var_5370b827a6ad3135 = function_e4c99b0f178ffb98("mimic_trap_prop", 1);
    }
    while (1) {
        function_f632348cbb773537(level.var_5370b827a6ad3135, self);
        if (istrue(self.var_7e3f8347d5eb301)) {
            continue;
        }
        activator = self [[ condition_func ]]();
        if (isdefined(activator)) {
            var_26199be621b1a0c1 = [0:activator];
            if (isdefined(self.health) && self.health > 0) {
                function_adf6ced03ffc2317(self, 0.35, 0.05, 8);
            }
            level thread function_e75fec4bcc652aa7(self, var_26199be621b1a0c1);
            self notify("normal_transform");
            return;
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf6
// Size: 0x87
function function_cfd6ffd040b07d99() {
    self.var_3fd0a58809891531 = 1;
    self.original_angles = self.angles;
    while (1) {
        result = waittill_any_timeout_2(2, "death", "stop_shake_tell");
        if (result != "timeout") {
            break;
        }
        function_adf6ced03ffc2317(self, 0.75, 0.05, 2);
    }
    if (isdefined(self)) {
        self.angles = self.original_angles;
        self.var_3fd0a58809891531 = undefined;
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d84
// Size: 0xce
function function_adf6ced03ffc2317(var_a39a25ddb1825426, total_time, var_ab8ad61788593b44, angle) {
    original_angles = var_a39a25ddb1825426.angles;
    iterations = total_time / var_ab8ad61788593b44;
    var_14bd8133ea055d87 = var_a39a25ddb1825426.angles[2];
    var_24a23bc9d1800003 = angle;
    playsoundatpos(var_a39a25ddb1825426.origin + (0, 0, 50), "evt_mimic_prop_rattle");
    for (i = 0; i < iterations; i++) {
        var_a39a25ddb1825426 rotateroll(var_14bd8133ea055d87 + var_24a23bc9d1800003, var_ab8ad61788593b44);
        var_24a23bc9d1800003 = var_24a23bc9d1800003 * -1;
        wait(var_ab8ad61788593b44);
    }
    var_a39a25ddb1825426.angles = original_angles;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e59
// Size: 0x13e
function function_67c6c3ee54255f52() {
    self endon("death");
    self endon("normal_transform");
    level endon("game_ended");
    self.health = function_53c4c53197386572(self.var_d0f9920c0e8883a6, 50000);
    self setcandamage(1);
    if (isdefined(self.var_3b320b9f87d84c81)) {
        self.var_3b320b9f87d84c81 thread function_d656de476c348bb0(self);
    }
    self.var_eec300d92b90f34f = 0;
    self.var_f3e89f9924fb5b0d = 0;
    while (1) {
        eattacker = idamage = self waittill("damage");
        if (istrue(self.var_7e3f8347d5eb301) || !isplayer(eattacker)) {
            continue;
        }
        if (gettime() - self.var_f3e89f9924fb5b0d > 3000) {
            self.var_eec300d92b90f34f = 0;
        }
        self.var_eec300d92b90f34f = self.var_eec300d92b90f34f + idamage;
        self.var_f3e89f9924fb5b0d = gettime();
        if (self.var_eec300d92b90f34f >= 100) {
            self notify("damage_transform");
            function_e75fec4bcc652aa7(self, [0:eattacker]);
            break;
        }
    }
    self setcandamage(0);
    if (isdefined(self.var_3b320b9f87d84c81)) {
        self.var_3b320b9f87d84c81 setcandamage(0);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9e
// Size: 0x78
function function_d656de476c348bb0(var_f5248464c1def03e) {
    self endon("death");
    var_f5248464c1def03e endon("death");
    level endon("game_ended");
    self.health = var_f5248464c1def03e.health;
    self setcandamage(1);
    while (isdefined(self)) {
        eattacker = idamage = self waittill("damage");
        var_f5248464c1def03e dodamage(idamage, var_f5248464c1def03e.origin, eattacker);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201d
// Size: 0x25
function function_f1b281379e1bd04a(var_a39a25ddb1825426, mimic) {
    mimic.var_93b2dcf9e6627180 = gettime();
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2049
// Size: 0x2a0
function function_e75fec4bcc652aa7(prop, var_26199be621b1a0c1, var_6d5decd8aef13a62) {
    if (isdefined(prop.var_bcdf27dd514533da)) {
        [[ prop.var_bcdf27dd514533da ]](prop);
        prop.var_bcdf27dd514533da = undefined;
    }
    var_7b9d33a951d0fc6 = spawnstruct();
    var_7b9d33a951d0fc6.var_26199be621b1a0c1 = var_26199be621b1a0c1;
    var_7b9d33a951d0fc6.var_6d5decd8aef13a62 = var_6d5decd8aef13a62;
    if (isdefined(prop.var_78e6855c5c07bc61)) {
        prop.var_78e6855c5c07bc61 = array_removeundefined(prop.var_78e6855c5c07bc61);
        foreach (entity in prop.var_78e6855c5c07bc61) {
            function_f1b281379e1bd04a(prop, entity);
            entity callback::callback("on_entity_revealed", var_7b9d33a951d0fc6);
        }
    } else {
        var_617f377e9b0ed62b = function_c9eebf69d9a55148() > 0;
        if (!var_617f377e9b0ed62b && isdefined(level.var_9d1fbf6653feac9c) && [[ level.var_9d1fbf6653feac9c ]]()) {
            var_617f377e9b0ed62b = 1;
        }
        if (var_617f377e9b0ed62b) {
            /#
                assert(isdefined(level.var_f52f26854571caa1));
            #/
            var_749df5ee6b70c1f3 = spawnnewaitype_sharedfunc(level.var_f52f26854571caa1, prop.origin, prop.angles, prop.team);
            if (isdefined(var_749df5ee6b70c1f3)) {
                function_67db44d38891dc3f(var_749df5ee6b70c1f3, prop);
                function_f1b281379e1bd04a(prop, var_749df5ee6b70c1f3);
                waitframe();
                if (isdefined(var_749df5ee6b70c1f3)) {
                    var_749df5ee6b70c1f3 callback::callback("on_entity_revealed", var_7b9d33a951d0fc6);
                }
            }
        } else {
            /#
                println("<unknown string>");
            #/
        }
    }
    if (!isdefined(prop)) {
        return;
    }
    playfx(getfx("mimic_prop_rattle_fx"), prop.origin + (0, 0, 16));
    prop.var_78e6855c5c07bc61 = undefined;
    if (!isdefined(prop.lure_prop_type)) {
        prop set("mimic_spawn", "hide", 1);
        prop notsolid();
        destroynavobstacle(prop.navobstacle);
    }
    if (isdefined(prop.var_da100663ad724529)) {
        prop.var_da100663ad724529 delete();
        prop.var_da100663ad724529 = undefined;
    }
    if (isdefined(prop.var_bf2d5e2704ee3910)) {
        prop.var_bf2d5e2704ee3910 freescriptable();
        prop.var_bf2d5e2704ee3910 = undefined;
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f0
// Size: 0x124
function function_67db44d38891dc3f(entity, prop) {
    /#
        assert(!istrue(entity.hidden_in_prop), "ENTITY ALREADY HIDDEN IN PROP");
    #/
    if (!isdefined(entity.var_86ca8e1c112dc232)) {
        entity callback::add("on_ai_killed", &function_1a021b134eae1dd9);
    }
    entity.hidden_in_prop = 1;
    entity.var_a39a25ddb1825426 = prop;
    entity.var_aeef4bfd13b1479b = 1;
    entity.var_86ca8e1c112dc232 = prop.var_86ca8e1c112dc232;
    entity hide();
    entity setsolid(0);
    entity dontinterpolate();
    entity forceteleport(prop.origin, prop.angles);
    params = spawnstruct();
    params.prop = prop;
    entity callback::callback("on_entity_hidden_in_prop", params);
    if (!isdefined(prop.var_78e6855c5c07bc61)) {
        prop.var_78e6855c5c07bc61 = [];
    }
    prop.var_78e6855c5c07bc61[prop.var_78e6855c5c07bc61.size] = entity;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241b
// Size: 0x98
function function_1a021b134eae1dd9(params) {
    self.var_86ca8e1c112dc232 = array_removeundefined(self.var_86ca8e1c112dc232);
    foreach (prop in self.var_86ca8e1c112dc232) {
        if (isdefined(prop.var_a295306038aa1d4e)) {
            [[ prop.var_a295306038aa1d4e ]]();
        }
        level thread clean_up_prop(prop);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ba
// Size: 0x1c9
function clean_up_prop(prop, var_9721d21bc5d214cf) {
    if (!isdefined(prop)) {
        return;
    }
    level endon("game_ended");
    prop endon("death");
    if (isdefined(prop.var_78e6855c5c07bc61)) {
        foreach (var_c8b7e792810361cd in prop.var_78e6855c5c07bc61) {
            if (isdefined(var_c8b7e792810361cd)) {
                var_c8b7e792810361cd kill();
            }
        }
    }
    level.var_a0ab8c8dc1b484ea = array_remove(level.var_a0ab8c8dc1b484ea, prop);
    level.var_c333aca3fe5f8c29 = array_remove(level.var_c333aca3fe5f8c29, prop);
    if (isdefined(prop.var_bcdf27dd514533da)) {
        [[ prop.var_bcdf27dd514533da ]](prop);
        prop.var_bcdf27dd514533da = undefined;
    }
    prop notify("clean_up_prop");
    if (isdefined(prop.origin) && function_53c4c53197386572(var_9721d21bc5d214cf, 1)) {
        playfx(getfx("mimic_prop_spawn_out_fx"), prop.origin);
        playsoundatpos(prop.origin + (0, 0, 16), "evt_mimic_prop_hide");
    }
    if (isdefined(prop.lure_prop_type)) {
        return;
    }
    wait(0.5);
    if (isdefined(prop.var_da100663ad724529)) {
        prop.var_da100663ad724529 delete();
        prop.var_da100663ad724529 = undefined;
    }
    if (isdefined(prop.var_bf2d5e2704ee3910)) {
        prop.var_bf2d5e2704ee3910 freescriptable();
        prop.var_bf2d5e2704ee3910 = undefined;
    }
    if (isdefined(prop)) {
        prop delete();
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268a
// Size: 0x5f
function function_eb1dd015e483d450() {
    foreach (prop in level.var_a0ab8c8dc1b484ea) {
        if (isdefined(prop)) {
            level thread clean_up_prop(prop);
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f0
// Size: 0x7a
function function_2ad988fad3f5640a(type, handler, var_d9212d524858ed7d) {
    if (!isdefined(level.var_f1e6d22d8d08c3a5)) {
        level.var_f1e6d22d8d08c3a5 = [];
    }
    if (isdefined(level.var_f1e6d22d8d08c3a5[type])) {
        return;
    }
    struct = spawnstruct();
    struct.handler = handler;
    struct.var_d9212d524858ed7d = var_d9212d524858ed7d;
    level.var_f1e6d22d8d08c3a5[type] = struct;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2771
// Size: 0x85
function function_a0a440abb6e3a58c(var_bd871e10d3a80cc) {
    interact = var_bd871e10d3a80cc.interact;
    interact.prop = var_bd871e10d3a80cc;
    var_bd871e10d3a80cc.var_d4c527857c291502 = interact.var_a4f3ccfb11edb890;
    var_bd871e10d3a80cc.var_bcdf27dd514533da = &function_e5c6fa983a28e681;
    interact.var_a4f3ccfb11edb890 = [0:&function_29d684619e0e9b67];
    var_bd871e10d3a80cc thread function_edb702a6a2c74fe4();
    return [0:var_bd871e10d3a80cc, 1:&function_a448e9db6dccda8c];
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27fe
// Size: 0x63
function function_88975b39ffe44df4(var_4d3939e69e9924c0) {
    if (!isdefined(var_4d3939e69e9924c0)) {
        return;
    }
    var_a39a25ddb1825426 = var_4d3939e69e9924c0.prop;
    var_a39a25ddb1825426.spawn_loc = var_4d3939e69e9924c0;
    var_a39a25ddb1825426.var_d0f9920c0e8883a6 = 5;
    var_a39a25ddb1825426.var_bcdf27dd514533da = &function_e5c6fa983a28e681;
    return [0:var_a39a25ddb1825426, 1:&function_a448e9db6dccda8c];
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2869
// Size: 0x7f
function function_553070123dc9c35c(var_1d276cc8b7a4655) {
    if (!isdefined(var_1d276cc8b7a4655)) {
        return;
    }
    var_a39a25ddb1825426 = var_1d276cc8b7a4655.prop;
    var_a39a25ddb1825426.var_701e344d56d554af = 1;
    var_a39a25ddb1825426.spawn_loc = var_1d276cc8b7a4655;
    var_a39a25ddb1825426.var_8defbdfee199a2a5 = 1;
    var_a39a25ddb1825426.var_96c813a56beaaf2 = 1;
    var_a39a25ddb1825426.var_bcdf27dd514533da = &function_77c73d45c45f60a5;
    return [0:var_a39a25ddb1825426, 1:&function_a448e9db6dccda8c];
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28f0
// Size: 0x1f
function function_9629594923eec1e6(params) {
    self notify("mimic_prop_activated", params.attacker);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2916
// Size: 0x1d
function function_29d684619e0e9b67(player) {
    self.prop notify("mimic_prop_activated", player);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x293a
// Size: 0x1f
function function_db598041df08c5f7(var_985e82f034f67960) {
    self.var_701e344d56d554af = 0;
    self notify("mimic_prop_activated", var_985e82f034f67960);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2960
// Size: 0x20
function function_a448e9db6dccda8c(params) {
    activator = self waittill("mimic_prop_activated");
    return activator;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2988
// Size: 0x31
function function_e5c6fa983a28e681(var_a39a25ddb1825426) {
    if (!isdefined(var_a39a25ddb1825426.interact)) {
        return;
    }
    level thread function_ab75bd4f28f5eb10(var_a39a25ddb1825426.interact, var_a39a25ddb1825426);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c0
// Size: 0x8e
function function_ab75bd4f28f5eb10(interact, prop) {
    level endon("game_ended");
    interact endon("death");
    interact set("mimic_lure_transform", "hide", 1);
    interact notsolid();
    interact connectpaths();
    prop waittill("clean_up_prop");
    interact val::reset("mimic_lure_transform", "hide");
    interact solid();
    interact disconnectpaths();
    interact.var_a4f3ccfb11edb890 = prop.var_d4c527857c291502;
    interact.prop = undefined;
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a55
// Size: 0x18
function function_77c73d45c45f60a5(var_9e478ec42564a5d9) {
    level thread function_19f7406fbbc48ed2(var_9e478ec42564a5d9, 5);
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a74
// Size: 0x57
function function_19f7406fbbc48ed2(vehicle, var_52a8d71d7aa72023) {
    level endon("game_ended");
    vehicle set("mimic_lure_transform", "hide", 1);
    vehicle notsolid();
    wait(var_52a8d71d7aa72023);
    if (!isdefined(vehicle)) {
        return;
    }
    vehicle val::reset("mimic_lure_transform", "hide");
    vehicle solid();
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad2
// Size: 0x84
function function_2570f796cde55c74() {
    foreach (prop in level.var_c333aca3fe5f8c29) {
        if (!isdefined(prop) || prop get("hide")) {
            continue;
        }
        level thread function_e75fec4bcc652aa7(prop, level.players);
        prop notify("normal_transform");
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b5d
// Size: 0x4f
function function_edb702a6a2c74fe4() {
    level endon("game_ended");
    self endon("mimic_prop_activated");
    self endon("clean_up_prop");
    wait(60);
    while (1) {
        activator = self.interact function_aba5d57ebacc9eca();
        if (isdefined(activator)) {
            self notify("mimic_prop_activated", activator);
            return;
        }
        wait(1);
    }
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb3
// Size: 0x18e
function function_f40e9354c7ef87f2() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4b9ff448d5a356bb, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9d27ad32448f646e, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_62ce6d2d2ec84db1, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_e4a73e61d489e88b, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bcf7a4f5c74762af);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7b9ff72e64814cf1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_88698d5c32de5b3c, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_343c21a6fb381025, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_eaceefb9f66950f9);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a5ebbdcfeec725ff);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_eb1dd015e483d450);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_2570f796cde55c74);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_8cca940d666433ca);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_852ebf03a4be71c);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_69ebd21eee2b20cf);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_69ebd21eee2b20cf);
        function_fe953f000498048f();
        level thread function_d94c9b7be6d072e6();
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d48
// Size: 0x111
function function_d94c9b7be6d072e6() {
    /#
        level endon("<unknown string>");
        var_cd3d2cc76d2c038a = [];
        foreach (point in level.var_682b8798cd1ca21c) {
            if (isdefined(point.scriptbundlename) && !array_contains(var_cd3d2cc76d2c038a, point.scriptbundlename)) {
                var_cd3d2cc76d2c038a[var_cd3d2cc76d2c038a.size] = point.scriptbundlename;
            }
        }
        if (!var_cd3d2cc76d2c038a.size) {
            return;
        }
        function_6e7290c8ee4f558b("<unknown string>");
        foreach (name in var_cd3d2cc76d2c038a) {
            function_b23a59dfb4ca49a1(name, "<unknown string>" + name, &function_a5acf46239ebdd51);
        }
        function_fe953f000498048f();
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e60
// Size: 0x1b
function function_a5acf46239ebdd51(params) {
    /#
        level.var_209f58916eee1fee = params[0];
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e82
// Size: 0x46
function function_69ebd21eee2b20cf(params) {
    /#
        dvar_name = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", params[0]);
        var_ceedf73d8321005e = getdvarint(dvar_name, 0);
        setdvar(dvar_name, !var_ceedf73d8321005e);
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ecf
// Size: 0x10e
function function_4b9ff448d5a356bb() {
    /#
        while (1) {
            foreach (var_a39a25ddb1825426 in level.var_c333aca3fe5f8c29) {
                if (!isdefined(var_a39a25ddb1825426)) {
                    continue;
                }
                color = ter_op(istrue(var_a39a25ddb1825426.var_7e3f8347d5eb301), (1, 0, 0), (1, 1, 0));
                debugstar(var_a39a25ddb1825426.origin, color, 1);
                line(var_a39a25ddb1825426.origin, var_a39a25ddb1825426.origin + (0, 0, 900), color);
                if (istrue(var_a39a25ddb1825426.var_7e3f8347d5eb301)) {
                    print3d(var_a39a25ddb1825426.origin + (0, 0, 48), "<unknown string>", color);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fe4
// Size: 0x95
function function_9d27ad32448f646e() {
    /#
        while (1) {
            foreach (prop in level.var_a0ab8c8dc1b484ea) {
                if (!isdefined(prop) || istrue(prop.var_1b98067f3a0cb593)) {
                    continue;
                }
                debugstar(prop.origin, (0, 1, 0), 1);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3080
// Size: 0x89
function function_7edad2172f1d933() {
    /#
        waitframe();
        player = level.players[0];
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 2000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        endposition = physicstrace(eye, eye + direction_vec, 0);
        return endposition;
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3110
// Size: 0x44
function function_bcf7a4f5c74762af() {
    /#
        position = function_7edad2172f1d933();
        spawn_points = function_d4032c90a01fcf71(position, 5);
        if (!spawn_points.size) {
            return;
        }
        function_7f3bb3916bbd189d(spawn_points, undefined, undefined, level.var_209f58916eee1fee);
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x315b
// Size: 0x18d
function function_88698d5c32de5b3c() {
    /#
        spawn_points = getstructarray("<unknown string>", "<unknown string>");
        var_4b1319b2faba3d7 = [];
        foreach (point in spawn_points) {
            if (distancesquared(point.origin, level.players[0].origin) <= squared(7000)) {
                var_4b1319b2faba3d7 = array_add(var_4b1319b2faba3d7, point);
                function_7f3bb3916bbd189d([0:point], undefined, undefined, point.proplist);
            }
        }
        while (1) {
            foreach (point in var_4b1319b2faba3d7) {
                if (!isdefined(point)) {
                    continue;
                }
                color = ter_op(istrue(point.var_7e3f8347d5eb301), (1, 0, 0), (1, 1, 0));
                debugstar(point.origin, color, 1);
                line(point.origin, point.origin + (0, 0, 900), color);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32ef
// Size: 0x173
function function_343c21a6fb381025() {
    /#
        spawn_points = getstructarray("<unknown string>", "<unknown string>");
        var_4b1319b2faba3d7 = [];
        foreach (point in spawn_points) {
            if (distancesquared(point.origin, level.players[0].origin) <= squared(7000)) {
                var_4b1319b2faba3d7 = array_add(var_4b1319b2faba3d7, point);
            }
        }
        while (1) {
            foreach (point in var_4b1319b2faba3d7) {
                if (!isdefined(point)) {
                    continue;
                }
                color = ter_op(istrue(point.var_7e3f8347d5eb301), (1, 0, 0), (1, 1, 0));
                debugstar(point.origin, color, 1);
                line(point.origin, point.origin + (0, 0, 900), color);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3469
// Size: 0x23
function function_7b9ff72e64814cf1() {
    /#
        position = function_7edad2172f1d933();
        function_232cabbc43f9536(position, undefined, undefined, 3);
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3493
// Size: 0x23
function function_eaceefb9f66950f9() {
    /#
        position = function_7edad2172f1d933();
        function_232cabbc43f9536(position, undefined, undefined, 1);
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34bd
// Size: 0x6d
function function_a5ebbdcfeec725ff() {
    /#
        mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(mimic)) {
            mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        }
        if (isdefined(mimic)) {
            mimic function_3e89eb3d8e3f1811("<unknown string>", 1);
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3531
// Size: 0x6d
function function_852ebf03a4be71c() {
    /#
        mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(mimic)) {
            mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        }
        if (isdefined(mimic)) {
            mimic function_3e89eb3d8e3f1811("<unknown string>", 1);
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35a5
// Size: 0x7e
function function_62ce6d2d2ec84db1() {
    /#
        while (1) {
            foreach (point in level.var_682b8798cd1ca21c) {
                debugstar(point.origin, (1, 0, 0), 20);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x362a
// Size: 0xc3
function function_e4a73e61d489e88b() {
    /#
        while (1) {
            spawn_points = function_c7611d5bb2984c15();
            foreach (point in spawn_points) {
                debugstar(point.origin, (0, 1, 0), 100);
                line(point.origin, point.origin + (0, 0, 64), (0, 1, 0), 1, 0, 100);
            }
            wait(5);
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f4
// Size: 0x4e
function function_8cca940d666433ca() {
    /#
        position = function_7edad2172f1d933();
        var_7132f053db6712d = function_c7611d5bb2984c15();
        if (!var_7132f053db6712d.size) {
            return;
        }
        var_66fbacfa7822d8b8 = getclosest(position, var_7132f053db6712d);
        function_7f3bb3916bbd189d([0:var_66fbacfa7822d8b8]);
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3749
// Size: 0xcf
function function_c1d66d6d7270be71() {
    /#
        var_2a6598e14a6eaf76 = function_c7611d5bb2984c15();
        var_2a6598e14a6eaf76 = array_combine(level.var_682b8798cd1ca21c, var_2a6598e14a6eaf76);
        waitframe();
        while (1) {
            position = function_7edad2172f1d933();
            debugstar(position, (0, 1, 1), 100);
            spawn_points = sortbydistance(var_2a6598e14a6eaf76, position);
            foreach (point in spawn_points) {
                info = function_cb384ef3ead500b8(point);
                function_d4e0c52a6a9dbeba(info);
            }
            wait(5);
        }
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x381f
// Size: 0x14b
function private function_cb384ef3ead500b8(point) {
    /#
        if (isdefined(point.lure_prop_type)) {
            switch (point.lure_prop_type) {
            case 0:
                new_point = function_53c4c53197386572(point.trigger.scriptmodel, point.scriptmodel);
                point = function_53c4c53197386572(new_point, point);
                break;
            case 1:
                if (isdefined(point.targetname) && point.targetname == "<unknown string>") {
                    point = point.machine;
                }
                break;
            default:
                break;
            }
            new_origin = point.origin;
        } else {
            new_origin = utility::groundpos(point.origin, 15);
        }
        var_3fb598331c1f75ff = spawnstruct();
        var_3fb598331c1f75ff.origin = new_origin;
        var_3fb598331c1f75ff.angles = point.angles;
        var_3fb598331c1f75ff.var_145ce6879451e2d9 = [];
        emerge_anim = "<unknown string>";
        return var_3fb598331c1f75ff;
    #/
}

// Namespace namespace_f35b248fe3d46dfb/namespace_6119efd5d1925c17
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3971
// Size: 0xf8
function private function_d4e0c52a6a9dbeba(var_3fb598331c1f75ff) {
    /#
        foreach (var_145ce6879451e2d9 in var_3fb598331c1f75ff.var_145ce6879451e2d9) {
            color = ter_op(var_145ce6879451e2d9.passed, (0, 1, 0), (1, 0, 0));
            debugstar(var_145ce6879451e2d9.var_b1aea98e59422399, color, 100);
            line(var_145ce6879451e2d9.var_b1aea98e59422399, var_145ce6879451e2d9.var_28a36f0010068608, color, 1, 0, 100);
            line(var_145ce6879451e2d9.var_9bcb36ea1f3ad667, var_145ce6879451e2d9.var_b1aea98e59422399, (1, 0, 1), 1, 0, 100);
        }
    #/
}

