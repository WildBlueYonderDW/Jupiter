// mwiii decomp prototype
#using script_6981400abfcd765c;
#using scripts\mp\rank.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\gamelogic.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\weaponrank.gsc;

#namespace namespace_41183c2c6273d8f;

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4
// Size: 0x20
function function_89e1a31bd1de0567() {
    return function_94b952789d039abb() && getdvarint(@"hash_81f6cb3096a4d43d", 1) == 1;
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc
// Size: 0x25
function function_ee43f827080726b1() {
    player = self;
    return player function_83fc92d8ce12ec9e(2) && !player function_83fc92d8ce12ec9e(3);
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x3f
function function_87ecb716bc207294(player) {
    if (isbot(player)) {
        return undefined;
    }
    if (player function_ee43f827080726b1()) {
        player function_e05669c955312c22(3, 1);
        if (function_89e1a31bd1de0567()) {
            return player function_2d8bac720c7f42bb();
        }
    }
    return undefined;
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170
// Size: 0x6c
function function_8b40ab90e906603c() {
    if (!function_83fc92d8ce12ec9e(2)) {
        return 0;
    }
    var_cda7f1d4f4ad320f = function_ee43f827080726b1();
    if (var_cda7f1d4f4ad320f) {
        self.var_56f36fd7cc3d8098 = 1;
    }
    var_b8c73cddeffdcb64 = var_cda7f1d4f4ad320f;
    if (!var_b8c73cddeffdcb64) {
        for (progress = 3; progress <= 12; progress++) {
            if (function_6e6a5ca23b27a0f7(progress)) {
                var_b8c73cddeffdcb64 = 1;
                break;
            }
        }
    }
    return var_b8c73cddeffdcb64;
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e4
// Size: 0x91
function private function_6e6a5ca23b27a0f7(match) {
    if (match < 3) {
        return 0;
    }
    if (match == 4 || match == 6) {
        return 0;
    }
    if (function_83fc92d8ce12ec9e(match)) {
        return 0;
    }
    var_93b9cd6d97804488 = 1;
    if (self getprivatepartysize() > 1) {
        var_93b9cd6d97804488 = getdvarint(@"hash_c8e3d38b6e1b91f8", 1) == 0;
        if (var_93b9cd6d97804488) {
            var_93b9cd6d97804488 = getdvarint(@"hash_d9d26a804ed1a1aa", 1) == 0 || !self isfireteamleader();
        }
    }
    if (var_93b9cd6d97804488) {
        function_e05669c955312c22(match, 1);
    }
    return 1;
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d
// Size: 0x27
function function_70781ace6e552a59() {
    return isplayer(self) && !isbot(self) && function_1147bbc93ea9b83c() && function_ee43f827080726b1();
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ac
// Size: 0x13
function private function_4e21c98001ba4234() {
    return getdvarint(@"hash_13a4ace57e9b30c9", 3);
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c7
// Size: 0x13
function private function_d6bb894eceead27a() {
    return getdvarint(@"hash_6bc7552224fa36e3", 1);
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0x16
function private function_15ca97c3fbeb7f4c() {
    return getdvar(@"hash_9652fdeee6b218ab", "iw9_ar_mike4");
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x300
// Size: 0x2e
function private function_7aeef922b38c730b() {
    player = self;
    return !isbot(player) && player getrankxp() < getrankinfomaxxp(function_4e21c98001ba4234());
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x336
// Size: 0x4b
function private function_f2a89a989cfa8bc7() {
    player = self;
    curweapon = player getcurrentweapon();
    weapname = namespace_e0ee43ef2dddadaa::getweaponrootname(curweapon);
    return !isbot(player) && namespace_4cd6e0abb58d4200::getplayerweaponrank(weapname) < function_d6bb894eceead27a();
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x389
// Size: 0x133
function private function_2d8bac720c7f42bb() {
    player = self;
    var_9fe50c508cce09f = player function_7aeef922b38c730b();
    var_b6abc53fe90bf80b = player function_f2a89a989cfa8bc7();
    values = spawnstruct();
    var_dfe29a76a113f620 = 0;
    if (var_9fe50c508cce09f) {
        var_dfe29a76a113f620 = player function_ab7376cf3322041f();
    }
    values.var_efe4124eaa21ea43 = var_dfe29a76a113f620;
    values.var_5db83a557fcd180 = var_dfe29a76a113f620;
    values.var_dd7d0ddb84506614 = var_dfe29a76a113f620;
    values.placementxp = 0;
    values.bonusxp = 0;
    var_46b845634a24856c = 0;
    var_904c82687ddfeb02 = 0;
    if (var_b6abc53fe90bf80b) {
        var_1bd089321bb876b3 = function_15ca97c3fbeb7f4c();
        if (isdefined(level.weaponmapdata[var_1bd089321bb876b3]) && isdefined(level.weaponmapdata[var_1bd089321bb876b3].var_904c82687ddfeb02)) {
            var_904c82687ddfeb02 = level.weaponmapdata[var_1bd089321bb876b3].var_904c82687ddfeb02;
        }
        var_46b845634a24856c = player function_8cb6f3856a8745af();
    }
    values.var_904c82687ddfeb02 = var_904c82687ddfeb02;
    values.weaponXP = var_46b845634a24856c;
    return values;
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x89
function private function_ab7376cf3322041f() {
    player = self;
    var_c0be48950cf3e343 = getdvarint(@"hash_13a4ace57e9b30c9", 0);
    rankxp = getrankinfomaxxp(var_c0be48950cf3e343);
    var_450a34ef30ab6217 = player getplayerdata("common", "mpProgression", "playerLevel", "xp") + player.pers["summary"]["xp"];
    return int(max(rankxp - 1 - var_450a34ef30ab6217, 0));
}

// Namespace namespace_41183c2c6273d8f/namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x555
// Size: 0x39
function private function_8cb6f3856a8745af() {
    player = self;
    return int(max(namespace_4cd6e0abb58d4200::getweaponrankinfominxp(function_d6bb894eceead27a()) - player namespace_4cd6e0abb58d4200::getplayerweaponrankxp(function_15ca97c3fbeb7f4c(), "mp"), 0));
}

