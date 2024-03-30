// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_48814951e916af89;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\poi.gsc;
#using script_4948cdf739393d2d;
#using scripts\asm\asm_bb.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_24fbedba9a7a1ef4;
#using scripts\mp\mp_agent.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;

#namespace namespace_6deceacb2ad6159c;

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2
// Size: 0xfd
function function_918a46f20addf647() {
    flag_init("weapon_unholstered");
    flag_set("weapon_unholstered");
    if (isdefined(level.var_53025d9816fe4c04)) {
        return;
    }
    level.var_53025d9816fe4c04 = 1;
    level.agent_funcs["civilian"]["on_damaged"] = &function_9f22513c237365a7;
    level.agent_funcs["civilian"]["on_damaged_finished"] = &function_1ec45cfcafe23fa1;
    level.var_d96498742cfc8242 = getdvarint(@"hash_7f7f3e4f27363c65", 4);
    var_94368422a679c17b = getdvarint(@"hash_a199ce36eba582c6", 1024);
    level.var_1d0f7527b2fff2a2 = var_94368422a679c17b * var_94368422a679c17b;
    var_94137a22a65363c5 = getdvarint(@"hash_a1bce036ebcbf214", 3072);
    level.var_1cec5f27b2d97a88 = var_94137a22a65363c5 * var_94137a22a65363c5;
    function_d9a5084e1bcc12d9();
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    function_2dca426ba427ff57();
    /#
        level thread function_553261340a810ed3();
        level thread function_5e07c420d97d072f();
    #/
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e6
// Size: 0x218
function function_d9a5084e1bcc12d9() {
    level.var_2489811b7f5f3db3 = function_be00a6ea8c66d625();
    level.var_4f97aeeedc49636a = function_5c0bb5166c0babe0(0);
    level.var_c0163a9efdc36902 = function_5c0bb5166c0babe0(1);
    level.var_ab017d8436d7f265 = [];
    if (getdvarint(@"hash_580b92e548153095", 1) == 1) {
        level.var_ab017d8436d7f265 = function_5d0c8ce44d66af45();
    }
    if (function_47d356083884f913()) {
        function_44739fe1cf82e29a("civSpawnLocs");
        foreach (loc in level.var_2489811b7f5f3db3) {
            function_d0e7647e5538eb9d(loc.poi, "civSpawnLocs", loc);
        }
        function_44739fe1cf82e29a("civInteractionSpawnLocs");
        foreach (loc in level.var_ab017d8436d7f265) {
            function_d0e7647e5538eb9d(loc.poi, "civInteractionSpawnLocs", loc);
        }
        function_44739fe1cf82e29a("civFleeLocs_exterior");
        foreach (loc in level.var_4f97aeeedc49636a) {
            function_d0e7647e5538eb9d(loc.poi, "civFleeLocs_exterior", loc);
        }
        function_44739fe1cf82e29a("civFleeLocs_interior");
        foreach (loc in level.var_c0163a9efdc36902) {
            function_d0e7647e5538eb9d(loc.poi, "civFleeLocs_interior", loc);
        }
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0x41
function function_be00a6ea8c66d625() {
    spawnlocs = getstructarray("civilian_spawn_loc", "targetname");
    spawnlocs = array_combine(getstructarray("civilian_spawn_loc", "script_noteworthy"), spawnlocs);
    spawnlocs = array_randomize(spawnlocs);
    return spawnlocs;
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4e
// Size: 0x28
function function_5d0c8ce44d66af45() {
    spawnlocs = getstructarray("civilian_interaction_spawn_loc", "targetname");
    spawnlocs = array_randomize(spawnlocs);
    return spawnlocs;
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7e
// Size: 0x10e
function function_5c0bb5166c0babe0(interior) {
    var_259b58d8d085f172 = [];
    locs = getstructarray("civilian_flee_loc", "targetname");
    var_cf43c0073346699e = 5;
    currentframe = 0;
    foreach (struct in locs) {
        if (namespace_9823ee6035594d67::function_2cde636a73aead3d(struct.origin)) {
            struct.var_c79dca57049c64d4 = 1;
        }
        isinterior = isdefined(struct.script_noteworthy) && struct.script_noteworthy == "interior";
        if (istrue(interior)) {
            if (isinterior) {
                var_259b58d8d085f172[var_259b58d8d085f172.size] = struct;
            }
        } else if (!isinterior) {
            var_259b58d8d085f172[var_259b58d8d085f172.size] = struct;
        }
        currentframe++;
        if (currentframe == var_cf43c0073346699e) {
            currentframe = 0;
            waitframe();
        }
    }
    return var_259b58d8d085f172;
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc94
// Size: 0x2eb
function function_2dca426ba427ff57() {
    if (!isdefined(level.var_54ced3f63493d9de)) {
        level.var_54ced3f63493d9de = [];
    }
    if (!function_47d356083884f913()) {
        foreach (spawnloc in level.var_ab017d8436d7f265) {
            ai = spawn_civilian(spawnloc, undefined, undefined, undefined, undefined, 1);
            level.var_54ced3f63493d9de[level.var_54ced3f63493d9de.size] = ai;
        }
        foreach (spawnloc in level.var_2489811b7f5f3db3) {
            ai = spawn_civilian(spawnloc, undefined, undefined, undefined, undefined, 1);
            level.var_54ced3f63493d9de[level.var_54ced3f63493d9de.size] = ai;
        }
        return;
    }
    foreach (poiname, poi in level.poi) {
        foreach (spawnloc in poi["civInteractionSpawnLocs"]) {
            ai = spawn_civilian(spawnloc, undefined, poiname, undefined, undefined, 1);
            level.var_54ced3f63493d9de[level.var_54ced3f63493d9de.size] = ai;
        }
    }
    var_9a6ecbe35c09c506 = [];
    foreach (poiname, poi in level.poi) {
        if (array_contains(level.var_ab20b3a256911579, poiname) || !isdefined(poi["civSpawnLocs"])) {
            continue;
        }
        foreach (spawnloc in poi["civSpawnLocs"]) {
            var_9a6ecbe35c09c506[var_9a6ecbe35c09c506.size] = spawnloc;
        }
    }
    foreach (spawnloc in array_randomize(var_9a6ecbe35c09c506)) {
        ai = spawn_civilian(spawnloc, undefined, spawnloc.poi, undefined, undefined, 1);
        level.var_54ced3f63493d9de[level.var_54ced3f63493d9de.size] = ai;
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf86
// Size: 0x19b
function spawn_civilian(struct, path, poiname, initialcap, var_9b2697384ed3425e, var_e195245abf56681b, var_46c6e189d91aa34c, priorityoverride) {
    ismale = 0;
    agenttype = ter_op(ismale, "civilian_mp_dmz_male", "civilian_mp_dmz_female");
    var_d2664652fb0cb884 = "civilian";
    if (isdefined(var_46c6e189d91aa34c)) {
        var_d2664652fb0cb884 = var_46c6e189d91aa34c;
    }
    priority = "filler";
    if (isdefined(priorityoverride)) {
        priority = priorityoverride;
    }
    ai = ai_mp_requestspawnagent(agenttype, getclosestpointonnavmesh(struct.origin), struct.angles, priority, var_d2664652fb0cb884, undefined, "civs", "civilian", undefined, poiname);
    if (!isdefined(ai)) {
        return;
    }
    ai.ignoreme = 1;
    ai.health = 1;
    ai.maxhealth = 1;
    ai function_9f82c74eb1b7caf9(0);
    ai.gender = ter_op(ismale, "male", "female");
    if (istrue(var_e195245abf56681b)) {
        ai.goalradius = 1536;
        ai registerciv();
        return ai;
    }
    ai scripts/asm/asm_bb::bb_setcivilianstate("casual");
    waitframe();
    ai thread bulletwhizbylistener();
    if (isdefined(path)) {
        ai forceteleport(path.origin, path.angles);
        ai setgoalpos(path.origin);
    }
    return ai;
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1129
// Size: 0x93
function function_32de403142a7242e(agent, spawnorigin) {
    agent endon("death");
    interval = 0.05;
    while (true) {
        thread scripts/mp/utility/debug::drawsphere(agent.origin, 32, interval, (1, 0, 0));
        thread scripts/mp/utility/debug::drawsphere(spawnorigin, 32, interval, (0, 1, 0));
        thread scripts/cp_mp/utility/debug_utility::drawline(spawnorigin, agent.origin, interval, (0, 0, 1));
        wait(interval);
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11c3
// Size: 0xea
function function_b9c9324be6322ddf(text, offset, tag, duration) {
    /#
        self endon("dx_vom_cvm1_alley_triage_50");
        self notify("dx_vom_aqm2_2nd_floor_hallway_24");
        self endon("dx_vom_aqm2_2nd_floor_hallway_24");
        endtime = undefined;
        if (isdefined(duration)) {
            endtime = gettime() + duration * 1000;
        }
        if (isdefined(tag) && self tagexists(tag)) {
            while (!isdefined(endtime) || gettime() < endtime) {
                print3d(self gettagorigin(tag) + offset, text, (1, 1, 1), 1, 0.5, 1, 1);
                waitframe();
            }
            return;
        }
        while (!isdefined(endtime) || gettime() < endtime) {
            print3d(self.origin + offset, text, (1, 1, 1), 1, 0.5, 1, 1);
            waitframe();
        }
    #/
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b4
// Size: 0x306
function civ_sayDialogue() {
    self endon("death");
    self notify("civ_sayDialogue");
    self endon("civ_sayDialogue");
    if (!isdefined(level.var_fa6ef45d45ed4496)) {
        aliases = [];
        aliases[aliases.size] = "dx_vom_cvm1_civ_ambush_civ_10";
        aliases[aliases.size] = "dx_vom_cvm1_civ_ambush_civ_20";
        aliases[aliases.size] = "dx_vom_cvm1_civ_ambush_civ_30";
        aliases[aliases.size] = "dx_vom_cvm1_intro_clearance_150";
        aliases[aliases.size] = "dx_vom_cvm2_alley_triage_40";
        aliases[aliases.size] = "dx_vom_cvm1_alley_triage_50";
        aliases[aliases.size] = "dx_vom_cvm2_alley_triage_60";
        aliases[aliases.size] = "dx_vom_cvm1_poppies_start_fields_120";
        aliases[aliases.size] = "dx_vom_cvm1_poppies_start_fields_300";
        aliases[aliases.size] = "dx_vom_aqm2_2nd_floor_hallway_22";
        aliases[aliases.size] = "dx_vom_aqm3_2nd_floor_hallway_23";
        aliases[aliases.size] = "dx_vom_aqm2_2nd_floor_hallway_24";
        aliases[aliases.size] = "dx_vom_cvm2_reception_bulletproof_90";
        aliases[aliases.size] = "dx_vom_cvm1_reception_bulletproof_100";
        aliases[aliases.size] = "dx_vom_cvm2_reception_bulletproof_103";
        aliases[aliases.size] = "dx_vom_cvm2_breach_offices_140";
        aliases[aliases.size] = "dx_vom_cvm1_alley_moving_120";
        aliases[aliases.size] = "dx_vom_cvm1_market_rations_20";
        aliases[aliases.size] = "dx_vom_cvm1_infil_thief_20";
        aliases[aliases.size] = "dx_vom_cvm1_infil_thief_110";
        level.var_fa6ef45d45ed4496 = create_deck(aliases, 1, 1);
        aliases = [];
        aliases[aliases.size] = "dx_vom_ucm4_right_underground_rescue_40";
        aliases[aliases.size] = "dx_vom_rcm2_entrance_civs_30";
        aliases[aliases.size] = "dx_vom_rcm3_entrance_civs_40";
        level.var_e80e768c655a9bed = create_deck(aliases, 0, 0);
    }
    wait(randomfloatrange(0.5, 2));
    if (isdefined(self.var_6542bcc8942334da) && gettime() < self.var_6542bcc8942334da) {
        return;
    }
    var_8e399d0d86db13ed = 0;
    if (percent_chance(75) && self pathdisttogoal() > 512) {
        alias = level.var_e80e768c655a9bed deck_draw();
        thread function_50ac20187f26a0dc();
    } else {
        alias = level.var_fa6ef45d45ed4496 deck_draw();
        var_8e399d0d86db13ed = 1;
    }
    self playsound(alias, undefined, self);
    sound_length = lookupsoundlength(alias, 1);
    self.var_6542bcc8942334da = gettime() + sound_length + 3000;
    var_3fc6453968c77b59 = getaiarrayinradius(self.origin, 300, "team_five");
    foreach (civ in var_3fc6453968c77b59) {
        if (percent_chance(30)) {
            civ.var_6542bcc8942334da = self.var_6542bcc8942334da;
        }
    }
    if (!var_8e399d0d86db13ed) {
        return;
    }
    wait(sound_length / 1000);
    wait(randomfloatrange(0.5, 2));
    if (self pathdisttogoal() < 512) {
        return;
    }
    alias = level.var_e80e768c655a9bed deck_draw();
    thread function_50ac20187f26a0dc();
    self playsound(alias, undefined, self);
    sound_length = lookupsoundlength(alias, 1);
    self.var_6542bcc8942334da = gettime() + sound_length + 3000;
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c1
// Size: 0xa5
function function_9f22513c237365a7(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!namespace_daa149ca485fd50a::function_84a1aec445b03580(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon)) {
        return;
    }
    scripts/mp/mp_agent::default_on_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params e, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166d
// Size: 0x99
function function_1ec45cfcafe23fa1(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname, armorhit) {
    self stopsounds();
    thread delaytest(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname, armorhit);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170d
// Size: 0x99
function delaytest(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname, armorhit) {
    self endon("death");
    waitframe();
    scripts/mp/mp_agent::default_on_damage_finished(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname, armorhit);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ad
// Size: 0x7c
function function_50ac20187f26a0dc() {
    self endon("death");
    self notify("stopSoundsIfNotMoving");
    self endon("stopSoundsIfNotMoving");
    while (true) {
        wait(0.2);
        if (!self codemoverequested()) {
            alias = level.var_fa6ef45d45ed4496 deck_draw();
            self playsound(alias, undefined, self);
            sound_length = lookupsoundlength(alias, 1);
            self.var_6542bcc8942334da = gettime() + sound_length + 3000;
            return;
        }
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1830
// Size: 0x18
function deregisterondeath() {
    self waittill("death");
    [[ level.var_bbd8a18655d9495b ]](self);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184f
// Size: 0x245
function doorwatcher() {
    self endon("death");
    self endon("goal");
    contents = scripts/engine/trace::create_solid_ai_contents(1);
    while (true) {
        nearbydoors = scripts/cp_mp/utility/scriptable_door_utility::scriptable_door_get_in_radius(self.origin, 60, 20);
        foreach (door in nearbydoors) {
            doorfwd = anglestoforward(door.angles);
            doorcenter = door.origin + doorfwd * 30 + (0, 0, 40);
            var_98ad6b267eb7431b = door.origin + doorfwd * 30;
            agentfwd = anglestoforward(self.angles);
            if (isdefined(door.var_d2214be976945fde) && gettime() < door.var_d2214be976945fde + 1000) {
                continue;
            }
            handletrace = scripts/engine/trace::ray_trace(self geteye(), doorcenter, self, contents);
            if (handletrace["fraction"] < 0.7) {
                continue;
            }
            if (vectordot(agentfwd, vectornormalize(var_98ad6b267eb7431b - self.origin)) < 0.6) {
                continue;
            }
            right = anglestoright(door.angles);
            normal = vectornormalize(self.origin - door.origin);
            dot = vectordot(right, normal);
            var_da2d1a382c620732 = dot > 0;
            if (istrue(var_da2d1a382c620732)) {
                bashstate = "bash_left_90";
            } else {
                bashstate = "bash_right_90";
            }
            currentstate = door getscriptablepartstate("door");
            if (currentstate != bashstate) {
                door setscriptablepartstate("door", bashstate, 0);
                door.var_d2214be976945fde = gettime();
            }
        }
        waitframe();
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9b
// Size: 0xc7
function bulletwhizbylistener() {
    self endon("death");
    while (true) {
        attacker, dist, position = self waittill("bulletwhizby");
        if (istrue(self.ishostage)) {
            continue;
        }
        event = spawnstruct();
        event.entitytype = "civilian";
        event.originator = attacker;
        event.position = ter_op(isdefined(position), position, self.origin);
        event.time = gettime();
        event.type = "gunshot";
        self [[ level.var_f29702ddc09d1002 ]](event);
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b69
// Size: 0xd1
function fleeFromPlayerProximity() {
    self endon("death");
    self notify("fleeFromPlayerProximity");
    self endon("fleeFromPlayerProximity");
    var_2e0d80daaab7f018 = getdvarint(@"hash_f862c6ae0538549f", 768);
    var_b8c1899adc1a8760 = var_2e0d80daaab7f018 * var_2e0d80daaab7f018;
    while (true) {
        if (!istrue(self.ishostage)) {
            closestplayer = [[ level.var_ffa48a6a79a7224 ]](self.origin);
            if (isdefined(closestplayer)) {
                playerdistsq = distancesquared(closestplayer.origin, self.origin);
                if (playerdistsq < var_b8c1899adc1a8760) {
                    self.var_dd25f55f775fa187 = closestplayer.origin;
                    break;
                }
            }
        }
        wait(0.25);
    }
    self.attitude = "panicked";
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c41
// Size: 0xa6
function function_414e92de6d8a19ad() {
    level namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_2d6fa894e261f129);
    level.var_329506c1d6753e87 = getdvarint(@"hash_1ed01a3ac2e46a7c", 3);
    level.var_80038fc2cac83ed1 = getdvarint(@"hash_4e05813ba09e44e2", 5);
    level.var_dcfd97311ee632b = getdvarint(@"hash_4c5a379275261110", 10);
    level.var_68cecb730a9d965b = getdvarint(@"hash_50c71a1b6ecf22c7", 15);
    level.var_fdc5c47200603515 = getdvarint(@"hash_9e35a31c63222311", 10);
    level.var_a6e41f71a686369f = getdvarint(@"hash_f4083999d389ca6b", 3);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cee
// Size: 0xdf
function function_2d6fa894e261f129(agent, killer) {
    if (isdefined(agent.unittype) && agent.unittype == "civilian" && isdefined(killer) && namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "category") != "mission") {
        player = undefined;
        if (isplayer(killer)) {
            player = killer;
        } else if (killer scripts/cp_mp/vehicles/vehicle::isvehicle() && isdefined(killer.owners) && isdefined(killer.owners[0])) {
            player = killer.owners[0];
        }
        if (isdefined(player)) {
            if (!isdefined(player.civiliankillcount)) {
                player.civiliankillcount = 0;
            }
            player.civiliankillcount++;
            player function_da0c4e190ee1da89();
        }
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd4
// Size: 0x30b
function function_da0c4e190ee1da89() {
    allteammates = scripts/mp/utility/teams::getsquadmates(self.team, self.sessionsquadid, 1);
    otherteammates = array_remove(allteammates, self);
    if (self.civiliankillcount == 1) {
        namespace_446fc987a980892f::playevent("player_civ_kill_frst_warning", allteammates);
        return;
    }
    if (self.civiliankillcount == 2) {
        namespace_446fc987a980892f::playevent("player_civ_kill_second_warning", allteammates);
        return;
    }
    if (self.civiliankillcount == level.var_329506c1d6753e87) {
        namespace_446fc987a980892f::playevent("player_civ_kill_third_warning", [self]);
        namespace_446fc987a980892f::playevent("squad_civ_bounty", otherteammates);
        level function_6231f251a918f35f(self);
        self.objpingdelay = level.var_68cecb730a9d965b;
        function_e4a099b25f255d6c();
        showassassinationtargethud(self, 3);
        level thread function_1214aad9fb9087cc(self);
        foreach (team in level.teamnamelist) {
            if (team != self.team) {
                scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_them", getteamdata(team, "players"));
                continue;
            }
            scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_us", getteamdata(team, "players"));
        }
        return;
    }
    if (self.civiliankillcount == level.var_80038fc2cac83ed1) {
        self.objpingdelay = level.var_fdc5c47200603515;
        showassassinationtargethud(self, 4);
        self iprintlnbold("WARNING: Your bounty has increased!");
        foreach (team in level.teamnamelist) {
            if (team != self.team) {
                scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_them_inc", getteamdata(team, "players"));
                continue;
            }
            scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_us_inc", getteamdata(team, "players"));
        }
        return;
    }
    if (self.civiliankillcount == level.var_dcfd97311ee632b) {
        self.objpingdelay = level.var_a6e41f71a686369f;
        showassassinationtargethud(self, 5);
        self iprintlnbold("WARNING: Maximum bounty has been placed on you!");
        foreach (team in level.teamnamelist) {
            if (team != self.team) {
                scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_them_inc", getteamdata(team, "players"));
                continue;
            }
            scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_us_inc", getteamdata(team, "players"));
        }
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e6
// Size: 0x106
function function_e4a099b25f255d6c() {
    self.objidbounty = scripts/mp/objidpoolmanager::requestobjectiveid(99);
    objid = self.objidbounty;
    objective_setlabel(objid, "MP_INGAME_ONLY/OBJ_TARGET_CAPS");
    scripts/mp/objidpoolmanager::update_objective_setzoffset(objid, 90);
    scripts/mp/objidpoolmanager::update_objective_icon(objid, "ui_map_icon_bounty");
    objective_setplayintro(objid, 0);
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(objid);
    scripts/mp/objidpoolmanager::update_objective_setbackground(objid, 2);
    scripts/mp/objidpoolmanager::update_objective_position(objid, self.origin + (0, 0, 100));
    scripts/mp/objidpoolmanager::update_objective_state(objid, "current");
    scripts/mp/objidpoolmanager::update_objective_onentity(objid, self);
    foreach (team in level.teamnamelist) {
        if (team != self.team) {
            scripts/mp/objidpoolmanager::objective_teammask_addtomask(objid, team);
        }
    }
    thread updatetargetlocation();
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f3
// Size: 0x8d
function updatetargetlocation() {
    level endon("game_ended");
    self endon("task_endon_trigger_removed");
    objective_setpings(self.objidbounty, 1);
    for (;;) {
        if (isdefined(self) && isdefined(self.origin)) {
            scripts/mp/objidpoolmanager::update_objective_position(self.objidbounty, self.origin + (0, 0, 100));
            objective_ping(self.objidbounty);
        } else {
            break;
        }
        wait(self.objpingdelay);
    }
    /#
        level iprintlnbold("bash_right_90");
    #/
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2287
// Size: 0x20
function function_e2a9a038fa6830d5(dialog) {
    if (soundexists(dialog)) {
        self queuedialogforplayer(dialog, dialog, 2);
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ae
// Size: 0xe6
function function_6231f251a918f35f(bountytarget) {
    foreach (entry in level.teamnamelist) {
        if (isdefined(bountytarget.team) && bountytarget.team == entry) {
            foreach (player in scripts/mp/utility/teams::getteamdata(entry, "players")) {
                if (player != bountytarget) {
                    player queuedialogforplayer("dx_bra_uktl_mission_mission_ass_hunted", "dx_bra_uktl_mission_mission_ass_hunted", 2);
                }
            }
            break;
        }
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239b
// Size: 0xdc
function function_1214aad9fb9087cc(bountytarget) {
    foreach (entry in level.teamnamelist) {
        if (isdefined(bountytarget.team) && bountytarget.team != entry) {
            foreach (player in scripts/mp/utility/teams::getteamdata(entry, "players")) {
                player queuedialogforplayer("dx_mpa_uktl_enmy_kills_multi_civs_bounty", "dx_mpa_uktl_enmy_kills_multi_civs_bounty", 2);
            }
        }
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247e
// Size: 0x72
function updateassassinationdataomnvar(targetplayer, threatlevel) {
    if (isdefined(self.aq_targethudenabled) && self.aq_targethudenabled) {
        entitynumber = targetplayer getentitynumber();
    } else {
        entitynumber = -1;
    }
    entitynumber = targetplayer getentitynumber();
    entitynumber = entitynumber + 1;
    value = threatlevel << 8 | entitynumber;
    self setclientomnvar("ui_br_assassination_target", value);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24f7
// Size: 0x7e
function updateassassinationthreatlevel(targetteam) {
    foreach (player in getteamdata(self.targetteam, "players")) {
        player updateassassinationdataomnvar(self.targetplayer, self.threat_level);
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257c
// Size: 0x28
function showassassinationtargethud(targetplayer, threatlevel) {
    self.aq_targethudenabled = 1;
    updateassassinationdataomnvar(targetplayer, threatlevel);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ab
// Size: 0x1a
function hideassassinationtargethud() {
    self.aq_targethudenabled = 0;
    self setclientomnvar("ui_br_assassination_target", 0);
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25cc
// Size: 0x148
function function_a5d597201278c71c(victim) {
    attacker = self;
    if (isdefined(attacker) && !isagent(attacker) && isdefined(attacker.team) && attacker.team != victim.team) {
        level thread scripts/mp/gametypes/br_public::brleaderdialogteam("mission_enemy_down", attacker.team, 1);
        if (isdefined(level.var_52781be0b4e8a959)) {
            level [[ level.var_52781be0b4e8a959 ]](attacker.team);
        }
        scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_civ_bounty_complete", getteamdata(attacker.team, "players"));
        foreach (player in getteamdata(attacker.team, "players")) {
            player scripts/mp/gametypes/br_plunder::playerplunderpickup(getdvarint(@"hash_4f221c528dddee47", 100), undefined, 1);
        }
        victim setclientomnvar("ui_br_assassination_target", 0);
        scripts/mp/objidpoolmanager::returnobjectiveid(victim.objidbounty);
    }
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x271b
// Size: 0x68
function function_5e94057030ae86c4(isinterior, poiname) {
    if (!function_47d356083884f913()) {
        if (istrue(isinterior)) {
            return level.var_c0163a9efdc36902;
        } else {
            return level.var_4f97aeeedc49636a;
        }
        return;
    }
    if (istrue(isinterior)) {
        return level.poi[poiname]["civFleeLocs_interior"];
    }
    return level.poi[poiname]["civFleeLocs_exterior"];
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x278a
// Size: 0x1c3
function function_553261340a810ed3() {
    /#
        while (true) {
            if (getdvarint(@"hash_25b9c49d3620ac52", 0) == 1) {
                foreach (loc in level.var_4f97aeeedc49636a) {
                    color = (0, 1, 0);
                    if (istrue(loc.inuse)) {
                        color = (1, 0, 0);
                    } else if (istrue(loc.var_c79dca57049c64d4)) {
                        color = (0, 0, 1);
                    }
                    thread scripts/mp/utility/debug::drawline(loc.origin, loc.origin + (0, 0, 200), 1, color);
                }
                foreach (loc in level.var_c0163a9efdc36902) {
                    color = (1, 1, 0);
                    if (istrue(loc.inuse)) {
                        color = (1, 0, 0);
                    } else if (istrue(loc.var_c79dca57049c64d4)) {
                        color = (0, 0, 1);
                    }
                    thread scripts/mp/utility/debug::drawline(loc.origin, loc.origin + (0, 0, 100), 1, color);
                }
            }
            wait(1);
        }
    #/
}

// Namespace namespace_6deceacb2ad6159c / namespace_c50aac14f506294b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2954
// Size: 0xa6
function function_5e07c420d97d072f() {
    /#
        while (true) {
            if (getdvarint(@"hash_4d802ef072f687fb", 0) == 1) {
                foreach (civ in level.var_54ced3f63493d9de) {
                    if (isalive(civ)) {
                        thread scripts/mp/utility/debug::drawsphere(civ.origin, 64, 1, (1, 1, 1));
                    }
                }
            }
            wait(1);
        }
    #/
}

