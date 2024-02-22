// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\potg.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\cp_mp\pet_watch.gsc;

#namespace namespace_bc0fc4dcb86d0ecb;

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a2
// Size: 0x96
function init() {
    if (!level.potgenabled) {
        return;
    }
    level.potgglobals.eventdata = spawnstruct();
    var_584994fab4a8712b = level.potgglobals.eventdata;
    var_584994fab4a8712b.lastkillearner = undefined;
    var_584994fab4a8712b.lastkilltime = undefined;
    if (level.teambased) {
        var_584994fab4a8712b.lastteamkillearners = [];
        var_584994fab4a8712b.lastteamkilltimes = [];
    }
    /#
        setdevdvarifuninitialized(@"hash_c6cd6bf543f12f2e", 0);
    #/
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0xa
function onpotgrecordingstopped() {
    clearshotgroup();
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x650
// Size: 0x47
function getentityeventdata() {
    var_7b24b5e5d5d725a5 = namespace_ab70c875589b8f6a::getentitypotgdata(self);
    if (!isdefined(var_7b24b5e5d5d725a5)) {
        return;
    }
    if (!isdefined(var_7b24b5e5d5d725a5.trackingdata)) {
        var_7b24b5e5d5d725a5.trackingdata = createentityeventdata();
    }
    return var_7b24b5e5d5d725a5.trackingdata;
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0x62
function createentityeventdata() {
    eventdata = spawnstruct();
    eventdata.shotgroupactive = 0;
    eventdata.var_1031746bc29117fa = 0;
    eventdata.shotgroupcount = 0;
    eventdata.shotgroupaccuracy = 0;
    eventdata.shotgrouplastcount = 0;
    eventdata.shotgrouplastaccuracy = 0;
    return eventdata;
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x709
// Size: 0x32
function onroundended(winner) {
    var_584994fab4a8712b = level.potgglobals.eventdata;
    handlefinalkill(winner);
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742
// Size: 0xd6
function handlefinalkill(winner) {
    if (!isdefined(winner)) {
        return;
    }
    var_584994fab4a8712b = level.potgglobals.eventdata;
    lastkiller = undefined;
    lastkilltime = undefined;
    if (level.teambased) {
        if (isdefined(var_584994fab4a8712b.lastteamkillearners[winner])) {
            lastkiller = var_584994fab4a8712b.lastteamkillearners[winner];
            lastkilltime = var_584994fab4a8712b.lastteamkilltimes[winner];
        } else {
            lastkiller = var_584994fab4a8712b.lastkillearner;
            lastkilltime = var_584994fab4a8712b.lastkilltime;
        }
    } else {
        lastkiller = var_584994fab4a8712b.lastkillearner;
        lastkilltime = var_584994fab4a8712b.lastkilltime;
    }
    if (isdefined(lastkiller) && isdefined(lastkilltime)) {
        lastkiller namespace_ab70c875589b8f6a::processevent("final_kill", lastkilltime);
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f
// Size: 0x51
function onplayerdamaged(attacker, victim, meansofdeath) {
    if (!level.potgenabled) {
        return;
    }
    if (utility::getdamagetype(meansofdeath) == "splash" && !victim namespace_cd0b2d039510b38d::isspawnprotected()) {
        victim namespace_ab70c875589b8f6a::processevent("hit_by_explosive");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877
// Size: 0x55b
function onplayerkilled(attacker, inflictor, victim, meansofdeath, objweapon, psoffsettime) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    var_584994fab4a8712b = level.potgglobals.eventdata;
    curtime = gettime();
    if (!isplayer(attacker)) {
        return;
    }
    var_daf40a5b49f4efbe = attacker getentityeventdata();
    var_e7287de05f58684b = victim getentityeventdata();
    scoremultiplier = attacker calckillmultiplier(attacker);
    var_cd1741940a0a773b = meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE";
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1, 1, 1);
    var_aa517194e54f048b = physics_raycast(attacker geteye(), victim geteye(), contents, undefined, 0, "physicsquery_closest", 1);
    var_5cb7cacb05744d6b = isdefined(var_aa517194e54f048b) && var_aa517194e54f048b.size > 0;
    var_19f55c21c87989f8 = namespace_3c37cb17ade254d::within_fov(attacker geteye(), attacker getplayerangles(), victim.origin, cos(80));
    var_1c6d69ecd5b91598 = objweapon.basename == "iw8_la_juliet_mp";
    var_252206c84ae187f0 = (var_1c6d69ecd5b91598 || var_cd1741940a0a773b) && (!var_19f55c21c87989f8 || var_5cb7cacb05744d6b);
    if (!var_252206c84ae187f0) {
        attacker namespace_ab70c875589b8f6a::processevent("kill", curtime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    if (isdefined(self.prevlastkilltime) && isdefined(attacker.lastspawntime)) {
        if (attacker.lastspawntime < self.prevlastkilltime) {
            var_72d7fea8136633da = curtime - self.prevlastkilltime;
            if (var_72d7fea8136633da < 1800) {
                var_ea52b3cdc0991cdc = 1 - var_72d7fea8136633da / 1800;
                attacker namespace_ab70c875589b8f6a::processevent("kill_rate_bonus", self.prevlastkilltime, curtime, psoffsettime, undefined, var_ea52b3cdc0991cdc);
            }
        }
    }
    attacker handlekillmodifiers(attacker, meansofdeath, objweapon, victim, scoremultiplier, psoffsettime);
    if (meansofdeath == "MOD_PROJECTILE_SPLASH" && !var_1c6d69ecd5b91598) {
        attacker namespace_ab70c875589b8f6a::processevent("missile_splash_kill", curtime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    if (utility::getdamagetype(meansofdeath) == "splash") {
        if (gettimepassed() <= 12000 && randomintrange(0, 2) == 0) {
            attacker namespace_ab70c875589b8f6a::processevent("round_start_grenade");
        }
    }
    if (istrue(attacker.modifiers["bullet_damage"]) && victim namespace_df478cc572a311d3::molotov_is_burning()) {
        attacker namespace_ab70c875589b8f6a::processevent("victim_on_fire", curtime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    if (attacker namespace_df478cc572a311d3::molotov_is_burning()) {
        attacker namespace_ab70c875589b8f6a::processevent("kill_while_on_fire", curtime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    if (istrue(attacker.modifiers["airborne"])) {
        var_daf40a5b49f4efbe.lastinairkilltime = curtime;
        var_daf40a5b49f4efbe.inairsincelastkill = 1;
        attacker thread watchforpostkilllanding();
    }
    if (isdefined(attacker.lastdooropentime) && curtime - attacker.lastdooropentime < 3500) {
        attacker namespace_ab70c875589b8f6a::processevent("open_door_before_kill", attacker.lastdooropentime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    if (isdefined(attacker.attackerdata) && attacker.attackerdata.size > 3) {
        attacker namespace_ab70c875589b8f6a::processevent("outnumbered", curtime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    if (isdefined(var_e7287de05f58684b.lastteabagtime) && curtime - var_e7287de05f58684b.lastteabagtime < 1000 && randomintrange(0, 2) == 0) {
        attacker namespace_ab70c875589b8f6a::processevent("kill_teabagger", var_e7287de05f58684b.lastteabagtime, curtime, psoffsettime, undefined, scoremultiplier);
    }
    attacker handleequipmentkills(attacker, inflictor, victim, meansofdeath, objweapon, scoremultiplier);
    attacker handlemeleekills(attacker, inflictor, victim, meansofdeath, objweapon, scoremultiplier, psoffsettime);
    if (var_daf40a5b49f4efbe.shotgroupactive) {
        if (var_daf40a5b49f4efbe.shotgroupaccuracy >= 0.9) {
            attacker namespace_ab70c875589b8f6a::processevent("accuracy_good", curtime, curtime, psoffsettime, undefined, scoremultiplier);
        } else if (var_daf40a5b49f4efbe.shotgroupaccuracy <= 0.075) {
            attacker namespace_ab70c875589b8f6a::processevent("accuracy_very_bad", curtime, curtime, psoffsettime, undefined, scoremultiplier);
        } else if (var_daf40a5b49f4efbe.shotgroupaccuracy <= 0.15) {
            attacker namespace_ab70c875589b8f6a::processevent("accuracy_bad", curtime, curtime, psoffsettime, undefined, scoremultiplier);
        }
    }
    if (level.teambased) {
        var_584994fab4a8712b.lastteamkillearners[attacker.team] = attacker;
        var_584994fab4a8712b.lastteamkilltimes[attacker.team] = curtime;
    }
    var_584994fab4a8712b.lastkillearner = attacker;
    var_584994fab4a8712b.lastkilltime = curtime;
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd9
// Size: 0x4a
function calckillmultiplier(attacker) {
    if (function_acab8b716476b589()) {
        return 1;
    }
    scoremultiplier = 1;
    if (!istrue(attacker.modifiers["victim_in_standard_view"])) {
        scoremultiplier = scoremultiplier * 0.15;
    }
    return scoremultiplier;
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2b
// Size: 0xa8
function handlemeleekills(attacker, inflictor, victim, meansofdeath, objweapon, scoremultiplier, psoffsettime) {
    if (function_acab8b716476b589()) {
        return;
    }
    if (meansofdeath == "MOD_MELEE") {
        if (isdefined(attacker.lastspawntime)) {
            var_769cdfc64f9f34e4 = isdefined(attacker.lastshotfiredtime) && attacker.lastshotfiredtime >= attacker.lastspawntime;
            if (!var_769cdfc64f9f34e4) {
                attacker namespace_ab70c875589b8f6a::processevent("no_shots_fired_kill", undefined, undefined, psoffsettime, undefined, scoremultiplier);
            }
        }
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeda
// Size: 0x115
function handleequipmentkills(attacker, inflictor, victim, meansofdeath, objweapon, scoremultiplier) {
    if (function_acab8b716476b589()) {
        return;
    }
    if (isdefined(inflictor) && istrue(inflictor.isequipment)) {
        isthrowingknife = isthrowingknife(objweapon);
        if (isdefined(inflictor.spawnpos)) {
            var_93358d664321f69b = distancesquared(inflictor.spawnpos, inflictor.origin);
            if (isthrowingknife) {
                if (var_93358d664321f69b >= 640000) {
                    attacker namespace_ab70c875589b8f6a::processevent("long_throwing_knife");
                } else {
                    attacker namespace_ab70c875589b8f6a::processevent("throwing_knife");
                }
            } else if (var_93358d664321f69b >= 1440000) {
                attacker namespace_ab70c875589b8f6a::processevent("long_grenade_throw");
            }
        }
        if (gettimepassed() <= 12000) {
            if (isthrowingknife && level.mapname != "mp_shipment") {
                attacker namespace_ab70c875589b8f6a::processevent("round_start_throwing_knife");
            }
        }
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff6
// Size: 0x28e
function handlekillmodifiers(attacker, meansofdeath, objweapon, victim, scoremultiplier, psoffsettime) {
    if (function_acab8b716476b589()) {
        return;
    }
    curtime = gettime();
    var_cf4209c200f8bbf4 = getweapongroup(objweapon);
    foreach (modifier, var_50bf9fee6dd7779c in attacker.modifiers) {
        switch (modifier) {
        case #"hash_b2bbe57b24a8077a":
            if (meansofdeath == "MOD_MELEE") {
                attacker namespace_ab70c875589b8f6a::processevent("backstab", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        case #"hash_e1ae7daca67ccc55":
            if (var_cf4209c200f8bbf4 == "weapon_sniper") {
                attacker namespace_ab70c875589b8f6a::processevent("pointblank_sniper", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            } else {
                attacker namespace_ab70c875589b8f6a::processevent("pointblank", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        case #"hash_13f87da5f89d7b77":
            if (isdefined(attacker.modifiers["ads"])) {
                if (var_cf4209c200f8bbf4 == "weapon_sniper") {
                    attacker namespace_ab70c875589b8f6a::processevent("airborne_ads_sniper_kill", curtime, curtime, psoffsettime, undefined, scoremultiplier);
                } else {
                    attacker namespace_ab70c875589b8f6a::processevent("airborne_ads_kill", curtime, curtime, psoffsettime, undefined, scoremultiplier);
                }
            }
            break;
        case #"hash_487822d5f9b7daac":
            if (var_cf4209c200f8bbf4 == "weapon_sniper") {
                attacker namespace_ab70c875589b8f6a::processevent("victim_airborne_sniper", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            } else {
                attacker namespace_ab70c875589b8f6a::processevent("victim_airborne", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        case #"hash_bbddd8225d923d3":
            if (!isdefined(attacker.modifiers["very_longshot"])) {
                attacker namespace_ab70c875589b8f6a::processevent("longshot", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        case #"hash_74f930d98b6f9343":
            if (var_cf4209c200f8bbf4 != "weapon_sniper" && var_cf4209c200f8bbf4 != "weapon_projectile") {
                attacker namespace_ab70c875589b8f6a::processevent("last_bullet_kill", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        case #"hash_ef0e526485141da2":
            if (var_cf4209c200f8bbf4 == "weapon_sniper") {
                attacker namespace_ab70c875589b8f6a::processevent("victim_sprinting_sniper", curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        default:
            if (namespace_ab70c875589b8f6a::eventtable_isevent(modifier)) {
                attacker namespace_ab70c875589b8f6a::processevent(modifier, curtime, curtime, psoffsettime, undefined, scoremultiplier);
            }
            break;
        }
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128b
// Size: 0x66
function collateral(attacker, numkills) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    if (numkills == 2) {
        attacker namespace_ab70c875589b8f6a::processevent("collateral");
    } else if (numkills == 3) {
        attacker namespace_ab70c875589b8f6a::processevent("triple_collateral");
    } else {
        attacker namespace_ab70c875589b8f6a::processevent("multi_collateral");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f8
// Size: 0x4f
function shotguncollateral(attacker, numkills) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    if (numkills == 2) {
        attacker namespace_ab70c875589b8f6a::processevent("shotgun_collateral");
    } else {
        attacker namespace_ab70c875589b8f6a::processevent("shotgun_multi_collateral");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134e
// Size: 0x42
function quadfeed(player, starttime, endtime) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    player namespace_ab70c875589b8f6a::processevent("quad_feed", starttime, endtime);
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1397
// Size: 0xe5
function processeventforwitnesses(var_5db1449568089a93, maxdistsq, eventref, starttime, endtime) {
    if (function_acab8b716476b589()) {
        return;
    }
    var_6c56b73c06c78ac2 = utility::playersnear(var_5db1449568089a93, 1000);
    foreach (player in var_6c56b73c06c78ac2) {
        if (!isreallyalive(player)) {
            continue;
        }
        var_2c6afbfa1bd5794f = var_5db1449568089a93 - player geteye();
        playerforward = anglestoforward(player getplayerangles());
        if (vectordot(var_2c6afbfa1bd5794f, playerforward) < 0) {
            continue;
        }
        player namespace_ab70c875589b8f6a::processevent(eventref, starttime, endtime);
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1483
// Size: 0x4e
function watchforpostkilllanding() {
    if (function_acab8b716476b589()) {
        return;
    }
    level endon("game_ended");
    self endon("death_or_disconnect");
    eventdata = getentityeventdata();
    while (1) {
        if (self isonground()) {
            eventdata.inairsincelastkill = 0;
            break;
        }
        waitframe();
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d8
// Size: 0x35
function predatormissileimpact(impactpos) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    processeventforwitnesses(impactpos, 1000000, "witness_predator_impact");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1514
// Size: 0x35
function largevehicleexplosion(explosionpos) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    processeventforwitnesses(explosionpos, 640000, "witness_vehicle_explode");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1550
// Size: 0x5f
function vehiclekilled(damagedata) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    if (!isdefined(damagedata.attacker) || !isplayer(damagedata.attacker)) {
        return;
    }
    damagedata.attacker namespace_ab70c875589b8f6a::processevent("vehicle_destroyed");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b6
// Size: 0x30
function missilewhizby(player) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    player namespace_ab70c875589b8f6a::processevent("witness_missile_whizby");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ed
// Size: 0x68
function bombdefused(defuser, var_8f8dc78c3242728b, var_c148dfe3dd8379c8) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    if (var_c148dfe3dd8379c8) {
        defuser namespace_ab70c875589b8f6a::processevent("ninja_defuse");
    } else if (var_8f8dc78c3242728b) {
        defuser namespace_ab70c875589b8f6a::processevent("last_alive_defuse");
    } else {
        defuser namespace_ab70c875589b8f6a::processevent("defuse");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165c
// Size: 0x38
function revivedplayer(reviver, revivee) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    reviver namespace_ab70c875589b8f6a::processevent("revived_ally");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169b
// Size: 0x68
function playerworlddeath(attacker, meansofdeath) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    eventdata = getentityeventdata();
    if (istrue(eventdata.inairsincelastkill)) {
        attacker namespace_ab70c875589b8f6a::processevent("fall_to_death_kill", eventdata.lastinairkilltime, gettime());
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170a
// Size: 0x66
function doorused(player, opening) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        return;
    }
    if (!opening && isdefined(player.lastkilltime) && gettime() - player.lastkilltime < 2000) {
        player namespace_ab70c875589b8f6a::processevent("closed_door_after_kill");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1777
// Size: 0x19f
function playerstancechanged(var_1830f76e65542f4d) {
    if (!level.potgenabled || !(isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo")) {
        return;
    }
    eventdata = getentityeventdata();
    curtime = gettime();
    if (var_1830f76e65542f4d == "crouch") {
        namespace_ab70c875589b8f6a::processevent("recent_crouch");
        if (isdefined(self.lastkillvictimpos)) {
            if (distancesquared(self.lastkillvictimpos, self.origin) < 40000) {
                var_d9398283a059703c = curtime - self.laststancetimes["crouch"];
                if (var_d9398283a059703c < 750) {
                    var_418766af38dd0ed1 = isdefined(self.lastspawntime) && isdefined(eventdata.lastteabagtime) && self.lastspawntime < eventdata.lastteabagtime;
                    if (!var_418766af38dd0ed1) {
                        namespace_ab70c875589b8f6a::processevent("teabag");
                    }
                    if (!isdefined(eventdata.lastteabagtime) || curtime - eventdata.lastteabagtime > 5000) {
                        if (!isdefined(self.pers["teaBags"])) {
                            self.pers["teaBags"] = 0;
                        }
                        self.pers["teaBags"]++;
                        namespace_74465391b3cf76b::addteabagcharge();
                    }
                    eventdata.lastteabagtime = curtime;
                }
            }
        }
    } else if (var_1830f76e65542f4d == "prone") {
        namespace_ab70c875589b8f6a::processevent("recent_prone");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191d
// Size: 0x2a
function shothit() {
    if (!level.potgenabled) {
        return;
    }
    eventdata = getentityeventdata();
    updateshotgroup(1);
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194e
// Size: 0x3c
function shotmissed(totalshots, var_7eb0ccf010359357) {
    if (!level.potgenabled) {
        return;
    }
    eventdata = getentityeventdata();
    updateshotgroup(0, totalshots, var_7eb0ccf010359357);
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1991
// Size: 0xbe
function updateshotgroup(var_85f10a087bbd102f, totalshots, var_7eb0ccf010359357) {
    if (!level.potgenabled) {
        return;
    }
    eventdata = getentityeventdata();
    if (!isdefined(totalshots)) {
        totalshots = 1;
    }
    if (!isdefined(var_7eb0ccf010359357)) {
        if (var_85f10a087bbd102f) {
            var_7eb0ccf010359357 = 1;
        } else {
            var_7eb0ccf010359357 = 0;
        }
    }
    eventdata.var_1031746bc29117fa = eventdata.var_1031746bc29117fa + var_7eb0ccf010359357;
    eventdata.shotgroupcount = eventdata.shotgroupcount + totalshots;
    eventdata.shotgroupaccuracy = eventdata.var_1031746bc29117fa / eventdata.shotgroupcount;
    thread shotgroupendwatcher();
    /#
        thread function_7caeba0dbb5a997f();
    #/
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a56
// Size: 0x60
function shotgroupendwatcher() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("clearShotGroup");
    self notify("shotGroupEndWatcher()");
    self endon("shotGroupEndWatcher()");
    if (!level.potgenabled) {
        return;
    }
    eventdata = getentityeventdata();
    eventdata.shotgroupactive = 1;
    wait(2);
    clearshotgroup();
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abd
// Size: 0x8b
function clearshotgroup() {
    if (!level.potgenabled) {
        return;
    }
    eventdata = getentityeventdata();
    eventdata.shotgroupactive = 0;
    eventdata.shotgrouplastcount = eventdata.shotgroupcount;
    eventdata.shotgrouplastaccuracy = eventdata.shotgroupaccuracy;
    eventdata.var_1031746bc29117fa = 0;
    eventdata.shotgroupcount = 0;
    eventdata.shotgroupaccuracy = 0;
    self notify("clearShotGroup");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4f
// Size: 0x38
function grenadethrownevent(var_4918b66cebc7fbe7) {
    if (!level.potgenabled) {
        return;
    }
    if (var_4918b66cebc7fbe7) {
        namespace_ab70c875589b8f6a::processevent("recent_lethal");
    } else {
        namespace_ab70c875589b8f6a::processevent("recent_tactical");
    }
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8e
// Size: 0x1c
function crouch() {
    if (!level.potgenabled) {
        return;
    }
    namespace_ab70c875589b8f6a::processevent("recent_crouch");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb1
// Size: 0x1c
function jump() {
    if (!level.potgenabled) {
        return;
    }
    namespace_ab70c875589b8f6a::processevent("recent_jump");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd4
// Size: 0x1c
function prone() {
    if (!level.potgenabled) {
        return;
    }
    namespace_ab70c875589b8f6a::processevent("recent_prone");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf7
// Size: 0x1c
function slide() {
    if (!level.potgenabled) {
        return;
    }
    namespace_ab70c875589b8f6a::processevent("recent_slide");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1a
// Size: 0x1c
function mantle() {
    if (!level.potgenabled) {
        return;
    }
    namespace_ab70c875589b8f6a::processevent("recent_mantle");
}

// Namespace namespace_bc0fc4dcb86d0ecb/namespace_57f20ee4fe3eebba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3d
// Size: 0x176
function function_7caeba0dbb5a997f() {
    /#
        level endon("throwing_knife");
        if (isai(self)) {
            return;
        }
        if (getdvarint(@"hash_c6cd6bf543f12f2e", 0) == 0) {
            return;
        }
        eventdata = getentityeventdata();
        if (istrue(eventdata.var_6cf6c23b21b648ba)) {
            return;
        }
        eventdata.var_6cf6c23b21b648ba = 1;
        while (1) {
            printtoscreen2d(100, 400, "victim_airborne_sniper", (1, 0.5, 0.7), 1.5);
            printtoscreen2d(100, 420, ter_op(eventdata.shotgroupactive, "vehicle_destroyed", "closed_door_after_kill"), (1, 0.5, 0.7), 1.5);
            printtoscreen2d(100, 440, "teabag" + eventdata.shotgroupaccuracy, (1, 0.5, 0.7), 1.5);
            printtoscreen2d(100, 460, "<unknown string>" + eventdata.shotgroupcount, (1, 0.5, 0.7), 1.5);
            printtoscreen2d(100, 480, "<unknown string>" + eventdata.shotgrouplastaccuracy, (1, 0.5, 0.7), 1.5);
            printtoscreen2d(100, 500, "<unknown string>" + eventdata.shotgrouplastcount, (1, 0.5, 0.7), 1.5);
            waitframe();
        }
    #/
}

