// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_6c6964e55ab1bec8;

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x32
function get_linked_struct() {
    array = get_linked_structs();
    /#
        assert(array.size == 1);
    #/
    /#
        assert(isdefined(array[0]));
    #/
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca
// Size: 0x32
function get_linked_vehicle_node() {
    array = get_linked_vehicle_nodes();
    /#
        assert(array.size == 1);
    #/
    /#
        assert(isdefined(array[0]));
    #/
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104
// Size: 0x5b
function function_98123b667b8f7daa(value, key) {
    array = [];
    var_76ae55b0d79e3b1c = getvehiclenodearray(value, key);
    if (isdefined(self.script_linkto)) {
        var_789069f44709f226 = get_linked_vehicle_nodes();
        array = array_intersection(var_789069f44709f226, var_76ae55b0d79e3b1c);
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x167
// Size: 0x45
function function_90f7f7052df0614b(value, key) {
    array = function_98123b667b8f7daa(value, key);
    /#
        assert(array.size == 1);
    #/
    /#
        assert(isdefined(array[0]));
    #/
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0xaa
function function_954eb52ab4cdeb46(value, key) {
    array = [];
    var_c1d3bcb77e1e898f = getstructarray(value, key);
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            var_3d938a1343d65fed = getstructarray(var_b11f91c17feeab8f[i], "script_linkname");
            structs = array_intersection(var_3d938a1343d65fed, var_c1d3bcb77e1e898f);
            if (structs.size > 0) {
                array = array_combine(array, structs);
            }
        }
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0x37
function function_98edf48d14333f3f(value, key) {
    array = function_954eb52ab4cdeb46(value, key);
    if (array.size > 0) {
        return array[0];
    } else {
        return undefined;
    }
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4
// Size: 0xa8
function function_2ccdcbc0a0056226(value, key) {
    array = [];
    var_f3be0382a295a15 = getentarray(value, key);
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            linked_ents = getentarray(var_b11f91c17feeab8f[i], "script_linkname");
            ents = array_intersection(linked_ents, var_f3be0382a295a15);
            if (ents.size > 0) {
                array = array_combine(array, ents);
            }
        }
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x354
// Size: 0x45
function function_45c24888c616581f(value, key) {
    array = function_2ccdcbc0a0056226(value, key);
    /#
        assert(array.size == 1);
    #/
    /#
        assert(isdefined(array[0]));
    #/
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a1
// Size: 0x45
function function_53b040ee753f26b1(value, key) {
    array = function_50b5e4fcc500bb90(value, key);
    /#
        assert(array.size == 1);
    #/
    /#
        assert(isdefined(array[0]));
    #/
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee
// Size: 0xf1
function function_50b5e4fcc500bb90(value, key) {
    array = [];
    var_8d08e5afdc964181 = [];
    var_a2e2c8edb4508f35 = getscriptablearray(value, key);
    var_7815a6f6f10f4cd4 = getentitylessscriptablearray(value, key);
    var_8d08e5afdc964181 = array_combine_unique(var_a2e2c8edb4508f35, var_7815a6f6f10f4cd4);
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            var_3a6b6499601b4cfb = [];
            var_a2e2c8edb4508f35 = getscriptablearray(var_b11f91c17feeab8f[i], "script_linkname");
            var_7815a6f6f10f4cd4 = getentitylessscriptablearray(var_b11f91c17feeab8f[i], "script_linkname");
            var_3a6b6499601b4cfb = array_combine_unique(var_a2e2c8edb4508f35, var_7815a6f6f10f4cd4);
            scriptables = array_intersection(var_3a6b6499601b4cfb, var_8d08e5afdc964181);
            if (scriptables.size > 0) {
                array = array_combine(array, scriptables);
            }
        }
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8/namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e7
// Size: 0xa9
function function_a230870ff680af93(value, key) {
    array = [];
    var_a3c5522fe3aa2c86 = function_f159c10d5cf8f0b4(value, key);
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            for (j = 0; j < var_a3c5522fe3aa2c86.size; j++) {
                if (is_equal(var_b11f91c17feeab8f[i], var_a3c5522fe3aa2c86[j].script_linkname)) {
                    array = array_add(array, var_a3c5522fe3aa2c86[j]);
                }
            }
        }
    }
    return array;
}

