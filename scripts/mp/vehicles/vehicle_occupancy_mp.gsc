// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\vehicles\vehicle_mp.gsc;
#using script_7c03ab87c5f9f420;
#using scripts\mp\utility\player.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\class.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace namespace_60c72bf2f4474547;

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396
// Size: 0x19a
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
    val::function_2d6e7e0b80767910("vehicle", [0:"gesture", 1:"killstreaks", 2:"supers", 3:"cp_munitions"]);
    val::function_2d6e7e0b80767910("vehicle_passenger", [0:"gesture", 1:"supers", 2:"cp_munitions"]);
    /#
        function_a24b81b039ab82a2();
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537
// Size: 0xf4
function vehicle_occupancy_mp_onentervehicle(vehicle, var_7558f98f3236963d, player, data) {
    player namespace_82dcd1d5ae30ff7::giveperk("specialty_ghost");
    player namespace_82dcd1d5ae30ff7::giveperk("specialty_tracker_jammer");
    var_fdd4cb56c3b978a3 = namespace_36f464722d326bbe::isbrstylegametype();
    if (!var_fdd4cb56c3b978a3 || vehicle_occupancy_isdriverseat(vehicle, var_7558f98f3236963d)) {
        player val::function_3633b947164be4f3("vehicle", 0);
    } else if (var_fdd4cb56c3b978a3) {
        player val::function_3633b947164be4f3("vehicle_passenger", 0);
    }
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" || brgametype == "risk") {
        namespace_c6ccccd95254983f::plunder_allowallrepositoryuseforplayer(player, 0, 1);
    }
    namespace_71073fa38f11492::runbrgametypefunc("onPlayerEnterVehicle", vehicle, player);
    vehicle_occupancy_mp_takeriotshield(player);
    vehicle_occupancy_mp_updatemarkfilter(vehicle);
    if (isdefined(level.var_8c0f3022529be75e) && namespace_2399e05def999e4c::function_dd9423aa2b333df5(vehicle)) {
        player namespace_c39580665208f0a4::function_a1650ef824a7be56(1);
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632
// Size: 0x12b
function vehicle_occupancy_mp_onexitvehicle(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdisconnect)) {
        if (!istrue(data.playerdeath)) {
            player namespace_82dcd1d5ae30ff7::removeperk("specialty_ghost");
            player namespace_82dcd1d5ae30ff7::removeperk("specialty_tracker_jammer");
            var_fdd4cb56c3b978a3 = namespace_36f464722d326bbe::isbrstylegametype();
            if (!var_fdd4cb56c3b978a3 || vehicle_occupancy_isdriverseat(vehicle, var_fc7c7a874b43a31a)) {
                player val::function_588f2307a3040610("vehicle");
            } else if (var_fdd4cb56c3b978a3) {
                player val::function_588f2307a3040610("vehicle_passenger");
            }
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if (brgametype == "plunder" || brgametype == "risk") {
                namespace_c6ccccd95254983f::plunder_allowallrepositoryuseforplayer(player, 1, 1);
            }
        }
        vehicle_occupancy_mp_giveriotshield(player, data.playerdeath, data.playerlaststand);
        if (isdefined(level.var_8c0f3022529be75e) && namespace_2399e05def999e4c::function_dd9423aa2b333df5(vehicle)) {
            player namespace_c39580665208f0a4::function_a1650ef824a7be56(0);
        }
        player notify("vehicle_exit");
        level thread function_53280c8defb18363(player, vehicle);
    }
    vehicle_occupancy_mp_updatemarkfilter(vehicle);
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0x4a
function function_53280c8defb18363(player, vehicle) {
    player.var_c7c386dfccf6492f = vehicle;
    wait(1);
    if (isdefined(player) && is_equal(player.var_c7c386dfccf6492f, vehicle)) {
        player.var_c7c386dfccf6492f = undefined;
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b5
// Size: 0x94
function vehicle_occupancy_mp_changedseats(player, vehicle, var_fc7c7a874b43a31a, seatid) {
    var_fdd4cb56c3b978a3 = namespace_36f464722d326bbe::isbrstylegametype();
    if (var_fdd4cb56c3b978a3 && isdefined(var_fc7c7a874b43a31a) && isdefined(seatid)) {
        if (vehicle_occupancy_isdriverseat(vehicle, var_fc7c7a874b43a31a)) {
            player val::function_588f2307a3040610("vehicle");
            player val::function_3633b947164be4f3("vehicle_passenger", 0);
        } else if (vehicle_occupancy_isdriverseat(vehicle, seatid)) {
            player val::function_588f2307a3040610("vehicle_passenger");
            player val::function_3633b947164be4f3("vehicle", 0);
        }
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x850
// Size: 0x16b
function vehicle_occupancy_mp_updatemarkfilter(vehicle) {
    if (!isdefined(vehicle.occupants)) {
        return;
    }
    if (!isdefined(vehicle.marksenabled)) {
        vehicle.marksenabled = 1;
    }
    var_e8144973b1c57819 = vehicle.marksenabled;
    occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle);
    vehicle.marksenabled = occupants.size > 0;
    if (var_e8144973b1c57819 && !vehicle.marksenabled) {
        vehicle disableplayermarks("killstreak");
    } else if (!var_e8144973b1c57819 && vehicle.marksenabled) {
        vehicle enableplayermarks("killstreak");
    }
    if (vehicle.marksenabled) {
        if (level.teambased) {
            var_c95b61bab9571249 = [];
            foreach (occupant in occupants) {
                if (isdefined(occupant.team) && !array_contains(var_c95b61bab9571249, occupant.team)) {
                    var_c95b61bab9571249[var_c95b61bab9571249.size] = occupant.team;
                }
            }
            vehicle filteroutplayermarks(var_c95b61bab9571249);
        } else {
            vehicle filteroutplayermarks(occupants);
        }
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c2
// Size: 0x17
function vehicle_occupancy_mp_registerinstance(vehicle) {
    /#
        function_c69e3a63719e7856(vehicle);
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e0
// Size: 0x17
function vehicle_occupancy_mp_deregisterinstance(vehicle) {
    /#
        function_8bccda4687e38719(vehicle);
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fe
// Size: 0x5e
function vehicle_occupancy_mp_hidecashbag(vehicle, var_7558f98f3236963d, player, data) {
    if (isdefined(var_7558f98f3236963d)) {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_7558f98f3236963d);
        if (istrue(var_c50b485a43752fd.showcashbag)) {
            return;
        }
    }
    namespace_7e17181d03156026::function_efc7b5130b976314(player);
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa63
// Size: 0x5e
function vehicle_occupancy_mp_showcashbag(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (isdefined(var_fc7c7a874b43a31a)) {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_fc7c7a874b43a31a);
        if (istrue(var_c50b485a43752fd.showcashbag)) {
            return;
        }
    }
    namespace_7e17181d03156026::function_affaefa6ea1b971d(player);
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0x3a
function vehicle_occupancy_mp_updateowner(vehicle) {
    vehicle_occupancy_mp_updatemarkfilter(vehicle);
    if (isdefined(vehicle.owner)) {
        vehicle.var_628a2eba2e3d4af4 = vehicle.owner;
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb09
// Size: 0x28a
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
            /#
                assertex(!isdefined(riotshieldweapon), "vehicle_occupancy_mp_takeRiotShield found two riot shields in player's inventory.");
            #/
            riotshieldweapon = weapon;
            if (issameweapon(riotshieldweapon, player getcurrentprimaryweapon())) {
                riotshieldiscurrentprimary = 1;
            }
        } else if (!isdefined(var_102d661b1caa8bc1)) {
            var_dd9181eb18c4db69 = weapon getnoaltweapon();
            if (var_dd9181eb18c4db69.inventorytype != "primary") {
                continue;
            }
            var_102d661b1caa8bc1 = weapon;
        }
    }
    if (!isdefined(riotshieldweapon) && namespace_36f464722d326bbe::isbrstylegametype() && namespace_aead94004cf4c147::isbackpackinventoryenabled() && namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
        if (isdefined(var_9ac5e72784815708) && isriotshield(var_9ac5e72784815708)) {
            riotshieldweapon = var_9ac5e72784815708;
        }
    }
    weaponindex = 0;
    if (isdefined(riotshieldweapon)) {
        if (namespace_36f464722d326bbe::isbrstylegametype() && namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
            for (i = 0; i < 3; i++) {
                var_a1c804ffa2416774 = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, i);
                if (isdefined(var_a1c804ffa2416774) && var_a1c804ffa2416774 == riotshieldweapon) {
                    weaponindex = i;
                    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                        var_96c4059aa2eabfb8 = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(player, i);
                        player.var_d3143125b9854467 = var_96c4059aa2eabfb8;
                    }
                    break;
                }
            }
        }
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            if (weaponindex == 2) {
                namespace_aead94004cf4c147::function_954372d604277278(player);
            } else {
                player namespace_cb965d2f71fefddc::function_d655f2006cfe7789(riotshieldweapon);
            }
        } else {
            player _takeweapon(riotshieldweapon);
        }
        player.riotshieldtaken = riotshieldweapon;
        player.riotshieldiscurrentprimary = riotshieldiscurrentprimary;
        if (istrue(riotshieldiscurrentprimary)) {
            vehicle_occupancy_mp_updateriotshield(player, vehicle, var_7558f98f3236963d);
        }
        /#
            assertex(isdefined(var_102d661b1caa8bc1), "vehicle_occupancy_mp_takeRiotShield took riot shield, but cannot find a weapon to switch to.");
        #/
        player namespace_d19129e4fa5d176::riotshieldonweaponchange(var_102d661b1caa8bc1);
        player notify("modified_riot_shield");
        player endon("modified_riot_shield");
        player childthread forcevalidweapon(var_102d661b1caa8bc1);
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9a
// Size: 0x1d9
function vehicle_occupancy_mp_giveriotshield(player, var_fcef8d217a441961, var_8feafcea3627eb2b) {
    if (isdefined(player.riotshieldtaken)) {
        var_fdd4cb56c3b978a3 = level.gametype == "br";
        if (!istrue(var_fcef8d217a441961) && (var_fdd4cb56c3b978a3 || !istrue(var_8feafcea3627eb2b))) {
            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.weapon = player.riotshieldtaken;
                var_60227bff1e9478cc.count = 1;
                var_60227bff1e9478cc.countlefthand = 0;
                var_60227bff1e9478cc.origin = player.origin;
                var_60227bff1e9478cc.angles = player.angles;
                var_60227bff1e9478cc.var_4a08890fd43d6bc7 = namespace_aead94004cf4c147::isbackpackinventoryenabled() && namespace_aead94004cf4c147::function_b13e35608b336d65(player) > 5 && !player hasweapon("iw9_me_fists_mp");
                if (var_60227bff1e9478cc.var_4a08890fd43d6bc7) {
                    var_60227bff1e9478cc.var_f51bbb191526dfa4 = 1;
                }
                if (isdefined(player.var_d3143125b9854467)) {
                    var_60227bff1e9478cc.metadata = player.var_d3143125b9854467;
                }
                var_a2917fab2b2235dd = namespace_3bbb5a98b932c46f::isfistweapon(player getcurrentweapon());
                player namespace_3bcd40a3005712ec::takeweaponpickup(var_60227bff1e9478cc, undefined, undefined, undefined, undefined, !var_a2917fab2b2235dd);
            } else {
                player _giveweapon(player.riotshieldtaken);
            }
            player namespace_d19129e4fa5d176::trackriotshield_tryreset();
            if (istrue(player.riotshieldiscurrentprimary)) {
                player notify("modified_riot_shield");
                player endon("modified_riot_shield");
                if (!istrue(var_8feafcea3627eb2b)) {
                    player childthread _switchtoweaponimmediate(player.riotshieldtaken);
                }
            }
        }
        player.riotshieldtaken = undefined;
        player.riotshieldiscurrentprimary = undefined;
        player notify("modified_riot_shield");
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7a
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

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1012
// Size: 0x117
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
                vehicle namespace_6d9917c3dc05dbe9::registersentient(var_e2818ad39a3341b4.threatbiasgroup, team);
                vehicle.sentientteam = team;
            }
        } else if (isdefined(vehicle.sentientteam)) {
            vehicle_occupancy_mp_unregistersentient(vehicle);
        }
    }
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1130
// Size: 0x1f
function vehicle_occupancy_mp_unregistersentient(vehicle) {
    vehicle notify("remove_sentient");
    vehicle.sentientteam = undefined;
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1156
// Size: 0x18
function vehicle_occupancy_mp_issentient(vehicle) {
    return isdefined(vehicle.sentientteam);
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1176
// Size: 0x2c
function function_a24b81b039ab82a2() {
    /#
        leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = [];
        thread function_e04e6e6510f701ff();
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a9
// Size: 0x5b
function function_c69e3a63719e7856(vehicle) {
    /#
        leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = array_removeundefined(leveldata.debuginstances);
        leveldata.debuginstances = array_add(leveldata.debuginstances, vehicle);
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x120b
// Size: 0x3e
function function_8bccda4687e38719(vehicle) {
    /#
        leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = array_remove(leveldata.debuginstances, vehicle);
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1250
// Size: 0x63
function function_e04e6e6510f701ff() {
    /#
        while (1) {
            if (getdvarint(@"hash_dd33e6bf6e533554", 0) != 0 || getdvarint(@"hash_5a20dfa97c106e84", 0) != 0) {
                function_da867e6291c3df56();
            }
            if (getdvarint(@"hash_58b1b5f716ceb29b", 0) != 0) {
                function_d5250ff459d106fe();
            }
            wait(level.framedurationseconds);
        }
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ba
// Size: 0x608
function function_d5250ff459d106fe() {
    /#
        leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
        foreach (vehicle in leveldata.debuginstances) {
            if (!isdefined(vehicle)) {
                continue;
            }
            vehicle thread namespace_3c37cb17ade254d::draw_ent_axis((0, 0, 1), 1, 10);
            var_e2818ad39a3341b4 = namespace_5a0f3ca265d3a4c8::vehicle_damage_getleveldataforvehicle(vehicle.vehiclename);
            if (!isdefined(var_e2818ad39a3341b4) || !isdefined(var_e2818ad39a3341b4.var_c0d2f358f2e54245)) {
                continue;
            }
            front = var_e2818ad39a3341b4.var_c0d2f358f2e54245.front;
            back = var_e2818ad39a3341b4.var_c0d2f358f2e54245.back;
            left = var_e2818ad39a3341b4.var_c0d2f358f2e54245.left;
            right = var_e2818ad39a3341b4.var_c0d2f358f2e54245.right;
            top = var_e2818ad39a3341b4.var_c0d2f358f2e54245.top;
            bottom = var_e2818ad39a3341b4.var_c0d2f358f2e54245.bottom;
            var_e99a7e032ab1d575 = vehicle.origin;
            var_e99a7e032ab1d575 = var_e99a7e032ab1d575 + anglestoup(vehicle.angles) * top;
            var_e99a7e032ab1d575 = var_e99a7e032ab1d575 + anglestoforward(vehicle.angles) * front;
            var_e99a7e032ab1d575 = var_e99a7e032ab1d575 + anglestoright(vehicle.angles) * -1 * left;
            var_e99a70032ab1b6ab = vehicle.origin;
            var_e99a70032ab1b6ab = var_e99a70032ab1b6ab + anglestoup(vehicle.angles) * top;
            var_e99a70032ab1b6ab = var_e99a70032ab1b6ab + anglestoforward(vehicle.angles) * front;
            var_e99a70032ab1b6ab = var_e99a70032ab1b6ab + anglestoright(vehicle.angles) * right;
            var_e9ac5e032ac5cc71 = vehicle.origin;
            var_e9ac5e032ac5cc71 = var_e9ac5e032ac5cc71 + anglestoup(vehicle.angles) * top;
            var_e9ac5e032ac5cc71 = var_e9ac5e032ac5cc71 + anglestoforward(vehicle.angles) * -1 * back;
            var_e9ac5e032ac5cc71 = var_e9ac5e032ac5cc71 + anglestoright(vehicle.angles) * -1 * left;
            var_e9ac68032ac5e26f = vehicle.origin;
            var_e9ac68032ac5e26f = var_e9ac68032ac5e26f + anglestoup(vehicle.angles) * top;
            var_e9ac68032ac5e26f = var_e9ac68032ac5e26f + anglestoforward(vehicle.angles) * -1 * back;
            var_e9ac68032ac5e26f = var_e9ac68032ac5e26f + anglestoright(vehicle.angles) * right;
            var_b60bb803c10baf23 = vehicle.origin;
            var_b60bb803c10baf23 = var_b60bb803c10baf23 + anglestoup(vehicle.angles) * -1 * bottom;
            var_b60bb803c10baf23 = var_b60bb803c10baf23 + anglestoforward(vehicle.angles) * front;
            var_b60bb803c10baf23 = var_b60bb803c10baf23 + anglestoright(vehicle.angles) * -1 * left;
            var_b60bb603c10baabd = vehicle.origin;
            var_b60bb603c10baabd = var_b60bb603c10baabd + anglestoup(vehicle.angles) * -1 * bottom;
            var_b60bb603c10baabd = var_b60bb603c10baabd + anglestoforward(vehicle.angles) * front;
            var_b60bb603c10baabd = var_b60bb603c10baabd + anglestoright(vehicle.angles) * right;
            var_b5f9b803c0f771c7 = vehicle.origin;
            var_b5f9b803c0f771c7 = var_b5f9b803c0f771c7 + anglestoup(vehicle.angles) * -1 * bottom;
            var_b5f9b803c0f771c7 = var_b5f9b803c0f771c7 + anglestoforward(vehicle.angles) * -1 * back;
            var_b5f9b803c0f771c7 = var_b5f9b803c0f771c7 + anglestoright(vehicle.angles) * -1 * left;
            var_b5f99e03c0f73899 = vehicle.origin;
            var_b5f99e03c0f73899 = var_b5f99e03c0f73899 + anglestoup(vehicle.angles) * -1 * bottom;
            var_b5f99e03c0f73899 = var_b5f99e03c0f73899 + anglestoforward(vehicle.angles) * -1 * back;
            var_b5f99e03c0f73899 = var_b5f99e03c0f73899 + anglestoright(vehicle.angles) * right;
            thread namespace_f2ffc0540883e1ad::drawline(var_e99a7e032ab1d575, var_e99a70032ab1b6ab, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e99a7e032ab1d575, var_e9ac5e032ac5cc71, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e99a70032ab1b6ab, var_e9ac68032ac5e26f, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e9ac68032ac5e26f, var_e9ac5e032ac5cc71, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_b60bb803c10baf23, var_b60bb603c10baabd, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_b60bb803c10baf23, var_b5f9b803c0f771c7, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_b60bb603c10baabd, var_b5f99e03c0f73899, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_b5f99e03c0f73899, var_b5f9b803c0f771c7, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e99a7e032ab1d575, var_b60bb803c10baf23, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e99a70032ab1b6ab, var_b60bb603c10baabd, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e9ac5e032ac5cc71, var_b5f9b803c0f771c7, level.framedurationseconds, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(var_e9ac68032ac5e26f, var_b5f99e03c0f73899, level.framedurationseconds, (1, 1, 1));
        }
    #/
}

// Namespace namespace_60c72bf2f4474547/namespace_8a7917956d758aea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c9
// Size: 0x718
function function_da867e6291c3df56() {
    /#
        leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
        foreach (vehicle in leveldata.debuginstances) {
            if (isdefined(vehicle)) {
                var_e2818ad39a3341b4 = undefined;
                vehicle thread namespace_3c37cb17ade254d::draw_ent_axis((0, 0, 1), 1, 10);
                if (getdvarint(@"hash_5a20dfa97c106e84", 0) != 0) {
                    front = getdvarfloat(@"hash_ae48fc0251f15678", 0);
                    back = getdvarfloat(@"hash_27b66fa4ccb92042", 0);
                    left = getdvarfloat(@"hash_1b55e0d66a16ab70", 0);
                    right = getdvarfloat(@"hash_f9f204d56cd2b845", 0);
                    top = getdvarfloat(@"hash_1e89088dab07f7fc", 0);
                    bottom = getdvarfloat(@"hash_2346182109bbc14a", 0);
                } else {
                    var_e2818ad39a3341b4 = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
                    if (!isdefined(var_e2818ad39a3341b4) || !isdefined(var_e2818ad39a3341b4.exitextents)) {
                        return;
                    }
                    front = var_e2818ad39a3341b4.exitextents["vehicle_occupancy_mp_takeRiotShield found two riot shields in player's inventory."];
                    back = var_e2818ad39a3341b4.exitextents["neutral"];
                    left = var_e2818ad39a3341b4.exitextents["<unknown string>"];
                    right = var_e2818ad39a3341b4.exitextents["<unknown string>"];
                    top = var_e2818ad39a3341b4.exitextents["<unknown string>"];
                    bottom = var_e2818ad39a3341b4.exitextents["<unknown string>"];
                }
                var_e99a7e032ab1d575 = vehicle.origin;
                var_e99a7e032ab1d575 = var_e99a7e032ab1d575 + anglestoup(vehicle.angles) * top;
                var_e99a7e032ab1d575 = var_e99a7e032ab1d575 + anglestoforward(vehicle.angles) * front;
                var_e99a7e032ab1d575 = var_e99a7e032ab1d575 + anglestoright(vehicle.angles) * -1 * left;
                var_e99a70032ab1b6ab = vehicle.origin;
                var_e99a70032ab1b6ab = var_e99a70032ab1b6ab + anglestoup(vehicle.angles) * top;
                var_e99a70032ab1b6ab = var_e99a70032ab1b6ab + anglestoforward(vehicle.angles) * front;
                var_e99a70032ab1b6ab = var_e99a70032ab1b6ab + anglestoright(vehicle.angles) * right;
                var_e9ac5e032ac5cc71 = vehicle.origin;
                var_e9ac5e032ac5cc71 = var_e9ac5e032ac5cc71 + anglestoup(vehicle.angles) * top;
                var_e9ac5e032ac5cc71 = var_e9ac5e032ac5cc71 + anglestoforward(vehicle.angles) * -1 * back;
                var_e9ac5e032ac5cc71 = var_e9ac5e032ac5cc71 + anglestoright(vehicle.angles) * -1 * left;
                var_e9ac68032ac5e26f = vehicle.origin;
                var_e9ac68032ac5e26f = var_e9ac68032ac5e26f + anglestoup(vehicle.angles) * top;
                var_e9ac68032ac5e26f = var_e9ac68032ac5e26f + anglestoforward(vehicle.angles) * -1 * back;
                var_e9ac68032ac5e26f = var_e9ac68032ac5e26f + anglestoright(vehicle.angles) * right;
                var_b60bb803c10baf23 = vehicle.origin;
                var_b60bb803c10baf23 = var_b60bb803c10baf23 + anglestoup(vehicle.angles) * -1 * bottom;
                var_b60bb803c10baf23 = var_b60bb803c10baf23 + anglestoforward(vehicle.angles) * front;
                var_b60bb803c10baf23 = var_b60bb803c10baf23 + anglestoright(vehicle.angles) * -1 * left;
                var_b60bb603c10baabd = vehicle.origin;
                var_b60bb603c10baabd = var_b60bb603c10baabd + anglestoup(vehicle.angles) * -1 * bottom;
                var_b60bb603c10baabd = var_b60bb603c10baabd + anglestoforward(vehicle.angles) * front;
                var_b60bb603c10baabd = var_b60bb603c10baabd + anglestoright(vehicle.angles) * right;
                var_b5f9b803c0f771c7 = vehicle.origin;
                var_b5f9b803c0f771c7 = var_b5f9b803c0f771c7 + anglestoup(vehicle.angles) * -1 * bottom;
                var_b5f9b803c0f771c7 = var_b5f9b803c0f771c7 + anglestoforward(vehicle.angles) * -1 * back;
                var_b5f9b803c0f771c7 = var_b5f9b803c0f771c7 + anglestoright(vehicle.angles) * -1 * left;
                var_b5f99e03c0f73899 = vehicle.origin;
                var_b5f99e03c0f73899 = var_b5f99e03c0f73899 + anglestoup(vehicle.angles) * -1 * bottom;
                var_b5f99e03c0f73899 = var_b5f99e03c0f73899 + anglestoforward(vehicle.angles) * -1 * back;
                var_b5f99e03c0f73899 = var_b5f99e03c0f73899 + anglestoright(vehicle.angles) * right;
                thread namespace_f2ffc0540883e1ad::drawline(var_e99a7e032ab1d575, var_e99a70032ab1b6ab, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e99a7e032ab1d575, var_e9ac5e032ac5cc71, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e99a70032ab1b6ab, var_e9ac68032ac5e26f, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e9ac68032ac5e26f, var_e9ac5e032ac5cc71, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_b60bb803c10baf23, var_b60bb603c10baabd, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_b60bb803c10baf23, var_b5f9b803c0f771c7, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_b60bb603c10baabd, var_b5f99e03c0f73899, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_b5f99e03c0f73899, var_b5f9b803c0f771c7, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e99a7e032ab1d575, var_b60bb803c10baf23, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e99a70032ab1b6ab, var_b60bb603c10baabd, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e9ac5e032ac5cc71, var_b5f9b803c0f771c7, level.framedurationseconds, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawline(var_e9ac68032ac5e26f, var_b5f99e03c0f73899, level.framedurationseconds, (1, 1, 1));
                if (isdefined(var_e2818ad39a3341b4)) {
                    foreach (exit in var_e2818ad39a3341b4.exitoffsets) {
                        thread namespace_f2ffc0540883e1ad::drawline(vehicle.origin, vehicle.origin + rotatevector(exit, vehicle.angles), level.framedurationseconds, (0, 1, 1));
                    }
                }
            }
        }
    #/
}

