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

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x215
// Size: 0x1d
function autoexec main() {
    level._effect["vfx_spycam_flash"] = loadfx("vfx/t10/core/equipment/vfx_equip_spy_camera_flash.vfx");
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239
// Size: 0x76
function function_ba4f176b24eb2f54(grenade) {
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.tableinfo = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    if (!isdefined(grenade.tableinfo.bundle)) {
        /#
            assertmsg("Spy Camera needs a bundle.");
        #/
    }
    grenade.owner thread function_9aeb6df65448c679(grenade);
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6
// Size: 0x10
function function_4e66f81e9876bea5() {
    thread function_3a92f9c9d2238aaa(0.05);
}

// Namespace spycam / namespace_85e02c5451bdc1e2
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

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0x489
function function_9aeb6df65448c679(spycam) {
    self endon("death");
    self endon("disconnect");
    var_dd44977fb56bb74d = self function_6b85f728c99dd393();
    maxdist = default_to(spycam.tableinfo.bundle.var_9f11de6722b51256, 2000);
    maxtargets = default_to(spycam.tableinfo.bundle.var_e5abc0f581c07f40, 5);
    markradius = default_to(spycam.tableinfo.bundle.var_936f9dcb5700c93, 250);
    markfov = self function_a2882c2e9c3b3773();
    var_bc6fbc429f3b60b1 = 2 | 131072 | 16 | 2048 | 16384;
    ents = self function_c5140fff72feca2d(maxdist, markfov, var_bc6fbc429f3b60b1, 0);
    targets = [];
    foreach (ent in ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (ent == self || ent == spycam) {
            continue;
        }
        if (isdefined(ent.spycamdebuff)) {
            continue;
        }
        isplayertarget = 0;
        marktarget = 0;
        if (isagent(ent) || isplayer(ent)) {
            if (ent hasperk("specialty_noscopeoutline")) {
                continue;
            }
            marktarget = 1;
            isplayertarget = 1;
            ent notify("spycam_marked");
        } else if (isdefined(ent.streakname)) {
            marktarget = 1;
        } else {
            if (!isdefined(ent.weapon_name)) {
                continue;
            }
            equipmenttype = scripts/mp/utility/weapon::getweapontype(ent.weapon_name);
            if (isdefined(equipmenttype)) {
                if (equipmenttype == "lethal" || equipmenttype == "tactical" || equipmenttype == "super") {
                    marktarget = 1;
                }
            }
        }
        if (marktarget) {
            if (level.teambased) {
                if (self.team == ent.team) {
                    continue;
                }
            }
            isvisible = spycam function_bea67d26e9b43209(ent, var_dd44977fb56bb74d);
            var_20aa5b4097887cb6 = function_2495d714d2a215ad(ent, markfov, markradius);
            if (isvisible && var_20aa5b4097887cb6) {
                targetstruct = spawnstruct();
                targetstruct.ent = ent;
                targetstruct.isplayertarget = isplayertarget;
                playertoenemy = ent.origin - self geteye();
                targetstruct.dist = abs(vectordot(anglestoright(self getplayerangles()), playertoenemy));
                if (targets.size < maxtargets) {
                    targets[targets.size] = targetstruct;
                    continue;
                }
                maxdistance = targetstruct.dist;
                maxdistanceindex = 0;
                marktarget = 0;
                for (i = 0; i < targets.size; i++) {
                    if (targets[i].dist > maxdistance) {
                        maxdistance = targets[i].dist;
                        maxdistanceindex = i;
                        marktarget = 1;
                    }
                }
                if (marktarget) {
                    targets[maxdistanceindex] = targetstruct;
                }
            }
        }
    }
    if (targets.size == 0) {
        ref = spycam.tableinfo.ref;
        currentammo = namespace_4fb9dddfb8c1a67a::getequipmentammo(ref);
        namespace_4fb9dddfb8c1a67a::setequipmentammo(ref, currentammo + 1);
        self playlocalsound(isdefined(spycam.tableinfo.bundle.var_40d93f42db3bc962) ? spycam.tableinfo.bundle.var_40d93f42db3bc962 : "eqp_spycam_nomark", undefined, undefined, 1);
        scripts/mp/hud_message::showerrormessage("MP/NO_VALID_TARGETS");
    } else {
        playfxontag(getfx("vfx_spycam_flash"), spycam, "tag_fx");
        self playlocalsound("eqp_spycam_marked", undefined, undefined, 1);
        spycam function_a71f7b8d9c21d2ae(targets);
    }
    spycam function_4e66f81e9876bea5();
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x19c
function function_a71f7b8d9c21d2ae(targets) {
    var_f7f98e87323ea94f = default_to(self.tableinfo.bundle.var_55330c96a554d828, 5);
    outlineduration = default_to(self.tableinfo.bundle.var_abe769977867a8a, 5);
    foreach (target in targets) {
        target.ent.spycamdebuff = 1;
        target.outlineid = scripts/mp/utility/outline::outlineenableforteam(target.ent, self.team, "spycam", "equipment");
        if (target.isplayertarget) {
            self.owner thread scripts/mp/utility/points::doScoreEvent(#"hash_dc7164f56f09735");
            target.ent thread function_2eb2d3583b7c4407(var_f7f98e87323ea94f, self.owner);
        } else {
            self.owner thread scripts/mp/utility/points::doScoreEvent(#"hash_1c18ff436ea31cd5");
            target.ent thread function_2a37dbf39464630c(var_f7f98e87323ea94f, self.owner);
        }
        target.ent thread function_9d4d2d7da0db21f3(var_f7f98e87323ea94f);
    }
    thread function_86a974a0b589e89(outlineduration, targets);
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0x87
function function_86a974a0b589e89(outlineduration, targets) {
    wait(outlineduration);
    foreach (target in targets) {
        if (isdefined(target.ent)) {
            scripts/mp/utility/outline::outlinedisable(target.outlineid, target.ent);
        }
    }
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x53
function function_9d4d2d7da0db21f3(var_f7f98e87323ea94f) {
    self endon("disconnect");
    result = waittill_notify_or_timeout_return("spycam_debuff_killed", var_f7f98e87323ea94f);
    if (result == "timeout") {
        self notify("spycam_debuff_expired");
    }
    if (isdefined(self.spycamdebuff)) {
        self.spycamdebuff = undefined;
    }
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa11
// Size: 0x57
function function_2eb2d3583b7c4407(duration, owner) {
    self endon("disconnect");
    self endon("spycam_debuff_expired");
    thread function_ecb52768dc9c454();
    self waittill("death");
    if (scripts/cp_mp/utility/player_utility::playersareenemies(self, owner)) {
        owner thread scripts/mp/utility/points::doScoreEvent(#"hash_cbe9f73b6b0cfe11");
    }
    self notify("spycam_debuff_killed");
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x4e
function function_ecb52768dc9c454() {
    self endon("disconnect");
    self endon("spycam_debuff_expired");
    self endon("spycam_debuff_killed");
    markedlocation = self.origin;
    while (true) {
        pinglocationenemyteams(markedlocation, self.team, self, 1, 0);
        wait(0.5);
    }
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac4
// Size: 0x7f
function function_2a37dbf39464630c(duration, owner) {
    self endon("disconnect");
    self endon("spycam_debuff_expired");
    attacker = self waittill("enemy_destroyed_equipment");
    if (isdefined(attacker) && isdefined(attacker.team) && attacker.team == owner.team) {
        owner thread scripts/mp/utility/points::doScoreEvent(#"hash_f0b95bafe4e2d9f0");
    }
    self notify("spycam_debuff_killed");
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a
// Size: 0x19e
function function_bea67d26e9b43209(target, var_dd44977fb56bb74d) {
    if (!isdefined(target)) {
        return false;
    }
    tracecontents = scripts/engine/trace::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    playerhead = self.owner scripts/mp/utility/player::getstancetop();
    defaultorigin = target.origin;
    tracepoints = [defaultorigin];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (scripts/mp/utility/player::isreallyalive(target)) {
            headpos = target scripts/mp/utility/player::getstancetop();
        }
        centerpos = (0, 0, 0);
        if (scripts/mp/utility/player::isreallyalive(target)) {
            centerpos = target scripts/mp/utility/player::getstancecenter();
        }
        tracepoints = [headpos, centerpos, defaultorigin];
    } else if (isagent(target)) {
        tracepoints = [defaultorigin + (0, 0, 1)];
    }
    ignorelist = [self, self.owner, target];
    if (isdefined(target.colmodel)) {
        ignorelist[ignorelist.size] = target.colmodel;
    }
    for (i = 0; i < tracepoints.size; i++) {
        if (!scripts/engine/trace::ray_trace_passed(playerhead, tracepoints[i], ignorelist, tracecontents)) {
            return false;
        }
        if (!var_dd44977fb56bb74d && outlineoccluded(playerhead, tracepoints[i])) {
            return false;
        }
        return true;
    }
    return false;
}

// Namespace spycam / namespace_85e02c5451bdc1e2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0
// Size: 0x128
function function_2495d714d2a215ad(scantarget, scanfov, var_5e43b44751d01b1a) {
    if (!isdefined(scantarget)) {
        return false;
    }
    targetorigin = scantarget.origin;
    scanpoints = [targetorigin];
    if (isplayer(scantarget)) {
        headpos = scantarget scripts/mp/utility/player::getstancetop();
        centerpos = scantarget scripts/mp/utility/player::getstancecenter();
        scanpoints = [targetorigin, headpos, centerpos];
    } else if (isagent(scantarget)) {
        centerpos = scantarget scripts/mp/agents/agent_utility::function_b071e509c0fb69b0();
        headpos = scantarget scripts/mp/agents/agent_utility::function_2e1b23386b967c10();
        scanpoints = [targetorigin + (0, 0, 1), centerpos, headpos];
    }
    foreach (point in scanpoints) {
        if (self worldpointinreticle_circle(point, scanfov, var_5e43b44751d01b1a)) {
            return true;
        }
    }
    return false;
}

