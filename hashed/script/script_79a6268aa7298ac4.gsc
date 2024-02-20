// mwiii decomp prototype
#using script_3d2770dc09c1243;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_a6c9c44798b37fa6;

// Namespace namespace_a6c9c44798b37fa6/namespace_4fc54f74105650c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104
// Size: 0x4bd
function function_14f6e531ffd2958d() {
    var_e6aedea5e48791ea = 1;
    var_19a94df60dbbe38c = 2;
    var_18ff7658e43bce3b = 3;
    var_3c34b3ea7ee34f5d = getdvarfloat(@"hash_7bf0de1b1d9ca208", 150);
    var_a7fab0fd5ac2f4d1 = getdvarfloat(@"hash_7748ba4302072dca", 150);
    var_69556696b54e51f6 = getdvarfloat(@"hash_25616f5e79c1fb81", 230);
    var_a704907794bc2db5 = 30;
    var_48f2369d220b0952 = 0.9;
    var_91e8b9ab485c6a23 = 30;
    var_97168cfe753f1c25 = [];
    var_c3daefaff1082323 = function_528c7588ba48da94();
    for (lastindex = var_c3daefaff1082323.size - 1; lastindex >= 1; lastindex--) {
        var_cb42ce070ff82453 = var_c3daefaff1082323[lastindex];
        var_d93ac0e132165264 = var_cb42ce070ff82453.var_83a5e1d528b8ba43;
        var_657be1df9e18e72b = var_cb42ce070ff82453.orientation;
        for (index = 0; index < lastindex; index++) {
            var_fef716c724980e99 = var_c3daefaff1082323[index];
            var_577ad0355b2f1a06 = var_fef716c724980e99.var_83a5e1d528b8ba43;
            var_f5fb1a229968f9fd = var_fef716c724980e99.orientation;
            if (abs(var_d93ac0e132165264[2] - var_577ad0355b2f1a06[2]) > var_a704907794bc2db5) {
                continue;
            }
            var_15f7a0a2c8478034 = undefined;
            dist = distance(var_d93ac0e132165264, var_577ad0355b2f1a06);
            if (abs(vectordot(var_657be1df9e18e72b, var_f5fb1a229968f9fd)) >= var_48f2369d220b0952) {
                var_917557ef8589c314 = abs(vectordot(var_657be1df9e18e72b, var_577ad0355b2f1a06 - var_d93ac0e132165264));
                if (var_917557ef8589c314 >= var_91e8b9ab485c6a23) {
                    if (dist <= var_3c34b3ea7ee34f5d) {
                        var_1ac16b7e89c07b85 = physics_raycast(var_d93ac0e132165264 + (0, 0, 30), var_577ad0355b2f1a06 + (0, 0, 30), namespace_2a184fc4902783dc::create_default_contents(), undefined, 0, "physicsquery_all", 0, 1);
                        var_300330130b817bbc = 1;
                        foreach (item in var_1ac16b7e89c07b85) {
                            if (!isdefined(item["scriptable"]) || !(array_contains(var_cb42ce070ff82453.doors, item["scriptable"]) || array_contains(var_fef716c724980e99.doors, item["scriptable"]))) {
                                var_300330130b817bbc = 0;
                                break;
                            }
                        }
                        if (var_300330130b817bbc) {
                            var_15f7a0a2c8478034 = spawnstruct();
                            var_15f7a0a2c8478034.type = var_e6aedea5e48791ea;
                            var_15f7a0a2c8478034.scores = [0:var_917557ef8589c314 * -1];
                        }
                    }
                } else if (dist <= var_a7fab0fd5ac2f4d1) {
                    var_15f7a0a2c8478034 = spawnstruct();
                    var_15f7a0a2c8478034.type = var_19a94df60dbbe38c;
                    var_15f7a0a2c8478034.scores = [0:var_917557ef8589c314 * -1];
                }
            } else if (dist <= var_69556696b54e51f6) {
                var_15f7a0a2c8478034 = spawnstruct();
                var_15f7a0a2c8478034.type = var_18ff7658e43bce3b;
            }
            if (isdefined(var_15f7a0a2c8478034)) {
                var_15f7a0a2c8478034.pairs = [0:var_cb42ce070ff82453, 1:var_fef716c724980e99];
                var_15f7a0a2c8478034.scores = array_insert(function_53c4c53197386572(var_15f7a0a2c8478034.scores, []), dist * -1, 0);
                var_15f7a0a2c8478034.distance = dist;
                var_97168cfe753f1c25[var_97168cfe753f1c25.size] = var_15f7a0a2c8478034;
            }
        }
    }
    var_97168cfe753f1c25 = array_sort_with_func(var_97168cfe753f1c25, &function_c630903df040bc01);
    var_87fe7cdf9d2236e5 = [];
    var_87fe7cdf9d2236e5[var_e6aedea5e48791ea] = "parallel";
    var_87fe7cdf9d2236e5[var_19a94df60dbbe38c] = "collinear";
    var_87fe7cdf9d2236e5[var_18ff7658e43bce3b] = "perpendicular";
    function_9a0a24de119b078a("AdjacentDoubleDoorsInfo", "#time; #type; #positions; #distance");
    for (index = 0; index < var_97168cfe753f1c25.size; index++) {
        var_15f7a0a2c8478034 = var_97168cfe753f1c25[index];
        typestring = var_87fe7cdf9d2236e5[var_15f7a0a2c8478034.type];
        dist = var_15f7a0a2c8478034.distance;
        pos1 = var_15f7a0a2c8478034.pairs[0].var_83a5e1d528b8ba43;
        pos2 = var_15f7a0a2c8478034.pairs[1].var_83a5e1d528b8ba43;
        var_444a5451f436094a = gettime() + "; " + typestring + "; " + pos1 + ", " + pos2 + "; " + dist;
        function_9a0a24de119b078a("AdjacentDoubleDoorsInfo", var_444a5451f436094a);
    }
}

// Namespace namespace_a6c9c44798b37fa6/namespace_4fc54f74105650c0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x186
function private function_528c7588ba48da94() {
    var_c3daefaff1082323 = [];
    doubledoors = function_e10ebb6744a748d8();
    /#
        assert(doubledoors.size % 2 == 0);
    #/
    lastindex = doubledoors.size - 1;
    while (lastindex >= 1) {
        var_6c453aca927698fb = doubledoors[lastindex];
        var_80105f354ee4398b = var_6c453aca927698fb function_d90515f5e17dbc6f();
        targetindex = undefined;
        mindistsq = undefined;
        for (index = 0; index < lastindex; index++) {
            doorpos = doubledoors[index] function_d90515f5e17dbc6f();
            distsq = distancesquared(doorpos, var_80105f354ee4398b);
            if (!isdefined(mindistsq) || distsq < mindistsq) {
                mindistsq = distsq;
                targetindex = index;
            }
        }
        var_d6bb47a1b21d7e1e = doubledoors[targetindex];
        if (targetindex != lastindex - 1) {
            doubledoors[targetindex] = doubledoors[lastindex - 1];
        }
        var_4c79e3a2a493cb22 = spawnstruct();
        var_4c79e3a2a493cb22.doors = [0:var_6c453aca927698fb, 1:var_d6bb47a1b21d7e1e];
        var_731e3a183f1b0964 = var_d6bb47a1b21d7e1e function_d90515f5e17dbc6f();
        var_4c79e3a2a493cb22.var_83a5e1d528b8ba43 = (var_80105f354ee4398b + var_731e3a183f1b0964) / 2;
        var_4c79e3a2a493cb22.orientation = anglestoforward(var_6c453aca927698fb.angles + (0, -90, 0));
        var_c3daefaff1082323[var_c3daefaff1082323.size] = var_4c79e3a2a493cb22;
        lastindex = lastindex - 2;
    }
    return var_c3daefaff1082323;
}

// Namespace namespace_a6c9c44798b37fa6/namespace_4fc54f74105650c0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x756
// Size: 0x7d
function private function_e10ebb6744a748d8() {
    doubledoors = [];
    doors = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "door");
    foreach (door in doors) {
        if (door scriptabledoorisdouble()) {
            doubledoors[doubledoors.size] = door;
        }
    }
    return doubledoors;
}

// Namespace namespace_a6c9c44798b37fa6/namespace_4fc54f74105650c0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0xec
function private function_c630903df040bc01(var_472d4f042b732e8a, var_cb730d03142c3f30) {
    /#
        assert(isdefined(var_472d4f042b732e8a.type) && isdefined(var_472d4f042b732e8a.scores));
    #/
    if (var_472d4f042b732e8a.type != var_cb730d03142c3f30.type) {
        return (var_472d4f042b732e8a.type < var_cb730d03142c3f30.type);
    }
    /#
        assert(var_472d4f042b732e8a.scores.size == var_cb730d03142c3f30.scores.size);
    #/
    for (i = 0; i < var_472d4f042b732e8a.scores.size; i++) {
        if (var_472d4f042b732e8a.scores[i] != var_cb730d03142c3f30.scores[i]) {
            return (var_472d4f042b732e8a.scores[i] > var_cb730d03142c3f30.scores[i]);
        }
    }
    return 1;
}

