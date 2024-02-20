// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace hostmigration;

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f
// Size: 0x1d4
function callback_hostmigration() {
    level.hostmigrationreturnedplayercount = 0;
    if (level.gameended) {
        /#
            println("<unknown string>" + gettime() + "<unknown string>");
        #/
        return;
    }
    if (analyticsstreamerislogfilestreamingenabled()) {
        analyticsstreamerlogfilestartstream();
    }
    /#
        println("<unknown string>" + gettime());
    #/
    level thread hostmigrationconnectwatcher();
    foreach (character in level.characters) {
        character.hostmigrationcontrolsfrozen = 0;
    }
    level.hostmigrationtimer = 1;
    setdvar(@"hash_a8ee1540ced18a88", 1);
    level.hostmigration = 1;
    level notify("host_migration_begin");
    namespace_d576b6dc7cef9c62::updatetimerpausedness();
    foreach (character in level.characters) {
        if (!isdefined(character)) {
            continue;
        }
        character thread hostmigrationtimerthink();
        if (isplayer(character)) {
            character setclientomnvar("ui_session_state", character.sessionstate);
        }
    }
    level endon("host_migration_begin");
    hostmigrationwait();
    level.hostmigrationtimer = undefined;
    setdvar(@"hash_a8ee1540ced18a88", 0);
    /#
        println("<unknown string>" + gettime());
    #/
    visionsetthermal(game["thermal_vision"]);
    level.hostmigration = 0;
    level notify("host_migration_end");
    namespace_d576b6dc7cef9c62::updatetimerpausedness();
    level thread [[ level.updategameevents ]]();
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a
// Size: 0x4d
function hostmigrationconnectwatcher() {
    level endon("host_migration_end");
    level endon("host_migration_begin");
    player = level waittill("connected");
    player thread hostmigrationtimerthink();
    if (isplayer(player)) {
        player setclientomnvar("ui_session_state", player.sessionstate);
    }
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e
// Size: 0xeb
function hostmigrationwait() {
    level endon("game_ended");
    level.ingraceperiod = 25;
    thread namespace_d576b6dc7cef9c62::matchstarttimer("waiting_for_players", 20);
    hostmigrationwaitforplayers();
    level.ingraceperiod = 10;
    thread namespace_d576b6dc7cef9c62::matchstarttimer("match_resuming_in", 5);
    wait(5);
    level.ingraceperiod = 0;
    foreach (p in level.players) {
        p setclientomnvar("ui_match_start_countdown", 0);
        p setclientomnvar("ui_match_in_progress", 1);
    }
    if (istrue(level.forfeitinprogress) && !istrue(level.forfeit_aborted)) {
        setomnvar("ui_match_start_text", "opponent_forfeiting_in");
    }
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0xd
function hostmigrationwaitforplayers() {
    level endon("hostmigration_enoughplayers");
    wait(15);
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x594
// Size: 0xd3
function hostmigrationname(ent) {
    if (!isdefined(ent)) {
        return "<removed_ent>";
    }
    entnum = -1;
    entname = "?";
    if (isdefined(ent.entity_number)) {
        entnum = ent.entity_number;
    }
    if (isplayer(ent) && isdefined(ent.name)) {
        entname = ent.name;
    }
    if (isplayer(ent)) {
        return ("player <" + entname + ">");
    }
    if (isagent(ent) && namespace_36f464722d326bbe::isgameparticipant(ent)) {
        return ("participant agent <" + entnum + ">");
    }
    if (isagent(ent)) {
        return ("non-participant agent <" + entnum + ">");
    }
    return "unknown entity <" + entnum + ">";
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f
// Size: 0x8e
function hostmigrationtimerthink_internal() {
    level endon("host_migration_begin");
    level endon("host_migration_end");
    /#
        assertex(isdefined(self.hostmigrationcontrolsfrozen), "Not properly tracking controller frozen for " + hostmigrationname(self));
    #/
    while (!isreallyalive(self)) {
        self waittill("spawned");
    }
    /#
        println("<unknown string>" + hostmigrationname(self) + "<unknown string>" + self.hostmigrationcontrolsfrozen);
    #/
    self.hostmigrationcontrolsfrozen = 1;
    _freezecontrols(1, undefined, "hostMigrationTimer");
    level waittill("host_migration_end");
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x704
// Size: 0x9b
function hostmigrationtimerthink() {
    self endon("disconnect");
    /#
        assertex(isdefined(self.hostmigrationcontrolsfrozen), "Not properly tracking controller frozen for " + hostmigrationname(self));
    #/
    hostmigrationtimerthink_internal();
    /#
        assertex(isdefined(self.hostmigrationcontrolsfrozen), "Attempted to unfreeze controls for " + hostmigrationname(self));
    #/
    /#
        println("<unknown string>" + hostmigrationname(self) + "<unknown string>" + self.hostmigrationcontrolsfrozen);
    #/
    if (self.hostmigrationcontrolsfrozen) {
        _freezecontrols(0, undefined, "hostMigrationTimer");
        self.hostmigrationcontrolsfrozen = undefined;
    }
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a6
// Size: 0x31
function waittillhostmigrationdone() {
    if (!isdefined(level.hostmigrationtimer)) {
        return 0;
    }
    starttime = gettime();
    level waittill("host_migration_end");
    return gettime() - starttime;
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7df
// Size: 0x23
function waittillhostmigrationstarts(duration) {
    if (isdefined(level.hostmigrationtimer)) {
        return;
    }
    level endon("host_migration_begin");
    wait(duration);
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x809
// Size: 0x9c
function waitlongdurationwithhostmigrationpause(duration) {
    if (!isdefined(duration) || duration == 0) {
        return;
    }
    /#
        assert(duration > 0);
    #/
    starttime = gettime();
    endtime = gettime() + duration * 1000;
    while (gettime() < endtime) {
        waittillhostmigrationstarts((endtime - gettime()) / 1000);
        if (isdefined(level.hostmigrationtimer)) {
            timepassed = waittillhostmigrationdone();
            endtime = endtime + timepassed;
        }
    }
    waittillhostmigrationdone();
    return gettime() - starttime;
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad
// Size: 0xa0
function waittill_notify_or_timeout_hostmigration_pause(msg, duration) {
    self endon(msg);
    if (duration == 0) {
        return;
    }
    /#
        assert(duration > 0);
    #/
    starttime = gettime();
    endtime = gettime() + duration * 1000;
    while (gettime() < endtime) {
        waittillhostmigrationstarts((endtime - gettime()) / 1000);
        if (isdefined(level.hostmigrationtimer)) {
            timepassed = waittillhostmigrationdone();
            endtime = endtime + timepassed;
        }
    }
    waittillhostmigrationdone();
    return gettime() - starttime;
}

// Namespace hostmigration/namespace_e323c8674b44c8f4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x955
// Size: 0xb7
function waitlongdurationwithgameendtimeupdate(duration) {
    if (duration == 0) {
        return;
    }
    /#
        assert(duration > 0);
    #/
    starttime = gettime();
    endtime = gettime() + duration * 1000;
    while (gettime() < endtime) {
        waittillhostmigrationstarts((endtime - gettime()) / 1000);
        while (isdefined(level.hostmigrationtimer)) {
            endtime = endtime + 1000;
            setgameendtime(int(endtime));
            wait(1);
        }
    }
    while (isdefined(level.hostmigrationtimer)) {
        endtime = endtime + 1000;
        setgameendtime(int(endtime));
        wait(1);
    }
    return gettime() - starttime;
}

