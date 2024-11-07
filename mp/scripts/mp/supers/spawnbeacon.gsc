#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\damage.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\weapons.gsc;

#namespace spawnbeacon;

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20b
// Size: 0x1c
function init() {
    level._effect["vfx_spawn_beacon_smoke"] = loadfx("vfx/iw8_mp/_requests/vfx_spawn_beacon_smoke.vfx");
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x10
function beginuse() {
    self giveandfireoffhand("tac_ops_spawn_grenade_mp");
    return true;
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x159
function thrown(grenade) {
    if (!isdefined(level.tacopsspawnbeacons)) {
        level.tacopsspawnbeacons = [];
    }
    oldbeacon = level.tacopsspawnbeacons[grenade.owner.team];
    if (isdefined(level.tacopsspawnbeacons[grenade.owner.team])) {
        oldbeacon thread dovisualdeath();
        level.tacopsspawnbeacons[grenade.owner.team] = undefined;
    }
    level.tacopsspawnbeacons[grenade.owner.team] = grenade;
    grenade.team = grenade.owner.team;
    grenade.throwangles2d = (grenade.angles[0], grenade.angles[1], 0);
    grenade waittill("missile_stuck");
    playfxontag(getfx("vfx_spawn_beacon_smoke"), grenade, "tag_origin");
    grenade thread scripts\cp_mp\entityheadicons::setheadicon_factionimage(0, 20, undefined, undefined, undefined, 0.1);
    grenade addtotacopsmap();
    grenade thread ownermonitor();
    grenade thread damagemonitor();
    grenade thread deathmonitor();
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9
// Size: 0x168
function damagemonitor() {
    self endon("death");
    attacker = undefined;
    self setcandamage(1);
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    self.grenadehealth = 60;
    while (true) {
        self waittill("damage", damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor);
        objweapon = mapweapon(objweapon, inflictor);
        if (!isplayer(attacker) && !isagent(attacker)) {
            continue;
        }
        if (!scripts\mp\weapons::friendlyfirecheck(self.owner, attacker)) {
            continue;
        }
        if (non_player_should_ignore_damage(attacker, objweapon, inflictor, type)) {
            continue;
        }
        self.grenadehealth -= damage;
        if (self.grenadehealth <= 0) {
            break;
        }
        attacker updatedamagefeedback("");
    }
    dovisualdeath();
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x24
function dovisualdeath() {
    playfx(getfx("equipment_sparks"), self.origin);
    self notify("death");
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x545
// Size: 0x2f
function deathmonitor() {
    self waittill("death");
    stopfxontag(getfx("vfx_spawn_beacon_smoke"), self, "tag_origin");
    removefromtacopsmap();
    self delete();
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57c
// Size: 0x36
function ownermonitor() {
    level endon("game_ended");
    self endon("death");
    self.owner waittill_any_3("joined_team", "joined_spectators", "disconnect");
    dovisualdeath();
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ba
// Size: 0x10
function addtotacopsmap() {
    self.getspawninfofunc = &getspawninfo;
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d2
// Size: 0x2
function removefromtacopsmap() {
    
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5dc
// Size: 0x48
function getspawninfo(grenade, player) {
    info = [];
    info["origin"] = determinespawnorigin(grenade, player);
    info["angles"] = determinespawnangles(info["origin"], grenade, player);
    return info;
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62d
// Size: 0x63
function determinespawnorigin(grenade, spawningplayer) {
    pathnodes = getnodesinradiussorted(grenade.origin, 512, 0, 64, "path", 1);
    if (!isdefined(pathnodes) || pathnodes.size <= 0) {
        return grenade.origin;
    }
    return pathnodes[0].origin;
}

// Namespace spawnbeacon / scripts\mp\supers\spawnbeacon
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x699
// Size: 0x164
function determinespawnangles(spawnpos, grenade, spawningplayer) {
    var_510d77329cd1b3b7 = undefined;
    var_9f6ce604177e3317 = undefined;
    foreach (player in level.players) {
        if (player.team != grenade.team && isreallyalive(player) && player != spawningplayer) {
            distsq = distance2dsquared(player.origin, spawnpos);
            if (!isdefined(var_9f6ce604177e3317) || distsq < var_9f6ce604177e3317) {
                var_510d77329cd1b3b7 = player;
                var_9f6ce604177e3317 = distsq;
            }
        }
    }
    if (!isdefined(var_510d77329cd1b3b7)) {
        return grenade.throwangles2d;
    }
    path = spawningplayer findpath(spawnpos, var_510d77329cd1b3b7.origin, 1, 1);
    targetpos = undefined;
    if (path.size <= 1) {
        return grenade.throwangles2d;
    } else {
        targetpos = path[1];
    }
    var_2f36c92c71d2093 = targetpos - spawnpos;
    var_2f36c92c71d2093 = (var_2f36c92c71d2093[0], var_2f36c92c71d2093[1], 0);
    var_1ee149acf5ac75f5 = vectortoangles(var_2f36c92c71d2093);
    return var_1ee149acf5ac75f5;
}

