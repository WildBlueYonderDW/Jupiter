// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\utility\player.gsc;

#namespace namespace_89315b05617ef689;

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3
// Size: 0x57
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

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141
// Size: 0x26
function dumplogsloop() {
    level endon("game_ended");
    while (1) {
        wait(1);
        cinematicreplayrecording_scriptdata_dump();
        level.cinematicreplaystringsconcat = [];
    }
}

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x2a
function recordplayerlogs() {
    level endon("game_ended");
    for (var_a062deae533a847b = 0; 1; var_a062deae533a847b++) {
        waitframe();
        logplayers(var_a062deae533a847b);
    }
}

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f
// Size: 0x96
function cinematicreplay_scriptdata_openfilewrite() {
    /#
        /#
            assertex(!isdefined(level.var_ac13a3f4ca2c6c83), "<unknown string>");
        #/
        level.var_bf3c698ca4fc6620 = "<unknown string>" + level.script + "<unknown string>" + getgametype() + "<unknown string>" + namespace_eb72aa155b5e14e7::getmatchstarttimeutc() + "<unknown string>";
        fileid = openfile(level.var_bf3c698ca4fc6620, "<unknown string>");
        if (fileid == -1) {
            /#
                assertmsg("<unknown string>" + level.var_bf3c698ca4fc6620);
            #/
        }
        return fileid;
    #/
}

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0xb9
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
            /#
                assertmsg("<unknown string>" + level.var_bf3c698ca4fc6620);
            #/
        }
    #/
}

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0x43
function onplayerspawned() {
    level endon("game_ended");
    for (;;) {
        player = level waittill("connected");
        player.shotrecord = [];
        player.hitrecord = [];
        player thread watchweaponusage();
    }
}

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x346
// Size: 0x84
function watchweaponusage(var_e9a9dc280d811788) {
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

// Namespace namespace_89315b05617ef689/namespace_6a29cf77f47f4ae5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x565
function logplayers(var_a062deae533a847b) {
    players = level.players;
    var_df1a8324a4e896ea = [];
    time = gettime();
    teamstring = "";
    if (players.size == 0) {
        return;
    }
    var_2320c6b8b9ea77a3 = int(4);
    var_fd4b2cd204c0386c = int(ceil(players.size / var_2320c6b8b9ea77a3));
    var_44795e4d2a9411b4 = int(var_a062deae533a847b % var_fd4b2cd204c0386c);
    for (i = 0; i < var_2320c6b8b9ea77a3; i++) {
        index = var_44795e4d2a9411b4 * var_2320c6b8b9ea77a3 + i;
        if (index >= players.size) {
            break;
        }
        player = players[index];
        if (isdefined(player) && namespace_7e17181d03156026::isreallyalive(player)) {
            teamstring = teamstring + "T " + player getentitynumber() + " " + player.team + " ";
            pos = int(player.origin[0]) + "," + int(player.origin[1]) + "," + int(player.origin[2]);
            angle = int(player.angles[0]) + "," + int(player.angles[1]) + "," + int(player.angles[2]);
            var_df1a8324a4e896ea[var_df1a8324a4e896ea.size] = "P " + time + " " + player getentitynumber() + " " + pos + " " + angle + " ";
            if (isdefined(player.hitrecord)) {
                foreach (hitrecord in player.hitrecord) {
                    var_7d075b312dfd80c5 = int(hitrecord.vpoint[0]) + "," + int(hitrecord.vpoint[1]) + "," + int(hitrecord.vpoint[2]);
                    var_deb4f36ceaea595c = int(hitrecord.vdir[0]) + "," + int(hitrecord.vdir[1]) + "," + int(hitrecord.vdir[2]);
                    var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1] = var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1] + "H " + time + " " + player getentitynumber() + " " + hitrecord.victim getentitynumber() + " " + var_7d075b312dfd80c5 + " " + var_deb4f36ceaea595c + " " + hitrecord.kill + " ";
                }
                player.hitrecord = [];
            }
            if (isdefined(player.shotrecord)) {
                foreach (shotrecord in player.shotrecord) {
                    var_7d075b312dfd80c5 = int(shotrecord.vpoint[0]) + "," + int(shotrecord.vpoint[1]) + "," + int(shotrecord.vpoint[2]);
                    var_deb4f36ceaea595c = int(shotrecord.vdir[0]) + "," + int(shotrecord.vdir[1]) + "," + int(shotrecord.vdir[2]);
                    var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1] = var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1] + "S " + time + " " + player getentitynumber() + " " + var_7d075b312dfd80c5 + " " + var_deb4f36ceaea595c + " ";
                }
                player.shotrecord = [];
            }
            var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1] = var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1] + "
";
            level.cinematicreplaystrings[level.cinematicreplaystrings.size] = var_df1a8324a4e896ea[var_df1a8324a4e896ea.size - 1];
        }
    }
    if (level.cinematicreplaystrings.size > 50) {
        var_8b2444d1a63048cc = teamstring;
        foreach (s in level.cinematicreplaystrings) {
            var_8b2444d1a63048cc = var_8b2444d1a63048cc + s;
        }
        level.cinematicreplaystrings = [];
        level.cinematicreplaystringsconcat[level.cinematicreplaystringsconcat.size] = var_8b2444d1a63048cc;
    }
}

