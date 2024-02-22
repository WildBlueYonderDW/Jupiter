// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_2669878cf5a1b6bc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\killstreaks\deployablebox.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\shellshock.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_435ab5ba1573551b;

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426
// Size: 0x1a
function init() {
    if (!isdefined(level.boxsettings)) {
        level.boxsettings = [];
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x61
function begindeployableviamarker(streakinfo, lifeid, boxtype, var_dfdbf43603e7958d, weaponname, var_d6421c0cade6ba92, var_79da2138decde7fb, var_2deffe8b3af50b42) {
    thread namespace_ba66181036094c7e::cleanupdeployablemarkerondisconnect(var_dfdbf43603e7958d);
    thread watchdeployablemarkerplacement(streakinfo, boxtype, lifeid, var_dfdbf43603e7958d, weaponname, var_d6421c0cade6ba92, var_79da2138decde7fb, var_2deffe8b3af50b42);
    return 1;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x11c
function watchdeployablemarkerplacement(streakinfo, boxtype, lifeid, marker, weaponname, damagefunc, deathfunc, var_57e5b541fbb5ecaa) {
    self endon("spawned_player");
    self endon("disconnect");
    if (!isdefined(marker)) {
        /#
            assertmsg("watchDeployableMarkerPlacement(): No marker entity passed in. The calling script probably needs to be updated.");
        #/
        return;
    }
    if (!isdefined(weaponname)) {
        /#
            assertmsg("watchDeployableMarkerPlacement(): No weaponName passed in. The calling script probably needs to be updated.");
        #/
        return;
    }
    if (!isreallyalive(self)) {
        marker delete();
    }
    marker makecollidewithitemclip(1);
    self notify("deployable_deployed");
    marker.owner = self;
    marker.weaponname = weaponname;
    self.marker = marker;
    if (isgrenadedeployable(boxtype)) {
        self thread [[ level.boxsettings[boxtype].grenadeusefunc ]](marker);
        return;
    }
    marker playsoundtoplayer(level.boxsettings[boxtype].deployedsfx, self);
    marker thread markeractivate(streakinfo, lifeid, boxtype, &box_setactive, damagefunc, deathfunc, var_57e5b541fbb5ecaa);
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d3
// Size: 0x3c
function cleanupdeployablemarkerondisconnect(marker) {
    marker endon("death");
    marker endon("late_missile_stuck");
    marker thread namespace_9c840bb9f2ecbf00::notifyafterframeend("missile_stuck", "late_missile_stuck");
    self waittill("disconnect");
    marker delete();
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x616
// Size: 0x1f
function override_box_moving_platform_death(data) {
    self.isdestroyed = 1;
    self notify("death");
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c
// Size: 0x1e6
function markeractivate(streakinfo, lifeid, boxtype, usedcallback, damagecallback, deathcallback, timeoutcallback) {
    self notify("markerActivate");
    self endon("markerActivate");
    self waittill("missile_stuck");
    owner = self.owner;
    position = self.origin;
    if (!isdefined(owner)) {
        return;
    }
    box = createboxforplayer(boxtype, position, owner);
    data = spawnstruct();
    data.linkparent = self getlinkedparent();
    if (isdefined(data.linkparent) && isdefined(data.linkparent.model) && data.linkparent.model != "") {
        box.origin = data.linkparent.origin;
        var_971bf05da97e6db9 = data.linkparent getlinkedparent();
        if (isdefined(var_971bf05da97e6db9)) {
            data.linkparent = var_971bf05da97e6db9;
        } else {
            data.linkparent = undefined;
        }
    }
    data.deathoverridecallback = &override_box_moving_platform_death;
    box thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    box.moving_platform = data.linkparent;
    box setotherent(owner);
    waitframe();
    box thread [[ usedcallback ]](damagecallback, deathcallback, timeoutcallback);
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    self delete();
    if (isdefined(box) && box touchingbadtrigger()) {
        self.isdestroyed = 1;
        box notify("death");
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0x42
function deployableexclusion(parentmodel) {
    if (parentmodel == "mp_satcom") {
        return 1;
    } else if (issubstr(parentmodel, "paris_catacombs_iron")) {
        return 1;
    } else if (issubstr(parentmodel, "mp_warhawk_iron_gate")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x873
// Size: 0x7f
function isholdingdeployablebox() {
    var_4a8f5643e919524 = self getcurrentweapon();
    if (isdefined(var_4a8f5643e919524)) {
        foreach (var_98770f6793c42216 in level.boxsettings) {
            if (getcompleteweaponname(var_4a8f5643e919524) == var_98770f6793c42216.weaponinfo) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fa
// Size: 0x165
function createboxforplayer(boxtype, position, owner) {
    /#
        assertex(isdefined(owner), "createBoxForPlayer() called without owner specified");
    #/
    var_86280fefb94b6b28 = level.boxsettings[boxtype];
    box = spawn("script_model", position - (0, 0, 1));
    box setmodel(var_86280fefb94b6b28.modelbase);
    box.health = 999999;
    box.maxhealth = var_86280fefb94b6b28.maxhealth;
    box.angles = owner.angles;
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
    box box_setinactive();
    box thread box_handleownerdisconnect();
    box addboxtolevelarray();
    return box;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa67
// Size: 0x457
function box_setactive(damagecallback, deathcallback, timeoutcallback) {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    self.inuse = 0;
    curobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (curobjid == -1) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::objective_add_objective(curobjid, "invisible", (0, 0, 0));
    if (!isdefined(self getlinkedparent())) {
        namespace_5a22b6f3a56f7e9b::update_objective_position(curobjid, self.origin);
    } else {
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(curobjid, self);
    }
    namespace_5a22b6f3a56f7e9b::update_objective_state(curobjid, "active");
    namespace_5a22b6f3a56f7e9b::update_objective_icon(curobjid, var_86280fefb94b6b28.shadername);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(curobjid, 1);
    self.objidfriendly = curobjid;
    if (level.teambased) {
        if (curobjid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_teammask_single(curobjid, self.team);
        }
        box_seticon(self.team, var_86280fefb94b6b28.streakname, var_86280fefb94b6b28.headiconoffset);
        foreach (player in level.players) {
            if (self.team != player.team) {
                continue;
            }
            if (isdefined(var_86280fefb94b6b28.canusecallback) && !player [[ var_86280fefb94b6b28.canusecallback ]](self)) {
                if (isdefined(self.boxiconid)) {
                    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.boxiconid, player);
                }
            }
        }
    } else {
        if (curobjid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_single(curobjid, self.owner);
        }
        if (!isdefined(var_86280fefb94b6b28.canusecallback) || self.owner [[ var_86280fefb94b6b28.canusecallback ]](self)) {
            box_seticon(self.owner, var_86280fefb94b6b28.streakname, var_86280fefb94b6b28.headiconoffset);
        }
    }
    self makeusable();
    self setcursorhint("HINT_NOICON");
    self sethintstring(var_86280fefb94b6b28.hintstring);
    self setusehideprogressbar(1);
    self.isusable = 1;
    self setcandamage(1);
    if (isdefined(damagecallback)) {
        self thread [[ damagecallback ]]();
    } else {
        thread box_handledamage();
    }
    if (isdefined(deathcallback)) {
        self thread [[ deathcallback ]]();
    } else {
        thread box_handledeath();
    }
    if (isdefined(timeoutcallback)) {
        self thread [[ timeoutcallback ]]();
    } else {
        thread box_timeout();
    }
    namespace_6d9917c3dc05dbe9::registersentient("Tactical_Ground", self.owner);
    if (isdefined(self.owner)) {
        self.owner notify("new_deployable_box", self);
    }
    if (level.teambased) {
        foreach (player in level.participants) {
            if (istrue(var_86280fefb94b6b28.isteamless)) {
                _box_setactivehelper(player, 1, var_86280fefb94b6b28.canusecallback);
            } else {
                _box_setactivehelper(player, self.team == player.team, var_86280fefb94b6b28.canusecallback);
            }
            if (!isai(player)) {
                thread box_playerjoinedteam(player);
            }
        }
    } else {
        foreach (player in level.participants) {
            _box_setactivehelper(player, isdefined(self.owner) && self.owner == player, var_86280fefb94b6b28.canusecallback);
        }
    }
    thread box_playerconnected();
    thread box_agentconnected();
    if (isdefined(var_86280fefb94b6b28.ondeploycallback)) {
        self [[ var_86280fefb94b6b28.ondeploycallback ]](var_86280fefb94b6b28);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0x5f
function _box_setactivehelper(player, var_9b99022817cb2694, var_86af96fe008c96ee) {
    if (var_9b99022817cb2694) {
        if (!isdefined(var_86af96fe008c96ee) || player [[ var_86af96fe008c96ee ]](self)) {
            box_enableplayeruse(player);
        } else {
            box_disableplayeruse(player);
            thread doubledip(player);
        }
        thread boxthink(player);
    } else {
        box_disableplayeruse(player);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b
// Size: 0x2e
function box_playerconnected() {
    self endon("death");
    while (1) {
        player = level waittill("connected");
        childthread box_waittill_player_spawn_and_add_box(player);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf60
// Size: 0x2d
function box_agentconnected() {
    self endon("death");
    while (1) {
        agent = level waittill("spawned_agent_player");
        box_addboxforplayer(agent);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf94
// Size: 0x31
function box_waittill_player_spawn_and_add_box(player) {
    player waittill("spawned_player");
    if (level.teambased) {
        box_addboxforplayer(player);
        thread box_playerjoinedteam(player);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcc
// Size: 0x3e
function box_playerjoinedteam(player) {
    self endon("death");
    player endon("disconnect");
    while (1) {
        player waittill("joined_team");
        if (level.teambased) {
            box_addboxforplayer(player);
        }
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1011
// Size: 0x80
function box_addboxforplayer(player) {
    if (self.team == player.team || istrue(level.boxsettings[self.boxtype].isteamless)) {
        box_enableplayeruse(player);
        thread boxthink(player);
    } else {
        box_disableplayeruse(player);
        if (isdefined(self.boxiconid)) {
            namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.boxiconid, player);
        }
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1098
// Size: 0x86
function box_seticon(player, streakname, var_86c0dc18ea9cd66a) {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    headicon = getkillstreakoverheadicon(streakname);
    if (isdefined(var_86280fefb94b6b28.headicon)) {
        headicon = var_86280fefb94b6b28.headicon;
    }
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        self.boxiconid = thread namespace_7bdde15c3500a23f::setheadicon_singleimage(player, headicon, var_86c0dc18ea9cd66a, 1);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1125
// Size: 0x2f
function box_enableplayeruse(player) {
    if (isplayer(player)) {
        self enableplayeruse(player);
    }
    self.disabled_use_for[player getentitynumber()] = 0;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115b
// Size: 0x30
function box_disableplayeruse(player) {
    if (isplayer(player)) {
        self disableplayeruse(player);
    }
    self.disabled_use_for[player getentitynumber()] = 1;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1192
// Size: 0x31
function box_setinactive() {
    self makeunusable();
    self.isusable = 0;
    if (isdefined(self.objidfriendly)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objidfriendly);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ca
// Size: 0x4a
function box_handledamage() {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    namespace_3e725f3cc58bddd3::monitordamage(var_86280fefb94b6b28.maxhealth, var_86280fefb94b6b28.damagefeedback, &box_handledeathdamage, &box_modifydamage, 1);
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121b
// Size: 0xe1
function box_modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    if (var_86280fefb94b6b28.allowmeleedamage) {
        modifieddamage = utility::handlemeleedamage(objweapon, type, modifieddamage);
    }
    modifieddamage = namespace_3e725f3cc58bddd3::handlemissiledamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handlegrenadedamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, type, modifieddamage, attacker);
    return modifieddamage;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1304
// Size: 0xc9
function box_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    self.destroyedbydamage = 1;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    var_3737240cefe2c793 = namespace_3e725f3cc58bddd3::onkillstreakkilled("deployable_ammo", attacker, objweapon, type, damage, var_86280fefb94b6b28.scorepopup, var_86280fefb94b6b28.vodestroyed);
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d4
// Size: 0x156
function box_handledeath() {
    self waittill("death");
    if (!isdefined(self)) {
        return;
    }
    box_setinactive();
    removeboxfromlevelarray();
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    if (!istrue(self.destroyedbydamage)) {
        playfx(var_86280fefb94b6b28.deathvfx, self.origin);
        self playsound("mp_killstreak_disappear");
    } else {
        var_3315665a78e3f5c3 = self.origin + (0, 0, var_86280fefb94b6b28.headiconoffset);
        if (isdefined(var_86280fefb94b6b28.deathdamagemax)) {
            owner = undefined;
            if (isdefined(self.owner)) {
                owner = self.owner;
            }
            if (isdefined(var_86280fefb94b6b28.explodevfx)) {
                playfx(var_86280fefb94b6b28.explodevfx, self.origin);
                self playsound("c4_expl_trans");
            }
            radiusdamage(var_3315665a78e3f5c3, var_86280fefb94b6b28.deathdamageradius, var_86280fefb94b6b28.deathdamagemax, var_86280fefb94b6b28.deathdamagemin, owner, "MOD_EXPLOSIVE", "support_box_mp");
            thread namespace_6de0840c25c8dc22::grenade_earthquakeatposition(self.origin, 1);
        }
    }
    self notify("deleting");
    self delete();
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1531
// Size: 0x47
function box_handleownerdisconnect() {
    self endon("death");
    level endon("game_ended");
    self notify("box_handleOwner");
    self endon("box_handleOwner");
    childthread box_watchownerstatus("disconnect");
    childthread box_watchownerstatus("joined_team");
    childthread box_watchownerstatus("joined_spectators");
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157f
// Size: 0x2b
function box_watchownerstatus(var_70687e0cc558a009) {
    self.owner waittill(var_70687e0cc558a009);
    self.isdestroyed = 1;
    self notify("death");
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b1
// Size: 0x232
function boxthink(player) {
    self endon("death");
    thread boxcapturethink(player);
    if (!isdefined(player.boxes)) {
        player.boxes = [];
    }
    player.boxes[player.boxes.size] = self;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    for (;;) {
        capturer = self waittill("captured");
        if (capturer == player) {
            player playlocalsound(var_86280fefb94b6b28.onusesfx);
            if (isdefined(var_86280fefb94b6b28.onusecallback)) {
                player [[ var_86280fefb94b6b28.onusecallback ]](self);
            }
            if (isdefined(self.owner) && player != self.owner && !namespace_f8065cafc523dba5::playersareenemies(self.owner, player)) {
                self.owner thread doscoreevent(#"support", undefined, var_86280fefb94b6b28.usexp);
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
                    box namespace_ba66181036094c7e::box_disableplayeruse(player);
                    if (isdefined(box.boxiconid)) {
                        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(box.boxiconid, player);
                    }
                    box thread doubledip(player);
                }
            } else {
                if (istrue(var_86280fefb94b6b28.canreusebox)) {
                    continue;
                }
                if (isdefined(self.boxiconid)) {
                    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.boxiconid, player);
                }
                box_disableplayeruse(player);
                thread doubledip(player);
            }
        }
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ea
// Size: 0xb1
function doubledip(player) {
    self endon("death");
    player endon("disconnect");
    player waittill("death");
    if (level.teambased) {
        if (self.team == player.team) {
            if (isdefined(self.boxiconid)) {
                namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.boxiconid, player);
            }
            box_enableplayeruse(player);
        }
    } else if (isdefined(self.owner) && self.owner == player) {
        if (isdefined(self.boxiconid)) {
            namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.boxiconid, player);
        }
        box_enableplayeruse(player);
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a2
// Size: 0xba
function boxcapturethink(player) {
    level endon("game_ended");
    while (isdefined(self)) {
        var_b25b5c45202c880c = self waittill("trigger");
        if (isdefined(level.boxsettings[self.boxtype].nousekillstreak) && level.boxsettings[self.boxtype].nousekillstreak && iskillstreakweapon(player getcurrentweapon())) {
            continue;
        }
        if (var_b25b5c45202c880c == player && useholdthink(player, level.boxsettings[self.boxtype].usetime)) {
            self notify("captured", player);
        }
    }
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1963
// Size: 0x2e
function isfriendlytobox(box) {
    return level.teambased && self.team == box.team;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1999
// Size: 0x7f
function box_timeout() {
    self endon("death");
    level endon("game_ended");
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    lifespan = var_86280fefb94b6b28.lifespan;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(lifespan);
    if (isdefined(var_86280fefb94b6b28.vogone)) {
        self.owner thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer(var_86280fefb94b6b28.vogone);
    }
    box_leave();
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1f
// Size: 0x17
function box_leave() {
    waitframe();
    self.isdestroyed = 1;
    self notify("death");
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3d
// Size: 0x48
function deleteonownerdeath(owner) {
    wait(0.25);
    self linkto(owner, "tag_origin", (0, 0, 0), (0, 0, 0));
    owner waittill("death");
    box_leave();
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8c
// Size: 0xed
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

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b80
// Size: 0x14e
function useholdthink(player, usetime) {
    namespace_d7b023c7eb3949d0::script_mover_link_to_use_object(player);
    player val::set("useHold", "weapon", 0);
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
    /#
        assert(isdefined(result));
    #/
    if (isalive(player)) {
        player val::function_c9d0b43701bdba00("useHold");
        namespace_d7b023c7eb3949d0::script_mover_unlink_from_use_object(player);
    }
    if (!isdefined(self)) {
        return 0;
    }
    player.boxparams.inuse = 0;
    player.boxparams.curprogress = 0;
    return result;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd6
// Size: 0xf1
function useholdthinkloop(player) {
    config = player.boxparams;
    while (player isplayerusingbox(config)) {
        if (!player namespace_d7b023c7eb3949d0::script_mover_use_can_link(self)) {
            player namespace_19b4203b51d56488::updateuiprogress(config, 0);
            return 0;
        }
        config.curprogress = config.curprogress + level.frameduration * config.userate;
        if (isdefined(player.objectivescaler)) {
            config.userate = 1 * player.objectivescaler;
        } else {
            config.userate = 1;
        }
        player namespace_19b4203b51d56488::updateuiprogress(config, 1);
        if (config.curprogress >= config.usetime) {
            player namespace_19b4203b51d56488::updateuiprogress(config, 0);
            return isreallyalive(player);
        }
        waitframe();
    }
    player namespace_19b4203b51d56488::updateuiprogress(config, 0);
    return 0;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcf
// Size: 0x1f
function addboxtolevelarray() {
    level.deployable_box[self.boxtype][self getentitynumber()] = self;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df5
// Size: 0x1d
function removeboxfromlevelarray() {
    level.deployable_box[self.boxtype][self getentitynumber()] = undefined;
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e19
// Size: 0x7c
function isplayerusingbox(box) {
    return !level.gameended && isdefined(box) && isreallyalive(self) && self usebuttonpressed() && !self isonladder() && !self meleebuttonpressed() && box.curprogress < box.usetime && (!isdefined(self.teleporting) || !self.teleporting);
}

// Namespace namespace_435ab5ba1573551b/namespace_ba66181036094c7e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9d
// Size: 0x1c
function isgrenadedeployable(boxtype) {
    isgrenade = 0;
    isgrenade = 0;
    return isgrenade;
}

