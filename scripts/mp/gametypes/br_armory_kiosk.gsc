// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_263974019a8ba3fa;
#using scripts\mp\hud_util.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\script.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_58f20490049af6ac;
#using script_64acb6ce534155b7;
#using script_15ca41a3fbb0e379;
#using script_5def7af2a9f04234;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_67cc94c07ab18d3a;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_3583ff375ab3a91e;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_342e51952b63e594;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\equipment.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using script_5307834cd39b435c;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_b0385bb45379222;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_721ee99d7a8f9168;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using script_55e418c5cc946593;
#using scripts\mp\menus.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_extract_quest.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gametypes\br_spectate.gsc;
#using script_5bab271917698dc4;
#using script_6a5d3bf7a5b7064a;
#using scripts\cp_mp\parachute.gsc;

#namespace br_armory_kiosk;

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a30
// Size: 0x266
function init() {
    level.br_armory_kiosk = spawnstruct();
    level.br_armory_kiosk.scriptables = [];
    level.br_armory_kiosk_enabled = getdvarint(@"hash_880384e6dfe250ba", 1) != 0;
    level.var_11a3973390a71e8 = getdvar(@"hash_f8e5c3daa6c01012", "purchases");
    if (level.mapname == "mp_saba" || level.mapname == "mp_saba2" || game_utility::function_314ff105a27cc131() || level.mapname == "mp_jup_escape5") {
        level.var_8dea6607b3189a60 = getdvarint(@"hash_32c09327627c883c", 1);
    }
    level.var_77e4add813fca6ae = getdvarint(@"hash_e024cf932ef753dc", 0);
    level.var_f38c74334d6ff472 = getdvarint(@"hash_6e135c0a5edc02b1", 0);
    level.var_ee08b1f41e7c2444 = function_ba5574c7f287c587();
    level.var_e7cee4fbb5b46ef2 = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(level.var_11a3973390a71e8);
    if (namespace_71073fa38f11492::isfeaturedisabled("kiosk")) {
        level.br_armory_kiosk_enabled = 0;
        return;
    }
    if (level.br_armory_kiosk_enabled) {
        function_665291fdc0b65758();
        namespace_17c25f0877bfb620::scriptable_addusedcallback(&armorykioskused);
        namespace_17c25f0877bfb620::scriptable_addautousecallback(&armorykioskused);
        namespace_3846cfb60b2ef12f::registeronluieventcallback(&onarmorykioskpurchase);
        thread function_28d7437a275a45c7();
        level.var_d03e6ba38b56b4ab = getdvarint(@"hash_e77ab3a32453ae92", 1);
        level.var_e9f7702d839b262c = getdvarint(@"hash_624b1f6964c696d", 180);
        level.var_f454c63919420aa9 = getdvarint(@"hash_69c62cae4d7929c9", 10);
        level.var_fb60f0244999d528 = getdvarint(@"hash_9c3612143e0ad401", 1);
        level.var_8b92cb4447668562 = getdvarint(@"hash_1b89015decb21663", 1) == 1;
        _initsalesdiscount();
        _parsepurchaseitemtables();
        function_6f3bd3113a48f7b7();
        function_3e6ddd0ae062ac75();
        level thread _watchforcircleclosure();
        /#
            level thread function_54fdd9330a3bed3e();
        #/
        level.var_a4078546548cb0a = &function_a4078546548cb0a;
        level.var_4fecf02c9241f7f0 = &function_4fecf02c9241f7f0;
        namespace_c5622898120e827f::function_eca79fa0f341ee08(4, &dangercircletick, &function_1a1709943670772a, &function_d9a3848f71c7c63a, &disableallarmorykiosks);
        flag_set("br_armory_kiosk_initialized");
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9d
// Size: 0x49
function function_28d7437a275a45c7() {
    level endon("game_ended");
    namespace_4b0406965e556711::function_1240434f4201ac9d("ssc_initialized");
    namespace_7052decdced06e44::function_4f7660cfd85cd517("buy_station", &function_e6c1c35181a2870f);
    namespace_7052decdced06e44::function_412f527ef0863f0e("buy_station", &function_53542c92143aa5eb);
    namespace_7052decdced06e44::function_eded5b87f8f7bdfd("buy_station", &function_86f5339f1334e16);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ced
// Size: 0xdc
function function_b38f5ffe645943c3(var_1bd79a12120f1848) {
    setdvar(@"hash_f8e5c3daa6c01012", var_1bd79a12120f1848);
    level.var_e7cee4fbb5b46ef2 = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(var_1bd79a12120f1848);
    if (!isdefined(level.var_6be7b375ec4a629c)) {
        level.var_6be7b375ec4a629c = [];
    }
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_5b25e7620e424cb2) {
        if (var_eb7139726cc569b5["index"] == level.var_e7cee4fbb5b46ef2) {
            return;
        }
    }
    level.var_6be7b375ec4a629c[level.var_6be7b375ec4a629c.size] = function_d84cdb7463425ba(var_1bd79a12120f1848);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd0
// Size: 0x17c
function _initsalesdiscount() {
    var_db834d1cac99ea96 = getdvarint(@"hash_828fb46e27ef695d", 0);
    level.br_armory_kiosk.sales_discount = int(clamp(var_db834d1cac99ea96, 0, 100));
    var_bc97c6f634d832a0 = getdvar(@"hash_68eb502c50f9a22", "");
    level.br_armory_kiosk.sales_discount_items = strtok(var_bc97c6f634d832a0, ",");
    var_997f4424a87b464e = 20;
    var_f587fa837f6bf48f = level.br_armory_kiosk.sales_discount % var_997f4424a87b464e;
    if (var_f587fa837f6bf48f > 0) {
        var_9a7512c4544fd449 = int(floor(level.br_armory_kiosk.sales_discount / var_997f4424a87b464e) * var_997f4424a87b464e);
        var_50c417a2a6400d = var_f587fa837f6bf48f / var_997f4424a87b464e >= 0.5;
        if (var_50c417a2a6400d) {
            var_9a7512c4544fd449 = var_9a7512c4544fd449 + var_997f4424a87b464e;
        }
        level.br_armory_kiosk.sales_discount = int(var_9a7512c4544fd449);
    }
    if (var_db834d1cac99ea96 != level.br_armory_kiosk.sales_discount) {
        setdvar(@"hash_828fb46e27ef695d", level.br_armory_kiosk.sales_discount);
        /#
            assertmsg("Supply station discount value [" + var_db834d1cac99ea96 + "] is potentially dangerous, converted to [" + level.br_armory_kiosk.sales_discount + "].");
        #/
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f53
// Size: 0x57
function _applysalesdiscount(var_9d384a51d5f0a3cf, var_5805a52ec044f672) {
    if (!isdefined(var_5805a52ec044f672) || var_5805a52ec044f672 == 0) {
        return var_9d384a51d5f0a3cf;
    } else if (var_5805a52ec044f672 == 100) {
        return 0;
    }
    fraction = (100 - var_5805a52ec044f672) * 0.01;
    return int(floor(var_9d384a51d5f0a3cf * fraction + 0.5));
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb2
// Size: 0x16d
function function_a0389e3244a68894(kiosk, var_cf9d634ef87d898b) {
    var_dc5ca81f164df863 = function_879d297885591207(kiosk);
    if (!isdefined(var_dc5ca81f164df863)) {
        var_dc5ca81f164df863 = level.var_e7cee4fbb5b46ef2;
    }
    var_8e9c7fc5d7cdc62b = function_2a50f66eb0ec8756(kiosk);
    if (!isdefined(var_dc5ca81f164df863)) {
        var_8e9c7fc5d7cdc62b = level.var_e7cee4fbb5b46ef2;
    }
    var_6e08ba5c758809b1 = array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_6e08ba5c758809b1) {
        if (var_eb7139726cc569b5["index"] == var_dc5ca81f164df863) {
            var_b0f4dcc20c3b0c76 = var_eb7139726cc569b5["items"];
            if (isdefined(var_b0f4dcc20c3b0c76[var_cf9d634ef87d898b])) {
                return 1;
            }
            break;
        }
    }
    foreach (weapondata in level.var_3899105ceec08fb8) {
        if (weapondata["index"] == var_8e9c7fc5d7cdc62b) {
            var_b7d5f294eb87d5ce = weapondata["items"];
            if (isdefined(var_b7d5f294eb87d5ce[var_cf9d634ef87d898b])) {
                return 1;
            }
            break;
        }
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2127
// Size: 0x16f
function function_a83ac2899e1fe5eb(kiosk) {
    if (getdvarint(@"hash_8bd31284e87b0865", 1) == 0) {
        return 0;
    }
    if (!isdefined(kiosk) || !isdefined(kiosk.index)) {
        return 0;
    }
    /#
        if (getdvarint(@"hash_5f15a3e117466c52", 0) == 1) {
            kiosk.var_7940dcde72827af7 = undefined;
            kiosk.var_ded92ccb217bbaeb = undefined;
        }
    #/
    var_d584af5cdd0345d8 = getsystemtime();
    if (!isdefined(kiosk.var_7940dcde72827af7) && isdefined(level.var_6be7b375ec4a629c) && level.var_6be7b375ec4a629c.size > 0) {
        var_dc5ca81f164df863 = (kiosk.index + var_d584af5cdd0345d8) % level.var_6be7b375ec4a629c.size;
        var_b25a062b16392edd = level.var_6be7b375ec4a629c[var_dc5ca81f164df863];
        kiosk.var_7940dcde72827af7 = var_b25a062b16392edd["index"];
    }
    if (!isdefined(kiosk.var_ded92ccb217bbaeb) && isdefined(level.var_3899105ceec08fb8) && level.var_3899105ceec08fb8.size > 0) {
        var_2d4419c241fcb284 = (kiosk.index + var_d584af5cdd0345d8) % level.var_3899105ceec08fb8.size;
        var_aba76bfe006a0128 = level.var_3899105ceec08fb8[var_2d4419c241fcb284];
        kiosk.var_ded92ccb217bbaeb = var_aba76bfe006a0128["index"];
    }
    return 1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229e
// Size: 0xca
function function_879d297885591207(kiosk) {
    if (!function_a83ac2899e1fe5eb(kiosk)) {
        return undefined;
    }
    found = 0;
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_5b25e7620e424cb2) {
        if (var_eb7139726cc569b5["index"] == kiosk.var_7940dcde72827af7) {
            found = 1;
            break;
        }
    }
    if (!found) {
        function_ad499107951c0a81(kiosk.var_7940dcde72827af7);
    }
    return kiosk.var_7940dcde72827af7;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2370
// Size: 0x23
function function_2a50f66eb0ec8756(kiosk) {
    if (!function_a83ac2899e1fe5eb(kiosk)) {
        return undefined;
    }
    return kiosk.var_ded92ccb217bbaeb;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239b
// Size: 0x2b8
function function_ac84b48bb39d674f(kiosk) {
    if (getdvarint(@"hash_b0634929cd39973b", 1) == 0) {
        return 0;
    }
    if (!isdefined(kiosk) || !isdefined(kiosk.index)) {
        return 0;
    }
    if (!isdefined(level.var_6be7b375ec4a629c)) {
        return 0;
    }
    var_3c79041b6898ccbe = function_879d297885591207(kiosk);
    if (!isdefined(var_3c79041b6898ccbe)) {
        return 0;
    }
    if (!isdefined(level.var_44235d71492fa1a5)) {
        level.var_44235d71492fa1a5 = [];
    }
    if (isdefined(level.var_44235d71492fa1a5[kiosk.index]) && level.var_44235d71492fa1a5[kiosk.index].var_7c4e674c20384644 == var_3c79041b6898ccbe) {
        return 1;
    }
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_5b25e7620e424cb2) {
        if (var_eb7139726cc569b5["index"] == var_3c79041b6898ccbe) {
            var_44235d71492fa1a5 = spawnstruct();
            var_44235d71492fa1a5.var_7c4e674c20384644 = var_3c79041b6898ccbe;
            var_44235d71492fa1a5.stock = [];
            foreach (var_541fd62b8d9c236d, var_cf29bd90372e77 in var_eb7139726cc569b5["items"]) {
                var_44235d71492fa1a5.stock[var_541fd62b8d9c236d] = var_cf29bd90372e77["defaultStock"];
            }
            level.var_44235d71492fa1a5[kiosk.index] = var_44235d71492fa1a5;
            return 1;
        }
    }
    foreach (var_eb7139726cc569b5 in level.var_4531798404d47e45) {
        if (var_eb7139726cc569b5["index"] == var_3c79041b6898ccbe) {
            var_44235d71492fa1a5 = spawnstruct();
            var_44235d71492fa1a5.var_7c4e674c20384644 = var_3c79041b6898ccbe;
            var_44235d71492fa1a5.stock = [];
            foreach (var_541fd62b8d9c236d, var_cf29bd90372e77 in var_eb7139726cc569b5["items"]) {
                var_44235d71492fa1a5.stock[var_541fd62b8d9c236d] = var_cf29bd90372e77["defaultStock"];
            }
            level.var_44235d71492fa1a5[kiosk.index] = var_44235d71492fa1a5;
            return 1;
        }
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265b
// Size: 0x248
function function_6af40e269aae683e(kiosk, var_cf9d634ef87d898b) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (!function_ac84b48bb39d674f(kiosk)) {
        return undefined;
    }
    if (namespace_cb965d2f71fefddc::isweaponpickup(var_cf9d634ef87d898b)) {
        return undefined;
    }
    var_b0f4dcc20c3b0c76 = undefined;
    var_602c39c79c517a48 = level.var_44235d71492fa1a5[kiosk.index].var_7c4e674c20384644;
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_5b25e7620e424cb2) {
        if (var_eb7139726cc569b5["index"] == var_602c39c79c517a48) {
            var_b0f4dcc20c3b0c76 = var_eb7139726cc569b5["items"];
            break;
        }
    }
    if (isdefined(level.var_4531798404d47e45)) {
        foreach (var_eb7139726cc569b5 in level.var_4531798404d47e45) {
            if (var_eb7139726cc569b5["index"] == var_602c39c79c517a48) {
                var_b0f4dcc20c3b0c76 = var_eb7139726cc569b5["items"];
                break;
            }
        }
    }
    /#
        assert(isdefined(var_b0f4dcc20c3b0c76));
    #/
    var_d47b7f992ca8a91e = iskioskfiresaleactiveforplayer(kiosk, player);
    var_f80ad141ca44a56c = level.var_44235d71492fa1a5[kiosk.index].stock[var_cf9d634ef87d898b];
    if (isdefined(var_f80ad141ca44a56c)) {
        if (istrue(kiosk.var_114e759371623080)) {
            var_417245cb30a84e5d = namespace_ea497db8cab34561::function_de1ac98379235d8b(var_cf9d634ef87d898b, var_f80ad141ca44a56c);
            var_f80ad141ca44a56c = ter_op(isdefined(var_417245cb30a84e5d), var_417245cb30a84e5d, var_f80ad141ca44a56c);
        }
        ishidden = !var_d47b7f992ca8a91e && var_b0f4dcc20c3b0c76[var_cf9d634ef87d898b]["hidden"];
        if (ishidden) {
            return 0;
        } else {
            return var_f80ad141ca44a56c;
        }
    } else {
        var_3a9ba92d55351a23 = var_b0f4dcc20c3b0c76[var_cf9d634ef87d898b];
        if (isdefined(var_3a9ba92d55351a23)) {
            /#
                assert(!isdefined(var_b0f4dcc20c3b0c76[var_cf9d634ef87d898b]["defaultStock"]));
            #/
            return 1;
        } else {
            return 0;
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28aa
// Size: 0x257
function function_66cd523e6167613(kiosk) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (!function_ac84b48bb39d674f(kiosk)) {
        return undefined;
    }
    var_b0f4dcc20c3b0c76 = undefined;
    var_602c39c79c517a48 = level.var_44235d71492fa1a5[kiosk.index].var_7c4e674c20384644;
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_5b25e7620e424cb2) {
        if (var_eb7139726cc569b5["index"] == var_602c39c79c517a48) {
            var_b0f4dcc20c3b0c76 = var_eb7139726cc569b5["items"];
            break;
        }
    }
    if (isdefined(level.var_4531798404d47e45)) {
        foreach (var_eb7139726cc569b5 in level.var_4531798404d47e45) {
            if (var_eb7139726cc569b5["index"] == var_602c39c79c517a48) {
                var_b0f4dcc20c3b0c76 = var_eb7139726cc569b5["items"];
                break;
            }
        }
    }
    /#
        assert(isdefined(var_b0f4dcc20c3b0c76));
    #/
    var_d47b7f992ca8a91e = iskioskfiresaleactiveforplayer(kiosk, player);
    var_c46f52afd4f7232d = [];
    var_aedd70527004e768 = 0;
    foreach (var_7a23a3da52267de1, var_f80ad141ca44a56c in level.var_44235d71492fa1a5[kiosk.index].stock) {
        if (isdefined(var_f80ad141ca44a56c)) {
            if (istrue(kiosk.var_114e759371623080)) {
                var_417245cb30a84e5d = namespace_ea497db8cab34561::function_de1ac98379235d8b(var_7a23a3da52267de1, var_f80ad141ca44a56c);
                var_f80ad141ca44a56c = ter_op(isdefined(var_417245cb30a84e5d), var_417245cb30a84e5d, var_f80ad141ca44a56c);
            }
            ishidden = !var_d47b7f992ca8a91e && var_b0f4dcc20c3b0c76[var_7a23a3da52267de1]["hidden"];
            if (ishidden) {
                var_c46f52afd4f7232d[var_aedd70527004e768] = 0;
            } else {
                var_c46f52afd4f7232d[var_aedd70527004e768] = var_f80ad141ca44a56c;
            }
        }
        var_aedd70527004e768++;
    }
    return var_c46f52afd4f7232d;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b09
// Size: 0x52
function function_3c3bca629d687994(kiosk) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (!function_ac84b48bb39d674f(kiosk)) {
        return undefined;
    }
    return level.var_44235d71492fa1a5[kiosk.index].stock;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b63
// Size: 0xbd
function function_b88d64cd67bbe60f(kiosk) {
    if (!function_ac84b48bb39d674f(kiosk)) {
        return undefined;
    }
    var_353dcd8b6675e407 = 0;
    var_89ffab3d9d3c9cdd = 0;
    var_4a7f6ec38e1f5220 = function_66cd523e6167613(kiosk);
    foreach (var_e5b48212891e8513 in var_4a7f6ec38e1f5220) {
        if (isdefined(var_e5b48212891e8513)) {
            /#
                assert(0 <= var_e5b48212891e8513 && var_e5b48212891e8513 <= 3);
            #/
            /#
                assert(var_353dcd8b6675e407 < 16);
            #/
            var_89ffab3d9d3c9cdd = var_89ffab3d9d3c9cdd | var_e5b48212891e8513 << 2 * var_353dcd8b6675e407;
            var_353dcd8b6675e407++;
        }
    }
    return var_89ffab3d9d3c9cdd;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c28
// Size: 0x80
function function_469cfcbc4a5185c1(kiosk, var_cf9d634ef87d898b) {
    if (!function_ac84b48bb39d674f(kiosk)) {
        return;
    }
    var_f80ad141ca44a56c = level.var_44235d71492fa1a5[kiosk.index].stock[var_cf9d634ef87d898b];
    if (isdefined(var_f80ad141ca44a56c)) {
        level.var_44235d71492fa1a5[kiosk.index].stock[var_cf9d634ef87d898b] = ter_op(var_f80ad141ca44a56c > 0, var_f80ad141ca44a56c - 1, 0);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2caf
// Size: 0x45
function function_ef08eb6f31f46bc3(lootid) {
    if (!isdefined(lootid)) {
        return 0;
    }
    var_25978461c6e4f61b = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(var_25978461c6e4f61b)) {
        return 0;
    }
    return issubstr(getdvar(@"hash_275014452ae83a52", ""), var_25978461c6e4f61b);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfc
// Size: 0x9e
function function_3fb403d950df330a(var_cf9d634ef87d898b) {
    /#
        assert(isdefined(level.br_armory_kiosk.items));
    #/
    foreach (itemdata in level.br_armory_kiosk.items) {
        if (var_cf9d634ef87d898b == itemdata.var_2ce272546e3ae7f0) {
            return itemdata.var_7cb19f95dbc68942;
        }
    }
    return 1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da2
// Size: 0x113
function function_596ce27c393e3593(kiosk) {
    var_dc5ca81f164df863 = function_879d297885591207(kiosk);
    if (!isdefined(var_dc5ca81f164df863)) {
        var_dc5ca81f164df863 = level.var_e7cee4fbb5b46ef2;
    }
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    foreach (var_eb7139726cc569b5 in var_5b25e7620e424cb2) {
        if (var_eb7139726cc569b5["index"] == var_dc5ca81f164df863) {
            return var_eb7139726cc569b5["itemFilter"];
        }
    }
    if (isdefined(level.var_4531798404d47e45)) {
        foreach (var_eb7139726cc569b5 in level.var_4531798404d47e45) {
            if (var_eb7139726cc569b5["index"] == var_dc5ca81f164df863) {
                return var_eb7139726cc569b5["itemFilter"];
            }
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebc
// Size: 0x291
function function_d84cdb7463425ba(var_9023cea8f03e72d2) {
    var_eb7139726cc569b5 = [];
    var_3d329ebb0d03d6db = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(var_9023cea8f03e72d2);
    var_eb7139726cc569b5["index"] = var_3d329ebb0d03d6db;
    var_eb7139726cc569b5["ref"] = var_9023cea8f03e72d2;
    var_eb7139726cc569b5["items"] = [];
    var_eb7139726cc569b5["itemFilter"] = 0;
    var_904eefa8f06ceecb = tablelookuprownum("mp/buyStation/buyStationDefs.csv", 0, var_3d329ebb0d03d6db);
    var_c6c26123001b9460 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 3);
    itemindex = 0;
    var_ac75b489772f26ce = 4 * itemindex;
    while (var_c6c26123001b9460 != "") {
        var_8172b04b25618375 = function_3fb403d950df330a(var_c6c26123001b9460);
        if (!var_8172b04b25618375) {
            /#
                assertex(!isdefined(var_eb7139726cc569b5["items"][var_c6c26123001b9460]), "Duplicate buy station item found in: " + var_9023cea8f03e72d2 + " for " + var_c6c26123001b9460);
            #/
            var_730dd4e55dee0cbb = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 4 + var_ac75b489772f26ce);
            var_685cb12f08da73b = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 5 + var_ac75b489772f26ce);
            var_be32e0f210b83382 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 6 + var_ac75b489772f26ce);
            var_eb7139726cc569b5["items"][var_c6c26123001b9460] = [];
            if (var_730dd4e55dee0cbb != "") {
                var_eb7139726cc569b5["items"][var_c6c26123001b9460]["cost"] = int(var_730dd4e55dee0cbb);
            } else {
                var_eb7139726cc569b5["items"][var_c6c26123001b9460]["cost"] = -1;
            }
            if (var_685cb12f08da73b != "") {
                var_685cb12f08da73b = int(var_685cb12f08da73b);
                if (0 <= var_685cb12f08da73b && var_685cb12f08da73b <= 3) {
                    var_eb7139726cc569b5["items"][var_c6c26123001b9460]["defaultStock"] = var_685cb12f08da73b;
                } else {
                    var_eb7139726cc569b5["items"][var_c6c26123001b9460]["defaultStock"] = randomintrange(0, 3);
                }
            } else {
                var_eb7139726cc569b5["items"][var_c6c26123001b9460]["defaultStock"] = undefined;
            }
            if (var_be32e0f210b83382 != "") {
                var_eb7139726cc569b5["items"][var_c6c26123001b9460]["hidden"] = int(var_be32e0f210b83382);
            } else {
                var_eb7139726cc569b5["items"][var_c6c26123001b9460]["hidden"] = 0;
            }
        }
        if (itemindex < 15) {
            if (var_8172b04b25618375) {
                var_434b72e73a9cd4b9 = 1 << itemindex;
                var_eb7139726cc569b5["itemFilter"] = var_eb7139726cc569b5["itemFilter"] | var_434b72e73a9cd4b9;
            }
        } else {
            /#
                println("mp/buyStation/attachmentPriceList.csv" + itemindex + 1 + "opening" + 15 + "crouch" + var_c6c26123001b9460 + "ui_barter_list_index" + var_9023cea8f03e72d2);
            #/
        }
        itemindex++;
        var_ac75b489772f26ce = 4 * itemindex;
        var_c6c26123001b9460 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 3 + var_ac75b489772f26ce);
    }
    return var_eb7139726cc569b5;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3155
// Size: 0x1f
function function_fe176342ed52b44f(var_cb325ddb4a764623) {
    return int(tablelookup("mp/buyStation/buyStationItems.csv", 1, var_cb325ddb4a764623, 0));
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317c
// Size: 0x20
function function_517b8730ddec7f59(var_cb325ddb4a764623) {
    return int(tablelookup("mp/buyStation/buyStationItems.csv", 1, var_cb325ddb4a764623, 4));
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a4
// Size: 0x12
function function_7e0281196d6407c8() {
    return getdvarint(@"hash_1696df050ad70202", 0);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31be
// Size: 0x162
function private function_4d81ae9cb22f4180(dvar, var_a0732421235e346c) {
    var_c95404cd83f761b6 = [];
    var_fffdbfff87ab6316 = getdvar(dvar);
    if (isdefined(var_fffdbfff87ab6316) && var_fffdbfff87ab6316 != "") {
        var_3d321e8859561813 = [];
        var_3d08c62a01a4bedd = strtok(var_fffdbfff87ab6316, ",");
        if (var_3d08c62a01a4bedd.size == 2 && (int(var_3d08c62a01a4bedd[0]) || int(var_3d08c62a01a4bedd[1]))) {
            var_919b9496930895b6 = int(var_3d08c62a01a4bedd[0]);
            var_36336cefcad243f5 = int(var_3d08c62a01a4bedd[1]);
            for (var_c5dcc7e2f341bf0b = var_919b9496930895b6; var_c5dcc7e2f341bf0b <= var_36336cefcad243f5; var_c5dcc7e2f341bf0b++) {
                var_904eefa8f06ceecb = tablelookuprownum("mp/buyStation/buyStationDefs.csv", 0, var_c5dcc7e2f341bf0b);
                if (var_904eefa8f06ceecb != -1) {
                    var_9023cea8f03e72d2 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 1);
                    if (var_9023cea8f03e72d2 != "") {
                        var_3d321e8859561813[var_3d321e8859561813.size] = var_9023cea8f03e72d2;
                    }
                }
            }
        } else {
            var_3d321e8859561813 = var_3d08c62a01a4bedd;
        }
        var_3d321e8859561813 = array_randomize(var_3d321e8859561813);
        for (var_3d329ebb0d03d6db = 0; var_3d329ebb0d03d6db < var_3d321e8859561813.size; var_3d329ebb0d03d6db++) {
            var_c95404cd83f761b6[var_c95404cd83f761b6.size] = function_d84cdb7463425ba(var_3d321e8859561813[var_3d329ebb0d03d6db]);
        }
    } else if (isdefined(var_a0732421235e346c)) {
        var_c95404cd83f761b6[var_c95404cd83f761b6.size] = function_d84cdb7463425ba(var_a0732421235e346c);
    }
    return var_c95404cd83f761b6;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3328
// Size: 0xdf
function private function_ad499107951c0a81(index) {
    if (!isdefined(level.var_4531798404d47e45)) {
        level.var_4531798404d47e45 = [];
    }
    foreach (var_eb7139726cc569b5 in level.var_4531798404d47e45) {
        if (var_eb7139726cc569b5["index"] == index) {
            return 1;
        }
    }
    var_904eefa8f06ceecb = tablelookuprownum("mp/buyStation/buyStationDefs.csv", 0, index);
    if (var_904eefa8f06ceecb != -1) {
        var_9023cea8f03e72d2 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 1);
        if (var_9023cea8f03e72d2 != "") {
            level.var_4531798404d47e45[level.var_4531798404d47e45.size] = function_d84cdb7463425ba(var_9023cea8f03e72d2);
            return 1;
        }
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340f
// Size: 0xe6
function function_9bd43636f6f0d8c4() {
    /#
        assert(isdefined(level.br_armory_kiosk.weapons));
    #/
    level.br_armory_kiosk.weapons.var_e02581d50b48c3f9 = [];
    var_f615e27fabb97e45 = tablelookupgetnumrows("mp/buyStation/staticPriceList.csv");
    for (var_46d56db0a72eb5d4 = 0; var_46d56db0a72eb5d4 < var_f615e27fabb97e45; var_46d56db0a72eb5d4++) {
        var_46ba7eb0a7107f2d = tablelookupbyrow("mp/buyStation/staticPriceList.csv", var_46d56db0a72eb5d4, 0);
        var_87d8e30fbd1164a5 = tablelookupbyrow("mp/buyStation/staticPriceList.csv", var_46d56db0a72eb5d4, 1);
        /#
            assert(!isdefined(level.br_armory_kiosk.weapons.var_e02581d50b48c3f9[var_46ba7eb0a7107f2d]));
        #/
        level.br_armory_kiosk.weapons.var_e02581d50b48c3f9[var_46ba7eb0a7107f2d] = var_87d8e30fbd1164a5;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34fc
// Size: 0xe7
function function_2d02167adeb2e60d() {
    /#
        assert(isdefined(level.br_armory_kiosk.weapons));
    #/
    level.br_armory_kiosk.weapons.var_e2cb29f4b0411d93 = [];
    var_63cec4db64e32297 = tablelookupgetnumrows("mp/buyStation/weaponPriceList.csv");
    for (var_279c628b1346e27e = 0; var_279c628b1346e27e < var_63cec4db64e32297; var_279c628b1346e27e++) {
        var_2770738b1316a17b = tablelookupbyrow("mp/buyStation/weaponPriceList.csv", var_279c628b1346e27e, 1);
        var_fa1ab16b7b374db3 = tablelookupbyrow("mp/buyStation/weaponPriceList.csv", var_279c628b1346e27e, 2);
        /#
            assert(!isdefined(level.br_armory_kiosk.weapons.var_e2cb29f4b0411d93[var_2770738b1316a17b]));
        #/
        level.br_armory_kiosk.weapons.var_e2cb29f4b0411d93[var_2770738b1316a17b] = var_fa1ab16b7b374db3;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ea
// Size: 0xe7
function function_d872d1b4b7c3c32e() {
    /#
        assert(isdefined(level.br_armory_kiosk.weapons));
    #/
    level.br_armory_kiosk.weapons.var_f6619d771d944fd2 = [];
    var_648068a3992692f7 = tablelookupgetnumrows("mp/buyStation/weaponPriceScalars.csv");
    for (var_6dca16d75df1105e = 0; var_6dca16d75df1105e < var_648068a3992692f7; var_6dca16d75df1105e++) {
        var_6d9e27d75dc0cf5b = tablelookupbyrow("mp/buyStation/weaponPriceScalars.csv", var_6dca16d75df1105e, 1);
        var_facc5533af7abe13 = tablelookupbyrow("mp/buyStation/weaponPriceScalars.csv", var_6dca16d75df1105e, 2);
        /#
            assert(!isdefined(level.br_armory_kiosk.weapons.var_f6619d771d944fd2[var_6d9e27d75dc0cf5b]));
        #/
        level.br_armory_kiosk.weapons.var_f6619d771d944fd2[var_6d9e27d75dc0cf5b] = var_facc5533af7abe13;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d8
// Size: 0xe7
function function_723777567250afb4() {
    /#
        assert(isdefined(level.br_armory_kiosk.weapons));
    #/
    level.br_armory_kiosk.weapons.var_734d96bc7d1a1f06 = [];
    var_522088a531963514 = tablelookupgetnumrows("mp/buyStation/attachmentPriceList.csv");
    for (var_a1d7492c6665aaef = 0; var_a1d7492c6665aaef < var_522088a531963514; var_a1d7492c6665aaef++) {
        var_a1f1582c6681f4f6 = tablelookupbyrow("mp/buyStation/attachmentPriceList.csv", var_a1d7492c6665aaef, 1);
        var_dba2830453494044 = tablelookupbyrow("mp/buyStation/attachmentPriceList.csv", var_a1d7492c6665aaef, 2);
        /#
            assert(!isdefined(level.br_armory_kiosk.weapons.var_734d96bc7d1a1f06[var_a1f1582c6681f4f6]));
        #/
        level.br_armory_kiosk.weapons.var_734d96bc7d1a1f06[var_a1f1582c6681f4f6] = var_dba2830453494044;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c6
// Size: 0xe7
function function_98b7422b7dcbcd5d() {
    /#
        assert(isdefined(level.br_armory_kiosk.weapons));
    #/
    level.br_armory_kiosk.weapons.var_40484251044547c1 = [];
    var_22c065782099074 = tablelookupgetnumrows("mp/buyStation/attachmentPriceScalars.csv");
    for (var_e3113d8479a341cf = 0; var_e3113d8479a341cf < var_22c065782099074; var_e3113d8479a341cf++) {
        var_e32b4c8479bf8bd6 = tablelookupbyrow("mp/buyStation/attachmentPriceScalars.csv", var_e3113d8479a341cf, 1);
        var_8bae00b6a3bc9ba4 = tablelookupbyrow("mp/buyStation/attachmentPriceScalars.csv", var_e3113d8479a341cf, 2);
        /#
            assert(!isdefined(level.br_armory_kiosk.weapons.var_40484251044547c1[var_e32b4c8479bf8bd6]));
        #/
        level.br_armory_kiosk.weapons.var_40484251044547c1[var_e32b4c8479bf8bd6] = var_8bae00b6a3bc9ba4;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b4
// Size: 0x3f
function function_6f3bd3113a48f7b7() {
    level.br_armory_kiosk.weapons = spawnstruct();
    function_9bd43636f6f0d8c4();
    function_2d02167adeb2e60d();
    function_d872d1b4b7c3c32e();
    function_723777567250afb4();
    function_98b7422b7dcbcd5d();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38fa
// Size: 0x270
function _parsepurchaseitemtables() {
    level.br_armory_kiosk.items = [];
    var_50b073ec9558c3a4 = getdvarint(@"hash_ee52115cbca6f7cc", 1);
    var_5a3d34c6e7bf27e4 = getdvarint(@"hash_51099664f5b3c5c", 1);
    numrows = tablelookupgetnumrows("mp/buyStation/buyStationItems.csv");
    for (row = 0; row < numrows; row++) {
        itemindex = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 0));
        /#
            assert(!isdefined(level.br_armory_kiosk.items[itemindex]));
        #/
        var_97642cc850f90ca0 = spawnstruct();
        var_97642cc850f90ca0.var_2ce272546e3ae7f0 = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 1);
        var_97642cc850f90ca0.type = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 2);
        var_97642cc850f90ca0.ref = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 3);
        var_97642cc850f90ca0.cost = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 4));
        var_97642cc850f90ca0.var_41f94bca374ed58a = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 13);
        if (var_97642cc850f90ca0.var_41f94bca374ed58a != "") {
            var_97642cc850f90ca0.var_41f94bca374ed58a = int(var_97642cc850f90ca0.var_41f94bca374ed58a);
        } else {
            var_97642cc850f90ca0.var_41f94bca374ed58a = undefined;
        }
        var_d3329a62a63406e9 = getdvarint(@"hash_950c868de7e98dbf", 0);
        if (var_d3329a62a63406e9 != 0) {
            var_97642cc850f90ca0.firesalediscount = var_d3329a62a63406e9;
        } else {
            var_97642cc850f90ca0.firesalediscount = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 10));
        }
        var_97642cc850f90ca0.lootid = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 11));
        if (var_50b073ec9558c3a4) {
            var_140518973901ac9f = function_ef08eb6f31f46bc3(var_97642cc850f90ca0.lootid);
            var_df48480fcaab21b9 = var_5a3d34c6e7bf27e4 && namespace_38b993c4618e76cd::function_5d47301f7bb7a6ba(var_97642cc850f90ca0.lootid);
            var_97642cc850f90ca0.var_7cb19f95dbc68942 = var_140518973901ac9f || var_df48480fcaab21b9;
        } else {
            var_97642cc850f90ca0.var_7cb19f95dbc68942 = 0;
        }
        level.br_armory_kiosk.items[itemindex] = var_97642cc850f90ca0;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b71
// Size: 0x88
function function_6ce8d88dab67a185(var_2ce272546e3ae7f0, cost) {
    foreach (var_97642cc850f90ca0 in level.br_armory_kiosk.items) {
        if (var_97642cc850f90ca0.var_2ce272546e3ae7f0 == var_2ce272546e3ae7f0) {
            var_97642cc850f90ca0.cost = cost;
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c00
// Size: 0x9b
function function_3cb66deb101988ce(var_cf9d634ef87d898b, stock) {
    foreach (index, kiosk in level.var_44235d71492fa1a5) {
        /#
            assert(isdefined(level.var_44235d71492fa1a5[index].stock[var_cf9d634ef87d898b]));
        #/
        level.var_44235d71492fa1a5[index].stock[var_cf9d634ef87d898b] = stock;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca2
// Size: 0x56
function function_3e6ddd0ae062ac75() {
    if (!isdefined(level.var_6be7b375ec4a629c)) {
        level.var_6be7b375ec4a629c = function_4d81ae9cb22f4180(@"hash_894c0b1c4e700989", level.var_11a3973390a71e8);
    }
    if (!isdefined(level.var_3899105ceec08fb8)) {
        level.var_3899105ceec08fb8 = function_4d81ae9cb22f4180(@"hash_f4138ad8e0de3ac6");
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cff
// Size: 0xc7
function private function_d1687e85988049bb(var_cb325ddb4a764623, var_c95404cd83f761b6) {
    foreach (var_eb7139726cc569b5 in var_c95404cd83f761b6) {
        if (var_eb7139726cc569b5["index"] == level.var_e7cee4fbb5b46ef2 || isdefined(level.var_747666592ae8cb22) && var_eb7139726cc569b5["index"] == level.var_747666592ae8cb22) {
            if (isdefined(var_eb7139726cc569b5["items"][var_cb325ddb4a764623]) && var_eb7139726cc569b5["items"][var_cb325ddb4a764623]["cost"] > 0) {
                return var_eb7139726cc569b5["items"][var_cb325ddb4a764623]["cost"];
            } else {
                return undefined;
            }
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dcd
// Size: 0x69
function private function_d0e1afe1bd3614df(var_cb325ddb4a764623) {
    var_5b25e7620e424cb2 = utility::array_combine(level.var_6be7b375ec4a629c, level.var_4531798404d47e45);
    cost = function_d1687e85988049bb(var_cb325ddb4a764623, var_5b25e7620e424cb2);
    if (!isdefined(cost) && isdefined(level.var_3899105ceec08fb8)) {
        cost = function_d1687e85988049bb(var_cb325ddb4a764623, level.var_3899105ceec08fb8);
    }
    return cost;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3e
// Size: 0x2a7
function function_3cc8b2630d4f56e7(weaponref, var_31553e68a5164e3e) {
    /#
        assert(isdefined(level.br_armory_kiosk.weapons));
    #/
    weaponcost = level.br_armory_kiosk.weapons.var_e2cb29f4b0411d93[weaponref];
    if (!isdefined(weaponcost)) {
        weaponcost = level.br_armory_kiosk.weapons.var_e02581d50b48c3f9["base_weapon_price"];
        /#
            assert(isdefined(weaponcost));
        #/
        var_2c8d5f3760cefb99 = strtok(weaponref, "_");
        var_83c238ac98dc9f3c = level.br_armory_kiosk.weapons.var_f6619d771d944fd2[var_2c8d5f3760cefb99[1]];
        if (isdefined(var_83c238ac98dc9f3c)) {
            weaponcost = floor(float(weaponcost) * float(var_83c238ac98dc9f3c));
        }
    }
    weaponcost = int(weaponcost);
    var_b4a5b92285739a05 = 0;
    var_d92fa0cdae417729 = 0;
    var_1617f2212c6b2c64 = level.br_armory_kiosk.weapons.var_e02581d50b48c3f9["base_attachment_price"];
    /#
        assert(isdefined(var_1617f2212c6b2c64));
    #/
    foreach (attachmentref in var_31553e68a5164e3e) {
        if (attachmentref != "none") {
            var_b4a5b92285739a05++;
            var_fdf92a09c2352059 = level.br_armory_kiosk.weapons.var_734d96bc7d1a1f06[attachmentref];
            if (!isdefined(var_fdf92a09c2352059)) {
                var_fdf92a09c2352059 = var_1617f2212c6b2c64;
                var_694af79c48f661b4 = strtok(attachmentref, "_");
                var_ba578616096ecac9 = level.br_armory_kiosk.weapons.var_40484251044547c1[var_694af79c48f661b4[0]];
                if (isdefined(var_ba578616096ecac9)) {
                    var_fdf92a09c2352059 = floor(float(var_1617f2212c6b2c64) * float(var_ba578616096ecac9));
                }
            }
            var_fdf92a09c2352059 = int(var_fdf92a09c2352059);
            var_d92fa0cdae417729 = var_d92fa0cdae417729 + var_fdf92a09c2352059;
        }
    }
    var_74c73d277613a6ab = level.br_armory_kiosk.weapons.var_e02581d50b48c3f9[function_996b01cd49d0128d([0:"rigging_", 1:string(min(var_b4a5b92285739a05, 7))])];
    if (isdefined(var_74c73d277613a6ab)) {
        var_74c73d277613a6ab = int(var_74c73d277613a6ab);
    } else {
        var_74c73d277613a6ab = 0;
    }
    return weaponcost + var_d92fa0cdae417729 + var_74c73d277613a6ab;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ed
// Size: 0x28d
function _getactualcost(player, itemdata) {
    var_d47b7f992ca8a91e = 0;
    if (isdefined(player.br_kiosk)) {
        var_d47b7f992ca8a91e = iskioskfiresaleactiveforplayer(player.br_kiosk, player);
    }
    var_150663def4f4145a = itemdata.cost;
    if (isdefined(player.var_8d0b00b4f85bf258) && player.var_8d0b00b4f85bf258 > 0) {
        return 0;
    }
    var_bbd3ced9f1e6acbf = function_d0e1afe1bd3614df(itemdata.var_2ce272546e3ae7f0);
    if (isdefined(var_bbd3ced9f1e6acbf)) {
        var_150663def4f4145a = var_bbd3ced9f1e6acbf;
    }
    var_32a4b97aaf1048c3 = getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", itemdata.ref, "_cost_override"), "");
    if (var_32a4b97aaf1048c3 != "") {
        var_708c98cf00cfdb10 = strtok(var_32a4b97aaf1048c3, ",");
        var_781ca8aede77fa50 = namespace_54d20dd0dd79277f::getteamcount(player.team) - 1;
        if (var_708c98cf00cfdb10.size > 0) {
            var_c4a9d9ccdf6eccb9 = var_708c98cf00cfdb10.size <= var_781ca8aede77fa50 ? var_708c98cf00cfdb10.size - 1 : var_781ca8aede77fa50;
            var_150663def4f4145a = int(var_708c98cf00cfdb10[var_c4a9d9ccdf6eccb9]);
        } else {
            namespace_9c840bb9f2ecbf00::demoforcesre("Invalid "scr_" + itemdata.ref + "_cost_override" dvar value. Value: "" + var_32a4b97aaf1048c3 + "".");
        }
    }
    if (level.br_armory_kiosk.sales_discount > 0) {
        var_3719b75d66108f99 = level.br_armory_kiosk.sales_discount_items.size == 0 || array_contains(level.br_armory_kiosk.sales_discount_items, itemdata.ref);
        if (var_3719b75d66108f99) {
            var_150663def4f4145a = _applysalesdiscount(var_150663def4f4145a, level.br_armory_kiosk.sales_discount);
        }
    }
    var_2d4fa166958b2bbc = namespace_a38a2e1fe7519183::function_39f56604458d5a9b(player, itemdata);
    if (isdefined(var_2d4fa166958b2bbc) && var_2d4fa166958b2bbc > 0) {
        var_150663def4f4145a = _applysalesdiscount(var_150663def4f4145a, var_2d4fa166958b2bbc * 100);
    }
    if (isdefined(player.br_kiosk) && istrue(player.br_kiosk.var_a84a6acb3c2edcae) && array_contains(player.br_kiosk.players, player)) {
        return _applysalesdiscount(var_150663def4f4145a, 100);
    } else if (var_d47b7f992ca8a91e) {
        return _applysalesdiscount(var_150663def4f4145a, itemdata.firesalediscount);
    }
    return var_150663def4f4145a;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4382
// Size: 0x96
function function_59e987d44a301ef5(kiosk) {
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a() && isint(kiosk)) {
        kiosk = self;
    }
    player = self;
    var_525b03beaf285c54 = getdvarint(@"hash_c37f7e3bb9eca843", 0);
    maxdistsquared = var_525b03beaf285c54 * var_525b03beaf285c54;
    while (1) {
        if (!isdefined(kiosk) || distancesquared(player.origin, kiosk.origin) > maxdistsquared) {
            player notify("exit_quick_purchase_zone");
            break;
        }
        wait(0.1);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x441f
// Size: 0xe0
function _watchforcircleclosure() {
    level endon("game_ended");
    setdvarifuninitialized(@"hash_acddd0026cc9adad", 0);
    while (1) {
        level waittill("br_circle_set");
        var_dff50030f50c58ea = getdvarint(@"hash_acddd0026cc9adad", 0);
        if (var_dff50030f50c58ea == 0) {
            continue;
        }
        if (level.br_circle.circleindex + 1 >= var_dff50030f50c58ea) {
            disableallarmorykiosks();
            foreach (player in level.players) {
                if (!isdefined(player) || !isalive(player)) {
                    continue;
                }
                player thread namespace_44abc05161e2e2cb::showsplash("br_kiosks_disabled");
            }
            break;
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4506
// Size: 0xb7
function function_54fdd9330a3bed3e() {
    /#
        while (1) {
            if (getdvarint(@"hash_ca216e77fa44180c", 0) > 0) {
                foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
                    line(var_cf635e78f21650ca.origin, var_cf635e78f21650ca.origin + (0, 0, 5000), (0.7, 0.2, 0.1), 1, 1, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c4
// Size: 0xbb
function showdiscountsplash(delayseconds) {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    if (istrue(player.hasseendiscountsplash)) {
        return;
    }
    if (!isdefined(level.br_armory_kiosk.sales_discount)) {
        return;
    }
    if (level.br_armory_kiosk.sales_discount == 0) {
        return;
    }
    player.hasseendiscountsplash = 1;
    if (isdefined(delayseconds) && delayseconds > 0) {
        wait(delayseconds);
    }
    if (level.br_armory_kiosk.sales_discount_items.size == 0) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_sales_event_all");
    } else {
        player thread namespace_44abc05161e2e2cb::showsplash("br_sales_event_selective");
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4686
// Size: 0x12
function function_8807282a387bb5b4() {
    return getdvarint(@"hash_e6b890d479b028f4", 0);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a0
// Size: 0x13a
function function_f29b0d39f0da104d() {
    if (!function_8807282a387bb5b4()) {
        return;
    }
    foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
        var_cf635e78f21650ca.var_60b371eba77d2372 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        objective_setshowdistance(var_cf635e78f21650ca.var_60b371eba77d2372, 0);
        objective_state(var_cf635e78f21650ca.var_60b371eba77d2372, "invisible");
        objective_icon(var_cf635e78f21650ca.var_60b371eba77d2372, "ui_mobile_buystation_visual_marker");
        objective_setbackground(var_cf635e78f21650ca.var_60b371eba77d2372, 1);
        objective_position(var_cf635e78f21650ca.var_60b371eba77d2372, var_cf635e78f21650ca.origin + (0, 0, 40));
        var_a7c6c5d6c3d369aa = getdvarfloat(@"hash_b57f7c58a492252b", 0);
        var_467f4d9b8d9063b = getdvarfloat(@"hash_d56247cfc459711f", 0);
        function_c047d7ffe7a83501(var_cf635e78f21650ca.var_60b371eba77d2372, var_a7c6c5d6c3d369aa, var_467f4d9b8d9063b);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e1
// Size: 0x80
function onprematchdone() {
    foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
        var_cf635e78f21650ca setscriptablepartstate("br_plunder_box", "visible");
        var_cf635e78f21650ca.visible = 1;
    }
    function_f29b0d39f0da104d();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4868
// Size: 0x159
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (namespace_71073fa38f11492::isfeaturedisabled("kiosk") || getdvarint(@"hash_ac54858b3fd07daf", 0) == 1 || istrue(level.br_armory_kiosk.all_disabled)) {
        return;
    }
    var_52d59c928eb97c81 = var_e86632d645c137d0 + getdvarfloat(@"hash_64432e664d4ae36a", 1574);
    var_c434624ff361bba2 = var_52d59c928eb97c81 * var_52d59c928eb97c81;
    foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
        var_e4e4ae4481958d2e = !isdefined(var_cf635e78f21650ca.var_2dea89afaf60dc16) && namespace_dc84b0aa8d501507::function_de57b9616f575a63(var_cf635e78f21650ca.origin) == -1 && distance2dsquared(var_cf635e78f21650ca.origin, var_819edacdacb810e4) + level.var_53c0fa66001cff52 > var_c434624ff361bba2;
        if (istrue(var_cf635e78f21650ca.visible)) {
            if (var_e4e4ae4481958d2e) {
                disablearmorykiosk(var_cf635e78f21650ca);
            }
        } else if (!var_e4e4ae4481958d2e) {
            function_d9a3848f71c7c63a(var_cf635e78f21650ca);
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c8
// Size: 0x122
function function_1a1709943670772a() {
    if (namespace_71073fa38f11492::isfeaturedisabled("kiosk") || getdvarint(@"hash_ac54858b3fd07daf", 0) == 1 || istrue(level.br_armory_kiosk.all_disabled)) {
        return;
    }
    var_31966dae052c3d71 = [];
    foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
        var_e4e4ae4481958d2e = !isdefined(var_cf635e78f21650ca.var_2dea89afaf60dc16) && namespace_dc84b0aa8d501507::function_de57b9616f575a63(var_cf635e78f21650ca.origin) == -1 && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(var_cf635e78f21650ca.origin, level.var_53c0fa66001cff52);
        if (istrue(var_cf635e78f21650ca.visible)) {
            if (var_e4e4ae4481958d2e) {
                var_31966dae052c3d71[var_31966dae052c3d71.size] = var_cf635e78f21650ca;
                disablearmorykiosk(var_cf635e78f21650ca);
            }
        } else if (!var_e4e4ae4481958d2e) {
            function_d9a3848f71c7c63a(var_cf635e78f21650ca);
        }
    }
    return var_31966dae052c3d71;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af2
// Size: 0x96
function disableallarmorykiosks() {
    if (namespace_71073fa38f11492::isfeaturedisabled("kiosk")) {
        return;
    }
    level.br_armory_kiosk.all_disabled = 1;
    foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
        if (isdefined(var_cf635e78f21650ca.visible)) {
            disablearmorykiosk(var_cf635e78f21650ca);
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8f
// Size: 0x47
function function_d9a3848f71c7c63a(var_cf635e78f21650ca) {
    if (!isdefined(var_cf635e78f21650ca)) {
        return;
    }
    var_cf635e78f21650ca setscriptablepartstate("br_plunder_box", "visible");
    var_cf635e78f21650ca.visible = 1;
    var_cf635e78f21650ca.disabled = undefined;
    var_cf635e78f21650ca.var_b19f232ff8887a72 = undefined;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bdd
// Size: 0x108
function disablearmorykiosk(var_cf635e78f21650ca) {
    if (!isdefined(var_cf635e78f21650ca)) {
        return;
    }
    if (istrue(level.var_8b92cb4447668562)) {
        var_cf635e78f21650ca.var_b19f232ff8887a72 = 1;
        var_cf635e78f21650ca setscriptablepartstate("br_plunder_box", "closing");
    } else {
        var_cf635e78f21650ca setscriptablepartstate("br_plunder_box", "closing");
    }
    var_cf635e78f21650ca.visible = undefined;
    var_cf635e78f21650ca.disabled = 1;
    if (var_cf635e78f21650ca namespace_1eb3c4e0e28fac71::checkforactiveobjicon()) {
        var_cf635e78f21650ca namespace_1eb3c4e0e28fac71::deletequestobjicon();
    }
    foreach (p in level.players) {
        if (isdefined(p.br_kiosk) && p.br_kiosk == var_cf635e78f21650ca) {
            p _closepurchasemenuwithresponse(2);
        }
    }
    level notify("buystation_kill_callout_" + var_cf635e78f21650ca.origin);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cec
// Size: 0x30
function setspawninstances(instances) {
    /#
        assert(isarray(instances));
    #/
    level.br_armory_kiosk.scriptables = instances;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d23
// Size: 0x2b
function getallspawninstances() {
    if (!level.br_armory_kiosk_enabled) {
        return;
    }
    var_82aaa7c31b818b16 = getentitylessscriptablearray("scriptable_br_plunder_box", "classname");
    return var_82aaa7c31b818b16;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d56
// Size: 0x31
function function_68f55b32ad3368e1() {
    if (!isdefined(level.var_68f55b32ad3368e1)) {
        level.var_68f55b32ad3368e1 = getdvarint(@"hash_ca9c84470ead8181", 0);
    }
    return level.var_68f55b32ad3368e1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4d8f
// Size: 0x31
function private function_315d0a115fe536ee() {
    if (!isdefined(level.var_315d0a115fe536ee)) {
        level.var_315d0a115fe536ee = getdvarint(@"hash_3aff3e8d6e0b45da", 0);
    }
    return level.var_315d0a115fe536ee;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc8
// Size: 0x25
function function_785d7c2ae5066f66(var_3d329ebb0d03d6db, var_c95404cd83f761b6) {
    if (var_c95404cd83f761b6.size == 0) {
        return;
    }
    var_3d329ebb0d03d6db = var_3d329ebb0d03d6db % var_c95404cd83f761b6.size;
    return var_c95404cd83f761b6[var_3d329ebb0d03d6db];
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4df5
// Size: 0x238
function private function_96e56767b949c013(var_61b36239e6c3d026, var_3d329ebb0d03d6db, var_849e91c5e0d0e0df) {
    if (!isdefined(var_61b36239e6c3d026.angles)) {
        var_61b36239e6c3d026.angles = (0, 0, 0);
    }
    var_5715a6f63100ca0f = "br_plunder_box";
    if (!isdefined(var_61b36239e6c3d026.var_4041cda36a5951ff)) {
        var_61b36239e6c3d026.var_4041cda36a5951ff = "br_plunder_box";
    }
    if (isdefined(var_61b36239e6c3d026.var_98a72274e33ca7d5)) {
        var_61b36239e6c3d026.var_4041cda36a5951ff = "br_plunder_box_high_tier";
    }
    buystation = spawnscriptable(var_61b36239e6c3d026.var_4041cda36a5951ff, var_61b36239e6c3d026.origin, var_61b36239e6c3d026.angles);
    var_11a7769e6c3c691f = "visible";
    if (getdvarint(@"hash_be0526203e262092", 0) && getdvarint(@"hash_bac643b1a9d211a7", 0)) {
        var_11a7769e6c3c691f = "hidden";
    }
    buystation setscriptablepartstate("br_plunder_box", var_11a7769e6c3c691f);
    buystation.var_afc028d00356e443 = buystation.origin + rotatevector((12, 0, 0), buystation.angles);
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("Unexpected killstreak purchase type: ", "trophy_refill", undefined, "brloot_offhand_advancedvehicledrop", undefined, undefined, var_61b36239e6c3d026.poi, var_61b36239e6c3d026.origin);
    #/
    if (isdefined(var_3d329ebb0d03d6db)) {
        buystation.var_7940dcde72827af7 = var_3d329ebb0d03d6db;
    }
    if (isdefined(var_3d329ebb0d03d6db)) {
        buystation.var_ded92ccb217bbaeb = var_849e91c5e0d0e0df;
    }
    if (isdefined(var_61b36239e6c3d026.target)) {
        foreach (struct in getstructarray(var_61b36239e6c3d026.target, "targetname")) {
            if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "kiosk_spawn_jltv_mg") {
                buystation.var_db32abf0a18cadf6 = struct;
            }
        }
    }
    return buystation;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5035
// Size: 0x13d
function private function_b8e0fea098fb260b(var_cb8ce683e2999310) {
    if (!isdefined(var_cb8ce683e2999310.target)) {
        return;
    }
    var_459c7f8de067151 = getstructarray(var_cb8ce683e2999310.target, "targetname");
    foreach (struct in var_459c7f8de067151) {
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "workbench") {
            if (!isdefined(struct.angles)) {
                struct.angles = (0, 0, 0);
            }
            workbench = spawnscriptable("br_workbench", struct.origin, struct.angles);
            workbench setscriptablepartstate("br_workbench", "visible");
            /#
                namespace_d1a9ca87d78d9813::function_9533653868e59fb6("[ WHY_NO_BUYBACK TEST] buyback from - ", "buy_station_insured_slot", undefined, "allowLateJoiners", undefined, undefined, struct.poi, struct.origin);
            #/
            return;
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5179
// Size: 0x5f7
function function_e486c07c28a71f34() {
    if (!istrue(level.var_8dea6607b3189a60)) {
        return;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_d3a06cc30bc1f068 = getdvarint(@"hash_1891a7c9188f098a", 1);
    var_ac63cd16a707ecea = getdvarint(@"hash_1eaaeec5fba02706", 3);
    var_7de18efb644429dc = getdvarint(@"hash_4cc790851bc37d7c", 3);
    var_abd2eabec6cf5f1e = randomintrange(var_ac63cd16a707ecea, var_7de18efb644429dc + 1);
    var_5fda87ce72d1d195 = getdvarint(@"hash_eecbc418c6540507", 0);
    var_48cb4df1fbab9006 = getdvarint(@"hash_5d7d5915e01d1303", 0);
    var_d1167a8340d7b64 = squared(getdvarint(@"hash_61f3403e27e2815f", 3000));
    level.var_6aa304e25520289f = getstructarray("buy_station", "targetname");
    if (level.var_6aa304e25520289f.size == 0) {
        return;
    }
    var_a165c118f696aa70 = getdvarint(@"hash_4409a87281d77ed1", 0);
    var_68f55b32ad3368e1 = function_68f55b32ad3368e1();
    if (var_5fda87ce72d1d195 > 0) {
        var_4f95d97a13077392 = 0;
        var_e97a51e0f9b0c2d1 = level.var_6aa304e25520289f.size;
        var_2446ae45ef06bf3d = [];
        level.var_6aa304e25520289f = array_randomize(level.var_6aa304e25520289f);
        for (var_a0add690b201f3ad = 0; var_a0add690b201f3ad < var_e97a51e0f9b0c2d1; var_a0add690b201f3ad++) {
            if (namespace_c5622898120e827f::function_d449927f9683e871(level.var_6aa304e25520289f[var_a0add690b201f3ad].origin)) {
                inrange = 0;
                foreach (station in var_2446ae45ef06bf3d) {
                    if (distance2dsquared(station.origin, level.var_6aa304e25520289f[var_a0add690b201f3ad].origin) < var_d1167a8340d7b64) {
                        inrange = 1;
                        break;
                    }
                }
                if (inrange) {
                    continue;
                }
                var_2446ae45ef06bf3d[var_2446ae45ef06bf3d.size] = function_2fcaa447c4e7d4a0(level.var_6aa304e25520289f[var_a0add690b201f3ad], var_4f95d97a13077392);
                var_4f95d97a13077392++;
                if (var_4f95d97a13077392 == var_5fda87ce72d1d195) {
                    break;
                }
            }
        }
    } else if (!var_a165c118f696aa70 && !var_68f55b32ad3368e1) {
        var_a503ff4c72c94afe = [];
        var_932be85924f099d8 = [];
        var_e97a51e0f9b0c2d1 = level.var_6aa304e25520289f.size;
        for (var_a0add690b201f3ad = 0; var_a0add690b201f3ad < var_e97a51e0f9b0c2d1; var_a0add690b201f3ad++) {
            buystation = level.var_6aa304e25520289f[var_a0add690b201f3ad];
            if (!isdefined(buystation.poi)) {
                continue;
            }
            if (!isdefined(var_a503ff4c72c94afe[buystation.poi])) {
                var_a503ff4c72c94afe[buystation.poi] = [];
                var_932be85924f099d8[var_932be85924f099d8.size] = buystation.poi;
            }
            var_a503ff4c72c94afe[buystation.poi][var_a503ff4c72c94afe[buystation.poi].size] = buystation;
        }
        var_932be85924f099d8 = array_randomize(var_932be85924f099d8);
        var_4f95d97a13077392 = 0;
        var_97218eef96cd3102 = 0;
        foreach (var_72f29fa8dac796bb in var_932be85924f099d8) {
            if (var_97218eef96cd3102 == var_abd2eabec6cf5f1e) {
                break;
            }
            if (!namespace_37f0fb6355a4618a::function_faa6481e65f14ade(var_72f29fa8dac796bb)) {
                continue;
            }
            if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" && namespace_36f464722d326bbe::function_7ee65fae13124702()) {
                var_4f95d97a13077392 = function_eaca292314678f38(var_4f95d97a13077392, var_a503ff4c72c94afe[var_72f29fa8dac796bb], var_72f29fa8dac796bb);
            } else {
                var_8761fecdf09added = var_a503ff4c72c94afe[var_72f29fa8dac796bb];
                var_2a980b0531901c38 = var_d3a06cc30bc1f068;
                if (var_2a980b0531901c38 > var_8761fecdf09added.size) {
                    var_2a980b0531901c38 = var_8761fecdf09added.size;
                }
                var_8761fecdf09added = array_slice(array_randomize(var_8761fecdf09added), 0, var_2a980b0531901c38);
                for (var_a0add690b201f3ad = 0; var_a0add690b201f3ad < var_8761fecdf09added.size; var_a0add690b201f3ad++) {
                    namespace_a4b43c1cf86c6fe5::function_2fcaa447c4e7d4a0(var_8761fecdf09added[var_a0add690b201f3ad], var_4f95d97a13077392);
                    var_4f95d97a13077392++;
                }
            }
        }
    } else {
        var_6aa304e25520289f = level.var_6aa304e25520289f;
        if (!var_68f55b32ad3368e1) {
            var_6aa304e25520289f = array_slice(array_randomize(level.var_6aa304e25520289f), 0, var_d3a06cc30bc1f068);
        }
        var_e97a51e0f9b0c2d1 = var_6aa304e25520289f.size;
        var_4f95d97a13077392 = 0;
        for (var_a0add690b201f3ad = 0; var_a0add690b201f3ad < var_e97a51e0f9b0c2d1; var_a0add690b201f3ad++) {
            namespace_a4b43c1cf86c6fe5::function_2fcaa447c4e7d4a0(var_6aa304e25520289f[var_a0add690b201f3ad], var_4f95d97a13077392);
            var_4f95d97a13077392++;
        }
    }
    if (var_48cb4df1fbab9006 > 0) {
        var_209967c144016964 = level.br_level.br_circlecenters.size;
        var_209967c144016964 = int(max(var_209967c144016964 - 1, 0));
        var_3e0f25f7303cf9d1 = (level.br_level.br_circlecenters[var_209967c144016964][0], level.br_level.br_circlecenters[var_209967c144016964][1], 0);
        level.var_6aa304e25520289f = sortbydistance(level.var_6aa304e25520289f, var_3e0f25f7303cf9d1);
        var_5998f57ab1f3c248 = 0;
        for (var_a0add690b201f3ad = 0; var_a0add690b201f3ad < level.var_6aa304e25520289f.size; var_a0add690b201f3ad++) {
            inrange = 0;
            foreach (buystation in level.br_armory_kiosk.scriptables) {
                if (distance2dsquared(level.var_6aa304e25520289f[var_a0add690b201f3ad].origin, buystation.origin) < var_d1167a8340d7b64) {
                    inrange = 1;
                    break;
                }
            }
            if (inrange) {
                var_5998f57ab1f3c248++;
                if (var_5998f57ab1f3c248 == var_48cb4df1fbab9006) {
                    break;
                }
            } else {
            LOC_000005ca:
                function_2fcaa447c4e7d4a0(level.var_6aa304e25520289f[var_a0add690b201f3ad], var_4f95d97a13077392);
                var_4f95d97a13077392++;
                var_5998f57ab1f3c248++;
                if (var_5998f57ab1f3c248 == var_48cb4df1fbab9006) {
                    break;
                }
            }
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5777
// Size: 0x86
function function_86f5339f1334e16(var_cab957adc8d7710f) {
    level endon("game_ended");
    if (!level.br_debugsolotest) {
        level waittill("prematch_done");
        waitframe();
    }
    if (!isdefined(level.var_f3bff22d504c243a) || level.var_f3bff22d504c243a.size == 0) {
        return;
    }
    for (i = 0; i < level.var_f3bff22d504c243a.size; i++) {
        function_7cb54f604c35be8c(level.var_f3bff22d504c243a[i]);
    }
    flag_set("buy_stations_spawned");
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5804
// Size: 0x1a8
function function_2fcaa447c4e7d4a0(var_61b36239e6c3d026, var_4f95d97a13077392) {
    if (isdefined(level.var_6aa304e25520289f)) {
        level.var_6aa304e25520289f = array_remove(level.var_6aa304e25520289f, var_61b36239e6c3d026);
    }
    if (isdefined(var_61b36239e6c3d026.var_5ea299587b551f9f)) {
        var_bf02f24d129fcca9 = tablelookuprownum("mp/buyStation/buyStationDefs.csv", 1, var_61b36239e6c3d026.var_5ea299587b551f9f);
        var_3d329ebb0d03d6db = int(tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_bf02f24d129fcca9, 0));
    } else {
        var_3d329ebb0d03d6db = undefined;
        if (isdefined(level.var_6be7b375ec4a629c) && level.var_6be7b375ec4a629c.size > 0) {
            var_3d329ebb0d03d6db = function_785d7c2ae5066f66(var_4f95d97a13077392, level.var_6be7b375ec4a629c)["index"];
        }
    }
    if (isdefined(var_61b36239e6c3d026.var_c4231c7dde966d14)) {
        var_bf02f24d129fcca9 = tablelookuprownum("mp/buyStation/buyStationDefs.csv", 1, var_61b36239e6c3d026.var_c4231c7dde966d14);
        var_849e91c5e0d0e0df = int(tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_bf02f24d129fcca9, 0));
    } else {
        var_849e91c5e0d0e0df = undefined;
        if (isdefined(level.var_3899105ceec08fb8) && level.var_3899105ceec08fb8.size > 0) {
            var_849e91c5e0d0e0df = function_785d7c2ae5066f66(var_4f95d97a13077392, level.var_3899105ceec08fb8)["index"];
        }
    }
    if (namespace_dbfbff3eb10fab94::function_19598c1ea1487b84()) {
        function_b8e0fea098fb260b(var_61b36239e6c3d026);
    }
    buystation = function_96e56767b949c013(var_61b36239e6c3d026, var_3d329ebb0d03d6db, var_849e91c5e0d0e0df);
    buystation.var_5ea299587b551f9f = var_61b36239e6c3d026.var_5ea299587b551f9f;
    level.br_armory_kiosk.scriptables[level.br_armory_kiosk.scriptables.size] = buystation;
    return buystation;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b4
// Size: 0x42
function function_53542c92143aa5eb(var_cab957adc8d7710f, var_61b36239e6c3d026) {
    if (!isdefined(level.var_f3bff22d504c243a)) {
        level.var_f3bff22d504c243a = [];
    }
    level.var_f3bff22d504c243a[level.var_f3bff22d504c243a.size] = var_61b36239e6c3d026;
    return var_61b36239e6c3d026;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59fe
// Size: 0x52
function function_7cb54f604c35be8c(var_61b36239e6c3d026) {
    /#
        assert(isdefined(level.br_armory_kiosk));
    #/
    var_4f95d97a13077392 = level.br_armory_kiosk.scriptables.size;
    var_d436c77055614ca6 = function_2fcaa447c4e7d4a0(var_61b36239e6c3d026, var_4f95d97a13077392);
    return var_d436c77055614ca6;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a58
// Size: 0x64
function function_27c1cd609d90c09(var_a1515a5680a32aef) {
    for (var_4f95d97a13077392 = 0; var_4f95d97a13077392 < var_a1515a5680a32aef.size; var_4f95d97a13077392++) {
        var_d436c77055614ca6 = function_2fcaa447c4e7d4a0(var_a1515a5680a32aef[var_4f95d97a13077392], var_4f95d97a13077392);
        level.br_armory_kiosk.scriptables[level.br_armory_kiosk.scriptables.size] = var_d436c77055614ca6;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ac3
// Size: 0x6f
function function_e6c1c35181a2870f(var_cab957adc8d7710f) {
    if (!istrue(level.br_armory_kiosk_enabled)) {
        return;
    }
    var_82aaa7c31b818b16 = getentitylessscriptablearray("scriptable_br_plunder_box", "classname");
    var_25227f181a5bb8c9 = var_82aaa7c31b818b16;
    if (istrue(level.var_8dea6607b3189a60)) {
        var_91b00de1b63a7e5a = getstructarray(var_cab957adc8d7710f, "targetname");
        var_25227f181a5bb8c9 = array_combine_unique(var_25227f181a5bb8c9, var_91b00de1b63a7e5a);
    }
    return var_25227f181a5bb8c9;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b3a
// Size: 0xfa
function function_4e433ca69aee9a03(instance, player) {
    if (istrue(level.gameended)) {
        return 0;
    }
    if ((!player namespace_f8065cafc523dba5::_isalive() || istrue(player.inlaststand)) && !namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        return 0;
    }
    if (player namespace_448ccf1ca136fbbe::isusingremote()) {
        return 0;
    }
    if (player namespace_f8065cafc523dba5::isinvehicle()) {
        return 0;
    }
    if (istrue(player namespace_71073fa38f11492::runbrgametypefunc("playerSkipKioskUse", instance))) {
        return 0;
    }
    if (istrue(player.iscarrying)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/CANNOT_USE_GENERIC");
        return 0;
    }
    if (istrue(player.isjuggernaut)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyjuggernaut);
        return 0;
    }
    if (istrue(instance.locked)) {
        if (!isdefined(instance.var_8d6dbcf5443a11f0)) {
            instance.var_8d6dbcf5443a11f0 = 0;
        }
        instance.var_8d6dbcf5443a11f0++;
        return 0;
    }
    return 1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3c
// Size: 0x229
function armorykioskused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!namespace_d3d40f75bb4e4c32::isKiosk(instance.type) && !namespace_d3d40f75bb4e4c32::function_a84a6acb3c2edcae(instance.type)) {
        return;
    }
    if (istrue(instance.var_a84a6acb3c2edcae) && !array_contains(instance.players, player)) {
        return;
    }
    if (istrue(var_a5b2c541413aa895) && !function_7e0281196d6407c8()) {
        return;
    }
    if (!isdefined(player)) {
        player = self;
    }
    if (istrue(var_a5b2c541413aa895) && !isdefined(player.armorykioskpurchaseallowed)) {
        player.armorykioskpurchaseallowed = 0;
    }
    if (getdvarint(@"hash_ece0c71aa9d5c939", 0)) {
        player function_c471a0358a06a7f0();
    }
    if (!function_4e433ca69aee9a03(instance, player)) {
        if (istrue(var_a5b2c541413aa895)) {
            player.armorykioskpurchaseallowed = 0;
        }
        return;
    }
    if (!isdefined(instance.playersused)) {
        instance.playersused = [];
    }
    if (!array_contains(instance.playersused, player)) {
        instance.playersused[instance.playersused.size] = player;
    }
    if (istrue(instance.var_b19f232ff8887a72)) {
        if (soundexists("br_plunder_atm_cancel")) {
            player playlocalsound("br_plunder_atm_cancel");
        }
        player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/UNUSABLE_KIOSK");
        return;
    }
    if (!isdefined(instance.playersusing)) {
        instance.playersusing = [];
    }
    instance.playersusing[instance.playersusing.size] = player;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("biometricScan", "reportKeycardCount")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("biometricScan", "reportKeycardCount") ]](player);
    }
    if (istrue(var_a5b2c541413aa895)) {
        if (!player.armorykioskpurchaseallowed) {
            function_28d837f720b03bfa(instance, player);
        }
    } else {
        if (istrue(player.insertingarmorplate)) {
            player notify("try_armor_cancel", "armory_kiosk_used");
        }
        if (isdefined(instance)) {
            function_9bca399aafce0b41(instance, part, state);
        }
        player thread _runpurchasemenu(instance);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e6c
// Size: 0xef
function function_9bca399aafce0b41(kiosk, part, currentstate) {
    if (!isdefined(part)) {
        if (namespace_d3d40f75bb4e4c32::isKiosk(kiosk.type)) {
            part = "br_plunder_box";
        } else if (istrue(kiosk.var_a84a6acb3c2edcae)) {
            part = "br_plunder_box_stronghold";
        } else {
            return;
        }
    }
    if (!isdefined(currentstate)) {
        currentstate = kiosk getscriptablepartstate(part);
    }
    switch (currentstate) {
    case #"hash_2a59780b5f94bfdd":
    case #"hash_30df217077b73b50":
    case #"hash_b799d1d25a80c481":
    case #"hash_b8e6f37f38dbc6b1":
    case #"hash_fb4008fe550f76ab":
        break;
    default:
        return;
    }
    newstate = "opening";
    if (currentstate == "firesale_visible") {
        newstate = "firesale_opening";
    }
    kiosk setscriptablepartstate(part, newstate);
    kiosk thread kioskfixupproneplayers();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f62
// Size: 0x288
function function_c471a0358a06a7f0() {
    player = self;
    foreach (p in level.teamdata[player.team]["players"]) {
        if (!isdefined(p)) {
            continue;
        }
        if (istrue(level.usegulag)) {
            var_679ec0d579e8d5f3 = p.game_extrainfo & 512;
            gulagarena = p.game_extrainfo & 1024;
            var_43fb259f4877f32c = istrue(p.wasingulag);
            var_c3ff2e180fe8a431 = isdefined(p.gulag);
            var_bc61b790659a94dc = istrue(p.gulag);
            var_5507b0bf5d504e84 = isdefined(p.gulagarena);
            var_9a5b643e836607ef = istrue(p.gulagarena);
            var_80668ba94093c0c7 = istrue(p.gulagloser);
            arena = namespace_ad49798629176e96::function_2f4344abdc200e43(p);
            var_a5afca0d858d1b83 = isdefined(arena);
        } else {
            var_679ec0d579e8d5f3 = 0;
            gulagarena = 0;
            var_43fb259f4877f32c = 0;
            var_c3ff2e180fe8a431 = 0;
            var_bc61b790659a94dc = 0;
            var_5507b0bf5d504e84 = 0;
            var_9a5b643e836607ef = 0;
            var_80668ba94093c0c7 = 0;
            arena = 0;
            var_a5afca0d858d1b83 = 0;
        }
        eliminated = istrue(p.br_iseliminated);
        isplayeralive = isalive(p);
        var_76456258573201bd = p.sessionstate;
        var_967d26d713a6f95c = isdefined(p getspectatingplayer());
        var_86f37cfa6384dccc = var_967d26d713a6f95c;
        var_3f78c6a0862f9e25 = p.var_3f78c6a0862f9e25;
        logstring("[ WHY_NO_BUYBACK TEST] : " + p.name + ", " + eliminated + ", " + var_679ec0d579e8d5f3 + ", " + gulagarena + ", " + var_43fb259f4877f32c + ", " + var_c3ff2e180fe8a431 + ", " + var_bc61b790659a94dc + ", " + var_5507b0bf5d504e84 + ", " + var_9a5b643e836607ef + ", " + var_80668ba94093c0c7 + ", " + var_a5afca0d858d1b83 + ", " + isplayeralive + ", " + var_76456258573201bd + ", " + var_86f37cfa6384dccc + ", " + var_3f78c6a0862f9e25);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61f1
// Size: 0x116
function kioskfixupproneplayers() {
    if (!getdvarint(@"hash_636451c6314df097", 1)) {
        return;
    }
    radius = getdvarfloat(@"hash_3990f3347374d18e", 300);
    var_a427ded21077317 = sortbydistancecullbyradius(level.players, self.origin, radius);
    foreach (player in var_a427ded21077317) {
        if (!isdefined(player) || !isalive(player)) {
            continue;
        }
        if (player getstance() != "prone") {
            continue;
        }
        halfsize = player getboundshalfsize();
        radius = halfsize[0];
        height = 2 * halfsize[2];
        if (capsuletracepassed(player.origin, radius, height, undefined, 0, 0)) {
            continue;
        }
        player setstance("crouch", 1);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630e
// Size: 0xc3
function kiosksetupfiresaleforplayer(kiosk, player) {
    if (!isdefined(kiosk.firesaleforplayers)) {
        kiosk.firesaleforplayers = [0:player];
    } else if (!array_contains(kiosk.firesaleforplayers, player)) {
        kiosk.firesaleforplayers = array_add(kiosk.firesaleforplayers, player);
    }
    if (!kiosk namespace_1eb3c4e0e28fac71::checkforactiveobjicon()) {
        kiosk namespace_1eb3c4e0e28fac71::createquestobjicon("ui_mp_br_mapmenu_icon_poi_plunder_box_firesale", "active", kiosk.origin);
    }
    kiosk namespace_1eb3c4e0e28fac71::showquestobjicontoplayer(player);
    if (istrue(kiosk.var_ce5c1024bca39998) && !istrue(kiosk.var_f061c35d77eae8fa)) {
        kiosk thread function_7e681bf3d2159ccf();
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63d8
// Size: 0x42
function function_7e681bf3d2159ccf() {
    if (!istrue(self.var_f061c35d77eae8fa)) {
        self.var_f061c35d77eae8fa = 1;
    }
    while (namespace_1eb3c4e0e28fac71::checkforactiveobjicon()) {
        namespace_4bc0ead8d2af3d84::movequestobjicon(self.origin);
        waitframe();
    }
    self.var_f061c35d77eae8fa = 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6421
// Size: 0x12
function function_d7f25b3c73157f5c() {
    if (namespace_d76af9f804655767::ispubliceventoftypeactive(2)) {
        return 1;
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x643b
// Size: 0x79
function iskioskfiresaleactiveforplayer(kiosk, player) {
    if (!isdefined(kiosk)) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a() && (!isdefined(kiosk) || isint(kiosk))) {
        kiosk = player;
    }
    if (function_d7f25b3c73157f5c()) {
        return 1;
    }
    if (istrue(player.var_f33cc04cfb0810b7)) {
        return 1;
    }
    if (!isdefined(kiosk.firesaleforplayers)) {
        return 0;
    }
    return array_contains(kiosk.firesaleforplayers, player);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64bc
// Size: 0x61
function kioskfiresaledoneforplayer(kiosk, player) {
    if (!isdefined(kiosk.firesaleforplayers)) {
        return;
    }
    kiosk namespace_1eb3c4e0e28fac71::hidequestobjiconfromplayer(player);
    kiosk.firesaleforplayers = array_remove(kiosk.firesaleforplayers, player);
    if (!function_d7f25b3c73157f5c()) {
        setomnvar("ui_br_kiosk_hide_discount", 1);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6524
// Size: 0x29
function function_1a8066ccdb91c1d1() {
    if (isdefined(level.var_d03e6ba38b56b4ab) && istrue(level.var_d03e6ba38b56b4ab)) {
        return level.var_fb60f0244999d528;
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6555
// Size: 0x75
function getkioskyawoffsetoverride() {
    if (isdefined(level.var_d03e6ba38b56b4ab) && istrue(level.var_d03e6ba38b56b4ab)) {
        var_924453750f53a090 = level.var_e9f7702d839b262c;
        if (level.var_f454c63919420aa9 > 0) {
            var_924453750f53a090 = var_924453750f53a090 + randomfloatrange(level.var_f454c63919420aa9 * -1, level.var_f454c63919420aa9);
        }
        return var_924453750f53a090;
    }
    return 180 + randomfloatrange(-10, 10);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65d2
// Size: 0xaa
function function_33ee0ada0b02b12a(kiosk) {
    if (!isdefined(kiosk.dropstruct)) {
        kiosk.dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        kiosk.var_ef9b890e5f828228 = gettime();
        return;
    }
    if (kiosk.var_ef9b890e5f828228 + getdvarint(@"hash_30955f4b3a383805", 90) * 1000 < gettime()) {
        kiosk.dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        kiosk.var_ef9b890e5f828228 = gettime();
        kiosk.var_1ac656ba9c98b8db = undefined;
    } else {
        kiosk.var_ef9b890e5f828228 = gettime();
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6683
// Size: 0x65
function function_a5f8189dc840e9d6(var_2efbe865d1facdf) {
    player = self;
    if (isdefined(player.var_b8993f862c953db4) && player.var_b8993f862c953db4) {
        return;
    }
    player allowmovement(0);
    player.var_b8993f862c953db4 = 1;
    wait(var_2efbe865d1facdf);
    player allowmovement(1);
    player.var_b8993f862c953db4 = 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66ef
// Size: 0x300
function _runpurchasemenu(kiosk) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    player.br_kiosk = kiosk;
    function_33ee0ada0b02b12a(kiosk);
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        player notify("kiosk_used");
    }
    if (isdefined(level.var_6beff7b631ab7e18)) {
        [[ level.var_6beff7b631ab7e18 ]](kiosk, player);
    }
    if (level.var_ee08b1f41e7c2444) {
        player thread function_a5f8189dc840e9d6(2);
    }
    /#
        if (getdvarint(@"hash_80e2d358a4c12e43", 0) > 0) {
            kiosksetupfiresaleforplayer(kiosk, player);
            setdvar(@"hash_80e2d358a4c12e43", 0);
        }
    #/
    var_d47b7f992ca8a91e = iskioskfiresaleactiveforplayer(kiosk, player);
    var_b25a062b16392edd = function_879d297885591207(kiosk);
    if (isdefined(var_b25a062b16392edd)) {
        level.var_e7cee4fbb5b46ef2 = var_b25a062b16392edd;
        player setclientomnvar("ui_buystation_override", var_b25a062b16392edd);
    } else if (isdefined(level.var_4b3d0771df2c44a9) && !istrue(player.var_e5b7a6a0ec2b440e)) {
        level.var_e7cee4fbb5b46ef2 = level.var_4b3d0771df2c44a9;
        player setclientomnvar("ui_buystation_override", level.var_4b3d0771df2c44a9);
    }
    if (istrue(level.var_c153eac6e7c0e1a2)) {
        var_78b116ff4ed463b9 = namespace_25c7d0f5cb1e4346::function_6b9fb04b51e91720(player, kiosk);
        player setclientomnvar("ui_barter_list_index", var_78b116ff4ed463b9);
    }
    var_aba76bfe006a0128 = function_2a50f66eb0ec8756(kiosk);
    if (isdefined(var_aba76bfe006a0128)) {
        level.var_747666592ae8cb22 = var_aba76bfe006a0128;
        player setclientomnvar("ui_weapon_buystation_override", var_aba76bfe006a0128);
    }
    var_6b3c6b40c0598d85 = function_b88d64cd67bbe60f(kiosk);
    if (isdefined(var_6b3c6b40c0598d85)) {
        player setclientomnvar("ui_buystation_limited_item_amount", var_6b3c6b40c0598d85);
    }
    var_5dcb74bc7c559130 = function_596ce27c393e3593(kiosk);
    if (isdefined(var_5dcb74bc7c559130)) {
        player setclientomnvar("ui_buystation_item_filter", var_5dcb74bc7c559130);
    }
    setomnvar("ui_br_kiosk_hide_discount", 0);
    player setclientomnvar("ui_buystation_purchase_response", 0);
    if (istrue(player.br_kiosk.var_a84a6acb3c2edcae)) {
        player setclientomnvar("ui_options_menu", 2);
    } else {
        var_254f655d3a722a22 = 0;
        if (istrue(player.br_kiosk.var_746c06c00cd6bdc5)) {
            var_254f655d3a722a22 = var_254f655d3a722a22 + 16;
        } else {
            var_254f655d3a722a22 = var_254f655d3a722a22 + 2;
        }
        if (var_d47b7f992ca8a91e) {
            var_254f655d3a722a22 = var_254f655d3a722a22 + 4;
        }
        if (istrue(kiosk.var_114e759371623080)) {
            var_254f655d3a722a22 = var_254f655d3a722a22 + 32;
        }
        player setclientomnvar("ui_buystation_open", var_254f655d3a722a22);
    }
    player.armorykioskpurchaseallowed = 1;
    namespace_a011fbf6d93f25e5::branalytics_kiosk_menu_event(player, "menu_open");
    player thread function_b543ed41cdf64895(kiosk);
    if (getdvarint(@"hash_b4ff8c1463b8bc79", 1)) {
        player setsoundsubmix("iw8_br_plunder_kiosk_menu");
    }
    player namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
    player namespace_71073fa38f11492::runbrgametypefunc("playerKioskUsed", kiosk);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f6
// Size: 0x71
function function_28d837f720b03bfa(kiosk, player) {
    player.br_kiosk = kiosk;
    /#
        if (getdvarint(@"hash_80e2d358a4c12e43", 0) > 0) {
            kiosksetupfiresaleforplayer(kiosk, player);
            setdvar(@"hash_80e2d358a4c12e43", 0);
        }
    #/
    player.armorykioskpurchaseallowed = 1;
    player thread function_ab62cd6135dfe6(kiosk);
    player namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a6e
// Size: 0x43
function function_5221f0c9bdea6589() {
    player = self;
    player.br_kiosk = undefined;
    player.var_e5b7a6a0ec2b440e = undefined;
    player.var_c77002478cdfd85f = undefined;
    player.armorykioskpurchaseallowed = undefined;
    player namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ab8
// Size: 0x62
function function_ab62cd6135dfe6(kiosk) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    player childthread function_59e987d44a301ef5(kiosk);
    waittill_any_ents(player, "death", player, "last_stand_start", player, "exit_quick_purchase_zone", level, "game_ended");
    if (isdefined(player)) {
        function_5221f0c9bdea6589();
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b21
// Size: 0x25
function private function_ef547f1865e05653(var_97aa74c2193a9dc6) {
    player = self;
    player setclientomnvar("ui_buystation_purchase_response", var_97aa74c2193a9dc6);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b4d
// Size: 0x71
function private function_c8bd59cde912455f(var_97aa74c2193a9dc6) {
    player = self;
    if (var_97aa74c2193a9dc6 == 1 && getdvarint(@"hash_ed6e4ffa933af621", 1)) {
        if (!isdefined(player.br_kiosk) || !istrue(player.br_kiosk.var_a84a6acb3c2edcae)) {
            player function_ef547f1865e05653(1);
            return;
        }
    }
    player _closepurchasemenuwithresponse(var_97aa74c2193a9dc6);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bc5
// Size: 0x29c
function _closepurchasemenuwithresponse(var_97aa74c2193a9dc6) {
    player = self;
    player setclientomnvar("ui_buystation_purchase_response", var_97aa74c2193a9dc6);
    player setclientomnvar("ui_buystation_open", 1);
    player setclientomnvar("ui_buystation_override", -1);
    player setclientomnvar("ui_weapon_buystation_override", -1);
    player clearsoundsubmix("iw8_br_plunder_kiosk_menu");
    namespace_141c4634b6ea7b27::function_fed77cd5c54efe19(player.var_c77002478cdfd85f, player);
    if (isdefined(player.br_kiosk)) {
        if (isdefined(player.br_kiosk) && isdefined(player.br_kiosk.playersusing) && array_contains(player.br_kiosk.playersusing, player)) {
            player.br_kiosk.playersusing = array_remove(player.br_kiosk.playersusing, player);
        }
        if (istrue(player.br_kiosk.var_a84a6acb3c2edcae)) {
            if (var_97aa74c2193a9dc6 == 1 && array_contains(player.br_kiosk.players, player)) {
                player.br_kiosk.players = array_remove(player.br_kiosk.players, player);
                player.br_kiosk.var_4261eb2ab67db6f7 = array_add(player.br_kiosk.var_4261eb2ab67db6f7, player);
                player.br_kiosk namespace_bd614c3c2275579a::function_648d8f21bd9dc5c4(player);
                if (player.br_kiosk.players.size <= 0 && !istrue(level.var_25e8b4afe5e06169)) {
                    player.br_kiosk setscriptablepartstate("br_plunder_box_stronghold", "visible_blank");
                }
            }
            player setclientomnvar("ui_options_menu", 0);
        }
    }
    player.br_kiosk = undefined;
    player.var_e5b7a6a0ec2b440e = undefined;
    player.var_c77002478cdfd85f = undefined;
    player.armorykioskpurchaseallowed = undefined;
    player.var_192cbab14de92a20 = undefined;
    if (level.var_ee08b1f41e7c2444 && isdefined(player.var_b8993f862c953db4) && player.var_b8993f862c953db4) {
        player allowmovement(1);
        player.var_b8993f862c953db4 = 0;
    }
    namespace_a011fbf6d93f25e5::branalytics_kiosk_menu_event(player, "menu_close", "reason: " + var_97aa74c2193a9dc6);
    player notify("_watchToAutoCloseMenu_end");
    player namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e68
// Size: 0x1d
function _purchasemenuclosedbyclient(player) {
    player function_c8bd59cde912455f(0);
    player notify("_watchToAutoCloseMenu_end");
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e8c
// Size: 0xd0
function function_b543ed41cdf64895(kiosk) {
    player = self;
    player endon("disconnect");
    player notify("_watchToAutoCloseMenu_end");
    player endon("_watchToAutoCloseMenu_end");
    player childthread _proximitywatcher(kiosk);
    waittill_any_ents(player, "death", player, "last_stand_start", player, "pushed_too_far", level, "game_ended");
    if (isdefined(player.pers["telemetry"])) {
        if (istrue(player.pers["telemetry"].var_399eb9ea9da87875)) {
            player.pers["telemetry"].var_b04abd5d84312acb = 1;
            player.pers["telemetry"].var_399eb9ea9da87875 = 0;
        }
    }
    player function_c8bd59cde912455f(2);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f63
// Size: 0xab
function _proximitywatcher(kiosk) {
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a() && isint(kiosk)) {
        kiosk = self;
    }
    player = self;
    var_23d839b7d0ace88a = 64;
    var_525b03beaf285c54 = getdvarfloat(@"hash_ecd52993b5dab130", 128) + var_23d839b7d0ace88a;
    maxdistsquared = var_525b03beaf285c54 * var_525b03beaf285c54;
    while (1) {
        wait(0.1);
        var_77c977c78b3f7d84 = distancesquared(player.origin, kiosk.origin);
        if (var_77c977c78b3f7d84 > maxdistsquared) {
            player notify("pushed_too_far");
            break;
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7015
// Size: 0x4e
function _getequipmentammotomax(equipmentref) {
    player = self;
    if (!isdefined(equipmentref)) {
        return 0;
    }
    ammo = player namespace_1a507865f681850e::getequipmentammo(equipmentref);
    ammomax = player namespace_1a507865f681850e::getequipmentmaxammo(equipmentref);
    return max(0, ammomax - ammo);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706b
// Size: 0x55
function _maxoutequipmentammo(equipmentref) {
    player = self;
    if (!isdefined(equipmentref)) {
        return 0;
    }
    ammo = player namespace_1a507865f681850e::getequipmentammo(equipmentref);
    ammomax = player namespace_1a507865f681850e::getequipmentmaxammo(equipmentref);
    if (ammo < ammomax) {
        player namespace_1a507865f681850e::setequipmentammo(equipmentref, ammomax);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70c7
// Size: 0x3
function function_8c8f1e3f153a6fa3() {
    
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d1
// Size: 0x304
function _findgivearmoramountanddropleftovers(var_7f437a5779c8787c, var_2737cac9ee8f6098) {
    player = self;
    var_3e048ef43950bbd7 = player namespace_1a507865f681850e::getequipmentslotammo("health");
    if (!isdefined(var_3e048ef43950bbd7)) {
        var_3e048ef43950bbd7 = 0;
    }
    var_ac932f5b44405f3b = player namespace_1a507865f681850e::getequipmentmaxammo("equip_armorplate");
    if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
        var_cf60cdc4e2f0e3d0 = 2;
    } else {
        var_cf60cdc4e2f0e3d0 = 5;
    }
    var_bf203ce62dd1c99c = int(max(min(var_cf60cdc4e2f0e3d0, var_ac932f5b44405f3b - var_3e048ef43950bbd7), 0));
    var_2fb86e1c9b4c6464 = var_cf60cdc4e2f0e3d0 - var_bf203ce62dd1c99c;
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    if (istrue(var_7f437a5779c8787c) && isdefined(player.br_kiosk)) {
        var_e1d097c517c3af5b = player.br_kiosk namespace_cb965d2f71fefddc::function_4f4d537c794b2bf5();
        player.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
        dropstruct = player.br_kiosk.dropstruct;
    }
    if (namespace_aead94004cf4c147::function_7e103028c464ab9a("brloot_armor_plate")) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_armor_plate");
        var_60227bff1e9478cc = spawnstruct();
        var_60227bff1e9478cc.scriptablename = "brloot_armor_plate";
        var_60227bff1e9478cc.count = var_2fb86e1c9b4c6464;
        var_f94e260ac3c6121e = player namespace_aead94004cf4c147::addItemToBackpack(lootid, var_60227bff1e9478cc, 1);
        if (var_f94e260ac3c6121e > 0 && !istrue(var_2737cac9ee8f6098)) {
            baseorigin = player.origin;
            baseangles = player.angles;
            if (istrue(var_7f437a5779c8787c) && isdefined(player.br_kiosk)) {
                baseorigin = function_53c4c53197386572(player.br_kiosk.var_afc028d00356e443, player.br_kiosk.origin);
                baseangles = player.br_kiosk.angles;
            }
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
            namespace_cb965d2f71fefddc::spawnpickup("brloot_armor_plate", var_cb4fad49263e20c4, var_2fb86e1c9b4c6464, 1);
        }
    } else if (var_2fb86e1c9b4c6464 > 0 && !istrue(var_2737cac9ee8f6098)) {
        baseorigin = player.origin;
        baseangles = player.angles;
        if (istrue(var_7f437a5779c8787c) && isdefined(player.br_kiosk)) {
            baseorigin = function_53c4c53197386572(player.br_kiosk.var_afc028d00356e443, player.br_kiosk.origin);
            baseangles = player.br_kiosk.angles;
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
        namespace_cb965d2f71fefddc::spawnpickup("brloot_armor_plate", var_cb4fad49263e20c4, var_2fb86e1c9b4c6464, 1);
    }
    return var_bf203ce62dd1c99c;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73dd
// Size: 0xdb4
function _validateitempurchase(kiosk, itemdata, var_6dc0e605ecd21eee, var_7c3865dee4abed6, var_d260df4653b74cef) {
    player = self;
    var_3bdc75a8b6e7b7cd = ter_op(var_d260df4653b74cef, 2, 0);
    var_a55838d829a2c54b = ter_op(var_3bdc75a8b6e7b7cd == 2, 0, 1);
    if (istrue(itemdata.var_7cb19f95dbc68942)) {
        player function_c8bd59cde912455f(24);
        return 0;
    }
    var_b690d52fa5cc0957 = function_a0389e3244a68894(kiosk, itemdata.var_2ce272546e3ae7f0);
    if (!istrue(var_b690d52fa5cc0957)) {
        player function_c8bd59cde912455f(24);
        return 0;
    }
    var_f80ad141ca44a56c = function_6af40e269aae683e(kiosk, itemdata.var_2ce272546e3ae7f0);
    if (isdefined(var_f80ad141ca44a56c) && var_f80ad141ca44a56c <= 0) {
        player function_c8bd59cde912455f(24);
        return 0;
    }
    var_fbd5fada61ae8341 = _getactualcost(player, itemdata);
    if (!isdefined(player.plundercount)) {
        player.plundercount = 0;
    }
    if (player.plundercount < var_fbd5fada61ae8341) {
        player function_c8bd59cde912455f(3);
        return 0;
    }
    if (isdefined(itemdata.var_41f94bca374ed58a)) {
        var_e75264e51d24bb57 = namespace_a38a2e1fe7519183::function_59352c09a417a5e2(player, itemdata.var_41f94bca374ed58a);
        /#
            var_539ff4424cd96b25 = getdvarint(@"hash_7c258033cf2231ad", -1);
            if (var_539ff4424cd96b25 >= 0) {
                var_e75264e51d24bb57 = itemdata.var_41f94bca374ed58a == var_539ff4424cd96b25;
            }
        #/
        if (!var_e75264e51d24bb57) {
            return 0;
        }
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("kioskValidateItemPurchase")) {
        result = player namespace_71073fa38f11492::runbrgametypefunc("kioskValidateItemPurchase", kiosk, itemdata);
        if (isdefined(result)) {
            if (!istrue(result)) {
                return 0;
            } else {
                return 1;
            }
        }
    }
    if (itemdata.type == "killstreak") {
        if (!istrue(var_6dc0e605ecd21eee)) {
            if (player namespace_cb965d2f71fefddc::haskillstreak(itemdata.ref)) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(4);
                }
                return var_3bdc75a8b6e7b7cd;
            }
        }
    } else if (itemdata.type == "fieldupgrade" || itemdata.type == "super") {
        if (player namespace_85d036cb78063c4a::issuperinuse()) {
            if (var_a55838d829a2c54b) {
                player function_c8bd59cde912455f(6);
            }
            return var_3bdc75a8b6e7b7cd;
        }
        if (!istrue(var_6dc0e605ecd21eee)) {
            var_75630a54ff140ec2 = player namespace_85d036cb78063c4a::getcurrentsuperref();
            if (isdefined(var_75630a54ff140ec2) && itemdata.ref == var_75630a54ff140ec2) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(5);
                }
                return var_3bdc75a8b6e7b7cd;
            }
        }
    } else if (itemdata.type == "perk") {
        if (player namespace_82dcd1d5ae30ff7::_hasperk(itemdata.ref)) {
            if (var_a55838d829a2c54b) {
                player function_c8bd59cde912455f(5);
            }
            return var_3bdc75a8b6e7b7cd;
        }
    } else if (itemdata.type == "equipment") {
        if (istrue(var_7c3865dee4abed6)) {
            return 2;
        }
        var_6a8b46e184e181cc = spawnstruct();
        var_6a8b46e184e181cc.scriptablename = itemdata.var_2ce272546e3ae7f0;
        var_6a8b46e184e181cc.count = 1;
        var_dc297349765e2088 = namespace_cb965d2f71fefddc::cantakepickup(var_6a8b46e184e181cc, 1);
        switch (var_dc297349765e2088) {
        case 1:
        case 20:
            break;
        default:
            if (var_a55838d829a2c54b) {
                player function_c8bd59cde912455f(7);
            }
            return var_3bdc75a8b6e7b7cd;
            break;
        }
    } else if (itemdata.type == "weapon") {
        if (istrue(player.var_859654e0445a36d9)) {
            if (isdefined(level.br_pickups) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
            }
            return 0;
        }
        newweapon = namespace_cb965d2f71fefddc::getfullweaponobjforscriptablepartname(itemdata.ref);
        if (isdefined(newweapon)) {
            foreach (weap in player.primaryweapons) {
                if (issameweapon(weap, newweapon)) {
                    if (var_a55838d829a2c54b) {
                        player function_c8bd59cde912455f(7);
                    }
                    return 0;
                }
            }
            if (namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
                var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
                if (issameweapon(var_9ac5e72784815708, newweapon)) {
                    if (var_a55838d829a2c54b) {
                        player function_c8bd59cde912455f(7);
                    }
                    return 0;
                }
            }
        }
        return 1;
    } else if (itemdata.type == "special" || itemdata.type == "persistent") {
        switch (itemdata.ref) {
        case #"hash_2dcde97962801ba9":
        case #"hash_25789111b74943b4":
        case #"hash_43f2312fe01322cf":
            if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
                var_6a8b46e184e181cc = spawnstruct();
                var_6a8b46e184e181cc.scriptablename = "brloot_armor_plate";
                if (itemdata.ref == "armor_bundle") {
                    var_6a8b46e184e181cc.count = 5;
                } else {
                    var_6a8b46e184e181cc.count = 1;
                }
                var_dc297349765e2088 = namespace_cb965d2f71fefddc::cantakepickup(var_6a8b46e184e181cc);
                if (var_dc297349765e2088 != 1) {
                    if (var_a55838d829a2c54b) {
                        player function_c8bd59cde912455f(7);
                    }
                    return var_3bdc75a8b6e7b7cd;
                }
            }
            break;
        case #"hash_a7a7446a3194cb49":
            var_1f158ccaa5d9c0be = namespace_f8d3520d3483c1::function_92fec40b905c5112();
            if (!var_1f158ccaa5d9c0be) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(7);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_1b71e2c3430cd301":
        case #"hash_2d1a1b811aed6b26":
        case #"hash_dcf82d1f65a6b16e":
        case #"hash_d01e387e6d238502":
        case #"hash_4808e1f340e11163":
            if (istrue(var_7c3865dee4abed6)) {
                return 2;
            }
            var_6a8b46e184e181cc = spawnstruct();
            var_6a8b46e184e181cc.scriptablename = namespace_9c6cddd872ad75f7::function_d855f39e2b239317(itemdata.ref);
            /#
                assert(isdefined(var_6a8b46e184e181cc.scriptablename));
            #/
            var_6a8b46e184e181cc.count = namespace_9c6cddd872ad75f7::function_894adf8ce12d224d(var_6a8b46e184e181cc.scriptablename);
            var_dc297349765e2088 = namespace_cb965d2f71fefddc::cantakepickup(var_6a8b46e184e181cc, 1);
            switch (var_dc297349765e2088) {
            case 1:
            case 20:
                break;
            default:
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(7);
                }
                return var_3bdc75a8b6e7b7cd;
                break;
            }
            break;
        case #"hash_e67a71b27007444":
            if (istrue(var_7c3865dee4abed6)) {
                return 2;
            }
            var_b1db5698237fe274 = 0;
            if (player _getequipmentammotomax(player.equipment["primary"]) > 0) {
                var_b1db5698237fe274 = 1;
            } else if (player _getequipmentammotomax(player.equipment["secondary"]) > 0) {
                var_b1db5698237fe274 = 1;
            } else if (!player namespace_3bcd40a3005712ec::br_ammo_player_is_maxed_out()) {
                var_b1db5698237fe274 = 1;
            }
            if (!var_b1db5698237fe274) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(7);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_3839e36b1d747574":
        case #"hash_6613e243265c4795":
            if (namespace_cb965d2f71fefddc::respawntokendisabled()) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(9);
                }
                return 0;
            }
            if (istrue(var_7c3865dee4abed6)) {
                return 2;
            }
            if (istrue(player.hasrespawntoken)) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(10);
                }
                return 0;
            }
            break;
        case #"hash_f7eba4352eb7f7ba":
            if (namespace_d3d40f75bb4e4c32::function_8b2396647673be50()) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(9);
                }
                return 0;
            }
            if (istrue(var_7c3865dee4abed6)) {
                return 2;
            }
            if (istrue(player namespace_d3d40f75bb4e4c32::function_15da77dc195bd80a())) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(10);
                }
                return 0;
            }
            break;
        case #"hash_1c3e21ffbc842487":
        case #"hash_4f292feb06ad9942":
            if (istrue(var_7c3865dee4abed6)) {
                return 2;
            }
            if (player namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(10);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_3a0285dc5b457e3a":
            if (istrue(var_7c3865dee4abed6)) {
                return 2;
            }
            var_6a8b46e184e181cc = spawnstruct();
            var_6a8b46e184e181cc.scriptablename = "brloot_offhand_advancedsupplydrop";
            var_6a8b46e184e181cc.count = 1;
            var_dc297349765e2088 = namespace_cb965d2f71fefddc::cantakepickup(var_6a8b46e184e181cc, 1);
            if (var_dc297349765e2088 != 1) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(7);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_b41ab83f39326993":
            if (isdefined(level.br_circle)) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(17);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_532a5678aa4979f3":
            if (isdefined(level.br_circle) || istrue(level.brgametype.circlerunning)) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(9);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_83584572ba67a745":
            if (!player function_334bee7871c3ae0f()) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(21);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_546ee28ea1d0dc10":
            if (!player function_ff0081ca56b5a384("armor")) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(20);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_99e995f94c6d662b":
            if (!player function_a037837dc6c85636()) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(19);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_63edc28701e80b73":
            if (!player function_ff0081ca56b5a384("trophy")) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(20);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_8db3828479a5780b":
            if (!player function_ff0081ca56b5a384("uav")) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(20);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_7cf102dbc7cbbbc5":
            if (!player function_ff0081ca56b5a384("barrel")) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(20);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_63d4978a15e681a8":
            if (!player namespace_ea497db8cab34561::function_81124b7b16101f8b()) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(23);
                }
                return 0;
            }
            break;
        case #"hash_5cdbaa0bf3e5ebfe":
        case #"hash_75ca97f27fab119c":
        case #"hash_8709a7ef11ecdbea":
        case #"hash_ac45395faab66eb2":
        case #"hash_ac453a5faab67045":
        case #"hash_a500f53d3e52d6e":
            if (istrue(var_7c3865dee4abed6)) {
                return 1;
            }
            var_6a8b46e184e181cc = spawnstruct();
            var_6a8b46e184e181cc.scriptablename = itemdata.var_2ce272546e3ae7f0;
            var_6a8b46e184e181cc.count = 1;
            var_dc297349765e2088 = namespace_cb965d2f71fefddc::cantakepickup(var_6a8b46e184e181cc);
            switch (var_dc297349765e2088) {
            case 1:
            case 20:
                break;
            default:
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(7);
                }
                return var_3bdc75a8b6e7b7cd;
                break;
            }
        case #"hash_a179b8412a3a0354":
        case #"hash_a179bb412a3a080d":
        case #"hash_a2240c78d2ced063":
        case #"hash_6235851dae0eeca8":
        case #"hash_2fc44f64748f8c8e":
        case #"hash_baa7a6f9de5c563d":
        case #"hash_bb639a6ed9e9b88a":
        case #"hash_bbf617dca645120c":
        case #"hash_bbf61adca64516c5":
        case #"hash_2e68cd53eaf9b329":
        case #"hash_2e68ca53eaf9ae70":
        case #"hash_dda8890cb35ca0bf":
        case #"hash_e4154ddbab061c63":
        case #"hash_f6bd03bdc3846abe":
        case #"hash_6c0c806bbf705a0c":
        case #"hash_fd8da3bdddb8e1c2":
        LOC_000009f9:
            objective = undefined;
            if (isdefined(level.var_d23c7c1add9fb181)) {
                objective = player [[ level.var_d23c7c1add9fb181 ]]();
            }
            if (isdefined(objective) && isdefined(level.var_4de8052758f986f3) && [[ level.var_4de8052758f986f3 ]](objective.objectivekey, player.team, itemdata.ref)) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(17);
                }
                return var_3bdc75a8b6e7b7cd;
            }
            break;
        case #"hash_bd3c5bede4f8165f":
        case #"hash_c31089e2e50b5079":
            break;
        case #"hash_9789620b82d8908c":
        case #"hash_f0fd4758cf2900f0":
        case #"hash_f4fe496941705c28":
            break;
        case #"hash_76bc74c0e064def4":
        case #"hash_b1354cc795fd9a39":
            itemname = getsubstr(itemdata.ref, 7);
            if (player namespace_cb965d2f71fefddc::function_e351a4b1c26ec991(itemname)) {
                if (var_a55838d829a2c54b) {
                    player function_c8bd59cde912455f(17);
                }
                return 0;
            }
            break;
        }
    } else if (itemdata.type == "secondary_victory") {
        if (isdefined(level.var_db78248e94853165) && isdefined(level.var_db78248e94853165.var_228bbb92952e5f9f)) {
            response = [[ level.var_db78248e94853165.var_228bbb92952e5f9f ]]();
            if (response == 1 || response == 2) {
                return 1;
            } else {
                player function_c8bd59cde912455f(response);
                return 0;
            }
        } else {
            return 0;
        }
    }
    return 1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8199
// Size: 0x5c
function _killstreakneedslocationselection(killstreakref) {
    switch (killstreakref) {
    case #"hash_8c766d6477287bb6":
    case #"hash_b4ac3581c343a029":
        return 1;
    case #"hash_634b246c3da5c56f":
        return 0;
    default:
        /#
            assertmsg("Unexpected killstreak purchase type: " + killstreakref);
        #/
        return 0;
        break;
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81fc
// Size: 0x2a
function _locationselectioninterrupt() {
    player = self;
    waittill_any_ents(player, "death", level, "game_ended");
    player notify("cancel_location");
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x822d
// Size: 0x1eb
function _handlekillstreakpurchase(itemdata, var_a5ab866673e5e99d, var_1e736a37c3737585, var_db943473454f6ea6) {
    player = self;
    player endon("disconnect");
    activateimmediately = getdvarint(@"hash_e516a6aa0d85b36d", 0);
    if (!activateimmediately) {
        player namespace_cb965d2f71fefddc::forcegivekillstreak(itemdata.ref, var_a5ab866673e5e99d, 1, var_1e736a37c3737585, var_db943473454f6ea6);
        function_a573b91325f9ea32(player, itemdata, "killstreak", "br_killstreak_purchased");
        return;
    }
    if (_killstreakneedslocationselection(itemdata.ref)) {
        var_6eb64f3fea3bbe81 = player.br_kiosk;
        player function_c8bd59cde912455f(16);
        player namespace_f8065cafc523dba5::_freezecontrols(1, undefined, "kiosk");
        player beginlocationselection(0, 0, "circle_marker", 0, 4);
        player childthread _locationselectioninterrupt();
        var_6e586a99fa56a20f = player namespace_bc3bdbac7cebdc14::waittill_confirm_or_cancel("confirm_location", "cancel_location");
        player endlocationselection();
        player namespace_f8065cafc523dba5::_freezecontrols(0, 1, "kiosk");
        if (isdefined(var_6e586a99fa56a20f) && var_6e586a99fa56a20f.string == "confirm_location") {
            var_9083ea775f3b0cd7 = namespace_d20f8ef223912e12::traceselectedmaplocation(var_6e586a99fa56a20f.location);
            player.kstargetlocation = var_9083ea775f3b0cd7["position"];
            var_e4aecb271d56914b = player namespace_cb965d2f71fefddc::forceusekillstreak(itemdata.ref);
            if (istrue(var_e4aecb271d56914b)) {
                function_a573b91325f9ea32(player, itemdata, "killstreak", "br_killstreak_purchased_and_activated");
            }
        } else {
            player thread _runpurchasemenu(var_6eb64f3fea3bbe81);
        }
    } else {
        player namespace_cb965d2f71fefddc::forcegivekillstreak(itemdata.ref, var_a5ab866673e5e99d, 1, var_db943473454f6ea6);
        var_e4aecb271d56914b = player namespace_cb965d2f71fefddc::forceusekillstreak(itemdata.ref);
        if (istrue(var_e4aecb271d56914b)) {
            function_a573b91325f9ea32(player, itemdata, "killstreak", "br_killstreak_purchased_and_activated");
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841f
// Size: 0x155
function function_90b0e9eb26e38443(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    scriptablename = itemdata.ref;
    var_bada25504e8844d7 = spawnstruct();
    var_bada25504e8844d7.scriptablename = scriptablename;
    var_bada25504e8844d7.origin = self.origin;
    var_bada25504e8844d7.count = 1;
    var_bada25504e8844d7.maxcount = level.br_pickups.maxcounts[scriptablename];
    var_bada25504e8844d7.stackable = level.br_pickups.stackable[scriptablename];
    var_c012b762499f4ae2 = namespace_d696adde758cbe79::getDefaultWeaponAmmo(level.br_lootiteminfo[scriptablename].fullweaponobj);
    var_35ead47ed0d7507e = var_c012b762499f4ae2[2];
    var_4f04b15053655ba = var_c012b762499f4ae2[1];
    ammo = var_c012b762499f4ae2[0];
    var_bada25504e8844d7.count = ammo * 3;
    var_bada25504e8844d7.countlefthand = var_4f04b15053655ba;
    var_bada25504e8844d7.var_e97d731bedd44c63 = var_35ead47ed0d7507e;
    namespace_3bcd40a3005712ec::takeweaponpickup(var_bada25504e8844d7, undefined, undefined, undefined, 1);
    function_a573b91325f9ea32(self, itemdata, "weapon");
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857b
// Size: 0x169
function _handlefieldupgradepurchase(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    if (namespace_85d036cb78063c4a::issuperinuse()) {
        var_733d60a5f3a8c170 = undefined;
        foreach (scriptablename, var_5237a188ccda4d7b in level.br_pickups.var_14bd11727c4b6629) {
            if (var_5237a188ccda4d7b == itemdata.ref) {
                var_733d60a5f3a8c170 = scriptablename;
                break;
            }
        }
        if (isdefined(var_733d60a5f3a8c170)) {
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = var_733d60a5f3a8c170;
            var_60227bff1e9478cc.count = 1;
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_733d60a5f3a8c170);
            namespace_aead94004cf4c147::addItemToBackpack(lootid, var_60227bff1e9478cc, undefined, undefined, 1);
            function_a573b91325f9ea32(self, itemdata, "fieldUpgrade", "br_field_upgrade_purchased");
        }
    } else {
        namespace_cb965d2f71fefddc::forcegivesuper(itemdata.ref, var_7dddac09987d559e, 1, var_452130d9d126e506, var_db943473454f6ea6);
        function_a573b91325f9ea32(self, itemdata, "fieldUpgrade", "br_field_upgrade_purchased");
        if ((level.allowsupers || namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) && !istrue(var_452130d9d126e506)) {
            namespace_85d036cb78063c4a::givesuperpoints(namespace_85d036cb78063c4a::getsuperpointsneeded(), undefined, undefined, undefined, 1);
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86eb
// Size: 0x204
function function_b140d6e72b665c8f(itemdata, var_7dddac09987d559e, var_452130d9d126e506, kiosk) {
    player = self;
    var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, itemdata.var_2ce272546e3ae7f0, 1, undefined, 1, var_452130d9d126e506);
    if (!var_59cdcdf44a2fa379) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(kiosk.dropstruct)) {
            var_e1d097c517c3af5b = kiosk namespace_cb965d2f71fefddc::function_4f4d537c794b2bf5();
            kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = kiosk.dropstruct;
        }
        count = 1;
        if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(itemdata.lootid, itemdata.var_2ce272546e3ae7f0)) {
            count = level.br_pickups.counts[itemdata.var_2ce272546e3ae7f0];
        }
        var_285b7129b392cf3d = kiosk namespace_cb965d2f71fefddc::quickdropaddtoexisting(undefined, itemdata.var_2ce272546e3ae7f0, count);
        if (!var_285b7129b392cf3d) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, function_53c4c53197386572(kiosk.var_afc028d00356e443, kiosk.origin), kiosk.angles, player);
            pickupent = namespace_cb965d2f71fefddc::spawnpickup(itemdata.var_2ce272546e3ae7f0, var_cb4fad49263e20c4, count, 1, undefined, 0);
            kiosk namespace_cb965d2f71fefddc::quickdropaddtocache(itemdata.var_2ce272546e3ae7f0, undefined, pickupent, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
        }
        var_59cdcdf44a2fa379 = 1;
    }
    if (var_59cdcdf44a2fa379) {
        function_a573b91325f9ea32(player, itemdata, "equipment", "br_item_purchased");
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        if (isdefined(level.var_8ec1a1ca587a6487)) {
            player [[ level.var_8ec1a1ca587a6487 ]](itemdata.ref);
        }
    }
    namespace_a4b43c1cf86c6fe5::armorykioskused(kiosk, undefined, undefined, self);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f6
// Size: 0x1a0
function function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, scriptablename, count, var_25f0d68ee22434eb, quickdropcache) {
    if (!var_59cdcdf44a2fa379 && var_25f0d68ee22434eb) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(kiosk.dropstruct)) {
            var_e1d097c517c3af5b = kiosk namespace_cb965d2f71fefddc::function_4f4d537c794b2bf5();
            kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = kiosk.dropstruct;
        }
        var_285b7129b392cf3d = 0;
        if (istrue(quickdropcache)) {
            var_285b7129b392cf3d = kiosk namespace_cb965d2f71fefddc::quickdropaddtoexisting(undefined, scriptablename, count);
        }
        if (!var_285b7129b392cf3d) {
            baseorigin = function_53c4c53197386572(kiosk.var_afc028d00356e443, kiosk.origin);
            if (isdefined(kiosk.var_bf8e5f003146af44)) {
                baseorigin = kiosk.var_bf8e5f003146af44.origin + rotatevector(baseorigin, kiosk.var_bf8e5f003146af44.angles);
            }
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, kiosk.angles, player);
            pickupent = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, count, 1, undefined, 0);
            if (istrue(quickdropcache)) {
                kiosk namespace_cb965d2f71fefddc::quickdropaddtocache(scriptablename, undefined, pickupent, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
            }
        }
        return 1;
    }
    /#
        assert(var_59cdcdf44a2fa379);
    #/
    return var_59cdcdf44a2fa379;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9e
// Size: 0xca8
function _handlespecialpurchase(itemdata, var_7dddac09987d559e, var_452130d9d126e506, kiosk, var_682e4b53880a6720, var_db943473454f6ea6) {
    player = self;
    var_25f0d68ee22434eb = var_7dddac09987d559e && var_682e4b53880a6720;
    var_59cdcdf44a2fa379 = 1;
    var_b517df938986556f = 1;
    var_3e048ef43950bbd7 = undefined;
    quantity = 1;
    var_96c7526f4ab04875 = undefined;
    switch (itemdata.ref) {
    case #"hash_25789111b74943b4":
    case #"hash_43f2312fe01322cf":
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_armor_plate", 1, undefined, 1, var_452130d9d126e506);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, "brloot_armor_plate", 1, var_25f0d68ee22434eb, 1);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_armor_plate");
        break;
    case #"hash_2dcde97962801ba9":
        var_2b83f7cf5dd2cf23 = player _findgivearmoramountanddropleftovers(1);
        if (var_2b83f7cf5dd2cf23 <= 0) {
            var_59cdcdf44a2fa379 = 1;
        } else {
            var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_armor_plate", 1, var_2b83f7cf5dd2cf23, 1, var_452130d9d126e506);
        }
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, "brloot_armor_plate", var_2b83f7cf5dd2cf23, var_25f0d68ee22434eb, 1);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_armor_plate");
        quantity = var_2b83f7cf5dd2cf23;
        break;
    case #"hash_4808e1f340e11163":
        var_1680a35fe50dc05e = "brloot_equip_gasmask";
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_1680a35fe50dc05e, 1, undefined, 1, var_452130d9d126e506);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, var_1680a35fe50dc05e, 108, var_25f0d68ee22434eb);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_1680a35fe50dc05e);
        break;
    case #"hash_dcf82d1f65a6b16e":
        var_1680a35fe50dc05e = "brloot_equip_gasmask";
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_1680a35fe50dc05e, 1, undefined, 1, var_452130d9d126e506);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, var_1680a35fe50dc05e, 108, var_25f0d68ee22434eb);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_1680a35fe50dc05e);
        break;
    case #"hash_e67a71b27007444":
        player namespace_3bcd40a3005712ec::br_ammo_player_max_out();
        player _maxoutequipmentammo(player.equipment["primary"]);
        player _maxoutequipmentammo(player.equipment["secondary"]);
        break;
    case #"hash_6613e243265c4795":
    case #"hash_3839e36b1d747574":
        player namespace_cb965d2f71fefddc::addrespawntoken();
        var_b517df938986556f = 0;
        break;
    case #"hash_1c3e21ffbc842487":
        var_5db3e79ef6900447 = "brloot_self_revive";
        if (istrue(var_452130d9d126e506)) {
            var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_5db3e79ef6900447, 1, undefined, 1, var_452130d9d126e506);
            var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, var_5db3e79ef6900447, 1, 0);
        } else if (player namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
            var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_5db3e79ef6900447, 1, undefined, 1, var_452130d9d126e506);
            var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, var_5db3e79ef6900447, 1, var_25f0d68ee22434eb);
        } else {
            player namespace_cb965d2f71fefddc::addselfrevivetoken();
        }
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_5db3e79ef6900447);
        var_b517df938986556f = 0;
        break;
    case #"hash_4f292feb06ad9942":
        var_5db3e79ef6900447 = "brloot_self_revive";
        if (istrue(var_452130d9d126e506)) {
            var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_5db3e79ef6900447, 1, undefined, 1, var_452130d9d126e506);
            var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, var_5db3e79ef6900447, 1, 0);
        } else if (player namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
            var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_5db3e79ef6900447, 1, undefined, 1, var_452130d9d126e506);
            var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, var_5db3e79ef6900447, 1, var_25f0d68ee22434eb);
        } else {
            player namespace_cb965d2f71fefddc::addselfrevivetoken();
        }
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_5db3e79ef6900447);
        var_b517df938986556f = 0;
        break;
    case #"hash_3a0285dc5b457e3a":
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_offhand_advancedsupplydrop", 1, undefined, 1, var_452130d9d126e506);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, "brloot_offhand_advancedsupplydrop", 1, var_25f0d68ee22434eb);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_offhand_advancedsupplydrop");
        break;
    case #"hash_b41ab83f39326993":
        var_59cdcdf44a2fa379 = player playerhandlecirclepickitem();
        break;
    case #"hash_532a5678aa4979f3":
        var_59cdcdf44a2fa379 = player playerhandleredeploy();
        break;
    case #"hash_83584572ba67a745":
        var_59cdcdf44a2fa379 = player _handlevehiclerepair();
        break;
    case #"hash_546ee28ea1d0dc10":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("armor");
        var_b517df938986556f = 0;
        break;
    case #"hash_99e995f94c6d662b":
        var_59cdcdf44a2fa379 = player function_9fc999a4450eacb2("trophy_refill");
        var_b517df938986556f = 0;
        break;
    case #"hash_63edc28701e80b73":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("trophy");
        var_b517df938986556f = 0;
        break;
    case #"hash_8db3828479a5780b":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("uav");
        var_b517df938986556f = 0;
        break;
    case #"hash_7cf102dbc7cbbbc5":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("barrel");
        var_b517df938986556f = 0;
        break;
    case #"hash_3b012bc05e7f47ab":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("turret");
        var_b517df938986556f = 0;
        break;
    case #"hash_7bdbc30d7514e1da":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("smoke");
        var_b517df938986556f = 0;
        break;
    case #"hash_cde24a9cca75ace7":
        var_59cdcdf44a2fa379 = player function_388aa30e37abbb0("engine");
        var_b517df938986556f = 0;
        break;
    case #"hash_63d4978a15e681a8":
        var_59cdcdf44a2fa379 = player function_202bf25cc40d87b4(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
        var_b517df938986556f = 0;
        break;
    case #"hash_d63b8f48fb92540d":
    case #"hash_9396a18356201b4a":
        var_59cdcdf44a2fa379 = player _handlevehiclepurchase(itemdata, var_7dddac09987d559e);
        if (var_59cdcdf44a2fa379) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_vehicle_purchased");
        } else {
            player namespace_44abc05161e2e2cb::showerrormessage("MP/VEHICLE_PURCHASE_FAILED");
        }
        break;
    case #"hash_631c673653b33de8":
        if (isdefined(level.var_db78248e94853165)) {
            var_b517df938986556f = 0;
            var_59cdcdf44a2fa379 = 1;
            if (isdefined(level.var_db78248e94853165.var_a61cc9ac7bba33f8)) {
                player [[ level.var_db78248e94853165.var_a61cc9ac7bba33f8 ]](itemdata.cost);
            }
        }
        break;
    case #"hash_488cf778b792ae68":
        var_59cdcdf44a2fa379 = player namespace_25b25d188ef778c4::function_7ff5e35e992df372();
        if (var_59cdcdf44a2fa379) {
            players = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
            foreach (teammate in players) {
                teammate setclientomnvar("ui_owns_personal_exfil", 1);
                teammate.var_5a4d470f2093fff1 = 1;
            }
            player thread namespace_d696adde758cbe79::showDMZSplash("dmz_exfil_purchased", players);
        } else {
            player namespace_44abc05161e2e2cb::showerrormessage("DMZ/EXFIL_PURCHASED_FAILED");
        }
        break;
    case #"hash_1b71e2c3430cd301":
    case #"hash_2d1a1b811aed6b26":
    case #"hash_d01e387e6d238502":
        count = namespace_9c6cddd872ad75f7::function_894adf8ce12d224d(itemdata.ref);
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, itemdata.var_2ce272546e3ae7f0, 1, count, 1, var_452130d9d126e506);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, itemdata.var_2ce272546e3ae7f0, count, var_25f0d68ee22434eb);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(itemdata.var_2ce272546e3ae7f0);
        break;
    case #"hash_a500f53d3e52d6e":
    case #"hash_f6715e451a157da4":
    case #"hash_2018bfed562022d2":
    case #"hash_20325b59c2da2936":
    case #"hash_2bc7ffbdef75ed18":
    case #"hash_3d84e9db23ad073b":
    case #"hash_5af11de11fded396":
    case #"hash_5cdbaa0bf3e5ebfe":
    case #"hash_6dad43a1ac2837c4":
    case #"hash_75ca97f27fab119c":
    case #"hash_7831706d83a17090":
    case #"hash_8709a7ef11ecdbea":
    case #"hash_88c36c9296658e86":
    case #"hash_95671226354aabf5":
    case #"hash_ac45395faab66eb2":
    case #"hash_ac453a5faab67045":
    case #"hash_aedd3497c0500b02":
    case #"hash_b96c2612a81aa097":
    case #"hash_dcdeb92788aa1513":
    case #"hash_e005f0e4596a34f3":
    case #"hash_e6923f1a8d2fa559":
    case #"hash_ed2b8ec873f222c8":
    case #"hash_ee0eccfbafbb6d43":
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, itemdata.var_2ce272546e3ae7f0, 1, undefined, 1, var_452130d9d126e506);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, player, itemdata.var_2ce272546e3ae7f0, 1, var_25f0d68ee22434eb);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(itemdata.var_2ce272546e3ae7f0);
        break;
    case #"hash_9789620b82d8908c":
    case #"hash_baa7a6f9de5c563d":
    case #"hash_bb639a6ed9e9b88a":
    case #"hash_bbf617dca645120c":
    case #"hash_bbf61adca64516c5":
    case #"hash_2fc44f64748f8c8e":
    case #"hash_2e68cd53eaf9b329":
    case #"hash_a179b8412a3a0354":
    case #"hash_2e68ca53eaf9ae70":
    case #"hash_dda8890cb35ca0bf":
    case #"hash_a179bb412a3a080d":
    case #"hash_e4154ddbab061c63":
    case #"hash_a2240c78d2ced063":
    case #"hash_6235851dae0eeca8":
    case #"hash_f0fd4758cf2900f0":
    case #"hash_f4fe496941705c28":
    case #"hash_6c0c806bbf705a0c":
    case #"hash_f6bd03bdc3846abe":
    case #"hash_fd8da3bdddb8e1c2":
        var_59cdcdf44a2fa379 = isdefined(level.var_3ce1055115edcbbb) && [[ level.var_3ce1055115edcbbb ]](player, itemdata.ref);
        break;
    case #"hash_bd3c5bede4f8165f":
        var_59cdcdf44a2fa379 = isdefined(level.var_efbc646224fda4fa);
        player thread [[ level.var_efbc646224fda4fa ]]();
        break;
    case #"hash_c31089e2e50b5079":
        var_59cdcdf44a2fa379 = 1;
        player thread namespace_44abc05161e2e2cb::showkillstreaksplash("sentry_gun");
        player namespace_58a74e7d54b56e8d::awardkillstreak("sentry_gun", "other", undefined, undefined, undefined, 0);
        break;
    case #"hash_a7a7446a3194cb49":
        var_59cdcdf44a2fa379 = namespace_f8d3520d3483c1::function_92fec40b905c5112();
        break;
    case #"hash_b0eb18371d980895":
        var_59cdcdf44a2fa379 = 1;
        player.supportcranked = 1;
        player thread [[ level.var_68a1353068460d1 ]]();
        break;
    case #"hash_76e7f1333202ca0":
        player.var_89bd3a34ac165f4f = 1;
        player namespace_5a1ea9d54418bd42::function_37f6a694b8c6656a();
        break;
    case #"hash_499bd626715353e3":
    case #"hash_4ce6dd1c9ebdc3ec":
        player namespace_cb965d2f71fefddc::function_7cb3c8630787467e(itemdata.ref);
        break;
    case #"hash_197fd1ba9278b715":
    case #"hash_f2a746c0bddd2c8c":
        weapon_name = getsubstr(itemdata.var_2ce272546e3ae7f0, 14) + "_mp";
        weapon = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(weapon_name);
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        object = namespace_1b7e64f50cca9321::lootspawnitem(weapon, dropstruct, kiosk.origin, kiosk.angles, 0, 0);
        break;
    default:
        var_a701c338dc9f8375 = 0;
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("kioskHandleSpecialPurchase")) {
            var_c012b362499f4216 = player namespace_71073fa38f11492::function_d72af9ccedfc923b("kioskHandleSpecialPurchase", itemdata, var_7dddac09987d559e, var_452130d9d126e506, kiosk, var_59cdcdf44a2fa379, var_b517df938986556f, quantity);
            quantity = var_c012b362499f4216[3];
            var_b517df938986556f = var_c012b362499f4216[2];
            var_59cdcdf44a2fa379 = var_c012b362499f4216[1];
            var_a701c338dc9f8375 = var_c012b362499f4216[0];
        }
        if (!var_a701c338dc9f8375) {
            /#
                assertmsg("Unsupported kiosk item: " + itemdata.ref);
            #/
        }
        break;
    }
    if (var_59cdcdf44a2fa379) {
        splash = undefined;
        if (var_b517df938986556f) {
            splash = "br_item_purchased";
        }
        function_a573b91325f9ea32(player, itemdata, "special", splash, quantity);
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        if (isdefined(level.var_8ec1a1ca587a6487)) {
            player [[ level.var_8ec1a1ca587a6487 ]](itemdata.ref);
        }
        namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x974d
// Size: 0x1a1
function function_202bf25cc40d87b4(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    var_c0f80cca9c0f5767 = spawnstruct();
    var_59cdcdf44a2fa379 = 0;
    namespace_ea497db8cab34561::function_60d5992f51286201();
    if (namespace_ea497db8cab34561::function_59566a4ce3c2c3e2()) {
        /#
            assertex(isdefined(level.br_pickups.var_14bd11727c4b6629["brloot_offhand_advancedvehicledrop"]), "Tried to use the Vehicle Drop Marker but it is not found in loot. Assure that brloot_offhand_advancedvehicledrop is found in the scriptable loot table.");
        #/
        var_c0f80cca9c0f5767.ref = level.br_pickups.var_14bd11727c4b6629["brloot_offhand_advancedvehicledrop"];
        if (namespace_85d036cb78063c4a::issuperinuse()) {
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = "brloot_offhand_advancedvehicledrop";
            var_60227bff1e9478cc.count = 1;
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_offhand_advancedvehicledrop");
            namespace_aead94004cf4c147::addItemToBackpack(lootid, var_60227bff1e9478cc, undefined, undefined, 1);
        } else {
            namespace_cb965d2f71fefddc::forcegivesuper(var_c0f80cca9c0f5767.ref, var_7dddac09987d559e, 1, var_452130d9d126e506, var_db943473454f6ea6);
            if ((level.allowsupers || namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) && !istrue(var_452130d9d126e506)) {
                namespace_85d036cb78063c4a::givesuperpoints(namespace_85d036cb78063c4a::getsuperpointsneeded(), undefined, undefined, undefined, 1);
            }
        }
        var_59cdcdf44a2fa379 = 1;
    } else {
        var_c0f80cca9c0f5767.ref = "veh9_mil_lnd_mrap";
        var_59cdcdf44a2fa379 = _handlevehiclepurchase(var_c0f80cca9c0f5767, var_7dddac09987d559e, 1);
        if (var_59cdcdf44a2fa379) {
            thread namespace_d696adde758cbe79::showDMZSplash("truckwar_vehicle_deploying", level.teamdata[self.team]["players"]);
        } else {
            thread namespace_44abc05161e2e2cb::showerrormessage("MP/VEHICLE_PURCHASE_FAILED");
        }
    }
    return var_59cdcdf44a2fa379;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f6
// Size: 0x2af
function _handlevehiclepurchase(itemdata, var_7dddac09987d559e, var_5c529b214774f72d) {
    /#
        assertex(isdefined(self.br_kiosk), "cannot purchase a vehicle when not at a kiosk.");
    #/
    var_26d956b5a9e59a2e = (1, 1, 1);
    var_10a5a10c444aefbb = (1, 0, 0);
    var_42b28c7586481d92 = (0, 1, 0);
    var_1efdce79e6a210ae = (0, 1, 1);
    var_c710d54ec720de16 = 3;
    var_69acf5e6cf081bc9 = 8;
    if (!namespace_dace9d390bc4a290::vehicle_spawn_canspawnvehicle(itemdata.ref, undefined, undefined, "KIOSK")) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::isinvehicle(1)) {
        return 0;
    }
    var_fd132985b358036 = namespace_9db09f982acd35b4::player_standing_on_train();
    spawndata = spawnstruct();
    if (isdefined(self.br_kiosk.var_db32abf0a18cadf6)) {
        spawndata.origin = self.br_kiosk.var_db32abf0a18cadf6.origin;
        spawndata.angles = self.br_kiosk.var_db32abf0a18cadf6.angles;
    }
    if (!isdefined(spawndata.origin)) {
        if (var_fd132985b358036) {
            spawndata.origin = self.br_kiosk.origin + anglestoforward(self.br_kiosk.angles) * -150 + (0, 0, 60);
        } else {
            spawndata.origin = self.br_kiosk.origin + anglestoforward(self.br_kiosk.angles) * 100 + (0, 0, 60);
        }
    }
    if (!isdefined(spawndata.angles)) {
        spawndata.angles = (0, self.br_kiosk.angles[1] + 90, 0);
    }
    if (istrue(var_5c529b214774f72d)) {
        spawndata.var_427538f5a2ad4f8b = 1;
        spawndata.var_ec76ffdbe2f37c5b = 1;
        spawndata.var_65da0a245b653cc = 1;
        spawndata.var_d04816fe2f5bcee6 = 1;
    }
    if (!namespace_dace9d390bc4a290::vehicle_spawn_checkspawnclearance(spawndata.origin, itemdata.ref)) {
        return 0;
    }
    thread function_3f45b3c575ec001b(itemdata, spawndata, var_5c529b214774f72d);
    return 1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bad
// Size: 0x145
function function_3f45b3c575ec001b(itemdata, spawndata, var_5c529b214774f72d) {
    level endon("game_ended");
    spawndata.spawntype = "KIOSK";
    if (namespace_801fa17f47560d76::function_ccdcf48542c8a5b7(itemdata.ref)) {
        vehicle = namespace_801fa17f47560d76::function_66c684fea143fbfd(itemdata.ref, spawndata);
    } else {
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn(itemdata.ref, spawndata);
    }
    if (istrue(var_5c529b214774f72d)) {
        namespace_ea497db8cab34561::function_20b77fbf1af1a5d(vehicle, self.team, 1);
        thread namespace_ea497db8cab34561::function_c1bfb96a5e39a0a7(vehicle);
        thread namespace_ea497db8cab34561::function_2d381b790dc27f9f(vehicle);
        vehicle setscriptablepartstate("tag_buystation", "buystation_usable");
        namespace_ea497db8cab34561::function_d5d633c35998ebe7(self.team);
        thread namespace_d696adde758cbe79::showDMZSplash("truckwar_vehicle_spawn_enabled", level.teamdata[self.team]["alivePlayers"]);
    }
    if (!isdefined(vehicle)) {
        return;
    }
    namespace_dace9d390bc4a290::vehicle_spawn_preventrespawn(vehicle);
    if (isdefined(self)) {
        var_d0ae85b60ec1f5f7 = namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(21, (0, 0, 100), vehicle getentitynumber());
        vehicle thread namespace_ede58c1e66c2c280::function_9a7200f5142066ba(self, var_d0ae85b60ec1f5f7, [0:"death"], [0:"vehicle_owner_update"]);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf9
// Size: 0x4a
function function_334bee7871c3ae0f() {
    player = self;
    vehicle = player.var_c77002478cdfd85f;
    if (isdefined(vehicle)) {
        if (vehicle.health == vehicle.maxhealth) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d4b
// Size: 0x6d
function function_a037837dc6c85636() {
    player = self;
    vehicle = player.var_c77002478cdfd85f;
    if (isdefined(vehicle)) {
        if (isdefined(vehicle.var_fa8480818f379e09) && isdefined(vehicle.var_c1cc7f4fbebfb815) && vehicle.var_fa8480818f379e09 == vehicle.var_c1cc7f4fbebfb815) {
            return 0;
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dc0
// Size: 0x47
function function_ff0081ca56b5a384(var_5473a133b9d77893) {
    player = self;
    vehicle = player.var_c77002478cdfd85f;
    if (isdefined(vehicle)) {
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, var_5473a133b9d77893)) {
            return 0;
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e0f
// Size: 0x193
function _handlevehiclerepair(itemdata, var_7dddac09987d559e) {
    player = self;
    vehicle = player.var_c77002478cdfd85f;
    if (isdefined(vehicle)) {
        if (vehicle.health == vehicle.maxhealth) {
            return 0;
        }
        var_6d294b74de0d301e = getdvarfloat(@"hash_3c1b0adf9da014a0", 0.25);
        var_e4f8ad64a6e67d4b = int(vehicle.maxhealth * var_6d294b74de0d301e);
        vehicle namespace_5a0f3ca265d3a4c8::function_653b96ce8310763e(var_e4f8ad64a6e67d4b);
        playsoundatpos(vehicle.origin + (0, 0, 20), "veh_truckwars_repair");
        namespace_ea497db8cab34561::function_35f2ff0427594776(vehicle);
        if (istrue(vehicle.var_4f3e23ee48660f12)) {
            namespace_ea497db8cab34561::function_e9b1e17b0d0ba3(vehicle);
        }
        players = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
        foreach (player in players) {
            if (getdvarint(@"hash_38d15e2d7ddbf066", 1) == 1) {
                player hudicontype("truckheal");
            }
            player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_pockets", vehicle.health);
            player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_banked", vehicle.maxhealth);
        }
        return 1;
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9faa
// Size: 0x41
function function_9fc999a4450eacb2(var_5473a133b9d77893) {
    player = self;
    vehicle = player.var_c77002478cdfd85f;
    if (isdefined(vehicle)) {
        namespace_141c4634b6ea7b27::function_c4b9d8e33849435e(vehicle, var_5473a133b9d77893, player);
        return 1;
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ff3
// Size: 0x51
function function_388aa30e37abbb0(var_5473a133b9d77893) {
    player = self;
    vehicle = player.var_c77002478cdfd85f;
    if (isdefined(vehicle)) {
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, var_5473a133b9d77893)) {
            return 0;
        } else {
            namespace_141c4634b6ea7b27::function_c4b9d8e33849435e(vehicle, var_5473a133b9d77893, player);
            return 1;
        }
    }
    return 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04c
// Size: 0x53
function function_365e64606d4f3da8(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    namespace_58a74e7d54b56e8d::awardkillstreak(itemdata.ref, "other");
    thread namespace_44abc05161e2e2cb::showsplash("br_killstreak_purchased");
    namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0a7
// Size: 0x90
function function_6c02b611541421d2(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades(itemdata.ref);
    namespace_85d036cb78063c4a::givesuper(itemdata.ref, 1);
    thread namespace_44abc05161e2e2cb::showsplash("br_field_upgrade_purchased");
    if ((level.allowsupers || namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) && !istrue(var_452130d9d126e506)) {
        namespace_85d036cb78063c4a::givesuperpoints(namespace_85d036cb78063c4a::getsuperpointsneeded(), undefined, undefined, undefined, 1);
    }
    namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa13e
// Size: 0x90
function function_f1d968fd69ab759a(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades(itemdata.ref);
    namespace_85d036cb78063c4a::givesuper(itemdata.ref, 1);
    thread namespace_44abc05161e2e2cb::showsplash("br_field_upgrade_purchased");
    if ((level.allowsupers || namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) && !istrue(var_452130d9d126e506)) {
        namespace_85d036cb78063c4a::givesuperpoints(namespace_85d036cb78063c4a::getsuperpointsneeded(), undefined, undefined, undefined, 1);
    }
    namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d5
// Size: 0x61
function function_157316f7321dd26b(itemdata, var_a5ab866673e5e99d, var_1e736a37c3737585, var_db943473454f6ea6) {
    self endon("disconnect");
    namespace_82dcd1d5ae30ff7::giveperk(itemdata.ref);
    function_a573b91325f9ea32(self, itemdata, "perk", itemdata.ref);
    namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa23e
// Size: 0xb0
function function_9c38fec481b62d3b(itemdata, var_a5ab866673e5e99d, var_1e736a37c3737585, kiosk, var_db943473454f6ea6) {
    self endon("disconnect");
    if (level.var_f38c74334d6ff472 && namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        var_59cdcdf44a2fa379 = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(self, itemdata.var_2ce272546e3ae7f0, 1, undefined, 1, var_1e736a37c3737585);
        var_59cdcdf44a2fa379 = function_bddeda747a14d679(var_59cdcdf44a2fa379, kiosk, self, itemdata.var_2ce272546e3ae7f0, 1, var_1e736a37c3737585);
        itemdata.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(itemdata.var_2ce272546e3ae7f0);
        function_a573b91325f9ea32(self, itemdata, "perkpackage");
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2f5
// Size: 0x72
function function_bc5f62f877be030f(func, itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6) {
    level endon("game_ended");
    function_a573b91325f9ea32(self, itemdata, itemdata.type);
    if (!isalive(self)) {
        namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
    }
    while (!isalive(self)) {
        waitframe();
    }
    self thread [[ func ]](itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa36e
// Size: 0x17e
function function_65c0e46d953f9657(player, loadoutindex, var_7dddac09987d559e) {
    defaultLoadout = namespace_e5ed2f5a5ee8410e::isloadoutindexdefault(loadoutindex);
    var_a3db00e9f0a90d88 = undefined;
    if (istrue(defaultLoadout)) {
        var_a3db00e9f0a90d88 = function_601181692f53e4ed("loadout_default");
    } else {
        var_a3db00e9f0a90d88 = function_601181692f53e4ed("loadout_custom");
    }
    /#
        assert(isdefined(var_a3db00e9f0a90d88));
    #/
    var_2502897ae7bfd1e = getdvarint(@"hash_b7252f55210dd7e9", 0);
    if (var_2502897ae7bfd1e != 0) {
        var_a3db00e9f0a90d88.cost = var_2502897ae7bfd1e;
    }
    var_3e487e0c00e4a4c = _getactualcost(player, var_a3db00e9f0a90d88);
    if (player.plundercount < var_3e487e0c00e4a4c) {
        player function_c8bd59cde912455f(3);
        return;
    }
    var_2d36749fdffc49b4 = namespace_e5ed2f5a5ee8410e::getclasschoice(loadoutindex);
    namespace_a011fbf6d93f25e5::branalytics_inventory_snapshot(self, "purchasing_new_loadout");
    var_4047cb430f29ada4 = getdvarint(@"hash_6d746a5b4acee20d", 1);
    player.pers["class"] = var_2d36749fdffc49b4;
    player.class = var_2d36749fdffc49b4;
    var_d5601f78a39895ff = player namespace_d19129e4fa5d176::preloadandqueueclass(var_2d36749fdffc49b4);
    namespace_d20f8ef223912e12::br_giveselectedclass(player, var_7dddac09987d559e, var_4047cb430f29ada4);
    function_a573b91325f9ea32(player, var_a3db00e9f0a90d88, "loadout", "br_loadout_purchased");
    if (istrue(defaultLoadout)) {
        namespace_a011fbf6d93f25e5::branalytics_kiosk_purchaseitem(self, var_3e487e0c00e4a4c, "defaultLoadout", "loadout_" + loadoutindex);
    } else {
        namespace_a011fbf6d93f25e5::branalytics_kiosk_purchaseloadout(self, var_3e487e0c00e4a4c, var_d5601f78a39895ff);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4f3
// Size: 0xc1
function function_9353e641ab9b0884(weaponref, var_31553e68a5164e3e) {
    itemdata = spawnstruct();
    itemdata.ref = "loadout_primary";
    itemdata.var_2ce272546e3ae7f0 = "loadoutPrimary";
    itemdata.type = "loadout";
    itemdata.cost = function_3cc8b2630d4f56e7(weaponref, var_31553e68a5164e3e);
    firesalediscount = level.br_armory_kiosk.weapons.var_e02581d50b48c3f9["firesale_weapon_discount"];
    if (isdefined(firesalediscount)) {
        itemdata.firesalediscount = int(firesalediscount);
    } else {
        itemdata.firesalediscount = 0;
    }
    return itemdata;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5bc
// Size: 0x75
function function_601181692f53e4ed(var_cb325ddb4a764623) {
    foreach (item in level.br_armory_kiosk.items) {
        if (item.ref == var_cb325ddb4a764623) {
            return item;
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa638
// Size: 0xc0f
function onarmorykioskpurchase(channel, var_1657e74c9190d2a2) {
    player = self;
    kiosk = player.br_kiosk;
    if (!istrue(player.armorykioskpurchaseallowed) && !istrue(level.var_d804888d9484ff69) && !istrue(level.var_c5dc0e983c929728)) {
        return;
    }
    if (channel == "exit_loadout_bag") {
        var_1657e74c9190d2a2 = 0;
    }
    var_6c457c5f341beb23 = "channel: " + channel;
    if (isdefined(var_1657e74c9190d2a2)) {
        var_6c457c5f341beb23 = var_6c457c5f341beb23 + ", index: " + var_1657e74c9190d2a2;
    }
    var_97aa008efeedd23c = "standard_kiosk";
    if (isdefined(kiosk) && isdefined(kiosk.type) && kiosk.type == "drone_deployable_kiosk") {
        var_97aa008efeedd23c = "deployable_kiosk";
    }
    namespace_a011fbf6d93f25e5::branalytics_kiosk_menu_event(player, "menu_purchase", var_6c457c5f341beb23, var_97aa008efeedd23c);
    var_7dddac09987d559e = getdvarint(@"hash_d6a60f25ef560a17", 1);
    var_452130d9d126e506 = getdvarint(@"hash_8e3b1991482f0d41", 0);
    var_295d6f5d7716affa = getdvarint(@"hash_ce452a7faefd9e7d", 1);
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        var_452130d9d126e506 = 1;
    }
    if (channel == "br_cancel_purchase" || channel == "exit_loadout_bag") {
        _purchasemenuclosedbyclient(player);
    } else if (channel == "br_item_purchase") {
        itemindex = var_1657e74c9190d2a2;
        /#
            assert(isdefined(level.br_armory_kiosk.items[itemindex]));
        #/
        itemdata = level.br_armory_kiosk.items[itemindex];
        result = player _validateitempurchase(kiosk, itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_295d6f5d7716affa);
        var_4d1be4fb3c1a5c4e = result == 1 || result == 2;
        if (var_4d1be4fb3c1a5c4e) {
            function_469cfcbc4a5185c1(kiosk, itemdata.var_2ce272546e3ae7f0);
            var_6b3c6b40c0598d85 = function_b88d64cd67bbe60f(kiosk);
            if (isdefined(var_6b3c6b40c0598d85)) {
                foreach (usingplayer in kiosk.playersusing) {
                    if (isdefined(usingplayer)) {
                        usingplayer setclientomnvar("ui_buystation_limited_item_amount", var_6b3c6b40c0598d85);
                    }
                }
            }
            var_db943473454f6ea6 = undefined;
            var_25978461c6e4f61b = namespace_38b993c4618e76cd::function_b88cfb4893ceedac(itemdata.ref);
            if (!isdefined(var_25978461c6e4f61b) || namespace_aead94004cf4c147::function_7e103028c464ab9a(var_25978461c6e4f61b)) {
                var_db943473454f6ea6 = namespace_aead94004cf4c147::getAvailableDMZBackpackIndex();
            }
            if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a() && itemdata.type == "killstreak") {
                player thread function_bc5f62f877be030f(&function_365e64606d4f3da8, itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
            } else if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a() && itemdata.type == "fieldupgrade" || itemdata.type == "super") {
                player thread function_bc5f62f877be030f(&function_6c02b611541421d2, itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
            } else if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a() && itemdata.type == "perk") {
                player thread function_bc5f62f877be030f(&function_157316f7321dd26b, itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
            } else if (itemdata.type == "killstreak") {
                player thread _handlekillstreakpurchase(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
            } else if (itemdata.type == "fieldupgrade" || itemdata.type == "super") {
                player _handlefieldupgradepurchase(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
            } else if (itemdata.type == "weapon") {
                player function_90b0e9eb26e38443(itemdata, var_7dddac09987d559e, var_452130d9d126e506, var_db943473454f6ea6);
            } else if (itemdata.type == "perk") {
                player function_157316f7321dd26b(itemdata, var_7dddac09987d559e, var_452130d9d126e506);
            } else if (itemdata.type == "equipment") {
                player function_b140d6e72b665c8f(itemdata, var_7dddac09987d559e, var_452130d9d126e506, kiosk);
            } else if (itemdata.type == "special" || itemdata.type == "persistent" || itemdata.type == "secondary_victory") {
                player _handlespecialpurchase(itemdata, var_7dddac09987d559e, var_452130d9d126e506, kiosk, var_295d6f5d7716affa, var_db943473454f6ea6);
            } else if (itemdata.type == "perkpackage") {
                player function_9c38fec481b62d3b(itemdata, var_7dddac09987d559e, var_452130d9d126e506, kiosk, var_db943473454f6ea6);
            }
        }
    } else if (channel == "br_loadout_purchase") {
        loadoutindex = var_1657e74c9190d2a2;
        if (getdvarint(@"hash_e10d9168500bd034", 0) == 0) {
            var_3718b699e7cf7578 = namespace_e5ed2f5a5ee8410e::getclasschoice(loadoutindex);
            classstruct = namespace_d19129e4fa5d176::loadout_getorbuildclassstruct(var_3718b699e7cf7578);
            /#
                assert(isdefined(classstruct));
            #/
            if (!isdefined(classstruct.loadoutprimary) || !isdefined(classstruct.loadoutprimaryattachments) || !isdefined(classstruct.loadoutprimaryobject) || !isdefined(classstruct.loadoutprimaryfullname)) {
                player function_c8bd59cde912455f(2);
                return;
            }
            var_7afe454b9be1b7e8 = function_9353e641ab9b0884(classstruct.loadoutprimary, classstruct.loadoutprimaryattachments);
            /#
                assert(isdefined(var_7afe454b9be1b7e8));
            #/
            var_3e487e0c00e4a4c = _getactualcost(player, var_7afe454b9be1b7e8);
            if (player.plundercount < var_3e487e0c00e4a4c) {
                player function_c8bd59cde912455f(3);
                return;
            }
            if (getdvarint(@"hash_4a50d6714d2a1d0c") <= 0) {
                function_2d04108c0a0ed7a5(player, classstruct.loadoutprimaryobject);
            }
            if (namespace_3bcd40a3005712ec::br_forcegivecustomweapon(player, classstruct.loadoutprimaryobject, classstruct.loadoutprimaryfullname, classstruct.loadoutprimary)) {
                function_a573b91325f9ea32(player, var_7afe454b9be1b7e8, var_7afe454b9be1b7e8.type);
                namespace_a011fbf6d93f25e5::function_6039c3ffa983858f(player, var_3e487e0c00e4a4c, classstruct.loadoutprimary, classstruct.loadoutprimaryattachments);
            }
        } else {
            function_65c0e46d953f9657(player, loadoutindex, var_7dddac09987d559e);
        }
    } else if (channel == "class_select") {
        loadoutindex = var_1657e74c9190d2a2;
        function_65c0e46d953f9657(player, loadoutindex, var_7dddac09987d559e);
    } else if (channel == "br_team_revive") {
        var_bf5d82befbb59efe = var_1657e74c9190d2a2 - 1;
        var_69fac551dcf6c2fb = function_601181692f53e4ed("teamrevive");
        var_a120356b021f8e8 = _getactualcost(player, var_69fac551dcf6c2fb);
        var_eb276d34779513e3 = level.var_77e4add813fca6ae && !namespace_71073fa38f11492::isfeaturedisabled("useTokenToReviveTeammate");
        var_4dfc1f5d7602b10d = istrue(player.hasrespawntoken) && var_eb276d34779513e3 && player.plundercount < var_a120356b021f8e8;
        if (!var_4dfc1f5d7602b10d && player.plundercount < var_a120356b021f8e8) {
            player function_c8bd59cde912455f(3);
            return 0;
        }
        if (getdvarint(@"hash_ece0c71aa9d5c939", 0)) {
            logstring("[ WHY_NO_BUYBACK TEST] buyback from - " + player.name + " for squadmateSquadIndex = " + var_bf5d82befbb59efe);
        }
        var_c7869d69dbcf7fd3 = undefined;
        squad = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
        foreach (var_8f7040e569ec9e98 in squad) {
            if (!isdefined(var_8f7040e569ec9e98) || var_8f7040e569ec9e98 == player) {
                continue;
            }
            if (isdefined(var_8f7040e569ec9e98.var_3f78c6a0862f9e25) && var_8f7040e569ec9e98.var_3f78c6a0862f9e25 == var_bf5d82befbb59efe) {
                if (getdvarint(@"hash_ece0c71aa9d5c939", 0)) {
                    logstring("[ WHY_NO_BUYBACK TEST] buyback player - " + var_8f7040e569ec9e98.name + ", sessionuimemberindex = " + var_8f7040e569ec9e98.var_3f78c6a0862f9e25);
                }
                var_c7869d69dbcf7fd3 = var_8f7040e569ec9e98;
                break;
            }
        }
        if (!isdefined(var_c7869d69dbcf7fd3)) {
            player function_c8bd59cde912455f(12);
            return;
        }
        if (!var_c7869d69dbcf7fd3 namespace_d3d40f75bb4e4c32::iseligibleforteamrevive() && !getdvarint(@"hash_4d250e4873e1753e", 0)) {
            if (namespace_d3d40f75bb4e4c32::isrespawningfromtoken(var_c7869d69dbcf7fd3)) {
                player function_c8bd59cde912455f(14);
            } else if (namespace_7e17181d03156026::isreallyalive(var_c7869d69dbcf7fd3)) {
                player function_c8bd59cde912455f(15);
            } else {
                player function_c8bd59cde912455f(13);
            }
            return;
        }
        player namespace_3c5a4254f2b957ea::incpersstat("kioskRevives", 1);
        var_c7869d69dbcf7fd3 namespace_3c5a4254f2b957ea::incpersstat("revivedFromKiosk", 1);
        var_a4c6cda2e74187f2 = 0;
        if (!var_4dfc1f5d7602b10d) {
            cost = level.br_armory_kiosk.teamrevivecost;
            firesalediscount = level.br_armory_kiosk.teamrevivefiresalediscount;
            function_a573b91325f9ea32(player, var_69fac551dcf6c2fb, "teamrevive");
            if (istrue(player.hasrespawntoken)) {
                var_a4c6cda2e74187f2 = 1;
            } else {
                player namespace_cb965d2f71fefddc::addrespawntoken(1);
            }
        } else {
            var_3a93448a74526680 = spawnstruct();
            var_3a93448a74526680.cost = 0;
            var_3a93448a74526680.firesalediscount = 0;
            function_a573b91325f9ea32(player, var_3a93448a74526680, "teamrevive");
        }
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("kioskRevivePlayer")) {
            var_c7869d69dbcf7fd3 thread namespace_71073fa38f11492::runbrgametypefunc("kioskRevivePlayer", player, var_4dfc1f5d7602b10d);
        } else {
            var_c7869d69dbcf7fd3 thread namespace_47fd1e79a44628cd::playergulagautowin("kioskRevivePlayer", player, var_4dfc1f5d7602b10d, 1);
        }
        if (var_a4c6cda2e74187f2) {
            player namespace_cb965d2f71fefddc::addrespawntoken(1);
        }
        var_bdf786be066c860b = getdvar(@"hash_58d8dfa7b8338078", "");
        if (var_bdf786be066c860b != "") {
            level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(kiosk.origin, var_bdf786be066c860b);
        } else {
            level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(kiosk.origin, "revive");
        }
        player thread namespace_44abc05161e2e2cb::showsplash("br_squadmate_revived");
    } else if (channel == "insure_slot") {
        if (!getdvarint(@"hash_ebf8a842c7dd2d82", 0)) {
            return;
        }
        if (!isdefined(player.var_6317f2446d7f722)) {
            player.var_6317f2446d7f722 = [0:0, 1:0, 2:0];
        }
        if (istrue(player.var_6317f2446d7f722[var_1657e74c9190d2a2])) {
            return;
        }
        var_cb325ddb4a764623 = function_fbea988da0967dbc(var_1657e74c9190d2a2);
        itemdata = spawnstruct();
        itemdata.lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_cb325ddb4a764623);
        itemdata.cost = int(namespace_38b993c4618e76cd::function_afa71c22d9dcfdc5(itemdata.lootid));
        itemdata.ref = var_cb325ddb4a764623;
        itemdata.var_8f0cc1f91f9b12ed = 1;
        if (!isdefined(player.plundercount) || player.plundercount < itemdata.cost) {
            return;
        }
        function_a573b91325f9ea32(player, itemdata, "buy_station_insured_slot");
        player.var_6317f2446d7f722[var_1657e74c9190d2a2] = 1;
    } else if (channel == "br_biometric_scan_keycard_exchange") {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("biometricScan", "handleKeycardExchange")) {
            itemdata = [[ namespace_3c37cb17ade254d::getsharedfunc("biometricScan", "handleKeycardExchange") ]](player, kiosk, var_1657e74c9190d2a2, var_452130d9d126e506);
        }
        if (isdefined(itemdata) && itemdata.var_4fb45d7e5c02df57) {
            function_a573b91325f9ea32(player, itemdata, itemdata.type, "br_item_purchased", 1);
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb24e
// Size: 0x22c
function function_2d04108c0a0ed7a5(player, var_8ddcee7f743ee3a8) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    dropstruct.weaponpickups = [];
    dropstruct.equipprimarypickup = undefined;
    dropstruct.var_dfba5a2c3c6f0a07 = int(4);
    if (getdvarint(@"hash_ac8187887a7808aa", 0)) {
        dropstruct.var_dfba5a2c3c6f0a07 = dropstruct.var_dfba5a2c3c6f0a07 + 9;
    }
    foreach (weapon in player.equippedweapons) {
        basename = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon.basename);
        if (isweapon(weapon) && weapon.inventorytype == "primary" && issameweapon(weapon, var_8ddcee7f743ee3a8)) {
            if (namespace_cb965d2f71fefddc::shoulddropbrprimary(weapon, player)) {
                var_ec7ded352736c3b1 = player namespace_20c746953ff716b9::extract_ismissionweapon(weapon);
                if (!var_ec7ded352736c3b1) {
                    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    pickupent = namespace_3bcd40a3005712ec::weaponspawn(weapon, player, var_cb4fad49263e20c4, 0, 1);
                    if (isdefined(pickupent)) {
                        var_5413c446d646561a = player getweaponammoclip(weapon);
                        var_5f1e64f3e8613c52 = player getweaponammoclip(weapon, "left");
                        var_daa197e6c4b920ee = 0;
                        if (weapon.hasalternate) {
                            var_b6ff735c3690cc44 = weapon getaltweapon();
                            if (namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(var_b6ff735c3690cc44) != namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weapon)) {
                                var_daa197e6c4b920ee = player getweaponammoclip(var_b6ff735c3690cc44);
                            }
                        }
                        namespace_cb965d2f71fefddc::loot_setitemcount(pickupent, var_5413c446d646561a, var_5f1e64f3e8613c52, var_daa197e6c4b920ee);
                        dropstruct.weaponpickups[dropstruct.weaponpickups.size] = pickupent;
                    }
                }
            }
            player namespace_df5cfdbe6e2d3812::_takeweapon(weapon);
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb481
// Size: 0x20a
function _makekioskpurchase(itemdata) {
    player = self;
    var_d47b7f992ca8a91e = iskioskfiresaleactiveforplayer(player.br_kiosk, player);
    cost = itemdata.cost;
    if (!istrue(itemdata.var_8f0cc1f91f9b12ed)) {
        cost = _getactualcost(player, itemdata);
    }
    /#
        assert(player.plundercount >= cost);
    #/
    if (var_d47b7f992ca8a91e && itemdata.firesalediscount > 0) {
        kioskfiresaledoneforplayer(player.br_kiosk, player);
    }
    if (!(namespace_71073fa38f11492::isfeaturedisabled("kioskXP") || namespace_d3d40f75bb4e4c32::isanytutorialorbotpracticematch())) {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"br_kioskBuy", undefined, namespace_d20f8ef223912e12::calculatepurchasexp(cost, itemdata.type));
    }
    if (cost > 0) {
        player namespace_c6ccccd95254983f::playerplunderkioskpurchase(cost);
    }
    if (!isdefined(level.br_plunder)) {
        level.br_plunder = spawnstruct();
    }
    if (!isdefined(level.br_plunder.kiosk_spent_total)) {
        level.br_plunder.kiosk_spent_total = 0;
    }
    level.br_plunder.kiosk_spent_total = level.br_plunder.kiosk_spent_total + cost;
    if (!isdefined(level.br_plunder.kiosk_num_purchases)) {
        level.br_plunder.kiosk_num_purchases = 0;
    }
    level.br_plunder.kiosk_num_purchases++;
    response = 1;
    if (itemdata.type == "secondary_victory") {
        response = 2;
    }
    if (itemdata.type != "biometric_scan_keycard") {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("biometricScan", "updateFreeItemCount")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("biometricScan", "updateFreeItemCount") ]](player, -1);
        }
    }
    player function_c8bd59cde912455f(response);
    return cost;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb693
// Size: 0x1b2
function function_a573b91325f9ea32(player, itemdata, var_7e1bfbe3f25f5583, var_f7b6cc6c062a7a43, quantity) {
    var_1cb2654b9d2b112a = player _makekioskpurchase(itemdata);
    if (!isdefined(quantity)) {
        quantity = 1;
    }
    lootid = itemdata.lootid;
    if (!isdefined(lootid) || lootid == 0) {
        lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(itemdata.ref);
        if (!isdefined(lootid) || lootid == 0) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(itemdata.ref);
            if (!isdefined(lootid)) {
                lootid = 0;
            }
        }
    }
    if (isdefined(lootid) && lootid > 0) {
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
        namespace_aad14af462a74d08::function_d24138b32084fc3e(player, lootid, undefined, method, quantity);
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        namespace_8361bad7391de074::function_7184abfe5941a710(player, var_1cb2654b9d2b112a);
    }
    level notify("buy_station_cash_spent_" + player.team, player);
    if (isdefined(player.br_kiosk) && istrue(player.br_kiosk.var_8b199355950fb72)) {
        namespace_8361bad7391de074::function_c2b3319eb135740(player);
    }
    player namespace_aad14af462a74d08::onkioskpurchaseitem(var_7e1bfbe3f25f5583, itemdata.ref, lootid, quantity, var_1cb2654b9d2b112a);
    if (isdefined(player.br_kiosk) && istrue(player.br_kiosk.var_ac9aff06fcbd2b98)) {
        namespace_8361bad7391de074::function_4f23417a848e2f5f(player);
    }
    if (isdefined(var_7e1bfbe3f25f5583)) {
        namespace_a011fbf6d93f25e5::branalytics_kiosk_purchaseitem(player, var_1cb2654b9d2b112a, var_7e1bfbe3f25f5583, itemdata.ref);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb84c
// Size: 0x3f
function playerlocationselectinterrupt() {
    player = self;
    level endon("game_ended");
    self endon("disconnect");
    player endon("confirm_location");
    waittill_any_ents(player, "death", level, "game_ended");
    player notify("cancel_location");
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb892
// Size: 0x123
function playerhandlecirclepickitem() {
    self setclientomnvar("ui_buystation_purchase_response", 1);
    self setclientomnvar("ui_buystation_open", 1);
    self setclientomnvar("ui_show_tac_map", 1);
    namespace_f8065cafc523dba5::_freezecontrols(1, undefined, "playerHandleCirclePickItem");
    self beginlocationselection(0, 0, "circle_marker", 0, 4);
    thread playerlocationselectinterrupt();
    var_6e586a99fa56a20f = namespace_bc3bdbac7cebdc14::waittill_confirm_or_cancel("confirm_location", "cancel_location");
    success = 0;
    self endlocationselection();
    if (isdefined(var_6e586a99fa56a20f) && var_6e586a99fa56a20f.string == "confirm_location") {
        if (namespace_c5622898120e827f::isvalidpointinbounds(var_6e586a99fa56a20f.location, 1)) {
            var_9083ea775f3b0cd7 = namespace_d20f8ef223912e12::traceselectedmaplocation(var_6e586a99fa56a20f.location);
            var_1230ea36a300368 = var_9083ea775f3b0cd7["position"];
            if (namespace_c5622898120e827f::isvalidpointinbounds(var_1230ea36a300368, 1)) {
                thread restartcircleelimination(var_1230ea36a300368);
                success = 1;
            } else {
                function_c8bd59cde912455f(18);
            }
        }
    }
    namespace_f8065cafc523dba5::_freezecontrols(0, 1, "playerHandleCirclePickItem");
    self setclientomnvar("ui_show_tac_map", 0);
    return success;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9bd
// Size: 0x2a9
function restartcircleelimination(origin) {
    level endon("game_ended");
    level notify("restartCircleElimination");
    var_7c409a7d87b3c6b6 = 60;
    var_5e344cd3618ee701 = 4;
    var_55a74749a759fc2d = -1;
    var_4d700b38444fab26 = 15;
    var_8f6402ad8e91da6a = getdvarint(@"hash_5ef97113d77c0835", var_7c409a7d87b3c6b6);
    var_836a83c2bca261 = getdvarint(@"hash_341f671cd388b556", var_5e344cd3618ee701);
    var_26189638809f7b88 = getdvarint(@"hash_b925987adb7fbd3e", var_55a74749a759fc2d);
    var_937dd942e0664f1a = getdvarint(@"hash_3c88a1d746d97236", var_4d700b38444fab26);
    /#
        if (level.script == "<unknown string>") {
            if (var_8f6402ad8e91da6a == var_7c409a7d87b3c6b6) {
                var_8f6402ad8e91da6a = 25;
            }
            if (var_836a83c2bca261 == var_5e344cd3618ee701) {
                var_836a83c2bca261 = 2;
            }
        }
    #/
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("restartCircleElimination")) {
        thread namespace_71073fa38f11492::runbrgametypefunc("restartCircleElimination", origin, var_8f6402ad8e91da6a);
    }
    foreach (player in level.players) {
        player namespace_44abc05161e2e2cb::showsplash("br_late_circle_soon");
    }
    if (namespace_71073fa38f11492::isfeaturedisabled("circle")) {
        namespace_c5622898120e827f::initcirclepoststarttocircleindex(origin, var_8f6402ad8e91da6a, var_836a83c2bca261, var_26189638809f7b88);
        level.brgametype.disabledfeatures["circle"] = undefined;
    }
    if (namespace_71073fa38f11492::isfeatureenabled("allowLateJoiners")) {
        level.allowlatecomers = 0;
        setnojiptime(1, 1);
        setnojipscore(1, 1);
    }
    var_efcf5eb682ef5688 = max(0, var_8f6402ad8e91da6a - var_937dd942e0664f1a);
    wait(var_efcf5eb682ef5688);
    foreach (player in level.players) {
        player namespace_44abc05161e2e2cb::showsplash("br_late_circle_now");
    }
    var_ad75dbc17e0faf18 = var_8f6402ad8e91da6a - var_efcf5eb682ef5688;
    wait(var_ad75dbc17e0faf18);
    if (namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
        level thread namespace_a9c534dc7832aba4::spectate_init();
        level.brgametype.disabledfeatures["teamSpectate"] = undefined;
    }
    if (namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        level.disablespawning = 1;
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", namespace_cd0b2d039510b38d::getgametype(), "_numLives"), 1);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc6d
// Size: 0x12a
function playerhandleredeploy() {
    self setclientomnvar("ui_buystation_purchase_response", 1);
    self setclientomnvar("ui_buystation_open", 1);
    self setclientomnvar("ui_show_tac_map", 1);
    namespace_f8065cafc523dba5::_freezecontrols(1, undefined, "playerHandleRedeploy");
    self beginlocationselection(0, 0, "circle_marker", 0, 4);
    thread playerlocationselectinterrupt();
    var_6e586a99fa56a20f = namespace_bc3bdbac7cebdc14::waittill_confirm_or_cancel("confirm_location", "cancel_location");
    success = 0;
    self endlocationselection();
    if (isdefined(var_6e586a99fa56a20f) && var_6e586a99fa56a20f.string == "confirm_location") {
        if (namespace_c5622898120e827f::isvalidpointinbounds(var_6e586a99fa56a20f.location, 1)) {
            var_9083ea775f3b0cd7 = namespace_d20f8ef223912e12::traceselectedmaplocation(var_6e586a99fa56a20f.location);
            var_1230ea36a300368 = var_9083ea775f3b0cd7["position"];
            if (namespace_c5622898120e827f::isvalidpointinbounds(var_1230ea36a300368, 1)) {
                self notify("_watchToAutoCloseMenu_end");
                playerredeploy(var_1230ea36a300368);
                success = 1;
            } else {
                function_c8bd59cde912455f(18);
            }
        }
    }
    namespace_f8065cafc523dba5::_freezecontrols(0, 1, "playerHandleRedeploy");
    self setclientomnvar("ui_show_tac_map", 0);
    return success;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd9f
// Size: 0x2d9
function playerredeploy(groundorigin, var_f9a785628f97eec6, var_27a5b29aaefc2fb4) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    var_4630a5df954561f2 = 12000;
    height = var_f9a785628f97eec6;
    if (!isdefined(height)) {
        height = var_4630a5df954561f2;
    }
    yaw = var_27a5b29aaefc2fb4;
    if (!isdefined(yaw)) {
        yaw = 0;
    }
    spawnpoint = spawnstruct();
    spawnpoint.origin = groundorigin + (0, 0, height);
    spawnpoint.angles = (0, yaw, 0);
    spawnpoint.height = height;
    var_11f3b4465c8b637b = player namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
    player.forcespawnorigin = var_11f3b4465c8b637b;
    var_b59f471c2c064e56 = 1;
    player namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
    wait(var_b59f471c2c064e56);
    spawnorigin = spawnpoint.origin;
    spawnangles = spawnpoint.angles;
    startorigin = spawnorigin;
    if (isdefined(var_11f3b4465c8b637b)) {
        startorigin = var_11f3b4465c8b637b;
    }
    player namespace_8bfdb6eb5a3df67a::function_961b4afc4c695b94();
    player namespace_8bfdb6eb5a3df67a::function_ab31cf673d70f72d(startorigin, spawnangles);
    linker = spawn("script_model", startorigin);
    linker setmodel("tag_origin");
    linker.angles = spawnangles;
    linker hide();
    linker showtoplayer(player);
    player playerlinktoabsolute(linker, "tag_origin");
    player function_a593971d75d82113();
    player function_379bb555405c16bb("br_armory_kiosk::playerRedeploy()");
    player thread namespace_8bfdb6eb5a3df67a::playercleanupentondisconnect(linker);
    waitframe();
    player namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    player namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
    if (isdefined(var_11f3b4465c8b637b)) {
        linker.origin = spawnorigin;
    }
    linker playsoundtoplayer("br_ac130_flyby", player);
    wait(1.5);
    if (!player islinked()) {
        player namespace_8bfdb6eb5a3df67a::function_ab31cf673d70f72d(spawnorigin, spawnangles);
        /#
            namespace_9c840bb9f2ecbf00::demoforcesre("<unknown string>" + player.name + "<unknown string>");
        #/
    }
    player unlink();
    player namespace_4887422e77f3514e::function_a2b4e6088394bade();
    player clearclienttriggeraudiozone(1);
    player function_6fb380927695ee76();
    player function_985b0973f29da4f8("br_armory_kiosk::playerRedeploy()");
    falltime = 0;
    if (isdefined(level.parachutedeploydelay)) {
        falltime = level.parachutedeploydelay;
    }
    player.isredeploykeepweapons = 1;
    player thread namespace_5078ee98abb32db9::startfreefall(falltime, 0, undefined, undefined, 1);
    player setclientomnvar("ui_br_transition_type", 0);
    player setclientomnvar("ui_show_spectateHud", -1);
    player namespace_8bfdb6eb5a3df67a::resetplayermovespeedscale();
    wait(0.5);
    player namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    waitframe();
    linker delete();
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc07f
// Size: 0xa0
function function_8301ce82f0ae1be6() {
    if (istrue(level.br_circle_disabled)) {
        return level.br_armory_kiosk.scriptables.size;
    }
    var_35c1e70b1d29218 = 0;
    foreach (kiosk in level.br_armory_kiosk.scriptables) {
        if (namespace_c5622898120e827f::ispointincurrentsafecircle(kiosk.origin)) {
            var_35c1e70b1d29218++;
        }
    }
    return var_35c1e70b1d29218;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc127
// Size: 0xc0
function function_a4078546548cb0a() {
    if (istrue(level.br_armory_kiosk_enabled)) {
        foreach (station in level.br_armory_kiosk.scriptables) {
            currentstate = station getscriptablepartstate("br_plunder_box");
            if (currentstate != "disabled" && currentstate != "hidden") {
                if (!string_starts_with(currentstate, "firesale_")) {
                    newstate = "firesale_" + currentstate;
                    station setscriptablepartstate("br_plunder_box", newstate);
                }
            }
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1ee
// Size: 0xd3
function function_4fecf02c9241f7f0() {
    if (istrue(level.br_armory_kiosk_enabled)) {
        foreach (station in level.br_armory_kiosk.scriptables) {
            currentstate = station getscriptablepartstate("br_plunder_box");
            if (string_starts_with(currentstate, "firesale_")) {
                var_5558f4a2139c46e = strtok(currentstate, "_");
                if (!isdefined(var_5558f4a2139c46e) || var_5558f4a2139c46e.size < 2) {
                    continue;
                }
                newstate = var_5558f4a2139c46e[var_5558f4a2139c46e.size - 1];
                station setscriptablepartstate("br_plunder_box", newstate);
            }
        }
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2c8
// Size: 0x8b
function function_665291fdc0b65758() {
    foreach (kiosk in getentitylessscriptablearray("scriptable_br_plunder_box", "classname")) {
        kiosk.var_afc028d00356e443 = kiosk.origin + rotatevector((12, 0, 0), kiosk.angles);
    }
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc35a
// Size: 0x62
function function_fbea988da0967dbc(index) {
    switch (index) {
    case 0:
        return "buy_station_insured_slot_1";
    case 1:
        return "buy_station_insured_slot_2";
    case 2:
        return "buy_station_insured_slot_3";
    default:
        return "buy_station_insured_slot_1";
        break;
    }
    return "buy_station_insured_slot_1";
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3c4
// Size: 0x1a
function function_233a7adc7a673be(kiosk) {
    kiosk.locked = 1;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3e5
// Size: 0x19
function function_3b1235b668cb5c71(kiosk) {
    kiosk.locked = 0;
}

// Namespace br_armory_kiosk/namespace_a4b43c1cf86c6fe5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc405
// Size: 0x125
function function_eaca292314678f38(var_4f95d97a13077392, var_f3bff22d504c243a, var_171f90b9c4c76d44) {
    var_20d8602c22f884fa = [];
    foreach (var_8b0dfd11a808587b in var_f3bff22d504c243a) {
        if (isdefined(var_8b0dfd11a808587b.blackmarket) && istrue(int(var_8b0dfd11a808587b.blackmarket))) {
            namespace_a4b43c1cf86c6fe5::function_2fcaa447c4e7d4a0(var_8b0dfd11a808587b, var_4f95d97a13077392);
            var_4f95d97a13077392++;
        } else {
            var_20d8602c22f884fa[var_20d8602c22f884fa.size] = var_8b0dfd11a808587b;
        }
    }
    if (var_20d8602c22f884fa.size == 0) {
        return var_4f95d97a13077392;
    }
    var_fc617751f654a141 = randomintrange(level.poi[var_171f90b9c4c76d44]["minExtraBuyStations"], level.poi[var_171f90b9c4c76d44]["maxExtraBuyStations"] + 1);
    var_20d8602c22f884fa = array_randomize(var_20d8602c22f884fa);
    for (i = 0; i < var_fc617751f654a141; i++) {
        if (!isdefined(var_20d8602c22f884fa[i])) {
            continue;
        }
        namespace_a4b43c1cf86c6fe5::function_2fcaa447c4e7d4a0(var_20d8602c22f884fa[i], var_4f95d97a13077392);
        var_4f95d97a13077392++;
    }
    return var_4f95d97a13077392;
}

