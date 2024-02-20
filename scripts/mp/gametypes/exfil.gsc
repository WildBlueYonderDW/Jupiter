// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\gametypes\br_extract_chopper.gsc;
#using scripts\mp\utility\print.gsc;

#namespace exfil;

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x713
// Size: 0x1d
function exfilinit() {
    level._effect["vfx_smk_signal"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x148
function onexfilstart(winner, getexfilloccallback, var_7c52b433f53d39ee, onexfilkilled) {
    level.getexfilloccallback = getexfilloccallback;
    level.onexfilfinishedcallback = var_7c52b433f53d39ee;
    level.onexfilkilledcallback = onexfilkilled;
    level.exfilgoaltrigger = getent(winner + "_exfil_trigger", "targetname");
    level.exfilstarted = 1;
    if (isdefined(level.onexfilstarted)) {
        [[ level.onexfilstarted ]]();
    }
    if (isdefined(level.objectives) && level.objectives.size > 0) {
        thread removeallobjids();
    }
    level.ignorescoring = 1;
    namespace_d576b6dc7cef9c62::resumetimer();
    level.starttime = gettime();
    level.discardtime = 0;
    level.timerpausetime = 0;
    timelimit = level.exfilactivetimer + level.exfilextracttimer;
    gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
    level.watchdvars[gamemode].value = timelimit;
    level.overridewatchdvars[gamemode] = timelimit;
    runexfil(winner, onexfilkilled);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x886
// Size: 0xa2
function removeallobjids() {
    foreach (o in level.objectives) {
        if (isdefined(o.objidnum)) {
            o namespace_19b4203b51d56488::releaseid();
        }
        if (isdefined(o.trigger) && isdefined(o.trigger.objidnum)) {
            o.trigger namespace_19b4203b51d56488::releaseid();
        }
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x92f
// Size: 0x83
function runexfil(winner, onhelikilled) {
    level thread namespace_44abc05161e2e2cb::notifyteam("callout_exfil_winners", "callout_exfil_losers", winner);
    level thread spawnexfilzone(winner);
    level thread spawnexfilplayers(winner);
    leaderdialog("enemy_exfil", getotherteam(winner)[0], "status");
    leaderdialog("friendly_exfil", winner, "status");
    level.timelimitoverride = 0;
    wait(1);
    level.ontimelimit = &onexfiltimelimit;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b9
// Size: 0x72
function spawnexfilplayers(winner) {
    gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numlives");
    level.watchdvars[gamemode].value = 1;
    level.overridewatchdvars[gamemode] = 1;
    level notify("extract_players_spawned");
    level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(winner, "exfil_prevent", "exfil_go");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa32
// Size: 0x8f
function skipkillcamandspawn() {
    self notify("abort_killcam");
    self.cancelkillcam = 1;
    waitframe();
    thread namespace_99ac021a7547cae3::spawnplayer(0, 1);
    if (isteamreviveenabled() && isdefined(level.revivetriggers[self.guid])) {
        level.revivetriggers[self.guid].victim thread namespace_7db13bdf599e41a6::removetrigger(level.revivetriggers[self.guid].victim.guid);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac8
// Size: 0x465
function spawnexfilzone(winner) {
    level endon("game_ended");
    self endon("death");
    var_c8a41ae10dd3b1d2 = getotherteam(winner)[0];
    if (!isdefined(level.exfilgoaltrigger)) {
        primaryflags = getentarray("flag_primary", "targetname");
        triggers = [];
        for (index = 0; index < primaryflags.size; index++) {
            triggers[triggers.size] = primaryflags[index];
        }
        foreach (trigger in triggers) {
            if (trigger.script_label == "_b") {
                trigger.script_label = "_b";
                level.exfilgoaltrigger = trigger;
                if (!isdefined(level.exfilgoaltrigger)) {
                    level notify("exfil_continue_game_end");
                    return;
                }
            }
        }
    }
    level.exfilgoalent = spawn("script_model", level.exfilgoaltrigger.origin);
    level.exfilgoalent.angles = (0, 270, 0);
    level.exfilgoalent.team = var_c8a41ae10dd3b1d2;
    level.exfilgoalent.visibleteam = "any";
    level.exfilgoalent.ownerteam = var_c8a41ae10dd3b1d2;
    level.exfilgoalent.type = "";
    droppoint = level.exfilgoaltrigger.origin;
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(level.exfilgoalent.origin + (0, 0, 20), level.exfilgoalent.origin - (0, 0, 4000), ignoreents, contentoverride, 0);
    if (isplayer(trace["entity"])) {
        trace["entity"] = undefined;
    }
    if (isdefined(trace)) {
        tempangle = randomfloat(360);
        droporigin = trace["position"];
        if (isdefined(self.visualgroundoffset)) {
            droporigin = droporigin + self.visualgroundoffset;
        }
        forward = (cos(tempangle), sin(tempangle), 0);
        forward = vectornormalize(forward - trace["normal"] * vectordot(forward, trace["normal"]));
        dropangles = vectortoangles(forward);
        level.exfilgoalent.origin = droporigin;
        level.exfilgoalent setmodel("cop_marker_scriptable");
        level.exfilgoalent setscriptablepartstate("marker", "red");
        level.exfilgoalent playloopsound("mp_flare_burn_lp");
    }
    level.exfilgoaltrigger thread goaltriggerwatcher(self);
    level.exfilobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (level.exfilobjid != -1) {
        var_24c76fc549f7fd9 = "current";
        namespace_5a22b6f3a56f7e9b::objective_add_objective(level.exfilobjid, var_24c76fc549f7fd9, level.exfilgoaltrigger.origin + (0, 0, 60));
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(level.exfilobjid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(level.exfilobjid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(level.exfilobjid);
        self.showworldicon = 1;
    }
    level.exfilgoalent namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_waitfor_exfil", "icon_waypoint_prevent_exfil", level.exfilobjid);
    objective_sethot(level.exfilobjid, 1);
    level thread watchforexfilactive(winner);
    waitframe();
    playfxontag(level._effect["vfx_smk_signal"], level.exfilgoalent, "tag_origin");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf34
// Size: 0x78
function goaltriggerwatcher(player) {
    level endon("game_ended");
    self notify("trigger_start");
    self endon("trigger_start");
    level waittill("extract_trigger_active");
    while (1) {
        player = self waittill("trigger");
        if (player.team == level.exfilgoalent.team && !istrue(player.extracted)) {
            level thread onexfilsuccess(player);
        }
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfb3
// Size: 0x72
function watchforexfilactive(winner) {
    level endon("game_ended");
    level thread runexfilnotactivefill(winner);
    level thread runexfilwaitactiveunfill(winner);
    var_68d24288e5c2a0b4 = level.exfilactivetimer;
    wait(var_68d24288e5c2a0b4);
    level.exfilnotactive = 0;
    level notify("extract_trigger_active");
    level.exfilgoalent namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_active_exfil", "icon_waypoint_prevent_exfil", level.exfilobjid);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102c
// Size: 0xff
function runexfilnotactivefill(winner) {
    level endon("game_ended");
    level.exfilnotactive = 1;
    updaterate = level.framedurationseconds;
    var_a1dfe9d4920a43fa = updaterate * 1000;
    var_68d24288e5c2a0b4 = level.exfilactivetimer;
    var_68d24288e5c2a0b4 = var_68d24288e5c2a0b4 * 1000;
    addtime = var_a1dfe9d4920a43fa;
    while (level.exfilnotactive) {
        if (addtime != 0) {
            var_5f6264f695308483 = min(addtime / var_68d24288e5c2a0b4, 1);
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.exfilobjid, undefined);
            namespace_5a22b6f3a56f7e9b::objective_show_progress(self.exfilobjid, 1);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.exfilobjid, var_5f6264f695308483);
            addtime = min(addtime + var_a1dfe9d4920a43fa, var_68d24288e5c2a0b4);
        }
        waitframe();
    }
    leaderdialog("exfilarrive_enemy", getotherteam(winner)[0], "status");
    leaderdialog("exfilarrive_friendly", winner, "status");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1132
// Size: 0x105
function runexfilwaitactiveunfill(winner) {
    level endon("game_ended");
    level waittill("extract_trigger_active");
    level.exfilactive = 1;
    updaterate = level.framedurationseconds;
    var_a1dfe9d4920a43fa = updaterate * 1000;
    var_75f51a7eb662fe97 = level.exfilextracttimer;
    var_75f51a7eb662fe97 = var_75f51a7eb662fe97 * 1000;
    var_d3d9f3ad00693948 = var_75f51a7eb662fe97 - var_a1dfe9d4920a43fa;
    while (level.exfilactive) {
        var_5f6264f695308483 = var_d3d9f3ad00693948 / var_75f51a7eb662fe97;
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.exfilobjid, getotherteam(winner)[0]);
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.exfilobjid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.exfilobjid, var_5f6264f695308483);
        var_d3d9f3ad00693948 = max(var_d3d9f3ad00693948 - var_a1dfe9d4920a43fa, 1);
        waitframe();
    }
    leaderdialog("exfilend_enemy", getotherteam(winner)[0], "status");
    leaderdialog("exfilend_friendly", winner, "status");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x123e
// Size: 0xc7
function switchtoexfilweapons(winner, var_996eac0d7f6fe3ab) {
    level waittill("extract_players_spawned");
    var_c8a41ae10dd3b1d2 = getotherteam(winner)[0];
    if (var_c8a41ae10dd3b1d2 != "tie") {
        foreach (p in level.players) {
            if (p.team == var_c8a41ae10dd3b1d2) {
                p takeallweapons();
                p namespace_df5cfdbe6e2d3812::_giveweapon(var_996eac0d7f6fe3ab, undefined, undefined, 1);
                p thread switchtoexfilweapon(var_996eac0d7f6fe3ab);
                p namespace_1a507865f681850e::giveequipment("equip_throwing_knife", "primary");
            }
        }
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x130c
// Size: 0x2c
function switchtoexfilweapon(var_996eac0d7f6fe3ab) {
    self endon("death_or_disconnect");
    self endon("end_switchToFists");
    while (domonitoredweaponswitch(var_996eac0d7f6fe3ab, 1) == 0) {
        waitframe();
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x133f
// Size: 0x21
function onexfiltimelimit() {
    level.exfilactive = 0;
    if (level.exfilactive) {
        level notify("exfil_continue_game_end");
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1367
// Size: 0x115
function onexfilsuccess(player) {
    level endon("game_ended");
    player.extracted = 1;
    player.spawnprotection = 1;
    player namespace_41cb45263e591751::setlightarmorvalue(player, 1000, undefined, 0);
    player val::function_2d6e7e0b80767910("exfil_success", [0:"usability", 1:"offhand_weapons", 2:"killstreaks", 3:"supers", 4:"gesture", 5:"weapon", 6:"weapon_switch"]);
    player val::function_3633b947164be4f3("exfil_success", 0);
    player thread namespace_44abc05161e2e2cb::showsplash("callout_exfil_success");
    while (!player isonground()) {
        waitframe();
    }
    player allowmovement(0);
    var_3ebcc9541185a5ee = spawn("script_origin", player.origin);
    var_3ebcc9541185a5ee setmodel("tag_origin");
    player playerlinkto(var_3ebcc9541185a5ee);
    var_3ebcc9541185a5ee moveto(var_3ebcc9541185a5ee.origin + (0, 0, 10000), 5, 2, 2);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1483
// Size: 0x18
function stopunfillthread(time) {
    wait(time);
    self.exfilactive = 0;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14a2
// Size: 0x256
function assignhelitoexfilpoint(onhelikilled, var_35e197dc52ce8af9, team) {
    wait(var_35e197dc52ce8af9 + randomint(10));
    vehicle = level.players[0] namespace_3a5b7dd73e67921c::spawnextractchopper(self, self.origin, onhelikilled, 10 + var_35e197dc52ce8af9);
    vehicle playloopsound("br_exfil_lbravo_engine_temp");
    colmodel = getent("clip64x64x256", "targetname");
    colmodelent = spawn("script_model", vehicle gettagorigin("tag_origin"));
    colmodelent dontinterpolate();
    colmodelent.angles = (-90, 0, 0);
    colmodelent clonebrushmodeltoscriptmodel(colmodel);
    var_118e33b11df01435 = anglestoforward(vehicle.angles * (1, 0, 0));
    var_2b67713c58007394 = vectornormalize(var_118e33b11df01435) * 85;
    colmodelent linkto(vehicle, "tag_origin", var_2b67713c58007394 + (0, 0, -60), colmodelent.angles);
    vehicle.colmodelent = colmodelent;
    vehicle sethoverparams(5, 10, 5);
    self.choppers[self.choppers.size] = vehicle;
    vehicle.extractzone = self;
    if (!isdefined(team)) {
        team = self.team;
    }
    vehicle.team = team;
    vehicle.exfilspace = 6;
    vehicle.passengers[0] = self;
    vehicle.passengers[1] = self;
    vehicle.passengers[2] = self;
    vehicle.passengers[3] = self;
    vehicle.passengers[4] = self;
    vehicle.passengers[5] = self;
    self.curorigin = self.origin;
    self.offset3d = (0, 0, 30);
    vehicle init_useprompt_interactions();
    thread bugoutontimeout(vehicle);
    vehicle.scene_node = undefined;
    scene_name = undefined;
    vehicle thread exfilpilotactorthink(team, vehicle.scene_node, scene_name);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ff
// Size: 0x25
function createextractvfx() {
    wait(1);
    playfxontag(getfx("vfx_smk_signal_gr"), self.vfxent, "tag_origin");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x172b
// Size: 0x8c
function exfilpilotactorthink(team, scene_node, scene_name, var_16e334d22d37be73) {
    level endon("game_ended");
    self.actors = thread spawnexfilpilotactors(team, scene_name, var_16e334d22d37be73);
    anim_first_frame(self.actors, "lbravo_exfil", "origin_animate_jnt");
    hideactors();
    showactors();
    if (isdefined(self.path)) {
        exfilactorthinkpath(team, scene_node, scene_name, var_16e334d22d37be73);
    } else {
        exfilactorthinkanim(team, scene_node, scene_name, var_16e334d22d37be73);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17be
// Size: 0x4b
function exfilactorthinkpath(team, scene_node, scene_name, var_16e334d22d37be73) {
    thread exfilactorloopthink(self.actors[0]);
    thread exfilactorloopthink(self.actors[1]);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1810
// Size: 0x26
function exfilactorloopthink(actor) {
    exfilactorloop(actor);
    anim_single_solo(actor, "lbravo_exfil_loop_exit", "origin_animate_jnt");
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x183d
// Size: 0x2d
function exfilactorloop(actor) {
    self endon("unload");
    while (1) {
        anim_single_solo(actor, "lbravo_exfil_loop", "origin_animate_jnt");
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1871
// Size: 0xc4
function exfilactorthinkanim(team, scene_node, scene_name, var_16e334d22d37be73) {
    thread anim_single(self.actors, "lbravo_exfil", "origin_animate_jnt");
    duration = getanimlength(level.scr_anim["pilot"]["lbravo_exfil"]);
    wait(duration);
    foreach (actor in self.actors) {
        actor delete();
    }
    self.actors = undefined;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x193c
// Size: 0xaf
function spawnexfilpilotactors(team, scene_name, var_16e334d22d37be73) {
    actors = [];
    actors[actors.size] = exfil_spawn_anim_model("pilot", "origin_animate_jnt", "fullbody_ppilot_crew_a");
    actors[actors.size] = exfil_spawn_anim_model("copilot", "origin_animate_jnt", "fullbody_ppilot_crew_a");
    foreach (actor in actors) {
        actor.infil = self;
    }
    return actors;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19f3
// Size: 0x17a
function exfil_spawn_anim_model(animname, var_609c1b125a13456, body, head, weapon) {
    guy = spawn("script_model", (0, 0, 0));
    guy setmodel(body);
    if (isdefined(head)) {
        var_f4246828592f1c0f = spawn("script_model", (0, 0, 0));
        var_f4246828592f1c0f setmodel(head);
        var_f4246828592f1c0f linkto(guy, "j_spine4", (0, 0, 0), (0, 0, 0));
        guy.head = var_f4246828592f1c0f;
        guy thread delete_on_death(var_f4246828592f1c0f);
    }
    if (isdefined(weapon)) {
        var_e71ccb5e6023bcdd = spawn("script_model", (0, 0, 0));
        var_e71ccb5e6023bcdd setmodel(weapon);
        var_e71ccb5e6023bcdd linkto(guy, "j_gun", (0, 0, 0), (0, 0, 0));
        guy thread delete_on_death(var_e71ccb5e6023bcdd);
        guy.weapon = var_e71ccb5e6023bcdd;
    }
    guy.animname = animname;
    guy setanimtree();
    if (isdefined(var_609c1b125a13456)) {
        thread delete_on_death(guy);
        guy linkto(self, var_609c1b125a13456, (0, 0, 0), (0, 0, 0));
    }
    return guy;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b75
// Size: 0x55
function bugoutontimeout(heli) {
    level waittill_any_2("exfil_continue_game_end", "exfil_on_nuke_arrival");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.exfilgoalent.exfilobjid);
    thread forcelinkgoaltriggerwatcher(heli);
    heli thread exfilleavesequence(heli.origin);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd1
// Size: 0x98
function forcelinkgoaltriggerwatcher(heli) {
    level endon("game_ended");
    self notify("trigger_start");
    self endon("trigger_start");
    while (1) {
        player = self waittill("trigger");
        if (player.team == self.exfilgoalent.team && !istrue(player.extracted)) {
            player thread playeranimlinktochopper(heli);
            heli.exfilspace--;
            if (heli.exfilspace <= 0) {
                break;
            }
        }
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c70
// Size: 0x98
function exfilusetriggerused(player, seatnum, var_7838d4d4a6f522d6) {
    if (!isdefined(self.exfilspace)) {
        self.exfilspace = 6;
    }
    if (self.exfilspace > 0) {
        playerlinktochopper(player, self, self.exfilspace);
        thread disableotherseats(player, seatnum, var_7838d4d4a6f522d6);
        self.exfilspace--;
    } else {
        thread exfilleavesequence();
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.extractzone.exfilgoalent.exfilobjid);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0f
// Size: 0xae
function waitforsquadthenleave(player) {
    teamplayers = level.teamdata[player.team]["players"];
    foreach (p in teamplayers) {
        if (p != player) {
            p thread namespace_68747ec28caa9f9e::tutorialprint("MP_INGAME_ONLY/GET_ON_CHOPPER", 10);
        } else {
            p thread namespace_68747ec28caa9f9e::tutorialprint("MP_INGAME_ONLY/CHOPPER_LEAVING_SOON", 10);
        }
    }
    wait(10);
    thread exfilleavesequence(undefined, 1);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc4
// Size: 0x82
function disableotherseats(player, var_642f32d0cbb64c85, var_7838d4d4a6f522d6) {
    foreach (interact in self.interactiontriggers) {
        interact disableplayeruse(player);
    }
    if (isdefined(var_7838d4d4a6f522d6)) {
        player thread enableexitprompt(var_642f32d0cbb64c85, self, var_7838d4d4a6f522d6);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4d
// Size: 0xbd
function enableexitprompt(var_642f32d0cbb64c85, vehicle, var_7838d4d4a6f522d6) {
    interaction = spawn("script_model", self.origin);
    interaction setmodel("tag_origin");
    interaction linkto(self);
    interaction sethintstring("MP/HOLD_TO_GET_OFF_CHOPPER");
    interaction setcursorhint("HINT_NOICON");
    interaction sethintdisplayrange(200);
    interaction sethintdisplayfov(90);
    interaction setuserange(200);
    interaction setusefov(360);
    interaction sethintonobstruction("hide");
    interaction setuseholdduration("duration_short");
    interaction thread exfil_hopoff_think(vehicle, self, var_642f32d0cbb64c85, var_7838d4d4a6f522d6);
    vehicle.exitinteract = interaction;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f11
// Size: 0xfd
function exfil_hopoff_think(vehicle, player, var_642f32d0cbb64c85, var_7838d4d4a6f522d6) {
    makechopperseatplayerusable(player);
    while (1) {
        player = self waittill("trigger");
        self makeunusable();
        player stopanimscriptsceneevent();
        vehicle anim_player_solo(player, player.player_rig, "lbravo_exfil_loop_exit", "origin_animate_jnt");
        player.player_rig unlink();
        player unlink();
        var_7838d4d4a6f522d6 makechopperseatteamusable(vehicle.team);
        foreach (interact in vehicle.interactiontriggers) {
            interact enableplayeruse(player);
        }
        vehicle notify("unloaded");
        self delete();
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2015
// Size: 0x8d
function playerlinktochopper(player, heli, var_54100ca480291b0c) {
    level endon("game_ended");
    player.extracted = 1;
    player.spawnprotection = 1;
    player namespace_41cb45263e591751::setlightarmorvalue(player, 1000, undefined, 0);
    player thread namespace_44abc05161e2e2cb::showsplash("callout_exfil_success");
    while (!player isonground()) {
        waitframe();
    }
    player allowmovement(0);
    player playerlinkto(heli, "tag_passenger" + var_54100ca480291b0c, 1, 180, -180, 180, 180, 0);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20a9
// Size: 0x1f8
function playeranimlinktochopper(exfil, var_e4b9cd561c7c0de6) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    if (!isdefined(var_e4b9cd561c7c0de6)) {
        for (i = 0; i < exfil.passengers.size; i++) {
            if (exfil.passengers[i] == exfil.extractzone) {
                exfil.passengers[i] = self;
                var_e4b9cd561c7c0de6 = i;
            }
        }
        exfil thread disableotherseats(self);
    }
    thread infil_player_rig("slot_" + var_e4b9cd561c7c0de6, "viewhands_base_iw8");
    self.player_rig linkto(exfil, "origin_animate_jnt", (0, 0, 0), (0, 0, 0));
    switch (var_e4b9cd561c7c0de6) {
    case 0:
        self lerpviewangleclamp(1, 0.25, 0.25, 35, 180, 90, 45);
        break;
    case 1:
        self lerpviewangleclamp(1, 0.25, 0.25, 180, 35, 90, 45);
        break;
    case 2:
    case 4:
        self lerpviewangleclamp(1, 0.25, 0.25, 75, 135, 90, 45);
        break;
    case 3:
    case 5:
        self lerpviewangleclamp(1, 0.25, 0.25, 135, 45, 90, 45);
        break;
    default:
        self lerpviewangleclamp(1, 0.25, 0.25, 45, 45, 45, 45);
        break;
    }
    level endon("game_ended");
    self.extracted = 1;
    self.spawnprotection = 1;
    namespace_41cb45263e591751::setlightarmorvalue(self, 1000, undefined, 0);
    rideloop(exfil);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22a8
// Size: 0x53
function rideloop(exfil) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    exfil endon("unload");
    while (isdefined(exfil)) {
        exfil anim_player_solo(self, self.player_rig, "lbravo_exfil_loop", "origin_animate_jnt");
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2302
// Size: 0x87
function exfilleavesequence(var_37c1299e74aaa6e7, endgame) {
    if (isdefined(self.exitinteract)) {
        self.exitinteract makeunusable();
    }
    thread namespace_3a5b7dd73e67921c::littlebirdleave();
    playannouncerbattlechatter(self.team, "extract_littlebird_leaving_a_friendly", 10);
    thread doexfilsplashforpassengers();
    if (isdefined(level.onexfilfinishedcallback)) {
        self [[ level.onexfilfinishedcallback ]](var_37c1299e74aaa6e7);
    }
    if (isdefined(endgame)) {
        waitthenendgame(self.team);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2390
// Size: 0x25
function waitthenendgame(winningteam) {
    wait(5);
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"]["objective_completed"]);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23bc
// Size: 0x57
function doexfilsplashforpassengers() {
    wait(1);
    for (i = 0; i < self.passengers.size; i++) {
        if (self.passengers[i] != self.extractzone) {
            self.passengers[i] thread namespace_44abc05161e2e2cb::showsplash("callout_exfil_success");
        }
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x241a
// Size: 0xff
function init_useprompt_interactions(player) {
    self.interactiontriggers = [];
    pos1 = self gettagorigin("tag_passenger1");
    pos2 = self gettagorigin("tag_passenger2");
    pos3 = self gettagorigin("tag_passenger3");
    pos4 = self gettagorigin("tag_passenger4");
    var_5caa6f9f456ad6b0 = self gettagorigin("tag_passenger5");
    var_5caa729f456add49 = self gettagorigin("tag_passenger6");
    create_exfil_interaction(pos1, "MP/HOLD_TO_GET_ON_CHOPPER", 0, player);
    create_exfil_interaction(pos2, "MP/HOLD_TO_GET_ON_CHOPPER", 2, player);
    create_exfil_interaction(pos3, "MP/HOLD_TO_GET_ON_CHOPPER", 4, player);
    create_exfil_interaction(pos4, "MP/HOLD_TO_GET_ON_CHOPPER", 1, player);
    create_exfil_interaction(var_5caa6f9f456ad6b0, "MP/HOLD_TO_GET_ON_CHOPPER", 3, player);
    create_exfil_interaction(var_5caa729f456add49, "MP/HOLD_TO_GET_ON_CHOPPER", 5, player);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2520
// Size: 0xc0
function create_exfil_interaction(loc, hintstring, seatnum, player) {
    interaction = spawn("script_model", loc);
    interaction setmodel("tag_origin");
    interaction linkto(self);
    interaction sethintstring(hintstring);
    interaction setcursorhint("HINT_BUTTON");
    interaction sethintdisplayrange(200);
    interaction sethintdisplayfov(90);
    interaction setuserange(72);
    interaction setusefov(90);
    interaction sethintonobstruction("hide");
    interaction setuseholdduration("duration_short");
    interaction thread exfil_use_think(self, seatnum, player);
    self.interactiontriggers[self.interactiontriggers.size] = interaction;
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25e7
// Size: 0x62
function exfil_use_think(vehicle, seatnum, player) {
    if (isdefined(player)) {
        makechopperseatplayerusable(player);
    } else {
        makechopperseatteamusable(vehicle.team);
    }
    while (1) {
        player = self waittill("trigger");
        self makeunusable();
        vehicle exfilusetriggerused(player, seatnum, self);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2650
// Size: 0x1c
function makechopperseatteamusable(team) {
    self makeusable();
    thread _updatechopperseatteamusable(team);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2673
// Size: 0x1c
function makechopperseatplayerusable(player) {
    self makeusable();
    thread _updatechopperseatplayerusable(player);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2696
// Size: 0x9e
function _updatechopperseatteamusable(team) {
    self endon("death");
    for (;;) {
        foreach (player in level.players) {
            if (player.team == team) {
                self showtoplayer(player);
                self enableplayeruse(player);
            } else {
                self disableplayeruse(player);
                self hidefromplayer(player);
            }
        }
        level waittill("joined_team");
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x273b
// Size: 0x94
function _updatechopperseatplayerusable(var_fba0376e0036de8d) {
    self endon("death");
    for (;;) {
        foreach (player in level.players) {
            if (player == var_fba0376e0036de8d) {
                self showtoplayer(player);
                self enableplayeruse(player);
            } else {
                self disableplayeruse(player);
                self hidefromplayer(player);
            }
        }
        level waittill("joined_team");
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27d6
// Size: 0xc9
function playannouncerbattlechatter(team, var_cb3339ece72dbdeb, suffix) {
    level endon("game_ended");
    faction = "ustl";
    soundalias = "dx_mpa_" + faction + "_" + var_cb3339ece72dbdeb + "_" + suffix;
    if (soundexists(soundalias)) {
        foreach (player in level.players) {
            if (player.team == team) {
                player queuedialogforplayer(soundalias, var_cb3339ece72dbdeb, 2);
            }
        }
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28a6
// Size: 0x27
function votimeendingsoon() {
    level endon("game_ended");
    level waittill("match_ending_very_soon");
    playannouncerbattlechatter(game["attackers"], "extract_littlebird_leaving_soon_a_friendly", 10);
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28d4
// Size: 0x7c
function commander_play_sound_func(alias, notification, var_9a0afe8ff3d2508f) {
    foreach (player in self.infil.players) {
        self playsoundtoplayer(alias, player);
    }
}

// Namespace exfil/namespace_2458b63c4aff5232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2957
// Size: 0x3
function script_model_exfil_anims() {
    
}

