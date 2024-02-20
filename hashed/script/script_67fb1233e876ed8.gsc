// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\mp\flags.gsc;

#namespace namespace_441f403fa28b7819;

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff
// Size: 0x9e
function init() {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return 0;
    }
    namespace_4b0406965e556711::gameflaginit("ssc_initialized", 0);
    debug_print("System enabled");
    /#
        function_172af363664b6357();
        thread function_b2d9754e7e0272ed();
    #/
    var_592732704eec44a = getdvar(@"hash_8e30f7eeea837de6", "");
    if (var_592732704eec44a == "") {
        debug_print("No Config List given, exiting");
        return 0;
    }
    function_1dd97358c9ac338();
    namespace_4b0406965e556711::gameflagset("ssc_initialized");
    level notify("ssc_initialized");
    thread init_thread(var_592732704eec44a);
    return 1;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a5
// Size: 0x49
function private init_thread(var_592732704eec44a) {
    function_8de891d666db43b1("init_thread entered");
    level waittill("POIs_spawned");
    function_8de891d666db43b1("init_thread level waittill set");
    wait(1);
    function_9764aca83e0bfb23(var_592732704eec44a);
    level notify("ssc_config_spawned");
    function_4993c0868a42f933();
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f5
// Size: 0xae
function private function_1dd97358c9ac338() {
    level.var_be6fec030b2f8e04 = spawnstruct();
    level.var_be6fec030b2f8e04.spawns = [];
    /#
        level.var_be6fec030b2f8e04.colors = [];
        level.var_be6fec030b2f8e04.drawcount = 0;
    #/
    level.var_be6fec030b2f8e04.var_793f6c3ad559920f = [];
    level.var_be6fec030b2f8e04.var_6639b9dad892b886 = [];
    level.var_be6fec030b2f8e04.var_69d443a2d34d967a = [];
    level.var_be6fec030b2f8e04.var_2ce6fab92810875 = [];
    function_6f53937fb7417b67();
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9aa
// Size: 0x57
function private function_6f53937fb7417b67() {
    level.var_be6fec030b2f8e04.structs = [];
    level.var_be6fec030b2f8e04.indexes = [];
    level.var_be6fec030b2f8e04.exclude = [];
    level.var_be6fec030b2f8e04.weights = [];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa08
// Size: 0x4f
function private function_4993c0868a42f933() {
    level.var_be6fec030b2f8e04.structs = undefined;
    level.var_be6fec030b2f8e04.indexes = undefined;
    level.var_be6fec030b2f8e04.exclude = undefined;
    level.var_be6fec030b2f8e04.weights = undefined;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e
// Size: 0x52
function function_4f7660cfd85cd517(var_cab957adc8d7710f, var_7f5fc69251d6a8da) {
    if (!isdefined(level.var_be6fec030b2f8e04) || !isdefined(level.var_be6fec030b2f8e04.var_793f6c3ad559920f)) {
        return;
    }
    level.var_be6fec030b2f8e04.var_793f6c3ad559920f[var_cab957adc8d7710f] = var_7f5fc69251d6a8da;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab7
// Size: 0x52
function function_412f527ef0863f0e(var_cab957adc8d7710f, var_efc8ac1d0c1c9aec) {
    if (!isdefined(level.var_be6fec030b2f8e04) || !isdefined(level.var_be6fec030b2f8e04.var_6639b9dad892b886)) {
        return;
    }
    level.var_be6fec030b2f8e04.var_6639b9dad892b886[var_cab957adc8d7710f] = var_efc8ac1d0c1c9aec;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb10
// Size: 0x52
function function_f0492c3bdbb3fd52(var_cab957adc8d7710f, var_7661235a91a2811) {
    if (!isdefined(level.var_be6fec030b2f8e04) || !isdefined(level.var_be6fec030b2f8e04.var_69d443a2d34d967a)) {
        return;
    }
    level.var_be6fec030b2f8e04.var_69d443a2d34d967a[var_cab957adc8d7710f] = var_7661235a91a2811;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb69
// Size: 0x52
function function_eded5b87f8f7bdfd(var_cab957adc8d7710f, var_f7a132d39a92cd3c) {
    if (!isdefined(level.var_be6fec030b2f8e04) || !isdefined(level.var_be6fec030b2f8e04.var_2ce6fab92810875)) {
        return;
    }
    level.var_be6fec030b2f8e04.var_2ce6fab92810875[var_cab957adc8d7710f] = var_f7a132d39a92cd3c;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc2
// Size: 0x7e
function function_9764aca83e0bfb23(var_592732704eec44a, spawntype) {
    var_3a3fd78bc079353b = function_f8c6adde7a4c2116(var_592732704eec44a);
    if (!isdefined(var_3a3fd78bc079353b)) {
        function_8de891d666db43b1("ssc_config could not init list");
        return;
    }
    results = var_3a3fd78bc079353b function_975552b793ff8e27(spawntype);
    debug_print("Spawning complete for config list " + var_592732704eec44a);
    /#
        if (isdefined(spawntype) && spawntype == 2) {
            level.var_be6fec030b2f8e04.drawcount++;
        }
    #/
    return results;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc48
// Size: 0x83
function function_be39ee9f759d6210(var_ca2c833762e5466c, spawntype) {
    var_3bdadc2ea30c31ba = function_9a62bf0437306755(var_ca2c833762e5466c, "structspawnconfig:");
    if (!isdefined(var_3bdadc2ea30c31ba)) {
        function_8de891d666db43b1("ssc_config_single could not init config");
        return;
    }
    results = var_3bdadc2ea30c31ba function_b4f718bb8f4f3f6e(spawntype);
    debug_print("Spawning complete for config " + var_ca2c833762e5466c);
    /#
        if (isdefined(spawntype) && spawntype == 2) {
            level.var_be6fec030b2f8e04.drawcount++;
        }
    #/
    return results;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcd3
// Size: 0x64
function private function_f8c6adde7a4c2116(var_592732704eec44a) {
    var_c7803e864d499dc0 = function_b7913c455f72d892(var_592732704eec44a, "structspawnconfiglist:");
    if (!isdefined(var_c7803e864d499dc0) || var_c7803e864d499dc0.size == 0) {
        return;
    }
    var_3a3fd78bc079353b = function_d72b66a120f30bba(var_c7803e864d499dc0);
    if (!isdefined(var_3a3fd78bc079353b)) {
        return;
    }
    var_3a3fd78bc079353b = var_3a3fd78bc079353b function_9b826ec5596b4b1d();
    var_3a3fd78bc079353b function_7f0c7ed9520a18f0();
    var_3a3fd78bc079353b function_705ab1040a64a8fa();
    return var_3a3fd78bc079353b;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd3f
// Size: 0xb5
function private function_9b826ec5596b4b1d() {
    var_3a3fd78bc079353b = self;
    var_852ab1ce7e39362d = strtok(getdvar(@"hash_7f18cc33e088e923", ""), " ");
    if (var_852ab1ce7e39362d.size == 0) {
        return var_3a3fd78bc079353b;
    }
    foreach (var_ca2c833762e5466c in var_852ab1ce7e39362d) {
        var_3a3fd78bc079353b = function_7dbb2f79e1942e4d(var_3a3fd78bc079353b, var_ca2c833762e5466c, "structspawnconfig:");
    }
    debug_print("Config overrides loaded: " + getdvar(@"hash_7f18cc33e088e923", ""));
    return var_3a3fd78bc079353b;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdfc
// Size: 0x1d
function private function_7f0c7ed9520a18f0() {
    var_3a3fd78bc079353b = self;
    var_3a3fd78bc079353b = array_sort_with_func(var_3a3fd78bc079353b, &function_8bdb3e2a8e7218da);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe20
// Size: 0x3f
function function_8bdb3e2a8e7218da(left, right) {
    var_93ef778faa2e5e54 = left function_7f0bb84945d7d821();
    if (array_contains(var_93ef778faa2e5e54, right.script_struct)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe67
// Size: 0x66
function private function_7f0bb84945d7d821() {
    var_3bdadc2ea30c31ba = self;
    var_648d70383177eca2 = [];
    var_648d70383177eca2 = array_combine(var_648d70383177eca2, function_40ca2001079995dd(var_3bdadc2ea30c31ba.var_6aa0b809ce5a31f8, var_3bdadc2ea30c31ba.var_a8b01cf8030d00c5));
    var_648d70383177eca2 = array_combine(var_648d70383177eca2, function_40ca2001079995dd(var_3bdadc2ea30c31ba.var_f9bfec3775efb6da, var_3bdadc2ea30c31ba.var_b21135f7c628c393));
    return var_648d70383177eca2;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed5
// Size: 0x82
function private function_40ca2001079995dd(rule, var_2f5adfa86b4854a6) {
    var_ad0d4f30b1ce93b4 = [];
    if (!function_8d5f739c58f8362f(rule)) {
        return var_ad0d4f30b1ce93b4;
    }
    foreach (entry in var_2f5adfa86b4854a6) {
        var_ad0d4f30b1ce93b4[var_ad0d4f30b1ce93b4.size] = entry.script_struct;
    }
    return var_ad0d4f30b1ce93b4;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf5f
// Size: 0x5d
function private function_705ab1040a64a8fa() {
    var_3a3fd78bc079353b = self;
    var_45ffc2a32427f2a9 = "";
    for (i = 0; i < var_3a3fd78bc079353b.size; i++) {
        var_45ffc2a32427f2a9 = var_45ffc2a32427f2a9 + var_3a3fd78bc079353b[i].script_struct + " ";
    }
    debug_print("Final config list: " + var_45ffc2a32427f2a9);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfc3
// Size: 0x64
function private function_975552b793ff8e27(spawntype) {
    var_3a3fd78bc079353b = self;
    results = [];
    for (i = 0; i < var_3a3fd78bc079353b.size; i++) {
        index = var_3a3fd78bc079353b[i].script_struct;
        results[index] = var_3a3fd78bc079353b[i] function_b4f718bb8f4f3f6e(spawntype);
    }
    return results;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x102f
// Size: 0x6d
function private function_b4f718bb8f4f3f6e(spawntype) {
    var_3bdadc2ea30c31ba = self;
    if (!isdefined(spawntype)) {
        spawntype = 0;
    }
    function_8d6027e6daa80c1d(var_3bdadc2ea30c31ba, spawntype);
    spawnlist = var_3bdadc2ea30c31ba function_ea108fced89d8d8a();
    var_ddc8bacccad51c15 = spawnlist function_8c1a4fdea2e25ac6(var_3bdadc2ea30c31ba, spawntype);
    spawnlist function_a287b4f36804bbdd(var_3bdadc2ea30c31ba, spawntype);
    spawnlist function_b55121bc7c3e2825(var_3bdadc2ea30c31ba, spawntype);
    if (spawntype == 3) {
        return spawnlist;
    }
    return var_ddc8bacccad51c15;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a4
// Size: 0x194
function private function_8d6027e6daa80c1d(var_3bdadc2ea30c31ba, spawntype) {
    function_6f53937fb7417b67();
    if (!isdefined(level.var_be6fec030b2f8e04.spawns[var_3bdadc2ea30c31ba.script_struct]) && spawntype != 2) {
        level.var_be6fec030b2f8e04.spawns[var_3bdadc2ea30c31ba.script_struct] = [];
    }
    /#
        if (isdefined(var_3bdadc2ea30c31ba.debug_color)) {
            var_8f933672b80b9a4e = strtok(var_3bdadc2ea30c31ba.debug_color, " has 0 spawns in ");
            level.var_be6fec030b2f8e04.colors[var_3bdadc2ea30c31ba.script_struct] = (float(var_8f933672b80b9a4e[0]), float(var_8f933672b80b9a4e[1]), float(var_8f933672b80b9a4e[2]));
        }
    #/
    var_d92eb50c1ad7750 = function_4784966d3ce7dba9(var_3bdadc2ea30c31ba.script_struct);
    function_8de891d666db43b1("Struct " + var_3bdadc2ea30c31ba.script_struct + " found " + var_d92eb50c1ad7750.size + " locations to select from");
    for (i = 0; i < var_d92eb50c1ad7750.size; i++) {
        struct = var_d92eb50c1ad7750[i];
        var_70c2cfdf9c55d6eb = function_400ac4c375b471a1(struct.script_index);
        level.var_be6fec030b2f8e04.indexes[var_70c2cfdf9c55d6eb] = var_70c2cfdf9c55d6eb;
        level.var_be6fec030b2f8e04.structs[var_70c2cfdf9c55d6eb] = struct;
        function_270b1bb4d46b9f5a(var_3bdadc2ea30c31ba, struct, var_70c2cfdf9c55d6eb);
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x123f
// Size: 0x77
function private function_270b1bb4d46b9f5a(var_3bdadc2ea30c31ba, struct, var_70c2cfdf9c55d6eb) {
    var_be07d9ddbda4ed90 = function_3bde2c46d3361035(struct);
    if (!isdefined(level.var_be6fec030b2f8e04.structs[var_be07d9ddbda4ed90])) {
        level.var_be6fec030b2f8e04.structs[var_be07d9ddbda4ed90] = [];
    }
    level.var_be6fec030b2f8e04.structs[var_be07d9ddbda4ed90][var_70c2cfdf9c55d6eb] = struct;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12bd
// Size: 0xfc
function private function_ea108fced89d8d8a() {
    var_3bdadc2ea30c31ba = self;
    spawns = [];
    function_8de891d666db43b1("Struct " + var_3bdadc2ea30c31ba.script_struct + " is beginning config processing");
    if (istrue(var_3bdadc2ea30c31ba.spawn_all) || istrue(var_3bdadc2ea30c31ba.var_8cd1c028ce4287b8)) {
        spawns = level.var_be6fec030b2f8e04.indexes;
        if (istrue(var_3bdadc2ea30c31ba.spawn_all)) {
            function_8de891d666db43b1("Spawn All was selected, exiting");
            return spawns;
        }
    }
    var_3bdadc2ea30c31ba = var_3bdadc2ea30c31ba function_6f80cf558a58324d();
    spawns = spawns function_5b7885d608f6b17e(var_3bdadc2ea30c31ba);
    spawns = spawns function_9657eb0ab7380011(var_3bdadc2ea30c31ba);
    spawns = spawns function_4ee587b4504098a8(var_3bdadc2ea30c31ba);
    spawns = spawns function_66099a164cfbc123(var_3bdadc2ea30c31ba);
    spawns = spawns function_415a97db2da6dd7e(var_3bdadc2ea30c31ba);
    spawns = spawns function_4ee587b4504098a8(var_3bdadc2ea30c31ba);
    spawns = spawns function_9657eb0ab7380011(var_3bdadc2ea30c31ba);
    spawns = spawns function_415a97db2da6dd7e(var_3bdadc2ea30c31ba, 1);
    spawns = spawns function_66099a164cfbc123(var_3bdadc2ea30c31ba, 1);
    spawns = spawns function_5b7885d608f6b17e(var_3bdadc2ea30c31ba);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13c1
// Size: 0x89
function private function_8c1a4fdea2e25ac6(var_3bdadc2ea30c31ba, spawntype) {
    spawnlist = self;
    spawnarray = [];
    foreach (entry in spawnlist) {
        spawnarray[spawnarray.size] = function_d501d9da90bcfb86(entry, var_3bdadc2ea30c31ba, spawntype);
    }
    if (spawntype == 1) {
        return spawnarray;
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0xfb
function private function_a287b4f36804bbdd(var_3bdadc2ea30c31ba, spawntype) {
    spawnlist = self;
    /#
        if (getdvarint(@"hash_74281019987bc070", 0) == 1) {
            return;
        }
    #/
    var_383b3dc47d422fce = level.var_be6fec030b2f8e04.var_69d443a2d34d967a[var_3bdadc2ea30c31ba.script_struct];
    if (!isdefined(var_383b3dc47d422fce)) {
        return;
    }
    foreach (var_ce1a78c55bdd4530 in level.var_be6fec030b2f8e04.indexes) {
        if (!array_contains(spawnlist, var_ce1a78c55bdd4530)) {
            struct = level.var_be6fec030b2f8e04.structs[var_ce1a78c55bdd4530];
            [[ var_383b3dc47d422fce ]](var_3bdadc2ea30c31ba.script_struct, struct);
        }
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1553
// Size: 0x9e
function private function_d501d9da90bcfb86(entry, var_3bdadc2ea30c31ba, spawntype) {
    switch (spawntype) {
    case 3:
        break;
    case 2:
        /#
            function_dd01b38da430e244(var_3bdadc2ea30c31ba.script_struct, entry);
        #/
        break;
    case 1:
        return function_7a0a1c8e4051f836(entry);
        break;
    case 0:
    default:
        function_50a8d188c813997c(var_3bdadc2ea30c31ba.script_struct, entry);
        break;
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15f8
// Size: 0x7b
function private function_b55121bc7c3e2825(var_3bdadc2ea30c31ba, spawntype) {
    spawnlist = self;
    spawnlist function_16deec76c9aec1c2(var_3bdadc2ea30c31ba, spawntype);
    if (isdefined(level.var_be6fec030b2f8e04.var_2ce6fab92810875[var_3bdadc2ea30c31ba.script_struct])) {
        thread [[ level.var_be6fec030b2f8e04.var_2ce6fab92810875[var_3bdadc2ea30c31ba.script_struct] ]](var_3bdadc2ea30c31ba.script_struct);
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x167a
// Size: 0x5c
function private function_16deec76c9aec1c2(var_3bdadc2ea30c31ba, spawntype) {
    spawnlist = self;
    debug_print("Struct " + var_3bdadc2ea30c31ba.script_struct + " spawned " + spawnlist.size + " times" + ter_op(spawntype == 2, " in Debug mode", ""));
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16dd
// Size: 0x3a
function private function_5b7885d608f6b17e(var_3bdadc2ea30c31ba) {
    spawns = self;
    spawns = spawns function_b632c72bbf401a8b(var_3bdadc2ea30c31ba);
    spawns = spawns function_7f381a0dc49788c9(var_3bdadc2ea30c31ba);
    spawns function_ae3769c411d239f2("Force");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x171f
// Size: 0x130
function private function_9657eb0ab7380011(var_3bdadc2ea30c31ba) {
    spawns = self;
    if (isdefined(var_3bdadc2ea30c31ba.var_80007572cdd4150f)) {
        foreach (var_f86cb9d5a60dfdb9 in var_3bdadc2ea30c31ba.var_80007572cdd4150f) {
            if (!isdefined(var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7)) {
                group_name = "";
                foreach (poi in var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b) {
                    group_name = group_name + poi.var_f96e9372bf4d85eb + "_";
                }
                var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7 = group_name;
            }
            spawns = spawns function_576bc6dcb198807d(var_f86cb9d5a60dfdb9, var_3bdadc2ea30c31ba);
        }
    }
    spawns = spawns function_eec8d5bb79fb6ed5(var_3bdadc2ea30c31ba);
    spawns function_ae3769c411d239f2("POI");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1857
// Size: 0xe9
function private function_be1e8d04a1c66652(var_f86cb9d5a60dfdb9, var_3bdadc2ea30c31ba, groupindex) {
    spawns = self;
    var_c00a2e62499631e9 = spawns function_7d53ab524b68f69b(function_3e38027e10bb939c(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b[groupindex]), 1);
    var_c41693c82143133e = var_c00a2e62499631e9[1];
    spawns = var_c00a2e62499631e9[0];
    if (var_c41693c82143133e.size == 0) {
        function_8de891d666db43b1("Struct " + var_3bdadc2ea30c31ba.script_struct + " has 0 spawns in " + var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b[groupindex]);
        return spawns;
    }
    var_e7fee629fee1b87f = var_c41693c82143133e function_5b1350ccb1325b2e(var_f86cb9d5a60dfdb9, groupindex);
    var_e7fee629fee1b87f = var_e7fee629fee1b87f function_e5dcf502bd8f8434(var_f86cb9d5a60dfdb9);
    var_e7fee629fee1b87f = var_e7fee629fee1b87f function_ea64cf87f2cfcc5e(var_f86cb9d5a60dfdb9);
    spawns = function_d1e45146e40968b9(spawns, var_e7fee629fee1b87f);
    function_ae3769c411d239f2("POI Single - " + var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b[groupindex]);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1948
// Size: 0xf7
function private function_576bc6dcb198807d(var_f86cb9d5a60dfdb9, var_3bdadc2ea30c31ba) {
    spawns = self;
    var_c00a2d6249962fb6 = spawns function_7d53ab524b68f69b(function_a9515f5c0ddfbeee(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b), 1);
    var_c41693c82143133e = var_c00a2d6249962fb6[1];
    spawns = var_c00a2d6249962fb6[0];
    if (var_c41693c82143133e.size == 0) {
        var_c41693c82143133e = function_a9515f5c0ddfbeee(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b);
        if (var_c41693c82143133e.size == 0) {
            function_8de891d666db43b1("Struct " + var_3bdadc2ea30c31ba.script_struct + " has 0 spawns in " + var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7 + "poi group");
            return spawns;
        }
    }
    var_e7fee629fee1b87f = var_c41693c82143133e function_d2ba18bc752fe8fa(var_f86cb9d5a60dfdb9);
    var_e7fee629fee1b87f = var_e7fee629fee1b87f function_e5dcf502bd8f8434(var_f86cb9d5a60dfdb9);
    var_e7fee629fee1b87f = var_e7fee629fee1b87f function_ea64cf87f2cfcc5e(var_f86cb9d5a60dfdb9);
    spawns = function_d1e45146e40968b9(spawns, var_e7fee629fee1b87f);
    function_ae3769c411d239f2("POI Group - " + var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a47
// Size: 0xc7
function private function_eec8d5bb79fb6ed5(var_3bdadc2ea30c31ba) {
    spawns = self;
    if (!issharedfuncdefined("poi", "isSystemActive") || ![[ getsharedfunc("poi", "isSystemActive") ]]()) {
        function_8de891d666db43b1("Global POI rules are being skipped as POI system is disabled");
        return spawns;
    }
    foreach (poiName in level.var_dbb3dd5ab77ccd48) {
        var_6ee9e5b5db0d84d3 = [[ getsharedfunc("poi", "try_TranslatePOI") ]](poiName);
        spawns = spawns function_25e8de075f034dd6(var_3bdadc2ea30c31ba, var_6ee9e5b5db0d84d3);
    }
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b16
// Size: 0xe4
function private function_25e8de075f034dd6(var_3bdadc2ea30c31ba, poiName) {
    spawns = self;
    var_a9280bc89e48389a = function_3e38027e10bb939c(poiName);
    if (!isdefined(var_a9280bc89e48389a) || var_a9280bc89e48389a.size == 0) {
        return spawns;
    }
    var_c00a326249963ab5 = spawns function_7d53ab524b68f69b(var_a9280bc89e48389a, 1);
    var_e7fee629fee1b87f = var_c00a326249963ab5[1];
    spawns = var_c00a326249963ab5[0];
    if (isdefined(var_3bdadc2ea30c31ba.var_48b973d2a7eb9e64)) {
        var_e7fee629fee1b87f = var_e7fee629fee1b87f function_c54881e0e112bd31(var_a9280bc89e48389a, poiName, var_3bdadc2ea30c31ba.var_48b973d2a7eb9e64);
    }
    var_e7fee629fee1b87f = var_e7fee629fee1b87f function_569aa5d713ef47b4(var_a9280bc89e48389a, function_53c4c53197386572(var_3bdadc2ea30c31ba.var_48d9abd529d9d920, -1));
    var_e7fee629fee1b87f = var_e7fee629fee1b87f function_b9019dc0e88433a6(function_53c4c53197386572(var_3bdadc2ea30c31ba.var_295277097b7b81ea, -1));
    spawns = function_d1e45146e40968b9(spawns, var_e7fee629fee1b87f);
    spawns function_ae3769c411d239f2("POI Global Single - " + poiName);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c02
// Size: 0xc9
function private function_4ee587b4504098a8(var_3bdadc2ea30c31ba) {
    spawns = self;
    spawns = spawns function_9f97ff4837895235(var_3bdadc2ea30c31ba);
    var_a9280bc89e48389a = level.var_be6fec030b2f8e04.indexes;
    spawns = spawns function_569aa5d713ef47b4(var_a9280bc89e48389a, function_53c4c53197386572(var_3bdadc2ea30c31ba.var_473fbf10b632a192, -1));
    spawns = spawns function_b9019dc0e88433a6(function_53c4c53197386572(var_3bdadc2ea30c31ba.var_e79b6f0d46e45758, -1));
    spawns = spawns function_71170b2ee942ae97(var_a9280bc89e48389a, var_3bdadc2ea30c31ba.var_d63bff823de6d46a, undefined, var_3bdadc2ea30c31ba.var_473fbf10b632a192);
    spawns = spawns function_b9bbe4f989c19e1(var_a9280bc89e48389a, var_3bdadc2ea30c31ba.var_ef46c86624a75b00, undefined, var_3bdadc2ea30c31ba.var_473fbf10b632a192);
    spawns function_ae3769c411d239f2("Global");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cd3
// Size: 0xd5
function private function_66099a164cfbc123(var_3bdadc2ea30c31ba, var_d0fefc6856a8f102) {
    spawns = self;
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_7e0d944014604011, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_6d2c15b852f5ff5a)) {
        spawns = spawns function_8636d08653c34ceb(var_3bdadc2ea30c31ba.var_12e867c36e7e466a, var_3bdadc2ea30c31ba.var_6d2c15b852f5ff5a);
    }
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_22f17815c011174b, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_6d2c15b852f5ff5a)) {
        spawns = spawns function_e4da4917382e57c5(var_3bdadc2ea30c31ba.var_2bf330a7553ecd00, var_3bdadc2ea30c31ba.var_6d2c15b852f5ff5a);
    }
    var_afed05dcd904e3d9 = ter_op(istrue(var_d0fefc6856a8f102), " - Hard Only", "");
    spawns function_ae3769c411d239f2("BR" + var_afed05dcd904e3d9);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1db0
// Size: 0x3cf
function private function_415a97db2da6dd7e(var_3bdadc2ea30c31ba, var_d0fefc6856a8f102) {
    spawns = self;
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_22002ed9c7d33de7, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_8d58c4766a693034)) {
        foreach (entry in var_3bdadc2ea30c31ba.var_8d58c4766a693034) {
            spawns = spawns function_e731bc132fb88fa7(function_53c4c53197386572(entry.spawn_count, 0), entry.var_3e5e7eb1a6127e4f);
        }
    }
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_817374b52a0f5265, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_efbfbc603efe1c26)) {
        foreach (entry in var_3bdadc2ea30c31ba.var_efbfbc603efe1c26) {
            spawns = spawns function_7cca096598bbed89(function_53c4c53197386572(entry.spawn_count, 0), entry.var_3e5e7eb1a6127e4f);
        }
    }
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_cc9ebd1c994451db, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_3b460152154e4790)) {
        foreach (entry in var_3bdadc2ea30c31ba.var_3b460152154e4790) {
            spawns = spawns function_21089f02e9597328(entry.var_2459ccc8942d8b86, entry.script_struct);
        }
    }
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_de56c3e0f9079e1, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_318e2109bdf8fcfa)) {
        foreach (entry in var_3bdadc2ea30c31ba.var_318e2109bdf8fcfa) {
            spawns = spawns function_25c58d881ed46c62(entry.var_2459ccc8942d8b86, entry.script_struct);
        }
    }
    var_a9280bc89e48389a = level.var_be6fec030b2f8e04.indexes;
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_6aa0b809ce5a31f8, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_a8b01cf8030d00c5)) {
        foreach (entry in var_3bdadc2ea30c31ba.var_a8b01cf8030d00c5) {
            spawns = spawns function_71170b2ee942ae97(var_a9280bc89e48389a, entry.var_2459ccc8942d8b86, entry.script_struct);
        }
    }
    if (function_8d5f739c58f8362f(var_3bdadc2ea30c31ba.var_f9bfec3775efb6da, var_d0fefc6856a8f102) && isdefined(var_3bdadc2ea30c31ba.var_b21135f7c628c393)) {
        foreach (entry in var_3bdadc2ea30c31ba.var_b21135f7c628c393) {
            spawns = spawns function_b9bbe4f989c19e1(var_a9280bc89e48389a, entry.var_2459ccc8942d8b86, entry.script_struct);
        }
    }
    var_afed05dcd904e3d9 = ter_op(istrue(var_d0fefc6856a8f102), " - Hard Only", "");
    spawns function_ae3769c411d239f2("Base" + var_afed05dcd904e3d9);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2187
// Size: 0x3d
function private function_ae3769c411d239f2(rule) {
    spawns = self;
    function_49dec75a702536c8("After " + rule + ", spawns has " + spawns.size + " entries");
    function_56b91bfbefdc7456(spawns);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21cb
// Size: 0xf3
function private function_b632c72bbf401a8b(var_3bdadc2ea30c31ba) {
    spawns = self;
    if (!isdefined(var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619) || var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619.size == 0) {
        return spawns;
    }
    spawnlist = [];
    foreach (entry in var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619) {
        spawnlist[entry.var_f29d2aa20f985474] = entry.var_f29d2aa20f985474;
    }
    var_3dcb1ae31baf23c2 = function_288718db33265376(spawnlist, level.var_be6fec030b2f8e04.indexes);
    spawnlist = function_288718db33265376(spawnlist, var_3dcb1ae31baf23c2);
    function_9a9be496c58cfe3b(spawnlist, var_3dcb1ae31baf23c2);
    spawns = function_d1e45146e40968b9(spawns, spawnlist);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22c6
// Size: 0x74
function private function_9a9be496c58cfe3b(spawnlist, var_3dcb1ae31baf23c2) {
    spawns = self;
    var_240dc17a0a45e3fb = function_288718db33265376(spawnlist, spawns);
    function_49dec75a702536c8("Rule Force - Added " + var_240dc17a0a45e3fb.size + " new spawns");
    function_56b91bfbefdc7456(var_240dc17a0a45e3fb);
    if (var_3dcb1ae31baf23c2.size != 0) {
        function_49dec75a702536c8("Rule Force - Not Found contained " + var_240dc17a0a45e3fb.size + " spawns");
        function_56b91bfbefdc7456(var_3dcb1ae31baf23c2);
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2341
// Size: 0xc3
function private function_7f381a0dc49788c9(var_3bdadc2ea30c31ba) {
    spawns = self;
    if (!isdefined(var_3bdadc2ea30c31ba.var_272018d23eeea527) || var_3bdadc2ea30c31ba.var_272018d23eeea527.size == 0) {
        return spawns;
    }
    blocklist = [];
    foreach (entry in var_3bdadc2ea30c31ba.var_272018d23eeea527) {
        blocklist[entry.var_f29d2aa20f985474] = entry.var_f29d2aa20f985474;
    }
    blocklist function_165c62ea04e5f295();
    spawns = spawns function_d87d90deb439f354(blocklist);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x240c
// Size: 0x51
function private function_165c62ea04e5f295() {
    blocklist = self;
    var_240dc17a0a45e3fb = function_288718db33265376(blocklist, level.var_be6fec030b2f8e04.exclude);
    function_49dec75a702536c8("Rule Block - Blocked " + var_240dc17a0a45e3fb.size + " new spawns");
    function_56b91bfbefdc7456(var_240dc17a0a45e3fb);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2464
// Size: 0x8d
function private function_6f80cf558a58324d() {
    var_3bdadc2ea30c31ba = self;
    if (!isdefined(var_3bdadc2ea30c31ba.var_ef484827f08f9da4) || var_3bdadc2ea30c31ba.var_ef484827f08f9da4.size == 0) {
        return var_3bdadc2ea30c31ba;
    }
    foreach (pool in var_3bdadc2ea30c31ba.var_ef484827f08f9da4) {
        var_3bdadc2ea30c31ba = var_3bdadc2ea30c31ba function_99c92fc0c8a5de7e(pool);
    }
    return var_3bdadc2ea30c31ba;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24f9
// Size: 0x129
function private function_99c92fc0c8a5de7e(pool) {
    var_3bdadc2ea30c31ba = self;
    if (pool.spawn_list.size == 0) {
        return var_3bdadc2ea30c31ba;
    }
    var_a806fdaffefaa8f = pool.spawn_count;
    var_8ffad699beb0a9f2 = array_randomize(pool.spawn_list);
    var_31b86ee8a8801194 = array_slice(var_8ffad699beb0a9f2, 0, var_a806fdaffefaa8f);
    var_6d1f0c30078186b = array_slice(var_8ffad699beb0a9f2, var_a806fdaffefaa8f, var_8ffad699beb0a9f2.size);
    if (istrue(pool.force_spawn)) {
        if (!isdefined(var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619)) {
            var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619 = var_31b86ee8a8801194;
        } else {
            var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619 = array_combine_unique(var_3bdadc2ea30c31ba.var_ac34ab4f5f1df619, var_31b86ee8a8801194);
        }
    }
    if (istrue(pool.var_5ecf4fb7eb0018da)) {
        if (!isdefined(var_3bdadc2ea30c31ba.var_272018d23eeea527)) {
            var_3bdadc2ea30c31ba.var_272018d23eeea527 = var_31b86ee8a8801194;
        } else {
            var_3bdadc2ea30c31ba.var_272018d23eeea527 = array_combine_unique(var_3bdadc2ea30c31ba.var_272018d23eeea527, var_6d1f0c30078186b);
        }
    }
    pool function_998775833c1f6b91(var_31b86ee8a8801194, var_6d1f0c30078186b);
    return var_3bdadc2ea30c31ba;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x262a
// Size: 0x14a
function private function_998775833c1f6b91(spawnlist, blocklist) {
    pool = self;
    function_49dec75a702536c8("Spawn Pool");
    if (istrue(pool.force_spawn)) {
        function_49dec75a702536c8("Added " + spawnlist.size + " to Force Spawn List");
        indexes = [];
        foreach (entry in spawnlist) {
            indexes[entry.var_f29d2aa20f985474] = entry.var_f29d2aa20f985474;
        }
        function_56b91bfbefdc7456(indexes);
    }
    if (istrue(pool.var_5ecf4fb7eb0018da)) {
        function_49dec75a702536c8("Added " + blocklist.size + " to Force Block List");
        indexes = [];
        foreach (entry in blocklist) {
            indexes[entry.var_f29d2aa20f985474] = entry.var_f29d2aa20f985474;
        }
        function_56b91bfbefdc7456(indexes);
    }
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x277b
// Size: 0x174
function private function_747ff5f8c0e96da5(weights, spawncount) {
    if (isdefined(spawncount)) {
        foreach (entry in weights) {
            if (entry.spawn_count == spawncount) {
                return spawncount;
            }
        }
    }
    totalweight = 0;
    foreach (entry in weights) {
        if (isdefined(entry.var_b3354ab029b40b5d)) {
            totalweight = totalweight + entry.var_b3354ab029b40b5d;
        }
    }
    var_162b86f62cd92b56 = 0;
    if (totalweight > 0) {
        var_162b86f62cd92b56 = randomint(totalweight);
    }
    foreach (entry in weights) {
        if (isdefined(entry.var_b3354ab029b40b5d)) {
            var_162b86f62cd92b56 = var_162b86f62cd92b56 - entry.var_b3354ab029b40b5d;
            if (var_162b86f62cd92b56 <= 0) {
                return entry.spawn_count;
            }
        }
    }
    return weights[weights.size - 1].spawn_count;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28f7
// Size: 0x11c
function private function_c54881e0e112bd31(var_a9280bc89e48389a, var_428057852bbf2d0d, weights) {
    spawns = self;
    if (!isdefined(weights) || weights.size == 0) {
        function_8de891d666db43b1("POI Group" + var_428057852bbf2d0d + " has no weights set");
        return spawns;
    }
    spawncount = level.var_be6fec030b2f8e04.weights[var_428057852bbf2d0d];
    level.var_be6fec030b2f8e04.weights[var_428057852bbf2d0d] = function_747ff5f8c0e96da5(weights, spawncount);
    var_326c80b3228f6b27 = level.var_be6fec030b2f8e04.weights[var_428057852bbf2d0d] - spawns.size;
    if (var_326c80b3228f6b27 < 0) {
        spawns = function_16059c8d75a938c4(spawns, abs(var_326c80b3228f6b27));
    } else if (var_326c80b3228f6b27 > 0) {
        var_31e262edeb8d33b9 = function_3267104534037a6f(var_a9280bc89e48389a, var_326c80b3228f6b27);
        spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    }
    function_49dec75a702536c8("Rule Weights - Weight rolled for POI " + var_428057852bbf2d0d + " is " + level.var_be6fec030b2f8e04.weights[var_428057852bbf2d0d] + " and spawn count was changed by " + var_326c80b3228f6b27);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a1b
// Size: 0x99
function private function_d2ba18bc752fe8fa(var_f86cb9d5a60dfdb9) {
    var_ba65cde5d4b25523 = self;
    if (!isdefined(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b) || !isdefined(var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7) || !isdefined(var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08) || var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08.size == 0) {
        return var_ba65cde5d4b25523;
    }
    var_a9280bc89e48389a = function_a9515f5c0ddfbeee(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b);
    var_ba65cde5d4b25523 = var_ba65cde5d4b25523 function_c54881e0e112bd31(var_a9280bc89e48389a, var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7, var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08);
    return var_ba65cde5d4b25523;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2abc
// Size: 0xa7
function private function_5b1350ccb1325b2e(var_f86cb9d5a60dfdb9, groupindex) {
    var_ba65cde5d4b25523 = self;
    if (!isdefined(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b) || !isdefined(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b[groupindex]) || !isdefined(var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08) || var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08.size == 0) {
        return var_ba65cde5d4b25523;
    }
    var_a9280bc89e48389a = function_3e38027e10bb939c(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b[groupindex]);
    var_ba65cde5d4b25523 = var_ba65cde5d4b25523 function_c54881e0e112bd31(var_a9280bc89e48389a, var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b[groupindex], var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08);
    return var_ba65cde5d4b25523;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b6b
// Size: 0x75
function private function_9f97ff4837895235(var_3bdadc2ea30c31ba) {
    spawns = self;
    if (!isdefined(var_3bdadc2ea30c31ba.var_d0e74a43bfc6fd16) || var_3bdadc2ea30c31ba.var_d0e74a43bfc6fd16.size == 0) {
        return spawns;
    }
    var_a9280bc89e48389a = level.var_be6fec030b2f8e04.indexes;
    spawns = spawns function_c54881e0e112bd31(var_a9280bc89e48389a, "all", var_3bdadc2ea30c31ba.var_d0e74a43bfc6fd16);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2be8
// Size: 0x222
function private function_47d1ae54743cde58(var_a9280bc89e48389a, dist, var_6336c4046527f0d0, var_59e91147614fbb94, var_9acc94e86eecaf7a) {
    spawns = self;
    if (!isdefined(dist) || dist == 0) {
        return spawns;
    }
    var_a9280bc89e48389a = function_288718db33265376(var_a9280bc89e48389a, level.var_be6fec030b2f8e04.exclude);
    var_a9280bc89e48389a = function_288718db33265376(var_a9280bc89e48389a, spawns);
    var_e7a3404e4656ddc7 = dist * dist;
    var_568e8a532d21219e = spawns.size + var_a9280bc89e48389a.size;
    iterations = 0;
    var_e6e7141ece4f310b = [];
    var_f0470986b35e538 = [];
    while (var_f0470986b35e538.size != spawns.size) {
        var_5b95c21440077d3f = [];
        var_3dd50f588495cdb5 = spawns function_e937d3b8b0cfa746(var_59e91147614fbb94);
        var_b09ce8a320e00634 = function_288718db33265376(spawns, var_f0470986b35e538);
        if (var_3dd50f588495cdb5.size == 0) {
            break;
        }
        var_c017436249a4749d = var_3dd50f588495cdb5 function_2afe2b8c50eb1948(var_b09ce8a320e00634, var_f0470986b35e538, var_e7a3404e4656ddc7, var_6336c4046527f0d0, iterations);
        iterations = var_c017436249a4749d[2];
        var_f0470986b35e538 = var_c017436249a4749d[1];
        var_5b95c21440077d3f = var_c017436249a4749d[0];
        var_c017406249a46e04 = spawns function_23e7aca8646231f4(var_5b95c21440077d3f, var_f0470986b35e538, var_9acc94e86eecaf7a);
        var_5b95c21440077d3f = var_c017406249a46e04[1];
        var_f0470986b35e538 = var_c017406249a46e04[0];
        var_c017416249a47037 = spawns function_d39bee1cd41ccecc(var_5b95c21440077d3f, var_a9280bc89e48389a, var_e6e7141ece4f310b);
        var_e6e7141ece4f310b = var_c017416249a47037[2];
        var_a9280bc89e48389a = var_c017416249a47037[1];
        spawns = var_c017416249a47037[0];
    }
    while (var_e6e7141ece4f310b.size + var_f0470986b35e538.size < var_568e8a532d21219e) {
        var_5b95c21440077d3f = [];
        var_3dd50f588495cdb5 = spawns function_e937d3b8b0cfa746(var_59e91147614fbb94);
        if (var_3dd50f588495cdb5.size == 0) {
            break;
        }
        var_c017366249a45806 = var_3dd50f588495cdb5 function_2afe2b8c50eb1948(var_a9280bc89e48389a, var_f0470986b35e538, var_e7a3404e4656ddc7, var_6336c4046527f0d0, iterations);
        iterations = var_c017366249a45806[2];
        var_f0470986b35e538 = var_c017366249a45806[1];
        var_5b95c21440077d3f = var_c017366249a45806[0];
        var_c017376249a45a39 = var_a9280bc89e48389a function_d39bee1cd41ccecc(var_5b95c21440077d3f, var_a9280bc89e48389a, var_e6e7141ece4f310b);
        var_e6e7141ece4f310b = var_c017376249a45a39[2];
        var_a9280bc89e48389a = var_c017376249a45a39[1];
        var_f103d71371007a3c = var_c017376249a45a39[0];
    }
    function_8f9075696d29fca8(var_e6e7141ece4f310b, iterations, var_59e91147614fbb94);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e12
// Size: 0x79
function private function_e937d3b8b0cfa746(var_59e91147614fbb94) {
    spawns = self;
    if (isdefined(var_59e91147614fbb94)) {
        /#
            assert(isdefined(level.var_be6fec030b2f8e04.spawns[var_59e91147614fbb94]), "Struct: " + var_59e91147614fbb94 + " has not been processed yet!");
        #/
        return level.var_be6fec030b2f8e04.spawns[var_59e91147614fbb94];
    }
    return function_288718db33265376(spawns, level.var_be6fec030b2f8e04.exclude);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e93
// Size: 0x42
function private function_e56f32755a367eba(struct, var_465df4a45cdb81bf) {
    if (isint(struct)) {
        if (struct == var_465df4a45cdb81bf) {
            return undefined;
        }
        return function_7a0a1c8e4051f836(struct).origin;
    }
    return struct.origin;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2edd
// Size: 0x15c
function private function_2afe2b8c50eb1948(var_b09ce8a320e00634, var_f0470986b35e538, var_e7a3404e4656ddc7, var_6336c4046527f0d0, iterations) {
    spawns = self;
    highestscore = 0;
    var_5b95c21440077d3f = [];
    foreach (entry in var_b09ce8a320e00634) {
        var_c01bc66249a98a8d = spawns [[ var_6336c4046527f0d0 ]](entry, var_e7a3404e4656ddc7, iterations);
        iterations = var_c01bc66249a98a8d[1];
        var_b5f38f827fc42e5f = var_c01bc66249a98a8d[0];
        if (isdefined(var_b5f38f827fc42e5f)) {
            var_5b95c21440077d3f[entry] = [];
            var_5b95c21440077d3f[entry] = var_b5f38f827fc42e5f;
            if (var_b5f38f827fc42e5f.size > highestscore) {
                highestscore = var_b5f38f827fc42e5f.size;
            }
        } else if (isdefined(var_f0470986b35e538)) {
            var_f0470986b35e538[entry] = entry;
        }
    }
    foreach (key, value in var_5b95c21440077d3f) {
        if (value.size == highestscore) {
            var_5b95c21440077d3f[key] = key;
        } else {
            var_5b95c21440077d3f[key] = undefined;
        }
    }
    return [0:var_5b95c21440077d3f, 1:var_f0470986b35e538, 2:iterations];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3041
// Size: 0xe9
function private function_8ee15acd9ec71bc7(index, var_649f883816a54d23, iterations) {
    spawns = self;
    origin = function_7a0a1c8e4051f836(index).origin;
    var_a71474bf830da0cd = undefined;
    foreach (entry in spawns) {
        iterations++;
        var_1cfccac3e5778bbb = function_e56f32755a367eba(entry, index);
        if (!isdefined(var_1cfccac3e5778bbb)) {
            continue;
        }
        var_979ef8a5d9c08551 = distancesquared(origin, var_1cfccac3e5778bbb);
        if (var_979ef8a5d9c08551 < var_649f883816a54d23) {
            if (!isdefined(var_a71474bf830da0cd)) {
                var_a71474bf830da0cd = [];
            }
            var_a71474bf830da0cd[entry] = entry;
        }
    }
    return [0:var_a71474bf830da0cd, 1:iterations];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3132
// Size: 0xf3
function private function_8f65abc44b0ed8f1(index, var_38c2b1b9956562a9, iterations) {
    spawns = self;
    origin = function_7a0a1c8e4051f836(index).origin;
    foreach (entry in spawns) {
        iterations++;
        var_1cfccac3e5778bbb = function_e56f32755a367eba(entry, index);
        if (!isdefined(var_1cfccac3e5778bbb)) {
            continue;
        }
        var_979ef8a5d9c08551 = distancesquared(origin, var_1cfccac3e5778bbb);
        if (var_979ef8a5d9c08551 > var_38c2b1b9956562a9) {
            continue;
        }
        return [0:undefined, 1:iterations];
    }
    var_a71474bf830da0cd = [];
    var_a71474bf830da0cd[index] = index;
    return [0:var_a71474bf830da0cd, 1:iterations];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x322d
// Size: 0x8c
function private function_d39bee1cd41ccecc(var_3d2d0f63446ccf2a, var_a9280bc89e48389a, var_e6e7141ece4f310b) {
    spawns = self;
    if (var_3d2d0f63446ccf2a.size == 0) {
        return [0:spawns, 1:var_a9280bc89e48389a, 2:var_e6e7141ece4f310b];
    }
    spawns = spawns function_d87d90deb439f354(var_3d2d0f63446ccf2a);
    var_a9280bc89e48389a = function_288718db33265376(var_a9280bc89e48389a, var_3d2d0f63446ccf2a);
    var_31e262edeb8d33b9 = function_3267104534037a6f(var_a9280bc89e48389a, var_3d2d0f63446ccf2a.size);
    spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    var_e6e7141ece4f310b = function_d1e45146e40968b9(var_e6e7141ece4f310b, var_3d2d0f63446ccf2a);
    return [0:spawns, 1:var_a9280bc89e48389a, 2:var_e6e7141ece4f310b];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32c1
// Size: 0x54
function private function_8f9075696d29fca8(var_e6e7141ece4f310b, iterations, var_59e91147614fbb94) {
    function_49dec75a702536c8("Rule Dist - There were " + var_e6e7141ece4f310b.size + " spawns removed over " + iterations + " iterations");
    if (isdefined(var_59e91147614fbb94)) {
        function_49dec75a702536c8("Rule Dist - The other struct is " + var_59e91147614fbb94);
    }
    function_56b91bfbefdc7456(var_e6e7141ece4f310b);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x331c
// Size: 0xdd
function private function_23e7aca8646231f4(var_3d2d0f63446ccf2a, var_f0470986b35e538, var_9acc94e86eecaf7a) {
    spawns = self;
    if (isdefined(var_9acc94e86eecaf7a)) {
        var_b706f618361c154a = spawns.size - var_3d2d0f63446ccf2a.size;
        if (var_b706f618361c154a < var_9acc94e86eecaf7a && var_3d2d0f63446ccf2a.size > 0) {
            var_dc25bf936986be4d = [];
            for (i = 0; i < var_9acc94e86eecaf7a - var_b706f618361c154a; i++) {
                var_a9979045658c3ded = function_b2cd26ac28946ea7(var_3d2d0f63446ccf2a);
                if (isdefined(var_a9979045658c3ded)) {
                    var_3d2d0f63446ccf2a = var_3d2d0f63446ccf2a function_32f74a46f0bb2dd9(var_3d2d0f63446ccf2a, var_a9979045658c3ded);
                    var_dc25bf936986be4d[var_a9979045658c3ded] = var_a9979045658c3ded;
                }
            }
            debug_print("Rule Dist - There are " + var_dc25bf936986be4d.size + " spawns that break the distance rule being spawned. These were chosen to spawn anyways to ensure that the min spawn amount rule is followed.");
            function_56b91bfbefdc7456(var_dc25bf936986be4d);
        }
    }
    var_9dbad6e6ad4bc864 = function_d1e45146e40968b9(var_f0470986b35e538, var_dc25bf936986be4d);
    return [0:var_9dbad6e6ad4bc864, 1:var_3d2d0f63446ccf2a];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3401
// Size: 0x43
function private function_71170b2ee942ae97(var_a9280bc89e48389a, dist, var_59e91147614fbb94, var_9acc94e86eecaf7a) {
    spawns = self;
    spawns = spawns function_47d1ae54743cde58(var_a9280bc89e48389a, dist, &function_8ee15acd9ec71bc7, var_59e91147614fbb94, var_9acc94e86eecaf7a);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x344c
// Size: 0xa6
function private function_3b3747a18eeec63b(var_a9280bc89e48389a, dist, var_7fe9ea8336a69b1, var_9acc94e86eecaf7a) {
    if (!isdefined(var_7fe9ea8336a69b1)) {
        var_7fe9ea8336a69b1 = "Group";
    }
    spawns = self;
    var_c01bbc6249a9748f = spawns function_7d53ab524b68f69b(var_a9280bc89e48389a);
    var_dbe2bbf29a07e99a = var_c01bbc6249a9748f[1];
    spawns = var_c01bbc6249a9748f[0];
    var_31e262edeb8d33b9 = var_dbe2bbf29a07e99a function_71170b2ee942ae97(var_a9280bc89e48389a, dist, undefined, var_9acc94e86eecaf7a);
    spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    function_49dec75a702536c8("Rule Dist Group Min - " + var_7fe9ea8336a69b1 + " has ended with " + var_31e262edeb8d33b9.size + " spawns");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34fa
// Size: 0xa4
function private function_e5dcf502bd8f8434(var_f86cb9d5a60dfdb9) {
    spawns = self;
    if (!isdefined(var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7) || !isdefined(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b) || !isdefined(var_f86cb9d5a60dfdb9.var_4a8d43d74b119570)) {
        return spawns;
    }
    var_a9280bc89e48389a = function_a9515f5c0ddfbeee(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b);
    spawns = spawns function_3b3747a18eeec63b(var_a9280bc89e48389a, var_f86cb9d5a60dfdb9.var_4a8d43d74b119570, "POI Group" + var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7, var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08[0].spawn_count);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35a6
// Size: 0x58
function private function_21089f02e9597328(dist, tag) {
    spawns = self;
    var_a9280bc89e48389a = function_f1111e4fc4599bac(level.var_be6fec030b2f8e04.indexes, tag);
    spawns = spawns function_3b3747a18eeec63b(var_a9280bc89e48389a, dist, "Tag " + tag);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3606
// Size: 0x43
function private function_b9bbe4f989c19e1(var_a9280bc89e48389a, dist, var_59e91147614fbb94, var_9acc94e86eecaf7a) {
    spawns = self;
    spawns = spawns function_47d1ae54743cde58(var_a9280bc89e48389a, dist, &function_8f65abc44b0ed8f1, var_59e91147614fbb94, var_9acc94e86eecaf7a);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3651
// Size: 0xa8
function private function_b1c829bfd0ebbc8d(var_a9280bc89e48389a, dist, var_7fe9ea8336a69b1, var_9acc94e86eecaf7a) {
    if (!isdefined(var_7fe9ea8336a69b1)) {
        var_7fe9ea8336a69b1 = "Group";
    }
    spawns = self;
    var_c01bbb6249a9725c = spawns function_7d53ab524b68f69b(var_a9280bc89e48389a, 1);
    var_dbe2bbf29a07e99a = var_c01bbb6249a9725c[1];
    spawns = var_c01bbb6249a9725c[0];
    var_31e262edeb8d33b9 = var_dbe2bbf29a07e99a function_b9bbe4f989c19e1(var_a9280bc89e48389a, dist, undefined, var_9acc94e86eecaf7a);
    spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    function_49dec75a702536c8("Rule Dist Group Max - " + var_7fe9ea8336a69b1 + " has ended with " + var_31e262edeb8d33b9.size + " spawns");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3701
// Size: 0xb5
function private function_ea64cf87f2cfcc5e(var_f86cb9d5a60dfdb9) {
    spawns = self;
    if (!isdefined(var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7) || !isdefined(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b) || !isdefined(var_f86cb9d5a60dfdb9.var_af067ae8c152b0da) || var_f86cb9d5a60dfdb9.var_af067ae8c152b0da == 0) {
        return spawns;
    }
    var_a9280bc89e48389a = function_a9515f5c0ddfbeee(var_f86cb9d5a60dfdb9.var_b2e540b174bcfd2b);
    spawns = spawns function_b1c829bfd0ebbc8d(var_a9280bc89e48389a, var_f86cb9d5a60dfdb9.var_af067ae8c152b0da, "POI " + var_f86cb9d5a60dfdb9.var_dfe282400b2e9ad7, var_f86cb9d5a60dfdb9.var_c49eb61fdcdb5a08[0].spawn_count);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37be
// Size: 0x58
function private function_25c58d881ed46c62(dist, tag) {
    spawns = self;
    var_a9280bc89e48389a = function_f1111e4fc4599bac(level.var_be6fec030b2f8e04.indexes, tag);
    spawns = spawns function_b1c829bfd0ebbc8d(var_a9280bc89e48389a, dist, "Tag " + tag);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x381e
// Size: 0x8c
function private function_569aa5d713ef47b4(var_a9280bc89e48389a, minimum) {
    spawns = self;
    if (!isdefined(minimum) || minimum == -1 || spawns.size >= minimum) {
        return spawns;
    }
    var_a9280bc89e48389a = function_288718db33265376(var_a9280bc89e48389a, spawns);
    var_5564667dcdfcd2e7 = minimum - spawns.size;
    var_31e262edeb8d33b9 = function_3267104534037a6f(var_a9280bc89e48389a, var_5564667dcdfcd2e7);
    spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    function_49dec75a702536c8("Rule Count Min - " + var_31e262edeb8d33b9.size + " spawns were added");
    function_56b91bfbefdc7456(var_31e262edeb8d33b9);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38b2
// Size: 0x90
function private function_d51b2ccdfb4d9508(var_a9280bc89e48389a, minimum, var_7fe9ea8336a69b1) {
    spawns = self;
    var_c00e3262499a308c = spawns function_7d53ab524b68f69b(var_a9280bc89e48389a, 1);
    var_dbe2bbf29a07e99a = var_c00e3262499a308c[1];
    spawns = var_c00e3262499a308c[0];
    var_31e262edeb8d33b9 = var_dbe2bbf29a07e99a function_569aa5d713ef47b4(var_a9280bc89e48389a, minimum);
    spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    function_49dec75a702536c8("Rule Count Group Min - " + var_7fe9ea8336a69b1 + " has ended with " + var_31e262edeb8d33b9.size + " spawns");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x394a
// Size: 0x58
function private function_e731bc132fb88fa7(minimum, tag) {
    spawns = self;
    var_a9280bc89e48389a = function_f1111e4fc4599bac(level.var_be6fec030b2f8e04.indexes, tag);
    spawns = spawns function_d51b2ccdfb4d9508(var_a9280bc89e48389a, minimum, "Tag " + tag);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39aa
// Size: 0x58
function private function_8636d08653c34ceb(minimum, var_34046574fc122027) {
    spawns = self;
    var_a9280bc89e48389a = function_8a35cd250e4360b8(level.var_be6fec030b2f8e04.indexes, var_34046574fc122027);
    spawns = spawns function_d51b2ccdfb4d9508(var_a9280bc89e48389a, minimum, "Circle " + var_34046574fc122027);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a0a
// Size: 0x5e
function private function_b9019dc0e88433a6(maximum) {
    spawns = self;
    if (!isdefined(maximum) || maximum == -1 || spawns.size <= maximum) {
        return spawns;
    }
    var_e1e302c0235f5998 = spawns.size - maximum;
    spawns = function_16059c8d75a938c4(spawns, var_e1e302c0235f5998);
    function_49dec75a702536c8("Rule Count Max - " + var_e1e302c0235f5998 + " spawns were removed");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a70
// Size: 0x8e
function private function_86ee889ccb1effb2(var_a9280bc89e48389a, maximum, var_7fe9ea8336a69b1) {
    spawns = self;
    var_c00e3362499a32bf = spawns function_7d53ab524b68f69b(var_a9280bc89e48389a, 1);
    var_dbe2bbf29a07e99a = var_c00e3362499a32bf[1];
    spawns = var_c00e3362499a32bf[0];
    var_31e262edeb8d33b9 = var_dbe2bbf29a07e99a function_b9019dc0e88433a6(maximum);
    spawns = function_d1e45146e40968b9(spawns, var_31e262edeb8d33b9);
    function_49dec75a702536c8("Rule Count Group Max - " + var_7fe9ea8336a69b1 + " has ended with " + var_31e262edeb8d33b9.size + " spawns");
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b06
// Size: 0x58
function private function_7cca096598bbed89(maximum, tag) {
    spawns = self;
    var_a9280bc89e48389a = function_f1111e4fc4599bac(level.var_be6fec030b2f8e04.indexes, tag);
    spawns = spawns function_86ee889ccb1effb2(var_a9280bc89e48389a, maximum, "Tag " + tag);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b66
// Size: 0x58
function private function_e4da4917382e57c5(maximum, var_34046574fc122027) {
    spawns = self;
    var_a9280bc89e48389a = function_8a35cd250e4360b8(level.var_be6fec030b2f8e04.indexes, var_34046574fc122027);
    spawns = spawns function_86ee889ccb1effb2(var_a9280bc89e48389a, maximum, "Circle " + var_34046574fc122027);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bc6
// Size: 0xc4
function private function_50a8d188c813997c(var_9479a9b75a38cd2b, index) {
    if (!isdefined(level.var_be6fec030b2f8e04.var_6639b9dad892b886) || !isdefined(level.var_be6fec030b2f8e04.var_6639b9dad892b886[var_9479a9b75a38cd2b])) {
        return;
    }
    var_b6e70862b6482648 = function_7a0a1c8e4051f836(index);
    newspawn = [[ level.var_be6fec030b2f8e04.var_6639b9dad892b886[var_9479a9b75a38cd2b] ]](var_9479a9b75a38cd2b, var_b6e70862b6482648);
    newspawn.var_2c754a023b081c20 = index;
    size = level.var_be6fec030b2f8e04.spawns[var_9479a9b75a38cd2b].size;
    level.var_be6fec030b2f8e04.spawns[var_9479a9b75a38cd2b][size] = newspawn;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c91
// Size: 0x21
function private function_7a0a1c8e4051f836(key) {
    return level.var_be6fec030b2f8e04.structs[key];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cba
// Size: 0x7c
function private function_3e38027e10bb939c(poiName) {
    var_ba65cde5d4b25523 = [];
    var_52ab1aeee35c08cf = function_7a0a1c8e4051f836(poiName);
    if (!isdefined(var_52ab1aeee35c08cf)) {
        return var_ba65cde5d4b25523;
    }
    foreach (key, value in var_52ab1aeee35c08cf) {
        var_ba65cde5d4b25523[key] = key;
    }
    return var_ba65cde5d4b25523;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d3e
// Size: 0xb2
function private function_a9515f5c0ddfbeee(var_b2e540b174bcfd2b) {
    var_10d77e0383000d33 = [];
    foreach (key in var_b2e540b174bcfd2b) {
        var_ba65cde5d4b25523 = function_3e38027e10bb939c(key.var_f96e9372bf4d85eb);
        var_c00e2f62499a29f3 = var_10d77e0383000d33 function_7d53ab524b68f69b(var_ba65cde5d4b25523, 1);
        var_af7a88cb662b0b40 = var_c00e2f62499a29f3[1];
        var_10d77e0383000d33 = var_c00e2f62499a29f3[0];
        var_10d77e0383000d33 = array_combine_unique_keys(var_10d77e0383000d33, var_ba65cde5d4b25523);
    }
    return var_10d77e0383000d33;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3df8
// Size: 0x9e
function private function_f1111e4fc4599bac(spawns, tag) {
    var_3cc1ef46598acfc3 = [];
    foreach (entry in spawns) {
        struct = function_7a0a1c8e4051f836(entry);
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == tag) {
            var_3cc1ef46598acfc3[entry] = entry;
        }
    }
    return var_3cc1ef46598acfc3;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e9e
// Size: 0x132
function private function_8a35cd250e4360b8(spawns, circleindex) {
    var_d1731c36e23d8e1 = [];
    if (!isdefined(circleindex)) {
        return var_d1731c36e23d8e1;
    }
    if (!issharedfuncdefined("game", "isFeatureEnabled") || ![[ getsharedfunc("game", "isFeatureEnabled") ]]("circle")) {
        return var_d1731c36e23d8e1;
    }
    if (!issharedfuncdefined("game", "getTimeTillCircleClosing") || !issharedfuncdefined("game", "getTimeTillDangerForPoint")) {
        return var_d1731c36e23d8e1;
    }
    foreach (entry in spawns) {
        struct = function_7a0a1c8e4051f836(entry);
        var_2675faeef715c28b = [[ getsharedfunc("game", "getTimeTillDangerForPoint") ]](struct.origin);
        var_84697b290afa1bfa = [[ getsharedfunc("game", "getTimeTillCircleClosing") ]](circleindex);
        if (var_2675faeef715c28b > var_84697b290afa1bfa) {
            var_d1731c36e23d8e1[entry] = entry;
        }
    }
    return var_d1731c36e23d8e1;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fd8
// Size: 0x51
function private function_4784966d3ce7dba9(var_cab957adc8d7710f) {
    if (!isdefined(level.var_be6fec030b2f8e04.var_793f6c3ad559920f[var_cab957adc8d7710f])) {
        return [];
    }
    var_d92eb50c1ad7750 = [[ level.var_be6fec030b2f8e04.var_793f6c3ad559920f[var_cab957adc8d7710f] ]](var_cab957adc8d7710f);
    return array_sort_by_script_index(var_d92eb50c1ad7750);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4031
// Size: 0xb2
function private function_3bde2c46d3361035(struct) {
    var_99115d832ea03fdf = issharedfuncdefined("poi", "isSystemActive") && issharedfuncdefined("poi", "findPOIOriginIsIn");
    var_be07d9ddbda4ed90 = struct.poi;
    if (!isdefined(var_be07d9ddbda4ed90) && istrue(var_99115d832ea03fdf) && [[ getsharedfunc("poi", "isSystemActive") ]]()) {
        var_be07d9ddbda4ed90 = [[ getsharedfunc("poi", "findPOIOriginIsIn") ]](struct.origin);
        var_be07d9ddbda4ed90 = [[ getsharedfunc("poi", "try_TranslatePOI") ]](var_be07d9ddbda4ed90);
    } else {
        var_be07d9ddbda4ed90 = "none";
    }
    return var_be07d9ddbda4ed90;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40eb
// Size: 0x55
function private function_400ac4c375b471a1(var_cba945ead85315c2) {
    indexes = level.var_be6fec030b2f8e04.indexes;
    if (isdefined(var_cba945ead85315c2)) {
        if (!isdefined(indexes[var_cba945ead85315c2])) {
            return var_cba945ead85315c2;
        }
        /#
            assertmsg("There are 2 structs that have matching script_index values: [" + var_cba945ead85315c2 + "]! All script_index values should be unique.");
        #/
    }
    return function_4e39e2d66e2d1948(indexes);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4148
// Size: 0x27
function private function_4e39e2d66e2d1948(var_d57a27cd0f4ec676) {
    for (i = 1; isdefined(var_d57a27cd0f4ec676[i]); i++) {
    }
    return i;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4177
// Size: 0x5b
function private function_97c19dff54fb4be0(spawns) {
    if (!isarray(spawns)) {
        level.var_be6fec030b2f8e04.exclude[spawns] = spawns;
        return;
    }
    level.var_be6fec030b2f8e04.exclude = function_d1e45146e40968b9(level.var_be6fec030b2f8e04.exclude, spawns);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41d9
// Size: 0x36
function private function_8d5f739c58f8362f(var_7abf5b8312b5f32d, var_d0fefc6856a8f102) {
    if (!isdefined(var_7abf5b8312b5f32d) || var_7abf5b8312b5f32d == "none") {
        return 0;
    }
    if (istrue(var_d0fefc6856a8f102)) {
        return (var_7abf5b8312b5f32d == "hard");
    }
    return 1;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4217
// Size: 0x32
function private function_c8a102d039ae8ff2(index) {
    spawns = self;
    if (!isdefined(index)) {
        return spawns;
    }
    function_97c19dff54fb4be0(index);
    spawns = function_32f74a46f0bb2dd9(spawns, index);
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4251
// Size: 0x6f
function private function_d87d90deb439f354(array) {
    spawns = self;
    if (!isdefined(array)) {
        return spawns;
    }
    foreach (entry in array) {
        spawns = spawns function_c8a102d039ae8ff2(entry);
    }
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42c8
// Size: 0x8a
function private function_b7913c455f72d892(var_592732704eec44a, type) {
    var_8a11927785db1c99 = strtok(var_592732704eec44a, " ");
    var_c7803e864d499dc0 = [];
    foreach (list in var_8a11927785db1c99) {
        var_c7803e864d499dc0[var_c7803e864d499dc0.size] = function_9a62bf0437306755(list, type);
    }
    return var_c7803e864d499dc0;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x435a
// Size: 0x67
function private function_9a62bf0437306755(var_592732704eec44a, type) {
    bundlename = var_592732704eec44a;
    if (!function_73e183e02834309d(var_592732704eec44a)) {
        bundlename = function_40fd49171fad19d3(function_53c4c53197386572(type, "") + var_592732704eec44a);
    }
    var_ced3d1299debab33 = getscriptbundle(bundlename);
    /#
        assertex(isdefined(var_ced3d1299debab33), "Could not load struct spawn config script bundle:" + function_3c8848a3a11b2553(bundlename));
    #/
    return var_ced3d1299debab33;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43c9
// Size: 0x7e
function private function_d72b66a120f30bba(var_c7803e864d499dc0) {
    if (!isdefined(var_c7803e864d499dc0)) {
        /#
            assertex(isdefined(var_c7803e864d499dc0), "Can not validate empty spawn list!");
        #/
        return;
    }
    var_3a3fd78bc079353b = [];
    foreach (var_ced3d1299debab33 in var_c7803e864d499dc0) {
        var_3a3fd78bc079353b = function_219da70f303de5b(var_ced3d1299debab33, var_3a3fd78bc079353b);
    }
    return var_3a3fd78bc079353b;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x444f
// Size: 0xa1
function private function_219da70f303de5b(var_ced3d1299debab33, var_3a3fd78bc079353b) {
    if (!isdefined(var_ced3d1299debab33)) {
        /#
            assertex(isdefined(var_ced3d1299debab33), "Can not validate empty spawn list!");
        #/
        return;
    }
    var_7913786b1f47a997 = function_53c4c53197386572(var_3a3fd78bc079353b, []);
    foreach (entry in var_ced3d1299debab33.var_204bc53a09c2fac) {
        var_7913786b1f47a997 = function_7dbb2f79e1942e4d(var_7913786b1f47a997, entry.config);
    }
    return var_7913786b1f47a997;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44f8
// Size: 0x61
function private function_7dbb2f79e1942e4d(var_3a3fd78bc079353b, var_ca2c833762e5466c, type) {
    config = function_9a62bf0437306755(var_ca2c833762e5466c, type);
    if (!isdefined(config)) {
        /#
            assertex(isdefined(config), "Could not load struct spawn config script bundle!");
        #/
        return var_3a3fd78bc079353b;
    }
    var_3a3fd78bc079353b = var_3a3fd78bc079353b function_32bde5f3b80bb14a(config.script_struct);
    var_3a3fd78bc079353b[var_3a3fd78bc079353b.size] = config;
    return var_3a3fd78bc079353b;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4561
// Size: 0x78
function private function_32bde5f3b80bb14a(var_48380029fbb1007a) {
    var_3a3fd78bc079353b = self;
    foreach (config in var_3a3fd78bc079353b) {
        if (config.script_struct == var_48380029fbb1007a) {
            var_3a3fd78bc079353b = array_remove(var_3a3fd78bc079353b, config);
        }
    }
    return var_3a3fd78bc079353b;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45e1
// Size: 0x88
function private function_3267104534037a6f(var_a9280bc89e48389a, count) {
    var_a9280bc89e48389a = function_288718db33265376(var_a9280bc89e48389a, level.var_be6fec030b2f8e04.exclude);
    var_31e262edeb8d33b9 = [];
    for (i = 0; i < count; i++) {
        if (var_a9280bc89e48389a.size == 0) {
            break;
        }
        var_a9979045658c3ded = function_b2cd26ac28946ea7(var_a9280bc89e48389a);
        var_a9280bc89e48389a = function_32f74a46f0bb2dd9(var_a9280bc89e48389a, var_a9979045658c3ded);
        var_31e262edeb8d33b9[var_a9979045658c3ded] = var_a9979045658c3ded;
    }
    var_31e262edeb8d33b9 function_b301207ce4ffa1d7();
    return var_31e262edeb8d33b9;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4671
// Size: 0x2c
function private function_b301207ce4ffa1d7() {
    var_31e262edeb8d33b9 = self;
    function_49dec75a702536c8("Struct Add - Adding " + var_31e262edeb8d33b9.size + " new spawns");
    function_56b91bfbefdc7456(var_31e262edeb8d33b9);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x46a4
// Size: 0x6c
function private function_16059c8d75a938c4(spawns, count) {
    var_e6e7141ece4f310b = [];
    for (i = 0; i < count; i++) {
        if (spawns.size == 0) {
            return spawns;
        }
        var_a9979045658c3ded = function_b2cd26ac28946ea7(spawns);
        spawns = spawns function_c8a102d039ae8ff2(var_a9979045658c3ded);
        var_e6e7141ece4f310b[var_e6e7141ece4f310b.size] = var_a9979045658c3ded;
    }
    var_e6e7141ece4f310b function_89feae59bdc8918c();
    return spawns;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4718
// Size: 0x2c
function private function_89feae59bdc8918c() {
    var_e6e7141ece4f310b = self;
    function_49dec75a702536c8("Struct Remove - Removing " + var_e6e7141ece4f310b.size + " spawns");
    function_56b91bfbefdc7456(var_e6e7141ece4f310b);
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x474b
// Size: 0x65
function private function_288718db33265376(array1, array2) {
    if (!isdefined(array2)) {
        return array1;
    }
    foreach (entry in array2) {
        array1[entry] = undefined;
    }
    return array1;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x47b8
// Size: 0x20
function private function_32f74a46f0bb2dd9(array, index) {
    if (!isdefined(index)) {
        return array;
    }
    array[index] = undefined;
    return array;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x47e0
// Size: 0x66
function private function_d1e45146e40968b9(array1, array2) {
    if (!isdefined(array2)) {
        return array1;
    }
    foreach (entry in array2) {
        array1[entry] = entry;
    }
    return array1;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x484e
// Size: 0xa9
function private function_7d53ab524b68f69b(var_dcdc767aeea40c3a, remove) {
    spawns = self;
    if (!isdefined(var_dcdc767aeea40c3a)) {
        return [0:spawns, 1:[]];
    }
    var_f6e387b9f5a2b39c = [];
    foreach (entry in spawns) {
        if (isdefined(var_dcdc767aeea40c3a[entry])) {
            var_f6e387b9f5a2b39c[entry] = entry;
        }
    }
    if (istrue(remove)) {
        spawns = function_288718db33265376(spawns, var_f6e387b9f5a2b39c);
    }
    return [0:spawns, 1:var_f6e387b9f5a2b39c];
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x48ff
// Size: 0x8f
function private function_b2cd26ac28946ea7(array) {
    if (!isdefined(array) || array.size == 0) {
        return undefined;
    }
    var_81a6a97b6daac9ed = randomint(array.size);
    var_b6f237ee42c720f6 = undefined;
    foreach (entry in array) {
        var_b6f237ee42c720f6 = entry;
        var_81a6a97b6daac9ed--;
        if (var_81a6a97b6daac9ed < 0) {
            break;
        }
    }
    return var_b6f237ee42c720f6;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4996
// Size: 0x33
function private debug_print(text) {
    /#
        if (getdvarint(@"hash_8b6143a0fa7f37a6", 1) < 1) {
            return;
        }
        println("poi group" + text);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x49d0
// Size: 0x33
function private function_8de891d666db43b1(text) {
    /#
        if (getdvarint(@"hash_8b6143a0fa7f37a6", 1) < 2) {
            return;
        }
        println("Global" + text);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a0a
// Size: 0x33
function private function_49dec75a702536c8(text) {
    /#
        if (getdvarint(@"hash_8b6143a0fa7f37a6", 1) < 3) {
            return;
        }
        println(" has no weights set" + text);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a44
// Size: 0x8a
function private function_56b91bfbefdc7456(array) {
    /#
        if (getdvarint(@"hash_8b6143a0fa7f37a6", 1) < 3) {
            return;
        }
        if (!isdefined(array) || array.size == 0) {
            return;
        }
        var_6c46abea90157067 = function_5f4abcf527639ec2(array);
        var_d8f61238b22a9b73 = "Group";
        for (i = 0; i < var_6c46abea90157067.size; i++) {
            var_d8f61238b22a9b73 = var_d8f61238b22a9b73 + var_6c46abea90157067[i] + " has 0 spawns in ";
        }
        println("Rule Dist Group Min - " + var_d8f61238b22a9b73);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4ad5
// Size: 0x72
function private function_5f4abcf527639ec2(var_e9df1a60f3b537c2) {
    var_6c46abea90157067 = [];
    foreach (entry in var_e9df1a60f3b537c2) {
        var_6c46abea90157067[var_6c46abea90157067.size] = entry;
    }
    var_6c46abea90157067 = array_sort_with_func(var_6c46abea90157067, &function_c0b52f72ada4834c);
    return var_6c46abea90157067;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4f
// Size: 0x17
function function_c0b52f72ada4834c(left, right) {
    return left < right;
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4b6e
// Size: 0x109
function private function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("getTimeTillCircleClosing");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4c7e
// Size: 0x8a
function private function_b2d9754e7e0272ed() {
    /#
        thread function_378f9e4b54cd24d4(@"hash_e4a633370d1ef223", &debug_draw);
        thread function_378f9e4b54cd24d4(@"hash_e131fa7eb854022b", &function_f01b154aa1fe41cb);
        thread function_378f9e4b54cd24d4(@"hash_dabca9d7fe9cee2a", &function_39432dc2e39e328a);
        thread function_378f9e4b54cd24d4(@"hash_f9cebbc2fc0ec02f", &function_cb22b100665fa1b4);
        thread function_378f9e4b54cd24d4(@"hash_c58cb33610933aa4", &function_34ae4f6043bcb29a);
        thread function_378f9e4b54cd24d4(@"hash_988831f42004ed6b", &function_1c9f19f5e86da1ab);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4d0f
// Size: 0x77
function private function_378f9e4b54cd24d4(dvarstring, var_d14120625e744d62) {
    /#
        level endon("<unknown string>");
        while (1) {
            var_a88417fa8d41b41 = getdvar(dvarstring, "Group");
            if (var_a88417fa8d41b41 == "Group") {
                waitframe();
                continue;
            }
            setdvar(dvarstring, "Group");
            debug_print("<unknown string>" + function_3c8848a3a11b2553(dvarstring) + "<unknown string>" + var_a88417fa8d41b41);
            [[ var_d14120625e744d62 ]](var_a88417fa8d41b41);
            waitframe();
        }
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4d8d
// Size: 0xd5
function private debug_draw(var_9479a9b75a38cd2b, spawns) {
    /#
        var_3bdadc2ea30c31ba = spawnstruct();
        var_3bdadc2ea30c31ba.script_struct = var_9479a9b75a38cd2b;
        function_8d6027e6daa80c1d(var_3bdadc2ea30c31ba, 2);
        function_7fe7f21f879ad5af();
        iprintlnbold("<unknown string>" + var_9479a9b75a38cd2b + "<unknown string>");
        if (spawns == undefined) {
            spawns = level.var_be6fec030b2f8e04.indexes;
        }
        foreach (entry in spawns) {
            function_dd01b38da430e244(var_9479a9b75a38cd2b, entry);
        }
        level.var_be6fec030b2f8e04.drawcount++;
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e69
// Size: 0x43
function private function_f60985255e4b2819() {
    /#
        offset = getdvarint(@"hash_5ec6f63fa858b195", 1);
        var_aa995ff9bd21f45 = level.var_be6fec030b2f8e04.drawcount - offset;
        return var_aa995ff9bd21f45;
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4eb3
// Size: 0xb3
function private function_dd01b38da430e244(var_9479a9b75a38cd2b, index) {
    /#
        origin = function_53c4c53197386572(function_7a0a1c8e4051f836(index).origin, (0, 0, 0));
        angles = function_53c4c53197386572(function_7a0a1c8e4051f836(index).angles, (0, 0, 0));
        color = function_53c4c53197386572(level.var_be6fec030b2f8e04.colors[var_9479a9b75a38cd2b], (1, 1, 1));
        function_fd78bc2f959fe5cc(index, origin, angles, color);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x4f6d
// Size: 0x100
function private function_fd78bc2f959fe5cc(text, origin, angles, color) {
    /#
        forward = anglestoforward(angles);
        timesec = getdvarint(@"hash_1e06d12003d4c5bf", 15);
        var_96f902eb4385b572 = int(timesec / level.framedurationseconds);
        thread function_51c00e624bf397fd(text, origin, color, var_96f902eb4385b572);
        var_cb921303144e9e43 = origin + (0, 0, 20000);
        forwardpos = origin + forward * 75;
        thread draw_line_for_time(origin, var_cb921303144e9e43, color[0], color[1], color[2], timesec, "<unknown string>" + level.var_be6fec030b2f8e04.drawcount);
        thread draw_arrow_time(origin, forwardpos, color, timesec, "<unknown string>" + level.var_be6fec030b2f8e04.drawcount);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x5074
// Size: 0x79
function private function_51c00e624bf397fd(text, origin, color, var_96f902eb4385b572) {
    /#
        level endon("<unknown string>" + level.var_be6fec030b2f8e04.drawcount);
        while (var_96f902eb4385b572 > 0) {
            print3d(origin, text, color, 1, 60, 10);
            var_96f902eb4385b572 = var_96f902eb4385b572 - 10;
            timesec = 10 * level.framedurationseconds;
            wait(timesec);
        }
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x50f4
// Size: 0x26
function private function_7fe7f21f879ad5af(var_aa995ff9bd21f45) {
    /#
        if (!isdefined(var_aa995ff9bd21f45)) {
            var_aa995ff9bd21f45 = function_f60985255e4b2819();
        }
        level notify("<unknown string>" + var_aa995ff9bd21f45);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5121
// Size: 0x3f
function private function_f01b154aa1fe41cb(var_592732704eec44a) {
    /#
        if (var_592732704eec44a == "<unknown string>") {
            var_592732704eec44a = getdvar(@"hash_8e30f7eeea837de6", "Group");
        }
        function_7fe7f21f879ad5af();
        function_9764aca83e0bfb23(var_592732704eec44a, 2);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5167
// Size: 0x3d
function private function_39432dc2e39e328a(var_ca2c833762e5466c, spawntype) {
    /#
        if (!isdefined(spawntype)) {
            spawntype = 2;
        }
        function_7fe7f21f879ad5af();
        results = function_be39ee9f759d6210(var_ca2c833762e5466c, spawntype);
        return results;
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x51ab
// Size: 0x162
function private function_cb22b100665fa1b4(var_a88417fa8d41b41) {
    /#
        function_7fe7f21f879ad5af();
        foreach (var_cab957adc8d7710f, spawnarray in level.var_be6fec030b2f8e04.spawns) {
            color = function_53c4c53197386572(level.var_be6fec030b2f8e04.colors[var_cab957adc8d7710f], (1, 1, 1));
            foreach (var_9479a9b75a38cd2b in spawnarray) {
                origin = function_53c4c53197386572(var_9479a9b75a38cd2b.origin, (0, 0, 0));
                angles = function_53c4c53197386572(var_9479a9b75a38cd2b.angles, (0, 0, 0));
                function_fd78bc2f959fe5cc(var_9479a9b75a38cd2b.var_2c754a023b081c20, origin, angles, color);
            }
        }
        level.var_be6fec030b2f8e04.drawcount++;
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5314
// Size: 0x46
function private function_34ae4f6043bcb29a(var_a88417fa8d41b41) {
    /#
        for (i = function_f60985255e4b2819(); i <= level.var_be6fec030b2f8e04.drawcount; i++) {
            function_7fe7f21f879ad5af(i);
        }
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5361
// Size: 0xb4
function private function_1c9f19f5e86da1ab(var_ca2c833762e5466c) {
    /#
        spawns = [];
        var_157d3ed7df0faca7 = getdvarint(@"hash_a7edcbf40456f8b5", 10);
        debug_print("<unknown string>" + var_ca2c833762e5466c + " has 0 spawns in " + var_157d3ed7df0faca7 + "<unknown string>");
        for (i = 0; i < var_157d3ed7df0faca7; i++) {
            debug_print("<unknown string>" + i + 1 + "<unknown string>" + var_ca2c833762e5466c);
            results = function_39432dc2e39e328a(var_ca2c833762e5466c, 3);
            println(results.size);
            spawns = array_combine(spawns, results);
            waitframe();
        }
        function_4af2c94919958f2e(var_ca2c833762e5466c, spawns, var_157d3ed7df0faca7);
    #/
}

// Namespace namespace_441f403fa28b7819/namespace_7052decdced06e44
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x541c
// Size: 0x32f
function private function_4af2c94919958f2e(var_ca2c833762e5466c, spawns, var_9c15d8194b83aac) {
    /#
        var_b91e03dbefa9360 = [];
        maxcount = 0;
        foreach (spawn in spawns) {
            if (array_contains_key(var_b91e03dbefa9360, spawn)) {
                count = var_b91e03dbefa9360[spawn] + 1;
                var_b91e03dbefa9360[spawn] = count;
                if (count > maxcount) {
                    maxcount = count;
                }
            } else {
                var_b91e03dbefa9360[spawn] = 1;
            }
        }
        var_9acc94e86eecaf7a = maxcount;
        foreach (count in var_b91e03dbefa9360) {
            if (count < var_9acc94e86eecaf7a) {
                var_9acc94e86eecaf7a = count;
            }
        }
        var_f9b6dedd4ffef774 = maxcount - var_9acc94e86eecaf7a;
        foreach (index in level.var_be6fec030b2f8e04.indexes) {
            origin = function_53c4c53197386572(level.var_be6fec030b2f8e04.structs[index].origin, (0, 0, 0));
            angles = function_53c4c53197386572(level.var_be6fec030b2f8e04.structs[index].angles, (0, 0, 0));
            if (array_contains_key(var_b91e03dbefa9360, index) && var_b91e03dbefa9360[index] > 0) {
                count = var_b91e03dbefa9360[index];
                if (var_f9b6dedd4ffef774) {
                    colorfrac = (count - var_9acc94e86eecaf7a) / var_f9b6dedd4ffef774;
                } else {
                    colorfrac = 1;
                }
                if (colorfrac < 0.25) {
                    color = (0, colorfrac / 0.25, 1);
                } else if (colorfrac < 0.5) {
                    colorfrac = colorfrac - 0.25;
                    color = (0, 1, 1 - colorfrac / 0.25);
                } else if (colorfrac < 0.75) {
                    colorfrac = colorfrac - 0.5;
                    color = (colorfrac / 0.25, 1, 0);
                } else {
                    colorfrac = colorfrac - 0.75;
                    color = (1, 1 - colorfrac / 0.25, 0);
                }
                function_fd78bc2f959fe5cc(index + "<unknown string>" + var_b91e03dbefa9360[index] + "<unknown string>", origin, angles, color);
            } else {
                debug_print("<unknown string>" + index + "<unknown string>" + var_9c15d8194b83aac + "<unknown string>" + var_ca2c833762e5466c);
                function_fd78bc2f959fe5cc(index + "<unknown string>", origin, angles, (1, 1, 1));
            }
        }
        level.var_be6fec030b2f8e04.drawcount++;
    #/
}

