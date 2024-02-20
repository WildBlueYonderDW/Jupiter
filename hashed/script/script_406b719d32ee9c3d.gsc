// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\anim_scene.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\obj_zonecapture.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\gametypes\obj_bombzone.gsc;
#using scripts\mp\gametypes\koth.gsc;
#using script_7c32d91c895c063e;
#using scripts\mp\persistence.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\dev.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\flags.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_669760f0500e4358;
#using scripts\mp\spawnfactor.gsc;
#using script_406b719d32ee9c3d;
#using scripts\mp\anim.gsc;
#using scripts\mp\utility\sound.gsc;

#namespace robj;

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d7
// Size: 0x33a
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    function_8974f2acabebbc99();
    precachestring("JUP_MP/SECURE_INTERACT");
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 100);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    updategametypedvars();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_c80e5eaa70aba7d7);
    setdvarifuninitialized(@"hash_50de136606fc41da", 0);
    level.objectivebased = 1;
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerconnect = &onplayerconnect;
    level.onplayerkilled = &onplayerkilled;
    level.resetuiomnvargamemode = &namespace_fa795886dfc5f58a::resetuiomnvargamemode;
    level.getkothzonedeadzonedist = &namespace_f1b0a92156c7301c::getkothzonedeadzonedist;
    level.var_a4f0b18944c00689 = &function_75043e7e3c552318;
    level.var_da752fc97f989d07 = &function_72c78e10b4cdbdae;
    level.disablebuddyspawn = 1;
    level.gamemodemaydropweapon = &isplayeroutsideofanybombsite;
    level.ontimelimit = &ontimelimit;
    level.var_2550904ae7eb2a1c = dvarfloatvalue("securecapturebottimemod", 1.35, 1.35, 1.35);
    level.var_ee1c5b2643a1c2f9 = &namespace_cb9ef225b7a59984::function_2ea2aacc5d66ae03;
    game["dialog"]["gametype"] = "dx_mp_secu_game_tf141_name";
    game["dialog"]["robj_objective_intermission"] = "dx_mp_secu_game_tf141_sint";
    game["dialog"]["robj_enemy_took_objective"] = "dx_mp_secu_game_tf141_slos";
    game["dialog"]["robj_enemy_took_objective_helicopter"] = "dx_mp_secu_game_tf141_slsh";
    game["dialog"]["robj_enemy_took_objective_panels"] = "dx_mp_secu_game_tf141_slsp";
    game["dialog"]["robj_friendly_took_objective"] = "dx_mp_secu_game_tf141_swon";
    game["dialog"]["robj_friendly_took_objective_helicopter"] = "dx_mp_secu_game_tf141_swnh";
    game["dialog"]["robj_friendly_took_objective_panels"] = "dx_mp_secu_game_tf141_swnp";
    game["dialog"]["robj_objective_available"] = "dx_mp_secu_game_tf141_snew";
    game["dialog"]["robj_player_close_to_outdoor_objective"] = "dx_mp_secu_game_tf141_spra";
    game["dialog"]["robj_player_close_to_indoor_objective"] = "dx_mp_secu_game_tf141_sppc";
    game["dialog"]["robj_player_close_to_helicopter_objective"] = "dx_mp_secu_game_tf141_sphl";
    game["dialog"]["robj_player_close_to_panels_objective"] = "dx_mp_secu_game_tf141_sppn";
    game["dialog"]["boost"] = "dx_mp_secu_game_tf141_bost";
    game["dialog"]["offense_obj"] = "dx_mp_secu_game_tf141_bost";
    game["dialog"]["defense_obj"] = "dx_mp_secu_game_tf141_bost";
    /#
        level thread function_c6311773113bd9d9();
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1618
// Size: 0x67
function onplayerconnect(player) {
    if (isdefined(player.pers["captures"])) {
        player setextrascore0(player.pers["captures"]);
    } else {
        player namespace_2685ec368e022695::statsetchild("round", "captures", 0);
        player incpersstat("captures", 0);
        player setextrascore0(0);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1686
// Size: 0x232
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || is_equal(attacker.pers["team"], self.pers["team"])) {
        return;
    }
    if (isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename)) {
        return;
    }
    victim = self;
    var_9ff9376383f4bc58 = 0;
    attackerteam = attacker.pers["team"];
    var_229449cfd54fdc5b = attacker isonobjective();
    var_9d0123af024e86ac = victim isonobjective();
    ownerteam = level.var_6d2de76d16fe8af7[0].ownerteam;
    if (attackerteam != ownerteam) {
        if (level.bombtimer > 0 && var_229449cfd54fdc5b) {
            attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
        } else if (var_9d0123af024e86ac) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
        }
    } else if (var_229449cfd54fdc5b) {
        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
        attacker incpersstat("defends", 1);
        attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker setextrascore1(attacker.pers["defends"]);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18bf
// Size: 0x9a
function isonobjective() {
    foreach (objective in level.var_6d2de76d16fe8af7) {
        if (distance2d(self.origin, objective.curorigin) < 200 && abs(self.origin[2] - objective.curorigin[2]) < 100) {
            return 1;
        }
    }
    return 0;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1961
// Size: 0x45
function function_8974f2acabebbc99() {
    registersharedfunc("robj", "removeExistingCaptureBot", &removeExistingCaptureBot);
    registersharedfunc("robj", "setUpNewCaptureBot", &setUpNewCaptureBot);
    registersharedfunc("robj", "identifyObjTypForCaptureBot", &identifyObjTypForCaptureBot);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ad
// Size: 0xcc
function ontimelimit() {
    if (istrue(level.var_e659579aba69a420)) {
        return;
    }
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    if (is_equal(winner, "tie")) {
        foreach (player in level.players) {
            player thread namespace_44abc05161e2e2cb::showsplash("robj_overtime_start");
        }
        level.var_e659579aba69a420 = 1;
        winner = function_9e1ae8ace1cb41e2();
        thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["score_limit_reached"]);
        return;
    }
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a80
// Size: 0x17
function function_9e1ae8ace1cb41e2() {
    team = level waittill("update_team_score");
    return team;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9f
// Size: 0x2f
function function_c6311773113bd9d9() {
    /#
        level endon("robj_player_close_to_helicopter_objective");
        level thread function_36108d670d10409a();
        level thread function_428317dcdbacd650();
        while (1) {
            function_9846df05d91ac5da();
            waitframe();
        }
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad5
// Size: 0x2dc
function function_428317dcdbacd650() {
    /#
        while (1) {
            value = getdvarint(@"hash_9cb2fff505145d23", 0);
            if (value && isdefined(level.objectives) && isdefined(level.player)) {
                objective = function_d23c7c1add9fb181(level.player.origin);
                var_dd41202d89e84055 = [[ level.getkothzonedeadzonedist ]]();
                maxdist = [[ level.var_a4f0b18944c00689 ]]();
                var_5b8ff5975f2b0f9f = [[ level.var_da752fc97f989d07 ]]();
                cylinder(objective.trigger.originalpos, objective.trigger.originalpos + (0, 0, 1), var_dd41202d89e84055, (1, 0, 0), 0, 25);
                cylinder(objective.trigger.originalpos, objective.trigger.originalpos + (0, 0, 1), maxdist, (1, 0, 0), 0, 25);
                cylinder(objective.trigger.originalpos, objective.trigger.originalpos + (0, 0, 1), var_5b8ff5975f2b0f9f, (1, 0, 1), 0, 25);
                foreach (spawner in array_randomize(objective.spawnpoints)) {
                    line(objective.curorigin, spawner.origin, (0, 0, 1), 1, 0, 1);
                    namespace_e6eafa63d63ab54d::function_579ccd57103d27ec(spawner, spawner.classname, (1, 1, 1));
                }
                foreach (spawner in array_randomize(objective.fallbackspawnpoints)) {
                    line(objective.curorigin, spawner.origin, (1, 1, 1), 1, 0, 1);
                    namespace_e6eafa63d63ab54d::function_579ccd57103d27ec(spawner, spawner.classname, (1, 1, 1));
                }
            }
            waitframe();
        }
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1db8
// Size: 0x26e
function function_36108d670d10409a() {
    /#
        while (1) {
            value = getdvarint(@"hash_45d4ff515c25258b", 0);
            if (value && isdefined(level.objectives)) {
                level.var_c9f9d8abf3ccd83f = [];
                foreach (objective in level.objectives) {
                    if (!isdefined(level.var_c9f9d8abf3ccd83f[objective.trigger.script_noteworthy])) {
                        level.var_c9f9d8abf3ccd83f[objective.trigger.script_noteworthy] = [];
                    }
                    level.var_c9f9d8abf3ccd83f[objective.trigger.script_noteworthy] = array_add(level.var_c9f9d8abf3ccd83f[objective.trigger.script_noteworthy], objective);
                }
                foreach (array in level.var_c9f9d8abf3ccd83f) {
                    color = (1, 1, 1);
                    if (array.size > 1) {
                        color = (1, 0, 0);
                        for (i = 0; i < array.size; i++) {
                            if (isdefined(array[i + 1])) {
                                line(array[i].curorigin, array[i + 1].curorigin, (1, 0, 0), 1, 0, 1);
                            }
                        }
                    }
                    foreach (objective in array) {
                        print3d(objective.curorigin + (0, 0, 64), objective.trigger.script_noteworthy, color, 1, 1, 1, 1);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x202d
// Size: 0x102
function function_9846df05d91ac5da() {
    /#
        value = getdvarint(@"hash_e0fb8d4f2cc4a40c", 0);
        if (value && isdefined(level.objectives)) {
            setdvar(@"hash_e0fb8d4f2cc4a40c", 0);
            setdvar(@"hash_6ce01b6572751b18", 1);
            if (level.players.size <= 1) {
                setdvar(@"hash_2d5236cbe9894aff", 1);
                player = level waittill("defends");
                player waittill("update_team_score");
                wait(1);
                player setorigin(level.players[0].origin + 64 * vectornormalize(vectortoangles(level.players[0].angles)));
                wait(1);
            } else {
                player = level.players[1];
            }
            level.var_6d2de76d16fe8af7[0].trigger notify("jup_military_secure_mode_station_01", player);
        }
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2136
// Size: 0x18
function function_c80e5eaa70aba7d7() {
    player = self;
    player thread function_169f34c107ca9253();
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2155
// Size: 0xf7
function function_169f34c107ca9253() {
    player = self;
    player endon("disconnect");
    namespace_cb9ef225b7a59984::function_2e61a0f1c846a9c2(player);
    namespace_cb9ef225b7a59984::function_353ca278babb871e(player);
    if (istrue(player.var_169f34c107ca9253)) {
        return;
    }
    player.var_169f34c107ca9253 = 1;
    while (!isdefined(level.var_80bce1fe9a035033)) {
        waitframe();
    }
    level.var_80bce1fe9a035033 function_cfd53c8f6878014f(player);
    level.var_80bce1fe9a035033 thread questCircle_run_VO_hint_when_close(player);
    namespace_cb9ef225b7a59984::function_e99ea42a85a85757(player);
    level.var_80bce1fe9a035033 thread namespace_cb9ef225b7a59984::function_ff075be505a94c97(player);
    namespace_cb9ef225b7a59984::function_2d908d3021b52c73(player);
    while (1) {
        level waittill("new_robj_location");
        level.var_80bce1fe9a035033 function_cfd53c8f6878014f(player);
        level.var_80bce1fe9a035033 thread questCircle_run_VO_hint_when_close(player);
        namespace_cb9ef225b7a59984::function_e99ea42a85a85757(player);
        level.var_80bce1fe9a035033 thread namespace_cb9ef225b7a59984::function_ff075be505a94c97(player);
        namespace_cb9ef225b7a59984::function_6b56d2c2eae0b9af(player);
        namespace_cb9ef225b7a59984::function_2d908d3021b52c73(player);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2253
// Size: 0xc4
function questCircle_run_VO_hint_when_close(player) {
    player notify("questCircle_run_VO_hint_when_close");
    player endon("questCircle_run_VO_hint_when_close");
    player endon("disconnect");
    if (!function_31d8fdff7106eaba(player)) {
        wait(3);
        while (!function_31d8fdff7106eaba(player)) {
            waitframe();
        }
    }
    foreach (objective in level.var_6d2de76d16fe8af7) {
        var_cbc3daa4e3ca9437 = function_1faae1bb72f526fb(objective.scriptable, "near");
        if (var_cbc3daa4e3ca9437 != "") {
            namespace_944ddf7b8df1b0e3::leaderdialogonplayers(var_cbc3daa4e3ca9437, [0:player]);
            return;
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x231e
// Size: 0x157
function function_1faae1bb72f526fb(scriptable, event) {
    var_91839babd32261f4 = scriptable function_bea6c5f32629f766();
    returnstr = "";
    switch (var_91839babd32261f4) {
    case #"hash_7461b582f15d5954":
        if (event == "near") {
            returnstr = "robj_player_close_to_indoor_objective";
        }
        if (event == "taken") {
            returnstr = "robj_friendly_took_objective";
        }
        if (event == "lost") {
            returnstr = "robj_enemy_took_objective";
        }
        break;
    case #"hash_7942b6b104bfd8d4":
        if (event == "near") {
            returnstr = "robj_player_close_to_panels_objective";
        }
        if (event == "taken") {
            returnstr = "robj_friendly_took_objective_panels";
        }
        if (event == "lost") {
            returnstr = "robj_enemy_took_objective_panels";
        }
        break;
    case #"hash_23316c7b6e9eee0a":
        if (event == "near") {
            returnstr = "robj_player_close_to_helicopter_objective";
        }
        if (event == "taken") {
            returnstr = "robj_friendly_took_objective_helicopter";
        }
        if (event == "lost") {
            returnstr = "robj_enemy_took_objective_helicopter";
        }
        break;
    case #"hash_a75e34b940af0387":
        if (event == "near") {
            returnstr = "robj_player_close_to_outdoor_objective";
        }
        if (event == "taken") {
            returnstr = "robj_friendly_took_objective";
        }
        if (event == "lost") {
            returnstr = "robj_enemy_took_objective";
        }
        break;
    default:
        break;
    }
    return returnstr;
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x247d
// Size: 0xaa
function function_31d8fdff7106eaba(player) {
    points = [];
    if (!isdefined(level.var_6d2de76d16fe8af7)) {
        return 0;
    }
    foreach (objective in level.var_6d2de76d16fe8af7) {
        points[points.size] = objective.curorigin;
    }
    origin = averagepoint(points);
    return distance2d(origin, player.origin) < 700;
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x252f
// Size: 0x27
function function_149c978226839fe2(objective) {
    return objective.scriptable.model != "jup_military_secure_mode_station_01";
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x255e
// Size: 0x8ac
function function_52edd4d6e6b699f2() {
    while (!isdefined(level.objectives)) {
        waitframe();
    }
    if (isdefined(level.var_6d2de76d16fe8af7)) {
        foreach (objective in level.var_6d2de76d16fe8af7) {
            foreach (var_dd73eb1591960567 in objective.dangerzoneids) {
                namespace_b2d5aa2baf2b5701::removespawndangerzone(var_dd73eb1591960567);
            }
        }
    }
    level.var_80bce1fe9a035033 = spawnstruct();
    if (!isdefined(level.var_aeb0a59b9d94183c)) {
        level.var_aeb0a59b9d94183c = [];
    }
    if (level.objectives.size == level.var_aeb0a59b9d94183c.size) {
        return;
    }
    if (isdefined(level.var_6d2de76d16fe8af7)) {
        foreach (objective in level.var_6d2de76d16fe8af7) {
            function_a9a2bef3ba198a85(objective.scriptable);
        }
    }
    objective = undefined;
    var_7798c1c33650a506 = function_8ab4263516ea015f(level.var_6d2de76d16fe8af7, !istrue(level.var_4ece7d1697e1214));
    if (var_7798c1c33650a506.size == 0) {
        objective = random(array_remove_array(level.objectives, level.var_aeb0a59b9d94183c));
    } else {
        objective = random(array_remove_array(var_7798c1c33650a506, level.var_aeb0a59b9d94183c));
    }
    if (!isdefined(objective)) {
        objective = random(level.objectives);
    }
    if (objective.scriptable.model == "uk_electrical_box_medium_01_animated") {
        var_6a9cceb782afc949 = 1;
    } else {
        var_6a9cceb782afc949 = 0;
    }
    /#
        if (getdvarint(@"hash_8707cc16234391", 0) && isdefined(level.player)) {
            objective = function_d23c7c1add9fb181(level.player.origin);
        }
    #/
    level.var_4ece7d1697e1214 = 1;
    level.var_aeb0a59b9d94183c = array_add(level.var_aeb0a59b9d94183c, objective);
    if (level.var_aeb0a59b9d94183c.size > 3) {
        level.var_aeb0a59b9d94183c = [0:level.var_aeb0a59b9d94183c[1], 1:level.var_aeb0a59b9d94183c[2], 2:level.var_aeb0a59b9d94183c[3]];
    }
    /#
        if (getdvar(@"hash_ab8c774ce0027d59", "new_location") != "new_location") {
            level.var_aeb0a59b9d94183c = [0:objective];
        }
    #/
    level.bombtimer = dvarintvalue("bombtimer", 10, 1, 300);
    namespace_cb9ef225b7a59984::function_e92d8183093a8f29();
    if (level.var_aeb0a59b9d94183c.size > 1) {
        foreach (entry in level.teamnamelist) {
            delaythread(3, &namespace_944ddf7b8df1b0e3::leaderdialog, "robj_objective_intermission", entry);
        }
        wait(level.var_db19c0508f775166);
    }
    var_8c6440d19f0c58e9 = pow(-1, randomint(2)) * 512 * randomintrange(15, 35) / 100;
    var_8c643fd19f0c56b6 = pow(-1, randomint(2)) * 512 * randomintrange(15, 35) / 100;
    origin = (objective.curorigin[0] + var_8c6440d19f0c58e9, objective.curorigin[1] + var_8c643fd19f0c56b6, objective.curorigin[2]);
    level thread function_2d1f2d138f937e6a("Assassination_Br", origin, 512);
    level.var_6d2de76d16fe8af7 = [0:objective];
    if (var_6a9cceb782afc949) {
        var_194df6fbc6d29923 = function_d23c7c1add9fb181(level.var_6d2de76d16fe8af7[0].curorigin, level.var_6d2de76d16fe8af7);
        level.var_6d2de76d16fe8af7[1] = var_194df6fbc6d29923;
    }
    if (!isdefined(level.var_2725983b6b1f32a1)) {
        namespace_cb9ef225b7a59984::function_c0ee40f76dcd495c(origin, "obscured");
        namespace_cb9ef225b7a59984::function_c0ee40f76dcd495c(origin, "on_point");
    } else {
        namespace_cb9ef225b7a59984::function_ef9c5d31f2fbc04f(origin);
    }
    if (var_6a9cceb782afc949 && !isdefined(level.var_2725983b6b1f32a1["on_point_2"])) {
        namespace_cb9ef225b7a59984::function_c0ee40f76dcd495c(origin, "on_point_2");
    }
    namespace_cb9ef225b7a59984::function_8223aee4da506330(level.players);
    foreach (entry in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::leaderdialog("robj_objective_available", entry);
    }
    namespace_cb9ef225b7a59984::function_6a2c1dff398cfc38("on_point");
    if (var_6a9cceb782afc949) {
        namespace_cb9ef225b7a59984::function_6a2c1dff398cfc38("on_point_2", level.var_6d2de76d16fe8af7[1]);
    }
    level notify("new_robj_location");
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        objective function_9897b5b4ecf74ef3("new_location");
    }
    namespace_cb9ef225b7a59984::function_e59213769db9f8b5("obscured");
    namespace_cb9ef225b7a59984::function_e59213769db9f8b5("on_point");
    namespace_cb9ef225b7a59984::function_9a750347647b35c4("obscured", 0);
    namespace_cb9ef225b7a59984::function_9a750347647b35c4("on_point", 0);
    namespace_cb9ef225b7a59984::function_4b90183cabcea8c3("obscured", 1, 0);
    namespace_cb9ef225b7a59984::function_4b90183cabcea8c3("on_point", 0, 0);
    if (var_6a9cceb782afc949) {
        namespace_cb9ef225b7a59984::function_e59213769db9f8b5("on_point_2");
        namespace_cb9ef225b7a59984::function_9a750347647b35c4("on_point_2", 0);
        namespace_cb9ef225b7a59984::function_4b90183cabcea8c3("on_point_2", 0, 0);
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_cb9ef225b7a59984::function_defe4cadf275a0bf("obscured", level.var_b88463627a96b8b0);
    namespace_cb9ef225b7a59984::function_defe4cadf275a0bf("on_point", level.var_b88463627a96b8b0);
    if (var_6a9cceb782afc949) {
        namespace_cb9ef225b7a59984::function_defe4cadf275a0bf("on_point_2", level.var_b88463627a96b8b0);
    }
    wait(level.var_b88463627a96b8b0);
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        objective function_9897b5b4ecf74ef3("objective_opened");
    }
    namespace_cb9ef225b7a59984::function_ecfc813d02e731c5("obscured");
    namespace_cb9ef225b7a59984::function_ecfc813d02e731c5("on_point");
    namespace_cb9ef225b7a59984::function_9a750347647b35c4("obscured", 1);
    namespace_cb9ef225b7a59984::function_9a750347647b35c4("on_point", 1);
    namespace_cb9ef225b7a59984::function_defe4cadf275a0bf("obscured", 0);
    namespace_cb9ef225b7a59984::function_defe4cadf275a0bf("on_point", 0);
    if (var_6a9cceb782afc949) {
        namespace_cb9ef225b7a59984::function_ecfc813d02e731c5("on_point_2");
        namespace_cb9ef225b7a59984::function_9a750347647b35c4("on_point_2", 1);
        namespace_cb9ef225b7a59984::function_defe4cadf275a0bf("on_point_2", 0);
    }
    foreach (objective in level.var_6d2de76d16fe8af7) {
        objective namespace_19b4203b51d56488::setownerteam("neutral");
    }
    foreach (objective in level.var_6d2de76d16fe8af7) {
        dangerzoneids = [];
        dangerzoneids[dangerzoneids.size] = namespace_b2d5aa2baf2b5701::addspawndangerzone(objective.curorigin, [[ level.getkothzonedeadzonedist ]](), 4096, "allies", undefined, undefined, undefined, undefined, undefined, 1);
        dangerzoneids[dangerzoneids.size] = namespace_b2d5aa2baf2b5701::addspawndangerzone(objective.curorigin, [[ level.getkothzonedeadzonedist ]](), 4096, "axis", undefined, undefined, undefined, undefined, undefined, 1);
        objective.dangerzoneids = dangerzoneids;
    }
    foreach (objective in level.var_6d2de76d16fe8af7) {
        function_b32fcab47ab8b6fa("idle", objective.trigger.script_noteworthy);
        objective function_9897b5b4ecf74ef3("neutral_tick");
        objective namespace_19b4203b51d56488::allowuse("any");
        function_59e0c0a902e8778c(objective.scriptable);
        objective thread run_player_interact_logic();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e11
// Size: 0x23d
function robj_do_helicopter_sequence(bombzone, scriptable) {
    level notify("robj_do_helicopter_sequence");
    level endon("robj_do_helicopter_sequence");
    struct = bombzone.var_cea6fac6a8f24927;
    startstruct = getstruct(struct.target, "targetname");
    var_1bf23593924fcf1c = getstruct(startstruct.target, "targetname");
    var_d0697af2eca83d63 = getstruct(var_1bf23593924fcf1c.target, "targetname");
    bombzone thread function_6268e5fd6df4c426(struct);
    bombzone waittill("hack_progress_complete");
    vehicle = spawnvehicle("veh9_mil_air_heli_blima_mp", "robj_heli", "veh9_mil_air_heli_blima_physics_mp", startstruct.origin, (0, 0, 0));
    vehicle function_247ad6a91f6a4ffe(1);
    vehicle vehicleshowonminimap(0);
    vehicle.var_918c5a31037e00ee = spawnstruct();
    vehicle.var_918c5a31037e00ee.speed = 85;
    var_a973a6e2149533c5 = var_1bf23593924fcf1c.target;
    var_1bf23593924fcf1c.target = undefined;
    crates = getentarray("robj_pickup_crate", "targetname");
    crate = getclosest(var_1bf23593924fcf1c.origin, crates);
    vehicle namespace_3bb9da687f15383d::vehicle_paths_helicopter(var_1bf23593924fcf1c);
    crate moveto(vehicle.origin + (0, 0, -256), 5, 0, 0.1);
    crate vibrate((0, -100, 0), 3.1, 1.6, 20);
    wait(5);
    scriptable setscriptablepartstate("smoke", "off");
    crate thread function_dc638765dd1b243d(vehicle);
    var_a3f9af1b0fc76526 = var_d0697af2eca83d63.target;
    var_d0697af2eca83d63.target = undefined;
    vehicle namespace_3bb9da687f15383d::vehicle_paths_helicopter(var_d0697af2eca83d63);
    var_1bf23593924fcf1c.target = var_a973a6e2149533c5;
    var_d0697af2eca83d63.target = var_a3f9af1b0fc76526;
    vehicle delete();
    crate delete();
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3055
// Size: 0x59
function function_dc638765dd1b243d(vehicle) {
    vehicle endon("death");
    vehicle endon("entitydeleted");
    crate = self;
    while (1) {
        crate moveto(vehicle.origin + (0, 0, -256), 0.7);
        wait(0.3);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30b5
// Size: 0x68
function function_74d188f8cd1044f8() {
    foreach (var_effb0fefd48c308e in getentitylessscriptablearray("scriptable_secure_lighting_helicopter_light_on_01", "classname")) {
        var_effb0fefd48c308e setscriptablepartstate("light_part", "off", 0);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3124
// Size: 0x12b
function function_6268e5fd6df4c426(struct) {
    self endon("hack_progress_complete");
    structs = getstructarray("heli_flare_circle_start", "targetname");
    if (structs.size == 0) {
        return;
    }
    heli_flare_circle_start = getclosest(struct.origin, structs);
    var_ecc05c023267c301 = getentitylessscriptablearray(heli_flare_circle_start.target, "targetname")[0];
    var_ecc05c023267c301 setscriptablepartstate("light_part", "on", 0);
    scriptable = var_ecc05c023267c301;
    var_96ddc4ea6dc265d4 = getentitylessscriptablearray("scriptable_secure_lighting_helicopter_light_on_01", "classname");
    var_96ddc4ea6dc265d4 = array_remove(var_96ddc4ea6dc265d4, scriptable);
    waittime = (level.bombtimer - 5) / var_96ddc4ea6dc265d4.size / 2;
    while (1) {
        scriptable setscriptablepartstate("light_part", "on", 0);
        thread function_12f94ddad72e1143(scriptable);
        wait(waittime);
        var_96ddc4ea6dc265d4 = array_remove(var_96ddc4ea6dc265d4, scriptable);
        scriptable = getclosest(scriptable.origin, var_96ddc4ea6dc265d4, 64);
        if (!isdefined(scriptable)) {
            break;
        }
        if (var_96ddc4ea6dc265d4.size == 0) {
            break;
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3256
// Size: 0x26
function function_12f94ddad72e1143(scriptable) {
    self waittill("hack_progress_complete");
    scriptable setscriptablepartstate("light_part", "off", 0);
}

// Namespace robj/namespace_8312845506590779
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3283
// Size: 0x9c
function private function_2a9783de5ed53f56(pos, var_c013cfd919a1a62d, speed, var_b092096c70bcc8e4) {
    struct = spawnstruct();
    struct.speed = speed;
    struct.origin = pos;
    struct.angles = ter_op(isdefined(var_b092096c70bcc8e4), var_b092096c70bcc8e4, var_c013cfd919a1a62d.angles);
    struct.radius = 500;
    struct.target = var_c013cfd919a1a62d;
    struct.script_anglevehicle = "1";
    return struct;
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3327
// Size: 0x14c
function function_d23c7c1add9fb181(origin, exclude) {
    array = [];
    var_5f4cfeef3b684def = level.objectives;
    script_noteworthy = exclude[0].trigger.script_noteworthy;
    if (isdefined(exclude)) {
        var_5f4cfeef3b684def = array_remove_array(level.objectives, exclude);
    }
    foreach (element in var_5f4cfeef3b684def) {
        array[array.size] = element;
    }
    level.var_e628a8912ad74c62 = origin;
    objectives = array_sort_with_func(array, &function_ce8bbfe1d4422f48);
    foreach (obj in objectives) {
        if (!is_equal(obj.trigger.script_noteworthy, script_noteworthy)) {
            continue;
        }
        return obj;
    }
    return objectives[0];
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x347b
// Size: 0x47
function function_ce8bbfe1d4422f48(var_5633f53fdfce6e15, var_5633f23fdfce677c) {
    return distance(var_5633f53fdfce6e15.curorigin, level.var_e628a8912ad74c62) < distance(var_5633f23fdfce677c.curorigin, level.var_e628a8912ad74c62);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34ca
// Size: 0xf7
function run_player_interact_logic() {
    self notify("run_player_interact_logic");
    self endon("run_player_interact_logic");
    trigger = self.trigger;
    while (1) {
        player = trigger waittill("trigger");
        if (getdvarint(@"hash_50de136606fc41da", 0) && isdefined(self.var_56bb845d40871824)) {
            var_618e461abd5994f4 = 0;
            foreach (team in self.var_56bb845d40871824) {
                if (team != player.team) {
                    var_618e461abd5994f4 = 1;
                }
            }
            if (var_618e461abd5994f4 == 1) {
                player iprintlnbold("MP/BOMBSITE_IN_USE_CAPTURE_BOT");
            } else {
                onbeginuse(player);
            }
        } else {
            onbeginuse(player);
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35c8
// Size: 0x1fc
function function_8ab4263516ea015f(currentobjective, var_b2be2b0ad85ea48) {
    array = [];
    /#
        if (getdvar(@"hash_ab8c774ce0027d59", "new_location") != "new_location") {
            var_e743bfba8ef70f0f = getdvar(@"hash_ab8c774ce0027d59", "new_location");
            if (var_e743bfba8ef70f0f == "objective_opened") {
                model = "any";
            }
            if (var_e743bfba8ef70f0f == "jup_uav_tower_enter") {
                model = "robj_interactzone";
            }
            if (var_e743bfba8ef70f0f == "start_defenders") {
                model = "game_end";
            }
            if (var_e743bfba8ef70f0f == "players") {
                model = "script_model";
            }
            foreach (struct in array_randomize(level.objectives)) {
                if (isdefined(struct.scriptable) && !is_equal(struct.scriptable.model, model)) {
                    continue;
                }
                array[array.size] = struct;
            }
            return array;
        }
    #/
    foreach (struct in array_randomize(level.objectives)) {
        if (istrue(var_b2be2b0ad85ea48) && !function_af110ad9ae3128a1(struct)) {
            continue;
        }
        if (isdefined(currentobjective) && distance2d(currentobjective.curorigin, struct.curorigin) < 1000) {
            continue;
        }
        if (isdefined(currentobjective) && distance2d(currentobjective.curorigin, struct.curorigin) > 3500) {
            continue;
        }
        array[array.size] = struct;
    }
    return array;
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37cc
// Size: 0x2c
function function_af110ad9ae3128a1(struct) {
    return is_equal(struct.trigger.script_label, "robj_start");
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3800
// Size: 0x9d
function function_2d1f2d138f937e6a(type, origin, size) {
    if (level.var_1831c32d8bdf53df > 0) {
        level.var_80bce1fe9a035033 function_6b6b6273f8180522("SecureZone_Mp", origin, size * 3);
        wait(level.var_1831c32d8bdf53df / 2);
        level.var_80bce1fe9a035033 function_4584ad1c0e2c58ec(size * 2);
        wait(level.var_1831c32d8bdf53df / 2);
        level.var_80bce1fe9a035033 function_4584ad1c0e2c58ec(size);
    } else {
        level.var_80bce1fe9a035033 function_6b6b6273f8180522("SecureZone_Mp", origin, size);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38a4
// Size: 0xa
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38b5
// Size: 0x55
function onstartgametype() {
    level.usestartspawns = 1;
    setclientnamemode("auto_change");
    thread waittoprocess();
    setupobjectiveicons();
    function_6cde78d1a896287b();
    initspawns();
    level thread function_52edd4d6e6b699f2();
    namespace_872204d77e9872c0::init();
    script_model_anims();
    thread function_74d188f8cd1044f8();
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3911
// Size: 0x1fe
function script_model_anims() {
    level.scr_animtree["uav_tower"] = %script_model;
    level.scr_anim["uav_tower"]["use_uav_tower_enter"] = script_model%jup_uav_tower_enter;
    level.scr_eventanim["uav_tower"]["use_uav_tower_enter"] = %"hash_34961e320f3e0d3d";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_enter"] = "jup_uav_tower_enter";
    level.scr_anim["uav_tower"]["use_uav_tower_idle"] = script_model%jup_uav_tower_idle;
    level.scr_eventanim["uav_tower"]["use_uav_tower_idle"] = %"hash_57ddb7b9c7e45783";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_idle"] = "jup_uav_tower_idle";
    level.scr_anim["uav_tower"]["use_uav_tower_exit"] = script_model%jup_uav_tower_exit;
    level.scr_eventanim["uav_tower"]["use_uav_tower_exit"] = %"hash_ad7c0546f87e015";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_exit"] = "jup_uav_tower_exit";
    level.scr_animtree["player_rig"] = %script_model;
    level.scr_anim["player_rig"]["interact"] = script_model%wm_eq_fusebox_plr;
    level.scr_eventanim["player_rig"]["interact"] = %"wm_eq_fusebox_plr";
    level.scr_anim["player_rig"]["interact_on"] = script_model%wm_eq_fusebox_turn_on_plr;
    level.scr_eventanim["player_rig"]["interact_on"] = %"wm_eq_fusebox_turn_on_plr";
    level.scr_animtree["fusebox_prop"] = %script_model;
    level.scr_anim["fusebox_prop"]["interact"] = script_model%wm_eq_fusebox_prop;
    level.scr_anim["fusebox_prop"]["interact_on"] = script_model%wm_eq_fusebox_turn_on_prop;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b16
// Size: 0xad
function function_6cde78d1a896287b() {
    triggers = getentarray("robj_interactzone", "targetname");
    level.objectives = [];
    foreach (trigger in triggers) {
        bombzone = setupobjective(trigger);
        if (isdefined(bombzone)) {
            level.objectives[bombzone.objectivekey] = bombzone;
        }
    }
    function_b32fcab47ab8b6fa("off");
    function_74d188f8cd1044f8();
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bca
// Size: 0x4d
function function_a9a2bef3ba198a85(scriptable) {
    scriptable setscriptablepartstate("dmz_uav_tower_laptop", "laptop_closed");
    scriptable setscriptablepartstate("dmz_uav_tower_antenna", "inactive");
    if (scriptable getscriptablehaspart("robj_screen_state")) {
        scriptable setscriptablepartstate("robj_screen_state", "off");
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1e
// Size: 0x5e
function function_59e0c0a902e8778c(scriptable) {
    scriptable setscriptablepartstate("dmz_uav_tower_laptop", "laptop_opened");
    scriptable setscriptablepartstate("dmz_uav_tower_antenna", "active");
    scriptable setscriptablepartstate("dmz_uav_tower_antenna", "active");
    if (scriptable getscriptablehaspart("robj_screen_state")) {
        scriptable setscriptablepartstate("robj_screen_state", "on");
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c83
// Size: 0xc2
function function_b32fcab47ab8b6fa(state, script_noteworthy) {
    var_def296f20c665c2a = getentitylessscriptablearray("robj_light", "targetname");
    foreach (scriptable in var_def296f20c665c2a) {
        scriptable notify("update_objective_lights");
        if (isdefined(script_noteworthy) && !is_equal(scriptable.script_noteworthy, script_noteworthy)) {
            continue;
        }
        if (is_equal(state, "idle")) {
            scriptable thread function_33c8d0807c72cb68(state);
        } else {
            scriptable setscriptablepartstate("chevron_0", state);
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4c
// Size: 0x51
function function_33c8d0807c72cb68(state) {
    scriptable = self;
    scriptable endon("update_objective_lights");
    while (1) {
        scriptable setscriptablepartstate("chevron_0", state);
        wait(0.5);
        scriptable setscriptablepartstate("chevron_0", "off");
        wait(0.5);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3da4
// Size: 0x335
function setupobjective(trigger, var_8b9949739f4e0f6, var_5ddbc1faed2c56e6) {
    if (isdefined(trigger.originalpos)) {
        trigger.origin = trigger.originalpos;
    } else {
        trigger.originalpos = trigger.origin;
    }
    visuals = getentarray(trigger.target, "targetname");
    prefix = "secure_loc";
    objectivekey = getsubstr(trigger.script_noteworthy, prefix.size, trigger.script_noteworthy.size);
    if (isdefined(level.objectives) && isdefined(level.objectives[objectivekey])) {
        objectivekey = objectivekey + "_2";
    }
    bombzone = spawnstruct();
    bombzone.trigger = trigger;
    bombzone.objectivekey = objectivekey;
    bombzone.curorigin = bombzone.trigger.origin;
    bombzone.offset3d = (0, 0, 0);
    bombzone.trigger setuseprioritymax();
    bombzone.trigger setuseholdduration("duration_none");
    bombzone.triggertype = "use";
    bombzone namespace_19b4203b51d56488::allowuse("none");
    bombzone namespace_19b4203b51d56488::requestid(0, 0, undefined, 0);
    bombzone namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_ot_a");
    bombzone namespace_19b4203b51d56488::setownerteam("neutral");
    bombzone.claimteam = "none";
    bombzone.claimplayer = undefined;
    bombzone.lastclaimteam = "none";
    bombzone.lastclaimtime = 0;
    model = getent(bombzone.trigger.target, "targetname");
    trigger = getent(model.target, "targetname");
    bombzone.var_cea6fac6a8f24927 = getstruct(trigger.target, "targetname");
    var_91839babd32261f4 = model function_bea6c5f32629f766();
    scriptable = spawnscriptable(var_91839babd32261f4, model.origin, model.angles);
    function_a9a2bef3ba198a85(scriptable);
    scriptable setscriptablepartstate("dmz_uav_tower", "unusable");
    model delete();
    bombzone.scriptable = scriptable;
    bombzone.noweapondropallowedtrigger = spawn("trigger_radius", bombzone.curorigin, 0, 140, 100);
    bombzone.var_2b4b28f7ae75b76a = spawn("script_origin", bombzone.scriptable function_c3393659916e4f86());
    if (var_91839babd32261f4 == "mp_secure_electrical_panel_objective_01") {
        bombzone.trigger sethintstring("JUP_MP/SECURE_USE");
    } else {
        bombzone.trigger sethintstring("JUP_MP/SECURE_INTERACT");
    }
    return bombzone;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40e1
// Size: 0x6b
function function_bea6c5f32629f766() {
    switch (self.model) {
    case #"hash_7594c201ef96b3d7":
        return "mp_secure_indoor_objective_01";
    case #"hash_9bb12794207226a":
        return "mp_secure_electrical_panel_objective_01";
    case #"hash_826f132aead12d08":
        return "mp_secure_helicopter_objective_01";
    case #"hash_ee20fbc82e64328f":
        return "mp_secure_outdoor_objective_01";
    default:
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4153
// Size: 0x3b
function getreservedobjid(objectivekey) {
    if (objectivekey == "_a") {
        var_aa530b7c5aefa0b4 = 0;
    } else if (objectivekey == "_b") {
        var_aa530b7c5aefa0b4 = 1;
    } else {
        var_aa530b7c5aefa0b4 = 2;
    }
    return var_aa530b7c5aefa0b4;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4196
// Size: 0x5eb
function initspawns() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_robj_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_robj_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_robj_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_robj_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_robj_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_robj_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_robj_spawn", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_robj_spawn", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_robj_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_robj_spawn_secondary", 1, 1);
    if (!isdefined(level.spawnpoints) || istrue(level.adjustshipmentspawns)) {
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        var_3c9c79460e7aee38 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3d83bc62b320d11a = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", var_3c9c79460e7aee38);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3d83bc62b320d11a);
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    if (istrue(level.adjustshipmentspawns)) {
        return;
    }
    foreach (zone in level.objectives) {
        zone.furthestspawndistsq = 0;
        zone.spawnpoints = [];
        zone.fallbackspawnpoints = [];
    }
    foreach (spawnpoint in level.spawnpoints) {
        var_47d8f0fd833ca536 = spawnpoint.classname == "mp_robj_spawn_allies_start" || spawnpoint.classname == "mp_robj_spawn_axis_start";
        var_ba992cb19cb03b0c = 0;
        var_e07d09f62cc34ac2 = spawnpoint.classname == "mp_robj_spawn";
        var_f87fc0e5455ed600 = spawnpoint.classname == "mp_robj_spawn_secondary";
        var_aa5c00f4cc732317 = [];
        var_7ba87fdf5e9815e0 = [];
        if (var_f87fc0e5455ed600 || var_e07d09f62cc34ac2) {
            if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "") {
                var_aa5c00f4cc732317 = strtok(spawnpoint.script_noteworthy, " ");
                foreach (zoneindex in var_aa5c00f4cc732317) {
                    zone = level.objectives["_" + zoneindex];
                    if (isdefined(zone)) {
                        var_7ba87fdf5e9815e0[var_7ba87fdf5e9815e0.size] = zone;
                        var_ba992cb19cb03b0c = 1;
                        if (var_f87fc0e5455ed600) {
                            zone.fallbackspawnpoints[zone.fallbackspawnpoints.size] = spawnpoint;
                        } else {
                            zone.spawnpoints[zone.spawnpoints.size] = spawnpoint;
                        }
                    }
                }
            } else {
                var_7ba87fdf5e9815e0 = level.objectives;
            }
        }
        namespace_10eb9162061dea8d::function_492958e372181db0(spawnpoint, var_7ba87fdf5e9815e0);
        if (!var_ba992cb19cb03b0c) {
            foreach (zone in level.objectives) {
                if (var_e07d09f62cc34ac2 && function_8e6da67bd91a7b85(zone, spawnpoint)) {
                    zone.spawnpoints[zone.spawnpoints.size] = spawnpoint;
                } else if (function_8e6da67bd91a7b85(zone, spawnpoint, 2500)) {
                    zone.fallbackspawnpoints[zone.fallbackspawnpoints.size] = spawnpoint;
                }
            }
        }
    }
    foreach (objid, zone in level.objectives) {
        zone.spawnset = "robj" + objid;
        namespace_b2d5aa2baf2b5701::registerspawnset(zone.spawnset, zone.spawnpoints);
        zone.fallbackspawnset = "robj_fallback" + objid;
        namespace_b2d5aa2baf2b5701::registerspawnset(zone.fallbackspawnset, zone.fallbackspawnpoints);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4788
// Size: 0x8e
function function_8e6da67bd91a7b85(zone, spawnpoint, var_326563b0ca02f95e) {
    var_d43d6364668556c7 = 2000;
    if (isdefined(var_326563b0ca02f95e)) {
        var_d43d6364668556c7 = var_326563b0ca02f95e;
    }
    if (distance(zone.curorigin, spawnpoint.origin) > var_d43d6364668556c7) {
        return 0;
    }
    mindist = [[ level.getkothzonedeadzonedist ]]();
    if (distance(zone.curorigin, spawnpoint.origin) < mindist) {
        return 0;
    }
    return 1;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x481e
// Size: 0x197
function getspawnpoint() {
    spawnteam = self.pers["team"];
    zone = random(level.var_6d2de76d16fe8af7);
    var_2fa17baefe0fa286 = namespace_f1b0a92156c7301c::getkothzonedeadzonedist();
    var_ba0a9fd614a3f6ee = namespace_b41002c7afebd276::function_75c03ed937b75b22(zone.trigger getentitynumber(), zone.furthestspawndistsq, var_2fa17baefe0fa286 * var_2fa17baefe0fa286, 12250000);
    if (istrue(level.adjustshipmentspawns)) {
        spawnpoint = function_c7a7b61fcc8647dc(zone, var_ba0a9fd614a3f6ee, spawnteam);
    } else {
        spawnpoint = function_22cb880502395ae(zone, var_ba0a9fd614a3f6ee, spawnteam);
    }
    /#
        if (getdvarint(@"hash_d4420d4cfbeab8b9", 0) == 1 && isdefined(level.var_6d2de76d16fe8af7)) {
            foreach (objective in level.objectives) {
                line(spawnpoint.origin, objective.curorigin, (0, 1, 0), 1, 0, 200);
                print3d(spawnpoint.origin, int(distance(spawnpoint.origin, objective.curorigin)), (1, 0, 0), 1, 10, 200, 1);
            }
        }
    #/
    return spawnpoint;
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x49bd
// Size: 0xe9
function function_22cb880502395ae(zone, var_ba0a9fd614a3f6ee, spawnteam) {
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers", undefined, var_ba0a9fd614a3f6ee);
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders", undefined, var_ba0a9fd614a3f6ee);
        }
    } else {
        if (!isdefined(level.switchedtohardpointspawnlogic)) {
            level.switchedtohardpointspawnlogic = 1;
            if (function_bff229a11ecd1e34()) {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"objective");
            } else {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic("Secure", "Crit_Default");
            }
        }
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, zone.spawnset, zone.fallbackspawnset, 2, var_ba0a9fd614a3f6ee);
    }
    return spawnpoint;
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4aae
// Size: 0x9b
function function_c7a7b61fcc8647dc(zone, var_ba0a9fd614a3f6ee, spawnteam) {
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
    }
    return spawnpoint;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b51
// Size: 0x29
function waittoprocess() {
    level endon("game_end");
    for (;;) {
        for (;;) {
            if (level.ingraceperiod == 0) {
                break;
            }
        }
    }
    level.usestartspawns = 0;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b81
// Size: 0x12e
function updategametypedvars() {
    updatecommongametypedvars();
    level.planttime = dvarfloatvalue("planttime", 3, 0, 20);
    level.defusetime = dvarfloatvalue("defusetime", 3, 0, 20);
    level.bombtimer = dvarintvalue("bombtimer", 10, 1, 300);
    level.ddtimetoadd = dvarfloatvalue("extraTime", 120, 0, 500);
    level.overtime = dvarfloatvalue("overtimeLimit", 1, 0, 180);
    level.resetprogress = dvarintvalue("resetProgress", 1, 0, 1);
    level.var_1831c32d8bdf53df = dvarintvalue("obscureTime", 0, 0, 10);
    level.bombtimermin = dvarintvalue("bombtimermin", 10, 0, 10);
    level.var_db19c0508f775166 = dvarintvalue("bombintermission", 8, 0, 10);
    level.var_b88463627a96b8b0 = dvarintvalue("bomblocktime", 15, 0, 15);
    setovertimelimitdvar(level.overtime);
    level.silentplant = dvarintvalue("silentPlant", 0, 0, 1);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb6
// Size: 0x22
function nextobjective() {
    level namespace_d576b6dc7cef9c62::resumetimer();
    level.var_80bce1fe9a035033 function_af5604ce591768e1();
    function_52edd4d6e6b699f2();
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cdf
// Size: 0x3c
function debugloc() {
    /#
        while (1) {
            if (isdefined(self.curorigin)) {
                box(self.curorigin, 0, (1, 1, 1), 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d22
// Size: 0x101
function onbeginuse(player) {
    self notify("successful_use_occurred");
    function_9897b5b4ecf74ef3("interaction", player.pers["team"]);
    if (isdefined(self.var_21aaad3fb9690b37) && self.var_21aaad3fb9690b37) {
        self notify("captureBot_hackCanceled_playerHack");
    }
    function_b32fcab47ab8b6fa(player.pers["team"], self.trigger.script_noteworthy);
    if (isdefined(self.var_cea6fac6a8f24927)) {
        player thread function_3dd5a18eafa343cc(self);
    }
    /#
        if (function_ec2935d47ad1f5ce()) {
            self.var_ec7886a87e5a6866 = 1;
            namespace_cb9ef225b7a59984::function_f83e9201f5f2aa6a();
        }
    #/
    if (!is_equal(self.ownerteam, "neutral") && !is_equal(player.pers["team"], self.ownerteam)) {
        self.var_ec7886a87e5a6866 = 1;
        namespace_cb9ef225b7a59984::function_f83e9201f5f2aa6a();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4e2a
// Size: 0x142
function function_283fdcc6a567a598(player, struct, var_a051ed1b3dc4708c) {
    level endon("game_ended");
    fusebox = self;
    self.scenenode = struct spawn_script_origin();
    self.scenenode.angles = self.scenenode.angles + (0, -90, 0);
    actorplayer = anim_scene_create_actor(player, "player_rig", 1);
    blendintime = 0.8;
    if (!ent_flag("switch_on")) {
        if (!istrue(var_a051ed1b3dc4708c)) {
            fusebox thread function_22b3d802b1a8bec5(blendintime, "lever", "flip_switch_up");
        }
        result = self.scenenode anim_scene([0:actorplayer], "interact_on");
        if (result) {
            ent_flag_set("switch_on");
        }
    } else {
        if (!istrue(var_a051ed1b3dc4708c)) {
            fusebox thread function_22b3d802b1a8bec5(blendintime, "lever", "flip_switch_down");
        }
        result = self.scenenode anim_scene([0:actorplayer], "interact");
        if (result) {
            ent_flag_clear("switch_on");
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f73
// Size: 0x27
function function_22b3d802b1a8bec5(time, part, state) {
    wait(time);
    self setscriptablepartstate(part, state);
}

// Namespace robj/namespace_8312845506590779
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa1
// Size: 0x1a1
function onenduse(team, player, result, var_67a1af11de175bf0, var_930163bad6941f10) {
    if (isdefined(var_930163bad6941f10)) {
        var_8a11b26acefd3594 = var_930163bad6941f10;
    } else {
        var_8a11b26acefd3594 = 0;
    }
    bombzone = self;
    if (function_a04947052b0aba76(bombzone) && !istrue(var_67a1af11de175bf0)) {
        return;
    }
    if (!var_8a11b26acefd3594) {
        player function_ed5fa482a1aa09c8();
    }
    if (result) {
        bombzone.ownerteam = team;
        bombzone.trigger setteamfortrigger(team);
        bombzone namespace_19b4203b51d56488::updatetrigger();
        bombzone namespace_19b4203b51d56488::allowuse("enemy");
        level.bombtimer = level.bombtimer - 5;
        if (level.bombtimer < level.bombtimermin) {
            level.bombtimer = level.bombtimermin;
        }
        /#
            if (function_ec2935d47ad1f5ce()) {
                bombzone namespace_19b4203b51d56488::allowuse("helicopter");
            }
        #/
        var_acff3f3a57ba37b7 = int(level.bombtimer * 1000 + gettime() - 1000);
        namespace_cb9ef225b7a59984::function_f967b097b864afbb(team, var_acff3f3a57ba37b7, self.var_ec7886a87e5a6866);
        bombzone function_9897b5b4ecf74ef3("timer", team);
        bombzone thread run_progress_event(team);
    } else {
        function_b32fcab47ab8b6fa("idle", bombzone.trigger.script_noteworthy);
        bombzone function_9897b5b4ecf74ef3("neutral_tick");
        namespace_cb9ef225b7a59984::function_e92d8183093a8f29();
    }
    if (var_8a11b26acefd3594) {
        self.var_69a1d34864447c09 = undefined;
        self.var_21aaad3fb9690b37 = 0;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5149
// Size: 0x16
function function_ec2935d47ad1f5ce() {
    /#
        return getdvarint(@"hash_948c1d810a649388", 0);
    #/
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5166
// Size: 0x3ab
function run_progress_event(team) {
    self notify("run_progress_event");
    self endon("run_progress_event");
    namespace_19b4203b51d56488::setusetime(level.defusetime);
    /#
        if (function_ec2935d47ad1f5ce()) {
            self.var_6f3bb383be5956a9 = 1;
        }
    #/
    level namespace_d576b6dc7cef9c62::pausetimer();
    for (i = 0; i < level.bombtimer; i++) {
        if (istrue(self.var_ec7886a87e5a6866)) {
            function_820ffa8e77528791(team);
        } else {
            function_b32fcab47ab8b6fa("off", self.trigger.script_noteworthy);
            wait(0.5);
            if (istrue(self.var_ec7886a87e5a6866)) {
                continue;
            }
            function_b32fcab47ab8b6fa(team, self.trigger.script_noteworthy);
            wait(0.5);
            if (istrue(self.var_ec7886a87e5a6866)) {
                continue;
            }
        }
    }
    if (istrue(self.var_ec7886a87e5a6866)) {
        function_820ffa8e77528791(team);
    }
    foreach (player in level.players) {
        player notify("interact_cancelled");
    }
    self notify("hack_progress_complete");
    touchlist = [];
    var_22282e7d48ca3400 = undefined;
    foreach (player in level.teamdata[team]["players"]) {
        if (player isonobjective()) {
            touchlist[touchlist.size] = player;
        }
        if (istrue(player.var_1b61fa53f4b2b6c7)) {
            var_22282e7d48ca3400 = player;
        }
    }
    level thread give_capture_credit(touchlist, level.bombtimer, team, level.lastcaptureteam, var_22282e7d48ca3400, level.var_6d2de76d16fe8af7[0]);
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setusetime(level.planttime);
    self.ownerteam = "neutral";
    function_b32fcab47ab8b6fa("off", self.trigger.script_noteworthy);
    namespace_cb9ef225b7a59984::function_e92d8183093a8f29();
    namespace_cb9ef225b7a59984::function_7aa88aa68f7d7b1a();
    foreach (entry in level.teamnamelist) {
        if (is_equal(entry, team)) {
            var_cbc3daa4e3ca9437 = function_1faae1bb72f526fb(self.scriptable, "taken");
            namespace_944ddf7b8df1b0e3::leaderdialog(var_cbc3daa4e3ca9437, entry);
        } else {
            var_cbc3daa4e3ca9437 = function_1faae1bb72f526fb(self.scriptable, "lost");
            namespace_944ddf7b8df1b0e3::leaderdialog(var_cbc3daa4e3ca9437, entry);
        }
    }
    level thread namespace_44abc05161e2e2cb::notifyteam("jup_robj_secured", "jup_robj_secured_enemy", team);
    function_9897b5b4ecf74ef3("timer_complete", team);
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 10, 1, undefined, 1);
    namespace_8312845506590779::function_a04638eb5da83e60();
    foreach (player in level.players) {
        player.var_1b61fa53f4b2b6c7 = undefined;
    }
    level.lastcaptureteam = team;
    nextobjective();
}

// Namespace robj/namespace_8312845506590779
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5518
// Size: 0xf0
function give_capture_credit(touchlist, capturetime, capture_team, lastcaptureteam, var_22282e7d48ca3400, gameobject) {
    level endon("game_ended");
    foreach (player in touchlist) {
        player thread namespace_62c556437da28f50::scoreeventpopup(#"capture");
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_194ad9a7fdb13341");
        player incpersstat("captures", 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        player setextrascore0(player.pers["captures"]);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x560f
// Size: 0x40
function function_820ffa8e77528791(team) {
    function_b32fcab47ab8b6fa(getotherteam(team)[0], self.trigger.script_noteworthy);
    while (istrue(self.var_ec7886a87e5a6866)) {
        waitframe();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5656
// Size: 0x2da
function function_3dd5a18eafa343cc(bombzone) {
    movetime = 1;
    player = self;
    bombzone.scriptable.var_b14a331ba425c286 = undefined;
    bombzone namespace_19b4203b51d56488::allowuse("none");
    if (bombzone.scriptable.model == "uk_electrical_box_medium_01_animated") {
        bombzone.scriptable function_283fdcc6a567a598(player, bombzone.var_cea6fac6a8f24927);
        bombzone.scriptable.var_b14a331ba425c286 = 1;
    } else if (bombzone.scriptable.model == "ammo_box_plastic_lg_01") {
        player.var_8e61d4338428b3bd = 1;
        player giveandfireoffhand("flare_mp");
        player function_935068d9c3667c49();
        scriptable = spawn("script_model", bombzone.var_cea6fac6a8f24927.origin + (0, 0, 1));
        scriptable.angles = (-90, 0, 90);
        scriptable setmodel("dz_flare_scriptable_secure");
        scriptable setscriptablepartstate("smoke", "idle", 0);
        level thread robj_do_helicopter_sequence(bombzone, scriptable);
        bombzone.scriptable.var_b14a331ba425c286 = 1;
    } else {
        bombzone.scriptable function_bd8563c34b78c85b(player);
    }
    claimteam = player.pers["team"];
    if (getdvarint(@"hash_7279b9c2bb5f6487", 0)) {
        claimteam = getotherteam(claimteam)[0];
    }
    bombzone endon("hack_progress_complete");
    function_b32fcab47ab8b6fa(claimteam, bombzone.trigger.script_noteworthy);
    var_bbe52ce53740d5bd = function_750464d23674c53c();
    if (var_bbe52ce53740d5bd) {
        player.var_1b61fa53f4b2b6c7 = 1;
        bombzone onenduse(claimteam, player, 1, 1);
    } else if (isdefined(bombzone.ownerteam)) {
        bombzone namespace_19b4203b51d56488::allowuse("enemy");
        /#
            if (function_ec2935d47ad1f5ce()) {
                bombzone namespace_19b4203b51d56488::allowuse("helicopter");
            }
        #/
    } else {
        bombzone namespace_19b4203b51d56488::allowuse("any");
    }
    if (istrue(bombzone.var_ec7886a87e5a6866)) {
        namespace_cb9ef225b7a59984::function_4477eaad8e734453();
        bombzone.var_ec7886a87e5a6866 = undefined;
    }
    if (!isdefined(bombzone.ownerteam) || bombzone.ownerteam == "neutral") {
        function_b32fcab47ab8b6fa("idle", bombzone.trigger.script_noteworthy);
        if (!function_97a687ba29632c00(bombzone)) {
            bombzone function_9897b5b4ecf74ef3("neutral_tick");
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5937
// Size: 0x29
function function_935068d9c3667c49() {
    player = self;
    player endon("death_or_disconnect");
    while (istrue(player.var_8e61d4338428b3bd)) {
        waitframe();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5967
// Size: 0x22
function function_97a687ba29632c00(objective) {
    return istrue(objective.scriptable.var_b14a331ba425c286);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5991
// Size: 0x5e
function function_750464d23674c53c() {
    foreach (objective in level.var_6d2de76d16fe8af7) {
        if (!function_97a687ba29632c00(objective)) {
            return 0;
        }
    }
    return 1;
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59f7
// Size: 0x100
function function_bd8563c34b78c85b(player) {
    player endon("death_or_disconnect");
    player endon("interact_interrupt");
    thread namespace_872204d77e9872c0::function_796d1da742e2a88a(player);
    if (!isdefined(level.var_e3ddcc4b9b3d02d6)) {
        level.var_e3ddcc4b9b3d02d6 = level.var_cb86ca442250ca58 - getanimlength(script_model%jup_uav_tower_enter);
    }
    typingAnimStart(player);
    namespace_cb9ef225b7a59984::function_196cecf03f13202a(player);
    player thread function_b66f9aef33ae7f2d(level.var_e3ddcc4b9b3d02d6);
    thread function_667fd79f2b5d6436(player);
    player setclientomnvar("ui_dmz_uav_tower_screen", 1);
    namespace_872204d77e9872c0::function_e71d6089ebd93181(player);
    namespace_cb9ef225b7a59984::function_975d7bc893ab1264(player);
    if (getdvarint(@"hash_4a05c776b04c1c9b", 1)) {
        namespace_872204d77e9872c0::function_b61464b3867d7ba3(player);
    } else {
        player stopviewmodelanim();
        player val::set("typing", "allow_movement", 0);
    }
    player notify("interact_finished");
    waitframe();
    player namespace_872204d77e9872c0::function_3c288bbdd4016fd4(1);
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(player)) {
        player notify("remove_rig");
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5afe
// Size: 0x67
function function_b66f9aef33ae7f2d(durationseconds) {
    player = self;
    player endon("death_or_disconnect");
    player endon("interact_interrupt");
    player endon("interact_finished");
    var_48974a7856f3cbaa = 0;
    while (var_48974a7856f3cbaa < durationseconds) {
        var_48974a7856f3cbaa = var_48974a7856f3cbaa + level.framedurationseconds;
        namespace_cb9ef225b7a59984::function_efd118cc84912439(player, clamp(var_48974a7856f3cbaa / durationseconds, 0.01, 1));
        waitframe();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6c
// Size: 0xff
function function_667fd79f2b5d6436(player, capturetime) {
    player endon("interact_interrupt");
    waitframe();
    if (!isbot(player)) {
        player notifyonplayercommand("interact_cancelled", "+weapnext");
    }
    self.cancel = 0;
    msg = player waittill_any_timeout_1(level.var_e3ddcc4b9b3d02d6, "interact_cancelled");
    self.cancel = 1;
    if (!isbot(player)) {
        player notifyonplayercommandremove("interact_cancelled", "+weapnext");
    }
    if (msg == "interact_cancelled") {
        wait(0.25);
        player setclientomnvar("ui_dmz_uav_tower_screen", 0);
    } else {
        self.var_b14a331ba425c286 = 1;
        level thread namespace_44abc05161e2e2cb::notifyteam("jup_robj_securing", "jup_robj_securing_enemy", player.pers["team"], [0:player]);
        player thread namespace_44abc05161e2e2cb::showsplash("jup_robj_securing", namespace_62c556437da28f50::getscoreinfovalue(#"plant"));
        player notify("interact_begin_exit");
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c72
// Size: 0x2ef
function typingAnimStart(player) {
    player endon("death_or_disconnect");
    player notify("typingAnimStart");
    player endon("typingAnimStart");
    if (isdefined(player.linktoent)) {
        player.linktoent delete();
    }
    player namespace_872204d77e9872c0::function_3c288bbdd4016fd4(0);
    player.linktoent = player spawn_tag_origin(player.origin, player getplayerangles(0));
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 1, 1);
    if (self.model == "jup_military_secure_mode_station_01") {
        var_9a2e0b6f009d8682 = self.angles;
    } else {
        var_9a2e0b6f009d8682 = self.angles + (0, -90, 0);
    }
    goalpos = self.origin + rotatevector((55.632, -1.279, 0), var_9a2e0b6f009d8682);
    forward = (0, 0, 0) - anglestoforward(var_9a2e0b6f009d8682);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up);
    var_57c87883ae437750 = 0.5;
    player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
    player.linktoent rotateto(goalangles, var_57c87883ae437750, 0.1, 0.1);
    player setstance("crouch");
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = max(0, var_57c87883ae437750 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000);
    wait(var_218f64cb035d54be);
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    animname = "use_uav_tower_enter";
    player thread namespace_872204d77e9872c0::create_player_rig("uav_tower", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    if (!isdefined(self.animstruct)) {
        animstruct = spawnstruct();
        animstruct.origin = self.origin;
        animstruct.angles = var_9a2e0b6f009d8682;
        self.animstruct = animstruct;
    }
    self.animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, animname);
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f68
// Size: 0x18
function function_a04947052b0aba76(bombzone) {
    return isdefined(bombzone.scriptable);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f88
// Size: 0x6
function function_75043e7e3c552318() {
    return 2000;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f96
// Size: 0x6
function function_72c78e10b4cdbdae() {
    return 2500;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fa4
// Size: 0x3e
function function_ed5fa482a1aa09c8() {
    player = self;
    player notify("stopThirdPersonAnim");
    player stopanimscriptsceneevent();
    if (isdefined(player.var_565acfa83925639f)) {
        player.var_565acfa83925639f delete();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe9
// Size: 0xc
function onuseplantobject(player) {
    
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ffc
// Size: 0x18
function oncantuse(player) {
    player iprintlnbold("MP/BOMBSITE_IN_USE");
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x601b
// Size: 0x3
function onreset() {
    
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6025
// Size: 0x108
function setupobjectiveicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_target_neutral_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_nt_a", 0, "enemy", "", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_nt_b", 0, "enemy", "", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_nt_a", 0, "friendly", "", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_nt_b", 0, "friendly", "", "icon_waypoint_dom_b", 0);
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6134
// Size: 0x65
function setUpNewCaptureBot(CaptureBot) {
    if (!isdefined(self.var_90e6c2c6f0b8bca9)) {
        self.var_90e6c2c6f0b8bca9 = [];
        self.var_3d9bcb6fd43a0b71 = 1;
        self.var_90e6c2c6f0b8bca9[self.var_90e6c2c6f0b8bca9.size] = CaptureBot;
        thread namespace_8312845506590779::function_e6fb1b719f5866f4();
    } else {
        self.var_90e6c2c6f0b8bca9[self.var_90e6c2c6f0b8bca9.size] = CaptureBot;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61a0
// Size: 0x1e5
function function_e6fb1b719f5866f4() {
    level endon("game_end");
    level endon("new_robj_location");
    self.var_21aaad3fb9690b37 = 0;
    self.var_56bb845d40871824 = [];
    while (isdefined(self.var_90e6c2c6f0b8bca9) && self.var_90e6c2c6f0b8bca9.size >= 1) {
        foreach (bot in self.var_90e6c2c6f0b8bca9) {
            if (self.var_56bb845d40871824.size == 0) {
                self.var_56bb845d40871824[self.var_56bb845d40871824.size] = bot.owner.team;
            } else {
                foreach (team in self.var_56bb845d40871824) {
                    if (bot.owner.team != team) {
                        self.var_56bb845d40871824[self.var_56bb845d40871824.size] = bot.owner.team;
                    }
                }
            }
        }
        if (self.var_56bb845d40871824.size == 1) {
            if (!self.var_21aaad3fb9690b37) {
                if (self.interactteam == "any" || self.interactteam == "enemy" && self.ownerteam != self.var_90e6c2c6f0b8bca9[0].owner.team) {
                    thread function_5b561a0406f5e84d(self.var_90e6c2c6f0b8bca9[0]);
                }
            }
            goto LOC_000001df;
        }
    LOC_000001df:
        waitframe();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x638c
// Size: 0x27d
function function_5b561a0406f5e84d(CaptureBot) {
    self notify("successful_use_occurred");
    self.var_69a1d34864447c09 = CaptureBot;
    self.var_21aaad3fb9690b37 = 1;
    function_b32fcab47ab8b6fa(CaptureBot.owner.team, self.trigger.script_noteworthy);
    function_9897b5b4ecf74ef3("interaction", CaptureBot.owner.team);
    if (!is_equal(self.ownerteam, "neutral") && !is_equal(CaptureBot.owner.team, self.ownerteam)) {
        self.var_ec7886a87e5a6866 = 1;
        namespace_cb9ef225b7a59984::function_f83e9201f5f2aa6a();
    }
    CaptureBot.owner setclientomnvar("ui_dmz_uav_tower_screen", 1);
    self.cancel = 0;
    msg = waittill_any_timeout_2(level.var_2550904ae7eb2a1c * level.var_cb86ca442250ca58, "captureBot_hackCanceled", "captureBot_hackCanceled_playerHack");
    self.cancel = 1;
    if (msg == "captureBot_hackCanceled" || msg == "captureBot_hackCanceled_playerHack") {
        self.var_69a1d34864447c09 = undefined;
        self.var_21aaad3fb9690b37 = 0;
    } else {
        level thread namespace_44abc05161e2e2cb::notifyteam("jup_robj_securing", "jup_robj_securing_enemy", CaptureBot.owner.pers["team"], [0:CaptureBot.owner]);
        CaptureBot.owner thread namespace_44abc05161e2e2cb::showsplash("jup_robj_securing", namespace_62c556437da28f50::getscoreinfovalue(#"plant"));
        if (isdefined(self.var_21aaad3fb9690b37) && self.var_21aaad3fb9690b37) {
            onenduse(CaptureBot.owner.team, CaptureBot.owner, 1, 1, 1);
        }
    }
    if (istrue(self.var_ec7886a87e5a6866) && msg != "captureBot_hackCanceled_playerHack") {
        namespace_cb9ef225b7a59984::function_4477eaad8e734453();
        self.var_ec7886a87e5a6866 = undefined;
    }
    if (!isdefined(self.ownerteam) || self.ownerteam == "neutral") {
        if (msg != "captureBot_hackCanceled_playerHack") {
            function_b32fcab47ab8b6fa("idle", self.trigger.script_noteworthy);
            function_9897b5b4ecf74ef3("neutral_tick");
        }
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6610
// Size: 0xa4
function removeExistingCaptureBot(CaptureBot) {
    if (isdefined(self.var_90e6c2c6f0b8bca9) && self.var_90e6c2c6f0b8bca9.size > 0) {
        if (self.var_90e6c2c6f0b8bca9.size == 1) {
            if (isdefined(self.var_3d9bcb6fd43a0b71)) {
                self.var_3d9bcb6fd43a0b71 = undefined;
            }
            self.var_90e6c2c6f0b8bca9 = undefined;
            self.var_56bb845d40871824 = undefined;
        } else {
            self.var_90e6c2c6f0b8bca9 = array_remove(self.var_90e6c2c6f0b8bca9, CaptureBot);
        }
    }
    if (isdefined(self.var_69a1d34864447c09) && self.var_69a1d34864447c09 == CaptureBot) {
        self notify("captureBot_hackCanceled");
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66bb
// Size: 0x60
function function_a04638eb5da83e60() {
    if (isdefined(self.var_90e6c2c6f0b8bca9) && self.var_90e6c2c6f0b8bca9.size > 0) {
        if (isdefined(self.var_3d9bcb6fd43a0b71)) {
            self.var_3d9bcb6fd43a0b71 = undefined;
        }
        self.var_90e6c2c6f0b8bca9 = undefined;
        self.var_56bb845d40871824 = undefined;
    }
    if (isdefined(self.var_69a1d34864447c09)) {
        self notify("captureBot_hackCanceled");
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6722
// Size: 0x83
function identifyObjTypForCaptureBot(objective) {
    switch (objective.scriptable.model) {
    case #"hash_2829cec0816430af":
        return "tower";
    case #"hash_7594c201ef96b3d7":
        return "computer";
    case #"hash_9bb12794207226a":
        return "panel";
    case #"hash_826f132aead12d08":
        return "helicopter";
    default:
        return "no_obj";
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67ac
// Size: 0x23
function function_3bfb09893720ad8b(team) {
    return ter_op(team == "allies", "axis", "allies");
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67d7
// Size: 0x28
function function_c3393659916e4f86() {
    return self.origin + rotatevector((0, 0, 80), self.angles);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6807
// Size: 0x28
function function_303cdf76d8d58324() {
    return self.origin + rotatevector((0, 0, 250), self.angles);
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6837
// Size: 0x43
function function_ef6d70570f9a1124() {
    thread function_a7bc23440006ca37();
    while (self.var_c935cafaec1457bb) {
        playsoundatpos(self.scriptable function_303cdf76d8d58324(), "mp_jup_secure_tower_active_spin");
        waittill_any_timeout_1(1, "hack_progress_complete");
        waitframe();
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6881
// Size: 0xa5
function function_9897b5b4ecf74ef3(type, team) {
    switch (self.scriptable.type) {
    case #"hash_a75e34b940af0387":
        thread function_6bc9adca4cc3c138(type, team);
        break;
    case #"hash_23316c7b6e9eee0a":
        thread function_4353012f233eec7c(type, team);
        break;
    case #"hash_7461b582f15d5954":
        thread function_235af39abd42037d(type, team);
        break;
    case #"hash_7942b6b104bfd8d4":
        thread function_bc5112a335cb0a76(type, team);
        break;
    default:
        /#
        #/
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x692d
// Size: 0xec
function function_6bc9adca4cc3c138(type, team) {
    switch (type) {
    case #"hash_4c03b3adf599e4e0":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_opened");
        playsoundatpos(soundorigin, "mp_jup_secure_tower_opened");
        function_ef6d70570f9a1124();
        break;
    case #"hash_7b8cca9508ef3b84":
        function_94f9e76230eb3b4d();
        break;
    case #"hash_d9876aa54e2a4d2b":
        function_fb13c62b0312196a(team);
        break;
    case #"hash_7d97db7c4e68ac02":
        function_a28df8967ffc5d66(team);
        break;
    case #"hash_e57a60f1b31b1064":
        function_69128861a4095049(team);
        break;
    case #"hash_16e74e07094501b9":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_set");
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a20
// Size: 0xe5
function function_235af39abd42037d(type, team) {
    switch (type) {
    case #"hash_4c03b3adf599e4e0":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_opened");
        playsoundatpos(soundorigin, "mp_jup_secure_terminal_opened");
        break;
    case #"hash_7b8cca9508ef3b84":
        function_94f9e76230eb3b4d();
        break;
    case #"hash_d9876aa54e2a4d2b":
        function_fb13c62b0312196a(team);
        break;
    case #"hash_7d97db7c4e68ac02":
        function_a28df8967ffc5d66(team);
        break;
    case #"hash_e57a60f1b31b1064":
        function_69128861a4095049(team);
        break;
    case #"hash_16e74e07094501b9":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_set");
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b0c
// Size: 0xca
function function_4353012f233eec7c(type, team) {
    switch (type) {
    case #"hash_4c03b3adf599e4e0":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_opened");
        break;
    case #"hash_7b8cca9508ef3b84":
        break;
    case #"hash_d9876aa54e2a4d2b":
        function_fb13c62b0312196a(team);
        break;
    case #"hash_7d97db7c4e68ac02":
        break;
    case #"hash_e57a60f1b31b1064":
        function_69128861a4095049(team);
        break;
    case #"hash_16e74e07094501b9":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_set");
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6bdd
// Size: 0xd9
function function_bc5112a335cb0a76(type, team) {
    switch (type) {
    case #"hash_4c03b3adf599e4e0":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_opened");
        break;
    case #"hash_7b8cca9508ef3b84":
        function_94f9e76230eb3b4d();
        break;
    case #"hash_d9876aa54e2a4d2b":
        function_fb13c62b0312196a(team);
        break;
    case #"hash_7d97db7c4e68ac02":
        function_a28df8967ffc5d66(team);
        break;
    case #"hash_e57a60f1b31b1064":
        function_69128861a4095049(team);
        break;
    case #"hash_16e74e07094501b9":
        soundorigin = self.scriptable function_c3393659916e4f86();
        playsoundatpos(soundorigin, "mp_jup_secure_laptop_new_location_set");
        break;
    }
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6cbd
// Size: 0x20
function function_a7bc23440006ca37() {
    self.var_c935cafaec1457bb = 1;
    self waittill("hack_progress_complete");
    self.var_c935cafaec1457bb = 0;
}

// Namespace robj/namespace_8312845506590779
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ce4
// Size: 0x3e
function function_94f9e76230eb3b4d() {
    self notify("start_neutral_tick");
    self endon("start_neutral_tick");
    self endon("successful_use_occurred");
    while (1) {
        playsoundatpos(self.scriptable function_c3393659916e4f86(), "mp_jup_secure_neutral_ping");
        wait(1);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d29
// Size: 0x2c
function function_fb13c62b0312196a(team) {
    namespace_a34451ae3d453e::playsoundonplayers("mp_jup_secure_ally_hack_screen", team);
    namespace_a34451ae3d453e::playsoundonplayers("mp_jup_secure_enemy_hack_screen", function_3bfb09893720ad8b(team));
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d5c
// Size: 0x35
function function_a28df8967ffc5d66(team) {
    thread function_552d1571bb578587(team);
    namespace_a34451ae3d453e::playsoundonplayers("mp_jup_secure_ally_hack_timer_start", team);
    namespace_a34451ae3d453e::playsoundonplayers("mp_jup_secure_enemy_hack_timer_start", function_3bfb09893720ad8b(team));
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d98
// Size: 0x69
function function_552d1571bb578587(team) {
    self endon("hack_progress_complete");
    self endon("successful_use_occurred");
    while (1) {
        wait(1);
        self.var_2b4b28f7ae75b76a playsoundtoteam("mp_jup_secure_ally_hack_timer_beep", team, undefined, self.var_2b4b28f7ae75b76a);
        self.var_2b4b28f7ae75b76a playsoundtoteam("mp_jup_secure_enemy_hack_timer_beep", function_3bfb09893720ad8b(team), undefined, self.var_2b4b28f7ae75b76a);
    }
}

// Namespace robj/namespace_8312845506590779
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e08
// Size: 0x2c
function function_69128861a4095049(team) {
    namespace_a34451ae3d453e::playsoundonplayers("mp_jup_secure_ally_hack_timer_complete", team);
    namespace_a34451ae3d453e::playsoundonplayers("mp_jup_secure_enemy_hack_timer_complete", function_3bfb09893720ad8b(team));
}

