// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_6bfe39bd5c12f84a;

#namespace namespace_8a7fbc5545f75867;

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130
// Size: 0x6b
function function_764239e6a246c46a() {
    funcarray = [];
    funcarray["shouldRun"] = &function_dcbff0f91b68341d;
    funcarray["enableForClient"] = &function_4999a7fd384d2fb4;
    funcarray["disable"] = &function_11f7a27364a8b75d;
    funcarray["checkForDataUpdates"] = &function_5d19d3f8062e4bee;
    funcarray["getADSWeaponDist"] = &function_553772f1f998aa41;
    funcarray["getTargetArray"] = &function_6be4502bdbd97c85;
    funcarray["outlineOccluded"] = &function_e392446751b714f6;
    return funcarray;
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x8a
function function_dcbff0f91b68341d() {
    level endon("game_ended");
    if (scripts/mp/utility/game::ismlgmatch()) {
        return false;
    }
    canrun = scripts/mp/utility/game::privatematch() || level.systemlink;
    if (!canrun) {
        return false;
    }
    while (!isdefined(level.players) || level.players.size == 0) {
        wait(0.05);
    }
    wait(0.1);
    hostenabled = 0;
    while (!hostenabled) {
        hostenabled = function_2e2a6c022b5ed8db();
        wait(3);
    }
    return canrun && hostenabled;
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x8b
function function_2e2a6c022b5ed8db() {
    hostenabled = 0;
    foreach (player in level.players) {
        if (player ishost()) {
            datavalue = function_7bcb4b0b404dc8a8(player);
            if (isdefined(datavalue) && datavalue > 0) {
                hostenabled = 1;
            }
            break;
        }
    }
    return hostenabled;
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8
// Size: 0x26
function function_4999a7fd384d2fb4(client, assetname, prioritygroup) {
    return scripts/mp/utility/outline::outlineenableforplayer(self, client, assetname, prioritygroup);
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0x15
function function_11f7a27364a8b75d(id) {
    scripts/mp/utility/outline::outlinedisable(id, self);
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
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

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344
// Size: 0x5d
function function_6be4502bdbd97c85(client) {
    friendlyplayers = scripts/mp/utility/teams::getfriendlyplayers(client.team);
    enemyplayers = scripts/mp/utility/teams::getenemyplayers(client.team);
    aiarray = getaiarray();
    return array_combine(friendlyplayers, enemyplayers, aiarray);
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x1c
function function_e392446751b714f6(startpoint, endpoint) {
    return scripts/mp/utility/outline::outlineoccluded(startpoint, endpoint);
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0xb6
function function_5d19d3f8062e4bee() {
    while (true) {
        wait(1);
        if (!isdefined(level.players)) {
            continue;
        }
        foreach (player in level.players) {
            datavalue = function_7bcb4b0b404dc8a8(player);
            if (isdefined(datavalue)) {
                if (isdefined(player.visibilitymodeval)) {
                    if (datavalue != player.visibilitymodeval) {
                        player namespace_c5f7e08ad7ea4280::function_8c2e8285c9915b12(datavalue);
                    }
                    continue;
                }
                player namespace_c5f7e08ad7ea4280::function_8c2e8285c9915b12(datavalue);
            }
        }
    }
}

// Namespace namespace_8a7fbc5545f75867 / namespace_93121fa16281c01c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0x31
function function_7bcb4b0b404dc8a8(player) {
    datavalue = player getplayerdata(level.loadoutsgroup, "squadMembers", "highVisibilityMode");
    return datavalue;
}

