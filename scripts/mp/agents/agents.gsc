// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\damage.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\riotshield.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\agents\agent_common.gsc;
#using scripts\mp\bots\bots_gametype_war.gsc;
#using scripts\mp\mp_agent_damage.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\weapons.gsc;
#using script_372301af73968cb;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_cbb0697de4c5728;
#using scripts\mp\bots\bots_loadout.gsc;

#namespace agents;

// Namespace agents/namespace_b97aebbb3666dd87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x406
// Size: 0x9f
function main() {
    if (isdefined(level.createfx_enabled) && level.createfx_enabled) {
        return;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        if (!istrue(level.var_62f6f7640e4431e3.var_e77038812bc72875) && !istrue(level.brenableagents)) {
            return;
        }
    } else if (namespace_36f464722d326bbe::function_ba5574c7f287c587() && namespace_cd0b2d039510b38d::getsubgametype() != "champion") {
        return;
    }
    setup_callbacks();
    level.badplace_cylinder_func = &badplace_cylinder;
    level.badplace_delete_func = &badplace_delete;
    /#
        level thread function_8a38b0ab8ed5310d();
    #/
    level thread namespace_4580e60e1b7b40e2::init();
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0xc8
function setup_callbacks() {
    if (!isdefined(level.agent_funcs)) {
        level.agent_funcs = [];
    }
    level.agent_funcs["player"] = [];
    level.agent_funcs["player"]["spawn"] = &spawn_agent_player;
    level.agent_funcs["player"]["think"] = &namespace_52715711bf01a187::bot_war_think;
    level.agent_funcs["player"]["on_killed"] = &on_agent_player_killed;
    level.agent_funcs["player"]["on_damaged"] = &on_agent_player_damaged;
    level.agent_funcs["player"]["on_damaged_finished"] = &agent_damage_finished;
    registersharedfunc("ai", "displayDamageNumber_SharedFunc", &namespace_329d1a4521cd0e73::function_c54b2cc2e762c201);
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0x19
function wait_till_agent_funcs_defined() {
    while (!isdefined(level.agent_funcs)) {
        wait(0.05);
    }
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59b
// Size: 0x11d
function function_1903f7dc32253cb8() {
    /#
        var_4b6b489dae052a24 = [];
        var_4b6b489dae052a24["script_origin"] = 0;
        var_4b6b489dae052a24["standard"] = 0;
        var_1c9b15e6f9386902 = undefined;
        foreach (player in level.participants) {
            if (!isdefined(var_4b6b489dae052a24[player.team])) {
                var_4b6b489dae052a24[player.team] = 0;
            }
            if (isteamparticipant(player)) {
                var_4b6b489dae052a24[player.team]++;
            }
        }
        foreach (team, count in var_4b6b489dae052a24) {
            if (team != "off" && (!isdefined(var_1c9b15e6f9386902) || var_4b6b489dae052a24[var_1c9b15e6f9386902] > count)) {
                var_1c9b15e6f9386902 = team;
            }
        }
        return var_1c9b15e6f9386902;
    #/
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bf
// Size: 0x197
function function_8a38b0ab8ed5310d() {
    /#
        setdevdvarifuninitialized(@"hash_b725de514a5e641", "<unknown string>");
        setdevdvarifuninitialized(@"hash_35fa3411ab03151f", "<unknown string>");
        while (level.players.size == 0) {
            wait(0.05);
        }
        for (;;) {
            wait(0.1);
            var_61c0d85a0968950b = getdvarint(@"hash_b725de514a5e641");
            var_8c00c85e23270f7b = getdvarint(@"hash_35fa3411ab03151f");
            if (var_61c0d85a0968950b != 0) {
                setdevdvar(@"hash_b725de514a5e641", 0);
            }
            if (var_8c00c85e23270f7b != 0) {
                setdevdvar(@"hash_35fa3411ab03151f", 0);
            }
            for (i = 0; i < var_61c0d85a0968950b; i++) {
                agent = add_humanoid_agent("<unknown string>", function_1903f7dc32253cb8(), undefined, undefined, undefined, undefined, 1, 1);
                if (isdefined(agent)) {
                    agent game_utility::function_1802112b9d0b0ff1();
                }
            }
            foreach (agent in level.agentarray) {
                if (!istrue(agent.isactive)) {
                    continue;
                }
                if (isdefined(agent.isactive) && agent.isactive && agent.agent_type == "<unknown string>") {
                    if (var_8c00c85e23270f7b > 0) {
                        agent namespace_86b52005c685dfb9::deactivateagent();
                        agent suicide();
                        var_8c00c85e23270f7b--;
                    }
                }
            }
        }
    #/
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x85d
// Size: 0xe1
function add_humanoid_agent(agent_type, team, class, var_6be522bc520519bf, var_a980e6be815e19e1, var_123f05cf9530a069, var_9fee3fe2e8ddd1f3, respawn_on_death, difficulty, classcallback, var_3408b3be04ff0639, var_b72e32b38f8041c6, var_db8e73aaa2758d76, disablebattlechatter) {
    agent = namespace_4580e60e1b7b40e2::connectnewagent(agent_type, team, class);
    if (isdefined(classcallback)) {
        /#
            assertex(isdefined(class) && class == "callback", "add_humanoid_agent() passed class callback function when class variable not set to "callback"");
        #/
        agent.classcallback = classcallback;
    }
    if (isdefined(agent)) {
        agent thread [[ agent agentfunc("spawn") ]](var_6be522bc520519bf, var_a980e6be815e19e1, var_123f05cf9530a069, var_9fee3fe2e8ddd1f3, respawn_on_death, difficulty, var_3408b3be04ff0639, var_b72e32b38f8041c6, var_db8e73aaa2758d76, disablebattlechatter);
    }
    return agent;
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x946
// Size: 0x310
function spawn_agent_player(var_6be522bc520519bf, var_a980e6be815e19e1, var_123f05cf9530a069, var_9fee3fe2e8ddd1f3, respawn_on_death, difficulty, var_3408b3be04ff0639, var_b72e32b38f8041c6, var_db8e73aaa2758d76, disablebattlechatter) {
    self endon("disconnect");
    while (!isdefined(level.getspawnpoint)) {
        waitframe();
    }
    if (self.hasdied) {
        wait(randomintrange(6, 10));
    }
    initplayerscriptvariables(1);
    if (isdefined(var_6be522bc520519bf) && isdefined(var_a980e6be815e19e1)) {
        spawnorigin = var_6be522bc520519bf;
        spawnangles = var_a980e6be815e19e1;
        self.lastspawnpoint = spawnstruct();
        self.lastspawnpoint.origin = spawnorigin;
        self.lastspawnpoint.angles = spawnangles;
    } else {
        spawnpoint = self [[ level.getspawnpoint ]]();
        spawnorigin = spawnpoint.origin;
        spawnangles = spawnpoint.angles;
        self.lastspawnpoint = spawnpoint;
    }
    activateagent();
    self.lastspawntime = gettime();
    self.spawntime = gettime();
    var_95e3f96ca970054 = spawnorigin + (0, 0, 25);
    var_ec89da43f5a8e18d = spawnorigin;
    var_6f6d1e15d5bfc8d2 = playerphysicstrace(var_95e3f96ca970054, var_ec89da43f5a8e18d);
    if (distancesquared(var_6f6d1e15d5bfc8d2, var_95e3f96ca970054) > 1) {
        spawnorigin = var_6f6d1e15d5bfc8d2;
    }
    /#
        assertmsg("SpawnAgent function is no longer supported, please update spawn_agent_player to use SpawnBotAgent if this spawn function is still needed");
    #/
    if (isdefined(var_9fee3fe2e8ddd1f3) && var_9fee3fe2e8ddd1f3) {
        /#
            namespace_e4a5fcd525f0b19b::function_70008d3ab47d171d();
        #/
        namespace_a89b0064fb8d2078::bot_assign_personality_functions();
    } else {
        namespace_c52269d70f989750::bot_set_personality("default");
    }
    if (isdefined(difficulty)) {
        namespace_c52269d70f989750::bot_set_difficulty(difficulty);
    }
    initplayerclass();
    namespace_4580e60e1b7b40e2::set_agent_health(100);
    if (isdefined(respawn_on_death) && respawn_on_death) {
        self.respawn_on_death = 1;
    }
    if (isdefined(var_123f05cf9530a069)) {
        set_agent_team(var_123f05cf9530a069.team, var_123f05cf9530a069);
    }
    if (isdefined(self.owner)) {
        thread destroyonownerdisconnect(self.owner);
    }
    self enableanimstate(0);
    self takeallweapons();
    self [[ level.onspawnplayer ]](0);
    if (!istrue(var_3408b3be04ff0639)) {
        namespace_d19129e4fa5d176::giveloadout(self.team, self.class, 1);
    }
    thread namespace_e4a5fcd525f0b19b::bot_think_watch_enemy(1);
    thread namespace_e4a5fcd525f0b19b::bot_think_crate();
    thread namespace_53c9077460dd0cb1::bot_think_tactical_goals();
    self thread [[ agentfunc("think") ]]();
    if (!self.hasdied) {
        namespace_36f464722d326bbe::addtoparticipantsarray();
    }
    self.hasdied = 0;
    if (!istrue(var_b72e32b38f8041c6)) {
        thread namespace_3bbb5a98b932c46f::onplayerspawned();
    }
    if (!istrue(var_db8e73aaa2758d76)) {
        thread namespace_54a2eae43eaa8bf5::manageplayerregen();
    }
    if (!istrue(disablebattlechatter)) {
        thread namespace_25c5a6f43bb97b43::onplayerspawned();
    }
    level notify("spawned_agent_player", self);
    level notify("spawned_agent", self);
    self notify("spawned_player");
    callback::callback("player_spawned");
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5d
// Size: 0x3d
function destroyonownerdisconnect(owner) {
    self endon("death");
    childthread watchownerstatus("disconnect", owner);
    childthread watchownerstatus("joined_team", owner);
    childthread watchownerstatus("joined_spectators", owner);
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca1
// Size: 0x36
function watchownerstatus(var_70687e0cc558a009, owner) {
    owner waittill(var_70687e0cc558a009);
    self notify("owner_disconnect");
    if (namespace_e323c8674b44c8f4::waittillhostmigrationdone()) {
        wait(0.05);
    }
    self suicide();
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcde
// Size: 0x194
function agent_damage_finished(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname) {
    if (isalive(self)) {
        if (isdefined(einflictor) || isdefined(eattacker)) {
            if (!isdefined(einflictor)) {
                einflictor = eattacker;
            }
            if (isdefined(self.allowvehicledamage) && !self.allowvehicledamage) {
                if (isdefined(einflictor.classname) && einflictor.classname == "script_vehicle") {
                    return 0;
                }
            }
            if (isdefined(einflictor.classname) && einflictor.classname == "auto_turret") {
                eattacker = einflictor;
            }
            if (isdefined(eattacker) && smeansofdeath != "MOD_FALLING" && smeansofdeath != "MOD_SUICIDE") {
                if (level.teambased) {
                    if (isdefined(eattacker.team) && eattacker.team != self.team) {
                        self setagentattacker(eattacker);
                    }
                } else {
                    self setagentattacker(eattacker);
                }
            }
        }
        /#
            assert(isdefined(self.isactive) && self.isactive);
        #/
        self finishagentdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname);
        return 1;
    }
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0xe79
// Size: 0x2b4
function on_agent_generic_damaged(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname) {
    var_b404412d0857ae99 = isdefined(eattacker) && isdefined(self.owner) && self.owner == eattacker;
    var_fe3b391623ac9612 = attackerishittingteam(self.owner, eattacker) || var_b404412d0857ae99;
    if (!(var_b404412d0857ae99 && self.agent_type == "playerProxy")) {
        if (level.teambased && var_fe3b391623ac9612 && !level.friendlyfire) {
            return 0;
        }
        if (!level.teambased && var_b404412d0857ae99) {
            return 0;
        }
    }
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && isdefined(einflictor.classname) && einflictor.classname == "script_vehicle") {
        return 0;
    }
    if (!isdefined(self) || !namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (isdefined(eattacker) && eattacker.classname == "script_origin" && isdefined(eattacker.type) && eattacker.type == "soft_landing") {
        return 0;
    }
    if (sweapon == "killstreak_emp_mp") {
        return 0;
    }
    if (issubstr(sweapon, "throwingknife") && smeansofdeath == "MOD_IMPACT") {
        idamage = self.health + 1;
    }
    if (isdefined(einflictor) && isdefined(einflictor.stuckenemyentity) && einflictor.stuckenemyentity == self) {
        idamage = self.health + 1;
    }
    if (idamage <= 0) {
        return 0;
    }
    if (isdefined(eattacker) && eattacker != self && idamage > 0 && (!isdefined(shitloc) || shitloc != "shield")) {
        if (idflags & 16) {
            var_cdcedb142f61b43e = "stun";
        } else {
            var_cdcedb142f61b43e = "standard";
        }
        eattacker updatedamagefeedback(var_cdcedb142f61b43e, idamage >= self.health);
    }
    if (isdefined(level.modifyplayerdamage)) {
        idamage = [[ level.modifyplayerdamage ]](einflictor, self, eattacker, idamage, smeansofdeath, sweapon, vpoint, vdir, shitloc);
    }
    return self [[ agentfunc("on_damaged_finished") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname);
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1135
// Size: 0x10e
function on_agent_player_damaged(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_b404412d0857ae99 = isdefined(eattacker) && isdefined(self.owner) && self.owner == eattacker;
    if (!level.teambased && var_b404412d0857ae99) {
        return 0;
    }
    if (isweapon(sweapon)) {
        weaponname = getcompleteweaponname(sweapon);
    } else {
        weaponname = sweapon;
    }
    objweapon = makeweaponfromstring(weaponname);
    if (isdefined(level.weaponmapfunc)) {
        [[ level.weaponmapfunc ]](objweapon, einflictor);
    }
    callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname);
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124a
// Size: 0x103
function on_agent_player_killed(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, timeoffset, deathanimduration) {
    on_humanoid_agent_killed_common(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, timeoffset, deathanimduration, 1);
    if (isplayer(eattacker) && (!isdefined(self.owner) || eattacker != self.owner)) {
        namespace_3e725f3cc58bddd3::onkillstreakkilled("squad_mate", eattacker, sweapon, smeansofdeath, idamage, "destroyed_squad_mate");
    }
    thread namespace_3bbb5a98b932c46f::dropscavengerfordeath(eattacker);
    if (self.isactive) {
        self.hasdied = 1;
        if (getgametypenumlives() != 1 && isdefined(self.respawn_on_death) && self.respawn_on_death) {
            self thread [[ agentfunc("spawn") ]]();
        } else {
            deactivateagent();
        }
    }
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1354
// Size: 0x178
function on_humanoid_agent_killed_common(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons) {
    if (isdefined(self.hasriotshieldequipped) && self.hasriotshieldequipped) {
        launchshield(idamage, smeansofdeath);
        if (!dropweapons) {
            item = self dropitem(self getcurrentweapon());
            if (isdefined(item)) {
                item thread namespace_3bbb5a98b932c46f::deletepickupafterawhile();
                item.owner = self;
                item.ownersattacker = eattacker;
                item makeunusable();
            }
        }
    }
    if (dropweapons) {
        self [[ level.weapondropfunction ]](eattacker, smeansofdeath, undefined, idamage);
    }
    riotshield_clear();
    if (isdefined(self.nocorpse)) {
        return;
    }
    self.body = self cloneagent(deathanimduration);
    if (namespace_46e942396566f2da::function_bbee2e46ab15a720(eattacker, sweapon, smeansofdeath, shitloc, einflictor)) {
        return;
    }
    if (istrue(self.var_250a0d62e13c6e73)) {
        self.body setscriptablepartstate("helmet", "damaged");
    } else if (istrue(self.var_3fe8ab9198171c21)) {
        self.body setscriptablepartstate("helmet", "off");
    }
    thread namespace_3e725f3cc58bddd3::_startragdoll(self.body, smeansofdeath, einflictor);
}

// Namespace agents/namespace_b97aebbb3666dd87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d3
// Size: 0x4d
function initplayerclass() {
    if (isdefined(self.class_override)) {
        self.class = self.class_override;
    } else if (namespace_8be37ac443f7f654::function_a693c24def6fb1ed()) {
        self.class = "callback";
    } else {
        self.class = "class1";
    }
}

