// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace rat;

// Namespace rat/namespace_bb666c82715fa89d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x16a
function init() {
    if (isdefined(level.var_6392befa93ae3cc6)) {
        return;
    }
    level.var_6392befa93ae3cc6 = [];
    level.var_91ca776f27d516c0 = [];
    function_7a2df9055cb22721("RatGetPlayerPosition", &ratgetplayerposition, "vector3");
    function_7a2df9055cb22721("RatGetPlayerAngles", &ratgetplayerangles, "vector3");
    function_7a2df9055cb22721("RatGetPlayerIsSwitchingWeapon", &ratgetplayerisswitchingweapon, "bool");
    function_7a2df9055cb22721("RatGetPlayerIsReloading", &ratgetplayerisreloading, "bool");
    function_7a2df9055cb22721("RatGetPlayerIsMeleeing", &ratgetplayerismeleeing, "bool");
    function_7a2df9055cb22721("RatGetPlayerADS", &ratgetplayerads, "float");
    function_7a2df9055cb22721("RatGetPlayerStance", &ratgetplayerstance, "string");
    function_7a2df9055cb22721("RatGetPlayerHealth", &ratgetplayerhealth, "int64_t");
    function_7a2df9055cb22721("RatSetPlayerHealth", &ratsetplayerhealth);
    function_7a2df9055cb22721("RatDoDamage", &ratdodamage, "bool");
    function_7a2df9055cb22721("RatGetClipAmmoCount", &ratgetclipammocount, "int64_t");
    function_7a2df9055cb22721("RatGetTotalAmmoCount", &ratgettotalammocount, "int64_t");
    function_7a2df9055cb22721("RatGetCompleteWeaponName", &ratgetcompleteweaponname, "string");
    function_7a2df9055cb22721("RatGetPlayerKills", &ratgetplayerkills, "int64_t");
    function_7a2df9055cb22721("RatGetPlayerDeaths", &ratgetplayerdeaths, "int64_t");
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0x47
function function_7a2df9055cb22721(var_9bc7c47cbf86e43d, var_66130ef1f7f7270f, var_e249b3b7ec719cb4) {
    key = tolower(var_9bc7c47cbf86e43d);
    level.var_6392befa93ae3cc6[key] = var_66130ef1f7f7270f;
    level.var_91ca776f27d516c0[key] = var_e249b3b7ec719cb4;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x44
function function_70cf605d288ebae(var_9bc7c47cbf86e43d) {
    init();
    key = tolower(var_9bc7c47cbf86e43d);
    if (isdefined(level.var_91ca776f27d516c0[key])) {
        return level.var_91ca776f27d516c0[key];
    }
    return "";
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0
// Size: 0x6b
function function_b596c6ff2e019c61(params) {
    /#
        assert(isdefined(params._cmd));
    #/
    key = tolower(params._cmd);
    /#
        assert(isdefined(level.var_6392befa93ae3cc6[key]));
    #/
    func = level.var_6392befa93ae3cc6[key];
    return [[ func ]](params);
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x463
// Size: 0xe2
function getplayer(params) {
    if (isdefined(params.xuid)) {
        xuid = int(params.xuid);
        players = getentarray("player", "classname");
        for (index = 0; index < players.size; index++) {
            player = players[index];
            if (!isdefined(player.bot)) {
                params.xuid = int(player getxuid());
                if (xuid == params.xuid) {
                    return player;
                }
            }
        }
    }
    if (!isdefined(level.players) || !isdefined(level.players[0])) {
        return level.player;
    }
    return level.players[0];
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d
// Size: 0x37
function ratgetplayerposition(params) {
    player = getplayer(params);
    return player.origin + (0, 0, 60);
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0x4b
function ratgetplayerangles(params) {
    player = getplayer(params);
    playerangles = player getplayerangles();
    return ((playerangles[0] + 360) % 360, (playerangles[1] + 360) % 360, playerangles[2]);
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df
// Size: 0x24
function ratgetplayerisswitchingweapon(params) {
    player = getplayer(params);
    return player isswitchingweapon();
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x24
function ratgetplayerisreloading(params) {
    player = getplayer(params);
    return player isreloading();
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x637
// Size: 0x24
function ratgetplayerismeleeing(params) {
    player = getplayer(params);
    return player ismeleeing();
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663
// Size: 0x24
function ratgetplayerads(params) {
    player = getplayer(params);
    return player playerads();
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68f
// Size: 0x24
function ratgetplayerstance(params) {
    player = getplayer(params);
    return player getstance();
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bb
// Size: 0x29
function ratgetplayerhealth(params) {
    player = getplayer(params);
    return player.health;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec
// Size: 0x4c
function ratsetplayerhealth(params) {
    amount = intvalue(params.amount, 1);
    player = getplayer(params);
    player.health = amount;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f
// Size: 0xd0
function ratdodamage(params) {
    amount = function_b4a0db97ee6d9256(params.amount, 1);
    var_26fe25f7f39de3a8 = function_237b5b4dd63c605e(params.var_26fe25f7f39de3a8, 0);
    player = getplayer(params);
    if (var_26fe25f7f39de3a8) {
        var_8e3f23290b67f726 = getdvarint(@"hash_45dd70c0ac1afda2");
        setdvar(@"hash_45dd70c0ac1afda2", 1);
        success = player dodamage(amount, player.origin);
        setdvar(@"hash_45dd70c0ac1afda2", var_8e3f23290b67f726);
    } else {
        success = player dodamage(amount, player.origin, player);
    }
    return success;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x817
// Size: 0x24
function ratgetclipammocount(params) {
    player = getplayer(params);
    return player getcurrentweaponclipammo();
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x843
// Size: 0x36
function ratgettotalammocount(params) {
    player = getplayer(params);
    currentweapon = player getcurrentweapon();
    return player getammocount(currentweapon);
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x881
// Size: 0x41
function ratgetcompleteweaponname(params) {
    player = getplayer(params);
    currentweapon = player getcurrentweapon();
    weaponname = getcompleteweaponname(currentweapon);
    return weaponname;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ca
// Size: 0x29
function ratgetplayerkills(params) {
    player = getplayer(params);
    return player.kills;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fb
// Size: 0x29
function ratgetplayerdeaths(params) {
    player = getplayer(params);
    return player.deaths;
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c
// Size: 0x21
function intvalue(param, default_val) {
    if (!isdefined(param)) {
        return default_val;
    }
    return int(param);
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x955
// Size: 0x21
function function_b4a0db97ee6d9256(param, default_val) {
    if (!isdefined(param)) {
        return default_val;
    }
    return float(param);
}

// Namespace rat/namespace_bb666c82715fa89d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97e
// Size: 0x45
function function_237b5b4dd63c605e(param, default_val) {
    if (!isdefined(param)) {
        return default_val;
    }
    var_11ca4146797da8f0 = tolower(param);
    if (var_11ca4146797da8f0 == "false" || var_11ca4146797da8f0 == "0") {
        return 0;
    }
    return 1;
}

