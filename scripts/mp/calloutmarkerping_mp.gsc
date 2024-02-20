// mwiii decomp prototype
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_weapons.gsc;

#namespace namespace_3f742ff4cbe345af;

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227
// Size: 0xb0
function calloutmarkerping_init() {
    calloutmarkerping_initcommon();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&calloutmarkerping_onplayerdisconnect);
    namespace_3c37cb17ade254d::registersharedfunc("ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer", &calloutmarkerping_squadleaderbeaconkillforplayer);
    namespace_3c37cb17ade254d::registersharedfunc("ping", "calloutMarkerPing_watchItemTakenFromContainer", &calloutMarkerPing_watchItemTakenFromContainer);
    namespace_3c37cb17ade254d::registersharedfunc("container", "isContainerEmpty", &namespace_3f0ea7483345a2c0::isContainerEmpty);
    namespace_3c37cb17ade254d::registersharedfunc("container", "getIndexForLootIDInContainer", &namespace_3f0ea7483345a2c0::getIndexForLootIDInContainer);
    namespace_3c37cb17ade254d::registersharedfunc("container", "getLoadoutDoubleBackpackLootID", &namespace_3f0ea7483345a2c0::getLoadoutDoubleBackpackLootID);
    namespace_3c37cb17ade254d::registersharedfunc("container", "getLootIDAtContainerIndex", &namespace_3f0ea7483345a2c0::getLootIDAtContainerIndex);
    namespace_3c37cb17ade254d::registersharedfunc("loot", "lootGetScriptableName", &namespace_cb965d2f71fefddc::lootGetScriptableName);
}

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de
// Size: 0xc
function calloutmarkerping_squadleaderbeaconcreate(var_6e5dcc903725ad78) {
    
}

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1
// Size: 0x11b
function calloutmarkerping_squadleaderbeaconplayerfirstlanded() {
    player = self;
    if (!getdvarint(@"hash_317946383876293f", 0)) {
        return;
    }
    if (!istrue(player.squadleaderbeacon_isactive)) {
        /#
            assertex(!isdefined(player.squadleaderbeacon_fxent), "None of the beacon values should be defined if the beacon isn't active!");
        #/
        /#
            assertex(!isdefined(player.squadleaderbeacon_circleorigin), "None of the beacon values should be defined if the beacon isn't active!");
        #/
        /#
            assertex(!isdefined(player.squadleaderbeacon_circleradius), "None of the beacon values should be defined if the beacon isn't active!");
        #/
        return;
    }
    if (ispointinsidecircle(player.origin, player.squadleaderbeacon_circleorigin, player.squadleaderbeacon_circleradius)) {
        if (issharedfuncdefined("rank", "scoreEventPopup")) {
            player thread [[ getsharedfunc("rank", "scoreEventPopup") ]]("br_beacon_bonus");
        }
        /#
            player iprintlnbold("<unknown string>");
        #/
    }
    player.squadleaderbeacon_fxent delete();
    player.squadleaderbeacon_circleorigin = undefined;
    player.squadleaderbeacon_circleradius = undefined;
    player.squadleaderbeacon_isactive = undefined;
}

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413
// Size: 0xb1
function calloutmarkerping_squadleaderbeaconkillforplayer(player) {
    /#
        assert(isplayer(player));
    #/
    if (!getdvarint(@"hash_317946383876293f", 0)) {
        return;
    }
    if (isdefined(player.squadleaderbeacon_fxent)) {
        player.squadleaderbeacon_fxent delete();
        player.squadleaderbeacon_circleorigin = undefined;
        player.squadleaderbeacon_circleradius = undefined;
        player.squadleaderbeacon_isactive = undefined;
    }
    /#
        assert(!isdefined(player.squadleaderbeacon_circleorigin));
    #/
    /#
        assert(!isdefined(player.squadleaderbeacon_circleradius));
    #/
    /#
        assert(!isdefined(player.squadleaderbeacon_isactive));
    #/
}

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb
// Size: 0x1c4
function calloutMarkerPing_watchItemTakenFromContainer(player, container, lootid) {
    if (!isdefined(player) || !isdefined(container) || !isdefined(lootid)) {
        return;
    }
    player endon("death_or_disconnect");
    container endon("death");
    var_d54a79024c228770 = undefined;
    var_bf23a60678978c19 = undefined;
    while (1) {
        if (!isdefined(container) || !isdefined(container.contents)) {
            return;
        }
        if (issharedfuncdefined("container", "isContainerEmpty") && [[ getsharedfunc("container", "isContainerEmpty") ]](container)) {
            return;
        }
        if (!isdefined(container.opener)) {
            waitframe();
            continue;
        }
        if (!isdefined(var_d54a79024c228770) && issharedfuncdefined("container", "getIndexForLootIDInContainer")) {
            var_57accdc40b2f50e = [[ getsharedfunc("container", "getIndexForLootIDInContainer") ]](container, lootid);
            var_bf23a60678978c19 = var_57accdc40b2f50e[1];
            var_d54a79024c228770 = var_57accdc40b2f50e[0];
        }
        if (!isdefined(var_d54a79024c228770) || !isdefined(var_bf23a60678978c19)) {
            return;
        }
        var_699de62155c8c832 = undefined;
        if (istrue(var_bf23a60678978c19)) {
            if (var_d54a79024c228770 == 100) {
                var_699de62155c8c832 = container.var_a06e7128c001851d;
            } else if (issharedfuncdefined("container", "getLoadoutDoubleBackpackLootID")) {
                var_699de62155c8c832 = [[ getsharedfunc("container", "getLoadoutDoubleBackpackLootID") ]](container, var_d54a79024c228770, 0);
            }
            if (!istrue(var_699de62155c8c832) || var_699de62155c8c832 != lootid) {
                return;
            }
        } else {
            if (var_d54a79024c228770 == 100) {
                var_699de62155c8c832 = container.var_4f6cde716e0c3d7;
            } else if (issharedfuncdefined("container", "getLootIDAtContainerIndex")) {
                var_699de62155c8c832 = [[ getsharedfunc("container", "getLootIDAtContainerIndex") ]](container.opener, var_d54a79024c228770, container, 0);
            }
            if (!istrue(var_699de62155c8c832) || var_699de62155c8c832 != lootid) {
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x696
// Size: 0x15c
function function_c28d94289c4a6ecd(scriptable, var_1d4bc315e3007530) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    if (!isdefined(scriptable)) {
        return 0;
    }
    friendlyplayers = namespace_54d20dd0dd79277f::getfriendlyplayers(player.team, 1);
    foreach (var_b9f4f3092e5e6e9b in friendlyplayers) {
        if (var_b9f4f3092e5e6e9b != player) {
            if (var_b9f4f3092e5e6e9b function_bee315a15cf61820(scriptable.index)) {
                if (isdefined(var_1d4bc315e3007530)) {
                    container = scriptable;
                    var_394466c2ddb208cb = var_b9f4f3092e5e6e9b function_76ecf74c7d722b52(5);
                    if (isdefined(var_394466c2ddb208cb)) {
                        var_41a4a181b6606b16 = var_b9f4f3092e5e6e9b function_a7e757d42b550a6(var_394466c2ddb208cb);
                        if (var_41a4a181b6606b16 == 25) {
                            var_c876b325333c55a3 = var_b9f4f3092e5e6e9b calloutmarkerping_getent(var_394466c2ddb208cb);
                            if (isdefined(var_c876b325333c55a3) && var_c876b325333c55a3.index == container.index) {
                                var_75bc450af3921c3b = var_b9f4f3092e5e6e9b function_c4e0716fbd549e2d(var_394466c2ddb208cb);
                                if (isdefined(var_75bc450af3921c3b) && var_75bc450af3921c3b == var_1d4bc315e3007530) {
                                    return 1;
                                }
                            }
                        }
                    }
                } else {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_3f742ff4cbe345af/namespace_65c7485efe2b8314
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x2fc
function function_4864c58ab9b1f07e(scriptable, var_f0456519eaae430) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    if (!isdefined(scriptable)) {
        return 0;
    }
    scriptablename = scriptable.type;
    if (isdefined(var_f0456519eaae430) && var_f0456519eaae430) {
        if (!isdefined(scriptable.var_1eef5048f92c4951)) {
            return 0;
        }
        var_1eef5048f92c4951 = scriptable.var_1eef5048f92c4951;
        if (player == var_1eef5048f92c4951 || player.team != var_1eef5048f92c4951.team) {
            return 0;
        }
    }
    var_da07265f8351bd9e = player function_368af07f7897fd79(5);
    if (!var_da07265f8351bd9e) {
        return 0;
    }
    var_394466c2ddb208cb = player function_76ecf74c7d722b52(5);
    if (!isdefined(var_394466c2ddb208cb)) {
        return 0;
    }
    var_41a4a181b6606b16 = player function_a7e757d42b550a6(var_394466c2ddb208cb);
    if (var_41a4a181b6606b16 != 22 && var_41a4a181b6606b16 != 23 && var_41a4a181b6606b16 != 28) {
        return 0;
    }
    var_f45d3a6bd11d3f74 = player function_c4e0716fbd549e2d(var_394466c2ddb208cb);
    if (!isdefined(var_f45d3a6bd11d3f74)) {
        return 0;
    }
    var_1b715fd06c46c7c2 = 0;
    switch (var_f45d3a6bd11d3f74) {
    case 16257:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::function_b989edd9af4f42c7(scriptablename);
        break;
    case 16264:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::function_d7c5786a0c42ef6c(scriptablename);
        break;
    case 16265:
    case 16269:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::isweaponpickup(scriptablename);
        break;
    case 16266:
        var_1b715fd06c46c7c2 = namespace_d3d40f75bb4e4c32::isarmorplate(scriptablename);
        break;
    case 16267:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::function_9e3428357e5df2e3(scriptablename);
        break;
    case 16268:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::isplunder(scriptablename);
        break;
    case 16270:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::function_82d45592d750d388(scriptablename);
        break;
    case 16271:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::issuperpickup(scriptablename);
        break;
    case 16272:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::iskillstreak(scriptablename);
        break;
    case 16273:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::isrevivepickup(scriptablename);
        break;
    case 16274:
        var_1b715fd06c46c7c2 = namespace_cb965d2f71fefddc::isgasmask(scriptablename);
        break;
    default:
        if (namespace_d3d40f75bb4e4c32::isammo(scriptablename)) {
            var_c7c80454a3d3e1e8 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
            if (isdefined(var_c7c80454a3d3e1e8) && var_c7c80454a3d3e1e8 == var_f45d3a6bd11d3f74) {
                var_1b715fd06c46c7c2 = 1;
            }
        } else if (namespace_cb965d2f71fefddc::isweaponpickup(scriptablename)) {
            weapon = namespace_cb965d2f71fefddc::getfullweaponobjforscriptablepartname(scriptablename);
            if (isdefined(weapon)) {
                ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weapon);
                if (isdefined(ammotype)) {
                    var_c7c80454a3d3e1e8 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(ammotype);
                    if (isdefined(var_c7c80454a3d3e1e8) && var_c7c80454a3d3e1e8 == var_f45d3a6bd11d3f74) {
                        var_1b715fd06c46c7c2 = 1;
                    }
                }
            }
        }
        break;
    }
    if (var_1b715fd06c46c7c2) {
        player calloutmarkerping_removecallout(var_394466c2ddb208cb);
    }
    return var_1b715fd06c46c7c2;
}

