#using script_476b6443e3798f5e;
#using script_74502a9e0ef1f19c;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\cp_outofbounds;
#using scripts\cp\utility;
#using scripts\cp\vehicles\vehicle_oob_cp;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\utility;

#namespace namespace_608a17f2f404a889;

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e
// Size: 0xb7
function vehicle_occupancy_cp_init() {
    registersharedfunc("vehicle_occupancy", "onEnterVehicle", &vehicle_occupancy_cp_onentervehicle);
    registersharedfunc("vehicle_occupancy", "onExitVehicle", &vehicle_occupancy_cp_onexitvehicle);
    registersharedfunc("vehicle_occupancy", "handleSuicideFromVehicles", &vehicle_occupancy_cp_handlesuicidefromvehicles);
    registersharedfunc("vehicle_occupancy", "takeRiotShield", &vehicle_occupancy_cp_takeriotshield);
    registersharedfunc("vehicle_occupancy", "giveRiotShield", &vehicle_occupancy_cp_giveriotshield);
    registersharedfunc("vehicle_occupancy", "updateRiotShield", &vehicle_occupancy_cp_updateriotshield);
    val::group_register("vehicle", ["gesture", "killstreaks", "supers", "cp_munitions"]);
}

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x34d
// Size: 0xf4
function vehicle_occupancy_cp_onentervehicle(vehicle, var_7558f98f3236963d, player, data) {
    if (isdefined(vehicle.vehicle_specific_onentervehicle)) {
        [[ vehicle.vehicle_specific_onentervehicle ]](vehicle, var_7558f98f3236963d, player, data);
    }
    player val::group_set("vehicle", 0);
    if (scripts\cp\cp_outofbounds::isoob(vehicle, 1)) {
        vehicle thread scripts\cp\vehicles\vehicle_oob_cp::vehicle_oob_cp_entercallbackforplayer(player);
    }
    if (isdefined(player.linkedsaw)) {
        player.linkedsaw hide();
        player.linkedsaw unlink();
    }
    if (istrue(vehicle.bshouldoccupantsbeignored)) {
        player scripts\cp\utility::allow_player_ignore_me(1);
    }
    if (namespace_c058342275db1f64::function_ab29f5844aa437fb()) {
        namespace_c058342275db1f64::function_b0637efa07ab9df9(vehicle, "killstreak");
    }
    player.binvehicle = 1;
    player.dontmeleeme = 1;
    player notify("entered_vehicle");
    player notify("force_regeneration");
}

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x449
// Size: 0x134
function vehicle_occupancy_cp_onexitvehicle(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (isdefined(vehicle.vehicle_specific_onexitvehicle)) {
        [[ vehicle.vehicle_specific_onexitvehicle ]](vehicle, var_fc7c7a874b43a31a, player, data);
    }
    if (!istrue(data.playerdisconnect)) {
        if (!istrue(data.playerdeath)) {
            player val::group_reset("vehicle");
            if (scripts\cp\cp_outofbounds::isoob(vehicle, 1)) {
                vehicle thread scripts\cp\vehicles\vehicle_oob_cp::vehicle_oob_cp_exitcallbackforplayer(player);
            }
        }
        if (namespace_c058342275db1f64::function_ab29f5844aa437fb()) {
            namespace_c058342275db1f64::function_51ac8764c365bc6e(vehicle);
        }
        player notify("vehicle_exit");
    }
    if (istrue(vehicle.bshouldoccupantsbeignored)) {
        player scripts\cp\utility::allow_player_ignore_me(0);
    }
    if (isdefined(player.linkedsaw)) {
        player.linkedsaw linkto(player, "tag_shield_back", (5, 10, 0), (0, 0, 90));
        player.linkedsaw show();
    }
    player.shouldskiplaststand = undefined;
    player.binvehicle = 0;
    player.dontmeleeme = 0;
    player notify("exited_vehicle");
}

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x585
// Size: 0x47
function vehicle_occupancy_cp_handlesuicidefromvehicles(player) {
    player.shouldskipdeathsshield = 1;
    player.shouldskiplaststand = 1;
    player dodamage(player.health + 50, player.origin);
}

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d4
// Size: 0x17b
function vehicle_occupancy_cp_takeriotshield(player, vehicle, var_7558f98f3236963d) {
    riotshieldweapon = undefined;
    riotshieldiscurrentprimary = undefined;
    var_102d661b1caa8bc1 = undefined;
    primaryweapons = player getweaponslistprimaries();
    foreach (weapon in primaryweapons) {
        if (isnullweapon(weapon)) {
            continue;
        }
        if (isriotshield(weapon)) {
            assertex(!isdefined(riotshieldweapon), "vehicle_occupancy_cp_takeRiotShield found two riot shields in player's inventory.");
            riotshieldweapon = weapon;
            if (issameweapon(riotshieldweapon, player getcurrentprimaryweapon())) {
                riotshieldiscurrentprimary = 1;
            }
            continue;
        }
        if (!isdefined(var_102d661b1caa8bc1)) {
            var_dd9181eb18c4db69 = weapon getnoaltweapon();
            if (var_dd9181eb18c4db69.inventorytype != "primary") {
                continue;
            }
            var_102d661b1caa8bc1 = weapon;
        }
    }
    if (isdefined(riotshieldweapon)) {
        player _takeweapon(riotshieldweapon);
        player.riotshieldtaken = riotshieldweapon;
        player.riotshieldiscurrentprimary = riotshieldiscurrentprimary;
        if (istrue(riotshieldiscurrentprimary)) {
            vehicle_occupancy_cp_updateriotshield(player, vehicle, var_7558f98f3236963d);
        }
        assertex(isdefined(var_102d661b1caa8bc1), "vehicle_occupancy_cp_takeRiotShield took riot shield, but cannot find a weapon to switch to.");
        player namespace_a0628d6954815ef8::riotshieldonweaponchange(var_102d661b1caa8bc1);
        player notify("modified_riot_shield");
        player endon("modified_riot_shield");
        player childthread forcevalidweapon(var_102d661b1caa8bc1);
    }
}

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x757
// Size: 0xc7
function vehicle_occupancy_cp_giveriotshield(player, fromdeath, fromlaststand) {
    if (isdefined(player.riotshieldtaken)) {
        if (!istrue(fromdeath) && !istrue(fromlaststand)) {
            player _giveweapon(player.riotshieldtaken);
            player namespace_a0628d6954815ef8::trackriotshield_tryreset();
            if (istrue(player.riotshieldiscurrentprimary)) {
                player notify("modified_riot_shield");
                player endon("modified_riot_shield");
                player childthread _switchtoweaponimmediate(player.riotshieldtaken);
            }
        } else if (!istrue(fromdeath) && istrue(fromlaststand)) {
            player.riotshield_return = player.riotshieldtaken;
        }
        player.riotshieldtaken = undefined;
        player.riotshieldiscurrentprimary = undefined;
        player notify("modified_riot_shield");
    }
}

// Namespace namespace_608a17f2f404a889 / scripts\cp\vehicles\vehicle_occupancy_cp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x826
// Size: 0x90
function vehicle_occupancy_cp_updateriotshield(player, vehicle, var_7558f98f3236963d) {
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

