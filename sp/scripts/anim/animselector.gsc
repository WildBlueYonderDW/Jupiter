#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace animselector;

// Namespace animselector / scripts\anim\animselector
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d0
// Size: 0x2c3
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
// Checksum 0x0, Offset: 0xc9c
// Size: 0x461
function init() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") != 0 || getdvarint(@"g_connectpaths") != 0) {
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
            num_aliases = tablelookuprownum(filename[1], 0, "__END__");
            assertex(isdefined(num_aliases) && num_aliases != -1, "Error parsing anim selector table " + filename[1] + ": no __END__ symbol found in column 0.");
            num_aliases -= 1;
            assertex(num_aliases > 0, "Error parsing anim selector table: table must contain at least 1 alias.");
            for (i = 0; i < num_aliases; i++) {
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
            assertex(isdefined(num_features), "Error parsing anim selector table: no __END__ symbol found in row 0.");
            assertex(num_features > 0, "Error parsing anim selector table: header must specify at least 1 feature.");
            for (i = 0; i < num_aliases; i++) {
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
// Checksum 0x0, Offset: 0x1105
// Size: 0xca
function checkfeaturevalue(val, feature, var_e9db8fc3741a7e52) {
    assertex(isdefined(anim.animselectorfeaturetable), "anim selector feature table wasn't initialized");
    assertex(isdefined(anim.animselectorfeaturetable[feature]), "anim selector feature '" + feature + "' is not defined in the anim selector table");
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
    assertmsg("^1Anim selector feature " + feature + " has an invalid limit requirement.");
}

/#

    // Namespace animselector / scripts\anim\animselector
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x11d7
    // Size: 0xb2
    function function_99322e10827a8683(statename, var_e9db8fc3741a7e52) {
        warningstring = "<dev string:x1c>" + self.animsetname + "<dev string:x45>" + statename + "<dev string:x4f>";
        foreach (value in var_e9db8fc3741a7e52) {
            warningstring = warningstring + key + "<dev string:x5d>" + value + "<dev string:x60>";
        }
        warningstring = warningstring + "<dev string:x63>" + self.origin + "<dev string:x60>";
        println(warningstring);
    }

#/

// Namespace animselector / scripts\anim\animselector
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1291
// Size: 0x1cb
function selectanim(statename, var_e9db8fc3741a7e52, var_1b240bbf89180b65) {
    assert(isdefined(anim.animselector[statename]));
    assert(isdefined(var_1b240bbf89180b65));
    assertex(var_1b240bbf89180b65 != -1, "Invalid ent attempting to do traversal.");
    traverseinfo = anim.animselector[statename][var_1b240bbf89180b65];
    foreach (alias in traverseinfo.aliases) {
        if (isai(self) && !asm_hasalias(statename, alias)) {
            println("<dev string:x71>" + alias + "<dev string:x83>" + statename + "<dev string:xa4>" + self.animsetname + "<dev string:xb3>");
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
                if (isai(self) && alias == "<dev string:xde>") {
                    function_99322e10827a8683(statename, var_e9db8fc3741a7e52);
                }
            #/
            return alias;
        }
    }
    assertmsg("^1AnimSelector failed to select anim for state " + statename + ". Ensure that all aliases listed in the AnimSelectorTable are also included in the archetype. Also ensure that the table includes a default alias for catchall purposes.");
}

// Namespace animselector / scripts\anim\animselector
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1464
// Size: 0x14d
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
            assertmsg("Traversal Location is: " + self.origin + ". Traversal Type is: " + default_to(self.var_e2b4fc394eef5c0f, " ") + ". Archetype " + archetype + " is not associated with any animselector tables.  If this is a soldier, add to the list of valid soldier archetypes in GetTraverserIndex(). If this is a zombie, we are facing an invalid traversal and need to fix the Animation Selector Table or the unknown traverseMode calculator.");
            return -1;
        }
    }
    return -1;
}

