// mwiii decomp prototype
#using scripts\asm\asm_bb.gsc;

#namespace utility;

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b
// Size: 0x1b
function init_smartobjects() {
    if (isdefined(anim.smartobjects)) {
        return;
    }
    anim.smartobjects = [];
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d
// Size: 0xa6
function validate() {
    if (!isdefined(anim.smartobjectpoints)) {
        return;
    }
    foreach (point in anim.smartobjectpoints) {
        /#
            assertex(isdefined(anim.smartobjects[point.script_smartobject]), "SmartObject "" + point.script_smartobject + "" at " + point.origin + " is not precached");
        #/
    }
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a
// Size: 0x70
function add_smartobject_type(name, fngetinfo, fnusecondition) {
    init_smartobjects();
    /#
        assert(!isdefined(anim.smartobjects[name]));
    #/
    struct = spawnstruct();
    struct.fngetinfo = fngetinfo;
    struct.fnusecondition = fnusecondition;
    anim.smartobjects[name] = struct;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c1
// Size: 0x21
function createsmartobjectinfo() {
    info = spawnstruct();
    info.animlist = [];
    return info;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea
// Size: 0x3d
function addsmartobjectanim_internal(statename, alias) {
    if (!isdefined(self.animlist[statename])) {
        self.animlist[statename] = [];
    }
    self.animlist[statename] = alias;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32e
// Size: 0x24
function addsmartobjectintroanim(alias) {
    addsmartobjectanim_internal("smartobject_intro", alias);
    self.hasintro = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359
// Size: 0x19
function addsmartobjectanim(alias) {
    addsmartobjectanim_internal("smartobject_logic", alias);
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x379
// Size: 0x29
function addsmartobjectreactanim(alias) {
    if (isdefined(alias)) {
        addsmartobjectanim_internal("smartobject_react", alias);
    }
    self.hasreact = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9
// Size: 0x24
function addsmartobjectoutroanim(alias) {
    addsmartobjectanim_internal("smartobject_outro", alias);
    self.hasoutro = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4
// Size: 0xe
function addsmartobjectarrivalanims() {
    self.hasarrivals = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0xe
function addsmartobjectexitanims() {
    self.hasexits = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe
// Size: 0x29
function addsmartobjectpainanim(alias) {
    if (isdefined(alias)) {
        addsmartobjectanim_internal("smartobject_pain", alias);
    }
    self.haspain = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42e
// Size: 0x29
function addsmartobjectdeathanim(alias) {
    if (isdefined(alias)) {
        addsmartobjectanim_internal("smartobject_death", alias);
    }
    self.hasdeath = 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e
// Size: 0x17
function getsmartobjecttype(name) {
    return anim.smartobjects[name];
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d
// Size: 0x111
function smartobject_setnextuse() {
    objtype = getsmartobjecttype(self.script_smartobject);
    info = self [[ objtype.fngetinfo ]]();
    if (isdefined(info.useonce)) {
        self.neveruseagain = 1;
        return;
    }
    nextusetime = gettime() + info.nextusetime * 1000;
    self.nextusetime = nextusetime;
    if (isdefined(self.linkedsmartobjects)) {
        foreach (obj in self.linkedsmartobjects) {
            if (isdefined(obj.nextusetime)) {
                obj.nextusetime = max(obj.nextusetime, nextusetime);
            } else {
                obj.nextusetime = nextusetime;
            }
        }
    }
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595
// Size: 0x45
function claimsmartobject(obj) {
    /#
        assertex(!isdefined(obj.claimer) || obj.claimer == self, "smartobject already claimed by someone else.");
    #/
    obj.claimer = self;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e1
// Size: 0x43
function unclaimsmartobject(obj) {
    /#
        assertex(!isdefined(obj.claimer) || obj.claimer == self, "cannot clear claim on someone else's smartobject.");
    #/
    obj.claimer = undefined;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b
// Size: 0x19
function canclaimsmartobject(obj) {
    return !isdefined(obj.claimer);
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64c
// Size: 0x8a
function canusesmartobject(obj) {
    if (istrue(obj.donotuse)) {
        return 0;
    }
    if (isdefined(obj.neveruseagain)) {
        return 0;
    }
    if (isdefined(obj.nextusetime) && gettime() < obj.nextusetime) {
        return 0;
    }
    var_6378ce7933d6b3b4 = getsmartobjecttype(obj.script_smartobject);
    result = [[ var_6378ce7933d6b3b4.fnusecondition ]](obj);
    return result;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6de
// Size: 0xfe
function getbestsmartobject(desiredpos, volume, var_f34327e65116baaa) {
    if (!isdefined(anim.smartobjectpoints)) {
        return undefined;
    }
    var_b28bb506e83973be = var_f34327e65116baaa * var_f34327e65116baaa;
    var_35a90566147afc1f = sortbydistance(anim.smartobjectpoints, desiredpos);
    var_ff20fabd45ab91fc = var_35a90566147afc1f.size;
    for (var_bdd490b638b4343d = 0; var_bdd490b638b4343d < var_ff20fabd45ab91fc; var_bdd490b638b4343d++) {
        object = var_35a90566147afc1f[var_bdd490b638b4343d];
        if (distancesquared(object.origin, desiredpos) > var_b28bb506e83973be) {
            break;
        }
        if (!canclaimsmartobject(object)) {
            continue;
        }
        if (!canusesmartobject(object)) {
            continue;
        }
        if (!issmartobjectwithinrange(object, desiredpos, volume)) {
            continue;
        }
        var_6378ce7933d6b3b4 = getsmartobjecttype(object.script_smartobject);
        if ([[ var_6378ce7933d6b3b4.fnusecondition ]](object)) {
            return object;
        }
    }
    return undefined;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4
// Size: 0x108
function isplayernearsmartobject(obj) {
    radiussq = 1600;
    var_4124119064906da2 = 4096;
    foreach (player in level.players) {
        if (distance2dsquared(obj.origin, player.origin) < radiussq && squared(obj.origin[2] - player.origin[2]) < var_4124119064906da2) {
            var_2cf6a0823b4bab5d = vectortoyaw(player.origin - obj.origin);
            if (abs(angleclamp180(var_2cf6a0823b4bab5d - obj.angles[1])) < 90) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x8f4
// Size: 0x9ec
function getbestsmartobjectalongline(startpos, endpos, region, volume, var_a0c8823e405a381f, var_7975c128a04cff8c, var_188936ff4f82c5c) {
    if (!isdefined(anim.smartobjectpoints)) {
        return;
    }
    var_1d73dedf4c253ef9 = 60;
    var_7b5554090818485f = 60;
    var_8b8967d098e7c16e = 5184;
    var_79fa165ae4fcd077 = 48;
    if (isdefined(region.volume.script_radius)) {
        var_79fa165ae4fcd077 = region.volume.script_radius;
    }
    var_db6950e933ba5ea4 = 128;
    if (isdefined(region.volume.script_maxdist)) {
        var_db6950e933ba5ea4 = region.volume.script_maxdist;
    }
    starttoend = endpos - startpos;
    linelen = length(starttoend);
    var_e5382b2564f4252a = starttoend / linelen;
    var_3773b7fbba8ed834 = vectornormalize((var_e5382b2564f4252a[1], -1 * var_e5382b2564f4252a[0], 0));
    var_e4bb5ea6b1ad286 = 0;
    drawtime = undefined;
    /#
        drawtime = 40;
        var_e4bb5ea6b1ad286 = getdvarint(@"hash_e24fb561372dfef1", -1) == self getentitynumber();
        if (var_e4bb5ea6b1ad286) {
            line(startpos + (0, 0, 6), endpos + (0, 0, 6), (0, 0.5, 0.7), 1, 0, drawtime);
        }
    #/
    var_42737f8f4a46a4b4 = 60;
    var_56aad2fdc4c529d9 = 5;
    var_ff6725f929e35fcd = 0.33;
    var_259bd6e47136a920 = 1.5;
    var_321115db75019eda = 300000;
    var_c92fd93ef32888fd = 0.001;
    var_8cda798c61b6cfd8 = undefined;
    var_e964ab4b34f8d36a = -9999;
    foreach (obj in region.smart_objects) {
        if (distancesquared(obj.origin, self.origin) < var_8b8967d098e7c16e) {
            /#
                if (var_e4bb5ea6b1ad286) {
                    orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                    print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                }
            #/
        } else if (!canclaimsmartobject(obj)) {
            /#
                if (var_e4bb5ea6b1ad286) {
                    orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                    print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                }
            #/
        } else if (!istrue(var_188936ff4f82c5c) && !canusesmartobject(obj)) {
            /#
                if (var_e4bb5ea6b1ad286) {
                    orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                    print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                }
            #/
        } else {
            var_9515fec383bd148b = obj.origin - startpos;
            var_79850ce546522757 = vectordot(var_e5382b2564f4252a, var_9515fec383bd148b);
            if (var_79850ce546522757 < var_a0c8823e405a381f) {
                /#
                    if (var_e4bb5ea6b1ad286) {
                        orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                        print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                    }
                #/
            } else if (var_79850ce546522757 > linelen + var_1d73dedf4c253ef9) {
                /#
                    if (var_e4bb5ea6b1ad286) {
                        orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                        print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                    }
                #/
            } else {
                var_fa8b7a4393c95bb7 = abs(vectordot(var_3773b7fbba8ed834, var_9515fec383bd148b));
                var_9ada8e56e572e16c = getsmartobjectradiussq(obj);
                if (var_fa8b7a4393c95bb7 * var_fa8b7a4393c95bb7 > var_9ada8e56e572e16c) {
                    /#
                        if (var_e4bb5ea6b1ad286) {
                            orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                            print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                        }
                    #/
                } else {
                    var_6f4072292388afb1 = var_db6950e933ba5ea4;
                    if (linelen - var_fa8b7a4393c95bb7 < 60) {
                        var_6f4072292388afb1 = var_6f4072292388afb1 * 0.5;
                    }
                    if (var_fa8b7a4393c95bb7 > var_6f4072292388afb1) {
                        /#
                            if (var_e4bb5ea6b1ad286) {
                                orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                                print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                            }
                        #/
                    } else if (isdefined(volume) && !ispointinvolume(obj.origin, volume)) {
                        /#
                            if (var_e4bb5ea6b1ad286) {
                                orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.9, 0.4, 0), 0, drawtime);
                                print3d(obj.origin + (0, 0, 24), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                            }
                        #/
                    } else {
                        var_6378ce7933d6b3b4 = getsmartobjecttype(obj.script_smartobject);
                        var_c76f1c2b08872ea0 = linelen - var_a0c8823e405a381f;
                        var_18c156b57d0acfed = var_79850ce546522757 - var_a0c8823e405a381f;
                        var_3544e1d5d0bf7496 = var_7975c128a04cff8c - var_a0c8823e405a381f;
                        if (var_18c156b57d0acfed < var_3544e1d5d0bf7496) {
                            score = var_56aad2fdc4c529d9 + var_42737f8f4a46a4b4 * (1 - (var_3544e1d5d0bf7496 - var_18c156b57d0acfed) / var_3544e1d5d0bf7496);
                        } else {
                            var_c76f1c2b08872ea0 = linelen - var_7975c128a04cff8c + var_1d73dedf4c253ef9;
                            var_18c156b57d0acfed = var_79850ce546522757 - var_7975c128a04cff8c;
                            score = var_56aad2fdc4c529d9 + var_42737f8f4a46a4b4 * (var_c76f1c2b08872ea0 - var_18c156b57d0acfed) / var_c76f1c2b08872ea0;
                        }
                        if (var_fa8b7a4393c95bb7 > var_79fa165ae4fcd077) {
                            var_803ebb87020cad2e = var_fa8b7a4393c95bb7 - var_79fa165ae4fcd077;
                            score = score * (var_ff6725f929e35fcd + (1 - var_803ebb87020cad2e / (var_6f4072292388afb1 - var_79fa165ae4fcd077)) * (1 - var_ff6725f929e35fcd));
                        }
                        if (isplayernearsmartobject(obj)) {
                            score = score * var_259bd6e47136a920;
                            /#
                                if (var_e4bb5ea6b1ad286) {
                                    print3d(obj.origin + (0, 0, 20), "<unknown string>", (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                                }
                            #/
                        }
                        var_6a7a0a172be2f436 = obj [[ var_6378ce7933d6b3b4.fngetinfo ]]();
                        if (isdefined(var_6a7a0a172be2f436.fngetprioritymultiplier)) {
                            score = score * self [[ var_6a7a0a172be2f436.fngetprioritymultiplier ]](obj);
                        }
                        if (isdefined(obj.lastusetime)) {
                            if (gettime() - obj.lastusetime < var_321115db75019eda) {
                                score = score * var_c92fd93ef32888fd;
                            } else {
                                obj.lastusetime = undefined;
                            }
                        }
                        if (score > var_e964ab4b34f8d36a) {
                            var_e964ab4b34f8d36a = score;
                            var_8cda798c61b6cfd8 = obj;
                        }
                        /#
                            if (var_e4bb5ea6b1ad286) {
                                orientedbox(obj.origin + (0, 0, 32), (12, 12, 12), obj.angles, (0.8, 0.8, 0), 0, drawtime);
                                print3d(obj.origin + (0, 0, 24), "<unknown string>" + score, (0.5, 0.5, 0.5), 1, 0.2, drawtime);
                            }
                        #/
                    }
                }
            }
        }
    }
    return var_8cda798c61b6cfd8;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e8
// Size: 0xb2
function getsmartobjectradiussq(obj) {
    if (isdefined(obj.radius)) {
        return (obj.radius * obj.radius);
    }
    objtype = anim.smartobjects[obj.script_smartobject];
    var_6a7a0a172be2f436 = [[ objtype.fngetinfo ]]();
    if (isdefined(var_6a7a0a172be2f436.radius)) {
        return (var_6a7a0a172be2f436.radius * var_6a7a0a172be2f436.radius);
    }
    /#
        assert(isdefined(var_6a7a0a172be2f436.radiussqrd));
    #/
    return var_6a7a0a172be2f436.radiussqrd;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a2
// Size: 0xe8
function issmartobjectwithinrange(object, var_c5bfba134880a4c8, volume) {
    if (isdefined(var_c5bfba134880a4c8)) {
        pos = var_c5bfba134880a4c8;
    } else {
        pos = self.origin;
    }
    distsqrd = distancesquared(pos, object.origin);
    if (isdefined(object.radius)) {
        if (distsqrd > squared(object.radius)) {
            return 0;
        }
    } else {
        type = anim.smartobjects[object.script_smartobject];
        info = [[ type.fngetinfo ]]();
        if (distsqrd > info.radiussqrd) {
            return 0;
        }
    }
    if (isdefined(volume) && !ispointinvolume(object.origin, volume)) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1492
// Size: 0x91
function setcustomsmartobjectarrivaldata(obj) {
    var_6378ce7933d6b3b4 = getsmartobjecttype(obj.script_smartobject);
    info = [[ var_6378ce7933d6b3b4.fngetinfo ]]();
    if (!istrue(info.hasarrivals)) {
        return;
    }
    self.var_a41edf45bb0ff97 = obj.angles;
    self.var_a57082fdf62bc898 = info.animstatename;
    self.var_171120e99df3e286 = 1;
    self.var_8c4d2d1d8377f643 = "arrival";
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152a
// Size: 0x3a
function setsmartobject(var_6c66de307018dfe3) {
    var_47b56f47cd0464ca = namespace_28edc79fcf2fe234::bb_getrequestedsmartobject();
    if (isdefined(var_47b56f47cd0464ca)) {
        clearsmartobject(var_47b56f47cd0464ca);
    }
    claimsmartobject(var_6c66de307018dfe3);
    namespace_28edc79fcf2fe234::bb_requestsmartobject(var_6c66de307018dfe3);
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156b
// Size: 0x20
function clearsmartobject(var_6c66de307018dfe3) {
    if (isdefined(var_6c66de307018dfe3)) {
        unclaimsmartobject(var_6c66de307018dfe3);
    }
    namespace_28edc79fcf2fe234::bb_clearsmartobject();
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1592
// Size: 0x4c
function canusesmartobject_stealth(var_6c66de307018dfe3) {
    if (!isdefined(self.script_stealthgroup)) {
        return 0;
    }
    if (![[ self.fnisinstealthinvestigate ]]() && ![[ self.fnisinstealthhunt ]]()) {
        return 0;
    }
    if (isdefined(self.enemy)) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_277f7d3daf8f1a98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15e6
// Size: 0xba
function canusesmartobject_nostrafenoturn(var_6c66de307018dfe3) {
    forward = anglestoforward(self.angles);
    normal = vectornormalize(var_6c66de307018dfe3.origin - self.origin);
    if (vectordot(forward, normal) >= cos(60)) {
        var_a5bd60698ef8d196 = 64;
    } else {
        var_a5bd60698ef8d196 = 100;
    }
    if (distancesquared(self.origin, var_6c66de307018dfe3.origin) <= var_a5bd60698ef8d196 * var_a5bd60698ef8d196) {
        return 0;
    }
    forward = anglestoforward(var_6c66de307018dfe3.angles);
    if (vectordot(forward, normal) < cos(45)) {
        return 0;
    }
    return 1;
}

