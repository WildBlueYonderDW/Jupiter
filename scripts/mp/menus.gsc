// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\common\ui.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\teams.gsc;
#using script_76cc264b397db9cb;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\bounty.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;

#namespace menus;

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x744
// Size: 0x285
function init() {
    if (!isdefined(game["gamestarted"])) {
        game["menu_team"] = "team_marinesopfor";
        if (level.multiteambased) {
            game["menu_team"] = "team_mt_options";
        }
        game["menu_class"] = "class";
        game["menu_class_allies"] = "class_marines";
        game["menu_class_axis"] = "class_opfor";
        game["menu_changeclass_allies"] = "changeclass_marines";
        game["menu_changeclass_axis"] = "changeclass_opfor";
        if (level.multiteambased) {
            for (i = 0; i < level.teamnamelist.size; i++) {
                var_62890c80c835c4a5 = "menu_class_" + level.teamnamelist[i];
                var_90e671d45a71be99 = "menu_changeclass_" + level.teamnamelist[i];
                game[var_62890c80c835c4a5] = game["menu_class_allies"];
                game[var_90e671d45a71be99] = "changeclass_marines";
            }
        }
        game["menu_changeclass"] = "changeclass";
        game["menu_controls"] = "ingame_controls";
        if (level.splitscreen) {
            if (level.multiteambased) {
                for (i = 0; i < level.teamnamelist.size; i++) {
                    var_62890c80c835c4a5 = "menu_class_" + level.teamnamelist[i];
                    var_90e671d45a71be99 = "menu_changeclass_" + level.teamnamelist[i];
                    game[var_62890c80c835c4a5] = game[var_62890c80c835c4a5] + "_splitscreen";
                    game[var_90e671d45a71be99] = game[var_90e671d45a71be99] + "_splitscreen";
                }
            }
            game["menu_team"] = game["menu_team"] + "_splitscreen";
            game["menu_class_allies"] = game["menu_class_allies"] + "_splitscreen";
            game["menu_class_axis"] = game["menu_class_axis"] + "_splitscreen";
            game["menu_changeclass_allies"] = game["menu_changeclass_allies"] + "_splitscreen";
            game["menu_changeclass_axis"] = game["menu_changeclass_axis"] + "_splitscreen";
            game["menu_controls"] = game["menu_controls"] + "_splitscreen";
            game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
            game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
        }
        precachestring("MP/HOST_ENDED_GAME");
        precachestring("MP/HOST_ENDGAME_RESPONSE");
    }
    level namespace_3846cfb60b2ef12f::registeronluieventcallback(&onleavegamecallback);
    level namespace_3846cfb60b2ef12f::registeronluieventcallback(&onteamchangecallback);
    level namespace_61d0e47c5dff187c::lui_registercallback("class_edit", &onclasseditcallback);
    level namespace_61d0e47c5dff187c::lui_registercallback("class_select", &onclasschoicecallback);
    level.var_ce4945d1893fbaca = getdvarint(@"hash_6cb6994f3a89112c", 0);
    level thread setintrocamnetworkmodel();
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d0
// Size: 0x68
function onteamchangecallback(channel, var_8c10bbaef71258b9) {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        /#
            println("class_select" + self getentitynumber() + "ui_loadout_changed" + self.name + "spectator" + channel);
        #/
        if (channel != "team_select") {
            return;
        }
        if (matchmakinggame()) {
            return;
        }
        handleteamchange(channel, var_8c10bbaef71258b9);
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3f
// Size: 0x1a
function setintrocamnetworkmodel() {
    setintrocameraactive(1);
    level waittill("prematch_over");
    setintrocameraactive(0);
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa60
// Size: 0x10
function isloadoutindexdefault(index) {
    return index >= 100;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78
// Size: 0x5b
function getclasschoice(var_3fd595213e78030a) {
    var_3fd595213e78030a++;
    var_2d36749fdffc49b4 = undefined;
    if (var_3fd595213e78030a > 100) {
        classindex = var_3fd595213e78030a - 100;
        var_2d36749fdffc49b4 = "default" + classindex;
    } else if (function_788bcfab4101649a(self)) {
        var_2d36749fdffc49b4 = "custom" + var_3fd595213e78030a;
    } else {
        var_2d36749fdffc49b4 = "default1";
    }
    return var_2d36749fdffc49b4;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadb
// Size: 0x154
function executeclasschange(newclass, var_fda7f7e8fc307aba) {
    if (isbot(self) || istestclient(self)) {
        self.pers["class"] = newclass;
        self.class = newclass;
    } else {
        var_2d36749fdffc49b4 = getclasschoice(newclass);
        if (!isdefined(self.pers["class"]) || var_2d36749fdffc49b4 != self.pers["class"] || var_fda7f7e8fc307aba) {
            self.pers["class"] = var_2d36749fdffc49b4;
            self.class = var_2d36749fdffc49b4;
            namespace_d19129e4fa5d176::preloadandqueueclass(var_2d36749fdffc49b4);
        }
        var_cd83a28652a3f837 = 1;
        if (namespace_36f464722d326bbe::isBRStyleGameType() && !namespace_d576b6dc7cef9c62::function_8f54deec605690d1(getsubgametype())) {
            var_cd83a28652a3f837 = 0;
        }
        if (namespace_d19129e4fa5d176::shouldallowinstantclassswap() && var_cd83a28652a3f837) {
            thread namespace_d19129e4fa5d176::swaploadout();
        } else {
            var_5e6a291a22a0d249 = namespace_36f464722d326bbe::isBRStyleGameType() && self getclientomnvar("ui_open_loadout_bag");
            if (isalive(self) && !var_5e6a291a22a0d249) {
                self iprintlnbold(game["strings"]["change_class"]);
            }
            if (newclass < 100) {
                self setclientomnvar("ui_loadout_changed", namespace_d19129e4fa5d176::getclassindex(self.pers["class"]));
            }
        }
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc36
// Size: 0x58
function setnextroundclass(newclass) {
    var_2d36749fdffc49b4 = newclass;
    if (!isbot(self)) {
        if (isalive(self)) {
            self iprintlnbold(game["strings"]["revive_class"]);
        }
        var_2d36749fdffc49b4 = getclasschoice(newclass);
    }
    self.pers["next_round_class"] = var_2d36749fdffc49b4;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc95
// Size: 0x65
function onleavegamecallback(channel, val) {
    if (channel != "end_game") {
        return;
    }
    if (matchmakinggame()) {
        return;
    }
    if (isdedicatedserver() && !function_d1e52856dc19c5d0(self)) {
        return;
    }
    if (isdefined(level.var_30c7107330cebcce)) {
        level thread [[ level.var_30c7107330cebcce ]](val);
    } else {
        level thread namespace_d576b6dc7cef9c62::forceend(val);
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd01
// Size: 0x39
function onclasseditcallback(newclass) {
    self endon("disconnect");
    waittillframeend();
    handleclassedit(newclass);
    if (getgametype() == "br") {
        namespace_d20f8ef223912e12::function_4043e420432f59f0(getclasschoice(newclass));
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd41
// Size: 0x147
function onclasschoicecallback(newclass, var_f01f8e178ff54eda) {
    self notify("loadout_class_selected", newclass);
    if (level.systemlink && getdvarint(@"hash_9cc8c81329e0bdbf") && self iscodcaster()) {
        self setclientomnvar("ui_options_menu", 0);
        return;
    }
    if (istrue(self.waitingtoselectclass)) {
        if (isdefined(self.revive_chosenclass)) {
            setnextroundclass(newclass);
        }
        if (istrue(level.var_ce4945d1893fbaca)) {
            self.waitingtoselectclass = 0;
            self setclientomnvar("ui_options_menu", 4);
            self.var_48366f4aaeafcf5d = 1;
        } else {
            self setclientomnvar("ui_options_menu", 0);
        }
        return;
    }
    if (!allowclasschoice() || showfakeloadout()) {
        return;
    }
    if (isdefined(self.revive_chosenclass) && isdefined(self.instantclassswapallowed) && !namespace_d19129e4fa5d176::shouldallowinstantclassswap()) {
        setnextroundclass(newclass);
        return;
    }
    if ("" + newclass != "callback") {
        executeclasschange(newclass, istrue(var_f01f8e178ff54eda));
        if (istrue(self.var_48366f4aaeafcf5d)) {
            self setclientomnvar("ui_options_menu", 0);
            self.var_48366f4aaeafcf5d = 0;
            return;
        }
    } else {
        menuclass("callback");
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0x24a
function handleteamchange(channel, var_8c10bbaef71258b9) {
    var_80b8e166e8e16ba6 = 0;
    if (var_8c10bbaef71258b9 >= 3) {
        var_80b8e166e8e16ba6 = 1;
    }
    if (var_80b8e166e8e16ba6) {
        self setclientomnvar("ui_spectator_selected", 1);
        self.spectating_actively = 1;
    } else {
        self setclientomnvar("ui_spectator_selected", -1);
        self.spectating_actively = 0;
    }
    var_fff3522de2da93f8 = self iscodcaster();
    var_fbad2b80953ec2cf = !var_fff3522de2da93f8 && isdefined(self.team) && (self.team == "spectator" || self.team == "codcaster");
    var_4dc9d59b17d0dd93 = var_fff3522de2da93f8 && var_8c10bbaef71258b9 == 3 || var_fbad2b80953ec2cf && (var_8c10bbaef71258b9 == 4 || var_8c10bbaef71258b9 == 5);
    if (var_8c10bbaef71258b9 == 4 || var_8c10bbaef71258b9 == 5) {
        var_8c10bbaef71258b9 = 3;
        self function_7398d812fca0292f(1);
    } else {
        self function_7398d812fca0292f(0);
    }
    if (var_8c10bbaef71258b9 == 0) {
        var_8c10bbaef71258b9 = "axis";
    } else if (var_8c10bbaef71258b9 == 1) {
        var_8c10bbaef71258b9 = "allies";
    } else if (var_8c10bbaef71258b9 == 2) {
        var_8c10bbaef71258b9 = "random";
    } else if (var_8c10bbaef71258b9 == 4) {
        var_8c10bbaef71258b9 = "codcaster";
    } else {
        var_8c10bbaef71258b9 = "spectator";
    }
    if (!var_4dc9d59b17d0dd93 && isdefined(self.pers["team"]) && var_8c10bbaef71258b9 == self.pers["team"]) {
        return;
    }
    if (isdefined(self.operatorcustomization)) {
        self.operatorcustomization.rebuild = 1;
    }
    thread logteamselection(var_8c10bbaef71258b9);
    if (var_8c10bbaef71258b9 != "spectator") {
        self.pers["playerChoseSpectatorTeam"] = undefined;
    } else {
        self.pers["playerChoseSpectatorTeam"] = 1;
    }
    if (var_8c10bbaef71258b9 == "axis") {
        thread setteam("axis");
    } else if (var_8c10bbaef71258b9 == "allies") {
        thread setteam("allies");
    } else if (var_8c10bbaef71258b9 == "random") {
        thread autoassign();
    } else if (var_8c10bbaef71258b9 == "codcaster") {
        thread function_9ff5c7531349cdfc(var_4dc9d59b17d0dd93);
    } else if (var_8c10bbaef71258b9 == "spectator") {
        thread setspectator(var_4dc9d59b17d0dd93);
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e0
// Size: 0x89
function handleclassedit(newclass) {
    classname = getclasschoice(newclass);
    var_a022fbcafc053c4a = namespace_d19129e4fa5d176::loadout_editcachedclassstruct(classname);
    var_5410628ddd8dfd8a = namespace_d19129e4fa5d176::loadout_editglobalclassstruct();
    var_d20409fafb8aea3e = var_a022fbcafc053c4a || var_5410628ddd8dfd8a;
    if (isdefined(self.pers["class"]) && classname == self.pers["class"] && var_d20409fafb8aea3e) {
        onclasschoicecallback(newclass, 1);
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1170
// Size: 0x115
function function_c69c22ef9e1e92a0(var_f0c136ca13f8bc76) {
    for (teamindex = level.teamnamelist.size - 1; teamindex >= 0; teamindex--) {
        var_8f7c03ec5f22fe86 = level.teamnamelist[teamindex];
        teamplayers = getteamdata(var_8f7c03ec5f22fe86, "players");
        var_8baa6cfd8698560c = 0;
        foreach (player in teamplayers) {
            if (!isbot(player)) {
                var_8baa6cfd8698560c = 1;
                break;
            }
        }
        count = teamplayers.size;
        if (var_f0c136ca13f8bc76) {
            count = count + getteamdata(var_8f7c03ec5f22fe86, "UnlockedUIBotCount");
        }
        if (!var_8baa6cfd8698560c && (level.maxteamsize == 0 || count < level.maxteamsize)) {
            thread setteam(var_8f7c03ec5f22fe86);
            return 1;
        }
    }
    return 0;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128d
// Size: 0x3d1
function autoassign(var_7ec298e587eb6719) {
    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        thread setteam("allies");
        return;
    }
    var_155c56b2e3db23c9 = getdvar(@"hash_aea3ac32a07685ba", "");
    if (isgameplayteam(var_155c56b2e3db23c9)) {
        setsessionteam(var_155c56b2e3db23c9);
        thread setteam(var_155c56b2e3db23c9, var_7ec298e587eb6719);
        return;
    }
    if (getdvarint(@"hash_3f36284b49b3d7a", 0) != 0) {
        thread setteam("allies");
        return;
    }
    var_f0c136ca13f8bc76 = level.maxteamsize > 0 && isdefined(level.var_7b37b2193f163b9b);
    if (isbot(self) && isdefined(self.bot_team) && self.bot_team != "autoassign") {
        thread setteam(self.bot_team);
        if (var_f0c136ca13f8bc76) {
            function_e9a6fdc468a5fa73(self.bot_team);
        }
        return;
    }
    if (self iscodcaster()) {
        thread function_9ff5c7531349cdfc();
    } else if (self.sessionteam == "spectator") {
        thread setspectator();
    } else if (istrue(level.teammaxfill)) {
        /#
            println(" countOfUIBots=");
        #/
        var_cf36f495aef1cf75 = isbot(self) && getdvarint(@"hash_d356a7876f773136", 0) != 0;
        if (var_cf36f495aef1cf75 && function_c69c22ef9e1e92a0(var_f0c136ca13f8bc76)) {
            return;
        }
        for (teamindex = 0; teamindex < level.teamnamelist.size; teamindex++) {
            entry = level.teamnamelist[teamindex];
            if (var_f0c136ca13f8bc76) {
                function_e9a6fdc468a5fa73(entry);
            }
            count = getteamdata(entry, "teamCount");
            if (var_f0c136ca13f8bc76) {
                count = count + getteamdata(entry, "UnlockedUIBotCount");
            }
            if (level.maxteamsize == 0 || count < level.maxteamsize) {
                thread setteam(entry);
                break;
            }
        }
        /#
            if (!isdefined(self.team)) {
                /#
                    assertmsg("gun");
                #/
                kick(self getentitynumber());
            }
        #/
    } else {
        var_4d6bd6d4c0e080b6 = 0;
        var_400d10216d79aa87 = [];
        foreach (entry in level.teamnamelist) {
            count = getteamdata(entry, "teamCount");
            if (isdefined(self.team) && self.team == entry) {
                count--;
            }
            if (!var_400d10216d79aa87.size || count < var_4d6bd6d4c0e080b6) {
                var_4d6bd6d4c0e080b6 = count;
                var_400d10216d79aa87 = [];
                var_400d10216d79aa87[var_400d10216d79aa87.size] = entry;
            } else if (count == var_4d6bd6d4c0e080b6) {
                var_400d10216d79aa87[var_400d10216d79aa87.size] = entry;
            }
        }
        if (var_400d10216d79aa87.size == 1) {
            if (!isdefined(self.team) || self.team != var_400d10216d79aa87[0]) {
                thread setteam(var_400d10216d79aa87[0]);
            }
        } else {
            if (level.teambased) {
                var_3b8219d206004dfa = namespace_e8a49b70d0769b66::gethighestscoringteam();
                if (array_contains(var_400d10216d79aa87, var_3b8219d206004dfa)) {
                    var_400d10216d79aa87 = array_remove(var_400d10216d79aa87, var_3b8219d206004dfa);
                }
            }
            if (isdefined(self.team) && array_contains(var_400d10216d79aa87, self.team)) {
                var_400d10216d79aa87 = array_remove(var_400d10216d79aa87, self.team);
            }
            if (var_400d10216d79aa87.size > 0) {
                var_f49ee9d2911c5ab5 = randomint(var_400d10216d79aa87.size);
                if (istrue(level.autoassignlowteamconsistent)) {
                    var_f49ee9d2911c5ab5 = 0;
                }
                thread setteam(var_400d10216d79aa87[var_f49ee9d2911c5ab5]);
            }
        }
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1665
// Size: 0x7a
function function_e9a6fdc468a5fa73(team) {
    var_3232b53ef5690097 = getteamdata(team, "teamCount");
    var_2b68f240fb19593d = getteamdata(team, "UnlockedUIBotCount");
    if (var_3232b53ef5690097 + var_2b68f240fb19593d > level.maxteamsize) {
        /#
            assertmsg("Player count in team exceeds level.maxteamSize! level.maxteamSize=" + level.maxteamsize + " team=" + team + " countInLevel=" + var_3232b53ef5690097 + " countOfUIBots=" + var_2b68f240fb19593d);
        #/
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e6
// Size: 0x365
function setteam(selection, var_7ec298e587eb6719) {
    self endon("disconnect");
    if (!isai(self) && level.teambased && !namespace_6d8da2b47f878104::getjointeampermissions(selection) && !lobbyteamselectenabled()) {
        return;
    }
    if (level.ingraceperiod && !istrue(self.hasdonecombat)) {
        self.hasspawned = 0;
        self.pers["lives"] = getgametypenumlives();
    }
    if (self.sessionstate == "playing") {
        self.switching_teams = 1;
        self.joining_team = selection;
        self.leaving_team = self.pers["team"];
        if (getgametype() == "arena") {
            self.switching_teams_arena = 1;
        }
    } else if (istrue(var_7ec298e587eb6719) && isdefined(level.var_d37d95ac1717903c)) {
        selection = self [[ level.var_d37d95ac1717903c ]]();
    }
    if (istrue(game["isLaunchChunk"]) && isbot(self) == 0) {
        selection = "allies";
    }
    addtoteam(selection);
    thread namespace_9bb409deb69fb31d::setsquad(selection);
    if (isragdollzerog()) {
        self lockdeathcamera(1);
    }
    if (self.sessionstate == "playing") {
        self suicide();
        updatesessionstate("spectator");
        self.suicideswitched = 1;
    }
    if (allowclasschoice() || showfakeloadout() && !isai(self)) {
        if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
            var_891d91911e4c1ade = isdefined(level.allowclasschoicefunc) && istrue(self [[ level.allowclasschoicefunc ]]());
            namespace_9c840bb9f2ecbf00::demoforcesre("setTeam() " + self.name + " ui_options_menu = 2, allowClassChoiceFunc = " + var_891d91911e4c1ade);
        }
        if (!istrue(self.var_5354295b99468cef) && !istrue(self.var_10844ddcb34694ee) && getdvarint(@"hash_89556297eaab6b6a", 0) == 0) {
            self setclientomnvar("ui_options_menu", 2);
        }
    }
    if (isdefined(level.onplayerconnectstream)) {
        self thread [[ level.onplayerconnectstream ]]();
    }
    if (!istrue(self.var_5354295b99468cef)) {
        waitforclassselect();
    }
    endrespawnnotify();
    if ((self.sessionstate == "spectator" || playerisstreaming()) && !istrue(self.suicideswitched)) {
        if (game["state"] == "postgame") {
            return;
        }
        if (game["state"] == "playing" && !isinkillcam()) {
            if (isdefined(self.waitingtospawnamortize) && self.waitingtospawnamortize) {
                return;
            }
            thread namespace_99ac021a7547cae3::spawnclient();
        }
        thread namespace_5aeecefc462876::setspectatepermissions();
    }
    self.suicideswitched = undefined;
    self notify("okToSpawn");
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a52
// Size: 0x1d
function playerisstreaming() {
    return isdefined(level.playerisstreaming) && self [[ level.playerisstreaming ]]();
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a77
// Size: 0x14
function function_eb9e2bb02ecff5b5() {
    return getdvarint(@"hash_61be9f6a05f64523", 0) != 0;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a93
// Size: 0x14
function function_2c0eb018b319f66() {
    return getdvarint(@"hash_a9194b992d1058d6", 0) != 0;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aaf
// Size: 0xe6
function setspectator(var_4dc9d59b17d0dd93) {
    if ((!isdefined(var_4dc9d59b17d0dd93) || !var_4dc9d59b17d0dd93) && isdefined(self.pers["team"]) && self.pers["team"] == "spectator") {
        return;
    }
    if (isalive(self)) {
        /#
            assert(isdefined(self.pers["team"]));
        #/
        self.switching_teams = 1;
        self.joining_team = "spectator";
        self.leaving_team = self.pers["team"];
        if (self.sessionstate == "playing") {
            self suicide();
        }
    }
    self notify("becameSpectator");
    addtoteam("spectator");
    self.pers["class"] = undefined;
    self.class = undefined;
    thread namespace_99ac021a7547cae3::spawnspectator();
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b9c
// Size: 0xd4
function function_9ff5c7531349cdfc(var_4dc9d59b17d0dd93) {
    if ((!isdefined(var_4dc9d59b17d0dd93) || !var_4dc9d59b17d0dd93) && isdefined(self.pers["team"]) && self.pers["team"] == "codcaster") {
        return;
    }
    if (isalive(self)) {
        /#
            assert(isdefined(self.pers["team"]));
        #/
        self.switching_teams = 1;
        self.joining_team = "codcaster";
        self.leaving_team = self.pers["team"];
        self suicide();
    }
    self notify("becameSpectator");
    addtoteam("codcaster");
    self.pers["class"] = undefined;
    self.class = undefined;
    thread namespace_99ac021a7547cae3::spawnspectator();
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c77
// Size: 0x92
function function_788bcfab4101649a(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (getdvarint(@"hash_6fbfdde9fc5d2964", 0) != 0) {
        return 1;
    }
    if (getdvarint(@"hash_955ca650f9a9bdef") != 0) {
        return 1;
    }
    if (namespace_cd0b2d039510b38d::privatematch()) {
        return 1;
    }
    if (istrue(level.systemlink)) {
        return 1;
    }
    if (istrue(level.var_ec2fb549b15ad827) && getdvarint(@"hash_48d877b577f2565b", 1) != 0) {
        return 1;
    }
    if (getrank() >= 4) {
        return 1;
    }
    return 0;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d11
// Size: 0x3a6
function waitforclassselect() {
    self endon("disconnect");
    level endon("game_ended");
    self.waitingtoselectclass = 1;
    if (gameflag("prematch_done") && istrue(level.usespawnselection) && !istrue(self.hasspawned)) {
        self setclientomnvar("ui_world_fade", 1);
        self setclientomnvar("ui_hide_objectives", 1);
        self setclientomnvar("ui_in_spawn_camera", 1);
    }
    for (;;) {
        var_40645c66e8a85816 = namespace_36f464722d326bbe::isBRStyleGameType() && allowclasschoice() && (!gameflag("prematch_done") || istrue(level.skipprematch));
        var_7e61909352db412d = teamhasinfil(self.team) && !gameflag("infil_started") && !isdefined(level.bypassclasschoicefunc);
        var_9cfda0afbbf50688 = islifelimited() && !isdefined(level.bypassclasschoicefunc) && isgameplayteam(self.team);
        if (namespace_36f464722d326bbe::isBRStyleGameType() && (getsubgametype() == "dmz" || getsubgametype() == "exgm") && !istrue(level.br_allowloadout)) {
            newclass = 0;
        } else if (var_40645c66e8a85816 || var_7e61909352db412d || var_9cfda0afbbf50688) {
            channel = "class_select";
            if (istestclient(self)) {
                newclass = "default1";
            } else if (!isai(self)) {
                var_788bcfab4101649a = function_788bcfab4101649a(self);
                if (var_788bcfab4101649a && !function_1e098780c33853f2() || getdvarint(@"hash_89556297eaab6b6a", 0)) {
                    newclass = self getplayerdata(level.loadoutsgroup, "customizationFavorites", "favoriteLoadoutIndex");
                } else {
                    newclass = 100;
                }
            } else {
                newclass = "callback";
            }
        } else if (allowclasschoice() || showfakeloadout() && !isai(self)) {
            if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
                if (gameflag("prematch_done") && (!isdefined(level.infilcinematicactive) || level.infilcinematicactive)) {
                    bypassclasschoice();
                    break;
                }
            }
            if (!self iscodcaster() && getdvarint(@"hash_e32ebdbb97a1ec4e", 0) == 0 && self.team != "spectator" && getgametype() != "arm" && getgametype() != "conflict") {
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar("must_select_loadout_to_spawn");
            }
            var_3c8dceee54a35f62 = getdvarint(@"hash_d831c84920a830ff", 0);
            if (var_3c8dceee54a35f62 > 0) {
                thread function_941a6cafc9c004e4(var_3c8dceee54a35f62);
            }
            newclass = self waittill("loadout_class_selected");
        } else {
            bypassclasschoice();
            break;
        }
        if (self.team == "spectator") {
            waitframe();
        } else {
            if ("" + newclass != "callback") {
                if (isbot(self) || istestclient(self)) {
                    self.pers["class"] = newclass;
                    self.class = newclass;
                } else {
                    newclass = newclass;
                    self.pers["class"] = getclasschoice(newclass);
                    self.class = getclasschoice(newclass);
                }
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
                self.waitingtoselectclass = 0;
            } else {
                self.waitingtoselectclass = 0;
                menuclass("callback");
            }
            break;
        }
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20be
// Size: 0x2d
function function_941a6cafc9c004e4(var_3c8dceee54a35f62) {
    self endon("disconnect");
    self endon("loadout_class_selected");
    wait(var_3c8dceee54a35f62);
    thread onclasschoicecallback(randomintrange(100, 110));
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f2
// Size: 0x1eb
function beginclasschoice(forcenewchoice) {
    team = self.pers["team"];
    /#
        assert(team == "axis" || team == "allies" || issubstr(team, "team_"));
    #/
    if (allowclasschoice() || showfakeloadout() && !isai(self)) {
        if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
            var_891d91911e4c1ade = isdefined(level.allowclasschoicefunc) && istrue(self [[ level.allowclasschoicefunc ]]());
            namespace_9c840bb9f2ecbf00::demoforcesre("beginClassChoice() " + self.name + " ui_options_menu = 2, allowClassChoiceFunc = " + var_891d91911e4c1ade);
        }
        if (!istrue(self.var_10844ddcb34694ee)) {
            self setclientomnvar("ui_options_menu", 2);
        }
        if (!self iscodcaster()) {
            waitforclassselect();
        }
        endrespawnnotify();
        if (self.sessionstate == "spectator") {
            if (game["state"] == "postgame") {
                return;
            }
            if (game["state"] == "playing" && !isinkillcam()) {
                if (isdefined(self.waitingtospawnamortize) && self.waitingtospawnamortize) {
                    return;
                }
                thread namespace_99ac021a7547cae3::spawnclient();
            }
            thread namespace_5aeecefc462876::setspectatepermissions();
        }
        self.connecttime = gettime();
        self notify("okToSpawn");
    } else {
        thread bypassclasschoice();
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e4
// Size: 0x128
function bypassclasschoice() {
    self.selectedclass = 1;
    self.waitingtoselectclass = 0;
    if (ispresstofirstspawnmode() && level.enforceantiboosting && !isbot(self)) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("press_to_spawn");
        self notifyonplayercommand("pressToSpawn", "+usereload");
        self notifyonplayercommand("pressToSpawn", "+activate");
        thread waitthensetspawnomnvar();
        self waittill("pressToSpawn");
    }
    if (isdefined(level.bypassclasschoicefunc)) {
        var_ec326f14603f4347 = self [[ level.bypassclasschoicefunc ]]();
        self.class = var_ec326f14603f4347;
    } else {
        self.class = "class0";
        if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.namekey)) {
            namekey = function_1823ff50bb28148d(level.var_62f6f7640e4431e3.namekey);
            if (namekey == #"zm_rb" || namekey == #"zm_turned") {
                self.class = "default1";
            }
        }
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2413
// Size: 0x5e
function ispresstofirstspawnmode() {
    if (getdvarint(@"hash_eeaebebf98d1e9e7", 0) == 0) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        return 1;
    } else if (getgametype() == "dm" && istrue(level.aonrules)) {
        return 1;
    } else if (getgametype() == "gun") {
        return 1;
    }
    return 0;
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2479
// Size: 0x1e
function waitthensetspawnomnvar() {
    self endon("pressToSpawn");
    wait(1);
    if (isdefined(self)) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("press_to_spawn");
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249e
// Size: 0x11
function beginteamchoice() {
    self setclientomnvar("ui_options_menu", 1);
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b6
// Size: 0xb7
function menuspectator() {
    if (isdefined(self.pers["team"]) && self.pers["team"] == "spectator") {
        return;
    }
    if (isalive(self)) {
        /#
            assert(isdefined(self.pers["team"]));
        #/
        self.switching_teams = 1;
        self.joining_team = "spectator";
        self.leaving_team = self.pers["team"];
        self suicide();
    }
    addtoteam("spectator");
    self.pers["class"] = undefined;
    self.class = undefined;
    thread namespace_99ac021a7547cae3::spawnspectator();
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2574
// Size: 0x2ef
function menuclass(response) {
    /#
        assert(isdefined(self.pers["team"]));
    #/
    team = self.pers["team"];
    /#
        assert(team == "allies" || team == "axis" || issubstr(team, "team_"));
    #/
    class = namespace_d19129e4fa5d176::getclasschoice(response);
    primary = namespace_d19129e4fa5d176::getweaponchoice(response);
    if (class == "restricted") {
        beginclasschoice();
        return;
    }
    if (isdefined(self.pers["class"]) && self.pers["class"] == class && isdefined(self.pers["primary"]) && self.pers["primary"] == primary) {
        return;
    }
    if (self.sessionstate == "playing") {
        if (isdefined(self.pers["lastClass"]) && isdefined(self.pers["class"])) {
            self.pers["lastClass"] = self.pers["class"];
            self.lastclass = self.pers["lastClass"];
        }
        self.pers["class"] = class;
        self.class = class;
        self.pers["primary"] = primary;
        if (game["state"] == "postgame") {
            return;
        }
        if (level.ingraceperiod && !self.hasdonecombat) {
            namespace_d19129e4fa5d176::setclass(self.pers["class"]);
            self.tag_stowed_back = undefined;
            self.tag_stowed_hip = undefined;
            namespace_d19129e4fa5d176::giveloadout(self.pers["team"], self.pers["class"]);
        } else {
            self iprintlnbold(game["strings"]["change_class"]);
        }
    } else {
        if (isdefined(self.pers["lastClass"]) && isdefined(self.pers["class"])) {
            self.pers["lastClass"] = self.pers["class"];
            self.lastclass = self.pers["lastClass"];
        }
        self.pers["class"] = class;
        self.class = class;
        self.pers["primary"] = primary;
        if (game["state"] == "postgame") {
            return;
        }
        if (game["state"] == "playing" && !isinkillcam() && !namespace_36f464722d326bbe::isBRStyleGameType()) {
            thread namespace_99ac021a7547cae3::spawnclient();
        }
    }
    thread namespace_5aeecefc462876::setspectatepermissions();
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286a
// Size: 0x2de
function addtoteam(team, var_7ec298e587eb6719, var_67d0631ad9027f83, var_26c802633f90a05c) {
    if (isdefined(self.team)) {
        namespace_99ac021a7547cae3::removefromteamcount();
        if (isdefined(var_67d0631ad9027f83) && var_67d0631ad9027f83) {
            namespace_99ac021a7547cae3::decrementalivecount(self.team, undefined, "addToTeam");
        }
        namespace_9bb409deb69fb31d::leavesquad(self.team, self.var_ff97225579de16a);
    }
    if (isdefined(self.pers["team"]) && self.pers["team"] != "" && self.pers["team"] != "spectator" && self.pers["team"] != "codcaster") {
        self.pers["last_team"] = self.pers["team"];
    }
    self.changedteams = isdefined(self.pers["last_team"]) && self.pers["last_team"] != team;
    if (!level.teambased) {
        if (isbot(self) && team != "allies" && team != "axis") {
            self.pers["team"] = ter_op(cointoss(), "allies", "axis");
            self.team = "allies";
        } else {
            self.pers["team"] = team;
            self.team = team;
        }
    } else {
        self.pers["team"] = team;
        self.team = team;
    }
    var_d31d331a4c57867b = isbot(self) || istestclient(self);
    if (var_d31d331a4c57867b || function_d7ec918e29c0b2f4()) {
        setsessionteam(team);
    } else if (!denysystemicteamchoice()) {
        if (matchmakinggame() && !istrue(var_26c802633f90a05c)) {
            if (!allowteamassignment()) {
                if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
                    setsessionteam(team);
                }
            }
        } else if (!function_1eb7d2791d3c536f()) {
            setsessionteam(team);
        }
    } else if (getdvarint(@"hash_c11db9baa9e5bc9b", 0) > 0) {
        if (!level.matchmakingmatch) {
            setsessionteam(team);
        }
    }
    if (game["state"] != "postgame") {
        namespace_99ac021a7547cae3::addtoteamcount(istrue(var_67d0631ad9027f83));
    }
    updateobjectivetext();
    if (isdefined(var_7ec298e587eb6719) && var_7ec298e587eb6719) {
        waittillframeend();
    }
    if (team == "spectator" || team == "codcaster") {
        self notify("joined_spectators");
        namespace_6d8da2b47f878104::onjoinedspectators(self);
        namespace_5aeecefc462876::onjoinedspectators(self);
        namespace_7ff762d1c2a7da35::onplayerjoinedspectators(self);
        namespace_74465391b3cf76b::onjoinspectators();
    } else {
        self notify("joined_team");
    }
    namespace_1309ce202b9aa92b::onplayerjointeam(self);
    level notify("add_to_team", self);
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4f
// Size: 0x2d
function setsessionteam(teamset) {
    if (level.teambased) {
        self.sessionteam = teamset;
    } else {
        setemptysessionteam(teamset);
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b83
// Size: 0x50
function setemptysessionteam(teamset) {
    if (teamset == "spectator") {
        self.sessionteam = "spectator";
    } else if (teamset == "codcaster") {
        self.sessionteam = "codcaster";
    } else {
        self.sessionteam = "none";
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bda
// Size: 0x15
function endrespawnnotify() {
    self.waitingtospawn = 0;
    self notify("end_respawn");
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf6
// Size: 0x46
function logteamselection(teamselection) {
    if (getdvarint(@"hash_ff689af941dd10a1", 0) == 0) {
        return;
    }
    if (teamselection != "random") {
        iprintlnbold("" + self.name + " did not select auto-assign");
    }
}

// Namespace menus/namespace_e5ed2f5a5ee8410e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c43
// Size: 0x243
function debugprintsquads() {
    var_63f43f469b885ec6 = 25;
    while (1) {
        if (isdefined(level.squaddata)) {
            startx = 800;
            starty = 25;
            linecount = 1;
            /#
                printtoscreen2d(startx + 250, starty, "<unknown string>", (1, 1, 1), 1);
            #/
            foreach (team, var_70643c8580524236 in level.squaddata) {
                linecount = 1;
                /#
                    printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "<unknown string>" + team, (1, 1, 1), 1);
                #/
                linecount++;
                foreach (squad in var_70643c8580524236) {
                    color = (1, 1, 1);
                    if (isdefined(squad.activemission)) {
                        color = (1, 1, 0);
                    }
                    /#
                        printtoscreen2d(startx + 25, starty + var_63f43f469b885ec6 * linecount, "<unknown string>" + squad.index, color, 1);
                    #/
                    linecount++;
                    foreach (player in squad.players) {
                        color = (1, 1, 1);
                        if (istrue(player.squadassignedfromlobby)) {
                            color = (0, 1, 0);
                        }
                        /#
                            printtoscreen2d(startx + 50, starty + var_63f43f469b885ec6 * linecount, player.name, color, 1);
                        #/
                        linecount++;
                    }
                }
                startx = startx + 200;
            }
        }
        waitframe();
    }
}

