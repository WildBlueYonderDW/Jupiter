#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\asm.gsc;

#namespace animselector;

// Namespace animselector / scripts\anim\animselector
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65e
// Size: 0x2c4
function getanimselectorfilenames() {
    var_55be9ad4f064aa9 = [];
    if (utility::iscp()) {
        var_55be9ad4f064aa9["traverse_warp_up"] = [[0, "animselectortables/soldier/soldier_traverse_warp_up.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_up.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_up.csv"]];
        var_55be9ad4f064aa9["traverse_warp_down"] = [[0, "animselectortables/soldier/soldier_traverse_warp_down.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_down.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_down.csv"]];
        var_55be9ad4f064aa9["traverse_warp_over"] = [[0, "animselectortables/soldier/soldier_traverse_warp_over.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_over.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_over.csv"]];
        var_55be9ad4f064aa9["traverse_warp_across"] = [[0, "animselectortables/soldier/soldier_traverse_warp_across.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_across.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_across.csv"]];
        var_55be9ad4f064aa9["traverse_warp_external"] = [[0, "animselectortables/soldier/soldier_traverse_warp_external.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_external.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_external.csv"]];
    } else {
        var_55be9ad4f064aa9["traverse_warp_up"] = [[0, "animselectortables/soldier/soldier_traverse_warp_up.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_up.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_up.csv"]];
        var_55be9ad4f064aa9["traverse_warp_down"] = [[0, "animselectortables/soldier/soldier_traverse_warp_down.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_down.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_down.csv"]];
        var_55be9ad4f064aa9["traverse_warp_over"] = [[0, "animselectortables/soldier/soldier_traverse_warp_over.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_over.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_over.csv"]];
        var_55be9ad4f064aa9["traverse_warp_across"] = [[0, "animselectortables/soldier/soldier_traverse_warp_across.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_across.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_across.csv"]];
        var_55be9ad4f064aa9["traverse_warp_external"] = [[0, "animselectortables/soldier/soldier_traverse_warp_external.csv"], [1, "animselectortables/civilian/civilian_traverse_warp_external.csv"], [2, "animselectortables/bomber/bomber_traverse_warp_external.csv"]];
    }
    return var_55be9ad4f064aa9;
}

// Namespace animselector / scripts\anim\animselector
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92b
// Size: 0x45d
function init() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") != 0 || getdvarint(@"hash_add5b80d30e0737a") != 0) {
        return;
    }
    anim.animselectorfeaturetable = [];
    anim.animselectorfeaturetable["min_height"] = ["height", 0];
    anim.animselectorfeaturetable["max_height"] = ["height", 1];
    anim.animselectorfeaturetable["min_arrival_yaw"] = ["arrival_yaw", 0];
    anim.animselectorfeaturetable["max_arrival_yaw"] = ["arrival_yaw", 1];
    anim.animselectorfeaturetable["min_length"] = ["length", 0];
    anim.animselectorfeaturetable["max_length"] = ["length", 1];
    anim.animselectorfeaturetable["min_drop_height"] = ["drop_height", 0];
    anim.animselectorfeaturetable["max_drop_height"] = ["drop_height", 1];
    anim.animselectorfeaturetable["min_speed"] = ["speed", 0];
    anim.animselectorfeaturetable["max_speed"] = ["speed", 1];
    anim.animselector = [];
    var_55be9ad4f064aa9 = getanimselectorfilenames();
    foreach (statename, filenames in var_55be9ad4f064aa9) {
        foreach (traverser, filename in filenames) {
            anim.animselector[statename][traverser] = spawnstruct();
            anim.animselector[statename][traverser].aliases = [];
            anim.animselector[statename][traverser].features = [];
            anim.animselector[statename][traverser].values = [];
            var_ef6dae508d785188 = tablelookuprownum(filename[1], 0, "__END__");
            assertex(isdefined(var_ef6dae508d785188) && var_ef6dae508d785188 != -1, "<dev string:x1c>" + filename[1] + "<dev string:x42>");
            var_ef6dae508d785188 -= 1;
            assertex(var_ef6dae508d785188 > 0, "<dev string:x6c>");
            for (i = 0; i < var_ef6dae508d785188; i++) {
                alias = tablelookupbyrow(filename[1], i + 1, 0);
                anim.animselector[statename][traverser].aliases[i] = alias;
            }
            num_features = undefined;
            for (i = 0; i < 50; i++) {
                feature = tablelookupbyrow(filename[1], 0, i + 1);
                if (feature == "__END__" || feature == "") {
                    num_features = i;
                    break;
                }
                anim.animselector[statename][traverser].features[i] = feature;
            }
            assertex(isdefined(num_features), "<dev string:xb7>");
            assertex(num_features > 0, "<dev string:xff>");
            for (i = 0; i < var_ef6dae508d785188; i++) {
                for (j = 0; j < num_features; j++) {
                    alias = anim.animselector[statename][traverser].aliases[i];
                    feature = anim.animselector[statename][traverser].features[j];
                    val = tablelookupbyrow(filename[1], i + 1, j + 1);
                    if (val == "") {
                        val = undefined;
                    } else {
                        val = float(val);
                    }
                    anim.animselector[statename][traverser].values[alias][feature] = val;
                }
            }
        }
    }
}

// Namespace animselector / scripts\anim\animselector
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd90
// Size: 0xc9
function checkfeaturevalue(val, feature, var_e9db8fc3741a7e52) {
    assertex(isdefined(anim.animselectorfeaturetable), "<dev string:x14d>");
    assertex(isdefined(anim.animselectorfeaturetable[feature]), "<dev string:x17f>" + feature + "<dev string:x19a>");
    featurename = anim.animselectorfeaturetable[feature][0];
    featurereq = anim.animselectorfeaturetable[feature][1];
    featureval = var_e9db8fc3741a7e52[featurename];
    if (!isdefined(featureval)) {
        return 1;
    }
    if (featurereq == 0) {
        return (featureval >= val);
    } else if (featurereq == 1) {
        return (featureval <= val);
    }
    assertmsg("<dev string:x1c9>" + feature + "<dev string:x1e5>");
}

/#

    // Namespace animselector / scripts\anim\animselector
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xe61
    // Size: 0xb4
    function function_99322e10827a8683(statename, var_e9db8fc3741a7e52) {
        warningstring = "<dev string:x20b>" + self.animsetname + "<dev string:x237>" + statename + "<dev string:x244>";
        foreach (key, value in var_e9db8fc3741a7e52) {
            warningstring = warningstring + key + "<dev string:x255>" + value + "<dev string:x25b>";
        }
        warningstring = warningstring + "<dev string:x261>" + self.origin + "<dev string:x25b>";
        println(warningstring);
    }

#/

// Namespace animselector / scripts\anim\animselector
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf1d
// Size: 0x1cc
function selectanim(statename, var_e9db8fc3741a7e52, var_1b240bbf89180b65) {
    assert(isdefined(anim.animselector[statename]));
    assert(isdefined(var_1b240bbf89180b65));
    assertex(var_1b240bbf89180b65 != -1, "<dev string:x272>");
    traverseinfo = anim.animselector[statename][var_1b240bbf89180b65];
    foreach (alias in traverseinfo.aliases) {
        if (isai(self) && !asm_hasalias(statename, alias)) {
            println("<dev string:x29d>" + alias + "<dev string:x2b2>" + statename + "<dev string:x2d6>" + self.animsetname + "<dev string:x2e8>");
            continue;
        }
        var_b4d9ab801dafc0fd = 1;
        foreach (feature in traverseinfo.features) {
            val = traverseinfo.values[alias][feature];
            if (isdefined(val)) {
                if (!checkfeaturevalue(val, feature, var_e9db8fc3741a7e52)) {
                    var_b4d9ab801dafc0fd = 0;
                    break;
                }
            }
        }
        if (var_b4d9ab801dafc0fd) {
            /#
                if (isai(self) && alias == "<dev string:x316>") {
                    function_99322e10827a8683(statename, var_e9db8fc3741a7e52);
                }
            #/
            return alias;
        }
    }
    assertmsg("<dev string:x321>" + statename + "<dev string:x354>");
}

// Namespace animselector / scripts\anim\animselector
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f1
// Size: 0x14e
function gettraverserindex() {
    archetype = self getbasearchetype();
    if (isdefined(archetype)) {
        switch (archetype) {
        case #"hash_68e7a52445d0df5":
        case #"hash_44aaeb0edd152195":
        case #"hash_4ad475e6e15635bd":
        case #"hash_4ba1525745ce470f":
        case #"hash_62f2aeb0d80aad52":
        case #"hash_85c2b0495aa920dd":
        case #"hash_8f72439a52a5037f":
        case #"hash_a646e2b1476895dd":
        case #"hash_c36adf2d3ad18f39": 
            return 0;
        case #"hash_61a5404fe564f969":
        case #"hash_da4c0e7d8f5fe7c5":
        case #"hash_e87767df2e5c3a68": 
            return 1;
        default: 
            if (isdefined(self.animsetname) && self.animsetname == "suicidebomber_cp") {
                return 2;
            }
            if (isdefined(self.unittype) && self.unittype == "soldier") {
                return 0;
            }
            assertmsg("<dev string:x400>" + self.origin + "<dev string:x41b>" + default_to(self.var_e2b4fc394eef5c0f, "<dev string:x434>") + "<dev string:x439>" + archetype + "<dev string:x449>");
            return -1;
        }
    }
    return -1;
}

