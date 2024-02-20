// mwiii decomp prototype
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;

#namespace namespace_60a641c7b5c12025;

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0x60
function init() {
    level.drawfriend = 0;
    game["headicon_allies"] = getteamheadicon("allies");
    game["headicon_axis"] = getteamheadicon("axis");
    precacheshader("waypoint_revive");
    level thread onplayerconnect();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    for (;;) {
        updatefriendiconsettings();
        wait(5);
    }
}

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x173
// Size: 0x2c
function onplayerconnect() {
    if (namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    for (;;) {
        player = level waittill("connected");
        player thread onplayerkilled();
    }
}

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x15
function onplayerspawned() {
    if (namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    thread showfriendicon();
}

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2
// Size: 0x23
function onplayerkilled() {
    self endon("disconnect");
    for (;;) {
        self waittill("killed_player");
        self.headicon = "";
    }
}

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec
// Size: 0x66
function showfriendicon() {
    if (level.drawfriend) {
        if (self.pers["team"] == "allies") {
            self.headicon = game["headicon_allies"];
            self.headiconteam = "allies";
        } else {
            self.headicon = game["headicon_axis"];
            self.headiconteam = "axis";
        }
    }
}

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x259
// Size: 0x41
function updatefriendiconsettings() {
    drawfriend = namespace_296c793a004e81b3::getintproperty("scr_drawfriend", level.drawfriend);
    if (level.drawfriend != drawfriend) {
        level.drawfriend = drawfriend;
        updatefriendicons();
    }
}

// Namespace namespace_60a641c7b5c12025/namespace_ce17ea5c67b0ee34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x16d
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
            } else {
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
}

