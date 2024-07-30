#using scripts\mp\utility\script.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;

#namespace namespace_4f0c600a70c68b71;

// Namespace namespace_4f0c600a70c68b71 / scripts\mp\equipment\advanced_supply_drop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132
// Size: 0xd4
function advanced_supply_drop_marker_used(grenade) {
    player = self;
    player endon("disconnect");
    grenade endon("explode_end");
    grenade thread notifyafterframeend("death", "explode_end");
    player thread advanced_supply_drop_refund_on_death(grenade);
    position = grenade waittill("explode");
    player notify("advanced_supply_drop_finished");
    thread advanced_supply_drop_marker_sfx(position);
    if (scripts\mp\outofbounds::ispointinoutofbounds(position)) {
        if (isdefined(grenade)) {
            grenade delete();
        }
        if (isdefined(player.super)) {
            player scripts\mp\supers::superusefinished(1);
        }
        return;
    }
    var_17b727cd5881efd8 = scripts\mp\gametypes\br_rewards::getdropbagspawntypeenum(0, 0, 1, 0, 0, 0);
    player scripts\mp\gametypes\br_rewards::spawndropbagatposition(position, var_17b727cd5881efd8);
    if (isdefined(player.super)) {
        player scripts\mp\supers::superusefinished(undefined, undefined, undefined, 1);
    }
}

// Namespace namespace_4f0c600a70c68b71 / scripts\mp\equipment\advanced_supply_drop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0x167
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
    if (scripts\mp\outofbounds::ispointinoutofbounds(position)) {
        if (isdefined(grenade)) {
            grenade delete();
        }
        if (isdefined(player.super)) {
            player scripts\mp\supers::superusefinished(1);
        }
        return;
    }
    spawnpoint = spawnstruct();
    tracecontents = scripts\engine\trace::create_default_contents(1);
    groundorigin = drop_to_ground(position, 10000, -20000, undefined, tracecontents);
    spawnpoint.origin = groundorigin + (0, 0, 50000);
    vehicle = undefined;
    if (isdefined(vehicle)) {
        scripts\mp\gametypes\br_gametype_truckwar::function_20b77fbf1af1a5d(vehicle, player.team, 1);
        level thread scripts\mp\gametypes\br_gametype_truckwar::truck_airdrop(vehicle, groundorigin, vehicle.angles, 1);
    }
    if (isdefined(player.super)) {
        player scripts\mp\supers::superusefinished(undefined, undefined, undefined, 1);
    }
}

// Namespace namespace_4f0c600a70c68b71 / scripts\mp\equipment\advanced_supply_drop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0x61
function function_22740c19d22b8b6e(player, grenade) {
    player_team = player.team;
    level.var_e3ccf0898a949bec[player_team] = 1;
    scripts\engine\utility::waittill_any_ents(player, "disconnect", grenade, "explode_end", grenade, "explode", grenade, "death");
    level.var_e3ccf0898a949bec[player_team] = undefined;
}

// Namespace namespace_4f0c600a70c68b71 / scripts\mp\equipment\advanced_supply_drop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6
// Size: 0x47
function advanced_supply_drop_refund_on_death(grenade) {
    player = self;
    player endon("disconnect");
    player endon("advanced_supply_drop_finished");
    grenade waittill("death");
    waitframe();
    if (isdefined(player.super)) {
        player scripts\mp\supers::superusefinished(1);
    }
}

// Namespace namespace_4f0c600a70c68b71 / scripts\mp\equipment\advanced_supply_drop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x435
// Size: 0x52
function advanced_supply_drop_marker_sfx(position) {
    smoke_sfx = spawn("script_origin", position);
    smoke_sfx playloopsound("smoke_carepackage_smoke_lp");
    wait 21;
    smoke_sfx playsound("smoke_canister_tail_dissipate");
    smoke_sfx stoploopsound("smoke_carepackage_smoke_lp");
    wait 5;
    smoke_sfx delete();
}

