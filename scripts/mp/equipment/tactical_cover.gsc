// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;
#using script_13865ca76df87ea;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\auto_ascender.gsc;
#using scripts\cp_mp\auto_ascender_solo.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\movers.gsc;
#using script_5f903436642211af;
#using scripts\mp\perks\perk_equipmentping.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\damage.gsc;
#using script_74b851b7aa1ef32d;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;

#namespace namespace_1beeccb5964a0000;

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x985
// Size: 0x1c2
function tac_cover_init() {
    if (!isdefined(level.taccovercollision)) {
        var_d805a86a5fe7aaf2 = getentarray("tactical_cover_col", "targetname");
        if (isdefined(var_d805a86a5fe7aaf2)) {
            level.taccovercollision = var_d805a86a5fe7aaf2[0];
        }
    }
    if (0) {
        level.taccovertriggerblockers = getentarray("dcover_blocker", "targetname");
    }
    if (1) {
        if (!isdefined(level.var_f73654528e070ab4)) {
            level.var_f73654528e070ab4 = getstructarray("dcover_blocker_struct", "targetname");
            foreach (var_445b9ac77407a627 in level.var_f73654528e070ab4) {
                level function_b8ffeacf84a9d34e(var_445b9ac77407a627);
            }
        } else {
            foreach (var_445b9ac77407a627 in level.var_f73654528e070ab4) {
                level function_b8ffeacf84a9d34e(var_445b9ac77407a627);
            }
            level.var_f73654528e070ab4 = array_combine(level.var_f73654528e070ab4, getentarray("dcover_blocker_struct", "targetname"));
        }
    }
    level.taccover_timeout = getdvarfloat(@"hash_fdeb104ec6908df8", 150);
    level.var_29bd6759d7f2ed45 = getdvarint(@"hash_b2324a0894ed035f", 1);
    level.var_f3be3f9bad33bf87 = getdvarint(function_2ef675c13ca1c4af(@"hash_2798c84281925605", namespace_cd0b2d039510b38d::getsubgametype(), "_damagedScoreLimit"), 0) == 1;
    /#
        setdevdvarifuninitialized(@"hash_a5a0ca488a1da730", 0);
    #/
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4e
// Size: 0x40
function tac_cover_on_give(ref, slot, variantid) {
    self notify("tac_cover_given");
    /#
        if (!isdefined(level.taccovercollision)) {
            self iprintlnbold("showErrorMessage");
        }
    #/
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x2e
function tac_cover_on_take(ref, slot, issuper) {
    self notify("tac_cover_taken");
    self.taccoverrefund = undefined;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbca
// Size: 0x25
function tac_cover_used(grenade) {
    if (isdefined(grenade)) {
        grenade hide();
    }
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf6
// Size: 0xd5e
function tac_cover_on_fired(ref, slot, objweapon, issuper) {
    if (self isswimming() || !self isonground() || istrue(self.var_c74e2a2f7c14d917)) {
        tac_cover_fire_failed(0);
        return 0;
    }
    self.taccoverrefund = 1;
    contents = physics_createcontents([0:"physicscontents_characterproxy", 1:"physicscontents_playerclip", 2:"physicscontents_vehicle"]);
    ignorelist = tac_cover_ignore_list(self);
    if (ignorelist.size > 128) {
        logstring("count,entNum,birthtime,origin,classname,code_classname,model,targetname,script_noteworthy,ownerNum");
        var_a2fce1a0daa1830a = getentarray();
        foreach (i, ent in ignorelist) {
            str = "" + i;
            if (isent(ent)) {
                fields = [0:ent getentitynumber(), 1:ent.birthtime, 2:ent.origin, 3:ent.classname, 4:ent.code_classname, 5:ent.model, 6:ent.targetname, 7:ent.script_noteworthy];
                if (isdefined(ent.owner)) {
                    fields[fields.size] = ent.owner getentitynumber();
                } else {
                    fields[fields.size] = -1;
                }
                foreach (value in fields) {
                    if (!isdefined(value)) {
                        value = "<undefined>";
                    }
                    str = str + "," + value;
                }
            } else {
                str = str + ",not an ent";
            }
            logstring(str);
        }
    }
    playerforward = anglestoforward(self.angles);
    targetpos = self.origin + playerforward * 32;
    var_44736cee8afad49b = scriptable_door_get_in_radius(targetpos, 140, 20);
    var_2464edc7c410e680 = undefined;
    var_445ccda2fa82b65e = 0;
    if (tac_cover_blocked_by_turret(targetpos)) {
        tac_cover_fire_failed(0);
        return 0;
    }
    if (namespace_c851aa543ccfe72f::function_ff57f9acf27bbc3c(targetpos)) {
        return 0;
    }
    if (namespace_dbfefbfabc3195f::ispointnearsoloascenderline(targetpos)) {
        return 0;
    }
    if (function_6cc8838979f47b9f(targetpos) || function_ac29e794c919fe03(targetpos) || function_9461775d71e495cf(targetpos)) {
        tac_cover_fire_failed(0);
        return 0;
    }
    traceresults = undefined;
    contents = undefined;
    radius = getdvarfloat(@"hash_9fa5c4d28ec05069", 40);
    if (istrue(level.var_29bd6759d7f2ed45)) {
        contents = physics_createcontents([0:"physicscontents_playerclip", 1:"physicscontents_glass"]);
        traceresults = namespace_2a184fc4902783dc::sphere_trace_get_all_results(targetpos, targetpos + (0, 0, 10), radius, undefined, contents, 1);
    } else {
        contents = namespace_2a184fc4902783dc::function_2d88cb1f022d0989();
        traceresults = namespace_2a184fc4902783dc::sphere_trace_get_all_results(targetpos, targetpos + (0, 0, 10), radius, level.players, contents, 1);
    }
    foreach (trace in traceresults) {
        if (isdefined(trace["surfaceflags"])) {
            var_8a9f2060af8afa5f = 19;
            var_536e00a23d2de14f = 0;
            var_536e00a23d2de14f = var_536e00a23d2de14f | trace["surfaceflags"] == 8;
            var_536e00a23d2de14f = var_536e00a23d2de14f | trace["surfaceflags"] == 2048;
            var_536e00a23d2de14f = var_536e00a23d2de14f | trace["surfaceflags"] == 9 << var_8a9f2060af8afa5f;
            var_536e00a23d2de14f = var_536e00a23d2de14f | trace["surfaceflags"] == 39 << var_8a9f2060af8afa5f;
            if (var_536e00a23d2de14f) {
                tac_cover_fire_failed(0);
                return 0;
            }
        }
    }
    foreach (door in var_44736cee8afad49b) {
        distsqrd = distancesquared(door.origin, targetpos);
        if (isdefined(var_2464edc7c410e680) && var_445ccda2fa82b65e <= distsqrd) {
            continue;
        }
        var_2464edc7c410e680 = door;
        var_445ccda2fa82b65e = distsqrd;
    }
    if (isdefined(var_2464edc7c410e680)) {
        var_1b1ff29fe94010f6 = var_2464edc7c410e680 scriptabledoorangle();
        var_cfb220142065ee31 = abs(var_1b1ff29fe94010f6) > 65;
        var_3d9512b73bdc1514 = undefined;
        foreach (otherdoor in var_44736cee8afad49b) {
            if (var_2464edc7c410e680 scriptable_door_is_double_door_pair(otherdoor)) {
                var_3d9512b73bdc1514 = otherdoor;
                break;
            }
        }
        var_560b069f3a9b36e4 = 1;
        if (isdefined(var_3d9512b73bdc1514)) {
            var_f5867c54c41d2a4d = var_3d9512b73bdc1514 scriptabledoorangle();
            var_560b069f3a9b36e4 = abs(var_f5867c54c41d2a4d) > 65;
        }
        if (var_445ccda2fa82b65e < 1600 && var_cfb220142065ee31 && var_560b069f3a9b36e4) {
            startpos = self gettagorigin("j_spinelower");
            endpos = var_2464edc7c410e680 function_d90515f5e17dbc6f() + (0, 0, 24);
            var_aa517194e54f048b = physics_raycast(startpos, endpos, contents, ignorelist, 0, "physicsquery_any", 1);
            if (isdefined(var_aa517194e54f048b) && var_aa517194e54f048b > 0) {
                var_67243b08ecf2e214 = 1;
                if (isdefined(var_2464edc7c410e680.origin)) {
                    data = function_1d1bf10a8da86b91(var_2464edc7c410e680.origin);
                    var_67243b08ecf2e214 = data[1];
                }
                tac_cover_fire_failed(var_67243b08ecf2e214);
                return 0;
            }
            var_2464edc7c410e680.isblocked = 1;
            self.taccoverrefund = undefined;
            thread tac_cover_spawn_with_door(var_2464edc7c410e680, var_3d9512b73bdc1514, issuper, contents);
            namespace_3c5a4254f2b957ea::incpersstat("deployableCoverUsed", 1);
            return 1;
        } else if (var_445ccda2fa82b65e < 6400) {
            var_67243b08ecf2e214 = 1;
            if (isdefined(var_2464edc7c410e680.origin)) {
                data = function_1d1bf10a8da86b91(var_2464edc7c410e680.origin);
                var_67243b08ecf2e214 = data[1];
            }
            tac_cover_fire_failed(var_67243b08ecf2e214);
            return 0;
        }
    }
    var_ac01a11a5f883c59 = self getplayerangles() * (0, 1, 0);
    caststart = self.origin + (0, 0, 24);
    castdir = anglestoforward(var_ac01a11a5f883c59);
    var_64b62cb5dc1e7af6 = 32 - 2.5;
    var_e2915f19f16fb5d0 = caststart + castdir * var_64b62cb5dc1e7af6;
    var_aa517194e54f048b = physics_raycast(caststart, var_e2915f19f16fb5d0, contents, ignorelist, 0, "physicsquery_closest", 1);
    if (isdefined(var_aa517194e54f048b) && var_aa517194e54f048b.size > 0) {
        tac_cover_fire_failed();
        return 0;
    }
    var_9045f282a6b253e7 = undefined;
    var_5ec2a3115e36d6 = undefined;
    caststart = var_e2915f19f16fb5d0;
    castdir = anglestoright(var_ac01a11a5f883c59);
    var_64b62cb5dc1e7af6 = 58 - 2.5;
    castend = caststart + castdir * var_64b62cb5dc1e7af6;
    var_aa517194e54f048b = physics_spherecast(caststart, castend, 2.5, contents, ignorelist, "physicsquery_closest");
    if (isdefined(var_aa517194e54f048b) && var_aa517194e54f048b.size > 0) {
        foreach (trace in var_aa517194e54f048b) {
            if (isdefined(trace["surfaceflags"])) {
                var_536e00a23d2de14f = 0;
                var_536e00a23d2de14f = var_536e00a23d2de14f | trace["surfaceflags"] == 8;
                if (var_536e00a23d2de14f) {
                    tac_cover_fire_failed(0);
                    return 0;
                }
            }
        }
        hitpos = var_aa517194e54f048b[0]["shape_position"];
        var_9045f282a6b253e7 = var_aa517194e54f048b[0]["fraction"];
    } else {
        var_9045f282a6b253e7 = 1;
    }
    caststart = var_e2915f19f16fb5d0;
    castdir = -1 * anglestoright(var_ac01a11a5f883c59);
    var_64b62cb5dc1e7af6 = 58 - 2.5;
    castend = caststart + castdir * var_64b62cb5dc1e7af6;
    var_aa517194e54f048b = physics_spherecast(caststart, castend, 2.5, contents, ignorelist, "physicsquery_closest");
    if (isdefined(var_aa517194e54f048b) && var_aa517194e54f048b.size > 0) {
        foreach (trace in var_aa517194e54f048b) {
            if (isdefined(trace["surfaceflags"])) {
                var_536e00a23d2de14f = 0;
                var_536e00a23d2de14f = var_536e00a23d2de14f | (trace["surfaceflags"] & 8) > 0;
                if (var_536e00a23d2de14f) {
                    tac_cover_fire_failed(0);
                    return 0;
                }
            }
        }
        hitpos = var_aa517194e54f048b[0]["shape_position"];
        var_5ec2a3115e36d6 = var_aa517194e54f048b[0]["fraction"];
    } else {
        var_5ec2a3115e36d6 = 1;
    }
    if (var_5ec2a3115e36d6 + var_9045f282a6b253e7 < 1) {
        tac_cover_fire_failed();
        return 0;
    } else if (var_9045f282a6b253e7 < 0.5) {
        var_e2915f19f16fb5d0 = var_e2915f19f16fb5d0 + castdir * var_64b62cb5dc1e7af6 * (0.5 - var_9045f282a6b253e7);
    } else if (var_5ec2a3115e36d6 < 0.5) {
        var_e2915f19f16fb5d0 = var_e2915f19f16fb5d0 + castdir * var_64b62cb5dc1e7af6 * (0.5 - var_5ec2a3115e36d6) * -1;
    }
    castangles = var_ac01a11a5f883c59;
    caststart = var_e2915f19f16fb5d0;
    castdir = (0, 0, -1);
    var_64b62cb5dc1e7af6 = 60;
    castend = caststart + castdir * var_64b62cb5dc1e7af6;
    var_188ecaff115cacb7 = combineangles(castangles, (0, 0, 90));
    var_aa517194e54f048b = physics_capsulecast(caststart, castend, 2.5, 16.8, var_188ecaff115cacb7, contents, ignorelist, "physicsquery_closest");
    if (!isdefined(var_aa517194e54f048b) || var_aa517194e54f048b.size <= 0) {
        tac_cover_fire_failed();
        return 0;
    }
    hitent = var_aa517194e54f048b[0]["entity"];
    if (isdefined(hitent) && !tac_cover_can_place_on(hitent)) {
        tac_cover_fire_failed();
        return 0;
    }
    var_c72145d539d8d1a1 = var_aa517194e54f048b[0]["shape_position"];
    hitpos = var_aa517194e54f048b[0]["position"];
    spawnpos = var_c72145d539d8d1a1 - (0, 0, 2.5);
    var_7a2d144a06a00b97 = tac_cover_get_stuck_to_ent(hitent);
    var_786439b54d66d5f9 = (16.8 - 2.5) * 1.75;
    var_d017352bffc438f8 = pow(var_786439b54d66d5f9 * 0.14, 2);
    var_582fcd34a655ea3f = var_c72145d539d8d1a1;
    var_30f5ea3b5bc36327 = distance2dsquared(var_582fcd34a655ea3f, hitpos);
    var_afb201304f1b9458 = var_c72145d539d8d1a1 + anglestoright(var_ac01a11a5f883c59) * (16.8 - 2.5) * 1.75;
    var_a104b4b86ea439f6 = distance2dsquared(var_afb201304f1b9458, hitpos);
    var_1e49d3ac619ddaa7 = var_c72145d539d8d1a1 + anglestoright(var_ac01a11a5f883c59) * (16.8 - 2.5) * 1.75 * -1;
    var_265e28da43deed4f = distance2dsquared(var_1e49d3ac619ddaa7, hitpos);
    if (self function_67669bd20bc394f8(var_1e49d3ac619ddaa7, 32) || self function_67669bd20bc394f8(var_afb201304f1b9458, 32)) {
        tac_cover_fire_failed();
        return 0;
    }
    var_23b488cf8754349b = [];
    var_558aadd2c4f2af41 = 0;
    if (var_a104b4b86ea439f6 <= var_d017352bffc438f8 && var_a104b4b86ea439f6 < var_30f5ea3b5bc36327 && var_a104b4b86ea439f6 < var_265e28da43deed4f) {
        var_558aadd2c4f2af41++;
        var_23b488cf8754349b = [0:var_582fcd34a655ea3f, 1:var_1e49d3ac619ddaa7];
    } else if (var_265e28da43deed4f <= var_d017352bffc438f8 && var_265e28da43deed4f < var_30f5ea3b5bc36327 && var_265e28da43deed4f < var_a104b4b86ea439f6) {
        var_558aadd2c4f2af41++;
        var_23b488cf8754349b = [0:var_582fcd34a655ea3f, 1:var_afb201304f1b9458];
    } else if (var_30f5ea3b5bc36327 <= var_d017352bffc438f8) {
        var_558aadd2c4f2af41++;
        var_23b488cf8754349b = [0:var_1e49d3ac619ddaa7, 1:var_afb201304f1b9458];
    } else {
        var_23b488cf8754349b = [0:var_582fcd34a655ea3f, 1:var_1e49d3ac619ddaa7, 2:var_afb201304f1b9458];
    }
    castdir = (0, 0, -1);
    var_64b62cb5dc1e7af6 = 6 + 2.5;
    foreach (caststart in var_23b488cf8754349b) {
        castend = caststart + castdir * var_64b62cb5dc1e7af6;
        var_aa517194e54f048b = physics_raycast(caststart, castend, contents, ignorelist, 0, "physicsquery_all", 1);
        if (!isdefined(var_aa517194e54f048b) || var_aa517194e54f048b.size <= 0) {
            /#
                if (0) {
                    thread namespace_d028276791d9cff6::drawline(caststart, castend, 10, (1, 0, 0));
                }
            #/
        } else {
            hitent = var_aa517194e54f048b[0]["entity"];
            if (isdefined(hitent) && !tac_cover_can_place_on(hitent)) {
                tac_cover_fire_failed();
                return 0;
            }
            var_558aadd2c4f2af41++;
            if (var_558aadd2c4f2af41 >= 2) {
                break;
            }
        }
    }
    if (var_558aadd2c4f2af41 < 2) {
        tac_cover_fire_failed();
        return 0;
    }
    self.taccoverrefund = undefined;
    thread tac_cover_spawn(spawnpos, castangles, var_7a2d144a06a00b97, issuper, contents);
    namespace_3c5a4254f2b957ea::incpersstat("deployableCoverUsed", 1);
    return 1;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195c
// Size: 0x1e
function tac_cover_get_stuck_to_ent(hitent) {
    if (isdefined(hitent)) {
        if (namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(hitent)) {
            return hitent;
        }
    }
    return undefined;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1982
// Size: 0x7a
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == hitent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a04
// Size: 0x2a2
function function_1d1bf10a8da86b91(spawnpos) {
    var_ae73793772b8710a = spawnpos;
    var_140b9fa52f1f56c = 1;
    var_69a8940023827f01 = 6;
    var_db2f3eee59030225 = 0;
    foreach (var_bcafd344e6c26fb4 in level.var_f73654528e070ab4) {
        /#
            if (1) {
                duration = level.framedurationseconds * 60 * 10;
                colorred = (1, 0, 0);
                var_92f3061f37d30238 = (0, 0, 1);
                colorgreen = (0, 1, 0);
                if (istrue(var_bcafd344e6c26fb4.var_36be730ee498727c)) {
                    level thread namespace_f2ffc0540883e1ad::drawcylinder(var_bcafd344e6c26fb4.origin - var_69a8940023827f01, var_bcafd344e6c26fb4.radius, var_bcafd344e6c26fb4.height + var_69a8940023827f01, duration, colorred);
                } else {
                    level thread namespace_f2ffc0540883e1ad::drawcylinder(var_bcafd344e6c26fb4.origin - var_69a8940023827f01, var_bcafd344e6c26fb4.radius, var_bcafd344e6c26fb4.height + var_69a8940023827f01, duration, var_92f3061f37d30238);
                }
                level thread namespace_f2ffc0540883e1ad::drawsphere(var_ae73793772b8710a, 5, duration, colorgreen);
            }
        #/
        if (istrue(var_db2f3eee59030225)) {
            continue;
        }
        var_1dce2d1958040081 = distance_2d_squared(var_bcafd344e6c26fb4.origin, var_ae73793772b8710a);
        var_e11a1df9e599e505 = squared(var_bcafd344e6c26fb4.radius);
        z_min = var_bcafd344e6c26fb4.origin[2] - var_69a8940023827f01;
        z_max = z_min + var_69a8940023827f01 + ter_op(isdefined(var_bcafd344e6c26fb4.height), var_bcafd344e6c26fb4.height, 96);
        var_f66aff855fc46c7d = var_ae73793772b8710a[2] >= z_min && var_ae73793772b8710a[2] <= z_max;
        if (var_1dce2d1958040081 < var_e11a1df9e599e505 && var_f66aff855fc46c7d) {
            if (isdefined(var_bcafd344e6c26fb4.offset) && isvector(var_bcafd344e6c26fb4.offset)) {
                var_ae73793772b8710a = var_ae73793772b8710a + var_bcafd344e6c26fb4.offset;
                var_db2f3eee59030225 = 1;
            } else {
                var_ae73793772b8710a = var_ae73793772b8710a + (0, 0, -6);
                var_db2f3eee59030225 = 1;
            }
            if (istrue(var_bcafd344e6c26fb4.var_36be730ee498727c)) {
                var_140b9fa52f1f56c = 0;
            }
        }
    }
    return [0:var_ae73793772b8710a, 1:var_140b9fa52f1f56c];
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cae
// Size: 0x186
function tac_cover_adjust_for_player_space(spawnpos, spawnangles, contents, var_140b9fa52f1f56c) {
    var_ae73793772b8710a = spawnpos;
    var_140b9fa52f1f56c = 1;
    var_db2f3eee59030225 = 0;
    if (0) {
        foreach (trigger in level.taccovertriggerblockers) {
            if (istrue(var_db2f3eee59030225)) {
                continue;
            }
            if (ispointinvolume(var_ae73793772b8710a + (0, 0, 20), trigger)) {
                var_ae73793772b8710a = var_ae73793772b8710a + (0, 0, -6);
                var_db2f3eee59030225 = 1;
                break;
            }
        }
    }
    if (1) {
        var_e62b2bee781878ab = function_1d1bf10a8da86b91(var_ae73793772b8710a);
        var_ae73793772b8710a = var_e62b2bee781878ab[0];
        var_140b9fa52f1f56c = var_e62b2bee781878ab[1];
    }
    var_6b9a738317c3ecb2 = tac_cover_get_free_space(1, var_ae73793772b8710a, spawnangles, contents, 32);
    if (!isdefined(var_6b9a738317c3ecb2)) {
        return [0:var_ae73793772b8710a, 1:var_140b9fa52f1f56c];
    }
    backspace = tac_cover_get_free_space(0, var_ae73793772b8710a, spawnangles, contents, 32);
    if (!isdefined(backspace)) {
        return [0:var_ae73793772b8710a, 1:var_140b9fa52f1f56c];
    }
    var_9b7c59cbac03bd88 = min(var_6b9a738317c3ecb2, 15);
    forwarddir = anglestoforward(spawnangles);
    var_ae73793772b8710a = var_ae73793772b8710a + forwarddir * var_9b7c59cbac03bd88;
    return [0:var_ae73793772b8710a, 1:var_140b9fa52f1f56c];
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3c
// Size: 0x26c
function tac_cover_get_free_space(var_187be19db6529474, spawnpos, spawnangles, contents, maxcheckdist) {
    leftdir = anglestoleft(spawnangles);
    forwarddir = anglestoforward(spawnangles);
    var_231854ea5561ecd7 = -1 * forwarddir;
    endoffset = undefined;
    if (var_187be19db6529474) {
        endoffset = forwarddir * maxcheckdist;
    } else {
        endoffset = var_231854ea5561ecd7 * maxcheckdist;
    }
    var_9e9e3e27c514ccd = spawnpos + (0, 0, 48);
    start = var_9e9e3e27c514ccd;
    end = var_9e9e3e27c514ccd + endoffset;
    radius = 2.5;
    halfheight = 29 + maxcheckdist;
    angles = combineangles(spawnangles, (0, 0, 90));
    contents = contents;
    ignorelist = [0:self];
    collectiontype = "physicsquery_closest";
    results = physics_capsulecast(start, end, radius, halfheight, angles, contents, ignorelist, collectiontype);
    var_103240d8e96f1f76 = results.size == 0;
    /#
        if (getdvarint(@"hash_a5a0ca488a1da730", 0)) {
            var_325f0f83a3d153f3 = var_103240d8e96f1f76 || results[0]["destroyStart"] > 0;
            var_21b67bf7d9747898 = ter_op(var_325f0f83a3d153f3, (0, 1, 0), (1, 0, 0));
            var_6971947357d735e9 = ter_op(var_103240d8e96f1f76, (0, 1, 0), (1, 0, 0));
            var_ac29f555306915d5 = var_9e9e3e27c514ccd + leftdir * (29 + maxcheckdist);
            var_2c4582b663a29c15 = var_ac29f555306915d5;
            var_3c2a3db598fba96c = var_ac29f555306915d5 + endoffset;
            draw_capsule(var_2c4582b663a29c15, radius, halfheight * 2, angles, var_21b67bf7d9747898, 0, 500);
            draw_capsule(var_3c2a3db598fba96c, radius, halfheight * 2, angles, var_6971947357d735e9, 0, 500);
        }
    #/
    if (var_103240d8e96f1f76) {
        return undefined;
    }
    var_a93f5739c1eb2f78 = results[0]["shape_position"];
    dist = distance(var_a93f5739c1eb2f78, var_9e9e3e27c514ccd);
    return dist;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b0
// Size: 0x96
function tac_cover_blocked_by_turret(targetpos) {
    if (isdefined(level.turrets)) {
        foreach (turret in level.turrets) {
            if (!isdefined(turret)) {
                continue;
            }
            distsqrd = distancesquared(turret.origin, targetpos);
            if (6400 >= distsqrd) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214e
// Size: 0x65
function tac_cover_fire_failed(var_e2780b690518ae5b) {
    var_67243b08ecf2e214 = ter_op(istrue(var_e2780b690518ae5b), "MP/TAC_COVER_PLACE_IN_DOORWAY", "MP/TAC_COVER_CANNOT_PLACE");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]](var_67243b08ecf2e214);
    }
    self playsoundtoplayer("iw9_deployable_cover_plant_fail", self);
    function_dba0e6107f51d41e();
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ba
// Size: 0x27
function function_dba0e6107f51d41e() {
    if (namespace_1a507865f681850e::hasequipment("equip_tac_cover")) {
        namespace_1a507865f681850e::incrementequipmentammo("equip_tac_cover", 1);
        thread function_cd0c066b3516bcb0();
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e8
// Size: 0x44
function function_cd0c066b3516bcb0() {
    self endon("death_or_disconnect");
    self notify("refreshed_tac_cover_ammo");
    self endon("refreshed_tac_cover_ammo");
    level endon("game_ended");
    self waittill("tac_cover_finalized_spawn");
    if (namespace_1a507865f681850e::hasequipment("equip_tac_cover")) {
        namespace_1a507865f681850e::decrementequipmentammo("equip_tac_cover", 1);
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2233
// Size: 0xc
function tac_cover_entmanagerdelete() {
    thread tac_cover_delete(0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2246
// Size: 0x189
function tac_cover_spawn_with_door(door, var_3d9512b73bdc1514, issuper, contents) {
    self endon("death_or_disconnect");
    self endon("tac_cover_taken");
    level endon("game_ended");
    /#
        assert(isdefined(door), "Must pass in a door entity");
    #/
    playerforward = anglestoforward(self.angles);
    var_71ed5ba14eaae576 = door function_bacd2d0acdf8559e() + (0, 90, 0);
    var_807cd8789b963df2 = anglestoforward(var_71ed5ba14eaae576);
    var_5ac08dec36d1218b = vectordot(playerforward, var_807cd8789b963df2);
    var_8c12e1b74cf59060 = var_5ac08dec36d1218b > 0;
    var_1b1ff29fe94010f6 = door scriptabledoorangle();
    door val::set("tac_cover_door", "door_frozen", 1);
    if (isdefined(var_3d9512b73bdc1514)) {
        var_3d9512b73bdc1514 val::set("tac_cover_door", "door_frozen", 1);
    }
    offsetangles = ter_op(var_8c12e1b74cf59060, (0, 90, 0), (0, -90, 0));
    offsetpos = (0, 0, -1);
    doorpos = door function_d90515f5e17dbc6f() + offsetpos;
    var_306d8b5b030998e9 = combineangles(door function_bacd2d0acdf8559e(), offsetangles);
    var_7422d61f3592ac6e = undefined;
    tac_cover_spawn(doorpos, var_306d8b5b030998e9, var_7422d61f3592ac6e, issuper, contents, door, var_3d9512b73bdc1514);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d6
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f3
// Size: 0x4cb
function tac_cover_spawn(position, angles, stuckto, issuper, contents, door, var_3d9512b73bdc1514) {
    self endon("death_or_disconnect");
    self endon("tac_cover_taken");
    level endon("game_ended");
    wait(0.05);
    var_68d446c128de07c = tac_cover_adjust_for_player_space(position, angles, contents);
    issuper = istrue(issuper);
    if (!istrue(var_68d446c128de07c[1])) {
        tac_cover_fire_failed(0);
        if (issuper) {
            namespace_85d036cb78063c4a::refundsuper();
        }
        return 0;
    }
    position = var_68d446c128de07c[0];
    self notify("tac_cover_spawned");
    cover = spawn("script_model", position);
    cover.angles = angles;
    cover.owner = self;
    cover.team = self.team;
    cover.slot = namespace_1a507865f681850e::findequipmentslot("equip_tac_cover");
    cover.exploding = 1;
    cover.issuper = ter_op(issuper, 1, undefined);
    cover.superid = level.superglobals.staticsuperdata["super_tac_cover"].id;
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = cover [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            tac_cover_fire_failed();
            cover delete();
            if (issuper) {
                namespace_85d036cb78063c4a::refundsuper();
            }
            return 0;
        }
    }
    cover namespace_2a9588dfac284b77::registerspawn(2, &tac_cover_entmanagerdelete);
    var_19163e14365d9264 = undefined;
    var_19c643069b108770 = undefined;
    model_name = undefined;
    if (utility::issharedfuncdefined("player", "getCurrentSuper")) {
        var_19163e14365d9264 = self [[ utility::getsharedfunc("player", "getCurrentSuper") ]]();
        var_19c643069b108770 = var_19163e14365d9264.staticdata.bundle;
    }
    if (isdefined(var_19c643069b108770) && level.allowsupers) {
        model_name = function_9bd2d235e27d5068(var_19c643069b108770, var_19163e14365d9264.blueprintindex);
    }
    if (!isdefined(model_name)) {
        model_name = "projectile_deployable_cover_opened_v0";
    }
    cover setentityowner(self);
    cover setotherent(self);
    cover setmodel(model_name);
    cover setscriptablepartstate("allowPing", "on", 0);
    if (isdefined(stuckto)) {
        cover.moving_platform = stuckto;
        data = spawnstruct();
        data.linkparent = cover.moving_platform;
        data.deathoverridecallback = &tac_cover_on_destroyed_by_mover;
        data.validateaccuratetouching = 1;
        cover thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
        cover thread tac_cover_destroy_on_unstuck();
    } else if (isdefined(level.wztrain_info)) {
        data = spawnstruct();
        data.deathoverridecallback = &tac_cover_on_destroyed_by_mover;
        cover thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    }
    collision = tac_cover_spawn_collision(cover);
    cover validatecollision(collision, level.taccovercollision);
    cover.collision = collision;
    collision.cover = cover;
    collision.moverdoesnotkill = 1;
    if (isdefined(door)) {
        if (isdefined(door.blockingcover)) {
            door.blockingcover tac_cover_destroy();
        }
        cover.blockeddoor = door;
        door.blockingcover = cover;
    }
    if (isdefined(var_3d9512b73bdc1514)) {
        cover.blockeddoubledoor = var_3d9512b73bdc1514;
        var_3d9512b73bdc1514.blockingcover = cover;
    }
    namespace_3bbb5a98b932c46f::onequipmentplanted(cover, "equip_tac_cover", &tac_cover_destroy);
    thread namespace_3bbb5a98b932c46f::monitordisownedequipment(self, cover);
    if (issuper) {
        cover thread tac_cover_destroy_on_disowned(self);
        cover thread tac_cover_destroy_on_timeout();
        cover thread function_f6464070871bdd33(self);
    }
    cover function_49197cd063a740ea(&tac_cover_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_a465aa01fa0187d8(cover);
        }
    }
    cover thread tac_cover_destroy_on_game_end();
    thread tac_cover_spawn_internal(cover);
    thread outlineequipmentforowner(cover);
    cover thread namespace_90b872e9b61df82b::runequipmentping();
    namespace_aad14af462a74d08::function_d997435895422ecc("super_deployed_decoy", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    self notify("tac_cover_finalized_spawn");
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c5
// Size: 0xa3
function tac_cover_spawn_internal(cover) {
    cover endon("death");
    if (0) {
        cover tac_cover_set_can_damage(1);
    }
    if (isdefined(cover.blockeddoor)) {
        cover setscriptablepartstate("effects", "plantStartDoor", 0);
    } else {
        cover setscriptablepartstate("effects", "plantStart", 0);
    }
    wait(tac_cover_get_deploy_anim_dur());
    if (-1) {
        cover tac_cover_set_can_damage(1);
    }
    if (isdefined(cover.blockeddoor)) {
        cover setscriptablepartstate("effects", "plantEndDoor", 0);
    } else {
        cover setscriptablepartstate("effects", "plantEnd", 0);
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296f
// Size: 0xfb
function tac_cover_spawn_collision(cover) {
    if (!isdefined(level.taccovercollision)) {
        return;
    }
    collision = spawn("script_model", cover.origin);
    collision dontinterpolate();
    collision.angles = cover.angles;
    collision clonebrushmodeltoscriptmodel(level.taccovercollision);
    collision linkto(cover);
    collision setentityowner(cover);
    collision disconnectpaths();
    var_6fd5fd4a27bdf9a3 = anglestoforward(cover.angles);
    var_25e38c6ed49771e3 = cover.origin + var_6fd5fd4a27bdf9a3 * 25;
    var_25e38d6ed4977416 = cover.origin + var_6fd5fd4a27bdf9a3 * -25;
    createnavlink("tacCover1", var_25e38c6ed49771e3, var_25e38d6ed4977416, "traverse_warp_across", 1920);
    createnavlink("tacCover2", var_25e38d6ed4977416, var_25e38c6ed49771e3, "traverse_warp_across", 1920);
    return collision;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a72
// Size: 0xf7
function tac_cover_destroy(immediate, var_4fac8b8ce36e09f1, var_70f6e994a59a36a8) {
    if (!isdefined(var_70f6e994a59a36a8)) {
        var_70f6e994a59a36a8 = 0;
    }
    var_cbf7be4f62a0ddb2 = 0;
    if (!istrue(immediate)) {
        var_cbf7be4f62a0ddb2 = 0.2 + tac_cover_get_destroy_anim_dur();
    }
    dmg = self.maxhealth;
    if (isdefined(self.damagetaken) && self.damagetaken < self.maxhealth) {
        dmg = self.damagetaken;
    }
    if (!isdefined(dmg)) {
        dmg = 1250;
    }
    self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_deployed_decoy", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), int(dmg));
    namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, int(dmg), istrue(var_4fac8b8ce36e09f1));
    thread tac_cover_destroy_internal(var_cbf7be4f62a0ddb2, var_70f6e994a59a36a8);
    thread tac_cover_delete(var_cbf7be4f62a0ddb2);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b70
// Size: 0x12d
function tac_cover_destroy_internal(var_cbf7be4f62a0ddb2, var_70f6e994a59a36a8) {
    if (!isdefined(var_70f6e994a59a36a8)) {
        var_70f6e994a59a36a8 = 0;
    }
    if (isdefined(self.blockeddoor)) {
        self.blockeddoor val::function_c9d0b43701bdba00("tac_cover_door");
        self.blockeddoor.blockingcover = undefined;
    }
    if (isdefined(self.blockeddoubledoor)) {
        self.blockeddoubledoor val::function_c9d0b43701bdba00("tac_cover_door");
        self.blockeddoubledoor.blockingcover = undefined;
    }
    if (var_cbf7be4f62a0ddb2 > 0) {
        if (istrue(var_70f6e994a59a36a8 >= 1)) {
            if (var_70f6e994a59a36a8 == 1) {
                self setscriptablepartstate("effects", "destroyStartExplosive");
            } else {
                self setscriptablepartstate("effects", "destroyStartExplosiveBehind");
            }
        } else {
            self setscriptablepartstate("effects", "destroyStart");
        }
        wait(tac_cover_get_destroy_anim_dur());
        self setscriptablepartstate("effects", "destroyEnd");
    }
    if (isdefined(self.collision)) {
        self.collision connectpaths();
        self.collision delete();
    }
    destroynavlink("tacCover1");
    destroynavlink("tacCover2");
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca4
// Size: 0xa6
function tac_cover_delete(var_cbf7be4f62a0ddb2) {
    if (istrue(self.isdestroyed)) {
        return;
    }
    self.isdestroyed = 1;
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    owner = self.owner;
    if (isdefined(owner)) {
        owner namespace_3bbb5a98b932c46f::removeequip(self);
    }
    if (1) {
        namespace_3e725f3cc58bddd3::monitordamageend();
        self thermaldrawdisable();
    }
    if (isdefined(self.collision)) {
        self.collision connectpaths();
        self.collision delete();
    }
    wait(var_cbf7be4f62a0ddb2);
    self delete();
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d51
// Size: 0x1e
function tac_cover_destroy_on_timeout() {
    self endon("death");
    wait(level.taccover_timeout);
    tac_cover_destroy(undefined, 0, 0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d76
// Size: 0x1c
function tac_cover_destroy_on_game_end() {
    self endon("death");
    level waittill("game_ended");
    tac_cover_destroy(undefined, 0, 0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d99
// Size: 0x22
function tac_cover_destroy_on_unstuck() {
    self endon("death");
    while (isdefined(self getlinkedparent())) {
        waitframe();
    }
    tac_cover_destroy(undefined, 0, 0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc2
// Size: 0x80
function tac_cover_set_can_damage(bool) {
    if (1) {
        if (bool) {
            var_307667d0142f2035 = _hasperk("specialty_rugged_eqp");
            maxhealth = ter_op(var_307667d0142f2035, 1250, 1000);
            damagefeedback = "hitequip";
            thread namespace_3e725f3cc58bddd3::monitordamage(maxhealth, damagefeedback, &tac_cover_handle_fatal_damage, &tac_cover_handle_damage, 0);
            self thermaldrawenable();
        } else {
            namespace_3e725f3cc58bddd3::monitordamageend();
            self thermaldrawdisable();
        }
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e49
// Size: 0x10c
function tac_cover_handle_damage(data) {
    damage = tac_cover_adjust_damage(data);
    if (isdefined(self.owner)) {
        remaininghealth = max(self.maxhealth - self.damagetaken, 0);
        var_c738e38fa087114b = int(min(remaininghealth, damage));
        self.owner namespace_85d036cb78063c4a::combatrecordsupermisc("super_tac_cover", var_c738e38fa087114b);
        var_2c06f76b1150ee6c = istrue(level.var_f3be3f9bad33bf87) && istrue(self.var_135e1c9614ac0dd0);
        if (data.attacker != self.owner && data.attacker.team != self.owner.team && !var_2c06f76b1150ee6c) {
            self.var_135e1c9614ac0dd0 = 1;
            self.owner namespace_a850435086c88de3::doonactionscoreevent(1, "tacCoverShot");
        }
    }
    return damage;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5d
// Size: 0x205
function tac_cover_adjust_damage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    damage = data.damage;
    pos = data.point;
    if (objweapon.basename == "thermite_av_mp") {
        return 200;
    }
    if (namespace_3e725f3cc58bddd3::issmallsplashdamage(data.objweapon)) {
        return 0;
    }
    if (objweapon.basename == "thermite_bolt_mp") {
        return 83.3333;
    }
    if (objweapon.basename == "thermite_xmike109_mp") {
        return 62.5;
    }
    if (isthrowingknife(objweapon.basename) || function_160a992c78bdf589(objweapon.basename)) {
        return 0;
    }
    if (meansofdeath == "MOD_MELEE" || meansofdeath == "MOD_IMPACT") {
        if (meansofdeath == "MOD_IMPACT" && objweapon.classname == "grenade") {
            return damage;
        }
        return 333.333;
    }
    if (objweapon.basename == "iw9_dm_crossbow_mp" && meansofdeath != "MOD_MELEE") {
        return 0;
    }
    if (meansofdeath == "MOD_CRUSH" && isdefined(data.inflictor) && data.inflictor.classname == "script_vehicle") {
        if (isdefined(attacker) && !namespace_3bbb5a98b932c46f::friendlyfirecheck(self.owner, attacker)) {
            return damage;
        }
    }
    if (isexplosivedamagemod(data.meansofdeath)) {
        if (objweapon.basename == "semtex_xmike109_mp") {
            return 333.333;
        }
        return 700;
    }
    damage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, meansofdeath, damage, attacker);
    damage = namespace_3e725f3cc58bddd3::handleshotgundamage(objweapon, meansofdeath, damage);
    return damage;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316a
// Size: 0x105
function tac_cover_handle_fatal_damage(data) {
    attacker = data.attacker;
    var_70f6e994a59a36a8 = 0;
    if (istrue(data.meansofdeath == "MOD_EXPLOSIVE")) {
        var_70f6e994a59a36a8 = 1;
        var_7c5c3c06d620979 = anglestoforward(self.angles);
        var_7c5c3c06d620979 = vectornormalize(var_7c5c3c06d620979);
        var_6e86a25a741e3a50 = vectortoangles(self.origin - data.point);
        var_6e86a25a741e3a50 = anglestoforward(var_6e86a25a741e3a50);
        var_6e86a25a741e3a50 = vectornormalize(var_6e86a25a741e3a50);
        var_eb513a01b5c89a61 = vectordot(var_7c5c3c06d620979, var_6e86a25a741e3a50);
        if (var_eb513a01b5c89a61 >= 0) {
            var_70f6e994a59a36a8 = 2;
        }
    }
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::onfieldupgradedestroy(#"hash_1dadef4eb4500029");
    }
    thread tac_cover_destroy(undefined, 1, var_70f6e994a59a36a8);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3276
// Size: 0x85
function tac_cover_deploy_freeze_controls() {
    if (!isdefined(self.taccoverfrozecontrols)) {
        slot = namespace_1a507865f681850e::findequipmentslot("equip_tac_cover");
        if (slot == "primary") {
            val::set("tac_cover_deploy", "equipment_primary", 0);
        } else {
            val::set("tac_cover_deploy", "equipment_secondary", 0);
        }
        val::set("tac_cover_deploy", "usability", 0);
        val::set("tac_cover_deploy", "gesture", 0);
        self.taccoverfrozecontrols = slot;
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3302
// Size: 0x3a
function tac_cover_deploy_unfreeze_controls() {
    if (isdefined(self.taccoverfrozecontrols)) {
        slot = self.taccoverfrozecontrols;
        val::function_c9d0b43701bdba00("tac_cover_deploy");
        self.taccoverfrozecontrols = undefined;
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3343
// Size: 0x16d
function tac_cover_ignore_list(player) {
    ignorelist = [0:player];
    namespace_36f464722d326bbe::function_9ed62e98a39d59eb();
    foreach (array in level.var_e7e46e0e18411a5b function_df633f460888a47(player.origin)) {
        foreach (projectile in array) {
            if (!isdefined(projectile)) {
                continue;
            }
            isowner = isdefined(projectile.owner) && projectile.owner == player;
            var_79d78c01b023b7f2 = isdefined(projectile.equipmentref) && projectile.equipmentref == "equip_tac_cover";
            var_873e2074c47e6314 = isdefined(projectile.equipmentref) && projectile.equipmentref == "equip_ammo_box";
            if (!isowner && (var_79d78c01b023b7f2 || var_873e2074c47e6314)) {
                continue;
            }
            ignorelist[ignorelist.size] = projectile;
        }
    }
    return ignorelist;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b8
// Size: 0xab
function tac_cover_can_place_on(ent) {
    if (isplayer(ent)) {
        return 0;
    }
    if (ent getnonstick()) {
        return 0;
    }
    if (istrue(ent.mountmantlemodel)) {
        return 0;
    }
    if (isdefined(ent.cover) && isdefined(ent.cover.equipmentref) && ent.cover.equipmentref == "equip_tac_cover") {
        return 0;
    }
    if (ent.classname == "misc_turret") {
        return 0;
    }
    if (ent.classname == "script_vehicle") {
        return 0;
    }
    return 1;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356b
// Size: 0x11
function tac_cover_get_deploy_anim_dur() {
    return getanimlength(scriptables%wm_spawn_2h_deployable_cover_fire);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3584
// Size: 0x4
function tac_cover_get_destroy_anim_dur() {
    return 0;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3590
// Size: 0xe
function tac_cover_on_fired_super() {
    return tac_cover_on_fired(undefined, undefined, undefined, 1);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a6
// Size: 0xe
function tac_cover_on_take_super() {
    tac_cover_on_take(undefined, undefined, 1);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35bb
// Size: 0x37
function tac_cover_destroy_on_disowned(owner) {
    self endon("death");
    owner endon("tac_cover_taken");
    owner waittill_any_2("joined_team", "disconnect");
    thread tac_cover_destroy(undefined, 0, 0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f9
// Size: 0x3b
function function_f6464070871bdd33(owner) {
    self endon("death");
    owner endon("tac_cover_taken");
    owner endon("joined_team");
    owner endon("disconnect");
    owner waittill("tac_cover_spawned");
    thread tac_cover_destroy(undefined, 0, 0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363b
// Size: 0x16
function tac_cover_on_destroyed_by_mover(data) {
    tac_cover_destroy(undefined, 0, 0);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3658
// Size: 0xbf
function private function_f6491690fe2fa94e(var_8f6695fbd2cee6a3, var_f8bd30b866395824, var_89aa1dcad7a5096, var_9c691b5325da706e, var_36be730ee498727c) {
    if (!isdefined(level.var_f73654528e070ab4)) {
        level.var_f73654528e070ab4 = [];
    }
    var_4d453c5a0f78e5f3 = spawnstruct();
    var_4d453c5a0f78e5f3.targetname = "dcover_blocker_struct";
    var_4d453c5a0f78e5f3.origin = var_8f6695fbd2cee6a3;
    var_4d453c5a0f78e5f3.radius = var_f8bd30b866395824;
    var_4d453c5a0f78e5f3.height = var_89aa1dcad7a5096;
    var_4d453c5a0f78e5f3.offset = (0, 0, var_9c691b5325da706e);
    var_4d453c5a0f78e5f3.var_36be730ee498727c = var_36be730ee498727c;
    level.var_f73654528e070ab4[level.var_f73654528e070ab4.size] = var_4d453c5a0f78e5f3;
    return var_4d453c5a0f78e5f3;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x371f
// Size: 0x26
function private function_8126f259bbf1a7ed(var_8f6695fbd2cee6a3) {
    var_4d453c5a0f78e5f3 = function_f6491690fe2fa94e(var_8f6695fbd2cee6a3, 80, 96, -6, undefined);
    return var_4d453c5a0f78e5f3;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x374d
// Size: 0x26
function private function_65fde24ce2bc91e9(var_8f6695fbd2cee6a3) {
    var_4d453c5a0f78e5f3 = function_f6491690fe2fa94e(var_8f6695fbd2cee6a3, 140, 96, -6, undefined);
    return var_4d453c5a0f78e5f3;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x377b
// Size: 0xe2
function private function_b8ffeacf84a9d34e(var_5c4e2a948c4617a4) {
    /#
        assertex(isdefined(var_5c4e2a948c4617a4.targetname) && var_5c4e2a948c4617a4.targetname == "dcover_blocker_struct", "Unexpected targetname during tacCoverValidateCoverBlockerStruct()");
    #/
    /#
        assertex(isdefined(var_5c4e2a948c4617a4.origin) && isvector(var_5c4e2a948c4617a4.origin), ".origin was not defined or not a vector during tacCoverValidateCoverBlockerStruct()");
    #/
    /#
        assertex(isdefined(var_5c4e2a948c4617a4.radius) && isnumber(var_5c4e2a948c4617a4.radius), ".radius was not defined or not a number during tacCoverValidateCoverBlockerStruct()");
    #/
    /#
        assertex(isdefined(var_5c4e2a948c4617a4.height) && isnumber(var_5c4e2a948c4617a4.height), ".height was not defined or not a number during tacCoverValidateCoverBlockerStruct()");
    #/
    if (!isdefined(var_5c4e2a948c4617a4.offset)) {
        var_5c4e2a948c4617a4.offset = -6;
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3864
// Size: 0x68
function function_c5d3d6e10bd8c8ab(var_a61748234da405db, var_cae297d0690cc359) {
    switch (var_cae297d0690cc359) {
    case 0:
        function_8126f259bbf1a7ed(var_a61748234da405db);
        break;
    case 1:
        function_65fde24ce2bc91e9(var_a61748234da405db);
        break;
    default:
        /#
            assertmsg("fixupSizeInt must be 0 or 1, please see  tacCoverAddCoverBlockerStruct()");
        #/
        break;
    }
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38d3
// Size: 0x57
function function_85555e609b23b2be(var_cae297d0690cc359) {
    var_130b136c0f62b47e = undefined;
    switch (var_cae297d0690cc359) {
    case 0:
        var_130b136c0f62b47e = 80;
        break;
    case 1:
        var_130b136c0f62b47e = 140;
        break;
    default:
        break;
    }
    return var_130b136c0f62b47e;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3932
// Size: 0x6a
function function_f41f835b1ab9dbd8(var_8f6695fbd2cee6a3, var_f8bd30b866395824, var_89aa1dcad7a5096, var_9c691b5325da706e, var_36be730ee498727c) {
    /#
        assertex(isdefined(var_8f6695fbd2cee6a3), "Must supply a location when calling tacCoverAddCoverBlockerStructCustom()");
    #/
    /#
        assertex(isdefined(var_f8bd30b866395824), "Must supply a radius when calling tacCoverAddCoverBlockerStructCustom()");
    #/
    if (!isdefined(var_89aa1dcad7a5096)) {
        var_89aa1dcad7a5096 = 96;
    }
    if (!isdefined(var_9c691b5325da706e)) {
        var_9c691b5325da706e = -6;
    }
    namespace_e76aa51cbf8812ee::function_f6491690fe2fa94e(var_8f6695fbd2cee6a3, var_f8bd30b866395824, var_89aa1dcad7a5096, var_9c691b5325da706e, var_36be730ee498727c);
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a3
// Size: 0x89
function function_9461775d71e495cf(targetpos) {
    if (0 || !isdefined(level.var_b6a3186c09d2dd34)) {
        return 0;
    }
    foreach (var_351eaee3269ee1d8 in level.var_b6a3186c09d2dd34) {
        if (ispointinvolume(targetpos + (0, 0, 8), var_351eaee3269ee1d8)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a34
// Size: 0x89
function function_ac29e794c919fe03(targetpos) {
    if (0 || !isdefined(level.var_57b13482577dd10)) {
        return 0;
    }
    foreach (var_b92d911c350c9026 in level.var_57b13482577dd10) {
        if (ispointinvolume(targetpos + (0, 0, 8), var_b92d911c350c9026)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac5
// Size: 0x124
function function_6cc8838979f47b9f(targetpos) {
    if (0 || !isdefined(level.var_ca0420748e3190ed)) {
        return 0;
    }
    foreach (var_5a2cb93c3c5423e5 in level.var_ca0420748e3190ed) {
        var_c114ecfa39e69379 = squared(32);
        if (isdefined(var_5a2cb93c3c5423e5.radius)) {
            var_c114ecfa39e69379 = squared(var_5a2cb93c3c5423e5.radius);
        }
        var_f17759894781f5eb = var_5a2cb93c3c5423e5.origin[2] - 8;
        zmax = var_f17759894781f5eb + ter_op(isdefined(var_5a2cb93c3c5423e5.height), var_5a2cb93c3c5423e5.height, 96);
        var_f66aff855fc46c7d = targetpos[2] >= var_f17759894781f5eb && targetpos[2] <= zmax;
        if (distance_2d_squared(var_5a2cb93c3c5423e5.origin, targetpos) < var_c114ecfa39e69379 && var_f66aff855fc46c7d) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf1
// Size: 0x98
function function_d147e0986e29dd8d(org, rad, height) {
    if (0) {
        return 0;
    }
    if (!isdefined(level.var_ca0420748e3190ed)) {
        level.var_ca0420748e3190ed = [];
    }
    var_5a2cb93c3c5423e5 = spawnstruct();
    var_5a2cb93c3c5423e5.targetname = "dcover_invalid_struct";
    var_5a2cb93c3c5423e5.origin = org;
    var_5a2cb93c3c5423e5.radius = rad;
    var_5a2cb93c3c5423e5.height = height;
    level.var_ca0420748e3190ed[level.var_ca0420748e3190ed.size] = var_5a2cb93c3c5423e5;
    return var_5a2cb93c3c5423e5;
}

// Namespace namespace_1beeccb5964a0000/namespace_e76aa51cbf8812ee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c91
// Size: 0xe8
function function_9bd2d235e27d5068(bundle, blueprintindex) {
    var_9b32d1936831f5aa = undefined;
    model_name = undefined;
    if (isdefined(bundle.var_d96d3e6ceed581fd.blueprints) && bundle.var_d96d3e6ceed581fd.blueprints.size > 0 && blueprintindex > 0) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprints[blueprintindex - 1].genericblueprint;
        model_name = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "worldModel");
    } else if (isdefined(bundle.var_d96d3e6ceed581fd.var_85ec36a3c387a93a)) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.var_85ec36a3c387a93a;
        model_name = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "worldModel");
    }
    return model_name;
}

