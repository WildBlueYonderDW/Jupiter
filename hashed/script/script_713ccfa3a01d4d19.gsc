// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using script_2b85a88a1d543a;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;

#namespace namespace_b925592dfbd5676e;

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364
// Size: 0x139
function function_15ec8dc28147b1b7(dvar, var_dc26843157970ecf, var_69a1727953025cb0, var_1c12350493547349) {
    name = getdvar(dvar, var_1c12350493547349);
    if (name == "") {
        /#
            iprintln("dlog_event_br_secondary_victory_sequence_start" + function_3c8848a3a11b2553(dvar) + "<unknown string>");
        #/
        return;
    }
    bundlename = function_2ef675c13ca1c4af(%"hash_62f18fdac9f4e251", name);
    bundle = getscriptbundle(bundlename);
    if (!isdefined(bundle)) {
        /#
            iprintln("<unknown string>" + function_3c8848a3a11b2553(dvar) + "<unknown string>" + name + "<unknown string>");
        #/
        return;
    }
    scriptid = bundle.scriptid;
    /#
        assert(!isdefined(level.var_db78248e94853165.missions[scriptid]));
    #/
    mission = spawnstruct();
    mission.var_dc26843157970ecf = var_dc26843157970ecf;
    mission.var_69a1727953025cb0 = var_69a1727953025cb0;
    mission.bundle = bundle;
    level.var_db78248e94853165.missions[scriptid] = mission;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4a4
// Size: 0x7a
function function_c254cf842cda3f9a(name, init, var_e3600233897b2abb) {
    if (!namespace_3460310ddf4d9cfa::init()) {
        return;
    }
    if (!isdefined(level.var_db78248e94853165.missions[name])) {
        return;
    }
    mission = level.var_db78248e94853165.missions[name];
    mission.init = init;
    mission.var_e3600233897b2abb = var_e3600233897b2abb;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x525
// Size: 0xf3
function function_6ab248769a99d7e7() {
    foreach (mission in level.var_db78248e94853165.missions) {
        if (isdefined(mission.init)) {
            bundle = mission.bundle;
            total = function_59a210af4334879b(bundle.total);
            xpbonus = function_59a210af4334879b(bundle.xpbonus);
            mission.total = total;
            mission.xpbonus = xpbonus;
            level [[ mission.var_69a1727953025cb0 ]](total);
            self [[ mission.init ]](bundle, total, xpbonus);
        }
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61f
// Size: 0xc5
function function_59a210af4334879b(valuearray) {
    maxteamsize = level.maxteamsize;
    value = undefined;
    teamsize = 0;
    foreach (entry in valuearray) {
        if (entry.teamsize <= maxteamsize && entry.teamsize > teamsize) {
            value = entry.value;
            teamsize = entry.teamsize;
        }
    }
    /#
        assert(isdefined(value));
    #/
    return value;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec
// Size: 0x118
function function_53cecc93d53fb16e() {
    foreach (team in getarraykeys(level.teamdata)) {
        if (team == "free" || team == "spectator" || team == "civilian") {
            continue;
        }
        if (isdefined(level.teamdata[team]["svData"])) {
            continue;
        }
        level.teamdata[team]["svData"] = function_a60ecadd669bf93c();
    }
    function_6ab248769a99d7e7();
    foreach (team in getarraykeys(level.teamdata)) {
        if (!isdefined(level.teamdata[team]["svData"])) {
            continue;
        }
        function_f7714705f9eb220a(team);
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80b
// Size: 0xa0
function function_fdd037317409179e(player) {
    var_394aebba88e4e8c2 = spawnstruct();
    var_394aebba88e4e8c2.var_ac665ed1902092ac = 0;
    var_394aebba88e4e8c2.inprogress = 0;
    var_394aebba88e4e8c2.team = player.team;
    var_394aebba88e4e8c2.name = player.team;
    var_394aebba88e4e8c2.player = player;
    var_394aebba88e4e8c2.trigger = undefined;
    var_394aebba88e4e8c2.var_86909aea6009b811 = undefined;
    var_394aebba88e4e8c2.var_97b85e39841505 = undefined;
    var_394aebba88e4e8c2.var_241735be4107a4fa = 0;
    return var_394aebba88e4e8c2;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b3
// Size: 0x39
function function_a60ecadd669bf93c() {
    var_cdde5178f529b641 = spawnstruct();
    var_cdde5178f529b641.points = [];
    var_cdde5178f529b641.awarded = 0;
    var_cdde5178f529b641.var_394aebba88e4e8c2 = undefined;
    return var_cdde5178f529b641;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f4
// Size: 0x43
function getteamdata(team) {
    /#
        assert(isdefined(team));
    #/
    /#
        assert(isdefined(level.teamdata[team]["svData"]));
    #/
    return level.teamdata[team]["svData"];
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93f
// Size: 0x71
function function_f7714705f9eb220a(team) {
    foreach (mission in getarraykeys(level.var_db78248e94853165.missions)) {
        function_d19de726f751683d(mission, team);
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x62
function function_d19de726f751683d(mission, team) {
    var_cdde5178f529b641 = getteamdata(team);
    value = function_7dded3913cebc59e(team, mission);
    if (istrue(var_cdde5178f529b641.awarded)) {
        return;
    }
    var_cdde5178f529b641.points[mission] = value;
    function_c9c2b5e426ae6ad2(mission, team, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa20
// Size: 0xac
function function_7dded3913cebc59e(team, mission) {
    var_16308019512af385 = level.var_db78248e94853165.missions[mission];
    players = function_bd20e9a0ec6025b0(team);
    value = 0;
    foreach (player in players) {
        value = value + player [[ var_16308019512af385.var_e3600233897b2abb ]]();
    }
    return value;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0xa5
function private function_c9c2b5e426ae6ad2(mission, team, value) {
    var_16308019512af385 = level.var_db78248e94853165.missions[mission];
    players = function_bd20e9a0ec6025b0(team);
    foreach (player in players) {
        player [[ var_16308019512af385.var_dc26843157970ecf ]](value);
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb80
// Size: 0x1d
function function_bd20e9a0ec6025b0(team) {
    return level.teamdata[team]["players"];
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba5
// Size: 0xd1
function function_160e85c84dcd9d28() {
    var_394aebba88e4e8c2 = self;
    /#
        assert(isdefined(var_394aebba88e4e8c2.team));
    #/
    /#
        assert(!isdefined(var_394aebba88e4e8c2.var_97b85e39841505));
    #/
    /#
        assert(!isdefined(var_394aebba88e4e8c2.var_86909aea6009b811));
    #/
    /#
        iprintln("<unknown string>");
    #/
    var_394aebba88e4e8c2.var_97b85e39841505 = namespace_52f6938dd902c7d0::createservertimer("default", 1.5, var_394aebba88e4e8c2.team);
    var_394aebba88e4e8c2.var_97b85e39841505 namespace_52f6938dd902c7d0::setpoint("CENTER", "CENTER", 0, -162);
    var_394aebba88e4e8c2.var_86909aea6009b811 = createhudelem(undefined, undefined, "CENTER", "CENTER", 0, -180, undefined, var_394aebba88e4e8c2.team);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc7d
// Size: 0x57
function function_51bee2f5b3b4e278(label, time) {
    var_394aebba88e4e8c2 = self;
    /#
        iprintln("<unknown string>");
    #/
    var_394aebba88e4e8c2.var_97b85e39841505 settimer(time);
    var_394aebba88e4e8c2.var_86909aea6009b811.label = label;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb
// Size: 0x3f
function function_f603ff66ab832cd7() {
    var_394aebba88e4e8c2 = self;
    /#
        iprintln("<unknown string>");
    #/
    var_394aebba88e4e8c2.var_97b85e39841505 reset();
    var_394aebba88e4e8c2.var_86909aea6009b811 reset();
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd21
// Size: 0x65
function function_5b5f3bdcf7429bdb() {
    var_394aebba88e4e8c2 = self;
    if (isdefined(var_394aebba88e4e8c2.var_97b85e39841505)) {
        var_394aebba88e4e8c2.var_97b85e39841505 destroy();
        var_394aebba88e4e8c2.var_97b85e39841505 = undefined;
    }
    if (isdefined(var_394aebba88e4e8c2.var_86909aea6009b811)) {
        var_394aebba88e4e8c2.var_86909aea6009b811 destroy();
        var_394aebba88e4e8c2.var_86909aea6009b811 = undefined;
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8d
// Size: 0x18a
function createhudelem(label, value, point, relativepoint, xoffset, yoffset, color, team) {
    fontscale = 1.5;
    if (isdefined(team)) {
        fontelem = newteamhudelem(team);
    } else {
        fontelem = newhudelem();
    }
    fontelem.elemtype = "font";
    fontelem.font = "default";
    fontelem.fontscale = fontscale;
    fontelem.basefontscale = fontscale;
    fontelem.x = 0;
    fontelem.y = 0;
    fontelem.width = 0;
    fontelem.height = int(level.fontheight * fontscale);
    fontelem.xoffset = 0;
    fontelem.yoffset = 0;
    fontelem.children = [];
    fontelem namespace_52f6938dd902c7d0::setparent(level.uiparent);
    fontelem.hidden = 0;
    fontelem.alpha = 1;
    fontelem namespace_52f6938dd902c7d0::setpoint(point, relativepoint, xoffset, yoffset);
    if (isdefined(label)) {
        fontelem.label = label;
    }
    if (isdefined(value)) {
        fontelem setvalue(value);
    }
    if (isdefined(color)) {
        fontelem.color = color;
    }
    return fontelem;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1f
// Size: 0x62
function function_74cdb6b6565f33a3(timer) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        var_3754da1f96fbaa7e = ter_op(timer > 0, 1, 0);
        player setclientomnvar("ui_is_exfil_countdown", var_3754da1f96fbaa7e);
        player setclientomnvar("ui_match_start_countdown", timer);
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf88
// Size: 0x27
function function_f3830638ad346e8e(var_f7b6cc6c062a7a43) {
    if (!isdefined(var_f7b6cc6c062a7a43) || var_f7b6cc6c062a7a43 == "") {
        return;
    }
    thread namespace_44abc05161e2e2cb::showsplash(var_f7b6cc6c062a7a43);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb6
// Size: 0x85
function function_92993664746f4afa(team, var_f7b6cc6c062a7a43) {
    if (!isdefined(var_f7b6cc6c062a7a43) || var_f7b6cc6c062a7a43 == "") {
        return;
    }
    foreach (teammember in level.teamdata[team]["players"]) {
        teammember thread namespace_44abc05161e2e2cb::showsplash(var_f7b6cc6c062a7a43);
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1042
// Size: 0x1a
function function_e237c61763516045(time) {
    if (isdefined(time) && time > 0) {
        wait(time);
    }
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1063
// Size: 0x2d
function function_6a694b8e45c2ca3c(dialog, team, delay) {
    namespace_d3d40f75bb4e4c32::brleaderdialogteam(dialog, team, undefined, delay, undefined, "dx_br_jpbm_");
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1097
// Size: 0x43
function function_3f39c7ace07c243() {
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname];
    dlog_recordevent("dlog_event_br_secondary_victory_init", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10e1
// Size: 0xfd
function function_a10e1586d7ecf252(price, var_a55d0a251e0ae6b2) {
    player = self;
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname, 4:"circle_index", 5:function_8c7948c2206bdba1(), 6:"price", 7:int(price), 8:"inventory", 9:var_a55d0a251e0ae6b2, 10:"x", 11:player.origin[0], 12:"y", 13:player.origin[1], 14:"z", 15:player.origin[2], 16:"team_name", 17:player.team];
    self dlog_recordplayerevent("dlog_event_br_secondary_victory_player_purchase", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11e5
// Size: 0xad
function function_a9b4c3bb4abb4a01(var_dd93477ef69fc30a, position) {
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname, 4:"circle_index", 5:function_8c7948c2206bdba1(), 6:"reason", 7:int(var_dd93477ef69fc30a), 8:"x", 9:position[0], 10:"y", 11:position[1], 12:"z", 13:position[2]];
    self dlog_recordplayerevent("dlog_event_br_secondary_victory_failure", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1299
// Size: 0xee
function function_4c04d9675ebe2f9f(team_name, team_size, position, avg_dist, chopper_time) {
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname, 4:"circle_index", 5:function_8c7948c2206bdba1(), 6:"team_name", 7:team_name, 8:"team_size", 9:team_size, 10:"x", 11:position[0], 12:"y", 13:position[1], 14:"z", 15:position[2], 16:"avg_dist", 17:avg_dist, 18:"chopper_time", 19:float(chopper_time)];
    dlog_recordevent("dlog_event_br_secondary_victory_sequence_start", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138e
// Size: 0xe2
function function_810f4a04a9253967(dist2d) {
    player = self;
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname, 4:"circle_index", 5:function_8c7948c2206bdba1(), 6:"team_name", 7:player.team, 8:"x", 9:player.origin[0], 10:"y", 11:player.origin[1], 12:"z", 13:player.origin[2], 14:"distance", 15:dist2d];
    self dlog_recordplayerevent("dlog_event_br_secondary_victory_player_start", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1477
// Size: 0x116
function function_b1c6ce7b2edc4ec2(position, team_name, team_count, var_5e076183a565c611, exfil_count, has_weapon_case, var_9d0643077dffd8f7) {
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname, 4:"circle_index", 5:function_8c7948c2206bdba1(), 6:"team_name", 7:team_name, 8:"team_count", 9:team_count, 10:"fully_extracted", 11:var_5e076183a565c611, 12:"exfil_count", 13:exfil_count, 14:"has_weapon_case", 15:has_weapon_case, 16:"ending_id", 17:var_9d0643077dffd8f7, 18:"x", 19:position[0], 20:"y", 21:position[1], 22:"z", 23:position[2]];
    dlog_recordevent("dlog_event_br_secondary_victory_sequence_end", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1594
// Size: 0xf8
function function_f35d9659b8af4887(chopper_team, has_weapon_case, var_9d0643077dffd8f7, position) {
    player = self;
    var_13fa4ee81d2d62c1 = [0:"playlist_name", 1:getplaylistname(), 2:"map_name", 3:level.mapname, 4:"circle_index", 5:function_8c7948c2206bdba1(), 6:"team_name", 7:player.team, 8:"chopper_team", 9:chopper_team, 10:"has_weapon_case", 11:has_weapon_case, 12:"ending_id", 13:var_9d0643077dffd8f7, 14:"x", 15:position[0], 16:"y", 17:position[1], 18:"z", 19:position[2]];
    self dlog_recordplayerevent("dlog_event_br_secondary_victory_player_exfil", var_13fa4ee81d2d62c1);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1693
// Size: 0x4b
function private function_8c7948c2206bdba1() {
    circleindex = -1;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
        circleindex = level.br_circle.circleindex;
    }
    return circleindex;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e6
// Size: 0x90
function function_751af1123571e361(team) {
    var_5e076183a565c611 = 1;
    players = level.teamdata[team]["players"];
    foreach (player in players) {
        if (!istrue(player.extracted)) {
            var_5e076183a565c611 = 0;
            break;
        }
    }
    return var_5e076183a565c611;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177e
// Size: 0x66
function function_1324ed2d881d301f() {
    index = level.var_db78248e94853165.var_ddb244800e3f1329;
    count = level.var_db78248e94853165.scriptbundle.var_8396ddb130a38012;
    index = (index + 1) % count;
    level.var_db78248e94853165.var_ddb244800e3f1329 = index;
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17eb
// Size: 0x36
function function_89db4cf4358b1915(value) {
    /#
        assert(isdefined(value) && (value == 0 || value == 1));
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 0, 1, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1828
// Size: 0x37
function function_3049b4b9d7489dca(value) {
    /#
        assert(isdefined(value) && (value == 0 || value == 1));
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 1, 1, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1866
// Size: 0x37
function function_7d3329c47fbe47f1(value) {
    /#
        assert(isdefined(value) && (value == 0 || value == 1));
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 2, 1, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a4
// Size: 0x37
function function_906084f03cbe16da(value) {
    /#
        assert(isdefined(value) && (value == 0 || value == 1));
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 3, 1, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18e2
// Size: 0x69
function function_cae7fc3d806ab9ce(value) {
    /#
        assert(isdefined(value) && 0 <= value && value <= 10230);
    #/
    /#
        assert(value % 10 == 0);
    #/
    /#
        assert(value / 10 == int(value / 10));
    #/
    value = int(value / 10);
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 4, 10, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1952
// Size: 0x37
function function_358c488f5ac3aff0(value) {
    /#
        assert(isdefined(value) && 0 <= value && value <= 31);
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 14, 5, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1990
// Size: 0x37
function function_4e4db1d859b3ecf9(value) {
    /#
        assert(isdefined(value) && 0 <= value && value <= 15);
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 19, 4, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19ce
// Size: 0x37
function function_ab628f99a7598153(value) {
    /#
        assert(isdefined(value) && 0 <= value && value <= 15);
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 23, 4, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0c
// Size: 0x37
function function_8f67cca8eec50569(value) {
    /#
        assert(isdefined(value) && 0 <= value && value <= 15);
    #/
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_br_sv_game1", 27, 4, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4a
// Size: 0x23
function function_e89fc0ef7d6123d9(value) {
    /#
        assert(isdefined(value));
    #/
    setomnvar("ui_br_sv_game2", value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a74
// Size: 0x23
function function_15e5e77836d740c2(value) {
    /#
        assert(isdefined(value));
    #/
    setomnvar("ui_br_sv_game3", value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9e
// Size: 0x43
function function_10da62a5050109ed(value) {
    /#
        assert(isdefined(value) && 0 <= value && value <= 31);
    #/
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_sv_client1", 0, 5, value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae8
// Size: 0x30
function function_b878acdc34c32bd(value) {
    /#
        assert(isdefined(value));
    #/
    player = self;
    player setclientomnvar("ui_br_sv_client2", value);
}

// Namespace namespace_b925592dfbd5676e/namespace_cee702b7292b0efb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1f
// Size: 0x30
function function_677a58693f27bb60(value) {
    /#
        assert(isdefined(value));
    #/
    player = self;
    player setclientomnvar("ui_br_sv_client3", value);
}

