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
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_42adcce5878f583;
#using script_208955cb4d2c8fb3;
#using script_24fbedba9a7a1ef4;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using script_77c18cdedec620b3;

#namespace namespace_5ba3e3853aa3d403;

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x1ed
function function_c17d42c1c9426b4f(agent, var_3716647cb96f1f04) {
    agent.Chemist = spawnstruct();
    agent.Chemist.var_3ac97be6a272fd0c = function_53c4c53197386572(float(var_3716647cb96f1f04.var_3ac97be6a272fd0c), 200);
    agent.Chemist.var_6611564090223dab = function_53c4c53197386572(var_3716647cb96f1f04.var_6611564090223dab, 1);
    agent.Chemist.var_2278441f7203ae = function_53c4c53197386572(var_3716647cb96f1f04.var_2278441f7203ae, 1.5);
    agent.Chemist.var_353647cb7ffa6545 = function_53c4c53197386572(var_3716647cb96f1f04.var_353647cb7ffa6545, 0.5);
    agent.Chemist.var_d95b207bf603b50f = [];
    agent.Chemist.var_fe9db1b79b6e0fd4 = function_53c4c53197386572(var_3716647cb96f1f04.var_fe9db1b79b6e0fd4, 0.9);
    agent.Chemist.var_884e31585e1488e7 = function_53c4c53197386572(var_3716647cb96f1f04.var_4ebb0afebf683c01, 5);
    agent.Chemist.var_5aaa252fb3c34a87 = function_53c4c53197386572(var_3716647cb96f1f04.var_5aaa252fb3c34a87, 10);
    agent.Chemist.var_a985895b5796100b = function_53c4c53197386572(var_3716647cb96f1f04.var_a985895b5796100b, 200);
    agent.Chemist.var_151cd74fd4c1f445 = function_53c4c53197386572(var_3716647cb96f1f04.var_151cd74fd4c1f445, 7);
    agent.Chemist.var_52787549de264c36 = function_53c4c53197386572(var_3716647cb96f1f04.var_52787549de264c36, "something");
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x642
// Size: 0x36a
function gas_createtrigger(position, owner, team, duration, var_3ac97be6a272fd0c, var_ddd8710e868c582e, scriptable, damage, var_e556fb63e003ee69) {
    if (!isdefined(duration)) {
        duration = owner.stalker.var_35d7093a7102d784;
    }
    if (!isdefined(var_3ac97be6a272fd0c)) {
        var_3ac97be6a272fd0c = owner.Chemist.var_3ac97be6a272fd0c;
    }
    /#
        dvar = getunarchiveddebugdvar(@"hash_8c0b4f15bd7fd07b", "gas_mask_swap_complete");
        if (int(dvar) && isdefined(self.Chemist)) {
            if (istrue(var_ddd8710e868c582e)) {
                if (int(getunarchiveddebugdvar(@"hash_8c9ae83d2eacef", self.Chemist.var_3ac97be6a272fd0c))) {
                    var_3ac97be6a272fd0c = int(getunarchiveddebugdvar(@"hash_8c9ae83d2eacef", self.Chemist.var_3ac97be6a272fd0c));
                }
            } else if (int(getunarchiveddebugdvar(@"hash_b804dde808052bcd", self.Chemist.var_a985895b5796100b))) {
                var_3ac97be6a272fd0c = int(getunarchiveddebugdvar(@"hash_b804dde808052bcd", self.Chemist.var_a985895b5796100b));
            }
        }
    #/
    trigger = spawn("trigger_radius", position + (0, 0, int(-57.75)), 0, int(var_3ac97be6a272fd0c), int(175));
    trigger namespace_2a9588dfac284b77::registerspawn(1, &sweepgas);
    trigger endon("death");
    if (!isdefined(scriptable)) {
        scriptable = owner.Chemist.var_52787549de264c36;
        if (istrue(var_ddd8710e868c582e)) {
            scriptable = owner.stalker.var_676a9574befe2b66;
        }
    }
    var_ea4595f6fe90fa74 = randomintrange(0, 1);
    var_ea4595f6fe90fa74 = var_ea4595f6fe90fa74 * 180 - 90;
    trigger.scriptable = spawnscriptable(scriptable, position, (var_ea4595f6fe90fa74, 0, 0));
    trigger.scriptable setscriptablepartstate("smoke", "on");
    trigger.owner = owner;
    trigger.team = team;
    trigger.playersintrigger = [];
    trigger.var_aeeca2bc23f59ea4 = [];
    trigger.triggertype = "tripwire";
    if (isdefined(trigger.owner) && isdefined(trigger.owner.Chemist)) {
        trigger.triggertype = ter_op(istrue(var_ddd8710e868c582e), "chemist_defensive", "chemist_offensive");
    }
    trigger thread gas_watchtriggerenter(damage, var_e556fb63e003ee69);
    trigger thread gas_watchtriggerexit();
    trigger thread function_c019d388d556f4c1();
    trigger thread gas_destroytrigger(duration, var_ddd8710e868c582e);
    /#
        if (int(dvar)) {
            draw_circle(position, var_3ac97be6a272fd0c, (0, 1, 0), 1, 0, int(duration / level.framedurationseconds));
            draw_circle(position + (0, 0, int(175)), var_3ac97be6a272fd0c, (0, 1, 0), 1, 0, int(duration / level.framedurationseconds));
        }
    #/
    return trigger;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b4
// Size: 0x304
function gas_watchtriggerenter(damage, var_e556fb63e003ee69) {
    level endon("game_ended");
    self endon("death");
    while (1) {
        var_102ff186309f63b8 = self waittill("trigger");
        if (!isdefined(var_102ff186309f63b8)) {
            continue;
        }
        if (istrue(self.var_80882985b5288ea2)) {
            continue;
        }
        var_f89a7d23282c775a = [];
        if (isplayer(var_102ff186309f63b8)) {
            var_f89a7d23282c775a[var_f89a7d23282c775a.size] = var_102ff186309f63b8;
        } else if (var_102ff186309f63b8 namespace_1f188a13f7e79610::isvehicle()) {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(var_102ff186309f63b8, 0);
            if (isdefined(occupants) && isarray(occupants)) {
                foreach (occupant in occupants) {
                    if (isdefined(occupant) && isplayer(occupant)) {
                        var_f89a7d23282c775a[var_f89a7d23282c775a.size] = occupant;
                    }
                }
            }
        } else if (isagent(var_102ff186309f63b8)) {
            var_1c4ffc14aca3a72a = !array_contains(self.var_aeeca2bc23f59ea4, var_102ff186309f63b8);
            var_a8ea15b041872949 = isdefined(var_102ff186309f63b8.var_65771500f49956c1) && var_102ff186309f63b8.var_65771500f49956c1;
            var_a9386ea52bfabc96 = function_4b3d362da941192c(var_102ff186309f63b8);
            if (var_1c4ffc14aca3a72a) {
                if (!isdefined(var_102ff186309f63b8.var_e4ba42c30663bec8)) {
                    var_102ff186309f63b8.var_e4ba42c30663bec8 = 0;
                }
                self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size] = var_102ff186309f63b8;
                var_102ff186309f63b8.var_e4ba42c30663bec8++;
                if (var_102ff186309f63b8.var_e4ba42c30663bec8 == 1) {
                    var_102ff186309f63b8 thread function_157fa9f486d53b6e();
                    var_102ff186309f63b8 function_870ea0fefcd757f4(0, isdefined(var_102ff186309f63b8.Chemist));
                    if (!isdefined(var_102ff186309f63b8.var_a4738c70736d3a61)) {
                        var_102ff186309f63b8.var_a4738c70736d3a61 = &function_b33be13e1e5a9315;
                    }
                }
                if (var_a8ea15b041872949) {
                    continue;
                }
                if (istrue(var_102ff186309f63b8.var_b426e3a6879aa708)) {
                    if (function_6eb21567d00b6925(var_102ff186309f63b8)) {
                        continue;
                    }
                    if (!var_a9386ea52bfabc96) {
                        continue;
                    }
                    var_102ff186309f63b8 thread gas_onentertrigger(self, damage, var_e556fb63e003ee69);
                }
            }
            if (var_1c4ffc14aca3a72a || isdefined(var_102ff186309f63b8.flashendtime) && var_102ff186309f63b8.flashendtime < gettime()) {
                if (var_a8ea15b041872949 || !var_a9386ea52bfabc96) {
                    continue;
                }
                var_102ff186309f63b8 notify("flashbang", var_102ff186309f63b8.origin);
            }
        }
        foreach (player in var_f89a7d23282c775a) {
            if (!function_77090b728077e89(player)) {
                self.playersintrigger[player getentitynumber()] = player;
                player thread gas_onentertrigger(self, damage, var_e556fb63e003ee69);
            }
        }
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbf
// Size: 0x7f
function function_4b3d362da941192c(entity) {
    if (!level.teambased || !isdefined(self.team)) {
        return 1;
    }
    var_da8cec9bce12f9cb = entity.team;
    if (!isdefined(var_da8cec9bce12f9cb) && isdefined(entity.agentteam)) {
        var_da8cec9bce12f9cb = entity.agentteam;
    }
    if (isdefined(var_da8cec9bce12f9cb) && isenemyteam(self.team, var_da8cec9bce12f9cb)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd46
// Size: 0xa2
function function_77090b728077e89(player) {
    if (!isdefined(player)) {
        return 1;
    }
    if (function_f956c3df8422820b(player)) {
        return 1;
    }
    if (isdefined(self.playersintrigger[player getentitynumber()])) {
        return 1;
    }
    if (level.teambased) {
        if (isdefined(self.owner) && isalive(self.owner)) {
            if (player != self.owner && !namespace_f8065cafc523dba5::playersareenemies(player, self.owner)) {
                return 1;
            }
        } else if (namespace_f8065cafc523dba5::isfriendly(self.team, player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf0
// Size: 0x1b1
function gas_watchtriggerexit() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        foreach (id, player in self.playersintrigger) {
            if (!isdefined(player)) {
                self.playersintrigger[id] = undefined;
            } else {
                if (player istouching(self) && !function_f956c3df8422820b(player)) {
                    continue;
                }
                playervehicle = player namespace_f8065cafc523dba5::getvehicle();
                if (isdefined(playervehicle) && playervehicle istouching(self)) {
                    continue;
                }
                self.playersintrigger[player getentitynumber()] = undefined;
                player thread gas_onexittrigger(self getentitynumber(), self.triggertype);
            }
        }
        index = 0;
        while (index < self.var_aeeca2bc23f59ea4.size) {
            agent = self.var_aeeca2bc23f59ea4[index];
            if (isdefined(agent)) {
                if (agent istouching(self) && !function_6eb21567d00b6925(agent)) {
                    index++;
                    continue;
                }
                if (isdefined(agent.var_e4ba42c30663bec8) && agent.var_e4ba42c30663bec8 > 0) {
                    agent.var_e4ba42c30663bec8--;
                }
            }
            self.var_aeeca2bc23f59ea4[index] = self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size - 1];
            self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size - 1] = undefined;
            agent thread gas_onexittrigger(self getentitynumber(), self.triggertype);
        }
        waitframe();
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa8
// Size: 0x33
function function_f956c3df8422820b(player) {
    if (!player namespace_f8065cafc523dba5::_isalive()) {
        return 1;
    }
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        return 1;
    }
    if (player function_7ee20cf3c0390e21()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe3
// Size: 0x19
function function_6eb21567d00b6925(agent) {
    if (!isalive(agent)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1004
// Size: 0xb
function sweepgas() {
    thread function_84a4f38b8b39ce71();
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1016
// Size: 0x7f
function gas_destroytrigger(duration, var_ddd8710e868c582e) {
    level endon("game_ended");
    wait(duration);
    if (istrue(var_ddd8710e868c582e)) {
        var_967f24eb3ed9943a = self.origin + (0, 0, 150);
        playsoundatpos(var_967f24eb3ed9943a, "chemist_gas_grenade_defensive_tail");
    } else {
        var_967f24eb3ed9943a = self.origin + (0, 0, 150);
        playsoundatpos(var_967f24eb3ed9943a, "chemist_gas_grenade_offensive_tail");
    }
    function_84a4f38b8b39ce71();
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109c
// Size: 0x1a0
function function_84a4f38b8b39ce71() {
    self.var_80882985b5288ea2 = 1;
    if (isdefined(self.owner)) {
        self.owner notify("trigger_destroyed", self);
    }
    self notify("trigger_destroyed_immediately");
    foreach (player in self.playersintrigger) {
        if (!isdefined(player)) {
            continue;
        }
        self.playersintrigger[player getentitynumber()] = undefined;
        player thread gas_onexittrigger(self getentitynumber(), self.triggertype);
    }
    index = 0;
    while (index < self.var_aeeca2bc23f59ea4.size) {
        agent = self.var_aeeca2bc23f59ea4[index];
        if (isdefined(agent) && isdefined(agent.var_e4ba42c30663bec8) && agent.var_e4ba42c30663bec8 > 0) {
            agent.var_e4ba42c30663bec8--;
        }
        self.var_aeeca2bc23f59ea4[index] = self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size - 1];
        self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size - 1] = undefined;
        agent thread gas_onexittrigger(self getentitynumber(), self.triggertype);
    }
    self.scriptable setscriptablepartstate("smoke", "off");
    waitframe();
    self.scriptable freescriptable();
    namespace_2a9588dfac284b77::deregisterspawn();
    self delete();
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1243
// Size: 0x17d
function private function_c019d388d556f4c1() {
    level endon("game_ended");
    self endon("trigger_destroyed_immediately");
    self waittill("death");
    foreach (player in self.playersintrigger) {
        if (!isdefined(player)) {
            continue;
        }
        self.playersintrigger[player getentitynumber()] = undefined;
        player thread gas_onexittrigger(self getentitynumber(), self.triggertype);
    }
    index = 0;
    while (index < self.var_aeeca2bc23f59ea4.size) {
        agent = self.var_aeeca2bc23f59ea4[index];
        self.var_aeeca2bc23f59ea4[index] = self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size - 1];
        self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size - 1] = undefined;
        if (isdefined(agent)) {
            if (isdefined(agent.var_e4ba42c30663bec8) && agent.var_e4ba42c30663bec8 > 0) {
                agent.var_e4ba42c30663bec8--;
            }
            agent thread gas_onexittrigger(self getentitynumber(), self.triggertype);
        }
    }
    self.scriptable setscriptablepartstate("smoke", "off");
    waitframe();
    self.scriptable freescriptable();
    namespace_2a9588dfac284b77::deregisterspawn();
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c7
// Size: 0x135
function gas_onentertrigger(trigger, damage, var_e556fb63e003ee69) {
    entnum = trigger getentitynumber();
    function_7ca878a04649aec0(trigger);
    var_99466d795331383a = 1;
    if (isdefined(trigger.owner) && isdefined(trigger.owner.Chemist)) {
        if (!isdefined(damage)) {
            damage = trigger.owner.Chemist.var_6611564090223dab;
        }
        if (!isdefined(var_e556fb63e003ee69)) {
            var_e556fb63e003ee69 = trigger.owner.Chemist.var_2278441f7203ae;
        }
        thread function_415ef5b618aed907(damage, var_e556fb63e003ee69, trigger.owner, trigger.triggertype);
        var_99466d795331383a = 0;
        if (function_c1dfd599d3f3431b(self)) {
            return entnum;
        }
    }
    if (isplayer(self)) {
        function_9bf22e3dc3f67495(trigger);
        namespace_7e17181d03156026::CodcasterSetPlayerStatusEffect("gas", -1);
    }
    if (var_99466d795331383a && trigger.triggertype == "tripwire") {
        thread function_415ef5b618aed907(damage, var_e556fb63e003ee69, undefined, trigger.triggertype);
    }
    return entnum;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1504
// Size: 0x113
function gas_onexittrigger(var_b2907a4520674f1a, triggertype) {
    /#
        assertex(isdefined(var_b2907a4520674f1a), "gas_onExitTrigger called with an invalid trigger ID.");
    #/
    /#
        assertex(isdefined(triggertype), "gas_onExitTrigger called with an invalid triggerType.");
    #/
    if (!isdefined(self.gastriggerstouching) || !isdefined(self.gastriggerstouching[var_b2907a4520674f1a])) {
        return;
    }
    self.gastriggerstouching[var_b2907a4520674f1a] = undefined;
    self.lastgastouchtime = gettime();
    self notify("exited_trigger_" + var_b2907a4520674f1a);
    isplayer = isplayer(self);
    if (self.gastriggerstouching.size == 0) {
        if (isplayer) {
            namespace_7e17181d03156026::CodcasterSetPlayerStatusEffect("gas", 0);
            function_92bdd3200219d4b7();
        }
        self notify("gas_exited");
    }
    if (isdefined(triggertype) && function_cdab109851736293(triggertype) && !function_ca84aec5683c61bd(triggertype)) {
        self notify("end_gas_periodicDamage_" + triggertype);
        function_906a662a379369c7(triggertype, 0);
        if (isplayer && !istrue(self.var_d9928cc9ad437613)) {
            toggle_gasmask("off");
        }
        /#
            function_a3b978f0d3e37d36("using chemist gas grenade with an undefined agent" + triggertype);
        #/
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x161e
// Size: 0x43
function private function_7ca878a04649aec0(trigger) {
    if (!isdefined(self.gastriggerstouching)) {
        self.gastriggerstouching = [];
    }
    self.gastriggerstouching[trigger getentitynumber()] = trigger;
    self.lastgastouchtime = gettime();
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1668
// Size: 0xab
function private function_415ef5b618aed907(damage, interval, var_5fd212d893bd2ef9, triggertype) {
    if (!isdefined(damage) || !isdefined(interval) || !isdefined(triggertype)) {
        /#
            assertmsg("_gas_tryStartPeriodicDamage: one or more invalid params");
        #/
        return 0;
    }
    if (!(triggertype == "chemist_defensive" || triggertype == "chemist_offensive" || triggertype == "tripwire")) {
        /#
            assertmsg("_gas_tryStartPeriodicDamage: unsupported period damage trigger type");
        #/
        return 0;
    }
    if (function_cdab109851736293(triggertype)) {
        return 0;
    }
    function_906a662a379369c7(triggertype, 1);
    thread function_9ce4664dde233208(damage, interval, var_5fd212d893bd2ef9, triggertype);
    /#
        function_a3b978f0d3e37d36("<unknown string>" + triggertype);
    #/
    return 1;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x171b
// Size: 0x43
function private function_906a662a379369c7(triggertype, active) {
    /#
        assert(isdefined(triggertype));
    #/
    if (!isdefined(self.var_13d2db04d43dca86)) {
        self.var_13d2db04d43dca86 = [];
    }
    self.var_13d2db04d43dca86[triggertype] = active;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1765
// Size: 0x37
function private function_cdab109851736293(triggertype) {
    /#
        assert(isdefined(triggertype));
    #/
    return isdefined(triggertype) && isdefined(self.var_13d2db04d43dca86) && istrue(self.var_13d2db04d43dca86[triggertype]);
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17a4
// Size: 0x16d
function private function_9ce4664dde233208(damage, interval, attacker, triggertype, var_8a91a990c4ab18f8) {
    /#
        assert(isdefined(damage));
    #/
    /#
        assert(isdefined(interval));
    #/
    /#
        assert(isdefined(triggertype));
    #/
    level endon("game_ended");
    self endon("death");
    if (isdefined(attacker)) {
        attacker endon("death");
    }
    self endon("end_gas_periodicDamage_" + triggertype);
    if (isdefined(attacker)) {
        attacker endon("death");
    }
    isplayer = isplayer(self);
    while (1) {
        var_da4034b8609498b7 = 0;
        if (triggertype != "chemist_defensive") {
            var_da4034b8609498b7 = !function_ca84aec5683c61bd("chemist_defensive");
        } else {
            var_da4034b8609498b7 = function_ca84aec5683c61bd(triggertype);
        }
        if (var_da4034b8609498b7) {
            if (isplayer) {
                var_356dcf1f8837d91c = namespace_9c6cddd872ad75f7::hasgasmask(self);
                if (var_356dcf1f8837d91c && !istrue(self.var_11e954ae279ee245)) {
                    toggle_gasmask("on");
                }
            } else {
                var_356dcf1f8837d91c = 0;
            }
            if (var_356dcf1f8837d91c) {
                namespace_9c6cddd872ad75f7::processdamage(damage);
            } else {
                if (!isdefined(attacker)) {
                    attacker = self;
                }
                self dodamage(damage, self.origin, attacker, var_8a91a990c4ab18f8, "MOD_TRIGGER_HURT", "<explicitweaponnone>", "body");
            }
            if (isplayer && triggertype == "chemist_defensive") {
                if (var_356dcf1f8837d91c) {
                    attacker thread namespace_dc53a27a8db8e6bf::function_7f0a446fa91ff206(self);
                } else {
                    attacker thread namespace_dc53a27a8db8e6bf::function_4e8e1867968e84a5(self);
                }
            }
        }
        wait(interval);
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1918
// Size: 0xa7
function toggle_gasmask(state) {
    var_11e954ae279ee245 = self.gasmaskequipped;
    if (istrue(self.gasmaskswapinprogress)) {
        waittill_notify_or_timeout("gas_mask_swap_complete", 2);
    }
    if (state == "on" && !istrue(var_11e954ae279ee245)) {
        if (namespace_9c6cddd872ad75f7::hasgasmask(self)) {
            if (isdefined(level.var_f26b4e7eb9af8155)) {
                self [[ level.var_f26b4e7eb9af8155 ]]("chemist_gas");
                function_92bdd3200219d4b7();
            }
        }
    }
    if (state == "off") {
        if (isdefined(level.var_c57ee1e174e42601)) {
            self [[ level.var_c57ee1e174e42601 ]]("chemist_gas");
        }
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19c6
// Size: 0xb5
function private function_ca84aec5683c61bd(triggertype) {
    if (!isdefined(self.gastriggerstouching) || !isarray(self.gastriggerstouching) || !isdefined(triggertype) || !isstring(triggertype)) {
        return 0;
    }
    foreach (var_d33994dac40772a6 in self.gastriggerstouching) {
        if (isdefined(var_d33994dac40772a6) && isdefined(var_d33994dac40772a6.triggertype) && var_d33994dac40772a6.triggertype == triggertype) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a83
// Size: 0x31
function private function_6ef47ee9171ed1b9() {
    if (!isdefined(self.gastriggerstouching) || !isarray(self.gastriggerstouching)) {
        return 0;
    }
    return self.gastriggerstouching.size > 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abc
// Size: 0x11f
function function_abe80254fe179ec7(var_efabc4062374b3cb, var_ddd8710e868c582e) {
    self endon("death");
    level endon("game_ended");
    if (!function_6ee3c7d8ed420d0b(self)) {
        return;
    }
    if (!istrue(var_ddd8710e868c582e) || self.Chemist.var_fc43a1c4946c4cb8.size < self.Chemist.var_68d81840282013fc) {
        radius = self.Chemist.var_a985895b5796100b;
        duration = self.Chemist.var_151cd74fd4c1f445;
        if (istrue(var_ddd8710e868c582e)) {
            radius = self.Chemist.var_3ac97be6a272fd0c;
            duration = self.stalker.var_35d7093a7102d784;
        }
        gasgrenade = gas_createtrigger(var_efabc4062374b3cb, self, self.team, duration, radius, var_ddd8710e868c582e);
        if (istrue(var_ddd8710e868c582e)) {
            self.Chemist.var_fc43a1c4946c4cb8 = array_add(self.Chemist.var_fc43a1c4946c4cb8, gasgrenade);
        }
        return gasgrenade;
    }
    return undefined;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1be3
// Size: 0x94
function private function_6ee3c7d8ed420d0b(agent) {
    if (!isdefined(agent)) {
        /#
            assertex(0, "using chemist gas grenade with an undefined agent");
        #/
        return 0;
    }
    if (!isalive(agent)) {
        return 0;
    }
    if (isdefined(agent.Chemist)) {
        return 1;
    }
    /#
        if (int(getunarchiveddebugdvar(@"hash_213776149170b77d", "gas_mask_swap_complete"))) {
            var_bfc5850d296d2ebe = namespace_ad1f398af6f48cb1::function_9acf953fd6bf2e46("<unknown string>");
            if (isdefined(var_bfc5850d296d2ebe)) {
                function_c17d42c1c9426b4f(agent, var_bfc5850d296d2ebe);
                return 1;
            }
        }
    #/
    /#
        assertex(0, "using chemist gas grenade with an invalid ai type");
    #/
    return 0;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7f
// Size: 0x33
function function_870ea0fefcd757f4(var_da81be04f834cffa, var_53567942b7869ae4) {
    val::set("chemist", "show_healthbar", var_da81be04f834cffa);
    if (istrue(var_53567942b7869ae4)) {
        function_d11b100bf72af184(var_da81be04f834cffa);
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb9
// Size: 0xa5
function function_d11b100bf72af184(showicon) {
    if (isdefined(self) && isdefined(self.ob) && isdefined(self.ob.headicon)) {
        /#
            if (int(getunarchiveddebugdvar(@"hash_54fc92ada753c66a", "gas_mask_swap_complete"))) {
                print3d(self.origin, "<unknown string>" + showicon + "<unknown string>" + gettime(), (1, 1, 0), 1, 1, 30);
            }
        #/
        function_a816310bc49e69b5(self.ob.headicon, !showicon);
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d65
// Size: 0xeb
function function_157fa9f486d53b6e() {
    self endon("death");
    self endon("trigger_exited");
    level endon("game_ended");
    /#
        thread function_1278077fcd4b2924();
    #/
    while (self.var_e4ba42c30663bec8 > 0) {
        if (isdefined(self.var_2cb06c767e8080ff) && self.var_2cb06c767e8080ff < gettime()) {
            function_870ea0fefcd757f4(0, isdefined(self.Chemist));
        }
        waitframe();
    }
    if (isdefined(self.var_a4738c70736d3a61) && self.var_a4738c70736d3a61 == &function_b33be13e1e5a9315) {
        self.var_a4738c70736d3a61 = undefined;
    }
    function_870ea0fefcd757f4(1, isdefined(self.Chemist));
    /#
        if (int(getunarchiveddebugdvar(@"hash_54fc92ada753c66a", "gas_mask_swap_complete"))) {
            print3d(self.origin, "<unknown string>", (1, 0, 1), 1, 1, 30, 1);
        }
    #/
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e57
// Size: 0x2f
function function_584accf001003add(grenade) {
    grenade endon("death");
    thread function_eae98d11d50d3558(grenade, 0);
    thread function_241fbb1f7f839637(grenade, 0);
    thread namespace_dc53a27a8db8e6bf::function_f096dea082480f5();
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8d
// Size: 0xac
function function_b33be13e1e5a9315(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    function_870ea0fefcd757f4(1, isdefined(self.Chemist));
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    self.var_2cb06c767e8080ff = gettime() + 3000;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f40
// Size: 0x4b
function function_eae98d11d50d3558(grenade, var_ddd8710e868c582e) {
    grenade thread notifyafterframeend("death", "end_explode");
    grenade endon("end_explode");
    position = grenade waittill("explode");
    thread function_abe80254fe179ec7(position, var_ddd8710e868c582e);
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f92
// Size: 0x77
function function_241fbb1f7f839637(grenade, var_ddd8710e868c582e) {
    grenade endon("explode");
    var_7842e9e94384087b = grenade waittill("missile_water_impact");
    grenade notify("end_explode");
    var_a681b7890cd017c7 = grenade waittill("missile_stuck");
    position = grenade.origin;
    thread function_abe80254fe179ec7(position + (0, 0, 10), var_ddd8710e868c582e);
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2010
// Size: 0x39
function private function_c1dfd599d3f3431b(player) {
    return isdefined(player.gasmaskhealth) && player.gasmaskhealth > 0 || istrue(player.gasmaskswapinprogress);
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2051
// Size: 0x71
function function_9bf22e3dc3f67495(trigger) {
    if (isplayer(self)) {
        if (!function_c1dfd599d3f3431b(self) && (istrue(self.var_d9928cc9ad437613) || function_6ef47ee9171ed1b9())) {
            if (isdefined(trigger)) {
                thread namespace_d39a86483d995ed1::gas_applycough(trigger.owner, 0);
            }
            if (function_6ef47ee9171ed1b9()) {
                thread namespace_d39a86483d995ed1::gas_applyspeedredux();
                thread namespace_d39a86483d995ed1::gas_applyblur();
            }
            namespace_e765f0aad2368473::enableloopingcoughaudio();
        }
    }
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c9
// Size: 0x5a
function function_92bdd3200219d4b7() {
    if (isplayer(self)) {
        if (function_c1dfd599d3f3431b(self)) {
            var_e6a6756bbbe9a3e = 1;
        }
        if (!function_6ef47ee9171ed1b9()) {
            thread namespace_d39a86483d995ed1::gas_removespeedredux();
            thread namespace_d39a86483d995ed1::gas_removeblur();
            if (!istrue(self.var_d9928cc9ad437613)) {
                var_e6a6756bbbe9a3e = 1;
            }
        }
    }
    if (istrue(var_e6a6756bbbe9a3e)) {
        namespace_e765f0aad2368473::clearloopingcoughaudio();
    }
    return var_e6a6756bbbe9a3e;
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x212b
// Size: 0x31
function private function_a3b978f0d3e37d36(text) {
    /#
        if (!getdvarint(@"hash_17f79f0678395264", 0)) {
            return;
        }
        namespace_d8bd5ac27a00a48d::function_7320cd1e4f724899(text);
        println(text);
    #/
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2163
// Size: 0x1e1
function private function_b8f06ed708934a74() {
    /#
        localplayer = level.player;
        if (!isdefined(localplayer) || !isalive(localplayer)) {
            return;
        }
        offset_x = 400;
        offset_y = 100;
        scale = 1;
        var_5586c56327f1927f = 20;
        printtoscreen2d(offset_x, offset_y, "<unknown string>", (0, 1, 1), scale);
        offset_y = offset_y + var_5586c56327f1927f;
        if (isdefined(localplayer.gasmaskhealth) && isdefined(localplayer.gasmaskmaxhealth)) {
            printtoscreen2d(offset_x, offset_y, "<unknown string>" + localplayer.gasmaskhealth + "<unknown string>" + localplayer.gasmaskmaxhealth, (0, 1, 1), scale);
            offset_y = offset_y + var_5586c56327f1927f;
        }
        if (localplayer function_6ef47ee9171ed1b9()) {
            foreach (id, var_d33994dac40772a6 in localplayer.gastriggerstouching) {
                if (isdefined(var_d33994dac40772a6)) {
                    var_af39c5596b6f70d8 = function_53c4c53197386572(var_d33994dac40772a6.triggertype, "<unknown string>");
                    printtoscreen2d(offset_x, offset_y, "<unknown string>" + id + "<unknown string>" + var_af39c5596b6f70d8, (0, 1, 0), scale);
                    offset_y = offset_y + var_5586c56327f1927f;
                } else {
                    printtoscreen2d(offset_x, offset_y, "<unknown string>", (1, 0, 0), scale);
                    offset_y = offset_y + var_5586c56327f1927f;
                }
            }
        } else {
            printtoscreen2d(offset_x, offset_y, "<unknown string>", (0, 1, 0), scale);
            offset_y = offset_y + var_5586c56327f1927f;
        }
    #/
}

// Namespace namespace_5ba3e3853aa3d403/namespace_d3f3cf99d75d3345
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x234b
// Size: 0x98
function private function_1278077fcd4b2924() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (self.var_e4ba42c30663bec8 > 0) {
            dvar = int(getunarchiveddebugdvar(@"hash_54fc92ada753c66a", "gas_mask_swap_complete"));
            if (dvar) {
                text = ter_op(val::get("<unknown string>"), "<unknown string>", "<unknown string>");
                print3d(self.origin, text, (1, 0, 1), 1, 1, 1, 1);
            }
            waitframe();
        }
    #/
}

