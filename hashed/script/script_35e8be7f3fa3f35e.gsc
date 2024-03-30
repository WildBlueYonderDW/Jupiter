// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_58be75c518bf0d40;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace tracker_grenade;

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x52e
// Size: 0x3
function autoexec main() {
    
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0xe9
function function_b46c661d38c61aa2(grenade) {
    grenade thread notifyafterframeend("death", "end_explode");
    grenade endon("end_explode");
    grenade thread function_d81cd8f4d92b77bf();
    scripts/cp_mp/challenges::function_b0f754c8a379154e("equip_tracker_grenade", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    grenade setotherent(self);
    grenade thread scripts/mp/damage::monitordamage(19, "hitequip", &function_ad19dd03519e7590, &function_2b0e93490c5184bb);
    scripts/cp_mp/emp_debuff::add_emp_ent(grenade);
    grenade scripts/cp_mp/emp_debuff::set_apply_emp_callback(&function_6572bf82bf990570);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_6572bf82bf990570);
    }
    grenade thread function_4a7db4c5bc06b7c1();
    position = grenade waittill("explode");
    thread function_7eb7507182cfbd94(position, self, grenade.bundle);
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x628
// Size: 0x54
function private function_d81cd8f4d92b77bf() {
    self endon("death");
    self.owner endon("disconnect");
    self endon("missile_stuck");
    var_850fdf3fb1c7eb84, var_53f81081d4e7f40b, var_71c76f81eb0c95ee = self waittill("missile_water_impact");
    self.var_37d6f0688aeef75d = 1;
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x683
// Size: 0x1fa
function function_7eb7507182cfbd94(position, owner, bundle) {
    level endon("game_ended");
    self endon("death");
    owner endon("disconnect");
    if (!isdefined(owner)) {
        return;
    }
    raycontents = physics_createcontents(["physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle"]);
    playertargets = utility::function_2d7fd59d039fa69b(position, bundle.var_59ad6b3e238b636e);
    foreach (player in playertargets) {
        if (!isreallyalive(player)) {
            continue;
        }
        if (!istrue(scripts/cp_mp/utility/player_utility::playersareenemies(owner, player))) {
            continue;
        }
        waitframe();
        if (true) {
            caststart = position;
            castend = player geteye();
            castresult = physics_raycast(caststart, castend, raycontents, undefined, 0, "physicsquery_closest", 1);
            if (isdefined(castresult) && castresult.size > 0) {
                continue;
            }
        }
        scripts/cp_mp/challenges::function_b0f754c8a379154e("equip_tracker_grenade", owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
        thread function_22a929b02dc2e81b(player, owner, bundle);
        gravity = (0, 0, getdvarint(@"hash_b5d7d39d32720e78") * -1);
        velocity = trajectorycalculateinitialvelocity(caststart + (0, 0, 10), castend, gravity, 0.2);
        var_5a5b1ebf69041eb4 = scripts/cp_mp/utility/weapon_utility::_magicbullet(makeweapon(bundle.trackerprojectile), caststart, castend, owner);
        thread function_f12545efae13e24a(player, owner, var_5a5b1ebf69041eb4, bundle);
    }
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x884
// Size: 0x1d3
function function_f12545efae13e24a(victim, attacker, projectile, bundle) {
    level endon("game_ended");
    victim endon("death_or_disconnect");
    projectile endon("death");
    projectile setscriptablepartstate("sound", "deploy", 0);
    projectile setscriptablepartstate("vfx", "deploy", 0);
    thresholddist = 2500;
    projstart = projectile.origin + (0, 0, 10);
    dist = distancesquared(victim.origin, projstart);
    endtime = gettime() + 200;
    for (curtime = gettime(); dist > thresholddist && curtime < endtime; curtime = gettime()) {
        waitframe();
        dist = distancesquared(victim.origin, projstart);
    }
    projectile setscriptablepartstate("sound", "attach", 0);
    projectile setscriptablepartstate("vfx", "off", 0);
    thread function_22a929b02dc2e81b(victim, attacker, bundle);
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (player == victim) {
                self playsoundtoplayer("eqp_tracker_grenade_attach_plr_victim", player, victim);
                continue;
            }
            if (player == attacker) {
                self playsoundtoplayer("eqp_tracker_grenade_attach_plr_attacker", player, victim);
                continue;
            }
            self playsoundtoplayer("eqp_tracker_grenade_attach", player, victim);
        }
    }
    waitframe();
    projectile delete();
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e
// Size: 0x141
function function_22a929b02dc2e81b(victim, attacker, bundle) {
    victim endon("death_or_disconnect");
    level endon("game_ended");
    attacker updatedamagefeedback("");
    victim.var_7ba290cf6ac108d2 = gettime();
    if (isagent(attacker)) {
        waitframe();
        foreach (agent in utility::function_2d7fd59d039fa69b(victim.origin, 800, 0)) {
            if (agent.team == attacker.team) {
                if (agent [[ agent.fnisinstealthcombat ]]()) {
                    agent getenemyinfo(victim);
                    continue;
                }
                agent aieventlistenerevent("player_snapshotted", victim, victim.origin);
            }
        }
        return;
    }
    if (!isreallyalive(victim)) {
        return;
    }
    victim thread function_1134dfb260b1e99b(attacker, bundle);
    if (isplayer(victim)) {
        victim thread function_9972dcbb49d8d21d(bundle);
    }
    attacker scripts/mp/damage::combatrecordtacticalstat("equip_tracker_grenade");
    attacker scripts/mp/utility/stats::incpersstat("trackerGrenadeHits", 1);
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba6
// Size: 0x142
function function_1134dfb260b1e99b(attacker, bundle) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("end_tracker_grenade");
    starttime = gettime();
    activetime = getdvarint(@"hash_a3436ebaeb0a3cbd", bundle.trackerlifetime);
    endtime = starttime + activetime * 1000;
    pinginterval = getdvarint(@"hash_9a9132789a0f9944", bundle.var_b99874467adf0aca);
    var_8b2a2c52afd8dcc5 = getdvarint(@"hash_6e6788aed034a4e2", 50);
    while (gettime() < endtime) {
        if (!istrue(attacker.ksempd)) {
            triggerportableradarpingteam(self.origin, attacker.team, var_8b2a2c52afd8dcc5);
        }
        wait(pinginterval);
    }
    scripts/common/values::reset_all("tracker_grenade_tracked");
    if (isplayer(self)) {
        self stoploopsound("eqp_tracker_grenade_attached_active_beep");
        var_54a1d70014cdc91d = getdvarint(@"hash_ff7342ea5798e687", bundle.var_d0e06a25c0f68c72);
        thread scripts/mp/utility/print::tutorialprint("EQUIPMENT/TRACKER_GRENADE_END", var_54a1d70014cdc91d);
    }
    self notify("end_tracker_grenade");
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcef
// Size: 0x96
function function_aaeb8dea4a14c7aa(holdtime) {
    self endon("continue_tracker_grenade");
    level endon("game_ended");
    self endon("death_or_disconnect");
    self setclientomnvar("ui_securing", 29);
    thread function_3f6100cf048ef82();
    for (timer = 0; timer < holdtime; timer = timer + level.framedurationseconds) {
        time = min(timer / holdtime, 1);
        self setclientomnvar("ui_securing_progress", time);
        waitframe();
    }
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_securing_progress", 0);
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8c
// Size: 0x3a
function function_3f6100cf048ef82() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("end_tracker_grenade");
    self waittill("death");
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_securing_progress", 0);
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcd
// Size: 0x17c
function function_9972dcbb49d8d21d(bundle) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("end_tracker_grenade");
    self playloopsound("eqp_tracker_grenade_attached_active_beep");
    holdtime = getdvarfloat(@"hash_e259cbab7b3ad588", bundle.var_6112f4a7b9e1f7ca);
    hinttime = getdvarint(@"hash_a3436ebaeb0a3cbd", bundle.trackerlifetime);
    var_54a1d70014cdc91d = getdvarint(@"hash_ff7342ea5798e687", bundle.var_d0e06a25c0f68c72);
    scripts/common/values::set_array("tracker_grenade_tracked", ["weapon_pickup"], 0);
    if (self usinggamepad()) {
        thread function_ec8584a808217f12("EQUIPMENT/TRACKER_GRENADE_HOLD", hinttime);
    } else {
        thread function_ec8584a808217f12("EQUIPMENT/TRACKER_GRENADE_HOLD_KB", hinttime);
    }
    thread function_c4601b0b1f0ffe8a(bundle);
    thread function_60d4909afe45acbe();
    while (true) {
        self waittill("stop_tracker_grenade");
        scripts/mp/supers::function_c1c41a5273f29351("gesture_tracker_grenade_remove_mp", 1);
        thread function_aaeb8dea4a14c7aa(holdtime);
        result = waittill_any_timeout_1(holdtime, "continue_tracker_grenade");
        if (result == "continue_tracker_grenade") {
            self setclientomnvar("ui_securing", 0);
            self setclientomnvar("ui_securing_progress", 0);
            continue;
        }
        scripts/common/values::reset_all("tracker_grenade_tracked");
        self stoploopsound("eqp_tracker_grenade_attached_active_beep");
        thread scripts/mp/utility/print::tutorialprint("EQUIPMENT/TRACKER_GRENADE_END", var_54a1d70014cdc91d);
        self notify("end_tracker_grenade");
    }
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf50
// Size: 0x6f
function function_60d4909afe45acbe() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("end_tracker_grenade");
    holdtimer = 0;
    while (true) {
        buttonpressed = self reloadbuttonpressed();
        if (buttonpressed) {
            if (holdtimer > 0.35) {
                self notify("stop_tracker_grenade");
            }
            holdtimer = holdtimer + level.framedurationseconds;
        } else {
            holdtimer = 0;
            self notify("continue_tracker_grenade");
        }
        waitframe();
    }
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc6
// Size: 0x36
function function_ec8584a808217f12(msg, hinttime) {
    self endon("stop_tracker_grenade");
    if (!isdefined(self) || !isreallyalive(self)) {
        return;
    }
    scripts/mp/utility/print::tutorialprint(msg, hinttime);
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1003
// Size: 0xb2
function function_c4601b0b1f0ffe8a(bundle) {
    self endon("end_tracker_grenade");
    level endon("game_ended");
    self endon("death_or_disconnect");
    var_e2b6708ab0acbb38 = self waittill("stop_tracker_grenade_thirdparty");
    if (isdefined(var_e2b6708ab0acbb38) && isplayer(var_e2b6708ab0acbb38)) {
        var_e2b6708ab0acbb38 thread scripts/mp/utility/points::doScoreEvent(#"destroyed_equipment", var_e2b6708ab0acbb38.currentprimaryweapon);
    }
    scripts/common/values::reset_all("tracker_grenade_tracked");
    var_54a1d70014cdc91d = getdvarint(@"hash_ff7342ea5798e687", bundle.var_d0e06a25c0f68c72);
    thread scripts/mp/utility/print::tutorialprint("EQUIPMENT/TRACKER_GRENADE_END", var_54a1d70014cdc91d);
    self notify("end_tracker_grenade");
    self stoploopsound("eqp_tracker_grenade_attached_active_beep");
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10bc
// Size: 0x9c
function function_4b64a3e1fc32a982(var_5c911c4e7ce59792) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("end_tracker_grenade");
    if (scripts/cp_mp/utility/player_utility::_isalive()) {
        if (var_5c911c4e7ce59792) {
            scripts/common/values::set_array("tracker_grenade_removal", ["weapon", "allow_movement", "weapon_pickup", "sprint", "weapon_switch", "offhand_weapons", "melee", "execution_attack", "ladder_placement"], 0);
            return;
        }
        scripts/common/values::reset_all("tracker_grenade_removal");
    }
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115f
// Size: 0x83
function function_a0444bbae34753bb() {
    self setscriptablepartstate("destroy", "active", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    self setscriptablepartstate("dust", "neutral", 0);
    self setscriptablepartstate("water", "neutral", 0);
    self setscriptablepartstate("detect", "neutral", 0);
    self setscriptablepartstate("anims", "neutral", 0);
    self missilehidetrail();
    thread function_1cd780b65cb4e2e0(0.35);
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e9
// Size: 0x43
function function_1cd780b65cb4e2e0(delay) {
    self notify("death");
    scripts/cp_mp/ent_manager::deregisterspawn();
    self endon("death");
    self.exploding = 1;
    self setcandamage(0);
    if (isdefined(delay)) {
        wait(delay);
    }
    self delete();
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1233
// Size: 0xd2
function function_2b0e93490c5184bb(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    if (isbulletdamage(meansofdeath)) {
        if (isdefined(objweapon)) {
            hits = 1;
            if (damage >= scripts/mp/weapons::minegettwohitthreshold()) {
                hits = hits + 1;
            }
            if (scripts/mp/utility/damage::isfmjdamage(objweapon, meansofdeath)) {
                hits = hits * 2;
            }
            damage = hits * 19;
        }
    }
    scripts/mp/weapons::equipmenthit(self.owner, attacker, objweapon, meansofdeath);
    return damage;
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130d
// Size: 0x5f
function function_ad19dd03519e7590(data) {
    attacker = data.attacker;
    if (isdefined(attacker) && scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self, data.objweapon);
    }
    thread function_a0444bbae34753bb();
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1373
// Size: 0x76
function function_6572bf82bf990570(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self, undefined, 1);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    thread function_a0444bbae34753bb();
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f0
// Size: 0x1e
function function_4a7db4c5bc06b7c1() {
    self endon("death");
    function_68d0712494ec6197();
    if (isdefined(self)) {
        thread function_a0444bbae34753bb();
    }
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1415
// Size: 0x40
function function_68d0712494ec6197() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    while (true) {
        waitframe();
    }
}

// Namespace tracker_grenade / namespace_2685021acd20134
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145c
// Size: 0x22
function function_88b7b96152f86153(dangericon) {
    dangericon endon("death");
    self waittill("death");
    dangericon delete();
}

