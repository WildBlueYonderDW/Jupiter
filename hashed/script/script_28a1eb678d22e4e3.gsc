// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using script_744cad313ed0a87e;
#using scripts\mp\gametypes\br_public.gsc;
#using script_4948cdf739393d2d;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_58f20490049af6ac;

#namespace namespace_9e6997f014dd0798;

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9
// Size: 0xed
function function_fb7271d5ee18b98d(data) {
    level.var_11cf2e43f74913df = spawnstruct();
    level.var_11cf2e43f74913df.time = getdvarint(@"hash_f3296f3f7c79bfb8", 240);
    level.var_11cf2e43f74913df.maxrange = getdvarint(@"hash_79550894c085d1db", 45000);
    level.var_11cf2e43f74913df.var_8f7c18f3dcce9dff = getdvarint(@"hash_1b3cc7a99c2f33e5", 25000);
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_infiltration_accept"] = "mission_mission_time_accept";
    game["dialog"]["mission_infiltration_fail"] = "mission_mission_time_failed";
    data.funcs["onInit"] = &function_712cf8277bcbd463;
    data.funcs["onTeamAssigned"] = &function_c53c8c4438de68a4;
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x3a
function function_712cf8277bcbd463() {
    if (namespace_bd614c3c2275579a::function_a9b26d3ed078e149()) {
        self.tablet.startdisabled = 1;
    }
    self.tablet.var_b393cb8247aa43e1 = 1;
    return 1;
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f
// Size: 0x189
function function_c53c8c4438de68a4() {
    if (!isdefined(self.fortress)) {
        fortress = self.tablet function_fb13f636f30f3817();
        if (!isdefined(fortress)) {
            thread function_34bd31f3beba8f5a(1);
            return;
        }
        self.fortress = fortress;
    }
    uiobjectiveshowtoteam("strongholdInfil", self.teams[0]);
    time = level.var_11cf2e43f74913df.time;
    time = function_9b6275085fbcb8f4(time);
    function_5a15174d34f0670c(time);
    thread function_b8bab058c4c9ccb4(time);
    thread function_3b7d7950dda9e2b5();
    displayteamsplash(self.teams[0], "stronghold_infil_contract_accepted");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_infiltration_accept", self.teams[0], 1, 1);
    self.curorigin = self.fortress.origin;
    createquestobjicon("ui_map_icon_obj_fortress", "current", self.curorigin + (0, 0, 65));
    players = getteamdata(self.teams[0], "players");
    foreach (player in players) {
        showquestobjicontoplayer(player);
    }
    thread function_e3eef0b907523e1d();
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59f
// Size: 0x1be
function function_34bd31f3beba8f5a(success) {
    self notify("task_ended");
    if (isdefined(self.objectiveiconid)) {
        deletequestobjicon();
    }
    wait(1);
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined));
    if (isdefined(self.fortress) && istrue(success)) {
        self.fortress.var_7f893c2e20a823db = 1;
        self.fortress.var_21d7def7d337f552 = self.teams[0];
        self.fortress notify("stronghold_infiltrated");
        namespace_9823ee6035594d67::function_d95dbf57b47734d9(self.fortress, 1);
        logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, self.fortress) + ": Fortress Infiltrated!");
    } else if (istrue(success)) {
        params = spawnstruct();
        var_501265b5fe210821 = function_d282041688c032b5("strongholdInfil");
        params.intvar = var_501265b5fe210821;
        function_878ebcc241b54505("stronghold_infil_contract_none", function_3d262d56274bd22e("strongholdInfil"), var_501265b5fe210821, self.teams[0]);
        foreach (player in getteamdata(self.teams[0], "players")) {
            player namespace_c6ccccd95254983f::playerplunderpickup(var_501265b5fe210821);
            player namespace_c6ccccd95254983f::function_5a2284274d70f7d(1, var_501265b5fe210821);
        }
        logstring("BR STRONGHOLDS ERROR: Undefined Fortress Infiltrated!");
    }
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0x23
function function_b8bab058c4c9ccb4(time) {
    self endon("task_ended");
    level endon("game_ended");
    wait(time);
    function_832b654e4b84c000();
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78e
// Size: 0x2a
function function_3b7d7950dda9e2b5() {
    self endon("task_ended");
    level endon("game_ended");
    self.fortress waittill("stronghold_infiltrated");
    function_832b654e4b84c000(1);
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf
// Size: 0x87
function function_832b654e4b84c000(var_257a28cd85bd4479) {
    if (!isdefined(var_257a28cd85bd4479)) {
        var_257a28cd85bd4479 = 0;
    }
    params = spawnstruct();
    params.intvar = 0;
    splash = "stronghold_infil_contract_failed";
    if (istrue(var_257a28cd85bd4479)) {
        splash = "stronghold_infil_contract_poached";
    }
    displayteamsplash(self.teams[0], splash, params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_infiltration_fail", self.teams[0], 1, 1);
    thread function_34bd31f3beba8f5a(0);
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84d
// Size: 0x184
function function_fb13f636f30f3817(var_d83087ec1b2d5259) {
    locations = array_randomize(level.var_f1073fbd45b59a06.var_df987907a483df89);
    fortress = undefined;
    var_2ed718e1da0b965 = undefined;
    var_be0f4d48fa40793f = level.var_11cf2e43f74913df.maxrange;
    foreach (location in locations) {
        if (istrue(location.var_7f893c2e20a823db)) {
            continue;
        }
        if (istrue(location.var_933f9685674999fb) && !istrue(var_d83087ec1b2d5259)) {
            continue;
        }
        var_b1e1b0a993dbd52a = namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(location.origin);
        if (!istrue(var_b1e1b0a993dbd52a)) {
            continue;
        }
        if (istrue(location.var_9611bf5bff3c688c)) {
            continue;
        }
        dist = distance2d(location.origin, self.origin);
        var_5435995e95681b89 = 0;
        if (dist > level.var_11cf2e43f74913df.var_8f7c18f3dcce9dff) {
            var_5435995e95681b89 = dist - level.var_11cf2e43f74913df.var_8f7c18f3dcce9dff;
        }
        if (var_5435995e95681b89 < var_be0f4d48fa40793f) {
            var_be0f4d48fa40793f = var_5435995e95681b89;
            fortress = location;
            if (var_5435995e95681b89 <= 0) {
                break;
            }
        }
    }
    return fortress;
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d9
// Size: 0xd6
function function_1cf1557a05b2ae73(spawn_origin, team) {
    finishlinevfx = spawnfx(level._effect["vfx_marker_base_orange_pulse"], spawn_origin + (0, 0, 10));
    finishlinevfx.angles = vectortoangles((0, 0, 1));
    finishlinevfx hide();
    wait(0.5);
    triggerfx(finishlinevfx);
    foreach (player in getteamdata(team, "players")) {
        finishlinevfx showtoplayer(player);
    }
    self.finishlinevfx = finishlinevfx;
}

// Namespace namespace_9e6997f014dd0798/namespace_6a760ad730220f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab6
// Size: 0x1e0
function function_e3eef0b907523e1d() {
    self endon("task_ended");
    level endon("game_ended");
    while (1) {
        foreach (player in getteamdata(self.teams[0], "players")) {
            if (distance2d(player.origin, self.fortress.var_e1dd7bed632a13c3.origin) < self.fortress.var_e1dd7bed632a13c3.radius) {
                params = spawnstruct();
                var_501265b5fe210821 = function_d282041688c032b5("strongholdInfil");
                params.intvar = var_501265b5fe210821;
                foreach (player in getteamdata(self.teams[0], "players")) {
                    player namespace_c6ccccd95254983f::playerplunderpickup(var_501265b5fe210821);
                    player namespace_c6ccccd95254983f::function_5a2284274d70f7d(1, var_501265b5fe210821);
                }
                function_878ebcc241b54505("stronghold_infil_contract_completed", function_3d262d56274bd22e("strongholdInfil"), var_501265b5fe210821, self.teams[0]);
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_misc_success", self.teams[0], 1, 1);
                squadmembers = getteamdata(self.teams[0], "players");
                self.rewardmodifier = undefined;
                self.result = "success";
                thread function_34bd31f3beba8f5a(1);
                return;
            }
        }
        waitframe();
    }
}

