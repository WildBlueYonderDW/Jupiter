// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_1407e72346815bc3;
#using script_5af9038262d22c96;
#using scripts\mp\utility\perk.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_a741300253ce87f0;

// Namespace namespace_a741300253ce87f0/namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101
// Size: 0x5e
function init() {
    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
        level.var_6ccee8e6c00f06e6 = &namespace_583fd9066a09cd33::init_player;
        setdvarifuninitialized(@"hash_50363b4004713d67", 1);
        if (getdvarint(@"hash_50363b4004713d67")) {
            level.stealth.var_84cc26fcabcafce7 = &function_9856971a6bda1bea;
            level thread namespace_4d62562249d2171e::function_a5ff5e1965faf40e();
        }
    }
}

// Namespace namespace_a741300253ce87f0/namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166
// Size: 0x38
function init_player() {
    self waittill("giveLoadout");
    if (isdefined(level.stealth.var_84cc26fcabcafce7)) {
        [[ level.stealth.var_84cc26fcabcafce7 ]]();
    }
}

// Namespace namespace_a741300253ce87f0/namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5
// Size: 0x4d
function function_9856971a6bda1bea() {
    self endon("death");
    self.var_88606454e690c77 = spawnstruct();
    self.var_88606454e690c77.active = 1;
    /#
        setdvarifuninitialized(@"hash_3a87475a75de0350", 0);
    #/
    namespace_82dcd1d5ae30ff7::giveperk("specialty_ai_stealth_sixth_sense");
}

// Namespace namespace_a741300253ce87f0/namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9
// Size: 0x2d
function dropaiaccuracy() {
    if (!namespace_448ccf1ca136fbbe::function_a10967d736dc56e5()) {
        return;
    }
    /#
        assertex(isplayer(self), " This function needs to be called on a Player entity ");
    #/
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(0.1);
}

// Namespace namespace_a741300253ce87f0/namespace_583fd9066a09cd33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x2a
function revertaiaccuracy() {
    if (!namespace_448ccf1ca136fbbe::function_a10967d736dc56e5()) {
        return;
    }
    /#
        assertex(isplayer(self), " This function needs to be called on a Player entity ");
    #/
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(1);
}

