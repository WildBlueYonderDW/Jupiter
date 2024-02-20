// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\soldier\throwgrenade.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using script_4b6cdcd3c396abab;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\shellshock.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\asm\soldier\melee.gsc;

#namespace namespace_1bc84ea2517faee6;

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0x53
function function_7e28b2b514a15cd3(statename, var_5edf43a8a1497a41, var_a4b7ac07eebb559f) {
    function_1daaaf7667f1282e();
    self attach(getweaponmodel(self.grenadeweapon), "TAG_ACCESSORY_LEFT");
    self.var_80ef2f6717602cbf = 1;
    thread grenadethrow(statename, var_5edf43a8a1497a41, var_a4b7ac07eebb559f);
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28e
// Size: 0x45
function function_48c8acf993dae2cc(asmname, statename, params) {
    self endon(statename + "_finished");
    self function_36c9cc1aacacc4a8();
    function_7e28b2b514a15cd3(statename, params[0], params[1]);
    asm_playanimstate(asmname, statename, params);
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x34
function function_1daaaf7667f1282e() {
    if (istrue(self.var_80ef2f6717602cbf)) {
        self detach(getweaponmodel(self.grenadeweapon), "TAG_ACCESSORY_LEFT");
        self.var_80ef2f6717602cbf = 0;
    }
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315
// Size: 0x46b
function grenadethrow(statename, var_5edf43a8a1497a41, var_a4b7ac07eebb559f) {
    self endon("death");
    self endon(statename + "_finished");
    var_9930afea4de87021 = 0;
    while (!var_9930afea4de87021) {
        notes = self waittill(statename);
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        foreach (notetrack in notes) {
            if (notetrack == "grenade_throw" || notetrack == "grenade throw") {
                var_9930afea4de87021 = 1;
            } else {
                /#
                    assert(notetrack != "end");
                #/
                if (notetrack == "end") {
                    if (isdefined(self.var_a3441d87a95e9040) && isplayer(self.var_a3441d87a95e9040)) {
                        self.var_a3441d87a95e9040 function_a33073d6fd58e58e();
                    }
                    self notify("dont_reduce_giptp_on_killanimscript");
                    var_9930afea4de87021 = 1;
                }
            }
        }
    }
    function_1daaaf7667f1282e();
    self notify("rusher_smokebomb_cleanup");
    self notify("rusher_smoke_bomb_thrown");
    if (issubstr(self.grenadeweapon.basename, "smoke")) {
        vectotarget = anglestoforward(self.origin);
        if (isdefined(self.enemy)) {
            vectotarget = self.enemy.origin - self.origin;
        }
        var_e4dfb6bb8c9c6c44 = randomfloatrange(var_5edf43a8a1497a41, var_a4b7ac07eebb559f);
        var_49d42c23e5279e18 = rotatevector(vectotarget, (0, randomfloatrange(-5, 5), 0));
        var_49d42c23e5279e18 = var_e4dfb6bb8c9c6c44 * vectornormalize(var_49d42c23e5279e18);
        var_87c2825d26c0f315 = self magicgrenademanual(self.origin + var_49d42c23e5279e18 + (0, 0, 10), (0, 0, 15), 0.5);
    } else {
        var_b1c462b90341e70e = (12.9077, 17.6221, 28.1187);
        throwtime = randomfloatrange(1, 1.5);
        var_edcb23eb9e6141be = self checkgrenadethrowpos(var_b1c462b90341e70e, self.enemy.origin, 0, "min time", "min energy");
        if (!isdefined(var_edcb23eb9e6141be)) {
            vectotarget = anglestoforward(self.origin);
            if (isdefined(self.enemy)) {
                vectotarget = self.enemy.origin - self.origin;
            }
            var_e4dfb6bb8c9c6c44 = length(vectotarget) * randomfloatrange(0.95, 1.05);
            var_49d42c23e5279e18 = rotatevector(vectotarget, (0, randomfloatrange(-5, 5), 0));
            var_edcb23eb9e6141be = var_e4dfb6bb8c9c6c44 / throwtime * vectornormalize(var_49d42c23e5279e18) + (0, 0, 200);
        }
        var_87c2825d26c0f315 = self magicgrenademanual(self.origin + var_b1c462b90341e70e, var_edcb23eb9e6141be, throwtime);
    }
    var_87c2825d26c0f315.owner = self;
    var_87c2825d26c0f315.weapon_name = self.grenadeweapon.basename;
    var_3251b898a0907271 = getdesiredgrenadetimervalue();
    setgrenadetimer(min(gettime() + 3000, var_3251b898a0907271));
    var_a15426692301f3f0 = self.enemy;
    if (isdefined(var_a15426692301f3f0) && isplayer(var_a15426692301f3f0) && usingplayergrenadetimer()) {
        /#
            assert(var_a15426692301f3f0 == self.var_a3441d87a95e9040);
        #/
        var_a15426692301f3f0 function_e89f2bdb307f137e();
        thread reducegiptponkillanimscript(statename, var_a15426692301f3f0);
        if (self.var_cc183df556f63da0 == "lethal") {
            if (var_a15426692301f3f0 function_4c108309dc0d7fd2() <= 1) {
                var_a15426692301f3f0 function_ff4aa047884e7a14(gettime());
            }
        }
    }
    if (self.grenadeweapon.basename == "smoke_bomb_rusher_mp") {
        function_d93415244e99e763(var_87c2825d26c0f315.origin, var_87c2825d26c0f315.angles, getdvarint(@"hash_5d839447a2947c11", 1) == 1);
    } else if (issubstr(self.grenadeweapon.basename, "molotov")) {
        var_87c2825d26c0f315 thread namespace_6de0840c25c8dc22::grenade_earthquake();
        thread namespace_df478cc572a311d3::molotov_used(var_87c2825d26c0f315);
    }
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787
// Size: 0xb7
function function_d93415244e99e763(position, angles, var_ba447df20dbbbf8a, var_98a85cefa4f1a7af) {
    if (!istrue(var_98a85cefa4f1a7af)) {
        wait(0.5);
    }
    if (getdvarint(@"hash_f784bdc2ab0eedde", 0) == 1) {
        if (getdvarint(@"hash_abe45e35ef030a56") == 1) {
            function_8a09c0e5fa78a48c(position);
        } else {
            thread namespace_e4a5fcd525f0b19b::create_smoke_occluder(position);
        }
    }
    thread function_160d327d81ff0cce(position);
    var_f1e6c3ce07c301f7 = spawnscriptable("grenade_smoke_v0_rusher_mp_fx", position, angles);
    var_f1e6c3ce07c301f7 thread function_9eaeff99bbe830e7(self);
    if (var_ba447df20dbbbf8a) {
        thread function_fa704b58059a64b6(position, self, self.team, 4.5, 0.25);
    }
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x845
// Size: 0x2e
function function_ca247899dbbcf9a4(position) {
    playfx(self.var_705e2628d263ee2c, position, anglestoup((0, 90, 0)));
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a
// Size: 0x3e
function function_9eaeff99bbe830e7(owner) {
    self setscriptablepartstate("sfx_smoke_bomb", "sfx_expl");
    wait(0.25);
    self setscriptablepartstate("sfx_smoke_bomb", "sfx_smoke_fade_out");
    wait(4);
    self freescriptable();
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bf
// Size: 0x38
function function_160d327d81ff0cce(position) {
    level endon("game_ended");
    wait(1);
    id = addoutlineoccluder(position, 64);
    wait(5.1);
    removeoutlineoccluder(id);
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fe
// Size: 0xe2
function function_fa704b58059a64b6(position, owner, team, duration, scale) {
    if (!isdefined(duration)) {
        duration = 4.5;
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    trigger = spawn("trigger_radius", position + (0, 0, int(-57.75 * scale)), 0, int(256 * scale), int(175 * scale));
    trigger namespace_2a9588dfac284b77::registerspawn(1, &namespace_d39a86483d995ed1::sweepgas);
    trigger endon("death");
    trigger.owner = owner;
    trigger.team = team;
    trigger.playersintrigger = [];
    trigger.var_aeeca2bc23f59ea4 = [];
    trigger thread gas_watchtriggerenter();
    trigger thread namespace_d39a86483d995ed1::gas_watchtriggerexit();
    wait(duration);
    trigger thread namespace_d39a86483d995ed1::gas_destroytrigger();
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e7
// Size: 0x1bf
function gas_watchtriggerenter() {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            if (isagent(player)) {
                if (player != self.owner && player.team != self.team) {
                    if (!array_contains(self.var_aeeca2bc23f59ea4, player) || isdefined(player.flashendtime) && player.flashendtime < gettime()) {
                        self.var_aeeca2bc23f59ea4[self.var_aeeca2bc23f59ea4.size] = player;
                        if (isdefined(player.var_65771500f49956c1) && player.var_65771500f49956c1) {
                            continue;
                        }
                        player notify("flashbang", player.origin);
                    }
                }
            }
            continue;
        }
        if (player namespace_a2f809133c566621::isjuggernaut()) {
            continue;
        }
        if (namespace_d39a86483d995ed1::function_da8a31143b88e833(player)) {
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
        player thread namespace_d39a86483d995ed1::gas_onentertrigger(self);
    }
}

// Namespace namespace_1bc84ea2517faee6/namespace_abe23f4a1f05240f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbad
// Size: 0x4d
function function_b4bd334ecec6c6c8(asmname, statename, params) {
    self.var_f44c9cede4fb20d6 = 0;
    namespace_98502514a7e5f809::playmeleechargesound();
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 1;
    namespace_98502514a7e5f809::playmeleeanim_vsplayer(asmname, statename, params);
}

