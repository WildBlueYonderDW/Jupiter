// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\print.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\killstreaks\flares.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace jackal;

// Namespace jackal/namespace_8d413061ce065c0c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7a1
// Size: 0x38b
function beginjackal(lifeid, startpoint, pos, streakinfo, tacopslz) {
    if (!isdefined(level.jackals)) {
        level.jackals = [];
    }
    marker = undefined;
    if (isdefined(tacopslz)) {
        marker = tacopslz.marker;
        var_4f358d69033a2c70 = 2;
        if (!isdefined(marker)) {
            marker = spawnstruct();
            if (isdefined(tacopslz.location)) {
                marker.location = tacopslz.location;
            } else {
                marker.location = tacopslz.trigger.origin;
            }
            marker.angles = (0, 0, 0);
            marker.string = "equip_deploy_succeeded";
            marker.visual = spawn("script_model", marker.location);
            marker.visual setmodel("ks_marker_mp");
            marker.visual setotherent(self);
        }
        if (!isdefined(marker.location)) {
            self notify("cancel_jackal");
            return 0;
        } else if (isdefined(level.jackal_incoming) || level.jackals.size >= var_4f358d69033a2c70) {
            if (isdefined(marker.visual)) {
                marker.visual delete();
            }
            namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
            if (isdefined(streakinfo.objweapon) && streakinfo.objweapon.basename != "none") {
                self notify("killstreak_finished_with_weapon_" + streakinfo.weaponname);
            }
            self notify("cancel_jackal");
            return 0;
        }
    }
    self notify("called_in_jackal");
    level.jackal_incoming = 1;
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    if (isdefined(var_5fa1e1697a302583)) {
        var_1dc672cfe0f0128e = var_5fa1e1697a302583.origin[2] + 500;
    } else {
        var_1dc672cfe0f0128e = 1300;
    }
    if (isdefined(marker) && isdefined(marker.location)) {
        pos = marker.location;
    }
    pos = pos * (1, 1, 0);
    pathgoal = pos + (0, 0, var_1dc672cfe0f0128e);
    jackal = spawnksjackal(lifeid, self, startpoint, pathgoal, streakinfo, tacopslz);
    jackal.tacopslz = tacopslz;
    var_ec558bcb59d5d0b9 = pathgoal;
    var_ec5588cb59d5ca20 = pathgoal + anglestoright(self.angles) * 2000;
    var_ec5589cb59d5cc53 = pathgoal - anglestoright(self.angles) * 2000;
    var_de2dffa9e85bc167 = [0:var_ec558bcb59d5d0b9, 1:var_ec5588cb59d5ca20, 2:var_ec5589cb59d5cc53];
    foreach (goal in var_de2dffa9e85bc167) {
        if (!jackalcanseelocation(jackal, goal)) {
            continue;
        }
        pathgoal = goal;
        break;
    }
    jackal.pathgoal = pathgoal;
    thread defendlocation(jackal, marker);
    return jackal;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb34
// Size: 0x72c
function spawnksjackal(lifeid, owner, pathstart, pathgoal, streakinfo, tacopslz) {
    forward = vectortoangles(pathgoal - pathstart);
    numflares = 4;
    var_f751b396e9b232e6 = 50;
    var_a001268025a19c55 = 175;
    maxhealth = 10000;
    var_1abfbb19b71bccf8 = "veh8_mil_air_lbravo";
    var_44dd671f6e49b125 = "jackal_turret_mp";
    var_c5836308d0a5013a = "veh_mil_air_ca_dropship_mp_turret";
    var_d9f3116109296870 = 1;
    var_b06e96e3d35f4d9e = "jackal_cannon_mp";
    var_c3203d1148c1e58b = "veh_mil_air_ca_dropship_turret_missile";
    var_403a5aabbd2fdab7 = 1;
    currentstring = "KILLSTREAKS_HINTS_JACKAL_GUARD";
    var_9b3f7c7b98c0754 = "follow_player";
    if (isdefined(tacopslz)) {
        var_9b3f7c7b98c0754 = "guard_location";
    }
    jackal = spawnhelicopter(owner, pathstart, forward, "veh_airdrop_mp", var_1abfbb19b71bccf8);
    if (!isdefined(jackal)) {
        return;
    }
    if (isdefined(tacopslz)) {
        jackal.lz = tacopslz;
    }
    jackal thread handledestroydamage();
    jackal.damagecallback = &callback_vehicledamage;
    jackal.speed = var_f751b396e9b232e6;
    jackal.accel = var_a001268025a19c55;
    jackal.health = maxhealth;
    jackal.maxhealth = jackal.health;
    jackal.team = owner.team;
    jackal.owner = owner;
    jackal setcandamage(1);
    jackal.defendloc = pathgoal;
    jackal.lifeid = lifeid;
    jackal.jackal = 1;
    jackal.streakinfo = streakinfo;
    jackal.streakname = streakinfo.streakname;
    jackal.evasivemaneuvers = 0;
    jackal.combatmode = var_9b3f7c7b98c0754;
    jackal.currentstring = currentstring;
    jackal.streakinfo = streakinfo;
    jackal.flaresreservecount = numflares;
    jackal.turreton = var_d9f3116109296870;
    jackal.turretweapon = var_44dd671f6e49b125;
    jackal.cannonweapon = var_b06e96e3d35f4d9e;
    jackal.cannonon = var_403a5aabbd2fdab7;
    jackal addtoactivekillstreaklist(streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100);
    jackal setmaxpitchroll(0, 90);
    jackal vehicle_setspeed(jackal.speed, jackal.accel);
    jackal sethoverparams(50, 100, 50);
    jackal setturningability(0.05);
    jackal setyawspeed(45, 25, 25, 0.5);
    jackal setotherent(owner);
    var_3df8ff290801abe5 = anglestoforward(jackal.angles);
    if (!isdefined(tacopslz)) {
        jackal.turret = spawnturret("misc_turret", jackal gettagorigin("tag_origin"), var_44dd671f6e49b125);
        jackal.turret setmodel(var_c5836308d0a5013a);
        jackal.turret.owner = owner;
        jackal.turret.team = owner.team;
        jackal.turret.angles = jackal.angles;
        jackal.turret.type = "Machine_Gun";
        jackal.turret.streakinfo = streakinfo;
        jackal.turret linkto(jackal, "tag_origin", (200, 0, 55), (0, 0, 0));
        jackal.turret setturretmodechangewait(0);
        jackal.turret setmode("manual_target");
        jackal.turret setsentryowner(owner);
        jackal.cannon = spawnturret("misc_turret", jackal gettagorigin("tag_origin"), var_b06e96e3d35f4d9e);
        jackal.cannon setmodel(var_c3203d1148c1e58b);
        jackal.cannon.owner = owner;
        jackal.cannon.team = owner.team;
        jackal.cannon.angles = jackal.angles;
        jackal.cannon.type = "Cannon";
        jackal.cannon.streakinfo = streakinfo;
        jackal.cannon linkto(jackal, "tag_origin", (-100, 0, 55), (0, 0, 0));
        jackal.cannon setturretmodechangewait(0);
        jackal.cannon setmode("manual_target");
        jackal.cannon setsentryowner(owner);
    }
    jackal.useobj = spawn("script_model", jackal gettagorigin("tag_origin"));
    jackal.useobj linkto(jackal, "tag_origin");
    level.jackals[level.jackals.size] = jackal;
    level.jackals = array_removeundefined(level.jackals);
    level.jackal_incoming = undefined;
    if (isdefined(tacopslz)) {
        jackal thread namespace_dc0d47ddf0ead8a3::flares_handleincomingstinger(undefined, undefined);
    }
    jackal thread jackaldestroyed();
    jackal thread delayjackalloopsfx(0.05, "dropship_enemy_hover_world_grnd");
    jackal thread delay_jackal_arrive_sfx();
    if (!isdefined(tacopslz)) {
        jackal.turret.vehicle_fired_from = jackal;
        jackal.cannon.vehicle_fired_from = jackal;
        jackal.turret.vehicle_fired_from.killcament = spawn("script_model", jackal gettagorigin("tag_origin"));
        jackal.turret.vehicle_fired_from.killcament linkto(jackal, "tag_origin");
        jackal.cannon.vehicle_fired_from.killcament = jackal.turret.vehicle_fired_from.killcament;
    }
    planedir = anglestoforward(jackal.angles);
    return jackal;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1268
// Size: 0xf0
function getnumownedjackals(owner) {
    counter = 0;
    if (level.teambased) {
        foreach (jackal in level.jackals) {
            if (jackal.team != owner.team) {
                continue;
            }
            counter++;
        }
    } else {
        foreach (jackal in level.jackals) {
            if (jackal.owner != owner) {
                continue;
            }
            counter++;
        }
    }
    return counter;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1360
// Size: 0x13
function delay_jackal_arrive_sfx() {
    self endon("death");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(6);
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0x2b
function delayjackalloopsfx(delaytime, alias) {
    self endon("death");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(delaytime);
    self playloopsound(alias);
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ac
// Size: 0x248
function defendlocation(jackal, marker) {
    jackal endon("death");
    /#
        assert(isdefined(jackal));
    #/
    jackal setvehgoalpos(jackal.pathgoal, 1);
    jackal thread closetogoalcheck(jackal.pathgoal);
    jackal thread monitorowner();
    if (isdefined(jackal.dropcrates)) {
        jackal thread watchdropcratesearly(marker);
    }
    jackal waittill("goal");
    if (isdefined(marker) && isdefined(jackal.lz)) {
        jackal thread jackaltimer();
        jackal thread watchgameendleave();
        jackal thread engageprimarytarget();
        jackal.speed = 250;
        jackal vehicle_setspeed(50, 15);
        jackal jackalmovetolocation(marker.location);
        jackal waittill("extract_hostages");
        jackal thread jackalleave(50, 15);
    } else if (isdefined(marker) && isdefined(jackal.dropcrates)) {
        jackal thread jackaltimer();
        jackal thread watchgameendleave();
        jackal thread engageprimarytarget();
        jackal thread engagesecondarytarget();
        jackal vehicle_setspeed(50, 15);
        jackal jackalmovetolocation(marker.location);
        jackal thread dropcrates(jackal.dropcrates, marker);
        jackal thread watchjackalcratepickup();
        jackal waittill_any_timeout_1(10, "all_crates_gone");
        jackal.combatmode = "follow_player";
    } else {
        jackal thread jackaltimer();
        jackal thread watchgameendleave();
        jackal thread engageprimarytarget();
        jackal thread engagesecondarytarget();
        jackal vehicle_setspeed(int(jackal.speed / 14), int(jackal.accel / 16));
    }
    if (!isdefined(jackal.lz)) {
        jackal.useobj setkillstreakcontrolpriority(jackal.owner, jackal.currentstring, 360, 360, 30000, 30000, 2);
        jackal thread patrolfield();
        jackal thread watchmodechange(getothermode(jackal.combatmode), jackal.currentstring);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fb
// Size: 0xa6
function engageprimarytarget() {
    self notify("engagePrimary");
    self endon("engagePrimary");
    self endon("leaving");
    self endon("death");
    self.lastaction = undefined;
    if (istrue(self.turreton)) {
        while (1) {
            targets = jackalgettargets();
            if (isdefined(targets) && targets.size > 0) {
                acquireturrettarget(targets);
                self.turret waittill("stop_firing");
                if (self.combatmode == "follow_player") {
                    thread patrolfield();
                }
            } else {
                self.lastaction = "noTargetsFound";
            }
            wait(0.05);
        }
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a8
// Size: 0x82
function engagesecondarytarget() {
    self notify("engageSecondary");
    self endon("engageSecondary");
    self endon("leaving");
    self endon("death");
    firedelay = weaponfiretime(self.cannonweapon);
    if (istrue(self.cannonon)) {
        while (1) {
            targets = jackalgettargets();
            if (!isdefined(targets) || targets.size < 2) {
                waitframe();
            } else {
                acquirecannontarget(targets);
                namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(firedelay);
            }
        }
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1731
// Size: 0x186
function followplayer() {
    self endon("death");
    self endon("leaving");
    self endon("guard_location");
    self endon("priority_target");
    self endon("jackal_crashing");
    self.owner endon("disconnect");
    self notify("following_player");
    self vehicle_setspeed(50, 15);
    while (1) {
        newpos = undefined;
        if (istrue(self.evasivemaneuvers)) {
            playerx = self.owner.origin[0];
            playery = self.owner.origin[1];
            newx = playerx + randomintrange(-500, 500);
            newy = playery + randomintrange(-500, 500);
            var_7504c8791e34dc73 = getcorrectheight(newx, newy, 350);
            newpos = (newx, newy, var_7504c8791e34dc73);
        } else {
            playerx = self.owner.origin[0];
            playery = self.owner.origin[1];
            var_7504c8791e34dc73 = getcorrectheight(playerx, playery, 20);
            newpos = (playerx, playery, var_7504c8791e34dc73);
        }
        self setlookatent(self.owner);
        self setvehgoalpos(newpos, 1);
        self.lastaction = "following_player";
        waittill_any_2("goal", "begin_evasive_maneuvers");
        self clearlookatent();
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.1);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18be
// Size: 0x1b0
function guardposition(position) {
    self endon("death");
    self endon("leaving");
    self endon("follow_player");
    self endon("jackal_crashing");
    self.owner endon("disconnect");
    self vehicle_setspeed(int(self.speed / 14), int(self.accel / 16));
    newpos = undefined;
    if (isdefined(position)) {
        playerx = position[0];
        playery = position[1];
        var_7504c8791e34dc73 = getcorrectheight(playerx, playery, 20);
        newpos = (playerx, playery, var_7504c8791e34dc73);
    } else if (istrue(self.evasivemaneuvers)) {
        playerx = self.owner.origin[0];
        playery = self.owner.origin[1];
        newx = playerx + randomintrange(-500, 500);
        newy = playery + randomintrange(-500, 500);
        var_7504c8791e34dc73 = getcorrectheight(newx, newy, 350);
        newpos = (newx, newy, var_7504c8791e34dc73);
    } else {
        playerx = self.owner.origin[0];
        playery = self.owner.origin[1];
        var_7504c8791e34dc73 = getcorrectheight(playerx, playery, 20);
        newpos = (playerx, playery, var_7504c8791e34dc73);
    }
    self setlookatent(self.owner);
    self setvehgoalpos(newpos, 1);
    self.lastaction = "following_player";
    waittill_any_2("goal", "begin_evasive_maneuvers");
    self clearlookatent();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a75
// Size: 0x17d
function patrolfield() {
    self endon("death");
    self endon("leaving");
    self endon("guard_location");
    self endon("priority_target");
    self endon("jackal_crashing");
    self.owner endon("disconnect");
    self vehicle_setspeed(int(self.speed / 14), int(self.accel / 16));
    while (1) {
        newpos = undefined;
        if (isdefined(self.patroltarget) && isalive(self.patroltarget) && isplayer(self.patroltarget) && !self.patroltarget _hasperk("specialty_blindeye")) {
            if (!jackalcanseeenemy(self.patroltarget) || distance2dsquared(self.origin, self.patroltarget.origin) > 4194304) {
                jackalmovetoenemy(self.patroltarget);
            }
        } else {
            target = jackalfindclosestenemy();
            if (isdefined(target)) {
                self.patroltarget = target;
                thread watchpatroltarget();
                jackalmovetoenemy(target);
            } else {
                self.patroltarget = undefined;
                location = jackalfindfirstopenpoint();
                if (isdefined(location)) {
                    jackalmovetolocation(location.origin);
                }
            }
        }
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.1);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf9
// Size: 0x157
function jackalfindfirstopenpoint() {
    point = undefined;
    if (isdefined(level.carepackagedropnodes) && level.carepackagedropnodes.size > 0) {
        foreach (loc in level.carepackagedropnodes) {
            if (isdefined(loc.free) && !loc.free) {
                continue;
            }
            if (!jackalcanseelocation(self, loc.origin)) {
                continue;
            }
            loc.free = 0;
            point = loc;
            if (!isdefined(self.initialpatrolpoint)) {
                self.initialpatrolpoint = point;
            }
            break;
        }
        if (!isdefined(point)) {
            if (isdefined(self.initialpatrolpoint)) {
                foreach (loc in level.carepackagedropnodes) {
                    if (loc != self.initialpatrolpoint) {
                        loc.free = undefined;
                    }
                }
                point = self.initialpatrolpoint;
            }
        }
    }
    return point;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d58
// Size: 0x59
function jackalcanseelocation(jackal, loc) {
    var_27b697504d9397d = 0;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1, 0);
    if (namespace_2a184fc4902783dc::ray_trace_passed(jackal.origin, loc, jackal, contents)) {
        var_27b697504d9397d = 1;
    }
    return var_27b697504d9397d;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db9
// Size: 0xa6
function jackalcanseeenemy(target) {
    var_27b697504d9397d = 0;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 0);
    tracepoints = [0:target gettagorigin("j_head"), 1:target gettagorigin("j_mainroot"), 2:target gettagorigin("tag_origin")];
    for (i = 0; i < tracepoints.size; i++) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(self.origin, tracepoints[i], self, contents)) {
            continue;
        }
        var_27b697504d9397d = 1;
        break;
    }
    return var_27b697504d9397d;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e67
// Size: 0x1d7
function jackalmovetoenemy(target) {
    if (isdefined(self.patroltarget)) {
        target = self.patroltarget;
    }
    if (jackalcanseeenemy(target)) {
        self setlookatent(target);
    }
    newpos = undefined;
    if (istrue(self.evasivemaneuvers)) {
        playerx = target.origin[0];
        playery = target.origin[1];
        newx = playerx + randomintrange(-500, 500);
        newy = playery + randomintrange(-500, 500);
        var_7504c8791e34dc73 = getcorrectheight(newx, newy, 350);
        newpos = (newx, newy, var_7504c8791e34dc73);
    } else {
        playerx = target.origin[0];
        playery = target.origin[1];
        var_7504c8791e34dc73 = getcorrectheight(playerx, playery, 20);
        newpos = (playerx, playery, var_7504c8791e34dc73);
    }
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1, 0);
    trace = namespace_2a184fc4902783dc::ray_trace(self.origin, newpos, level.characters, contentoverride);
    if (trace["hittype"] != "hittype_none") {
        newz = getcorrectheight(trace["position"][0], trace["position"][1], 20);
        newpos = (trace["position"][0], trace["position"][1], newz);
    }
    self setvehgoalpos(newpos + (0, 0, 500), 2);
    self.lastaction = "patrol";
    waittill_any_2("goal", "begin_evasive_maneuvers");
    self clearlookatent();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2045
// Size: 0x137
function jackalfindclosestenemy() {
    var_395824552ad4cb06 = [];
    foreach (character in level.players) {
        if (character.ignoreme || isdefined(character.owner) && character.owner.ignoreme) {
            continue;
        }
        if (!isalive(character)) {
            continue;
        }
        if (isdefined(level.teambased) && isdefined(character.team) && self.team == character.team) {
            continue;
        }
        if (character _hasperk("specialty_blindeye")) {
            continue;
        }
        if (character isjackalenemyindoors()) {
            continue;
        }
        var_395824552ad4cb06[var_395824552ad4cb06.size] = character;
        waitframe();
    }
    var_6293b832d8f1fe43 = undefined;
    if (var_395824552ad4cb06.size > 0) {
        var_6293b832d8f1fe43 = sortbydistance(var_395824552ad4cb06, self.origin);
    }
    if (isdefined(var_6293b832d8f1fe43) && var_6293b832d8f1fe43.size > 0) {
        return var_6293b832d8f1fe43[0];
    }
    return undefined;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2184
// Size: 0x59
function isjackalenemyindoors() {
    indoors = 0;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 0);
    if (!namespace_2a184fc4902783dc::ray_trace_passed(self.origin, self.origin + (0, 0, 10000), self, contents)) {
        indoors = 1;
    }
    return indoors;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e5
// Size: 0x52
function watchpatroltarget() {
    self endon("death");
    self endon("leaving");
    self endon("jackal_crashing");
    self.owner endon("disconnect");
    result = self.patroltarget waittill_any_timeout_1(5, "death_or_disconnect");
    self.patroltarget = undefined;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223e
// Size: 0xf2
function jackalmovetolocation(location) {
    newpos = undefined;
    if (istrue(self.evasivemaneuvers)) {
        locationx = location[0];
        locationy = location[1];
        newx = locationx + randomintrange(-500, 500);
        newy = locationy + randomintrange(-500, 500);
        var_7504c8791e34dc73 = getcorrectheight(newx, newy, 350);
        newpos = (newx, newy, var_7504c8791e34dc73);
    } else {
        locationx = location[0];
        locationy = location[1];
        if (!isdefined(self.tacopslz)) {
            var_7504c8791e34dc73 = getcorrectheight(locationx, locationy, 20);
        } else {
            var_7504c8791e34dc73 = 160;
        }
        newpos = (locationx, locationy, var_7504c8791e34dc73);
    }
    self clearlookatent();
    self setvehgoalpos(newpos + (0, 0, 500), 10);
    waittill_any_2("goal", "begin_evasive_maneuvers");
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2337
// Size: 0x18c
function jackalleave(var_cddc894ccdf6de54, var_af4a339e05408e87) {
    self endon("death");
    self setmaxpitchroll(0, 0);
    self notify("leaving");
    self clearlookatent();
    self.turret setsentryowner(undefined);
    if (isdefined(self.turrettarget) && isdefined(self.targetoutline)) {
        outlinedisable(self.targetoutline, self.turrettarget);
    }
    var_f751b396e9b232e6 = int(self.speed / 14);
    var_a001268025a19c55 = int(self.accel / 16);
    if (isdefined(var_cddc894ccdf6de54)) {
        var_f751b396e9b232e6 = var_cddc894ccdf6de54;
    }
    if (isdefined(var_af4a339e05408e87)) {
        var_a001268025a19c55 = var_af4a339e05408e87;
    }
    self vehicle_setspeed(var_f751b396e9b232e6, var_a001268025a19c55);
    pathgoal = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
    pathgoal = pathgoal + (0, 0, 1000);
    self setvehgoalpos(pathgoal, 1);
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self waittill("goal");
    pathend = getpathend();
    self vehicle_setspeed(250, 75);
    self setvehgoalpos(pathend, 1);
    self waittill("goal");
    self stoploopsound();
    level.jackals[level.jackals.size - 1] = undefined;
    self notify("jackal_gone");
    thread jackaldelete();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ca
// Size: 0xcb
function jackaldelete() {
    printgameaction("killstreak ended - jackal", self.owner);
    if (isdefined(self.turret)) {
        self.turret delete();
    }
    if (isdefined(self.cannon)) {
        self.cannon delete();
    }
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    foreach (loc in level.carepackagedropnodes) {
        loc.free = undefined;
    }
    self delete();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259c
// Size: 0x2f
function jackaltimer() {
    self endon("death");
    level endon("game_ended");
    lifetime = 9999;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(lifetime);
    thread jackalleave();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d2
// Size: 0x21
function watchgameendleave() {
    self endon("death");
    self endon("leaving");
    level waittill("game_ended");
    thread jackalleave();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25fa
// Size: 0x96
function randomjackalmovement() {
    self notify("randomJackalMovement");
    self endon("randomJackalMovement");
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    self.lastaction = "randomMovement";
    pos = self.defendloc;
    newpos = getrandompoint(self.origin);
    self setvehgoalpos(newpos, 1);
    thread drawline(self.origin, newpos, 5, (1, 0, 1));
    self waittill("goal");
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2697
// Size: 0x1d5
function getrandompoint(pos) {
    self clearlookatent();
    if (distance2dsquared(self.origin, self.owner.origin) > 4194304) {
        x = self.owner.origin[0];
        y = self.owner.origin[1];
        z = getcorrectheight(x, y, 20);
        centerpoint = (x, y, z);
        self setlookatent(self.owner);
        return centerpoint;
    } else {
        yaw = self.angles[1];
        yawmin = int(yaw - 60);
        yawmax = int(yaw + 60);
        var_dee36ad33d9e9755 = randomintrange(yawmin, yawmax);
        direction = (0, var_dee36ad33d9e9755, 0);
        var_7ebc0c4339bdfd35 = self.origin + anglestoforward(direction) * randomintrange(400, 800);
        var_bf6a113c5a54166f = var_7ebc0c4339bdfd35[0];
        var_bf6a103c5a54143c = var_7ebc0c4339bdfd35[1];
        var_b42e60e1ac25640a = getcorrectheight(var_bf6a113c5a54166f, var_bf6a103c5a54143c, 20);
        point = tracenewpoint(var_bf6a113c5a54166f, var_bf6a103c5a54143c, var_b42e60e1ac25640a);
        if (point != 0) {
            return point;
        }
        var_bf6a113c5a54166f = randomfloatrange(pos[0] - 1200, pos[0] + 1200);
        var_bf6a103c5a54143c = randomfloatrange(pos[1] - 1200, pos[1] + 1200);
        var_1edd9350013a11a0 = (var_bf6a113c5a54166f, var_bf6a103c5a54143c, var_b42e60e1ac25640a);
        return var_1edd9350013a11a0;
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2873
// Size: 0x1d0
function getnewpoint(pos, targ) {
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    if (!isdefined(targ)) {
        return;
    }
    var_8156649a5a358b7c = [];
    foreach (player in level.players) {
        if (player == self) {
            continue;
        }
        if (!level.teambased || player.team != self.team) {
            var_8156649a5a358b7c[var_8156649a5a358b7c.size] = player.origin;
        }
    }
    if (var_8156649a5a358b7c.size > 0) {
        var_d6669bc3a02d67d4 = averagepoint(var_8156649a5a358b7c);
        var_bf6a113c5a54166f = var_d6669bc3a02d67d4[0];
        var_bf6a103c5a54143c = var_d6669bc3a02d67d4[1];
    } else {
        center = level.mapcenter;
        var_8444f490ab96c6d4 = level.mapsize / 4;
        var_bf6a113c5a54166f = randomfloatrange(center[0] - var_8444f490ab96c6d4, center[0] + var_8444f490ab96c6d4);
        var_bf6a103c5a54143c = randomfloatrange(center[1] - var_8444f490ab96c6d4, center[1] + var_8444f490ab96c6d4);
    }
    var_b42e60e1ac25640a = getcorrectheight(var_bf6a113c5a54166f, var_bf6a103c5a54143c, 20);
    point = tracenewpoint(var_bf6a113c5a54166f, var_bf6a103c5a54143c, var_b42e60e1ac25640a);
    if (point != 0) {
        return point;
    }
    var_bf6a113c5a54166f = randomfloatrange(pos[0] - 1200, pos[0] + 1200);
    var_bf6a103c5a54143c = randomfloatrange(pos[1] - 1200, pos[1] + 1200);
    var_b42e60e1ac25640a = getcorrectheight(var_bf6a113c5a54166f, var_bf6a103c5a54143c, 20);
    var_1edd9350013a11a0 = (var_bf6a113c5a54166f, var_bf6a103c5a54143c, var_b42e60e1ac25640a);
    return var_1edd9350013a11a0;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4b
// Size: 0x80
function getpathstart(var_6e7c70b904418daa) {
    pathrandomness = 100;
    halfdistance = 15000;
    yaw = randomfloat(360);
    direction = (0, yaw, 0);
    startpoint = var_6e7c70b904418daa + anglestoforward(direction) * -1 * halfdistance;
    startpoint = startpoint + ((randomfloat(2) - 1) * pathrandomness, (randomfloat(2) - 1) * pathrandomness, 0);
    return startpoint;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad3
// Size: 0x62
function getpathend() {
    pathrandomness = 150;
    halfdistance = 15000;
    yaw = self.angles[1];
    direction = (0, yaw, 0);
    endpoint = self.origin + anglestoforward(direction) * halfdistance;
    return endpoint;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b3d
// Size: 0x195
function fireonturrettarget(playdialog) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    self endon("target_timeout");
    if (istrue(playdialog) && isreallyalive(self.owner) && (!isdefined(self.lastfiretime) || self.lastfiretime + 10000 <= gettime())) {
        self.lastfiretime = gettime();
    }
    outline = outlineenableforplayer(self.turrettarget, self.owner, "outline_depth_orange", "killstreak_personal");
    self.targetoutline = outline;
    timeouttime = 3;
    thread watchforlosttarget(self.turret, self.turrettarget, "target_timeout", timeouttime);
    self.turret waittill("turret_on_target");
    level thread namespace_25c5a6f43bb97b43::saytoself(self.turrettarget, "plr_killstreak_target");
    self.turret notify("start_firing");
    firetime = weaponfiretime(self.turretweapon);
    while (isdefined(self.turrettarget) && isreallyalive(self.turrettarget) && isdefined(self.turret getturrettarget(1)) && self.turret getturrettarget(1) == self.turrettarget) {
        self.turret shootturret();
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(firetime);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd9
// Size: 0x118
function fireoncannontarget(playdialog) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    self endon("target_cannon_timeout");
    timeouttime = 3;
    thread watchforlosttarget(self.cannon, self.cannontarget, "target_cannon_timeout", timeouttime);
    self.cannon waittill("turret_on_target");
    level thread namespace_25c5a6f43bb97b43::saytoself(self.cannontarget, "plr_killstreak_target");
    self.cannon notify("start_firing");
    firetime = weaponfiretime(self.cannonweapon);
    if (isdefined(self.cannontarget) && isreallyalive(self.cannontarget) && isdefined(self.cannon getturrettarget(1)) && self.cannon getturrettarget(1) == self.cannontarget) {
        self.cannon thread watchmissilelaunch();
        self.cannon shootturret();
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df8
// Size: 0x32
function watchmissilelaunch() {
    self endon("death");
    missile = self waittill("missile_fire");
    missile.streakinfo = self.streakinfo;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e31
// Size: 0x7a
function setmissilekillcament() {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    self endon("target_cannon_timeout");
    missile = self.cannon waittill("missile_fire");
    missile.vehicle_fired_from = self;
    missile.vehicle_fired_from.killcament = self.cannon.vehicle_fired_from.killcament;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb2
// Size: 0xb1
function watchforlosttarget(turret, besttarget, var_22019a90f96bd145, cooldowntime) {
    self endon("death");
    self endon("leaving");
    turret endon("stop_firing");
    var_fd5bec4b454541ff = self.targetoutline;
    result = besttarget waittill_any_timeout_1(cooldowntime, "death_or_disconnect");
    if (result == "timeout") {
        self notify(var_22019a90f96bd145);
    }
    if (turret.type == "Machine_Gun") {
        if (isdefined(var_fd5bec4b454541ff) && isdefined(besttarget)) {
            outlinedisable(var_fd5bec4b454541ff, besttarget);
        }
        self clearlookatent();
    }
    turret cleartargetentity();
    turret notify("stop_firing");
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f6a
// Size: 0xc7
function isreadytofire(tolerance) {
    self endon("death");
    self endon("leaving");
    if (!isdefined(tolerance)) {
        tolerance = 10;
    }
    var_6ad4cdf6404eb26f = anglestoforward(self.angles);
    var_6fa7e7954b1f35e7 = self.turrettarget.origin - self.origin;
    var_6ad4cdf6404eb26f = var_6ad4cdf6404eb26f * (1, 1, 0);
    var_6fa7e7954b1f35e7 = var_6fa7e7954b1f35e7 * (1, 1, 0);
    var_6fa7e7954b1f35e7 = vectornormalize(var_6fa7e7954b1f35e7);
    var_6ad4cdf6404eb26f = vectornormalize(var_6ad4cdf6404eb26f);
    var_466e87ce09ca407b = vectordot(var_6fa7e7954b1f35e7, var_6ad4cdf6404eb26f);
    var_5762b77f73eda7c0 = cos(tolerance);
    if (var_466e87ce09ca407b >= var_5762b77f73eda7c0) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3038
// Size: 0xd1
function acquireturrettarget(targets) {
    self endon("death");
    self endon("leaving");
    self notify("priority_target");
    if (isdefined(self.outlinedent) && isdefined(self.turrettarget)) {
        outlinedisable(self.outlinedent, self.turrettarget);
    }
    if (targets.size == 1) {
        self.turrettarget = targets[0];
    } else {
        self.turrettarget = getbesttarget(targets);
    }
    if (isdefined(self.turrettarget)) {
        self clearlookatent();
        self setlookatent(self.turrettarget);
        self.turret settargetentity(self.turrettarget);
        self.lastaction = "attackTarget";
        thread fireonturrettarget(1);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3110
// Size: 0x58
function acquirecannontarget(targets) {
    self endon("death");
    self endon("leaving");
    self.cannontarget = getbesttarget(targets);
    if (isdefined(self.cannontarget)) {
        self.cannon settargetentity(self.cannontarget);
        thread fireoncannontarget(0);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316f
// Size: 0x7e
function jackalgettargets() {
    self endon("death");
    self endon("leaving");
    targets = [];
    players = level.players;
    for (i = 0; i < players.size; i++) {
        potentialtarget = players[i];
        if (istarget(potentialtarget)) {
            if (isdefined(players[i])) {
                targets[targets.size] = players[i];
            }
        } else {
            continue;
        }
        wait(0.05);
    }
    return targets;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f5
// Size: 0x18e
function istarget(potentialtarget) {
    self endon("death");
    if (!isalive(potentialtarget) || potentialtarget.sessionstate != "playing") {
        return 0;
    }
    if (isdefined(self.owner) && potentialtarget == self.owner) {
        return 0;
    }
    if (!isdefined(potentialtarget.pers["team"])) {
        return 0;
    }
    if (level.teambased && potentialtarget.pers["team"] == self.team) {
        return 0;
    }
    if (potentialtarget.pers["team"] == "spectator") {
        return 0;
    }
    if (isdefined(potentialtarget.spawntime) && (gettime() - potentialtarget.spawntime) / 1000 <= 5) {
        return 0;
    }
    if (potentialtarget _hasperk("specialty_blindeye")) {
        return 0;
    }
    if (distance2dsquared(self.origin, potentialtarget.origin) > 4194304) {
        return 0;
    }
    offset = (0, 0, 35);
    endpoint = potentialtarget.origin + rotatevector(offset, potentialtarget getworldupreferenceangles());
    ignorelist = [0:self];
    var_d740d9b67690a550 = ray_trace(self.origin, endpoint, ignorelist, undefined, 1);
    if (!isdefined(var_d740d9b67690a550["entity"])) {
        return 0;
    }
    return 1;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338b
// Size: 0x1c2
function getbesttarget(targets) {
    self endon("death");
    var_88c2b48ba3714b8e = undefined;
    besttarget = undefined;
    foreach (targ in targets) {
        if (isdefined(self.turrettarget) && self.turrettarget == targ) {
            continue;
        }
        angle = abs(vectortoangles(targ.origin - self.origin)[1]);
        var_a6f54781e7e6cb25 = abs(self gettagangles("tag_origin")[1]);
        angle = abs(angle - var_a6f54781e7e6cb25);
        var_d6e9347c3618a5bb = targ getweaponslistitems();
        foreach (weapon in var_d6e9347c3618a5bb) {
            weaponname = weapon.basename;
            if (issubstr(weaponname, "chargeshot") || issubstr(weaponname, "lockon")) {
                angle = angle - 40;
            }
        }
        if (distance(self.origin, targ.origin) > 4000) {
            angle = angle + 40;
        }
        if (!isdefined(var_88c2b48ba3714b8e)) {
            var_88c2b48ba3714b8e = angle;
            besttarget = targ;
        } else if (var_88c2b48ba3714b8e > angle) {
            var_88c2b48ba3714b8e = angle;
            besttarget = targ;
        }
    }
    return besttarget;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3555
// Size: 0x11f
function handledestroydamage() {
    self endon("death");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        objweapon = mapweapon(objweapon, inflictor);
        if ((objweapon.basename == "aamissile_projectile_mp" || objweapon.basename == "nuke_mp") && meansofdeath == "MOD_EXPLOSIVE" && damage >= self.health) {
            callback_vehicledamage(attacker, attacker, 9001, 0, meansofdeath, objweapon, point, direction_vec, point, 0, 0, partname);
        }
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x367b
// Size: 0x1fd
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname) {
    if (isdefined(attacker)) {
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
    }
    if ((attacker == self || isdefined(attacker.pers) && attacker.pers["team"] == self.team && !level.friendlyfire && level.teambased) && attacker != self.owner) {
        return;
    }
    if (self.health <= 0) {
        return;
    }
    damage = getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, damage, self.maxhealth, 3, 4, 5);
    namespace_58a74e7d54b56e8d::killstreakhit(attacker, objweapon, self, meansofdeath, damage);
    attacker updatedamagefeedback("");
    namespace_3e725f3cc58bddd3::logattackerkillstreak(self, damage, attacker, dir, point, meansofdeath, modelindex, undefined, partname, dflags, getcompleteweaponname(objweapon));
    if (self.health <= damage) {
        if (isplayer(attacker) && (!isdefined(self.owner) || attacker != self.owner)) {
            namespace_3e725f3cc58bddd3::onkillstreakkilled("jackal", attacker, objweapon, meansofdeath, damage, "destroyed_jackal", "jackal_destroyed", "callout_destroyed_harrier");
        }
    }
    if (self.health - damage <= 900 && (!isdefined(self.smoking) || !self.smoking)) {
        self.smoking = 1;
    }
    self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname);
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x387f
// Size: 0x56
function getcorrectheight(x, y, rand) {
    var_dc8bb6300463cf1e = 600;
    var_e7a7d619f927d791 = tracegroundpoint(x, y);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    return var_1dc672cfe0f0128e;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38dd
// Size: 0xdf
function playdamageefx() {
    self endon("death");
    stopfxontag(level.harrier_afterburnerfx, self, "tag_engine_left");
    playfxontag(level.harrier_smoke, self, "tag_engine_left");
    stopfxontag(level.harrier_afterburnerfx, self, "tag_engine_right");
    playfxontag(level.harrier_smoke, self, "tag_engine_right");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.15);
    stopfxontag(level.harrier_afterburnerfx, self, "tag_engine_left2");
    playfxontag(level.harrier_smoke, self, "tag_engine_left2");
    stopfxontag(level.harrier_afterburnerfx, self, "tag_engine_right2");
    playfxontag(level.harrier_smoke, self, "tag_engine_right2");
    playfxontag(level.chopper_fx["damage"]["heavy_smoke"], self, "tag_engine_left");
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c3
// Size: 0xd1
function jackaldestroyed() {
    self endon("jackal_gone");
    owner = self.owner;
    self waittill("death");
    if (isdefined(self.turrettarget) && isdefined(self.targetoutline)) {
        outlinedisable(self.targetoutline, self.turrettarget);
    }
    if (!isdefined(self)) {
        return;
    }
    self.owner namespace_58fb4f2e73fd41a0::clearlowermessage(getothermode(self.combatmode));
    if (!isdefined(self.largeprojectiledamage)) {
        self vehicle_setspeed(25, 5);
        thread jackalcrash(75);
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.7);
    }
    if (isdefined(self.lz)) {
        self.lz notify("extraction_destroyed");
    }
    jackalexplode();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9b
// Size: 0x60
function jackalexplode() {
    self playsound("dropship_explode_mp");
    level.jackals[level.jackals.size - 1] = undefined;
    self notify("explode");
    if (isdefined(self.lz)) {
        playfxontag(getfx("jackal_explosion"), self, "tag_origin");
    }
    wait(0.35);
    thread jackaldelete();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b02
// Size: 0x73
function jackalcrash(speed) {
    self endon("explode");
    self clearlookatent();
    self notify("jackal_crashing");
    self setvehgoalpos(self.origin + (0, 0, 100), 1);
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1.5);
    self setyawspeed(speed, speed, speed);
    self settargetyaw(self.angles[1] + speed * 2.5);
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b7c
// Size: 0x7f
function tracenewpoint(x, y, z) {
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    self endon("randMove");
    var_e96577032a7740fc = sphere_trace(self.origin, (x, y, z), 256, self, undefined, 1);
    if (var_e96577032a7740fc["surfacetype"] != "surftype_none") {
        return 0;
    }
    pathgoal = (x, y, z);
    return pathgoal;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c03
// Size: 0x12c
function tracegroundpoint(x, y) {
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    z = -99999;
    var_e531afbe1391f499 = self.origin[2] + 2000;
    minz = level.averagealliesz;
    ignorelist = [0:self];
    if (isdefined(self.dropcrates)) {
        foreach (crate in self.dropcrates) {
            ignorelist[ignorelist.size] = crate;
        }
    }
    var_e96577032a7740fc = sphere_trace((x, y, var_e531afbe1391f499), (x, y, z), 256, ignorelist, undefined, 1);
    if (var_e96577032a7740fc["position"][2] < minz) {
        var_fa83e3a4c4e6902 = minz;
    } else {
        var_fa83e3a4c4e6902 = var_e96577032a7740fc["position"][2];
    }
    return var_fa83e3a4c4e6902;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d37
// Size: 0x47
function closetogoalcheck(pathgoal) {
    self endon("goal");
    self endon("death");
    for (;;) {
        for (;;) {
            if (distance2d(self.origin, pathgoal) < 768) {
                self setmaxpitchroll(10, 25);
                break;
            }
        }
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d85
// Size: 0x6a
function monitorowner() {
    self endon("death");
    self endon("leaving");
    if (!isdefined(self.owner) || self.owner.team != self.team) {
        thread jackalexplode();
        return;
    }
    self.owner waittill_any_2("joined_team", "disconnect");
    jackalexplode();
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df6
// Size: 0x28f
function watchmodechange(msgname, var_afdb365ac9503b7) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("leaving");
    level endon("game_ended");
    updaterate = level.framedurationseconds;
    while (1) {
        player = self.useobj waittill("trigger");
        if (player != self.owner) {
            continue;
        }
        if (self.owner isusingremote()) {
            continue;
        }
        if (!self.owner val::get("usability")) {
            continue;
        }
        if (istouchingboundstrigger(self.owner)) {
            continue;
        }
        timeused = 0;
        while (self.owner usebuttonpressed()) {
            timeused = timeused + updaterate;
            if (timeused > 0.1) {
                var_ff788554f45f9d12 = getothermode(self.combatmode);
                if (var_ff788554f45f9d12 == "guard_location") {
                    playerx = self.owner.origin[0];
                    playery = self.owner.origin[1];
                    var_3ad8c1ee301e4523 = self.origin[2];
                    newpos = (playerx, playery, var_3ad8c1ee301e4523);
                    contents = create_contents(0, 1, 1, 1, 1, 1, 0);
                    if (!ray_trace_passed(self.origin, newpos, self, contents)) {
                        self.owner namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_CALLED");
                        break;
                    }
                }
                self.combatmode = var_ff788554f45f9d12;
                self notify(self.combatmode);
                if (self.combatmode == "guard_location") {
                    msgname = "follow_player";
                    var_afdb365ac9503b7 = "KILLSTREAKS_HINTS_JACKAL_FOLLOW";
                    thread dropship_change_thrust_sfx();
                    thread guardposition();
                } else {
                    msgname = "guard_location";
                    var_afdb365ac9503b7 = "KILLSTREAKS_HINTS_JACKAL_GUARD";
                    thread patrolfield();
                    thread dropship_change_thrust_sfx();
                }
                self.useobj makeunusable();
                namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
                self.currentstring = var_afdb365ac9503b7;
                self.useobj setkillstreakcontrolpriority(self.owner, self.currentstring, 360, 360, 30000, 30000, 2);
                break;
            }
            wait(updaterate);
        }
        wait(updaterate);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408c
// Size: 0x1b
function dropship_change_thrust_sfx() {
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.3);
    self playsoundonmovingent("dropship_killstreak_thrust_change");
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ae
// Size: 0x28
function getothermode(mode) {
    if (mode == "follow_player") {
        mode = "guard_location";
    } else {
        mode = "follow_player";
    }
    return mode;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40de
// Size: 0x46
function looptriggeredeffect(effect, missile) {
    level endon("game_ended");
    for (;;) {
        triggerfx(effect);
        wait(0.05);
        if (!isdefined(missile) || !isdefined(effect)) {
            break;
        }
    }
    if (isdefined(effect)) {
        effect delete();
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x412b
// Size: 0x353
function attacklasedtarget(var_726fa5d13e90f8f9, var_facf9f5a4b563c03) {
    var_60a448df9c59a413 = undefined;
    var_12ee62362c758131 = undefined;
    var_73789545e7e2f109 = 6000;
    upvector = (0, 0, var_73789545e7e2f109);
    backdist = 3000;
    forward = anglestoforward(self.angles);
    ownerorigin = self.origin;
    startpos = ownerorigin + upvector + forward * backdist * -1;
    ignorelist = [0:self];
    var_2a224218e7468e4a = 0;
    var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (0, 0, var_73789545e7e2f109), var_726fa5d13e90f8f9);
    if (var_bf701dc10de6a877["fraction"] > 0.99) {
        var_2a224218e7468e4a = 1;
        startpos = var_726fa5d13e90f8f9 + (0, 0, var_73789545e7e2f109);
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (300, 0, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (300, 0, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (0, 300, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (0, 300, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (0, -300, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (0, -300, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (300, 300, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (300, 300, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (-300, 0, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (-300, 0, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (-300, -300, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (-300, -300, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        var_bf701dc10de6a877 = ray_trace(var_726fa5d13e90f8f9 + (300, -300, var_73789545e7e2f109), var_726fa5d13e90f8f9);
        if (var_bf701dc10de6a877["fraction"] > 0.99) {
            var_2a224218e7468e4a = 1;
            startpos = var_726fa5d13e90f8f9 + (300, -300, var_73789545e7e2f109);
        }
    }
    if (!var_2a224218e7468e4a) {
        for (i = 0; i < 5; i++) {
            var_73789545e7e2f109 = var_73789545e7e2f109 / 2;
            upvector = (0, 0, var_73789545e7e2f109);
            startpos = ownerorigin + upvector + forward * backdist * -1;
            var_981de761dfbb8f8b = ray_trace(var_726fa5d13e90f8f9, startpos, ignorelist);
            if (var_981de761dfbb8f8b["fraction"] > 0.99) {
                var_2a224218e7468e4a = 1;
                break;
            }
            wait(0.05);
        }
    }
    if (!var_2a224218e7468e4a) {
        for (i = 0; i < 5; i++) {
            var_73789545e7e2f109 = var_73789545e7e2f109 * 2.5;
            upvector = (0, 0, var_73789545e7e2f109);
            startpos = ownerorigin + upvector + forward * backdist * -1;
            var_981de761dfbb8f8b = ray_trace(var_726fa5d13e90f8f9, startpos, ignorelist);
            if (var_981de761dfbb8f8b["fraction"] > 0.99) {
                var_2a224218e7468e4a = 1;
                break;
            }
            wait(0.05);
        }
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4485
// Size: 0x60
function playlocksound() {
    if (isdefined(self.playinglocksound) && self.playinglocksound) {
        return;
    }
    play_loopsound_in_space("javelin_clu_lock", self.origin);
    self.playinglocksound = 1;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.75);
    self stoploopsound("javelin_clu_lock");
    self.playinglocksound = 0;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44ec
// Size: 0x57
function playlockerrorsound() {
    if (isdefined(self.playinglocksound) && self.playinglocksound) {
        return;
    }
    self playlocalsound("javelin_clu_aquiring_lock");
    self.playinglocksound = 1;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.75);
    self stoplocalsound("javelin_clu_aquiring_lock");
    self.playinglocksound = 0;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x454a
// Size: 0x53
function beginevasivemaneuvers() {
    self endon("death");
    self notify("begin_evasive_maneuvers");
    self endon("begin_evasive_maneuvers");
    self.evasivemaneuvers = 1;
    result = waittill_any_timeout_1(3, "death");
    if (result == "timeout") {
        self.evasivemaneuvers = 0;
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45a4
// Size: 0xe1
function watchguardevadedamage() {
    self endon("death");
    self endon("leaving");
    self endon("following_player");
    while (1) {
        newpos = undefined;
        if (istrue(self.evasivemaneuvers)) {
            playerx = self.owner.origin[0];
            playery = self.owner.origin[1];
            newx = playerx + randomintrange(-500, 500);
            newy = playery + randomintrange(-500, 500);
            var_7504c8791e34dc73 = getcorrectheight(newx, newy, 350);
            newpos = (newx, newy, var_7504c8791e34dc73);
        }
        if (isdefined(newpos)) {
            self setvehgoalpos(newpos, 1);
        }
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.1);
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x468c
// Size: 0x39
function watchdropcratesearly(marker) {
    self endon("dropped_crates");
    var_2e0d8ba0a46ce1b1 = self.dropcrates;
    self waittill("death");
    thread dropcrates(var_2e0d8ba0a46ce1b1, marker);
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46cc
// Size: 0x2a
function dropcrates(var_2e0d8ba0a46ce1b1, marker) {
    /#
        assertmsg("dropCrates() uses deprecated methods from airdrop.gsc");
    #/
    self notify("dropped_crates");
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46fd
// Size: 0x2f
function watchforcapture(jackal, index) {
    waittill_any_2("captured", "death");
    jackal notify("crate_captured_" + index);
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4733
// Size: 0x58
function watchjackalcratepickup() {
    self endon("death");
    self endon("leaving");
    var_d6d0dd717fdce328 = 0;
    while (1) {
        waittill_any_3("crate_captured_0", "crate_captured_1", "crate_captured_2");
        var_d6d0dd717fdce328++;
        if (var_d6d0dd717fdce328 == self.dropcrates.size) {
            self notify("all_crates_gone");
            break;
        }
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4792
// Size: 0xd5
function beginjackalescort(lifeid, startpoint, pos, streakinfo, tacopslz, var_fae759765e65830a) {
    if (!isdefined(level.jackals)) {
        level.jackals = [];
    }
    marker = undefined;
    self notify("called_in_jackal");
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    pos = pos * (1, 1, 0);
    var_1dc672cfe0f0128e = 1000;
    pathgoal = pos + (0, 0, var_1dc672cfe0f0128e);
    jackal = spawnksjackal(lifeid, self, startpoint, pathgoal, streakinfo, tacopslz);
    jackal.pathgoal = pathgoal;
    thread defendlocationescort(jackal, marker);
    return jackal;
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486f
// Size: 0xb3
function defendlocationescort(jackal, marker) {
    jackal endon("death");
    /#
        assert(isdefined(jackal));
    #/
    jackal setvehgoalpos(jackal.pathgoal, 1);
    jackal playsoundonmovingent("dropship_killstreak_thrust_change");
    jackal thread closetogoalcheck(jackal.pathgoal);
    jackal thread monitorowner();
    jackal waittill("goal");
    jackal thread watchgameendleave();
    jackal thread engageprimarytarget();
    jackal thread engagesecondarytarget();
    jackal vehicle_setspeed(int(jackal.speed / 14), int(jackal.accel / 16));
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4929
// Size: 0x15d
function guardpositionescort(position, lookat, var_dc8bb6300463cf1e) {
    self endon("death");
    self endon("leaving");
    self endon("follow_player");
    self endon("jackal_crashing");
    if (isdefined(self.owner)) {
        self.owner endon("disconnect");
    }
    self vehicle_setspeed(int(self.speed / 14), int(self.accel / 16));
    if (isdefined(lookat)) {
        self setlookatent(lookat);
    }
    if (isdefined(position)) {
        newpos = undefined;
        playerx = position[0];
        playery = position[1];
        if (istrue(self.evasivemaneuvers)) {
            newx = playerx + randomintrange(-500, 500);
            newy = playery + randomintrange(-500, 500);
            var_7504c8791e34dc73 = getcorrectheightescort(newx, newy, 350, var_dc8bb6300463cf1e);
            newpos = (newx, newy, var_7504c8791e34dc73);
        } else {
            var_7504c8791e34dc73 = getcorrectheightescort(playerx, playery, 20, var_dc8bb6300463cf1e);
            newpos = (playerx, playery, var_7504c8791e34dc73);
        }
        self setvehgoalpos(newpos, 1);
        self.lastaction = "following_player";
        waittill_any_2("goal", "begin_evasive_maneuvers");
        self clearlookatent();
    }
}

// Namespace jackal/namespace_8d413061ce065c0c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8d
// Size: 0x66
function getcorrectheightescort(x, y, rand, minheight) {
    var_dc8bb6300463cf1e = 200;
    if (isdefined(minheight)) {
        var_dc8bb6300463cf1e = minheight;
    }
    var_e7a7d619f927d791 = tracegroundpoint(x, y);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    return var_1dc672cfe0f0128e;
}

