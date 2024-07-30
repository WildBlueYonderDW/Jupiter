#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\anim\animselector.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_cbb0697de4c5728;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle_code.gsc;

#namespace mp_agent;

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cf
// Size: 0x8a
function setupweapon(primaryweaponobject) {
    assertex(isweapon(primaryweaponobject), "weapon param for SetupWeapon needs to be a weapon object");
    self.weapon = primaryweaponobject;
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x561
// Size: 0xcd
function spawnnewagentaitype(aitype, position, angles, team, var_42e5c77b1d7fe6e7, gender) {
    /#
    #/
    if (!string_starts_with(aitype, "actor_")) {
        aitype = "actor_" + aitype;
    }
    if (isdefined(level.var_ab4e7a61416509ca)) {
        aitype = [[ level.var_ab4e7a61416509ca ]](aitype);
    }
    if (!isdefined(level.agent_definition[aitype]) || !isdefined(level.agent_definition[aitype]["setup_func"])) {
        assertmsg("'" + aitype + "' is not defined in level.agent_definition, please add aitype to level csv, and ensure it is properly marked for mp/cp.");
        /#
        #/
        return undefined;
    }
    agent = spawnnewagent(aitype, team, position, angles, undefined, var_42e5c77b1d7fe6e7, gender);
    /#
    #/
    return agent;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x637
// Size: 0x5f
function spawnnewagent(agent_type, spawn_team, spawn_position, spawn_angles, var_f9e7dc261e07162e, var_42e5c77b1d7fe6e7, gender) {
    /#
    #/
    agent = dospawnaitype(agent_type, spawn_position, spawn_angles, 0, 0, 1, 0, spawn_team, var_42e5c77b1d7fe6e7, gender);
    /#
    #/
    return agent;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0xeb
function function_391ec48831a02c13(agent, agent_type, spawn_team, var_f9e7dc261e07162e) {
    namespace_14d36171baccf528::function_51de6da7b0dcf26f(agent);
    agent.connecttime = gettime();
    agent.spawntime = agent.connecttime;
    agent function_d99212ec742486d0(agent_type, spawn_team);
    agent function_af0713caaf6c21c5();
    agent scripts\cp_mp\utility\game_utility::addtocharactersarray();
    agent function_c4f5a500340fe6c2(agent.agent_type);
    if (isdefined(var_f9e7dc261e07162e)) {
        if (isweapon(var_f9e7dc261e07162e)) {
            agent setupweapon(var_f9e7dc261e07162e);
        } else {
            assertmsg("Optional weapon param for spawnNewAgent must be a weapon object. Consider instead adding a weapon to the aitype (or at least use the appropriate MP/CP version of buildWeapon first)");
            return undefined;
        }
    }
    agent activateagent();
    agent set_ai_number();
    agent function_82581894f5a1c71c();
    params = spawnstruct();
    params.agent = agent;
    callback::callback("on_agent_spawned", params);
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x792
// Size: 0x61
function function_af0713caaf6c21c5() {
    if (!isdefined(level.agent_funcs[self.agent_type])) {
        level.agent_funcs[self.agent_type] = [];
        assign_agent_func("on_damaged", &default_on_damage);
        assign_agent_func("on_damaged_finished", &default_on_damage_finished);
        assign_agent_func("on_killed", &default_on_killed);
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fb
// Size: 0x4a
function assign_agent_func(var_ad662d6a990f6fcc, default_func) {
    assert(!isdefined(level.agent_funcs[self.agent_type][var_ad662d6a990f6fcc]));
    level.agent_funcs[self.agent_type][var_ad662d6a990f6fcc] = default_func;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84d
// Size: 0x95
function function_b4a6a1a854015dfc(agent_type) {
    self.agent_type = agent_type;
    if (isdefined(level.var_92b4162e3c890dc0) && isdefined(level.agent_definition[agent_type]["subclass"]) && isdefined(level.var_92b4162e3c890dc0[level.agent_definition[agent_type]["subclass"].name])) {
        self [[ level.var_92b4162e3c890dc0[level.agent_definition[agent_type]["subclass"].name] ]]();
        return;
    }
    initagentscriptvariables();
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ea
// Size: 0xdf
function getfreeagent(agent_type) {
    if (!isdefined(level.agentarray)) {
        println("<dev string:x3e>");
        return undefined;
    }
    var_7818398cdd97fe84 = function_76b285b4bae7356c();
    if (isdefined(var_7818398cdd97fe84)) {
        var_7818398cdd97fe84.agent_type = agent_type;
        if (isdefined(level.var_92b4162e3c890dc0) && isdefined(level.agent_definition[agent_type]["subclass"]) && isdefined(level.var_92b4162e3c890dc0[level.agent_definition[agent_type]["subclass"].name])) {
            var_7818398cdd97fe84 [[ level.var_92b4162e3c890dc0[level.agent_definition[agent_type]["subclass"].name] ]]();
        } else {
            var_7818398cdd97fe84 initagentscriptvariables();
        }
    }
    /#
        if (!isdefined(var_7818398cdd97fe84)) {
            println("<dev string:x7e>");
        }
    #/
    return var_7818398cdd97fe84;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d2
// Size: 0x57
function initagentscriptvariables() {
    self.pers = [];
    self.hasdied = 0;
    self.isactive = 0;
    self.isagent = 1;
    self.agent_teamparticipant = 0;
    self.agent_gameparticipant = 0;
    self.agentname = undefined;
    self detachall();
    initplayerscriptvariables();
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa31
// Size: 0xf5
function initplayerscriptvariables() {
    self.class = undefined;
    self.movespeedscaler = undefined;
    self.avoidkillstreakonspawntimer = undefined;
    self.guid = undefined;
    self.name = undefined;
    self.perks = undefined;
    self.weaponlist = undefined;
    self.objectivescaler = undefined;
    self.sessionteam = undefined;
    self.sessionstate = undefined;
    val::nuke("weapon");
    val::nuke("weapon_switch");
    val::nuke("offhand_weapons");
    val::nuke("usability");
    self.nocorpse = undefined;
    self.ignoreme = 0;
    self.ignoreall = istrue(level.var_bdb4d0cd41b1c39d);
    self.command_given = undefined;
    self.current_icon = undefined;
    self.do_immediate_ragdoll = undefined;
    if (isdefined(level.gametype_agent_init)) {
        self [[ level.gametype_agent_init ]]();
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e
// Size: 0x48
function function_d99212ec742486d0(agent_type, spawn_team) {
    if (!isdefined(spawn_team)) {
        spawn_team = level.agent_definition[agent_type]["team"];
        if (!isdefined(spawn_team)) {
            spawn_team = "axis";
        }
    }
    self.pers["team"] = spawn_team;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7e
// Size: 0x1f
function set_agent_health(health) {
    self.health = health;
    self.maxhealth = health;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba5
// Size: 0x10e
function is_friendly_damage(agent, attacker) {
    if (isdefined(attacker) && isdefined(agent) && isdefined(agent.team) && !istrue(attacker.allowfriendlyfire)) {
        if (isdefined(attacker.team) && attacker.team == agent.team) {
            return true;
        }
        if (isdefined(attacker.owner) && isdefined(attacker.owner.team) && attacker.owner.team == agent.team) {
            return true;
        }
        if (isdefined(attacker.vehicle) && isdefined(attacker.vehicle.team) && attacker.vehicle.team == agent.team) {
            return true;
        }
    }
    return false;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbc
// Size: 0x318
function default_on_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    victim = self;
    func = undefined;
    self.modifiedidflags = idflags;
    if (isdefined(self.var_970170ffd4b081ac)) {
        idamage = self [[ self.var_970170ffd4b081ac ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    if (isdefined(self.unittype) && isdefined(level.agent_funcs[self.unittype])) {
        func = level.agent_funcs[self.unittype]["gametype_on_damaged"];
    }
    if (isdefined(func)) {
        [[ func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname);
    } else if (isdefined(self.agent_type)) {
        func = level.agent_funcs[self.agent_type]["gametype_on_damaged"];
        if (isdefined(func)) {
            [[ func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname);
        }
    }
    if (is_friendly_damage(victim, einflictor)) {
        return;
    }
    /#
        scripts\cp_mp\utility\weapon_utility::function_c9e5c511b923a42f(idamage, eattacker, victim, smeansofdeath, shitloc, einflictor, vpoint);
    #/
    if (istrue(victim.agentdamagefeedback)) {
        biskillstreakweapon = 0;
        if (scripts\engine\utility::issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
            biskillstreakweapon = isdefined(objweapon) && [[ scripts\engine\utility::getsharedfunc("killstreak", "isKillstreakWeapon") ]](objweapon.basename);
            if (scripts\engine\utility::issharedfuncdefined("damage", "handleDamageFeedback")) {
                eattacker [[ scripts\engine\utility::getsharedfunc("damage", "handleDamageFeedback") ]](einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, biskillstreakweapon);
            }
        }
    }
    idflags = self.modifiedidflags;
    if (isdefined(victim.unittype) && isdefined(level.agent_funcs[victim.unittype]) && isdefined(level.agent_funcs[victim.unittype]["on_damaged_finished"])) {
        victim [[ level.agent_funcs[victim.unittype]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname);
        return;
    }
    if (isdefined(victim.agent_type)) {
        assert(isdefined(level.agent_funcs[victim.agent_type]["on_damaged_finished"]));
        victim [[ level.agent_funcs[victim.agent_type]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname);
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdc
// Size: 0x26d
function default_on_damage_finished(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname, armorhit) {
    prevhealth = self.health;
    objweapon = sweapon;
    self.damagedby = eattacker;
    self.damagetime = gettime();
    self.damagepoint = vpoint;
    assert(istrue(self.isactive));
    self finishagentdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname, istrue(armorhit));
    if (self.health > 0 && self.health < prevhealth) {
        self notify("pain");
        scripts\asm\asm_mp::runpain();
    }
    if (isalive(self)) {
        if (isdefined(self.var_1ec812b92a31cdd3)) {
            foreach (func in self.var_1ec812b92a31cdd3) {
                self [[ func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname);
            }
        }
        if (isdefined(self.unittype) && isdefined(level.agent_funcs[self.unittype]) && isdefined(level.agent_funcs[self.unittype]["gametype_on_damage_finished"])) {
            func = level.agent_funcs[self.unittype]["gametype_on_damage_finished"];
            if (isdefined(func)) {
                [[ func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname);
            }
            return;
        }
        if (isdefined(self.agent_type)) {
            func = level.agent_funcs[self.agent_type]["gametype_on_damage_finished"];
            if (isdefined(func)) {
                [[ func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname);
            }
        }
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1251
// Size: 0x265
function default_on_killed(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration) {
    if (isdefined(self.on_zombie_agent_killed_common)) {
        self [[ self.on_zombie_agent_killed_common ]](einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, 0);
    } else {
        on_humanoid_agent_killed_common(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, 0);
    }
    if (isdefined(self.unittype) && isdefined(level.agent_funcs[self.unittype]) && isdefined(level.agent_funcs[self.unittype]["gametype_on_killed"])) {
        func = level.agent_funcs[self.unittype]["gametype_on_killed"];
        if (isdefined(func)) {
            self [[ func ]](einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration);
        }
    } else {
        func = level.agent_funcs[self.agent_type]["gametype_on_killed"];
        if (isdefined(func)) {
            self [[ func ]](einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration);
        }
    }
    params_struct = spawnstruct();
    params_struct.einflictor = einflictor;
    params_struct.eattacker = eattacker;
    params_struct.idamage = idamage;
    params_struct.smeansofdeath = smeansofdeath;
    params_struct.sweapon = objweapon;
    params_struct.vdir = vdir;
    params_struct.shitloc = shitloc;
    params_struct.timeoffset = timeoffset;
    params_struct.deathanimduration = deathanimduration;
    callback::callback("on_ai_killed", params_struct);
    if (isdefined(eattacker) && isdefined(eattacker.vehicle) && isdefined(eattacker.vehicle.var_74633b25289a1962)) {
        [[ eattacker.vehicle.var_74633b25289a1962 ]](eattacker.vehicle, self, params_struct);
        return;
    }
    if (isdefined(einflictor) && isdefined(einflictor.var_74633b25289a1962) && smeansofdeath == "MOD_CRUSH") {
        [[ einflictor.var_74633b25289a1962 ]](einflictor, self, params_struct);
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14be
// Size: 0x2b
function getnumactiveagents(type) {
    if (!isdefined(type)) {
        type = "all";
    }
    agents = getactiveagentsoftype(type);
    return agents.size;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f2
// Size: 0xaf
function getactiveagentsoftype(type) {
    assert(isdefined(type));
    if (!isdefined(level.agentarray)) {
        return [];
    }
    agents = [];
    foreach (agent in level.agentarray) {
        if (istrue(agent.isactive)) {
            if (type == "all" || agent.agent_type == type) {
                agents[agents.size] = agent;
            }
        }
    }
    return agents;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15aa
// Size: 0x95
function getaliveagentsofteam(team) {
    var_c5c35cc6c0816de1 = [];
    foreach (agent in level.agentarray) {
        if (isalive(agent) && isdefined(agent.team) && agent.team == team) {
            var_c5c35cc6c0816de1[var_c5c35cc6c0816de1.size] = agent;
        }
    }
    return var_c5c35cc6c0816de1;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1648
// Size: 0x39
function activateagent() {
    /#
        if (!self.isactive) {
            assertex(self.connecttime == gettime(), "<dev string:xd2>");
        }
    #/
    self.isactive = 1;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1689
// Size: 0x34
function ai_washitbyvehicle(meansofdeath, attacker) {
    if (meansofdeath != "MOD_CRUSH") {
        return false;
    }
    if (!isdefined(attacker)) {
        return false;
    }
    if (!attacker scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        return false;
    }
    return true;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c6
// Size: 0x640
function on_humanoid_agent_killed_common(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons) {
    var_37a99e672a1ecc0e = ai_washitbyvehicle(smeansofdeath, einflictor);
    self asmdodeathtransition(self.asmname);
    if (isdefined(self.deathanimduration)) {
        deathanimduration = self.deathanimduration;
    } else if (deathanimduration == 0) {
        deathanimduration = 500;
    }
    if (isdefined(self.fncleanupbt)) {
        self [[ self.fncleanupbt ]]();
    }
    if (isdefined(self.nocorpse)) {
        return;
    }
    victim = self;
    callback::callback("pre_killed_body_cloned");
    self.body = self cloneagent(deathanimduration);
    if (!isdefined(self.body.team)) {
        self.body.team = self.team;
    }
    if (namespace_46e942396566f2da::function_bbee2e46ab15a720(eattacker, objweapon, smeansofdeath, shitloc, einflictor)) {
        return;
    }
    var_8fd538cbeeacdfa8 = spawnstruct();
    var_8fd538cbeeacdfa8.body = self.body;
    var_8fd538cbeeacdfa8.eattacker = eattacker;
    var_8fd538cbeeacdfa8.script_parameters = self.script_parameters;
    callback::callback("killed_body_cloned", var_8fd538cbeeacdfa8);
    if (issharedfuncdefined("ai_mp_controller", "agentPers_setAgentPersData", 1)) {
        [[ getsharedfunc("ai_mp_controller", "agentPers_setAgentPersData") ]](self, "weaponDropOrigin", self gettagorigin("tag_weapon_right", 1));
        [[ getsharedfunc("ai_mp_controller", "agentPers_setAgentPersData") ]](self, "weaponDropAngles", self gettagangles("tag_weapon_right", 1));
    }
    if (isdefined(self._blackboard.currentvehicle)) {
        if (isdefined(smeansofdeath) && smeansofdeath == "MOD_FIRE") {
            self.ragdoll_directionscale = 0;
        }
        if (istrue(self.burningtodeath)) {
            if (self isscriptable() && self.body isscriptable()) {
                currentstate = self getscriptablepartstate("burn_to_death_by_molotov", 1);
                if (isdefined(currentstate) && currentstate == "active") {
                    self.body setscriptablepartstate("burn_to_death_by_molotov", "active", 1);
                    thread updateburningtodeath(self.body);
                }
            }
        }
        if (!self._blackboard.invehicle || istrue(self._blackboard.var_80912ec8ade08716)) {
            if (var_37a99e672a1ecc0e) {
                assert(isdefined(self.lastattacker));
                self.body startragdollfromvehicleimpact(einflictor);
            } else if (should_do_immediate_ragdoll(self)) {
                if (isdefined(self.ragdollhitloc) && isdefined(self.ragdollimpactvector)) {
                    self.body startragdollfromimpact(self.ragdollhitloc, self.ragdollimpactvector);
                } else {
                    do_immediate_ragdoll(self.body);
                }
            } else {
                thread delaystartragdoll(self.body, shitloc, vdir, objweapon, einflictor, smeansofdeath);
            }
        } else {
            self.body enablelinkto();
            deathanim = self.body getcorpseanim();
            ragdollnotetracks = getnotetracktimes(deathanim, "start_ragdoll");
            shouldragdoll = isdefined(ragdollnotetracks) && ragdollnotetracks.size > 0;
            if (istrue(self._blackboard.var_f6d06d1e68f4f4e5)) {
                self.body linktoblendtotag(self._blackboard.currentvehicle, self._blackboard.var_1745d2b69c72c627, 0);
            } else {
                self.body linktomoveoffset(self._blackboard.currentvehicle, self._blackboard.var_1745d2b69c72c627);
            }
            if (isdefined(self._blackboard.vehicledeathwait) || shouldragdoll) {
                thread delaystartragdoll(self.body, shitloc, objweapon, einflictor, smeansofdeath);
            } else {
                self.body thread ragdoll_on_vehicle_death(self._blackboard.currentvehicle);
                seatid = function_7687424c385de94(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba);
                if (isdefined(seatid)) {
                    thread function_89fcc8d16c4fd558(self.body, self._blackboard.currentvehicle, seatid, 1);
                }
            }
        }
        return;
    }
    if (istrue(self.burningtodeath)) {
        if (self isscriptable() && self.body isscriptable()) {
            currentstate = self getscriptablepartstate("burn_to_death_by_molotov", 1);
            if (isdefined(currentstate) && currentstate == "active") {
                self.body setscriptablepartstate("burn_to_death_by_molotov", "active", 1);
                thread updateburningtodeath(self.body);
                thread delaystartragdoll(self.body, shitloc, vdir, objweapon, einflictor, smeansofdeath);
            }
        }
        return;
    }
    if (var_37a99e672a1ecc0e) {
        assert(isdefined(self.lastattacker));
        self.body startragdollfromvehicleimpact(einflictor);
        return;
    }
    if (should_do_immediate_ragdoll(self)) {
        if (isdefined(self.ragdollhitloc) && isdefined(self.ragdollimpactvector)) {
            self.body startragdollfromimpact(self.ragdollhitloc, self.ragdollimpactvector);
        } else {
            do_immediate_ragdoll(self.body);
        }
        return;
    }
    thread delaystartragdoll(self.body, shitloc, vdir, objweapon, einflictor, smeansofdeath);
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0e
// Size: 0x5f
function function_89fcc8d16c4fd558(corpse, vehicle, seatid, var_f9e25038fed22bf0) {
    corpse endon("death");
    corpse endon("cancel_delete_corpse");
    if (!istrue(vehicle.isdestroyed)) {
        scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_assignseatcorpse(corpse, vehicle, seatid, var_f9e25038fed22bf0);
    }
    vehicle waittill("death");
    if (isdefined(corpse)) {
        corpse delete();
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d75
// Size: 0x80
function function_7687424c385de94(vehicle, seatindex) {
    foreach (seatid, var_5539341a688c012f in scripts\cp_mp\vehicles\vehicle::function_29b4292c92443328(vehicle scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd()).occupancy.seatids) {
        if (var_5539341a688c012f == seatindex) {
            return seatid;
        }
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfd
// Size: 0x50
function ragdoll_on_vehicle_death(vehicle) {
    self endon("entitydeleted");
    if (self isragdoll()) {
        return;
    }
    if (isdefined(vehicle)) {
        while (true) {
            if (!isdefined(self)) {
                return;
            }
            if (!isdefined(vehicle) || vehicle scripts\common\vehicle_code::vehicle_iscorpse()) {
                self unlink();
                self startragdoll();
                return;
            }
            waitframe();
        }
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e55
// Size: 0x4e
function should_do_immediate_ragdoll(agent) {
    if (istrue(agent.do_immediate_ragdoll)) {
        return true;
    }
    if (istrue(agent.forceragdollimmediate)) {
        return true;
    }
    if (istrue(self.var_aa0214e1292a7b3) && !isdefined(self.vehicledeathwait)) {
        return true;
    }
    return false;
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eac
// Size: 0x1e2
function do_immediate_ragdoll(agent_body) {
    if (!isdefined(agent_body)) {
        return;
    }
    if (isdefined(agent_body.ragdollhitloc) && isdefined(agent_body.ragdollimpactvector)) {
        agent_body startragdollfromimpact(agent_body.ragdollhitloc, agent_body.ragdollimpactvector);
        return;
    }
    initialimpulse = 10;
    damagetype = utility::getdamagetype(self.damagemod);
    if (isdefined(self.attacker) && isplayer(self.attacker) && damagetype == "melee") {
        initialimpulse = 5;
    }
    damagetaken = self.damagetaken;
    if (damagetype == "bullet" || isdefined(self.damagemod) && self.damagemod == "MOD_FIRE") {
        damagetaken = min(damagetaken, 300);
    }
    directionscale = initialimpulse * damagetaken;
    directionup = max(0.3, self.damagedir[2]);
    direction = (self.damagedir[0], self.damagedir[1], directionup);
    if (isdefined(self.ragdoll_directionscale)) {
        direction *= self.ragdoll_directionscale;
    } else {
        direction *= directionscale;
    }
    if (self.forceragdollimmediate) {
        direction += self.prevanimdelta * 20 * 10;
    }
    if (isdefined(self.ragdoll_start_vel)) {
        direction += self.ragdoll_start_vel * 10;
    }
    damagelocation = self.damagelocation;
    if (isdefined(self.ragdoll_damagelocation_none) && damagelocation == "none") {
        damagelocation = self.ragdoll_damagelocation_none;
    }
    agent_body startragdollfromimpact(damagelocation, direction);
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2096
// Size: 0x2b1
function delaystartragdoll(ent, shitloc, vdir, objweapon, einflictor, smeansofdeath) {
    if (isdefined(ent)) {
        deathanim = ent getcorpseanim();
        if (animhasnotetrack(deathanim, "ignore_ragdoll")) {
            return;
        }
        if (animhasnotetrack(deathanim, "annihilate")) {
            times = getnotetracktimes(deathanim, "annihilate");
            waittime = times[0] * getanimlength(deathanim);
            params = spawnstruct();
            params.corpse = ent;
            params.annihilate_time = waittime;
            callback::callback("on_corpse_annihilated", params);
            if (waittime > 0) {
                wait waittime;
            }
            if (isdefined(ent)) {
                ent delete();
            }
            return;
        }
    }
    if (isdefined(level.noragdollents) && level.noragdollents.size) {
        foreach (norag in level.noragdollents) {
            if (distancesquared(ent.origin, norag.origin) < 65536) {
                return;
            }
        }
    }
    var_f0b2847d70267f37 = undefined;
    if (isdefined(self._blackboard.vehicledeathwait)) {
        var_f0b2847d70267f37 = self._blackboard.vehicledeathwait;
    }
    waitframe();
    if (!isdefined(ent)) {
        return;
    }
    if (ent isragdoll()) {
        return;
    }
    deathanim = ent getcorpseanim();
    if (animisleaf(deathanim)) {
        startfrac = 0.35;
        waittime = 0;
        if (isdefined(var_f0b2847d70267f37)) {
            waittime = var_f0b2847d70267f37;
        } else {
            times = getnotetracktimes(deathanim, "start_ragdoll");
            if (isdefined(times) && times.size > 0) {
                startfrac = times[0];
            } else {
                times = getnotetracktimes(deathanim, "vehicle_death_ragdoll");
                if (isdefined(times) && times.size > 0) {
                    startfrac = times[0];
                }
            }
            waittime = startfrac * getanimlength(deathanim) - level.frameduration / 1000;
        }
        if (waittime > 0) {
            wait waittime;
        }
    }
    self unlink();
    if (isdefined(ent)) {
        if (isdefined(ent.ragdollhitloc) && isdefined(ent.ragdollimpactvector)) {
            ent startragdollfromimpact(ent.ragdollhitloc, ent.ragdollimpactvector);
            return;
        }
        ent startragdoll();
    }
}

// Namespace mp_agent / scripts\mp\mp_agent
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234f
// Size: 0x49
function updateburningtodeath(corpse) {
    wait 0.7;
    if (!isdefined(corpse)) {
        return;
    }
    corpse setcorpsemodel("burntbody_male_cp", 1);
    corpse dontinterpolate();
    wait 0.95;
    if (!isdefined(corpse)) {
        return;
    }
    corpse setscriptablepartstate("burn_to_death_by_molotov", "inactive");
}

