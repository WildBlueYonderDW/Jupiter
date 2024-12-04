#using script_2669878cf5a1b6bc;
#using script_44a4ad8c0d35f203;
#using script_5762ac2f22202ba2;
#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\utility;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\gamescore;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\spawn_event_aggregator;

#namespace whizby;

// Namespace whizby / scripts\mp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155
// Size: 0x25
function init() {
    setdvarifuninitialized(@"scr_suppression", 0);
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    namespace_d55725aa5dd0745b::init();
}

// Namespace whizby / scripts\mp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182
// Size: 0xa
function onplayerspawned() {
    thread whizbythink();
}

// Namespace whizby / scripts\mp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x70
function whizbythink() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    effecttime = gettime();
    namespace_d55725aa5dd0745b::initplayer();
    for (;;) {
        self waittill("bulletwhizby", attacker, distance, position, forward);
        effecttime = dowhizby(attacker, distance, position, forward, effecttime);
        dosuppression(attacker);
    }
}

// Namespace whizby / scripts\mp\whizby
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x20c
// Size: 0x9b
function dowhizby(attacker, distance, position, forward, effecttime) {
    currenttime = gettime();
    if (!isusingremote()) {
        thread namespace_d55725aa5dd0745b::function_a6e6611efb4164d5(attacker, distance, position, forward);
    }
    weapon = attacker getcurrentweapon();
    if (isdefined(weapon) && weaponclass(weapon) == "sniper") {
        thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"bc_flavor_player_surprise", undefined, 0.2);
    }
    thread scripts\mp\battlechatter_mp::addrecentattacker(attacker);
    return effecttime;
}

// Namespace whizby / scripts\mp\whizby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x7c
function dosuppression(attacker) {
    if (getdvarint(@"scr_suppression", 1) == 1) {
        weapon = attacker getcurrentweapon();
        if (weapon hasattachment("linearbrake") && !namespace_e0ee43ef2dddadaa::iskillstreakweapon(weapon) && !scripts\mp\utility\perk::_hasperk("specialty_blastshield")) {
            attacker hudicontype("suppression");
            scripts\mp\gamescore::trackdebuffassist(attacker, self, weapon.basename);
        }
    }
}

