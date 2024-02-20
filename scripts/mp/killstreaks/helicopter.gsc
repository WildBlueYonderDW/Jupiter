// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\killstreaks\flares.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace helicopter;

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x49
function init() {
    level._effect["vehicle_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_apache_angel_flares.vfx");
    level._effect["jet_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_harrier_angel_flares.vfx");
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        level thread getaveragelowspawnpoint();
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x758
// Size: 0xaf
function getaveragelowspawnpoint() {
    spawnpoints = namespace_b2d5aa2baf2b5701::function_32d25b070a9516de(getspawnarray("mp_tdm_spawn_allies_start"));
    count = 0;
    var_d9fb82610410df01 = 0;
    foreach (point in spawnpoints) {
        count++;
        var_d9fb82610410df01 = var_d9fb82610410df01 + point.origin[2];
    }
    if (count > 0) {
        level.averagealliesz = var_d9fb82610410df01 / count;
    } else {
        level.averagealliesz = 0;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x80e
// Size: 0x47
function makehelitype(helitype, deathfx, lightfxfunc) {
    level.chopper_fx["explode"]["death"][helitype] = loadfx(deathfx);
    level.lightfxfunc[helitype] = lightfxfunc;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x85c
// Size: 0x32
function addairexplosion(helitype, var_69d36adbdec29dc) {
    level.chopper_fx["explode"]["air_death"][helitype] = loadfx(var_69d36adbdec29dc);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x895
// Size: 0x99
function defaultlightfx() {
    playfxontag(level.chopper_fx["light"]["left"], self, "tag_light_L_wing");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["right"], self, "tag_light_R_wing");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["belly"], self, "tag_light_belly");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["tail"], self, "tag_light_tail");
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x935
// Size: 0x20
function usehelicopter(lifeid, streakname) {
    return tryusehelicopter(lifeid, "helicopter");
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95d
// Size: 0x14c
function tryusehelicopter(lifeid, helitype) {
    var_4440147083abaf0a = 1;
    if (isdefined(level.chopper)) {
        var_54aa70777df37ff1 = 1;
    } else {
        var_54aa70777df37ff1 = 0;
    }
    if (isdefined(level.chopper) && var_54aa70777df37ff1) {
        self iprintlnbold("KILLSTREAKS_HELI_IN_QUEUE");
        if (isdefined(helitype) && helitype != "helicopter") {
            streakname = "helicopter_" + helitype;
        } else {
            streakname = "helicopter";
        }
        var_872a3d52fc91c4a1 = spawn("script_origin", (0, 0, 0));
        var_872a3d52fc91c4a1 hide();
        var_872a3d52fc91c4a1 thread deleteonentnotify(self, "disconnect");
        var_872a3d52fc91c4a1.player = self;
        var_872a3d52fc91c4a1.lifeid = lifeid;
        var_872a3d52fc91c4a1.helitype = helitype;
        var_872a3d52fc91c4a1.streakname = streakname;
        queueadd("helicopter", var_872a3d52fc91c4a1);
        return 0;
    } else if (currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + var_4440147083abaf0a >= maxvehiclesallowed()) {
        self iprintlnbold("KILLSTREAKS/TOO_MANY_VEHICLES");
        return 0;
    }
    var_4440147083abaf0a = 1;
    starthelicopter(lifeid, helitype);
    return 1;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab1
// Size: 0x26
function deleteonentnotify(ent, notifystring) {
    self endon("death");
    ent waittill(notifystring);
    self delete();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xade
// Size: 0xad
function starthelicopter(lifeid, helitype) {
    incrementfauxvehiclecount();
    startnode = undefined;
    if (!isdefined(helitype)) {
        helitype = "";
    }
    eventtype = "helicopter";
    team = self.pers["team"];
    startnode = level.heli_start_nodes[randomint(level.heli_start_nodes.size)];
    utility::trycall(level.matchdata_logkillstreakevent, eventtype, self.origin);
    thread heli_think(lifeid, self, startnode, self.pers["team"], helitype);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb92
// Size: 0x147
function precachehelicoptersounds() {
    level.heli_sound["allies"]["hit"] = "veh_chopper_support_hit";
    level.heli_sound["allies"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level.heli_sound["allies"]["spinloop"] = "cobra_helicopter_dying_loop";
    level.heli_sound["allies"]["spinstart"] = "cobra_helicopter_dying_layer";
    level.heli_sound["allies"]["crash"] = "exp_helicopter_fuel";
    level.heli_sound["allies"]["missilefire"] = "weap_cobra_missile_fire";
    level.heli_sound["axis"]["hit"] = "veh_chopper_support_hit";
    level.heli_sound["axis"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level.heli_sound["axis"]["spinloop"] = "cobra_helicopter_dying_loop";
    level.heli_sound["axis"]["spinstart"] = "cobra_helicopter_dying_layer";
    level.heli_sound["axis"]["crash"] = "exp_helicopter_fuel";
    level.heli_sound["axis"]["missilefire"] = "weap_cobra_missile_fire";
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce0
// Size: 0x2b
function heli_getteamforsoundclip() {
    teamname = self.team;
    if (level.multiteambased) {
        teamname = "axis";
    }
    return teamname;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd13
// Size: 0xf6
function spawn_helicopter(owner, origin, angles, vehicletype, modelname) {
    chopper = spawnhelicopter(owner, origin, angles, vehicletype, modelname);
    if (!isdefined(chopper)) {
        return undefined;
    }
    if (modelname == "vehicle_battle_hind") {
        chopper.heli_type = "cobra";
    } else {
        chopper.heli_type = level.heli_types[modelname];
    }
    chopper thread [[ level.lightfxfunc[chopper.heli_type] ]]();
    chopper addtohelilist(chopper getentitynumber());
    chopper.zoffset = (0, 0, chopper gettagorigin("tag_origin")[2] - chopper gettagorigin("tag_ground")[2]);
    chopper.attractor = missile_createattractorent(chopper, level.heli_attract_strength, level.heli_attract_range);
    return chopper;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe11
// Size: 0x8f
function helidialog(dialoggroup) {
    if (gettime() - level.lasthelidialogtime < 6000) {
        return;
    }
    level.lasthelidialogtime = gettime();
    randomindex = randomint(level.helidialog[dialoggroup].size);
    soundalias = level.helidialog[dialoggroup][randomindex];
    var_aeeca9f734ea50c1 = getteamvoiceinfix(self.team) + "tl" + soundalias;
    self playlocalsound(var_aeeca9f734ea50c1);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea7
// Size: 0x2b4
function updateareanodes(areanodes) {
    validenemies = [];
    foreach (node in areanodes) {
        node.validplayers = [];
        node.nodescore = 0;
    }
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player.team == self.team) {
            continue;
        }
        foreach (node in areanodes) {
            if (distancesquared(player.origin, node.origin) > 1048576) {
                continue;
            }
            node.validplayers[node.validplayers.size] = player;
        }
    }
    bestnode = areanodes[0];
    foreach (node in areanodes) {
        helinode = getent(node.target, "targetname");
        foreach (player in node.validplayers) {
            node.nodescore = node.nodescore + 1;
            if (namespace_2a184fc4902783dc::_bullet_trace_passed(player.origin + (0, 0, 32), helinode.origin, 0, player)) {
                node.nodescore = node.nodescore + 3;
            }
        }
        if (node.nodescore > bestnode.nodescore) {
            bestnode = node;
        }
    }
    return getent(bestnode.target, "targetname");
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1163
// Size: 0x28e
function heli_think(lifeid, owner, startnode, heli_team, helitype) {
    heliorigin = startnode.origin;
    heliangles = startnode.angles;
    vehicletype = "cobra_mp";
    var_b8957cd52d1efa30 = "vehicle_battle_hind";
    chopper = spawn_helicopter(owner, heliorigin, heliangles, vehicletype, var_b8957cd52d1efa30);
    if (!isdefined(chopper)) {
        return;
    }
    level.chopper = chopper;
    if (heli_team == "allies") {
        level.allieschopper = chopper;
    } else {
        level.axischopper = chopper;
    }
    chopper.helitype = helitype;
    chopper.lifeid = lifeid;
    chopper.team = heli_team;
    chopper.pers["team"] = heli_team;
    chopper.owner = owner;
    chopper setotherent(owner);
    chopper.startnode = startnode;
    chopper.maxhealth = level.heli_maxhealth;
    chopper.targeting_delay = level.heli_targeting_delay;
    chopper.primarytarget = undefined;
    chopper.secondarytarget = undefined;
    chopper.attacker = undefined;
    chopper.currentstate = "ok";
    chopper namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", owner);
    chopper.empgrenaded = 0;
    if (helitype == "flares" || helitype == "minigun") {
        chopper thread namespace_dc0d47ddf0ead8a3::flares_monitor(1);
    }
    chopper thread heli_leave_on_disconnect(owner);
    chopper thread heli_leave_on_changeteams(owner);
    chopper thread heli_leave_on_gameended(owner);
    chopper thread heli_damage_monitor(helitype);
    chopper thread heli_watchempdamage();
    chopper thread heli_watchdeath();
    chopper thread heli_existance();
    chopper endon("helicopter_done");
    chopper endon("crashing");
    chopper endon("leaving");
    chopper endon("death");
    var_8cad8ad1dfb1b849 = getentarray("heli_attack_area", "targetname");
    var_36f77433815409f = undefined;
    var_36f77433815409f = level.heli_loop_nodes[randomint(level.heli_loop_nodes.size)];
    chopper heli_fly_simple_path(startnode);
    chopper thread heli_targeting();
    chopper thread heli_leave_on_timeout(60);
    chopper thread heli_fly_loop_path(var_36f77433815409f);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f8
// Size: 0x110
function heli_existance() {
    entitynumber = self getentitynumber();
    waittill_any_3("death", "crashing", "leaving");
    removefromhelilist(entitynumber);
    self notify("helicopter_done");
    self notify("helicopter_removed");
    player = undefined;
    var_872a3d52fc91c4a1 = queueremovefirst("helicopter");
    if (!isdefined(var_872a3d52fc91c4a1)) {
        level.chopper = undefined;
        return;
    }
    player = var_872a3d52fc91c4a1.player;
    lifeid = var_872a3d52fc91c4a1.lifeid;
    streakname = var_872a3d52fc91c4a1.streakname;
    helitype = var_872a3d52fc91c4a1.helitype;
    var_872a3d52fc91c4a1 delete();
    if (isdefined(player) && (player.sessionstate == "playing" || player.sessionstate == "dead")) {
        player starthelicopter(lifeid, helitype);
    } else {
        level.chopper = undefined;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150f
// Size: 0x10a
function heli_targeting() {
    self notify("heli_targeting");
    self endon("heli_targeting");
    self endon("death");
    self endon("helicopter_done");
    for (;;) {
        targets = [];
        self.primarytarget = undefined;
        self.secondarytarget = undefined;
        foreach (player in level.characters) {
            wait(0.05);
            if (!cantarget_turret(player)) {
                continue;
            }
            targets[targets.size] = player;
        }
        if (targets.size) {
            targetplayer = getbestprimarytarget(targets);
            while (!isdefined(targetplayer)) {
                waitframe();
                targetplayer = getbestprimarytarget(targets);
            }
            self.primarytarget = targetplayer;
            self notify("primary acquired");
        }
        if (isdefined(self.primarytarget)) {
            fireontarget(self.primarytarget);
        } else {
            wait(0.25);
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1620
// Size: 0x129
function cantarget_turret(player) {
    cantarget = 1;
    if (!isalive(player) || isdefined(player.sessionstate) && player.sessionstate != "playing") {
        return 0;
    }
    if (distance(player.origin, self.origin) > level.heli_visual_range) {
        return 0;
    }
    if (!self.owner namespace_f8065cafc523dba5::isenemy(player)) {
        return 0;
    }
    if (isdefined(player.spawntime) && (gettime() - player.spawntime) / 1000 <= 5) {
        return 0;
    }
    if (player _hasperk("specialty_blindeye")) {
        return 0;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (player sightconetrace(heli_turret_point, self) < level.heli_target_recognition) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1751
// Size: 0x286
function getbestprimarytarget(targets) {
    foreach (player in targets) {
        if (!isdefined(player)) {
            continue;
        }
        update_player_threat(player);
    }
    highest = 0;
    primarytarget = undefined;
    corners = getentarray("minimap_corner", "targetname");
    foreach (player in targets) {
        if (!isdefined(player)) {
            continue;
        }
        /#
            assertex(isdefined(player.threatlevel), "Target player does not have threat level");
        #/
        if (corners.size == 2) {
            min = corners[0].origin;
            max = corners[0].origin;
            if (corners[1].origin[0] > max[0]) {
                max = (corners[1].origin[0], max[1], max[2]);
            } else {
                min = (corners[1].origin[0], min[1], min[2]);
            }
            if (corners[1].origin[1] > max[1]) {
                max = (max[0], corners[1].origin[1], max[2]);
            } else {
                min = (min[0], corners[1].origin[1], min[2]);
            }
            jumpiffalse(player.origin[0] < min[0] || player.origin[0] > max[0] || player.origin[1] < min[1] || player.origin[1] > max[1]) LOC_00000216;
        } else {
        LOC_00000216:
            if (player.threatlevel < highest) {
                continue;
            }
            if (!namespace_2a184fc4902783dc::_bullet_trace_passed(player.origin + (0, 0, 32), self.origin, 0, self)) {
                wait(0.05);
            } else {
                highest = player.threatlevel;
                primarytarget = player;
            }
        }
    }
    return primarytarget;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19df
// Size: 0x122
function update_player_threat(player) {
    player.threatlevel = 0;
    dist = distance(player.origin, self.origin);
    player.threatlevel = player.threatlevel + (level.heli_visual_range - dist) / level.heli_visual_range * 100;
    if (isdefined(self.attacker) && player == self.attacker) {
        player.threatlevel = player.threatlevel + 100;
    }
    if (isplayer(player)) {
        player.threatlevel = player.threatlevel + player.score * 4;
    }
    if (isdefined(player.antithreat)) {
        player.threatlevel = player.threatlevel - player.antithreat;
    }
    if (player.threatlevel <= 0) {
        player.threatlevel = 1;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b08
// Size: 0x4a
function heli_reset() {
    self cleartargetyaw();
    self cleargoalyaw();
    self vehicle_setspeed(80, 35);
    self setyawspeed(75, 45, 45);
    self setmaxpitchroll(30, 30);
    self setneargoalnotifydist(256);
    self setturningability(0.9);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b59
// Size: 0x41
function addrecentdamage(damage) {
    self endon("death");
    self.recentdamageamount = self.recentdamageamount + damage;
    wait(4);
    self.recentdamageamount = self.recentdamageamount - damage;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba1
// Size: 0x106
function modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    var_cb15fa5174e71840 = 2;
    var_be7c04516c5d9ccd = 3;
    var_ca960a517459fe15 = 4;
    if (isdefined(self.helitype) && self.helitype == "dronedrop") {
        var_cb15fa5174e71840 = 1;
        var_be7c04516c5d9ccd = 1;
        var_ca960a517459fe15 = 2;
    }
    modifieddamage = namespace_a2f809133c566621::getmodifiedantikillstreakdamage(attacker, objweapon, type, modifieddamage, self.maxhealth, var_cb15fa5174e71840, var_be7c04516c5d9ccd, var_ca960a517459fe15);
    thread addrecentdamage(modifieddamage);
    self notify("heli_damage_fx");
    return modifieddamage;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1caf
// Size: 0xf6
function handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    if (isdefined(attacker)) {
        config = level.heliconfigs[self.streakname];
        var_3737240cefe2c793 = namespace_3e725f3cc58bddd3::onkillstreakkilled(self.streakname, attacker, objweapon, type, damage, config.scorepopup, config.destroyedvo, config.callout);
        if (var_3737240cefe2c793) {
            attacker notify("destroyed_helicopter");
            self.killingattacker = attacker;
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dac
// Size: 0x6d
function heli_damage_monitor(type, var_66816dff4d94b0b3, var_a39ff9e13bbc6340) {
    self endon("crashing");
    self endon("leaving");
    self.streakname = type;
    self.recentdamageamount = 0;
    if (!istrue(var_a39ff9e13bbc6340)) {
        thread heli_health();
    }
    namespace_3e725f3cc58bddd3::monitordamage(self.maxhealth, "helicopter", &handledeathdamage, &modifydamage, 1, var_66816dff4d94b0b3);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e20
// Size: 0xdf
function heli_watchempdamage() {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self.owner endon("disconnect");
    level endon("game_ended");
    while (1) {
        duration = attacker = self waittill("emp_damage");
        self.empgrenaded = 1;
        if (isdefined(self.mgturretleft)) {
            self.mgturretleft notify("stop_shooting");
        }
        if (isdefined(self.mgturretright)) {
            self.mgturretright notify("stop_shooting");
        }
        wait(duration);
        self.empgrenaded = 0;
        if (isdefined(self.mgturretleft)) {
            self.mgturretleft notify("turretstatechange");
        }
        if (isdefined(self.mgturretright)) {
            self.mgturretright notify("turretstatechange");
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f06
// Size: 0x1ca
function heli_health() {
    self endon("leaving");
    self endon("crashing");
    self.currentstate = "ok";
    self.laststate = "ok";
    self setdamagestage(3);
    damagestate = 3;
    self setdamagestage(damagestate);
    config = level.heliconfigs[self.streakname];
    while (1) {
        self waittill("heli_damage_fx");
        if (damagestate > 0 && self.damagetaken >= self.maxhealth) {
            damagestate = 0;
            self setdamagestage(damagestate);
            stopfxontag(level.chopper_fx["damage"]["heavy_smoke"], self, config.enginevfxtag);
            self notify("death");
            break;
        } else if (damagestate > 1 && self.damagetaken >= self.maxhealth * 0.66) {
            damagestate = 1;
            self setdamagestage(damagestate);
            self.currentstate = "heavy smoke";
            stopfxontag(level.chopper_fx["damage"]["light_smoke"], self, config.enginevfxtag);
            playfxontag(level.chopper_fx["damage"]["heavy_smoke"], self, config.enginevfxtag);
        } else if (damagestate > 2 && self.damagetaken >= self.maxhealth * 0.33) {
            damagestate = 2;
            self setdamagestage(damagestate);
            self.currentstate = "light smoke";
            playfxontag(level.chopper_fx["damage"]["light_smoke"], self, config.enginevfxtag);
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d7
// Size: 0x8d
function heli_watchdeath() {
    level endon("game_ended");
    self endon("gone");
    self waittill("death");
    if (isdefined(self.largeprojectiledamage) && self.largeprojectiledamage) {
        thread heli_explode(1);
    } else {
        config = level.heliconfigs[self.streakname];
        playfxontag(level.chopper_fx["damage"]["on_fire"], self, config.enginevfxtag);
        thread heli_crash();
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216b
// Size: 0x92
function heli_crash() {
    self notify("crashing");
    self clearlookatent();
    var_5bac506d468bc5e8 = level.heli_crash_nodes[randomint(level.heli_crash_nodes.size)];
    if (isdefined(self.mgturretleft)) {
        self.mgturretleft notify("stop_shooting");
    }
    if (isdefined(self.mgturretright)) {
        self.mgturretright notify("stop_shooting");
    }
    thread heli_spin(180);
    thread heli_secondary_explosions();
    heli_fly_simple_path(var_5bac506d468bc5e8);
    thread heli_explode();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2204
// Size: 0xbc
function heli_secondary_explosions() {
    teamname = heli_getteamforsoundclip();
    config = level.heliconfigs[self.streakname];
    playfxontag(level.chopper_fx["explode"]["large"], self, config.enginevfxtag);
    self playsound(level.heli_sound[teamname]["hitsecondary"]);
    wait(3);
    if (!isdefined(self)) {
        return;
    }
    playfxontag(level.chopper_fx["explode"]["large"], self, config.enginevfxtag);
    self playsound(level.heli_sound[teamname]["hitsecondary"]);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c7
// Size: 0x74
function heli_spin(speed) {
    self endon("death");
    teamname = heli_getteamforsoundclip();
    self playsound(level.heli_sound[teamname]["hit"]);
    thread spinsoundshortly();
    self setyawspeed(speed, speed, speed);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.9);
        wait(1);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2342
// Size: 0x64
function spinsoundshortly() {
    self endon("death");
    wait(0.25);
    teamname = heli_getteamforsoundclip();
    self stoploopsound();
    wait(0.05);
    self playloopsound(level.heli_sound[teamname]["spinloop"]);
    wait(0.05);
    self playloopsound(level.heli_sound[teamname]["spinstart"]);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ad
// Size: 0x14d
function heli_explode(var_878a6a7f24d66385) {
    self notify("death");
    if (isdefined(var_878a6a7f24d66385) && isdefined(level.chopper_fx["explode"]["air_death"][self.heli_type])) {
        var_27bc369e650add5 = self gettagangles("tag_deathfx");
        playfx(level.chopper_fx["explode"]["air_death"][self.heli_type], self gettagorigin("tag_deathfx"), anglestoforward(var_27bc369e650add5), anglestoup(var_27bc369e650add5));
    } else {
        org = self.origin;
        forward = self.origin + (0, 0, 1) - self.origin;
        playfx(level.chopper_fx["explode"]["death"][self.heli_type], org, forward);
    }
    teamname = heli_getteamforsoundclip();
    self playsound(level.heli_sound[teamname]["crash"]);
    waitframe();
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    decrementfauxvehiclecount();
    self delete();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2501
// Size: 0x62
function check_owner() {
    if (!isdefined(self.owner) || !isdefined(self.owner.pers["team"]) || self.owner.pers["team"] != self.team) {
        thread heli_leave();
        return 0;
    }
    return 1;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256b
// Size: 0x2a
function heli_leave_on_disconnect(owner) {
    self endon("death");
    self endon("helicopter_done");
    owner waittill("disconnect");
    thread heli_leave();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259c
// Size: 0x34
function heli_leave_on_changeteams(owner) {
    self endon("death");
    self endon("helicopter_done");
    owner waittill_any_2("joined_team", "joined_spectators");
    thread heli_leave();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25d7
// Size: 0x2a
function heli_leave_on_spawned(owner) {
    self endon("death");
    self endon("helicopter_done");
    owner waittill("spawned");
    thread heli_leave();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2608
// Size: 0x2a
function heli_leave_on_gameended(owner) {
    self endon("death");
    self endon("helicopter_done");
    level waittill("game_ended");
    thread heli_leave();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2639
// Size: 0x2a
function heli_leave_on_timeout(timeout) {
    self endon("death");
    self endon("helicopter_done");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(timeout);
    thread heli_leave();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266a
// Size: 0x376
function fireontarget(targetplayer) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    var_f8819918db5085ef = 15;
    var_66a64bc395b4ff7b = 0;
    var_811dc7cfcfd29886 = 0;
    foreach (node in level.heli_loop_nodes) {
        var_66a64bc395b4ff7b++;
        var_811dc7cfcfd29886 = var_811dc7cfcfd29886 + node.origin[2];
    }
    var_9b53fc8fa63d4127 = var_811dc7cfcfd29886 / var_66a64bc395b4ff7b;
    self notify("newTarget");
    if (isdefined(self.secondarytarget) && self.secondarytarget.damagetaken < self.secondarytarget.maxhealth) {
        return;
    }
    if (isdefined(self.isperformingmaneuver) && self.isperformingmaneuver) {
        return;
    }
    currenttarget = self.primarytarget;
    currenttarget.antithreat = 0;
    var_bbe89bb08d4aaa08 = self.primarytarget.origin * (1, 1, 0);
    var_4bb61811b9080546 = self.origin * (0, 0, 1);
    var_2a530280d4341a8a = var_bbe89bb08d4aaa08 + var_4bb61811b9080546;
    var_9a0013a4ace3b419 = distance2d(self.origin, currenttarget.origin);
    if (var_9a0013a4ace3b419 < 1000) {
        var_f8819918db5085ef = 600;
    }
    var_4a05b5b6307a4629 = anglestoforward(currenttarget.angles);
    var_4a05b5b6307a4629 = var_4a05b5b6307a4629 * (1, 1, 0);
    var_3f662d6595827e55 = var_2a530280d4341a8a + var_f8819918db5085ef * var_4a05b5b6307a4629;
    var_c43fa317dc81b416 = var_3f662d6595827e55 - var_2a530280d4341a8a;
    attackangle = vectortoangles(var_c43fa317dc81b416);
    attackangle = attackangle * (1, 1, 0);
    thread attackgroundtarget(currenttarget);
    self vehicle_setspeed(80);
    if (distance2d(self.origin, var_3f662d6595827e55) < 1000) {
        var_3f662d6595827e55 = var_3f662d6595827e55 * 1.5;
    }
    var_3f662d6595827e55 = var_3f662d6595827e55 * (1, 1, 0);
    var_3f662d6595827e55 = var_3f662d6595827e55 + (0, 0, var_9b53fc8fa63d4127);
    _setvehgoalpos(var_3f662d6595827e55, 1, 1);
    self waittill("near_goal");
    if (!isdefined(currenttarget) || !isalive(currenttarget)) {
        return;
    }
    self setlookatent(currenttarget);
    thread isfacing(10, currenttarget);
    waittill_any_timeout_1(4, "facing");
    if (!isdefined(currenttarget) || !isalive(currenttarget)) {
        return;
    }
    self clearlookatent();
    var_1969616b8d0c188c = var_2a530280d4341a8a + var_f8819918db5085ef * anglestoforward(attackangle);
    self setmaxpitchroll(40, 30);
    _setvehgoalpos(var_1969616b8d0c188c, 1, 1);
    self setmaxpitchroll(30, 30);
    if (isdefined(currenttarget) && isalive(currenttarget)) {
        if (isdefined(currenttarget.antithreat)) {
            currenttarget.antithreat = currenttarget.antithreat + 100;
        } else {
            currenttarget.antithreat = 100;
        }
    }
    waittill_any_timeout_1(3, "near_goal");
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e7
// Size: 0x1e4
function attackgroundtarget(currenttarget) {
    self notify("attackGroundTarget");
    self endon("attackGroundTarget");
    self stoploopsound();
    self.isattacking = 1;
    self setturrettargetent(currenttarget);
    waitontargetordeath(currenttarget, 3);
    if (!isalive(currenttarget)) {
        self.isattacking = 0;
        return;
    }
    var_72fde5447014f573 = distance2dsquared(self.origin, currenttarget.origin);
    if (var_72fde5447014f573 < 640000) {
        thread dropbombs(currenttarget);
        self.isattacking = 0;
        return;
    } else if (checkisfacing(50, currenttarget) && cointoss()) {
        thread firemissile(currenttarget);
        self.isattacking = 0;
        return;
    } else {
        weaponshoottime = weaponfiretime("cobra_20mm_mp");
        var_922819de2d68c5e7 = 0;
        var_900a892cf774ea30 = 0;
        for (i = 0; i < level.heli_turretclipsize; i++) {
            if (!isdefined(self)) {
                break;
            }
            if (self.empgrenaded) {
                break;
            }
            if (!isdefined(currenttarget)) {
                break;
            }
            if (!isalive(currenttarget)) {
                break;
            }
            if (self.damagetaken >= self.maxhealth) {
                continue;
            }
            if (!checkisfacing(55, currenttarget)) {
                self stoploopsound();
                var_900a892cf774ea30 = 0;
                wait(weaponshoottime);
                i--;
            } else {
                if (i < level.heli_turretclipsize - 1) {
                    wait(weaponshoottime);
                }
                if (!isdefined(currenttarget) || !isalive(currenttarget)) {
                    break;
                }
                if (!var_900a892cf774ea30) {
                    self playloopsound("weap_hind_20mm_fire_npc");
                    var_900a892cf774ea30 = 1;
                }
                self setvehweapon("cobra_20mm_mp");
                self fireweapon("tag_flash", currenttarget);
            }
        }
        if (!isdefined(self)) {
            return;
        }
        self stoploopsound();
        var_900a892cf774ea30 = 0;
        self.isattacking = 0;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd2
// Size: 0xc7
function checkisfacing(tolerance, currenttarget) {
    self endon("death");
    self endon("leaving");
    if (!isdefined(tolerance)) {
        tolerance = 10;
    }
    var_596005145e41eab5 = anglestoforward(self.angles);
    var_6d9d6722a1121a79 = currenttarget.origin - self.origin;
    var_596005145e41eab5 = var_596005145e41eab5 * (1, 1, 0);
    var_6d9d6722a1121a79 = var_6d9d6722a1121a79 * (1, 1, 0);
    var_6d9d6722a1121a79 = vectornormalize(var_6d9d6722a1121a79);
    var_596005145e41eab5 = vectornormalize(var_596005145e41eab5);
    var_466e87ce09ca407b = vectordot(var_6d9d6722a1121a79, var_596005145e41eab5);
    var_5762b77f73eda7c0 = cos(tolerance);
    if (var_466e87ce09ca407b >= var_5762b77f73eda7c0) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca0
// Size: 0xdc
function isfacing(tolerance, currenttarget) {
    self endon("death");
    self endon("leaving");
    if (!isdefined(tolerance)) {
        tolerance = 10;
    }
    while (isalive(currenttarget)) {
        var_596005145e41eab5 = anglestoforward(self.angles);
        var_6d9d6722a1121a79 = currenttarget.origin - self.origin;
        var_596005145e41eab5 = var_596005145e41eab5 * (1, 1, 0);
        var_6d9d6722a1121a79 = var_6d9d6722a1121a79 * (1, 1, 0);
        var_6d9d6722a1121a79 = vectornormalize(var_6d9d6722a1121a79);
        var_596005145e41eab5 = vectornormalize(var_596005145e41eab5);
        var_466e87ce09ca407b = vectordot(var_6d9d6722a1121a79, var_596005145e41eab5);
        var_5762b77f73eda7c0 = cos(tolerance);
        if (var_466e87ce09ca407b >= var_5762b77f73eda7c0) {
            self notify("facing");
            break;
        }
        wait(0.1);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d83
// Size: 0x36
function waitontargetordeath(target, timeout) {
    self endon("death");
    self endon("helicopter_done");
    target endon("death_or_disconnect");
    waittill_notify_or_timeout("turret_on_target", timeout);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc0
// Size: 0x131
function firemissile(missiletarget) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    /#
        assert(self.health > 0);
    #/
    var_585f84a1c35d91b1 = 2;
    for (i = 0; i < var_585f84a1c35d91b1; i++) {
        if (!isdefined(missiletarget)) {
            return;
        }
        if (cointoss()) {
            missile = namespace_d325722f2754c2c4::_magicbullet(makeweapon("hind_missile_mp"), self gettagorigin("tag_missile_right") - (0, 0, 64), missiletarget.origin, self.owner);
            missile.vehicle_fired_from = self;
        } else {
            missile = namespace_d325722f2754c2c4::_magicbullet(makeweapon("hind_missile_mp"), self gettagorigin("tag_missile_left") - (0, 0, 64), missiletarget.origin, self.owner);
            missile.vehicle_fired_from = self;
        }
        missile missile_settargetent(missiletarget);
        missile.owner = self;
        missile missile_setflightmodedirect();
        wait(0.5 / var_585f84a1c35d91b1);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef8
// Size: 0x104
function dropbombs(missiletarget) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    if (!isdefined(missiletarget)) {
        return;
    }
    for (i = 0; i < randomintrange(2, 5); i++) {
        if (cointoss()) {
            missile = namespace_d325722f2754c2c4::_magicbullet(makeweapon("hind_bomb_mp"), self gettagorigin("tag_missile_left") - (0, 0, 45), missiletarget.origin, self.owner);
            missile.vehicle_fired_from = self;
        } else {
            missile = namespace_d325722f2754c2c4::_magicbullet(makeweapon("hind_bomb_mp"), self gettagorigin("tag_missile_right") - (0, 0, 45), missiletarget.origin, self.owner);
            missile.vehicle_fired_from = self;
        }
        wait(randomfloatrange(0.35, 0.65));
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3003
// Size: 0x159
function getoriginoffsets(goalnode) {
    startorigin = self.origin;
    endorigin = goalnode.origin;
    numtraces = 0;
    maxtraces = 40;
    traceoffset = (0, 0, -196);
    traceorigin = namespace_2a184fc4902783dc::_bullet_trace(startorigin + traceoffset, endorigin + traceoffset, 0, self);
    while (distancesquared(traceorigin["position"], endorigin + traceoffset) > 10 && numtraces < maxtraces) {
        /#
            println("cobra_helicopter_secondary_exp" + distancesquared(traceorigin["tl"], endorigin + traceoffset));
        #/
        if (startorigin[2] < endorigin[2]) {
            startorigin = startorigin + (0, 0, 128);
        } else if (startorigin[2] > endorigin[2]) {
            endorigin = endorigin + (0, 0, 128);
        } else {
            startorigin = startorigin + (0, 0, 128);
            endorigin = endorigin + (0, 0, 128);
        }
        /#
        #/
        numtraces++;
        traceorigin = namespace_2a184fc4902783dc::_bullet_trace(startorigin + traceoffset, endorigin + traceoffset, 0, self);
    }
    offsets = [];
    offsets["start"] = startorigin;
    offsets["end"] = endorigin;
    return offsets;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3164
// Size: 0x14c
function traveltonode(goalnode) {
    originoffets = getoriginoffsets(goalnode);
    if (originoffets["start"] != self.origin) {
        self vehicle_setspeed(75, 35);
        _setvehgoalpos(originoffets["start"] + (0, 0, 30), 0);
        self setgoalyaw(goalnode.angles[1] + level.heli_angle_offset);
        self waittill("goal");
    }
    if (originoffets["end"] != goalnode.origin) {
        if (isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel)) {
            heli_speed = goalnode.script_airspeed;
            heli_accel = goalnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 15 + randomint(15);
        }
        self vehicle_setspeed(75, 35);
        _setvehgoalpos(originoffets["end"] + (0, 0, 30), 0);
        self setgoalyaw(goalnode.angles[1] + level.heli_angle_offset);
        self waittill("goal");
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b7
// Size: 0x41
function _setvehgoalpos(goalposition, var_e6a6756bbbe9a3e, var_10947963c8a8a722) {
    if (!isdefined(var_e6a6756bbbe9a3e)) {
        var_e6a6756bbbe9a3e = 0;
    }
    var_10947963c8a8a722 = 0;
    if (var_10947963c8a8a722) {
        thread _setvehgoalposadheretomesh(goalposition, var_e6a6756bbbe9a3e);
    } else {
        self setvehgoalpos(goalposition, var_e6a6756bbbe9a3e);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ff
// Size: 0x25b
function _setvehgoalposadheretomesh(goalposition, var_e6a6756bbbe9a3e) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    var_7cf2e671d5ce666f = goalposition;
    for (;;) {
        for (;;) {
            if (!isdefined(self)) {
                return;
            }
            if (distance_2d_squared(self.origin, var_7cf2e671d5ce666f) < 65536) {
                self setvehgoalpos(var_7cf2e671d5ce666f, var_e6a6756bbbe9a3e);
                /#
                    println("leaving");
                #/
                break;
            }
            var_8b299bc599c459a5 = vectortoangles(var_7cf2e671d5ce666f - self.origin);
            var_c7645062191fd7c6 = anglestoforward(var_8b299bc599c459a5);
            var_7a7eaf576c2dcc51 = self.origin + var_c7645062191fd7c6 * (1, 1, 0) * 250;
            traceoffset = (0, 0, 2500);
            tracestart = var_7a7eaf576c2dcc51 + gethelipilotmeshoffset() + traceoffset;
            traceend = var_7a7eaf576c2dcc51 + gethelipilotmeshoffset() - traceoffset;
            tracepos = namespace_2a184fc4902783dc::_bullet_trace(tracestart, traceend, 0, self, 0, 0, 1);
            var_7c00eb979037c433 = tracepos;
            if (isdefined(tracepos["entity"]) && tracepos["entity"] == self && tracepos["normal"][2] > 0.1) {
                var_a38b0f14438e3e6 = tracepos["position"][2] - 4400;
                var_cdff5d407723f731 = var_a38b0f14438e3e6 - self.origin[2];
                if (var_cdff5d407723f731 > 256) {
                    tracepos["position"] = tracepos["position"] * (1, 1, 0);
                    tracepos["position"] = tracepos["position"] + (0, 0, self.origin[2] + 256);
                } else if (var_cdff5d407723f731 < -256) {
                    tracepos["position"] = tracepos["position"] * (1, 1, 0);
                    tracepos["position"] = tracepos["position"] + (0, 0, self.origin[2] - 256);
                }
                var_7c00eb979037c433 = tracepos["position"] - gethelipilotmeshoffset() + (0, 0, 600);
            } else {
                var_7c00eb979037c433 = var_7cf2e671d5ce666f;
            }
            self setvehgoalpos(var_7c00eb979037c433, 0);
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3561
// Size: 0x1d7
function heli_fly_simple_path(startnode) {
    self endon("death");
    self endon("leaving");
    self notify("flying");
    self endon("flying");
    heli_reset();
    currentnode = startnode;
    while (isdefined(currentnode.target)) {
        nextnode = getent(currentnode.target, "targetname");
        /#
            assertex(isdefined(nextnode), "Next node in path is undefined, but has targetname. Bad Node Position: " + currentnode.origin);
        #/
        if (isdefined(currentnode.script_airspeed) && isdefined(currentnode.script_accel)) {
            heli_speed = currentnode.script_airspeed;
            heli_accel = currentnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 15 + randomint(15);
        }
        if (isdefined(self.isattacking) && self.isattacking) {
            waitframe();
            continue;
        }
        if (isdefined(self.isperformingmaneuver) && self.isperformingmaneuver) {
            waitframe();
            continue;
        }
        self vehicle_setspeed(75, 35);
        if (!isdefined(nextnode.target)) {
            _setvehgoalpos(nextnode.origin + self.zoffset, 1);
            self waittill("near_goal");
        } else {
            _setvehgoalpos(nextnode.origin + self.zoffset, 0);
            self waittill("near_goal");
            self setgoalyaw(nextnode.angles[1]);
            self waittill("goal");
        }
        currentnode = nextnode;
    }
    /#
        println(currentnode.origin);
        println(self.origin);
    #/
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373f
// Size: 0x237
function heli_fly_loop_path(startnode) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self notify("flying");
    self endon("flying");
    heli_reset();
    thread heli_loop_speed_control(startnode);
    currentnode = startnode;
    while (isdefined(currentnode.target)) {
        nextnode = getent(currentnode.target, "targetname");
        /#
            assertex(isdefined(nextnode), "Next node in path is undefined, but has targetname. Bad Node Position: " + currentnode.origin);
        #/
        if (isdefined(self.isperformingmaneuver) && self.isperformingmaneuver) {
            wait(0.25);
            continue;
        }
        if (isdefined(self.isattacking) && self.isattacking) {
            wait(0.1);
            continue;
        }
        if (isdefined(currentnode.script_airspeed) && isdefined(currentnode.script_accel)) {
            self.desired_speed = currentnode.script_airspeed;
            self.desired_accel = currentnode.script_accel;
        } else {
            self.desired_speed = 30 + randomint(20);
            self.desired_accel = 15 + randomint(15);
        }
        if (self.helitype == "flares") {
            self.desired_speed = self.desired_speed * 0.5;
            self.desired_accel = self.desired_accel * 0.5;
        }
        if (isdefined(nextnode.script_delay) && isdefined(self.primarytarget) && !heli_is_threatened()) {
            _setvehgoalpos(nextnode.origin + self.zoffset, 1, 1);
            self waittill("near_goal");
            wait(nextnode.script_delay);
        } else {
            _setvehgoalpos(nextnode.origin + self.zoffset, 0, 1);
            self waittill("near_goal");
            self setgoalyaw(nextnode.angles[1]);
            self waittill("goal");
        }
        currentnode = nextnode;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x397d
// Size: 0x14e
function heli_loop_speed_control(currentnode) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    if (isdefined(currentnode.script_airspeed) && isdefined(currentnode.script_accel)) {
        self.desired_speed = currentnode.script_airspeed;
        self.desired_accel = currentnode.script_accel;
    } else {
        self.desired_speed = 30 + randomint(20);
        self.desired_accel = 15 + randomint(15);
    }
    var_e803426d2abadfc0 = 0;
    var_b1d46319aa26b913 = 0;
    while (1) {
        var_af03a5ac7d47d6cd = self.desired_speed;
        var_4c3fe0af18132696 = self.desired_accel;
        if (isdefined(self.isattacking) && self.isattacking) {
            waitframe();
            continue;
        }
        if (self.helitype != "flares" && isdefined(self.primarytarget) && !heli_is_threatened()) {
            var_af03a5ac7d47d6cd = var_af03a5ac7d47d6cd * 0.25;
        }
        if (var_e803426d2abadfc0 != var_af03a5ac7d47d6cd || var_b1d46319aa26b913 != var_4c3fe0af18132696) {
            self vehicle_setspeed(75, 35);
            var_e803426d2abadfc0 = var_af03a5ac7d47d6cd;
            var_b1d46319aa26b913 = var_4c3fe0af18132696;
        }
        wait(0.05);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad2
// Size: 0x2b
function heli_is_threatened() {
    if (self.recentdamageamount > 50) {
        return 1;
    }
    if (self.currentstate == "heavy smoke") {
        return 1;
    }
    return 0;
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b05
// Size: 0x175
function heli_fly_well(destnodes) {
    self notify("flying");
    self endon("flying");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    for (;;) {
        for (;;) {
            if (isdefined(self.isattacking) && self.isattacking) {
                waitframe();
                continue;
            }
            currentnode = get_best_area_attack_node(destnodes);
            traveltonode(currentnode);
            if (isdefined(currentnode.script_airspeed) && isdefined(currentnode.script_accel)) {
                heli_speed = currentnode.script_airspeed;
                heli_accel = currentnode.script_accel;
            } else {
                heli_speed = 30 + randomint(20);
                heli_accel = 15 + randomint(15);
            }
            self vehicle_setspeed(75, 35);
            _setvehgoalpos(currentnode.origin + self.zoffset, 1);
            self setgoalyaw(currentnode.angles[1] + level.heli_angle_offset);
            if (level.heli_forced_wait != 0) {
                self waittill("near_goal");
                wait(level.heli_forced_wait);
                continue;
            }
            if (!isdefined(currentnode.script_delay)) {
                self waittill("near_goal");
                wait(5 + randomint(5));
                continue;
            }
            self waittill("goal");
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c81
// Size: 0x13
function get_best_area_attack_node(destnodes) {
    return updateareanodes(destnodes);
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9c
// Size: 0x14f
function heli_leave(var_58cf87ea08ab452e) {
    self notify("leaving");
    self clearlookatent();
    if (isdefined(self.helitype) && self.helitype == "osprey" && isdefined(self.pathgoal)) {
        _setvehgoalpos(self.pathgoal, 1);
        waittill_any_timeout_1(5, "goal");
    }
    if (!isdefined(var_58cf87ea08ab452e)) {
        leavenode = level.heli_leave_nodes[randomint(level.heli_leave_nodes.size)];
        var_58cf87ea08ab452e = leavenode.origin;
    }
    var_60347fd2432f3a63 = spawn("script_origin", var_58cf87ea08ab452e);
    if (isdefined(var_60347fd2432f3a63)) {
        self setlookatent(var_60347fd2432f3a63);
        var_60347fd2432f3a63 thread wait_and_delete(3);
    }
    var_b2805e2f86ac4904 = (var_58cf87ea08ab452e - self.origin) * 2000;
    heli_reset();
    self vehicle_setspeed(180, 45);
    _setvehgoalpos(var_b2805e2f86ac4904, 1);
    waittill_any_timeout_1(12, "goal");
    self notify("gone");
    self notify("death");
    waitframe();
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    decrementfauxvehiclecount();
    self delete();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df2
// Size: 0x23
function wait_and_delete(waittime) {
    self endon("death");
    level endon("game_ended");
    wait(waittime);
    self delete();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1c
// Size: 0x59
function debug_print3d(message, color, ent, origin_offset, frames) {
    if (isdefined(level.heli_debug) && level.heli_debug == 1) {
        thread draw_text(message, color, ent, origin_offset, frames);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3e7c
// Size: 0x7e
function debug_print3d_simple(message, ent, offset, frames) {
    if (isdefined(level.heli_debug) && level.heli_debug == 1) {
        if (isdefined(frames)) {
            thread draw_text(message, (0.8, 0.8, 0.8), ent, offset, frames);
        } else {
            thread draw_text(message, (0.8, 0.8, 0.8), ent, offset, 0);
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3f01
// Size: 0x84
function debug_line(from, to, color, frames) {
    if (isdefined(level.heli_debug) && level.heli_debug == 1 && !isdefined(frames)) {
        thread draw_line(from, to, color);
    } else if (isdefined(level.heli_debug) && level.heli_debug == 1) {
        thread draw_line(from, to, color, frames);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f8c
// Size: 0xa7
function draw_text(msg, color, ent, offset, frames) {
    if (frames == 0) {
        while (isdefined(ent)) {
            /#
                print3d(ent.origin + offset, msg, color, 0.5, 4);
            #/
            wait(0.05);
        }
    } else {
        for (i = 0; i < frames; i++) {
            if (!isdefined(ent)) {
                break;
            }
            /#
                print3d(ent.origin + offset, msg, color, 0.5, 4);
            #/
            wait(0.05);
        }
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403a
// Size: 0x68
function draw_line(from, to, color, frames) {
    /#
        if (isdefined(frames)) {
            for (i = 0; i < frames; i++) {
                line(from, to, color);
                wait(0.05);
            }
        } else {
            for (;;) {
                line(from, to, color);
                wait(0.05);
            }
        }
    #/
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40a9
// Size: 0x40
function exceededmaxlittlebirds(streakname) {
    if (level.littlebirds.size >= 4 || level.littlebirds.size >= 2 && streakname == "littlebird_flock") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40f0
// Size: 0x4c
function pavelowmadeselectionvo() {
    self endon("death_or_disconnect");
    self playlocalsound(game["voice"][self.team] + "KS_hqr_pavelow");
    wait(3.5);
    self playlocalsound(game["voice"][self.team] + "KS_pvl_inbound");
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4143
// Size: 0x69
function lbonkilled() {
    self endon("gone");
    if (!isdefined(self)) {
        return;
    }
    self notify("crashing");
    if (isdefined(self.largeprojectiledamage) && self.largeprojectiledamage) {
        waitframe();
    } else {
        self vehicle_setspeed(25, 5);
        thread lbspin(randomintrange(180, 220));
        wait(randomfloatrange(1, 2));
    }
    lbexplode();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b3
// Size: 0x8b
function lbspin(speed) {
    self endon("explode");
    playfxontag(level.chopper_fx["explode"]["medium"], self, "tail_rotor_jnt");
    thread trail_fx(level.chopper_fx["smoke"]["trail"], "tail_rotor_jnt", "stop tail smoke");
    self setyawspeed(speed, speed, speed);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.9);
        wait(1);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4245
// Size: 0x98
function lbexplode() {
    forward = self.origin + (0, 0, 1) - self.origin;
    var_27bc369e650add5 = self gettagangles("tag_deathfx");
    playfx(level.chopper_fx["explode"]["air_death"]["littlebird"], self gettagorigin("tag_deathfx"), anglestoforward(var_27bc369e650add5), anglestoup(var_27bc369e650add5));
    self playsound("exp_helicopter_fuel");
    self notify("explode");
    removelittlebird();
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e4
// Size: 0x41
function trail_fx(trail_fx, trail_tag, stop_notify) {
    self notify(stop_notify);
    self endon(stop_notify);
    self endon("death");
    while (1) {
        playfxontag(trail_fx, self, trail_tag);
        wait(0.05);
    }
}

// Namespace helicopter/namespace_f88f890445eec227
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x432c
// Size: 0x108
function removelittlebird() {
    if (isdefined(self.mgturretleft)) {
        if (isdefined(self.mgturretleft.killcament)) {
            self.mgturretleft.killcament delete();
        }
        self.mgturretleft delete();
    }
    if (isdefined(self.mgturretright)) {
        if (isdefined(self.mgturretright.killcament)) {
            self.mgturretright.killcament delete();
        }
        self.mgturretright delete();
    }
    if (isdefined(self.marker)) {
        self.marker delete();
    }
    if (isdefined(level.heli_pilot[self.team]) && level.heli_pilot[self.team] == self) {
        level.heli_pilot[self.team] = undefined;
    }
    decrementfauxvehiclecount();
    self delete();
}

