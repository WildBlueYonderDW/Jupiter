// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_46fdf7b12c5f5620;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_4e1d4dd23699a8a4;
#using scripts\asm\asm.gsc;
#using script_35de402efc5acfb3;
#using script_24fbedba9a7a1ef4;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_5762ac2f22202ba2;
#using script_10b6724c15a95e8;

#namespace namespace_ddb3cfd00698dfab;

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x549
// Size: 0x376
function function_5675a69bbcea259() {
    if (!getdvarint(@"hash_4a544835c8ae64f3", 0)) {
        return;
    }
    if (!istrue(level.usegulag)) {
        return;
    }
    var_622d21932c1bcf3a = spawnstruct();
    var_622d21932c1bcf3a.primaryweapon = getdvar(@"hash_c15ab5c0d62f602c", "ar");
    var_622d21932c1bcf3a.tier = getdvarint(@"hash_d3274d9a629743fe", 1);
    var_622d21932c1bcf3a.totalhealth = getdvarint(@"hash_e5060acbd5afa93e", 300);
    var_622d21932c1bcf3a.var_62a6656a434e2db1 = getdvarint(@"hash_c010d711979f5114", 15);
    var_622d21932c1bcf3a.var_4793c22ad6a20697 = getdvarint(@"hash_373c93b98e7d3c92", 30);
    var_622d21932c1bcf3a.var_36598ee99603eff4 = getdvarint(@"hash_2ca665603bf97065", 1);
    var_622d21932c1bcf3a.var_e325731aea80b77f = getdvarint(@"hash_9cf27803596fff40", 1);
    var_622d21932c1bcf3a.var_12fb21dc8751c2ce = getdvarint(@"hash_dafa44a595367d1d", 2);
    var_622d21932c1bcf3a.var_f4f16b39bfe10c37 = getdvarfloat(@"hash_65e3ecba47524376", 2);
    var_622d21932c1bcf3a.var_f5147939c00772b9 = getdvarfloat(@"hash_6606deba47786c64", 2.5);
    var_622d21932c1bcf3a.var_863eb0082b9dec0 = getdvarint(@"hash_a3586cc38781ff97", 3);
    var_622d21932c1bcf3a.var_84101008293c76a = getdvarint(@"hash_a37b7ac387a86619", 4);
    level.var_622d21932c1bcf3a = var_622d21932c1bcf3a;
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    foreach (arena in level.gulag.arenas) {
        arena.var_e33e5f2072a1db86 = [];
        var_bb81957d1ae1cf3a = getstructarray(arena.target, "targetname");
        foreach (var_bdf25d8a73ff7dad in var_bb81957d1ae1cf3a) {
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_catwalk_ai_spawn") {
                if (isdefined(var_bdf25d8a73ff7dad.target)) {
                    var_bdf25d8a73ff7dad.patrolStart = getstruct(var_bdf25d8a73ff7dad.target, "targetname");
                    if (isdefined(var_bdf25d8a73ff7dad.patrolStart)) {
                        var_bdf25d8a73ff7dad.patrolpath = function_9edcf99159abb0b(var_bdf25d8a73ff7dad.patrolStart);
                    }
                }
                arena.var_e33e5f2072a1db86[arena.var_e33e5f2072a1db86.size] = var_bdf25d8a73ff7dad;
            }
        }
    }
    level waittill("prematch_done");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("loot_key_spectator_gulag", &function_6b2a6e0fc1611a0b);
    function_b896efd72719fc99();
    foreach (arena in level.gulag.arenas) {
        function_71240cfca27fc4dd(arena);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6
// Size: 0x1b
function function_b896efd72719fc99() {
    category = "gulag_catwalk";
    function_ba4022744dce59f6(category);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x12a
function function_71240cfca27fc4dd(arena) {
    if (isdefined(arena.var_f1d536b9f8efc97c)) {
        arena.var_f1d536b9f8efc97c namespace_cb965d2f71fefddc::deletescriptableinstance(1);
    }
    var_a620cb0e6444887f = randomintrange(level.var_622d21932c1bcf3a.var_863eb0082b9dec0, level.var_622d21932c1bcf3a.var_84101008293c76a + 1);
    arena.var_31839e5dd0b28150 = [];
    arena.var_9068c2300fc69810 = [];
    if (!isdefined(arena.var_60af67bcaac1aa55)) {
        arena.var_60af67bcaac1aa55 = 0;
    }
    if (!isdefined(arena.var_2235cd5c616a1881)) {
        arena.var_2235cd5c616a1881 = 0;
    }
    arena.var_e33e5f2072a1db86 = array_randomize(arena.var_e33e5f2072a1db86);
    for (i = 0; i < var_a620cb0e6444887f; i++) {
        function_8a7784fe4a8d91b2(arena, arena.var_e33e5f2072a1db86[i], level.var_622d21932c1bcf3a.primaryweapon, level.var_622d21932c1bcf3a.tier);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa19
// Size: 0x354
function function_8a7784fe4a8d91b2(arena, var_55e69fb0ce97f15e, var_1439f86640d42e34, var_7ca24826046f8ee3, nationality) {
    aitype = "enemy_mp_baton_base";
    if (getdvarint(@"hash_13bdd9641f2e3308", 0)) {
        if (!isdefined(var_1439f86640d42e34)) {
            var_1439f86640d42e34 = "smg";
        }
        aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, var_7ca24826046f8ee3, nationality);
    }
    spawnlocation = var_55e69fb0ce97f15e.origin;
    if (!getdvarint(@"hash_b3d7a9483362813e", 0)) {
        spawnlocation = getclosestpointonnavmesh(var_55e69fb0ce97f15e.origin + (0, 0, 30));
    }
    agent = ai_mp_requestSpawnAgent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag_catwalk", undefined, undefined, undefined, undefined, undefined, 1, undefined, 0);
    if (isagent(agent)) {
        agent function_7c45ebd8f87cbec2(arena);
        agent.arena = arena;
        agent.var_a4738c70736d3a61 = &function_a970772ff3c57929;
        agent.fnshouldplaypainanim = &function_2362b21ebe35f2dd;
        agent.handledamagefeedback = &function_d92fbfd19f555324;
        agent.health = level.var_622d21932c1bcf3a.totalhealth;
        agent.maxhealth = level.var_622d21932c1bcf3a.totalhealth;
        agent.meleechargedistvsplayer = 120;
        agent.pathenemyfightdist = 0;
        agent.var_a6ec133a74de3b = 1;
        agent.var_185f1efd0ec920d3 = 90;
        agent.var_e6b3eb176dda8abc = 70;
        agent.var_f88c7e674f2b356e = 60;
        agent.var_2d2cd9dac58c3455 = 0;
        agent.var_a7704795e7c8e95a = 0;
        agent.var_4e94c508dbe088a2 = 0;
        agent.var_725248d464d15738 = 0;
        agent.ballowexecutions = 0;
        agent.var_214ec6c7283a65c6 = 0;
        agent.var_e585c560d79f00f8 = 1;
        agent function_d493e7fe15e5eaf4("default");
        agent notify("endLootDropThread");
        agent attach("misc_wm_baton", "tag_accessory_right");
        if (getdvarint(@"hash_b3d7a9483362813e", 0)) {
            agent forceteleport(spawnlocation, var_55e69fb0ce97f15e.angles);
            agent setgoalpos(agent.origin, 16);
            agent clearpath();
            agent.fixednode = 1;
            agent thread function_b11c1964f528574b(agent, 1, agent.origin);
        } else if (getdvarint(@"hash_1bed526f1079e5da", 0) && isdefined(var_55e69fb0ce97f15e.patrolpath)) {
            agent.pacifist = 1;
            agent aisetdesiredspeed(80);
            level thread function_d68be668e6e95bb(agent, var_55e69fb0ce97f15e.patrolpath, undefined, 64);
            agent utility::demeanor_override("patrol");
            agent thread function_93b11e4da88bf536();
            agent thread function_f02c2688fad36430();
            agent thread function_f4270b365e95d937();
        } else {
            level thread function_b11c1964f528574b(agent);
        }
        agent setplayerghost(1);
        agent setperk("specialty_gpsjammer", 1);
        agent thread function_7ae9ebb1a232528(arena);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd74
// Size: 0x46
function function_7c45ebd8f87cbec2(arena) {
    if (!isdefined(arena.var_6099a8d8ce7de8de)) {
        arena.var_6099a8d8ce7de8de = [];
    }
    arena.var_6099a8d8ce7de8de = array_add(arena.var_6099a8d8ce7de8de, self);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc1
// Size: 0x1aa
function function_7ae9ebb1a232528(arena) {
    level endon("game_ended");
    killer = self waittill("death");
    if (isdefined(arena.var_6099a8d8ce7de8de)) {
        arena.var_6099a8d8ce7de8de = array_remove(arena.var_6099a8d8ce7de8de, self);
        if (isagent(self)) {
            if (isalive(self)) {
                self.nocorpse = 1;
                self kill();
            }
        }
        if (!isdefined(arena.var_7174e40427faeae2)) {
            arena.var_7174e40427faeae2 = [];
        }
        body = self getcorpseentity();
        if (isdefined(body)) {
            arena.var_7174e40427faeae2 = array_add(arena.var_7174e40427faeae2, body);
        }
        if (isplayer(killer)) {
            arena thread function_28d2431aa45d5df8();
            if (arena.var_6099a8d8ce7de8de.size <= 0) {
                if (!isdefined(arena.var_f1d536b9f8efc97c)) {
                    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                    namespace_cb965d2f71fefddc::function_a10adec57ad9e3a4(dropstruct, arena, killer);
                }
            }
        }
        if (!isdefined(arena.var_cd8f73438ec92b1b)) {
            arena.var_cd8f73438ec92b1b = 1;
            arena.var_60af67bcaac1aa55 = arena.var_60af67bcaac1aa55 + 1;
            foreach (var_7f57b800332723a1 in arena.jailedplayers) {
                var_7f57b800332723a1 thread namespace_44abc05161e2e2cb::showsplash("br_gulag_prison_riot_in_progress");
            }
        }
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf72
// Size: 0x1b4
function function_6b2a6e0fc1611a0b(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level endon("game_ended");
    arena = player.arena;
    if (isdefined(arena.var_f1d536b9f8efc97c)) {
        arena.var_f1d536b9f8efc97c namespace_cb965d2f71fefddc::deletescriptableinstance(1);
        player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    }
    if (isdefined(player)) {
        player namespace_48a08c5037514e04::doScoreEvent(#"hash_7f475510f9f5698d");
    }
    wait(1.17);
    foreach (var_d7836ab41dca3e4a in arena.var_31839e5dd0b28150) {
        if (isdefined(var_d7836ab41dca3e4a)) {
            var_d7836ab41dca3e4a namespace_48a08c5037514e04::doScoreEvent(#"hash_dd106359bca2b84");
        }
    }
    var_b215274f1a3eb134 = array_combine(arena.jailedplayers, arena.arenaplayers);
    arena thread function_4a9dbce4369f1bba();
    arena thread function_3391003fe051704();
    level notify("gulag_break");
    if (isdefined(arena)) {
        if (isdefined(arena.var_2235cd5c616a1881)) {
            arena.var_2235cd5c616a1881 = arena.var_2235cd5c616a1881 + 1;
        }
    }
    namespace_a011fbf6d93f25e5::function_5098ee655afed5d(arena.id, level.br_circle.circleindex, 1, arena.var_31839e5dd0b28150.size, 0, var_b215274f1a3eb134.size);
    arena thread function_ec93ae254484ba9d(5);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112d
// Size: 0xce
function function_3391003fe051704() {
    level endon("game_ended");
    self endon("fight_over");
    self endon("matchEnded");
    if (istrue(self.fightover)) {
        return;
    }
    foreach (player in self.arenaplayers) {
        player setclientomnvar("ui_br_gulag_lethal_delay", 0);
        player val::function_c9d0b43701bdba00("watchLethalDelayPlayer");
        if (!isbot(player) && isplayer(player)) {
            player notifyonplayercommandremove("lethal_attempt_gulag", "+frag");
            player notifyonplayercommandremove("lethal_attempt_gulag", "+smoke");
        }
        player thread gulagbreak_playerRespawn(1);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1202
// Size: 0x78
function function_4a9dbce4369f1bba() {
    foreach (player in self.jailedplayers) {
        if (!player isinexecutionvictim()) {
            if (player namespace_8bfdb6eb5a3df67a::playeriscinematiclayeron()) {
                player stopcinematicforplayer(1, 1);
            }
            player thread gulagbreak_playerRespawn(0);
        }
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1281
// Size: 0xba
function gulagbreak_playerRespawn(var_15a419e19e435f2b) {
    if (!isdefined(self)) {
        return;
    }
    var_1b7f5108008d55b6 = isalive(self) && isdefined(level.gulag) && !istrue(level.gulag.shutdown) && namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
    if (var_15a419e19e435f2b) {
        if (namespace_8bfdb6eb5a3df67a::playeriscinematiclayeron()) {
            namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
        }
    }
    _freezecontrols(1, 0, "gulagBreak");
    thread namespace_44abc05161e2e2cb::showsplash("br_gulagbreak_active");
    if (var_1b7f5108008d55b6) {
        gulagvictory(self.arena, self, 1, 0, undefined, undefined, undefined, undefined, undefined, 1);
    } else {
        thread namespace_47fd1e79a44628cd::playergulagautowin("gulagbreak_playerRespawn", undefined, undefined, 1, 0, undefined, 1);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1342
// Size: 0x574
function function_a970772ff3c57929(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (isdefined(eattacker) && array_contains(self.arena.arenaplayers, eattacker)) {
        return;
    }
    if (isdefined(self.arena) && !array_contains(self.arena.var_31839e5dd0b28150, eattacker)) {
        self.arena.var_31839e5dd0b28150 = array_add(self.arena.var_31839e5dd0b28150, eattacker);
    }
    if (isplayer(eattacker)) {
        if (isdefined(self.arena)) {
            if (isdefined(self.arena.var_9068c2300fc69810) && !array_contains(self.arena.var_9068c2300fc69810, self)) {
                self.arena.var_9068c2300fc69810 = array_add(self.arena.var_9068c2300fc69810, self);
                if (isdefined(self.arena.var_19fe32f41a41c7ff)) {
                    self.arena.var_19fe32f41a41c7ff = self.arena.var_19fe32f41a41c7ff + 1;
                } else {
                    self.arena.var_19fe32f41a41c7ff = 1;
                }
            }
        }
    }
    var_b5b49ec3d37d653a = isdefined(self.flashendtime);
    if (smeansofdeath == "MOD_IMPACT") {
        if (distance2dsquared(einflictor.origin, eattacker.origin) < 640000) {
            if (partname == t"hash_51bd95aa" || partname == t"hash_119cd9b0") {
                /#
                    thread namespace_f2ffc0540883e1ad::drawsphere(vpoint, 2, 1, (0, 1, 0));
                #/
                idamage = level.var_622d21932c1bcf3a.var_4793c22ad6a20697;
                self.var_2d2cd9dac58c3455++;
                if (!var_b5b49ec3d37d653a && isdefined(self.var_2d2cd9dac58c3455) && self.var_2d2cd9dac58c3455 >= level.var_622d21932c1bcf3a.var_36598ee99603eff4) {
                    self.var_cf96019be76d9636 = eattacker;
                    function_bb4122a38672185(1);
                    stunduration = randomfloatrange(level.var_622d21932c1bcf3a.var_f4f16b39bfe10c37, level.var_622d21932c1bcf3a.var_f5147939c00772b9);
                    if (self.asmname != self.var_a942dd31d55102c9) {
                        namespace_dd3a5c61bf082e18::function_db8201ba3a4a894d();
                    }
                    self shellshock("flashbang_mp", stunduration);
                    if (!isdefined(self.flashendtime)) {
                        self.flashendtime = int(stunduration * 1000);
                        namespace_bf5a1761a8d1bb07::asm_setstate("pain_flashed_transition");
                    }
                    self.var_2d2cd9dac58c3455 = 0;
                    self.var_77f17252937f40cd = 1;
                    thread function_d663d609f9113305();
                    namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_damage_reaction_head", "react_multi", 0, 0, 3);
                }
            } else {
                /#
                    thread namespace_f2ffc0540883e1ad::drawsphere(vpoint, 2, 1, (1, 0, 0));
                #/
                self.var_a7704795e7c8e95a++;
                if (self.var_a7704795e7c8e95a >= level.var_622d21932c1bcf3a.var_e325731aea80b77f) {
                    self.var_a7704795e7c8e95a = 0;
                    if (!self.var_725248d464d15738) {
                        self.var_d05847451d7568a = 1;
                        var_823867e4d6972ea8 = vectornormalize(anglestoforward(self.angles));
                        var_c43fa317dc81b416 = vectornormalize(vdir);
                        dotproduct = vectordot(var_c43fa317dc81b416, var_823867e4d6972ea8);
                        if (dotproduct > 0.35) {
                            /#
                                thread namespace_f2ffc0540883e1ad::drawsphere(vpoint, 4, 1, (1, 0, 0));
                            #/
                            namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_damage_reaction_body", "react_unaware", 0, 0, 4);
                        } else {
                            /#
                                thread namespace_f2ffc0540883e1ad::drawsphere(vpoint, 4, 1, (0, 1, 0));
                            #/
                            namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_damage_reaction_body", "react_aware", 0, 0, 4);
                        }
                    }
                }
            }
            self.var_cf96019be76d9636 = eattacker;
            function_bb4122a38672185(1);
        }
    } else if (smeansofdeath == "MOD_MELEE") {
        if (!self.var_725248d464d15738) {
            if (!var_b5b49ec3d37d653a) {
                self.var_d05847451d7568a = 1;
                namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_melee_reaction", "react_aware", 0, 0, 3);
            }
            self.var_cf96019be76d9636 = eattacker;
            function_bb4122a38672185(1);
        }
        if (isdefined(self.flashendtime) && self.flashendtime > 0) {
            idamage = level.var_622d21932c1bcf3a.var_4793c22ad6a20697;
        } else {
            idamage = level.var_622d21932c1bcf3a.var_62a6656a434e2db1;
        }
    }
    if (idamage > self.health) {
        self detach("misc_wm_baton", "tag_accessory_right");
    }
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, int(idamage), idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bd
// Size: 0x25
function function_d663d609f9113305() {
    self endon("death");
    while (isdefined(self.flashendtime)) {
        waitframe();
    }
    self.var_77f17252937f40cd = 0;
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e9
// Size: 0xd0
function function_2362b21ebe35f2dd() {
    var_392782e59863c89f = 64;
    if (istrue(self.var_d05847451d7568a)) {
        self.var_d05847451d7568a = 0;
        return 1;
    }
    if (self.a.disablepain) {
        return 0;
    }
    if (isdefined(self.allowpain) && self.allowpain == 0) {
        return 0;
    }
    if (istrue(self.var_a1db58c75f381a55)) {
        return 0;
    }
    if (isdefined(self.pathgoalpos) && self pathdisttogoal(1) < var_392782e59863c89f) {
        return 0;
    }
    if (isdefined(self.damageweapon)) {
        basename = getweaponbasename(self.damageweapon);
        var_f700b7a9c3b98b13 = issubstr(basename, "fists");
        if (var_f700b7a9c3b98b13) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c1
// Size: 0x97
function function_28d2431aa45d5df8() {
    level notify("spectator_ai_death");
    level endon("spectator_ai_death");
    level endon("gulag_break");
    while (1) {
        players = array_remove_array(self.jailedplayers, self.arenaplayers);
        if (players.size <= 0) {
            thread function_ec93ae254484ba9d(5);
            namespace_a011fbf6d93f25e5::function_5098ee655afed5d(self.id, level.br_circle.circleindex, 0, self.var_31839e5dd0b28150.size, self.var_6099a8d8ce7de8de.size, 0);
            break;
        }
        wait(1);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5f
// Size: 0x125
function function_ec93ae254484ba9d(delay) {
    level endon("game_ended");
    if (isdefined(delay)) {
        wait(delay);
    }
    if (isdefined(self.var_6099a8d8ce7de8de)) {
        foreach (agent in self.var_6099a8d8ce7de8de) {
            if (isdefined(agent) && isagent(agent)) {
                if (isalive(agent)) {
                    agent.nocorpse = 1;
                    agent kill();
                }
                body = agent getcorpseentity();
                if (isdefined(body)) {
                    body delete();
                }
            }
        }
    }
    if (isdefined(self.var_7174e40427faeae2)) {
        foreach (body in self.var_7174e40427faeae2) {
            if (isdefined(body)) {
                body delete();
            }
        }
    }
    function_71240cfca27fc4dd(self);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8b
// Size: 0x1fc
function function_d92fbfd19f555324(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, var_1da1a66b5c6a06a7, var_986b2e0350629522, iskillstreakweapon) {
    if (isdefined(eattacker) && isdefined(eattacker.owner)) {
        var_91ebb035a259e76a = eattacker.owner;
    } else {
        var_91ebb035a259e76a = eattacker;
    }
    if (isdefined(var_91ebb035a259e76a) && var_91ebb035a259e76a != victim && idamage + var_1da1a66b5c6a06a7 + var_986b2e0350629522 > 0 && (!isdefined(shitloc) || shitloc != "shield")) {
        var_4ffe32f42d51a763 = !victim namespace_f8065cafc523dba5::_isalive() || isagent(victim) && idamage >= victim.health;
        headshot = namespace_169cd7a8fbc76ee5::isheadshot(shitloc, smeansofdeath, eattacker);
        var_62cf84636d4cef2c = smeansofdeath == "MOD_MELEE";
        victimentnum = "" + victim getentitynumber();
        if (var_4ffe32f42d51a763 && isdefined(victim.body)) {
            var_249fca7089cd498f = victim.body getentitynumber();
        } else {
            var_249fca7089cd498f = victim getentitynumber();
        }
        if (isdefined(self.var_36de30612482e8cf) && [[ self.var_36de30612482e8cf ]]()) {
            var_91ebb035a259e76a namespace_e072c8407b2a861c::updatedamagefeedback("hitarmorheavybreak", var_4ffe32f42d51a763, headshot, undefined, var_62cf84636d4cef2c, undefined, var_249fca7089cd498f, undefined);
        } else if (idamage >= level.var_622d21932c1bcf3a.var_4793c22ad6a20697) {
            var_91ebb035a259e76a namespace_e072c8407b2a861c::updatedamagefeedback("standard", var_4ffe32f42d51a763, headshot, undefined, var_62cf84636d4cef2c, undefined, var_249fca7089cd498f, undefined);
        } else if (idamage >= level.var_622d21932c1bcf3a.var_62a6656a434e2db1) {
            var_91ebb035a259e76a namespace_e072c8407b2a861c::updatedamagefeedback("hitarmorheavy", var_4ffe32f42d51a763, headshot, undefined, var_62cf84636d4cef2c, undefined, var_249fca7089cd498f, undefined);
        }
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8e
// Size: 0x1ae
function function_bb4122a38672185(aggressive) {
    self.pacifist = !aggressive;
    self.var_c833409fb72d15fb = !aggressive;
    if (aggressive) {
        /#
            var_4e599476dcf4d61e = getdvarint(@"hash_b511af5ef96f1167", 0);
            if (var_4e599476dcf4d61e > 0) {
                return;
            }
        #/
        self function_1c339daaba3f71db(1);
        self.var_725248d464d15738 = 1;
        self.var_214ec6c7283a65c6 = 1;
        self.goalradius = 8000;
        utility::demeanor_override("cqb");
        self.allowstrafe = 0;
        if (isdefined(self.var_cf96019be76d9636)) {
            player = self.var_cf96019be76d9636;
            self agentsetfavoriteenemy(player);
            self setlookatentity(player);
            if (!isdefined(player.var_e1590a93eca5e264)) {
                player.var_e1590a93eca5e264 = [];
            }
            player.var_e1590a93eca5e264 = array_add(player.var_e1590a93eca5e264, self);
        }
    } else {
        self.var_725248d464d15738 = 0;
        self.var_214ec6c7283a65c6 = 0;
        self agentsetfavoriteenemy(undefined);
        self setlookatentity();
        self aisetdesiredspeed(80);
        self.goalradius = 64;
        demeanor_override("patrol");
        player = self.var_cf96019be76d9636;
        if (isdefined(player) && isdefined(player.var_e1590a93eca5e264)) {
            player.var_e1590a93eca5e264 = array_remove(player.var_e1590a93eca5e264, self);
            self.var_cf96019be76d9636 = undefined;
        }
        if (self.var_4e94c508dbe088a2 >= level.var_622d21932c1bcf3a.var_12fb21dc8751c2ce) {
            self.var_4e94c508dbe088a2 = 0;
        }
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f43
// Size: 0x107
function function_f02c2688fad36430() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        if (istrue(self.var_725248d464d15738)) {
            /#
                var_4e599476dcf4d61e = getdvarint(@"hash_b511af5ef96f1167", 0);
                if (var_4e599476dcf4d61e > 0) {
                    function_bb4122a38672185(0);
                }
            #/
            var_35b984525605169b = self.var_cf96019be76d9636;
            var_1b48581db97b1495 = namespace_7e17181d03156026::isinlaststand(var_35b984525605169b);
            var_f134ad0a55f3963 = var_35b984525605169b isinexecutionvictim() && !self isinexecutionattack();
            var_ea03686b0edf04e2 = array_contains(self.arena.arenaplayers, var_35b984525605169b);
            if (!isdefined(var_35b984525605169b) || !isalive(var_35b984525605169b) || var_1b48581db97b1495 || var_f134ad0a55f3963 || var_ea03686b0edf04e2 || distance2dsquared(self.origin, var_35b984525605169b.origin) > 640000) {
                function_bb4122a38672185(0);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2051
// Size: 0xe6
function function_f4270b365e95d937() {
    level endon("game_ended");
    self endon("death");
    self.var_16304b6ccaa4b8bd = 0;
    while (1) {
        player = org = self waittill("object_whizby");
        if (!istrue(self.var_725248d464d15738) && isdefined(player)) {
            self.var_4e94c508dbe088a2++;
            if (!self.var_16304b6ccaa4b8bd) {
                if (self.var_4e94c508dbe088a2 >= level.var_622d21932c1bcf3a.var_12fb21dc8751c2ce && distance2dsquared(self.origin, player.origin) < 640000) {
                    self.var_cf96019be76d9636 = player;
                    function_bb4122a38672185(1);
                    function_1a7204646a84bc7a(player);
                } else {
                    self.var_16304b6ccaa4b8bd = 1;
                    thread function_f107289c7060de31(player);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213e
// Size: 0xfb
function function_f107289c7060de31(player) {
    level endon("game_ended");
    self endon("death");
    var_3e38ee41dc326fdc = "cap_jailer_warnoff";
    var_7a140ee03cfc699e = "caps/common/cap_jailer_warnoff";
    self function_1c339daaba3f71db(1);
    self setlookatentity(player);
    self.var_6ea17fd821a76b9f = player;
    self function_105c123cd778717a(player);
    namespace_aebb27832287cd3a::cap_start(var_3e38ee41dc326fdc, var_7a140ee03cfc699e);
    self waittill("cap_exit_completed");
    self function_105c123cd778717a();
    self setlookatentity();
    self.var_6ea17fd821a76b9f = undefined;
    if (self.var_4e94c508dbe088a2 >= level.var_622d21932c1bcf3a.var_12fb21dc8751c2ce && distance2dsquared(self.origin, player.origin) < 640000) {
        self.var_cf96019be76d9636 = player;
        self asmsetstate(self.asmname, "patrol_idle");
        function_bb4122a38672185(1);
    }
    self.var_16304b6ccaa4b8bd = 0;
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2240
// Size: 0x10d
function function_1a7204646a84bc7a(player) {
    if (self.asmname == self.var_a942dd31d55102c9) {
        self.var_1c9ed4a46d13edc9 = player.origin;
        self.var_fd01ad49b4e38ae8 = "med";
        namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_player_spotted", "warn_spotted", 0, 0, 3);
        animindex = self asmgetanim(self.asmname, "patrol_move_react_aim");
        var_93a2c35bc9547955 = namespace_bf5a1761a8d1bb07::asm_getxanim("patrol_move_react_aim", animindex);
        animtime = getanimlength(var_93a2c35bc9547955);
        self motionwarpcancel();
        self animmode("zonly_physics");
        self orientmode("face enemy");
        self function_105c123cd778717a(player);
        self aisetanim("patrol_move_react_aim", animindex, 1);
        wait(animtime);
        if (self.asmname == self.var_a942dd31d55102c9) {
            self function_105c123cd778717a();
            self asmsetstate(self.asmname, "patrol_move");
        }
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2354
// Size: 0xc7
function function_3231b59578bffe2f(alias) {
    level endon("game_ended");
    self endon("death");
    sequence = [];
    switch (alias) {
    case #"hash_9afce1b0ecac4374":
        sequence = [0:"warn_getBack"];
        break;
    case #"hash_5812880e67a2c623":
        sequence = [0:"warn_getBackNow"];
        break;
    case #"hash_3ea1f1426c9b770d":
        sequence = [0:"warn_getOut"];
        break;
    case #"hash_f67d317d2f97f09c":
        sequence = [0:"warn_curse"];
        break;
    case #"hash_6f85aaf2e7841904":
        sequence = [0:"warn_curse"];
        break;
    }
    namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_player_warning", sequence, 0, 0, 1);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2422
// Size: 0x1ce
function function_3032d7f191ce6b69() {
    level endon("game_ended");
    self endon("death");
    wait(2.7);
    sequence = [];
    if (function_51d76700600cebe3(25)) {
        if (function_51d76700600cebe3(25)) {
            sequence = [0:"warn_getBack", 1:1, 2:"warn_getOut", 3:0.4, 4:"warn_curse"];
        } else {
            sequence = [0:"warn_getBack", 1:1, 2:"warn_getOut"];
        }
    } else if (function_51d76700600cebe3(25)) {
        if (function_51d76700600cebe3(25)) {
            sequence = [0:"warn_getBackNow", 1:1, 2:"warn_getOut", 3:0.4, 4:"warn_curse"];
        } else {
            sequence = [0:"warn_getBackNow", 1:1, 2:"warn_getOut"];
        }
    } else if (function_51d76700600cebe3(25)) {
        if (function_51d76700600cebe3(25)) {
            sequence = [0:"warn_getOut", 1:1, 2:"warn_getBack", 3:0.4, 4:"warn_curse"];
        } else {
            sequence = [0:"warn_getOut", 1:1, 2:"warn_getBack"];
        }
    } else if (function_51d76700600cebe3(25)) {
        sequence = [0:"warn_getOut", 1:1, 2:"warn_getBackNow", 3:0.4, 4:"warn_curse"];
    } else {
        sequence = [0:"warn_getOut", 1:1, 2:"warn_getBackNow"];
    }
    namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_player_warning", sequence, 0, 0, 1);
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f7
// Size: 0x309
function function_93b11e4da88bf536() {
    level endon("game_ended");
    self endon("death");
    var_b5b3f47d2c2eca22 = 0;
    while (1) {
        if (self.var_725248d464d15738) {
            self.var_214ec6c7283a65c6 = 1;
            wait(0.1);
            continue;
        }
        /#
            assert(isdefined(self.arena));
        #/
        var_f47dd9d668cc52e2 = function_dff80119c7ccac6a(self.arena, self.origin, 180);
        if (var_f47dd9d668cc52e2.size > 0) {
            var_f47dd9d668cc52e2 = sortbydistance(var_f47dd9d668cc52e2, self.origin);
            foreach (player in var_f47dd9d668cc52e2) {
                if (player.ignoreme || namespace_7e17181d03156026::isinlaststand(player) || player isinexecutionvictim()) {
                    continue;
                }
                var_a75a06ee98df814 = distance2d(self.origin, player.origin) <= 80;
                if ((self cansee(player) || var_a75a06ee98df814) && !var_b5b3f47d2c2eca22) {
                    if (isdefined(player.var_e1590a93eca5e264) && player.var_e1590a93eca5e264.size > 0) {
                        var_b5b3f47d2c2eca22 = 1;
                        self.var_214ec6c7283a65c6 = var_b5b3f47d2c2eca22;
                        self.var_cf96019be76d9636 = player;
                        function_1a7204646a84bc7a(player);
                        namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_warn_attack", "warn_attack", 0, 0, 3);
                        function_bb4122a38672185(1);
                        break;
                    }
                    if (self.var_1420c6f292149589) {
                        var_b5b3f47d2c2eca22 = 1;
                        self.var_214ec6c7283a65c6 = var_b5b3f47d2c2eca22;
                        self.var_cf96019be76d9636 = player;
                        namespace_378f8281e2d12ced::function_d54e84a9513b0e45("guard_warn_attack", "warn_attack", 0, 0, 3);
                        function_bb4122a38672185(1);
                        break;
                    } else if (var_a75a06ee98df814) {
                        self.var_1420c6f292149589 = 1;
                        self.var_6292ba769942beaf = 1;
                        self setgoalpos(self.origin);
                        if (!self.var_725248d464d15738) {
                            var_3e38ee41dc326fdc = "cap_jailer_warnoff";
                            var_7a140ee03cfc699e = "caps/common/cap_jailer_warnoff";
                            self function_1c339daaba3f71db(1);
                            self setlookatentity(player);
                            self.var_6ea17fd821a76b9f = player;
                            self function_105c123cd778717a(player);
                            thread function_3032d7f191ce6b69();
                            namespace_aebb27832287cd3a::cap_start(var_3e38ee41dc326fdc, var_7a140ee03cfc699e);
                            self waittill("cap_exit_completed");
                            self function_105c123cd778717a();
                            self setlookatentity();
                            self.var_6ea17fd821a76b9f = undefined;
                        }
                        break;
                    }
                }
            }
        } else {
            self.var_6292ba769942beaf = 0;
            self.var_1420c6f292149589 = 0;
            var_b5b3f47d2c2eca22 = 0;
            self.var_214ec6c7283a65c6 = var_b5b3f47d2c2eca22;
        }
        if (!var_b5b3f47d2c2eca22 && !self.var_214ec6c7283a65c6 && self.var_4e94c508dbe088a2 < level.var_622d21932c1bcf3a.var_12fb21dc8751c2ce) {
            function_bb4122a38672185(0);
            self.var_a02447b50de44bcc = undefined;
        }
        wait(0.1);
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2907
// Size: 0x27d
function function_d68be668e6e95bb(agent, pathstruct, startindex, var_87d4c4075f48ec58, var_c75025a5b8eb8d36) {
    if (!isdefined(agent)) {
        return;
    }
    level endon("game_ended");
    var_a1d5907e01730345 = 0;
    var_f8bc7ecdd324dd79 = function_f0c78111ce0cdc0a(agent);
    if (!isdefined(var_f8bc7ecdd324dd79) || var_f8bc7ecdd324dd79.behavior != "patrol") {
        function_4561fe6bfc76f8ec(agent, [0:agent], pathstruct);
    }
    if (isagent(agent)) {
        agent endon("death");
        var_a1d5907e01730345 = 1;
    }
    if (!var_a1d5907e01730345) {
        return;
    }
    path = pathstruct.path;
    pathstruct.claimed = 1;
    index = 1;
    var_47ea45f5bcf10fc3 = 1;
    if (isdefined(startindex)) {
        index = startindex;
        index = int(min(index, path.size - 1));
        index = int(max(index, 0));
    }
    function_1670c315976c767b();
    wait(1);
    while (1) {
        var_846067098790c9c4 = !agent.var_214ec6c7283a65c6 && !istrue(agent.var_6292ba769942beaf);
        if (var_846067098790c9c4) {
            if (isvector(path[index])) {
                point = path[index];
            } else {
                point = path[index].origin;
            }
            var_bcfec646853a95c1 = randomfloatrange(10, 11) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
            var_bcfec546853a938e = randomfloatrange(10, 11) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
            point = (point[0] + var_bcfec646853a95c1, point[1] + var_bcfec546853a938e, point[2]);
            agent _setgoalpos(point, 32);
            wait(randomfloatrange(1.5, 2.5));
            waitframe();
            agent waittill("goal");
        }
        if (istrue(agent.var_cf430336d17e3afe)) {
            wait(0.5);
        } else {
            wait(function_53c4c53197386572(var_c75025a5b8eb8d36, 5));
        }
        var_846067098790c9c4 = !agent.var_214ec6c7283a65c6 && !istrue(agent.var_6292ba769942beaf);
        if (var_846067098790c9c4) {
            if (var_47ea45f5bcf10fc3) {
                index++;
            } else {
                index--;
            }
            if (!isdefined(path[index])) {
                if (!pathstruct.var_4437e81f60b6b5a0) {
                    index = 0;
                } else if (var_47ea45f5bcf10fc3) {
                    index = path.size - 2;
                    var_47ea45f5bcf10fc3 = 0;
                } else {
                    index = 1;
                    var_47ea45f5bcf10fc3 = 1;
                }
            }
        }
    }
}

// Namespace namespace_ddb3cfd00698dfab/namespace_e70667b4168cd6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b8b
// Size: 0x9d
function function_dff80119c7ccac6a(arena, pos, radius) {
    players = [];
    foreach (player in arena.jailedplayers) {
        if (isdefined(player)) {
            if (distance2d(pos, player.origin) <= radius) {
                players = array_add(players, player);
            }
        }
    }
    return players;
}

