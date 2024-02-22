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
#using script_440a6f7f2d90cc3c;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_2f2628d802eb2807;
#using script_772861646614d63a;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_120270bd0a747a35;
#using script_371b4c2ab5861e62;
#using script_a62705cb078ec0a;
#using scripts\common\anim.gsc;

#namespace namespace_351a0d9dc2222c9;

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6
// Size: 0x21f
function function_80d68c9701e1aea5(data) {
    var_b6c4eaaf734a5f98 = array_randomize(getstructarray("dmz_boatdrive_start", "script_noteworthy"));
    var_b3fb853f67ddbb77 = array_randomize(getstructarray("dmz_boatdrive_end", "script_noteworthy"));
    level.var_41880bc6655538ca = [];
    foreach (node in var_b3fb853f67ddbb77) {
        if (!namespace_7789f919216d38a2::function_cdcab1374db7f007(node.origin)) {
            level.var_41880bc6655538ca[level.var_41880bc6655538ca.size] = node;
        }
    }
    level.var_a143a83f1d3038ec = [];
    foreach (start in var_b6c4eaaf734a5f98) {
        foreach (end in level.var_41880bc6655538ca) {
            if (istrue(end.inuse)) {
                continue;
            }
            dist = distance2d(start.origin, end.origin);
            if (dist > 25000 && dist < 40000) {
                start.end = end;
                end.start = start;
                end.inuse = 1;
                level.var_a143a83f1d3038ec[level.var_a143a83f1d3038ec.size] = start;
            }
        }
    }
    function_7828c1afe3365dd2();
    namespace_b1af0fcaf4ad16d6::function_3e3a73f1039ca16d();
    /#
        thread function_2c009c8118040c5f();
    #/
    function_b713f2d39b34540f(data, &function_8811f695b5e87b84, level.var_a143a83f1d3038ec);
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8dc
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("dmz_boatdrive_complete", "tag_origin");
    #/
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fa
// Size: 0x163
function function_8811f695b5e87b84(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_dc2f3d89d774dc4d;
    task.funcs["onPlayerJoined"] = &function_e930f02bb2ceb38f;
    task.funcs["onPlayerRemoved"] = &function_f5cc4925e5b36ea6;
    task.funcs["onTeamAssigned"] = &function_88cc122b335d9302;
    task.funcs["onForceEnd"] = &function_8a340139361c0e9b;
    task.funcs["onTeamStart"] = &function_22e0898b918c342;
    task.funcs["onCancel"] = &function_fd0a97f1103dcbd5;
    task.ref = "dmz_boatdrive_explore";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    task.end = node.end;
    if (!isdefined(level.var_9fb539420ed34f34)) {
        level.var_9fb539420ed34f34 = 0;
    }
    task.var_6cd05f946a7917f7 = "boatDriveMission" + level.var_9fb539420ed34f34;
    level.var_9fb539420ed34f34++;
    task.numagents = 0;
    return task;
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa65
// Size: 0xc4
function function_dc2f3d89d774dc4d() {
    if (!isdefined(self.node)) {
        return;
    }
    namespace_f2c68794a1018c9d::function_c847bfd52c064289(self.node.origin + (0, 0, 60));
    if (!isdefined(self.end) || !namespace_1f188a13f7e79610::function_fa537f1ab52a76d1("veh9_patrol_boat")) {
        task_ended();
        return;
    }
    self.activity.origin = self.node.origin;
    function_93add0b65db9f722(&function_6259c52471af01f2);
    var_37f4f6505381d02a = 1;
    if (istrue(var_37f4f6505381d02a)) {
        self.var_3f099428157ffa21 = namespace_d38b9642992c29b5::function_e09936350b8d90fe();
    } else {
        self.var_3f099428157ffa21 = namespace_2b263a10299a0a3a::function_e09936350b8d90fe();
    }
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb30
// Size: 0x81
function function_88cc122b335d9302(teamname) {
    players = getteamdata(teamname, "players");
    function_1759acfd39bb5edf("dmz_boatdrive_accept", teamname);
    thread function_7a036ed55902a5a1();
    if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_assigned_generic", teamname, 2);
    } else {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_assigned", teamname, 2);
    }
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb8
// Size: 0x44
function function_22e0898b918c342(teamname) {
    if (isdefined(self.boat)) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_approach", teamname);
    } else {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_approach_dropped", teamname);
    }
    function_c1fd3441ccfba6f8(teamname, undefined, 0);
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc03
// Size: 0xc
function function_e930f02bb2ceb38f(player) {
    
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc16
// Size: 0xc
function function_f5cc4925e5b36ea6(player) {
    
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc29
// Size: 0xa
function function_8a340139361c0e9b() {
    function_a9305bd4dc095942();
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3a
// Size: 0x13
function function_fd0a97f1103dcbd5(teamname) {
    function_2d69bd312de68c60();
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc54
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

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc1
// Size: 0x7b
function private function_2d69bd312de68c60(teamname) {
    self endon("task_ended");
    function_a9305bd4dc095942();
    if (isdefined(teamname)) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_heli_extracted", teamname);
        function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
        wait(5);
        function_a1738a95d7aa8094("dmz_boatdrive_complete", "vehicledrive", self.activity.var_723b8f7cb71ceb11, teamname);
        function_cd4f277cf0d6a560(teamname);
    }
    task_ended(teamname);
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd43
// Size: 0x2d4
function function_7a036ed55902a5a1() {
    self endon("task_ended");
    level endon("game_ended");
    var_a3010f9814a40c8d = undefined;
    players = getteamdata(self.teams[0], "players");
    if (!isdefined(players)) {
        function_2d69bd312de68c60();
        return;
    }
    for (i = 0; i < players.size && !isdefined(var_a3010f9814a40c8d); i++) {
        var_a3010f9814a40c8d = players[i];
    }
    if (!isdefined(var_a3010f9814a40c8d)) {
        function_2d69bd312de68c60();
        return;
    }
    self.boat = function_dca84f44880b74d(self.node.origin, self.node.angles, var_a3010f9814a40c8d);
    self.vehicle = self.boat;
    if (!istrue(self.boat.deployed)) {
        self.boat waittill("deployed");
    }
    thread function_c23d51aba69e0718();
    thread function_acb7e3e09af20b16();
    function_b3c1ba9fbd1dd01e(self.boat, 50);
    function_5314298e777e5688("dmz_boatdrive_wait");
    driver = undefined;
    while (!isdefined(driver)) {
        wait(0.1);
        driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self.boat, 1);
    }
    var_506c6e78c81fb92a = self.boat.origin;
    self.boat function_481c2a63f2ba3332(0);
    function_5314298e777e5688("dmz_boatdrive");
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_entered", self.teams[0], 3);
    self thread [[ self.var_3f099428157ffa21.var_e0fd93cddc4b8912 ]]();
    function_cef2ed613a8338be(self.end.origin + (0, 0, 50));
    self.boat.var_a21a9516d1dede9e = driver.team;
    self.boat makeentitysentient(self.boat.var_a21a9516d1dede9e);
    self.boat makeentitynomeleetarget();
    while (isdefined(self.boat) && distance2dsquared(self.boat.origin, var_506c6e78c81fb92a) < 9000000) {
        wait(0.1);
    }
    self.var_8588743baff0701e = self [[ self.var_3f099428157ffa21.spawnheli ]](self.boat);
    thread function_29578edc44176c7d(self.teams[0]);
    wait(5);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("vehicledrive_enemyheliinbound", self.teams[0]);
    function_c1fd3441ccfba6f8(self.teams[0], "dmz_boss_chopper_combat", 1.5);
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101e
// Size: 0xb4
function function_9e0eab9a6a39506(owner, pos, angles) {
    data = spawnstruct();
    data.origin = pos;
    data.angles = angles;
    data.team = owner.team;
    data.disableusabilityatspawn = 1;
    heli = namespace_1f188a13f7e79610::vehicle_spawn("veh9_blima", data);
    heli.animname = "blima";
    heli namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    heli.var_1e897ae1c018b2c2 = owner.team;
    return heli;
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10da
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

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f7
// Size: 0x49
function private function_6259c52471af01f2(agent, killer) {
    assignment = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "assignment");
    if (isdefined(assignment) && assignment == self.var_6cd05f946a7917f7) {
        self.numagents--;
    }
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1247
// Size: 0x34a
function private function_29578edc44176c7d(teamname) {
    self.boat endon("death");
    self endon("task_ended");
    var_23cd6d769cd06450 = 0;
    var_a8bb556710cb6939 = squared(int(100));
    var_6120f45e53120064 = 0;
    while (1) {
        wait(0.1);
        if (!isdefined(self.boat) || !isdefined(self.boat.payload)) {
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
        curdist = distancesquared(self.boat.payload.origin, self.end.origin);
        if (curdist <= var_a8bb556710cb6939) {
            break;
        }
        if (isdefined(self.var_8588743baff0701e) && !var_6120f45e53120064 && distancesquared(self.boat.origin, self.end.origin) <= 20250000) {
            self.var_8588743baff0701e thread [[ self.var_3f099428157ffa21.flyaway ]]();
            var_6120f45e53120064 = 1;
        }
        if (!var_23cd6d769cd06450 && curdist <= 256000000) {
            players = getteamdata(self.boat.var_a21a9516d1dede9e, "players");
            if (isdefined(players) && players.size) {
                self.var_e2667c67e81fd8d2 = players[0] namespace_b1af0fcaf4ad16d6::function_5a081e065a93bd08(self.end.origin, (0, 0, 60));
            }
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_heli_exfil", self.boat.var_a21a9516d1dede9e);
            var_23cd6d769cd06450 = 1;
        }
    }
    self.boat.payload notsolid();
    waitframe();
    self.boat.payload unlink();
    self.boat.payload linkto(self.var_e2667c67e81fd8d2.crate, "tag_origin", (0, 0, -110), (0, 0, 0));
    self notify("payload_delivered");
    self.var_e2667c67e81fd8d2.readytoleave = 1;
    self.var_e2667c67e81fd8d2 notify("ready_to_leave");
    var_536a5c2e42582b98 = namespace_1f188a13f7e79610::vehicle_getturretbyweapon(self.boat, "iw9_mg_patrol_boat_back_mp");
    var_536a5c2e42582b98.exit = var_536a5c2e42582b98.var_a682a8256c580b8c;
    self.var_e2667c67e81fd8d2.crate playsoundonmovingent("mp_dmz_cargo_delivery_hook");
    thread function_2d69bd312de68c60(self.teams[0]);
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1598
// Size: 0x109
function function_c23d51aba69e0718() {
    level endon("game_ended");
    self endon("payload_delivered");
    self endon("task_ended");
    self.boat endon("death");
    while (1) {
        if (isdefined(self.boat) && isdefined(self.boat.occupants)) {
            driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self.boat, 1);
            if (isdefined(driver) && isdefined(driver.team) && driver.team != self.teams[0]) {
                function_a1738a95d7aa8094("dmz_boatdrive_fail_stolen", "vehicledrive", 0, self.teams[0]);
                thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_boat_stolen", self.teams[0], 2);
                function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_lose", 1, "dmz_activity_lose_classic");
                function_2d69bd312de68c60();
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16a8
// Size: 0x8a
function private function_acb7e3e09af20b16() {
    level endon("game_ended");
    self endon("payload_delivered");
    self endon("task_ended");
    self.boat waittill("death");
    function_a1738a95d7aa8094("dmz_boatdrive_fail_destroyed", "vehicledrive", 0, self.teams[0]);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("boatdrive_boat_destroyed", self.teams[0], 2);
    function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_lose", 1, "dmz_activity_lose_classic");
    function_2d69bd312de68c60();
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1739
// Size: 0x6c
function function_7828c1afe3365dd2() {
    level.scr_animtree["rope1"] = %script_model;
    level.scr_anim["rope1"]["armored_patrol_boat_dropoff"] = script_model%iw9_mp_armored_patrol_boat_dropoff_rope1;
    level.scr_animtree["rope2"] = %script_model;
    level.scr_anim["rope2"]["armored_patrol_boat_dropoff"] = script_model%iw9_mp_armored_patrol_boat_dropoff_rope2;
    function_1ecfc00892db5fe2();
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ac
// Size: 0x65
function function_1ecfc00892db5fe2() {
    level.scr_animtree["armored_patrol_boat"] = %script_model;
    level.scr_anim["armored_patrol_boat"]["armored_patrol_boat_dropoff"] = mp_vehicles_always_loaded%iw9_mp_armored_patrol_boat_dropoff_boat;
    level.scr_animtree["blima"] = %script_model;
    level.scr_anim["blima"]["armored_patrol_boat_dropoff"] = mp_vehicles_always_loaded%iw9_mp_armored_patrol_boat_dropoff_heli;
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1818
// Size: 0x12
function function_118d4d3861116a71() {
    wait(18);
    self playsoundonmovingent("iw9_drop_chute_release");
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1831
// Size: 0x15
function function_61b857e8eaa21d3b() {
    wait(2.25);
    self playsoundonmovingent("mp_care_package_impact_water_body");
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184d
// Size: 0x17
function function_31dedda3e342ebde() {
    wait(6);
    self setscriptablepartstate("boat_dropoff_sfx", "on");
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186b
// Size: 0x131
function function_8bed43ba9ad1726d(origin, angles) {
    var_4eb8738fa8609b12 = spawnstruct();
    var_4eb8738fa8609b12.origin = origin;
    var_4eb8738fa8609b12.angles = angles;
    boat = namespace_1f188a13f7e79610::vehicle_spawn("veh9_patrol_boat", var_4eb8738fa8609b12);
    boat.animname = "armored_patrol_boat";
    var_536a5c2e42582b98 = namespace_1f188a13f7e79610::vehicle_getturretbyweapon(boat, "iw9_mg_patrol_boat_back_mp");
    var_536a5c2e42582b98.var_a682a8256c580b8c = var_536a5c2e42582b98.exit;
    var_536a5c2e42582b98.exit = (-100, 45, -7);
    payload = spawn("script_model", boat.origin + (0, 0, 5) + anglestoforward(boat.angles) * -90);
    payload.angles = boat.angles;
    payload setmodel("cargo_pallet_02_dmz_script");
    payload linkto(boat);
    boat.payload = payload;
    thread namespace_168c086126cfa488::function_cf8f787850f621f9(boat);
    return boat;
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a4
// Size: 0x2fe
function function_dca84f44880b74d(origin, angles, player) {
    var_dc1711ffc6cd2bf1 = origin - (-49.233, 15.251, -575.692);
    sceneangles = angles;
    forward = anglestoforward(sceneangles);
    height = 700;
    var_30f22e255c6ced30 = 0;
    while (height < 3000) {
        middle = var_dc1711ffc6cd2bf1 + (0, 0, height);
        start = middle - forward * 3000 + (0, 0, 1) * 2000;
        end = middle + forward * 3000 + (0, 0, 1) * 2000;
        trace = namespace_2a184fc4902783dc::sphere_trace(middle, start, 500);
        if (trace["hittype"] == "hittype_none") {
            trace = namespace_2a184fc4902783dc::sphere_trace(middle, end, 500);
            if (trace["hittype"] == "hittype_none") {
                var_30f22e255c6ced30 = 1;
                break;
            }
        }
        height = height + 200;
    }
    if (!istrue(var_30f22e255c6ced30)) {
        boat = function_8bed43ba9ad1726d(origin + 3000, angles);
        boat.deployed = 1;
        boat vehicleshowonminimap(1);
        return boat;
    }
    var_dc1711ffc6cd2bf1 = var_dc1711ffc6cd2bf1 + (0, 0, height);
    boat = function_8bed43ba9ad1726d(var_dc1711ffc6cd2bf1 + rotatevector((-6491.19, 8.381, 2602.64), sceneangles), combineangles(sceneangles, (21.543, 0, 0)));
    boat vehphys_forcekeyframedmotion();
    heli = function_9e0eab9a6a39506(player, var_dc1711ffc6cd2bf1 + rotatevector((-6226.31, 0, 3287.4), sceneangles), combineangles(sceneangles, (8.289, 0, 0)));
    heli vehphys_forcekeyframedmotion();
    heli function_247ad6a91f6a4ffe(1);
    rope1 = spawn("script_model", var_dc1711ffc6cd2bf1 + rotatevector((-6233.72, -23.428, 3195.29), sceneangles));
    rope1.angles = combineangles(sceneangles, (7.507, -0.229, -1.363));
    rope1 setmodel("veh9_mil_air_heli_airdrop_rig");
    rope1.animname = "rope1";
    rope1 namespace_bc4a4b9456315863::setanimtree();
    rope1 show();
    rope2 = spawn("script_model", var_dc1711ffc6cd2bf1 + rotatevector((-6233.57, 22.939, 3194.19), sceneangles));
    rope2.angles = combineangles(sceneangles, (7.507, -0.229, -1.363));
    rope2 setmodel("veh9_mil_air_heli_airdrop_rig");
    rope2.animname = "rope2";
    rope2 namespace_bc4a4b9456315863::setanimtree();
    rope2 show();
    thread function_8ed7cc8db82dd643(heli, rope1, rope2);
    thread function_4a72e137f2ab1bda(boat);
    return boat;
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1caa
// Size: 0x184
function function_8ed7cc8db82dd643(heli, rope1, rope2) {
    helinode = spawnstruct();
    helinode.origin = heli.origin;
    helinode.angles = heli.angles;
    var_d6951e00866d274 = spawnstruct();
    var_d6951e00866d274.origin = rope1.origin;
    var_d6951e00866d274.angles = rope1.angles;
    var_c92e8ed49b8990c9 = spawnstruct();
    var_c92e8ed49b8990c9.origin = rope2.origin;
    var_c92e8ed49b8990c9.angles = rope2.angles;
    var_d6951e00866d274 namespace_bc4a4b9456315863::anim_first_frame_solo(rope1, "armored_patrol_boat_dropoff");
    var_c92e8ed49b8990c9 namespace_bc4a4b9456315863::anim_first_frame_solo(rope2, "armored_patrol_boat_dropoff");
    waitframe();
    var_d6951e00866d274 thread namespace_bc4a4b9456315863::anim_single_solo(rope1, "armored_patrol_boat_dropoff");
    var_c92e8ed49b8990c9 thread namespace_bc4a4b9456315863::anim_single_solo(rope2, "armored_patrol_boat_dropoff");
    heli animscripted("notify", helinode.origin, helinode.angles, mp_vehicles_always_loaded%iw9_mp_armored_patrol_boat_dropoff_heli);
    heli thread function_31dedda3e342ebde();
    duration = getanimlength(level.scr_anim["blima"]["armored_patrol_boat_dropoff"]);
    wait(duration);
    heli delete();
    rope1 delete();
    rope2 delete();
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e35
// Size: 0xb9
function function_4a72e137f2ab1bda(boat) {
    var_ad183e553e6d41e7 = spawnstruct();
    var_ad183e553e6d41e7.origin = boat.origin;
    var_ad183e553e6d41e7.angles = boat.angles;
    var_ad183e553e6d41e7 namespace_bc4a4b9456315863::anim_first_frame_solo(boat, "armored_patrol_boat_dropoff");
    waitframe();
    var_ad183e553e6d41e7 thread namespace_bc4a4b9456315863::anim_single_solo(boat, "armored_patrol_boat_dropoff");
    boat thread function_118d4d3861116a71();
    waittime = 18.0333;
    wait(waittime);
    boat stopanimscripted();
    boat vehphys_setdefaultmotion();
    boat vehicleshowonminimap(1);
    boat.deployed = 1;
    boat notify("deployed");
    boat thread function_61b857e8eaa21d3b();
}

// Namespace namespace_351a0d9dc2222c9/namespace_d0483bb41cd4e112
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef5
// Size: 0x1c8
function function_2c009c8118040c5f() {
    /#
        heli = undefined;
        boat = undefined;
        rope1 = undefined;
        rope2 = undefined;
        while (1) {
            if (getdvarint(@"hash_fb8ea82d10086841", 0)) {
                setdvar(@"hash_fb8ea82d10086841", 0);
                forward = anglestoforward(level.players[0] getplayerangles(0));
                right = anglestoright(level.players[0].angles);
                start = level.players[0] geteye();
                trace = ray_trace(start, start + forward * 1000);
                sphere(trace["script_model"], 10, (1, 0, 0), 0, 1000000);
                function_dca84f44880b74d(trace["script_model"], level.players[0].angles, level.players[0]);
            }
            if (getdvarint(@"hash_ea9b91e4e6ffdfe0", 0)) {
                setdvar(@"hash_ea9b91e4e6ffdfe0", 0);
                origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 500 + (0, 0, 200);
                angles = level.players[0].angles;
                function_8bed43ba9ad1726d(origin, angles);
            }
            wait(1);
        }
    #/
}

