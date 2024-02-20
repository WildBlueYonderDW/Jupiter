// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_lights.gsc;
#using scripts\common\vehicle_treadfx.gsc;

#namespace vehicle_build;

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x467
// Size: 0xa5
function build_radiusdamage(offset, range, maxdamage, mindamage) {
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    struct = spawnstruct();
    struct.offset = offset;
    struct.range = range;
    struct.maxdamage = maxdamage;
    struct.mindamage = mindamage;
    level.vehicle.templates.death_radiusdamage[level.vtclassname] = struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x513
// Size: 0xd5
function build_rumble(rumble, scale, duration, radius, basetime, randomaditionaltime) {
    if (!isdefined(level.vehicle.templates.rumble)) {
        level.vehicle.templates.rumble = [];
    }
    struct = build_quake(scale, duration, radius, basetime, randomaditionaltime);
    /#
        assert(isdefined(rumble));
    #/
    precacherumble(rumble);
    struct.rumble = rumble;
    level.vehicle.templates.rumble[level.vtclassname] = struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef
// Size: 0x99
function build_deathquake(scale, duration, radius) {
    classname = level.vtclassname;
    if (!isdefined(level.vehicle.templates.death_earthquake)) {
        level.vehicle.templates.death_earthquake = [];
    }
    level.vehicle.templates.death_earthquake[classname] = build_quake(scale, duration, radius);
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68f
// Size: 0x88
function build_quake(scale, duration, radius, basetime, randomaditionaltime) {
    struct = spawnstruct();
    struct.scale = scale;
    struct.duration = duration;
    struct.radius = radius;
    if (isdefined(basetime)) {
        struct.basetime = basetime;
    }
    if (isdefined(randomaditionaltime)) {
        struct.randomaditionaltime = randomaditionaltime;
    }
    return struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params c, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71f
// Size: 0x139
function build_fx(effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, selfdeletedelay, remove_deathfx_entity_delay, attacker_velocity_lerp) {
    if (!isdefined(bsoundlooping)) {
        bsoundlooping = 0;
    }
    if (!isdefined(beffectlooping)) {
        beffectlooping = 0;
    }
    if (!isdefined(delay)) {
        delay = 1;
    }
    struct = spawnstruct();
    struct.effect = loadfx(effect);
    struct.tag = tag;
    struct.sound = sound;
    struct.bsoundlooping = bsoundlooping;
    struct.delay = delay;
    struct.waitdelay = waitdelay;
    struct.stayontag = stayontag;
    struct.notifystring = notifystring;
    struct.beffectlooping = beffectlooping;
    struct.selfdeletedelay = selfdeletedelay;
    struct.remove_deathfx_entity_delay = remove_deathfx_entity_delay;
    struct.attacker_velocity_lerp = attacker_velocity_lerp;
    return struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x860
// Size: 0x127
function build_deathfx(effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_5b457edcff6fa295, remove_deathfx_entity_delay, attacker_velocity_lerp) {
    /#
        assertex(isdefined(effect), "Failed to build death effect because there is no effect specified for the model used for that vehicle.");
    #/
    classname = level.vtclassname;
    if (!isdefined(level.vehicle.templates.vehicle_death_fx[classname])) {
        level.vehicle.templates.vehicle_death_fx[classname] = [];
    }
    level.vehicle.templates.vehicle_death_fx[classname][level.vehicle.templates.vehicle_death_fx[classname].size] = build_fx(effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_5b457edcff6fa295, remove_deathfx_entity_delay, attacker_velocity_lerp);
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x98e
// Size: 0x11d
function build_rocket_deathfx(effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_5b457edcff6fa295, remove_deathfx_entity_delay) {
    /#
        assertex(isdefined(effect), "Failed to build death effect because there is no effect specified for the model used for that vehicle.");
    #/
    classname = level.vtclassname;
    if (!isdefined(level.vehicle.templates.vehicle_death_fx[classname])) {
        level.vehicle.templates.vehicle_death_fx[classname] = [];
    }
    level.vehicle.templates.vehicle_rocket_death_fx[classname][level.vehicle.templates.vehicle_death_fx[classname].size] = build_fx(effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_5b457edcff6fa295, remove_deathfx_entity_delay);
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xab2
// Size: 0x180
function build_deathanimations(var_4a32601cc0b7dcc, var_de6189ed34354801, var_9ecae3da61774d2e, var_da007c9cd223ae3a) {
    /#
        assertex(isdefined(var_4a32601cc0b7dcc), "No forwardAnimation for build_deathanim: " + level.vtclassname);
    #/
    /#
        assertex(isdefined(var_de6189ed34354801), "No rightAnimation for build_deathanim: " + level.vtclassname);
    #/
    /#
        assertex(isdefined(var_9ecae3da61774d2e), "No backwardAnimation for build_deathanim: " + level.vtclassname);
    #/
    /#
        assertex(isdefined(var_da007c9cd223ae3a), "No leftAnimation for build_deathanim: " + level.vtclassname);
    #/
    classname = level.vtclassname;
    if (!isdefined(level.vehicle.templates.deathanimations[classname])) {
        level.vehicle.templates.deathanimations[classname] = [];
    }
    level.vehicle.templates.deathanimations[classname]["forward"] = var_4a32601cc0b7dcc;
    level.vehicle.templates.deathanimations[classname]["right"] = var_de6189ed34354801;
    level.vehicle.templates.deathanimations[classname]["backward"] = var_9ecae3da61774d2e;
    level.vehicle.templates.deathanimations[classname]["left"] = var_da007c9cd223ae3a;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc39
// Size: 0x4e
function build_landanims(var_30fc9b2b4efd0fe0) {
    /#
        assert(isdefined(var_30fc9b2b4efd0fe0));
    #/
    classname = level.vtclassname;
    level.vehicle.templates.landanims[classname] = [[ var_30fc9b2b4efd0fe0 ]]();
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xc8e
// Size: 0x105
function build_turret(info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename, mainturretchild) {
    classname = level.vtclassname;
    if (!isdefined(level.vehicle.templates.mgturret[classname])) {
        level.vehicle.templates.mgturret[classname] = [];
    }
    struct = build_turret_struct(info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename, mainturretchild);
    level.vehicle.templates.mgturret[classname][level.vehicle.templates.mgturret[classname].size] = struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a
// Size: 0xc7
function build_mainturret(info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename) {
    classname = level.vtclassname;
    if (isdefined(level.vehicle.templates.mainturret[classname])) {
        /#
            assertmsg("only 1 mainturret allowed per vehicle");
        #/
    }
    struct = build_turret_struct(info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename);
    level.vehicle.templates.mainturret[classname] = struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe68
// Size: 0xfa
function build_turret_struct(info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename, mainturretchild) {
    precachemodel(model);
    precacheturret(info);
    struct = spawnstruct();
    struct.info = info;
    struct.tag = tag;
    struct.model = model;
    struct.defaultonmode = defaultonmode;
    struct.defaultdroppitch = defaultdroppitch;
    struct.defaultdropyaw = defaultdropyaw;
    if (isdefined(offset_tag)) {
        struct.offset_tag = offset_tag;
    }
    if (isdefined(referencename)) {
        struct.referencename = referencename;
    }
    if (isdefined(mainturretchild) && mainturretchild) {
        struct.mainturretchild = mainturretchild;
    }
    return struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf6a
// Size: 0x171
function build_light(classname, name, tag, effect, group, delay) {
    if (!isdefined(level.vehicle.templates.vehicle_lights)) {
        level.vehicle.templates.vehicle_lights = [];
    }
    if (!isdefined(level.vehicle.templates.vehicle_lights_group_override)) {
        level.vehicle.templates.vehicle_lights_group_override = [];
    }
    if (isdefined(level.vehicle.templates.vehicle_lights_group_override[group]) && !level.vtoverride) {
        return;
    }
    struct = spawnstruct();
    struct.name = name;
    struct.tag = tag;
    struct.delay = delay;
    struct.effect = loadfx(effect);
    level.vehicle.templates.vehicle_lights[classname][name] = struct;
    group_light(classname, name, "all");
    if (isdefined(group)) {
        group_light(classname, name, group);
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10e2
// Size: 0x17a
function function_2cf37d073c6bde84(classname, name, part, group, delay, var_22ed434f33b345af) {
    if (!isdefined(level.vehicle.templates.vehicle_lights)) {
        level.vehicle.templates.vehicle_lights = [];
    }
    if (!isdefined(level.vehicle.templates.vehicle_lights_group_override)) {
        level.vehicle.templates.vehicle_lights_group_override = [];
    }
    if (isdefined(level.vehicle.templates.vehicle_lights_group_override[group]) && !level.vtoverride) {
        return;
    }
    struct = spawnstruct();
    struct.name = name;
    struct.part = part;
    struct.delay = delay;
    struct.isscriptable = 1;
    level.vehicle.templates.vehicle_lights[classname][name] = struct;
    if (!isdefined(var_22ed434f33b345af) || var_22ed434f33b345af == 0) {
        group_light(classname, name, "all");
    }
    if (isdefined(group)) {
        group_light(classname, name, group);
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1263
// Size: 0x8b
function build_hideparts(classname, var_a5ced284f97867db) {
    /#
        assert(isdefined(classname));
    #/
    /#
        assert(isdefined(var_a5ced284f97867db));
    #/
    if (!isdefined(level.vehicle.templates.hide_part_list)) {
        level.vehicle.templates.hide_part_list = [];
    }
    level.vehicle.templates.hide_part_list[classname] = var_a5ced284f97867db;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12f5
// Size: 0x5a
function build_deathmodel(model, deathmodel) {
    if (model != level.vtmodel) {
        return;
    }
    if (!isdefined(deathmodel)) {
        deathmodel = model;
    }
    precachemodel(model);
    precachemodel(deathmodel);
    level.vehicle.templates.deathmodel[model] = deathmodel;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1356
// Size: 0xcd
function function_98128821320aba35(model, var_12a4c0b2eeb1db9d, type, var_cb3cc2d75d941670) {
    if (model != level.vtmodel) {
        return;
    }
    /#
        assertex(isdefined(var_12a4c0b2eeb1db9d), "need to define a scriptable husk");
    #/
    /#
        assertex(isdefined(type), "need to define a vehicle type");
    #/
    precachemodel(model);
    precachemodel(var_12a4c0b2eeb1db9d);
    level.vehicle.templates.var_fb41d1ca75009bf0[model] = var_12a4c0b2eeb1db9d;
    level.vehicle.templates.var_cfb2ce4545421678[model] = type;
    if (!isdefined(var_cb3cc2d75d941670)) {
        var_cb3cc2d75d941670 = 1;
    }
    level.vehicle.templates.var_893da51cf12b2c8b[model] = var_cb3cc2d75d941670;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x142a
// Size: 0xf2
function build_idle(animation) {
    if (!isdefined(level.vehicle.templates.idle_anim)) {
        level.vehicle.templates.idle_anim = [];
    }
    if (!isdefined(level.vehicle.templates.idle_anim[level.vtmodel])) {
        level.vehicle.templates.idle_anim[level.vtmodel] = [];
    }
    level.vehicle.templates.idle_anim[level.vtmodel][level.vehicle.templates.idle_anim[level.vtmodel].size] = animation;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1523
// Size: 0xdb
function build_drive(forward, reverse, normalspeed, rate) {
    if (!isdefined(normalspeed)) {
        normalspeed = 10;
    }
    level.vehicle.templates.driveidle[level.vtmodel] = forward;
    if (isdefined(reverse)) {
        level.vehicle.templates.driveidle_r[level.vtmodel] = reverse;
    }
    level.vehicle.templates.driveidle_normal_speed[level.vtmodel] = normalspeed;
    if (isdefined(rate)) {
        level.vehicle.templates.driveidle_animrate[level.vtmodel] = rate;
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1605
// Size: 0x499
function build_template(class, model, type, classname) {
    vehicle_setuplevelvariables();
    if (!isdefined(type)) {
        type = class;
    }
    /#
        assertex(isdefined(classname), "templated without classname");
    #/
    precachevehicle(type);
    level.vehicle.templates.team[classname] = "neutral";
    level.vehicle.templates.has_main_turret[model] = 0;
    level.vehicle.templates.main_turrets[model] = [];
    level.vtmodel = model;
    level.vttype = type;
    level.vtclassname = classname;
    level.vehicle.templates.model[classname] = model;
    switch (class) {
    case #"hash_37e412543c51c9ec":
        build_life(10000, 9500, 10500);
        build_deathquake(1, 1.6, 500);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 2;
        break;
    case #"hash_b626ccb5ac25b9c":
    case #"hash_68cb10ac5667e070":
        build_life(9000, 8750, 9250);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 500, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 2;
        break;
    case #"hash_e88686bc1d16bcea":
        build_life(12000, 11750, 12250);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 500, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 2;
        break;
    case #"hash_178f2685991a7482":
        build_life(20000, 19000, 21000);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 500, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 5;
        break;
    case #"hash_290903a1af40c196":
        build_life(4000, 3750, 4250);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 400, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 1;
        break;
    case #"hash_479ffef06a7cc84e":
        build_life(10000, 9500, 10500);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 400, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 2;
        break;
    case #"hash_c93466c10cc10ba":
    case #"hash_619324ebc667112c":
    case #"hash_79dd32c8d8093d05":
    case #"hash_895a2c6c51da0091":
        build_life(2500, 2300, 2700);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 400, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 0;
        break;
    case #"hash_1a86166c17e05dc1":
    case #"hash_7ec20b2ed0c1c55b":
    case #"hash_bd2b14a6c78f31a8":
    default:
        build_life(2500, 2300, 2700);
        build_deathquake(1, 1.6, 500);
        build_radiusdamage((0, 0, 0), 400, 120, 20);
        level.vehicle.templates.var_ebd1d83c2799ef12[classname] = 1;
        break;
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa5
// Size: 0x751
function function_40778829123b7952(vehicleRef, vehicleclass) {
    classname = vehicleRef;
    bundlename = classname + "_sp";
    bundle = getscriptbundle("vehiclebundle:" + bundlename);
    if (!isdefined(bundle)) {
        return 0;
    }
    if (isdefined(bundle.compositemodel)) {
        model = bundle.compositemodel;
    } else {
        model = bundle.model;
    }
    type = bundle.vehicle;
    if (!isdefined(model) || !isdefined(type)) {
        return 0;
    }
    build_template(vehicleclass, model, type, classname);
    if (istrue(bundle.var_fb41d1ca75009bf0.var_f2cf04c055fd760e)) {
        if (isdefined(bundle.var_fb41d1ca75009bf0.compositemodel)) {
            var_12a4c0b2eeb1db9d = bundle.var_fb41d1ca75009bf0.compositemodel;
        } else if (isdefined(bundle.var_fb41d1ca75009bf0.model)) {
            var_12a4c0b2eeb1db9d = bundle.var_fb41d1ca75009bf0.model;
        } else {
            var_12a4c0b2eeb1db9d = model;
        }
        if (isdefined(bundle.var_fb41d1ca75009bf0.vehicle)) {
            var_2f8e7e6f392480 = bundle.var_fb41d1ca75009bf0.vehicle;
        } else {
            var_2f8e7e6f392480 = type;
        }
        function_98128821320aba35(model, var_12a4c0b2eeb1db9d, var_2f8e7e6f392480, 0);
    }
    if (istrue(bundle.ai.var_289df80e1ded586f)) {
        /#
            assert(isdefined(bundle.ai.vehicleanimalias) && bundle.ai.vehicleanimalias != "", "You must specify a vehicleAnimAlias if this vehicle supports AI: " + vehicleRef);
        #/
        unload_groups = [];
        unload_groups["default"] = [];
        unload_groups["all"] = [];
        foreach (index, seatdata in bundle.var_f4eae2a1481b7dd3) {
            if (isdefined(seatdata.vehicle_getinanim) && isdefined(seatdata.vehicle_getinanim.id)) {
                seatdata.vehicle_getinanim = seatdata.vehicle_getinanim.id;
            } else {
                seatdata.vehicle_getinanim = undefined;
            }
            if (isdefined(seatdata.vehicle_getoutanim) && isdefined(seatdata.vehicle_getoutanim.id)) {
                seatdata.vehicle_getoutanim = seatdata.vehicle_getoutanim.id;
            } else {
                seatdata.vehicle_getoutanim = undefined;
            }
            if (isdefined(seatdata.linkoffset)) {
                x = ter_op(isdefined(seatdata.linkoffset.x), seatdata.linkoffset.x, 0);
                y = ter_op(isdefined(seatdata.linkoffset.y), seatdata.linkoffset.y, 0);
                z = ter_op(isdefined(seatdata.linkoffset.z), seatdata.linkoffset.z, 0);
                if (x != 0 || y != 0 || z != 0) {
                    seatdata.linkoffset = (x, y, z);
                    seatdata.var_3630ffa8edafef8 = (0, 0, 0);
                } else {
                    seatdata.linkoffset = undefined;
                }
            }
            if (isdefined(bundle.var_7c19cae9edc84d70) && isdefined(bundle.var_7c19cae9edc84d70[index])) {
                var_62b78f0013665ce9 = bundle.var_7c19cae9edc84d70[index];
                if (isdefined(var_62b78f0013665ce9.idle) && isdefined(var_62b78f0013665ce9.idle.id)) {
                    seatdata.idle = var_62b78f0013665ce9.idle.id;
                }
                if (isdefined(var_62b78f0013665ce9.getin) && isdefined(var_62b78f0013665ce9.getin.id)) {
                    seatdata.getin = var_62b78f0013665ce9.getin.id;
                }
                if (isdefined(var_62b78f0013665ce9.getout) && isdefined(var_62b78f0013665ce9.getout.id)) {
                    seatdata.getout = var_62b78f0013665ce9.getout.id;
                }
                if (isdefined(var_62b78f0013665ce9.death) && isdefined(var_62b78f0013665ce9.death.id)) {
                    seatdata.death = var_62b78f0013665ce9.death.id;
                }
                if (isdefined(var_62b78f0013665ce9.ragdoll_fall_anim) && isdefined(var_62b78f0013665ce9.ragdoll_fall_anim.id)) {
                    seatdata.ragdoll_fall_anim = var_62b78f0013665ce9.ragdoll_fall_anim.id;
                }
                if (isdefined(var_62b78f0013665ce9.idle_anim) && var_62b78f0013665ce9.idle_anim != "") {
                    seatdata.idle_anim = var_62b78f0013665ce9.idle_anim;
                }
            }
            if (!istrue(seatdata.do_not_unload)) {
                unload_groups["default"][unload_groups["default"].size] = index;
                unload_groups["all"][unload_groups["all"].size] = index;
            }
        }
        foreach (var_7e219b890204c40d in bundle.unloadgroups) {
            unload_groups[var_7e219b890204c40d.name] = [];
            foreach (index, seatdata in var_7e219b890204c40d.seats) {
                unload_groups[var_7e219b890204c40d.name][unload_groups[var_7e219b890204c40d.name].size] = seatdata.seatindex;
            }
        }
        bundle.unloadgroups = undefined;
        bundle.var_7c19cae9edc84d70 = undefined;
        function_a82f8a25ad7e6b3f(bundle.var_f4eae2a1481b7dd3, bundle.ai.vehicleanimalias);
        function_ab7252da140c8fe7(unload_groups);
    }
    return 1;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21fe
// Size: 0x3a
function build_exhaust(effect) {
    level.vehicle.templates.exhaust_fx[level.vtmodel] = loadfx(effect);
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x223f
// Size: 0x14b
function build_enginefx(effect, effect_tag, var_aaddbb03c1fcc213, var_5518c3038395a8ac, var_daae31d1181d4443, var_857639d0da517cbc, var_7f3baf48a89e1ee5, var_d4f8a348e6fd43d2) {
    /#
        assertex(isdefined(effect), "Failed to build engine effect because there is no effect specified.");
    #/
    if (!isdefined(effect_tag)) {
        effect_tag = "tag_engine_fx";
    }
    struct = spawnstruct();
    struct.effect = loadfx(effect);
    struct.effect_tag = effect_tag;
    if (isdefined(var_aaddbb03c1fcc213)) {
        /#
            assert(isdefined(var_5518c3038395a8ac));
        #/
        struct.max_effort_effect = loadfx(var_aaddbb03c1fcc213);
        struct.max_effort_ratio = var_5518c3038395a8ac;
    }
    if (isdefined(var_daae31d1181d4443)) {
        /#
            assert(isdefined(var_857639d0da517cbc));
        #/
        struct.med_effort_effect = loadfx(var_daae31d1181d4443);
        struct.med_effort_ratio = var_857639d0da517cbc;
    }
    if (isdefined(var_7f3baf48a89e1ee5)) {
        /#
            assert(isdefined(var_d4f8a348e6fd43d2));
        #/
        struct.min_effort_effect = loadfx(var_7f3baf48a89e1ee5);
        struct.min_effort_ratio = var_d4f8a348e6fd43d2;
    }
    level.vehicle.templates.engine_fx[level.vtclassname] = struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2391
// Size: 0x7a
function build_treadfx(classname, type, fx, var_14a8a921608cb466) {
    if (!issp()) {
        return;
    }
    if (isdefined(classname)) {
        set_vehicle_effect(classname, type, fx);
        if (isdefined(var_14a8a921608cb466) && var_14a8a921608cb466) {
            set_vehicle_effect(classname, type, fx, "_bank");
            set_vehicle_effect(classname, type, fx, "_bank_lg");
        }
    } else {
        classname = level.vtclassname;
        namespace_fdd963a6f780db8b::main();
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2412
// Size: 0x73
function build_all_treadfx(classname, fx) {
    types = get_surface_types();
    foreach (type in types) {
        set_vehicle_effect(classname, type);
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x248c
// Size: 0x10d
function set_vehicle_effect(classname, material, fx, suffix) {
    if (!isdefined(level.vehicle.templates.surface_effects)) {
        level.vehicle.templates.surface_effects = [];
    }
    if (isdefined(suffix)) {
        material = material + suffix;
        fx = fx + suffix;
    }
    if (isdefined(fx)) {
        level.vehicle.templates.surface_effects[classname][material] = loadfx(fx);
    } else if (isdefined(level.vehicle.templates.surface_effects[classname]) && isdefined(level.vehicle.templates.surface_effects[classname][material])) {
        level.vehicle.templates.surface_effects[classname][material] = undefined;
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a0
// Size: 0x11b
function get_surface_types() {
    return [0:"brick", 1:"bark", 2:"carpet", 3:"cloth", 4:"concrete", 5:"dirt", 6:"flesh", 7:"foliage", 8:"glass", 9:"grass", 10:"gravel", 11:"ice", 12:"metal", 13:"mud", 14:"paper", 15:"plaster", 16:"rock", 17:"sand", 18:"snow", 19:"water", 20:"wood", 21:"asphalt", 22:"ceramic", 23:"plastic", 24:"rubber", 25:"cushion", 26:"fruit", 27:"paintedmetal", 28:"riotshield", 29:"slush", 30:"default"];
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26c3
// Size: 0x35
function build_team(team) {
    level.vehicle.templates.team[level.vtclassname] = team;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26ff
// Size: 0x40
function build_bulletshield(var_aaad959ce4cd1a0c) {
    /#
        assert(isdefined(var_aaad959ce4cd1a0c));
    #/
    level.vehicle.templates.bullet_shield[level.vtclassname] = var_aaad959ce4cd1a0c;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2746
// Size: 0x40
function build_grenadeshield(var_aaad959ce4cd1a0c) {
    /#
        assert(isdefined(var_aaad959ce4cd1a0c));
    #/
    level.vehicle.templates.grenade_shield[level.vtclassname] = var_aaad959ce4cd1a0c;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x278d
// Size: 0x40
function function_d82e00bef8433948(weaponarray) {
    /#
        assert(isdefined(weaponarray));
    #/
    level.vehicle.templates.var_7412ca7553957e74[level.vtclassname] = weaponarray;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27d4
// Size: 0x40
function function_ceeb72985b41bfb1(var_aaad959ce4cd1a0c) {
    /#
        assert(isdefined(var_aaad959ce4cd1a0c));
    #/
    level.vehicle.templates.var_4356b75e0eddf77d[level.vtclassname] = var_aaad959ce4cd1a0c;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x281b
// Size: 0x118
function build_aianims(var_23460f55e2f66af3, var_7d2527780564c35b, vehicleanimalias) {
    classname = level.vtclassname;
    level.vehicle.templates.aianims[classname] = [[ var_23460f55e2f66af3 ]]();
    if (isdefined(vehicleanimalias) && isdefined(level.func) && isdefined(level.func["set_vehicle_anims_" + vehicleanimalias])) {
        level.vehicle.templates.aianims[classname] = [[ level.func["set_vehicle_anims_" + vehicleanimalias] ]](level.vehicle.templates.aianims[classname]);
    } else if (isdefined(var_7d2527780564c35b)) {
        level.vehicle.templates.aianims[classname] = [[ var_7d2527780564c35b ]](level.vehicle.templates.aianims[classname]);
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293a
// Size: 0xc4
function function_a82f8a25ad7e6b3f(var_fdd5ab14ab76741a, vehicleanimalias) {
    classname = level.vtclassname;
    level.vehicle.templates.aianims[classname] = var_fdd5ab14ab76741a;
    if (isdefined(vehicleanimalias) && isdefined(level.func) && isdefined(level.func["set_vehicle_anims_" + vehicleanimalias])) {
        level.vehicle.templates.aianims[classname] = [[ level.func["set_vehicle_anims_" + vehicleanimalias] ]](level.vehicle.templates.aianims[classname]);
    }
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a05
// Size: 0x37
function build_attach_models(var_f78826186a8a6a5f) {
    level.vehicle.templates.attachedmodels[level.vtclassname] = [[ var_f78826186a8a6a5f ]]();
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a43
// Size: 0x35
function function_423e10816a23372f(var_457fe63912b7190a) {
    level.vehicle.templates.attachedmodels[level.vtclassname] = var_457fe63912b7190a;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7f
// Size: 0x37
function build_unload_groups(var_d22e801bb7cc696a) {
    level.vehicle.templates.unloadgroups[level.vtclassname] = [[ var_d22e801bb7cc696a ]]();
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abd
// Size: 0x35
function function_ab7252da140c8fe7(unloadgroups) {
    level.vehicle.templates.unloadgroups[level.vtclassname] = unloadgroups;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af9
// Size: 0x93
function build_life(health, minhealth, maxhealth) {
    classname = level.vtclassname;
    level.vehicle.templates.life[classname] = health;
    level.vehicle.templates.life_range_low[classname] = minhealth;
    level.vehicle.templates.life_range_high[classname] = maxhealth;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b93
// Size: 0x22
function build_destructible(model, destructible) {
    /#
        assertmsg("this is disabled for now! ");
    #/
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bbc
// Size: 0x30
function build_localinit(init_thread) {
    level.vehicleinitthread[function_40fd49171fad19d3(level.vttype)][level.vtclassname] = init_thread;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf3
// Size: 0x72
function build_atmo_types(var_dfcdaef94e46db19, var_32939c69d1f8188a) {
    level.vehicle.templates.atmotypes[level.vtclassname]["atmo"] = var_dfcdaef94e46db19;
    level.vehicle.templates.atmotypes[level.vtclassname]["space"] = var_32939c69d1f8188a;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6c
// Size: 0x35
function build_ace(var_521073b2c1b5e439) {
    level.vehicle.templates.aces[level.vtclassname] = var_521073b2c1b5e439;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca8
// Size: 0x35
function build_semiace(var_cdf39af1c6b4f363) {
    level.vehicle.templates.semiaces[level.vtclassname] = var_cdf39af1c6b4f363;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce4
// Size: 0x6e
function build_playercontrolled_model(playercontrolledmodel, worldmodel) {
    struct = spawnstruct();
    struct.playercontrolledmodel = playercontrolledmodel;
    struct.worldmodel = worldmodel;
    precachemodel(playercontrolledmodel);
    level.vehicle.templates.vehicleplayermodel[level.vtclassname] = struct;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d59
// Size: 0x83
function build_is_helicopter(vehicle_type) {
    if (!isdefined(level.vehicle.templates.helicopter_list)) {
        level.vehicle.templates.helicopter_list = [];
    }
    if (!isdefined(vehicle_type)) {
        vehicle_type = level.vttype;
    }
    level.vehicle.templates.helicopter_list[function_40fd49171fad19d3(vehicle_type)] = 1;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de3
// Size: 0x83
function function_3a186b889337bd1b(vehicle_type) {
    if (!isdefined(level.vehicle.templates.var_91f3271e71001190)) {
        level.vehicle.templates.var_91f3271e71001190 = [];
    }
    if (!isdefined(vehicle_type)) {
        vehicle_type = level.vttype;
    }
    level.vehicle.templates.var_91f3271e71001190[function_40fd49171fad19d3(vehicle_type)] = 1;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6d
// Size: 0x83
function build_is_airplane(vehicle_type) {
    if (!isdefined(level.vehicle.templates.airplane_list)) {
        level.vehicle.templates.airplane_list = [];
    }
    if (!isdefined(vehicle_type)) {
        vehicle_type = level.vttype;
    }
    level.vehicle.templates.airplane_list[function_40fd49171fad19d3(vehicle_type)] = 1;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef7
// Size: 0x83
function function_5a73d7723fce9849(vehicle_type) {
    if (!isdefined(level.vehicle.templates.var_27719d9c0bc9708a)) {
        level.vehicle.templates.var_27719d9c0bc9708a = [];
    }
    if (!isdefined(vehicle_type)) {
        vehicle_type = level.vttype;
    }
    level.vehicle.templates.var_27719d9c0bc9708a[function_40fd49171fad19d3(vehicle_type)] = 1;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f81
// Size: 0x83
function build_single_tread(vehicle_type) {
    if (!isdefined(level.vehicle.templates.single_tread_list)) {
        level.vehicle.templates.single_tread_list = [];
    }
    if (!isdefined(vehicle_type)) {
        vehicle_type = level.vttype;
    }
    level.vehicle.templates.single_tread_list[function_40fd49171fad19d3(vehicle_type)] = 1;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x300b
// Size: 0x75
function build_rider_death_func(func) {
    if (!isdefined(level.vehicle.templates.rider_death_func)) {
        level.vehicle.templates.rider_death_func = [];
    }
    level.vehicle.templates.rider_death_func[level.vtclassname] = func;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3087
// Size: 0x51
function function_d97dafaf227ed144(classname, vehicletype, init_thread) {
    level.vehicle.templates.var_95742f5c97192175[classname] = vehicletype;
    level.vehicleinitthread[function_40fd49171fad19d3(vehicletype)][classname] = init_thread;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30df
// Size: 0x35
function function_26adacdedd87d439(classname, index) {
    level.vehicle.templates.hudindex[classname] = index;
}

// Namespace vehicle_build/namespace_d8730aa891576e41
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x311b
// Size: 0x90
function function_2660787ca33cf457(classname, parentbone, var_955f6816e98ab2c0) {
    if (!isdefined(level.vehicle.templates.var_a72227c6bfa8a146)) {
        level.vehicle.templates.var_a72227c6bfa8a146 = [];
    }
    if (!isarray(var_955f6816e98ab2c0)) {
        var_955f6816e98ab2c0 = [0:var_955f6816e98ab2c0];
    }
    level.vehicle.templates.var_a72227c6bfa8a146[classname][parentbone] = var_955f6816e98ab2c0;
}

