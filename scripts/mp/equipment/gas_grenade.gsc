// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_74b851b7aa1ef32d;
#using scripts\common\ai.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\perks\perks.gsc;
#using script_7c40fa80892a721;

#namespace gas_grenade;

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591
// Size: 0x94
function gas_used(grenade) {
    self endon("disconnect");
    grenade endon("death");
    team = grenade.owner.team;
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_gas_grenade", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    printgameaction("gasGrenade spawn", grenade.owner);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    thread gas_watchexplode(grenade, team);
    thread function_60397906a6eb5a4f(grenade);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c
// Size: 0x7e
function gas_watchexplode(grenade, team) {
    grenade thread notifyafterframeend("death", "end_explode");
    grenade endon("end_explode");
    owner = grenade.owner;
    position = grenade waittill("explode");
    duration = getdvarfloat(@"hash_6cf4a762721de876", 7);
    thread gas_createtrigger(position, owner, team, duration);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b1
// Size: 0x37
function function_60397906a6eb5a4f(grenade) {
    grenade endon("explode");
    var_7842e9e94384087b = grenade waittill("missile_water_impact");
    grenade notify("end_explode");
    thread function_da09131c75ad4b63(grenade);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ef
// Size: 0x7b
function function_da09131c75ad4b63(grenade) {
    var_a681b7890cd017c7 = grenade waittill("missile_stuck");
    owner = grenade.owner;
    team = grenade.team;
    position = grenade.origin;
    grenade thread gas_createtrigger(position + (0, 0, 10), owner, team);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x771
// Size: 0x193
function gas_onplayerdamaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    if (data.attacker == data.victim) {
        if (distancesquared(data.point, data.victim.origin) > 30625) {
            return 0;
        }
    } else if (isplayer(data.attacker)) {
        data.attacker namespace_3e725f3cc58bddd3::combatrecordtacticalstat("equip_gas_grenade");
        data.attacker namespace_3c5a4254f2b957ea::incpersstat("gasHits", 1);
        namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_gas_grenade", data.attacker, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
        if (data.victim namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist")) {
            data.attacker updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
        }
    }
    if (data.attacker != data.victim) {
        data.attacker namespace_a850435086c88de3::doOnActionScoreEvent(0, "gasGrenadeHit");
    }
    if (function_4cd5239298745de7() && isdefined(self.gasmaskhealth) && self.gasmaskhealth > 0) {
        return 1;
    }
    data.victim thread gas_applycough(data.attacker, 1);
    return 1;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0xa2
function gas_clear(var_fcef8d217a441961) {
    gas_clearspeedredux(var_fcef8d217a441961);
    gas_clearblur(var_fcef8d217a441961);
    gas_clearcough(var_fcef8d217a441961);
    if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (!isdefined(trigger)) {
                continue;
            }
            trigger.playersintrigger[self getentitynumber()] = undefined;
        }
    }
    self.gastriggerstouching = undefined;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b5
// Size: 0x304
function gas_createtrigger(position, owner, team, duration, scale, var_10be75cd2cd034e5, var_644363c75207158d, radius, height, offset) {
    if (!isdefined(var_10be75cd2cd034e5)) {
        var_10be75cd2cd034e5 = 0;
    }
    if (!isdefined(var_644363c75207158d)) {
        var_644363c75207158d = 0;
    }
    if (!isdefined(radius)) {
        radius = 256;
    }
    if (!isdefined(height)) {
        height = 175;
    }
    if (!isdefined(offset)) {
        offset = -57.75;
    }
    if (!isdefined(position)) {
        return;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("pmc_missions", "onGasGrenadeExplode")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onGasGrenadeExplode") ]](position, owner, team);
    }
    if (!isdefined(duration)) {
        duration = 7;
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
        thread namespace_6205bc7c5e394598::function_f8903387ea945165(position, 0);
    }
    radius = radius * scale;
    height = height * scale;
    offset = offset * scale;
    trigger = spawn("trigger_radius", position + (0, 0, offset), 0, radius, height);
    trigger namespace_2a9588dfac284b77::registerspawn(1, &sweepgas);
    badplace = createnavbadplacebybounds(position + (0, 0, int(-57.75 * scale)), (int(256 * scale), int(256 * scale), int(175 * scale)), (0, 0, 0));
    trigger.height = height;
    trigger.radius = radius;
    trigger.duration = duration;
    trigger endon("death");
    trigger.owner = owner;
    trigger.team = team;
    trigger.var_10be75cd2cd034e5 = var_10be75cd2cd034e5;
    trigger.var_644363c75207158d = var_644363c75207158d;
    trigger.playersintrigger = [];
    trigger.var_aeeca2bc23f59ea4 = [];
    trigger.badplace = badplace;
    if (function_4cd5239298745de7()) {
        trigger thread namespace_d20f8ef223912e12::function_4b2456ab9e1c7b81(position);
    }
    trigger thread gas_watchtriggerenter();
    trigger thread gas_watchtriggerexit();
    trigger thread function_b3f6ad35b2a40677(position + (0, 0, offset), radius, height, duration);
    /#
        var_e121df91e1251b4c = getdvarint(@"hash_94521eb2fc22ae59", 0);
        switch (var_e121df91e1251b4c) {
        case 1:
            drawentitybounds(trigger, (1, 0, 0), 0, int(duration / level.framedurationseconds));
            break;
        case 2:
            cylinder(trigger.origin, trigger.origin + (0, 0, height), radius, (1, 0, 0), 0, int(duration / level.framedurationseconds));
            break;
        }
    #/
    wait(duration);
    trigger notify("gas_cleared");
    trigger thread gas_destroytrigger();
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc0
// Size: 0x83
function function_b3f6ad35b2a40677(location, radius, height, duration) {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(location, radius, height, self.owner.team, duration, self.owner, 1, self, 1);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4a
// Size: 0x1c
function function_4cd5239298745de7() {
    return namespace_36f464722d326bbe::isBRStyleGameType() && getdvarint(@"hash_7c4fbf3fce66f376", 0);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6e
// Size: 0x1d
function function_97782fcb5ee69702() {
    return namespace_36f464722d326bbe::isBRStyleGameType() && getdvarint(@"hash_93c3a50d09e1989b", 1);
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd93
// Size: 0xb
function sweepgas() {
    thread gas_destroytrigger();
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda5
// Size: 0xbe
function gas_destroytrigger() {
    foreach (player in self.playersintrigger) {
        if (!isdefined(player)) {
            continue;
        }
        self.playersintrigger[player getentitynumber()] = undefined;
        player thread gas_onexittrigger(self getentitynumber());
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isdefined(self.badplace)) {
        destroynavobstacle(self.badplace);
    }
    self delete();
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6a
// Size: 0x245
function gas_onentertrigger(trigger) {
    if (!isdefined(self.gastriggerstouching)) {
        self.gastriggerstouching = [];
    }
    entnum = trigger getentitynumber();
    self.gastriggerstouching[entnum] = trigger;
    self.lastgastouchtime = gettime();
    if (getdvarint(@"hash_9ae216012f64affd") && isdefined(trigger.owner.Chemist)) {
        if (issharedfuncdefined("warlord_chemist", "periodicdamage")) {
            thread function_f3bb4f4911a1beb2("warlord_chemist", "periodicdamage", trigger.owner.Chemist.var_6611564090223dab, trigger.owner.Chemist.var_2278441f7203ae, trigger.owner);
        }
        if (isdefined(self.gasmaskhealth)) {
            if (self.gasmaskhealth > 0) {
                if (isdefined(level.var_f26b4e7eb9af8155)) {
                    self [[ level.var_f26b4e7eb9af8155 ]]("gas_grenade");
                }
                return entnum;
            }
        }
        if (issharedfuncdefined("warlord_chemist", "gasmask_watcher") && !istrue(self.gasmaskequipped)) {
            thread function_f3bb4f4911a1beb2("warlord_chemist", "gasmask_watcher");
        }
    }
    if (function_4cd5239298745de7() && isdefined(self.gasmaskhealth) && self.gasmaskhealth > 0) {
        return;
    }
    if (function_97782fcb5ee69702()) {
        thread function_3a3f27425a46d2cb(trigger);
    }
    if (self.gastriggerstouching.size >= 1) {
        thread gas_applyspeedredux();
        thread gas_applyblur();
    }
    if (self.gastriggerstouching.size == 1) {
        thread gas_applycough(trigger.owner, 0);
        namespace_e765f0aad2368473::enableloopingcoughaudio(trigger.owner);
    }
    CodcasterSetPlayerStatusEffect("gas", -1);
    if (getdvarint(@"hash_9ae216012f64affd") && !istrue(self.var_ce8d114cc1b073db) && issharedfuncdefined("warlord_chemist", "removegastriggers")) {
        self.var_ce8d114cc1b073db = 1;
        thread function_f3bb4f4911a1beb2("warlord_chemist", "removegastriggers");
    }
    return entnum;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b7
// Size: 0x9d
function gas_onexittrigger(var_b2907a4520674f1a) {
    /#
        assertex(isdefined(var_b2907a4520674f1a), "gas_onExitTrigger called with an invalid trigger ID.");
    #/
    if (!isdefined(self.gastriggerstouching)) {
        return;
    }
    self.gastriggerstouching[var_b2907a4520674f1a] = undefined;
    self.lastgastouchtime = gettime();
    if (self.gastriggerstouching.size == 0) {
        if (isdefined(level.var_f26b4e7eb9af8155)) {
            self [[ level.var_c57ee1e174e42601 ]]("gas_grenade");
        }
        CodcasterSetPlayerStatusEffect("gas", 0);
        thread gas_removespeedredux();
        thread gas_removeblur();
        namespace_e765f0aad2368473::disableloopingcoughaudio();
        self notify("gas_exited");
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115b
// Size: 0x1f8
function gas_watchtriggerenter() {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (!isdefined(player)) {
            continue;
        }
        if (!isplayer(player)) {
            if (isagent(player)) {
                if (isdefined(self.owner) && player namespace_448ccf1ca136fbbe::function_ec40425fb125f6cf("tear_gas", self.owner.team)) {
                    continue;
                }
                if (!array_contains(self.var_aeeca2bc23f59ea4, player) || isdefined(player.flashendtime) && player.flashendtime < gettime()) {
                    self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size] = player;
                    if (isdefined(player.var_65771500f49956c1) && player.var_65771500f49956c1) {
                        continue;
                    }
                    player notify("flashbang", player.origin);
                }
                if (utility::issharedfuncdefined("ai", "gasGrenade_onGasTrigger")) {
                    player thread [[ utility::getsharedfunc("ai", "gasGrenade_onGasTrigger") ]](self);
                }
            }
            continue;
        }
        if (player namespace_a2f809133c566621::isjuggernaut()) {
            continue;
        }
        if (function_da8a31143b88e833(player)) {
            continue;
        }
        if (!player namespace_f8065cafc523dba5::_isalive()) {
            continue;
        }
        if (isdefined(self.playersintrigger[player getentitynumber()])) {
            continue;
        }
        if (level.teambased) {
            if (isdefined(self.owner) && isalive(self.owner)) {
                if (player != self.owner && !namespace_f8065cafc523dba5::playersareenemies(player, self.owner)) {
                    continue;
                }
            } else if (namespace_f8065cafc523dba5::isfriendly(self.team, player)) {
                continue;
            }
        }
        self.playersintrigger[player getentitynumber()] = player;
        player thread gas_onentertrigger(self);
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135a
// Size: 0xb7
function gas_watchtriggerexit() {
    self endon("death");
    while (1) {
        foreach (id, player in self.playersintrigger) {
            if (!isdefined(player)) {
                self.playersintrigger[id] = undefined;
            } else {
                if (!player namespace_f8065cafc523dba5::_isalive()) {
                    continue;
                }
                if (player istouching(self) && !function_da8a31143b88e833(player)) {
                    continue;
                }
                self.playersintrigger[player getentitynumber()] = undefined;
                player thread gas_onexittrigger(self getentitynumber());
            }
        }
        waitframe();
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1418
// Size: 0x19
function function_da8a31143b88e833(player) {
    if (player function_7ee20cf3c0390e21()) {
        return 1;
    }
    return 0;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1439
// Size: 0xac
function gas_applycough(attacker, var_e81764066eb9bacb) {
    var_a15ffac7e41222a2 = namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist");
    var_8907f741f3a7b3f7 = isdefined(attacker) && self == attacker;
    if (!var_8907f741f3a7b3f7 && var_a15ffac7e41222a2 || istrue(self.var_a6637f42471575bc)) {
        return;
    }
    var_dd1cf0b2b3066ed4 = 0;
    if (istrue(var_e81764066eb9bacb)) {
        var_dd1cf0b2b3066ed4 = 1;
        if (var_8907f741f3a7b3f7) {
            var_dd1cf0b2b3066ed4 = 0;
            /#
                if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                    var_dd1cf0b2b3066ed4 = 1;
                }
            #/
        }
    }
    if (!istrue(self.gascoughinprogress) || istrue(var_e81764066eb9bacb)) {
        thread gas_queuecough(var_dd1cf0b2b3066ed4);
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0xd8
function gas_queuecough(var_dd1cf0b2b3066ed4) {
    self endon("death_or_disconnect");
    self endon("gas_clear_cough");
    self endon("gas_exited");
    self notify("gas_queue_cough");
    self endon("gas_queue_cough");
    var_fff525b27a42fc40 = gettime() + 1000;
    while (gas_coughisblocked()) {
        waitframe();
    }
    if (var_dd1cf0b2b3066ed4 && gettime() > var_fff525b27a42fc40) {
        var_dd1cf0b2b3066ed4 = 0;
    }
    var_81b4070b5858078d = getdvarint(@"hash_827901421ad0679", 1) == 1;
    if (var_81b4070b5858078d) {
        thread gas_begincoughing(var_dd1cf0b2b3066ed4);
    } else {
        self endon("gas_begin_coughing");
        self.gascoughinprogress = 1;
        if (var_dd1cf0b2b3066ed4) {
            self playgestureviewmodel("iw9_ges_gas_cough_long");
            wait(3.33);
        } else {
            self playgestureviewmodel("iw9_ges_gas_cough");
            wait(1.833);
        }
        self.gascoughinprogress = undefined;
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15cb
// Size: 0x144
function gas_begincoughing(var_dd1cf0b2b3066ed4) {
    self endon("death_or_disconnect");
    self endon("gas_clear_cough");
    self notify("gas_begin_coughing");
    self endon("gas_begin_coughing");
    if (!isnullweapon(self getheldoffhand())) {
        childthread gas_takeheldoffhand();
    }
    self.gascoughinprogress = 1;
    if (self hasweapon(makeweapon("gas_cough_light_mp"))) {
        _takeweapon("gas_cough_light_mp");
    }
    if (self hasweapon(makeweapon("gas_cough_heavy_mp"))) {
        _takeweapon("gas_cough_heavy_mp");
    }
    weaponobj = ter_op(istrue(var_dd1cf0b2b3066ed4), makeweapon("gas_cough_heavy_mp"), makeweapon("gas_cough_light_mp"));
    duration = ter_op(istrue(var_dd1cf0b2b3066ed4), 3.33, 1.833);
    val::set("gas_grenade", "supers", 0);
    self giveandfireoffhand(weaponobj);
    childthread gas_monitorcoughweaponfired(weaponobj);
    childthread gas_monitorcoughweapontaken(weaponobj);
    childthread gas_monitorcoughduration(duration);
    waittill_any_3("gas_coughWeaponFired", "gas_coughWeaponTaken", "gas_coughDuration");
    val::reset("gas_grenade", "supers");
    if (self hasweapon(weaponobj)) {
        _takeweapon(weaponobj);
    }
    self.gascoughinprogress = undefined;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1716
// Size: 0x3f
function gas_removecough(var_fcef8d217a441961) {
    self notify("gas_queue_cough");
    self notify("gas_begin_coughing");
    self.gascoughinprogress = undefined;
    if (!istrue(var_fcef8d217a441961)) {
        if (isdefined(self.gastakenweaponobj)) {
            gas_restoreheldoffhand();
        }
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175c
// Size: 0xba
function gas_clearcough(var_fcef8d217a441961) {
    self notify("gas_queue_cough");
    self notify("gas_begin_coughing");
    self.gascoughinprogress = undefined;
    if (!istrue(var_fcef8d217a441961)) {
        var_81b4070b5858078d = getdvarint(@"hash_827901421ad0679", 1) == 1;
        if (var_81b4070b5858078d) {
            if (self hasweapon(makeweapon("gas_cough_light_mp"))) {
                _takeweapon("gas_cough_light_mp");
            }
            if (self hasweapon(makeweapon("gas_cough_heavy_mp"))) {
                _takeweapon("gas_cough_heavy_mp");
            }
            if (isdefined(self.gastakenweaponobj)) {
                gas_restoreheldoffhand();
            }
        } else {
            self stopgestureviewmodel("iw9_ges_gas_cough");
            self stopgestureviewmodel("iw9_ges_gas_cough_long");
        }
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181d
// Size: 0x4a
function gas_monitorcoughweaponfired(var_33f644489e4f15ae) {
    self endon("gas_coughWeaponTaken");
    self endon("gas_coughDuration");
    while (1) {
        weaponobj = self waittill("offhand_fired");
        if (issameweapon(weaponobj, var_33f644489e4f15ae)) {
            break;
        }
    }
    self notify("gas_coughWeaponFired");
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186e
// Size: 0x30
function gas_monitorcoughweapontaken(var_33f644489e4f15ae) {
    self endon("gas_coughWeaponFired");
    self endon("gas_coughDuration");
    while (self hasweapon(var_33f644489e4f15ae)) {
        waitframe();
    }
    self notify("gas_coughWeaponTaken");
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a5
// Size: 0x24
function gas_monitorcoughduration(var_dc7d7db6d1535605) {
    self endon("gas_coughWeaponTaken");
    self endon("gas_coughWeaponFired");
    wait(var_dc7d7db6d1535605);
    self notify("gas_coughDuration");
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d0
// Size: 0x169
function gas_takeheldoffhand() {
    if (isdefined(self.gastakenweaponobj)) {
        gas_restoreheldoffhand();
    }
    self endon("gas_restoreHeldOffhand");
    self.gastakenweaponobj = self getheldoffhand();
    equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(self.gastakenweaponobj);
    if (isdefined(equipmentref) && namespace_1a507865f681850e::hasequipment(equipmentref)) {
        self.gastakenweaponammo = namespace_1a507865f681850e::getequipmentammo(equipmentref);
        _takeweapon(self.gastakenweaponobj);
        wait(0.05);
        thread gas_restoreheldoffhand();
    }
    var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getsuperrefforsuperoffhand(self.gastakenweaponobj);
    if (isdefined(var_ebec497ff8b18a45)) {
        var_75630a54ff140ec2 = namespace_85d036cb78063c4a::getcurrentsuperref();
        if (isdefined(var_75630a54ff140ec2) && var_75630a54ff140ec2 == var_ebec497ff8b18a45) {
            self.gastakenweaponammo = self getammocount(self.gastakenweaponobj);
            _takeweapon(self.gastakenweaponobj);
            wait(0.05);
            thread gas_restoreheldoffhand();
        }
    }
    isgesture = namespace_68e641469fde3fa7::isgesture(self.gastakenweaponobj);
    if (isgesture) {
        _takeweapon(self.gastakenweaponobj);
        wait(0.05);
        thread gas_restoreheldoffhand();
    }
    self.gastakenweaponammo = self getammocount(self.gastakenweaponobj);
    _takeweapon(self.gastakenweaponobj);
    wait(0.05);
    thread gas_restoreheldoffhand();
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a40
// Size: 0x243
function gas_restoreheldoffhand() {
    self notify("gas_restoreHeldOffhand");
    var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getsuperrefforsuperoffhand(self.gastakenweaponobj);
    if (isdefined(var_ebec497ff8b18a45)) {
        var_75630a54ff140ec2 = namespace_85d036cb78063c4a::getcurrentsuperref();
        if (isdefined(var_75630a54ff140ec2) && var_75630a54ff140ec2 == var_ebec497ff8b18a45) {
            _giveweapon(self.gastakenweaponobj);
            self assignweaponoffhandspecial(self.gastakenweaponobj);
            self setweaponammoclip(self.gastakenweaponobj, self.gastakenweaponammo);
            self.gastakenweaponobj = undefined;
            self.gastakenweaponammo = undefined;
        }
        return;
    }
    equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(self.gastakenweaponobj);
    if (isdefined(equipmentref) && namespace_1a507865f681850e::hasequipment(equipmentref)) {
        if (namespace_1a507865f681850e::hasequipment(equipmentref)) {
            _giveweapon(self.gastakenweaponobj);
            slot = namespace_1a507865f681850e::findequipmentslot(equipmentref);
            /#
                assertex(isdefined(slot) && (slot == "primary" || slot == "secondary"), "gas_restoreHeldOffhand is trying to " + equipmentref + ", but its slot is invalid.");
            #/
            if (slot == "primary") {
                self assignweaponoffhandprimary(self.gastakenweaponobj);
            } else if (slot == "secondary") {
                self assignweaponoffhandsecondary(self.gastakenweaponobj);
            }
            namespace_1a507865f681850e::setequipmentammo(equipmentref, self.gastakenweaponammo);
            self.gastakenweaponobj = undefined;
            self.gastakenweaponammo = undefined;
        }
        return;
    }
    isgesture = namespace_68e641469fde3fa7::isgesture(self.gastakenweaponobj);
    if (isgesture) {
        if (isdefined(self.gestureweapon) && self.gestureweapon == self.gastakenweaponobj.basename) {
            _giveweapon(self.gastakenweaponobj);
            self.gastakenweaponobj = undefined;
        }
        return;
    }
    var_869d09b2ffbc5a27 = namespace_85d036cb78063c4a::function_a465412785d4c550(self.gastakenweaponobj);
    if (var_869d09b2ffbc5a27) {
        self.gastakenweaponobj = undefined;
        return;
    }
    _giveweapon(self.gastakenweaponobj);
    self setweaponammoclip(self.gastakenweaponobj, self.gastakenweaponammo);
    self.gastakenweaponobj = undefined;
    self.gastakenweaponammo = undefined;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8a
// Size: 0x20a
function gas_applyspeedredux() {
    self endon("death_or_disconnect");
    self notify("gas_modify_speed");
    self endon("gas_modify_speed");
    if (isdefined(self.gasspeedmod)) {
        if (self.gasspeedmod < -0.15) {
            if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist")) {
                namespace_b6a8027f477010e1::activatePerk("specialty_tac_resist");
                self.gasspeedmod = -0.15;
                namespace_3bbb5a98b932c46f::updatemovespeedscale();
                return;
            }
            if (isdefined(self.gastriggerstouching)) {
                foreach (trigger in self.gastriggerstouching) {
                    if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                        /#
                            if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                                self.gasspeedmod = 0;
                                goto LOC_00000138;
                            }
                        #/
                        self.gasspeedmod = -0.15;
                        namespace_3bbb5a98b932c46f::updatemovespeedscale();
                        return;
                    }
                }
            }
        }
    } else {
        self.gasspeedmod = 0;
    }
    var_d255a8b6d0ef299d = -0.35;
    if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist")) {
        var_d255a8b6d0ef299d = -0.15;
    } else if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                /#
                    if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                        goto LOC_000001eb;
                    }
                #/
                var_d255a8b6d0ef299d = -0.15;
            }
        }
    }
    gas_modifyspeed(var_d255a8b6d0ef299d);
    self.gasspeedmod = var_d255a8b6d0ef299d;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9b
// Size: 0x40
function gas_removespeedredux() {
    self endon("death_or_disconnect");
    self notify("gas_modify_speed");
    self endon("gas_modify_speed");
    if (!isdefined(self.gasspeedmod)) {
        return;
    }
    gas_modifyspeed(0);
    self.gasspeedmod = undefined;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee2
// Size: 0x62
function gas_modifyspeed(var_d255a8b6d0ef299d) {
    timeelapsed = 0;
    while (timeelapsed <= 0.65) {
        timeelapsed = timeelapsed + 0.05;
        self.gasspeedmod = math::lerp(self.gasspeedmod, var_d255a8b6d0ef299d, min(1, timeelapsed / 0.65));
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        wait(0.05);
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4b
// Size: 0x2a
function gas_clearspeedredux(var_fcef8d217a441961) {
    self notify("gas_modify_speed");
    self.gasspeedmod = undefined;
    if (!istrue(var_fcef8d217a441961)) {
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7c
// Size: 0x104
function gas_applyblur() {
    self endon("death_or_disconnect");
    self notify("gas_modify_blur");
    self endon("gas_modify_blur");
    var_22f87c8bf7c4616b = "gas_grenade_heavy_mp";
    if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist")) {
        var_22f87c8bf7c4616b = "gas_grenade_light_mp";
    } else if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                /#
                    if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                        goto LOC_000000dd;
                    }
                #/
                var_22f87c8bf7c4616b = "gas_grenade_light_mp";
            }
        }
    }
    while (1) {
        _shellshock(var_22f87c8bf7c4616b, "gas", 0.5, 0);
        wait(0.2);
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2087
// Size: 0xb
function gas_removeblur() {
    self notify("gas_modify_blur");
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2099
// Size: 0x20
function gas_clearblur(var_fcef8d217a441961) {
    self notify("gas_modify_blur");
    if (!istrue(var_fcef8d217a441961)) {
        _stopshellshock();
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c0
// Size: 0x39
function gas_shouldtakeheldoffhand() {
    switch (self getheldoffhand().basename) {
    case #"hash_3102ab88c5c102fc":
        return 0;
    default:
        return 1;
        break;
    }
    return 0;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2101
// Size: 0x4f
function gas_coughisblocked() {
    if (!val::get("cough_gesture")) {
        return 1;
    }
    if (!val::get("offhand_weapons")) {
        return 1;
    }
    if (!isnullweapon(self getheldoffhand()) && !gas_shouldtakeheldoffhand()) {
        return 1;
    }
    if (player::isinlaststand(self)) {
        return 1;
    }
    return 0;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2158
// Size: 0x25
function gas_isintrigger() {
    if (!isdefined(self.gastriggerstouching)) {
        return 0;
    }
    if (self.gastriggerstouching.size == 0) {
        return 0;
    }
    return 1;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2185
// Size: 0x2d
function gas_updateplayereffects() {
    if (namespace_a2f809133c566621::isjuggernaut()) {
        gas_clear();
        return;
    }
    if (gas_isintrigger()) {
        thread gas_applyspeedredux();
        thread gas_applyblur();
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b9
// Size: 0x11
function gas_getblurinterruptdelayms(duration) {
    return 200;
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d2
// Size: 0x115
function function_3a3f27425a46d2cb(trigger) {
    victim = self;
    attacker = trigger.owner;
    victim endon("death_or_disconnect");
    victim endon("gas_inflict_damage_end");
    victim endon("gas_exit");
    victim notify("gas_inflict_damage_reset");
    victim endon("gas_inflict_damage_reset");
    victim thread function_8f331092cff3bb6b(trigger);
    var_9269e02033bdf484 = victim namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist");
    var_14af965f6ea7998f = victim namespace_82dcd1d5ae30ff7::_hasperk("specialty_outlander");
    var_576851e39bb1f1f1 = istrue(victim == attacker);
    damagetick = 5;
    if (var_9269e02033bdf484 || var_14af965f6ea7998f || var_576851e39bb1f1f1) {
        damagetick = 3;
    }
    damagetick = int(max(1, damagetick));
    while (isdefined(trigger)) {
        if (!istrue(victim.var_a6637f42471575bc)) {
            victim dodamage(damagetick, trigger.origin, trigger.owner, undefined, "MOD_TRIGGER_HURT", "gas_grenade_mp");
            victim namespace_f8d3520d3483c1::damagearmor(damagetick);
        }
        wait(1);
    }
}

// Namespace gas_grenade/namespace_d39a86483d995ed1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ee
// Size: 0x55
function function_8f331092cff3bb6b(trigger) {
    victim = self;
    level endon("game_ended");
    victim endon("death_or_disconnect");
    victim notify("gas_exit_damage_reset");
    victim endon("gas_exit_damage_reset");
    victim waittill_notify_or_timeout("gas_exited", trigger.duration);
    victim notify("gas_inflict_damage_end");
}

