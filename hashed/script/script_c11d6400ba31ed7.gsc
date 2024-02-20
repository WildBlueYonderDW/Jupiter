// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_f4e8d02d2f70888;

#namespace namespace_237d6a3c263cc39c;

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0xfc
function createsquad(squadname, var_5346a21915702367) {
    /#
        assertex(!isdefined(anim.squads[squadname]), "createSquad attempted to create a squad with the same name as an existing squad");
    #/
    squad = spawnstruct();
    squad.squadname = squadname;
    anim.squads[squadname] = squad;
    squad.team = getsquadteam(var_5346a21915702367);
    squad.members = [];
    squad.squadlist = [];
    squad.var_10d358f42e97ea = [];
    squad.squadid = anim.squadindex.size;
    anim.squadindex[squad.squadid] = squad;
    level notify("squad created " + squadname);
    anim notify("squad created " + squadname);
    if (isdefined(anim.var_417d31a4284fd63f)) {
        squad thread [[ anim.var_417d31a4284fd63f ]]();
    }
    /#
        squad thread function_1e0a52e0fce5e432();
    #/
    return squad;
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf
// Size: 0xf6
function deletesquad(squadname) {
    if (squadname == "axis" || squadname == "team3" || squadname == "allies" || squadname == "neutral") {
        return;
    }
    /#
        assertex(isdefined(anim.squads[squadname]), "deleteSquad attempted to delete a squad '" + squadname + "' that does not exist");
    #/
    squadid = anim.squads[squadname].squadid;
    squad = anim.squads[squadname];
    anim.squadindex[squadid] = anim.squadindex[anim.squadindex.size - 1];
    anim.squadindex[squadid].squadid = squadid;
    anim.squadindex[anim.squadindex.size - 1] = undefined;
    anim.squads[squadname] = undefined;
    anim notify("squad deleted " + squadname);
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc
// Size: 0x3c
function getsquadteam(var_5346a21915702367) {
    if (isdefined(var_5346a21915702367.team)) {
        squadteam = var_5346a21915702367.team;
    } else {
        squadteam = "allies";
    }
    return squadteam;
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x500
// Size: 0x149
function addtosquad(squadname) {
    /#
        assertex(issentient(self), "Attempted to add a non-sentient member to a squad");
    #/
    if (!isdefined(squadname)) {
        if (isdefined(self.script_squadname)) {
            squadname = self.script_squadname;
        } else {
            squadname = self.team;
        }
    }
    if (!isdefined(anim.squads[squadname])) {
        anim createsquad(squadname, self);
    }
    squad = anim.squads[squadname];
    if (isdefined(self.squad)) {
        if (self.squad == squad) {
            return;
        } else {
            removefromsquad(self.squad, self.squadid);
        }
    }
    self.lastenemysighttime = 0;
    self.combattime = 0;
    self.starttime = gettime();
    squad.var_f54c29e2793a21fb = function_53c4c53197386572(squad.var_f54c29e2793a21fb, 0);
    squadid = squad.var_f54c29e2793a21fb;
    squad.members[squadid] = self;
    squad.var_f54c29e2793a21fb++;
    self.squad = squad;
    self.squadid = squadid;
    thread namespace_2fdc8e343bfb2334::addtosystem();
    thread memberdeathwaiter(squad, squadid);
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x650
// Size: 0xd3
function removefromsquad(squad, squadid) {
    if (!isdefined(squad)) {
        return;
    }
    /#
        assertex(isdefined(squadid), "entity squadID is undefined - cannot remove from squad");
    #/
    if (isdefined(self)) {
        /#
            assertex(squad.members.size != 0, "Trying to remove a member from an empty squad!");
        #/
        /#
            assertex(squad.members[squadid] == self, "Trying to remove a member from a squad but the entity doesn't match the member at this squadID!");
        #/
    } else {
        /#
            assertex(!isdefined(squad.members[squadid]), "Trying to remove a removed entity member from a squad but the index has an entity defined!");
        #/
    }
    squad.members[squadid] = undefined;
    if (isdefined(self)) {
        thread namespace_2fdc8e343bfb2334::removefromsystem(squad);
    }
    if (squad.members.size == 0) {
        deletesquad(squad.squadname);
    }
    if (isdefined(self)) {
        self notify("removed from squad");
    }
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x72a
// Size: 0x44
function function_a5c82b8ba8a0c279(var_9cb951de1a571d32, var_f901ca059b18a27b, var_a4136d44ae0ef2de) {
    if (var_9cb951de1a571d32) {
        if (isfunction(var_f901ca059b18a27b)) {
            return [[ var_f901ca059b18a27b ]]();
        } else {
            return var_f901ca059b18a27b;
        }
    }
    if (isfunction(var_a4136d44ae0ef2de)) {
        return [[ var_a4136d44ae0ef2de ]]();
    } else {
        return var_a4136d44ae0ef2de;
    }
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x775
// Size: 0xa4
function function_1cb4f2ef6b07869c() {
    start_index = randomint(self.members.size);
    for (i = 0; i < self.members.size; i++) {
        index = (start_index + i) % self.members.size;
        guy = self.members[index];
        if (!isalive(guy) || !isdefined(guy.enemy) || !guy.bisincombat) {
            continue;
        }
    }
    return self.members[start_index];
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x821
// Size: 0x7b
function function_4e6e09a47e502152() {
    array = [];
    foreach (ai in getaiarray()) {
        if (isenemyteam(self.team, ai.team)) {
            array[array.size] = ai;
        }
    }
    return array;
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a4
// Size: 0x3d
function function_48706811c593324b() {
    return isdefined(self.enemy) && isdefined(self.enemy.node) && isdefined(self.enemy.covernode);
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e9
// Size: 0x14
function squadtracker() {
    anim endon("squad deleted " + self.squadname);
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x904
// Size: 0x46
function memberdeathwaiter(squad, squadid) {
    self endon("removed from squad");
    attacker = self waittill("death");
    if (isdefined(self)) {
        self.attacker = attacker;
    }
    removefromsquad(squad, squadid);
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x951
// Size: 0x217
function updateall() {
    neworigin = (0, 0, 0);
    var_217b7bee279e546d = (0, 0, 0);
    var_8bf9f8d903167b37 = 0;
    var_ea3b9998985b96f = undefined;
    isincombat = 0;
    var_d835c6cad3821c61 = !isdefined(self.enemy);
    if (!var_d835c6cad3821c61) {
        self.forward = vectornormalize(self.enemy.origin - self.origin);
    }
    foreach (member in self.members) {
        if (!isalive(member)) {
            continue;
        }
        var_8bf9f8d903167b37++;
        neworigin = neworigin + member.origin;
        if (var_d835c6cad3821c61) {
            var_217b7bee279e546d = var_217b7bee279e546d + anglestoforward(member.angles);
        }
        if (istrue(member.bisincombat)) {
            isincombat = 1;
        }
        if (isdefined(member.enemy) && isdefined(member.enemy.squad)) {
            if (!isdefined(var_ea3b9998985b96f)) {
                var_ea3b9998985b96f = member.enemy.squad;
            } else if (member.enemy.squad.members.size > var_ea3b9998985b96f.members.size) {
                var_ea3b9998985b96f = member.enemy.squad;
            }
        }
    }
    if (var_8bf9f8d903167b37) {
        self.origin = neworigin / var_8bf9f8d903167b37;
        if (var_d835c6cad3821c61) {
            self.forward = var_217b7bee279e546d / var_8bf9f8d903167b37;
        }
    } else {
        self.origin = undefined;
        if (var_d835c6cad3821c61) {
            self.forward = undefined;
        }
    }
    self.isincombat = isincombat;
    self.enemy = var_ea3b9998985b96f;
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6f
// Size: 0x14
function updatememberstates() {
    anim endon("squad deleted " + self.squadname);
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb8a
// Size: 0xf3
function aiupdatecombat(var_bc08e2b32a09ab5a) {
    if (!isdefined(self.combattime)) {
        return;
    }
    if (isdefined(self.lastenemysightpos)) {
        if (self.combattime < 0) {
            self.combattime = var_bc08e2b32a09ab5a;
        } else {
            self.combattime = self.combattime + var_bc08e2b32a09ab5a;
        }
        self.lastenemysighttime = gettime();
        return;
    } else if (isdefined(self.bt_escaping) && self.bt_escaping || isdefined(self.asmname) && self.asmname != "jackal" && self issuppressed()) {
        self.combattime = self.combattime + var_bc08e2b32a09ab5a;
        return;
    }
    if (self.combattime > 0) {
        self.combattime = 0 - var_bc08e2b32a09ab5a;
    } else {
        self.combattime = self.combattime - var_bc08e2b32a09ab5a;
    }
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc84
// Size: 0xc0
function aiupdatesuppressed(var_bc08e2b32a09ab5a) {
    if (!isdefined(self.suppressedtime)) {
        return;
    }
    if (isdefined(self.bt_escaping) && self.bt_escaping || isdefined(self.asmname) && self.asmname != "jackal" && self issuppressed()) {
        if (self.suppressedtime < 0) {
            self.suppressedtime = var_bc08e2b32a09ab5a;
        } else {
            self.suppressedtime = self.suppressedtime + var_bc08e2b32a09ab5a;
        }
        return;
    }
    if (self.suppressedtime > 0) {
        self.suppressedtime = 0 - var_bc08e2b32a09ab5a;
    } else {
        self.suppressedtime = self.suppressedtime - var_bc08e2b32a09ab5a;
    }
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4b
// Size: 0xd3
function function_1e0a52e0fce5e432() {
    /#
        if (getdvarint(@"hash_664a823c04104c0b") < 1) {
            return;
        }
        anim endon("<unknown string>" + self.squadname);
        while (1) {
            wait(0.05);
            function_11287c170b69b7f2(self.origin, self.forward);
            foreach (member in self.members) {
                if (!isalive(member)) {
                    continue;
                }
                line(self.origin, member.origin, (0.5, 0.5, 0.5));
            }
        }
    #/
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe25
// Size: 0xad
function function_11287c170b69b7f2(pos, forward) {
    /#
        angles = vectortoangles(forward);
        range = 100;
        forward = anglestoforward(angles) * range;
        right = anglestoright(angles) * range;
        up = anglestoup(angles) * range;
        _draw_arrow(pos, pos + forward, (1, 0, 0));
        _draw_arrow(pos, pos + up, (0, 1, 0));
        _draw_arrow(pos, pos + right, (0, 0, 1));
    #/
}

// Namespace namespace_237d6a3c263cc39c/namespace_fe5fbd2b56f035f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xed9
// Size: 0x10d
function _draw_arrow(start, end, color) {
    /#
        angle = vectortoangles(end - start);
        dist = length(end - start);
        forward = anglestoforward(angle);
        forwardfar = forward * dist;
        var_6d57df1b675794b6 = 5;
        forwardclose = forward * (dist - var_6d57df1b675794b6);
        right = anglestoright(angle);
        leftdraw = right * var_6d57df1b675794b6 * -1;
        rightdraw = right * var_6d57df1b675794b6;
        line(start, end, color, 1, 0, 1);
        line(start, start + forwardfar, color, 1, 0, 1);
        line(start + forwardfar, start + forwardclose + rightdraw, color, 1, 0, 1);
        line(start + forwardfar, start + forwardclose + leftdraw, color, 1, 0, 1);
    #/
}

