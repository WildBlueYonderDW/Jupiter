// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_26be03d9c56f9498;

// Namespace namespace_26be03d9c56f9498/namespace_6d9917c3dc05dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d
// Size: 0x1f4
function init() {
    flag_init("sentientpoolmanager_initialized");
    createthreatbiasgroup("Tactical_Static");
    createthreatbiasgroup("Tactical_Moving");
    createthreatbiasgroup("Lethal_Static");
    createthreatbiasgroup("Lethal_Moving");
    createthreatbiasgroup("Level_Vehicle");
    createthreatbiasgroup("Killstreak_Static");
    createthreatbiasgroup("Killstreak_Air");
    createthreatbiasgroup("Killstreak_Ground");
    createthreatbiasgroup("Drone");
    setignoremegroup("Killstreak_Ground", "Killstreak_Ground");
    setignoremegroup("Killstreak_Air", "Killstreak_Ground");
    setignoremegroup("Killstreak_Air", "Killstreak_Air");
    setignoremegroup("Killstreak_Ground", "Killstreak_Air");
    level.sentientpools = [];
    level.sentientpools[level.sentientpools.size] = "Tactical_Static";
    level.sentientpools[level.sentientpools.size] = "Tactical_Moving";
    level.sentientpools[level.sentientpools.size] = "Lethal_Static";
    level.sentientpools[level.sentientpools.size] = "Lethal_Moving";
    level.sentientpools[level.sentientpools.size] = "Level_Vehicle";
    level.sentientpools[level.sentientpools.size] = "Killstreak_Static";
    level.sentientpools[level.sentientpools.size] = "Killstreak_Air";
    level.sentientpools[level.sentientpools.size] = "Killstreak_Ground";
    level.sentientpools[level.sentientpools.size] = "Drone";
    level.activesentients = [];
    for (i = 0; i < level.sentientpools.size; i++) {
        level.activesentients[level.sentientpools[i]] = [];
    }
    flag_set("sentientpoolmanager_initialized");
}

// Namespace namespace_26be03d9c56f9498/namespace_6d9917c3dc05dbe9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388
// Size: 0x1b8
function registersentient(threatbiasgroup, var_5c00772332ce642c, var_4918b66cebc7fbe7, var_5f6534ad3a0a1fa2, var_719c179eabb70b31, var_8928fdf873929e88) {
    var_ee6f4af9861df2ab = -1;
    for (i = 0; i < level.sentientpools.size; i++) {
        if (level.sentientpools[i] == threatbiasgroup) {
            var_ee6f4af9861df2ab = i;
            break;
        }
    }
    if (var_ee6f4af9861df2ab == -1) {
        /#
            assertex(var_ee6f4af9861df2ab, "Attemping to call addSentient with an invalid threatBiasGroup: " + threatbiasgroup);
        #/
        return;
    }
    if (isdefined(self.sentientpool)) {
        return;
    }
    var_1b4129ac518dea9b = getsentientcounts();
    var_761770fede046a2f = getsentientlimits();
    if (var_1b4129ac518dea9b["other"] + var_1b4129ac518dea9b["expendable"] >= var_761770fede046a2f["other"]) {
        var_64518d95210a12e7 = level removebestsentient(var_ee6f4af9861df2ab);
        if (!var_64518d95210a12e7) {
            return;
        }
    }
    self.sentientpool = threatbiasgroup;
    self.sentientaddedtime = gettime();
    self.sentientpoolindex = self getentitynumber();
    team = undefined;
    if (isstring(var_5c00772332ce642c)) {
        team = var_5c00772332ce642c;
    } else if (isplayer(var_5c00772332ce642c)) {
        team = var_5c00772332ce642c.team;
    }
    succeeded = undefined;
    if (isdefined(team) && !isagent(self)) {
        succeeded = self makeentitysentient(team, undefined, var_719c179eabb70b31, var_8928fdf873929e88);
    }
    if (istrue(succeeded)) {
        self setthreatbiasgroup(threatbiasgroup);
        if (istrue(var_4918b66cebc7fbe7)) {
            self makeentitynomeleetarget();
        }
        level.activesentients[threatbiasgroup][self.sentientpoolindex] = self;
        thread monitorsentient(var_5f6534ad3a0a1fa2);
    }
}

// Namespace namespace_26be03d9c56f9498/namespace_6d9917c3dc05dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547
// Size: 0x6f
function monitorsentient(var_5f6534ad3a0a1fa2) {
    level endon("game_ended");
    poolid = self.sentientpool;
    var_35fa1149ae3912e5 = self.sentientpoolindex;
    if (isdefined(var_5f6534ad3a0a1fa2)) {
        waittill_any_3("death", "remove_sentient", var_5f6534ad3a0a1fa2);
    } else {
        waittill_either("death", "remove_sentient");
    }
    unregistersentient(poolid, var_35fa1149ae3912e5);
}

// Namespace namespace_26be03d9c56f9498/namespace_6d9917c3dc05dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd
// Size: 0xa3
function removebestsentient(var_6f03d6ebff31de00) {
    /#
        assert(var_6f03d6ebff31de00 >= 0 && var_6f03d6ebff31de00 < level.sentientpools.size);
    #/
    var_77cb0f7ec307be39 = undefined;
    for (i = 0; i <= var_6f03d6ebff31de00; i++) {
        /#
            assert(isdefined(level.sentientpools[i]));
        #/
        var_77cb0f7ec307be39 = getbestsentientfrompool(level.sentientpools[i]);
        if (isdefined(var_77cb0f7ec307be39)) {
            break;
        }
    }
    if (!isdefined(var_77cb0f7ec307be39)) {
        return 0;
    }
    var_77cb0f7ec307be39 unregistersentient(var_77cb0f7ec307be39.sentientpool, var_77cb0f7ec307be39.sentientpoolindex);
    return 1;
}

// Namespace namespace_26be03d9c56f9498/namespace_6d9917c3dc05dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x668
// Size: 0x9b
function getbestsentientfrompool(var_daf372b2e19fb88f) {
    var_77cb0f7ec307be39 = undefined;
    var_3071102f98cbed33 = undefined;
    foreach (sentient in level.activesentients[var_daf372b2e19fb88f]) {
        if (!isdefined(var_3071102f98cbed33) || sentient.sentientaddedtime < var_3071102f98cbed33) {
            var_3071102f98cbed33 = sentient.sentientaddedtime;
            var_77cb0f7ec307be39 = sentient;
        }
    }
    return var_77cb0f7ec307be39;
}

// Namespace namespace_26be03d9c56f9498/namespace_6d9917c3dc05dbe9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70b
// Size: 0x57
function unregistersentient(poolid, var_35fa1149ae3912e5) {
    if (!isdefined(poolid) || !isdefined(var_35fa1149ae3912e5)) {
        return;
    }
    level.activesentients[poolid][var_35fa1149ae3912e5] = undefined;
    if (isdefined(self)) {
        self.sentientpool = undefined;
        self.sentientpoolindex = undefined;
        if (!isagent(self)) {
            self freeentitysentient();
        }
    }
}

