#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\engine\math.gsc;
#using script_2669878cf5a1b6bc;
#using script_44a4ad8c0d35f203;
#using scripts\cp\utility\spawn_event_aggregator.gsc;
#using scripts\cp\cp_player_battlechatter.gsc;

#namespace whizby;

// Namespace whizby / scripts\cp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdb
// Size: 0x15
function init() {
    namespace_d55725aa5dd0745b::init();
    scripts\cp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace whizby / scripts\cp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8
// Size: 0x14
function onplayerspawned() {
    self._whizbyfxent = [];
    thread whizbythink();
}

// Namespace whizby / scripts\cp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114
// Size: 0x59
function whizbythink() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    namespace_d55725aa5dd0745b::initplayer();
    for (;;) {
        attacker, distance, position, forward = self waittill("bulletwhizby");
        dowhizby(attacker, distance, position, forward);
    }
}

// Namespace whizby / scripts\cp\whizby
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x175
// Size: 0x61
function dowhizby(attacker, distance, position, forward) {
    if (!isusingremote()) {
        thread namespace_d55725aa5dd0745b::function_a6e6611efb4164d5(attacker, distance, position, forward);
    }
    weapon = attacker getcurrentweapon();
    if (weaponclass(weapon) == "sniper") {
    }
    thread scripts\cp\cp_player_battlechatter::addrecentattacker(attacker);
}

