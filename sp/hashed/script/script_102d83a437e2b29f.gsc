#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_7db80de62748c769;
#using script_48ca7f64463ff6dc;
#using scripts\engine\math.gsc;
#using scripts\cp\utility.gsc;
#using script_1c0c872aa3bf0cb0;
#using script_18a73a64992dd07d;
#using script_3a8f9ace195c9da9;
#using scripts\cp\coop_stealth.gsc;
#using scripts\cp\cp_spawning_util.gsc;
#using script_371b4c2ab5861e62;

#namespace namespace_9871da81deb2e4b0;

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x480
// Size: 0x196
function function_6afcdc96a6ce9a56(var_4ea821cbd5c93e3d, var_87f368d777c41192, override_damage_sight_range, fov) {
    fov = default_to(fov, 60);
    scripts\cp\coop_stealth::run_common_functions(self, 1, 1, fov);
    self.var_4ebe755e0a0a430e = 1;
    self function_8bbcaeb23a1512ef("all", 1);
    if (isdefined(var_4ea821cbd5c93e3d)) {
        self function_d493e7fe15e5eaf4(var_4ea821cbd5c93e3d);
    } else {
        assertmsg("No valid sight_config_name provided. All AI must have a SightConfig set.");
    }
    if (weaponclass(self.weapon) == "sniper") {
        self function_d493e7fe15e5eaf4("jup_sandbox_sniper");
    }
    override_damage_sight_range = default_to(override_damage_sight_range, 1600);
    self.stealth.override_damage_sight_range = override_damage_sight_range;
    if (isdefined(self.subclass)) {
        switch (self.subclass) {
        case #"hash_b8776a7c6d24d388":
            self.var_9aa77ab756fdca82 = 10;
            self.var_43e2ad424676b8d4 = 10;
            break;
        case #"hash_b8776d7c6d24d841":
            self.var_9aa77ab756fdca82 = 120;
            self.var_43e2ad424676b8d4 = 25;
            break;
        case #"hash_b8776c7c6d24d6ae":
            self.var_9aa77ab756fdca82 = 250;
            self.var_43e2ad424676b8d4 = 50;
            break;
        default:
            break;
        }
    }
    self pushplayer(1);
    self function_136adff8f817fad6(1);
    self.meleechargedistvsplayer = 120;
    function_c0256e105fcdcf61();
    thread function_85f4cc4dd2c3a1cc();
    if (isdefined(var_87f368d777c41192) && isfunction(var_87f368d777c41192)) {
        thread function_d6371f8f15c1d343(var_87f368d777c41192);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61e
// Size: 0x80
function function_c0256e105fcdcf61() {
    if (isdefined(self.spawner) && isdefined(self.spawner.var_370a54e4e0df988a) && self.spawner.var_370a54e4e0df988a != "") {
        function_b41baf16d62d21d8(self.spawner.var_370a54e4e0df988a, self, 1);
        function_e1f50b1f60aa1b25(self.spawner.var_370a54e4e0df988a, 0, 50, 50);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a6
// Size: 0x7c
function function_85f4cc4dd2c3a1cc() {
    self endon("death");
    if (!isdefined(self.var_97a0ba4272149777)) {
        self.var_97a0ba4272149777 = 0;
    }
    while (true) {
        var_1e9043c3977d75a = self.var_fe5ebefa740c7106;
        waittill_any_return_3("stealth_investigate", "stealth_hunt", "stealth_combat");
        if (isdefined(self.var_fe5ebefa740c7106) && self.var_fe5ebefa740c7106 != var_1e9043c3977d75a) {
            self.var_97a0ba4272149777 = gettime();
        }
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72a
// Size: 0x1ac
function function_d6371f8f15c1d343(var_87f368d777c41192) {
    if (!isdefined(level.player)) {
        return;
    }
    level.player endon("death");
    level.var_5ef076251e7516c7 = default_to(level.var_5ef076251e7516c7, 0);
    level.var_f243e0956e3cf9da = default_to(level.var_f243e0956e3cf9da, 0);
    issniper = isdefined(self.weapon) && isdefined(self.weapon.classname) && self.weapon.classname == "sniper";
    self waittill("death", attacker, meansofdeath, weaponobject, damagelocation);
    wait 0.5;
    if (!level.var_5ef076251e7516c7 && !flag("vo_in_kill") && !istrue(level.var_f243e0956e3cf9da) && flag("flag_dungeon_intro_complete") && isplayer(attacker)) {
        var_98e42fd90ff628b2 = distance(level.player.origin, self.origin);
        if (function_db1910344d3cdfa8(self.origin)) {
            if (istrue(level.var_4f73c33a5235d99c)) {
                var_c5d7c9bae8fad8b2 = 1;
            } else {
                var_c5d7c9bae8fad8b2 = !function_1bb1470f934a81eb() && percent_chance(70) && function_eac0cd99c9c6d8ee() != "spotted";
            }
            if (var_c5d7c9bae8fad8b2) {
                thread [[ var_87f368d777c41192 ]](var_98e42fd90ff628b2, issniper);
            }
        }
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8de
// Size: 0x90
function function_db1910344d3cdfa8(origin, radius) {
    radius = default_to(radius, 2000);
    foreach (ai in getaiarrayinradius(origin, radius, "axis")) {
        if (isdefined(self.var_97a0ba4272149777)) {
            if (!time_has_passed(self.var_97a0ba4272149777, 5)) {
                return false;
            }
        }
    }
    return true;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x977
// Size: 0x2
function function_f98bf6b7b70b76aa() {
    
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x981
// Size: 0x20f
function function_96247e7595b40c0a(var_197e4e69fadbe18c, var_f52ff13ebdc0a751, end_on) {
    level endon("game_over");
    level.player endon("death");
    level.player endon("disconnect");
    if (isdefined(end_on)) {
        level endon(end_on);
    }
    while (true) {
        wait 1;
        var_cf24c09b6f305a34 = [[ var_197e4e69fadbe18c ]]();
        switch (getdvar(@"hash_46e9546bc099e5fd", "default")) {
        case #"hash_c482c6c109150a4":
            array_thread(var_cf24c09b6f305a34, &namespace_3f158c2c0d5aac84::enable_flashlight, 1);
            continue;
        case #"hash_db653a4972b3c13b":
            array_thread(var_cf24c09b6f305a34, &namespace_3f158c2c0d5aac84::enable_flashlight, 0);
            continue;
        }
        var_30b0acbb5bdcf22a = var_cf24c09b6f305a34;
        var_30b0acbb5bdcf22a = array_sort_with_func(var_30b0acbb5bdcf22a, &function_14f52e3e375a2355);
        if (isdefined(var_f52ff13ebdc0a751) && isarray(var_f52ff13ebdc0a751) && var_f52ff13ebdc0a751.size > 0) {
            var_1c53b0a512652332 = [];
            for (i = 0; i <= 2 * level.var_8679f91457606ad; i++) {
                var_310236dbf257fbb5 = var_30b0acbb5bdcf22a[i];
                if (!isdefined(var_310236dbf257fbb5)) {
                    continue;
                }
                foreach (vol in var_f52ff13ebdc0a751) {
                    if (var_310236dbf257fbb5 istouching(vol)) {
                        var_1c53b0a512652332[var_1c53b0a512652332.size] = var_310236dbf257fbb5;
                        break;
                    }
                }
                if (var_1c53b0a512652332.size >= level.var_8679f91457606ad - 1) {
                    break;
                }
            }
            var_30b0acbb5bdcf22a = var_1c53b0a512652332;
        } else {
            var_51850ffa50046a75 = [];
            for (i = 0; i < level.var_8679f91457606ad; i++) {
                var_51850ffa50046a75[i] = var_30b0acbb5bdcf22a[i];
            }
            var_30b0acbb5bdcf22a = var_51850ffa50046a75;
        }
        var_cb8ec4b09b1ba636 = array_remove_array(var_cf24c09b6f305a34, var_30b0acbb5bdcf22a);
        array_thread(var_cb8ec4b09b1ba636, &namespace_3f158c2c0d5aac84::enable_flashlight, 0);
        array_thread(var_30b0acbb5bdcf22a, &namespace_3f158c2c0d5aac84::enable_flashlight, 1);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0x23
function function_76e85d0aa8db406d(var_2c6a53a7791a89e4) {
    self.flashlightfxoverridetag = "tag_accessory_left";
    self.flashlightfxoverride = var_2c6a53a7791a89e4;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xbc3
// Size: 0x109
function function_6149b301ce19988b(var_b8c9ee08c9db35f6, var_4af1f883b8159874, var_d5ca3a219d7c3ba5, time_between_spawns, var_dbcd234547a892b0, var_1aca0424d68b374) {
    if (!isdefined(var_d5ca3a219d7c3ba5)) {
        var_d5ca3a219d7c3ba5 = getstructarray(var_b8c9ee08c9db35f6, "targetname").size;
    }
    if (!isdefined(time_between_spawns)) {
        time_between_spawns = 0.05;
    }
    if (!(isdefined(level.ambientgroups) && isdefined(level.ambientgroups[var_b8c9ee08c9db35f6]))) {
        namespace_5729d24318b60bcd::registerambientgroup(var_b8c9ee08c9db35f6, var_d5ca3a219d7c3ba5, var_d5ca3a219d7c3ba5, var_d5ca3a219d7c3ba5, time_between_spawns, undefined, var_b8c9ee08c9db35f6, undefined, undefined, undefined);
    }
    if (!isdefined(var_4af1f883b8159874)) {
        var_4af1f883b8159874 = &function_fac67371e80874db;
    }
    namespace_5729d24318b60bcd::register_module_ai_spawn_func(var_b8c9ee08c9db35f6, var_4af1f883b8159874);
    var_f9c12945316276f1 = namespace_5729d24318b60bcd::run_spawn_module(var_b8c9ee08c9db35f6);
    scripts\cp\cp_spawning_util::set_recent_spawn_time_threshold_override(var_f9c12945316276f1, time_between_spawns * 2);
    if (istrue(var_dbcd234547a892b0)) {
        var_c12844ff8174f8a0 = var_1aca0424d68b374;
        if (!isdefined(var_c12844ff8174f8a0)) {
            if (isdefined(level.var_9283d76b0bfabcca[0])) {
                var_c12844ff8174f8a0 = level.var_9283d76b0bfabcca[0];
            }
        }
        if (isdefined(var_c12844ff8174f8a0)) {
            level thread function_8b740623f288f26e(var_f9c12945316276f1.group_name, var_c12844ff8174f8a0);
        }
    }
    return var_f9c12945316276f1;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcd5
// Size: 0x8f
function function_8b740623f288f26e(var_b8c9ee08c9db35f6, var_1aca0424d68b374) {
    level endon("game_ended");
    level endon("stop_choreographer_watcher " + var_b8c9ee08c9db35f6);
    while (true) {
        level waittill("ai_spawn_successful", soldier, spawnpoint, var_e19d9b9929460e79, var_f8e5e3aa5762a8e7);
        if (var_f8e5e3aa5762a8e7.group_name == var_b8c9ee08c9db35f6) {
            function_37605fb617b75716(var_1aca0424d68b374, soldier);
            println("<dev string:x1c>" + var_b8c9ee08c9db35f6 + "<dev string:x35>" + var_1aca0424d68b374);
        }
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd6c
// Size: 0x6f
function function_efaf045c780ad9b3(var_2b3d95356f4eb366, var_1aca0424d68b374) {
    level endon("game_ended");
    level endon("stop_choreographer_watcher " + var_2b3d95356f4eb366);
    while (true) {
        level waittill("vehicle_rider_spawned", rider, veh_spawner);
        if (veh_spawner == var_2b3d95356f4eb366) {
            function_37605fb617b75716(var_1aca0424d68b374, rider);
            println("<dev string:x4f>" + var_2b3d95356f4eb366 + "<dev string:x35>" + var_1aca0424d68b374);
        }
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xde3
// Size: 0x15
function function_cbddaf6c92856d2c(var_b8c9ee08c9db35f6) {
    level notify("stop_choreographer_watcher " + var_b8c9ee08c9db35f6);
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe00
// Size: 0xa8
function function_7af164468ae66a10(targetname, var_1aca0424d68b374, var_180ca6c04593cb72, vehicle_spawner) {
    if (!isdefined(targetname)) {
        println("<dev string:x78>");
        return 0;
    }
    if (!isdefined(var_1aca0424d68b374)) {
        if (isdefined(level.var_9283d76b0bfabcca[0])) {
            var_1aca0424d68b374 = level.var_9283d76b0bfabcca[0];
        }
    }
    if (!isdefined(var_1aca0424d68b374)) {
        println("<dev string:xb1>");
        return 0;
    }
    if (!isdefined(var_180ca6c04593cb72) && !isdefined(vehicle_spawner)) {
        println("<dev string:xfc>");
        return 0;
    }
    if (vehicle_spawner) {
        level thread function_efaf045c780ad9b3(targetname, var_1aca0424d68b374);
    }
    if (var_180ca6c04593cb72) {
        level thread function_8b740623f288f26e(targetname, var_1aca0424d68b374);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeb0
// Size: 0x1f4
function function_fac67371e80874db(group_name, func) {
    if (getdvarint(@"hash_dcf5fcede3345fb8", 0) != 0) {
        self.ignoreall = 1;
    }
    if (namespace_5729d24318b60bcd::is_specified_unittype("juggernaut")) {
        self function_b11b5190b03c861c("");
        self function_9f82c74eb1b7caf9(0);
        self.var_2626d6897d71b728 = 2000;
    }
    if (istrue(self.bhasriotshieldattached)) {
        self.var_2626d6897d71b728 = 1400;
    }
    scripts\cp\coop_stealth::run_common_functions(self, 1, 1, 60, 160000);
    self.var_d4c11c85ee9c6a42 = 1500;
    self.var_a4709d00b598b7bf = 1;
    self.var_ba67494935b9726b = 1;
    if (function_eac0cd99c9c6d8ee() == "spotted") {
        if (self [[ self.fnisinstealthcombat ]]() || self [[ self.fnisinstealthhunt ]]()) {
            return;
        }
        player = level.player;
        if (isdefined(player)) {
            self setgoalpos(player.origin);
            event = spawnstruct();
            event.typeorig = "combat";
            event.type = "combat";
            event.origin = player.origin;
            event.investigate_pos = player.origin;
            self [[ self.fnsetstealthstate ]]("combat", event);
        }
        self getenemyinfo(level.player);
        return;
    }
    if (istrue(level.var_5f4f92a8e2b137e7)) {
        if (self [[ self.fnisinstealthcombat ]]() || self [[ self.fnisinstealthhunt ]]()) {
            return;
        }
        self [[ self.fnsetstealthstate ]]("hunt");
    }
    if (isdefined(self.noflashlight) && !self.noflashlight) {
        delaythread(1, &enable_flashlight, 1);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ac
// Size: 0x86
function function_489a0835e10a9b55(ai_array) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    ai_array = function_fdc9d5557c53078e(ai_array);
    foreach (ai in ai_array) {
        if (ai [[ ai.fnisinstealthcombat ]]()) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x113b
// Size: 0xd8
function function_155f16ed1b7f00cd(ai_array, addtime) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    addtime = default_to(addtime, 3);
    foreach (ai in ai_array) {
        if (!isdefined(ai)) {
            continue;
        }
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.lastenemysighttime) || ai.lastenemysighttime == 0) {
            continue;
        }
        if (addtime > 0 && gettime() < ai.lastenemysighttime + 1000 * addtime) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x121c
// Size: 0x52
function function_d0b6fd4fc2332c8c(ai_array, addtime) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    var_3b2b2934a3439464 = function_a3b5f52b9d203b7f(ai_array, addtime);
    return getclosest(self.origin, var_3b2b2934a3439464);
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1277
// Size: 0xef
function function_a3b5f52b9d203b7f(ai_array, addtime) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    addtime = default_to(addtime, float(0));
    var_3b2b2934a3439464 = [];
    foreach (ai in ai_array) {
        if (!isdefined(ai)) {
            continue;
        }
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.lastenemysighttime) || ai.lastenemysighttime == 0) {
            continue;
        }
        if (addtime > 0 && gettime() < ai.lastenemysighttime + 1000 * addtime) {
            var_3b2b2934a3439464 = array_add(var_3b2b2934a3439464, ai);
        }
    }
    return var_3b2b2934a3439464;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x136f
// Size: 0x99
function function_1c988b6c6d6719b8(ai_array, dist) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    ai_array = function_fdc9d5557c53078e(ai_array);
    ai_array = function_b786b62f4d97ebf();
    var_dd93636baed7dd78 = 0;
    for (i = 0; i < ai_array.size; i++) {
        if (distance(ai_array[i].origin, level.player.origin) <= dist) {
            var_dd93636baed7dd78++;
            continue;
        }
        break;
    }
    return var_dd93636baed7dd78;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1411
// Size: 0x4c
function function_b786b62f4d97ebf(ai_array) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    ai_array = function_fdc9d5557c53078e(ai_array);
    ai_array = sortbydistance(ai_array, level.player.origin);
    return ai_array;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1466
// Size: 0x40
function function_95ecff6ac09a31ed(ai_array) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    ai_array = function_fdc9d5557c53078e(ai_array);
    return getclosest(self.origin, ai_array);
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14af
// Size: 0xdd
function function_a5089164a46c97d(var_914e920ee4a75f55, range, steam) {
    if (!isdefined(var_914e920ee4a75f55) || !isvector(var_914e920ee4a75f55)) {
        return undefined;
    }
    if (isdefined(range)) {
        var_92c8e5a6d23d9243 = range * range;
    } else {
        return undefined;
    }
    if (!isdefined(steam)) {
        steam = "axis";
    }
    var_8738c358f4873c51 = [];
    var_cf24c09b6f305a34 = getaiarray(steam);
    foreach (ai in var_cf24c09b6f305a34) {
        if (distancesquared(var_914e920ee4a75f55, ai.origin) <= var_92c8e5a6d23d9243) {
            var_8738c358f4873c51[var_8738c358f4873c51.size] = ai;
        }
    }
    var_8738c358f4873c51 = array_removedead_or_dying(var_8738c358f4873c51);
    return var_8738c358f4873c51;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1595
// Size: 0x9a
function function_79587a7a06a99027(steam) {
    if (!isdefined(steam)) {
        steam = "axis";
    }
    var_585e701daf27429 = getaiarray(steam);
    var_3ecbf1096d1ba823 = [];
    foreach (guy in var_585e701daf27429) {
        assertex(isalive(guy), "Got ai array yet got a dead guy!");
        if (guy istouching(self)) {
            var_3ecbf1096d1ba823[var_3ecbf1096d1ba823.size] = guy;
        }
    }
    return var_3ecbf1096d1ba823;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1638
// Size: 0x8f
function function_6a86ad418e0171d9(ai_array, var_ddeae6efd613349a) {
    if (!isdefined(ai_array) || !isarray(ai_array)) {
        ai_array = getaiarray("axis");
    }
    trig = function_1c4d592029f2b0d3(var_ddeae6efd613349a);
    foreach (ai in ai_array) {
        if (ai istouching(trig)) {
            return ai;
        }
    }
    return undefined;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16d0
// Size: 0x107
function aim_at(origin, laser_state, var_bed50c3a7a759bb, aim_time) {
    self notify("stop_aiming");
    self endon("stop_aiming");
    self endon("death");
    if (!isdefined(origin)) {
        origin = self localtoworldcoords((150, 0, 30));
    }
    if (!isdefined(laser_state)) {
        laser_state = 0;
    }
    if (!isdefined(aim_time)) {
        aim_time = 1.5;
    }
    self.aim_target = spawn_script_origin();
    self.aim_target.origin = self gettagorigin("tag_flash") + anglestoforward(self gettagangles("tag_flash")) * 50;
    childthread internal_aim_occlusion_override();
    self setentitytarget(self.aim_target);
    self.aim_target moveto(origin, aim_time, 0.01, 0.01);
    /#
        thread function_d9c71e107b11de6();
    #/
    wait aim_time * 0.5;
    if (laser_state > 0) {
        thread aim_at_laser_on(laser_state, var_bed50c3a7a759bb);
    }
    wait aim_time * 0.5;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17df
// Size: 0x48
function private internal_aim_occlusion_override() {
    self.suppress_uselastenemysightpos = 1;
    self.dontgiveuponsuppression = 1;
    self.forcesuppressai = 1;
    while (true) {
        self.lastenemysightpos = self.aim_target.origin;
        waitframe();
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x182f
// Size: 0x82
function private internal_aim_at_laser_tracker() {
    while (true) {
        waittillframeend();
        var_a04ea954c347f6d6 = self gettagorigin(self.aim_laser.tag);
        self.aim_laser dontinterpolate();
        self.aim_laser.origin = var_a04ea954c347f6d6;
        self.aim_laser.angles = vectortoangles(self.aim_target.origin - var_a04ea954c347f6d6);
        waitframe();
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x18b9
// Size: 0x4e
function function_e24293736e639dcf(team, org, ang, var_3a6fa490549f46d9) {
    ent = spawn_script_origin(org, ang);
    ent.health = 1;
    ent makeentitysentient(team, var_3a6fa490549f46d9);
    return ent;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1910
// Size: 0x23
function function_b287795c124d321e() {
    return isdefined(self.enemy) && self.enemy == level.player;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193c
// Size: 0xc
function is_aiming() {
    return isdefined(self.aim_target);
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1951
// Size: 0xea
function aim_at_laser_on(laser_state, var_bed50c3a7a759bb) {
    self endon("laser_off");
    self endon("death");
    assertex(isdefined(self.aim_target), "Must call entity aim_at() before using aim_at_laser_on()");
    if (laser_state != 0) {
        if (!isdefined(var_bed50c3a7a759bb)) {
            var_bed50c3a7a759bb = "tag_laser";
        }
        self.aim_laser = spawn("script_model", self gettagorigin(var_bed50c3a7a759bb));
        self.aim_laser setmodel("tag_laser");
        self.aim_laser setmoverlaserweapon(self.weapon);
        self.aim_laser.tag = var_bed50c3a7a759bb;
        if (laser_state == 1) {
            self.aim_laser laseron();
        } else {
            self.aim_laser laserforceon();
        }
        self.aim_laser.laser_state = laser_state;
        internal_aim_at_laser_tracker();
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a43
// Size: 0x6a
function aim_at_laser_off() {
    self notify("laser_off");
    if (isdefined(self.aim_laser)) {
        if (self.aim_laser.laser_state == 1) {
            self.aim_laser laseroff();
        } else {
            self.aim_laser laserforceoff();
        }
        self.aim_laser delete();
        self.aim_laser = undefined;
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab5
// Size: 0x76
function move_aim_to(origin, time, acceleration_time, var_efe93c754f5124e6) {
    self endon("death");
    self endon("stop_aiming");
    if (!isdefined(acceleration_time)) {
        acceleration_time = 0.05;
    }
    if (!isdefined(var_efe93c754f5124e6)) {
        var_efe93c754f5124e6 = 0.05;
    }
    assertex(isdefined(self.aim_target), "Must enable aiming with aim_at() before moving aim");
    self.aim_target moveto(origin, time, acceleration_time, var_efe93c754f5124e6);
    wait time;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b33
// Size: 0x85
function link_aim_to(ent, tag, origin_offset) {
    self endon("stop_aiming");
    self endon("death");
    assertex(isdefined(self.aim_target), "Must enable aiming with aim_at() before linking aim");
    if (!isdefined(tag)) {
        tag = "tag_origin";
    }
    if (isdefined(origin_offset)) {
        self.aim_target linkto(ent, tag, origin_offset, (0, 0, 0));
        return;
    }
    self.aim_target linkto(ent, tag);
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc0
// Size: 0x301
function move_aim_to_enemy(enemy, tag, var_cca3fab42a571371, var_dc102d0a3fa40d6c, var_3c6327d2dc93eeb9, var_6bfff23ca9261d1e) {
    assertex(isdefined(self.aim_target), "Must enable aiming with aim_at() before moving aim");
    self endon("stop_aiming");
    self endon("death");
    enemy endon("death");
    if (!isdefined(tag)) {
        tag = "tag_origin";
    }
    if (!isdefined(var_cca3fab42a571371)) {
        var_cca3fab42a571371 = 3;
    }
    if (!isdefined(var_dc102d0a3fa40d6c)) {
        var_dc102d0a3fa40d6c = 50;
    }
    if (!isdefined(var_3c6327d2dc93eeb9)) {
        var_3c6327d2dc93eeb9 = 1;
    }
    /#
        if (!isdefined(var_6bfff23ca9261d1e)) {
            var_6bfff23ca9261d1e = 0;
        }
    #/
    var_12ad39f0f512b167 = enemy gettagorigin(tag);
    var_d1ae2a623abd35c1 = var_dc102d0a3fa40d6c;
    var_f9803f210f99196a = enemy.origin;
    var_2c0637398aff5042 = var_dc102d0a3fa40d6c / var_cca3fab42a571371;
    start_speed = distance(self.aim_target.origin, var_12ad39f0f512b167) / var_cca3fab42a571371;
    while (distancesquared(self.aim_target.origin, enemy gettagorigin(tag)) > 5) {
        delta_time = 0.05;
        if (randomfloat(100) > 50) {
            var_78339221b41e8b44 = enemy localtoworldcoords((0, 0, var_d1ae2a623abd35c1));
        } else {
            var_78339221b41e8b44 = enemy localtoworldcoords((0, 0, var_d1ae2a623abd35c1 * -1));
        }
        var_2e85b4cc8c8f0d24 = var_78339221b41e8b44 - enemy.origin + enemy gettagorigin(tag);
        var_f6101d58d76925eb = self.aim_target.origin;
        var_d763e2d8ff9ff57b = length(enemy.origin - var_f9803f210f99196a) / delta_time;
        speed = var_d763e2d8ff9ff57b + start_speed;
        direction = vectornormalize(var_2e85b4cc8c8f0d24 - var_f6101d58d76925eb);
        velocity = direction * speed * delta_time;
        /#
            if (var_6bfff23ca9261d1e) {
                thread draw_angles((0, 0, 0), var_2e85b4cc8c8f0d24);
                line(var_f6101d58d76925eb, var_f6101d58d76925eb + direction, (0, 1, 0));
                line(var_f6101d58d76925eb + direction, var_2e85b4cc8c8f0d24, (1, 0, 0));
            }
        #/
        var_d1ae2a623abd35c1 -= var_2c0637398aff5042 * delta_time;
        var_d1ae2a623abd35c1 = clamp(var_d1ae2a623abd35c1, 0, var_dc102d0a3fa40d6c);
        var_f9803f210f99196a = enemy.origin;
        move_aim_to(var_f6101d58d76925eb + velocity, delta_time, 0.001, 0.001);
    }
    if (var_3c6327d2dc93eeb9) {
        self.aim_target.origin += vectornormalize(self gettagorigin("tag_flash") - self.aim_target.origin) * 20;
        link_aim_to(enemy, tag);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec9
// Size: 0x66
function stop_aiming() {
    self notify("stop_aiming");
    aim_at_laser_off();
    if (isdefined(self.aim_target)) {
        self clearentitytarget();
        self.aim_target delete();
        self.aim_target = undefined;
    }
    self.suppress_uselastenemysightpos = 0;
    self.dontgiveuponsuppression = undefined;
    self.forcesuppressai = 0;
    self.lastenemysightpos = undefined;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f37
// Size: 0x14b
function move_aim_along_spline(start_struct, var_fc410ce8bf19dac9) {
    self endon("stop_aiming");
    self endon("death");
    assertex(isdefined(self.aim_target), "Must enable aiming with aim_at() before moving aim");
    assertex(isdefined(start_struct), "Must pass in starting struct in spline to move_aim_along_spline()");
    assertex(isdefined(var_fc410ce8bf19dac9), "Must pass in how long to aim along spline to move_aim_along_spline()");
    var_69bbf8519d194df1 = 0;
    for (current_struct = start_struct; isdefined(current_struct.target); current_struct = current_struct.next) {
        current_struct.next = getstruct(current_struct.target, "targetname");
        current_struct.dist_to_next = distance(current_struct.next.origin, current_struct.origin);
        var_69bbf8519d194df1 += current_struct.dist_to_next;
    }
    for (current_struct = start_struct; isdefined(current_struct.target); current_struct = current_struct.next) {
        aim_time = current_struct.dist_to_next / var_69bbf8519d194df1 * var_fc410ce8bf19dac9;
        move_aim_to(current_struct.next.origin, aim_time);
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x208a
// Size: 0x2f4
function aim_search_around(var_eb0c52046ed75b79, var_3dce490e575954cb, var_c1c6436496d9b6e8, var_4af84bd7b4e025ca) {
    self endon("stop_aiming");
    self endon("stop_searching");
    self endon("death");
    if (!isdefined(var_eb0c52046ed75b79)) {
        var_eb0c52046ed75b79 = -15;
    } else {
        var_eb0c52046ed75b79 *= -1;
        var_eb0c52046ed75b79 = clamp(var_eb0c52046ed75b79, -30, 30);
    }
    if (!isdefined(var_3dce490e575954cb)) {
        var_3dce490e575954cb = 15;
    } else {
        var_3dce490e575954cb *= -1;
        var_3dce490e575954cb = clamp(var_3dce490e575954cb, -30, 30);
    }
    if (!isdefined(var_c1c6436496d9b6e8)) {
        var_c1c6436496d9b6e8 = 45;
    } else {
        var_c1c6436496d9b6e8 = clamp(var_c1c6436496d9b6e8, -90, 90);
    }
    if (!isdefined(var_4af84bd7b4e025ca)) {
        var_4af84bd7b4e025ca = -45;
    } else {
        var_4af84bd7b4e025ca = clamp(var_4af84bd7b4e025ca, -90, 90);
    }
    /#
        thread function_d9c71e107b11de6();
    #/
    while (true) {
        if (randomfloat(100) > 50) {
            var_8360d787cd2d6eca = var_3dce490e575954cb;
        } else {
            var_8360d787cd2d6eca = var_eb0c52046ed75b79;
        }
        if (randomfloat(100) > 50) {
            var_dda88971030cb1e1 = var_4af84bd7b4e025ca;
        } else {
            var_dda88971030cb1e1 = var_c1c6436496d9b6e8;
        }
        deltatime = 0.05;
        time_elapsed = 0;
        var_fb4344fc091e2d67 = self.aim_target.origin;
        while (time_elapsed < 4) {
            var_73b5b47181e59812 = self gettagorigin("tag_flash")[2];
            if (length(self.velocity) > 0) {
                var_841f34de4ef161e4 = vectortoangles(self.velocity);
            } else {
                var_841f34de4ef161e4 = self.angles;
            }
            var_9f241dc3c38e2c9a = var_841f34de4ef161e4 + (var_8360d787cd2d6eca, var_dda88971030cb1e1, 0);
            var_f14fe3dc08460a5d = anglestoforward(var_9f241dc3c38e2c9a) * 75;
            var_712cff6062468796 = (self.origin[0], self.origin[1], var_73b5b47181e59812);
            var_fb4344fc091e2d67 = var_712cff6062468796 + var_f14fe3dc08460a5d;
            /#
                if (getdvarint(@"hash_500912e607f2c429")) {
                    thread draw_angles(var_9f241dc3c38e2c9a, var_fb4344fc091e2d67, (0, 0, 1), 1, 10);
                }
            #/
            var_bd6328b6f6b2add8 = var_fb4344fc091e2d67 - self.aim_target.origin;
            var_1db13f6a6eb165a9 = length(var_bd6328b6f6b2add8);
            var_a2b39965224cb294 = vectornormalize(var_bd6328b6f6b2add8);
            var_f8e3f290a434df80 = var_1db13f6a6eb165a9 / (4 - time_elapsed);
            var_3d4f8d9283542d92 = var_a2b39965224cb294 * var_f8e3f290a434df80 + self.velocity;
            move_aim_to(self.aim_target.origin + var_3d4f8d9283542d92 * deltatime, deltatime, 1e-05, 1e-05);
            time_elapsed += deltatime;
        }
        self.aim_target.origin = var_fb4344fc091e2d67;
    }
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2386
// Size: 0xa
function stop_aim_search_around() {
    self notify("stop_searching");
}

/#

    // Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2398
    // Size: 0x10b
    function function_d9c71e107b11de6() {
        self endon("<dev string:x154>");
        setdvarifuninitialized(@"hash_500912e607f2c429", 0);
        while (true) {
            if (getdvarint(@"hash_500912e607f2c429")) {
                self.aim_target childthread draw_ent_axis();
                childthread draw_line_for_time(self gettagorigin("<dev string:x160>"), self.aim_target.origin, 1, 0, 0, 0.05);
                if (isdefined(self.aim_laser)) {
                    dist = distance(self.aim_laser.origin, self.aim_target.origin);
                    childthread draw_line_for_time(self.aim_laser.origin, self.aim_laser.origin + anglestoforward(self.aim_laser.angles) * dist, 0, 1, 0, 0.05);
                }
            }
            waitframe();
        }
    }

#/

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24ab
// Size: 0x76
function function_64c20cb1068f5051(var_e1630eac9950b98f, spawner_name) {
    spawner_name = default_to(spawner_name, "gaz");
    if (isdefined(level.gaz)) {
        if (level.gaz.birthtime == gettime()) {
            waitframe();
        }
        function_c9738435832bed05(level.gaz, spawner_name);
    }
    level.gaz = function_d704bfca2ebc00ab(var_e1630eac9950b98f, spawner_name);
    return level.gaz;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x252a
// Size: 0x76
function function_87a01f6c32c20152(var_e1630eac9950b98f, spawner_name) {
    spawner_name = default_to(spawner_name, "soap");
    if (isdefined(level.soap)) {
        if (level.soap.birthtime == gettime()) {
            waitframe();
        }
        function_c9738435832bed05(level.soap, spawner_name);
    }
    level.soap = function_d704bfca2ebc00ab(var_e1630eac9950b98f, spawner_name);
    return level.soap;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25a9
// Size: 0xa8
function function_3e618c3ba27dd834(var_e1630eac9950b98f, spawner_name) {
    spawner_name = default_to(spawner_name, "ghost");
    if (isdefined(level.ghost)) {
        if (level.ghost.birthtime == gettime()) {
            waitframe();
        }
        function_c9738435832bed05(level.ghost, spawner_name);
    }
    level.ghost = function_d704bfca2ebc00ab(var_e1630eac9950b98f, spawner_name);
    level.ghost.name = "Ghost";
    level.ghost.agentname = %CP_JUP_CHEMICAL/GHOST;
    return level.ghost;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x265a
// Size: 0x76
function spawn_farah(var_e1630eac9950b98f, spawner_name) {
    spawner_name = default_to(spawner_name, "farah");
    if (isdefined(level.farah)) {
        if (level.farah.birthtime == gettime()) {
            waitframe();
        }
        function_c9738435832bed05(level.farah, spawner_name);
    }
    level.farah = function_d704bfca2ebc00ab(var_e1630eac9950b98f, spawner_name);
    return level.farah;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x26d9
// Size: 0x99
function private function_d704bfca2ebc00ab(var_e1630eac9950b98f, spawner_name) {
    spawner = function_7a18da6e48b71c35(spawner_name);
    var_efe7f300b471ea52 = spawner spawn_ai();
    var_efe7f300b471ea52.goalradius = 8;
    var_efe7f300b471ea52.animname = "guy";
    if (isdefined(var_e1630eac9950b98f)) {
        var_efe7f300b471ea52 forceteleport(var_e1630eac9950b98f.origin, var_e1630eac9950b98f.angles);
        var_efe7f300b471ea52 setgoalpos(var_e1630eac9950b98f.origin);
    }
    var_efe7f300b471ea52.invulnerable = 1;
    return var_efe7f300b471ea52;
}

// Namespace namespace_9871da81deb2e4b0 / namespace_a0852b262a68d01
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x277b
// Size: 0x6a
function private function_c9738435832bed05(ally, spawner_name) {
    if (!isdefined(ally)) {
        ally = self;
        assertex(isdefined(ally) && isai(ally), "Attempting to delete undefined or something that isn't an AI in delete_ally()");
    }
    ally.invulnerable = 0;
    ally namespace_14d36171baccf528::despawnagent();
    var_b834e240f28254e8 = function_7a18da6e48b71c35(spawner_name);
    var_b834e240f28254e8.count = 1;
}

