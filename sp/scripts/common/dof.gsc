#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace dof;

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x23a
function function_9030ff462f3daa1a() {
    version = getbuildversion();
    if (version == "SHIP") {
        return;
    }
    dvarclientnum = @"hash_7dc7c389e33f9f1c";
    setdvarifuninitialized(dvarclientnum, 0);
    dvarenable = @"hash_8ab43a47c4399064";
    setdvarifuninitialized(dvarenable, 0);
    var_37728f5d1856d25e = @"hash_d4c10f4069a2675f";
    setdvarifuninitialized(var_37728f5d1856d25e, 1.2);
    var_b8424bec9ba28117 = @"hash_20eee357db89fae8";
    setdvarifuninitialized(var_b8424bec9ba28117, 5);
    var_f2d0ba32b887ffdf = @"hash_39ab5edeb8210902";
    setdvarifuninitialized(var_f2d0ba32b887ffdf, 5);
    values = [];
    values[var_37728f5d1856d25e] = -1;
    values[var_b8424bec9ba28117] = -1;
    values[var_f2d0ba32b887ffdf] = -1;
    clientnum = -1;
    var_18d25e8c9f508a2b = 0;
    while (true) {
        wait 1;
        if (!getdvarint(dvarenable)) {
            if (var_18d25e8c9f508a2b) {
                var_18d25e8c9f508a2b = 0;
                level notify("stop_dyndof");
                level.dyndof.player disablephysicaldepthoffieldscripting();
            }
            continue;
        }
        if (utility::ismp() && getdvarint(dvarclientnum) != clientnum) {
            while (true) {
                clientnum = getdvarint(dvarclientnum);
                if (isdefined(function_cb47153207fc68d2(clientnum))) {
                    break;
                }
                waitframe();
            }
            function_db7bae3d5d2e993(function_cb47153207fc68d2(clientnum));
        }
        dvarchanged = 0;
        foreach (val in values) {
            if (val != getdvarfloat(dvar)) {
                dvarchanged = 1;
                break;
            }
        }
        if (dvarchanged || !var_18d25e8c9f508a2b) {
            fstop = getdvarfloat(var_37728f5d1856d25e);
            focusspeed = getdvarfloat(var_b8424bec9ba28117);
            aperturespeed = getdvarfloat(var_f2d0ba32b887ffdf);
            values[var_37728f5d1856d25e] = fstop;
            values[var_b8424bec9ba28117] = focusspeed;
            values[var_f2d0ba32b887ffdf] = aperturespeed;
            var_18d25e8c9f508a2b = 1;
            level thread function_c1f42ed707642a04(fstop, focusspeed, aperturespeed);
        }
    }
}

// Namespace dof / scripts\common\dof
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x49a
// Size: 0xa6
function private function_db7bae3d5d2e993(player) {
    if (!isdefined(level.dyndof)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    level.dyndof notify("new_player");
    if (isdefined(level.dyndof.player)) {
        level.dyndof.player disablephysicaldepthoffieldscripting();
        player enablephysicaldepthoffieldscripting();
    }
    level.dyndof.player = player;
    level.dyndof.ignorelist = [player];
    if (utility::ismp()) {
        thread function_bee71193bca6c80c();
    }
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x548
// Size: 0xaf
function private function_bee71193bca6c80c() {
    level.dyndof endon("new_player");
    level.dyndof.player endon("disconnected");
    while (true) {
        level.dyndof.player waittill("death");
        if (!isdefined(level.dyndof.player)) {
            return;
        }
        level.dyndof.player waittill("spawned");
        if (!isdefined(level.dyndof.player)) {
            return;
        }
        level.dyndof.player enablephysicaldepthoffieldscripting();
    }
}

// Namespace dof / scripts\common\dof
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ff
// Size: 0x62
function private function_cb47153207fc68d2(num) {
    foreach (player in level.players) {
        if (player getentitynumber() == num) {
            return player;
        }
    }
    return undefined;
}

// Namespace dof / scripts\common\dof
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x66a
// Size: 0x5a
function function_c7a153413fa65e8d(fstop, focusspeed, aperturespeed) {
    level.dyndof.fstop = fstop;
    level.dyndof.focusspeed = focusspeed;
    level.dyndof.aperturespeed = aperturespeed;
}

// Namespace dof / scripts\common\dof
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6cc
// Size: 0x21b
function function_c1f42ed707642a04(fstop, focusspeed, aperturespeed) {
    if (isdefined(level.dyndof)) {
        function_c7a153413fa65e8d(fstop, focusspeed, aperturespeed);
        return;
    }
    assertex(isdefined(fstop), "fStop not defined.");
    if (!isdefined(focusspeed)) {
        focusspeed = 1;
    }
    if (!isdefined(aperturespeed)) {
        aperturespeed = 2;
    }
    level notify("stop_dyndof");
    /#
        setdvarifuninitialized(@"hash_ad68aff4b57edc12", 0);
    #/
    if (!flag_exist("dyndofexp_disable")) {
        flag_init("dyndofexp_disable");
    }
    if (isdefined(level.dyndof)) {
        level.dyndof = undefined;
        level notify("stop_dyndof");
    }
    level.dyndof = function_4a2ce820849a53f7();
    function_c7a153413fa65e8d(fstop, focusspeed, aperturespeed);
    level.dyndof.var_a94780cfbefad9ce = -1;
    level.dyndof.var_a28a7e3e13fa8c7f = 3.5;
    level.dyndof.var_e44cd1048efcca59 = 30;
    level.dyndof.var_e429e3048ed6aa37 = 72;
    level.dyndof.var_21146c5c5d706cbe = focusspeed * 5;
    level.dyndof.var_cfbd6dc46c776a0a = 30;
    level.dyndof.var_cfe077c46c9dc7c0 = 72;
    level.dyndof.var_d453b380dfd6161d = 0;
    level.dyndof.issp = utility::issp();
    if (level.dyndof.issp) {
        setsaveddvar(@"hash_62c917f9692eb820", 1);
        function_db7bae3d5d2e993(level.player);
    } else {
        function_db7bae3d5d2e993(function_cb47153207fc68d2(getdvarint(@"hash_7dc7c389e33f9f1c")));
    }
    level.dyndof.player enablephysicaldepthoffieldscripting();
    function_8ec129ee5a53f0bc();
    function_50c7801fc0abbd3a();
    level thread function_91d67d689e8a5ac5();
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ef
// Size: 0x86
function function_4a2ce820849a53f7() {
    struct = spawnstruct();
    struct.maxfocusdist = 50000;
    struct.contents = function_121b9c1e3a5664af();
    struct.var_e00802ad31e19ee4 = function_e7a3f680f309a5a();
    struct.traceangle = 3;
    struct.prevangles = (0, 0, 0);
    struct.prevorigin = (0, 0, 0);
    return struct;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97e
// Size: 0x53
function function_121b9c1e3a5664af() {
    contents = ["physicscontents_ainoshoot", "physicscontents_clipshot", "physicscontents_item", "physicscontents_solid", "physicscontents_vehicle", "physicscontents_water", "physicscontents_characterproxy"];
    return physics_createcontents(contents);
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9da
// Size: 0x4a
function function_e7a3f680f309a5a() {
    contents = ["physicscontents_ainoshoot", "physicscontents_clipshot", "physicscontents_item", "physicscontents_solid", "physicscontents_vehicle", "physicscontents_water"];
    return physics_createcontents(contents);
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2d
// Size: 0x318
function function_91d67d689e8a5ac5() {
    level endon("stop_dyndof");
    var_eb2609c9a7a036f = gettime() + 500;
    currentplayerfov = level.dyndof.var_d453b380dfd6161d;
    setdvarifuninitialized(@"hash_9f25a07838d65086", 1);
    var_d6656715a63c5ac = 0;
    while (true) {
        if (flag("dyndofexp_disable") || !getdvarint(@"hash_9f25a07838d65086")) {
            if (!var_d6656715a63c5ac) {
                var_d6656715a63c5ac = 1;
                level.dyndof.player disablephysicaldepthoffieldscripting();
            }
            wait 0.5;
            continue;
        }
        if (var_d6656715a63c5ac) {
            level.dyndof.player enablephysicaldepthoffieldscripting();
            var_d6656715a63c5ac = 0;
        }
        if (!isdefined(level.dyndof.player)) {
            wait 0.5;
            continue;
        }
        if (gettime() > var_eb2609c9a7a036f) {
            var_eb2609c9a7a036f = gettime() + 500;
            function_8ec129ee5a53f0bc();
            currentplayerfov = level.dyndof.var_d453b380dfd6161d;
        }
        object = function_ddd1e6b7bd85c6d1();
        if (getdvarint(@"hash_ad68aff4b57edc12", 0)) {
            /#
                line(level.dyndof.player.origin, object.origin, (0, 0.7, 0));
            #/
        }
        if (object.dofdist < level.dyndof.var_e429e3048ed6aa37) {
            frac = math::normalize_value(level.dyndof.var_e44cd1048efcca59, level.dyndof.var_e429e3048ed6aa37, object.dofdist);
            fstop = math::lerp(level.dyndof.var_a28a7e3e13fa8c7f, level.dyndof.fstop, frac);
        } else {
            fstop = level.dyndof.fstop;
        }
        if (object.dofdist < level.dyndof.var_cfe077c46c9dc7c0) {
            frac = math::normalize_value(level.dyndof.var_cfbd6dc46c776a0a, level.dyndof.var_cfe077c46c9dc7c0, object.dofdist);
            focusspeed = math::lerp(level.dyndof.var_21146c5c5d706cbe, level.dyndof.focusspeed, frac);
        } else {
            focusspeed = level.dyndof.focusspeed;
        }
        level.dyndof.player setphysicaldepthoffield(fstop, 1, focusspeed, level.dyndof.aperturespeed, object.origin);
        waitframe();
    }
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4d
// Size: 0x18b
function function_ddd1e6b7bd85c6d1() {
    self endon("death");
    playereyeorigin = function_7641c664cf37b604();
    playerviewangles = level.dyndof.player getplayerangles();
    level.dyndof.prevorigin = playereyeorigin;
    level.dyndof.prevangles = playerviewangles;
    var_cab8f864ac7d1b1 = function_b23eb6ebe631ccdc(playereyeorigin, playerviewangles);
    if (getdvarint(@"hash_ad68aff4b57edc12") == 3) {
        var_cab8f864ac7d1b1.var_ca6d02ada0248c95 = 0;
    }
    var_a3d92abc0bca4a49 = function_ac3ec9d38fd2434(playereyeorigin, playerviewangles);
    if (getdvarint(@"hash_ad68aff4b57edc12") == 4) {
        var_a3d92abc0bca4a49.dofscore = 0;
    }
    if (isdefined(var_a3d92abc0bca4a49) && var_a3d92abc0bca4a49.dofscore > var_cab8f864ac7d1b1.var_ca6d02ada0248c95) {
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                printtoscreen2d(10, 800 + 30, "<dev string:x1c>", (1, 1, 1), 1.5);
            #/
            /#
                sphere(var_a3d92abc0bca4a49.origin, 4, (1, 1, 1));
            #/
        }
        return var_a3d92abc0bca4a49;
    }
    if (getdvarint(@"hash_ad68aff4b57edc12")) {
        /#
            printtoscreen2d(10, 800 + 30, "<dev string:x29>", (1, 1, 1), 1.5);
        #/
    }
    return var_cab8f864ac7d1b1;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee0
// Size: 0x29b
function function_8ec129ee5a53f0bc() {
    basefovdvar = getdvarint(@"hash_b38fcf293d1e91a8");
    if (getdvarint(@"hash_b38fcf293d1e91a8") == level.dyndof.var_d453b380dfd6161d) {
        return;
    }
    x_segments = 8;
    y_segments = 4;
    angle = basefovdvar * 0.6 / x_segments;
    level.dyndof.var_d453b380dfd6161d = basefovdvar;
    var_801c42d2e14b7c0c = angle * x_segments * -1;
    var_6b84c5404b57e175 = angle * y_segments * -1;
    var_c57c437404405a37 = x_segments * 2;
    var_4c1dec663db42f82 = y_segments * 2;
    var_2b9e8bc3be1dbd7e[0][0] = 0;
    minvalue = 12000;
    maxvalue = 0;
    for (x = 0; x < var_c57c437404405a37 + 1; x++) {
        for (y = 0; y < var_4c1dec663db42f82 + 1; y++) {
            struct = spawnstruct();
            struct.var_f85ab554f9f088c8 = (y * angle + var_6b84c5404b57e175, x * angle + var_801c42d2e14b7c0c, 0);
            var_2b9e8bc3be1dbd7e[x][y] = struct;
            centerscore = x_segments - abs(x_segments - x) + y_segments - abs(y_segments - y);
            struct.centerscale = exp(centerscore * 1);
            if (struct.centerscale > maxvalue) {
                maxvalue = struct.centerscale;
                continue;
            }
            if (struct.centerscale < minvalue) {
                minvalue = struct.centerscale;
            }
        }
    }
    level.dyndof.var_e2a735ff704c61aa = var_2b9e8bc3be1dbd7e[x_segments][y_segments];
    foreach (x, array in var_2b9e8bc3be1dbd7e) {
        foreach (y, struct in array) {
            struct.centerscale = math::normalize_value(minvalue, maxvalue, struct.centerscale) * 10;
        }
    }
    level.dyndof.tracestructs = var_2b9e8bc3be1dbd7e;
}

// Namespace dof / scripts\common\dof
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1183
// Size: 0x4d5
function function_b23eb6ebe631ccdc(playereyeorigin, playerviewangles) {
    traces = [];
    distances = 0;
    closeststruct = undefined;
    foreach (array in level.dyndof.tracestructs) {
        foreach (struct in array) {
            struct.trace = function_77d9a6389a3305ee(playereyeorigin, playerviewangles, struct.var_f85ab554f9f088c8);
            struct.origin = struct.trace["position"];
            struct.dofdist = distance(playereyeorigin, struct.origin);
            distances += struct.dofdist;
            if (!isdefined(closeststruct)) {
                closeststruct = struct;
                continue;
            }
            if (struct.dofdist < closeststruct.dofdist) {
                closeststruct = struct;
            }
        }
    }
    level.dyndof.var_1fef56bc059b6f9a = closeststruct;
    groupscores = [];
    groupcount = [];
    foreach (x, array in level.dyndof.tracestructs) {
        foreach (y, struct in array) {
            div = abs(closeststruct.dofdist - struct.dofdist) / 30;
            if (div > 6) {
                div = 6;
            }
            struct.groupnum = int(max(div, 1));
            groupscale = 1 + math::normalize_value(0, 7, 7 - struct.groupnum);
            struct.dofscore = int(groupscale * struct.centerscale * 10);
            if (!isdefined(groupscores[struct.groupnum])) {
                groupscores[struct.groupnum] = 0;
                groupcount[struct.groupnum] = 0;
            }
            groupscores[struct.groupnum] = groupscores[struct.groupnum] + struct.dofscore;
            groupcount[struct.groupnum]++;
        }
    }
    keys = getarraykeys(groupscores);
    highestgroup = groupscores[keys[0]];
    var_2f61b87587e59816 = keys[0];
    foreach (var_37a3b21ee1ebea60 in groupscores) {
        if (highestgroup < var_37a3b21ee1ebea60) {
            highestgroup = var_37a3b21ee1ebea60;
            var_2f61b87587e59816 = index;
        }
    }
    highestscore = 0;
    beststruct = undefined;
    foreach (array in level.dyndof.tracestructs) {
        foreach (struct in array) {
            if (struct.groupnum != var_2f61b87587e59816) {
                continue;
            }
            if (struct.dofscore > highestscore) {
                highestscore = struct.dofscore;
                beststruct = struct;
            }
        }
    }
    if (!isdefined(beststruct)) {
        beststruct = level.dyndof.var_e2a735ff704c61aa;
    }
    if (getdvarint(@"hash_ad68aff4b57edc12")) {
        /#
            printtoscreen2d(10, 800 + 90, "<dev string:x3a>" + groupscores[beststruct.groupnum], (1, 1, 1), 1.5);
        #/
    }
    beststruct.var_ca6d02ada0248c95 = groupscores[beststruct.groupnum];
    level thread function_abfbc195c3aac94c(playereyeorigin, var_2f61b87587e59816);
    return beststruct;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1661
// Size: 0x8c
function function_50c7801fc0abbd3a() {
    if (gettime() > level.dyndof.var_a94780cfbefad9ce) {
        level.dyndof.var_a94780cfbefad9ce = gettime() + 1000;
        level.dyndof.cosfov = cos(getdvarfloat(@"hash_b38fcf293d1e91a8"));
        level.dyndof.var_4cc8f2b112cadde0 = level.dyndof.cosfov * 50;
    }
}

// Namespace dof / scripts\common\dof
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16f5
// Size: 0xa77
function function_ac3ec9d38fd2434(playereyepos, playerangles) {
    ents = getaiarray();
    if (!level.dyndof.issp) {
        players = [];
        foreach (player in level.players) {
            if (player == level.dyndof.player) {
                continue;
            }
            players[players.size] = player;
        }
        ents = array_combine(ents, players);
    }
    if (isdefined(level.var_7fffa6c3f269ffc9)) {
        ents = array_combine(ents, [[ level.var_7fffa6c3f269ffc9 ]]());
    }
    ents = array_removeundefined(ents);
    foreach (ent in ents) {
        if (ent.classname != "script_model") {
            continue;
        }
        if (isdefined(ent.var_5cb5bea2f8851b21)) {
            continue;
        }
        substr = getsubstr(ent.model, 0, 5);
        if (substr == "body_") {
            ent.var_5cb5bea2f8851b21 = 1;
            continue;
        }
        ent.var_5cb5bea2f8851b21 = 0;
    }
    function_50c7801fc0abbd3a();
    playerforward = anglestoforward(playerangles);
    foreach (ent in ents) {
        ischaracter = 0;
        if (isai(ent) || isdefined(ent.var_5cb5bea2f8851b21) || isplayer(ent)) {
            ischaracter = 1;
        }
        ent.dofscore = 0;
        if (ischaracter && distancesquared(level.dyndof.player.origin, ent.origin) < 62500) {
            entorigin = function_41ae85dd67830a98(ent, playereyepos, playerforward);
        } else {
            entorigin = ent.origin + (0, 0, 60);
        }
        ent.doftraceorigin = entorigin;
        dot = function_ce15d73cabdc73a4(entorigin, playereyepos, playerforward);
        ent.dofdot = dot;
        if (dot > level.dyndof.cosfov) {
            ndot = math::normalize_value(level.dyndof.cosfov, 1, dot);
            score = pow(ndot, 15) * 1100;
            ent.dofscore += score;
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(entorigin + (0, 0, -5), "<dev string:x4d>" + score + "<dev string:x53>" + dot + "<dev string:x5b>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        }
        if (ent.dofscore == 0) {
            continue;
        }
        ent.dofdist = distance(entorigin, playereyepos);
        if (ent.dofdist < 2000) {
            if (ent.dofdist < 200) {
                frac = ent.dofdist / 200;
                distscore = 100 + 300 * pow(1 - frac, 2);
                ent.dofscore += distscore;
            } else {
                frac = ent.dofdist / 2000;
                distscore = 100 * (1 - frac);
                ent.dofscore += distscore;
            }
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(entorigin + (0, 0, -10), "<dev string:x5d>" + distscore + "<dev string:x64>" + ent.dofscore + "<dev string:x5b>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        } else {
            distscale = 2000 / ent.dofdist * 0.5;
            ent.dofscore *= distscale * 0.5;
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(entorigin + (0, 0, -10), "<dev string:x67>" + distscale + "<dev string:x64>" + ent.dofscore + "<dev string:x5b>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        }
        if (ent.dofscore > 0) {
            trace = scripts\engine\trace::ray_trace(playereyepos, entorigin, [ent, level.dyndof.player], level.dyndof.contents, 1);
            if (trace["fraction"] > 0.9) {
                scale = 1;
                ent.dofscore *= scale;
            } else {
                scale = 0;
                ent.dofscore = 0;
            }
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(entorigin + (0, 0, -15), "<dev string:x73>" + scale + "<dev string:x64>" + ent.dofscore + "<dev string:x5b>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        }
        ent.dofscore = int(ent.dofscore);
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                print3d(entorigin, ent.dofscore, (1, 1, 1), 1, 0.2);
            #/
        }
    }
    directents = [];
    var_6e2b9d3e75679206 = level.dyndof.issp;
    if (var_6e2b9d3e75679206) {
        foreach (ent in ents) {
            if (!isplayer(ent) && !isai(ent) && !isdefined(ent.var_5cb5bea2f8851b21)) {
                continue;
            }
            if (ent.dofscore > 0 && ent.dofdot > 0.9) {
                directents[directents.size] = ent;
                /#
                    if (getdvarint(@"hash_ad68aff4b57edc12")) {
                        cylinder(ent.origin, ent.origin + (0, 0, 70), 8, (0.5, 0.5, 0.5));
                    }
                #/
            }
        }
        directents = sortbydistance(directents, playereyepos);
    }
    bestscore = 80;
    bestscoreent = undefined;
    foreach (ent in ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (var_6e2b9d3e75679206 && (isai(ent) || isdefined(ent.var_5cb5bea2f8851b21)) && ent.dofscore > 0 && ent.dofdot > 0.99) {
            foreach (directent in directents) {
                if (directent == ent) {
                    continue;
                }
                if (directent.dofdist < ent.dofdist && function_7d02f8d29555766e(playereyepos, ent.doftraceorigin, directent.origin)) {
                    ent.dofscore = 0;
                    if (getdvarint(@"hash_ad68aff4b57edc12")) {
                        /#
                            print3d(ent.doftraceorigin + (0, 0, -20), "<dev string:x7a>", (1, 1, 1), 0.8, 0.2);
                        #/
                        /#
                            line(ent.origin, directent.origin, (1, 0, 0));
                        #/
                    }
                    break;
                }
            }
        }
        if (ent.dofscore > bestscore) {
            bestscoreent = ent;
            bestscore = ent.dofscore;
        }
    }
    struct = undefined;
    if (isdefined(bestscoreent)) {
        struct = spawnstruct();
        struct.origin = bestscoreent.origin;
        struct.dofscore = bestscoreent.dofscore;
        struct.origin = bestscoreent.doftraceorigin;
        struct.dofdist = bestscoreent.dofdist;
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                printtoscreen2d(10, 800 + 60, "<dev string:x8e>" + struct.dofscore, (1, 1, 1), 1.5);
            #/
        }
    }
    return struct;
}

// Namespace dof / scripts\common\dof
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2175
// Size: 0xe7
function function_41ae85dd67830a98(ent, playereyepos, playerforward) {
    extratags = ["j_spineupper"];
    closesttag = "tag_eye";
    closesttagorigin = ent gettagorigin(closesttag);
    closesttagdot = function_ce15d73cabdc73a4(closesttagorigin, playereyepos, playerforward);
    foreach (tag in extratags) {
        tagorigin = ent gettagorigin(tag);
        dot = function_ce15d73cabdc73a4(tagorigin, playereyepos, playerforward);
        if (dot > closesttagdot) {
            closesttagdot = dot;
            closesttag = tag;
            closesttagorigin = tagorigin;
        }
    }
    return closesttagorigin;
}

// Namespace dof / scripts\common\dof
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2265
// Size: 0x35
function function_ce15d73cabdc73a4(targetorigin, sourcepos, sourceforward) {
    normal = vectornormalize(targetorigin - sourcepos);
    return vectordot(sourceforward, normal);
}

// Namespace dof / scripts\common\dof
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x22a3
// Size: 0xb9
function function_77d9a6389a3305ee(playereyeorigin, playerangles, var_f85ab554f9f088c8, pos) {
    angles = combineangles(playerangles, var_f85ab554f9f088c8);
    if (!isdefined(pos)) {
        pos = playereyeorigin + anglestoforward(angles) * level.dyndof.maxfocusdist;
    }
    trace = physics_raycast(playereyeorigin, pos, level.dyndof.var_e00802ad31e19ee4, level.dyndof.ignorelist, 1, "physicsquery_closest", 1);
    if (!isdefined(trace) || trace.size == 0) {
        trace = scripts\engine\trace::internal_pack_default_trace(pos);
    } else {
        trace = trace[0];
    }
    return trace;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2365
// Size: 0xc4
function function_7641c664cf37b604() {
    if (level.dyndof.player islinked()) {
        linkedent = level.dyndof.player getlinkedparent();
        if (!isdefined(linkedent.dyndof_hastag)) {
            linkedent.dyndof_hastag = 0;
            if (isdefined(linkedent.model)) {
                if (hastag(linkedent.model, "tag_camera")) {
                    linkedent.dyndof_hastag = 1;
                }
            }
        }
        if (linkedent.dyndof_hastag) {
            return linkedent gettagorigin("tag_camera");
        }
    }
    return level.dyndof.player getvieworigin();
}

// Namespace dof / scripts\common\dof
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2432
// Size: 0x2b6
function function_abfbc195c3aac94c(playereyeorigin, highestgroup) {
    level notify("stop_dyndof_debug");
    level endon("stop_dyndof");
    level endon("stop_dyndof_debug");
    /#
        while (getdvarint(@"hash_ad68aff4b57edc12")) {
            closestpos = level.dyndof.var_1fef56bc059b6f9a.trace["<dev string:x9d>"];
            closestdist = level.dyndof.var_1fef56bc059b6f9a.dofdist;
            foreach (array in level.dyndof.tracestructs) {
                foreach (struct in array) {
                    if ((getdvarint(@"hash_ad68aff4b57edc12") == 2 || getdvarint(@"hash_ad68aff4b57edc12") == 4) && struct.groupnum != highestgroup) {
                        continue;
                    }
                    switch (struct.groupnum) {
                    case 0:
                        color = (0, 0.9, 0);
                        break;
                    case 1:
                        color = (0, 1, 1);
                        break;
                    case 2:
                        color = (1, 1, 0);
                        break;
                    case 3:
                        color = (1, 0.5, 0);
                        break;
                    case 4:
                        color = (1, 0, 0);
                        break;
                    default:
                        color = (1, 0, 1);
                        break;
                    }
                    print3d(struct.origin, struct.dofscore, (1, 1, 1), 0.7, 0.05);
                    function_28ac1e5f07cc8ea8(struct.trace["<dev string:x9d>"], color);
                }
            }
            radius = math::normalize_value(0, 3000, closestdist);
            radius *= 16;
            sphere(closestpos, radius, (1, 1, 0));
            waitframe();
        }
    #/
}

// Namespace dof / scripts\common\dof
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26f0
// Size: 0x79
function function_28ac1e5f07cc8ea8(pos, color) {
    range = 1;
    if (!isdefined(color)) {
        color = (1, 1, 1);
    }
    /#
        line(pos - (0, 0, range), pos + (0, 0, range), color, 1, 0);
        line(pos - (0, range, 0), pos + (0, range, 0), color, 1, 0);
        line(pos - (range, 0, 0), pos + (range, 0, 0), color, 1, 0);
    #/
}

// Namespace dof / scripts\common\dof
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2771
// Size: 0x161
function function_7d02f8d29555766e(start, end, actorpos) {
    raydir = vectornormalize(end - start);
    radius = 8;
    actorpos2 = actorpos + (0, 0, 70);
    cline = actorpos2 - actorpos;
    var_a4753fbd89ce084f = start - actorpos;
    var_e3516dba67d45efb = vectorcross(var_a4753fbd89ce084f, cline);
    var_424283857447cee9 = vectorcross(raydir, cline);
    var_9b2f6dd030cc1244 = vectordot(cline, cline);
    a = vectordot(var_424283857447cee9, var_424283857447cee9);
    b = 2 * vectordot(var_424283857447cee9, var_e3516dba67d45efb);
    c = vectordot(var_e3516dba67d45efb, var_e3516dba67d45efb) - radius * radius * var_9b2f6dd030cc1244;
    dist = b * b - 4 * a * c;
    if (dist < 0) {
        return false;
    }
    time = (b * -1 - sqrt(dist)) / 2 * a;
    if (time == length(end - start)) {
        return false;
    }
    if (time < 0) {
        return false;
    }
    intersection = start + raydir * time;
    return true;
}

// Namespace dof / scripts\common\dof
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x28db
// Size: 0x255
function dyndof(fstop, targetentity, focusspeed, aperturespeed, angles, var_387062334ab0e50e, ignorelist, ignorecollision, var_4a0992ce3ff1d7ea) {
    assertex(isdefined(fstop), "fStop not defined.");
    assertex(!isdefined(targetentity) || isent(targetentity), "targetEntity must be an entity or undefined");
    if (!isdefined(focusspeed)) {
        focusspeed = 1;
    }
    if (!isdefined(aperturespeed)) {
        aperturespeed = 2;
    }
    if (!isdefined(ignorecollision)) {
        ignorecollision = 0;
    }
    player = self;
    player notify("stop_dyndof");
    /#
        setdvarifuninitialized(@"hash_93ca035fa3964d3d", 0);
    #/
    if (utility::issp()) {
        setsaveddvar(@"hash_62c917f9692eb820", 1);
    }
    player enablephysicaldepthoffieldscripting();
    if (isdefined(player.dyndof)) {
        player.dyndof = player destroy_dyndof();
    }
    player.dyndof = create_dyndof();
    player.dyndof.fstop = fstop;
    player.dyndof.focusspeed = focusspeed;
    player.dyndof.aperturespeed = aperturespeed;
    if (isstring(var_387062334ab0e50e)) {
        player.dyndof.desiredbone = var_387062334ab0e50e;
    } else if (isvector(var_387062334ab0e50e)) {
        player.dyndof.desiredpos = var_387062334ab0e50e;
    } else if (isnumber(var_387062334ab0e50e)) {
        player.dyndof.desireddistance = var_387062334ab0e50e;
    }
    player.dyndof.ignorecollision = ignorecollision;
    player.dyndof.var_4a0992ce3ff1d7ea = var_4a0992ce3ff1d7ea;
    if (isdefined(ignorelist)) {
        player.dyndof.ignorelist = ignorelist;
    } else {
        player.dyndof.ignorelist = [player];
    }
    if (isdefined(angles)) {
        player.dyndof.traceangle = angles;
    }
    player thread dyndof_thread(targetentity);
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b38
// Size: 0x2d
function dyndof_disable() {
    player = self;
    player notify("stop_dyndof");
    player notify("stop_dyndof_debug");
    player disablephysicaldepthoffieldscripting();
    player destroy_dyndof();
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2b6d
// Size: 0x4e
function private function_a0bbe9bbf0848458() {
    if (self isplayingxcam()) {
        pos = self getxcamposition();
        ang = self function_ca5f70a20456c678();
        return [pos, ang];
    }
    return [self geteye(), self getgunangles()];
}

// Namespace dof / scripts\common\dof
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc4
// Size: 0x1e5
function dyndof_thread(targetentity) {
    player = self;
    if (isdefined(targetentity)) {
        targetentity endon("death");
    }
    level endon("stop_dyndof");
    player endon("stop_dyndof");
    while (true) {
        if (isdefined(player.dyndof.desiredpos) && player.dyndof.ignorecollision) {
            pos = player.dyndof.desiredpos;
        } else if (isdefined(player.dyndof.desireddistance) && player.dyndof.ignorecollision) {
            var_c0013e62498c366b = function_a0bbe9bbf0848458();
            ang = var_c0013e62498c366b[1];
            eye = var_c0013e62498c366b[0];
            pos = eye + anglestoforward(ang) * player.dyndof.desireddistance;
        } else {
            pos = player dyndof_distance(targetentity);
        }
        if (!isint(pos)) {
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(pos + (0, 0, 1.5), "<dev string:xa6>" + pos, (0, 1, 0), 1, 0.1, 1);
                    line(pos, pos - (0, 0, 1000), (0, 1, 0), 1, 1, 1);
                }
            #/
            player setphysicaldepthoffield(player.dyndof.fstop, 1, player.dyndof.focusspeed, player.dyndof.aperturespeed, pos);
        }
        waitframe();
    }
}

// Namespace dof / scripts\common\dof
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2db1
// Size: 0x872
function dyndof_distance(targetentity) {
    player = self;
    if (isdefined(targetentity)) {
        targetentity endon("death");
        closesttrace["entity"] = targetentity;
        if (isent(targetentity) && isdefined(targetentity.model)) {
            if (!isdefined(player.dyndof.bone)) {
                if (isdefined(player.dyndof.desiredbone)) {
                    bone = player.dyndof.desiredbone;
                } else {
                    bone = "tag_eye";
                }
                closesttrace["position"] = targetentity.origin;
                closesttrace["hittype"] = bone + " DOESN'T EXIST";
                pos = closesttrace["position"];
                closesttrace["hittype"] = bone + " DOESN'T EXIST";
                pos = closesttrace["position"];
                if (isdefined(targetentity.headmodel)) {
                    num_parts = getnumparts(targetentity.headmodel);
                    for (i = 0; i < num_parts; i++) {
                        if (getpartname(targetentity.headmodel, i) == bone) {
                            player.dyndof.bone = bone;
                            closesttrace["hittype"] = player.dyndof.bone;
                            closesttrace["position"] = targetentity gettagorigin(player.dyndof.bone);
                            pos = closesttrace["position"];
                            break;
                        }
                    }
                }
                if (isdefined(targetentity.attachedweaponmodels)) {
                    foreach (n, model in targetentity.attachedweaponmodels) {
                        num_parts = getnumparts(targetentity.attachedweaponmodels[n]);
                        for (i = 0; i < num_parts; i++) {
                            if (getpartname(targetentity.attachedweaponmodels[n], i) == bone) {
                                player.dyndof.bone = bone;
                                closesttrace["hittype"] = player.dyndof.bone;
                                closesttrace["position"] = targetentity gettagorigin(player.dyndof.bone);
                                pos = closesttrace["position"];
                                break;
                            }
                        }
                    }
                }
                num_parts = getnumparts(targetentity.model);
                for (i = 0; i < num_parts; i++) {
                    if (getpartname(targetentity.model, i) == bone) {
                        player.dyndof.bone = bone;
                        closesttrace["hittype"] = player.dyndof.bone;
                        closesttrace["position"] = targetentity gettagorigin(player.dyndof.bone);
                        pos = closesttrace["position"];
                        break;
                    }
                }
            } else {
                closesttrace["hittype"] = player.dyndof.bone;
                closesttrace["position"] = targetentity gettagorigin(player.dyndof.bone);
                pos = closesttrace["position"];
            }
        } else {
            closesttrace["hittype"] = "struct or no bones";
            closesttrace["position"] = targetentity.origin;
            pos = closesttrace["position"];
        }
        if (isdefined(player worldpointtoscreenpos(pos, getdvarint(@"hash_b38fcf293d1e91a8"))) && dyndof_trace_target(pos)) {
            if (player.dyndof.prevorigin == pos) {
                return -1;
            }
            player.dyndof.prevorigin = pos;
            /#
                player thread dyndof_debug(undefined, closesttrace);
            #/
            return closesttrace["position"];
        } else {
            if (istrue(player.dyndof.var_4a0992ce3ff1d7ea)) {
                var_c0014462498c439d = function_a0bbe9bbf0848458();
                ang = var_c0014462498c439d[1];
                player_eye_pos = var_c0014462498c439d[0];
                var_6e20e569f2c0df7f = pos - player_eye_pos;
                player_fwd = anglestoforward(ang);
                dot = vectordot(var_6e20e569f2c0df7f, player_fwd);
                if (dot > 0) {
                    var_92f914f8aed12f65 = player_eye_pos + player_fwd * dot;
                } else {
                    var_92f914f8aed12f65 = player_eye_pos;
                }
                /#
                    if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                        line(player.dyndof.prevorigin, var_92f914f8aed12f65, (1, 1, 1), 1, 1);
                        print3d(var_92f914f8aed12f65, "<dev string:xb4>", (1, 1, 1), 1, 0.1, 1, 1);
                        print3d(var_92f914f8aed12f65 + (0, 0, 2), "<dev string:xb8>", (1, 0, 0), 1, 0.1, 1);
                    }
                #/
                return var_92f914f8aed12f65;
            }
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(pos, "<dev string:xb4>", (1, 1, 1), 1, 0.1, 1, 1);
                    print3d(pos + (0, 0, 2), "<dev string:xeb>", (1, 0, 0), 1, 0.1, 1);
                }
            #/
        }
    }
    pos = dyndof_getplayerorigin();
    angles = dyndof_getplayerangles();
    if (player.dyndof.prevorigin == pos && player.dyndof.prevangles == angles) {
        if (!isdefined(player.dyndof.firstnomovetime)) {
            player.dyndof.firstnomovetime = gettime();
        } else if (gettime() - player.dyndof.firstnomovetime > 2000) {
            return -1;
        }
    } else {
        player.dyndof.firstnomovetime = undefined;
    }
    player.dyndof.prevorigin = pos;
    player.dyndof.prevangles = angles;
    angles = [];
    angle = player.dyndof.traceangle;
    angles[angles.size] = (angle * -1, 0, 0);
    angles[angles.size] = (0, angle, 0);
    angles[angles.size] = (0, angle * -1, 0);
    angles[angles.size] = (0, 0, 0);
    traces = [];
    foreach (index, a in angles) {
        if (isdefined(player.dyndof.desiredpos)) {
            trace = dyndof_trace_internal(a, player.dyndof.desiredpos);
        } else {
            trace = dyndof_trace_internal(a, undefined);
        }
        if (!isdefined(trace)) {
            continue;
        }
        traces[traces.size] = trace[0];
    }
    if (traces.size == 0) {
        player notify("stop_dyndof_debug");
        return (dyndof_getplayerorigin() + anglestoforward(dyndof_getplayerangles()) * player.dyndof.maxfocusdist);
    }
    index = 0;
    closesttrace = traces[index];
    for (i = 1; i < traces.size; i++) {
        if (traces[i]["fraction"] < closesttrace["fraction"]) {
            closesttrace = traces[i];
        }
    }
    /#
        player thread dyndof_debug(traces, closesttrace);
    #/
    return closesttrace["position"];
}

// Namespace dof / scripts\common\dof
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x362c
// Size: 0x131
function dyndof_trace_internal(angles, pos) {
    player = self;
    assert(isdefined(player));
    playereye = dyndof_getplayerorigin();
    angles = combineangles(dyndof_getplayerangles(), angles);
    if (isdefined(player.dyndof.desireddistance)) {
        forward_distance = player.dyndof.desireddistance;
    } else {
        forward_distance = player.dyndof.maxfocusdist;
    }
    if (!isdefined(pos)) {
        pos = dyndof_getplayerorigin() + anglestoforward(angles) * forward_distance;
    }
    results = physics_raycast(playereye, pos, player.dyndof.contents, player.dyndof.ignorelist, 1, "physicsquery_closest", 1);
    /#
        if (getdvarint(@"hash_93ca035fa3964d3d", 1)) {
            if (!isdefined(results) || results.size == 0) {
                line(playereye, pos, (0.3, 0.3, 0.3));
            }
        }
    #/
    return results;
}

// Namespace dof / scripts\common\dof
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3766
// Size: 0x1cc
function dyndof_trace_target(pos) {
    player = self;
    assert(isdefined(player));
    if (istrue(player.dyndof.ignorecollision)) {
        return true;
    }
    trace = dyndof_trace_internal((0, 0, 0), pos);
    pos_print = pos + (0, 0, 3);
    if (isdefined(trace) && isdefined(trace[0]) && isdefined(trace[0]["position"])) {
        if (distance(trace[0]["position"], pos) < 8) {
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(pos_print, "<dev string:x117>", (1, 0, 1), 1, 0.1, 1, 1);
                    playereye = dyndof_getplayerorigin();
                    line(playereye, trace[0]["<dev string:x9d>"], (1, 0, 1));
                }
            #/
            return true;
        } else {
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(pos_print, "<dev string:x12a>", (1, 0, 0), 1, 0.1, 1, 1);
                    playereye = dyndof_getplayerorigin();
                    line(playereye, trace[0]["<dev string:x9d>"], (1, 0, 0));
                }
            #/
            return false;
        }
    }
    /#
        if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
            print3d(pos_print, "<dev string:x137>", (0, 1, 0), 1, 0.1, 1, 1);
            playereye = dyndof_getplayerorigin();
            line(playereye, pos, (0, 1, 0));
        }
    #/
    return true;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x393b
// Size: 0xd5
function dyndof_getplayerorigin() {
    player = self;
    if (player isplayingxcam()) {
        var_c0014262498c3f37 = player function_a0bbe9bbf0848458();
        ang = var_c0014262498c3f37[1];
        pos = var_c0014262498c3f37[0];
        return pos;
    }
    if (player islinked()) {
        linkedent = player getlinkedparent();
        if (!isdefined(linkedent.dyndof_hastag)) {
            linkedent.dyndof_hastag = 0;
            if (isdefined(linkedent.model)) {
                if (hastag(linkedent.model, "tag_camera")) {
                    linkedent.dyndof_hastag = 1;
                }
            }
        }
        if (linkedent.dyndof_hastag) {
            return linkedent gettagorigin("tag_camera");
        }
    }
    return player getvieworigin();
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a19
// Size: 0x3f
function dyndof_getplayerangles() {
    player = self;
    var_c0014162498c3d04 = player function_a0bbe9bbf0848458();
    ang = var_c0014162498c3d04[1];
    pos = var_c0014162498c3d04[0];
    return ang;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a61
// Size: 0x74
function create_dyndof() {
    struct = spawnstruct();
    struct.maxfocusdist = 50000;
    struct.contents = get_dyndof_contents();
    struct.traceangle = 3;
    struct.prevangles = (0, 0, 0);
    struct.prevorigin = (0, 0, 0);
    return struct;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ade
// Size: 0x1a
function destroy_dyndof() {
    if (!isdefined(self.dyndof)) {
        return;
    }
    self.dyndof = undefined;
}

// Namespace dof / scripts\common\dof
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b00
// Size: 0x4a
function get_dyndof_contents() {
    dof_contents = ["physicscontents_characterproxy", "physicscontents_ainoshoot", "physicscontents_clipshot", "physicscontents_item", "physicscontents_vehicle", "physicscontents_water"];
    return physics_createcontents(dof_contents);
}

// Namespace dof / scripts\common\dof
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b53
// Size: 0x226
function dyndof_debug(traces, closesttrace) {
    player = self;
    assert(isdefined(player));
    player notify("stop_dyndof_debug");
    player endon("stop_dyndof");
    player endon("stop_dyndof_debug");
    /#
        if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
            while (true) {
                if (!getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    break;
                }
                if (isdefined(traces)) {
                    foreach (trace in traces) {
                        line(trace["<dev string:x9d>"], dyndof_getplayerorigin() + (0, 0, -1));
                    }
                }
                line(closesttrace["<dev string:x9d>"], dyndof_getplayerorigin() + (0, 0, -1), (1, 1, 0));
                value = math::normalize_value(0, 3000, distance(dyndof_getplayerorigin(), closesttrace["<dev string:x9d>"]));
                value *= 32;
                sphere(closesttrace["<dev string:x9d>"], value, (1, 1, 0));
                print3d(closesttrace["<dev string:x9d>"], closesttrace["<dev string:x144>"], (1, 1, 1), 1, 0.1, 1);
                if (isdefined(closesttrace["<dev string:x14c>"]) && isdefined(closesttrace["<dev string:x14c>"].model)) {
                    model = closesttrace["<dev string:x14c>"].model;
                    if (!isdefined(player.var_526ab6a3fcbfa671) || model != player.var_526ab6a3fcbfa671) {
                        iprintln("<dev string:x153>" + model);
                        player.var_526ab6a3fcbfa671 = model;
                    }
                    print3d(closesttrace["<dev string:x9d>"] + (0, 0, -1.5), model, (1, 1, 1), 1, 0.1, 1);
                }
                waitframe();
            }
        }
    #/
}

