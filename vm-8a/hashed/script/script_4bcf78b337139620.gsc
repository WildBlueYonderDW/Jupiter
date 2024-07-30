#using scripts\engine\utility.gsc;
#using script_54e6d1e4fb728cb8;

#namespace namespace_22693044d975f365;

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdd
// Size: 0x57
function function_b182ef8398a23949(delta, maxdist, callback) {
    level endon("game_ended");
    self endon("disconnect");
    crate = undefined;
    while (true) {
        crate = function_af8d4a24d632c42a(delta, maxdist);
        if (crate != undefined) {
            break;
        }
        waitframe();
    }
    self [[ callback ]](crate);
}

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c
// Size: 0x1c
function function_6acecd6fbf30866(delta, maxdist) {
    return isdefined(function_af8d4a24d632c42a(delta, maxdist));
}

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161
// Size: 0x60
function function_d7cbf1e3a78fcdc(params) {
    assert(isdefined(params));
    angle = params.angle;
    maxdistance = params.maxdistance;
    assert(isdefined(angle));
    assert(isdefined(maxdistance));
    return function_6acecd6fbf30866(angle, maxdistance);
}

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x110
function function_af8d4a24d632c42a(delta, maxdist) {
    assert(delta);
    assert(maxdist);
    var_7fb8e975add38476 = ["br_loot_cache", "br_loot_cache_lege"];
    foreach (var_44844f47e6571a59 in var_7fb8e975add38476) {
        lootcaches = getlootscriptablearrayinradius(var_44844f47e6571a59, undefined, self.origin, maxdist);
        foreach (lootcache in lootcaches) {
            if (!isdefined(lootcache.itemsdropped) && function_ed838558ef4e4e91(lootcache, delta)) {
                return lootcache;
            }
        }
    }
    return undefined;
}

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3
// Size: 0x60
function function_49ff999b129c0c3f(params) {
    assert(isdefined(params));
    maxdist = params.maxdistance;
    assert(isdefined(maxdist));
    lootcache = function_203032caf2ef038b(maxdist);
    self.var_657f5a0d17435bc.var_93bacbf8fe541c21 = lootcache;
    return isdefined(lootcache);
}

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c
// Size: 0x16b
function function_203032caf2ef038b(maxdist) {
    var_7fb8e975add38476 = ["br_loot_cache", "br_loot_cache_lege"];
    closestdist = maxdist * maxdist;
    closestcache = undefined;
    foreach (var_44844f47e6571a59 in var_7fb8e975add38476) {
        lootcaches = getlootscriptablearrayinradius(var_44844f47e6571a59, undefined, self.origin, maxdist);
        foreach (lootcache in lootcaches) {
            if (!isdefined(lootcache.itemsdropped)) {
                checkdist = distancesquared(lootcache.origin, self.origin);
                if (!isdefined(closestcache) || checkdist < closestdist) {
                    currentstate = lootcache getscriptablepartstate("body", 1);
                    if (isdefined(currentstate) && (currentstate == "closed_usable" || currentstate == "closed_usable_no_collision")) {
                        closestcache = lootcache;
                        closestdist = checkdist;
                    }
                }
            }
        }
    }
    return closestcache;
}

// Namespace namespace_22693044d975f365 / namespace_be652f1ae68cdc80
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c0
// Size: 0xb0
function function_f3be9fa4b21eafc2(maxdist) {
    assert(maxdist);
    var_7fb8e975add38476 = ["br_loot_cache", "br_loot_cache_lege"];
    var_c110377a69278429 = [];
    foreach (var_44844f47e6571a59 in var_7fb8e975add38476) {
        lootcaches = [];
        lootcaches = getlootscriptablearrayinradius(var_44844f47e6571a59, undefined, self.origin, maxdist);
        var_c110377a69278429 = array_combine(lootcaches, var_c110377a69278429);
    }
    return var_c110377a69278429;
}

