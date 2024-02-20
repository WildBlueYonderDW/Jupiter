// mwiii decomp prototype
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\outline.gsc;
#using scripts\engine\utility.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\utility\outline.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace outline;

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381
// Size: 0x3f
function outlineenableforall(var_f20913fec7561c5f, hudoutlineassetname, prioritygroup) {
    playersvisibleto = level.players;
    return namespace_b903a23a81915f18::outlineenableinternal(var_f20913fec7561c5f, playersvisibleto, hudoutlineassetname, prioritygroup, "ALL");
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c8
// Size: 0x10a
function outlineenableforteam(var_f20913fec7561c5f, var_fa3b23d51c2dc7, hudoutlineassetname, prioritygroup, var_213fdd3689d4b33e) {
    if (isgameplayteam(var_fa3b23d51c2dc7)) {
        playersvisibleto = getteamdata(var_fa3b23d51c2dc7, "players");
    } else {
        playersvisibleto = [];
    }
    if (isdefined(var_213fdd3689d4b33e)) {
        var_404eeafd8dc3f0f0 = [];
        if (isarray(var_213fdd3689d4b33e)) {
            var_404eeafd8dc3f0f0 = var_213fdd3689d4b33e;
        } else if (isplayer(var_213fdd3689d4b33e)) {
            var_404eeafd8dc3f0f0 = [0:var_213fdd3689d4b33e];
        }
        foreach (var_6b0ee97314aed333 in var_404eeafd8dc3f0f0) {
            if (isdefined(var_6b0ee97314aed333.team) && var_6b0ee97314aed333.team == var_fa3b23d51c2dc7) {
                playersvisibleto = namespace_3c37cb17ade254d::array_remove(playersvisibleto, var_6b0ee97314aed333);
            }
        }
    }
    return namespace_b903a23a81915f18::outlineenableinternal(var_f20913fec7561c5f, playersvisibleto, hudoutlineassetname, prioritygroup, "TEAM", var_fa3b23d51c2dc7);
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da
// Size: 0xbe
function outlineenableforsquad(var_f20913fec7561c5f, var_fa3b23d51c2dc7, squadindex, hudoutlineassetname, prioritygroup) {
    /#
        assertex(namespace_ca7b90256548aa40::issquadmode(), "outlineEnableForSquad() called when squads disabled.");
    #/
    /#
        assertex(isdefined(level.squaddata[var_fa3b23d51c2dc7]), "outlineEnableForSquad() called with team not in level.squadData: " + var_fa3b23d51c2dc7);
    #/
    /#
        assertex(!isdefined(level.squaddata[var_fa3b23d51c2dc7]) || isdefined(level.squaddata[var_fa3b23d51c2dc7][squadindex]), "outlineEnableForSquad() called with squad index not in level.squadData[ team ]: " + squadindex);
    #/
    playersvisibleto = level.squaddata[var_fa3b23d51c2dc7][squadindex].players;
    return namespace_b903a23a81915f18::outlineenableinternal(var_f20913fec7561c5f, playersvisibleto, hudoutlineassetname, prioritygroup, "SQUAD", var_fa3b23d51c2dc7, squadindex);
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a0
// Size: 0x48
function outlineenableforplayer(var_f20913fec7561c5f, var_18ebeb29bb7541e3, hudoutlineassetname, prioritygroup) {
    if (isagent(var_18ebeb29bb7541e3)) {
        return namespace_b903a23a81915f18::outlinegenerateuniqueid();
    }
    return namespace_b903a23a81915f18::outlineenableinternal(var_f20913fec7561c5f, [0:var_18ebeb29bb7541e3], hudoutlineassetname, prioritygroup, "ENTITY");
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0
// Size: 0x39
function outlinedisable(id, var_420a996e67989dc4) {
    /#
        assertex(isdefined(id) && int(id) == id, "Invalid ID passed to outlineDisable()");
    #/
    namespace_b903a23a81915f18::outlinedisableinternal(id, var_420a996e67989dc4);
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630
// Size: 0x24
function outlinerefresh(var_420a996e67989dc4) {
    /#
        assertex(isdefined(var_420a996e67989dc4), "Undefined entOutlined passed to outlineRefresh()");
    #/
    namespace_b903a23a81915f18::outlinerefreshinternal(var_420a996e67989dc4);
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65b
// Size: 0x17
function initoutlineoccluders() {
    level.outlineoccluders = [];
    level.outlineoccludersid = 0;
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x679
// Size: 0x6a
function addoutlineoccluder(position, radius) {
    var_f676533b6410938e = spawnstruct();
    var_f676533b6410938e.position = position;
    var_f676533b6410938e.radius = radius;
    id = level.outlineoccludersid;
    level.outlineoccluders[id] = var_f676533b6410938e;
    level.outlineoccludersid++;
    return id;
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eb
// Size: 0x17
function removeoutlineoccluder(id) {
    level.outlineoccluders[id] = undefined;
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x709
// Size: 0xaf
function outlineoccluded(startpoint, endpoint) {
    foreach (occluder in level.outlineoccluders) {
        if (!isdefined(occluder) || !isdefined(occluder.position) || !isdefined(occluder.radius)) {
            continue;
        }
        if (math::segmentvssphere(startpoint, endpoint, occluder.position, occluder.radius)) {
            return 1;
        }
    }
    return 0;
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c0
// Size: 0x18e
function function_6b8603ff55f4ed2c(var_fd3cfe676991b240, attacker, var_9cc7d33e2e2ebfef, duration, var_f106e72340798ffc, prioritygroup) {
    /#
        assertex(isdefined(var_fd3cfe676991b240), "applyOutlinetoCollectionforTime: No victims are defined. Please add entities to outline.");
    #/
    /#
        assertex(isdefined(attacker), "applyOutlinetoCollectionforTime: No attacker is defined. Please add an entity to own the outline data");
    #/
    if (!isdefined(var_9cc7d33e2e2ebfef)) {
        var_9cc7d33e2e2ebfef = [0:attacker];
    }
    if (!isdefined(duration)) {
        duration = 1000;
    } else {
        duration = duration * 1000;
    }
    if (!isdefined(var_f106e72340798ffc)) {
        var_f106e72340798ffc = "snapshotgrenade";
    }
    if (!isdefined(prioritygroup)) {
        prioritygroup = "equipment";
    }
    var_7aa1ff687cfc30d1 = undefined;
    var_7aa1ff687cfc30d1 = spawnstruct();
    var_7aa1ff687cfc30d1.owner = attacker;
    var_7aa1ff687cfc30d1.isalive = 1;
    var_7aa1ff687cfc30d1.targets = [];
    var_7aa1ff687cfc30d1.endtimes = [];
    var_7aa1ff687cfc30d1.outlineids = [];
    foreach (victim in var_fd3cfe676991b240) {
        entnum = victim getentitynumber();
        var_7aa1ff687cfc30d1.targets[entnum] = victim;
        var_7aa1ff687cfc30d1.endtimes[entnum] = gettime() + duration;
        var_7aa1ff687cfc30d1.outlineids[entnum] = namespace_b903a23a81915f18::outlineenableinternal(victim, var_9cc7d33e2e2ebfef, var_f106e72340798ffc, prioritygroup, "ENTITY");
    }
    var_7aa1ff687cfc30d1 thread function_2f7892fd0b6b8251();
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x955
// Size: 0x153
function private function_2f7892fd0b6b8251() {
    self endon("death");
    self.owner endon("death_or_disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    if (!istrue(self.isalive)) {
        return;
    }
    while (self.targets.size > 0) {
        foreach (id, target in self.targets) {
            target = self.targets[id];
            endtime = self.endtimes[id];
            outlineid = self.outlineids[id];
            if (!isdefined(target) || !isreallyalive(target) || gettime() >= endtime) {
                namespace_cbd3754a0c69cc63::outlinedisable(outlineid, target);
                if (isdefined(target) && (isplayer(target) || isbot(target))) {
                    target namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
                }
                self.targets[id] = undefined;
                self.endtimes[id] = undefined;
                self.outlineids[id] = undefined;
            }
        }
        waitframe();
    }
    function_357b6df5a3d41e9c();
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaaf
// Size: 0xaf
function private function_357b6df5a3d41e9c() {
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

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb65
// Size: 0x25
function _hudoutlineviewmodeldisable() {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    if (!namespace_f8065cafc523dba5::_isalive()) {
        return;
    }
    self hudoutlineviewmodeldisable();
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb91
// Size: 0x72
function _hudoutlineviewmodelenable(hudoutlineassetname, var_dafd99b070fb282a) {
    if (!isdefined(var_dafd99b070fb282a)) {
        var_dafd99b070fb282a = 0;
    }
    if (!isplayer(self)) {
        /#
            assertmsg("Must be set on a player");
        #/
        return;
    }
    if (!var_dafd99b070fb282a && !namespace_f8065cafc523dba5::_isalive()) {
        /#
            assertmsg("Viewmodel outline cannot be set on dead players, to set on next spawn pass true as second param");
        #/
        return;
    }
    if (var_dafd99b070fb282a && !namespace_f8065cafc523dba5::_isalive()) {
        thread hudoutlineviewmodelenableonnextspawn(hudoutlineassetname);
        return;
    }
    self hudoutlineviewmodelenable(hudoutlineassetname);
}

// Namespace outline/namespace_cbd3754a0c69cc63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0a
// Size: 0x3d
function hudoutlineviewmodelenableonnextspawn(hudoutlineassetname) {
    level endon("game_ended");
    self waittill("spawned");
    if (!isdefined(self)) {
        return;
    }
    if (!namespace_f8065cafc523dba5::_isalive()) {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    self hudoutlineviewmodelenable(hudoutlineassetname);
}

