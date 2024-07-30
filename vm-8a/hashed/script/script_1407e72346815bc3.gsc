#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_1407e72346815bc3;
#using script_5af9038262d22c96;
#using scripts\mp\utility\perk.gsc;
#using scripts\common\utility.gsc;

#namespace manager_mp;

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101
// Size: 0x5d
function init() {
    if (scripts\cp_mp\utility\game_utility::function_42e2dcfd4571b89b()) {
        level.var_6ccee8e6c00f06e6 = &namespace_583fd9066a09cd33::init_player;
        setdvarifuninitialized(@"hash_50363b4004713d67", 1);
        if (getdvarint(@"hash_50363b4004713d67")) {
            level.stealth.fnsixthsense = &sixthsense_init;
            level thread namespace_4d62562249d2171e::function_a5ff5e1965faf40e();
        }
    }
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166
// Size: 0x37
function init_player() {
    self waittill("giveLoadout");
    if (isdefined(level.stealth.fnsixthsense)) {
        [[ level.stealth.fnsixthsense ]]();
    }
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5
// Size: 0x4c
function sixthsense_init() {
    self endon("death");
    self.sixthsense = spawnstruct();
    self.sixthsense.active = 1;
    /#
        setdvarifuninitialized(@"hash_3a87475a75de0350", 0);
    #/
    scripts\mp\utility\perk::giveperk("specialty_ai_stealth_sixth_sense");
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9
// Size: 0x2c
function dropaiaccuracy() {
    if (!scripts\common\utility::function_a10967d736dc56e5()) {
        return;
    }
    assertex(isplayer(self), " This function needs to be called on a Player entity ");
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(0.1);
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x29
function revertaiaccuracy() {
    if (!scripts\common\utility::function_a10967d736dc56e5()) {
        return;
    }
    assertex(isplayer(self), " This function needs to be called on a Player entity ");
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(1);
}

