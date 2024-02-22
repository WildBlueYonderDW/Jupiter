// mwiii decomp prototype
#using scripts\mp\utility\game.gsc;
#using scripts\engine\utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace ammorestock;

// Namespace ammorestock/namespace_8d949790b9957051
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x38a
function init() {
    level.var_644bc8d2faa9b475 = [];
    if (!isdefined(level.ammorestocklocs)) {
        level.ammorestocklocs = [];
    }
    var_ae19c7aac20a601e = getdvarint(@"hash_82d2dcb77e9844b6", 0) && getdvarint(@"hash_89be1a979c1ec008", 0);
    if (var_ae19c7aac20a601e) {
        namespace_4b0406965e556711::function_1240434f4201ac9d("ssc_initialized");
        namespace_7052decdced06e44::function_4f7660cfd85cd517("ammorestock", &function_894dae288a77a345);
        namespace_7052decdced06e44::function_412f527ef0863f0e("ammorestock", &function_36ce14880a825268);
        namespace_7052decdced06e44::function_f0492c3bdbb3fd52("ammorestock", &function_e826dc20352b1553);
        namespace_7052decdced06e44::function_eded5b87f8f7bdfd("ammorestock", &function_63ad07bb8a0640b8);
    } else {
        wait(10);
        ammorestocklocs = getentarray("ammo_restock_location", "targetname");
        if (isdefined(level.var_34fbfd58680be323)) {
            var_2b1b64456ebbec3a = [[ level.var_34fbfd58680be323 ]](ammorestocklocs);
        }
        function_d5027fd97b7c561d();
        /#
            println("risk" + ter_op(isdefined(namespace_36f464722d326bbe::getlocaleid()), namespace_36f464722d326bbe::getlocaleid(), "game_ended") + "<unknown string>" + ammorestocklocs.size);
        #/
        foreach (loc in ammorestocklocs) {
            var_c3e7e5ca1b13e5e7 = isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(loc.script_noteworthy) && loc.script_noteworthy != level.localeid;
            var_7b5b7f461e35de92 = function_a5980d3e4e2511a2(loc);
            isglobal = isdefined(loc.script_gameobjectname) && loc.script_gameobjectname == "br";
            var_daa757858bb6c771 = namespace_36f464722d326bbe::isbrstylegametype() || function_7923460ce1ee31c5(loc) || istrue(level.var_c08515cf7167fb94);
            if (!istrue(level.useammorestocklocs) || var_c3e7e5ca1b13e5e7 && !function_6c420d3454dae534(loc) || var_7b5b7f461e35de92 || isglobal && !var_daa757858bb6c771) {
                function_d01d67695c07223a(loc);
            } else if (namespace_37f0fb6355a4618a::function_47d356083884f913() && !namespace_37f0fb6355a4618a::function_9c93e67f90980177(loc.origin)) {
                function_d01d67695c07223a(loc);
            } else if (isdefined(loc.script_string) && isglobal) {
                brsubgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
                tokens = strtok(loc.script_string, " ");
                jumpiffalse(tokens.size > 0 && array_contains(tokens, brsubgametype)) LOC_000002c2;
                function_d01d67695c07223a(loc);
            } else {
            LOC_000002c2:
                /#
                    println("<unknown string>" + loc.origin + "<unknown string>" + ter_op(isdefined(loc.script_noteworthy), loc.script_noteworthy, "game_ended") + "<unknown string>" + ter_op(isdefined(loc.script_string), loc.script_string, "game_ended"));
                #/
                function_db4c236b8ae8d47f(loc);
            }
        }
        if (isdefined(level.localeid) && level.localeid == "locale_6") {
            ammorestock_customlocale6cleanup();
        }
        function_a960b3792f77c29();
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("military_ammo_restock", &ammorestock_used);
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c
// Size: 0x248
function function_d01d67695c07223a(loc) {
    /#
        println("<unknown string>" + loc.origin + "<unknown string>" + ter_op(isdefined(loc.script_noteworthy), loc.script_noteworthy, "game_ended") + "<unknown string>" + ter_op(isdefined(loc.script_string), loc.script_string, "game_ended"));
    #/
    if (isdefined(loc.target)) {
        var_fd5ef62c4bde358e = getentarray(loc.target, "targetname");
        if (var_fd5ef62c4bde358e.size > 0) {
            foreach (ent in var_fd5ef62c4bde358e) {
                ent delete();
            }
        }
        var_fd5ef62c4bde358e = getentitylessscriptablearray(loc.target, "targetname");
        if (var_fd5ef62c4bde358e.size > 0) {
            foreach (scriptable in var_fd5ef62c4bde358e) {
                scriptable setscriptablepartstate("military_ammo_restock", "hidden");
            }
        }
    }
    /#
        if (getdvarint(@"hash_d684f98557413539", 0) == 1) {
            print3d(loc.origin + (0, 0, 100), "<unknown string>" + loc.origin[0] + "<unknown string>" + loc.origin[1] + "<unknown string>" + loc.origin[2] + "<unknown string>", (1, 1, 1), 1, 1, 9999, 1);
            thread namespace_f2ffc0540883e1ad::drawline(loc.origin, loc.origin + (0, 0, 5000), 600, (1, 0, 0));
        }
    #/
    loc delete();
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xacb
// Size: 0x1d
function spawnlocation(struct) {
    spawnmodel(struct);
    spawncollision(struct);
    return struct;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf0
// Size: 0x14e
function function_db4c236b8ae8d47f(loc) {
    if (!isdefined(level.ammorestocklocs)) {
        level.ammorestocklocs = [];
    }
    if (function_9b45d31903431d9b(loc)) {
        return;
    }
    function_54f6e59d9cc6d3e2(loc);
    /#
        if (getdvarint(@"hash_d684f98557413539", 0) == 1) {
            print3d(loc.origin + (0, 0, 200), "<unknown string>" + loc.origin[0] + "<unknown string>" + loc.origin[1] + "<unknown string>" + loc.origin[2] + "<unknown string>", (1, 1, 1), 1, 1, 9999, 1);
            thread namespace_f2ffc0540883e1ad::drawline(loc.origin, loc.origin + (0, 0, 2000), 600, (0, 1, 0));
            thread namespace_f2ffc0540883e1ad::drawsphere(loc.origin, 128, 600, (0, 1, 0));
        }
    #/
    loc.timeplayerused = [];
    level.ammorestocklocs[level.ammorestocklocs.size] = loc;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc45
// Size: 0x160
function function_6c420d3454dae534(loc) {
    switch (level.mapname) {
    case #"hash_c8b70146f0c8a9cd":
    case #"hash_decd2e8ff1f996d7":
        return 1;
    case #"hash_5586b38644ed9b26":
        if (loc.script_noteworthy == "locale_28" || loc.script_noteworthy == "locale_34") {
            return 1;
        }
        break;
    case #"hash_a11e6e81ea219453":
        if (loc.script_noteworthy == "locale_50" || loc.script_noteworthy == "locale_51") {
            return 1;
        }
        break;
    case #"hash_3e552e81b4a21fff":
        if (loc.script_noteworthy == "locale_26" || loc.script_noteworthy == "locale_27") {
            return 1;
        }
        break;
    case #"hash_ec2ebc1298ef7373":
        if (loc.script_noteworthy == "locale_22" || loc.script_noteworthy == "locale_88") {
            return 1;
        }
        break;
    case #"hash_d707e2cfc340c376":
        if (loc.script_noteworthy == "locale_24" || loc.script_noteworthy == "locale_25") {
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdad
// Size: 0xc6
function function_7923460ce1ee31c5(loc) {
    switch (level.mapname) {
    case #"hash_a11e6e81ea219453":
        if (distance2dsquared(loc.origin, (-34993, -21635.7, 308)) < 65536) {
            return 1;
        }
        break;
    case #"hash_5586b38644ed9b26":
        if (distance2dsquared(loc.origin, (2248.88, -38875.6, 216)) < 65536) {
            return 1;
        }
        break;
    case #"hash_c8b70146f0c8a9cd":
        if (distance2dsquared(loc.origin, (22721.7, 23480.7, 1668.93)) < 65536) {
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe7b
// Size: 0x1b
function private function_894dae288a77a345(var_cab957adc8d7710f) {
    return getentarray("ammo_restock_location", "targetname");
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe9e
// Size: 0x1d
function private function_36ce14880a825268(var_cab957adc8d7710f, loc) {
    function_db4c236b8ae8d47f(loc);
    return loc;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec3
// Size: 0x1c
function private function_e826dc20352b1553(var_cab957adc8d7710f, loc) {
    function_d01d67695c07223a(loc);
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xee6
// Size: 0x1a
function private function_63ad07bb8a0640b8(var_cab957adc8d7710f) {
    function_d5027fd97b7c561d();
    function_a960b3792f77c29();
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf07
// Size: 0x145
function private function_a960b3792f77c29() {
    var_6d661c09a2ee037b = ter_op(namespace_36f464722d326bbe::isbrstylegametype(), @"hash_9946861f4644413f", @"hash_c95a149e3fb09e8c");
    var_2e6129bc01d788fe = getdvar(var_6d661c09a2ee037b, "ON");
    foreach (ammocache in level.ammorestocklocs) {
        if (!isdefined(ammocache.target)) {
            continue;
        }
        foreach (var_7242647efdebe760 in getentarray(ammocache.target, "targetname")) {
            if (!var_7242647efdebe760 isscriptable()) {
                continue;
            }
            if (var_2e6129bc01d788fe == "ON") {
                var_7242647efdebe760 setscriptablepartstate("military_ammo_restock", "useable_on");
            } else if (var_2e6129bc01d788fe == "OFF") {
                var_7242647efdebe760 setscriptablepartstate("military_ammo_restock", "useable_on_no_icon");
            }
            break;
        }
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1053
// Size: 0x169
function private function_d5027fd97b7c561d() {
    level.var_ccdb05cfcf9a6ca2 = undefined;
    foreach (loc in level.ammorestocklocs) {
        if (isdefined(loc.target)) {
            foreach (ent in getentarray(loc.target, "targetname")) {
                if (ent.classname == "script_brushmodel") {
                    var_d805a86a5fe7aaf2 = getentarray("tactical_cover_col", "targetname");
                    origin = var_d805a86a5fe7aaf2[0].origin;
                    angles = var_d805a86a5fe7aaf2[0].angles;
                    model = spawn("script_model", origin);
                    model.angles = angles;
                    model clonebrushmodeltoscriptmodel(ent);
                    level.var_ccdb05cfcf9a6ca2 = model;
                    break;
                }
            }
        }
        if (isdefined(level.var_ccdb05cfcf9a6ca2)) {
            break;
        }
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c3
// Size: 0x36d
function function_54f6e59d9cc6d3e2(loc) {
    switch (level.mapname) {
    case #"hash_5586b38644ed9b26":
        break;
    case #"hash_c8b70146f0c8a9cd":
        if (distance2dsquared(loc.origin, (26214, 33992, 1650)) < 65536) {
            origin = (26215, 33993.5, 1624);
            angles = loc.angles + (0, 180, 0);
            model = spawn("script_model", origin);
            model.angles = angles;
            model setmodel("military_ammo_restock_location");
        }
        if (distance2dsquared(loc.origin, (25609.8, 31617.3, 1669.66)) < 65536) {
            origin = (25642, 31626, 1625);
            angles = loc.angles + (0, 180, 0);
            model = spawn("script_model", origin);
            model.angles = angles;
            model setmodel("military_ammo_restock_location");
        }
        if (distance2dsquared(loc.origin, (27155.5, 27512.2, 1777.76)) < 65536) {
            if (isdefined(level.var_ccdb05cfcf9a6ca2)) {
                origin = (27186.1, 27524.5, 1760);
                angles = loc.angles + (0, 315, 0);
                model = spawn("script_model", origin);
                model.angles = angles;
                model clonebrushmodeltoscriptmodel(level.var_ccdb05cfcf9a6ca2);
            }
        }
        if (distance2dsquared(loc.origin, (28623.1, 31207.5, 1681.75)) < 65536) {
            spawnmodel(loc);
        }
        break;
    case #"hash_3e552e81b4a21fff":
        if (distance2dsquared(loc.origin, (-7699.69, 50690.9, 284.391)) < 65536) {
            spawnmodel(loc);
        }
        if (distance2dsquared(loc.origin, (-5924.76, 44588.8, 284.861)) < 65536) {
            spawncollision(loc);
        }
        if (distance2dsquared(loc.origin, (-7280.71, 48236.9, 443.596)) < 65536) {
            model = spawnmodel(loc);
            col = spawncollision(loc);
        }
        if (distance2dsquared(loc.origin, (-9064.73, 41041, 300.758)) < 65536) {
            model = spawnmodel(loc);
            col = spawncollision(loc);
        }
        if (distance2dsquared(loc.origin, (-10185.3, 35049.8, 547.523)) < 65536) {
            model = spawnmodel(loc);
            col = spawncollision(loc);
        }
        if (distance2dsquared(loc.origin, (-7660.12, 35053.6, 332.271)) < 65536) {
            model = spawnmodel(loc);
            model.origin = model.origin + anglestoright(model.angles) * 64;
        }
        break;
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1537
// Size: 0x84
function spawnmodel(loc) {
    origin = loc.origin + (-9.04004, -31.8008, -44);
    angles = loc.angles + (0, 180, 0);
    model = spawn("script_model", origin);
    model.angles = angles;
    model setmodel("military_ammo_restock_location");
    return model;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c3
// Size: 0x96
function spawncollision(loc) {
    if (!isdefined(level.var_ccdb05cfcf9a6ca2)) {
        return;
    }
    origin = loc.origin + (-9.04004, -31.8008, -19.861);
    angles = loc.angles + (0, 90.901, 0);
    col = spawn("script_model", origin);
    col.angles = angles;
    col clonebrushmodeltoscriptmodel(level.var_ccdb05cfcf9a6ca2);
    return col;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1661
// Size: 0x81
function function_a5980d3e4e2511a2(loc) {
    foreach (ammocache in level.ammorestocklocs) {
        if (distance2dsquared(loc.origin, ammocache.origin) < 65536) {
            return 1;
        }
    }
    return 0;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ea
// Size: 0x99e
function function_9b45d31903431d9b(loc) {
    switch (level.mapname) {
    case #"hash_decd2e8ff1f996d7":
        if (distance2dsquared(loc.origin, (27585, -29335, 3209)) < 65536 || distance2dsquared(loc.origin, (32187.5, -34962.8, 3139.13)) < 65536 || distance2dsquared(loc.origin, (22908.5, -31250.1, 3192)) < 65536) {
            function_d01d67695c07223a(loc);
            return 1;
        }
        break;
    case #"hash_c8b70146f0c8a9cd":
        if (distance2dsquared(loc.origin, (34922, 16940, 1550)) < 65536 || distance2dsquared(loc.origin, (29681, 33095.8, 1674)) < 65536 || distance2dsquared(loc.origin, (30032.3, 29652.4, 1669.66)) < 65536 || distance2dsquared(loc.origin, (28574.3, 28187.4, 1674)) < 65536 || distance2dsquared(loc.origin, (31164.6, 32598.1, 1666)) < 65536 || distance2dsquared(loc.origin, (24806.9, 29899.7, 1680)) < 65536 || distance2dsquared(loc.origin, (25007.2, 26987.8, 1293)) < 65536 || distance2dsquared(loc.origin, (27094.5, 29440, 1674)) < 65536 || distance2dsquared(loc.origin, (26380.5, 25555.4, 1677.27)) < 65536 || distance2dsquared(loc.origin, (28506.1, 22508.5, 1914.25)) < 65536 || distance2dsquared(loc.origin, (30202.3, 23396.5, 1332.92)) < 65536 || distance2dsquared(loc.origin, (21877, 27019, 1668)) < 65536 || distance2dsquared(loc.origin, (29313.7, 25313, 1258.43)) < 65536) {
            function_d01d67695c07223a(loc);
            return 1;
        }
        break;
    case #"hash_3e552e81b4a21fff":
    case #"hash_ec2ebc1298ef7373":
        jumpiffalse(distance2dsquared(loc.origin, (-24068.8, -5005.74, 2080)) < 65536 || distance2dsquared(loc.origin, (-6611.97, 50858, 288.512)) < 65536 || distance2dsquared(loc.origin, (-7647.53, 49632.1, 329.7)) < 65536 || distance2dsquared(loc.origin, (-10818.5, 47390.5, 274.765)) < 65536 || distance2dsquared(loc.origin, (-9077.3, 47987.4, 360.799)) < 65536 || distance2dsquared(loc.origin, (-8043.09, 46428.5, 403.384)) < 65536 || distance2dsquared(loc.origin, (-8052.51, 44386.2, 306.807)) < 65536 || distance2dsquared(loc.origin, (-9094.11, 44151.5, 297.895)) < 65536 || distance2dsquared(loc.origin, (-8235.79, 43038.2, 306.207)) < 65536 || distance2dsquared(loc.origin, (-6724.8, 42424.4, 259.02)) < 65536 || distance2dsquared(loc.origin, (-7015.17, 40804.3, 218.733)) < 65536 || distance2dsquared(loc.origin, (-10678.2, 42638.1, 271.852)) < 65536 || distance2dsquared(loc.origin, (-9775.65, 40978.9, 132.481)) < 65536 || distance2dsquared(loc.origin, (-8632.71, 39498, 263.335)) < 65536 || distance2dsquared(loc.origin, (-8842.61, 41604.6, 305.341)) < 65536 || distance2dsquared(loc.origin, (-10148.6, 39588, 294.909)) < 65536 || distance2dsquared(loc.origin, (-7032.02, 36217.1, 552.224)) < 65536 || distance2dsquared(loc.origin, (-7850.63, 37874.3, 422.542)) < 65536 || distance2dsquared(loc.origin, (-7595.55, 34161, 310.81)) < 65536 || distance2dsquared(loc.origin, (-23719.8, -3455.37, 2102.24)) < 65536) LOC_000005b8;
        function_d01d67695c07223a(loc);
        return 1;
    case #"hash_5586b38644ed9b26":
    LOC_000005b8:
        jumpiffalse(distance2dsquared(loc.origin, (6003.04, -38388.4, 256.987)) < 65536 || distance2dsquared(loc.origin, (4172.42, -36837.8, 333.041)) < 65536 || distance2dsquared(loc.origin, (1273.09, -41459.6, 257)) < 65536 || distance2dsquared(loc.origin, (1311.22, -39883.5, 252.392)) < 65536 || distance2dsquared(loc.origin, (644.51, -41408, 257)) < 65536 || distance2dsquared(loc.origin, (1594.75, -37749.8, 252)) < 65536 || distance2dsquared(loc.origin, (3059.22, -38664.9, 257.905)) < 65536 || distance2dsquared(loc.origin, (-2121.11, -42953.5, 257.5)) < 65536 || distance2dsquared(loc.origin, (-2971.54, -42092.5, 244)) < 65536 || distance2dsquared(loc.origin, (-4386.93, -43629.1, 242.893)) < 65536 || distance2dsquared(loc.origin, (-2508.26, -40082.4, 428.444)) < 65536 || distance2dsquared(loc.origin, (-4990.83, -45574.4, 247.751)) < 65536 || distance2dsquared(loc.origin, (3173.23, -41330.2, 300)) < 65536) LOC_000007bd;
        function_d01d67695c07223a(loc);
        return 1;
    case #"hash_a11e6e81ea219453":
    LOC_000007bd:
        if (distance2dsquared(loc.origin, (-22231.6, -21681.7, 612)) < 65536 || distance2dsquared(loc.origin, (42365, -4481, 786)) < 65536 || distance2dsquared(loc.origin, (-36878, -23688, 264)) < 65536 || distance2dsquared(loc.origin, (-36012, -22546, 260)) < 65536 || distance2dsquared(loc.origin, (-35208, -24096, 264)) < 65536 || distance2dsquared(loc.origin, (-34808, -22240, 264)) < 65536 || distance2dsquared(loc.origin, (-31860, -22846, 264)) < 65536 || distance2dsquared(loc.origin, (-32038, -20154, 272)) < 65536 || distance2dsquared(loc.origin, (-33783, -23470, 264)) < 65536 || distance2dsquared(loc.origin, (-33930, -21932, 264)) < 65536) {
            function_d01d67695c07223a(loc);
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2090
// Size: 0x18f
function ammorestock_used(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "military_ammo_restock");
    #/
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        result = function_42f888e2e819cc64(player, instance);
        if (result == 1) {
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if (namespace_4b0406965e556711::gameflag("prematch_done") && brgametype != "risk" && brgametype != "rumble_mgl") {
                thread ammorestock_disableusefortime(instance, player, 0.1);
                thread function_9f58210b67259ac8(player, instance, getdvarint(@"hash_c9f983ed98245328", 60));
            } else {
                thread ammorestock_disableusefortime(instance, player, 0.1);
                thread function_9f58210b67259ac8(player, instance, getdvarint(@"hash_c9f983ed98245328", 5));
            }
        } else if (result == 0) {
            thread ammorestock_disableusefortime(instance, player, 0.1);
        } else {
            thread ammorestock_disableusefortime(instance, player, 0.1);
        }
    } else {
        result = ammorestock_playeruse(player, instance);
        if (result == 1) {
            thread ammorestock_disableusefortime(instance, player, 0.1);
            thread function_9f58210b67259ac8(player, instance, getdvarint(@"hash_c9f983ed98245328", 60));
        } else if (result == 0) {
            thread ammorestock_disableusefortime(instance, player, 0.1);
        } else {
            thread ammorestock_disableusefortime(instance, player, 0.1);
        }
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2226
// Size: 0x17
function function_afab07cf819c5ed4(guid) {
    level.var_644bc8d2faa9b475[guid] = undefined;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2244
// Size: 0x2b
function function_9039bc1e302709d0(guid, instance) {
    level.var_644bc8d2faa9b475[guid][instance.index] = undefined;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2276
// Size: 0x84
function function_9f58210b67259ac8(player, instance, time) {
    guid = player getuniqueid();
    level.var_644bc8d2faa9b475[guid][instance.index] = gettime() + time * 1000;
    player waittill_notify_or_timeout("death", time);
    if (!isdefined(player) || !isreallyalive(player)) {
        function_afab07cf819c5ed4(guid);
    } else {
        function_9039bc1e302709d0(guid, instance);
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2301
// Size: 0x35
function ammorestock_disableusefortime(scriptable, player, time) {
    player endon("disconnect");
    scriptable disablescriptableplayeruse(player);
    wait(time);
    scriptable enablescriptableplayeruse(player);
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233d
// Size: 0x51
function function_f4204f5a6ca70972(equipment_name) {
    if (isdefined(equipment_name)) {
        switch (equipment_name) {
        case #"hash_2fd6e4e58e79a638":
        case #"hash_7a24b50365517bba":
        case #"hash_d520713a70b60a2e":
            return 0;
        default:
            return 1;
            break;
        }
    }
    return 1;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2396
// Size: 0x9fc
function ammorestock_playeruse(player, instance) {
    player endon("death_or_disconnect");
    guid = player getuniqueid();
    var_d7c2deeaf4ae5481 = 0;
    var_4b6c905e414ac105 = 0;
    var_eb2ee014bd8dd8c8 = 0;
    var_802fc98a6dd8e452 = 0;
    var_9b4d75c81b035943 = 0;
    var_23c42b51b990e86e = 0;
    var_29699fcc443f88f6 = "";
    if (isusingmatchrulesdata()) {
        var_d7c2deeaf4ae5481 = getdvarint(@"hash_8c576eeddbc58259", getmatchrulesdata("commonOption", "ammoRestockClipNum"));
        var_4b6c905e414ac105 = getdvarint(@"hash_15478779ab92250d", getmatchrulesdata("commonOption", "ammoRestockLauncherClipNum"));
        var_eb2ee014bd8dd8c8 = getdvarint(@"hash_4694ae11f44463e0", getmatchrulesdata("commonOption", "ammoRestockSniperClipNum"));
        var_802fc98a6dd8e452 = getdvarint(@"hash_af1f3d54cf4d79da", getmatchrulesdata("commonOption", "ammoRestockAllowSuperWeapons"));
        var_9b4d75c81b035943 = getdvarint(@"hash_56822dc1a9f97a6b", getmatchrulesdata("commonOption", "ammoRestockForceClipSize"));
        var_23c42b51b990e86e = getdvarint(@"hash_bbee83d288072303", getmatchrulesdata("commonOption", "ammoRestockMaxEquipment"));
        var_29699fcc443f88f6 = getmatchrulesdata("commonOption", "ammoRestockAmmoIcon");
    }
    if (!isdefined(level.var_644bc8d2faa9b475[guid])) {
        level.var_644bc8d2faa9b475[guid] = [];
    }
    if (isdefined(level.var_644bc8d2faa9b475[guid][instance.index])) {
        /#
        #/
        player namespace_44abc05161e2e2cb::showerrormessage("MP_INGAME_ONLY/AMMO_RESTOCK_ON_COOLDOWN", int((level.var_644bc8d2faa9b475[guid][instance.index] - gettime()) / 1000));
        player playlocalsound("br_pickup_deny");
        return 2;
    }
    var_12a372e8caa042bb = player.primaryweapons;
    var_50f783a5617f8940 = [];
    foreach (item in var_12a372e8caa042bb) {
        if (!namespace_68e641469fde3fa7::ismeleeonly(item) && (var_802fc98a6dd8e452 || !namespace_68e641469fde3fa7::issuperweapon(item)) && !namespace_e0ee43ef2dddadaa::iskillstreakweapon(item) && !namespace_68e641469fde3fa7::isgamemodeweapon(item)) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = item;
        }
    }
    var_12a372e8caa042bb = var_50f783a5617f8940;
    var_df04395b59031a4d = 0;
    foreach (weaponobj in var_12a372e8caa042bb) {
        var_55efab49565e8545 = 0;
        if (weaponobj.hasalternate) {
            var_6890a4ce965bba99 = weaponobj getaltweapon();
            if (player getweaponammostock(var_6890a4ce965bba99) < weaponmaxammo(var_6890a4ce965bba99)) {
                var_55efab49565e8545 = 1;
            }
        }
        if (weaponmaxammo(weaponobj) <= player getweaponammostock(weaponobj) && !var_55efab49565e8545) {
            var_df04395b59031a4d++;
        }
    }
    var_2a0d5da772612a32 = 0;
    foreach (var_220ae48084c1bffc in player.equipment) {
        var_8bf83d28be4c2d4f = player namespace_1a507865f681850e::getequipmenttableinfo(var_220ae48084c1bffc);
        if (isdefined(var_8bf83d28be4c2d4f)) {
            var_8c1092aa0a87661 = player namespace_1a507865f681850e::getequipmentmaxammo(var_220ae48084c1bffc);
            var_b64209459da65860 = player namespace_1a507865f681850e::getequipmentammo(var_220ae48084c1bffc);
            if (var_8c1092aa0a87661 == var_b64209459da65860) {
                var_2a0d5da772612a32++;
            }
        }
    }
    var_a0115a87500b34b = [];
    var_7f227a6adf820843 = 0;
    if (getdvarint(@"hash_d2b88b5ac40363ee", 0) && isdefined(player.gasmaskhealth) && isdefined(player.gasmaskmaxhealth) && player.gasmaskhealth >= 0 && player.gasmaskhealth < player.gasmaskmaxhealth) {
        player.gasmaskhealth = player.gasmaskmaxhealth;
        player setclientomnvar("ui_gasmask_damage", 1);
        var_7f227a6adf820843 = 1;
    }
    if (var_df04395b59031a4d == var_12a372e8caa042bb.size && var_2a0d5da772612a32 == player.equipment.size && !var_7f227a6adf820843) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_INGAME_ONLY/AMMO_RESTOCK_STOCK_FULL");
        player playlocalsound("br_pickup_deny");
        return 0;
    } else {
        foreach (weaponobj in var_12a372e8caa042bb) {
            var_d5afa107bac810b7 = var_9b4d75c81b035943;
            if (namespace_3c37cb17ade254d::issharedfuncdefined("zombie", "get_pap_level")) {
                var_ad70d2d7064ce7e2 = player [[ namespace_3c37cb17ade254d::getsharedfunc("zombie", "get_pap_level") ]](weaponobj);
                if (var_ad70d2d7064ce7e2 > 0) {
                    var_d5afa107bac810b7 = 1;
                }
            }
            var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(weaponobj);
            var_662b420c8b2fcb2d = undefined;
            if (namespace_68e641469fde3fa7::issinglehitweapon(weaponobj)) {
                var_662b420c8b2fcb2d = var_4b6c905e414ac105 > 0 ? var_4b6c905e414ac105 : 1;
            } else if (var_cf4209c200f8bbf4 == "weapon_sniper") {
                var_662b420c8b2fcb2d = var_eb2ee014bd8dd8c8 > 0 ? var_eb2ee014bd8dd8c8 : 3;
            } else {
                var_662b420c8b2fcb2d = var_d7c2deeaf4ae5481 > 0 ? var_d7c2deeaf4ae5481 : 3;
            }
            if (istrue(weaponobj.hasalternate)) {
                var_6890a4ce965bba99 = weaponobj getaltweapon();
                var_91093ef03654702c = weaponclass(var_6890a4ce965bba99);
                if (var_91093ef03654702c == "grenade") {
                    addammo = namespace_3bbb5a98b932c46f::getammooverride(var_6890a4ce965bba99);
                    stockammo = player getweaponammostock(var_6890a4ce965bba99);
                    newammo = int(stockammo + addammo);
                    player setweaponammostock(var_6890a4ce965bba99, newammo);
                } else if (var_6890a4ce965bba99.type == "bullet") {
                    if (getdvarint(@"hash_9ff8020dd5f23959", 0) && isdefined(var_6890a4ce965bba99.underbarrel) && var_6890a4ce965bba99.underbarrel == "jup_ub_flame_01") {
                        player setweaponammoclip(var_6890a4ce965bba99, var_6890a4ce965bba99.clipsize);
                    } else if (var_91093ef03654702c == "spread") {
                        addammo = namespace_3bbb5a98b932c46f::getammooverride(var_6890a4ce965bba99, var_d5afa107bac810b7);
                        stockammo = player getweaponammostock(var_6890a4ce965bba99);
                        newammo = int(stockammo + addammo);
                        player setweaponammostock(var_6890a4ce965bba99, newammo);
                    }
                } else {
                    addammo = namespace_3bbb5a98b932c46f::getammooverride(var_6890a4ce965bba99, var_d5afa107bac810b7);
                    stockammo = player getweaponammostock(var_6890a4ce965bba99);
                    newammo = int(stockammo + addammo);
                    player setweaponammostock(var_6890a4ce965bba99, newammo);
                }
            }
            addammo = namespace_3bbb5a98b932c46f::getammooverride(weaponobj, var_d5afa107bac810b7) * var_662b420c8b2fcb2d;
            stockammo = player getweaponammostock(weaponobj);
            newammo = int(stockammo + addammo);
            var_f05aa030d9faf1b9 = namespace_3bbb5a98b932c46f::getammooverride(weaponobj, var_d5afa107bac810b7);
            clipammo = player getweaponammoclip(weaponobj);
            if (istrue(level.var_93d3de5b393a5e89)) {
                var_7fc9076882ee98ff = weaponclipsize(weaponobj);
                var_d7732d0238eae9ff = weaponmaxammo(weaponobj);
                player setweaponammoclip(weaponobj, var_7fc9076882ee98ff);
                player setweaponammostock(weaponobj, var_d7732d0238eae9ff);
                addammo = var_d7732d0238eae9ff;
            } else if (weaponobj.basename == "iw8_lm_dblmg_mp") {
                player setweaponammoclip(weaponobj, clipammo + var_f05aa030d9faf1b9);
            } else {
                player setweaponammostock(weaponobj, newammo);
            }
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.count = addammo;
            var_60227bff1e9478cc.ref = var_29699fcc443f88f6;
            var_a0115a87500b34b[var_a0115a87500b34b.size] = var_60227bff1e9478cc;
        }
    }
    primary = player namespace_1a507865f681850e::getcurrentequipment("primary");
    if (isdefined(primary) && function_f4204f5a6ca70972(primary)) {
        var_9c161cdc55bf9640 = player namespace_1a507865f681850e::getequipmentammo(primary);
        var_93622e40b0ae3bdd = player namespace_1a507865f681850e::getequipmentmaxammo(primary, player.class);
        if (var_9c161cdc55bf9640 < var_93622e40b0ae3bdd) {
            if (var_23c42b51b990e86e) {
                player namespace_1a507865f681850e::setequipmentslotammo("primary", var_93622e40b0ae3bdd);
            } else {
                player namespace_1a507865f681850e::incrementequipmentammo(primary);
            }
            addammo = player namespace_1a507865f681850e::getequipmentammo(primary) - var_9c161cdc55bf9640;
            if (addammo > 0) {
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.count = addammo;
                var_60227bff1e9478cc.ref = primary;
                var_a0115a87500b34b[var_a0115a87500b34b.size] = var_60227bff1e9478cc;
            }
        }
    }
    secondary = player namespace_1a507865f681850e::getcurrentequipment("secondary");
    if (isdefined(secondary) && function_f4204f5a6ca70972(secondary)) {
        var_9c161cdc55bf9640 = player namespace_1a507865f681850e::getequipmentammo(secondary);
        var_93622e40b0ae3bdd = player namespace_1a507865f681850e::getequipmentmaxammo(secondary, player.class);
        if (var_9c161cdc55bf9640 < var_93622e40b0ae3bdd) {
            if (var_23c42b51b990e86e) {
                player namespace_1a507865f681850e::setequipmentslotammo("secondary", namespace_1a507865f681850e::getequipmentmaxammo(secondary, player.class));
            } else {
                player namespace_1a507865f681850e::incrementequipmentammo(secondary);
            }
            addammo = player namespace_1a507865f681850e::getequipmentammo(secondary) - var_9c161cdc55bf9640;
            if (addammo > 0) {
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.count = addammo;
                var_60227bff1e9478cc.ref = secondary;
                var_a0115a87500b34b[var_a0115a87500b34b.size] = var_60227bff1e9478cc;
            }
        }
    }
    player hudicontype("br_ammo");
    if (var_a0115a87500b34b.size == 0 && !var_7f227a6adf820843) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_INGAME_ONLY/AMMO_RESTOCK_STOCK_FULL");
        player playlocalsound("br_pickup_deny");
        return 0;
    }
    if (issharedfuncdefined("game", "showStockLootFeed")) {
        level thread [[ getsharedfunc("game", "showStockLootFeed") ]](player, var_a0115a87500b34b);
    }
    player playlocalsound("iw9_support_box_use");
    return 1;
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9a
// Size: 0x643
function function_42f888e2e819cc64(player, instance) {
    player endon("death_or_disconnect");
    guid = player getuniqueid();
    if (!isdefined(level.var_644bc8d2faa9b475[guid])) {
        level.var_644bc8d2faa9b475[guid] = [];
    }
    if (isdefined(level.var_644bc8d2faa9b475[guid][instance.index])) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_INGAME_ONLY/AMMO_RESTOCK_ON_COOLDOWN", int((level.var_644bc8d2faa9b475[guid][instance.index] - gettime()) / 1000));
        player playlocalsound("br_pickup_deny");
        return 2;
    }
    var_bf00bd1d7da56c26 = 0;
    var_509d86412c9d7426 = player getweaponslistprimaries();
    var_12a372e8caa042bb = [];
    foreach (item in var_509d86412c9d7426) {
        if (!namespace_68e641469fde3fa7::ismeleeonly(item) && !namespace_68e641469fde3fa7::issuperweapon(item) && !namespace_e0ee43ef2dddadaa::iskillstreakweapon(item) && !namespace_68e641469fde3fa7::isgamemodeweapon(item)) {
            var_12a372e8caa042bb = array_add(var_12a372e8caa042bb, item);
        }
    }
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        if (!isdefined(var_509d86412c9d7426) || var_509d86412c9d7426.size == 0) {
            minigun = player getcurrentweapon();
            var_d0bae9fa43b9e424 = player getcurrentweaponclipammo();
            var_e21a1fe75ea20307 = weaponclipsize(minigun);
            if (var_d0bae9fa43b9e424 < var_e21a1fe75ea20307) {
                player setweaponammoclip(minigun, var_e21a1fe75ea20307);
                player hudicontype("br_ammo");
                player playlocalsound("iw9_support_box_use");
                return 1;
            }
        }
    }
    var_fad892a207d23d14 = 1;
    foreach (weaponobj in var_12a372e8caa042bb) {
        var_b928c399c807ac2e = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weaponobj);
        if (isdefined(var_b928c399c807ac2e)) {
            if (level.var_e6ea72fc5e3fcd00[var_b928c399c807ac2e] > player getweaponammostock(weaponobj)) {
                var_fad892a207d23d14 = 0;
                break;
            }
        }
    }
    var_bb7a7034f796af47 = player namespace_1a507865f681850e::getcurrentequipment("primary");
    var_79a42e6a2f51cf87 = player namespace_1a507865f681850e::getcurrentequipment("secondary");
    var_c7a61b8cf2433e2a = array_removeundefined([0:var_bb7a7034f796af47, 1:var_79a42e6a2f51cf87]);
    var_5f947642c6e09e85 = 1;
    foreach (equipment in var_c7a61b8cf2433e2a) {
        var_6088850c9e835589 = player namespace_1a507865f681850e::getequipmentammo(equipment);
        var_93622e40b0ae3bdd = player namespace_1a507865f681850e::getequipmentmaxammo(equipment);
        if (var_6088850c9e835589 < var_93622e40b0ae3bdd) {
            var_5f947642c6e09e85 = 0;
            break;
        }
    }
    if (istrue(var_fad892a207d23d14) && istrue(var_5f947642c6e09e85)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_INGAME_ONLY/AMMO_RESTOCK_STOCK_FULL");
        player playlocalsound("br_pickup_deny");
        return 0;
    } else {
        var_a0115a87500b34b = [];
        foreach (weap in var_12a372e8caa042bb) {
            var_b928c399c807ac2e = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weap);
            var_dd2decf8db7e69b8 = player getweaponammostock(weap);
            if (isdefined(var_b928c399c807ac2e)) {
                jumpiffalse(level.var_e6ea72fc5e3fcd00[var_b928c399c807ac2e] <= var_dd2decf8db7e69b8) LOC_00000424;
            } else {
            LOC_00000424:
                if (weap.isalternate && namespace_e0ee43ef2dddadaa::function_de04e13ab01e1a10(weap.underbarrel)) {
                    clipammo = weaponclipsize(weap);
                    newammo = int(clipammo);
                    player setweaponammoclip(weap, newammo);
                    continue;
                } else if (namespace_e0ee43ef2dddadaa::isminigunweapon(weap)) {
                    player setweaponammoclip(weap, weap.clipsize);
                    continue;
                } else if (!isdefined(var_b928c399c807ac2e)) {
                    continue;
                }
                if (!isdefined(var_a0115a87500b34b[var_b928c399c807ac2e])) {
                    ammogiven = int(min(level.var_e6ea72fc5e3fcd00[var_b928c399c807ac2e] - var_dd2decf8db7e69b8, weaponclipsize(weap) * 2));
                    var_60227bff1e9478cc = spawnstruct();
                    var_60227bff1e9478cc.count = ammogiven;
                    var_60227bff1e9478cc.scriptablename = var_b928c399c807ac2e;
                    var_60227bff1e9478cc.stackable = var_60227bff1e9478cc.count;
                    var_a0115a87500b34b[var_60227bff1e9478cc.scriptablename] = var_60227bff1e9478cc;
                }
                player namespace_3bcd40a3005712ec::br_give_weapon_clip(weap, 2);
            }
        }
        foreach (equipment in var_c7a61b8cf2433e2a) {
            var_93622e40b0ae3bdd = player namespace_1a507865f681850e::getequipmentmaxammo(equipment);
            if (isdefined(level.br_pickups.br_equipnametoscriptable[equipment]) && !isdefined(var_a0115a87500b34b[level.br_pickups.br_equipnametoscriptable[equipment]])) {
                currentammo = player namespace_1a507865f681850e::getequipmentammo(equipment);
                ammogiven = var_93622e40b0ae3bdd - currentammo;
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.count = ammogiven;
                var_60227bff1e9478cc.scriptablename = level.br_pickups.br_equipnametoscriptable[equipment];
                var_60227bff1e9478cc.stackable = var_60227bff1e9478cc.count;
                var_a0115a87500b34b[var_60227bff1e9478cc.scriptablename] = var_60227bff1e9478cc;
            }
            player namespace_1a507865f681850e::incrementequipmentammo(equipment, var_93622e40b0ae3bdd);
        }
        player hudicontype("br_ammo");
        level thread function_ce0d11003cb7ba99(player, var_a0115a87500b34b);
        player playlocalsound("iw9_support_box_use");
        return 1;
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e4
// Size: 0xd9
function function_ce0d11003cb7ba99(player, var_a0115a87500b34b) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    count = 0;
    foreach (item in var_a0115a87500b34b) {
        count++;
        waittime = 0.1;
        if (count % 3 == 0) {
            waittime = 1.5;
        }
        if (!isdefined(item.count) || item.count <= 0) {
            continue;
        }
        if (!isdefined(item.scriptablename)) {
            continue;
        }
        player namespace_cb965d2f71fefddc::updatelootsplash(item);
        wait(waittime);
    }
}

// Namespace ammorestock/namespace_8d949790b9957051
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c4
// Size: 0x22f
function ammorestock_customlocale6cleanup() {
    var_79d6f370510c1f94 = [];
    var_79d6f370510c1f94[0] = (15946, -71, -469);
    var_79d6f370510c1f94[1] = (16829, -8996, -333);
    var_79d6f370510c1f94[2] = (16531, -13847, -154);
    var_79d6f370510c1f94[3] = (24472, -14782, -134);
    var_79d6f370510c1f94[4] = (22373, -19948, -36);
    var_79d6f370510c1f94[5] = (18250, -2057, -439);
    var_79d6f370510c1f94[6] = (17549, -4262, -432);
    var_79d6f370510c1f94[7] = (19147, -11546, -257);
    var_79d6f370510c1f94[8] = (19845, -21990, -98);
    var_79d6f370510c1f94[9] = (19838, -18100, -23);
    var_79d6f370510c1f94[10] = (21978, -11276, -58);
    foreach (loc in level.ammorestocklocs) {
        var_e24c6c7277a83762 = 0;
        foreach (var_41bacc270e368c94 in var_79d6f370510c1f94) {
            if (var_e24c6c7277a83762) {
                break;
            }
            if (distance2dsquared(loc.origin, var_41bacc270e368c94) < 10000) {
                var_e24c6c7277a83762 = 1;
            }
        }
        if (var_e24c6c7277a83762) {
            var_fd5ef62c4bde358e = getentarray(loc.target, "targetname");
            foreach (ent in var_fd5ef62c4bde358e) {
                if (ent.classname == "script_model") {
                    ent delete();
                } else {
                    ent delete();
                }
            }
            loc delete();
        }
    }
}

