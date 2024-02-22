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

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x826
// Size: 0x216
function main() {
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "dom";
    namespace_19b4203b51d56488::main(allowed);
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
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
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

// Namespace grind/namespace_ca106a843d09cdd4
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

// Namespace grind/namespace_ca106a843d09cdd4
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

// Namespace grind/namespace_ca106a843d09cdd4
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
    } else if (level.bankdisabletags == 0 && scorelimit > 0) {
        level.bankdisabletags = int(scorelimit);
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x3a
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bank_tags");
    if (isdefined(self.tagscarried)) {
        self setclientomnvar("ui_grind_tags", self.tagscarried);
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x23
function onsuicidedeath(victim) {
    self setclientomnvar("ui_grind_tags", 0);
    level thread droptags(victim);
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63
// Size: 0x21c
function createtags() {
    level.dogtags = [];
    for (i = 0; i < 50; i++) {
        visuals[0] = spawn("script_model", (0, 0, 0));
        visuals[1] = spawn("script_model", (0, 0, 0));
        visuals[0] setmodel(namespace_ba880bc821ba2f06::function_c8a7bf223baf8a6c());
        visuals[1] setmodel(namespace_ba880bc821ba2f06::function_1e4c1c053ea20dd5());
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
        var_34744859ad58739b = spawnstruct();
        var_34744859ad58739b.type = "useObject";
        var_34744859ad58739b.curorigin = trigger.origin;
        var_34744859ad58739b.entnum = trigger getentitynumber();
        var_34744859ad58739b.lastusedtime = 0;
        var_34744859ad58739b.visuals = visuals;
        var_34744859ad58739b.offset3d = (0, 0, 16);
        var_34744859ad58739b.trigger = trigger;
        var_34744859ad58739b.trigger enablelinkto();
        var_34744859ad58739b.triggertype = "proximity";
        var_34744859ad58739b namespace_19b4203b51d56488::allowuse("none");
        level.dogtags[level.dogtags.size] = var_34744859ad58739b;
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1086
// Size: 0xf6
function gettag() {
    var_5d32298b837dff31 = level.dogtags[0];
    var_3071102f98cbed33 = gettime();
    foreach (tag in level.dogtags) {
        if (!isdefined(tag.lastusedtime)) {
            continue;
        }
        if (istrue(tag.var_bcb19026623af98b)) {
            continue;
        }
        if (tag.interactteam == "none") {
            var_5d32298b837dff31 = tag;
            break;
        }
        if (tag.lastusedtime < var_3071102f98cbed33) {
            var_3071102f98cbed33 = tag.lastusedtime;
            var_5d32298b837dff31 = tag;
        }
    }
    var_5d32298b837dff31 notify("reset");
    var_5d32298b837dff31 namespace_19b4203b51d56488::initializetagpathvariables();
    var_5d32298b837dff31.lastusedtime = gettime();
    return var_5d32298b837dff31;
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1184
// Size: 0x225
function spawntag(victim) {
    droplocation = victim.origin;
    var_f835c152b2f0f136 = victim.team;
    startpos = droplocation + (0, 0, 14);
    zoffset = 35;
    stance = victim getstance();
    if (stance == "prone") {
        zoffset = 14;
    }
    if (stance == "crouch") {
        zoffset = 25;
    }
    var_9c19496ce8106e6b = droplocation + namespace_ba880bc821ba2f06::function_4b5bf3a3091d471e();
    randomangle = (0, randomfloat(360), 0);
    var_a76189155f382805 = anglestoforward(randomangle);
    var_a73587155f07bd39 = randomfloatrange(30, 150);
    var_57c87883ae437750 = 0.5;
    testpos = startpos + var_a73587155f07bd39 * var_a76189155f382805;
    var_b809b8f732448a84 = playerphysicstrace(startpos, testpos);
    var_34744859ad58739b = gettag();
    var_34744859ad58739b.curorigin = var_9c19496ce8106e6b;
    var_34744859ad58739b.trigger.origin = var_9c19496ce8106e6b;
    var_34744859ad58739b.visuals[0].origin = var_9c19496ce8106e6b;
    var_34744859ad58739b.visuals[1].origin = var_9c19496ce8106e6b;
    var_34744859ad58739b.team = victim.team;
    var_34744859ad58739b.interactteam = "any";
    var_34744859ad58739b.trigger show();
    var_34744859ad58739b.trigger linkto(var_34744859ad58739b.visuals[0], "tag_origin");
    var_34744859ad58739b.trigger linkto(var_34744859ad58739b.visuals[1], "tag_origin");
    playsoundatpos(startpos, "mp_grind_token_drop");
    namespace_ba880bc821ba2f06::function_f793a9fd32c1a72b(var_34744859ad58739b);
    var_34744859ad58739b thread tagmoveto(var_f835c152b2f0f136, var_9c19496ce8106e6b, var_b809b8f732448a84, var_57c87883ae437750);
    return var_34744859ad58739b;
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0x148
function tagmoveto(var_f835c152b2f0f136, var_9c19496ce8106e6b, var_b809b8f732448a84, time) {
    namespace_19b4203b51d56488::allowuse("any");
    self.visuals[0] showtoteam(self, getotherteam(var_f835c152b2f0f136)[0]);
    self.visuals[1] showtoteam(self, var_f835c152b2f0f136);
    self.visuals[0] setasgametypeobjective();
    self.visuals[1] setasgametypeobjective();
    gravity = getdvarint(@"hash_b5d7d39d32720e78");
    dist = distance(var_9c19496ce8106e6b, var_b809b8f732448a84);
    delta = var_b809b8f732448a84 - var_9c19496ce8106e6b;
    drop = 0.5 * gravity * squared(time) * -1;
    vel = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self.var_7454869824e72aae = 1;
    self.visuals[0] movegravity(vel, time);
    self.visuals[1] movegravity(vel, time);
    wait(1);
    self.curorigin = var_b809b8f732448a84;
    self.var_7454869824e72aae = undefined;
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1500
// Size: 0x47
function showtoteam(gameobject, team) {
    gameobject endon("death");
    gameobject endon("reset");
    if (self isscriptable()) {
        self setscriptablepartstate("visibility", "show", 0);
    } else {
        self show();
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154e
// Size: 0x27a
function monitortaguse(tag) {
    level endon("game_ended");
    tag endon("deleted");
    tag endon("reset");
    while (1) {
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
        tag namespace_19b4203b51d56488::allowuse("none");
        player playersettagcount(player.tagscarried + 1);
        player thread doscoreevent(#"hash_b89e7559b23a1287");
        player playsound("mp_grind_token_pickup");
        if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) {
            if (isdefined(player.cranked) && player.cranked) {
                player namespace_58012cf453ba1014::setcrankedplayerbombtimer("kill");
            } else {
                player namespace_58012cf453ba1014::oncranked(undefined, player);
            }
        }
        break;
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cf
// Size: 0x22
function onplayerconnect(player) {
    player.isscoring = 0;
    player thread monitorjointeam();
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f8
// Size: 0x3a
function playersettagcount(var_d86673173e8641be) {
    self.tagscarried = var_d86673173e8641be;
    self.game_extrainfo = var_d86673173e8641be;
    if (var_d86673173e8641be > 999) {
        var_d86673173e8641be = 999;
    }
    self setclientomnvar("ui_grind_tags", var_d86673173e8641be);
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1839
// Size: 0x2b
function monitorjointeam() {
    self endon("disconnect");
    while (1) {
        waittill_any_2("joined_team", "joined_spectators");
        playersettagcount(0);
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x186b
// Size: 0x26
function hidehudelementongameend(var_6b53a43e91b3d1a2) {
    level waittill("game_ended");
    if (isdefined(var_6b53a43e91b3d1a2)) {
        var_6b53a43e91b3d1a2.alpha = 0;
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
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
        var_91e3043c367e21f8 = spawnstruct();
        var_91e3043c367e21f8.origin = (1416, 1368, 300);
        var_91e3043c367e21f8.angles = (0, 0, 0);
        var_91e3043c367e21f8.script_label = "b";
        zone = namespace_74694cc3e6d15844::setupobjective(var_91e3043c367e21f8, 1, 1);
        zone thread runzonethink();
        level.objectives[zone.objectivekey] = zone;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    foreach (zone in level.objectives) {
        var_3c2389ba69e5822b = getreservedobjid(zone.objectivekey);
        zone namespace_19b4203b51d56488::requestid(1, 1, var_3c2389ba69e5822b);
        zone namespace_19b4203b51d56488::setvisibleteam("any");
        zone setobjectivecallbacks();
        zone setneutral();
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8e
// Size: 0x52
function isinzone(player, zone) {
    if (isreallyalive(player) && player istouching(zone.trigger) && zone.ownerteam == player.team) {
        return 1;
    }
    return 0;
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae8
// Size: 0x9e
function runzonethink() {
    level endon("game_ended");
    self endon("stop_trigger" + self.objectivekey);
    while (1) {
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

// Namespace grind/namespace_ca106a843d09cdd4
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

// Namespace grind/namespace_ca106a843d09cdd4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c13
// Size: 0x1d7
function processscoring(player, zone) {
    while (player.tagscarried && isinzone(player, zone) && !zone.stalemate && !zone.disabled) {
        if (player.tagscarried >= level.megabanklimit) {
            player playsoundtoplayer("mp_grind_token_banked_large", player);
            scoreamount(player, level.megabanklimit, zone);
            points = namespace_62c556437da28f50::getscoreinfovalue(#"hash_bc82bd9caa5693ce");
            points = points * level.megabanklimit;
            if (!player namespace_82dcd1d5ae30ff7::_hasperk("specialty_killstreak_to_scorestreak")) {
                player namespace_58a74e7d54b56e8d::givestreakpoints(#"capture", level.megabankbonusks);
            }
            player thread doscoreevent(#"hash_32d643f803437aaa", undefined, points + level.megabankbonus);
            player incpersstat("tagsMegaBanked", 1);
        } else {
            player playsoundtoplayer("mp_grind_token_banked", player);
            var_1b445873b17eaa71 = level.bankrate;
            if (var_1b445873b17eaa71 > player.tagscarried) {
                var_1b445873b17eaa71 = player.tagscarried;
            }
            scoreamount(player, var_1b445873b17eaa71, zone);
            for (i = 0; i < var_1b445873b17eaa71; i++) {
                player thread doscoreevent(#"hash_bc82bd9caa5693ce");
            }
        }
        if ((function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) && isdefined(player.cranked) && player.cranked) {
            player namespace_58012cf453ba1014::setcrankedplayerbombtimer("kill");
        }
        wait(level.banktime);
    }
    zone setneutralicons();
    player.isscoring = 0;
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df1
// Size: 0x1b5
function scoreamount(player, var_c1b3d6b48e668752, zone) {
    player playersettagcount(player.tagscarried - var_c1b3d6b48e668752);
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(player.team, var_c1b3d6b48e668752, 0);
    player incpersstat("confirmed", var_c1b3d6b48e668752);
    player namespace_2685ec368e022695::statsetchild("round", "confirmed", player.pers["confirmed"]);
    player setextrascore0(player.pers["confirmed"]);
    if (level.bankdisable) {
        zone.tagsdeposited = zone.tagsdeposited + var_c1b3d6b48e668752;
        if (zone.tagsdeposited >= level.bankdisabletags) {
            zone namespace_19b4203b51d56488::allowuse("none");
            zone thread waitthensetvisibleteam();
            zone.disabled = 1;
            zone.scriptable setscriptablepartstate("flag", "off");
            zone.scriptable setscriptablepartstate("pulse", "off");
            if (isdefined(zone.objectivekey)) {
                foreach (entry in level.teamnamelist) {
                    namespace_944ddf7b8df1b0e3::statusdialog("grind_disable_" + zone.objectivekey, entry);
                }
            }
            if (level.bankdisabletime == 0) {
                goto LOC_000001b3;
            }
            zone thread waitthenenablezone();
        LOC_000001b3:
        }
    LOC_000001b3:
    }
LOC_000001b3:
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fad
// Size: 0x6e
function waitthensetvisibleteam() {
    foreach (player in level.players) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.objidnum, player);
    }
    waitframe();
    namespace_19b4203b51d56488::setvisibleteam("none");
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2022
// Size: 0xc0
function waitthenenablezone() {
    level endon("game_ended");
    wait(level.bankdisabletime);
    self.disabled = 0;
    self.scriptable setscriptablepartstate("flag", "idle");
    namespace_19b4203b51d56488::allowuse("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    if (isdefined(self.objectivekey)) {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("grind_enable_" + self.objectivekey, entry);
        }
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e9
// Size: 0x1a5
function initspawns() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2295
// Size: 0x83
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_" + spawnteam + "_start");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "normal", "fallback");
    }
    return spawnpoint;
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2320
// Size: 0x4c
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    level thread droptags(victim, attacker);
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2373
// Size: 0xff
function droptags(victim, attacker) {
    if (isagent(victim)) {
        return;
    }
    if (victim.tagscarried > 49) {
        var_a28b6fb6a6902689 = 49;
    } else if (victim.tagscarried > 0) {
        var_a28b6fb6a6902689 = victim.tagscarried;
    } else {
        var_a28b6fb6a6902689 = 0;
    }
    for (counter = 0; counter < var_a28b6fb6a6902689; counter++) {
        var_34744859ad58739b = spawntag(victim);
        var_34744859ad58739b.team = victim.team;
        var_34744859ad58739b.victim = victim;
        var_34744859ad58739b.attacker = attacker;
        level notify("new_tag_spawned", var_34744859ad58739b);
        level thread monitortaguse(var_34744859ad58739b);
    }
    var_70bd2c443105990a = victim.tagscarried - var_a28b6fb6a6902689;
    var_70bd2c443105990a = int(max(0, var_70bd2c443105990a));
    victim playersettagcount(var_70bd2c443105990a);
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2479
// Size: 0x2e
function dogtagallyonusecb(player) {
    if (isplayer(player)) {
        player setextrascore1(player.pers["denied"]);
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ae
// Size: 0x113
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bank_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_BANK_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bank_b", 0, "neutral", "MP_INGAME_ONLY/OBJ_BANK_CAPS", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_scoring_foe_a", 2, "enemy", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_a", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_scoring_foe_b", 2, "enemy", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_b", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_scoring_friend_a", 2, "friendly", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_a", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_scoring_friend_b", 2, "friendly", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_b", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_a", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested_b", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_b", 1);
    var_8586a09e62c831f5 = "MP_INGAME_ONLY/OBJ_BANK_CAPS";
    var_8586a09e62c831f5 = "MP_INGAME_ONLY/OBJ_SCORING_CAPS";
    var_8586a09e62c831f5 = "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS";
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c8
// Size: 0x1aa
function removepoint() {
    self endon("game_ended");
    while (1) {
        if (getdvar(@"hash_6ce167f2cdc8ef7c", "") != "") {
            var_45360a7a32781f43 = getdvar(@"hash_6ce167f2cdc8ef7c", "");
            foreach (zone in level.objectives) {
                if (isdefined(zone.objectivekey) && zone.objectivekey == var_45360a7a32781f43) {
                    zone notify("stop_trigger" + zone.objectivekey);
                    zone namespace_19b4203b51d56488::allowuse("none");
                    zone.trigger = undefined;
                    zone notify("deleted");
                    zone.visibleteam = "none";
                    zone namespace_19b4203b51d56488::setobjectivestatusicons(undefined, undefined);
                    var_3dabce211c987a42 = [];
                    foreach (objective in level.objectives) {
                        if (objective.objectivekey != var_45360a7a32781f43) {
                            var_3dabce211c987a42[objective.objectivekey] = objective;
                        }
                    }
                    level.objectives = var_3dabce211c987a42;
                    break;
                }
            }
            setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "");
        }
        wait(1);
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2779
// Size: 0x4a2
function placepoint() {
    self endon("game_ended");
    while (1) {
        if (getdvar(@"hash_29d45d6822a1cf6d", "") != "") {
            var_45360a7a32781f43 = getdvar(@"hash_29d45d6822a1cf6d", "");
            trigger = undefined;
            var_fd3c4aa0cf99af2c = getentarray("grind_location", "targetname");
            foreach (var_ed25d2268d25175b in var_fd3c4aa0cf99af2c) {
                if ("_" + var_ed25d2268d25175b.script_label == var_45360a7a32781f43) {
                    trigger = var_ed25d2268d25175b;
                }
            }
            trigger.origin = level.players[0].origin;
            trigger.ownerteam = "neutral";
            tracestart = trigger.origin + (0, 0, 32);
            traceend = trigger.origin + (0, 0, -32);
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
            trigger.origin = trace["position"];
            trigger.upangles = vectortoangles(trace["normal"]);
            trigger.forward = anglestoforward(trigger.upangles);
            trigger.right = anglestoright(trigger.upangles);
            visuals[0] = spawn("script_model", trigger.origin);
            visuals[0].angles = trigger.angles;
            var_25d213b4714288ce = spawn("trigger_radius", trigger.origin, 0, 90, 128);
            var_25d213b4714288ce.script_label = trigger.script_label;
            trigger = var_25d213b4714288ce;
            zone = namespace_19b4203b51d56488::createuseobject("neutral", trigger, visuals, (0, 0, 100));
            if (isdefined(trigger.objectivekey)) {
                zone.objectivekey = trigger.objectivekey;
            } else {
                zone.objectivekey = zone namespace_19b4203b51d56488::getlabel();
            }
            if (isdefined(trigger.iconname)) {
                zone.iconname = trigger.iconname;
            } else {
                zone.iconname = zone namespace_19b4203b51d56488::getlabel();
            }
            zone thread runzonethink();
            zone namespace_19b4203b51d56488::allowuse("enemy");
            zone namespace_19b4203b51d56488::setusetime(level.bankcapturetime);
            zone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_bank");
            zone namespace_19b4203b51d56488::setvisibleteam("any");
            zone namespace_19b4203b51d56488::cancontestclaim(1);
            zone.onuse = &zone_onuse;
            zone.onbeginuse = &zone_onusebegin;
            zone.onunoccupied = &zone_onunoccupied;
            zone.oncontested = &zone_oncontested;
            zone.onuncontested = &zone_onuncontested;
            zone.claimgracetime = level.bankcapturetime * 1000;
            tracestart = zone.visuals[0].origin + (0, 0, 32);
            traceend = zone.visuals[0].origin + (0, 0, -32);
            contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
            ignoreents = [];
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
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

// Namespace grind/namespace_ca106a843d09cdd4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c22
// Size: 0xb6
function function_6e31fb115404c96d(var_6830baf45d9bf3cc, vorigin) {
    var_5d8560bd09196d7e = getentarray("grind_location", "targetname");
    /#
        assertex(isdefined(var_6830baf45d9bf3cc) && (var_6830baf45d9bf3cc == "a" || var_6830baf45d9bf3cc == "b"), "Unexpected label, label need to be 'a' or 'b' ");
    #/
    foreach (obj in var_5d8560bd09196d7e) {
        if (obj.script_label == var_6830baf45d9bf3cc) {
            obj.origin = vorigin;
        }
    }
}

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cdf
// Size: 0x1a2
function function_cd969857178097d0() {
    /#
        self endon("megaBankBonus");
        while (1) {
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

// Namespace grind/namespace_ca106a843d09cdd4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e88
// Size: 0xa5
function function_d859ebf3629052fb() {
    /#
        self endon("megaBankBonus");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("ui_grind_tags", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("script_vehicle", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_d859ebf3629052fb();
    #/
}

