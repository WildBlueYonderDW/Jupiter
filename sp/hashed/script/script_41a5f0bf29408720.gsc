#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_6bfe39bd5c12f84a;
#using scripts\cp\cp_outline_utility.gsc;

#namespace namespace_8a41a85545b288a9;

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x157
// Size: 0x77
function function_764239e6a246c46a() {
    funcarray = [];
    funcarray["shouldRun"] = &function_dcbff0f91b68341d;
    funcarray["init"] = &function_db991b1ec8386695;
    funcarray["enableForClient"] = &function_4999a7fd384d2fb4;
    funcarray["disable"] = &function_11f7a27364a8b75d;
    funcarray["checkForDataUpdates"] = &function_5d19d3f8062e4bee;
    funcarray["getADSWeaponDist"] = &function_553772f1f998aa41;
    funcarray["getTargetArray"] = &function_6be4502bdbd97c85;
    funcarray["outlineOccluded"] = &function_e392446751b714f6;
    return funcarray;
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d7
// Size: 0x4
function function_dcbff0f91b68341d() {
    return true;
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4
// Size: 0xb
function function_db991b1ec8386695() {
    level thread function_72f2b775f465b38d();
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7
// Size: 0x1d
function function_72f2b775f465b38d() {
    level endon("game_ended");
    wait 5;
    namespace_c5f7e08ad7ea4280::function_7068f93aacf2ef59("kiosk_objective", "uin_ping_buy_station");
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21c
// Size: 0x25
function function_4999a7fd384d2fb4(client, assetname, prioritygroup) {
    return scripts\cp\cp_outline_utility::outlineenableforplayer(self, client, assetname, prioritygroup);
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24a
// Size: 0x14
function function_11f7a27364a8b75d(id) {
    scripts\cp\cp_outline_utility::outlinedisable(id, self);
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x266
// Size: 0x29
function function_553772f1f998aa41() {
    weapon = self getcurrentweapon();
    if (weaponclass(weapon) == "sniper") {
        return 8192;
    }
    return 2048;
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0x37
function function_6be4502bdbd97c85(client) {
    aiarray = getaiarray();
    players = level.players;
    return array_combine(players, aiarray);
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8
// Size: 0x1b
function function_e392446751b714f6(startpoint, endpoint) {
    return scripts\cp\cp_outline_utility::outlineoccluded(startpoint, endpoint);
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0xf8
function function_5d19d3f8062e4bee() {
    while (true) {
        wait 1;
        if (!isdefined(level.players)) {
            continue;
        }
        foreach (player in level.players) {
            datavalue = player requestgamerprofile("highVisibilityMode");
            outlinevalue = player requestgamerprofile("highVisibilityModeOutline");
            if (isdefined(datavalue)) {
                if (isdefined(player.visibilitymodeval) && isdefined(level.player.var_5615f87228f360c8)) {
                    if (datavalue != player.visibilitymodeval || outlinevalue != player.var_5615f87228f360c8) {
                        player namespace_c5f7e08ad7ea4280::function_8c2e8285c9915b12(datavalue, outlinevalue);
                    }
                    continue;
                }
                player namespace_c5f7e08ad7ea4280::function_8c2e8285c9915b12(datavalue, outlinevalue);
            }
        }
    }
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0x6b
function function_1871237039503ca1() {
    while (level.players.size == 0) {
        wait 1;
    }
    wait 5;
    foreach (player in level.players) {
        player function_971b12ce83d4d457();
    }
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f
// Size: 0xd
function function_971b12ce83d4d457() {
    self setblurforplayer(5, 1);
}

// Namespace namespace_8a41a85545b288a9 / namespace_9e238f5e6fc1f074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x484
// Size: 0x2
function function_68fcff86246cb0e8() {
    
}

