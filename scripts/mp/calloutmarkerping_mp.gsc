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

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227
// Size: 0xb0
function calloutmarkerping_init() {
    calloutmarkerping_initcommon();
    scripts/mp/utility/disconnect_event_aggregator::registerondisconnecteventcallback(&calloutmarkerping_onplayerdisconnect);
    scripts/engine/utility::registersharedfunc("ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer", &calloutmarkerping_squadleaderbeaconkillforplayer);
    scripts/engine/utility::registersharedfunc("ping", "calloutMarkerPing_watchItemTakenFromContainer", &calloutMarkerPing_watchItemTakenFromContainer);
    scripts/engine/utility::registersharedfunc("container", "isContainerEmpty", &scripts/mp/loot::isContainerEmpty);
    scripts/engine/utility::registersharedfunc("container", "getIndexForLootIDInContainer", &scripts/mp/loot::getIndexForLootIDInContainer);
    scripts/engine/utility::registersharedfunc("container", "getLoadoutDoubleBackpackLootID", &scripts/mp/loot::getLoadoutDoubleBackpackLootID);
    scripts/engine/utility::registersharedfunc("container", "getLootIDAtContainerIndex", &scripts/mp/loot::getLootIDAtContainerIndex);
    scripts/engine/utility::registersharedfunc("loot", "lootGetScriptableName", &scripts/mp/gametypes/br_pickups::lootgetscriptablename);
}

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de
// Size: 0xc
function calloutmarkerping_squadleaderbeaconcreate(pingtraceorigin) {
    
}

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
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

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
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

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb
// Size: 0x1c4
function calloutMarkerPing_watchItemTakenFromContainer(player, container, lootid) {
    if (!isdefined(player) || !isdefined(container) || !isdefined(lootid)) {
        return;
    }
    player endon("death_or_disconnect");
    container endon("death");
    containerindex = undefined;
    loadoutcontents = undefined;
    while (true) {
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
        if (!isdefined(containerindex) && issharedfuncdefined("container", "getIndexForLootIDInContainer")) {
            var_57accdc40b2f50e = [[ getsharedfunc("container", "getIndexForLootIDInContainer") ]](container, lootid);
            loadoutcontents = var_57accdc40b2f50e[1];
            containerindex = var_57accdc40b2f50e[0];
        }
        if (!isdefined(containerindex) || !isdefined(loadoutcontents)) {
            return;
        }
        newlootid = undefined;
        if (istrue(loadoutcontents)) {
            if (containerindex == 100) {
                newlootid = container.var_a06e7128c001851d;
            } else if (issharedfuncdefined("container", "getLoadoutDoubleBackpackLootID")) {
                newlootid = [[ getsharedfunc("container", "getLoadoutDoubleBackpackLootID") ]](container, containerindex, 0);
            }
            if (!istrue(newlootid) || newlootid != lootid) {
                return;
            }
        } else {
            if (containerindex == 100) {
                newlootid = container.weaponslotcontents;
            } else if (issharedfuncdefined("container", "getLootIDAtContainerIndex")) {
                newlootid = [[ getsharedfunc("container", "getLootIDAtContainerIndex") ]](container.opener, containerindex, container, 0);
            }
            if (!istrue(newlootid) || newlootid != lootid) {
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x696
// Size: 0x15c
function function_c28d94289c4a6ecd(scriptable, var_1d4bc315e3007530) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    if (!isdefined(scriptable)) {
        return false;
    }
    friendlyplayers = scripts/mp/utility/teams::getfriendlyplayers(player.team, 1);
    foreach (friendlyplayer in friendlyplayers) {
        if (friendlyplayer != player) {
            if (friendlyplayer function_bee315a15cf61820(scriptable.index)) {
                if (isdefined(var_1d4bc315e3007530)) {
                    container = scriptable;
                    pingindex = friendlyplayer function_76ecf74c7d722b52(5);
                    if (isdefined(pingindex)) {
                        var_41a4a181b6606b16 = friendlyplayer function_a7e757d42b550a6(pingindex);
                        if (var_41a4a181b6606b16 == 25) {
                            var_c876b325333c55a3 = friendlyplayer calloutmarkerping_getent(pingindex);
                            if (isdefined(var_c876b325333c55a3) && var_c876b325333c55a3.index == container.index) {
                                var_75bc450af3921c3b = friendlyplayer function_c4e0716fbd549e2d(pingindex);
                                if (isdefined(var_75bc450af3921c3b) && var_75bc450af3921c3b == var_1d4bc315e3007530) {
                                    return true;
                                }
                            }
                        }
                    }
                    continue;
                }
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_3f742ff4cbe345af / scripts/mp/calloutmarkerping_mp
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
    pingindex = player function_76ecf74c7d722b52(5);
    if (!isdefined(pingindex)) {
        return 0;
    }
    var_41a4a181b6606b16 = player function_a7e757d42b550a6(pingindex);
    if (var_41a4a181b6606b16 != 22 && var_41a4a181b6606b16 != 23 && var_41a4a181b6606b16 != 28) {
        return 0;
    }
    requestedlootid = player function_c4e0716fbd549e2d(pingindex);
    if (!isdefined(requestedlootid)) {
        return 0;
    }
    var_1b715fd06c46c7c2 = 0;
    switch (requestedlootid) {
    case 16257:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::function_b989edd9af4f42c7(scriptablename);
        break;
    case 16264:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::function_d7c5786a0c42ef6c(scriptablename);
        break;
    case 16265:
    case 16269:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::isweaponpickup(scriptablename);
        break;
    case 16266:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_public::isarmorplate(scriptablename);
        break;
    case 16267:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::isdogtag(scriptablename);
        break;
    case 16268:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::isplunder(scriptablename);
        break;
    case 16270:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::iskey(scriptablename);
        break;
    case 16271:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::issuperpickup(scriptablename);
        break;
    case 16272:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::iskillstreak(scriptablename);
        break;
    case 16273:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::isrevivepickup(scriptablename);
        break;
    case 16274:
        var_1b715fd06c46c7c2 = scripts/mp/gametypes/br_pickups::isgasmask(scriptablename);
        break;
    default:
        if (scripts/mp/gametypes/br_public::isammo(scriptablename)) {
            ammolootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
            if (isdefined(ammolootid) && ammolootid == requestedlootid) {
                var_1b715fd06c46c7c2 = 1;
            }
        } else if (scripts/mp/gametypes/br_pickups::isweaponpickup(scriptablename)) {
            weapon = scripts/mp/gametypes/br_pickups::getfullweaponobjforscriptablepartname(scriptablename);
            if (isdefined(weapon)) {
                ammotype = scripts/mp/gametypes/br_weapons::br_ammo_type_for_weapon(weapon);
                if (isdefined(ammotype)) {
                    ammolootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(ammotype);
                    if (isdefined(ammolootid) && ammolootid == requestedlootid) {
                        var_1b715fd06c46c7c2 = 1;
                    }
                }
            }
        }
        break;
    }
    if (var_1b715fd06c46c7c2) {
        player calloutmarkerping_removecallout(pingindex);
    }
    return var_1b715fd06c46c7c2;
}

