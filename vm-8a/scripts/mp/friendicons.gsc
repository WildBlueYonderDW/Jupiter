#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;

#namespace friendicons;

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0x5f
function init() {
    level.drawfriend = 0;
    game["headicon_allies"] = getteamheadicon("allies");
    game["headicon_axis"] = getteamheadicon("axis");
    precacheshader("waypoint_revive");
    level thread onplayerconnect();
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    for (;;) {
        updatefriendiconsettings();
        wait 5;
    }
}

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x173
// Size: 0x2b
function onplayerconnect() {
    if (scripts\mp\utility\game::runleanthreadmode()) {
        return;
    }
    for (;;) {
        player = level waittill("connected");
        player thread onplayerkilled();
    }
}

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x14
function onplayerspawned() {
    if (scripts\mp\utility\game::runleanthreadmode()) {
        return;
    }
    thread showfriendicon();
}

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2
// Size: 0x22
function onplayerkilled() {
    self endon("disconnect");
    for (;;) {
        self waittill("killed_player");
        self.headicon = "";
    }
}

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec
// Size: 0x65
function showfriendicon() {
    if (level.drawfriend) {
        if (self.pers["team"] == "allies") {
            self.headicon = game["headicon_allies"];
            self.headiconteam = "allies";
            return;
        }
        self.headicon = game["headicon_axis"];
        self.headiconteam = "axis";
    }
}

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x259
// Size: 0x40
function updatefriendiconsettings() {
    drawfriend = scripts\mp\utility\dvars::getintproperty("scr_drawfriend", level.drawfriend);
    if (level.drawfriend != drawfriend) {
        level.drawfriend = drawfriend;
        updatefriendicons();
    }
}

// Namespace friendicons / scripts\mp\friendicons
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x16c
function updatefriendicons() {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] != "spectator" && player.sessionstate == "playing") {
            if (level.drawfriend) {
                if (player.pers["team"] == "allies") {
                    player.headicon = game["headicon_allies"];
                    player.headiconteam = "allies";
                } else {
                    player.headicon = game["headicon_axis"];
                    player.headiconteam = "axis";
                }
                continue;
            }
            players = level.players;
            for (i = 0; i < players.size; i++) {
                player = players[i];
                if (isdefined(player.pers["team"]) && player.pers["team"] != "spectator" && player.sessionstate == "playing") {
                    player.headicon = "";
                }
            }
        }
    }
}

