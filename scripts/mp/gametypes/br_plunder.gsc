// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
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
#using script_4c770a9a4ad7659c;
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5b
// Size: 0x45f
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
    namespace_35493d8b6027046f::fulton_init();
    initteamdatafields();
    inithelirepository();
    if (getdvarint(@"hash_91fbc1bbac0c27d7", 0) == 1) {
        processcashpilevalueoverrides();
    }
    namespace_c5622898120e827f::function_eca79fa0f341ee08(0, &dangercircletick, &function_1a1709943670772a);
    if (!namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        function_f1aed36ab4598ea("eqp_extraction_balloon");
    }
    /#
        thread function_d998045c08ec165d();
        setdevdvarifuninitialized(@"hash_69a2288a8b47e1b5", 0);
        setdevdvarifuninitialized(@"hash_f38b8e35f5c48796", 0);
        if (0) {
            debug_calculatecashonground();
        }
        level thread function_697ba36fc0e3cde4();
    #/
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0xb8
function plunder_economy_shapshot_loop(duration, safecircleent, var_fb3b2613d6f0eb05) {
    level endon("game_ended");
    level waittill("prematch_started");
    while (1) {
        level waittill("br_circle_started");
        activeplayers = [];
        foreach (player in level.players) {
            if (!player namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(player)) {
                activeplayers[activeplayers.size] = player;
            }
        }
        namespace_a011fbf6d93f25e5::branalytics_economy_snapshot(activeplayers);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f80
// Size: 0xad
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2034
// Size: 0x4d
function modify_plunder_itemsinworld(itemname, var_bc23ce7464aa4861) {
    if (level.br_plunder_enabled) {
        level.br_plunder.itemsinworld[itemname] = level.br_plunder.itemsinworld[itemname] + var_bc23ce7464aa4861;
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2088
// Size: 0x288
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
            /#
                assert(level.br_plunder.quantity[i - 1] < level.br_plunder.quantity[i]);
            #/
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2317
// Size: 0xde
function initvo() {
    /#
        assert(isdefined(game["dialog"]));
    #/
    if (!namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        game["dialog"]["plunder_extract_requested"] = "pxrq_grav_plnd";
        game["dialog"]["plunder_extract_chopper_arrive"] = "pxcr_grav_plnd";
        game["dialog"]["plunder_extract_chopper_leave"] = "pxcl_grav_plnd";
        game["dialog"]["plunder_extract_success"] = "pxcl_grav_plnd";
        game["dialog"]["plunder_extract_fail_chopper"] = "pxfc_grav_plnd";
    } else {
        game["dialog"]["plunder_extract_requested"] = "plunder_plunder_extract_requested";
        game["dialog"]["plunder_extract_chopper_arrive"] = "plunder_plunder_extract_chopper_arrive";
        game["dialog"]["plunder_extract_chopper_leave"] = "plunder_plunder_extract_chopper_leave";
        game["dialog"]["plunder_extract_success"] = "plunder_plunder_extract_success";
        game["dialog"]["plunder_extract_fail_chopper"] = "plunder_plunder_extract_fail_chopper";
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23fc
// Size: 0x1b
function initplunderpads() {
    level.plunderpads = getentarray("extract_pad", "targetname");
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241e
// Size: 0x50
function playerplaybankanim() {
    if (self isswitchingweapon() || self isreloading() || self ismantling() || self isthrowinggrenade() || self israisingweapon() || self ismeleeing()) {
        return;
    }
    namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_cash_handoff", 1.84);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2475
// Size: 0x6d
function playerremoveplunderfrominventory() {
    foreach (index, item in self.br_inventory_slots) {
        if (item.scriptablename == "brloot_plunder_cash_uncommon_1") {
            namespace_d3d40f75bb4e4c32::removeitemfrominventory(index);
            return;
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e9
// Size: 0x6e
function disablealldepotsforplayer(player) {
    if (isdefined(level.br_depots)) {
        for (i = 0; i < level.br_depots.size; i++) {
            var_fb7c65e67a8eed31 = level.br_depots[i];
            if (isdefined(var_fb7c65e67a8eed31) && !istrue(var_fb7c65e67a8eed31.disabled)) {
                var_fb7c65e67a8eed31 depotmakeunusabletoplayer(player);
            }
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255e
// Size: 0x61
function enablealldepotsforplayer(player) {
    for (i = 0; i < level.br_depots.size; i++) {
        var_fb7c65e67a8eed31 = level.br_depots[i];
        if (isdefined(var_fb7c65e67a8eed31) && !istrue(var_fb7c65e67a8eed31.disabled)) {
            var_fb7c65e67a8eed31 depotmakeusabletoplayer(player);
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c6
// Size: 0x32
function depotmakeusabletoplayer(player) {
    self enableplayeruse(player);
    if (isdefined(self.objectiveiconid)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objectiveiconid, player);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ff
// Size: 0x32
function depotmakeunusabletoplayer(player) {
    self disableplayeruse(player);
    if (isdefined(self.objectiveiconid)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objectiveiconid, player);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2638
// Size: 0x37
function depotmakeunsabletoall() {
    self makeunusable();
    if (isdefined(self.objectiveiconid)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.objectiveiconid);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2676
// Size: 0xd9
function initplayer(var_9156b53bcf7ce573) {
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
        if (!istrue(var_9156b53bcf7ce573) && namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            namespace_a38a2e1fe7519183::function_7d760edc2a7e9b8f(self);
            var_dc4fdc0d3e50e80b = namespace_a38a2e1fe7519183::function_56ec0560843aa9a4(self);
            var_dc4fdc0d3e50e80b = function_53c4c53197386572(var_dc4fdc0d3e50e80b, 0);
        }
        /#
            var_61b7c9fb211d6d0e = getdvarint(@"hash_729ed018713fcb98", 0);
            if (!istrue(var_9156b53bcf7ce573) && var_61b7c9fb211d6d0e > 0) {
                var_dc4fdc0d3e50e80b = var_61b7c9fb211d6d0e;
            }
        #/
        playersetplundercount(var_dc4fdc0d3e50e80b);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2756
// Size: 0x19
function playerdropplunder() {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    playersetplundercount(0);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2776
// Size: 0x8b
function bankplunderongameended() {
    level waittill("game_ended");
    foreach (player in level.players) {
        if (isdefined(player.plundercount) && player.plundercount > 0) {
            player playerplunderbank(player.plundercount);
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2808
// Size: 0xb1
function playerdropplunderondeath(dropstruct, attacker, var_1ad2db70c8d01f51) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    if (istrue(namespace_71073fa38f11492::runbrgametypefunc("playerDropPlunderOnDeath", dropstruct, attacker))) {
        return;
    }
    var_cb4fad49263e20c4 = function_79275e2fab13f54d();
    var_6aee9c9054f09ed5 = var_cb4fad49263e20c4.var_6aee9c9054f09ed5;
    var_b64f283113c99581 = var_cb4fad49263e20c4.var_b64f283113c99581;
    self.plundercountondeath = var_6aee9c9054f09ed5;
    playersetplundercount(var_6aee9c9054f09ed5);
    if (var_b64f283113c99581 <= 0) {
        return;
    }
    dropstruct.var_13ac9eca292f815 = self.team;
    dropcondensedplunder(var_b64f283113c99581, dropstruct, var_1ad2db70c8d01f51);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c0
// Size: 0x251
function function_79275e2fab13f54d() {
    var_2927ed03b21bb4fd = getmatchrulesdata("brData", "plunderInflation");
    save = getmatchrulesdata("brData", "plunderSaveShare");
    var_e9b068032ac9d846 = getmatchrulesdata("brData", "plunderTaxShare");
    drop = getmatchrulesdata("brData", "plunderDropShare");
    if (namespace_cb965d2f71fefddc::function_e351a4b1c26ec991("life_insurance")) {
        var_a15a2585e2a11eeb = getdvarfloat(@"hash_8c811d887e1f3fa0", 10);
        save = save + var_a15a2585e2a11eeb;
    }
    if (isdefined(self.var_c6ae3b455bfb5ac6)) {
        var_34743559ad5849d2 = var_e9b068032ac9d846 * self.var_c6ae3b455bfb5ac6;
        var_dbe772ab22f34114 = drop * self.var_c6ae3b455bfb5ac6;
        save = save + drop - var_dbe772ab22f34114 + var_e9b068032ac9d846 - var_34743559ad5849d2;
        drop = var_dbe772ab22f34114;
        var_e9b068032ac9d846 = var_34743559ad5849d2;
    }
    var_2ce07ac87b732035 = save + var_e9b068032ac9d846 + drop;
    var_781b96da8b886296 = save / var_2ce07ac87b732035;
    var_5770ab9ff77a3d04 = var_e9b068032ac9d846 / var_2ce07ac87b732035;
    var_745a0ba506902bfa = drop / var_2ce07ac87b732035;
    if (isdefined(self.plundercount) && self.plundercount > 0) {
        var_258681915091f653 = self.plundercount * var_2927ed03b21bb4fd;
    } else {
        var_258681915091f653 = 0;
    }
    if (isdefined(level.gulag) && namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        var_6aee9c9054f09ed5 = int(var_258681915091f653);
        var_b64f283113c99581 = 0;
    } else {
        var_6aee9c9054f09ed5 = int(min(var_258681915091f653, max(2, int(var_258681915091f653 * var_781b96da8b886296))) + 0.5);
        var_b64f283113c99581 = int(max(level.minplunderdropondeath, int(var_258681915091f653 * var_745a0ba506902bfa)));
    }
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "resurgence_mgl" || namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "champion") {
        lowerbound = getmatchrulesdata("brData", "plunderResurgenceLowerBound");
        if (var_6aee9c9054f09ed5 < lowerbound) {
            var_6aee9c9054f09ed5 = lowerbound;
        }
    }
    var_cb4fad49263e20c4 = spawnstruct();
    var_cb4fad49263e20c4.var_6aee9c9054f09ed5 = var_6aee9c9054f09ed5;
    var_cb4fad49263e20c4.var_b64f283113c99581 = var_b64f283113c99581;
    return var_cb4fad49263e20c4;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b19
// Size: 0x22b
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
        if (isdefined(pickupent.instance)) {
            goto LOC_000000e5;
        }
        var_9516b1b63f4da10c = undefined;
        data = {var_9516b1b63f4da10c:var_9516b1b63f4da10c, var_7d329a9bed628571:var_7d329a9bed628571};
        playerplunderpickup(amount, data, undefined, 1);
        level.br_plunder.plunder_items_picked_up = level.br_plunder.plunder_items_picked_up + 1;
        level.br_plunder.plunder_value_picked_up = level.br_plunder.plunder_value_picked_up + amount;
        namespace_c6ccccd95254983f::modify_plunder_itemsinworld(pickupent.scriptablename, -1);
        type = "loot";
        if (isdefined(pickupent.instance) && isdefined(pickupent.instance.lootsource)) {
            type = pickupent.instance.lootsource;
        }
        namespace_a011fbf6d93f25e5::trackcashevent(self, type, amount);
        if (var_7d329a9bed628571) {
            return;
        }
        function_5a2284274d70f7d(0, amount);
    } else {
        namespace_cb965d2f71fefddc::trypickupitem(pickupent.scriptablename, amount);
    }
    params = {amount:amount, pickupent:pickupent};
    namespace_7f0bcee5d45a1dea::callback("plunder_pickup", params);
    level notify("collect_cash_" + self.team, self);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4b
// Size: 0x46
function function_5efeff555d3c3ab4(itemname) {
    switch (itemname) {
    case #"hash_499bd626715353e3":
        return 0;
    case #"hash_4ce6dd1c9ebdc3ec":
        return 1;
        break;
    }
    namespace_9c840bb9f2ecbf00::demoforcesre("Persistent item "" + itemname + "" does not have a corresponding omnvar bit.");
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d98
// Size: 0x7f
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1e
// Size: 0x72
function playerplunderpickup(amount, data, var_3108c5d4e33b7014, var_cc1314400858994c) {
    data = playerplunderevent(amount, 1, undefined, data, var_3108c5d4e33b7014);
    if (!istrue(var_cc1314400858994c) && isdefined(data) && isdefined(data.plunderdelta) && data.plunderdelta > 0) {
        namespace_aad14af462a74d08::function_563606223ef09517(self, data.plunderdelta);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2e97
// Size: 0x27
function playerplunderdeposit(amount, entity, data) {
    return playerplunderevent(amount, 2, entity, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec6
// Size: 0x27
function playerplunderbank(amount, entity, data) {
    return playerplunderevent(amount, 3, entity, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef5
// Size: 0x1f
function playerplunderlose(amount, data) {
    return playerplunderevent(amount, 4, undefined, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1c
// Size: 0x27
function playerplunderbankdeposit(amount, entity, data) {
    return playerplunderevent(amount, 5, entity, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4b
// Size: 0x27
function playerplunderlosedeposit(amount, entity, data) {
    return playerplunderevent(amount, 6, entity, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7a
// Size: 0xbc
function playerplunderkioskpurchase(amount, data) {
    var_b44212e15fce8588 = playerplunderevent(amount, 4, undefined, data);
    if (isdefined(var_b44212e15fce8588)) {
        var_b70c878de3673730 = "highestPurchaseCost";
        if (!isdefined(self.pers[var_b70c878de3673730]) || self.pers[var_b70c878de3673730] < amount) {
            self.pers[var_b70c878de3673730] = amount;
        }
    }
    if (namespace_cb965d2f71fefddc::function_e351a4b1c26ec991("credit_card")) {
        var_71620739ffd8161 = amount * getdvarfloat(@"hash_81e74d71f032f681", 0.1);
        playerplunderpickup(int(var_71620739ffd8161));
        function_5a2284274d70f7d(0, var_71620739ffd8161);
    }
    function_5a2284274d70f7d(4, amount);
    return var_b44212e15fce8588;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303e
// Size: 0x1f
function playerplunderdrop(amount, data) {
    return playerplunderevent(amount, 4, undefined, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3065
// Size: 0x1f
function function_2334bcc55c8a6242(amount, data) {
    return playerplunderevent(amount, 1, undefined, data);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308c
// Size: 0x523
function playerplunderevent(amount, type, entity, data, var_3108c5d4e33b7014) {
    if (!istrue(level.br_plunder_enabled) || !isdefined(self.plundercount)) {
        return;
    }
    if (istrue(var_3108c5d4e33b7014) && amount <= 0) {
        return;
    }
    /#
        if (level.gameended && amount == 0) {
            return;
        }
    #/
    /#
        assertex(isdefined(level.playerplundereventomnvars), "playerPlunderEvent() was called before initPlayerPlunderEvents().");
    #/
    /#
        assertex(amount > 0, "playerPlunderEvent amount must be a positive value.  Example: player playerPlunderEvent( 500, PLUNDER_EVENT_TYPE_LOSE ).");
    #/
    /#
        var_40ef999c46820a15 = validateplundereventtype(type);
        if (!var_40ef999c46820a15) {
            /#
                assertmsg("plunder_extract_requested");
            #/
        }
    #/
    if (type == 2 || type == 3 || type == 4) {
        amount = int(min(self.plundercount, amount));
    }
    if (type == 1 && isdefined(self.var_bc440201cf10cbd4) && isdefined(data) && !istrue(data.var_7d329a9bed628571)) {
        var_3b039a52d157112 = isdefined(data.var_9516b1b63f4da10c) && self.team == data.var_9516b1b63f4da10c;
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
    plundereventtotal = plundereventtotal + amount;
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
            if (isdefined(data.playersplash) && data.playersplash != "none" && !data.player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                if (data.playersplash != "br_plunder_first_pickup" || !istrue(data.player.haspickedupplunderyet)) {
                    if (!namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
                        data.player thread namespace_44abc05161e2e2cb::showsplash(data.playersplash, undefined, undefined, undefined, undefined, data.var_d07ee9ee6561c7b6);
                    }
                    if (data.playersplash == "br_plunder_first_pickup") {
                        data.player.haspickedupplunderyet = 1;
                    }
                }
            }
            if (isdefined(data.playerscoreeventref) && (!isdefined(data.playerscoreeventvalue) || data.playerscoreeventvalue > 0)) {
                data.player thread namespace_48a08c5037514e04::doScoreEvent(data.playerscoreeventref, undefined, data.playerscoreeventvalue);
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
        amount = amount * -1;
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b7
// Size: 0x99
function function_5a2284274d70f7d(var_cb99e7b595819c28, amount) {
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
    self.var_db548fc480c33eac[var_cb99e7b595819c28] = self.var_db548fc480c33eac[var_cb99e7b595819c28] + amount;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3657
// Size: 0xfe
function packextrascore0(data) {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    if (getsubgametype() == "kingslayer" || getsubgametype() == "resurgence" || getsubgametype() == "resurgence_mgl" || getsubgametype() == "zonecontrol") {
        return;
    }
    var_81dab8953b9df82 = 0;
    var_b87f7fae01ce754f = 0;
    if (isdefined(self.plundercount)) {
        var_b87f7fae01ce754f = var_b87f7fae01ce754f + self.plundercount;
    }
    if (isdefined(self.plunderbanked)) {
        var_b87f7fae01ce754f = var_b87f7fae01ce754f + self.plunderbanked;
    }
    var_b87f7fae01ce754f = int(var_b87f7fae01ce754f / 10);
    if (var_b87f7fae01ce754f > 4095) {
        var_b87f7fae01ce754f = 4095;
    }
    var_81dab8953b9df82 = var_b87f7fae01ce754f;
    var_c5c0c138d608be6a = 0;
    if (isdefined(self.brmissionscompleted)) {
        var_c5c0c138d608be6a = var_c5c0c138d608be6a + self.brmissionscompleted;
    }
    if (var_c5c0c138d608be6a > 15) {
        var_c5c0c138d608be6a = 15;
    }
    var_81dab8953b9df82 = var_81dab8953b9df82 + (var_c5c0c138d608be6a << 12);
    namespace_3c5a4254f2b957ea::setextrascore0(var_81dab8953b9df82);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x375c
// Size: 0x75
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
        break;
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d8
// Size: 0x51
function playerplunderpickupcallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    if (!istrue(self.haspickedupplunderyet)) {
        data.playersplash = "br_plunder_first_pickup";
        thread namespace_a4b43c1cf86c6fe5::showdiscountsplash();
    }
    return data;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3831
// Size: 0x294
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
                amount = amount - overflow;
                if (!istrue(entity.plunderatcapacity)) {
                    plunder_repositoryatcapacity(entity);
                }
            }
        }
        append = 1;
        foreach (entry in entity.plunder) {
            player = entry.player;
            if (isdefined(player) && player == self) {
                entry.plundercount = entry.plundercount + amount;
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
    entity.plundertotal = entity.plundertotal + amount;
    if (!isdefined(level.teamdata[self.team]["plunderInDeposit"])) {
        level.teamdata[self.team]["plunderInDeposit"] = int(amount);
    } else {
        level.teamdata[self.team]["plunderInDeposit"] = level.teamdata[self.team]["plunderInDeposit"] + int(amount);
    }
    return data;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3acd
// Size: 0x223
function playerplunderbankcallback(amount, entity, data) {
    /#
        assertex(isdefined(self.plundercount) && amount <= self.plundercount, "Cannot bank more plunder than the player has.");
    #/
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
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        data.playerscoreeventref = ter_op(brgametype == "plunder" || brgametype == "risk", #"hash_70c9f312b8e0bf01", #"plunder_cash");
    }
    if (!isdefined(data.playerscoreeventvalue)) {
        data.playerscoreeventvalue = int(namespace_62c556437da28f50::getscoreinfovalue(data.playerscoreeventref) * amount / 10);
    }
    if (!isdefined(data.playplundersound)) {
        data.playplundersound = 1;
        data.plundersoundamount = undefined;
    }
    if (!isdefined(data.playanimation)) {
        data.playanimation = 1;
    }
    self.plunderbanked = self.plunderbanked + amount;
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf8
// Size: 0x2b
function playerplunderlosecallback(amount, entity, data) {
    if (!isdefined(data)) {
        data = createplayerplundereventdata(self);
    }
    return data;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2b
// Size: 0x292
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
                entry.plundercount = entry.plundercount - amount;
                if (entry.plundercount == 0) {
                    entity.plunder[id] = undefined;
                }
                self.plunderbanked = self.plunderbanked + amount;
                if (self.plunderbanked > level.br_plunder.plunderlimit) {
                    self.plunderbanked = level.br_plunder.plunderlimit;
                }
                break;
            }
        }
        if (!isdefined(data.playerscoreeventref)) {
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            data.playerscoreeventref = ter_op(brgametype == "plunder" || brgametype == "risk", #"hash_70c9f312b8e0bf01", #"plunder_cash");
        }
        if (!isdefined(data.playerscoreeventvalue)) {
            data.playerscoreeventvalue = int(namespace_62c556437da28f50::getscoreinfovalue(data.playerscoreeventref) * amount / 10);
        }
    }
    amount = int(amount);
    level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
    level.teamdata[team]["plunderBanked"] = level.teamdata[team]["plunderBanked"] + amount;
    return data;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc5
// Size: 0x171
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
                entry.plundercount = entry.plundercount - amount;
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413e
// Size: 0x3fa
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
        /#
            assertex(isdefined(entry.team), "Plunder deposited without a player or a team.");
        #/
        level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
        level.teamdata[team]["plunderBanked"] = level.teamdata[team]["plunderBanked"] + amount;
        data.amounttotal = data.amounttotal + amount;
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
        var_84dcd1ab2ae1dffa = undefined;
        if (isdefined(data)) {
            var_84dcd1ab2ae1dffa = copyplayerplundereventdata(data, player, team);
        }
        var_84dcd1ab2ae1dffa.dontcallpostplunder = 1;
        var_84dcd1ab2ae1dffa = player playerplunderbankdeposit(amount, self, var_84dcd1ab2ae1dffa);
        if (isdefined(var_84dcd1ab2ae1dffa) && isdefined(var_84dcd1ab2ae1dffa.amount)) {
            amount = var_84dcd1ab2ae1dffa.amount;
        }
        data.amounttotal = data.amounttotal + amount;
        data.teams[data.teams.size] = team;
        data.numdepositers++;
    }
    method = "fulton";
    if (isdefined(self.classname) && self.classname == "script_vehicle") {
        method = "little_bird";
    }
    data.teams = array_remove_duplicates(data.teams);
    var_d9f59dce4a1fc81a = 0;
    if (data.teams.size > 1) {
        var_d9f59dce4a1fc81a = 1;
    } else if (data.teams.size == 1 && data.teams[0] != self.team) {
        var_d9f59dce4a1fc81a = 1;
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(self.plunderrepositoryref, undefined, 1);
    if (isdefined(var_464eb48901113eb0) && isdefined(var_464eb48901113eb0.extractionmethod)) {
        namespace_a011fbf6d93f25e5::branalytics_plunder_extraction_success(data.numdepositers, data.amounttotal, var_464eb48901113eb0.extractionmethod, var_d9f59dce4a1fc81a, self.origin);
    }
    if (!isdefined(data) || !istrue(data.dontcallpostplunder)) {
        thread namespace_71073fa38f11492::runbrgametypefunc("postPlunder", data);
    }
    self.plunder = [];
    return data;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4540
// Size: 0x2ea
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
        /#
            assertex(isdefined(entry.team), "Plunder deposited without a player or a team.");
        #/
        level.teamdata[team]["plunderInDeposit"] = level.teamdata[team]["plunderInDeposit"] - amount;
        data.amounttotal = data.amounttotal + amount;
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
        var_84dcd1ab2ae1dffa = undefined;
        if (isdefined(data)) {
            var_84dcd1ab2ae1dffa = copyplayerplundereventdata(data, player, team);
        }
        var_84dcd1ab2ae1dffa.dontcallpostplunder = 1;
        player playerplunderlosedeposit(amount, self, var_84dcd1ab2ae1dffa);
        if (isdefined(var_84dcd1ab2ae1dffa) && isdefined(var_84dcd1ab2ae1dffa.amount)) {
            amount = var_84dcd1ab2ae1dffa.amount;
        }
        data.amounttotal = data.amounttotal + amount;
        data.teams[data.teams.size] = team;
        var_96c4a8c24e604cad = var_96c4a8c24e604cad + amount;
    }
    if (!isdefined(data) || !istrue(data.dontcallpostplunder)) {
        thread namespace_71073fa38f11492::runbrgametypefunc("postPlunder", data);
    }
    self.plunder = [];
    if (istrue(dropplunder)) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        dropplunderbyrarity(data.amounttotal, dropstruct);
    }
    return data;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4832
// Size: 0x8f
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c9
// Size: 0x180
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a51
// Size: 0x264
function playersetplundercount(plundercount, data) {
    if (!isdefined(self.plundercount)) {
        self.plundercount = 0;
    }
    plunderdelta = plundercount - self.plundercount;
    if ((!isdefined(data) || !istrue(data.setplunderifunchanged)) && plunderdelta == 0) {
        return;
    }
    /#
        assert(isint(plundercount));
    #/
    self.plundercount = plundercount;
    if (isdefined(level.br_plunder) && self.plundercount > level.br_plunder.plunderlimit) {
        namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/PLUNDER_HELD_LIMIT_REACHED");
        self.plundercount = level.br_plunder.plunderlimit;
    }
    if (isdefined(self.petwatch)) {
        namespace_74465391b3cf76b::onplayergetsplunder();
    }
    if (isdefined(level.var_db78248e94853165) && isdefined(level.var_db78248e94853165.var_f5eb9b1ad1613bca)) {
        self [[ level.var_db78248e94853165.var_f5eb9b1ad1613bca ]]();
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
        thread namespace_71073fa38f11492::runbrgametypefunc("postPlunder", data);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cbc
// Size: 0x2d
function playersetplunderomnvar(value) {
    var_ff986c1c69cc1cd6 = value / 100;
    namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(19, var_ff986c1c69cc1cd6);
    namespace_14f37777effc564d::playersetplunderomnvar(value);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf0
// Size: 0x7f
function getpackeddata(value, var_7009da06a8a620cb, var_64571e3aeccd1a07, var_8534515023afc188) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ed711aeaf5e8cb76 = var_7009da06a8a620cb & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    return var_82a90e56e416fa55;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d77
// Size: 0x180
function playergetplunderomnvarbitpackinginfo() {
    var_64571e3aeccd1a07 = 0;
    var_8534515023afc188 = 0;
    var_8e90fa6d5789ad63 = "";
    switch (self.var_3f78c6a0862f9e25) {
    case 1:
        var_c00a316249963882 = [0:0, 1:17, 2:"ui_br_plunder_count"];
        var_8e90fa6d5789ad63 = var_c00a316249963882[2];
        var_8534515023afc188 = var_c00a316249963882[1];
        var_64571e3aeccd1a07 = var_c00a316249963882[0];
        break;
    case 2:
        var_c00a346249963f1b = [0:17, 1:17, 2:"ui_br_plunder_count"];
        var_8e90fa6d5789ad63 = var_c00a346249963f1b[2];
        var_8534515023afc188 = var_c00a346249963f1b[1];
        var_64571e3aeccd1a07 = var_c00a346249963f1b[0];
        break;
    case 3:
        var_c00a336249963ce8 = [0:0, 1:17, 2:"ui_br_plunder_count2"];
        var_8e90fa6d5789ad63 = var_c00a336249963ce8[2];
        var_8534515023afc188 = var_c00a336249963ce8[1];
        var_64571e3aeccd1a07 = var_c00a336249963ce8[0];
        break;
    case 4:
        var_bffcba6249871e48 = [0:17, 1:17, 2:"ui_br_plunder_count2"];
        var_8e90fa6d5789ad63 = var_bffcba6249871e48[2];
        var_8534515023afc188 = var_bffcba6249871e48[1];
        var_64571e3aeccd1a07 = var_bffcba6249871e48[0];
        break;
    default:
        /#
            assertmsg("Invalid squad index '" + self.var_3f78c6a0862f9e25 + "' used for packing into plunder omnvar!");
        #/
        break;
    }
    return [0:var_64571e3aeccd1a07, 1:var_8534515023afc188, 2:var_8e90fa6d5789ad63];
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eff
// Size: 0x116
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_52d59c928eb97c81 = var_e86632d645c137d0 + var_5d954f1724092f5a;
    var_d16b5e09ee5dde91 = var_52d59c928eb97c81 * var_52d59c928eb97c81;
    for (i = 0; i < level.br_depots.size; i++) {
        var_fb7c65e67a8eed31 = level.br_depots[i];
        if (isdefined(var_fb7c65e67a8eed31) && !istrue(var_fb7c65e67a8eed31.disabled) && distance2dsquared(var_819edacdacb810e4, var_fb7c65e67a8eed31.origin) > var_d16b5e09ee5dde91) {
            var_fb7c65e67a8eed31 function_28f5f133ca1f9d8();
        }
    }
    for (i = 0; i < level.br_plunder_sites.size; i++) {
        site = level.br_plunder_sites[i];
        if (isdefined(site) && !istrue(site.disabled) && distance2dsquared(var_819edacdacb810e4, site.origin) > var_d16b5e09ee5dde91) {
            site function_8682a8796fd4b35f();
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501c
// Size: 0xe9
function function_1a1709943670772a() {
    if (!istrue(level.br_plunder_enabled) || !istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    for (i = 0; i < level.br_depots.size; i++) {
        var_fb7c65e67a8eed31 = level.br_depots[i];
        if (isdefined(var_fb7c65e67a8eed31) && !istrue(var_fb7c65e67a8eed31.disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(var_fb7c65e67a8eed31.origin)) {
            var_fb7c65e67a8eed31 function_28f5f133ca1f9d8();
        }
    }
    for (i = 0; i < level.br_plunder_sites.size; i++) {
        site = level.br_plunder_sites[i];
        if (isdefined(site) && !istrue(site.disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(site.origin)) {
            site function_8682a8796fd4b35f();
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510c
// Size: 0x25
function function_28f5f133ca1f9d8() {
    var_fb7c65e67a8eed31 = self;
    var_fb7c65e67a8eed31.disabled = 1;
    var_fb7c65e67a8eed31 depotmakeunsabletoall();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5138
// Size: 0x3a
function function_8682a8796fd4b35f() {
    site = self;
    site.disabled = 1;
    site setscriptablepartstate(site.type, site.disabledstate);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5179
// Size: 0x30
function playerplaydepositanim() {
    self endon("death_or_disconnect");
    if (!namespace_d3d40f75bb4e4c32::playercanplaynotcriticalgesture() || self isgestureplaying()) {
        return;
    }
    namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_cash_handoff", 1.84);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51b0
// Size: 0x87
function cratedropplunder() {
    if (!isdefined(self.plunder)) {
        return;
    }
    amount = 0;
    for (i = 0; i < self.plunder.size; i++) {
        amount = amount + self.plunder[i].plundercount;
    }
    self.angles = (0, 0, 0);
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    dropplunderbyrarity(amount, dropstruct);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x523e
// Size: 0x10a
function dropplundersounds(droporigin, var_ce1bd3fdf0fcecf) {
    if (var_ce1bd3fdf0fcecf <= 0) {
        return;
    }
    sndorigin = droporigin + (0, 0, 24);
    sndalias = "";
    wait(0.5);
    switch (var_ce1bd3fdf0fcecf) {
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
    /#
        assert(soundexists(sndalias));
    #/
    playsoundatpos(sndorigin, sndalias);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x534f
// Size: 0x26f
function dropplunderbyrarity(amount, dropstruct, numitems) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_e05413a53b5d9167 = [];
    numspawns = [];
    totalcount = 0;
    maxcount = 6;
    if (isdefined(numitems)) {
        maxcount = numitems;
    }
    for (i = level.br_plunder.quantity.size - 1; i >= 0; i--) {
        numspawns[i] = int(amount / level.br_plunder.quantity[i]);
        numspawns[i] = int(clamp(numspawns[i], 0, maxcount - totalcount));
        totalcount = totalcount + numspawns[i];
        if (amount <= 0 || totalcount >= maxcount) {
            break;
        } else {
            amount = amount - numspawns[i] * level.br_plunder.quantity[i];
        }
    }
    for (var_f90d0e006a1f717b = level.br_plunder.quantity.size - 1; var_f90d0e006a1f717b >= 0; var_f90d0e006a1f717b--) {
        if (!isdefined(numspawns[var_f90d0e006a1f717b])) {
            continue;
        }
        for (itemindex = 0; itemindex < numspawns[var_f90d0e006a1f717b]; itemindex++) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            pickupent = namespace_cb965d2f71fefddc::spawnpickup(level.br_plunder.names[var_f90d0e006a1f717b], var_cb4fad49263e20c4, level.br_plunder.quantity[var_f90d0e006a1f717b], 1);
            namespace_c6ccccd95254983f::modify_plunder_itemsinworld(level.br_plunder.names[var_f90d0e006a1f717b], 1);
            if (isdefined(pickupent)) {
                var_e05413a53b5d9167[var_e05413a53b5d9167.size] = pickupent;
                if (inplunderlivelobby()) {
                    level.br_plunder_ents[level.br_plunder_ents.size] = pickupent;
                }
            }
        }
    }
    level.br_plunder.plunder_items_dropped = level.br_plunder.plunder_items_dropped + totalcount;
    level.br_plunder.plunder_value_dropped = level.br_plunder.plunder_value_dropped + amount;
    level thread dropplundersounds(self.origin, var_e05413a53b5d9167.size);
    return var_e05413a53b5d9167;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55c6
// Size: 0x1d9
function dropcondensedplunder(amount, dropstruct, var_1ad2db70c8d01f51) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_e05413a53b5d9167 = [];
    numspawns = [];
    var_8e0b722357754d9e = 0;
    for (i = level.br_plunder.names.size - 1; i >= 0; i--) {
        if (amount >= level.br_plunder.quantity[i]) {
            var_8e0b722357754d9e = i;
            break;
        }
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
    var_307bcadb5a20bd5e = isalive(self) || istrue(var_1ad2db70c8d01f51) || getdvarint(@"hash_56a4511198080c62", 1);
    pickupent = namespace_cb965d2f71fefddc::spawnpickup(level.br_plunder.names[var_8e0b722357754d9e], var_cb4fad49263e20c4, amount, 1, undefined, var_307bcadb5a20bd5e);
    namespace_c6ccccd95254983f::modify_plunder_itemsinworld(level.br_plunder.names[var_8e0b722357754d9e], 1);
    if (isdefined(pickupent)) {
        pickupent.var_9516b1b63f4da10c = dropstruct.var_13ac9eca292f815;
        var_e05413a53b5d9167[var_e05413a53b5d9167.size] = pickupent;
        if (inplunderlivelobby()) {
            level.br_plunder_ents[level.br_plunder_ents.size] = pickupent;
        }
        namespace_cb965d2f71fefddc::function_2f4e0022c686dbe6(pickupent);
    }
    level.br_plunder.plunder_items_dropped++;
    level.br_plunder.plunder_value_dropped = level.br_plunder.plunder_value_dropped + amount;
    level thread dropplundersounds(self.origin, var_e05413a53b5d9167.size);
    return var_e05413a53b5d9167;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a7
// Size: 0x4c
function isplunderextractionenabled() {
    if (namespace_71073fa38f11492::isfeaturedisabled("plunderSites")) {
        return 0;
    }
    var_7d29e7f909d9b76c = getmatchrulesdata("brData", "plunderSites");
    return istrue(level.br_plunder_enabled) && level.br_plunder_sites.size != 0 && var_7d29e7f909d9b76c;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57fb
// Size: 0x60
function initheliextractanims() {
    level.scr_anim["plunder_extract_heli"]["heli_in"] = mp_vehicles_always_loaded%iw8_br_plunder_heli_in;
    level.scr_anim["plunder_extract_heli"]["heli_loop"] = mp_vehicles_always_loaded%iw8_br_plunder_heli_loop;
    level.scr_anim["plunder_extract_heli"]["heli_out"] = mp_vehicles_always_loaded%iw8_br_plunder_heli_out;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5862
// Size: 0xcf
function inithelipropanims() {
    level.scr_animtree["plunder_extract_heli"] = %script_model;
    level.scr_anim["plunder_extract_heli"]["rope_in"] = script_model%iw8_br_plunder_heli_rope_in;
    level.scr_anim["plunder_extract_heli"]["rope_loop"] = script_model%iw8_br_plunder_heli_rope_loop;
    level.scr_anim["plunder_extract_heli"]["rope_out"] = script_model%iw8_br_plunder_heli_rope_out;
    level.scr_anim["plunder_extract_heli"]["bag_in"] = script_model%iw8_br_plunder_heli_bag_in;
    level.scr_anim["plunder_extract_heli"]["bag_loop"] = script_model%iw8_br_plunder_heli_bag_loop;
    level.scr_anim["plunder_extract_heli"]["bag_out"] = script_model%iw8_br_plunder_heli_bag_out;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5938
// Size: 0x234
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b73
// Size: 0x1b5
function getplunderextractionsites() {
    sites = [];
    if (namespace_36f464722d326bbe::isdonetskmap()) {
        sites = getentitylessscriptablearray("extract_pad", "targetname");
        var_c3fc8aa938c22936 = getentitylessscriptablearray("extract_pad_boneyard", "targetname");
        if (var_c3fc8aa938c22936.size > 0) {
            sites = array_combine(sites, var_c3fc8aa938c22936);
        }
    } else {
        var_6f1b16a6b8446c60 = getentitylessscriptablearray("plunder_extraction_01", "targetname");
        var_6f1b19a6b84472f9 = getentitylessscriptablearray("plunder_extraction_02", "targetname");
        sites = array_combine(var_6f1b16a6b8446c60, var_6f1b19a6b84472f9);
    }
    if (sites.size > 0) {
        foreach (site in sites) {
            site.activestate = "active";
            site.activecurrstate = "activeCurrent";
            site.disabledstate = "visible";
            site.disabledcurrstate = "visible";
        }
        return sites;
    } else {
        sites = getentitylessscriptablearray("plunder_extraction", "targetname");
        foreach (site in sites) {
            site.activestate = "visible";
            site.activecurrstate = "visibleCurrent";
            site.disabledstate = "hidden";
        }
        return sites;
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d2f
// Size: 0x42
function function_c383497e5f14e368(var_cab957adc8d7710f, var_b8e5ca4f7dab36ef) {
    if (!isdefined(level.var_88e8c04e60a1092c)) {
        level.var_88e8c04e60a1092c = [];
    }
    level.var_88e8c04e60a1092c[level.var_88e8c04e60a1092c.size] = var_b8e5ca4f7dab36ef;
    return var_b8e5ca4f7dab36ef;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d79
// Size: 0x465
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
        var_cda8506e90cb3b70 = getentarray("plunder_extraction_visual", "targetname");
        foreach (ent in var_cda8506e90cb3b70) {
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
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&plundersiteused);
    if (isdefined(level.matchstartextractsitedelay) && level.matchstartextractsitedelay > 0 && !istrue(level.usemilestonephases)) {
        wait(level.matchstartextractsitedelay);
    } else if (istrue(level.usemilestonephases)) {
        namespace_4b0406965e556711::gameflagwait("activate_cash_lzs");
    }
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                player namespace_44abc05161e2e2cb::showsplash("bm_extract_heli_start", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61e5
// Size: 0x144
function function_21d60852fb677f98() {
    /#
        level endon("script_vehicle");
        while (1) {
            var_5c328b7d89b63a7c = getdvarint(@"hash_69a2288a8b47e1b5", 0);
            if (var_5c328b7d89b63a7c) {
                break;
            }
            waitframe();
        }
        namespace_17c25f0877bfb620::scriptable_addusedcallback(&plundersiteused);
        foreach (player in level.players) {
            if (isdefined(player)) {
                player namespace_44abc05161e2e2cb::showsplash("br_drop_plunder_01");
            }
        }
        foreach (site in level.br_plunder_sites) {
            scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), site.activecurrstate, site.activestate);
            site setscriptablepartstate(site.type, scriptablestate);
        }
    #/
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6330
// Size: 0x12
function function_ded34f2b3889fdab(var_cab957adc8d7710f) {
    return getallextractspawninstances();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634a
// Size: 0x1f
function getallextractspawninstances() {
    if (!isplunderextractionenabled()) {
        return;
    }
    instances = getplunderextractionsites();
    return instances;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6371
// Size: 0x85
function setextractspawninstances(instances) {
    foreach (site in level.br_plunder_sites) {
        if (!array_contains(instances, site)) {
            site setscriptablepartstate(site.type, "hidden");
        }
    }
    level.br_plunder_sites = instances;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63fd
// Size: 0x160
function debugextractsite(site) {
    /#
        var_df35d1a64f3859c7 = spawn("brloot_quest_extract_site_plunder", site.origin + (0, 0, 1000));
        modelname = "visible";
        vehiclename = "fraction";
        if (istrue(level.var_a83a4e71446bfef7)) {
            modelname = "heli_gone";
            vehiclename = "MP/CANNOT_DEPOSIT_LS";
        }
        var_df35d1a64f3859c7 setmodel(modelname);
        locationx = site.origin[0];
        locationy = site.origin[1];
        var_dc8bb6300463cf1e = 800;
        var_e7a7d619f927d791 = var_df35d1a64f3859c7 tracegroundpoint(site.origin);
        var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
        newpos = (locationx, locationy, var_1dc672cfe0f0128e);
        var_df35d1a64f3859c7.origin = newpos;
        while (1) {
            sphere(newpos, 20, (0, 1, 0), 0, 1);
            sphere((site.origin[0], site.origin[1], var_e7a7d619f927d791), 100, (0, 1, 1), 0, 1);
            waitframe();
        }
    #/
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6564
// Size: 0x147
function plundersiteused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b2
// Size: 0x347
function plundersiteusedinternal(instance, part, state, player) {
    if (isdefined(instance.disabled)) {
        return;
    }
    if (isdefined(instance.heli)) {
        player playerdenyextraction(undefined, "KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        return;
    }
    scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), "inuseCurrent", "inuse");
    instance setscriptablepartstate(instance.type, scriptablestate);
    teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, player.team);
    instance.team = teamindex;
    instance function_fca5bdbe24070d20(instance.type, teamindex);
    var_1230ea36a300368 = getgroundposition(instance.origin, 1) + (0, 0, ter_op(namespace_36f464722d326bbe::function_ba5574c7f287c587(), 2, -9));
    heli = player playerspawnextractchopper(var_1230ea36a300368, instance);
    if (isdefined(heli)) {
        heli.site = instance;
        instance.heli = heli;
        instance.team = player.team;
        thread createsmokesignalfx(var_1230ea36a300368);
        player playerthrowsmokesignal();
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_requested", player.team, 1);
        }
        level thread namespace_d20f8ef223912e12::teamsplashbr("br_extract_heli_incoming", player, player.team, undefined, "splash_list_br_plunder_iw9_mp");
        heli thread heligotoplunderrepository(instance);
    } else {
        playerdenyextraction(undefined, "KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), instance.activecurrstate, instance.activestate);
        instance setscriptablepartstate(instance.type, scriptablestate);
        return;
    }
    if (istrue(level.plunderextractalertnearby)) {
        var_ef269077a28646eb = utility::playersincylinder(instance.origin, 15000);
        var_4725e52b7c3aa25c = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
        foreach (playerent in var_ef269077a28646eb) {
            if (!array_contains(var_4725e52b7c3aa25c, playerent)) {
                playerent thread namespace_44abc05161e2e2cb::showsplash("br_extract_heli_incoming_them", undefined, player, undefined, undefined, "splash_list_br_plunder_iw9_mp");
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a00
// Size: 0x76
function _getsingleplunderextractlocations(var_532388c61e12b9df, var_e296217c9fcd337f) {
    if (var_532388c61e12b9df.size == 0 || var_e296217c9fcd337f == 0) {
        return;
    }
    site = undefined;
    if (var_532388c61e12b9df.size > 0) {
        var_532388c61e12b9df = namespace_3c37cb17ade254d::array_randomize(var_532388c61e12b9df);
        for (i = 0; i < var_532388c61e12b9df.size; i++) {
            if (!array_contains(level.br_plunder_sites, var_532388c61e12b9df[i])) {
                site = var_532388c61e12b9df[i];
                break;
            }
        }
    }
    return site;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a7e
// Size: 0x159
function findnewplunderextractsite(var_eedc39992a492091) {
    var_179ac3acee8f7af6 = _getsingleplunderextractlocations(namespace_c6ccccd95254983f::getallextractspawninstances(), level.maxplunderextractions);
    var_179ac3acee8f7af6.disabled = undefined;
    var_179ac3acee8f7af6.helidisabled = undefined;
    scriptablestate = ter_op(level.showplunderextracticonsinworld && !level.shownonscriptableextracticons, var_179ac3acee8f7af6.activecurrstate, var_179ac3acee8f7af6.activestate);
    var_179ac3acee8f7af6 setscriptablepartstate(var_179ac3acee8f7af6.type, scriptablestate);
    if (level.showplunderextracticonsinworld && level.shownonscriptableextracticons) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_eedc39992a492091.locale.objectiveiconid);
        var_eedc39992a492091.locale.objectiveiconid = -1;
        locale = spawnstruct();
        locale namespace_4bc0ead8d2af3d84::createquestobjicon("ui_mp_br_mapmenu_icon_atm", "current", var_179ac3acee8f7af6.origin + (0, 0, 200));
        var_179ac3acee8f7af6.locale = locale;
    }
    level.br_plunder_sites = array_remove(level.br_plunder_sites, var_eedc39992a492091);
    level.br_plunder_sites = array_add(level.br_plunder_sites, var_179ac3acee8f7af6);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bde
// Size: 0x1b
function playerthrowsmokesignal() {
    self endon("death_or_disconnect");
    namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_plunder_smoke", 1.867);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c00
// Size: 0x4b
function playerdenyextraction(weaponobject, var_734564ff3d4fd467) {
    self iprintlnbold(var_734564ff3d4fd467);
    self playlocalsound("br_pickup_deny");
    if (isdefined(weaponobject)) {
        ammo = self getweaponammoclip(weaponobject);
        self setweaponammoclip(weaponobject, ammo + 1);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c52
// Size: 0xb4
function createsmokesignalfx(position) {
    wait(1.35);
    fxent = spawn("script_model", position);
    fxent setmodel("scr_smoke_grenade");
    fxent.angles = (0, 90, 90);
    fxent playsound("smoke_carepackage_expl_trans");
    fxent playloopsound("smoke_carepackage_smoke_lp");
    fxent setscriptablepartstate("smoke", "on");
    wait(17);
    fxent endon("death");
    fxent setscriptablepartstate("smoke", "dissipate");
    fxent playsound("smoke_canister_tail_dissipate");
    wait(1);
    fxent stoploopsound();
    wait(4.5);
    fxent delete();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0d
// Size: 0x1e5
function playerspawnextractchopper(position, site) {
    extractgroundpos = position;
    var_db4adba9675a31aa = extractgroundpos + (0, 0, 2000);
    var_cc089176a2d8ab71 = extractgroundpos + (0, 0, 8000);
    var_7ce2ef2a1efe71a6 = extractgroundpos + (0, 0, 800);
    flightyaw = 0;
    var_fda870b32ab92c1f = (0, 0, 0);
    var_d7c5ff139c995ba6 = getdvarint(@"hash_f38b8e35f5c48796", 0);
    if (var_d7c5ff139c995ba6) {
        var_7b021c6ffbdb9959 = getextractionpadent(extractgroundpos);
        if (isdefined(var_7b021c6ffbdb9959)) {
            var_d43b7286bf6e17a3 = var_7b021c6ffbdb9959.script_noteworthy;
            var_fda870b32ab92c1f = var_d43b7286bf6e17a3.angles;
        } else {
            /#
                iprintlnbold("vehicle_use");
            #/
            flightyaw = getclearpathflightyaw(site, var_cc089176a2d8ab71, var_db4adba9675a31aa);
            var_fda870b32ab92c1f = (0, flightyaw, 0);
        }
    } else {
        flightyaw = getclearpathflightyaw(site, var_cc089176a2d8ab71, var_db4adba9675a31aa);
        var_fda870b32ab92c1f = (0, flightyaw, 0);
    }
    if (getdvarint(@"hash_d5878ca9e558dd32", 0) == 1) {
        var_cb2dc60f7cafc6d4 = -100;
        var_f0db3d408327db23 = 60;
        var_67c2f437706de4a1 = anglestoforward(var_fda870b32ab92c1f);
        dirright = anglestoright(var_fda870b32ab92c1f);
        extractgroundpos = extractgroundpos + var_67c2f437706de4a1 * var_cb2dc60f7cafc6d4 + dirright * var_f0db3d408327db23;
        var_db4adba9675a31aa = extractgroundpos + (0, 0, 2000);
        var_7ce2ef2a1efe71a6 = extractgroundpos + (0, 0, 800);
    }
    var_16cedb94faf4d596 = var_cc089176a2d8ab71 - anglestoforward(var_fda870b32ab92c1f) * 20000;
    heli = spawnheli(self, var_16cedb94faf4d596, var_db4adba9675a31aa, var_7ce2ef2a1efe71a6, extractgroundpos);
    return heli;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6efa
// Size: 0x8a
function getextractionpadent(var_26a6f862062e4340) {
    var_26e41b62067100fb = undefined;
    foreach (var_b1d9d00302a9b4d6 in level.plunderpads) {
        if (isdefined(var_b1d9d00302a9b4d6) && distance2dsquared(var_b1d9d00302a9b4d6.origin, var_26a6f862062e4340) <= 10000) {
            var_26e41b62067100fb = var_b1d9d00302a9b4d6;
            break;
        }
    }
    return var_26e41b62067100fb;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8c
// Size: 0x150
function getclearpathflightyaw(site, var_e58119f7c6eb5b4d, var_d3970a3e6c77212e) {
    if (isdefined(site) && isdefined(site.flightyaw)) {
        return site.flightyaw;
    }
    var_3fb4a86293ed25a6 = 10;
    contents = create_contents(0, 1, 1, 1, 1, 0, 1, 1, 0);
    var_3674d96c61e2dd0d = 0;
    yaw = 0;
    while (yaw < 360) {
        var_3674d96c61e2dd0d = var_3674d96c61e2dd0d + yaw;
        testangles = (0, var_3674d96c61e2dd0d, 0);
        var_29006f80487a7787 = var_e58119f7c6eb5b4d - anglestoforward(testangles) * 20000;
        var_dd77d0a6d708ac18 = var_d3970a3e6c77212e;
        var_d4eb961f60968a16 = sphere_trace(var_29006f80487a7787, var_dd77d0a6d708ac18, 100, undefined, contents, 1);
        if (var_d4eb961f60968a16["fraction"] == 1) {
            /#
                line(var_29006f80487a7787, var_dd77d0a6d708ac18, (0, 1, 0), 1, 0, 2000);
            #/
            if (isdefined(site)) {
                site.flightyaw = var_3674d96c61e2dd0d;
            }
            return var_3674d96c61e2dd0d;
        }
        /#
            line(var_29006f80487a7787, var_dd77d0a6d708ac18, (1, 0, 0), 1, 0, 2000);
        #/
        if (yaw % 3 == 0) {
            waitframe();
        }
        yaw = yaw + var_3fb4a86293ed25a6;
    }
    return var_3674d96c61e2dd0d;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e4
// Size: 0x163
function drophelicrate(heli) {
    if (!isdefined(heli.plunder)) {
        return;
    }
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_fail_chopper", self.team, 1);
    plunder_allowrepositoryuse(self.crate, 0);
    crate = self.crate;
    self.crate = undefined;
    crate.plunder = heli.plunder;
    startorg = crate.origin;
    end = (startorg[0], startorg[1], -12000);
    contents = create_contents(0, 1, 1, 1, 1, 1, 0);
    trace = ray_trace(startorg, end, heli, contents);
    var_1230ea36a300368 = trace["position"];
    dist = startorg[2] - var_1230ea36a300368[2];
    if (dist > 0) {
        time = sqrt(2 * dist / 800);
        crate moveto(var_1230ea36a300368, time, time, 0);
        wait(time);
    }
    crate.origin = var_1230ea36a300368;
    playfx(getfx("airdrop_crate_impact_ground"), var_1230ea36a300368);
    entityplunderlosealldeposited(crate, 1);
    crate thread helicratedelete(heli);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724e
// Size: 0x92
function calculatehelitimetoflysec(var_c45865d4c48493c1, var_88125f10d2b34aa3, var_b2bdd90249635576) {
    var_3d0ec1c05f1e1001 = var_c45865d4c48493c1 * 1.57828e-05;
    a = 0.5 * var_b2bdd90249635576;
    b = var_88125f10d2b34aa3;
    c = -1 * var_3d0ec1c05f1e1001;
    flytime = (-1 * b + sqrt(b * b - 4 * a * c)) / 2 * a;
    flytime = flytime * 3600;
    flytime = flytime + 1.5;
    return flytime;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e8
// Size: 0x4f
function calculatehelitimetoarrive(var_625180ce8d2f8f77) {
    var_5301ebed8d610fdb = calculatehelitimetoflysec(20000, 100, 125);
    var_eb0fae3483a10d88 = calculatehelitimetoflysec(var_625180ce8d2f8f77, 25, 31.25);
    totaltime = var_5301ebed8d610fdb + var_eb0fae3483a10d88;
    return totaltime;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x733f
// Size: 0xd2
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
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_chopper_arrive", self.team, 1);
        }
        thread heliwaitatplunderrepository(plunderRepository);
        return;
    }
    thread helileave(1);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7418
// Size: 0xf4
function heliwaitatplunderrepository(plunderRepository) {
    /#
        assertex(isdefined(plunderRepository), "heliWaitAtPlunderRepository called on a heli without a plunderRepository.");
    #/
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
        /#
            assertmsg("heliWaitAtPlunderRepository called on a heli with a plunderRepository of an unregistered type.");
        #/
    }
    plunder_registerrepositoryinstance(plunderRepository, plunderrepositoryref);
    players = undefined;
    if (isdefined(self.team)) {
        players = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team);
    }
    thread plunder_repositorywatchcountdown(plunderRepository, players);
    plunder_updateanchoredwidgetforplayers(plunderRepository, players);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7513
// Size: 0xbc
function helibankplunder(plunderRepository) {
    if (!istrue(level.gameended) && !namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_success", self.team, 1);
    }
    data = plunderRepository namespace_c6ccccd95254983f::entityplunderbankalldeposited();
    if (isdefined(data) && isdefined(data.amounttotal) && data.amounttotal > 0) {
        level.br_plunder.extraction_helicoptor_total_plunder = level.br_plunder.extraction_helicoptor_total_plunder + data.amounttotal;
        level.br_plunder.extraction_helicoptor_num_completed++;
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75d6
// Size: 0x19b
function spawnropeandbag(heli) {
    var_f145946a5dbe4871 = spawn("script_model", (0, 0, 0));
    var_f145946a5dbe4871 setmodel("tag_origin");
    var_f145946a5dbe4871 linkto(heli, "origin_animate_jnt", ter_op(istrue(level.var_a83a4e71446bfef7), (-142.719, 0, 22.931), (0, 0, 0)), (0, 0, 0));
    rope = spawn("script_model", (0, 0, 0));
    rope setmodel("misc_rapelling_rope_01_fiber_br");
    rope linkto(var_f145946a5dbe4871, "tag_origin");
    rope.animname = heli.animname;
    rope namespace_bc4a4b9456315863::setanimtree();
    var_f145946a5dbe4871 namespace_bc4a4b9456315863::anim_first_frame_solo(rope, "rope_in", "tag_origin");
    crate = spawn("script_model", (0, 0, 0));
    if (istrue(level.var_a83a4e71446bfef7)) {
        crate setmodel("br_plunder2_extraction_delivery_bag");
    } else {
        crate setmodel("br_plunder_extraction_delivery_bag");
    }
    crate linkto(var_f145946a5dbe4871, "tag_origin");
    crate.animname = heli.animname;
    crate namespace_bc4a4b9456315863::setanimtree();
    var_f145946a5dbe4871 namespace_bc4a4b9456315863::anim_first_frame_solo(crate, "bag_in", "tag_origin");
    heli.rope = rope;
    heli.crate = crate;
    heli.var_f145946a5dbe4871 = var_f145946a5dbe4871;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7778
// Size: 0x351
function spawnheli(owner, enterpos, descendpos, hoverpos, extractgroundpos) {
    var_87cef10bf5729579 = 1;
    var_1d4278103ba47a16 = vectortoangles(descendpos * (1, 1, 0) - enterpos * (1, 1, 0));
    modelname = "veh8_mil_air_mindia8_plunder_x";
    vehiclename = "veh_apache_plunder_mp";
    var_86dba443a811daeb = (0, 0, 0);
    if (istrue(level.var_a83a4e71446bfef7)) {
        modelname = "veh9_mil_air_heli_blima_mp_x";
        vehiclename = "veh9_mil_air_heli_blima_nophysics_br";
        var_86dba443a811daeb = (126, 0, -20);
    }
    heli = namespace_f64231d5b7a2c3c4::_spawnhelicopter(owner, enterpos, var_1d4278103ba47a16, vehiclename, modelname);
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
    heli.scenenode = spawn("script_model", heli.extractgroundpos + var_86dba443a811daeb);
    heli.scenenode.angles = heli.sceneangles;
    heli.scenenode setmodel("tag_origin");
    heli.scenenode namespace_bc4a4b9456315863::anim_first_frame_solo(heli, "heli_in");
    spawnropeandbag(heli);
    return heli;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ad1
// Size: 0x33
function helicratedelete(heli) {
    plunder_deregisterrepositoryinstance(self);
    self hide();
    if (isdefined(heli)) {
        heli.crate = undefined;
    }
    waitframe();
    self delete();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b0b
// Size: 0x142
function helidestroyed() {
    self endon("heli_gone");
    owner = self.owner;
    damagelocation = weaponobject = meansofdeath = attacker = self waittill("death");
    var_a8eeb94dcc610b78 = 0;
    if (isdefined(self.plunder)) {
        foreach (item in self.plunder) {
            var_a8eeb94dcc610b78 = var_a8eeb94dcc610b78 + item.plundercount;
        }
    }
    namespace_a011fbf6d93f25e5::branalytics_plunder_extraction_failure(var_a8eeb94dcc610b78, "little_bird", self.extractgroundpos, self.origin);
    thread drophelicrate(self);
    helicleanup();
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.largeprojectiledamage) && !istrue(self.isdepot)) {
        self vehicle_setspeed(25, 5);
        thread helicrash(75);
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.7);
    }
    heliexplode(attacker);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c54
// Size: 0x76
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
    if (isdefined(self.var_f145946a5dbe4871)) {
        self.var_f145946a5dbe4871 delete();
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cd1
// Size: 0xe8
function heliexplode(attacker) {
    var_240a4f3d560753ff = self gettagorigin("tag_origin") + (0, 0, 40);
    self radiusdamage(var_240a4f3d560753ff, 256, 140, 70, attacker, "MOD_EXPLOSIVE");
    playfx(getfx("little_bird_explode"), var_240a4f3d560753ff, anglestoforward(self.angles), anglestoup(self.angles));
    playsoundatpos(var_240a4f3d560753ff, "veh_chopper_support_crash");
    earthquake(0.8, 1.5, var_240a4f3d560753ff, 384);
    playrumbleonposition("grenade_rumble", var_240a4f3d560753ff);
    physicsexplosionsphere(var_240a4f3d560753ff, 500, 200, 1);
    self notify("explode");
    wait(0.35);
    level thread namespace_d20f8ef223912e12::teamsplashbr("br_extract_heli_shot_down", self.owner, self.team, undefined, "splash_list_br_plunder_iw9_mp");
    helidelete();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc0
// Size: 0x12
function helidelete() {
    helicleanup();
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd9
// Size: 0x51
function helicrash(speed) {
    self endon("explode");
    self notify("heli_crashing");
    self setvehgoalpos(self.origin + (0, 0, 100), 1);
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1.5);
    self setyawspeed(speed, speed, speed);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e31
// Size: 0x1a7
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
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
    damage = namespace_a2f809133c566621::getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, damage, self.maxhealth, 3, 4, 5);
    namespace_58a74e7d54b56e8d::killstreakhit(attacker, objweapon, self, meansofdeath, damage);
    attacker updatedamagefeedback("");
    if (self.health - damage <= 900 && (!isdefined(self.smoking) || !self.smoking)) {
        self.smoking = 1;
    }
    self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fdf
// Size: 0x1e1
function helileave(var_c76f5ba0ad745444) {
    if (istrue(self.tryingtoleave) || istrue(self.leaving)) {
        return;
    }
    self endon("death");
    self notify("try_to_leave");
    self.tryingtoleave = 1;
    if (!istrue(level.gameended) && !namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_chopper_leave", self.team, 1);
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
    var_dbee990416f1879a = getanimlength(level.scr_anim[self.animname]["heli_out"]);
    self.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(self, "heli_out");
    self.var_f145946a5dbe4871 thread namespace_bc4a4b9456315863::anim_single_solo(self.rope, "rope_out", "tag_origin");
    self.var_f145946a5dbe4871 thread namespace_bc4a4b9456315863::anim_single_solo(self.crate, "bag_out", "tag_origin");
    thread function_2bbe8af3e7fa2471(self, 2);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_dbee990416f1879a);
    self stoploopsound();
    self notify("heli_gone");
    helidelete();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81c7
// Size: 0x7d
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824b
// Size: 0x8b
function heli_delayedpadstateupdate(type) {
    scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), "inuseCurrent", "inuse");
    self setscriptablepartstate(type, scriptablestate);
    wait(6);
    if (isdefined(self)) {
        scriptablestate = ter_op(istrue(level.showplunderextracticonsinworld) && !istrue(level.shownonscriptableextracticons), self.activecurrstate, self.activestate);
        self setscriptablepartstate(type, scriptablestate);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82dd
// Size: 0xbc
function helidescend() {
    self endon("death");
    thread function_2bbe8af3e7fa2471(self, 0);
    var_228083b1cc503599 = getanimlength(level.scr_anim[self.animname]["heli_in"]);
    self.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(self, "heli_in");
    self.var_f145946a5dbe4871 thread namespace_bc4a4b9456315863::anim_single_solo(self.rope, "rope_in", "tag_origin");
    self.var_f145946a5dbe4871 thread namespace_bc4a4b9456315863::anim_single_solo(self.crate, "bag_in", "tag_origin");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_228083b1cc503599);
    thread heliplayloopanim();
    thread heliplayloopropeanim();
    thread heliplayloopbadanim();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83a0
// Size: 0x89
function heliplayloopanim() {
    self endon("death");
    self.scenenode endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["heli_loop"]);
    while (1) {
        self.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(self, "heli_loop");
        wait(animtime);
        if (istrue(self.readytoleave) && !istrue(self.preventleave)) {
            self notify("ready_to_leave");
            break;
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8430
// Size: 0x71
function heliplayloopropeanim() {
    self endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["rope_loop"]);
    while (1) {
        self.var_f145946a5dbe4871 thread namespace_bc4a4b9456315863::anim_single_solo(self.rope, "rope_loop", "tag_origin");
        wait(animtime);
        if (istrue(self.readytoleave)) {
            break;
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a8
// Size: 0x71
function heliplayloopbadanim() {
    self endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["bag_loop"]);
    while (1) {
        self.var_f145946a5dbe4871 thread namespace_bc4a4b9456315863::anim_single_solo(self.crate, "bag_loop", "tag_origin");
        wait(animtime);
        if (istrue(self.readytoleave)) {
            break;
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8520
// Size: 0x34
function entisalivevehicle() {
    return isalive(self) && (namespace_dbbb37eb352edf96::isvehicle() || isdefined(self.classname) && self.classname == "script_vehicle");
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x855c
// Size: 0x5e
function helidestroyvehiclestouchnotify() {
    self endon("leaving");
    self endon("death");
    while (1) {
        vehicle = self waittill("touch");
        if (isdefined(vehicle) && vehicle entisalivevehicle()) {
            vehicle dodamage(vehicle.health, self.origin, vehicle, vehicle, "MOD_CRUSH");
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85c1
// Size: 0x28c
function helidestroyvehiclestouchtrace() {
    self endon("leaving");
    self endon("death");
    radius = 70;
    var_7cfe8395a8cf5836 = -80;
    forward = 150;
    middle = 25;
    back = -100;
    while (1) {
        vehicles = getentarrayinradius("script_vehicle", "classname", self.origin, getdvarfloat(@"hash_d8d9dc5f1a9e75a9", 400));
        if (vehicles.size <= 1) {
            wait(0.5);
            continue;
        }
        var_7346eb0e818b60c5 = create_vehicle_contents();
        dir = anglestoforward(self.angles);
        origin = self.origin + dir * getdvarfloat(@"hash_c99873a79b22a9f7", forward) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", var_7cfe8395a8cf5836));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, var_7346eb0e818b60c5);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        origin = self.origin + dir * getdvarfloat(@"hash_c9986ca79b229a92", middle) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", var_7cfe8395a8cf5836));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, var_7346eb0e818b60c5);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        origin = self.origin + dir * getdvarfloat(@"hash_c9986fa79b22a12b", back) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", var_7cfe8395a8cf5836));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, var_7346eb0e818b60c5);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        waitframe();
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8854
// Size: 0x3b
function tracegroundheight(start) {
    var_dc8bb6300463cf1e = 800;
    var_e7a7d619f927d791 = tracegroundpoint(start);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    return var_1dc672cfe0f0128e;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8897
// Size: 0x9e
function tracegroundpoint(start) {
    self endon("death");
    self endon("leaving");
    var_379ff849b3cda7d7 = -99999;
    end = (start[0], start[1], var_379ff849b3cda7d7);
    ignorelist = [0:self];
    contents = create_contents(0, 1, 0, 1, 1, 0, 1, 1, 0);
    var_e96577032a7740fc = sphere_trace(start, end, 100, ignorelist, contents, 1);
    var_fa83e3a4c4e6902 = var_e96577032a7740fc["position"][2];
    return var_fa83e3a4c4e6902;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x893d
// Size: 0x22
function heliwatchgameendleave() {
    self endon("death");
    self endon("try_to_leave");
    level waittill("game_ended");
    thread helileave(0);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8966
// Size: 0x1c
function helicountdownendcallback(entity, var_c76f5ba0ad745444) {
    plunder_repositoryextract(entity);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8989
// Size: 0x30
function heliextractcallback(entity) {
    if (isdefined(entity.heli)) {
        entity.heli thread helileave(1);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89c0
// Size: 0xc
function heliatcapacitycallback(entity) {
    
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89d3
// Size: 0xb
function plunderlivelobby() {
    thread autopickupplunder();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89e5
// Size: 0x2a
function inplunderlivelobby() {
    return istrue(level.br_plunder_enabled) && istrue(level.br_plunder_lobby) && !namespace_4b0406965e556711::gameflag("prematch_done");
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a17
// Size: 0x107
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
                    player namespace_cb965d2f71fefddc::brpickupsusecallback(pickupent, player);
                    continue;
                }
            }
        }
        wait(var_d818dc2e4c3f6146);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b25
// Size: 0x3a
function playerdelayautobankplunder() {
    self notify("playerDelayAutoBankPlunder");
    self endon("playerDelayAutoBankPlunder");
    self endon("death");
    level endon("prematch_done");
    level endon("game_ended");
    wait(2);
    playerplunderbank(self.plundercount);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b66
// Size: 0xbf
function playerplunderlivelobbydropondeath(smeansofdeath) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    if (inplunderlivelobby()) {
        var_53aaae2c915f815b = smeansofdeath == "MOD_MELEE";
        amount = 1;
        if (var_53aaae2c915f815b && isdefined(self.plundercount) && self.plundercount > 1) {
            amount = self.plundercount;
            playersetplundercount(0);
        }
        if (amount <= 0) {
            return;
        }
        if (level.br_plunder_ents.size > 0) {
            level.br_plunder_ents = array_removeundefined(level.br_plunder_ents);
        }
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        return dropcondensedplunder(amount, dropstruct);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c2c
// Size: 0xb5
function function_d998045c08ec165d() {
    /#
        level endon("script_vehicle");
        while (1) {
            if (getdvarint(@"hash_9b7f60d28a567fea", 0) != 0) {
                var_9f15f1d71bad87e2 = getallextractspawninstances();
                foreach (location in var_9f15f1d71bad87e2) {
                    thread namespace_f2ffc0540883e1ad::drawsphere(location.origin, 820, 30, (0, 1, 0));
                }
                setdevdvar(@"hash_9b7f60d28a567fea", 0);
            }
            waitframe();
        }
    #/
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ce8
// Size: 0x115
function initteamdatafields() {
    foreach (team in level.teamnamelist) {
        level.teamdata[team]["plunderTeamTotal"] = 0;
        level.teamdata[team]["plunderInDeposit"] = 0;
        level.teamdata[team]["plunderBanked"] = 0;
    }
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "risk") {
        foreach (team in level.teamnamelist) {
            level.teamdata[team]["tokensTeamTotal"] = 0;
            level.teamdata[team]["tokensInDeposit"] = 0;
            level.teamdata[team]["tokensBanked"] = 0;
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e04
// Size: 0x64
function getteamplunder(team) {
    plundercount = 0;
    if (!level.scorerequiresbanking) {
        plundercount = plundercount + level.teamdata[team]["plunderTeamTotal"];
        plundercount = plundercount + level.teamdata[team]["plunderInDeposit"];
    }
    plundercount = plundercount + level.teamdata[team]["plunderBanked"];
    return plundercount;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e70
// Size: 0x1d
function getteamcarriedplunder(team) {
    return level.teamdata[team]["plunderTeamTotal"];
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e95
// Size: 0x1d
function getbankedplunder(team) {
    return level.teamdata[team]["plunderBanked"];
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eba
// Size: 0xd7
function getplundernamebyamount(amount) {
    /#
        assertex(isdefined(level.br_plunder) && isdefined(level.br_plunder.quantity) && isdefined(level.br_plunder.names), "getPlunderNameByAmount called before setupQuantities.");
    #/
    var_3466c10973e9c476 = level.br_plunder.names[0];
    for (i = level.br_plunder.quantity.size - 1; i > 0; i--) {
        if (amount >= level.br_plunder.quantity[i]) {
            var_3466c10973e9c476 = level.br_plunder.names[i];
            break;
        }
    }
    return var_3466c10973e9c476;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f99
// Size: 0x49
function playplundersoundbyamount(player, amount) {
    if (amount == 0) {
        return;
    }
    var_3466c10973e9c476 = getplundernamebyamount(amount);
    soundalias = namespace_cb965d2f71fefddc::getcashsoundaliasforplayer(player, var_3466c10973e9c476);
    player playsoundtoplayer(soundalias, self);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fe9
// Size: 0x1af
function processcashpilevalueoverrides() {
    var_a2137920ff428a1 = getdvarint(@"hash_3c33b53363a2fb48", 1);
    if (var_a2137920ff428a1 <= 1) {
        return;
    }
    foreach (name, value in level.br_pickups.counts) {
        if (!issubstr(name, "brloot_plunder_cash")) {
            continue;
        }
        var_aa82e6d1b3760575 = level.br_pickups.counts[name];
        newvalue = var_aa82e6d1b3760575 * var_a2137920ff428a1;
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x919f
// Size: 0x142
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92e8
// Size: 0xb3
function debug_calculatecashonground() {
    total = 0;
    foreach (name in level.br_plunder.names) {
        scriptables = getentitylessscriptablearray(name);
        total = total + scriptables.size * level.br_pickups.counts[name];
    }
    total = total * 100;
    level.totalcashongroundatstart = total;
    /#
        println("<unknown string>" + total);
    #/
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a2
// Size: 0x152
function plunder_initrepositories() {
    /#
        assertex(!isdefined(level.plunderrepositories), "plunder_initRepositories() should only be called once.");
    #/
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
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&plunder_repositoryusecallback, "plunderRepository");
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&plunder_repositoryusescriptablecallback);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&plunder_playerspawnedcallback);
    level.plunderusedisabledwhenempty = getdvarint(@"hash_eb449c46ed5955e6", 0) > 0;
    /#
        setdevdvarifuninitialized(@"hash_eb449c46ed5955e6", 0);
    #/
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94fb
// Size: 0x1c2
function plunder_getleveldataforrepository(ref, create, var_6ecb77fd1f27c667) {
    levelData = level.plunderrepositories;
    /#
        assertex(isdefined(levelData), "plunder_getLevelDataForRepository() called before plunder_initRepositories().");
    #/
    var_464eb48901113eb0 = levelData.data[ref];
    if (!isdefined(var_464eb48901113eb0)) {
        if (istrue(create)) {
            var_464eb48901113eb0 = spawnstruct();
            levelData.data[ref] = var_464eb48901113eb0;
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
            /#
                assertex(istrue(var_6ecb77fd1f27c667), "plunder_getLevelDataForRepository called with an invalid ref.");
            #/
        }
    }
    return var_464eb48901113eb0;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96c5
// Size: 0x13a
function plunder_registerrepositoryinstance(entity, ref) {
    levelData = level.plunderrepositories;
    /#
        assertex(isdefined(levelData), "plunder_registerRepositoryInstance() called before plunder_initRepositories().");
    #/
    var_464eb48901113eb0 = plunder_getleveldataforrepository(ref);
    entity.plunderrepositoryref = ref;
    entity.startorigin = entity.origin;
    entity.plunder = [];
    entity.plundertotal = 0;
    entity.plunderinstanceid = level.plunderrepositories.uniqueinstanceid;
    level.plunderrepositories.uniqueinstanceid++;
    entity.playersusing = [];
    levelData.instances[entity.plunderinstanceid] = entity;
    /#
        assertex(!isdefined(var_464eb48901113eb0.teamuseonly) || isdefined(entity.team), "team use only repositories must have .team defined");
    #/
    plunder_addanchoredwidgettorepositoryinstance(entity);
    if (!isdefined(var_464eb48901113eb0.scriptableusepart)) {
        entity namespace_ad136f1d5091df4a::interactive_addusedcallbacktoentity("plunderRepository");
    }
    plunder_allowrepositoryuse(entity, 1);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9806
// Size: 0xce
function plunder_deregisterrepositoryinstance(entity) {
    levelData = level.plunderrepositories;
    /#
        assertex(isdefined(levelData), "plunder_deregisterRepositoryInstance() called before plunder_initRepositories().");
    #/
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
        levelData.instances[entity.plunderinstanceid] = undefined;
    }
    plunder_removeanchoredwidgetfromrepositoryinstance(entity);
    entity namespace_ad136f1d5091df4a::interactive_removeusedcallbackfromentity();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98db
// Size: 0x64
function plunder_repositoryinstanceisregistered(entity) {
    levelData = level.plunderrepositories;
    if (!isdefined(levelData)) {
        return 0;
    }
    instance = undefined;
    if (isdefined(entity.plunderinstanceid)) {
        instance = levelData.instances[entity.plunderinstanceid];
    }
    return isdefined(instance) && instance == entity;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9947
// Size: 0x1ea
function plunder_allowrepositoryuse(entity, bool, var_6ecb77fd1f27c667) {
    entity notify("plunder_allowRepositoryUse");
    /#
        assertex(istrue(var_6ecb77fd1f27c667) || isdefined(entity.plunderrepositoryref), "plunder_allowRepositoryUse called on an unregistered entity.");
    #/
    var_464eb48901113eb0 = undefined;
    if (isdefined(entity.plunderrepositoryref)) {
        var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref, undefined, var_6ecb77fd1f27c667);
    }
    if (isdefined(var_464eb48901113eb0)) {
        if (isdefined(var_464eb48901113eb0.scriptableusepart)) {
            /#
                assertex(isdefined(var_464eb48901113eb0.scriptableusestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableUseState.");
            #/
            /#
                assertex(isdefined(var_464eb48901113eb0.scriptablenousestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableNoUseState.");
            #/
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
        } else if (!bool) {
            entity notify("repository_use_disabled");
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b38
// Size: 0x10e
function plunder_allowrepositoryuseforplayer(entity, player, bool, var_6ecb77fd1f27c667) {
    /#
        assertex(istrue(var_6ecb77fd1f27c667) || isdefined(entity.plunderrepositoryref), "plunder_allowRepositoryUse called on an unregistered entity.");
    #/
    var_464eb48901113eb0 = undefined;
    if (isdefined(entity.plunderrepositoryref)) {
        var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref, undefined, var_6ecb77fd1f27c667);
    }
    if (isdefined(var_464eb48901113eb0)) {
        if (isdefined(var_464eb48901113eb0.scriptableusepart)) {
            /#
                assertex(isdefined(var_464eb48901113eb0.scriptableusestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableUseState.");
            #/
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c4d
// Size: 0x8c
function plunder_allowallrepositoryuseforplayer(player, bool, var_6ecb77fd1f27c667) {
    levelData = level.plunderrepositories;
    foreach (instance in levelData.instances) {
        plunder_allowrepositoryuseforplayer(instance, player, bool, 1);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ce0
// Size: 0x86
function plunder_playercanuserepository(entity, player) {
    if (player namespace_f8065cafc523dba5::isinvehicle()) {
        return 0;
    }
    if (namespace_7e17181d03156026::isinlaststand(player)) {
        return 0;
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (istrue(var_464eb48901113eb0.teamuseonly) && isdefined(entity.team) && player.team != entity.team) {
        return 0;
    }
    return 1;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d6e
// Size: 0x246
function plunder_playerrepositoryuseshouldsucceed(entity, player, var_d7f72825d583f8fe) {
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!istrue(entity.plunderusable)) {
        return 0;
    }
    if (var_464eb48901113eb0.useeventtype == 2 || var_464eb48901113eb0.useeventtype == 3) {
        if (player.plundercount <= 0 && (!isdefined(player.extractquest_alwaysallowdeposit) || player.extractquest_helipadid != entity.index)) {
            if (istrue(var_d7f72825d583f8fe) && isdefined(var_464eb48901113eb0.usefailnoplundermsg) && var_464eb48901113eb0.usefailnoplundermsg != "") {
                player playlocalsound("br_plunder_atm_cancel");
                player namespace_44abc05161e2e2cb::showerrormessage(var_464eb48901113eb0.usefailnoplundermsg);
            }
            return 0;
        } else if (istrue(entity.plunderatcapacity)) {
            if (istrue(var_d7f72825d583f8fe) && isdefined(var_464eb48901113eb0.usefailcapacitymsg) && var_464eb48901113eb0.usefailcapacitymsg != "") {
                player playlocalsound("br_plunder_atm_cancel");
                player namespace_44abc05161e2e2cb::showerrormessage(var_464eb48901113eb0.usefailcapacitymsg);
            }
            return 0;
        }
    }
    if (player namespace_f8065cafc523dba5::isinvehicle()) {
        if (istrue(var_d7f72825d583f8fe) && isdefined(var_464eb48901113eb0.usefailvehiclemsg) && var_464eb48901113eb0.usefailvehiclemsg != "") {
            player playlocalsound("br_plunder_atm_cancel");
            player namespace_44abc05161e2e2cb::showerrormessage(var_464eb48901113eb0.usefailvehiclemsg);
        }
        return 0;
    }
    if (namespace_7e17181d03156026::isinlaststand(player)) {
        if (istrue(var_d7f72825d583f8fe) && isdefined(var_464eb48901113eb0.usefaillaststandmsg) && var_464eb48901113eb0.usefaillaststandmsg != "") {
            player playlocalsound("br_plunder_atm_cancel");
            player namespace_44abc05161e2e2cb::showerrormessage(var_464eb48901113eb0.usefaillaststandmsg);
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
        return [[ var_464eb48901113eb0.useshouldsucceedcallback ]](entity, player, var_d7f72825d583f8fe);
    }
    return 1;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fbc
// Size: 0x135
function plunder_repositoryusescriptablecallback(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(instance)) {
        return;
    }
    entity = instance.entity;
    if (!isdefined(entity) || isdefined(entity.forceextractscriptable)) {
        entity = instance;
    }
    if (!namespace_c6ccccd95254983f::plunder_repositoryinstanceisregistered(entity)) {
        return;
    }
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!isdefined(var_464eb48901113eb0.scriptableusepart)) {
        return;
    }
    /#
        assertex(isdefined(var_464eb48901113eb0.scriptableusestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableUseState.");
    #/
    /#
        assertex(isdefined(var_464eb48901113eb0.scriptablenousestate), "Plunder Repository: " + entity.plunderrepositoryref + " doesn't define a scriptableNoUseState.");
    #/
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f8
// Size: 0x37
function plunder_repositoryusecallback(entity, player) {
    if (!namespace_c6ccccd95254983f::plunder_repositoryinstanceisregistered(entity)) {
        return;
    }
    if (!plunder_playerrepositoryuseshouldsucceed(entity, player, 1)) {
        return;
    }
    thread plunder_repositoryusecallbackinternal(entity, player);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa136
// Size: 0x17b
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
        if (player namespace_f8065cafc523dba5::_isalive()) {
            plunder_repositoryenableuserestrictions(player, 0);
        }
        player.plunderrepositoryrestricted = undefined;
        if (isplayer(player)) {
            var_f812b18d7fad2339 = 0;
            var_776df703e8901349 = undefined;
            if (!var_f812b18d7fad2339 && player namespace_f8065cafc523dba5::_isalive() && !player namespace_f8065cafc523dba5::isinvehicle() && !namespace_7e17181d03156026::isinlaststand(player)) {
                if (istrue(entity.extracting)) {
                    var_776df703e8901349 = 2;
                } else if (isdefined(player.plunderrepositorywidget) && isdefined(player.plunderrepositorywidget.useeventtimestamp) && player.plunderrepositorywidget.useeventtimestamp - gettime() <= 1.5) {
                    var_776df703e8901349 = 1.5;
                }
            }
            thread plunder_clearrepositorywidgetforplayer(player, var_776df703e8901349);
        }
    }
    if (isdefined(entity) && isdefined(entity.playersusing)) {
        entity.playersusing[entnum] = undefined;
    }
    if (isdefined(player) && isplayer(player)) {
        plunder_updateanchoredwidgetforplayers(entity, player);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2b8
// Size: 0x201
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
                /#
                    assertmsg("no useCallback defined for " + entity.plunderrepositoryref + ".");
                #/
            }
            var_585743c445b80ce6 = usetime;
            var_aba405f695679ed8 = usetime + var_464eb48901113eb0.usetime;
            if (isdefined(player.plunderrepositorywidget)) {
                player.plunderrepositorywidget.useeventtimestamp = gettime();
            }
            var_f34424646f122cf3 = 1;
        }
        wait(0.05);
        usetime = usetime + 0.05;
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c0
// Size: 0x9f
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa566
// Size: 0x127
function plunder_repositoryenableuserestrictions(player, bool) {
    restrictions = [0:"allow_movement", 1:"usability", 2:"weapon_switch", 3:"equipment_primary", 4:"equipment_secondary", 5:"supers", 6:"killstreaks", 7:"fire", 8:"melee", 9:"reload", 10:"ads", 11:"mantle", 12:"mount_top", 13:"mount_side", 14:"execution_attack", 15:"vehicle_use", 16:"cough_gesture"];
    if (istrue(player.plunderrepositoryrestricted) && bool) {
        return;
    }
    if (!istrue(player.plunderrepositoryrestricted) && !bool) {
        return;
    }
    if (bool) {
        player val::function_59c053b89257bc95("plunder", restrictions, 0);
    } else {
        player val::function_c9d0b43701bdba00("plunder");
    }
    if (bool) {
        player.plunderrepositoryrestricted = 1;
    } else {
        player.plunderrepositoryrestricted = undefined;
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa694
// Size: 0x270
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
        var_b68d7884cbaaca3b = ter_op(isdefined(var_464eb48901113eb0.extractsilentcountdown), var_464eb48901113eb0.extractsilentcountdown, 0);
        countdown = ter_op(isdefined(var_464eb48901113eb0.extractcountdown), var_464eb48901113eb0.extractcountdown, 0);
        entity.plundersilentcountdownendtime = gettime() + var_b68d7884cbaaca3b * 1000;
        entity.plundercountdownendtime = gettime() + (var_b68d7884cbaaca3b + countdown) * 1000;
    }
    if (isdefined(players)) {
        if (!isarray(players)) {
            players = [0:players];
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
                var_44c653d588db89a7 = int(max(0, (entity.plundercountdownendtime - gettime()) / 1000));
                foreach (player in entity.plundercountdownplayers) {
                    if (isdefined(player)) {
                        thread plunder_repositorysendcountdownmessage(player, entity, var_44c653d588db89a7);
                    }
                }
            }
            entity.plundercountdownupdatetime = gettime();
        }
        wait(0.05);
    }
    thread plunder_repositoryendcountdown(entity, 1);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90b
// Size: 0x57
function plunder_repositoryendcountdown(entity, var_c76f5ba0ad745444) {
    plunder_repositoryclearcountdown(entity);
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (isdefined(var_464eb48901113eb0.countdownendcallback)) {
        [[ var_464eb48901113eb0.countdownendcallback ]](entity, var_c76f5ba0ad745444);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa969
// Size: 0x35
function plunder_repositoryclearcountdown(entity) {
    entity notify("plunder_repositoryWatchCountdown");
    entity.plundercountdownplayers = undefined;
    entity.plundercountdownendtime = undefined;
    entity.plundercountdownupdatetime = undefined;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9a5
// Size: 0x1a1
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
    if (!player namespace_d3d40f75bb4e4c32::isplayeringulag() && player namespace_f8065cafc523dba5::_isalive()) {
        var_939bdf45ce71425b = undefined;
        var_6795239569233693 = 2147483647;
        foreach (data in player.plundercountdownmessagedata) {
            var_3321f7bde264cbf9 = distance2dsquared(player.origin, data.origin);
            if (var_3321f7bde264cbf9 < var_6795239569233693) {
                var_6795239569233693 = var_3321f7bde264cbf9;
                var_939bdf45ce71425b = data;
            }
        }
    }
    player.plundercountdownmessagedata = undefined;
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab4d
// Size: 0x6d
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

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabc1
// Size: 0x5d
function plunder_repositoryatcapacity(entity) {
    entity.plunderatcapacity = 1;
    plunder_allowrepositoryuse(entity, 0);
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (isdefined(var_464eb48901113eb0.atcapacitycallback)) {
        [[ var_464eb48901113eb0.atcapacitycallback ]](entity);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac25
// Size: 0xf
function plunder_playerspawnedcallback() {
    plunder_allowallrepositoryuseforplayer(self, 1, 1);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac3b
// Size: 0x312
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
        /#
            assertex(isdefined(data.plunderinstanceid), "When repository widget is first created for the player, plunderInstanceID is required.");
        #/
        /#
            assertex(isdefined(data.type), "When repository widget is first created for the player, type is required.");
        #/
    } else if (isdefined(plunderinstanceid) && isdefined(data.plunderinstanceid) && plunderinstanceid != data.plunderinstanceid) {
        return;
    }
    var_90ae65dd73557a80 = 0;
    if (istrue(visible)) {
        var_90ae65dd73557a80 = !data.visible;
        data.visible = 1;
    }
    /#
        assertex(!var_90ae65dd73557a80 || isdefined(endtime), "If repository widget is newly visible to the player an endTime is required.");
    #/
    if (isdefined(endtime)) {
        data.endtime = endtime;
    }
    /#
        assertex(!var_90ae65dd73557a80 || isdefined(plundertotal), "If repository widget is newly visible to the player a plunderTotal is required.");
    #/
    if (isdefined(plundertotal)) {
        data.plundertotal = plundertotal;
    }
    if (isdefined(plundereventamount)) {
        /#
            assertex(!isdefined(data.plundereventamount) || isdefined(data.timestamp) && data.timestamp < gettime(), "The player should never update plunderEventAmount twice in one frame.");
        #/
        data.plundereventamount = plundereventamount;
        entity = level.plunderrepositories.instances[data.plunderinstanceid];
        foreach (_player in entity.playersusing) {
            if (_player != player) {
                plunder_updaterepositorywidgetforplayer(player, undefined, undefined, undefined, undefined, plundertotal, undefined);
                plunder_sendrepositorywidgetomnvar(player);
            }
        }
        if (isdefined(entity.team)) {
            plunder_updateanchoredwidgetforplayers(entity, namespace_54d20dd0dd79277f::getfriendlyplayers(entity.team));
        }
    } else if (isdefined(data.timestamp) && data.timestamp < gettime()) {
        data.plundereventamount = undefined;
    }
    data.timestamp = gettime();
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf54
// Size: 0x48
function plunder_clearrepositorywidgetforplayer(player, delay) {
    player endon("disconnect");
    player endon("plunder_sendRepositoryWidgetOmnvar");
    player.plunderrepositorywidget = undefined;
    if (isdefined(delay) && delay > 0) {
        wait(delay);
    }
    player setclientomnvar("ui_br_plunder_repository", 0);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafa3
// Size: 0x176
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
    var_aebf7845cfddb470 = 1;
    if (isdefined(payload)) {
        value = value | int(payload) << bit;
    }
    bit = bit + var_aebf7845cfddb470;
    payload = data.type;
    var_aebf7845cfddb470 = 1;
    if (isdefined(payload)) {
        value = value | int(payload) << bit;
    }
    bit = bit + var_aebf7845cfddb470;
    payload = data.endtime;
    var_aebf7845cfddb470 = 14;
    if (isdefined(payload)) {
        payload = int(payload / 250);
        payload = payload & 16383;
        value = value | int(payload) << bit;
    }
    bit = bit + var_aebf7845cfddb470;
    if (data.type == 0) {
        payload = data.plundertotal;
        var_aebf7845cfddb470 = 10;
        if (isdefined(payload)) {
            payload = int(payload / 5);
            payload = payload & 1023;
            value = value | int(payload) << bit;
        }
    }
    var_8661d51d71f341f = data.plundereventamount;
    if (isdefined(var_8661d51d71f341f)) {
        var_8661d51d71f341f = int(var_8661d51d71f341f / 5);
        player setclientomnvar("ui_br_plunder_repository_event_amount", var_8661d51d71f341f);
    }
    player setclientomnvar("ui_br_plunder_repository", value);
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb120
// Size: 0x277
function plunder_addanchoredwidgettorepositoryinstance(entity) {
    levelData = level.plunderrepositories;
    var_464eb48901113eb0 = plunder_getleveldataforrepository(entity.plunderrepositoryref);
    if (!istrue(var_464eb48901113eb0.teamanchoredwidget)) {
        return;
    }
    /#
        assertex(istrue(var_464eb48901113eb0.teamuseonly), "anchored widgets are only supported for team only repositories.");
    #/
    if (!isdefined(levelData.teamanchoredwidgetinstances[entity.team])) {
        levelData.teamanchoredwidgetinstances[entity.team] = [];
    }
    var_bd73cc979462cac0 = [];
    for (i = 1; i <= 4; i++) {
        var_bd73cc979462cac0[i] = i;
    }
    foreach (instance in levelData.teamanchoredwidgetinstances[entity.team]) {
        var_bd73cc979462cac0[instance.anchoredwidgetid] = undefined;
    }
    foreach (anchoredwidgetid in var_bd73cc979462cac0) {
        entity.anchoredwidgetid = anchoredwidgetid;
        break;
    }
    if (isdefined(entity.anchoredwidgetid)) {
        levelData.teamanchoredwidgetinstances[entity.team] = array_add(levelData.teamanchoredwidgetinstances[entity.team], entity);
        var_62aae91e274e22d5 = levelData.teamanchoredentomnvars[entity.anchoredwidgetid];
        foreach (player in namespace_54d20dd0dd79277f::getfriendlyplayers(entity.team)) {
            player setclientomnvar(var_62aae91e274e22d5, entity getentitynumber());
        }
    } else {
        /#
            assertmsg("too many repositories with anchored widgets added for team " + entity.team + ".");
        #/
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb39e
// Size: 0x14a
function plunder_removeanchoredwidgetfromrepositoryinstance(entity) {
    levelData = level.plunderrepositories;
    id = entity.anchoredwidgetid;
    if (!isdefined(id)) {
        return;
    }
    entity.anchoredwidgetid = undefined;
    levelData.teamanchoredwidgetinstances[entity.team] = array_remove(levelData.teamanchoredwidgetinstances[entity.team], entity);
    if (levelData.teamanchoredwidgetinstances[entity.team].size == 0) {
        levelData.teamanchoredwidgetinstances[entity.team] = undefined;
    }
    var_62aae91e274e22d5 = levelData.teamanchoredentomnvars[id];
    var_634e557aa9552052 = levelData.teamanchoredinfoomnvars[id];
    foreach (player in namespace_54d20dd0dd79277f::getfriendlyplayers(entity.team)) {
        player setclientomnvar(var_62aae91e274e22d5, -1);
        player setclientomnvar(var_634e557aa9552052, 0);
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4ef
// Size: 0x199
function plunder_updateanchoredwidgetforplayers(entity, players) {
    levelData = level.plunderrepositories;
    if (!isdefined(entity.anchoredwidgetid)) {
        return;
    }
    if (!isarray(players)) {
        players = [0:players];
    }
    if (players.size == 0) {
        return;
    }
    value = 0;
    bit = 0;
    payload = 1;
    var_aebf7845cfddb470 = 1;
    value = value + payload;
    bit = bit + var_aebf7845cfddb470;
    payload = entity.plundercountdownendtime;
    var_aebf7845cfddb470 = 14;
    if (isdefined(payload)) {
        payload = payload / 250;
        payload = int(min(payload, 16383));
        value = value + (payload << bit);
    }
    bit = bit + var_aebf7845cfddb470;
    payload = entity.plundertotal;
    var_aebf7845cfddb470 = 10;
    if (isdefined(payload)) {
        payload = payload / 5;
        payload = int(min(payload, 1023));
        value = value + (payload << bit);
    }
    var_634e557aa9552052 = levelData.teamanchoredinfoomnvars[entity.anchoredwidgetid];
    foreach (player in players) {
        if (array_contains(entity.playersusing, player)) {
            player setclientomnvar(var_634e557aa9552052, value & -2);
        } else {
            player setclientomnvar(var_634e557aa9552052, value);
        }
    }
}

// Namespace br_plunder/namespace_c6ccccd95254983f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb68f
// Size: 0xac
function function_697ba36fc0e3cde4() {
    /#
        setdevdvarifuninitialized(@"hash_1ede0bb893291602", 0);
        while (1) {
            if (getdvarint(@"hash_1ede0bb893291602", 0) > 0) {
                foreach (player in level.players) {
                    player playerplunderpickup(getdvarint(@"hash_1ede0bb893291602", 0), undefined, 1);
                }
            }
            setdevdvar(@"hash_1ede0bb893291602", 0);
            wait(1);
        }
    #/
}

