#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_f3e2bfae6c100ef7;

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd
// Size: 0x65
function getobjectiveparam(member, defvalue) {
    if (isdefined(level.zone) && isdefined(level.zone.objective.params[member])) {
        return level.zone.objective.params[member];
    }
    return defvalue;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b
// Size: 0x81
function function_75354d8de2adc2a(zone) {
    bombsites = zone.bombzones;
    foreach (player in level.players) {
        if (istrue(player.isplanting)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0xea
function function_edcbb313f774a31a(zone) {
    sam_sites = zone.turrets;
    foreach (turret in sam_sites) {
        if (!isdefined(turret)) {
            continue;
        }
        if (is_equal(turret.var_f236a45969f96bb4, "defuse")) {
            return false;
        }
    }
    foreach (player in level.players) {
        if (istrue(player.var_385a26c0bfc712b4)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8
// Size: 0x77
function function_9080aa9578d94aca(zone) {
    foreach (capture_zone in zone.capture_zones) {
        if (capture_zone.touchlist[game["attackers"]].size > 0) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0xbf
function function_375f5ed9ca0d5437(zone) {
    if (!isdefined(level.escortvehicles[0])) {
        return true;
    }
    tank = level.escortvehicles[0];
    if (is_equal(zone.objectivetype, 11)) {
        nearbyrange = getdvarint(@"hash_f1c723884f919c10", 200);
    } else {
        nearbyrange = getdvarint(@"hash_9133c54c3f6aee07", 300);
    }
    attackers = scripts\mp\utility\teams::getteamdata(game["attackers"], "alivePlayers");
    var_95f2a51e7b487eb2 = sortbydistancecullbyradius(attackers, tank.origin, nearbyrange);
    if (var_95f2a51e7b487eb2.size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0
// Size: 0x91
function function_585d9ea0d3567c2f(zone) {
    foreach (hackzone in zone.hackzones) {
        if (istrue(hackzone.ishacking)) {
            return false;
        }
        if (istrue(hackzone.hacked) && !istrue(hackzone.complete)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0xb0
function function_59da849245283fc8(zone) {
    if (zone.currentphase == "hack") {
        return function_585d9ea0d3567c2f(zone);
    } else if (zone.currentphase == "bomb") {
        foreach (bombzone in zone.bombzones) {
            if (istrue(bombzone.var_b7c18e4654e6881a) || istrue(bombzone.robbed)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543
// Size: 0x49
function function_c59f8281fad3515b(zone) {
    if (zone.currentphase == "capture_zone") {
        if (zone.var_d731642d971f0c49.touchlist[game["attackers"]].size > 0) {
            return false;
        }
        return true;
    }
    return true;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595
// Size: 0xa1
function function_23eb8b768403db5e(zone) {
    if (zone.currentphase == "wheelson_escort") {
        return function_375f5ed9ca0d5437(zone);
    }
    foreach (capture_zone in zone.var_3abf844425ac7c00.capture_zones) {
        if (capture_zone.touchlist[game["attackers"]].size > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7 / namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63e
// Size: 0x1f
function function_2d5f2773c38a9b93(time) {
    level.extratime += time;
}

