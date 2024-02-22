// mwiii decomp prototype
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

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296
// Size: 0x23b
function function_a7dc4a67100b768c(var_c1a3a9cf7d2963b8) {
    /#
        assertex(var_c1a3a9cf7d2963b8.size > 0 && function_1c67ae607a61c6bb(var_c1a3a9cf7d2963b8[0]), "This function expects that the first element in the given 'relevantParameters' is an Activity Instance.");
    #/
    var_e6013eac45290cab = var_c1a3a9cf7d2963b8[0];
    var_9334fa52c33d9f6e = function_4481ee309bf2c75c(var_e6013eac45290cab);
    if (istrue(var_9334fa52c33d9f6e.var_7273458500a1706)) {
        var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(var_e6013eac45290cab);
        if (var_af0662d6485d5d58 == "REV_OB_BIGBOUNTY") {
            var_6608bafe66c4007b = [];
            player = var_9334fa52c33d9f6e.var_b20fac6bac1d6fde;
            var_6d7b56b5a018bf17 = function_b9c4aa88ad97ee68(var_e6013eac45290cab);
            if (isdefined(player) && isdefined(var_6d7b56b5a018bf17) && isdefined(var_6d7b56b5a018bf17.var_9a430cc35610a8ae)) {
                var_626b45032e1892da = function_a4748b32a824c79c(var_e6013eac45290cab);
                var_5d23c1ad1f4411ad = getstructarray(var_626b45032e1892da, "script_noteworthy");
                payload = [0:#"hash_5f9c433bdcfb4e14", 1:player getentitynumber()];
                var_9b0dd04874627a99 = player namespace_ca7b90256548aa40::getsquadmembers();
                foreach (var_9479a9b75a38cd2b in var_5d23c1ad1f4411ad) {
                    if (var_9479a9b75a38cd2b.targetname == "activity_nexus_instance_joiner") {
                        var_8cb27b6c067f0fe0 = spawnscriptable(var_6d7b56b5a018bf17.var_9a430cc35610a8ae, var_9479a9b75a38cd2b.origin, var_9479a9b75a38cd2b.angles, undefined, payload);
                        var_6608bafe66c4007b[var_6608bafe66c4007b.size] = var_8cb27b6c067f0fe0;
                        namespace_68dc261109a9503f::function_62b3e2a4e6e15396(var_e6013eac45290cab, var_8cb27b6c067f0fe0, 1);
                        foreach (var_2fe316433061a45f in level.players) {
                            if (!array_contains(var_9b0dd04874627a99, var_2fe316433061a45f)) {
                                var_8cb27b6c067f0fe0 disablescriptableplayeruse(var_2fe316433061a45f);
                            }
                        }
                    }
                }
                return var_6608bafe66c4007b;
            }
        }
    }
    return namespace_d886885225a713a7::function_7945819e2d7fc956(var_c1a3a9cf7d2963b8);
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9
// Size: 0x32
function function_f805f042fa2f4b2(var_7273458500a1706) {
    var_eb0d08149de48f60 = function_ccb42947700f2741();
    var_eb0d08149de48f60.var_7273458500a1706 = function_53c4c53197386572(var_7273458500a1706, 0);
    return var_eb0d08149de48f60;
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0x3a
function function_6e345470b71653a4(var_e6013eac45290cab, params) {
    /#
        assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    #/
    return function_511be8bcaede8b52(var_e6013eac45290cab) == "Objective";
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x555
// Size: 0x3a
function function_a74910a9002633d0(var_e6013eac45290cab, params) {
    /#
        assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    #/
    return function_511be8bcaede8b52(var_e6013eac45290cab) == "Activity";
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x597
// Size: 0x44
function function_c37214cf3d029093(var_e6013eac45290cab, params) {
    /#
        assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    #/
    activity_type = params[0];
    return function_de53ed8e35d0ed7a(var_e6013eac45290cab) != activity_type;
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x3a
function function_1de0e40ac4e9356f(var_e6013eac45290cab, params) {
    /#
        assertex(!isdefined(params) || params.size != 0, "This conditional container function was not expecting the params parameter to be defined or have anything inside of it. That data will be ignored in this function.");
    #/
    return function_511be8bcaede8b52(var_e6013eac45290cab) == "Contract";
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625
// Size: 0x73
function function_4a1651413519d392(var_e6013eac45290cab, params) {
    /#
        assertex(params.size == 2 && isdefined(params[0]), "The first param should the origin point and second param should be distance");
    #/
    var_897f994b43c431aa = params[0];
    min_distance = params[1];
    var_43697de9671bb892 = namespace_68dc261109a9503f::function_8988a4c89289d7f4(var_e6013eac45290cab);
    var_3141a9bf67c68677 = distance(var_897f994b43c431aa, var_43697de9671bb892);
    return var_3141a9bf67c68677 >= min_distance;
}

// Namespace namespace_8761bd55318677aa/namespace_27def95c6086c32a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0
// Size: 0x83
function function_133d3f81f9f3ab58(var_e6013eac45290cab, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter should be the point");
    #/
    point = params[0];
    region = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(point);
    var_43697de9671bb892 = namespace_68dc261109a9503f::function_8988a4c89289d7f4(var_e6013eac45290cab);
    var_39e0567fdb0638b4 = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(var_43697de9671bb892);
    if (isdefined(region) && isdefined(var_39e0567fdb0638b4)) {
        return (region == var_39e0567fdb0638b4);
    }
    return 0;
}

