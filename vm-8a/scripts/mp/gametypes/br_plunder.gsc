#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_7ab5b649fa408138;
#using scripts\engine\trace.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\equipment\fulton.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using script_3f1b6713ca4c9c7;
#using script_58f20490049af6ac;
#using script_67fb1233e876ed8;
#using scripts\mp\flags.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\common\interactive.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace br_plunder;

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5b
// Size: 0x45e
function init() {
    level.br_plunder_enabled = getmatchrulesdata("brData", "plunder");
    thread setupplunderextractionsites();
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    initheliextractanims();
    inithelipropanims();
    level._effect["vfx_extract_smoke"] = loadfx("vfx/iw8_br/gameplay/vfx_br_adv_supply_drop_marker");
    level._effect["vfx_br_cashLeaderBag"] = loadfx("vfx/iw8_br/gameplay/vfx_br_money_vip_burst.vfx");
    var_dc62762d4387d2b8 = getmatchrulesdata("brData", "plunderLobby");
    level.br_plunder_lobby = var_dc62762d4387d2b8 && istrue(level.allowprematchdamage);
    level.br_plunder = spawnstruct();
    level.br_plunder.plunderlimit = 131072 - 1;
    level.br_plunder.plunder_items_picked_up = 0;
    level.br_plunder.plunder_value_picked_up = 0;
    level.br_plunder.plunder_items_dropped = 0;
    level.br_plunder.plunder_value_dropped = 0;
    level.br_plunder.kiosk_spent_total = 0;
    level.br_plunder.kiosk_num_purchases = 0;
    level.br_plunder.extraction_balloon_total_plunder = 0;
    level.br_plunder.extraction_balloon_num_completed = 0;
    level.br_plunder.extraction_helicoptor_total_plunder = 0;
    level.br_plunder.extraction_helicoptor_num_completed = 0;
    level.br_plunder.plunder_awarded_by_missions_total = 0;
    level.br_plunder.itemsinworld = [];
    level.br_plunder.itemsinworld["brloot_plunder_cash_common_1"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_common_1");
    level.br_plunder.itemsinworld["brloot_plunder_cash_uncommon_1"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_uncommon_1");
    level.br_plunder.itemsinworld["brloot_plunder_cash_uncommon_2"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_uncommon_2");
    level.br_plunder.itemsinworld["brloot_plunder_cash_uncommon_3"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_uncommon_3");
    level.br_plunder.itemsinworld["brloot_plunder_cash_rare_1"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_rare_1");
    level.br_plunder.itemsinworld["brloot_plunder_cash_rare_2"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_rare_2");
    level.br_plunder.itemsinworld["brloot_plunder_cash_epic_1"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_epic_1");
    level.br_plunder.itemsinworld["brloot_plunder_cash_epic_2"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_epic_2");
    level.br_plunder.itemsinworld["brloot_plunder_cash_legendary_1"] = getscriptablelootspawnedcountbyname("brloot_plunder_cash_legendary_1");
    level.br_plunder.itemsinworld["br_loot_cache"] = getscriptablelootspawnedcountbyname("br_loot_cache");
    level.br_plunder.itemsinworld["brloot_mission_tablet"] = getscriptablelootspawnedcountbyname("brloot_mission_tablet");
    setupquantities();
    initvo();
    initplunderpads();
    if (!isdefined(level.minplunderdropondeath)) {
        level.minplunderdropondeath = 0;
    }
    level.br_depots = [];
    level thread plunder_economy_shapshot_loop();
    level thread plunder_infils_ready();
    if (inplunderlivelobby()) {
        level.br_plunder_ents = [];
        thread plunderlivelobby();
    }
    initplayerplunderevents();
    plunder_initrepositories();
    scripts\mp\equipment\fulton::fulton_init();
    initteamdatafields();
    inithelirepository();
    if (getdvarint(@"hash_91fbc1bbac0c27d7", 0) == 1) {
        processcashpilevalueoverrides();
    }
    scripts\mp\gametypes\br_circle::function_eca79fa0f341ee08(0, &dangercircletick, &function_1a1709943670772a);
    if (!scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        function_f1aed36ab4598ea("eqp_extraction_balloon");
    }
    /#
        thread function_d998045c08ec165d();
        setdevdvarifuninitialized(@"hash_69a2288a8b47e1b5", 0);
        setdevdvarifuninitialized(@"hash_f38b8e35f5c48796", 0);
        if (false) {
            debug_calculatecashonground();
        }
        level thread function_697ba36fc0e3cde4();
    #/
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0xb7
function plunder_economy_shapshot_loop(duration, safecircleent, var_fb3b2613d6f0eb05) {
    level endon("game_ended");
    level waittill("prematch_started");
    while (true) {
        level waittill("br_circle_started");
        activeplayers = [];
        foreach (player in level.players) {
            if (!player scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(player)) {
                activeplayers[activeplayers.size] = player;
            }
        }
        scripts\mp\gametypes\br_analytics::branalytics_economy_snapshot(activeplayers);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f80
// Size: 0xac
function plunder_infils_ready() {
    var_dc4fdc0d3e50e80b = getmatchrulesdata("brData", "plunderStartAmount");
    var_d437bea518f94dd0 = getmatchrulesdata("brData", "plunderBotStartAmount");
    if (!var_dc4fdc0d3e50e80b && !var_d437bea518f94dd0) {
        return;
    }
    level waittill("infils_ready");
    foreach (player in level.players) {
        player playersetplundercount(ter_op(isbot(player), var_d437bea518f94dd0, var_dc4fdc0d3e50e80b));
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2034
// Size: 0x4c
function modify_plunder_itemsinworld(itemname, var_bc23ce7464aa4861) {
    if (level.br_plunder_enabled) {
        level.br_plunder.itemsinworld[itemname] = level.br_plunder.itemsinworld[itemname] + var_bc23ce7464aa4861;
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2088
// Size: 0x287
function setupquantities() {
    level.br_plunder.quantity = [];
    level.br_plunder.names = [];
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_common_1";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_uncommon_1";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_uncommon_2";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_uncommon_3";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_rare_1";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_rare_2";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_epic_1";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_epic_2";
    level.br_plunder.names[level.br_plunder.names.size] = "brloot_plunder_cash_legendary_1";
    for (i = 0; i < level.br_plunder.names.size; i++) {
        level.br_plunder.quantity[i] = level.br_pickups.counts[level.br_plunder.names[i]];
        if (isdefined(level.br_plunder.quantity[i - 1])) {
            assert(level.br_plunder.quantity[i - 1] < level.br_plunder.quantity[i]);
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2317
// Size: 0xdd
function initvo() {
    assert(isdefined(game["dialog"]));
    if (!scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        game["dialog"]["plunder_extract_requested"] = "pxrq_grav_plnd";
        game["dialog"]["plunder_extract_chopper_arrive"] = "pxcr_grav_plnd";
        game["dialog"]["plunder_extract_chopper_leave"] = "pxcl_grav_plnd";
        game["dialog"]["plunder_extract_success"] = "pxcl_grav_plnd";
        game["dialog"]["plunder_extract_fail_chopper"] = "pxfc_grav_plnd";
        return;
    }
    game["dialog"]["plunder_extract_requested"] = "plunder_plunder_extract_requested";
    game["dialog"]["plunder_extract_chopper_arrive"] = "plunder_plunder_extract_chopper_arrive";
    game["dialog"]["plunder_extract_chopper_leave"] = "plunder_plunder_extract_chopper_leave";
    game["dialog"]["plunder_extract_success"] = "plunder_plunder_extract_success";
    game["dialog"]["plunder_extract_fail_chopper"] = "plunder_plunder_extract_fail_chopper";
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23fc
// Size: 0x1a
function initplunderpads() {
    level.plunderpads = getentarray("extract_pad", "targetname");
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241e
// Size: 0x4f
function playerplaybankanim() {
    if (self isswitchingweapon() || self isreloading() || self ismantling() || self isthrowinggrenade() || self israisingweapon() || self ismeleeing()) {
        return;
    }
    scripts\mp\gametypes\br_public::playerplaygestureweaponanim("iw8_ges_plyr_cash_handoff", 1.84);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2475
// Size: 0x6c
function playerremoveplunderfrominventory() {
    foreach (index, item in self.br_inventory_slots) {
        if (item.scriptablename == "brloot_plunder_cash_uncommon_1") {
            scripts\mp\gametypes\br_public::removeitemfrominventory(index);
            return;
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e9
// Size: 0x6d
function disablealldepotsforplayer(player) {
    if (isdefined(level.br_depots)) {
        for (i = 0; i < level.br_depots.size; i++) {
            depot = level.br_depots[i];
            if (isdefined(depot) && !istrue(depot.disabled)) {
                depot depotmakeunusabletoplayer(player);
            }
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255e
// Size: 0x60
function enablealldepotsforplayer(player) {
    for (i = 0; i < level.br_depots.size; i++) {
        depot = level.br_depots[i];
        if (isdefined(depot) && !istrue(depot.disabled)) {
            depot depotmakeusabletoplayer(player);
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c6
// Size: 0x31
function depotmakeusabletoplayer(player) {
    self enableplayeruse(player);
    if (isdefined(self.objectiveiconid)) {
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.objectiveiconid, player);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ff
// Size: 0x31
function depotmakeunusabletoplayer(player) {
    self disableplayeruse(player);
    if (isdefined(self.objectiveiconid)) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.objectiveiconid, player);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2638
// Size: 0x36
function depotmakeunsabletoall() {
    self makeunusable();
    if (isdefined(self.objectiveiconid)) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefromall(self.objectiveiconid);
        scripts\mp\objidpoolmanager::returnobjectiveid(self.objectiveiconid);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2676
// Size: 0xd8
function initplayer(revivespawn) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    if (!isdefined(self.plundercount)) {
        self.plundercount = 0;
    }
    if (!isdefined(self.plunderbanked)) {
        self.plunderbanked = 0;
    }
    if (!isdefined(self.haspickedupplunderyet)) {
        self.haspickedupplunderyet = 0;
    }
    if (self.plundercount == 0) {
        var_dc4fdc0d3e50e80b = 0;
        if (!istrue(revivespawn) && namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            namespace_a38a2e1fe7519183::function_7d760edc2a7e9b8f(self);
            var_dc4fdc0d3e50e80b = namespace_a38a2e1fe7519183::function_56ec0560843aa9a4(self);
            var_dc4fdc0d3e50e80b = default_to(var_dc4fdc0d3e50e80b, 0);
        }
        /#
            var_61b7c9fb211d6d0e = getdvarint(@"hash_729ed018713fcb98", 0);
            if (!istrue(revivespawn) && var_61b7c9fb211d6d0e > 0) {
                var_dc4fdc0d3e50e80b = var_61b7c9fb211d6d0e;
            }
        #/
        playersetplundercount(var_dc4fdc0d3e50e80b);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2756
// Size: 0x18
function playerdropplunder() {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    playersetplundercount(0);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2776
// Size: 0x8a
function bankplunderongameended() {
    level waittill("game_ended");
    foreach (player in level.players) {
        if (isdefined(player.plundercount) && player.plundercount > 0) {
            player playerplunderbank(player.plundercount);
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2808
// Size: 0xb0
function playerdropplunderondeath(dropstruct, attacker, allowautopickup) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    if (istrue(scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerDropPlunderOnDeath", dropstruct, attacker))) {
        return;
    }
    dropinfo = function_79275e2fab13f54d();
    var_6aee9c9054f09ed5 = dropinfo.var_6aee9c9054f09ed5;
    var_b64f283113c99581 = dropinfo.var_b64f283113c99581;
    self.plundercountondeath = var_6aee9c9054f09ed5;
    playersetplundercount(var_6aee9c9054f09ed5);
    if (var_b64f283113c99581 <= 0) {
        return;
    }
    dropstruct.var_13ac9eca292f815 = self.team;
    dropcondensedplunder(var_b64f283113c99581, dropstruct, allowautopickup);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c0
// Size: 0x250
function function_79275e2fab13f54d() {
    var_2927ed03b21bb4fd = getmatchrulesdata("brData", "plunderInflation");
    save = getmatchrulesdata("brData", "plunderSaveShare");
    tax = getmatchrulesdata("brData", "plunderTaxShare");
    drop = getmatchrulesdata("brData", "plunderDropShare");
    if (scripts\mp\gametypes\br_pickups::function_e351a4b1c26ec991("life_insurance")) {
        insurance = getdvarfloat(@"hash_8c811d887e1f3fa0", 10);
        save += insurance;
    }
    if (isdefined(self.var_c6ae3b455bfb5ac6)) {
        newtax = tax * self.var_c6ae3b455bfb5ac6;
        newdrop = drop * self.var_c6ae3b455bfb5ac6;
        save += drop - newdrop + tax - newtax;
        drop = newdrop;
        tax = newtax;
    }
    totalshares = save + tax + drop;
    saverate = save / totalshares;
    taxrate = tax / totalshares;
    droprate = drop / totalshares;
    if (isdefined(self.plundercount) && self.plundercount > 0) {
        var_258681915091f653 = self.plundercount * var_2927ed03b21bb4fd;
    } else {
        var_258681915091f653 = 0;
    }
    if (isdefined(level.gulag) && scripts\mp\gametypes\br_public::isplayeringulag()) {
        var_6aee9c9054f09ed5 = int(var_258681915091f653);
        var_b64f283113c99581 = 0;
    } else {
        var_6aee9c9054f09ed5 = int(min(var_258681915091f653, max(2, int(var_258681915091f653 * saverate))) + 0.5);
        var_b64f283113c99581 = int(max(level.minplunderdropondeath, int(var_258681915091f653 * droprate)));
    }
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "resurgence_mgl" || scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "champion") {
        lowerbound = getmatchrulesdata("brData", "plunderResurgenceLowerBound");
        if (var_6aee9c9054f09ed5 < lowerbound) {
            var_6aee9c9054f09ed5 = lowerbound;
        }
    }
    dropinfo = spawnstruct();
    dropinfo.var_6aee9c9054f09ed5 = var_6aee9c9054f09ed5;
    dropinfo.var_b64f283113c99581 = var_b64f283113c99581;
    return dropinfo;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b19
// Size: 0x22a
function takeplunderpickup(pickupent) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    amount = 1;
    if (isdefined(pickupent.count)) {
        amount = pickupent.count;
    }
    if (array_contains(level.br_plunder.names, pickupent.scriptablename)) {
        var_7d329a9bed628571 = isdefined(pickupent.instance) && istrue(pickupent.instance.var_6216e086379def7d);
        drop_team = isdefined(pickupent.instance) ? pickupent.instance.drop_team : undefined;
        data = {#drop_team:drop_team, #var_7d329a9bed628571:var_7d329a9bed628571};
        playerplunderpickup(amount, data, undefined, 1);
        level.br_plunder.plunder_items_picked_up += 1;
        level.br_plunder.plunder_value_picked_up += amount;
        scripts\mp\gametypes\br_plunder::modify_plunder_itemsinworld(pickupent.scriptablename, -1);
        type = "loot";
        if (isdefined(pickupent.instance) && isdefined(pickupent.instance.lootsource)) {
            type = pickupent.instance.lootsource;
        }
        scripts\mp\gametypes\br_analytics::trackcashevent(self, type, amount);
        if (var_7d329a9bed628571) {
            return;
        }
        function_5a2284274d70f7d(0, amount);
    } else {
        scripts\mp\gametypes\br_pickups::trypickupitem(pickupent.scriptablename, amount);
    }
    params = {#amount:amount, #pickupent:pickupent};
    scripts\common\callbacks::callback("plunder_pickup", params);
    level notify("collect_cash_" + self.team, self, pickupent.count);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4b
// Size: 0x45
function function_5efeff555d3c3ab4(itemname) {
    switch (itemname) {
    case #"hash_499bd626715353e3": 
        return 0;
    case #"hash_4ce6dd1c9ebdc3ec": 
        return 1;
    }
    scripts\mp\utility\script::demoforcesre("Persistent item \"" + itemname + "\" does not have a corresponding omnvar bit.");
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d98
// Size: 0x7e
function initplayerplunderevents() {
    omnvars = [];
    omnvars[1] = "ui_cash_pickedup";
    omnvars[2] = "ui_cash_pickedup";
    level.playerplundereventomnvars = omnvars;
    callbacks = [];
    callbacks[1] = &playerplunderpickupcallback;
    callbacks[2] = &playerplunderdepositcallback;
    callbacks[3] = &playerplunderbankcallback;
    callbacks[4] = &playerplunderlosecallback;
    callbacks[5] = &playerplunderbankdepositcallback;
    callbacks[6] = &playerplunderlosedepositcallback;
    level.playerplundereventcallbacks = callbacks;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1e
// Size: 0x71
function playerplunderpickup(amount, data, wasscoreevent, var_cc1314400858994c) {
    data = playerplunderevent(amount, 1, undefined, data, wasscoreevent);
    if (!istrue(var_cc1314400858994c) && isdefined(data) && isdefined(data.plunderdelta) && data.plunderdelta > 0) {
        scripts\cp_mp\challenges::function_563606223ef09517(self, data.plunderdelta);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2e97
// Size: 0x26
function playerplunderdeposit(amount, entity, data) {
    return playerplunderevent(amount, 2, entity, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec6
// Size: 0x26
function playerplunderbank(amount, entity, data) {
    return playerplunderevent(amount, 3, entity, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef5
// Size: 0x1e
function playerplunderlose(amount, data) {
    return playerplunderevent(amount, 4, undefined, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1c
// Size: 0x26
function playerplunderbankdeposit(amount, entity, data) {
    return playerplunderevent(amount, 5, entity, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4b
// Size: 0x26
function playerplunderlosedeposit(amount, entity, data) {
    return playerplunderevent(amount, 6, entity, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7a
// Size: 0xbb
function playerplunderkioskpurchase(amount, data) {
    resultdata = playerplunderevent(amount, 4, undefined, data);
    if (isdefined(resultdata)) {
        perskey = "highestPurchaseCost";
        if (!isdefined(self.pers[perskey]) || self.pers[perskey] < amount) {
            self.pers[perskey] = amount;
        }
    }
    if (scripts\mp\gametypes\br_pickups::function_e351a4b1c26ec991("credit_card")) {
        var_71620739ffd8161 = amount * getdvarfloat(@"hash_81e74d71f032f681", 0.1);
        playerplunderpickup(int(var_71620739ffd8161));
        function_5a2284274d70f7d(0, var_71620739ffd8161);
    }
    function_5a2284274d70f7d(4, amount);
    return resultdata;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303e
// Size: 0x1e
function playerplunderdrop(amount, data) {
    return playerplunderevent(amount, 4, undefined, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3065
// Size: 0x1e
function function_2334bcc55c8a6242(amount, data) {
    return playerplunderevent(amount, 1, undefined, data);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308c
// Size: 0x522
function playerplunderevent(amount, type, entity, data, wasscoreevent) {
    if (!istrue(level.br_plunder_enabled) || !isdefined(self.plundercount)) {
        return;
    }
    if (istrue(wasscoreevent) && amount <= 0) {
        return;
    }
    /#
        if (level.gameended && amount == 0) {
            return;
        }
    #/
    assertex(isdefined(level.playerplundereventomnvars), "playerPlunderEvent() was called before initPlayerPlunderEvents().");
    assertex(amount > 0, "playerPlunderEvent amount must be a positive value.  Example: player playerPlunderEvent( 500, PLUNDER_EVENT_TYPE_LOSE ).");
    /#
        validtype = validateplundereventtype(type);
        if (!validtype) {
            assertmsg("<dev string:x1c>");
        }
    #/
    if (type == 2 || type == 3 || type == 4) {
        amount = int(min(self.plundercount, amount));
    }
    if (type == 1 && isdefined(self.var_bc440201cf10cbd4) && isdefined(data) && !istrue(data.var_7d329a9bed628571)) {
        var_3b039a52d157112 = isdefined(data.drop_team) && self.team == data.drop_team;
        if (!var_3b039a52d157112) {
            amount = int(amount * max(1, self.var_bc440201cf10cbd4));
        }
    }
    if (!isdefined(self.plundereventtime)) {
        self.plundereventtime = [];
    }
    if (!isdefined(self.plundereventtotal)) {
        self.plundereventtotal = [];
    }
    if (!isdefined(self.lastplundereventtype)) {
        self.lastplundereventtype = 0;
    }
    var_26641d000f48954a = ter_op(type == 5, 3, type);
    omnvar = level.playerplundereventomnvars[var_26641d000f48954a];
    plundereventtotal = self.plundereventtotal[type];
    plundereventtime = self.plundereventtime[type];
    if (!isdefined(plundereventtime) || gettime() - plundereventtime > 2000) {
        plundereventtotal = 0;
    }
    plundereventtotal += amount;
    if (isplayer(self) && isdefined(omnvar)) {
        var_5c9ddcf56d36f133 = int(min(plundereventtotal, self.plundercount + amount));
        self setclientomnvar(omnvar, var_5c9ddcf56d36f133);
    }
    self.lastplundereventtype = type;
    self.plundereventtime[type] = gettime();
    self.plundereventtotal[type] = plundereventtotal;
    var_8cd4523b06660d98 = level.playerplundereventcallbacks[type];
    if (isdefined(var_8cd4523b06660d98)) {
        data = self [[ var_8cd4523b06660d98 ]](amount, entity, data);
    }
    if (isdefined(data)) {
        if (isdefined(data.player)) {
            if (isdefined(data.playersplash) && data.playersplash != "none" && !data.player scripts\mp\gametypes\br_public::isplayeringulag()) {
                if (data.playersplash != "br_plunder_first_pickup" || !istrue(data.player.haspickedupplunderyet)) {
                    if (!scripts\cp_mp\utility\game_utility::function_9cdaadfddeda4d7a()) {
                        data.player thread scripts\mp\hud_message::showsplash(data.playersplash, undefined, undefined, undefined, undefined, data.var_d07ee9ee6561c7b6);
                    }
                    if (data.playersplash == "br_plunder_first_pickup") {
                        data.player.haspickedupplunderyet = 1;
                    }
                }
            }
            if (isdefined(data.playerscoreeventref) && (!isdefined(data.playerscoreeventvalue) || data.playerscoreeventvalue > 0)) {
                data.player thread scripts\mp\utility\points::doScoreEvent(data.playerscoreeventref, undefined, data.playerscoreeventvalue);
            }
        }
        if (istrue(data.playanimation)) {
            if (type == 3) {
                thread playerplaybankanim();
            } else if (type == 2) {
                thread playerplaydepositanim();
            }
        }
        if (isdefined(data.amount)) {
            amount = data.amount;
        }
        if (istrue(data.playplundersound)) {
            var_644a1ba14dc91834 = ter_op(isdefined(data.plundersoundamount), data.plundersoundamount, amount);
            playplundersoundbyamount(self, var_644a1ba14dc91834);
        }
    }
    switch (type) {
    case 2:
    case 3:
    case 4: 
        amount *= -1;
        break;
    case 5:
    case 6: 
        amount = 0;
        break;
    case 1: 
        break;
    }
    if (isdefined(amount)) {
        data.plunderdelta = amount;
        thread playersetplundercount(self.plundercount + amount, data);
    }
    packextrascore0();
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b7
// Size: 0x98
function function_5a2284274d70f7d(trackingtype, amount) {
    if (getsubgametype() != "plunder") {
        return;
    }
    if (!isdefined(self.var_db548fc480c33eac)) {
        self.var_db548fc480c33eac = [];
        self.var_db548fc480c33eac[0] = 0;
        self.var_db548fc480c33eac[1] = 0;
        self.var_db548fc480c33eac[2] = 0;
        self.var_db548fc480c33eac[3] = 0;
        self.var_db548fc480c33eac[4] = 0;
    }
    self.var_db548fc480c33eac[trackingtype] = self.var_db548fc480c33eac[trackingtype] + amount;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3657
// Size: 0xfd
function packextrascore0(data) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    if (getsubgametype() == "kingslayer" || getsubgametype() == "resurgence" || getsubgametype() == "resurgence_mgl" || getsubgametype() == "zonecontrol") {
        return;
    }
    packedvalue = 0;
    cashvalue = 0;
    if (isdefined(self.plundercount)) {
        cashvalue += self.plundercount;
    }
    if (isdefined(self.plunderbanked)) {
        cashvalue += self.plunderbanked;
    }
    cashvalue = int(cashvalue / 10);
    if (cashvalue > 4095) {
        cashvalue = 4095;
    }
    packedvalue = cashvalue;
    missionvalue = 0;
    if (isdefined(self.brmissionscompleted)) {
        missionvalue += self.brmissionscompleted;
    }
    if (missionvalue > 15) {
        missionvalue = 15;
    }
    packedvalue += missionvalue << 12;
    scripts\mp\utility\stats::setextrascore0(packedvalue);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x375c
// Size: 0x74
function validateplundereventtype(type) {
    if (!isdefined(type)) {
        return 0;
    }
    switch (type) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6: 
        return 1;
    default: 
        return 0;
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d8
// Size: 0x50
function playerplunderpickupcallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    if (!istrue(self.haspickedupplunderyet)) {
        data.playersplash = "br_plunder_first_pickup";
        thread scripts\mp\gametypes\br_armory_kiosk::showdiscountsplash();
    }
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3831
// Size: 0x293
function playerplunderdepositcallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    if (!isdefined(data.playplundersound)) {
        data.playplundersound = 1;
        data.plundersoundamount = undefined;
    }
    if (!isdefined(data.playanimation)) {
        data.playanimation = 1;
    }
    if (isdefined(entity)) {
        var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
        if (isdefined(var_464eb48901113eb0.capacity) && var_464eb48901113eb0.capacity > 0) {
            overflow = entity.plundertotal + amount - var_464eb48901113eb0.capacity;
            if (overflow >= 0) {
                amount -= overflow;
                if (!istrue(entity.plunderatcapacity)) {
                    plunder_repositoryatcapacity(entity);
                }
            }
        }
        append = 1;
        foreach (entry in entity.plunder) {
            player = entry.player;
            if (isdefined(player) && player == self) {
                entry.plundercount += amount;
                append = 0;
                break;
            }
        }
        if (append) {
            entry = spawnstruct();
            entry.player = self;
            entry.team = self.team;
            entry.plundercount = amount;
            entity.plunder[entity.plunder.size] = entry;
        }
    }
    data.amount = amount;
    entity.plundertotal += amount;
    if (!isdefined(level.teamdata[self.team]["plunderInDeposit"])) {
        level.teamdata[self.team]["plunderInDeposit"] = int(amount);
    } else {
        level.teamdata[self.team]["plunderInDeposit"] = level.teamdata[self.team]["plunderInDeposit"] + int(amount);
    }
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3acd
// Size: 0x222
function playerplunderbankcallback(amount, entity, data) {
    assertex(isdefined(self.plundercount) && amount <= self.plundercount, "Cannot bank more plunder than the player has.");
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    if (!isdefined(data.playersplash)) {
        data.playersplash = "br_plunder_banked";
    }
    if (getsubgametype() == "plunder") {
        data.var_d07ee9ee6561c7b6 = "splash_list_br_plunder_iw9_mp";
    }
    if (!isdefined(data.playerscoreeventref)) {
        brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
        data.playerscoreeventref = ter_op(brgametype == "plunder" || brgametype == "risk", #"hash_70c9f312b8e0bf01", #"plunder_cash");
    }
    if (!isdefined(data.playerscoreeventvalue)) {
        data.playerscoreeventvalue = int(scripts\mp\rank::getscoreinfovalue(data.playerscoreeventref) * amount / 10);
    }
    if (!isdefined(data.playplundersound)) {
        data.playplundersound = 1;
        data.plundersoundamount = undefined;
    }
    if (!isdefined(data.playanimation)) {
        data.playanimation = 1;
    }
    self.plunderbanked += amount;
    if (self.plunderbanked > level.br_plunder.plunderlimit) {
        self.plunderbanked = level.br_plunder.plunderlimit;
    }
    if (!isdefined(level.teamdata[self.team]["plunderBanked"])) {
        level.teamdata[self.team]["plunderBanked"] = amount;
    } else {
        level.teamdata[self.team]["plunderBanked"] = level.teamdata[self.team]["plunderBanked"] + amount;
    }
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf8
// Size: 0x2a
function playerplunderlosecallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2b
// Size: 0x291
function playerplunderbankdepositcallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    if (!isdefined(data.plundersoundamount)) {
        data.plundersoundamount = 0;
    }
    data.setplunderifunchanged = 1;
    team = self.team;
    if (isdefined(entity) && isdefined(entity.plunder)) {
        foreach (id, entry in entity.plunder) {
            if (isdefined(entry.player) && entry.player == self) {
                team = entry.team;
                if (!isdefined(amount)) {
                    amount = entry.plundercount;
                } else {
                    amount = min(amount, entry.plundercount);
                }
                entry.plundercount -= amount;
                if (entry.plundercount == 0) {
                    entity.plunder[id] = undefined;
                }
                self.plunderbanked += amount;
                if (self.plunderbanked > level.br_plunder.plunderlimit) {
                    self.plunderbanked = level.br_plunder.plunderlimit;
                }
                break;
            }
        }
        if (!isdefined(data.playerscoreeventref)) {
            brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
            data.playerscoreeventref = ter_op(brgametype == "plunder" || brgametype == "risk", #"hash_70c9f312b8e0bf01", #"plunder_cash");
        }
        if (!isdefined(data.playerscoreeventvalue)) {
            data.playerscoreeventvalue = int(scripts\mp\rank::getscoreinfovalue(data.playerscoreeventref) * amount / 10);
        }
    }
    amount = int(amount);
    level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
    level.teamdata[team]["plunderBanked"] = level.teamdata[team]["plunderBanked"] + amount;
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc5
// Size: 0x170
function playerplunderlosedepositcallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    data.setplunderifunchanged = 1;
    team = self.team;
    if (isdefined(entity) && isdefined(entity.plunder)) {
        foreach (id, entry in entity.plunder) {
            if (isdefined(entry.player) && entry.player == self) {
                team = entry.team;
                if (!isdefined(amount)) {
                    amount = entry.plundercount;
                } else {
                    amount = min(amount, entry.plundercount);
                }
                entry.plundercount -= amount;
                if (entry.plundercount == 0) {
                    entity.plunder[id] = undefined;
                }
                break;
            }
        }
    }
    amount = int(amount);
    level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413e
// Size: 0x3f9
function entityplunderbankalldeposited(data) {
    if (!isdefined(self.plunder)) {
        return;
    }
    if (!isdefined(data)) {
        data = createplayerplundereventdata();
    }
    data.amounttotal = 0;
    data.teams = [];
    data.numdepositers = 0;
    foreach (id, entry in self.plunder) {
        if (isdefined(entry.player) || entry.plundercount <= 0) {
            continue;
        }
        team = entry.team;
        amount = entry.plundercount;
        assertex(isdefined(entry.team), "Plunder deposited without a player or a team.");
        level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
        level.teamdata[team]["plunderBanked"] = level.teamdata[team]["plunderBanked"] + amount;
        data.amounttotal += amount;
        data.teams[data.teams.size] = team;
        self.plunder[id] = undefined;
    }
    foreach (entry in self.plunder) {
        if (entry.plundercount <= 0) {
            continue;
        }
        player = entry.player;
        team = entry.team;
        amount = entry.plundercount;
        _data = undefined;
        if (isdefined(data)) {
            _data = copyplayerplundereventdata(data, player, team);
        }
        _data.dontcallpostplunder = 1;
        _data = player playerplunderbankdeposit(amount, self, _data);
        if (isdefined(_data) && isdefined(_data.amount)) {
            amount = _data.amount;
        }
        data.amounttotal += amount;
        data.teams[data.teams.size] = team;
        data.numdepositers++;
    }
    method = "fulton";
    if (isdefined(self.classname) && self.classname == "script_vehicle") {
        method = "little_bird";
    }
    data.teams = array_remove_duplicates(data.teams);
    containsenemyplunder = 0;
    if (data.teams.size > 1) {
        containsenemyplunder = 1;
    } else if (data.teams.size == 1 && data.teams[0] != self.team) {
        containsenemyplunder = 1;
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(self.plunderrepositoryref, undefined, 1);
    if (isdefined(var_464eb48901113eb0) && isdefined(var_464eb48901113eb0.extractionmethod)) {
        scripts\mp\gametypes\br_analytics::branalytics_plunder_extraction_success(data.numdepositers, data.amounttotal, var_464eb48901113eb0.extractionmethod, containsenemyplunder, self.origin);
    }
    if (!isdefined(data) || !istrue(data.dontcallpostplunder)) {
        thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("postPlunder", data);
    }
    self.plunder = [];
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4540
// Size: 0x2e9
function entityplunderlosealldeposited(dropplunder, data) {
    if (!isdefined(self.plunder)) {
        return;
    }
    if (!isdefined(data)) {
        data = createplayerplundereventdata();
    }
    data.amounttotal = 0;
    data.teams = [];
    var_96c4a8c24e604cad = 0;
    foreach (id, entry in self.plunder) {
        if (isdefined(entry.player) || entry.plundercount <= 0) {
            continue;
        }
        team = entry.team;
        amount = entry.plundercount;
        assertex(isdefined(entry.team), "Plunder deposited without a player or a team.");
        level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
        data.amounttotal += amount;
        data.teams[data.teams.size] = team;
        self.plunder[id] = undefined;
    }
    foreach (entry in self.plunder) {
        if (entry.plundercount <= 0) {
            continue;
        }
        player = entry.player;
        team = entry.team;
        amount = entry.plundercount;
        _data = undefined;
        if (isdefined(data)) {
            _data = copyplayerplundereventdata(data, player, team);
        }
        _data.dontcallpostplunder = 1;
        player playerplunderlosedeposit(amount, self, _data);
        if (isdefined(_data) && isdefined(_data.amount)) {
            amount = _data.amount;
        }
        data.amounttotal += amount;
        data.teams[data.teams.size] = team;
        var_96c4a8c24e604cad += amount;
    }
    if (!isdefined(data) || !istrue(data.dontcallpostplunder)) {
        thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("postPlunder", data);
    }
    self.plunder = [];
    if (istrue(dropplunder)) {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        dropplunderbyrarity(data.amounttotal, dropstruct);
    }
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4832
// Size: 0x8e
function createplayerplundereventdata(player, team) {
    data = spawnstruct();
    data.player = undefined;
    if (isdefined(player)) {
        data.player = player;
    }
    data.playersplash = undefined;
    data.playerscoreeventref = undefined;
    data.playerscoreeventvalue = undefined;
    data.setplunderifunchanged = undefined;
    data.playplundersound = undefined;
    data.plundersoundamount = undefined;
    data.playanimation = undefined;
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c9
// Size: 0x17f
function copyplayerplundereventdata(var_f58ee9ff02b66e9d, player, team) {
    data = createplayerplundereventdata();
    if (isdefined(var_f58ee9ff02b66e9d.player)) {
        data.player = var_f58ee9ff02b66e9d.player;
        player = var_f58ee9ff02b66e9d.player;
    } else if (isdefined(player)) {
        data.player = player;
    }
    if (isdefined(var_f58ee9ff02b66e9d.playersplash)) {
        data.playersplash = var_f58ee9ff02b66e9d.playersplash;
    }
    if (isdefined(var_f58ee9ff02b66e9d.playerscoreeventref)) {
        data.playerscoreeventref = var_f58ee9ff02b66e9d.playerscoreeventref;
    }
    if (isdefined(var_f58ee9ff02b66e9d.playerscoreeventvalue)) {
        data.playerscoreeventvalue = var_f58ee9ff02b66e9d.playerscoreeventvalue;
    }
    if (isdefined(var_f58ee9ff02b66e9d.setplunderifunchanged)) {
        data.setplunderifunchanged = var_f58ee9ff02b66e9d.setplunderifunchanged;
    }
    if (isdefined(var_f58ee9ff02b66e9d.playplundersound)) {
        data.playplundersound = var_f58ee9ff02b66e9d.playplundersound;
    }
    if (isdefined(var_f58ee9ff02b66e9d.plundersoundamount)) {
        data.plundersoundamount = var_f58ee9ff02b66e9d.plundersoundamount;
    }
    if (isdefined(var_f58ee9ff02b66e9d.playanimation)) {
        data.playanimation = var_f58ee9ff02b66e9d.playanimation;
    }
    return data;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a51
// Size: 0x263
function playersetplundercount(plundercount, data) {
    if (!isdefined(self.plundercount)) {
        self.plundercount = 0;
    }
    plunderdelta = plundercount - self.plundercount;
    if ((!isdefined(data) || !istrue(data.setplunderifunchanged)) && plunderdelta == 0) {
        return;
    }
    assert(isint(plundercount));
    self.plundercount = plundercount;
    if (isdefined(level.br_plunder) && self.plundercount > level.br_plunder.plunderlimit) {
        scripts\mp\hud_message::showerrormessage("MP_BR_INGAME/PLUNDER_HELD_LIMIT_REACHED");
        self.plundercount = level.br_plunder.plunderlimit;
    }
    if (isdefined(self.petwatch)) {
        scripts\cp_mp\pet_watch::onplayergetsplunder();
    }
    if (isdefined(level.secondaryvictory) && isdefined(level.secondaryvictory.var_f5eb9b1ad1613bca)) {
        self [[ level.secondaryvictory.var_f5eb9b1ad1613bca ]]();
    }
    amount = self.plundercount;
    playersetplunderomnvar(amount);
    if (plundercount > 0) {
        if (istrue(level.plunderusedisabledwhenempty) && plunderdelta != 0) {
            plunder_allowallrepositoryuseforplayer(self, 1, 1);
        }
        enablealldepotsforplayer(self);
        if (inplunderlivelobby() && plundercount >= 10) {
            thread playerdelayautobankplunder();
        }
    } else {
        if (istrue(level.plunderusedisabledwhenempty) && plunderdelta != 0) {
            plunder_allowallrepositoryuseforplayer(self, 0, 1);
        }
        disablealldepotsforplayer(self);
    }
    if (isdefined(data) && isdefined(data.plunderdelta)) {
        plunderdelta = data.plunderdelta;
    }
    if (plunderdelta != 0) {
        if (!isdefined(level.teamdata[self.team]["plunderTeamTotal"])) {
            level.teamdata[self.team]["plunderTeamTotal"] = 0;
        }
        level.teamdata[self.team]["plunderTeamTotal"] = level.teamdata[self.team]["plunderTeamTotal"] + plunderdelta;
    }
    if (!isdefined(data) || !istrue(data.dontcallpostplunder)) {
        thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("postPlunder", data);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cbc
// Size: 0x2c
function playersetplunderomnvar(value) {
    var_ff986c1c69cc1cd6 = value / 100;
    scripts\mp\codcasterclientmatchdata::function_f8b808cd6473e6cc(19, var_ff986c1c69cc1cd6);
    namespace_14f37777effc564d::playersetplunderomnvar(value);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf0
// Size: 0x7e
function getpackeddata(value, var_7009da06a8a620cb, bitoffset, bitwidth) {
    mask = int(pow(2, bitwidth)) - 1;
    var_a463992091f1d483 = (value & mask) << bitoffset;
    var_f8f977081d3da8b4 = ~(mask << bitoffset);
    cleanedbase = var_7009da06a8a620cb & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = cleanedbase + var_a463992091f1d483;
    return var_82a90e56e416fa55;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d77
// Size: 0x17f
function playergetplunderomnvarbitpackinginfo() {
    bitoffset = 0;
    bitwidth = 0;
    var_8e90fa6d5789ad63 = "";
    switch (self.var_3f78c6a0862f9e25) {
    case 1: 
        var_c00a316249963882 = [0, 17, "ui_br_plunder_count"];
        var_8e90fa6d5789ad63 = var_c00a316249963882[2];
        bitwidth = var_c00a316249963882[1];
        bitoffset = var_c00a316249963882[0];
        break;
    case 2: 
        var_c00a346249963f1b = [17, 17, "ui_br_plunder_count"];
        var_8e90fa6d5789ad63 = var_c00a346249963f1b[2];
        bitwidth = var_c00a346249963f1b[1];
        bitoffset = var_c00a346249963f1b[0];
        break;
    case 3: 
        var_c00a336249963ce8 = [0, 17, "ui_br_plunder_count2"];
        var_8e90fa6d5789ad63 = var_c00a336249963ce8[2];
        bitwidth = var_c00a336249963ce8[1];
        bitoffset = var_c00a336249963ce8[0];
        break;
    case 4: 
        var_bffcba6249871e48 = [17, 17, "ui_br_plunder_count2"];
        var_8e90fa6d5789ad63 = var_bffcba6249871e48[2];
        bitwidth = var_bffcba6249871e48[1];
        bitoffset = var_bffcba6249871e48[0];
        break;
    default: 
        assertmsg("Invalid squad index '" + self.var_3f78c6a0862f9e25 + "' used for packing into plunder omnvar!");
        break;
    }
    return [bitoffset, bitwidth, var_8e90fa6d5789ad63];
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eff
// Size: 0x115
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_52d59c928eb97c81 = dangercircleradius + thresholdradius;
    var_d16b5e09ee5dde91 = var_52d59c928eb97c81 * var_52d59c928eb97c81;
    for (i = 0; i < level.br_depots.size; i++) {
        depot = level.br_depots[i];
        if (isdefined(depot) && !istrue(depot.disabled) && distance2dsquared(var_819edacdacb810e4, depot.origin) > var_d16b5e09ee5dde91) {
            depot function_28f5f133ca1f9d8();
        }
    }
    for (i = 0; i < level.br_plunder_sites.size; i++) {
        site = level.br_plunder_sites[i];
        if (isdefined(site) && !istrue(site.disabled) && distance2dsquared(var_819edacdacb810e4, site.origin) > var_d16b5e09ee5dde91) {
            site function_8682a8796fd4b35f();
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501c
// Size: 0xe8
function function_1a1709943670772a() {
    if (!istrue(level.br_plunder_enabled) || !istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    for (i = 0; i < level.br_depots.size; i++) {
        depot = level.br_depots[i];
        if (isdefined(depot) && !istrue(depot.disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(depot.origin)) {
            depot function_28f5f133ca1f9d8();
        }
    }
    for (i = 0; i < level.br_plunder_sites.size; i++) {
        site = level.br_plunder_sites[i];
        if (isdefined(site) && !istrue(site.disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(site.origin)) {
            site function_8682a8796fd4b35f();
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510c
// Size: 0x24
function function_28f5f133ca1f9d8() {
    depot = self;
    depot.disabled = 1;
    depot depotmakeunsabletoall();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5138
// Size: 0x39
function function_8682a8796fd4b35f() {
    site = self;
    site.disabled = 1;
    site setscriptablepartstate(site.type, site.disabledstate);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5179
// Size: 0x2f
function playerplaydepositanim() {
    self endon("death_or_disconnect");
    if (!scripts\mp\gametypes\br_public::playercanplaynotcriticalgesture() || self isgestureplaying()) {
        return;
    }
    scripts\mp\gametypes\br_public::playerplaygestureweaponanim("iw8_ges_plyr_cash_handoff", 1.84);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51b0
// Size: 0x86
function cratedropplunder() {
    if (!isdefined(self.plunder)) {
        return;
    }
    amount = 0;
    for (i = 0; i < self.plunder.size; i++) {
        amount += self.plunder[i].plundercount;
    }
    self.angles = (0, 0, 0);
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropplunderbyrarity(amount, dropstruct);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x523e
// Size: 0x109
function dropplundersounds(droporigin, numdrops) {
    if (numdrops <= 0) {
        return;
    }
    sndorigin = droporigin + (0, 0, 24);
    sndalias = "";
    wait 0.5;
    switch (numdrops) {
    case 0: 
        break;
    case 1: 
        sndalias = "br_drop_plunder_01";
        break;
    case 2: 
        sndalias = "br_drop_plunder_02";
        break;
    case 3: 
        sndalias = "br_drop_plunder_03";
        break;
    case 4: 
        sndalias = "br_drop_plunder_04";
        break;
    case 5: 
        sndalias = "br_drop_plunder_05";
        break;
    case 6:
    default: 
        sndalias = "br_drop_plunder_06";
        break;
    }
    assert(soundexists(sndalias));
    playsoundatpos(sndorigin, sndalias);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x534f
// Size: 0x26e
function dropplunderbyrarity(amount, dropstruct, numitems) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    pickupents = [];
    numspawns = [];
    totalcount = 0;
    maxcount = 6;
    if (isdefined(numitems)) {
        maxcount = numitems;
    }
    for (i = level.br_plunder.quantity.size - 1; i >= 0; i--) {
        numspawns[i] = int(amount / level.br_plunder.quantity[i]);
        numspawns[i] = int(clamp(numspawns[i], 0, maxcount - totalcount));
        totalcount += numspawns[i];
        if (amount <= 0 || totalcount >= maxcount) {
            break;
        }
        amount -= numspawns[i] * level.br_plunder.quantity[i];
    }
    for (var_f90d0e006a1f717b = level.br_plunder.quantity.size - 1; var_f90d0e006a1f717b >= 0; var_f90d0e006a1f717b--) {
        if (!isdefined(numspawns[var_f90d0e006a1f717b])) {
            continue;
        }
        for (itemindex = 0; itemindex < numspawns[var_f90d0e006a1f717b]; itemindex++) {
            dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(level.br_plunder.names[var_f90d0e006a1f717b], dropinfo, level.br_plunder.quantity[var_f90d0e006a1f717b], 1);
            scripts\mp\gametypes\br_plunder::modify_plunder_itemsinworld(level.br_plunder.names[var_f90d0e006a1f717b], 1);
            if (isdefined(pickupent)) {
                pickupents[pickupents.size] = pickupent;
                if (inplunderlivelobby()) {
                    level.br_plunder_ents[level.br_plunder_ents.size] = pickupent;
                }
            }
        }
    }
    level.br_plunder.plunder_items_dropped += totalcount;
    level.br_plunder.plunder_value_dropped += amount;
    level thread dropplundersounds(self.origin, pickupents.size);
    return pickupents;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55c6
// Size: 0x1d8
function dropcondensedplunder(amount, dropstruct, allowautopickup) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    pickupents = [];
    numspawns = [];
    var_8e0b722357754d9e = 0;
    for (i = level.br_plunder.names.size - 1; i >= 0; i--) {
        if (amount >= level.br_plunder.quantity[i]) {
            var_8e0b722357754d9e = i;
            break;
        }
    }
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
    autopickup = isalive(self) || istrue(allowautopickup) || getdvarint(@"hash_56a4511198080c62", 1);
    pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(level.br_plunder.names[var_8e0b722357754d9e], dropinfo, amount, 1, undefined, autopickup);
    scripts\mp\gametypes\br_plunder::modify_plunder_itemsinworld(level.br_plunder.names[var_8e0b722357754d9e], 1);
    if (isdefined(pickupent)) {
        pickupent.drop_team = dropstruct.var_13ac9eca292f815;
        pickupents[pickupents.size] = pickupent;
        if (inplunderlivelobby()) {
            level.br_plunder_ents[level.br_plunder_ents.size] = pickupent;
        }
        scripts\mp\gametypes\br_pickups::function_2f4e0022c686dbe6(pickupent);
    }
    level.br_plunder.plunder_items_dropped++;
    level.br_plunder.plunder_value_dropped += amount;
    level thread dropplundersounds(self.origin, pickupents.size);
    return pickupents;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a7
// Size: 0x4b
function isplunderextractionenabled() {
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("plunderSites")) {
        return false;
    }
    var_7d29e7f909d9b76c = getmatchrulesdata("brData", "plunderSites");
    return istrue(level.br_plunder_enabled) && level.br_plunder_sites.size != 0 && var_7d29e7f909d9b76c;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57fb
// Size: 0x5f
function initheliextractanims() {
    level.scr_anim["plunder_extract_heli"]["heli_in"] = mp_vehicles_always_loaded%iw8_br_plunder_heli_in;
    level.scr_anim["plunder_extract_heli"]["heli_loop"] = mp_vehicles_always_loaded%iw8_br_plunder_heli_loop;
    level.scr_anim["plunder_extract_heli"]["heli_out"] = mp_vehicles_always_loaded%iw8_br_plunder_heli_out;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5862
// Size: 0xce
function inithelipropanims() {
    level.scr_animtree["plunder_extract_heli"] = %script_model;
    level.scr_anim["plunder_extract_heli"]["rope_in"] = script_model%iw8_br_plunder_heli_rope_in;
    level.scr_anim["plunder_extract_heli"]["rope_loop"] = script_model%iw8_br_plunder_heli_rope_loop;
    level.scr_anim["plunder_extract_heli"]["rope_out"] = script_model%iw8_br_plunder_heli_rope_out;
    level.scr_anim["plunder_extract_heli"]["bag_in"] = script_model%iw8_br_plunder_heli_bag_in;
    level.scr_anim["plunder_extract_heli"]["bag_loop"] = script_model%iw8_br_plunder_heli_bag_loop;
    level.scr_anim["plunder_extract_heli"]["bag_out"] = script_model%iw8_br_plunder_heli_bag_out;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5938
// Size: 0x233
function inithelirepository() {
    var_d2f87019e8a38f04 = [];
    var_464eb48901113eb0 = plunder_getleveldataforrepository("plunderHelipad1", 1);
    var_464eb48901113eb0.scriptableusepart = "brloot_plunder_extraction_site_01";
    var_d2f87019e8a38f04[var_d2f87019e8a38f04.size] = var_464eb48901113eb0;
    var_464eb48901113eb0 = plunder_getleveldataforrepository("plunderHelipad2", 1);
    var_464eb48901113eb0.scriptableusepart = "brloot_plunder_extraction_site_02";
    var_d2f87019e8a38f04[var_d2f87019e8a38f04.size] = var_464eb48901113eb0;
    var_464eb48901113eb0 = plunder_getleveldataforrepository("extractHelipadPlunder", 1);
    var_464eb48901113eb0.scriptableusepart = "brloot_quest_extract_site_plunder";
    var_d2f87019e8a38f04[var_d2f87019e8a38f04.size] = var_464eb48901113eb0;
    var_464eb48901113eb0 = plunder_getleveldataforrepository("extractHelipadBR", 1);
    var_464eb48901113eb0.scriptableusepart = "brloot_quest_extract_site_br";
    var_d2f87019e8a38f04[var_d2f87019e8a38f04.size] = var_464eb48901113eb0;
    foreach (var_464eb48901113eb0 in var_d2f87019e8a38f04) {
        var_464eb48901113eb0.type = 1;
        var_464eb48901113eb0.usetime = 0;
        var_464eb48901113eb0.useeventtype = 3;
        var_464eb48901113eb0.useeventamount = getdvarint(@"hash_7fd9b532b02bcf1e", 20000);
        var_464eb48901113eb0.teamuseonly = 0;
        var_464eb48901113eb0.usefailcapacitymsg = "MP/CANNOT_DEPOSIT_CASH_HELI_FULL";
        var_464eb48901113eb0.usefailextractingmsg = "MP/CANNOT_DEPOSIT_CASH_HELI_LEAVING";
        var_464eb48901113eb0.scriptableusestate = "activedepositcurrent";
        var_464eb48901113eb0.scriptablenousestate = "visiblecurrent";
        var_464eb48901113eb0.extractcountdown = 0;
        var_464eb48901113eb0.extractsilentcountdown = getdvarint(@"hash_88ca7322cb6bc51a", 30);
        var_464eb48901113eb0.extractcountdownmsg = "MP/CASH_HELI_LEAVING_IN_N";
        var_464eb48901113eb0.capacity = 0;
        var_464eb48901113eb0.countdownendcallback = &helicountdownendcallback;
        var_464eb48901113eb0.extractcallback = &heliextractcallback;
        var_464eb48901113eb0.atcapacitycallback = &heliatcapacitycallback;
        var_464eb48901113eb0.extractionmethod = "little_bird";
    }
    /#
        setdevdvarifuninitialized(@"hash_7fd9b532b02bcf1e", 20000);
        setdevdvarifuninitialized(@"hash_88ca7322cb6bc51a", 30);
    #/
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b73
// Size: 0x1b4
function getplunderextractionsites() {
    sites = [];
    if (scripts\cp_mp\utility\game_utility::isdonetskmap()) {
        sites = getentitylessscriptablearray("extract_pad", "targetname");
        var_c3fc8aa938c22936 = getentitylessscriptablearray("extract_pad_boneyard", "targetname");
        if (var_c3fc8aa938c22936.size > 0) {
            sites = array_combine(sites, var_c3fc8aa938c22936);
        }
    } else {
        sites01 = getentitylessscriptablearray("plunder_extraction_01", "targetname");
        var_6f1b19a6b84472f9 = getentitylessscriptablearray("plunder_extraction_02", "targetname");
        sites = array_combine(sites01, var_6f1b19a6b84472f9);
    }
    if (sites.size > 0) {
        foreach (site in sites) {
            site.activestate = "active";
            site.activecurrstate = "activeCurrent";
            site.disabledstate = "visible";
            site.disabledcurrstate = "visible";
        }
        return sites;
    }
    sites = getentitylessscriptablearray("plunder_extraction", "targetname");
    foreach (site in sites) {
        site.activestate = "visible";
        site.activecurrstate = "visibleCurrent";
        site.disabledstate = "hidden";
    }
    return sites;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d2f
// Size: 0x41
function function_c383497e5f14e368(structname, sitestruct) {
    if (!isdefined(level.var_88e8c04e60a1092c)) {
        level.var_88e8c04e60a1092c = [];
    }
    level.var_88e8c04e60a1092c[level.var_88e8c04e60a1092c.size] = sitestruct;
    return sitestruct;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d79
// Size: 0x464
function setupplunderextractionsites() {
    level.br_plunder_sites = getplunderextractionsites();
    level.br_plunder_site_use_parts = [];
    level.br_plunder_site_use_parts[level.br_plunder_site_use_parts.size] = "brloot_plunder_extraction_site";
    level.br_plunder_site_use_parts[level.br_plunder_site_use_parts.size] = "brloot_plunder_extraction_site_01";
    level.br_plunder_site_use_parts[level.br_plunder_site_use_parts.size] = "brloot_plunder_extraction_site_02";
    level.br_plunder_site_use_parts[level.br_plunder_site_use_parts.size] = "brloot_quest_extract_site_br";
    level.br_plunder_site_use_parts[level.br_plunder_site_use_parts.size] = "brloot_quest_extract_site_plunder";
    level.br_plunder_site_use_states = [];
    level.br_plunder_site_use_states[level.br_plunder_site_use_states.size] = "active";
    level.br_plunder_site_use_states[level.br_plunder_site_use_states.size] = "active2";
    level.br_plunder_site_use_states[level.br_plunder_site_use_states.size] = "activecurrent";
    level.br_plunder_site_use_states[level.br_plunder_site_use_states.size] = "visiblecurrent";
    if (isplunderextractionenabled() && getdvarint(@"hash_28df7f89e6eab57c", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        foreach (site in level.br_plunder_sites) {
            site setscriptablepartstate(site.type, "hidden");
        }
        namespace_7052decdced06e44::function_4f7660cfd85cd517("extraction_site", &function_ded34f2b3889fdab);
        namespace_7052decdced06e44::function_412f527ef0863f0e("extraction_site", &function_c383497e5f14e368);
    } else if (!isplunderextractionenabled()) {
        platforments = getentarray("plunder_extraction_visual", "targetname");
        foreach (ent in platforments) {
            ent delete();
        }
        foreach (site in level.br_plunder_sites) {
            site setscriptablepartstate(site.type, "hidden");
        }
        level.br_plunder_sites = [];
        return;
    }
    /#
        level thread function_21d60852fb677f98();
    #/
    scripts\mp\flags::gameflagwait("prematch_done");
    scripts\engine\scriptable::scriptable_addusedcallback(&plundersiteused);
    if (isdefined(level.matchstartextractsitedelay) && level.matchstartextractsitedelay > 0 && !istrue(level.usemilestonephases)) {
        wait level.matchstartextractsitedelay;
    } else if (istrue(level.usemilestonephases)) {
        scripts\mp\flags::gameflagwait("activate_cash_lzs");
    }
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
                player scripts\mp\hud_message::showsplash("bm_extract_heli_start", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
            }
        }
    }
    sites = level.br_plunder_sites;
    if (getdvarint(@"hash_28df7f89e6eab57c", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        sites = level.var_88e8c04e60a1092c;
        level.var_88e8c04e60a1092c = undefined;
    }
    foreach (site in sites) {
        scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), site.activecurrstate, site.activestate);
        site setscriptablepartstate(site.type, scriptablestate);
    }
}

/#

    // Namespace br_plunder / scripts\mp\gametypes\br_plunder
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x61e5
    // Size: 0x143
    function function_21d60852fb677f98() {
        level endon("<dev string:x4c>");
        while (true) {
            debugsites = getdvarint(@"hash_69a2288a8b47e1b5", 0);
            if (debugsites) {
                break;
            }
            waitframe();
        }
        scripts\engine\scriptable::scriptable_addusedcallback(&plundersiteused);
        foreach (player in level.players) {
            if (isdefined(player)) {
                player scripts\mp\hud_message::showsplash("<dev string:x57>");
            }
        }
        foreach (site in level.br_plunder_sites) {
            scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), site.activecurrstate, site.activestate);
            site setscriptablepartstate(site.type, scriptablestate);
        }
    }

#/

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6330
// Size: 0x11
function function_ded34f2b3889fdab(structname) {
    return getallextractspawninstances();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634a
// Size: 0x1e
function getallextractspawninstances() {
    if (!isplunderextractionenabled()) {
        return;
    }
    instances = getplunderextractionsites();
    return instances;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6371
// Size: 0x84
function setextractspawninstances(instances) {
    foreach (site in level.br_plunder_sites) {
        if (!array_contains(instances, site)) {
            site setscriptablepartstate(site.type, "hidden");
        }
    }
    level.br_plunder_sites = instances;
}

/#

    // Namespace br_plunder / scripts\mp\gametypes\br_plunder
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x63fd
    // Size: 0x15f
    function debugextractsite(site) {
        siteent = spawn("<dev string:x6d>", site.origin + (0, 0, 1000));
        modelname = "<dev string:x7a>";
        vehiclename = "<dev string:x99>";
        if (istrue(level.var_a83a4e71446bfef7)) {
            modelname = "<dev string:xaf>";
            vehiclename = "<dev string:xcc>";
        }
        siteent setmodel(modelname);
        locationx = site.origin[0];
        locationy = site.origin[1];
        var_dc8bb6300463cf1e = 800;
        groundheight = siteent tracegroundpoint(site.origin);
        trueheight = groundheight + var_dc8bb6300463cf1e;
        newpos = (locationx, locationy, trueheight);
        siteent.origin = newpos;
        while (true) {
            sphere(newpos, 20, (0, 1, 0), 0, 1);
            sphere((site.origin[0], site.origin[1], groundheight), 100, (0, 1, 1), 0, 1);
            waitframe();
        }
    }

#/

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6564
// Size: 0x146
function plundersiteused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(instance) || !isdefined(player)) {
        return;
    }
    if (!isdefined(level.br_plunder_site_use_parts) || !isdefined(level.br_plunder_site_use_states)) {
        return;
    }
    earlyout = 1;
    foreach (_part in level.br_plunder_site_use_parts) {
        if (_part != part) {
            continue;
        }
        earlyout = 0;
        break;
    }
    if (earlyout) {
        return;
    }
    earlyout = 1;
    foreach (_state in level.br_plunder_site_use_states) {
        if (_state != state) {
            continue;
        }
        earlyout = 0;
        break;
    }
    if (earlyout) {
        return;
    }
    thread plundersiteusedinternal(instance, part, state, player);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b2
// Size: 0x346
function plundersiteusedinternal(instance, part, state, player) {
    if (isdefined(instance.disabled)) {
        return;
    }
    if (isdefined(instance.heli)) {
        player playerdenyextraction(undefined, %KILLSTREAKS/AIR_SPACE_TOO_CROWDED);
        return;
    }
    scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), "inuseCurrent", "inuse");
    instance setscriptablepartstate(instance.type, scriptablestate);
    teamindex = scripts\engine\utility::array_find(level.allteamnamelist, player.team);
    instance.team = teamindex;
    instance function_fca5bdbe24070d20(instance.type, teamindex);
    groundorg = getgroundposition(instance.origin, 1) + (0, 0, ter_op(scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587(), 2, -9));
    heli = player playerspawnextractchopper(groundorg, instance);
    if (isdefined(heli)) {
        heli.site = instance;
        instance.heli = heli;
        instance.team = player.team;
        thread createsmokesignalfx(groundorg);
        player playerthrowsmokesignal();
        if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("plunder_extract_requested", player.team, 1);
        }
        level thread scripts\mp\gametypes\br::teamsplashbr("br_extract_heli_incoming", player, player.team, undefined, "splash_list_br_plunder_iw9_mp");
        heli thread heligotoplunderrepository(instance);
    } else {
        playerdenyextraction(undefined, %KILLSTREAKS/AIR_SPACE_TOO_CROWDED);
        scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), instance.activecurrstate, instance.activestate);
        instance setscriptablepartstate(instance.type, scriptablestate);
        return;
    }
    if (istrue(level.plunderextractalertnearby)) {
        nearplayers = utility::playersincylinder(instance.origin, 15000);
        skipplayers = scripts\mp\utility\teams::getteamdata(player.team, "players");
        foreach (playerent in nearplayers) {
            if (!array_contains(skipplayers, playerent)) {
                playerent thread scripts\mp\hud_message::showsplash("br_extract_heli_incoming_them", undefined, player, undefined, undefined, "splash_list_br_plunder_iw9_mp");
            }
        }
    }
    if (istrue(level.moveplunderextractionsitesonuse)) {
        instance.disabled = 1;
        scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), instance.disabledcurrstate, instance.disabledstate);
        instance setscriptablepartstate(instance.type, scriptablestate);
        level thread findnewplunderextractsite(instance);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a00
// Size: 0x75
function _getsingleplunderextractlocations(var_532388c61e12b9df, maxlocations) {
    if (var_532388c61e12b9df.size == 0 || maxlocations == 0) {
        return;
    }
    site = undefined;
    if (var_532388c61e12b9df.size > 0) {
        var_532388c61e12b9df = scripts\engine\utility::array_randomize(var_532388c61e12b9df);
        for (i = 0; i < var_532388c61e12b9df.size; i++) {
            if (!array_contains(level.br_plunder_sites, var_532388c61e12b9df[i])) {
                site = var_532388c61e12b9df[i];
                break;
            }
        }
    }
    return site;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a7e
// Size: 0x158
function findnewplunderextractsite(oldsite) {
    newsite = _getsingleplunderextractlocations(scripts\mp\gametypes\br_plunder::getallextractspawninstances(), level.maxplunderextractions);
    newsite.disabled = undefined;
    newsite.helidisabled = undefined;
    scriptablestate = ter_op(level.showplunderextracticonsinworld && !level.shownonscriptableextracticons, newsite.activecurrstate, newsite.activestate);
    newsite setscriptablepartstate(newsite.type, scriptablestate);
    if (level.showplunderextracticonsinworld && level.shownonscriptableextracticons) {
        scripts\mp\objidpoolmanager::returnobjectiveid(oldsite.locale.objectiveiconid);
        oldsite.locale.objectiveiconid = -1;
        locale = spawnstruct();
        locale scripts\mp\gametypes\br_quest_util::createquestobjicon("ui_mp_br_mapmenu_icon_atm", "current", newsite.origin + (0, 0, 200));
        newsite.locale = locale;
    }
    level.br_plunder_sites = array_remove(level.br_plunder_sites, oldsite);
    level.br_plunder_sites = array_add(level.br_plunder_sites, newsite);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bde
// Size: 0x1a
function playerthrowsmokesignal() {
    self endon("death_or_disconnect");
    scripts\mp\gametypes\br_public::playerplaygestureweaponanim("iw8_ges_plyr_plunder_smoke", 1.867);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c00
// Size: 0x4a
function playerdenyextraction(weaponobject, localizedstring) {
    self iprintlnbold(localizedstring);
    self playlocalsound("br_pickup_deny");
    if (isdefined(weaponobject)) {
        ammo = self getweaponammoclip(weaponobject);
        self setweaponammoclip(weaponobject, ammo + 1);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c52
// Size: 0xb3
function createsmokesignalfx(position) {
    wait 1.35;
    fxent = spawn("script_model", position);
    fxent setmodel("scr_smoke_grenade");
    fxent.angles = (0, 90, 90);
    fxent playsound("smoke_carepackage_expl_trans");
    fxent playloopsound("smoke_carepackage_smoke_lp");
    fxent setscriptablepartstate("smoke", "on");
    wait 17;
    fxent endon("death");
    fxent setscriptablepartstate("smoke", "dissipate");
    fxent playsound("smoke_canister_tail_dissipate");
    wait 1;
    fxent stoploopsound();
    wait 4.5;
    fxent delete();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0d
// Size: 0x1e4
function playerspawnextractchopper(position, site) {
    extractgroundpos = position;
    var_db4adba9675a31aa = extractgroundpos + (0, 0, 2000);
    spawnposoffset = extractgroundpos + (0, 0, 8000);
    var_7ce2ef2a1efe71a6 = extractgroundpos + (0, 0, 800);
    flightyaw = 0;
    var_fda870b32ab92c1f = (0, 0, 0);
    usestructs = getdvarint(@"hash_f38b8e35f5c48796", 0);
    if (usestructs) {
        var_7b021c6ffbdb9959 = getextractionpadent(extractgroundpos);
        if (isdefined(var_7b021c6ffbdb9959)) {
            padstruct = var_7b021c6ffbdb9959.script_noteworthy;
            var_fda870b32ab92c1f = padstruct.angles;
        } else {
            /#
                iprintlnbold("<dev string:xf1>");
            #/
            flightyaw = getclearpathflightyaw(site, spawnposoffset, var_db4adba9675a31aa);
            var_fda870b32ab92c1f = (0, flightyaw, 0);
        }
    } else {
        flightyaw = getclearpathflightyaw(site, spawnposoffset, var_db4adba9675a31aa);
        var_fda870b32ab92c1f = (0, flightyaw, 0);
    }
    if (getdvarint(@"hash_d5878ca9e558dd32", 0) == 1) {
        var_cb2dc60f7cafc6d4 = -100;
        var_f0db3d408327db23 = 60;
        dirfwd = anglestoforward(var_fda870b32ab92c1f);
        dirright = anglestoright(var_fda870b32ab92c1f);
        extractgroundpos = extractgroundpos + dirfwd * var_cb2dc60f7cafc6d4 + dirright * var_f0db3d408327db23;
        var_db4adba9675a31aa = extractgroundpos + (0, 0, 2000);
        var_7ce2ef2a1efe71a6 = extractgroundpos + (0, 0, 800);
    }
    enterposition = spawnposoffset - anglestoforward(var_fda870b32ab92c1f) * 20000;
    heli = spawnheli(self, enterposition, var_db4adba9675a31aa, var_7ce2ef2a1efe71a6, extractgroundpos);
    return heli;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6efa
// Size: 0x89
function getextractionpadent(extractpos) {
    extractpad = undefined;
    foreach (pad in level.plunderpads) {
        if (isdefined(pad) && distance2dsquared(pad.origin, extractpos) <= 10000) {
            extractpad = pad;
            break;
        }
    }
    return extractpad;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8c
// Size: 0x14f
function getclearpathflightyaw(site, var_e58119f7c6eb5b4d, var_d3970a3e6c77212e) {
    if (isdefined(site) && isdefined(site.flightyaw)) {
        return site.flightyaw;
    }
    var_3fb4a86293ed25a6 = 10;
    contents = create_contents(0, 1, 1, 1, 1, 0, 1, 1, 0);
    var_3674d96c61e2dd0d = 0;
    for (yaw = 0; yaw < 360; yaw += var_3fb4a86293ed25a6) {
        var_3674d96c61e2dd0d += yaw;
        testangles = (0, var_3674d96c61e2dd0d, 0);
        approachstartpos = var_e58119f7c6eb5b4d - anglestoforward(testangles) * 20000;
        approachendpos = var_d3970a3e6c77212e;
        approachtrace = sphere_trace(approachstartpos, approachendpos, 100, undefined, contents, 1);
        if (approachtrace["fraction"] == 1) {
            /#
                line(approachstartpos, approachendpos, (0, 1, 0), 1, 0, 2000);
            #/
            if (isdefined(site)) {
                site.flightyaw = var_3674d96c61e2dd0d;
            }
            return var_3674d96c61e2dd0d;
        }
        /#
            line(approachstartpos, approachendpos, (1, 0, 0), 1, 0, 2000);
        #/
        if (yaw % 3 == 0) {
            waitframe();
        }
    }
    return var_3674d96c61e2dd0d;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e4
// Size: 0x162
function drophelicrate(heli) {
    if (!isdefined(heli.plunder)) {
        return;
    }
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("plunder_extract_fail_chopper", self.team, 1);
    plunder_allowrepositoryuse(self.crate, 0);
    crate = self.crate;
    self.crate = undefined;
    crate.plunder = heli.plunder;
    startorg = crate.origin;
    end = (startorg[0], startorg[1], -12000);
    contents = create_contents(0, 1, 1, 1, 1, 1, 0);
    trace = ray_trace(startorg, end, heli, contents);
    groundorg = trace["position"];
    dist = startorg[2] - groundorg[2];
    if (dist > 0) {
        time = sqrt(2 * dist / 800);
        crate moveto(groundorg, time, time, 0);
        wait time;
    }
    crate.origin = groundorg;
    playfx(getfx("airdrop_crate_impact_ground"), groundorg);
    entityplunderlosealldeposited(crate, 1);
    crate thread helicratedelete(heli);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724e
// Size: 0x91
function calculatehelitimetoflysec(distinches, speedmph, accelmph) {
    distmiles = distinches * 1.57828e-05;
    a = 0.5 * accelmph;
    b = speedmph;
    c = -1 * distmiles;
    flytime = (-1 * b + sqrt(b * b - 4 * a * c)) / 2 * a;
    flytime *= 3600;
    flytime += 1.5;
    return flytime;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e8
// Size: 0x4e
function calculatehelitimetoarrive(var_625180ce8d2f8f77) {
    arrivetime = calculatehelitimetoflysec(20000, 100, 125);
    descendtime = calculatehelitimetoflysec(var_625180ce8d2f8f77, 25, 31.25);
    totaltime = arrivetime + descendtime;
    return totaltime;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x733f
// Size: 0xd1
function heligotoplunderrepository(plunderRepository) {
    self endon("death");
    self endon("leaving");
    groundz = self.extractgroundpos[2];
    var_625180ce8d2f8f77 = self.descendpos[2] - groundz;
    self.flytime = calculatehelitimetoarrive(var_625180ce8d2f8f77);
    thread heliwatchgameendleave();
    self.preventleave = 1;
    helidescend();
    self.preventleave = undefined;
    self setscriptablepartstate("vector_field", "on");
    if (!istrue(level.gameended)) {
        if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("plunder_extract_chopper_arrive", self.team, 1);
        }
        thread heliwaitatplunderrepository(plunderRepository);
        return;
    }
    thread helileave(1);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7418
// Size: 0xf3
function heliwaitatplunderrepository(plunderRepository) {
    assertex(isdefined(plunderRepository), "heliWaitAtPlunderRepository called on a heli without a plunderRepository.");
    plunderrepositoryref = undefined;
    if (plunderRepository.type == "brloot_plunder_extraction_site_01") {
        plunderrepositoryref = "plunderHelipad1";
    } else if (plunderRepository.type == "brloot_plunder_extraction_site_02") {
        plunderrepositoryref = "plunderHelipad2";
    } else if (plunderRepository.type == "brloot_quest_extract_site_plunder") {
        plunderrepositoryref = "extractHelipadPlunder";
    } else if (plunderRepository.type == "brloot_quest_extract_site_br") {
        plunderrepositoryref = "extractHelipadBR";
    } else {
        assertmsg("heliWaitAtPlunderRepository called on a heli with a plunderRepository of an unregistered type.");
    }
    plunder_registerrepositoryinstance(plunderRepository, plunderrepositoryref);
    players = undefined;
    if (isdefined(self.team)) {
        players = scripts\mp\utility\teams::getfriendlyplayers(self.team);
    }
    thread plunder_repositorywatchcountdown(plunderRepository, players);
    plunder_updateanchoredwidgetforplayers(plunderRepository, players);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7513
// Size: 0xbb
function helibankplunder(plunderRepository) {
    if (!istrue(level.gameended) && !scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("plunder_extract_success", self.team, 1);
    }
    data = plunderRepository scripts\mp\gametypes\br_plunder::entityplunderbankalldeposited();
    if (isdefined(data) && isdefined(data.amounttotal) && data.amounttotal > 0) {
        level.br_plunder.extraction_helicoptor_total_plunder += data.amounttotal;
        level.br_plunder.extraction_helicoptor_num_completed++;
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75d6
// Size: 0x19a
function spawnropeandbag(heli) {
    ropenode = spawn("script_model", (0, 0, 0));
    ropenode setmodel("tag_origin");
    ropenode linkto(heli, "origin_animate_jnt", ter_op(istrue(level.var_a83a4e71446bfef7), (-142.719, 0, 22.931), (0, 0, 0)), (0, 0, 0));
    rope = spawn("script_model", (0, 0, 0));
    rope setmodel("misc_rapelling_rope_01_fiber_br");
    rope linkto(ropenode, "tag_origin");
    rope.animname = heli.animname;
    rope scripts\common\anim::setanimtree();
    ropenode scripts\common\anim::anim_first_frame_solo(rope, "rope_in", "tag_origin");
    crate = spawn("script_model", (0, 0, 0));
    if (istrue(level.var_a83a4e71446bfef7)) {
        crate setmodel("br_plunder2_extraction_delivery_bag");
    } else {
        crate setmodel("br_plunder_extraction_delivery_bag");
    }
    crate linkto(ropenode, "tag_origin");
    crate.animname = heli.animname;
    crate scripts\common\anim::setanimtree();
    ropenode scripts\common\anim::anim_first_frame_solo(crate, "bag_in", "tag_origin");
    heli.rope = rope;
    heli.crate = crate;
    heli.ropenode = ropenode;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7778
// Size: 0x350
function spawnheli(owner, enterpos, descendpos, hoverpos, extractgroundpos) {
    var_87cef10bf5729579 = 1;
    var_1d4278103ba47a16 = vectortoangles(descendpos * (1, 1, 0) - enterpos * (1, 1, 0));
    modelname = "veh8_mil_air_mindia8_plunder_x";
    vehiclename = "veh_apache_plunder_mp";
    groundposoffset = (0, 0, 0);
    if (istrue(level.var_a83a4e71446bfef7)) {
        modelname = "veh9_mil_air_heli_blima_mp_x";
        vehiclename = "veh9_mil_air_heli_blima_nophysics_br";
        groundposoffset = (126, 0, -20);
    }
    heli = scripts\cp_mp\vehicles\vehicle_tracking::_spawnhelicopter(owner, enterpos, var_1d4278103ba47a16, vehiclename, modelname);
    if (!isdefined(heli)) {
        return;
    }
    heli.damagecallback = &callback_vehicledamage;
    heli.speed = 100;
    heli.accel = 125;
    heli.health = ter_op(getsubgametype() == "plunder" || getsubgametype() == "risk", level.extractplunderhelihealth, 1000);
    heli.maxhealth = heli.health;
    heli.team = owner.team;
    heli.owner = owner;
    heli.lifeid = 0;
    heli.flaresreservecount = var_87cef10bf5729579;
    heli.enterpos = enterpos;
    heli.descendpos = descendpos;
    heli.hoverpos = hoverpos;
    heli.extractgroundpos = extractgroundpos;
    heli.sceneangles = var_1d4278103ba47a16;
    heli.vehiclename = "magma_plunder_chopper";
    heli.animname = "plunder_extract_heli";
    heli setcandamage(1);
    heli setmaxpitchroll(10, 25);
    heli vehicle_setspeed(heli.speed, heli.accel);
    heli sethoverparams(1, 1, 1);
    heli setturningability(0.05);
    heli setyawspeed(45, 25, 25, 0.5);
    heli setotherent(owner);
    heli setvehicleteam(heli.team);
    heli setscriptablepartstate("engine", "on");
    if (!istrue(level.var_a83a4e71446bfef7)) {
        heli setscriptablepartstate("tail_light", "red");
        heli setscriptablepartstate("cockpit_light", "on");
    }
    heli setscriptablepartstate("infil_lights", "on");
    heli.scenenode = spawn("script_model", heli.extractgroundpos + groundposoffset);
    heli.scenenode.angles = heli.sceneangles;
    heli.scenenode setmodel("tag_origin");
    heli.scenenode scripts\common\anim::anim_first_frame_solo(heli, "heli_in");
    spawnropeandbag(heli);
    return heli;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ad1
// Size: 0x32
function helicratedelete(heli) {
    plunder_deregisterrepositoryinstance(self);
    self hide();
    if (isdefined(heli)) {
        heli.crate = undefined;
    }
    waitframe();
    self delete();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b0b
// Size: 0x141
function helidestroyed() {
    self endon("heli_gone");
    owner = self.owner;
    attacker, meansofdeath, weaponobject, damagelocation = self waittill("death");
    var_a8eeb94dcc610b78 = 0;
    if (isdefined(self.plunder)) {
        foreach (item in self.plunder) {
            var_a8eeb94dcc610b78 += item.plundercount;
        }
    }
    scripts\mp\gametypes\br_analytics::branalytics_plunder_extraction_failure(var_a8eeb94dcc610b78, "little_bird", self.extractgroundpos, self.origin);
    thread drophelicrate(self);
    helicleanup();
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.largeprojectiledamage) && !istrue(self.isdepot)) {
        self vehicle_setspeed(25, 5);
        thread helicrash(75);
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(2.7);
    }
    heliexplode(attacker);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c54
// Size: 0x75
function helicleanup() {
    if (isdefined(self.rope)) {
        self.rope delete();
    }
    if (isdefined(self.crate)) {
        self.crate thread helicratedelete(self);
    }
    if (isdefined(self.scenenode)) {
        self.scenenode delete();
    }
    if (isdefined(self.ropenode)) {
        self.ropenode delete();
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cd1
// Size: 0xe7
function heliexplode(attacker) {
    explosionposition = self gettagorigin("tag_origin") + (0, 0, 40);
    self radiusdamage(explosionposition, 256, 140, 70, attacker, "MOD_EXPLOSIVE");
    playfx(getfx("little_bird_explode"), explosionposition, anglestoforward(self.angles), anglestoup(self.angles));
    playsoundatpos(explosionposition, "veh_chopper_support_crash");
    earthquake(0.8, 1.5, explosionposition, 384);
    playrumbleonposition("grenade_rumble", explosionposition);
    physicsexplosionsphere(explosionposition, 500, 200, 1);
    self notify("explode");
    wait 0.35;
    level thread scripts\mp\gametypes\br::teamsplashbr("br_extract_heli_shot_down", self.owner, self.team, undefined, "splash_list_br_plunder_iw9_mp");
    helidelete();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc0
// Size: 0x11
function helidelete() {
    helicleanup();
    scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(self);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd9
// Size: 0x50
function helicrash(speed) {
    self endon("explode");
    self notify("heli_crashing");
    self setvehgoalpos(self.origin + (0, 0, 100), 1);
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(1.5);
    self setyawspeed(speed, speed, speed);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e31
// Size: 0x1a6
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid) {
    if (isdefined(attacker)) {
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
    }
    if (istrue(level.extractplunderheliinvulnerable)) {
        return;
    }
    if ((attacker == self || isdefined(attacker.pers) && attacker.pers["team"] == self.team && !level.friendlyfire && level.teambased) && attacker != self.owner) {
        return;
    }
    if (self.health <= 0) {
        return;
    }
    damage = scripts\mp\utility\killstreak::getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, damage, self.maxhealth, 3, 4, 5);
    scripts\mp\killstreaks\killstreaks::killstreakhit(attacker, objweapon, self, meansofdeath, damage);
    attacker updatedamagefeedback("");
    if (self.health - damage <= 900 && (!isdefined(self.smoking) || !self.smoking)) {
        self.smoking = 1;
    }
    self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fdf
// Size: 0x1e0
function helileave(fromtimeout) {
    if (istrue(self.tryingtoleave) || istrue(self.leaving)) {
        return;
    }
    self endon("death");
    self notify("try_to_leave");
    self.tryingtoleave = 1;
    if (!istrue(level.gameended) && !scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("plunder_extract_chopper_leave", self.team, 1);
    }
    plunderRepository = self.site;
    if (isdefined(plunderRepository)) {
        plunder_repositoryclearcountdown(plunderRepository);
        helibankplunder(plunderRepository);
        if (isdefined(plunderRepository.heli) && plunderRepository.heli == self) {
            plunderRepository.heli = undefined;
            plunderRepository.team = undefined;
            plunderRepository notify("heli_left");
        }
        plunderRepository thread heli_delayedpadstateupdate(self.site.type);
        self.site = undefined;
    }
    self.readytoleave = 1;
    self waittill("ready_to_leave");
    self notify("leaving");
    self.leaving = 1;
    self.tryingtoleave = undefined;
    animtime_out = getanimlength(level.scr_anim[self.animname]["heli_out"]);
    self.scenenode thread scripts\common\anim::anim_single_solo(self, "heli_out");
    self.ropenode thread scripts\common\anim::anim_single_solo(self.rope, "rope_out", "tag_origin");
    self.ropenode thread scripts\common\anim::anim_single_solo(self.crate, "bag_out", "tag_origin");
    thread function_2bbe8af3e7fa2471(self, 2);
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(animtime_out);
    self stoploopsound();
    self notify("heli_gone");
    helidelete();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81c7
// Size: 0x7c
function function_2bbe8af3e7fa2471(vehicle, sequence) {
    switch (sequence) {
    case 0: 
        vehicle setscriptablepartstate("plunder_sfx", "heli_in");
        break;
    case 1: 
        vehicle setscriptablepartstate("plunder_sfx", "heli_loop");
        break;
    case 2: 
        vehicle setscriptablepartstate("plunder_sfx", "heli_out");
        break;
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824b
// Size: 0x8a
function heli_delayedpadstateupdate(type) {
    scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), "inuseCurrent", "inuse");
    self setscriptablepartstate(type, scriptablestate);
    wait 6;
    if (isdefined(self)) {
        scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), self.activecurrstate, self.activestate);
        self setscriptablepartstate(type, scriptablestate);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82dd
// Size: 0xbb
function helidescend() {
    self endon("death");
    thread function_2bbe8af3e7fa2471(self, 0);
    animtime_in = getanimlength(level.scr_anim[self.animname]["heli_in"]);
    self.scenenode thread scripts\common\anim::anim_single_solo(self, "heli_in");
    self.ropenode thread scripts\common\anim::anim_single_solo(self.rope, "rope_in", "tag_origin");
    self.ropenode thread scripts\common\anim::anim_single_solo(self.crate, "bag_in", "tag_origin");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(animtime_in);
    thread heliplayloopanim();
    thread heliplayloopropeanim();
    thread heliplayloopbadanim();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83a0
// Size: 0x88
function heliplayloopanim() {
    self endon("death");
    self.scenenode endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["heli_loop"]);
    while (true) {
        self.scenenode thread scripts\common\anim::anim_single_solo(self, "heli_loop");
        wait animtime;
        if (istrue(self.readytoleave) && !istrue(self.preventleave)) {
            self notify("ready_to_leave");
            break;
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8430
// Size: 0x70
function heliplayloopropeanim() {
    self endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["rope_loop"]);
    while (true) {
        self.ropenode thread scripts\common\anim::anim_single_solo(self.rope, "rope_loop", "tag_origin");
        wait animtime;
        if (istrue(self.readytoleave)) {
            break;
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a8
// Size: 0x70
function heliplayloopbadanim() {
    self endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["bag_loop"]);
    while (true) {
        self.ropenode thread scripts\common\anim::anim_single_solo(self.crate, "bag_loop", "tag_origin");
        wait animtime;
        if (istrue(self.readytoleave)) {
            break;
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8520
// Size: 0x33
function entisalivevehicle() {
    return isalive(self) && (scripts\common\vehicle::isvehicle() || isdefined(self.classname) && self.classname == "script_vehicle");
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x855c
// Size: 0x5d
function helidestroyvehiclestouchnotify() {
    self endon("leaving");
    self endon("death");
    while (true) {
        vehicle = self waittill("touch");
        if (isdefined(vehicle) && vehicle entisalivevehicle()) {
            vehicle dodamage(vehicle.health, self.origin, vehicle, vehicle, "MOD_CRUSH");
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85c1
// Size: 0x28b
function helidestroyvehiclestouchtrace() {
    self endon("leaving");
    self endon("death");
    radius = 70;
    offsetdown = -80;
    forward = 150;
    middle = 25;
    back = -100;
    while (true) {
        vehicles = getentarrayinradius("script_vehicle", "classname", self.origin, getdvarfloat(@"hash_d8d9dc5f1a9e75a9", 400));
        if (vehicles.size <= 1) {
            wait 0.5;
            continue;
        }
        vehiclecontents = create_vehicle_contents();
        dir = anglestoforward(self.angles);
        origin = self.origin + dir * getdvarfloat(@"hash_c99873a79b22a9f7", forward) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", offsetdown));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, vehiclecontents);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        origin = self.origin + dir * getdvarfloat(@"hash_c9986ca79b229a92", middle) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", offsetdown));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, vehiclecontents);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        origin = self.origin + dir * getdvarfloat(@"hash_c9986fa79b22a12b", back) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", offsetdown));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, vehiclecontents);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        waitframe();
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8854
// Size: 0x3a
function tracegroundheight(start) {
    var_dc8bb6300463cf1e = 800;
    groundheight = tracegroundpoint(start);
    trueheight = groundheight + var_dc8bb6300463cf1e;
    return trueheight;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8897
// Size: 0x9d
function tracegroundpoint(start) {
    self endon("death");
    self endon("leaving");
    var_379ff849b3cda7d7 = -99999;
    end = (start[0], start[1], var_379ff849b3cda7d7);
    ignorelist = [self];
    contents = create_contents(0, 1, 0, 1, 1, 0, 1, 1, 0);
    trc = sphere_trace(start, end, 100, ignorelist, contents, 1);
    hightrace = trc["position"][2];
    return hightrace;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x893d
// Size: 0x21
function heliwatchgameendleave() {
    self endon("death");
    self endon("try_to_leave");
    level waittill("game_ended");
    thread helileave(0);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8966
// Size: 0x1b
function helicountdownendcallback(entity, fromtimeout) {
    plunder_repositoryextract(entity);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8989
// Size: 0x2f
function heliextractcallback(entity) {
    if (isdefined(entity.heli)) {
        entity.heli thread helileave(1);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89c0
// Size: 0xb
function heliatcapacitycallback(entity) {
    
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89d3
// Size: 0xa
function plunderlivelobby() {
    thread autopickupplunder();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89e5
// Size: 0x29
function inplunderlivelobby() {
    return istrue(level.br_plunder_enabled) && istrue(level.br_plunder_lobby) && !scripts\mp\flags::gameflag("prematch_done");
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a17
// Size: 0x106
function autopickupplunder() {
    var_d818dc2e4c3f6146 = 0.1;
    var_4bc125b68d3f84a8 = 25;
    var_6635ea180b2dbe19 = var_4bc125b68d3f84a8 * var_4bc125b68d3f84a8;
    while (inplunderlivelobby()) {
        for (i = 0; i < level.br_plunder_ents.size; i++) {
            pickupent = level.br_plunder_ents[i];
            if (!isdefined(pickupent)) {
                continue;
            }
            var_7ae23d8bd45fd01c = pickupent.origin;
            for (j = 0; j < level.players.size; j++) {
                player = level.players[j];
                if (!isalive(player)) {
                    continue;
                }
                distsq = distancesquared(player.origin, var_7ae23d8bd45fd01c);
                if (distsq < var_6635ea180b2dbe19) {
                    player scripts\mp\gametypes\br_pickups::brpickupsusecallback(pickupent, player);
                    break;
                }
            }
        }
        wait var_d818dc2e4c3f6146;
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b25
// Size: 0x39
function playerdelayautobankplunder() {
    self notify("playerDelayAutoBankPlunder");
    self endon("playerDelayAutoBankPlunder");
    self endon("death");
    level endon("prematch_done");
    level endon("game_ended");
    wait 2;
    playerplunderbank(self.plundercount);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b66
// Size: 0xbe
function playerplunderlivelobbydropondeath(smeansofdeath) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    if (inplunderlivelobby()) {
        dropall = smeansofdeath == "MOD_MELEE";
        amount = 1;
        if (dropall && isdefined(self.plundercount) && self.plundercount > 1) {
            amount = self.plundercount;
            playersetplundercount(0);
        }
        if (amount <= 0) {
            return;
        }
        if (level.br_plunder_ents.size > 0) {
            level.br_plunder_ents = array_removeundefined(level.br_plunder_ents);
        }
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        return dropcondensedplunder(amount, dropstruct);
    }
}

/#

    // Namespace br_plunder / scripts\mp\gametypes\br_plunder
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8c2c
    // Size: 0xb4
    function function_d998045c08ec165d() {
        level endon("<dev string:x4c>");
        while (true) {
            if (getdvarint(@"hash_9b7f60d28a567fea", 0) != 0) {
                var_9f15f1d71bad87e2 = getallextractspawninstances();
                foreach (location in var_9f15f1d71bad87e2) {
                    thread scripts\cp_mp\utility\debug_utility::drawsphere(location.origin, 820, 30, (0, 1, 0));
                }
                setdevdvar(@"hash_9b7f60d28a567fea", 0);
            }
            waitframe();
        }
    }

#/

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ce8
// Size: 0x114
function initteamdatafields() {
    foreach (team in level.teamnamelist) {
        level.teamdata[team]["plunderTeamTotal"] = 0;
        level.teamdata[team]["plunderInDeposit"] = 0;
        level.teamdata[team]["plunderBanked"] = 0;
    }
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "risk") {
        foreach (team in level.teamnamelist) {
            level.teamdata[team]["tokensTeamTotal"] = 0;
            level.teamdata[team]["tokensInDeposit"] = 0;
            level.teamdata[team]["tokensBanked"] = 0;
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e04
// Size: 0x63
function getteamplunder(team) {
    plundercount = 0;
    if (!level.scorerequiresbanking) {
        plundercount += level.teamdata[team]["plunderTeamTotal"];
        plundercount += level.teamdata[team]["plunderInDeposit"];
    }
    plundercount += level.teamdata[team]["plunderBanked"];
    return plundercount;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e70
// Size: 0x1c
function getteamcarriedplunder(team) {
    return level.teamdata[team]["plunderTeamTotal"];
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e95
// Size: 0x1c
function getbankedplunder(team) {
    return level.teamdata[team]["plunderBanked"];
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eba
// Size: 0xd6
function getplundernamebyamount(amount) {
    assertex(isdefined(level.br_plunder) && isdefined(level.br_plunder.quantity) && isdefined(level.br_plunder.names), "getPlunderNameByAmount called before setupQuantities.");
    var_3466c10973e9c476 = level.br_plunder.names[0];
    for (i = level.br_plunder.quantity.size - 1; i > 0; i--) {
        if (amount >= level.br_plunder.quantity[i]) {
            var_3466c10973e9c476 = level.br_plunder.names[i];
            break;
        }
    }
    return var_3466c10973e9c476;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f99
// Size: 0x48
function playplundersoundbyamount(player, amount) {
    if (amount == 0) {
        return;
    }
    var_3466c10973e9c476 = getplundernamebyamount(amount);
    soundalias = scripts\mp\gametypes\br_pickups::getcashsoundaliasforplayer(player, var_3466c10973e9c476);
    player playsoundtoplayer(soundalias, self);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fe9
// Size: 0x1ae
function processcashpilevalueoverrides() {
    overridescalar = getdvarint(@"hash_3c33b53363a2fb48", 1);
    if (overridescalar <= 1) {
        return;
    }
    foreach (name, value in level.br_pickups.counts) {
        if (!issubstr(name, "brloot_plunder_cash")) {
            continue;
        }
        basevalue = level.br_pickups.counts[name];
        newvalue = basevalue * overridescalar;
        level.br_pickups.counts[name] = newvalue;
        scriptables = getentitylessscriptablearray(name);
        if (scriptables.size >= 1) {
            foreach (scriptable in scriptables) {
                scriptable.count = newvalue;
            }
        }
    }
    for (i = 0; i < level.br_plunder.names.size; i++) {
        level.br_plunder.quantity[i] = level.br_pickups.counts[level.br_plunder.names[i]];
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x919f
// Size: 0x141
function processcashpileovertimemultiplier(multiplier) {
    foreach (index, name in level.br_plunder.names) {
        level.br_plunder.quantity[index] = int(float(level.br_plunder.quantity[index]) * multiplier);
        level.br_pickups.counts[name] = level.br_plunder.quantity[index];
        scriptables = getentitylessscriptablearray(name);
        foreach (scriptable in scriptables) {
            scriptable.count = level.br_plunder.quantity[index];
        }
        waitframe();
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92e8
// Size: 0xb2
function debug_calculatecashonground() {
    total = 0;
    foreach (name in level.br_plunder.names) {
        scriptables = getentitylessscriptablearray(name);
        total += scriptables.size * level.br_pickups.counts[name];
    }
    total *= 100;
    level.totalcashongroundatstart = total;
    println("<dev string:x159>" + total);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a2
// Size: 0x151
function plunder_initrepositories() {
    assertex(!isdefined(level.plunderrepositories), "plunder_initRepositories() should only be called once.");
    level.plunderrepositories = spawnstruct();
    level.plunderrepositories.data = [];
    level.plunderrepositories.instances = [];
    level.plunderrepositories.uniqueinstanceid = 0;
    level.plunderrepositories.teamanchoredwidgetinstances = [];
    level.plunderrepositories.teamanchoredentomnvars = [];
    level.plunderrepositories.teamanchoredinfoomnvars = [];
    for (i = 1; i <= 4; i++) {
        level.plunderrepositories.teamanchoredentomnvars[i] = "ui_br_plunder_repo_ent_" + i;
        level.plunderrepositories.teamanchoredinfoomnvars[i] = "ui_br_plunder_repo_info_" + i;
    }
    scripts\common\interactive::interactive_addusedcallback(&plunder_repositoryusecallback, "plunderRepository");
    scripts\engine\scriptable::scriptable_addusedcallback(&plunder_repositoryusescriptablecallback);
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&plunder_playerspawnedcallback);
    level.plunderusedisabledwhenempty = getdvarint(@"hash_eb449c46ed5955e6", 0) > 0;
    /#
        setdevdvarifuninitialized(@"hash_eb449c46ed5955e6", 0);
    #/
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94fb
// Size: 0x1c1
function plunder_getleveldataforrepository(ref, create, var_6ecb77fd1f27c667) {
    leveldata = level.plunderrepositories;
    assertex(isdefined(leveldata), "plunder_getLevelDataForRepository() called before plunder_initRepositories().");
    var_464eb48901113eb0 = leveldata.data[ref];
    if (!isdefined(var_464eb48901113eb0)) {
        if (istrue(create)) {
            var_464eb48901113eb0 = spawnstruct();
            leveldata.data[ref] = var_464eb48901113eb0;
            var_464eb48901113eb0.usetime = 0.75;
            var_464eb48901113eb0.useeventtype = 2;
            var_464eb48901113eb0.useeventamount = 250;
            var_464eb48901113eb0.teamuseonly = 1;
            var_464eb48901113eb0.teamanchoredwidget = 0;
            var_464eb48901113eb0.usefaillaststandmsg = "MP/CANNOT_DEPOSIT_LS";
            var_464eb48901113eb0.usefailvehiclemsg = "MP/CANNOT_DEPOSIT_VEHICLE";
            var_464eb48901113eb0.usefailcapacitymsg = "MP/PLACEHOLDER_CANNOT_DEPOSIT_FULL";
            var_464eb48901113eb0.usefailnoplundermsg = "MP/CANNOT_DEPOSIT_NO_CASH";
            var_464eb48901113eb0.usefailextractingmsg = "MP/PLACEHOLDER_CANNOT_DEPOSIT_LEAVING";
            var_464eb48901113eb0.scriptableusepart = undefined;
            var_464eb48901113eb0.scriptableusestate = undefined;
            var_464eb48901113eb0.scriptablenousestate = undefined;
            var_464eb48901113eb0.extractcountdown = 60;
            var_464eb48901113eb0.extractsilentcountdown = 0;
            var_464eb48901113eb0.extractcountdownmsg = "MP/PLACEHOLDER_LEAVING_IN_N";
            var_464eb48901113eb0.capacity = 2000;
            var_464eb48901113eb0.useshouldsucceedcallback = undefined;
            var_464eb48901113eb0.usecallback = &plunder_repositoryplayerplundereventcallback;
            var_464eb48901113eb0.countdownendcallback = undefined;
            var_464eb48901113eb0.extractcallback = undefined;
            var_464eb48901113eb0.extractionmethod = undefined;
        } else {
            assertex(istrue(var_6ecb77fd1f27c667), "plunder_getLevelDataForRepository called with an invalid ref.");
        }
    }
    return var_464eb48901113eb0;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96c5
// Size: 0x139
function plunder_registerrepositoryinstance(entity, ref) {
    leveldata = level.plunderrepositories;
    assertex(isdefined(leveldata), "plunder_registerRepositoryInstance() called before plunder_initRepositories().");
    var_464eb48901113eb0 = plunder_getleveldataforrepository(ref);
    entity.plunderrepositoryref = ref;
    entity.startorigin = entity.origin;
    entity.plunder = [];
    entity.plundertotal = 0;
    entity.plunderinstanceid = level.plunderrepositories.uniqueinstanceid;
    level.plunderrepositories.uniqueinstanceid++;
    entity.playersusing = [];
    leveldata.instances[entity.plunderinstanceid] = entity;
    assertex(!isdefined(var_464eb48901113eb0.teamuseonly) || isdefined(entity.team), "team use only repositories must have .team defined");
    plunder_addanchoredwidgettorepositoryinstance(entity);
    if (!isdefined(var_464eb48901113eb0.scriptableusepart)) {
        entity scripts\common\interactive::interactive_addusedcallbacktoentity("plunderRepository");
    }
    plunder_allowrepositoryuse(entity, 1);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9806
// Size: 0xcd
function plunder_deregisterrepositoryinstance(entity) {
    leveldata = level.plunderrepositories;
    assertex(isdefined(leveldata), "plunder_deregisterRepositoryInstance() called before plunder_initRepositories().");
    entity notify("plunder_instance_deregistered");
    plunder_allowrepositoryuse(entity, 0, 1);
    entity.plunderrepositoryref = undefined;
    entity.plunderusable = undefined;
    entity.plunderatcapacity = undefined;
    entity.startorigin = undefined;
    entity.plunder = undefined;
    entity.plundertotal = undefined;
    plunder_repositoryclearcountdown(entity);
    entity.playersusing = undefined;
    if (isdefined(entity.plunderinstanceid)) {
        leveldata.instances[entity.plunderinstanceid] = undefined;
    }
    plunder_removeanchoredwidgetfromrepositoryinstance(entity);
    entity scripts\common\interactive::interactive_removeusedcallbackfromentity();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98db
// Size: 0x63
function plunder_repositoryinstanceisregistered(entity) {
    leveldata = level.plunderrepositories;
    if (!isdefined(leveldata)) {
        return false;
    }
    instance = undefined;
    if (isdefined(entity.plunderinstanceid)) {
        instance = leveldata.instances[entity.plunderinstanceid];
    }
    return isdefined(instance) && instance == entity;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9947
// Size: 0x1e9
function plunder_allowrepositoryuse(entity, bool, var_6ecb77fd1f27c667) {
    entity notify("plunder_allowRepositoryUse");
    assertex(istrue(var_6ecb77fd1f27c667) || isdefined(entity.plunderrepositoryref), "plunder_allowRepositoryUse called on an unregistered entity.");
    var_464eb48901113eb0 = undefined;
    if (isdefined(entity.plunderrepositoryref)) {
        var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref, undefined, var_6ecb77fd1f27c667);
    }
    if (isdefined(var_464eb48901113eb0)) {
        if (isdefined(var_464eb48901113eb0.scriptableusepart)) {
            assertex(isdefined(var_464eb48901113eb0.scriptableusestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableUseState.");
            assertex(isdefined(var_464eb48901113eb0.scriptablenousestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableNoUseState.");
            if (bool) {
                entity setscriptablepartstate(var_464eb48901113eb0.scriptableusepart, var_464eb48901113eb0.scriptableusestate, 0);
            } else {
                entity setscriptablepartstate(var_464eb48901113eb0.scriptableusepart, var_464eb48901113eb0.scriptablenousestate, 0);
            }
        } else if (bool) {
            entity makeusable();
        } else {
            entity makeunusable();
        }
        var_be40dcf3d84912f6 = istrue(entity.plunderusable);
        entity.plunderusable = ter_op(bool, bool, undefined);
        if (!var_be40dcf3d84912f6) {
            if (bool) {
                foreach (player in level.players) {
                    plunder_allowrepositoryuseforplayer(entity, player, plunder_playercanuserepository(entity, player));
                }
            }
            return;
        }
        if (!bool) {
            entity notify("repository_use_disabled");
        }
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b38
// Size: 0x10d
function plunder_allowrepositoryuseforplayer(entity, player, bool, var_6ecb77fd1f27c667) {
    assertex(istrue(var_6ecb77fd1f27c667) || isdefined(entity.plunderrepositoryref), "plunder_allowRepositoryUse called on an unregistered entity.");
    var_464eb48901113eb0 = undefined;
    if (isdefined(entity.plunderrepositoryref)) {
        var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref, undefined, var_6ecb77fd1f27c667);
    }
    if (isdefined(var_464eb48901113eb0)) {
        if (isdefined(var_464eb48901113eb0.scriptableusepart)) {
            assertex(isdefined(var_464eb48901113eb0.scriptableusestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableUseState.");
            if (bool) {
                entity enablescriptablepartplayeruse(var_464eb48901113eb0.scriptableusepart, player);
            } else {
                entity disablescriptablepartplayeruse(var_464eb48901113eb0.scriptableusepart, player);
            }
        } else if (bool) {
            entity enableplayeruse(player);
        } else {
            entity disableplayeruse(player);
        }
    }
    if (!bool) {
        entity notify("repository_use_disabled_for_" + player getentitynumber());
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c4d
// Size: 0x8b
function plunder_allowallrepositoryuseforplayer(player, bool, var_6ecb77fd1f27c667) {
    leveldata = level.plunderrepositories;
    foreach (instance in leveldata.instances) {
        plunder_allowrepositoryuseforplayer(instance, player, bool, 1);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ce0
// Size: 0x85
function plunder_playercanuserepository(entity, player) {
    if (player scripts\cp_mp\utility\player_utility::isinvehicle()) {
        return false;
    }
    if (scripts\mp\utility\player::isinlaststand(player)) {
        return false;
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (istrue(var_464eb48901113eb0.teamuseonly) && isdefined(entity.team) && player.team != entity.team) {
        return false;
    }
    return true;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d6e
// Size: 0x245
function plunder_playerrepositoryuseshouldsucceed(entity, player, showerror) {
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!istrue(entity.plunderusable)) {
        return 0;
    }
    if (var_464eb48901113eb0.useeventtype == 2 || var_464eb48901113eb0.useeventtype == 3) {
        if (player.plundercount <= 0 && (!isdefined(player.extractquest_alwaysallowdeposit) || player.extractquest_helipadid != entity.index)) {
            if (istrue(showerror) && isdefined(var_464eb48901113eb0.usefailnoplundermsg) && var_464eb48901113eb0.usefailnoplundermsg != "") {
                player playlocalsound("br_plunder_atm_cancel");
                player scripts\mp\hud_message::showerrormessage(var_464eb48901113eb0.usefailnoplundermsg);
            }
            return 0;
        } else if (istrue(entity.plunderatcapacity)) {
            if (istrue(showerror) && isdefined(var_464eb48901113eb0.usefailcapacitymsg) && var_464eb48901113eb0.usefailcapacitymsg != "") {
                player playlocalsound("br_plunder_atm_cancel");
                player scripts\mp\hud_message::showerrormessage(var_464eb48901113eb0.usefailcapacitymsg);
            }
            return 0;
        }
    }
    if (player scripts\cp_mp\utility\player_utility::isinvehicle()) {
        if (istrue(showerror) && isdefined(var_464eb48901113eb0.usefailvehiclemsg) && var_464eb48901113eb0.usefailvehiclemsg != "") {
            player playlocalsound("br_plunder_atm_cancel");
            player scripts\mp\hud_message::showerrormessage(var_464eb48901113eb0.usefailvehiclemsg);
        }
        return 0;
    }
    if (scripts\mp\utility\player::isinlaststand(player)) {
        if (istrue(showerror) && isdefined(var_464eb48901113eb0.usefaillaststandmsg) && var_464eb48901113eb0.usefaillaststandmsg != "") {
            player playlocalsound("br_plunder_atm_cancel");
            player scripts\mp\hud_message::showerrormessage(var_464eb48901113eb0.usefaillaststandmsg);
        }
        return 0;
    }
    if (player isparachuting() || player isskydiving()) {
        return 0;
    }
    if (player isinexecutionattack() || player isinexecutionvictim()) {
        return 0;
    }
    if (isdefined(var_464eb48901113eb0.useshouldsucceedcallback)) {
        return [[ var_464eb48901113eb0.useshouldsucceedcallback ]](entity, player, showerror);
    }
    return 1;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fbc
// Size: 0x134
function plunder_repositoryusescriptablecallback(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(instance)) {
        return;
    }
    entity = instance.entity;
    if (!isdefined(entity) || isdefined(entity.forceextractscriptable)) {
        entity = instance;
    }
    if (!scripts\mp\gametypes\br_plunder::plunder_repositoryinstanceisregistered(entity)) {
        return;
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!isdefined(var_464eb48901113eb0.scriptableusepart)) {
        return;
    }
    assertex(isdefined(var_464eb48901113eb0.scriptableusestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableUseState.");
    assertex(isdefined(var_464eb48901113eb0.scriptablenousestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableNoUseState.");
    if (part != var_464eb48901113eb0.scriptableusepart) {
        return;
    }
    if (state != var_464eb48901113eb0.scriptableusestate) {
        return;
    }
    if (!plunder_playerrepositoryuseshouldsucceed(entity, player, 1)) {
        return;
    }
    thread plunder_repositoryusecallbackinternal(entity, player);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f8
// Size: 0x36
function plunder_repositoryusecallback(entity, player) {
    if (!scripts\mp\gametypes\br_plunder::plunder_repositoryinstanceisregistered(entity)) {
        return;
    }
    if (!plunder_playerrepositoryuseshouldsucceed(entity, player, 1)) {
        return;
    }
    thread plunder_repositoryusecallbackinternal(entity, player);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa136
// Size: 0x17a
function plunder_repositoryusecallbackinternal(entity, player) {
    entnum = player getentitynumber();
    timestamp = gettime();
    plunder_repositoryenableuserestrictions(player, 1);
    plunder_allowrepositoryuseforplayer(entity, player, 0);
    plunder_repositorywatchuse(entity, player);
    if (isdefined(player)) {
        if (isdefined(entity)) {
            plunder_allowrepositoryuseforplayer(entity, player, 1);
        }
        if (player scripts\cp_mp\utility\player_utility::_isalive()) {
            plunder_repositoryenableuserestrictions(player, 0);
        }
        player.plunderrepositoryrestricted = undefined;
        if (isplayer(player)) {
            tapuse = 0;
            cleardelay = undefined;
            if (!tapuse && player scripts\cp_mp\utility\player_utility::_isalive() && !player scripts\cp_mp\utility\player_utility::isinvehicle() && !scripts\mp\utility\player::isinlaststand(player)) {
                if (istrue(entity.extracting)) {
                    cleardelay = 2;
                } else if (isdefined(player.plunderrepositorywidget) && isdefined(player.plunderrepositorywidget.useeventtimestamp) && player.plunderrepositorywidget.useeventtimestamp - gettime() <= 1.5) {
                    cleardelay = 1.5;
                }
            }
            thread plunder_clearrepositorywidgetforplayer(player, cleardelay);
        }
    }
    if (isdefined(entity) && isdefined(entity.playersusing)) {
        entity.playersusing[entnum] = undefined;
    }
    if (isdefined(player) && isplayer(player)) {
        plunder_updateanchoredwidgetforplayers(entity, player);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2b8
// Size: 0x200
function plunder_repositorywatchuse(entity, player) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    entity endon("death");
    entity endon("repository_use_disabled");
    entity endon("repository_use_disabled_for_" + player getentitynumber());
    level endon("game_ended");
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    entity.playersusing[player getentitynumber()] = player;
    plunder_updaterepositorywidgetforplayer(player, entity.plunderinstanceid, var_464eb48901113eb0.type, 1, entity.plundercountdownendtime, entity.plundertotal);
    plunder_sendrepositorywidgetomnvar(player);
    plunder_updateanchoredwidgetforplayers(entity, player);
    var_f34424646f122cf3 = 0;
    usetime = 0;
    var_aba405f695679ed8 = var_464eb48901113eb0.usetime;
    var_585743c445b80ce6 = 0;
    while (player usebuttonpressed()) {
        showmessage = undefined;
        if (var_f34424646f122cf3) {
            var_f34424646f122cf3 = 0;
            showmessage = 0;
        } else {
            showmessage = 1;
        }
        if (!plunder_playerrepositoryuseshouldsucceed(entity, player, showmessage)) {
            return;
        }
        if (usetime >= var_aba405f695679ed8) {
            var_975e20b8bd98753a = int(min(player.plundercount, var_464eb48901113eb0.useeventamount));
            if (isdefined(var_464eb48901113eb0.usecallback)) {
                thread [[ var_464eb48901113eb0.usecallback ]](entity, player, var_975e20b8bd98753a);
            } else {
                assertmsg("no useCallback defined for " + entity.plunderrepositoryref + ".");
            }
            var_585743c445b80ce6 = usetime;
            var_aba405f695679ed8 = usetime + var_464eb48901113eb0.usetime;
            if (isdefined(player.plunderrepositorywidget)) {
                player.plunderrepositorywidget.useeventtimestamp = gettime();
            }
            var_f34424646f122cf3 = 1;
        }
        wait 0.05;
        usetime += 0.05;
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c0
// Size: 0x9e
function plunder_repositoryplayerplundereventcallback(entity, player, amount) {
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    data = player playerplunderevent(amount, var_464eb48901113eb0.useeventtype, entity);
    if (isdefined(data) && isdefined(data.amount)) {
        amount = data.amount;
    }
    if (amount > 0) {
        plunder_updaterepositorywidgetforplayer(player, undefined, undefined, undefined, undefined, entity.plundertotal, amount);
        plunder_sendrepositorywidgetomnvar(player);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa566
// Size: 0x126
function plunder_repositoryenableuserestrictions(player, bool) {
    restrictions = ["allow_movement", "usability", "weapon_switch", "equipment_primary", "equipment_secondary", "supers", "killstreaks", "fire", "melee", "reload", "ads", "mantle", "mount_top", "mount_side", "execution_attack", "vehicle_use", "cough_gesture"];
    if (istrue(player.plunderrepositoryrestricted) && bool) {
        return;
    }
    if (!istrue(player.plunderrepositoryrestricted) && !bool) {
        return;
    }
    if (bool) {
        player val::set_array("plunder", restrictions, 0);
    } else {
        player val::reset_all("plunder");
    }
    if (bool) {
        player.plunderrepositoryrestricted = 1;
        return;
    }
    player.plunderrepositoryrestricted = undefined;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa694
// Size: 0x26f
function plunder_repositorywatchcountdown(entity, players) {
    entity endon("death");
    entity endon("plunder_instance_deregistered");
    entity notify("plunder_repositoryWatchCountdown");
    entity endon("plunder_repositoryWatchCountdown");
    level endon("game_ended");
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!isdefined(entity.plundercountdownplayers)) {
        entity.plundercountdownplayers = [];
        entity.plundercountdownupdatetime = 0;
        silentcountdown = ter_op(isdefined(var_464eb48901113eb0.extractsilentcountdown), var_464eb48901113eb0.extractsilentcountdown, 0);
        countdown = ter_op(isdefined(var_464eb48901113eb0.extractcountdown), var_464eb48901113eb0.extractcountdown, 0);
        entity.plundersilentcountdownendtime = gettime() + silentcountdown * 1000;
        entity.plundercountdownendtime = gettime() + (silentcountdown + countdown) * 1000;
    }
    if (isdefined(players)) {
        if (!isarray(players)) {
            players = [players];
        }
        foreach (player in players) {
            if (isdefined(player) && isplayer(player)) {
                entity.plundercountdownplayers[player getentitynumber()] = player;
            }
        }
    }
    while (gettime() <= entity.plundercountdownendtime) {
        if (gettime() - entity.plundercountdownupdatetime >= 1000) {
            if (gettime() > entity.plundersilentcountdownendtime) {
                msgvalue = int(max(0, (entity.plundercountdownendtime - gettime()) / 1000));
                foreach (player in entity.plundercountdownplayers) {
                    if (isdefined(player)) {
                        thread plunder_repositorysendcountdownmessage(player, entity, msgvalue);
                    }
                }
            }
            entity.plundercountdownupdatetime = gettime();
        }
        wait 0.05;
    }
    thread plunder_repositoryendcountdown(entity, 1);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90b
// Size: 0x56
function plunder_repositoryendcountdown(entity, fromtimeout) {
    plunder_repositoryclearcountdown(entity);
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (isdefined(var_464eb48901113eb0.countdownendcallback)) {
        [[ var_464eb48901113eb0.countdownendcallback ]](entity, fromtimeout);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa969
// Size: 0x34
function plunder_repositoryclearcountdown(entity) {
    entity notify("plunder_repositoryWatchCountdown");
    entity.plundercountdownplayers = undefined;
    entity.plundercountdownendtime = undefined;
    entity.plundercountdownupdatetime = undefined;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9a5
// Size: 0x1a0
function plunder_repositorysendcountdownmessage(player, entity, value) {
    player endon("disconnect");
    player notify("plunder_repositorySendCountdownMessage");
    player endon("plunder_repositorySendCountdownMessage");
    level endon("game_ended");
    if (!isdefined(player.plundercountdownmessagedata)) {
        player.plundercountdownmessagedata = [];
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (isdefined(var_464eb48901113eb0.extractcountdownmsg)) {
        data = spawnstruct();
        data.origin = entity.origin;
        data.msg = var_464eb48901113eb0.extractcountdownmsg;
        data.value = value;
        player.plundercountdownmessagedata[player.plundercountdownmessagedata.size] = data;
    }
    waittillframeend();
    if (!player scripts\mp\gametypes\br_public::isplayeringulag() && player scripts\cp_mp\utility\player_utility::_isalive()) {
        bestdata = undefined;
        bestdistsqr = 2147483647;
        foreach (data in player.plundercountdownmessagedata) {
            testdistsqr = distance2dsquared(player.origin, data.origin);
            if (testdistsqr < bestdistsqr) {
                bestdistsqr = testdistsqr;
                bestdata = data;
            }
        }
    }
    player.plundercountdownmessagedata = undefined;
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab4d
// Size: 0x6c
function plunder_repositoryextract(entity) {
    entity.extracting = 1;
    plunder_repositoryclearcountdown(entity);
    plunder_allowrepositoryuse(entity, 0);
    plunder_removeanchoredwidgetfromrepositoryinstance(entity);
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (isdefined(var_464eb48901113eb0.extractcallback)) {
        [[ var_464eb48901113eb0.extractcallback ]](entity);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabc1
// Size: 0x5c
function plunder_repositoryatcapacity(entity) {
    entity.plunderatcapacity = 1;
    plunder_allowrepositoryuse(entity, 0);
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (isdefined(var_464eb48901113eb0.atcapacitycallback)) {
        [[ var_464eb48901113eb0.atcapacitycallback ]](entity);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac25
// Size: 0xe
function plunder_playerspawnedcallback() {
    plunder_allowallrepositoryuseforplayer(self, 1, 1);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac3b
// Size: 0x311
function plunder_updaterepositorywidgetforplayer(player, plunderinstanceid, type, visible, endtime, plundertotal, plundereventamount) {
    if (isdefined(visible) && !visible) {
        plunder_clearrepositorywidgetforplayer(player);
        return;
    }
    data = player.plunderrepositorywidget;
    if (!isdefined(data)) {
        data = spawnstruct();
        player.plunderrepositorywidget = data;
        data.plunderinstanceid = plunderinstanceid;
        data.type = type;
        data.visible = 0;
        data.endtime = undefined;
        data.plundertotal = undefined;
        data.plundereventamount = undefined;
        data.timestamp = undefined;
        assertex(isdefined(data.plunderinstanceid), "When repository widget is first created for the player, plunderInstanceID is required.");
        assertex(isdefined(data.type), "When repository widget is first created for the player, type is required.");
    } else if (isdefined(plunderinstanceid) && isdefined(data.plunderinstanceid) && plunderinstanceid != data.plunderinstanceid) {
        return;
    }
    var_90ae65dd73557a80 = 0;
    if (istrue(visible)) {
        var_90ae65dd73557a80 = !data.visible;
        data.visible = 1;
    }
    assertex(!var_90ae65dd73557a80 || isdefined(endtime), "If repository widget is newly visible to the player an endTime is required.");
    if (isdefined(endtime)) {
        data.endtime = endtime;
    }
    assertex(!var_90ae65dd73557a80 || isdefined(plundertotal), "If repository widget is newly visible to the player a plunderTotal is required.");
    if (isdefined(plundertotal)) {
        data.plundertotal = plundertotal;
    }
    if (isdefined(plundereventamount)) {
        assertex(!isdefined(data.plundereventamount) || isdefined(data.timestamp) && data.timestamp < gettime(), "The player should never update plunderEventAmount twice in one frame.");
        data.plundereventamount = plundereventamount;
        entity = level.plunderrepositories.instances[data.plunderinstanceid];
        foreach (_player in entity.playersusing) {
            if (_player != player) {
                plunder_updaterepositorywidgetforplayer(player, undefined, undefined, undefined, undefined, plundertotal, undefined);
                plunder_sendrepositorywidgetomnvar(player);
            }
        }
        if (isdefined(entity.team)) {
            plunder_updateanchoredwidgetforplayers(entity, scripts\mp\utility\teams::getfriendlyplayers(entity.team));
        }
    } else if (isdefined(data.timestamp) && data.timestamp < gettime()) {
        data.plundereventamount = undefined;
    }
    data.timestamp = gettime();
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf54
// Size: 0x47
function plunder_clearrepositorywidgetforplayer(player, delay) {
    player endon("disconnect");
    player endon("plunder_sendRepositoryWidgetOmnvar");
    player.plunderrepositorywidget = undefined;
    if (isdefined(delay) && delay > 0) {
        wait delay;
    }
    player setclientomnvar("ui_br_plunder_repository", 0);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafa3
// Size: 0x175
function plunder_sendrepositorywidgetomnvar(player) {
    player notify("plunder_sendRepositoryWidgetOmnvar");
    data = player.plunderrepositorywidget;
    if (!isdefined(data)) {
        player setclientomnvar("ui_br_plunder_repository", 0);
        return;
    }
    value = 0;
    bit = 0;
    payload = data.visible;
    payloadsize = 1;
    if (isdefined(payload)) {
        value |= int(payload) << bit;
    }
    bit += payloadsize;
    payload = data.type;
    payloadsize = 1;
    if (isdefined(payload)) {
        value |= int(payload) << bit;
    }
    bit += payloadsize;
    payload = data.endtime;
    payloadsize = 14;
    if (isdefined(payload)) {
        payload = int(payload / 250);
        payload &= 16383;
        value |= int(payload) << bit;
    }
    bit += payloadsize;
    if (data.type == 0) {
        payload = data.plundertotal;
        payloadsize = 10;
        if (isdefined(payload)) {
            payload = int(payload / 5);
            payload &= 1023;
            value |= int(payload) << bit;
        }
    }
    var_8661d51d71f341f = data.plundereventamount;
    if (isdefined(var_8661d51d71f341f)) {
        var_8661d51d71f341f = int(var_8661d51d71f341f / 5);
        player setclientomnvar("ui_br_plunder_repository_event_amount", var_8661d51d71f341f);
    }
    player setclientomnvar("ui_br_plunder_repository", value);
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb120
// Size: 0x276
function plunder_addanchoredwidgettorepositoryinstance(entity) {
    leveldata = level.plunderrepositories;
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!istrue(var_464eb48901113eb0.teamanchoredwidget)) {
        return;
    }
    assertex(istrue(var_464eb48901113eb0.teamuseonly), "anchored widgets are only supported for team only repositories.");
    if (!isdefined(leveldata.teamanchoredwidgetinstances[entity.team])) {
        leveldata.teamanchoredwidgetinstances[entity.team] = [];
    }
    var_bd73cc979462cac0 = [];
    for (i = 1; i <= 4; i++) {
        var_bd73cc979462cac0[i] = i;
    }
    foreach (instance in leveldata.teamanchoredwidgetinstances[entity.team]) {
        var_bd73cc979462cac0[instance.anchoredwidgetid] = undefined;
    }
    foreach (anchoredwidgetid in var_bd73cc979462cac0) {
        entity.anchoredwidgetid = anchoredwidgetid;
        break;
    }
    if (isdefined(entity.anchoredwidgetid)) {
        leveldata.teamanchoredwidgetinstances[entity.team] = array_add(leveldata.teamanchoredwidgetinstances[entity.team], entity);
        var_62aae91e274e22d5 = leveldata.teamanchoredentomnvars[entity.anchoredwidgetid];
        foreach (player in scripts\mp\utility\teams::getfriendlyplayers(entity.team)) {
            player setclientomnvar(var_62aae91e274e22d5, entity getentitynumber());
        }
        return;
    }
    assertmsg("too many repositories with anchored widgets added for team " + entity.team + ".");
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb39e
// Size: 0x149
function plunder_removeanchoredwidgetfromrepositoryinstance(entity) {
    leveldata = level.plunderrepositories;
    id = entity.anchoredwidgetid;
    if (!isdefined(id)) {
        return;
    }
    entity.anchoredwidgetid = undefined;
    leveldata.teamanchoredwidgetinstances[entity.team] = array_remove(leveldata.teamanchoredwidgetinstances[entity.team], entity);
    if (leveldata.teamanchoredwidgetinstances[entity.team].size == 0) {
        leveldata.teamanchoredwidgetinstances[entity.team] = undefined;
    }
    var_62aae91e274e22d5 = leveldata.teamanchoredentomnvars[id];
    var_634e557aa9552052 = leveldata.teamanchoredinfoomnvars[id];
    foreach (player in scripts\mp\utility\teams::getfriendlyplayers(entity.team)) {
        player setclientomnvar(var_62aae91e274e22d5, -1);
        player setclientomnvar(var_634e557aa9552052, 0);
    }
}

// Namespace br_plunder / scripts\mp\gametypes\br_plunder
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4ef
// Size: 0x198
function plunder_updateanchoredwidgetforplayers(entity, players) {
    leveldata = level.plunderrepositories;
    if (!isdefined(entity.anchoredwidgetid)) {
        return;
    }
    if (!isarray(players)) {
        players = [players];
    }
    if (players.size == 0) {
        return;
    }
    value = 0;
    bit = 0;
    payload = 1;
    payloadsize = 1;
    value += payload;
    bit += payloadsize;
    payload = entity.plundercountdownendtime;
    payloadsize = 14;
    if (isdefined(payload)) {
        payload /= 250;
        payload = int(min(payload, 16383));
        value += payload << bit;
    }
    bit += payloadsize;
    payload = entity.plundertotal;
    payloadsize = 10;
    if (isdefined(payload)) {
        payload /= 5;
        payload = int(min(payload, 1023));
        value += payload << bit;
    }
    var_634e557aa9552052 = leveldata.teamanchoredinfoomnvars[entity.anchoredwidgetid];
    foreach (player in players) {
        if (array_contains(entity.playersusing, player)) {
            player setclientomnvar(var_634e557aa9552052, value & -2);
            continue;
        }
        player setclientomnvar(var_634e557aa9552052, value);
    }
}

/#

    // Namespace br_plunder / scripts\mp\gametypes\br_plunder
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb68f
    // Size: 0xab
    function function_697ba36fc0e3cde4() {
        setdevdvarifuninitialized(@"hash_1ede0bb893291602", 0);
        while (true) {
            if (getdvarint(@"hash_1ede0bb893291602", 0) > 0) {
                foreach (player in level.players) {
                    player playerplunderpickup(getdvarint(@"hash_1ede0bb893291602", 0), undefined, 1);
                }
            }
            setdevdvar(@"hash_1ede0bb893291602", 0);
            wait 1;
        }
    }

#/
