// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;

#namespace metabone;

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee
// Size: 0x49
function function_fe9929b42e5a99e4(var_3cb9d553a26a429a) {
    /#
        assertex(!isdefined(self.metabones), "Entity has already had its metabones initialized");
    #/
    function_a4f8cf3f5a3d2b5c(var_3cb9d553a26a429a);
    callback::add("on_ai_set_max_health", &function_ec6814be373eb44d);
    /#
        thread function_36c556cbe8a1368b();
    #/
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x6c
function function_cec565632b7fc419(var_c02b1f6c1721c844) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones)) {
        return 0;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    metabone = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
    if (isdefined(metabone)) {
        return is_destroyed(metabone);
    }
    return 0;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b2
// Size: 0x99
function function_4b44008810022d21(var_c02b1f6c1721c844, data_type) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones)) {
        return undefined;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    metabone = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
    if (isdefined(metabone)) {
        metadata = function_285e8211ada4eb78(metabone, data_type);
        if (isdefined(metadata)) {
            var_fcfe730afd096e68 = structcopy(metadata, 1);
            return var_fcfe730afd096e68;
        }
    }
    return undefined;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353
// Size: 0xad
function function_7380ccd6f2c49392(var_c02b1f6c1721c844, active) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    metabone = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
    if (isdefined(metabone)) {
        self.metabones.info[metabone.name].is_active = active;
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407
// Size: 0x1ee
function function_3d2728c0e2252a1d(var_c02b1f6c1721c844, state_name) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    metabone = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
    var_34931ae0d986a6c3 = self.metabones.info[metabone.name];
    if (isdefined(metabone)) {
        if (isdefined(var_34931ae0d986a6c3.var_feb49925a7026dc7)) {
            data = function_7cf25149a71d0124(metabone.states[var_34931ae0d986a6c3.var_feb49925a7026dc7], "Types_Damageable");
            if (isdefined(data)) {
                if (isdefined(var_34931ae0d986a6c3.health)) {
                    var_34931ae0d986a6c3.var_2a815915e30087fe[var_34931ae0d986a6c3.var_feb49925a7026dc7] = var_34931ae0d986a6c3.health;
                }
            }
        }
        state = metabone.var_aaf54b483d8b81[state_name];
        if (isdefined(state)) {
            var_34931ae0d986a6c3.var_feb49925a7026dc7 = state.index;
            if (isdefined(var_34931ae0d986a6c3.var_2a815915e30087fe[var_34931ae0d986a6c3.var_feb49925a7026dc7])) {
                var_34931ae0d986a6c3.health = var_34931ae0d986a6c3.var_2a815915e30087fe[var_34931ae0d986a6c3.var_feb49925a7026dc7];
            } else {
                var_34931ae0d986a6c3.health = undefined;
            }
            params = spawnstruct();
            params.var_c02b1f6c1721c844 = metabone.name;
            params.state_name = state.name;
            callback::callback("metabone_state_changed", params);
        }
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fc
// Size: 0xe9
function function_4ef84a18efbb779a(var_c02b1f6c1721c844, damage, eattacker, einflictor) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return 0;
    }
    b_destroyed = 0;
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (isdefined(var_34931ae0d986a6c3.health) && var_34931ae0d986a6c3.health > 0) {
        if (damage < var_34931ae0d986a6c3.health) {
            var_34931ae0d986a6c3.health = var_34931ae0d986a6c3.health - damage;
            self notify("metabone_damaged_not_destroyed");
        } else {
            function_b51afbf2bd72c825(var_c02b1f6c1721c844, eattacker, einflictor);
            self notify("metabone_destroyed");
            b_destroyed = 1;
        }
    }
    return b_destroyed;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed
// Size: 0x6a
function function_dfd6d030978a7650(var_c02b1f6c1721c844, damage, state_name, eattacker, einflictor) {
    /#
        /#
            assert(isdefined(state_name) && damage >= 0);
        #/
    #/
    new_health = function_949864b2b8c24de6(var_c02b1f6c1721c844, 1, -1 * damage, state_name);
    if (new_health <= 0) {
        function_b51afbf2bd72c825(var_c02b1f6c1721c844, eattacker, einflictor);
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e
// Size: 0x28
function function_3d2875316eed616d(var_c02b1f6c1721c844, health, state_name) {
    function_949864b2b8c24de6(var_c02b1f6c1721c844, 1, health, state_name);
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78d
// Size: 0x27
function function_5f2c6624e43cd8e(var_c02b1f6c1721c844, health, state_name) {
    function_949864b2b8c24de6(var_c02b1f6c1721c844, 0, health, state_name);
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x167
function function_8c1f2f897dfe5982(var_c02b1f6c1721c844, state_name) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (!isdefined(var_34931ae0d986a6c3)) {
        /#
            /#
                assertmsg("<unknown string>" + var_c02b1f6c1721c844);
            #/
        #/
        return undefined;
    }
    if (isdefined(state_name)) {
        var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
        var_d77e3faa9045b032 = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
        target_state = var_d77e3faa9045b032.var_aaf54b483d8b81[state_name];
        var_810a33635bc5c51d = target_state.index;
        if (var_810a33635bc5c51d != var_34931ae0d986a6c3.var_feb49925a7026dc7) {
            damageable_data = function_7cf25149a71d0124(target_state, "Types_Damageable");
            /#
                /#
                    assert(isdefined(damageable_data));
                #/
                /#
                    assert(isdefined(var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d]));
                #/
            #/
            return var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d];
        }
    }
    if (isdefined(var_34931ae0d986a6c3.health)) {
        return var_34931ae0d986a6c3.health;
    }
    return undefined;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92a
// Size: 0x14d
function function_58b8812944c3f7e8(var_c02b1f6c1721c844, state_name) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (!isdefined(var_34931ae0d986a6c3)) {
        /#
            /#
                assertmsg("<unknown string>" + var_c02b1f6c1721c844);
            #/
        #/
        return undefined;
    }
    maxhealth = undefined;
    if (isdefined(state_name)) {
        var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
        var_d77e3faa9045b032 = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
        target_state = var_d77e3faa9045b032.var_aaf54b483d8b81[state_name];
        damageable_data = function_7cf25149a71d0124(target_state, "Types_Damageable");
        /#
            /#
                assert(isdefined(damageable_data));
            #/
        #/
        if (!istrue(damageable_data.absolutehealth)) {
            maxhealth = damageable_data.health * self.metabones.var_6c1c685ac854ccd1;
        } else {
            maxhealth = damageable_data.health;
        }
    }
    return maxhealth;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7f
// Size: 0x106
function function_b51afbf2bd72c825(var_c02b1f6c1721c844, eattacker, einflictor) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (isdefined(var_34931ae0d986a6c3.health) && var_34931ae0d986a6c3.health > 0) {
        var_34931ae0d986a6c3.health = 0;
    }
    var_34931ae0d986a6c3.is_active = 0;
    if (isai(self)) {
        self._blackboard.var_3b3593738bed87c9 = var_c02b1f6c1721c844;
    }
    params = spawnstruct();
    params.var_c02b1f6c1721c844 = var_c02b1f6c1721c844;
    params.eattacker = eattacker;
    params.einflictor = einflictor;
    callback::callback("metabone_destroyed", params);
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8c
// Size: 0x1c8
function function_ae12b32b13b42c5e(hit_loc, direction) {
    if (!isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    foreach (metabone in var_46a3e181e35f46ab.metabones) {
        if (!self.metabones.info[metabone.name].is_active) {
            continue;
        }
        if (is_destroyed(metabone)) {
            continue;
        }
        if (!isdefined(metabone.hitlocations)) {
            continue;
        }
        foreach (var_7cec1af3073bea5d in metabone.hitlocations) {
            if (var_7cec1af3073bea5d.hitlocation == hit_loc) {
                if (isdefined(var_7cec1af3073bea5d.cosmaxangle) && isdefined(direction)) {
                    root_forward = anglestoforward(self.angles);
                    hit_dot = vectordot(root_forward, vectornormalize(direction) * -1);
                    if (hit_dot < var_7cec1af3073bea5d.cosmaxangle) {
                        continue;
                    }
                }
                return metabone.name;
            }
        }
    }
    return undefined;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5c
// Size: 0x2a0
function function_b8f2b0917b1d3c98(point, direction) {
    if (!isdefined(point) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    /#
        if (getdvarint(@"hash_8ef2fd5f0121ed80", 0) > 0) {
            sphere(point, 5, (1, 0, 0));
            print3d(point, "<unknown string>", (1, 0, 0), 0.5);
        }
    #/
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    var_eb5e5797ba4d9aae = undefined;
    var_79e6f388362e52cc = 0;
    foreach (metabone in var_46a3e181e35f46ab.metabones) {
        if (!self.metabones.info[metabone.name].is_active) {
            continue;
        }
        if (is_destroyed(metabone)) {
            continue;
        }
        if (!isdefined(metabone.tags)) {
            continue;
        }
        foreach (tag in metabone.tags) {
            tag_origin = self gettagorigin(tag.tagname);
            var_b3021a9163304fa3 = squared(default_to(tag.radius, 1));
            dist_sq = distancesquared(point, tag_origin);
            if (dist_sq <= var_b3021a9163304fa3 && (!isdefined(var_eb5e5797ba4d9aae) || dist_sq < var_79e6f388362e52cc)) {
                if (isdefined(tag.cosmaxangle) && isdefined(direction)) {
                    tag_forward = anglestoforward(self gettagangles(tag.tagname));
                    tag_dot = vectordot(tag_forward, vectornormalize(direction) * -1);
                    if (tag_dot < tag.cosmaxangle) {
                        continue;
                    }
                }
                var_eb5e5797ba4d9aae = metabone;
                var_79e6f388362e52cc = dist_sq;
            }
        }
    }
    if (isdefined(var_eb5e5797ba4d9aae)) {
        return var_eb5e5797ba4d9aae.name;
    }
    return undefined;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1004
// Size: 0x3a
function function_d6736c5ef5ac2990(var_601bcee5d276f46d, var_b9f4b7206d76e7ce) {
    level.var_847f5cdc69cd7c79 = default_to(level.var_847f5cdc69cd7c79, []);
    level.var_847f5cdc69cd7c79[var_601bcee5d276f46d] = var_b9f4b7206d76e7ce;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1045
// Size: 0x16
function function_691c50069ed7c2f7(var_4810813762c90924) {
    self.var_4810813762c90924 = var_4810813762c90924;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1062
// Size: 0x26
function function_e3bec440b7001e99(dmgstruct) {
    if (isdefined(self.var_4810813762c90924)) {
        return [[ self.var_4810813762c90924 ]](dmgstruct);
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0xd
function function_df9189c2ea1a100d() {
    return isdefined(self.var_4810813762c90924);
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a4
// Size: 0x277
function function_ec6814be373eb44d(params) {
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    foreach (metabone in var_46a3e181e35f46ab.metabones) {
        if (isdefined(metabone.states) && metabone.states.size > 0) {
            var_34931ae0d986a6c3 = self.metabones.info[metabone.name];
            foreach (state_index, state in metabone.states) {
                damageable_data = function_7cf25149a71d0124(state, "Types_Damageable");
                if (isdefined(damageable_data)) {
                    if (!istrue(damageable_data.absolutehealth)) {
                        /#
                            assertex(isdefined(self.maxhealth), "Entity [" + self getentitynumber() + "] doesn't have maxhealth but metabone [" + metabone.name + "] in [" + self.metabones.bundle_name + "] has damageable metadata set to non Absolute Health");
                        #/
                        var_e428cc599ed8d60b = damageable_data.health;
                        if (isdefined(self.metabones.var_6c1c685ac854ccd1) && isdefined(var_34931ae0d986a6c3.health)) {
                            var_e428cc599ed8d60b = damageable_data.health * self.metabones.var_6c1c685ac854ccd1;
                        }
                        if (state_index == var_34931ae0d986a6c3.var_feb49925a7026dc7) {
                            var_544557cd869c9bd = var_34931ae0d986a6c3.health / var_e428cc599ed8d60b;
                            var_34931ae0d986a6c3.health = damageable_data.health * self.maxhealth * var_544557cd869c9bd;
                            continue;
                        }
                        var_544557cd869c9bd = var_34931ae0d986a6c3.var_2a815915e30087fe[state_index] / var_e428cc599ed8d60b;
                        var_34931ae0d986a6c3.var_2a815915e30087fe[state_index] = damageable_data.health * self.maxhealth * var_544557cd869c9bd;
                    }
                }
            }
        }
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1322
// Size: 0xe9
function function_adb7b3f940cde3b5(var_c02b1f6c1721c844) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return 0;
    }
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (!isdefined(var_34931ae0d986a6c3) || !isdefined(var_34931ae0d986a6c3.var_feb49925a7026dc7)) {
        return 0;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    metabone = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
    state = metabone.states[var_34931ae0d986a6c3.var_feb49925a7026dc7];
    armor_data = function_7cf25149a71d0124(state, "Types_Armor");
    return isdefined(armor_data);
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1413
// Size: 0xe1
function function_8ddba5bfa85f8cc9(var_c02b1f6c1721c844) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (!isdefined(var_34931ae0d986a6c3) || !isdefined(var_34931ae0d986a6c3.var_feb49925a7026dc7)) {
        return undefined;
    }
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    metabone = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
    state = metabone.states[var_34931ae0d986a6c3.var_feb49925a7026dc7];
    if (isdefined(state)) {
        return state.name;
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14fb
// Size: 0x123
function function_9a6eacf7b4bcee1b(data_type) {
    if (!isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return [];
    }
    var_1b4c19600d1566b0 = [];
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    foreach (metabone in var_46a3e181e35f46ab.metabones) {
        var_34931ae0d986a6c3 = self.metabones.info[metabone.name];
        if (!var_34931ae0d986a6c3.is_active) {
            continue;
        }
        if (isdefined(data_type)) {
            metadata = function_285e8211ada4eb78(metabone, data_type);
            if (!isdefined(metadata)) {
                continue;
            }
        }
        var_1b4c19600d1566b0[var_1b4c19600d1566b0.size] = metabone.name;
    }
    return var_1b4c19600d1566b0;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1626
// Size: 0x1d9
function private function_949864b2b8c24de6(var_c02b1f6c1721c844, var_ed88b4655021d371, health, state_name) {
    if (!isdefined(var_c02b1f6c1721c844) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return;
    }
    var_34931ae0d986a6c3 = self.metabones.info[var_c02b1f6c1721c844];
    if (!isdefined(var_34931ae0d986a6c3)) {
        /#
            /#
                assertmsg("<unknown string>" + var_c02b1f6c1721c844);
            #/
        #/
        return;
    }
    if (isdefined(state_name)) {
        var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
        var_d77e3faa9045b032 = var_46a3e181e35f46ab.var_5840b90f4e873441[var_c02b1f6c1721c844];
        target_state = var_d77e3faa9045b032.var_aaf54b483d8b81[state_name];
        var_810a33635bc5c51d = target_state.index;
        if (var_810a33635bc5c51d != var_34931ae0d986a6c3.var_feb49925a7026dc7) {
            damageable_data = function_7cf25149a71d0124(target_state, "Types_Damageable");
            /#
                /#
                    assert(isdefined(damageable_data));
                #/
                /#
                    assert(isdefined(var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d]));
                #/
            #/
            if (var_ed88b4655021d371) {
                var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d] = var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d] + health;
            } else {
                var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d] = health;
            }
            return var_34931ae0d986a6c3.var_2a815915e30087fe[var_810a33635bc5c51d];
        }
    }
    if (isdefined(var_34931ae0d986a6c3.health)) {
        if (var_ed88b4655021d371) {
            var_34931ae0d986a6c3.health = var_34931ae0d986a6c3.health + health;
        } else {
            var_34931ae0d986a6c3.health = health;
        }
    }
    return var_34931ae0d986a6c3.health;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1807
// Size: 0x81
function private is_destroyed(metabone) {
    if (!isdefined(metabone) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return false;
    }
    var_34931ae0d986a6c3 = self.metabones.info[metabone.name];
    return isdefined(var_34931ae0d986a6c3.health) && var_34931ae0d986a6c3.health <= 0;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1890
// Size: 0x10e
function private function_285e8211ada4eb78(metabone, data_type) {
    if (!isdefined(metabone) || !isdefined(self.metabones) || !isdefined(self.metabones.info)) {
        return undefined;
    }
    var_34931ae0d986a6c3 = self.metabones.info[metabone.name];
    if (isdefined(var_34931ae0d986a6c3.var_feb49925a7026dc7)) {
        data = function_7cf25149a71d0124(metabone.states[var_34931ae0d986a6c3.var_feb49925a7026dc7], data_type);
        if (isdefined(data)) {
            return data;
        }
    }
    foreach (data in metabone.metadata) {
        if (data.variant_type == data_type) {
            return data.variant_object;
        }
    }
    return undefined;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19a6
// Size: 0x80
function private function_7cf25149a71d0124(metabone_state, data_type) {
    foreach (data in metabone_state.metadata) {
        if (data.variant_type == data_type) {
            return data.variant_object;
        }
    }
    return undefined;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2e
// Size: 0x59
function function_97fd256a244527b4(var_3cb9d553a26a429a) {
    var_46a3e181e35f46ab = undefined;
    if (isdefined(level.var_b9afc8a70a88cd08)) {
        var_46a3e181e35f46ab = level.var_b9afc8a70a88cd08[var_3cb9d553a26a429a];
    }
    if (!isdefined(var_46a3e181e35f46ab)) {
        var_46a3e181e35f46ab = function_1349c07bc3a21602(var_3cb9d553a26a429a);
        level.var_b9afc8a70a88cd08[var_3cb9d553a26a429a] = var_46a3e181e35f46ab;
    }
    /#
        assert(isdefined(var_46a3e181e35f46ab));
    #/
    return var_46a3e181e35f46ab;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a8f
// Size: 0x1a5
function private function_1349c07bc3a21602(var_3cb9d553a26a429a) {
    var_46a3e181e35f46ab = getscriptbundle("metabonelist:" + var_3cb9d553a26a429a);
    var_46a3e181e35f46ab.var_5840b90f4e873441 = [];
    for (var_85b8d7e4cfc398d = 0; var_85b8d7e4cfc398d < var_46a3e181e35f46ab.metabones.size; var_85b8d7e4cfc398d++) {
        metabone = var_46a3e181e35f46ab.metabones[var_85b8d7e4cfc398d];
        if (!isdefined(metabone.name) || metabone.name == "") {
            metabone.name = string(var_85b8d7e4cfc398d);
        }
        if (isdefined(var_46a3e181e35f46ab.var_5840b90f4e873441[metabone.name])) {
            /#
                assertmsg("Bundle [" + var_3cb9d553a26a429a + "] already has a metabone with name [" + metabone.name + "]");
            #/
            metabone.name = string(var_85b8d7e4cfc398d);
        }
        var_46a3e181e35f46ab.var_5840b90f4e873441[metabone.name] = metabone;
        metabone.var_aaf54b483d8b81 = [];
        for (state_index = 0; state_index < metabone.states.size; state_index++) {
            state = metabone.states[state_index];
            state.index = state_index;
            if (isdefined(state.name) && state.name != "") {
                metabone.var_aaf54b483d8b81[state.name] = state;
            }
        }
    }
    return var_46a3e181e35f46ab;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c3c
// Size: 0x2dc
function private function_a4f8cf3f5a3d2b5c(var_3cb9d553a26a429a) {
    self.metabones = spawnstruct();
    self.metabones.bundle_name = var_3cb9d553a26a429a;
    self.metabones.info = [];
    self.metabones.var_6c1c685ac854ccd1 = self.maxhealth;
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
    foreach (metabone in var_46a3e181e35f46ab.metabones) {
        var_34931ae0d986a6c3 = spawnstruct();
        self.metabones.info[metabone.name] = var_34931ae0d986a6c3;
        var_34931ae0d986a6c3.is_active = default_to(metabone.activebydefault, 0);
        if (isdefined(metabone.states) && metabone.states.size > 0) {
            var_34931ae0d986a6c3.var_feb49925a7026dc7 = 0;
            function_547b62fd3c36bc06(metabone);
        }
        if (isdefined(metabone.tags)) {
            foreach (tag in metabone.tags) {
                if (isdefined(tag.maxangle)) {
                    tag.cosmaxangle = cos(tag.maxangle * 0.5);
                }
            }
        }
        if (isdefined(metabone.hitlocations)) {
            foreach (var_7cec1af3073bea5d in metabone.hitlocations) {
                if (isdefined(var_7cec1af3073bea5d.maxangle)) {
                    var_7cec1af3073bea5d.cosmaxangle = cos(var_7cec1af3073bea5d.maxangle * 0.5);
                }
            }
        }
    }
    if (isdefined(level.var_847f5cdc69cd7c79) && isdefined(var_46a3e181e35f46ab.var_ded947577ba0ee4a) && isdefined(level.var_847f5cdc69cd7c79[var_46a3e181e35f46ab.var_ded947577ba0ee4a])) {
        callback::add("metabone_destroyed", level.var_847f5cdc69cd7c79[var_46a3e181e35f46ab.var_ded947577ba0ee4a]);
    }
    /#
        function_568f6f061a4565d4();
    #/
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f1f
// Size: 0x185
function private function_547b62fd3c36bc06(metabone) {
    var_34931ae0d986a6c3 = self.metabones.info[metabone.name];
    var_34931ae0d986a6c3.health = undefined;
    if (!isdefined(var_34931ae0d986a6c3.var_2a815915e30087fe)) {
        var_34931ae0d986a6c3.var_2a815915e30087fe = [];
        foreach (state in metabone.var_aaf54b483d8b81) {
            damageable_data = function_7cf25149a71d0124(state, "Types_Damageable");
            if (isdefined(damageable_data)) {
                var_34931ae0d986a6c3.var_2a815915e30087fe[state.index] = function_443c5a540f976e2e(self, damageable_data);
            }
        }
    }
    if (isdefined(var_34931ae0d986a6c3.var_2a815915e30087fe[var_34931ae0d986a6c3.var_feb49925a7026dc7])) {
        var_34931ae0d986a6c3.health = var_34931ae0d986a6c3.var_2a815915e30087fe[var_34931ae0d986a6c3.var_feb49925a7026dc7];
        return;
    }
    var_7e9b2fa2f115c999 = function_285e8211ada4eb78(metabone, "Types_Damageable");
    if (isdefined(var_7e9b2fa2f115c999)) {
        /#
            /#
                assertex(var_34931ae0d986a6c3.var_2a815915e30087fe.size <= 0, "<unknown string>" + metabone.name);
            #/
        #/
        var_34931ae0d986a6c3.health = function_443c5a540f976e2e(self, var_7e9b2fa2f115c999);
    }
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20ab
// Size: 0x89
function private function_443c5a540f976e2e(entity, damageable_data) {
    if (istrue(damageable_data.absolutehealth)) {
        return damageable_data.health;
    }
    /#
        assertex(isdefined(entity.maxhealth), "Entity [" + entity getentitynumber() + "] doesn't have maxhealth in [" + entity.metabones.bundle_name + "] has damageable metadata set to non Absolute Health");
    #/
    return damageable_data.health * entity.maxhealth;
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x213c
// Size: 0x142
function private function_568f6f061a4565d4() {
    /#
        var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
        foreach (metabone in var_46a3e181e35f46ab.metabones) {
            if (isdefined(metabone.tags)) {
                foreach (tag in metabone.tags) {
                    /#
                        assertex(isdefined(self function_6c7826de76771f17(tag.tagname)), "<unknown string>" + self getentitynumber() + "<unknown string>" + tag.tagname + "<unknown string>" + metabone.name + "<unknown string>" + self.metabones.bundle_name + "<unknown string>");
                    #/
                }
            }
        }
    #/
}

// Namespace metabone / namespace_6fb6f707cdc959d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2285
// Size: 0x33d
function private function_36c556cbe8a1368b() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (true) {
            entity_num = getdvarint(@"hash_cb5d8071bd842694", -1);
            entity = getentbynum(entity_num);
            if (isdefined(entity) && isdefined(entity.metabones)) {
                print_x = 400;
                print_y = 300;
                printtoscreen2d(print_x, print_y, "<unknown string>");
                var_46a3e181e35f46ab = function_97fd256a244527b4(entity.metabones.bundle_name);
                foreach (metabone in var_46a3e181e35f46ab.metabones) {
                    print_y = print_y + 20;
                    var_34931ae0d986a6c3 = entity.metabones.info[metabone.name];
                    var_d1b44d5c67eaa4ef = metabone.name;
                    if (!var_34931ae0d986a6c3.is_active) {
                        var_d1b44d5c67eaa4ef = var_d1b44d5c67eaa4ef + "<unknown string>";
                    }
                    if (entity is_destroyed(metabone)) {
                        var_d1b44d5c67eaa4ef = var_d1b44d5c67eaa4ef + "<unknown string>";
                    }
                    printtoscreen2d(print_x, print_y, var_d1b44d5c67eaa4ef);
                    if (isdefined(var_34931ae0d986a6c3.health)) {
                        print_y = print_y + 18;
                        printtoscreen2d(print_x, print_y, "<unknown string>" + var_34931ae0d986a6c3.health);
                    }
                    if (isdefined(var_34931ae0d986a6c3.var_feb49925a7026dc7)) {
                        print_y = print_y + 18;
                        state = metabone.states[var_34931ae0d986a6c3.var_feb49925a7026dc7];
                        var_81c89512ec33be2f = "<unknown string>" + var_34931ae0d986a6c3.var_feb49925a7026dc7;
                        if (isdefined(state.name)) {
                            var_81c89512ec33be2f = "<unknown string>" + state.name + "<unknown string>";
                        }
                        printtoscreen2d(print_x + 10, print_y, var_81c89512ec33be2f);
                    }
                    if (var_34931ae0d986a6c3.is_active && !entity is_destroyed(metabone)) {
                        if (getdvarint(@"hash_8ef2fd5f0121ed80", 0) && isdefined(metabone.tags)) {
                            foreach (tag in metabone.tags) {
                                tagorigin = entity gettagorigin(tag.tagname, 1);
                                if (isdefined(tagorigin)) {
                                    sphere(tagorigin, tag.radius, (0, 0, 1));
                                    print3d(tagorigin, metabone.name, (0, 0, 1), 1, 0.25);
                                }
                            }
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

