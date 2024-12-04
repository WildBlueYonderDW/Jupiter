#using script_2d9d24f7c63ac143;
#using script_7c03ab87c5f9f420;
#using script_b7a9ce0a2282b79;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\utility;
#using scripts\mp\class;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_plunder;
#using scripts\mp\gametypes\br_weapons;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\weapon;
#using scripts\mp\vehicles\vehicle_mp;
#using scripts\mp\weapons;

#namespace namespace_60c72bf2f4474547;

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x374
// Size: 0x199
function vehicle_occupancy_mp_init() {
    registersharedfunc("vehicle_occupancy", "onEnterVehicle", &vehicle_occupancy_mp_onentervehicle);
    registersharedfunc("vehicle_occupancy", "onExitVehicle", &vehicle_occupancy_mp_onexitvehicle);
    registersharedfunc("vehicle_occupancy", "registerInstance", &vehicle_occupancy_mp_registerinstance);
    registersharedfunc("vehicle_occupancy", "deregisterInstance", &vehicle_occupancy_mp_deregisterinstance);
    registersharedfunc("vehicle_occupancy", "updateOwner", &vehicle_occupancy_mp_updateowner);
    registersharedfunc("vehicle_occupancy", "registerSentient", &vehicle_occupancy_mp_registersentient);
    registersharedfunc("vehicle_occupancy", "unregisterSentient", &vehicle_occupancy_mp_unregistersentient);
    registersharedfunc("vehicle_occupancy", "isSentient", &vehicle_occupancy_mp_issentient);
    registersharedfunc("vehicle_occupancy", "takeRiotShield", &vehicle_occupancy_mp_takeriotshield);
    registersharedfunc("vehicle_occupancy", "giveRiotShield", &vehicle_occupancy_mp_giveriotshield);
    registersharedfunc("vehicle_occupancy", "updateRiotShield", &vehicle_occupancy_mp_updateriotshield);
    registersharedfunc("vehicle_occupancy", "hideCashBag", &vehicle_occupancy_mp_hidecashbag);
    registersharedfunc("vehicle_occupancy", "showCashBag", &vehicle_occupancy_mp_showcashbag);
    registersharedfunc("vehicle_occupancy", "changedSeats", &vehicle_occupancy_mp_changedseats);
    val::group_register("vehicle", ["gesture", "killstreaks", "supers", "cp_munitions"]);
    val::group_register("vehicle_passenger", ["gesture", "supers", "cp_munitions"]);
    /#
        function_a24b81b039ab82a2();
    #/
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x515
// Size: 0xf7
function vehicle_occupancy_mp_onentervehicle(vehicle, var_7558f98f3236963d, player, data) {
    player scripts\mp\utility\perk::giveperk("specialty_ghost");
    player scripts\mp\utility\perk::giveperk("specialty_tracker_jammer");
    var_fdd4cb56c3b978a3 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (!var_fdd4cb56c3b978a3 || vehicle_occupancy_isdriverseat(vehicle, var_7558f98f3236963d)) {
        player val::group_set("vehicle", 0);
    } else if (var_fdd4cb56c3b978a3) {
        player val::group_set("vehicle_passenger", 0);
    }
    brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" || brgametype == "risk") {
        scripts\mp\gametypes\br_plunder::plunder_allowallrepositoryuseforplayer(player, 0, 1);
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPlayerEnterVehicle", vehicle, player);
    if (!var_fdd4cb56c3b978a3) {
        vehicle_occupancy_mp_takeriotshield(player);
    }
    vehicle_occupancy_mp_updatemarkfilter(vehicle);
    if (isdefined(level.var_8c0f3022529be75e) && scripts\mp\vehicles\vehicle_mp::function_dd9423aa2b333df5(vehicle)) {
        player namespace_c39580665208f0a4::function_a1650ef824a7be56(1);
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x614
// Size: 0x12a
function vehicle_occupancy_mp_onexitvehicle(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdisconnect)) {
        if (!istrue(data.playerdeath)) {
            player scripts\mp\utility\perk::removeperk("specialty_ghost");
            player scripts\mp\utility\perk::removeperk("specialty_tracker_jammer");
            var_fdd4cb56c3b978a3 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
            if (!var_fdd4cb56c3b978a3 || vehicle_occupancy_isdriverseat(vehicle, var_fc7c7a874b43a31a)) {
                player val::group_reset("vehicle");
            } else if (var_fdd4cb56c3b978a3) {
                player val::group_reset("vehicle_passenger");
            }
            brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
            if (brgametype == "plunder" || brgametype == "risk") {
                scripts\mp\gametypes\br_plunder::plunder_allowallrepositoryuseforplayer(player, 1, 1);
            }
        }
        vehicle_occupancy_mp_giveriotshield(player, data.playerdeath, data.playerlaststand);
        if (isdefined(level.var_8c0f3022529be75e) && scripts\mp\vehicles\vehicle_mp::function_dd9423aa2b333df5(vehicle)) {
            player namespace_c39580665208f0a4::function_a1650ef824a7be56(0);
        }
        player notify("vehicle_exit");
        level thread function_53280c8defb18363(player, vehicle);
    }
    vehicle_occupancy_mp_updatemarkfilter(vehicle);
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x746
// Size: 0x49
function function_53280c8defb18363(player, vehicle) {
    player.lastvehicle = vehicle;
    wait 1;
    if (isdefined(player) && is_equal(player.lastvehicle, vehicle)) {
        player.lastvehicle = undefined;
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x797
// Size: 0x94
function vehicle_occupancy_mp_changedseats(player, vehicle, var_fc7c7a874b43a31a, seatid) {
    var_fdd4cb56c3b978a3 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (var_fdd4cb56c3b978a3 && isdefined(var_fc7c7a874b43a31a) && isdefined(seatid)) {
        if (vehicle_occupancy_isdriverseat(vehicle, var_fc7c7a874b43a31a)) {
            player val::group_reset("vehicle");
            player val::group_set("vehicle_passenger", 0);
            return;
        }
        if (vehicle_occupancy_isdriverseat(vehicle, seatid)) {
            player val::group_reset("vehicle_passenger");
            player val::group_set("vehicle", 0);
        }
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x833
// Size: 0x166
function vehicle_occupancy_mp_updatemarkfilter(vehicle) {
    if (!isdefined(vehicle.occupants)) {
        return;
    }
    if (!isdefined(vehicle.marksenabled)) {
        vehicle.marksenabled = 1;
    }
    var_e8144973b1c57819 = vehicle.marksenabled;
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    vehicle.marksenabled = occupants.size > 0;
    if (var_e8144973b1c57819 && !vehicle.marksenabled) {
        vehicle disableplayermarks("killstreak");
    } else if (!var_e8144973b1c57819 && vehicle.marksenabled) {
        vehicle enableplayermarks("killstreak");
    }
    if (vehicle.marksenabled) {
        if (level.teambased) {
            protectedteams = [];
            foreach (occupant in occupants) {
                if (isdefined(occupant.team) && !array_contains(protectedteams, occupant.team)) {
                    protectedteams[protectedteams.size] = occupant.team;
                }
            }
            vehicle filteroutplayermarks(protectedteams);
            return;
        }
        vehicle filteroutplayermarks(occupants);
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a1
// Size: 0x16
function vehicle_occupancy_mp_registerinstance(vehicle) {
    /#
        function_c69e3a63719e7856(vehicle);
    #/
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf
// Size: 0x16
function vehicle_occupancy_mp_deregisterinstance(vehicle) {
    /#
        function_8bccda4687e38719(vehicle);
    #/
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9dd
// Size: 0x5e
function vehicle_occupancy_mp_hidecashbag(vehicle, var_7558f98f3236963d, player, data) {
    if (isdefined(var_7558f98f3236963d)) {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_7558f98f3236963d);
        if (istrue(var_c50b485a43752fd.showcashbag)) {
            return;
        }
    }
    scripts\mp\utility\player::function_efc7b5130b976314(player);
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa43
// Size: 0x5e
function vehicle_occupancy_mp_showcashbag(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (isdefined(var_fc7c7a874b43a31a)) {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_fc7c7a874b43a31a);
        if (istrue(var_c50b485a43752fd.showcashbag)) {
            return;
        }
    }
    scripts\mp\utility\player::function_affaefa6ea1b971d(player);
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa9
// Size: 0x39
function vehicle_occupancy_mp_updateowner(vehicle) {
    vehicle_occupancy_mp_updatemarkfilter(vehicle);
    if (isdefined(vehicle.owner)) {
        vehicle.lastowner = vehicle.owner;
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x2a3
function vehicle_occupancy_mp_takeriotshield(player, vehicle, var_7558f98f3236963d) {
    riotshieldweapon = undefined;
    riotshieldiscurrentprimary = undefined;
    var_102d661b1caa8bc1 = undefined;
    primaryweapons = player getweaponslistprimaries();
    foreach (weapon in primaryweapons) {
        if (isnullweapon(weapon)) {
            continue;
        }
        if (isriotshield(weapon)) {
            assertex(!isdefined(riotshieldweapon), "<dev string:x1c>");
            riotshieldweapon = weapon;
            if (issameweapon(riotshieldweapon, player getcurrentprimaryweapon())) {
                riotshieldiscurrentprimary = 1;
            }
            continue;
        }
        if (!isdefined(var_102d661b1caa8bc1) && !scripts\mp\utility\weapon::ismeleeoverrideweapon(weapon) && !scripts\mp\utility\weapon::isunderwaterweapon(weapon) && !scripts\mp\utility\weapon::function_3f15e5e526ff94ce(weapon)) {
            var_dd9181eb18c4db69 = weapon getnoaltweapon();
            if (var_dd9181eb18c4db69.inventorytype != "primary") {
                continue;
            }
            var_102d661b1caa8bc1 = weapon;
        }
    }
    if (!isdefined(riotshieldweapon) && scripts\cp_mp\utility\game_utility::isbrstylegametype() && namespace_aead94004cf4c147::isbackpackinventoryenabled() && namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
        if (isdefined(var_9ac5e72784815708) && isriotshield(var_9ac5e72784815708)) {
            riotshieldweapon = var_9ac5e72784815708;
        }
    }
    weaponindex = 0;
    if (isdefined(riotshieldweapon)) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
            for (i = 0; i < 3; i++) {
                weapontocheck = scripts\mp\gametypes\br_pickups::function_13ecf3644442a3e7(player, i);
                if (isdefined(weapontocheck) && weapontocheck == riotshieldweapon) {
                    weaponindex = i;
                    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                        weaponmetadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(player, i);
                        player.var_d3143125b9854467 = weaponmetadata;
                    }
                    break;
                }
            }
        }
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (weaponindex == 2) {
                namespace_aead94004cf4c147::function_954372d604277278(player);
            } else {
                player scripts\mp\gametypes\br_pickups::function_d655f2006cfe7789(riotshieldweapon);
            }
        } else {
            player _takeweapon(riotshieldweapon);
        }
        player.riotshieldtaken = riotshieldweapon;
        player.riotshieldiscurrentprimary = riotshieldiscurrentprimary;
        if (istrue(riotshieldiscurrentprimary)) {
            vehicle_occupancy_mp_updateriotshield(player, vehicle, var_7558f98f3236963d);
        }
        assertex(isdefined(var_102d661b1caa8bc1), "<dev string:x71>");
        player scripts\mp\class::riotshieldonweaponchange(var_102d661b1caa8bc1);
        player notify("modified_riot_shield");
        player endon("modified_riot_shield");
        player childthread forcevalidweapon(var_102d661b1caa8bc1);
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd95
// Size: 0x1d7
function vehicle_occupancy_mp_giveriotshield(player, fromdeath, fromlaststand) {
    if (isdefined(player.riotshieldtaken)) {
        var_fdd4cb56c3b978a3 = level.gametype == "br";
        if (!istrue(fromdeath) && (var_fdd4cb56c3b978a3 || !istrue(fromlaststand))) {
            if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                fakepickup = spawnstruct();
                fakepickup.weapon = player.riotshieldtaken;
                fakepickup.count = 1;
                fakepickup.countlefthand = 0;
                fakepickup.origin = player.origin;
                fakepickup.angles = player.angles;
                fakepickup.var_4a08890fd43d6bc7 = namespace_aead94004cf4c147::isbackpackinventoryenabled() && namespace_aead94004cf4c147::getPlayerBackpackSize(player) > 5 && !player hasweapon("iw9_me_fists_mp");
                if (fakepickup.var_4a08890fd43d6bc7) {
                    fakepickup.var_f51bbb191526dfa4 = 1;
                }
                if (isdefined(player.var_d3143125b9854467)) {
                    fakepickup.metadata = player.var_d3143125b9854467;
                }
                currentweaponfists = scripts\mp\weapons::isfistweapon(player getcurrentweapon());
                player scripts\mp\gametypes\br_weapons::takeweaponpickup(fakepickup, undefined, undefined, undefined, undefined, !currentweaponfists);
            } else {
                player _giveweapon(player.riotshieldtaken);
            }
            player scripts\mp\class::trackriotshield_tryreset();
            if (istrue(player.riotshieldiscurrentprimary)) {
                player notify("modified_riot_shield");
                player endon("modified_riot_shield");
                if (!istrue(fromlaststand)) {
                    player childthread _switchtoweaponimmediate(player.riotshieldtaken);
                }
            }
        }
        player.riotshieldtaken = undefined;
        player.riotshieldiscurrentprimary = undefined;
        player notify("modified_riot_shield");
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf74
// Size: 0x91
function vehicle_occupancy_mp_updateriotshield(player, vehicle, var_7558f98f3236963d) {
    if (isdefined(player.riotshieldtaken) && istrue(player.riotshieldiscurrentprimary)) {
        if (!isdefined(var_7558f98f3236963d)) {
            return;
        }
        if (vehicle_occupancy_isdriverseat(vehicle, var_7558f98f3236963d)) {
            return;
        }
        if (vehicle_shouldhideoccupantforseat(vehicle, var_7558f98f3236963d)) {
            return;
        }
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_7558f98f3236963d);
        if (isdefined(var_c50b485a43752fd.turretobjweapon)) {
            return;
        }
        player.riotshieldiscurrentprimary = undefined;
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x100d
// Size: 0x116
function vehicle_occupancy_mp_registersentient(vehicle) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (!isdefined(var_e2818ad39a3341b4.threatbiasgroup)) {
        return;
    }
    if (level.teambased) {
        team = vehicle.team;
        if (isdefined(vehicle.team) && vehicle.team == "neutral") {
            team = undefined;
        }
        if (!isdefined(team) && isdefined(vehicle.owner)) {
            team = vehicle.owner.team;
        }
        if (isdefined(team)) {
            if (!isdefined(vehicle.sentientteam) || vehicle.sentientteam != team) {
                vehicle_occupancy_mp_unregistersentient(vehicle);
                vehicle scripts\mp\sentientpoolmanager::registersentient(var_e2818ad39a3341b4.threatbiasgroup, team);
                vehicle.sentientteam = team;
            }
            return;
        }
        if (isdefined(vehicle.sentientteam)) {
            vehicle_occupancy_mp_unregistersentient(vehicle);
        }
    }
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112b
// Size: 0x1e
function vehicle_occupancy_mp_unregistersentient(vehicle) {
    vehicle notify("remove_sentient");
    vehicle.sentientteam = undefined;
}

// Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1151
// Size: 0x17
function vehicle_occupancy_mp_issentient(vehicle) {
    return isdefined(vehicle.sentientteam);
}

/#

    // Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1171
    // Size: 0x2c
    function function_a24b81b039ab82a2() {
        leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = [];
        thread function_e04e6e6510f701ff();
    }

    // Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11a5
    // Size: 0x5b
    function function_c69e3a63719e7856(vehicle) {
        leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = array_removeundefined(leveldata.debuginstances);
        leveldata.debuginstances = array_add(leveldata.debuginstances, vehicle);
    }

    // Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1208
    // Size: 0x3e
    function function_8bccda4687e38719(vehicle) {
        leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = array_remove(leveldata.debuginstances, vehicle);
    }

    // Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x124e
    // Size: 0x62
    function function_e04e6e6510f701ff() {
        while (true) {
            if (getdvarint(@"hash_dd33e6bf6e533554", 0) != 0 || getdvarint(@"hash_5a20dfa97c106e84", 0) != 0) {
                function_da867e6291c3df56();
            }
            if (getdvarint(@"hash_58b1b5f716ceb29b", 0) != 0) {
                function_d5250ff459d106fe();
            }
            wait level.framedurationseconds;
        }
    }

    // Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12b8
    // Size: 0x5f6
    function function_d5250ff459d106fe() {
        leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
        foreach (vehicle in leveldata.debuginstances) {
            if (!isdefined(vehicle)) {
                continue;
            }
            vehicle thread scripts\engine\utility::draw_ent_axis((0, 0, 1), 1, 10);
            var_e2818ad39a3341b4 = scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_getleveldataforvehicle(vehicle.vehiclename);
            if (!isdefined(var_e2818ad39a3341b4) || !isdefined(var_e2818ad39a3341b4.explosionextents)) {
                continue;
            }
            front = var_e2818ad39a3341b4.explosionextents.front;
            back = var_e2818ad39a3341b4.explosionextents.back;
            left = var_e2818ad39a3341b4.explosionextents.left;
            right = var_e2818ad39a3341b4.explosionextents.right;
            top = var_e2818ad39a3341b4.explosionextents.top;
            bottom = var_e2818ad39a3341b4.explosionextents.bottom;
            tfl = vehicle.origin;
            tfl += anglestoup(vehicle.angles) * top;
            tfl += anglestoforward(vehicle.angles) * front;
            tfl += anglestoright(vehicle.angles) * -1 * left;
            tfr = vehicle.origin;
            tfr += anglestoup(vehicle.angles) * top;
            tfr += anglestoforward(vehicle.angles) * front;
            tfr += anglestoright(vehicle.angles) * right;
            tbl = vehicle.origin;
            tbl += anglestoup(vehicle.angles) * top;
            tbl += anglestoforward(vehicle.angles) * -1 * back;
            tbl += anglestoright(vehicle.angles) * -1 * left;
            tbr = vehicle.origin;
            tbr += anglestoup(vehicle.angles) * top;
            tbr += anglestoforward(vehicle.angles) * -1 * back;
            tbr += anglestoright(vehicle.angles) * right;
            bfl = vehicle.origin;
            bfl += anglestoup(vehicle.angles) * -1 * bottom;
            bfl += anglestoforward(vehicle.angles) * front;
            bfl += anglestoright(vehicle.angles) * -1 * left;
            bfr = vehicle.origin;
            bfr += anglestoup(vehicle.angles) * -1 * bottom;
            bfr += anglestoforward(vehicle.angles) * front;
            bfr += anglestoright(vehicle.angles) * right;
            bbl = vehicle.origin;
            bbl += anglestoup(vehicle.angles) * -1 * bottom;
            bbl += anglestoforward(vehicle.angles) * -1 * back;
            bbl += anglestoright(vehicle.angles) * -1 * left;
            bbr = vehicle.origin;
            bbr += anglestoup(vehicle.angles) * -1 * bottom;
            bbr += anglestoforward(vehicle.angles) * -1 * back;
            bbr += anglestoright(vehicle.angles) * right;
            thread scripts\cp_mp\utility\debug_utility::drawline(tfl, tfr, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tfl, tbl, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tfr, tbr, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tbr, tbl, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(bfl, bfr, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(bfl, bbl, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(bfr, bbr, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(bbr, bbl, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tfl, bfl, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tfr, bfr, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tbl, bbl, level.framedurationseconds, (1, 1, 1));
            thread scripts\cp_mp\utility\debug_utility::drawline(tbr, bbr, level.framedurationseconds, (1, 1, 1));
        }
    }

    // Namespace namespace_60c72bf2f4474547 / scripts\mp\vehicles\vehicle_occupancy_mp
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18b6
    // Size: 0x703
    function function_da867e6291c3df56() {
        leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
        foreach (vehicle in leveldata.debuginstances) {
            if (isdefined(vehicle)) {
                var_e2818ad39a3341b4 = undefined;
                vehicle thread scripts\engine\utility::draw_ent_axis((0, 0, 1), 1, 10);
                if (getdvarint(@"hash_5a20dfa97c106e84", 0) != 0) {
                    front = getdvarfloat(@"hash_ae48fc0251f15678", 0);
                    back = getdvarfloat(@"hash_27b66fa4ccb92042", 0);
                    left = getdvarfloat(@"hash_1b55e0d66a16ab70", 0);
                    right = getdvarfloat(@"hash_f9f204d56cd2b845", 0);
                    top = getdvarfloat(@"hash_1e89088dab07f7fc", 0);
                    bottom = getdvarfloat(@"hash_2346182109bbc14a", 0);
                } else {
                    var_e2818ad39a3341b4 = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
                    if (!isdefined(var_e2818ad39a3341b4) || !isdefined(var_e2818ad39a3341b4.exitextents)) {
                        return;
                    }
                    front = var_e2818ad39a3341b4.exitextents["<dev string:xd1>"];
                    back = var_e2818ad39a3341b4.exitextents["<dev string:xda>"];
                    left = var_e2818ad39a3341b4.exitextents["<dev string:xe2>"];
                    right = var_e2818ad39a3341b4.exitextents["<dev string:xea>"];
                    top = var_e2818ad39a3341b4.exitextents["<dev string:xf3>"];
                    bottom = var_e2818ad39a3341b4.exitextents["<dev string:xfa>"];
                }
                tfl = vehicle.origin;
                tfl += anglestoup(vehicle.angles) * top;
                tfl += anglestoforward(vehicle.angles) * front;
                tfl += anglestoright(vehicle.angles) * -1 * left;
                tfr = vehicle.origin;
                tfr += anglestoup(vehicle.angles) * top;
                tfr += anglestoforward(vehicle.angles) * front;
                tfr += anglestoright(vehicle.angles) * right;
                tbl = vehicle.origin;
                tbl += anglestoup(vehicle.angles) * top;
                tbl += anglestoforward(vehicle.angles) * -1 * back;
                tbl += anglestoright(vehicle.angles) * -1 * left;
                tbr = vehicle.origin;
                tbr += anglestoup(vehicle.angles) * top;
                tbr += anglestoforward(vehicle.angles) * -1 * back;
                tbr += anglestoright(vehicle.angles) * right;
                bfl = vehicle.origin;
                bfl += anglestoup(vehicle.angles) * -1 * bottom;
                bfl += anglestoforward(vehicle.angles) * front;
                bfl += anglestoright(vehicle.angles) * -1 * left;
                bfr = vehicle.origin;
                bfr += anglestoup(vehicle.angles) * -1 * bottom;
                bfr += anglestoforward(vehicle.angles) * front;
                bfr += anglestoright(vehicle.angles) * right;
                bbl = vehicle.origin;
                bbl += anglestoup(vehicle.angles) * -1 * bottom;
                bbl += anglestoforward(vehicle.angles) * -1 * back;
                bbl += anglestoright(vehicle.angles) * -1 * left;
                bbr = vehicle.origin;
                bbr += anglestoup(vehicle.angles) * -1 * bottom;
                bbr += anglestoforward(vehicle.angles) * -1 * back;
                bbr += anglestoright(vehicle.angles) * right;
                thread scripts\cp_mp\utility\debug_utility::drawline(tfl, tfr, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tfl, tbl, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tfr, tbr, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tbr, tbl, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(bfl, bfr, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(bfl, bbl, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(bfr, bbr, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(bbr, bbl, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tfl, bfl, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tfr, bfr, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tbl, bbl, level.framedurationseconds, (1, 1, 1));
                thread scripts\cp_mp\utility\debug_utility::drawline(tbr, bbr, level.framedurationseconds, (1, 1, 1));
                if (isdefined(var_e2818ad39a3341b4)) {
                    foreach (exit in var_e2818ad39a3341b4.exitoffsets) {
                        thread scripts\cp_mp\utility\debug_utility::drawline(vehicle.origin, vehicle.origin + rotatevector(exit, vehicle.angles), level.framedurationseconds, (0, 1, 1));
                    }
                }
            }
        }
    }

#/
