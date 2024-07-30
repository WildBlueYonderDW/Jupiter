#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_attraction_racetrack.gsc;
#using scripts\mp\gametypes\br_attraction_kingofthehill.gsc;
#using scripts\mp\gametypes\br_attraction_gulag.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\gametypes\br_attractions.gsc;
#using scripts\mp\hud_util.gsc;

#namespace br_attractions;

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b
// Size: 0x54
function init() {
    if (!scripts\mp\gametypes\br_gametypes::isfeatureenabled("attractions")) {
        return;
    }
    level.brattractions = [];
    level.brgametype.useserverhud = getdvarint(@"hash_4452bc3660dc67fa", 1);
    scripts\mp\gametypes\br_attraction_racetrack::init();
    scripts\mp\gametypes\br_attraction_kingofthehill::init();
    scripts\mp\gametypes\br_attraction_gulag::init();
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0x20
function iskingofthehillactive() {
    return isdefined(level.brattractions) && isdefined(level.brattractions["koth"]);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x1c
function onplayerdisconnect(player) {
    if (iskingofthehillactive()) {
        scripts\mp\gametypes\br_attraction_kingofthehill::onplayerdisconnect(player);
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x161
function createattractionicontrigger(typeref, locindex, groundorigin, iconzoffset, iconshader, var_ba52080c594353fc, triggerenterfunc, triggerexitfunc, var_c9c301a888170672) {
    scriptable = spawnscriptable(var_c9c301a888170672, groundorigin);
    closeobjectiveiconid = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    if (closeobjectiveiconid != -1) {
        objorigin = groundorigin + (0, 0, iconzoffset);
        scripts\mp\objidpoolmanager::objective_add_objective(closeobjectiveiconid, "invisible", objorigin, iconshader);
        scripts\mp\objidpoolmanager::update_objective_setbackground(closeobjectiveiconid, 1);
        objective_removeallfrommask(closeobjectiveiconid);
        objective_showtoplayersinmask(closeobjectiveiconid);
        objective_setplayintro(closeobjectiveiconid, 0);
        objective_sethideelevation(closeobjectiveiconid, 1);
    }
    trigheight = scripts\cp_mp\parachute::getc130height() - groundorigin[2];
    icontrigger = spawn("trigger_radius", groundorigin, 0, var_ba52080c594353fc, trigheight);
    icontrigger.closeobjectiveiconid = closeobjectiveiconid;
    icontrigger.scriptable = scriptable;
    icontrigger.triggerenterfunc = triggerenterfunc;
    icontrigger.triggerexitfunc = triggerexitfunc;
    icontrigger.typeref = typeref;
    icontrigger.locindex = locindex;
    scripts\mp\utility\trigger::makeenterexittrigger(icontrigger, &playericontriggerenter, &playericontriggerexit, undefined, undefined, &playericonfilter);
    return icontrigger;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e
// Size: 0x6b
function shutdownattractionicontrigger(trigger) {
    if (istrue(trigger.shuttingdown)) {
        trigger waittill("death");
        return;
    }
    trigger.shuttingdown = 1;
    waittillframeend();
    scripts\mp\objidpoolmanager::returnobjectiveid(trigger.closeobjectiveiconid);
    if (isdefined(trigger.scriptable)) {
        trigger.scriptable freescriptable();
    }
    trigger delete();
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491
// Size: 0x2c
function triggeraddobjectivetext(localizedstring) {
    if (istrue(level.brgametype.useserverhud)) {
        self.objectivetext = localizedstring;
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c5
// Size: 0xc
function triggerremoveobjectivetext() {
    self.objectivetext = undefined;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9
// Size: 0xd
function triggersafearea() {
    self.sandbox_safe_area = 1;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee
// Size: 0x98
function playericontriggerenter(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player playersetattractiontype(trigger.typeref);
    player playersetattractionlocationindex(trigger.locindex);
    objective_addclienttomask(trigger.closeobjectiveiconid, player);
    if (isdefined(trigger.objectivetext)) {
        player playerhudattractionobj(trigger.objectivetext);
    }
    if (isdefined(trigger.triggerenterfunc)) {
        player thread [[ trigger.triggerenterfunc ]](player, trigger);
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58e
// Size: 0x7f
function playericontriggerexit(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    if (!istrue(player.ignoreattractions)) {
        player playersetattractionoff();
    }
    objective_removeclientfrommask(trigger.closeobjectiveiconid, player);
    if (isdefined(player.hudattractionobj)) {
        player thread playerfadeobjdelete();
    }
    if (isdefined(trigger.triggerexitfunc)) {
        player thread [[ trigger.triggerexitfunc ]](player, trigger);
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x5a
function playerhudattractionobj(objectivetext) {
    if (!isdefined(self.hudattractionobj)) {
        self.hudattractionobj = scripts\mp\gametypes\br_attractions::createhudstring(0, objectivetext);
        return;
    }
    self notify("keepHudAttractionObj");
    self.hudattractionobj.alpha = 1;
    self.hudattractionobj settext(objectivetext);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x677
// Size: 0x5f
function playerfadeobjdelete() {
    self endon("keepHudAttractionObj");
    var_b2d4b76e9bbd89ed = 1.5;
    obj = self.hudattractionobj;
    obj fadeovertime(var_b2d4b76e9bbd89ed);
    obj.alpha = 0;
    wait var_b2d4b76e9bbd89ed;
    if (isdefined(obj)) {
        obj destroy();
    }
    if (isdefined(self)) {
        self.hudattractionobj = undefined;
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de
// Size: 0x3c
function playersetignoreattractions(player, ignore) {
    if (istrue(player.ignoreattractions) && !ignore) {
        player playersetattractionoff();
    }
    player.ignoreattractions = ignore;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x2f
function playericonfilter(player, trigger) {
    return istrue(trigger.shuttingdown) || istrue(player.ignoreattractions);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a
// Size: 0x45
function createhudstring(index, text) {
    hudelem = scripts\mp\hud_util::createfontstring("objective", 1.5);
    hudelem hudelementsetupandposition(index);
    if (isdefined(text)) {
        hudelem settext(text);
    }
    return hudelem;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a8
// Size: 0x30
function createhudtimer(index) {
    hudelem = scripts\mp\hud_util::createtimer("objective", 1.5);
    hudelem hudelementsetupandposition(index);
    return hudelem;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e1
// Size: 0xac
function hudelementsetupandposition(index) {
    var_fc60cba78ac17a0c = 15;
    var_9348226a53701bdb = 160;
    var_6012bdca89ff91e9 = 20;
    self.x = var_fc60cba78ac17a0c;
    self.y = var_9348226a53701bdb + index * var_6012bdca89ff91e9;
    self.alignx = "left";
    self.aligny = "top";
    self.horzalign = "left_adjustable";
    self.vertalign = "top_adjustable";
    self.alpha = 1;
    self.glowalpha = 0;
    self.hidewheninmenu = 1;
    self.archived = 0;
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895
// Size: 0xb
function playersetattractionoff() {
    playersetomnvarattraction(0, 0);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8
// Size: 0x50
function playersetattractiontype(typeref) {
    typeindex = tablelookup("mp/brattractions.csv", 1, typeref, 0);
    assertex(isdefined(typeindex) && typeindex != "", "Attraction type doesn't exist");
    typeindex = int(typeindex);
    playersetomnvarattraction(0, typeindex);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x900
// Size: 0x15
function playersetattractionlocationindex(locationindex) {
    playersetomnvarattraction(1, locationindex);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x15
function playersetattractionstateindex(stateindex) {
    playersetomnvarattraction(2, stateindex);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a
// Size: 0x15
function playersetattractionextradata(extradata) {
    playersetomnvarattraction(3, extradata);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x957
// Size: 0x2f
function playersetattractionbestplayer(player) {
    entnum = -1;
    if (isdefined(player)) {
        entnum = player getentitynumber();
    }
    playersetomnvarattraction(4, entnum);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98e
// Size: 0x34
function playersetattractionbesttime(timems) {
    prev = self getclientomnvar("ui_br_attraction_best_time");
    if (timems != prev) {
        self setclientomnvar("ui_br_attraction_best_time", timems);
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ca
// Size: 0x34
function playersetattractiontime(timems) {
    prev = self getclientomnvar("ui_br_attraction_time");
    if (timems != prev) {
        self setclientomnvar("ui_br_attraction_time", timems);
    }
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa06
// Size: 0x7e
function playersetomnvarattraction(dataref, value) {
    assert(isplayer(self));
    var_57accdc40b2f50e = getattractionomnvarbitpackinginfo(dataref, value);
    value = var_57accdc40b2f50e[3];
    var_8e90fa6d5789ad63 = var_57accdc40b2f50e[2];
    bitwidth = var_57accdc40b2f50e[1];
    bitoffset = var_57accdc40b2f50e[0];
    if (var_8e90fa6d5789ad63 == "") {
        return;
    }
    playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, bitoffset, bitwidth);
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8c
// Size: 0x189
function getattractionomnvarbitpackinginfo(dataref, value) {
    bitoffset = 0;
    bitwidth = 0;
    var_8e90fa6d5789ad63 = "";
    switch (dataref) {
    case 0: 
        bitoffset = 0;
        bitwidth = 8;
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 1: 
        var_57acddc40b2f741 = [8, 8];
        bitwidth = var_57acddc40b2f741[1];
        bitoffset = var_57acddc40b2f741[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 2: 
        var_57acadc40b2f0a8 = [16, 8];
        bitwidth = var_57acadc40b2f0a8[1];
        bitoffset = var_57acadc40b2f0a8[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 3: 
        var_57acbdc40b2f2db = [24, 2];
        bitwidth = var_57acbdc40b2f2db[1];
        bitoffset = var_57acbdc40b2f2db[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 4: 
        var_57ad0dc40b2fdda = [0, 8];
        bitwidth = var_57ad0dc40b2fdda[1];
        bitoffset = var_57ad0dc40b2fdda[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_best_data";
        value++;
        break;
    default: 
        assertmsg("Unknown player info '" + dataref + "' requested for packing into attraction omnvar!");
        break;
    }
    return [bitoffset, bitwidth, var_8e90fa6d5789ad63, value];
}

// Namespace br_attractions / scripts\mp\gametypes\br_attractions
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1e
// Size: 0xa0
function playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, bitoffset, bitwidth) {
    mask = int(pow(2, bitwidth)) - 1;
    var_a463992091f1d483 = (value & mask) << bitoffset;
    var_f8f977081d3da8b4 = ~(mask << bitoffset);
    prevvalue = self getclientomnvar(var_8e90fa6d5789ad63);
    cleanedbase = prevvalue & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = cleanedbase + var_a463992091f1d483;
    if (var_82a90e56e416fa55 != prevvalue) {
        self setclientomnvar(var_8e90fa6d5789ad63, var_82a90e56e416fa55);
    }
}

