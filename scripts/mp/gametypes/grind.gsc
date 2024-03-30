// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\obj_grindzone.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\obj_dogtag.gsc;
#using scripts\mp\cranked.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\engine\trace.gsc;

#namespace grind;

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x826
// Size: 0x216
function main() {
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "dom";
    scripts/mp/gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.dogtagsplayer = [];
    init();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.modeonsuicidedeath = &onsuicidedeath;
    level.conf_fx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
    if (scripts/cp_mp/utility/game_utility::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_grnd_mode_uktl_gnt1";
    } else {
        game["dialog"]["gametype"] = "iw9_grnd_mode_uktl_gdnm";
    }
    game["dialog"]["boost"] = "iw9_grnd_mode_uktl_gdbo";
    game["dialog"]["offense_obj"] = "iw9_grnd_mode_uktl_gdbo";
    game["dialog"]["defense_obj"] = "iw9_grnd_mode_uktl_gdbo";
    game["dialog"]["grind_active_a"] = "iw9_grnd_mode_uktl_gdaa";
    game["dialog"]["grind_active_b"] = "iw9_grnd_mode_uktl_gdab";
    game["dialog"]["grind_inactive_a"] = "iw9_grnd_mode_uktl_gdia";
    game["dialog"]["grind_inactive_b"] = "iw9_grnd_mode_uktl_gdib";
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa43
// Size: 0x145
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_321f8596b4664c1b", getmatchrulesdata("grindData", "bankTime"));
    setdynamicdvar(@"hash_9e94490fff00dd08", getmatchrulesdata("grindData", "bankRate"));
    setdynamicdvar(@"hash_722cc2fa81e65d71", getmatchrulesdata("grindData", "bankCaptureTime"));
    setdynamicdvar(@"hash_2a57704ca0d525a2", getmatchrulesdata("grindData", "bankDisable"));
    setdynamicdvar(@"hash_1b7905642c6df9ab", getmatchrulesdata("grindData", "bankDisableTags"));
    setdynamicdvar(@"hash_8e8e4f64806e8e03", getmatchrulesdata("grindData", "bankDisableTime"));
    setdynamicdvar(@"hash_ebc3ddc40b45d8c7", getmatchrulesdata("grindData", "megaBankLimit"));
    setdynamicdvar(@"hash_9d6f595dbf232f59", getmatchrulesdata("grindData", "megaBankBonusKS"));
    setdynamicdvar(@"hash_a25f426674b2ea4d", getmatchrulesdata("grindData", "megaBankBonus"));
    setdynamicdvar(@"hash_44442340f98878c", 0);
    registerhalftimedvar("grind", 0);
    setdynamicdvar(@"hash_4d24505ea8f90528", 0);
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8f
// Size: 0x114
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    setobjectivetext("allies", "OBJECTIVES/WAR");
    setobjectivetext("axis", "OBJECTIVES/WAR");
    if (level.splitscreen) {
        setobjectivescoretext("allies", "OBJECTIVES/WAR");
        setobjectivescoretext("axis", "OBJECTIVES/WAR");
    } else {
        setobjectivescoretext("allies", "OBJECTIVES/WAR_SCORE");
        setobjectivescoretext("axis", "OBJECTIVES/WAR_SCORE");
    }
    setobjectivehinttext("allies", "OBJECTIVES/WAR_HINT");
    setobjectivehinttext("axis", "OBJECTIVES/WAR_HINT");
    initspawns();
    createtags();
    level.dogtagallyonusecb = &dogtagallyonusecb;
    setupwaypointicons();
    thread createzones();
    level thread removetagsongameended();
    /#
        level thread removepoint();
        level thread placepoint();
        level thread function_cd969857178097d0();
        level thread function_d859ebf3629052fb();
    #/
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaa
// Size: 0x147
function updategametypedvars() {
    updatecommongametypedvars();
    level.banktime = dvarfloatvalue("bankTime", 2, 0, 10);
    level.bankrate = dvarintvalue("bankRate", 1, 1, 10);
    level.bankcapturetime = dvarintvalue("bankCaptureTime", 0, 0, 10);
    level.bankdisable = dvarintvalue("bankDisable", 1, 0, 1);
    level.bankdisabletags = dvarintvalue("bankDisableTags", 0, 0, 50);
    level.bankdisabletime = dvarintvalue("bankDisableTime", 0, 0, 120);
    level.megabanklimit = dvarintvalue("megaBankLimit", 5, 5, 15);
    level.megabankbonusks = dvarintvalue("megaBankBonusKS", 1, 0, 10);
    level.megabankbonus = dvarintvalue("megaBankBonus", 150, 0, 750);
    scorelimit = getwatcheddvar("scorelimit");
    if (scorelimit == 0 && level.bankdisabletags == 0) {
        level.bankdisable = 0;
        return;
    }
    if (level.bankdisabletags == 0 && scorelimit > 0) {
        level.bankdisabletags = int(scorelimit);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x3a
function onspawnplayer(revivespawn) {
    scripts/mp/hud_message::function_f004ef4606b9efdc("bank_tags");
    if (isdefined(self.tagscarried)) {
        self setclientomnvar("ui_grind_tags", self.tagscarried);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x23
function onsuicidedeath(victim) {
    self setclientomnvar("ui_grind_tags", 0);
    level thread droptags(victim);
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63
// Size: 0x21c
function createtags() {
    level.dogtags = [];
    for (i = 0; i < 50; i++) {
        visuals[0] = spawn("script_model", (0, 0, 0));
        visuals[1] = spawn("script_model", (0, 0, 0));
        visuals[0] setmodel(scripts/mp/gametypes/obj_dogtag::function_c8a7bf223baf8a6c());
        visuals[1] setmodel(scripts/mp/gametypes/obj_dogtag::function_1e4c1c053ea20dd5());
        visuals[0] scriptmodelplayanim("mp_dogtag_spin");
        visuals[1] scriptmodelplayanim("mp_dogtag_spin");
        if (visuals[0] isscriptable()) {
            visuals[0] setscriptablepartstate("visibility", "hide", 0);
        } else {
            visuals[0] hide();
        }
        if (visuals[1] isscriptable()) {
            visuals[1] setscriptablepartstate("visibility", "hide", 0);
        } else {
            visuals[1] hide();
        }
        visuals[0] setasgametypeobjective();
        visuals[1] setasgametypeobjective();
        trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
        trigger.targetname = "trigger_dogtag";
        trigger hide();
        newtag = spawnstruct();
        newtag.type = "useObject";
        newtag.curorigin = trigger.origin;
        newtag.entnum = trigger getentitynumber();
        newtag.lastusedtime = 0;
        newtag.visuals = visuals;
        newtag.offset3d = (0, 0, 16);
        newtag.trigger = trigger;
        newtag.trigger enablelinkto();
        newtag.triggertype = "proximity";
        newtag scripts/mp/gameobjects::allowuse("none");
        level.dogtags[level.dogtags.size] = newtag;
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1086
// Size: 0xf6
function gettag() {
    besttag = level.dogtags[0];
    oldesttime = gettime();
    foreach (tag in level.dogtags) {
        if (!isdefined(tag.lastusedtime)) {
            continue;
        }
        if (istrue(tag.var_bcb19026623af98b)) {
            continue;
        }
        if (tag.interactteam == "none") {
            besttag = tag;
            break;
        }
        if (tag.lastusedtime < oldesttime) {
            oldesttime = tag.lastusedtime;
            besttag = tag;
        }
    }
    besttag notify("reset");
    besttag scripts/mp/gameobjects::initializetagpathvariables();
    besttag.lastusedtime = gettime();
    return besttag;
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1184
// Size: 0x225
function spawntag(victim) {
    droplocation = victim.origin;
    tagteam = victim.team;
    startpos = droplocation + (0, 0, 14);
    zoffset = 35;
    stance = victim getstance();
    if (stance == "prone") {
        zoffset = 14;
    }
    if (stance == "crouch") {
        zoffset = 25;
    }
    movetostartpos = droplocation + scripts/mp/gametypes/obj_dogtag::function_4b5bf3a3091d471e();
    randomangle = (0, randomfloat(360), 0);
    randomdir = anglestoforward(randomangle);
    randomdst = randomfloatrange(30, 150);
    movetotime = 0.5;
    testpos = startpos + randomdst * randomdir;
    movetoendpos = playerphysicstrace(startpos, testpos);
    newtag = gettag();
    newtag.curorigin = movetostartpos;
    newtag.trigger.origin = movetostartpos;
    newtag.visuals[0].origin = movetostartpos;
    newtag.visuals[1].origin = movetostartpos;
    newtag.team = victim.team;
    newtag.interactteam = "any";
    newtag.trigger show();
    newtag.trigger linkto(newtag.visuals[0], "tag_origin");
    newtag.trigger linkto(newtag.visuals[1], "tag_origin");
    playsoundatpos(startpos, "mp_grind_token_drop");
    scripts/mp/gametypes/obj_dogtag::function_f793a9fd32c1a72b(newtag);
    newtag thread tagmoveto(tagteam, movetostartpos, movetoendpos, movetotime);
    return newtag;
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0x148
function tagmoveto(tagteam, movetostartpos, movetoendpos, time) {
    scripts/mp/gameobjects::allowuse("any");
    self.visuals[0] showtoteam(self, getotherteam(tagteam)[0]);
    self.visuals[1] showtoteam(self, tagteam);
    self.visuals[0] setasgametypeobjective();
    self.visuals[1] setasgametypeobjective();
    gravity = getdvarint(@"hash_b5d7d39d32720e78");
    dist = distance(movetostartpos, movetoendpos);
    delta = movetoendpos - movetostartpos;
    drop = 0.5 * gravity * squared(time) * -1;
    vel = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self.tag_moving = 1;
    self.visuals[0] movegravity(vel, time);
    self.visuals[1] movegravity(vel, time);
    wait(1);
    self.curorigin = movetoendpos;
    self.tag_moving = undefined;
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1500
// Size: 0x47
function showtoteam(gameobject, team) {
    gameobject endon("death");
    gameobject endon("reset");
    if (self isscriptable()) {
        self setscriptablepartstate("visibility", "show", 0);
        return;
    }
    self show();
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154e
// Size: 0x27a
function monitortaguse(tag) {
    level endon("game_ended");
    tag endon("deleted");
    tag endon("reset");
    while (true) {
        player = tag.trigger waittill("trigger");
        if (!isreallyalive(player)) {
            continue;
        }
        if (player isusingremote() || isdefined(player.spawningafterremotedeath)) {
            continue;
        }
        if (isdefined(player.classname) && player.classname == "script_vehicle") {
            continue;
        }
        if (isagent(player) && isdefined(player.owner)) {
            player = player.owner;
        }
        if (tag.visuals[0] isscriptable()) {
            tag.visuals[0] setscriptablepartstate("visibility", "hide", 0);
        } else {
            tag.visuals[0] hide();
        }
        if (tag.visuals[1] isscriptable()) {
            tag.visuals[1] setscriptablepartstate("visibility", "hide", 0);
        } else {
            tag.visuals[1] hide();
        }
        tag.trigger hide();
        tag.curorigin = (0, 0, 1000);
        tag.trigger.origin = (0, 0, 1000);
        tag.visuals[0].origin = (0, 0, 1000);
        tag.visuals[1].origin = (0, 0, 1000);
        tag scripts/mp/gameobjects::allowuse("none");
        player playersettagcount(player.tagscarried + 1);
        player thread doScoreEvent(#"tag_collected");
        player playsound("mp_grind_token_pickup");
        if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) {
            if (isdefined(player.cranked) && player.cranked) {
                player scripts/mp/cranked::setcrankedplayerbombtimer("kill");
            } else {
                player scripts/mp/cranked::oncranked(undefined, player);
            }
        }
        break;
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cf
// Size: 0x22
function onplayerconnect(player) {
    player.isscoring = 0;
    player thread monitorjointeam();
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f8
// Size: 0x3a
function playersettagcount(tagcount) {
    self.tagscarried = tagcount;
    self.game_extrainfo = tagcount;
    if (tagcount > 999) {
        tagcount = 999;
    }
    self setclientomnvar("ui_grind_tags", tagcount);
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1839
// Size: 0x2b
function monitorjointeam() {
    self endon("disconnect");
    while (true) {
        waittill_any_2("joined_team", "joined_spectators");
        playersettagcount(0);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x186b
// Size: 0x26
function hidehudelementongameend(hudelement) {
    level waittill("game_ended");
    if (isdefined(hudelement)) {
        hudelement.alpha = 0;
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1898
// Size: 0x1ef
function createzones() {
    if (isdefined(level.var_6e31fb115404c96d)) {
        [[ level.var_6e31fb115404c96d ]]();
    }
    triggers = getentarray("grind_location", "targetname");
    foreach (trigger in triggers) {
        zone = setupobjective(trigger, 1, 1);
        zone thread runzonethink();
        level.objectives[zone.objectivekey] = zone;
    }
    if (level.mapname == "mp_deadzone") {
        hacktrigger = spawnstruct();
        hacktrigger.origin = (1416, 1368, 300);
        hacktrigger.angles = (0, 0, 0);
        hacktrigger.script_label = "b";
        zone = scripts/mp/gametypes/obj_grindzone::setupobjective(hacktrigger, 1, 1);
        zone thread runzonethink();
        level.objectives[zone.objectivekey] = zone;
    }
    if (!scripts/mp/flags::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    foreach (zone in level.objectives) {
        var_3c2389ba69e5822b = getreservedobjid(zone.objectivekey);
        zone scripts/mp/gameobjects::requestid(1, 1, var_3c2389ba69e5822b);
        zone scripts/mp/gameobjects::setvisibleteam("any");
        zone setobjectivecallbacks();
        zone setneutral();
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8e
// Size: 0x52
function isinzone(player, zone) {
    if (isreallyalive(player) && player istouching(zone.trigger) && zone.ownerteam == player.team) {
        return true;
    }
    return false;
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae8
// Size: 0x9e
function runzonethink() {
    level endon("game_ended");
    self endon("stop_trigger" + self.objectivekey);
    while (true) {
        player = self.trigger waittill("trigger");
        if (self.disabled) {
            continue;
        }
        if (self.stalemate) {
            continue;
        }
        if (isagent(player)) {
            continue;
        }
        if (!isplayer(player)) {
            continue;
        }
        if (player.isscoring) {
            continue;
        }
        player.isscoring = 1;
        level thread processscoring(player, self);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8d
// Size: 0x7f
function removetagsongameended() {
    level waittill("game_ended");
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.tagscarried)) {
            continue;
        }
        player.tagscarried = 0;
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c13
// Size: 0x1d7
function processscoring(player, zone) {
    while (player.tagscarried && isinzone(player, zone) && !zone.stalemate && !zone.disabled) {
        if (player.tagscarried >= level.megabanklimit) {
            player playsoundtoplayer("mp_grind_token_banked_large", player);
            scoreamount(player, level.megabanklimit, zone);
            points = scripts/mp/rank::getscoreinfovalue(#"tag_score");
            points = points * level.megabanklimit;
            if (!player scripts/mp/utility/perk::_hasperk("specialty_killstreak_to_scorestreak")) {
                player scripts/mp/killstreaks/killstreaks::givestreakpoints(#"capture", level.megabankbonusks);
            }
            player thread doScoreEvent(#"mega_bank", undefined, points + level.megabankbonus);
            player incpersstat("tagsMegaBanked", 1);
        } else {
            player playsoundtoplayer("mp_grind_token_banked", player);
            var_1b445873b17eaa71 = level.bankrate;
            if (var_1b445873b17eaa71 > player.tagscarried) {
                var_1b445873b17eaa71 = player.tagscarried;
            }
            scoreamount(player, var_1b445873b17eaa71, zone);
            for (i = 0; i < var_1b445873b17eaa71; i++) {
                player thread doScoreEvent(#"tag_score");
            }
        }
        if ((function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) && isdefined(player.cranked) && player.cranked) {
            player scripts/mp/cranked::setcrankedplayerbombtimer("kill");
        }
        wait(level.banktime);
    }
    zone setneutralicons();
    player.isscoring = 0;
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df1
// Size: 0x1b5
function scoreamount(player, numtags, zone) {
    player playersettagcount(player.tagscarried - numtags);
    scripts/mp/gamescore::giveteamscoreforobjective(player.team, numtags, 0);
    player incpersstat("confirmed", numtags);
    player scripts/mp/persistence::statsetchild("round", "confirmed", player.pers["confirmed"]);
    player setextrascore0(player.pers["confirmed"]);
    if (level.bankdisable) {
        zone.tagsdeposited = zone.tagsdeposited + numtags;
        if (zone.tagsdeposited >= level.bankdisabletags) {
            zone scripts/mp/gameobjects::allowuse("none");
            zone thread waitthensetvisibleteam();
            zone.disabled = 1;
            zone.scriptable setscriptablepartstate("flag", "off");
            zone.scriptable setscriptablepartstate("pulse", "off");
            if (isdefined(zone.objectivekey)) {
                foreach (entry in level.teamnamelist) {
                    scripts/mp/utility/dialog::statusdialog("grind_disable_" + zone.objectivekey, entry);
                }
            }
            if (level.bankdisabletime == 0) {
                return;
            }
            zone thread waitthenenablezone();
        }
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fad
// Size: 0x6e
function waitthensetvisibleteam() {
    foreach (player in level.players) {
        scripts/mp/objidpoolmanager::objective_unpin_player(self.objidnum, player);
    }
    waitframe();
    scripts/mp/gameobjects::setvisibleteam("none");
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2022
// Size: 0xc0
function waitthenenablezone() {
    level endon("game_ended");
    wait(level.bankdisabletime);
    self.disabled = 0;
    self.scriptable setscriptablepartstate("flag", "idle");
    scripts/mp/gameobjects::allowuse("any");
    scripts/mp/gameobjects::setvisibleteam("any");
    if (isdefined(self.objectivekey)) {
        foreach (entry in level.teamnamelist) {
            scripts/mp/utility/dialog::statusdialog("grind_enable_" + self.objectivekey, entry);
        }
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e9
// Size: 0x1a5
function initspawns() {
    if (function_bff229a11ecd1e34()) {
        scripts/mp/spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts/mp/spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    scripts/mp/spawnlogic::addstartspawnpoints("mp_tdm_spawn_allies_start");
    scripts/mp/spawnlogic::addstartspawnpoints("mp_tdm_spawn_axis_start");
    scripts/mp/spawnlogic::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    scripts/mp/spawnlogic::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_axis_start");
    scripts/mp/spawnlogic::registerspawnset("start_attackers", attackers);
    scripts/mp/spawnlogic::registerspawnset("start_defenders", defenders);
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn");
    spawnssecondary = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_secondary");
    scripts/mp/spawnlogic::registerspawnset("normal", spawns);
    scripts/mp/spawnlogic::registerspawnset("fallback", spawnssecondary);
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2295
// Size: 0x83
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    if (scripts/mp/spawnlogic::shoulduseteamstartspawn()) {
        spawnpoints = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_" + spawnteam + "_start");
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint_startspawn(spawnpoints);
    } else {
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "normal", "fallback");
    }
    return spawnpoint;
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2320
// Size: 0x4c
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    level thread droptags(victim, attacker);
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2373
// Size: 0xff
function droptags(victim, attacker) {
    if (isagent(victim)) {
        return;
    }
    if (victim.tagscarried > 49) {
        dropnumber = 49;
    } else if (victim.tagscarried > 0) {
        dropnumber = victim.tagscarried;
    } else {
        dropnumber = 0;
    }
    for (counter = 0; counter < dropnumber; counter++) {
        newtag = spawntag(victim);
        newtag.team = victim.team;
        newtag.victim = victim;
        newtag.attacker = attacker;
        level notify("new_tag_spawned", newtag);
        level thread monitortaguse(newtag);
    }
    var_70bd2c443105990a = victim.tagscarried - dropnumber;
    var_70bd2c443105990a = int(max(0, var_70bd2c443105990a));
    victim playersettagcount(var_70bd2c443105990a);
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2479
// Size: 0x2e
function dogtagallyonusecb(player) {
    if (isplayer(player)) {
        player setextrascore1(player.pers["denied"]);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ae
// Size: 0x113
function setupwaypointicons() {
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_bank_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_BANK_CAPS", "icon_waypoint_dom_a", 0);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_bank_b", 0, "neutral", "MP_INGAME_ONLY/OBJ_BANK_CAPS", "icon_waypoint_dom_b", 0);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_scoring_foe_a", 2, "enemy", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_a", 1);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_scoring_foe_b", 2, "enemy", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_b", 1);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_scoring_friend_a", 2, "friendly", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_a", 1);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_scoring_friend_b", 2, "friendly", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_b", 1);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_a", 1);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_contested_b", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_b", 1);
    var_8586a09e62c831f5 = "MP_INGAME_ONLY/OBJ_BANK_CAPS";
    var_8586a09e62c831f5 = "MP_INGAME_ONLY/OBJ_SCORING_CAPS";
    var_8586a09e62c831f5 = "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS";
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c8
// Size: 0x1aa
function removepoint() {
    self endon("game_ended");
    while (true) {
        if (getdvar(@"hash_6ce167f2cdc8ef7c", "") != "") {
            flaglabel = getdvar(@"hash_6ce167f2cdc8ef7c", "");
            foreach (zone in level.objectives) {
                if (isdefined(zone.objectivekey) && zone.objectivekey == flaglabel) {
                    zone notify("stop_trigger" + zone.objectivekey);
                    zone scripts/mp/gameobjects::allowuse("none");
                    zone.trigger = undefined;
                    zone notify("deleted");
                    zone.visibleteam = "none";
                    zone scripts/mp/gameobjects::setobjectivestatusicons(undefined, undefined);
                    tempflags = [];
                    foreach (objective in level.objectives) {
                        if (objective.objectivekey != flaglabel) {
                            tempflags[objective.objectivekey] = objective;
                        }
                    }
                    level.objectives = tempflags;
                    break;
                }
            }
            setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "");
        }
        wait(1);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2779
// Size: 0x4a2
function placepoint() {
    self endon("game_ended");
    while (true) {
        if (getdvar(@"hash_29d45d6822a1cf6d", "") != "") {
            flaglabel = getdvar(@"hash_29d45d6822a1cf6d", "");
            trigger = undefined;
            grindtriggers = getentarray("grind_location", "targetname");
            foreach (grindzone in grindtriggers) {
                if ("_" + grindzone.script_label == flaglabel) {
                    trigger = grindzone;
                }
            }
            trigger.origin = level.players[0].origin;
            trigger.ownerteam = "neutral";
            tracestart = trigger.origin + (0, 0, 32);
            traceend = trigger.origin + (0, 0, -32);
            trace = scripts/engine/trace::ray_trace(tracestart, traceend, undefined, scripts/engine/trace::create_default_contents(1));
            trigger.origin = trace["position"];
            trigger.upangles = vectortoangles(trace["normal"]);
            trigger.forward = anglestoforward(trigger.upangles);
            trigger.right = anglestoright(trigger.upangles);
            visuals[0] = spawn("script_model", trigger.origin);
            visuals[0].angles = trigger.angles;
            clonetrigger = spawn("trigger_radius", trigger.origin, 0, 90, 128);
            clonetrigger.script_label = trigger.script_label;
            trigger = clonetrigger;
            zone = scripts/mp/gameobjects::createuseobject("neutral", trigger, visuals, (0, 0, 100));
            if (isdefined(trigger.objectivekey)) {
                zone.objectivekey = trigger.objectivekey;
            } else {
                zone.objectivekey = zone scripts/mp/gameobjects::getlabel();
            }
            if (isdefined(trigger.iconname)) {
                zone.iconname = trigger.iconname;
            } else {
                zone.iconname = zone scripts/mp/gameobjects::getlabel();
            }
            zone thread runzonethink();
            zone scripts/mp/gameobjects::allowuse("enemy");
            zone scripts/mp/gameobjects::setusetime(level.bankcapturetime);
            zone scripts/mp/gameobjects::setobjectivestatusicons("waypoint_defend", "waypoint_bank");
            zone scripts/mp/gameobjects::setvisibleteam("any");
            zone scripts/mp/gameobjects::cancontestclaim(1);
            zone.onuse = &zone_onuse;
            zone.onbeginuse = &zone_onusebegin;
            zone.onunoccupied = &zone_onunoccupied;
            zone.oncontested = &zone_oncontested;
            zone.onuncontested = &zone_onuncontested;
            zone.claimgracetime = level.bankcapturetime * 1000;
            tracestart = zone.visuals[0].origin + (0, 0, 32);
            traceend = zone.visuals[0].origin + (0, 0, -32);
            contentoverride = scripts/engine/trace::create_contents(1, 1, 1, 1, 0, 1, 1);
            ignoreents = [];
            trace = scripts/engine/trace::ray_trace(tracestart, traceend, ignoreents, contentoverride);
            zone.baseeffectpos = trace["position"];
            upangles = vectortoangles(trace["normal"]);
            upangles = -1 * upangles;
            zone.baseeffectforward = anglestoforward(upangles);
            zone setneutral();
            level.objectives[zone.objectivekey] = zone;
            setdynamicdvar(@"hash_29d45d6822a1cf6d", "");
        }
        wait(1);
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c22
// Size: 0xb6
function function_6e31fb115404c96d(slabel, vorigin) {
    grind_locations = getentarray("grind_location", "targetname");
    /#
        assertex(isdefined(slabel) && (slabel == "a" || slabel == "b"), "Unexpected label, label need to be 'a' or 'b' ");
    #/
    foreach (obj in grind_locations) {
        if (obj.script_label == slabel) {
            obj.origin = vorigin;
        }
    }
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cdf
// Size: 0x1a2
function function_cd969857178097d0() {
    /#
        self endon("megaBankBonus");
        while (true) {
            if (getdvarint(@"hash_ec6d489d470bc2ad") != 0) {
                foreach (player in level.players) {
                    if (player.team == "ui_grind_tags") {
                        player.tagscarried = player.tagscarried + getdvarint(@"hash_ec6d489d470bc2ad");
                        player setclientomnvar("useObject", player.tagscarried);
                    }
                }
                break;
            } else if (getdvarint(@"hash_6f6849bde2dd82a2") != 0) {
                foreach (player in level.players) {
                    if (player.team == "script_vehicle") {
                        player.tagscarried = player.tagscarried + getdvarint(@"hash_6f6849bde2dd82a2");
                        player setclientomnvar("useObject", player.tagscarried);
                    }
                }
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_ec6d489d470bc2ad", 0);
        setdevdvar(@"hash_6f6849bde2dd82a2", 0);
        thread function_cd969857178097d0();
    #/
}

// Namespace grind / scripts/mp/gametypes/grind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e88
// Size: 0xa5
function function_d859ebf3629052fb() {
    /#
        self endon("megaBankBonus");
        while (true) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                scripts/mp/gamescore::giveteamscoreforobjective("ui_grind_tags", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                scripts/mp/gamescore::giveteamscoreforobjective("script_vehicle", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_d859ebf3629052fb();
    #/
}

