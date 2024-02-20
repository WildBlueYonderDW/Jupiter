// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\ammorestock.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\movers.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_55e6a436b6b3048c;
#using scripts\mp\gametypes\br.gsc;
#using script_2b264b25c7da0b12;
#using scripts\mp\supers.gsc;
#using scripts\mp\arbitrary_up.gsc;

#namespace gameobjects;

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1001
// Size: 0x207
function main(var_e7db84113a532e25) {
    var_e7db84113a532e25[var_e7db84113a532e25.size] = "airdrop_pallet";
    entities = getentarray();
    foreach (entity in entities) {
        if (isdefined(entity.targetname) && entity.targetname == "ammo_restock_location" || namespace_8d949790b9957051::function_7923460ce1ee31c5(entity) || istrue(entity.var_cefa8400ec818ee6)) {
            entity.var_cefa8400ec818ee6 = 1;
            if (isdefined(entity.target)) {
                foreach (ent in getentarray(entity.target, "targetname")) {
                    ent.var_cefa8400ec818ee6 = 1;
                }
            }
        } else {
            var_49c0bb15cb302f86 = entity.script_gameobjectname;
            if (isdefined(var_49c0bb15cb302f86)) {
                var_e88e346feab6a5e9 = 0;
                if (getsubstr(var_49c0bb15cb302f86, 0, 1) == "!") {
                    var_49c0bb15cb302f86 = getsubstr(var_49c0bb15cb302f86, 1);
                    var_e88e346feab6a5e9 = 1;
                }
                matches = 0;
                var_1b6b506df5e15983 = strtok(var_49c0bb15cb302f86, " ");
                for (j = 0; j < var_e7db84113a532e25.size; j++) {
                    for (k = 0; k < var_1b6b506df5e15983.size; k++) {
                        if (var_1b6b506df5e15983[k] == var_e7db84113a532e25[j]) {
                            matches = 1;
                            break;
                        }
                    }
                    if (matches) {
                        break;
                    }
                }
                if (var_e88e346feab6a5e9) {
                    if (matches) {
                        entity delete();
                    }
                } else if (!matches) {
                    entity delete();
                }
            }
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120f
// Size: 0x22
function init() {
    level.numgametypereservedobjectives = 0;
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    level thread getleveltriggers();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1238
// Size: 0x6b
function onplayerspawned() {
    if (isbot(self)) {
        level.botsenabled = 1;
    }
    var_15b82fbca96a0fec = !istrue(level.disableinitplayergameobjects);
    if (getdvarint(@"hash_1e97927453ad138", 0) == 1) {
        var_15b82fbca96a0fec = 1;
    }
    if (var_15b82fbca96a0fec) {
        if (isdefined(self.gameobject_fauxspawn)) {
            self.gameobject_fauxspawn = undefined;
        } else {
            init_player_gameobjects();
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12aa
// Size: 0x35
function init_player_gameobjects() {
    thread ondeathordisconnect();
    self.touchtriggers = [];
    self.carryobject = undefined;
    self.canpickupobject = 1;
    self.initialized_gameobject_vars = 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e6
// Size: 0x2f
function ondeathordisconnect() {
    self notify("gameobject_watch_drop");
    level endon("game_ended");
    self endon("drop_called");
    self endon("gameobject_watch_drop");
    self waittill("death_or_disconnect");
    _ondeathordisconnectinternal();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131c
// Size: 0x21
function _ondeathordisconnectinternal() {
    if (isdefined(self.carryobject)) {
        self.carryobject thread setdropped();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1344
// Size: 0x5b
function onjuggernaut() {
    waittillframeend();
    if (isdefined(self.carryobject)) {
        /#
            assert(self.carryobject.carrier == self);
        #/
        self.var_c7945be244726ad0 = gettime();
        self.carryobject thread setdropped();
        self switchtoweapon(namespace_68f1873625691c6::jugg_getminigunweapon());
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a6
// Size: 0x12e
function createtrackedobject(player, offset) {
    trackedobject = spawn("script_model", self.origin);
    trackedobject setmodel("tag_origin");
    carryobject = spawnstruct();
    carryobject.type = "carryObject";
    carryobject.carrier = player;
    carryobject.curorigin = player.origin;
    carryobject.entnum = trackedobject getentitynumber();
    carryobject.ownerteam = player.team;
    carryobject.offset3d = offset;
    carryobject.triggertype = "none";
    carryobject.compassicons = [];
    carryobject.objidpingfriendly = 0;
    carryobject.objidpingenemy = 0;
    carryobject.carriervisible = 0;
    carryobject.visibleteam = "none";
    carryobject requestid(1, 1);
    carryobject thread updatecarryobjectorigin();
    carryobject thread deletetrackedobjectoncarrierdisconnect();
    return carryobject;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14dc
// Size: 0x28
function deletetrackedobjectoncarrierdisconnect() {
    self endon("gameobject_deleted");
    level endon("game_ended");
    self.carrier waittill("disconnect");
    deletetrackedobject();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150b
// Size: 0xb4
function deletetrackedobject() {
    if (!isdefined(self) || !isdefined(self.type) || self.type != "carryObject") {
        return;
    }
    carryobject = self;
    carryobject.type = undefined;
    carryobject.carrier = undefined;
    carryobject.curorigin = undefined;
    carryobject.entnum = undefined;
    carryobject.ownerteam = undefined;
    carryobject.compassicons = undefined;
    carryobject.objidpingfriendly = undefined;
    carryobject.objidpingenemy = undefined;
    carryobject.carriervisible = undefined;
    carryobject.visibleteam = undefined;
    releaseid();
    self notify("gameobject_deleted");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c6
// Size: 0x9c
function function_fd1b4a7d915fc9a6(origin, offset, showonminimap, var_182036c56e421297) {
    codcasterWaypoint = spawnstruct();
    codcasterWaypoint.type = "codcasterWaypoint";
    codcasterWaypoint.curorigin = origin;
    codcasterWaypoint.offset3d = offset;
    codcasterWaypoint.ownerteam = "neutral";
    codcasterWaypoint.compassicons = [];
    codcasterWaypoint.visibleteam = "codcaster";
    codcasterWaypoint requestid(showonminimap, var_182036c56e421297, undefined, 0, 0);
    return codcasterWaypoint;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166a
// Size: 0x80
function function_e3c8fb6519162627() {
    if (!isdefined(self) || !isdefined(self.type) || self.type != "codcasterWaypoint") {
        return;
    }
    codcasterWaypoint = self;
    codcasterWaypoint.type = undefined;
    codcasterWaypoint.curorigin = undefined;
    codcasterWaypoint.offset3d = undefined;
    codcasterWaypoint.ownerteam = undefined;
    codcasterWaypoint.compassicons = undefined;
    codcasterWaypoint.visibleteam = undefined;
    releaseid();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f1
// Size: 0x44f
function createcarryobject(ownerteam, trigger, visuals, offset, useifproximity, var_8b9949739f4e0f6) {
    carryobject = spawnstruct();
    carryobject.type = "carryObject";
    carryobject.curorigin = trigger.origin;
    carryobject.ownerteam = ownerteam;
    carryobject.useifproximity = useifproximity;
    carryobject.entnum = trigger getentitynumber();
    if (issubstr(trigger.classname, "use") || istrue(trigger.usetype)) {
        carryobject.triggertype = "use";
    } else {
        carryobject.triggertype = "proximity";
    }
    trigger.gameobject = carryobject;
    trigger.baseorigin = trigger.origin;
    carryobject.trigger = trigger;
    if (!isdefined(trigger.linktoenabledflag)) {
        trigger.linktoenabledflag = 1;
        trigger enablelinkto();
    }
    carryobject.useweapon = undefined;
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    carryobject.offset3d = offset;
    for (index = 0; index < visuals.size; index++) {
        visuals[index].baseorigin = visuals[index].origin;
        visuals[index].baseangles = visuals[index].angles;
    }
    carryobject.visuals = visuals;
    carryobject.compassicons = [];
    carryobject.objidpingfriendly = 0;
    carryobject.objidpingenemy = 0;
    if (!isdefined(var_8b9949739f4e0f6)) {
        carryobject requestid(1, 1);
    }
    carryobject.carrier = undefined;
    carryobject.isresetting = 0;
    carryobject.interactteam = "none";
    carryobject.allowweapons = 0;
    carryobject.carriervisible = 0;
    carryobject.visibleteam = "none";
    carryobject.carryicon = undefined;
    carryobject.ondrop = undefined;
    carryobject.onpickup = undefined;
    carryobject.onreset = undefined;
    carryobject.pickupchecks = [];
    if (carryobject.triggertype == "use") {
        carryobject thread carryobjectusethink();
    } else {
        carryobject.curprogress = 0;
        carryobject.teamprogress = [];
        carryobject.teamprogress["none"] = 0;
        carryobject.usetime = 0;
        carryobject.userate = 0;
        carryobject.useratemultiplier = 1;
        carryobject.mustmaintainclaim = 0;
        carryobject.cancontestclaim = 0;
        carryobject.teamusetimes = [];
        carryobject.teamusetexts = [];
        carryobject.numtouching["neutral"] = 0;
        carryobject.touchlist["neutral"] = [];
        carryobject.numtouching["none"] = 0;
        carryobject.touchlist["none"] = [];
        foreach (name in level.teamnamelist) {
            carryobject.teamprogress[name] = 0;
            carryobject.numtouching[name] = 0;
            carryobject.touchlist[name] = [];
        }
        carryobject.claimteam = "none";
        carryobject.claimplayer = undefined;
        carryobject.lastclaimteam = "none";
        carryobject.lastclaimtime = 0;
        carryobject thread carryobjectproxthink();
    }
    carryobject thread updatecarryobjectorigin();
    return carryobject;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b48
// Size: 0x22
function registercarryobjectpickupcheck(var_c6961a94f7638aee) {
    self.pickupchecks[self.pickupchecks.size] = var_c6961a94f7638aee;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b71
// Size: 0xec
function checkcarryobjectpickupcheck(player) {
    passed = 1;
    foreach (check in self.pickupchecks) {
        passed = passed & [[ check ]](player);
    }
    if (isdefined(self.var_ea5e94e328a4b626) && isdefined(self.var_ea5e94e328a4b626.pickupchecks)) {
        foreach (check in self.var_ea5e94e328a4b626.pickupchecks) {
            passed = passed & [[ check ]](player);
        }
    }
    return passed;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c65
// Size: 0x254
function deletecarryobject() {
    if (self.type != "carryObject") {
        return;
    }
    carryobject = self;
    carryobject notify("death");
    carryobject notify("deleted");
    carryobject.type = undefined;
    carryobject.curorigin = undefined;
    carryobject.ownerteam = undefined;
    carryobject.entnum = undefined;
    carryobject.triggertype = undefined;
    carryobject.trigger unlink();
    carryobject.trigger = undefined;
    carryobject.useweapon = undefined;
    carryobject.offset3d = undefined;
    foreach (visual in carryobject.visuals) {
        visual delete();
    }
    carryobject.visuals = undefined;
    carryobject.compassicons = undefined;
    carryobject.objidpingfriendly = undefined;
    carryobject.objidpingenemy = undefined;
    carryobject.objpingdelay = undefined;
    releaseid();
    carryobject.carrier = undefined;
    carryobject.isresetting = undefined;
    carryobject.interactteam = "none";
    carryobject.allowweapons = undefined;
    carryobject.keepprogress = undefined;
    carryobject.carriervisible = undefined;
    carryobject.visibleteam = "none";
    carryobject.carryicon = undefined;
    carryobject.ondrop = undefined;
    carryobject.onpickup = undefined;
    carryobject.onreset = undefined;
    carryobject.curprogress = undefined;
    carryobject.usetime = undefined;
    carryobject.userate = undefined;
    carryobject.useratemultiplier = 1;
    carryobject.mustmaintainclaim = undefined;
    carryobject.cancontestclaim = undefined;
    carryobject.teamusetimes = undefined;
    carryobject.teamusetexts = undefined;
    carryobject.numtouching = undefined;
    carryobject.touchlist = undefined;
    carryobject.claimteam = undefined;
    carryobject.claimplayer = undefined;
    carryobject.lastclaimteam = undefined;
    carryobject.lastclaimtime = undefined;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec0
// Size: 0x1b5
function carryobjectusethink() {
    level endon("game_ended");
    while (1) {
        player = self.trigger waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player ismeleeing()) {
            continue;
        }
        currentweapon = player getcurrentweapon();
        if (isremotekillstreakweapon(currentweapon.basename)) {
            continue;
        }
        if (player isanymonitoredweaponswitchinprogress()) {
            nextweapon = player getcurrentmonitoredweaponswitchweapon();
            if (isremotekillstreakweapon(nextweapon.basename)) {
                continue;
            }
        }
        if (istrue(player.inlaststand)) {
            continue;
        }
        if (self.isresetting) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        if (!caninteractwith(player.pers["team"], player)) {
            continue;
        }
        if (!player.canpickupobject) {
            continue;
        }
        if (isdefined(player.nopickuptime) && player.nopickuptime > gettime()) {
            continue;
        }
        if (!isdefined(player.initialized_gameobject_vars)) {
            continue;
        }
        if (!isflagcarrymode() && player namespace_68e641469fde3fa7::grenadeinpullback()) {
            offhandweapon = player getheldoffhand();
            if (!isgesture(offhandweapon)) {
                continue;
            }
        }
        if (isdefined(self.carrier)) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        if (!proxtriggerlos(player)) {
            continue;
        }
        if (istrue(level.var_9a8e3eb5bc672807) && !player isonground()) {
            continue;
        }
        setpickedup(player);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207c
// Size: 0x43
function carryobjectproxthink() {
    if (getgametype() == "ball" || getgametype() == "tdef" || istrue(self.useifproximity)) {
        thread carryobjectusethink();
    } else {
        thread carryobjectproxthinkdelayed();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c6
// Size: 0x2d5
function carryobjectproxthinkdelayed() {
    level endon("game_ended");
    if (isdefined(self.trigger)) {
        self.trigger endon("move_gameobject");
    }
    thread proxtriggerthink();
    while (1) {
        if (self.usetime && self.teamprogress[self.claimteam] >= self.usetime) {
            self.curprogress = 0;
            self.teamprogress[self.claimteam] = self.curprogress;
            creditplayer = getearliestclaimplayer();
            setclaimteam("none");
            self.claimplayer = undefined;
            if (isdefined(self.onenduse)) {
                self [[ self.onenduse ]](getlastclaimteam(), creditplayer, isdefined(creditplayer));
            }
            if (isdefined(creditplayer)) {
                setpickedup(creditplayer);
            }
        }
        if (self.claimteam != "none") {
            if (self.usetime) {
                if (!self.numtouching[self.claimteam]) {
                    setclaimteam("none");
                    self.claimplayer = undefined;
                    if (isdefined(self.onenduse)) {
                        self [[ self.onenduse ]](getlastclaimteam(), self.claimplayer, 0);
                    }
                } else {
                    if (getgametype() == "bigctf" && istrue(self.stalemate)) {
                        goto LOC_0000028d;
                    }
                    self.curprogress = self.curprogress + level.frameduration * self.userate;
                    self.teamprogress[self.claimteam] = self.curprogress;
                    var_b0c33d224b825287 = getenemyteams(self.claimteam);
                    foreach (entry in var_b0c33d224b825287) {
                        if (self.ownerteam != entry) {
                            self.teamprogress[entry] = 0;
                        }
                    }
                    if (isdefined(self.onuseupdate)) {
                        self [[ self.onuseupdate ]](getclaimteam(), self.curprogress / self.usetime, level.frameduration * self.userate / self.usetime, self.claimplayer);
                    LOC_0000028d:
                    }
                LOC_0000028d:
                }
            LOC_0000028d:
            } else {
                if (isreallyalive(self.claimplayer)) {
                    setpickedup(self.claimplayer);
                }
                setclaimteam("none");
                self.claimplayer = undefined;
            }
        }
        waitframe();
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a2
// Size: 0x88
function pickupobjectdelay(object) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self.canpickupobject = 0;
    if (isdefined(object.ballindex)) {
        var_ea6796b0ab236d3b = 1024;
    } else {
        var_ea6796b0ab236d3b = 4096;
    }
    for (;;) {
        for (;;) {
            if (distancesquared(self.origin, object.trigger.origin) > var_ea6796b0ab236d3b) {
                break;
            }
        }
    }
    self.canpickupobject = 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2431
// Size: 0x3f5
function setpickedup(player, var_5760e0f038d1baa3, defused) {
    if (is_equal(getgametype(), "bigctf")) {
        if (!namespace_7e17181d03156026::isreallyalive(player) || isai(player) && isdefined(player.owner) || isdefined(self.carryweapon) && !player namespace_1cd9f6896754adb0::get("weapon") || !namespace_19b4203b51d56488::checkcarryobjectpickupcheck(player)) {
            if (isdefined(self.onpickupfailed)) {
                self [[ self.onpickupfailed ]](player);
            }
            return;
        } else if (isdefined(player.carryobject) && self.ownerteam == player.team) {
            if (isdefined(self.trigger getlinkedparent())) {
                for (index = 0; index < self.visuals.size; index++) {
                    self.visuals[index] unlink();
                }
                self.trigger unlink();
            }
            for (index = 0; index < self.visuals.size; index++) {
                self.visuals[index] hide();
            }
            if (!istrue(self.trigger.var_2768447445db282)) {
                self.trigger.origin = self.trigger.origin + (0, 0, 10000);
            }
            self.trigger namespace_d7b023c7eb3949d0::stop_handling_moving_platforms();
            self notify("pickup_object");
            player notify("pickup_object");
            if (isdefined(self.onpickup)) {
                self [[ self.onpickup ]](player, var_5760e0f038d1baa3, defused);
            }
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.var_22282e7d48ca3400 = player;
            var_7e2c53b0bcf117d9.var_239b4b5fa4bcf6c6 = self;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_objective_state_changed", var_7e2c53b0bcf117d9);
        }
    }
    if (!namespace_7e17181d03156026::isreallyalive(player) || isai(player) && isdefined(player.owner) || isdefined(player.carryobject) || isdefined(self.carryweapon) && !player namespace_1cd9f6896754adb0::get("weapon") || !namespace_19b4203b51d56488::checkcarryobjectpickupcheck(player)) {
        if (isdefined(self.onpickupfailed)) {
            self [[ self.onpickupfailed ]](player);
        }
        return;
    }
    player giveobject(self);
    setcarrier(player);
    if (isdefined(self.trigger getlinkedparent())) {
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index] unlink();
        }
        self.trigger unlink();
    }
    for (index = 0; index < self.visuals.size; index++) {
        self.visuals[index] hide();
    }
    if (!istrue(self.trigger.var_2768447445db282)) {
        self.trigger.origin = self.trigger.origin + (0, 0, 10000);
    }
    self.trigger namespace_d7b023c7eb3949d0::stop_handling_moving_platforms();
    self notify("pickup_object");
    player notify("pickup_object");
    if (isdefined(self.onpickup)) {
        self [[ self.onpickup ]](player, var_5760e0f038d1baa3, defused);
    }
    if (isdefined(self.var_ea5e94e328a4b626) && getdvarint(@"hash_85b8d86d0ea96ee1", 1)) {
        if (!istrue(self.var_856484af8370f6a1)) {
            function_3961f0ea9a43db11(player, self.var_ea5e94e328a4b626);
        }
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.var_22282e7d48ca3400 = player;
    var_7e2c53b0bcf117d9.var_239b4b5fa4bcf6c6 = self;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_objective_state_changed", var_7e2c53b0bcf117d9);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282d
// Size: 0xe1
function function_316d9da870e12a03(ignoreents, trigger, var_9eae3c6de4c6de86, var_20f30c47c5442258, var_d81857413879b334, var_be2108e27ac7a4ef, var_8e58b28ef44cbe0) {
    var_ea5e94e328a4b626 = spawnstruct();
    if (isdefined(ignoreents)) {
        var_ea5e94e328a4b626.ignoreents = ignoreents;
    }
    if (isdefined(trigger)) {
        var_ea5e94e328a4b626.trigger = trigger;
    }
    if (isdefined(var_9eae3c6de4c6de86)) {
        var_ea5e94e328a4b626.var_9eae3c6de4c6de86 = var_9eae3c6de4c6de86;
    }
    if (isdefined(var_20f30c47c5442258)) {
        var_ea5e94e328a4b626.var_20f30c47c5442258 = var_20f30c47c5442258;
    }
    if (isdefined(var_d81857413879b334)) {
        var_ea5e94e328a4b626.var_5338ab800fa9b63a = var_d81857413879b334;
    }
    if (isdefined(var_be2108e27ac7a4ef)) {
        var_ea5e94e328a4b626.var_be2108e27ac7a4ef = var_be2108e27ac7a4ef;
    }
    if (!istrue(var_8e58b28ef44cbe0)) {
        var_ea5e94e328a4b626.pickupchecks = [0:&function_ffae0b2bdeb1bb92];
    }
    self.var_ea5e94e328a4b626 = var_ea5e94e328a4b626;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2915
// Size: 0x4d
function function_3961f0ea9a43db11(player, var_ea5e94e328a4b626) {
    if (isbot(player)) {
        return;
    }
    function_3a3c81e298ffb596(player, 0);
    thread function_3fddadfd0f60d749(player, var_ea5e94e328a4b626);
    thread function_f4b0940fedb9a105(player, var_ea5e94e328a4b626);
    thread function_5d1e933df9172036(player);
    thread function_a4729874a8daf9ac(player);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2969
// Size: 0xae
function function_a4729874a8daf9ac(player) {
    self endon("manual_drop_cleanup");
    self endon("dropped");
    self endon("death");
    player endon("death_or_disconnect");
    player endon("manual_drop");
    var_a97560119766513f = player usinggamepad();
    while (1) {
        var_7d9937fd539f02d0 = player usinggamepad();
        if (var_7d9937fd539f02d0 != var_a97560119766513f) {
            var_a97560119766513f = var_7d9937fd539f02d0;
            if (var_7d9937fd539f02d0) {
                player notifyonplayercommandremove("manual_drop", "+armor");
                player notifyonplayercommand("manual_drop", "+actionslot 2");
            } else {
                player notifyonplayercommandremove("manual_drop", "+actionslot 2");
                player notifyonplayercommand("manual_drop", "+armor");
            }
        }
        waitframe();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1e
// Size: 0x35
function function_5d1e933df9172036(player) {
    waittill_any_3("manual_drop_cleanup", "dropped", "death");
    function_3a3c81e298ffb596(player, 0);
    self.var_8a6e15b947edab69 = undefined;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5a
// Size: 0x7c
function function_f4b0940fedb9a105(player, var_ea5e94e328a4b626) {
    self endon("manual_drop_cleanup");
    self endon("dropped");
    self endon("death");
    self endon("reset");
    player endon("death_or_disconnect");
    while (1) {
        player waittill_any_2("manual_drop", "force_manual_drop");
        if (istrue(self.var_8a6e15b947edab69)) {
            thread function_1069580bc0a235cb(player, var_ea5e94e328a4b626);
            return;
        } else {
            player thread namespace_68747ec28caa9f9e::tutorialprint("MP_JUP_WM/CAN_NOT_MANUAL_DROP", 2);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2add
// Size: 0x10f
function function_1069580bc0a235cb(player, var_ea5e94e328a4b626) {
    level endon("game_ended");
    var_4942ba4aa5d8eea2 = undefined;
    var_47125da1471f5c68 = isdefined(var_ea5e94e328a4b626.trigger) && isdefined(var_ea5e94e328a4b626.var_9eae3c6de4c6de86);
    if (var_47125da1471f5c68) {
        if (var_ea5e94e328a4b626.trigger isusable()) {
            var_ea5e94e328a4b626.trigger disableplayeruse(player);
        } else {
            player.var_1cecd248dd213dce = 1;
        }
    }
    thread namespace_19b4203b51d56488::setdropped(0, undefined, 1, 1);
    self notify("manual_drop_cleanup");
    self.var_c3018adeacdd826 = 1;
    if (isdefined(self.ondrop)) {
        self [[ self.ondrop ]](player);
    }
    if (isdefined(var_ea5e94e328a4b626.var_be2108e27ac7a4ef) && isfunction(var_ea5e94e328a4b626.var_be2108e27ac7a4ef)) {
        self [[ var_ea5e94e328a4b626.var_be2108e27ac7a4ef ]](player);
    }
    self.var_c3018adeacdd826 = undefined;
    if (var_47125da1471f5c68) {
        thread function_eda9340b865645a3(player, var_ea5e94e328a4b626);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf3
// Size: 0x61
function function_eda9340b865645a3(player, var_ea5e94e328a4b626) {
    level endon("game_ended");
    player endon("disconnect");
    wait(var_ea5e94e328a4b626.var_9eae3c6de4c6de86);
    if (var_ea5e94e328a4b626.trigger isusable()) {
        var_ea5e94e328a4b626.trigger enableplayeruse(player);
    } else {
        player.var_1cecd248dd213dce = undefined;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5b
// Size: 0x533
function function_3fddadfd0f60d749(player, var_ea5e94e328a4b626) {
    self endon("manual_drop_cleanup");
    self endon("dropped");
    self endon("death");
    self endon("reset");
    player endon("death_or_disconnect");
    if (!istrue(var_ea5e94e328a4b626.var_1ecf2919ce07add)) {
        player endon("manual_drop");
    }
    waitframe();
    var_af6bdfd2f2ee7bad = !isdefined(var_ea5e94e328a4b626.var_20f30c47c5442258) || !isdefined(var_ea5e94e328a4b626.var_5338ab800fa9b63a);
    offsetangle = undefined;
    var_20f30c47c5442258 = undefined;
    if (!var_af6bdfd2f2ee7bad) {
        offsetangle = var_ea5e94e328a4b626.var_5338ab800fa9b63a;
        var_20f30c47c5442258 = var_ea5e94e328a4b626.var_20f30c47c5442258;
    } else {
        /#
            assertex(!isdefined(var_ea5e94e328a4b626.var_20f30c47c5442258) && !isdefined(var_ea5e94e328a4b626.var_5338ab800fa9b63a), "Both dropDist and offsetAngleFromForward2D must be undefined or defined in create_manual_drop_data_struct");
        #/
    }
    var_2a707efff417be6a = isbombmode();
    ignoreents = [];
    if (isdefined(var_ea5e94e328a4b626.ignoreents)) {
        ignoreents = var_ea5e94e328a4b626.ignoreents;
    }
    ignoreents[ignoreents.size] = player;
    contents = create_contents(0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
    while (1) {
        if (namespace_f8065cafc523dba5::function_1e4a0e61fdb00e32(player) || istrue(player.var_c47eba4c148afa86)) {
            function_3a3c81e298ffb596(player, 0);
            waitframe();
            continue;
        }
        if (var_2a707efff417be6a) {
            touching = 0;
            foreach (bombzone in level.objectives) {
                if (player istouching(bombzone.trigger)) {
                    function_3a3c81e298ffb596(player, 0);
                    touching = 1;
                    break;
                }
            }
            if (touching) {
                waitframe();
                continue;
            }
        }
        trace = undefined;
        height = player geteye()[2] - player.origin[2];
        end = player.origin + (0, 0, height / 2);
        if (!var_af6bdfd2f2ee7bad && isdefined(offsetangle) && isdefined(var_20f30c47c5442258)) {
            forward = anglestoforward(player getplayerangles());
            x = forward[0] * cos(offsetangle) - forward[1] * sin(offsetangle);
            y = forward[0] * sin(offsetangle) + forward[1] * cos(offsetangle);
            newforward = (x, y, 0);
            var_23596220a6c8c97d = var_20f30c47c5442258 * vectornormalize(newforward);
            height = player geteye()[2] - player.origin[2];
            start = player.origin + (0, 0, height / 2);
            end = start + var_23596220a6c8c97d;
            trace = namespace_2a184fc4902783dc::sphere_trace(start, end, height / 2 - 1, ignoreents, contents);
            /#
                if (getdvarint(@"hash_a1028bc0f66ae86", 0)) {
                    namespace_2a184fc4902783dc::draw_trace(trace, (0, 0, 1));
                }
            #/
        }
        candrop = var_af6bdfd2f2ee7bad || !var_af6bdfd2f2ee7bad && isdefined(trace) && trace["fraction"] == 1;
        if (istrue(var_ea5e94e328a4b626.var_1ecf2919ce07add)) {
            candrop = 1;
            end = getclosestpointonnavmesh(trace["position"]) + (0, 0, 20);
            height = 60;
        }
        if (!istrue(candrop)) {
            trace = namespace_2a184fc4902783dc::convert_surface_flag(trace);
            switch (trace["surfacetype"]) {
            case #"hash_bc95225f1fcb16e9":
                candrop = 1;
                break;
            default:
                break;
            }
        }
        if (istrue(candrop)) {
            if (function_babd6a87808a6651(player)) {
                function_3a3c81e298ffb596(player, 0);
            } else {
                var_9d0d801eab27109a = namespace_2a184fc4902783dc::ray_trace(end, end - (0, 0, height), ignoreents, contents);
                /#
                    if (getdvarint(@"hash_a1028bc0f66ae86", 0)) {
                        namespace_2a184fc4902783dc::draw_trace(var_9d0d801eab27109a, (1, 0, 0));
                    }
                #/
                if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_9d0d801eab27109a["position"]) || namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_9d0d801eab27109a["position"] + (0, 0, 12)) || function_c3c18fcce2d382d(var_9d0d801eab27109a["position"])) {
                    function_3a3c81e298ffb596(player, 0);
                } else if (vectordot(var_9d0d801eab27109a["normal"], (0, 0, 1)) > 0.8) {
                    candrop = 1;
                    if (isdefined(var_9d0d801eab27109a["entity"])) {
                        if (function_4fcffd6d229b848a(var_9d0d801eab27109a["entity"])) {
                            candrop = 0;
                        }
                    }
                    function_3a3c81e298ffb596(player, candrop, var_9d0d801eab27109a);
                } else {
                    function_3a3c81e298ffb596(player, 0);
                }
            }
        } else {
            function_3a3c81e298ffb596(player, 0);
        }
        if (!player isonground()) {
            function_3a3c81e298ffb596(player, 0);
        }
        waitframe();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3195
// Size: 0x82
function function_4fcffd6d229b848a(ent) {
    if (isdefined(ent.cover) && isdefined(ent.cover.equipmentref) && ent.cover.equipmentref == "equip_tac_cover") {
        return 1;
    } else if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_tac_cover") {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321f
// Size: 0xdd
function function_3a3c81e298ffb596(player, enable, trace) {
    if (isdefined(trace) && enable) {
        self.var_1972ccb1779c69d1 = trace;
    }
    if (isdefined(self.var_8a6e15b947edab69) && self.var_8a6e15b947edab69 == enable) {
        return;
    }
    self.var_8a6e15b947edab69 = enable;
    enable = enable || istrue(self.var_ea5e94e328a4b626.var_1ecf2919ce07add);
    if (player usinggamepad()) {
        if (enable) {
            player notifyonplayercommand("manual_drop", "+actionslot 2");
        } else {
            player notifyonplayercommandremove("manual_drop", "+actionslot 2");
        }
    } else if (enable) {
        player notifyonplayercommand("manual_drop", "+armor");
    } else {
        player notifyonplayercommandremove("manual_drop", "+armor");
    }
    player setclientomnvar("ui_carry_object_can_drop", enable);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3303
// Size: 0x19
function function_ffae0b2bdeb1bb92(player) {
    return !istrue(player.var_1cecd248dd213dce);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3324
// Size: 0xd0
function updatecurorigin() {
    self endon("gameobject_deleted");
    level endon("game_ended");
    if (isdefined(self.trigger)) {
        self.trigger endon("move_gameobject");
    }
    if (getgametype() == "front") {
        self.carrier endon("disconnect");
    }
    while (1) {
        if (isdefined(self.carrier)) {
            self.curorigin = self.carrier.origin + (0, 0, 75);
            self.curcarrierorigin = self.carrier.origin;
        } else {
            self.curorigin = self.trigger.origin;
            self.curcarrierorigin = undefined;
        }
        waitframe();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33fb
// Size: 0x30c
function updatecarryobjectorigin() {
    self endon("gameobject_deleted");
    level endon("game_ended");
    if (isdefined(self.trigger)) {
        self.trigger endon("move_gameobject");
    }
    thread updatecurorigin();
    if (!isdefined(self.objpingdelay)) {
        self.objpingdelay = 4;
    }
    for (;;) {
        for (;;) {
            if (self.objpingdelay == 0) {
                break;
            }
            if (isdefined(self.carrier)) {
                if (self.objidpingfriendly) {
                    foreach (teamname in level.teamnamelist) {
                        if ((self.visibleteam == "friendly" || self.visibleteam == "any") && !isfriendlyteam(teamname)) {
                            if (self.showworldicon) {
                                if (isdefined(self.pingobjidnum)) {
                                    namespace_5a22b6f3a56f7e9b::update_objective_position(self.pingobjidnum, self.carrier.origin);
                                    if (istrue(self.pingplayers)) {
                                        objective_setpings(self.pingobjidnum, 1);
                                    } else {
                                        objective_setpingsforteam(self.pingobjidnum, teamname);
                                    }
                                    objective_ping(self.pingobjidnum);
                                } else {
                                    if (istrue(self.pingplayers)) {
                                        objective_setpings(self.objidnum, 1);
                                    } else {
                                        objective_setpingsforteam(self.objidnum, teamname);
                                    }
                                    objective_ping(self.objidnum);
                                }
                            }
                        }
                    }
                }
                if (self.objidpingenemy) {
                    foreach (teamname in level.teamnamelist) {
                        if ((self.visibleteam == "enemy" || self.visibleteam == "any") && isfriendlyteam(teamname)) {
                            if (self.showworldicon) {
                                if (isdefined(self.pingobjidnum)) {
                                    namespace_5a22b6f3a56f7e9b::update_objective_position(self.pingobjidnum, self.curorigin);
                                    if (istrue(self.pingplayers)) {
                                        objective_setpings(self.pingobjidnum, 1);
                                    } else {
                                        objective_setpingsforteam(self.pingobjidnum, teamname);
                                    }
                                    objective_ping(self.pingobjidnum);
                                } else {
                                    if (istrue(self.pingplayers)) {
                                        objective_setpings(self.objidnum, 1);
                                    } else {
                                        objective_setpingsforteam(self.objidnum, teamname);
                                    }
                                    objective_ping(self.objidnum);
                                }
                            }
                        }
                    }
                }
                waittill_any_timeout_no_endon_death_2(self.objpingdelay, "dropped", "reset");
                continue;
            }
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x370e
// Size: 0x3b
function hidecarryiconongameend() {
    self endon("death_or_disconnect");
    self endon("drop_object");
    level waittill("game_ended");
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 0;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3750
// Size: 0x3f
function gameobjects_getcurrentprimaryweapon() {
    curr = self getcurrentweapon();
    var_d426589e25665839 = self getcurrentprimaryweapon();
    var_a332a0449da18650 = var_d426589e25665839 getaltweapon();
    if (var_a332a0449da18650 == curr) {
        return curr;
    }
    return var_d426589e25665839;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3797
// Size: 0x6b
function watchcarryobjectweaponswitch(weapon) {
    self endon("goal_scored");
    starttime = gettime();
    result = domonitoredweaponswitch(weapon, 1);
    if (isdefined(result)) {
        if (result == 0) {
            if (starttime == gettime()) {
                waittillframeend();
            }
            if (isdefined(self.carryobject)) {
                self.carryobject thread setdropped();
            }
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3809
// Size: 0x1ac
function giveobject(object) {
    /#
        assert(!isdefined(self.carryobject));
    #/
    self.carryobject = object;
    thread trackcarrier();
    if (isdefined(object.carryweapon)) {
        object.carrierweaponcurrent = gameobjects_getcurrentprimaryweapon();
        object.carrierhascarryweaponinloadout = self hasweapon(object.carryweapon);
        if (isdefined(object.carryweaponthink)) {
            self thread [[ object.carryweaponthink ]]();
        }
        self giveweapon(object.carryweapon);
        thread watchcarryobjectweaponswitch(object.carryweapon);
        self disableweaponpickup();
        val::set("giveObject", "weapon_switch", 0);
    } else if (!object.allowweapons) {
        val::set("giveObject", "weapon", 0);
        thread manualdropthink();
    }
    if (isdefined(object.carryicon)) {
        if (level.splitscreen) {
            self.carryicon = createicon(object.carryicon, 33, 33);
            self.carryicon setpoint("BOTTOM LEFT", "BOTTOM LEFT", -50, -78);
        } else {
            self.carryicon = createicon(object.carryicon, 50, 50);
            self.carryicon setpoint("BOTTOM LEFT", "BOTTOM LEFT", 175, -30);
        }
        self.carryicon.hidewheninmenu = 1;
        thread hidecarryiconongameend();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bc
// Size: 0x222
function function_25261199a27252e(var_7591ed99e87a77d3) {
    if (!isdefined(var_7591ed99e87a77d3)) {
        thread pickuptimeout(var_7591ed99e87a77d3);
        return;
    }
    self notify("manual_drop_cleanup");
    for (index = 0; index < self.visuals.size; index++) {
        var_bf8e5f003146af44 = self.visuals[index] getlinkedparent();
        if (isdefined(var_bf8e5f003146af44)) {
            self.visuals[index] unlink();
        }
        self.visuals[index] scriptmodelclearanim();
        if (isdefined(var_7591ed99e87a77d3)) {
            self.visuals[index].origin = var_7591ed99e87a77d3;
        } else if (isbombmode() && self.visuals[index].targetname == "sd_bomb") {
            self.visuals[index].origin = level.bombrespawnpoint;
            self.visuals[index].angles = level.bombrespawnangles;
        } else {
            self.visuals[index].origin = self.visuals[index].baseorigin;
            self.visuals[index].angles = self.visuals[index].baseangles;
        }
        self.visuals[index] show();
    }
    var_bf8e5f003146af44 = self.trigger getlinkedparent();
    if (isdefined(var_bf8e5f003146af44)) {
        self.trigger unlink();
    }
    self.trigger.origin = self.trigger.baseorigin;
    if (isdefined(var_7591ed99e87a77d3)) {
        self.trigger.origin = var_7591ed99e87a77d3;
    }
    self.curorigin = self.trigger.origin;
    clearcarrier();
    if (isdefined(self.var_4bcc694316c44d94)) {
        self [[ self.var_4bcc694316c44d94 ]](self);
    } else {
        updatecompassicons();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be5
// Size: 0x252
function returnhome(var_7591ed99e87a77d3) {
    self.isresetting = 1;
    self notify("manual_drop_cleanup");
    self notify("reset");
    for (index = 0; index < self.visuals.size; index++) {
        var_bf8e5f003146af44 = self.visuals[index] getlinkedparent();
        if (isdefined(var_bf8e5f003146af44)) {
            self.visuals[index] unlink();
        }
        self.visuals[index] scriptmodelclearanim();
        if (isdefined(var_7591ed99e87a77d3)) {
            self.visuals[index].origin = var_7591ed99e87a77d3;
        } else if (isbombmode() && self.visuals[index].targetname == "sd_bomb") {
            self.visuals[index].origin = level.bombrespawnpoint;
            self.visuals[index].angles = level.bombrespawnangles;
        } else {
            self.visuals[index].origin = self.visuals[index].baseorigin;
            self.visuals[index].angles = self.visuals[index].baseangles;
        }
        self.visuals[index] show();
    }
    var_bf8e5f003146af44 = self.trigger getlinkedparent();
    if (isdefined(var_bf8e5f003146af44)) {
        self.trigger unlink();
    }
    self.trigger.origin = self.trigger.baseorigin;
    if (isdefined(var_7591ed99e87a77d3)) {
        self.trigger.origin = var_7591ed99e87a77d3;
    }
    self.curorigin = self.trigger.origin;
    if (isdefined(self.onreset)) {
        self [[ self.onreset ]]();
    }
    clearcarrier();
    if (isdefined(self.var_4bcc694316c44d94)) {
        self [[ self.var_4bcc694316c44d94 ]](self);
    } else {
        updatecompassicons();
    }
    self.isresetting = 0;
    self notify("reset_done");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3e
// Size: 0x36
function ishome() {
    if (isdefined(self.carrier)) {
        return 0;
    }
    if (self.curorigin != self.trigger.baseorigin) {
        return 0;
    }
    return 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e7c
// Size: 0x101
function setposition(origin, angles) {
    self.isresetting = 1;
    for (index = 0; index < self.visuals.size; index++) {
        self.visuals[index].origin = origin;
        self.visuals[index].angles = angles;
        self.visuals[index] show();
    }
    self.trigger.origin = origin;
    if (getgametype() == "ball" || getgametype() == "tdef") {
        self.trigger linkto(self.visuals[0]);
    }
    self.curorigin = self.trigger.origin;
    clearcarrier();
    updatecompassicons();
    self.isresetting = 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f84
// Size: 0x87
function carryobject_overridemovingplatformdeath(data) {
    for (index = 0; index < data.carryobject.visuals.size; index++) {
        data.carryobject.visuals[index] unlink();
    }
    data.carryobject.trigger unlink();
    waitframe();
    data.carryobject thread setdropped(1);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4012
// Size: 0xbec
function setdropped(var_f2f5b1863e65433f, var_55d7a145d6897d3, var_74435d86cb84be29, var_a4b132b2321973cd) {
    if (isdefined(self.setdropped) && [[ self.setdropped ]]()) {
        return;
    }
    self.isresetting = 1;
    self.resetnow = undefined;
    self notify("dropped");
    foreach (visual in self.visuals) {
        visual notsolid();
    }
    if (isdefined(self.carrier)) {
        droppoint = self.carrier.origin;
    } else {
        droppoint = self.curorigin;
    }
    if (istrue(level.botsenabled) || touchingdroptonavmeshtrigger(droppoint) || level.mapname == "mp_junk" && (level.gametype == "ctf" || level.gametype == "bigctf") && !self.carrier namespace_19b4203b51d56488::touchingarbitraryuptrigger() || istrue(self.var_ea5e94e328a4b626.var_1ecf2919ce07add)) {
        droppoint = getclosestpointonnavmesh(droppoint);
    }
    if (isdefined(level.bombdroploc)) {
        droppoint = level.bombdroploc;
        level.bombdroploc = undefined;
    }
    if (isdefined(var_55d7a145d6897d3)) {
        var_869e9fd0cdbd405a = var_55d7a145d6897d3;
    } else {
        var_869e9fd0cdbd405a = 20;
    }
    var_12f59cd9e8d7e077 = 4000;
    upangles = (0, 0, 0);
    var_16c9ad20a2797135 = droppoint + (0, 0, var_869e9fd0cdbd405a);
    var_812238f6f1f6728c = droppoint - (0, 0, var_12f59cd9e8d7e077);
    contentoverride = create_contents(0, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    ignoreents[ignoreents.size] = self.visuals[0];
    if (isdefined(self.carrier)) {
        ignoreents[ignoreents.size] = self.carrier;
    }
    if (isdefined(self.var_1972ccb1779c69d1) && istrue(var_a4b132b2321973cd)) {
        trace = self.var_1972ccb1779c69d1;
        self.var_1972ccb1779c69d1 = undefined;
    } else if (isdefined(self.carrier) && self.carrier.team != "spectator") {
        var_8d392109c97647b8 = 8;
        var_8d5c3709c99cbfd2 = 16;
        if (getgametype() == "cyber") {
            var_8d392109c97647b8 = 4;
            var_8d5c3709c99cbfd2 = 8;
        } else if (getgametype() == "ctf" || getgametype() == "bigctf" || getgametype() == "tdef" || istrue(self.var_ea5e94e328a4b626.var_1ecf2919ce07add)) {
            var_8d392109c97647b8 = 2;
            var_8d5c3709c99cbfd2 = 4;
        }
        trace = capsule_trace(var_16c9ad20a2797135, var_812238f6f1f6728c, var_8d392109c97647b8, var_8d5c3709c99cbfd2, (0, 0, 0), ignoreents, contentoverride, 0);
        for (i = 0; i < 4; i++) {
            var_8b39d5984da1dc7f = trace["entity"];
            if (isdefined(var_8b39d5984da1dc7f)) {
                if (isdefined(var_8b39d5984da1dc7f.code_classname) && var_8b39d5984da1dc7f.code_classname == "script_vehicle" && (!isdefined(var_8b39d5984da1dc7f.vehiclename) || isdefined(var_8b39d5984da1dc7f.vehiclename) && var_8b39d5984da1dc7f.vehiclename != "pac_sentry") || isdefined(var_8b39d5984da1dc7f.objweapon) && isweapon(var_8b39d5984da1dc7f.objweapon) || isdefined(var_8b39d5984da1dc7f) && istrue(var_8b39d5984da1dc7f.issuper) && isdefined(var_8b39d5984da1dc7f.equipmentref) && (var_8b39d5984da1dc7f.equipmentref == "equip_ammo_box" || var_8b39d5984da1dc7f.equipmentref == "equip_trophy") || isdefined(var_8b39d5984da1dc7f.code_classname) && var_8b39d5984da1dc7f.code_classname == "weapon_scavenger_bag_mp" || isdefined(var_8b39d5984da1dc7f.code_classname) && var_8b39d5984da1dc7f.code_classname == "grenade") {
                    ignoreents[ignoreents.size] = trace["entity"];
                    trace = capsule_trace(var_16c9ad20a2797135, var_812238f6f1f6728c, var_8d392109c97647b8, var_8d5c3709c99cbfd2, (0, 0, 0), ignoreents, contentoverride, 0);
                }
            } else {
                break;
            }
        }
    } else {
        trace = ray_trace(self.safeorigin + (0, 0, 20), self.safeorigin - (0, 0, 20), ignoreents, contentoverride, 0);
        if (isplayer(trace["entity"])) {
            trace["entity"] = undefined;
        }
        if (isdefined(trace["entity"]) && isdefined(trace["entity"].code_classname) && trace["entity"].code_classname == "script_vehicle") {
            ignoreents[ignoreents.size] = trace["entity"];
            trace = ray_trace(self.safeorigin + (0, 0, 20), self.safeorigin - (0, 0, 20), ignoreents, contentoverride, 0);
        }
    }
    foreach (visual in self.visuals) {
        visual solid();
    }
    droppingplayer = self.carrier;
    if (isdefined(trace)) {
        tempangle = randomfloat(360);
        droporigin = trace["position"];
        if (isdefined(self.visualgroundoffset)) {
            droporigin = droporigin + self.visualgroundoffset;
        }
        forward = (cos(tempangle), sin(tempangle), 0);
        forward = vectornormalize(forward - trace["normal"] * vectordot(forward, trace["normal"]));
        var_6e1cff2315b21cee = 0;
        if (getgametype() == "ctf" || getgametype() == "bigctf" || getgametype() == "tdef" || isbombmode()) {
            dropangles = (0, 0, 0);
        } else {
            dropangles = vectortoangles(forward);
        }
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index].origin = droporigin;
            self.visuals[index].angles = dropangles;
            self.visuals[index] show();
        }
        self.trigger.origin = droporigin + (0, 0, var_6e1cff2315b21cee);
        self.curorigin = self.trigger.origin;
        mover = undefined;
        var_8b39d5984da1dc7f = trace["entity"];
        if (isdefined(var_8b39d5984da1dc7f) && !isplayer(var_8b39d5984da1dc7f) && !isweapon(var_8b39d5984da1dc7f) && isdefined(var_8b39d5984da1dc7f.objweapon) && !isweapon(var_8b39d5984da1dc7f.objweapon) && !isbot(var_8b39d5984da1dc7f) && !isagent(var_8b39d5984da1dc7f) && !isturret(var_8b39d5984da1dc7f) && (isdefined(var_8b39d5984da1dc7f.classname) || var_8b39d5984da1dc7f.classname != "script_vehicle" && var_8b39d5984da1dc7f.classname != "rocket")) {
            mover = trace["entity"];
        }
        if (isdefined(var_8b39d5984da1dc7f) && getgametype() == "bigctf") {
            if (var_8b39d5984da1dc7f.classname == "script_vehicle") {
                mover = trace["entity"];
            }
        }
        level.var_8b39d5984da1dc7f = trace["entity"];
        if (isdefined(var_8b39d5984da1dc7f) && (istrue(var_8b39d5984da1dc7f.issuper) || isdefined(var_8b39d5984da1dc7f.streakinfo))) {
            neworigin = getclosestpointonnavmesh(self.curorigin + forward * 40);
            if (isdefined(self.visualgroundoffset)) {
                neworigin = neworigin + self.visualgroundoffset;
            }
            for (index = 0; index < self.visuals.size; index++) {
                self.visuals[index].origin = neworigin;
            }
            self.trigger.origin = neworigin;
            self.curorigin = self.trigger.origin;
        }
        if (isdefined(mover) && isdefined(mover.owner)) {
            var_bf8e5f003146af44 = mover getlinkedparent();
            if (isdefined(var_bf8e5f003146af44)) {
                mover = var_bf8e5f003146af44;
            }
        }
        if (isdefined(mover)) {
            if (isdefined(mover.invalid_gameobject_mover) && mover.invalid_gameobject_mover == 1) {
                self.resetnow = 1;
            } else {
                for (index = 0; index < self.visuals.size; index++) {
                    self.visuals[index] linkto(mover);
                }
                if (self.trigger.classname == "trigger_radius") {
                    self.var_9b5757415b1fcd6a = spawn("script_origin", self.trigger.origin);
                    self.var_9b5757415b1fcd6a linkto(mover);
                    thread function_1d526ea6a817700c();
                } else {
                    self.trigger linkto(mover);
                }
                data = spawnstruct();
                data.carryobject = self;
                data.deathoverridecallback = &carryobject_overridemovingplatformdeath;
                self.trigger thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
            }
        }
        thread function_ae5131ddfa2b3af4(var_f2f5b1863e65433f);
    } else {
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index].origin = self.visuals[index].baseorigin;
            self.visuals[index].angles = self.visuals[index].baseangles;
            self.visuals[index] show();
        }
        self.trigger.origin = self.trigger.baseorigin;
        self.curorigin = self.trigger.baseorigin;
    }
    if (isdefined(self.ondrop) && !isdefined(var_f2f5b1863e65433f)) {
        self [[ self.ondrop ]](droppingplayer);
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.var_22282e7d48ca3400 = droppingplayer;
    var_7e2c53b0bcf117d9.var_239b4b5fa4bcf6c6 = self;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_objective_state_changed", var_7e2c53b0bcf117d9);
    clearcarrier();
    if (!istrue(var_74435d86cb84be29)) {
        if (isdefined(self.var_4bcc694316c44d94)) {
            self [[ self.var_4bcc694316c44d94 ]](self);
        } else {
            updatecompassicons();
        }
    }
    self.isresetting = 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c05
// Size: 0x77
function function_1d526ea6a817700c() {
    level endon("disconnect");
    self endon("pickup_object");
    self endon("reset");
    self endon("platformUnlinked");
    thread function_416a3fe7e188a923();
    thread function_99ff6e53a4bfb995();
    while (1) {
        if (isdefined(self.var_9b5757415b1fcd6a)) {
            self.trigger.origin = self.var_9b5757415b1fcd6a.origin;
            wait(0.01);
        } else {
            break;
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c83
// Size: 0xad
function function_99ff6e53a4bfb995() {
    level endon("disconnect");
    level endon("game_ended");
    self endon("platformUnlinked");
    if (!isdefined(self.var_9b5757415b1fcd6a getlinkedparent())) {
        return;
    }
    self.var_9b5757415b1fcd6a getlinkedparent() waittill("death");
    for (index = 0; index < self.visuals.size; index++) {
        self.visuals[index] unlink();
    }
    self.var_9b5757415b1fcd6a unlink();
    self.var_9b5757415b1fcd6a delete();
    function_25261199a27252e(getclosestpointonnavmesh(self.curorigin));
    self notify("platformUnlinked");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d37
// Size: 0x78
function function_416a3fe7e188a923() {
    level endon("disconnect");
    level endon("game_ended");
    self endon("platformUnlinked");
    self waittill("pickup_object");
    for (index = 0; index < self.visuals.size; index++) {
        self.visuals[index] unlink();
    }
    self.var_9b5757415b1fcd6a unlink();
    self.var_9b5757415b1fcd6a delete();
    self notify("platformUnlinked");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4db6
// Size: 0x23
function function_ca7c06ef832aca23(var_8b39d5984da1dc7f) {
    self endon("pickup_object");
    var_8b39d5984da1dc7f waittill("death");
    thread setdropped();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de0
// Size: 0x1e
function setcarrier(carrier) {
    self.carrier = carrier;
    thread updatevisibilityaccordingtoradar();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e05
// Size: 0x47
function clearcarrier() {
    if (!isdefined(self.carrier)) {
        return;
    }
    self notify("dropped");
    self.carrier thread takeobject(self);
    self.carrier = undefined;
    self.curcarrierorigin = undefined;
    self notify("carrier_cleared");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e53
// Size: 0x85
function function_ae5131ddfa2b3af4(var_f2f5b1863e65433f) {
    self endon("pickup_object");
    self endon("reset_done");
    level endon("game_ended");
    waitframe();
    if (!isdefined(var_f2f5b1863e65433f)) {
        safeorigin = undefined;
        if (function_babd6a87808a6651(self.visuals[0], self.allowedintrigger) && !function_29c0cf699c075f78()) {
            safeorigin = function_d1c485a557f40cd2();
            if (isdefined(self.visualgroundoffset)) {
                safeorigin = safeorigin + self.visualgroundoffset;
            }
        }
        thread function_25261199a27252e(safeorigin);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4edf
// Size: 0x278
function pickuptimeout(var_7591ed99e87a77d3) {
    self endon("pickup_object");
    self endon("reset_done");
    level endon("game_ended");
    if (isdefined(var_7591ed99e87a77d3)) {
        returnhome(var_7591ed99e87a77d3);
        return;
    }
    if (isdefined(self.resetnow)) {
        self.resetnow = undefined;
        returnhome();
        return;
    }
    for (index = 0; index < level.radtriggers.size; index++) {
        if (!self.visuals[0] istouching(level.radtriggers[index])) {
            continue;
        }
        returnhome();
        return;
    }
    for (index = 0; index < level.minetriggers.size; index++) {
        if (!self.visuals[0] istouching(level.minetriggers[index])) {
            continue;
        }
        returnhome();
        return;
    }
    for (index = 0; index < level.hurttriggers.size; index++) {
        if (!self.visuals[0] istouching(level.hurttriggers[index])) {
            continue;
        }
        returnhome(var_7591ed99e87a77d3);
        return;
    }
    if (istrue(level.ballallowedtriggers.size)) {
        self.allowedintrigger = 0;
        foreach (trigger in level.ballallowedtriggers) {
            if (self.visuals[0] istouching(trigger)) {
                self.allowedintrigger = 1;
                break;
            }
        }
    }
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (istrue(self.allowedintrigger)) {
                break;
            }
            if (isdefined(trigger.script_noteworthy)) {
                if (trigger.script_noteworthy == "onlyVehOOB") {
                    break;
                }
            }
            if (!self.visuals[0] istouching(trigger)) {
                continue;
            }
            returnhome(var_7591ed99e87a77d3);
            return;
        }
    }
    if (isdefined(self.autoresettime)) {
        wait(self.autoresettime);
        if (!isdefined(self.carrier)) {
            returnhome();
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x515e
// Size: 0x70
function function_d1c485a557f40cd2() {
    if (isdefined(self.var_1972ccb1779c69d1) && isdefined(self.var_1972ccb1779c69d1["position"]) && !function_c3c18fcce2d382d(self.var_1972ccb1779c69d1["position"], self.allowedintrigger)) {
        return self.var_1972ccb1779c69d1["position"];
    }
    return getclosestpointonnavmesh(self.visuals[0].origin);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d6
// Size: 0x154
function takeobject(object) {
    if (isdefined(self.carryicon)) {
        self.carryicon destroyelem();
    }
    if (isdefined(self)) {
        self.carryobject = undefined;
    }
    self notify("drop_object");
    self notify("manual_drop_cleanup");
    if (object.triggertype == "proximity") {
        thread pickupobjectdelay(object);
    }
    if (isreallyalive(self) && !object.allowweapons) {
        if (isdefined(object.carryweapon)) {
            keepweapon = isdefined(object.keepcarryweapon) && object.keepcarryweapon;
            if (!object.carrierhascarryweaponinloadout && !keepweapon) {
                if (isdefined(object.ballindex)) {
                    wait(0.25);
                }
                self notify("clear_carrier");
                if (isswitchingtoweaponwithmonitoring(object.carryweapon)) {
                    abortmonitoredweaponswitch(object.carryweapon);
                } else {
                    _takeweapon(object.carryweapon);
                }
                thread forcevalidweapon(self.lastdroppableweaponobj);
            } else {
                /#
                    assertmsg("Game Objects that are carry-type but are set to let the player keep the carry weapon is not supported. A scripter needs to add support for safely switching weapons in this case");
                #/
            }
            self enableweaponpickup();
        }
        val::function_c9d0b43701bdba00("giveObject");
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5331
// Size: 0xab
function trackcarrier() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("drop_object");
    while (isdefined(self.carryobject) && isreallyalive(self)) {
        if (self isonground()) {
            trace = _bullet_trace(self.origin + (0, 0, 20), self.origin - (0, 0, 20), 0, undefined);
            if (trace["fraction"] < 1) {
                self.carryobject.safeorigin = trace["position"];
            }
        }
        wait(0.05);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53e3
// Size: 0xb2
function manualdropthink() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("drop_object");
    self endon("dropped");
    self endon("manual_drop_cleanup");
    for (;;) {
        for (;;) {
            while (self attackbuttonpressed() || self fragbuttonpressed() || self secondaryoffhandbuttonpressed() || self meleebuttonpressed()) {
                wait(0.05);
            }
            while (!self attackbuttonpressed() && !self fragbuttonpressed() && !self secondaryoffhandbuttonpressed() || self meleebuttonpressed()) {
                wait(0.05);
            }
            if (isdefined(self.carryobject) && !self usebuttonpressed()) {
                continue;
            };
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x549c
// Size: 0x2b
function deleteuseobject() {
    releaseid();
    self.trigger delete();
    self.trigger = undefined;
    self notify("deleted");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54ce
// Size: 0x4d9
function createuseobject(ownerteam, trigger, visuals, var_e62df0718b7dcbca, var_3c2389ba69e5822b, var_8b9949739f4e0f6, showoncompass) {
    if (istrue(trigger.isuseobject)) {
        useobject = trigger;
    } else {
        useobject = spawnstruct();
    }
    useobject.type = "useObject";
    useobject.curorigin = trigger.origin;
    useobject.ownerteam = ownerteam;
    useobject.keyobject = undefined;
    if (isent(trigger)) {
        useobject.entnum = trigger getentitynumber();
    } else {
        useobject.entnum = trigger.index;
    }
    if (issubstr(trigger.classname, "use") || istrue(trigger.usetype)) {
        useobject.triggertype = "use";
    } else {
        useobject.triggertype = "proximity";
    }
    trigger.gameobject = useobject;
    useobject.trigger = trigger;
    for (index = 0; index < visuals.size; index++) {
        visuals[index].baseorigin = visuals[index].origin;
        visuals[index].baseangles = visuals[index].angles;
    }
    useobject.visuals = visuals;
    if (!isdefined(var_e62df0718b7dcbca)) {
        var_e62df0718b7dcbca = (0, 0, 0);
    }
    useobject.offset3d = var_e62df0718b7dcbca;
    useobject.compassicons = [];
    useobject requestid(1, 1, var_3c2389ba69e5822b, showoncompass, undefined, undefined, var_8b9949739f4e0f6);
    useobject.interactteam = "none";
    useobject.visibleteam = "none";
    useobject.onuse = undefined;
    useobject.oncantuse = undefined;
    useobject.usetext = "default";
    useobject.usetime = 10000;
    useobject.curprogress = 0;
    useobject.majoritycapprogress = 0;
    useobject.wasmajoritycapprogress = 0;
    useobject.stalemate = 0;
    useobject.wasstalemate = 0;
    useobject.captureblocked = 0;
    useobject.exclusiveuse = 1;
    useobject.teamprogress = [];
    useobject.teamprogress["none"] = 0;
    if (useobject.triggertype == "proximity") {
        useobject.teamusetimes = [];
        useobject.teamusetexts = [];
        useobject.numtouching["neutral"] = 0;
        useobject.touchlist["neutral"] = [];
        useobject.numtouching["none"] = 0;
        useobject.touchlist["none"] = [];
        foreach (name in level.teamnamelist) {
            useobject.teamprogress[name] = 0;
            useobject.numtouching[name] = 0;
            useobject.touchlist[name] = [];
            useobject.assisttouchlist[name] = [];
        }
        useobject.userate = 0;
        useobject.useratemultiplier = 1;
        useobject.var_f950eaa859b429c0 = 1;
        useobject.claimteam = "none";
        useobject.claimplayer = undefined;
        useobject.lastclaimteam = "none";
        useobject.lastclaimtime = 0;
        useobject.mustmaintainclaim = 0;
        useobject.cancontestclaim = 0;
        useobject thread useobjectproxthink();
    } else {
        foreach (team in level.teamnamelist) {
            useobject.teamprogress[team] = 0;
        }
        useobject.userate = 1;
        useobject.useratemultiplier = 1;
        useobject thread useobjectusethink();
    }
    return useobject;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59af
// Size: 0x27f
function createholduseobject(ownerteam, trigger, visuals, offset) {
    useobject = spawnstruct();
    useobject.type = "useObject";
    useobject.curorigin = trigger.origin;
    useobject.ownerteam = ownerteam;
    useobject.entnum = trigger getentitynumber();
    useobject.keyobject = undefined;
    useobject.triggertype = "use";
    trigger.gameobject = useobject;
    useobject.trigger = trigger;
    for (index = 0; index < visuals.size; index++) {
        visuals[index].baseorigin = visuals[index].origin;
        visuals[index].baseangles = visuals[index].angles;
    }
    useobject.visuals = visuals;
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    useobject.offset3d = offset;
    useobject.compassicons = [];
    useobject.interactteam = "none";
    useobject.visibleteam = "none";
    useobject.onuse = undefined;
    useobject.oncantuse = undefined;
    useobject.usetext = "default";
    useobject.usetime = 10000;
    useobject.curprogress = 0;
    useobject.stalemate = 0;
    useobject.wasstalemate = 0;
    useobject.captureblocked = 0;
    useobject.exclusiveuse = 1;
    useobject.teamprogress = [];
    useobject.teamprogress["none"] = 0;
    foreach (team in level.teamnamelist) {
        useobject.teamprogress[team] = 0;
    }
    useobject.userate = 1;
    useobject.useratemultiplier = 1;
    useobject thread useobjectusethink();
    return useobject;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5c36
// Size: 0x253
function createdynamicholduseobject(ownerteam, pos, visuals, offset) {
    useobject = spawnstruct();
    useobject.type = "useObject";
    useobject.curorigin = pos;
    useobject.ownerteam = ownerteam;
    useobject.keyobject = undefined;
    useobject.triggertype = "use";
    for (index = 0; index < visuals.size; index++) {
        visuals[index].baseorigin = visuals[index].origin;
        visuals[index].baseangles = visuals[index].angles;
    }
    useobject.visuals = visuals;
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    useobject.offset3d = offset;
    useobject.compassicons = [];
    useobject.interactteam = "none";
    useobject.visibleteam = "none";
    useobject.onuse = undefined;
    useobject.oncantuse = undefined;
    useobject.usetext = "default";
    useobject.usetime = 10000;
    useobject.curprogress = 0;
    useobject.stalemate = 0;
    useobject.wasstalemate = 0;
    useobject.captureblocked = 0;
    useobject.exclusiveuse = 1;
    useobject.teamprogress = [];
    useobject.teamprogress["none"] = 0;
    foreach (team in level.teamnamelist) {
        useobject.teamprogress[team] = 0;
    }
    useobject.userate = 1;
    useobject.useratemultiplier = 1;
    visuals[0] makeusable();
    visuals[0] thread usedynamicobjectusethink();
    return useobject;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e91
// Size: 0x16
function setkeyobject(object) {
    self.keyobject = object;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eae
// Size: 0x169
function usedynamicobjectusethink() {
    level endon("game_ended");
    self endon("deleted");
    while (1) {
        player = self waittill("trigger");
        /#
            println("weapon");
        #/
        if (!isreallyalive(player)) {
            continue;
        }
        if (!caninteractwith(player.pers["team"], player)) {
            continue;
        }
        if (!player isonground()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        if (iskillstreakweapon(player getcurrentweapon())) {
            continue;
        }
        if (isdefined(self.usecondition)) {
            if (!self [[ self.usecondition ]](player)) {
                continue;
            }
        }
        if (isdefined(self.keyobject) && (!isdefined(player.carryobject) || player.carryobject != self.keyobject)) {
            if (isdefined(self.oncantuse)) {
                self [[ self.oncantuse ]](player);
            }
            continue;
        }
        if (isdefined(self.useweapon) && player hasweapon(self.useweapon)) {
            continue;
        }
        if (!player val::get("weapon")) {
            continue;
        }
        if (!self.exclusiveuse && !isdefined(self.exclusiveclaim)) {
            thread useholdloop(player);
        } else {
            useholdloop(player);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x601e
// Size: 0x196
function useobjectusethink() {
    level endon("game_ended");
    self endon("deleted");
    while (1) {
        player = self.trigger waittill("trigger");
        if (!isreallyalive(player)) {
            continue;
        }
        if (!caninteractwith(player.pers["team"], player)) {
            continue;
        }
        if (!player isonground() && !(istrue(self.var_dbc472744080c5d7) && player isswimming())) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        if (isdefined(level.var_5fec67fa7f314c8a)) {
            if (![[ level.var_5fec67fa7f314c8a ]](player)) {
                continue;
            }
        }
        if (isdefined(self.usecondition)) {
            if (!self [[ self.usecondition ]](player)) {
                continue;
            }
        }
        if (isdefined(self.keyobject) && (!isdefined(player.carryobject) || player.carryobject != self.keyobject)) {
            if (isdefined(self.oncantuse)) {
                self [[ self.oncantuse ]](player);
            }
            continue;
        }
        if (isdefined(self.useweapon) && player hasweapon(self.useweapon)) {
            continue;
        }
        if (!player val::get("weapon")) {
            continue;
        }
        if (player ismeleeing()) {
            continue;
        }
        if (!istrue(self.exclusiveuse) && !isdefined(self.exclusiveclaim)) {
            thread useholdloop(player);
        } else {
            useholdloop(player);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61bb
// Size: 0x152
function useholdloop(player) {
    result = 1;
    var_56c1ce01138cf718 = 0;
    finished = 0;
    while (result && (!finished || isdefined(self.var_53f88be23696a633) && [[ self.var_53f88be23696a633 ]](player))) {
        if (self.usetime > 0) {
            if (isdefined(self.onbeginuse)) {
                player updateuiprogress(self, 0);
                self [[ self.onbeginuse ]](player);
            }
            if (!isdefined(self.keyobject)) {
                thread cantusehintthink();
            }
            team = player.pers["team"];
            result = useholdthink(player);
            finished = 1;
            self notify("finished_use");
            if (isdefined(self.onenduse)) {
                self [[ self.onenduse ]](team, player, result);
            }
        }
        if (istrue(result)) {
            if (isdefined(self.onuse)) {
                self [[ self.onuse ]](player);
            }
            var_56c1ce01138cf718 = 1;
        }
    }
    if (istrue(var_56c1ce01138cf718)) {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.var_22282e7d48ca3400 = player;
        var_7e2c53b0bcf117d9.var_239b4b5fa4bcf6c6 = self;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_objective_state_changed", var_7e2c53b0bcf117d9);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6314
// Size: 0x8c
function checkobjectiskeyobject(player) {
    var_9dc8b39b9dc38ef4 = self.keyobject;
    if (!isarray(var_9dc8b39b9dc38ef4)) {
        var_9dc8b39b9dc38ef4 = [0:var_9dc8b39b9dc38ef4];
    }
    foreach (key in var_9dc8b39b9dc38ef4) {
        if (key istouching(self.trigger)) {
            return 1;
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63a8
// Size: 0x8a
function checkplayercarrykeyobject(player) {
    var_9dc8b39b9dc38ef4 = self.keyobject;
    if (!isarray(var_9dc8b39b9dc38ef4)) {
        var_9dc8b39b9dc38ef4 = [0:var_9dc8b39b9dc38ef4];
    }
    foreach (key in var_9dc8b39b9dc38ef4) {
        if (key == player.carryobject) {
            return 1;
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x643a
// Size: 0x8f
function cantusehintthink() {
    level endon("game_ended");
    self endon("deleted");
    self endon("finished_use");
    if (!isdefined(self.trigger)) {
        return;
    }
    while (1) {
        player = self.trigger waittill("trigger");
        if (!isreallyalive(player)) {
            continue;
        }
        if (!caninteractwith(player.pers["team"], player)) {
            continue;
        }
        if (isdefined(self.oncantuse)) {
            self [[ self.oncantuse ]](player);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64d0
// Size: 0x105
function getearliestclaimplayer() {
    /#
        assert(self.claimteam != "none");
    #/
    team = self.claimteam;
    earliestplayer = self.claimplayer;
    if (self.touchlist[team].size > 0) {
        earliesttime = undefined;
        players = getarraykeys(self.touchlist[team]);
        for (index = 0; index < players.size; index++) {
            touchdata = self.touchlist[team][players[index]];
            if (isdefined(touchdata.player) && isreallyalive(touchdata.player) && (!isdefined(earliesttime) || touchdata.starttime < earliesttime)) {
                earliestplayer = touchdata.player;
                earliesttime = touchdata.starttime;
            }
        }
    }
    return earliestplayer;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65dd
// Size: 0x7b
function isteamtouching() {
    var_687e3456e754e3e1 = "none";
    foreach (entry in level.teamnamelist) {
        if (self.numtouching[entry]) {
            var_687e3456e754e3e1 = entry;
            break;
        }
    }
    return var_687e3456e754e3e1 != "none";
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6660
// Size: 0xe1d
function useobjectproxthink() {
    level endon("game_ended");
    self endon("deleted");
    thread proxtriggerthink();
    if (!isdefined(self.ignorestomp)) {
        self.ignorestomp = 0;
    }
    while (1) {
        if (!isdefined(self.interactteam) || self.interactteam == "none") {
            waitframe();
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            continue;
        }
        var_56c1ce01138cf718 = 0;
        creditplayer = undefined;
        self.wasuncontested = 0;
        if (self.cancontestclaim) {
            if (self.stalemate != self.wasstalemate) {
                if (self.stalemate) {
                    if (isdefined(self.oncontested)) {
                        self [[ self.oncontested ]]();
                    }
                    var_56c1ce01138cf718 = 1;
                } else {
                    team = "none";
                    foreach (entry in level.teamnamelist) {
                        if (self.numtouching[entry]) {
                            team = entry;
                            break;
                        }
                    }
                    if (team == "none" && self.ownerteam != "neutral") {
                        team = self.ownerteam;
                        setclaimteam("none");
                        self.claimplayer = undefined;
                    }
                    foreach (entry in level.teamnamelist) {
                        if (self.touchlist[entry].size) {
                            touchlist = self.touchlist[entry];
                            var_59db5d0f4e3000a7 = getarraykeys(touchlist);
                            for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
                                player = touchlist[var_59db5d0f4e3000a7[index]].player;
                                if (!isalive(player)) {
                                    continue;
                                }
                                if (player.team == self.ownerteam) {
                                    namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21("MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", player);
                                } else {
                                    player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, undefined, 0);
                                }
                                creditplayer = player;
                            }
                            break;
                        }
                    }
                    if (isdefined(self.onuncontested)) {
                        self [[ self.onuncontested ]](team);
                    }
                    var_56c1ce01138cf718 = 1;
                    self.wasuncontested = 1;
                }
                self.wasstalemate = self.stalemate;
            }
            if (!self.stalemate && self.majoritycapprogress != self.wasmajoritycapprogress) {
                self.wasmajoritycapprogress = self.majoritycapprogress;
            }
        }
        if (!self.stalemate && !self.majoritycapprogress && !self.wasuncontested) {
            if (self.mustmaintainclaim && !istrue(self.isunoccupied)) {
                if (self.ownerteam != "neutral" && !self.numtouching[self.ownerteam]) {
                    if (isdefined(self.onunoccupied)) {
                        self [[ self.onunoccupied ]]();
                    }
                    var_56c1ce01138cf718 = 1;
                    self.isunoccupied = 1;
                    setclaimteam("none");
                    self.claimplayer = undefined;
                } else if (self.ownerteam == "neutral") {
                    if (!isteamtouching()) {
                        if (isdefined(self.onunoccupied)) {
                            self [[ self.onunoccupied ]]();
                        }
                        var_56c1ce01138cf718 = 1;
                        self.isunoccupied = 1;
                        setclaimteam("none");
                        self.claimplayer = undefined;
                    } else if (isdefined(self.numtouchrequireduse)) {
                        self [[ self.numtouchrequireduse ]](self.claimplayer.team);
                    }
                }
            } else if (!istrue(self.isunoccupied) && isdefined(self.onunoccupied)) {
                team = "none";
                foreach (entry in level.teamnamelist) {
                    if (self.numtouching[entry]) {
                        team = entry;
                        break;
                    }
                }
                if (team == "none") {
                    self.isunoccupied = 1;
                    self [[ self.onunoccupied ]]();
                }
            }
        }
        allowcapture = 1;
        if (isdefined(self.numtouchrequired) && self.numtouchrequired > self.numtouching[self.claimteam]) {
            allowcapture = 0;
        }
        if (self.claimteam != "none" && self.lastclaimteam != self.claimteam) {
            var_56c1ce01138cf718 = 1;
            creditplayer = getearliestclaimplayer();
        }
        if (self.claimteam != "none" && allowcapture) {
            if (!self.usetime) {
                if (!self.stalemate) {
                    if (isdefined(self.var_f56edb5df74ae868)) {
                        creditplayer = self [[ self.var_f56edb5df74ae868 ]]();
                    } else {
                        creditplayer = getearliestclaimplayer();
                    }
                    setclaimteam("none");
                    self.claimplayer = undefined;
                    if (isdefined(creditplayer) && isdefined(self.onuse)) {
                        self [[ self.onuse ]](creditplayer);
                    }
                    var_56c1ce01138cf718 = 1;
                    self.var_2dda7caa18ddd5f8 = 0;
                }
            } else if (self.usetime && self.teamprogress[self.claimteam] >= self.usetime) {
                self.curprogress = 0;
                self.teamprogress[self.claimteam] = self.curprogress;
                creditplayer = getearliestclaimplayer();
                setclaimteam("none");
                self.claimplayer = undefined;
                if (isdefined(self.onenduse)) {
                    self [[ self.onenduse ]](self.claimteam, creditplayer, isdefined(creditplayer));
                }
                if (isdefined(creditplayer) && isdefined(self.onuse)) {
                    self [[ self.onuse ]](creditplayer);
                }
                var_56c1ce01138cf718 = 1;
                self.var_2dda7caa18ddd5f8 = 0;
            } else if (!self.stalemate && self.usetime && (self.ownerteam != self.claimteam || istrue(self.majoritycapprogress))) {
                if (!self.numtouching[self.claimteam]) {
                    setclaimteam("none");
                    if (isdefined(self.onenduse)) {
                        self [[ self.onenduse ]](self.claimteam, self.claimplayer, 0);
                    }
                    self.claimplayer = undefined;
                    var_56c1ce01138cf718 = 1;
                    self.var_2dda7caa18ddd5f8 = 0;
                } else if (canstompprogresswithstalemate(self.claimteam) && self.ownerteam == "neutral") {
                    if (self.lastclaimteam == self.claimteam && istrue(self.majoritycapprogress)) {
                        if (isdefined(self.lastprogressteam) && self.lastprogressteam != self.claimteam && self.teamprogress[self.claimteam] == 0) {
                            stompenemyteamprogress(self.claimteam);
                        } else {
                            self.lastprogressteam = self.claimteam;
                            applycaptureprogressanduseupdate();
                        }
                    }
                } else if (canstompprogress(self.claimteam) && self.ownerteam == "neutral" && self.lastclaimteam != self.claimteam) {
                    if (self.lastclaimteam != self.claimteam) {
                        if (isdefined(self.lastprogressteam) && self.lastprogressteam != self.claimteam && self.teamprogress[self.claimteam] == 0) {
                            stompenemyteamprogress(self.claimteam);
                        } else if (isdefined(self.lastprogressteam) && self.lastprogressteam != self.claimteam && self.teamprogress[self.lastprogressteam] > 0) {
                            stompenemyteamprogress(self.claimteam);
                        } else {
                            self.lastprogressteam = self.claimteam;
                            applycaptureprogressanduseupdate();
                        }
                    }
                } else if (canstompprogress(self.claimteam) && self.ownerteam == self.claimteam && (!istrue(self.var_823c5a7bf6a0e64a) || !istrue(self.teamprogress[self.ownerteam]))) {
                    if (isdefined(self.lastprogressteam) && self.lastprogressteam == self.claimteam && self.teamprogress[self.claimteam] == 0) {
                        stompenemyteamprogress(self.claimteam);
                    } else if (isdefined(self.lastprogressteam) && self.lastprogressteam != self.claimteam && self.teamprogress[self.lastprogressteam] > 0 && self.teamprogress[self.claimteam] == 0) {
                        stompenemyteamprogress(self.claimteam);
                    }
                } else if (canstompprogress(self.claimteam) && self.ownerteam != self.claimteam && istrue(self.var_823c5a7bf6a0e64a) && istrue(self.teamprogress[self.ownerteam])) {
                    if (isdefined(self.lastprogressteam) && self.lastprogressteam == self.claimteam && self.teamprogress[self.claimteam] == 0) {
                        stompenemyteamprogress(self.claimteam);
                    } else if (isdefined(self.lastprogressteam) && self.lastprogressteam != self.claimteam && self.teamprogress[self.lastprogressteam] > 0 && self.teamprogress[self.claimteam] == 0) {
                        stompenemyteamprogress(self.claimteam);
                    }
                } else {
                    if (isdefined(self.stronghold) && isdefined(self.stronghold.var_4756733ecc825a2) && self.claimteam == self.stronghold.var_4756733ecc825a2) {
                        goto LOC_00000d0d;
                    }
                    if (self.ownerteam != self.claimteam) {
                        self.setblocking = 0;
                        self.setdefending = 0;
                        self.lastprogressteam = self.claimteam;
                        applycaptureprogressanduseupdate();
                    } else if (self.ownerteam == self.claimteam && istrue(self.var_823c5a7bf6a0e64a) && (!istrue(self.var_11d80259a066ab76) || self.curprogress < self.var_9abe4ab71ae5d548)) {
                        self.setblocking = 0;
                        self.setdefending = 0;
                        self.lastprogressteam = self.claimteam;
                        applycaptureprogressanduseupdate();
                    } else if (self.ownerteam == self.claimteam && istrue(self.majoritycapprogress)) {
                        var_351b93a4de4cf1ce = getnumtouchingexceptteam(self.claimteam);
                        if (var_351b93a4de4cf1ce && !istrue(self.setblocking)) {
                            self.setblocking = 1;
                            self.setdefending = 0;
                            namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS");
                            namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS");
                        } else if (!var_351b93a4de4cf1ce && !istrue(self.setdefending)) {
                            self.setblocking = 0;
                            self.setdefending = 1;
                            namespace_19b4203b51d56488::setobjectivestatusicons(level.var_a58e0495b821276, level.iconcapture);
                        LOC_00000d0d:
                        }
                    LOC_00000d0d:
                    }
                LOC_00000d0d:
                }
            LOC_00000d0d:
            } else if (!self.stalemate && self.usetime && self.ownerteam == self.claimteam) {
                if (!self.numtouching[self.claimteam]) {
                    setclaimteam("none");
                    self.claimplayer = undefined;
                    if (isdefined(self.onenduse)) {
                        self [[ self.onenduse ]](self.claimteam, self.claimplayer, 0);
                    }
                    self.var_2dda7caa18ddd5f8 = 0;
                }
            }
        } else if (canstompprogress(self.ownerteam) && self.ownerteam != "neutral") {
            stompenemyteamprogress(self.ownerteam);
        }
        if (var_56c1ce01138cf718) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.var_22282e7d48ca3400 = creditplayer;
            var_7e2c53b0bcf117d9.var_239b4b5fa4bcf6c6 = self;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_objective_state_changed", var_7e2c53b0bcf117d9);
        }
        waitframe();
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7484
// Size: 0x46
function canstompprogress(var_c8200acbb85ac41f) {
    return !istrue(self.ignorestomp) && self.touchlist[var_c8200acbb85ac41f].size > 0 && !istrue(self.stalemate) && self.curprogress > 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d2
// Size: 0x45
function canstompprogresswithstalemate(var_c8200acbb85ac41f) {
    return !istrue(self.ignorestomp) && self.touchlist[var_c8200acbb85ac41f].size > 0 && self.majoritycapprogress && self.curprogress > 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x751f
// Size: 0xd3
function applycaptureprogressanduseupdate() {
    if (isdefined(self.var_944611b28b2c72b9)) {
        var_943409b28b1823c5 = self [[ self.var_944611b28b2c72b9 ]](1);
        if (!var_943409b28b1823c5) {
            return;
        }
    }
    applycaptureprogress(self.claimteam, level.frameduration * self.userate);
    if (isdefined(self.onuseupdate)) {
        self [[ self.onuseupdate ]](self.claimteam, self.teamprogress[self.claimteam] / self.usetime, level.frameduration * self.userate / self.usetime, self.claimplayer);
    }
    if (isdefined(self.var_1b36c96ff904e7e6)) {
        self [[ self.var_1b36c96ff904e7e6 ]](1);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f9
// Size: 0x4d8
function stompenemyteamprogress(team) {
    if (isdefined(self.stompeenemyprogressupdate)) {
        self [[ self.stompeenemyprogressupdate ]](team);
    }
    delta = level.frameduration * self.userate;
    if (istrue(self.var_823c5a7bf6a0e64a) && self.ownerteam != "neutral" && team != self.ownerteam) {
        if (isdefined(self.reinforcementStompScalar) && self.reinforcementStompScalar > 0) {
            delta = delta * self.reinforcementStompScalar;
        }
    }
    numtouching = getnumtouchingforteam(self.claimteam);
    numother = getnumtouchingexceptteam(self.claimteam);
    var_b0c33d224b825287 = getenemyteams(team);
    foreach (entry in var_b0c33d224b825287) {
        var_75016344bdee1d3a = self.teamprogress[entry];
        if (var_75016344bdee1d3a > 0) {
            if (var_75016344bdee1d3a < delta) {
                self.teamprogress[entry] = 0;
                self.curprogress = self.teamprogress[entry];
                namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
                namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
                delta = delta - var_75016344bdee1d3a;
            } else {
                self.isunoccupied = 0;
                self.var_b276b0d8cbbd0480 = 1;
                self.teamprogress[entry] = self.teamprogress[entry] - delta;
                var_159b97bd7931576c = 0;
                if (isdefined(self.var_ae9b09d28693b763)) {
                    var_9d549ff24e2f8c80 = self.usetime * self.var_ae9b09d28693b763 / level.var_da41c55843e26237;
                    if (self.teamprogress[entry] < var_9d549ff24e2f8c80) {
                        self.teamprogress[entry] = var_9d549ff24e2f8c80;
                        var_159b97bd7931576c = 1;
                    }
                }
                delta = 0;
                self.curprogress = self.teamprogress[entry];
                namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 1);
                namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, entry);
                namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, self.curprogress / self.usetime);
                if (!var_159b97bd7931576c) {
                    namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_CLEARING_CAPS");
                    if (isdefined(self.var_ae9b09d28693b763)) {
                        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_LOSING_CAPS");
                    } else {
                        foreach (player in getteamdata(team, "players")) {
                            if (numtouching > 0 && numother > 0) {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", 3);
                            } else if (istrue(self.var_823c5a7bf6a0e64a) && istrue(self.var_11d80259a066ab76) && self.ownerteam != team) {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_PUSHING_CAPS");
                            } else if (self.curprogress > 0) {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_CLEARING_CAPS");
                            } else {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(0, undefined, 0);
                            }
                        }
                        if (numtouching > 0 && numother > 0) {
                            foreach (player in getteamdata(entry, "players")) {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", 3);
                            }
                        }
                    }
                }
            }
        }
    }
    if (self.curprogress <= 0) {
        foreach (p in self.touchlist[self.ownerteam]) {
            if (isdefined(self.stompprogressreward)) {
                [[ self.stompprogressreward ]](p.player);
            }
        }
        if (isdefined(self.var_dbee3cf9cc42cf08)) {
            [[ self.var_dbee3cf9cc42cf08 ]](team);
        }
        self.var_b276b0d8cbbd0480 = undefined;
        self.lastprogressteam = undefined;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ad8
// Size: 0x3c9
function useobjectdecay(team) {
    if (getcapturebehavior() != "normal" && getgametype() != "arm" && getgametype() != "conflict") {
        return;
    }
    level endon("game_ended");
    self endon("deleted");
    self notify("useObjectDecay");
    self endon("useObjectDecay");
    var_816a8b5fc977cf64 = 0;
    while (1) {
        waitframe();
        objid = self.objidnum;
        if (self.stalemate) {
            var_816a8b5fc977cf64 = 0;
        }
        if (self.claimteam == "none" || istrue(self.var_a54131d8e1f9237a)) {
            if (self.usetime) {
                if (!self.stalemate) {
                    if (istrue(self.decaygraceperiod) && var_816a8b5fc977cf64 < self.decaygraceperiod) {
                        var_816a8b5fc977cf64 = var_816a8b5fc977cf64 + level.framedurationseconds;
                        continue;
                    }
                    if (isdefined(self.permcapturethresholds)) {
                        if (!isdefined(self.decaythreshold)) {
                            self.decaythreshold = 0;
                        }
                        progress = self.curprogress / self.usetime;
                        foreach (frac in self.permcapturethresholds) {
                            if (progress >= frac && frac > self.decaythreshold) {
                                self.decaythreshold = frac;
                            }
                        }
                        if (!isdefined(self.decayrate)) {
                            self.decayrate = self.usetime * 0.025 * level.framedurationseconds;
                        }
                        if (progress > self.decaythreshold) {
                            self.curprogress = self.curprogress - self.decayrate;
                        }
                    } else {
                        if (!isdefined(self.decayrate)) {
                            self.decayrate = 0.1 * level.frameduration;
                        }
                        var_44b5930feff9e5aa = 1;
                        if (isdefined(self.var_b396ac0ad1624624)) {
                            var_44b5930feff9e5aa = [[ self.var_b396ac0ad1624624 ]]();
                        }
                        self.curprogress = self.curprogress - self.decayrate * var_44b5930feff9e5aa;
                        if (isdefined(self.var_1b36c96ff904e7e6)) {
                            self [[ self.var_1b36c96ff904e7e6 ]](0);
                        }
                    }
                }
                self.teamprogress[team] = self.curprogress;
            }
            if (self.teamprogress[team] <= 0) {
                self.curprogress = 0;
                self.teamprogress[team] = self.curprogress;
                self.lastprogressteam = undefined;
                namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 0);
                if (isdefined(self.var_ff5925101700484b)) {
                    [[ self.var_ff5925101700484b ]]("none");
                }
                break;
            }
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            if (isdefined(self.objidnum)) {
                if (isdefined(self.overrideprogressteam)) {
                    progress = self.teamprogress[self.overrideprogressteam] / self.usetime;
                    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
                } else if (isdefined(self.lastprogressteam)) {
                    progress = self.teamprogress[self.lastprogressteam] / self.usetime;
                    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
                } else {
                    progress = self.teamprogress[self.lastclaimteam] / self.usetime;
                    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
                }
            }
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ea8
// Size: 0x164
function canclaim(player) {
    if (isdefined(self.carrier)) {
        return 0;
    }
    if (self.cancontestclaim) {
        playerteam = player namespace_3c5a4254f2b957ea::getpersstat("team");
        numtouching = getnumtouchingforteam(playerteam);
        if (is_equal(level.gametype, "xfire")) {
            numother = function_47ab1f277f139986(playerteam);
        } else {
            numother = getnumtouchingexceptteam(playerteam);
        }
        if (numtouching && !numother || numtouching && numother && numtouching != numother) {
            if (numother && istrue(level.disableMajorityCapProgress)) {
                self.stalemate = 1;
                self.majoritycapprogress = 0;
                self.wasmajoritycapprogress = 1;
                return 0;
            }
            self.majoritycapprogress = 1;
            self.wasmajoritycapprogress = 0;
            return 1;
        }
        if (numtouching && numother && numtouching == numother) {
            self.stalemate = 1;
            self.majoritycapprogress = 0;
            self.wasmajoritycapprogress = 1;
            return 0;
        }
    }
    if (!isdefined(self.keyobject)) {
        return 1;
    }
    if (isdefined(self.nocarryobject)) {
        if (checkobjectiskeyobject(player)) {
            return 1;
        }
    }
    if (isdefined(player.carryobject)) {
        if (checkplayercarrykeyobject(player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8014
// Size: 0xec
function proxtriggerthink() {
    level endon("game_ended");
    self endon("deleted");
    entitynumber = self.entnum;
    while (1) {
        ent = self.trigger waittill("trigger");
        if (ent namespace_1f188a13f7e79610::isvehicle() && !isdefined(ent.streakinfo) && namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(ent)) {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
            foreach (occupant in occupants) {
                if (function_42430bcb47389f23(occupant, 1)) {
                    processTouchEnt(occupant, entitynumber);
                }
            }
        }
        if (function_42430bcb47389f23(ent)) {
            processTouchEnt(ent, entitynumber);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8107
// Size: 0x174
function function_42430bcb47389f23(player, var_372a5049b4c8b20a) {
    if (!isreallyalive(player)) {
        return 0;
    }
    if (istrue(self.trigger.trigger_off)) {
        return 0;
    }
    if (isagent(player) && (!isdefined(player.team) || !isdefined(self.numtouching[player.team]))) {
        return 0;
    }
    if (!namespace_36f464722d326bbe::isgameparticipant(player)) {
        return 0;
    }
    if (isdefined(self.carrier)) {
        return 0;
    }
    if (isdefined(player.classname) && player.classname == "script_vehicle") {
        return 0;
    }
    if (!isdefined(player.initialized_gameobject_vars)) {
        return 0;
    }
    if (isdefined(self.usecondition)) {
        if (!self [[ self.usecondition ]](player)) {
            return 0;
        }
    }
    relativeteam = getrelativeteam(player namespace_3c5a4254f2b957ea::getpersstat("team"));
    if (isdefined(self.teamusetimes[relativeteam]) && self.teamusetimes[relativeteam] < 0) {
        return 0;
    }
    if (istrue(var_372a5049b4c8b20a) && getdvarint(@"hash_7d0a246e9851ce94", 1) == 1 && !ispointinvolume(player.origin, self.trigger) && !ispointinvolume(player geteye(), self.trigger)) {
        return 0;
    }
    return 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8283
// Size: 0x557
function processTouchEnt(player, entitynumber) {
    if (isreallyalive(player) && !isdefined(player.touchtriggers[entitynumber]) && player namespace_9ba985cbac6de93c::function_10de2964abd64e1f()) {
        if (isdefined(self.var_e2f9cb96d8a5c8d1)) {
            self [[ self.var_e2f9cb96d8a5c8d1 ]](player);
        }
        team = player namespace_3c5a4254f2b957ea::getpersstat("team");
        if (istrue(level.var_d914655fe46b8e34)) {
            if (!isdefined(self.var_2b085e33da6ed3f3) || !isdefined(self.var_2b085e33da6ed3f3[team])) {
                self.var_2b085e33da6ed3f3[team] = 0;
            }
            self.var_2b085e33da6ed3f3[team]++;
        }
        self.numtouching[team]++;
        touchname = player.guid;
        struct = spawnstruct();
        struct.player = player;
        struct.starttime = gettime();
        struct.var_d96989d14549fd76 = !isplayer(struct.player) && function_21f4c6f630b17fc4(struct.player);
        struct.owner = struct.var_d96989d14549fd76 && isdefined(player.owner) ? player.owner : undefined;
        self.touchlist[team][touchname] = struct;
        if (isdefined(self.assisttouchlist)) {
            if (!isdefined(self.assisttouchlist[team][touchname])) {
                self.assisttouchlist[team][touchname] = struct;
            }
        }
    }
    if (self.cancontestclaim) {
        playerteam = player namespace_3c5a4254f2b957ea::getpersstat("team");
        numtouching = getnumtouchingforteam(playerteam);
        numother = getnumtouchingexceptteam(playerteam);
        if (numtouching && !numother || numtouching && numother && numtouching != numother) {
            if (!(getgametype() == "wm" && istrue(level.disableMajorityCapProgress))) {
                self.majoritycapprogress = 1;
                self.isunoccupied = 0;
            }
        }
    }
    if (self.claimteam == "none" || !istrue(self.allowcapture) || istrue(self.majoritycapprogress)) {
        playerteam = player namespace_3c5a4254f2b957ea::getpersstat("team");
        if (caninteractwith(playerteam, player)) {
            if (canclaim(player)) {
                if (function_ae3f61dab7aa5fec(player)) {
                    player setclientomnvar("ui_owned_player_capturing_index", self.objidnum + 1);
                }
                if (!proxtriggerlos(player)) {
                    return;
                }
                if (istrue(self.majoritycapprogress)) {
                    if (isdefined(self.mostnumtouching) && isdefined(self.mostnumtouchingteam)) {
                        if (!istrue(self.var_88806e65c3197677) || self.mostnumtouchingteam != self.ownerteam) {
                            setclaimteam(self.mostnumtouchingteam);
                            claimplayer = getearliestclaimplayer();
                            self.claimplayer = claimplayer;
                        }
                    }
                } else {
                    setclaimteam(playerteam);
                    self.claimplayer = player;
                }
                relativeteam = getrelativeteam(playerteam);
                if (isdefined(self.teamusetimes[relativeteam])) {
                    self.usetime = self.teamusetimes[relativeteam];
                }
                self.allowcapture = 1;
                if (isdefined(self.numtouchrequired) && self.numtouchrequired > self.numtouching[self.claimteam]) {
                    self.allowcapture = 0;
                }
                if (self.usetime && isdefined(self.onbeginuse) && self.allowcapture && self.ownerteam != self.claimteam) {
                    self.isunoccupied = 0;
                    var_e7f80702e259e98a = 1;
                    if (var_e7f80702e259e98a) {
                        if (!istrue(self.var_2dda7caa18ddd5f8) && isdefined(self.claimplayer)) {
                            self [[ self.onbeginuse ]](self.claimplayer);
                            self.var_2dda7caa18ddd5f8 = 1;
                        }
                    } else if (isdefined(self.claimplayer)) {
                        if (isdefined(self.didstatusnotify) && !self.didstatusnotify) {
                            self [[ self.onbeginuse ]](self.claimplayer);
                        } else if (!isdefined(self.didstatusnotify)) {
                            self [[ self.onbeginuse ]](self.claimplayer);
                        }
                    }
                }
            } else if (isdefined(self.oncantuse)) {
                self [[ self.oncantuse ]](player);
            }
        }
        if (canclaim(player)) {
            if (function_ae3f61dab7aa5fec(player)) {
                player setclientomnvar("ui_owned_player_capturing_index", self.objidnum + 1);
            }
        }
    }
    if (isreallyalive(player) && !isdefined(player.touchtriggers[entitynumber]) && player namespace_9ba985cbac6de93c::function_10de2964abd64e1f()) {
        player thread triggertouchthink(self);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e1
// Size: 0x68
function function_ae3f61dab7aa5fec(player) {
    if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player)) {
        return 0;
    }
    gametype = getdvar(@"hash_e65e9a96eb2ff62b", "");
    if (gametype == "conf") {
        return 0;
    }
    if (gametype == "conf_tw") {
        return 0;
    }
    if (gametype == "grind") {
        return 0;
    }
    if (gametype == "grind") {
        return 0;
    }
    return 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8851
// Size: 0x216
function proxtriggerlos(player) {
    if (!isdefined(self.requireslos)) {
        return 1;
    }
    tracestart = player geteye();
    contentoverride = create_contents(0, 1, 1, 1, 0, 1, 0);
    ignoreents = [];
    if (getgametype() == "tdef" || istrue(level.devball)) {
        traceend = self.trigger.origin + (0, 0, 16);
        var_6c31025c58cd1ad8 = 0;
        ignoreents[0] = self.visuals[0];
    } else if (getgametype() == "ball" || istrue(level.debughostagegame)) {
        traceend = self.trigger.origin + (0, 0, 8);
        var_6c31025c58cd1ad8 = 0;
        ignoreents[0] = self.visuals[0];
    } else {
        traceend = self.trigger.origin + (0, 0, 32);
        var_6c31025c58cd1ad8 = 1;
        if (isarray(self.visuals)) {
            ignoreents[0] = self.visuals[0];
        } else {
            ignoreents[0] = self.visuals;
        }
    }
    ignoreents[1] = self.carrier;
    trace = ray_trace(tracestart, traceend, ignoreents, contentoverride, 0);
    if (trace["fraction"] != 1 && var_6c31025c58cd1ad8) {
        traceend = self.trigger.origin + (0, 0, 16);
        trace = ray_trace(tracestart, traceend, ignoreents, contentoverride, 0);
    }
    if (trace["fraction"] != 1) {
        traceend = self.trigger.origin + (0, 0, 0);
        trace = ray_trace(tracestart, traceend, ignoreents, contentoverride, 0);
    }
    return trace["fraction"] == 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a6f
// Size: 0xaf
function setclaimteam(newteam) {
    if (getcapturebehavior() == "normal") {
        if (!istrue(self.ignorestomp) && isgameplayteam(newteam)) {
            if (self.lastclaimteam != "none") {
                if (!isdefined(self.lastprogressteam)) {
                    self.lastprogressteam = self.lastclaimteam;
                }
            }
        }
    }
    self.lastclaimteam = self.claimteam;
    self.lastclaimtime = gettime();
    self.claimteam = newteam;
    namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(self.objidnum, self.claimteam);
    updateuserate();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b25
// Size: 0xc
function getclaimteam() {
    return self.claimteam;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b39
// Size: 0xc
function getlastclaimteam() {
    return self.lastclaimteam;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b4d
// Size: 0x5d5
function triggertouchthink(object) {
    team = namespace_3c5a4254f2b957ea::getpersstat("team");
    guid = self.guid;
    if (object function_9a19ccf8dc6c3caf()) {
        namespace_5a22b6f3a56f7e9b::objective_pin_player(object.objidnum, self);
        self.pinnedobjid = object.objidnum;
        if (isdefined(object.onpinnedstate)) {
            object [[ object.onpinnedstate ]](self);
        }
    } else if (object function_dc06030ceb03363b()) {
        namespace_5a22b6f3a56f7e9b::objective_pin_player(object.trigger.objidnum, self);
        self.pinnedobjid = object.trigger.objidnum;
        if (isdefined(object.onpinnedstate)) {
            object [[ object.onpinnedstate ]](self);
        }
    }
    if (!isdefined(self.touchinggameobjects)) {
        self.touchinggameobjects = [];
    }
    var_9d22374a99144826 = object.trigger getentitynumber();
    self.touchinggameobjects[var_9d22374a99144826] = object;
    if (!isdefined(object.nousebar)) {
        object.nousebar = 0;
    }
    self.touchtriggers[object.entnum] = object.trigger;
    object updateuserate();
    while (function_f9e021b5763236b(object, team)) {
        if (object function_9a19ccf8dc6c3caf() && !isusingremote() && istrue(self.remoteunpinned)) {
            namespace_5a22b6f3a56f7e9b::objective_pin_player(object.objidnum, self);
            self.remoteunpinned = undefined;
        } else if (object function_dc06030ceb03363b() && !isusingremote() && istrue(self.remoteunpinned)) {
            namespace_5a22b6f3a56f7e9b::objective_pin_player(object.objidnum, self);
            self.remoteunpinned = undefined;
        }
        if ((isplayer(self) || isagent(self) && istrue(self.var_599b158d152c358d) || function_781844c0c05b5ac7()) && object.usetime > 50) {
            updateuiprogress(object, 1);
        }
        waitframe();
    }
    if (isdefined(self)) {
        if (object.usetime > 50) {
            if (isplayer(self) || isagent(self) && istrue(self.var_599b158d152c358d)) {
                updateuiprogress(object, 0);
            }
            if (isdefined(self.touchtriggers)) {
                self.touchtriggers[object.entnum] = undefined;
            }
        } else if (isdefined(self.touchtriggers)) {
            self.touchtriggers[object.entnum] = undefined;
        }
        if (isdefined(self.touchtriggers)) {
            self.touchinggameobjects[var_9d22374a99144826] = undefined;
        }
    }
    if (level.gameended) {
        return;
    }
    object.oldtouchlist = object.touchlist;
    if (isdefined(self)) {
        object.touchlist[team][guid] = undefined;
    } else {
        var_b05a747ea1537870 = [];
        foreach (guid, var_76ff2376b27f4085 in object.touchlist[team]) {
            if (!isdefined(var_76ff2376b27f4085.player) || !isalive(var_76ff2376b27f4085.player)) {
                var_b05a747ea1537870[var_b05a747ea1537870.size] = guid;
            }
        }
        foreach (guid in var_b05a747ea1537870) {
            object.touchlist[team][guid] = undefined;
        }
    }
    if (isdefined(self) && isdefined(object.trigger) && isdefined(object.trigger.objidnum)) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(object.trigger.objidnum, self);
        self.pinnedobjid = undefined;
        if (object.lastclaimteam == "none") {
            if (isdefined(object.capturebehavior) && object.capturebehavior == "persistent") {
                namespace_5a22b6f3a56f7e9b::objective_show_progress(object.trigger.objidnum, 0);
            }
        }
    }
    if (isdefined(self) && isdefined(object.objidnum)) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(object.objidnum, self, object.showoncompass);
        self.pinnedobjid = undefined;
        if (object.lastclaimteam == "none") {
            if (isdefined(object.capturebehavior) && object.capturebehavior == "persistent") {
                namespace_5a22b6f3a56f7e9b::objective_show_progress(object.objidnum, 0);
            }
        }
    }
    object.numtouching[team]--;
    if (istrue(level.var_d914655fe46b8e34)) {
        object.var_2b085e33da6ed3f3[team]--;
        if (object.var_2b085e33da6ed3f3[team] < 1) {
            object.var_2b085e33da6ed3f3 = array_remove_key(object.var_2b085e33da6ed3f3, team);
        }
    }
    object updateuserate();
    if (isdefined(self) && function_ae3f61dab7aa5fec(self)) {
        self setclientomnvar("ui_owned_player_capturing_index", -1);
    }
    if (isdefined(object.onunpinnedstate)) {
        object [[ object.onunpinnedstate ]](self);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9129
// Size: 0x1cd
function function_f9e021b5763236b(object, team) {
    if (!isreallyalive(self)) {
        return 0;
    }
    if (!isdefined(object.trigger)) {
        return 0;
    }
    if (function_781844c0c05b5ac7()) {
        if (!issharedfuncdefined("super_capture_bot", "captureBot_shouldCaptureObjective")) {
            return 0;
        }
        if (!function_f3bb4f4911a1beb2("super_capture_bot", "captureBot_shouldCaptureObjective", object)) {
            return 0;
        }
    } else if (!(self istouching(object.trigger) || isdefined(self.vehicle) && self.vehicle istouching(object.trigger))) {
        return 0;
    }
    if (level.gameended) {
        return 0;
    }
    if (isdefined(object.checkinteractteam) && object.team != team) {
        return 0;
    }
    if (istrue(self.inlaststand)) {
        return 0;
    }
    if (isdefined(object.interactsquads) && !isdefined(object.interactsquads[self.team]) || isdefined(object.interactsquads) && !array_contains(object.interactsquads[self.team], self.var_ff97225579de16a)) {
        return 0;
    }
    if (istrue(object.trigger.trigger_off)) {
        return 0;
    }
    if (istrue(object.checkuseconditioninthink) && isdefined(object.usecondition) && !object [[ object.usecondition ]](self)) {
        return 0;
    }
    if (namespace_cd0b2d039510b38d::getgametype() == "bigctf") {
        if (!istrue(object caninteractwith(self.team, team))) {
            return 0;
        }
    }
    if (!namespace_9ba985cbac6de93c::function_10de2964abd64e1f()) {
        return 0;
    }
    return 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92fe
// Size: 0x53
function migrationcapturereset(player) {
    player.migrationcapturereset = 1;
    level waittill("host_migration_begin");
    if (!isdefined(player) || !isdefined(self)) {
        return;
    }
    player setclientomnvar("ui_securing", 0);
    player setclientomnvar("ui_securing_progress", 0);
    self.migrationcapturereset = undefined;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9358
// Size: 0x12c
function getnumtouchingforteam(team) {
    numtouching = self.numtouching[team];
    var_ce6ec2d4fa13ca16 = 0;
    var_af55f1216012ede0 = numtouching;
    foreach (struct in self.touchlist[team]) {
        if (!isdefined(struct.player)) {
            continue;
        }
        if (!isalive(struct.player)) {
            continue;
        }
        if (struct.player namespace_3c5a4254f2b957ea::getpersstat("team") != team) {
            continue;
        }
        if (isagent(struct.player) && !istrue(struct.player.var_599b158d152c358d)) {
            var_ce6ec2d4fa13ca16 = var_ce6ec2d4fa13ca16 + 1;
        }
    }
    var_af55f1216012ede0 = var_af55f1216012ede0 - var_ce6ec2d4fa13ca16;
    if (var_af55f1216012ede0 == 0) {
        self.var_15770ae4f644e96d = 1;
    } else {
        numtouching = var_af55f1216012ede0;
        self.var_15770ae4f644e96d = 0;
    }
    return numtouching;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x948c
// Size: 0x180
function getnumtouchingexceptteam(ignoreteam) {
    numtouching = 0;
    var_e7ad7f306d72799c = 0;
    self.mostnumtouching = 0;
    self.mostnumtouchingteam = "none";
    if (istrue(level.var_d914655fe46b8e34)) {
        foreach (teamname, var_54a3fcca5d3f54ff in self.var_2b085e33da6ed3f3) {
            var_e7ad7f306d72799c = var_e7ad7f306d72799c + var_54a3fcca5d3f54ff;
            if (var_e7ad7f306d72799c > 0 && var_e7ad7f306d72799c > self.mostnumtouching) {
                self.mostnumtouching = var_e7ad7f306d72799c;
                self.mostnumtouchingteam = teamname;
                var_e7ad7f306d72799c = 0;
            }
            if (teamname != ignoreteam) {
                numtouching = numtouching + var_54a3fcca5d3f54ff;
            }
        }
    } else {
        foreach (entry in level.teamnamelist) {
            var_e7ad7f306d72799c = var_e7ad7f306d72799c + self.numtouching[entry];
            if (var_e7ad7f306d72799c > 0 && var_e7ad7f306d72799c > self.mostnumtouching) {
                self.mostnumtouching = var_e7ad7f306d72799c;
                self.mostnumtouchingteam = entry;
                var_e7ad7f306d72799c = 0;
            }
            if (entry != ignoreteam) {
                numtouching = numtouching + self.numtouching[entry];
            }
        }
    }
    return numtouching;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9614
// Size: 0x8c
function function_47ab1f277f139986(ignoreteam) {
    var_ec7483279f60efdb = 0;
    foreach (entry in level.teamnamelist) {
        if (entry == ignoreteam) {
            continue;
        }
        if (self.numtouching[entry] > var_ec7483279f60efdb) {
            var_ec7483279f60efdb = self.numtouching[entry];
        }
    }
    return var_ec7483279f60efdb;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96a8
// Size: 0x17bb
function updateuiprogress(object, securing, var_3aba92eb548e3f1) {
    if (!isdefined(level.hostmigrationtimer)) {
        var_e44d265baccd0e6c = ter_op(isdefined(object.var_14d7b0ecc80353b), object.var_14d7b0ecc80353b, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS");
        var_fe62d726a93f1f9b = ter_op(isdefined(object.var_956f480af849a6ca), object.var_956f480af849a6ca, "MP/GRABBING_FLAG");
        var_ce9728bac543fa33 = ter_op(isdefined(object.var_f526ef46fecf38b2), object.var_f526ef46fecf38b2, "MP/RETURNING_FLAG");
        var_1cbde9e31bd172cb = ter_op(isdefined(object.var_b2dfb3f0778c829a), object.var_b2dfb3f0778c829a, "MP_INGAME_ONLY/OBJ_SECURING_CAPS");
        var_2a63708633bd227b = ter_op(isdefined(object.var_c767098338453a2a), object.var_c767098338453a2a, "MP_INGAME_ONLY/OBJ_DESTROYING_CAPS");
        var_de151c192e2ec2b1 = ter_op(isdefined(object.var_66993f4666bfa134), object.var_66993f4666bfa134, "MP_INGAME_ONLY/NEUTRALIZING");
        var_f40e023c11cb4137 = ter_op(isdefined(object.var_baa644f30eca9796), object.var_baa644f30eca9796, "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS");
        var_7c84ca05b5d89121 = ter_op(isdefined(object.var_a761f33f4834f584), object.var_a761f33f4834f584, "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS");
        var_aa979ec1219ea3fb = ter_op(isdefined(object.var_b7827c280b90eaa), object.var_b7827c280b90eaa, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS");
        var_1d748649dc019efc = ter_op(isdefined(object.var_73d0a540867d306b), object.var_73d0a540867d306b, "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS");
        var_1cb654297b9afbf3 = ter_op(isdefined(object.var_fbe10b7e6c62a772), object.var_fbe10b7e6c62a772, "MP_INGAME_ONLY/OBJ_LOSING_CAPS");
        var_d5f6773674c728c3 = ter_op(isdefined(object.var_322784c331f286e2), object.var_322784c331f286e2, "MP_INGAME_ONLY/CAPTURE_LOCKED");
        var_97d0bfcd24e5718c = ter_op(isdefined(object.var_4d623d4bed3d5adb), object.var_4d623d4bed3d5adb, "MP_INGAME_ONLY/OBJ_CAPTURE_LOCK_CAPS");
        if (isdefined(object.interactteam) && object.interactteam == "none") {
            if (istrue(object.var_42a5720def8b7b0b)) {
                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(1, var_d5f6773674c728c3, 0);
            } else {
                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(0, undefined, 0);
            }
            return;
        }
        if (!isdefined(var_3aba92eb548e3f1)) {
            var_3aba92eb548e3f1 = object;
        }
        objid = function_53c4c53197386572(object.objidnum, -1);
        progress = 0;
        if (isdefined(object.var_2361cb77c7226f85)) {
            if (!isdefined(object.var_2361cb77c7226f85[self.clientid])) {
                object.var_2361cb77c7226f85[self.clientid] = 0;
            }
            if (object.var_2361cb77c7226f85[self.clientid] > var_3aba92eb548e3f1.usetime) {
                object.var_2361cb77c7226f85[self.clientid] = var_3aba92eb548e3f1.usetime;
            }
            progress = object.var_2361cb77c7226f85[self.clientid] / var_3aba92eb548e3f1.usetime;
        } else if (isdefined(object.teamprogress) && isdefined(object.claimteam)) {
            if (object.teamprogress[object.claimteam] > var_3aba92eb548e3f1.usetime) {
                object.teamprogress[object.claimteam] = var_3aba92eb548e3f1.usetime;
            }
            progress = object.teamprogress[object.claimteam] / var_3aba92eb548e3f1.usetime;
            if (getgametype() == "bigctf") {
                if (object.claimteam == "axis" && object.claimteam != object.originalownerteam) {
                    setomnvar("ui_ctf_flag_axis_return", progress);
                } else if (object.claimteam == "allies" && object.claimteam != object.originalownerteam) {
                    setomnvar("ui_ctf_flag_allies_return", progress);
                }
            }
        } else {
            if (var_3aba92eb548e3f1.curprogress > var_3aba92eb548e3f1.usetime) {
                var_3aba92eb548e3f1.curprogress = var_3aba92eb548e3f1.usetime;
            }
            progress = var_3aba92eb548e3f1.curprogress / var_3aba92eb548e3f1.usetime;
            if (var_3aba92eb548e3f1.usetime <= 1000) {
                progress = min(progress + 0.05, 1);
            } else {
                progress = min(progress + 0.01, 1);
            }
        }
        if ((getgametype() == "ctf" || getgametype() == "bigctf" || getgametype() == "tdef" || getgametype() == "blitz") && !isdefined(object.id)) {
            if (securing && istrue(object.stalemate)) {
                if (!isdefined(self.ui_ctf_stalemate)) {
                    var_1fd0e45b79c017d8 = 2;
                    if (!isdefined(self.ui_ctf_securing)) {
                        self.ui_ctf_securing = 1;
                    }
                    if (getgametype() == "bigctf") {
                        var_1fd0e45b79c017d8 = 1;
                    }
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(var_1fd0e45b79c017d8, var_e44d265baccd0e6c, -1);
                    self.ui_ctf_stalemate = 1;
                }
                progress = 0.01;
            } else if (securing && isdefined(self.ui_ctf_securing) && isdefined(object.stalemate) && !object.stalemate && object.ownerteam != self.team) {
                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_fe62d726a93f1f9b, 1);
                self.ui_ctf_securing = 1;
                self.ui_ctf_stalemate = undefined;
            } else if (securing && isdefined(self.ui_ctf_securing) && isdefined(object.stalemate) && !object.stalemate && object.ownerteam == self.team) {
                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_ce9728bac543fa33, 2);
                self.ui_ctf_securing = 1;
                self.ui_ctf_stalemate = undefined;
            } else {
                if (!securing && isdefined(self.ui_ctf_stalemate)) {
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(0, undefined, 0);
                    self.ui_ctf_securing = undefined;
                }
                if (securing && !isdefined(self.ui_ctf_stalemate) && object.ownerteam == self.team) {
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(0, undefined, 0);
                    self.ui_ctf_securing = undefined;
                }
                if (securing && !isdefined(self.ui_ctf_securing)) {
                    if (object.ownerteam != self.team) {
                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_fe62d726a93f1f9b, 1);
                        self.ui_ctf_securing = 1;
                    } else if (object.interactteam == "any") {
                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_ce9728bac543fa33, 2);
                        self.ui_ctf_securing = 1;
                    }
                }
                self.ui_ctf_stalemate = undefined;
            }
            if (!securing) {
                progress = 0.01;
                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(0, undefined, 0);
                self.ui_ctf_securing = undefined;
            }
            if (progress != 0) {
                namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, self.team);
                namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 1);
                namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, progress);
            }
        }
        if (hasdomflags() && isdefined(object.id) && (object.id == "domFlag" || object.id == "hardpoint" || object.id == "bomb_site" || object.id == "rugby_jugg")) {
            if (securing && isdefined(object.stalemate) && object.stalemate && !istrue(object.majoritycapprogress)) {
                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_e44d265baccd0e6c, 3);
            } else if (securing && isdefined(object.stalemate) && !object.stalemate && !istrue(object.majoritycapprogress) && object.ownerteam != self.team) {
                if (getgametype() == "hq") {
                    if (object.ownerteam == "neutral") {
                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                    } else {
                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_2a63708633bd227b, 2);
                    }
                } else if (istrue(object.neutralizing) && object.ownerteam != self.team && object.ownerteam != "neutral") {
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_de151c192e2ec2b1);
                } else {
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                }
            } else {
                if (!securing) {
                    if (isdefined(object.overrideprogressteam)) {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.overrideprogressteam);
                    } else if (isdefined(object.lastprogressteam) && object.lastprogressteam != object.claimteam && (object.lastprogressteam != object.ownerteam || istrue(object.var_823c5a7bf6a0e64a))) {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.lastprogressteam);
                    } else if (object.claimteam != "none") {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.claimteam);
                    }
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(0, undefined, 0);
                } else if (securing && istrue(object.majoritycapprogress) && isdefined(object.lastprogressteam) && object.lastprogressteam == object.claimteam) {
                    if (isdefined(object.overrideprogressteam)) {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.overrideprogressteam);
                    } else if (object.ownerteam != "neutral" && object.claimteam == object.ownerteam) {
                        if (self.team == object.ownerteam) {
                        }
                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, undefined, 0);
                    } else if (object.claimteam != "none") {
                        if (istrue(level.var_38b051a92ef5f144)) {
                            goto LOC_00000d0f;
                        }
                        if (getgametype() == "hq") {
                            if (object.ownerteam == "neutral") {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                            } else {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_2a63708633bd227b, 2);
                            }
                        } else {
                            numtouching = object getnumtouchingforteam(object.claimteam);
                            numother = object getnumtouchingexceptteam(object.claimteam);
                            if (istrue(object.var_3ba42e8c18b42c71)) {
                                if (self.team == object.claimteam) {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_aa979ec1219ea3fb, 4);
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1d748649dc019efc, 4);
                                }
                            } else if (numtouching > 0 && numother > 0) {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_e44d265baccd0e6c, 3);
                            } else if (istrue(object.neutralizing) && object.ownerteam != self.team && object.ownerteam != "neutral") {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_de151c192e2ec2b1);
                            } else if (!istrue(object.var_3ba42e8c18b42c71)) {
                                if (object.ownerteam == self.team) {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_f40e023c11cb4137, 1);
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                                }
                            } else if (isdefined(object.var_97feb74e7c5669c7)) {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, object.var_97feb74e7c5669c7, 1);
                            LOC_00000d0f:
                            }
                        LOC_00000d0f:
                        }
                    LOC_00000d0f:
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.claimteam);
                    }
                } else if (getgametype() == "rugby") {
                    if (!isdefined(object.claimteam) || object.claimteam == "none") {
                        object.numtouching[self.team] = 1;
                        if (!isdefined(object.lastclaimteam)) {
                            object.lastclaimteam = "none";
                        }
                        object setclaimteam(self.pers["team"]);
                        object setownerteam(self.pers["team"]);
                    }
                    if (securing) {
                        if (object.claimteam != "none") {
                            namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.claimteam);
                            namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 1);
                            namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, progress);
                        }
                    } else {
                        object.claimteam = "none";
                    }
                }
                if (securing && object.ownerteam == self.team) {
                }
            }
            if (getgametype() != "rush") {
                if (!securing || !object caninteractwith(self.team, self) && (!isdefined(object.stalemate) || isdefined(object.stalemate) && !object.stalemate)) {
                    if (var_3aba92eb548e3f1.curprogress == 0 && !istrue(object.var_42a5720def8b7b0b)) {
                        namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 0);
                    }
                }
            }
            if (progress != 0) {
                if (showspecificteamprogress(object)) {
                    namespace_5a22b6f3a56f7e9b::objective_show_team_progress(objid, object.claimteam);
                } else {
                    namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 1);
                }
                if (level.teambased && isdefined(object.teamprogress) && isdefined(object.claimteam) && securing) {
                    if (!object.stalemate) {
                        if (isdefined(object.overrideprogressteam)) {
                            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.overrideprogressteam);
                            namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, object.teamprogress[object.overrideprogressteam] / var_3aba92eb548e3f1.usetime);
                        } else {
                            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.claimteam);
                            namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, progress);
                        }
                        if (self.team == object.claimteam) {
                            if (istrue(level.var_38b051a92ef5f144)) {
                                goto LOC_000010f0;
                            }
                            if (getgametype() == "hq") {
                                if (object.ownerteam == "neutral") {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_2a63708633bd227b, 2);
                                }
                            } else if (istrue(object.neutralizing) && object.ownerteam != self.team && object.ownerteam != "neutral") {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_de151c192e2ec2b1);
                            } else if (!istrue(object.var_3ba42e8c18b42c71)) {
                                if (object.ownerteam == self.team) {
                                    if (istrue(object.var_823c5a7bf6a0e64a)) {
                                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_7c84ca05b5d89121, 1);
                                    } else {
                                        namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_f40e023c11cb4137, 1);
                                    }
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                                }
                            } else if (isdefined(object.var_97feb74e7c5669c7)) {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, object.var_97feb74e7c5669c7, 1);
                            LOC_000010f0:
                            }
                        LOC_000010f0:
                        } else {
                            numtouching = 0;
                            numother = 0;
                            if (object.ownerteam == "neutral" && isdefined(object.claimteam)) {
                                numtouching = object getnumtouchingforteam(object.claimteam);
                                numother = object getnumtouchingexceptteam(object.ownerteam);
                            } else {
                                numtouching = object getnumtouchingforteam(object.ownerteam);
                                numother = object getnumtouchingexceptteam(object.ownerteam);
                            }
                            if (istrue(object.var_3ba42e8c18b42c71)) {
                                if (self.team == object.claimteam) {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_aa979ec1219ea3fb, 4);
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1d748649dc019efc, 4);
                                }
                            } else if (numtouching > 0 && numother > 0) {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_e44d265baccd0e6c, 3);
                            } else {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cb654297b9afbf3, 5);
                            }
                        }
                    } else if (object.stalemate && istrue(object.majoritycapprogress)) {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, object.claimteam);
                        namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, progress);
                        if (self.team == object.claimteam) {
                            if (getgametype() == "hq") {
                                if (object.ownerteam == "neutral") {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_2a63708633bd227b, 2);
                                }
                            } else if (istrue(object.neutralizing) && object.ownerteam != self.team && object.ownerteam != "neutral") {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_de151c192e2ec2b1, 6);
                            } else {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cbde9e31bd172cb, 1);
                            }
                        } else {
                            namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cb654297b9afbf3, 5);
                        }
                    } else {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, undefined);
                    }
                } else if (!level.teambased) {
                    namespace_5a22b6f3a56f7e9b::objective_set_progress_client(objid, self);
                }
            } else if (isdefined(object.teamprogress) && isdefined(object.claimteam)) {
                if (istrue(object.var_42a5720def8b7b0b)) {
                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_97d0bfcd24e5718c, 1);
                } else {
                    foreach (var_6fa664d6c4f6967b, progress in object.teamprogress) {
                        if (isdefined(self.team) && !object.stalemate && istrue(object.majoritycapprogress)) {
                            if (self.team == var_6fa664d6c4f6967b && progress > 0) {
                                namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_1cb654297b9afbf3, 5);
                            } else if (self.team == object.ownerteam && progress == 0 && !istrue(object.var_b276b0d8cbbd0480)) {
                                if (istrue(object.var_823c5a7bf6a0e64a)) {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_7c84ca05b5d89121, 5);
                                } else {
                                    namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, var_f40e023c11cb4137, 5);
                                }
                            }
                            break;
                        }
                    }
                }
            }
        } else if (isbombmode() && isdefined(object.id) && (object.id == "bomb_zone" || object.id == "defuse_object")) {
            if (isdefined(self)) {
                if (securing && isdefined(self)) {
                    if (!isdefined(self.ui_bomb_planting_defusing)) {
                        idx = 0;
                        if (object.id == "bomb_zone") {
                            idx = 1;
                        } else if (object.id == "defuse_object") {
                            idx = 2;
                        }
                        self.ui_bomb_planting_defusing = 1;
                    }
                } else {
                    self.ui_bomb_planting_defusing = undefined;
                    if (!isdefined(object.resetprogress) || istrue(object.resetprogress)) {
                        progress = 0.01;
                    }
                }
                if (progress != 0) {
                    if (!isdefined(object.showprogressforteam)) {
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, self.team);
                        objective_show_team_progress(objid, self.team);
                        object.showprogressforteam = self.team;
                    } else if (object.showprogressforteam != self.team) {
                        namespace_5a22b6f3a56f7e9b::objective_hide_team_progress(objid, object.showprogressforteam);
                        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, self.team);
                        namespace_5a22b6f3a56f7e9b::objective_show_team_progress(objid, self.team);
                        object.showprogressforteam = self.team;
                    }
                    namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, progress);
                    setomnvar("ui_bomb_progress", progress);
                }
            }
        } else if (isdefined(object.id)) {
            idx = 0;
            switch (object.id) {
            case #"hash_3fd866e3da61a87":
            case #"hash_e477c24ee18bb2f6":
                idx = 1;
                if (istrue(self.var_9ee2c87e0747c021)) {
                    idx = 61;
                }
                break;
            case #"hash_bf5597954aaed3d7":
                idx = 2;
                break;
            case #"hash_dbf719cee2feda22":
                idx = 3;
                break;
            case #"hash_82aad0a51185a053":
                idx = 4;
                break;
            case #"hash_6686a1466f9a8d41":
                idx = 5;
                break;
            case #"hash_668692466f9a75a4":
                idx = 6;
                break;
            case #"hash_c63c3cbdbdbd5178":
                idx = 7;
                break;
            case #"hash_631f416c3d8360d4":
                idx = 8;
                break;
            case #"hash_e726fddec3f4a467":
                idx = 9;
                break;
            case #"hash_973d1db8b6644466":
                idx = 10;
                break;
            case #"hash_cc625e548a303e68":
                idx = 13;
                break;
            case #"hash_3f4b70eb42439fbe":
                idx = 15;
                break;
            case #"hash_32eeb14581d379aa":
                idx = 19;
                break;
            case #"hash_7f7fd592a3f31def":
                idx = 21;
                break;
            case #"hash_ec25beb87c3d651a":
                idx = 22;
                break;
            case #"hash_81085f42186ab362":
                idx = 23;
                break;
            case #"hash_d39f3f9905d4cc88":
                idx = 24;
                break;
            case #"hash_5a9b08740c00857a":
                idx = 27;
                break;
            case #"hash_25c39dcba398587f":
                idx = 28;
                break;
            case #"hash_d747fa3ff1b78b29":
                idx = 36;
                break;
            }
            updateuisecuring(progress, securing, idx, object, var_3aba92eb548e3f1.usetime, var_3aba92eb548e3f1);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae6a
// Size: 0x40
function showspecificteamprogress(object) {
    switch (getgametype()) {
    case #"hash_7b0c576c4a7e4890":
        if (object.claimteam == game["attackers"]) {
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaeb2
// Size: 0x1f3
function hasdomflags() {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (getsubgametype() == "zonecontrol") {
            return 0;
        }
        return 1;
    }
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d == #"hash_6a87626330d9d40e") {
        return 1;
    }
    switch (getgametype()) {
    case #"hash_4cb5825e78aaa8c":
    case #"hash_ca6516c10db2c95":
    case #"hash_1aac086c17fe5ccb":
    case #"hash_1b1eecd3863a50cf":
    case #"hash_214e6c6c1b43ae4a":
    case #"hash_25397d96e5bc8403":
    case #"hash_3ae8dcf2840c03a0":
    case #"hash_53825b446469ac4c":
    case #"hash_5e78ea9021845d4a":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_634e449bb53a8268":
    case #"hash_6efb0f59a62300fb":
    case #"hash_75b6db03edb1e84e":
    case #"hash_78ebb3b7ce8f864f":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_8eb3658fb4985833":
    case #"hash_99a69534b169e838":
    case #"hash_9ccabb62c3d37fb0":
    case #"hash_a1313b745c17c07e":
    case #"hash_a6b6d6b8dc1096cd":
    case #"hash_b8aae84522ccf348":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_c7f4420f385eeb3d":
    case #"hash_d82d642e83fb9772":
    case #"hash_dd5b900f435d3f36":
    case #"hash_e2e043391c7c9074":
    case #"hash_ec24570718a340f5":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_f25c018be2dd3f5f":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa44d9f6bd7a2fa1":
        return 1;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0ad
// Size: 0x4b5
function updateuisecuring(progress, securing, idx, object, usetime, var_3aba92eb548e3f1) {
    objid = undefined;
    if (!isdefined(var_3aba92eb548e3f1)) {
        var_3aba92eb548e3f1 = object;
    }
    if (securing) {
        if (!isdefined(object.usedby)) {
            object.usedby = [];
        }
        if (!isdefined(self.migrationcapturereset)) {
            object thread migrationcapturereset(self);
        }
        if (!existinarray(self, object.usedby)) {
            object.usedby[object.usedby.size] = self;
        }
        if (!isdefined(self.ui_securing)) {
            self setclientomnvar("ui_securing", idx);
            self.ui_securing = 1;
            if (isdefined(object) && (object isrevivetrigger() || object function_89ae7f031dd8bc23())) {
                if (isdefined(object.owner)) {
                    reviver = function_53c4c53197386572(self.reviver, self);
                    object.owner setclientomnvar("ui_reviver_id", reviver getentitynumber());
                    object.owner setclientomnvar("ui_securing", 6);
                }
            }
        }
        if (object.id == "laststand_reviver" || object.id == "plea_for_help_looting") {
            revivee = undefined;
            reviver = undefined;
            if (isdefined(object) && (object isrevivetrigger() || object function_89ae7f031dd8bc23())) {
                revivee = object.owner;
                reviver = function_53c4c53197386572(revivee.reviver, self);
            }
            if (isdefined(revivee) && isdefined(reviver) && reviver == revivee) {
                self setclientomnvar("ui_securing", 16);
            }
            if (namespace_36f464722d326bbe::isBRStyleGameType() || istrue(level.var_6d63cbd43e47315e)) {
                namespace_d20f8ef223912e12::updatesquadmemberlaststandreviveprogress(revivee, self, progress);
            }
        } else if (namespace_36f464722d326bbe::isBRStyleGameType() && object.id == "laststand_interrogator") {
            var_5bebd2013b0f01ec = undefined;
            if (isdefined(object) && object function_ab8d64fe065bf6f7()) {
                var_5bebd2013b0f01ec = object.owner;
            }
            if (isdefined(var_5bebd2013b0f01ec) && self != var_5bebd2013b0f01ec) {
                var_5bebd2013b0f01ec setclientomnvar("ui_securing", 19);
            }
        }
    } else {
        if (isdefined(object.usedby) && existinarray(self, object.usedby)) {
            object.usedby = array_remove(object.usedby, self);
        }
        self setclientomnvar("ui_securing", 0);
        self.ui_securing = undefined;
        if (isdefined(object) && (object isrevivetrigger() || object function_89ae7f031dd8bc23())) {
            if (isdefined(object.owner)) {
                object.owner setclientomnvar("ui_reviver_id", -1);
                object.owner setclientomnvar("ui_securing", 0);
            }
        }
        progress = 0.01;
        if (isdefined(object.objidnum)) {
            objid = object.objidnum;
        }
    }
    if (usetime == 500) {
        progress = min(progress + 0.15, 1);
    }
    if (progress != 0) {
        if (var_3aba92eb548e3f1.curprogress > 0) {
            progress = min(var_3aba92eb548e3f1.curprogress / var_3aba92eb548e3f1.usetime, 1);
        }
        if (isdefined(object) && (object isrevivetrigger() || object function_89ae7f031dd8bc23() || object function_ab8d64fe065bf6f7())) {
            if (isdefined(object.owner)) {
                object.owner setclientomnvar("ui_securing_progress", progress);
                if (istrue(self.var_93018d510a589832) || object function_89ae7f031dd8bc23()) {
                    self setclientomnvar("ui_securing_progress", progress);
                }
                if (isdefined(object.owner.reviver) && istrue(object.owner.reviver == self)) {
                    if (is_equal(namespace_1d863a7bbc05fc52::function_538e8d0f5b4d6383(), object.owner) || !isdefined(self.var_3c3de22bd4680edb)) {
                        self setclientomnvar("ui_securing_progress", progress);
                    }
                }
            }
        } else {
            self setclientomnvar("ui_securing_progress", progress);
        }
        if (isdefined(object.objidnum)) {
            namespace_5a22b6f3a56f7e9b::objective_set_progress(object.objidnum, progress);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb569
// Size: 0x6a
function existinarray(ent, array) {
    if (array.size > 0) {
        foreach (entity in array) {
            if (entity == ent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5db
// Size: 0x7ee
function updateuserate() {
    if (self.claimteam == "none" && self.ownerteam != "neutral" && self.ownerteam != "any") {
        team = self.ownerteam;
    } else {
        team = self.claimteam;
    }
    numclaimants = self.numtouching[team];
    var_773eb33d831d5bb8 = 0;
    var_6c3b950f29ab2ef3 = 0;
    numother = 0;
    var_f3158d80c9ee245c = 0;
    var_3c3d61129f8f8827 = 0;
    var_cc0da48e9a204a66 = 0;
    self.var_eb8e721d46f12e18 = 0;
    self.var_57040f129b0e27fb = 0;
    self.var_51f08547fa39ce14 = [];
    self.var_51f08547fa39ce14[1] = 0;
    self.var_51f08547fa39ce14[2] = 0;
    self.var_51f08547fa39ce14[3] = 0;
    teamlist = level.teamnamelist;
    if (istrue(level.var_d914655fe46b8e34)) {
        teamlist = getarraykeys(self.var_2b085e33da6ed3f3);
    }
    foreach (teamname in teamlist) {
        if (team != teamname) {
            foreach (struct in self.touchlist[teamname]) {
                if (!isdefined(struct.player)) {
                    continue;
                }
                if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(struct.player)) {
                    if (isdefined(struct.player.owner)) {
                        function_f1e265068d2e3fc5(struct.player.owner, self.claimteam);
                    }
                }
                if (!isalive(struct.player)) {
                    continue;
                }
                if (struct.player namespace_3c5a4254f2b957ea::getpersstat("team") != teamname) {
                    continue;
                }
                if (isagent(struct.player) && !istrue(struct.player.var_599b158d152c358d)) {
                    var_3c3d61129f8f8827 = var_3c3d61129f8f8827 + 1;
                }
            }
            numother = numother + self.numtouching[teamname];
        } else {
            foreach (struct in self.touchlist[team]) {
                if (!isdefined(struct.player)) {
                    continue;
                }
                if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(struct.player)) {
                    if (isdefined(struct.player.owner)) {
                        function_f1e265068d2e3fc5(struct.player.owner, self.claimteam);
                    }
                }
                if (!isalive(struct.player)) {
                    continue;
                }
                if (struct.player namespace_3c5a4254f2b957ea::getpersstat("team") != team) {
                    continue;
                }
                if (isagent(struct.player) && !istrue(struct.player.var_599b158d152c358d)) {
                    var_6c3b950f29ab2ef3 = var_6c3b950f29ab2ef3 + 1;
                }
                if (struct.player.objectivescaler == 1) {
                    continue;
                }
                numclaimants = numclaimants * struct.player.objectivescaler;
                var_cc0da48e9a204a66 = struct.player.objectivescaler;
            }
        }
    }
    foreach (teamname in teamlist) {
        foreach (struct in self.touchlist[teamname]) {
            if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(struct.player)) {
                if (issharedfuncdefined("super_capture_bot", "captureBot_getTeamIndex")) {
                    teamindex = self thread [[ getsharedfunc("super_capture_bot", "captureBot_getTeamIndex") ]](teamname);
                    if (teamindex > 0) {
                        self.var_51f08547fa39ce14[teamindex]++;
                    }
                }
                if (team == teamname) {
                    var_773eb33d831d5bb8++;
                } else {
                    var_f3158d80c9ee245c++;
                }
            }
        }
    }
    var_4d9bd2cd1ce666ee = numother - var_3c3d61129f8f8827;
    if (var_4d9bd2cd1ce666ee != numother) {
        if (var_4d9bd2cd1ce666ee == 0) {
            var_4d9bd2cd1ce666ee = numother;
        } else if (numother > numclaimants) {
            var_4d9bd2cd1ce666ee = max(var_4d9bd2cd1ce666ee, numclaimants);
        }
    }
    var_ea2744afc870c5ce = numclaimants - var_6c3b950f29ab2ef3;
    if (var_ea2744afc870c5ce != numclaimants) {
        if (var_ea2744afc870c5ce == 0) {
            var_ea2744afc870c5ce = numclaimants;
        } else if (numclaimants > numother) {
            var_ea2744afc870c5ce = max(var_ea2744afc870c5ce, numother);
        }
    }
    self.stalemate = ter_op(istrue(self.alwaysstalemate), var_ea2744afc870c5ce && var_4d9bd2cd1ce666ee, var_ea2744afc870c5ce && var_4d9bd2cd1ce666ee && var_ea2744afc870c5ce == var_4d9bd2cd1ce666ee);
    if (getcapturebehavior() == "all_teams_dom_together") {
        self.stalemate = 0;
    }
    if (!numclaimants && !numother) {
        self.majoritycapprogress = 0;
    }
    if (!self.stalemate && istrue(self.wasstalemate) && numclaimants > numother) {
        self.majoritycapprogress = 1;
    }
    if (isdefined(self.triggertype) && self.triggertype == "use") {
        goto LOC_00000639;
    }
    self.userate = 0;
LOC_00000639:
    var_39acbf9baa6e7ec6 = 0;
    var_2ffcb75e45e03a66 = 0;
    numclaimants = numclaimants - var_6c3b950f29ab2ef3;
    var_39acbf9baa6e7ec6 = max(numclaimants - var_773eb33d831d5bb8, 0);
    var_2ffcb75e45e03a66 = max(numother - var_f3158d80c9ee245c, 0);
    if (issharedfuncdefined("super_capture_bot", "captureBot_setClaimants")) {
        self thread [[ getsharedfunc("super_capture_bot", "captureBot_setClaimants") ]](team, self.var_51f08547fa39ce14, self.objidnum + 1);
    }
    if (numclaimants) {
        if (numclaimants > numother) {
            if (var_773eb33d831d5bb8 > 0 || var_f3158d80c9ee245c > 0) {
                if (team == "axis") {
                    self.var_eb8e721d46f12e18 = var_773eb33d831d5bb8;
                    self.var_57040f129b0e27fb = var_f3158d80c9ee245c;
                } else if (team == "allies") {
                    self.var_eb8e721d46f12e18 = var_f3158d80c9ee245c;
                    self.var_57040f129b0e27fb = var_773eb33d831d5bb8;
                }
                self.userate = min(function_3f702f8fed26558a(var_39acbf9baa6e7ec6, var_2ffcb75e45e03a66, var_773eb33d831d5bb8, var_f3158d80c9ee245c), ter_op(isdefined(level.objectivescaler), level.objectivescaler, 4));
            } else {
                self.userate = min(numclaimants - numother, ter_op(isdefined(level.objectivescaler), level.objectivescaler, 4));
            }
            if (self.userate > 1) {
                self.userate = self.userate * self.useratemultiplier;
            }
        }
    }
    if (isdefined(self.isarena) && self.isarena && var_cc0da48e9a204a66 != 0) {
        self.userate = 1 * var_cc0da48e9a204a66;
    } else if (isdefined(self.isarena) && self.isarena) {
        self.userate = 1;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdd0
// Size: 0x77e
function useholdthink(player) {
    self endon("deleted");
    player notify("use_hold");
    if (istrue(self.exclusiveuse) && isdefined(self.trigger) && (self.trigger.classname == "trigger_use" || self.trigger.classname == "trigger_use_touch")) {
        player clientclaimtrigger(self.trigger);
    }
    if (!istrue(self.var_2efb40714a6e9468)) {
        player allowmovement(0);
    }
    var_d9842c97badaba31 = isdefined(self.id) && (self.id == "traversalassist" || self.id == "breach" || self.id == "care_package" || self.id == "wm_buildable" || self.id == "wm_IED");
    if (isbombmode()) {
        if (!var_d9842c97badaba31 && level.gametype != "cyber") {
            if (isanymlgmatch() || istrue(level.silentplant)) {
                player setentitysoundcontext("silent_plant", "on");
                if (istrue(player.isdefusing)) {
                    self.useweapon = makeweapon("briefcase_defuse_silent_mp");
                } else {
                    self.useweapon = makeweapon("briefcase_silent_mp");
                }
            }
        }
    }
    useweapon = self.useweapon;
    lastweapon = player getcurrentweapon();
    isrevivetrigger = isrevivetrigger();
    if (isdefined(useweapon)) {
        /#
            assert(isdefined(lastweapon));
        #/
        switchimmediate = 0;
        if (lastweapon.basename == "iw9_cyberemp_mp") {
            switchimmediate = 1;
        }
        if (lastweapon == useweapon) {
            /#
                assert(isdefined(player.lastnonuseweapon));
            #/
            lastweapon = player.lastnonuseweapon;
        }
        /#
            assert(lastweapon != useweapon);
        #/
        player.lastnonuseweapon = lastweapon;
        setAmmo = 0;
        var_2e5c1e9548e8884f = 0;
        if (getgametype() == "cyber" || isrevivetrigger) {
            setAmmo = 1;
            var_2e5c1e9548e8884f = 0;
        }
        player _giveweapon(useweapon, undefined, undefined, 0);
        player setweaponammostock(useweapon, setAmmo);
        player setweaponammoclip(useweapon, setAmmo);
        player thread switchtouseweapon(useweapon, switchimmediate);
    } else if (!var_d9842c97badaba31 && !istrue(self.var_70814aa80e0d3d1)) {
        if (isdefined(self) && isrevivetrigger || isdefined(self.id) && self.id == "rugby_jugg") {
            player.weaponsdisabledwhilereviving = 1;
            if (!level.allowreviveweapons) {
                player thread forceunsetdemeanor(1);
                player val::set("useHold", "sprint", 0);
                player val::set("useHold", "fire", 0);
                player val::set("useHold", "ads", 0);
                player val::set("useHold", "offhand_weapons", 0);
            } else {
                player val::function_3633b947164be4f3("reviveShoot", 0);
            }
        }
        if (!istrue(self.var_bd91d0c9c243b0df)) {
            player val::set("useHold", "weapon", 0);
        }
        if (!istrue(self.var_cc367d287df0480b)) {
            player val::set("useHold", "ads", 0);
        }
    }
    if (!isdefined(player.usinggameobjects)) {
        player.usinggameobjects = [];
    }
    var_9d22374a99144826 = undefined;
    if (isdefined(self.index)) {
        var_9d22374a99144826 = self.index;
    } else {
        var_9d22374a99144826 = self.trigger getentitynumber();
    }
    player.usinggameobjects[var_9d22374a99144826] = self;
    if (!isdefined(self.resetprogress) || istrue(self.resetprogress)) {
        self.curprogress = 0;
        if (isdefined(self.var_2361cb77c7226f85) && isdefined(self.var_2361cb77c7226f85[player.clientid])) {
            self.var_2361cb77c7226f85[player.clientid] = 0;
        }
    }
    self.inuse = 1;
    self.userate = 0;
    result = useholdthinkloop(player, lastweapon);
    if (isdefined(player)) {
        player.usinggameobjects[var_9d22374a99144826] = undefined;
        player detachusemodels();
        player notify("done_using");
    }
    if (isdefined(useweapon) && isdefined(player)) {
        if (getgametype() == "cyber" && !isrevivetrigger && !istrue(result)) {
            player setweaponammostock(useweapon, 0);
            player setweaponammoclip(useweapon, 0);
        }
        player namespace_85d036cb78063c4a::unstowsuperweapon();
        if (player isswitchingtoweaponwithmonitoring(useweapon)) {
            player abortmonitoredweaponswitch(useweapon);
            player _switchtoweaponimmediate(lastweapon);
        } else {
            var_7221d23014f6b6c3 = istrue(self.var_5d00f287c09eac5) && !istrue(result);
            if (function_60bf8d82001fc22c() == "sd") {
                if (!istrue(result)) {
                    player setweaponammostock(useweapon, 1);
                    player setweaponammoclip(useweapon, 1);
                }
            }
            if (player namespace_a2f809133c566621::isjuggernaut()) {
                var_acf2963740b6f292 = player namespace_68f1873625691c6::jugg_getminigunweapon();
                player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(var_acf2963740b6f292);
                player _takeweapon(useweapon);
                player thread function_6503ca663eb11045();
            } else {
                player thread getridofweapon(useweapon, var_7221d23014f6b6c3);
            }
        }
    }
    if (istrue(result)) {
        player allowmovement(1);
        return 1;
    } else if (!istrue(result) && isdefined(self)) {
        if (!isdefined(self.resetprogress) || istrue(self.resetprogress)) {
            self.curprogress = 0;
            if (isdefined(self.var_2361cb77c7226f85) && isdefined(self.var_2361cb77c7226f85[player.clientid])) {
                self.var_2361cb77c7226f85[player.clientid] = 0;
            }
        } else {
            managecurprogress(player);
        }
    }
    if (isdefined(player)) {
        if (!isdefined(useweapon) && !var_d9842c97badaba31) {
            if (isdefined(self) && isrevivetrigger || isdefined(self.id) && self.id == "rugby_jugg") {
                if (istrue(player.weaponsdisabledwhilereviving)) {
                    player.weaponsdisabledwhilereviving = undefined;
                    if (!level.allowreviveweapons) {
                        player thread forceunsetdemeanor(0);
                    } else {
                        player val::function_588f2307a3040610("reviveShoot");
                    }
                }
            }
            player val::function_c9d0b43701bdba00("useHold");
        }
        if (!istrue(self.var_c750f84cf6cd01d8)) {
            player unlink();
        }
        player allowmovement(1);
    }
    if (isdefined(self)) {
        self.inuse = 0;
        if (istrue(self.exclusiveuse) && isdefined(self.trigger) && (self.trigger.classname == "trigger_use" || self.trigger.classname == "trigger_use_touch")) {
            self.trigger releaseclaimedtrigger();
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc556
// Size: 0x1a
function function_6503ca663eb11045() {
    self endon("death_or_disconnect");
    self waittill("gameobject_endUse");
    self notify("bomb_allow_offhands");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc577
// Size: 0x6d
function forceunsetdemeanor(bool) {
    self endon("death");
    self notify("forceDemeanorSafe");
    self endon("forceDemeanorSafe");
    if (bool) {
        while (self issprinting()) {
            wait(0.5);
        }
        self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe");
    } else {
        result = 0;
        while (!result) {
            result = self setdemeanorviewmodel("normal");
            waitframe();
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5eb
// Size: 0x23f
function managecurprogress(player) {
    if (!isdefined(self.prevprogress)) {
        self.prevprogress = 0;
    }
    progress = self.curprogress - self.prevprogress;
    if (progress <= 1000) {
        self.curprogress = self.prevprogress;
    }
    var_fa542857794825bc = self.usetime - self.curprogress;
    if (var_fa542857794825bc < 1000) {
        if (self.usetime <= 1000) {
            self.curprogress = self.usetime;
        } else {
            self.curprogress = self.usetime - 1000;
        }
    }
    progress = 0;
    if (self.curprogress > 0) {
        if (isdefined(self.teamprogress) && isdefined(self.claimteam)) {
            if (self.teamprogress[self.claimteam] > self.usetime) {
                self.teamprogress[self.claimteam] = self.usetime;
            }
            progress = self.teamprogress[self.claimteam] / self.usetime;
        } else {
            if (self.curprogress > self.usetime) {
                self.curprogress = self.usetime;
            }
            progress = self.curprogress / self.usetime;
            if (self.usetime <= 1000) {
                progress = min(progress + 0.05, 1);
            } else {
                progress = min(progress + 0.01, 1);
            }
        }
    }
    if (isdefined(self.objidnum)) {
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, player.team);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
        if (self.curprogress > 0) {
            namespace_5a22b6f3a56f7e9b::objective_show_team_progress(self.objidnum, player.team);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
        }
    }
    self.prevprogress = self.curprogress;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc831
// Size: 0x2f
function detachusemodels() {
    if (isdefined(self.attachedusemodel)) {
        self detach(self.attachedusemodel, "tag_inhand");
        self.attachedusemodel = undefined;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc867
// Size: 0x68
function switchtouseweapon(useweapon, switchimmediate, var_26ca36763fa5b82) {
    namespace_85d036cb78063c4a::allowsuperweaponstow();
    var_41bf9bf4918115ac = domonitoredweaponswitch(useweapon, switchimmediate, var_26ca36763fa5b82);
    if (!istrue(var_41bf9bf4918115ac)) {
        self notify("bomb_allow_offhands");
        namespace_85d036cb78063c4a::unstowsuperweapon();
        if (isswitchingtoweaponwithmonitoring(useweapon)) {
            abortmonitoredweaponswitch(useweapon);
        } else {
            _takeweapon(useweapon);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8d6
// Size: 0x2bd
function usetest(player, waitforweapon, timedout, maxwaittime) {
    if (self.curprogress >= self.usetime) {
        return 0;
    }
    if (istrue(self.var_c99a7a6af360dabe)) {
        return 1;
    }
    if (!isreallyalive(player)) {
        return 0;
    }
    if (!player val::get("usability")) {
        return 0;
    }
    if (!isdefined(self.skiptouching) && isdefined(self.trigger) && !player istouching(self.trigger)) {
        return 0;
    }
    if (!level.allowreviveweapons && (!player usebuttonpressed(1) || istrue(player.var_aa03057bfe41a2f0))) {
        return 0;
    }
    if (player namespace_68e641469fde3fa7::grenadeinpullback() && !istrue(self.id == "wm_buildable") && !istrue(self.id == "wm_IED")) {
        return 0;
    }
    if (!istrue(self.var_ac2702c39ae20d26) && player meleebuttonpressed()) {
        return 0;
    }
    if (player isinexecutionattack()) {
        return 0;
    }
    if (player isinexecutionvictim()) {
        return 0;
    }
    var_ec6ea16813d7df7d = undefined;
    if (isdefined(self.trigger) && isdefined(self.trigger.var_b9abe6bdf97e9a79)) {
        var_ec6ea16813d7df7d = self.trigger.var_b9abe6bdf97e9a79;
    } else if (isdefined(self.var_b9abe6bdf97e9a79)) {
        var_ec6ea16813d7df7d = self.var_b9abe6bdf97e9a79;
    }
    if (isdefined(var_ec6ea16813d7df7d)) {
        var_1cfccac3e5778bbb = self.origin;
        if (isdefined(self.trigger)) {
            var_1cfccac3e5778bbb = self.trigger.origin;
        }
        if (isdefined(var_1cfccac3e5778bbb) && distance2dsquared(var_1cfccac3e5778bbb, player.origin) >= var_ec6ea16813d7df7d) {
            return 0;
        }
    }
    if (!self.userate && !waitforweapon) {
        return 0;
    }
    if (waitforweapon && timedout > maxwaittime) {
        return 0;
    }
    if (istrue(self.checkuseconditioninthink) && isdefined(self.usecondition) && !self [[ self.usecondition ]](player)) {
        return 0;
    }
    if (isdefined(self.useweapon)) {
        if (player getcurrentweapon() != self.useweapon && !player isswitchingtoweaponwithmonitoring(self.useweapon) && !player isswimming()) {
            return 0;
        }
    }
    if (isrevivetrigger()) {
        if (!player islinked() && !player isonground() && !(istrue(self.var_dbc472744080c5d7) && player isswimming())) {
            return 0;
        }
        if (istrue(player.var_a23f35f8460d8857)) {
            return 0;
        }
    }
    return 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb9b
// Size: 0x44a
function useholdthinkloop(player, lastweapon) {
    level endon("game_ended");
    self endon("disabled");
    self endon("deleted");
    useweapon = self.useweapon;
    waitforweapon = 1;
    if (isdefined(self.waitforweapononuse)) {
        waitforweapon = self.waitforweapononuse;
    }
    if (!istrue(waitforweapon)) {
        self.userate = 1 * player.objectivescaler;
    }
    timedout = 0;
    maxwaittime = 1.5;
    updaterate = level.framedurationseconds;
    var_a1dfe9d4920a43fa = updaterate * 1000;
    objid = undefined;
    var_51666fd2d9bee728 = isdefined(self.var_2361cb77c7226f85);
    if (var_51666fd2d9bee728 && !isdefined(self.var_2361cb77c7226f85[player.clientid])) {
        self.var_2361cb77c7226f85[player.clientid] = 0;
    }
    while (usetest(player, waitforweapon, timedout, maxwaittime) || istrue(player.var_82300c21f62a6edb)) {
        if (isdefined(self.objidnum)) {
            namespace_5a22b6f3a56f7e9b::objective_pin_player(self.objidnum, player);
        }
        timedout = timedout + updaterate;
        if (!waitforweapon || !isdefined(useweapon) || player getcurrentweapon() == useweapon) {
            if (var_51666fd2d9bee728) {
                self.var_2361cb77c7226f85[player.clientid] = self.var_2361cb77c7226f85[player.clientid] + var_a1dfe9d4920a43fa * self.userate;
            } else {
                self.curprogress = self.curprogress + var_a1dfe9d4920a43fa * self.userate;
            }
            self.userate = 1 * player.objectivescaler;
            waitforweapon = 0;
        } else {
            self.userate = 0;
        }
        player updateuiprogress(self, 1);
        currentprogress = var_51666fd2d9bee728 ? self.var_2361cb77c7226f85[player.clientid] : self.curprogress;
        if (currentprogress >= self.usetime) {
            self.inuse = 0;
            if (istrue(self.exclusiveuse) && isdefined(self.trigger) && (self.trigger.classname == "trigger_use" || self.trigger.classname == "trigger_use_touch")) {
                player clientreleasetrigger(self.trigger);
            }
            var_d9842c97badaba31 = isdefined(self.id) && (self.id == "traversalassist" || self.id == "breach" || self.id == "care_package" || self.id == "wm_buildable" || self.id == "wm_IED");
            if (!isdefined(useweapon) && !istrue(var_d9842c97badaba31)) {
                if (isrevivetrigger() || isdefined(self.id) && self.id == "rugby_jugg") {
                    if (istrue(player.weaponsdisabledwhilereviving)) {
                        player.weaponsdisabledwhilereviving = undefined;
                        if (!istrue(level.allowreviveweapons)) {
                            player thread forceunsetdemeanor(0);
                            player val::function_c9d0b43701bdba00("useHold");
                        } else {
                            player val::function_588f2307a3040610("reviveShoot");
                        }
                    }
                } else {
                    player val::function_c9d0b43701bdba00("useHold");
                }
            }
            if (!istrue(self.var_c750f84cf6cd01d8)) {
                player unlink();
            }
            if (isdefined(self.objidnum)) {
                namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.objidnum, player);
            }
            player.var_82300c21f62a6edb = undefined;
            return isreallyalive(player);
        }
        wait(updaterate);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
    if (isdefined(self.objidnum)) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.objidnum, player);
    }
    player.var_82300c21f62a6edb = undefined;
    player updateuiprogress(self, 0);
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfed
// Size: 0x25a
function updatetrigger() {
    if (self.triggertype != "use") {
        return;
    }
    if (self.trigger.classname != "trigger_use" && self.trigger.classname != "trigger_use_touch") {
        return;
    }
    if (self.interactteam == "none") {
        self.trigger.origin = self.trigger.origin - (0, 0, 10000);
        if (isdefined(self.trigger.classname) && self.trigger.classname != "script_model") {
            self.trigger setteamfortrigger("none");
        }
    } else if (self.interactteam == "any") {
        self.trigger.origin = self.curorigin;
        self.trigger setteamfortrigger("none");
    } else if (self.interactteam == "friendly") {
        self.trigger.origin = self.curorigin;
        if (array_contains(level.teamnamelist, self.ownerteam)) {
            self.trigger setteamfortrigger(self.ownerteam);
        } else {
            self.trigger.origin = self.trigger.origin - (0, 0, 50000);
        }
    } else if (self.interactteam == "enemy") {
        self.trigger.origin = self.curorigin;
        if (self.ownerteam == "allies") {
            self.trigger setteamfortrigger("axis");
        } else if (self.ownerteam == "axis") {
            self.trigger setteamfortrigger("allies");
        } else {
            self.trigger setteamfortrigger("none");
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd24e
// Size: 0x4c
function getmlgteamcolor(team) {
    if (team == "allies") {
        return game["colors"]["friendly"];
    } else if (team == "axis") {
        return game["colors"]["enemy"];
    }
    return (1, 1, 1);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd2a2
// Size: 0x150
function setobjpointteamcolor(var_b74984f8b12cf978, updateTeam, relativeteam) {
    if (updateTeam == "mlg_allies") {
        var_b74984f8b12cf978 setmlgdraw(1, 0);
        var_2c5085251c6170dc = self.objiconscolor[relativeteam];
        if (var_2c5085251c6170dc == "friendly") {
            var_b74984f8b12cf978.color = getmlgteamcolor("allies");
        } else if (var_2c5085251c6170dc == "enemy") {
            var_b74984f8b12cf978.color = getmlgteamcolor("axis");
        } else {
            var_b74984f8b12cf978.color = game["colors"][var_2c5085251c6170dc];
        }
    } else if (updateTeam == "mlg_axis") {
        var_b74984f8b12cf978 setmlgdraw(1, 0);
        var_2c5085251c6170dc = self.objiconscolor[relativeteam];
        if (var_2c5085251c6170dc == "friendly") {
            var_b74984f8b12cf978.color = getmlgteamcolor("axis");
        } else if (var_2c5085251c6170dc == "enemy") {
            var_b74984f8b12cf978.color = getmlgteamcolor("allies");
        } else {
            var_b74984f8b12cf978.color = game["colors"][var_2c5085251c6170dc];
        }
    } else {
        var_b74984f8b12cf978.color = game["colors"][self.objiconscolor[relativeteam]];
        var_b74984f8b12cf978 setmlgdraw(0, 1);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3f9
// Size: 0x30
function hideworldiconongameend() {
    self notify("hideWorldIconOnGameEnd");
    self endon("hideWorldIconOnGameEnd");
    self endon("death");
    level waittill("game_ended");
    if (isdefined(self)) {
        self.alpha = 0;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd430
// Size: 0x14
function updatetimer(seconds, showicon) {
    
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd44b
// Size: 0xe3
function setobjectivestatusallicons(friendlyicon, var_30f120a1efc1dcbe, var_30d3474e85b85838, objid, ownerteam) {
    if (istrue(self.lockupdatingicons)) {
        return;
    }
    if (!isdefined(friendlyicon)) {
        friendlyicon = var_30f120a1efc1dcbe;
    }
    if (!isdefined(var_30f120a1efc1dcbe)) {
        var_30f120a1efc1dcbe = friendlyicon;
    }
    if (!isdefined(self.iconname)) {
        self.iconname = "";
    }
    if (istrue(level.codcasterenabled)) {
        if (!isdefined(var_30d3474e85b85838)) {
            self.compassicons["codcaster"] = undefined;
        } else {
            self.compassicons["codcaster"] = var_30d3474e85b85838 + self.iconname;
        }
    }
    self.compassicons["friendly"] = friendlyicon + self.iconname;
    self.compassicons["enemy"] = var_30f120a1efc1dcbe + self.iconname;
    updatecompassicons(objid, ownerteam);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd535
// Size: 0xa9
function setobjectivestatusicons(friendlyicon, var_30f120a1efc1dcbe, objid, ownerteam, var_3b41b9a0ea9af087) {
    if (istrue(self.lockupdatingicons)) {
        return;
    }
    if (!isdefined(friendlyicon)) {
        friendlyicon = var_30f120a1efc1dcbe;
    }
    if (!isdefined(var_30f120a1efc1dcbe)) {
        var_30f120a1efc1dcbe = friendlyicon;
    }
    if (!isdefined(self.iconname)) {
        self.iconname = "";
    }
    self.compassicons["friendly"] = friendlyicon + self.iconname;
    self.compassicons["enemy"] = var_30f120a1efc1dcbe + self.iconname;
    if (!istrue(var_3b41b9a0ea9af087)) {
        updatecompassicons(objid, ownerteam);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd5e5
// Size: 0x6f
function setmlgobjectivestatusicon(var_30d3474e85b85838, objid, ownerteam) {
    if (!istrue(level.codcasterenabled)) {
        return;
    }
    if (!isdefined(var_30d3474e85b85838)) {
        return;
    }
    if (!isdefined(self.iconname)) {
        self.iconname = "";
    }
    self.compassicons["codcaster"] = var_30d3474e85b85838 + self.iconname;
    updatecompassicons(objid, ownerteam);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd65b
// Size: 0x2c
function resetmlgobjectivestatusicon(objid, ownerteam) {
    self.compassicons["codcaster"] = undefined;
    updatecompassicons(objid, ownerteam);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68e
// Size: 0x75
function updatecompassicons(objid, ownerteam) {
    visibleteam = self.visibleteam;
    if (!isdefined(self.visibleteam)) {
        visibleteam = "none";
    }
    updatecompassicon(visibleteam, objid, ownerteam);
    if (isdefined(self.var_b8cc16dcaf5a0746)) {
        if (!isdefined(objid)) {
            objid = self.objidnum;
        }
        level namespace_5a22b6f3a56f7e9b::function_c3c6bff089dfdd34(objid, self.var_b8cc16dcaf5a0746);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd70a
// Size: 0x26
function function_4ac89e9b562bf080() {
    var_a90dc3cedb76f3a0 = level.teamnamelist;
    var_a90dc3cedb76f3a0 = array_add(var_a90dc3cedb76f3a0, "codcaster");
    return var_a90dc3cedb76f3a0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd738
// Size: 0x7df
function updatecompassicon(relativeteam, objid, ownerteam) {
    var_dca4604f39117a = relativeteam == "any";
    var_c0d426fb0da57cf2 = relativeteam == "none";
    var_aa4f261ba2f9905a = relativeteam == "codcaster";
    if (var_dca4604f39117a || var_c0d426fb0da57cf2) {
        updateteams = function_4ac89e9b562bf080();
    } else {
        var_b66cfd2561f4565b = getupdateteams(relativeteam);
        updateteams = var_b66cfd2561f4565b.teams;
    }
    var_1341915118cc82b = 0;
    for (index = 0; index < updateteams.size; index++) {
        updateTeam = updateteams[index];
        if (var_dca4604f39117a || var_c0d426fb0da57cf2) {
            var_5c5d470bd64763f8 = updateTeam;
        } else {
            var_5c5d470bd64763f8 = updateTeam.team;
        }
        if (!var_c0d426fb0da57cf2 && !var_dca4604f39117a && !var_aa4f261ba2f9905a && !isgameplayteam(var_5c5d470bd64763f8)) {
            continue;
        }
        var_58498fc5d5879ba1 = !var_c0d426fb0da57cf2 && (var_dca4604f39117a || updateTeam.showtoteam);
        if (!var_58498fc5d5879ba1 && shouldshowcompassduetoradar(var_5c5d470bd64763f8)) {
            var_58498fc5d5879ba1 = 1;
        }
        if (!isdefined(objid)) {
            objid = self.objidnum;
        }
        if (objid != -1) {
            if (!istrue(self.visibilitymanuallycontrolled)) {
                if (!isdefined(self.compassicons["friendly"]) || !var_58498fc5d5879ba1) {
                    namespace_5a22b6f3a56f7e9b::objective_teammask_removefrommask(objid, var_5c5d470bd64763f8);
                    continue;
                } else {
                    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(objid, var_5c5d470bd64763f8);
                }
                if (!isdefined(self.compassicons["enemy"]) || !var_58498fc5d5879ba1) {
                    namespace_5a22b6f3a56f7e9b::objective_teammask_removefrommask(objid, var_5c5d470bd64763f8);
                    continue;
                } else {
                    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(objid, var_5c5d470bd64763f8);
                }
            }
            if (!var_1341915118cc82b) {
                icon = getwaypointshader(self.compassicons["friendly"]);
                namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, icon);
                iconid = function_3672af010e23dfc8(self.compassicons["friendly"]);
                if (iconid) {
                    namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(objid, iconid);
                }
                var_91dbc914c620ccb0 = getwaypointbackgroundcolor(self.compassicons["friendly"]);
                var_91dbc914c620ccb0 = ter_op(isdefined(var_91dbc914c620ccb0), var_91dbc914c620ccb0, "neutral");
                var_b068858b9eb29701 = getwaypointbackgroundcolor(self.compassicons["enemy"]);
                var_b068858b9eb29701 = ter_op(isdefined(var_b068858b9eb29701), var_b068858b9eb29701, "neutral");
                iscontested = 0;
                objstate = getobjectivestate(var_91dbc914c620ccb0, var_b068858b9eb29701);
                if (objstate == "contest") {
                    iscontested = 1;
                }
                if (iscontested) {
                    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objid, undefined);
                    namespace_5a22b6f3a56f7e9b::update_objective_sethot(objid, 1);
                } else {
                    namespace_5a22b6f3a56f7e9b::update_objective_sethot(objid, 0);
                }
                if (getgametype() == "wm") {
                    islocked = ter_op(istrue(self.locked), 1, 0);
                    if (isdefined(self.objectivekey) && isdefined(level.objectives) && isdefined(level.objectives[self.objectivekey])) {
                        setomnvar("ui_wm_locked_objective" + self.objectivekey, islocked);
                    }
                }
                if (isdefined(ownerteam)) {
                    self.ownerteam = ownerteam;
                }
                var_a041bea72ba46e04 = getwaypointstring(self.compassicons["friendly"]);
                var_ba5c3a2b11fff3f5 = getwaypointstring(self.compassicons["enemy"]);
                if (objstate == "neutral" || !isdefined(self.ownerteam)) {
                    if (isdefined(self.claimteam) && self.claimteam != "none") {
                        if (isdefined(self.ownerteam) && self.ownerteam != "neutral") {
                            namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, self.claimteam);
                            namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objid, var_a041bea72ba46e04);
                            namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objid, var_ba5c3a2b11fff3f5);
                        } else {
                            namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, undefined);
                            namespace_5a22b6f3a56f7e9b::update_objective_setneutrallabel(objid, var_a041bea72ba46e04);
                        }
                    } else {
                        namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, undefined);
                        namespace_5a22b6f3a56f7e9b::update_objective_setneutrallabel(objid, var_a041bea72ba46e04);
                    }
                } else if (objstate == "claimed") {
                    if (self.ownerteam != "neutral") {
                        namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, self.ownerteam);
                    } else {
                        namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, undefined);
                    }
                    namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objid, var_a041bea72ba46e04);
                    namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objid, var_ba5c3a2b11fff3f5);
                } else if (objstate == "contest") {
                    if (self.cancontestclaim && self.stalemate != self.wasstalemate || self.cancontestclaim && istrue(self.majoritycapprogress) && self.majoritycapprogress != self.wasmajoritycapprogress) {
                        objective_setlabel(objid, var_a041bea72ba46e04);
                    } else {
                        if (!isgameplayteam(self.claimteam)) {
                            continue;
                        }
                        namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, self.claimteam);
                        namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objid, var_a041bea72ba46e04);
                        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objid, var_ba5c3a2b11fff3f5);
                    }
                }
                var_bab98e6efff82b79 = getwaypointbackgroundtype(self.compassicons["friendly"]);
                namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, var_bab98e6efff82b79);
                var_ead9736888add0df = getwaypointobjpulse(self.compassicons["friendly"]);
                namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objid, var_ead9736888add0df);
                if (hasdomflags() && getgametype() != "wm") {
                    if (!istrue(self.stalemate) && self.ownerteam != "neutral") {
                        if (self.numtouching["axis"] > 0 && self.numtouching["allies"] > 0) {
                            self.captureblocked = 1;
                            namespace_5a22b6f3a56f7e9b::update_objective_sethot(objid, 1);
                        } else {
                            self.captureblocked = 0;
                            namespace_5a22b6f3a56f7e9b::update_objective_sethot(objid, 0);
                        }
                    }
                }
                if (self.type == "carryObject") {
                    if (isreallyalive(self.carrier) && !shouldpingobject(relativeteam)) {
                        namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, self.carrier);
                        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, self.offset3d[2]);
                    } else if (isdefined(self.visuals) && isdefined(self.visuals[0]) && isdefined(self.visuals[0] getlinkedparent())) {
                        namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, self.visuals[0]);
                    } else if (isdefined(self.objectiveonvisuals) && self.objectiveonvisuals) {
                        if (!shouldpingobject(relativeteam)) {
                            namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, self.visuals[0]);
                            if (isdefined(self.objectiveonvisualsoffset3d)) {
                                namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, self.objectiveonvisualsoffset3d[2]);
                            }
                        } else if (isdefined(self.objectiveonvisualsoffset3d)) {
                            namespace_5a22b6f3a56f7e9b::update_objective_position(objid, self.curorigin + (0, 0, self.objectiveonvisualsoffset3d[2]));
                        } else {
                            namespace_5a22b6f3a56f7e9b::update_objective_position(objid, self.curorigin);
                        }
                    } else {
                        namespace_5a22b6f3a56f7e9b::update_objective_position(objid, self.curorigin);
                        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, self.offset3d[2]);
                    }
                } else if (isdefined(self.objiconent)) {
                    namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, self.objiconent);
                }
                var_1341915118cc82b = 1;
            }
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf1e
// Size: 0x44
function shouldpingobject(relativeteam) {
    if (relativeteam == "friendly" && self.objidpingenemy) {
        return 1;
    } else if (relativeteam == "enemy" && self.objidpingfriendly) {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6a
// Size: 0x2e7
function getupdateteams(relativeteam) {
    updateteams = spawnstruct();
    updateteams.teams = [];
    teamnamelist = function_4ac89e9b562bf080();
    foreach (teamname in teamnamelist) {
        index = updateteams.teams.size;
        updateteams.teams[index] = spawnstruct();
        if (relativeteam == "any") {
            updateteams.teams[index].team = teamname;
            updateteams.teams[index].showtoteam = 1;
        } else if (relativeteam == "none") {
            updateteams.teams[index].team = teamname;
            updateteams.teams[index].showtoteam = 0;
        } else if (relativeteam == "codcaster") {
            if (teamname == "codcaster") {
                updateteams.teams[index].team = teamname;
                updateteams.teams[index].showtoteam = 1;
            } else {
                updateteams.teams[index].team = teamname;
                updateteams.teams[index].showtoteam = 0;
            }
        } else if (isgameplayteam(teamname)) {
            if (relativeteam == "friendly") {
                if (isfriendlyteam(teamname)) {
                    updateteams.teams[index].team = teamname;
                    updateteams.teams[index].showtoteam = 1;
                } else {
                    updateteams.teams[index].team = teamname;
                    updateteams.teams[index].showtoteam = 0;
                }
            } else if (relativeteam == "enemy") {
                if (isfriendlyteam(teamname)) {
                    updateteams.teams[index].team = teamname;
                    updateteams.teams[index].showtoteam = 0;
                } else {
                    updateteams.teams[index].team = teamname;
                    updateteams.teams[index].showtoteam = 1;
                }
            }
        } else {
            updateteams.teams[index].team = teamname;
            updateteams.teams[index].showtoteam = 0;
        }
    }
    return updateteams;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe259
// Size: 0x56
function getobjectivestate(var_91dbc914c620ccb0, var_b068858b9eb29701) {
    if (var_91dbc914c620ccb0 == "contest" || var_b068858b9eb29701 == "contest") {
        return "contest";
    } else if (var_91dbc914c620ccb0 == "neutral" || var_b068858b9eb29701 == "neutral") {
        return "neutral";
    } else {
        return "claimed";
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2b6
// Size: 0x3a
function shouldshowcompassduetoradar(team) {
    if (!isdefined(self.carrier)) {
        return 0;
    }
    if (self.carrier _hasperk("specialty_gpsjammer")) {
        return 0;
    }
    return getteamradar(team);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2f8
// Size: 0x28
function updatevisibilityaccordingtoradar() {
    self endon("death");
    self endon("carrier_cleared");
    while (1) {
        level waittill("radar_status_change");
        updatecompassicons();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe327
// Size: 0x38
function setownerteam(team) {
    self.ownerteam = team;
    updatetrigger();
    updatecompassicons();
    if (team != "neutral") {
        self.prevownerteam = team;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe366
// Size: 0xc
function getownerteam() {
    return self.ownerteam;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe37a
// Size: 0x42
function setusetime(time, var_3535ad78361036a5) {
    if (istrue(var_3535ad78361036a5)) {
        self.var_3b3185f4d42ee4e6 = self.usetime / 1000;
    }
    self.usetime = int(time * 1000);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3c3
// Size: 0xe
function pinobjiconontriggertouch() {
    self.pinobj = 1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d8
// Size: 0xd
function function_9a19ccf8dc6c3caf() {
    return istrue(self.pinobj);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3ed
// Size: 0x48
function function_dc06030ceb03363b() {
    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b() && isdefined(self.trigger) && isdefined(self.trigger.objidnum)) {
        return istrue(self.trigger.pinobj);
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe43d
// Size: 0x16
function setwaitweaponchangeonuse(bool) {
    self.waitforweapononuse = bool;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe45a
// Size: 0x16
function setusetext(text) {
    self.usetext = text;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe477
// Size: 0x2a
function setteamusetime(relativeteam, time) {
    self.teamusetimes[relativeteam] = int(time * 1000);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe4a8
// Size: 0x21
function setteamusetext(relativeteam, text) {
    self.teamusetexts[relativeteam] = text;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4d0
// Size: 0x1c
function setusehinttext(text) {
    self.trigger sethintstring(text);
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4f3
// Size: 0x16
function allowcarry(relativeteam) {
    self.interactteam = relativeteam;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe510
// Size: 0x1d
function allowuse(relativeteam) {
    self.interactteam = relativeteam;
    updatetrigger();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe534
// Size: 0x76
function squadallowuse(team, squadindex) {
    if (!isdefined(self.interactsquads)) {
        self.interactsquads = [];
    }
    if (!isdefined(self.interactsquads[team])) {
        self.interactsquads[team] = [];
    }
    if (!array_contains(self.interactsquads[team], squadindex)) {
        self.interactsquads[team][self.interactsquads[team].size] = squadindex;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe5b1
// Size: 0x7a
function squaddenyuse(team, squadindex) {
    if (!isdefined(self.interactsquads)) {
        self.interactsquads = [];
    }
    if (!isdefined(self.interactsquads[team])) {
        self.interactsquads[team] = [];
    }
    if (array_contains(self.interactsquads[team], squadindex)) {
        self.interactsquads[team] = array_remove(self.interactsquads[team], squadindex);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe632
// Size: 0x33
function setvisibleteam(relativeteam, objid, var_3b41b9a0ea9af087) {
    self.visibleteam = relativeteam;
    if (!istrue(var_3b41b9a0ea9af087)) {
        updatecompassicons(objid);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66c
// Size: 0x4a
function function_6bfd547f584e5161(islocked, objid) {
    self.locked = islocked;
    if (istrue(self.locked)) {
        setownerteam("neutral");
    } else {
        setownerteam(self.prevownerteam);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6bd
// Size: 0x187
function setmodelvisibility(visibility) {
    if (visibility) {
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index] show();
            if (self.visuals[index].classname == "script_brushmodel" || self.visuals[index].classname == "script_model") {
                foreach (player in level.players) {
                    if (player istouching(self.visuals[index])) {
                        player _suicide();
                    }
                }
                self.visuals[index] thread makesolid();
            }
        }
    } else {
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index] hide();
            if (self.visuals[index].classname == "script_brushmodel" || self.visuals[index].classname == "script_model") {
                self.visuals[index] notify("changing_solidness");
                self.visuals[index] notsolid();
            }
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe84b
// Size: 0x7a
function function_c882c384f0e771a1(var_f28b9b572a5954b6) {
    if (getgametype() == "wm") {
        shouldshow = ter_op(istrue(var_f28b9b572a5954b6), 1, 0);
        if (isdefined(self.objectivekey) && isdefined(level.objectives) && isdefined(level.objectives[self.objectivekey])) {
            setomnvar("ui_wm_show_objective_icon_on_waypoint" + self.objectivekey, shouldshow);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8cc
// Size: 0x7a
function function_3e4a31be47aee8f3(skip) {
    if (getgametype() == "wm") {
        var_8e75e25718adee6d = ter_op(istrue(skip), 1, 0);
        if (isdefined(self.objectivekey) && isdefined(level.objectives) && isdefined(level.objectives[self.objectivekey])) {
            setomnvar("ui_wm_skip_objective_icon_update_on_distance" + self.objectivekey, var_8e75e25718adee6d);
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe94d
// Size: 0x78
function makesolid() {
    self endon("death");
    self notify("changing_solidness");
    self endon("changing_solidness");
    while (1) {
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i] istouching(self)) {
                break;
            }
        }
        if (i == level.players.size) {
            self solid();
            break;
        }
        wait(0.05);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe9cc
// Size: 0x16
function setcarriervisible(relativeteam) {
    self.carriervisible = relativeteam;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe9e9
// Size: 0x16
function setcanuse(relativeteam) {
    self.useteam = relativeteam;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea06
// Size: 0x2e
function getwaypointshader(shader) {
    image = level.waypointshader[shader];
    if (!isdefined(image)) {
        return "icon_waypoint_dom_a";
    }
    return image;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea3c
// Size: 0x2a
function getwaypointbackgroundtype(shader) {
    var_bab98e6efff82b79 = level.waypointbgtype[shader];
    if (!isdefined(var_bab98e6efff82b79)) {
        return 0;
    }
    return var_bab98e6efff82b79;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea6e
// Size: 0x2e
function getwaypointbackgroundcolor(shader) {
    var_2c5085251c6170dc = level.waypointcolors[shader];
    if (!isdefined(var_2c5085251c6170dc)) {
        return "neutral";
    }
    return var_2c5085251c6170dc;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaa4
// Size: 0x2e
function getwaypointstring(shader) {
    stringref = level.waypointstring[shader];
    if (!isdefined(stringref)) {
        return "MP_INGAME_ONLY/MISSING_STRING";
    }
    return stringref;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeada
// Size: 0x2a
function getwaypointobjpulse(shader) {
    pulse = level.waypointpulses[shader];
    if (!isdefined(pulse)) {
        return 0;
    }
    return pulse;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb0c
// Size: 0x2a
function function_3672af010e23dfc8(name) {
    iconid = level.var_ed9acfb4a79fb6be[name];
    if (!isdefined(iconid)) {
        return 0;
    }
    return iconid;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeb3e
// Size: 0x21
function set3duseicon(relativeteam, shader) {
    self.worlduseicons[relativeteam] = shader;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb66
// Size: 0x16
function setcarryicon(shader) {
    self.carryicon = shader;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb83
// Size: 0x89
function disableobject() {
    self notify("disabled");
    if (self.type == "carryObject") {
        if (isdefined(self.carrier)) {
            self.carrier takeobject(self);
        }
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index] hide();
        }
    }
    self.trigger namespace_3c37cb17ade254d::trigger_off();
    setvisibleteam("none");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec13
// Size: 0x63
function enableobject() {
    if (self.type == "carryObject") {
        for (index = 0; index < self.visuals.size; index++) {
            self.visuals[index] show();
        }
    }
    self.trigger namespace_3c37cb17ade254d::trigger_on();
    setvisibleteam("any");
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec7d
// Size: 0x29
function getrelativeteam(team) {
    if (team == self.ownerteam) {
        return "friendly";
    } else {
        return "enemy";
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecad
// Size: 0x65
function isfriendlyteam(team) {
    if (self.ownerteam == "any") {
        return 1;
    }
    if (self.ownerteam == team) {
        return 1;
    }
    if (self.ownerteam == "neutral" && isdefined(self.prevownerteam) && self.prevownerteam == team) {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed1a
// Size: 0xfa
function caninteractwith(team, player) {
    if (isdefined(player) && isdefined(self.interactsquads)) {
        return (isdefined(self.interactsquads[player.team]) && array_contains(self.interactsquads[player.team], player.var_ff97225579de16a));
    } else {
        switch (self.interactteam) {
        case #"hash_db653a4972b3c13b":
            return 0;
        case #"hash_c4e456c1095f52d":
            return 1;
        case #"hash_ecada18a31eceade":
            if (team == self.ownerteam) {
                return 1;
                goto LOC_00000092;
            }
            return 0;
        case #"hash_3e323a3a6f36e18b":
        LOC_00000092:
            if (team != self.ownerteam) {
                return 1;
                goto LOC_000000a8;
            }
            return 0;
        default:
        LOC_000000a8:
            /#
                assertex(0, "invalid interactTeam");
            #/
            return 0;
            break;
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee1b
// Size: 0x8a
function isteam(team) {
    if (team == "neutral") {
        return 1;
    }
    if (team == "any") {
        return 1;
    }
    if (team == "none") {
        return 1;
    }
    foreach (teamname in level.teamnamelist) {
        if (team == teamname) {
            return 1;
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeead
// Size: 0x41
function isrelativeteam(relativeteam) {
    if (relativeteam == "friendly") {
        return 1;
    }
    if (relativeteam == "enemy") {
        return 1;
    }
    if (relativeteam == "any") {
        return 1;
    }
    if (relativeteam == "none") {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeef6
// Size: 0x37
function getlabel() {
    if (!isdefined(self.trigger.script_label)) {
        return "";
    } else {
        return self.trigger.script_label;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef34
// Size: 0x21
function initializetagpathvariables() {
    self.nearest_node = undefined;
    self.calculated_nearest_node = 0;
    self.on_path_grid = undefined;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef5c
// Size: 0x16
function mustmaintainclaim(enabled) {
    self.mustmaintainclaim = enabled;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef79
// Size: 0x16
function cancontestclaim(enabled) {
    self.cancontestclaim = enabled;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef96
// Size: 0x9b
function getleveltriggers() {
    level.minetriggers = getentarray("minefield", "targetname");
    level.hurttriggers = getentarray("trigger_hurt", "classname");
    level.radtriggers = getentarray("radiation", "targetname");
    level.ballallowedtriggers = getentarray("uplinkAllowedOOB", "targetname");
    level.nozonetriggers = getentarray("uplink_nozone", "targetname");
    level.droptonavmeshtriggers = getentarray("dropToNavMesh", "targetname");
    thread namespace_ab403fa2c6c142a4::initarbitraryuptriggers();
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf038
// Size: 0x8e
function isbombmode() {
    switch (getgametype()) {
    case #"hash_1aac086c17fe5ccb":
    case #"hash_214e6c6c1b43ae4a":
    case #"hash_9a6f07d0214a87db":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0cd
// Size: 0x46
function isflagcarrymode() {
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_1a5d186c17c00d3c":
    case #"hash_3a17de6e294210d2":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf11a
// Size: 0x114
function touchingdroptonavmeshtrigger(droppoint) {
    if (level.droptonavmeshtriggers.size > 0) {
        if (isbombmode() || getgametype() == "ctf" || getgametype() == "bigctf" || getgametype() == "tdef") {
            self.visuals[0].origin = droppoint;
        }
        foreach (trigger in level.droptonavmeshtriggers) {
            foreach (visual in self.visuals) {
                if (visual istouching(trigger)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf236
// Size: 0x6d
function touchingarbitraryuptrigger() {
    if (level.arbitraryuptriggers.size > 0) {
        foreach (trigger in level.arbitraryuptriggers) {
            if (self istouching(trigger)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2ab
// Size: 0x6a
function resetcaptureprogress() {
    if (isdefined(self.teamprogress)) {
        foreach (team, progress in self.teamprogress) {
            self.teamprogress[team] = 0;
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf31c
// Size: 0x74
function getcaptureprogress() {
    if (isdefined(self.teamprogress) && isdefined(self.claimteam)) {
        if (self.claimteam != "none") {
            return (self.teamprogress[self.claimteam] / self.usetime);
        } else {
            return (self.teamprogress[self.lastclaimteam] / self.usetime);
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf398
// Size: 0x18b
function requestid(minimap, world, var_aa530b7c5aefa0b4, showoncompass, dointro, iconsize, var_8b9949739f4e0f6) {
    if (istrue(var_8b9949739f4e0f6)) {
        self.objidnum = -1;
        return;
    }
    if (isdefined(var_aa530b7c5aefa0b4)) {
        self.objidnum = namespace_5a22b6f3a56f7e9b::requestreservedid(var_aa530b7c5aefa0b4);
    } else {
        self.objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    }
    if (self.objidnum != -1) {
        var_24c76fc549f7fd9 = "done";
        if (minimap && world) {
            var_24c76fc549f7fd9 = "current";
        } else if (minimap) {
            var_24c76fc549f7fd9 = "active";
        } else if (world) {
            var_24c76fc549f7fd9 = "invisible";
        }
        namespace_5a22b6f3a56f7e9b::objective_add_objective(self.objidnum, var_24c76fc549f7fd9, self.curorigin + self.offset3d, undefined, iconsize);
        if (getdvarint(@"hash_5fb9811d17b52a04", 0) == 1) {
            if (isdefined(showoncompass) && showoncompass == 0) {
                objective_setshowoncompass(self.objidnum, 0);
                self.showoncompass = 0;
            } else {
                objective_setshowoncompass(self.objidnum, 1);
            }
        }
        if (isdefined(dointro)) {
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.objidnum, dointro);
            namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.objidnum, dointro);
        }
        self.showworldicon = 0;
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.objidnum);
        if (world) {
            self.showworldicon = 1;
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf52a
// Size: 0x48
function releaseid(var_321e7a51d3237066, var_301ec764dd09b364) {
    if (istrue(var_321e7a51d3237066)) {
        namespace_5a22b6f3a56f7e9b::returnreservedobjectiveid(self.objidnum, var_301ec764dd09b364);
    } else {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objidnum);
    }
    self.objidnum = -1;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf579
// Size: 0x25
function getcapturebehavior() {
    if (!isdefined(self.capturebehavior)) {
        setcapturebehavior("normal");
    }
    return self.capturebehavior;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5a6
// Size: 0x16
function setcapturebehavior(type) {
    self.capturebehavior = type;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5c3
// Size: 0x86a
function applycaptureprogress(team, delta) {
    var_b0c33d224b825287 = [];
    if (!istrue(level.var_d914655fe46b8e34)) {
        var_b0c33d224b825287 = getenemyteams(team);
    }
    switch (getcapturebehavior()) {
    case #"hash_aba5a17ce738e820":
        self.teamprogress[team] = self.teamprogress[team] + delta;
        self.curprogress = self.teamprogress[team];
        break;
    case #"hash_9236a87bf25f2cf2":
        if (!isdefined(self.ownerteam) || self.ownerteam == team) {
            return;
        }
        break;
    case #"hash_cac451c4df417b3a":
        if (istrue(level.var_d914655fe46b8e34)) {
            var_b0c33d224b825287 = getenemyteams(team);
        }
        foreach (entry in var_b0c33d224b825287) {
            var_75016344bdee1d3a = self.teamprogress[entry];
            if (var_75016344bdee1d3a > 0) {
                if (var_75016344bdee1d3a < delta) {
                    self.teamprogress[entry] = 0;
                    delta = delta - var_75016344bdee1d3a;
                } else {
                    self.teamprogress[entry] = self.teamprogress[entry] - delta;
                    delta = 0;
                    self.curprogress = self.teamprogress[entry];
                    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 1);
                    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, self.curprogress / self.usetime);
                }
            }
        }
        if (delta > 0) {
            self.teamprogress[team] = self.teamprogress[team] + delta;
            self.curprogress = self.teamprogress[team];
        }
        break;
    case #"hash_960e9b6651d8fa0f":
        if (!isdefined(self.associatedteams) || !array_contains(self.associatedteams, team)) {
            return;
        }
        if (istrue(level.var_d914655fe46b8e34)) {
            var_b0c33d224b825287 = getenemyteams(team);
        }
        foreach (entry in var_b0c33d224b825287) {
            var_75016344bdee1d3a = self.teamprogress[entry];
            if (var_75016344bdee1d3a > 0) {
                if (var_75016344bdee1d3a < delta) {
                    self.teamprogress[entry] = 0;
                    delta = delta - var_75016344bdee1d3a;
                } else {
                    self.teamprogress[entry] = self.teamprogress[entry] - delta;
                    delta = 0;
                    self.curprogress = self.teamprogress[entry];
                    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 1);
                    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, self.curprogress / self.usetime);
                }
            }
        }
        if (delta > 0) {
            self.teamprogress[team] = self.teamprogress[team] + delta;
            self.curprogress = self.teamprogress[team];
        }
        break;
    case #"hash_f461a0075f6ed30f":
        if (team != self.team) {
            return;
        }
        if (team == self.team) {
            if (istrue(level.var_d914655fe46b8e34)) {
                var_b0c33d224b825287 = getenemyteams(team);
            }
            foreach (enemyteam in var_b0c33d224b825287) {
                if (self.numtouching[enemyteam] > 0) {
                    return;
                }
            }
        }
        self.teamprogress[team] = self.teamprogress[team] + delta;
        self.curprogress = self.teamprogress[team];
        break;
    case #"hash_d195b93b682ce6f1":
        self.cancontestclaim = 0;
        var_8ab430c83ac9f21c = 0;
        foreach (var_78153a9558995315 in self.touchlist) {
            if (var_78153a9558995315.size == 0) {
                continue;
            }
            var_59db5d0f4e3000a7 = getarraykeys(var_78153a9558995315);
            var_8ab430c83ac9f21c = var_8ab430c83ac9f21c + var_59db5d0f4e3000a7.size;
        }
        self.curprogress = self.curprogress + delta * var_8ab430c83ac9f21c;
        self.teamprogress[team] = self.curprogress;
        self.var_3ba42e8c18b42c71 = undefined;
        break;
    default:
        progress = self.teamprogress[team];
        progress = progress + delta;
        var_6736d41e2af881de = 0;
        numtouching = getnumtouchingforteam(team);
        numother = getnumtouchingexceptteam(team);
        if (numtouching && numother && numtouching != numother && !istrue(self.var_6c9cdfc1bc07df96)) {
            var_6736d41e2af881de = 1;
        }
        if (istrue(self.majoritycapprogress) && progress >= self.usetime * 0.95 && istrue(var_6736d41e2af881de)) {
            if (self.ownerteam == "neutral") {
                foreach (team in level.teamnamelist) {
                    if (self.touchlist[team].size) {
                        touchlist = self.touchlist[team];
                        var_59db5d0f4e3000a7 = getarraykeys(touchlist);
                        for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
                            player = touchlist[var_59db5d0f4e3000a7[index]].player;
                            if (!isdefined(player) || !isalive(player)) {
                                continue;
                            }
                            if (team == self.claimteam) {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", 4);
                            } else {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", 4);
                            }
                        }
                    }
                }
                self.var_3ba42e8c18b42c71 = 1;
                namespace_5a22b6f3a56f7e9b::update_objective_sethot(self.objidnum, 1);
                namespace_5a22b6f3a56f7e9b::update_objective_setneutrallabel(self.objidnum, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS");
            } else {
                foreach (team in level.teamnamelist) {
                    if (self.touchlist[team].size) {
                        touchlist = self.touchlist[team];
                        var_59db5d0f4e3000a7 = getarraykeys(touchlist);
                        for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
                            player = touchlist[var_59db5d0f4e3000a7[index]].player;
                            if (!isdefined(player) || !isalive(player)) {
                                continue;
                            }
                            if (team == self.ownerteam) {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", 4);
                            } else {
                                player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", 4);
                            }
                        }
                    }
                }
                self.var_3ba42e8c18b42c71 = 1;
                namespace_5a22b6f3a56f7e9b::update_objective_sethot(self.objidnum, 1);
                namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS");
                namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS");
            }
        } else {
            if (self.ownerteam != "neutral") {
                if (self.ownerteam != team) {
                    namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(self.objidnum, "MP_INGAME_ONLY/OBJ_LOSING_CAPS");
                }
            }
            self.teamprogress[team] = self.teamprogress[team] + delta;
            self.curprogress = self.teamprogress[team];
            self.var_3ba42e8c18b42c71 = undefined;
        }
        break;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe34
// Size: 0x16f
function createhintobject(var_963953c3478bf4fe, var_ee1f571f85c89c5c, var_efe526bf6a23d275, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    hintobj = spawn("script_model", var_963953c3478bf4fe);
    hintobj makeusable();
    if (isdefined(var_ee1f571f85c89c5c)) {
        hintobj setcursorhint(var_ee1f571f85c89c5c);
    } else {
        hintobj setcursorhint("HINT_NOICON");
    }
    if (isdefined(var_efe526bf6a23d275)) {
        hintobj sethinticon(var_efe526bf6a23d275);
    }
    if (isdefined(hintstring)) {
        hintobj sethintstring(hintstring);
    }
    if (isdefined(priority)) {
        hintobj setusepriority(priority);
    } else {
        hintobj setusepriority(0);
    }
    if (isdefined(duration)) {
        hintobj setuseholdduration(duration);
    } else {
        hintobj setuseholdduration("duration_short");
    }
    if (isdefined(onobstruction)) {
        hintobj sethintonobstruction(onobstruction);
    } else {
        hintobj sethintonobstruction("hide");
    }
    if (isdefined(hintdist)) {
        hintobj sethintdisplayrange(hintdist);
    } else {
        hintobj sethintdisplayrange(200);
    }
    if (isdefined(hintfov)) {
        hintobj sethintdisplayfov(hintfov);
    } else {
        hintobj sethintdisplayfov(160);
    }
    if (isdefined(usedist)) {
        hintobj setuserange(usedist);
    } else {
        hintobj setuserange(50);
    }
    if (isdefined(usefov)) {
        hintobj setusefov(usefov);
    } else {
        hintobj setusefov(120);
    }
    return hintobj;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffab
// Size: 0x170
function sethintobject(var_5e8eb3c31f9c265c, var_ee1f571f85c89c5c, var_efe526bf6a23d275, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        hintstring = undefined;
    }
    self makeusable();
    if (isdefined(var_5e8eb3c31f9c265c)) {
        self sethinttag(var_5e8eb3c31f9c265c);
    }
    if (isdefined(var_ee1f571f85c89c5c)) {
        self setcursorhint(var_ee1f571f85c89c5c);
    } else {
        self setcursorhint("HINT_NOICON");
    }
    if (isdefined(var_efe526bf6a23d275)) {
        self sethinticon(var_efe526bf6a23d275);
    }
    if (isdefined(hintstring)) {
        self sethintstring(hintstring);
    }
    if (isdefined(priority)) {
        self setusepriority(priority);
    } else {
        self setusepriority(0);
    }
    if (isdefined(duration)) {
        self setuseholdduration(duration);
    } else {
        self setuseholdduration("duration_short");
    }
    if (isdefined(onobstruction)) {
        self sethintonobstruction(onobstruction);
    } else {
        self sethintonobstruction("hide");
    }
    if (isdefined(hintdist)) {
        self sethintdisplayrange(hintdist);
    } else {
        self sethintdisplayrange(200);
    }
    if (isdefined(hintfov)) {
        self sethintdisplayfov(hintfov);
    } else {
        self sethintdisplayfov(160);
    }
    if (isdefined(usedist)) {
        self setuserange(usedist);
    } else {
        self setuserange(50);
    }
    if (isdefined(usefov)) {
        self setusefov(usefov);
    } else {
        self setusefov(120);
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10122
// Size: 0xef
function createobjidobject(position, ownerteam, offset, var_3c2389ba69e5822b, visibleteam, showoncompass, iconsize) {
    object = spawnstruct();
    object.type = "useObject";
    object.curorigin = position;
    object.ownerteam = ownerteam;
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    object.offset3d = offset;
    object requestid(1, 1, var_3c2389ba69e5822b, showoncompass, undefined, iconsize);
    object.compassicons = [];
    object.interactteam = "none";
    if (isdefined(visibleteam)) {
        object.visibleteam = visibleteam;
    } else {
        object.visibleteam = "none";
    }
    return object;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10219
// Size: 0x27
function isrevivetrigger() {
    if (isdefined(self.id) && self.id == "laststand_reviver") {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10248
// Size: 0x27
function function_89ae7f031dd8bc23() {
    if (isdefined(self.id) && self.id == "plea_for_help_looting") {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10277
// Size: 0x27
function function_ab8d64fe065bf6f7() {
    if (isdefined(self.id) && self.id == "laststand_interrogator") {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102a6
// Size: 0x3a
function function_693c0c5a3d8e214e() {
    if (isdefined(self.id) && (self.id == "elite_arrow_arm" || self.id == "elite_arrow_fuse")) {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102e8
// Size: 0x66
function function_21f4c6f630b17fc4(entity) {
    if (isagent(entity) && isdefined(entity.subclass)) {
        switch (entity.subclass) {
        case #"hash_849c32fe9df2b823":
            return 1;
        default:
            return 0;
            break;
        }
    } else if (entity function_781844c0c05b5ac7()) {
        return 1;
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10356
// Size: 0x28
function function_781844c0c05b5ac7() {
    if (issharedfuncdefined("super_capture_bot", "captureBot_isGrenadeEntity")) {
        return function_f3bb4f4911a1beb2("super_capture_bot", "captureBot_isGrenadeEntity");
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10386
// Size: 0xc0
function function_3f702f8fed26558a(numclaimants, numother, var_773eb33d831d5bb8, var_f3158d80c9ee245c) {
    if (numclaimants > numother && var_773eb33d831d5bb8 > var_f3158d80c9ee245c) {
        return (numclaimants - numother + (var_773eb33d831d5bb8 - var_f3158d80c9ee245c) * self.var_f950eaa859b429c0);
    } else if (numclaimants > numother && var_773eb33d831d5bb8 < var_f3158d80c9ee245c) {
        return (numclaimants - numother + var_773eb33d831d5bb8 - var_f3158d80c9ee245c);
    } else if (numclaimants < numother && var_773eb33d831d5bb8 > var_f3158d80c9ee245c) {
        return ((numclaimants - numother + var_773eb33d831d5bb8 - var_f3158d80c9ee245c) * self.var_f950eaa859b429c0);
    }
    if (numclaimants == numother && var_773eb33d831d5bb8 > var_f3158d80c9ee245c) {
        return ((var_773eb33d831d5bb8 - var_f3158d80c9ee245c) * self.var_f950eaa859b429c0);
    }
    if (numclaimants > numother && var_773eb33d831d5bb8 == var_f3158d80c9ee245c) {
        return (numclaimants - numother);
    } else if (numclaimants < numother && var_773eb33d831d5bb8 < var_f3158d80c9ee245c) {
        return 0;
    } else {
        return 0;
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1044d
// Size: 0xb5
function function_d36dcacac1708708(timer) {
    level endon("game_ended");
    updaterate = level.framedurationseconds;
    var_a1dfe9d4920a43fa = updaterate * 1000;
    var_acfa0707dd372692 = timer * 1000;
    var_d3d9f3ad00693948 = var_acfa0707dd372692 - var_a1dfe9d4920a43fa;
    endtime = gettime() + var_acfa0707dd372692;
    while (gettime() < endtime) {
        var_6403fb28fbb44896 = var_d3d9f3ad00693948 / var_acfa0707dd372692;
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 1, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, var_6403fb28fbb44896);
        var_d3d9f3ad00693948 = max(var_d3d9f3ad00693948 - var_a1dfe9d4920a43fa, 1);
        waitframe();
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10509
// Size: 0x31e
function function_babd6a87808a6651(var_d665271789f9526d, allowedintrigger) {
    if (!isdefined(var_d665271789f9526d)) {
        return 1;
    }
    if (getdvarint(@"hash_74e15cd785909df1", 1) == 1) {
        ignoreents = [];
        ignoreents[ignoreents.size] = var_d665271789f9526d;
        contents = create_contents(0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
        trace = ray_trace(var_d665271789f9526d.origin + (0, 0, 20), var_d665271789f9526d.origin - (0, 0, 20), ignoreents, contents, 1);
        if (function_6c71c72547bb931(trace["position"]) && getgametype() != "bigctf") {
            return 1;
        }
        if (isdefined(trace["surfaceflags"])) {
            surfacetype = namespace_2a184fc4902783dc::convert_surface_flag(trace);
            switch (trace["surfacetype"]) {
            case #"hash_386826e81c2469e":
            case #"hash_7035b789141ab570":
            case #"hash_8a8bd0144f89a1a2":
            case #"hash_94a21aede95bbed1":
            case #"hash_cccdf76df9364805":
                return 1;
                break;
            }
        }
        if (isdefined(level.var_f57a27b32e66a765)) {
            foreach (zone in level.var_f57a27b32e66a765) {
                if (!isdefined(zone.trigger)) {
                    continue;
                }
                if (var_d665271789f9526d istouching(zone.trigger)) {
                    return 1;
                }
            }
        }
    }
    for (index = 0; index < level.radtriggers.size; index++) {
        if (var_d665271789f9526d istouching(level.radtriggers[index])) {
            return 1;
        }
    }
    for (index = 0; index < level.minetriggers.size; index++) {
        if (var_d665271789f9526d istouching(level.minetriggers[index])) {
            return 1;
        }
    }
    for (index = 0; index < level.hurttriggers.size; index++) {
        if (var_d665271789f9526d istouching(level.hurttriggers[index])) {
            return 1;
        }
    }
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (isdefined(trigger.script_noteworthy)) {
                if (trigger.script_noteworthy == "onlyVehOOB") {
                    break;
                }
            }
            if (istrue(allowedintrigger)) {
                break;
            }
            if (var_d665271789f9526d istouching(trigger)) {
                return 1;
            }
            if (ispointinvolume(var_d665271789f9526d.origin + (0, 0, 12), trigger)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1082f
// Size: 0x2e1
function function_c3c18fcce2d382d(point, allowedintrigger) {
    if (!isdefined(point)) {
        return 1;
    }
    if (getdvarint(@"hash_74e15cd785909df1", 1) == 1) {
        contents = create_contents(0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
        trace = ray_trace(point + (0, 0, 20), point - (0, 0, 20), undefined, contents, 1);
        if (function_6c71c72547bb931(trace["position"]) && getgametype() != "bigctf") {
            return 1;
        }
        if (isdefined(trace["surfaceflags"])) {
            surfacetype = namespace_2a184fc4902783dc::convert_surface_flag(trace);
            switch (trace["surfacetype"]) {
            case #"hash_386826e81c2469e":
            case #"hash_7035b789141ab570":
            case #"hash_8a8bd0144f89a1a2":
            case #"hash_94a21aede95bbed1":
            case #"hash_cccdf76df9364805":
                return 1;
                break;
            }
        }
        if (isdefined(level.var_f57a27b32e66a765)) {
            foreach (zone in level.var_f57a27b32e66a765) {
                if (!isdefined(zone.trigger)) {
                    continue;
                }
                if (!ispointinvolume(point, zone.trigger)) {
                    continue;
                }
                return 1;
            }
        }
    }
    for (index = 0; index < level.radtriggers.size; index++) {
        if (!ispointinvolume(point, level.radtriggers[index])) {
            continue;
        }
        return 1;
    }
    for (index = 0; index < level.minetriggers.size; index++) {
        if (!ispointinvolume(point, level.minetriggers[index])) {
            continue;
        }
        return 1;
    }
    for (index = 0; index < level.hurttriggers.size; index++) {
        if (!ispointinvolume(point, level.hurttriggers[index])) {
            continue;
        }
        return 1;
    }
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (istrue(allowedintrigger)) {
                break;
            }
            if (isdefined(trigger.script_noteworthy)) {
                if (trigger.script_noteworthy == "onlyVehOOB") {
                    break;
                }
            }
            if (!ispointinvolume(point, trigger)) {
                continue;
            }
            return 1;
        }
    }
    return 0;
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b18
// Size: 0x30
function function_29c0cf699c075f78() {
    if (getdvarint(@"hash_ab99c7252936d7ed", 0)) {
        return 1;
    }
    gt = getgametype();
    return gt == "ctf";
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b50
// Size: 0x91
function function_f1e265068d2e3fc5(player, claimteam) {
    if (claimteam == "none") {
        return;
    }
    if (level.gametype == "hc_dom") {
        return;
    }
    if (gettime() - player.var_6fbd39a3be3e9cb4 >= 1000) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "updateDamageFeedback")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "updateDamageFeedback") ]]("capturebotcapture", undefined, undefined, "capturebotcapture", undefined, 1);
            player.var_6fbd39a3be3e9cb4 = gettime();
        }
    }
}

// Namespace gameobjects/namespace_19b4203b51d56488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10be8
// Size: 0x60
function function_15a05ddc354746a2(player) {
    if (!isplayer(player)) {
        if (isdefined(player.owner)) {
            if (function_21f4c6f630b17fc4(player) && isplayer(player.owner)) {
                player = player.owner;
                return player;
            } else {
                return player;
            }
        } else {
            return player;
        }
    } else {
        return player;
    }
}

