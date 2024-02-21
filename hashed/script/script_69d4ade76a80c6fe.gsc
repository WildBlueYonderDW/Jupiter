// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\agents\agent_utility.gsc;

#namespace spycam;

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x215
// Size: 0x1d
function autoexec main() {
    level._effect["vfx_spycam_flash"] = loadfx("vfx/t10/core/equipment/vfx_equip_spy_camera_flash.vfx");
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239
// Size: 0x76
function function_ba4f176b24eb2f54(grenade) {
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    if (!isdefined(grenade.var_8bf83d28be4c2d4f.bundle)) {
        /#
            assertmsg("Spy Camera needs a bundle.");
        #/
    }
    grenade.owner thread function_9aeb6df65448c679(grenade);
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6
// Size: 0x10
function function_4e66f81e9876bea5() {
    thread function_3a92f9c9d2238aaa(0.05);
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0x22
function function_3a92f9c9d2238aaa(var_cbf7be4f62a0ddb2) {
    self notify("death");
    wait(var_cbf7be4f62a0ddb2);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0x489
function function_9aeb6df65448c679(spycam) {
    self endon("death");
    self endon("disconnect");
    var_dd44977fb56bb74d = self function_6b85f728c99dd393();
    maxdist = function_53c4c53197386572(spycam.var_8bf83d28be4c2d4f.bundle.var_9f11de6722b51256, 2000);
    var_db0d5bf7eafe4a31 = function_53c4c53197386572(spycam.var_8bf83d28be4c2d4f.bundle.var_e5abc0f581c07f40, 5);
    var_fe0d465d2f9072ba = function_53c4c53197386572(spycam.var_8bf83d28be4c2d4f.bundle.var_936f9dcb5700c93, 250);
    var_9942b07d05de7dc7 = self function_a2882c2e9c3b3773();
    var_bc6fbc429f3b60b1 = 2 | 131072 | 16 | 2048 | 16384;
    ents = self function_c5140fff72feca2d(maxdist, var_9942b07d05de7dc7, var_bc6fbc429f3b60b1, 0);
    targets = [];
    foreach (ent in ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (ent == self || ent == spycam) {
            continue;
        }
        if (isdefined(ent.var_28057245507f5b4e)) {
            continue;
        }
        var_74cdc35ffa60e7f5 = 0;
        var_ddab50a9c66a90cd = 0;
        if (isagent(ent) || isplayer(ent)) {
            if (ent hasperk("specialty_noscopeoutline")) {
                continue;
            }
            var_ddab50a9c66a90cd = 1;
            var_74cdc35ffa60e7f5 = 1;
            ent notify("spycam_marked");
        } else if (isdefined(ent.streakname)) {
            var_ddab50a9c66a90cd = 1;
        } else {
            if (!isdefined(ent.weapon_name)) {
                continue;
            }
            var_11d2f075e9a0e643 = namespace_68e641469fde3fa7::getweapontype(ent.weapon_name);
            if (isdefined(var_11d2f075e9a0e643)) {
                if (var_11d2f075e9a0e643 == "lethal" || var_11d2f075e9a0e643 == "tactical" || var_11d2f075e9a0e643 == "super") {
                    var_ddab50a9c66a90cd = 1;
                }
            }
        }
        if (var_ddab50a9c66a90cd) {
            if (level.teambased) {
                jumpiffalse(self.team == ent.team) LOC_000002b6;
            } else {
            LOC_000002b6:
                isvisible = spycam function_bea67d26e9b43209(ent, var_dd44977fb56bb74d);
                var_20aa5b4097887cb6 = function_2495d714d2a215ad(ent, var_9942b07d05de7dc7, var_fe0d465d2f9072ba);
                if (isvisible && var_20aa5b4097887cb6) {
                    var_ced0426e7e729ed5 = spawnstruct();
                    var_ced0426e7e729ed5.ent = ent;
                    var_ced0426e7e729ed5.var_74cdc35ffa60e7f5 = var_74cdc35ffa60e7f5;
                    var_88989130d3e4d39b = ent.origin - self geteye();
                    var_ced0426e7e729ed5.dist = abs(vectordot(anglestoright(self getplayerangles()), var_88989130d3e4d39b));
                    if (targets.size < var_db0d5bf7eafe4a31) {
                        targets[targets.size] = var_ced0426e7e729ed5;
                    } else {
                        maxdistance = var_ced0426e7e729ed5.dist;
                        var_9c11b3617c013966 = 0;
                        var_ddab50a9c66a90cd = 0;
                        for (i = 0; i < targets.size; i++) {
                            if (targets[i].dist > maxdistance) {
                                maxdistance = targets[i].dist;
                                var_9c11b3617c013966 = i;
                                var_ddab50a9c66a90cd = 1;
                            }
                        }
                        if (var_ddab50a9c66a90cd) {
                            targets[var_9c11b3617c013966] = var_ced0426e7e729ed5;
                        }
                    }
                }
            }
        }
    }
    if (targets.size == 0) {
        ref = spycam.var_8bf83d28be4c2d4f.ref;
        currentammo = namespace_4fb9dddfb8c1a67a::getequipmentammo(ref);
        namespace_4fb9dddfb8c1a67a::setequipmentammo(ref, currentammo + 1);
        self playlocalsound(isdefined(spycam.var_8bf83d28be4c2d4f.bundle.var_40d93f42db3bc962) ? "eqp_spycam_nomark" : spycam.var_8bf83d28be4c2d4f.bundle.var_40d93f42db3bc962, undefined, undefined, 1);
        namespace_44abc05161e2e2cb::showerrormessage("MP/NO_VALID_TARGETS");
    } else {
        playfxontag(getfx("vfx_spycam_flash"), spycam, "tag_fx");
        self playlocalsound("eqp_spycam_marked", undefined, undefined, 1);
        spycam function_a71f7b8d9c21d2ae(targets);
    }
    spycam function_4e66f81e9876bea5();
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x19c
function function_a71f7b8d9c21d2ae(targets) {
    var_f7f98e87323ea94f = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_55330c96a554d828, 5);
    var_f7b34b35e7c7d491 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_abe769977867a8a, 5);
    foreach (target in targets) {
        target.ent.var_28057245507f5b4e = 1;
        target.outlineid = namespace_cbd3754a0c69cc63::outlineenableforteam(target.ent, self.team, "spycam", "equipment");
        if (target.var_74cdc35ffa60e7f5) {
            self.owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_dc7164f56f09735");
            target.ent thread function_2eb2d3583b7c4407(var_f7f98e87323ea94f, self.owner);
        } else {
            self.owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_1c18ff436ea31cd5");
            target.ent thread function_2a37dbf39464630c(var_f7f98e87323ea94f, self.owner);
        }
        target.ent thread function_9d4d2d7da0db21f3(var_f7f98e87323ea94f);
    }
    thread function_86a974a0b589e89(var_f7b34b35e7c7d491, targets);
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0x87
function function_86a974a0b589e89(var_f7b34b35e7c7d491, targets) {
    wait(var_f7b34b35e7c7d491);
    foreach (target in targets) {
        if (isdefined(target.ent)) {
            namespace_cbd3754a0c69cc63::outlinedisable(target.outlineid, target.ent);
        }
    }
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x53
function function_9d4d2d7da0db21f3(var_f7f98e87323ea94f) {
    self endon("disconnect");
    result = waittill_notify_or_timeout_return("spycam_debuff_killed", var_f7f98e87323ea94f);
    if (result == "timeout") {
        self notify("spycam_debuff_expired");
    }
    if (isdefined(self.var_28057245507f5b4e)) {
        self.var_28057245507f5b4e = undefined;
    }
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa11
// Size: 0x57
function function_2eb2d3583b7c4407(duration, owner) {
    self endon("disconnect");
    self endon("spycam_debuff_expired");
    thread function_ecb52768dc9c454();
    self waittill("death");
    if (namespace_f8065cafc523dba5::playersareenemies(self, owner)) {
        owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_cbe9f73b6b0cfe11");
    }
    self notify("spycam_debuff_killed");
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x4e
function function_ecb52768dc9c454() {
    self endon("disconnect");
    self endon("spycam_debuff_expired");
    self endon("spycam_debuff_killed");
    var_e9d2b690ce31e596 = self.origin;
    while (1) {
        pinglocationenemyteams(var_e9d2b690ce31e596, self.team, self, 1, 0);
        wait(0.5);
    }
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac4
// Size: 0x7f
function function_2a37dbf39464630c(duration, owner) {
    self endon("disconnect");
    self endon("spycam_debuff_expired");
    attacker = self waittill("enemy_destroyed_equipment");
    if (isdefined(attacker) && isdefined(attacker.team) && attacker.team == owner.team) {
        owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f0b95bafe4e2d9f0");
    }
    self notify("spycam_debuff_killed");
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a
// Size: 0x19e
function function_bea67d26e9b43209(target, var_dd44977fb56bb74d) {
    if (!isdefined(target)) {
        return 0;
    }
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    playerhead = self.owner namespace_7e17181d03156026::getstancetop();
    var_8a4ea3a3baa22e4 = target.origin;
    tracepoints = [0:var_8a4ea3a3baa22e4];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (namespace_7e17181d03156026::isreallyalive(target)) {
            headpos = target namespace_7e17181d03156026::getstancetop();
        }
        centerpos = (0, 0, 0);
        if (namespace_7e17181d03156026::isreallyalive(target)) {
            centerpos = target namespace_7e17181d03156026::getstancecenter();
        }
        tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    } else if (isagent(target)) {
        tracepoints = [0:var_8a4ea3a3baa22e4 + (0, 0, 1)];
    }
    ignorelist = [0:self, 1:self.owner, 2:target];
    if (isdefined(target.colmodel)) {
        ignorelist[ignorelist.size] = target.colmodel;
    }
    for (i = 0; i < tracepoints.size; i++) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(playerhead, tracepoints[i], ignorelist, var_fbcabd62b8f66eb8)) {
            return 0;
        }
        if (!var_dd44977fb56bb74d && outlineoccluded(playerhead, tracepoints[i])) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace spycam/namespace_85e02c5451bdc1e2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0
// Size: 0x128
function function_2495d714d2a215ad(var_d89f028a5c8db805, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a) {
    if (!isdefined(var_d89f028a5c8db805)) {
        return 0;
    }
    targetorigin = var_d89f028a5c8db805.origin;
    var_4e95fb5ddda03a33 = [0:targetorigin];
    if (isplayer(var_d89f028a5c8db805)) {
        headpos = var_d89f028a5c8db805 namespace_7e17181d03156026::getstancetop();
        centerpos = var_d89f028a5c8db805 namespace_7e17181d03156026::getstancecenter();
        var_4e95fb5ddda03a33 = [0:targetorigin, 1:headpos, 2:centerpos];
    } else if (isagent(var_d89f028a5c8db805)) {
        centerpos = var_d89f028a5c8db805 namespace_86b52005c685dfb9::function_b071e509c0fb69b0();
        headpos = var_d89f028a5c8db805 namespace_86b52005c685dfb9::function_2e1b23386b967c10();
        var_4e95fb5ddda03a33 = [0:targetorigin + (0, 0, 1), 1:centerpos, 2:headpos];
    }
    foreach (point in var_4e95fb5ddda03a33) {
        if (self worldpointinreticle_circle(point, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a)) {
            return 1;
        }
    }
    return 0;
}

