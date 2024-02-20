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
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\movers.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\outline.gsc;
#using scripts\mp\utility\outline.gsc;
#using script_6d68cfdf0836123c;
#using script_74b851b7aa1ef32d;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_3a986f7390c48c70;

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x227
function snapshot_grenade_used(grenade, var_e012e0b70d7d54fa) {
    grenade thread notifyafterframeend("death", "end_explode");
    grenade endon("end_explode");
    grenade thread function_d69277b486f06d35();
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_snapshot_grenade", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    if (var_e012e0b70d7d54fa) {
        position = velocity = surfacetype = hitloc = ent = grenade waittill("missile_stuck");
    } else {
        grenade setotherent(self);
        grenade thread namespace_3e725f3cc58bddd3::monitordamage(19, "hitequip", &snapshot_grenade_handle_fatal_damage, &snapshot_grenade_handle_damage);
        namespace_5a51aa78ea0b1b9f::add_emp_ent(grenade);
        grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&snapshot_grenade_empapplied);
        if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
            grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&snapshot_grenade_empapplied);
        }
        grenade thread snapshot_grenade_watch_cleanup();
        position = grenade waittill("explode");
    }
    detectionradius = grenade.bundle.detectionradius;
    duration = grenade.bundle.var_f7b34b35e7c7d491;
    if (isdefined(grenade.weapon_object.weaponcustomsettings)) {
        if (isdefined(grenade.weapon_object.weaponcustomsettings.duration)) {
            duration = grenade.weapon_object.weaponcustomsettings.duration;
        }
        if (isdefined(grenade.weapon_object.weaponcustomsettings.radius)) {
            detectionradius = grenade.weapon_object.weaponcustomsettings.radius;
        }
    }
    thread snapshot_grenade_watch_flight(position, grenade.var_37d6f0688aeef75d, detectionradius, duration, grenade.bundle);
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x67d
// Size: 0x54
function private function_d69277b486f06d35() {
    self endon("death");
    self.owner endon("disconnect");
    self endon("missile_stuck");
    var_71c76f81eb0c95ee = var_53f81081d4e7f40b = var_850fdf3fb1c7eb84 = self waittill("missile_water_impact");
    self.var_37d6f0688aeef75d = 1;
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d8
// Size: 0x108
function snapshot_get_flight_dest(position, direction, ignorelist) {
    direction = (0, 0, 1);
    caststart = position + direction;
    castend = caststart + direction * 137;
    contents = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_missileclip"]);
    var_aa517194e54f048b = physics_raycast(caststart, castend, contents, ignorelist, 0, "physicsquery_closest", 1);
    if (isdefined(var_aa517194e54f048b) && var_aa517194e54f048b.size > 0) {
        castend = var_aa517194e54f048b[0]["position"];
        if (-1) {
            var_64b62cb5dc1e7af6 = vectordot(castend - caststart, direction);
            if (var_64b62cb5dc1e7af6 > 0) {
                if (var_64b62cb5dc1e7af6 >= 50) {
                    var_64b62cb5dc1e7af6 = min(var_64b62cb5dc1e7af6 - 25, 112);
                } else {
                    var_64b62cb5dc1e7af6 = var_64b62cb5dc1e7af6 / 2;
                }
                castend = caststart + direction * var_64b62cb5dc1e7af6;
            }
        }
    } else {
        castend = caststart + direction * 112;
    }
    return castend;
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e8
// Size: 0x5c
function entity_movingplatform_update() {
    self endon("death");
    self.velocity = (0, 0, 0);
    while (1) {
        old_origin = self.origin;
        wait(0.05);
        self.velocity = 20 * (self.origin - old_origin);
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84b
// Size: 0x492
function snapshot_grenade_watch_flight(position, var_800ee321b0d045e5, radius, duration, bundle) {
    grenade = _launchgrenade("snapshot_grenade_mp", position, (0, 0, 0), 100, 1);
    grenade namespace_2a9588dfac284b77::registerspawn(3, &snapshot_grenade_delete);
    grenade setotherent(self);
    grenade setscriptablepartstate("beacon", "active", 0);
    grenade setscriptablepartstate("anims", "deploy", 0);
    grenade missilehidetrail();
    grenade.equipmentref = "equip_snapshot_grenade";
    grenade.owner = self;
    grenade thread namespace_3e725f3cc58bddd3::monitordamage(19, "hitequip", &snapshot_grenade_handle_fatal_damage, &snapshot_grenade_handle_damage);
    namespace_5a51aa78ea0b1b9f::add_emp_ent(grenade);
    grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&snapshot_grenade_empapplied);
    grenade thread snapshot_grenade_watch_cleanup();
    grenade endon("death");
    var_b9e1097fae6546e7 = _launchgrenade("snapshot_grenade_danger_mp", grenade.origin, (0, 0, 0), 100, 1);
    var_b9e1097fae6546e7.weapon_name = "snapshot_grenade_danger_mp";
    var_b9e1097fae6546e7 linkto(grenade);
    if (isplayer(self)) {
        var_b9e1097fae6546e7 hidefromplayer(self);
    }
    grenade thread snapshot_grenade_cleanup_danger_icon(var_b9e1097fae6546e7);
    data = spawnstruct();
    data.skipdeath = 1;
    grenade thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    mover = spawn("script_model", grenade.origin);
    mover.angles = grenade.angles;
    mover setmodel("tag_origin");
    grenade linkto(mover, "tag_origin", (0, 0, 0), (0, 0, 0));
    grenade thread snapshot_grenade_cleanup_mover(mover);
    waitframe();
    var_38c153d3f115993e = undefined;
    if (istrue(grenade.touchedmovingplatform)) {
        grenade thread entity_movingplatform_update();
    }
    var_12df9a7dead190e8 = (0, 0, 1);
    destpos = snapshot_get_flight_dest(position, var_12df9a7dead190e8, [0:grenade, 1:var_b9e1097fae6546e7]);
    var_535664eb6ae73d1d = vectordot(destpos - position, var_12df9a7dead190e8);
    var_24d8b9b1475996e5 = (0, 0, 0);
    if (var_535664eb6ae73d1d > 0) {
        var_6d5431d1a1159a70 = var_535664eb6ae73d1d / 112;
        var_4f727e6fce686050 = 0.65 * var_6d5431d1a1159a70;
        var_d9936f1afe54db08 = var_4f727e6fce686050 * 0.19;
        var_baa9727310cc90c1 = var_4f727e6fce686050 * 0.6;
        var_b229534034874cef = 0.3 * var_6d5431d1a1159a70;
        var_ca262de1cd84def1 = var_4f727e6fce686050 * 0;
        var_b34668c30f214b1c = var_4f727e6fce686050 * 0.35;
        mover rotateto(var_24d8b9b1475996e5, var_b229534034874cef, var_ca262de1cd84def1, var_b34668c30f214b1c);
        if (isdefined(grenade.lastmovingplatform)) {
            var_38c153d3f115993e = namespace_9db09f982acd35b4::is_moving_platform_train(grenade.lastmovingplatform);
            if (var_38c153d3f115993e) {
                mover linkto(grenade.lastmovingplatform);
            }
        }
        wait(0.3);
        if (istrue(var_38c153d3f115993e)) {
            mover unlink();
            destpos = destpos + grenade.velocity * var_4f727e6fce686050;
        }
        if (istrue(var_800ee321b0d045e5)) {
            grenade setscriptablepartstate("water", "active", 0);
        } else {
            grenade setscriptablepartstate("dust", "active", 0);
        }
        grenade setscriptablepartstate("anims", "idle", 0);
        mover moveto(destpos, var_4f727e6fce686050, var_d9936f1afe54db08, var_baa9727310cc90c1);
        grenade childthread namespace_ff64cf6a607bc089::watch_flight_collision();
        grenade waittill_any_timeout_1(var_4f727e6fce686050, "collision_with_platform");
    } else {
        mover.angles = var_24d8b9b1475996e5;
        wait(0.3);
    }
    if (istrue(var_38c153d3f115993e)) {
        mover linkto(grenade.lastmovingplatform);
    }
    var_ad9018138d388d77 = 0;
    wait(var_ad9018138d388d77);
    grenade setscriptablepartstate("detect", "active", 0);
    grenade setscriptablepartstate("anims", "idle", 0);
    grenade setscriptablepartstate("beacon", "neutral", 0);
    wait(0.5);
    grenade snapshot_grenade_detect(radius, duration, bundle);
    grenade thread snapshot_grenade_destroy();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce4
// Size: 0x24a
function snapshot_grenade_detect(radius, duration, bundle) {
    owner = self.owner;
    if (!isdefined(owner)) {
        return;
    }
    position = self.origin;
    angles = self.angles;
    var_7aa1ff687cfc30d1 = snapshot_grenade_createoutlinedata(owner, position, bundle);
    function_daf6c5596bb31dff("decoy_grenade", self.owner, self.origin, 512);
    var_ac93bf0580bb0a75 = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_item", 4:"physicscontents_vehicle"]);
    detectionradius = ter_op(isdefined(radius), radius, bundle.detectionradius);
    playertargets = utility::function_2d7fd59d039fa69b(position, detectionradius);
    foreach (player in playertargets) {
        if (!isreallyalive(player)) {
            continue;
        }
        if (!istrue(namespace_f8065cafc523dba5::playersareenemies(owner, player, 1))) {
            continue;
        }
        if (istrue(bundle.var_7f7cf0326d40dd06)) {
            caststart = position;
            castend = player geteye();
            var_aa517194e54f048b = physics_raycast(caststart, castend, var_ac93bf0580bb0a75, undefined, 0, "physicsquery_closest", 1);
            jumpiffalse(isdefined(var_aa517194e54f048b) && var_aa517194e54f048b.size > 0) LOC_000001b5;
        } else {
        LOC_000001b5:
            namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_snapshot_grenade", owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
            namespace_8361bad7391de074::function_5d2504919b717097(owner, player);
            snapshot_grenade_applysnapshot(player, owner, var_7aa1ff687cfc30d1, duration, undefined, undefined, bundle);
        }
    }
    if (istrue(bundle.var_20f9839ce512a5e) && isplayer(owner) && !istrue(owner.var_65219c911f198c95)) {
        triggerportableradarping(position, owner, detectionradius, 500, "specialty_snapshot_immunity");
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf35
// Size: 0x94
function snapshot_grenade_createoutlinedata(owner, position, bundle) {
    var_7aa1ff687cfc30d1 = undefined;
    if (isdefined(bundle) && istrue(bundle.var_b722e45993eccb2a)) {
        var_7aa1ff687cfc30d1 = spawnstruct();
        var_7aa1ff687cfc30d1.owner = owner;
        var_7aa1ff687cfc30d1.position = position;
        var_7aa1ff687cfc30d1.isalive = 1;
        var_7aa1ff687cfc30d1.targets = [];
        var_7aa1ff687cfc30d1.endtimes = [];
        var_7aa1ff687cfc30d1.outlineids = [];
    }
    return var_7aa1ff687cfc30d1;
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd1
// Size: 0x416
function snapshot_grenade_applysnapshot(victim, attacker, var_7aa1ff687cfc30d1, duration, var_3a0fd085ff7fb126, var_e92f3941bb8721d5, bundle) {
    if (!isdefined(var_3a0fd085ff7fb126)) {
        var_3a0fd085ff7fb126 = 0;
    }
    if (!isdefined(duration)) {
        duration = bundle.var_f7b34b35e7c7d491;
    }
    if (victim namespace_82dcd1d5ae30ff7::_hasperk("specialty_snapshot_immunity")) {
        attacker updatedamagefeedback("hittacresist");
        victim namespace_b6a8027f477010e1::activatePerk("specialty_tac_resist");
        return;
    }
    if (victim ent_flag("snapshot_immunity")) {
        return;
    }
    attacker updatedamagefeedback("");
    if (istrue(bundle.var_b722e45993eccb2a)) {
        entnum = victim getentitynumber();
        var_7aa1ff687cfc30d1.targets[entnum] = victim;
        var_7aa1ff687cfc30d1.endtimes[entnum] = gettime() + duration;
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            victim namespace_b903a23a81915f18::hudoutline_add_channel_internal("equipment", 3, bundle.var_4430b08d5a2d47bf);
        }
        if (!isagent(attacker)) {
            if (issharedfuncdefined("snapshot", "override_show_to", 0)) {
                var_7aa1ff687cfc30d1.outlineids[entnum] = self [[ getsharedfunc("snapshot", "override_show_to") ]](victim, attacker.team, bundle.var_4430b08d5a2d47bf, "equipment");
            } else if (!level.teambased || var_3a0fd085ff7fb126) {
                var_7aa1ff687cfc30d1.outlineids[entnum] = namespace_cbd3754a0c69cc63::outlineenableforplayer(victim, attacker, bundle.var_4430b08d5a2d47bf, "equipment");
            } else if (shouldmodesetsquads()) {
                var_7aa1ff687cfc30d1.outlineids[entnum] = namespace_cbd3754a0c69cc63::outlineenableforsquad(victim, attacker.team, attacker.var_ff97225579de16a, bundle.var_4430b08d5a2d47bf, "equipment");
            } else {
                var_7aa1ff687cfc30d1.outlineids[entnum] = function_6fd4060b24c5926c(victim, attacker.team, bundle.var_4430b08d5a2d47bf, "equipment");
            }
        } else {
            var_7aa1ff687cfc30d1.outlineids[entnum] = function_6fd4060b24c5926c(victim, attacker.team, bundle.var_4430b08d5a2d47bf, "equipment");
        }
        if (isplayer(victim) || isbot(victim)) {
            victim namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable(bundle.var_4430b08d5a2d47bf, 0);
            victim namespace_893ac0cf28c5af44::function_fa08d1d78cf5cb01();
        }
        var_7aa1ff687cfc30d1 thread snapshot_grenade_update_outlines(attacker);
        if (!istrue(var_e92f3941bb8721d5)) {
            attacker namespace_a850435086c88de3::function_693d12aa2c1c02c5(0, "snapshotTag");
        }
    }
    if (istrue(bundle.var_5c67331050596608)) {
        attacker thread snapshot_grenade_create_marker(victim gettagorigin(bundle.var_34a6455f48b912b1), victim.angles, victim, bundle);
    }
    victim.lastsnapshotgrenadetime = gettime();
    if (isagent(attacker)) {
        foreach (agent in utility::function_2d7fd59d039fa69b(victim.origin, 800, 0)) {
            if (!isdefined(attacker) || !isdefined(attacker.team)) {
                continue;
            }
            if (!isdefined(agent) || !isdefined(agent.team)) {
                continue;
            }
            if (agent.team != attacker.team) {
                continue;
            }
            if (isdefined(agent.fnisinstealthcombat) && istrue(agent [[ agent.fnisinstealthcombat ]]())) {
                agent getenemyinfo(victim);
            } else {
                agent aieventlistenerevent("player_snapshotted", victim, victim.origin);
            }
        }
    } else if (!istrue(var_e92f3941bb8721d5)) {
        attacker namespace_3e725f3cc58bddd3::combatrecordtacticalstat("equip_snapshot_grenade");
        attacker namespace_3c5a4254f2b957ea::incpersstat("snapshotHits", 1);
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0x83
function snapshot_grenade_destroy() {
    self setscriptablepartstate("destroy", "active", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    self setscriptablepartstate("dust", "neutral", 0);
    self setscriptablepartstate("water", "neutral", 0);
    self setscriptablepartstate("detect", "neutral", 0);
    self setscriptablepartstate("anims", "neutral", 0);
    self missilehidetrail();
    thread snapshot_grenade_delete(0.35);
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1478
// Size: 0x43
function snapshot_grenade_delete(delay) {
    self notify("death");
    namespace_2a9588dfac284b77::deregisterspawn();
    self endon("death");
    self.exploding = 1;
    self setcandamage(0);
    if (isdefined(delay)) {
        wait(delay);
    }
    self delete();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c2
// Size: 0xd2
function snapshot_grenade_handle_damage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    if (isbulletdamage(meansofdeath)) {
        if (isdefined(objweapon)) {
            hits = 1;
            if (damage >= namespace_3bbb5a98b932c46f::minegettwohitthreshold()) {
                hits = hits + 1;
            }
            if (namespace_a12dc1d0c8a64946::isfmjdamage(objweapon, meansofdeath)) {
                hits = hits * 2;
            }
            damage = hits * 19;
        }
    }
    namespace_3bbb5a98b932c46f::equipmenthit(self.owner, attacker, objweapon, meansofdeath);
    return damage;
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159c
// Size: 0x5f
function snapshot_grenade_handle_fatal_damage(data) {
    attacker = data.attacker;
    if (isdefined(attacker) && namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, data.objweapon);
    }
    thread snapshot_grenade_destroy();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1602
// Size: 0x76
function snapshot_grenade_empapplied(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, undefined, 1);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    thread snapshot_grenade_destroy();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167f
// Size: 0x1e
function snapshot_grenade_watch_cleanup() {
    self endon("death");
    snapshot_grenade_watch_cleanup_end_early();
    if (isdefined(self)) {
        thread snapshot_grenade_destroy();
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a4
// Size: 0x40
function snapshot_grenade_watch_cleanup_end_early() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    while (1) {
        waitframe();
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16eb
// Size: 0x25
function snapshot_grenade_cleanup_mover(mover) {
    mover endon("death");
    self waittill("death");
    wait(1);
    mover delete();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1717
// Size: 0x22
function snapshot_grenade_cleanup_danger_icon(var_b9e1097fae6546e7) {
    var_b9e1097fae6546e7 endon("death");
    self waittill("death");
    var_b9e1097fae6546e7 delete();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1740
// Size: 0x176
function snapshot_grenade_update_outlines(attacker) {
    self endon("death");
    self.owner endon("death_or_disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    if (!istrue(self.isalive)) {
        return;
    }
    self notify("update");
    self endon("update");
    thread snapshot_grenade_watch_cleanup_outlines();
    while (self.targets.size > 0) {
        foreach (id, target in self.targets) {
            target = self.targets[id];
            endtime = self.endtimes[id];
            outlineid = self.outlineids[id];
            if (!isdefined(target) || !isreallyalive(target) || gettime() >= endtime || isdefined(attacker) && istrue(attacker.var_65219c911f198c95)) {
                namespace_cbd3754a0c69cc63::outlinedisable(outlineid, target);
                if (isdefined(target)) {
                    target namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
                }
                self.targets[id] = undefined;
                self.endtimes[id] = undefined;
                self.outlineids[id] = undefined;
            }
        }
        waitframe();
    }
    thread snapshot_grenade_clear_outlines();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bd
// Size: 0x20
function snapshot_grenade_watch_cleanup_outlines() {
    self endon("death");
    self endon("update");
    snapshot_grenade_watch_cleanup_outlines_end_early();
    thread snapshot_grenade_clear_outlines();
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e4
// Size: 0x40
function snapshot_grenade_watch_cleanup_outlines_end_early() {
    self.owner endon("death_or_disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    while (1) {
        waitframe();
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192b
// Size: 0xaf
function snapshot_grenade_clear_outlines() {
    self notify("death");
    self.isalive = 0;
    foreach (id, target in self.targets) {
        target = self.targets[id];
        outlineid = self.outlineids[id];
        namespace_cbd3754a0c69cc63::outlinedisable(outlineid, target);
        if (isdefined(target) && (isplayer(target) || isbot(target))) {
            target namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
        }
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e1
// Size: 0xf2
function function_6fd4060b24c5926c(var_f20913fec7561c5f, var_fa3b23d51c2dc7, hudoutlineassetname, prioritygroup) {
    ignorelist = [];
    var_49971b20aeea513f = getdvarint(@"hash_10ea538e1c6ce567", 1);
    if (istrue(var_49971b20aeea513f)) {
        if (namespace_54d20dd0dd79277f::isgameplayteam(var_fa3b23d51c2dc7)) {
            playersvisibleto = namespace_54d20dd0dd79277f::getteamdata(var_fa3b23d51c2dc7, "players");
            foreach (player in playersvisibleto) {
                if (isdefined(player) && player.sessionstate == "spectator") {
                    ignorelist[ignorelist.size] = player;
                    player thread function_3c0efada1f34af5d(var_f20913fec7561c5f);
                }
            }
        }
    }
    return namespace_cbd3754a0c69cc63::outlineenableforteam(var_f20913fec7561c5f, var_fa3b23d51c2dc7, hudoutlineassetname, prioritygroup, ignorelist);
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1adb
// Size: 0x8c
function function_3c0efada1f34af5d(var_f20913fec7561c5f) {
    self endon("disconnect");
    var_f20913fec7561c5f endon("disconnect");
    level endon("game_ended");
    var_16877d5609439072 = var_f20913fec7561c5f getentitynumber();
    if (isplayer(var_f20913fec7561c5f) && !isbot(var_f20913fec7561c5f)) {
        var_16877d5609439072 = var_f20913fec7561c5f getxuid();
    }
    self notify("force_disable_outline_" + var_16877d5609439072);
    self endon("force_disable_outline_" + var_16877d5609439072);
    self waittill("spawned_player");
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        var_f20913fec7561c5f namespace_b903a23a81915f18::function_32dfa50c47325abe(self, "equipment", 1);
    } else {
        var_f20913fec7561c5f hudoutlinedisableforclient(self);
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6e
// Size: 0xd2
function snapshot_grenade_create_marker(position, angles, target, bundle) {
    marker = spawn("script_model", position);
    marker.angles = angles;
    if (isdefined(target) && bundle.var_445f24e06af44f5e > 0) {
        marker linkto(target);
    }
    marker setmodel(bundle.markermodel);
    marker setotherent(self);
    marker setscriptablepartstate("effects", "active", 0);
    marker snapshot_grenade_watch_marker_end_early(self, bundle.var_e35070fe7706d427, target, bundle.var_445f24e06af44f5e, bundle);
    level.var_ca9f2990b5bba40 = bundle.var_e35070fe7706d427;
    if (isdefined(marker)) {
        marker delete();
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c47
// Size: 0xd4
function snapshot_grenade_watch_marker_end_early(owner, durationms, target, var_a3ecb02a9821bcee, bundle) {
    self endon("death");
    owner endon("death_or_disconnect");
    level endon("game_ended");
    endtime = gettime() + durationms;
    var_d723b21125e94be = ter_op(bundle.var_445f24e06af44f5e > 0, gettime() + bundle.var_445f24e06af44f5e, undefined);
    while (endtime > gettime()) {
        if (isdefined(var_d723b21125e94be)) {
            if (var_d723b21125e94be < gettime()) {
                self unlink();
                var_d723b21125e94be = undefined;
            } else if (!isdefined(target)) {
                self unlink();
                var_d723b21125e94be = undefined;
            } else if (!isreallyalive(target)) {
                self unlink();
                var_d723b21125e94be = undefined;
            }
        }
        waitframe();
    }
}

// Namespace namespace_3a986f7390c48c70/namespace_ce72036f17f28af2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d22
// Size: 0x1d
function function_905247d1b30c84f1() {
    return isdefined(level.var_ca9f2990b5bba40) ? level.var_ca9f2990b5bba40 : 0;
}

