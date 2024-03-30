// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\utility.gsc;
#using script_57d3850a12cf1d8f;
#using scripts\engine\scriptable_door.gsc;
#using script_12668187dcf15b96;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;
#using script_d09ad38bcf5794b;
#using script_3113b52a395cd586;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_2b6fc7c256cafc0;

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x235
// Size: 0x7a
function init() {
    if (!isdefined(level.exgm)) {
        level.exgm = spawnstruct();
    }
    namespace_58dcf42cf567f34f::init();
    scripts/engine/scriptable_door::function_29ba88e5ce21f3fd(&function_6416fb9a24d278b4);
    scripts/engine/scriptable_door::function_e37078f3d00ef312(&function_504f19b32802cb8d);
    while (!isdefined(level.tool_use) || !istrue(level.tool_use.init)) {
        waitframe();
    }
    function_b2eb3fc6ccae115e();
    /#
        level thread debug_doors();
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2b6
// Size: 0x138
function private function_b2eb3fc6ccae115e() {
    if (isdefined(level.exgm) && isdefined(level.exgm.lockedspaces)) {
        /#
            assertmsg("br_exgm_door::initLockedSpaces: Is this function called twice?");
        #/
        return;
    }
    level.exgm.lockedspaces = [];
    var_4c7bfe49f37e4faf = getstructarray("exgm_locked_space", "script_noteworthy");
    /#
        assert(isdefined(var_4c7bfe49f37e4faf));
    #/
    if (var_4c7bfe49f37e4faf.size <= 0) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        function_656d643079457017(var_4c7bfe49f37e4faf);
    #/
    var_52e1498c41df1407 = function_39c8d8e7c1719ed4(var_4c7bfe49f37e4faf);
    if (!isdefined(var_52e1498c41df1407)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    foreach (node in var_52e1498c41df1407) {
        if (!isdefined(node)) {
            continue;
        }
        node function_4f241614c981db96();
        level.exgm.lockedspaces[level.exgm.lockedspaces.size] = node;
    }
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f5
// Size: 0x13c
function private function_39c8d8e7c1719ed4(var_4c7bfe49f37e4faf) {
    if (getdvarint(@"hash_e87cee823579fbd8", 0) == 1) {
        return var_4c7bfe49f37e4faf;
    }
    hotzones = function_1363930cb3f53aef();
    if (!isdefined(hotzones)) {
        return undefined;
    }
    var_7c28d6d15ff7e61e = [];
    foreach (hotzone in hotzones) {
        if (!isdefined(hotzone)) {
            continue;
        }
        zoneindex = hotzone.zoneindex;
        zonetype = hotzone.zonetype;
        if (!isdefined(zoneindex) || !isdefined(zonetype) || zonetype != 8) {
            continue;
        }
        mainnode = function_f6ca723a91bb41bf(zoneindex, var_4c7bfe49f37e4faf, var_7c28d6d15ff7e61e);
        if (!isdefined(mainnode)) {
            /#
                println("<unknown string>" + namespace_36be7f9eab6ca7bc::function_bf040858853b69df(zoneindex));
            #/
            continue;
        }
        /#
            mainnode.zoneindex = zoneindex;
            mainnode.zonename = function_aae8b5dc22c12d2c(zoneindex);
        #/
        var_7c28d6d15ff7e61e = array_add(var_7c28d6d15ff7e61e, mainnode);
    }
    return var_7c28d6d15ff7e61e;
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x539
// Size: 0xc6
function private function_f6ca723a91bb41bf(zoneindex, var_96ef5feafe62d6fa, excludenodes) {
    if (isdefined(zoneindex) && isdefined(var_96ef5feafe62d6fa)) {
        epsilon = 0.1;
        foreach (mainnode in var_96ef5feafe62d6fa) {
            if (!isdefined(mainnode) || isdefined(excludenodes) && array_contains(excludenodes, mainnode)) {
                continue;
            }
            var_3cbdb56ae84724e6 = function_c56aa54c03c6ff11(zoneindex, mainnode.origin);
            if (isdefined(var_3cbdb56ae84724e6) && var_3cbdb56ae84724e6 < epsilon) {
                return mainnode;
            }
        }
    }
    return undefined;
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x607
// Size: 0xcb
function private function_4f241614c981db96() {
    subnodes = getstructarray(self.target, "targetname");
    /#
        assert(isdefined(subnodes));
    #/
    foreach (node in subnodes) {
        if (!isdefined(node) || !isdefined(node.script_noteworthy) || !isdefined(node.origin)) {
            continue;
        }
        if (!isdefined(node.angles)) {
            node.angles = (0, 0, 0);
        }
        function_db053c578a9de360(node);
    }
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6d9
// Size: 0x8b
function private function_db053c578a9de360(subnode) {
    /#
        assert(isdefined(subnode));
    #/
    switch (tolower(subnode.script_noteworthy)) {
    case #"hash_8f30172a5213bf0a":
        function_7ed146ec8f255585(subnode);
        break;
    case #"hash_9c365061f1e6f507":
        function_d2d0c9d710b1d69d(subnode);
        break;
    case #"hash_f776ad1e72595fcb":
        setupcache(subnode);
        break;
    default:
        setupprop(subnode);
        break;
    }
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x76b
// Size: 0x90
function private setupcache(subnode) {
    /#
        assert(isdefined(subnode));
    #/
    if (!isdefined(self.caches)) {
        self.caches = [];
    }
    cache = spawnscriptable("cache_exgm_cache_crowbar_door", subnode.origin, subnode.angles);
    if (!isdefined(cache)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    cache.node = subnode;
    self.caches[self.caches.size] = cache;
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x802
// Size: 0xd3
function private function_d2d0c9d710b1d69d(subnode) {
    /#
        assert(isdefined(subnode));
    #/
    if (!isdefined(self.var_6c0ed674eec9b897)) {
        self.var_6c0ed674eec9b897 = [];
    }
    doors = scripts/cp_mp/utility/scriptable_door_utility::scriptable_door_get_in_radius(subnode.origin, 100, 100);
    if (isdefined(doors) && doors.size > 0) {
        foreach (door in doors) {
            if (!isdefined(door)) {
                continue;
            }
            door function_9af4c9b2cc1bf989();
            door.var_d9169fc096165e2b = 1;
            self.var_6c0ed674eec9b897[self.var_6c0ed674eec9b897.size] = door;
        }
    }
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8dc
// Size: 0x77
function private setupprop(subnode) {
    /#
        assert(isdefined(subnode));
    #/
    if (!isdefined(self.props)) {
        self.props = [];
    }
    prop = namespace_92675a37bd817c19::function_c682e2b1b49deb8f(subnode);
    if (!isdefined(prop)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    prop.node = subnode;
    self.props[self.props.size] = prop;
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x95a
// Size: 0x131
function function_95faa2e34b9a63a9(subnode, var_9b044ef6110bc60f) {
    if (!isdefined(subnode) || !isdefined(subnode.origin) || !isdefined(subnode.angles)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!isdefined(var_9b044ef6110bc60f)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    doors = scripts/cp_mp/utility/scriptable_door_utility::scriptable_door_get_in_radius(subnode.origin, 100, 100);
    if (isdefined(doors) && doors.size > 0) {
        foreach (door in doors) {
            if (!isdefined(door) || door scriptabledoorisdouble()) {
                continue;
            }
            door setscriptablepartstate("door", "invisible");
        }
    }
    spawneddoor = spawnscriptable(var_9b044ef6110bc60f, subnode.origin, subnode.angles);
    /#
        if (!isdefined(spawneddoor)) {
            println("<unknown string>" + var_9b044ef6110bc60f);
        }
    #/
    return spawneddoor;
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa93
// Size: 0xad
function private function_7ed146ec8f255585(subnode) {
    /#
        assert(isdefined(subnode));
    #/
    /#
        assert(isdefined(subnode.origin));
    #/
    /#
        assert(isdefined(subnode.angles));
    #/
    if (!isdefined(self.tooldoors)) {
        self.tooldoors = [];
    }
    newdoor = function_95faa2e34b9a63a9(subnode, "scriptable_door_exgm_tool_use");
    if (isdefined(newdoor)) {
        newdoor.node = subnode;
        newdoor.var_12669c62db1142f2 = 1;
        newdoor function_88d3ebef9894c114();
        self.tooldoors[self.tooldoors.size] = newdoor;
    }
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb47
// Size: 0xc
function private function_88d3ebef9894c114() {
    thread namespace_8a301a9e06bc923e::function_9c3bc425fad907df(self);
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb5a
// Size: 0x3c
function function_504f19b32802cb8d(scriptable, player, var_85e3240d30e184e7) {
    if (function_d9169fc096165e2b(scriptable) || function_12669c62db1142f2(scriptable)) {
        return 0;
    }
    return namespace_58dcf42cf567f34f::function_504f19b32802cb8d(scriptable, player, var_85e3240d30e184e7);
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb9e
// Size: 0x37
function function_6416fb9a24d278b4(scriptable, player) {
    if (function_d9169fc096165e2b(scriptable) || function_12669c62db1142f2(scriptable)) {
        return "MP_DMZ_LOCKS/LOCKED";
    }
    return namespace_58dcf42cf567f34f::function_6416fb9a24d278b4(scriptable, player);
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbdd
// Size: 0x1e
function private function_12669c62db1142f2(scriptable) {
    return isdefined(scriptable) && istrue(scriptable.var_12669c62db1142f2);
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc03
// Size: 0x1e
function private function_d9169fc096165e2b(scriptable) {
    return isdefined(scriptable) && istrue(scriptable.var_d9169fc096165e2b);
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc29
// Size: 0xab
function private function_77b38d54acb385f2(door, player) {
    /#
        assert(isdefined(door) && isdefined(player));
    #/
    var_1551eedc8effb6b6 = player.origin - door.origin;
    doorforward = anglestoforward(door.angles);
    crossz = doorforward[0] * var_1551eedc8effb6b6[1] - doorforward[1] * var_1551eedc8effb6b6[0];
    if (abs(crossz) < 0.1) {
        /#
            assertmsg("br_exgm_door: isPlayerOnLeftSideOfDoor - Is player standing at door origin? Returning false");
        #/
        return 0;
    }
    if (crossz > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb
// Size: 0xae
function debug_doors() {
    /#
        level endon("<unknown string>");
        while (true) {
            if (getdvarint(@"hash_6d2af0dd80a139a8", 0) == 1) {
                setdvar(@"hash_6d2af0dd80a139a8", 0);
                level thread function_b314668b145fe144();
            }
            if (getdvarint(@"hash_a1ffbba0cca4a8be", 0) == 1) {
                setdvar(@"hash_a1ffbba0cca4a8be", 0);
                level thread function_5808f7179c6a8a9d();
            }
            if (getdvarint(@"hash_7314da8a381200a3", 0) == 1) {
                level thread function_8e69a7b58eeff341();
            }
            if (getdvarint(@"hash_18d9381f047d4e0f", 0) == 1) {
                level thread function_bd85f751464c186d();
            }
            waitframe();
        }
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd90
// Size: 0x170
function function_b314668b145fe144() {
    /#
        var_34c03e07a8e8888 = [];
        foreach (var_809fdff7726141bb in level.exgm.lockedspaces) {
            if (!isdefined(var_809fdff7726141bb)) {
                continue;
            }
            foreach (door in var_809fdff7726141bb.tooldoors) {
                if (isdefined(door) && !isdefined(door.tool_user)) {
                    var_34c03e07a8e8888[var_34c03e07a8e8888.size] = door;
                }
            }
        }
        foreach (door in var_34c03e07a8e8888) {
            door scriptabledoorclose();
        }
        wait(2);
        foreach (door in var_34c03e07a8e8888) {
            door function_88d3ebef9894c114();
        }
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf07
// Size: 0x145
function function_5808f7179c6a8a9d() {
    /#
        subnode = spawnstruct();
        subnode.angles = level.players[0].angles;
        subnode.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 50;
        subnode.origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(subnode.origin, 100, -100);
        mainnode = spawnstruct();
        mainnode.target = "<unknown string>";
        mainnode.origin = subnode.origin + (0, 0, 100);
        mainnode.zonename = "<unknown string>";
        mainnode.var_d7204dbfcf3540cb = [];
        mainnode.var_d7204dbfcf3540cb[0] = subnode;
        function_7c1bf24c78f1b6db(mainnode);
        mainnode function_7ed146ec8f255585(subnode);
        level.exgm.lockedspaces[level.exgm.lockedspaces.size] = mainnode;
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1053
// Size: 0x5c
function function_656d643079457017(mainnodes) {
    /#
        foreach (node in mainnodes) {
            function_7c1bf24c78f1b6db(node);
        }
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b6
// Size: 0x9c
function function_7c1bf24c78f1b6db(mainnode) {
    /#
        if (!isdefined(mainnode)) {
            return;
        }
        if (!isdefined(level.exgm.var_1d27449e146df7c5)) {
            level.exgm.var_1d27449e146df7c5 = [];
        }
        if (!isdefined(mainnode.var_d7204dbfcf3540cb)) {
            mainnode.var_d7204dbfcf3540cb = getstructarray(mainnode.target, "<unknown string>");
        }
        level.exgm.var_1d27449e146df7c5[level.exgm.var_1d27449e146df7c5.size] = mainnode;
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1159
// Size: 0xd2
function function_8e69a7b58eeff341() {
    /#
        if (!isdefined(level.exgm.var_1d27449e146df7c5) || level.exgm.var_1d27449e146df7c5.size == 0) {
            return;
        }
        colorred = (1, 0, 0);
        colorgreen = (0, 1, 0);
        foreach (node in level.exgm.var_1d27449e146df7c5) {
            if (!isdefined(node)) {
                continue;
            }
            function_d4e7dd0e52999f80(node, colorred, colorgreen);
        }
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1232
// Size: 0xba
function function_bd85f751464c186d() {
    /#
        if (!isdefined(level.exgm.lockedspaces) || level.exgm.lockedspaces.size == 0) {
            return;
        }
        coloryellow = (1, 1, 0);
        foreach (node in level.exgm.lockedspaces) {
            if (!isdefined(node)) {
                continue;
            }
            function_d4e7dd0e52999f80(node, coloryellow, coloryellow);
        }
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12f3
// Size: 0x197
function function_d4e7dd0e52999f80(mainnode, var_d785d83def2cb406, var_17b0e0732d31c8fb) {
    /#
        if (!isdefined(mainnode.target) || !isdefined(mainnode.origin)) {
            return;
        }
        debugtextoffset = (0, 0, -20);
        debugcircleradius = 15;
        var_51a809d1653be858 = (0, 0, -10);
        var_d785d83def2cb406 = ter_op(isdefined(var_d785d83def2cb406), var_d785d83def2cb406, (1, 0, 0));
        var_17b0e0732d31c8fb = ter_op(isdefined(var_17b0e0732d31c8fb), var_17b0e0732d31c8fb, (1, 0, 0));
        var_f1faf36202ac327f = 1000;
        sphere(mainnode.origin, var_f1faf36202ac327f, var_d785d83def2cb406);
        function_203964a4bdac9656(mainnode, "<unknown string>", undefined, var_d785d83def2cb406, mainnode.origin + debugtextoffset, var_51a809d1653be858);
        subnodes = [];
        subnodes = mainnode.var_d7204dbfcf3540cb;
        if (!isdefined(subnodes) || !isarray(subnodes) || subnodes.size == 0) {
            return;
        }
        foreach (node in subnodes) {
            if (!isdefined(node)) {
                continue;
            }
            function_203964a4bdac9656(node, "<unknown string>", mainnode, var_17b0e0732d31c8fb, node.origin + debugtextoffset, var_51a809d1653be858);
        }
    #/
}

// Namespace namespace_2b6fc7c256cafc0 / namespace_74c5cf8e20fcae83
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1491
// Size: 0x2dd
function function_203964a4bdac9656(node, nodename, mainnode, debugcolor, var_5f7a6434de19ecb, var_51a809d1653be858) {
    /#
        if (!isdefined(node) || !isdefined(node.origin)) {
            return;
        }
        var_240b001b02e3191f = 15;
        sphere(node.origin, var_240b001b02e3191f, debugcolor);
        if (isdefined(mainnode) && isdefined(mainnode.origin) && mainnode != node) {
            thread draw_line_for_time(node.origin, mainnode.origin, debugcolor[0], debugcolor[1], debugcolor[2], level.framedurationseconds);
        }
        if (isdefined(nodename)) {
            debugtext = nodename + "<unknown string>";
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
        debugtext = "<unknown string>" + node.origin[0] + "<unknown string>" + node.origin[1] + "<unknown string>" + node.origin[2] + "<unknown string>";
        print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
        var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        if (isdefined(node.angles)) {
            debugtext = "<unknown string>" + node.angles[0] + "<unknown string>" + node.angles[1] + "<unknown string>" + node.angles[2] + "<unknown string>";
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
        if (isdefined(node.zoneindex)) {
            debugtext = "<unknown string>" + node.zoneindex;
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
        if (isdefined(node.zonename)) {
            debugtext = "<unknown string>" + node.zonename;
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
        if (isdefined(node.target)) {
            debugtext = "<unknown string>" + node.target;
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
        if (isdefined(node.targetname)) {
            debugtext = "<unknown string>" + node.targetname;
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
        if (isdefined(node.script_noteworthy)) {
            debugtext = "<unknown string>" + node.script_noteworthy;
            print3d(var_5f7a6434de19ecb, debugtext, debugcolor, 1, 1);
            var_5f7a6434de19ecb = var_5f7a6434de19ecb + var_51a809d1653be858;
        }
    #/
}

