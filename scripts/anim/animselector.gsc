// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\asm.gsc;

#namespace animselector;

// Namespace animselector/namespace_814214ba854030e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d0
// Size: 0x2c4
function getanimselectorfilenames() {
    var_55be9ad4f064aa9 = [];
    if (utility::iscp()) {
        var_55be9ad4f064aa9["traverse_warp_up"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_up.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_up.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_up.csv"]];
        var_55be9ad4f064aa9["traverse_warp_down"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_down.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_down.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_down.csv"]];
        var_55be9ad4f064aa9["traverse_warp_over"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_over.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_over.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_over.csv"]];
        var_55be9ad4f064aa9["traverse_warp_across"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_across.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_across.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_across.csv"]];
        var_55be9ad4f064aa9["traverse_warp_external"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_external.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_external.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_external.csv"]];
    } else {
        var_55be9ad4f064aa9["traverse_warp_up"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_up.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_up.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_up.csv"]];
        var_55be9ad4f064aa9["traverse_warp_down"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_down.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_down.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_down.csv"]];
        var_55be9ad4f064aa9["traverse_warp_over"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_over.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_over.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_over.csv"]];
        var_55be9ad4f064aa9["traverse_warp_across"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_across.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_across.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_across.csv"]];
        var_55be9ad4f064aa9["traverse_warp_external"] = [0:[0:0, 1:"animselectortables/soldier/soldier_traverse_warp_external.csv"], 1:[0:1, 1:"animselectortables/civilian/civilian_traverse_warp_external.csv"], 2:[0:2, 1:"animselectortables/bomber/bomber_traverse_warp_external.csv"]];
    }
    return var_55be9ad4f064aa9;
}

// Namespace animselector/namespace_814214ba854030e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9c
// Size: 0x46a
function init() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") != 0 || getdvarint(@"hash_add5b80d30e0737a") != 0) {
        return;
    }
    anim.animselectorfeaturetable = [];
    anim.animselectorfeaturetable["min_height"] = [0:"height", 1:0];
    anim.animselectorfeaturetable["max_height"] = [0:"height", 1:1];
    anim.animselectorfeaturetable["min_arrival_yaw"] = [0:"arrival_yaw", 1:0];
    anim.animselectorfeaturetable["max_arrival_yaw"] = [0:"arrival_yaw", 1:1];
    anim.animselectorfeaturetable["min_length"] = [0:"length", 1:0];
    anim.animselectorfeaturetable["max_length"] = [0:"length", 1:1];
    anim.animselectorfeaturetable["min_drop_height"] = [0:"drop_height", 1:0];
    anim.animselectorfeaturetable["max_drop_height"] = [0:"drop_height", 1:1];
    anim.animselectorfeaturetable["min_speed"] = [0:"speed", 1:0];
    anim.animselectorfeaturetable["max_speed"] = [0:"speed", 1:1];
    anim.animselector = [];
    var_55be9ad4f064aa9 = getanimselectorfilenames();
    foreach (statename, var_466b9e66cb072005 in var_55be9ad4f064aa9) {
        foreach (var_a10838651fe8c3df, filename in var_466b9e66cb072005) {
            anim.animselector[statename][var_a10838651fe8c3df] = spawnstruct();
            anim.animselector[statename][var_a10838651fe8c3df].aliases = [];
            anim.animselector[statename][var_a10838651fe8c3df].features = [];
            anim.animselector[statename][var_a10838651fe8c3df].values = [];
            var_ef6dae508d785188 = tablelookuprownum(filename[1], 0, "__END__");
            /#
                assertex(isdefined(var_ef6dae508d785188) && var_ef6dae508d785188 != -1, "Error parsing anim selector table " + filename[1] + ": no __END__ symbol found in column 0.");
            #/
            var_ef6dae508d785188 = var_ef6dae508d785188 - 1;
            /#
                assertex(var_ef6dae508d785188 > 0, "Error parsing anim selector table: table must contain at least 1 alias.");
            #/
            for (i = 0; i < var_ef6dae508d785188; i++) {
                alias = tablelookupbyrow(filename[1], i + 1, 0);
                anim.animselector[statename][var_a10838651fe8c3df].aliases[i] = alias;
            }
            var_aa68dd236cf6ef27 = undefined;
            for (i = 0; i < 50; i++) {
                feature = tablelookupbyrow(filename[1], 0, i + 1);
                if (feature == "__END__" || feature == "") {
                    var_aa68dd236cf6ef27 = i;
                    break;
                } else {
                    anim.animselector[statename][var_a10838651fe8c3df].features[i] = feature;
                }
            }
            /#
                assertex(isdefined(var_aa68dd236cf6ef27), "Error parsing anim selector table: no __END__ symbol found in row 0.");
            #/
            /#
                assertex(var_aa68dd236cf6ef27 > 0, "Error parsing anim selector table: header must specify at least 1 feature.");
            #/
            for (i = 0; i < var_ef6dae508d785188; i++) {
                for (j = 0; j < var_aa68dd236cf6ef27; j++) {
                    alias = anim.animselector[statename][var_a10838651fe8c3df].aliases[i];
                    feature = anim.animselector[statename][var_a10838651fe8c3df].features[j];
                    val = tablelookupbyrow(filename[1], i + 1, j + 1);
                    if (val == "") {
                        val = undefined;
                    } else {
                        val = float(val);
                    }
                    anim.animselector[statename][var_a10838651fe8c3df].values[alias][feature] = val;
                }
            }
        }
    }
}

// Namespace animselector/namespace_814214ba854030e6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110d
// Size: 0xcb
function checkfeaturevalue(val, feature, var_e9db8fc3741a7e52) {
    /#
        assertex(isdefined(anim.animselectorfeaturetable), "anim selector feature table wasn't initialized");
    #/
    /#
        assertex(isdefined(anim.animselectorfeaturetable[feature]), "anim selector feature '" + feature + "' is not defined in the anim selector table");
    #/
    var_3f44c731fdddd082 = anim.animselectorfeaturetable[feature][0];
    var_ee3ee378f67448a7 = anim.animselectorfeaturetable[feature][1];
    var_2a6a6a7923586558 = var_e9db8fc3741a7e52[var_3f44c731fdddd082];
    if (!isdefined(var_2a6a6a7923586558)) {
        return 1;
    }
    if (var_ee3ee378f67448a7 == 0) {
        return (var_2a6a6a7923586558 >= val);
    } else if (var_ee3ee378f67448a7 == 1) {
        return (var_2a6a6a7923586558 <= val);
    }
    /#
        assertmsg("^1Anim selector feature " + feature + " has an invalid limit requirement.");
    #/
}

// Namespace animselector/namespace_814214ba854030e6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11df
// Size: 0xb7
function function_99322e10827a8683(statename, var_e9db8fc3741a7e52) {
    /#
        var_894df373a5710e86 = "max_length" + self.var_ae3ea15396b65c1f + "<unknown string>" + statename + "<unknown string>";
        foreach (key, value in var_e9db8fc3741a7e52) {
            var_894df373a5710e86 = var_894df373a5710e86 + key + "<unknown string>" + value + "<unknown string>";
        }
        var_894df373a5710e86 = var_894df373a5710e86 + "<unknown string>" + self.origin + "<unknown string>";
        println(var_894df373a5710e86);
    #/
}

// Namespace animselector/namespace_814214ba854030e6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129d
// Size: 0x1d4
function selectanim(statename, var_e9db8fc3741a7e52, var_1b240bbf89180b65) {
    /#
        assert(isdefined(anim.animselector[statename]));
    #/
    /#
        assert(isdefined(var_1b240bbf89180b65));
    #/
    /#
        assertex(var_1b240bbf89180b65 != -1, "Invalid ent attempting to do traversal.");
    #/
    traverseinfo = anim.animselector[statename][var_1b240bbf89180b65];
    foreach (alias in traverseinfo.aliases) {
        if (isai(self) && !asm_hasalias(statename, alias)) {
            /#
                println("<unknown string>" + alias + "<unknown string>" + statename + "<unknown string>" + self.var_ae3ea15396b65c1f + "<unknown string>");
            #/
        } else {
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
                    if (isai(self) && alias == "<unknown string>") {
                        function_99322e10827a8683(statename, var_e9db8fc3741a7e52);
                    }
                #/
                return alias;
            }
        }
    }
    /#
        assertmsg("^1AnimSelector failed to select anim for state " + statename + ". Ensure that all aliases listed in the AnimSelectorTable are also included in the archetype. Also ensure that the table includes a default alias for catchall purposes.");
    #/
}

// Namespace animselector/namespace_814214ba854030e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1478
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
            if (isdefined(self.var_ae3ea15396b65c1f) && self.var_ae3ea15396b65c1f == "suicidebomber_cp") {
                return 2;
            }
            if (isdefined(self.unittype) && self.unittype == "soldier") {
                return 0;
            }
            /#
                assertmsg("Traversal Location is: " + self.origin + ". Traversal Type is: " + function_53c4c53197386572(self.var_e2b4fc394eef5c0f, " ") + ". Archetype " + archetype + " is not associated with any animselector tables.  If this is a soldier, add to the list of valid soldier archetypes in GetTraverserIndex(). If this is a zombie, we are facing an invalid traversal and need to fix the Animation Selector Table or the unknown traverseMode calculator.");
            #/
            return -1;
            break;
        }
    }
    return -1;
}

