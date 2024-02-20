// mwiii decomp prototype
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

#namespace namespace_4279b29418c3e5e8;

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b
// Size: 0x55
function init() {
    if (!namespace_71073fa38f11492::isfeatureenabled("attractions")) {
        return;
    }
    level.brattractions = [];
    level.brgametype.useserverhud = getdvarint(@"hash_4452bc3660dc67fa", 1);
    namespace_78c0387340392041::init();
    namespace_5198cbcc9f2f3157::init();
    namespace_57d499bebd60ffe5::init();
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0x21
function iskingofthehillactive() {
    return isdefined(level.brattractions) && isdefined(level.brattractions["koth"]);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x1d
function onplayerdisconnect(player) {
    if (iskingofthehillactive()) {
        namespace_5198cbcc9f2f3157::onplayerdisconnect(player);
    }
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x162
function createattractionicontrigger(typeref, locindex, groundorigin, var_21efa20e3c93c7d5, var_2eaf3f31852684fd, var_ba52080c594353fc, triggerenterfunc, triggerexitfunc, var_c9c301a888170672) {
    scriptable = spawnscriptable(var_c9c301a888170672, groundorigin);
    closeobjectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (closeobjectiveiconid != -1) {
        var_e1e2fee99ef662f0 = groundorigin + (0, 0, var_21efa20e3c93c7d5);
        namespace_5a22b6f3a56f7e9b::objective_add_objective(closeobjectiveiconid, "invisible", var_e1e2fee99ef662f0, var_2eaf3f31852684fd);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(closeobjectiveiconid, 1);
        objective_removeallfrommask(closeobjectiveiconid);
        objective_showtoplayersinmask(closeobjectiveiconid);
        objective_setplayintro(closeobjectiveiconid, 0);
        objective_sethideelevation(closeobjectiveiconid, 1);
    }
    var_d653cb7c1800618 = namespace_5078ee98abb32db9::getc130height() - groundorigin[2];
    icontrigger = spawn("trigger_radius", groundorigin, 0, var_ba52080c594353fc, var_d653cb7c1800618);
    icontrigger.closeobjectiveiconid = closeobjectiveiconid;
    icontrigger.scriptable = scriptable;
    icontrigger.triggerenterfunc = triggerenterfunc;
    icontrigger.triggerexitfunc = triggerexitfunc;
    icontrigger.typeref = typeref;
    icontrigger.locindex = locindex;
    namespace_f1565a2788ab1e89::makeenterexittrigger(icontrigger, &playericontriggerenter, &playericontriggerexit, undefined, undefined, &playericonfilter);
    return icontrigger;
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e
// Size: 0x6c
function shutdownattractionicontrigger(trigger) {
    if (istrue(trigger.shuttingdown)) {
        trigger waittill("death");
        return;
    }
    trigger.shuttingdown = 1;
    waittillframeend();
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(trigger.closeobjectiveiconid);
    if (isdefined(trigger.scriptable)) {
        trigger.scriptable freescriptable();
    }
    trigger delete();
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491
// Size: 0x2d
function triggeraddobjectivetext(var_734564ff3d4fd467) {
    if (istrue(level.brgametype.useserverhud)) {
        self.objectivetext = var_734564ff3d4fd467;
    }
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c5
// Size: 0xd
function triggerremoveobjectivetext() {
    self.objectivetext = undefined;
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9
// Size: 0xe
function triggersafearea() {
    self.sandbox_safe_area = 1;
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee
// Size: 0x99
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

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58e
// Size: 0x80
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

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x5b
function playerhudattractionobj(objectivetext) {
    if (!isdefined(self.hudattractionobj)) {
        self.hudattractionobj = namespace_8bbc300af6d3c2fb::createhudstring(0, objectivetext);
    } else {
        self notify("keepHudAttractionObj");
        self.hudattractionobj.alpha = 1;
        self.hudattractionobj settext(objectivetext);
    }
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x677
// Size: 0x60
function playerfadeobjdelete() {
    self endon("keepHudAttractionObj");
    var_b2d4b76e9bbd89ed = 1.5;
    obj = self.hudattractionobj;
    obj fadeovertime(var_b2d4b76e9bbd89ed);
    obj.alpha = 0;
    wait(var_b2d4b76e9bbd89ed);
    if (isdefined(obj)) {
        obj destroy();
    }
    if (isdefined(self)) {
        self.hudattractionobj = undefined;
    }
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de
// Size: 0x3d
function playersetignoreattractions(player, ignore) {
    if (istrue(player.ignoreattractions) && !ignore) {
        player playersetattractionoff();
    }
    player.ignoreattractions = ignore;
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x30
function playericonfilter(player, trigger) {
    return istrue(trigger.shuttingdown) || istrue(player.ignoreattractions);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a
// Size: 0x46
function createhudstring(index, text) {
    hudelem = namespace_52f6938dd902c7d0::createfontstring("objective", 1.5);
    hudelem hudelementsetupandposition(index);
    if (isdefined(text)) {
        hudelem settext(text);
    }
    return hudelem;
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a8
// Size: 0x31
function createhudtimer(index) {
    hudelem = namespace_52f6938dd902c7d0::createtimer("objective", 1.5);
    hudelem hudelementsetupandposition(index);
    return hudelem;
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e1
// Size: 0xad
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

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895
// Size: 0xc
function playersetattractionoff() {
    playersetomnvarattraction(0, 0);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8
// Size: 0x51
function playersetattractiontype(typeref) {
    typeindex = tablelookup("mp/brattractions.csv", 1, typeref, 0);
    /#
        assertex(isdefined(typeindex) && typeindex != "", "Attraction type doesn't exist");
    #/
    typeindex = int(typeindex);
    playersetomnvarattraction(0, typeindex);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x900
// Size: 0x16
function playersetattractionlocationindex(var_be9720eaaaa043e) {
    playersetomnvarattraction(1, var_be9720eaaaa043e);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x16
function playersetattractionstateindex(stateindex) {
    playersetomnvarattraction(2, stateindex);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a
// Size: 0x16
function playersetattractionextradata(extradata) {
    playersetomnvarattraction(3, extradata);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x957
// Size: 0x30
function playersetattractionbestplayer(player) {
    entnum = -1;
    if (isdefined(player)) {
        entnum = player getentitynumber();
    }
    playersetomnvarattraction(4, entnum);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98e
// Size: 0x35
function playersetattractionbesttime(timems) {
    prev = self getclientomnvar("ui_br_attraction_best_time");
    if (timems != prev) {
        self setclientomnvar("ui_br_attraction_best_time", timems);
    }
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ca
// Size: 0x35
function playersetattractiontime(timems) {
    prev = self getclientomnvar("ui_br_attraction_time");
    if (timems != prev) {
        self setclientomnvar("ui_br_attraction_time", timems);
    }
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa06
// Size: 0x7f
function playersetomnvarattraction(var_ac85b79dfc4e45c6, value) {
    /#
        assert(isplayer(self));
    #/
    var_57accdc40b2f50e = getattractionomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value);
    value = var_57accdc40b2f50e[3];
    var_8e90fa6d5789ad63 = var_57accdc40b2f50e[2];
    var_8534515023afc188 = var_57accdc40b2f50e[1];
    var_64571e3aeccd1a07 = var_57accdc40b2f50e[0];
    if (var_8e90fa6d5789ad63 == "") {
        return;
    }
    playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188);
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8c
// Size: 0x18a
function getattractionomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value) {
    var_64571e3aeccd1a07 = 0;
    var_8534515023afc188 = 0;
    var_8e90fa6d5789ad63 = "";
    switch (var_ac85b79dfc4e45c6) {
    case 0:
        var_64571e3aeccd1a07 = 0;
        var_8534515023afc188 = 8;
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 1:
        var_57acddc40b2f741 = [0:8, 1:8];
        var_8534515023afc188 = var_57acddc40b2f741[1];
        var_64571e3aeccd1a07 = var_57acddc40b2f741[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 2:
        var_57acadc40b2f0a8 = [0:16, 1:8];
        var_8534515023afc188 = var_57acadc40b2f0a8[1];
        var_64571e3aeccd1a07 = var_57acadc40b2f0a8[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 3:
        var_57acbdc40b2f2db = [0:24, 1:2];
        var_8534515023afc188 = var_57acbdc40b2f2db[1];
        var_64571e3aeccd1a07 = var_57acbdc40b2f2db[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_data";
        break;
    case 4:
        var_57ad0dc40b2fdda = [0:0, 1:8];
        var_8534515023afc188 = var_57ad0dc40b2fdda[1];
        var_64571e3aeccd1a07 = var_57ad0dc40b2fdda[0];
        var_8e90fa6d5789ad63 = "ui_br_attraction_best_data";
        value++;
        break;
    default:
        /#
            assertmsg("Unknown player info '" + var_ac85b79dfc4e45c6 + "' requested for packing into attraction omnvar!");
        #/
        break;
    }
    return [0:var_64571e3aeccd1a07, 1:var_8534515023afc188, 2:var_8e90fa6d5789ad63, 3:value];
}

// Namespace namespace_4279b29418c3e5e8/namespace_8bbc300af6d3c2fb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1e
// Size: 0xa1
function playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = self getclientomnvar(var_8e90fa6d5789ad63);
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    if (var_82a90e56e416fa55 != var_ee27f3f198276535) {
        self setclientomnvar(var_8e90fa6d5789ad63, var_82a90e56e416fa55);
    }
}

