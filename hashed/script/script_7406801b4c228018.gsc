// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_f3e2bfae6c100ef7;

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd
// Size: 0x66
function function_4e2267f2ebff079f(member, var_628828a6d842b1b9) {
    if (isdefined(level.zone) && isdefined(level.zone.objective.params[member])) {
        return level.zone.objective.params[member];
    }
    return var_628828a6d842b1b9;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b
// Size: 0x82
function function_75354d8de2adc2a(zone) {
    var_7ed3748a6429cdff = zone.bombzones;
    foreach (player in level.players) {
        if (istrue(player.isplanting)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0xeb
function function_edcbb313f774a31a(zone) {
    var_eb182117b85979a7 = zone.turrets;
    foreach (turret in var_eb182117b85979a7) {
        if (!isdefined(turret)) {
            continue;
        }
        if (is_equal(turret.var_f236a45969f96bb4, "defuse")) {
            return 0;
        }
    }
    foreach (player in level.players) {
        if (istrue(player.var_385a26c0bfc712b4)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8
// Size: 0x78
function function_9080aa9578d94aca(zone) {
    foreach (capture_zone in zone.var_ee13e110c0910a51) {
        if (capture_zone.touchlist[game["attackers"]].size > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0xc0
function function_375f5ed9ca0d5437(zone) {
    if (!isdefined(level.var_e718773786ad42e8[0])) {
        return 1;
    }
    tank = level.var_e718773786ad42e8[0];
    if (is_equal(zone.objectivetype, 11)) {
        var_90b5cdd621c70d23 = getdvarint(@"hash_f1c723884f919c10", 200);
    } else {
        var_90b5cdd621c70d23 = getdvarint(@"hash_9133c54c3f6aee07", 300);
    }
    attackers = namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "alivePlayers");
    var_95f2a51e7b487eb2 = sortbydistancecullbyradius(attackers, tank.origin, var_90b5cdd621c70d23);
    if (var_95f2a51e7b487eb2.size > 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0
// Size: 0x92
function function_585d9ea0d3567c2f(zone) {
    foreach (var_ed31f55739afcaf2 in zone.var_54a90fd3dd9a59b3) {
        if (istrue(var_ed31f55739afcaf2.ishacking)) {
            return 0;
        } else if (istrue(var_ed31f55739afcaf2.hacked) && !istrue(var_ed31f55739afcaf2.complete)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0xb1
function function_59da849245283fc8(zone) {
    if (zone.var_edf6ad250b4f68b5 == "hack") {
        return function_585d9ea0d3567c2f(zone);
    } else if (zone.var_edf6ad250b4f68b5 == "bomb") {
        foreach (bombzone in zone.bombzones) {
            if (istrue(bombzone.var_b7c18e4654e6881a) || istrue(bombzone.var_1b5e22b6716b9387)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543
// Size: 0x4a
function function_c59f8281fad3515b(zone) {
    if (zone.var_edf6ad250b4f68b5 == "capture_zone") {
        if (zone.var_d731642d971f0c49.touchlist[game["attackers"]].size > 0) {
            return 0;
        }
        return 1;
    }
    return 1;
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595
// Size: 0xa2
function function_23eb8b768403db5e(zone) {
    if (zone.var_edf6ad250b4f68b5 == "wheelson_escort") {
        return function_375f5ed9ca0d5437(zone);
    } else {
        foreach (capture_zone in zone.var_3abf844425ac7c00.var_ee13e110c0910a51) {
            if (capture_zone.touchlist[game["attackers"]].size > 0) {
                return 0;
            }
        }
        return 1;
    }
}

// Namespace namespace_f3e2bfae6c100ef7/namespace_9e98bfcb3b4a9888
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63e
// Size: 0x20
function function_2d5f2773c38a9b93(time) {
    level.extratime = level.extratime + time;
}

