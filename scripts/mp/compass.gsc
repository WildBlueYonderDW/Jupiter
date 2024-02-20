// mwiii decomp prototype
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace compass;

// Namespace compass/namespace_3e528bdeb387613a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x7cb
function setupminimap(material, var_11f306b80ae0c39e, var_3b70dd7d0d5b9a8) {
    requiredmapaspectratio = getdvarfloat(@"hash_24d7dc1cc026a63b", 1);
    var_aba6558851409d7d = function_79404c2fcca1c184();
    if (isdefined(var_aba6558851409d7d) && isdefined(var_aba6558851409d7d.var_cea11b0bd8f76b2d)) {
        foreach (var_542076377ecb3d6c in var_aba6558851409d7d.var_cea11b0bd8f76b2d) {
            if (var_542076377ecb3d6c.gametype == namespace_cd0b2d039510b38d::getgametype()) {
                material = var_542076377ecb3d6c.var_bf768d8db892be1b;
            }
        }
    }
    if (!isdefined(material)) {
        material = "";
    }
    if (!isdefined(var_11f306b80ae0c39e)) {
        var_11f306b80ae0c39e = material;
    }
    corners = [];
    var_6d476f1dea7803bb = function_f159c10d5cf8f0b4("noent_volume_minimap", "classname");
    if (var_6d476f1dea7803bb.size > 0) {
        if (var_6d476f1dea7803bb.size != 1) {
            /#
                println("<unknown string>");
            #/
            return;
        }
        var_7640093a137c66ba = var_6d476f1dea7803bb[0] function_f69c3df4767470dc();
        corners[0] = spawn("script_origin", var_7640093a137c66ba[0]);
        corners[1] = spawn("script_origin", var_7640093a137c66ba[1]);
    } else {
        var_e8972ba2455ea052 = getentarray("minimap_corner", "targetname");
        var_9454b445960cb2a3 = namespace_cd0b2d039510b38d::getgametype() == "war";
        if (namespace_36f464722d326bbe::isdonetskmap() && !namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() && isdefined(level.var_2c81de0e95b02675)) {
            corners = [];
            switch (level.var_2c81de0e95b02675) {
            case #"hash_490db84e1b08c326":
                corners[0] = spawn("script_origin", (-29090, -7407, -52));
                corners[1] = spawn("script_origin", (-22443, -13974, -52));
                break;
            case #"hash_c0087eafd38b4fed":
                corners[0] = spawn("script_origin", (9791, 22530, 0));
                corners[1] = spawn("script_origin", (17989, 14337, 0));
                break;
            case #"hash_a8b2bc3a349f425d":
                corners[0] = spawn("script_origin", (-17723, 13495, 0));
                corners[1] = spawn("script_origin", (-8060, 3721, 0));
                break;
            default:
                /#
                    assertmsg("setupMiniMap(): Unknown map name for Magellan MP");
                #/
                return;
            }
        } else if (!var_9454b445960cb2a3 && isdefined(namespace_36f464722d326bbe::getlocaleid()) && !namespace_36f464722d326bbe::isdonetskmap()) {
            if (level.localeid != "locale_6") {
                corners = getcornersfromarray(var_e8972ba2455ea052, 1);
                if (corners.size != 2) {
                    corners = getcornersfromarray(var_e8972ba2455ea052, 0);
                }
            } else {
                corners = [];
                corners[0] = spawn("script_origin", (-1040, 12288, -136));
                corners[1] = spawn("script_origin", (44016, -32768, -136));
            }
            switch (namespace_cd0b2d039510b38d::getgametype()) {
            case #"hash_ca6516c10db2c95":
            case #"hash_7f9c384a34cc392f":
            case #"hash_c065cef60f38490a":
            case #"hash_eb5e5f470e0c1dc2":
            case #"hash_ec086b911c1011ec":
            case #"hash_fa50b0f6bd82e972":
                material = material + "_" + level.localeid;
                var_11f306b80ae0c39e = var_11f306b80ae0c39e + "_" + level.localeid;
                break;
            }
        } else if (namespace_36f464722d326bbe::isdonetskmap() || namespace_36f464722d326bbe::getmapname() == "mp_br_quarry") {
            corners = [];
            corners[0] = spawn("script_origin", (-65536, 86016, 5400));
            corners[1] = spawn("script_origin", (81920, -61440, -2048));
        } else {
            corners = getcornersfromarray(var_e8972ba2455ea052, 0);
        }
    }
    if (corners.size != 2) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    corner0 = (corners[0].origin[0], corners[0].origin[1], 0);
    corner1 = (corners[1].origin[0], corners[1].origin[1], 0);
    cornerdiff = corner1 - corner0;
    north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
    if (var_6d476f1dea7803bb.size > 0) {
        north = (cos(var_6d476f1dea7803bb[0].angles[1]), sin(var_6d476f1dea7803bb[0].angles[1]), 0);
        function_148d3ec6861d8b59(var_6d476f1dea7803bb[0].angles[1]);
    }
    west = (0 - north[1], north[0], 0);
    if (vectordot(cornerdiff, west) > 0) {
        if (vectordot(cornerdiff, north) > 0) {
            northwest = corner1;
            southeast = corner0;
        } else {
            side = vecscale(north, vectordot(cornerdiff, north));
            northwest = corner1 - side;
            southeast = corner0 + side;
        }
    } else if (vectordot(cornerdiff, north) > 0) {
        side = vecscale(north, vectordot(cornerdiff, north));
        northwest = corner0 + side;
        southeast = corner1 - side;
    } else {
        northwest = corner0;
        southeast = corner1;
    }
    if (requiredmapaspectratio > 0) {
        var_9f72e62e262287df = vectordot(northwest - southeast, north);
        var_755d4c721ecb6165 = vectordot(northwest - southeast, west);
        mapaspectratio = var_755d4c721ecb6165 / var_9f72e62e262287df;
        if (mapaspectratio < requiredmapaspectratio) {
            incr = requiredmapaspectratio / mapaspectratio;
            addvec = vecscale(west, var_755d4c721ecb6165 * (incr - 1) * 0.5);
        } else {
            incr = mapaspectratio / requiredmapaspectratio;
            addvec = vecscale(north, var_9f72e62e262287df * (incr - 1) * 0.5);
        }
        northwest = northwest + addvec;
        southeast = southeast - addvec;
    }
    corners[0].origin = northwest;
    corners[1].origin = southeast;
    level.mapsize = vectordot(northwest - southeast, north);
    level.mapcorners = corners;
    level.mapcorners[0].angles = generateaxisanglesfromforwardvector(vectornormalize(level.mapcorners[1].origin - level.mapcorners[0].origin), (0, 0, 1));
    level.mapcorners[0] addyaw(45);
    level.mapcorners[1].angles = generateaxisanglesfromforwardvector(vectornormalize(level.mapcorners[0].origin - level.mapcorners[1].origin), (0, 0, 1));
    level.mapcorners[1] addyaw(45);
    if (!isdefined(var_3b70dd7d0d5b9a8) || var_3b70dd7d0d5b9a8 < 1) {
        var_3b70dd7d0d5b9a8 = 1;
    }
    /#
        level.var_1a316f3d164a8e19 = material;
    #/
    setminimap(material, northwest[0], northwest[1], southeast[0], southeast[1], var_3b70dd7d0d5b9a8, var_11f306b80ae0c39e);
}

// Namespace compass/namespace_3e528bdeb387613a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x957
// Size: 0x26
function vecscale(vec, scalar) {
    return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

// Namespace compass/namespace_3e528bdeb387613a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x985
// Size: 0x119
function getcornersfromarray(array, var_c6f1388c16a82062) {
    corners = [];
    if (var_c6f1388c16a82062) {
        foreach (corner in array) {
            if (isdefined(corner.script_noteworthy) && corner.script_noteworthy == level.localeid) {
                corners[corners.size] = corner;
            }
        }
    } else {
        foreach (corner in array) {
            if (!isdefined(corner.script_noteworthy) || isdefined(corner.script_noteworthy) && !issubstr(corner.script_noteworthy, "locale")) {
                corners[corners.size] = corner;
            }
        }
    }
    return corners;
}

// Namespace compass/namespace_3e528bdeb387613a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa6
// Size: 0x63
function function_fb7bad834ce4b28c(var_89abf67ede66ecc) {
    self setclientomnvar("ui_minimap_floor", var_89abf67ede66ecc);
    map_name = tolower(getdvar(@"hash_ef237da69bb64ef6"));
    minimap_image = "compass_map_" + map_name + "_floor_" + var_89abf67ede66ecc;
    self.var_109a3bfd035f27be = var_89abf67ede66ecc;
    setupminimap(minimap_image);
}

