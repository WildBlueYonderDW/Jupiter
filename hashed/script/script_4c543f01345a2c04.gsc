#using scripts\engine\utility.gsc;
#using scripts\asm\asm_mp.gsc;

#namespace namespace_7d1d1a833a0da9d8;

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea
// Size: 0xb2
function function_935d676c39ba68a3() {
    scripts\engine\utility::registersharedfunc("zombie_entity", "AddIslandLocations", &function_82600aacebeb4997);
    scripts\engine\utility::registersharedfunc("zombie_entity", "AddIslandLocationsFromStruct", &function_55ffc022b2bb4432);
    scripts\engine\utility::registersharedfunc("zombie_entity", "AddIslandLocationsFromStructString", &function_4b66a2a4ea6c8acb);
    scripts\engine\utility::registersharedfunc("zombie_entity", "AddTeleportLocationsFromStruct", &function_f9cfcbdfbe9d4638);
    scripts\engine\utility::registersharedfunc("zombie_entity", "AddTeleportLocationsFromStructString", &function_ee59a4d25c6c6801);
    scripts\engine\utility::registersharedfunc("zombie_entity", "SetupOrbSpawns", &function_ee81bcd0f7070e2e);
    scripts\engine\utility::registersharedfunc("zombie_entity", "GetClosestOrbSpawn", &function_6790e7673398d475);
    scripts\engine\utility::registersharedfunc("zombie_entity", "KillAllZombies", &function_e81685afe57277af);
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0xae
function function_82600aacebeb4997(origin, angles, radius) {
    var_6b244110df1fa279 = spawnstruct();
    var_6b244110df1fa279.origin = origin;
    var_6b244110df1fa279.angles = angles;
    var_6b244110df1fa279.radius = radius;
    if (!isdefined(self.entitydata.var_dcdfdb305b0c431c)) {
        self.entitydata.var_dcdfdb305b0c431c = [];
    }
    if (isdefined(var_6b244110df1fa279)) {
        self.entitydata.var_dcdfdb305b0c431c[self.entitydata.var_dcdfdb305b0c431c.size] = var_6b244110df1fa279;
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35a
// Size: 0x66
function function_55ffc022b2bb4432(var_6b244110df1fa279) {
    if (!isdefined(self.entitydata.var_dcdfdb305b0c431c)) {
        self.entitydata.var_dcdfdb305b0c431c = [];
    }
    if (isdefined(var_6b244110df1fa279)) {
        self.entitydata.var_dcdfdb305b0c431c[self.entitydata.var_dcdfdb305b0c431c.size] = var_6b244110df1fa279;
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c8
// Size: 0x60
function function_4b66a2a4ea6c8acb(var_8a781bd189f40a64) {
    var_6b244110df1fa279 = getstruct(var_8a781bd189f40a64, "targetname");
    if (isdefined(var_6b244110df1fa279)) {
        var_e98ecb0e8f990265 = getstructarray(var_8a781bd189f40a64, "script_noteworthy");
        if (isdefined(var_e98ecb0e8f990265) && var_e98ecb0e8f990265.size > 0) {
            var_6b244110df1fa279.var_e98ecb0e8f990265 = var_e98ecb0e8f990265;
        }
        function_55ffc022b2bb4432(var_6b244110df1fa279);
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x430
// Size: 0xa3
function function_f9cfcbdfbe9d4638(phaseindex, teleportlocation) {
    if (!isdefined(self.phasedata[phaseindex])) {
        self.phasedata[phaseindex] = spawnstruct();
    }
    if (!isdefined(self.phasedata[phaseindex].var_8d5f6ee9e22c653e)) {
        self.phasedata[phaseindex].var_8d5f6ee9e22c653e = [];
    }
    if (isdefined(teleportlocation)) {
        var_65c64854f86704de = self.phasedata[phaseindex].var_8d5f6ee9e22c653e.size;
        self.phasedata[phaseindex].var_8d5f6ee9e22c653e[var_65c64854f86704de] = teleportlocation;
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4db
// Size: 0x39
function function_ee59a4d25c6c6801(phaseindex, var_6c2b5937eaf033a4) {
    var_faedfa7b574a3cc = getstruct(var_6c2b5937eaf033a4, "targetname");
    if (isdefined(var_faedfa7b574a3cc)) {
        function_f9cfcbdfbe9d4638(phaseindex, var_faedfa7b574a3cc);
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51c
// Size: 0x11d
function function_9d343b075a77dcba() {
    if (!isdefined(self.entitydata) || !isdefined(self.entitydata.phaseindex) || !isdefined(self.phasedata)) {
        return undefined;
    }
    if (!isdefined(self.phasedata[self.entitydata.phaseindex])) {
        return undefined;
    }
    if (!isdefined(self.phasedata[self.entitydata.phaseindex].var_8d5f6ee9e22c653e)) {
        return undefined;
    }
    if (!isdefined(self.entitydata.spawnlocation) || !isdefined(self.phasedata[self.entitydata.phaseindex].var_8d5f6ee9e22c653e[self.entitydata.spawnlocation])) {
        return undefined;
    }
    return self.phasedata[self.entitydata.phaseindex].var_8d5f6ee9e22c653e[self.entitydata.spawnlocation];
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x642
// Size: 0x9c
function function_58a28552bd8a726() {
    centroid = undefined;
    temp = undefined;
    foreach (player in level.players) {
        if (!isdefined(temp)) {
            temp = player.origin;
            continue;
        }
        temp += player.origin;
    }
    if (isdefined(temp)) {
        centroid = temp / level.players.size;
    }
    return centroid;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e7
// Size: 0xe0
function function_130b4014bf08795() {
    centroid = function_58a28552bd8a726();
    var_84573ab46f320c97 = undefined;
    var_52d384e6c8efa49d = undefined;
    closestdistance = 2147483647;
    phaseindex = self.entitydata.phaseindex;
    var_8d5f6ee9e22c653e = self.phasedata[phaseindex].var_8d5f6ee9e22c653e;
    if (isdefined(var_8d5f6ee9e22c653e) && isdefined(centroid)) {
        for (i = 0; i < var_8d5f6ee9e22c653e.size; i++) {
            location = var_8d5f6ee9e22c653e[i];
            if (!isdefined(var_84573ab46f320c97) || distancesquared(centroid, location.origin) < closestdistance) {
                closestdistance = distancesquared(centroid, location.origin);
                var_84573ab46f320c97 = location;
                var_52d384e6c8efa49d = i;
            }
        }
    }
    return var_52d384e6c8efa49d;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d0
// Size: 0xdc
function function_72cc2105f47c4128() {
    centroid = function_58a28552bd8a726();
    var_645bc4aca8a3225 = undefined;
    var_744881db1baa1db5 = 0;
    var_7c58c737150e428b = undefined;
    phaseindex = self.entitydata.phaseindex;
    var_8d5f6ee9e22c653e = self.phasedata[phaseindex].var_8d5f6ee9e22c653e;
    if (isdefined(var_8d5f6ee9e22c653e) && isdefined(centroid)) {
        for (i = 0; i < var_8d5f6ee9e22c653e.size; i++) {
            location = var_8d5f6ee9e22c653e[i];
            if (!isdefined(var_645bc4aca8a3225) || distancesquared(centroid, location.origin) > var_744881db1baa1db5) {
                var_744881db1baa1db5 = distancesquared(centroid, location.origin);
                var_645bc4aca8a3225 = location;
                var_7c58c737150e428b = i;
            }
        }
    }
    return var_7c58c737150e428b;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b5
// Size: 0x85
function function_e9488f769f23fc32() {
    phaseindex = self.entitydata.phaseindex;
    var_8d5f6ee9e22c653e = self.phasedata[phaseindex].var_8d5f6ee9e22c653e;
    if (isdefined(var_8d5f6ee9e22c653e)) {
        var_e47adc5ec7975cff = var_8d5f6ee9e22c653e.size;
        while (var_e47adc5ec7975cff > 0) {
            locationindex = randomint(var_e47adc5ec7975cff);
            if (locationindex != self.entitydata.spawnlocation) {
                return locationindex;
            }
        }
    }
    return undefined;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x943
// Size: 0xc1
function function_f8a0235c72851079(island) {
    if (!isdefined(island)) {
        return false;
    }
    if (!isdefined(island.radius)) {
        island.radius = 1500;
    }
    radiussq = island.radius * island.radius;
    foreach (player in level.players) {
        if (distance2dsquared(island.origin, player.origin) < radiussq) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0d
// Size: 0x7d
function function_c95d968e76b2a761(index) {
    if (!isdefined(self.entitydata) || !isdefined(self.entitydata.var_dcdfdb305b0c431c)) {
        return 0;
    }
    if (index < 0 || index >= self.entitydata.var_dcdfdb305b0c431c.size) {
        return 0;
    }
    island = self.entitydata.var_dcdfdb305b0c431c[index];
    return function_f8a0235c72851079(island);
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa93
// Size: 0x74
function function_276a136594f3f693() {
    var_64ef3d495ae82376 = [];
    foreach (island in self.entitydata.var_dcdfdb305b0c431c) {
        if (function_f8a0235c72851079(island)) {
            var_64ef3d495ae82376[var_64ef3d495ae82376.size] = island;
        }
    }
    return var_64ef3d495ae82376;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb10
// Size: 0x11e
function function_370e89cf65df0b01(var_b2d4c9b4db7ee54, var_490cf556fe18ff1) {
    closestdist = 2147483647;
    closestplayer = undefined;
    foreach (player in level.players) {
        if (!isalive(player) || istrue(player.inlaststand)) {
            continue;
        }
        if (istrue(var_b2d4c9b4db7ee54)) {
            if (!istrue(player isonground())) {
                continue;
            }
            if (isdefined(player.var_52a7a56d7c5a9dc6) && istrue(player.var_52a7a56d7c5a9dc6.var_95970a85747a82d9)) {
                continue;
            }
        }
        if (istrue(var_490cf556fe18ff1) && istrue(player.var_c764aba579deab63)) {
            continue;
        }
        dist = distancesquared(player.origin, self.origin);
        if (dist < closestdist) {
            closestdist = dist;
            closestplayer = player;
        }
    }
    return closestplayer;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc37
// Size: 0x10e
function function_34f345873460798b(var_b2d4c9b4db7ee54, var_490cf556fe18ff1) {
    minhealth = 2147483647;
    var_b77cee88a9a17b3f = undefined;
    foreach (player in level.players) {
        if (!isalive(player) || istrue(player.inlaststand)) {
            continue;
        }
        if (istrue(var_b2d4c9b4db7ee54)) {
            if (!istrue(player isonground())) {
                continue;
            }
            if (isdefined(player.var_52a7a56d7c5a9dc6) && istrue(player.var_52a7a56d7c5a9dc6.var_95970a85747a82d9)) {
                continue;
            }
        }
        if (istrue(var_490cf556fe18ff1) && istrue(player.var_c764aba579deab63)) {
            continue;
        }
        if (player.health < minhealth) {
            minhealth = player.health;
            var_b77cee88a9a17b3f = player;
        }
    }
    return var_b77cee88a9a17b3f;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd4e
// Size: 0x118
function function_f3a96ba65901316(var_b2d4c9b4db7ee54, var_490cf556fe18ff1) {
    maxscore = 0;
    var_22c69a24a1ad0d6a = undefined;
    foreach (player in level.players) {
        if (!isalive(player) || istrue(player.inlaststand)) {
            continue;
        }
        if (istrue(var_b2d4c9b4db7ee54)) {
            if (!istrue(player isonground())) {
                continue;
            }
            if (isdefined(player.var_52a7a56d7c5a9dc6) && istrue(player.var_52a7a56d7c5a9dc6.var_95970a85747a82d9)) {
                continue;
            }
        }
        if (istrue(var_490cf556fe18ff1) && istrue(player.var_c764aba579deab63)) {
            continue;
        }
        var_599c6f0b6b596efc = player.pers;
        if (var_599c6f0b6b596efc["score"] >= maxscore) {
            maxscore = var_599c6f0b6b596efc["score"];
            var_22c69a24a1ad0d6a = player;
        }
    }
    return var_22c69a24a1ad0d6a;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6f
// Size: 0x2f
function function_f40c1634cd048cda(var_4195498e9121e409) {
    self.entitydata.var_4195498e9121e409 = var_4195498e9121e409;
    self notify("pain");
    scripts\asm\asm_mp::runpain();
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xea6
// Size: 0x96
function function_ee81bcd0f7070e2e(substring, maxcount) {
    if (!isdefined(self.var_2810bd3ceddee8da.spawnlocations)) {
        self.var_2810bd3ceddee8da.spawnlocations = [];
    }
    for (index = 1; index <= maxcount; index++) {
        var_f5c1c7e608a946f7 = getstruct(string(substring + index), "targetname");
        if (isdefined(var_f5c1c7e608a946f7)) {
            self.var_2810bd3ceddee8da.spawnlocations[index - 1] = var_f5c1c7e608a946f7;
        }
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf44
// Size: 0xbd
function function_6790e7673398d475() {
    position = self.origin;
    var_84573ab46f320c97 = undefined;
    closestdistance = 2147483647;
    var_52d384e6c8efa49d = undefined;
    var_f5c1c7e608a946f7 = self.var_2810bd3ceddee8da.spawnlocations;
    if (isdefined(position)) {
        for (i = 0; i < var_f5c1c7e608a946f7.size; i++) {
            location = var_f5c1c7e608a946f7[i];
            if (!isdefined(var_84573ab46f320c97) || distancesquared(position, location.origin) < closestdistance) {
                closestdistance = distancesquared(position, location.origin);
                var_84573ab46f320c97 = location;
                var_52d384e6c8efa49d = i;
            }
        }
    }
    return var_84573ab46f320c97;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100a
// Size: 0x1cf
function function_e81685afe57277af() {
    if (isdefined(self.entitydata.var_dcdfdb305b0c431c)) {
        for (i = 0; i < self.entitydata.var_dcdfdb305b0c431c.size; i++) {
            explosionzombies = getaiarrayinradius(self.entitydata.var_dcdfdb305b0c431c[i].origin, self.entitydata.var_dcdfdb305b0c431c[i].radius, "team_two_hundred");
            foreach (zombie in explosionzombies) {
                if (isalive(zombie) && zombie != self) {
                    zombie.marked_for_death = 1;
                    zombie.nuked = 1;
                    zombie.full_gib = 1;
                    zombie.var_745cd904c1ec804c = 1;
                    zombie kill();
                }
            }
        }
        return;
    }
    explosionzombies = getaiarrayinradius(self.origin, 10240, "team_two_hundred");
    foreach (zombie in explosionzombies) {
        if (isalive(zombie) && zombie != self) {
            zombie.marked_for_death = 1;
            zombie.nuked = 1;
            zombie.full_gib = 1;
            zombie.var_745cd904c1ec804c = 1;
            zombie kill();
        }
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11e1
// Size: 0x3a
function function_2da1745aab41cb94(phaseindex) {
    if (isdefined(self.var_a3d0ad660af72d52.var_b33910d3fd7718b1[phaseindex])) {
        return self.var_a3d0ad660af72d52.var_b33910d3fd7718b1[phaseindex];
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1223
// Size: 0x62
function function_c4447e7f406126bb(var_8b59a837b0e6f7fe, phaseindex) {
    switch (phaseindex) {
    case 0: 
        return (var_8b59a837b0e6f7fe + "phase1");
    case 1:
    case 2:
    default: 
        return (var_8b59a837b0e6f7fe + "phase2");
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128d
// Size: 0x22
function function_6a493253ff0a74bd() {
    if (istrue(self.var_4919d15787f01154)) {
        return self.fake_health;
    }
    return self.health;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b8
// Size: 0x22
function function_539a480132aefe25() {
    if (istrue(self.var_4919d15787f01154)) {
        return self.max_fake_health;
    }
    return self.maxhealth;
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12e3
// Size: 0x6e
function function_b61d0a63a27dd52e(scriptablestate, phaseindex) {
    switch (phaseindex) {
    case 0: 
        return (scriptablestate + "_" + "phase1");
    case 1:
    case 2:
    default: 
        return (scriptablestate + "_" + "phase2");
    }
}

// Namespace namespace_7d1d1a833a0da9d8 / namespace_b2488e3dbd8d6274
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1359
// Size: 0x94
function function_90dc656a3cef966a(location, outerradius, innerradius, fxid, maxdamage, mindamage, magnitude, delay) {
    wait delay;
    var_584d9c5318c06de8 = spawnfx(getfx(fxid), location);
    physicsexplosionsphere(location, outerradius, innerradius, magnitude);
    if (isdefined(var_584d9c5318c06de8)) {
        triggerfx(var_584d9c5318c06de8);
    }
    radiusdamage(location, outerradius, maxdamage, mindamage, self);
    wait 4;
    if (isdefined(var_584d9c5318c06de8)) {
        var_584d9c5318c06de8 delete();
    }
}

