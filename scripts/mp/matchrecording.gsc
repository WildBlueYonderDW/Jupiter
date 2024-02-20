// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_2f8890c7d5191619;

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1f
// Size: 0x145
function init() {
    /#
        assertex(!isdefined(level.matchrecording_type), "matchRecording_init() already called");
    #/
    var_ca55ff9933d1c7f0 = matchrecording_getrecordingtype();
    if (!matchrecording_validaterecordingtype(var_ca55ff9933d1c7f0)) {
        return;
    } else {
        level.matchrecording_type = var_ca55ff9933d1c7f0;
    }
    level.matchreceventcountline = 0;
    level.matchrecevents = [];
    level.matchrecording_logevent = &matchrecording_logevent;
    level.matchrecording_logeventmsg = &matchrecording_logeventmsg;
    level.matchrecording_logeventplayername = &matchrecording_logeventplayername;
    level.matchrecording_dump = &matchrecording_dump;
    level.matchrecording_generateid = &matchrecording_generateid;
    level.matchrecording_usereventthink = &matchrecording_usereventthink;
    if (level.matchrecording_type == 1) {
        matchrecording_glog_addheader();
    } else if (level.matchrecording_type == 3) {
        matchrecording_scriptdata_openfileaddheader(1);
    }
    level thread matchrecording_logallplayerposthink();
    level thread matchrecording_onplayerconnect();
    level thread matchrecording_loggameendstats();
    level thread matchrecording_vehiclewatcher("matchrecording_ground_vehicle", "GROUND_VEHICLE");
    level thread matchrecording_vehiclewatcher("matchrecording_small_ground_vehicle", "SMALL_GROUND_VEHICLE");
    level thread matchrecording_vehiclewatcher("matchrecording_plane", "PLANE_VEHICLE");
    level thread matchrecording_vehiclewatcher("matchrecording_chopper", "CHOPPER_VEHICLE");
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b
// Size: 0x78
function matchrecording_getrecordingtype() {
    if (lpcfeaturegated() && getgametype() != "arm" && getgametype() != "conflict") {
        return 0;
    }
    type = getdvarint(@"hash_dbe4b78ae44499c8", 0);
    if (type == 0 && getdvarint(@"hash_b328f87e7c1ded21", 0) == 1) {
        type = 1;
    } else if (analyticsstreamerislogfilestreamingenabled()) {
        type = 1;
    }
    return type;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdeb
// Size: 0xdf
function matchrecording_validaterecordingtype(var_b0a68d1419f4b2a8) {
    result = 1;
    if (var_b0a68d1419f4b2a8 == 0) {
        result = 0;
    } else if (var_b0a68d1419f4b2a8 < 0 || var_b0a68d1419f4b2a8 > 4) {
        /#
            assertmsg("Match Recording type from DVAR scr_match_recording value should never be less than 0 or greater than 4. Value is: " + var_b0a68d1419f4b2a8);
        #/
        result = 0;
    } else if (var_b0a68d1419f4b2a8 == 3 || var_b0a68d1419f4b2a8 == 4) {
        var_1342032fe5b235a6 = 0;
        /#
            var_1342032fe5b235a6 = 1;
        #/
        if (!var_1342032fe5b235a6) {
            /#
                assertmsg("matchRecording set to script data file save mode while not in dev. This only works in dev. Recording type is: " + var_b0a68d1419f4b2a8);
            #/
            result = 0;
        }
    } else if (var_b0a68d1419f4b2a8 == 1 || var_b0a68d1419f4b2a8 == 2) {
        var_accdc2233ab9770 = getdvarint(@"hash_b328f87e7c1ded21", 0);
        var_5ae8370351e1a4a1 = analyticsstreamerislogfilestreamingenabled();
        result = var_accdc2233ab9770 == 1 || var_5ae8370351e1a4a1 == 1;
        /#
            assertex(result == 1, "Match Recording Type set to G Log but g_logEnable dvar is false.");
        #/
    }
    return result;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed2
// Size: 0x1c
function matchrecording_isenabled() {
    return isdefined(level.matchrecording_type) && level.matchrecording_type > 0;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef6
// Size: 0x53
function matchrecording_teammap(teamname) {
    if (isdefined(level.teambased) && !level.teambased) {
        result = 2;
    } else if (!isdefined(teamname) || teamname == "allies") {
        result = 2;
    } else {
        result = 3;
    }
    return result;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf51
// Size: 0x301
function matchrecording_eventcharmap(event) {
    var_96d176a367e72c83 = undefined;
    switch (event) {
    case #"hash_ec91d04aafaffe56":
        var_96d176a367e72c83 = "p";
        break;
    case #"hash_945fc291982ded18":
        var_96d176a367e72c83 = "s";
        break;
    case #"hash_f8c2554e05678a8d":
        var_96d176a367e72c83 = "d";
        break;
    case #"hash_8f7fd70c5987ea59":
        var_96d176a367e72c83 = "b";
        break;
    case #"hash_36c6169aaf0125a0":
        var_96d176a367e72c83 = "e";
        break;
    case #"hash_3819040083fb6294":
        var_96d176a367e72c83 = "t";
        break;
    case #"hash_8d9e20b710f779a7":
        var_96d176a367e72c83 = "l";
        break;
    case #"hash_3dd92e59bd6a825e":
        var_96d176a367e72c83 = "[";
        break;
    case #"hash_bfab0a97caa56709":
        var_96d176a367e72c83 = "]";
        break;
    case #"hash_15aa75e5faef833b":
        var_96d176a367e72c83 = "A";
        break;
    case #"hash_15aa76e5faef84ce":
        var_96d176a367e72c83 = "B";
        break;
    case #"hash_15aa77e5faef8661":
        var_96d176a367e72c83 = "C";
        break;
    case #"hash_15aa78e5faef87f4":
        var_96d176a367e72c83 = "D";
        break;
    case #"hash_15aa79e5faef8987":
        var_96d176a367e72c83 = "E";
        break;
    case #"hash_15aa84e5faef9ad8":
        var_96d176a367e72c83 = "0";
        break;
    case #"hash_15aa85e5faef9c6b":
        var_96d176a367e72c83 = "1";
        break;
    case #"hash_15aa86e5faef9dfe":
        var_96d176a367e72c83 = "2";
        break;
    case #"hash_15aa87e5faef9f91":
        var_96d176a367e72c83 = "3";
        break;
    case #"hash_15aa88e5faefa124":
        var_96d176a367e72c83 = "4";
        break;
    case #"hash_af78f78a213f2e9a":
        var_96d176a367e72c83 = "S";
        break;
    case #"hash_99264a563d62312b":
        var_96d176a367e72c83 = "O";
        break;
    case #"hash_77fea0649b41a0d5":
        var_96d176a367e72c83 = "!";
        break;
    case #"hash_30765763b6eae663":
        var_96d176a367e72c83 = "m";
        break;
    case #"hash_27bd18e3a64148c2":
        var_96d176a367e72c83 = "u";
        break;
    case #"hash_ebe8ddb545ee11c0":
        var_96d176a367e72c83 = "?";
        break;
    case #"hash_84e2df1e1e7795ee":
        var_96d176a367e72c83 = "n";
        break;
    case #"hash_5dad097e1ee588e":
        var_96d176a367e72c83 = "+";
        break;
    case #"hash_8eb45d501d18b819":
        var_96d176a367e72c83 = "^";
        break;
    case #"hash_faf31591468c0301":
        var_96d176a367e72c83 = "G";
        break;
    case #"hash_539e90ea786e44c5":
        var_96d176a367e72c83 = "g";
        break;
    case #"hash_bd9d4e183a058042":
        var_96d176a367e72c83 = "V";
        break;
    case #"hash_933571b34f210f5f":
        var_96d176a367e72c83 = "H";
        break;
    default:
        /#
            assertmsg("matchRecording_eventCharMap() passed invalid event type: " + event);
        #/
        break;
    }
    return var_96d176a367e72c83;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125a
// Size: 0x145
function matchrecording_getfileheaderarray() {
    array = [];
    array[array.size] = "<mrec_start> 
";
    array[array.size] = "<mrec_map> " + level.script + "
";
    array[array.size] = "<mrec_game_type> " + getgametype() + "
";
    array[array.size] = "<mrec_event_def> PATH p
";
    array[array.size] = "<mrec_event_def> PATH_SPAWN s
";
    array[array.size] = "<mrec_event_def> PATH_DEATH d
";
    array[array.size] = "<mrec_event_def> PATH_BULLET b
";
    array[array.size] = "<mrec_event_def> PATH_EXPLOSION e
";
    array[array.size] = "<mrec_event_def> ANCHOR t
";
    array[array.size] = "<mrec_event_def> GENERIC_LINE l 255,0,0,0
";
    array[array.size] = "<mrec_event_def> GENERIC_LINE [ 255,255,127,0
";
    array[array.size] = "<mrec_event_def> GENERIC_LINE ] 255,0,255,255
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE A flagA.tga flagAallies.tga flagAaxis.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE B flagB.tga flagBallies.tga flagBaxis.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE C flagC.tga flagCallies.tga flagCaxis.tga
";
    array[array.size] = "<mrec_event_def> SPAWN_ENTITY S
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE O flagAallies.tga flagAaxis.tga
";
    array[array.size] = "<mrec_event_def> LOG_MESSAGE ! "No good spawns found. Using bad spawn." 
";
    array[array.size] = "<mrec_event_def> LOG_MESSAGE m "MSG: " 
";
    array[array.size] = "<mrec_event_def> LOG_MESSAGE u "User Event From " 
";
    array[array.size] = "<mrec_event_def> LOG_MESSAGE ? "STAT: " 
";
    array[array.size] = "<mrec_event_def> PLAYER_NAME n
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE + bestSpawnAllies.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE ^ bestSpawnAxis.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE G blank.tga groundVehicleAllies.tga groundVehicleAxis.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE g blank.tga smallGroundVehicleAllies.tga smallGroundVehicleAxis.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE H blank.tga chopperAllies.tga chopperAxis.tga
";
    array[array.size] = "<mrec_event_def> GENERIC_IMAGE V blank.tga planeAllies.tga planeAxis.tga
";
    return array;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a7
// Size: 0x1d6
function matchrecording_logevent(var_619cf3736c12073, teamname, event, x, y, var_932081ff95e8cb30, var_eca15488bd96edf9, var_31ef7d754ebf53f, var_baa945e8fb3ba8aa) {
    if (!matchrecording_isenabled()) {
        return;
    }
    matchrecording_inceventlinecount();
    var_ac9bf40e02d1bfcf = matchrecording_teammap(teamname);
    xy = int(x) + "," + int(y);
    var_96d176a367e72c83 = matchrecording_eventcharmap(event);
    if (event == "BULLET" || event == "FRONT_LINE" || event == "FRONT_LINE_ALLIES" || event == "FRONT_LINE_AXIS") {
        /#
            assertex(isdefined(var_31ef7d754ebf53f) && isdefined(var_baa945e8fb3ba8aa), "matchRecording_logEvent() passed " + event + " event type without opXEnd and opYEnd values.");
        #/
    }
    var_3378306339a5aa51 = "";
    if (isdefined(var_eca15488bd96edf9)) {
        /#
            assertex(var_eca15488bd96edf9 == int(var_eca15488bd96edf9) && var_eca15488bd96edf9 >= 0, "matchRecording_logEvent() passes state index value that wasn't a positive integer.");
        #/
        var_3378306339a5aa51 = " s:" + var_eca15488bd96edf9;
    }
    var_a9e08ccaa418b973 = "";
    if (isdefined(var_31ef7d754ebf53f) && isdefined(var_baa945e8fb3ba8aa)) {
        var_a9e08ccaa418b973 = " " + int(var_31ef7d754ebf53f) + "," + int(var_baa945e8fb3ba8aa);
    }
    var_fdb35062cd12c096 = "|" + var_619cf3736c12073 + " " + var_ac9bf40e02d1bfcf + " " + var_96d176a367e72c83 + " " + xy + " " + var_932081ff95e8cb30 + var_a9e08ccaa418b973 + var_3378306339a5aa51;
    level.matchrecevents[level.matchrecevents.size - 1] = level.matchrecevents[level.matchrecevents.size - 1] + var_fdb35062cd12c096;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1584
// Size: 0xb4
function matchrecording_logeventmsg(event, var_932081ff95e8cb30, var_e377539688c48f4b) {
    if (!matchrecording_isenabled()) {
        return;
    }
    matchrecording_inceventlinecount();
    var_96d176a367e72c83 = matchrecording_eventcharmap(event);
    if (var_e377539688c48f4b != "") {
        if (!isdefined(var_e377539688c48f4b)) {
            var_e377539688c48f4b = "";
        } else {
            var_e377539688c48f4b = " "" + var_e377539688c48f4b + """;
        }
    }
    var_fdb35062cd12c096 = "|0 0 " + var_96d176a367e72c83 + " " + var_932081ff95e8cb30 + var_e377539688c48f4b;
    level.matchrecevents[level.matchrecevents.size - 1] = level.matchrecevents[level.matchrecevents.size - 1] + var_fdb35062cd12c096;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163f
// Size: 0xbc
function matchrecording_logeventplayername(ownerid, teamname, ownername) {
    if (!matchrecording_isenabled()) {
        return;
    }
    matchrecording_inceventlinecount();
    var_ac9bf40e02d1bfcf = matchrecording_teammap(teamname);
    var_96d176a367e72c83 = matchrecording_eventcharmap("PLAYER_NAME");
    var_fdb35062cd12c096 = "|" + ownerid + " " + var_ac9bf40e02d1bfcf + " " + var_96d176a367e72c83 + " " + """ + ownername + """;
    level.matchrecevents[level.matchrecevents.size - 1] = level.matchrecevents[level.matchrecevents.size - 1] + var_fdb35062cd12c096;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1702
// Size: 0xbc
function matchrecording_inceventlinecount() {
    level.matchreceventcountline++;
    if (level.matchrecevents.size == 0) {
        level.matchrecevents[level.matchrecevents.size] = "<mrec_events> ";
        level.matchreceventcountline = 0;
    } else if (level.matchreceventcountline > 30 || level.matchrecevents[level.matchrecevents.size - 1].size > 800) {
        if (level.matchrecording_type == 1 || level.matchrecording_type == 3) {
            matchrecording_dump();
        }
        level.matchrecevents[level.matchrecevents.size] = "<mrec_events> ";
        level.matchreceventcountline = 0;
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c5
// Size: 0xa8
function matchrecording_dump() {
    if (!matchrecording_isenabled()) {
        return;
    }
    if (!isdefined(level.matchrecevents) || level.matchrecevents.size == 0) {
        return;
    }
    switch (level.matchrecording_type) {
    case 1:
    case 2:
        matchrecording_glog_dump();
        break;
    case 3:
    case 4:
        matchrecording_scriptdata_dump();
        break;
    default:
        /#
            assertmsg("matchRecording_dump() handled invalid level.matchRecording_type: " + level.matchrecording_type);
        #/
        break;
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1874
// Size: 0x92
function matchrecording_glog_dump() {
    if (level.matchrecording_type == 2) {
        matchrecording_glog_addheader();
    }
    foreach (eventstr in level.matchrecevents) {
        logprint(eventstr + "
");
        if (analyticsstreamerislogfilestreamingenabled()) {
            analyticsstreamerlogfilewritetobuffer(eventstr + "
");
        }
    }
    level.matchrecevents = [];
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190d
// Size: 0x6f
function matchrecording_glog_addheader() {
    var_4bd127f7a6c73dd2 = matchrecording_getfileheaderarray();
    foreach (h in var_4bd127f7a6c73dd2) {
        logprint(h);
        if (analyticsstreamerislogfilestreamingenabled()) {
            analyticsstreamerlogfilewritetobuffer(h);
        }
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1983
// Size: 0x96
function matchrecording_scriptdata_openfilewrite() {
    /#
        /#
            assertex(!isdefined(level.var_ac13a3f4ca2c6c83), "E");
        #/
        level.var_ac13a3f4ca2c6c83 = "Event Logged" + level.script + "<unknown string>" + getgametype() + "<unknown string>" + namespace_eb72aa155b5e14e7::getmatchstarttimeutc() + "<unknown string>";
        fileid = openfile(level.var_ac13a3f4ca2c6c83, "<unknown string>");
        if (fileid == -1) {
            /#
                assertmsg("<unknown string>" + level.var_ac13a3f4ca2c6c83);
            #/
        }
        return fileid;
    #/
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a20
// Size: 0x63
function matchrecording_scriptdata_openfileappend() {
    /#
        if (!isdefined(level.var_ac13a3f4ca2c6c83)) {
            /#
                assertmsg("<unknown string>");
            #/
            return -1;
        }
        fileid = openfile(level.var_ac13a3f4ca2c6c83, "<unknown string>");
        if (fileid == -1) {
            /#
                assertmsg("<unknown string>" + level.var_ac13a3f4ca2c6c83);
            #/
        }
        return fileid;
    #/
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x8c
function matchrecording_scriptdata_openfileaddheader(var_5dceff890b44ad77) {
    /#
        fileid = matchrecording_scriptdata_openfilewrite();
        var_4bd127f7a6c73dd2 = matchrecording_getfileheaderarray();
        foreach (h in var_4bd127f7a6c73dd2) {
            fprintln(fileid, h);
        }
        if (var_5dceff890b44ad77) {
            fileid = closefile(fileid);
        }
        return fileid;
    #/
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1d
// Size: 0xd3
function matchrecording_scriptdata_dump() {
    /#
        fileid = -1;
        if (level.matchrecording_type == 4) {
            fileid = matchrecording_scriptdata_openfileaddheader(0);
        } else if (level.matchrecording_type == 3) {
            fileid = matchrecording_scriptdata_openfileappend();
        }
        if (fileid == -1) {
            return;
        }
        foreach (eventstr in level.matchrecevents) {
            fprintln(fileid, eventstr);
        }
        fileid = closefile(fileid);
        if (fileid == -1) {
            /#
                assertmsg("<unknown string>" + level.var_ac13a3f4ca2c6c83);
            #/
        }
        level.matchrecevents = [];
    #/
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf7
// Size: 0x110
function matchrecording_logallplayerposthink() {
    if (!matchrecording_isenabled()) {
        return;
    }
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        timestart = gettime();
        players = level.players;
        foreach (player in players) {
            time = gettime();
            if (isdefined(player) && isreallyalive(player)) {
                matchrecording_logevent(player.clientid, player.team, "PATH", player.origin[0], player.origin[1], time);
                waitframe();
            }
        }
        wait(max(level.framedurationseconds, 1.5 - (gettime() - timestart) / 1000));
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0e
// Size: 0x27
function matchrecording_onplayerconnect() {
    while (1) {
        player = level waittill("connected");
        player thread matchrecording_usereventthink();
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3c
// Size: 0x1f4
function matchrecording_loggameendstats() {
    level waittill("game_ended");
    sidekillcount = 0;
    var_25c32cef8be0663b = 0;
    var_176da9f1546c225 = 0;
    engagementcount = 0;
    var_e485e348b80ba43c = 0;
    foreach (player in level.players) {
        if (isdefined(player.sidekillcount)) {
            sidekillcount = player.sidekillcount;
        }
        if (isdefined(player.engagementcount)) {
            engagementcount = player.engagementcount;
        }
        if (isdefined(player.engagementtime)) {
            var_e485e348b80ba43c = player.engagementtime;
        }
    }
    if (engagementcount > 0) {
        matchrecording_logeventmsg("LOG_STAT", gettime(), "Shot in the back percent: " + sidekillcount / engagementcount * 100 + "%");
        matchrecording_logeventmsg("LOG_STAT", gettime(), "Avg. Engagement Length: " + var_e485e348b80ba43c / engagementcount / 1000 + "s");
    }
    if (isdefined(level.frontlineinfo) && isdefined(level.frontlineinfo.uptime) && isdefined(level.frontlineinfo.downtime)) {
        totaltime = level.frontlineinfo.uptime + level.frontlineinfo.downtime;
        if (totaltime > 0) {
            matchrecording_logeventmsg("LOG_STAT", gettime(), "Frontline Uptime: " + level.frontlineinfo.uptime / totaltime * 100 + "%");
        }
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f37
// Size: 0xa9
function matchrecording_usereventthink() {
    self endon("disconnect");
    level endon("game_ended");
    if (isai(self)) {
        return;
    }
    self notifyonplayercommand("log_user_event_start", "+actionslot 3");
    self notifyonplayercommand("log_user_event_end", "-actionslot 3");
    self notifyonplayercommand("log_user_event_generic_event", "+gostand");
    while (1) {
        self waittill("log_user_event_start");
        notification = waittill_any_return_no_endon_death_2("log_user_event_end", "log_user_event_generic_event");
        if (notification == "log_user_event_generic_event") {
            self iprintlnbold("Event Logged");
            matchrecording_logeventmsg("LOG_USER_EVENT", gettime(), self.name);
        }
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x33
function matchrecording_generateid() {
    if (!isdefined(game["matchRecording_nextID"])) {
        game["matchRecording_nextID"] = 100;
    }
    returnvalue = game["matchRecording_nextID"];
    game["matchRecording_nextID"]++;
    return returnvalue;
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2022
// Size: 0x3b
function matchrecording_vehiclewatcher(var_70687e0cc558a009, var_e8e12c0a3441ad85) {
    level endon("game_ended");
    while (1) {
        vehicle = level waittill(var_70687e0cc558a009);
        vehicle matchrecording_vehicletrackingthink(var_e8e12c0a3441ad85);
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2064
// Size: 0xc8
function matchrecording_vehicletrackingthink(var_e8e12c0a3441ad85) {
    level endon("game_ended");
    self endon("death");
    var_f794f29935653f3e = matchrecording_generateid();
    if (!isdefined(self.team)) {
        iprintln("MatchRecording - Can't log vehicle, because it has no team");
        return;
    }
    if (!isdefined(self.origin)) {
        iprintln("MatchRecording - Can't log vehicle, because it has no origin");
        return;
    }
    thread matchrecording_vehiclecleanupthink(var_f794f29935653f3e, var_e8e12c0a3441ad85);
    while (1) {
        state = ter_op(self.team == "allies", 1, 2);
        matchrecording_logevent(var_f794f29935653f3e, self.team, var_e8e12c0a3441ad85, self.origin[0], self.origin[1], gettime(), state);
        wait(0.25);
    }
}

// Namespace namespace_2f8890c7d5191619/namespace_dd65bffb586a92ba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2133
// Size: 0x39
function matchrecording_vehiclecleanupthink(logid, var_e8e12c0a3441ad85) {
    level endon("game_ended");
    self waittill("death");
    matchrecording_logevent(logid, "allies", var_e8e12c0a3441ad85, 0, 0, gettime(), 0);
}

