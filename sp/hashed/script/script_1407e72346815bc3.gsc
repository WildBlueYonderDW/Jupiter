#using script_1407e72346815bc3;
#using script_5af9038262d22c96;
#using scripts\engine\utility;
#using scripts\mp\utility\perk;

#namespace manager_mp;

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb
// Size: 0x8d
function init() {
    if (getdvar(@"hash_7611a2790a0bf7fe", "") == "dmz" || getdvar(@"hash_7611a2790a0bf7fe", "") == "exgm") {
        level.var_6ccee8e6c00f06e6 = &namespace_583fd9066a09cd33::init_player;
        setdvarifuninitialized(@"hash_50363b4004713d67", 1);
        if (getdvarint(@"hash_50363b4004713d67")) {
            level.stealth.fnsixthsense = &sixthsense_init;
            level thread namespace_4d62562249d2171e::function_a5ff5e1965faf40e();
        }
    }
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190
// Size: 0x37
function init_player() {
    self waittill("giveLoadout");
    if (isdefined(level.stealth.fnsixthsense)) {
        [[ level.stealth.fnsixthsense ]]();
    }
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf
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
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0x30
function dropaiaccuracy() {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    assertex(isplayer(self), " This function needs to be called on a Player entity ");
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(0.1);
}

// Namespace manager_mp / namespace_583fd9066a09cd33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x2d
function revertaiaccuracy() {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    assertex(isplayer(self), " This function needs to be called on a Player entity ");
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(1);
}

