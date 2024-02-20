// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;

#namespace thermite;

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0
// Size: 0xcd
function thermite_used(grenade, var_e012e0b70d7d54fa) {
    if (isdefined(var_e012e0b70d7d54fa)) {
        glgrenade = grenade;
        grenade = namespace_68e641469fde3fa7::_launchgrenade("thermite_mp", glgrenade.origin, (0, 0, 0));
        namespace_3bbb5a98b932c46f::grenadeinitialize(grenade, makeweapon("thermite_mp"));
        grenade.glgrenade = glgrenade;
        grenade.angles = glgrenade.angles;
        grenade.glgrenadeparent = self getcurrentweapon();
        grenade linkto(glgrenade);
        grenade.exploding = 1;
        grenade setscriptablepartstate("visibility", "hide", 0);
    }
    grenade thread thermite_watchdisowned();
    grenade thread thermite_watchstuck(var_e012e0b70d7d54fa);
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x40
function function_a27a3d57409f4ea6(grenade) {
    grenade endon("missile_stuck");
    var_219a2abcd03a18ba = 0;
    if (namespace_f8065cafc523dba5::function_988138367c74b1f5()) {
        var_219a2abcd03a18ba = 1;
    }
    grenade waittill("missile_water_impact");
    if (!var_219a2abcd03a18ba) {
        grenade notify("missile_stuck");
    }
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x349
function thermite_watchstuck(var_e012e0b70d7d54fa) {
    self endon("death");
    stuckto = undefined;
    if (istrue(var_e012e0b70d7d54fa)) {
        var_172facf3120b4cde = thermite_watchglstuck();
        if (!istrue(var_172facf3120b4cde)) {
            thread thermite_delete();
            return;
        }
        if (isdefined(self.glgrenade)) {
            self.glgrenade delete();
        }
    } else {
        self.owner thread function_a27a3d57409f4ea6(self);
        stuckto = self waittill("missile_stuck");
    }
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    if (!istrue(var_e012e0b70d7d54fa)) {
        if (isdefined(stuckto)) {
            if (isplayer(stuckto) || isagent(stuckto)) {
                thread namespace_3bbb5a98b932c46f::grenadestuckto(self, stuckto);
            } else {
                thread namespace_1a507865f681850e::function_4af015619e2534ba(stuckto, &thermite_destroy, 0);
            }
        }
    }
    weaponobj = self.weapon_object;
    if (isdefined(self.glgrenadeparent)) {
        self.owner function_49967318fbd12317(weaponobj, self.glgrenadeparent);
    }
    thread thermite_watchstucktoterrain();
    test = self.weapon_object.var_8cf493f209855904;
    foreach (thing in test) {
        test2 = 1;
    }
    if (isdefined(self.weapon_object.var_8cf493f209855904["jup_equip_thermite_rec"]) && self.weapon_object.var_8cf493f209855904["jup_equip_thermite_rec"].attachmentdata == "jup_equip_rec_thermite_v2083") {
        self setscriptablepartstate("effects", "impact_v1", 0);
    } else {
        self setscriptablepartstate("effects", "impact", 0);
    }
    thermite_doradiusdamage(weaponobj);
    if (!istrue(level.dangerzoneskipequipment) && isdefined(self.owner.team)) {
        self.dangerzoneid = namespace_b2d5aa2baf2b5701::addspawndangerzone(self.origin, 175, 175, self.owner.team, 100, self.owner, 1, self, 1);
    }
    wait(0.5);
    var_dcba62ab4b6154ed = makeweapon("thermite_av_mp");
    var_dcba5cab4b6147bb = makeweapon("thermite_ap_mp");
    if (isdefined(self.glgrenadeparent)) {
        self.owner function_49967318fbd12317(var_dcba62ab4b6154ed, self.glgrenadeparent);
        self.owner function_49967318fbd12317(var_dcba5cab4b6147bb, self.glgrenadeparent);
    }
    ticks = 1;
    while (ticks <= 10) {
        var_6b3ee446f2845368 = ticks + 1;
        if (mod(var_6b3ee446f2845368, 2) > 0) {
            thermite_doradiusdamage(var_dcba62ab4b6154ed);
        } else {
            thermite_doradiusdamage(var_dcba5cab4b6147bb);
        }
        ticks = var_6b3ee446f2845368;
        wait(0.5);
    }
    thread thermite_destroy();
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64b
// Size: 0x10e
function thermite_watchglstuck() {
    self.glgrenade endon("death");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    normal = position = velocity = surfacetype = var_16a48d7056e5c472 = stuckto = self.glgrenade waittill("missile_stuck");
    if (isdefined(stuckto)) {
        if (isplayer(stuckto) || isagent(stuckto)) {
            if (stuckto namespace_f8065cafc523dba5::_isalive()) {
                if (isplayer(stuckto)) {
                    thread namespace_3bbb5a98b932c46f::grenadestuckto(self, stuckto);
                }
                if (isdefined(var_16a48d7056e5c472)) {
                    self linkto(stuckto);
                } else {
                    self linkto(stuckto, "j_spine4", (0, 0, 0));
                }
            }
        } else if (isdefined(var_16a48d7056e5c472)) {
            self linkto(stuckto, var_16a48d7056e5c472);
        } else {
            self linkto(stuckto);
        }
    }
    return 1;
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x761
// Size: 0xa8
function thermite_watchstucktoterrain() {
    self endon("death");
    stuckto = self getlinkedparent();
    while (isdefined(stuckto)) {
        stuckto = self waittill("missile_stuck");
    }
    if (isdefined(level.var_85f0faee1e7958bb)) {
        self.badplace = function_619cdac2efb21978(self.origin, (125, 125, 125), (0, 0, 0), level.var_85f0faee1e7958bb);
    } else {
        self.badplace = createnavbadplacebybounds(self.origin, (125, 125, 125), (0, 0, 0));
    }
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x810
// Size: 0xfd
function thermite_doradiusdamage(weaponobj) {
    radius = 125;
    innerdamage = 38;
    outerdamage = 15;
    meansofdeath = "MOD_FIRE";
    if (weaponobj.basename == "thermite_mp") {
        radius = 125;
        innerdamage = 45;
        outerdamage = 45;
    }
    stuckto = self.stuckenemyentity;
    if (isdefined(stuckto)) {
        if (isplayer(stuckto) && namespace_f8065cafc523dba5::isreallyalive(stuckto)) {
            stuckto dodamage(innerdamage, self.origin, self.owner, self, meansofdeath, weaponobj, "torso_upper");
            stuckto namespace_169cd7a8fbc76ee5::adddamagemodifier("thermiteStuck", 0, 0, &thermite_damagemodifierignorefunc);
        } else {
            stuckto = undefined;
        }
    }
    self radiusdamage(self.origin, radius, innerdamage, outerdamage, self.owner, meansofdeath, weaponobj);
    if (isdefined(stuckto)) {
        stuckto namespace_169cd7a8fbc76ee5::removedamagemodifier("thermiteStuck", 0);
    }
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x914
// Size: 0x92
function thermite_damagemodifierignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    if (!isdefined(inflictor)) {
        return 1;
    }
    if (!isdefined(inflictor.weapon_name) || inflictor.weapon_name != "thermite_mp") {
        return 1;
    }
    if (!isdefined(inflictor.stuckenemyentity) || inflictor.stuckenemyentity != victim) {
        return 1;
    }
    return 0;
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ae
// Size: 0x31
function thermite_watchdisowned() {
    self endon("death");
    self.owner waittill_any_3("joined_team", "joined_spectators", "disconnect");
    thread thermite_destroy();
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e6
// Size: 0x3c
function thermite_destroy(var_6a94cf09aa6e486e) {
    time = 5;
    if (istrue(var_6a94cf09aa6e486e)) {
        time = undefined;
    }
    self setscriptablepartstate("effects", "burnEnd", 0);
    thread thermite_delete(time);
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa29
// Size: 0x88
function thermite_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    self.exploding = 1;
    if (isdefined(self.dangerzoneid)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzoneid);
        self.dangerzoneid = undefined;
    }
    if (isdefined(self.badplace)) {
        destroynavobstacle(self.badplace);
        self.badplace = undefined;
    }
    self forcehidegrenadehudwarning(1);
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace thermite/namespace_8a5c6d833b2eeab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab8
// Size: 0x58
function thermite_onplayerdamaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    data.victim.lastburntime = gettime();
    data.victim thread namespace_3bbb5a98b932c46f::enableburnfxfortime(0.6);
    return 1;
}

