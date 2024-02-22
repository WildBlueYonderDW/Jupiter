// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_6bfe39bd5c12f84a;

#namespace namespace_8a7fbc5545f75867;

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130
// Size: 0x6b
function function_764239e6a246c46a() {
    var_fe7e82f6d37cda80 = [];
    var_fe7e82f6d37cda80["shouldRun"] = &function_dcbff0f91b68341d;
    var_fe7e82f6d37cda80["enableForClient"] = &function_4999a7fd384d2fb4;
    var_fe7e82f6d37cda80["disable"] = &function_11f7a27364a8b75d;
    var_fe7e82f6d37cda80["checkForDataUpdates"] = &function_5d19d3f8062e4bee;
    var_fe7e82f6d37cda80["getADSWeaponDist"] = &function_553772f1f998aa41;
    var_fe7e82f6d37cda80["getTargetArray"] = &function_6be4502bdbd97c85;
    var_fe7e82f6d37cda80["outlineOccluded"] = &function_e392446751b714f6;
    return var_fe7e82f6d37cda80;
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x8a
function function_dcbff0f91b68341d() {
    level endon("game_ended");
    if (namespace_cd0b2d039510b38d::ismlgmatch()) {
        return 0;
    }
    var_988dcec550dbc94e = namespace_cd0b2d039510b38d::privatematch() || level.systemlink;
    if (!var_988dcec550dbc94e) {
        return 0;
    }
    while (!isdefined(level.players) || level.players.size == 0) {
        wait(0.05);
    }
    wait(0.1);
    var_2291fa3ef89a8550 = 0;
    while (!var_2291fa3ef89a8550) {
        var_2291fa3ef89a8550 = function_2e2a6c022b5ed8db();
        wait(3);
    }
    return var_988dcec550dbc94e && var_2291fa3ef89a8550;
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x8b
function function_2e2a6c022b5ed8db() {
    var_2291fa3ef89a8550 = 0;
    foreach (player in level.players) {
        if (player ishost()) {
            var_d1b436910914f40e = function_7bcb4b0b404dc8a8(player);
            if (isdefined(var_d1b436910914f40e) && var_d1b436910914f40e > 0) {
                var_2291fa3ef89a8550 = 1;
            }
            break;
        }
    }
    return var_2291fa3ef89a8550;
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8
// Size: 0x26
function function_4999a7fd384d2fb4(client, assetname, prioritygroup) {
    return namespace_cbd3754a0c69cc63::outlineenableforplayer(self, client, assetname, prioritygroup);
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0x15
function function_11f7a27364a8b75d(id) {
    namespace_cbd3754a0c69cc63::outlinedisable(id, self);
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x312
// Size: 0x2a
function function_553772f1f998aa41() {
    weapon = self getcurrentweapon();
    if (weaponclass(weapon) == "sniper") {
        return 8192;
    }
    return 2048;
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344
// Size: 0x5d
function function_6be4502bdbd97c85(client) {
    friendlyplayers = namespace_54d20dd0dd79277f::getfriendlyplayers(client.team);
    enemyplayers = namespace_54d20dd0dd79277f::getenemyplayers(client.team);
    aiarray = getaiarray();
    return array_combine(friendlyplayers, enemyplayers, aiarray);
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x1c
function function_e392446751b714f6(startpoint, endpoint) {
    return namespace_cbd3754a0c69cc63::outlineoccluded(startpoint, endpoint);
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0xb6
function function_5d19d3f8062e4bee() {
    while (1) {
        wait(1);
        if (!isdefined(level.players)) {
            continue;
        }
        foreach (player in level.players) {
            var_d1b436910914f40e = function_7bcb4b0b404dc8a8(player);
            if (isdefined(var_d1b436910914f40e)) {
                if (isdefined(player.visibilitymodeval)) {
                    if (var_d1b436910914f40e != player.visibilitymodeval) {
                        player namespace_c5f7e08ad7ea4280::function_8c2e8285c9915b12(var_d1b436910914f40e);
                    }
                } else {
                    player namespace_c5f7e08ad7ea4280::function_8c2e8285c9915b12(var_d1b436910914f40e);
                }
            }
        }
    }
}

// Namespace namespace_8a7fbc5545f75867/namespace_93121fa16281c01c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0x31
function function_7bcb4b0b404dc8a8(player) {
    var_d1b436910914f40e = player getplayerdata(level.loadoutsgroup, "squadMembers", "highVisibilityMode");
    return var_d1b436910914f40e;
}

