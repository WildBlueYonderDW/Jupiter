#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\utility\player.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_44a4ad8c0d35f203;
#using scripts\mp\battlechatter_mp.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\gamescore.gsc;

#namespace whizby;

// Namespace whizby / scripts\mp\whizby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155
// Size: 0x25
function init() {
    setdvarifuninitialized(@"hash_9789797e3340f37a", 0);
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
        attacker, distance, position, forward = self waittill("bulletwhizby");
        effecttime = dowhizby(attacker, distance, position, forward, effecttime);
        dosuppression(attacker);
    }
}

// Namespace whizby / scripts\mp\whizby
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x20c
// Size: 0x9a
function dowhizby(attacker, distance, position, forward, effecttime) {
    currenttime = gettime();
    if (!isusingremote()) {
        thread namespace_d55725aa5dd0745b::function_a6e6611efb4164d5(attacker, distance, position, forward);
    }
    weapon = attacker getcurrentweapon();
    if (isdefined(weapon) && weaponclass(weapon) == "sniper") {
        scripts\mp\battlechatter_mp::trysaylocalsound(self, #"bc_flavor_player_surprise", undefined, 0.2);
    }
    thread scripts\mp\battlechatter_mp::addrecentattacker(attacker);
    return effecttime;
}

// Namespace whizby / scripts\mp\whizby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2af
// Size: 0x7c
function dosuppression(attacker) {
    if (getdvarint(@"hash_9789797e3340f37a", 1) == 1) {
        weapon = attacker getcurrentweapon();
        if (weapon hasattachment("linearbrake") && !namespace_e0ee43ef2dddadaa::iskillstreakweapon(weapon) && !scripts\mp\utility\perk::_hasperk("specialty_blastshield")) {
            attacker hudicontype("suppression");
            scripts\mp\gamescore::trackdebuffassist(attacker, self, weapon.basename);
        }
    }
}

