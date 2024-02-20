// mwiii decomp prototype
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

// Namespace whizby/namespace_3357ae493a0ac10f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x26
function init() {
    setdvarifuninitialized(@"hash_9789797e3340f37a", 0);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    namespace_d55725aa5dd0745b::init();
}

// Namespace whizby/namespace_3357ae493a0ac10f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e
// Size: 0xb
function onplayerspawned() {
    thread whizbythink();
}

// Namespace whizby/namespace_3357ae493a0ac10f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x74
function whizbythink() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    effecttime = gettime();
    namespace_d55725aa5dd0745b::initplayer();
    for (;;) {
        forward = position = distance = attacker = self waittill("bulletwhizby");
        effecttime = dowhizby(attacker, distance, position, forward, effecttime);
        function_6daf5b3c904637e7(attacker);
    }
}

// Namespace whizby/namespace_3357ae493a0ac10f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x9b
function dowhizby(attacker, distance, position, forward, effecttime) {
    currenttime = gettime();
    if (!isusingremote()) {
        thread namespace_d55725aa5dd0745b::function_a6e6611efb4164d5(attacker, distance, position, forward);
    }
    weapon = attacker getcurrentweapon();
    if (isdefined(weapon) && weaponclass(weapon) == "sniper") {
        namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_cafa7ad7442c35d5", undefined, 0.2);
    }
    thread namespace_25c5a6f43bb97b43::addrecentattacker(attacker);
    return effecttime;
}

// Namespace whizby/namespace_3357ae493a0ac10f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e
// Size: 0x7c
function function_6daf5b3c904637e7(attacker) {
    if (getdvarint(@"hash_9789797e3340f37a", 1) == 1) {
        weapon = attacker getcurrentweapon();
        if (weapon hasattachment("linearbrake") && !namespace_e0ee43ef2dddadaa::iskillstreakweapon(weapon) && !namespace_82dcd1d5ae30ff7::_hasperk("specialty_blastshield")) {
            attacker hudicontype("suppression");
            namespace_e8a49b70d0769b66::trackdebuffassist(attacker, self, weapon.basename);
        }
    }
}

