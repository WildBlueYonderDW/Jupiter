// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_54f6d121e91434f8;
#using script_3e34d236a84cfd96;
#using script_64351208cb856df9;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_689f8728d45cb7e6;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_5753ba9c28794a65;
#using script_655983f8cdbe29a9;
#using script_5d8202968463a21d;
#using script_39d11000e476a42a;
#using script_6617e2f2bb62b52b;
#using script_645acc6422636f9f;
#using script_7eab314a5c18ea10;
#using script_42f1b4ddcbbf98b4;
#using script_4fa7e9e11630166c;
#using scripts\common\create_script_utility.gsc;
#using script_7e41e37180e554f;

#namespace namespace_609d2ee77dae3d8c;

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b1
// Size: 0x15a
function function_f54ee3a0c5799ddb() {
    function_89929df8c53338f7();
    function_d79126b3e1170484();
    function_6a7daea470efc1d9();
    var_186eafd5a207b951 = function_a5424c44da084d6e();
    addcondition(var_186eafd5a207b951, &function_17b1321ab95e72c1, []);
    function_edb2f945bfe8e85e(0, &function_82cc4ac452ec042d);
    function_edb2f945bfe8e85e(1, &function_8a073180260101c8);
    function_edb2f945bfe8e85e(4, &function_1b8c1eb855188865);
    function_edb2f945bfe8e85e(2, &function_1dfeec7e9015cfd0);
    function_edb2f945bfe8e85e(3, &function_26a02c0ecf9a374);
    function_edb2f945bfe8e85e(7, &namespace_f0d9097b252e530b::function_47e23924dd56365);
    function_edb2f945bfe8e85e(9, &namespace_234722f5b7566015::function_69406b22706f2162);
    function_edb2f945bfe8e85e(10, &namespace_234722f5b7566015::function_aae7d234bf6eaaa9);
    function_edb2f945bfe8e85e(8, &namespace_8761bd55318677aa::function_a7dc4a67100b768c);
    function_edb2f945bfe8e85e(11, &namespace_22ae363c8e287c38::function_c56624984c6cfe44);
    function_edb2f945bfe8e85e(13, &function_e14da78537c60580);
    level.activities.defaultfunctions[5] = &namespace_234722f5b7566015::function_b64c78402ddc2359;
    level.activities.defaultfunctions[7] = &namespace_234722f5b7566015::function_9302d6fba4ac736a;
    level.activities.defaultfunctions[8] = &namespace_2554c2c2cdfe946a::function_83d789bbe0f2a395;
    level.activities.var_69014df291d28134 = function_5d0906f3f4471951();
    level callback::add("zip_teleport_player", &function_faed602bc38691c0);
    /#
        namespace_cdbd5ed319b707ee::function_3424378c10c301fb();
    #/
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x7f
function function_82cc4ac452ec042d(relevantparameters) {
    activitytype = relevantparameters[0];
    var_8807a0ecdc518571 = level.activities.types[activitytype];
    var_8807a0ecdc518571.commonfunctions[5] = function_35c9943414b3e6ed(5);
    var_8807a0ecdc518571.commonfunctions[7] = function_35c9943414b3e6ed(7);
    var_8807a0ecdc518571.commonfunctions[8] = function_35c9943414b3e6ed(8);
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698
// Size: 0xaa
function function_e757a367525dc6ff(activitytype, varianttag, var_fb6a27936e71b3eb, var_9334fa52c33d9f6e) {
    var_50afda8545de94eb = undefined;
    if (isdefined(var_fb6a27936e71b3eb)) {
        var_7ee16b21e907099a = [[ var_fb6a27936e71b3eb ]]();
        var_50afda8545de94eb = var_7ee16b21e907099a[varianttag];
    }
    if (!isdefined(level.activities.definitions[varianttag]) && isdefined(var_50afda8545de94eb)) {
        scriptbundlename = var_50afda8545de94eb.scriptbundle;
        if (!isstring(scriptbundlename) || scriptbundlename == "") {
        }
        function_d9c76daf389fd99c(scriptbundlename, activitytype, varianttag, var_fb6a27936e71b3eb);
    }
    return function_67f4d8928c638abb(activitytype, varianttag, undefined, var_9334fa52c33d9f6e);
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a
// Size: 0x26f
function function_8a073180260101c8(relevantparameters) {
    activityinstance = relevantparameters[0];
    activityinstance endon("activity_ended");
    activityinstance endon("instance_destroyed");
    activitydefinition = function_4188e118731a30f4(activityinstance);
    if (isdefined(activitydefinition.var_fb6a27936e71b3eb)) {
        function_55b5ea1ea4a8a4e9(activityinstance, activitydefinition.var_fb6a27936e71b3eb);
    }
    setupinstance(relevantparameters);
    activitytype = function_de53ed8e35d0ed7a(activityinstance);
    var_cf2f27d96ea6dd79 = activitytype == "REV_OB_MERC_CAMP" || activitytype == "REV_OB_MERC_STRONGHOLD" || activitytype == "REV_OB_BIGBOUNTY";
    if (var_cf2f27d96ea6dd79) {
        var_28ae2abcf7206747 = 1;
        var_85b84f8afbfe2e11 = undefined;
        if (activitytype == "REV_OB_MERC_CAMP") {
            var_28ae2abcf7206747 = getdvarfloat(@"hash_bd9b80571f194fab", 1);
        } else if (activitytype == "REV_OB_MERC_STRONGHOLD") {
            var_28ae2abcf7206747 = getdvarfloat(@"hash_8ce7dd170a5f2042", 1);
            var_85b84f8afbfe2e11 = getdvarint(@"hash_8bccf19deedff048", 1350);
        } else if (activitytype == "REV_OB_BIGBOUNTY") {
            var_85b84f8afbfe2e11 = getdvarint(@"hash_2b91ae164fe0f454", 1250);
        } else {
            var_32b4fd8ffb8b2d4e = 0;
        }
        if (function_1888d1b2aeeda25(activityinstance, "Ambient_AI_Exclusion_Zone")) {
            var_f8b1af8995e3d601 = function_5bbdc39a533d9d57(activityinstance, "Ambient_AI_Exclusion_Zone");
            function_99ea7dc018941548(activityinstance, "Ambient_AI_Exclusion_Zone");
            foreach (var_50d4637260359a88 in var_f8b1af8995e3d601) {
                origin = function_37c1f31d2434f628(var_50d4637260359a88);
                scaledradius = function_2403f7fe5d40cecc(var_50d4637260359a88) * var_28ae2abcf7206747;
                if (isdefined(var_85b84f8afbfe2e11) && isint(var_85b84f8afbfe2e11)) {
                    if (scaledradius > var_85b84f8afbfe2e11) {
                        scaledradius = var_85b84f8afbfe2e11;
                    }
                }
                function_51ad14107ca158fb(activityinstance, "Ambient_AI_Exclusion_Zone", origin, scaledradius);
            }
        }
    }
    if (namespace_27def95c6086c32a::function_1de0e40ac4e9356f(activityinstance)) {
        activitytype = function_de53ed8e35d0ed7a(activityinstance);
        activityinstance namespace_262d6474998a2356::function_61cd287166c3f695(activitytype);
    } else {
        addcondition(activityinstance.participationconditions, &function_17b1321ab95e72c1, []);
    }
    if (function_e2fcc8add20861a2(activityinstance) == "InstanceBegin") {
        activityinstance thread function_c19b2c80e7bdf71c();
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c0
// Size: 0x33
function function_1b8c1eb855188865(relevantparameters) {
    activityinstance = relevantparameters[0];
    if (function_cf98f968df6ba1ff(activityinstance) == "InstanceEnd") {
        activityinstance thread function_b4d20e1455c1aa71();
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fa
// Size: 0x33
function function_1dfeec7e9015cfd0(relevantparameters) {
    activityinstance = relevantparameters[0];
    if (function_e2fcc8add20861a2(activityinstance) == "ActivityBegin") {
        activityinstance thread function_c19b2c80e7bdf71c();
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa34
// Size: 0x33
function function_26a02c0ecf9a374(relevantparameters) {
    activityinstance = relevantparameters[0];
    if (function_cf98f968df6ba1ff(activityinstance) == "ActivityEnd") {
        activityinstance thread function_b4d20e1455c1aa71();
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6e
// Size: 0xb2
function function_447c6ab4bea16b52(activityclass, activitytype, initfunction, var_d035b0ef2ba6d096, var_4c0351dd90f219ee) {
    function_8e0a16f0ca8e45e9(activitytype, initfunction);
    if (function_b13928c589ec4254(activityclass, activitytype)) {
        function_1b2b8ed00ba454f6(activityclass, activitytype, var_d035b0ef2ba6d096, var_4c0351dd90f219ee);
        return;
    }
    var_69014df291d28134 = function_50610eefaa499907();
    var_621e8faec864f9fb = var_69014df291d28134.var_621e8faec864f9fb[activityclass];
    if (isdefined(var_621e8faec864f9fb)) {
        [[ var_621e8faec864f9fb ]](var_d035b0ef2ba6d096, undefined, &function_d21df4d7c94286bb, undefined, undefined);
    } else {
        /#
            assertmsg("The given activityClass type ( " + activityclass + " ) is not recognized. Currently we only allow Activities and Objectives.");
        #/
    }
    function_7f5a40d6894ebb8f(activityclass, activitytype, var_d035b0ef2ba6d096, var_4c0351dd90f219ee);
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb27
// Size: 0x7b
function function_1b2b8ed00ba454f6(activityclass, activitytype, var_d035b0ef2ba6d096, var_4c0351dd90f219ee) {
    var_69014df291d28134 = function_50610eefaa499907();
    var_f632ded78bf99276 = var_69014df291d28134.var_f632ded78bf99276[activityclass];
    if (isdefined(var_f632ded78bf99276)) {
        [[ var_f632ded78bf99276 ]](var_d035b0ef2ba6d096);
    } else {
        /#
            assertmsg("The given activityClass type ( " + activityclass + " ) is not recognized. Currently we only allow Activities and Objectives.");
        #/
    }
    function_7f5a40d6894ebb8f(activityclass, activitytype, var_d035b0ef2ba6d096, var_4c0351dd90f219ee);
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xba9
// Size: 0x139
function private function_7f5a40d6894ebb8f(activityclass, activitytype, var_d035b0ef2ba6d096, var_4c0351dd90f219ee) {
    /#
        assertex(isfunction(var_d035b0ef2ba6d096), "The Create Script 'GetInfo' function passed in is either undefined or not a function.");
    #/
    var_3ea079d94f16a7fb = [[ var_d035b0ef2ba6d096 ]]();
    /#
        assertex(isfunction(var_3ea079d94f16a7fb.var_ad1dcd56d202e9ac), "The Create Script 'getActivityInstanceMetaData' function passed is undefined or invalid.");
    #/
    var_acbc16b82771fd3e = [[ var_3ea079d94f16a7fb.var_ad1dcd56d202e9ac ]]();
    var_4c0351dd90f219ee = default_to(var_4c0351dd90f219ee, []);
    foreach (varianttag, var_2a5a95af69492377 in var_acbc16b82771fd3e) {
        /#
            if (!isdefined(var_2a5a95af69492377.locationorigin) || !isdefined(var_2a5a95af69492377.locationradius)) {
                /#
                    assertmsg("startup" + varianttag + "<unknown string>");
                #/
            }
        #/
        var_482f7e654ce76f9f = array_find(var_4c0351dd90f219ee, varianttag);
        var_eabcdb2306ff31c7 = !isdefined(var_482f7e654ce76f9f);
        if (var_eabcdb2306ff31c7) {
            function_eae26710b2a5a85b(activityclass, activitytype, varianttag);
        }
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xce9
// Size: 0x44
function private function_d9c76daf389fd99c(associatedscriptbundlename, activitytype, varianttag, var_fb6a27936e71b3eb) {
    activitydefinition = function_86f446036c3c25a3(associatedscriptbundlename, varianttag);
    activitydefinition.var_fb6a27936e71b3eb = var_fb6a27936e71b3eb;
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd34
// Size: 0x279
function private function_55b5ea1ea4a8a4e9(activityinstance, var_fb6a27936e71b3eb) {
    activitytype = function_de53ed8e35d0ed7a(activityinstance);
    varianttag = function_a4748b32a824c79c(activityinstance);
    var_50afda8545de94eb = undefined;
    if (isdefined(var_fb6a27936e71b3eb)) {
        var_7ee16b21e907099a = [[ var_fb6a27936e71b3eb ]]();
        var_50afda8545de94eb = var_7ee16b21e907099a[varianttag];
    }
    /#
        if (!isdefined(var_50afda8545de94eb.scriptstructorigin) || !isdefined(var_50afda8545de94eb.scriptstructoriginoffset)) {
            /#
                assertmsg("<unknown string>" + activitytype + "<unknown string>" + varianttag + "<unknown string>");
            #/
        }
    #/
    var_30e22f861786af77 = spawnstruct();
    var_30e22f861786af77.origin = var_50afda8545de94eb.scriptstructorigin;
    var_30e22f861786af77.angles = (0, 0, 0);
    scripts/common/create_script_utility::translate_position_with_offset_data(var_50afda8545de94eb.cf, var_30e22f861786af77, var_50afda8545de94eb.scriptstructoriginoffset, (0, 0, 0));
    function_51ad14107ca158fb(activityinstance, "Center_Spatial_Zone", var_30e22f861786af77.origin);
    if (isdefined(var_50afda8545de94eb.locationorigin)) {
        function_430113b2f1e49ed1(var_50afda8545de94eb, var_50afda8545de94eb.cf, var_50afda8545de94eb.scriptstructoriginoffset);
        for (sphereindex = 0; sphereindex < var_50afda8545de94eb.locationorigin.size; sphereindex++) {
            origin = var_50afda8545de94eb.locationorigin[sphereindex];
            radius = var_50afda8545de94eb.locationradius[sphereindex];
            function_51ad14107ca158fb(activityinstance, "OB_Spacer_Spatial_Zone", origin, radius);
        }
    }
    if (isdefined(var_50afda8545de94eb.var_5b156d1fa702b37f)) {
        foreach (spatialzonename, var_1a06320fdd852313 in var_50afda8545de94eb.var_5b156d1fa702b37f) {
            function_cd7cc22590239790(activityinstance, spatialzonename, var_50afda8545de94eb, var_1a06320fdd852313);
        }
        return;
    }
    function_cd7cc22590239790(activityinstance, "Awareness_Zone", var_50afda8545de94eb, var_50afda8545de94eb.participationradius);
    function_cd7cc22590239790(activityinstance, "Proximity_Join_Zone", var_50afda8545de94eb, var_50afda8545de94eb.joinradius);
    function_cd7cc22590239790(activityinstance, "Ambient_AI_Exclusion_Zone", var_50afda8545de94eb, var_50afda8545de94eb.exclusionradius);
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb4
// Size: 0x43
function private function_175770c264b4ed5b(var_ec77238be57c1d5c) {
    if (var_ec77238be57c1d5c == "participation_radius") {
        return "Awareness_Zone";
    } else if (var_ec77238be57c1d5c == "join_radius") {
        return "Proximity_Join_Zone";
    } else if (var_ec77238be57c1d5c == "ai_exclusion_radius") {
        return "Ambient_AI_Exclusion_Zone";
    }
    return var_ec77238be57c1d5c;
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfff
// Size: 0x151
function private function_cd7cc22590239790(activitydefinition, spatialzonename, var_eda1e1681182223b, var_133e05516b126906) {
    spatialzonename = function_175770c264b4ed5b(spatialzonename);
    var_a845183e758f6b9e = function_cd2417904b1a0cf1(activitydefinition, spatialzonename);
    var_131a90cd9432b2de = !isdefined(var_a845183e758f6b9e) || istrue(var_a845183e758f6b9e.var_6f7fe78e2cfc9f97);
    var_760cdd304a3dfba3 = isdefined(var_133e05516b126906);
    if (var_760cdd304a3dfba3 && var_131a90cd9432b2de) {
        function_430113b2f1e49ed1(var_133e05516b126906, var_eda1e1681182223b.cf, var_eda1e1681182223b.scriptstructoriginoffset);
        if (isdefined(var_a845183e758f6b9e) && istrue(var_a845183e758f6b9e.var_b5cd0e17510fe594)) {
            function_9a33c4470751069d(activitydefinition, spatialzonename);
        } else {
            function_6636b8cd03ed660e(activitydefinition, spatialzonename);
        }
        for (sphereindex = 0; sphereindex < var_133e05516b126906.locationorigin.size; sphereindex++) {
            origin = var_133e05516b126906.locationorigin[sphereindex];
            radius = var_133e05516b126906.locationradius[sphereindex];
            if (isdefined(var_a845183e758f6b9e)) {
                ignoreheight = function_b3a183201cf67100(var_a845183e758f6b9e);
                function_51ad14107ca158fb(activitydefinition, spatialzonename, origin, radius, ignoreheight);
                continue;
            }
            function_51ad14107ca158fb(activitydefinition, spatialzonename, origin, radius);
        }
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1157
// Size: 0xb1
function private function_430113b2f1e49ed1(var_ced62137574fbb9e, var_c0e98e89e6cd9948, centeroffset) {
    for (originindex = 0; originindex < var_ced62137574fbb9e.locationorigin.size; originindex++) {
        center = spawnstruct();
        center.origin = var_ced62137574fbb9e.locationorigin[originindex];
        center.angles = (0, 0, 0);
        scripts/common/create_script_utility::translate_position_with_offset_data(var_c0e98e89e6cd9948, center, centeroffset, (0, 0, 0));
        var_ced62137574fbb9e.locationorigin[originindex] = center.origin;
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120f
// Size: 0x98
function private function_d21df4d7c94286bb(var_fb6a27936e71b3eb, params) {
    /#
        assertex(isarray(params) && params.size >= 3 && params.size <= 4, "Invalid number of parameters passed into this function. Expects 3 or 4 parameters");
    #/
    activitytype = params[0];
    varianttag = params[1];
    activityclass = params[2];
    var_9334fa52c33d9f6e = params[3];
    activityinstance = namespace_98c7625238714297::function_e757a367525dc6ff(activitytype, varianttag, var_fb6a27936e71b3eb, var_9334fa52c33d9f6e);
    activityinstance thread function_86e100b8e9ebf368(activityclass, activitytype, varianttag);
    return activityinstance;
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12af
// Size: 0x2e
function private function_86e100b8e9ebf368(activityclass, activitytype, varianttag) {
    self waittill("instance_destroyed");
    function_ef92878cd2be9387(activityclass, activitytype, varianttag);
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e4
// Size: 0x99
function private function_eae26710b2a5a85b(activityclass, activitytype, varianttag, regionoverride, locationoverride, sizeoverride) {
    var_69014df291d28134 = function_50610eefaa499907();
    var_d3ccb74fedb2c618 = var_69014df291d28134.var_d3ccb74fedb2c618[activityclass];
    if (isdefined(var_d3ccb74fedb2c618)) {
        [[ var_d3ccb74fedb2c618 ]](activitytype, varianttag, [activitytype, varianttag, activityclass], regionoverride, locationoverride, sizeoverride);
        return;
    }
    /#
        assertmsg("The given activityClass type ( " + activityclass + " ) is not recognized. Currently we only allow Activities and Objectives.");
    #/
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1384
// Size: 0xed
function private function_5d0906f3f4471951() {
    var_69014df291d28134 = spawnstruct();
    var_69014df291d28134.var_621e8faec864f9fb = [];
    var_69014df291d28134.var_caaa4a151959d8f0 = [];
    var_69014df291d28134.var_f632ded78bf99276 = [];
    var_69014df291d28134.var_d3ccb74fedb2c618 = [];
    function_c8b1067f34c4ca53(var_69014df291d28134, "activity", &function_427cb6a2999148d4, &function_dd08f7bbc7374382, &function_b000c5869d9963b, &function_45e4da7d3290c92e);
    function_c8b1067f34c4ca53(var_69014df291d28134, "objective", &function_a3b6ebf2f2846ed0, &function_4d6dac99a67dedd6, &function_28ac67fd6f2cfa07, &function_4846ba8883b7839a);
    function_c8b1067f34c4ca53(var_69014df291d28134, "contract", &function_45eadbd1e9e2dc3b, &function_3e8da9e83064cf45, &function_3684f1c1e8a961f8, &function_7d0eeacebc6154b7);
    function_c8b1067f34c4ca53(var_69014df291d28134, "global", &function_16ab635aed793576, &function_950b6b34320b4740, &function_9d145151be8c6b2d, &function_d3c3ba1486889678);
    function_c8b1067f34c4ca53(var_69014df291d28134, "startup", &function_9e6c7813519c70d2, &function_4d5f2ad6e3e7fa3c, &function_e0817a8472617b61, &function_845c6bd78f5ef04);
    return var_69014df291d28134;
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1479
// Size: 0x70
function private function_c8b1067f34c4ca53(var_69014df291d28134, activityclass, var_621e8faec864f9fb, var_caaa4a151959d8f0, var_f632ded78bf99276, var_d3ccb74fedb2c618) {
    var_69014df291d28134.var_621e8faec864f9fb[activityclass] = var_621e8faec864f9fb;
    var_69014df291d28134.var_caaa4a151959d8f0[activityclass] = var_caaa4a151959d8f0;
    var_69014df291d28134.var_f632ded78bf99276[activityclass] = var_f632ded78bf99276;
    var_69014df291d28134.var_d3ccb74fedb2c618[activityclass] = var_d3ccb74fedb2c618;
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14f0
// Size: 0x16
function private function_50610eefaa499907() {
    return level.activities.var_69014df291d28134;
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x150e
// Size: 0x121
function private function_faed602bc38691c0(position) {
    if (!isdefined(position) || !isdefined(position.origin)) {
        /#
            assertmsg("The Zip Door Used callback passed in invalid data. The Activity Nexus can't wake up nearby activities from hibernation.");
        #/
        return;
    }
    var_eabb0ff6a74bec88 = position.origin;
    nearbycircleradius = 10000;
    var_5c443b9010a16440 = 5;
    var_b4f511688bac4671 = 0;
    foreach (instance in level.activities.instances) {
        if (!isdefined(instance)) {
            continue;
        }
        instanceorigin = function_8988a4c89289d7f4(instance);
        var_c6d8fc2ba285139e = distance2dsquared(var_eabb0ff6a74bec88, instanceorigin);
        var_415b3a44f96761a8 = nearbycircleradius * nearbycircleradius;
        if (var_c6d8fc2ba285139e <= var_415b3a44f96761a8) {
            function_e81ff3302ce5788b(instance, 0);
        }
        var_b4f511688bac4671++;
        if (var_b4f511688bac4671 >= var_5c443b9010a16440) {
            waitframe();
            var_b4f511688bac4671 = 0;
        }
    }
}

// Namespace namespace_609d2ee77dae3d8c / namespace_98c7625238714297
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1636
// Size: 0x77
function private function_e14da78537c60580(relevantparameters) {
    /#
        assertex(isarray(relevantparameters) && relevantparameters.size == 2, "This Nexus Functionality Override requires two Parameters to be passed in.");
    #/
    var_d9915f8020fff325 = relevantparameters[0];
    activityinstance = relevantparameters[1];
    if (function_9cf7afd6797ae365(var_d9915f8020fff325)) {
        broadcastinstance = var_d9915f8020fff325;
        addcondition(var_d9915f8020fff325, &function_30006181a99fb008, [broadcastinstance, activityinstance]);
    }
}

