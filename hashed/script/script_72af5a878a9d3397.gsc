// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_59ff79d681bb860c;
#using script_40e63dd222434655;
#using script_26ccbfe3954cacf4;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_d74ae0b4aa21186;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_ccaa681806765e85;

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b
// Size: 0x110
function initialize() {
    var_4d445cd9f16875c6 = getdvarint(@"hash_98397926ff200d49", 0);
    logstring("Initialize BBA: enabled = " + var_4d445cd9f16875c6);
    if (!var_4d445cd9f16875c6) {
        return;
    }
    level.var_8a9762e276de8903 = spawnstruct();
    level.var_8a9762e276de8903.var_73db6de3fcdac953 = 0;
    level.var_8a9762e276de8903.var_6d3a3f51d84a3787 = getdvarint(@"hash_cdd059b09c8bb733", 5);
    level.var_8a9762e276de8903.var_d3eec3eac4c4ba7c = getdvarint(@"hash_9ee63ccca325c7f", 10);
    level.var_8a9762e276de8903.players = [];
    level.var_8a9762e276de8903.var_bb15506fa5411bfb = getdvarint(@"hash_e594acb63958e3d9", 1);
    level.var_8a9762e276de8903.var_605f3bd872dddfa6 = 0;
    level.var_fa280df6cfd09d0b = &function_627dd71448d7427;
    headerstr = "Header log_version=" + 13;
    function_8294c13e5683b0a3(headerstr);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742
// Size: 0xa
function function_627dd71448d7427() {
    function_3283fdac29887de();
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x753
// Size: 0x155
function function_3283fdac29887de() {
    if (!isenabled()) {
        return;
    }
    if (isdefined(self.var_ff1a8c6f49882fe8)) {
        return;
    }
    var_676624c5fe59606d = -1;
    if (isdefined(self.var_5876cd9fc14af731) && isdefined(self.var_5876cd9fc14af731.var_ff1a8c6f49882fe8)) {
        var_676624c5fe59606d = self.var_5876cd9fc14af731.var_ff1a8c6f49882fe8;
    } else {
        level.var_8a9762e276de8903.var_605f3bd872dddfa6 = level.var_8a9762e276de8903.var_605f3bd872dddfa6 + 1;
        var_676624c5fe59606d = level.var_8a9762e276de8903.var_605f3bd872dddfa6;
    }
    /#
        for (i = 0; i < level.players.size; i++) {
            checkplayer = level.players[i];
            if (self != checkplayer && isdefined(checkplayer.var_ff1a8c6f49882fe8) && checkplayer.var_ff1a8c6f49882fe8 == var_676624c5fe59606d) {
                msg = "PrematchEnd" + checkplayer.var_ff1a8c6f49882fe8;
                msg = msg + "pos" + checkplayer getentitynumber();
                msg = msg + "UpdatePlayerPos" + self getentitynumber();
                /#
                    assertmsg(msg);
                #/
            }
        }
    #/
    self.var_ff1a8c6f49882fe8 = var_676624c5fe59606d;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8af
// Size: 0xd
function isenabled() {
    return isdefined(level.var_8a9762e276de8903);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c4
// Size: 0x27
function function_27a7d2350b94908b() {
    if (getsubgametype() == "dmz") {
        return 0;
    }
    return level.var_8a9762e276de8903.var_bb15506fa5411bfb;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f3
// Size: 0xad
function start() {
    if (!isenabled()) {
        return;
    }
    function_d83afb9c3f95aa1c();
    thread function_f4946464d2c19da2();
    thread function_4f07546d6992cb73();
    thread function_cc9c6d5832692006();
    thread function_1578998a5633d1f();
    if (namespace_95d8d8ec67e3e074::isenabled() && function_27a7d2350b94908b()) {
        thread function_cc43ca415df582dd();
    }
    if (function_2734de2e57d0f37()) {
        thread function_c77b4d855737d7af();
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (istrue(level.var_34714ce799b6017)) {
            namespace_71073fa38f11492::registerbrgametypefunc("onPublicEvent", &function_8698937994d185d0);
        }
        namespace_71073fa38f11492::registerbrgametypefunc("onPlayerTeleport", &onPlayerTeleport);
        if (!istrue(level.br_circle_disabled)) {
            thread function_b9790b63a2eae9cc();
        }
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a7
// Size: 0x39
function function_2734de2e57d0f37() {
    if (getmaxagents() <= 0) {
        return 0;
    }
    gametype = getsubgametype();
    if (gametype == "dmz" || gametype == "ob") {
        return 1;
    }
    return 0;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8
// Size: 0x71
function onMarkPlayerAsEliminated(player, eliminated) {
    if (!isenabled()) {
        return;
    }
    var_45668c725dc52275 = [];
    var_41b371ca46e67bfe = function_d48694033481cf25(player);
    if (function_3226093417bd3363(var_41b371ca46e67bfe, "eliminated", eliminated)) {
        var_45668c725dc52275["id"] = function_d1f5ff62271c92fe(player);
        var_45668c725dc52275["eliminated"] = eliminated;
        function_4603aa41477ca54d("UpdatePlayer", var_45668c725dc52275);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa60
// Size: 0x96
function function_8698937994d185d0(eventtype, var_d24790a0c26139fd) {
    var_45668c725dc52275 = [];
    eventname = undefined;
    if (isstring(eventtype)) {
        eventname = eventtype;
    } else {
        eventname = namespace_d76af9f804655767::function_b73e6fcfacc71afd(eventtype);
        var_32c77bcdff8bc3 = "CONST_BR_PE_TYPE_";
        if (string_starts_with(eventname, var_32c77bcdff8bc3)) {
            eventname = getsubstr(eventname, var_32c77bcdff8bc3.size, eventname.size);
        }
    }
    var_45668c725dc52275["name"] = function_905e60070f3e3cbf(eventname);
    var_45668c725dc52275["status"] = function_905e60070f3e3cbf(var_d24790a0c26139fd);
    function_4603aa41477ca54d("PublicEvent", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafd
// Size: 0xc4
function function_1578998a5633d1f() {
    level endon("game_ended");
    while (1) {
        part = modelindex = offsettime = hitloc = dir = point = var_fcdf19e3cdd29669 = objweapon = meansofdeath = flags = damage = victim = attacker = inflictor = level waittill("post_player_damaged");
        function_433af73a108eec49(victim, attacker, meansofdeath, damage, hitloc);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc8
// Size: 0x161
function function_f6c977ad89f51b9c(mapname, mapcorners, minz, maxz) {
    if (!isenabled()) {
        return;
    }
    minz = function_53c4c53197386572(minz, 0);
    maxz = function_53c4c53197386572(maxz, 0);
    northwest = mapcorners[0].origin;
    southeast = mapcorners[1].origin;
    var_dfc0bf2eb51e62c9 = (northwest[0], northwest[1], minz);
    var_df9db12eb4f7fc47 = (southeast[0], southeast[1], maxz);
    northyaw = getnorthyaw();
    x = cos(northyaw);
    y = sin(northyaw);
    var_80e6c77f14f3b358 = 1.19209e-07;
    if (abs(x) <= var_80e6c77f14f3b358) {
        x = 0;
    }
    if (abs(y) <= var_80e6c77f14f3b358) {
        y = 0;
    }
    var_d1e567a2651b793f = function_cd70b8fa232889f5(x, y);
    mapname = function_905e60070f3e3cbf(mapname);
    function_2a02755326c9546a("LoadMap", [0:"name", 1:mapname, 2:"min", 3:var_dfc0bf2eb51e62c9, 4:"max", 5:var_df9db12eb4f7fc47, 6:"north", 7:var_d1e567a2651b793f]);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd30
// Size: 0xb1
function function_d83afb9c3f95aa1c() {
    if (isdefined(level.gulag) && isdefined(level.gulag.arenas)) {
        gulagNum = level.gulag.arenas.size;
    } else {
        gulagNum = 0;
    }
    gametypestr = function_905e60070f3e3cbf(getsubgametype());
    matchid = function_905e60070f3e3cbf(function_94c7ae7049488358());
    function_2a02755326c9546a("GameStart", [0:"gameType", 1:gametypestr, 2:"gulagNum", 3:gulagNum, 4:"matchId", 5:matchid]);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde8
// Size: 0xd1
function function_f4946464d2c19da2() {
    var_dd5bffa6fd9d6915 = [0:"start_prematch", 1:"prematch_over", 2:"game_ended", 3:"gulag_closed", 4:"respawn_disabled"];
    while (1) {
        msg = waittill_any_in_array_return(var_dd5bffa6fd9d6915);
        if (msg == "start_prematch") {
            function_2a02755326c9546a("PrematchStart");
        } else if (msg == "prematch_over") {
            function_2a02755326c9546a("PrematchEnd");
        } else if (msg == "game_ended") {
            function_2a02755326c9546a("GameEnd");
            return;
        } else if (msg == "gulag_closed") {
            function_2a02755326c9546a("GulagClose");
        } else if (msg == "respawn_disabled") {
            function_2a02755326c9546a("RespawnDisabled");
        }
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec0
// Size: 0x259
function function_cc9c6d5832692006() {
    level endon("game_ended");
    while (1) {
        player = level waittill("player_spawned");
        var_45668c725dc52275 = [];
        var_41b371ca46e67bfe = function_d48694033481cf25(player);
        if (isbot(player)) {
            if (function_3226093417bd3363(var_41b371ca46e67bfe, "name", player.name)) {
                var_45668c725dc52275["name"] = function_905e60070f3e3cbf(player.name);
            }
        } else {
            unoid = player function_7a32b0201993d7f7();
            /#
                assert(unoid != "");
            #/
            if (function_3226093417bd3363(var_41b371ca46e67bfe, "unoId", unoid)) {
                var_45668c725dc52275["unoId"] = function_905e60070f3e3cbf(unoid);
            }
        }
        if (function_3226093417bd3363(var_41b371ca46e67bfe, "team", player.team)) {
            var_45668c725dc52275["team"] = function_905e60070f3e3cbf(player.team);
        }
        if (isbot(player)) {
            difficulty = player botgetdifficulty();
            if (function_3226093417bd3363(var_41b371ca46e67bfe, "difficulty", difficulty)) {
                var_45668c725dc52275["difficulty"] = function_905e60070f3e3cbf(difficulty);
            }
        }
        if (isdefined(player.origin)) {
            var_45668c725dc52275["spawnPos"] = player.origin;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            var_45668c725dc52275["gulagId"] = player.arena.gulagindex;
            function_3226093417bd3363(var_41b371ca46e67bfe, "gulagId", player.arena.gulagindex);
        } else {
            function_3226093417bd3363(var_41b371ca46e67bfe, "gulagId", -1);
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            isGhost = player namespace_d3d40f75bb4e4c32::function_f5446040a93792c3();
            if (function_3226093417bd3363(var_41b371ca46e67bfe, "ghost", isGhost)) {
                var_45668c725dc52275["ghost"] = isGhost;
            }
        }
        if (function_3226093417bd3363(var_41b371ca46e67bfe, "health", player.health)) {
            var_45668c725dc52275["health"] = player.health;
        }
        var_45668c725dc52275["direction"] = function_9f601132ee8804e7(player);
        if (var_45668c725dc52275.size > 0) {
            var_45668c725dc52275["id"] = function_d1f5ff62271c92fe(player);
            function_4603aa41477ca54d("UpdatePlayer", var_45668c725dc52275);
        }
        if (isbot(player)) {
            player thread function_6d7e0cdc4f3e194a();
            player thread function_db80608d78c406b1();
        }
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1120
// Size: 0x47
function function_d48694033481cf25(player) {
    /#
        assert(isplayer(player));
    #/
    var_676624c5fe59606d = function_c1fb465742657a02(player);
    if (!isdefined(var_676624c5fe59606d)) {
        var_676624c5fe59606d = "bad_" + player getentitynumber();
    }
    return function_c6c4818485d70ffe(var_676624c5fe59606d);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116f
// Size: 0x6a
function function_c6c4818485d70ffe(var_676624c5fe59606d) {
    var_41b371ca46e67bfe = level.var_8a9762e276de8903.players[var_676624c5fe59606d];
    if (!isdefined(var_41b371ca46e67bfe)) {
        var_41b371ca46e67bfe = spawnstruct();
        var_41b371ca46e67bfe.id = var_676624c5fe59606d;
        var_41b371ca46e67bfe.props = [];
        level.var_8a9762e276de8903.players[var_676624c5fe59606d] = var_41b371ca46e67bfe;
    }
    return var_41b371ca46e67bfe;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x5e
function function_3226093417bd3363(var_41b371ca46e67bfe, key, value) {
    /#
        assert(isdefined(var_41b371ca46e67bfe));
    #/
    if (isdefined(var_41b371ca46e67bfe.props[key]) && var_41b371ca46e67bfe.props[key] == value) {
        return 0;
    }
    var_41b371ca46e67bfe.props[key] = value;
    return 1;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1247
// Size: 0xef
function function_6d7e0cdc4f3e194a() {
    self endon("death");
    while (1) {
        self waittill("bot_difficulty_updated");
        var_676624c5fe59606d = function_c1fb465742657a02(self);
        /#
            assert(isdefined(var_676624c5fe59606d));
        #/
        if (!isdefined(var_676624c5fe59606d) || !function_371e37cb66601d58(self) || !isdefined(level.var_8a9762e276de8903.players[var_676624c5fe59606d])) {
            continue;
        }
        str = "";
        difficulty = self botgetdifficulty();
        var_41b371ca46e67bfe = function_d48694033481cf25(self);
        if (function_3226093417bd3363(var_41b371ca46e67bfe, "difficulty", difficulty)) {
            str = str + ";difficulty=" + function_905e60070f3e3cbf(difficulty);
        }
        if (str.size > 0) {
            playername = function_d1f5ff62271c92fe(self);
            str = "id=" + playername + str;
            function_35cb42962526710e("UpdatePlayer", [0:str]);
        }
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133d
// Size: 0x3f
function function_db80608d78c406b1() {
    self endon("death_or_disconnect");
    var_dd5bffa6fd9d6915 = [0:"bot_action_start", 1:"bot_action_end"];
    while (1) {
        waittill_any_in_array_return(var_dd5bffa6fd9d6915);
        function_d707f8de7d23362d();
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1383
// Size: 0x148
function function_b1c37e649a5cd380(to, from) {
    if (!isenabled()) {
        return;
    }
    var_ff1a8c6f49882fe8 = undefined;
    var_89a675c5bde8848f = self.var_5876cd9fc14af731;
    if (!isdefined(var_89a675c5bde8848f)) {
        /#
            assert(isdefined(self.var_ff1a8c6f49882fe8));
        #/
        var_ff1a8c6f49882fe8 = self.var_ff1a8c6f49882fe8;
    } else {
        var_ff1a8c6f49882fe8 = var_89a675c5bde8848f.var_ff1a8c6f49882fe8;
    }
    if (!isdefined(from)) {
        from = "active";
        if (namespace_95d8d8ec67e3e074::function_d012729eac1e7053()) {
            from = "dormant";
        } else if (namespace_95d8d8ec67e3e074::isUIBot()) {
            from = "uibot";
        }
    }
    if (from == to) {
        return;
    }
    var_45668c725dc52275 = [];
    var_45668c725dc52275["id"] = function_592c6f38a6569fec(var_ff1a8c6f49882fe8, 1);
    var_45668c725dc52275["from"] = function_905e60070f3e3cbf(from);
    var_45668c725dc52275["to"] = function_905e60070f3e3cbf(to);
    if (to == "active" && from == "uibot") {
        /#
            assert(isdefined(self.origin));
        #/
        var_45668c725dc52275["pos"] = self.origin;
    }
    var_41b371ca46e67bfe = function_d48694033481cf25(self);
    function_3226093417bd3363(var_41b371ca46e67bfe, "botStatus", to);
    function_4603aa41477ca54d("UpdateBotStatus", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d2
// Size: 0xbf
function function_1968d5899aa0a0cb(var_89a675c5bde8848f, to, from) {
    if (!isenabled()) {
        return;
    }
    /#
        assert(isdefined(var_89a675c5bde8848f) && isdefined(var_89a675c5bde8848f.var_ff1a8c6f49882fe8));
    #/
    var_676624c5fe59606d = var_89a675c5bde8848f.var_ff1a8c6f49882fe8;
    var_45668c725dc52275 = [];
    var_45668c725dc52275["id"] = function_592c6f38a6569fec(var_676624c5fe59606d, 1);
    var_45668c725dc52275["from"] = function_905e60070f3e3cbf(from);
    var_45668c725dc52275["to"] = function_905e60070f3e3cbf(to);
    var_41b371ca46e67bfe = function_c6c4818485d70ffe(var_676624c5fe59606d);
    function_3226093417bd3363(var_41b371ca46e67bfe, "botStatus", to);
    function_4603aa41477ca54d("UpdateBotStatus", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1598
// Size: 0x1f7
function function_d707f8de7d23362d() {
    var_c38fcea73953365e = self.Mind.var_c38fcea73953365e;
    var_45668c725dc52275 = [];
    var_45668c725dc52275["id"] = function_d1f5ff62271c92fe(self);
    var_21b72418e16677fb = namespace_56b9cc3deb6e3f5e::function_e60ece723e993125(self.Mind.var_f0a8822dcc782c9d.var_577f45571c039a54);
    var_b2056d26cc9eaa76 = min(var_21b72418e16677fb.size, 3);
    for (i = 0; i < var_b2056d26cc9eaa76; i++) {
        decision = var_21b72418e16677fb[i];
        key = "decision" + i;
        description = "";
        if (isdefined(decision.var_df9d35d9b4bee654) && isdefined(decision.var_df9d35d9b4bee654.description) && decision.var_df9d35d9b4bee654.description.size > 0) {
            description = decision.var_df9d35d9b4bee654.description;
        } else {
            description = decision.name;
        }
        str = function_905e60070f3e3cbf(decision.score + "/" + description);
        var_45668c725dc52275[key] = str;
    }
    for (i = 0; i < var_c38fcea73953365e.actions.size; i++) {
        action = var_c38fcea73953365e.actions[i];
        key = "action" + i;
        str = function_905e60070f3e3cbf(action.description);
        var_45668c725dc52275[key] = str;
        if (isdefined(action.lastError)) {
            var_45668c725dc52275["lastError" + i] = function_905e60070f3e3cbf(action.lastError);
        }
    }
    var_45668c725dc52275["direction"] = function_9f601132ee8804e7(self);
    function_4603aa41477ca54d("UpdateBotMind", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1796
// Size: 0x126
function function_4f07546d6992cb73() {
    level endon("game_ended");
    while (1) {
        var_5b234f9ff418f161 = [];
        var_892c7a42be39e66 = [];
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (!function_371e37cb66601d58(player) || player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                continue;
            }
            var_676624c5fe59606d = function_c1fb465742657a02(player);
            if (!isdefined(var_676624c5fe59606d)) {
                /#
                    assert(isdefined(var_676624c5fe59606d));
                #/
            } else {
                playername = function_d1f5ff62271c92fe(player);
                str = "id=" + playername + ";pos=" + function_dccbddf82525092d(player) + ";direction=" + function_9f601132ee8804e7(player);
                var_892c7a42be39e66[var_676624c5fe59606d] = player;
                var_5b234f9ff418f161[var_5b234f9ff418f161.size] = str;
            }
        }
        if (var_5b234f9ff418f161.size > 0) {
            function_35cb42962526710e("UpdatePlayerPos", var_5b234f9ff418f161);
        }
        if (function_27a7d2350b94908b()) {
            function_170e36088569c2a5(var_892c7a42be39e66);
        }
        wait(level.var_8a9762e276de8903.var_6d3a3f51d84a3787);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c3
// Size: 0x90
function onPlayerTeleport(player, prevpos, teleportPos, reason) {
    if (!isenabled()) {
        return;
    }
    if (!function_371e37cb66601d58(player, 1) || player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    var_45668c725dc52275 = [];
    var_45668c725dc52275["id"] = function_d1f5ff62271c92fe(player);
    var_45668c725dc52275["pos"] = prevpos;
    var_45668c725dc52275["teleportPos"] = teleportPos;
    var_45668c725dc52275["teleportReason"] = function_905e60070f3e3cbf(reason);
    function_4603aa41477ca54d("UpdatePlayerPos", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195a
// Size: 0x37
function function_371e37cb66601d58(player, var_fd412339838644d8) {
    return function_ded80385ea7471db(player) && !player isEliminated() && (istrue(var_fd412339838644d8) || !player namespace_95d8d8ec67e3e074::isUIBot());
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1999
// Size: 0x21
function function_9f601132ee8804e7(player) {
    return vectornormalize(anglestoforward(player.angles));
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c2
// Size: 0x3c
function function_dccbddf82525092d(player) {
    if (isdefined(player.c130)) {
        return player.c130.origin;
    }
    return player.origin;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a06
// Size: 0xe7
function function_cc43ca415df582dd() {
    level endon("game_ended");
    wait(1);
    while (1) {
        wait(level.var_8a9762e276de8903.var_6d3a3f51d84a3787);
        var_156f390a5362bc55 = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
        var_5b234f9ff418f161 = [];
        foreach (bot in var_156f390a5362bc55) {
            var_c177f509325adbf = function_592c6f38a6569fec(bot.var_ff1a8c6f49882fe8, 1);
            str = "id=" + var_c177f509325adbf + ";name=" + function_905e60070f3e3cbf(bot.name);
            var_5b234f9ff418f161[var_5b234f9ff418f161.size] = str;
        }
        function_35cb42962526710e("DebugUpdateUIBots", var_5b234f9ff418f161);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af4
// Size: 0x111
function function_c77b4d855737d7af() {
    level endon("game_ended");
    while (!isdefined(level.agentarray)) {
        waitframe();
    }
    var_d69ac11220fdb07e = 1;
    while (1) {
        var_5b234f9ff418f161 = [];
        foreach (agent in level.agentarray) {
            if (isalive(agent)) {
                agentname = function_62945c3d6792d0ee(agent);
                str = "id=" + agentname + ";pos=" + agent.origin;
                var_5b234f9ff418f161[var_5b234f9ff418f161.size] = str;
            }
        }
        if (var_5b234f9ff418f161.size > 0) {
            var_d69ac11220fdb07e = 0;
            function_35cb42962526710e("UpdateAgentPos", var_5b234f9ff418f161);
        } else {
            if (!var_d69ac11220fdb07e) {
                function_35cb42962526710e("UpdateAgentPos");
            }
            var_d69ac11220fdb07e = 1;
        }
        wait(level.var_8a9762e276de8903.var_6d3a3f51d84a3787);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0c
// Size: 0x7d
function function_b9790b63a2eae9cc() {
    level endon("game_ended");
    var_61c7c88e85221081 = [0:"br_circle_set", 1:"br_circle_started", 2:"br_circle_closed", 3:"circle_paused", 4:"circle_unpaused"];
    while (1) {
        waittill_any_in_array_or_timeout(var_61c7c88e85221081, level.var_8a9762e276de8903.var_d3eec3eac4c4ba7c);
        if (!isdefined(level.br_circle)) {
            continue;
        }
        function_11bf09a7197d1290();
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c90
// Size: 0x1dd
function function_11bf09a7197d1290() {
    circleindex = level.br_circle.circleindex;
    if (!isdefined(circleindex) || circleindex < 0) {
        return;
    }
    if (istrue(level.var_2df69b8e552238b6) && isdefined(level.br_multi_circle)) {
        for (index = 0; index < level.br_multi_circle.var_209967c144016964; index++) {
            var_e681932897d7f299 = namespace_bbc79db4c3949a5c::function_755c691f70eafe3b(index);
            var_e681932897d7f299 = function_cd70b8fa232889f5(var_e681932897d7f299[0], var_e681932897d7f299[1]);
            circleradius = namespace_bbc79db4c3949a5c::function_a835b5dff878f77(index);
            targetpos = namespace_bbc79db4c3949a5c::function_799fe4ee850f911(index);
            targetpos = function_cd70b8fa232889f5(targetpos[0], targetpos[1]);
            var_154ef61b7a7f747a = namespace_bbc79db4c3949a5c::function_8a985543e6853bbd(index);
            function_2a02755326c9546a("UpdateCircle", [0:"id", 1:circleindex, 2:"circle_id", 3:index, 4:"pos", 5:var_e681932897d7f299, 6:"radius", 7:circleradius, 8:"target_pos", 9:targetpos, 10:"target_radius", 11:var_154ef61b7a7f747a]);
        }
    } else {
        var_e681932897d7f299 = namespace_c5622898120e827f::getdangercircleorigin();
        var_e681932897d7f299 = function_cd70b8fa232889f5(var_e681932897d7f299[0], var_e681932897d7f299[1]);
        circleradius = namespace_c5622898120e827f::getdangercircleradius();
        targetpos = namespace_c5622898120e827f::getsafecircleorigin();
        targetpos = function_cd70b8fa232889f5(targetpos[0], targetpos[1]);
        var_154ef61b7a7f747a = namespace_c5622898120e827f::getsafecircleradius();
        function_2a02755326c9546a("UpdateCircle", [0:"id", 1:circleindex, 2:"circle_id", 3:0, 4:"pos", 5:var_e681932897d7f299, 6:"radius", 7:circleradius, 8:"target_pos", 9:targetpos, 10:"target_radius", 11:var_154ef61b7a7f747a]);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e74
// Size: 0x137
function function_433af73a108eec49(victim, attacker, meansofdeath, damage, hitloc) {
    var_45668c725dc52275 = [];
    /#
        assert(isdefined(victim));
    #/
    /#
        assert(isplayer(victim));
    #/
    var_45668c725dc52275["victim"] = function_62945c3d6792d0ee(victim);
    var_45668c725dc52275["victimDirection"] = function_9f601132ee8804e7(victim);
    if (isdefined(attacker)) {
        var_45668c725dc52275["attacker"] = function_62945c3d6792d0ee(attacker);
        if (isplayer(attacker)) {
            var_45668c725dc52275["attackerDirection"] = function_9f601132ee8804e7(attacker);
        }
    }
    /#
        assert(isdefined(meansofdeath));
    #/
    var_45668c725dc52275["damageType"] = function_905e60070f3e3cbf(meansofdeath);
    /#
        assert(isdefined(damage));
    #/
    var_45668c725dc52275["damageValue"] = damage;
    if (isdefined(hitloc)) {
        var_45668c725dc52275["hitLoc"] = function_905e60070f3e3cbf(hitloc);
    }
    var_45668c725dc52275["health"] = victim.health;
    if (isplayer(victim)) {
        var_41b371ca46e67bfe = function_d48694033481cf25(victim);
        function_3226093417bd3363(var_41b371ca46e67bfe, "health", victim.health);
    }
    function_4603aa41477ca54d("DoDamage", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb2
// Size: 0xbf
function function_2ea4c1db39176769(attacker, victim, meansofdeath, damage) {
    if (!isenabled()) {
        return;
    }
    var_45668c725dc52275 = [];
    var_45668c725dc52275["victim"] = function_62945c3d6792d0ee(victim);
    if (isdefined(attacker)) {
        var_45668c725dc52275["attacker"] = function_62945c3d6792d0ee(attacker);
    }
    if (isdefined(meansofdeath)) {
        var_45668c725dc52275["meansOfDeath"] = function_905e60070f3e3cbf(meansofdeath);
    }
    if (isdefined(damage)) {
        var_45668c725dc52275["damage"] = damage;
    }
    if (isplayer(victim)) {
        var_41b371ca46e67bfe = function_d48694033481cf25(victim);
        function_3226093417bd3363(var_41b371ca46e67bfe, "health", victim.health);
    }
    function_4603aa41477ca54d("PlayerKilled", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2078
// Size: 0x85
function function_c622e0ea21d494fe(var_89a675c5bde8848f, reason) {
    if (!isenabled() || !function_27a7d2350b94908b()) {
        return;
    }
    var_45668c725dc52275 = [];
    var_45668c725dc52275["id"] = function_592c6f38a6569fec(var_89a675c5bde8848f.var_ff1a8c6f49882fe8, 1);
    var_45668c725dc52275["name"] = function_905e60070f3e3cbf(var_89a675c5bde8848f.name);
    var_45668c725dc52275["reason"] = function_905e60070f3e3cbf(reason);
    function_4603aa41477ca54d("DebugActivateUIBot", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2104
// Size: 0xa0
function function_8303a56b1ee268b2(status, reason, deployCount) {
    if (!isenabled() || !function_27a7d2350b94908b()) {
        return;
    }
    /#
        assert(namespace_95d8d8ec67e3e074::isenabled());
    #/
    var_45668c725dc52275 = [];
    var_45668c725dc52275["status"] = function_905e60070f3e3cbf(status);
    var_45668c725dc52275["reason"] = function_905e60070f3e3cbf(reason);
    var_156f390a5362bc55 = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
    var_45668c725dc52275["remain"] = var_156f390a5362bc55.size;
    if (isdefined(deployCount)) {
        var_45668c725dc52275["deployCount"] = deployCount;
    }
    function_4603aa41477ca54d("DebugDeployUIBotStatus", var_45668c725dc52275);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ab
// Size: 0x1ec
function function_873c0be4897bd6c8(method) {
    if (!isenabled() || !function_27a7d2350b94908b()) {
        return;
    }
    var_5b234f9ff418f161 = [];
    str = "method=" + method;
    var_5b234f9ff418f161[0] = str;
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        playerid = function_d1f5ff62271c92fe(player);
        str = "id=" + playerid;
        str = str + ";isAlive=" + function_ded80385ea7471db(player);
        str = str + ";eliminated=" + player isEliminated();
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            str = str + ";ghost=" + player namespace_d3d40f75bb4e4c32::function_f5446040a93792c3();
        }
        str = str + ";UIBot=" + player namespace_95d8d8ec67e3e074::isUIBot();
        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            str = str + ";gulagId=" + player.arena.gulagindex;
        } else {
            str = str + ";gulagId=-1";
        }
        var_5b234f9ff418f161[var_5b234f9ff418f161.size] = str;
    }
    if (namespace_95d8d8ec67e3e074::isenabled()) {
        var_156f390a5362bc55 = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
        foreach (bot in var_156f390a5362bc55) {
            var_c177f509325adbf = function_592c6f38a6569fec(bot.var_ff1a8c6f49882fe8, 1);
            str = "uibot=1;id=" + var_c177f509325adbf + ";name=" + function_905e60070f3e3cbf(bot.name);
            var_5b234f9ff418f161[var_5b234f9ff418f161.size] = str;
        }
    }
    if (var_5b234f9ff418f161.size > 0) {
        function_35cb42962526710e("DebugForceEndGame", var_5b234f9ff418f161);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239e
// Size: 0x227
function function_170e36088569c2a5(var_892c7a42be39e66) {
    foreach (key, var_41b371ca46e67bfe in level.var_8a9762e276de8903.players) {
        if (function_53c4c53197386572(var_41b371ca46e67bfe.props["health"], -1) <= 0) {
            continue;
        }
        if (function_53c4c53197386572(var_41b371ca46e67bfe.props["eliminated"], 0) == 1) {
            continue;
        }
        if (function_53c4c53197386572(var_41b371ca46e67bfe.props["gulagId"], -1) >= 0) {
            continue;
        }
        status = function_53c4c53197386572(var_41b371ca46e67bfe.props["botStatus"], "");
        if (status == "kickout" || status == "uibot") {
            continue;
        }
        if (!isdefined(var_892c7a42be39e66[key])) {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                var_ff1a8c6f49882fe8 = function_c1fb465742657a02(player);
                if (isdefined(var_ff1a8c6f49882fe8) && var_ff1a8c6f49882fe8 == var_41b371ca46e67bfe.id) {
                    var_45668c725dc52275 = [];
                    var_45668c725dc52275["id"] = function_d1f5ff62271c92fe(player);
                    var_45668c725dc52275["isAlive"] = function_ded80385ea7471db(player);
                    var_45668c725dc52275["isEliminated"] = player isEliminated();
                    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                        var_45668c725dc52275["isGhost"] = player namespace_d3d40f75bb4e4c32::function_f5446040a93792c3();
                    }
                    var_45668c725dc52275["isUIBot"] = player namespace_95d8d8ec67e3e074::isUIBot();
                    var_45668c725dc52275["health"] = player.health;
                    if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                        var_45668c725dc52275["gulagId"] = player.arena.gulagindex;
                    }
                    function_4603aa41477ca54d("DebugRemovedPlayerStatus", var_45668c725dc52275);
                    break;
                }
            }
            /#
                /#
                    assertmsg("circle_unpaused");
                #/
            #/
        }
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25cc
// Size: 0x118
function function_4603aa41477ca54d(type, dictionary) {
    if (!isenabled()) {
        return;
    }
    /#
        assert(isstring(type));
    #/
    level.var_8a9762e276de8903.var_73db6de3fcdac953++;
    var_73db6de3fcdac953 = level.var_8a9762e276de8903.var_73db6de3fcdac953;
    if (!isdefined(dictionary) || dictionary.size == 0) {
        return function_9e0bf4e5541c261c(type, "", var_73db6de3fcdac953);
    }
    var_668a4bbdd722031b = "";
    foreach (key, value in dictionary) {
        str = function_14d1cb139426211a(key, value);
        if (var_668a4bbdd722031b.size + str.size >= 1920) {
            function_9e0bf4e5541c261c(type, var_668a4bbdd722031b, var_73db6de3fcdac953, 1);
            var_668a4bbdd722031b = "";
        }
        var_668a4bbdd722031b = var_668a4bbdd722031b + str;
    }
    function_9e0bf4e5541c261c(type, var_668a4bbdd722031b, var_73db6de3fcdac953);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26eb
// Size: 0xbe
function function_2a02755326c9546a(type, var_31fe7a6adf854d98) {
    if (!isenabled()) {
        return;
    }
    level.var_8a9762e276de8903.var_73db6de3fcdac953++;
    var_73db6de3fcdac953 = level.var_8a9762e276de8903.var_73db6de3fcdac953;
    if (!isdefined(var_31fe7a6adf854d98) || var_31fe7a6adf854d98.size == 0) {
        return function_9e0bf4e5541c261c(type, "", var_73db6de3fcdac953);
    }
    var_8a73a0e5b873c7cd = function_2cfbe3d9b897e187(var_31fe7a6adf854d98);
    var_c92c78259fabcc48 = 1;
    for (i = 0; i < var_8a73a0e5b873c7cd.size; i++) {
        if (i == var_8a73a0e5b873c7cd.size - 1) {
            var_c92c78259fabcc48 = 0;
        }
        function_9e0bf4e5541c261c(type, var_8a73a0e5b873c7cd[i], var_73db6de3fcdac953, var_c92c78259fabcc48);
    }
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b0
// Size: 0xfa
function function_35cb42962526710e(type, var_5b234f9ff418f161) {
    if (!isenabled()) {
        return;
    }
    level.var_8a9762e276de8903.var_73db6de3fcdac953++;
    var_73db6de3fcdac953 = level.var_8a9762e276de8903.var_73db6de3fcdac953;
    if (!isdefined(var_5b234f9ff418f161) || var_5b234f9ff418f161.size == 0) {
        return function_9e0bf4e5541c261c(type, "", var_73db6de3fcdac953);
    }
    var_668a4bbdd722031b = "";
    for (i = 0; i < var_5b234f9ff418f161.size; i++) {
        str = var_5b234f9ff418f161[i];
        /#
            assert(isdefined(str));
        #/
        if (var_668a4bbdd722031b.size + str.size >= 1920) {
            function_9e0bf4e5541c261c(type, var_668a4bbdd722031b, var_73db6de3fcdac953, 1);
            var_668a4bbdd722031b = "";
        }
        if (i == var_5b234f9ff418f161.size - 1) {
            var_668a4bbdd722031b = var_668a4bbdd722031b + str;
        } else {
            var_668a4bbdd722031b = var_668a4bbdd722031b + str + "|";
        }
    }
    function_9e0bf4e5541c261c(type, var_668a4bbdd722031b + ";", var_73db6de3fcdac953);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b1
// Size: 0x7e
function function_9e0bf4e5541c261c(type, string, var_73db6de3fcdac953, var_c92c78259fabcc48) {
    if (!isenabled()) {
        return;
    }
    var_85da9f739e923ef0 = " ";
    if (istrue(var_c92c78259fabcc48)) {
        var_85da9f739e923ef0 = "/ ";
    }
    var_1999c8ddb43d1637 = "[REPLAY] " + var_73db6de3fcdac953 + var_85da9f739e923ef0 + type + " " + string;
    /#
        assert(var_1999c8ddb43d1637.size < 2048);
    #/
    function_8294c13e5683b0a3(var_1999c8ddb43d1637);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2936
// Size: 0xdf
function function_2cfbe3d9b897e187(var_31fe7a6adf854d98) {
    /#
        assert(isarray(var_31fe7a6adf854d98));
    #/
    /#
        assert(var_31fe7a6adf854d98.size % 2 == 0);
    #/
    ret = [];
    if (var_31fe7a6adf854d98.size == 0) {
        return ret;
    }
    str = "";
    i = 0;
    while (i < var_31fe7a6adf854d98.size) {
        key = var_31fe7a6adf854d98[i];
        val = var_31fe7a6adf854d98[i + 1];
        if (!isdefined(key)) {
            /#
                assertmsg("key is undefined! index=" + i);
            #/
            break;
        }
        var_21b0ea321183efe8 = function_14d1cb139426211a(key, val);
        if (str.size + var_21b0ea321183efe8.size >= 1920) {
            ret[ret.size] = str;
            str = "";
        }
        str = str + var_21b0ea321183efe8;
        i = i + 2;
    }
    ret[ret.size] = str;
    return ret;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1d
// Size: 0x8c
function function_14d1cb139426211a(key, val) {
    /#
        assert(isstring(key));
    #/
    result = key + "=";
    if (!isdefined(val)) {
        result = result + "undefined;";
    } else if (isint(val) || isfloat(val) || isvector(val) || isstring(val)) {
        result = result + val + ";";
    } else {
        /#
            assertmsg("Unknown value type key = " + key);
        #/
    }
    return result;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab1
// Size: 0x7d
function function_62945c3d6792d0ee(ent) {
    if (isplayer(ent)) {
        return function_d1f5ff62271c92fe(ent);
    } else if (isagent(ent)) {
        return function_905e60070f3e3cbf(ent.var_8aa9efe6383c1d5a);
    }
    prefix = ent.classname + ": ";
    id = ent getentitynumber();
    idstr = function_905e60070f3e3cbf(prefix + id);
    return idstr;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b36
// Size: 0x1f
function function_d1f5ff62271c92fe(player) {
    return function_592c6f38a6569fec(function_c1fb465742657a02(player), isbot(player));
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b5d
// Size: 0x88
function function_c1fb465742657a02(player) {
    /#
        assert(isplayer(player));
    #/
    /#
        assert(isdefined(player.var_ff1a8c6f49882fe8));
    #/
    var_ff1a8c6f49882fe8 = undefined;
    if (!isdefined(player.var_5876cd9fc14af731)) {
        /#
            assert(isdefined(player.var_ff1a8c6f49882fe8));
        #/
        var_ff1a8c6f49882fe8 = player.var_ff1a8c6f49882fe8;
    } else {
        var_ff1a8c6f49882fe8 = player.var_5876cd9fc14af731.var_ff1a8c6f49882fe8;
    }
    return var_ff1a8c6f49882fe8;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bed
// Size: 0x39
function function_592c6f38a6569fec(var_676624c5fe59606d, isbot) {
    prefix = ter_op(isbot, "b_", "h_");
    return function_905e60070f3e3cbf(prefix + var_676624c5fe59606d);
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2e
// Size: 0x3f
function function_905e60070f3e3cbf(str) {
    if (!isstring(str)) {
        /#
            assertmsg("FormatString argument is not a string!");
        #/
        return "";
    }
    str = function_10e35f6c482bd1b5(str);
    return """ + str + """;
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c75
// Size: 0x29
function function_cd70b8fa232889f5(x, y) {
    return "(" + x + ", " + y + ")";
}

// Namespace namespace_ccaa681806765e85/namespace_92443376a63aa4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca6
// Size: 0x82
function function_10e35f6c482bd1b5(string) {
    chars = [0:"|", 1:";", 2:"""];
    foreach (var_ce174b78f56823fa in chars) {
        string = function_95c6391212a25f7c(string, var_ce174b78f56823fa);
    }
    return string;
}

