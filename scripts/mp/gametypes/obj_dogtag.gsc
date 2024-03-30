// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\rank.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\cranked.gsc;

#namespace obj_dogtag;

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57f
// Size: 0xa3
function init() {
    level.dogtags = [];
    level.dogtagallyonusecb = &scripts/mp/gametypes/common::dogtagcommonallyonusecb;
    level.dogtagenemyonusecb = &scripts/mp/gametypes/common::dogtagcommonenemyonusecb;
    level.var_50f07451caeb4973 = getdvarint(@"hash_77fb2f8819915f5c", 1) == 1;
    level.conf_fx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
    level.conf_fx["vanish_gos"] = loadfx("vfx/iw8_mp/gamemode/vfx_gos_tag_pickup.vfx");
    if (istrue(level.var_dd7af80c3eb2c1e0)) {
        level.var_5261f4479b04f834 = &function_c2a00a1d31f16522;
    }
    level.numlifelimited = getgametypenumlives();
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x629
// Size: 0xd3
function shouldspawntags(attacker) {
    if (isdefined(self.switching_teams)) {
        return false;
    }
    if (isdefined(attacker) && attacker == self) {
        return false;
    }
    if (level.teambased && isdefined(attacker) && isdefined(attacker.team) && attacker.team == self.team) {
        return false;
    }
    if (isdefined(attacker) && !isdefined(attacker.team) && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn")) {
        return false;
    }
    if (scripts/mp/gametypes/br_public::isplayeringulag()) {
        return false;
    }
    if (istrue(level.teamdata[self.team]["noRespawns"])) {
        return false;
    }
    return true;
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x704
// Size: 0x9ae
function spawndogtags(victim, attacker, victimnotification, meansofdeath) {
    shouldspawntags = 1;
    if (istrue(level.numlifelimited) || istrue(level.teamdata[victim.team]["noRespawns"])) {
        shouldspawntags = victim shouldspawntags(attacker);
        if (shouldspawntags) {
            shouldspawntags = shouldspawntags && !isreallyalive(victim);
        }
        if (shouldspawntags) {
            shouldspawntags = shouldspawntags && !victim scripts/mp/playerlogic::mayspawn();
        }
    }
    if (!shouldspawntags) {
        return;
    }
    if (isagent(victim)) {
        return;
    }
    if (isagent(attacker)) {
        attacker = attacker.owner;
    }
    tagoffset = function_4b5bf3a3091d471e()[2];
    upangles = (0, 0, 0);
    var_650440c6a1642e7e = victim.angles;
    if (victim scripts/mp/gameobjects::touchingarbitraryuptrigger()) {
        var_650440c6a1642e7e = victim getworldupreferenceangles();
        upangles = anglestoup(var_650440c6a1642e7e);
        if (upangles[2] < 0) {
            tagoffset = tagoffset * -1;
        }
    }
    if (isdefined(level.dogtags[victim.guid])) {
        if (istrue(level.var_dd7af80c3eb2c1e0)) {
            playfx(level.conf_fx["vanish_gos"], level.dogtags[victim.guid].curorigin);
        } else {
            playfx(level.conf_fx["vanish"], level.dogtags[victim.guid].curorigin);
        }
        level.dogtags[victim.guid] resettags();
        level.dogtags[victim.guid].visuals[0].angles = (0, 0, 0);
        level.dogtags[victim.guid].visuals[1].angles = (0, 0, 0);
    } else {
        visuals[0] = spawn("script_model", (0, 0, 0));
        visuals[1] = spawn("script_model", (0, 0, 0));
        if (getdvar(@"hash_e65e9a96eb2ff62b", "conf") == "conf_v") {
            visuals[0] setmodel("jup_accessory_compound_vial_01");
            visuals[1] setmodel("jup_accessory_compound_vial_01");
            visuals[0] hudoutlineenable("outline_nodepth_green");
            visuals[1] hudoutlineenable("outline_nodepth_green");
        } else {
            visuals[0] setmodel(function_c8a7bf223baf8a6c());
            visuals[1] setmodel(function_1e4c1c053ea20dd5());
        }
        if (level.numlifelimited) {
            visuals[0] setclientowner(victim);
            visuals[1] setclientowner(victim);
        }
        visuals[0] setasgametypeobjective();
        visuals[1] setasgametypeobjective();
        trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
        if (victim scripts/mp/gameobjects::touchingarbitraryuptrigger()) {
            if (upangles[2] < 0) {
                visuals[0].angles = var_650440c6a1642e7e;
                visuals[1].angles = var_650440c6a1642e7e;
            }
        }
        useteam = "any";
        usetime = 0;
        level.dogtags[victim.guid] = scripts/mp/gameobjects::createuseobject(useteam, trigger, visuals, (0, 0, 16));
        level.dogtags[victim.guid].onuse = &onuse;
        level.dogtags[victim.guid] scripts/mp/gameobjects::setusetime(usetime);
        level.dogtags[victim.guid].victim = victim;
        level.dogtags[victim.guid].victimteam = victim.team;
        level.dogtags[victim.guid].offset3d = (0, 0, 24);
        scripts/mp/objidpoolmanager::update_objective_setzoffset(level.dogtags[victim.guid].objidnum, level.dogtags[victim.guid].offset3d[2]);
        level thread clearonvictimdisconnect(victim);
        victim thread tagteamupdater(level.dogtags[victim.guid]);
    }
    pos = victim.origin + (0, 0, tagoffset);
    level.dogtags[victim.guid].curorigin = pos;
    level.dogtags[victim.guid].trigger.origin = pos;
    level.dogtags[victim.guid].visuals[0].origin = pos;
    level.dogtags[victim.guid].visuals[1].origin = pos;
    level.dogtags[victim.guid] scripts/mp/gameobjects::initializetagpathvariables();
    level.dogtags[victim.guid] scripts/mp/gameobjects::allowuse("any");
    level.dogtags[victim.guid].visuals[0] showtoteam(level.dogtags[victim.guid], attacker.team);
    level.dogtags[victim.guid].visuals[1] showtoteam(level.dogtags[victim.guid], victim.team);
    level.dogtags[victim.guid].attacker = attacker;
    level.dogtags[victim.guid].attackerteam = attacker.team;
    level.dogtags[victim.guid].ownerteam = victim.team;
    if (isdefined(level.dogtags[victim.guid].objidnum)) {
        if (level.dogtags[victim.guid].objidnum != -1) {
            objid = level.dogtags[victim.guid].objidnum;
            state = "current";
            if (!istrue(level.var_50f07451caeb4973)) {
                state = "active";
            }
            scripts/mp/objidpoolmanager::update_objective_state(objid, state);
            scripts/mp/objidpoolmanager::update_objective_position(objid, victim.origin + (0, 0, 36));
            scripts/mp/objidpoolmanager::update_objective_setbackground(objid, 1);
            scripts/mp/objidpoolmanager::objective_set_play_intro(level.dogtags[victim.guid].objidnum, 0);
            scripts/mp/objidpoolmanager::objective_set_play_outro(level.dogtags[victim.guid].objidnum, 0);
            scripts/mp/objidpoolmanager::function_98ba077848896a3(level.dogtags[victim.guid].objidnum, 0);
            scripts/mp/objidpoolmanager::function_f21e9b2e78de984b(level.dogtags[victim.guid].objidnum, 800, 1600);
            level.dogtags[victim.guid] scripts/mp/gameobjects::setobjectivestatusicons("waypoint_dogtags_friendly", "waypoint_dogtags");
            level.dogtags[victim.guid] scripts/mp/gameobjects::setvisibleteam("any");
        }
    }
    if (getgametype() == "conf_v") {
        playsoundatpos(pos, "jup_confv_vile_drop");
    } else {
        playsoundatpos(pos, "mp_killconfirm_tags_drop");
    }
    level notify(victimnotification, level.dogtags[victim.guid]);
    victim.tagavailable = 1;
    level.dogtags[victim.guid].visuals[0] scriptmodelplayanim("mp_dogtag_spin");
    level.dogtags[victim.guid].visuals[1] scriptmodelplayanim("mp_dogtag_spin");
    function_f793a9fd32c1a72b(level.dogtags[victim.guid]);
    if (level.numlifelimited) {
        victim.statusicon = "hud_status_dogtag";
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b9
// Size: 0x109
function resettags() {
    self.attacker = undefined;
    self notify("reset");
    self.visuals[0] hide();
    self.visuals[1] hide();
    self.visuals[0] dontinterpolate();
    self.visuals[1] dontinterpolate();
    self.curorigin = (0, 0, 1000);
    self.trigger.origin = (0, 0, 1000);
    self.visuals[0].origin = (0, 0, 1000);
    self.visuals[1].origin = (0, 0, 1000);
    scripts/mp/gameobjects::allowuse("none");
    if (self.objidnum != -1) {
        scripts/mp/objidpoolmanager::update_objective_state(self.objidnum, "done");
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c9
// Size: 0x27e
function removetags(guid, var_3737240cefe2c793, collector) {
    if (istrue(self.var_bcb19026623af98b)) {
        foreach (key, tag in level.dogtags) {
            if (tag == self) {
                guid = key;
                break;
            }
        }
    }
    if (isdefined(level.dogtags[guid])) {
        level.dogtags[guid] scripts/mp/gameobjects::allowuse("none");
        if (istrue(var_3737240cefe2c793) && isdefined(level.dogtags[guid].attacker)) {
            level.dogtags[guid].attacker thread scripts/mp/rank::scoreeventpopup(#"kill_denied");
        }
        if (istrue(level.var_dd7af80c3eb2c1e0)) {
            if (isdefined(level.var_5261f4479b04f834)) {
                level [[ level.var_5261f4479b04f834 ]](level.dogtags[guid], collector);
            }
        } else {
            playfx(level.conf_fx["vanish"], level.dogtags[guid].curorigin);
        }
        level.dogtags[guid] notify("reset");
        waitframe();
        if (!isdefined(level.dogtags[guid])) {
            return;
        }
        if (!istrue(level.dogtags[guid].var_bcb19026623af98b)) {
            level.dogtags[guid] notify("death");
            for (i = 0; i < level.dogtags[guid].visuals.size; i++) {
                level.dogtags[guid].visuals[i] delete();
            }
            if (!isdefined(level.dogtags[guid].skipminimapids)) {
                level.dogtags[guid] thread scripts/mp/gameobjects::deleteuseobject();
            }
            level.dogtags[guid] = undefined;
            return;
        }
        level.dogtags[guid] scripts/mp/gameobjects::disableobject();
        level.dogtags[guid].visuals[0] hide();
        level.dogtags[guid].visuals[1] hide();
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144e
// Size: 0x1cb
function function_c2a00a1d31f16522(dogtags, collector) {
    tstartoffset = 20;
    var_12f59cd9e8d7e077 = 600;
    tstart = dogtags.curorigin + (0, 0, tstartoffset);
    tend = dogtags.curorigin + (0, 0, var_12f59cd9e8d7e077);
    contentoverride = scripts/engine/trace::create_contents(0, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    ignoreents[ignoreents.size] = dogtags.visuals[0];
    ignoreents[ignoreents.size] = dogtags.visuals[1];
    if (isplayer(collector)) {
        ignoreents[ignoreents.size] = collector;
    }
    trace = scripts/engine/trace::ray_trace(tstart, tend, ignoreents, contentoverride, 0);
    if (isplayer(trace["entity"])) {
        trace["entity"] = undefined;
    }
    if (isdefined(trace["entity"]) && isdefined(trace["entity"].code_classname) && trace["entity"].code_classname == "script_vehicle") {
        ignoreents[ignoreents.size] = trace["entity"];
        trace = scripts/engine/trace::ray_trace(tstart, tend, ignoreents, contentoverride, 0);
    }
    if (trace["fraction"] != 1) {
        playfx(level.conf_fx["vanish_gos"], dogtags.curorigin);
        return;
    }
    playfx(level.conf_fx["vanish_gos"], dogtags.curorigin);
    playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], dogtags.curorigin);
    level thread scripts/mp/gametypes/common::function_2c3362a9f434fd8d(dogtags.curorigin);
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1620
// Size: 0x15e
function onplayerjoinedteam(player) {
    if (!scripts/mp/flags::gameflag("prematch_done")) {
        return;
    }
    foreach (tags in level.dogtags) {
        if (isdefined(tags.attackerteam)) {
            if (player.team == tags.attackerteam) {
                tags.visuals[0] showtoplayer(player);
            }
            if (player.team == "spectator" && tags.attackerteam == "allies") {
                tags.visuals[0] showtoplayer(player);
            }
        }
        if (isdefined(tags.ownerteam)) {
            if (player.team == tags.ownerteam) {
                tags.visuals[1] showtoplayer(player);
            }
            if (player.team == "spectator" && tags.ownerteam == "allies") {
                tags.visuals[1] showtoplayer(player);
            }
        }
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1785
// Size: 0xc3
function showtoteam(gameobject, team) {
    self hide();
    foreach (player in level.players) {
        if (player.team == team) {
            self showtoplayer(player);
        }
        if (player.team == "spectator" && team == "allies") {
            self showtoplayer(player);
        }
        if (player.team == "codcaster") {
            self showtoplayer(player);
        }
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184f
// Size: 0xe
function playercanusetags(player) {
    return true;
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1865
// Size: 0x27b
function onuse(player) {
    if (!playercanusetags(player)) {
        return;
    }
    if (isdefined(player.owner)) {
        player = player.owner;
    }
    if (getgametype() == "conf") {
        player thread watchrapidtagpickup();
    }
    if (player.pers["team"] == self.victimteam) {
        if (!istrue(getgametype() == "conf_v")) {
            self.trigger playsound("mp_killconfirm_tags_pickup");
        }
        player incpersstat("denied", 1);
        player scripts/mp/persistence::statsetchild("round", "denied", player.pers["denied"]);
        if (level.numlifelimited && getgametype() != "arena") {
            lifelimitedallyonuse(player);
        } else {
            allyonuse(player);
        }
        if (isdefined(level.dogtagallyonusecb) && !level.gameended) {
            self thread [[ level.dogtagallyonusecb ]](player);
        }
    } else {
        if (!istrue(level.gametype == "conf_v")) {
            self.trigger playsound("mp_killconfirm_tags_pickup");
        }
        if (getgametype() != "grind" && getgametype() != "pill") {
            player incpersstat("confirmed", 1);
            player scripts/mp/persistence::statsetchild("round", "confirmed", player.pers["confirmed"]);
        }
        if (level.numlifelimited && getgametype() != "arena") {
            lifelimitedenemyonuse(player);
        } else {
            enemyonuse(player);
        }
        if (isdefined(level.dogtagenemyonusecb) && !level.gameended) {
            self thread [[ level.dogtagenemyonusecb ]](player);
        }
    }
    if (getgametype() == "conf_v") {
        player playsoundtoplayer("jup_confv_vile_pickup", player);
        self.trigger playsoundtoteam("jup_confv_vile_pickup_enemy", getotherteam(player.team)[0], player);
        self.trigger playsoundtoteam("jup_confv_vile_pickup_ally", player.team, player);
    }
    self.victim notify("tag_removed");
    thread removetags(self.victim.guid, undefined, player);
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae7
// Size: 0x75
function watchrapidtagpickup() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("watchRapidTagPickup()");
    self endon("watchRapidTagPickup()");
    if (!isdefined(self.recenttagcount)) {
        self.recenttagcount = 1;
    } else {
        self.recenttagcount++;
        if (self.recenttagcount == 3) {
            thread scripts/mp/utility/points::doScoreEvent(#"hash_538a87430e9cf381");
        }
    }
    wait(3);
    self.recenttagcount = 0;
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b63
// Size: 0x44
function tagteamupdater(tags) {
    level endon("game_ended");
    self endon("disconnect");
    tags endon("death");
    while (true) {
        self waittill("joined_team");
        thread removetags(self.guid, 1);
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bae
// Size: 0x52
function clearonvictimdisconnect(victim) {
    victim notify("clearOnVictimDisconnect");
    victim endon("clearOnVictimDisconnect");
    victim endon("tag_removed");
    level endon("game_ended");
    guid = victim.guid;
    victim waittill("disconnect");
    thread removetags(guid, 1);
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c07
// Size: 0x34
function ontagpickupevent(event) {
    level endon("game_ended");
    self endon("disconnect");
    while (!isdefined(self.pers)) {
        waitframe();
    }
    thread doScoreEvent(event);
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c42
// Size: 0x18e
function lifelimitedallyonuse(player) {
    player.pers["rescues"]++;
    player scripts/mp/persistence::statsetchild("round", "rescues", player.pers["rescues"]);
    skipplayers = [];
    skipplayers[skipplayers.size] = self.victim;
    scripts/mp/hud_message::notifyteam("sr_ally_respawned", "sr_enemy_respawned", self.victim);
    if (isdefined(self.victim)) {
        self.victim thread scripts/mp/hud_message::showsplash("sr_respawned");
        level notify("sr_player_respawned", self.victim);
        self.victim scripts/mp/utility/dialog::leaderdialogonplayer("revived");
        if (!level.gameended) {
            self.victim thread respawn();
        }
        self.victim.tagavailable = undefined;
        self.victim.statusicon = "";
    }
    if (isdefined(self.attacker)) {
        self.attacker thread scripts/mp/rank::scoreeventpopup(#"kill_denied");
    }
    player thread ontagpickupevent(#"kill_denied");
    if (!isdefined(player.rescuedplayers)) {
        player.rescuedplayers = [];
    }
    player.rescuedplayers[self.victim.guid] = 1;
    self.victim scripts/mp/killstreaks/killstreaks::function_b7492842aad6fe82();
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd7
// Size: 0x12b
function lifelimitedenemyonuse(player) {
    if (isdefined(self.victim)) {
        self.victim thread scripts/mp/hud_message::showsplash("sr_eliminated");
        level notify("sr_player_eliminated", self.victim);
    }
    skipplayers = [];
    skipplayers[skipplayers.size] = self.victim;
    scripts/mp/hud_message::notifyteam("sr_ally_eliminated", "sr_enemy_eliminated", self.victim);
    if (isdefined(self.victim)) {
        if (!level.gameended) {
            self.victim scripts/mp/utility/lower_message::setlowermessageomnvar("spawn_next_round");
            self.victim thread scripts/mp/playerlogic::removespawnmessageshortly(3);
        }
        self.victim.tagavailable = undefined;
        self.victim.statusicon = "hud_status_dead";
    }
    if (self.attacker != player) {
        self.attacker thread ontagpickupevent(#"kill_confirmed");
    }
    player thread ontagpickupevent(#"kill_confirmed");
    player scripts/mp/utility/dialog::leaderdialogonplayer("kill_confirmed");
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f09
// Size: 0x26
function respawn() {
    scripts/mp/playerlogic::incrementalivecount(self.team);
    self.alreadyaddedtoalivecount = 1;
    thread scripts/mp/playerlogic::waittillcanspawnclient();
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f36
// Size: 0x14a
function allyonuse(player) {
    if (self.victim == player) {
        player thread scripts/mp/rank::scoreeventpopup(#"tag_retrieved");
        player thread scripts/mp/utility/points::doScoreEvent(#"hash_e4042d7ef2cd089e");
    } else if (level.gametype == "conf") {
        player ontagpickupevent(#"kill_denied");
    } else if (level.gametype == "conf_v") {
        player ontagpickupevent(#"hash_65b89cc1f786f315");
    } else if (getgametype() != "grind") {
        player ontagpickupevent(#"tag_denied");
    } else {
        player ontagpickupevent(#"tag_collected");
        player playersettagcount(player.tagscarried + 1);
    }
    if (isdefined(self.attacker)) {
        self.attacker thread scripts/mp/rank::scoreeventpopup(#"tag_denied");
    }
    if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) {
        if (isdefined(player.cranked) && player.cranked) {
            player scripts/mp/cranked::setcrankedplayerbombtimer("friendly_tag");
            return;
        }
        player scripts/mp/cranked::oncranked(undefined, player);
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2087
// Size: 0x192
function enemyonuse(player) {
    if (level.gametype == "conf") {
        player ontagpickupevent(#"kill_confirmed");
    } else if (level.gametype == "conf_v") {
        player ontagpickupevent(#"hash_74634e3169e1f8b7");
    } else {
        player ontagpickupevent(#"tag_collected");
    }
    if (getgametype() == "grind") {
        player playersettagcount(player.tagscarried + 1);
    }
    if (self.attacker != player) {
        if (getgametype() == "grind") {
            self.attacker thread ontagpickupevent(#"hash_fec13ad5ea891dce");
        } else if (getgametype() == "conf_v") {
        } else {
            self.attacker thread ontagpickupevent(#"hash_be03c8d7051adfa8");
        }
    }
    if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) {
        if (isdefined(player.cranked) && player.cranked) {
            player scripts/mp/cranked::setcrankedplayerbombtimer("kill");
        } else {
            player scripts/mp/cranked::oncranked(undefined, player);
        }
        if (player != self.attacker && isdefined(self.attacker.cranked) && self.attacker.cranked) {
            self.attacker scripts/mp/cranked::setcrankedplayerbombtimer("kill");
        }
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2220
// Size: 0x3a
function playersettagcount(tagcount) {
    self.tagscarried = tagcount;
    self.game_extrainfo = tagcount;
    if (tagcount > 999) {
        tagcount = 999;
    }
    self setclientomnvar("ui_grind_tags", tagcount);
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2261
// Size: 0x61
function function_4b5bf3a3091d471e() {
    if (getdvarint(@"hash_669ae0558e9a0a64", 0) == 1) {
        return (0, 0, 36);
    }
    if (getdvar(@"hash_e65e9a96eb2ff62b", "conf") == "conf_v") {
        return (0, 0, 20);
    }
    return (0, 0, 14);
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c9
// Size: 0x23
function function_c8a7bf223baf8a6c() {
    if (getdvarint(@"hash_669ae0558e9a0a64", 0) == 1) {
        return "decor_halloween_human_skull_01_gold_no_physics";
    }
    return "military_dogtags_iw9_red";
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f4
// Size: 0x23
function function_1e4c1c053ea20dd5() {
    if (getdvarint(@"hash_669ae0558e9a0a64", 0) == 1) {
        return "decor_halloween_human_skull_01_gold_no_physics";
    }
    return "military_dogtags_iw9_blue";
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231f
// Size: 0x38
function function_f793a9fd32c1a72b(tag) {
    if (getdvarint(@"hash_669ae0558e9a0a64", 0) == 0) {
        return;
    }
    if (isdefined(tag)) {
        thread function_15b31cdce9502371(tag);
        thread function_3cb2d6c46a560c73(tag);
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x235e
// Size: 0x79
function private function_15b31cdce9502371(tag) {
    tag notify("rotate_halloween_event_tag");
    level endon("game_ended");
    tag endon("reset");
    tag endon("death");
    tag endon("rotate_halloween_event_tag");
    while (true) {
        tag.visuals[0] rotateyaw(360, 2);
        tag.visuals[1] rotateyaw(360, 2);
        wait(2);
    }
}

// Namespace obj_dogtag / scripts/mp/gametypes/obj_dogtag
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23de
// Size: 0x212
function private function_3cb2d6c46a560c73(tag) {
    tag notify("bob_halloween_event_tag");
    level endon("game_ended");
    tag endon("reset");
    tag endon("death");
    tag endon("bob_halloween_event_tag");
    amplitude = 9;
    frequency = 1;
    acceltime = frequency * 0.4;
    deceltime = frequency * 0.4;
    tag.visuals[0] moveto(tag.visuals[0].origin + (0, 0, amplitude * 0.5), frequency * 0.5, acceltime * 0.5, deceltime * 0.5);
    tag.visuals[1] moveto(tag.visuals[1].origin + (0, 0, amplitude * 0.5), frequency * 0.5, acceltime * 0.5, deceltime * 0.5);
    while (true) {
        tag.visuals[0] moveto(tag.visuals[0].origin - (0, 0, amplitude), frequency, acceltime, deceltime);
        tag.visuals[1] moveto(tag.visuals[1].origin - (0, 0, amplitude), frequency, acceltime, deceltime);
        wait(frequency);
        tag.visuals[0] moveto(tag.visuals[0].origin + (0, 0, amplitude), frequency, acceltime, deceltime);
        tag.visuals[1] moveto(tag.visuals[1].origin + (0, 0, amplitude), frequency, acceltime, deceltime);
        wait(frequency);
    }
}

