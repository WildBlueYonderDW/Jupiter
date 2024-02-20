// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;

#namespace auto_drone;

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x530
// Size: 0x74
function init() {
    if (issharedfuncdefined("auto_drone", "init")) {
        [[ getsharedfunc("auto_drone", "init") ]]();
    }
    /#
        setdevdvarifuninitialized(@"hash_30dee5c8d013379b", 0);
        setdevdvarifuninitialized(@"hash_62b493e13a7a2273", 0);
    #/
    level function_2e0e05b9e6dfba79();
    level function_1c0ee59726585f9f();
    level function_54dc2efc97e278c6();
    level function_5cda69c520d4b9c3();
    level function_5d215ec521236402();
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ab
// Size: 0x3f
function function_235f27caff15c65(streakinfo) {
    if (issharedfuncdefined("killstreak", "startMapSelectSequence")) {
        self [[ getsharedfunc("killstreak", "startMapSelectSequence") ]](0, 1, "long_arrow", undefined, streakinfo);
    }
    return 1;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2
// Size: 0x71
function function_2e0e05b9e6dfba79() {
    level.var_5f028b2553fb392d = [];
    level.var_d8c0162b0f87cb2c = 0;
    foreach (teamname in level.teamnamelist) {
        level.var_5f2f53346bf55271[teamname] = 0;
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a
// Size: 0x3
function function_1c0ee59726585f9f() {
    
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x674
// Size: 0x3
function function_54dc2efc97e278c6() {
    
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e
// Size: 0x60
function function_5cda69c520d4b9c3() {
    game["dialog"]["auto_drone" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["auto_drone" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["auto_drone" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e5
// Size: 0x3
function function_5d215ec521236402() {
    
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ef
// Size: 0x21
function function_f5488ebdae28a1d8() {
    streakinfo = createstreakinfo("auto_drone", self);
    return function_987a0ab2646445e1(streakinfo);
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x718
// Size: 0x1c6
function function_987a0ab2646445e1(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac["auto_drone"])) {
        goto LOC_00000075;
    }
    level.var_25479c87b8ab495c = level.var_b23156d776b1d85.var_38f2a11237246ac["auto_drone"];
    team = self.team;
    level.var_d8c0162b0f87cb2c++;
    var_1396f6a995578be4 = 1;
    if (islargemap()) {
        var_1396f6a995578be4 = 2;
    }
    if (level.var_5f028b2553fb392d.size >= var_1396f6a995578be4 || level.var_5f028b2553fb392d.size + level.var_d8c0162b0f87cb2c > var_1396f6a995578be4) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        level.var_d8c0162b0f87cb2c--;
        return 0;
    }
    if (islargemap() && level.teambased) {
        var_bb1cd2da42608a26 = 1;
        level.var_5f2f53346bf55271[team]++;
        if (getnumactivekillstreakperteam(team, level.var_5f028b2553fb392d) + level.var_5f2f53346bf55271[team] > var_bb1cd2da42608a26) {
            level.var_d8c0162b0f87cb2c--;
            level.var_5f2f53346bf55271[team]--;
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
            }
            return 0;
        }
    }
    result = function_a39b5cb878cc28cd(streakinfo);
    level.var_d8c0162b0f87cb2c--;
    if (islargemap() && level.teambased) {
        level.var_5f2f53346bf55271[team]--;
    }
    return result;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e6
// Size: 0x1fd
function function_a39b5cb878cc28cd(streakinfo) {
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, makeweapon("ks_remote_map_mp"), 1, &function_235f27caff15c65);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    mappointinfo = undefined;
    self playlocalsound("iw9_ks_tablet_ui_screen_plr");
    if (issharedfuncdefined("killstreak", "getSelectMapPoint")) {
        mappointinfo = self [[ getsharedfunc("killstreak", "getSelectMapPoint") ]](streakinfo, isdefined(level.var_25479c87b8ab495c.var_4146fe9ed0fa6381) ? 1 : level.var_25479c87b8ab495c.var_4146fe9ed0fa6381, 1);
        self playlocalsound("iw9_ks_tablet_ui_select_final_plr");
    }
    streakinfo.owner notify("killstreak_deploy_finished", streakinfo.streakname);
    if (!isdefined(mappointinfo)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return 0;
        }
    }
    if (level.gameended) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    level thread function_589f29fde91a654a(self, streakinfo, mappointinfo);
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 2;
    }
    thread playkillstreakoperatordialog("auto_drone", "auto_drone" + "_use", 1, var_52a5be2e2f91d710);
    utility::trycall(level.matchdata_logkillstreakevent, "auto_drone", self.origin);
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "auto_drone", self, self.team);
    }
    return 1;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaeb
// Size: 0x9e
function function_589f29fde91a654a(player, streakinfo, mappointinfo) {
    level endon("game_ended");
    player notify("auto_drone_used");
    var_ae87376418450660 = mappointinfo;
    for (i = 0; i < var_ae87376418450660.size; i++) {
        var_a24a061a7076376c = function_6fe4e482e9c736b9(player, streakinfo, var_ae87376418450660[i], 1);
        var_a24a061a7076376c thread function_7056da117386cf8b();
        var_a24a061a7076376c thread function_dabe5e1812ac0003();
        var_a24a061a7076376c thread function_5072d07167c0ae44();
        var_a24a061a7076376c thread function_e01ff9fbb932ee1a();
        var_a24a061a7076376c thread function_71fc6fc4f15927a8();
        var_a24a061a7076376c thread function_7cd9f49e2a56ea1e();
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb90
// Size: 0x798
function function_6fe4e482e9c736b9(owner, streakinfo, var_e53ab3056af949c7, nonvehicle) {
    level endon("game_ended");
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    var_40d0fc358b957a0f = 36000;
    var_46b3d7cbd1251291 = 3000;
    var_3ae18fe8cc908b35 = isdefined(level.var_25479c87b8ab495c.var_aaba64c33f97c4da) ? 200 : level.var_25479c87b8ab495c.var_aaba64c33f97c4da;
    var_9c39dce599026a69 = 1500;
    var_505331ad630bbc6b = 0;
    if (isdefined(var_5fa1e1697a302583)) {
        var_46b3d7cbd1251291 = var_5fa1e1697a302583.origin[2] + 500;
    }
    var_4579697f9f42001 = var_e53ab3056af949c7.location;
    /#
        var_7cd8cd4d5be83b1a = getdvarint(@"hash_62b493e13a7a2273", 0);
        var_4579697f9f42001 = var_4579697f9f42001 + anglestoforward(owner.angles) * var_7cd8cd4d5be83b1a;
        var_5ceb15b939485b52 = getdvarint(@"hash_698613e6c8c52243", 0);
        var_46b3d7cbd1251291 = var_46b3d7cbd1251291 + var_5ceb15b939485b52;
    #/
    var_49dbe0a87db806d4 = (0, var_e53ab3056af949c7.angles, 0);
    flightpath = namespace_203b58a09d020a50::getflightpath(var_4579697f9f42001, var_49dbe0a87db806d4, var_40d0fc358b957a0f, var_5fa1e1697a302583, var_46b3d7cbd1251291, var_3ae18fe8cc908b35, var_9c39dce599026a69, streakinfo.streakname, var_505331ad630bbc6b);
    pathstart = flightpath["startPoint"];
    pathgoal = flightpath["endPoint"];
    var_7622a5ad898bdbd1 = var_49dbe0a87db806d4;
    var_23e2c43c7b301241 = isdefined(level.var_25479c87b8ab495c.var_1f5176ea25f9060) ? 500 : level.var_25479c87b8ab495c.var_1f5176ea25f9060;
    var_a24a061a7076376c = spawn("script_model", pathstart);
    if (!isdefined(level.var_25479c87b8ab495c.var_13fd3784885951a1)) {
        goto LOC_00000258;
    }
    var_a24a061a7076376c setmodel(level.var_25479c87b8ab495c.var_13fd3784885951a1, "veh9_mil_air_stealth_bomber_mp");
    var_a24a061a7076376c.speed = var_3ae18fe8cc908b35;
    var_a24a061a7076376c.accel = 100;
    var_a24a061a7076376c.angles = var_7622a5ad898bdbd1;
    var_a24a061a7076376c.team = owner.team;
    var_a24a061a7076376c.owner = owner;
    var_a24a061a7076376c.streakinfo = streakinfo;
    var_a24a061a7076376c.streakname = streakinfo.streakname;
    var_a24a061a7076376c.currentdamagestate = 0;
    var_a24a061a7076376c.flyheight = var_46b3d7cbd1251291;
    var_a24a061a7076376c.pers["team"] = var_a24a061a7076376c.team;
    var_a24a061a7076376c.flightdir = flightpath["directionAngles"];
    var_a24a061a7076376c.var_862801aab153104c = var_3ae18fe8cc908b35 * 17.6;
    var_a24a061a7076376c.var_6f43003b25b91499 = pathstart;
    var_a24a061a7076376c.var_ac01c3b7bbcbc871 = pathstart + anglestoforward(var_a24a061a7076376c.angles) * int(var_40d0fc358b957a0f * 0.67);
    var_a24a061a7076376c.var_9c6aa2ad962ccae2 = pathgoal - anglestoforward(var_a24a061a7076376c.angles) * int(var_40d0fc358b957a0f * 0.67);
    var_a24a061a7076376c.var_5118088b7d149d56 = pathgoal;
    var_a24a061a7076376c.var_40d811c99bd7ac07 = length(var_a24a061a7076376c.var_ac01c3b7bbcbc871 - var_a24a061a7076376c.var_9c6aa2ad962ccae2);
    var_a24a061a7076376c.flighttime = length(var_a24a061a7076376c.var_6f43003b25b91499 - var_a24a061a7076376c.var_5118088b7d149d56) / var_a24a061a7076376c.var_862801aab153104c;
    var_a24a061a7076376c.var_602736e29283719a = length(var_a24a061a7076376c.var_6f43003b25b91499 - var_a24a061a7076376c.var_ac01c3b7bbcbc871) / var_a24a061a7076376c.var_862801aab153104c;
    var_a24a061a7076376c.var_49d6b84e9061ea2 = length(var_a24a061a7076376c.var_6f43003b25b91499 - var_a24a061a7076376c.var_9c6aa2ad962ccae2) / var_a24a061a7076376c.var_862801aab153104c;
    var_a24a061a7076376c.var_c588c0602c9a3b4d = var_23e2c43c7b301241 / var_a24a061a7076376c.var_862801aab153104c;
    var_a24a061a7076376c.var_bebe0d78a71db256 = int(var_a24a061a7076376c.var_40d811c99bd7ac07 / var_23e2c43c7b301241);
    if (issharedfuncdefined("auto_drone", "attachXRays")) {
        var_a24a061a7076376c = [[ getsharedfunc("auto_drone", "attachXRays") ]](var_a24a061a7076376c);
    }
    killcament = spawn("script_model", var_a24a061a7076376c.origin);
    killcament linkto(var_a24a061a7076376c, "tag_origin", (-100, 0, -100), (0, 0, 0));
    var_a24a061a7076376c.killcament = killcament;
    minimapid = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
        minimapid = var_a24a061a7076376c [[ namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_drone_auto", var_a24a061a7076376c.team, 1, 1, 1, "icon_large");
    }
    var_a24a061a7076376c.minimapid = minimapid;
    var_a24a061a7076376c.var_3bbc88450857eea8 = [];
    var_a24a061a7076376c.var_3bbc88450857eea8["target_line_left"] = [];
    var_a24a061a7076376c.var_3bbc88450857eea8["target_line_right"] = [];
    var_a24a061a7076376c.var_c6dfe23f0091751b = [];
    var_a24a061a7076376c.var_c6dfe23f0091751b["target_line_left"] = [];
    var_a24a061a7076376c.var_c6dfe23f0091751b["target_line_right"] = [];
    /#
        var_86fca66109bd99a5 = getdvarint(@"hash_30dee5c8d013379b", 0);
        if (var_86fca66109bd99a5) {
            level thread namespace_f2ffc0540883e1ad::drawline(var_a24a061a7076376c.var_6f43003b25b91499, var_a24a061a7076376c.var_5118088b7d149d56, var_a24a061a7076376c.flighttime, (1, 1, 1));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_a24a061a7076376c.var_6f43003b25b91499, 50, var_a24a061a7076376c.flighttime, (1, 0, 0));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_a24a061a7076376c.var_5118088b7d149d56, 50, var_a24a061a7076376c.flighttime, (0, 1, 0));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_a24a061a7076376c.var_ac01c3b7bbcbc871, 100, var_a24a061a7076376c.flighttime, (0, 1, 1));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_a24a061a7076376c.var_9c6aa2ad962ccae2, 100, var_a24a061a7076376c.flighttime, (0, 1, 1));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_4579697f9f42001, 100, var_a24a061a7076376c.flighttime, (1, 0, 1));
            var_c9f73c9b2fff07e9 = anglestoforward(var_a24a061a7076376c.angles);
            var_76d752fee22fc87d = pathstart + var_c9f73c9b2fff07e9 * 200;
            level thread namespace_f2ffc0540883e1ad::drawline(var_a24a061a7076376c.var_6f43003b25b91499, var_76d752fee22fc87d, var_a24a061a7076376c.flighttime, (1, 0, 0));
        }
    #/
    var_a24a061a7076376c.var_be765c862617c601 = var_e53ab3056af949c7.location;
    var_a24a061a7076376c setscriptablepartstate("contrails", "on", 0);
    var_a24a061a7076376c setscriptablepartstate("lights", "on", 0);
    level.var_5f028b2553fb392d[level.var_5f028b2553fb392d.size] = var_a24a061a7076376c;
    return var_a24a061a7076376c;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1330
// Size: 0x227
function function_75693ae9c1b5327f(var_4fac8b8ce36e09f1) {
    self notify("cleaning_up");
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    if (isdefined(self.owner)) {
        if (!istrue(self.recordedgameendstats)) {
            self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
        }
    }
    level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    if (isdefined(self.var_c6dfe23f0091751b)) {
        /#
            var_e6324000e504af61 = self.var_c6dfe23f0091751b["endPoint"].size + self.var_c6dfe23f0091751b["killstreak_finish_use"].size;
            iprintlnbold("update_rapid_kill_buffered" + var_e6324000e504af61 + "<unknown string>");
        #/
        foreach (ent in self.var_c6dfe23f0091751b["target_line_left"]) {
            if (isdefined(ent)) {
                ent delete();
            }
        }
        foreach (ent in self.var_c6dfe23f0091751b["target_line_right"]) {
            if (isdefined(ent)) {
                ent delete();
            }
        }
    }
    if (isdefined(self.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    level.var_5f028b2553fb392d = array_remove(level.var_5f028b2553fb392d, self);
    self delete();
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155e
// Size: 0x36
function function_7056da117386cf8b() {
    self endon("death");
    level waittill("game_ended");
    self.recordedgameendstats = 1;
    self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159b
// Size: 0x9d
function function_dabe5e1812ac0003() {
    self endon("death");
    self endon("cleaning_up");
    self.owner waittill_any_3("disconnect", "joined_team", "joined_spectators");
    self.var_b5629f125e88fe86 = 1;
    if (isdefined(self.var_51fc4d05abd22e9d)) {
        self.var_51fc4d05abd22e9d delete();
    }
    self setscriptablepartstate("release", "neutral", 0);
    self setscriptablepartstate("contrails", "off", 0);
    self setscriptablepartstate("lights", "off", 0);
    self notify("autodrone_flight_finished");
    self notify("autodrone_volley_finished");
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x163f
// Size: 0x132
function function_313eeda8b560e440(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
    missiletarget endon("death");
    missiletarget endon("crashing");
    level endon("game_ended");
    while (1) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            if (issharedfuncdefined("flares", "reduceReserves")) {
                [[ getsharedfunc("flares", "reduceReserves") ]](missiletarget);
            }
            if (issharedfuncdefined("flares", "playFx")) {
                missiletarget thread [[ getsharedfunc("flares", "playFx") ]]("jet_flares", var_5991f0e5da9f9bd5);
            }
            newtarget = undefined;
            if (issharedfuncdefined("flares", "deploy")) {
                newtarget = missiletarget [[ getsharedfunc("flares", "deploy") ]]();
            }
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            return;
        }
        waitframe();
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1778
// Size: 0x147
function function_71fc6fc4f15927a8() {
    self endon("death");
    level endon("game_ended");
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    var_edc8eb6ff8689dde = self.flighttime;
    var_ddfe084a5f844081 = self.var_49d6b84e9061ea2;
    var_9a725e0702370e63 = var_edc8eb6ff8689dde - var_ddfe084a5f844081;
    plane = self;
    var_e4d26f59db05025a = "ks_auto_drone_mp";
    var_3a69e5fc82079ce3 = self.var_6f43003b25b91499;
    var_7789cda8c1e3128e = self.angles;
    var_3a20f9101e50025f = 0.05;
    var_3a020e101e2ddead = self.var_602736e29283719a;
    var_7c39d972e849c204 = var_ddfe084a5f844081;
    var_a9b4b258c1167b50 = var_edc8eb6ff8689dde;
    self.var_51fc4d05abd22e9d = level namespace_203b58a09d020a50::airstrike_playflyfx(plane, var_e4d26f59db05025a, var_3a69e5fc82079ce3, var_7789cda8c1e3128e, var_3a20f9101e50025f, var_3a020e101e2ddead, var_7c39d972e849c204, var_a9b4b258c1167b50, self.streakinfo);
    self moveto(self.var_5118088b7d149d56, var_edc8eb6ff8689dde);
    wait(var_ddfe084a5f844081);
    self.isleaving = 1;
    wait(var_9a725e0702370e63);
    self hide();
    self.var_b5629f125e88fe86 = 1;
    self notify("autodrone_flight_finished");
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c6
// Size: 0xb4
function function_7cd9f49e2a56ea1e() {
    self endon("death");
    self endon("autodrone_flight_finished");
    level endon("game_ended");
    var_ed404db23f89e299 = 0.15;
    var_ed1d39b23f636ee5 = 0.075;
    var_ed1d3fb23f637c17 = 0.0075;
    duration = 0.05;
    source = self.origin;
    var_31141c7d0222bbe6 = 10000;
    var_a90593f8a59c9972 = 15000;
    var_7982be2c5f81cf6c = 50000;
    while (1) {
        function_e45e5fd94ec4af36(var_ed404db23f89e299, var_ed1d39b23f636ee5, var_ed1d3fb23f637c17, duration, source, var_31141c7d0222bbe6, var_a90593f8a59c9972, var_7982be2c5f81cf6c);
        wait(0.05);
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1981
// Size: 0x8b
function function_5072d07167c0ae44() {
    self endon("death");
    level endon("game_ended");
    self.owner endon("disconnect");
    self.var_776781805de7309d = 0;
    childthread function_85af195b469d31c5();
    childthread function_7507ce6b3db8bbc6();
    self waittill("autodrone_volley_finished");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    if (self.var_776781805de7309d >= 1) {
        playkillstreakoperatordialog("auto_drone", "auto_drone" + "_hit_target");
    } else {
        playkillstreakoperatordialog("auto_drone", "auto_drone" + "_miss_target");
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a13
// Size: 0x45
function function_85af195b469d31c5() {
    while (1) {
        weaponname = var_e4c6376813e5a077 = self.owner waittill("update_rapid_kill_buffered");
        if (function_57a633080c56f0ab(weaponname)) {
            self.var_776781805de7309d++;
        }
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5f
// Size: 0x45
function function_7507ce6b3db8bbc6() {
    while (1) {
        weaponname = var_e4c6376813e5a077 = self.owner waittill("update_rapid_agent_kill_buffered");
        if (function_57a633080c56f0ab(weaponname)) {
            self.var_776781805de7309d++;
        }
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aab
// Size: 0x19
function function_57a633080c56f0ab(weaponname) {
    return isdefined(weaponname) && weaponname == "auto_drone_proj_mp";
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acc
// Size: 0x203
function function_e01ff9fbb932ee1a() {
    self endon("death");
    self endon("autodrone_volley_finished");
    level endon("game_ended");
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](self.streakinfo);
    }
    thread function_83c774ec24aea7ba();
    if (!istrue(self.owner.var_65219c911f198c95)) {
        var_3c89fedb7c78518c = self.var_602736e29283719a;
        wait(var_3c89fedb7c78518c);
        if (!istrue(self.owner.var_65219c911f198c95)) {
            self setscriptablepartstate("release", "active", 0);
            childthread function_fdef1908ab475a22("target_line_left");
            childthread function_fdef1908ab475a22("target_line_right");
            contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 0, 0, 0);
            var_4d9aa2d7b6011b59 = "none";
            var_ffd02ab6fca99256 = 1;
            launchpos = self.origin;
            var_6951cf1f43bc8ebe = self.angles;
            for (i = 0; i < self.var_bebe0d78a71db256; i++) {
                for (j = 0; j < 2; j++) {
                    if (j == 1) {
                        var_4d9aa2d7b6011b59 = "target_line_right";
                    } else {
                        var_4d9aa2d7b6011b59 = "target_line_left";
                    }
                    targetpos = function_3abd38166387d794(var_4d9aa2d7b6011b59, contentoverride, launchpos);
                    if (isdefined(targetpos)) {
                        thread function_c94461e02cfe0bb9(var_4d9aa2d7b6011b59, targetpos, var_ffd02ab6fca99256);
                        var_ffd02ab6fca99256++;
                        if (var_ffd02ab6fca99256 > 25) {
                            var_ffd02ab6fca99256 = 1;
                        }
                    }
                }
                wait(self.var_c588c0602c9a3b4d);
                if (!isdefined(level.var_25479c87b8ab495c.var_1f5176ea25f9060)) {
                    goto LOC_000001d6;
                }
                launchpos = anglestoforward(var_6951cf1f43bc8ebe) + 500 * level.var_25479c87b8ab495c.var_1f5176ea25f9060;
            }
            self setscriptablepartstate("release", "neutral", 0);
            function_464ed851fbd2e05();
        }
    }
    self notify("autodrone_volley_finished");
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd6
// Size: 0x18c
function function_3abd38166387d794(var_4d9aa2d7b6011b59, contentoverride, var_51c1b45046e1647c) {
    if (!isdefined(var_51c1b45046e1647c)) {
        var_51c1b45046e1647c = self.origin;
    }
    var_6951cf1f43bc8ebe = self.angles;
    var_a8b7ffaf6fa18f = undefined;
    target_offset = isdefined(level.var_25479c87b8ab495c.var_2d679ba09f41c961) ? 300 : level.var_25479c87b8ab495c.var_2d679ba09f41c961;
    switch (var_4d9aa2d7b6011b59) {
    case #"hash_ac43add84a7bdc09":
        var_a8b7ffaf6fa18f = var_51c1b45046e1647c - anglestoright(var_6951cf1f43bc8ebe) * target_offset;
        break;
    case #"hash_fedc29c8476c33aa":
        var_a8b7ffaf6fa18f = var_51c1b45046e1647c + anglestoright(var_6951cf1f43bc8ebe) * target_offset;
        break;
    default:
        var_a8b7ffaf6fa18f = var_51c1b45046e1647c;
        break;
    }
    if (isdefined(var_a8b7ffaf6fa18f)) {
        launchpos = function_4864b3ee27853e8f(var_a8b7ffaf6fa18f, isdefined(level.var_25479c87b8ab495c.var_911596c06bea8357) ? 300 : level.var_25479c87b8ab495c.var_911596c06bea8357);
        var_785f5b52f245a2b6 = launchpos;
        var_bd794eef2b14c4b3 = launchpos - (0, 0, 50000);
        var_3b8c153f4d5d7f16 = namespace_2a184fc4902783dc::ray_trace(var_785f5b52f245a2b6, var_bd794eef2b14c4b3, undefined, contentoverride);
        var_199d077025badc44 = undefined;
        if (var_3b8c153f4d5d7f16["hittype"] != "hittype_none") {
            var_199d077025badc44 = var_3b8c153f4d5d7f16["position"];
        }
        return var_199d077025badc44;
    }
    return undefined;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6a
// Size: 0x87
function function_4864b3ee27853e8f(var_a8b7ffaf6fa18f, var_4d3c88c7cda33338) {
    var_a0a41ba05e16ffe6 = randomint(var_4d3c88c7cda33338);
    randangle = randomint(360);
    x = var_a8b7ffaf6fa18f[0] + var_a0a41ba05e16ffe6 * cos(randangle);
    y = var_a8b7ffaf6fa18f[1] + var_a0a41ba05e16ffe6 * sin(randangle);
    z = var_a8b7ffaf6fa18f[2];
    point = (x, y, z);
    return point;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef9
// Size: 0x30
function function_c94461e02cfe0bb9(var_4d9aa2d7b6011b59, var_7b59b41b01684053, var_ffd02ab6fca99256) {
    function_feb32e136c3564d0(var_4d9aa2d7b6011b59, var_ffd02ab6fca99256, var_7b59b41b01684053, 1, 3);
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f30
// Size: 0xa2
function function_feb32e136c3564d0(firetype, var_bfc89a008cf7365b, var_45b16f7f8bc51616, var_fba952950358557d, var_4ff0c3309f484b95) {
    if (!isdefined(var_4ff0c3309f484b95)) {
        var_4ff0c3309f484b95 = 0;
    }
    var_effcc3654e4d3279 = spawnstruct();
    var_effcc3654e4d3279.var_8a46c62f0a756dd3 = "explode_" + var_bfc89a008cf7365b;
    var_effcc3654e4d3279.location = var_45b16f7f8bc51616;
    var_effcc3654e4d3279.duration = var_fba952950358557d;
    var_effcc3654e4d3279.starttime = gettime() + var_4ff0c3309f484b95 * 1000;
    self.var_3bbc88450857eea8[firetype][self.var_3bbc88450857eea8[firetype].size] = var_effcc3654e4d3279;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd9
// Size: 0x164
function function_fdef1908ab475a22(firetype) {
    for (currentindex = 0; 1; currentindex++) {
        if (self.var_3bbc88450857eea8[firetype].size < currentindex + 1) {
            waitframe();
            continue;
        }
        var_81b2ef5a08652e95 = self.var_3bbc88450857eea8[firetype][currentindex];
        var_a6584937bc27f804 = var_81b2ef5a08652e95.var_8a46c62f0a756dd3;
        var_45b16f7f8bc51616 = var_81b2ef5a08652e95.location;
        var_fba952950358557d = var_81b2ef5a08652e95.duration;
        var_a28e260aedad587e = var_81b2ef5a08652e95.starttime;
        while (gettime() < var_a28e260aedad587e) {
            waitframe();
        }
        var_ec425ec41730e90a = function_4d86e5fcc67998a4(firetype);
        if (!isdefined(var_ec425ec41730e90a)) {
            /#
                iprintlnbold("<unknown string>" + firetype + "<unknown string>");
            #/
            waitframe();
            continue;
        }
        var_ec425ec41730e90a.inuse = 1;
        var_ec425ec41730e90a.origin = var_45b16f7f8bc51616;
        /#
            var_86fca66109bd99a5 = getdvarint(@"hash_30dee5c8d013379b", 0);
            if (var_86fca66109bd99a5) {
                level thread namespace_f2ffc0540883e1ad::drawsphere(var_ec425ec41730e90a.origin, 25, self.flighttime, (0, 1, 0));
            }
        #/
        waitframe();
        var_ec425ec41730e90a childthread function_afb3d7504a849066(var_a6584937bc27f804, var_fba952950358557d);
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2144
// Size: 0x69
function function_afb3d7504a849066(var_8a46c62f0a756dd3, var_fba952950358557d) {
    self setscriptablepartstate(var_8a46c62f0a756dd3, "active", 0);
    wait(var_fba952950358557d);
    if (isdefined(level.var_ca1a76fbc0ba0bef)) {
        thread [[ level.var_ca1a76fbc0ba0bef ]](self.streakinfo, self.origin, 0);
    }
    self setscriptablepartstate(var_8a46c62f0a756dd3, "neutral", 0);
    self.inuse = 0;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b4
// Size: 0x32
function function_83c774ec24aea7ba() {
    level endon("game_ended");
    self waittill("autodrone_volley_finished");
    while (1) {
        if (istrue(self.var_b5629f125e88fe86)) {
            break;
        }
        waitframe();
    }
    function_75693ae9c1b5327f();
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ed
// Size: 0xe0
function function_464ed851fbd2e05() {
    level endon("game_ended");
    var_302f633427d41afc = 1;
    while (1) {
        var_302f633427d41afc = 1;
        foreach (var_205e3b3b6fc640ea in self.var_c6dfe23f0091751b) {
            foreach (var_ec425ec41730e90a in var_205e3b3b6fc640ea) {
                if (istrue(var_ec425ec41730e90a.inuse)) {
                    var_302f633427d41afc = 0;
                    break;
                }
            }
            if (!istrue(var_302f633427d41afc)) {
                break;
            }
        }
        if (!istrue(var_302f633427d41afc)) {
            waitframe();
            continue;
        }
        break;
    }
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d4
// Size: 0x10f
function function_4d86e5fcc67998a4(firetype) {
    if (!isdefined(self.owner)) {
        return;
    }
    var_ec425ec41730e90a = undefined;
    var_2ab78fe309d9b0ea = isdefined(level.var_25479c87b8ab495c.var_4b6066fcdd13f1b9) ? "ks_auto_drone_target_mp" : level.var_25479c87b8ab495c.var_4b6066fcdd13f1b9;
    if (self.var_c6dfe23f0091751b[firetype].size == 0) {
        var_ec425ec41730e90a = function_762e969612131da2(firetype, var_2ab78fe309d9b0ea);
    } else {
        var_2e3bc563c04ce992 = self.var_c6dfe23f0091751b[firetype];
        foreach (ent in var_2e3bc563c04ce992) {
            if (!istrue(ent.inuse)) {
                var_ec425ec41730e90a = ent;
                break;
            }
        }
        if (!isdefined(var_ec425ec41730e90a) && var_2e3bc563c04ce992.size < 10) {
            var_ec425ec41730e90a = function_762e969612131da2(firetype, var_2ab78fe309d9b0ea);
        }
    }
    return var_ec425ec41730e90a;
}

// Namespace auto_drone/namespace_d02a28280306d1bc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23eb
// Size: 0xb4
function function_762e969612131da2(firetype, var_2ab78fe309d9b0ea) {
    var_ec425ec41730e90a = spawn("script_model", self.origin);
    var_ec425ec41730e90a.inuse = 0;
    var_ec425ec41730e90a.streakinfo = self.streakinfo;
    var_ec425ec41730e90a.weapon_name = "auto_drone_proj_mp";
    var_ec425ec41730e90a.killcament = self.killcament;
    var_ec425ec41730e90a setmodel(var_2ab78fe309d9b0ea);
    var_ec425ec41730e90a dontinterpolate();
    var_ec425ec41730e90a setentityowner(self.owner);
    self.var_c6dfe23f0091751b[firetype][self.var_c6dfe23f0091751b[firetype].size] = var_ec425ec41730e90a;
    return var_ec425ec41730e90a;
}

