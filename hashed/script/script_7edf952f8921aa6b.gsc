// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace zombie_utils;

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x15d
// Size: 0x45
function autoexec init() {
    utility::registersharedfunc("zombie_utils", "setMoveSpeed", &function_f1e5805da192a1ef);
    utility::registersharedfunc("zombie_utils", "setTarget", &function_a047f71d0256058b);
    utility::registersharedfunc("zombie_utils", "registerDamageCallback", &function_b5e57408c7878df7);
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9
// Size: 0x2fb
function function_f1e5805da192a1ef(var_21a40aa35e41881a, id, priority) {
    /#
        assertex(ent_flag("ai_init_complete"), "set_ai_move_speed_priority called before callbacks have been enabled");
    #/
    id = isdefined(id) ? "default" : id;
    priority = isdefined(priority) ? 0 : priority;
    self.var_caeb5ca53668812c = isdefined(self.var_caeb5ca53668812c) ? [] : self.var_caeb5ca53668812c;
    if (isdefined(var_21a40aa35e41881a)) {
        archetype = self.var_ae3ea15396b65c1f;
        target_speed = getanimspeedthreshold(archetype, var_21a40aa35e41881a);
        if (!isdefined(target_speed)) {
            return;
        }
    }
    var_2d685d04940730d0 = spawnstruct();
    var_2d685d04940730d0.id = id;
    var_2d685d04940730d0.var_21a40aa35e41881a = var_21a40aa35e41881a;
    var_2d685d04940730d0.priority = priority;
    for (i = 0; i < self.var_caeb5ca53668812c.size; i++) {
        current = self.var_caeb5ca53668812c[i];
        if (isdefined(current) && current.id == id) {
            self.var_caeb5ca53668812c = array_remove_index(self.var_caeb5ca53668812c, i);
            break;
        }
    }
    var_2cd048a768ae9710 = 0;
    if (isdefined(var_21a40aa35e41881a)) {
        for (i = 0; i < self.var_caeb5ca53668812c.size; i++) {
            current = self.var_caeb5ca53668812c[i];
            if (!isdefined(current) || current.priority < priority) {
                continue;
            }
            if (current.priority == priority) {
                /#
                    /#
                        assertmsg("<unknown string>" + current.id + "<unknown string>" + id + "<unknown string>");
                    #/
                #/
                self.var_caeb5ca53668812c = array_insert(self.var_caeb5ca53668812c, var_2d685d04940730d0, i + 1);
                var_2cd048a768ae9710 = 1;
            } else if (current.priority > priority) {
                self.var_caeb5ca53668812c = array_insert(self.var_caeb5ca53668812c, var_2d685d04940730d0, i);
                var_2cd048a768ae9710 = 1;
            }
            break;
        }
        if (!var_2cd048a768ae9710) {
            var_2cd048a768ae9710 = 1;
            self.var_caeb5ca53668812c = array_add(self.var_caeb5ca53668812c, var_2d685d04940730d0);
        }
    }
    if (isarray(self.var_caeb5ca53668812c) && isstruct(self.var_caeb5ca53668812c[self.var_caeb5ca53668812c.size - 1])) {
        new_move_speed = self.var_caeb5ca53668812c[self.var_caeb5ca53668812c.size - 1].var_21a40aa35e41881a;
        if (!bb_movetyperequested(new_move_speed)) {
            bb_requestmovetype(new_move_speed);
            archetype = self.var_ae3ea15396b65c1f;
            target_speed = getanimspeedthreshold(archetype, new_move_speed);
            if (isdefined(target_speed)) {
                self aisetdesiredspeed(target_speed);
                self aisettargetspeed(target_speed);
                callback::callback("on_move_speed_changed");
            }
        }
    }
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0x2c4
function function_a047f71d0256058b(target_ent, id, priority) {
    id = isdefined(id) ? "default" : id;
    priority = isdefined(priority) ? 0 : priority;
    self.var_a2f8ae60cc4dab38 = isdefined(self.var_a2f8ae60cc4dab38) ? [] : self.var_a2f8ae60cc4dab38;
    target_struct = spawnstruct();
    target_struct.id = id;
    target_struct.target_ent = target_ent;
    target_struct.priority = priority;
    for (i = 0; i < self.var_a2f8ae60cc4dab38.size; i++) {
        current = self.var_a2f8ae60cc4dab38[i];
        if (!isdefined(current.target_ent) || !isalive(current.target_ent) || isdefined(current) && current.id == id) {
            self.var_a2f8ae60cc4dab38 = array_remove_index(self.var_a2f8ae60cc4dab38, i);
            break;
        }
    }
    var_2cd048a768ae9710 = 0;
    if (isdefined(target_ent)) {
        for (i = 0; i < self.var_a2f8ae60cc4dab38.size; i++) {
            current = self.var_a2f8ae60cc4dab38[i];
            if (!isdefined(current) || current.priority < priority) {
                continue;
            }
            if (current.priority == priority) {
                /#
                    /#
                        assertmsg("<unknown string>" + current.id + "<unknown string>" + id + "<unknown string>");
                    #/
                #/
                self.var_a2f8ae60cc4dab38 = array_insert(self.var_a2f8ae60cc4dab38, target_struct, i + 1);
                var_2cd048a768ae9710 = 1;
            } else if (current.priority > priority) {
                self.var_a2f8ae60cc4dab38 = array_insert(self.var_a2f8ae60cc4dab38, target_struct, i);
                var_2cd048a768ae9710 = 1;
            }
            break;
        }
        if (!var_2cd048a768ae9710) {
            var_2cd048a768ae9710 = 1;
            self.var_a2f8ae60cc4dab38 = array_add(self.var_a2f8ae60cc4dab38, target_struct);
        }
    }
    if (self.var_a2f8ae60cc4dab38.size > 0 && isstruct(self.var_a2f8ae60cc4dab38[self.var_a2f8ae60cc4dab38.size - 1])) {
        new_target = self.var_a2f8ae60cc4dab38[self.var_a2f8ae60cc4dab38.size - 1].target_ent;
        if (!isdefined(self.favoriteenemy) && isdefined(new_target) || isdefined(self.favoriteenemy) && !isdefined(new_target) || self.favoriteenemy != new_target) {
            self.favoriteenemy = new_target;
        }
    }
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x776
// Size: 0x3c
function function_b5e57408c7878df7(func) {
    if (!isdefined(self.var_36cfc021447f6d92)) {
        self.var_36cfc021447f6d92 = [];
    }
    self.var_36cfc021447f6d92 = array_add(self.var_36cfc021447f6d92, func);
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b9
// Size: 0x37
function function_fabb6087888f45c8(func) {
    if (!isarray(self.var_36cfc021447f6d92)) {
        return;
    }
    self.var_36cfc021447f6d92 = array_remove(self.var_36cfc021447f6d92, func);
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7f7
// Size: 0x38
function function_68ab6089a2897e86(weapon_name, func) {
    if (!isdefined(self.var_ccb94c2ea5886365)) {
        self.var_ccb94c2ea5886365 = [];
    }
    self.var_ccb94c2ea5886365[weapon_name] = func;
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x836
// Size: 0x37
function function_4a7028dbd330a123(weapon_name) {
    if (!isarray(self.var_ccb94c2ea5886365)) {
        return;
    }
    self.var_ccb94c2ea5886365 = array_remove_key(self.var_ccb94c2ea5886365, weapon_name);
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x874
// Size: 0x22
function function_2201d3f3d7ab07a7() {
    /#
        /#
            assert(isdefined(self.var_d10755c0244b1937));
        #/
    #/
    return self.var_d10755c0244b1937;
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89e
// Size: 0xfe
function function_6dc6c46856cb890(ent) {
    /#
        assert(isdefined(ent));
    #/
    self.var_8841e18d41e1ecb = function_53c4c53197386572(self.var_8841e18d41e1ecb, []);
    var_ff81381f2596d7da = !isdefined(self.var_8841e18d41e1ecb[ent getentitynumber()]);
    var_3aa2cc768cd55c4b = !var_ff81381f2596d7da && self.var_8841e18d41e1ecb[ent getentitynumber()].time != gettime();
    if (var_ff81381f2596d7da || var_3aa2cc768cd55c4b) {
        var_87edff3d1e6feb41 = spawnstruct();
        var_87edff3d1e6feb41.time = gettime();
        var_87edff3d1e6feb41.origin = self getclosestreachablepointonnavmesh(ent.origin, 0);
        self.var_8841e18d41e1ecb[ent getentitynumber()] = var_87edff3d1e6feb41;
    }
    var_c43c46ac461773dc = self.var_8841e18d41e1ecb[ent getentitynumber()].origin;
    return var_c43c46ac461773dc;
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a4
// Size: 0xe8
function function_a55b3d6929d24cf7(pos, priority) {
    /#
        assert(isdefined(pos));
    #/
    priority = function_53c4c53197386572(priority, 0);
    if (isdefined(level.var_196dea71269368b1) && isdefined(level.var_a3db96fad0d53230)) {
        var_876aca8896051e71 = [[ level.var_a3db96fad0d53230 ]](self.origin, pos);
        path = undefined;
        if (isdefined(var_876aca8896051e71) && var_876aca8896051e71 > 2) {
            path = [[ level.var_196dea71269368b1 ]](self.origin, pos);
        }
        if (isarray(path) && path.size > 2) {
            /#
                self.var_a7caf2881d0c1fee = "<unknown string>";
            #/
            self setbtgoalpos(priority, path[1].origin);
            return;
        }
    }
    /#
        self.var_a7caf2881d0c1fee = "<unknown string>";
    #/
    self setbtgoalpos(priority, pos);
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa93
// Size: 0x3a
function function_2576f3b996c15ad(id, value) {
    self.var_bb771abdb5fb033e = function_53c4c53197386572(self.var_bb771abdb5fb033e, []);
    self.var_bb771abdb5fb033e[id] = value;
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad4
// Size: 0x3d
function function_b559c67c7f8f6459(id) {
    /#
        /#
            assert(isdefined(self.var_bb771abdb5fb033e) && isdefined(self.var_bb771abdb5fb033e[id]));
        #/
    #/
    return self.var_bb771abdb5fb033e[id];
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb19
// Size: 0x9d
function function_ca27630def7b7aad(attacker) {
    if (ent_flag("turned")) {
        return;
    }
    ent_flag_set("turned");
    params = spawnstruct();
    params.attacker = attacker;
    callback::callback("on_turned", params);
    self.health = self.maxhealth;
    self.allowpain = 0;
    if (isdefined(attacker) && isdefined(attacker.team)) {
        self.team = attacker.team;
    }
    self clearpath();
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0xd1
function function_6d1fbda4b8524ef2(origin, team, var_8559bf711f66a349) {
    zombie_team = team;
    if (!isdefined(zombie_team)) {
        zombie_team = "all";
    }
    var_3cdc5f48ddd52834 = getaispeciesarray(zombie_team, "zombie");
    var_dc6aeaa01d771f22 = [];
    if (isdefined(var_8559bf711f66a349)) {
        foreach (ai in var_3cdc5f48ddd52834) {
            if (ai.subclass != var_8559bf711f66a349) {
                continue;
            }
            var_dc6aeaa01d771f22 = array_add(var_dc6aeaa01d771f22, ai);
        }
    } else {
        var_dc6aeaa01d771f22 = var_3cdc5f48ddd52834;
    }
    return get_array_of_closest(origin, var_dc6aeaa01d771f22)[0];
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc96
// Size: 0x68
function function_cb7771bf461049eb(var_642af5f587dd2300) {
    /#
        /#
            assert(isdefined(var_642af5f587dd2300));
        #/
    #/
    var_25a6e4bd6fdd4538 = getscriptbundle("zombieaisettings:" + var_642af5f587dd2300.var_570908460ede5c13);
    if (isdefined(var_25a6e4bd6fdd4538.var_fef5d84db3c8e7f7)) {
        var_e58a65b7a8f5973c = getscriptbundle(var_25a6e4bd6fdd4538.var_fef5d84db3c8e7f7);
        return var_e58a65b7a8f5973c;
    }
    return undefined;
}

// Namespace zombie_utils/namespace_dd16d65e824b8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd06
// Size: 0x7a
function function_d8853db47f5b98e4(params) {
    if (isdefined(params.body)) {
        return params.body;
    } else if (isdefined(params.var_9c708f7e145a6bbe)) {
        body = getentbynum(params.var_9c708f7e145a6bbe);
        if (isactorcorpse(body) && body.classname == params.var_b51ca657393cc86f) {
            return body;
        }
    }
}

