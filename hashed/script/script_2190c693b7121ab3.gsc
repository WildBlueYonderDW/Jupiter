// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\teams.gsc;
#using script_25c7a5935190c3f0;
#using script_48814951e916af89;
#using script_252fa7d2b1b1b50b;
#using script_38eb8f4be20d54f4;
#using script_120270bd0a747a35;
#using script_5def7af2a9f04234;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\points.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\dev.gsc;
#using script_2f2628d802eb2807;

#namespace namespace_7ba29140a6d5de80;

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3d
// Size: 0xe2
function function_fb7271d5ee18b98d(data) {
    function_30a591676d601c38();
    data.funcs["onInit"] = &function_e05bdb2a6122fe4a;
    data.funcs["onTeamAssigned"] = &function_89e3fc49199d2019;
    data.funcs["onCancel"] = &function_4448ccf5aaafbcd2;
    data.funcs["onPlayerTearDown"] = &function_30ff47cffe7fca99;
    data.funcs["onPlayerAssimilated"] = &function_e16cc4efa3a21aad;
    data.funcs["onPlayerKilled"] = &function_80274c086eee31b8;
    data.funcs["onPlayerDisconnect"] = &function_51d9f22059847793;
    data.funcs["onEnterGulag"] = &function_e1c4d606e2a5334a;
    data.funcs["onPlayerRespawn"] = &function_7ba3a0f93e96979c;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb26
// Size: 0x22
function function_30a591676d601c38() {
    function_adc3c411e839c811();
    function_63ede2e37ad0a069();
    function_89538dc128a24e58();
    /#
        function_5dee7155086e9ada();
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4f
// Size: 0x468
function function_adc3c411e839c811() {
    level.var_4e85625f13c359ab = spawnstruct();
    level.var_4e85625f13c359ab.enabled = getdvarint(@"hash_bf18f9e007484fa5", 1);
    level.var_4e85625f13c359ab.time = getdvarint(@"hash_64a7b52adce89ea5", 240);
    level.var_4e85625f13c359ab.var_cf9f04c2455c9551 = getdvarint(@"hash_8f30c2023a4a5765", 2500);
    level.var_4e85625f13c359ab.var_5250e11f76eaf5bb = getdvarint(@"hash_41ef549b795f9fc3", 15000);
    level.var_4e85625f13c359ab.var_946b411053737262 = getdvarint(@"hash_ddbf53085a7a7d1c", 5000);
    level.var_4e85625f13c359ab.var_a8f585deac0aaa44 = getdvarint(@"hash_b00ae4edb676deb6", 15000);
    level.var_4e85625f13c359ab.var_623c71246715c68a = getdvarint(@"hash_1a693b17e369558c", 6000);
    level.var_4e85625f13c359ab.var_f618c857c91d9adc = getdvarint(@"hash_d33e01d1a7ed8dc6", 12500);
    level.var_4e85625f13c359ab.var_b4862b86b957b504 = getdvarint(@"hash_3b590a4a694673af", 2);
    level.var_4e85625f13c359ab.var_1aa0d8c830908356 = getdvarint(@"hash_ac6ab3e7f4c59a81", 5);
    level.var_4e85625f13c359ab.var_dad5abd3a17a252e = getdvarint(@"hash_fc51239397667145", 0);
    level.var_4e85625f13c359ab.var_c9a4667d43c3d2b7 = getdvarint(@"hash_ab5a3352cfce280e", 0);
    level.var_4e85625f13c359ab.var_74de30492b65dedb = getdvarint(@"hash_cf9c5344c4606910", 0);
    level.var_4e85625f13c359ab.var_f767533f0cc83c57 = getdvarint(@"hash_6127b0a8716b968a", 0);
    level.var_4e85625f13c359ab.var_4156aa8334394ed5 = getdvarint(@"hash_e8ffe4ab1d755918", 6);
    level.var_4e85625f13c359ab.var_3b2141e078017f8c = getdvarint(@"hash_6822a5ab6d0ee5b5", 1);
    level.var_4e85625f13c359ab.var_b3eb64b6c448164b = getdvarint(@"hash_cdf23d9f5e7a81ec", 1);
    level.var_4e85625f13c359ab.var_796ebb8ad5062d75 = pow(level.var_4e85625f13c359ab.var_cf9f04c2455c9551, 2);
    level.var_4e85625f13c359ab.var_c4afb81e4c3625ab = pow(level.var_4e85625f13c359ab.var_5250e11f76eaf5bb, 2);
    level.var_4e85625f13c359ab.var_3988d42da71ac896 = pow(level.var_4e85625f13c359ab.var_946b411053737262, 2);
    level.var_4e85625f13c359ab.var_4d62bda520da444c = pow(level.var_4e85625f13c359ab.var_a8f585deac0aaa44, 2);
    level.var_4e85625f13c359ab.var_2b88a7031924b832 = getstructarray("searchseizure_poi", "script_noteworthy");
    /#
        level.var_4e85625f13c359ab.var_6b900f15e8843ee1 = getdvar(@"hash_1bce9dfd1fff45ea", "mission_searchseizure_dist_far1");
        level.var_4e85625f13c359ab.var_d469d2b47744369e = getdvarint(@"hash_b9f7bbf6802613de", 0);
        level.var_4e85625f13c359ab.var_4bc2978f55f7802c = getdvarint(@"hash_b9e4ba0c2eddf72d", 0);
        level.var_4e85625f13c359ab.var_65f5eaaed4e7939 = getdvarint(@"hash_30164dafcddf7b6", 0);
        level.var_4e85625f13c359ab.var_37eaf2bc0bb3e28a = getdvarint(@"hash_90b26cc85cd96563", 0);
        level.var_4e85625f13c359ab.var_2a7321f01517a87f = getdvarint(@"hash_e6bfe27f77965dd6", 0);
        level.var_4e85625f13c359ab.var_ccaf922ed3a2d870 = getdvarint(@"hash_f48225c4e42e1051", 0);
    #/
    level.averagealliesz = function_53c4c53197386572(level.averagealliesz, 0);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbe
// Size: 0x3e
function function_63ede2e37ad0a069() {
    if (level.var_4e85625f13c359ab.var_c9a4667d43c3d2b7) {
        namespace_7921f301da16c1ba::init();
    }
    level.var_d8db1602c8bf473e["brloot_vehiclekeys_contract"] = &function_794a9cabccf51a7a;
    level thread function_2cd86aa2dc9d1e75();
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1003
// Size: 0x159
function function_89538dc128a24e58() {
    game["dialog"]["mission_searchseizure_accept"] = "srcs_grav_sscs";
    game["dialog"]["mission_searchseizure_success"] = "srcs_grav_sscc";
    game["dialog"]["mission_searchseizure_fail_destroyed"] = "srcs_grav_scfv";
    game["dialog"]["mission_searchseizure_fail_lost"] = "srcs_grav_ssfl";
    game["dialog"]["mission_searchseizure_fail_time"] = "srcs_grav_sscf";
    game["dialog"]["mission_searchseizure_fail_gas"] = "srcs_grav_ssnx";
    game["dialog"]["mission_searchseizure_timer"] = "srcs_grav_sstm";
    game["dialog"]["mission_searchseizure_dist_far1"] = "srcs_grav_s150";
    game["dialog"]["mission_searchseizure_dist_far2"] = "srcs_grav_s151";
    game["dialog"]["mission_searchseizure_dist_close1"] = "srcs_grav_ss60";
    game["dialog"]["mission_searchseizure_dist_close2"] = "srcs_grav_ss61";
    game["dialog"]["mission_searchseizure_dz_cleared"] = "srcs_grav_sslg";
    game["dialog"]["mission_searchseizure_key"] = "srcs_grav_slsg";
    game["dialog"]["mission_searchseizure_airstrike"] = "srcs_grav_ssrs";
    game["dialog"]["mission_searchseizure_heli_arrive"] = "srcs_grav_sshl";
    game["dialog"]["mission_searchseizure_heli_destroyed"] = "srcs_grav_sshd";
    game["dialog"]["mission_searchseizure_heli_depart"] = "srcs_grav_sshp";
    game["dialog"]["mission_searchseizure_dropoff_coord"] = "srcs_grav_sspl";
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1163
// Size: 0x25
function function_2cd86aa2dc9d1e75() {
    level waittill("prematch_done");
    namespace_bfef6903bca5845d::function_ba4022744dce59f6("searchseizure", 50);
    namespace_8d9453d94dd4f401::function_b146e2b40516b668("searchseizure");
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118f
// Size: 0x10b
function function_5dee7155086e9ada() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("srcs_grav_ss61");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("MP_DMZ_MISSIONS/CONTRACT_ICON_LABEL", "vehicle_owner_update", &function_4345f8a9f656b405);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("off", "br_searchseizure_quest_timer_expired", &function_a436c573abc56a6a);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b71dae6abf83d269);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_87ac4dc3e17d9720);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3783df970b21d0b9);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_8f4bec208d29321a);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_d34f28c4111fcc3);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_756f0952a1f01e6d);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a805454c14fec2d);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_64ccd72856415728);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_acc43fa45aaf68be);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a1
// Size: 0x2e5
function private function_8b51245f6bbe5bbd(var_56ac4b49cc795bc0) {
    var_6f42354cebcd7f35 = getclosestpointonnavmesh(self.origin);
    if (!isdefined(var_6f42354cebcd7f35)) {
        /#
            /#
                assertmsg("<unknown string>" + self.origin + "<unknown string>");
            #/
        #/
        return;
    }
    spawnpoints = getrandomnavpoints(var_6f42354cebcd7f35, 1536, 64);
    var_59ba6be73235750f = [];
    if (!isdefined(spawnpoints)) {
        /#
            assertmsg("Didn't find any valid navpoints at " + self.origin + "! Potential navmesh issue.");
        #/
        return;
    }
    var_8357fb6a08a850d5 = randomintrange(level.var_4e85625f13c359ab.var_b4862b86b957b504, level.var_4e85625f13c359ab.var_1aa0d8c830908356);
    spawnpoints = array_randomize(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        if (distance2dsquared(self.origin, spawnpoint) <= pow(192, 2) || !namespace_2000a83505151e5b::function_5867290fda7a1ac1(spawnpoint, 64, 512, 128)) {
            continue;
        }
        var_59ba6be73235750f = array_add(var_59ba6be73235750f, spawnpoint);
        if (var_59ba6be73235750f.size % 2 == 0 && var_59ba6be73235750f.size != var_8357fb6a08a850d5) {
            var_59ba6be73235750f = array_add(var_59ba6be73235750f, spawnpoint);
        }
        if (var_59ba6be73235750f.size == var_8357fb6a08a850d5) {
            break;
        }
    }
    /#
        /#
            assertex(var_59ba6be73235750f.size == var_8357fb6a08a850d5, "<unknown string>" + var_59ba6be73235750f.size + "<unknown string>" + var_8357fb6a08a850d5);
        #/
    #/
    var_fcdc7f62624c71ff = "guard";
    groupname = namespace_bfef6903bca5845d::function_78759441c259f58a();
    var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_59ba6be73235750f[0]);
    self.agents = [];
    self.groupname = groupname;
    for (i = 0; i < var_59ba6be73235750f.size; i++) {
        tier = 1 + (istrue(var_56ac4b49cc795bc0) && i + 1 == var_59ba6be73235750f.size);
        var_dcf5e15c58c4152a = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, var_171f90b9c4c76d44, var_fcdc7f62624c71ff, undefined, tier, undefined);
        agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(var_dcf5e15c58c4152a, var_59ba6be73235750f[i], (0, randomint(360), 0), "high", "searchseizure", "searchTask", groupname, undefined, undefined, var_171f90b9c4c76d44, 0, 0, 0, undefined, 0);
        if (isdefined(agent)) {
            if (isagent(agent)) {
                namespace_14d36171baccf528::function_350cf0db9f5e0cbe(agent, "groupName", groupname);
                agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256, var_59ba6be73235750f[i]);
                self.agents = array_add(self.agents, agent);
            } else {
                /#
                    println("<unknown string>");
                #/
            }
        } else {
            /#
                println("<unknown string>");
            #/
        }
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x158d
// Size: 0x50
function private function_c99b96671f305d48(baseaccuracy, time) {
    self endon("death");
    var_fd9d97f334db3d29 = self.baseaccuracy;
    self.baseaccuracy = baseaccuracy;
    waittill_notify_or_timeout("damage", time);
    self.baseaccuracy = var_fd9d97f334db3d29;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e4
// Size: 0x22f
function function_f23647a77ee053e4() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self clearlookatent();
    self setmaxpitchroll(0, 0);
    self notify("leaving");
    var_df6c75d1a1e4ff18 = 3;
    var_e757789796c82383 = (0, 0, 1000);
    var_bb0e78a73b33d580 = self.origin + var_e757789796c82383;
    var_bc09a6e223b96348 = undefined;
    var_690e4620fe5fa98f = undefined;
    var_ec0c66c48e6f8304 = undefined;
    while (var_df6c75d1a1e4ff18 > 0) {
        flightpath = namespace_9abe40d2af041eb2::function_999fe3838d6b6f8c(var_bb0e78a73b33d580, self.angles, 350, 25000);
        if (isdefined(flightpath.end)) {
            var_bc09a6e223b96348 = flightpath.start;
            var_690e4620fe5fa98f = flightpath.end;
            var_ec0c66c48e6f8304 = flightpath.angles;
            break;
        }
        var_bb0e78a73b33d580 = var_bb0e78a73b33d580 + (0, 0, 1000);
        var_df6c75d1a1e4ff18--;
        wait(0.05);
    }
    if (!isdefined(var_690e4620fe5fa98f)) {
        namespace_343543689c1d8859::choppersupport_crash(100);
        namespace_343543689c1d8859::choppersupport_explode();
    } else {
        var_1602fab5eab68601 = 150;
        var_2451a07aca478bf6 = 50;
        self setyawspeed(var_1602fab5eab68601, 50, 50, 0.5);
        self settargetyaw(var_ec0c66c48e6f8304[1]);
        self vehicle_setspeed(var_2451a07aca478bf6, 25);
        pathgoal = var_bc09a6e223b96348;
        self setvehgoalpos(pathgoal, 1);
        self waittill("goal");
        var_f457885f9e89c75d = 0;
        while (var_f457885f9e89c75d < 2) {
            currentyaw = (0, self.angles[1], 0);
            yawdiff = var_ec0c66c48e6f8304 - currentyaw;
            if (abs(yawdiff[1]) < 5) {
                break;
            }
            var_f457885f9e89c75d = var_f457885f9e89c75d + level.framedurationseconds;
            waitframe();
        }
        self setmaxpitchroll(15, 15);
        self vehicle_setspeed(150, self.accel);
        self setvehgoalpos(var_690e4620fe5fa98f, 1);
        self setneargoalnotifydist(1000);
        waittill_any_timeout_1(10, "near_goal");
        namespace_343543689c1d8859::choppersupport_cleanup(0);
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181a
// Size: 0xe2
function helicopter_start(position, var_9ca5b7427ae3d1f2, var_ec75cff8b549413) {
    var_109d904fa5bb4c5c = spawnstruct();
    var_109d904fa5bb4c5c.health = 5000;
    var_109d904fa5bb4c5c.speed = 100;
    var_109d904fa5bb4c5c.accel = 40;
    var_109d904fa5bb4c5c.var_a659d1d5a6693d1a = 16;
    var_109d904fa5bb4c5c.var_b4101d72e3cd2abd = 3;
    var_109d904fa5bb4c5c.var_62c8f81fff6aa072 = 0.1;
    var_109d904fa5bb4c5c.accuracy = 35;
    var_109d904fa5bb4c5c.range_squared = 4000000;
    var_109d904fa5bb4c5c.team = "team_hundred_ninety_five";
    position = position + (0, 0, 1000);
    escortheli = namespace_7921f301da16c1ba::function_3ddb1de0c470a2b2(var_9ca5b7427ae3d1f2, var_ec75cff8b549413, position, var_109d904fa5bb4c5c);
    if (!isdefined(escortheli)) {
        return undefined;
    }
    return escortheli;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1904
// Size: 0x63
function function_37e73a6a4c1afb18(teamname) {
    createquestobjicon("ui_map_icon_obj_searchseizure", "current");
    objective_removeallfrommask(self.objectiveiconid);
    thread function_ead4d06481b4437e(self.objectiveiconid, teamname);
    objective_setshowdistance(self.objectiveiconid, 1);
    objective_setdescription(self.objectiveiconid, "MP_DMZ_MISSIONS/CONTRACT_ICON_LABEL");
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196e
// Size: 0xe9
function function_545f0df81e095369(target, var_630cc7e8a4141d21) {
    self endon("task_ended");
    self endon("task_cleanup");
    if (!isdefined(self.objectiveiconid)) {
        /#
            /#
                assertmsg("<unknown string>" + istrue(self.var_e73782cba9916649));
            #/
        #/
        return;
    }
    if (isdefined(target)) {
        if (isvector(target)) {
            namespace_5a22b6f3a56f7e9b::update_objective_position(self.objectiveiconid, target + (0, 0, 64));
            namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.objectiveiconid, 0);
        } else if (isent(target) || target isscriptable()) {
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.objectiveiconid, target);
            namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.objectiveiconid, 64);
        }
        namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objectiveiconid, istrue(var_630cc7e8a4141d21));
    } else {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a5e
// Size: 0xc9
function private function_794a9cabccf51a7a(pickup, player) {
    if (isdefined(pickup.instance) && isdefined(pickup.instance.task)) {
        instance = pickup.instance;
        task = instance.task;
        task function_545f0df81e095369(task.vehicle);
        if (isdefined(task.vehicle.useobject)) {
            task.vehicle.useobject delete();
        }
        task.vehicle thread function_cca3d2bc5739c2a6(task, 0);
        return 1;
    }
    return 0;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2f
// Size: 0x8b
function function_3fb629470ea4f5f6() {
    self waittill("death");
    params = spawnstruct();
    params.intvar = 0;
    task = self.task;
    task displayteamsplash(task.teams[0], "br_searchseizure_quest_failure", params, "splash_list_br_contract_searchseizure");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_fail_destroyed", task.teams[0], 1, 2);
    task thread function_8d032f436b816d9d(0, undefined, "VehKilled");
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc1
// Size: 0x24f
function function_4d6d52197650fb91() {
    self endon("death");
    self endon("kill_distance_watcher");
    var_b4f98212cbc88c60 = 0;
    var_47f2674d63cd0747 = 0;
    var_5db87d3df0b608ef = level.var_4e85625f13c359ab.var_3988d42da71ac896 * pow(1.5, 2);
    var_24d0d992023428e0 = level.var_4e85625f13c359ab.var_3988d42da71ac896 * pow(1.5, 2);
    if (self.vehiclename == "veh9_suv_1996") {
        wait_time_in_ms(5000);
    }
    while (1) {
        occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(self);
        if (occupants.size == 0) {
            waitframe();
            continue;
        }
        if (namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown()) {
            self notify("kill_distance_watcher");
            return;
        }
        if (!var_b4f98212cbc88c60 && distance2dsquared(self.origin, self.task.endnode.origin) <= var_5db87d3df0b608ef) {
            var_b4f98212cbc88c60 = 1;
            self.task notify("task_within_distance");
            if (cointoss()) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_dist_far1", self.task.teams[0], 1, 2);
            } else {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_dist_far2", self.task.teams[0], 1, 2);
            }
            waitframe();
            continue;
        }
        if (!var_47f2674d63cd0747 && level.var_4e85625f13c359ab.var_dad5abd3a17a252e > 1 && distance2dsquared(self.origin, self.task.endnode.origin) <= var_24d0d992023428e0) {
            var_47f2674d63cd0747 = 1;
            self.task notify("task_eliminate_hostiles");
            if (cointoss()) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_dist_close1", self.task.teams[0], 1, 2);
            } else {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_dist_close2", self.task.teams[0], 1, 2);
            }
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        }
        wait(1);
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e17
// Size: 0xf6
function function_4944e32d48208083(type, origin, angles) {
    spawnposition = origin;
    spawnangles = angles * (0, 1, 0);
    spawndata = spawnstruct();
    spawndata.origin = spawnposition;
    spawndata.angles = spawnangles;
    spawndata.spawntype = "LEVEL";
    vehicle = namespace_1f188a13f7e79610::vehicle_spawn(ter_op(is_equal(type, "land"), "veh9_suv_1996", "veh9_patrol_boat"), spawndata);
    vehicle.fuel = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle(vehicle.vehiclename).var_29f1ea79ed2b40dd / 2;
    vehicle.var_7ee6203c5532a9e6 = 1;
    vehicle.damagecallback = &function_96b758d589365ef6;
    return vehicle;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f15
// Size: 0x98
function function_ac069e47f0ef3b9e(task, vehicle) {
    self endon("entitydeleted");
    task endon("task_ended");
    vehicle endon("death");
    while (1) {
        player = self waittill("trigger");
        if (namespace_7e17181d03156026::isinlaststand(player)) {
            continue;
        }
        if (vehicle namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown()) {
            return;
        }
        if (isdefined(task.keysForVehicle)) {
            task function_545f0df81e095369(vehicle);
            namespace_cb965d2f71fefddc::loothide(task.keysForVehicle);
        }
        vehicle thread function_cca3d2bc5739c2a6(task, 0);
        self delete();
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb4
// Size: 0x116
function function_96b758d589365ef6(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    if (istrue(attacker.var_c0aa24316813868f) && objweapon.basename == "toma_proj_mp") {
        var_45c7a5781e6ced58 = ter_op(self.vehiclename == "veh9_suv_1996", 3, 5);
        damage = int(ceil(self.maxhealth / var_45c7a5781e6ced58));
        self.var_1faa3d3dec8d49bd = 1;
    }
    self [[ level.vehicles.damagecallback ]](inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid);
    self.var_1faa3d3dec8d49bd = undefined;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d1
// Size: 0x29
function function_85dc015a530eba24() {
    level endon("game_ended");
    self.task endon("task_ended");
    childthread function_3fb629470ea4f5f6();
    childthread function_c54f10c1d2cd38d5();
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2101
// Size: 0x1ab
function function_c54f10c1d2cd38d5() {
    self endon("death");
    while (1) {
        self waittill("vehicle_owner_update");
        if (!isdefined(self.owner) || namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown()) {
            continue;
        }
        driver = self.owner;
        if (driver.team != self.task.teams[0]) {
            params = spawnstruct();
            params.intvar = 0;
            self.task displayteamsplash(self.task.teams[0], "br_searchseizure_quest_target_lost", params, "splash_list_br_contract_searchseizure");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_fail_lost", self.task.teams[0], 1, 2);
            self.task thread function_8d032f436b816d9d(0, undefined, "VehStolen");
            return;
        }
        driver childthread function_d40a1db55c22abac(self);
        self.task displayteamsplash(driver.team, "br_searchseizure_quest_deliver_asset", undefined, "splash_list_br_contract_searchseizure");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_dropoff_coord", self.task.teams[0], 1, 2);
        if (istrue(self.task.var_96f861daeeb48a6)) {
            self.task function_545f0df81e095369(self.task.endnode.groundpos);
            continue;
        }
        self.task thread function_e6858a6a14325d0(driver, self);
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b3
// Size: 0x7b
function function_d40a1db55c22abac(vehicle) {
    waittill_any_3("vehicle_seat_exit", "death_or_disconnect", "killed_player");
    if (isdefined(self.vehicle)) {
        return;
    }
    if (vehicle.occupants.size > 0) {
        return;
    }
    vehicle.task displayteamsplash(self.team, "br_searchseizure_quest_deliver_asset", undefined, "splash_list_br_contract_searchseizure");
    vehicle.task function_545f0df81e095369(vehicle);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2335
// Size: 0x95
function function_894fdc630b584297(origin, angles, radius, height) {
    trigger = spawn("trigger_radius", origin, 0, radius, height);
    trigger.effect = spawnfx(level._effect["vfx_smktrail_mortar"], origin + (0, 0, 16));
    trigger.angles = angles;
    trigger thread function_26a3b8aadf24c800(self);
    triggerfx(trigger.effect);
    return trigger;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d2
// Size: 0x20c
function function_26a3b8aadf24c800(task) {
    level endon("game_ended");
    task endon("task_ended");
    driver = undefined;
    while (1) {
        entity = self waittill("trigger");
        if (isdefined(entity) && entity isvehicle() && !entity namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown()) {
            if (!is_equal(task, entity.task)) {
                continue;
            }
            if (level.var_4e85625f13c359ab.var_f767533f0cc83c57 && isdefined(entity.task.endnode.agents) && entity.task.endnode.agents.size > 0) {
                continue;
            }
            occupant = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(entity);
            if (!isdefined(occupant)) {
                occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(entity);
                if (occupants.size > 0) {
                    keys = getarraykeys(occupants);
                    occupant = occupants[keys[0]];
                }
            }
            break;
        }
    }
    /#
        /#
            assert(isdefined(occupant) && isplayer(occupant));
        #/
    #/
    teamname = task.teams[0];
    players = getteamdata(teamname, "players");
    displaysquadmessagetoteam(teamname, occupant, 8, getquestindex("searchseizure"));
    rewards = function_d212a5e7a40d7c8d("searchseizure", teamname, task.vehicle);
    if (!namespace_d3d40f75bb4e4c32::istutorial()) {
        if (isdefined(rewards) && isdefined(rewards["plunder"])) {
            function_878ebcc241b54505("br_searchseizure_quest_complete", function_3d262d56274bd22e("searchseizure"), rewards["plunder"], teamname, undefined, "splash_list_br_contract_searchseizure");
        }
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_success", teamname, 1, 2);
    }
    task thread function_8d032f436b816d9d(1, rewards, "Win");
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e5
// Size: 0x12b
function function_cca3d2bc5739c2a6(task, var_20e9f4f3f1f66219) {
    self.islocked = 0;
    task.keysForVehicle = undefined;
    namespace_448ccf1ca136fbbe::function_3677f2be30fdd581("single", "vehicle_use");
    if (istrue(var_20e9f4f3f1f66219)) {
        return;
    }
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(task.teams[0], "players")) {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_6b31daeaad06caa5");
    }
    utility::function_3677f2be30fdd581("single", "vehicle_use");
    if (self getscriptablehaspart("lights")) {
        utility::function_3677f2be30fdd581("car_alarm", "off");
        for (i = 0; i < 4; i++) {
            if (i % 2 == 0) {
                utility::function_3677f2be30fdd581("lights", "on");
            } else {
                utility::function_3677f2be30fdd581("lights", "off");
            }
            wait(0.5);
        }
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2717
// Size: 0xdd
function function_dd9ec28de865596e(origin, angles, ignoreent) {
    self endon("task_ended");
    self endon("task_cleanup");
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, origin, angles, ignoreent, undefined);
    item = namespace_cb965d2f71fefddc::spawnpickup("brloot_vehiclekeys_contract", var_cb4fad49263e20c4, 1, 1, undefined, 1);
    item.var_bbc200bc77c5db2b = 1;
    item.task = self;
    self.keysForVehicle = item;
    while (item getscriptablepartstate("brloot_vehiclekeys_contract") != "visible") {
        waitframe();
    }
    function_545f0df81e095369(item.origin, 1);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_key", self.teams[0], 1, 2);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fb
// Size: 0x1ad
function function_d01cb68a0f2ea6f6() {
    endnode = self.endnode;
    var_aa517194e54f048b = undefined;
    groundpos = undefined;
    starttrace = endnode.origin + (0, 0, 128);
    endtrace = endnode.origin - (0, 0, 64);
    contents = ter_op(self.var_4f9872239d5ffa28 == "land", namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0), namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1));
    var_aa517194e54f048b = ray_trace(starttrace, endtrace, undefined, contents, 0, 0, 0);
    if (isdefined(var_aa517194e54f048b["hittype"] != "hittype_none") && isdefined(var_aa517194e54f048b["position"])) {
        groundpos = var_aa517194e54f048b["position"];
    } else {
        groundpos = self.origin;
        /#
            /#
                assertmsg("<unknown string>" + self.origin);
            #/
        #/
    }
    endnode.groundpos = groundpos;
    /#
        level.var_4e85625f13c359ab.var_dad5abd3a17a252e = getdvarint(@"hash_fc51239397667145", 0);
    #/
    if (level.var_4e85625f13c359ab.var_dad5abd3a17a252e > 1 && self.var_4f9872239d5ffa28 != "water") {
        endnode function_8b51245f6bbe5bbd();
    }
    endnode.trigger = function_894fdc630b584297(groundpos, endnode.angles, 96, 128);
    function_545f0df81e095369(groundpos);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29af
// Size: 0x22c
function function_42a696d8b1cc5aad(type, var_7285afd5055bda71) {
    var_e734085ab058d0b4 = function_51ca04c003f5020(type, var_7285afd5055bda71, level.var_4e85625f13c359ab.var_796ebb8ad5062d75, level.var_4e85625f13c359ab.var_c4afb81e4c3625ab);
    if (var_e734085ab058d0b4.size == 0) {
        return undefined;
    }
    var_fdc6ee1b91ebb7bf = undefined;
    var_220e66163356b51e = undefined;
    var_24588c4e37e62333 = undefined;
    if (!level.br_circle_disabled) {
        var_527a7b84d978e792 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(var_7285afd5055bda71);
        var_fdc6ee1b91ebb7bf = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_527a7b84d978e792);
    }
    bestnode = undefined;
    bestdist = level.var_4e85625f13c359ab.var_5250e11f76eaf5bb;
    foreach (node in var_e734085ab058d0b4) {
        if (is_equal(node.script_type, "end")) {
            continue;
        }
        dist = distance2d(node.origin, var_7285afd5055bda71);
        if (dist > bestdist) {
            continue;
        }
        if (!level.br_circle_disabled) {
            var_220e66163356b51e = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(node.origin);
            var_24588c4e37e62333 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_220e66163356b51e);
            jumpiffalse(var_24588c4e37e62333 < var_fdc6ee1b91ebb7bf) LOC_00000181;
        } else {
        LOC_00000181:
            var_5435995e95681b89 = 0;
            if (dist < level.var_4e85625f13c359ab.var_f618c857c91d9adc) {
                if (dist < level.var_4e85625f13c359ab.var_623c71246715c68a) {
                    var_5435995e95681b89 = level.var_4e85625f13c359ab.var_623c71246715c68a - dist;
                }
            } else {
                var_5435995e95681b89 = dist - level.var_4e85625f13c359ab.var_f618c857c91d9adc;
            }
            if (var_5435995e95681b89 < bestdist) {
                bestdist = var_5435995e95681b89;
                bestnode = node;
                bestnode.var_e1384ff4a85e24e6 = var_220e66163356b51e;
                bestnode.var_9d42d8cffef859fb = var_24588c4e37e62333;
                if (var_5435995e95681b89 <= 0) {
                    break;
                }
            }
        }
    }
    return bestnode;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be3
// Size: 0x214
function function_206405b8c9d63038(type, startnode) {
    var_c09a118d31c10225 = function_51ca04c003f5020(type, startnode.origin, level.var_4e85625f13c359ab.var_3988d42da71ac896, level.var_4e85625f13c359ab.var_4d62bda520da444c);
    if (var_c09a118d31c10225.size == 0) {
        /#
            println("<unknown string>" + startnode.origin + "<unknown string>" + type);
        #/
        return undefined;
    }
    bestnode = undefined;
    bestdist = level.var_4e85625f13c359ab.var_a8f585deac0aaa44;
    foreach (node in var_c09a118d31c10225) {
        if (is_equal(node.script_type, "start")) {
            continue;
        }
        dist = distance2d(node.origin, startnode.origin);
        if (dist > bestdist) {
            continue;
        }
        if (!level.br_circle_disabled) {
            var_220e66163356b51e = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(node.origin);
            var_24588c4e37e62333 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_220e66163356b51e);
            jumpiffalse(var_24588c4e37e62333 < startnode.var_9d42d8cffef859fb) LOC_00000183;
        } else {
        LOC_00000183:
            var_5435995e95681b89 = 0;
            if (dist < level.var_4e85625f13c359ab.var_f618c857c91d9adc) {
                if (dist < level.var_4e85625f13c359ab.var_623c71246715c68a) {
                    var_5435995e95681b89 = level.var_4e85625f13c359ab.var_623c71246715c68a - dist;
                }
            } else {
                var_5435995e95681b89 = dist - level.var_4e85625f13c359ab.var_f618c857c91d9adc;
            }
            if (var_5435995e95681b89 < bestdist) {
                bestdist = var_5435995e95681b89;
                bestnode = node;
                if (var_5435995e95681b89 <= 0) {
                    break;
                }
            }
        }
    }
    return bestnode;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dff
// Size: 0x17c
function function_51ca04c003f5020(type, searchpos, mindistsq, maxdistsq, var_8a0186f902bafaef) {
    var_2b88a7031924b832 = array_randomize(level.var_4e85625f13c359ab.var_2b88a7031924b832);
    /#
        level.var_4e85625f13c359ab.var_4bc2978f55f7802c = getdvarint(@"hash_b9e4ba0c2eddf72d", 0);
        if (level.var_4e85625f13c359ab.var_4bc2978f55f7802c) {
            var_2b88a7031924b832 = function_da1254f452e43d24();
        }
    #/
    if (is_equal(type, "water")) {
        mindistsq = undefined;
        maxdistsq = undefined;
    }
    var_44dc45a56feea28e = [];
    foreach (node in var_2b88a7031924b832) {
        if (isdefined(mindistsq) && isdefined(maxdistsq)) {
            distsq = distance2dsquared(node.origin, searchpos);
            jumpiffalse(distsq < mindistsq || distsq > maxdistsq) LOC_00000123;
        } else {
        LOC_00000123:
            if (isdefined(type) && !is_equal(node.script_string, type)) {
                continue;
            }
            if (!istrue(var_8a0186f902bafaef) && istrue(node.inuse)) {
                continue;
            }
            var_44dc45a56feea28e = array_add(var_44dc45a56feea28e, node);
        }
    }
    return var_44dc45a56feea28e;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f83
// Size: 0x20c
function private function_a60307adcc0aded1(agent, attacker) {
    subcategory = namespace_14d36171baccf528::function_e2292dcf63eccf7a(agent, "subcategory");
    if (!is_equal("searchTask", subcategory)) {
        return;
    }
    groupname = namespace_14d36171baccf528::function_e2292dcf63eccf7a(agent, "groupName");
    if (is_equal(self.startnode.groupname, groupname)) {
        if (level.var_4e85625f13c359ab.var_3b2141e078017f8c) {
            vehicle = namespace_14d36171baccf528::function_e2292dcf63eccf7a(agent, "keysForVehicle");
            if (isdefined(vehicle) && vehicle isvehicle() && !vehicle namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown() && istrue(vehicle.islocked)) {
                if (is_equal(attacker.team, self.teams[0])) {
                    /#
                        attacker iprintlnbold("<unknown string>");
                    #/
                } else {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                }
                thread function_dd9ec28de865596e(agent.origin, agent.angles, agent);
            }
        }
        self.startnode.agents = array_remove(self.startnode.agents, agent);
        if (self.startnode.agents.size == 0) {
            /#
                iprintln("<unknown string>");
            #/
        }
    } else if (is_equal(self.endnode.groupname, groupname)) {
        self.endnode.agents = array_remove(self.endnode.agents, agent);
        if (self.endnode.agents.size == 0) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_dz_cleared", self.teams[0], 1, 2);
            /#
                iprintln("<unknown string>");
            #/
        }
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3196
// Size: 0x5b
function function_8d032f436b816d9d(success, results, var_4048d341197bbe4b) {
    self notify("task_ended");
    self.ended = 1;
    thread function_8af2a0d1c41847e3();
    wait(1);
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined), results, undefined, var_4048d341197bbe4b);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f8
// Size: 0x21
function function_e05bdb2a6122fe4a() {
    if (!level.var_4e85625f13c359ab.enabled) {
        return 0;
    }
    return function_d97ac1473f7695b();
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3221
// Size: 0xb0
function function_89e3fc49199d2019() {
    self.category = "searchseizure";
    teamname = self.teams[0];
    /#
        if (!istrue(self.tablet.init)) {
            if (isdefined(self.startnode)) {
                self.startnode.inuse = 0;
            }
            if (isdefined(self.endnode)) {
                self.endnode.inuse = 0;
            }
            function_93663fe58d95f174(undefined, undefined, undefined, "<unknown string>");
            return;
        }
    #/
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_a60307adcc0aded1);
    function_c28cf680f4d0d4dc(teamname);
    function_b76f3380abd30d8e();
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d8
// Size: 0x1c
function function_80274c086eee31b8(attacker, victim) {
    function_6bfac610c587bf3c(victim);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32fb
// Size: 0x14
function function_51d9f22059847793(player) {
    function_6bfac610c587bf3c(player);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3316
// Size: 0x5b
function function_6bfac610c587bf3c(player) {
    if (player.team == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.teams[0], level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            function_8d032f436b816d9d(0, undefined, "Killed");
        }
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3378
// Size: 0x1e
function function_e1c4d606e2a5334a(player) {
    if (function_42a0806457ea8039(player)) {
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339d
// Size: 0x1e
function function_7ba3a0f93e96979c(player) {
    if (function_42a0806457ea8039(player)) {
        showquestobjicontoplayer(player);
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c2
// Size: 0x6d
function function_30ff47cffe7fca99(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(oldteam, level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            thread function_4448ccf5aaafbcd2(oldteam);
        } else {
            player uiobjectivehide();
            objective_removeclientfrommask(self.objectiveiconid, player);
        }
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3436
// Size: 0x6c
function function_e16cc4efa3a21aad(player, oldteam, newteam) {
    if (!isdefined(self.vehicle)) {
        return;
    }
    if (newteam == self.teams[0]) {
        objective_addclienttomask(self.objectiveiconid, player);
        player uiobjectiveshow("searchseizure");
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a9
// Size: 0x2c
function function_4448ccf5aaafbcd2(team) {
    if (istrue(self.teams[0] == team)) {
        thread function_8d032f436b816d9d(0, undefined, "Cancel");
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34dc
// Size: 0x9c
function function_c28cf680f4d0d4dc(team) {
    uiobjectiveshowtoteam("searchseizure", team);
    time = function_9b6275085fbcb8f4(level.var_4e85625f13c359ab.time);
    function_5a15174d34f0670c(time, 0);
    thread function_ba49db393bed5b9();
    displayteamsplash(team, "br_searchseizure_quest_start_team", undefined, "splash_list_br_contract_searchseizure");
    displaysquadmessagetoteam(team, self.var_d154ac2657c5f44, 6, getquestindex("searchseizure"));
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_accept", self.teams[0], 1, 2);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357f
// Size: 0x42c
function function_b76f3380abd30d8e() {
    vehicle = undefined;
    vehicles = vehicle_getarrayinradius(self.startnode.origin, 512);
    if (isdefined(vehicles) && vehicles.size > 0) {
        var_8c33e181f5ddae3c = [];
        vehiclename = ter_op(is_equal(self.var_4f9872239d5ffa28, "land"), "veh9_suv_1996", "veh9_patrol_boat");
        var_22e70dbeb2df9621 = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle(vehiclename).var_29f1ea79ed2b40dd / 4;
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle.task)) {
                continue;
            }
            if (!isdefined(vehicle.fuel) || !isdefined(var_22e70dbeb2df9621)) {
                continue;
            }
            if (vehicle.vehiclename != vehiclename) {
                continue;
            }
            if (vehicle.fuel < var_22e70dbeb2df9621) {
                continue;
            }
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle);
            if (occupants.size > 0) {
                continue;
            }
            if (vehicle.health / vehicle.maxhealth < 0.33) {
                continue;
            }
            if (vehicle namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown()) {
                continue;
            }
            var_8c33e181f5ddae3c = array_add(var_8c33e181f5ddae3c, vehicle);
        }
        vehicle = function_7a2aaa4a09a4d250(var_8c33e181f5ddae3c);
    }
    if (!isdefined(vehicle)) {
        vehicle = function_4944e32d48208083(self.var_4f9872239d5ffa28, self.startnode.origin, self.startnode.angles);
    }
    vehicle.task = self;
    vehicle thread function_85dc015a530eba24();
    vehicle utility::function_3677f2be30fdd581("car_alarm", "on");
    function_37e73a6a4c1afb18(self.teams[0]);
    function_545f0df81e095369(vehicle);
    /#
        level.var_4e85625f13c359ab.var_dad5abd3a17a252e = getdvarint(@"hash_fc51239397667145", 0);
    #/
    if (level.var_4e85625f13c359ab.var_dad5abd3a17a252e % 2 == 1) {
        self.startnode function_8b51245f6bbe5bbd(level.var_4e85625f13c359ab.var_3b2141e078017f8c);
    }
    if (level.var_4e85625f13c359ab.var_3b2141e078017f8c) {
        vehicle.islocked = 1;
        vehicle utility::function_3677f2be30fdd581("single", "vehicle_unusable");
        if (level.var_4e85625f13c359ab.var_b3eb64b6c448164b) {
            tag = ter_op(is_equal(self.var_4f9872239d5ffa28, "land"), "tag_door_front_left", "tag_steering_axis");
            tagorigin = vehicle gettagorigin(tag);
            radius = 96;
            fov = 120;
            hintstring = "MP_BR_INGAME/UNLOCK_VEHICLE";
            useobject = namespace_19b4203b51d56488::createhintobject(tagorigin, "HINT_BUTTON", undefined, hintstring, undefined, "duration_long", "show", radius, fov, radius, fov);
            useobject linkto(vehicle, tag);
            useobject thread function_ac069e47f0ef3b9e(self, vehicle);
            vehicle.useobject = useobject;
        }
        if (isdefined(self.startnode.agents) && self.startnode.agents.size > 0) {
            agent = self.startnode.agents[self.startnode.agents.size - 1];
            namespace_14d36171baccf528::function_350cf0db9f5e0cbe(agent, "keysForVehicle", vehicle);
            array_thread(self.startnode.agents, &function_c99b96671f305d48, 0.01, 5);
        }
    }
    self.vehicle = vehicle;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b2
// Size: 0x255
function function_8af2a0d1c41847e3() {
    self notify("task_cleanup");
    /#
        self.var_e73782cba9916649 = 1;
    #/
    namespace_bfef6903bca5845d::function_66a6064fad612bf3(&function_a60307adcc0aded1);
    if (isdefined(self.vehicle.useobject)) {
        self.vehicle.useobject delete();
    }
    if (level.var_4e85625f13c359ab.var_3b2141e078017f8c) {
        if (isdefined(self.keysForVehicle)) {
            namespace_cb965d2f71fefddc::loothide(self.keysForVehicle);
        }
        if (self.vehicle.islocked) {
            self.vehicle thread function_cca3d2bc5739c2a6(self, 1);
        }
    }
    self.vehicle.task = undefined;
    self.vehicle.damagecallback = undefined;
    self.vehicle = undefined;
    self.startnode.inuse = 0;
    if (isdefined(self.endnode)) {
        self.endnode.inuse = 0;
        if (isdefined(self.endnode.trigger)) {
            self.endnode.trigger.effect delete();
            self.endnode.trigger delete();
        }
    }
    if (isdefined(self.var_66549ca9bc89058c)) {
        foreach (fxent in self.var_66549ca9bc89058c) {
            fxent delete();
        }
        self.var_66549ca9bc89058c = undefined;
    }
    if (checkforactiveobjicon()) {
        deletequestobjicon();
        self.objectiveiconid = undefined;
    }
    if (isdefined(self.helicopter)) {
        self.helicopter notify("change_movement_type", &function_f23647a77ee053e4);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_heli_depart", self.teams[0], 1, 2);
    } else if (isdefined(self.var_ee0fca50e066499f)) {
        wait(9);
        self.var_ee0fca50e066499f delete();
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0e
// Size: 0x13f
function function_d97ac1473f7695b(secondarymode) {
    var_4f9872239d5ffa28 = undefined;
    /#
        if (level.var_4e85625f13c359ab.var_d469d2b47744369e) {
            level.var_4e85625f13c359ab.var_6b900f15e8843ee1 = getdvar(@"hash_1bce9dfd1fff45ea", "mission_searchseizure_dist_far1");
            var_4f9872239d5ffa28 = level.var_4e85625f13c359ab.var_6b900f15e8843ee1;
        }
    #/
    startnode = function_42a696d8b1cc5aad(var_4f9872239d5ffa28, self.tablet.origin);
    if (!isdefined(startnode)) {
        return 0;
    }
    if (!isdefined(startnode.script_string)) {
        /#
            /#
                assertmsg("<unknown string>" + startnode.origin + "<unknown string>");
            #/
        #/
        startnode.script_string = "land";
    }
    var_4f9872239d5ffa28 = startnode.script_string;
    endnode = function_206405b8c9d63038(var_4f9872239d5ffa28, startnode);
    if (!isdefined(endnode)) {
        return 0;
    }
    startnode.inuse = 1;
    endnode.inuse = 1;
    self.startnode = startnode;
    self.endnode = endnode;
    self.var_4f9872239d5ffa28 = var_4f9872239d5ffa28;
    return 1;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d55
// Size: 0xfd
function function_ba49db393bed5b9() {
    level endon("game_ended");
    self endon("task_ended");
    time = function_9b6275085fbcb8f4(level.var_4e85625f13c359ab.time);
    notifytime = time * 0.7;
    var_697c47591112df = time - notifytime;
    wait_time_in_ms(notifytime * 1000);
    if (istrue(self.var_96f861daeeb48a6)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_timer", self.teams[0], 1, 2);
    }
    wait_time_in_ms(var_697c47591112df * 1000);
    params = spawnstruct();
    params.intvar = 0;
    displayteamsplash(self.teams[0], "br_searchseizure_quest_timer_expired", params, "splash_list_br_contract_searchseizure");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_fail_time", self.teams[0], 1, 2);
    thread function_8d032f436b816d9d(0, undefined, "Time");
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e59
// Size: 0x11f
function function_e6858a6a14325d0(player, vehicle) {
    self endon("task_ended");
    vehicle childthread function_4d6d52197650fb91();
    function_d01cb68a0f2ea6f6();
    self.var_96f861daeeb48a6 = 1;
    if (self.var_4f9872239d5ffa28 == "water" && level.var_4e85625f13c359ab.var_c9a4667d43c3d2b7) {
        helicopter = helicopter_start(vehicle.origin, vehicle, player);
        self.helicopter = helicopter;
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_heli_arrive", self.teams[0], 1, 5);
        /#
            iprintlnbold("<unknown string>");
        #/
    } else {
        if (self.var_4f9872239d5ffa28 == "land") {
            self waittill("task_within_distance");
        }
        var_9cbbc426be64a21a = function_b66446c0c80398c2();
        self.var_ee0fca50e066499f = var_9cbbc426be64a21a;
        thread function_be4861d33da1689f(vehicle, var_9cbbc426be64a21a);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_searchseizure_airstrike", self.teams[0], 1, 5);
        /#
            iprintlnbold("<unknown string>");
        #/
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7f
// Size: 0x6a
function function_29abf5b8a864c5dd(target) {
    startpos = target.origin + (0, 0, 32);
    endpos = target.origin + (0, 0, 2048);
    var_5b36d1353e9a2b32 = namespace_2a184fc4902783dc::ray_trace_passed(startpos, endpos, target);
    return !var_5b36d1353e9a2b32;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff1
// Size: 0x481
function function_be4861d33da1689f(target, owner) {
    level endon("game_ended");
    self endon("task_ended");
    self.var_66549ca9bc89058c = [];
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("toma_strike", owner);
    var_e5f2aefa61cc09dc = level.var_4e85625f13c359ab.var_4156aa8334394ed5;
    if (self.var_4f9872239d5ffa28 == "water") {
        var_e5f2aefa61cc09dc = var_e5f2aefa61cc09dc * 2;
    }
    while (1) {
        if (var_e5f2aefa61cc09dc == 0) {
            foreach (var_66549ca9bc89058c in self.var_66549ca9bc89058c) {
                var_66549ca9bc89058c delete();
            }
            self.var_66549ca9bc89058c = undefined;
            break;
        }
        /#
            level.var_4e85625f13c359ab.var_2a7321f01517a87f = getdvarint(@"hash_e6bfe27f77965dd6", 0);
            if (level.var_4e85625f13c359ab.var_2a7321f01517a87f) {
                waitframe();
                continue;
            }
        #/
        if (function_29abf5b8a864c5dd(target)) {
            wait(randomfloatrange(3.5, 5) / 2);
            continue;
        }
        var_e8db9359bd731029 = anglestoforward(target.angles);
        var_3c3e840099ff521e = anglestoright(target.angles);
        var_9e57080ef7594916 = randomfloatrange(4, 4.5);
        var_3e1f9c45395e389f = function_3100067b96889b40(target);
        dotproduct = vectordot(var_e8db9359bd731029, function_d6c95cadde7fcc79(target));
        sign = ter_op(dotproduct >= 0, 1, -1);
        var_49f486c39f38b9d9 = target.origin + var_e8db9359bd731029 * sign * var_3e1f9c45395e389f * var_9e57080ef7594916;
        /#
            level.var_4e85625f13c359ab.var_ccaf922ed3a2d870 = getdvarint(@"hash_f48225c4e42e1051", 0);
            if (level.var_4e85625f13c359ab.var_ccaf922ed3a2d870) {
                radius = 128;
                var_7cadcf765f48d20b = 4;
                thread namespace_d028276791d9cff6::drawsphere(target.origin + var_e8db9359bd731029, radius, var_7cadcf765f48d20b, (0, 1, 0));
                thread namespace_d028276791d9cff6::drawsphere(var_49f486c39f38b9d9, radius, var_7cadcf765f48d20b, (1, 0, 0));
            }
        #/
        var_a0edd3f59d938fb1 = 256;
        var_fa378e997a33a137 = owner namespace_25d6bd23fd862a00::findunobstructedfiringinfo(var_49f486c39f38b9d9, var_a0edd3f59d938fb1, var_e8db9359bd731029, var_e8db9359bd731029, var_3c3e840099ff521e);
        var_41d8fabdcb0957bb = getteamdata(self.teams[0], "players");
        var_c148dfe3dd8379c8 = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(var_fa378e997a33a137.goalpos, var_a0edd3f59d938fb1 * 3, undefined, var_41d8fabdcb0957bb);
        if (isdefined(var_c148dfe3dd8379c8) && var_c148dfe3dd8379c8.size > 0) {
            /#
                iprintln("<unknown string>");
            #/
            wait(randomfloatrange(3.5, 5));
            continue;
        }
        fxent = undefined;
        if (level.var_4e85625f13c359ab.var_74de30492b65dedb) {
            fxent = spawnfx(level._effect["vfx_dom_flare"], var_fa378e997a33a137.goalpos);
        } else {
            foreach (player in getteamdata(self.teams[0], "players")) {
                if (isalive(player)) {
                    fxent = spawnfxforclient(level._effect["vfx_dom_flare"], var_fa378e997a33a137.goalpos, player);
                }
            }
        }
        triggerfx(fxent);
        self.var_66549ca9bc89058c = array_add(self.var_66549ca9bc89058c, fxent);
        owner namespace_25d6bd23fd862a00::tomastrike_firestrike(1, var_fa378e997a33a137, streakinfo);
        var_e5f2aefa61cc09dc--;
        if (self.var_66549ca9bc89058c.size == 2) {
            self.var_66549ca9bc89058c[0] delete();
            self.var_66549ca9bc89058c = array_remove_index(self.var_66549ca9bc89058c, 0);
        }
        wait(randomfloatrange(3.5, 5));
    }
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4479
// Size: 0x67
function function_b66446c0c80398c2() {
    fakeent = spawn_tag_origin();
    fakeent.pers = [];
    fakeent.pers["deaths"] = 0;
    fakeent.pers["nextKillstreakID"] = 0;
    fakeent.team = "team_hundred_ninety_five";
    fakeent.var_c0aa24316813868f = 1;
    return fakeent;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x44e8
// Size: 0x4b
function private function_f61b0caf9a0b523a(origin, offset, color, var_735a70be53a0e4b5) {
    /#
        var_f8a269392b9c9b15 = function_fa2f22ee06932f1d(var_735a70be53a0e4b5);
        line(origin, origin + offset, color, 1, 0, var_f8a269392b9c9b15);
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x453a
// Size: 0x20
function private function_fa2f22ee06932f1d(seconds) {
    /#
        return int(seconds / level.framedurationseconds);
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4561
// Size: 0x6c
function private function_a0be8991d288a96(type, origin, angles) {
    /#
        s = spawnstruct();
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        s.origin = origin;
        s.angles = angles;
        s.script_string = type;
        return s;
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d4
// Size: 0x24
function function_3100067b96889b40(target) {
    velocity = function_d6c95cadde7fcc79(target);
    return length(velocity);
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4600
// Size: 0x70
function function_d6c95cadde7fcc79(target) {
    velocity = 0;
    if (target isvehicle()) {
        velocity = target vehicle_getvelocity();
    } else if (isplayer(target)) {
        if (target namespace_f8065cafc523dba5::isinvehicle()) {
            target = namespace_f8065cafc523dba5::getvehicle();
            velocity = target vehicle_getvelocity();
        } else {
            velocity = target getvelocity();
        }
    } else {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }
    return velocity;
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4678
// Size: 0x361
function function_da1254f452e43d24() {
    /#
        var_b44b7980350b1db1 = [];
        land = "mission_searchseizure_dist_far1";
        water = "<unknown string>";
        switch (level.mapname) {
        case #"hash_57eba45b7ddbdcd6":
        case #"hash_63326ac3e12f8da0":
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-51349, 6236.79, 1238.39)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-51123.5, 8909.07, 1174.97)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-52709.4, 11245.9, 1248.17)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-53294.3, 14443.9, 1343.24)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-52033.7, 18110.6, 1145.72)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-48612.7, 19078.9, 1261.22)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-46117.7, 19062.5, 960.875)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-45767.2, 21738.1, 1443)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-43392.6, 17767.1, 210.041)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-46040.5, 13964.2, 1011.29)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-46357.2, 12518.7, 1159.66)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-46396.2, 10931.9, 946.973)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-43364.2, 8331.73, 383.033)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-42013.4, 7071.1, 593.468)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-40765.5, 5938.72, 748.72)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-40587.6, 2448.83, 349.103)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-41677.6, 853.808, 341.881)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-42782, -1174.98, 411.748)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-46258.9, -1449.15, 741.922)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-50514.3, -1018.65, 765.698)));
            break;
        case #"hash_4aa5d6e97851bdbd":
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-3018, -2847, 58)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-3728, -7366, 58)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-6051, 2047, 58)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-3653, 8514, 58)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (-588, 12965, 58)));
            var_b44b7980350b1db1 = array_add(var_b44b7980350b1db1, function_a0be8991d288a96(land, (4338, 3048, 58)));
            break;
        }
        return var_b44b7980350b1db1;
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49e0
// Size: 0x4b
function function_7ec025a0970cc56c() {
    /#
        self endon("<unknown string>");
        var_a67a1c92af72f594 = [];
        while (1) {
            wait(1);
            if (function_29abf5b8a864c5dd(self)) {
                iprintln("<unknown string>");
            } else {
                iprintln("<unknown string>");
            }
            waitframe();
        }
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a32
// Size: 0x123
function function_317eb7e23a9f9ae9() {
    /#
        nodes = function_51ca04c003f5020(undefined, self.origin, 0, pow(8192, 2), 1);
        vehicles = [];
        foreach (node in nodes) {
            vehicle = function_4944e32d48208083(node.script_string, node.origin, node.angles);
            vehicle.var_a8f4bb03b366aa80 = 1;
            namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(vehicle, "<unknown string>");
            vehicles = array_add(vehicles, vehicle);
        }
        wait(15);
        foreach (vehicle in vehicles) {
            namespace_1f188a13f7e79610::vehicle_death(vehicle);
        }
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b5c
// Size: 0x1dd
function function_fd7c18412575bc79() {
    /#
        self endon("<unknown string>");
        level.var_4e85625f13c359ab.var_37eaf2bc0bb3e28a = getdvarint(@"hash_90b26cc85cd96563", 0);
        var_37eaf2bc0bb3e28a = level.var_4e85625f13c359ab.var_37eaf2bc0bb3e28a;
        debugtype = [];
        debugtype[0] = undefined;
        debugtype[1] = "mission_searchseizure_dist_far1";
        debugtype[2] = "<unknown string>";
        debugtype[3] = "<unknown string>";
        var_d126c8072ae45490 = debugtype[var_37eaf2bc0bb3e28a];
        if (isdefined(var_d126c8072ae45490)) {
            var_2b88a7031924b832 = level.var_4e85625f13c359ab.var_2b88a7031924b832;
            level.var_4e85625f13c359ab.var_4bc2978f55f7802c = getdvarint(@"hash_b9e4ba0c2eddf72d", 0);
            if (level.var_4e85625f13c359ab.var_4bc2978f55f7802c) {
                var_2b88a7031924b832 = function_da1254f452e43d24();
            }
            foreach (node in var_2b88a7031924b832) {
                color = ter_op(node.script_string == "mission_searchseizure_dist_far1", (1, 0, 0), (0, 0, 1));
                if (var_37eaf2bc0bb3e28a == 3) {
                    function_f61b0caf9a0b523a(node.origin, (0, 0, 9999), color, 30);
                } else if (var_37eaf2bc0bb3e28a < 3 && is_equal(node.script_string, var_d126c8072ae45490)) {
                    function_f61b0caf9a0b523a(node.origin, (0, 0, 9999), color, 30);
                }
            }
        }
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d40
// Size: 0xcd
function function_84a50610b98c3166() {
    /#
        foreach (contract in level.var_41f4bc9ee8c7c9c6.activetablets) {
            if (!is_equal(contract.type, "<unknown string>")) {
                continue;
            }
            if (!is_equal(contract.task.var_4f9872239d5ffa28, "<unknown string>")) {
                continue;
            }
            function_f61b0caf9a0b523a(contract.origin, (0, 0, 9999), (1, 0, 0), 30);
        }
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e14
// Size: 0x20
function function_4345f8a9f656b405() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        host thread function_7ec025a0970cc56c();
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e3b
// Size: 0x228
function function_a436c573abc56a6a() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>" + level.var_4e85625f13c359ab.enabled);
        println("<unknown string>" + level.var_4e85625f13c359ab.time);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_cf9f04c2455c9551);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_5250e11f76eaf5bb);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_946b411053737262);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_a8f585deac0aaa44);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_623c71246715c68a);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_f618c857c91d9adc);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_b4862b86b957b504);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_1aa0d8c830908356);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_dad5abd3a17a252e);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_c9a4667d43c3d2b7);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_74de30492b65dedb);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_f767533f0cc83c57);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_4156aa8334394ed5);
        println("<unknown string>" + level.var_4e85625f13c359ab.var_3b2141e078017f8c);
        println("<unknown string>");
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x506a
// Size: 0x20
function function_b71dae6abf83d269() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        host thread function_fd7c18412575bc79();
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5091
// Size: 0x1f
function function_87ac4dc3e17d9720() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        host function_8b51245f6bbe5bbd();
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50b7
// Size: 0x17
function function_3783df970b21d0b9() {
    /#
        setdvar(@"hash_b0c2611966c23b36", 1);
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50d5
// Size: 0x127
function function_8f4bec208d29321a() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        level endon("<unknown string>");
        host endon("<unknown string>");
        var_e8db9359bd731029 = anglestoforward(host.angles);
        var_3c3e840099ff521e = anglestoright(host.angles);
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb();
        agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(aitype, (0, 0, 0), (0, 0, 0), "<unknown string>", "<unknown string>", "<unknown string>");
        /#
            assert(isdefined(agent) && isagent(agent));
        #/
        streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("<unknown string>", agent);
        var_e8db9359bd731029 = anglestoforward(agent.angles);
        var_3c3e840099ff521e = anglestoright(agent.angles);
        var_fa378e997a33a137 = agent namespace_25d6bd23fd862a00::findunobstructedfiringinfo(host.origin, 256, var_e8db9359bd731029, var_e8db9359bd731029, var_3c3e840099ff521e);
        agent namespace_25d6bd23fd862a00::tomastrike_firestrike(1, var_fa378e997a33a137, streakinfo);
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5203
// Size: 0x106
function function_d34f28c4111fcc3() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        vehicle = function_4944e32d48208083("mission_searchseizure_dist_far1", host.origin, host.angles);
        end = spawnstruct();
        end.origin = host.origin;
        end.angles = host.angles;
        task = spawnstruct();
        task.end = end;
        task.vehicle = vehicle;
        task.var_3f099428157ffa21 = namespace_d38b9642992c29b5::function_e09936350b8d90fe();
        task thread [[ task.var_3f099428157ffa21.var_e0fd93cddc4b8912 ]]();
        task.var_8588743baff0701e = task [[ task.var_3f099428157ffa21.spawnheli ]](task.vehicle);
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5310
// Size: 0x75
function function_756f0952a1f01e6d() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        vehicle = function_4944e32d48208083("<unknown string>", host.origin, host.angles);
        helicopter = level helicopter_start(host.origin, vehicle, host);
        if (!isdefined(helicopter)) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x538c
// Size: 0x33
function function_a805454c14fec2d() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        fakeent = function_b66446c0c80398c2();
        level thread function_be4861d33da1689f(host, fakeent);
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53c6
// Size: 0x20
function function_64ccd72856415728() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        host thread function_317eb7e23a9f9ae9();
    #/
}

// Namespace namespace_7ba29140a6d5de80/namespace_97c4e054660113b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53ed
// Size: 0x20
function function_acc43fa45aaf68be() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        host thread function_84a50610b98c3166();
    #/
}

