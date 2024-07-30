#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\utility\player.gsc;

#namespace namespace_89315b05617ef689;

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3
// Size: 0x56
function listenforcinematicreplaydumpcmd() {
    level endon("game_ended");
    /#
        setdevdvarifuninitialized(@"hash_357d41892beace43", 0);
    #/
    level.cinematic_replay_recording = 1;
    level.cinematicreplaystrings = [];
    level.cinematicreplaystringsconcat = [];
    level thread onplayerspawned();
    level thread recordplayerlogs();
    level thread dumplogsloop();
}

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141
// Size: 0x25
function dumplogsloop() {
    level endon("game_ended");
    while (true) {
        wait 1;
        cinematicreplayrecording_scriptdata_dump();
        level.cinematicreplaystringsconcat = [];
    }
}

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x29
function recordplayerlogs() {
    level endon("game_ended");
    for (logcounter = 0; true; logcounter++) {
        waitframe();
        logplayers(logcounter);
    }
}

/#

    // Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19f
    // Size: 0x95
    function cinematicreplay_scriptdata_openfilewrite() {
        assertex(!isdefined(level.var_ac13a3f4ca2c6c83), "<dev string:x1c>");
        level.var_bf3c698ca4fc6620 = "<dev string:x70>" + level.script + "<dev string:x94>" + getgametype() + "<dev string:x94>" + scripts\mp\matchdata::getmatchstarttimeutc() + "<dev string:x96>";
        fileid = openfile(level.var_bf3c698ca4fc6620, "<dev string:x9b>");
        if (fileid == -1) {
            assertmsg("<dev string:xa2>" + level.var_bf3c698ca4fc6620);
        }
        return fileid;
    }

#/

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0xb8
function cinematicreplayrecording_scriptdata_dump() {
    /#
        fileid = -1;
        var_9d2bd5edd00cbee2 = 3;
        var_6433283c218b01f1 = 4;
        fileid = cinematicreplay_scriptdata_openfilewrite();
        if (fileid == -1) {
            return;
        }
        foreach (s in level.cinematicreplaystringsconcat) {
            fprintln(fileid, s);
        }
        fileid = closefile(fileid);
        if (fileid == -1) {
            assertmsg("<dev string:xe4>" + level.var_bf3c698ca4fc6620);
        }
    #/
}

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0x42
function onplayerspawned() {
    level endon("game_ended");
    for (;;) {
        player = level waittill("connected");
        player.shotrecord = [];
        player.hitrecord = [];
        player thread watchweaponusage();
    }
}

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x346
// Size: 0x83
function watchweaponusage(weaponhand) {
    self endon("disconnect");
    self endon("faux_spawn");
    level endon("game_ended");
    for (;;) {
        objweapon = self waittill("weapon_fired");
        s = spawnstruct();
        s.vpoint = self.origin;
        s.vdir = self getgunangles();
        self.shotrecord[self.shotrecord.size] = s;
    }
}

// Namespace namespace_89315b05617ef689 / scripts\mp\cinematic_replays\cinematic_replays
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x564
function logplayers(logcounter) {
    players = level.players;
    playerstrings = [];
    time = gettime();
    teamstring = "";
    if (players.size == 0) {
        return;
    }
    var_2320c6b8b9ea77a3 = int(4);
    logsteps = int(ceil(players.size / var_2320c6b8b9ea77a3));
    playerset = int(logcounter % logsteps);
    for (i = 0; i < var_2320c6b8b9ea77a3; i++) {
        index = playerset * var_2320c6b8b9ea77a3 + i;
        if (index >= players.size) {
            break;
        }
        player = players[index];
        if (isdefined(player) && scripts\mp\utility\player::isreallyalive(player)) {
            teamstring += "T " + player getentitynumber() + " " + player.team + " ";
            pos = int(player.origin[0]) + "," + int(player.origin[1]) + "," + int(player.origin[2]);
            angle = int(player.angles[0]) + "," + int(player.angles[1]) + "," + int(player.angles[2]);
            playerstrings[playerstrings.size] = "P " + time + " " + player getentitynumber() + " " + pos + " " + angle + " ";
            if (isdefined(player.hitrecord)) {
                foreach (hitrecord in player.hitrecord) {
                    shotpos = int(hitrecord.vpoint[0]) + "," + int(hitrecord.vpoint[1]) + "," + int(hitrecord.vpoint[2]);
                    var_deb4f36ceaea595c = int(hitrecord.vdir[0]) + "," + int(hitrecord.vdir[1]) + "," + int(hitrecord.vdir[2]);
                    playerstrings[playerstrings.size - 1] = playerstrings[playerstrings.size - 1] + "H " + time + " " + player getentitynumber() + " " + hitrecord.victim getentitynumber() + " " + shotpos + " " + var_deb4f36ceaea595c + " " + hitrecord.kill + " ";
                }
                player.hitrecord = [];
            }
            if (isdefined(player.shotrecord)) {
                foreach (shotrecord in player.shotrecord) {
                    shotpos = int(shotrecord.vpoint[0]) + "," + int(shotrecord.vpoint[1]) + "," + int(shotrecord.vpoint[2]);
                    var_deb4f36ceaea595c = int(shotrecord.vdir[0]) + "," + int(shotrecord.vdir[1]) + "," + int(shotrecord.vdir[2]);
                    playerstrings[playerstrings.size - 1] = playerstrings[playerstrings.size - 1] + "S " + time + " " + player getentitynumber() + " " + shotpos + " " + var_deb4f36ceaea595c + " ";
                }
                player.shotrecord = [];
            }
            playerstrings[playerstrings.size - 1] = playerstrings[playerstrings.size - 1] + "\n";
            level.cinematicreplaystrings[level.cinematicreplaystrings.size] = playerstrings[playerstrings.size - 1];
        }
    }
    if (level.cinematicreplaystrings.size > 50) {
        var_8b2444d1a63048cc = teamstring;
        foreach (s in level.cinematicreplaystrings) {
            var_8b2444d1a63048cc += s;
        }
        level.cinematicreplaystrings = [];
        level.cinematicreplaystringsconcat[level.cinematicreplaystringsconcat.size] = var_8b2444d1a63048cc;
    }
}

