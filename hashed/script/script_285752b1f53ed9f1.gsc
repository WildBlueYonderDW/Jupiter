// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace dof;

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258
// Size: 0x23f
function function_9030ff462f3daa1a() {
    version = getbuildversion();
    if (version == "SHIP") {
        return;
    }
    var_e4268db2ecb6ff71 = @"hash_7dc7c389e33f9f1c";
    setdvarifuninitialized(var_e4268db2ecb6ff71, 0);
    var_dce8969e86d8a573 = @"hash_8ab43a47c4399064";
    setdvarifuninitialized(var_dce8969e86d8a573, 0);
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
    while (1) {
        wait(1);
        if (!getdvarint(var_dce8969e86d8a573)) {
            if (var_18d25e8c9f508a2b) {
                var_18d25e8c9f508a2b = 0;
                level notify("stop_dyndof");
                level.dyndof.player disablephysicaldepthoffieldscripting();
            }
            continue;
        }
        if (utility::ismp() && getdvarint(var_e4268db2ecb6ff71) != clientnum) {
            while (1) {
                clientnum = getdvarint(var_e4268db2ecb6ff71);
                if (isdefined(function_cb47153207fc68d2(clientnum))) {
                    break;
                }
                waitframe();
            }
            function_db7bae3d5d2e993(function_cb47153207fc68d2(clientnum));
        }
        var_c3fb6fb403780040 = 0;
        foreach (dvar, val in values) {
            if (val != getdvarfloat(dvar)) {
                var_c3fb6fb403780040 = 1;
                break;
            }
        }
        if (var_c3fb6fb403780040 || !var_18d25e8c9f508a2b) {
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

// Namespace dof/namespace_f735e08357a3310b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x49e
// Size: 0xa7
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
    level.dyndof.ignorelist = [0:player];
    if (utility::ismp()) {
        thread function_bee71193bca6c80c();
    }
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54c
// Size: 0xb0
function private function_bee71193bca6c80c() {
    level.dyndof endon("new_player");
    level.dyndof.player endon("disconnected");
    while (1) {
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

// Namespace dof/namespace_f735e08357a3310b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x603
// Size: 0x67
function private function_cb47153207fc68d2(num) {
    foreach (player in level.players) {
        if (player getentitynumber() == num) {
            return player;
        }
    }
    return undefined;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x672
// Size: 0x5b
function function_c7a153413fa65e8d(fstop, focusspeed, aperturespeed) {
    level.dyndof.fstop = fstop;
    level.dyndof.focusspeed = focusspeed;
    level.dyndof.aperturespeed = aperturespeed;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d4
// Size: 0x21c
function function_c1f42ed707642a04(fstop, focusspeed, aperturespeed) {
    if (isdefined(level.dyndof)) {
        function_c7a153413fa65e8d(fstop, focusspeed, aperturespeed);
        return;
    }
    /#
        assertex(isdefined(fstop), "fStop not defined.");
    #/
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

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7
// Size: 0x87
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

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x986
// Size: 0x54
function function_121b9c1e3a5664af() {
    contents = [0:"physicscontents_ainoshoot", 1:"physicscontents_clipshot", 2:"physicscontents_item", 3:"physicscontents_solid", 4:"physicscontents_vehicle", 5:"physicscontents_water", 6:"physicscontents_characterproxy"];
    return physics_createcontents(contents);
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e2
// Size: 0x4b
function function_e7a3f680f309a5a() {
    contents = [0:"physicscontents_ainoshoot", 1:"physicscontents_clipshot", 2:"physicscontents_item", 3:"physicscontents_solid", 4:"physicscontents_vehicle", 5:"physicscontents_water"];
    return physics_createcontents(contents);
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa35
// Size: 0x319
function function_91d67d689e8a5ac5() {
    level endon("stop_dyndof");
    var_eb2609c9a7a036f = gettime() + 500;
    var_9e471b081ea6e696 = level.dyndof.var_d453b380dfd6161d;
    setdvarifuninitialized(@"hash_9f25a07838d65086", 1);
    var_d6656715a63c5ac = 0;
    while (1) {
        if (flag("dyndofexp_disable") || !getdvarint(@"hash_9f25a07838d65086")) {
            if (!var_d6656715a63c5ac) {
                var_d6656715a63c5ac = 1;
                level.dyndof.player disablephysicaldepthoffieldscripting();
            }
            wait(0.5);
            continue;
        }
        if (var_d6656715a63c5ac) {
            level.dyndof.player enablephysicaldepthoffieldscripting();
            var_d6656715a63c5ac = 0;
        }
        if (!isdefined(level.dyndof.player)) {
            wait(0.5);
            continue;
        }
        if (gettime() > var_eb2609c9a7a036f) {
            var_eb2609c9a7a036f = gettime() + 500;
            function_8ec129ee5a53f0bc();
            var_9e471b081ea6e696 = level.dyndof.var_d453b380dfd6161d;
        }
        object = function_ddd1e6b7bd85c6d1();
        if (getdvarint(@"hash_ad68aff4b57edc12", 0)) {
            /#
                line(level.dyndof.player.origin, object.origin, (0, 0.7, 0));
            #/
        }
        if (object.var_6aef61126a847ed6 < level.dyndof.var_e429e3048ed6aa37) {
            frac = math::normalize_value(level.dyndof.var_e44cd1048efcca59, level.dyndof.var_e429e3048ed6aa37, object.var_6aef61126a847ed6);
            fstop = math::lerp(level.dyndof.var_a28a7e3e13fa8c7f, level.dyndof.fstop, frac);
        } else {
            fstop = level.dyndof.fstop;
        }
        if (object.var_6aef61126a847ed6 < level.dyndof.var_cfe077c46c9dc7c0) {
            frac = math::normalize_value(level.dyndof.var_cfbd6dc46c776a0a, level.dyndof.var_cfe077c46c9dc7c0, object.var_6aef61126a847ed6);
            focusspeed = math::lerp(level.dyndof.var_21146c5c5d706cbe, level.dyndof.focusspeed, frac);
        } else {
            focusspeed = level.dyndof.focusspeed;
        }
        level.dyndof.player setphysicaldepthoffield(fstop, 1, focusspeed, level.dyndof.aperturespeed, object.origin);
        waitframe();
    }
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd55
// Size: 0x18c
function function_ddd1e6b7bd85c6d1() {
    self endon("death");
    var_d72cbd1b5b80586b = function_7641c664cf37b604();
    var_a66fd1b124c32f51 = level.dyndof.player getplayerangles();
    level.dyndof.prevorigin = var_d72cbd1b5b80586b;
    level.dyndof.prevangles = var_a66fd1b124c32f51;
    var_cab8f864ac7d1b1 = function_b23eb6ebe631ccdc(var_d72cbd1b5b80586b, var_a66fd1b124c32f51);
    if (getdvarint(@"hash_ad68aff4b57edc12") == 3) {
        var_cab8f864ac7d1b1.var_ca6d02ada0248c95 = 0;
    }
    var_a3d92abc0bca4a49 = function_ac3ec9d38fd2434(var_d72cbd1b5b80586b, var_a66fd1b124c32f51);
    if (getdvarint(@"hash_ad68aff4b57edc12") == 4) {
        var_a3d92abc0bca4a49.var_600483be071c0218 = 0;
    }
    if (isdefined(var_a3d92abc0bca4a49) && var_a3d92abc0bca4a49.var_600483be071c0218 > var_cab8f864ac7d1b1.var_ca6d02ada0248c95) {
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                printtoscreen2d(10, 800 + 30, "struct or no bones", (1, 1, 1), 1.5);
            #/
            /#
                sphere(var_a3d92abc0bca4a49.origin, 4, (1, 1, 1));
            #/
        }
        return var_a3d92abc0bca4a49;
    } else {
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                printtoscreen2d(10, 800 + 30, "<unknown string>", (1, 1, 1), 1.5);
            #/
        }
        return var_cab8f864ac7d1b1;
    }
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee8
// Size: 0x2a4
function function_8ec129ee5a53f0bc() {
    var_3855bf447c80fb8a = getdvarint(@"hash_b38fcf293d1e91a8");
    if (getdvarint(@"hash_b38fcf293d1e91a8") == level.dyndof.var_d453b380dfd6161d) {
        return;
    }
    var_16a279669870d122 = 8;
    var_f9ccde8e142055ef = 4;
    angle = var_3855bf447c80fb8a * 0.6 / var_16a279669870d122;
    level.dyndof.var_d453b380dfd6161d = var_3855bf447c80fb8a;
    var_801c42d2e14b7c0c = angle * var_16a279669870d122 * -1;
    var_6b84c5404b57e175 = angle * var_f9ccde8e142055ef * -1;
    var_c57c437404405a37 = var_16a279669870d122 * 2;
    var_4c1dec663db42f82 = var_f9ccde8e142055ef * 2;
    var_2b9e8bc3be1dbd7e[0][0] = 0;
    minvalue = 12000;
    maxvalue = 0;
    for (x = 0; x < var_c57c437404405a37 + 1; x++) {
        for (y = 0; y < var_4c1dec663db42f82 + 1; y++) {
            struct = spawnstruct();
            struct.var_f85ab554f9f088c8 = (y * angle + var_6b84c5404b57e175, x * angle + var_801c42d2e14b7c0c, 0);
            var_2b9e8bc3be1dbd7e[x][y] = struct;
            var_4ecf940f285ab6d2 = var_16a279669870d122 - abs(var_16a279669870d122 - x) + var_f9ccde8e142055ef - abs(var_f9ccde8e142055ef - y);
            struct.var_174cf20fba5bac82 = exp(var_4ecf940f285ab6d2 * 1);
            if (struct.var_174cf20fba5bac82 > maxvalue) {
                maxvalue = struct.var_174cf20fba5bac82;
            } else if (struct.var_174cf20fba5bac82 < minvalue) {
                minvalue = struct.var_174cf20fba5bac82;
            }
        }
    }
    level.dyndof.var_e2a735ff704c61aa = var_2b9e8bc3be1dbd7e[var_16a279669870d122][var_f9ccde8e142055ef];
    foreach (x, array in var_2b9e8bc3be1dbd7e) {
        foreach (y, struct in array) {
            struct.var_174cf20fba5bac82 = math::normalize_value(minvalue, maxvalue, struct.var_174cf20fba5bac82) * 10;
        }
    }
    level.dyndof.var_72574fbb08a1be5c = var_2b9e8bc3be1dbd7e;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1193
// Size: 0x4f2
function function_b23eb6ebe631ccdc(var_d72cbd1b5b80586b, var_a66fd1b124c32f51) {
    traces = [];
    distances = 0;
    var_1bbd65ec7fe70a49 = undefined;
    foreach (array in level.dyndof.var_72574fbb08a1be5c) {
        foreach (struct in array) {
            struct.trace = function_77d9a6389a3305ee(var_d72cbd1b5b80586b, var_a66fd1b124c32f51, struct.var_f85ab554f9f088c8);
            struct.origin = struct.trace["position"];
            struct.var_6aef61126a847ed6 = distance(var_d72cbd1b5b80586b, struct.origin);
            distances = distances + struct.var_6aef61126a847ed6;
            if (!isdefined(var_1bbd65ec7fe70a49)) {
                var_1bbd65ec7fe70a49 = struct;
            } else if (struct.var_6aef61126a847ed6 < var_1bbd65ec7fe70a49.var_6aef61126a847ed6) {
                var_1bbd65ec7fe70a49 = struct;
            }
        }
    }
    level.dyndof.var_1fef56bc059b6f9a = var_1bbd65ec7fe70a49;
    var_57c487e02c82ae4b = [];
    var_9cea65c4cff49987 = [];
    foreach (x, array in level.dyndof.var_72574fbb08a1be5c) {
        foreach (y, struct in array) {
            div = abs(var_1bbd65ec7fe70a49.var_6aef61126a847ed6 - struct.var_6aef61126a847ed6) / 30;
            if (div > 6) {
                div = 6;
            }
            struct.var_cb63d1ec2ac5378 = int(max(div, 1));
            var_25942e825febc4ca = 1 + math::normalize_value(0, 7, 7 - struct.var_cb63d1ec2ac5378);
            struct.var_600483be071c0218 = int(var_25942e825febc4ca * struct.var_174cf20fba5bac82 * 10);
            if (!isdefined(var_57c487e02c82ae4b[struct.var_cb63d1ec2ac5378])) {
                var_57c487e02c82ae4b[struct.var_cb63d1ec2ac5378] = 0;
                var_9cea65c4cff49987[struct.var_cb63d1ec2ac5378] = 0;
            }
            var_57c487e02c82ae4b[struct.var_cb63d1ec2ac5378] = var_57c487e02c82ae4b[struct.var_cb63d1ec2ac5378] + struct.var_600483be071c0218;
            var_9cea65c4cff49987[struct.var_cb63d1ec2ac5378]++;
        }
    }
    keys = getarraykeys(var_57c487e02c82ae4b);
    var_1041bf9752418d22 = var_57c487e02c82ae4b[keys[0]];
    var_2f61b87587e59816 = keys[0];
    foreach (index, var_37a3b21ee1ebea60 in var_57c487e02c82ae4b) {
        if (var_1041bf9752418d22 < var_37a3b21ee1ebea60) {
            var_1041bf9752418d22 = var_37a3b21ee1ebea60;
            var_2f61b87587e59816 = index;
        }
    }
    highestscore = 0;
    var_824ebab3e990a6ba = undefined;
    foreach (array in level.dyndof.var_72574fbb08a1be5c) {
        foreach (struct in array) {
            if (struct.var_cb63d1ec2ac5378 != var_2f61b87587e59816) {
                continue;
            }
            if (struct.var_600483be071c0218 > highestscore) {
                highestscore = struct.var_600483be071c0218;
                var_824ebab3e990a6ba = struct;
            }
        }
    }
    if (!isdefined(var_824ebab3e990a6ba)) {
        var_824ebab3e990a6ba = level.dyndof.var_e2a735ff704c61aa;
    }
    if (getdvarint(@"hash_ad68aff4b57edc12")) {
        /#
            printtoscreen2d(10, 800 + 90, "<unknown string>" + var_57c487e02c82ae4b[var_824ebab3e990a6ba.var_cb63d1ec2ac5378], (1, 1, 1), 1.5);
        #/
    }
    var_824ebab3e990a6ba.var_ca6d02ada0248c95 = var_57c487e02c82ae4b[var_824ebab3e990a6ba.var_cb63d1ec2ac5378];
    level thread function_abfbc195c3aac94c(var_d72cbd1b5b80586b, var_2f61b87587e59816);
    return var_824ebab3e990a6ba;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168d
// Size: 0x8d
function function_50c7801fc0abbd3a() {
    if (gettime() > level.dyndof.var_a94780cfbefad9ce) {
        level.dyndof.var_a94780cfbefad9ce = gettime() + 1000;
        level.dyndof.cosfov = cos(getdvarfloat(@"hash_b38fcf293d1e91a8"));
        level.dyndof.var_4cc8f2b112cadde0 = level.dyndof.cosfov * 50;
    }
}

// Namespace dof/namespace_f735e08357a3310b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1721
// Size: 0xa90
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
        } else {
            ent.var_5cb5bea2f8851b21 = 0;
        }
    }
    function_50c7801fc0abbd3a();
    playerforward = anglestoforward(playerangles);
    foreach (ent in ents) {
        var_6ea84411e400d974 = 0;
        if (isai(ent) || isdefined(ent.var_5cb5bea2f8851b21) || isplayer(ent)) {
            var_6ea84411e400d974 = 1;
        }
        ent.var_600483be071c0218 = 0;
        if (var_6ea84411e400d974 && distancesquared(level.dyndof.player.origin, ent.origin) < 62500) {
            var_47293b1e94ff8fb0 = function_41ae85dd67830a98(ent, playereyepos, playerforward);
        } else {
            var_47293b1e94ff8fb0 = ent.origin + (0, 0, 60);
        }
        ent.var_965c7db1cdc6f221 = var_47293b1e94ff8fb0;
        dot = function_ce15d73cabdc73a4(var_47293b1e94ff8fb0, playereyepos, playerforward);
        ent.var_3281b3968a75b9b9 = dot;
        if (dot > level.dyndof.cosfov) {
            var_425c05c7e072828 = math::normalize_value(level.dyndof.cosfov, 1, dot);
            score = pow(var_425c05c7e072828, 15) * 1100;
            ent.var_600483be071c0218 = ent.var_600483be071c0218 + score;
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(var_47293b1e94ff8fb0 + (0, 0, -5), "<unknown string>" + score + "<unknown string>" + dot + "<unknown string>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        }
        if (ent.var_600483be071c0218 == 0) {
            continue;
        }
        ent.var_6aef61126a847ed6 = distance(var_47293b1e94ff8fb0, playereyepos);
        if (ent.var_6aef61126a847ed6 < 2000) {
            if (ent.var_6aef61126a847ed6 < 200) {
                frac = ent.var_6aef61126a847ed6 / 200;
                var_7a73315d7ca78155 = 100 + 300 * pow(1 - frac, 2);
                ent.var_600483be071c0218 = ent.var_600483be071c0218 + var_7a73315d7ca78155;
            } else {
                frac = ent.var_6aef61126a847ed6 / 2000;
                var_7a73315d7ca78155 = 100 * (1 - frac);
                ent.var_600483be071c0218 = ent.var_600483be071c0218 + var_7a73315d7ca78155;
            }
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(var_47293b1e94ff8fb0 + (0, 0, -10), "<unknown string>" + var_7a73315d7ca78155 + "<unknown string>" + ent.var_600483be071c0218 + "<unknown string>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        } else {
            var_e9a9875d12a0a4f1 = 2000 / ent.var_6aef61126a847ed6 * 0.5;
            ent.var_600483be071c0218 = ent.var_600483be071c0218 * var_e9a9875d12a0a4f1 * 0.5;
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(var_47293b1e94ff8fb0 + (0, 0, -10), "<unknown string>" + var_e9a9875d12a0a4f1 + "<unknown string>" + ent.var_600483be071c0218 + "<unknown string>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        }
        if (ent.var_600483be071c0218 > 0) {
            trace = namespace_2a184fc4902783dc::ray_trace(playereyepos, var_47293b1e94ff8fb0, [0:ent, 1:level.dyndof.player], level.dyndof.contents, 1);
            if (trace["fraction"] > 0.9) {
                scale = 1;
                ent.var_600483be071c0218 = ent.var_600483be071c0218 * scale;
            } else {
                scale = 0;
                ent.var_600483be071c0218 = 0;
            }
            if (getdvarint(@"hash_ad68aff4b57edc12")) {
                /#
                    print3d(var_47293b1e94ff8fb0 + (0, 0, -15), "<unknown string>" + scale + "<unknown string>" + ent.var_600483be071c0218 + "<unknown string>", (1, 1, 1), 0.8, 0.2);
                #/
            }
        }
        ent.var_600483be071c0218 = int(ent.var_600483be071c0218);
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                print3d(var_47293b1e94ff8fb0, ent.var_600483be071c0218, (1, 1, 1), 1, 0.2);
            #/
        }
    }
    var_5b11b54680162012 = [];
    var_6e2b9d3e75679206 = level.dyndof.issp;
    if (var_6e2b9d3e75679206) {
        foreach (ent in ents) {
            if (!isplayer(ent) && !isai(ent) && !isdefined(ent.var_5cb5bea2f8851b21)) {
                continue;
            }
            if (ent.var_600483be071c0218 > 0 && ent.var_3281b3968a75b9b9 > 0.9) {
                var_5b11b54680162012[var_5b11b54680162012.size] = ent;
                /#
                    if (getdvarint(@"hash_ad68aff4b57edc12")) {
                        cylinder(ent.origin, ent.origin + (0, 0, 70), 8, (0.5, 0.5, 0.5));
                    }
                #/
            }
        }
        var_5b11b54680162012 = sortbydistance(var_5b11b54680162012, playereyepos);
    }
    bestscore = 80;
    var_bc03c69ded904a6c = undefined;
    foreach (ent in ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (var_6e2b9d3e75679206 && (isai(ent) || isdefined(ent.var_5cb5bea2f8851b21)) && ent.var_600483be071c0218 > 0 && ent.var_3281b3968a75b9b9 > 0.99) {
            foreach (var_363574e3062381d5 in var_5b11b54680162012) {
                if (var_363574e3062381d5 == ent) {
                    continue;
                }
                if (var_363574e3062381d5.var_6aef61126a847ed6 < ent.var_6aef61126a847ed6 && function_7d02f8d29555766e(playereyepos, ent.var_965c7db1cdc6f221, var_363574e3062381d5.origin)) {
                    ent.var_600483be071c0218 = 0;
                    if (getdvarint(@"hash_ad68aff4b57edc12")) {
                        /#
                            print3d(ent.var_965c7db1cdc6f221 + (0, 0, -20), "<unknown string>", (1, 1, 1), 0.8, 0.2);
                        #/
                        /#
                            line(ent.origin, var_363574e3062381d5.origin, (1, 0, 0));
                        #/
                    }
                    break;
                }
            }
        }
        if (ent.var_600483be071c0218 > bestscore) {
            var_bc03c69ded904a6c = ent;
            bestscore = ent.var_600483be071c0218;
        }
    }
    struct = undefined;
    if (isdefined(var_bc03c69ded904a6c)) {
        struct = spawnstruct();
        struct.origin = var_bc03c69ded904a6c.origin;
        struct.var_600483be071c0218 = var_bc03c69ded904a6c.var_600483be071c0218;
        struct.origin = var_bc03c69ded904a6c.var_965c7db1cdc6f221;
        struct.var_6aef61126a847ed6 = var_bc03c69ded904a6c.var_6aef61126a847ed6;
        if (getdvarint(@"hash_ad68aff4b57edc12")) {
            /#
                printtoscreen2d(10, 800 + 60, "<unknown string>" + struct.var_600483be071c0218, (1, 1, 1), 1.5);
            #/
        }
    }
    return struct;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b9
// Size: 0xec
function function_41ae85dd67830a98(ent, playereyepos, playerforward) {
    var_8dfe400822854558 = [0:"j_spineupper"];
    closesttag = "tag_eye";
    var_1d79b096fabf6e52 = ent gettagorigin(closesttag);
    var_385b66e74a17ec7 = function_ce15d73cabdc73a4(var_1d79b096fabf6e52, playereyepos, playerforward);
    foreach (tag in var_8dfe400822854558) {
        tagorigin = ent gettagorigin(tag);
        dot = function_ce15d73cabdc73a4(tagorigin, playereyepos, playerforward);
        if (dot > var_385b66e74a17ec7) {
            var_385b66e74a17ec7 = dot;
            closesttag = tag;
            var_1d79b096fabf6e52 = tagorigin;
        }
    }
    return var_1d79b096fabf6e52;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ad
// Size: 0x36
function function_ce15d73cabdc73a4(targetorigin, sourcepos, var_4b83e9936868ea11) {
    normal = vectornormalize(targetorigin - sourcepos);
    return vectordot(var_4b83e9936868ea11, normal);
}

// Namespace dof/namespace_f735e08357a3310b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22eb
// Size: 0xba
function function_77d9a6389a3305ee(var_d72cbd1b5b80586b, playerangles, var_f85ab554f9f088c8, pos) {
    angles = combineangles(playerangles, var_f85ab554f9f088c8);
    if (!isdefined(pos)) {
        pos = var_d72cbd1b5b80586b + anglestoforward(angles) * level.dyndof.maxfocusdist;
    }
    trace = physics_raycast(var_d72cbd1b5b80586b, pos, level.dyndof.var_e00802ad31e19ee4, level.dyndof.ignorelist, 1, "physicsquery_closest", 1);
    if (!isdefined(trace) || trace.size == 0) {
        trace = namespace_2a184fc4902783dc::internal_pack_default_trace(pos);
    } else {
        trace = trace[0];
    }
    return trace;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ad
// Size: 0xc5
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

// Namespace dof/namespace_f735e08357a3310b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247a
// Size: 0x2bf
function function_abfbc195c3aac94c(var_d72cbd1b5b80586b, var_1041bf9752418d22) {
    level notify("stop_dyndof_debug");
    level endon("stop_dyndof");
    level endon("stop_dyndof_debug");
    /#
        while (getdvarint(@"hash_ad68aff4b57edc12")) {
            var_da288b6e7827a24a = level.dyndof.var_1fef56bc059b6f9a.trace["<unknown string>"];
            closestdist = level.dyndof.var_1fef56bc059b6f9a.var_6aef61126a847ed6;
            foreach (array in level.dyndof.var_72574fbb08a1be5c) {
                foreach (struct in array) {
                    if ((getdvarint(@"hash_ad68aff4b57edc12") == 2 || getdvarint(@"hash_ad68aff4b57edc12") == 4) && struct.var_cb63d1ec2ac5378 != var_1041bf9752418d22) {
                        continue;
                    }
                    switch (struct.var_cb63d1ec2ac5378) {
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
                    print3d(struct.origin, struct.var_600483be071c0218, (1, 1, 1), 0.7, 0.05);
                    function_28ac1e5f07cc8ea8(struct.trace["<unknown string>"], color);
                }
            }
            radius = math::normalize_value(0, 3000, closestdist);
            radius = radius * 16;
            sphere(var_da288b6e7827a24a, radius, (1, 1, 0));
            waitframe();
        }
    #/
}

// Namespace dof/namespace_f735e08357a3310b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2740
// Size: 0x7a
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

// Namespace dof/namespace_f735e08357a3310b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c1
// Size: 0x162
function function_7d02f8d29555766e(start, end, var_3b4d8ab7e1947f44) {
    var_5a5ade6f6717ebc2 = vectornormalize(end - start);
    radius = 8;
    var_7886519945082 = var_3b4d8ab7e1947f44 + (0, 0, 70);
    var_3e3553d5bcfb767c = var_7886519945082 - var_3b4d8ab7e1947f44;
    var_a4753fbd89ce084f = start - var_3b4d8ab7e1947f44;
    var_e3516dba67d45efb = vectorcross(var_a4753fbd89ce084f, var_3e3553d5bcfb767c);
    var_424283857447cee9 = vectorcross(var_5a5ade6f6717ebc2, var_3e3553d5bcfb767c);
    var_9b2f6dd030cc1244 = vectordot(var_3e3553d5bcfb767c, var_3e3553d5bcfb767c);
    a = vectordot(var_424283857447cee9, var_424283857447cee9);
    b = 2 * vectordot(var_424283857447cee9, var_e3516dba67d45efb);
    c = vectordot(var_e3516dba67d45efb, var_e3516dba67d45efb) - radius * radius * var_9b2f6dd030cc1244;
    dist = b * b - 4 * a * c;
    if (dist < 0) {
        return 0;
    }
    time = (b * -1 - sqrt(dist)) / 2 * a;
    if (time == length(end - start)) {
        return 0;
    }
    if (time < 0) {
        return 0;
    }
    intersection = start + var_5a5ade6f6717ebc2 * time;
    return 1;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292b
// Size: 0x256
function dyndof(fstop, targetentity, focusspeed, aperturespeed, angles, var_387062334ab0e50e, ignorelist, ignorecollision, var_4a0992ce3ff1d7ea) {
    /#
        assertex(isdefined(fstop), "fStop not defined.");
    #/
    /#
        assertex(!isdefined(targetentity) || isent(targetentity), "targetEntity must be an entity or undefined");
    #/
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
        player.dyndof.var_1bae2b3ece322cb6 = var_387062334ab0e50e;
    }
    player.dyndof.ignorecollision = ignorecollision;
    player.dyndof.var_4a0992ce3ff1d7ea = var_4a0992ce3ff1d7ea;
    if (isdefined(ignorelist)) {
        player.dyndof.ignorelist = ignorelist;
    } else {
        player.dyndof.ignorelist = [0:player];
    }
    if (isdefined(angles)) {
        player.dyndof.traceangle = angles;
    }
    player thread dyndof_thread(targetentity);
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b88
// Size: 0x2e
function dyndof_disable() {
    player = self;
    player notify("stop_dyndof");
    player notify("stop_dyndof_debug");
    player disablephysicaldepthoffieldscripting();
    player destroy_dyndof();
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bbd
// Size: 0x4f
function private function_a0bbe9bbf0848458() {
    if (self function_c4ccfb7335de3e72()) {
        pos = self function_c5106bdaced133ab();
        ang = self function_ca5f70a20456c678();
        return [0:pos, 1:ang];
    }
    return [0:self geteye(), 1:self getgunangles()];
}

// Namespace dof/namespace_f735e08357a3310b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c14
// Size: 0x1e6
function dyndof_thread(targetentity) {
    player = self;
    if (isdefined(targetentity)) {
        targetentity endon("death");
    }
    level endon("stop_dyndof");
    player endon("stop_dyndof");
    while (1) {
        if (isdefined(player.dyndof.desiredpos) && player.dyndof.ignorecollision) {
            pos = player.dyndof.desiredpos;
        } else if (isdefined(player.dyndof.var_1bae2b3ece322cb6) && player.dyndof.ignorecollision) {
            var_c0013e62498c366b = function_a0bbe9bbf0848458();
            ang = var_c0013e62498c366b[1];
            eye = var_c0013e62498c366b[0];
            pos = eye + anglestoforward(ang) * player.dyndof.var_1bae2b3ece322cb6;
        } else {
            pos = player dyndof_distance(targetentity);
        }
        if (!isint(pos)) {
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(pos + (0, 0, 1.5), "<unknown string>" + pos, (0, 1, 0), 1, 0.1, 1);
                    line(pos, pos - (0, 0, 1000), (0, 1, 0), 1, 1, 1);
                }
            #/
            player setphysicaldepthoffield(player.dyndof.fstop, 1, player.dyndof.focusspeed, player.dyndof.aperturespeed, pos);
            goto LOC_000001e0;
        }
    LOC_000001e0:
        waitframe();
    }
}

// Namespace dof/namespace_f735e08357a3310b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e01
// Size: 0x87b
function dyndof_distance(targetentity) {
    player = self;
    if (isdefined(targetentity)) {
        targetentity endon("death");
        var_e82aae86d95ce0d9["entity"] = targetentity;
        if (isent(targetentity) && isdefined(targetentity.model)) {
            if (!isdefined(player.dyndof.bone)) {
                if (isdefined(player.dyndof.desiredbone)) {
                    bone = player.dyndof.desiredbone;
                } else {
                    bone = "tag_eye";
                }
                var_e82aae86d95ce0d9["position"] = targetentity.origin;
                var_e82aae86d95ce0d9["hittype"] = bone + " DOESN'T EXIST";
                pos = var_e82aae86d95ce0d9["position"];
                var_e82aae86d95ce0d9["hittype"] = bone + " DOESN'T EXIST";
                pos = var_e82aae86d95ce0d9["position"];
                if (isdefined(targetentity.headmodel)) {
                    var_6445ec1e71d64192 = getnumparts(targetentity.headmodel);
                    for (i = 0; i < var_6445ec1e71d64192; i++) {
                        if (getpartname(targetentity.headmodel, i) == bone) {
                            player.dyndof.bone = bone;
                            var_e82aae86d95ce0d9["hittype"] = player.dyndof.bone;
                            var_e82aae86d95ce0d9["position"] = targetentity gettagorigin(player.dyndof.bone);
                            pos = var_e82aae86d95ce0d9["position"];
                            break;
                        }
                    }
                }
                if (isdefined(targetentity.attachedweaponmodels)) {
                    foreach (n, model in targetentity.attachedweaponmodels) {
                        var_6445ec1e71d64192 = getnumparts(targetentity.attachedweaponmodels[n]);
                        for (i = 0; i < var_6445ec1e71d64192; i++) {
                            if (getpartname(targetentity.attachedweaponmodels[n], i) == bone) {
                                player.dyndof.bone = bone;
                                var_e82aae86d95ce0d9["hittype"] = player.dyndof.bone;
                                var_e82aae86d95ce0d9["position"] = targetentity gettagorigin(player.dyndof.bone);
                                pos = var_e82aae86d95ce0d9["position"];
                                break;
                            }
                        }
                    }
                }
                var_6445ec1e71d64192 = getnumparts(targetentity.model);
                for (i = 0; i < var_6445ec1e71d64192; i++) {
                    if (getpartname(targetentity.model, i) == bone) {
                        player.dyndof.bone = bone;
                        var_e82aae86d95ce0d9["hittype"] = player.dyndof.bone;
                        var_e82aae86d95ce0d9["position"] = targetentity gettagorigin(player.dyndof.bone);
                        pos = var_e82aae86d95ce0d9["position"];
                        break;
                    }
                }
            } else {
                var_e82aae86d95ce0d9["hittype"] = player.dyndof.bone;
                var_e82aae86d95ce0d9["position"] = targetentity gettagorigin(player.dyndof.bone);
                pos = var_e82aae86d95ce0d9["position"];
            }
        } else {
            var_e82aae86d95ce0d9["hittype"] = "struct or no bones";
            var_e82aae86d95ce0d9["position"] = targetentity.origin;
            pos = var_e82aae86d95ce0d9["position"];
        }
        if (isdefined(player worldpointtoscreenpos(pos, getdvarint(@"hash_b38fcf293d1e91a8"))) && dyndof_trace_target(pos)) {
            if (player.dyndof.prevorigin == pos) {
                return -1;
            }
            player.dyndof.prevorigin = pos;
            /#
                player thread dyndof_debug(undefined, var_e82aae86d95ce0d9);
            #/
            return var_e82aae86d95ce0d9["position"];
        } else {
            if (istrue(player.dyndof.var_4a0992ce3ff1d7ea)) {
                var_c0014462498c439d = function_a0bbe9bbf0848458();
                ang = var_c0014462498c439d[1];
                player_eye_pos = var_c0014462498c439d[0];
                var_6e20e569f2c0df7f = pos - player_eye_pos;
                var_b5f9a488edacfbbe = anglestoforward(ang);
                dot = vectordot(var_6e20e569f2c0df7f, var_b5f9a488edacfbbe);
                if (dot > 0) {
                    var_92f914f8aed12f65 = player_eye_pos + var_b5f9a488edacfbbe * dot;
                } else {
                    var_92f914f8aed12f65 = player_eye_pos;
                }
                /#
                    if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                        line(player.dyndof.prevorigin, var_92f914f8aed12f65, (1, 1, 1), 1, 1);
                        print3d(var_92f914f8aed12f65, "<unknown string>", (1, 1, 1), 1, 0.1, 1, 1);
                        print3d(var_92f914f8aed12f65 + (0, 0, 2), "<unknown string>", (1, 0, 0), 1, 0.1, 1);
                    }
                #/
                return var_92f914f8aed12f65;
            }
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(pos, "<unknown string>", (1, 1, 1), 1, 0.1, 1, 1);
                    print3d(pos + (0, 0, 2), "<unknown string>", (1, 0, 0), 1, 0.1, 1);
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
    var_e82aae86d95ce0d9 = traces[index];
    for (i = 1; i < traces.size; i++) {
        if (traces[i]["fraction"] < var_e82aae86d95ce0d9["fraction"]) {
            var_e82aae86d95ce0d9 = traces[i];
        }
    }
    /#
        player thread dyndof_debug(traces, var_e82aae86d95ce0d9);
    #/
    return var_e82aae86d95ce0d9["position"];
}

// Namespace dof/namespace_f735e08357a3310b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3684
// Size: 0x132
function dyndof_trace_internal(angles, pos) {
    player = self;
    /#
        assert(isdefined(player));
    #/
    playereye = dyndof_getplayerorigin();
    angles = combineangles(dyndof_getplayerangles(), angles);
    if (isdefined(player.dyndof.var_1bae2b3ece322cb6)) {
        var_5adcd7a3e8e73fac = player.dyndof.var_1bae2b3ece322cb6;
    } else {
        var_5adcd7a3e8e73fac = player.dyndof.maxfocusdist;
    }
    if (!isdefined(pos)) {
        pos = dyndof_getplayerorigin() + anglestoforward(angles) * var_5adcd7a3e8e73fac;
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

// Namespace dof/namespace_f735e08357a3310b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37be
// Size: 0x1cd
function dyndof_trace_target(pos) {
    player = self;
    /#
        assert(isdefined(player));
    #/
    if (istrue(player.dyndof.ignorecollision)) {
        return 1;
    }
    trace = dyndof_trace_internal((0, 0, 0), pos);
    var_ae3dec2d6a1fd39 = pos + (0, 0, 3);
    if (isdefined(trace) && isdefined(trace[0]) && isdefined(trace[0]["position"])) {
        if (distance(trace[0]["position"], pos) < 8) {
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(var_ae3dec2d6a1fd39, "<unknown string>", (1, 0, 1), 1, 0.1, 1, 1);
                    playereye = dyndof_getplayerorigin();
                    line(playereye, trace[0]["<unknown string>"], (1, 0, 1));
                }
            #/
            return 1;
        } else {
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(var_ae3dec2d6a1fd39, "<unknown string>", (1, 0, 0), 1, 0.1, 1, 1);
                    playereye = dyndof_getplayerorigin();
                    line(playereye, trace[0]["<unknown string>"], (1, 0, 0));
                }
            #/
            return 0;
        }
    }
    /#
        if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
            print3d(var_ae3dec2d6a1fd39, "<unknown string>", (0, 1, 0), 1, 0.1, 1, 1);
            playereye = dyndof_getplayerorigin();
            line(playereye, pos, (0, 1, 0));
        }
    #/
    return 1;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3993
// Size: 0xd6
function dyndof_getplayerorigin() {
    player = self;
    if (player function_c4ccfb7335de3e72()) {
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

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a71
// Size: 0x40
function dyndof_getplayerangles() {
    player = self;
    var_c0014162498c3d04 = player function_a0bbe9bbf0848458();
    ang = var_c0014162498c3d04[1];
    pos = var_c0014162498c3d04[0];
    return ang;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab9
// Size: 0x75
function create_dyndof() {
    struct = spawnstruct();
    struct.maxfocusdist = 50000;
    struct.contents = get_dyndof_contents();
    struct.traceangle = 3;
    struct.prevangles = (0, 0, 0);
    struct.prevorigin = (0, 0, 0);
    return struct;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b36
// Size: 0x1b
function destroy_dyndof() {
    if (!isdefined(self.dyndof)) {
        return;
    }
    self.dyndof = undefined;
}

// Namespace dof/namespace_f735e08357a3310b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b58
// Size: 0x4b
function get_dyndof_contents() {
    var_4558af14719841a9 = [0:"physicscontents_characterproxy", 1:"physicscontents_ainoshoot", 2:"physicscontents_clipshot", 3:"physicscontents_item", 4:"physicscontents_vehicle", 5:"physicscontents_water"];
    return physics_createcontents(var_4558af14719841a9);
}

// Namespace dof/namespace_f735e08357a3310b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bab
// Size: 0x22b
function dyndof_debug(traces, var_e82aae86d95ce0d9) {
    player = self;
    /#
        assert(isdefined(player));
    #/
    player notify("stop_dyndof_debug");
    player endon("stop_dyndof");
    player endon("stop_dyndof_debug");
    /#
        if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
            while (1) {
                if (!getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    break;
                }
                if (isdefined(traces)) {
                    foreach (trace in traces) {
                        line(trace["<unknown string>"], dyndof_getplayerorigin() + (0, 0, -1));
                    }
                }
                line(var_e82aae86d95ce0d9["<unknown string>"], dyndof_getplayerorigin() + (0, 0, -1), (1, 1, 0));
                value = math::normalize_value(0, 3000, distance(dyndof_getplayerorigin(), var_e82aae86d95ce0d9["<unknown string>"]));
                value = value * 32;
                sphere(var_e82aae86d95ce0d9["<unknown string>"], value, (1, 1, 0));
                print3d(var_e82aae86d95ce0d9["<unknown string>"], var_e82aae86d95ce0d9["<unknown string>"], (1, 1, 1), 1, 0.1, 1);
                if (isdefined(var_e82aae86d95ce0d9["<unknown string>"]) && isdefined(var_e82aae86d95ce0d9["<unknown string>"].model)) {
                    model = var_e82aae86d95ce0d9["<unknown string>"].model;
                    if (!isdefined(player.var_526ab6a3fcbfa671) || model != player.var_526ab6a3fcbfa671) {
                        iprintln("<unknown string>" + model);
                        player.var_526ab6a3fcbfa671 = model;
                    }
                    print3d(var_e82aae86d95ce0d9["<unknown string>"] + (0, 0, -1.5), model, (1, 1, 1), 1, 0.1, 1);
                }
                waitframe();
            }
        }
    #/
}

