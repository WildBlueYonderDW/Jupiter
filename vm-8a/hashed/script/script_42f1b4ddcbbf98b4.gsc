#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_64351208cb856df9;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_58be75c518bf0d40;
#using script_220d0eb95a8fab7d;
#using script_638d701d263ee1ed;

#namespace namespace_8761bd55318677aa;

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296
// Size: 0x23a
function function_a7dc4a67100b768c(relevantparameters) {
    assertex(relevantparameters.size > 0 && function_1c67ae607a61c6bb(relevantparameters[0]), "This function expects that the first element in the given 'relevantParameters' is an Activity Instance.");
    activityinstance = relevantparameters[0];
    var_9334fa52c33d9f6e = function_4481ee309bf2c75c(activityinstance);
    if (istrue(var_9334fa52c33d9f6e.var_7273458500a1706)) {
        activitytype = function_de53ed8e35d0ed7a(activityinstance);
        if (activitytype == "REV_OB_BIGBOUNTY") {
            var_6608bafe66c4007b = [];
            player = var_9334fa52c33d9f6e.var_b20fac6bac1d6fde;
            customproperties = function_b9c4aa88ad97ee68(activityinstance);
            if (isdefined(player) && isdefined(customproperties) && isdefined(customproperties.var_9a430cc35610a8ae)) {
                varianttag = function_a4748b32a824c79c(activityinstance);
                var_5d23c1ad1f4411ad = getstructarray(varianttag, "script_noteworthy");
                payload = [#"teamselect", player getentitynumber()];
                a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
                foreach (scriptstruct in var_5d23c1ad1f4411ad) {
                    if (scriptstruct.targetname == "activity_nexus_instance_joiner") {
                        var_8cb27b6c067f0fe0 = spawnscriptable(customproperties.var_9a430cc35610a8ae, scriptstruct.origin, scriptstruct.angles, undefined, payload);
                        var_6608bafe66c4007b[var_6608bafe66c4007b.size] = var_8cb27b6c067f0fe0;
                        namespace_68dc261109a9503f::function_62b3e2a4e6e15396(activityinstance, var_8cb27b6c067f0fe0, 1);
                        foreach (unknown_player in level.players) {
                            if (!array_contains(a_squad, unknown_player)) {
                                var_8cb27b6c067f0fe0 disablescriptableplayeruse(unknown_player);
                            }
                        }
                    }
                }
                return var_6608bafe66c4007b;
            }
        }
    }
    return namespace_d886885225a713a7::function_7945819e2d7fc956(relevantparameters);
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9
// Size: 0x31
function function_f805f042fa2f4b2(var_7273458500a1706) {
    var_eb0d08149de48f60 = function_ccb42947700f2741();
    var_eb0d08149de48f60.var_7273458500a1706 = default_to(var_7273458500a1706, 0);
    return var_eb0d08149de48f60;
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0x39
function function_6e345470b71653a4(activityinstance, params) {
    assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    return function_511be8bcaede8b52(activityinstance) == "Objective";
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x555
// Size: 0x39
function function_a74910a9002633d0(activityinstance, params) {
    assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    return function_511be8bcaede8b52(activityinstance) == "Activity";
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x597
// Size: 0x43
function function_c37214cf3d029093(activityinstance, params) {
    assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    activity_type = params[0];
    return function_de53ed8e35d0ed7a(activityinstance) != activity_type;
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x39
function function_1de0e40ac4e9356f(activityinstance, params) {
    assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    return function_511be8bcaede8b52(activityinstance) == "Contract";
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625
// Size: 0x72
function function_4a1651413519d392(activityinstance, params) {
    assertex(params.size == 2 && isdefined(params[0]), "The first param should the origin point and second param should be distance");
    origin_point = params[0];
    min_distance = params[1];
    activityorigin = namespace_68dc261109a9503f::function_8988a4c89289d7f4(activityinstance);
    actual_distance = distance(origin_point, activityorigin);
    return actual_distance >= min_distance;
}

// Namespace namespace_8761bd55318677aa / namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0
// Size: 0x82
function function_133d3f81f9f3ab58(activityinstance, params) {
    assertex(params.size == 1 && isdefined(params[0]), "The first parameter should be the point");
    point = params[0];
    region = namespace_4df2ab39b0e96ec7::get_region(point);
    activityorigin = namespace_68dc261109a9503f::function_8988a4c89289d7f4(activityinstance);
    activityregion = namespace_4df2ab39b0e96ec7::get_region(activityorigin);
    if (isdefined(region) && isdefined(activityregion)) {
        return (region == activityregion);
    }
    return false;
}

