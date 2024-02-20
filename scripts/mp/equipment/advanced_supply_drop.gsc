// mwiii decomp prototype
#using scripts\mp\utility\script.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;

#namespace namespace_4f0c600a70c68b71;

// Namespace namespace_4f0c600a70c68b71/namespace_bfc508e9af237b9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132
// Size: 0xd5
function advanced_supply_drop_marker_used(grenade) {
    player = self;
    player endon("disconnect");
    grenade endon("explode_end");
    grenade thread notifyafterframeend("death", "explode_end");
    player thread advanced_supply_drop_refund_on_death(grenade);
    position = grenade waittill("explode");
    player notify("advanced_supply_drop_finished");
    thread advanced_supply_drop_marker_sfx(position);
    if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(position)) {
        if (isdefined(grenade)) {
            grenade delete();
        }
        if (isdefined(player.super)) {
            player namespace_85d036cb78063c4a::superusefinished(1);
        }
        return;
    }
    var_17b727cd5881efd8 = namespace_c3059e55bc606259::getdropbagspawntypeenum(0, 0, 1, 0, 0, 0);
    player namespace_c3059e55bc606259::spawndropbagatposition(position, var_17b727cd5881efd8);
    if (isdefined(player.super)) {
        player namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
    }
}

// Namespace namespace_4f0c600a70c68b71/namespace_bfc508e9af237b9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0x168
function function_f3e74468f0e5f521(grenade) {
    player = self;
    player endon("disconnect");
    grenade endon("explode_end");
    grenade thread notifyafterframeend("death", "explode_end");
    player thread advanced_supply_drop_refund_on_death(grenade);
    if (isdefined(level.var_e3ccf0898a949bec)) {
        level thread function_22740c19d22b8b6e(player, grenade);
    }
    position = grenade waittill("explode");
    player notify("advanced_supply_drop_finished");
    thread advanced_supply_drop_marker_sfx(position);
    if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(position)) {
        if (isdefined(grenade)) {
            grenade delete();
        }
        if (isdefined(player.super)) {
            player namespace_85d036cb78063c4a::superusefinished(1);
        }
        return;
    }
    spawnpoint = spawnstruct();
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    groundorigin = drop_to_ground(position, 10000, -20000, undefined, var_fbcabd62b8f66eb8);
    spawnpoint.origin = groundorigin + (0, 0, 50000);
    vehicle = undefined;
    if (isdefined(vehicle)) {
        namespace_ea497db8cab34561::function_20b77fbf1af1a5d(vehicle, player.team, 1);
        level thread namespace_ea497db8cab34561::truck_airdrop(vehicle, groundorigin, vehicle.angles, 1);
    }
    if (isdefined(player.super)) {
        player namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
    }
}

// Namespace namespace_4f0c600a70c68b71/namespace_bfc508e9af237b9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0x62
function function_22740c19d22b8b6e(player, grenade) {
    player_team = player.team;
    level.var_e3ccf0898a949bec[player_team] = 1;
    namespace_3c37cb17ade254d::waittill_any_ents(player, "disconnect", grenade, "explode_end", grenade, "explode", grenade, "death");
    level.var_e3ccf0898a949bec[player_team] = undefined;
}

// Namespace namespace_4f0c600a70c68b71/namespace_bfc508e9af237b9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6
// Size: 0x48
function advanced_supply_drop_refund_on_death(grenade) {
    player = self;
    player endon("disconnect");
    player endon("advanced_supply_drop_finished");
    grenade waittill("death");
    waitframe();
    if (isdefined(player.super)) {
        player namespace_85d036cb78063c4a::superusefinished(1);
    }
}

// Namespace namespace_4f0c600a70c68b71/namespace_bfc508e9af237b9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x435
// Size: 0x53
function advanced_supply_drop_marker_sfx(position) {
    var_ba3396e2b7597b2 = spawn("script_origin", position);
    var_ba3396e2b7597b2 playloopsound("smoke_carepackage_smoke_lp");
    wait(21);
    var_ba3396e2b7597b2 playsound("smoke_canister_tail_dissipate");
    var_ba3396e2b7597b2 stoploopsound("smoke_carepackage_smoke_lp");
    wait(5);
    var_ba3396e2b7597b2 delete();
}

