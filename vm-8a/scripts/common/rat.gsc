#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace rat;

// Namespace rat / scripts\common\rat
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x169
function init() {
    if (isdefined(level.var_6392befa93ae3cc6)) {
        return;
    }
    level.var_6392befa93ae3cc6 = [];
    level.var_91ca776f27d516c0 = [];
    function_7a2df9055cb22721("RatGetPlayerPosition", &RatGetPlayerPosition, "vector3");
    function_7a2df9055cb22721("RatGetPlayerAngles", &RatGetPlayerAngles, "vector3");
    function_7a2df9055cb22721("RatGetPlayerIsSwitchingWeapon", &RatGetPlayerIsSwitchingWeapon, "bool");
    function_7a2df9055cb22721("RatGetPlayerIsReloading", &RatGetPlayerIsReloading, "bool");
    function_7a2df9055cb22721("RatGetPlayerIsMeleeing", &RatGetPlayerIsMeleeing, "bool");
    function_7a2df9055cb22721("RatGetPlayerADS", &RatGetPlayerADS, "float");
    function_7a2df9055cb22721("RatGetPlayerStance", &RatGetPlayerStance, "string");
    function_7a2df9055cb22721("RatGetPlayerHealth", &RatGetPlayerHealth, "int64_t");
    function_7a2df9055cb22721("RatSetPlayerHealth", &RatSetPlayerHealth);
    function_7a2df9055cb22721("RatDoDamage", &RatDoDamage, "bool");
    function_7a2df9055cb22721("RatGetClipAmmoCount", &RatGetClipAmmoCount, "int64_t");
    function_7a2df9055cb22721("RatGetTotalAmmoCount", &RatGetTotalAmmoCount, "int64_t");
    function_7a2df9055cb22721("RatGetCompleteWeaponName", &RatGetCompleteWeaponName, "string");
    function_7a2df9055cb22721("RatGetPlayerKills", &RatGetPlayerKills, "int64_t");
    function_7a2df9055cb22721("RatGetPlayerDeaths", &RatGetPlayerDeaths, "int64_t");
}

// Namespace rat / scripts\common\rat
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0x46
function function_7a2df9055cb22721(function_name, function_ref, return_type) {
    key = tolower(function_name);
    level.var_6392befa93ae3cc6[key] = function_ref;
    level.var_91ca776f27d516c0[key] = return_type;
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x43
function function_70cf605d288ebae(function_name) {
    init();
    key = tolower(function_name);
    if (isdefined(level.var_91ca776f27d516c0[key])) {
        return level.var_91ca776f27d516c0[key];
    }
    return "";
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0
// Size: 0x6a
function function_b596c6ff2e019c61(params) {
    assert(isdefined(params._cmd));
    key = tolower(params._cmd);
    assert(isdefined(level.var_6392befa93ae3cc6[key]));
    func = level.var_6392befa93ae3cc6[key];
    return [[ func ]](params);
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x463
// Size: 0xe1
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

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d
// Size: 0x36
function RatGetPlayerPosition(params) {
    player = getplayer(params);
    return player.origin + (0, 0, 60);
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0x4a
function RatGetPlayerAngles(params) {
    player = getplayer(params);
    playerangles = player getplayerangles();
    return ((playerangles[0] + 360) % 360, (playerangles[1] + 360) % 360, playerangles[2]);
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df
// Size: 0x23
function RatGetPlayerIsSwitchingWeapon(params) {
    player = getplayer(params);
    return player isswitchingweapon();
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x23
function RatGetPlayerIsReloading(params) {
    player = getplayer(params);
    return player isreloading();
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x637
// Size: 0x23
function RatGetPlayerIsMeleeing(params) {
    player = getplayer(params);
    return player ismeleeing();
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663
// Size: 0x23
function RatGetPlayerADS(params) {
    player = getplayer(params);
    return player playerads();
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68f
// Size: 0x23
function RatGetPlayerStance(params) {
    player = getplayer(params);
    return player getstance();
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bb
// Size: 0x28
function RatGetPlayerHealth(params) {
    player = getplayer(params);
    return player.health;
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec
// Size: 0x4b
function RatSetPlayerHealth(params) {
    amount = intvalue(params.amount, 1);
    player = getplayer(params);
    player.health = amount;
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f
// Size: 0xcf
function RatDoDamage(params) {
    amount = floatvalue(params.amount, 1);
    force_damage = boolvalue(params.force_damage, 0);
    player = getplayer(params);
    if (force_damage) {
        var_8e3f23290b67f726 = getdvarint(@"hash_45dd70c0ac1afda2");
        setdvar(@"hash_45dd70c0ac1afda2", 1);
        success = player dodamage(amount, player.origin);
        setdvar(@"hash_45dd70c0ac1afda2", var_8e3f23290b67f726);
    } else {
        success = player dodamage(amount, player.origin, player);
    }
    return success;
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x817
// Size: 0x23
function RatGetClipAmmoCount(params) {
    player = getplayer(params);
    return player getcurrentweaponclipammo();
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x843
// Size: 0x35
function RatGetTotalAmmoCount(params) {
    player = getplayer(params);
    currentweapon = player getcurrentweapon();
    return player getammocount(currentweapon);
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x881
// Size: 0x40
function RatGetCompleteWeaponName(params) {
    player = getplayer(params);
    currentweapon = player getcurrentweapon();
    weaponname = getcompleteweaponname(currentweapon);
    return weaponname;
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ca
// Size: 0x28
function RatGetPlayerKills(params) {
    player = getplayer(params);
    return player.kills;
}

// Namespace rat / scripts\common\rat
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fb
// Size: 0x28
function RatGetPlayerDeaths(params) {
    player = getplayer(params);
    return player.deaths;
}

// Namespace rat / scripts\common\rat
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c
// Size: 0x20
function intvalue(param, default_val) {
    if (!isdefined(param)) {
        return default_val;
    }
    return int(param);
}

// Namespace rat / scripts\common\rat
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x955
// Size: 0x20
function floatvalue(param, default_val) {
    if (!isdefined(param)) {
        return default_val;
    }
    return float(param);
}

// Namespace rat / scripts\common\rat
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97e
// Size: 0x44
function boolvalue(param, default_val) {
    if (!isdefined(param)) {
        return default_val;
    }
    param_lower = tolower(param);
    if (param_lower == "false" || param_lower == "0") {
        return 0;
    }
    return 1;
}

