// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using script_64acb6ce534155b7;
#using scripts\common\vehicle_code.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace br_challenges;

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x73
function init() {
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    registerchallenge("br_mastery_fiveContracts", &fivecontracts);
    registerchallenge("br_mastery_pointBlank_airstrike", &pointblank_airstrike);
    registerchallenge("br_mastery_pointBlank_tomahawk", &pointblank_tomahawk);
    registerchallenge("br_mastery_c4VehicleMultKill", &c4vehiclemultkill);
    registerchallenge("br_mastery_ghostRideWhip", &ghostridewhip);
    registerchallenge("br_mastery_roundKillExecute", &roundkillexecute);
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307
// Size: 0x5b
function registerchallenge(var_a5cb6f1f6abe070b, var_242dd1075b2cdd44) {
    if (!isdefined(level.br_challenges)) {
        level.br_challenges = [];
    }
    /#
        assertex(!isdefined(level.br_challenges[var_a5cb6f1f6abe070b]), "br challenge '" + var_a5cb6f1f6abe070b + "' already defined!");
    #/
    level.br_challenges[var_a5cb6f1f6abe070b] = var_242dd1075b2cdd44;
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x369
// Size: 0x50
function challengeevaluator(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    /#
        assert(isdefined(var_a5cb6f1f6abe070b));
    #/
    if (!isdefined(level.br_challenges)) {
        return;
    }
    var_242dd1075b2cdd44 = level.br_challenges[var_a5cb6f1f6abe070b];
    if (isdefined(var_242dd1075b2cdd44)) {
        self thread [[ var_242dd1075b2cdd44 ]](var_a5cb6f1f6abe070b, var_cd37ce775909957b);
    }
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x39
function awardmasterychallenge(var_a5cb6f1f6abe070b) {
    if (getdvarint(@"hash_ad789c41a11e3f59", 0)) {
        iprintlnbold("Mastery Challenge: " + var_a5cb6f1f6abe070b + " completed!");
    }
    namespace_aad14af462a74d08::oncollectitem(var_a5cb6f1f6abe070b);
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0xe5
function fivecontracts(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    if (!isdefined(self.team)) {
        return;
    }
    if (get_int_or_0(self.brmissionscompleted) < 5) {
        return;
    }
    var_a11643fdeedee81b = isdefined(level.gulag) && !istrue(level.gulag.shutdown);
    foreach (player in level.teamdata[self.team]["players"]) {
        if (!isreallyalive(player)) {
            return;
        }
        if (var_a11643fdeedee81b && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            return;
        }
    }
    awardmasterychallenge(var_a5cb6f1f6abe070b);
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec
// Size: 0x12e
function pointblank_airstrike(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    plane = var_cd37ce775909957b.plane;
    targetsite = var_cd37ce775909957b.targetsite;
    if (!isdefined(plane) || !isdefined(plane.airstrikeid) || !isdefined(plane.streakinfo) || !isdefined(targetsite)) {
        return;
    }
    streakinfo = plane.streakinfo;
    if (distancesquared(self.origin, targetsite) > squared(432)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("pointBlank_airstrike_killtracker");
    self endon("pointBlank_airstrike_killtracker");
    waittill_any_timeout_1(10, "airstrike_finished_" + plane.airstrikeid);
    if (!isreallyalive(self)) {
        return;
    }
    /#
        if (getdvarint(@"hash_ad789c41a11e3f59", 0)) {
            iprintlnbold("<unknown string>" + var_a5cb6f1f6abe070b + "<unknown string>" + streakinfo.kills);
        }
    #/
    if (streakinfo.kills >= 3) {
        awardmasterychallenge("br_mastery_pointBlankStreakKill");
    }
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621
// Size: 0xe8
function pointblank_tomahawk(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    var_490fe8ae7b774eb8 = var_cd37ce775909957b.streakinfo;
    targetsite = var_cd37ce775909957b.targetsite;
    if (!isdefined(var_490fe8ae7b774eb8)) {
        return;
    }
    if (!isdefined(targetsite)) {
        return;
    }
    if (distancesquared(self.origin, targetsite) > squared(432)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("pointBlank_tomahawk_killtracker");
    self endon("pointBlank_tomahawk_killtracker");
    namespace_3c37cb17ade254d::waittill_any_timeout_2(20, "cluster_strike_finished");
    if (!isreallyalive(self)) {
        return;
    }
    /#
        if (getdvarint(@"hash_ad789c41a11e3f59", 0)) {
            iprintlnbold("<unknown string>" + var_a5cb6f1f6abe070b + "<unknown string>" + var_490fe8ae7b774eb8.kills);
        }
    #/
    if (var_490fe8ae7b774eb8.kills >= 3) {
        awardmasterychallenge("br_mastery_pointBlankStreakKill");
    }
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x711
// Size: 0x173
function c4vehiclemultkill(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    meansofdeath = var_cd37ce775909957b.meansofdeath;
    inflictor = var_cd37ce775909957b.inflictor;
    if (!isdefined(meansofdeath) || meansofdeath != "MOD_EXPLOSIVE") {
        return;
    }
    if (!isvalidinflictorc4vehicle(inflictor)) {
        return;
    }
    self endon("disconnect");
    level endon("game_ended");
    self notify("updateC4VehicleMultKill");
    self endon("updateC4VehicleMultKill");
    if (!isdefined(self.recentc4vehiclekillcount)) {
        self.recentc4vehiclekillcount = 0;
    }
    self.recentc4vehiclekillcount++;
    wait(4);
    /#
        if (getdvarint(@"hash_ad789c41a11e3f59", 0) && isdefined(self.recentc4vehiclekillcount)) {
            iprintlnbold("<unknown string>" + var_a5cb6f1f6abe070b + "<unknown string>" + self.recentc4vehiclekillcount);
        }
    #/
    if (isdefined(self.recentc4vehiclekillcount) && self.recentc4vehiclekillcount >= 3) {
        awardmasterychallenge(var_a5cb6f1f6abe070b);
        var_a93943361d672dfb = c4vehiclecooperator(inflictor);
        issameteam = isdefined(var_a93943361d672dfb) && isdefined(var_a93943361d672dfb.team) && isdefined(self.team) && var_a93943361d672dfb.team == self.team;
        if (issameteam) {
            var_a93943361d672dfb awardmasterychallenge(var_a5cb6f1f6abe070b);
        }
    }
    self.recentc4vehiclekillcount = undefined;
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88b
// Size: 0x106
function isvalidinflictorc4vehicle(inflictor) {
    if (!isdefined(inflictor)) {
        return 0;
    }
    if (isdefined(inflictor.vehiclename) && !inflictor vehicle_is_stopped()) {
        children = inflictor getlinkedchildren();
        foreach (child in children) {
            if (isdefined(child.weapon_name) && child.weapon_name == "c4_mp") {
                return 1;
            }
        }
    } else if (isdefined(inflictor.weapon_name) && inflictor.weapon_name == "c4_mp") {
        parent = inflictor getlinkedparent();
        if (isdefined(parent) && isdefined(parent.vehiclename) && !parent vehicle_is_stopped()) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x59
function c4vehiclecooperator(inflictor) {
    if (isdefined(inflictor) && isdefined(inflictor.weapon_name) && inflictor.weapon_name == "c4_mp") {
        parent = inflictor getlinkedparent();
        if (isdefined(parent)) {
            return parent.owner;
        }
    }
    return undefined;
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fa
// Size: 0x20
function roundkillexecute(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    awardmasterychallenge("br_mastery_roundKillExecute");
}

// Namespace br_challenges/namespace_a553e80c09b00591
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x109
function ghostridewhip(var_a5cb6f1f6abe070b, var_cd37ce775909957b) {
    self endon("disconnect");
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    exitdriver = var_cd37ce775909957b.exitdriver;
    maderecentkill = var_cd37ce775909957b.maderecentkill;
    if (istrue(exitdriver)) {
        if (istrue(self.hasexiteddriver) && self.recentghostridekillcount != 0) {
            return;
        }
        self.hasexiteddriver = 1;
    }
    if (!istrue(self.hasexiteddriver)) {
        return;
    }
    self notify("ghostRideWhip");
    self endon("ghostRideWhip");
    if (!isdefined(self.recentghostridekillcount)) {
        self.recentghostridekillcount = 0;
    }
    if (istrue(maderecentkill)) {
        self.recentghostridekillcount++;
    }
    wait(4);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.recentghostridekillcount) && self.recentghostridekillcount >= 3) {
        awardmasterychallenge(var_a5cb6f1f6abe070b);
    }
    self.recentghostridekillcount = undefined;
    self.hasexiteddriver = undefined;
}

