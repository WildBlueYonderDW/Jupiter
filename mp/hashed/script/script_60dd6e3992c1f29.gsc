#using script_16ea1b94f0f381b3;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using scripts\anim\utility_common;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\throttle;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_f35b248fe3d46dfb;

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x454
// Size: 0x73
function function_4417babebd3bada7(params) {
    level._effect["mimic_prop_emerge_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_emerge_base.vfx");
    level._effect["mimic_prop_spawn_in_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_prop_spawn_in.vfx");
    level._effect["mimic_prop_spawn_out_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_prop_spawn_out.vfx");
    level._effect["mimic_prop_rattle_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_prop_shake.vfx");
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf
// Size: 0x100
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
    wait 5;
    var_aee622405433fd31 = getstructarray("ambient_mimic_spawn", "script_noteworthy");
    foreach (point in var_aee622405433fd31) {
        level.var_682b8798cd1ca21c = function_6d6af8144a5131f1(level.var_682b8798cd1ca21c, point);
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7
// Size: 0x136
function function_60ec83db29237577() {
    wait 5;
    if (isdefined(level.interacts)) {
        foreach (interact in level.interacts) {
            if (!isent(interact) || isdefined(interact.s_doorbuy) || isdefined(interact.var_751df20fceaee5)) {
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x715
// Size: 0x8b
function function_7f3bb3916bbd189d(var_e376b152041e9caa, entity, var_e2f522f2f5303b23, var_ec2a6291d745649e, var_c2bab6b4faeb4e0d) {
    prop_array = [];
    if (var_e376b152041e9caa.size > 0) {
        prop_count = randomintrange(level.var_5c92ad41bd603ba8, level.var_542901d8545006be);
        prop_array = spawn_props(var_e376b152041e9caa, prop_count, entity, var_ec2a6291d745649e);
    }
    if (!isdefined(var_e2f522f2f5303b23)) {
        if (prop_array.size > 0) {
            var_e2f522f2f5303b23 = prop_array[0];
        }
    }
    return function_f9d849950dd83510(prop_array, entity, var_e2f522f2f5303b23, undefined, var_ec2a6291d745649e, var_c2bab6b4faeb4e0d);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x7a9
// Size: 0x95
function function_232cabbc43f9536(origin, entity, var_e2f522f2f5303b23, num_props, search_radius, var_c2bab6b4faeb4e0d) {
    if (!isdefined(num_props)) {
        num_props = randomintrange(level.var_5c92ad41bd603ba8, level.var_542901d8545006be);
    }
    search_radius = default_to(search_radius, 1000);
    spawn_points = function_3f1e49f4d09e7020(origin, search_radius, num_props);
    if (spawn_points.size || isdefined(var_e2f522f2f5303b23)) {
        if (!spawn_points.size) {
            spawn_points[spawn_points.size] = var_e2f522f2f5303b23;
        }
        return function_7f3bb3916bbd189d(spawn_points, entity, var_e2f522f2f5303b23, undefined, var_c2bab6b4faeb4e0d);
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x846
// Size: 0x185
function function_f9d849950dd83510(prop_array, mimic, trap_prop, var_17bc6acbb16c0769, var_ec2a6291d745649e, var_c2bab6b4faeb4e0d) {
    if (isstruct(trap_prop)) {
        if (isdefined(level.var_f1e6d22d8d08c3a5[trap_prop.lure_prop_type])) {
            var_57ad0dc40b2fdda = [[ level.var_f1e6d22d8d08c3a5[trap_prop.lure_prop_type].handler ]](trap_prop);
            activation_func = var_57ad0dc40b2fdda[1];
            prop = var_57ad0dc40b2fdda[0];
            trap_prop = prop;
            var_c2bab6b4faeb4e0d = activation_func;
        } else {
            trap_prop = spawn_prop(trap_prop, var_ec2a6291d745649e);
        }
        if (isdefined(trap_prop)) {
            prop_array[prop_array.size] = trap_prop;
        }
    }
    if (!prop_array.size) {
        return;
    }
    if (!isdefined(trap_prop)) {
        var_f06a2edce44032b8 = array_randomize(prop_array);
        foreach (prop in var_f06a2edce44032b8) {
            if (istrue(prop.var_1b98067f3a0cb593)) {
                trap_prop = prop;
                break;
            }
        }
        trap_prop = default_to(trap_prop, var_f06a2edce44032b8[0]);
    }
    if (!isdefined(trap_prop)) {
        return;
    }
    level.var_c333aca3fe5f8c29 = function_6d6af8144a5131f1(level.var_c333aca3fe5f8c29, trap_prop);
    if (isdefined(var_17bc6acbb16c0769)) {
        trap_prop.origin = var_17bc6acbb16c0769;
    }
    function_7903ab5a9ef7f51e(mimic, trap_prop, prop_array, var_c2bab6b4faeb4e0d);
    return trap_prop;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d4
// Size: 0xd7
function function_1809c70d20427151(position) {
    if (function_48b1349a9ec06480(1)) {
        return true;
    } else if (isdefined(position)) {
        var_1baee7f8317b909c = get_array_of_closest(position, level.var_682b8798cd1ca21c, undefined, undefined, 1000);
        foreach (spawn_point in var_1baee7f8317b909c) {
            if (isdefined(spawn_point.lure_prop_type) && isdefined(level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type]) && [[ level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type].var_d9212d524858ed7d ]](spawn_point)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab4
// Size: 0x23
function function_fe67f8f3027d7e36() {
    level.var_c333aca3fe5f8c29 = array_removeundefined(level.var_c333aca3fe5f8c29);
    return level.var_c333aca3fe5f8c29;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae0
// Size: 0x87
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb70
// Size: 0x12
function function_c7611d5bb2984c15() {
    if (!isdefined(level.var_f1e6d22d8d08c3a5)) {
        return [];
    }
    return [];
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb8b
// Size: 0x174
function function_3f1e49f4d09e7020(origin, radius, num_props, filter_claimed) {
    var_1baee7f8317b909c = get_array_of_closest(origin, level.var_682b8798cd1ca21c, undefined, undefined, radius);
    var_a08abb5ab21c8166 = [];
    foreach (spawn_point in var_1baee7f8317b909c) {
        if (isdefined(spawn_point.lure_prop_type) && isdefined(level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type]) && ![[ level.var_f1e6d22d8d08c3a5[spawn_point.lure_prop_type].var_d9212d524858ed7d ]](spawn_point)) {
            continue;
        }
        if (istrue(filter_claimed) && istrue(spawn_point.claimed)) {
            continue;
        }
        var_a08abb5ab21c8166[var_a08abb5ab21c8166.size] = spawn_point;
    }
    if (var_a08abb5ab21c8166.size > num_props) {
        var_a08abb5ab21c8166 = array_randomize(var_a08abb5ab21c8166);
        array_size = var_a08abb5ab21c8166.size;
        for (i = 0; i < array_size; i++) {
            if (i >= num_props) {
                var_a08abb5ab21c8166[i] = undefined;
            }
        }
    }
    if (var_a08abb5ab21c8166.size < num_props && isdefined(level.var_d4032c90a01fcf71)) {
        var_a08abb5ab21c8166 = array_combine(var_a08abb5ab21c8166, [[ level.var_d4032c90a01fcf71 ]](origin, num_props - var_a08abb5ab21c8166.size));
    }
    return var_a08abb5ab21c8166;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd08
// Size: 0x51
function function_48b1349a9ec06480(num_props, entity) {
    in_array = isdefined(entity) && array_contains(level.var_c1aeb5800a25fc5c, entity);
    return 20 - level.var_a0ab8c8dc1b484ea.size + level.var_c1aeb5800a25fc5c.size - in_array >= num_props;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd62
// Size: 0x169
function spawn_props(spawn_points, num_props, entity, var_ec2a6291d745649e) {
    num_props = min(num_props, spawn_points.size);
    level.var_a0ab8c8dc1b484ea = array_removeundefined(level.var_a0ab8c8dc1b484ea);
    prop_array = [];
    if (!function_48b1349a9ec06480(num_props, entity)) {
        in_array = isdefined(entity) && array_contains(level.var_c1aeb5800a25fc5c, entity);
        if (level.var_a0ab8c8dc1b484ea.size + level.var_c1aeb5800a25fc5c.size >= 20) {
            return prop_array;
        }
        num_props = 20 - level.var_a0ab8c8dc1b484ea.size + level.var_c1aeb5800a25fc5c.size - in_array;
    }
    if (!spawn_points.size) {
        return prop_array;
    }
    spawn_points = array_randomize(spawn_points);
    foreach (loc in spawn_points) {
        if (function_883458a342af3041(loc.origin, 300).size) {
            continue;
        }
        if (isdefined(loc.lure_prop_type)) {
            prop_array[prop_array.size] = loc;
            continue;
        }
        prop = spawn_prop(loc, var_ec2a6291d745649e);
        prop_array[prop_array.size] = prop;
        if (prop_array.size >= num_props) {
            break;
        }
    }
    return prop_array;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed4
// Size: 0x244
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
        result.prop_name = "decor_barrel_metal_rusty_01";
        result.pos_offset = (0, 0, 0);
        result.angle_offset = (0, 0, 0);
        result.var_274ce48b57b7b685 = 1;
        return result;
    }
    model_entry = bundle.itementries[randomint(bundle.itementries.size)];
    if (!isdefined(model_entry)) {
        return undefined;
    }
    result.pos_offset = (default_to(model_entry.offset_x, 0), default_to(model_entry.offset_y, 0), default_to(model_entry.offset_z, 0));
    result.angle_offset = (default_to(model_entry.pitch, 0), default_to(model_entry.yaw, 0), default_to(model_entry.roll, 0));
    result.prop_name = model_entry.model;
    if (!isdefined(model_entry.model) && isdefined(model_entry.itemspawnentry)) {
        result.var_65a915817a7f4a40 = 1;
        result.prop_name = "itemspawnentry:" + model_entry.itemspawnentry;
    }
    result.rattle_sound = model_entry.rattle_sound;
    result.var_91013cb9036a51d8 = model_entry.var_62b718a2641f309;
    result.var_274ce48b57b7b685 = istrue(model_entry.var_f709cbf04455619a);
    return result;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1121
// Size: 0x313
function spawn_prop(spawn_loc, var_ec2a6291d745649e, var_76000a0eb3503385, var_38ca70c47a370ad1) {
    var_b8328de59ac77659 = function_e188ceb88ab77286(spawn_loc, var_ec2a6291d745649e);
    model_name = "tag_origin";
    item_scriptable = undefined;
    var_a37db2cadacc4dfe = undefined;
    spawn_loc.angles = default_to(spawn_loc.angles, (0, 0, 0));
    if (istrue(var_b8328de59ac77659.var_65a915817a7f4a40)) {
        itemspawnentry = getscriptbundle(var_b8328de59ac77659.prop_name);
        var_b8328de59ac77659.pos_offset = (default_to(itemspawnentry.positionoffsetx, 0), default_to(itemspawnentry.positionoffsety, 0), default_to(itemspawnentry.positionoffsetz, 0));
        var_b8328de59ac77659.angle_offset = (default_to(itemspawnentry.angleoffsetx, 0), default_to(itemspawnentry.angleoffsety, 0), default_to(itemspawnentry.angleoffsetz, 0));
        if (isdefined(itemspawnentry.scriptable)) {
            var_a37db2cadacc4dfe = itemspawnentry.scriptable;
            item_scriptable = spawnscriptable(itemspawnentry.scriptable, spawn_loc.origin + var_b8328de59ac77659.pos_offset, spawn_loc.angles + var_b8328de59ac77659.angle_offset);
            item_scriptable.disable = 1;
        }
        if (isdefined(itemspawnentry.worldmodel)) {
            model_name = itemspawnentry.worldmodel;
        }
    } else {
        model_name = var_b8328de59ac77659.prop_name;
    }
    if (isdefined(var_76000a0eb3503385)) {
        model_name = var_76000a0eb3503385;
    }
    if (!istrue(var_38ca70c47a370ad1)) {
        playfx(getfx("mimic_prop_spawn_in_fx"), spawn_loc.origin + var_b8328de59ac77659.pos_offset);
    }
    model = utility::spawn_model(model_name, spawn_loc.origin + var_b8328de59ac77659.pos_offset, spawn_loc.angles + var_b8328de59ac77659.angle_offset);
    spawn_loc.claimed = 1;
    model.spawn_loc = spawn_loc;
    model.rattle_sound = var_b8328de59ac77659.rattle_sound;
    model.var_274ce48b57b7b685 = var_b8328de59ac77659.var_274ce48b57b7b685;
    model.var_91013cb9036a51d8 = var_b8328de59ac77659.var_91013cb9036a51d8;
    model.item_scriptable = item_scriptable;
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x143d
// Size: 0x3e
function function_1eaeeddcc77f7896() {
    if (isdefined(self.spawn_loc)) {
        self.spawn_loc.claimed = undefined;
    }
    if (isdefined(self.var_3b320b9f87d84c81)) {
        self.var_3b320b9f87d84c81 delete();
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1483
// Size: 0x4f
function function_cfa8ac2b4b30b60(entity) {
    var_48b1349a9ec06480 = function_48b1349a9ec06480(1, entity);
    if (var_48b1349a9ec06480 && !array_contains(level.var_c1aeb5800a25fc5c, entity)) {
        level.var_c1aeb5800a25fc5c[level.var_c1aeb5800a25fc5c.size] = entity;
    }
    return var_48b1349a9ec06480;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14db
// Size: 0x24
function function_758159430083e297(entity) {
    level.var_c1aeb5800a25fc5c = array_remove(level.var_c1aeb5800a25fc5c, entity);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1507
// Size: 0x187
function function_6463c3c6bfff5460(prop, prop_array, condition_func) {
    if (!isdefined(condition_func)) {
        condition_func = &function_aba5d57ebacc9eca;
    }
    prop.var_1b98067f3a0cb593 = 1;
    prop.navmesh_position = getclosestpointonnavmesh(prop.origin);
    if (isdefined(prop.navmesh_position)) {
        if (abs(prop.origin[2] - prop.navmesh_position[2]) > 64) {
            prop.navmesh_position = undefined;
        }
        if (isdefined(prop.navmesh_position) && istrue(prop.var_274ce48b57b7b685)) {
            prop thread function_64e3a7fad130e985();
        }
    }
    prop thread trap_thread(condition_func);
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
    if (isdefined(prop.var_a37db2cadacc4dfe) && !isdefined(prop.item_scriptable)) {
        prop.item_scriptable = spawnscriptable(prop.var_a37db2cadacc4dfe, prop.origin, prop.angles);
        prop.item_scriptable.disable = 1;
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1696
// Size: 0x47
function function_64e3a7fad130e985() {
    self endon("death_or_disconnect");
    wait 1;
    if (isdefined(self)) {
        v_forward = anglestoforward(self.angles) * 8;
        self.navmesh_position = getclosestpointonnavmesh(self.navmesh_position + v_forward);
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e5
// Size: 0xc1
function function_810e1686a0bf4f11(prop) {
    a_points = getrandomnavpoints(prop.origin, 48, 12);
    if (a_points.size == 0) {
        return;
    }
    if (isdefined(level.var_1654879168aff1ca)) {
        loc = [[ level.var_1654879168aff1ca ]](prop.origin, a_points);
    } else {
        loc = array_random(a_points);
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17ae
// Size: 0x5e
function function_7903ab5a9ef7f51e(mimic, trap_prop, prop_array, var_c2bab6b4faeb4e0d) {
    assert(array_contains(prop_array, trap_prop), "<dev string:x1c>");
    trap_prop.prop_array = prop_array;
    if (isdefined(mimic)) {
        function_67db44d38891dc3f(mimic, trap_prop);
    }
    function_6463c3c6bfff5460(trap_prop, prop_array, var_c2bab6b4faeb4e0d);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1814
// Size: 0x42
function function_d4032c90a01fcf71(origin, num_points) {
    if (!isdefined(origin)) {
        return [];
    }
    spawn_points = function_848b07e8d4887cc8(origin, num_points * 2, 50, 1000, 0);
    spawn_points = function_422f1d07881ec8b3(spawn_points, num_points);
    return spawn_points;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x185f
// Size: 0xb2
function function_422f1d07881ec8b3(points, num) {
    filter_points = [];
    close_points = array_removeundefined(level.var_a0ab8c8dc1b484ea);
    foreach (point in points) {
        if (get_array_of_closest(point.origin, close_points, undefined, undefined, 32).size > 0) {
            continue;
        }
        filter_points[filter_points.size] = point;
        close_points[close_points.size] = point;
        if (filter_points.size >= num) {
            break;
        }
    }
    return filter_points;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191a
// Size: 0x31e
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
            if (isdefined(player.last_valid_position) && isdefined(self.navmesh_position)) {
                if (!ray_trace_passed(player.last_valid_position, self.navmesh_position, [self], create_default_contents(1))) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(player.last_valid_position, self.navmesh_position, (0, 1, 1), 1, 0, 1);
                            sphere(self.navmesh_position, 20, (1, 0, 0), 0, 1, 1);
                        }
                    #/
                    continue;
                }
            } else {
                player_center = player gettagorigin("j_spine4");
                player_center = default_to(player_center, player getcentroid());
                if (isdefined(player_center) && !sighttracepassed(self.origin + prop_height, player_center, 0, self)) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(self.origin + prop_height, player gettagorigin("<dev string:x45>"), (1, 1, 0), 1, 0, 1);
                        }
                    #/
                    continue;
                }
            }
            traceresult = playerphysicstrace(self.origin + (0, 0, 20), player.origin + (0, 0, 36), player, undefined, self, 1);
            if (traceresult["fraction"] >= 1) {
                self notify("stop_shake_tell");
                return player;
            }
            /#
                if (getdvarint(@"hash_821690ed248715f7", 0)) {
                    line(self.origin + (0, 0, 8), player.origin + (0, 0, 8), (1, 0, 0), 1, 0, 1);
                    sphere(traceresult["<dev string:x51>"], 4, (1, 0, 0), 1, 0, 10, 1);
                }
            #/
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c40
// Size: 0xdc
function trap_thread(condition_func) {
    self endon("death");
    self endon("damage_transform");
    self endon("normal_transform");
    level endon("game_ended");
    if (!isdefined(level.var_5370b827a6ad3135)) {
        level.var_5370b827a6ad3135 = throttle_initialize("mimic_trap_prop", 1);
    }
    while (true) {
        function_f632348cbb773537(level.var_5370b827a6ad3135, self);
        if (istrue(self.pause_trap)) {
            continue;
        }
        activator = self [[ condition_func ]]();
        if (isdefined(activator)) {
            activators = [activator];
            if (isdefined(self.health) && self.health > 0) {
                function_adf6ced03ffc2317(self, 0.35, 0.05, 8);
            }
            level thread transform_spawn(self, activators);
            self notify("normal_transform");
            return;
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d24
// Size: 0x87
function function_cfd6ffd040b07d99() {
    self.var_3fd0a58809891531 = 1;
    self.original_angles = self.angles;
    while (true) {
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1db3
// Size: 0xca
function function_adf6ced03ffc2317(trap_prop, total_time, iteration_time, angle) {
    original_angles = trap_prop.angles;
    iterations = total_time / iteration_time;
    start_roll = trap_prop.angles[2];
    current_delta = angle;
    playsoundatpos(trap_prop.origin + (0, 0, 50), "evt_mimic_prop_rattle");
    for (i = 0; i < iterations; i++) {
        trap_prop rotateroll(start_roll + current_delta, iteration_time);
        current_delta *= -1;
        wait iteration_time;
    }
    trap_prop.angles = original_angles;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e85
// Size: 0x13d
function function_67c6c3ee54255f52() {
    self endon("death");
    self endon("normal_transform");
    level endon("game_ended");
    self.health = default_to(self.var_d0f9920c0e8883a6, 50000);
    self setcandamage(1);
    if (isdefined(self.var_3b320b9f87d84c81)) {
        self.var_3b320b9f87d84c81 thread function_d656de476c348bb0(self);
    }
    self.tracked_damage = 0;
    self.var_f3e89f9924fb5b0d = 0;
    while (true) {
        self waittill("damage", idamage, eattacker);
        if (istrue(self.pause_trap) || !isplayer(eattacker)) {
            continue;
        }
        if (gettime() - self.var_f3e89f9924fb5b0d > 3000) {
            self.tracked_damage = 0;
        }
        self.tracked_damage += idamage;
        self.var_f3e89f9924fb5b0d = gettime();
        if (self.tracked_damage >= 100) {
            self notify("damage_transform");
            transform_spawn(self, [eattacker]);
            break;
        }
    }
    self setcandamage(0);
    if (isdefined(self.var_3b320b9f87d84c81)) {
        self.var_3b320b9f87d84c81 setcandamage(0);
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fca
// Size: 0x77
function function_d656de476c348bb0(model_owner) {
    self endon("death");
    model_owner endon("death");
    level endon("game_ended");
    self.health = model_owner.health;
    self setcandamage(1);
    while (isdefined(self)) {
        self waittill("damage", idamage, eattacker);
        model_owner dodamage(idamage, model_owner.origin, eattacker);
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2049
// Size: 0x24
function function_f1b281379e1bd04a(trap_prop, mimic) {
    mimic.reveal_time = gettime();
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2075
// Size: 0x29b
function transform_spawn(prop, activators, activation_info) {
    if (isdefined(prop.var_bcdf27dd514533da)) {
        [[ prop.var_bcdf27dd514533da ]](prop);
        prop.var_bcdf27dd514533da = undefined;
    }
    reveal_param = spawnstruct();
    reveal_param.activators = activators;
    reveal_param.activation_info = activation_info;
    if (isdefined(prop.hidden_entities)) {
        prop.hidden_entities = array_removeundefined(prop.hidden_entities);
        foreach (entity in prop.hidden_entities) {
            function_f1b281379e1bd04a(prop, entity);
            entity callback::callback("on_entity_revealed", reveal_param);
        }
    } else {
        have_room = function_c9eebf69d9a55148() > 0;
        if (!have_room && isdefined(level.var_9d1fbf6653feac9c) && [[ level.var_9d1fbf6653feac9c ]]()) {
            have_room = 1;
        }
        if (have_room) {
            assert(isdefined(level.var_f52f26854571caa1));
            var_749df5ee6b70c1f3 = spawnnewaitype_sharedfunc(level.var_f52f26854571caa1, prop.origin, prop.angles, prop.team);
            if (isdefined(var_749df5ee6b70c1f3)) {
                function_67db44d38891dc3f(var_749df5ee6b70c1f3, prop);
                function_f1b281379e1bd04a(prop, var_749df5ee6b70c1f3);
                waitframe();
                if (isdefined(var_749df5ee6b70c1f3)) {
                    var_749df5ee6b70c1f3 callback::callback("on_entity_revealed", reveal_param);
                }
            }
        } else {
            println("<dev string:x5d>");
        }
    }
    if (!isdefined(prop)) {
        return;
    }
    playfx(getfx("mimic_prop_rattle_fx"), prop.origin + (0, 0, 16));
    prop.hidden_entities = undefined;
    if (!isdefined(prop.lure_prop_type)) {
        prop set("mimic_spawn", "hide", 1);
        prop notsolid();
        destroynavobstacle(prop.navobstacle);
    }
    if (isdefined(prop.var_da100663ad724529)) {
        prop.var_da100663ad724529 delete();
        prop.var_da100663ad724529 = undefined;
    }
    if (isdefined(prop.item_scriptable)) {
        prop.item_scriptable freescriptable();
        prop.item_scriptable = undefined;
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2318
// Size: 0x124
function function_67db44d38891dc3f(entity, prop) {
    assert(!istrue(entity.hidden_in_prop), "<dev string:x88>");
    if (!isdefined(entity.prop_array)) {
        entity callback::add("on_ai_killed", &function_1a021b134eae1dd9);
    }
    entity.hidden_in_prop = 1;
    entity.trap_prop = prop;
    entity.var_aeef4bfd13b1479b = 1;
    entity.prop_array = prop.prop_array;
    entity hide();
    entity setsolid(0);
    entity dontinterpolate();
    entity forceteleport(prop.origin, prop.angles);
    params = spawnstruct();
    params.prop = prop;
    entity callback::callback("on_entity_hidden_in_prop", params);
    if (!isdefined(prop.hidden_entities)) {
        prop.hidden_entities = [];
    }
    prop.hidden_entities[prop.hidden_entities.size] = entity;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2444
// Size: 0x96
function function_1a021b134eae1dd9(params) {
    self.prop_array = array_removeundefined(self.prop_array);
    foreach (prop in self.prop_array) {
        if (isdefined(prop.var_a295306038aa1d4e)) {
            [[ prop.var_a295306038aa1d4e ]]();
        }
        level thread clean_up_prop(prop);
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24e2
// Size: 0x1c7
function clean_up_prop(prop, var_9721d21bc5d214cf) {
    if (!isdefined(prop)) {
        return;
    }
    level endon("game_ended");
    prop endon("death");
    if (isdefined(prop.hidden_entities)) {
        foreach (hidden_entity in prop.hidden_entities) {
            if (isdefined(hidden_entity)) {
                hidden_entity kill();
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
    if (isdefined(prop.origin) && default_to(var_9721d21bc5d214cf, 1)) {
        playfx(getfx("mimic_prop_spawn_out_fx"), prop.origin);
        playsoundatpos(prop.origin + (0, 0, 16), "evt_mimic_prop_hide");
    }
    if (isdefined(prop.lure_prop_type)) {
        return;
    }
    wait 0.5;
    if (isdefined(prop.var_da100663ad724529)) {
        prop.var_da100663ad724529 delete();
        prop.var_da100663ad724529 = undefined;
    }
    if (isdefined(prop.item_scriptable)) {
        prop.item_scriptable freescriptable();
        prop.item_scriptable = undefined;
    }
    if (isdefined(prop)) {
        prop delete();
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b1
// Size: 0x5d
function function_eb1dd015e483d450() {
    foreach (prop in level.var_a0ab8c8dc1b484ea) {
        if (isdefined(prop)) {
            level thread clean_up_prop(prop);
        }
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2716
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2798
// Size: 0x85
function function_a0a440abb6e3a58c(prop_struct) {
    interact = prop_struct.interact;
    interact.prop = prop_struct;
    prop_struct.var_d4c527857c291502 = interact.var_a4f3ccfb11edb890;
    prop_struct.var_bcdf27dd514533da = &function_e5c6fa983a28e681;
    interact.var_a4f3ccfb11edb890 = [&function_29d684619e0e9b67];
    prop_struct thread function_edb702a6a2c74fe4();
    return [prop_struct, &function_a448e9db6dccda8c];
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2826
// Size: 0x63
function function_88975b39ffe44df4(var_4d3939e69e9924c0) {
    if (!isdefined(var_4d3939e69e9924c0)) {
        return;
    }
    trap_prop = var_4d3939e69e9924c0.prop;
    trap_prop.spawn_loc = var_4d3939e69e9924c0;
    trap_prop.var_d0f9920c0e8883a6 = 5;
    trap_prop.var_bcdf27dd514533da = &function_e5c6fa983a28e681;
    return [trap_prop, &function_a448e9db6dccda8c];
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2892
// Size: 0x7f
function function_553070123dc9c35c(vehicle_struct) {
    if (!isdefined(vehicle_struct)) {
        return;
    }
    trap_prop = vehicle_struct.prop;
    trap_prop.var_701e344d56d554af = 1;
    trap_prop.spawn_loc = vehicle_struct;
    trap_prop.var_8defbdfee199a2a5 = 1;
    trap_prop.var_96c813a56beaaf2 = 1;
    trap_prop.var_bcdf27dd514533da = &function_77c73d45c45f60a5;
    return [trap_prop, &function_a448e9db6dccda8c];
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x291a
// Size: 0x1e
function function_9629594923eec1e6(params) {
    self notify("mimic_prop_activated", params.attacker);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2940
// Size: 0x1c
function function_29d684619e0e9b67(player) {
    self.prop notify("mimic_prop_activated", player);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2964
// Size: 0x1e
function function_db598041df08c5f7(player_activator) {
    self.var_701e344d56d554af = 0;
    self notify("mimic_prop_activated", player_activator);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x298a
// Size: 0x20
function function_a448e9db6dccda8c(params) {
    self waittill("mimic_prop_activated", activator);
    return activator;
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29b3
// Size: 0x30
function function_e5c6fa983a28e681(trap_prop) {
    if (!isdefined(trap_prop.interact)) {
        return;
    }
    level thread restore_interact(trap_prop.interact, trap_prop);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29eb
// Size: 0x8d
function restore_interact(interact, prop) {
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

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a80
// Size: 0x17
function function_77c73d45c45f60a5(trap_vehicle) {
    level thread restore_vehicle(trap_vehicle, 5);
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9f
// Size: 0x56
function restore_vehicle(vehicle, restore_wait) {
    level endon("game_ended");
    vehicle set("mimic_lure_transform", "hide", 1);
    vehicle notsolid();
    wait restore_wait;
    if (!isdefined(vehicle)) {
        return;
    }
    vehicle val::reset("mimic_lure_transform", "hide");
    vehicle solid();
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2afd
// Size: 0x82
function function_2570f796cde55c74() {
    foreach (prop in level.var_c333aca3fe5f8c29) {
        if (!isdefined(prop) || prop get("hide")) {
            continue;
        }
        level thread transform_spawn(prop, level.players);
        prop notify("normal_transform");
    }
}

// Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b87
// Size: 0x4f
function function_edb702a6a2c74fe4() {
    level endon("game_ended");
    self endon("mimic_prop_activated");
    self endon("clean_up_prop");
    wait 60;
    while (true) {
        activator = self.interact function_aba5d57ebacc9eca();
        if (isdefined(activator)) {
            self notify("mimic_prop_activated", activator);
            return;
        }
        wait 1;
    }
}

/#

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2bde
    // Size: 0x18d
    function function_f40e9354c7ef87f2() {
        function_6e7290c8ee4f558b("<dev string:xa9>");
        function_a9a864379a098ad6("<dev string:xc8>", "<dev string:xdb>", &function_4b9ff448d5a356bb, 1);
        function_a9a864379a098ad6("<dev string:xee>", "<dev string:x104>", &function_9d27ad32448f646e, 1);
        function_a9a864379a098ad6("<dev string:x11a>", "<dev string:x135>", &function_62ce6d2d2ec84db1, 1);
        function_a9a864379a098ad6("<dev string:x150>", "<dev string:x16f>", &function_e4a73e61d489e88b, 1);
        function_a9a864379a098ad6("<dev string:x191>", "<dev string:x1a5>", &function_bcf7a4f5c74762af);
        function_a9a864379a098ad6("<dev string:x1b9>", "<dev string:x1dd>", &function_7b9ff72e64814cf1);
        function_a9a864379a098ad6("<dev string:x1fb>", "<dev string:x219>", &function_88698d5c32de5b3c, 1);
        function_a9a864379a098ad6("<dev string:x230>", "<dev string:x24d>", &function_343c21a6fb381025, 1);
        function_a9a864379a098ad6("<dev string:x263>", "<dev string:x28d>", &function_eaceefb9f66950f9);
        function_a9a864379a098ad6("<dev string:x2b2>", "<dev string:x2c7>", &function_a5ebbdcfeec725ff);
        function_a9a864379a098ad6("<dev string:x2dd>", "<dev string:x2f3>", &function_eb1dd015e483d450);
        function_a9a864379a098ad6("<dev string:x309>", "<dev string:x321>", &function_2570f796cde55c74);
        function_a9a864379a098ad6("<dev string:x339>", "<dev string:x359>", &function_8cca940d666433ca);
        function_a9a864379a098ad6("<dev string:x36e>", "<dev string:x383>", &function_852ebf03a4be71c);
        function_b23a59dfb4ca49a1("<dev string:x398>", "<dev string:x3b9>", &function_69ebd21eee2b20cf);
        function_b23a59dfb4ca49a1("<dev string:x3e1>", "<dev string:x3ff>", &function_69ebd21eee2b20cf);
        function_fe953f000498048f();
        level thread function_d94c9b7be6d072e6();
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2d73
    // Size: 0x10b
    function function_d94c9b7be6d072e6() {
        level endon("<dev string:x42e>");
        scriptbundlenames = [];
        foreach (point in level.var_682b8798cd1ca21c) {
            if (isdefined(point.scriptbundlename) && !array_contains(scriptbundlenames, point.scriptbundlename)) {
                scriptbundlenames[scriptbundlenames.size] = point.scriptbundlename;
            }
        }
        if (!scriptbundlenames.size) {
            return;
        }
        function_6e7290c8ee4f558b("<dev string:x43c>");
        foreach (name in scriptbundlenames) {
            function_b23a59dfb4ca49a1(name, "<dev string:x465>" + name, &function_a5acf46239ebdd51);
        }
        function_fe953f000498048f();
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2e86
    // Size: 0x1a
    function function_a5acf46239ebdd51(params) {
        level.var_209f58916eee1fee = params[0];
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2ea8
    // Size: 0x45
    function function_69ebd21eee2b20cf(params) {
        dvar_name = hashcat(@"scr_", params[0]);
        dvar_value = getdvarint(dvar_name, 0);
        setdvar(dvar_name, !dvar_value);
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2ef5
    // Size: 0x10b
    function function_4b9ff448d5a356bb() {
        while (true) {
            foreach (trap_prop in level.var_c333aca3fe5f8c29) {
                if (!isdefined(trap_prop)) {
                    continue;
                }
                color = ter_op(istrue(trap_prop.pause_trap), (1, 0, 0), (1, 1, 0));
                debugstar(trap_prop.origin, color, 1);
                line(trap_prop.origin, trap_prop.origin + (0, 0, 900), color);
                if (istrue(trap_prop.pause_trap)) {
                    print3d(trap_prop.origin + (0, 0, 48), "<dev string:x47d>", color);
                }
            }
            waitframe();
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3008
    // Size: 0x93
    function function_9d27ad32448f646e() {
        while (true) {
            foreach (prop in level.var_a0ab8c8dc1b484ea) {
                if (!isdefined(prop) || istrue(prop.var_1b98067f3a0cb593)) {
                    continue;
                }
                debugstar(prop.origin, (0, 1, 0), 1);
            }
            waitframe();
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x30a3
    // Size: 0x84
    function function_7edad2172f1d933() {
        waitframe();
        player = level.players[0];
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 2000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        endposition = physicstrace(eye, eye + direction_vec, 0);
        return endposition;
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x312f
    // Size: 0x43
    function function_bcf7a4f5c74762af() {
        position = function_7edad2172f1d933();
        spawn_points = function_d4032c90a01fcf71(position, 5);
        if (!spawn_points.size) {
            return;
        }
        function_7f3bb3916bbd189d(spawn_points, undefined, undefined, level.var_209f58916eee1fee);
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x317a
    // Size: 0x186
    function function_88698d5c32de5b3c() {
        spawn_points = getstructarray("<dev string:x487>", "<dev string:x49e>");
        var_4b1319b2faba3d7 = [];
        foreach (point in spawn_points) {
            if (distancesquared(point.origin, level.players[0].origin) <= squared(7000)) {
                var_4b1319b2faba3d7 = array_add(var_4b1319b2faba3d7, point);
                function_7f3bb3916bbd189d([point], undefined, undefined, point.proplist);
            }
        }
        while (true) {
            foreach (point in var_4b1319b2faba3d7) {
                if (!isdefined(point)) {
                    continue;
                }
                color = ter_op(istrue(point.pause_trap), (1, 0, 0), (1, 1, 0));
                debugstar(point.origin, color, 1);
                line(point.origin, point.origin + (0, 0, 900), color);
            }
            waitframe();
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3308
    // Size: 0x16c
    function function_343c21a6fb381025() {
        spawn_points = getstructarray("<dev string:x487>", "<dev string:x49e>");
        var_4b1319b2faba3d7 = [];
        foreach (point in spawn_points) {
            if (distancesquared(point.origin, level.players[0].origin) <= squared(7000)) {
                var_4b1319b2faba3d7 = array_add(var_4b1319b2faba3d7, point);
            }
        }
        while (true) {
            foreach (point in var_4b1319b2faba3d7) {
                if (!isdefined(point)) {
                    continue;
                }
                color = ter_op(istrue(point.pause_trap), (1, 0, 0), (1, 1, 0));
                debugstar(point.origin, color, 1);
                line(point.origin, point.origin + (0, 0, 900), color);
            }
            waitframe();
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x347c
    // Size: 0x23
    function function_7b9ff72e64814cf1() {
        position = function_7edad2172f1d933();
        function_232cabbc43f9536(position, undefined, undefined, 3);
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x34a7
    // Size: 0x23
    function function_eaceefb9f66950f9() {
        position = function_7edad2172f1d933();
        function_232cabbc43f9536(position, undefined, undefined, 1);
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x34d2
    // Size: 0x6d
    function function_a5ebbdcfeec725ff() {
        mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x4b3>");
        if (!isdefined(mimic)) {
            mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x4c3>");
        }
        if (isdefined(mimic)) {
            mimic function_3e89eb3d8e3f1811("<dev string:x4d7>", 1);
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3547
    // Size: 0x6d
    function function_852ebf03a4be71c() {
        mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x4b3>");
        if (!isdefined(mimic)) {
            mimic = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x4c3>");
        }
        if (isdefined(mimic)) {
            mimic function_3e89eb3d8e3f1811("<dev string:x4e6>", 1);
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x35bc
    // Size: 0x7c
    function function_62ce6d2d2ec84db1() {
        while (true) {
            foreach (point in level.var_682b8798cd1ca21c) {
                debugstar(point.origin, (1, 0, 0), 20);
            }
            wait 1;
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3640
    // Size: 0xc0
    function function_e4a73e61d489e88b() {
        while (true) {
            spawn_points = function_c7611d5bb2984c15();
            foreach (point in spawn_points) {
                debugstar(point.origin, (0, 1, 0), 100);
                line(point.origin, point.origin + (0, 0, 64), (0, 1, 0), 1, 0, 100);
            }
            wait 5;
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3708
    // Size: 0x4c
    function function_8cca940d666433ca() {
        position = function_7edad2172f1d933();
        spawn_structs = function_c7611d5bb2984c15();
        if (!spawn_structs.size) {
            return;
        }
        closest_struct = getclosest(position, spawn_structs);
        function_7f3bb3916bbd189d([closest_struct]);
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x375c
    // Size: 0xc9
    function function_c1d66d6d7270be71() {
        var_2a6598e14a6eaf76 = function_c7611d5bb2984c15();
        var_2a6598e14a6eaf76 = array_combine(level.var_682b8798cd1ca21c, var_2a6598e14a6eaf76);
        waitframe();
        while (true) {
            position = function_7edad2172f1d933();
            debugstar(position, (0, 1, 1), 100);
            spawn_points = sortbydistance(var_2a6598e14a6eaf76, position);
            foreach (point in spawn_points) {
                info = function_cb384ef3ead500b8(point);
                function_d4e0c52a6a9dbeba(info);
            }
            wait 5;
        }
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x382d
    // Size: 0x148
    function private function_cb384ef3ead500b8(point) {
        if (isdefined(point.lure_prop_type)) {
            switch (point.lure_prop_type) {
            case 0:
                new_point = default_to(point.trigger.scriptmodel, point.scriptmodel);
                point = default_to(new_point, point);
                break;
            case 1:
                if (isdefined(point.targetname) && point.targetname == "<dev string:x4f8>") {
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
        validation_info = spawnstruct();
        validation_info.origin = new_origin;
        validation_info.angles = point.angles;
        validation_info.var_145ce6879451e2d9 = [];
        emerge_anim = "<dev string:x50a>";
        return validation_info;
    }

    // Namespace namespace_f35b248fe3d46dfb / namespace_6119efd5d1925c17
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x397d
    // Size: 0xf5
    function private function_d4e0c52a6a9dbeba(validation_info) {
        foreach (var_145ce6879451e2d9 in validation_info.var_145ce6879451e2d9) {
            color = ter_op(var_145ce6879451e2d9.passed, (0, 1, 0), (1, 0, 0));
            debugstar(var_145ce6879451e2d9.var_b1aea98e59422399, color, 100);
            line(var_145ce6879451e2d9.var_b1aea98e59422399, var_145ce6879451e2d9.var_28a36f0010068608, color, 1, 0, 100);
            line(var_145ce6879451e2d9.var_9bcb36ea1f3ad667, var_145ce6879451e2d9.var_b1aea98e59422399, (1, 0, 1), 1, 0, 100);
        }
    }

#/
