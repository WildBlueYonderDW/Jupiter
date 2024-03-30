// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_548072087c9fd504;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\events.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\dd.gsc;
#using script_7c07dabb66babf80;
#using scripts\mp\rank.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\playerlogic.gsc;

#namespace obj_bombzone;

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe
// Size: 0x764
function setupobjective(trigger, skipobjid, var_5ddbc1faed2c56e6) {
    bombzone = undefined;
    label = undefined;
    if (isdefined(level.curobj)) {
        level.curobj scripts/mp/gameobjects::deleteuseobject();
    }
    if (isdefined(trigger.originalpos)) {
        trigger.origin = trigger.originalpos;
    } else {
        trigger.originalpos = trigger.origin;
    }
    visuals = undefined;
    if (isdefined(trigger.target)) {
        visuals = getentarray(trigger.target, "targetname");
    }
    if (isdefined(trigger.objectivekey)) {
        objectivekey = trigger.objectivekey;
    } else {
        objectivekey = trigger.script_label;
    }
    if (istrue(var_5ddbc1faed2c56e6)) {
        var_3c2389ba69e5822b = getreservedobjid(objectivekey);
    } else {
        var_3c2389ba69e5822b = undefined;
    }
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d == #"dd") {
        label = trigger.script_label;
        collision = getent("dd_bombzone_clip" + label, "targetname");
        if (inovertime()) {
            if (label == "_a" || label == "_b") {
                trigger delete();
                visuals[0] delete();
                collision delete();
                return;
            }
            bombzone = scripts/mp/gameobjects::createuseobject("neutral", trigger, visuals, (0, 0, 64), var_3c2389ba69e5822b, skipobjid);
            bombzone scripts/mp/gameobjects::allowuse("any");
            bombzone.trigger.script_label = "_a";
        } else if (label == "_c") {
            trigger delete();
            visuals[0] delete();
            collision delete();
            return;
        }
    } else if (getbasegametype() == "sd") {
        setomnvar("ui_bomb_owner_team", 0);
    }
    if (!isdefined(bombzone)) {
        scriptedbombzone = 0;
        if (!isdefined(visuals)) {
            scriptedbombzone = 1;
            defusetrigger = spawn("script_model", trigger.origin);
            defusetrigger makeusable();
            defusetrigger.usetype = 1;
            defusetrigger.isuseobject = 1;
            defusetrigger.skiptouching = 1;
            visuals[0] = trigger;
            visuals[0].bombdefusetrig = defusetrigger;
        }
        if (var_c8f4c582625f492d == #"robj") {
            bombzone = scripts/mp/gameobjects::createuseobject("neutral", trigger, visuals, (0, 0, 64), var_3c2389ba69e5822b, skipobjid);
            bombzone scripts/mp/gameobjects::allowuse("any");
        } else {
            bombzone = scripts/mp/gameobjects::createuseobject(game["defenders"], trigger, visuals, (0, 0, 64), var_3c2389ba69e5822b, skipobjid);
            bombzone scripts/mp/gameobjects::allowuse("enemy");
        }
        if (scriptedbombzone == 1) {
            bombzone.trigger makeusable();
            bombzone.skiptouching = 1;
        }
    }
    if (isdefined(trigger.objectivekey)) {
        bombzone.objectivekey = trigger.objectivekey;
    } else {
        bombzone.objectivekey = bombzone scripts/mp/gameobjects::getlabel();
    }
    if (isdefined(trigger.iconname)) {
        bombzone.iconname = trigger.iconname;
    } else {
        bombzone.iconname = bombzone scripts/mp/gameobjects::getlabel();
    }
    bombzone.id = "bomb_zone";
    bombzone.trigger setusepriority(-1 - 1 - 1 - 1);
    bombzone scripts/mp/gameobjects::setusetime(level.planttime);
    bombzone scripts/mp/gameobjects::setwaitweaponchangeonuse(0);
    bombzone scripts/mp/gameobjects::setusehinttext("MP/HOLD_TO_PLANT_EXPLOSIVES");
    bombzone.trigger setuseholdduration("duration_none");
    if (!level.multibomb) {
        bombzone scripts/mp/gameobjects::setkeyobject(level.sdbomb);
    }
    if (bombzone.objectivekey == "_c" && var_c8f4c582625f492d != #"gwbomb") {
        bombzone.objectivekey = "_a";
        bombzone.iconname = "_a";
    }
    if (var_c8f4c582625f492d == #"cmd" && inovertime()) {
        bombzone scripts/mp/gameobjects::setobjectivestatusicons("waypoint_target");
        bombzone scripts/mp/gameobjects::setvisibleteam("any");
    }
    bombzone.usecondition = &function_d3516b464bf6e8b4;
    bombzone.onbeginuse = &bombzone_onbeginuse;
    bombzone.onenduse = &bombzone_onenduse;
    bombzone.onuse = &bombzone_onuseplantobject;
    bombzone.oncantuse = &bombzone_oncantuse;
    bombzone.useweapon = makeweapon("briefcase_bomb_mp");
    bombzone.bombplanted = 0;
    bombzone.bombexploded = undefined;
    bombzone.resetprogress = level.resetprogress;
    for (i = 0; i < visuals.size; i++) {
        if (isdefined(visuals[i].script_exploder)) {
            bombzone.exploderindex = visuals[i].script_exploder;
            visuals[i] thread function_f1ce924cd6279917(bombzone);
            visuals[i] thread setupkillcament(bombzone);
            break;
        }
    }
    if (var_c8f4c582625f492d != #"dd" || var_c8f4c582625f492d == #"gwbomb") {
        if (isdefined(visuals[0].target)) {
            bombzone.bombdefusetrig = getent(visuals[0].target, "targetname");
        } else if (!isdefined(bombzone.bombdefusetrig) && isdefined(visuals[0].bombdefusetrig)) {
            bombzone.bombdefusetrig = visuals[0].bombdefusetrig;
        }
        /#
            assert(isdefined(bombzone.bombdefusetrig));
        #/
        bombzone.bombdefusetrig.origin = bombzone.bombdefusetrig.origin + (0, 0, -10000);
        bombzone.bombdefusetrig.label = label;
    } else {
        trig = getent(visuals[0].target, "targetname");
        trig delete();
        bombzone.bombdefusetrig = bombzone.trigger;
    }
    bombzone.noweapondropallowedtrigger = spawn("trigger_radius", bombzone.trigger.origin, 0, 150, 60);
    if (isdefined(bombzone.trigger.target) && istrue(level.assignBombZoneChevrons)) {
        bombzone thread assignBombZoneChevrons();
    }
    function_2db76423768ca0f5(bombzone);
    return bombzone;
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142a
// Size: 0x68
function function_2db76423768ca0f5(bombzone) {
    halfbounds = bombzone.trigger function_80715c3a9a2ddf68();
    maxbound = halfbounds[0];
    if (maxbound < halfbounds[1]) {
        maxbound = halfbounds[1];
    }
    if (maxbound < halfbounds[2]) {
        maxbound = halfbounds[2];
    }
    bombzone.trigger setuserange(maxbound * 2);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1499
// Size: 0x1ce
function assignBombZoneChevrons() {
    bombzone = self;
    wait(1);
    othervisuals = getentitylessscriptablearray(bombzone.trigger.target, "targetname");
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
        if (isdefined(visual.script_noteworthy)) {
            if (visual.script_noteworthy == "2") {
                chevrons[index].numchevrons = 2;
                continue;
            }
            if (visual.script_noteworthy == "3") {
                chevrons[index].numchevrons = 3;
                continue;
            }
            if (visual.script_noteworthy == "4") {
                chevrons[index].numchevrons = 4;
            }
        }
    }
    bombzone.chevrons = chevrons;
    foreach (chevron in bombzone.chevrons) {
        for (i = 0; i < chevron.numchevrons; i++) {
            chevron setscriptablepartstate("chevron_" + i, bombzone.ownerteam);
        }
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166e
// Size: 0x2a
function getreservedobjid(objectivekey) {
    if (objectivekey == "_a") {
        reservedid = 0;
    } else {
        reservedid = 1;
    }
    return reservedid;
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a0
// Size: 0x234
function setupkillcament(bombzone) {
    temporg = spawn("script_origin", self.origin);
    temporg.angles = self.angles;
    temporg rotateyaw(-45, 0.05);
    waitframe();
    campos = undefined;
    bulletstart = self.origin + anglestoforward(temporg.angles) * 18 + (0, 0, 60);
    bulletend = self.origin + anglestoforward(temporg.angles) * 100 + (0, 0, 128);
    content = ["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle"];
    contentoverride = physics_createcontents(content);
    result = scripts/engine/trace::sphere_trace(bulletstart, bulletend, 16, [self], contentoverride);
    campos = result["shape_position"];
    if (getmapname() == "mp_skyway" && bombzone.objectivekey == "_b") {
        campos = (326, 595, 85);
    }
    self.killcament = spawn("script_model", campos);
    self.killcament setscriptmoverkillcam("explosive");
    bombzone.killcamentnum = self.killcament getentitynumber();
    temporg delete();
    /#
        if (getdvarint(@"hash_3f3a15fb7e7c9b0") > 0) {
            thread scripts/cp_mp/utility/debug_utility::drawline(bulletstart, bulletend, 999, (1, 1, 0));
            thread scripts/cp_mp/utility/debug_utility::drawsphere(bulletstart, 2, 999, (0, 1, 0));
            thread scripts/cp_mp/utility/debug_utility::drawsphere(bulletend, 2, 999, (1, 0, 0));
            thread scripts/cp_mp/utility/debug_utility::drawsphere(campos, 2, 999, (1, 0, 1));
        }
        self.killcament thread debugkillcament(self);
    #/
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18db
// Size: 0x1d1
function debugkillcament(visual) {
    /#
        self endon("explosive");
        level endon("offhand_weapons");
        visual endon("explosive");
        while (true) {
            if (getdvarint(@"hash_3f3a15fb7e7c9b0") > 0) {
                line(self.origin, self.origin + anglestoforward(self.angles) * 10, (1, 0, 0));
                line(self.origin, self.origin + anglestoright(self.angles) * 10, (0, 1, 0));
                line(self.origin, self.origin + anglestoup(self.angles) * 10, (0, 0, 1));
                line(visual.origin + (0, 0, 5), self.origin, (0, 0, 1));
                line(visual.origin, visual.origin + anglestoforward(visual.angles) * 10, (1, 0, 0));
                line(visual.origin, visual.origin + anglestoright(visual.angles) * 10, (0, 1, 0));
                line(visual.origin, visual.origin + anglestoup(visual.angles) * 10, (0, 0, 1));
            }
            waitframe();
        }
    #/
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab3
// Size: 0xf6
function allowedwhileplanting(isallowed) {
    if (!isallowed) {
        val::set("bombzone", "allow_jump", 0);
        val::set("bombzone", "gesture", 0);
        val::set("bombzone", "melee", 0);
        val::set("bombzone", "mantle", 0);
        val::set("bombzone", "offhand_weapons", 0);
        val::set("bombzone", "sprint", 0);
        val::set("bombzone", "slide", 0);
        return;
    }
    val::set("bombzone", "allow_jump", 1);
    val::set("bombzone", "gesture", 1);
    currweap = self getcurrentweapon();
    if (isdefined(currweap) && currweap.basename == "briefcase_bomb_mp") {
        self waittill("bomb_allow_offhands");
    }
    val::reset_all("bombzone");
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb0
// Size: 0x7f
function setbombplantingomnvar(bombsite) {
    wait(0.35);
    var_cabc886d846dd979 = 0;
    switch (bombsite) {
    case #"hash_fac2c5f6bddd49bd":
        var_cabc886d846dd979 = 1;
        break;
    case #"hash_fac2c2f6bddd4504":
        var_cabc886d846dd979 = 2;
        break;
    case #"hash_fac2c3f6bddd4697":
        var_cabc886d846dd979 = 2;
        break;
    default:
        var_cabc886d846dd979 = 2;
        break;
    }
    setomnvar("ui_bomb_interacting", var_cabc886d846dd979);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c36
// Size: 0x69
function setbombdefusingomnvar(bombsite) {
    wait(0.35);
    if (bombsite == "_a") {
        var_cabc886d846dd979 = 3;
    } else {
        var_cabc886d846dd979 = 4;
    }
    setomnvar("ui_bomb_interacting", var_cabc886d846dd979);
    if (level.codcasterenabled) {
        self setgametypevip(1);
    }
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(2, self.team, self getentitynumber());
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca6
// Size: 0x21e
function bombzone_onbeginuse(player) {
    player thread allowedwhileplanting(0);
    player playlocalsound("mp_bomb_raise_noise");
    if (player issprintsliding()) {
        player setstance("crouch");
    }
    if (self.bombplanted) {
        player scripts/mp/bots/bots_util::notify_enemy_bots_bomb_used("defuse");
        player notify("super_obj_drain");
        player.isdefusing = 1;
        player playsoundtoteam("jup_shared_bomb_defuse_start", player.team);
        player thread setbombdefusingomnvar(self.objectivekey);
        setomnvar("ui_bomb_defuser", player getentitynumber());
        player scripts/mp/objidpoolmanager::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS");
        if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        } else {
            if (getgametype() == "gwbomb") {
                scripts/mp/gameobjects::setobjectivestatusicons("waypoint_bomb_defusing", "waypoint_bomb_defend");
            } else {
                scripts/mp/gameobjects::setobjectivestatusicons("waypoint_bomb_defend_nt", "waypoint_bomb_defusing");
            }
            scripts/mp/objidpoolmanager::objective_teammask_removefrommask(self.radialtimeobjid, player.team);
        }
        if (isdefined(level.sdbombmodel)) {
            level.sdbombmodel hide();
        } else if (isdefined(level.ddbombmodel[self.objectivekey])) {
            level.ddbombmodel[self.objectivekey] hide();
        }
        player thread startnpcbombusesound("briefcase_bomb_defuse_mp", "equip_suitcase_defuse_button");
        return;
    }
    player scripts/mp/bots/bots_util::notify_enemy_bots_bomb_used("plant");
    player notify("super_obj_drain");
    player.isplanting = 1;
    player.bombplantweapon = self.useweapon;
    player thread setbombplantingomnvar(self.objectivekey);
    scripts/mp/utility/dialog::statusdialog("bomb_planting" + self.objectivekey, player.team, "status");
    player scripts/mp/objidpoolmanager::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_PLANTING_CAPS");
    scripts/mp/gameobjects::setobjectivestatusicons("waypoint_defend", "waypoint_bomb_planting");
    player thread startnpcbombusesound("briefcase_bomb_mp", "equip_suitcase_raise_button");
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ecb
// Size: 0x264
function bombzone_onenduse(team, player, result) {
    if (istrue(player.isdefusing) || istrue(player.isplanting)) {
        setomnvar("ui_bomb_interacting", 0);
    }
    if (istrue(player.isdefusing) && level.codcasterenabled) {
        player setgametypevip(0);
    }
    player stoplocalsound("mp_bomb_raise_noise");
    setomnvar("ui_bomb_defuser", -1);
    objid = self.objidnum;
    if (level.resetprogress) {
        scripts/mp/objidpoolmanager::objective_set_progress(objid, 0);
        scripts/mp/objidpoolmanager::objective_show_progress(objid, 0);
    }
    if (!result) {
        if (inovertime() && self.bombplanted == 0) {
            self.showprogressforteam = undefined;
        }
        if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        } else {
            if (self.bombplanted) {
                if (getgametype() == "gwbomb") {
                    scripts/mp/gameobjects::setobjectivestatusicons("waypoint_defuse", "waypoint_defend");
                } else {
                    scripts/mp/gameobjects::setobjectivestatusicons("waypoint_bomb_defend_nt", "waypoint_defuse");
                }
            } else {
                scripts/mp/gameobjects::setobjectivestatusicons("waypoint_defend", "waypoint_target");
            }
            if (isdefined(self.radialtimeobjid)) {
                scripts/mp/objidpoolmanager::objective_teammask_addtomask(self.radialtimeobjid, player.team);
            }
        }
    }
    if (!isdefined(player)) {
        return;
    }
    player thread allowedwhileplanting(1);
    player.bombplantweapon = undefined;
    if (isalive(player)) {
        player.isdefusing = 0;
        player.isplanting = 0;
    }
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", 0);
        player.ui_bomb_planting_defusing = undefined;
    }
    if (!scripts/mp/gameobjects::isfriendlyteam(player.pers["team"])) {
        if (isdefined(level.sdbombmodel) && !result) {
            if (self.bombplanted) {
                level.sdbombmodel show();
            }
        } else if (isdefined(level.ddbombmodel)) {
            if (isdefined(level.ddbombmodel[self.objectivekey]) && !result) {
                level.ddbombmodel[self.objectivekey] show();
            }
        }
    }
    player notify("gameobject_endUse");
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2136
// Size: 0xcf
function startnpcbombusesound(weaponname, soundname) {
    self endon("death");
    self endon("stopNpcBombSound");
    if (isanymlgmatch() || istrue(level.silentplant) || _hasperk("specialty_engineer")) {
        self setentitysoundcontext("silent_plant", "on");
        return;
    }
    while (true) {
        newweaponobj = self waittill("weapon_change");
        if (newweaponobj.basename == weaponname) {
            break;
        }
    }
    self playsoundtoteam(soundname, self.team, self);
    enemyteam = getotherteam(self.team)[0];
    self playsoundtoteam(soundname, enemyteam);
    self waittill("weapon_change");
    self notify("stopNpcBombSound");
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220c
// Size: 0xa1
function function_d3516b464bf6e8b4(player) {
    if (!isdefined(self) || !isdefined(self.visuals[0])) {
        return false;
    }
    if (!isdefined(player)) {
        return false;
    }
    bombzone = self.visuals[0];
    bombzoneup = vectornormalize(anglestoup(bombzone.angles));
    bombzonetoplayer = vectornormalize(player.origin - bombzone.origin);
    dotproduct = vectordot(bombzoneup, bombzonetoplayer);
    return dotproduct <= 0.5;
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b5
// Size: 0xc
function bombzone_oncantuse(player) {
    
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c8
// Size: 0x298
function bombzone_onuseplantobject(player) {
    if (inovertime() && self.bombplanted == 0 || !scripts/mp/gameobjects::isfriendlyteam(player.pers["team"])) {
        self.showprogressforteam = undefined;
        level thread bombzone_onbombplanted(self, player);
        player notify("bomb_planted");
        announcementextradata = 2;
        if (self.objectivekey == "_a") {
            announcementextradata = 1;
        }
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(0, player.team, player getentitynumber(), announcementextradata);
        player incpersstat("plants", 1);
        player scripts/mp/persistence::statsetchild("round", "plants", player.pers["plants"]);
        player scripts/mp/codcasterclientmatchdata::function_48544e365f4f5648(3, 1);
        player scripts/cp_mp/pet_watch::addplantingcharge();
        player setextrascore0(player.pers["plants"]);
        if (isdefined(level.sd_loadout) && isdefined(level.sd_loadout[player.team])) {
            player thread removebombcarrierclass();
        }
        if (getgametype() != "cmd") {
            if (inovertime()) {
                scripts/mp/utility/dialog::statusdialog("enemy_bomb_planted", getotherteam(player.team)[0], 1);
            } else {
                scripts/mp/utility/dialog::statusdialog("enemy_bomb" + self.objectivekey, getotherteam(player.team)[0], 1);
            }
            if (getgametype() == "gwbomb") {
                scripts/mp/utility/dialog::statusdialog("bomb_planted" + self.objectivekey, player.team, 1);
            } else {
                scripts/mp/utility/dialog::statusdialog("bomb_planted", player.team, 1);
            }
        }
        level thread teamplayercardsplash("callout_bombplanted", player);
        level.bombowner = player;
        player thread doScoreEvent(#"plant", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, {extraparam:self.objectivekey});
        player.bombplantedtime = gettime();
        if (isplayer(player)) {
            player scripts/cp_mp/challenges::onplant();
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = player;
            var_7e2c53b0bcf117d9.eventname = "plant";
            var_7e2c53b0bcf117d9.position = player.origin;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        }
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2567
// Size: 0x1bf
function bombzone_onusedefuseobject(player) {
    var_a345b1bc63ee3073 = 0;
    setomnvar("ui_bomb_interacting", 0);
    setomnvar("ui_victory_condition_completed", 1);
    foreach (bombsite in level.objectives) {
        if (isdefined(bombsite.objectivekey) && bombsite.objectivekey == self.objectivekey) {
            player playlocalsound("mp_bomb_defuse");
            player notify("bomb_defused" + bombsite.objectivekey);
            level thread bombdefused(bombsite);
            break;
        }
    }
    if (getgametype() != "dd" && getgametype() != "gwbomb") {
        scripts/mp/gameobjects::disableobject();
        iprintln("MP/EXPLOSIVES_DEFUSED_BY", player);
    }
    if (getgametype() == "gwbomb") {
        scripts/mp/utility/dialog::statusdialog("enemy_bomb_defused" + self.objectivekey, getotherteam(player.team)[0], 1);
        scripts/mp/utility/dialog::statusdialog("bomb_defused" + self.objectivekey, player.team, 1);
    } else {
        scripts/mp/utility/dialog::statusdialog("enemy_bomb_defused", getotherteam(player.team)[0], 1);
        scripts/mp/utility/dialog::statusdialog("bomb_defused", player.team, 1);
    }
    level thread teamplayercardsplash("callout_bombdefused", player);
    scripts/cp_mp/challenges::function_c51330573171a1be(player);
    scripts/mp/events::bombdefused(player, self);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272d
// Size: 0x1196
function bombzone_onbombplanted(destroyedobj, player) {
    level endon("bombs_canceled");
    level notify("bomb_planted", destroyedobj);
    plantteam = player.team;
    level.bombdefused = 0;
    destroyedobj.bombdefused = 0;
    if (getgametype() == "dd" && level.bombsplanted <= 0) {
        scripts/mp/gamelogic::pausetimer();
        level.timepausestart = gettime();
    }
    level.bombplanted = 1;
    level.bombsplanted = level.bombsplanted + 1;
    if (getgametype() != "btm") {
        if (getgametype() == "gwbomb") {
            if (!isdefined(level.var_16ffd04b2b868c06)) {
                level.var_16ffd04b2b868c06 = [];
                foreach (team in level.teamnamelist) {
                    level.var_16ffd04b2b868c06[team] = 0;
                }
            }
            level.var_16ffd04b2b868c06[plantteam]++;
            var_d793b74a850385e7 = getteamscore(plantteam) + level.var_16ffd04b2b868c06[plantteam];
            otherteam = getotherteam(plantteam)[0];
            var_7dba511994344efc = getteamscore(otherteam) + level.var_16ffd04b2b868c06[otherteam];
            if (var_d793b74a850385e7 >= var_7dba511994344efc) {
                level.timelimitoverride = 1;
            }
        } else {
            level.timelimitoverride = 1;
        }
    }
    level.defuseendtime = int(gettime() + level.bombtimer * 1000);
    if (destroyedobj.objectivekey == "_a") {
        level.aplanted = 1;
    } else {
        level.bplanted = 1;
    }
    setbombtimeromnvars(player.team);
    level.destroyedobject = destroyedobj;
    level.destroyedobject.bombplanted = 1;
    if (!level.multibomb) {
        player setclientomnvar("ui_carrying_bomb", 0);
        setomnvar("ui_bomb_carrier", -1);
        setgameendtime(level.defuseendtime);
    }
    destroyedobj.visuals[0] thread scripts/mp/gamelogic::playtickingsound();
    level.tickingobject = destroyedobj.visuals[0];
    if (!level.multibomb) {
        level.sdbomb scripts/mp/gameobjects::allowcarry("none");
        if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
            level.sdbombmodel unlink(1);
            if (game["attackers"] == "allies") {
                level.sdbombmodel.scriptable setscriptablepartstate("bomb", "plantedAllies");
            } else {
                level.sdbombmodel.scriptable setscriptablepartstate("bomb", "plantedAxis");
            }
        } else {
            level.sdbomb scripts/mp/gameobjects::setvisibleteam("none");
            var_8f59c9f0558fa031 = function_5784fd1cddbd00d3();
            level.sdbomb scripts/mp/gameobjects::setdropped(undefined, ter_op(var_8f59c9f0558fa031 > 0, var_8f59c9f0558fa031, undefined), getdvarint(@"hash_9cf963b64e1223e7", 0) == 1);
            level.sdbombmodel = level.sdbomb.visuals[0];
            level.sdbombmodel setasgametypeobjective();
            level.sdbomb scripts/mp/gameobjects::releaseid(1, 1);
        }
        level.sdbombmodel function_5226227bce83ebe9(1, plantteam);
    } else if (getgametype() == "cmd" || getgametype() == "gwbomb") {
    } else if (getgametype() == "dd" || getgametype() == "btm") {
        level.ddbombmodel[destroyedobj.objectivekey] = spawn("script_model", player.origin);
        level.ddbombmodel[destroyedobj.objectivekey].angles = player.angles;
        level.ddbombmodel[destroyedobj.objectivekey] setmodel("offhand_2h_wm_briefcase_bomb_v0");
        level.ddbombmodel[destroyedobj.objectivekey] setasgametypeobjective();
        level.ddbombmodel[destroyedobj.objectivekey] setnonstick(1);
    } else if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        level.sdbombmodel unlink(1);
        if (game["attackers"] == "allies") {
            level.sdbombmodel.scriptable setscriptablepartstate("bomb", "plantedAllies");
        } else {
            level.sdbombmodel.scriptable setscriptablepartstate("bomb", "plantedAxis");
        }
    } else {
        level.sdbombmodel = spawn("script_model", player.origin);
        level.sdbombmodel.angles = player.angles;
        level.sdbombmodel setmodel("offhand_2h_wm_briefcase_bomb_v0");
        level.sdbombmodel setasgametypeobjective();
        level.sdbombmodel setnonstick(1);
    }
    if (getgametype() != "dd" && getgametype() != "cmd" || getgametype() != "btm" && getgametype() != "gwbomb") {
        if (istrue(level.defendersCanSeePlantedBomb)) {
            destroyedobj scripts/mp/gameobjects::allowuse("none");
            destroyedobj scripts/mp/gameobjects::setvisibleteam("none");
        }
    }
    visuals = [];
    if (getgametype() == "dd" || getgametype() == "cmd" || getgametype() == "btm") {
        defuseobject = destroyedobj;
        defuseobject scripts/mp/gameobjects::setownerteam(player.team);
    } else if (getgametype() == "gwbomb") {
        defuseobject = destroyedobj;
    } else {
        trigger = destroyedobj.bombdefusetrig;
        trigger.origin = level.sdbombmodel.origin;
        defuseownerteam = game["attackers"];
        if (istrue(level.defendersCanSeePlantedBomb)) {
            destroyedobj scripts/mp/gameobjects::releaseid(1, 1);
        }
        defuseobject = scripts/mp/gameobjects::createuseobject(defuseownerteam, trigger, visuals, (0, 0, 32));
        scripts/mp/objidpoolmanager::objective_set_play_intro(defuseobject.objidnum, 0);
        scripts/mp/objidpoolmanager::objective_set_play_outro(defuseobject.objidnum, 0);
    }
    defuseobject.objectivekey = destroyedobj.objectivekey;
    defuseobject.iconname = destroyedobj.iconname;
    defuseobject.id = "defuse_object";
    defuseobject.trigger setusepriority(-1 - 1 - 1 - 1);
    defuseobject.usecondition = &function_8192fdad48c58795;
    defuseobject.skiptouching = 1;
    switch (getgametype()) {
    case #"hash_1aac086c17fe5ccb":
        defuseobject scripts/mp/gameobjects::allowuse("none");
        break;
    case #"hash_9a6f07d0214a87db":
        defuseobject scripts/mp/gameobjects::allowuse("friendly");
        break;
    default:
        defuseobject scripts/mp/gameobjects::allowuse("enemy");
        break;
    }
    if (istrue(level.scriptedtriggers)) {
        foreach (player in scripts/mp/utility/teams::getteamdata(game["attackers"], "players")) {
            defuseobject.trigger disableplayeruse(player);
        }
    }
    defuseobject scripts/mp/gameobjects::setusetime(level.defusetime);
    defuseobject scripts/mp/gameobjects::setwaitweaponchangeonuse(0);
    defuseobject scripts/mp/gameobjects::setusehinttext("MP/HOLD_TO_DEFUSE_EXPLOSIVES");
    defuseobject.trigger setuseholdduration("duration_none");
    if (istrue(level.defendersCanSeePlantedBomb)) {
        defuseobject scripts/mp/gameobjects::setvisibleteam("any");
    }
    if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        level.sdbombmodel.scriptable freescriptable();
        level.sdbombmodel.scriptable = spawnscriptable("offhand_2h_wm_briefcase_bomb_v0", defuseobject.trigger.origin + (0, 0, 2), (0, 0, 0));
        level.sdbombmodel.scriptable setscriptablepartstate("bomb", "plantedAllies");
    } else if (getgametype() == "gwbomb") {
        defuseobject scripts/mp/gameobjects::setobjectivestatusicons("waypoint_defuse", "waypoint_defend");
        defuseobject thread bombradialfill(plantteam, "waypoint_defuse", "waypoint_defend");
    } else {
        defuseobject scripts/mp/gameobjects::setobjectivestatusicons("waypoint_bomb_defend_nt", "waypoint_defuse_nt");
        if (getgametype() != "cmd") {
            defuseobject thread bombradialfill(plantteam, "waypoint_bomb_defend", "waypoint_defuse");
        }
    }
    if (getgametype() == "cmd" && level.cmdrules == 2) {
    } else {
        defuseobject.onbeginuse = &bombzone_onbeginuse;
        defuseobject.onenduse = &bombzone_onenduse;
        defuseobject.onuse = &bombzone_onusedefuseobject;
        defuseobject.resetprogress = level.resetprogress;
        /#
            level.defuseobject = defuseobject;
        #/
        defuseobject.useweapon = makeweapon("briefcase_bomb_defuse_mp");
    }
    level thread scripts/mp/hud_message::updatematchstatushintforallplayers(player.team, "bomb_defend", "bomb_defuse");
    destroyedobj bombtimerwait(destroyedobj.objectivekey);
    destroyedobj.visuals[0] scripts/mp/gamelogic::stoptickingsound();
    defuseobject.bombplanted = 0;
    if (level.gameended) {
        return;
    } else if (getbasegametype() == "sd" && level.bombdefused || getgametype() == "sr" && level.bombdefused) {
        defuseobject scripts/mp/gameobjects::deleteuseobject();
        return;
    }
    if (getgametype() == "dd" || getgametype() == "cmd" || getgametype() == "btm") {
        defuseobject.showprogressforteam = undefined;
        var_ce6a51c57bd722e1 = &scripts/mp/gametypes/dd::bombhandler;
        if (destroyedobj.bombdefused) {
            destroyedobj thread [[ var_ce6a51c57bd722e1 ]](player, "defused");
            destroyedobj.onuse = &bombzone_onuseplantobject;
            if (isdefined(level.ddbombmodel[destroyedobj.objectivekey])) {
                level.ddbombmodel[destroyedobj.objectivekey] delete();
            }
            return;
        } else {
            level.bombexploded = level.bombexploded + 1;
            destroyedobj thread [[ var_ce6a51c57bd722e1 ]](player, "explode", plantteam);
        }
    } else if (getgametype() == "gwbomb") {
        shouldreturn = 0;
        if (destroyedobj.bombdefused) {
            player notify("bomb_defused" + destroyedobj.objectivekey);
            destroyedobj notify("defused");
            destroyedobj scripts/mp/gameobjects::allowuse("enemy");
            destroyedobj scripts/mp/gameobjects::setobjectivestatusicons("waypoint_defend", "waypoint_target");
            destroyedobj scripts/mp/gameobjects::setusehinttext("MP/HOLD_TO_PLANT_EXPLOSIVES");
            destroyedobj.id = "bomb_zone";
            destroyedobj scripts/mp/gameobjects::setusetime(level.planttime);
            destroyedobj scripts/mp/gameobjects::setvisibleteam("any");
            destroyedobj.useweapon = makeweapon("briefcase_bomb_mp");
            destroyedobj.bombexploded = undefined;
            destroyedobj.onuse = &bombzone_onuseplantobject;
            shouldreturn = 1;
        } else {
            namespace_ab479848803b61f4::function_c0e928deb12cfa4f(destroyedobj);
            defuseobject.showprogressforteam = undefined;
            level.bombexploded = level.bombexploded + 1;
        }
        level.bombsplanted--;
        level.var_16ffd04b2b868c06[plantteam]--;
        var_d793b74a850385e7 = getteamscore(plantteam) + level.var_16ffd04b2b868c06[plantteam];
        otherteam = getotherteam(plantteam)[0];
        otherteamscore = getteamscore(otherteam);
        scorediff = var_d793b74a850385e7 - otherteamscore;
        if (level.bombsplanted == 0 || scorediff < 0) {
            level.timelimitoverride = 0;
        }
        if (shouldreturn) {
            return;
        }
    } else {
        level.bombexploded = level.bombexploded + 1;
    }
    if (getgametype() == "cmd") {
        level waittill("allow_bomb_explosion");
    }
    setomnvar("ui_victory_condition_completed", 1);
    level notify("bomb_exploded" + destroyedobj.objectivekey);
    player thread scripts/mp/rank::scoreeventpopup(#"detonate");
    player thread scripts/mp/utility/points::doScoreEvent(#"hash_67d7d6463cae5631");
    if (isdefined(level.sd_onbombtimerend)) {
        level thread [[ level.sd_onbombtimerend ]]();
    }
    if (getgametype() == "cmd" || getgametype() == "gwbomb") {
        explosionorigin = destroyedobj.curorigin;
    } else if (getgametype() == "dd" || getgametype() == "btm") {
        explosionorigin = level.ddbombmodel[destroyedobj.objectivekey].origin;
        level.ddbombmodel[destroyedobj.objectivekey] delete();
    } else {
        explosionorigin = level.sdbombmodel.origin;
        level.sdbombmodel delete();
    }
    damageoriginbase = destroyedobj.visuals[0].origin + (0, 0, 60);
    damageoriginoffset = anglestoright(destroyedobj.visuals[0].angles) * 24;
    damageorigin1 = damageoriginbase + damageoriginoffset;
    damageorigin2 = damageoriginbase - damageoriginoffset;
    radiusdamage(damageorigin1, 512, 200, 20, player, "MOD_EXPLOSIVE", "bomb_site_mp");
    radiusdamage(damageorigin2, 512, 200, 20, player, "MOD_EXPLOSIVE", "bomb_site_mp");
    if (isdefined(player)) {
        player incpersstat("destructions", 1);
        player scripts/mp/persistence::statsetchild("round", "destructions", player.pers["destructions"]);
    }
    if (isdefined(destroyedobj.trigger.effect)) {
        effect = destroyedobj.trigger.effect;
    } else if (level.mapname == "mp_faridah") {
        effect = "faridah_bomb_explosion";
    } else {
        effect = "bomb_explosion";
    }
    explosioneffect = spawnfx(scripts/engine/utility::getfx(effect), explosionorigin);
    triggerfx(explosioneffect);
    physicsexplosionsphere(explosionorigin, 200, 100, 3);
    playrumbleonposition("grenade_rumble", explosionorigin);
    earthquake(0.5, 2, explosionorigin, 2000);
    playsoundatpos(explosionorigin, "exp_bombsite_lr");
    if (getbasegametype() == "sd") {
        if (scripts/mp/utility/teams::getteamdata(game["attackers"], "aliveCount") > 0) {
            scripts/mp/utility/dialog::statusdialog("attacking_bombgoesoff", game["attackers"], "status");
            scripts/mp/utility/dialog::statusdialog("defending_bombgoesoff", game["defenders"], "status");
        } else {
            scripts/mp/utility/dialog::statusdialog("attacking_bombgoesoff_alldead", game["attackers"], "status");
            scripts/mp/utility/dialog::statusdialog("defending_bombgoesoff", game["defenders"], "status");
        }
    }
    if (isdefined(destroyedobj.exploderindex)) {
        exploder(destroyedobj.exploderindex);
    } else if (istrue(level.scriptedtriggers)) {
        destroyedobj.trigger setmodel("sd_equipment_bombsite_crate_d");
    }
    defuseobject scripts/mp/gameobjects::disableobject();
    if (isdefined(level.onobjectivecomplete)) {
        defuseobject [[ level.onobjectivecomplete ]]("bombzone", self.objectivekey, player, game["attackers"], undefined);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ca
// Size: 0x31
function function_5784fd1cddbd00d3() {
    switch (level.mapname) {
    case #"hash_f379b47cec633c60":
        return 10;
    default:
        return 0;
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3902
// Size: 0x1b3
function bombradialfill(plantteam, friendlyicon, enemyicon) {
    level endon("game_ended");
    self.var_f271d42faf329b89 = 0;
    updaterate = level.framedurationseconds;
    updateratems = updaterate * 1000;
    bombstarttime = level.bombtimer * 1000;
    addtime = updateratems / bombstarttime;
    self.radialtimeobjid = scripts/mp/objidpoolmanager::requestobjectiveid(99);
    if (self.radialtimeobjid != -1) {
        objectivestate = "invisible";
        scripts/mp/objidpoolmanager::objective_add_objective(self.radialtimeobjid, objectivestate, self.curorigin + self.offset3d);
        scripts/mp/objidpoolmanager::objective_set_play_intro(self.radialtimeobjid, 0);
        scripts/mp/objidpoolmanager::objective_set_play_outro(self.radialtimeobjid, 0);
        scripts/mp/objidpoolmanager::objective_playermask_showtoall(self.radialtimeobjid);
        self.showworldicon = 1;
    }
    scripts/mp/gameobjects::setobjectivestatusicons(friendlyicon, enemyicon, self.radialtimeobjid);
    self.bombplanted = 1;
    while (self.bombplanted) {
        var_f271d42faf329b89 = addtime;
        self.var_f271d42faf329b89 = var_f271d42faf329b89;
        scripts/mp/objidpoolmanager::objective_set_progress_team(self.radialtimeobjid, plantteam);
        scripts/mp/objidpoolmanager::objective_show_progress(self.radialtimeobjid, 1);
        scripts/mp/objidpoolmanager::objective_set_progress(self.radialtimeobjid, var_f271d42faf329b89);
        addtime = min(addtime + updateratems / bombstarttime, 1);
        waitframe();
    }
    scripts/mp/objidpoolmanager::returnobjectiveid(self.radialtimeobjid);
    if (isdefined(self)) {
        self.radialtimeobjid = -1;
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3abc
// Size: 0x195
function initobjectivecam(objective) {
    camstart = undefined;
    startnodes = getentarray("sd_bombcam_start", "targetname");
    foreach (startnode in startnodes) {
        if (startnode.script_label == objective.objectivekey) {
            camstart = startnode;
            break;
        }
    }
    campath = [];
    if (isdefined(camstart) && isdefined(camstart.target)) {
        nextnode = getent(camstart.target, "targetname");
        while (isdefined(nextnode)) {
            campath[campath.size] = nextnode;
            if (isdefined(nextnode.target)) {
                nextnode = getent(nextnode.target, "targetname");
                continue;
            }
            break;
        }
    }
    if (isdefined(camstart) && campath.size) {
        cam = spawn("script_model", camstart.origin);
        cam.origin = camstart.origin;
        cam.angles = camstart.angles;
        cam.path = campath;
        cam setmodel("tag_origin");
        cam hide();
        return cam;
    }
    return undefined;
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c58
// Size: 0x216
function runobjectivecam() {
    level notify("objective_cam");
    foreach (player in level.players) {
        if (!isai(player)) {
            player _freezecontrols(1);
            player visionsetnakedforplayer("black_bw", 0.5);
        }
    }
    wait(0.5);
    foreach (player in level.players) {
        if (!isai(player)) {
            player setusingremote("objective_cam");
            player val::set("objective_cam", "weapon", 0);
            player playerlinkweaponviewtodelta(self, "tag_player", 1, 180, 180, 180, 180, 1);
            player _freezecontrols(1);
            player setplayerangles(self.angles);
            player visionsetnakedforplayer("", 0.5);
        }
    }
    for (i = 0; i < self.path.size; i++) {
        acceltime = 0;
        if (i == 0) {
            acceltime = 5 / self.path.size / 2;
        }
        deceltime = 0;
        if (i == self.path.size - 1) {
            deceltime = 5 / self.path.size / 2;
        }
        self moveto(self.path[i].origin, 5 / self.path.size, acceltime, deceltime);
        self rotateto(self.path[i].angles, 5 / self.path.size, acceltime, deceltime);
        wait(5 / self.path.size);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e75
// Size: 0x8d
function bombtimerwait(objectivekey) {
    level endon("game_ended");
    level endon("bombs_canceled");
    level endon("bomb_defused" + objectivekey);
    var_4dfaa92e2bce1194 = int(level.bombtimer * 1000 + gettime());
    setomnvar("ui_bomb_timer_endtime" + objectivekey, var_4dfaa92e2bce1194);
    thread updatetimerconstant("ui_bomb_timer_endtime" + objectivekey, var_4dfaa92e2bce1194, level.bombtimer * 1000, objectivekey);
    level thread handlehostmigration(var_4dfaa92e2bce1194, objectivekey);
    scripts/mp/hostmigration::waitlongdurationwithgameendtimeupdate(level.bombtimer);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f09
// Size: 0x7f
function updatetimerconstant(omnvar, var_4dfaa92e2bce1194, bombtimer, objectivekey) {
    level endon("bombs_canceled");
    level endon("bomb_defused" + objectivekey);
    self.startbombtime = gettime();
    while (gettime() < var_4dfaa92e2bce1194) {
        timepassed = gettime() - self.startbombtime;
        setomnvar(omnvar, int(gettime() + bombtimer - timepassed));
        waitframe();
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f8f
// Size: 0x68
function handlehostmigration(var_4dfaa92e2bce1194, objectivekey) {
    level endon("game_ended");
    level endon("bomb_defused" + objectivekey);
    level endon("disconnect");
    level waittill("host_migration_begin");
    setomnvar("ui_bomb_timer_endtime" + objectivekey, 0);
    timepassed = scripts/mp/hostmigration::waittillhostmigrationdone();
    if (timepassed > 0) {
        setomnvar("ui_bomb_timer_endtime" + objectivekey, var_4dfaa92e2bce1194 + timepassed);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ffe
// Size: 0xb0
function bombdefused(sitedefused) {
    if (getgametype() != "dd" && getgametype() != "cmd" && getgametype() != "btm" && getgametype() != "gwbomb") {
        level.bombdefused = 1;
    }
    sitedefused.bombdefused = 1;
    setbombtimeromnvars();
    level notify("bomb_defused" + sitedefused.objectivekey);
    if (isdefined(level.onobjectivecomplete)) {
        sitedefused [[ level.onobjectivecomplete ]]("bombzone", self.objectivekey, undefined, game["defenders"], undefined);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b5
// Size: 0xb2
function updatebombplantedomnvar(plantteam) {
    if (getgametype() == "cmd") {
        return;
    }
    if (isdefined(plantteam)) {
        if (plantteam == "allies") {
            setomnvar("ui_bomb_owner_team", 2);
        } else {
            setomnvar("ui_bomb_owner_team", 1);
        }
    }
    if (isdefined(level.aplanted)) {
        if (level.aplanted) {
            setomnvar("ui_bomb_planted_a", 1);
        } else {
            setomnvar("ui_bomb_planted_a", 0);
        }
    }
    if (isdefined(level.bplanted)) {
        if (level.bplanted) {
            setomnvar("ui_bomb_planted_b", 1);
            return;
        }
        setomnvar("ui_bomb_planted_b", 0);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x416e
// Size: 0x2c
function setbombtimeromnvars(plantteam) {
    updatebombplantedomnvar(plantteam);
    /#
        println("MP_INGAME_ONLY/OBJ_DEFUSING_CAPS" + level.bombsplanted);
    #/
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41a1
// Size: 0x3ab
function bombzone_setupbombcase(bombname, overrideorigin) {
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    trigger = undefined;
    trigger = getent(bombname + "_pickup_trig", "targetname");
    if (!isdefined(trigger)) {
        var_e8f555a5bbceae47 = getstruct("sd_bomb_spawn", "script_noteworthy");
        if (isdefined(var_e8f555a5bbceae47)) {
            trigger = spawn("trigger_radius", drop_to_ground(var_e8f555a5bbceae47.origin, 10, -100), 0, 32, 32);
            trigger.angles = var_e8f555a5bbceae47.angles;
        } else {
            error("No " + bombname + "_pickup_trig trigger found in map.");
            return;
        }
    }
    if (isdefined(overrideorigin)) {
        trigger.origin = overrideorigin;
    }
    visuals[0] = getent(bombname, "targetname");
    if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1 || !isdefined(visuals[0])) {
        visuals[0] = spawn("script_model", trigger.origin);
        bombcase = getent(bombname, "targetname");
        if (isdefined(bombcase)) {
            bombcase delete();
        }
        if (!isdefined(visuals[0])) {
            error("No " + bombname + " script_model found in map.");
            return;
        }
    }
    if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        visuals[0].scriptable = spawnscriptable("offhand_2h_wm_briefcase_bomb_v0", trigger.origin + (0, 0, 2), (0, 0, 0));
        if (game["attackers"] == "allies") {
            visuals[0].scriptable setscriptablepartstate("bomb", "neutralAllies");
        } else {
            visuals[0].scriptable setscriptablepartstate("bomb", "neutralAxis");
        }
    } else {
        visuals[0] setmodel("offhand_2h_wm_briefcase_bomb_v0");
    }
    visuals[0] setnonstick(1);
    visuals[0] = getadjustedfirstroundbombcaseposition(visuals[0]);
    trigger = getadjustedfirstroundbombcaseposition(trigger, 1);
    if (!level.multibomb) {
        level.sdbomb = scripts/mp/gameobjects::createcarryobject(game["attackers"], trigger, visuals, (0, 0, 32), undefined, 1);
        level.sdbomb scripts/mp/gameobjects::allowcarry("friendly");
        level.sdbomb.allowweapons = 1;
        level.sdbomb.requireslos = 1;
        level.sdbomb.onpickup = &onpickup;
        level.sdbomb.ondrop = &ondrop;
        level.sdbomb.firstpickup = 1;
        level thread bombsitewatcher();
        level.bombrespawnpoint = level.sdbomb.visuals[0].origin;
        level.bombrespawnangles = level.sdbomb.visuals[0].angles;
        level.sdbomb.visualgroundoffset = (0, 0, 0);
        level.sdbomb.visuals[0] function_5226227bce83ebe9(1, game["attackers"]);
        return;
    }
    trigger delete();
    visuals[0] delete();
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4553
// Size: 0x20e
function getadjustedfirstroundbombcaseposition(ent, istrigger) {
    origin = (0, 0, 0);
    angles = (0, 90, 0);
    switch (level.mapname) {
    case #"hash_f09747c9feb47eb1":
        if (gameflag("infil_will_run") && game["roundsPlayed"] == 0) {
            origin = (-518, -959, 267);
        }
        break;
    case #"hash_1ab428ea9c0ee9e5":
        origin = (263, -2500, 146);
        break;
    case #"hash_3e552e81b4a21fff":
    case #"hash_3e6dceebd27fedec":
    case #"hash_5586b38644ed9b26":
    case #"hash_6210b3e419ba7028":
    case #"hash_62644ed2dea5cf54":
    case #"hash_7709127773d7af61":
    case #"hash_7e7b98f5c7f2b9a0":
    case #"hash_a11e6e81ea219453":
    case #"hash_a9b94844236a7fd8":
    case #"hash_c8b70146f0c8a9cd":
    case #"hash_d707e2cfc340c376":
    case #"hash_decd2e8ff1f996d7":
    case #"hash_ec2ebc1298ef7373":
        if (isdefined(level.var_d27f667e6320d465)) {
            bombcase = getstruct(level.var_d27f667e6320d465.var_8e9196b67a6d5933, "script_noteworthy");
        } else {
            bombcase = getstruct("sd_bomb_spawn", "script_noteworthy");
        }
        if (isdefined(bombcase)) {
            origin = drop_to_ground(bombcase.origin, 10, -10);
            angles = bombcase.angles;
        } else {
            /#
                assertmsg("obj_bombzone::getAdjustedFirstRoundBombCasePosition -> ln 1394 was unable to find name 'sd_bomb_spawn' in the Battle Map create script data");
            #/
        }
        break;
    default:
        return ent;
    }
    if (istrue(istrigger)) {
        ent.origin = origin;
    } else {
        ent.origin = origin;
        ent.angles = angles;
    }
    return ent;
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4769
// Size: 0x13c
function movebombcase(newpos, newangles) {
    if (isdefined(level.sdbomb)) {
        level.sdbomb.trigger.origin = newpos;
        level.sdbomb.visuals[0].origin = newpos;
        level.sdbomb.visuals[0].angles = newangles;
        level.sdbomb.visuals[0] show();
        level.sdbomb scripts/mp/gameobjects::allowcarry("friendly");
        if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        } else {
            level.sdbomb scripts/mp/gameobjects::setobjectivestatusicons("waypoint_bomb");
            level.sdbomb scripts/mp/gameobjects::setvisibleteam("friendly");
        }
        level.sdbomb.allowweapons = 1;
        level.sdbomb.onpickup = &onpickup;
        level.sdbomb.ondrop = &ondrop;
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48ac
// Size: 0xb9
function bombsitewatcher() {
    level endon("game_ended");
    while (true) {
        player, iscarrying = level waittill("bomb_carrier_changed");
        /#
            assert(isdefined(player) && isdefined(iscarrying));
        #/
        foreach (bombzone in level.objectives) {
            if (iscarrying) {
                bombzone.trigger enableplayeruse(player);
                continue;
            }
            bombzone.trigger disableplayeruse(player);
        }
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x496c
// Size: 0x2b2
function onpickup(player, playervo, defused) {
    silentpickup = isdefined(player.var_c7945be244726ad0) && player.var_c7945be244726ad0 < gettime() + 1000;
    player.isbombcarrier = 1;
    if (isplayer(player)) {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "pickup";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(1, player.team, player getentitynumber());
    }
    player setclientomnvar("ui_carry_object_can_drop", 0);
    player setclientomnvar("ui_carrying_bomb", 1);
    setomnvar("ui_bomb_carrier", player getentitynumber());
    self.offset3d = (0, 0, 75);
    if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        level.sdbombmodel linkto(player, "tag_origin", (0, 0, 0), (0, 0, 0));
        level.sdbombmodel.scriptable utility::function_6e506f39f121ea8a(player);
        if (game["attackers"] == "allies") {
            level.sdbombmodel.scriptable setscriptablepartstate("bomb", "carriedAllies");
        } else {
            level.sdbombmodel.scriptable setscriptablepartstate("bomb", "carriedAxis");
        }
    } else {
        scripts/mp/gameobjects::setobjectivestatusicons("icon_waypoint_escort_bomb", "codcaster_enemy_escort_bomb");
    }
    if (isdefined(level.sd_loadout) && isdefined(level.sd_loadout[player.team])) {
        player thread applybombcarrierclass();
    }
    if (!silentpickup) {
        thread function_7bc240fc69ea5205(player);
    }
    if (!level.bombdefused) {
        if (!silentpickup) {
            thread scripts/mp/hud_util::function_7b2653a588f28e29(player, "callout_bombpickup", "callout_bombpickup_team", "");
        }
        if (istrue(self.firstpickup)) {
            self.firstpickup = 0;
        }
    }
    if (level.codcasterenabled) {
        player setgametypevip(1);
    }
    logannouncement(player, undefined, "Bomb Picked Up", player.origin);
    level notify("bomb_carrier_changed", player);
    level thread scripts/mp/hud_message::updatematchstatushintforallplayers(player.team, "bomb_escort", undefined, player, "bomb_plant");
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c25
// Size: 0x115
function private function_7bc240fc69ea5205(player) {
    self notify("sd_trigger_pickup_sound");
    self endon("sd_trigger_pickup_sound");
    self endon("dropped");
    level endon("game_ended");
    if (isdefined(player)) {
        team = player.pers["team"];
        otherteam = scripts/mp/utility/game::getotherteam(team)[0];
        scripts/mp/utility/sound::playsoundonplayers(game["bomb_recovered_sound"], game["attackers"]);
        player playsound("mp_bomb_pickup");
        if (!istrue(level.bombdefused)) {
            waittime = getdvarfloat(@"hash_e5a5bd503d175ec4", 0.5);
            if (waittime > 0) {
                wait(waittime);
            }
            if (!istrue(level.gameended)) {
                var_a675744864c65c1 = "bomb_pickup";
                if (istrue(self.firstpickup)) {
                    var_a675744864c65c1 = "bomb_pickup_first";
                }
                excludelist = [];
                if (isdefined(player)) {
                    excludelist[excludelist.size] = player;
                    level thread playerdelayedvo(player, var_a675744864c65c1);
                }
                if (isdefined(team)) {
                    level thread teamdelayedvo(team, excludelist);
                }
            }
        }
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d41
// Size: 0x121
function ondrop(player) {
    silentdrop = isdefined(self.var_c7945be244726ad0) && self.var_c7945be244726ad0 < gettime() + 1000;
    level notify("bomb_carrier_changed", player);
    setomnvar("ui_bomb_carrier", -1);
    self.offset3d = (0, 0, 32);
    if (level.codcasterenabled) {
        if (isdefined(player)) {
            player setgametypevip(0);
        }
    }
    scripts/mp/gameobjects::setobjectivestatusicons("waypoint_bomb");
LOC_000000a0:
    if (!silentdrop) {
        scripts/mp/utility/sound::playsoundonplayers(game["bomb_dropped_sound"], game["attackers"]);
    }
    if (isdefined(player)) {
        player.isbombcarrier = 0;
        level thread scripts/mp/hud_message::updatematchstatushintforallplayers(player.team, "bomb_pickup");
    }
    if (!level.bombplanted && isdefined(level.bombresettimer) && level.bombresettimer > 0) {
        thread waitforbombreset(level.bombresettimer);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e69
// Size: 0x66
function waitforbombreset(timelimit) {
    level endon("game_ended");
    level endon("bomb_carrier_changed");
    wait(timelimit);
    scripts/mp/weapons::equipmentdeletevfx(self.visuals[0].origin, self.visuals[0].angles);
    movebombcase(level.bombrespawnpoint, level.bombrespawnangles);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed6
// Size: 0x7e
function enablemultibombui() {
    foreach (player in level.players) {
        if (!isai(player)) {
            player setclientomnvar("ui_carrying_bomb", player.pers["team"] == game["attackers"]);
        }
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5b
// Size: 0x3c
function respawnbombcase() {
    level endon("game_ended");
    wait(5);
    if (level.multibomb) {
        enablemultibombui();
        return;
    }
    movebombcase(level.bombrespawnpoint, level.bombrespawnangles);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9e
// Size: 0xa4
function advancebombcase() {
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombrespawnpoint = level.curobj.visuals[0].origin + (0, 0, 48);
    level.bombrespawnangles = level.curobj.visuals[0].angles;
    if (level.multibomb) {
        enablemultibombui();
        return;
    }
    movebombcase(level.bombrespawnpoint, level.bombrespawnangles);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5049
// Size: 0xd2
function applybombcarrierclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!self isonground()) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = level.sd_loadout[self.team];
    scripts/mp/equipment/tac_insert::spawnpoint_setspawnpoint(self.origin, self.angles);
    self.gamemode_chosenclass = self.class;
    scripts/mp/class::function_a16868d4dcd81a4b();
    self notify("faux_spawn");
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread scripts/mp/playerlogic::spawnplayer(1);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5122
// Size: 0x9a
function removebombcarrierclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!self isonground()) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = undefined;
    scripts/mp/equipment/tac_insert::spawnpoint_setspawnpoint(self.origin, self.angles);
    self notify("faux_spawn");
    self.faux_spawn_stance = self getstance();
    thread scripts/mp/playerlogic::spawnplayer(1);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51c3
// Size: 0x23a
function bombzone_awardgenericbombzonemedals(attacker, victim) {
    foreach (bombzone in level.objectives) {
        if (!isdefined(bombzone.bombdefusetrig.origin)) {
            continue;
        }
        planted = istrue(bombzone.bombplanted);
        passed = distsquaredcheck(attacker.origin, victim.origin, ter_op(planted, bombzone.bombdefusetrig.origin, bombzone.trigger.origin));
        if (passed) {
            if (getgametype() == "dd" && inovertime()) {
                if (attacker.team == bombzone.ownerteam) {
                    attacker thread scripts/mp/rank::scoreeventpopup(ter_op(planted, #"defend", #"assault"));
                    attacker thread scripts/mp/utility/points::doScoreEvent(ter_op(planted, #"hash_2d96ced878338cd2", #"hash_5a3b180273be47b1"));
                } else {
                    attacker thread scripts/mp/rank::scoreeventpopup(#"assault");
                    attacker thread scripts/mp/utility/points::doScoreEvent(#"hash_5a3b180273be47b1");
                }
                continue;
            }
            if (victim.team == game["defenders"]) {
                attacker thread scripts/mp/rank::scoreeventpopup(ter_op(planted, #"defend", #"assault"));
                attacker thread scripts/mp/utility/points::doScoreEvent(ter_op(planted, #"hash_2d96ced878338cd2", #"hash_5a3b180273be47b1"));
                continue;
            }
            attacker thread scripts/mp/rank::scoreeventpopup(ter_op(planted, #"assault", #"defend"));
            attacker thread scripts/mp/utility/points::doScoreEvent(ter_op(planted, #"hash_5a3b180273be47b1", #"hash_2d96ced878338cd2"));
        }
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5404
// Size: 0x5d
function distsquaredcheck(attackerpos, victimpos, checkpos) {
    attackerdistsq = distancesquared(checkpos, attackerpos);
    victimdistsq = distancesquared(checkpos, victimpos);
    if (attackerdistsq < 90000 || victimdistsq < 90000) {
        return 1;
    }
    return 0;
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5468
// Size: 0x14
function function_8192fdad48c58795(player) {
    return !isinlaststand(player);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5484
// Size: 0x6e
function playerdelayedvo(player, var_a675744864c65c1) {
    normalizedtimepassed = gettimepassed() / 1000;
    if (istrue(level.infilvotiming)) {
        delaytime = 8;
    } else {
        delaytime = 5;
    }
    waittime = delaytime - normalizedtimepassed;
    if (waittime > 0) {
        wait(waittime);
    }
    if (isdefined(player)) {
        player scripts/mp/utility/dialog::leaderdialogonplayer(var_a675744864c65c1);
    }
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f9
// Size: 0x73
function teamdelayedvo(team, excludelist) {
    normalizedtimepassed = gettimepassed() / 1000;
    if (istrue(level.infilvotiming)) {
        delaytime = 8;
    } else {
        delaytime = 5;
    }
    waittime = delaytime - normalizedtimepassed;
    if (waittime > 0) {
        wait(waittime);
    }
    scripts/mp/utility/dialog::leaderdialog("bomb_achieve", team, "bomb", excludelist);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5573
// Size: 0x328
function function_b217c136e8889619() {
    /#
        level endon("offhand_weapons");
        self notify("team");
        self endon("team");
        self endon("callout_bombplanted");
        wait(5);
        while (!level.bombplanted) {
            if (getdvarint(@"hash_31674c76da07f46f", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "ui_carrying_bomb") {
                        if (!level.multibomb) {
                            level.sdbomb.safeorigin = level.sdbomb.trigger.origin;
                            level.sdbomb.carrier = p;
                            level.multibomb = 1;
                            waitframe();
                            level.sdbomb.stalemate = 0;
                        }
                        foreach (bombsite in level.objectives) {
                            if (bombsite.objectivekey == "plantedAxis") {
                                bombsite [[ bombsite.onuse ]](p);
                                setdevdvar(@"hash_31674c76da07f46f", 0);
                                break;
                            }
                        }
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_c65dbfe96fb1f3c4", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "friendly") {
                        level.sdbomb.safeorigin = level.sdbomb.trigger.origin;
                        level.sdbomb.carrier = p;
                        level.multibomb = 1;
                        waitframe();
                        level.sdbomb.stalemate = 0;
                        foreach (bombsite in level.objectives) {
                            if (bombsite.objectivekey == "plantedAxis") {
                                bombsite [[ bombsite.onuse ]](p);
                                setdevdvar(@"hash_c65dbfe96fb1f3c4", 0);
                                break;
                            }
                        }
                        break;
                    }
                }
            }
            wait(1);
        }
        level waittill("bomb_defend");
        thread function_b217c136e8889619();
    #/
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58a2
// Size: 0x1a7
function function_bf6c5903e37dec2a() {
    /#
        level endon("offhand_weapons");
        self notify("exp_bombsite_lr");
        self endon("exp_bombsite_lr");
        self endon("callout_bombplanted");
        wait(5);
        while (level.bombplanted) {
            if (getdvarint(@"hash_18728111915eef48", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "ui_carrying_bomb") {
                        level.defuseobject [[ level.defuseobject.onuse ]](p);
                        setdevdvar(@"hash_18728111915eef48", 0);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_af011dbf40cf4773", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "friendly") {
                        level.defuseobject [[ level.defuseobject.onuse ]](p);
                        setdevdvar(@"hash_af011dbf40cf4773", 0);
                        break;
                    }
                }
            }
            wait(1);
        }
        level waittill("ui_bomb_timer_endtime");
        thread function_bf6c5903e37dec2a();
    #/
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a50
// Size: 0x10
function resetuiomnvargamemode() {
    self setclientomnvar("ui_carrying_bomb", 0);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a67
// Size: 0x40
function setteaminhuddatafromteamname(teamname) {
    if (teamname == "axis") {
        self setteaminhuddata(1);
        return;
    }
    if (teamname == "allies") {
        self setteaminhuddata(2);
        return;
    }
    self setteaminhuddata(0);
}

// Namespace obj_bombzone / scripts/mp/gametypes/obj_bombzone
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aae
// Size: 0x62
function function_f1ce924cd6279917(bombzone) {
    self endon("death");
    level endon("game_ended");
    bombzone endon("death");
    self function_5226227bce83ebe9(1, game["defenders"]);
    level waittill("bomb_planted");
    if (bombzone.bombplanted) {
        self function_5226227bce83ebe9(1, game["attackers"]);
        return;
    }
    self function_5226227bce83ebe9(0);
}

