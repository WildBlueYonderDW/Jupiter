// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_493bf119b3b0c251;

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8
// Size: 0x44
function function_94b952789d039abb() {
    /#
        if (getdvarint(@"hash_c68acbd0f58df6b0", 0) != 0) {
            return 1;
        }
        if (getdvarint(@"hash_6f29400118ddd39b", 0) != 0) {
            return 0;
        }
    #/
    return getdvarint(@"hash_939a1fd9dabf7e30", 0) != 0;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144
// Size: 0x45
function function_2195503b0dcc12c0() {
    if (function_a226c96f1ba59cd0()) {
        level.var_98bbc6461bb67f0b = spawnstruct();
        level.var_98bbc6461bb67f0b.var_f8f7108d5f8686c9 = [];
        level.var_98bbc6461bb67f0b.var_4faacf7795179c8f = 1;
    }
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x190
// Size: 0x13
function private function_a226c96f1ba59cd0() {
    return istrue(getdvarint(@"hash_9615d7fb7cf74e4c", 0));
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab
// Size: 0x4a
function function_83fc92d8ce12ec9e(var_8fa011b559791f7) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    var_fb7636d1a4a5a6e3 = function_8e931d2f54036d6d("ftueProgress", var_8fa011b559791f7, "completed");
    return var_fb7636d1a4a5a6e3 > 0;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fd
// Size: 0x2d
function private function_8951a5e5929491bb(var_8fa011b559791f7) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    return 1;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x6b
function function_e05669c955312c22(var_8fa011b559791f7, value) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    var_1e0f3b7cd5051cc6 = function_8951a5e5929491bb(var_8fa011b559791f7);
    function_ef834a530f602e31("ftueProgress", var_8fa011b559791f7, "completed", value);
    function_ef834a530f602e31("ftueProgress", var_8fa011b559791f7, "completedVersion", var_1e0f3b7cd5051cc6);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0x48
function function_f3c2d9fe39c96c53(var_8fa011b559791f7) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    version = function_8e931d2f54036d6d("ftueProgress", var_8fa011b559791f7, "completedVersion");
    return version;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x2d
function function_a220dac697d2ea35() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    return function_70e4a8c54777f552("brMatchPlayTime");
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329
// Size: 0x4b
function function_2f80e3ca1b2374a(playtime) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    var_7872badf3d67b9 = function_a220dac697d2ea35() + playtime;
    function_9c70c77ccecb444e("brMatchPlayTime", var_7872badf3d67b9);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b
// Size: 0x2d
function function_da8cf8dbdb763ae() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    return function_70e4a8c54777f552("matchesCompleted");
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b0
// Size: 0x44
function function_312e1babffbdf863() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    var_e3bae78e134d874d = function_da8cf8dbdb763ae() + 1;
    function_9c70c77ccecb444e("matchesCompleted", var_e3bae78e134d874d);
    return var_e3bae78e134d874d;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc
// Size: 0x51
function function_663fcc46a62ebe2b(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_31c4c1d952b9e73d));
    #/
    var_a1e085d89d95dc6f = function_da8cf8dbdb763ae();
    if (var_a1e085d89d95dc6f >= params.var_31c4c1d952b9e73d) {
        return 1;
    }
    return 0;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455
// Size: 0x58
function function_a25d14ecf8dcb49e(index) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    var_40145099a2bf47ca = function_1e6d534caef3039f();
    mask = 1 << index;
    var_40145099a2bf47ca = var_40145099a2bf47ca | mask;
    function_e35c082c18ff343b(var_40145099a2bf47ca);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4
// Size: 0x4f
function function_5f50ae7bff599e0a(index) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    var_40145099a2bf47ca = function_1e6d534caef3039f();
    mask = 1 << index;
    return istrue(var_40145099a2bf47ca & mask);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b
// Size: 0x4e
function function_7fbc76f1aefc8fc5() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    if (function_a226c96f1ba59cd0()) {
        return level.var_98bbc6461bb67f0b.var_4faacf7795179c8f;
    } else {
        return function_70e4a8c54777f552("playerExpertiseOption");
    }
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x560
// Size: 0x3a
function function_3fa91b90ba5753e7() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    disabled = function_70e4a8c54777f552("tooltipsDisabled");
    return !disabled;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a2
// Size: 0x1c
function private function_70e4a8c54777f552(data) {
    return function_1e8137aca9687477(level.var_114256fded8103cd, data);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c6
// Size: 0x26
function private function_9c70c77ccecb444e(data, value) {
    function_7a70551396a38f2b(level.var_114256fded8103cd, data, value);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5f3
// Size: 0x2e
function private function_8e931d2f54036d6d(arrayname, index, data) {
    return function_2fb0985cf3162e78(level.var_114256fded8103cd, arrayname, index, data);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x629
// Size: 0x38
function private function_ef834a530f602e31(arrayname, index, data, value) {
    function_24615288bde909b4(level.var_114256fded8103cd, arrayname, index, data, value);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x668
// Size: 0x4c
function private function_1e8137aca9687477(key, data) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    playerdata = self getplayerdata("mp", key, data);
    return playerdata;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bc
// Size: 0x5e
function private function_2fb0985cf3162e78(key, arrayname, index, data) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    playerdata = self getplayerdata("mp", key, arrayname, index, data);
    return playerdata;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x4a
function private function_7a70551396a38f2b(key, data, value) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    self setplayerdata("mp", key, data, value);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x773
// Size: 0x5c
function private function_24615288bde909b4(key, arrayname, index, data, value) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(!isbot(self));
    #/
    self setplayerdata("mp", key, arrayname, index, data, value);
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d6
// Size: 0x32
function private function_1e6d534caef3039f() {
    var_40145099a2bf47ca = 0;
    if (function_a226c96f1ba59cd0()) {
        var_40145099a2bf47ca = function_892873a4b3c135ef(self);
    } else {
        var_40145099a2bf47ca = function_70e4a8c54777f552("tooltipsCompleted_01");
    }
    return var_40145099a2bf47ca;
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x810
// Size: 0x2e
function private function_e35c082c18ff343b(var_40145099a2bf47ca) {
    if (function_a226c96f1ba59cd0()) {
        function_c79da86a5696572b(self, var_40145099a2bf47ca);
    } else {
        function_9c70c77ccecb444e("tooltipsCompleted_01", var_40145099a2bf47ca);
    }
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x845
// Size: 0x8d
function private function_892873a4b3c135ef(player) {
    function_aa20cca13a2cc9cd(player);
    foreach (entry in level.var_98bbc6461bb67f0b.var_f8f7108d5f8686c9) {
        if (isdefined(entry) && entry.player == player) {
            return entry.var_efc2b352015e6b82;
        }
    }
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d9
// Size: 0x99
function private function_c79da86a5696572b(player, value) {
    function_aa20cca13a2cc9cd(player);
    foreach (entry in level.var_98bbc6461bb67f0b.var_f8f7108d5f8686c9) {
        if (isdefined(entry) && entry.player == player) {
            entry.var_efc2b352015e6b82 = value;
            break;
        }
    }
}

// Namespace namespace_493bf119b3b0c251/namespace_b97271dc63a81cc0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x979
// Size: 0xd7
function private function_aa20cca13a2cc9cd(player) {
    foreach (entry in level.var_98bbc6461bb67f0b.var_f8f7108d5f8686c9) {
        if (isdefined(entry) && entry.player == player) {
            return;
        }
    }
    entry = spawnstruct();
    entry.player = player;
    entry.var_efc2b352015e6b82 = getdvarint(@"hash_92e4360591ae4baf", 0);
    level.var_98bbc6461bb67f0b.var_f8f7108d5f8686c9 = array_add_safe(level.var_98bbc6461bb67f0b.var_f8f7108d5f8686c9, entry);
}

