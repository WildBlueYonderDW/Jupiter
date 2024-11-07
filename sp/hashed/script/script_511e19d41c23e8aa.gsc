#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_ammo_crate.gsc;
#using scripts\cp\cp_grenade_crate.gsc;
#using script_34d70a7ab78b1421;
#using script_65ec25da122efe3c;
#using scripts\cp\cp_adrenaline_crate.gsc;
#using script_71332a5b74214116;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp\cp_hud_message.gsc;
#using scripts\cp\cp_weapons.gsc;
#using scripts\cp\cp_hostmigration.gsc;
#using script_3bcaa2cbaf54abdd;
#using scripts\cp\cp_outline_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_511e19d41c23e8aa;
#using scripts\cp\cp_player_battlechatter.gsc;
#using script_41ae4f5ca24216cb;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace deployablebox;

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x533
// Size: 0x54
function init() {
    level.deployable_box_interaction = &init_box_interaction;
    if (!isdefined(level.boxsettings)) {
        level.boxsettings = [];
    }
    level thread scripts\cp\cp_ammo_crate::ammo_crate_init();
    level thread scripts\cp\cp_grenade_crate::grenade_crate_init();
    level thread namespace_e6634524c3d3cf37::armor_crate_init();
    level thread namespace_7d545c9bc610b1ea::function_6444dd7186b01cfc();
    level thread scripts\cp\cp_adrenaline_crate::adrenaline_crate_init();
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58f
// Size: 0x21
function init_box_interaction() {
    namespace_a3902e911697e714::register_interaction("deployable_box", "null", undefined, &box_hint_func, &box_activate_func, 0, 0, undefined);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b8
// Size: 0x48
function box_hint_func(var_df071553d0996ff9, player) {
    var_86280fefb94b6b28 = level.boxsettings[var_df071553d0996ff9.box.boxtype];
    return var_86280fefb94b6b28.hintstring;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x609
// Size: 0x26
function box_activate_func(var_df071553d0996ff9, player) {
    var_df071553d0996ff9.box notify("captured", player);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x637
// Size: 0xa6
function box_createinteraction(box) {
    self.playersused = [];
    self.usedcount = 0;
    self makeusable();
    self setusepriority(1);
    self enablemissilehint(1);
    self setcursorhint("HINT_BUTTON");
    self sethintstring(level.boxsettings[box.boxtype].hintstring);
    self setuserange(90);
    self setusefov(70);
    self setuseholdduration("duration_short");
    self sethintrequiresholding(0);
    self sethinttag("tag_use");
    thread function_38dad4e3a40930f8(box);
    return box;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e6
// Size: 0x46
function function_38dad4e3a40930f8(box) {
    level endon("game_ended");
    self endon("death");
    while (isdefined(self)) {
        self waittill("trigger", triggerer);
        if (isplayer(triggerer)) {
            box notify("captured", triggerer);
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x734
// Size: 0x4d
function begindeployableviamarker(lifeid, boxtype, projectileentity, weaponname, damagefuncoverride, deathfuncoverride, var_2deffe8b3af50b42) {
    thread watchdeployablemarkerplacement(boxtype, lifeid, projectileentity, weaponname, damagefuncoverride, deathfuncoverride, var_2deffe8b3af50b42);
    return true;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x78a
// Size: 0x1a1
function watchdeployablemarkerplacement(boxtype, lifeid, marker, weaponname, damageFunc, deathfunc, timeoutfunc) {
    self endon("spawned_player");
    self endon("disconnect");
    if (!isdefined(marker)) {
        assertmsg("watchDeployableMarkerPlacement(): No marker entity passed in. The calling script probably needs to be updated.");
        return;
    }
    if (!isdefined(weaponname)) {
        assertmsg("watchDeployableMarkerPlacement(): No weaponName passed in. The calling script probably needs to be updated.");
        return;
    }
    marker makecollidewithitemclip(1);
    self notify("deployable_deployed");
    splashref = "cp_used_" + boxtype;
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo(splashref, self);
    scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(streakinfo);
    foreach (player in level.players) {
        player thread scripts\cp\cp_hud_message::showsplash(splashref, undefined, self);
    }
    marker.owner = self;
    marker.weaponname = weaponname;
    self.marker = marker;
    weapontoswitch = getweapontoswitchbackto();
    success = thread scripts\cp\cp_weapons::switchtoweaponreliable(weapontoswitch, 0);
    self.last_weapon = undefined;
    if (isgrenadedeployable(boxtype)) {
        self thread [[ level.boxsettings[boxtype].grenadeusefunc ]](marker);
        return;
    }
    marker thread markeractivate(lifeid, boxtype, &box_setactive, damageFunc, deathfunc, timeoutfunc);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x933
// Size: 0x13
function override_box_moving_platform_death(data) {
    self notify("death");
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94e
// Size: 0x2b
function marker_watchdisownedtimeout() {
    self endon("death");
    marker_watchdisownedtimeoutinternal();
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread supportbox_destroy();
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x981
// Size: 0x3f
function marker_watchdisownedtimeoutinternal() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause(5);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c8
// Size: 0xa1
function function_5d89ff9fc37be576() {
    playercount = level.players.size;
    var_fceb11555acde199 = 0;
    foreach (player in level.players) {
        if (!isdefined(player.var_ac19f9b9c6c841b9)) {
            continue;
        }
        if (istrue(player.var_ac19f9b9c6c841b9 == "chopper")) {
            var_fceb11555acde199 = 1;
        }
    }
    if (istrue(var_fceb11555acde199)) {
        playercount = 1;
    }
    return playercount;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa72
// Size: 0x2ea
function markeractivate(lifeid, boxtype, usedcallback, damagecallback, deathcallback, timeoutcallback) {
    self notify("markerActivate");
    self endon("markerActivate");
    result = waittill_any_return_3("missile_stuck", "explode", "death");
    owner = self.owner;
    position = self.origin;
    if (getdvarint(@"hash_952c135e1269d137", 0) == 0) {
        level.boxsettings[boxtype].maxuses = function_5d89ff9fc37be576();
    } else {
        level.boxsettings[boxtype].maxuses = 999;
    }
    var_86280fefb94b6b28 = level.boxsettings[boxtype];
    box = undefined;
    if (result == "explode") {
        box = createboxforplayer(boxtype, drop_to_ground(position, 1000), owner);
    } else if (result == "death") {
        box = createboxforplayer(boxtype, drop_to_ground(position, 1000), owner);
    } else {
        box = self;
    }
    box setscriptablepartstate("effects", "plant", 0);
    box setscriptablepartstate("anims", "closedIdle", 0);
    box setscriptablepartstate("beacon", "active", 0);
    box.health = 999999;
    box.maxhealth = var_86280fefb94b6b28.maxhealth;
    box.angles = self.angles;
    box.boxtype = boxtype;
    box.owner = owner;
    box.team = owner.team;
    box.id = var_86280fefb94b6b28.id;
    if (isdefined(var_86280fefb94b6b28.dpadname)) {
        box.dpadname = var_86280fefb94b6b28.dpadname;
    }
    if (isdefined(var_86280fefb94b6b28.maxuses)) {
        box.usesremaining = var_86280fefb94b6b28.maxuses;
    }
    box.owner.supportbox = box;
    box thread box_handleownerdisconnect();
    box addboxtoownerarray(box.owner);
    box supportbox_addowneroutline();
    box [[ usedcallback ]](box, damagecallback, deathcallback, timeoutcallback);
    if (isdefined(level.crafting_table_data) && isdefined(level.crafting_table_data[boxtype])) {
        var_de062dae32f4b236 = level.crafting_table_data[boxtype].metal;
        var_c317862b1cc1d7df = 0;
        if (owner namespace_6c67e93a4c487d83::try_take_player_currency(var_de062dae32f4b236)) {
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd64
// Size: 0x30
function supportbox_destroy() {
    self setscriptablepartstate("effects", "destroy", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    thread supportbox_delete(3);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9c
// Size: 0x34
function supportbox_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    self.isdestroyed = 1;
    self setcandamage(0);
    supportbox_removeobjectiveicon();
    supportbox_removeowneroutline();
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd8
// Size: 0x37
function supportbox_addowneroutline() {
    if (true) {
        if (isdefined(self.owner)) {
            self.outlineid = scripts\cp\cp_outline_utility::outlineenableforplayer(self, self.owner, "outline_depth_white", "killstreak_personal");
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe17
// Size: 0x20
function supportbox_removeowneroutline() {
    if (isdefined(self.outlineid)) {
        scripts\cp\cp_outline_utility::outlinedisable(self.outlineid, self);
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3f
// Size: 0x7c
function supportbox_addobjectiveicon() {
    objectiveiconid = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    if (objectiveiconid == -1) {
        return;
    }
    scripts\mp\objidpoolmanager::objective_add_objective(objectiveiconid, "invisible", (0, 0, 0));
    scripts\mp\objidpoolmanager::update_objective_onentity(objectiveiconid, self);
    scripts\mp\objidpoolmanager::update_objective_state(objectiveiconid, "active");
    scripts\mp\objidpoolmanager::update_objective_icon(objectiveiconid, level.boxsettings[self.boxtype].shadername);
    scripts\mp\objidpoolmanager::update_objective_setbackground(objectiveiconid, 1);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec3
// Size: 0x1f
function supportbox_removeobjectiveicon() {
    if (isdefined(self.objectiveiconid)) {
        scripts\mp\objidpoolmanager::returnobjectiveid(self.objectiveiconid);
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeea
// Size: 0xfd
function createboxforplayer(boxtype, position, owner) {
    assertex(isdefined(owner), "createBoxForPlayer() called without owner specified");
    var_86280fefb94b6b28 = level.boxsettings[boxtype];
    box = spawn("script_model", position - (0, 0, 1));
    box setmodel(var_86280fefb94b6b28.modelbase);
    box.health = 999999;
    box.maxhealth = var_86280fefb94b6b28.maxhealth;
    box.angles = self.angles;
    box.boxtype = boxtype;
    box.owner = owner;
    box.team = owner.team;
    box.id = var_86280fefb94b6b28.id;
    return box;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xff0
// Size: 0xee
function throwcrate(var_b7cff5fef8fb1dee) {
    self endon("disconnect");
    val::set("throw_crate", "equipment_primary", 0);
    val::set("throw_crate", "equipment_secondary", 0);
    /#
        self iprintln("<dev string:x1c>");
    #/
    while (self isgestureplaying("ges_plyr_gesture005")) {
        waitframe();
    }
    cratename = "";
    switch (var_b7cff5fef8fb1dee.weapon_name) {
    case #"hash_53b56552dcba7edd":
    case #"hash_b4a17c60413030e7":
        cratename = "munitions_crate";
        break;
    case #"hash_da7316c483b6c780":
    case #"hash_f2e793d6a4fe013e":
        cratename = "armor";
        break;
    }
    namespace_f5646b93b4a7b6d4::begindeployableviamarker(undefined, cratename, var_b7cff5fef8fb1dee, var_b7cff5fef8fb1dee.weapon_name);
    /#
        self iprintln("<dev string:x35>");
    #/
    val::reset_all("throw_crate");
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10e6
// Size: 0x15a
function box_setactive(box, damagecallback, deathcallback, timeoutcallback) {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    self.inuse = 0;
    if (isdefined(self.owner)) {
        self.owner notify("munitions_used", box.boxtype);
        self.owner thread scripts\cp\cp_player_battlechatter::onmunitionboxused(self.boxtype);
    }
    if (isdefined(var_86280fefb94b6b28.deployfunc)) {
        self.owner thread [[ var_86280fefb94b6b28.deployfunc ]]();
    }
    if (!isdefined(var_86280fefb94b6b28.canusecallback) || self.owner [[ var_86280fefb94b6b28.canusecallback ]](self)) {
        box_seticon(self.owner, var_86280fefb94b6b28.streakname, var_86280fefb94b6b28.headiconoffset);
    }
    box = box_createinteraction(box);
    if (isdefined(damagecallback)) {
        self thread [[ damagecallback ]]();
    } else {
        thread box_handledamage();
    }
    thread box_handledeath();
    if (isdefined(timeoutcallback)) {
        self thread [[ timeoutcallback ]]();
    } else {
        thread box_timeout();
    }
    thread box_playerconnected();
    thread box_agentconnected();
    thread boxthink();
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1248
// Size: 0x4c
function _box_setactivehelper(player, bactivate, canusefunc) {
    if (bactivate) {
        if (!isdefined(canusefunc) || player [[ canusefunc ]](self)) {
            box_enableplayeruse(player);
        }
        thread boxthink();
        return;
    }
    box_disableplayeruse(player);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129c
// Size: 0x2d
function box_playerconnected() {
    self endon("death");
    while (true) {
        level waittill("connected", player);
        childthread box_waittill_player_spawn_and_add_box(player);
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d1
// Size: 0x2c
function box_agentconnected() {
    self endon("death");
    while (true) {
        level waittill("spawned_agent_player", agent);
        box_addboxforplayer(agent);
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1305
// Size: 0x30
function box_waittill_player_spawn_and_add_box(player) {
    player waittill("spawned_player");
    if (level.teambased) {
        box_addboxforplayer(player);
        thread box_playerjoinedteam(player);
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133d
// Size: 0x3d
function box_playerjoinedteam(player) {
    self endon("death");
    player endon("disconnect");
    while (true) {
        player waittill("joined_team");
        if (level.teambased) {
            box_addboxforplayer(player);
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1382
// Size: 0x80
function box_addboxforplayer(player) {
    if (self.team == player.team) {
        box_enableplayeruse(player);
        thread boxthink();
        box_seticon(player, level.boxsettings[self.boxtype].streakname, level.boxsettings[self.boxtype].headiconoffset);
        return;
    }
    box_disableplayeruse(player);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x140a
// Size: 0x7e
function box_seticon(player, streakname, voffset) {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    headicon = undefined;
    if (isdefined(var_86280fefb94b6b28.headicon)) {
        headicon = var_86280fefb94b6b28.headicon;
    }
    self.boxiconid = thread scripts\cp\utility::ent_createheadicon(self, voffset, self.team, headicon, 0);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1490
// Size: 0x1d
function box_enableplayeruse(player) {
    self.disabled_use_for[player getentitynumber()] = 0;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b5
// Size: 0x1e
function box_disableplayeruse(player) {
    self.disabled_use_for[player getentitynumber()] = 1;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14db
// Size: 0x2
function box_setinactive() {
    
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e5
// Size: 0x20
function box_handledamage() {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150d
// Size: 0xa4
function box_modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    return modifieddamage;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15ba
// Size: 0x89
function box_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    attacker notify("destroyed_equipment");
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164b
// Size: 0x187
function box_handledeath() {
    self waittill("death");
    if (isdefined(self.interaction)) {
        namespace_a3902e911697e714::remove_from_current_interaction_list(self.interaction);
    }
    foreach (player in level.players) {
        player namespace_a3902e911697e714::refresh_interaction();
    }
    box_setinactive();
    removeboxfromownerarray(self.owner);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.owner)) {
        self.owner.supportbox = undefined;
    }
    if (isdefined(self.boxiconid) && self.boxiconid != -1) {
        thread scripts\cp\utility::ent_deleteheadicon(self, self.boxiconid);
    }
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    if (isdefined(self.var_648a4325c2688078)) {
        self.var_648a4325c2688078 delete();
    }
    forward = anglestoforward(self.angles);
    up = anglestoup(self.angles);
    playfx(var_86280fefb94b6b28.deathvfx, self.origin, forward, up);
    self playsound("mp_equip_destroyed");
    self notify("deleting");
    self delete();
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17da
// Size: 0x41
function box_handleownerdisconnect() {
    self endon("death");
    level endon("game_ended");
    self notify("box_handleOwner");
    self endon("box_handleOwner");
    self.owner waittill_any_2("killstreak_disowned", "disconnect");
    self notify("death");
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1823
// Size: 0x209
function boxthink() {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    while (true) {
        self waittill("captured", capturer);
        if (isplayer(capturer) && capturer.team == self.owner.team) {
            if (isdefined(self.disabled_use_for) && istrue(self.disabled_use_for[capturer getentitynumber()])) {
                capturer thread scripts\cp\utility::hint_prompt("cant_refill_again", 1, 2);
                continue;
            }
            success = 1;
            if (isdefined(var_86280fefb94b6b28.onusecallback)) {
                success = capturer [[ var_86280fefb94b6b28.onusecallback ]](self);
            }
            if (istrue(success)) {
                thread playboxuseanimation();
                capturer scripts\cp\utility::playerplaypickupanim("iw9_ges_pickup");
                if (isdefined(self.owner) && capturer != self.owner) {
                    self.owner thread namespace_6099285b4066f63b::doScoreEvent(#"hash_decd39d6aeca5c6c");
                    if (isdefined(var_86280fefb94b6b28.onusethanksbc)) {
                        level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(capturer, var_86280fefb94b6b28.onusethanksbc);
                    }
                }
                if (isdefined(self.usesremaining)) {
                    self.usesremaining--;
                    if (self.usesremaining == 0) {
                        box_leave();
                        break;
                    }
                }
                if (isdefined(var_86280fefb94b6b28.canuseotherboxes) && var_86280fefb94b6b28.canuseotherboxes) {
                    foreach (box in level.deployable_box[var_86280fefb94b6b28.streakname]) {
                        box box_disableplayeruse(self);
                        box thread doubledip(self);
                    }
                    continue;
                }
                if (istrue(var_86280fefb94b6b28.canreusebox)) {
                }
            }
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a34
// Size: 0x5c
function playboxuseanimation() {
    self endon("death");
    self notify("playerboxUseAnimation");
    self endon("playerboxUseAnimation");
    self setscriptablepartstate("anims", "open", 0);
    wait supportbox_getdeployanimduration();
    self setscriptablepartstate("anims", "close", 0);
    wait supportbox_getcloseanimduration();
    self setscriptablepartstate("anims", "closedIdle", 0);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a98
// Size: 0xf8
function doubledip(player) {
    self endon("death");
    player endon("disconnect");
    player waittill("death");
    if (level.teambased) {
        if (self.team == player.team) {
            box_seticon(player, level.boxsettings[self.boxtype].streakname, level.boxsettings[self.boxtype].headiconoffset);
            box_enableplayeruse(player);
        }
        return;
    }
    if (isdefined(self.owner) && self.owner == player) {
        box_seticon(player, level.boxsettings[self.boxtype].streakname, level.boxsettings[self.boxtype].headiconoffset);
        box_enableplayeruse(player);
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b98
// Size: 0x3c
function boxcapturethink(player) {
    level endon("game_ended");
    while (isdefined(self)) {
        self waittill("trigger", triggerer);
        if (triggerer == player) {
            self notify("captured", triggerer);
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdc
// Size: 0x2d
function isfriendlytobox(box) {
    return level.teambased && self.team == box.team;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c12
// Size: 0x53
function box_timeout() {
    self endon("death");
    level endon("game_ended");
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    lifespan = var_86280fefb94b6b28.lifespan;
    scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause(lifespan);
    box_leave();
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6d
// Size: 0xb
function box_leave() {
    waitframe();
    self notify("death");
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c80
// Size: 0x47
function deleteonownerdeath(owner) {
    wait 0.25;
    self linkto(owner, "tag_origin", (0, 0, 0), (0, 0, 0));
    owner waittill("death");
    box_leave();
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ccf
// Size: 0xe4
function box_modelteamupdater(var_ef682a37eef48976) {
    self endon("death");
    self hide();
    foreach (player in level.players) {
        if (player.team == var_ef682a37eef48976) {
            self showtoplayer(player);
        }
    }
    for (;;) {
        level waittill("joined_team");
        self hide();
        foreach (player in level.players) {
            if (player.team == var_ef682a37eef48976) {
                self showtoplayer(player);
            }
        }
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dbb
// Size: 0x13d
function useholdthink(player, usetime) {
    player val::set("use_hold", "weapon", 0);
    player.boxparams = spawnstruct();
    player.boxparams.curprogress = 0;
    player.boxparams.inuse = 1;
    player.boxparams.userate = 0;
    player.boxparams.id = self.id;
    if (isdefined(usetime)) {
        player.boxparams.usetime = usetime;
    } else {
        player.boxparams.usetime = 3000;
    }
    result = useholdthinkloop(player);
    assert(isdefined(result));
    if (isalive(player)) {
        player val::reset_all("use_hold");
    }
    if (!isdefined(self)) {
        return 0;
    }
    player.boxparams.inuse = 0;
    player.boxparams.curprogress = 0;
    return result;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f01
// Size: 0xba
function useholdthinkloop(player) {
    config = player.boxparams;
    while (player isplayerusingbox(config)) {
        config.curprogress += level.frameduration * config.userate;
        if (isdefined(player.objectivescaler)) {
            config.userate = 1 * player.objectivescaler;
        } else {
            config.userate = 1;
        }
        if (config.curprogress >= config.usetime) {
            return player scripts\cp_mp\utility\player_utility::_isalive();
        }
        waitframe();
    }
    return 0;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc4
// Size: 0x11f
function addboxtoownerarray(owner) {
    if (!isdefined(owner.deployable_box)) {
        owner.deployable_box = [];
    }
    if (!isdefined(owner.deployable_box[self.boxtype])) {
        owner.deployable_box[self.boxtype] = [];
    }
    if (owner.deployable_box[self.boxtype].size >= 2) {
        diff = 1 + owner.deployable_box[self.boxtype].size - 3;
        foreach (box in owner.deployable_box[self.boxtype]) {
            if (diff > 0) {
                box thread supportbox_destroy();
                diff--;
            }
        }
    }
    owner.deployable_box[self.boxtype][self getentitynumber()] = self;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20eb
// Size: 0x2c
function removeboxfromownerarray(owner) {
    if (isdefined(owner)) {
        owner.deployable_box[self.boxtype][self getentitynumber()] = undefined;
    }
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x211f
// Size: 0xab
function addboxtolevelarray() {
    if (isdefined(level.deployable_box[self.boxtype]) && level.deployable_box[self.boxtype].size > 0) {
        foreach (box in level.deployable_box[self.boxtype]) {
            box thread supportbox_destroy();
        }
    }
    level.deployable_box[self.boxtype][self getentitynumber()] = self;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d2
// Size: 0x1c
function removeboxfromlevelarray() {
    level.deployable_box[self.boxtype][self getentitynumber()] = undefined;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21f6
// Size: 0x7a
function isplayerusingbox(box) {
    return !level.gameended && isdefined(box) && scripts\cp_mp\utility\player_utility::_isalive() && self usebuttonpressed() && !self isonladder() && !self meleebuttonpressed() && box.curprogress < box.usetime && (!isdefined(self.teleporting) || !self.teleporting);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2279
// Size: 0x1b
function isgrenadedeployable(boxtype) {
    isgrenade = 0;
    isgrenade = 0;
    return isgrenade;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x229d
// Size: 0x81
function supportbox_ondeploy(var_86280fefb94b6b28) {
    parent = self getlinkedparent();
    self unlink();
    self.angles = combineangles(self.angles, (0, 90, 0));
    self.origin += anglestoup(self.angles) * 3;
    if (isdefined(parent)) {
        self linkto(parent);
    }
    thread supportbox_ondeployinternal(var_86280fefb94b6b28);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2326
// Size: 0x42
function supportbox_ondeployinternal(var_86280fefb94b6b28) {
    self endon("death");
    self setscriptablepartstate("anims", "open", 0);
    self setscriptablepartstate("effects", "plant", 0);
    wait var_86280fefb94b6b28.deployanimduration;
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2370
// Size: 0x10
function supportbox_getdeployanimduration() {
    return getanimlength(scriptables%wm_supportbox_ground_open);
}

// Namespace deployablebox / namespace_f5646b93b4a7b6d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2389
// Size: 0x10
function supportbox_getcloseanimduration() {
    return getanimlength(scriptables%wm_supportbox_ground_close);
}

