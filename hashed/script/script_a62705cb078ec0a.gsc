// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_48814951e916af89;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using script_1174abedbefe9ada;
#using scripts\engine\scriptable.gsc;
#using script_440a6f7f2d90cc3c;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_4948cdf739393d2d;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using script_2f2628d802eb2807;
#using script_772861646614d63a;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_120270bd0a747a35;
#using script_371b4c2ab5861e62;

#namespace namespace_ce06ce72653ab5fd;

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x102
function function_80d68c9701e1aea5(data) {
    spawnpoints = getstructarray("dmz_vehicledrive_start", "targetname");
    destinations = getstructarray("dmz_vehicledrive_end", "targetname");
    level.var_8d5ea37eafa7b186 = [];
    foreach (node in destinations) {
        if (!namespace_7789f919216d38a2::function_cdcab1374db7f007(node.origin)) {
            level.var_8d5ea37eafa7b186[level.var_8d5ea37eafa7b186.size] = node;
        }
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_sliding_barn_door", &function_259857d59f9c9072);
    namespace_b1af0fcaf4ad16d6::function_3e3a73f1039ca16d();
    level.var_77aa416377054823 = getstructarray("heli_reinforceNode", "script_noteworthy");
    thread function_b6593b8e64dd523c();
    function_b713f2d39b34540f(data, &function_753dbb93cbaa8966, spawnpoints);
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74d
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("task_ended", "ar");
    #/
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76b
// Size: 0x232
function function_753dbb93cbaa8966(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_dc2f3d89d774dc4d;
    task.funcs["onPlayerJoined"] = &function_e930f02bb2ceb38f;
    task.funcs["onPlayerRemoved"] = &function_f5cc4925e5b36ea6;
    task.funcs["onTeamAssigned"] = &function_88cc122b335d9302;
    task.funcs["onForceEnd"] = &function_8a340139361c0e9b;
    task.funcs["onTeamStart"] = &function_22e0898b918c342;
    task.funcs["onCancel"] = &function_fd0a97f1103dcbd5;
    task.ref = "dmz_vehicledrive_explore";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    if (!isdefined(level.var_c2c053d36f37ce2c)) {
        level.var_c2c053d36f37ce2c = 0;
    }
    task.var_6cd05f946a7917f7 = "vehicleDriveMission" + level.var_c2c053d36f37ce2c;
    level.var_c2c053d36f37ce2c++;
    task.numagents = 0;
    mindist = getdvarint(@"hash_f6f97c5aeaf073ca", 30000);
    maxdist = getdvarint(@"hash_b8ec1183dfc532cc", 60000);
    destinations = array_randomize(get_array_of_closest(task.node.origin, level.var_8d5ea37eafa7b186, undefined, undefined, maxdist, mindist));
    foreach (dest in destinations) {
        if (!istrue(dest.inuse)) {
            task.end = dest;
            dest.inuse = 1;
            break;
        }
    }
    return task;
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a5
// Size: 0x2a2
function function_dc2f3d89d774dc4d() {
    if (!isdefined(self.node)) {
        return;
    }
    namespace_f2c68794a1018c9d::function_c847bfd52c064289(self.node.origin + (0, 0, 60));
    if (!isdefined(self.end) || !namespace_1f188a13f7e79610::function_fa537f1ab52a76d1("veh9_jltv_mg")) {
        task_ended();
        return;
    }
    self.activity.origin = self.node.origin;
    self.techo = function_cecaa2fcd2694301(self.node);
    self.techo vehicleshowonminimap(0);
    self.techo.godmode = 1;
    self.vehicle = self.techo;
    namespace_9823ee6035594d67::function_b672261b8246a1e5(self.techo.origin, "vehicle_forts", 0, 1, 0, 0, 0);
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(self.techo);
    function_6aa807e90ef0afad();
    var_ad1a0db8d7d893e9 = getentitylessscriptablearray(undefined, undefined, self.node.origin, 1024, "dmz_sliding_barn_door");
    if (isdefined(var_ad1a0db8d7d893e9) && var_ad1a0db8d7d893e9.size > 0) {
        self.garagedoor = var_ad1a0db8d7d893e9[0];
        self.garagedoor.track = spawnscriptable("door_metal_barn_02_track", self.garagedoor.origin, self.garagedoor.angles);
        self.garagedoor setscriptablepartstate("dmz_sliding_barn_door", "locked_unusable");
        self.garagedoor.var_37b6a48530b11990 = createnavobstaclebybounds(self.garagedoor.origin + anglestoright(self.garagedoor.angles) * -125, (10, 125, 10), self.garagedoor.angles);
    } else {
        /#
            assertmsg("Bad vehicle drive setup at " + self.node.origin);
        #/
    }
    function_93add0b65db9f722(&function_6259c52471af01f2);
    self.techo vehicle_settopspeedforward(30);
    self.techo vehicle_settopspeedreverse(30);
    var_37f4f6505381d02a = 1;
    if (istrue(var_37f4f6505381d02a)) {
        self.var_3f099428157ffa21 = namespace_d38b9642992c29b5::function_e09936350b8d90fe();
    } else {
        self.var_3f099428157ffa21 = namespace_2b263a10299a0a3a::function_e09936350b8d90fe();
    }
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4e
// Size: 0x138
function function_88cc122b335d9302(teamname) {
    players = getteamdata(teamname, "players");
    function_1759acfd39bb5edf("dmz_vehicledrive_assigned", teamname);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_accept", teamname, 2);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    self.garagedoor setscriptablepartstate("dmz_sliding_barn_door", "locked");
    foreach (player in level.players) {
        self.garagedoor disablescriptableplayeruse(player);
    }
    foreach (player in players) {
        self.garagedoor enablescriptableplayeruse(player);
    }
    thread function_facd504aa91576d5();
    thread function_acb7e3e09af20b16();
    thread function_d79b39eec000ddaa();
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8d
// Size: 0x202
function function_22e0898b918c342(teamname) {
    level endon("game_ended");
    self.techo endon("death");
    self endon("task_ended");
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_assign", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
    var_506c6e78c81fb92a = self.techo.origin;
    var_29d8a3a92f9037d8 = undefined;
    while (!isdefined(var_29d8a3a92f9037d8) || isdefined(var_29d8a3a92f9037d8) && isdefined(var_29d8a3a92f9037d8.team) && var_29d8a3a92f9037d8.team != self.teams[0]) {
        var_29d8a3a92f9037d8 = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self.techo, 1);
        wait(0.1);
    }
    function_5314298e777e5688("dmz_vehicledrive");
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_destination", teamname, 3);
    self thread [[ self.var_3f099428157ffa21.var_e0fd93cddc4b8912 ]]();
    function_cef2ed613a8338be(self.end.origin + (0, 0, 50));
    while (isdefined(self.techo) && distance2dsquared(self.techo.origin, var_506c6e78c81fb92a) < 9000000) {
        wait(0.1);
    }
    self.var_8588743baff0701e = self [[ self.var_3f099428157ffa21.spawnheli ]](self.techo);
    self.techo.var_a21a9516d1dede9e = var_29d8a3a92f9037d8.team;
    self.techo makeentitysentient(self.techo.var_a21a9516d1dede9e);
    self.techo makeentitynomeleetarget();
    thread function_29578edc44176c7d(teamname);
    wait(5);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_enemyheliinbound", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_boss_chopper_combat", 1.5);
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf96
// Size: 0x21
function function_e930f02bb2ceb38f(player) {
    self.garagedoor enablescriptablepartplayeruse("dmz_sliding_barn_door", player);
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbe
// Size: 0x21
function function_f5cc4925e5b36ea6(player) {
    self.garagedoor disablescriptablepartplayeruse("dmz_sliding_barn_door", player);
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe6
// Size: 0xa
function function_8a340139361c0e9b() {
    function_a9305bd4dc095942();
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff7
// Size: 0x90
function function_fd0a97f1103dcbd5(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        self.garagedoor disablescriptablepartplayeruse("dmz_sliding_barn_door", player);
        player setplayermusicstate("");
    }
    function_2d69bd312de68c60();
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x108e
// Size: 0x66
function private function_a9305bd4dc095942() {
    function_66a6064fad612bf3(&function_6259c52471af01f2);
    namespace_f2c68794a1018c9d::function_629ed367d1393020();
    if (isdefined(self.var_8588743baff0701e)) {
        self.var_8588743baff0701e thread [[ self.var_3f099428157ffa21.flyaway ]]();
    }
    if (isdefined(self.var_e2667c67e81fd8d2)) {
        self.var_e2667c67e81fd8d2.readytoleave = 1;
    }
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10fb
// Size: 0x7b
function private function_2d69bd312de68c60(teamname) {
    self endon("task_ended");
    function_a9305bd4dc095942();
    if (isdefined(teamname)) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_packagesecure", teamname);
        function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
        wait(5);
        function_a1738a95d7aa8094("dmz_vehicledrive_complete", "vehicledrive", self.activity.var_723b8f7cb71ceb11, teamname);
        function_cd4f277cf0d6a560(teamname);
    }
    task_ended(teamname);
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117d
// Size: 0x141
function function_cecaa2fcd2694301(node) {
    jltv = undefined;
    if (getdvarint(@"hash_973bce2266588096")) {
        jltv = namespace_1f188a13f7e79610::vehicle_spawn("veh9_jltv_cargo", node);
        jltv.var_a8f4bb03b366aa80 = 1;
    } else {
        node.var_3474b4e818850c46 = "veh9_mil_lnd_jltv_turret_cargo_vehphys_mp";
        jltv = namespace_1f188a13f7e79610::vehicle_spawn("veh9_jltv_mg", node);
        jltv.var_a8f4bb03b366aa80 = 1;
        jltv.var_7ee6203c5532a9e6 = 1;
    }
    jltv.var_aab9695c92b0ed96["tag_bumper_front_damaged"].var_a776f097eb36e500 = 0;
    jltv.var_aab9695c92b0ed96["tag_bumper_back_damaged"].var_a776f097eb36e500 = 0;
    payload = spawn("script_model", jltv.origin + (0, 0, 4) + anglestoforward(jltv.angles) * -84);
    payload.angles = jltv.angles;
    payload setmodel("cargo_pallet_02_dmz_script");
    payload linkto(jltv);
    jltv.payload = payload;
    thread function_cf8f787850f621f9(jltv);
    return jltv;
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c6
// Size: 0x9b
function function_cf8f787850f621f9(vehicle) {
    payload = vehicle.payload;
    vehicle waittill("death");
    if (isdefined(payload)) {
        effect = "cargo_pallet_destruction";
        explosionpos = payload.origin;
        explosioneffect = spawnfx(level._effect[effect], explosionpos);
        triggerfx(explosioneffect);
        thread play_sound_in_space("mp_dmz_cargo_destroyed", explosionpos);
        payload delete();
        explosioneffect thread function_b4b04de87729a6f3(10);
    }
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1368
// Size: 0x116
function private function_6aa807e90ef0afad() {
    var_53456645791df147 = getstructarray("vehicledrive_guard", "targetname");
    var_d067ded4779db731 = get_array_of_closest(self.node.origin, var_53456645791df147, undefined, undefined, 2000);
    agents = [];
    for (i = 0; i < var_d067ded4779db731.size; i++) {
        angles = var_d067ded4779db731[i].angles;
        origin = var_d067ded4779db731[i].origin;
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, angles, "high", "mission", "vehicleDriveGuards", undefined, undefined, undefined, self.node.poi);
        if (isdefined(agent)) {
            agents[i] = agent;
            thread namespace_2000a83505151e5b::function_b11c1964f528574b(agent);
        }
    }
    self.numagents = self.numagents + agents.size;
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1485
// Size: 0x49
function private function_6259c52471af01f2(agent, killer) {
    assignment = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "assignment");
    if (isdefined(assignment) && assignment == self.var_6cd05f946a7917f7) {
        self.numagents--;
    }
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14d5
// Size: 0x6c
function private function_259857d59f9c9072(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    instance setscriptablepartstate("dmz_sliding_barn_door", "opening");
    destroynavobstacle(instance.var_37b6a48530b11990);
    instance.open = 1;
    instance notify("vehicledrive_doorOpened");
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1548
// Size: 0x95
function function_facd504aa91576d5() {
    level endon("game_ended");
    self.techo endon("death");
    self endon("task_ended");
    if (istrue(self.garagedoor.open)) {
        namespace_141c4634b6ea7b27::vehicle_interact_makeusable(self.techo);
    }
    self.garagedoor waittill("vehicledrive_doorOpened");
    namespace_141c4634b6ea7b27::vehicle_interact_makeusable(self.techo);
    thread function_c23d51aba69e0718();
    self.techo vehicleshowonminimap(1);
    self.techo.godmode = 0;
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15e4
// Size: 0x314
function private function_29578edc44176c7d(teamname) {
    self.techo endon("death");
    self endon("task_ended");
    var_23cd6d769cd06450 = 0;
    var_a8bb556710cb6939 = squared(int(100));
    var_6120f45e53120064 = 0;
    while (1) {
        wait(0.1);
        if (!isdefined(self.techo) || !isdefined(self.techo.payload)) {
            if (isdefined(self.var_e2667c67e81fd8d2)) {
                self.var_e2667c67e81fd8d2.readytoleave = 1;
                self.var_e2667c67e81fd8d2 notify("ready_to_leave");
            }
            if (isdefined(self.var_8588743baff0701e)) {
                self.var_8588743baff0701e thread [[ self.var_3f099428157ffa21.flyaway ]]();
                var_6120f45e53120064 = 1;
            }
            return;
        }
        curdist = distancesquared(self.techo.payload.origin, self.end.origin);
        if (curdist <= var_a8bb556710cb6939) {
            break;
        }
        if (isdefined(self.var_8588743baff0701e) && !var_6120f45e53120064 && distancesquared(self.techo.origin, self.end.origin) <= 20250000) {
            self.var_8588743baff0701e thread [[ self.var_3f099428157ffa21.flyaway ]]();
            var_6120f45e53120064 = 1;
        }
        if (!var_23cd6d769cd06450 && curdist <= 256000000) {
            players = getteamdata(self.techo.var_a21a9516d1dede9e, "players");
            if (isdefined(players) && players.size) {
                self.var_e2667c67e81fd8d2 = players[0] namespace_b1af0fcaf4ad16d6::function_5a081e065a93bd08(self.end.origin, (0, 0, 80));
            }
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_extractinbound", self.techo.var_a21a9516d1dede9e);
            var_23cd6d769cd06450 = 1;
        }
    }
    self.techo.payload notsolid();
    waitframe();
    self.techo.payload unlink();
    self.techo.payload linkto(self.var_e2667c67e81fd8d2.crate, "tag_origin", (0, 0, -110), (0, 0, 0));
    self notify("payload_delivered");
    self.var_e2667c67e81fd8d2.readytoleave = 1;
    self.var_e2667c67e81fd8d2 notify("ready_to_leave");
    thread function_2d69bd312de68c60(self.teams[0]);
    self.var_e2667c67e81fd8d2.crate playsoundonmovingent("mp_dmz_cargo_delivery_hook");
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ff
// Size: 0x100
function function_c23d51aba69e0718() {
    level endon("game_ended");
    self endon("payload_delivered");
    self endon("task_ended");
    self.techo endon("death");
    while (1) {
        if (isdefined(self.techo) && isdefined(self.techo.occupants)) {
            driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self.techo, 1);
            if (isdefined(driver) && isdefined(driver.team) && driver.team != self.teams[0]) {
                thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("activity_failed", self.teams[0], 2);
                function_1759acfd39bb5edf("dmz_vehicledrive_fail_stolen", self.teams[0]);
                function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_lose", 1, "dmz_activity_lose_classic");
                function_2d69bd312de68c60();
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a06
// Size: 0x81
function private function_acb7e3e09af20b16() {
    level endon("game_ended");
    self endon("payload_delivered");
    self endon("task_ended");
    self.techo waittill("death");
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("activity_failed", self.teams[0], 2);
    function_1759acfd39bb5edf("dmz_vehicledrive_fail_destroyed", self.teams[0]);
    function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_lose", 1, "dmz_activity_lose_classic");
    function_2d69bd312de68c60();
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8e
// Size: 0xcb
function function_d79b39eec000ddaa() {
    level endon("game_ended");
    self endon("task_ended");
    while (1) {
        players = getteamdata(self.teams[0], "players");
        foreach (player in players) {
            dist = distance2dsquared(player.origin, self.garagedoor.origin);
            if (dist < 562500) {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("vehicledrive_neardoor", players);
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_ce06ce72653ab5fd/namespace_168c086126cfa488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b60
// Size: 0x172
function function_b6593b8e64dd523c() {
    while (1) {
        if (getdvarint(@"hash_361e499f400fee2a", 0)) {
            setdvar(@"hash_361e499f400fee2a", 0);
            node = spawnstruct();
            node.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 500 + (0, 0, 200);
            node.angles = level.players[0].angles;
            function_cecaa2fcd2694301(node);
        }
        if (getdvarint(@"hash_e04153469eda5d1d", 0)) {
            setdvar(@"hash_e04153469eda5d1d", 0);
            node = spawnstruct();
            node.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 500 + (0, 0, 200);
            node.angles = level.players[0].angles;
            node namespace_b1af0fcaf4ad16d6::function_5a081e065a93bd08(node.origin, (0, 0, 20));
        }
        wait(1);
    }
}

