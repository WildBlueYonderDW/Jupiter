// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\anim\animselector.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\script.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\events.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gamescore.gsc;
#using script_19fd5b5d73d44c18;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_ac0edc67c1149926;

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0xb3
function register_ai_damage_callbacks() {
    level.agent_funcs["actor_enemy_lw_base_br"]["on_damaged"] = &callbacksoldieragentdamaged;
    level.agent_funcs["actor_enemy_lw_base_br"]["gametype_on_damage_finished"] = &callbacksoldieragentgametypedamagefinished;
    level.agent_funcs["actor_enemy_lw_base_br"]["gametype_on_killed"] = &callbacksoldieragentgametypekilled;
    level.agent_funcs["actor_enemy_lw_base_juggernaut"]["on_damaged"] = &callbacksoldieragentdamaged;
    level.agent_funcs["actor_enemy_lw_base_juggernaut"]["gametype_on_damage_finished"] = &callbacksoldieragentgametypedamagefinished;
    level.agent_funcs["actor_enemy_lw_base_juggernaut"]["gametype_on_killed"] = &callbacksoldieragentgametypekilled;
    level.var_238d7505b0146b84 = &namespace_3e725f3cc58bddd3::addattacker;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params d, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e
// Size: 0xaae
function callbacksoldieragentdamaged(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    evictim = self;
    if (!isdefined(evictim.agent_type)) {
        return;
    }
    if (!isdefined(objweapon)) {
        objweapon = sweapon;
    }
    if (smeansofdeath != "MOD_SUICIDE") {
        if (is_friendly_damage(evictim, einflictor)) {
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("shield");
                }
            #/
            return;
        }
    }
    if (!isdefined(eattacker)) {
        eattacker = evictim;
    }
    var_99466d795331383a = should_do_damage_checks(eattacker, idamage, smeansofdeath, sweapon, shitloc, evictim);
    if (!var_99466d795331383a) {
        /#
            if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                println("agentsKillstreakCount");
            }
        #/
        return;
    }
    idflags = idflags | 4;
    var_a95f61e7118777d1 = idamage;
    var_5c3f9357f11d2223 = objweapon.basename;
    var_c0b9c9a4fa4eef84 = objweapon.classname;
    var_eac756c4a01aa740 = is_suicide_bomber();
    isinlaststand = istrue(eattacker.inlaststand);
    ismeleedamage = smeansofdeath == "MOD_MELEE";
    bulletdamage = isbulletdamage(smeansofdeath) || smeansofdeath == "MOD_EXPLOSIVE_BULLET" && shitloc != "none";
    var_379485f96865db6d = isdefined(eattacker) && isplayer(eattacker);
    var_7543d4fe49c53684 = isdefined(eattacker.owner) && isplayer(eattacker.owner);
    isjuggernaut = isdefined(evictim.unittype) && evictim.unittype == "juggernaut";
    headshot = bulletdamage && isheadshot(shitloc, smeansofdeath, eattacker);
    isexplosive = smeansofdeath == "MOD_EXPLOSIVE_BULLET" && isdefined(shitloc) && shitloc == "none" || smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE";
    var_f6fcaaa9c3b578a5 = smeansofdeath == "MOD_FIRE";
    var_417d44697dd9a40f = var_379485f96865db6d && eattacker _hasperk("specialty_bulletdamage");
    var_b4a897b1262ea17c = isdefined(eattacker.classname) && eattacker.classname == "script_vehicle" && isdefined(eattacker.owner) && isplayer(eattacker.owner);
    var_f3b5d704ca2a9b3d = var_b4a897b1262ea17c && smeansofdeath == "MOD_CRUSH";
    var_b2f70b31e5b3822f = isdefined(eattacker.classname) && eattacker.classname == "script_vehicle" && !isdefined(eattacker.owner);
    var_565d1ee9d540fa9e = var_b2f70b31e5b3822f && smeansofdeath == "MOD_CRUSH";
    if ((var_379485f96865db6d || var_7543d4fe49c53684) && istrue(evictim.invulnerable) && smeansofdeath != "MOD_SUICIDE") {
        /#
            if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                println("hitblastshield");
            }
        #/
        return;
    }
    if (isjuggernaut) {
        if (ismeleedamage) {
            idamage = 0;
        } else {
            idamage = idamage * 0.3;
            if (var_5c3f9357f11d2223 == "thermite_ap_mp" || var_5c3f9357f11d2223 == "thermite_proj_cp") {
                idamage = idamage * 15;
            }
            if (var_5c3f9357f11d2223 == "cruise_proj_mp") {
                idamage = self.health + 1000;
            }
        }
        if (var_f3b5d704ca2a9b3d) {
            var_ac1eb7a473848892 = [0:"atv"];
            if (array_contains(var_ac1eb7a473848892, eattacker.vehiclename)) {
                eattacker dodamage(10000, eattacker.origin, evictim);
            } else {
                playsoundatpos(self.origin + (0, 0, 40), "gib_fullbody");
                idamage = self.health + 1000;
            }
        }
    } else if (var_379485f96865db6d) {
        if (var_5c3f9357f11d2223 == "throwingknife_mp" || var_5c3f9357f11d2223 == "shuriken_mp" || var_5c3f9357f11d2223 == "throwstar_mp") {
            idamage = self.health + 1000;
        }
        if (var_5c3f9357f11d2223 == "iw9_tur_light_tank_mp" && smeansofdeath == "MOD_PROJECTILE") {
            idamage = self.health + 1000;
        }
    }
    if (istrue(self.bhasriotshieldattached)) {
        if (shouldblockdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon)) {
            return;
        }
        if (shitloc == "shield" && (smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_PROJECTILE") && idamage > 175) {
            idamage = idamage * 0.05;
            shitloc = "torso_lower";
        }
    }
    if (var_eac756c4a01aa740) {
        if (var_5c3f9357f11d2223 == "emp_drone_player_mp") {
            idamage = self.health + 1000;
        }
    }
    if (var_f3b5d704ca2a9b3d) {
        playsoundatpos(self.origin + (0, 0, 40), "gib_fullbody");
    }
    if (var_565d1ee9d540fa9e) {
        if (istrue(self.invuln_to_veh_crush)) {
            idamage = 0;
            evictim notify("veh_crush_damage", eattacker);
        }
    }
    if (var_379485f96865db6d) {
        evictim.damaged_by_player = 1;
        if (headshot) {
            if (isjuggernaut) {
                idamage = adjust_damage_based_on_weaponclass(idamage, sweapon, var_c0b9c9a4fa4eef84, smeansofdeath, eattacker);
            }
        }
        if (var_417d44697dd9a40f) {
            idamage = idamage * 2;
        }
        if (isexplosive) {
            increase = idamage * 2.5;
            if (isdefined(level.explosivedamagemod)) {
                increase = increase * level.explosivedamagemod;
            }
            idamage = idamage + increase;
        }
        if (var_f6fcaaa9c3b578a5) {
            idamage = idamage + idamage * 3.5;
        }
        if (ismeleedamage && !isjuggernaut) {
            if (istrue(evictim.immune_to_melee_damage)) {
                idamage = 0;
                evictim notify("melee_hit_on_melee_immune", eattacker);
            } else {
                idamage = 150;
                if (issubstr(var_5c3f9357f11d2223, "iw8_knife_mp")) {
                    idamage = 350;
                }
                if (issubstr(var_5c3f9357f11d2223, "iw8_me_")) {
                    idamage = 350;
                } else if (isdefined(objweapon.muzzle)) {
                    if (issubstr(objweapon.muzzle, "muzzlemelee")) {
                        idamage = 350;
                    }
                    if (issubstr(objweapon.muzzle, "bayonet")) {
                        idamage = 350;
                    }
                }
            }
        }
        if (bulletdamage) {
            if (!headshot) {
                if (!isdefined(level.bullet_damage_scalar)) {
                    level.bullet_damage_scalar = 1;
                }
                idamage = idamage * level.bullet_damage_scalar;
            }
            idamage = idamage * 1;
        }
    }
    if (isdefined(var_5c3f9357f11d2223) && var_5c3f9357f11d2223 == "iw9_tur_light_tank_mp" && isdefined(smeansofdeath) && smeansofdeath == "MOD_PROJECTILE_SPLASH") {
        idamage = idamage * 2;
    }
    if (var_379485f96865db6d || var_7543d4fe49c53684 || var_f3b5d704ca2a9b3d) {
        if (isdefined(eattacker) && isplayer(eattacker)) {
            var_ba9dc00e6d5896dc = int(min(idamage, self.health));
            namespace_3e725f3cc58bddd3::function_f9237ec4a57b0ff9(eattacker, var_ba9dc00e6d5896dc, idamage, undefined, objweapon, shitloc);
        }
        if (isdefined(objweapon)) {
            if (var_7543d4fe49c53684) {
                eattacker = eattacker.owner;
            }
            namespace_3e725f3cc58bddd3::addattacker(self, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, timeoffset, smeansofdeath);
        }
        if (idamage >= evictim.health) {
            if (objweapon.basename == "none") {
                if (isdefined(einflictor) && isdefined(einflictor.weapon_name)) {
                    objweapon = makeweapon(einflictor.weapon_name);
                }
            }
            var_4d8d96d547df2e9f = spawnstruct();
            var_4d8d96d547df2e9f.einflictor = einflictor;
            var_4d8d96d547df2e9f.eattacker = eattacker;
            var_4d8d96d547df2e9f.idamage = idamage;
            var_4d8d96d547df2e9f.idflags = idflags;
            var_4d8d96d547df2e9f.smeansofdeath = smeansofdeath;
            var_4d8d96d547df2e9f.sweapon = sweapon;
            var_4d8d96d547df2e9f.vpoint = vpoint;
            var_4d8d96d547df2e9f.vdir = vdir;
            var_4d8d96d547df2e9f.shitloc = shitloc;
            var_4d8d96d547df2e9f.timeoffset = timeoffset;
            var_4d8d96d547df2e9f.modelindex = modelindex;
            var_4d8d96d547df2e9f.partname = partname;
            var_4d8d96d547df2e9f.objweapon = objweapon;
        }
    }
    /#
        namespace_d325722f2754c2c4::function_c9e5c511b923a42f(idamage, eattacker, evictim, smeansofdeath, shitloc, einflictor, vpoint);
    #/
    idamage = int(min(idamage, evictim.maxhealth));
    if (is_flashbang(var_5c3f9357f11d2223, objweapon, einflictor) && smeansofdeath == "MOD_GRENADE_SPLASH") {
        evictim notify("flashbang", shitloc);
    }
    if (is_gas(var_5c3f9357f11d2223) && smeansofdeath == "MOD_GRENADE_SPLASH") {
        evictim notify("flashbang", shitloc);
    }
    /#
        if (getdvarint(@"hash_f42eefd3e1b79376") != 0 && idamage != var_a95f61e7118777d1) {
            println("ui_dmg_num_x" + idamage);
        }
    #/
    if (isdefined(evictim.unittype) && isdefined(level.agent_funcs[evictim.unittype]) && isdefined(level.agent_funcs[evictim.unittype]["on_damaged_finished"])) {
        evictim [[ level.agent_funcs[evictim.unittype]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname);
    } else {
        /#
            assert(isdefined(level.agent_funcs[evictim.agent_type]["on_damaged_finished"]));
        #/
        evictim [[ level.agent_funcs[evictim.agent_type]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname);
    }
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d3
// Size: 0x44
function private function_2587e7c010a44740() {
    if (!isdefined(level.var_3749fd90367bc366)) {
        level.var_3749fd90367bc366 = 1;
        if (isusingmatchrulesdata()) {
            level.var_3749fd90367bc366 = getmatchrulesdata("commonOption", "aiKilledScoreEventsEnabled");
        }
    }
    return level.var_3749fd90367bc366;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131f
// Size: 0xe6
function callbacksoldieragentgametypedamagefinished(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, var_b6f2ea21c3462024, modelindex, partname) {
    if (smeansofdeath == "MOD_SUICIDE") {
        return;
    }
    process_damage_feedback(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vdir, vdir, shitloc, timeoffset, self);
    idflags = 0;
    if (!isdefined(self.painsound)) {
        return;
    }
    if (gettime() > self.next_dmg_sound) {
        if (soundexists(self.painsound)) {
            self playsound(self.painsound);
        }
        self.next_dmg_sound = gettime() + 500;
    }
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140c
// Size: 0x94b
function callbacksoldieragentgametypekilled(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration) {
    if (isdefined(level.spawnloopupdatefunc)) {
        [[ level.spawnloopupdatefunc ]](eattacker, objweapon);
    }
    if (smeansofdeath == "MOD_SUICIDE") {
        return;
    }
    if (istrue(self.marked_for_death)) {
        self.marked_for_death = undefined;
    }
    if (isdefined(self.death_info_func)) {
        var_4d8d96d547df2e9f = spawnstruct();
        var_4d8d96d547df2e9f.einflictor = einflictor;
        var_4d8d96d547df2e9f.eattacker = eattacker;
        var_4d8d96d547df2e9f.idamage = idamage;
        var_4d8d96d547df2e9f.smeansofdeath = smeansofdeath;
        var_4d8d96d547df2e9f.sweapon = objweapon;
        var_4d8d96d547df2e9f.vdir = vdir;
        var_4d8d96d547df2e9f.shitloc = shitloc;
        var_4d8d96d547df2e9f.timeoffset = timeoffset;
        var_4d8d96d547df2e9f.deathanimduration = deathanimduration;
        thread [[ self.death_info_func ]](var_4d8d96d547df2e9f);
    }
    var_8ab5c5c115a5359f = isdefined(eattacker) && isplayer(eattacker);
    var_c611d3b6a31f919 = isdefined(eattacker) && isdefined(eattacker.owner) && isplayer(eattacker.owner);
    var_4057c6ccc0529d32 = eattacker namespace_a2f809133c566621::isjuggernaut();
    iskillstreakweapon = var_4057c6ccc0529d32 || namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename);
    isvehicleweapon = namespace_68e641469fde3fa7::isvehicleweapon(objweapon.basename);
    var_3b5afcfeed8fb9cf = undefined;
    if (var_8ab5c5c115a5359f) {
        var_3b5afcfeed8fb9cf = eattacker;
    } else if (var_c611d3b6a31f919) {
        var_3b5afcfeed8fb9cf = eattacker.owner;
    }
    if (isdefined(var_3b5afcfeed8fb9cf)) {
        if (namespace_36f464722d326bbe::isbrstylegametype() && isdefined(level.var_41f4bc9ee8c7c9c6)) {
            foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
                if (isdefined(contract.funcs["onAIKilled"])) {
                    foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                        if (contract.ref == task.type.ref) {
                            task [[ contract.funcs["onAIKilled"] ]](var_3b5afcfeed8fb9cf, self);
                        }
                    }
                }
            }
        }
        if (!istrue(level.disablestattracking)) {
            if (!istrue(level.var_4a486ba98909b396)) {
                var_642470e1abc1bbf9 = spawnstruct();
                var_642470e1abc1bbf9.hitloc = shitloc;
                var_3b5afcfeed8fb9cf namespace_391de535501b0143::function_b7f154368abbe463(self, objweapon, smeansofdeath, einflictor, var_642470e1abc1bbf9);
            }
            namespace_391de535501b0143::function_3e2ff5954aacaa33(objweapon, smeansofdeath, einflictor);
            if (istrue(level.var_289df80e1ded586f)) {
                var_3a99d1cafe4a4bac = namespace_aad14af462a74d08::function_137b512700167b00(var_3b5afcfeed8fb9cf, self);
                level thread namespace_aad14af462a74d08::function_5a0ae8bc2b80c0c0(einflictor, var_3b5afcfeed8fb9cf, idamage, smeansofdeath, objweapon, shitloc, var_3b5afcfeed8fb9cf.modifiers, undefined, self.team, var_3a99d1cafe4a4bac);
            }
            namespace_8361bad7391de074::function_aff49e563a741f1e(self, var_3b5afcfeed8fb9cf, objweapon);
            fullweaponname = getcompleteweaponname(objweapon);
            if (isdefined(var_3b5afcfeed8fb9cf.modifiers) && istrue(var_3b5afcfeed8fb9cf.modifiers["ads"])) {
                var_3b5afcfeed8fb9cf thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(fullweaponname, 1, "ai_ads_kills");
            }
            if (smeansofdeath == "MOD_HEAD_SHOT" || namespace_391de535501b0143::function_632bdd4591097aef(shitloc)) {
                var_3b5afcfeed8fb9cf thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(fullweaponname, 1, "ai_headshots");
            }
        }
        var_3b5afcfeed8fb9cf thread updaterecentagentkills(self, einflictor, objweapon);
        level thread handle_death_sounds(var_3b5afcfeed8fb9cf, self, smeansofdeath);
        if (!iskillstreakweapon && !isvehicleweapon && !var_3b5afcfeed8fb9cf namespace_82dcd1d5ae30ff7::_hasperk("specialty_explosivebullets")) {
            var_3b5afcfeed8fb9cf thread namespace_391de535501b0143::killeventtextpopup(#"kill", 0);
            if (level.agentskillstreakcount > 0) {
                if (!isdefined(var_3b5afcfeed8fb9cf.pers["agentsKillstreakCount"])) {
                    var_3b5afcfeed8fb9cf.pers["agentsKillstreakCount"] = 1;
                } else {
                    var_3b5afcfeed8fb9cf.pers["agentsKillstreakCount"]++;
                }
                if (var_3b5afcfeed8fb9cf.pers["agentsKillstreakCount"] == level.agentskillstreakcount) {
                    if (var_3b5afcfeed8fb9cf namespace_f8065cafc523dba5::_isalive()) {
                        event = #"kill";
                        points = namespace_62c556437da28f50::getscoreinfovalue(event);
                        var_3b5afcfeed8fb9cf namespace_58a74e7d54b56e8d::givestreakpoints(event, 1, points);
                    }
                    var_3b5afcfeed8fb9cf.pers["agentsKillstreakCount"] = 0;
                }
            }
            if (isdefined(var_3b5afcfeed8fb9cf.modifiers) && function_2587e7c010a44740()) {
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["oneshotkill"])) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_d3bb96c8bd6efd71");
                }
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["gunbutt"])) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_20fbb2528f21bd3");
                }
                if (smeansofdeath == "MOD_MELEE") {
                    if (objweapon.basename == "iw9_me_fists_mp") {
                        var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_d3dd8a69e4a03838");
                    }
                }
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["headshot"])) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"headshot");
                    var_3b5afcfeed8fb9cf thread namespace_391de535501b0143::killeventtextpopup(#"headshot", 0);
                }
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["pointblank"])) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"pointblank");
                }
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["longshot"])) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"longshot");
                }
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["backstab"])) {
                    if (objweapon.basename == "iw8_knife_mp") {
                        var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"backstab");
                    }
                }
                if (var_3b5afcfeed8fb9cf ismantling()) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_86c2b3d1fa522f2b");
                }
                if (namespace_68e641469fde3fa7::isthrowingknife(objweapon.basename)) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_123320811bf44b63");
                }
                if (istrue(var_3b5afcfeed8fb9cf.modifiers["launcher_impact"])) {
                    var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_e13c7899c2eed171");
                }
            }
        }
        if (isvehicleweapon && isdefined(var_3b5afcfeed8fb9cf.vehicle) && isdefined(var_3b5afcfeed8fb9cf.vehicle.var_8bb6b9b919c2c19d)) {
            var_3b5afcfeed8fb9cf thread namespace_48a08c5037514e04::doscoreevent(#"hash_6d65a58e1de667e1");
        }
        if (isdefined(self.attackers)) {
            foreach (player in self.attackers) {
                if (!isdefined(_validateattacker(player))) {
                    continue;
                }
                if (player == var_3b5afcfeed8fb9cf) {
                    continue;
                }
                if (self == player) {
                    continue;
                }
                if (isdefined(level.assists_disabled)) {
                    continue;
                }
                var_54351d786449ee9e = 0;
                assistweapon = undefined;
                if (isdefined(self.attackerdata)) {
                    attackerdata = self.attackerdata[player.guid];
                    if (isdefined(attackerdata)) {
                        assistweapon = attackerdata.objweapon;
                    }
                    if (attackerdata.damage >= 35) {
                        var_54351d786449ee9e = 1;
                    }
                    if (attackerdata.damage >= 70) {
                        var_54351d786449ee9e = 2;
                    }
                }
                player thread namespace_e8a49b70d0769b66::processassist(self, assistweapon, var_54351d786449ee9e);
                if (isdefined(player.super)) {
                    if (player.super.staticdata.ref == "super_battlerage") {
                        player namespace_e6ac9d98b8876b98::function_3f783a5aca22152d();
                    }
                }
            }
        }
    }
    if (smeansofdeath == "MOD_CRUSH" && isdefined(eattacker.classname) && eattacker.classname == "script_vehicle") {
        playsoundatpos(self.origin + (0, 0, 18), "vehicle_body_hit");
    }
    if (isdefined(level.removefromtargetmarkeronkillfunc)) {
        level thread [[ level.removefromtargetmarkeronkillfunc ]](self);
    }
    idflags = 0;
    process_damage_feedback(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, vdir, shitloc, timeoffset, self);
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5e
// Size: 0xae
function is_friendly_damage(agent, attacker) {
    if (isdefined(attacker) && isdefined(agent) && isdefined(agent.team)) {
        if (isdefined(attacker.team) && attacker.team == agent.team) {
            return 1;
        }
        if (isdefined(attacker.owner) && isdefined(attacker.owner.team) && attacker.owner.team == agent.team) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e14
// Size: 0x9a
function should_do_damage_checks(eattacker, idamage, smeansofdeath, sweapon, shitloc, victim) {
    if (!isdefined(sweapon)) {
        return 0;
    } else if (eattacker != victim && isdefined(eattacker.team) && eattacker.team == victim.team) {
        return 0;
    } else if (isdefined(level.should_do_damage_check_func) && ![[ level.should_do_damage_check_func ]](eattacker, idamage, smeansofdeath, sweapon, shitloc, victim)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb6
// Size: 0x21
function is_suicide_bomber() {
    return istrue(isdefined(self.unittype) && self.unittype == "suicidebomber");
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1edf
// Size: 0xea
function adjust_damage_based_on_weaponclass(idamage, sweapon, weaponclass, type, attacker) {
    modifieddamage = idamage;
    switch (weaponclass) {
    case #"hash_8cdaf2e4ecfe5b51":
        modifieddamage = min(idamage, 84);
        break;
    case #"hash_900cb96c552c5e8e":
        modifieddamage = min(idamage, 110);
        break;
    case #"hash_fa24dff6bd60a12d":
        modifieddamage = min(idamage, 105);
        break;
    case #"hash_690c0d6a821b42e":
        modifieddamage = min(idamage, 84);
        break;
    case #"hash_719417cb1de832b6":
        modifieddamage = min(idamage, 75);
        break;
    case #"hash_6191aaef9f922f96":
        modifieddamage = min(idamage, 130);
        break;
    default:
        modifieddamage = idamage;
        break;
    }
    return idamage;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd1
// Size: 0x23
function is_flashbang(weaponname, objweapon, inflictor) {
    return weaponname == "flash_grenade_mp";
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ffc
// Size: 0x13
function is_gas(weaponname) {
    return weaponname == "gas_mp";
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2017
// Size: 0xc9
function handle_death_sounds(attacker, victim, smeansofdeath) {
    if (!isbulletdamage(smeansofdeath)) {
        return;
    }
    if (isdefined(victim.deathsound) && soundexists(victim.deathsound)) {
        playsoundatpos(victim.origin, victim.deathsound);
    }
    ent = victim;
    if (smeansofdeath == "MOD_HEAD_SHOT") {
        ent playsoundtoplayer("bullet_impact_headshot", attacker);
        ent playsoundtoteam("bullet_impact_headshot_npc", attacker.team, attacker);
    } else {
        ent playsoundtoplayer("mp_kill_alert", attacker);
        ent playsoundtoteam("mp_hit_alert_final_npc", attacker.team, attacker);
    }
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e7
// Size: 0x6f5
function process_damage_feedback(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, victim) {
    var_168973eaf883aea1 = isdefined(eattacker) && isdefined(eattacker.classname) && isdefined(eattacker.classname) && !isdefined(eattacker.gunner) && (eattacker.classname == "script_vehicle" || eattacker.classname == "misc_turret" || eattacker.classname == "script_model");
    var_91ebb035a259e76a = undefined;
    if (var_168973eaf883aea1 && isdefined(eattacker.gunner)) {
        var_91ebb035a259e76a = eattacker.gunner;
    } else if (isdefined(eattacker) && isdefined(eattacker.owner)) {
        var_91ebb035a259e76a = eattacker.owner;
    } else {
        var_91ebb035a259e76a = eattacker;
    }
    isbulletdamage = isbulletdamage(smeansofdeath);
    var_cdcedb142f61b43e = ter_op(isbulletdamage && namespace_68e641469fde3fa7::isprimaryweapon(sweapon), "standardspread", "standard");
    var_59ad6a29257c9f49 = 0;
    if (isdefined(eattacker) && isdefined(eattacker.class) && eattacker.class == "engineer") {
        if (isdefined(smeansofdeath) && isbulletdamage(smeansofdeath)) {
            var_59ad6a29257c9f49 = 1;
        }
    }
    if (isdefined(var_91ebb035a259e76a) && var_91ebb035a259e76a != victim && idamage > 0 && (!isdefined(shitloc) || shitloc != "shield")) {
        var_4ffe32f42d51a763 = !isalive(victim) || isagent(victim) && idamage >= victim.health;
        if (istrue(victim.isjuggernaut)) {
            if (istrue(victim.isjuggernautrecon)) {
                var_cdcedb142f61b43e = "hitjuggernautrecon";
            } else {
                var_cdcedb142f61b43e = "hitjuggernaut";
            }
        } else if (idflags & 16) {
            var_cdcedb142f61b43e = "stun";
        } else if (istacticaldamage(sweapon, smeansofdeath) && victim _hasperk("specialty_stun_resistance")) {
            var_cdcedb142f61b43e = "hittacresist";
        } else if (isexplosivedamagemod(smeansofdeath) && victim _hasperk("specialty_blastshield") && !damage_should_ignore_blast_shield(eattacker, victim, sweapon, smeansofdeath, einflictor, shitloc)) {
            var_cdcedb142f61b43e = "hitblastshield";
        } else if (victim _hasperk("specialty_pistoldeath") && isdefined(victim.inlaststand) && victim.inlaststand == 1 && !victim.hasshownlaststandicon) {
            victim.hasshownlaststandicon = 1;
            var_cdcedb142f61b43e = "hitlaststand";
        }
        if (isdefined(victim.focus_fire_attackers) && victim.focus_fire_attackers.size > 1) {
            var_cdcedb142f61b43e = "cp_relic_buff";
        }
        var_b98146816886d3c4 = "standard";
        weapclass = weaponclass(sweapon);
        isspreadweapon = weapclass == "spread";
        headshot = !isspreadweapon && isheadshot(shitloc, smeansofdeath, eattacker);
        var_14b8f2eeba6a3e78 = 1;
        var_62cf84636d4cef2c = smeansofdeath == "MOD_MELEE";
        var_748dfd5f88e890d1 = "" + gettime();
        if (!var_62cf84636d4cef2c && isspreadweapon && isdefined(var_91ebb035a259e76a.pelletdmg) && isdefined(var_91ebb035a259e76a.pelletdmg[var_748dfd5f88e890d1]) && isdefined(var_91ebb035a259e76a.pelletdmg[var_748dfd5f88e890d1][victim.guid]) && var_91ebb035a259e76a.pelletdmg[var_748dfd5f88e890d1][victim.guid] > 1) {
            if (var_4ffe32f42d51a763) {
                var_62cf84636d4cef2c = 1;
            } else {
                var_14b8f2eeba6a3e78 = 0;
            }
        }
        var_d7198ceb7d51db5b = undefined;
        if (victim.health <= idamage) {
            var_d7198ceb7d51db5b = 1;
        }
        headshot = isheadshot(shitloc, smeansofdeath, eattacker);
        if (istrue(var_d7198ceb7d51db5b)) {
            if (isdefined(eattacker)) {
                if (isdefined(eattacker.owner) && isplayer(eattacker.owner)) {
                    if (function_2587e7c010a44740()) {
                        eattacker.owner thread namespace_48a08c5037514e04::doscoreevent(#"kill", sweapon, undefined, undefined, self, undefined, undefined, 1, undefined, 1);
                    }
                } else if (isplayer(eattacker)) {
                    var_4b5a99c16abfdfb1 = undefined;
                    if (isdefined(self.var_47bde44b1acec603)) {
                        var_6aa094bd7b024408 = getdvarint(function_2ef675c13ca1c4af(@"hash_d3efda60f4581524", self.var_47bde44b1acec603), 0);
                        if (var_6aa094bd7b024408 > 0) {
                            var_4b5a99c16abfdfb1 = var_6aa094bd7b024408;
                        } else {
                            var_4b5a99c16abfdfb1 = getdvarint(@"hash_dfcad66b7ba8da13", 500);
                        }
                    }
                    if (function_2587e7c010a44740()) {
                        eattacker thread namespace_48a08c5037514e04::doscoreevent(#"kill", sweapon, undefined, var_4b5a99c16abfdfb1, self, undefined, undefined, 1, undefined, 1);
                    }
                    if (isdefined(self.var_47bde44b1acec603) && function_934ac55aa85ce574() && isdefined(eattacker.team)) {
                        foreach (player in namespace_54d20dd0dd79277f::getteamdata(eattacker.team, "players")) {
                            if (isdefined(player)) {
                                if (player != eattacker && function_2587e7c010a44740()) {
                                    player thread namespace_48a08c5037514e04::doscoreevent(#"kill", undefined, undefined, var_4b5a99c16abfdfb1, self, undefined, undefined, 1, undefined, 1);
                                }
                                if (!isdefined(player.var_6aa094bd7b024408)) {
                                    player.var_6aa094bd7b024408 = 0;
                                }
                                player.var_6aa094bd7b024408 = player.var_6aa094bd7b024408 + var_4b5a99c16abfdfb1;
                            }
                        }
                    }
                    if (smeansofdeath == "MOD_EXECUTION") {
                        eattacker thread namespace_48a08c5037514e04::doscoreevent(#"execution");
                    }
                }
            }
        }
        if (istrue(var_14b8f2eeba6a3e78)) {
            if (isdefined(eattacker)) {
                if (isdefined(eattacker.owner)) {
                    eattacker.owner thread updatedamagefeedback(var_cdcedb142f61b43e, var_d7198ceb7d51db5b, headshot);
                } else {
                    eattacker thread updatedamagefeedback(var_cdcedb142f61b43e, var_d7198ceb7d51db5b, headshot);
                }
            }
        }
    }
    if (isdefined(level.var_484f1a4bdb5cda1e) && isdefined(eattacker)) {
        if (isdefined(eattacker.owner)) {
            eattacker = eattacker.owner;
        }
        level [[ level.var_484f1a4bdb5cda1e ]](eattacker, victim);
    }
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e3
// Size: 0x32
function _hasperk(perkname) {
    perks = self.perks;
    if (!isdefined(perks)) {
        return 0;
    }
    if (isdefined(perks[perkname])) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281d
// Size: 0x475
function shouldblockdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_5c3f9357f11d2223 = objweapon.basename;
    var_83a06097f54c024b = 0;
    if (isdefined(einflictor) && (issubstr(var_5c3f9357f11d2223, "thermite") || isdefined(objweapon.magazine) && issubstr(objweapon.magazine, "boltfire") || isdefined(einflictor.weapon_name) && issubstr(einflictor.weapon_name, "incendiary"))) {
        var_83a06097f54c024b = 1;
        var_35af7dae0105a3e3 = shitloc == "shield";
        if (var_35af7dae0105a3e3) {
            contents = namespace_2a184fc4902783dc::create_character_contents();
            var_759cadfd4d74bffd = vectornormalize(vdir);
            startpos = vpoint - var_759cadfd4d74bffd * 12;
            endpos = vpoint + var_759cadfd4d74bffd * 12;
            results = namespace_2a184fc4902783dc::ray_trace_detail(startpos, endpos, undefined, contents);
            if (results["fraction"] > 0 && results["fraction"] < 1) {
                var_1b4fd8d84ca96180 = vpoint - self.origin;
                var_1b4fd8d84ca96180 = (var_1b4fd8d84ca96180[0], var_1b4fd8d84ca96180[1], 0);
                if (vectordot(var_1b4fd8d84ca96180, results["normal"]) < 0) {
                    var_35af7dae0105a3e3 = 0;
                }
            } else {
                var_35af7dae0105a3e3 = 0;
            }
        }
        if (var_35af7dae0105a3e3) {
            parent = einflictor getlinkedparent();
            if (isdefined(parent) && parent == self) {
                self.bhasthermitestucktoshield = 1;
                self.thermitestuckpains = 0;
            }
        } else if (shitloc != "none") {
            self.bhasthermitestucktoshield = 0;
            self.thermitestuckpains = undefined;
        }
    }
    if (shitloc == "shield") {
        if (var_83a06097f54c024b) {
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("<unknown string>");
                }
            #/
            return 1;
        }
    } else if (shitloc == "none" && isdefined(einflictor)) {
        var_afcdb89d9c3e8439 = einflictor getlinkedparent();
        if (self.bhasthermitestucktoshield && var_83a06097f54c024b && isdefined(var_afcdb89d9c3e8439) && var_afcdb89d9c3e8439 == self) {
            if (!isdefined(self.thermitestucktoshield)) {
                self.thermitestucktoshield = [0:einflictor];
            } else if (!array_contains(self.thermitestucktoshield, einflictor)) {
                self.thermitestucktoshield[self.thermitestucktoshield.size] = einflictor;
            }
            /#
                assert(isdefined(self.thermitestuckpains));
            #/
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("<unknown string>");
                }
            #/
            self.thermitestuckpains++;
            return 1;
        } else if (issubstr(var_5c3f9357f11d2223, "molotov")) {
            var_289cb9fcbd6aa7c8 = einflictor.origin - self.origin;
            var_8b5b7d7c1e6793de = vectornormalize((var_289cb9fcbd6aa7c8[0], var_289cb9fcbd6aa7c8[1], 0));
            var_289cb9fcbd6aa7c8 = vectornormalize(var_289cb9fcbd6aa7c8);
            if (vectordot(anglestoforward(self.angles), var_8b5b7d7c1e6793de) > 0.5 && -0.98 < var_289cb9fcbd6aa7c8[2] && var_289cb9fcbd6aa7c8[2] < 0.98) {
                /#
                    if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                        println("<unknown string>");
                    }
                #/
                return 1;
            }
        }
    }
    if (smeansofdeath == "MOD_MELEE") {
        if (isdefined(eattacker)) {
            var_392a20ab0d4853fb = vectornormalize(eattacker.origin - self.origin);
        } else {
            var_392a20ab0d4853fb = vectornormalize(vpoint - self.origin);
        }
        var_c4182e9c211ff588 = anglestoforward(self.angles);
        if (vectordot(var_c4182e9c211ff588, var_392a20ab0d4853fb) > 0.5) {
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("<unknown string>");
                }
            #/
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9a
// Size: 0xb5
function function_42baa3bb97d2d1d7(player, var_a3732517126407b2, idamage, vpoint, var_ecbb293aaa7a43b0) {
    idamage = int(clamp(idamage, 0, 1000000));
    player setclientomnvar("ui_dmg_num_amount", idamage);
    player setclientomnvar("ui_dmg_num_x", int(vpoint[0]));
    player setclientomnvar("ui_dmg_num_y", int(vpoint[1]));
    player setclientomnvar("ui_dmg_num_z", int(vpoint[2]));
    player setclientomnvar("ui_dmg_num_element", var_ecbb293aaa7a43b0);
    player setclientomnvar("ui_dmg_num_state", var_a3732517126407b2);
    player setclientomnvar("ui_dmg_num_notify", gettime());
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d56
// Size: 0x38
function function_73075c88c97d2d50() {
    return isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_83ace700ff20678c) || getdvarint(@"hash_8a8ff6ed00ccc7a", 0);
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d96
// Size: 0x38
function function_9db5f6f105cde5da() {
    return isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_34f596a1ce19ca) || getdvarint(@"hash_550484f2b30cf121", 0);
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd6
// Size: 0x38
function function_87c3b43d00319847() {
    return isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_fe33630e0f09e5df) || getdvarint(@"hash_1661f35e34f544eb", 0);
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e16
// Size: 0x216
function function_c54b2cc2e762c201(eattacker, var_11467c69aa950e0a, shitloc, smeansofdeath, sweapon, idamage, vpoint, var_da71c7321bc0a0f6, var_b1468c561460431e, var_14edc6d1db3695bc, var_feef4b237a6beb07) {
    if (!function_73075c88c97d2d50()) {
        return;
    }
    var_768d659419360f70 = sweapon.var_9d7facbe889e667c;
    var_67f0b952bd068395 = 0;
    if (isdefined(var_768d659419360f70) && isdefined(level.var_96c4059aa2eabfb8)) {
        var_96c4059aa2eabfb8 = level.var_96c4059aa2eabfb8[var_768d659419360f70];
        if (isdefined(var_96c4059aa2eabfb8)) {
            var_67f0b952bd068395 = var_96c4059aa2eabfb8.var_67f0b952bd068395;
        }
    }
    if (istrue(var_67f0b952bd068395)) {
        return;
    }
    var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(sweapon);
    var_a3732517126407b2 = 1;
    var_c9c7e8d091b092ed = 0;
    if (istrue(var_da71c7321bc0a0f6)) {
        var_a3732517126407b2 = 4;
    } else if (istrue(var_feef4b237a6beb07)) {
        var_a3732517126407b2 = 3;
    } else {
        if (isdefined(var_b1468c561460431e) && isdefined(var_11467c69aa950e0a.var_691b16f55274b1c5) && isarray(var_11467c69aa950e0a.var_691b16f55274b1c5) && istrue(var_11467c69aa950e0a.var_691b16f55274b1c5[var_b1468c561460431e])) {
            var_c9c7e8d091b092ed = level.var_7843c346baff928f[var_b1468c561460431e];
        }
        if (istrue(var_14edc6d1db3695bc) && var_cf4209c200f8bbf4 != "weapon_projectile") {
            var_a3732517126407b2 = 2;
        }
    }
    if (shitloc == "none" && smeansofdeath != "MOD_MELEE") {
        var_daf8775c1297460f = function_53c4c53197386572(var_11467c69aa950e0a.var_2be88729da6fdbc5, (0, 0, 12));
        if (isent(var_11467c69aa950e0a) && isalive(var_11467c69aa950e0a)) {
            var_e4c943d63e229d1c = function_53c4c53197386572(var_11467c69aa950e0a.var_52dcdba485e7ceeb, "j_head");
            vpoint = var_11467c69aa950e0a gettagorigin(var_e4c943d63e229d1c) + var_daf8775c1297460f;
        } else {
            vpoint = var_11467c69aa950e0a.origin + var_daf8775c1297460f;
        }
    }
    thread function_7a6bbb24289296e7(eattacker, var_a3732517126407b2, idamage, vpoint, var_c9c7e8d091b092ed);
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3033
// Size: 0x94
function function_7a6bbb24289296e7(player, var_a3732517126407b2, idamage, vpoint, var_ecbb293aaa7a43b0) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    if (!isdefined(player.var_a0f98ffc22b158e3)) {
        player.var_a0f98ffc22b158e3 = 0;
    }
    if (!isdefined(var_ecbb293aaa7a43b0)) {
        var_ecbb293aaa7a43b0 = 0;
    }
    player.var_a0f98ffc22b158e3++;
    wait(0.05 * player.var_a0f98ffc22b158e3);
    function_42baa3bb97d2d1d7(player, var_a3732517126407b2, idamage, vpoint, var_ecbb293aaa7a43b0);
    player.var_a0f98ffc22b158e3--;
}

// Namespace namespace_ac0edc67c1149926/namespace_329d1a4521cd0e73
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ce
// Size: 0xe2
function updaterecentagentkills(victim, einflictor, objweapon) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("updateRecentAgentKills");
    self endon("updateRecentAgentKills");
    if (!isdefined(self.var_5431d89a36b0936)) {
        self.var_5431d89a36b0936 = 0;
    }
    self.var_5431d89a36b0936++;
    var_366b0ecc2f28aead = undefined;
    if (isdefined(objweapon)) {
        if (isdefined(objweapon.basename) && objweapon.basename == "none") {
            if (isdefined(einflictor) && isdefined(einflictor.weapon_name)) {
                var_366b0ecc2f28aead = einflictor.weapon_name;
            }
        } else {
            var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
        }
    }
    bufferednotify("update_rapid_agent_kill_buffered", self.var_5431d89a36b0936, var_366b0ecc2f28aead);
    wait(4);
    self.var_5431d89a36b0936 = 0;
}

